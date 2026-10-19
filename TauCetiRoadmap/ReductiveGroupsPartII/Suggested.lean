import Mathlib
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Smooth.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.UpperTriangular.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Basic
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.Algebra.AlgebraicGroup.Tangent.Representation
import TauCeti.Algebra.AlgebraicGroup.Derived.Basic
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.NumberTheory.LocalField.NormalizedValuation
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

/-!
# Reductive algebraic groups, Part II: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the pinned Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer.

Design choices.
* An affine group scheme over a commutative ring `k` is a commutative Hopf `k`-algebra `H`; its
  `R`-points are the Tau Ceti convolution group `WithConv (H →ₐ[k] R)`.
* `ModelField K`: a field with a nontrivial discrete valuative relation of rank one whose ring of
  integers `𝒪[K]` is henselian with perfect residue field `𝓀[K]`. A nonarchimedean local field
  (Mathlib's `IsNonarchimedeanLocalField`) is one.
* The point topology on `X(R) = Hom_k(A, R)` is the coarsest topology making every evaluation
  continuous; it is a scoped instance of `PointTopology`.
* Abstract root data, valuations and apartments follow Bruhat–Tits I, §6, over a Mathlib
  `RootPairing ι ℝ M N` (roots in `M = V*`, coroots in `N = V`).
-/

namespace TauCetiRoadmap.ReductiveGroupsPartII


noncomputable section

open _root_.CategoryTheory
open scoped TensorProduct

universe u v w

/-! ## Conventions: the valued fields -/

/-- The context of Bruhat–Tits II, 5.1.1, pp. 145–146: `K` is henselian for a nontrivial discrete
valuation of rank one, so that `𝒪[K]` is a discrete valuation ring, and `𝓀[K]` is perfect. Rank one
is a separate field because `ValuativeRel.IsDiscrete` alone also holds for the lexicographic value
group `ℤ × ℤ`. -/
class ModelField (K : Type u) [Field K] [ValuativeRel K] : Prop where
  discrete : ValuativeRel.IsDiscrete K
  nontrivial : ValuativeRel.IsNontrivial K
  rankLeOne : ValuativeRel.IsRankLeOne K
  henselian : HenselianLocalRing (Valuation.integer (ValuativeRel.valuation K))
  perfectResidue : PerfectField (IsLocalRing.ResidueField (Valuation.integer (ValuativeRel.valuation K)))

attribute [instance] ModelField.discrete ModelField.nontrivial ModelField.rankLeOne
  ModelField.henselian ModelField.perfectResidue

/-- A nonarchimedean local field is a `ModelField`. -/
instance {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : ModelField K := by sorry

-- Test ModelField.padic
example (p : ℕ) [Fact p.Prime] : ModelField ℚ_[p] := inferInstance

open ValuativeRel in
/-- The valuation ring of a henselian discretely valued rank-one model field is a DVR. -/
theorem ModelField.isDiscreteValuationRing {K : Type u} [Field K] [ValuativeRel K] [ModelField K] :
    IsDiscreteValuationRing 𝒪[K] := sorry

-- Test ModelField.trivial_excluded (non-example)
example {K : Type u} [Field K] [ValuativeRel K] (h : ¬ ValuativeRel.IsNontrivial K) :
    ¬ ModelField K := fun hK => h hK.nontrivial

/-! ## Layer RG2.0: topologies on rational points -/

namespace PointTopology

variable (k : Type u) [CommRing k] (A : Type v) [CommRing A] [Algebra k A]
  (R : Type w) [CommRing R] [Algebra k R] [TopologicalSpace R]

/-- The point topology on `X(R) = Hom_k(A, R)`: the coarsest topology for which every evaluation
map `f ↦ f a` (`a : A`) is continuous ([Conrad], Prop. 2.1, p. 2). -/
@[reducible] def topology : TopologicalSpace (A →ₐ[k] R) :=
  ⨅ a : A, TopologicalSpace.induced (fun f : A →ₐ[k] R => f a) ‹TopologicalSpace R›

/-- The point topology, as a scoped instance. -/
scoped instance instTopologicalSpace : TopologicalSpace (A →ₐ[k] R) := topology k A R

/-- The point topology on the convolution-group carrier `WithConv (A →ₐ[k] R)` of points. -/
scoped instance instTopologicalSpaceWithConv : TopologicalSpace (WithConv (A →ₐ[k] R)) :=
  TopologicalSpace.induced WithConv.ofConv (topology k A R)

end PointTopology

namespace PointTopology

open scoped PointTopology

section Affine

variable {k : Type u} [CommRing k] {A : Type v} [CommRing A] [Algebra k A]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R] [IsTopologicalRing R]

/-- The universal property of the point topology. -/
theorem continuous_iff {Y : Type*} [TopologicalSpace Y] (g : Y → (A →ₐ[k] R)) :
    Continuous g ↔ ∀ a : A, Continuous fun y => g y a := sorry

/-- The point topology is the subspace topology of the product topology on `A → R`. -/
theorem isEmbedding_toPi : Topology.IsEmbedding fun f : A →ₐ[k] R => (⇑f : A → R) := sorry

/-- For a finite generating family and `T1` coefficients, evaluation at the generators is a closed
embedding into `R^ι` ([Conrad], Prop. 2.1 and its proof, pp. 2–3). -/
theorem isClosedEmbedding_eval_generators [T1Space R] {ι : Type*} [Finite ι] (a : ι → A)
    (ha : Algebra.adjoin k (Set.range a) = ⊤) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => fun i => f (a i) := sorry

/-- For `R` locally compact Hausdorff and `A` of finite type, `Hom_k(A, R)` is locally compact. -/
theorem locallyCompactSpace_of_finiteType [T2Space R] [LocallyCompactSpace R]
    [Algebra.FiniteType k A] : LocallyCompactSpace (A →ₐ[k] R) := sorry

/-- A coordinate-algebra map induces a continuous map on affine points. -/
theorem continuous_comap {B : Type v} [CommRing B] [Algebra k B] (φ : B →ₐ[k] A) :
    Continuous fun f : A →ₐ[k] R => f.comp φ := sorry

/-- A surjective coordinate map induces a closed embedding on points over a T1 ring. -/
theorem isClosedEmbedding_comap_of_surjective [T1Space R]
    {B : Type v} [CommRing B] [Algebra k B] (φ : B →ₐ[k] A)
    (hφ : Function.Surjective φ) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => f.comp φ := sorry

/-- A continuous coefficient map induces a continuous map on affine points. -/
theorem continuous_map_codomain {R' : Type w} [CommRing R'] [Algebra k R']
    [TopologicalSpace R'] [IsTopologicalRing R'] (ψ : R →ₐ[k] R') (hψ : Continuous ψ) :
    Continuous fun f : A →ₐ[k] R => ψ.comp f := sorry

/-- Points of a tensor product: `Hom_k(A ⊗_k B, R) ≅ Hom_k(A, R) × Hom_k(B, R)`. -/
theorem isHomeomorph_tensorProduct {B : Type*} [CommRing B] [Algebra k B] :
    IsHomeomorph fun f : A ⊗[k] B →ₐ[k] R =>
      (f.comp (Algebra.TensorProduct.includeLeft (S := k)),
        f.comp (Algebra.TensorProduct.includeRight)) := sorry

/-- Localizations give open embeddings when `R^×` is open with continuous inversion
([Conrad], §3 and proof of Prop. 3.1, pp. 3–4). -/
theorem isOpenEmbedding_localization (f : A) (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    Topology.IsOpenEmbedding fun x : Localization.Away f →ₐ[k] R =>
      x.comp (IsScalarTower.toAlgHom k A (Localization.Away f)) := sorry

/-- The point topology of an infinitely generated polynomial algebra over a finite field need not be discrete. -/
theorem not_discrete_infinite : ¬ DiscreteTopology (MvPolynomial ℕ (ZMod 2) →ₐ[ZMod 2] ZMod 2) := sorry

end Affine

section Group

variable {k : Type u} [CommRing k] {H : Type v} [CommRing H] [HopfAlgebra k H]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R]

/-- The convolution group of points over a topological ring is a topological group. -/
theorem isTopologicalGroup [IsTopologicalRing R] : IsTopologicalGroup (WithConv (H →ₐ[k] R)) :=
  sorry

/-- For `GL_n`, Tau Ceti's `TauCeti.GeneralLinear.pointsMulEquiv` is a homeomorphism from the
points with the point topology onto `GL_n(R)` with the units topology of `M_n(R)`. -/
def generalLinearPointsHomeomorph [IsTopologicalRing R] (n : ℕ) :
    WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra k n →ₐ[k] R) ≃ₜ
      Matrix.GeneralLinearGroup (Fin n) R where
  toEquiv := (TauCeti.GeneralLinear.pointsMulEquiv (R := k) n (A := R)).toEquiv
  continuous_toFun := sorry
  continuous_invFun := sorry

end Group

section LocalInstances

variable {E : Type u} [Field E] [TopologicalSpace E] {H : Type v} [CommRing H] [HopfAlgebra E H]

/-- Points of an affine group over a nonarchimedean local field form a Hausdorff space. -/
instance instT2SpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    T2Space (WithConv (H →ₐ[E] E)) := sorry

instance instLocallyCompactSpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E]
    [Algebra.FiniteType E H] : LocallyCompactSpace (WithConv (H →ₐ[E] E)) := sorry

instance instSecondCountableTopologyLocal [ValuativeRel E] [IsNonarchimedeanLocalField E]
    [Algebra.FiniteType E H] : SecondCountableTopology (WithConv (H →ₐ[E] E)) := sorry

/-- Points over a nonarchimedean local field form a totally disconnected space. -/
instance instTotallyDisconnectedSpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    TotallyDisconnectedSpace (WithConv (H →ₐ[E] E)) := sorry

instance instIsTopologicalGroupLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    IsTopologicalGroup (WithConv (H →ₐ[E] E)) :=
  isTopologicalGroup

end LocalInstances

section Integral

open ValuativeRel

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Integral points of a finite-type `𝒪[E]`-algebra are open inside rational points. -/
theorem isOpenEmbedding_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] :
    Topology.IsOpenEmbedding fun f : A →ₐ[𝒪[E]] 𝒪[E] =>
      (Algebra.ofId 𝒪[E] E).comp f := sorry

/-- Integral points of a finite-type `𝒪[E]`-algebra form a compact space. -/
theorem compactSpace_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] : CompactSpace (A →ₐ[𝒪[E]] 𝒪[E]) := sorry

end Integral

end PointTopology

namespace CongruenceSubgroup

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  (H : Type u) [CommRing H] [HopfAlgebra 𝒪[E] H]

/-- The `n`-th congruence subgroup: the kernel of reduction `𝒢(𝒪) → 𝒢(𝒪/𝓂^n)`. -/
def subgroup (n : ℕ) : Subgroup (WithConv (H →ₐ[𝒪[E]] 𝒪[E])) :=
  (TauCeti.AlgHom.mapValue (H := H) (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n))).ker

instance normal (n : ℕ) : (subgroup E H n).Normal := MonoidHom.normal_ker _

open scoped PointTopology in
/-- The congruence subgroups of a finite-type model form a neighbourhood basis of the identity. -/
theorem hasBasis_nhds_one [Algebra.FiniteType 𝒪[E] H] :
    (nhds (1 : WithConv (H →ₐ[𝒪[E]] 𝒪[E]))).HasBasis (fun _ : ℕ => True)
      fun n => (subgroup E H n : Set (WithConv (H →ₐ[𝒪[E]] 𝒪[E]))) := sorry

open scoped PointTopology in
/-- The first congruence subgroup of a finite-type model is pro-`p`, `p = char 𝓀[E]`. -/
theorem isProP_one [Algebra.FiniteType 𝒪[E] H] :
    TauCeti.IsProP (ringChar 𝓀[E]) (subgroup E H 1) := sorry

/-- For a smooth model and `n ≥ 1`, the consecutive congruence quotient has `q^d` elements, `d` the
rank of the cotangent space `ker ε / (ker ε)²` at the identity. -/
theorem natCard_quotient_succ [Algebra.Smooth 𝒪[E] H] (n : ℕ) (hn : 1 ≤ n) :
    Nat.card ((subgroup E H n) ⧸ (subgroup E H (n + 1)).subgroupOf (subgroup E H n)) =
      Nat.card 𝓀[E] ^
        Module.finrank 𝒪[E] (RingHom.ker (Bialgebra.counitAlgHom 𝒪[E] H : H →+* 𝒪[E])).Cotangent :=
  sorry

open scoped PointTopology in
/-- The full integral group of GL₂ is not pro-p; positive congruence level is necessary. -/
theorem not_isProP_zero_generalLinear : ¬ TauCeti.IsProP (ringChar 𝓀[E])
    (subgroup E (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] 2) 0) := sorry

/-- Congruence subgroups separate integral points: their intersection is the identity subgroup. -/
theorem iInf_eq_bot : (⨅ n : ℕ, subgroup E H n) = ⊥ := by sorry

end CongruenceSubgroup

/-! ## Layer RG2.0a: Weil restriction and norm tori -/

namespace WeilRestriction

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  (A' : Type u) [CommRing A'] [Algebra k' A']

/-- The functor of points of the Weil restriction: `R ↦ Hom_{k'}(A', k' ⊗_k R)`. -/
def functor : CommAlgCat.{u} k ⥤ Type u where
  obj R := A' →ₐ[k'] k' ⊗[k] R
  map {R S} f := TypeCat.ofHom fun g => (Algebra.TensorProduct.map (AlgHom.id k' k') f.hom).comp g
  map_id _ := by
    ext g a
    simp
  map_comp _ _ := by
    ext g a
    simp [Algebra.TensorProduct.map_id_comp]

/-- For `k → k'` finite locally free, the Weil restriction of every affine `k'`-scheme is an affine
`k`-scheme: its functor of points is corepresentable (Bruhat–Tits II, 1.5.1–1.5.7, pp. 26–29). -/
theorem functor_isCorepresentable [Module.Finite k k'] [Module.Projective k k'] :
    (functor k k' A').IsCorepresentable := sorry

/-- Finite-type affine schemes have finite-type Weil restrictions along finite locally free maps. -/
theorem finiteType_res [Module.Finite k k'] [Module.Projective k k']
    [Algebra.FiniteType k' A'] (B : CommAlgCat.{u} k)
    (e : (functor k k' A').CorepresentableBy B) : Algebra.FiniteType k B := sorry

/-- Finite presentation is preserved by affine Weil restriction along finite locally free maps. -/
theorem finitePresentation_res [Module.Finite k k'] [Module.Projective k k']
    [Algebra.FinitePresentation k' A'] (B : CommAlgCat.{u} k)
    (e : (functor k k' A').CorepresentableBy B) : Algebra.FinitePresentation k B := sorry

/-- The square-zero lifting property passes to the representing algebra of affine Weil restriction. -/
theorem formallySmooth_res [Module.Finite k k'] [Module.Projective k k']
    [Algebra.FormallySmooth k' A'] (B : CommAlgCat.{u} k)
    (e : (functor k k' A').CorepresentableBy B) : Algebra.FormallySmooth k B := sorry

/-- Smoothness passes to the representing algebra of affine Weil restriction. -/
theorem smooth_res [Module.Finite k k'] [Module.Projective k k']
    [Algebra.Smooth k' A'] (B : CommAlgCat.{u} k)
    (e : (functor k k' A').CorepresentableBy B) : Algebra.Smooth k B := sorry

/-- Affine Weil restriction takes closed immersions to closed immersions, expressed by
surjectivity of the induced map between representing coordinate algebras. -/
theorem map_surjective [Module.Finite k k'] [Module.Projective k k']
    (B' : Type u) [CommRing B'] [Algebra k' B'] (f : B' →ₐ[k'] A')
    (hf : Function.Surjective f) (A B : CommAlgCat.{u} k)
    (eA : (functor k k' A').CorepresentableBy A)
    (eB : (functor k k' B').CorepresentableBy B) (r : B ⟶ A)
    (hr : ∀ (R : CommAlgCat.{u} k) (g : A ⟶ R),
      eB.homEquiv (r ≫ g) = (eA.homEquiv g).comp f) :
    Function.Surjective r.hom := sorry

-- Test WeilRestriction.functor_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (B : Type u) [CommRing B] [Algebra k B] :
    (functor k k B).obj (CommAlgCat.of k R) ≃ (B →ₐ[k] R) :=
  AlgEquiv.arrowCongr AlgEquiv.refl (Algebra.TensorProduct.lid k R)

-- Test WeilRestriction.functor_empty
/- The restriction of the empty scheme `Spec 0` has no points as soon as `k' ⊗_k R ≠ 0`. -/
example (R : Type u) [CommRing R] [Algebra k R] [Nontrivial (k' ⊗[k] R)] :
    IsEmpty ((functor k k' PUnit.{u + 1}).obj (CommAlgCat.of k R)) := by
  refine ⟨fun (f : PUnit.{u + 1} →ₐ[k'] k' ⊗[k] R) => ?_⟩
  have h1 : f 1 = 1 := map_one f
  have h0 : f 0 = 0 := map_zero f
  rw [show (1 : PUnit.{u + 1}) = 0 from Subsingleton.elim _ _, h0] at h1
  exact zero_ne_one h1

end WeilRestriction

namespace NormTorus

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']

/-- The norm `Res_{k'/k} G_m → G_m` on points: the algebra norm of `R ⊗_k k'` over `R`, on units. -/
def norm (R : Type u) [CommRing R] [Algebra k R] : (k' ⊗[k] R)ˣ →* Rˣ :=
  (Units.map (Algebra.norm R : (R ⊗[k] k') →* R)).comp
    (Units.map (Algebra.TensorProduct.comm k k' R).toMonoidHom)

/-- The kernel subgroup of the norm on units. For finite separable extensions of fields
these are the points of the norm-one torus. -/
def normOne (R : Type u) [CommRing R] [Algebra k R] : Subgroup (k' ⊗[k] R)ˣ := (norm k k' R).ker

/-- On the diagonal `G_m ⊂ Res_{k'/k} G_m` the norm is the `d`-th power, `d = rank_k k'`: the
specialisation of Mathlib's `Algebra.norm_algebraMap` and `Module.finrank_baseChange` to the carrier
`k' ⊗[k] R` through `Algebra.TensorProduct.comm`. -/
theorem norm_comp_diagonal [Module.Finite k k'] [Module.Free k k'] (R : Type u) [CommRing R]
    [Algebra k R] (r : Rˣ) :
    norm k k' R (Units.map (Algebra.TensorProduct.includeRight).toMonoidHom r) =
      r ^ Module.finrank k k' := sorry

/-- A finite-type Hopf algebra representing the norm-one points naturally is a torus. -/
theorem normOne_isTorus (K : Type u) [Field K] (K' : Type u) [Field K'] [Algebra K K']
    [FiniteDimensional K K'] [Algebra.IsSeparable K K']
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (e : ∀ (R : Type u) [CommRing R] [Algebra K R],
      WithConv ((H : Type u) →ₐ[K] R) ≃* normOne K K' R)
    (he : ∀ (R S : Type u) [CommRing R] [Algebra K R] [CommRing S] [Algebra K S]
      (ψ : R →ₐ[K] S) (x : WithConv ((H : Type u) →ₐ[K] R)),
      (e S (WithConv.toConv (ψ.comp x.ofConv)) : (K' ⊗[K] S)ˣ) =
        Units.map (Algebra.TensorProduct.map (AlgHom.id K K') ψ).toMonoidHom
          (e R x : (K' ⊗[K] R)ˣ)) :
    TauCeti.torusCommHopfAlgProperty K H := sorry

/-- Over a separably closed field the norm-one torus splits, of rank `[K' : K] - 1`. -/
theorem characterGroup_normOne (K : Type u) [Field K] (K' : Type u) [Field K'] [Algebra K K']
    [FiniteDimensional K K'] [Algebra.IsSeparable K K'] (Ω : Type u) [Field Ω] [Algebra K Ω]
    [IsSepClosed Ω] :
    Nonempty (normOne K K' Ω ≃* (Fin (Module.finrank K K' - 1) → Ωˣ)) := sorry

end NormTorus

/-! ## Layer RG2.1: root data, valuations and apartments -/

namespace BruhatTits

variable {ι M N : Type u} [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]

/-- Bruhat–Tits I, 6.1.1, p. 107: a root datum of type `Φ` in a group `G` (axioms DR1–DR6), for a
possibly nonreduced root system given as a Mathlib root pairing over `ℝ`. The cosets
`reflectionCoset` are the sets `M_a`; `positiveVector` chooses the positive system used in DR6. -/
structure RootDatum (G : Type v) [Group G] (Φ : RootPairing ι ℝ M N) where
  T : Subgroup G
  U : ι → Subgroup G
  /-- DR1. -/
  U_ne_bot : ∀ i, U i ≠ ⊥
  /-- DR2, for `b ∉ -ℝ₊ a`. -/
  commutator_le : ∀ i j, (∀ c : ℝ, 0 < c → Φ.root j ≠ -c • Φ.root i) →
    ⁅U i, U j⁆ ≤ ⨆ (k : ι) (_ : ∃ p q : ℕ, 0 < p ∧ 0 < q ∧
      Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j), U k
  /-- DR3. -/
  le_of_root_eq_two_smul : ∀ i j, Φ.root j = (2 : ℝ) • Φ.root i → U j ≤ U i
  ne_of_root_eq_two_smul : ∀ i j, Φ.root j = (2 : ℝ) • Φ.root i → U j ≠ U i
  reflectionCoset : ι → Set G
  /-- DR4: a right coset of `T`, and the rank-one Bruhat containment. -/
  reflectionCoset_eq : ∀ i, ∃ m : G, reflectionCoset i = {g | ∃ t ∈ T, g = t * m}
  bruhat : ∀ i j, Φ.root j = -Φ.root i → ∀ u ∈ U j, u ≠ 1 →
    ∃ a ∈ U i, ∃ m ∈ reflectionCoset i, ∃ b ∈ U i, u = a * m * b
  /-- DR5. -/
  reflection_conjugates : ∀ i j m, m ∈ reflectionCoset i →
    (U j).map (MulAut.conj m).toMonoidHom = U (Φ.reflectionPerm i j)
  positiveVector : N
  positiveVector_regular : ∀ i, Φ.toLinearMap (Φ.root i) positiveVector ≠ 0
  /-- DR6: `T U⁺ ∩ U⁻ = {1}`. -/
  bruhat_separation : ∀ t ∈ T,
    ∀ u ∈ (⨆ (i : ι) (_ : 0 < Φ.toLinearMap (Φ.root i) positiveVector), U i),
      t * u ∈ (⨆ (i : ι) (_ : Φ.toLinearMap (Φ.root i) positiveVector < 0), U i) →
        t * u = 1

namespace RootDatum

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}

/-- The group `N` generated by `T` and the cosets `M_a` (Bruhat–Tits I 6.1.2 (10), p. 109). -/
def weylNormalizer (D : RootDatum G Φ) : Subgroup G :=
  Subgroup.closure ((D.T : Set G) ∪ ⋃ i, D.reflectionCoset i)

instance T_normal_weylNormalizer (D : RootDatum G Φ) :
    (D.T.subgroupOf D.weylNormalizer).Normal := sorry

/-- `N/T ≃ W(Φ)` for a finite root system, through the action of `N` on the root subgroups,
`n U_a n⁻¹ = U_{ν(n) a}` (Bruhat–Tits I 6.1.2 (10), p. 109, and 6.1.11 (ii), p. 115). -/
theorem exists_weylGroupEquiv [Finite ι] (D : RootDatum G Φ) :
    ∃ e : D.weylNormalizer ⧸ D.T.subgroupOf D.weylNormalizer ≃* Φ.weylGroup,
      ∀ (n : D.weylNormalizer) (i : ι), (D.U i).map (MulAut.conj (n : G)).toMonoidHom =
        D.U (((e (QuotientGroup.mk n) : Φ.weylGroup) : RootPairing.Aut Φ).indexEquiv i) := sorry

/-- A root datum is generating if `T` and the root subgroups generate `G`. -/
def IsGenerating (D : RootDatum G Φ) : Prop :=
  Subgroup.closure ((D.T : Set G) ∪ ⋃ i, (D.U i : Set G)) = ⊤

-- Test BruhatTits.RootDatum.isGenerating_rankZero
example [IsEmpty ι] (D : RootDatum G Φ) : D.IsGenerating ↔ D.T = ⊤ := by
  rw [IsGenerating, Set.iUnion_of_empty, Set.union_empty, Subgroup.closure_eq]

end RootDatum

/-- Bruhat–Tits I, 6.2.1, pp. 116–117: a valuation of a root datum (axioms V0–V5). Real shifts in
V2 and V5 avoid subtraction involving `∞`. -/
structure Valuation {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ) where
  φ : (i : ι) → D.U i → WithTop ℝ
  /-- V0. -/
  three_values : ∀ i, 3 ≤ (Set.range (φ i)).encard
  /-- V1: the identity has infinite valuation, and each raw valuation cutoff is a subgroup. -/
  φ_eq_top_iff : ∀ i u, φ i u = ⊤ ↔ u = 1
  /-- The raw root filtration `U_{a,c} = {u : φ_a(u) ≥ c}`. A positive-depth
  Moy–Prasad factor on a nonreduced ray also uses the separate doubled-root cutoff. -/
  filtration : ι → ℝ → Subgroup G
  mem_filtration_iff : ∀ i r g, g ∈ filtration i r ↔
    ∃ u : D.U i, (u : G) = g ∧ (r : WithTop ℝ) ≤ φ i u
  /-- V2: the opposite-root valuation changes by a constant under a reflection lift. -/
  reflection_shift : ∀ i j, Φ.root j = -Φ.root i → ∀ m ∈ D.reflectionCoset i,
    ∃ c : ℝ, ∀ (u : D.U j) (v : D.U i), u ≠ 1 →
      (v : G) = m * (u : G) * m⁻¹ → φ j u = φ i v + (c : WithTop ℝ)
  /-- V3: depth-additive commutators, excluding negatively proportional roots. -/
  commutator_filtration_le : ∀ i j, (∀ c : ℝ, 0 < c → Φ.root j ≠ -c • Φ.root i) →
    ∀ r s : ℝ, ⁅filtration i r, filtration j s⁆ ≤
      ⨆ (k : ι) (p : ℕ) (q : ℕ) (_ : 0 < p ∧ 0 < q ∧
        Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j),
        filtration k ((p : ℝ) * r + (q : ℝ) * s)
  /-- V4. -/
  doubling : ∀ i j (h : Φ.root j = (2 : ℝ) • Φ.root i) (u : D.U j),
    φ j u = 2 * φ i ⟨u, D.le_of_root_eq_two_smul i j h u.property⟩
  /-- V5: the opposite factors in a rank-one Bruhat factorization have opposite depth. -/
  bruhat_value : ∀ i j, Φ.root j = -Φ.root i →
    ∀ (u : D.U i) (a b : D.U j), u ≠ 1 →
      (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i →
        ∃ r : ℝ, φ i u = (r : WithTop ℝ) ∧ φ j a = ((-r : ℝ) : WithTop ℝ) ∧
          φ j b = ((-r : ℝ) : WithTop ℝ)

namespace Valuation

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

/-- The value set `Γ_a = φ_a(U_a ∖ {1})`. -/
def valueSet (i : ι) : Set ℝ := {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ)}

/-- `Γ_{−a} = −Γ_a` (Bruhat–Tits I 6.2.2, p. 117). -/
theorem valueSet_neg (i j : ι) (hij : Φ.root j = -Φ.root i) :
    φ.valueSet j = -φ.valueSet i := sorry

/-- The set `Γ'_a ⊆ Γ_a` of values at elements `u ≠ 1` maximal on their coset `u U_{2a}`
(Bruhat–Tits I 6.2.2, p. 117); the constants of affine roots of gradient `a` lie in `Γ'_a`. -/
def primedValueSet (i : ι) : Set ℝ :=
  {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ) ∧
    ∀ (j : ι) (hj : Φ.root j = (2 : ℝ) • Φ.root i) (w : G) (hw : w ∈ D.U j),
      φ.φ i ⟨(u : G) * w, mul_mem u.2 (D.le_of_root_eq_two_smul i j hj hw)⟩ ≤ φ.φ i u}

/-- Discreteness: every bounded interval contains only finitely many root values (closed discrete,
which is stronger than the discrete subsets of Bruhat–Tits I, Def. 6.2.21, p. 127, for abstract
data and agrees with it for the value sets of reductive groups, which are cosets of discrete
groups). -/
def IsDiscrete : Prop := ∀ i (a b : ℝ), (φ.valueSet i ∩ Set.Icc a b).Finite

-- Test BruhatTits.Valuation.not_constant
/- A root-value map with at most two values violates (V0); in particular the trivial valuation of
`K` gives no valuation of the root datum of `SL₂(K)`. -/
example (i : ι) (c₁ c₂ : WithTop ℝ) : ¬ ∀ u : D.U i, φ.φ i u = c₁ ∨ φ.φ i u = c₂ := by
  intro h
  have hsub : Set.range (φ.φ i) ⊆ {c₁, c₂} := by
    rintro _ ⟨u, rfl⟩
    exact h u
  have h2 : ({c₁, c₂} : Set (WithTop ℝ)).encard ≤ 2 :=
    (Set.encard_insert_le _ _).trans (by rw [Set.encard_singleton]; rfl)
  have h3 := (φ.three_values i).trans ((Set.encard_le_encard hsub).trans h2)
  norm_num at h3

-- Test BruhatTits.Valuation.primedValueSet_eq_of_not_multipliable
/- For a non-multipliable root the two value sets agree. -/
example (i : ι) (h : ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i) : φ.primedValueSet i = φ.valueSet i := by
  refine Set.Subset.antisymm (fun _ ⟨u, hu, hφ, _⟩ => ⟨u, hu, hφ⟩) ?_
  rintro r ⟨u, hu, hφ⟩
  exact ⟨u, hu, hφ, fun j hj => absurd hj (h j)⟩

end Valuation

/-- The standard upper and lower unipotent subgroups of SL₂ carry the valuation induced by any nontrivial real additive valuation. -/
theorem Valuation.sl2_standard (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ)) (hω : ∃ x : K, x ≠ 0 ∧ ω x ≠ 0) :
    ∃ (Φ : RootPairing (Fin 2) ℝ ℝ ℝ) (D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ)
      (φ : Valuation D), ∀ c : K,
        (∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
          φ.φ 0 ⟨_, h⟩ = ω c) ∧
        (∃ h : (⟨!![1, 0; c, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 1,
          φ.φ 1 ⟨_, h⟩ = ω c) := sorry

-- Test BruhatTits.Valuation.not_isDiscrete_dense (non-example)
/- If every rational number is a value of `ω` (for instance `ω(K^×) = ℚ`), no valuation of a root
datum of `SL₂(K)` with `φ_+(x_+(c)) = ω(c)` is discrete: `Γ_a ∩ [0, 1]` contains every
`1/(n + 1)`. -/
example (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ))
    (hω : ∀ q : ℚ, ∃ x : K, ω x = ((q : ℝ) : WithTop ℝ))
    {Φ : RootPairing (Fin 2) ℝ ℝ ℝ} {D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ}
    (φ : Valuation D)
    (h₀ : ∀ c : K, ∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
      φ.φ 0 ⟨_, h⟩ = ω c) :
    ¬ φ.IsDiscrete := by
  intro hd
  refine Set.infinite_of_injective_forall_mem (f := fun n : ℕ => ((n : ℝ) + 1)⁻¹)
    (fun m n h => by simpa using h) (fun n => ?_) (hd 0 0 1)
  obtain ⟨x, hx⟩ := hω ((n : ℚ) + 1)⁻¹
  obtain ⟨h, hφ⟩ := h₀ x
  have hx0 : x ≠ 0 := by
    rintro rfl
    simp at hx
  refine ⟨⟨⟨_, h⟩, fun h1 => hx0 ?_, by rw [hφ, hx]; push_cast; rfl⟩, by positivity, ?_⟩
  · simpa using congrArg (fun g : D.U 0 =>
      ((g : Matrix.SpecialLinearGroup (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) 0 1) h1
  · exact inv_le_one_of_one_le₀ (by simp)

/-- Two valuations are equipollent if they differ by a vector `v` of the coroot space:
`ψ_a = φ_a + a(v)` (Bruhat–Tits I, 6.2.5, p. 120). -/
def Equipollent {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ ψ : Valuation D) : Prop :=
  ∃ v : N, ∀ i u, ψ.φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ)

/-- The enlarged apartment relative to a base valuation `φ`: valuations equipollent to `φ`, with
their displacement in the full coroot space (root valuations alone forget the directions killed by
every root). -/
structure Apartment {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Type (max u v) where
  val : Valuation D
  displacement : N
  val_eq : ∀ i u, val.φ i u = φ.φ i u +
    ((Φ.toLinearMap (Φ.root i) displacement : ℝ) : WithTop ℝ)

/-- The apartment is an affine space under `N`: the displacement is a bijection onto `N`
(Bruhat–Tits I, 6.2.5, p. 120). -/
theorem Apartment.displacement_bijective {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} (φ : Valuation D) :
    Function.Bijective (Apartment.displacement : Apartment φ → N) := sorry

-- Test BruhatTits.Apartment.central_displacement
/- With no roots, distinct central displacements still give distinct points. -/
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)
    [IsEmpty ι] (v w : N) (h : v ≠ w) :
    (⟨φ, v, fun i => isEmptyElim i⟩ : Apartment φ) ≠
      (⟨φ, w, fun i => isEmptyElim i⟩ : Apartment φ) := by
  intro he
  exact h (congrArg Apartment.displacement he)

/-- An affine root `a + k` with `a ∈ Φ` and `k ∈ Γ'_a` (Bruhat–Tits I, 6.2.6, p. 120). -/
structure AffineRoot {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) where
  /-- The gradient `a`. -/
  gradient : ι
  /-- The constant `k`. -/
  constant : ℝ
  mem_valueSet : constant ∈ φ.primedValueSet gradient

namespace AffineRoot

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} {φ : Valuation D}

/-- The value `α(x) = a(x − φ) + k` of `α = a + k` at a point `x` of the apartment. -/
def eval (α : AffineRoot φ) (x : Apartment φ) : ℝ :=
  Φ.toLinearMap (Φ.root α.gradient) x.displacement + α.constant

/-- The wall `∂α = {x : α(x) = 0}`. -/
def wall (α : AffineRoot φ) : Set (Apartment φ) := {x | α.eval x = 0}

/-- For a discrete valuation and a finite root system only finitely many walls meet a segment
`[x, x + v]`, the segment being described by displacements. -/
theorem finite_walls_segment [Finite ι] (hφ : φ.IsDiscrete) (x : Apartment φ) (v : N) :
    {α : AffineRoot φ | ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧
      Φ.toLinearMap (Φ.root α.gradient) (x.displacement + t • v) + α.constant = 0}.Finite :=
  sorry

end AffineRoot

/-- A point is special when every root direction is the direction of a wall through it
(Bruhat–Tits I, 1.3.7, p. 22); for nonreduced `Φ` the wall may have gradient `a`, `2a` or `a/2`. -/
def Apartment.IsSpecial {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    {φ : Valuation D} (x : Apartment φ) : Prop :=
  ∀ i : ι, ∃ α : AffineRoot φ, (∃ c : ℝ, 0 < c ∧ Φ.root α.gradient = c • Φ.root i) ∧ x ∈ α.wall

-- Test BruhatTits.Apartment.isSpecial_base
/- For `SL₂` with `φ_±(x_±(c)) = ω(c)` the base point is special: `ω(1) = 0` puts `0` in `Γ'_a`
for both roots (neither root of a root pairing on `Fin 2` is twice a root), so the wall of the
affine root `a + 0` passes through the base point. -/
example (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ))
    {Φ : RootPairing (Fin 2) ℝ ℝ ℝ} {D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ}
    (φ : Valuation D)
    (h₀ : ∀ c : K, ∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
      φ.φ 0 ⟨_, h⟩ = ω c)
    (h₁ : ∀ c : K, ∃ h : (⟨!![1, 0; c, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 1,
      φ.φ 1 ⟨_, h⟩ = ω c) :
    (⟨φ, 0, fun i u => by simp⟩ : Apartment φ).IsSpecial := by
  have key : ∀ a b c : Fin 2, a = b ∨ a = c ∨ b = c := by decide
  have hnm : ∀ i j : Fin 2, Φ.root j ≠ (2 : ℝ) • Φ.root i := by
    intro i j hij
    have hi := Φ.ne_zero i
    have hk : Φ.root (Φ.reflectionPerm i i) = -Φ.root i := by
      rw [Φ.root_reflectionPerm, Φ.reflection_apply_self]
    rw [smul_eq_mul] at hij
    rcases key i j (Φ.reflectionPerm i i) with h | h | h
    · subst h
      exact hi (by linarith)
    · rw [← h] at hk
      exact hi (by linarith)
    · rw [← h] at hk
      exact hi (by linarith)
  have hmem : ∀ i, (0 : ℝ) ∈ φ.primedValueSet i := by
    refine Fin.forall_fin_two.2 ⟨?_, ?_⟩
    · obtain ⟨h, hφ⟩ := h₀ 1
      refine ⟨⟨_, h⟩, fun h1 => ?_, by simp [hφ], fun j hj => absurd hj (hnm 0 j)⟩
      simpa using congrArg (fun g : D.U 0 =>
        ((g : Matrix.SpecialLinearGroup (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) 0 1) h1
    · obtain ⟨h, hφ⟩ := h₁ 1
      refine ⟨⟨_, h⟩, fun h1 => ?_, by simp [hφ], fun j hj => absurd hj (hnm 1 j)⟩
      simpa using congrArg (fun g : D.U 1 =>
        ((g : Matrix.SpecialLinearGroup (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) 1 0) h1
  exact fun i => ⟨⟨i, 0, hmem i⟩, ⟨1, one_pos, (one_smul ℝ _).symm⟩,
    by simp [AffineRoot.wall, AffineRoot.eval]⟩

/-- The `R`-points of the closed subgroup cut out by a Hopf ideal: the pinned
`TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, indexed by the coefficient type `R`. -/
abbrev subgroupPoints {K : Type u} [Field K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (I : TauCeti.HopfIdeal K H)
    (R : Type u) [CommRing R] [Algebra K R] : Subgroup (WithConv (H →ₐ[K] R)) :=
  TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of K R)

/-- A connected reductive `K`-group `Spec H` with a chosen maximal split torus, given by its Hopf
ideal. -/
structure LocalRootData (K : Type u) [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  reductive : TauCeti.reductiveCommHopfAlgProperty K H
  splitTorus : TauCeti.HopfIdeal K H
  maximalSplit : Minimal (fun I : TauCeti.HopfIdeal K H =>
    TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I))
      splitTorus

/-- Every connected reductive group over a field has a maximal split torus (Borel–Tits). -/
theorem exists_localRootData {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H) : Nonempty (LocalRootData K H) := sorry

end BruhatTits

namespace ZExtension

/-- The scheme-theoretic derived subgroup is semisimple and simply connected. -/
def DerivedSimplyConnected {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) : Prop :=
  ∃ h : TauCeti.semisimpleCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H)),
    TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty K
      ⟨TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H), h⟩

/-- `f` is the coordinate map of a z-extension `G̃ → G` (Nguyễn Quốc Thắng, §2.0, p. 4): both groups
reductive, `f` injective, `G̃_der` simply connected, and the kernel, cut out by the Hopf ideal `I`,
a central induced torus (its geometric characters have a finite Galois-permuted basis). -/
def IsZExtension {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐc[K] (Gt : Type u)) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty K G ∧
  TauCeti.reductiveCommHopfAlgProperty K Gt ∧
  Function.Injective f ∧ DerivedSimplyConnected Gt ∧
  ∃ I : TauCeti.HopfIdeal K Gt,
    TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient Gt I) ∧
    (∃ (B : Type u) (_ : Fintype B)
      (b : Module.Basis B ℤ (TauCeti.CommHopfAlgCat.additiveCharacterGroup
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient Gt I).obj)),
      ∀ (γ : Field.absoluteGaloisGroup K) (x : B), ∃ y : B, γ • b x = b y) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (Gt →ₐ[K] R)),
      g ∈ BruhatTits.subgroupPoints I R ↔
        WithConv.toConv (g.ofConv.comp (f : G →ₐ[K] Gt)) = (1 : WithConv (G →ₐ[K] R))) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R]
      (z : BruhatTits.subgroupPoints I R) (g : WithConv (Gt →ₐ[K] R)), Commute z.val g)

/-- Every connected reductive group over a field has a z-extension (Nguyễn Quốc Thắng, Lemma 2.1(a),
p. 4). -/
theorem exists_zExtension {K : Type u} [Field K] (G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (_hG : TauCeti.reductiveCommHopfAlgProperty K G) :
    ∃ (Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (f : (G : Type u) →ₐc[K] (Gt : Type u)),
      IsZExtension f := sorry

/-- `G̃(K') → G(K')` is onto for every field `K'/K` (Shapiro's lemma and Hilbert's Theorem 90). -/
theorem surjective_points {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐc[K] (Gt : Type u)) (hf : IsZExtension f)
    (K' : Type u) [Field K'] [Algebra K K'] :
    Function.Surjective fun x : (Gt : Type u) →ₐ[K] K' => x.comp (f : G →ₐ[K] Gt) := sorry

end ZExtension

/-! ## Layer RG2.2: buildings -/

namespace GLBuilding

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

open scoped Classical Pointwise

/-- The additive normalized valuation `ω : K → ℝ ∪ {∞}`, `ω(ϖ) = 1`, from
`TauCeti.normalizedValuation`, with `ω(0) = ∞`. -/
def ω (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (t : K) : WithTop ℝ :=
  if h : t = 0 then ⊤ else ((Multiplicative.toAdd (TauCeti.normalizedValuation K (Units.mk0 t h)) : ℤ) : ℝ)

/-- A splittable additive norm `α : Kⁿ → ℝ ∪ {∞}` (Bruhat–Tits, Bull. SMF 112 (1984), 1.4–1.5,
pp. 263–264). -/
structure SplittableNorm (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) where
  /-- The norm. -/
  toFun : (Fin n → K) → WithTop ℝ
  map_smul : ∀ (t : K) (x : Fin n → K), toFun (t • x) = toFun x + ω K t
  min_le_map_add : ∀ x y, min (toFun x) (toFun y) ≤ toFun (x + y)
  map_eq_top_iff : ∀ x, toFun x = ⊤ ↔ x = 0
  splittable : ∃ e : Module.Basis (Fin n) K (Fin n → K), ∀ x,
    toFun x = ⨅ i, (toFun (e i) + ω K (e.repr x i))

/-- A graded periodic lattice chain in `Kⁿ` (Bruhat–Tits, Bull. SMF 112 (1984), 1.7, pp. 266–267). -/
structure GradedLatticeChain (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) where
  /-- The lattices of the chain. -/
  chain : Set (Submodule 𝒪[K] (Fin n → K))
  nonempty : chain.Nonempty
  isLattice : ∀ Λ ∈ chain, Λ.IsLattice K
  isChain : IsChain (· ≤ ·) chain
  smul_mem : ∀ (t : Kˣ), ∀ Λ ∈ chain, Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K))) ∈ chain
  /-- The grading. -/
  grading : Submodule 𝒪[K] (Fin n → K) → ℝ
  /-- Off-chain values carry no extra data. -/
  grading_off_chain : ∀ Λ, Λ ∉ chain → grading Λ = 0
  grading_strictAnti : ∀ Λ ∈ chain, ∀ Λ' ∈ chain, Λ < Λ' → grading Λ' < grading Λ
  grading_smul : ∀ (t : Kˣ), ∀ Λ ∈ chain,
    (grading (Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K)))) : WithTop ℝ) =
      grading Λ + ω K t

/-- There is no graded periodic lattice chain in dimension zero, so the norm-chain correspondence requires positive rank. -/
theorem norm_chain_zero_rank : IsEmpty (GradedLatticeChain K 0) := by sorry

/-- Splittable norms correspond to graded periodic lattice chains: `α` goes to its closed balls
`{α ≥ r}`, each graded by the least value of `α` on it (Bruhat–Tits, Bull. SMF 112 (1984), 1.8,
p. 267). -/
theorem exists_normEquivChain {n : ℕ} [NeZero n] :
    ∃ e : SplittableNorm K n ≃ GradedLatticeChain K n, ∀ α Λ,
      (Λ ∈ (e α).chain ↔
        ∃ r : ℝ, (Λ : Set (Fin n → K)) = {x | (r : WithTop ℝ) ≤ α.toFun x}) ∧
      (Λ ∈ (e α).chain →
        ((e α).grading Λ : WithTop ℝ) = sInf (α.toFun '' (Λ : Set (Fin n → K)))) := sorry

end GLBuilding

namespace BTTree

open ValuativeRel
open scoped Pointwise

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- Scaling of lattices in `K²` by `K^×`. -/
instance instMulActionUnitsLattice :
    MulAction Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K} where
  smul t Λ := ⟨t • Λ.1, by have := Λ.2; exact Submodule.IsLattice.smul K Λ.1 t⟩
  one_smul Λ := Subtype.ext (one_smul Kˣ Λ.1)
  mul_smul s t Λ := Subtype.ext (mul_smul s t Λ.1)

/-- The vertices: homothety classes of `𝒪[K]`-lattices in `K²`. -/
def Vertex : Type u :=
  Quotient (α := {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})
    (MulAction.orbitRel Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})

/-- Adjacency: representatives with `ϖ Λ ⊊ Λ' ⊊ Λ`. -/
def Adj (v w : Vertex K) : Prop :=
  ∃ (Λ Λ' : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K}) (ϖ : 𝒪[K]),
    Irreducible ϖ ∧ Quotient.mk _ Λ = v ∧ Quotient.mk _ Λ' = w ∧
      Submodule.span 𝒪[K] ((fun x : Fin 2 → K => (ϖ : K) • x) ''
        (Λ.1 : Set (Fin 2 → K))) < Λ'.1 ∧ Λ'.1 < Λ.1

/-- The Bruhat–Tits tree of `SL₂(K)` (Garrett, *Buildings and Classical Groups*, §§19.1–19.3,
pp. 322–330, for `n = 2`). -/
def tree : SimpleGraph (Vertex K) where
  Adj := Adj K
  symm := sorry
  loopless := sorry

/-- The graph is a tree. -/
theorem isTree : (tree K).IsTree := sorry

/-- Every vertex has `q + 1` neighbours, the lines of `Λ / ϖΛ` over `𝓀[K]`. -/
theorem natCard_neighborSet (x : Vertex K) :
    Nat.card ((tree K).neighborSet x) = Nat.card 𝓀[K] + 1 := sorry

end BTTree

namespace TameDescent

/-- Fixed points of a finite group `Θ` of automorphisms of a reductive group, `|Θ|` invertible in the
field: `R ↦ G(R)^Θ` is represented by a smooth closed subgroup (Edixhoven, Prop. 3.1 and 3.4,
pp. 293–294). The fixed-point group need not be connected. -/
theorem smooth_fixedPoints {k : Type u} [Field k] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : TauCeti.reductiveCommHopfAlgProperty k H) (Θ : Type u) [Group Θ] [Finite Θ]
    (ρ : Θ →* _root_.CategoryTheory.Aut H) (hΘ : (Nat.card Θ : k) ≠ 0) :
    ∃ (H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) (f : H ⟶ H'),
      TauCeti.smoothCommHopfAlgProperty k H'.obj ∧ Function.Surjective f.hom.hom ∧
      ∀ (R : Type u) [CommRing R] [Algebra k R],
        Set.range (TauCeti.AlgHom.mapDomain (A := R) (f.hom.hom : (H : Type u) →ₐc[k] H')) =
          {g | ∀ θ : Θ,
            TauCeti.AlgHom.mapDomain (A := R) ((ρ θ).hom.hom.hom : (H : Type u) →ₐc[k] H) g = g} :=
  sorry

end TameDescent

/-! ## Layer RG2.3: integral models, level subgroups and Lang's theorem -/

namespace IntegralModel

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K]

/-- A smooth affine `𝒪[K]`-model of `G = Spec H`: a smooth finite-type commutative Hopf
`𝒪[K]`-algebra with a Hopf isomorphism of its generic fibre with `H` (Bruhat–Tits II,
1.2.2–1.2.5 and 1.2.12, pp. 17–20). -/
structure SmoothModel (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  /-- The coordinate Hopf algebra of the model. -/
  A : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝒪[K]
  smooth : Algebra.Smooth 𝒪[K] A
  /-- The identification of the generic fibre with `H`. -/
  genericFibre : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) A ≅ H

namespace SmoothModel

variable {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The special fibre `𝓀 ⊗ A`. -/
def specialFibre (𝒢 : SmoothModel H) : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝓀[K] :=
  TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := 𝓀[K]) 𝒢.A

/-- The integral points `𝒢(𝒪) ⊆ G(K)`: the points integral on every coordinate of `A`. -/
def integralPoints (𝒢 : SmoothModel H) : Subgroup (WithConv (H →ₐ[K] K)) where
  carrier := {g | ∀ a : 𝒢.A, ∃ o : 𝒪[K],
    g.ofConv (𝒢.genericFibre.hom.hom ((1 : K) ⊗ₜ[𝒪[K]] a)) = o}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- A reductive model has connected reductive generic and special fibres. -/
def IsReductive (𝒢 : SmoothModel H) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre ∧
    TauCeti.reductiveCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) 𝒢.A)

/-- The standard model of `GL_n` is reductive. -/
theorem generalLinear_isReductive (n : ℕ)
    (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (h : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n) : 𝒢.IsReductive :=
  sorry

end SmoothModel

/-- A subgroup of `G(K)` is hyperspecial if it is the group of integral points of a reductive
model. -/
def IsHyperspecialSubgroup {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (P : Subgroup (WithConv (H →ₐ[K] K))) : Prop :=
  ∃ 𝒢 : SmoothModel H, 𝒢.IsReductive ∧ 𝒢.integralPoints = P

/-- The extension principle: over a strictly henselian discrete valuation ring a `K`-homomorphism
extends to the smooth models iff it carries integral points into integral points (Bruhat–Tits II,
1.7.3 c) and Prop. 1.7.6, pp. 38–39). -/
theorem extend_iff [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] [HenselianLocalRing 𝒪[K]] [IsSepClosed 𝓀[K]]
    {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (𝒢 : SmoothModel H) (𝒢' : SmoothModel H') (f : H' ⟶ H) :
    (∃ F : 𝒢'.A ⟶ 𝒢.A,
      TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) F ≫ 𝒢.genericFibre.hom =
        𝒢'.genericFibre.hom ≫ f) ↔
      ∀ g ∈ 𝒢.integralPoints,
        TauCeti.AlgHom.mapDomain (f.hom.hom : (H' : Type u) →ₐc[K] H) g ∈ 𝒢'.integralPoints :=
  sorry

/-- Prasad–Yu, Cor. 1.3 (arXiv math/0405381, p. 2), for `char 𝓀 ≠ 2`: a homomorphism from a
reductive model to an affine finite-type `𝒪`-group which is a closed immersion on generic fibres
is a closed immersion. -/
theorem surjective_of_reductive_of_generic [ValuativeRel.IsDiscrete K]
    [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K] (h2 : (2 : 𝓀[K]) ≠ 0)
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H) (h𝒢 : 𝒢.IsReductive)
    (ℋ : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝒪[K]) (φ : ℋ ⟶ 𝒢.A)
    (hgen : Function.Surjective
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) φ).hom.hom) :
    Function.Surjective φ.hom.hom := sorry

/-- Every smooth affine model over the discrete valuation ring `𝒪[K]` admits a closed immersion
into some `GL_n` over `𝒪[K]`. -/
theorem exists_closedImmersion_generalLinear [ValuativeRel.IsDiscrete K]
    [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H) :
    ∃ (n : ℕ) (ρ : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n ⟶ 𝒢.A),
      Function.Surjective ρ.hom.hom := sorry

end IntegralModel

namespace SchematicClosure

variable (O : Type u) [CommRing O] (K : Type u) [Field K] [Algebra O K]
  (A : Type u) [CommRing A] [Algebra O A]

/-- `I^♮`, the preimage of `I ⊆ K ⊗_O A` in `A`: the ideal of the schematic closure of the closed
subscheme `V(I)` of the generic fibre (Bruhat–Tits II, 1.2.5–1.2.7, pp. 17–18). -/
def closureIdeal (I : Ideal (K ⊗[O] A)) : Ideal A :=
  I.comap (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A)

/-- The coordinate ring `A / I^♮` of the schematic closure. -/
def closure (I : Ideal (K ⊗[O] A)) : Type u := A ⧸ closureIdeal O K A I

instance (I : Ideal (K ⊗[O] A)) : CommRing (closure O K A I) :=
  inferInstanceAs (CommRing (A ⧸ closureIdeal O K A I))

instance (I : Ideal (K ⊗[O] A)) : Algebra O (closure O K A I) :=
  inferInstanceAs (Algebra O (A ⧸ closureIdeal O K A I))

section DVR

variable [IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O K]

/-- The schematic closure has the prescribed generic fibre, with the canonical formula on
pure tensors (Bruhat–Tits II, 1.2.6, p. 18). -/
theorem exists_closure_genericFibre (I : Ideal (K ⊗[O] A)) :
    ∃ e : K ⊗[O] closure O K A I ≃ₐ[K] (K ⊗[O] A) ⧸ I,
      ∀ (k : K) (a : A),
        e (k ⊗ₜ[O] (Ideal.Quotient.mk (closureIdeal O K A I) a)) =
          Ideal.Quotient.mk I (k ⊗ₜ[O] a) := sorry

/-- The schematic closure in a flat model is flat. -/
theorem closure_flat [Module.Flat O A] (I : Ideal (K ⊗[O] A)) : Module.Flat O (closure O K A I) :=
  sorry

/-- It is the unique flat closed subscheme with generic fibre `V(I)`. -/
theorem closure_unique [Module.Flat O A] (I : Ideal (K ⊗[O] A)) (J : Ideal A)
    (hJ : Module.Flat O (A ⧸ J))
    (hI : J.map (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A) = I) :
    J = closureIdeal O K A I := sorry

/-- Over a discrete valuation ring the closure of a closed subgroup is a closed subgroup scheme
(Bruhat–Tits II, 1.2.7, p. 18). -/
theorem closureIdeal_isHopfIdeal (B : Type u) [CommRing B] [HopfAlgebra O B]
    (I : TauCeti.HopfIdeal K (K ⊗[O] B)) :
    ∃ J : TauCeti.HopfIdeal O B, J.toIdeal = closureIdeal O K B I.toIdeal := sorry

/-- The ideal of the closure of the whole generic fibre consists precisely of scalar torsion. -/
theorem closureIdeal_bot_eq_torsion (a : A) : a ∈ closureIdeal O K A (⊥ : Ideal (K ⊗[O] A)) ↔
    ∃ r : O, r ≠ 0 ∧ r • a = 0 := by sorry

end DVR

end SchematicClosure

namespace LevelSubgroups

open ValuativeRel

variable (K : Type u) [Field K] [ValuativeRel K] (n : ℕ)

/-- `GL_n(𝒪)`: integral matrices with integral inverse. -/
def integralGL : Subgroup (GL (Fin n) K) where
  carrier := {g | (∀ i j, (g : Matrix (Fin n) (Fin n) K) i j ∈ 𝒪[K]) ∧
    ∀ i j, ((g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈ 𝒪[K]}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The standard Iwahori subgroup: integral, upper triangular modulo `𝓂[K]`. -/
def iwahori : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ integralGL K n ∧
    ∀ i j, j < i → valuation K ((g : Matrix (Fin n) (Fin n) K) i j) < 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The Iwahori pro-unipotent radical: unipotent upper triangular modulo `𝓂[K]`.
Over a nonarchimedean local field with residue characteristic `p` it is pro-`p`. -/
def proPIwahori : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ iwahori K n ∧
    ∀ i, valuation K ((g : Matrix (Fin n) (Fin n) K) i i - 1) < 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The principal congruence subgroup `1 + 𝓂[K]^m M_n(𝒪)`. -/
def principalCongruence (m : ℕ) : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ integralGL K n ∧ ∀ i j, ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ m ∧
    (a : K) = (g : Matrix (Fin n) (Fin n) K) i j - (1 : Matrix (Fin n) (Fin n) K) i j}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The integral subgroup agrees with the image of GLₙ over the valuation ring. -/
theorem integralGL_eq_range : integralGL K n = (Matrix.GeneralLinearGroup.map (algebraMap 𝒪[K] K)).range := sorry

/-- The pro-unipotent Iwahori radical is normal in the Iwahori subgroup. -/
theorem proPIwahori_normal : ((proPIwahori K n).subgroupOf (iwahori K n)).Normal := by sorry

attribute [instance] proPIwahori_normal

/-- The reductive quotient of the standard Iwahori is the diagonal residue torus. -/
theorem iwahori_quotient_equiv [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    Nonempty (((iwahori K n) ⧸ (proPIwahori K n).subgroupOf (iwahori K n)) ≃*
      (Fin n → 𝓀[K]ˣ)) := sorry

/-- The standard Iwahori radical is pro-p over a nonarchimedean local field. -/
theorem isProP_proPIwahori [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    TauCeti.IsProP (ringChar 𝓀[K]) (proPIwahori K n) := sorry

end LevelSubgroups

namespace Lang

/-- Surjectivity of the Lang map on a subgroup lifts each fixed right coset to a fixed element;
the subgroup need not be normal or stable under the automorphism. -/
theorem fixedCoset_lift {H : Type u} [Group H] (σ : MulAut H) (J : Subgroup H)
    (hJ : ∀ a : J, ∃ z : J, (z : H)⁻¹ * σ (z : H) = (a : H))
    (h : H) (hh : h⁻¹ * σ h ∈ J) :
    ∃ j : J, σ (h * (j : H)) = h * (j : H) := sorry

/-- Reduction of a smooth affine scheme over a complete DVR is surjective, with no restriction
on its residue field. -/
theorem completeDVR_reduction_surjective (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (A : Type u) [CommRing A] [Algebra O A] [Algebra.Smooth O A] :
    Function.Surjective fun f : A →ₐ[O] O =>
      (Ideal.Quotient.mkₐ O (IsLocalRing.maximalIdeal O)).comp f := sorry

/-- Lang's theorem: for a smooth geometrically connected finite-type group over a finite field `F`
and `σ` the `|F|`-power Frobenius, `g ↦ g⁻¹ σ(g)` is surjective on `H(F̄)` (Milne, *Algebraic
groups*, Prop. 27.54 and Cor. 27.55, v2.00 pp. 487–488). -/
theorem lang_surjective {F : Type u} [Field F] [Fintype F]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (_hsm : TauCeti.smoothCommHopfAlgProperty F H.obj)
    (_hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F H.obj)
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (_hσ : ∀ z, σ z = z ^ Fintype.card F) :
    Function.Surjective fun g : WithConv (H →ₐ[F] AlgebraicClosure F) =>
      g⁻¹ * WithConv.toConv (σ.comp g.ofConv) := sorry

/-- Lang's theorem for a directed inverse system of smooth geometrically connected finite-type
groups over a finite field, on compatible families of geometric points: the Lang fibres are finite
and nonempty (Milne, *Algebraic groups*, Cor. 27.55, v2.00 p. 488), so they have a compatible
section. -/
theorem lang_proAlgebraic_surjective {F : Type u} [Field F] [Fintype F]
    {ι : Type v} [Preorder ι] [Nonempty ι]
    (hdir : ∀ i j : ι, ∃ k, i ≤ k ∧ j ≤ k)
    (H : ι → TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (hsm : ∀ i, TauCeti.smoothCommHopfAlgProperty F (H i).obj)
    (hconn : ∀ i, TauCeti.geometricallyConnectedCommHopfAlgProperty F (H i).obj)
    (f : ∀ i j, i ≤ j → (H i ⟶ H j))
    (fid : ∀ i, f i i le_rfl = 𝟙 (H i))
    (fcomp : ∀ i j k (hij : i ≤ j) (hjk : j ≤ k),
      f i j hij ≫ f j k hjk = f i k (hij.trans hjk))
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (hσ : ∀ z, σ z = z ^ Fintype.card F)
    (a : ∀ i, WithConv (H i →ₐ[F] AlgebraicClosure F))
    (ha : ∀ i j (hij : i ≤ j),
      WithConv.toConv ((a j).ofConv.comp
        (TauCeti.FiniteTypeCommHopfAlgCat.toBialgHom (f i j hij)).toAlgHom) = a i) :
    ∃ g : ∀ i, WithConv (H i →ₐ[F] AlgebraicClosure F),
      (∀ i j (hij : i ≤ j),
        WithConv.toConv ((g j).ofConv.comp
          (TauCeti.FiniteTypeCommHopfAlgCat.toBialgHom (f i j hij)).toAlgHom) = g i) ∧
      ∀ i, (g i)⁻¹ * WithConv.toConv (σ.comp (g i).ofConv) = a i := sorry

end Lang

/-! ## Layer RG2.4: decompositions and double cosets -/

namespace Decomposition

open ValuativeRel LevelSubgroups

variable {K : Type u} [Field K] [ValuativeRel K] [ModelField K] {n : ℕ}

/-- Over every `ModelField K`, the Cartan decomposition places each `g` in
`GL_n(𝒪) diag(ϖ^μ) GL_n(𝒪)` for a unique antitone `μ ∈ ℤⁿ`, the elementary divisors of
`g𝒪ⁿ` (Zhu, Lem. 1.8, p. 11; Garrett,
§17.5, p. 297). -/
theorem cartan_generalLinear (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (g : GL (Fin n) K) :
    ∃! μ : Fin n → ℤ, Antitone μ ∧ ∃ k₁ ∈ integralGL K n, ∃ k₂ ∈ integralGL K n,
      (g : Matrix (Fin n) (Fin n) K) = (k₁ : Matrix (Fin n) (Fin n) K) *
        Matrix.diagonal (fun i => (ϖ : K) ^ μ i) * (k₂ : Matrix (Fin n) (Fin n) K) := sorry

/-- Over every `ModelField K`, the Iwasawa equality is `GL_n(K) = B(K) GL_n(𝒪)` with `B`
upper triangular
(Bruhat–Tits I, Prop. (7.3.1)(i), p. 164, `G = U⁺·N·B_{x,D}`; for `GL_n`, `N = T(K)·S_n` with
`S_n ⊂ GL_n(𝒪)`). -/
theorem iwasawa_generalLinear (g : GL (Fin n) K) :
    ∃ b : GL (Fin n) K, (b : Matrix (Fin n) (Fin n) K).BlockTriangular id ∧
      ∃ k ∈ integralGL K n, g = b * k := sorry

/-- Over every `ModelField K`, the Iwahori–Bruhat decomposition is
`GL_n(K) = ⊔ I (P_σ diag(ϖ^μ)) I` over the extended affine Weyl group `ℤⁿ ⋊ Sₙ`, each `g`
lying in exactly one double coset (Bruhat–Tits I,
§6.5, Théorème, p. 154, for `GL_n`). -/
theorem iwahoriBruhat_generalLinear (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (g : GL (Fin n) K) :
    ∃! p : Equiv.Perm (Fin n) × (Fin n → ℤ), ∃ i₁ ∈ iwahori K n, ∃ i₂ ∈ iwahori K n,
      (g : Matrix (Fin n) (Fin n) K) = (i₁ : Matrix (Fin n) (Fin n) K) *
        (p.1.permMatrix K * Matrix.diagonal (fun i => (ϖ : K) ^ p.2 i)) *
          (i₂ : Matrix (Fin n) (Fin n) K) := sorry

open scoped Pointwise in
/-- A double coset `C g C'` of open subgroups with `C` compact is a finite disjoint union of
`[C : C ∩ g C' g⁻¹]` left cosets of `C'`. -/
theorem doubleCoset_finite_of_isCompact {G : Type v} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (C C' : OpenSubgroup G) (hC : IsCompact (C : Set G)) (g : G) :
    ∃ S : Finset G,
      S.card = (C'.toSubgroup.map (MulAut.conj g).toMonoidHom).relIndex C.toSubgroup ∧
      (S : Set G).PairwiseDisjoint (fun h => h • (C' : Set G)) ∧
      DoubleCoset.doubleCoset g (C : Set G) C' = ⋃ h ∈ S, h • (C' : Set G) := sorry

omit [ModelField K] in
open scoped PointTopology in
/-- `G(K)` is unimodular for a connected reductive group over a nonarchimedean local field
(Cartier, Corvallis Part 1, §4.1, p. 144). -/
theorem modularCharacter_eq_one [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (hH : TauCeti.reductiveCommHopfAlgProperty K H) :
    MeasureTheory.Measure.modularCharacter (G := WithConv (H →ₐ[K] K)) = 1 := sorry

end Decomposition

namespace LocalIntegration

open scoped PointTopology NNReal

/-- The normalized absolute determinant of the adjoint action on the Lie algebra. -/
def adjointModulus (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (H : Type u) [CommRing H] [HopfAlgebra E H]
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E H)]
    (g : WithConv (H →ₐ[E] E)) : ℝ≥0 :=
  (TauCeti.normalizedAbsoluteValue E
    (LinearEquiv.det ((Derivation.adjointAction (R := E) (H := H)
      (CommAlgCat.of E E) g).toLinearEquiv) : E) : ℝ≥0)

/-- For a smooth affine group of finite type over a nonarchimedean local field, the analytic
tangent and Haar-Jacobian comparison identifies the modular character with the absolute
adjoint determinant, in either characteristic. -/
theorem modularCharacter_eq_adjointModulus (E : Type u) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (H : Type u) [CommRing H] [HopfAlgebra E H] [Algebra.FiniteType E H]
    [Algebra.Smooth E H] [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E H)]
    (g : WithConv (H →ₐ[E] E)) :
    MeasureTheory.Measure.modularCharacter g = adjointModulus E H g := sorry

/-- On the upper Borel of GLₙ the adjoint modulus is the product of the absolute values of
the positive roots, including in positive characteristic. -/
theorem adjointModulus_upperTriangular (E : Type u) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] (n : ℕ)
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E
      (TauCeti.GeneralLinear.UpperTriangular.finiteTypeCoordinateHopfAlgebra E n))]
    (g : WithConv
      (TauCeti.GeneralLinear.UpperTriangular.finiteTypeCoordinateHopfAlgebra E n →ₐ[E] E)) :
    let b : Matrix (Fin n) (Fin n) E :=
      (TauCeti.GeneralLinear.UpperTriangular.pointsMulEquiv (R := E) (n := n) (A := E) g :
        GL (Fin n) E)
    adjointModulus E _ g =
      ∏ i : Fin n, ∏ j : Fin n,
        if i < j then (TauCeti.normalizedAbsoluteValue E (b i i / b j j) : ℝ≥0) else 1 := sorry

end LocalIntegration

end

end TauCetiRoadmap.ReductiveGroupsPartII

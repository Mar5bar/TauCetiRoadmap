import Mathlib
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.RepresentationTheory.BaseChange

/-!
# Étale cohomology foundations: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Scheme compactifications, finite-field descent, finite-free retract traces and stable lattices
can be stated on the pinned libraries. The sheaf-theoretic targets in the README require the
specified enhanced, constructible and adic carriers and are recorded by name in the final comment.
Definitions below specify their mathematical data; admitted terms fill proofs only.
All names are relative to `TauCetiRoadmap.EtaleCohomologyFoundations`.
-/

noncomputable section

namespace TauCetiRoadmap.EtaleCohomologyFoundations

open CategoryTheory AlgebraicGeometry
open scoped TensorProduct

universe u u' v v' w w'

/-! ## G.1–G.3 Scheme compactifications -/

/-- **G.1, `Compactification`.** The shared scheme compactification carrier for coherent
and étale consumers: a proper factorization with a quasi-compact open interior.
Existence is asserted for separated finite-type maps over qcqs bases. -/
structure Compactification {X S : Scheme.{u}} (f : X ⟶ S) where
  Xbar : Scheme.{u}
  j : X ⟶ Xbar
  p : Xbar ⟶ S
  fac : j ≫ p = f
  openImmersion : IsOpenImmersion j
  quasiCompact : QuasiCompact j
  proper : IsProper p

attribute [instance] Compactification.openImmersion Compactification.quasiCompact
  Compactification.proper

/-- A compactification morphism is a scheme map over the base fixing the given interior. -/
structure Compactification.Hom {X S : Scheme.{u}} {f : X ⟶ S}
    (C D : Compactification f) where
  hom : C.Xbar ⟶ D.Xbar
  comm_j : C.j ≫ hom = D.j
  comm_p : hom ≫ D.p = C.p

/-- Compactification maps compose as their underlying scheme maps. -/
instance {X S : Scheme.{u}} (f : X ⟶ S) : Category (Compactification f) where
  Hom C D := Compactification.Hom C D
  id C := ⟨𝟙 C.Xbar, by simp, by simp⟩
  comp α β := ⟨α.hom ≫ β.hom,
    by rw [← Category.assoc, α.comm_j, β.comm_j],
    by rw [Category.assoc, β.comm_p, α.comm_p]⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- **G.1, `DenseCompactification`.** The full subcategory with schematically dense interior,
using the existing scheme-theoretic dominance property. -/
abbrev DenseCompactification {X S : Scheme.{u}} (f : X ⟶ S) :=
  ObjectProperty.FullSubcategory
    (fun C : Compactification f => IsSchemeTheoreticallyDominant C.j)

/-- A proper map has the identity compactification. -/
def Compactification.identity {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f] :
    Compactification f where
  Xbar := X
  j := 𝟙 X
  p := f
  fac := by simp
  openImmersion := by infer_instance
  quasiCompact := by infer_instance
  proper := inferInstance

/-- Pulling back a compactification gives a compactification of the pulled-back map. -/
def Compactification.baseChange {X S S' : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) (g : S' ⟶ S) :
    Compactification (Limits.pullback.snd f g) where
  Xbar := Limits.pullback C.p g
  j := Limits.pullback.lift (Limits.pullback.fst f g ≫ C.j) (Limits.pullback.snd f g)
    (by rw [Category.assoc, C.fac, Limits.pullback.condition])
  p := Limits.pullback.snd C.p g
  fac := by simp
  openImmersion := by sorry
  quasiCompact := by sorry
  proper := by infer_instance

/-- Schematic closure of the open interior gives a dense compactification. -/
def Compactification.denseReplacement {X S : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) : DenseCompactification f where
  obj :=
    { Xbar := C.j.image
      j := C.j.toImage
      p := C.j.imageι ≫ C.p
      fac := by rw [← Category.assoc, Scheme.Hom.toImage_imageι, C.fac]
      openImmersion := by infer_instance
      quasiCompact := by infer_instance
      proper := by infer_instance }
  property := by sorry

/-- Dense replacement maps canonically to the original compactification, fixing the interior. -/
def Compactification.denseReplacementMap {X S : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) : C.denseReplacement.obj ⟶ C where
  hom := C.j.imageι
  comm_j := by exact Scheme.Hom.toImage_imageι C.j
  comm_p := rfl

/-- The identity construction retains the original scheme and factorization as data. -/
example {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f] :
    (Compactification.identity f).Xbar = X ∧
      (Compactification.identity f).j = 𝟙 X ∧ (Compactification.identity f).p = f :=
  ⟨rfl, rfl, rfl⟩

/-- Base change uses the pullback of the proper factor. -/
example {X S S' : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) (g : S' ⟶ S) :
    (C.baseChange g).Xbar = Limits.pullback C.p g := rfl

/-- Dense replacement uses the schematic image, including the interior's nilpotents. -/
example {X S : Scheme.{u}} {f : X ⟶ S} (C : Compactification f) :
    C.denseReplacement.obj.Xbar = C.j.image := rfl

/-- The canonical dense-replacement map is the schematic image's closed immersion. -/
example {X S : Scheme.{u}} {f : X ⟶ S} (C : Compactification f) :
    IsClosedImmersion C.denseReplacementMap.hom := by
  change IsClosedImmersion C.j.imageι
  infer_instance

/-- Every compactification morphism is proper over the fixed base. -/
theorem Compactification.Hom.proper {X S : Scheme.{u}} {f : X ⟶ S}
    {C D : Compactification f} (h : C ⟶ D) : IsProper h.hom := sorry

/-- **G.2, `nagataCompactification`.** A separated finite-type map over a qcqs scheme
admits a schematically dense compactification. Finite type carries quasi-compactness. -/
theorem nagataCompactification {X S : Scheme.{u}} [CompactSpace S] [QuasiSeparatedSpace S]
    (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] :
    Nonempty (DenseCompactification f) := sorry

/-- **G.3, `compactificationCommonRefinement`.** Two compactifications admit a dense
common refinement with specified maps fixing the same interior. -/
theorem compactificationCommonRefinement {X S : Scheme.{u}}
    [CompactSpace S] [QuasiSeparatedSpace S] (f : X ⟶ S)
    [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f]
    (C₁ C₂ : Compactification f) :
    ∃ C : DenseCompactification f, Nonempty (C.obj ⟶ C₁) ∧ Nonempty (C.obj ⟶ C₂) := sorry

/-- Maps from a schematically dense compactification into a fixed compactification are unique. -/
theorem denseCompactification_hom_unique {X S : Scheme.{u}} {f : X ⟶ S}
    (C : DenseCompactification f) (D : Compactification f) (h k : C.obj ⟶ D) :
    h = k := sorry

/-- Dense compactifications form a nonempty cofiltered category on the Nagata domain. -/
theorem denseCompactification_cofiltered {X S : Scheme.{u}}
    [CompactSpace S] [QuasiSeparatedSpace S] (f : X ⟶ S)
    [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] :
    IsCofiltered (DenseCompactification f) := sorry

/-! ## F.0.A0 Tate-module coordinates -/

/- The characteristic-zero Tate-module parametrization is `e_ζ : ẑ → T`,
`a ↦ (ζ_n^a)_n`, and the coordinate map is its inverse `c_ζ : T → ẑ`.
For a profinite unit `u`, `e_(ζ^u) = e_ζ ∘ [u]` and `c_(ζ^u) = [u⁻¹] ∘ c_ζ`,
where `[u]` denotes multiplication by `u`. The scheme fundamental-group identification
is a README target. -/

-- A unit reducing to `2 mod 5` changes the coordinate of `ζ₅` to `3 mod 5`.
example {M : Type*} [CommMonoid M] {ζ : M} (hζ : IsPrimitiveRoot ζ 5) :
    (ζ ^ 2) ^ 3 = ζ := by
  calc
    (ζ ^ 2) ^ 3 = ζ ^ 6 := (pow_mul ζ 2 3).symm
    _ = ζ := by rw [show 6 = 5 + 1 from rfl, pow_succ, hζ.pow_eq_one, one_mul]


/-! ## F.4.0 Stable lattices and integral models

`ContinuousRep` is only the representation with its joint-continuity proof needed by these
lattice signatures. Scalar extension is the supplied `Representation.baseChange`.
-/

/-- A continuous representation of `Γ` on the finitely generated projective `A`-module `M` carrying
the module topology: a linear representation whose action map `Γ × M → M` is jointly continuous
(README F.4.0). Mathlib's `ContRepresentation` only asks each operator to be continuous. -/
structure ContinuousRep (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
    (A : Type v) [CommRing A] [TopologicalSpace A]
    (M : Type w) [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M] where
  /-- The underlying linear representation. -/
  toRepresentation : Representation A Γ M
  /-- Joint continuity of the action map. -/
  continuous_action : Continuous fun p : Γ × M => toRepresentation p.1 p.2

namespace ContinuousRep

section Basic

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A]
  {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]
  {N : Type w'} [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
  [TopologicalSpace N] [IsModuleTopology A N]

instance : CoeFun (ContinuousRep Γ A M) (fun _ => Γ → M →ₗ[A] M) :=
  ⟨fun ρ g => ρ.toRepresentation g⟩

/-- Isomorphisms of continuous representations. -/
structure Iso (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) where
  /-- The underlying linear equivalence. -/
  toLinearEquiv : M ≃ₗ[A] N
  /-- Equivariance. -/
  comm : ∀ (g : Γ) (m : M), toLinearEquiv (ρ g m) = σ g (toLinearEquiv m)

/-- The rank-one representation `A(χ)` of a continuous character `χ`. -/
def ofCharacter [IsTopologicalRing A] (χ : Γ →ₜ* Aˣ) : ContinuousRep Γ A A where
  toRepresentation :=
    { toFun g := (χ g : A) • LinearMap.id
      map_one' := sorry
      map_mul' := sorry }
  continuous_action := sorry

end Basic

section BaseChange

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- Base change `M_B := B ⊗_A M` along a continuous ring homomorphism `A → B`, with the module
topology over `B`; the underlying representation is Tau Ceti's `Representation.baseChange`. -/
def baseChange (ρ : ContinuousRep Γ A M)
    (B : Type v') [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B] [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    ContinuousRep Γ B (B ⊗[A] M) :=
  ⟨Representation.baseChange B ρ.toRepresentation, sorry⟩

end BaseChange

open ValuativeRel in
/-- A subgroup of `GL_n(E)` stabilises an `O_E`-lattice iff its closure is compact (DDT, §2.1). -/
theorem exists_stable_lattice_iff {E : Type v} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ)
    (K : Subgroup (Matrix.GeneralLinearGroup (Fin n) E)) :
    IsCompact (closure (K : Set (Matrix.GeneralLinearGroup (Fin n) E))) ↔
      ∃ L : Submodule 𝒪[E] (Fin n → E), L.FG ∧ Submodule.span E (L : Set (Fin n → E)) = ⊤ ∧
        ∀ k ∈ K, ∀ x ∈ L, (k : Matrix (Fin n) (Fin n) E).mulVec x ∈ L := by
  sorry

end ContinuousRep

/-- A `Γ`-stable lattice in a representation `V` over a field `E` with ring of integers `O`: a
finitely generated `O`-submodule, stable under `Γ`, spanning `V` over `E` (README F.4.0). -/
structure GaloisLattice.IntegralModel {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    (O : Type v) [CommRing O] {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E]
    {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
    (ρ : ContinuousRep Γ E V) where
  /-- The lattice. -/
  lattice : Submodule O V
  /-- Stability under the group. -/
  stable : ∀ (g : Γ) (x : V), x ∈ lattice → ρ g x ∈ lattice
  /-- Finite generation over `O`. -/
  fg : lattice.FG
  /-- The lattice spans the representation. -/
  span_eq_top : Submodule.span E (lattice : Set V) = ⊤

namespace GaloisLattice.IntegralModel

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {O : Type v} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}

instance (Λ : IntegralModel O ρ) : Module.Finite O Λ.lattice :=
  Module.Finite.iff_fg.mpr Λ.fg

instance (Λ : IntegralModel O ρ) : Module.Free O Λ.lattice := by
  sorry

instance (Λ : IntegralModel O ρ) : Module.Projective O Λ.lattice :=
  Module.Projective.of_free

/-- The lattice `(Λ, ρ|_Λ)` as a continuous representation over `O`. -/
def toContinuousRep (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] :
    ContinuousRep Γ O Λ.lattice :=
  ⟨{ toFun g := ((ρ g).restrictScalars O).restrict (fun x hx => Λ.stable g x hx)
     map_one' := sorry
     map_mul' := sorry }, sorry⟩

/-- The generic fibre: `E ⊗_O Λ ≅ V` as continuous representations. -/
theorem nonempty_iso_genericFibre [IsTopologicalRing O] [IsTopologicalRing E] [ContinuousSMul O E]
    (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (E ⊗[O] Λ.lattice)] [IsModuleTopology E (E ⊗[O] Λ.lattice)]
    [Module.Finite E (E ⊗[O] Λ.lattice)] [Module.Projective E (E ⊗[O] Λ.lattice)] :
    Nonempty (ContinuousRep.Iso (Λ.toContinuousRep.baseChange E) ρ) := by
  sorry

/-- Homothety `c Λ` for `c ∈ E^×`. -/
def smul (c : Eˣ) (Λ : IntegralModel O ρ) : IntegralModel O ρ where
  lattice := Λ.lattice.map (((c : E) • LinearMap.id : V →ₗ[E] V).restrictScalars O)
  stable := sorry
  fg := sorry
  span_eq_top := sorry

/-- Existence of integral models for compact `Γ` and `O` compact open in the local field `E`. -/
theorem nonempty [CompactSpace Γ] [CompactSpace O] [IsTopologicalRing E]
    (hO : Topology.IsOpenEmbedding (algebraMap O E)) : Nonempty (IntegralModel O ρ) := by
  sorry

/-- Any two lattices are commensurable: `𝔪^a Λ ⊂ Λ' ⊂ 𝔪^{-a} Λ` for some `a`. -/
theorem exists_pow_le (Λ Λ' : IntegralModel O ρ) :
    ∃ a : ℕ, (IsLocalRing.maximalIdeal O ^ a) • Λ.lattice ≤ Λ'.lattice ∧
      (IsLocalRing.maximalIdeal O ^ a) • Λ'.lattice ≤ Λ.lattice := by
  sorry

-- The zero representation has only the zero lattice.
example [Subsingleton V] (Λ : IntegralModel O ρ) : Λ.lattice = ⊥ := by
  sorry

-- `(1 a; 0 1)` on `ℚ_ℓ²` has the non-homothetic stable lattices `ℤ_ℓ²` and `ℤ_ℓ e₁ ⊕ ℓℤ_ℓ e₂`.
example (ℓ : ℕ) [Fact ℓ.Prime]
    (ρ : ContinuousRep (Multiplicative ℤ_[ℓ]) ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]))
    (hρ : ∀ a, LinearMap.toMatrix' (ρ a) =
      !![1, ((Multiplicative.toAdd a : ℤ_[ℓ]) : ℚ_[ℓ]); 0, 1])
    (Λ₁ Λ₂ : IntegralModel ℤ_[ℓ] ρ)
    (h₁ : Λ₁.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 1})
    (h₂ : Λ₂.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 (ℓ : ℚ_[ℓ])}) :
    ∀ c : ℚ_[ℓ]ˣ, (IntegralModel.smul c Λ₁).lattice ≠ Λ₂.lattice := by
  sorry

-- The integral models of `ℚ_ℓ(χ)` are the `ℓ^k ℤ_ℓ`, with `k` unique.
example (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime]
    (ψ : Field.absoluteGaloisGroup F →ₜ* ℚ_[ℓ]ˣ)
    (Λ : IntegralModel ℤ_[ℓ] (ContinuousRep.ofCharacter ψ)) :
    ∃! k : ℤ, Λ.lattice = Submodule.span ℤ_[ℓ] {(ℓ : ℚ_[ℓ]) ^ k} := by
  sorry

end GaloisLattice.IntegralModel

/-! ## F.10.1 Finite-field descent and rational-point fixed points -/

namespace VanishingCycles

/-- Arithmetic Frobenius on an algebraic extension of a finite field, acting on coordinates
by the cardinality power. README F.10.1, `frobeniusFixedPoints`. -/
noncomputable def arithmeticFrobenius (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  FiniteField.frobeniusAlgEquivOfAlgebraic k L

/-- Geometric Frobenius is the inverse field automorphism. README F.10.1. -/
noncomputable def geometricFrobenius (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  (arithmeticFrobenius k L).symm

/-- Every Frobenius power acts by the corresponding cardinality power. README F.10.1. -/
theorem arithmeticFrobenius_pow_apply (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] (r : ℕ) (x : L) :
    (arithmeticFrobenius k L ^ r) x = x ^ (Fintype.card k ^ r) := by
  sorry

/-- Over an algebraic closure the fixed field of the r-th Frobenius has q^r elements.
README F.10.1, `frobeniusFixedPoints`; positivity excludes the infinite zeroth fixed field. -/
theorem frobeniusFixedField_card (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    (r : ℕ) (hr : 0 < r) :
    Nat.card {x : L // (arithmeticFrobenius k L ^ r) x = x} = Fintype.card k ^ r := by
  sorry

open CategoryTheory AlgebraicGeometry

/-- The cardinality of L-valued points over the given structure morphism, total even before
point finiteness is proved. README F.10.1. -/
noncomputable def numberOfRationalPoints (k L : Type u) [Field k] [Field L] [Algebra k L]
    (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k)) : ℕ :=
  Nat.card {x : Spec (CommRingCat.of L) ⟶ X //
    x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k L))}

/-- Rational points over the fixed subfield are exactly fixed geometric points, without a
finite-type hypothesis on the scheme. README F.10.1. -/
theorem frobeniusFixedPoints (k L : Type u) [Field k] [Fintype k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    (r : ℕ) (hr : 0 < r) (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k)) :
    let k_r := (arithmeticFrobenius k L ^ r).toAlgHom.equalizer (AlgHom.id k L)
    Nonempty ({x : Spec (CommRingCat.of k_r) ⟶ X //
      x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k k_r))} ≃
      {x : Spec (CommRingCat.of L) ⟶ X //
        x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k L)) ∧
        Spec.map (CommRingCat.ofHom (arithmeticFrobenius k L ^ r).toRingHom) ≫ x = x}) := by
  sorry

end VanishingCycles

/-! ## F.10.3 Projective-module trace algebra -/

namespace PerfectComplex

/-- The commutative projective-module trace computed through an explicit finite-free retract.
README F.10.3, projective trace algebra. -/
noncomputable def projectiveTraceOfRetract {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] {ι : Type*} [Fintype ι]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P) (u : Module.End R P) : R :=
  LinearMap.trace R (ι → R) (i ∘ₗ u ∘ₗ r)

/-- Two finite-free split retracts compute the same trace of a projective-module endomorphism.
README F.10.3, projective trace algebra. -/
theorem projectiveTrace_independent {R P : Type*} [CommRing R] [AddCommGroup P]
    [Module R P] {ι κ : Type*} [Fintype ι] [Fintype κ]
    (i : P →ₗ[R] (ι → R)) (r : (ι → R) →ₗ[R] P)
    (j : P →ₗ[R] (κ → R)) (s : (κ → R) →ₗ[R] P)
    (hi : r ∘ₗ i = LinearMap.id) (hj : s ∘ₗ j = LinearMap.id) (u : Module.End R P) :
    projectiveTraceOfRetract i r u = projectiveTraceOfRetract j s u := by
  sorry

end PerfectComplex

/-!
The remaining signatures are specified in the README, using the following intended names.
They require the shared sheaf and enhancement carriers; this list declares no placeholder objects.

F.0.1–F.0.4 and F.1:
VanishingCycles.constructibleEtale, VanishingCycles.finiteEtaleGaloisCategory,
VanishingCycles.lisseMonodromyEquiv, VanishingCycles.fieldSheavesEquiv,
VanishingCycles.etaleTateTwists, VanishingCycles.universalHomeomorphismEtaleEquivalence,
VanishingCycles.constructibleDerivedCategory, VanishingCycles.finiteCoefficientCohomology,
VanishingCycles.filteredColimit_cohomology.

F.0.A1: SchemeInertia.decomposition, SchemeInertia.inertia, SchemeInertia.conjugate,
SchemeInertia.intermediateOrbits. F.0.A0–F.0.A2 give the intrinsic field and multiplicative-group
identifications and the arithmetic exact sequence, with section/path choices retained.

0.5–0.11:
ClassicalCoefficients.finitePresentationDescent, ClassicalCoefficients.constructibleDerivedDescent,
ClassicalCoefficients.constructibleHomContinuity, ClassicalAlgebraic.supportLocalization,
ClassicalAlgebraic.supportLocalization.mayerVietoris, ClassicalAlgebraic.properSupports,
ClassicalAlgebraic.properSupports.derivedComparison, ClassicalAlgebraic.finiteTrace,
ClassicalAlgebraic.cycleClasses, ClassicalAlgebraic.lciCycleClass,
ClassicalAlgebraic.smoothBoundaryPurity, ClassicalAlgebraic.smoothTrace,
ClassicalAlgebraic.curveDuality.

F.2–F.3: VanishingCycles.etaleBaseChange, VanishingCycles.properBaseChange,
VanishingCycles.smoothBaseChange, VanishingCycles.localAcyclicity,
VanishingCycles.etaleCompactSupports, VanishingCycles.compactSupportCohomology,
VanishingCycles.etaleKunneth, VanishingCycles.etaleKunnethCompactSupport,
VanishingCycles.etaleCohomologicalDimension, VanishingCycles.affineArtinVanishing,
VanishingCycles.etaleFiniteness, VanishingCycles.lisseDirectImageTransport,
VanishingCycles.compactSupportFiniteness, VanishingCycles.genericLocalAcyclicity.

F.3a: VanishingCycles.HenselianTrait, VanishingCycles.HenselianTrait.inertia,
VanishingCycles.HenselianTrait.inertia_exact, VanishingCycles.HenselianTrait.genericFiber,
VanishingCycles.HenselianTrait.specialFiber, VanishingCycles.inertia_eq_top_of_strictlyHenselian,
VanishingCycles.inertia_puiseux, VanishingCycles.inertia_eq_valuation_inertia,
VanishingCycles.wild_inertia_ne_bot, VanishingCycles.tameCharacter_kummer,
VanishingCycles.tameCharacter_surjective, VanishingCycles.tameCharacter_conj,
VanishingCycles.tameCharacter_restrict, tameCharacter_puiseux,
tameCharacter_restrict_quadratic, tameCharacter_wild.

F.4.1–F.4.6: VanishingCycles.adicRealization, VanishingCycles.normalizedAdicSystems,
VanishingCycles.classicalAdicRealization, VanishingCycles.etaleProetaleAdicComparison,
VanishingCycles.adicFiniteness, VanishingCycles.rationalAdicRealization,
VanishingCycles.adicFunctoriality. A general lisse rational pro-étale sheaf can have only a
constructible integral model. The global-lisse-lattice subcategory is distinguished; all lisse
rational sheaves belong to it on geometrically unibranch schemes.

F.5–F.8: VanishingCycles.etaleExceptionalInverseImage, VanishingCycles.etaleVerdierDuality,
VanishingCycles.smoothPurity, VanishingCycles.smoothPairGysin, VanishingCycles.etaleGaussBonnet,
VanishingCycles.etaleBlowup, VanishingCycles.etaleWeakLefschetz,
VanishingCycles.fieldPerverseTStructure, VanishingCycles.intermediateExtension.

F.10.2/F.10.2b: VanishingCycles.frobeniusCohomology carries coefficient descent data, first
at finite level, then through normalized realization. F.10.3: PerfectComplex.lefschetzNumber,
PerfectComplex.filteredTraceAdditivity require perfect/filtered enhanced module objects.
F.10.4–F.10.5: VanishingCycles.freeTorsorEquivariantPerfectness and
VanishingCycles.freeTorsorCoefficientDescent use total-complex perfectness over the actual
possibly noncommutative group ring and inverse deck action for right modules. Their proofs
include the noncommutative projection and Tor argument, rather than assuming projectivity of
cohomology or invertibility of the group order.
-/

end TauCetiRoadmap.EtaleCohomologyFoundations

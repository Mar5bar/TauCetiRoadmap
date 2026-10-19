import Mathlib
import TauCeti.AlgebraicGeometry.VectorBundle.Functoriality
import TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Quotient
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Spectral

/-!
# Isocrystals, vector bundles and Banach–Colmez spaces: representative target signatures

The README is the definitive specification. These are suggested forms for a subset of its
mathematics, not an exhaustive checklist. The definitions below bundle existing algebraic and
categorical data; the statements fix the Frobenius, degree and cohomological conventions.
The relative curve, standard blocks, integral models, geometric cohomology, tilted coherent
heart and Banach–Colmez realizations are specified in the README.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject TensorProduct

universe u v w

#check Rat.num
#check Rat.den
#check Rat.den_pos
#check Rat.reduced
#check WittVector.Isocrystal
#check WittVector.IsocrystalHom
#check WittVector.isocrystal_classification
#check TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf
#check TauCeti.FarguesFontaine.spaX
#check TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition

namespace TauCeti.FFBundles

/-! ## Layer VB0: finite general-coefficient isocrystals -/

instance equivInvPair (R : Type u) [CommRing R] (σ : R ≃+* R) :
    RingHomInvPair σ.toRingHom σ.symm.toRingHom := RingHomInvPair.of_ringEquiv σ

instance equivInvPairSymm (R : Type u) [CommRing R] (σ : R ≃+* R) :
    RingHomInvPair σ.symm.toRingHom σ.toRingHom := RingHomInvPair.of_ringEquiv σ.symm

/-! ## Finite general-coefficient isocrystals -/

/-- The specified coefficient automorphism is part of the object type. -/
structure FiniteIsocrystal (L : Type u) [Field L] (σ : L ≃+* L) where
  V : Type u
  [addCommGroup : AddCommGroup V]
  [module : Module L V]
  [finite : Module.Finite L V]
  frobenius : V ≃ₛₗ[σ.toRingHom] V

attribute [instance] FiniteIsocrystal.addCommGroup FiniteIsocrystal.module
  FiniteIsocrystal.finite

namespace FiniteIsocrystal

variable {L : Type u} [Field L] {σ : L ≃+* L}

/-- L-linear maps satisfying the actual Frobenius intertwining equation.
Their additive and E-linear structures use coefficients fixed by σ. They are
not generally an L-vector subspace of the space of L-linear maps. -/
structure Hom (D D' : FiniteIsocrystal L σ) where
  linearMap : D.V →ₗ[L] D'.V
  intertwines : ∀ x, D'.frobenius (linearMap x) = linearMap (D.frobenius x)

/-- A linear equivalence with the intertwining equation, not just an
equivalence of underlying vector spaces. -/
structure Equiv (D D' : FiniteIsocrystal L σ) where
  linearEquiv : D.V ≃ₗ[L] D'.V
  intertwines : ∀ x, D'.frobenius (linearEquiv x) = linearEquiv (D.frobenius x)

/-- Schur's theorem for an irreducible finite isocrystal, over its fixed coefficient field.
The simplicity condition concerns Frobenius-stable subspaces. -/
theorem isocrystalEndDivision {D : FiniteIsocrystal L σ} [Nontrivial D.V]
    (simple : ∀ P : Submodule L D.V,
      (∀ x ∈ P, D.frobenius x ∈ P) → P = ⊥ ∨ P = ⊤)
    (f : Hom D D) (hf : f.linearMap ≠ 0) :
    ∃ g : Hom D D, g.linearMap.comp f.linearMap = LinearMap.id ∧
      f.linearMap.comp g.linearMap = LinearMap.id := by
  sorry

/-- Identity maps give genuine intertwiners. -/
example (D : FiniteIsocrystal L σ) :
    ∃ f : Hom D D, f.linearMap = LinearMap.id := by
  sorry

-- Check: finiteIsocrystal_zero
/-- The rank-zero object is admitted, despite the bijectivity condition. -/
example : ∃ D : FiniteIsocrystal L σ, Module.finrank L D.V = 0 := by
  sorry

-- Check: finiteIsocrystal_requires_bijective
/-- A zero Frobenius on a nonzero field cannot define an isocrystal. -/
example : ¬ Function.Bijective (fun _ : L => (0 : L)) := by
  sorry

/-- Isocrystal equivalences preserve rank and admit an intertwining inverse. -/
example (D D' : FiniteIsocrystal L σ) (e : Equiv D D') :
    Module.finrank L D.V = Module.finrank L D'.V ∧ Nonempty (Equiv D' D) := by
  sorry

end FiniteIsocrystal

namespace FiniteIsocrystal

/-- The Witt specialization retains the supplied semilinear Frobenius on the same carrier. -/
abbrev toWitt (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p]
    (D : FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k)) : WittVector.Isocrystal p k D.V where
  toModule := inferInstance
  frob := D.frobenius

/-- A finite Witt isocrystal gives the general-coefficient bundled carrier. -/
def ofWitt (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] (V : Type u) [AddCommGroup V] [WittVector.Isocrystal p k V]
    [Module.Finite (FractionRing (WittVector p k)) V] :
    FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k) where
  V := V
  frobenius := WittVector.Isocrystal.frobenius p k

end FiniteIsocrystal

-- Check: finiteIsocrystal_witt
/-- The carrier comparison transports CrystallineCohomology §CR.4.7's Witt blocks and
classification through the finite Witt specialization, preserving Frobenius and rank.
The ramified-coefficient and equal-characteristic extensions are specified in VB0. -/
theorem dieudonneManinIsocrystals
    (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] [IsAlgClosed k]
    (D : FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k)) :
    letI := D.toWitt p k
    Nonempty (FiniteIsocrystal.Equiv D (FiniteIsocrystal.ofWitt p k D.V)) ∧
      (WittVector.Isocrystal.frobenius p k : D.V → D.V) = D.frobenius ∧
      Module.finrank (FractionRing (WittVector p k))
        (FiniteIsocrystal.ofWitt p k D.V).V =
          Module.finrank (FractionRing (WittVector p k)) D.V := by
  sorry

-- Check: finiteIsocrystal_unramified_frobenius
/-- A degree-two coefficient extension uses the squared coefficient automorphism. -/
example {L : Type u} [Field L] (σ : L ≃+* L) (a : L) (ha : σ (σ a) ≠ σ a) :
    let D : FiniteIsocrystal L (σ.trans σ) :=
      { V := L, frobenius := (σ.trans σ).toSemilinearEquiv }
    D.frobenius a = σ (σ a) ∧ D.frobenius a ≠ σ a := by
  sorry

-- Check: slopeBlock_wraparound
/-- The second iterate detects coefficient Frobenius as well as the inverse-uniformizer wrap. -/
example {L : Type u} [Field L] (σ : L ≃+* L) {M : Type u}
    [AddCommGroup M] [Module L M] (Φ : M ≃ₛₗ[σ.toRingHom] M)
    (π a : L) (hπ : π ≠ 0) (ha : σ (σ a) ≠ a)
    (e₀ e₁ : M) (he₀ : e₀ ≠ 0) (h₀ : Φ e₀ = e₁) (h₁ : Φ e₁ = π⁻¹ • e₀) :
    Φ (Φ (a • e₀)) = (π⁻¹ * σ (σ a)) • e₀ ∧
      Φ (Φ (a • e₀)) ≠ (π⁻¹ * a) • e₀ := by
  sorry

/-! ## Layer VB1: algebraic Frobenius modules and cohomology -/

/-- This interface is parameterized by the actual ring and its automorphism.
Finite projectivity and an invertible semilinear map express the invertible
Frobenius linearization. The LF topology is not silently added to this carrier. -/
structure RobbaPhiModule (R : Type u) [CommRing R] (φ : R ≃+* R) where
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module R M]
  [finite : Module.Finite R M]
  [projective : Module.Projective R M]
  frobenius : M ≃ₛₗ[φ.toRingHom] M

attribute [instance] RobbaPhiModule.addCommGroup RobbaPhiModule.module
  RobbaPhiModule.finite RobbaPhiModule.projective

namespace RobbaPhiModule

variable {R : Type u} [CommRing R] {φ : R ≃+* R}

structure Hom (M N : RobbaPhiModule R φ) where
  linearMap : M.M →ₗ[R] N.M
  intertwines : ∀ x, N.frobenius (linearMap x) = linearMap (M.frobenius x)

/-- The rank-one trivial Frobenius module, independent of any Bézout theorem. -/
def trivial (R : Type u) [CommRing R] (φ : R ≃+* R) : RobbaPhiModule R φ where
  M := R
  frobenius := φ.toSemilinearEquiv

/-- Scalar extension has the compatible coefficient Frobenius and its inverse on pure tensors. -/
theorem tensorFrobenius (A : Type u) [CommRing A] [Algebra A R] (ψ : A ≃+* A)
    (compatible : ∀ a, φ (algebraMap A R a) = algebraMap A R (ψ a))
    (N : RobbaPhiModule A ψ) :
    ∃ F : (R ⊗[A] N.M) ≃ₛₗ[φ.toRingHom] (R ⊗[A] N.M),
      (∀ r n, F (r ⊗ₜ[A] n) = φ r ⊗ₜ[A] N.frobenius n) ∧
      (∀ r n, F.symm (r ⊗ₜ[A] n) = φ.symm r ⊗ₜ[A] N.frobenius.symm n) := by
  sorry

/-- An integral finite projective model with an intertwining scalar-extension equivalence.
A is the specified integral coefficient ring, with its compatible automorphism ψ. -/
structure GlobalEtaleModel (A : Type u) [CommRing A] [Algebra A R]
    (ψ : A ≃+* A) (D : RobbaPhiModule R φ) where
  compatible : ∀ a, φ (algebraMap A R a) = algebraMap A R (ψ a)
  integral : RobbaPhiModule A ψ
  scalarExtension : R ⊗[A] integral.M ≃ₗ[R] D.M
  intertwines : ∀ r n,
    D.frobenius (scalarExtension (r ⊗ₜ[A] n)) =
      scalarExtension (φ r ⊗ₜ[A] integral.frobenius n)

/-- Global étaleness is existence of the specified integral model. -/
def isGloballyEtale (A : Type u) [CommRing A] [Algebra A R]
    (ψ : A ≃+* A) (D : RobbaPhiModule R φ) : Prop :=
  Nonempty (GlobalEtaleModel A ψ D)

-- Check: robbaPhi_trivial
/-- The trivial integral line extends by multiplication, with inverse r ↦ r ⊗ 1. -/
example (A : Type u) [CommRing A] [Algebra A R] (ψ : A ≃+* A)
    (compatible : ∀ a, φ (algebraMap A R a) = algebraMap A R (ψ a)) :
    ∃ e : R ⊗[A] A ≃ₗ[R] R,
      (∀ r a, e (r ⊗ₜ[A] a) = r * algebraMap A R a) ∧
      (∀ r, e.symm r = r ⊗ₜ[A] (1 : A)) ∧
      (∀ r a, φ (e (r ⊗ₜ[A] a)) = e (φ r ⊗ₜ[A] ψ a)) ∧
      ∃ N : GlobalEtaleModel A ψ (trivial R φ), N.integral = trivial A ψ := by
  sorry

-- Check: robbaPhi_noninvertible
/-- Zero linearization on a nonzero free rank-one module is not invertible. -/
example [Nontrivial R] : ¬ Function.Bijective (0 : R →ₗ[R] R) := by
  sorry

/-- Finite projective modules over an absolute Bézout domain are free. -/
example [IsDomain R] [IsBezout R] (D : RobbaPhiModule R φ) :
    Module.Free R D.M := by
  sorry

/-- Identity maps are morphisms of finite projective Frobenius modules. -/
example (D : RobbaPhiModule R φ) : ∃ f : Hom D D, f.linearMap = LinearMap.id := by
  sorry

end RobbaPhiModule

section FrobeniusCohomology
variable {E : Type u} [Field E] {M : Type u} [AddCommGroup M] [Module E M]

namespace FrobeniusComplex
/-- Degree-zero Frobenius invariants, with the E-linear differential φ − 1. -/
def H0 (φ : M →ₗ[E] M) : Submodule E M := (φ - LinearMap.id).ker
/-- Degree-one Frobenius coinvariants. -/
abbrev H1 (φ : M →ₗ[E] M) : Type u := M ⧸ (φ - LinearMap.id).range

/-- Identity Frobenius gives the full module in both degrees. -/
example : Nonempty (H0 (LinearMap.id : M →ₗ[E] M) ≃ₗ[E] M) ∧
    Nonempty (H1 (LinearMap.id : M →ₗ[E] M) ≃ₗ[E] M) := by
  sorry

/-- The zero module has zero Frobenius cohomology in both degrees. -/
example (φ : (Fin 0 → E) →ₗ[E] (Fin 0 → E)) :
    Subsingleton (H0 φ) ∧ Subsingleton (H1 φ) := by
  sorry
-- Check: frobeniusComplex_double
/-- Twice the identity has invertible differential and vanishing cohomology, in every characteristic. -/
example [Nontrivial M] :
    (2 • (LinearMap.id : M →ₗ[E] M) - LinearMap.id) = LinearMap.id ∧
      H0 (2 • (LinearMap.id : M →ₗ[E] M)) = ⊥ ∧
      Subsingleton (H1 (2 • (LinearMap.id : M →ₗ[E] M))) := by
  sorry

/-- The rank-one nonzero differential has neither invariants nor coinvariants. -/
example : H0 (2 • (LinearMap.id : E →ₗ[E] E)) = ⊥ ∧
    Subsingleton (H1 (2 • (LinearMap.id : E →ₗ[E] E))) := by
  sorry
end FrobeniusComplex
end FrobeniusCohomology

/-! ## Layer VB2: twisted invariants, actions and HN data -/

section TwistedInvariants

variable {E : Type u} [Field E] {M : Type u} [AddCommGroup M] [Module E M]

/-- The algebraic kernel underlying Γ_n. Its Banach topology needs the annular
norm theorem specified in the README; the algebraic construction does not assert it.
The annular checks twistedInvariant_change_radius and twistedInvariant_not_exact_norm
concern those canonical Banach topologies. -/
def TwistedInvariant (φ : M →ₗ[E] M) (π : E) (n : ℤ) : Submodule E M :=
  (φ - (π ^ n) • LinearMap.id).ker

-- Check: twistedInvariant_zero
/-- Every weight space of the zero module is zero. -/
example (φ : (Fin 0 → E) →ₗ[E] (Fin 0 → E)) (π : E) (n : ℤ) :
    Subsingleton (TwistedInvariant φ π n) := by
  sorry

-- Check: twistedInvariant_n_zero
/-- Weight zero agrees with ordinary Frobenius invariants. -/
example (φ : M →ₗ[E] M) (π : E) :
    TwistedInvariant φ π 0 = FrobeniusComplex.H0 φ := by
  sorry

-- Check: twistedInvariant_sign
/-- Multiplication by π has weight +1, fixing the sign of the twist. -/
example (π : E) (hπ : π ≠ 0) (hπ2 : π ^ 2 ≠ 1) :
    TwistedInvariant (π • (LinearMap.id : E →ₗ[E] E)) π 1 = ⊤ ∧
      (π • (LinearMap.id : E →ₗ[E] E) - π⁻¹ • LinearMap.id).ker = ⊥ := by
  sorry
end TwistedInvariants

section ContinuousActions

variable (E R M G : Type u) [Field E] [CommRing R] [Algebra E R]
  [AddCommGroup M] [Module E M] [Module R M] [IsScalarTower E R M]
  [TopologicalSpace M] [Group G] [TopologicalSpace G]

structure ContinuousPhiAction (φ : M ≃ₗ[E] M) where
  coefficients : G →* (R ≃ₐ[E] R)
  action : G →* (M ≃ₗ[E] M)
  semilinear : ∀ (g : G) (a : R) (x : M),
    action g (a • x) = coefficients g a • action g x
  commutes : ∀ (g : G) (x : M), φ (action g x) = action g (φ x)
  continuous : Continuous (fun gx : G × M => action gx.1 gx.2)

/-- The restricted action on every weight space is continuous in its induced topology. -/
theorem ContinuousPhiAction.restrictInvariants_continuous {φ : M ≃ₗ[E] M}
    (A : ContinuousPhiAction E R M G φ) (π : E) (n : ℤ) :
    ∃ ρ : G →* (TwistedInvariant φ.toLinearMap π n ≃ₗ[E]
      TwistedInvariant φ.toLinearMap π n),
      (∀ g x, (ρ g x).val = A.action g x.val) ∧
      Continuous (fun gx : G × TwistedInvariant φ.toLinearMap π n => ρ gx.1 gx.2) := by
  sorry

-- Check: continuousPhiAction_trivial
/-- Trivial coefficient and module actions are jointly continuous and commute with Frobenius. -/
example (φ : M ≃ₗ[E] M) :
    ∃ A : ContinuousPhiAction E R M G φ, A.coefficients = 1 ∧ A.action = 1 := by
  sorry

-- Check: continuousPhiAction_finite
/-- Continuous automorphisms of a finite discrete group give a jointly continuous action. -/
example [Finite G] [DiscreteTopology G] (φ : M ≃ₗ[E] M)
    (c : G →* (R ≃ₐ[E] R)) (ρ : G →* (M ≃ₗ[E] M))
    (semilinear : ∀ g a x, ρ g (a • x) = c g a • ρ g x)
    (commutes : ∀ g x, φ (ρ g x) = ρ g (φ x))
    (continuous : ∀ g, Continuous (ρ g : M → M)) :
    ∃ A : ContinuousPhiAction E R M G φ, A.coefficients = c ∧ A.action = ρ := by
  sorry

-- Check: continuousPhiAction_all_weights
/-- Every integer weight has a continuous action agreeing on underlying vectors. -/
example {φ : M ≃ₗ[E] M} (A : ContinuousPhiAction E R M G φ) (π : E) (n : ℤ) :
    ∃ ρ : G →* (TwistedInvariant φ.toLinearMap π n ≃ₗ[E]
      TwistedInvariant φ.toLinearMap π n),
      (∀ g x, (ρ g x).val = A.action g x.val) ∧
      Continuous (fun gx : G × TwistedInvariant φ.toLinearMap π n => ρ gx.1 gx.2) := by
  exact A.restrictInvariants_continuous E R M G π n

/-- Weight minus one retains both the vector formula and continuity. -/
example {φ : M ≃ₗ[E] M} (A : ContinuousPhiAction E R M G φ) (π : E) :
    ∃ ρ : G →* (TwistedInvariant φ.toLinearMap π (-1) ≃ₗ[E]
      TwistedInvariant φ.toLinearMap π (-1)),
      (∀ g x, (ρ g x).val = A.action g x.val) ∧
      Continuous (fun gx : G × TwistedInvariant φ.toLinearMap π (-1) => ρ gx.1 gx.2) := by
  exact A.restrictInvariants_continuous E R M G π (-1)

/-- Weight zero retains both the vector formula and continuity. -/
example {φ : M ≃ₗ[E] M} (A : ContinuousPhiAction E R M G φ) (π : E) :
    ∃ ρ : G →* (TwistedInvariant φ.toLinearMap π 0 ≃ₗ[E]
      TwistedInvariant φ.toLinearMap π 0),
      (∀ g x, (ρ g x).val = A.action g x.val) ∧
      Continuous (fun gx : G × TwistedInvariant φ.toLinearMap π 0 => ρ gx.1 gx.2) := by
  exact A.restrictInvariants_continuous E R M G π 0

-- Check: continuousPhiAction_requires_commutation
/-- Coordinate swap fails the Frobenius equation for diag(1,a) when a ≠ 1. -/
example (a : E) (ha : a ≠ 1) :
    ¬ ∀ x : Fin 2 → E,
      (fun i : Fin 2 => if i = 0 then x 1 else a * x 0) =
        (fun i : Fin 2 => if i = 0 then a * x 1 else x 0) := by
  sorry
end ContinuousActions

structure HNPolygon where
  pieces : List (ℕ × ℤ)
  positive : ∀ p ∈ pieces, 0 < p.1
  decreasing : pieces.Pairwise (fun a b => (a.2 : ℚ) / a.1 > (b.2 : ℚ) / b.1)

namespace HNPolygon

/-- The empty polygon records the rank-zero object. -/
def zero : HNPolygon where
  pieces := []
  positive := by simp
  decreasing := by simp

def vertices (P : HNPolygon) : List (ℕ × ℤ) :=
  P.pieces.scanl (fun a b => (a.1 + b.1, a.2 + b.2)) (0, 0)

def totalRank (P : HNPolygon) : ℕ := (P.pieces.map Prod.fst).sum
def totalDegree (P : HNPolygon) : ℤ := (P.pieces.map Prod.snd).sum

def slopeMultiplicity (P : HNPolygon) (s : ℚ) : ℕ :=
  ((P.pieces.filter (fun a => (a.2 : ℚ) / a.1 = s)).map Prod.fst).sum

/-- The polygon endpoint records total rank and total degree. -/
theorem endpoint (P : HNPolygon) : P.vertices.getLast! = (P.totalRank, P.totalDegree) := by
  sorry

-- Check: hnPolygon_zero
/-- The empty polygon has a single vertex, zero endpoint and zero slope multiplicities. -/
example : zero.vertices = [(0, 0)] ∧ zero.totalRank = 0 ∧ zero.totalDegree = 0 ∧
    ∀ s, zero.slopeMultiplicity s = 0 := by
  simp [zero, vertices, totalRank, totalDegree, slopeMultiplicity]

-- Check: hnPolygon_half
/-- A half-slope block has horizontal length two. -/
example (P : HNPolygon) (h : P.pieces = [(2, 1)]) :
    P.vertices = [(0, 0), (2, 1)] ∧ P.totalRank = 2 ∧ P.totalDegree = 1 ∧
      P.slopeMultiplicity (1/2) = 2 := by
  sorry

-- Checks: hnPolygon_split, hnPolygon_not_slope_only
/-- Opposite rank-one slopes do not produce a horizontal polygon. -/
example (P : HNPolygon) (h : P.pieces = [(1, 1), (1, -1)]) :
    P.vertices = [(0, 0), (1, 1), (2, 0)] ∧
      P.slopeMultiplicity 1 = 1 ∧ P.slopeMultiplicity 0 = 0 := by
  sorry
end HNPolygon
end TauCeti.FFBundles

namespace TauCeti.BanachColmez

/-! ## Layer VB3: presentations and curvature in a supplied abelian category -/

section Presentations
variable {K : Type u} [Field K]
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Both exact sequences retain their actual arrows, Y and their endpoints. -/
structure BCPresentation (constant : ModuleCat K ⥤ C) (V : ℕ → C) (W : C) where
  dim : ℕ
  V₁ : ModuleCat K
  V₂ : ModuleCat K
  finite₁ : FiniteDimensional K V₁
  finite₂ : FiniteDimensional K V₂
  Y : C
  first : ShortComplex C
  second : ShortComplex C
  firstLeft : first.X₁ ≅ constant.obj V₁
  firstMiddle : first.X₂ ≅ Y
  firstRight : first.X₃ ≅ V dim
  secondLeft : second.X₁ ≅ constant.obj V₂
  secondMiddle : second.X₂ ≅ Y
  secondRight : second.X₃ ≅ W
  firstExact : first.ShortExact
  secondExact : second.ShortExact
namespace BCPresentation
variable {constant : ModuleCat K ⥤ C} {V : ℕ → C} {W : C}
def height (P : BCPresentation constant V W) : ℤ :=
  (Module.finrank K P.V₁ : ℤ) - (Module.finrank K P.V₂ : ℤ)
/-- Stabilization preserves the two exact sequences and their dimension-height data. -/
theorem stabilize [constant.Additive] (P : BCPresentation constant V W) (T : ModuleCat K)
    [FiniteDimensional K T] :
    ∃ Q : BCPresentation constant V W, Q.dim = P.dim ∧ Q.height = P.height ∧
      Module.finrank K Q.V₁ = Module.finrank K P.V₁ + Module.finrank K T ∧
      Module.finrank K Q.V₂ = Module.finrank K P.V₂ + Module.finrank K T := by
  sorry

/-- The additive object has a presentation with zero finite endpoints and height zero. -/
example [constant.Additive] (d : ℕ) :
    ∃ P : BCPresentation constant V (V d), P.dim = d ∧ P.height = 0 := by
  sorry

/-- A common one-dimensional stabilization leaves the height unchanged. -/
example (P Q : BCPresentation constant V W)
    (h₁ : Module.finrank K Q.V₁ = Module.finrank K P.V₁ + 1)
    (h₂ : Module.finrank K Q.V₂ = Module.finrank K P.V₂ + 1) :
    Q.height = P.height := by
  sorry

/-- Equal finite endpoints give height zero, independently of the additive dimension. -/
example (P : BCPresentation constant V W)
    (h : Module.finrank K P.V₁ = Module.finrank K P.V₂) : P.height = 0 := by
  sorry
end BCPresentation
end Presentations

section Curvature
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Finite iterated extensions of the additive generator. -/
inductive AffineClosure (Ga : C) : C → Prop
  | zero : AffineClosure Ga 0
  | iso {X Y : C} : AffineClosure Ga X → (X ≅ Y) → AffineClosure Ga Y
  | step (s : ShortComplex C) : s.ShortExact → AffineClosure Ga s.X₁ →
      (s.X₃ ≅ Ga) → AffineClosure Ga s.X₂
namespace BCCurvature
def positive (Ga W : C) : Prop := ∀ f : W ⟶ Ga, f = 0
def nonnegative (BdRplus W : C) : Prop := ∀ f : W ⟶ BdRplus, f = 0
def affine (Ga W : C) : Prop := AffineClosure Ga W
/-- Powers are the specified finite powers of the period object. -/
def negative (powers : ℕ → C) (W : C) : Prop :=
  ∃ d, ∃ f : W ⟶ powers d, Mono f
/-- BdRplus-modules and their restriction-of-scalars functor are supplied. -/
def nonpositive {D : Type u} [Category.{v} D] (forget : D ⥤ C) (W : C) : Prop :=
  ∃ M : D, ∃ f : W ⟶ forget.obj M, Mono f
theorem iso (Ga BdRplus : C) (powers : ℕ → C)
    {D : Type u} [Category.{v} D] (forget : D ⥤ C) {X Y : C} (e : X ≅ Y) :
    (positive Ga X ↔ positive Ga Y) ∧
    (nonnegative BdRplus X ↔ nonnegative BdRplus Y) ∧
    (affine Ga X ↔ affine Ga Y) ∧
    (negative powers X ↔ negative powers Y) ∧
    (nonpositive forget X ↔ nonpositive forget Y) := by sorry
end BCCurvature
/-- All curvature predicates include the zero object. -/
example (Ga BdRplus : C) (powers : ℕ → C)
    {D : Type u} [Category.{v} D] (forget : D ⥤ C) [Nonempty D] :
    BCCurvature.positive Ga (0 : C) ∧ BCCurvature.nonnegative BdRplus (0 : C) ∧
      BCCurvature.affine Ga (0 : C) ∧ BCCurvature.negative powers (0 : C) ∧
      BCCurvature.nonpositive forget (0 : C) := by
  sorry

/-- The additive generator is affine via its one-step filtration. -/
example (Ga : C) : BCCurvature.affine Ga Ga := by
  sorry

/-- An additive generator with nonzero identity has no strictly positive curvature. -/
example (Ga : C) (h : 𝟙 Ga ≠ 0) : ¬ BCCurvature.positive Ga Ga := by
  sorry

/-- Monomorphisms preserve negative curvature; epimorphisms preserve positive curvature. -/
theorem CurvatureSubquotients (Ga : C) (powers : ℕ → C) {U W Q : C}
    (i : U ⟶ W) [Mono i] (q : W ⟶ Q) [Epi q] :
    (BCCurvature.negative powers W → BCCurvature.negative powers U) ∧
    (BCCurvature.positive Ga W → BCCurvature.positive Ga Q) := by
  sorry
end Curvature

section Filtration
variable {K : Type u} [Field K]
variable {S : Type u} [Category.{v} S]
variable (W : S ⥤ ModuleCat K) (B : ℕ → S ⥤ ModuleCat K)
variable (D : S ⥤ ModuleCat K) (a : S)
/-- Submodule-valued component of the actual subfunctors. -/
structure BCCanonicalFiltration where
  positivePart : Submodule K (W.obj a)
  nonnegativePart : Submodule K (W.obj a)
  nested : positivePart ≤ nonnegativePart
namespace BCCanonicalFiltration
/-- Intersect kernels of *natural VS maps*, not all linear maps at C. -/
def positive : Submodule K (W.obj a) :=
  ⨅ (m : ℕ), ⨅ f : W ⟶ B (m + 1), LinearMap.ker (f.app a).hom
def nonnegative : Submodule K (W.obj a) :=
  ⨅ f : W ⟶ D, LinearMap.ker (f.app a).hom
/-- Natural maps preserve the intersections of kernels defining both parts. -/
example (W' : S ⥤ ModuleCat K) (f : W ⟶ W') :
    (positive W B a).map (f.app a).hom ≤ positive W' B a ∧
    (nonnegative W D a).map (f.app a).hom ≤ nonnegative W' D a := by
  sorry

/-- Identity target maps force both intersections of kernels to be zero. -/
example : positive W (fun _ => W) a = ⊥ ∧ nonnegative W W a = ⊥ := by
  sorry

/-- A zeroth identity target imposes no restriction when all positive targets vanish. -/
example : positive W (fun m => if m = 0 then W else 0) a = ⊤ := by
  sorry

/-- Zero targets impose no kernel restriction. -/
example : positive W (fun _ => 0) a = ⊤ ∧ nonnegative W 0 a = ⊤ := by
  sorry

/-- On a nonzero value, the whole module cannot precede zero in a nested filtration. -/
example [Nontrivial (W.obj a)] :
    ¬ ∃ F : BCCanonicalFiltration W a, F.positivePart = ⊤ ∧ F.nonnegativePart = ⊥ := by
  sorry
end BCCanonicalFiltration
end Filtration

/-! ## Layers VB3–VB4: contracting quotients and the lattice obstruction -/

section Contraction
variable {X : Type u} [TopologicalSpace X] [QuasiSeparatedSpace X]

/-- FS II.2.17, with the restriction of γ to its moved locus supplied as δ.
Generalizations have the orientation y ⤳ x. The orbit relation and quotient topology
are Mathlib's, and ℤ has its discrete topology. Quasiseparatedness together with the
compact-closure hypothesis encodes tautness; AdicSpacesPartII R0.0 supplies local spectrality. -/
theorem ContractingActionLemma (γ : X ≃ₜ X)
    (δ : {x : X // γ x ≠ x} ≃ₜ {x : X // γ x ≠ x})
    (restriction : ∀ x, (δ x).val = γ x.val)
    (locallySpectral : ∀ x : X, ∃ U : Set X,
      x ∈ U ∧ IsOpen U ∧ SpectralSpace U)
    (taut : ∀ U : Set X, IsOpen U → IsCompact U → IsCompact (closure U))
    (chains : ∀ x y z : X, Specializes y x → Specializes z x →
      Specializes y z ∨ Specializes z y)
    (fixedSpectral : SpectralSpace (Function.fixedPoints γ))
    (contracts : ∀ x : X, ∀ U : Set X, IsOpen U → Function.fixedPoints γ ⊆ U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^n) x ∈ U)
    (escapes : ∀ x : {x : X // γ x ≠ x}, ∀ U : Set X, IsOpen U → IsCompact U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^(-(n : ℤ))) x.val ∉ U) :
    IsClosed (Function.fixedPoints γ) ∧
    (∀ x : {x : X // γ x ≠ x}, ∀ n : ℤ, (δ^n) x = x → n = 0) ∧
    Topology.IsClosedEmbedding
      (fun z : {x : X // γ x ≠ x} × ℤ => (z.1, (δ^z.2) z.1)) ∧
    SpectralSpace (Quotient (MulAction.orbitRel (Subgroup.zpowers δ)
      {x : X // γ x ≠ x})) := by
  sorry
end Contraction

section LatticeMonodromy
variable {R Kp V : Type u} [CommRing R] [NormedField Kp] [Algebra R Kp]
variable [NormedAddCommGroup V] [NormedSpace Kp V]
variable [Module R V] [IsScalarTower R Kp V] [Nontrivial V]
/-- A scalar of nonunit norm cannot preserve a bounded spanning lattice. -/
theorem no_bounded_stable_lattice (p : Kp) (hp : p ≠ 0) (hnorm : ‖p‖ ≠ 1) :
    ¬ ∃ N : Submodule R V, Bornology.IsBounded (N : Set V) ∧
      Submodule.span Kp (N : Set V) = ⊤ ∧
      Set.BijOn (fun x : V => p • x) (N : Set V) (N : Set V) := by sorry
end LatticeMonodromy

end TauCeti.BanachColmez

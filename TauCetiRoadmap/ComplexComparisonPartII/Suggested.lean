import Mathlib
import TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic
import TauCeti.Algebra.Category.ModuleCat.Sheaf.Quasicoherent.Monoidal
import TauCeti.Topology.Sheaves.Flasque
import TauCeti.Geometry.Hodge.Structure
import TauCeti.Geometry.Hodge.Conjugation
import TauCeti.Analysis.Complex.HolomorphicSheaf
import TauCeti.Analysis.Complex.Conformal.Montel.Basic
import TauCeti.AlgebraicTopology.Cohomology.Cup
import TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Equiv
import TauCeti.Analysis.Fredholm.CompactPerturbation
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Function

/-!
# ComplexComparisonPartII: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular targets, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

The roadmap compares complex algebraic and complex analytic geometry: coherent analytic modules and
coherent analytification (Layer C0), analytic coherent cohomology (C1), the consequences of
coherent GAGA for projective and proper schemes (C2) and for algebraic spaces (C3), Remmert,
Chow and the algebraization of morphisms, together with scheme compactification over qcqs bases
(C4), the de Rham–Betti comparison with Hodge theory, integration over analytic cycles,
logarithmic structures and regular singular connections (C5), and stratified topology,
Riemann existence and finite/adic Artin comparison (C6).

Most of its carriers are not in Mathlib or Tau Ceti at the pinned commits: complex analytic spaces
with nilpotents, the analytification functor and proper coherent GAGA are built in the
roadmap AlgebraicModuliForArithmeticGeometry (Layer 7, §7.10), and algebraic spaces, compact
complex manifolds with their forms and currents, and global log schemes are not available here.
Statements about them live in `README.md` only; the closing comment of this file lists them.
What is recorded here:

* the library declarations the roadmap consumes, pinned by `#check`;
* light definitions with real bodies that are statable at the pins: the coherent-module category
  over a locally ringed space (C0.1), the Wirtinger operator `∂̄` on `ℂ` and the Cauchy–Green
  transform (C1.1), Grothendieck's order of a differential operator (C5.1),
  chart maps and the intrinsic saturation adapter (C5.5), and the residue-strip and monodromy
  conventions (C5.6);
* end theorems and layer milestones whose carriers exist at the pins: the one-variable Dolbeault
  lemma, Montel's theorem, the Banach case of Schwartz's finiteness theorem, connectedness of
  punctured Riemann surfaces, the pointwise form of the semipositive wedge inequality and the
  Fubini–Study normalisation; scheme compactification objects, dense replacement, Nagata
  existence and common refinements for separated finite-type maps over qcqs bases;
* `example`s fixing every sign and normalisation the README pins with a witness: `∂̄ z̄ = 1`,
  `∮ dz/z = 2πi`, `Δ_Hodge(x₁²) = −2` in `ℝ³`, residue representatives in `0 ≤ Re < 1` and
  monodromy `exp(−2πia)`, `ℕ → ℂ, 1 ↦ 0` for the standard log point, and intrinsic saturation
  for `⟨2, 3⟩ ⊆ ℤ` and `2ℕ ⊆ ℤ`.

Design choices made explicit: analytification of modules is Mathlib's pullback of sheaves of
modules, so coherent modules are `SheafOfModules.IsFinitePresentation` over the structure sheaf;
ordinary connections use CrystallineCohomology CR.1's `Crystalline.Connection` carrier,
with its coefficient-first tensor order; tensor symmetry gives the geometric order `Ω¹ ⊗ E`.
The Leibniz rule makes the shared additive map `k`-linear. Differential operators are `k`-linear
maps with Grothendieck's commutator condition. The ordinary algebraic de Rham core is
DerivedDeRhamCohomology Layer 2's `DeRham.complex` and `DeRham.complexMap`;
`AlgebraicDeRham` sheafifies that core. Algebraic logarithmic structures and differentials use
CrystallineCohomology CR.5:log-algebra and CR.5.1's carriers, with `logAnalytification` as the
analytic transport. The shared log structure maps take values in the
multiplicative monoid, so non-units (`0` included) are allowed; the Hodge Laplacian is the
nonnegative operator, the negative of Mathlib's `Δ = div ∘ grad`.
-/

namespace TauCetiRoadmap.ComplexComparisonPartII

open CategoryTheory AlgebraicGeometry
open scoped TensorProduct ContDiff Manifold Topology

universe u

noncomputable section

/-! Library declarations this roadmap builds on. -/

-- Finitely presented (coherent) sheaves of modules, and local freeness.
#check @SheafOfModules.IsFinitePresentation
#check @SheafOfModules.IsLocallyFree
#check @TauCeti.SheafOfModules.ringCatSheaf
#check @TauCeti.SheafOfModules.isMonoidal_isFinitePresentation
-- The algebraic coherent category of a scheme in Tau Ceti.
#check @TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf
-- Sheaf cohomology as Ext from the constant sheaf, and the Čech complex.
#check @CategoryTheory.Sheaf.H
#check @CategoryTheory.cechComplexFunctor
-- Flasque sheaves are acyclic (used for the small singular cochain resolution, C5.1).
#check @TauCeti.Topology.subsingleton_H_succ_of_isFlasque
-- A flat local homomorphism of local rings is faithfully flat (C0.4).
#check @Module.FaithfullyFlat.of_flat_of_isLocalHom
-- The map on Ext induced by an exact functor (Ext comparison of proper GAGA).
#check @CategoryTheory.Abelian.Ext.mapExactFunctor
-- The abstract pure Hodge structure that C5.3 instantiates.
#check @TauCeti.Hodge.HodgeStructureOn
#check @TauCeti.Hodge.Conjugation
-- The period of `dz/z` (C5.1, C5.7).
#check @circleIntegral.integral_sub_inv_of_mem_ball
-- Complements of countable sets in real dimension `≥ 2` are path connected (model for C4.5).
#check @Set.Countable.isPathConnected_compl_of_one_lt_rank
-- The one-variable holomorphic sheaf on `ℂ` (the `n = 1` case of the analytic structure sheaf).
#check @TauCeti.holomorphicSheaf
-- Montel's theorem on open subsets of `ℂ` (C1.6 states the several-variable case).
#check @TauCeti.montel
-- Singular cohomology and cover-small chains use the pinned constructions.
#check @TopCat.singularCohomology
#check @TopCat.singularCup
#check @TopCat.smallSingularSubcomplex
#check @TauCeti.smallSingularSubdivisionHomotopy
#check @TauCeti.smallSingularChainHomotopyEquiv
-- This finite-kernel case is a supplier, distinct from Schwartz's surjection theorem.
#check @ContinuousLinearMap.IsFredholm.add_of_isCompactOperator
-- Saturation after restriction to the generated group (C5.5).
#check @AddSubmonoid.NSMulSaturated
-- Schematic density, with flat base change, for compactification geometry (C4.3a).
#check @IsSchemeTheoreticallyDominant
#check @IsSchemeTheoreticallyDominant.of_isPullback
-- Semialgebraic carriers for the stratified triangulation target (C6.0).
#check @TauCeti.IsSemialgebraic
#check @TauCeti.IsSemialgebraicOn
#check @TauCeti.IsSemialgebraicMap

/-! ## Layer C0: Coherent analytic modules and coherent analytification -/

section C0

/-- **C0.1, `CoherentAnalyticModule`.** Coherent modules over a locally ringed space whose
structure sheaf is coherent: the full subcategory of sheaves of modules that are finitely
presented. Over a coherent structure sheaf (Oka's theorem, for complex analytic spaces) finite
presentation is equivalent to coherence. -/
abbrev CoherentAnalyticModule (X : LocallyRingedSpace.{u}) : Type _ :=
  ObjectProperty.FullSubcategory
    (SheafOfModules.isFinitePresentation (TauCeti.SheafOfModules.ringCatSheaf X.sheaf))

/-- The underlying sheaf of a coherent module is finitely presented. -/
instance (X : LocallyRingedSpace.{u}) (M : CoherentAnalyticModule X) :
    M.obj.IsFinitePresentation :=
  M.property

/-- The free rank-one object uses the pinned finite-presentation supplier. -/
example (X : LocallyRingedSpace.{u}) :
    (SheafOfModules.unit (TauCeti.SheafOfModules.ringCatSheaf X.sheaf)).IsFinitePresentation := by
  let := TauCeti.SheafOfModules.monoidalCategory X.sheaf
  exact (TauCeti.SheafOfModules.isMonoidal_isFinitePresentation (R := X.sheaf)).prop_unit

end C0

/-! ## Layer C1: Analytic coherent cohomology -/

section C1

open MeasureTheory

/-- **C1.1, the Wirtinger operator** `∂f/∂z̄ = ½(∂f/∂x + i ∂f/∂y)` of a function `ℂ → ℂ`,
computed from the real derivative. Holomorphic functions are exactly the real-differentiable
functions with `dbar f = 0`. -/
def dbar (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  (1 / 2 : ℂ) * (fderiv ℝ f z 1 + Complex.I * fderiv ℝ f z Complex.I)

/-- `∂̄ z = 0`: the coordinate is holomorphic. -/
example (z : ℂ) : dbar (fun w => w) z = 0 := sorry

/-- `∂̄ z̄ = 1`: this fixes the normalisation `½(∂_x + i∂_y)`; the operator `∂_x + i∂_y` would
give `2`, and `½(∂_x − i∂_y)` (the operator `∂/∂z`) would give `0`. -/
example (z : ℂ) : dbar (fun w => (starRingEnd ℂ) w) z = 1 := sorry

/-- **C1.1, the Cauchy–Green transform** `u(z) = (1/π) ∫ g(w)/(z − w) dλ(w)`, the solution
operator of the one-variable `∂̄`-equation for compactly supported `g`. -/
def cauchyGreen (g : ℂ → ℂ) (z : ℂ) : ℂ :=
  (Real.pi : ℂ)⁻¹ * ∫ w : ℂ, g w / (z - w)

/-- The zero right-hand side has zero Cauchy–Green transform. -/
example (z : ℂ) : cauchyGreen (fun _ => 0) z = 0 := by simp [cauchyGreen]

/-- **C1.1, `localDolbeault_oneVariable`.** The base case `n = 1`, `q = 1` of `localDolbeault`:
for a smooth compactly supported `g`, the Cauchy–Green transform is smooth and solves
`∂u/∂z̄ = g` on all of `ℂ`. The README's `localDolbeault` (polydiscs in `ℂⁿ`, all bidegrees,
holomorphic parameters) is proved from this by induction on the number of variables. -/
theorem localDolbeault_oneVariable (g : ℂ → ℂ)
    (hg : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) g) (hc : HasCompactSupport g) :
    ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (cauchyGreen g) ∧ ∀ z, dbar (cauchyGreen g) z = g z := sorry

/-- **C1.6, `montelTheorem`.** On an open subset of a finite-dimensional complex normed space, a
sequence of holomorphic functions that is uniformly bounded on every compact subset has a
subsequence converging locally uniformly, with holomorphic limit. Tau Ceti's `TauCeti.montel` is
the case of an open subset of `ℂ`; the several-variable domain is what the restriction maps
between polydisc charts need. -/
theorem montelTheorem {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E] {Ω : Set E} (hΩ : IsOpen Ω) (f : ℕ → E → ℂ)
    (hf : ∀ n, DifferentiableOn ℂ (f n) Ω)
    (hb : ∀ K ⊆ Ω, IsCompact K → ∃ C : ℝ, ∀ n, ∀ z ∈ K, ‖f n z‖ ≤ C) :
    ∃ (φ : ℕ → ℕ) (g : E → ℂ), StrictMono φ ∧ DifferentiableOn ℂ g Ω ∧
      TendstoLocallyUniformlyOn (fun n => f (φ n)) g Filter.atTop Ω := sorry

/-- **C1.6, `schwartzFiniteness`, Banach case.** A compact perturbation of a continuous linear
surjection between complex Banach spaces has closed range of finite codimension. The README states
the theorem for Fréchet spaces, the generality its coherent-cohomology application needs; this is
its special case for Banach spaces. -/
theorem schwartzFiniteness_banach {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [CompleteSpace E] [NormedAddCommGroup F] [NormedSpace ℂ F] [CompleteSpace F]
    (g h : E →L[ℂ] F) (hg : Function.Surjective g) (hh : IsCompactOperator h) :
    IsClosed (LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F) : Set F) ∧
      FiniteDimensional ℂ (F ⧸ LinearMap.range ((g + h : E →L[ℂ] F) : E →ₗ[ℂ] F)) := sorry

/-- Negative control for `schwartzFiniteness_banach`: compactness of the perturbation is needed.
For `h = −g` on an infinite-dimensional space the range of `g + h` is `0`, whose quotient is not
finite-dimensional. -/
example {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
    (hE : ¬ FiniteDimensional ℂ E) :
    ¬ FiniteDimensional ℂ
      (E ⧸ LinearMap.range (((ContinuousLinearMap.id ℂ E) + (-ContinuousLinearMap.id ℂ E) :
        E →L[ℂ] E) : E →ₗ[ℂ] E)) := sorry

/-! ### C1.2 The sign of the Hodge Laplacian -/

section HodgeLaplacianSign

open Laplacian

/-- The Hodge Laplacian on functions, `Δ_Hodge = δd`, is the negative of Mathlib's Laplacian
`Δ = div ∘ grad` (DifferentialGeometry's `laplaceBeltrami` has the same sign as Mathlib's). -/
def hodgeLaplacianFun {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] (f : E → ℝ) : E → ℝ :=
  -(Δ f)

/-- `HodgeLaplacian.euclideanSign`: in `ℝ³`, `Δ_Hodge(x₁²) = −2`. -/
example (x : EuclideanSpace ℝ (Fin 3)) :
    hodgeLaplacianFun (fun y : EuclideanSpace ℝ (Fin 3) => (y 0) ^ 2) x = -2 := sorry

end HodgeLaplacianSign

end C1

/-! ## Layer C4: Analytic images, Chow algebraization and morphism comparison -/

section C4

/-! ### C4.3a–C4.3c Scheme compactifications -/

/-- **C4.3a, `Compactification`.** A proper factorization with a quasi-compact open interior.
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

/-- **C4.3a, `DenseCompactification`.** The full subcategory with schematically dense interior,
using the existing scheme-theoretic dominance property. -/
abbrev DenseCompactification {X S : Scheme.{u}} (f : X ⟶ S) :=
  ObjectProperty.FullSubcategory
    (fun C : Compactification f => IsSchemeTheoreticallyDominant C.j)

/-- A proper map has the identity compactification. -/
def Compactification.identity {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f] :
    Compactification f := sorry

/-- Pulling back a compactification gives a compactification of the pulled-back map. -/
def Compactification.baseChange {X S S' : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) (g : S' ⟶ S) :
    Compactification (Limits.pullback.snd f g) := sorry

/-- Schematic closure of the open interior gives a dense compactification. -/
def Compactification.denseReplacement {X S : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) : DenseCompactification f := sorry

/-- Dense replacement maps canonically to the original compactification, fixing the interior. -/
def Compactification.denseReplacementMap {X S : Scheme.{u}} {f : X ⟶ S}
    (C : Compactification f) : C.denseReplacement.obj ⟶ C := sorry

/-- Every compactification morphism is proper over the fixed base. -/
theorem Compactification.Hom.proper {X S : Scheme.{u}} {f : X ⟶ S}
    {C D : Compactification f} (h : C ⟶ D) : IsProper h.hom := sorry

/-- **C4.3b, `nagataCompactification`.** A separated finite-type map over a qcqs scheme
admits a schematically dense compactification. Finite type carries quasi-compactness. -/
theorem nagataCompactification {X S : Scheme.{u}} [CompactSpace S] [QuasiSeparatedSpace S]
    (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] :
    Nonempty (DenseCompactification f) := sorry

/-- **C4.3c, `compactificationCommonRefinement`.** Two compactifications admit a dense
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

/-- **C4.5, `puncturedRiemannSurfaceConnected`.** Removing finitely many points from a connected
Riemann surface leaves a path-connected set. The real dimension two matters: the analogue for a
real interval is false (see the example below). -/
theorem puncturedRiemannSurfaceConnected {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace ℂ M] [IsManifold 𝓘(ℂ) ω M] [ConnectedSpace M] {D : Set M} (hD : D.Finite) :
    IsPathConnected Dᶜ := sorry

/-- `P¹ ∖ {0, ∞} ⊇ ℂ ∖ {0}`: the punctured plane is path connected. -/
example : IsPathConnected ({0}ᶜ : Set ℂ) := sorry

/-- Negative control: a real interval minus an interior point is disconnected, so
`puncturedRiemannSurfaceConnected` needs complex dimension one, not real dimension one. -/
example : ¬ _root_.IsConnected ({0}ᶜ : Set ℝ) := sorry

end C4

/-! ## Layer C5: de Rham–Betti comparison, Hodge theory and logarithmic comparison -/

/-! ### C5.1 Differential operators -/

section DifferentialOperators

variable (k : Type*) {A M N : Type*} [CommRing k] [CommRing A] [Algebra k A]
  [AddCommGroup M] [Module A M] [Module k M] [IsScalarTower k A M]
  [AddCommGroup N] [Module A N] [Module k N] [IsScalarTower k A N]

/-- The commutator `[D, a] = D ∘ (a ·) − a · D` of a `k`-linear map with multiplication by
`a ∈ A`. -/
def commutatorWith (a : A) (D : M →ₗ[k] N) : M →ₗ[k] N :=
  D ∘ₗ (a • LinearMap.id) - a • D

/-- **C5.1, `IsDifferentialOperator`** (Grothendieck). A `k`-linear map has order `≤ 0` if it is
`A`-linear, and order `≤ m + 1` if all its commutators with multiplication by elements of `A` have
order `≤ m`. The analytification of such operators is `DifferentialOperatorAnalytification`. -/
def IsDifferentialOperator : ℕ → (M →ₗ[k] N) → Prop
  | 0, D => ∀ (a : A) (x : M), D (a • x) = a • D x
  | m + 1, D => ∀ a : A, IsDifferentialOperator m (commutatorWith k a D)

open Polynomial in
/-- `d/dz` on `ℂ[z]` has order `≤ 1`. -/
example : IsDifferentialOperator ℂ (A := ℂ[X]) 1
    ((Polynomial.derivative (R := ℂ)).restrictScalars ℂ : ℂ[X] →ₗ[ℂ] ℂ[X]) := sorry

open Polynomial in
/-- `DifferentialOperatorAnalytification.nonLinearOverO`: `d/dz` is not `ℂ[z]`-linear
(`D(z · 1) − z D(1) = 1`), so it is not of order `0`. -/
example : ¬ IsDifferentialOperator ℂ (A := ℂ[X]) 0
    ((Polynomial.derivative (R := ℂ)).restrictScalars ℂ : ℂ[X] →ₗ[ℂ] ℂ[X]) := sorry

open Polynomial in
/-- The commutator with the coordinate evaluates to one on the constant polynomial one. -/
example : commutatorWith ℂ (A := ℂ[X]) X
    ((Polynomial.derivative (R := ℂ)).restrictScalars ℂ : ℂ[X] →ₗ[ℂ] ℂ[X]) 1 = 1 := sorry

end DifferentialOperators

/-! ### C5.4 Positivity and the Chern normalisation -/

section Positivity

open scoped ComplexOrder

/-- **C5.4, `semipositiveWedge`, pointwise form.** In top degree `βᵈ / d!` and `αᵈ / d!` are
`det B` and `det A` times the volume form, so the wedge inequality for semipositive `(1,1)`-forms
`0 ≤ β ≤ α` is the determinant inequality for Hermitian matrices `0 ≤ B ≤ A`. -/
theorem det_le_det_of_posSemidef {n : Type*} [Fintype n] [DecidableEq n]
    {A B : Matrix n n ℂ} (hB : B.PosSemidef) (hAB : (A - B).PosSemidef) :
    B.det.re ≤ A.det.re := sorry

/-- The scalar case `α = tω`, `β = sω` with `t ≥ s ≥ 0` in dimension `2`: `s² ≤ t²`. -/
example (s t : ℝ) (hs : 0 ≤ s) (hst : s ≤ t) :
    (Matrix.diagonal (fun _ : Fin 2 => (s : ℂ))).det.re ≤
      (Matrix.diagonal (fun _ : Fin 2 => (t : ℂ))).det.re := sorry

/-- **C5.4, `chernFubiniStudyIntersection`, the normalisation on a line.** In the affine chart
of `P¹`, the normalised Fubini–Study form `(i/2π) ∂∂̄ log(1 + |z|²)` is
`π⁻¹ (1 + |z|²)⁻² dx dy`, and its integral is `1`: `c₁(O(1))` has degree one. -/
theorem fubiniStudy_integral_eq_one :
    ∫ z : ℂ, (Real.pi)⁻¹ * ((1 + ‖z‖ ^ 2) ^ 2)⁻¹ = 1 := sorry

end Positivity

/-! ### C5.5 Chart-level logarithmic structures -/

section LogCharts

/-- **The standard log point** `ℕ → ℂ`, `n ↦ 0ⁿ` (so `1 ↦ 0`): a prelog structure that is not
a log structure; its logification is `ℂˣ × ℕ`. Restricting prelog targets to units would
exclude it. This is the chart map for `LogCrystalline.PrelogRing`, not a log-structure carrier. -/
def standardLogPoint : Multiplicative ℕ →* ℂ :=
  powersHom ℂ 0

/-- The generator of the standard log point maps to `0`, and the unit maps to `1`. -/
example : standardLogPoint (Multiplicative.ofAdd 1) = 0 ∧
    standardLogPoint (Multiplicative.ofAdd 0) = 1 := sorry

/-- **Saturation** of a submonoid `Q` of an abelian group, measured in the subgroup `Q^gp` that
`Q` generates (its group completion): an element `x` of `Q^gp` with `n • x ∈ Q` for some `n > 0`
lies in `Q`. This Mathlib adapter agrees with CrystallineCohomology's
`LogCrystalline.IsSaturatedMonoid` for `Multiplicative Q`; it measures roots in `Q^gp`. -/
def IsSaturatedSubmonoid {G : Type*} [AddCommGroup G] (Q : AddSubmonoid G) : Prop :=
  (Q.comap (AddSubgroup.closure (Q : Set G)).subtype).NSMulSaturated

/-- The submonoid generated by `2` and `3` is not saturated: its group completion contains `1`,
whose double lies in the submonoid although `1` does not. -/
example : ¬ IsSaturatedSubmonoid (AddSubmonoid.closure ({2, 3} : Set ℤ)) := sorry

/-- Saturation is intrinsic: `2ℕ ⊆ ℤ` is a copy of `ℕ` and is saturated, although `2 • 1 ∈ 2ℕ`
and `1 ∉ 2ℕ`; a condition quantifying over all of `ℤ` would wrongly call it unsaturated. -/
example : IsSaturatedSubmonoid (AddSubmonoid.closure ({2} : Set ℤ)) := sorry

end LogCharts

/-! ### C5.6 Residue strips and monodromy -/

section Residues

/-- The representative of `a ∈ ℂ` modulo `ℤ` in the strip `0 ≤ Re < 1`, used for residues of
canonical logarithmic extensions. -/
def residueStripRep (a : ℂ) : ℂ :=
  a - (⌊a.re⌋ : ℂ)

/-- The strip representative lies in `0 ≤ Re < 1` and differs from `a` by an integer. -/
theorem residueStripRep_mem (a : ℂ) :
    0 ≤ (residueStripRep a).re ∧ (residueStripRep a).re < 1 ∧
      ∃ n : ℤ, residueStripRep a = a - n := sorry

/-- `CanonicalLogExtension.tensorCarry`: residues `3/4` and `3/4` add to `3/2`, whose strip
representative is `1/2`; the canonical extension is not an unadjusted tensor functor. -/
example : residueStripRep (3 / 4 + 3 / 4) = 1 / 2 := sorry

/-- The monodromy `exp(−2πia)` along the positive loop of the rank-one connection
`d + a dz/z` (equivalently, of a logarithmic extension with residue `a`). -/
def localMonodromy (a : ℂ) : ℂ :=
  Complex.exp (-2 * Real.pi * Complex.I * a)

/-- Monodromy depends only on the residue modulo `ℤ`. -/
theorem localMonodromy_add_int (a : ℂ) (n : ℤ) : localMonodromy (a + n) = localMonodromy a :=
  sorry

/-- `CanonicalLogExtension.rankOne`: residue `1/2` has monodromy `−1`; the sign of the exponent is
invisible here and fixed by the next example. -/
example : localMonodromy (1 / 2) = -1 := sorry

/-- The sign convention `exp(−2πia)`: residue `1/4` has monodromy `−i`, not `i`. -/
example : localMonodromy (1 / 4) = -Complex.I := sorry

end Residues

/-! ### C5.1, C5.7 The period of `dz/z` -/

/-- `HolomorphicDeRham.torusPeriod`: the positively oriented unit circle gives `∮ dz/z = 2πi`. -/
example : (∮ z in C(0, 1), z⁻¹) = 2 * Real.pi * Complex.I := sorry

end

/-!
## Further targets in the README

The analytic spaces, global forms and sheaf constructions below are mathematical targets in
`README.md`, which states their exact hypotheses. Their carriers require those constructions;
the supporting presentation, curvature and Wirtinger APIs are also specified there.

* **Complex analytic spaces and analytification** (AlgebraicModuliForArithmeticGeometry §7.10):
  `CoherentAnalyticModule` on analytic spaces, `coherentOperations`, `CoherentAnalyticIdeal`,
  `holomorphicBundleDictionary` (model fibre `Fin r → ℂ` at each fixed rank, and gluing on
  clopen rank strata for locally constant ranks), `CoherentAnalytification`, `coherentAnalytification_faithful`,
  `coherentPullbackOperations`, `HigherImageComparison`, `fibreDimensionLoci`;
  `StronglyOneComplete`, `cartanTheoremB`, `cartanSerreFiniteness`, `projectiveLerayCover`,
  `AnalyticTwist`, `analyticTwistCohomology`, `analyticSerreGeneration`,
  `analyticSerreVanishing`, `twistPresentations`; `gagaBaseChange`,
  `projectiveGeometricDictionaries`; `remmertProperImage`, `remmertSteinExtension`,
  `projectiveChowNonreduced`, `properSupportAlgebraization`, `properSourceMorphismAlgebraicity`,
  `algebraicGraphRegular`, `familyMorphismInterface`, `affineCurveCompletionInterface`,
  `affineCurveConnectedness`; `DifferentialOperatorAnalytification`, `boundedOperatorHyperGaga`,
  `properDeRhamBetti`, `relativeDeRhamBetti`, `deligneRiemannHilbert`,
  `regularSingularDeRhamComparison`, `properLogGagaMonodromy`.
* **Algebraic spaces and their derived categories:** `analyticEtaleDescent`,
  `SpaceCoherentAnalytification`, `spaceQuasiCoherator` (on AlgebraicModuliForArithmeticGeometry's
  `spaceDQCoh`), `pseudoCoherenceDetection`, `derivedGagaProperSpace`.
* **Forms, metrics and currents on complex manifolds** (DifferentialGeometry's forms are not in the
  library at the pins): `localDolbeault` in several variables, `HodgeStar`, `HodgeLaplacian`,
  `kaehlerIdentities`, `ChernConnection`, `bochnerKodaira`, `weightedDolbeaultEstimate`,
  `HolomorphicDeRham`, `holomorphicPoincare`, `relativePoincare`, `compactEllipticHodge`
  (operator-dependent shifted coercivity, graph-norm regularity and the original operator's kernel),
  `HarmonicGreen`, `kaehlerHodgeDecomposition`, `closedCurrentExtension`,
  `AnalyticCycleIntegration`, `semipositiveWedge` on analytic sets, `lelongPoincareSection`,
  `chernFubiniStudyIntersection` in general, `dghIntegrationApplication`.
* **Singular cohomology with coefficients** (AlgebraicTopology, Stage 6): `SmallSingularCochains`,
  `sheafSingularComparison`, `multiplicativePeriodInterface`, `relativeBettiLocalSystem`; and
  `ehresmannFibration` (DifferentialGeometry flows, Layer 3).
* **Stratified topology and finite/adic comparison** (C6): `complexAlgebraicTopology` uses
  the pinned semialgebraic carriers and builds compatible triangulations on the underlying
  space of `complexSchemeAnalytification`; `topologicalCoefficientComparison` adds local-system
  and stratified cochains and locally compact Hausdorff proper supports to C5.1's constant
  ordinary comparison. `riemannExistence` compares finite-cover categories for all finite-type
  complex schemes. `artinComparison`, `artinComparisonCompactSupport` and
  `relativeArtinComparison` give the canonical ctf exchanges, using
  LefschetzPencilsAndVanishingCycles F.0–F.3 and ClassicalAdicEtaleCohomology's enhancement.
  `adicArtinComparison` uses F.4's normalized étale systems and builds their topological
  derived-complete realization and rationalization. These analytic, triangulated and enhanced
  coefficient carriers are specified in the README; ordinary comparison admits nonseparated
  schemes, compact support requires separatedness, and the relative theorem glues over affine
  base opens. No separate analytification or étale adic category is defined here.
* **Wirtinger derivative API:** `dbar.eq_zero_iff` is the real-differentiable
  characterization in C1.1.
* **Coherent local presentations and sheaf connections:**
  `CoherentAnalyticModule.presentation_iff` and `CoherentAnalyticModule.hom_ext` are the
  analytic coherence and cover-restriction statements of C0.1;
  C5.2 sheafifies `Crystalline.Connection` and uses `Crystalline.Connection.curvature`,
  `.extend`, `.deRhamComplex`, `.tensor`, `.hom` and `.baseChange` from CrystallineCohomology CR.1.
  On affines its map takes values in `M ⊗ Ω¹`, and tensor symmetry gives the displayed geometric
  order `Ω¹ ⊗ M`; extension uses `DeRham.complex`, not a second de Rham differential.
* **Global de Rham, Hodge and log theory on schemes:** `AlgebraicDeRham`, `GaussManin`,
  `properPureHodge`, `relativeHodgeBundles`, `RegularSingular`, `CanonicalLogExtension`,
  `CurveLogComplex`, `curveResidueLocalization`; the sheaf-level `PrelogStructure`, `LogStructure`,
  `AssociatedLog`, `LogPullback`, `FineLogChart`, `DivisorialLog`, `LogSmooth`, `logChartCriterion`,
  `LogDeRham`, `logAnalytification`, `logDifferentialTransitivitySplit`. The algebraic prefix
  uses CrystallineCohomology CR.5:log-algebra.1–.4's `LogCrystalline.PrelogRing`,
  `LogCrystalline.PrelogRing.IsLog`, `LogCrystalline.LogStructure`,
  `LogCrystalline.IsFineMonoid`, `LogCrystalline.IsSaturatedMonoid`,
  `LogCrystalline.IsLogSmooth`, `LogCrystalline.divisorialLog`, and CR.5.1's
  `LogCrystalline.logDifferentials` and `LogCrystalline.logDeRham`. Their complex-specialized
  aliases and analytic adapters use the shared quotient's base-monoid relations and first-factor
  residue convention. `AlgebraicDeRham` restricts on `Spec A` to DerivedDeRhamCohomology Layer 2's
  `DeRham.complex k A`; restrictions and pullbacks use `DeRham.complexMap` and `DeRham.pullback`.
-/

end TauCetiRoadmap.ComplexComparisonPartII

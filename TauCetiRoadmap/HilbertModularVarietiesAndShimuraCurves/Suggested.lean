import Mathlib
import TauCeti.NumberTheory.NumberField.TotallyPositive
import TauCeti.Algebra.Quaternion.NormForm
import TauCeti.AlgebraicTopology.LocalCoefficient

/-!
# HilbertModularVarietiesAndShimuraCurves: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures that can be
stated against the pinned Mathlib and Tau Ceti; it is not exhaustive. Every definition has a real
body, and the theorems are the layer milestones whose carriers exist at the pins.

Design choices made explicit here:
* the polarization lattice `L_c` is a submodule of `F × F` built from Mathlib's fractional ideals
  and `FractionalIdeal.dual`, with no generator of `c` chosen;
* the trace forms are a family indexed by the parameter `a`, rational-valued on `F × F`, with
  integrality on `L_c` a theorem;
* the unit-square quotients `Δ(M)` are quotients of an arbitrary subgroup `P` of the integer units,
  specialized to Tau Ceti's totally positive integer units;
* the full-level action is `α ↦ α ∘ adj(γ)`, a left action because adjugation reverses products;
* the Taylor–Wiles diamond factor is the quotient by `N`-torsion, not by `N`-th powers;
* the residual Hecke ideal is the kernel of an explicit evaluation, and descent to an acting quotient
  is a theorem under an explicit relation hypothesis.

Moduli spaces, integral models, formal and rigid spaces, adelic form spaces, Galois representations
and étale cohomology have no carriers at the pins; they are README targets only.
-/

open scoped NumberField nonZeroDivisors

namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

/-! ## Layer H0: integral Hilbert data and trace lattices -/

section Lattices

variable (F : Type*) [Field F] [NumberField F]

/-- Fractional ideals of the ring of integers of `F`. -/
abbrev HilbertFractionalIdeal := FractionalIdeal (𝓞 F)⁰ F

/-- The trace dual `𝔡⁻¹` of `𝓞 F`, as Mathlib's `FractionalIdeal.dual`. -/
noncomputable abbrev inverseDifferent : HilbertFractionalIdeal F :=
  FractionalIdeal.dual ℤ ℚ (1 : HilbertFractionalIdeal F)

/-- The polarization lattice `L_c = O ⊕ c⁻¹𝔡⁻¹ ⊂ F × F`, in the row convention.
No generator of `c` is chosen, so the definition applies to nonprincipal `c`. -/
noncomputable def polarizationLattice (c : HilbertFractionalIdeal F) :
    Submodule (𝓞 F) (F × F) :=
  ((1 : HilbertFractionalIdeal F) : Submodule (𝓞 F) F).prod
    ((c⁻¹ * inverseDifferent F : HilbertFractionalIdeal F) : Submodule (𝓞 F) F)

/-- `L_c` is projective of rank two over `O` and free of rank `2g` over `ℤ`. -/
theorem polarizationLattice_rank (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    Module.Projective (𝓞 F) (polarizationLattice F c) ∧
      Module.Free ℤ (polarizationLattice F c) ∧
      Module.finrank ℤ (polarizationLattice F c) = 2 * Module.finrank ℚ F := by
  sorry

/-- The trace forms `ψ_a(x, y) = Tr_{F/ℚ}(a (x₁ y₂ − x₂ y₁))` on `F × F`. Their restriction
to `L_c` is `ℤ`-valued for `a ∈ c` (`integralTraceFamily_integral`); they form a family
parametrized by `a`, not a single canonical symplectic form. -/
noncomputable def integralTraceFamily (a : F) (x y : F × F) : ℚ :=
  Algebra.trace ℚ F (a * (x.1 * y.2 - x.2 * y.1))

/-- Integrality on the polarization lattice for parameters in `c`. -/
theorem integralTraceFamily_integral (c : HilbertFractionalIdeal F) (hc : c ≠ 0) (a : F)
    (ha : a ∈ c) (x y : F × F) (hx : x ∈ polarizationLattice F c)
    (hy : y ∈ polarizationLattice F c) :
    ∃ n : ℤ, integralTraceFamily F a x y = n := by
  sorry

/-- The trace-alternating dual of an `O`-lattice in `F × F`, as a set. -/
def traceAlternatingDual (L : Submodule (𝓞 F) (F × F)) : Set (F × F) :=
  {x | ∀ y ∈ L, ∃ z : ℤ, Algebra.trace ℚ F (x.1 * y.2 - x.2 * y.1) = z}

/-- Layer H0 milestone: the dual of `L_c` for `ψ_{c,1}` is `c ⊕ 𝔡⁻¹ = c L_c`. -/
theorem lattice_duality (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    traceAlternatingDual F (polarizationLattice F c) =
      (((c : Submodule (𝓞 F) F).prod
        ((inverseDifferent F : HilbertFractionalIdeal F) : Submodule (𝓞 F) F) :
          Submodule (𝓞 F) (F × F)) : Set (F × F)) := by
  sorry

end Lattices

-- `lattice_Q`: over `ℚ` with `c = 1` the lattice is `ℤ²`.
example (x : ℚ × ℚ) :
    x ∈ polarizationLattice ℚ 1 ↔ (∃ a : ℤ, (a : ℚ) = x.1) ∧ (∃ b : ℤ, (b : ℚ) = x.2) := by
  sorry

-- `traceFamily_Q`: over `ℚ` with `a = 1` the standard basis vectors pair to `1`.
example : integralTraceFamily ℚ 1 (1, 0) (0, 1) = 1 := by
  simp [integralTraceFamily]

-- The h(i)-matrix of README H0.0 sends the first column vector to minus the second.
example : integralTraceFamily ℚ 1 (1, 0) (0, -1) = -1 := by
  simp [integralTraceFamily]

-- `traceFamily_zero`: the parameter `a = 0` gives the zero form, which is degenerate.
example (x y : ℚ × ℚ) : integralTraceFamily ℚ 0 x y = 0 := by
  simp [integralTraceFamily]

-- `stabilizer_nonunit`: adelic invertibility and integral entries do not imply lattice equality.
example : Matrix.det !![(2 : ℤ), 0; 0, 1] = 2 ∧ ¬ IsUnit (2 : ℤ) := by
  norm_num [Matrix.det_fin_two, Int.isUnit_iff]

/-! ## Layer H3: polarization quotients and Hilbert Hecke maps -/

section Units

variable (F : Type*) [Field F] [NumberField F]

/-- `U_M`: the units congruent to `1` modulo the ideal `M`. -/
def congruenceUnits (M : Ideal (𝓞 F)) : Subgroup (𝓞 F)ˣ :=
  (Units.map (Ideal.Quotient.mk M).toMonoidHom).ker

theorem mem_congruenceUnits (M : Ideal (𝓞 F)) (u : (𝓞 F)ˣ) :
    u ∈ congruenceUnits F M ↔ (u : 𝓞 F) - 1 ∈ M := by
  sorry

/-- The level ideal `M O` of a natural number `M`. -/
abbrev integerLevelIdeal (M : ℕ) : Ideal (𝓞 F) := Ideal.span {(M : 𝓞 F)}

variable (P : Subgroup (𝓞 F)ˣ)

/-- `S_M ∩ P`: squares of units congruent to `1` modulo `M`, inside a subgroup `P`
(in the Hilbert case `P = U⁺`). Square roots need not lie in `P`. -/
def congruenceUnitSquares (M : ℕ) : Subgroup P :=
  ((congruenceUnits F (integerLevelIdeal F M)).map (powMonoidHom 2)).subgroupOf P

/-- The tame polarization group `Δ(M) = P / S_M`. -/
abbrev TamePolarizationGroup (M : ℕ) := P ⧸ congruenceUnitSquares F P M

/-- The quotient map `P → Δ(M)`. -/
def tameDelta_mk (M : ℕ) : P →* TamePolarizationGroup F P M :=
  QuotientGroup.mk' _

theorem tameDelta_eq (M : ℕ) (u v : P) :
    tameDelta_mk F P M u = tameDelta_mk F P M v ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F M) ∧
        (u : (𝓞 F)ˣ) * (v : (𝓞 F)ˣ)⁻¹ = η ^ 2 := by
  sorry

theorem tameDelta_lift (M : ℕ) {J : Type*} [Group J] (f : P →* J)
    (hf : ∀ u ∈ congruenceUnitSquares F P M, f u = 1) :
    ∃! fbar : TamePolarizationGroup F P M →* J, fbar.comp (tameDelta_mk F P M) = f := by
  sorry

/-- Layer H3 milestone: `Δ(M)` is finite for `M ≥ 1`. At `M = 0` it is the whole of `P`,
which is infinite as soon as `F` has positive unit rank. -/
theorem tamePolarizationGroup_finite (M : ℕ) (hM : 1 ≤ M) :
    Finite (TamePolarizationGroup F P M) := by
  sorry

/-- The Hilbert case `P = U⁺`, with Tau Ceti's totally positive integer units. -/
abbrev HilbertTamePolarizationGroup (M : ℕ) :=
  TamePolarizationGroup F (NumberField.totallyPositiveIntegerUnits (K := F)) M

/-! ## Layer H4: full levels, effective actions and connected limits -/

-- `scalarKernel_collision`: a residue scalar may have a different tame-congruent lift.
example : (-1 : ZMod 2) = 1 ∧ (-1 : ZMod 5) ≠ 1 := by decide

-- `scalarKernel_tame`: the same scalar is distinguishable at the odd wild prime.
example : (-1 : ZMod 3) ≠ 1 := by decide

/-- `U_{p^n} ∩ P`, the units of the connected unit tower at `p^n`. -/
def connectedCongruenceUnits (p n : ℕ) : Subgroup P :=
  (congruenceUnits F (integerLevelIdeal F (p ^ n))).subgroupOf P

/-- The denominator `S_{p^n N}` inside the connected units. -/
def connectedSquareDenominator (p n N : ℕ) : Subgroup (connectedCongruenceUnits F P p n) :=
  (congruenceUnitSquares F P (p ^ n * N)).comap (connectedCongruenceUnits F P p n).subtype

/-- `Δ_n(N) = (U_{p^n} ∩ P) / S_{p^n N}`. -/
abbrev ConnectedPolarizationGroup (p n N : ℕ) :=
  connectedCongruenceUnits F P p n ⧸ connectedSquareDenominator F P p n N

theorem connectedDelta_eq (p n N : ℕ) (u v : connectedCongruenceUnits F P p n) :
    (QuotientGroup.mk u : ConnectedPolarizationGroup F P p n N) = QuotientGroup.mk v ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F (p ^ n * N)) ∧
        ((u : P) : (𝓞 F)ˣ) * ((v : P) : (𝓞 F)ˣ)⁻¹ = η ^ 2 := by
  sorry

/-- The residue ring `O / p^n O` of the finite levels. -/
abbrev HilbertResidueRing (p n : ℕ) := (𝓞 F) ⧸ integerLevelIdeal F (p ^ n)

/-- The finite `Γ₀(p^m)` level inside `GL₂(O / p^n)`: lower-left entry divisible by `p^m`. -/
def HilbertFiniteGamma0 (p m n : ℕ) :
    Subgroup (Matrix.GeneralLinearGroup (Fin 2) (HilbertResidueRing F p n)) where
  carrier := {γ | (γ : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈
    Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)}}
  one_mem' := by simp
  mul_mem' := by
    intro a b ha hb
    change (↑(a * b) : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)}
    change (a : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)} at ha
    change (b : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)} at hb
    rw [Matrix.GeneralLinearGroup.coe_mul, Matrix.mul_apply, Fin.sum_univ_two]
    exact Ideal.add_mem _ (Ideal.mul_mem_right _ _ ha) (Ideal.mul_mem_left _ _ hb)
  inv_mem' := by
    intro a ha
    change (↑(a⁻¹) : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)}
    change (a : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)} at ha
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.smul_apply, Matrix.adjugate_fin_two]
    simp only [Matrix.of_apply, Matrix.cons_val_one, Matrix.cons_val_zero,
      smul_eq_mul]
    exact Ideal.mul_mem_left _ _ (neg_mem ha)

end Units

-- `delta_Q`: over `ℚ` the totally positive integer units are trivial, so every `Δ(M)` is.
example (M : ℕ) : Subsingleton (HilbertTamePolarizationGroup ℚ M) := by
  sorry

-- `delta_square`: a square of a congruence unit is trivial in `Δ(M)`, even when its square
-- root is not totally positive.
example (F : Type*) [Field F] [NumberField F] (M : ℕ) (η : (𝓞 F)ˣ)
    (hη : η ∈ congruenceUnits F (integerLevelIdeal F M)) :
    tameDelta_mk F (NumberField.totallyPositiveIntegerUnits (K := F)) M
      ⟨η ^ 2, NumberField.sq_mem_totallyPositiveIntegerUnits η⟩ = 1 := by
  sorry

-- `gamma0_m0`: exponent zero imposes no condition.
example (F : Type*) [Field F] [NumberField F] (p n : ℕ) : HilbertFiniteGamma0 F p 0 n = ⊤ := by
  sorry

section AdjugateAction

variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]

/-- The full-level action `γ · α = α ∘ adj(γ)` on frames `α : R² → M`. -/
def adjugateFrameAction (γ : Matrix.GeneralLinearGroup (Fin 2) R)
    (α : (Fin 2 → R) →ₗ[R] M) : (Fin 2 → R) →ₗ[R] M :=
  α.comp (Matrix.mulVecLin (Matrix.adjugate (γ : Matrix (Fin 2) (Fin 2) R)))

/-- Adjugation reverses products, so this is a left action. -/
theorem adjugate_level_action (γ δ : Matrix.GeneralLinearGroup (Fin 2) R)
    (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction γ (adjugateFrameAction δ α) = adjugateFrameAction (γ * δ) α := by
  sorry

theorem adjugateFrameAction_one (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction 1 α = α := by
  sorry

/-- Scalars act through multiplication by the scalar. -/
theorem adjugateFrameAction_scalar (u : Rˣ) (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction (Matrix.GeneralLinearGroup.scalar (Fin 2) u) α = (u : R) • α := by
  sorry

end AdjugateAction

-- Right multiplication without adjugation is not a left action:
-- `u = [[1,1],[0,1]]`, `v = [[1,0],[1,1]]` do not commute.
example : (!![1, 1; 0, 1] * !![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ) ≠
    !![1, 0; 1, 1] * !![1, 1; 0, 1] := by
  decide

/-! ## Layer R18.5, part 1: local Drinfeld geometry and auxiliary PEL factors -/

section Drinfeld

open scoped LinearAlgebra.Projectivization

/-- The `C`-points `P¹(C) ∖ P¹(K)` of the Drinfeld half-plane `Ω_K`. Only the point set is
typed here; the rigid analytic open and its affinoid exhaustion are README targets. -/
def DrinfeldHalfPlane.points (K C : Type*) [Field K] [Field C] [Algebra K C] :
    Set (ℙ C (Fin 2 → C)) :=
  {x | ∀ (v : Fin 2 → K) (hv : (fun i => algebraMap K C (v i)) ≠ 0),
    x ≠ Projectivization.mk C (fun i => algebraMap K C (v i)) hv}

/-- In the affine chart the points of `Ω_K` are the elements of `C` outside `K`. -/
theorem DrinfeldHalfPlane.affineChart (K C : Type*) [Field K] [Field C] [Algebra K C] (z : C)
    (h : (![z, 1] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![z, 1] h ∈ DrinfeldHalfPlane.points K C ↔
      z ∉ Set.range (algebraMap K C) := by
  sorry

-- `DrinfeldHalfPlane.infinity`: the point at infinity is `K`-rational, hence removed.
example (K C : Type*) [Field K] [Field C] [Algebra K C] (h : (![1, 0] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![1, 0] h ∉ DrinfeldHalfPlane.points K C := by
  sorry

-- `DrinfeldExhaustion.residueTwo`: for `k = 𝔽₂` a vertex of the tree has three edges.
example (k : Type*) [Field k] [Fintype k] (hk : Fintype.card k = 2) :
    Nat.card (ℙ k (Fin 2 → k)) = 3 := by
  sorry

end Drinfeld

/-- The paired half-height labels `Λ = {(a, b) ∈ ℤ² : 2 ∣ a + b}` of the auxiliary PEL local
factor: neither all of `ℤ²` nor only the diagonal. -/
def PelHeightLattice : AddSubgroup (ℤ × ℤ) where
  carrier := {p | (2 : ℤ) ∣ p.1 + p.2}
  zero_mem' := by
    change (2 : ℤ) ∣ 0 + 0
    omega
  add_mem' := by
    rintro ⟨a, b⟩ ⟨c, d⟩ h₁ h₂
    change (2 : ℤ) ∣ a + b at h₁
    change (2 : ℤ) ∣ c + d at h₂
    change (2 : ℤ) ∣ (a + c) + (b + d)
    omega
  neg_mem' := by
    rintro ⟨a, b⟩ h
    change (2 : ℤ) ∣ a + b at h
    change (2 : ℤ) ∣ -a + -b
    omega

namespace PelHeightLattice

theorem mem (p : ℤ × ℤ) : p ∈ PelHeightLattice ↔ (2 : ℤ) ∣ p.1 + p.2 := Iff.rfl

/-- The quaternionic heights embed diagonally. -/
def diagonal (m : ℤ) : ℤ × ℤ := (m, m)

/-- The difference character `(a, b) ↦ (a − b) / 2`, used only on labels in `Λ`. -/
def difference (p : ℤ × ℤ) : ℤ := (p.1 - p.2) / 2

/-- `Λ` modulo the diagonal is one copy of `ℤ`, through the difference character. -/
theorem difference_contract :
    (∀ a b : ℤ × ℤ, a ∈ PelHeightLattice → b ∈ PelHeightLattice →
      difference (a + b) = difference a + difference b) ∧
      Function.Surjective (fun p : {p : ℤ × ℤ // p ∈ PelHeightLattice} => difference p.1) ∧
      (∀ p : ℤ × ℤ, p ∈ PelHeightLattice → (difference p = 0 ↔ p.1 = p.2)) ∧
      (∀ m : ℤ, diagonal m ∈ PelHeightLattice) ∧ Function.Injective diagonal := by
  sorry

-- `PelHeightLattice.oddPair`: an unconstrained pair is not a label.
example : (1, 0) ∉ PelHeightLattice := by
  rw [mem]; decide

-- `PelHeightLattice.oppositePair`: a label off the diagonal, with difference one.
example : (1, -1) ∈ PelHeightLattice ∧ difference (1, -1) = 1 := by
  refine ⟨by rw [mem]; decide, by decide⟩

-- `PelHeightLattice.translation`: the descent shift moves both labels.
example : (2, 0) ∈ PelHeightLattice ∧ (2, -1) ∉ PelHeightLattice := by
  refine ⟨by rw [mem]; decide, by rw [mem]; decide⟩

end PelHeightLattice

/-- Strict separation of vertex charts: every nonidentity element moves every vertex a tree
distance greater than two. `move` is the action and `d` the edge distance. -/
def VeryFreeChartAction {G V : Type*} [Group G] (move : G → V → V) (d : V → V → ℕ) : Prop :=
  ∀ g : G, g ≠ 1 → ∀ v : V, 2 < d v (move g v)

namespace VeryFreeChartAction

end VeryFreeChartAction

-- `VeryFreeChartAction.translationThree`: translation by three on the integer line.
example : VeryFreeChartAction (fun (n : Multiplicative ℤ) (v : ℤ) => v + 3 * n.toAdd)
    (fun v w => (v - w).natAbs) := by
  sorry

-- `VeryFreeChartAction.translationTwo`: free on vertices, but the charts are not separated.
example : ¬ VeryFreeChartAction (fun (n : Multiplicative ℤ) (v : ℤ) => v + 2 * n.toAdd)
    (fun v w => (v - w).natAbs) := by
  sorry

/-! ## Layer R18.2, part 2: integral quaternionic models and Hodge comparisons -/

/-- The archimedean norm `‖dz‖ = 2 Im z` of the quaternionic Hodge line at `z ∈ ℍ`. -/
def QuaternionHodgeLine.metric (z : ℂ) : ℝ := 2 * z.im

-- `QuaternionHodgeLine.imaginaryUnit`
example : QuaternionHodgeLine.metric Complex.I = 2 := by
  simp [QuaternionHodgeLine.metric]

/-! ## Layer R18.3, part 1: definite forms, transfer and auxiliary levels -/

section Weights

/-- `Sym^{k−2}(O²)` as homogeneous polynomials of degree `k − 2` in two variables. -/
abbrev SymWeight (O : Type*) [CommRing O] (k : ℕ) : Submodule O (MvPolynomial (Fin 2) O) :=
  MvPolynomial.homogeneousSubmodule (Fin 2) O (k - 2)

/-- The underlying module of parallel weight `k` over `d` embeddings, `⨂ Sym^{k−2}(O²)`. -/
abbrev QuaternionWeight (O : Type*) [CommRing O] (d k : ℕ) : Type _ :=
  PiTensorProduct O (fun _ : Fin d => SymWeight O k)

theorem QuaternionWeight.rank (O : Type*) [CommRing O] [Nontrivial O] (d k : ℕ) (hk : 2 ≤ k) :
    Module.finrank O (QuaternionWeight O d k) = (k - 1) ^ d := by
  sorry

-- `QuaternionWeight.quadraticWeightFour`: degree two and weight four give rank nine.
example (O : Type*) [CommRing O] [Nontrivial O] :
    Module.finrank O (QuaternionWeight O 2 4) = 9 := by
  sorry

end Weights

/-- The value at division valuation `n` of a parity character, once a central-compatible root
`r` with `r² = ψ(Nrd Π)⁻¹` has been chosen. -/
def divisionCharacterValue {R : Type*} [CommRing R] (r : Rˣ) (n : ℤ) : Rˣ := r ^ n

-- A nontrivial central character needs the root `1/2`, not a sign.
example :
    (divisionCharacterValue (Units.mk0 (1 / 2 : ℚ) (by norm_num)) 2 : ℚ) = 1 / 4 := by
  norm_num [divisionCharacterValue]

example : (divisionCharacterValue (1 : ℚˣ) 2 : ℚ) ≠ 1 / 4 := by
  norm_num [divisionCharacterValue]

/-- The `N`-torsion subgroup of a finite abelian diamond factor `Δ′`. -/
def QuaternionTWLevel.torsionSubgroup (Δ' : Type*) [CommGroup Δ'] (N : ℕ) : Subgroup Δ' :=
  (powMonoidHom N : Δ' →* Δ').ker

/-- The diamond factor `Δ′ / Δ′[N]`: the quotient by `N`-torsion, not by `N`-th powers. -/
abbrev QuaternionTWLevel.diamondFactor (Δ' : Type*) [CommGroup Δ'] (N : ℕ) :=
  Δ' ⧸ QuaternionTWLevel.torsionSubgroup Δ' N

-- `QuaternionTWLevel.cyclicOrder`: `C₈` modulo its `2`-torsion is `C₄`.
example : Nat.card (QuaternionTWLevel.diamondFactor (Multiplicative (ZMod 8)) 2) = 4 := by
  sorry

-- `QuaternionTWLevel.torsionNotPowers`: `C₈` modulo its squares has order two.
example : Nat.card (Multiplicative (ZMod 8) ⧸
    (powMonoidHom 2 : Multiplicative (ZMod 8) →* Multiplicative (ZMod 8)).range) = 2 := by
  sorry

/-- The strict exponent inequality forces the diagonal ratio into the squares (written
additively in `ZMod (2^a)`). -/
theorem twDiagonalTorsion_isSquare (a b : ℕ) (h : b < a) :
    ∀ x : ZMod (2 ^ a), (2 ^ b) • x = 0 → ∃ y : ZMod (2 ^ a), y + y = x := by
  sorry

-- At `a = b = 1` the kernel contains a nonsquare; strict inequality is necessary.
example : ∃ x : ZMod 2, (2 : ℕ) • x = 0 ∧ ¬ ∃ y : ZMod 2, y + y = x := by
  decide

section ResidualKernel

variable {V O k : Type*} [CommRing O] [Field k]

/-- Evaluation of the abstract polynomial Hecke algebra at given traces and determinants;
`T_v ↦ tr v` and `S_v ↦ q_v⁻¹ det v`. -/
noncomputable def residualEvaluation (red : O →+* k) (q : V → kˣ) (tr det : V → k) :
    MvPolynomial (V × Fin 2) O →+* k :=
  MvPolynomial.eval₂Hom red (fun i => if i.2 = 0 then tr i.1 else ((q i.1)⁻¹ : kˣ) * det i.1)

/-- The residual Hecke ideal: the kernel of the evaluation. -/
noncomputable def ResidualHeckeIdeal (red : O →+* k) (q : V → kˣ) (tr det : V → k) :
    Ideal (MvPolynomial (V × Fin 2) O) :=
  RingHom.ker (residualEvaluation red q tr det)

theorem ResidualHeckeIdeal.maximal (red : O →+* k) (hred : Function.Surjective red)
    (q : V → kˣ) (tr det : V → k) : (ResidualHeckeIdeal red q tr det).IsMaximal := by
  sorry

/-- Descent to an acting quotient exists exactly under the explicit relation hypothesis. -/
theorem ResidualHeckeIdeal.actingFactor (red : O →+* k) (q : V → kˣ) (tr det : V → k)
    (I : Ideal (MvPolynomial (V × Fin 2) O)) (hI : I ≤ ResidualHeckeIdeal red q tr det) :
    ∃! f : (MvPolynomial (V × Fin 2) O ⧸ I) →+* k,
      f.comp (Ideal.Quotient.mk I) = residualEvaluation red q tr det := by
  sorry

end ResidualKernel

-- `ResidualHeckeIdeal.nonsurjective`: without coefficient surjectivity the kernel need not
-- be maximal.
example : ¬ (RingHom.ker (Int.castRingHom ℚ)).IsMaximal := by
  sorry

/-- The image of integral invariants under a reduction map; it can be smaller than the
residual invariants. -/
noncomputable def liftableResidueImage {O Γ W V : Type*} [CommRing O] [Group Γ]
    [AddCommGroup W] [Module O W] [AddCommGroup V]
    (ρ : Representation O Γ W) (red : W →+ V) : AddSubgroup V :=
  ρ.invariants.toAddSubgroup.map red

theorem mem_liftableResidueImage {O Γ W V : Type*} [CommRing O] [Group Γ]
    [AddCommGroup W] [Module O W] [AddCommGroup V]
    (ρ : Representation O Γ W) (red : W →+ V) (v : V) :
    v ∈ liftableResidueImage ρ red ↔ ∃ w : W, w ∈ ρ.invariants ∧ red w = v := by
  sorry

-- `LiftableReductionImage.signAtTwo`: the integral sign action fixes only zero, while every
-- vector mod two is fixed.
example : (∀ x : ℤ, -x = x → x = 0) ∧ (∀ x : ZMod 2, -x = x) := by
  sorry

/-- The pointwise norm twist `f ↦ (χ ∘ ν) · f` on coefficient functions. -/
def normTwist {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
    [AddCommGroup W] [Module O W] (ν : G →* A) (χ : A →* Oˣ) (f : G → W) : G → W :=
  fun g => (χ (ν g) : O) • f g

theorem normTwist_involutive {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
    [AddCommGroup W] [Module O W] (ν : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) : Function.Involutive (normTwist (W := W) ν χ) := by
  sorry

-- `DyadicNormTwist.trivial`: the trivial character gives the identity.
example {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
    [AddCommGroup W] [Module O W] (ν : G →* A) (f : G → W) :
    normTwist ν (1 : A →* Oˣ) f = f := by
  funext g
  simp [normTwist]

#check QuaternionAlgebra.normForm_coe

/-! ## Layer R18.4: coefficient cohomology, Ihara's lemma and finite-level comparisons -/

section Components

variable (A C : Type*) [CommRing A] [CommGroup C]

/-- Right translation on functions on the finite component torsor. -/
def componentTranslation (c : C) : (C → A) →ₗ[A] (C → A) where
  toFun f x := f (x * c)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- `T_v` on components: `q_v + 1` times translation by the norm class `c_v`. -/
def componentT (q : ℕ) (c : C) : (C → A) →ₗ[A] (C → A) :=
  ((q + 1 : ℕ) : A) • componentTranslation A C c

/-- `S_v` on components: translation by `c_v²`. -/
def componentS (c : C) : (C → A) →ₗ[A] (C → A) :=
  componentTranslation A C (c * c)

theorem components_character (q : ℕ) (c : C) (χ : C →* Aˣ) :
    componentT A C q c (fun x => (χ x : A)) =
      (((q + 1 : ℕ) : A) * (χ c : A)) • (fun x => (χ x : A)) := by
  sorry

end Components

-- `component_trivial`: one component and `q_v = 3` give `T_v = 4`.
example : componentT ℚ Unit 3 () (fun _ => 1) () = 4 := by
  simp [componentT, componentTranslation]

section Gram

variable (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]

/-- The Gram operator of the two degeneracy maps, `[[q+1, S⁻¹T], [T, q+1]]`. -/
def degeneracyGram (q : ℕ) (T : A) (S : Aˣ) : (M × M) →ₗ[A] (M × M) :=
  LinearMap.prod
    (((q + 1 : ℕ) : A) • LinearMap.fst A M M + ((↑(S⁻¹) : A) * T) • LinearMap.snd A M M)
    (T • LinearMap.fst A M M + ((q + 1 : ℕ) : A) • LinearMap.snd A M M)

/-- Its scalar determinant `(q+1)² − S⁻¹T²`. -/
def degeneracyDiscriminant (q : ℕ) (T : A) (S : Aˣ) : A :=
  ((q + 1 : ℕ) : A) ^ 2 - (↑(S⁻¹) : A) * T ^ 2

/-- The adjugate of the Gram operator. -/
def degeneracyAdjugate (q : ℕ) (T : A) (S : Aˣ) : (M × M) →ₗ[A] (M × M) :=
  LinearMap.prod
    (((q + 1 : ℕ) : A) • LinearMap.fst A M M - ((↑(S⁻¹) : A) * T) • LinearMap.snd A M M)
    (-T • LinearMap.fst A M M + ((q + 1 : ℕ) : A) • LinearMap.snd A M M)

theorem gram_adjugate (q : ℕ) (T : A) (S : Aˣ) :
    (degeneracyAdjugate A M q T S).comp (degeneracyGram A M q T S) =
      degeneracyDiscriminant A q T S • LinearMap.id := by
  sorry

/-- Algebraic milestone behind the unit-discriminant oldspace splitting. -/
theorem oldspace_split (N : Type*) [AddCommGroup N] [Module A N]
    (δ : (M × M) →ₗ[A] N) (trace : N →ₗ[A] (M × M)) (q : ℕ) (T : A) (S : Aˣ)
    (hGram : trace.comp δ = degeneracyGram A M q T S)
    (hUnit : IsUnit (degeneracyDiscriminant A q T S)) :
    ∃ r : N →ₗ[A] (M × M), r.comp δ = LinearMap.id := by
  sorry

end Gram

-- `gram_level_raise`: at `q = 2`, `T = 3`, `S = 1` the discriminant vanishes and `(1, −1)` is
-- killed.
example : degeneracyGram ℚ ℚ 2 3 1 (1, -1) = (0, 0) := by
  simp [degeneracyGram]

example : degeneracyDiscriminant ℚ 2 3 1 = 0 := by
  simp [degeneracyDiscriminant]

section Saturation

variable (O M N : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [AddCommGroup M] [Module O M] [Module.Finite O M] [Module.Free O M]
  [AddCommGroup N] [Module O N] [Module.Finite O N] [Module.Free O N]

/-- Injectivity after reduction modulo a uniformizer gives a saturated injection. -/
theorem residual_injectivity_saturation (varpi : O) (hvarpi : Irreducible varpi)
    (f : M →ₗ[O] N)
    (hResidual : ∀ x : M, (∃ y : N, f x = varpi • y) → ∃ z : M, x = varpi • z) :
    Function.Injective f ∧ Module.IsTorsionFree O (N ⧸ LinearMap.range f) ∧
      Module.Free O (N ⧸ LinearMap.range f) := by
  sorry

/-- Layer R18.4 algebraic milestone: a saturated injection of finite free DVR modules splits;
tensoring the splitting keeps injectivity modulo every `ϖⁿ`. -/
theorem integral_ihara_split (varpi : O) (hvarpi : Irreducible varpi)
    (f : M →ₗ[O] N)
    (hResidual : ∀ x : M, (∃ y : N, f x = varpi • y) → ∃ z : M, x = varpi • z) :
    ∃ r : N →ₗ[O] M, r.comp f = LinearMap.id := by
  sorry

end Saturation

section ExistingCoefficients

-- The Betti coefficient carrier is Tau Ceti's local coefficient system.
noncomputable example (R : Type*) [Ring R] (X : TopCat) (M : ModuleCat R) :
    TauCeti.LocalCoefficientSystem R X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (R := R) X).obj M

end ExistingCoefficients

/-!
The remaining targets need carriers that the pins do not provide: the Hilbert and quaternionic
moduli problems and their integral models (H1–H2, R18.1–R18.2), Hecke correspondences on them (H3),
the full and integral levels as group schemes (H4), cusps, Hodge lines and weights (H5), the paired
torsion twists (H6), the analytic and formal Drinfeld spaces and their quotients (R18.5), adelic
quaternionic forms and the quaternionic transfer (R18.3), and the étale coefficient cohomology of
the curves with the Ihara lemma (R18.4). They are stated in `README.md` with their intended names. Further README-only APIs are
`polarizationLattice_rescale` (§H0.3), `mem_rapoportLocus` (§H2.5), the scalar-action checks
`diagonal_Q`, `diagonal_square`, `diagonal_notLinear` (§H3.3),
`ResidualHeckeIdeal.actingFactor_unique` (§R18.3.15), and `components_ext`,
`components_translation_comp`, `components_linearAction`, `components_coeffMap` (§R18.4.7).
The valuation-character API `divisionCharacterValue_add` remains in §R18.3.17;
`integralTraceFamily_alternating` remains in §H0.4.
The README-only basic APIs also include `mem_polarizationLattice` (§H0.3),
`integralTraceFamily_apply`, `integralTraceFamily_parameter_add`, `integralTraceFamily_balance`
(§H0.4), `congruenceUnits_mono`, `mem_congruenceUnitSquares`, `congruenceUnitSquares_mono`
(§H3.1), and `components_T`, `components_S` (§R18.4.7).
The basic lattice, trace, congruence, finite-level, chart-action and component APIs are specified
in their README subsections; the retained theorems give their layer milestones.
-/

end TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

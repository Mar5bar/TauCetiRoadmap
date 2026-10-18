import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.NormCoeff

/-!
# AnalyticNumberTheoryPartI: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. The choices made explicit
are inclusive arithmetic cutoffs, analytic pole cancellation, conductor-aware conditional
hypotheses, actual ideal counts, weighted Hilbert spacing, unit-disc prime data, indexed
Beurling primes, the half-endpoint divisor remainder, and quantitative zeta moments. The
remaining definitions and arithmetic-geometric constructions are mathematical targets in README.md.
-/

noncomputable section

open Filter Topology Asymptotics Complex HurwitzZeta
open scoped BigOperators nonZeroDivisors NumberField

namespace TauCetiRoadmap.AnalyticNumberTheoryPartI

/-! ## Layer 0: Entire functions and quantitative prime estimates -/

section AN2

/-- The Chebyshev sum `θ(x; a, q)` over primes `p ≤ x` with `p ≡ a mod q`,
inclusive real cutoff. No coprimality is built in; asymptotic theorems assume it. -/
def thetaAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ p ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun p : ℕ => p.Prime ∧ (p : ZMod q) = a), Real.log p

/-- The von Mangoldt sum `ψ(x; a, q)` over `n ≤ x` with `n ≡ a mod q`. -/
def psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), ArithmeticFunction.vonMangoldt n

/-- The number `π(x; a, q)` of primes `p ≤ x` with `p ≡ a mod q`. -/
def primeCountAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℕ :=
  ((Finset.Ioc 0 ⌊x⌋₊).filter fun p : ℕ => p.Prime ∧ (p : ZMod q) = a).card

/-- At level one the progression sum is Mathlib's `θ`. -/
theorem thetaAP_one (x : ℝ) : thetaAP 1 0 x = Chebyshev.theta x := by
  sorry

/-- Summing over all residue classes recovers `θ`. -/
theorem sum_thetaAP (q : ℕ) [NeZero q] (x : ℝ) :
    ∑ a : ZMod q, thetaAP q a x = Chebyshev.theta x := by
  sorry

/-- `θ(1; a, q) = 0`. -/
example (q : ℕ) (a : ZMod q) : thetaAP q a 1 = 0 := by
  sorry

/-- `θ(5; 3, 8) = log 3` and `θ(5; 5, 8) = log 5`. -/
example : thetaAP 8 3 5 = Real.log 3 ∧ thetaAP 8 5 5 = Real.log 5 := by
  sorry

/-- The noncoprime class `0 mod 2` contains only the prime `2`. -/
example {x : ℝ} (hx : 2 ≤ x) : thetaAP 2 0 x = Real.log 2 := by
  sorry

/-- The inclusive progression ψ agrees with the ordinary ψ at level one. -/
example (x : ℝ) : psiAP 1 0 x = Chebyshev.psi x := by
  sorry

/-- At cutoff three there is exactly one prime in the class three modulo four. -/
example : primeCountAP 4 3 3 = 1 := by
  sorry

/-- At cutoff one the progression ψ sum is empty. -/
example : psiAP 1 0 1 = 0 := by
  sorry

/-- The nonunit class includes the powers two and four. -/
example : psiAP 2 0 4 = 2 * Real.log 2 := by
  sorry

/-- The zero class modulo four includes four and eight at cutoff eight. -/
example : psiAP 4 0 8 = 2 * Real.log 2 := by
  sorry

/-- No prime contributes at cutoff one. -/
example : primeCountAP 1 0 1 = 0 := by
  sorry

/-- Only the prime two contributes in the zero class modulo two. -/
example : primeCountAP 2 0 10 = 1 := by
  sorry

/-- `β` is a `c`-exceptional real zero of the primitive
nonprincipal quadratic character `χ` of conductor `N > 1`. No zero is asserted to exist. -/
def IsExceptionalRealZero (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (β : ℝ) :
    Prop :=
  0 < c ∧ 1 < N ∧ χ.IsPrimitive ∧ χ ≠ 1 ∧ χ ^ 2 = 1 ∧
    1 - c / Real.log N < β ∧ β < 1 ∧ DirichletCharacter.LFunction χ β = 0

/-- Increasing the positive width parameter enlarges the exceptional-zero region. -/
theorem IsExceptionalRealZero.mono {c c' : ℝ} {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {β : ℝ} (h : IsExceptionalRealZero c χ β) (hc : c ≤ c') : IsExceptionalRealZero c' χ β := by
  sorry

/-- `β = 1` is never exceptional. -/
example (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    ¬ IsExceptionalRealZero c χ 1 := by
  sorry

/-- The strict lower endpoint is excluded from the exceptional-zero interval. -/
example (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    ¬ IsExceptionalRealZero c χ (1 - c / Real.log N) := by
  sorry

/-- Width zero does not designate an exceptional zero. -/
example {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (β : ℝ) :
    ¬ IsExceptionalRealZero 0 χ β := by
  simp [IsExceptionalRealZero]

/-- Conductor one is excluded before any logarithmic denominator is used. -/
example (c β : ℝ) (χ : DirichletCharacter ℂ 1) :
    ¬ IsExceptionalRealZero c χ β := by
  simp [IsExceptionalRealZero]

/-- The entire Riemann `ξ`, written through Mathlib's entire
`completedRiemannZeta₀`, so that no junk value at `s = 0, 1` enters. -/
def riemannXi (s : ℂ) : ℂ :=
  1 / 2 + 1 / 2 * s * (s - 1) * completedRiemannZeta₀ s

/-- Away from `0` and `1`, `ξ(s) = s(s-1)Λ(s)/2`. -/
theorem riemannXi_eq {s : ℂ} (hs₀ : s ≠ 0) (hs₁ : s ≠ 1) :
    riemannXi s = 1 / 2 * s * (s - 1) * completedRiemannZeta s := by
  sorry

/-- The pole-cancelled xi function is invariant under s ↦ 1 − s. -/
theorem riemannXi_one_sub (s : ℂ) : riemannXi (1 - s) = riemannXi s := by
  sorry

/-- At zero, xi has value one half. -/
example : riemannXi 0 = 1 / 2 := by
  sorry

/-- The other former pole has the same analytic value. -/
example : riemannXi 1 = 1 / 2 := by
  norm_num [riemannXi]

/-- Two regular values fix the factor of two against the normalization-one completion. -/
example : riemannXi 2 = (Real.pi : ℂ) / 6 ∧ riemannXi (-1) = (Real.pi : ℂ) / 6 := by
  sorry

/-- A paired supplier E₁ product: its exponential factors cancel with this sign. -/
example (z : ℂ) :
    ((1 - z) * Complex.exp z) * ((1 + z) * Complex.exp (-z)) = 1 - z ^ 2 := by
  sorry

/-- The finite-sum canonical factors at minus one distinguish genera zero, one and two. -/
example :
    (1 - (-1 : ℂ)) * Complex.exp
      (∑ j ∈ Finset.Icc (1 : ℕ) 0, (-1 : ℂ) ^ j / (j : ℂ)) = 2 ∧
    (1 - (-1 : ℂ)) * Complex.exp
      (∑ j ∈ Finset.Icc (1 : ℕ) 1, (-1 : ℂ) ^ j / (j : ℂ)) = 2 * Complex.exp (-1) ∧
    (1 - (-1 : ℂ)) * Complex.exp
      (∑ j ∈ Finset.Icc (1 : ℕ) 2, (-1 : ℂ) ^ j / (j : ℂ)) = 2 * Complex.exp (-1 / 2) := by
  sorry

/-- First and second differentiated Stieltjes kernels at one. -/
example :
    deriv (fun z : ℂ => (z + 1) ^ (-2 : ℤ)) 1 = -1 / 4 ∧
      iteratedDeriv 2 (fun z : ℂ => (z + 1) ^ (-2 : ℤ)) 1 = 3 / 8 := by
  sorry

/-- In the rational ray dictionary, a quartic character's value distinguishes inversion. -/
example (chi : DirichletCharacter ℂ 5) (hchi : chi 2 = I) :
    chi 2 - (chi 2)⁻¹ = 2 * I := by
  rw [hchi]
  simp
  ring

/-- Siegel–Walfisz in ψ form, uniformly for q ≤ (log x)^B; the constant can be ineffective. -/
theorem siegel_walfisz (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B →
      ∀ a : ZMod q, IsUnit a →
        |psiAP q a x - x / q.totient| ≤ C * x * Real.log x ^ (-A) := by
  sorry

/-- Finite-range theta inequalities below the analytic cutoff `exp 10000`. -/
def SchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 0 < x → x < Real.exp 10000 → Chebyshev.theta x < 1.000081 * x

/-- Finite-range prime-count inequalities below the analytic cutoff `exp 10000`. -/
def RosserSchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 59 ≤ x → x < Real.exp 10000 →
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x))

/-- The analytic prime-count bounds above the fixed cutoff. -/
theorem rosser_schoenfeld_primeCounting_tail {x : ℝ} (hx : Real.exp 10000 ≤ x) :
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x)) := by
  sorry

/-- Explicit two-sided prime-count bounds from the finite-range input and the analytic tail. -/
theorem rosser_schoenfeld_primeCounting (hfinite : RosserSchoenfeldFiniteRangeInput)
    {x : ℝ} (hx : 59 ≤ x) :
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x)) := by
  sorry

/-- The analytic theta upper bound above the fixed cutoff. -/
theorem theta_lt_tail {x : ℝ} (hx : Real.exp 10000 ≤ x) :
    Chebyshev.theta x < 1.000081 * x := by
  sorry

/-- The theta upper bound from the finite-range input and the analytic tail. -/
theorem theta_lt (hfinite : SchoenfeldFiniteRangeInput) {x : ℝ} (hx : 0 < x) :
    Chebyshev.theta x < 1.000081 * x := by
  sorry

/-- The mod-eight finite theta inequalities and the bounded-height zero input for the tail. -/
def ModEightFiniteInput : Prop :=
  (∀ a : ZMod 8, a = 3 ∨ a = 5 → ∀ x : ℝ,
    (10 : ℝ) ^ 10 ≤ x → x < Real.exp 10000 →
      |thetaAP 8 a x - x / 4| ≤ 0.002811 * x / 4) ∧
    ∀ (χ : DirichletCharacter ℂ 8) (s : ℂ), 0 < s.re → s.re < 1 →
      |s.im| ≤ 10000 → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- Subtracting the mod-eight estimates gives the interval mass from the finite-range input. -/
theorem thetaAP_mod_eight_mass (hfinite : ModEightFiniteInput) {a : ZMod 8}
    (ha : a = 3 ∨ a = 5) {k : ℝ} (hk : 2 * (10 : ℝ) ^ 10 ≤ k) :
    (1 - 3 * 0.002811) * k / 8 ≤ thetaAP 8 a k - thetaAP 8 a (k / 2) := by
  sorry

/-- The first prime cutoff gives the stated theta value and strict upper bound. -/
example : Chebyshev.theta 2 = Real.log 2 ∧
    Chebyshev.theta 2 < 1.000081 * 2 := by
  sorry

/-- The inclusive prime count at fifty-nine satisfies both strict bounds. -/
example : Nat.primeCounting 59 = 17 ∧
    (59 : ℝ) / Real.log 59 * (1 + 1 / (2 * Real.log 59)) < Nat.primeCounting 59 ∧
    (Nat.primeCounting 59 : ℝ) <
      59 / Real.log 59 * (1 + 3 / (2 * Real.log 59)) := by
  sorry

/-- The proposed lower bound already fails at the preceding integer cutoff. -/
example : Nat.primeCounting 58 = 16 ∧
    ¬ ((58 : ℝ) / Real.log 58 * (1 + 1 / (2 * Real.log 58)) <
      Nat.primeCounting 58) := by
  sorry

/-- Exact margin left after the prime-power error at the threshold in README §0.4. -/
example :
    (2 : ℚ) * (1 / 140000 + 35 / 7290000) <
      (1 - 3 * (2811 / 1000000)) / 8 - 1239 / 10000 := by
  norm_num

end AN2

/-! ## Layer 1: Explicit formulas, mean values and conditional prime estimates -/

section AN3

/-- The Riemann hypothesis for one Dirichlet `L`-function.
`0 < re s` removes trivial zeros and the zeros of missing Euler factors; the pole of the principal
character is excluded. -/
def DirichletGRH {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ s : ℂ, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- The generalized Riemann hypothesis for all Dirichlet characters. A statement only. -/
def GRH : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), DirichletGRH χ

/-- At conductor one, Dirichlet GRH is Mathlib’s Riemann hypothesis. -/
theorem dirichletGRH_one_iff_riemannHypothesis :
    DirichletGRH (1 : DirichletCharacter ℂ 1) ↔ RiemannHypothesis := by
  sorry

/-- GRH for all Dirichlet characters implies the Riemann hypothesis. -/
theorem GRH.riemannHypothesis (h : GRH) : RiemannHypothesis := by
  sorry

/-- A zero with real part three quarters refutes both the individual and universal predicates. -/
example {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (t : ℝ)
    (hz : DirichletCharacter.LFunction χ (3 / 4 + t * I) = 0) :
    ¬ DirichletGRH χ ∧ ¬ GRH := by
  sorry

/-- Under Dirichlet GRH, every nontrivial zero has real part one half. -/
theorem DirichletGRH.re_eq_half {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (h : DirichletGRH χ) {s : ℂ} (hs : 0 < s.re) (hχ : χ ≠ 1 ∨ s ≠ 1)
    (hz : DirichletCharacter.LFunction χ s = 0) : s.re = 1 / 2 :=
  by
    sorry

/-- Under RH, ψ has square-root error with any positive power loss. -/
theorem psi_sub_self_isBigO_of_riemannHypothesis (h : RiemannHypothesis) {ε : ℝ} (hε : 0 < ε) :
    (fun x => Chebyshev.psi x - x) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- For a fixed modulus, character-wise GRH gives the corresponding progression error. -/
theorem psiAP_isBigO_of_dirichletGRH (q : ℕ) [NeZero q]
    (h : ∀ χ : DirichletCharacter ℂ q, DirichletGRH χ) (a : ZMod q) (ha : IsUnit a) {ε : ℝ}
    (hε : 0 < ε) :
    (fun x => psiAP q a x - x / q.totient) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- The negative-even trivial zero lies outside the GRH half-plane. -/
example : DirichletCharacter.LFunction (1 : DirichletCharacter ℂ 1) (-2) = 0 ∧
    ¬ (0 < (-2 : ℂ).re) := by
  sorry

/-- A principal deleted-factor zero lies on the excluded imaginary axis. -/
example :
    let s : ℂ := 2 * Real.pi * I / Real.log 2
    DirichletCharacter.LFunction (1 : DirichletCharacter ℂ 2) s = 0 ∧ ¬ (0 < s.re) := by
  sorry

/-- The principal pole fails the GRH admissibility clause at one. -/
example : ¬ ((1 : DirichletCharacter ℂ 1) ≠ 1 ∨ (1 : ℂ) ≠ 1) := by
  simp

/-- The Dirichlet-polynomial mean square has the Montgomery–Vaughan weighted error. -/
theorem dirichlet_polynomial_mean_square :
    ∀ (N : ℕ) (a : ℕ → ℂ) (T : ℝ), 0 ≤ T →
      |(∫ t in (-T)..T, ‖∑ n ∈ Finset.Icc 1 N, a n * (n : ℂ) ^ (-((t : ℂ) * I))‖ ^ 2) -
          2 * T * ∑ n ∈ Finset.Icc 1 N, ‖a n‖ ^ 2| ≤
        (6 * Real.pi) * ∑ n ∈ Finset.Icc 1 N, (n : ℝ) * ‖a n‖ ^ 2 := by
  sorry

/-- The weighted Hilbert inequality for distinct real frequencies, with any positive lower
bounds for their nearest-neighbour spacings. Empty and singleton families are allowed. -/
theorem weighted_hilbert_inequality (n : ℕ) (lam delta : Fin n → ℝ) (u : Fin n → ℂ)
    (hdelta : ∀ r, 0 < delta r)
    (hgap : ∀ r s, r ≠ s → delta r ≤ |lam r - lam s|) :
    ‖∑ r : Fin n, ∑ s ∈ Finset.univ.erase r,
        u r * star (u s) / ((lam r - lam s : ℝ) : ℂ)‖ ≤
      (3 * Real.pi / 2) * ∑ r : Fin n, ‖u r‖ ^ 2 / delta r := by
  sorry

/-- Two frequencies zero and one, with coefficients one and i, pin the Hilbert-sum sign. -/
example :
    (1 : ℂ) * star I / (0 - 1) + I * star (1 : ℂ) / (1 - 0) = 2 * I := by
  simp
  ring

/-- The Weyl area coefficient at the central point is one eighth. -/
example : ((1 / 2 : ℂ) * (1 - 1 / 2) / 2) = 1 / 8 := by
  norm_num

/-- The same coefficient at height one is five eighths. -/
example : ((1 / 2 + I : ℂ) * (1 - (1 / 2 + I)) / 2) = 5 / 8 := by
  ring_nf
  norm_num

end AN3

/-! ## Layer 2: Hecke and Artin comparisons and quantitative number-field estimates -/

section AN4

open _root_.NumberField

variable (K : Type*) [Field K] [NumberField K]

/-- The native norm coefficients of the ordinary-class indicator used by LFunctions Layer 2. -/
abbrev partialIdealZetaCoeff (A : ClassGroup (𝓞 K)) : ArithmeticFunction ℂ := by
  classical
  exact _root_.TauCeti.normCoeff K (fun I => if ClassGroup.mk0 I = A then 1 else 0)

/-- Each class-indicator norm coefficient counts the corresponding finite ideal fibre. -/
theorem partialIdealZetaCoeff_eq_card (A : ClassGroup (𝓞 K)) (n : ℕ) :
    partialIdealZetaCoeff K A n =
      (Nat.card {I : (Ideal (𝓞 K))⁰ //
        Ideal.absNorm (I : Ideal (𝓞 K)) = n ∧ ClassGroup.mk0 I = A} : ℂ) := by
  sorry

/-- Nonzero integral ideals contribute no coefficient at norm zero. -/
example (A : ClassGroup (𝓞 K)) : partialIdealZetaCoeff K A 0 = 0 := by
  sorry

/-- Only the unit ideal has norm one, and its class is principal. -/
example : partialIdealZetaCoeff K 1 1 = 1 ∧
    ∀ A : ClassGroup (𝓞 K), A ≠ 1 → partialIdealZetaCoeff K A 1 = 0 := by
  sorry

/-- In fixed degree, hR has discriminant exponent one half, with any positive power loss. -/
theorem bounded_degree_brauer_siegel (n : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ C > 0, ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L = n →
      C⁻¹ * |(discr L : ℝ)| ^ (1 / 2 - ε) ≤ classNumber L * Units.regulator L ∧
        classNumber L * Units.regulator L ≤ C * |(discr L : ℝ)| ^ (1 / 2 + ε) := by
  sorry

/-- Every primitive quadratic Dirichlet character has root number one, including conductor one. -/
theorem rootNumber_eq_one_of_isPrimitive_of_sq_eq_one {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) (hsq : χ ^ 2 = 1) :
    DirichletCharacter.rootNumber χ = 1 := by
  sorry

/-- The quadratic Gauss-sum sign at `D = -4`: the root number of `χ₋₄` is `1`, i.e. its Gauss
sum is `2i`. -/
example : DirichletCharacter.rootNumber (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) = 1 := by
  sorry

/-- At `D = -4`, the standard parity completion and the DIT period completion
have different endpoint values. Mathlib's completion contains neither conductor power.
Compare DIT (5.13), p.964, and README conventions. -/
example :
    (4 : ℂ) ^ (1 / 2 : ℂ) *
        DirichletCharacter.completedLFunction (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) 0 = 1 ∧
    (Real.pi : ℂ) ^ (1 / 2 : ℂ) *
        DirichletCharacter.completedLFunction (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) 0 =
          (Real.sqrt Real.pi : ℂ) / 2 := by
  sorry

/-- The same distinction at `s = 1`: conductor four contributes a factor two
in the DIT completion and a factor four in the standard parity completion. -/
example :
    (4 : ℂ) *
        DirichletCharacter.completedLFunction (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) 1 = 1 ∧
    2 * (Real.pi : ℂ) ^ (1 / 2 : ℂ) *
        DirichletCharacter.completedLFunction (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) 1 =
          (Real.sqrt Real.pi : ℂ) / 2 := by
  sorry

/-- Rational endpoint controls for the non-imaginary-quadratic Louboutin signatures. -/
example : (6 : ℚ) * (329 / 1000) ^ 2 < 1 ∧ (318 : ℚ) / 1000 < 329 / 1000 := by
  norm_num

end AN4

/-! ## Layer 3: Multiplicative means, smooth numbers and moments -/

section AN5

/-- `D(f, g; x)`, a distance on prime data. -/
def pretentiousDist (f g : ℕ → ℂ) (x : ℝ) : ℝ :=
  Real.sqrt (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 - (f p * starRingEnd ℂ (g p)).re) / (p : ℝ))

/-- The constant unit function has zero distance from itself. -/
example (x : ℝ) : pretentiousDist 1 1 x = 0 := by
  sorry

/-- `D(1, -1; x)² = 2 Σ_{p ≤ x} 1/p`. -/
example (x : ℝ) :
    pretentiousDist 1 (fun _ => -1) x ^ 2 =
      2 * ∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 : ℝ) / p := by
  sorry

/-- Disk-valued prime data need not have zero distance from themselves. -/
example : pretentiousDist 0 0 2 ^ 2 = (1 : ℝ) / 2 := by
  sorry

/-- The prime-data distance vanishes at cutoff one for arbitrary functions. -/
example (f g : ℕ → ℂ) : pretentiousDist f g 1 = 0 := by
  sorry

/-- The prime-data distance satisfies the multiplicative triangle inequality for disk-valued functions. -/
theorem pretentiousDist_mul_le (f₁ f₂ g₁ g₂ : ℕ → ℂ) (x : ℝ)
    (hf₁ : ∀ p, p.Prime → ‖f₁ p‖ ≤ 1) (hf₂ : ∀ p, p.Prime → ‖f₂ p‖ ≤ 1)
    (hg₁ : ∀ p, p.Prime → ‖g₁ p‖ ≤ 1) (hg₂ : ∀ p, p.Prime → ‖g₂ p‖ ≤ 1) :
    pretentiousDist (f₁ * f₂) (g₁ * g₂) x ≤ pretentiousDist f₁ g₁ x + pretentiousDist f₂ g₂ x := by
  sorry

/-- At the splitting endpoint, both distinct prime divisors belong to the large part. -/
example : (6 : ℕ).primeFactors.filter (fun p : ℕ => (p : ℝ) < 2) = ∅ ∧
    (6 : ℕ).primeFactors.filter (fun p : ℕ => 2 ≤ (p : ℝ)) = {2, 3} := by
  sorry

/-- `Ψ(x, y)`, the number of `1 ≤ n ≤ x` with every prime factor `≤ y`. -/
def smoothCount (x y : ℝ) : ℕ :=
  ((Finset.Icc 1 ⌊x⌋₊).filter fun n : ℕ => ∀ p ∈ n.primeFactors, (p : ℝ) ≤ y).card

/-- Comparison with Mathlib's strict-cutoff `smoothNumbers`. -/
theorem smoothCount_eq (x y : ℝ) (hy : 0 ≤ y) :
    smoothCount x y = ((Finset.Icc 1 ⌊x⌋₊).filter (· ∈ Nat.smoothNumbers (⌊y⌋₊ + 1))).card := by
  sorry

/-- `Ψ(8, 2) = 4`, counting `1, 2, 4, 8`. -/
example : smoothCount 8 2 = 4 := by
  sorry

/-- `Ψ(6, 3) = 5`, counting `1, 2, 3, 4, 6`; the prime `3` is allowed. -/
example : smoothCount 6 3 = 5 := by
  sorry

/-- For each positive exponent, the divisor count has a uniform subpower bound. -/
theorem card_divisors_le (ε : ℝ) (hε : 0 < ε) :
    ∃ C ≥ 1, ∀ n : ℕ, 0 < n → (n.divisors.card : ℝ) ≤ C * (n : ℝ) ^ ε := by
  sorry

/-- A discrete Beurling prime system, repeated values allowed. -/
structure BeurlingPrimeSystem where
  /-- The generalized primes `p₀ ≤ p₁ ≤ ⋯`. -/
  p : ℕ → ℝ
  one_lt : ∀ j, 1 < p j
  mono : Monotone p
  tendsto : Tendsto p atTop atTop

/-- The prime-counting function `π_P(x)` of a Beurling system, counted with multiplicity. -/
def BeurlingPrimeSystem.primeCount (P : BeurlingPrimeSystem) (x : ℝ) : ℕ :=
  Nat.card {j : ℕ // P.p j ≤ x}

/-- The rational primes form a Beurling system. -/
theorem exists_beurlingPrimeSystem_nth_prime :
    ∃ P : BeurlingPrimeSystem, ∀ j, P.p j = Nat.nth Nat.Prime j := by
  sorry

/-- No indexed Beurling prime contributes at or below one. -/
example (P : BeurlingPrimeSystem) {x : ℝ} (hx : x ≤ 1) : P.primeCount x = 0 := by
  sorry

/-- The ordinary prime sequence has four indexed primes at cutoff ten. -/
example (P : BeurlingPrimeSystem) (hP : ∀ j, P.p j = Nat.nth Nat.Prime j) :
    P.primeCount 10 = 4 := by
  sorry

/-- Repeated prime values contribute separate indices at their inclusive endpoint. -/
example (P : BeurlingPrimeSystem) (h₀ : P.p 0 = 2) (h₁ : P.p 1 = 2)
    (h₂ : 2 < P.p 2) : P.primeCount 2 = 2 := by
  sorry

/-- The smooth-count extension excludes zero even below the analytic cutoff range. -/
example : smoothCount 0 2 = 0 := by
  sorry

/-- The inclusive summatory divisor function, using the native finite divisor set. -/
def divisorSummatory (x : ℝ) : ℝ :=
  ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, (n.divisors.card : ℝ)

/-- The usual inclusive divisor remainder; the analytic statements assume `x ≥ 1`. -/
def divisorError (x : ℝ) : ℝ :=
  divisorSummatory x - x * (Real.log x + 2 * Real.eulerMascheroniConstant - 1)

/-- The coprime-divisor error obtained from the ordinary error by finite Möbius inversion. -/
def divisorCoprimeError (D : ℕ) (x : ℝ) : ℝ :=
  ∑ δ ∈ D.divisors, (ArithmeticFunction.moebius δ : ℝ) * divisorError (x / (δ : ℝ) ^ 2)

/-- The integrated coprime-divisor error; its analytic domain has positive D and T. -/
def divisorRemainderIntegral (D : ℕ) (T σ : ℝ) : ℝ :=
  ∫ u : ℝ in (1 : ℝ)..T, divisorCoprimeError D u * u ^ (-σ)

/-- Exact finite divisor and integral inequalities used in the BBR analytic estimates. -/
def BBRFiniteInput : Prop :=
  let κ₇ : ℝ := (riemannZeta (3 / 4)).re ^ 2 / (3 / 4) +
    8 * Real.eulerMascheroniConstant - 20
  let κ₃ : ℝ := 2 * (riemannZeta (1 / 2)).re ^ 2 +
    4 * Real.eulerMascheroniConstant - 6
  (∀ x : ℝ, 1 ≤ x → x ≤ (10 : ℝ) ^ 10 → |divisorError x| ≤ 0.961 * Real.sqrt x) ∧
  (∀ x : ℝ, 9995 ≤ x → x ≤ (10 : ℝ) ^ 10 →
    |divisorError x| ≤ 0.764 * x ^ (1 / 3 : ℝ) * Real.log x) ∧
  (∀ x : ℝ, 3 ≤ x → x ≤ (10 : ℝ) ^ 6 →
    |divisorError x| ≤ 1.146 * x ^ (1 / 3 : ℝ) * Real.log x) ∧
  (∀ x : ℝ, 4033 ≤ x → x ≤ (10 : ℝ) ^ 10 →
    |divisorError x| ≤ 0.475 * Real.sqrt x) ∧
  (∀ x : ℝ, 1 ≤ x → x ≤ (10 : ℝ) ^ 7 →
    |divisorCoprimeError 2 x| ≤ 0.883 * Real.sqrt x ∧
    |divisorCoprimeError 6 x| ≤ 0.927 * Real.sqrt x) ∧
  (∀ T : ℝ, 1 ≤ T → T ≤ (10 : ℝ) ^ 5 →
    T ^ (1 / 4 : ℝ) * |divisorRemainderIntegral 1 T (7 / 4) - κ₇| ≤ 0.302) ∧
  (∀ T : ℝ, 1260 ≤ T → T ≤ (10 : ℝ) ^ 7 →
    T ^ (1 / 4 : ℝ) * |divisorRemainderIntegral 1 T (7 / 4) - κ₇| ≤ 0.00979) ∧
  (∀ T : ℝ, 1 ≤ T → T ≤ (10 : ℝ) ^ 7 →
    |divisorRemainderIntegral 1 T (7 / 4)| ≤ 0.4077 ∧
    |divisorRemainderIntegral 1 T (3 / 2)| ≤ κ₃ ∧
    |divisorRemainderIntegral 2 T (7 / 4)| ≤ 0.902 ∧
    |divisorRemainderIntegral 6 T (7 / 4)| ≤ 0.0945 ∧
    |divisorRemainderIntegral 6 T (3 / 2)| ≤ 0.131) ∧
  |divisorRemainderIntegral 6 ((10 : ℝ) ^ 7) (3 / 2) + 0.056667| ≤ (10 : ℝ) ^ (-6 : ℤ)

/-- Finite Möbius inversion at D equal to one recovers the ordinary divisor error. -/
example (x : ℝ) : divisorCoprimeError 1 x = divisorError x := by
  simp [divisorCoprimeError]

/-- The lower integration endpoint gives zero independently of the finite inequalities. -/
example (D : ℕ) (σ : ℝ) : divisorRemainderIntegral D 1 σ = 0 := by
  simp [divisorRemainderIntegral]

/-- The finite cubic input includes its lower endpoint. -/
example (hBBR : BBRFiniteInput) :
    |divisorError 9995| ≤ 0.764 * (9995 : ℝ) ^ (1 / 3 : ℝ) * Real.log 9995 := by
  sorry

/-- The Voronoi remainder has half weight at positive integral endpoints and subtracts `1/4`. -/
def divisorErrorStar (x : ℝ) : ℝ :=
  divisorError x -
    (if 1 ≤ x ∧ x = (⌊x⌋₊ : ℝ) then (⌊x⌋₊.divisors.card : ℝ) / 2 else 0) - 1 / 4

example : divisorSummatory 0 = 0 ∧ divisorError 0 = 0 ∧ divisorErrorStar 0 = -1 / 4 := by
  norm_num [divisorSummatory, divisorError, divisorErrorStar]

example : divisorSummatory 1 = 1 ∧
    divisorError 1 = 2 - 2 * Real.eulerMascheroniConstant ∧
    divisorErrorStar 1 = 5 / 4 - 2 * Real.eulerMascheroniConstant := by
  norm_num [divisorSummatory, divisorError, divisorErrorStar]
  ring_nf
  simp

example : divisorSummatory 4 = 8 ∧
    divisorError 4 = 12 - 4 * Real.log 4 - 8 * Real.eulerMascheroniConstant ∧
    divisorErrorStar 4 = 41 / 4 - 4 * Real.log 4 - 8 * Real.eulerMascheroniConstant := by
  sorry

/-- A nonintegral cutoff has no divisor endpoint half-weight. -/
example : divisorErrorStar (3 / 2) =
    9 / 4 - (3 / 2) * Real.log (3 / 2) - 3 * Real.eulerMascheroniConstant := by
  sorry

/-- Capped inverse distance with the correct value one at an exact endpoint saddle. -/
def endpointCap (u : ℝ) : ℝ := 1 / max 1 |u|

example : endpointCap 0 = 1 ∧ min (1 : ℝ) |(0 : ℝ)|⁻¹ = 0 := by
  norm_num [endpointCap]

example : endpointCap (1 / 2) = 1 ∧ endpointCap (-1 / 2) = 1 := by
  norm_num [endpointCap]

example : endpointCap 2 = 1 / 2 ∧ endpointCap (-2) = 1 / 2 := by
  norm_num [endpointCap]

/-- Schläfli's second-kind integral, with complex order and argument.
Its analytic domain is `0 < z.re`; no convergence is asserted outside that domain. -/
def besselY (ν z : ℂ) : ℂ :=
  (∫ θ : ℝ in (0 : ℝ)..Real.pi,
    Complex.sin (z * (Real.sin θ : ℂ) - ν * (θ : ℂ))) / (Real.pi : ℂ) -
  (∫ t : ℝ in Set.Ioi 0,
    (Complex.exp (ν * (t : ℂ)) + Complex.cos ((Real.pi : ℂ) * ν) *
      Complex.exp (-ν * (t : ℂ))) * Complex.exp (-z * (Real.sinh t : ℂ))) / (Real.pi : ℂ)

/-- The second-kind integral is holomorphic in its argument on the right half-plane. -/
theorem besselY_differentiableOn (ν : ℂ) :
    DifferentiableOn ℂ (besselY ν) {z : ℂ | 0 < z.re} := by
  sorry

example : besselY (1 / 2) (Real.pi / 2) = 0 ∧
    besselY (-1 / 2) (Real.pi / 2) = (2 / Real.pi : ℝ) := by
  sorry

example : besselY (1 / 2) Real.pi = (Real.sqrt 2 / Real.pi : ℝ) := by
  sorry

example {x : ℝ} (hx : 0 < x) : besselY (-1) x = -besselY 1 x := by
  sorry

/-- Coefficients of the positive-axis Bessel expansion; the empty product is one. -/
def besselAsymptoticCoeff (ν : ℝ) (j : ℕ) : ℝ :=
  (∏ r ∈ Finset.range j, (4 * ν ^ 2 - (2 * (r : ℝ) + 1) ^ 2)) /
    ((8 : ℝ) ^ j * (j.factorial : ℝ))

example : besselAsymptoticCoeff 1 0 = 1 ∧ besselAsymptoticCoeff 1 1 = 3 / 8 := by
  norm_num [besselAsymptoticCoeff]

example : besselAsymptoticCoeff 1 2 = -15 / 128 ∧
    besselAsymptoticCoeff 1 3 = 105 / 1024 := by
  norm_num [besselAsymptoticCoeff, Finset.prod_range_succ]

example (j : ℕ) (hj : 1 ≤ j) : besselAsymptoticCoeff (1 / 2) j = 0 ∧
    besselAsymptoticCoeff (-1 / 2) j = 0 := by
  sorry

/-- Numerical saddle constants `(β, B₁, B₂, B₃, B₄)` of README §3.23c.
The theorem's strict parameter domain is essential for these totalized formulas. -/
def saddleConstants (A₂ A₃ η : ℝ) : ℝ × ℝ × ℝ × ℝ × ℝ :=
  let β := 2 * η * Real.sqrt 2 * A₂ * A₃ / (3 * (1 - η * Real.sqrt 2))
  let w₁ := Real.pi * η ^ 3 * A₂ *
    (4 * Real.sqrt 2 / 3 + 27 * η / (128 * (1 - η * Real.sqrt 2)))
  let w₂ := Real.exp w₁ * (4 * Real.pi * A₂ / 3) ^ 2 *
    (1 + 3 * η / (Real.sqrt 2 - 2 * η) *
      (1 + 3 * Real.sqrt 2 * η / (8 * (1 - η * Real.sqrt 2))))
  let w₃ := 4 * Real.pi * Real.sqrt 2 * A₂ / 3 +
    2 * Real.pi * η * A₂ / (1 - η * Real.sqrt 2) + η ^ 3 * w₂
  (β,
    1 / (1 - β) + Real.exp (-Real.pi / (2 * (1 - β))) / Real.pi,
    2 * Real.pi * η ^ 2 * (1 - β) / (A₃ * (1 + 2 * A₂)),
    48 * Real.sqrt 2 * (1 + (1 - β) ^ (-4 : ℤ)) / (Real.pi ^ 4 * η ^ 7),
    (1 + η ^ 3 * w₃) / ((2 * Real.pi / A₃) * (1 - η * Real.sqrt 2)) +
      3 * (2 * Real.pi * A₂ / (1 - η * Real.sqrt 2) + Real.sqrt 2 * w₃) /
        (4 * Real.pi / A₃) ^ 2 + 15 * w₂ / (4 * Real.pi / A₃) ^ 3)

example :
    let c := saddleConstants (1 / Real.pi) (27 * Real.pi) (129 / (3800 * Real.sqrt 2))
    c.1 = 2322 / 3671 ∧ 2.72570 < c.2.1 ∧ c.2.1 < 2.72571 ∧
      9.58e-6 < c.2.2.1 ∧ c.2.2.1 < 9.59e-6 ∧
      8.47e12 < c.2.2.2.1 ∧ c.2.2.2.1 < 8.48e12 ∧
      9310 < c.2.2.2.2 ∧ c.2.2.2.2 < 9311 := by
  sorry

example :
    let c := saddleConstants (1 / Real.pi) (80 / 9 + 9 * Real.pi) (1 / 20)
    2.50674 < c.2.1 ∧ c.2.1 < 2.50675 ∧
      0.00010328 < c.2.2.1 ∧ c.2.2.1 < 0.00010329 ∧
      3.576e10 < c.2.2.2.1 ∧ c.2.2.2.1 < 3.577e10 ∧
      907 < c.2.2.2.2 ∧ c.2.2.2.2 < 908 := by
  sorry

example :
    let c := saddleConstants (1 / Real.pi) 1 (1 / 100)
    1.06890 < c.2.1 ∧ c.2.1 < 1.06891 ∧
      0.00038274 < c.2.2.1 ∧ c.2.2.1 < 0.00038275 ∧
      1.4023e14 < c.2.2.2.1 ∧ c.2.2.2.1 < 1.4024e14 ∧
      0.26491 < c.2.2.2.2 ∧ c.2.2.2.2 < 0.26492 := by
  sorry

/-- The undamped Gaussian is an improper symmetric limit, with positive quarter phase. -/
example : Tendsto (fun R : ℝ => ∫ x : ℝ in -R..R,
    Complex.exp ((Real.pi : ℂ) * Complex.I * (x : ℂ) ^ 2)) atTop
    (𝓝 (Complex.exp ((Real.pi : ℂ) * Complex.I / 4))) ∧
    Tendsto (fun R : ℝ => ∫ x : ℝ in -R..R,
      Complex.exp (4 * (Real.pi : ℂ) * Complex.I * (x : ℂ) ^ 2)) atTop
      (𝓝 (Complex.exp ((Real.pi : ℂ) * Complex.I / 4) / 2)) := by
  sorry

/-- The logarithmic plus phase has its saddle at one when `T = 4π`, `k = 1`.
The minus phase has nonzero derivative there. -/
example :
    deriv (fun y : ℝ => 4 * Real.pi * Real.log ((1 + y) / y) + 2 * Real.pi * y) 1 = 0 ∧
    deriv (fun y : ℝ => 4 * Real.pi * Real.log ((1 + y) / y) - 2 * Real.pi * y) 1 =
      -4 * Real.pi ∧
    deriv (deriv (fun y : ℝ =>
      4 * Real.pi * Real.log ((1 + y) / y) + 2 * Real.pi * y)) 1 = 3 * Real.pi := by
  sorry

namespace atkinson

/-- Positive logarithmic ratio on `y > 0`; its value at zero is only a totalization. -/
def logRatio (y : ℝ) : ℝ := Real.log ((1 + y) / y)

/-- Real logarithmic-family weight; the analytic domain has all parameters positive. -/
def logarithmicWeight (α β γ y : ℝ) : ℝ :=
  y ^ (-α) * (1 + y) ^ (-β) * logRatio y ^ (-γ)

example : logRatio 1 = Real.log 2 ∧
    logarithmicWeight (1 / 2) (1 / 2) 1 1 = 1 / (Real.sqrt 2 * Real.log 2) := by
  sorry

example : logRatio (1 / 2) = Real.log 3 ∧
    logarithmicWeight (1 / 2) (1 / 2) 1 (1 / 2) =
      2 / (Real.sqrt 3 * Real.log 3) := by
  sorry

example : logRatio 2 = Real.log (3 / 2) ∧
    logarithmicWeight (1 / 2) (1 / 2) 1 2 =
      1 / (Real.sqrt 6 * Real.log (3 / 2)) := by
  sorry

/-- At the boundary weight the unpaired complex integral has no ordinary improper limit. -/
example : ¬ ∃ ℓ : ℂ, Tendsto (fun R : ℝ => ∫ y : ℝ in (1 : ℝ)..R,
    (logarithmicWeight (1 / 2) (1 / 2) 1 y : ℂ) *
      Complex.exp (Complex.I * ((4 * Real.pi * logRatio y + 2 * Real.pi * y : ℝ) : ℂ)))
    atTop (𝓝 ℓ) := by
  sorry

/-- Moving-family weight; all analytic statements require `T > 0` and `x > 0`. -/
def movingWeight (T x : ℝ) : ℝ :=
  (Real.arsinh (x * Real.sqrt (Real.pi / (2 * T))) *
    (Real.sqrt (T / (2 * Real.pi * x ^ 2) + 1 / 4) + 1 / 2) *
    (T / (2 * Real.pi * x ^ 2) + 1 / 4) ^ (1 / 4 : ℝ))⁻¹

/-- Moving-family phase before adding its signed square-root frequency. -/
def movingPhase (T x : ℝ) : ℝ :=
  -2 * T * Real.arsinh (x * Real.sqrt (Real.pi / (2 * T))) -
    Real.sqrt (2 * Real.pi * x ^ 2 * T + Real.pi ^ 2 * x ^ 4) + Real.pi * x ^ 2

example : movingWeight (4 * Real.pi) 1 = Real.sqrt (2 / 3) / Real.log 2 ∧
    movingPhase (4 * Real.pi) 1 = -4 * Real.pi * Real.log 2 - 2 * Real.pi := by
  sorry

example : movingWeight (16 * Real.pi) 2 = Real.sqrt (2 / 3) / Real.log 2 ∧
    movingPhase (16 * Real.pi) 2 = -16 * Real.pi * Real.log 2 - 8 * Real.pi := by
  sorry

example (T : ℝ) : movingWeight T 0 = 0 ∧ movingPhase T 0 = 0 := by
  simp [movingWeight, movingPhase]

/-- Real moving cutoff; analytic identities use positive `T` and `b`. -/
def cutoff (T b : ℝ) : ℝ := (Real.sqrt (b + 2 * T / Real.pi) - Real.sqrt b) ^ 2 / 4

example : cutoff (4 * Real.pi) 1 = 1 := by
  sorry

example : cutoff (12 * Real.pi) 1 = 4 := by
  sorry

example : cutoff (8 * Real.pi) 2 = 2 ∧ cutoff 0 1 = 0 := by
  sorry

/-- The saddle condition includes equality at the lower endpoint. -/
theorem cutoff_saddle_iff {T b n : ℝ} (hT : 0 < T) (hb : 0 < b) (hn : 0 < n) :
    n ≤ cutoff T b ↔ n < T / (2 * Real.pi) ∧ (T / (2 * Real.pi) - n) ^ 2 / n ≥ b := by
  sorry

/-- Extended amplitude, with its continuous positive-temperature value at zero. -/
def amplitude (T n : ℝ) : ℝ :=
  if n = 0 then 1 else
    (1 + Real.pi * n / (2 * T)) ^ (-1 / 4 : ℝ) *
      Real.sqrt (Real.pi * n / (2 * T)) / Real.arsinh (Real.sqrt (Real.pi * n / (2 * T)))

example (T : ℝ) : amplitude T 0 = 1 := by
  simp [amplitude]

example : amplitude (Real.pi / 2) 1 = (2 : ℝ) ^ (-1 / 4 : ℝ) / Real.arsinh 1 := by
  sorry

example : amplitude (Real.pi / 2) 4 = 2 * (5 : ℝ) ^ (-1 / 4 : ℝ) / Real.arsinh 2 := by
  sorry

/-- First Atkinson phase, including the negative quarter-period shift. -/
def phase₁ (T n : ℝ) : ℝ :=
  2 * T * Real.arsinh (Real.sqrt (Real.pi * n / (2 * T))) +
    Real.sqrt ((Real.pi * n) ^ 2 + 2 * Real.pi * n * T) - Real.pi / 4

example (T : ℝ) : phase₁ T 0 = -Real.pi / 4 := by
  simp [phase₁]
  ring

example : phase₁ (Real.pi / 2) 1 =
    Real.pi * Real.arsinh 1 + Real.pi * Real.sqrt 2 - Real.pi / 4 := by
  sorry

example : phase₁ (Real.pi / 2) 4 =
    Real.pi * Real.arsinh 2 + 2 * Real.pi * Real.sqrt 5 - Real.pi / 4 := by
  sorry

/-- Second Atkinson phase; its analytic domain has `T > 0` and `n > 0`. -/
def phase₂ (T n : ℝ) : ℝ := T * Real.log (T / (2 * Real.pi * n)) - T + Real.pi / 4

example : phase₂ (2 * Real.pi) 1 = -7 * Real.pi / 4 := by
  sorry

example : phase₂ (4 * Real.pi) 1 = 4 * Real.pi * Real.log 2 - 15 * Real.pi / 4 := by
  sorry

example : phase₂ (4 * Real.pi) 2 = -15 * Real.pi / 4 := by
  sorry

/-- The first finite sum has alternating signs and includes its natural cutoff. -/
def firstSum (T : ℝ) (N : ℕ) : ℝ :=
  Real.sqrt 2 * (T / (2 * Real.pi)) ^ (1 / 4 : ℝ) *
    ∑ n ∈ Finset.Icc 1 N,
      (-1 : ℝ) ^ n * (n.divisors.card : ℝ) * (n : ℝ) ^ (-3 / 4 : ℝ) *
        amplitude T n * Real.cos (phase₁ T n)

/-- The second sum has inclusive real cutoff. Its analytic domain is `0 ≤ Z < T/(2π)`. -/
def secondSum (T Z : ℝ) : ℝ :=
  -2 * ∑ n ∈ Finset.Icc 1 ⌊Z⌋₊,
    (n.divisors.card : ℝ) / Real.sqrt n /
      Real.log (T / (2 * Real.pi * n)) * Real.cos (phase₂ T n)

example (T : ℝ) : firstSum T 0 = 0 ∧ secondSum T 0 = 0 := by
  simp [firstSum, secondSum]

example (T : ℝ) : firstSum T 1 =
    -Real.sqrt 2 * (T / (2 * Real.pi)) ^ (1 / 4 : ℝ) *
      amplitude T 1 * Real.cos (phase₁ T 1) := by
  norm_num [firstSum]
  ring

example (T : ℝ) : firstSum T 2 - firstSum T 1 =
    Real.sqrt 2 * (T / (2 * Real.pi)) ^ (1 / 4 : ℝ) *
      (2 * (2 : ℝ) ^ (-3 / 4 : ℝ) * amplitude T 2 * Real.cos (phase₁ T 2)) := by
  sorry

example (T : ℝ) : secondSum T 1 =
    -2 * Real.cos (phase₂ T 1) / Real.log (T / (2 * Real.pi)) := by
  norm_num [secondSum]
  ring

example (T : ℝ) : secondSum T 2 - secondSum T 1 =
    -2 * Real.sqrt 2 * Real.cos (phase₂ T 2) / Real.log (T / (4 * Real.pi)) := by
  sorry

end atkinson

namespace zetaSecondMoment

/-- The second-moment error with the full `2π` and Euler-constant normalization. -/
def error (T : ℝ) : ℝ :=
  (∫ t : ℝ in (0 : ℝ)..T, ‖riemannZeta (1 / 2 + (t : ℂ) * Complex.I)‖ ^ 2) -
    T * Real.log (T / (2 * Real.pi)) - (2 * Real.eulerMascheroniConstant - 1) * T

example : error 0 = 0 := by
  simp [error]

example : error (2 * Real.pi) =
    (∫ t : ℝ in (0 : ℝ)..(2 * Real.pi),
      ‖riemannZeta (1 / 2 + (t : ℂ) * Complex.I)‖ ^ 2) -
    (2 * Real.eulerMascheroniConstant - 1) * (2 * Real.pi) := by
  sorry

/-- Moment-error increments retain the interval integral and both main-term endpoints. -/
example {S T : ℝ} (hS : 0 < S) (hST : S ≤ T) :
    error T - error S =
      (∫ t : ℝ in S..T, ‖riemannZeta (1 / 2 + (t : ℂ) * Complex.I)‖ ^ 2) -
        (T * Real.log (T / (2 * Real.pi)) - S * Real.log (S / (2 * Real.pi))) -
        (2 * Real.eulerMascheroniConstant - 1) * (T - S) := by
  sorry

/-- Adjacent error increments add, including degenerate intervals. -/
example (S T U : ℝ) : (error T - error S) + (error U - error T) = error U - error S := by
  ring

/-- Explicit Atkinson remainder from the BBR finite input for proportional truncation. -/
theorem atkinson_remainder_budget (hBBR : BBRFiniteInput) {T : ℝ} (hT : (10 : ℝ) ^ 30 ≤ T) (N : ℕ)
    (hN : (9 / 10 : ℝ) * T ≤ N ∧ (N : ℝ) ≤ (11 / 10 : ℝ) * T) :
    |error T - atkinson.firstSum T N - atkinson.secondSum T (atkinson.cutoff T (N + 1 / 2))| ≤
      95 * Real.log T ^ 2 + 275 * Real.log T + 73 * (10 : ℝ) ^ 17 := by
  sorry

/-- The BBR finite input supplies the explicit second-moment bound at the stated endpoint. -/
theorem atkinson_bound (hBBR : BBRFiniteInput) {T : ℝ} (hT : (10 : ℝ) ^ 30 ≤ T) :
    |error T| ≤ 110 * Real.sqrt T * Real.log T := by
  sorry

/-- The second-moment asymptotic from the BBR finite input has an absolute constant. -/
theorem mean_square (hBBR : BBRFiniteInput) : error =O[atTop] (fun T : ℝ => Real.sqrt T * Real.log T) := by
  sorry

end zetaSecondMoment

end AN5

/-!
The README also specifies the following API targets beyond the representative theorems:
`DirichletGRH.of_primitive` (§1.6); `endpointCap.le_one`, `endpointCap.eq_inv_abs` (§3.23a);
`atkinson.logarithmic_saddle`, `atkinson.logarithmic_saddle_uniform` (§3.23d),
`atkinson.moving_saddle` (§3.23e), `atkinson.contour_decomposition`, `atkinson.budget_bound`,
`atkinson.remainder_budget`, `atkinson.main_sum_bound` (§3.23g); and
`zetaSecondMoment.error_zero`, `zetaSecondMoment.error_continuous`,
`zetaSecondMoment.error_increment` (§3.23). These remain README API requirements.

Definitions specified in README.md beyond these representative signatures include exceptional
squareclasses (§0.13), the canonical-factor comparison (§0.15), the origin-zero adapter (§0.22),
specializations of the AL.2 paired-product theorems (§0.29), the Weil test class (§1.3), ray-character and quadratic-period
dictionaries (§§0.30, 2.1, 2.10),
Artin analytic conductors (§2.2) and the AdelicAlgebraicGroups AA.2.4 local polynomials, canonical continued Hecke
and Dedekind functions (§§2.3–2.5, 2.12), norm-regrouped Artin coefficient comparisons (§2.18), ArtinHolomorphy and
field/Hecke zero hypotheses (§§2.41–2.42), medium-prime products (§3.5), even Mangoldt (§3.8),
Gamma Euler factors (§3.10), residue-supported counts (§3.16), the logarithmic-derivative
coefficient class (§3.19), Dickman's
function (§3.21), the Bessel connection/recurrence API, ordered conditional Voronoi
transform, quantitative saddle hypotheses and two improper-integral families (§§3.23b–f),
generalized-integer norms and counts (§3.25), truncated Mangoldt functions
and errors (§§3.29, 3.39), restricted squarefree counts (§3.32), Beurling zeta functions (§3.36),
Selberg weights (§§3.31a, 3.36b), and regularized Beurling boundary logarithms (§3.42).
-/

end TauCetiRoadmap.AnalyticNumberTheoryPartI

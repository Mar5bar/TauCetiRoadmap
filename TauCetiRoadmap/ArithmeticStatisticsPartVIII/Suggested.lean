import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.HasseBound
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.TorusGeneration

/-!
# Arithmetic statistics, Part VIII: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file records light definitions and selected milestones that
can be stated against the pinned Mathlib; it is not exhaustive. Hurwitz schemes,
monodromy representations, spacing measures and the arithmetic counts remain README
targets.

Design choices made explicit here: the Kolmogorov distance lives on Mathlib's
`ProbabilityMeasure ℝ` and its CDFs; the trace estimate is stated for real `q > 1`,
its geometric use specializing `q` to a prime power; similitude cosets use Mathlib's
`Matrix.J` and the convention `h * J * hᵀ = m • J` of `Matrix.symplecticGroup`; the
allowed prime powers form a filter that is `⊥` for the modulus `0`; and degree
densities are taken along odd degrees `2 * m + 1`.
-/

noncomputable section
open scoped BigOperators Topology
open Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartVIII

#check WeierstrassCurve.hasse_bound
#check TauCeti.GLSymplecticFin.eq_top_of_adjacent_of_long

/-! ## Layer 5: Function-field distributions and geometric statistics -/

/-! ### 5.13 Concentration of polarized isogeny types -/

namespace Concentration

/-- Convex concentration: coordinates in `[0, εg]` summing to `g` have square sum at most
`(ε² + (1 - ε)²) g²` (Lipnowski–Tsimerman, Lemma 5.9). -/
theorem sum_sq_le_of_le_mul {k : ℕ} (g ε : ℝ) (hε₁ : 1 / 2 < ε) (hε₂ : ε < 1)
    (x : Fin k → ℝ) (hx₀ : ∀ i, 0 ≤ x i) (hxε : ∀ i, x i ≤ ε * g)
    (hsum : ∑ i, x i = g) :
    ∑ i, x i ^ 2 ≤ (ε ^ 2 + (1 - ε) ^ 2) * g ^ 2 := by sorry

/-- The extremal vector `(εg, (1 - ε)g)` attains the bound. -/
example (g ε : ℝ) : (ε * g) ^ 2 + ((1 - ε) * g) ^ 2 = (ε ^ 2 + (1 - ε) ^ 2) * g ^ 2 := by
  ring

/-- At `ε = 0.99` the constant is `0.9802`, the one used in Proposition 5.10. -/
example : ((99 : ℝ) / 100) ^ 2 + (1 - 99 / 100) ^ 2 = 9802 / 10000 := by norm_num

end Concentration

/-! ### 5.14 Spacing measures and Frobenius model obstructions -/

namespace GeometricStatistics
open MeasureTheory ProbabilityTheory

/-- Supremum CDF distance on the existing probability-measure carrier. -/
def kolmogorovDist (μ ν : ProbabilityMeasure ℝ) : ℝ :=
  ⨆ x : ℝ, |cdf (μ : Measure ℝ) x - cdf (ν : Measure ℝ) x|

/-- CDF distance detects equality of probability laws. -/
theorem kolmogorovDist_eq_zero_iff (μ ν : ProbabilityMeasure ℝ) :
    kolmogorovDist μ ν = 0 ↔ μ = ν := by sorry

/-- An atom at zero gives the comparison used by normalized spacing statistics. -/
theorem atom_zero_le_kolmogorovDist (μ ν : ProbabilityMeasure ℝ)
    (hμ : (μ : Measure ℝ) (Set.Iio 0) = 0)
    (hν : (ν : Measure ℝ) (Set.Iic 0) = 0) :
    (μ : Measure ℝ).real {0} ≤ kolmogorovDist μ ν := by sorry

example (μ : ProbabilityMeasure ℝ) : kolmogorovDist μ μ = 0 := by sorry
example : kolmogorovDist (diracProba (0 : ℝ)) (diracProba 1) = 1 := by sorry
example : kolmogorovDist
    (⟨(1/2 : ENNReal) • Measure.dirac (0 : ℝ) + (1/2 : ENNReal) • Measure.dirac 1,
      by sorry⟩ : ProbabilityMeasure ℝ) (diracProba 0) = 1/2 := by sorry

end GeometricStatistics

/-! ### 5.15 Class-group moments as Hurwitz counts -/

namespace DegreeDensities

/-- Upper density along odd degrees: `limsup_{m → ∞} u (2m + 1)`. -/
def upperOddDensity (u : ℕ → ℝ) : ℝ := limsup (fun m => u (2 * m + 1)) atTop

/-- Lower density along odd degrees: `liminf_{m → ∞} u (2m + 1)`. -/
def lowerOddDensity (u : ℕ → ℝ) : ℝ := liminf (fun m => u (2 * m + 1)) atTop

/-- For bounded sequences the lower odd density is at most the upper one. -/
theorem lowerOddDensity_le_upperOddDensity (u : ℕ → ℝ) (hu : ∃ B, ∀ n, |u n| ≤ B) :
    lowerOddDensity u ≤ upperOddDensity u := by sorry

/-- An alternating sequence on odd degrees has distinct densities. -/
example : upperOddDensity (fun n => (-1 : ℝ) ^ ((n - 1) / 2)) = 1 ∧
    lowerOddDensity (fun n => (-1 : ℝ) ^ ((n - 1) / 2)) = -1 := by sorry

/-- Values at even degrees are ignored. -/
example (u v : ℕ → ℝ) (h : ∀ m, u (2 * m + 1) = v (2 * m + 1)) :
    upperOddDensity u = upperOddDensity v := by
  simp only [upperOddDensity, h]

end DegreeDensities

/-! ### 5.16 Top-degree traces and the uniform trace estimate -/

namespace GeometricStatistics

/-- The finite numerical trace estimate, with the same degree-dependent Betti bound. -/
theorem trace_error_bound (n : ℕ) (q C : ℝ) (hq : 1 < q) (hC : 1 ≤ C)
    (hlarge : C < Real.sqrt q) (t : Fin (2 * n) → ℝ)
    (ht : ∀ j, |t j| ≤ q ^ ((j.val : ℝ) / 2) * C ^ (2 * n - j.val + 1)) :
    |q⁻¹ ^ n * ∑ j, (-1 : ℝ) ^ j.val * t j| ≤ C ^ 2 / (Real.sqrt q - C) := by sorry

example : (1 : ℝ) ^ 2 / (Real.sqrt 16 - 1) = 1/3 := by sorry
example : ¬ (1 : ℝ) < Real.sqrt 1 := by sorry
example : |(1 : ℝ) / 9 * (1 - 3)| = 2/9 ∧
    (1 : ℝ) ^ 2 / (Real.sqrt 9 - 1) = 1/2 := by sorry
example (q C : ℝ) (hq : 1 < q) (hC : 1 ≤ C) (hlarge : C < Real.sqrt q) :
    |q⁻¹ ^ 0 * ∑ j : Fin 0, (-1 : ℝ) ^ j.val * (0 : ℝ)| = 0 ∧
      0 < C ^ 2 / (Real.sqrt q - C) := by sorry

end GeometricStatistics

/-! ### 5.18 Similitude orbits and rational components -/

namespace Similitude

variable (l R : Type*) [Fintype l] [DecidableEq l] [CommRing R]

/-- The similitude coset of multiplier `m`: matrices with `h * J * hᵀ = m • J`, in the
convention of `Matrix.symplecticGroup`. -/
def similitudeCoset (m : R) : Set (Matrix (l ⊕ l) (l ⊕ l) R) :=
  {h | h * Matrix.J l R * h.transpose = m • Matrix.J l R}

/-- The similitude matrices: the union of the cosets of unit multiplier. -/
def similitudeSet : Set (Matrix (l ⊕ l) (l ⊕ l) R) :=
  ⋃ m : Rˣ, similitudeCoset l R (m : R)

/-- Multiplier one is Mathlib's symplectic group. -/
theorem similitudeCoset_one :
    similitudeCoset l R 1 = (Matrix.symplecticGroup l R : Set (Matrix (l ⊕ l) (l ⊕ l) R)) := by
  sorry

/-- Multipliers multiply. -/
theorem similitudeCoset_mul_mem {m m' : R} {h h' : Matrix (l ⊕ l) (l ⊕ l) R}
    (hh : h ∈ similitudeCoset l R m) (hh' : h' ∈ similitudeCoset l R m') :
    h * h' ∈ similitudeCoset l R (m * m') := by sorry

/-- For `g ≥ 1` the multiplier of a similitude is unique. -/
theorem multiplier_unique [Nonempty l] {m m' : R}
    {h : Matrix (l ⊕ l) (l ⊕ l) R}
    (hm : h ∈ similitudeCoset l R m) (hm' : h ∈ similitudeCoset l R m') : m = m' := by sorry

/-- `diag(1, -1)` has multiplier `-1`, a unit. -/
example : Matrix.fromBlocks (1 : Matrix Unit Unit ℤ) 0 0 (-1) ∈ similitudeSet Unit ℤ := by
  sorry

/-- `diag(1, 3)` over `ℤ` has multiplier `3`, which is not a unit, so it is not a
similitude matrix. -/
example : Matrix.fromBlocks (1 : Matrix Unit Unit ℤ) 0 0 3 ∈ similitudeCoset Unit ℤ 3 ∧
    Matrix.fromBlocks (1 : Matrix Unit Unit ℤ) 0 0 3 ∉ similitudeSet Unit ℤ := by sorry

end Similitude

/-! ### 5.20 Good nonabelian function-field moments -/

namespace LargeQ

/-- The prime powers coprime to `m`, tending to infinity. -/
def allowedPrimePowers (m : ℕ) : Filter ℕ :=
  atTop ⊓ 𝓟 {q | IsPrimePow q ∧ Nat.Coprime q m}

/-- Eventual-degree large-`q` limit: for every large fixed degree `n`, `E q n → c n` as `q`
runs through the allowed prime powers. -/
def EventualDegreeLargeQLimit (m : ℕ) (E : ℕ → ℕ → ℝ) (c : ℕ → ℝ) : Prop :=
  ∃ n₀, ∀ n ≥ n₀, Tendsto (fun q => E q n) (allowedPrimePowers m) (𝓝 (c n))

theorem allowedPrimePowers_neBot (m : ℕ) (hm : m ≠ 0) : (allowedPrimePowers m).NeBot := by
  sorry

/-- No prime power is coprime to `0`, so the modulus `0` gives the bottom filter. -/
theorem allowedPrimePowers_zero : allowedPrimePowers 0 = ⊥ := by sorry

theorem EventualDegreeLargeQLimit.unique {m : ℕ} (hm : m ≠ 0) {E : ℕ → ℕ → ℝ}
    {c c' : ℕ → ℝ} (h : EventualDegreeLargeQLimit m E c)
    (h' : EventualDegreeLargeQLimit m E c') : ∀ᶠ n in atTop, c n = c' n := by sorry

/-- `n / (n + q)` has eventual-degree large-`q` limit `0`, although for each fixed `q` it
tends to `1` in the degree. -/
example : EventualDegreeLargeQLimit 1 (fun q n => (n : ℝ) / (n + q)) (fun _ => 0) ∧
    ∀ q : ℕ, Tendsto (fun n : ℕ => (n : ℝ) / (n + q)) atTop (𝓝 1) := by sorry

/-- Along the bottom filter every target is a limit: uniqueness needs `m ≠ 0`. -/
example : EventualDegreeLargeQLimit 0 (fun _ _ => 0) (fun _ => 1) := by sorry

end LargeQ

/-! ### 5.21 Bad types and whole component profiles -/

namespace ComponentProfiles

/-- The least integer `≥ N₀` with the parity of `e`. -/
def leastWithParity (N₀ e : ℕ) : ℕ := if N₀ % 2 = e % 2 then N₀ else N₀ + 1

/-- Matching parity retains the threshold; opposite parity advances it by one. -/
example : leastWithParity 2 0 = 2 ∧ leastWithParity 2 1 = 3 := by decide

/-- Only the residue of the requested parity matters. -/
example : leastWithParity 0 3 = 1 := by decide

/-- The number of multidegrees `m : Fin N → ℕ` of total degree `d` with every `m i ≥ N₀` and
`m i ≡ ε i (mod 2)`. -/
def parityMultidegreeCount (N N₀ d : ℕ) (ε : Fin N → ℕ) : ℕ :=
  ((Finset.Nat.antidiagonalTuple N d).filter
    (fun m => ∀ i, N₀ ≤ m i ∧ m i % 2 = ε i % 2)).card

/-- Stars and bars on the parity class. -/
theorem parityMultidegreeCount_eq (N N₀ d : ℕ) (hN : 1 ≤ N) (ε : Fin N → ℕ) :
    parityMultidegreeCount N N₀ d ε =
      if ∑ i, leastWithParity N₀ (ε i) ≤ d ∧ (d - ∑ i, leastWithParity N₀ (ε i)) % 2 = 0 then
        Nat.choose ((d - ∑ i, leastWithParity N₀ (ε i)) / 2 + N - 1) (N - 1)
      else 0 := by sorry

/-- `(0,4), (2,2), (4,0)`. -/
example : parityMultidegreeCount 2 0 4 ![0, 0] = 3 := by decide

/-- One odd part cannot have even total. -/
example : parityMultidegreeCount 1 0 4 ![1] = 0 := by decide

/-- With threshold one: `(1,3)` and `(3,1)`. -/
example : parityMultidegreeCount 2 1 4 ![1, 1] = 2 := by decide

end ComponentProfiles

/-!
The README also specifies the surrounding API: `GeometricStatistics.kolmogorovDist_nonneg`,
`GeometricStatistics.kolmogorovDist_comm`, `GeometricStatistics.kolmogorovDist_le_one`,
`GeometricStatistics.abs_cdf_sub_le_kolmogorovDist`, `GeometricStatistics.kolmogorovDist_triangle`
and `similitudeCoset_map`. Its spacing-measure targets include
`GeometricStatistics.length_cyclicGaps`, `GeometricStatistics.cyclicGaps_nonneg`,
`GeometricStatistics.sum_cyclicGaps`, `GeometricStatistics.spacingMeasure_univ`,
`GeometricStatistics.spacingMeasure_Iio_zero`, `GeometricStatistics.card_eigenangles` and
`GeometricStatistics.sub_one_div_le_spacingMeasure_zero`; their carriers are specified there.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartVIII

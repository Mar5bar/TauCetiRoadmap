import TauCetiRoadmap.IndexTheory.Suggested
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic

/-!
Representative local forms for I8; the README is definitive and nonexhaustive.
The matrices are the actual df and fibre endomorphism in chosen bases.
The geometric interpretation requires det(1-df) ≠ 0, as in I8. No private
manifold, bundle, cohomology or analytic fixed-map substitute is introduced.
-/

namespace IndexTheorySuggested.HolomorphicFixedPoint

/-- The local Lefschetz expression in tangent and bundle coordinates. -/
noncomputable def localContribution {n r : ℕ}
    (df : Matrix (Fin n) (Fin n) ℂ) (φ : Matrix (Fin r) (Fin r) ℂ) : ℂ :=
  Matrix.trace φ / (1 - df).det

/-- A zero-rank fibre contributes zero. -/
theorem localContribution_zero_fibre {n : ℕ}
    (df : Matrix (Fin n) (Fin n) ℂ) :
    localContribution df (0 : Matrix (Fin 0) (Fin 0) ℂ) = 0 := by
  simp [localContribution]

/-- At a point the empty tangent determinant is one. -/
theorem localContribution_point {r : ℕ}
    (φ : Matrix (Fin r) (Fin r) ℂ) :
    localContribution (0 : Matrix (Fin 0) (Fin 0) ℂ) φ = Matrix.trace φ := by
  simp [localContribution]

/-- The nondegenerate fixed-point expression on a complex line. -/
theorem localContribution_line (q a : ℂ) :
    localContribution (Matrix.of fun _ _ : Fin 1 => q) (Matrix.of fun _ _ : Fin 1 => a) = a / (1 - q) := by
  unfold localContribution
  rw [Matrix.trace_fin_one, Matrix.det_fin_one]
  simp only [Matrix.sub_apply, Matrix.one_apply_eq, Matrix.of_apply]

/-- Pullback on O(1): df multipliers q,q⁻¹ and fibre scalars1,q. -/
theorem projectiveLine_O_one (q : ℂ) (hq0 : q ≠ 0) (hq1 : q ≠ 1) :
    1 / (1 - q) + q / (1 - q⁻¹) = 1 + q := by
  have h1q : 1 - q ≠ 0 := sub_ne_zero.mpr hq1.symm
  have hq1' : q - 1 ≠ 0 := sub_ne_zero.mpr hq1
  field_simp
  ring_nf

/-- The same map on the trivial line has Lefschetz trace one. -/
theorem projectiveLine_trivial (q : ℂ) (hq0 : q ≠ 0) (hq1 : q ≠ 1) :
    1 / (1 - q) + 1 / (1 - q⁻¹) = 1 := by
  have h1q : 1 - q ≠ 0 := sub_ne_zero.mpr hq1.symm
  have hq1' : q - 1 ≠ 0 := sub_ne_zero.mpr hq1
  field_simp
  ring_nf

end IndexTheorySuggested.HolomorphicFixedPoint

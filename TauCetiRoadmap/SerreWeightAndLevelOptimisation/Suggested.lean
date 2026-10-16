import Mathlib

/-!
# SerreWeightAndLevelOptimisation: representative target signatures

The roadmap is the accompanying README. This file records light definitions and
representative theorem signatures statable against the pinned APIs; it is not
exhaustive. It uses Mathlib’s submodule quotient for integral level changing and fixes
the arithmetic reduced level used in the elliptic specialization. Integral
modular cohomology, residual Galois representations, Katz eigensystems and
quaternionic automorphic modules are specified in the README.
-/

namespace TauCetiRoadmap.SerreWeightAndLevelOptimisation

/-! ## Layer 1: Level-changing algebra and cohomology -/

/-- Complementary coordinate lattices have no gluing defect. -/
example : Subsingleton
    ((Fin 2 → ℤ) ⧸
      ((Submodule.span ℤ ({![1, 0]} : Set (Fin 2 → ℤ))) ⊔
       (Submodule.span ℤ ({![0, 1]} : Set (Fin 2 → ℤ))))) := by
  sorry

/-- Two saturated rationally complementary lattices can still have index two. -/
example : Nat.card
    ((Fin 2 → ℤ) ⧸
      ((Submodule.span ℤ ({![1, 0]} : Set (Fin 2 → ℤ))) ⊔
       (Submodule.span ℤ ({![1, 2]} : Set (Fin 2 → ℤ))))) = 2 := by
  sorry

/-! ## Layer 6: Exports for Serre and elliptic curves -/

open scoped BigOperators

/-- Bennett–Siksek's reduced level: remove precisely the multiplicative primes
whose discriminant valuation is divisible by the coefficient prime.
The product includes the coefficient prime itself when it satisfies the test.
For an elliptic application `M` is the conductor and `Δ` a nonzero minimal
discriminant. The arithmetic expression also has a value at zero. -/
noncomputable def reducedLevel (M ℓ : ℕ) (Δ : ℤ) : ℕ :=
  M / ∏ q ∈ M.primeFactors.filter
    (fun q => padicValNat q M = 1 ∧ ℓ ∣ padicValNat q Δ.natAbs), q

/-- The removed product divides the conductor, so the reduced level does too. -/
theorem reducedLevel_dvd (M ℓ : ℕ) (Δ : ℤ) : reducedLevel M ℓ Δ ∣ M := by
  sorry

/-- A positive conductor remains positive after removing its selected factors. -/
theorem reducedLevel_pos (M ℓ : ℕ) (Δ : ℤ) (hM : 0 < M) :
    0 < reducedLevel M ℓ Δ := by
  sorry

/-- At a conductor exponent of one, disappearance is exactly the valuation test. -/
theorem reducedLevel_prime_removed_iff (M ℓ q : ℕ) (Δ : ℤ)
    (hq : q.Prime) (hM : 0 < M) (hqM : q ∣ M)
    (hval : padicValNat q M = 1) :
    ¬ q ∣ reducedLevel M ℓ Δ ↔ ℓ ∣ padicValNat q Δ.natAbs := by
  sorry

/-- A higher conductor exponent is retained even when the discriminant
valuation passes the divisibility test. -/
theorem reducedLevel_retains_higher_exponent (M ℓ q : ℕ) (Δ : ℤ)
    (hq : q.Prime) (hM : 0 < M) (hval : 2 ≤ padicValNat q M) :
    padicValNat q (reducedLevel M ℓ Δ) = padicValNat q M := by
  sorry

/-- The removed prime may be the coefficient prime itself. -/
example : reducedLevel 33 3 (3 ^ 6 * 11 ^ 2) = 11 := by
  sorry

/-- A conductor exponent greater than one cannot be removed by this formula. -/
example : reducedLevel 45 7 (3 ^ 7 * 5 ^ 7) = 9 := by
  sorry

/-!
The definitions `complexConjugationAuxiliaryPrime`, `minimalWeightOneIdeal`,
`buzzardMultiplicityOne` and `kwOptimisationData` require the residual,
coherent and geometric carriers specified in README.md. The arithmetic API
`reducedLevel_away_conductor`, `reducedLevel_ext`, `reducedLevel_simp`,
`reducedLevel_isomorphic_model` and `reducedLevel_coefficient_prime_example`
is specified there. The conductor and elliptic-model comparisons require
the geometric carriers of the README.
-/

end TauCetiRoadmap.SerreWeightAndLevelOptimisation

import Mathlib

/-!
# PrismaticCohomologyPartII: representative target signatures

The roadmap is README.md. These are suggested forms, not an exhaustive checklist.
This file records the convention checks statable against the pinned APIs.

AInfCohomology §AI.3.3 supplies q-integers; their polynomial values, including at q = 1,
are checked here using Mathlib finite sums. These signatures and
examples fix the coefficient, cochain sign and derivative-thickening conventions of
Layers 3–5; the complete Nygaard, stack and q-PD constructions are specified in README.md.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartII

open scoped BigOperators

namespace QCrys

variable {R : Type*} [CommRing R]

-- Mathlib supplies the denominator-free geometric-series identity.
#check geom_sum_mul

/-- The distinguished generator specializes to p. -/
example (p : ℕ) : (∑ i ∈ Finset.range p, (1 : ℤ) ^ i) = p := by
  sorry

/-- The empty sum is zero, including at q=0. -/
example (q : R) : (∑ i ∈ Finset.range 0, q ^ i) = 0 := by simp

/-- A dyadic q-integer has two terms, not one. -/
example (q : R) : (∑ i ∈ Finset.range 2, q ^ i) = 1 + q := by
  simp [Finset.sum_range_succ]

/-- A nontrivial specialization distinguishes the polynomial from the constant n. -/
example : (∑ i ∈ Finset.range 3, (2 : ℤ) ^ i) = 7 := by
  norm_num [Finset.sum_range_succ]

/-- The two-endomorphism cochain Koszul convention `d⁰ m = (D₁ m, D₂ m)`,
`d¹ (a, b) = D₂ a - D₁ b`: commuting operators give `d¹ ∘ d⁰ = 0`. -/
example {M : Type*} [AddCommGroup M] [Module R M] (D₁ D₂ : M →ₗ[R] M)
    (h : D₁ ∘ₗ D₂ = D₂ ∘ₗ D₁) (m : M) : D₂ (D₁ m) - D₁ (D₂ m) = 0 := by
  rw [← LinearMap.comp_apply, ← h, LinearMap.comp_apply, sub_self]

/-- Replacing subtraction by addition fails already at the integer unit. -/
example : 3 * (2 * (1 : ℤ)) + 2 * (3 * 1) = 12 := by norm_num

/-- In the dyadic derivative thickening, the epsilon-square term changes the coefficient.
This pins the Frobenius formula without cancelling the coordinate. -/
example (t x e : R) (he : e ^ 2 = t * x * e) :
    (x + e) ^ 2 = x ^ 2 + (2 + t) * x * e := by
  calc
    (x + e) ^ 2 = x ^ 2 + 2 * x * e + e ^ 2 := by ring
    _ = x ^ 2 + (2 + t) * x * e := by rw [he]; ring

/-
The q-PD operation and its laws are README §5.1 targets: gamma_add, gamma_mul,
pAnalog_mul_gamma and delta_pAnalog_sub_one_mem need the constructed δ-ring interface.
The envelope laws in §5.7 are envelopeMap_delta, envelope_frobenius_mem,
envelopeMap_mem, envelopeLift_comp, envelopeLift_unique, envelopeLift_isDeltaHom,
envelopeLift_map_I and envelopePair_q; the q-PD envelope is a construction target.
The site and comparison laws in §§5.9–5.10 are qCrystallineMap_id,
qCrystallineMap_comp, qCrystallineEval_natural, qCrystallineEval_frobenius and
cechAlexanderZero_weaklyInitial. Their q-crystalline carriers are specified in the README.
-/

end QCrys

end TauCetiRoadmap.PrismaticCohomologyPartII

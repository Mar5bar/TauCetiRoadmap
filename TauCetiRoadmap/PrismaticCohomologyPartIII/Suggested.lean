import Mathlib

/-!
# PrismaticCohomologyPartIII: representative target signatures

The roadmap is README.md. This file records suggested forms statable against the pinned
Mathlib and Tau Ceti APIs, not an exhaustive checklist.

These elementary fixed-point and lattice witnesses pin the conventions of Layers 6–7.
Frobenius fixed points in README.md are derived fibres; taking an ordinary kernel records
only their degree-zero part. The comparison and crystal targets retain their full sites,
period coefficients and cohomological shifts there.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartIII

/-- For the zero Frobenius, the fixed-point kernel is zero. -/
example {M : Type*} [AddCommGroup M] (x : M) :
    (0 : M →+ M) x = x ↔ x = 0 := by simp [eq_comm]

/-- Identity Frobenius fixes every element, including on the zero group. -/
example {M : Type*} [AddCommGroup M] (x : M) : (AddMonoidHom.id M) x = x := rfl

/-- The identity-minus-identity differential is zero; its cokernel is not removed. -/
example {M : Type*} [AddCommGroup M] :
    (AddMonoidHom.id M - AddMonoidHom.id M : M →+ M) = 0 := sub_self _

/-- The coefficient Frobenius is the identity on the prime field. -/
example (p : ℕ) [Fact p.Prime] (x : ZMod p) : x ^ p - x = 0 := by
  rw [ZMod.pow_card, sub_self]

/-- The dyadic Artin–Schreier map on the prime field is zero, not surjective. -/
example : ¬ ∃ x : ZMod 2, x ^ 2 - x = 1 := by decide

/-- Multiplication by p preserves the integral rank-one lattice. -/
example (p : ℕ) : ∀ x : ℤ, ∃ y : ℤ, (p : ℚ) * (x : ℚ) = (y : ℚ) := by
  intro x
  exact ⟨(p : ℤ) * x, by push_cast; rfl⟩

/-- Inverting p need not preserve that lattice: this is the negative twist control. -/
example : ¬ ∃ x : ℤ, (x : ℚ) = (2 : ℚ)⁻¹ := by
  intro ⟨x, hx⟩
  have h : (2 : ℚ) * x = 1 := by rw [hx]; norm_num
  have hi : 2 * x = (1 : ℤ) := by exact_mod_cast h
  omega

/-- Rank zero remains zero under either semilinear normalization. -/
example (p : ℕ) : (p : ℚ) * 0 = 0 ∧ (p : ℚ)⁻¹ * 0 = 0 := by simp

end TauCetiRoadmap.PrismaticCohomologyPartIII

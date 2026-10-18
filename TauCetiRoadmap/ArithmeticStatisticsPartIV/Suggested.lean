import Mathlib

/-!
# Arithmetic statistics, Part IV: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions and
selected milestones statable against the pinned APIs. Counts retain the specified cutoffs and denominators; orbit and arithmetic
probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartIV

/-! ## Layer 3: Finite groups, matrix laws and moment tools -/

namespace FieldStatistics

/-- The p-torsion in the (k−1)st power image, rather than all p-torsion. -/
def powerRank (A : Type*) [CommGroup A] [Finite A] (p k : ℕ) : ℕ :=
  Nat.log p (Nat.card {a : A // (∃ b : A, b ^ (p ^ (k - 1)) = a) ∧ a ^ p = 1})

/-- Adjacent power-image ranks add under direct products. -/
theorem powerRank_prod (A B : Type*) [CommGroup A] [Finite A] [CommGroup B] [Finite B]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank (A × B) p k = powerRank A p k + powerRank B p k := by sorry

example : powerRank (Multiplicative (ZMod 2)) 2 2 = 0 := by sorry
example : powerRank (Multiplicative (ZMod 4)) 2 2 = 1 := by sorry

/-- Binary coordinates for the Fouvry–Klüners finite quadratic calculation. -/
abbrev FKSpace (k : ℕ) := Fin k → ZMod 2 × ZMod 2

/-- The asymmetric phase in the quadratic-discriminant Jacobi expansion. -/
def fkPhase {k : ℕ} (u v : FKSpace k) : ZMod 2 :=
  ∑ j, ((u j).1 + (v j).1) * ((u j).1 + (v j).2)
/-- The phase relative to zero, as a quadratic expression. -/
def fkQuadratic {k : ℕ} (u : FKSpace k) : ZMod 2 :=
  ∑ j, (u j).1 * ((u j).1 + (u j).2)
/-- Linked indices have nonzero symmetrized phase. -/
def fkLinked {k : ℕ} (u v : FKSpace k) : Prop := fkPhase u v + fkPhase v u = 1
/-- Good planes are k-dimensional subspaces annihilated by the directed pairing. -/
def fkGoodPlanes (k : ℕ) : Set (Submodule (ZMod 2) (FKSpace k)) :=
  {U | Module.finrank (ZMod 2) U = k ∧
    ∀ u ∈ U, ∀ v ∈ U, (∑ j, (u j).1 * ((v j).1 + (v j).2)) = 0}
/-- The FK good k-planes are counted by all subspaces of F₂^k. -/
theorem fk_good_subspace_bijection (k : ℕ) :
    Nonempty ({U // U ∈ fkGoodPlanes k} ≃ Submodule (ZMod 2) (Fin k → ZMod 2)) := by sorry

example : fkPhase (fun _ : Fin 1 => (1, 0)) 0 = 1 ∧
    fkPhase 0 (fun _ : Fin 1 => (1, 0)) = 0 := by sorry
example : fkQuadratic (fun _ : Fin 1 => (1, 0)) = 1 ∧
    fkQuadratic (fun _ : Fin 1 => (1, 1)) = 0 := by sorry
example : fkLinked (fun _ : Fin 1 => (1, 0)) 0 := by sorry
example : Nat.card (FKSpace 0) = 1 ∧ Nat.card (FKSpace 1) = 4 := by sorry
example : (fkGoodPlanes 2).ncard = 5 := by sorry
example : powerRank (Multiplicative (ZMod 4)) 2 1 = 1 ∧
    powerRank (Multiplicative (ZMod 2)) 2 1 = 1 := by sorry
example : powerRank Unit 2 1 = 0 := by sorry
example : Nat.card (FKSpace 2) = 16 := by sorry
example : fkPhase (0 : FKSpace 0) 0 = 0 ∧ fkQuadratic (0 : FKSpace 0) = 0 ∧
    ¬ fkLinked (0 : FKSpace 0) 0 := by sorry
example : fkPhase (fun _ : Fin 1 => (1, 0)) (fun _ => (1, 1)) = 0 ∧
    fkPhase (fun _ : Fin 1 => (1, 1)) (fun _ => (1, 0)) = 0 := by sorry
example : fkQuadratic (fun _ : Fin 1 => (0, 1)) = 0 := by sorry
example : ¬ fkLinked (fun _ : Fin 1 => (1, 0)) (fun _ => (1, 1)) := by sorry
example : fkLinked (fun _ : Fin 1 => (0, 1)) (fun _ => (1, 1)) := by sorry
example : (fkGoodPlanes 0).ncard = 1 := by sorry
example : (fkGoodPlanes 1).ncard = 2 := by sorry
example : Submodule.span (ZMod 2)
    {fun _ : Fin 1 => ((1 : ZMod 2), (0 : ZMod 2))} ∉ fkGoodPlanes 1 := by sorry
example : powerRank (Multiplicative (ZMod 8)) 2 3 = 1 ∧
    powerRank (Multiplicative (ZMod 8)) 2 4 = 0 := by sorry
example : ¬ fkLinked (fun _ : Fin 1 => (1, 1)) 0 ∧
    fkPhase (fun _ : Fin 1 => (1, 1)) 0 = 1 ∧
    fkPhase 0 (fun _ : Fin 1 => (1, 1)) = 1 := by sorry

end FieldStatistics

namespace Distributions
/-- Wood's separating product on a finite partition grid, with its convergent first factor. -/
def woodGridSeparator (m p : ℕ) (b : Fin (m + 1) → ℕ)
    (z : Fin (m + 1) → ℂ) : ℂ :=
  (∏' j : ℕ, (1 - z 0 / (p : ℂ) ^ (b 0 + 1 + j))) *
    ∏ i : Fin m,
      ∏ j ∈ Finset.Icc
        ((∑ k : Fin (m + 1) with k.val ≤ i.val + 1, b k) + 1)
        ((∑ k : Fin (m + 1) with k.val ≤ i.val, b k) + b i.castSucc),
        (1 - z i.succ / (p : ℂ) ^ j)

/-- The separator vanishes on a partition lexicographically greater than its target. -/
theorem woodGridSeparator_upper {m p : ℕ} (hp : p.Prime)
    (b f : Fin (m + 1) → ℕ) (hb : Antitone b) (hf : Antitone f)
    (hlex : ∃ i : Fin (m + 1), (∀ j, j < i → f j = b j) ∧ b i < f i) :
    woodGridSeparator m p b
      (fun i => (p : ℂ) ^ (∑ j : Fin (m + 1) with j ≤ i, f j)) = 0 := by sorry

/-- The same product is nonzero at the target partition. -/
theorem woodGridSeparator_diagonal {m p : ℕ} (hp : p.Prime)
    (b : Fin (m + 1) → ℕ) (hb : Antitone b) :
    woodGridSeparator m p b
      (fun i => (p : ℂ) ^ (∑ j : Fin (m + 1) with j ≤ i, b j)) ≠ 0 := by sorry


example : woodGridSeparator 0 2 (fun _ => 0) 0 = 1 := by sorry
example : woodGridSeparator 0 2 (fun _ => 0) (fun _ => 2) = 0 := by sorry
example : woodGridSeparator 0 2 (fun _ => 0) (fun _ => 1) ≠ 0 := by sorry

example : woodGridSeparator 0 2 (fun _ => 1) (fun _ => 4) = 0 ∧
    woodGridSeparator 0 2 (fun _ => 1) (fun _ => 2) ≠ 0 := by sorry

example : woodGridSeparator 1 2 ![2, 0] ![4, 8] = 0 ∧
    woodGridSeparator 1 2 ![2, 0] ![4, 4] ≠ 0 := by sorry

end Distributions

/-! The README additionally specifies the number-field counting function and its
reciprocal-automorphism weight; classGroupTorsionCard; gaussBinom; the
partition-indexed FinAbPGroupClass representatives, conjugate partitions,
multiplicities and automorphism counts; surjCard; the Cohen–Lenstra constants,
weights and measures; surjectionMoment; IsEnlargement and enlargements; normalized
p-adic matrix Haar measure, padicCokernel and cokernelLaw; the finite product
Cohen–Lenstra measure; matrixKernelLaw and symmetricKernelLaw. Their full APIs,
checks and end theorems remain in the README.

The following API signatures are also specified in the README:
FieldStatistics.powerRank_eq_log_quotient; FieldStatistics.powerRank_congr;
FieldStatistics.powerRank_antitone; FieldStatistics.powerRank_one_eq_elementaryTwo;
FieldStatistics.fkPhase_diagonal; FieldStatistics.fkPhase_linked_iff;
FieldStatistics.fkLinked_translate; FieldStatistics.mem_fkGoodPlanes;
FieldStatistics.finite_fkGoodPlanes; FieldStatistics.fkGoodPlanes_ncard;
FieldStatistics.fkGoodPlanes_linear_constraint;
Distributions.woodGridSeparator_zero; Distributions.woodGridSeparator_one_variable.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartIV

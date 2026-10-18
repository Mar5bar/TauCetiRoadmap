import Mathlib
import TauCeti.NumberTheory.ClassGroup.ElementaryTwoQuotient

/-!
# Arithmetic statistics, Part IV: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions and
selected milestones statable against the pinned APIs. Counts retain the specified cutoffs and denominators; orbit and arithmetic
probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology NumberField
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartIV

/-! ## Layer 3: Finite groups, matrix laws and moment tools -/

/-- The cardinality of the m-torsion in the wide ideal class group. -/
def classGroupTorsionCard (K : Type*) [Field K] [NumberField K] (m : ℕ) : ℕ :=
  Nat.card {c : ClassGroup (𝓞 K) // c ^ m = 1}

example (K : Type*) [Field K] [NumberField K] :
    classGroupTorsionCard K 1 = 1 := by sorry
example (K : Type*) [Field K] [NumberField K] :
    classGroupTorsionCard K 2 =
      Nat.card (TauCeti.ClassGroup.ElementaryTwoQuotient (𝓞 K)) := by sorry

/-- Gaussian polynomials with natural coefficients and a separate zero column. -/
def gaussBinomPoly : ℕ → ℕ → ℕ[X]
  | 0, 0 => 1
  | 0, _ + 1 => 0
  | _ + 1, 0 => 1
  | n + 1, k + 1 =>
      gaussBinomPoly n k + X ^ (k + 1) * gaussBinomPoly n (k + 1)

/-- Evaluation of the Gaussian polynomial in a commutative semiring. -/
def gaussBinom {R : Type*} [CommSemiring R] (t : R) (n k : ℕ) : R :=
  (gaussBinomPoly n k).eval₂ (Nat.castRingHom R) t

example : gaussBinom (2 : ℕ) 4 2 = 35 := by sorry
example : gaussBinom (1 : ℕ) 5 2 = 10 := by sorry
example : gaussBinom (2 : ℕ) 3 1 = 7 := by sorry
example : gaussBinom (2 : ℕ) 2 1 = 3 := by sorry
example {R : Type*} [CommSemiring R] (t : R) (n : ℕ) :
    gaussBinom t n 0 = 1 := by sorry
example {R : Type*} [CommSemiring R] (t : R) : gaussBinom t 0 0 = 1 := by sorry
example {R : Type*} [CommSemiring R] (t : R) (k : ℕ) :
    gaussBinom t 0 (k + 1) = 0 := by sorry
example {R : Type*} [CommSemiring R] (t : R) {n k : ℕ} (hk : n < k) :
    gaussBinom t n k = 0 := by sorry
example {R : Type*} [CommSemiring R] (t : R) {n k : ℕ} (hk : k ≤ n) :
    gaussBinom t n k = gaussBinom t n (n - k) := by sorry
example {R : Type*} [CommSemiring R] (t : R) :
    gaussBinom t 1 1 = gaussBinom t 0 0 + t * gaussBinom t 0 1 := by sorry
example : gaussBinom (2 : ℕ) 3 4 = 0 ∧ gaussBinom (2 : ℕ) 3 (3 - 4) = 1 := by sorry

/-- Euler's positive q-binomial series sums to its convergent infinite product. -/
theorem euler_qBinomial_sum {q : ℝ} (hq0 : 0 < q) (hq1 : q < 1) :
    Multipliable (fun i : ℕ => 1 + q ^ (i + 1)) ∧
      HasSum (fun n : ℕ => q ^ (n * (n + 1) / 2) /
        ∏ i ∈ Finset.range n, (1 - q ^ (i + 1)))
        (∏' i : ℕ, (1 + q ^ (i + 1))) := by sorry

/-- The number of surjective additive homomorphisms, finite for finite source and target. -/
def surjCard (X A : Type*) [AddCommGroup X] [AddCommGroup A] : ℕ :=
  Nat.card {f : X →+ A // Function.Surjective f}

example {p : ℕ} (hp : p.Prime) : surjCard (ZMod (p ^ 2)) (ZMod p) = p - 1 := by sorry
example {p : ℕ} (hp : p.Prime) :
    surjCard (ZMod p × ZMod p) (ZMod p) = p ^ 2 - 1 := by sorry
example : surjCard (ZMod 5) (ZMod 1) = 1 := by sorry
example {p : ℕ} (hp : p.Prime) : surjCard (ZMod p) (ZMod (p ^ 2)) = 0 := by sorry
example {p : ℕ} (hp : p.Prime) : Nat.card (ZMod p →+ ZMod (p ^ 2)) = p := by sorry

/-- The rational probability of a specified right-kernel dimension for a uniform matrix. -/
def matrixKernelLaw (F : Type*) [Field F] [Fintype F] (m n j : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin m) (Fin n) F //
    Module.finrank F (LinearMap.ker M.mulVecLin) = j} : ℚ) /
    (Fintype.card F : ℚ) ^ (m * n)

example : matrixKernelLaw (ZMod 2) 1 1 0 = 1 / 2 := by sorry
example : matrixKernelLaw (ZMod 2) 1 1 1 = 1 / 2 := by sorry
example : matrixKernelLaw (ZMod 2) 2 2 0 = 6 / 16 := by sorry
example : matrixKernelLaw (ZMod 2) 2 2 1 = 9 / 16 := by sorry
example : matrixKernelLaw (ZMod 2) 2 2 2 = 1 / 16 := by sorry
example : matrixKernelLaw (ZMod 2) 0 0 0 = 1 := by sorry

example (n : ℕ) : Nat.card {M : Matrix (Fin n) (Fin n) (ZMod 2) // M.rank = n} =
    Nat.card (Matrix.GeneralLinearGroup (Fin n) (ZMod 2)) := by sorry
example : Nat.card {M : Matrix (Fin 2) (Fin 2) (ZMod 2) // M.rank = 1} = 9 := by sorry
example : Nat.card {M : Matrix (Fin 0) (Fin 0) (ZMod 2) // M.rank = 0} = 1 := by sorry

example : (∑ j ∈ Finset.range 1, matrixKernelLaw (ZMod 2) 0 0 j /
    ((2 : ℚ) ^ 0 * (2 ^ (j + 1) - 1))) = 1 := by sorry
example : (∑ j ∈ Finset.range 2, matrixKernelLaw (ZMod 2) 1 1 j /
    ((2 : ℚ) * (2 ^ (j + 1) - 1))) = 1 / 3 := by sorry
example : (∑ j ∈ Finset.range 3, matrixKernelLaw (ZMod 2) 2 2 j /
    ((2 : ℚ) ^ 2 * (2 ^ (j + 1) - 1))) = 1 / 7 := by sorry
example : (∑ j ∈ Finset.range 4, matrixKernelLaw (ZMod 2) 3 3 j /
    ((2 : ℚ) ^ 3 * (2 ^ (j + 1) - 1))) = 1 / 15 := by sorry
example {m : ℕ} (hm : m ≤ 11) :
    (∑ j ∈ Finset.range (m + 1), matrixKernelLaw (ZMod 2) m m j /
      ((2 : ℚ) ^ m * (2 ^ (j + 1) - 1))) = 1 / ((2 : ℚ) ^ (m + 1) - 1) := by sorry
example (j : Fin 4) : matrixKernelLaw (ZMod 2) 3 3 j =
    (![168, 294, 49, 1] j : ℚ) / 512 := by sorry
example : (Nat.card {T : Matrix (Fin 1) (Fin 2) (ZMod 2) //
    Function.Surjective T.mulVecLin ∧ T.mulVecLin ![1, 0] = 0} : ℚ) /
    Nat.card {T : Matrix (Fin 1) (Fin 2) (ZMod 2) // Function.Surjective T.mulVecLin} =
      1 / 3 := by sorry
example : (Nat.card {TU : Matrix (Fin 1) (Fin 2) (ZMod 2) ×
    Matrix (Fin 1) (Fin 2) (ZMod 2) // Function.Surjective TU.1.mulVecLin ∧
      TU.1.mulVecLin ![1, 0] = 0 ∧ TU.2.mulVecLin ![1, 0] = 0} : ℚ) /
    Nat.card {TU : Matrix (Fin 1) (Fin 2) (ZMod 2) × Matrix (Fin 1) (Fin 2) (ZMod 2) //
      Function.Surjective TU.1.mulVecLin} = 1 / 6 := by sorry
example : (Nat.card {Ux : Matrix (Fin 1) (Fin 2) (ZMod 2) × (Fin 2 → ZMod 2) //
    Ux.2 ≠ 0 ∧ Ux.1.mulVecLin Ux.2 = 0 ∧ Ux.1 = 0} : ℚ) /
    Nat.card {Ux : Matrix (Fin 1) (Fin 2) (ZMod 2) × (Fin 2 → ZMod 2) //
      Ux.2 ≠ 0 ∧ Ux.1.mulVecLin Ux.2 = 0} = 1 / 2 := by sorry
example : (1 : ℚ) / Nat.card (Matrix (Fin 1) (Fin 2) (ZMod 2)) = 1 / 4 := by sorry

example (v : Fin 2 → ZMod 2) :
    v ∈ LinearMap.range (0 : Matrix (Fin 2) (Fin 2) (ZMod 2)).mulVecLin ↔ v = 0 := by sorry
example : LinearMap.range (Matrix.mulVecLin ![![(0 : ZMod 2), 1], ![1, 0]]) = ⊤ := by sorry
example (S : Matrix (Fin 0) (Fin 0) (ZMod 2)) (v : Fin 0 → ZMod 2) :
    v ∈ LinearMap.range S.mulVecLin := by sorry
example (a : ZMod 2) :
    Matrix.rank (![![(0 : ZMod 2), 0], ![0, a]]) = if a = 0 then 0 else 1 := by sorry
example (x : Fin 2 → ZMod 2) :
    dotProduct x (Matrix.mulVec (![![(0 : ZMod 2), 1], ![1, 0]]) x) = 0 := by sorry
example (a : ZMod 2) :
    Matrix.rank (![![(0 : ZMod 2), 1], ![1, a]]) = 2 := by sorry
example (a : ZMod 2) :
    Matrix.rank (![![(1 : ZMod 2), 1], ![1, a]]) = if a = 1 then 1 else 2 := by sorry
example (x : Fin 2 → ZMod 2) (a : ZMod 2) :
    (Matrix.fromBlocks (![![0, 1], ![1, 0]] : Matrix (Fin 2) (Fin 2) (ZMod 2))
      (fun i (_ : Fin 1) => Matrix.mulVec (![![0, 1], ![1, 0]]) x i)
      (fun (_ : Fin 1) j => Matrix.mulVec (![![0, 1], ![1, 0]]) x j)
      (fun _ _ => a)).rank = if a = 0 then 2 else 3 := by sorry

example (k : Fin 3) : Nat.card {va : (Fin 2 → ZMod 2) × ZMod 2 //
    Matrix.rank (![![0, 0, va.1 0], ![0, 0, va.1 1], ![va.1 0, va.1 1, va.2]]) = k} =
    ![1, 1, 6] k := by sorry
example (k : Fin 3) : Nat.card {va : (Fin 2 → ZMod 3) × ZMod 3 //
    Matrix.rank (![![1, 0, va.1 0], ![0, 0, va.1 1], ![va.1 0, va.1 1, va.2]]) = k.val + 1} =
    ![3, 6, 18] k := by sorry
example (F : Type*) [Field F] [Fintype F] (n : ℕ) :
    Nat.card {va : (Fin n → F) × F //
      (Matrix.fromBlocks (1 : Matrix (Fin n) (Fin n) F)
        (fun i (_ : Fin 1) => va.1 i) (fun (_ : Fin 1) j => va.1 j) (fun _ _ => va.2)).rank = n + 2} = 0 := by sorry
example (F : Type*) [Field F] [Fintype F] (n : ℕ)
    (S : Matrix (Fin n) (Fin n) F) (hS : S.IsSymm) :
    (∑ k ∈ Finset.range (n + 2), Nat.card {va : (Fin n → F) × F //
      (Matrix.fromBlocks S (fun i (_ : Fin 1) => va.1 i)
        (fun (_ : Fin 1) j => va.1 j) (fun _ _ => va.2)).rank = k}) =
      Fintype.card F ^ (n + 1) := by sorry

/-- The rational kernel law for uniform symmetric matrices, including their diagonal entries. -/
def symmetricKernelLaw (F : Type*) [Field F] [Fintype F] (r n : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin r) (Fin r) F // M.IsSymm ∧
    Module.finrank F (LinearMap.ker M.mulVecLin) = n} : ℚ) /
    (Fintype.card F : ℚ) ^ (r * (r + 1) / 2)

example : symmetricKernelLaw (ZMod 2) 2 0 = 1 / 2 := by sorry
example : symmetricKernelLaw (ZMod 2) 2 1 = 3 / 8 := by sorry
example : symmetricKernelLaw (ZMod 2) 2 2 = 1 / 8 := by sorry
example : symmetricKernelLaw (ZMod 2) 0 0 = 1 := by sorry
example : matrixKernelLaw (ZMod 2) 2 2 0 < symmetricKernelLaw (ZMod 2) 2 0 := by sorry
example (r : ℕ) : symmetricKernelLaw (ZMod 2) r r = 1 / (2 : ℚ) ^ (r * (r + 1) / 2) :=
  by sorry

example (F : Type*) [Field F] (k : ℕ) :
    Nat.card {M : Matrix (Fin 0) (Fin 0) F // M.IsSymm ∧ M.rank = k} =
      if k = 0 then 1 else 0 := by sorry
example (k : Fin 2) : Nat.card {M : Matrix (Fin 1) (Fin 1) (ZMod 2) //
    M.IsSymm ∧ M.rank = k} = 1 := by sorry
example (k : Fin 3) : Nat.card {M : Matrix (Fin 2) (Fin 2) (ZMod 2) //
    M.IsSymm ∧ M.rank = k} = ![1, 3, 4] k := by sorry
example (k : Fin 4) : Nat.card {M : Matrix (Fin 3) (Fin 3) (ZMod 2) //
    M.IsSymm ∧ M.rank = k} = ![1, 7, 28, 28] k := by sorry
example : Nat.card {M : Matrix (Fin 3) (Fin 3) (ZMod 2) //
    M.IsSymm ∧ M.rank = 2} = 28 := by sorry
example (k : Fin 3) : Nat.card {M : Matrix (Fin 2) (Fin 2) (ZMod 3) //
    M.IsSymm ∧ M.rank = k} = ![1, 8, 18] k := by sorry
example (F : Type*) [Field F] [Fintype F] (k : Fin 2) :
    Nat.card {M : Matrix (Fin 1) (Fin 1) F // M.IsSymm ∧ M.rank = k} =
      if k = 0 then 1 else Fintype.card F - 1 := by sorry
example (F : Type*) [Field F] [Fintype F] (n k : ℕ)
    (hn : (Fintype.card F = 2 ∧ n ≤ 5) ∨ (Fintype.card F = 3 ∧ n ≤ 4) ∨
      (Fintype.card F ∈ ({4, 5, 7, 8} : Finset ℕ) ∧ n ≤ 3)) (hk : k ≤ n) :
    (Nat.card {M : Matrix (Fin n) (Fin n) F // M.IsSymm ∧ M.rank = k} : ℚ) =
      (∏ i ∈ Finset.range (k / 2),
        (Fintype.card F : ℚ) ^ (2 * (i + 1)) /
          ((Fintype.card F : ℚ) ^ (2 * (i + 1)) - 1)) *
      ∏ i ∈ Finset.range k, ((Fintype.card F : ℚ) ^ (n - i) - 1) := by sorry
example : Matrix.IsSymm (![![(0 : ZMod 2), 1], ![1, 0]]) ∧
    Matrix.rank (![![(0 : ZMod 2), 1], ![1, 0]]) = 2 := by sorry

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

example : ({U : Submodule (ZMod 2) (FKSpace 2) |
    Module.finrank (ZMod 2) U = 2 ∧
    ∀ u ∈ U, ∀ v ∈ U,
      (∑ j, (u j).1 * ((v j).1 + (v j).2)) +
      (∑ j, (v j).1 * ((u j).1 + (u j).2)) = 0} : Set _).ncard = 15 := by sorry
example : ({U : Submodule (ZMod 2) (FKSpace 1) |
    U ∈ fkGoodPlanes 1 ∧ ∀ u ∈ U, (u 0).1 + (u 0).2 = 0} : Set _).ncard = 1 := by sorry
example : ({U : Submodule (ZMod 2) (FKSpace 1) |
    U ∈ fkGoodPlanes 1 ∧ ∀ u ∈ U, (u 0).1 = 0} : Set _).ncard = 1 := by sorry

end FieldStatistics

namespace Distributions
/-- Wood's separating product on a finite partition grid.
For prime p, the first factor converges. -/
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
example : ¬ ∃ L : ℂ, Tendsto (fun N : ℕ =>
    ∏ j ∈ Finset.range N, (1 - (3 : ℂ) / (1 : ℂ) ^ (0 + 1 + j))) atTop (𝓝 L) := by sorry

end Distributions

/-! The README additionally specifies the number-field counting function and its
reciprocal-automorphism weight; the
partition-indexed FinAbPGroupClass representatives, conjugate partitions,
multiplicities and automorphism counts; the Cohen–Lenstra constants,
weights and measures; surjectionMoment; IsEnlargement and enlargements; normalized
p-adic matrix Haar measure, padicCokernel and cokernelLaw; the finite product
Cohen–Lenstra measure. Their full APIs,
checks and end theorems remain in the README.

The following API signatures are also specified in the README:
classGroupTorsionCard_pos; classGroupTorsionCard_dvd_classNumber;
classGroupTorsionCard_mul_of_coprime; classGroupTorsionCard_prime_eq_pow_rank;
classGroupTorsionCard_congr; gaussBinom_zero_right; gaussBinom_self;
gaussBinom_succ_succ; gaussBinom_eq_prod; gaussBinom_symm; gaussBinom_one;
card_submodules_finrank_eq_gaussBinom;
surjCard_congr; surjCard_toGroup_self; surjCard_le_card_hom; surjCard_punit;
surjCard_eq_zero_of_card_lt; sum_matrixKernelLaw; matrixKernelLaw_eq_zero_of_lt;
matrixKernelLaw_zero_eq_card_GL; sum_symmetricKernelLaw; symmetricKernelLaw_self;
symmetricKernelLaw_eq_zero_of_lt; tendsto_symmetricKernelLaw;
FieldStatistics.powerRank_eq_log_quotient; FieldStatistics.powerRank_congr;
FieldStatistics.powerRank_antitone; FieldStatistics.powerRank_one_eq_elementaryTwo;
FieldStatistics.fkPhase_diagonal; FieldStatistics.fkPhase_linked_iff;
FieldStatistics.fkLinked_translate; FieldStatistics.mem_fkGoodPlanes;
FieldStatistics.finite_fkGoodPlanes; FieldStatistics.fkGoodPlanes_ncard;
FieldStatistics.fkGoodPlanes_linear_constraint;
Distributions.woodGridSeparator_zero; Distributions.woodGridSeparator_one_variable.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartIV

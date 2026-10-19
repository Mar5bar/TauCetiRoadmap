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

/-- The trivial ideal class supplies positive torsion cardinality. -/
theorem classGroupTorsionCard_pos (K : Type*) [Field K] [NumberField K] (m : ℕ) :
    1 ≤ classGroupTorsionCard K m := by sorry

/-- Torsion cardinality divides the class number. -/
theorem classGroupTorsionCard_dvd_classNumber (K : Type*) [Field K] [NumberField K]
    (m : ℕ) : classGroupTorsionCard K m ∣ NumberField.classNumber K := by sorry

/-- Coprime torsion orders give independent factors in the class group. -/
theorem classGroupTorsionCard_mul_of_coprime (K : Type*) [Field K] [NumberField K]
    {m n : ℕ} (h : m.Coprime n) :
    classGroupTorsionCard K (m * n) = classGroupTorsionCard K m * classGroupTorsionCard K n :=
  by sorry

/-- The one-torsion consists of the trivial ideal class. -/
theorem classGroupTorsionCard_one (K : Type*) [Field K] [NumberField K] :
    classGroupTorsionCard K 1 = 1 := by sorry

/-- Wide two-torsion has the cardinality of the elementary two-quotient. -/
theorem classGroupTorsionCard_two_eq_elementaryTwoQuotient
    (K : Type*) [Field K] [NumberField K] :
    classGroupTorsionCard K 2 =
      Nat.card (TauCeti.ClassGroup.ElementaryTwoQuotient (𝓞 K)) := by sorry

/-- Rational algebra isomorphisms preserve class-group torsion counts. -/
theorem classGroupTorsionCard_congr (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] (e : K ≃ₐ[ℚ] L) (m : ℕ) :
    classGroupTorsionCard K m = classGroupTorsionCard L m := by sorry

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

/-- Gaussian coefficients have constant zero column. -/
theorem gaussBinom_zero_right {R : Type*} [CommSemiring R] (t : R) (n : ℕ) :
    gaussBinom t n 0 = 1 := by sorry

/-- The top-dimensional Gaussian coefficient is one. -/
theorem gaussBinom_self {R : Type*} [CommSemiring R] (t : R) (n : ℕ) :
    gaussBinom t n n = 1 := by sorry

/-- Gaussian coefficients vanish above the dimension range. -/
theorem gaussBinom_eq_zero_of_lt {R : Type*} [CommSemiring R] (t : R)
    {n k : ℕ} (h : n < k) : gaussBinom t n k = 0 := by sorry

/-- Gaussian coefficients satisfy the successor recursion after evaluation. -/
theorem gaussBinom_succ_succ {R : Type*} [CommSemiring R] (t : R) (n k : ℕ) :
    gaussBinom t (n + 1) (k + 1) = gaussBinom t n k + t ^ (k + 1) *
      gaussBinom t n (k + 1) := by sorry

/-- Gaussian coefficients have the product formula away from its vanishing denominators. -/
theorem gaussBinom_eq_prod {F : Type*} [Field F] (t : F) {n k : ℕ}
    (hk : k ≤ n) (ht : ∀ i : ℕ, 1 ≤ i → i ≤ n → t ^ i ≠ 1) :
    gaussBinom t n k = ∏ i ∈ Finset.range k,
      (1 - t ^ (n - k + i + 1)) / (1 - t ^ (i + 1)) := by sorry

/-- Complementary dimensions have equal Gaussian coefficients within range. -/
theorem gaussBinom_symm {R : Type*} [CommSemiring R] (t : R) {n k : ℕ}
    (hk : k ≤ n) : gaussBinom t n k = gaussBinom t n (n - k) := by sorry

/-- Evaluation at one recovers ordinary binomial coefficients. -/
theorem gaussBinom_one {R : Type*} [CommSemiring R] (n k : ℕ) :
    gaussBinom (1 : R) n k = (n.choose k : R) := by sorry

/-- Gaussian coefficients at the field cardinality count subspaces of each dimension. -/
theorem card_submodules_finrank_eq_gaussBinom (F : Type*) [Field F] [Fintype F]
    (n k : ℕ) :
    Nat.card {W : Submodule F (Fin n → F) // Module.finrank F W = k} =
      gaussBinom (Fintype.card F) n k := by sorry

/-- Cauchy's finite q-binomial identity holds as a polynomial identity over any commutative ring. -/
theorem cauchy_qBinomial {R : Type*} [CommRing R] (t : R) (n : ℕ) :
    (∏ i ∈ Finset.range n, (1 + C (t ^ i) * X) : R[X]) =
      ∑ k ∈ Finset.range (n + 1),
        C (t ^ (k * (k - 1) / 2) * gaussBinom t n k) * X ^ k := by sorry

/-- Euler's positive q-binomial series sums to its convergent infinite product. -/
theorem euler_qBinomial_sum {q : ℝ} (hq0 : 0 < q) (hq1 : q < 1) :
    Multipliable (fun i : ℕ => 1 + q ^ (i + 1)) ∧
      HasSum (fun n : ℕ => q ^ (n * (n + 1) / 2) /
        ∏ i ∈ Finset.range n, (1 - q ^ (i + 1)))
        (∏' i : ℕ, (1 + q ^ (i + 1))) := by sorry

/-- The number of surjective additive homomorphisms, finite for finite source and target. -/
def surjCard (X A : Type*) [AddCommGroup X] [AddCommGroup A] : ℕ :=
  Nat.card {f : X →+ A // Function.Surjective f}

/-- Additive isomorphisms of both groups preserve the surjection count. -/
theorem surjCard_congr {X X' A A' : Type*} [AddCommGroup X] [AddCommGroup X']
    [AddCommGroup A] [AddCommGroup A'] (e : X ≃+ X') (f : A ≃+ A') :
    surjCard X A = surjCard X' A' := by sorry

/-- Surjective endomorphisms of a finite group are exactly its automorphisms. -/
theorem surjCard_self_eq_card_aut (A : Type*) [AddCommGroup A] [Finite A] :
    surjCard A A = Nat.card (A ≃+ A) := by sorry

/-- The finite surjection count is bounded by the homomorphism count. -/
theorem surjCard_le_card_hom (X A : Type*) [AddCommGroup X] [Finite X]
    [AddCommGroup A] [Finite A] : surjCard X A ≤ Nat.card (X →+ A) := by sorry

/-- There is exactly one surjection to the trivial additive group. -/
theorem surjCard_punit (X : Type*) [AddCommGroup X] : surjCard X PUnit = 1 := by sorry

/-- A smaller finite group cannot surject onto a larger one. -/
theorem surjCard_eq_zero_of_card_lt (X A : Type*) [AddCommGroup X] [Finite X]
    [AddCommGroup A] [Finite A] (h : Nat.card X < Nat.card A) :
    surjCard X A = 0 := by sorry

/-- Partition counts grow more slowly than the exponential tail in the odd-prime argument. -/
theorem partition_tail_domination {ℓ : ℕ} (hℓ : 3 ≤ ℓ) (m : ℕ) :
    Tendsto (fun s : ℕ => (Nat.card (Nat.Partition (s + m)) : ℝ) /
      (ℓ - 1 : ℝ) ^ s) atTop (𝓝 0) := by sorry

/-- The rational probability of a specified right-kernel dimension for a uniform matrix. -/
def matrixKernelLaw (F : Type*) [Field F] [Fintype F] (m n j : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin m) (Fin n) F //
    Module.finrank F (LinearMap.ker M.mulVecLin) = j} : ℚ) /
    (Fintype.card F : ℚ) ^ (m * n)

/-- The finite-field right-kernel law has total mass one. -/
theorem sum_matrixKernelLaw (F : Type*) [Field F] [Fintype F] (m n : ℕ) :
    ∑ j ∈ Finset.range (n + 1), matrixKernelLaw F m n j = 1 := by sorry

/-- Rank-nullity bounds the support of the right-kernel law. -/
theorem matrixKernelLaw_eq_zero_of_lt (F : Type*) [Field F] [Fintype F]
    (m n j : ℕ) (h : j < n - m ∨ n < j) : matrixKernelLaw F m n j = 0 := by sorry

/-- The zero-kernel mass of square matrices is the general linear group proportion. -/
theorem matrixKernelLaw_zero_eq_card_GL (F : Type*) [Field F] [Fintype F] (n : ℕ) :
    matrixKernelLaw F n n 0 = (Nat.card (Matrix.GeneralLinearGroup (Fin n) F) : ℚ) /
      (Fintype.card F : ℚ) ^ (n * n) := by sorry

/-- Rank counts factor into a choice of column space and an onto map to that space. -/
theorem matrix_rank_count (F : Type*) [Field F] [Fintype F] (m n r : ℕ)
    (hr : r ≤ min m n) :
    (Nat.card {M : Matrix (Fin m) (Fin n) F // M.rank = r} : ℚ) =
      gaussBinom (Fintype.card F : ℚ) m r *
        ∏ i ∈ Finset.range r, ((Fintype.card F : ℚ) ^ n - (Fintype.card F : ℚ) ^ i) :=
  by sorry

/-- The finite binary kernel law satisfies the normalized Koymans–Pagano identity. -/
theorem koymansPaganoRankIdentity (m : ℕ) :
    (∑ j ∈ Finset.range (m + 1), matrixKernelLaw (ZMod 2) m m j /
      ((2 : ℚ) ^ m * (2 ^ (j + 1) - 1))) = 1 / ((2 : ℚ) ^ (m + 1) - 1) := by sorry

/-- The rational kernel law for uniform symmetric matrices, including their diagonal entries. -/
def symmetricKernelLaw (F : Type*) [Field F] [Fintype F] (r n : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin r) (Fin r) F // M.IsSymm ∧
    Module.finrank F (LinearMap.ker M.mulVecLin) = n} : ℚ) /
    (Fintype.card F : ℚ) ^ (r * (r + 1) / 2)

/-- The symmetric kernel law has total mass one, including in characteristic two. -/
theorem sum_symmetricKernelLaw (F : Type*) [Field F] [Fintype F] (r : ℕ) :
    ∑ n ∈ Finset.range (r + 1), symmetricKernelLaw F r n = 1 := by sorry

/-- The zero matrix is the unique symmetric matrix with full-dimensional kernel. -/
theorem symmetricKernelLaw_self (F : Type*) [Field F] [Fintype F] (r : ℕ) :
    symmetricKernelLaw F r r = 1 / (Fintype.card F : ℚ) ^ (r * (r + 1) / 2) := by sorry

/-- A symmetric matrix has no kernel dimension exceeding its size. -/
theorem symmetricKernelLaw_eq_zero_of_lt (F : Type*) [Field F] [Fintype F]
    {r n : ℕ} (h : r < n) : symmetricKernelLaw F r n = 0 := by sorry

/-- A column is in the image of a symmetric matrix precisely when it annihilates its kernel. -/
theorem symmetric_image_obstruction (F : Type*) [Field F] (n : ℕ)
    (S : Matrix (Fin n) (Fin n) F) (hS : S.IsSymm) (v : Fin n → F) :
    v ∈ LinearMap.range S.mulVecLin ↔
      ∀ z ∈ LinearMap.ker S.mulVecLin, dotProduct v z = 0 := by sorry

/-- An image column gives a symmetric border whose rank depends on one scalar corner. -/
theorem symmetric_border_rank_in_image (F : Type*) [Field F] (n : ℕ)
    (S : Matrix (Fin n) (Fin n) F) (hS : S.IsSymm) (x : Fin n → F) (a : F) :
    let B := Matrix.fromBlocks S (fun i (_ : Fin 1) => S.mulVec x i)
      (fun (_ : Fin 1) j => S.mulVec x j) (fun _ _ => a)
    (a = dotProduct x (S.mulVec x) → B.rank = S.rank) ∧
      (a ≠ dotProduct x (S.mulVec x) → B.rank = S.rank + 1) := by sorry

/-- A column outside the image increases symmetric border rank by two for every corner. -/
theorem symmetric_border_rank_outside_image (F : Type*) [Field F] (n : ℕ)
    (S : Matrix (Fin n) (Fin n) F) (hS : S.IsSymm) (v : Fin n → F)
    (hv : v ∉ LinearMap.range S.mulVecLin) (a : F) :
    (Matrix.fromBlocks S (fun i (_ : Fin 1) => v i)
      (fun (_ : Fin 1) j => v j) (fun _ _ => a)).rank = S.rank + 2 := by sorry

/-- Symmetric border rank fibers have three possible sizes, over every finite field. -/
theorem symmetric_border_rank_fibers (F : Type*) [Field F] [Fintype F] (n k : ℕ)
    (S : Matrix (Fin n) (Fin n) F) (hS : S.IsSymm) :
    Nat.card {va : (Fin n → F) × F //
      (Matrix.fromBlocks S (fun i (_ : Fin 1) => va.1 i)
        (fun (_ : Fin 1) j => va.1 j) (fun _ _ => va.2)).rank = k} =
      if k = S.rank then Fintype.card F ^ S.rank
      else if k = S.rank + 1 then (Fintype.card F - 1) * Fintype.card F ^ S.rank
      else if k = S.rank + 2 then Fintype.card F ^ (n + 1) - Fintype.card F ^ (S.rank + 1)
      else 0 := by sorry

/-- Symmetric matrix counts satisfy the border recurrence without negative rank indices. -/
theorem symmetric_rank_count_recurrence (F : Type*) [Field F] [Fintype F] (n k : ℕ) :
    Nat.card {M : Matrix (Fin (n + 1)) (Fin (n + 1)) F // M.IsSymm ∧ M.rank = k} =
      ∑ r ∈ Finset.range (n + 1),
        Nat.card {M : Matrix (Fin n) (Fin n) F // M.IsSymm ∧ M.rank = r} *
          (if k = r then Fintype.card F ^ r
           else if k = r + 1 then (Fintype.card F - 1) * Fintype.card F ^ r
           else if k = r + 2 then Fintype.card F ^ (n + 1) - Fintype.card F ^ (r + 1)
           else 0) := by sorry

/-- The rational symmetric-rank product satisfies the border recurrence for all integer bases. -/
theorem symmetric_rank_product_recurrence {q : ℕ} (hq : 2 ≤ q) (n k : ℕ) :
    let P : ℕ → ℕ → ℚ := fun s t =>
      (∏ i ∈ Finset.range (t / 2), (q : ℚ) ^ (2 * (i + 1)) /
        ((q : ℚ) ^ (2 * (i + 1)) - 1)) *
      ∏ i ∈ Finset.range t, ((q : ℚ) ^ (s - i) - 1)
    P (n + 1) k = ∑ r ∈ Finset.range (n + 1), P n r *
      ((if k = r then q ^ r
        else if k = r + 1 then (q - 1) * q ^ r
        else if k = r + 2 then q ^ (n + 1) - q ^ (r + 1)
        else 0 : ℕ) : ℚ) := by sorry

/-- MacWilliams's product counts symmetric matrices of each rank in every characteristic. -/
theorem macwilliams_symmetric_rank_count (F : Type*) [Field F] [Fintype F]
    (s k : ℕ) (hk : k ≤ s) :
    (Nat.card {M : Matrix (Fin s) (Fin s) F // M.IsSymm ∧ M.rank = k} : ℚ) =
      (∏ i ∈ Finset.range (k / 2),
        (Fintype.card F : ℚ) ^ (2 * (i + 1)) /
          ((Fintype.card F : ℚ) ^ (2 * (i + 1)) - 1)) *
      ∏ i ∈ Finset.range k, ((Fintype.card F : ℚ) ^ (s - i) - 1) := by sorry

/-- Binary symmetric kernel masses converge to the odd Euler-product law. -/
theorem tendsto_symmetricKernelLaw (n : ℕ) :
    Tendsto (fun r : ℕ => (symmetricKernelLaw (ZMod 2) r n : ℝ)) atTop
      (𝓝 ((∏' j : ℕ, (1 - (2 : ℝ)⁻¹ ^ (2 * j + 1))) /
        ∏ i ∈ Finset.range n, ((2 : ℝ) ^ (i + 1) - 1))) := by sorry

/-- The binary symmetric kernel limit has an explicit error bound for every positive size. -/
theorem symmetricKernelLaw_error (n r : ℕ) (hr : 1 ≤ r) :
    |(symmetricKernelLaw (ZMod 2) r n : ℝ) -
      (∏' j : ℕ, (1 - (2 : ℝ)⁻¹ ^ (2 * j + 1))) /
        ∏ i ∈ Finset.range n, ((2 : ℝ) ^ (i + 1) - 1)| ≤
          (2 : ℝ) ^ ((n : ℤ) + 1 - (r : ℤ)) := by sorry

/-- The limiting binary symmetric kernel masses sum to one. -/
theorem hasSum_symmetricKernelLimit :
    HasSum (fun n : ℕ => (∏' j : ℕ, (1 - (2 : ℝ)⁻¹ ^ (2 * j + 1))) /
      ∏ i ∈ Finset.range n, ((2 : ℝ) ^ (i + 1) - 1)) 1 := by sorry

namespace FieldStatistics

/-- The p-torsion in the (k−1)st power image, rather than all p-torsion. -/
def powerRank (A : Type*) [CommGroup A] [Finite A] (p k : ℕ) : ℕ :=
  Nat.log p (Nat.card {a : A // (∃ b : A, b ^ (p ^ (k - 1)) = a) ∧ a ^ p = 1})

/-- Power-image torsion and the adjacent power quotient give the same rank. -/
theorem powerRank_eq_log_quotient (A : Type*) [CommGroup A] [Finite A]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank A p k = Nat.log p
      (Nat.card ((powMonoidHom (α := A) (p ^ (k - 1))).range ⧸
        (powMonoidHom (α := (powMonoidHom (α := A) (p ^ (k - 1))).range) p).range)) :=
  by sorry

/-- Group isomorphisms preserve power-image ranks. -/
theorem powerRank_congr (A B : Type*) [CommGroup A] [Finite A] [CommGroup B] [Finite B]
    (e : A ≃* B) (p k : ℕ) : powerRank A p k = powerRank B p k := by sorry

/-- Successive power images have nonincreasing prime-power ranks. -/
theorem powerRank_antitone (A : Type*) [CommGroup A] [Finite A]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank A p (k + 1) ≤ powerRank A p k := by sorry

/-- The first binary power rank measures the elementary two-quotient. -/
theorem powerRank_one_eq_elementaryTwo (A : Type*) [CommGroup A] [Finite A] :
    2 ^ powerRank A 2 1 = Nat.card (A ⧸ (powMonoidHom (α := A) 2).range) := by sorry

/-- Adjacent power-image ranks add under direct products. -/
theorem powerRank_prod (A B : Type*) [CommGroup A] [Finite A] [CommGroup B] [Finite B]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank (A × B) p k = powerRank A p k + powerRank B p k := by sorry

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

/-- The ordered FK phase vanishes on the diagonal. -/
theorem fkPhase_diagonal {k : ℕ} (u : FKSpace k) : fkPhase u u = 0 := by sorry

/-- Symmetrizing the ordered phase gives the quadratic expression at the sum of its arguments. -/
theorem fkPhase_linked_iff {k : ℕ} (u v : FKSpace k) :
    fkPhase u v + fkPhase v u = fkQuadratic (u + v) := by sorry

/-- Translating both indices preserves FK linkage. -/
theorem fkLinked_translate {k : ℕ} (u v c : FKSpace k) :
    fkLinked (u + c) (v + c) ↔ fkLinked u v := by sorry

/-- Good planes have the specified dimension and annihilate the full directed pairing. -/
theorem mem_fkGoodPlanes {k : ℕ} (U : Submodule (ZMod 2) (FKSpace k)) :
    U ∈ fkGoodPlanes k ↔ Module.finrank (ZMod 2) U = k ∧
      ∀ u ∈ U, ∀ v ∈ U, (∑ j, (u j).1 * ((v j).1 + (v j).2)) = 0 := by sorry

/-- The set of good planes is finite. -/
theorem finite_fkGoodPlanes (k : ℕ) : (fkGoodPlanes k).Finite := by sorry

/-- The FK good k-planes are counted by all subspaces of F₂^k. -/
theorem fk_good_subspace_bijection (k : ℕ) :
    Nonempty ({U // U ∈ fkGoodPlanes k} ≃ Submodule (ZMod 2) (Fin k → ZMod 2)) := by sorry

/-- Gaussian coefficients sum to the number of FK good planes. -/
theorem fkGoodPlanes_ncard (k : ℕ) :
    (fkGoodPlanes k).ncard = ∑ d ∈ Finset.range (k + 1), gaussBinom (2 : ℕ) k d := by sorry

/-- Each nonempty FK coordinate constraint reduces the good-plane count by one dimension. -/
theorem fkGoodPlanes_linear_constraint {k : ℕ} (hk : 1 ≤ k)
    (Γ : Finset (Fin k)) (hΓ : Γ.Nonempty) :
    ({U : Submodule (ZMod 2) (FKSpace k) | U ∈ fkGoodPlanes k ∧
      ∀ u ∈ U, (∑ j ∈ Γ, ((u j).1 + (u j).2)) = 0} : Set _).ncard =
        ∑ d ∈ Finset.range k, gaussBinom (2 : ℕ) (k - 1) d ∧
    ({U : Submodule (ZMod 2) (FKSpace k) | U ∈ fkGoodPlanes k ∧
      ∀ u ∈ U, (∑ j ∈ Γ, (u j).1) = 0} : Set _).ncard =
        ∑ d ∈ Finset.range k, gaussBinom (2 : ℕ) (k - 1) d := by sorry

end FieldStatistics

/-- Prime torsion in a class group is a prime power measured by its first power-image rank. -/
theorem classGroupTorsionCard_prime_eq_pow_rank (K : Type*) [Field K] [NumberField K]
    {p : ℕ} (hp : p.Prime) :
    classGroupTorsionCard K p =
      Nat.card (ClassGroup (𝓞 K) ⧸ (powMonoidHom (α := ClassGroup (𝓞 K)) p).range) ∧
    classGroupTorsionCard K p = p ^ FieldStatistics.powerRank (ClassGroup (𝓞 K)) p 1 :=
  by sorry

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

/-- The separator has value one at the zero vector. -/
theorem woodGridSeparator_zero (m p : ℕ) (b : Fin (m + 1) → ℕ) :
    woodGridSeparator m p b 0 = 1 := by sorry

/-- A length-one grid has only the infinite-product head. -/
theorem woodGridSeparator_one_variable (p : ℕ) (b : Fin 1 → ℕ) (z : Fin 1 → ℂ) :
    woodGridSeparator 0 p b z = ∏' j : ℕ, (1 - z 0 / (p : ℂ) ^ (b 0 + 1 + j)) :=
  by sorry

/-- The Wood separator is entire on its finite-dimensional complex coordinate space. -/
theorem woodGridSeparator_entire {m p : ℕ} (hp : p.Prime)
    (b : Fin (m + 1) → ℕ) (hb : Antitone b) :
    AnalyticOnNhd ℂ (woodGridSeparator m p b) Set.univ := by sorry

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

/-- The separator has an absolutely convergent monomial expansion with a quadratic head bound
and finite degree in the remaining coordinates. -/
theorem woodGridSeparator_coefficient_bound {m p : ℕ} (hp : p.Prime)
    (b : Fin (m + 1) → ℕ) (hb : Antitone b) :
    ∃ (E : ℝ) (a : (Fin (m + 1) → ℕ) → ℂ), 0 < E ∧
      (∀ z : Fin (m + 1) → ℂ,
        Summable (fun d => ‖a d * ∏ i, z i ^ d i‖) ∧
        HasSum (fun d => a d * ∏ i, z i ^ d i) (woodGridSeparator m p b z)) ∧
      (∀ d, ‖a d‖ ≤ E / (p : ℝ) ^ (b 0 * d 0 + d 0 * (d 0 + 1) / 2)) ∧
      (∀ d, b 0 - b (Fin.last m) < ∑ i : Fin m, d i.succ → a d = 0) := by sorry

/-- The one-variable separator has the explicit signed coefficient formula. -/
theorem woodGridSeparator_head_expansion {p : ℕ} (hp : p.Prime) (b : ℕ) (z : ℂ) :
    HasSum (fun n : ℕ => ((-1 : ℂ) ^ n /
      ((p : ℂ) ^ (b * n) * ∏ j ∈ Finset.range n, ((p : ℂ) ^ (j + 1) - 1))) * z ^ n)
      (woodGridSeparator 0 p (fun _ => b) (fun _ => z)) := by sorry

/-- Finite exponential moments with Wood's quadratic growth bound determine every profile mass
for any finite set of distinct primes. -/
theorem wood_grid_uniqueness {s : ℕ} (p m : Fin s → ℕ)
    (hp : ∀ j, (p j).Prime) (hp_distinct : Function.Injective p) (hm : ∀ j, 1 ≤ m j) :
    let M := (j : Fin s) → {v : Fin (m j) → ℕ // Antitone v}
    ∀ (x y C : M → ℝ) (F : ℝ), 0 < F →
      (∀ μ, 0 ≤ x μ) → (∀ μ, 0 ≤ y μ) →
      (∀ lam, HasSum (fun μ : M => x μ *
        ∏ j, (p j : ℝ) ^ (∑ i, (lam j).val i * (μ j).val i)) (C lam)) →
      (∀ lam, HasSum (fun μ : M => y μ *
        ∏ j, (p j : ℝ) ^ (∑ i, (lam j).val i * (μ j).val i)) (C lam)) →
      (∀ lam, C lam ≤ ∏ j, F ^ m j *
        (p j : ℝ) ^ (∑ i, (lam j).val i * ((lam j).val i - 1) / 2)) →
      ∀ μ, x μ = y μ := by sorry

end Distributions

/-! The README additionally specifies the number-field counting function and its
reciprocal-automorphism weight; the
partition-indexed FinAbPGroupClass representatives, conjugate partitions,
multiplicities and automorphism counts; the Cohen–Lenstra constants,
weights and measures; surjectionMoment; IsEnlargement and enlargements; normalized
p-adic matrix Haar measure, padicCokernel and cokernelLaw; the finite product
Cohen–Lenstra measure. Their full APIs,
checks and end theorems remain in the README.

The representative-group specialization surjCard_toGroup_self additionally uses
FinAbPGroupClass.toGroup and FinAbPGroupClass.autCard from the README.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartIV

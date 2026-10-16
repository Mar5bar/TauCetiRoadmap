import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.Polynomial.Vieta
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases
import Mathlib.Data.Matrix.Mul
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Algebra.Field.ZMod
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.NormNum

/-!
# Automorphic Galois representations, part II: representative target signatures

The README is the definitive roadmap. These are suggested forms, not an exhaustive checklist.
The file records light definitions and milestones statable against the pinned Mathlib APIs.
Automorphic representations, geometric realizations, period comparisons and compatible systems
are specified in the README. Geometric Frobenius and HT(ε) = −1 fix the numerical conventions.
-/

namespace TauCeti.AutomorphicGalois

open Polynomial
open scoped BigOperators Classical

#check NumberField.IsCMField.complexEmbedding_complexConj
#check Multiset.prod_X_sub_C_coeff
#check Matrix.charpoly_map
#check Matrix.charpoly_units_conj

/-! ## Layer AG2.0: dominant coordinates and labelled Hodge weights -/

/-- Embedding-indexed dominant GLₙ coordinates. -/
def DominantWeight (n : ℕ) (ι : Type*) : Type _ := ι → {a : Fin n → ℤ // Antitone a}

namespace DominantWeight

variable {n : ℕ} {ι : Type*}

/-- Conjugate coordinates sum to w. -/
def IsInW (c : ι → ι) (w : ℤ) (a : DominantWeight n ι) : Prop :=
  ∀ τ (i : Fin n), (a τ).1 i + (a (c τ)).1 i.rev = w

/-- Pull coordinates back along restriction of embeddings. -/
def baseChange {ι' : Type*} (f : ι' → ι) (a : DominantWeight n ι) : DominantWeight n ι' :=
  fun τ => a (f τ)

/-- Form the weight from antitone coordinates. -/
def mk (a : ι → Fin n → ℤ) (ha : ∀ τ, Antitone (a τ)) : DominantWeight n ι :=
  fun τ => ⟨a τ, ha τ⟩

/-- At some embedding, equal-sized subsets of shifted coordinates have distinct sums. -/
def IsExtremelyRegular (a : DominantWeight n ι) : Prop :=
  ∃ τ, ∀ H H' : Finset (Fin n), H.card = H'.card →
    (∑ i ∈ H, ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) = (∑ i ∈ H', ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) → H = H'

/-- The isInW baseChange comparison for the stated algebraic data. -/
theorem isInW_baseChange {ι' : Type*} (c : ι → ι) (c' : ι' → ι') (f : ι' → ι)
    (hf : ∀ τ, f (c' τ) = c (f τ)) {w : ℤ} {a : DominantWeight n ι} (h : a.IsInW c w) :
    (a.baseChange f).IsInW c' w := sorry

/-- The ext comparison for the stated algebraic data. -/
@[ext] theorem ext {a b : DominantWeight n ι}
    (h : ∀ τ i, (a τ).1 i = (b τ).1 i) : a = b := sorry

/-- The baseChange id comparison for the stated algebraic data. -/
@[simp] theorem baseChange_id (a : DominantWeight n ι) : a.baseChange id = a := sorry

/-- The baseChange comp comparison for the stated algebraic data. -/
theorem baseChange_comp {ι' ι'' : Type*} (f : ι' → ι) (g : ι'' → ι')
    (a : DominantWeight n ι) : (a.baseChange f).baseChange g = a.baseChange (f ∘ g) := sorry

/-- Powers of two have distinct subset sums. -/
example : IsExtremelyRegular
    (fun _ : Unit => ⟨![5, 2, 1, 1], by
      intro i j hij; fin_cases i <;> fin_cases j <;> simp_all⟩ : DominantWeight 4 Unit) := sorry

/-- Shifted entries 3,2,1,0 fail extreme regularity since 3+0=2+1. -/
example : ¬ IsExtremelyRegular
    (fun _ : Unit => ⟨(0 : Fin 4 → ℤ), by intro i j _; rfl⟩ : DominantWeight 4 Unit) := sorry

end DominantWeight

/-- The dominant rank-two vector (x,y), with y≤x. -/
def mk2 (x y : ℤ) (h : y ≤ x) : {a : Fin 2 → ℤ // Antitone a} :=
  ⟨![x, y], by intro i j hij; fin_cases i <;> fin_cases j <;> simp_all⟩

/-- Test `DominantWeight.isInW_classical`: the weight `(k − 2, 0)` of a classical weight-`k` form lies in `(ℤ²)_{k−2}`
(one embedding, conjugation trivial). -/
example (k : ℤ) (hk : 2 ≤ k) :
    DominantWeight.IsInW id (k - 2) (fun _ : Unit => mk2 (k - 2) 0 (by omega) : DominantWeight 2 Unit) := by
  intro τ i
  fin_cases i <;> simp [mk2, Fin.rev]

/-- Test `DominantWeight.not_isInW_unpaired`: `a_τ = (1, 0)`, `a_{cτ} = (0, 0)` lies in no `(ℤ²)_w`. -/
example : ¬ ∃ w, DominantWeight.IsInW (fun b => !b) w
    (fun b : Bool => if b then mk2 1 0 (by norm_num) else mk2 0 0 le_rfl : DominantWeight 2 Bool) := by
  rintro ⟨w, h⟩
  have h1 := h true 0
  have h2 := h true 1
  simp [mk2, Fin.rev] at h1 h2
  omega

/-- Test `DominantWeight.not_dominant`: `(0, 1)` is not dominant. -/
example : ¬ Antitone (![0, 1] : Fin 2 → ℤ) := by
  intro h
  have := h (show (0 : Fin 2) ≤ 1 by decide)
  simp at this

/-- Check `DominantWeight.isInW_rank_one`. -/
example {ι : Type*} (c : ι → ι) (w : ℤ) (a : DominantWeight 1 ι) :
    a.IsInW c w ↔ ∀ τ, (a τ).1 0 + (a (c τ)).1 0 = w :=
  sorry

/-- `…:AG2.0/sign-of-the-polarization-multiplier`: with `χ_v(−1) = (−1)^{n+w}` the multiplier
`µ(c_v) = (−1)^{n−1} (−1)^w χ_v(−1)` is `−1`. -/
example (n w : ℕ) (hn : 1 ≤ n) : ((-1 : ℤ)) ^ (n - 1) * (-1) ^ w * (-1) ^ (n + w) = -1 := by
  rw [← pow_add, ← pow_add]
  have : n - 1 + w + (n + w) = 2 * (n + w - 1) + 1 := by omega
  rw [this, pow_succ, pow_mul]
  norm_num

/-- Test `not_totallyOdd_blggt_sign_odd_w` (its arithmetic): with BLGGT's printed `χ_v(−1) = (−1)^n` and `w` odd, the
multiplier is even, `µ(c_v) = +1` (BLGGT §2.1). -/
example (n w : ℕ) (hn : 1 ≤ n) (hw : Odd w) : ((-1 : ℤ)) ^ (n - 1) * (-1) ^ w * (-1) ^ n = 1 := by
  obtain ⟨k, rfl⟩ := hw
  rw [← pow_add, ← pow_add]
  have : n - 1 + (2 * k + 1) + n = 2 * (n + k) := by omega
  rw [this, pow_mul]
  norm_num

/-- The multiset a(i)+n−1−i, with HT(ε)=−1. -/
def expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) : Multiset ℤ :=
  Multiset.map (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val

/-- The expectedHodgeTate strictAnti comparison for the stated algebraic data. -/
theorem expectedHodgeTate_strictAnti {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    StrictAnti fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ) := sorry

/-- The expectedHodgeTate card comparison for the stated algebraic data. -/
@[simp] theorem expectedHodgeTate_card {n : ℕ} (a : Fin n → ℤ) :
    (expectedHodgeTate a).card = n := sorry

/-- The expectedHodgeTate nodup comparison for the stated algebraic data. -/
theorem expectedHodgeTate_nodup {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    (expectedHodgeTate a).Nodup := sorry

/-- The expectedHodgeTate conj comparison for the stated algebraic data. -/
theorem expectedHodgeTate_conj {n : ℕ} {ι : Type*} (c : ι → ι) {w : ℤ} {a : DominantWeight n ι}
    (h : a.IsInW c w) (τ : ι) (i : Fin n) :
    (a (c τ)).1 i + ((n - 1 - i : ℕ) : ℤ) =
      (w + ((n - 1 : ℕ) : ℤ)) - ((a τ).1 i.rev + ((n - 1 - i.rev : ℕ) : ℤ)) := sorry

/-- The expectedHodgeTate twist comparison for the stated algebraic data. -/
theorem expectedHodgeTate_twist {n : ℕ} (a : Fin n → ℤ) (t : ℤ) :
    expectedHodgeTate (fun i => a i - t) = (expectedHodgeTate a).map (· - t) := sorry

/-- Test `expectedHodgeTate_classical`: `n = 2`, `a = (k − 2, 0)` with `k = 12` gives `{11, 0}`. -/
example : expectedHodgeTate ![(10 : ℤ), 0] = {11, 0} := by decide

/-- Check `expectedHodgeTate_zero`. -/
example (n : ℕ) : expectedHodgeTate (0 : Fin n → ℤ) =
    Multiset.map (fun i : Fin n => ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val :=
  sorry

/-- Acceptance, `n = 3` (evaluated): `x³ − t₁x² + q t₂ x − q³ t₃ = ∏ (x − qα_j)` for `t₁ = q e₁`, `t₂ = q e₂`, `t₃ = e₃`. -/
example {R : Type*} [CommRing R] (q a b c x : R) :
    x ^ 3 - (q * (a + b + c)) * x ^ 2 + q * (q * (a * b + b * c + c * a)) * x - q ^ 3 * (a * b * c) =
      (x - q * a) * (x - q * b) * (x - q * c) := by ring

/-- Test `heckePolynomial_arith_vs_geom` (its arithmetic): if `β₁ + β₂ = −24` and `β₁β₂ = 2¹¹` (Δ at `2`), the
reciprocal roots have sum `−24/2¹¹` and product `2⁻¹¹`, so `ρ_Δ`'s geometric polynomial is `X² + 24·2⁻¹¹X + 2⁻¹¹`. -/
example (b1 b2 : ℚ) (hs : b1 + b2 = -24) (hp : b1 * b2 = 2 ^ 11) :
    1 / b1 + 1 / b2 = -24 / 2 ^ 11 ∧ 1 / b1 * (1 / b2) = 1 / 2 ^ 11 := by
  have h1 : b1 ≠ 0 := by rintro rfl; norm_num at hp
  have h2 : b2 ≠ 0 := by rintro rfl; norm_num at hp
  constructor
  · rw [div_add_div _ _ h1 h2, ← hp]; field_simp; linarith
  · rw [div_mul_div_comm, ← hp]; ring

example {R : Type*} [CommRing R] (q : R) (t : ℕ → R) (h0 : t 0 = 1) :
    (∑ i ∈ Finset.range (1 + 1), C ((-1) ^ i * q ^ (i * (i - 1) / 2) * t i) * X ^ (1 - i)) = X - C (t 1) :=
  sorry

example (b1 b2 u x : ℚ) (hu : u ≠ 0) :
    (x - b1 / u) * (x - b2 / u) = (u * x - b1) * (u * x - b2) / u ^ 2 := by
  field_simp

/-- Test `expectedHodgeTate_regular`: the shifted weight function is injective. -/
example {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    Function.Injective (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) :=
  (expectedHodgeTate_strictAnti ha).injective

/-- Test `not_expectedHodgeTate_unshifted`: rank two weight zero has distinct shifted entries. -/
example : expectedHodgeTate (0 : Fin 2 → ℤ) ≠ ({0, 0} : Multiset ℤ) := by decide

/-! ## Layer AG2.1a: coefficient exponents and degree selectors -/

namespace Fixtures

/-- Coefficient weight with its central exponent. -/
def coefficientWeight (central highestWeightSum : ℤ) : ℤ :=
  -2 * central - highestWeightSum

/-- The labelled integer k−1−highestWeight−central. -/
def labelledInteger (central highestWeight : ℤ) (k : ℕ) : ℤ :=
  (k : ℤ) - 1 - highestWeight - central

/-- The relative-degree factor; geometric use assumes N≥2 and y≠1. -/
def selectorFactor (N : ℚ) (y : ℕ) (eigenvalue : ℚ) : ℚ :=
  (eigenvalue - N ^ y) / (N - N ^ y)

/-- Nontrivial similitude character ν shifts weight and labelled integers. -/
example : coefficientWeight 1 0 = -2 ∧ labelledInteger 1 0 1 = -1 := by decide

/-- A trivial central character does not supply a nonzero shift. -/
example : coefficientWeight 0 0 = 0 ∧ labelledInteger 0 0 1 = 0 := by decide

example (t a : ℤ) (k : ℕ) :
    labelledInteger (a + t) 0 k = labelledInteger a 0 k - t := by
  simp [labelledInteger]
  ring

/-- Test `CoefficientProjector.denominator`, the two denominators. -/
example : (2 : ℚ) - 2 ^ 0 = 1 ∧ (2 : ℚ) - 2 ^ 2 = -2 := by norm_num

/-- Test `CoefficientProjector.degreeSelector`, scalar relative-degree fragment. -/
example : selectorFactor 2 0 1 = 0 ∧ selectorFactor 2 0 2 = 1 ∧
    selectorFactor 2 2 2 = 1 := by norm_num [selectorFactor]

end Fixtures

/-! ## Layer AG2.2: discrete transfer ranks -/

namespace Fixtures

/-- Rank sum over multiplicities and constituent dimensions. -/
def discreteRank (blocks : List (ℕ × ℕ)) : ℕ :=
  (blocks.map fun b => b.1 * b.2).sum

example : discreteRank [(1, 2)] = 2 ∧ discreteRank [(2, 1)] = 2 := by decide

/-- The normalized parameter exponent minus the constituent exponent is −n−j. -/
example (n ni j : ℚ) :
    (ni - 1) / 2 - j + (1 - 2 * n) / 2 - ni / 2 = -n - j := by ring

/-- Test `DiscreteAssembly.singleBlock`, the two different scalar exponents. -/
example : (-1 - (0 : ℤ), -1 - (1 : ℤ)) = (-1, -2) := by decide

end Fixtures

/-! ## Layer AG2.4: Hasse weights and Kuga slopes -/

namespace Fixtures

/-- The Hasse increment (p−1)p^(M−1)j, for M≥1. -/
def hasseShift (p M j : ℕ) : ℕ := (p - 1) * p ^ (M - 1) * j

/-- Add mn[F:ℚ] to the section slope. -/
def kugaSlope (sectionSlope : ℚ) (m n fieldDegree : ℕ) : ℚ :=
  sectionSlope + (m * n * fieldDegree : ℕ)

example : hasseShift 3 1 2 = 4 ∧ hasseShift 3 2 2 = 12 := by decide

/-- A degree-two CM field and one Kuga copy distinguish the two slope directions. -/
example : kugaSlope 3 1 1 2 = 5 ∧
    (5 : ℚ) - (1 * 1 * 2 : ℕ) = 3 ∧ kugaSlope 3 1 1 2 ≠ 1 := by
  norm_num [kugaSlope]

/-- The shift disappears for zero Kuga copies. -/
example (a : ℚ) (n d : ℕ) : kugaSlope a 0 n d = a := by
  simp [kugaSlope]

end Fixtures

/-! ## Layer AG2.5: monodromy partitions and Weil relations -/

namespace Fixtures

/-- Rank of a monodromy power with the given block lengths. -/
def blockPowerRank (blocks : List ℕ) (k : ℕ) : ℕ :=
  (blocks.map fun d => d - k).sum

/-- Diagonal Frobenius for q=4 with weights 3,1,1,−1,−1,−3. -/
def frobeniusFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if i.val = j.val then
    if i.val = 0 then 8 else if i.val = 1 ∨ i.val = 2 then 2
    else if i.val = 3 ∨ i.val = 4 then 1 / 2 else 1 / 8
    else 0

/-- Nilpotent strings of lengths 4 and 2. -/
def pureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (5, 3), (4, 2)] : List (ℕ × ℕ))
    then 1 else 0

/-- Nilpotent strings of lengths 3 and 3. -/
def impureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (4, 2), (5, 4)] : List (ℕ × ℕ))
    then 1 else 0

example : blockPowerRank [4, 2] 1 = 4 ∧ blockPowerRank [3, 3] 1 = 4 := by decide

example : blockPowerRank [4, 2] 3 = 1 ∧ blockPowerRank [3, 3] 3 = 0 := by decide

/-- Both operators satisfy the geometric Weil relation F N = q⁻¹ N F for q=4. -/
example : frobeniusFixture * pureChainFixture =
    (1 / 4 : ℚ) • (pureChainFixture * frobeniusFixture) := sorry

example : frobeniusFixture * impureChainFixture =
    (1 / 4 : ℚ) • (impureChainFixture * frobeniusFixture) := sorry

example : (pureChainFixture ^ 3) 5 0 = 1 := sorry

example : impureChainFixture ^ 3 = 0 := sorry

end Fixtures

/-! ## Layer AG2.6: Hodge and ordinary exponent comparisons -/

theorem sum_expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) :
    ∑ i : Fin n, (a i + ((n - 1 - i : ℕ) : ℤ)) =
    ∑ i : Fin n, a i + ((n * (n - 1) / 2 : ℕ) : ℤ) := sorry

/-- The geometricCoefficientPrimeComparison comparison for the stated algebraic data. -/
theorem geometricCoefficientPrimeComparison {K V W : Type*} [Field K]
    [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
    (u : V ≃ₗ[K] W) (e : Module.End K V) (f : Module.End K W)
    (he : e.comp e = e) (hf : f.comp f = f)
    (hu : u.toLinearMap.comp e = f.comp u.toLinearMap) :
    Nonempty (LinearMap.range e ≃ₗ[K] LinearMap.range f) := sorry

/-- A determinant Hodge sum cannot recover the rank-two multiset. -/
example : ({(0 : ℤ), 3} : Multiset ℤ).sum = ({(1 : ℤ), 2} : Multiset ℤ).sum ∧
    ({(0 : ℤ), 3} : Multiset ℤ) ≠ {(1 : ℤ), 2} := by decide

/-- CG and Pilloni's Hodge recipes agree under this parameter substitution.
Equality of automorphic representations uses the GSp₄ transfer dictionary in AG2.P. -/
example (a b : ℤ) :
    ![0, -(2 - b), -(1 - a), -(1 - a) - (2 - b)] = ![0, b - 2, a - 1, a + b - 3] := by
  ext i
  fin_cases i <;> simp
  ring

/-- CG's ordinary roots have different valuation exponents in the regular range. -/
example (a b : ℤ) (hab : b ≤ a) (hb : 3 ≤ b) :
    0 < b - 2 ∧ b - 2 < a - 1 ∧ a - 1 < a + b - 3 := by
  omega

/-! ## Layer AG2.7: local residual eigenvalue conditions -/

/-- Every ordered ratio of different occurrences avoids q. -/
def IsGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  ∀ i j, i ≠ j → (α i : K) / (α j : K) ≠ q

/-- Generic eigenvalues that are pairwise distinct. -/
def IsStrongGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  IsGenericEigenvalues α q ∧ Function.Injective α

/-- Generic matrix data with a specified inertia subgroup and Frobenius. -/
def IsGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

/-- Strong generic matrix data with specified inertia and Frobenius. -/
def IsStrongGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsStrongGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)


/-- Primality instance for the finite-field ratio checks. -/
instance prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-- Primality instance for the distinct-root finite-field check. -/
instance prime_seven : Fact (Nat.Prime 7) := ⟨by decide⟩

/-- Test TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  intro i j _
  simp
  decide

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q. -/
example : ¬ IsGenericEigenvalues ![(Units.mk0 (2 : ZMod 5) (by decide)), 1] (2 : ZMod 5) := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test TauCeti.AutomorphicGalois.isGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsGenericEigenvalues (fun _ : Fin 1 => a) q := by
  intro i j hij
  exact (hij (Subsingleton.elim i j)).elim

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one. -/
example : ¬ IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 1 := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test TauCeti.AutomorphicGalois.strongGeneric_not_repeated. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  constructor
  · intro i j _
    simp
    decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- Test TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio. -/
example : IsStrongGenericEigenvalues ![1, (Units.mk0 (3 : ZMod 7) (by decide))] (2 : ZMod 7) :=
  sorry

/-- Test TauCeti.AutomorphicGalois.strongGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsStrongGenericEigenvalues (fun _ : Fin 1 => a) q := by
  constructor
  · intro i j hij
    exact (hij (Subsingleton.elim i j)).elim
  · intro i j _
    exact Subsingleton.elim i j

/-- Test TauCeti.AutomorphicGalois.strongGeneric_non_Qp: the arithmetic part
of q=4 for an unramified quadratic extension of Q_2. -/
example : (4 : ZMod 3) = 1 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 4 := by
  constructor
  · decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- The genericityTransfer comparison for the stated algebraic data. -/
theorem genericityTransfer {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r s : G →* Matrix.GeneralLinearGroup (Fin n) k) (χ : G →* kˣ)
    (hs : ∀ g, s g = Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * r g)
    (hχ : ∀ g ∈ I, χ g = 1) (frob : G) (q : k) :
    IsGeneric I s frob q ↔ IsGeneric I r frob q := sorry

/-- The residualGenericityOutsideFiniteSet comparison for the stated algebraic data. -/
theorem residualGenericityOutsideFiniteSet {O k : Type*} [CommRing O] [Field k]
    {n : ℕ} (red : O →+* k) (α : Fin n → Oˣ) (q : O)
    (h : ∀ i j, i ≠ j → red ((α i : O) - (α j : O)) ≠ 0 ∧
      red ((α i : O) - q * (α j : O)) ≠ 0) :
    IsStrongGenericEigenvalues (fun i => Units.map red.toMonoidHom (α i)) (red q) := sorry

/-- The isGeneric unramified comparison for the stated algebraic data. -/
theorem isGeneric_unramified {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsGeneric I r frob q) :
    ∀ g ∈ I, r g = 1 := sorry

/-- The isGeneric frobenius independent comparison for the stated algebraic data. -/
theorem isGeneric_frobenius_independent {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob₁ frob₂ : G) (q : k) (h : r frob₁ = r frob₂) :
    IsGeneric I r frob₁ q ↔ IsGeneric I r frob₂ q := sorry

/-- The isGenericEigenvalues smul comparison for the stated algebraic data. -/
theorem isGenericEigenvalues_smul {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (c : Kˣ) :
    IsGenericEigenvalues (fun i => c * α i) q ↔ IsGenericEigenvalues α q := sorry

/-- The isGenericEigenvalues reindex comparison for the stated algebraic data. -/
theorem isGenericEigenvalues_reindex {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (e : Fin n ≃ Fin n) :
    IsGenericEigenvalues (α ∘ e) q ↔ IsGenericEigenvalues α q := sorry

/-- The isGenericEigenvalues inverse comparison for the stated algebraic data. -/
theorem isGenericEigenvalues_inverse {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) :
    IsGenericEigenvalues (fun i => (α i)⁻¹) q ↔ IsGenericEigenvalues α q := sorry

/-- The strongGeneric generic comparison for the stated algebraic data. -/
theorem strongGeneric_generic {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsStrongGeneric I r frob q) : IsGeneric I r frob q := sorry

/-- The strongGeneric distinct comparison for the stated algebraic data. -/
theorem strongGeneric_distinct {K : Type*} [Field K] {n : ℕ}
    {α : Fin n → Kˣ} {q : K} (h : IsStrongGenericEigenvalues α q) :
    Function.Injective α := sorry

/-- The strongGeneric arbitrary local field comparison for the stated algebraic data. -/
theorem strongGeneric_arbitrary_local_field {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k) (frob : G) (p f : ℕ) :
    IsStrongGeneric I r frob (p ^ f : k) ↔
      (∀ g ∈ I, r g = 1) ∧ ∃ α : Fin n → (AlgebraicClosure k)ˣ,
      ((r frob).val.map (algebraMap k (AlgebraicClosure k))).charpoly =
        ∏ i, (X - C (α i : AlgebraicClosure k)) ∧
      IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) (p ^ f : k)) ∧
      Function.Injective α := sorry

/-- The dualAndTwistHeckeComparison comparison for the stated algebraic data. -/
theorem dualAndTwistHeckeComparison {k : Type*} [Field k] {n : ℕ} (α : Fin n → kˣ) (q : kˣ) :
    IsGenericEigenvalues (fun i => q ^ (n - 1) * (α i)⁻¹) (q : k) ↔
      IsGenericEigenvalues α (q : k) := sorry

/-- Check `isGeneric_matrix_diagonal`: diagonal eigenvalues give the library polynomial. -/
example {K : Type*} [Field K] {n : ℕ} (α : Fin n → Kˣ) :
    (Matrix.diagonal (fun i => (α i : K))).charpoly = ∏ i, (X - C (α i : K)) :=
  Matrix.charpoly_diagonal _

/-! ## Layer AG2.7: two labelled algebraic constituents -/

section Unitary
variable {G K : Type*} [Group G] [Field K] {n₁ n₂ : ℕ}

/-- Algebraic block sum of two representations with specified character twists. -/
structure UnitaryDiscreteExport (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) where
  rep : G →* Matrix.GeneralLinearGroup (Fin n₁ ⊕ Fin n₂) K
  block : ∀ g, (rep g).val = Matrix.fromBlocks
    ((ε₁ g : K) • (r₁ g).val) 0 0 ((ε₂ g : K) • (r₂ g).val)

/-- The unitaryDiscreteExport constituent comparison for the stated algebraic data. -/
theorem unitaryDiscreteExport_constituent (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G)
    (v : Fin n₁ → K) :
    (x.rep g).val.mulVec (Sum.elim v 0) =
      Sum.elim (((ε₁ g : K) • (r₁ g).val).mulVec v) 0 := sorry

/-- The unitaryDiscreteExport goodPolynomial comparison for the stated algebraic data. -/
theorem unitaryDiscreteExport_goodPolynomial (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (x.rep g).val.charpoly = (((ε₁ g : K) • (r₁ g).val).charpoly) *
      (((ε₂ g : K) • (r₂ g).val).charpoly) := sorry

/-- Check `unitaryDiscreteExport_two_characters`: the two linear factors multiply. -/
example (r₁ r₂ : G →* Matrix.GeneralLinearGroup (Fin 1) K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (x.rep g).val.charpoly = (X - C ((ε₁ g : K) * (r₁ g).val 0 0)) *
      (X - C ((ε₂ g : K) * (r₂ g).val 0 0)) := sorry

/-- Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity. -/
example : Module.finrank K ((Fin n₁ ⊕ Fin n₂) → K) = n₁ + n₂ := sorry

/-- Check `unitaryDiscreteExport_not_cuspidal_irreducibility`: the first summand is proper. -/
example (r₁ r₂ : G →* Matrix.GeneralLinearGroup (Fin 1) K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) (a : K) :
    ((x.rep g).val.mulVec (Sum.elim (fun _ => a) (fun _ => 0))) (Sum.inr 0) = 0 ∧
    ¬ Representation.IsIrreducible
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp x.rep)) :
        Representation K G ((Fin 1 ⊕ Fin 1) → K)) := sorry

end Unitary

/-
The README specifies the arithmetic place-fibre targets
IsDecomposedGenericPrime, IsDecomposedGeneric, infinitelyManyDecomposedGenericPrimes;
the compatible-system targets compatibleSystem, IsStrongCoefficientField,
GoodPrimeExport, NonselfdualComparisonExport, PolarizedComparisonExport;
and residualRep and ResidualPolynomialExport on their actual geometric and arithmetic carriers.
-/

end TauCeti.AutomorphicGalois

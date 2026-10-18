import Mathlib

/-!
# Arithmetic statistics, Part VI: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file records light definitions and selected milestones that
can be stated against the pinned Mathlib; it is not exhaustive. Counts keep the
specified cutoffs and denominators; orbit weights, local masses, height averages,
moduli, covering and arithmetic probability constructions remain README targets.

Design choices made explicit here:
* a restricted Selmer set is cut out of an existing set by one local image per place;
  the empty family of places imposes no condition;
* the odd-component bound is the unnormalized count `S_m(k)`; the README divides it by
  `2 ^ (m - 1)` only for `m ≥ 1`;
* plane cubics are coefficient vectors in the ordinary monomial basis
  `x³, x²y, x²z, xy², xyz, xz², y³, y²z, yz², z³`, counted in an inclusive integral cube,
  with no `GL₃`, scalar or isomorphism quotient;
* the rank-one family is a predicate on integral short pairs `(A, B)`, with
  `Δ₀ = -4A³ - 27B²`; nonsplit reduction at seven is the test that `864B` is a
  nonsquare modulo seven, and good ordinary reduction at five is `#E(𝔽₅) ≢ 1 (mod 5)`.
-/

noncomputable section
open scoped BigOperators Topology
open Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartVI

/-! ## Layer 4: Selmer averages and arithmetic applications -/

namespace Selmer

/-- Restrict an existing Selmer set by a specified local image at every place
(README §4.17, restricted Selmer set). -/
def restrictedSelmerSet {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) : Set A :=
  {s | s ∈ S ∧ ∀ v, loc v s ∈ I v}

/-- Two places: the restriction is the intersection `{1}` of the local images, not their
union. -/
example : restrictedSelmerSet (Set.univ : Set (Fin 3))
    (fun _ : Bool => id) (fun b => if b then {0, 1} else {1, 2}) = {1} := by
  ext s
  simp only [restrictedSelmerSet, Set.mem_univ, true_and, Bool.forall_bool, id]
  fin_cases s <;> simp

/-- No places: the restriction is the original set. -/
example (S : Set ℕ) : restrictedSelmerSet (Q := fun _ : Empty => ℕ) S
    (fun v : Empty => Empty.elim v) (fun v : Empty => Empty.elim v) = S := by
  ext s; simp [restrictedSelmerSet]

/-- An empty local image at one place empties the restriction. -/
example : restrictedSelmerSet (Set.univ : Set ℕ) (fun _ : Unit => id)
    (fun _ => ∅) = ∅ := by
  ext s; simp [restrictedSelmerSet]

/-- The number `S_m(k)` of odd subsets of size at most `k` of `m` real components
(README §4.17, odd component bound; BGW, proof of Theorem 7, p. 34). -/
def oddComponentBound (m k : ℕ) : ℕ :=
  ∑ j ∈ (Finset.range (k + 1)).filter (fun j => Odd j), Nat.choose m j

/-- For fixed odd degree, the effective-divisor image occupies a vanishing fraction of
real components (BGW (23), p. 34). -/
theorem component_bound_ratio_tendsto (k : ℕ) :
    Tendsto (fun m : ℕ => (oddComponentBound m k : ℝ) / 2 ^ (m - 1))
      atTop (nhds 0) := by sorry

example : oddComponentBound 3 1 = 3 := by decide
example : oddComponentBound 5 3 = 15 ∧ oddComponentBound 3 9 = 4 := by decide
example (m : ℕ) : oddComponentBound m 0 = 0 := by
  simp [oddComponentBound]
/-- Strictness below the saturation range: `S₅(3) = 15 < 16 = 2⁴`. -/
example : oddComponentBound 5 3 < 2 ^ (5 - 1) := by decide
/-- Saturation: for `k ≥ m` the bound is all of `2 ^ (m - 1)`. -/
example : oddComponentBound 4 5 = 2 ^ (4 - 1) := by decide

/-- A ternary cubic in the ten ordinary monomial coefficients, ordered
`x³, x²y, x²z, xy², xyz, xz², y³, y²z, yz², z³`. -/
def ternaryCubicValue (c : Fin 10 → ℤ) (x : Fin 3 → ℚ) : ℚ :=
  c 0 * x 0 ^ 3 + c 1 * x 0 ^ 2 * x 1 + c 2 * x 0 ^ 2 * x 2 +
  c 3 * x 0 * x 1 ^ 2 + c 4 * x 0 * x 1 * x 2 + c 5 * x 0 * x 2 ^ 2 +
  c 6 * x 1 ^ 3 + c 7 * x 1 ^ 2 * x 2 + c 8 * x 1 * x 2 ^ 2 + c 9 * x 2 ^ 3

example : ternaryCubicValue (![1,0,0,0,0,0,0,0,0,0] : Fin 10 → ℤ) ![2,3,4] = 8 := by
  simp [ternaryCubicValue]; norm_num
example : ternaryCubicValue (![0,0,0,0,0,0,0,0,0,1] : Fin 10 → ℤ) ![2,3,4] = 64 := by
  simp [ternaryCubicValue]; norm_num
/-- The second and third coefficients are `x²y` and `x²z`, in that order. -/
example : ternaryCubicValue (![0,1,0,0,0,0,0,0,0,0] : Fin 10 → ℤ) ![2,3,4] = 12 ∧
    ternaryCubicValue (![0,0,1,0,0,0,0,0,0,0] : Fin 10 → ℤ) ![2,3,4] = 16 := by
  simp [ternaryCubicValue]; norm_num
/-- Every form vanishes at the zero vector, which the solubility count excludes. -/
example (c : Fin 10 → ℤ) : ternaryCubicValue c 0 = 0 := by
  simp [ternaryCubicValue]

/-- A positive proportion of ternary cubic coefficient vectors in the cube `|cᵢ| ≤ T` have
a nonzero rational zero (Bhargava, arXiv:1402.1131, Theorem 2, p. 3, with the region
`[-1, 1]¹⁰`). -/
theorem positive_plane_cubic_solubility :
    0 < liminf (fun T : ℕ =>
      ({c : Fin 10 → ℤ | (∀ i, |c i| ≤ (T : ℤ)) ∧
        ∃ x : Fin 3 → ℚ, x ≠ 0 ∧ ternaryCubicValue c x = 0}.ncard : ℝ) /
      (((2 * T + 1) ^ 10 : ℕ) : ℝ)) atTop := by sorry

/-- The rank-one family of integral short pairs (README §4.22; Bhargava–Skinner,
arXiv:1401.0233, §2, pp. 3–4): `v₂(A) = 3`, `v₂(B) = 4`, `-4A³ - 27B² = 256d` with `d`
positive, odd and squarefree, the discriminant prime to `195` and a square modulo `39`,
`7 ∣ d`, nonsplit reduction at seven and good ordinary reduction at five. -/
def RankOneFamily (A B : ℤ) : Prop :=
  (8 : ℤ) ∣ A ∧ ¬ (16 : ℤ) ∣ A ∧ (16 : ℤ) ∣ B ∧ ¬ (32 : ℤ) ∣ B ∧
  ∃ d : ℤ, -4 * A ^ 3 - 27 * B ^ 2 = 256 * d ∧ 0 < d ∧ Odd d ∧ Squarefree d ∧
    IsCoprime (-4 * A ^ 3 - 27 * B ^ 2) 195 ∧
    IsSquare ((-4 * A ^ 3 - 27 * B ^ 2 : ℤ) : ZMod 39) ∧ (7 : ℤ) ∣ d ∧
    ¬ IsSquare ((864 * B : ℤ) : ZMod 7) ∧ (1 + ((Finset.univ : Finset (ZMod 5 × ZMod 5)).filter
      (fun p => p.2 ^ 2 = p.1 ^ 3 + (A : ZMod 5) * p.1 + (B : ZMod 5))).card) % 5 ≠ 1

/-- `(-136, 16)` lies in the family: `d = 39277 = 7·31·181` and `#E(𝔽₅) = 8`. -/
example : RankOneFamily (-136) 16 := by
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, 39277, by norm_num, by norm_num,
    ⟨19638, by norm_num⟩, ?_, ?_, by decide, by norm_num, by decide, by decide⟩
  · rw [← Int.squarefree_natAbs, Nat.squarefree_iff_nodup_primeFactorsList (by norm_num)]
    simp [Nat.primeFactorsList_ofNat]
  · rw [Int.isCoprime_iff_gcd_eq_one]; norm_num

/-- Changing the sign of `B` keeps `Δ₀` but makes `864B` a square modulo seven
(split reduction at seven). -/
example : ¬ RankOneFamily (-136) (-16) := by
  rintro ⟨-, -, -, -, -, -, -, -, -, -, -, -, h, -⟩
  exact h (by decide)

/-- `(136, 16)` has negative `Δ₀`. -/
example : ¬ RankOneFamily 136 16 := by
  rintro ⟨-, -, -, -, d, hd, hpos, -⟩
  omega

/-- `v₂(-16) = 4 ≠ 3`. -/
example : ¬ RankOneFamily (-16) 16 := by
  rintro ⟨-, h, -⟩
  exact h (by norm_num)

/-- `(-1000, 1136)` fails only the ordinary test at five: `#E(𝔽₅) = 6`. -/
example : ¬ RankOneFamily (-1000) 1136 := by
  rintro ⟨-, -, -, -, -, -, -, -, -, -, -, -, -, h⟩
  exact h (by decide)

end Selmer

/-! The remaining definitions of Layer 4 are README targets whose carriers are not at the
pins in the required form: the rational and local orbit weights and orbit counts, the
locally soluble sets `S(F)`, `S_p(F)`, `S_∞(F)`, the local and archimedean Selmer masses,
the height-ordered family average and upper average, the extended upper and lower height
moments and densities, and the admissibility predicate for hyperelliptic congruence
families. -/

end TauCetiRoadmap.ArithmeticStatisticsPartVI

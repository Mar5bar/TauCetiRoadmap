import Mathlib
import TauCeti.NumberTheory.NumberField.Monogenic
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic
import TauCeti.RingTheory.ClassGroup.RelNorm

/-!
# Arithmetic statistics, Part V: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions
and selected milestones statable against the pinned APIs. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology Classical
open Polynomial Filter
open scoped NumberField

namespace TauCetiRoadmap.ArithmeticStatisticsPartV

/-! ## Layer 3: Fields and class-group statistics -/

namespace FieldStatistics

/-- The signed cubic field counts have the Davenport–Heilbronn leading constants.
Each embedded field is weighted by its automorphism order divided by three,
so that each rational isomorphism class contributes one. -/
theorem davenportHeilbronn_cubicFields :
    let count := fun (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 3 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / 3 else 0
    ∀ ε : ℤ, ε = 1 ∨ ε = -1 →
      Tendsto (fun X => count ε X / X) atTop
        (𝓝 (1 / ((if ε = 1 then 12 else 4) * (riemannZeta 3).re))) := by sorry

/-- The mean ordinary three-torsion is four thirds over real quadratic fields
and two over imaginary quadratic fields, with strict discriminant cutoffs. -/
theorem davenportHeilbronn_threeTorsion :
    let total := fun (m : ℕ) (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card {c : ClassGroup (𝓞 K.val) // c ^ m = 1} : ℝ) else 0
    ∀ ε : ℤ, ε = 1 ∨ ε = -1 →
      Tendsto (fun X => total 3 ε X / total 1 ε X) atTop
        (𝓝 (if ε = 1 then 4 / 3 else 2)) := by sorry

/-- All narrow four-rank moments satisfy the Fouvry–Klüners logarithmic error bound,
both for each sign and within each fundamental-discriminant congruence family.
The two-torsion in the square subgroup has cardinality two to the four-rank. -/
theorem fouvryKluners_fourRankMoments :
    let total := fun (k : ℕ) (ε : ℤ) (t : Option (Fin 3)) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        let D := NumberField.discr K.val
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * D ∧ ((ε * D : ℤ) : ℝ) < X ∧
            (match t with
            | none => True
            | some i => if i = 0 then D % 4 = 1 else if i = 1 then D % 8 = 0
                else D % 8 = 4) then
          (Nat.card {c : NumberField.NarrowClassGroup K.val //
            c ^ 2 = 1 ∧ ∃ b, b ^ 2 = c} : ℝ) ^ k else 0
    let subspaces := fun k : ℕ =>
      (Nat.card (Submodule (ZMod 2) (Fin k → ZMod 2)) : ℝ)
    ∀ (k : ℕ) (ε : ℤ), ε = 1 ∨ ε = -1 → ∀ (t : Option (Fin 3)) (δ : ℝ), 0 < δ →
      ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 2 ≤ X →
        |total k ε t X -
          (if ε = 1 then (subspaces (k + 1) - subspaces k) / (2 : ℝ) ^ k
            else subspaces k) * total 0 ε t X| ≤
          C * X * (Real.log X) ^ (-((2 : ℝ) ^ k)⁻¹ + δ) := by sorry

/-- The quadratic narrow four-rank has the Cohen–Lenstra–Gerth limiting law
for each sign and each fundamental-discriminant congruence family. -/
theorem fouvryKluners_fourRankLaw :
    let count := fun (rank : Option ℕ) (ε : ℤ) (t : Option (Fin 3)) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        let D := NumberField.discr K.val
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * D ∧ ((ε * D : ℤ) : ℝ) < X ∧
            (match t with
            | none => True
            | some i => if i = 0 then D % 4 = 1 else if i = 1 then D % 8 = 0
                else D % 8 = 4) ∧
            (match rank with
            | none => True
            | some r => Nat.card {c : NumberField.NarrowClassGroup K.val //
                c ^ 2 = 1 ∧ ∃ b, b ^ 2 = c} = 2 ^ r) then 1 else (0 : ℝ)
    let η := fun r : ℕ => ∏ i ∈ Finset.Icc 1 r, (1 - ((2 : ℝ) ^ i)⁻¹)
    ∀ (ε : ℤ), ε = 1 ∨ ε = -1 → ∀ (t : Option (Fin 3)) (r : ℕ),
      let u : ℕ := if ε = 1 then 1 else 0
      Tendsto (fun X => count (some r) ε t X / count none ε t X) atTop
        (𝓝 (((2 : ℝ) ^ (r * (r + u)))⁻¹ *
          (∏' i : ℕ, (1 - ((2 : ℝ) ^ (i + 1))⁻¹)) / (η r * η (r + u)))) := by sorry

/-- The ordinary and narrow two-torsion means over S₃-cubic fields have their
signature-dependent values. Each of the three conjugate subfields has weight one third. -/
theorem bhargava_cubicTwoTorsionMean :
    let total := fun (narrow : Bool) (m r : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 3 ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = 6 ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            |(NumberField.discr K.val : ℝ)| < X then
          (if narrow then
            (Nat.card {c : NumberField.NarrowClassGroup K.val // c ^ m = 1} : ℝ)
          else (Nat.card {c : ClassGroup (𝓞 K.val) // c ^ m = 1} : ℝ)) / 3 else 0
    ∀ (narrow : Bool) (r : ℕ), r ≤ 1 →
      Tendsto (fun X => total narrow 2 r X / total narrow 1 r X) atTop
        (𝓝 (if r = 0 then (if narrow then 2 else 5 / 4) else 3 / 2)) := by sorry

/-- The S₄ and S₅ field counts have the signature-specific Euler-product constants.
Normal-closure degree n! expresses the full permutation group on n embeddings. -/
theorem bhargava_quarticQuinticFields (n : ℕ) (hn : n = 4 ∨ n = 5) :
    let count := fun (r : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = n.factorial ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            |(NumberField.discr K.val : ℝ)| < X then 1 / (n : ℝ) else 0
    let c := ∏' p : Nat.Primes,
      (1 + ((p.val : ℝ) ^ 2)⁻¹ - ((p.val : ℝ) ^ (n - 1))⁻¹ - ((p.val : ℝ) ^ n)⁻¹)
    ∀ r : ℕ, 2 * r ≤ n →
      Tendsto (fun X => count r X / X) atTop
        (𝓝 (c / (2 * ((n - 2 * r).factorial : ℝ) * 2 ^ r * (r.factorial : ℝ)))) :=
  by sorry

/-- Weighted Sₙ-extension counts over every number-field base have the
Bhargava–Shankar–Wang constant, for each degree from two through five.
Weight one over n on embedded fields equals inverse automorphism weight on classes. -/
theorem bhargavaShankarWang_numberFieldCount (F : Type*) [Field F] [NumberField F]
    (n : ℕ) (hn : 2 ≤ n ∧ n ≤ 5) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L},
        letI : FiniteDimensional F K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite F K.val
        if Module.finrank F K.val = n ∧
            Module.finrank F (IntermediateField.normalClosure F K.val
              (AlgebraicClosure F)) = n.factorial ∧
            |(NumberField.discr K.val : ℝ)| / |(NumberField.discr F : ℝ)| ^ n ≤ X then
          1 / (n : ℝ) else 0
    let q := fun k m : ℕ => (Nat.card {a : Nat.Partition k // a.parts.card ≤ m} : ℝ)
    Tendsto (fun X => count X / X) atTop
      (𝓝 ((1 / 2) * NumberField.dedekindZeta_residue F *
        ((Nat.card {σ : Equiv.Perm (Fin n) // σ ^ 2 = 1} : ℝ) / n.factorial) ^
          NumberField.InfinitePlace.nrRealPlaces F *
        (1 / (n.factorial : ℝ)) ^ NumberField.InfinitePlace.nrComplexPlaces F *
        ∏' p : IsDedekindDomain.HeightOneSpectrum (𝓞 F),
          ∑ k ∈ Finset.range (n + 1),
            (q k (n - k) - (if k = 0 then 0 else q (k - 1) (n - k + 1))) /
              (Ideal.absNorm p.asIdeal : ℝ) ^ k)) := by sorry

/-- Every degree from two through five has a positive linear asymptotic for
all rational field isomorphism classes, including the D₄ contribution in degree four. -/
theorem allFields_degree_le_five (n : ℕ) (hn : 2 ≤ n ∧ n ≤ 5) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧ |(NumberField.discr K.val : ℝ)| < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / n else 0
    ∃ c : ℝ, 0 < c ∧ Tendsto (fun X => count X / X) atTop (𝓝 c) := by sorry

/-- Monogenic fields of squarefree discriminant satisfy the stated lower bound
in every degree and signature, with the full symmetric normal-closure group. -/
theorem monogenicField_lowerBound (n r : ℕ) (hn : 2 ≤ n) (hr : 2 * r ≤ n) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = n.factorial ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            TauCeti.NumberField.IsMonogenic K.val ∧ Squarefree (NumberField.discr K.val) ∧
            |(NumberField.discr K.val : ℝ)| < X then 1 / (n : ℝ) else 0
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ X : ℝ in atTop, c * X ^ (1 / 2 + 1 / (n : ℝ)) ≤ count X :=
  by sorry

/-- In every degree and signature, the short integral generator family has
the lower bound with exponent (n−1)(n+2)/2, even with monogenicity and squarefree discriminant. -/
theorem monogenicField_shortGenerator_lowerBound (n r : ℕ)
    (hn : 2 ≤ n) (hr : 2 * r ≤ n) :
    let count := fun Y : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = n.factorial ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            TauCeti.NumberField.IsMonogenic K.val ∧ Squarefree (NumberField.discr K.val) ∧
            (∃ α : 𝓞 K.val, Algebra.adjoin ℚ {(α : K.val)} = ⊤ ∧
              ∀ σ : K.val →+* ℂ, ‖σ (α : K.val)‖ ≤ Y) then 1 / (n : ℝ) else 0
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ Y : ℝ in atTop,
      c * Y ^ (((n : ℝ) - 1) * ((n : ℝ) + 2) / 2) ≤ count Y := by sorry

/-- Cubic field counts have Roberts' secondary constants and the stated power-saving error. -/
theorem roberts_cubicFieldsSecondary (δ : ℝ) (hδ : 0 < δ) :
    let count := fun (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 3 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / 3 else 0
    ∃ C : ℝ, 0 < C ∧ ∀ ε : ℤ, ε = 1 ∨ ε = -1 → ∀ X : ℝ, 1 ≤ X →
      |count ε X - X / ((if ε = 1 then 12 else 4) * (riemannZeta 3).re) -
        (if ε = 1 then 1 else Real.sqrt 3) *
          (4 * (riemannZeta (1 / 3)).re /
            (5 * Real.Gamma (2 / 3) ^ 3 * (riemannZeta (5 / 3)).re)) * X ^ (5 / 6 : ℝ)| ≤
        C * X ^ (5 / 6 - 1 / 48 + δ) := by sorry

/-- Quadratic three-torsion sums have the secondary Euler-product constant,
with the real and imaginary factors and the power-saving error retained. -/
theorem davenportHeilbronn_threeTorsionSecondary (δ : ℝ) (hδ : 0 < δ) :
    let total := fun (m : ℕ) (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card {c : ClassGroup (𝓞 K.val) // c ^ m = 1} : ℝ) else 0
    let c := 8 * (riemannZeta (1 / 3)).re / (5 * Real.Gamma (2 / 3) ^ 3) *
      ∏' p : Nat.Primes, (1 - ((p.val : ℝ) ^ (1 / 3 : ℝ) + 1) /
        ((p.val : ℝ) * (p.val + 1)))
    ∃ C : ℝ, 0 < C ∧ ∀ ε : ℤ, ε = 1 ∨ ε = -1 → ∀ X : ℝ, 1 ≤ X →
      |total 3 ε X - (if ε = 1 then 4 / 3 else 2) * total 1 ε X -
        (if ε = 1 then 1 else Real.sqrt 3) * c * X ^ (5 / 6 : ℝ)| ≤
        C * X ^ (5 / 6 - 1 / 48 + δ) := by sorry

/-- Schmidt's absolute-discriminant bound has a constant uniform over all base
fields of a fixed degree; embedded fields carry automorphism order over relative degree. -/
theorem schmidt_fieldCount_uniform (m n : ℕ) (hm : 1 ≤ m) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 < C ∧ ∀ (F : Type*) [Field F] [NumberField F],
      Module.finrank ℚ F = m → ∀ X : ℝ, 1 ≤ X →
        (∑ᶠ K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L},
          letI : FiniteDimensional F K.val := K.property
          letI : NumberField K.val := NumberField.of_module_finite F K.val
          if Module.finrank F K.val = n ∧ |(NumberField.discr K.val : ℝ)| ≤ X then
            (Nat.card (K.val ≃ₐ[F] K.val) : ℝ) / n else 0) ≤
          C * X ^ (((n : ℝ) + 2) / 4) := by sorry

/-- Squarefree field discriminant forces the normal closure to have full
symmetric permutation group, expressed by its degree n!. -/
theorem squarefree_discriminant_fullSymmetric (K : Type*) [Field K] [NumberField K]
    (n : ℕ) (hn : 2 ≤ n) (hdegree : Module.finrank ℚ K = n)
    (hdisc : Squarefree (NumberField.discr K)) :
    Module.finrank ℚ (IntermediateField.normalClosure ℚ K (AlgebraicClosure ℚ)) =
      n.factorial := by sorry

/-- All nonsymmetric quintic fields, including A₅ fields, have density zero
relative to the linear discriminant scale. -/
theorem quintic_nonSymmetric_negligible :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 5 ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) ≠ 120 ∧ |(NumberField.discr K.val : ℝ)| < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / 5 else 0
    Tendsto (fun X => count X / X) atTop (𝓝 0) := by sorry

/-- The mixed-trace field count gives the explicit, asymptotic, and two-generator
exponents of Lemke Oliver and Thorne, with constants depending on the degree and exponent. -/
theorem lemkeOliverThorne_fieldCount :
    let count := fun (n : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧ |(NumberField.discr K.val : ℝ)| ≤ X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / n else 0
    let bound := fun (n : ℕ) (a : ℝ) =>
      ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → count n X ≤ C * X ^ a
    (∀ n : ℕ, 6 ≤ n → bound n (1.564 * (Real.log n) ^ 2)) ∧
    (∀ c : ℝ, 1 / (4 * (Real.log 2) ^ 2) < c → ∃ n₀ : ℕ,
      ∀ n : ℕ, n₀ ≤ n → 6 ≤ n → bound n (c * (Real.log n) ^ 2)) ∧
    (∀ n r d : ℕ, 2 ≤ n → 3 ≤ r → r ≤ n → r * n < (d + r - 1).choose (r - 1) →
      bound n ((d : ℝ) * r)) ∧
    (∀ n d : ℕ, 2 ≤ n → 2 * n + 1 ≤ (d + 2).choose 2 →
      (∀ e < d, (e + 2).choose 2 < 2 * n + 1) →
      bound n (2 * d - (d : ℝ) * (d - 1) * (d + 4) / (6 * n))) := by sorry

/-- The simple-group large-subgroup inequality implies the three-eighths bound
for every Galois type of order greater than four over any fixed number-field base. -/
theorem galois_count_threeEighths_of_largeSubgroups
    (hsub : ∀ (S : Type*) [Group S] [Finite S] [IsSimpleGroup S],
      (∃ x y : S, x * y ≠ y * x) →
      ∃ H : Subgroup S, H ≠ ⊤ ∧ Nat.card S < (Nat.card H) ^ 2)
    (k G : Type*) [Field k] [NumberField k] [Group G] [Finite G]
    (hG : 4 < Nat.card G) (δ : ℝ) (hδ : 0 < δ) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite k K.val
        if Module.finrank k K.val = Nat.card G ∧ Normal k K.val ∧
            Nonempty ((K.val ≃ₐ[k] K.val) ≃* G) ∧
            |(NumberField.discr K.val : ℝ)| /
              |(NumberField.discr k : ℝ)| ^ Nat.card G ≤ X then 1 else (0 : ℝ)
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → count X ≤ C * X ^ (3 / 8 + δ) := by sorry

/-- Galois extensions of each fixed type of order greater than four satisfy
the three-eighths discriminant bound over every fixed number-field base. -/
theorem galois_count_threeEighths
    (k G : Type*) [Field k] [NumberField k] [Group G] [Finite G]
    (hG : 4 < Nat.card G) (δ : ℝ) (hδ : 0 < δ) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite k K.val
        if Module.finrank k K.val = Nat.card G ∧ Normal k K.val ∧
            Nonempty ((K.val ≃ₐ[k] K.val) ≃* G) ∧
            |(NumberField.discr K.val : ℝ)| /
              |(NumberField.discr k : ℝ)| ^ Nat.card G ≤ X then 1 else (0 : ℝ)
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → count X ≤ C * X ^ (3 / 8 + δ) := by sorry

/-- Convergence of all exponential rank moments determines each limiting rank probability. -/
theorem rank_moments_determine_rank_law (p : ℕ) [Fact p.Prime] (u : ℕ)
    (μ : ℝ → ℕ → ℝ) (hμ : ∀ X r, 0 ≤ μ X r)
    (hmass : ∀ X, HasSum (μ X) 1)
    (hsum : ∀ X k, Summable (fun r : ℕ => (p : ℝ) ^ (k * r) * μ X r))
    (hmom : ∀ k : ℕ, Tendsto (fun X => ∑' r : ℕ, (p : ℝ) ^ (k * r) * μ X r)
      atTop (𝓝 (∑ j ∈ Finset.range (k + 1),
        (Nat.card {W : Submodule (ZMod p) (Fin k → ZMod p) //
          Module.finrank (ZMod p) W = j} : ℝ) / (p : ℝ) ^ (u * j)))) :
    ∀ r : ℕ, Tendsto (fun X => μ X r) atTop
      (𝓝 (((p : ℝ) ^ (r * (r + u)))⁻¹ *
        (∏' i : ℕ, (1 - ((p : ℝ) ^ (i + 1))⁻¹)) /
        ((∏ i ∈ Finset.Icc 1 r, (1 - ((p : ℝ) ^ i)⁻¹)) *
          ∏ i ∈ Finset.Icc 1 (r + u), (1 - ((p : ℝ) ^ i)⁻¹)))) := by sorry

/-- Root dilation in descending monic coefficients, with weights 1,…,n. -/
def weightedDilation {n : ℕ} (Y : ℝ) (a : Fin n → ℝ) : Fin n → ℝ :=
  fun i => Y ^ (i.val + 1) * a i

/-- The same separation constants are used for every normalized root tuple in the region. -/
def separatedRoots {n : ℕ} (c C : ℝ) (z : Fin n → ℂ) : Prop :=
  (∀ i, ‖z i‖ ≤ C) ∧ ∀ i j, i ≠ j → c ≤ ‖z i - z j‖

/-- Positive separation excludes a repeated root, regardless of the upper norm bound. -/
example (c C : ℝ) (hc : 0 < c) :
    ¬ separatedRoots c C (0 : Fin 2 → ℂ) := by
  intro h
  have h01 := h.2 0 1 (by decide)
  simp only [Pi.zero_apply, sub_self, norm_zero] at h01
  exact (not_le_of_gt hc) h01

/-- With zero separation every bounded root tuple passes, including tuples with repeated roots. -/
example {n : ℕ} (C : ℝ) (z : Fin n → ℂ) (hz : ∀ i, ‖z i‖ ≤ C) :
    separatedRoots 0 C z := by
  constructor
  · exact hz
  · intro i j hij
    exact norm_nonneg _

/-- Weighted coefficient dilations compose multiplicatively. -/
theorem weightedDilation_mul {n : ℕ} (U Y : ℝ) (a : Fin n → ℝ) :
    weightedDilation U (weightedDilation Y a) = weightedDilation (U * Y) a := by sorry

/-- Uniform inverse-Vandermonde estimate underlying the full-region generator fibre bound. -/
theorem separated_generator_coefficients (n : ℕ) (hn : 2 ≤ n)
    (c C : ℝ) (hc : 0 < c) (hC : 0 ≤ C) :
    ∃ K : ℝ, 0 < K ∧ ∀ (Y : ℝ), 1 ≤ Y → ∀ z : Fin n → ℂ,
      separatedRoots c C z → ∀ m : Fin n → ℤ,
      (∀ j, ‖∑ i : Fin n, (m i : ℂ) * ((Y : ℂ) * z j) ^ i.val‖ ≤ C * Y) →
      ∀ i, |(m i : ℝ)| * Y ^ i.val ≤ K * Y := by sorry

/-- Integrality makes all coefficients of degree at least two vanish for large Y. -/
theorem separated_generator_high_coefficients (n : ℕ) (hn : 2 ≤ n)
    (c C : ℝ) (hc : 0 < c) (hC : 0 ≤ C) :
    ∃ Y₀ : ℝ, 1 ≤ Y₀ ∧ ∀ (Y : ℝ), Y₀ < Y → ∀ z : Fin n → ℂ,
      separatedRoots c C z → ∀ m : Fin n → ℤ,
      (∀ j, ‖∑ i : Fin n, (m i : ℂ) * ((Y : ℂ) * z j) ^ i.val‖ ≤ C * Y) →
      ∀ i, 2 ≤ i.val → m i = 0 := by sorry

/-- A single absolute constant controls every primitive nonprincipal quadratic conductor. -/
theorem quadraticCharacter_intervalBound :
    ∃ C : ℝ, 0 < C ∧ ∀ (Q : ℕ), 1 < Q →
      ∀ χ : DirichletCharacter ℂ Q, χ.IsPrimitive → χ ≠ 1 → χ ^ 2 = 1 →
      ∀ M H : ℕ,
      ‖∑ n ∈ Finset.range H, χ ((M + n : ℕ) : ZMod Q)‖ ≤
        C * Real.sqrt Q * Real.log (2 * Q) := by sorry

/-- Prefix minimization among columns of unimodular integral matrices gives real Gram reduction. -/
def IsMinkowskiReducedGram {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  A.PosDef ∧ ∀ (j : Fin n) (U : Matrix (Fin n) (Fin n) ℤ),
    IsUnit U.det →
    (∀ i : Fin n, i < j → ∀ k : Fin n, U k i = if k = i then 1 else 0) →
    A j j ≤ ∑ k : Fin n, ∑ l : Fin n, A k l * (U k j : ℝ) * (U l j : ℝ)

/-- A strong real Gram basis is reduced and every other reduced basis differs by signs. -/
def IsStrongReducedGram {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  IsMinkowskiReducedGram A ∧
    ∀ U : Matrix (Fin n) (Fin n) ℤ, IsUnit U.det →
      IsMinkowskiReducedGram ((U.map (Int.castRingHom ℝ)).transpose * A *
        U.map (Int.castRingHom ℝ)) →
      ∃ ε : Fin n → ℤ, (∀ i, ε i = 1 ∨ ε i = -1) ∧ U = Matrix.diagonal ε

/-- Monic Gram quasi-reduction preserves the unitriangular basis-change restriction. -/
def IsMonicQuasiReducedGram {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  ∃ U : Matrix (Fin n) (Fin n) ℤ,
    (∀ i j : Fin n, j ≤ i → U i j = if i = j then 1 else 0) ∧
    IsMinkowskiReducedGram ((U.map (Int.castRingHom ℝ)).transpose * A *
      U.map (Int.castRingHom ℝ))

/-- Every positive-definite real Gram matrix admits a reduced unimodular integral basis. -/
theorem IsMinkowskiReducedGram_exists {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (hA : A.PosDef) :
    ∃ U : Matrix (Fin n) (Fin n) ℤ, IsUnit U.det ∧
      IsMinkowskiReducedGram ((U.map (Int.castRingHom ℝ)).transpose * A *
        U.map (Int.castRingHom ℝ)) := by sorry

/-- Equal successive minima allow a basis swap, so reducedness need not be strong. -/
theorem strongReducedGram_tied_minima :
    IsMinkowskiReducedGram (1 : Matrix (Fin 2) (Fin 2) ℝ) ∧
      ¬ IsStrongReducedGram (1 : Matrix (Fin 2) (Fin 2) ℝ) := by sorry

/-- A shorter second vector prevents quasi-reduction by changes fixing the first vector. -/
theorem monicQuasiReducedGram_fixed_unit :
    ¬ IsMonicQuasiReducedGram (!![1,0;0,1/4] : Matrix (Fin 2) (Fin 2) ℝ) ∧
      IsMinkowskiReducedGram (!![1/4,0;0,1] : Matrix (Fin 2) (Fin 2) ℝ) := by sorry

/-- A nonzero Jacobian gives a finite geometric fibre off a target hypersurface,
with the affine isolated-intersection Bézout bound. -/
theorem polynomialMap_finiteFibres {k : Type*} [Field k] [CharZero k]
    (N : ℕ) (hN : 1 ≤ N) (f : Fin N → MvPolynomial (Fin N) k)
    (hJ : Matrix.det (fun i j => MvPolynomial.pderiv j (f i)) ≠ 0) :
    ∃ Q : MvPolynomial (Fin N) k, Q ≠ 0 ∧
      ∀ (Ω : Type*) [Field Ω] [Algebra k Ω] [IsAlgClosed Ω],
      ∀ y : Fin N → Ω,
      MvPolynomial.eval₂Hom (algebraMap k Ω) y Q ≠ 0 →
      ({x : Fin N → Ω | ∀ i,
          MvPolynomial.eval₂Hom (algebraMap k Ω) x (f i) = y i} : Set _).Finite ∧
      ({x : Fin N → Ω | ∀ i,
          MvPolynomial.eval₂Hom (algebraMap k Ω) x (f i) = y i} : Set _).ncard ≤
        ∏ i, (f i).totalDegree := by sorry

/-- A finite list total is estimated by N/m times its ordered sample sum. -/
def a4SampleEstimator {N m : ℕ} (counts : Fin N → ℚ) (draws : Fin m → Fin N) : ℚ :=
  (N : ℚ) / m * ∑ i, counts (draws i)

/-- Uniform independent sampling with replacement has expectation equal to the list total. -/
theorem a4SampleEstimator_unbiased {N m : ℕ} (hN : 0 < N) (hm : 0 < m)
    (counts : Fin N → ℚ) :
    (∑ draws : Fin m → Fin N, a4SampleEstimator counts draws) / (N : ℚ) ^ m =
      ∑ j, counts j := by sorry

/-- Squarefree integers have equal density in the three nonzero residue classes modulo four. -/
theorem squarefree_mod_four_count :
    ∃ C : ℝ, 0 < C ∧ ∀ (a : ℕ), a ∈ ({1, 2, 3} : Finset ℕ) → ∀ X : ℝ, 1 ≤ X →
      |(Set.ncard {n : ℕ | 1 ≤ n ∧ (n : ℝ) ≤ X ∧ Squarefree n ∧ n % 4 = a} : ℝ) -
        (2 / Real.pi ^ 2) * X| ≤ C * Real.sqrt X := by sorry

/-- Each sign of quadratic fundamental discriminants has density three over pi squared. -/
theorem quadratic_discriminant_count :
    ∃ C : ℝ, 0 < C ∧ ∀ (ε : ℤ), ε = 1 ∨ ε = -1 → ∀ X : ℝ, 1 ≤ X →
      |(Set.ncard {D : ℤ | D.IsFundamentalDiscr ∧ D ≠ 1 ∧
          0 < ε * D ∧ ((ε * D : ℤ) : ℝ) < X} : ℝ) -
        (3 / Real.pi ^ 2) * X| ≤ C * Real.sqrt X := by sorry

/-- Prime-to-degree norm and extension split the ordinary class-group torsion cardinality. -/
theorem torsionCount_relative_mul (R S : Type*) [CommRing R] [CommRing S]
    [IsDedekindDomain R] [IsDedekindDomain S] [Algebra R S]
    [Module.Finite R S] [Module.IsTorsionFree R S]
    [Finite (ClassGroup R)] [Finite (ClassGroup S)]
    (ℓ : ℕ) (hℓ : ℓ.Prime) (hd : ¬ ℓ ∣ Module.finrank R S) :
    Nat.card {c : ClassGroup S // c ^ ℓ = 1} =
      Nat.card {c : ClassGroup S // ClassGroup.relNorm (R := R) c = 1 ∧ c ^ ℓ = 1} *
        Nat.card {c : ClassGroup R // c ^ ℓ = 1} := by sorry

/-- A degree-uniform discriminant saving bounds two-torsion in every field of fixed degree. -/
theorem classGroupTwoTorsion_powerSaving (n : ℕ) (hn : 3 ≤ n) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type*) [Field K] [NumberField K],
      Module.finrank ℚ K = n →
      (Nat.card {c : ClassGroup (𝓞 K) // c ^ 2 = 1} : ℝ) ≤
        C * |(NumberField.discr K : ℝ)| ^ (1 / 2 - 1 / (2 * (n : ℝ)) + ε) := by sorry

/-- The elliptic-curve feedback bound improves two-torsion estimates for all cubic fields. -/
theorem cubicClassGroupTwoTorsion_bound (ε : ℝ) (hε : 0 < ε) :
    let α := Real.sqrt 3 / 2
    let β := ((1 + α) / (2 * α)) * Real.log ((1 + α) / (2 * α)) -
      ((1 - α) / (2 * α)) * Real.log ((1 - α) / (2 * α))
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type*) [Field K] [NumberField K],
      Module.finrank ℚ K = 3 →
      (Nat.card {c : ClassGroup (𝓞 K) // c ^ 2 = 1} : ℝ) ≤
        C * |(NumberField.discr K : ℝ)| ^ (1 / (6 * (1 - β / Real.log 2)) + ε) := by sorry

/-- The integer ring has a full integral basis of uniformly bounded archimedean size. -/
theorem integerLattice_largestMinimum (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type*) [Field K] [NumberField K],
      Module.finrank ℚ K = n → ∃ b : Module.Basis (Fin n) ℤ (𝓞 K),
        ∀ (i : Fin n) (σ : K →+* ℂ),
          ‖σ (b i : K)‖ ≤ C * |(NumberField.discr K : ℝ)| ^ (1 / (n : ℝ)) := by sorry

/-- Integral Weierstrass points satisfy the uniform discriminant and Mordell–Weil rank bound. -/
theorem elliptic_integralPoints_rankBound (ε : ℝ) (hε : 0 < ε) :
    let α := Real.sqrt 3 / 2
    let β := ((1 + α) / (2 * α)) * Real.log ((1 + α) / (2 * α)) -
      ((1 - α) / (2 * α)) * Real.log ((1 - α) / (2 * α))
    ∃ C : ℝ, 0 < C ∧ ∀ W : WeierstrassCurve ℤ, W.Δ ≠ 0 →
      {xy : ℤ × ℤ | W.toAffine.Equation xy.1 xy.2}.Finite ∧
      (Set.ncard {xy : ℤ × ℤ | W.toAffine.Equation xy.1 xy.2} : ℝ) ≤
        C * |(W.Δ : ℝ)| ^ ε *
          Real.exp ((β + ε) * Module.finrank ℤ
            (W.map (Int.castRingHom ℚ)).toAffine.Point) := by sorry

/-- Cubic ideal counts have an absolute bound uniform in the field and the norm cutoff. -/
theorem cubicIdealCount_uniform :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type*) [Field K] [NumberField K],
      Module.finrank ℚ K = 3 → ∀ T : ℝ, 1 ≤ T →
      (Set.ncard {I : Ideal (𝓞 K) | I ≠ ⊥ ∧ (Ideal.absNorm I : ℝ) ≤ T} : ℝ) ≤
        C * T * (Real.log (2 * |(NumberField.discr K : ℝ)|)) ^ 2 := by sorry

/-- Every finite nonabelian simple group has a proper subgroup larger than its square-root order. -/
theorem simpleGroup_largeProperSubgroup (S : Type*) [Group S] [Finite S] [IsSimpleGroup S]
    (hS : ∃ x y : S, x * y ≠ y * x) :
    ∃ H : Subgroup S, H ≠ ⊤ ∧ Nat.card S < (Nat.card H) ^ 2 := by sorry

namespace RankGrid

/-- Gaussian coefficient decay and geometric zeros force vanishing above the strict order threshold. -/
theorem geometricZero (a α C : ℝ) (ha : 1 < a) (hC : 0 < C)
    (w : ℕ → ℂ) (g : ℂ → ℂ)
    (hseries : ∀ z : ℂ, HasSum (fun r : ℕ => w r * z ^ r) (g z))
    (hbound : ∀ r : ℕ, ‖w r‖ ≤ C * a ^ (-((r : ℝ) ^ 2) / 2 + α * r))
    (hzeros : ∀ m : ℕ, g ((a : ℂ) ^ m) = 0)
    (ω : ℕ) (horder : ∀ r < ω, w r = 0) (hω : α - 1 / 2 < (ω : ℝ)) :
    ∀ z : ℂ, g z = 0 := by sorry

end RankGrid

/-- Conjugacy classes of involutions mapping nontrivially to the distinguished quadratic quotient. -/
def outsideClassCount {F : Type*} [Group F] [Finite F] (π : F →* Multiplicative (ZMod 2)) : ℕ :=
  Nat.card {q : ConjClasses F //
    ∃ y : F, y ^ 2 = 1 ∧ π y ≠ 1 ∧ ConjClasses.mk y = q}

/-- The finite tame mass weights identity inertia by one and outside involutions by p to minus s. -/
def tameOutsideLocalMass {F : Type*} [Group F] [Fintype F]
    (π : F →* Multiplicative (ZMod 2)) (p : ℕ) (s : ℝ) : ℝ := by
  classical
  exact (∑ x : F, ∑ y : F,
    if x * y * x⁻¹ = y ^ p ∧ (y = 1 ∨ (y ^ 2 = 1 ∧ π y ≠ 1)) then
      (if y = 1 then 1 else (p : ℝ) ^ (-s)) else 0) / Fintype.card F

/-- For odd residue cardinality each outside conjugacy class contributes one ramified mass term. -/
theorem tameOutsideLocalMass_eq {F : Type*} [Group F] [Fintype F]
    (π : F →* Multiplicative (ZMod 2)) (p : ℕ) (hp : Odd p) (s : ℝ) :
    tameOutsideLocalMass π p s = 1 + (outsideClassCount π : ℝ) * (p : ℝ) ^ (-s) := by sorry

/-- At exponent zero the tame mass counts the identity class and all outside involution classes. -/
theorem tameOutsideLocalMass_at_zero {F : Type*} [Group F] [Fintype F]
    (π : F →* Multiplicative (ZMod 2)) (p : ℕ) (hp : Odd p) :
    tameOutsideLocalMass π p 0 = 1 + (outsideClassCount π : ℝ) := by sorry

/-
README-only targets, with their intended carriers, hypotheses and APIs in the indicated
sections. These need the arithmetic, orbit or geometric interfaces specified there.

§3.6:
  FieldStatistics.quadraticAllOrder_L1Mean

§3.23:
  FieldStatistics.RigidField
  FieldStatistics.RigidField.field
  FieldStatistics.RigidField.relabel
  FieldStatistics.relativeNarrowClassGroup
  FieldStatistics.rigidFieldCount
  FieldStatistics.rigidFieldCount_eq_normalizer_mul_embedded
  FieldStatistics.rigidFieldCount_eq_weightedIso
  FieldStatistics.rigidFieldCount_mono

Arithmetic lattice and torsion inputs:
  FieldStatistics.squareIdeal_smallGenerator
  FieldStatistics.squareNorm_count

§3.25:
  FieldStatistics.cubicConductor_choices
  FieldStatistics.cubicOrder_resolventMass

§3.27:
  FieldStatistics.BadTypeMomentPrediction
  FieldStatistics.GoodTypeMomentPrediction
  FieldStatistics.IsAdmissibleType
  FieldStatistics.IsGoodType
  FieldStatistics.OutsideInvolutions
  FieldStatistics.RefinedGoodTypeMomentPrediction
  FieldStatistics.a4KernelFieldCorrespondence
  FieldStatistics.a4RigidCount_eq_24_mul
  FieldStatistics.a4RigidCount_eq_48_mul_orbits
  FieldStatistics.catalogueRow
  FieldStatistics.eligibleA4Kernel
  FieldStatistics.eligibleA4Kernels
  FieldStatistics.enumeratedTypes_complete
  FieldStatistics.enumeratedTypes_transport
  FieldStatistics.goodType_iff_classCount_one
  FieldStatistics.liftingInvariant_generator_change
  FieldStatistics.quadraticOddRestricted_L1Mean
  FieldStatistics.quaternion_fixedFactor_residue
  FieldStatistics.quotientGraphType
  FieldStatistics.quotientGraphType_card
  FieldStatistics.quotientGraphType_outside
  FieldStatistics.rigidMoment_imaginary_eq
  FieldStatistics.rigidMoment_inadmissible
  FieldStatistics.rigidMoment_real_good_eq
  FieldStatistics.rigidQuadraticMoment
  FieldStatistics.transportType
  FieldStatistics.typeAutStabilizer
  FieldStatistics.typeAutStabilizer_abelian
  FieldStatistics.unrigidQuadraticMoment

§3.28:
  FieldStatistics.doublePointInterpolation

Before the first cyclotomic counterexample (§3.9):
  FieldStatistics.abelianDiscriminantSeries

§3.29:
  FieldStatistics.quartic_fixedResolvent_upper

§3.30:
  FieldStatistics.jointSpin_primeBound
  FieldStatistics.IsRankGoverningField
  FieldStatistics.governing_conjugate_class
  FieldStatistics.governing_enlarge
  FieldStatistics.governing_isomorphism
  FieldStatistics.governing_prime_choice

§3.31:
  FieldStatistics.fixedPrimeFactor_legendrePatterns
  FieldStatistics.negativePellRadicands
  FieldStatistics.pellDiscriminant
  FieldStatistics.pellFourRankSlice
  FieldStatistics.pellRadicand_iff_local
  FieldStatistics.pellRadicands
  FieldStatistics.pellRadicandsBelow
  FieldStatistics.pell_fixedPrimeFactor_lower

§3.32:
  FieldStatistics.IsBinaryQuasiReduced
  FieldStatistics.IsMonicQuasiReduced
  FieldStatistics.binaryOrderGram
  FieldStatistics.binaryOrderGram_ring
  FieldStatistics.monicOrderGram
  FieldStatistics.monicOrderGram_ring
  FieldStatistics.reduction_root_dilation

§3.37 (finite local masses for every embedded type; the logarithmic exponent and
prediction take an admissible type, whose outside class count is positive):
  FieldStatistics.LogarithmicMomentPrediction
  FieldStatistics.localModelLogExponent
  FieldStatistics.localModelLogExponent_good
-/

end FieldStatistics

end TauCetiRoadmap.ArithmeticStatisticsPartV

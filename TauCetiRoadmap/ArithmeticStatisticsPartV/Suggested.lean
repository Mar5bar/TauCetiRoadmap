import Mathlib

/-!
# Arithmetic statistics, Part V: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions
and selected milestones statable against the pinned APIs. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartV

/-! ## Layer 3: Fields and class-group statistics -/

namespace FieldStatistics

/-- Root dilation in descending monic coefficients, with weights 1,…,n. -/
def weightedDilation {n : ℕ} (Y : ℝ) (a : Fin n → ℝ) : Fin n → ℝ :=
  fun i => Y ^ (i.val + 1) * a i

/-- The same separation constants are used for every normalized root tuple in the region. -/
def separatedRoots {n : ℕ} (c C : ℝ) (z : Fin n → ℂ) : Prop :=
  (∀ i, ‖z i‖ ≤ C) ∧ ∀ i j, i ≠ j → c ≤ ‖z i - z j‖

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

example : weightedDilation 2 (![1,2] : Fin 2 → ℝ) = ![2,8] := by sorry
example : weightedDilation 3 (weightedDilation 2 (![1,2] : Fin 2 → ℝ)) =
    ![6,72] := by sorry
example (a : Fin 2 → ℝ) : weightedDilation 1 a = a ∧
    weightedDilation 0 a = 0 := by sorry
example : separatedRoots 2 1 (![-1,1] : Fin 2 → ℂ) := by sorry
example : separatedRoots 2 1 (![-Complex.I,Complex.I] : Fin 2 → ℂ) := by sorry
example (c : ℝ) (hc : 0 < c) :
    ¬ separatedRoots c 1 (0 : Fin 2 → ℂ) := by sorry
example : weightedDilation 2 (0 : Fin 0 → ℝ) = 0 ∧
    separatedRoots 1 (-1) (0 : Fin 0 → ℂ) := by sorry
example : separatedRoots 1 0 (0 : Fin 1 → ℂ) ∧
    ¬ separatedRoots 1 (-1) (0 : Fin 1 → ℂ) := by sorry

/-- Zero separation permits a singular evaluation matrix and nonzero invisible coefficients. -/
example : separatedRoots 0 0 (0 : Fin 3 → ℂ) ∧
    ∃ m : Fin 3 → ℤ, m ≠ 0 ∧
      ∀ j : Fin 3, ∑ i : Fin 3, (m i : ℂ) *
        ((0 : Fin 3 → ℂ) j) ^ i.val = 0 := by sorry

/-- Field-count and discriminant exponents include the loss of one translation parameter. -/
example : ((3 * (3 + 1) / 2 : ℚ) - 1) / (3 * (3 - 1)) = 5/6 ∧
    ((4 + 1 : ℚ) / (2 * 4 - 2)) = 5/6 ∧
    (1/2 + 1/4 : ℚ) = 3/4 := by sorry

/-- Signature and squarefreeness controls for the alternating-extension transfer. -/
example : (X ^ 3 - X - 1 : ℤ[X]).discr = -23 := by sorry
example : (X ^ 3 - 4 * X + 1 : ℤ[X]).discr = 229 := by sorry
example : (X ^ 3 - 2 : ℤ[X]).discr = -108 := by sorry

/-- The fixed-degree quartic discriminant uses the same sign as the binary-form convention. -/
example : (X ^ 4 - 1 : ℤ[X]).discr = -256 := by sorry

/-- In degree two on three-torsion, extension must be normalized by the inverse degree. -/
example (x : ZMod 3) : 2 * (2 * x) = x := by sorry

/-- This irreducible cubic reduction gives nontrivial decomposition with trivial inertia at 2. -/
example : ∀ x : ZMod 2, (X ^ 3 + X + 1 : (ZMod 2)[X]).eval x ≠ 0 := by sorry

/-- The subgroup-size input needs nonabelian simplicity; its smallest positive case is A₅. -/
example : (1 : ℕ) ^ 2 < 2 ∧ (60 : ℕ) < 12 ^ 2 := by sorry

/-- Quadratic generator reflection fixes a trace-zero model, so dividing its orbit size by 2 fails. -/
example (a : ℤ) : (X ^ 2 + C a : ℤ[X]).comp (-X) = X ^ 2 + C a := by sorry

/-- The degree-two real transporter obstruction: xy is fixed by the split diagonal torus. -/
example (u : ℝ) (hu : u ≠ 0) :
    (MvPolynomial.C u * MvPolynomial.X (0 : Fin 2)) *
      (MvPolynomial.C u⁻¹ * MvPolynomial.X (1 : Fin 2)) =
        MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) := by sorry


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

/-- The joining line squared causes the ternary-quadric interpolation exception. -/
example : Matrix.rank
    (!![2,0,0,0,0,0; 0,0,0,1,0,0; 0,0,0,0,1,0;
        0,0,0,1,0,0; 0,2,0,0,0,0; 0,0,0,0,0,1] : Matrix (Fin 6) (Fin 6) ℚ) = 5 := by sorry

/-- The strict mixed-trace dimension inequality first holds at degree five here. -/
example : Nat.choose 6 2 = 15 ∧ Nat.choose 7 2 = 21 ∧ 15 ≤ 3 * 6 ∧
    3 * 6 < 21 := by decide

/-- A nonzero Jacobian polynomial need not give finite fibres everywhere. -/
example : {x : ℚ × ℚ | (x.1, x.1 * x.2) = (0,0)} =
    {x : ℚ × ℚ | x.1 = 0} := by sorry

example (a b : ℚ) (ha : a ≠ 0) :
    {x : ℚ × ℚ | (x.1, x.1 * x.2) = (a,b)} = {(a,b/a)} := by sorry

/-- In positive characteristic the Frobenius has zero derivative. -/
example : (X ^ 2 : (ZMod 2)[X]).derivative = 0 := by sorry

/-- An embedded order orbit has mass orbit-size divided by the generic automorphism order. -/
example : (2 / 2 : ℚ) = 1 ∧ (1 / 2 : ℚ) ≠ 1 ∧
    (1 + 1 / 2 : ℚ) = 3 / 2 ∧ (1 / 2 + 1 / 2 : ℚ) = 1 := by norm_num

/-- The split and inert local numerators match the quadratic Euler-factor expansion. -/
example (u : ℚ) :
    (1 + u) ^ 2 * (1 - u) = (1 - u ^ 2) * (1 + u) ∧
    (1 - u + u ^ 2) * (1 + u) = 1 + u ^ 3 := by
  constructor <;> ring

/-- The wild-three local denominator includes its residue-field cardinality. -/
example : (((1 - 1/9) * (1 - 3 * (1/9)^3)) : ℚ)⁻¹ = 2187/1936 ∧
    ((1 + 1/9)^2 / ((1 - 1/9) * (1 - 3 * (1/9)^3)) : ℚ) = 675/484 := by norm_num

/-- Cancelling the quadratic Euler denominator requires its nonvanishing. -/
example (z u : ℚ) (h : 1 - z * u ≠ 0) :
    (1 - z ^ 2 * u ^ 2) / (1 - z * u) = 1 + z * u := by
  apply (div_eq_iff h).2
  ring

/-- This wild-three cubic has quadratic resolvent discriminant -3 and conductor 9. -/
example : (X ^ 3 - 3 : ℤ[X]).discr = -243 ∧ (-3 : ℤ) * 9 ^ 2 = -243 := by sorry

/-- The least positive norm-one units at discriminants 5 and 20 are different. -/
example : ((3 + Real.sqrt 5) / 2) ^ 3 = 9 + 4 * Real.sqrt 5 ∧
    3 ^ 2 - (5 : ℤ) * 1 ^ 2 = 4 ∧ 18 ^ 2 - (20 : ℤ) * 4 ^ 2 = 4 := by sorry

/-- The primitive D=5 form and its scalar multiple have the same stabilizer. -/
example (x y : ℤ) : (x + y)^2 + (x + y)*(x + 2*y) - (x + 2*y)^2 =
    x^2 + x*y - y^2 := by ring

/-- Residues of a simple counting-series pole are divided by the pole position. -/
example : (1 / (1 / 2) : ℚ) = 2 ∧ (2 / 2 : ℚ) = 1 := by norm_num

/-- Cyclic-cubic and biquadratic pole orders depend on the base cyclotomic degree. -/
example : (2 / 2 : ℕ) = 1 ∧ (2 / 1 : ℕ) = 2 ∧ (3 / 1 : ℕ) = 3 := by norm_num

/-- The positive odd-prime factors and the two dyadic signs stay distinct. -/
example : (1 + 2 / 3 : ℚ) * (1 - 1 / 3) ^ 2 = 20 / 27 ∧
    (1 - 2 / 3 : ℚ) * (1 + 1 / 3) ^ 2 = 16 / 27 ∧
    ((2 - 1) / 4 : ℚ) = 1 / 4 ∧ ((2 + 1) / 4 : ℚ) = 3 / 4 ∧ (1 - 3 / 2^2 - 2 / 2^3 : ℚ) = 0 := by norm_num

/-- The factorization gain beats the uniform ramified-prime loss. -/
example : (2 : ℝ) * Real.sqrt (3 / 5) > 1 := by sorry

/-- The eight-degree defining polynomial for the rank-governing field is irreducible. -/
example :
    Irreducible (X ^ 8 + 6 * X ^ 4 + 1 : ℚ[X]) := by sorry

/-- The explicit zeta-eight element has fourth power -1 in the defining quotient. -/
example : (((X ^ 6 - X ^ 4 + 7 * X ^ 2 - 3) ^ 4 + 256) %
    (X ^ 8 + 6 * X ^ 4 + 1) : ℚ[X]) = 0 := by sorry

/-- The explicit beta has square 1 + zeta-eight squared in the same quotient. -/
example : (((3 * X ^ 7 - X ^ 5 + 17 * X ^ 3 - 3 * X) ^ 2 -
      (X ^ 6 - X ^ 4 + 7 * X ^ 2 - 3) ^ 2 - 16) %
    (X ^ 8 + 6 * X ^ 4 + 1) : ℚ[X]) = 0 := by sorry

/-- The integral-basis index, field discriminant and norm-two generator use consistent signs. -/
example : (2 ^ 36 : ℕ) = 128 ^ 2 * 2 ^ 22 ∧
    (X ^ 8 - 4 * X ^ 7 + 4 * X ^ 6 + 2 * X ^ 4 - 8 * X ^ 3 +
      12 * X ^ 2 - 8 * X + 2 : ℤ[X]).coeff 0 = 2 := by sorry

/-- Odd-prime factorization rules out small prime ideals in the Minkowski range. -/
example : (X ^ 8 + 6 * X ^ 4 + 1 : (ZMod 3)[X]) =
    (X ^ 4 + X ^ 2 + 2) * (X ^ 4 + 2 * X ^ 2 + 2) := by sorry

example : (X ^ 8 + 6 * X ^ 4 + 1 : (ZMod 5)[X]) =
    (X ^ 2 + X + 1) * (X ^ 2 + 2 * X + 4) *
      (X ^ 2 + 3 * X + 4) * (X ^ 2 + 4 * X + 1) := by sorry

example : (4 / Real.pi) ^ 4 * (Nat.factorial 8 : ℝ) / 8 ^ 8 * 2 ^ 11 < 13 ∧
    (12 : ℕ) < 3 ^ 4 ∧ 12 < 5 ^ 2 ∧ 12 < 7 ^ 2 ∧ 12 < 11 ^ 4 := by sorry

/-- The small-group arithmetic refinement stays strictly below three eighths. -/
example : (3 / 16 + 1 / 6 : ℚ) = 17 / 48 ∧ (17 / 48 : ℚ) < 3 / 8 := by norm_num

/-- The nonabelian induction starts at the smallest simple-group order, sixty. -/
example : (1 / 4 + 1 / (2 * Real.sqrt 60) + 1 / 60 : ℝ) < 3 / 8 := by sorry

/-- A single absolute constant controls every primitive nonprincipal quadratic conductor. -/
theorem quadraticCharacter_intervalBound :
    ∃ C : ℝ, 0 < C ∧ ∀ (Q : ℕ), 1 < Q →
      ∀ χ : DirichletCharacter ℂ Q, χ.IsPrimitive → χ ≠ 1 → χ ^ 2 = 1 →
      ∀ M H : ℕ,
      ‖∑ n ∈ Finset.range H, χ ((M + n : ℕ) : ZMod Q)‖ ≤
        C * Real.sqrt Q * Real.log (2 * Q) := by sorry

/-- Complete periods cancel for the nonprincipal quadratic character modulo three. -/
example : (jacobiSym 1 3 : ℤ) + jacobiSym 2 3 = 0 ∧ jacobiSym 1 3 = 1 := by norm_num

/-- The two possible two-vertex Laplacians have different ranks in characteristic two. -/
example : Matrix.rank (0 : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 0 ∧
    Matrix.rank (!![1,1; 1,1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 1 := by sorry

/-- A negative edge supplies the rank criterion; a positive edge does not. -/
example : jacobiSym 5 13 = -1 ∧ jacobiSym 5 41 = 1 ∧
    (8 ^ 2 - 65 * 1 ^ 2 : ℤ) = -1 := by norm_num

/-- Squarefree ideal subsets of residue-degree sum two: the three unramified types. -/
example : ((Finset.univ : Finset (Fin 3)).powerset.filter
    (fun S => (∑ i ∈ S, (![1,1,1] : Fin 3 → ℕ) i) = 2)).card = 3 := by decide

example : ((Finset.univ : Finset (Fin 2)).powerset.filter
    (fun S => (∑ i ∈ S, (![1,2] : Fin 2 → ℕ) i) = 2)).card = 1 := by decide

example : ((Finset.univ : Finset (Fin 1)).powerset.filter
    (fun S => (∑ i ∈ S, (![3] : Fin 1 → ℕ) i) = 2)).card = 0 := by decide

/-- The ramified types have one and zero even-degree subsets, despite degree-one primes. -/
example : ((Finset.univ : Finset (Fin 2)).powerset.filter
    (fun S => (∑ i ∈ S, (![1,1] : Fin 2 → ℕ) i) = 2)).card = 1 ∧
    ((Finset.univ : Finset (Fin 1)).powerset.filter
    (fun S => (∑ i ∈ S, (![1] : Fin 1 → ℕ) i) = 2)).card = 0 := by decide

/-- The graph-product controls are numerical and do not assert an arithmetic density theorem. -/
example : (∏ j ∈ Finset.Icc 1 0, (1 - (2 : ℚ) ^ (1 - 2 * (j : ℤ)))) = 1 ∧
    (1 - (2 : ℚ) ^ (-1 : ℤ)) = 1 / 2 ∧
    (1 - (2 : ℚ) ^ (-1 : ℤ)) * (1 - (2 : ℚ) ^ (-3 : ℤ)) = 7 / 16 := by sorry

/-- Ten transpositions among the 120 permutations give the quintic sieve density. -/
example : (10 / 120 : ℚ) = 1 / 12 ∧ (1 - 1 / 12 : ℚ) = 11 / 12 := by norm_num

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
  FieldStatistics.a4SampleEstimator
  FieldStatistics.catalogueRow
  FieldStatistics.eligibleA4Kernel
  FieldStatistics.eligibleA4Kernels
  FieldStatistics.enumeratedTypes_complete
  FieldStatistics.enumeratedTypes_transport
  FieldStatistics.goodType_iff_classCount_one
  FieldStatistics.liftingInvariant_generator_change
  FieldStatistics.outsideClassCount
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

§3.29:
  FieldStatistics.abelianDiscriminantSeries
  FieldStatistics.cubicIdealCount_uniform
  FieldStatistics.galois_count_threeEighths
  FieldStatistics.galois_count_threeEighths_of_largeSubgroups
  FieldStatistics.quartic_fixedResolvent_upper
  FieldStatistics.simpleGroup_largeProperSubgroup

§3.30:
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
  FieldStatistics.IsMinkowskiReducedGram
  FieldStatistics.IsMinkowskiReducedGram_exists
  FieldStatistics.IsMonicQuasiReduced
  FieldStatistics.IsStrongReducedGram
  FieldStatistics.binaryOrderGram
  FieldStatistics.binaryOrderGram_ring
  FieldStatistics.monicOrderGram
  FieldStatistics.monicOrderGram_ring
  FieldStatistics.reduction_root_dilation

§3.35:
  FieldStatistics.quintic_nonSymmetric_negligible

§3.37:
  FieldStatistics.LogarithmicMomentPrediction
  FieldStatistics.localModelLogExponent
  FieldStatistics.localModelLogExponent_good
  FieldStatistics.tameOutsideLocalMass
  FieldStatistics.tameOutsideLocalMass_at_zero
  FieldStatistics.tameOutsideLocalMass_eq
-/

end FieldStatistics

end TauCetiRoadmap.ArithmeticStatisticsPartV

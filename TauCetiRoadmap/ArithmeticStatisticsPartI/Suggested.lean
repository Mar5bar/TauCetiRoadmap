import Mathlib
import TauCeti.Order.Northcott.Basic

/-!
# Arithmetic statistics, Part I: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions
and selected milestones on the pinned carriers. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartI

/-! ## Layer 0: Families, heights and local specifications -/

/-- A height on an already chosen quotient or representative carrier, with finite sublevels. -/
structure ArithmeticFamily (A : Type*) where
  height : A → ℝ
  northcott : Northcott height

namespace ArithmeticFamily
variable {A : Type*} (F : ArithmeticFamily A)

/-- Inclusive, unweighted count; the Northcott field establishes finiteness. -/
def count (S : Set A) (X : ℝ) : ℕ := {a | a ∈ S ∧ F.height a ≤ X}.ncard

/-- Relative density keeps its ambient subfamily in the denominator. -/
def HasRelativeDensity (S T : Set A) (d : ℝ) : Prop :=
  Tendsto (fun X : ℝ => (F.count (S ∩ T) X : ℝ) / F.count T X) atTop (nhds d)

/-- Densities multiply along nested subfamilies, including empty and finite ones. -/
theorem relativeDensity_mul (U T S : Set A) (hUT : U ⊆ T) (hTS : T ⊆ S)
    (d e : ℝ) (hT : F.HasRelativeDensity T S d)
    (hU : F.HasRelativeDensity U T e) : F.HasRelativeDensity U S (e * d) := by
  sorry

example (X : ℝ) : F.count ∅ X = 0 := by sorry
example : F.HasRelativeDensity ∅ ∅ 0 ∧ ¬ F.HasRelativeDensity ∅ ∅ 1 := by sorry
example (a : A) : F.HasRelativeDensity ({a} : Set A) {a} 1 := by sorry
example (S : Set A) (hS : S.Infinite) : F.HasRelativeDensity S S 1 := by sorry
example : (⟨fun n : ℕ => (n : ℝ), by sorry⟩ : ArithmeticFamily ℕ).count Set.univ 3 = 4 := by sorry
example : ¬ Northcott (fun x : ℚ => (|x| : ℝ)) := by sorry

/-- The two orbits have reciprocal stabilizers 1/2 and 1, respectively. -/
example : Nat.card {u : (ZMod 3)ˣ // (u : ZMod 3) * 0 = 0} = 2 ∧
    Nat.card {u : (ZMod 3)ˣ // (u : ZMod 3) * 1 = 1} = 1 := by sorry

example (S : Set A) (hS : S.Infinite) : F.HasRelativeDensity ∅ S 0 := by sorry
example (S : Set A) (hS : S.Infinite) : ¬ F.HasRelativeDensity ∅ S 1 := by sorry
example : (⟨fun n : ℤ => (|n| : ℝ), by sorry⟩ : ArithmeticFamily ℤ).count Set.univ 3 = 7 := by sorry
example {ι : Type*} (N : ι → ℕ) [Northcott N] (X : ℝ) :
    (TauCeti.normLE N X : Set ι) = {i | (N i : ℝ) ≤ X} := by sorry

/-- Natural height gives the parity density one half. -/
example (F : ArithmeticFamily ℕ) (hF : ∀ n, F.height n = (n : ℝ)) :
    F.HasRelativeDensity {n | Even n} Set.univ (1 / 2) := by sorry

example (F : ArithmeticFamily ℕ) (hF : ∀ n, F.height n = (n : ℝ)) :
    F.HasRelativeDensity {0, 1, 2} Set.univ 0 := by sorry

/-- Alternating geometric blocks have no relative density at natural height. -/
example (F : ArithmeticFamily ℕ) (hF : ∀ n, F.height n = (n : ℝ)) :
    ¬ ∃ d : ℝ, F.HasRelativeDensity
      {n | ∃ k : ℕ, 4 ^ k ≤ n ∧ n < 2 * 4 ^ k} Set.univ d := by sorry

/-- Increasing only the odd heights changes the parity density to one. -/
example (F : ArithmeticFamily ℕ)
    (hF : ∀ n, F.height n = if Even n then (n : ℝ) else (n : ℝ) ^ 2) :
    F.HasRelativeDensity {n | Even n} Set.univ 1 := by sorry

end ArithmeticFamily

namespace Coefficients
/-- Inclusive coefficient-cube height, including the empty vector. -/
def boxHeight {m : ℕ} (a : Fin m → ℤ) : ℕ := Finset.univ.sup (fun i => (a i).natAbs)

/-- Every coefficient cube has its expected finite cardinality. -/
theorem boxHeight_count (m B : ℕ) :
    Nat.card {a : Fin m → ℤ // boxHeight a ≤ B} = (2 * B + 1) ^ m := by sorry

example : Nat.card {a : Fin 1 → ℤ // boxHeight a ≤ 3} = 7 := by sorry
example (a : Fin 0 → ℤ) : boxHeight a = 0 := by sorry

/-- Monic coefficients are ordered from `x^(n−1)` to the constant term. -/
def monicPolynomial {R : Type*} [CommRing R] (n : ℕ) (a : Fin n → R) : R[X] :=
  X ^ n + ∑ i : Fin n, C (a i) * X ^ (n - 1 - i.val)

/-- The strict weighted box used by the monic discriminant sieve. -/
def weightedBox (n : ℕ) (X : ℝ) : Set (Fin n → ℤ) :=
  {a | ∀ i, |(a i : ℝ)| < X ^ (i.val + 1)}

example : monicPolynomial 2 (![0, 4] : Fin 2 → ℤ) = X ^ 2 + C 4 := by sorry
example : monicPolynomial 0 (fun i : Fin 0 => Fin.elim0 i) = (1 : ℤ[X]) := by sorry
example : (![0, 4] : Fin 2 → ℤ) ∉ weightedBox 2 2 := by sorry
example : (![0, 4] : Fin 2 → ℤ) ∈ weightedBox 2 3 := by sorry

/-- Evaluation of a homogeneous binary form; the point at infinity is retained. -/
def binaryValue {R : Type*} [CommRing R] (n : ℕ) (a : Fin (n + 1) → R) (x y : R) : R :=
  ∑ i, a i * x ^ (n - i.val) * y ^ i.val

example : binaryValue 2 (![0, 1, 0] : Fin 3 → ℤ) 2 3 = 6 := by sorry
example : binaryValue 2 (![1, 0, 0] : Fin 3 → ℤ) 1 0 = 1 := by sorry

/-- Strong divisibility is a condition on every coefficient perturbation. -/
def StrongSquareDivides {r : ℕ} (Delta : (Fin r → ℤ) → ℤ) (p : ℕ) (a : Fin r → ℤ) : Prop :=
  ∀ b : Fin r → ℤ, (p : ℤ) ^ 2 ∣ Delta (fun i => a i + (p : ℤ) * b i)

/-- Weak divisibility includes divisibility at the point and excludes the strong locus. -/
def WeakSquareDivides {r : ℕ} (Delta : (Fin r → ℤ) → ℤ) (p : ℕ) (a : Fin r → ℤ) : Prop :=
  (p : ℤ) ^ 2 ∣ Delta a ∧ ¬ StrongSquareDivides Delta p a

example (a : Fin 1 → ℤ) : StrongSquareDivides (fun _ => 0) 3 a := by sorry
example (a : Fin 1 → ℤ) : ¬ WeakSquareDivides (fun _ => 0) 3 a := by sorry

/-- Divisibility at one point does not imply divisibility on its residue class. -/
example : WeakSquareDivides (fun a : Fin 1 → ℤ => a 0) 3 0 ∧
    StrongSquareDivides (fun a : Fin 1 → ℤ => (a 0) ^ 2) 3 0 := by sorry

example : WeakSquareDivides
    (fun a : Fin 2 → ℤ => (monicPolynomial 2 a).discr) 3 ![0, 9] := by sorry
example : StrongSquareDivides
    (fun a : Fin 3 → ℤ => (monicPolynomial 3 a).discr) 3 0 := by sorry
example : StrongSquareDivides
    (fun a : Fin 2 → ℤ => (monicPolynomial 2 a).discr) 2 0 := by sorry

example : boxHeight (![2,-3] : Fin 2 → ℤ) = 3 := by sorry
example : monicPolynomial 1 (![-2] : Fin 1 → ℤ) = X - C 2 := by sorry
example : (0 : Fin 0 → ℤ) ∈ weightedBox 0 0 ∧
    (0 : Fin 1 → ℤ) ∉ weightedBox 1 0 := by sorry
example : binaryValue 0 (![5] : Fin 1 → ℤ) 0 0 = 5 := by sorry
example : ¬ StrongSquareDivides (fun a : Fin 1 → ℤ => a 0) 3 0 := by sorry
example : StrongSquareDivides (fun _ : Fin 1 → ℤ => 9) 3 0 ∧
    ¬ WeakSquareDivides (fun _ : Fin 1 → ℤ => 9) 3 0 := by sorry

end Coefficients

/-- Binary quartics use ordinary monomial coefficients, with no binomial factors. -/
structure BinaryQuartic (R : Type*) where
  a : R
  b : R
  c : R
  d : R
  e : R

namespace BinaryQuartic
variable {R : Type*} [CommRing R]
/-- The invariant `I = 12ae − 3bd + c²`. -/
def invI (f : BinaryQuartic R) : R := 12 * f.a * f.e - 3 * f.b * f.d + f.c ^ 2

/-- The invariant `J = 72ace + 9bcd − 27ad² − 27eb² − 2c³`. -/
def invJ (f : BinaryQuartic R) : R :=
  72 * f.a * f.c * f.e + 9 * f.b * f.c * f.d - 27 * f.a * f.d ^ 2 - 27 * f.e * f.b ^ 2
    - 2 * f.c ^ 3

/-- The discriminant, the integral polynomial with `27 Δ = 4I³ − J²`. -/
def disc (f : BinaryQuartic R) : R :=
  let a := f.a; let b := f.b; let c := f.c; let d := f.d; let e := f.e
  256 * a ^ 3 * e ^ 3 - 192 * a ^ 2 * b * d * e ^ 2 - 128 * a ^ 2 * c ^ 2 * e ^ 2
    + 144 * a ^ 2 * c * d ^ 2 * e - 27 * a ^ 2 * d ^ 4 + 144 * a * b ^ 2 * c * e ^ 2
    - 6 * a * b ^ 2 * d ^ 2 * e - 80 * a * b * c ^ 2 * d * e + 18 * a * b * c * d ^ 3
    + 16 * a * c ^ 4 * e - 4 * a * c ^ 3 * d ^ 2 - 27 * b ^ 4 * e ^ 2 + 18 * b ^ 3 * c * d * e
    - 4 * b ^ 3 * d ^ 3 - 4 * b ^ 2 * c ^ 3 * e + b ^ 2 * c ^ 2 * d ^ 2

/-- The integral invariant identity holds in every commutative coefficient ring. -/
theorem twentySeven_mul_disc (f : BinaryQuartic R) : 27 * disc f = 4 * invI f ^ 3 - invJ f ^ 2 :=
  sorry


/-- Invariant height, before conversion to a minimal elliptic-curve height. -/
def pairHeight (I J : ℝ) : ℝ := max (|I| ^ 3) (J ^ 2 / 4)

example : invI (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = -12 ∧
    invJ (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = 0 ∧
    disc (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = -256 := by sorry
example : disc (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℤ) = 4 := by sorry
example : pairHeight 3 0 = 27 ∧ pairHeight 1 2 = 1 := by sorry

/-- In characteristic three the integral discriminant is not recovered by division by 27. -/
example : invI (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic (ZMod 3)) = 0 ∧
    invJ (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic (ZMod 3)) = 0 ∧
    disc (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic (ZMod 3)) = 1 := by sorry

example : invI (⟨1,0,0,0,1⟩ : BinaryQuartic ℤ) = 12 ∧
    invJ (⟨1,0,0,0,1⟩ : BinaryQuartic ℤ) = 0 ∧
    disc (⟨1,0,0,0,1⟩ : BinaryQuartic ℤ) = 256 := by sorry
example : invI (⟨1,0,0,1,0⟩ : BinaryQuartic ℤ) = 0 ∧
    invJ (⟨1,0,0,1,0⟩ : BinaryQuartic ℤ) = -27 ∧
    disc (⟨1,0,0,1,0⟩ : BinaryQuartic ℤ) = -27 := by sorry
example : pairHeight 0 0 = 0 := by sorry
example : pairHeight (-2) 8 = 16 := by sorry
example : invJ (⟨1,0,0,1,0⟩ : BinaryQuartic ℤ) = -27 ∧
    invJ (⟨0,1,0,0,1⟩ : BinaryQuartic ℤ) = -27 := by sorry

example : invI (⟨0,1,0,-1,0⟩ : BinaryQuartic ℤ) = 3 ∧
    invJ (⟨0,1,0,-1,0⟩ : BinaryQuartic ℤ) = 0 := by sorry
example : invI (⟨0,16,0,-16,0⟩ : BinaryQuartic ℤ) = 768 := by sorry
example : invI (⟨0,0,0,0,0⟩ : BinaryQuartic ℤ) = 0 ∧
    invJ (⟨0,0,0,0,0⟩ : BinaryQuartic ℤ) = 0 ∧
    disc (⟨0,0,0,0,0⟩ : BinaryQuartic ℤ) = 0 := by sorry
example : invI (⟨1,0,0,0,0⟩ : BinaryQuartic ℤ) = 0 ∧
    invJ (⟨1,0,0,0,0⟩ : BinaryQuartic ℤ) = 0 ∧
    disc (⟨1,0,0,0,0⟩ : BinaryQuartic ℤ) = 0 := by sorry
example : invI (⟨0,1,0,0,0⟩ : BinaryQuartic ℤ) = 0 ∧
    invJ (⟨0,1,0,0,0⟩ : BinaryQuartic ℤ) = 0 ∧
    disc (⟨0,1,0,0,0⟩ : BinaryQuartic ℤ) = 0 := by sorry
example : (C 2 * X ^ 4 - C 2 : ℤ[X]).discr = -16384 := by sorry
example : (C 2 * X ^ 4 - C 2 : ℤ[X]).resultant
    (C 2 * X ^ 4 - C 2 : ℤ[X]).derivative = -32768 := by sorry
example : invI (⟨1,1,1,1,1⟩ : BinaryQuartic ℤ) = 10 ∧
    invJ (⟨1,1,1,1,1⟩ : BinaryQuartic ℤ) = 25 ∧
    disc (⟨1,1,1,1,1⟩ : BinaryQuartic ℤ) = 125 := by sorry
example : pairHeight 2 2 = 8 := by sorry

end BinaryQuartic

/-!
The remaining README definitions are targets on their stated suppliers:
`ArithmeticFamily.heightLE`, `weightedCount`, `countLT`, `ofQuotient`, `comap`,
`rescale`, `ofNat`, `ofMulHeight`, `ratio`, `ratioLT`, `upperDensity`, `lowerDensity`,
`stabilizerWeight`, `weightedOrbitCount`; `LocalConditions` with `FinitelyMany`,
`IsRegular`, `localDensity`, `IsLargeRel`; congruence-weight presentations,
`IsAcceptable` and `localMass`; quartic evaluation, substitution, twisted action,
`eligibilityCongruence` and `IsEligible`; `EllipticFamily`, its invariant maps and
congruence subfamilies; `oddSupport`, `unitHeight`, `supportIdeal`, `squareclassHeight`,
`twistModel`, `twistClass`, `twistFamily`, `posSquarefree`, `evenParityClasses`;
discriminant-ordered and embedded number-field families;
the imported cubic-action/algebra adapters and their maximality predicate;
hypersurface monomial coordinates, `FormDensity.minorGCD` and its saturation-index
comparison, primitive residue vectors, local-density moments
and projective equation families; odd quadratic function-field slices;
monic and binary coefficient boxes, fixed-degree binary discriminants, strong and
weak discriminant loci, local proportions and acceptable monic specifications;
hyperelliptic equation families, odd-root predicates and density transfers;
negative-Pell radicands; unpolarized, principally polarized and polarization-fiber
counts; natural bundle law, parity tails, Picard quotient, representatives and carry,
finite joint bundle mass, theta tails, parity product and Hecke pushforward;
`functionFieldAdeles`, `pgl2FunctionField_discrete`, `adelicBundleEquiv`,
`adelicBundleQuotientMeasure`, `adelicBundleQuotientMeasure_volume` and
`adelicBundleMeasure_map` for the function-field adelic bundle measure;
rank-two projective-line splitting, `p1BundleIndex`, finite double-cover pushforwards,
the hyperelliptic involution comparison and `thetaClasses`;
Wood outside involutions, admissible and good embedded types, type automorphisms,
continuous surjections, infinity adapters and exact imaginary/real slices,
rigid average normalizations and root-of-unity refinements; symmetric pencils,
binary-form orders and their ideal lattices; monic local formulas and Euler products.
Their full hypotheses, APIs and Checks are in README.md.

README-only API targets (their hypotheses and Checks are specified there):
`ArithmeticFamily.countLT_le_count`, `ArithmeticFamily.count_comap`;
`ArithmeticFamily.count_eq_weightedCount_indicator`, `ArithmeticFamily.count_eq_zero_of_lt`;
`ArithmeticFamily.count_mono`, `ArithmeticFamily.count_mono_set`;
`ArithmeticFamily.count_rescale`, `ArithmeticFamily.count_union_of_disjoint`;
`ArithmeticFamily.finite_height_le`, `ArithmeticFamily.hasDensity_empty`;
`ArithmeticFamily.hasDensity_iff_lowerDensity_eq_upperDensity`, `ArithmeticFamily.hasDensity_iff_tendsto_ratioLT`;
`ArithmeticFamily.hasDensity_piecewise_rescale`, `ArithmeticFamily.hasDensity_rescale_iff`;
`ArithmeticFamily.hasDensity_self`, `ArithmeticFamily.hasDensity_zero_of_finite`;
`ArithmeticFamily.heightLE_ofNat`, `ArithmeticFamily.mem_heightLE`;
`ArithmeticFamily.ratio_le_one`, `ArithmeticFamily.ratio_nonneg`;
`ArithmeticFamily.tendsto_count_atTop`, `ArithmeticFamily.tendsto_rescale_count_div_rpow`;
`ArithmeticFamily.weightedCount_ofNat`, `BinaryQuartic.abs_le_of_pairHeight_le`;
`BinaryQuartic.disc_eq_discr`, `BinaryQuartic.disc_smul`;
`BinaryQuartic.eligibilityCongruence_invariants`, `BinaryQuartic.eligibleFamily_height`;
`BinaryQuartic.eq_iff_coeff`, `BinaryQuartic.eval_smul`;
`BinaryQuartic.exists_eligible_residues`, `BinaryQuartic.four_mul_pairHeight_intCast`;
`BinaryQuartic.height_ofCurve`, `BinaryQuartic.height_scale`;
`BinaryQuartic.height_smul`, `BinaryQuartic.invI_scale`;
`BinaryQuartic.invI_twistedSMul`, `BinaryQuartic.invJ_scale`;
`BinaryQuartic.invJ_twistedSMul`, `BinaryQuartic.invariants_isEligible`;
`BinaryQuartic.invariants_smul`, `BinaryQuartic.isEligible_iff`;
`BinaryQuartic.isEligible_of_eligibilityCongruence`, `BinaryQuartic.isEligible_selmer_scaling`;
`BinaryQuartic.isHomogeneous_toMvPolynomial`, `BinaryQuartic.map_invI`;
`BinaryQuartic.map_invJ`, `BinaryQuartic.map_smul`;
`BinaryQuartic.neg_one_smul`, `BinaryQuartic.northcott_pairHeight`;
`BinaryQuartic.pairHeight_eq_zero_iff`, `BinaryQuartic.pairHeight_nonneg`;
`BinaryQuartic.pairHeight_scale`, `BinaryQuartic.twistedSMul_eq_smul_of_det_sq`;
`BinaryQuartic.twistedSMul_mul`, `BinaryQuartic.twistedSMul_scalar`;
`Coefficients.boxHeight_le`, `Coefficients.boxHeight_neg`;
`Coefficients.boxHeight_northcott`, `Coefficients.monicPolynomial_monic`;
`Coefficients.weightedHeight_le`, `Coefficients.weightedHeight_northcott`;
`count_sub_weightedOrbitCount_le`;
-/

end TauCetiRoadmap.ArithmeticStatisticsPartI

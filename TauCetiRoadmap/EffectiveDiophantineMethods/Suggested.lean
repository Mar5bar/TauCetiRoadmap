import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic

/-!
# EffectiveDiophantineMethods: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. Rational intervals and
p-adic balls describe exact values with explicit errors. The elliptic canonical
height uses the limiting x-height. Finite solution sets keep any hypothesis
needed for completeness explicit. The geometric constructions and full mathematical
targets are specified in the README.
-/

noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.EffectiveDiophantineMethods

/-! ## Layer 0: Exact algebraic values and scalar precision -/
namespace ED0

/-- Closed rational interval containment, including singleton intervals. -/
def realIntervalContains (l u : ℚ) (x : ℝ) : Prop :=
  (l : ℝ) ≤ x ∧ x ≤ (u : ℝ)

/-- A box concerns the actual complex value, not a numerical equality test. -/
def complexBoxContains (lr ur li ui : ℚ) (z : ℂ) : Prop :=
  realIntervalContains lr ur z.re ∧ realIntervalContains li ui z.im

/-- Absolute precision; a zero centre is allowed and asserts no valuation. -/
def padicBallContains (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ)
    (x : ℚ_[p]) : Prop := ‖x - (c : ℚ_[p])‖ ≤ (p : ℝ) ^ (-N)

/-- Finite-root separation gives arbitrarily narrow boxes for a fixed root.
The same root is selected throughout refinement. -/
theorem exists_isolating_box (f : Polynomial ℚ) (hf : f ≠ 0) (z : ℂ)
    (hz : f.eval₂ (algebraMap ℚ ℂ) z = 0) (ε : ℚ) (hε : 0 < ε) :
    ∃ lr ur li ui : ℚ, lr ≤ ur ∧ li ≤ ui ∧
      ur - lr < ε ∧ ui - li < ε ∧ complexBoxContains lr ur li ui z ∧
      ∀ w : ℂ, f.eval₂ (algebraMap ℚ ℂ) w = 0 →
        complexBoxContains lr ur li ui w → w = z := by
  sorry

/-- Overlap of certified intervals does not prove equality of the values. -/
example : realIntervalContains 1 2 (Real.sqrt 2) ∧
    realIntervalContains 1 2 (Real.sqrt 3) ∧ Real.sqrt 2 ≠ Real.sqrt 3 := by
  sorry

/-- A degenerate interval at the wrong value excludes the root. -/
example : ¬ realIntervalContains 2 2 (Real.sqrt 2) := by
  sorry

example : complexBoxContains 0 0 1 1 Complex.I := by
  sorry

example : ¬ complexBoxContains 0 0 0 0 Complex.I := by
  sorry

/-- Real and imaginary interval coordinates cannot be interchanged. -/
example : ¬ complexBoxContains 1 1 0 0 Complex.I := by
  sorry

/-- Corner norms bound a box from above; they need not give its minimum. -/
example : complexBoxContains (-1) 1 (-1) 1 0 ∧
    Complex.normSq (0 : ℂ) = 0 ∧ Complex.normSq (1 + Complex.I) = 2 := by
  sorry

example : padicBallContains 3 0 2 (9 : ℚ_[3]) := by
  sorry

example : ¬ padicBallContains 3 0 2 (3 : ℚ_[3]) := by
  sorry

/-- Strong precision at a nonzero centre determines both norm and nonzero. -/
theorem padic_nonzero_of_error_lt {p : ℕ} [Fact p.Prime]
    (x c : ℚ_[p]) (hc : c ≠ 0) (h : ‖x - c‖ < ‖c‖) :
    x ≠ 0 ∧ ‖x‖ = ‖c‖ := by
  sorry

/-- Addition and multiplication retain the explicit absolute precision.
The stronger ramified valuation formulation is specified in the README. -/
theorem padic_ball_add {p : ℕ} [Fact p.Prime] (x y : ℚ_[p])
    (c d : ℚ) (N M : ℤ) (hx : padicBallContains p c N x)
    (hy : padicBallContains p d M y) :
    padicBallContains p (c + d) (min N M) (x + y) := by
  sorry

/-- Ultrametric product error using independent bounds on the exact first factor
and the second centre. -/
theorem padic_ball_mul {p : ℕ} [Fact p.Prime] (x y c d : ℚ_[p])
    (r s A B : ℝ) (hr : ‖x - c‖ ≤ r) (hs : ‖y - d‖ ≤ s)
    (hx : ‖x‖ ≤ A) (hd : ‖d‖ ≤ B) :
    ‖x * y - c * d‖ ≤ max (A * s) (B * r) := by
  sorry

/-- Inversion loses twice the valuation of the centre. -/
theorem padic_ball_inv {p : ℕ} [Fact p.Prime] (x c : ℚ_[p])
    (hc : c ≠ 0) (h : ‖x - c‖ < ‖c‖) :
    ‖x⁻¹ - c⁻¹‖ = ‖x - c‖ / ‖c‖ ^ 2 := by
  sorry

/-- Pivot division is safe only after certifying the pivot's nonvanishing.
This is the exact norm identity behind the m+s precision requirement. -/
theorem padic_quotient_error {p : ℕ} [Fact p.Prime]
    (x y c d : ℚ_[p]) (hd : d ≠ 0) (hy : ‖y - d‖ < ‖d‖)
    (hxy : ‖x‖ ≤ ‖y‖) (r : ℝ)
    (hx : ‖x - c‖ ≤ r) (he : ‖y - d‖ ≤ r) :
    ‖x / y - c / d‖ ≤ r / ‖d‖ := by
  sorry

/-- Rational centres exist at every absolute precision by density. -/
theorem exists_padic_ball {p : ℕ} [Fact p.Prime] (x : ℚ_[p]) (N : ℤ) :
    ∃ c : ℚ, padicBallContains p c N x := by
  sorry

/-- Residue degree one does not put a ramified quadratic root in Q_p. -/
example : ¬ ∃ x : ℚ_[3], x ^ 2 = 3 := by
  sorry

end ED0

/-! ## Layer 1: Lattice exclusion and finite short-vector searches -/
namespace ED1

/-- The rounded small linear form must put the corresponding lattice vector
inside this explicit squared radius. A certified larger distance excludes it. -/
theorem linear_form_excluded {n : ℕ} (a : Fin n → ℝ)
    (b : Fin n → ℤ) (v : Fin n → ℤ) (C X η R : ℝ)
    (hX : 0 ≤ X) (hη : 0 ≤ η) (hC : 0 < C)
    (hb : ∀ i, |(b i : ℝ)| ≤ X)
    (hr : ∀ i, |(v i : ℝ) - C * a i| ≤ η)
    (hlarge : R < (∑ i, (b i : ℝ) * (v i : ℝ)) ^ 2)
    (hR : (C * Real.exp (-X) + (n : ℝ) * X * η) ^ 2 ≤ R) :
    Real.exp (-X) < |∑ i, (b i : ℝ) * a i| := by
  sorry

/-- A nonzero integral affine target has zero distance to the lattice. -/
example : (∃ z : ℤ, 2 * z = 2) ∧ ¬ (0 < |(2 : ℝ) - 2 * 1|) := by
  sorry

end ED1

/-! ## Layer 2: Effective logarithms and Diophantine reduction -/

/-- Rational partial sum of the atanh expansion of log x, with N terms. -/
def realLogPartialSum (x : ℚ) (N : ℕ) : ℚ :=
  2 * ∑ k ∈ Finset.range N, ((x - 1) / (x + 1)) ^ (2 * k + 1) / (2 * k + 1)

/-- Rational alternating arctangent partial sum, including the endpoints ±1. -/
def arctanPartialSum (t : ℚ) (N : ℕ) : ℚ :=
  ∑ k ∈ Finset.range N, (-1 : ℚ) ^ k * t ^ (2 * k + 1) / (2 * k + 1)

/-- Positive rational logarithms have a rational geometric remainder bound. -/
theorem realLogPartialSum_error (x : ℚ) (hx : 0 < x) (N : ℕ) :
    |Real.log (x : ℝ) - (realLogPartialSum x N : ℝ)| ≤
      (2 * |(x - 1) / (x + 1)| ^ (2 * N + 1) /
        ((2 * N + 1) * (1 - |(x - 1) / (x + 1)| ^ 2)) : ℚ) := by
  sorry

/-- The endpoint t=1 is included, so this also certifies π=4 arctan1. -/
theorem arctanPartialSum_error (t : ℚ) (ht : |t| ≤ 1) (N : ℕ) :
    |Real.arctan (t : ℝ) - (arctanPartialSum t N : ℝ)| ≤
      (|t| ^ (2 * N + 1) / (2 * N + 1) : ℚ) := by
  sorry

/-- Positive geometric decay gives every rational interval width. -/
theorem exists_scalar_log_precision (x : ℚ) (hx : 0 < x)
    (ε : ℚ) (hε : 0 < ε) :
    ∃ N : ℕ, (4 * |(x - 1) / (x + 1)| ^ (2 * N + 1) /
      ((2 * N + 1) * (1 - |(x - 1) / (x + 1)| ^ 2)) : ℚ) ≤ ε := by
  sorry

example : realLogPartialSum 2 1 = 2 / 3 ∧
    (2 * (1 / 3 : ℚ) ^ 3 / (3 * (1 - (1 / 3 : ℚ) ^ 2))) = 1 / 36 := by
  sorry

example (N : ℕ) : realLogPartialSum 1 N = 0 := by
  sorry

example : arctanPartialSum 1 1 = 1 ∧ arctanPartialSum (-1) 1 = -1 := by
  sorry

example : arctanPartialSum 1 2 = 2 / 3 ∧ arctanPartialSum 1 0 = 0 := by
  sorry

/-- The pinned principal-unit logarithm is compared with this finite
sum. The README states the finite-extension version with ramification losses. -/
def padicLogPartialSum {p : ℕ} [Fact p.Prime] (z : ℚ_[p]) (N : ℕ) : ℚ_[p] :=
  ∑ k ∈ Finset.range N, (-1 : ℚ_[p]) ^ k * (z - 1) ^ (k + 1) / (k + 1)

/-- Norm form of ord(tail)≥ceil(d+N(d−1/(p−1))). The HasSum hypothesis
identifies the existing logarithm, not the finite-tail conclusion. -/
theorem padicLog_tail_precision {p : ℕ} [Fact p.Prime]
    (z logz : ℚ_[p]) (d : ℚ) (N : ℕ)
    (hd : 1 / ((p : ℚ) - 1) < d)
    (hz : ‖z - 1‖ ≤ (p : ℝ) ^ (-(d : ℝ)))
    (hlog : HasSum (fun k : ℕ =>
      (-1 : ℚ_[p]) ^ k * (z - 1) ^ (k + 1) / (k + 1)) logz) :
    ‖logz - padicLogPartialSum z N‖ ≤
      (p : ℝ) ^ (-(⌈d + N * (d - 1 / ((p : ℚ) - 1))⌉ : ℤ)) := by
  sorry

/-- The positive tail slope supplies every requested integer precision. -/
theorem exists_padic_log_truncation (p : ℕ) (hp : p.Prime) (d : ℚ)
    (hd : 1 / ((p : ℚ) - 1) < d) (m : ℤ) :
    ∃ N : ℕ, (m : ℚ) ≤ d + N * (d - 1 / ((p : ℚ) - 1)) := by
  sorry

example : padicLogPartialSum (4 : ℚ_[3]) 4 = (-51 / 4 : ℚ_[3]) := by
  sorry

example {p : ℕ} [Fact p.Prime] (N : ℕ) :
    padicLogPartialSum (1 : ℚ_[p]) N = 0 := by
  sorry

example : padicLogPartialSum (4 : ℚ_[3]) 0 = 0 ∧
    padicLogPartialSum (4 : ℚ_[3]) 1 = 3 := by
  sorry

/-- An odd power does not kill the sign modulo four: the signed form vanishes,
while its discrete logarithm in the order-two subgroup need not vanish. -/
example : (3 : ZMod 4) ≠ 1 ∧ (3 : ZMod 4) ^ 2 = 1 ∧
    (-(3 : ZMod 4) - 1 = 0) ∧ (1 : ZMod 2) ≠ 0 := by
  sorry

/-- A trivial cyclic subgroup has order p^0, including at p=2. -/
example : (1 : ZMod 4) ^ (2 ^ 0 : ℕ) = 1 ∧ (2 ^ 0 : ℕ) = 1 := by
  sorry

/-- The zero form meets every valuation precision, although the totalised
rational valuation of zero is zero. -/
example [Fact (Nat.Prime 5)] :
    padicValRat 5 (1 - 1 : ℚ) = 0 ∧ ED0.padicBallContains 5 0 3 (0 : ℚ_[5]) := by
  sorry

/- S-unit finite enumeration is an equivalence proved after the bound. The
bounded-box hypothesis is about all solutions and is supplied by DT.4 plus
ED.1/ED.2 reductions, never by a proposed answer list. -/
namespace ED2

/-- Every prime divisor lies in S; positivity is imposed by the triple predicate. -/
def supportedOn (S : Finset ℕ) (n : ℕ) : Prop :=
  ∀ q : ℕ, q.Prime → q ∣ n → q ∈ S

/-- Positive coprime S-unit solutions of u+v=w, with u≤v to fix the symmetry. -/
def coprimeSUnitTriple (S : Finset ℕ) (x : ℕ × ℕ × ℕ) : Prop :=
  0 < x.1 ∧ 0 < x.2.1 ∧ x.1 ≤ x.2.1 ∧ x.1 + x.2.1 = x.2.2 ∧
    Nat.Coprime x.1 x.2.1 ∧ supportedOn S x.1 ∧
    supportedOn S x.2.1 ∧ supportedOn S x.2.2

/-- Once reduction proves B, finite exact filtering is exhaustive. -/
theorem sUnit_finite_search (S : Finset ℕ) (B : ℕ)
    (hbound : ∀ x, coprimeSUnitTriple S x → x.2.2 ≤ B) :
    {x | coprimeSUnitTriple S x} =
      {x ∈ (↑((Finset.range (B + 1)).product
        ((Finset.range (B + 1)).product (Finset.range (B + 1)))) :
        Set (ℕ × ℕ × ℕ)) |
        coprimeSUnitTriple S x} := by
  sorry

example : supportedOn {2, 3} 12 := by
  sorry

example : ¬ supportedOn {2, 3} 5 := by
  sorry

example : supportedOn ∅ 1 ∧ ¬ supportedOn {2, 3} 0 := by
  sorry

example : coprimeSUnitTriple {2, 3} (1, 2, 3) := by
  sorry

example : ¬ coprimeSUnitTriple {2, 3} (2, 2, 4) := by
  sorry

example : ¬ coprimeSUnitTriple {2, 3} (2, 1, 3) ∧
    ¬ coprimeSUnitTriple {2, 3} (0, 1, 1) := by
  sorry

end ED2

/-! ## Layer 3: Descent, heights and Mordell–Weil data -/
namespace ED3

variable (W : WeierstrassCurve.Affine ℚ) [W.IsElliptic]

/-- Certified doubling interval using explicit input height/error bounds. -/
theorem canonicalHeight_mem_doubling_interval (P : W.Point) (n : ℕ)
    (l u cminus cplus : ℚ)
    (hlog : (l : ℝ) ≤ ((2 ^ n : ℕ) • P).naiveHeight ∧
      ((2 ^ n : ℕ) • P).naiveHeight ≤ (u : ℝ))
    (hminus : -(cminus : ℝ) ≤
      ((2 ^ n : ℕ) • P).canonicalHeight - ((2 ^ n : ℕ) • P).naiveHeight)
    (hplus : ((2 ^ n : ℕ) • P).canonicalHeight -
      ((2 ^ n : ℕ) • P).naiveHeight ≤ (cplus : ℝ)) :
    ((l : ℝ) - cminus) / 4 ^ n ≤ P.canonicalHeight ∧
      P.canonicalHeight ≤ ((u : ℝ) + cplus) / 4 ^ n := by
  sorry

/-- Width uses the full pinned x-height and the factor 4^n from doubling. -/
example (n : ℕ) (a : ℚ) :
    ((a + 1 / 8) + 3) / (4 : ℚ) ^ n -
      (a - 2) / (4 : ℚ) ^ n = 41 / (8 * (4 : ℚ) ^ n) := by
  sorry

end ED3

/-! ## Layer 4: Chabauty–Coleman and residue discs -/
namespace ED4

/-- Strassmann's bound on the closed unit disc, using the last coefficient of
maximal norm. The coefficients tend to zero, so their series converges there. -/
theorem strassmann_card_le {p : ℕ} [Fact p.Prime]
    (a : ℕ → ℚ_[p]) (N : ℕ)
    (ha : Filter.Tendsto a Filter.atTop (nhds 0))
    (haN : a N ≠ 0)
    (hmax : ∀ k, ‖a k‖ ≤ ‖a N‖)
    (hlast : ∀ k, N < k → ‖a k‖ < ‖a N‖)
    (Z : Finset ℚ_[p])
    (hZ : ∀ z ∈ Z, ‖z‖ ≤ 1 ∧ ∑' k : ℕ, a k * z ^ k = 0) :
    Z.card ≤ N := by
  sorry

end ED4

/-! ## Layer 5: The Mordell–Weil sieve -/
namespace ED5

variable {G : Type*} [AddCommGroup G] {ι : Type*} [Fintype ι]
variable {A : ι → Type*} [∀ i, AddCommGroup (A i)]

/-- Empty intersection of necessary local conditions proves nonexistence. -/
theorem sieve_empty (r : ∀ i, G →+ A i) (localImage : ∀ i, Set (A i))
    (globalImage : Set G)
    (hnecessary : ∀ g ∈ globalImage, ∀ i, r i g ∈ localImage i)
    (hempty : ¬ ∃ g : G, ∀ i, r i g ∈ localImage i) : globalImage = ∅ := by
  sorry

/-- Superset local data preserve every global point. -/
theorem sieve_weaken (r : ∀ i, G →+ A i) (T U : ∀ i, Set (A i))
    (hTU : ∀ i, T i ⊆ U i) :
    {g : G | ∀ i, r i g ∈ T i} ⊆ {g : G | ∀ i, r i g ∈ U i} := by
  sorry

end ED5

/-! ## Layer 6: Quadratic Chabauty and complete solution lists -/
namespace ED6

/-- An exact finite list is sound unconditionally and complete under H. -/
structure FiniteSolutionSet {α : Type*} (H : Prop) (P : α → Prop) where
  solutions : Finset α
  sound : ∀ x ∈ solutions, P x
  complete : H → ∀ x, P x → x ∈ solutions

/-- Under the displayed hypothesis the datum is exactly the solution set. -/
theorem FiniteSolutionSet.coe_eq_setOf {α : Type*} {H : Prop} {P : α → Prop}
    (c : FiniteSolutionSet H P) (hH : H) :
    (c.solutions : Set α) = {x | P x} := by
  sorry

/-- Exact membership alone cannot certify an incomplete list. -/
example : ¬ ∃ c : FiniteSolutionSet True (fun x : ℤ => x ^ 2 = 4),
    c.solutions = {2} := by
  sorry

/-- Conditional completeness with a false premise carries no completeness claim. -/
example : ∃ c : FiniteSolutionSet False (fun x : ℤ => x ^ 2 = 4),
    c.solutions = {2} := by
  sorry

/-- Candidate comparison is a set theorem. Geometry must supply R⊆Z, coverage,
uniqueness and exclusions; a matched ball without uniqueness is insufficient. -/
theorem candidates_eq_known {X : Type*} {ι : Type*} [Fintype ι]
    (R Z L : Set X) (B : ι → Set X)
    (hRZ : R ⊆ Z) (hLR : L ⊆ R)
    (hcover : Z ⊆ ⋃ i, B i)
    (hunique : ∀ i, (Z ∩ B i).Subsingleton)
    (hdecide : ∀ i, (∃ x ∈ L, x ∈ B i) ∨ R ∩ B i = ∅) :
    R = L := by
  sorry

/-- A distinct-root count of one does not supply a multiplicity bound of one. -/
example : (Polynomial.X ^ 2 : Polynomial ℚ).roots = ({0, 0} : Multiset ℚ) := by
  sorry

end ED6

/- The README specifies the following further definitions and constructions.
Layer 0: RealEnclosure, ComplexEnclosure, PadicEnclosure, ExactAlgebraicData,
RealRootIsolation, ArchimedeanEmbeddingData, PadicEmbeddingData,
ValuationData, LocalBallData, heightEnclosure, boundedHeightPoints
and boundedHeightProjectivePoints, including the normalized p-adic ball record.
Layer 1: linearFormMatrix, linearFormLattice, linearFormTarget, roundOfEnclosure,
padicLatticeMatrix, padicLatticeTarget, padicLinearForm, apprOfEnclosure,
quadraticCompletion, fpEnumeration, DistanceWitness, RealExclusionData,
PadicExclusionData, the bounded-distance comparison.
Layer 2: logAbsEnclosure, argEnclosure, MatveevConstantData,
YuConstantData, PadicLogEvaluationData, PadicDiscreteLogData,
ExponentReductionChain, InExponentBox, WeightedExponentReductionChain, thueForm,
thueSolutions, ThueEquation, ThueFactorCovering, ThueConstants, ThueBoundParameters,
thueSmallSolutions, ThueData, thueMahlerSolutions,
ThueMahlerEquation, ThueMahlerCovering, ThueMahlerData,
sUnitSolutions, SUnitData and
sUnitExponentHeight, including their finite-set descriptions.
Layer 3: ellipticLocalImage, LocalImageData, TwoSelmerData,
quarticLocallySoluble, twoIsogenyIntegralQuartic, cremonaMu, canonicalHeightEnclosure, pairingEnclosure,
heightCoordinatePoints,
IsPSaturated, saturation, TorsionData, FiniteIndexSubgroupData
and MordellWeilBasisData.
Layer 4: GoodReductionChabautyDatum, ReductionDiscData, abelianLog,
integrationPairing, formalLogExtension, formalLogPairing, abelianIntegral,
formalLogIntegral, annihilatingDifferentials, reducedAnnihilator,
ResidueDiscVerdict, dominant_of_residue_bounds, ChabautyColemanData and
SymmetricSquareChabautyDatum, together with number-field local criterion data.
Layer 5: admissibleClasses, refineClasses, JacobianReductionData, padicImageClasses,
siftChain, subgroup_triangular_generators, SieveData, with genus-two Kummer
and finite group-presentation data.
Layer 6: QCDiscData, ExplicitSetup,
AdmissibleTateMatrix, A_Z, gaugeMatrix, connectionMatrix, HodgeFiltrationData,
leftMulMatrix, rightMulMatrix, transportMatrix, Frobenius structure and splitting,
localHeight, qc_candidates_cover, qc_complete_of_matched, xs13FrobeniusLift and xs13Theta,
xs13AffineQuartic, xs13SpecialFibrePoints, xs13GammaFilClass,
with the exact model, Hodge truncation, coefficient, root-cluster and finite
comparison data used by the worked examples. -/
/- Further mathematical signatures specified in the README, grouped by subsection.
These targets use the geometric constructions or the complete definition APIs stated there.
They are not Lean declarations in this file.

§0.11:
ED0.abs_mulHeight₁_sub_lt_of_mem_near,
ED0.boundedHeightPoints_superset,
ED0.mem_boundedHeightPoints_of_mulHeight₁_le,
ED0.mem_boundedHeightProjectivePoints,
ED0.mulHeight₁_lt_of_mem_lt.

§0.10:
ED0.charpoly_leftMul_arbitrary,
ED0.charpoly_leftMul_basis_independent,
ED0.heightEnclosure_rat,
ED0.heightEnclosure_width,
ED0.mulHeight₁_eq_leadingCoeff_mul_prod_embeddings,
ED0.mulHeight₁_eq_mahlerMeasure_charpoly.

§1.1:
ED1.abs_linearForm_sub_le,
ED1.linearFormMatrix_det,
ED1.linearFormMatrix_gram_integral,
ED1.linearFormMatrix_mulVec,
ED1.linearFormMatrix_mulVec_injective,
ED1.mem_linearFormLattice,
ED1.normSq_linearFormMatrix_mulVec.

§1.10:
ED1.bounded_distance_comparison.

§1.5:
ED1.mem_padicLattice_iff,
ED1.padicLatticeMatrix_det,
ED1.padicLattice_antitone.

§3.13:
ED3.canonicalHeightEnclosure_neg,
ED3.canonicalHeightEnclosure_width_le,
ED3.canonicalHeightEnclosure_zero,
ED3.canonicalHeight_mem_canonicalHeightEnclosure,
ED3.neronTatePairing_mem_pairingEnclosure.

§3.1:
ED3.card_localDescentImage_padic,
ED3.two_mul_card_localDescentImage_real.

§3.2:
ED3.ellipticLocalImage_span.

§3.15:
ED3.heightCoordinatePoints_complete,
ED3.mem_heightCoordinatePoints.

§3.17:
ED3.index_eq_one_of_forall_isPSaturated,
ED3.isPSaturated_iff,
ED3.isPSaturated_iff_not_dvd_index,
ED3.isPSaturated_top.

§4.23:
ED4.C05_rationalPoints,
ED4.six_points_of_complete_datum.

§4.24:
ED4.C132_rationalPoints,
ED4.eight_points_of_complete_datum.

§4.25:
ED4.X0dyn6_rationalPoints_of_rank_le_three,
ED4.ten_points_of_complete_datum.

§4.3:
ED4.abelJacobi_pullback_bijective,
ED4.abelianIntegral_C05_tiny,
ED4.abelianIntegral_add,
ED4.abelianIntegral_baseChange,
ED4.abelianIntegral_eq_zero_iff,
ED4.abelianIntegral_genusOne,
ED4.abelianIntegral_map,
ED4.abelianIntegral_self,
ED4.abelianIntegral_torsion_nonexample,
ED4.abelianIntegral_trace,
ED4.abelianIntegral_weierstrass_half,
ED4.formalLogIntegral_add,
ED4.formalLogIntegral_compatible_inclusion_of_pairingIdentity,
ED4.formalLogIntegral_eq_zero_iff,
ED4.formalLogIntegral_map_of_pairingIdentity,
ED4.formalLogIntegral_trace_of_pairingIdentity,
ED4.pullback_basepoint_independent,
ED4.suppliedDualEquiv_ext.

§4.4:
ED4.abelianIntegral_eq_primitive.

§4.2:
ED4.abelianLog_C05_kernel_point,
ED4.abelianLog_E11_five_torsion,
ED4.abelianLog_baseChange,
ED4.abelianLog_elliptic,
ED4.abelianLog_eq_formalLog,
ED4.abelianLog_map,
ED4.abelianLog_nsmul,
ED4.abelianLog_torsion,
ED4.abelianLog_unique,
ED4.formalLogExtension_compatible_inclusion,
ED4.formalLogExtension_eq_formalLog,
ED4.formalLogExtension_map,
ED4.formalLogExtension_unique,
ED4.formalLogExtension_zsmul,
ED4.formalLogPairing_eq_zero_iff,
ED4.integrationPairing_eq_zero_iff,
ED4.integrationPairing_leftKernel,
ED4.ker_abelianLog,
ED4.ker_formalLogExtension.

§4.14:
ED4.card_rationalPoints_le_badReduction.

§4.13:
ED4.card_rationalPoints_le_coleman.

§4.6:
ED4.colemanIntegral_eq_abelianIntegral,
ED4.residueConstantDifference_eq_zero_of_frobeniusRelation.

§4.8:
ED4.dim_padicClosure_le_rank.

§4.21:
ED4.eq_of_rank_symmetricMatrix.

§4.19:
ED4.eq_singleton_of_rank_reducedMatrix.

§4.17:
ED4.finiteIndex_of_rank_and_independent.

§4.12:
ED4.finite_rationalPoints_of_rank_lt_genus.

§4.15:
ED4.hyperelliptic_chart_powerSeries,
ED4.hyperelliptic_integralDifferentials_basis.

§4.5:
ED4.integrationPairing_eq_sum_tiny.

§4.22:
ED4.mem_pullback_of_relativeCriterion.

§6.1:
ED6.FiniteSolutionSet.mem_iff,
ED6.FiniteSolutionSet.solutions_eq.

§6.14:
ED6.baseChange_splitting_eq.

§6.19:
ED6.finrank_of_xs13_cubic,
ED6.newform_endomorphism_comparison,
ED6.xs13_endAlgebra.

§6.21:
ED6.finrank_restrictScalars_three,
ED6.xs13_rank_eq_three.

§6.12:
ED6.frobeniusSplitting_eq.

§6.11:
ED6.frobeniusStructure_eq.

§6.7:
ED6.gaugeMatrix_det,
ED6.gaugeMatrix_gauge_iff,
ED6.gaugeMatrix_inv,
ED6.gaugeMatrix_shift.

§6.16:
ED6.geometricRootCount_eq_weierstrassDegree,
ED6.root_satisfies_truncation_congruence,
ED6.roots_determined_of_truncation.

§6.8:
ED6.hodgeFiltration_basis.

§6.10:
ED6.leftMulMatrix_mul,
ED6.leftMul_rightMul_comm,
ED6.mulVec_leftMulMatrix,
ED6.rightMulMatrix_mul.

§6.13:
ED6.localHeight_eq.

§6.15:
ED6.qcValuation_branchBoundary,
ED6.qcValuation_lowDegree,
ED6.qcValuation_zeroCoefficient,
ED6.valuation_coeff_ge.

§6.4:
ED6.rationalPoints_eq_of_qcData.

§6.35:
ED6.x0plus_genusThree_rationalPoints.

§6.34:
ED6.xS4_13_rationalPoints.

§6.32:
ED6.xns13_rationalPoints_card.

§6.24:
ED6.xs13FrobeniusLift_y_congr,
ED6.xs13FrobeniusMatrix_cup,
ED6.xs13FrobeniusMatrix_trace,
ED6.xs13_P2_teichmuller.

§6.20:
ED6.xs13_analyticRank_eq_one,
ED6.xs13_derivative_ne_zero.

§6.25:
ED6.xs13_equivariant_height_comparison.

§6.23:
ED6.xs13_hodgeData_base_conditions,
ED6.xs13_hodgeData_conditions.

§6.18:
ED6.xs13_planeModel,
ED6.xs13_quartic_identity_and_points,
ED6.xs13_specialFibre_card,
ED6.xs13_specialFibre_smooth.

§6.29:
ED6.xs13_rationalPoints.

§6.22:
ED6.xs13_tateClasses_admissible.
-/
end TauCetiRoadmap.EffectiveDiophantineMethods

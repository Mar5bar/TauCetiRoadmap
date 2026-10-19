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

/-- A singleton real interval determines its enclosed value. -/
example (q : ℚ) (x : ℝ) : realIntervalContains q q x ↔ x = (q : ℝ) := by
  constructor
  · intro h
    exact le_antisymm h.2 h.1
  · intro h
    subst x
    exact ⟨le_rfl, le_rfl⟩

/-- A box with both widths zero determines both complex coordinates. -/
example (a b : ℚ) (z : ℂ) :
    complexBoxContains a a b b z ↔ z = (a : ℂ) + (b : ℂ) * Complex.I := by
  constructor
  · rintro ⟨hr, hi⟩
    apply Complex.ext
    · simpa using le_antisymm hr.2 hr.1
    · simpa using le_antisymm hi.2 hi.1
  · intro h
    subst z
    simp [complexBoxContains, realIntervalContains]

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

/-- Residue degree one does not embed a ramified quadratic root into Q₃. -/
theorem no_sqrt_three_in_padic_three : ¬ ∃ x : ℚ_[3], x ^ 2 = 3 := by
  sorry

/-- The Hensel root has an exact distance formula throughout its Hensel disc. -/
theorem hensel_distance {p : ℕ} [Fact p.Prime] {R : Type*} [CommSemiring R]
    [Algebra R ℤ_[p]] (F : Polynomial R) (a z : ℤ_[p])
    (ha : ‖Polynomial.aeval a F‖ < ‖Polynomial.aeval a F.derivative‖ ^ 2)
    (hz : Polynomial.aeval z F = 0)
    (hza : ‖z - a‖ < ‖Polynomial.aeval a F.derivative‖)
    (b : ℤ_[p]) (hb : ‖b - a‖ < ‖Polynomial.aeval a F.derivative‖) :
    ‖Polynomial.aeval b F.derivative‖ = ‖Polynomial.aeval a F.derivative‖ ∧
      ‖z - b‖ = ‖Polynomial.aeval b F‖ / ‖Polynomial.aeval a F.derivative‖ := by
  sorry

/-- Multiplication by an arbitrary element has the minimal polynomial repeated
according to the degree of the ambient number field over the generated field. -/
theorem charpoly_leftMul_arbitrary {K : Type*} [Field K] [NumberField K]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℚ K) (x : K) :
    (Algebra.leftMulMatrix b x).charpoly =
      minpoly ℚ x ^ (Module.finrank ℚ K / (minpoly ℚ x).natDegree) := by
  sorry

/-- A change of rational basis preserves the multiplication characteristic polynomial. -/
theorem charpoly_leftMul_basis_independent {K : Type*} [Field K] [NumberField K]
    {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]
    (b : Module.Basis ι ℚ K) (b' : Module.Basis κ ℚ K) (x : K) :
    (Algebra.leftMulMatrix b x).charpoly = (Algebra.leftMulMatrix b' x).charpoly := by
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

/-- Positive definiteness makes every closed rational affine ellipsoid contain
only finitely many integral vectors, including its boundary. -/
theorem finite_ellipsoid {n : ℕ} (G : Matrix (Fin n) (Fin n) ℚ)
    (hG : G.PosDef) (t : Fin n → ℚ) (R : ℚ) :
    {x : Fin n → ℤ | dotProduct (fun i => (x i : ℚ) - t i)
      (G.mulVec (fun i => (x i : ℚ) - t i)) ≤ R}.Finite := by
  sorry

/-- The finite set of integral vectors in the closed affine ellipsoid;
the value is empty when the matrix is not positive definite. -/
def fpEnumeration {n : ℕ} (G : Matrix (Fin n) (Fin n) ℚ)
    (t : Fin n → ℚ) (R : ℚ) : Finset (Fin n → ℤ) := by
  classical
  exact if hG : G.PosDef then (finite_ellipsoid G hG t R).toFinset else ∅

/-- Ellipsoid membership is the exact closed quadratic inequality. -/
theorem mem_fpEnumeration {n : ℕ} (G : Matrix (Fin n) (Fin n) ℚ)
    (hG : G.PosDef) (t : Fin n → ℚ) (R : ℚ) (x : Fin n → ℤ) :
    x ∈ fpEnumeration G t R ↔ dotProduct (fun i => (x i : ℚ) - t i)
      (G.mulVec (fun i => (x i : ℚ) - t i)) ≤ R := by
  sorry

/-- Increasing the squared radius preserves all enumerated lattice vectors. -/
theorem fpEnumeration_mono {n : ℕ} (G : Matrix (Fin n) (Fin n) ℚ)
    (t : Fin n → ℚ) {R S : ℚ} (hRS : R ≤ S) :
    fpEnumeration G t R ⊆ fpEnumeration G t S := by
  sorry

/-- A negative squared radius gives no lattice vectors. -/
theorem fpEnumeration_of_neg {n : ℕ} (G : Matrix (Fin n) (Fin n) ℚ)
    (t : Fin n → ℚ) {R : ℚ} (hR : R < 0) : fpEnumeration G t R = ∅ := by
  sorry

/-- A centred ellipsoid contains a vector exactly when it contains its negative. -/
theorem fpEnumeration_neg {n : ℕ} (G : Matrix (Fin n) (Fin n) ℚ)
    (R : ℚ) (x : Fin n → ℤ) : x ∈ fpEnumeration G 0 R ↔ -x ∈ fpEnumeration G 0 R := by
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

/- S-unit finite enumeration is an equivalence proved after the bound. The
bounded-box hypothesis is about all solutions and is supplied by DT.4 plus
ED.1/ED.2 reductions, never by a proposed answer list. -/
namespace ED2

/-- Componentwise rational bounds on an integral exponent vector. -/
def InExponentBox {q : ℕ} (X : Fin q → ℚ) (a : Fin q → ℤ) : Prop :=
  ∀ i, |(a i : ℚ)| ≤ X i

/-- Decreasing exponent boxes with an exact reduction implication and a finite
exceptional set at each step. -/
structure ExponentReductionChain {q : ℕ} (S : Set (Fin q → ℤ)) (k : ℕ) where
  bounds : Fin (k + 1) → Fin q → ℚ
  nonneg : ∀ j i, 0 ≤ bounds j i
  antitone : ∀ i, Antitone (fun j => bounds j i)
  exceptions : Fin k → Finset (Fin q → ℤ)
  step : ∀ j : Fin k, ∀ a ∈ S, InExponentBox (bounds j.castSucc) a →
    InExponentBox (bounds j.succ) a ∨ a ∈ exceptions j

/-- The last componentwise exponent bound of the reduction chain. -/
def ExponentReductionChain.final {q k : ℕ} {S : Set (Fin q → ℤ)}
    (c : ExponentReductionChain S k) : Fin q → ℚ := c.bounds (Fin.last k)

/-- Every initial-box solution reaches the final box or a recorded exception. -/
theorem ExponentReductionChain.sound {q k : ℕ} {S : Set (Fin q → ℤ)}
    (c : ExponentReductionChain S k) (a : Fin q → ℤ)
    (ha : a ∈ S) (hbox : InExponentBox (c.bounds 0) a) :
    InExponentBox c.final a ∨ ∃ j, a ∈ c.exceptions j := by
  sorry

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

/-- A positive lower bound for the actual height Gram determinant certifies
independence modulo torsion of the supplied elliptic points. -/
theorem independent_of_gram_det_pos {r : ℕ} (P : Fin r → W.Point)
    (δ : ℝ) (hδ : 0 < δ)
    (hdet : δ ≤ Matrix.det (fun i j => WeierstrassCurve.Affine.neronTatePairing W
      (P i) (P j))) (a : Fin r → ℤ)
    (ha : IsOfFinAddOrder (∑ i, a i • P i)) : a = 0 := by
  sorry

/-- Finite free-coordinate boxes retain every torsion fibre of a supplied
Mordell–Weil decomposition. -/
def heightCoordinatePoints {A T : Type*} [AddCommGroup A] [AddCommGroup T]
    [Fintype T] {r : ℕ} (e : A ≃+ ((Fin r → ℤ) × T)) (D : ℕ) : Finset A := by
  classical
  exact ((Finset.Icc (fun _ : Fin r => -(D : ℤ)) (fun _ => (D : ℤ))).product
    Finset.univ).image e.symm

/-- Membership restricts exactly the free coordinates, with no torsion restriction. -/
theorem mem_heightCoordinatePoints {A T : Type*} [AddCommGroup A] [AddCommGroup T]
    [Fintype T] {r : ℕ} (e : A ≃+ ((Fin r → ℤ) × T)) (D : ℕ) (P : A) :
    P ∈ heightCoordinatePoints e D ↔ ∀ i, |(e P).1 i| ≤ (D : ℤ) := by
  sorry

/-- A coercive height bound makes the coordinate box exhaustive below B. -/
theorem heightCoordinatePoints_complete {A T : Type*} [AddCommGroup A]
    [AddCommGroup T] [Fintype T] {r : ℕ} (e : A ≃+ ((Fin r → ℤ) × T))
    (height : A → ℝ) (lam B : ℝ) (hlam : 0 < lam)
    (hlower : ∀ P, lam * ∑ i, ((e P).1 i : ℝ) ^ 2 ≤ height P)
    (D : ℕ) (hD : B < lam * (D + 1 : ℝ) ^ 2) (P : A) (hP : height P ≤ B) :
    P ∈ heightCoordinatePoints e D := by
  sorry

/-- A subgroup is p-saturated when division by p introduces no new ambient point. -/
def IsPSaturated {A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) : Prop :=
  ∀ a : A, p • a ∈ G → a ∈ G

/-- Saturation requires both all ambient p-torsion and equality of the p-divisible
elements of the subgroup with the p-multiples of its elements. -/
theorem isPSaturated_iff {A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) :
    IsPSaturated G p ↔ (∀ a : A, p • a = 0 → a ∈ G) ∧
      (∀ a ∈ G, (∃ b : A, p • b = a) ↔ ∃ b ∈ G, p • b = a) := by
  sorry

/-- At finite index, p-saturation is exactly the absence of p in the index. -/
theorem isPSaturated_iff_not_dvd_index {A : Type*} [AddCommGroup A]
    (G : AddSubgroup A) [G.FiniteIndex] (p : ℕ) (hp : p.Prime) :
    IsPSaturated G p ↔ ¬ p ∣ G.index := by
  sorry

/-- The full group is p-saturated for every p. -/
theorem isPSaturated_top {A : Type*} [AddCommGroup A] (p : ℕ) :
    IsPSaturated (⊤ : AddSubgroup A) p := by
  sorry

/-- Saturation at every prime up to an index bound certifies the full group. -/
theorem index_eq_one_of_forall_isPSaturated {A : Type*} [AddCommGroup A]
    (G : AddSubgroup A) [G.FiniteIndex] (N : ℕ) (hN : G.index ≤ N)
    (hsat : ∀ p : ℕ, p.Prime → p ≤ N → IsPSaturated G p) : G = ⊤ := by
  sorry

end ED3

/-! ## Layer 4: Finite-index extension and residue-disc bounds -/
namespace ED4

/-- A homomorphism from a finite-index subgroup to a characteristic-zero vector
space has a unique extension to the whole additive group. -/
theorem formalLogExtension_unique {A K V : Type*} [AddCommGroup A]
    [Field K] [CharZero K] [AddCommGroup V] [Module K V]
    (U : AddSubgroup A) [U.FiniteIndex] (l : U →+ V) :
    ∃! L : A →+ V, ∀ u : U, L u = l u := by
  sorry

/-- A finite-index extension preserves a torsion-kernel characterization. -/
theorem ker_formalLogExtension {A K V : Type*} [AddCommGroup A]
    [Field K] [CharZero K] [AddCommGroup V] [Module K V]
    (U : AddSubgroup A) [U.FiniteIndex] (l : U →+ V) (L : A →+ V)
    (hres : ∀ u : U, L u = l u)
    (hker : ∀ u : U, l u = 0 ↔ IsOfFinAddOrder u) (a : A) :
    L a = 0 ↔ IsOfFinAddOrder a := by
  sorry

/-- Restricted-map compatibility extends from a finite-index subgroup to the
whole additive group. -/
theorem formalLogExtension_map {A B K V W : Type*} [AddCommGroup A]
    [AddCommGroup B] [Field K] [CharZero K] [AddCommGroup V] [Module K V]
    [AddCommGroup W] [Module K W] (U : AddSubgroup A) [U.FiniteIndex]
    (L : A →+ V) (L' : B →+ W) (f : A →+ B) (df : V →ₗ[K] W)
    (hcompat : ∀ a ∈ U, df (L a) = L' (f a)) :
    ∀ a, df (L a) = L' (f a) := by
  sorry

/-- The abstract integration pairing evaluates a linear functional on the
finite-index extension supplied as L. -/
def formalLogPairing {A K V : Type*} [AddCommGroup A] [Field K]
    [AddCommGroup V] [Module K V] (L : A →+ V) (a : A) (ω : Module.Dual K V) : K :=
  ω (L a)

/-- Vanishing against every functional detects precisely the supplied torsion kernel. -/
theorem formalLogPairing_eq_zero_iff {A K V : Type*} [AddCommGroup A]
    [Field K] [AddCommGroup V] [Module K V] (L : A →+ V)
    (hker : ∀ a, L a = 0 ↔ IsOfFinAddOrder a) (a : A) :
    (∀ ω : Module.Dual K V, formalLogPairing L a ω = 0) ↔ IsOfFinAddOrder a := by
  sorry

/-- Spanning of the extension image makes the right kernel of the pairing zero. -/
theorem formalLogPairing_rightKernel {A K V : Type*} [AddCommGroup A]
    [Field K] [AddCommGroup V] [Module K V] (L : A →+ V)
    (hspan : Submodule.span K (Set.range L) = ⊤) (ω : Module.Dual K V) :
    (∀ a, formalLogPairing L a ω = 0) ↔ ω = 0 := by
  sorry

/-- In a differential basis, annihilating the logarithm columns is the kernel
of the transpose matrix. -/
theorem annihilatingDifferentials_eq_ker {p g r : ℕ} [Fact p.Prime]
    (M : Matrix (Fin g) (Fin r) ℚ_[p]) (c : Fin g → ℚ_[p]) :
    (∀ v ∈ Submodule.span ℚ_[p] (Set.range (fun j => fun i => M i j)),
      dotProduct c v = 0) ↔ c ∈ LinearMap.ker M.transpose.mulVecLin := by
  sorry

/-- The coordinate annihilator has codimension equal to the logarithm matrix rank. -/
theorem finrank_annihilatingDifferentials {p g r : ℕ} [Fact p.Prime]
    (M : Matrix (Fin g) (Fin r) ℚ_[p]) :
    Module.finrank ℚ_[p] (LinearMap.ker M.transpose.mulVecLin) = g - M.rank := by
  sorry

/-- A convergent residue-disc series with no later coefficient as large as
its N-th scaled coefficient has at most N zeros on the whole closed disc. -/
theorem dominant_of_residue_bounds {p : ℕ} [Fact p.Prime]
    (f : PowerSeries ℚ_[p]) (N : ℕ) (hne : f.coeff N ≠ 0)
    (hconv : Filter.Tendsto (fun i : ℕ => f.coeff i * (p : ℚ_[p]) ^ i)
      Filter.atTop (nhds 0))
    (htail : ∀ i : ℕ, N < i →
      ‖f.coeff i * (p : ℚ_[p]) ^ i‖ < ‖f.coeff N * (p : ℚ_[p]) ^ N‖) :
    {t : ℚ_[p] | ‖t‖ ≤ (p : ℝ)⁻¹ ∧
      HasSum (fun i : ℕ => f.coeff i * t ^ i) 0}.Finite ∧
    {t : ℚ_[p] | ‖t‖ ≤ (p : ℝ)⁻¹ ∧
      HasSum (fun i : ℕ => f.coeff i * t ^ i) 0}.ncard ≤ N := by
  sorry

end ED4

/- Layer 4 consumes AnabelianGeometryAndNonabelianChabauty §5.8's global abelian
logarithm on A(K) and all A(C_p), its formal restriction, torsion kernel, morphism
and base-change laws, integration pairing and regular Coleman/abelian equality.
Its formal groups, identity charts and logarithms are supplied by
HeightsRationalPointsAndObstructions §§1.15a–1.16.
README §§4.2 and 4.6 compare the effective coordinate presentations with these
supplied constructions and specify their numerical applications.
Layer 3 applies its §1.17 local doubling count through the pinned descent kernel.
Layer 4 consumes RestrictedPowerSeries §2.4 for Strassmann's theorem.
The residue-disc application and its finite coefficient certificates are specified
in README §4.11. -/

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

/-- Surviving quotient classes satisfy every selected local quotient condition. -/
def admissibleClasses (S : Finset ι) (L : AddSubgroup G) [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) : Finset (G ⧸ L) := by
  classical
  exact Finset.univ.filter fun a => ∀ i ∈ S,
    QuotientAddGroup.map L (L.map (r i)) (r i) (L.le_comap_map (r i)) a ∈
      (X i).image (QuotientAddGroup.mk' (L.map (r i)))

/-- The finite filter represents precisely the conjunction of local quotient tests. -/
theorem Sieve.admissibleClasses_eq_filter (S : Finset ι) (L : AddSubgroup G)
    [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) :
    (admissibleClasses S L r X : Set (G ⧸ L)) =
      {a | ∀ i ∈ S, QuotientAddGroup.map L (L.map (r i)) (r i)
        (L.le_comap_map (r i)) a ∈
          (QuotientAddGroup.mk' (L.map (r i))) '' (X i : Set (A i))} := by
  sorry

/-- A quotient class survives exactly when its image meets each allowed local set. -/
theorem Sieve.mem_admissibleClasses (S : Finset ι) (L : AddSubgroup G)
    [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (a : G ⧸ L) :
    a ∈ admissibleClasses S L r X ↔ ∀ i ∈ S,
      QuotientAddGroup.map L (L.map (r i)) (r i) (L.le_comap_map (r i)) a ∈
        (QuotientAddGroup.mk' (L.map (r i))) '' (X i : Set (A i)) := by
  sorry

/-- Equal selected local sets give equal survivor sets. -/
theorem Sieve.admissibleClasses_congr (S : Finset ι) (L : AddSubgroup G)
    [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i) (X Y : ∀ i, Finset (A i))
    (hXY : ∀ i ∈ S, X i = Y i) :
    admissibleClasses S L r X = admissibleClasses S L r Y := by
  sorry

/-- With no local tests the whole finite quotient survives. -/
theorem Sieve.admissibleClasses_empty (L : AddSubgroup G) [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) :
    admissibleClasses ∅ L r X = Finset.univ := by
  sorry

/-- Adding local tests can only remove surviving quotient classes. -/
theorem Sieve.admissibleClasses_antitone (S T : Finset ι) (hST : S ⊆ T)
    (L : AddSubgroup G) [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i)
    (X : ∀ i, Finset (A i)) :
    admissibleClasses T L r X ⊆ admissibleClasses S L r X := by
  sorry

/-- Enlarging each allowed local set preserves every survivor. -/
theorem Sieve.admissibleClasses_mono (S : Finset ι) (L : AddSubgroup G)
    [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i) (X Y : ∀ i, Finset (A i))
    (hXY : ∀ i ∈ S, X i ⊆ Y i) :
    admissibleClasses S L r X ⊆ admissibleClasses S L r Y := by
  sorry

/-- At the full subgroup the unique class survives if every selected local
set meets the actual homomorphism image. -/
theorem Sieve.admissibleClasses_top (S : Finset ι) [Fintype (G ⧸ (⊤ : AddSubgroup G))]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i))
    (hmeet : ∀ i ∈ S, ∃ g : G, r i g ∈ X i) :
    admissibleClasses S ⊤ r X = {0} := by
  sorry

/-- Admissibility is independent of representatives and uses precisely the
local congruences modulo the images of L. -/
theorem Sieve.mk_mem_admissibleClasses (S : Finset ι) (L : AddSubgroup G)
    [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (g : G) :
    QuotientAddGroup.mk' L g ∈ admissibleClasses S L r X ↔
      ∀ i ∈ S, ∃ x ∈ X i, r i g - x ∈ L.map (r i) := by
  sorry

/-- Finite coset lifting enumerates all kernel translates before the fine
local conditions are imposed. -/
def refineClasses (S : Finset ι) (K L : AddSubgroup G) (hKL : K ≤ L)
    [Fintype (G ⧸ K)] [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i))
    (σ : G ⧸ L → G ⧸ K) (B : Finset (G ⧸ L)) : Finset (G ⧸ K) := by
  classical
  let π := QuotientAddGroup.map K L (AddMonoidHom.id G) (by intro x hx; exact hKL hx)
  exact (B.biUnion fun a => (Finset.univ.filter fun z => π z = 0).image
    (fun z => σ a + z)).filter fun b => b ∈ admissibleClasses S K r X

/-- Correct lifts on the input set recover exactly the admissible fine
classes lying above that set. -/
theorem Sieve.mem_refineClasses (S : Finset ι) (K L : AddSubgroup G) (hKL : K ≤ L)
    [Fintype (G ⧸ K)] [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i))
    (σ : G ⧸ L → G ⧸ K) (B : Finset (G ⧸ L))
    (hσ : ∀ a ∈ B, QuotientAddGroup.map K L (AddMonoidHom.id G)
      (by intro x hx; exact hKL hx) (σ a) = a) (b : G ⧸ K) :
    b ∈ refineClasses S K L hKL r X σ B ↔
      QuotientAddGroup.map K L (AddMonoidHom.id G) (by intro x hx; exact hKL hx) b ∈ B ∧
      b ∈ admissibleClasses S K r X := by
  sorry

/-- The lifting construction is the union of all proposed kernel translates
intersected with the fine admissible set. -/
theorem Sieve.refineClasses_eq_biUnion (S : Finset ι) (K L : AddSubgroup G)
    (hKL : K ≤ L) [Fintype (G ⧸ K)] [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i))
    (σ : G ⧸ L → G ⧸ K) (B : Finset (G ⧸ L)) :
    (refineClasses S K L hKL r X σ B : Set (G ⧸ K)) =
      {b | (∃ a ∈ B, ∃ z : G ⧸ K,
        QuotientAddGroup.map K L (AddMonoidHom.id G) (by intro x hx; exact hKL hx) z = 0 ∧
        b = σ a + z) ∧ b ∈ admissibleClasses S K r X} := by
  sorry

/-- Empty coarse input gives no lifted classes, even without a section equation. -/
theorem Sieve.refineClasses_empty (S : Finset ι) (K L : AddSubgroup G) (hKL : K ≤ L)
    [Fintype (G ⧸ K)] [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (σ : G ⧸ L → G ⧸ K) :
    refineClasses S K L hKL r X σ ∅ = ∅ := by
  sorry

/-- Two sections correct on the same coarse input yield the same lifted set. -/
theorem Sieve.refineClasses_section_independent (S : Finset ι)
    (K L : AddSubgroup G) (hKL : K ≤ L) [Fintype (G ⧸ K)] [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i))
    (σ τ : G ⧸ L → G ⧸ K) (B : Finset (G ⧸ L))
    (hσ : ∀ a ∈ B, QuotientAddGroup.map K L (AddMonoidHom.id G)
      (by intro x hx; exact hKL hx) (σ a) = a)
    (hτ : ∀ a ∈ B, QuotientAddGroup.map K L (AddMonoidHom.id G)
      (by intro x hx; exact hKL hx) (τ a) = a) :
    refineClasses S K L hKL r X σ B = refineClasses S K L hKL r X τ B := by
  sorry

/-- The number of lifted survivors is at most the coarse count times the
kernel cardinality, without any correctness assumption on the lifts. -/
theorem Sieve.card_refineClasses_le (S : Finset ι) (K L : AddSubgroup G) (hKL : K ≤ L)
    [Fintype (G ⧸ K)] [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i))
    (σ : G ⧸ L → G ⧸ K) (B : Finset (G ⧸ L)) :
    (refineClasses S K L hKL r X σ B).card ≤ B.card * Nat.card
      (QuotientAddGroup.map K L (AddMonoidHom.id G)
        (by intro x hx; exact hKL hx)).ker := by
  sorry

/-- A local test is unchanged by refinement when its image subgroup is unchanged. -/
theorem Sieve.unchanged_local_condition (K L : AddSubgroup G) (hKL : K ≤ L)
    [Fintype (G ⧸ K)] [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i)
    (X : ∀ i, Finset (A i)) (i : ι) (himage : K.map (r i) = L.map (r i))
    (b : G ⧸ K) : b ∈ admissibleClasses {i} K r X ↔
      QuotientAddGroup.map K L (AddMonoidHom.id G) (by intro x hx; exact hKL hx) b ∈
        admissibleClasses {i} L r X := by
  sorry

/-- Intersecting with the inverse image of the target subgroup image keeps
the target subgroup. -/
theorem Sieve.target_le_preparedStep {B : Type*} [AddCommGroup B]
    (D L : AddSubgroup G) (hDL : D ≤ L) (r : G →+ B) :
    D ≤ L ⊓ (D.map r).comap r := by
  sorry

/-- A local image larger than the target image gives a strict prepared step. -/
theorem Sieve.preparedStep_lt {B : Type*} [AddCommGroup B]
    (D L : AddSubgroup G) (r : G →+ B) (himage : ¬ L.map r ≤ D.map r) :
    L ⊓ (D.map r).comap r < L := by
  sorry

/-- Lifting all coarse survivors and imposing the fine tests gives the
same finite set as direct fine admissibility. -/
theorem Sieve.refineClasses_eq_admissibleClasses (S : Finset ι)
    (K L : AddSubgroup G) (hKL : K ≤ L) [Fintype (G ⧸ K)] [Fintype (G ⧸ L)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (σ : G ⧸ L → G ⧸ K)
    (hσ : ∀ a ∈ admissibleClasses S L r X,
      QuotientAddGroup.map K L (AddMonoidHom.id G) (by intro x hx; exact hKL hx) (σ a) = a) :
    refineClasses S K L hKL r X σ (admissibleClasses S L r X) =
      admissibleClasses S K r X := by
  sorry

/-- An index coprime to an annihilator of the quotient makes the subgroup
surject onto that quotient. -/
theorem Sieve.quotient_surjective_of_coprime (H L : AddSubgroup G) (N : ℕ)
    (hNL : ∀ g : G, N • g ∈ L) (hcop : Nat.Coprime H.index N) :
    Function.Surjective (fun h : H => QuotientAddGroup.mk' L (h : G)) := by
  sorry

/-- Necessary local conditions and injective quotient fibres turn coverage
by known points into a complete list. -/
theorem Sieve.complete_of_unique_fibres {P : Type*} (S : Finset ι)
    (L : AddSubgroup G) [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i)
    (X : ∀ i, Finset (A i)) (j : P → G) (W : Finset P)
    (hlocal : ∀ p i, i ∈ S → r i (j p) ∈ X i)
    (hcover : ∀ a ∈ admissibleClasses S L r X,
      ∃ w ∈ W, QuotientAddGroup.mk' L (j w) = a)
    (hinj : Function.Injective (fun p => QuotientAddGroup.mk' L (j p))) :
    ∀ p : P, p ∈ W := by
  sorry

/-- When L lies in every selected kernel, quotient tests are the exact
unquotiented local conditions on each representative. -/
theorem Sieve.mk_mem_admissibleClasses_iff_of_le_ker (S : Finset ι)
    (L : AddSubgroup G) [Fintype (G ⧸ L)] (r : ∀ i, G →+ A i)
    (X : ∀ i, Finset (A i)) (hL : ∀ i ∈ S, L ≤ (r i).ker) (g : G) :
    QuotientAddGroup.mk' L g ∈ admissibleClasses S L r X ↔
      ∀ i ∈ S, r i g ∈ X i := by
  sorry

/-- Local image classes consist of the cosets meeting the supplied local point image. -/
def Sieve.padicImageClasses {B : Type*} [AddCommGroup B] (incl : G →+ B)
    (U : AddSubgroup B) [Fintype (G ⧸ U.comap incl)] (Y : Set B) :
    Finset (G ⧸ U.comap incl) := by
  classical
  exact Finset.univ.filter fun c => ∃ g : G, QuotientAddGroup.mk' (U.comap incl) g = c ∧
    ∃ y ∈ Y, incl g - y ∈ U

/-- Membership means that a representative coset meets the local point image. -/
theorem Sieve.mem_padicImageClasses {B : Type*} [AddCommGroup B] (incl : G →+ B)
    (U : AddSubgroup B) [Fintype (G ⧸ U.comap incl)] (Y : Set B)
    (c : G ⧸ U.comap incl) : c ∈ Sieve.padicImageClasses incl U Y ↔
      ∃ g : G, QuotientAddGroup.mk' (U.comap incl) g = c ∧ ∃ y ∈ Y, incl g - y ∈ U := by
  sorry

/-- Enlarging the local point image preserves all its surviving cosets. -/
theorem Sieve.padicImageClasses_mono {B : Type*} [AddCommGroup B] (incl : G →+ B)
    (U : AddSubgroup B) [Fintype (G ⧸ U.comap incl)] (Y Y' : Set B) (hY : Y ⊆ Y') :
    Sieve.padicImageClasses incl U Y ⊆ Sieve.padicImageClasses incl U Y' := by
  sorry

/-- Every global element belonging to the local point image survives its coset test. -/
theorem Sieve.mk_mem_padicImageClasses {B : Type*} [AddCommGroup B]
    (incl : G →+ B) (U : AddSubgroup B) [Fintype (G ⧸ U.comap incl)]
    (Y : Set B) (g : G) (hg : incl g ∈ Y) :
    QuotientAddGroup.mk' (U.comap incl) g ∈ Sieve.padicImageClasses incl U Y := by
  sorry

/-- A finer local coset meeting the point image projects to a coarser coset
meeting the same image. -/
theorem Sieve.padicImageClasses_refine {B : Type*} [AddCommGroup B]
    (incl : G →+ B) (U' U : AddSubgroup B) (hU : U' ≤ U)
    [Fintype (G ⧸ U'.comap incl)] [Fintype (G ⧸ U.comap incl)] (Y : Set B)
    (c : G ⧸ U'.comap incl) (hc : c ∈ Sieve.padicImageClasses incl U' Y) :
    QuotientAddGroup.map (U'.comap incl) (U.comap incl) (AddMonoidHom.id G)
      (by intro g hg; exact hU hg) c ∈ Sieve.padicImageClasses incl U Y := by
  sorry

/-- The iterated finite sieve starts at the direct coarse filter and lifts
through every successive subgroup using the selected tests. -/
def Sieve.siftChain (S : Finset ι) (L : ℕ → AddSubgroup G)
    (hL : ∀ j, L (j + 1) ≤ L j) [∀ j, Fintype (G ⧸ L j)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (T : ℕ → Finset ι)
    (σ : ∀ j, G ⧸ L j → G ⧸ L (j + 1)) : ∀ j, Finset (G ⧸ L j)
  | 0 => admissibleClasses S (L 0) r X
  | j + 1 => refineClasses (T j) (L (j + 1)) (L j) (hL j) r X (σ j)
      (Sieve.siftChain S L hL r X T σ j)

/-- The initial sieve is precisely the direct admissible-class set. -/
theorem Sieve.siftChain_zero (S : Finset ι) (L : ℕ → AddSubgroup G)
    (hL : ∀ j, L (j + 1) ≤ L j) [∀ j, Fintype (G ⧸ L j)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (T : ℕ → Finset ι)
    (σ : ∀ j, G ⧸ L j → G ⧸ L (j + 1)) :
    Sieve.siftChain S L hL r X T σ 0 = admissibleClasses S (L 0) r X := by
  rfl

/-- The successor sieve is the finite lift and filter of its predecessor. -/
theorem Sieve.siftChain_succ (S : Finset ι) (L : ℕ → AddSubgroup G)
    (hL : ∀ j, L (j + 1) ≤ L j) [∀ j, Fintype (G ⧸ L j)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (T : ℕ → Finset ι)
    (σ : ∀ j, G ⧸ L j → G ⧸ L (j + 1)) (j : ℕ) :
    Sieve.siftChain S L hL r X T σ (j + 1) =
      refineClasses (T j) (L (j + 1)) (L j) (hL j) r X (σ j)
        (Sieve.siftChain S L hL r X T σ j) := by
  rfl

/-- Each lifting level has at most the previous count times its quotient kernel size. -/
theorem Sieve.card_siftChain_succ_le (S : Finset ι) (L : ℕ → AddSubgroup G)
    (hL : ∀ j, L (j + 1) ≤ L j) [∀ j, Fintype (G ⧸ L j)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (T : ℕ → Finset ι)
    (σ : ∀ j, G ⧸ L j → G ⧸ L (j + 1)) (j : ℕ) :
    (Sieve.siftChain S L hL r X T σ (j + 1)).card ≤
      (Sieve.siftChain S L hL r X T σ j).card * Nat.card
        (QuotientAddGroup.map (L (j + 1)) (L j) (AddMonoidHom.id G)
          (by intro g hg; exact hL j hg)).ker := by
  sorry

/-- Correct sections and retention of all changed local tests make every
iterated sieve equal the direct filter at that level. -/
theorem Sieve.siftChain_eq_admissibleClasses (S : Finset ι) (L : ℕ → AddSubgroup G)
    (hL : ∀ j, L (j + 1) ≤ L j) [∀ j, Fintype (G ⧸ L j)]
    (r : ∀ i, G →+ A i) (X : ∀ i, Finset (A i)) (T : ℕ → Finset ι)
    (σ : ∀ j, G ⧸ L j → G ⧸ L (j + 1))
    (hσ : ∀ j, ∀ a ∈ admissibleClasses S (L j) r X,
      QuotientAddGroup.map (L (j + 1)) (L j) (AddMonoidHom.id G)
        (by intro g hg; exact hL j hg) (σ j a) = a)
    (hT : ∀ j, T j ⊆ S)
    (hunchanged : ∀ j i, i ∈ S → i ∉ T j → (L (j + 1)).map (r i) = (L j).map (r i))
    (j : ℕ) : Sieve.siftChain S L hL r X T σ j = admissibleClasses S (L j) r X := by
  sorry

/-- A prime factor added beyond its exponent valuation does not change the
multiple subgroup of a finite-exponent additive group. -/
theorem Sieve.range_nsmul_mul_eq_of_padicValNat_le {B : Type*} [AddCommGroup B]
    (e : ℕ) (he : 0 < e) (hexp : ∀ b : B, e • b = 0) (q M : ℕ) (hq : q.Prime)
    (hv : padicValNat q e ≤ padicValNat q M) :
    (nsmulAddMonoidHom (q * M) : B →+ B).range = (nsmulAddMonoidHom M : B →+ B).range := by
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

/-- Membership in the list is equivalent to the equation when its hypotheses hold. -/
theorem FiniteSolutionSet.mem_iff {α : Type*} {H : Prop} {P : α → Prop}
    (c : FiniteSolutionSet H P) (hH : H) (x : α) : x ∈ c.solutions ↔ P x := by
  sorry

/-- Complete data for the same equation agree after both labels are discharged. -/
theorem FiniteSolutionSet.solutions_eq {α : Type*} {H₁ H₂ : Prop} {P : α → Prop}
    (c₁ : FiniteSolutionSet H₁ P) (c₂ : FiniteSolutionSet H₂ P)
    (h₁ : H₁) (h₂ : H₂) : c₁.solutions = c₂.solutions := by
  sorry

/-- A false predicate forces an empty sound list under any completeness label. -/
example (H : Prop) (c : FiniteSolutionSet H (fun _ : ℤ => False)) :
    c.solutions = ∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro x hx
  exact c.sound x hx

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

/-- The unipotent gauge matrix in the ordered blocks (scalar, cohomology, scalar). -/
def gaugeMatrix {n : ℕ} {R : Type*} [CommRing R]
    (Ω : Fin n → R) (g : R) (Z : Matrix (Fin n) (Fin n) R) :
    Matrix (Unit ⊕ (Fin n ⊕ Unit)) (Unit ⊕ (Fin n ⊕ Unit)) R :=
  fun i j => match i, j with
    | .inl _, .inl _ => 1
    | .inr (.inl i), .inl _ => Ω i
    | .inr (.inl i), .inr (.inl j) => if i = j then 1 else 0
    | .inr (.inr _), .inl _ => g
    | .inr (.inr _), .inr (.inl j) => ∑ i, Ω i * Z i j
    | .inr (.inr _), .inr (.inr _) => 1
    | _, _ => 0

/-- The connection matrix with the negative sign convention for the regular forms. -/
def connectionMatrix {n : ℕ} {R : Type*} [CommRing R]
    (ω : Fin n → R) (η : R) (Z : Matrix (Fin n) (Fin n) R) :
    Matrix (Unit ⊕ (Fin n ⊕ Unit)) (Unit ⊕ (Fin n ⊕ Unit)) R :=
  fun i j => match i, j with
    | .inr (.inl i), .inl _ => -ω i
    | .inr (.inr _), .inl _ => -η
    | .inr (.inr _), .inr (.inl j) => -(∑ i, ω i * Z i j)
    | _, _ => 0

/-- An alternating Tate matrix gives the stated inverse over any commutative ring,
including characteristic two when the zero diagonal is imposed. -/
theorem gaugeMatrix_inv {n : ℕ} {R : Type*} [CommRing R]
    (Ω : Fin n → R) (g : R) (Z : Matrix (Fin n) (Fin n) R)
    (hZ : Z.transpose = -Z) (hdiag : ∀ i, Z i i = 0) :
    (gaugeMatrix Ω g Z)⁻¹ = gaugeMatrix (-Ω) (-g) Z := by
  sorry

/-- Every gauge matrix has determinant one. -/
theorem gaugeMatrix_det {n : ℕ} {R : Type*} [CommRing R]
    (Ω : Fin n → R) (g : R) (Z : Matrix (Fin n) (Fin n) R) :
    Matrix.det (gaugeMatrix Ω g Z) = 1 := by
  sorry

/-- The gauge equation is exactly the two primitive equations with the chosen signs. -/
theorem gaugeMatrix_gauge_iff {n : ℕ} {S R : Type*} [CommRing S] [CommRing R]
    [Algebra S R] (D : Derivation S R R) (Ω ω : Fin n → R) (g η : R)
    (Z : Matrix (Fin n) (Fin n) R) (hZ : Z.transpose = -Z)
    (hdiag : ∀ i, Z i i = 0) (hconst : ∀ i j, D (Z i j) = 0) :
    (gaugeMatrix Ω g Z)⁻¹ * (show Matrix (Unit ⊕ (Fin n ⊕ Unit)) (Unit ⊕ (Fin n ⊕ Unit)) R from
      fun i j => D (gaugeMatrix Ω g Z i j)) =
      connectionMatrix ω η Z ↔
    (∀ i, D (Ω i) = -ω i) ∧ D g = dotProduct Ω (Z.mulVec (fun i => D (Ω i))) - η := by
  sorry

/-- Shifting the first primitives changes the last primitive by the bilinear
cross term as well as an additive constant. -/
theorem gaugeMatrix_shift {n : ℕ} {R : Type*} [CommRing R]
    (Ω c : Fin n → R) (g e : R) (Z : Matrix (Fin n) (Fin n) R) :
    gaugeMatrix (Ω + c) (g + dotProduct c (Z.mulVec Ω) + e) Z =
      gaugeMatrix c e Z * gaugeMatrix Ω g Z := by
  sorry

/-- Every existing residue-disc root satisfies the finite truncation congruence
when the omitted terms have the required absolute precision. -/
theorem root_satisfies_truncation_congruence {p : ℕ} [Fact p.Prime]
    (f : PowerSeries ℚ_[p]) (x : ℚ_[p]) (m : ℕ) (n : ℤ)
    (hx : ‖x‖ ≤ (p : ℝ)⁻¹)
    (hroot : HasSum (fun i : ℕ => f.coeff i * x ^ i) 0)
    (htail : ∀ i : ℕ, m ≤ i → ‖f.coeff i‖ * (p : ℝ) ^ (-(i : ℤ)) ≤
      (p : ℝ) ^ (-n)) :
    ‖∑ i ∈ Finset.range m, f.coeff i * x ^ i‖ ≤ (p : ℝ) ^ (-n) := by
  sorry

/-- Baran's homogeneous quartic evaluated in a commutative ring. -/
def xs13Baran {R : Type*} [CommRing R] (x y z : R) : R :=
  (-y - z) * x ^ 3 + (2 * y ^ 2 + y * z) * x ^ 2 +
    (-y ^ 3 + y ^ 2 * z - 2 * y * z ^ 2 + z ^ 3) * x +
    2 * y ^ 2 * z ^ 2 - 3 * y * z ^ 3

/-- The monic-in-Y quartic used for the level-13 residue-disc calculations. -/
def xs13Quartic {R : Type*} [CommRing R] (x y z : R) : R :=
  y ^ 4 + 5 * x ^ 4 - 6 * x ^ 2 * y ^ 2 + 6 * x ^ 3 * z +
    26 * x ^ 2 * y * z + 10 * x * y ^ 2 * z - 10 * y ^ 3 * z -
    32 * x ^ 2 * z ^ 2 - 40 * x * y * z ^ 2 + 24 * y ^ 2 * z ^ 2 +
    32 * x * z ^ 3 - 16 * y * z ^ 3

/-- The coordinate substitution identifies the quartic equations; the seven
listed coordinates lie on the second quartic. This supplies algebraic identities. -/
theorem xs13_quartic_identity_and_points :
    (∀ x y z : ℤ,
      xs13Quartic (x - y) (x + y) (x + z) = 16 * xs13Baran x y z) ∧
    (∀ v ∈ ({(1, 1, 1), (1, 1, 2), (0, 0, 1), (-3, 3, 2),
      (1, 1, 0), (0, 2, 1), (-1, 1, 0)} : Finset (ℤ × ℤ × ℤ)),
      xs13Quartic v.1 v.2.1 v.2.2 = 0) := by
  sorry

/-- Normalized projective representatives for the special fibre at 17. -/
def xs13SpecialFibrePoints : Finset (ZMod 17 × ZMod 17 × ZMod 17) := by
  classical
  exact (Finset.univ.product (Finset.univ.product Finset.univ)).filter fun v =>
    (v.2.2 = 1 ∨ (v.2.2 = 0 ∧ v.2.1 = 1) ∨
      (v.2.2 = 0 ∧ v.2.1 = 0 ∧ v.1 = 1)) ∧ xs13Quartic v.1 v.2.1 v.2.2 = 0

/-- The quartic has exactly twenty normalized projective points over F₁₇. -/
theorem xs13_specialFibre_card : xs13SpecialFibrePoints.card = 20 := by
  sorry

/-- Every enumerated F₁₇ point has a nonzero partial derivative of the quartic. -/
theorem xs13_specialFibre_smooth (v : ZMod 17 × ZMod 17 × ZMod 17)
    (hv : v ∈ xs13SpecialFibrePoints) :
    ∃ i : Fin 3, MvPolynomial.eval ![v.1, v.2.1, v.2.2]
      (MvPolynomial.pderiv i (xs13Quartic (MvPolynomial.X (0 : Fin 3))
        (MvPolynomial.X (1 : Fin 3)) (MvPolynomial.X (2 : Fin 3)))) ≠ 0 := by
  sorry

/-- A field generated by a root of the displayed irreducible cubic has degree three. -/
theorem finrank_of_xs13_cubic {K : Type*} [Field K] [Algebra ℚ K]
    (α : K) (hgen : Algebra.adjoin ℚ ({α} : Set K) = ⊤)
    (hcubic : α ^ 3 + 2 * α ^ 2 - α - 1 = 0) : Module.finrank ℚ K = 3 := by
  sorry

/-- A line over a cubic field has rational dimension three. -/
theorem finrank_restrictScalars_three {K V : Type*} [Field K] [Algebra ℚ K]
    [FiniteDimensional ℚ K] [AddCommGroup V] [Module K V] [Module ℚ V]
    [IsScalarTower ℚ K V] [FiniteDimensional K V]
    (hK : Module.finrank ℚ K = 3) (hV : Module.finrank K V = 1) :
    Module.finrank ℚ V = 3 := by
  sorry

end ED6

/- The README specifies the following further definitions and constructions.
Layer 0: RealEnclosure, ComplexEnclosure, PadicEnclosure, ExactAlgebraicData,
RealRootIsolation, ArchimedeanEmbeddingData, PadicEmbeddingData,
ValuationData, LocalBallData, heightEnclosure, boundedHeightPoints
and boundedHeightProjectivePoints, including the normalized p-adic ball record.
Layer 1: linearFormMatrix, linearFormLattice, linearFormTarget, roundOfEnclosure,
padicLatticeMatrix, padicLatticeTarget, padicLinearForm, apprOfEnclosure,
quadraticCompletion, DistanceWitness, RealExclusionData,
PadicExclusionData, the bounded-distance comparison.
Layer 2: ThueConstants.exists_of_enclosures supplies rational bounds under sufficiently
narrow root/logarithm enclosures, nonempty representatives and invertible unit minors.
logAbsEnclosure, argEnclosure, MatveevConstantData,
YuConstantData, PadicLogEvaluationData, PadicDiscreteLogData,
WeightedExponentReductionChain, thueForm,
thueSolutions, ThueEquation, ThueFactorCovering, ThueConstants, ThueBoundParameters,
thueSmallSolutions, ThueData, thueMahlerSolutions,
ThueMahlerEquation, ThueMahlerCovering, ThueMahlerData,
sUnitSolutions, SUnitData and
sUnitExponentHeight, including their finite-set descriptions.
Layer 3: ellipticLocalImage, LocalImageData, TwoSelmerData,
quarticLocallySoluble, twoIsogenyIntegralQuartic, cremonaMu, canonicalHeightEnclosure, pairingEnclosure,
saturation, TorsionData, FiniteIndexSubgroupData
and MordellWeilBasisData.
Layer 4: GoodReductionChabautyDatum, ReductionDiscData, abelianLog,
integrationPairing, formalLogExtension, abelianIntegral,
formalLogIntegral, annihilatingDifferentials, reducedAnnihilator,
ResidueDiscVerdict, ChabautyColemanData and
SymmetricSquareChabautyDatum, together with number-field local criterion data.
Layer 5: JacobianReductionData, subgroup_triangular_generators, SieveData, with genus-two Kummer
and finite group-presentation data.
Layer 6: QCDiscData, ExplicitSetup (the third-kind span becomes the full sum-zero
residue hyperplane after tensoring with its Galois splitting field L; its Q-image
is the Galois-invariant part),
AdmissibleTateMatrix, A_Z, HodgeFiltrationData,
leftMulMatrix, rightMulMatrix, transportMatrix, Frobenius structure and splitting,
localHeight, qc_candidates_cover, qc_complete_of_matched, xs13FrobeniusLift and xs13Theta,
xs13AffineQuartic, xs13GammaFilClass,
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
The geometric names compare the coordinate presentation with
AnabelianGeometryAndNonabelianChabauty §5.8's abelianLog.add, abelianLog.derivative,
abelianLog.kernel, abelianLog.functorial, abelianLog.formal, abelianLog.baseChange,
abelianLog.cp, abelianLog.pairing and abelianLog.unique. The abstract finite-index
extension statements keep their arbitrary additive-group generality;
ED4.formalLogExtension_unique identifies their Néron-chart specialization with
the supplied logarithm, and evaluation identifies the pairings.
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
ED4.formalLogExtension_zsmul,
ED4.integrationPairing_eq_zero_iff,
ED4.integrationPairing_leftKernel,
ED4.ker_abelianLog.

§4.14:
ED4.card_rationalPoints_le_badReduction.

§4.13:
ED4.card_rationalPoints_le_coleman.

§4.6:
The regular equality specializes AnabelianGeometryAndNonabelianChabauty §5.8's
colemanAbelian.integral and colemanAbelian.basepoint to the §4.3 pairing and
ColemanIntegration realization, including abelianLog.cp evaluation.
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

§6.14:
ED6.baseChange_splitting_eq.

§6.30:
ED6.smallLevel_genus,
ED6.w49_fixedPoints_card.

§6.19:
ED6.newform_endomorphism_comparison,
ED6.xs13_endAlgebra.

§6.21:
ED6.xs13_rank_eq_three.

§6.12:
ED6.frobeniusSplitting_eq.

§6.11:
ED6.frobeniusStructure_eq.

§6.16:
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
ED6.x0plus_genusThree_rationalPoints, with a supplied regular proper semistable
Z_N model, geometrically irreducible special fibre, the actual generic-fibre
identification and normalized local-height comparison at each of the nine primes.

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

§6.23a (before §6.22):
ED6.xs13_differentialBasis, with the actual model of §6.18 and exact residue/cup data;
no Tate class is an input.

§6.23 (after §§6.23a and 6.22):
ED6.xs13_hodgeData_base_conditions,
ED6.xs13_hodgeData_conditions, for eta/beta/gamma relative to the supplied basis and Z1,Z2.

§6.18:
ED6.xs13_planeModel, with rational h_i, their supplied invertible comparison with
the normalized conjugate eigenforms, and exact weight-eight Sturm identities,

§6.29:
ED6.xs13_rationalPoints.

§6.22:
ED6.xs13_tateClasses_admissible, using ED6.xs13_differentialBasis and nonzero
self-adjoint trace-corrected Hecke classes with coefficient 2g=6.
-/
end TauCetiRoadmap.EffectiveDiophantineMethods

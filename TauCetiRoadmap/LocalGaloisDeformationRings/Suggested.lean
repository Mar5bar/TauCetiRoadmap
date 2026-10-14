import Mathlib

/-!
# LocalGaloisDeformationRings: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It keeps fixed-basis matrix
conditions, ordered characters, Frobenius data, coefficient equations and actual quotient
rings explicit. The universal deformation, period, flag-moduli and patching constructions
are specified in the README, where their full supplier contracts are available.
-/

namespace TauCetiRoadmap.LocalGaloisDeformationRings

open scoped Matrix

/-! ## Layer 1: Universal lifting rings and coefficient infrastructure -/

section Height

variable {A : Type*} [CommRing A] {n : ℕ}

/-- The fixed free lattice's Frobenius cokernel is killed by `E ^ h`.
This matrix condition is not the functor of lattices in a fixed étale module. -/
def HasHeightLE (E : A) (X : Matrix (Fin n) (Fin n) A) (h : ℕ) : Prop :=
  ∃ Y : Matrix (Fin n) (Fin n) A, X * Y = E ^ h • (1 : Matrix (Fin n) (Fin n) A)

/-- Height zero is precisely invertibility of the square Frobenius matrix. -/
theorem height_zero_iff_isUnit (E : A) (X : Matrix (Fin n) (Fin n) A) :
    HasHeightLE E X 0 ↔ IsUnit X := by
  sorry

/-- Frobenius `E` on a rank-one lattice has height at most one. -/
example (E : A) : HasHeightLE E !![E] 1 := by
  refine ⟨1, ?_⟩
  ext i j
  fin_cases i
  fin_cases j
  simp

/-- The fixed lattice with Frobenius `u` over `ℚ[[u]]` has no finite `u+3` height. -/
example (h : ℕ) :
    ¬ HasHeightLE (PowerSeries.X + 3 : PowerSeries ℚ) !![PowerSeries.X] h := by
  sorry

end Height

section RealPlace

variable {A : Type*} [CommRing A]

/-- An odd real rank-two involution in coordinates has equation `a²+bc=1`. -/
def OddInvolutionEquation (a b c : A) : Prop := a ^ 2 + b * c = 1

/-- Both involution and determinant equations, rather than their dimension count. -/
theorem odd_involution_matrix_iff (a b c : A) :
    OddInvolutionEquation a b c ↔
      (!![a, b; c, -a] : Matrix (Fin 2) (Fin 2) A) ^ 2 = 1 ∧
        Matrix.det (!![a, b; c, -a] : Matrix (Fin 2) (Fin 2) A) = -1 := by
  sorry

/-- The diagonal odd involution satisfies the integral equation. -/
example : OddInvolutionEquation (1 : ℤ) 0 0 := by
  norm_num [OddInvolutionEquation]

/-- At residue characteristic two there is also a nonidentity unipotent odd point. -/
example : OddInvolutionEquation (1 : ZMod 2) 1 0 := by
  norm_num [OddInvolutionEquation]

/-- Trace zero alone does not give an involution. -/
example : ¬ OddInvolutionEquation (0 : ℚ) 1 0 := by
  norm_num [OddInvolutionEquation]

end RealPlace

/-! ## Layer 2: Tame and minimally ramified deformation conditions -/

section Tame

variable {A : Type*} [CommRing A] {n : ℕ}

/-- The invertible fixed-basis matrix equation for arithmetic Frobenius and inertia.
Continuity and pro-p inertia are additional conditions for the profinite representation. -/
def IsTameMatrixPair (q : ℕ) (Φ σ : Matrix (Fin n) (Fin n) A) : Prop :=
  IsUnit Φ ∧ IsUnit σ ∧ Φ * σ = σ ^ q * Φ

/-- Trivial Frobenius and inertia satisfy the tame equation. -/
example (q : ℕ) : IsTameMatrixPair q (1 : Matrix (Fin n) (Fin n) A) 1 := by
  simp [IsTameMatrixPair]

/-- A nontrivial unipotent pair records the direction of the arithmetic exponent. -/
example : IsTameMatrixPair 2 (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ)
    !![1, 1; 0, 1] := by
  sorry

/-- Zero inertia is not a group element, even when the multiplication equation vanishes. -/
example : ¬ IsTameMatrixPair 2 (1 : Matrix (Fin 1) (Fin 1) ℚ) 0 := by
  simp [IsTameMatrixPair]

/-- Rank-two Steinberg Frobenius has the eigenvalue relation with arithmetic ratio `q`. -/
def SteinbergFrobRelation (q : ℕ) (Φ : Matrix (Fin 2) (Fin 2) A) : Prop :=
  (q : A) * Matrix.trace Φ ^ 2 = (1 + (q : A)) ^ 2 * Matrix.det Φ

/-- The actual diagonal Frobenius matrix satisfies the relation. -/
example (q : ℕ) (α : A) : SteinbergFrobRelation q !![α, 0; 0, (q : A) * α] := by
  simp [SteinbergFrobRelation, Matrix.trace_fin_two, Matrix.det_fin_two]
  ring

/-- Unramified scalar Frobenius need not satisfy the Steinberg condition. -/
example : ¬ SteinbergFrobRelation 2 (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  norm_num [SteinbergFrobRelation, Matrix.trace_fin_two, Matrix.det_fin_two]

/-- The nontrivial quadratic finite inertia datum extends with arithmetic Frobenius. -/
example : IsTameMatrixPair 3 (1 : Matrix (Fin 1) (Fin 1) ℚ) !![-1] ∧
    (!![-1] : Matrix (Fin 1) (Fin 1) ℚ) ^ 2 = 1 ∧
    (!![-1] : Matrix (Fin 1) (Fin 1) ℚ) ≠ 1 := by
  sorry

/-- Finite inertia image alone does not give a Weil extension: scalar Frobenius
cannot conjugate the primitive cube root two in F₇ to its square. -/
example : (!![2] : Matrix (Fin 1) (Fin 1) (ZMod 7)) ^ 3 = 1 ∧
    ¬ ∃ Φ : Matrix (Fin 1) (Fin 1) (ZMod 7), IsTameMatrixPair 2 Φ !![2] := by
  sorry

/-- For q=11 scalar Frobenius satisfies the split-chain tame data but fails
its rank-two Steinberg equation. -/
example : IsTameMatrixPair 11 (1 : Matrix (Fin 2) (Fin 2) ℚ) 1 ∧
    ¬ SteinbergFrobRelation 11 (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  constructor
  · simp [IsTameMatrixPair]
  · norm_num [SteinbergFrobRelation, Matrix.trace_fin_two, Matrix.det_fin_two]

end Tame

section ModifiedNilpotent

variable {A : Type*} [CommRing A] [Invertible (2 : A)]

/-- The integral modified exponential in the rank-four symplectic local model. -/
def modifiedExp (N : Matrix (Fin 4) (Fin 4) A) : Matrix (Fin 4) (Fin 4) A :=
  1 + N + ⅟ (2 : A) • N ^ 2 + ⅟ (2 : A) • N ^ 3

/-- Its modified logarithm on `1+W`, retaining the cubic correction through composition. -/
def modifiedLog (U : Matrix (Fin 4) (Fin 4) A) : Matrix (Fin 4) (Fin 4) A :=
  (U - 1) - ⅟ (2 : A) • (U - 1) ^ 2

/-- The inverse formulas require fourth-power nilpotence, not nilpotence of unspecified order. -/
theorem modified_exp_log_inverse (N W : Matrix (Fin 4) (Fin 4) A)
    (hN : N ^ 4 = 0) (hW : W ^ 4 = 0) :
    modifiedLog (modifiedExp N) = N ∧ modifiedExp (modifiedLog (1 + W)) = 1 + W := by
  sorry

/-- `q*` is formed over the integers before reducing in a coefficient ring. -/
def modifiedPowerCoefficient (q : ℕ) : ℤ := ((q : ℤ) - (q : ℤ) ^ 3) / 3

/-- Modified powering retains the cubic term, including in characteristic three. -/
theorem modified_exp_pow (q : ℕ) (N : Matrix (Fin 4) (Fin 4) A) (hN : N ^ 4 = 0) :
    modifiedExp N ^ q = modifiedExp
      ((q : A) • N + (modifiedPowerCoefficient q : A) • N ^ 3) := by
  sorry

/-- Zero nilpotent gives the identity group element and its logarithm is zero. -/
example : modifiedExp (0 : Matrix (Fin 4) (Fin 4) A) = 1 := by
  simp [modifiedExp]

/-- The logarithm of the identity is zero. -/
example : modifiedLog (1 : Matrix (Fin 4) (Fin 4) A) = 0 := by
  simp [modifiedLog]

/-- In characteristic three the arithmetic Frobenius exponent two has nonzero cubic correction. -/
example : (modifiedPowerCoefficient 2 : ZMod 3) = 1 := by
  decide

/-- Exponent one has no cubic correction. -/
example : modifiedPowerCoefficient 1 = 0 := by
  norm_num [modifiedPowerCoefficient]

/-- A regular nilpotent makes the characteristic-three cubic term visible on the matrix itself. -/
example (N : Matrix (Fin 4) (Fin 4) (ZMod 3)) (hN : N ^ 4 = 0) (hN3 : N ^ 3 ≠ 0) :
    (2 : ZMod 3) • N + (modifiedPowerCoefficient 2 : ZMod 3) • N ^ 3 ≠
      (2 : ZMod 3) • N := by
  sorry

/-- The square-zero corner matrix used by the rank-four logarithm controls. -/
def cornerNilpotent : Matrix (Fin 4) (Fin 4) A :=
  Matrix.of fun i j => if i = 0 ∧ j = 3 then 1 else 0

/-- Square-zero inertia retains its nonzero linear term in the modified exponential. -/
example : modifiedExp (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) =
    1 + cornerNilpotent := by
  have h2 : (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [pow_two, cornerNilpotent, Matrix.mul_apply]
  have h3 : (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) ^ 3 = 0 := by
    rw [pow_succ, h2, zero_mul]
  simp [modifiedExp, h2, h3]

/-- The modified logarithm of the square-zero unipotent is its corner matrix. -/
example : modifiedLog (1 + cornerNilpotent : Matrix (Fin 4) (Fin 4) A) =
    cornerNilpotent := by
  have h2 : (cornerNilpotent : Matrix (Fin 4) (Fin 4) A) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [pow_two, cornerNilpotent, Matrix.mul_apply]
  simp [modifiedLog, h2]

/-- The regular rank-four Jordan nilpotent retains its nonzero square and cube. -/
def regularJordan : Matrix (Fin 4) (Fin 4) ℚ :=
  Matrix.of fun i j => if i.val + 1 = j.val then 1 else 0

/-- A regular unipotent's logarithm has a nonzero quadratic correction. -/
example [Invertible (2 : ℚ)] :
    modifiedLog (1 + regularJordan) = regularJordan - (1 / 2 : ℚ) • regularJordan ^ 2 ∧
    modifiedLog (1 + regularJordan) ≠ regularJordan := by
  constructor
  · simp [modifiedLog, invOf_eq_inv]
  · intro h
    have he := congrArg (fun M : Matrix (Fin 4) (Fin 4) ℚ => M 0 2) h
    norm_num [modifiedLog, regularJordan, pow_two, Matrix.mul_apply,
      Fin.sum_univ_succ, invOf_eq_inv] at he

end ModifiedNilpotent

/-! ## Layer 3: Potentially semistable and crystalline quotient rings

The G-valued integral type quotient is reduced and flat. Complete intersection,
equidimensionality and a dense regular open are properties of its localized scheme
generic fibre. Crystalline scheme generic fibres are regular; formal smoothness refers
to completed local deformation rings with the maximal-ideal topology.
-/

section FiltrationProfile

/-- Multiplicities of jumps in a labelled filtration. This list does not specify a Hodge type:
it forgets the jump values and labels. -/
def filtrationFlagDimension (multiplicities : List ℕ) : ℕ :=
  (multiplicities.sum ^ 2 - (multiplicities.map (fun m ↦ m ^ 2)).sum) / 2

/-- Three distinct jumps give the rank-three full flag dimension. -/
example : filtrationFlagDimension [1, 1, 1] = 3 := by
  decide

/-- Repeating a jump changes the partial flag dimension. -/
example : filtrationFlagDimension [2, 1] = 2 := by
  decide

/-- A scalar filtration has no flag parameter. -/
example : filtrationFlagDimension [3] = 0 := by
  decide

end FiltrationProfile

/-! ## Layer 4: Finite-flat and Barsotti–Tate geometry

The height-one model resolution, finite-flat realization and generic-reducedness theorem
use the exact scheme and integral-Hodge contracts of the README.
-/

/-! ## Layer 5: Dyadic connected-model and endpoint geometry

The connected dyadic category and selected weight endpoints require their integral-Hodge
carriers. Their point criteria and ordinary ring isomorphisms are specified in the README.
-/

/-! ## Layer 6: Ordinary flags and component comparisons -/

section Components

/-- Two points connect when their kernels contain one common minimal prime.
This retains the component itself and does not assert transitivity at intersections. -/
def Connects {R B : Type*} [CommRing R] [CommRing B] (x y : R →+* B) : Prop :=
  ∃ P ∈ minimalPrimes R, P ≤ RingHom.ker x ∧ P ≤ RingHom.ker y

/-- The unique component through the middle point gives the transitivity used at regular points. -/
theorem connects_trans_of_unique_component {R B : Type*} [CommRing R] [CommRing B]
    {x y z : R →+* B}
    (hy : ∀ P ∈ minimalPrimes R, ∀ Q ∈ minimalPrimes R,
      P ≤ RingHom.ker y → Q ≤ RingHom.ker y → P = Q)
    (hxy : Connects x y) (hyz : Connects y z) : Connects x z := by
  sorry

/-- The identity point of a field lies on its sole component. -/
example : Connects (RingHom.id ℚ) (RingHom.id ℚ) := by
  sorry

/-- The two projections of a product of fields lie on separate components. -/
example : ¬ Connects (RingHom.fst ℚ ℚ) (RingHom.snd ℚ ℚ) := by
  sorry

/-- The affine rational node with its actual two-branch relation. -/
noncomputable def affineNodeIdeal : Ideal (MvPolynomial (Fin 2) ℚ) :=
  Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1}

/-- The coordinate ring of the affine node. -/
abbrev AffineNode := MvPolynomial (Fin 2) ℚ ⧸ affineNodeIdeal

/-- Evaluation at a rational point of the node, retaining the relation a*b=0. -/
noncomputable def affineNodePoint (a b : ℚ) (hab : a * b = 0) : AffineNode →+* ℚ :=
  Ideal.Quotient.lift affineNodeIdeal
    (MvPolynomial.eval₂Hom (RingHom.id ℚ) ![a, b]) (by
      sorry)

/-- The origin connects to a point on either branch, while the two outer points
have no common component; unconditional transitivity therefore fails. -/
example :
    Connects (affineNodePoint 1 0 (by norm_num)) (affineNodePoint 0 0 (by norm_num)) ∧
    Connects (affineNodePoint 0 0 (by norm_num)) (affineNodePoint 0 1 (by norm_num)) ∧
    ¬ Connects (affineNodePoint 1 0 (by norm_num)) (affineNodePoint 0 1 (by norm_num)) := by
  sorry

end Components

section EtaleCoefficients

variable {R : Type*} [CommRing R]

/-- The coefficient-adic completion of the ordinary Laurent-series ring.
For a split complete local Kisin coefficient factor the ideal is the maximal ideal. -/
abbrev EtaleCoeffRing (R : Type*) [CommRing R] (I : Ideal R) :=
  AdicCompletion (I.map (algebraMap R (LaurentSeries R))) (LaurentSeries R)

/-- A height factor becomes invertible in ordinary Laurent series for nilpotent coefficients. -/
theorem laurent_height_factor_isUnit_of_nilpotent (a : R) (ha : IsNilpotent a) :
    IsUnit (HahnSeries.single (1 : ℤ) (1 : R) + HahnSeries.C a : LaurentSeries R) := by
  sorry

/-- A height factor with constant coefficient in the coefficient ideal is a unit
in the completed étale carrier. The completion uses that ideal, not the series variable. -/
theorem etale_height_factor_isUnit (I : Ideal R) (hI : I.FG) (a : R) (ha : a ∈ I) :
    IsUnit (AdicCompletion.of (I.map (algebraMap R (LaurentSeries R))) (LaurentSeries R)
      (HahnSeries.single (1 : ℤ) (1 : R) + HahnSeries.C a)) := by
  sorry

/-- Integral positive height does not imply invertibility in ordinary Laurent series. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsUnit (HahnSeries.single (1 : ℤ) (1 : PadicInt p) +
      HahnSeries.C (p : PadicInt p) : LaurentSeries (PadicInt p)) := by
  sorry

/-- At each Artinian level the height factor has a finite geometric-series inverse. -/
example (p n : ℕ) [Fact p.Prime] (hn : 0 < n) :
    IsUnit (HahnSeries.single (1 : ℤ) (1 : ZMod (p ^ n)) +
      HahnSeries.C (p : ZMod (p ^ n)) : LaurentSeries (ZMod (p ^ n))) := by
  sorry

/-- The compatible Artinian inverses make the height factor a unit in the completed ring. -/
example (p : ℕ) [Fact p.Prime] :
    IsUnit (AdicCompletion.of
      ((Ideal.span {(p : PadicInt p)}).map
        (algebraMap (PadicInt p) (LaurentSeries (PadicInt p))))
      (LaurentSeries (PadicInt p))
      (HahnSeries.single (1 : ℤ) (1 : PadicInt p) + HahnSeries.C (p : PadicInt p))) := by
  sorry

end EtaleCoefficients

section IdentityChart

variable {A : Type*} [CommRing A]

/-- The residual identity-shape power-series matrix for type `(η, τ)` of actual
Hodge–Tate weights `{0,1,2}`, including its three unit diagonal coordinates. -/
noncomputable def identityFrobenius (a b c d e f g h i aStar eStar iStar : A) :
    Matrix (Fin 3) (Fin 3) (Polynomial A) :=
  !![Polynomial.C a + Polynomial.X * Polynomial.C aStar, Polynomial.C b, Polynomial.C c;
     Polynomial.X * Polynomial.C d, Polynomial.C e + Polynomial.X * Polynomial.C eStar,
       Polynomial.C f;
     Polynomial.X * Polynomial.C g, Polynomial.X * Polynomial.C h,
       Polynomial.C i + Polynomial.X * Polynomial.C iStar]

/-- The identity-chart determinant has the cubic equation at coefficient `v²`.
The coefficient `v³` is the product of its unit diagonal coordinates. -/
theorem identity_frobenius_determinant_coefficients
    (a b c d e f g h i aStar eStar iStar : A) :
    (Matrix.det (identityFrobenius a b c d e f g h i aStar eStar iStar)).coeff 2 =
      a * eStar * iStar + e * aStar * iStar + i * aStar * eStar -
        aStar * f * h - eStar * c * g - iStar * b * d + c * h * d ∧
    (Matrix.det (identityFrobenius a b c d e f g h i aStar eStar iStar)).coeff 3 =
      aStar * eStar * iStar := by
  sorry

/-- A residual diagonal entry detects the actual cubic determinant relation. -/
example : (Matrix.det
    (identityFrobenius (1 : ℤ) 0 0 0 0 0 0 0 0 1 1 1)).coeff 2 = 1 := by
  norm_num [identityFrobenius, Matrix.det_fin_three, Matrix.cons_val_succ,
    Matrix.cons_val_zero, Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons,
    Polynomial.coeff_X, Polynomial.coeff_X_pow, Polynomial.coeff_mul_X,
    Polynomial.coeff_X_mul]

/-- Killing coefficient `v²` alone does not kill coefficient `v`. -/
example : (Matrix.det
    (identityFrobenius (0 : ℤ) 1 0 0 0 1 1 0 0 1 1 1)).coeff 2 = 0 ∧
    (Matrix.det (identityFrobenius (0 : ℤ) 1 0 0 0 1 1 0 0 1 1 1)).coeff 1 = 1 := by
  norm_num [identityFrobenius, Matrix.det_fin_three, Matrix.cons_val_succ,
    Matrix.cons_val_zero, Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons,
    Polynomial.coeff_X, Polynomial.coeff_X_pow, Polynomial.coeff_mul_X,
    Polynomial.coeff_X_mul]

/-- The base identity chart has determinant `v³`, with no extra lower coefficient. -/
example : Matrix.det (identityFrobenius (0 : ℤ) 0 0 0 0 0 0 0 0 1 1 1) =
    Polynomial.X ^ 3 := by
  simp [identityFrobenius, Matrix.det_fin_three, pow_succ]


end IdentityChart

section MinimalTypeControl

/-- The matching formula for the minimal-type `γαγ` chart fixes the coefficient `-1-b+c`.
At these constants the printed `1-b+c` instead gives a nonzero value. -/
example :
    (-1 - 24 + 0 : ZMod 79) * 1 * 1 - (-1 - 12 + 0) * 1 * 8 = 0 ∧
    (-1 - 24 + 0 : ZMod 79) * 1 * 1 - (1 - 12 + 0) * 1 * 8 = 63 := by
  decide

/-- With c33=T the corrected gamma-alpha-gamma product vanishes, whereas the
conflicting coefficient gives the nonzero series 63*T^3. -/
example :
    let T : PowerSeries (ZMod 79) := PowerSeries.X
    T * ((-1 - 24 + 0) * T * T - (-1 - 12 + 0) * 1 * (8 * T ^ 2)) = 0 ∧
    T * ((-1 - 24 + 0) * T * T - (1 - 12 + 0) * 1 * (8 * T ^ 2)) = 63 * T ^ 3 ∧
    (63 : PowerSeries (ZMod 79)) * T ^ 3 ≠ 0 := by
  sorry

/-- With c33=0 the product vanishes even when its second factor is nonzero. -/
example :
    let T : PowerSeries (ZMod 79) := PowerSeries.X
    (0 : PowerSeries (ZMod 79)) *
      ((-1 - 24 + 0) * T * T - (-1 - 12 + 0) * 1 * T) = 0 ∧
    ((-1 - 24 + 0) * T * T - (-1 - 12 + 0) * 1 * T) ≠ 0 := by
  sorry

end MinimalTypeControl

section Eigenvalue

variable {A : Type*} [CommRing A]

/-- After writing `α=1+β`, the eigenvalue equation for determinant-one Frobenius of trace `2+t`. -/
def OrdinaryEigenvalueEquation (t β : A) : Prop := β ^ 2 - t * β - t = 0

/-- The condition is a characteristic-polynomial root, retaining Frobenius and its eigenvalue. -/
theorem ordinary_eigenvalue_equation_iff (Φ : Matrix (Fin 2) (Fin 2) A)
    (hdet : Matrix.det Φ = 1) (β : A) :
    OrdinaryEigenvalueEquation (Matrix.trace Φ - 2) β ↔
      Polynomial.eval (1 + β) Φ.charpoly = 0 := by
  sorry

/-- Scalar Frobenius permits the repeated eigenvalue one. -/
example : OrdinaryEigenvalueEquation (0 : ℤ) 0 := by
  norm_num [OrdinaryEigenvalueEquation]

/-- Over a nonreduced coefficient ring the same scalar root can have a nonzero nilpotent shift. -/
example : OrdinaryEigenvalueEquation (0 : ZMod 9) 3 := by
  unfold OrdinaryEigenvalueEquation
  decide

/-- A unit shift is not an eigenvalue of scalar Frobenius. -/
example : ¬ OrdinaryEigenvalueEquation (0 : ZMod 9) 1 := by
  unfold OrdinaryEigenvalueEquation
  decide

end Eigenvalue

/-! ## Layer 7: Determinant-ordinary images and flags -/

section DeterminantOrdinary

variable {A G : Type*} [CommRing A] [Group G] {n : ℕ}

/-- The determinant-ordinary equations over their actual coefficient algebra:
characteristic polynomials and every ordered length-`n` product.
The extended universal coefficient ring and its descent image are separate README constructions. -/
def IsDetOrdinary (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) : Prop :=
  (∀ g, (ρ g : Matrix (Fin n) (Fin n) A).charpoly =
    ∏ i, (Polynomial.X - Polynomial.C ((χ i g : Aˣ) : A))) ∧
  ∀ g : Fin n → G,
    (List.ofFn fun i ↦ (ρ (g i) : Matrix (Fin n) (Fin n) A) -
      ((χ i (g i) : Aˣ) : A) • (1 : Matrix (Fin n) (Fin n) A)).prod = 0

/-- A simultaneous basis giving the prescribed ordered stable flag and its actual diagonal characters. -/
def HasOrderedTriangularization (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) : Prop :=
  ∃ B : GL (Fin n) A, ∀ g,
    (∀ i j : Fin n, j < i →
      ((B⁻¹ * ρ g * B : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) i j = 0) ∧
    (∀ i : Fin n,
      ((B⁻¹ * ρ g * B : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) i i =
        ((χ i g : Aˣ) : A))

/-- With pairwise distinct characters over a field, the full equations characterize the ordered flag.
Distinct character functions are enough; no one group element need separate all their values. -/
theorem det_ordinary_iff_ordered_triangularization {F : Type*} [Field F]
    (ρ : G →* GL (Fin n) F) (χ : Fin n → G →* Fˣ)
    (hn : 0 < n) (hχ : Function.Injective χ) :
    IsDetOrdinary ρ χ ↔ HasOrderedTriangularization ρ χ := by
  sorry

/-- In rank one the full determinant-ordinary equations identify the actual character. -/
example (ρ : G →* GL (Fin 1) A) (χ : Fin 1 → G →* Aˣ) :
    IsDetOrdinary ρ χ ↔
      ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = ((χ 0 g : Aˣ) : A) := by
  sorry

/-- Rank-one triangularization is the same character equality, over any coefficient ring. -/
example (ρ : G →* GL (Fin 1) A) (χ : Fin 1 → G →* Aˣ) :
    HasOrderedTriangularization ρ χ ↔
      ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = ((χ 0 g : Aˣ) : A) := by
  sorry

/-- An explicit invertible matrix from a specified two-sided inverse. -/
def controlMatrixUnit (M N : Matrix (Fin 2) (Fin 2) A)
    (hMN : M * N = 1) (hNM : N * M = 1) : GL (Fin 2) A :=
  ⟨M, N, hMN, hNM⟩

/-- The diagonal rank-two representation of the product of unit groups. -/
def diagonalControlRep : (Aˣ × Aˣ) →* GL (Fin 2) A where
  toFun g := controlMatrixUnit !![(g.1 : A), 0; 0, (g.2 : A)]
    !![(↑g.1⁻¹ : A), 0; 0, (↑g.2⁻¹ : A)] (by sorry) (by sorry)
  map_one' := by sorry
  map_mul' := by sorry

/-- The two diagonal characters in their specified order. -/
def diagonalControlCharacters : Fin 2 → (Aˣ × Aˣ) →* Aˣ :=
  ![MonoidHom.fst Aˣ Aˣ, MonoidHom.snd Aˣ Aˣ]

/-- The actual diagonal group representation satisfies both ordered conditions. -/
example : IsDetOrdinary (diagonalControlRep (A := A)) diagonalControlCharacters ∧
    HasOrderedTriangularization (diagonalControlRep (A := A)) diagonalControlCharacters := by
  sorry

/-- Generators of a nonsplit rank-two extension over Q: diagonal(2,1) and a unipotent. -/
def orderedExtensionGenerators : Fin 2 → GL (Fin 2) ℚ :=
  ![controlMatrixUnit !![2, 0; 0, 1] !![1 / 2, 0; 0, 1] (by sorry) (by sorry),
    controlMatrixUnit !![1, 1; 0, 1] !![1, -1; 0, 1] (by sorry) (by sorry)]

/-- The nonsplit extension as a representation of the free group on the two generators. -/
def orderedExtensionRep : FreeGroup (Fin 2) →* GL (Fin 2) ℚ :=
  FreeGroup.lift orderedExtensionGenerators

/-- The extension's diagonal character followed by its trivial quotient character. -/
def orderedExtensionCharacters : Fin 2 → FreeGroup (Fin 2) →* ℚˣ :=
  ![FreeGroup.lift ![⟨2, 1 / 2, by norm_num, by norm_num⟩, 1], 1]

/-- The upper extension has the prescribed ordered flag and determinant products. -/
example : HasOrderedTriangularization orderedExtensionRep orderedExtensionCharacters ∧
    IsDetOrdinary orderedExtensionRep orderedExtensionCharacters := by
  sorry

/-- Reversing the order in a nonsplit extension destroys both ordered conditions. -/
example :
    ¬ HasOrderedTriangularization orderedExtensionRep
      (fun i => orderedExtensionCharacters (1 - i)) ∧
    ¬ IsDetOrdinary orderedExtensionRep (fun i => orderedExtensionCharacters (1 - i)) := by
  sorry

/-- Nilpotently shifted reciprocal characters of the cyclic free group over Z/9. -/
def nilpotentShiftCharacters : Fin 2 → FreeGroup Unit →* (ZMod 9)ˣ :=
  ![FreeGroup.lift (fun _ => ⟨4, 7, by decide, by decide⟩),
    FreeGroup.lift (fun _ => ⟨7, 4, by decide, by decide⟩)]

/-- Over Z/9 the scalar representation satisfies determinant-ordinary equations for
nilpotently shifted characters, but has no direct-summand flag with those characters. -/
example :
    IsDetOrdinary (1 : FreeGroup Unit →* GL (Fin 2) (ZMod 9)) nilpotentShiftCharacters ∧
    ¬ HasOrderedTriangularization (1 : FreeGroup Unit →* GL (Fin 2) (ZMod 9))
      nilpotentShiftCharacters := by
  sorry

end DeterminantOrdinary

section NonreducedControl

/-- The nonreduced triangular family used to distinguish determinant polynomials from ordered products. -/
def z9Family (a b : ZMod 9) : Matrix (Fin 2) (Fin 2) (ZMod 9) :=
  !![1 + 3 * a, b; 0, 1 - 3 * a]

/-- Every family element has determinant one and repeated characteristic root one. -/
theorem z9_family_determinant_and_charpoly (a b : ZMod 9) :
    Matrix.det (z9Family a b) = 1 ∧
      (z9Family a b).charpoly = (Polynomial.X - 1) ^ 2 := by
  sorry

/-- The family contains `M=diag(4,7)`. -/
example : z9Family 1 0 = !![4, 0; 0, 7] := by
  decide

/-- It also contains the unipotent `U` with upper-right entry one. -/
example : z9Family 0 1 = !![1, 1; 0, 1] := by
  decide

/-- The ordered product is nonzero even though both characteristic polynomials are `(X−1)²`. -/
example : (z9Family 1 0 - 1) * (z9Family 0 1 - 1) = !![0, 3; 0, 0] ∧
    (z9Family 1 0 - 1) * (z9Family 0 1 - 1) ≠ 0 := by
  decide

/-- The invertible generators M=diag(4,7) and U of the nonreduced subgroup. -/
def z9Generators : Fin 2 → GL (Fin 2) (ZMod 9) :=
  ![controlMatrixUnit (z9Family 1 0) (z9Family 2 0) (by decide) (by decide),
    controlMatrixUnit (z9Family 0 1) (z9Family 0 (-1)) (by decide) (by decide)]

/-- The actual subgroup generated by M and U. -/
def z9Subgroup : Subgroup (GL (Fin 2) (ZMod 9)) :=
  Subgroup.closure (Set.range z9Generators)

/-- Every subgroup element has the repeated-root polynomial, but the subgroup
representation fails determinant-ordinarity for the two trivial characters. -/
example :
    (∀ g : z9Subgroup, (g.val : Matrix (Fin 2) (Fin 2) (ZMod 9)).charpoly =
      (Polynomial.X - 1) ^ 2) ∧
    ¬ IsDetOrdinary z9Subgroup.subtype (fun _ : Fin 2 => 1) := by
  sorry

end NonreducedControl

/-! ## Layer 8: Selected local conditions and global exports -/

section TraceControl

/-- In characteristic two scalar endomorphisms have trace zero, while trace on all
endomorphisms is surjective. Scalar splitting cannot identify fixed-determinant strict
classes with `H¹(ad⁰)` in this case. -/
example : Matrix.trace (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 0 ∧
    Matrix.trace (!![1, 0; 0, 0] : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 1 := by
  decide

/-- The two-scalar Taylor–Wiles inertia direction has determinant derivative zero;
ramifying only the selected line has nonzero determinant derivative. -/
example : Matrix.trace (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) (ZMod 5)) = 0 ∧
    Matrix.trace (!![1, 0; 0, 0] : Matrix (Fin 2) (Fin 2) (ZMod 5)) = 1 := by
  decide

end TraceControl

section NodalRing

variable (A : Type*) [CommRing A]

/-- The actual integral formal node appearing in the selected rank-two branches. -/
noncomputable def nodalIdeal (π u : A) : Ideal (MvPowerSeries (Fin 2) A) :=
  Ideal.span {MvPowerSeries.X 0 * MvPowerSeries.X 1 - MvPowerSeries.C (π * u)}

/-- Its ring retains the node equation, rather than only its number of variables. -/
abbrev NodalRing (π u : A) := MvPowerSeries (Fin 2) A ⧸ nodalIdeal A π u

/-- The integral node over a DVR is a flat domain when its constant term is nonzero and nonunit. -/
theorem nodal_ring_flat_domain [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] (π u : A)
    (hπ : π ≠ 0) (hπnonunit : ¬ IsUnit π) (hu : IsUnit u) :
    IsDomain (NodalRing A π u) ∧ Module.Flat A (NodalRing A π u) := by
  sorry

/-- With zero constant term the actual quotient contains the two coordinate branches. -/
example : nodalIdeal ℚ 0 1 =
    Ideal.span {MvPowerSeries.X (0 : Fin 2) * MvPowerSeries.X 1} := by
  simp [nodalIdeal]

/-- A unit constant term makes the formal equation a unit and the quotient the zero ring. -/
example : nodalIdeal ℚ 1 1 = ⊤ := by
  sorry

/-- With zero constant term the two nonzero coordinate classes have zero product. -/
example : ∃ x y : NodalRing ℚ 0 1, x ≠ 0 ∧ y ≠ 0 ∧ x * y = 0 := by
  sorry

end NodalRing

/-!
The README also specifies the following constructions with their full geometric carriers.

Layer 1: `heightLatticeFunctor`, `ordinaryWeightRing`, `universalInertialCharacter`,
`ordinaryWeightRingTilde`, `FLDeformation`, `IsOrdinaryOfWeight`,
`IsSemistableOrdinaryOfWeight`, `ordinaryFlagScheme`, `ordinaryFlagImage`, `CoeffRing`,
`ArtinCat`, `liftFunctorΛ`, `GLift`, `GFramedRing`, `canonicalTorus`, `chiLambda`, `IsGOrdinary`,
`PhiGamma.defRing`, `PhiGamma.triangulineDefRing`, `PhiGamma.deRhamDefRing`.

Layer 2: `IsMinimallyRamified`, `SteinbergLifts`, `TameGroup`, `GSp4RamType`,
`typeQuotient`, the symplectic `GSp4.exp₂` and `GSp4.log₂`, `𝒩(q)`, `ℳ(x,y;q)`,
`LevelRaising.mix`, `LevelRaising.unr`, `LevelRaising.ram`, `InertialType`,
`fixedTypeRing`, `IsRigidFor`, `TaylorWilesBlock`, `GSp4.MinimalAt`.

Layer 3: `HodgeType`, `GaloisType`, `IsOfType`, `WDTypeRing`.
Layer 4: `flatLiftingRing`, `flatDeformationRing`, `finiteFlatModels`,
`flatHodgeTypeQuotient`, `flatResolution`.
The finite-flat condition and its Fontaine–Laffaille tangent calculation use
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.7.
Layer 5: `kisinGroupoid`, `DyadicMinimal.lift`.
Layer 6: the geometric APIs `Connects.sum_tensor_dual` and `Connects.trans_of_smooth`
of §6.8, `OrdinaryFixedInertia`, `DiscreteSeriesType`, `IsDiscreteSeriesLift`,
`gOrdinaryFlagScheme`, `gOrdinaryRing`, `OrdinaryWithEigenvalue`, `GL3KisinChart`,
`partitionRing`, `IsTorsionCrystalline`, `IsCrystallineIntegral`, `GSp4.SiegelOrdinary`,
`rhoNM0`, `GSp4.IsPDistinguishedOrdinary`, `GSp4.BorelOrdinary`,
`GSp4.ParabolicOrdinary`, `GL3.explicitRing`, `GL3.comparisonDiagram`,
`GSp4.weightAlgebra`, `GSp4.ordinaryFlagScheme`, `GL3.WeakMinimalPatchingFunctor`,
`GL3.typeGeometry_of_weakMinimalPatching`, `GL3.auxiliaryLift`, `GL3.scopedGlobalization`,
`GL3.definiteUnitaryPatching`, `GL3.weakMinimalPatching_exists`,
`GL3.weakMinimalPatching_multiplicity`, `GL3.weakMinimalPatching_typeSupport`.
The GL₃ type `(η, τ)` has actual weights `{0,1,2}` and determinant weight `3`.
Its Kisin Frobenius matrices lie over power series with a height condition;
`GL3KisinChart.frobMatrix` becomes invertible over the completed étale coefficient ring,
and `GL3KisinChart.shape` is defined on residual Laurent-series field fibres.
The conditional type theorem assumes the functor; its existence for `p > 3` uses
the separate auxiliary-lift, scoped-globalization and finite-level unitary patching targets.
Layer 7: `detOrdTilde`, `detOrd`.
Layer 8: `KWCondition`, `CategoryCondition`.
-/

end TauCetiRoadmap.LocalGaloisDeformationRings

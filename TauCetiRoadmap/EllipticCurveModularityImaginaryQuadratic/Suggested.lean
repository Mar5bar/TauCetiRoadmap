import Mathlib

/-!
# EllipticCurveModularityImaginaryQuadratic: representative target signatures

The roadmap is README.md. This file records light definitions and representative
milestone and endpoint signatures expressible over the pinned APIs; it is not
exhaustive. The automorphic, compactified modular-curve and Jacobian constructions
are specified in the README.

Literal Weierstrass coefficients, rational functions and homogeneous coordinates
use existing Mathlib carriers. Function-field degree is distinct from integer
rational-function degree. Actual elliptic point groups record saturation and
quadratic torsion growth. Coordinate identities do not themselves identify a
modular curve, its j-map or its Jacobian variety.
-/

namespace TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic

noncomputable section
attribute [local instance] Classical.decEq

/- Layers 0–2 use the automorphic and moduli carriers specified in README.md.
Their targets are stated there, including fixed_pairing_twist,
fixed_pairing_twist_rational, mixed_fixed_pairing_twist_six,
even_trace_comparison and quadratic_rank_decomposition.
The Modular predicate and its transport statements require totally real or CM
base fields; the real branches of genus_one_points_modular and
genus_two_points_modular carry RealQuadraticCurveData. -/

/-! ## Layer 3: CM modularity and equation density -/

/-- Nonsingular integral short equations, counted as coefficient pairs rather than
isomorphism classes (Zywina §1.1, pp.1–2). -/
def shortEquationFamily (F : Type*) [Field F] [NumberField F] :
    Set (NumberField.RingOfIntegers F × NumberField.RingOfIntegers F) :=
  {ab | 4 * ab.1 ^ 3 + 27 * ab.2 ^ 2 ≠ 0}

namespace shortEquationFamily

/-- The literal short model has discriminant −16(4a³+27b²); membership
agrees with Mathlib ellipticity in characteristic zero. -/
theorem discriminant (F : Type*) [Field F] [NumberField F]
    (a b : NumberField.RingOfIntegers F) :
    (⟨0, 0, 0, (a : F), (b : F)⟩ : WeierstrassCurve F).Δ =
      -16 * (4 * (a : F) ^ 3 + 27 * (b : F) ^ 2) ∧
    ((a, b) ∈ shortEquationFamily F ↔
      (⟨0, 0, 0, (a : F), (b : F)⟩ : WeierstrassCurve F).IsElliptic) := by sorry

/-- A norm compatible with the canonical additive group and real scalar action
on the coefficient tensor gives finite bounded lattice counts.
The subtype count equals the finite set cardinal, without stabilizer weights
(Zywina §1.1, pp.1–2). -/
theorem height_count (F : Type*) [Field F] [NumberField F]
    [Norm
      (TensorProduct ℤ ℝ (NumberField.RingOfIntegers F × NumberField.RingOfIntegers F))]
    (hNorm : NormedSpace.Core ℝ
      (TensorProduct ℤ ℝ (NumberField.RingOfIntegers F × NumberField.RingOfIntegers F)))
    (X : ℝ) :
    {ab : NumberField.RingOfIntegers F × NumberField.RingOfIntegers F |
      ab ∈ shortEquationFamily F ∧ ‖TensorProduct.tmul ℤ (1 : ℝ) ab‖ ≤ X}.Finite ∧
    Nat.card {ab : shortEquationFamily F |
      ‖TensorProduct.tmul ℤ (1 : ℝ) ab.val‖ ≤ X} =
      {ab : NumberField.RingOfIntegers F × NumberField.RingOfIntegers F |
        ab ∈ shortEquationFamily F ∧ ‖TensorProduct.tmul ℤ (1 : ℝ) ab‖ ≤ X}.ncard := by
  let := NormedAddCommGroup.ofCore hNorm
  let := NormedSpace.ofCore hNorm
  sorry

/-- At nonpositive height the only possible coefficient pair is singular. -/
example (F : Type*) [Field F] [NumberField F]
    [Norm
      (TensorProduct ℤ ℝ (NumberField.RingOfIntegers F × NumberField.RingOfIntegers F))]
    (hNorm : NormedSpace.Core ℝ
      (TensorProduct ℤ ℝ (NumberField.RingOfIntegers F × NumberField.RingOfIntegers F)))
    (X : ℝ) (hX : X ≤ 0) :
    Nat.card {ab : shortEquationFamily F |
      ‖TensorProduct.tmul ℤ (1 : ℝ) ab.val‖ ≤ X} = 0 := by
  let := NormedAddCommGroup.ofCore hNorm
  let := NormedSpace.ofCore hNorm
  sorry

/-- Two nonsingular coefficient pairs count separately although scaling by 2
identifies their Weierstrass models. -/
example (F : Type*) [Field F] [NumberField F] :
    ((0, 1) : NumberField.RingOfIntegers F × NumberField.RingOfIntegers F) ≠ (0, 64) ∧
    ((0, 1) : NumberField.RingOfIntegers F × NumberField.RingOfIntegers F) ∈
      shortEquationFamily F ∧
    ((0, 64) : NumberField.RingOfIntegers F × NumberField.RingOfIntegers F) ∈
      shortEquationFamily F ∧
    (⟨Units.mk0 (2 : F) (by norm_num), 0, 0, 0⟩ : WeierstrassCurve.VariableChange F) •
      (⟨0, 0, 0, 0, 64⟩ : WeierstrassCurve F) =
      (⟨0, 0, 0, 0, 1⟩ : WeierstrassCurve F) := by sorry

/-- The zero pair is singular and excluded from the coefficient family. -/
example (F : Type*) [Field F] [NumberField F] :
    ((0, 0) : NumberField.RingOfIntegers F × NumberField.RingOfIntegers F) ∉
      shortEquationFamily F ∧
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve F).Δ = 0 := by sorry

/-- The integral pair (0,1) has discriminant −432. -/
example (F : Type*) [Field F] [NumberField F] :
    ((0, 1) : NumberField.RingOfIntegers F × NumberField.RingOfIntegers F) ∈
      shortEquationFamily F ∧
    (⟨0, 0, 0, 0, 1⟩ : WeierstrassCurve F).Δ = -432 := by sorry

end shortEquationFamily

/-! ## Layer 4: Cartan modular curves and explicit j-maps -/

/-- The source-normalized Borel-3 rational j-expression (CN Proposition
7.1.3(1), p.94); its geometric interpretation needs small_curve_models. -/
def b3J : RatFunc ℚ := RatFunc.mk (((Polynomial.X + 27) * (Polynomial.X + 3)^3) : Polynomial ℚ) (Polynomial.X : Polynomial ℚ)

/-- Degree of ℚ(x)/ℚ(j), distinct from RatFunc.intDegree. Identifying this
with the proper modular j-morphism needs small_curve_models (CN Proposition
7.1.3, p.94). -/
theorem b3J_functionFieldDegree :
    Module.finrank (IntermediateField.adjoin ℚ ({b3J} : Set (RatFunc ℚ)))
      (RatFunc ℚ) = 4 := by sorry

/-- The value at 1 distinguishes the Borel-3 normalization. -/
example : RatFunc.eval (RingHom.id ℚ) 1 b3J = 1792 := by sorry

/-- The value at (-3) fixes the source normalization of b3J. -/
example : RatFunc.eval (RingHom.id ℚ) (-3) b3J = 0 := by sorry

/-- Totalized field evaluation at the pole 0 is zero; the proper map has a cusp. -/
example : (RatFunc.denom b3J).eval 0 = 0 ∧ RatFunc.eval (RingHom.id ℚ) 0 b3J = 0 := by sorry

/-- The Borel-5 rational j-expression (CN Proposition 7.1.3(2), p.94). -/
def b5J : RatFunc ℚ := RatFunc.mk ((Polynomial.X^2 + 250*Polynomial.X + 3125)^3 : Polynomial ℚ) (Polynomial.X^5 : Polynomial ℚ)

/-- Degree of ℚ(x)/ℚ(j), distinct from RatFunc.intDegree. Identifying this
with the proper modular j-morphism needs small_curve_models (CN Proposition
7.1.3, p.94). -/
theorem b5J_functionFieldDegree :
    Module.finrank (IntermediateField.adjoin ℚ ({b5J} : Set (RatFunc ℚ)))
      (RatFunc ℚ) = 6 := by sorry

/-- The value at 1 fixes the Borel-5 scaling. -/
example : RatFunc.eval (RingHom.id ℚ) 1 b5J = 38477541376 := by sorry

/-- The value at (-5) fixes the source normalization of b5J. -/
example : RatFunc.eval (RingHom.id ℚ) (-5) b5J = -2194880 := by sorry

/-- The reduced Borel-5 denominator vanishes at the cusp 0. -/
example : (RatFunc.denom b5J).eval 0 = 0 := by sorry

/-- The nonsplit-normalizer-3 expression x³ (CN Proposition 7.1.3(3),
p.94), distinct from the actual Cartan conic. -/
def ns3J : RatFunc ℚ := RatFunc.mk (Polynomial.X^3 : Polynomial ℚ) (1 : Polynomial ℚ)

/-- Degree of ℚ(x)/ℚ(j), distinct from RatFunc.intDegree. Identifying this
with the proper modular j-morphism needs small_curve_models (CN Proposition
7.1.3, p.94). -/
theorem ns3J_functionFieldDegree :
    Module.finrank (IntermediateField.adjoin ℚ ({ns3J} : Set (RatFunc ℚ)))
      (RatFunc ℚ) = 3 := by sorry

/-- The value at 2 distinguishes x³ from x. -/
example : RatFunc.eval (RingHom.id ℚ) 2 ns3J = 8 := by sorry

/-- The value at 0 fixes the source normalization of ns3J. -/
example : RatFunc.eval (RingHom.id ℚ) 0 ns3J = 0 := by sorry

/-- The normalizer expression is polynomial with integer degree 3. -/
example : RatFunc.denom ns3J = 1 ∧ RatFunc.intDegree ns3J = 3 := by sorry

/-- The nonsplit-normalizer-5 expression (CN Proposition 7.1.3(4), p.94).
Its finite value at infinity does not make it a constant function. -/
def ns5J : RatFunc ℚ := RatFunc.mk (125*Polynomial.X*(2*Polynomial.X+1)^3*(2*Polynomial.X^2+7*Polynomial.X+8)^3 : Polynomial ℚ) ((Polynomial.X^2+Polynomial.X-1)^5 : Polynomial ℚ)

/-- Degree of ℚ(x)/ℚ(j), distinct from RatFunc.intDegree. Identifying this
with the proper modular j-morphism needs small_curve_models (CN Proposition
7.1.3, p.94). -/
theorem ns5J_functionFieldDegree :
    Module.finrank (IntermediateField.adjoin ℚ ({ns5J} : Set (RatFunc ℚ)))
      (RatFunc ℚ) = 10 := by sorry

/-- At 0 the nonsplit-5 value is zero and its denominator is nonzero. -/
example : RatFunc.eval (RingHom.id ℚ) 0 ns5J = 0 ∧ (RatFunc.denom ns5J).eval 0 ≠ 0 := by sorry

/-- The value at (-1/2) fixes the source normalization of ns5J. -/
example : RatFunc.eval (RingHom.id ℚ) (-1/2) ns5J = 0 := by sorry

/-- Equal numerator and denominator degrees give integer degree zero and
value 8000 at infinity, while the function-field extension has degree 10. -/
example : RatFunc.intDegree ns5J = 0 ∧ (RatFunc.num ns5J).leadingCoeff / (RatFunc.denom ns5J).leadingCoeff = 8000 := by sorry

/-- The split-normalizer-3 expression (CN Proposition 7.1.3(6), p.94). -/
def s3J : RatFunc ℚ := RatFunc.mk (27*(Polynomial.X+1)^3*(Polynomial.X-3)^3 : Polynomial ℚ) (Polynomial.X^3 : Polynomial ℚ)

/-- Degree of ℚ(x)/ℚ(j), distinct from RatFunc.intDegree. Identifying this
with the proper modular j-morphism needs small_curve_models (CN Proposition
7.1.3, p.94). -/
theorem s3J_functionFieldDegree :
    Module.finrank (IntermediateField.adjoin ℚ ({s3J} : Set (RatFunc ℚ)))
      (RatFunc ℚ) = 6 := by sorry

/-- The value −1728 at 1 distinguishes the split-3 formula. -/
example : RatFunc.eval (RingHom.id ℚ) 1 s3J = -1728 := by sorry

/-- The value at (-1) fixes the source normalization of s3J. -/
example : RatFunc.eval (RingHom.id ℚ) (-1) s3J = 0 := by sorry

/-- The split-3 expression has a pole at 0 and integer degree 3. -/
example : (RatFunc.denom s3J).eval 0 = 0 ∧ RatFunc.intDegree s3J = 3 := by sorry

/-- The common elliptic quotient model y²−y=x³+1 (CN Proposition 7.1.3(5),
p.94). Modular identification is the separate mixed_elliptic_model target. -/
def B : WeierstrassCurve ℚ := ⟨0, 0, -1, 0, 1⟩

/-- The fixed model has nonzero discriminant −675. -/
instance B_elliptic : B.IsElliptic := by
  constructor
  norm_num [isUnit_iff_ne_zero, B, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

/-- Doubling a saturated generator does not generate the whole rational group. -/
example (D : B.toAffine.Point) (hD : Function.Bijective (fun n : ℤ => n • D)) :
    ¬ IsOfFinAddOrder D ∧ ¬ Function.Surjective (fun n : ℤ => n • (2 • D)) := by sorry

/-- The j-invariant of the fixed quotient model is zero. -/
example : B.j = 0 := by sorry

/-- The point (1,2) satisfies the actual quotient model. -/
example : B.toAffine.Equation 1 2 := by sorry

/-- The sign of a₃ matters for the point (1,2). -/
example : B.a₃ = -1 ∧ ¬ (⟨0,0,1,0,1⟩ : WeierstrassCurve ℚ).toAffine.Equation 1 2 := by sorry

/-! ## Layer 5: Genus-one curves and rational divisor classes -/

/-- The level-fifteen arithmetic model y²=x(x+16)(x+25), of discriminant
207360000. Its modular identification is LevelFifteenModels (CN p.93). -/
def E15 : WeierstrassCurve ℚ := ⟨0, 41, 0, 400, 0⟩

/-- The second level-fifteen arithmetic model y²=x(x+1)(x+16), of
discriminant 921600 (CN Corollary 7.1.2 proof, p.93). -/
def Es35 : WeierstrassCurve ℚ := ⟨0, 17, 0, 16, 0⟩

/-- The displayed characteristic-zero model has nonzero discriminant. -/
instance E15_elliptic : E15.IsElliptic := by
  constructor
  norm_num [isUnit_iff_ne_zero, E15, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

/-- The displayed characteristic-zero model has nonzero discriminant. -/
instance Es35_elliptic : Es35.IsElliptic := by
  constructor
  norm_num [isUnit_iff_ne_zero, Es35, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

/-- Coefficientwise field extension transports the existing ellipticity instance. -/
local instance E15_baseChange_elliptic (F : Type*) [Field F] [Algebra ℚ F] :
    (E15.toAffine.baseChange F).IsElliptic := by
  change (E15.map (algebraMap ℚ F)).IsElliptic
  infer_instance

/-- Coefficientwise field extension transports the existing ellipticity instance. -/
local instance Es35_baseChange_elliptic (F : Type*) [Field F] [Algebra ℚ F] :
    (Es35.toAffine.baseChange F).IsElliptic := by
  change (Es35.map (algebraMap ℚ F)).IsElliptic
  infer_instance

/-- The affine point (0,0) is a nonidentity point of order two. -/
example : ∃ h : E15.toAffine.Equation 0 0, WeierstrassCurve.Affine.Point.mk h ≠ 0 ∧ 2 • WeierstrassCurve.Affine.Point.mk h = 0 := by sorry

/-- The three distinct rational two-torsion x-coordinates of E15 are 0, −16, −25. -/
example : E15.toAffine.Equation 0 0 ∧ E15.toAffine.Equation (-16) 0 ∧
    E15.toAffine.Equation (-25) 0 ∧
    (0 : ℚ) ≠ -16 ∧ (0 : ℚ) ≠ -25 ∧ (-16 : ℚ) ≠ -25 := by sorry

/-- The two level-fifteen equations are distinct and have different discriminants. -/
example : E15.Δ = 207360000 ∧ E15 ≠ Es35 := by sorry

/-- The point (0,0) on the second model has exact order two. -/
example : ∃ h : Es35.toAffine.Equation 0 0, WeierstrassCurve.Affine.Point.mk h ≠ 0 ∧ 2 • WeierstrassCurve.Affine.Point.mk h = 0 := by sorry

/-- The three rational two-torsion x-coordinates are 0, −1 and −16. -/
example : Es35.toAffine.Equation (0) 0 ∧ Es35.toAffine.Equation (-1) 0 ∧ Es35.toAffine.Equation (-16) 0 := by sorry

/-- The second model has discriminant 921600, distinct from that of E15. -/
example : Es35.Δ = 921600 ∧ Es35.Δ ≠ E15.Δ := by sorry

/-- The assumed quadratic torsion table on actual point groups (CN Corollary
7.1.2 proof, p.93; Kwon Theorem 1(iii), pp.144–145). The structure records
explicit arithmetic hypotheses; no theorem constructs an inhabitant. -/
structure QuadraticLevelFifteenTorsion (F : Type*) [Field F] [NumberField F] : Prop where
  quadratic_degree : Module.finrank ℚ F = 2
  e15_no_growth_iff :
    (∀ P : (E15.toAffine.baseChange F).Point,
      IsOfFinAddOrder P → P ∈ Set.range
        (WeierstrassCurve.Affine.Point.map (W' := E15.toAffine)
          (Algebra.ofId ℚ F))) ↔
      (¬ ∃ i : F, i ^ 2 = -1) ∧ (¬ ∃ s : F, s ^ 2 = 5)
  es35_no_growth_iff :
    (∀ P : (Es35.toAffine.baseChange F).Point,
      IsOfFinAddOrder P → P ∈ Set.range
        (WeierstrassCurve.Affine.Point.map (W' := Es35.toAffine)
          (Algebra.ofId ℚ F))) ↔ (¬ ∃ s : F, s ^ 2 = 5)
  e15_rational_card : Nat.card E15.toAffine.Point = 8
  es35_rational_card : Nat.card Es35.toAffine.Point = 8
  gaussian_new_card : (∃ i : F, i ^ 2 = -1) →
    Nat.card {P : (E15.toAffine.baseChange F).Point |
      IsOfFinAddOrder P ∧ P ∉ Set.range
        (WeierstrassCurve.Affine.Point.map (W' := E15.toAffine)
          (Algebra.ofId ℚ F))} = 8

/-- Gaussian input gives growth for E15, none for Es35, and eight new torsion
points. It gives no rank-zero assertion for the field. -/
example (F : Type*) [Field F] [NumberField F]
    (h : QuadraticLevelFifteenTorsion F) (i : F) (hi : i ^ 2 = -1)
    (h5 : ¬ ∃ s : F, s ^ 2 = 5) :
    (∃ P : (E15.toAffine.baseChange F).Point, IsOfFinAddOrder P ∧
      P ∉ Set.range (WeierstrassCurve.Affine.Point.map (W' := E15.toAffine)
        (Algebra.ofId ℚ F))) ∧
    (∀ P : (Es35.toAffine.baseChange F).Point, IsOfFinAddOrder P →
      P ∈ Set.range (WeierstrassCurve.Affine.Point.map (W' := Es35.toAffine)
        (Algebra.ofId ℚ F))) ∧
    Nat.card {P : (E15.toAffine.baseChange F).Point | IsOfFinAddOrder P ∧
      P ∉ Set.range (WeierstrassCurve.Affine.Point.map (W' := E15.toAffine)
        (Algebra.ofId ℚ F))} = 8 := by sorry

/-- A square root of 5 forces growth in both tables, including the real
quadratic exception excluded by the final imaginary-field theorem. -/
example (F : Type*) [Field F] [NumberField F]
    (h : QuadraticLevelFifteenTorsion F) (s : F) (hs : s ^ 2 = 5) :
    (∃ P : (E15.toAffine.baseChange F).Point, IsOfFinAddOrder P ∧
      P ∉ Set.range (WeierstrassCurve.Affine.Point.map (W' := E15.toAffine)
        (Algebra.ofId ℚ F))) ∧
    (∃ P : (Es35.toAffine.baseChange F).Point, IsOfFinAddOrder P ∧
      P ∉ Set.range (WeierstrassCurve.Affine.Point.map (W' := Es35.toAffine)
        (Algebra.ofId ℚ F))) := by sorry

/-- With neither exceptional square root, all torsion points are rational
images. Finiteness of the full point groups is a separate hypothesis. -/
example (F : Type*) [Field F] [NumberField F]
    (h : QuadraticLevelFifteenTorsion F)
    (hi : ¬ ∃ i : F, i ^ 2 = -1) (h5 : ¬ ∃ s : F, s ^ 2 = 5) :
    (∀ P : (E15.toAffine.baseChange F).Point, IsOfFinAddOrder P →
      P ∈ Set.range (WeierstrassCurve.Affine.Point.map (W' := E15.toAffine)
        (Algebra.ofId ℚ F))) ∧
    (∀ P : (Es35.toAffine.baseChange F).Point, IsOfFinAddOrder P →
      P ∈ Set.range (WeierstrassCurve.Affine.Point.map (W' := Es35.toAffine)
        (Algebra.ofId ℚ F))) := by sorry

/-- The Gaussian long Weierstrass model (i,1,1,6+i,10−15i), for i²=−1
in the arithmetic comparisons (CN Corollary 7.1.2 proof, p.93; LMFDB 4050.1-c3). -/
def gaussianExceptional (K : Type*) [Field K] (i : K) : WeierstrassCurve K := ⟨i, 1, 1, 6+i, 10-15*i⟩

/-- The Gaussian model retains the long coefficient a₁=i. -/
example (K : Type*) [Field K] (i : K) :
    (gaussianExceptional K i).a₁ = i := by sorry

/-- Reduction using i²=−1 gives the stated nonzero discriminant in
characteristic zero; this does not certify modularity. -/
theorem gaussianExceptional_discriminant (K : Type*) [Field K] [CharZero K] (i : K) (h : i^2 = -1) : (gaussianExceptional K i).Δ = 58752+107136*i ∧ (gaussianExceptional K i).Δ ≠ 0 := by sorry

/-- Mathlib j of the elliptic Gaussian model, with i²=−1 and
characteristic zero. The IsElliptic assumption follows from its discriminant. -/
theorem gaussianExceptional_j (K : Type*) [Field K] [CharZero K] (i : K) (h : i^2 = -1) [(gaussianExceptional K i).IsElliptic] : (gaussianExceptional K i).j = (-47709+15363*i)/256 := by sorry

/-- Changing i to −i commutes with coefficientwise conjugation. -/
example (K : Type*) [Field K] (i : K) (f : K →+* K) (h : f i = -i) : (gaussianExceptional K i).map f = gaussianExceptional K (-i) := by sorry

/-- The Gaussian j-value is nonrational, so the rational-j route cannot apply. -/
example (K : Type*) [Field K] [CharZero K] (i : K) (h : i^2 = -1) [(gaussianExceptional K i).IsElliptic] : ∀ q : ℚ, (gaussianExceptional K i).j ≠ (q : K) := by sorry

/-- The genuine −3 twist of the quartic; its proper model uses weights
(1,2,1) (CN Proposition 7.2.1(1), pp.94–95). -/
def ns3b5Quartic : Polynomial ℚ := -3*(Polynomial.X^4+2*Polynomial.X^3-Polynomial.X^2+10*Polynomial.X+25)

/-- The identity x⁴h(5/x)=25h(x) for x≠0 records the quotient Fricke
action. It does not choose either sign of a lift to the double cover
(CN Proposition 7.2.1(2), p.94). -/
theorem ns3b5Quartic_fricke (K : Type*) [Field K] [CharZero K] (x : K) (h : x ≠ 0) : x^4 * ns3b5Quartic.eval₂ (Rat.castHom K) (5/x) = 25 * ns3b5Quartic.eval₂ (Rat.castHom K) x := by sorry

/-- The value −75 at zero fixes the quadratic twist. -/
example : ns3b5Quartic.eval (0) = -75 := by sorry

/-- The quartic at −2 gives the y-coordinate −√−3. -/
example : ns3b5Quartic.eval (-2) = -3 := by sorry

/-- The value at −5/2 agrees with the special point y=5√−3/4. -/
example : ns3b5Quartic.eval (-5/2) = -75/16 := by sorry

/-- The scalar-one infinity coordinate fails the genuine −3-twisted equation. -/
example : ns3b5Quartic.leadingCoeff = -3 ∧
    (1 : ℚ) ^ 2 ≠ ns3b5Quartic.leadingCoeff := by sorry

/-- The five ordered weighted coordinate triples over a square root of −3.
Their lifts to the smooth proper curve need GenusOneModel (CN p.95). -/
def genusOneSpecialPoints (K : Type*) [Field K] (s : K) : List (Fin 3 → K) := [![1,s,0], ![1,-s,0], ![0,5*s,1], ![-2,-s,1], ![-5/2,5*s/4,1]]

/-- All five triples satisfy the weight-(1,2,1) homogeneous equation
when s²=−3; the geometric point construction is separate. -/
theorem genusOneSpecialPoints_on_curve (K : Type*) [Field K] [CharZero K]
    (s : K) (h : s ^ 2 = -3) :
    ∀ v ∈ genusOneSpecialPoints K s,
      v 1 ^ 2 = -3 * (v 0 ^ 4 + 2 * v 0 ^ 3 * v 2 - v 0 ^ 2 * v 2 ^ 2 +
        10 * v 0 * v 2 ^ 3 + 25 * v 2 ^ 4) := by sorry

/-- The two infinity triples are distinct and have Z=0 and opposite Y. -/
example (K : Type*) [Field K] [CharZero K] (s : K) (hs : s ^ 2 = -3) :
    (genusOneSpecialPoints K s)[0]? = some ![1, s, 0] ∧
    (genusOneSpecialPoints K s)[1]? = some ![1, -s, 0] ∧
    (genusOneSpecialPoints K s)[0]? ≠ (genusOneSpecialPoints K s)[1]? := by sorry

/-- The last triple uses −5/2 and 5s/4, with the weight-two equation. -/
example (K : Type*) [Field K] [CharZero K] (s : K) (hs : s ^ 2 = -3) :
    (genusOneSpecialPoints K s)[4]? = some ![-5/2, 5*s/4, 1] ∧
    (5*s/4)^2 = ns3b5Quartic.eval₂ (Rat.castHom K) (-5/2) := by sorry

/-- The third listed triple is 0+, whose y-coordinate squares to the quartic at zero. -/
example (K : Type*) [Field K] [CharZero K] (s : K) (hs : s ^ 2 = -3) :
    (genusOneSpecialPoints K s)[2]? = some ![0, 5*s, 1] ∧
    (5*s)^2 = ns3b5Quartic.eval₂ (Rat.castHom K) 0 := by sorry

/-- At x=1+2i the norm-five relation agrees with the plus Fricke lift;
the minus lift has the same x-coordinate and the wrong y-coordinate. -/
example (K : Type*) [Field K] [CharZero K] (i : K) (hi : i ^ 2 = -1) :
    (3 + 6 * i) ^ 2 = ns3b5Quartic.eval₂ (Rat.castHom K) (1 + 2 * i) ∧
    (1 + 2 * i) * (1 - 2 * i) = 5 ∧
    5 / (1 + 2 * i) = 1 - 2 * i ∧
    5 * (3 + 6 * i) / (1 + 2 * i) ^ 2 = 3 - 6 * i ∧
    -(5 * (3 + 6 * i) / (1 + 2 * i) ^ 2) ≠ 3 - 6 * i := by sorry

/-! ## Layer 6: Genus-two curves and exceptional points -/

/-- The sextic defining the genus-two arithmetic model, with leading
coefficient 9 and two rational infinity points (CN Proposition 7.3.1, p.97). -/
def b3ns5Sextic : Polynomial ℚ := 9*Polynomial.X^6-6*Polynomial.X^5-35*Polynomial.X^4+40*Polynomial.X^2+12*Polynomial.X-8

/-- The sextic is squarefree over ℚ; smooth proper normalization and
modular identification remain genus_two_model (CN Proposition 7.3.1, p.97). -/
theorem b3ns5Sextic_squarefree : Squarefree b3ns5Sextic := by sorry

/-- The constant term is −8, not zero. -/
example : b3ns5Sextic.eval 0 = -8 := by sorry

/-- The three rational roots are −1, 1/3 and 2. -/
example : b3ns5Sextic.eval (-1) = 0 ∧ b3ns5Sextic.eval (1/3) = 0 ∧ b3ns5Sextic.eval 2 = 0 := by sorry

/-- The sextic has degree six and square leading coefficient nine. -/
example : b3ns5Sextic.natDegree = 6 ∧ b3ns5Sextic.leadingCoeff = 9 := by sorry

/-- The long Weierstrass model over a²−a+3=0, including the coefficient
a₂=0 (CN Corollary 7.3.4 proof, p.98; b3ns5.m exceptional-curve block). -/
def elevenExceptional (K : Type*) [Field K] (a : K) : WeierstrassCurve K := ⟨a, 0, 1+a, -24-6*a, 56+13*a⟩

/-- The exceptional eleven model has a₂=0. -/
example (K : Type*) [Field K] (a : K) : (elevenExceptional K a).a₂ = 0 := by sorry

/-- Reduction by a²−a+3 gives the nonzero discriminant of the exceptional
model in characteristic zero. -/
theorem elevenExceptional_discriminant (K : Type*) [Field K] [CharZero K] (a : K) (h : a^2-a+3 = 0) : (elevenExceptional K a).Δ = 4512-736*a ∧ (elevenExceptional K a).Δ ≠ 0 := by sorry

/-- The actual Mathlib j-invariant, with ellipticity and a²−a+3=0;
the full residual image is an explicit README hypothesis and modularity
is a separate target. -/
theorem elevenExceptional_j (K : Type*) [Field K] [CharZero K] (a : K) (h : a^2-a+3 = 0) [(elevenExceptional K a).IsElliptic] : (elevenExceptional K a).j = (11155375*a+3126750)/32 := by sorry

/-- Replacing a by 1−a is the coefficientwise quadratic conjugation. -/
example (K : Type*) [Field K] (a : K) (f : K →+* K) (h : f a = 1-a) : (elevenExceptional K a).map f = elevenExceptional K (1-a) := by sorry

/-- The exceptional j-value is nonrational, requiring the residual-image route. -/
example (K : Type*) [Field K] [CharZero K] (a : K) (h : a^2-a+3 = 0) [(elevenExceptional K a).IsElliptic] : ∀ q : ℚ, (elevenExceptional K a).j ≠ (q : K) := by sorry

/-! ## Layer 7: Bielliptic quartics and quadratic divisors -/

/-- The first homogeneous quartic in variables X,Y,Z indexed 0,1,2
(CN Proposition 7.4.3(1), p.100). -/
def quartic1 : MvPolynomial (Fin 3) ℚ :=
  let X : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 0
  let Y : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 1
  let Z : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 2
  (9*X^4+19*X^2*Y^2+Y^4+9*X^3*Z+19*X^2*Y*Z+22*X*Y^2*Z+2*Y^3*Z+10*X^2*Z^2+22*X*Y*Z^2+13*Y^2*Z^2+7*X*Z^3+12*Y*Z^3+11*Z^4)

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,0,1] quartic1 = 11 := by sorry

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![1,0,0] quartic1 = 9 := by sorry

/-- The first quartic has value one on the Y-coordinate basis vector. -/
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,1,0] quartic1 = 1 := by sorry

/-- The homogeneous coordinate map (X,−Y−Z,Z). Projective
automorphism and modular quotient comparisons need quartic_models. -/
def quartic1Coordinates {K : Type*} [CommRing K] (v : Fin 3 → K) : Fin 3 → K := ![v 0,-v 1-v 2,v 2]

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : quartic1Coordinates (![0,1,0] : Fin 3 → ℚ) = ![0,-1,0] := by sorry

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : quartic1Coordinates (![0,0,1] : Fin 3 → ℚ) = ![0,-1,1] := by sorry

/-- The first coordinate involution fixes the X-coordinate basis vector. -/
example : quartic1Coordinates (![1,0,0] : Fin 3 → ℚ) = ![1,0,0] := by sorry

/-- The second homogeneous quartic over ℚ (CN Proposition 7.4.3(2),
p.100); its smooth plane curve is specified by quartic_models. -/
def quartic2 : MvPolynomial (Fin 3) ℚ :=
  let X : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 0
  let Y : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 1
  let Z : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 2
  (-X^4+2*X^3*Y+X^2*Y^2+8*X^3*Z+2*X^2*Y*Z-2*X*Y^2*Z-Y^3*Z-3*X^2*Z^2-3*X*Y*Z^2+3*Y^2*Z^2+2*X*Z^3-3*Y*Z^3+Z^4)

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,0,1] quartic2 = 1 := by sorry

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![-3,7,1] quartic2 = 0 := by sorry

/-- The second quartic vanishes at the rational triple (0,1,1). -/
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,1,1] quartic2 = 0 := by sorry

/-- The homogeneous transformation (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z).
Its square is 25 times the identity, not the identity on vectors. -/
def quartic2Coordinates {K : Type*} [CommRing K] (v : Fin 3 → K) : Fin 3 → K := ![3*v 0+v 1+2*v 2,8*v 0+v 1-8*v 2,4*v 0-2*v 1+v 2]

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : quartic2Coordinates (![0,1,0] : Fin 3 → ℚ) = ![1,1,-2] := by sorry

/-- Evaluation on the displayed coordinates fixes the source normalization. -/
example : quartic2Coordinates (![0,0,1] : Fin 3 → ℚ) = ![2,-8,1] := by sorry

/-- The second transformation sends the X-coordinate basis vector to (3,8,4). -/
example : quartic2Coordinates (![1,0,0] : Fin 3 → ℚ) = ![3,8,4] := by sorry

/-- The two coordinate involutions preserve their homogeneous zero loci. The
second scales vectors by 25 on squaring and its quartic by 625 (CN Proposition
7.4.3(1)–(2), p.100); projectivization is a separate geometric comparison. -/
theorem quartic_involutions (K : Type*) [CommRing K] [Algebra ℚ K]
    (v : Fin 3 → K) :
    quartic1Coordinates (quartic1Coordinates v) = v ∧
    MvPolynomial.eval₂ (algebraMap ℚ K) (quartic1Coordinates v) quartic1 =
      MvPolynomial.eval₂ (algebraMap ℚ K) v quartic1 ∧
    quartic2Coordinates (quartic2Coordinates v) = (fun j => 25 * v j) ∧
    MvPolynomial.eval₂ (algebraMap ℚ K) (quartic2Coordinates v) quartic2 =
      625 * MvPolynomial.eval₂ (algebraMap ℚ K) v quartic2 := by sorry

/-- The two affine-normalized triples over s²=−55 (CN Proposition
7.4.3(3), p.100). Their modular j-values require the assumed j-map comparison. -/
def quarticImaginaryPoints (K : Type*) [Field K] (s : K) : (Fin 3 → K) × (Fin 3 → K) := (![(1+s)/28,(27-s)/56,1], ![(3-s)/4,(3+3*s)/4,1])

/-- Both triples satisfy the literal second quartic when s²=−55.
This polynomial identity does not assert their modular j-value. -/
theorem quarticImaginaryPoints_on_curve (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) : MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).1 quartic2 = 0 ∧ MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).2 quartic2 = 0 := by sorry

/-- The first exceptional triple satisfies the quartic after reducing s²=−55. -/
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) : MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).1 quartic2 = 0 := by sorry

/-- The second exceptional triple satisfies the quartic after reducing s²=−55. -/
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) :
    MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).2 quartic2 = 0 := by sorry

/-- Both triples are distinct, nonrational and have Z=1 in characteristic zero. -/
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) : (quarticImaginaryPoints K s).1 ≠ (quarticImaginaryPoints K s).2 ∧ (quarticImaginaryPoints K s).1 2 = 1 ∧ (quarticImaginaryPoints K s).2 2 = 1 ∧ (∀ q : ℚ, (quarticImaginaryPoints K s).1 0 ≠ (q : K)) ∧ (∀ q : ℚ, (quarticImaginaryPoints K s).2 0 ≠ (q : K)) := by sorry

/-! ## Layer 8: Imaginary-quadratic modularity applications -/

/-- For d=1,2,3,5 the explicit elliptic model has finitely many points over
ℚ(√−d), assuming finite generation and the stated rank-zero input
(CN §1, p.2). The all-curves modularity endpoint also needs the
modular comparison and finite_level_fifteen_modularity in the README. -/
theorem small_imaginary_quadratic_level_fifteen_finite
    (F : Type*) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2)
    (d : ℕ) (hd : d = 1 ∨ d = 2 ∨ d = 3 ∨ d = 5)
    (s : F) (hs : s ^ 2 = -(d : F))
    [AddGroup.FG (E15.toAffine.baseChange F).Point]
    (hRankZero : Module.finrank ℚ
      (TensorProduct ℤ ℚ (E15.toAffine.baseChange F).Point) = 0) :
    Finite (E15.toAffine.baseChange F).Point := by sorry

/-- The point (−1,6√−10) on the actual level-fifteen model is nonrational
and nontorsion under the stated torsion input, so the point group is infinite.
Its compactified modular interpretation uses LevelFifteenModels (CN p.93; explicit substitution). -/
theorem sqrt_minus_ten_infinite_level_fifteen
    (F : Type*) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2)
    (s : F) (hs : s ^ 2 = -10) (hTorsion : QuadraticLevelFifteenTorsion F) :
    ∃ h : (E15.toAffine.baseChange F).Equation (-1) (6 * s),
      ¬ IsOfFinAddOrder (WeierstrassCurve.Affine.Point.mk h) ∧
      (∀ q : ℚ, 6 * s ≠ (q : F)) ∧
      Infinite (E15.toAffine.baseChange F).Point := by sorry

/-- Dropping √−10 from the y-coordinate fails the equation. -/
example (F : Type*) [Field F] [NumberField F] (s : F) (hs : s ^ 2 = -10) :
    (E15.toAffine.baseChange F).Equation (-1) (6 * s) ∧
    ¬ (E15.toAffine.baseChange F).Equation (-1) 6 := by sorry

/-
The remaining README targets use automorphic, compactified modular-curve,
symmetric-power and Jacobian carriers: Modular,
quarticTorsionClasses, B_mordell_weil as an arithmetic hypothesis,
the CM/switching endpoints, the geometric model and
j-map comparisons, the divisor/sieve endpoints and the final modularity theorems.
-/

/-
README API targets and input projections whose signatures are specified in prose.
These names are not additional Lean declarations; each uses the hypotheses of
its cited definition or arithmetic-input contract.

README §5.1:
  E15_baseChange, E15_coefficients
  E15_discriminant, Es35_baseChange
  Es35_coefficients, Es35_discriminant

README §4.2:
  b3J_eval, b3J_fraction
  b3J_intDegree, b5J_eval
  b5J_fraction, b5J_intDegree
  ns3J_eval, ns3J_fraction
  ns3J_intDegree, ns5J_eval
  ns5J_fraction, ns5J_intDegree
  s3J_eval, s3J_fraction
  s3J_intDegree

README §6.1:
  b3ns5Sextic_degree, b3ns5Sextic_formula

README §0.2:
  discriminant_coupling

README §6.3:
  elevenExceptional_coefficients

README §5.2:
  gaussianExceptional_coefficients

README §5.3:
  genusOneSpecialPoints_conjugate, genusOneSpecialPoints_coordinates
  ns3b5Quartic_degree, ns3b5Quartic_formula

README §7.1:
  quartic1Coordinates_coordinates, quartic1Coordinates_preserves
  quartic1Coordinates_square, quartic1_affine
  quartic1_formula, quartic1_homogeneous
  quartic2Coordinates_coordinates, quartic2Coordinates_preserves
  quartic2Coordinates_square, quartic2_affine
  quartic2_formula, quartic2_homogeneous

README §7.2:
  quarticImaginaryPoints_coordinates, quarticImaginaryPoints_j
-/

end
end TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic

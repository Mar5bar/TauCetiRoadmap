import Mathlib
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Adjugate

/-! # PerfectoidShimuraVarieties: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs and is not exhaustive. The roadmap supplies
the geometric targets, exact hypotheses, source locators and checks.

The explicit choices are the genus-one multiplier identity, trace normalization
by the actual nonzero degree, the row-graph quotient frame, the determinant-scaled
inverse in the Hilbert level action, and the hypotheses of parabolic double-coset
cancellation. FiniteLevel, MatrixChart and Coefficients name the algebraic portions of
the corresponding geometric statements, with their coefficient hypotheses recorded
in README.md.
-/

/-! ## Layer 0: the genus-one similitude identity -/

namespace GSp
open Matrix

/-- Every invertible two-by-two matrix preserves the alternating form up to its determinant. -/
theorem gsp_genusOne (R : Type*) [CommRing R] (γ : GL (Fin 1 ⊕ Fin 1) R) :
    (γ : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R) * J (Fin 1) R *
      (γ : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R)ᵀ =
    (γ : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R).det • J (Fin 1) R := sorry

end GSp

/-! ## Layer 0.general: general-data and toroidal diamonds -/

/-- The transformed genus-two cusp ray fails the perfect-cone inequality. -/
example : let Q : Matrix (Fin 2) (Fin 2) ℤ := !![4, -2; -2, 1]
    Q = Matrix.vecMulVec (![2, -1] : Fin 2 → ℤ) (![2, -1] : Fin 2 → ℤ) ∧
      Q 1 1 < |Q 0 1| := by decide

/-! ## Layer 1: the Siegel construction -/

namespace SiegelTorsion.FiniteLevel

variable (K A : Type*) [Field K] [CharZero K] [CommRing A] [Algebra K A]
    [Module.Free K A] [Module.Finite K A] [Nontrivial A]

/-- Normalized trace at a finite free algebra level: degree inverse times the ordinary trace.
Characteristic zero and nontriviality make the finite degree nonzero. -/
noncomputable def normalizedTrace : A →ₗ[K] K :=
  (Module.finrank K A : K)⁻¹ • Algebra.trace K A


/-- The trace divided by the extension degree retracts the scalar embedding. -/
theorem normalizedTrace_algebraMap (a : K) : normalizedTrace K A (algebraMap K A a) = a := sorry


/-- Test normalizedTrace_identity_level. -/
example (x : K) : normalizedTrace K K x = x := sorry

/-- Test normalizedTrace_not_unnormalized: a split degree-two algebra detects the factor. -/
example (a : K) : Algebra.trace K (K × K) (a, a) = 2 * a ∧
    normalizedTrace K (K × K) (a, a) = a := sorry


end SiegelTorsion.FiniteLevel

/-! ## Layer 3: Hodge-type period maps and coefficients -/

namespace HodgeTate.MatrixChart

open Matrix

variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- The factor of automorphy `A + ZC` of `γ = (A B; C D)` at the chart point `Z`. -/
def chartFactor (A C Z : Matrix g g R) : Matrix g g R := A + Z * C

/-- The chart action `Z·γ = (A + ZC)⁻¹(B + ZD)`. -/
noncomputable def chartAction (A B C D Z : Matrix g g R) : Matrix g g R :=
  (chartFactor A C Z)⁻¹ * (B + Z * D)

/-- `(1 Z)γ = (A + ZC)(1  Z·γ)` whenever `A + ZC` is invertible. -/
theorem siegelGraphChart_act (A B C D Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    Matrix.fromCols (1 : Matrix g g R) Z * Matrix.fromBlocks A B C D =
      chartFactor A C Z * Matrix.fromCols 1 (chartAction A B C D Z) := sorry

/-- Check: `graph_factor_identity` (degenerate): for `γ = 1`, `A + ZC = 1` and `Z·γ = Z`. -/
example (Z : Matrix g g R) : chartFactor 1 0 Z = 1 ∧ chartAction 1 0 0 1 Z = Z := sorry

/-- Check: `graph_factor_g1` (computation): for `g = 1`,
`(1 z)γ = (a + zc)(1, (b + zd)/(a + zc))`. -/
example {K : Type*} [Field K] (a b c d z : K) (h : a + z * c ≠ 0) :
    chartFactor !![a] !![c] !![z] = !![a + z * c] ∧
      chartAction !![a] !![b] !![c] !![d] !![z] = !![(b + z * d) / (a + z * c)] := sorry

/-- Check: `graph_factor_cocycle` (characterisation): the factor of `γγ'` at `Z` is the factor
of `γ` at `Z` times the factor of `γ'` at `Z·γ`. -/
example (A B C D A' B' C' D' Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    chartFactor (A * A' + B * C') (C * A' + D * C') Z =
      chartFactor A C Z * chartFactor A' C' (chartAction A B C D Z) := sorry

/-- Check: `graph_unit_needs_iwahori` (non-example): for `g = 1`, `γ = (0 1; 1 0)` and `z = 0`
the factor `a + zc` is `0`, not a unit. -/
example {K : Type*} [Field K] : ¬ IsUnit (chartFactor (0 : Matrix (Fin 1) (Fin 1) K) 1 0).det := by
  simp [chartFactor]

/-- integral form: if `C ≡ 0 mod p` and `A` is invertible, then for every
integral `Z` the determinant of `A + ZC` is congruent to `det A` modulo `p`, hence a unit of
`ℤ_p`. -/
theorem det_factor_isUnit (p : ℕ) [Fact p.Prime] (A C Z : Matrix g g ℤ_[p])
    (hC : ∀ i j, PadicInt.toZMod (C i j) = 0) (hA : IsUnit A.det) :
    IsUnit (chartFactor A C Z).det ∧
      PadicInt.toZMod (chartFactor A C Z).det = PadicInt.toZMod A.det := sorry

end HodgeTate.MatrixChart

namespace HodgeTate.MatrixChart
open Matrix
variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- Symmetric-matrix portion of the Siegel chart; graphDistanceDomain supplies its pointwise distance subset, before its analytic affinoid realization. -/
def siegelGraphChart := {Z : Matrix g g R // Zᵀ = Z}

/-- The quotient frame represented by the row matrix `(1,Z)`, before analytic pullback. -/
def hodgeFrame (Z : Matrix g g R) : ((g ⊕ g) → R) →ₗ[R] (g → R) :=
  (fromCols 1 Z).mulVecLin


/-- Matrix part of hodgeFrame_transform. The W-dual frame and the Tate line's transported
linearization are distinct and are not silently identified with this quotient frame. -/
theorem hodgeFrame_transform (A B C D Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    (hodgeFrame Z).comp (fromBlocks A B C D).mulVecLin =
      (chartFactor A C Z).mulVecLin.comp (hodgeFrame (chartAction A B C D Z)) := sorry

/-- Test graph_chart_lagrangian: omitting symmetry would give nonisotropic row graphs. -/
example (Z : Matrix g g R) :
    fromCols (1 : Matrix g g R) Z * J g R * (fromCols (1 : Matrix g g R) Z)ᵀ = 0 ↔ Zᵀ = Z := sorry

/-- Test FL_parabolic_pinned, row-space obstruction: the same upper-parabolic coset
has distinct first rows. This witnesses why the pinned lower parabolic is essential. -/
example : let u : Matrix (Fin 2) (Fin 2) ℚ := !![1, 1; 0, 1]
    u 0 1 = 1 ∧ (1 : Matrix (Fin 2) (Fin 2) ℚ) 0 1 = 0 ∧ u 1 0 = 0 := by decide

/-- Test hodge_frame_similitude, genus-one coefficient: the dual `W` factor is `a/c=1/d`.
This tests the additional multiplier, not a natural untwisted Tate linearization. -/
example {K : Type*} [Field K] (a d : K) (ha : a ≠ 0) (hd : d ≠ 0) :
    (a * d)⁻¹ * a = d⁻¹ := sorry

end HodgeTate.MatrixChart

namespace HodgeTate.MatrixChart
open Matrix
section PadicDistance
variable {g : Type*} [Fintype g] [DecidableEq g] (p : ℕ) [Fact p.Prime]
variable (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K]

/-- Pointwise distance-to-integral domain over a normed p-adic extension. This is an actual
subset of matrices, not an analytic affinoid carrier. Distance is from all of `ℤ_p`. -/
def graphDistanceDomain (r : ℝ) : Set (Matrix g g K) :=
  {Z | Zᵀ = Z ∧ ∀ i j, Metric.infDist (Z i j)
    (Set.range (fun x : ℤ_[p] => algebraMap ℚ_[p] K (x : ℚ_[p]))) ≤ r}

/-- At radius zero, the compact embedded integral subset is recovered. Over an extension,
a norm-at-most-one element need not lie in the image of `ℤ_p`. -/
theorem graphDistanceDomain_zero (Z : Matrix g g K) :
    Z ∈ graphDistanceDomain p K 0 ↔ Zᵀ = Z ∧
      ∀ i j, ∃ x : ℤ_[p], algebraMap ℚ_[p] K (x : ℚ_[p]) = Z i j := sorry

/-- Pointwise stability of the distance domain. Strict Iwahori blocks are supplied
as their actual integral matrices; symmetry requires the GSp condition. -/
theorem siegelGraphChart_stable [Nonempty g] [IsUltrametricDist K]
    (r : ℝ) (hr : 0 < r) (hr1 : r ≤ 1)
    (γ : GL (g ⊕ g) ℤ_[p])
    (hγ : ∃ c : ℤ_[p]ˣ, (γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]) * J g ℤ_[p] *
      (γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p])ᵀ = (c : ℤ_[p]) • J g ℤ_[p] ∧
      PadicInt.toZMod (c : ℤ_[p]) = 1)
    (hdiag : ∀ i j, i ≠ j → PadicInt.toZMod
      ((γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]) i j) = 0)
    (A B C D : Matrix g g K)
    (hblocks : ((γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]).map
      (fun x => algebraMap ℚ_[p] K (x : ℚ_[p]))) = fromBlocks A B C D)
    (Z : Matrix g g K) (hZ : Z ∈ graphDistanceDomain p K r) :
    chartAction A B C D Z ∈ graphDistanceDomain p K r := sorry

/-- The zero graph belongs to every nonnegative radius domain. -/
example (r : ℝ) (hr : 0 ≤ r) : (0 : Matrix g g K) ∈ graphDistanceDomain p K r := sorry

/-- Integral unit translations in genus one stay in the zero-radius domain. A disc
centered only at zero fails this test for a unit translation at radius less than one. -/
example (a : ℤ_[p]) :
    (!![algebraMap ℚ_[p] K (a : ℚ_[p])] : Matrix (Fin 1) (Fin 1) K) ∈
      graphDistanceDomain p K 0 := sorry

/-- All symmetric integral matrices belong to the zero-radius domain. -/
example (Z : Matrix g g ℤ_[p]) (hZ : Zᵀ = Z) :
    Z.map (fun x => algebraMap ℚ_[p] K (x : ℚ_[p])) ∈ graphDistanceDomain p K 0 := sorry

end PadicDistance
end HodgeTate.MatrixChart

/-! ## Layer 5: modular and Hilbert towers -/

namespace HilbertTower.Coefficients
open Matrix
variable {R : Type*} [CommRing R]


/-- Matrix portion of the Hilbert level action: precompose the level map with `γ^∨`.
This is a left action; it lies over the right tower translation by `γ^∨`. -/
def levelAction (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) : Matrix (Fin 2) (Fin 2) R :=
  α * (TauCeti.adjugateGL γ : Matrix (Fin 2) (Fin 2) R)

/-- Left level changes compose in the order of matrix multiplication. -/
theorem levelAction_mul (γ δ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    levelAction (γ * δ) α = levelAction γ (levelAction δ α) := sorry

/-- The determinant pairing scales by the determinant under a level change. -/
theorem pairingCoefficient_level (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    (levelAction γ α).det = (γ : Matrix (Fin 2) (Fin 2) R).det * α.det := sorry

/-- Change of the target generator `β` to `uβ` divides its pairing coefficient by `u`. -/
def pairingChangeGenerator (u : Rˣ) (coefficient : R) : R := (u⁻¹ : Rˣ) * coefficient

/-- Changing the chosen torsion generator by a unit divides its pairing coordinate by that unit. -/
theorem pairingCoefficient_changeGenerator (u : Rˣ) (coefficient : R) :
    (u : R) * pairingChangeGenerator u coefficient = coefficient := sorry


/-- Test levelAction_adjugate: diagonal `(a,d)` dualizes to diagonal `(d,a)`. -/
example (γ : GL (Fin 2) R) (a d : R) (hγ : (γ : Matrix (Fin 2) (Fin 2) R) = !![a, 0; 0, d]) :
    (TauCeti.adjugateGL γ : Matrix (Fin 2) (Fin 2) R) = !![d, 0; 0, a] := sorry

/-- Test levelAction_vs_rightTranslation, matrix portion: the multiplier is the dual,
which is not `γ` for a nonscalar diagonal. -/
example : (6 : ℚ) • (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ)⁻¹ ≠
    (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) := sorry


/-- The identity level change fixes every coefficient matrix. -/
example (α : Matrix (Fin 2) (Fin 2) R) : levelAction 1 α = α := sorry

/-- Rescaling the target generator by 2 changes the coordinate 6 to 3. -/
example : pairingChangeGenerator (Units.mk0 (2 : ℚ) (by norm_num)) 6 = 3 := by
  norm_num [pairingChangeGenerator]

end HilbertTower.Coefficients

/-! ## Layer 6: general period maps and abelian descent -/

/-! ### Conditional double-coset identity

The two factorizations of `H` are additional hypotheses. A rational Iwahori decomposition
does not supply them for a parabolic defined only over a splitting field.
-/

namespace AnalyticLevelGroup

/-- If `H` factors in both parabolic/opposite-unipotent orders and `t` lies in `P` and normalises the opposite subgroup, the parabolic part of `HtH` equals `(H∩P)t(H∩P)`. -/
theorem doubleCoset_inf_parabolic {G : Type*} [Group G] (P Ubar H : Subgroup G)
    (hPU : P ⊓ Ubar = ⊥) (t : G) (htP : t ∈ P) (ht : ∀ u ∈ Ubar, t⁻¹ * u * t ∈ Ubar)
    (hfac : ∀ h ∈ H, ∃ a ∈ H ⊓ P, ∃ b ∈ H ⊓ Ubar, h = a * b)
    (hfac' : ∀ h ∈ H, ∃ b ∈ H ⊓ Ubar, ∃ a ∈ H ⊓ P, h = b * a)
    {k k' : G} (hk : k ∈ H) (hk' : k' ∈ H) (hP : k * t * k' ∈ P) :
    ∃ a ∈ H ⊓ P, ∃ a' ∈ H ⊓ P, k * t * k' = a * t * a' := sorry

/-- The cancelled factors: with `t = 1`, `k = u` and `k' = u⁻¹` the product lies in every `P`,
whatever `u` is, so membership in `P` cannot force the factors to be `1`. -/
example {G : Type*} [Group G] (P : Subgroup G) (u : G) : u * 1 * u⁻¹ ∈ P := by simp

end AnalyticLevelGroup

/-- With `P` trivial and `H` and the opposite subgroup equal to `G`, the two factorizations
hold. For `t` different from `1` the parabolic-membership premise holds with `k = t⁻¹, k′ = 1`,
but the conclusion fails. Thus the condition `t ∈ P` is necessary. -/
example {G : Type*} [Group G] (t : G) (ht : t ≠ 1) :
    t⁻¹ * t * 1 ∈ (⊥ : Subgroup G) ∧
      ¬ (∃ a ∈ (⊥ : Subgroup G), ∃ a' ∈ (⊥ : Subgroup G),
        t⁻¹ * t * 1 = a * t * a') := by
  simp [Ne.symm ht]

/-- Opposite unipotent cancellation: nonidentity upper-unipotent elements can cancel.
Thus membership of a product in a parabolic cannot force both factors to be the identity. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) * !![1, -1; 0, 1] = 1 ∧
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) ≠ 1 := by decide



/-! The following geometric definitions and their APIs remain in README.md:

Layer 0: GSp.gsp, similitude, reduce, levelGamma, levelGamma1, levelGamma0,
unitReductionKernel, similitude_spec, levelGamma_le_levelGamma1, levelGamma_normal,
levelGamma_cofinal, levelGamma_genusOne, similitude_levelGamma0,
and their group and cofinality APIs (§0.1); ShimuraTower.pLevel, pLevelMin, toMin, translate, primeToPHecke,
quotientAction, infiniteLevel, infiniteLevelMin, infiniteLevel.proj,
PerfectoidRepresentative (diamondIso, ofDiamondIso), neutralComponent,
neutralComponent.toFull, neutralSymmetry, connectedDatumTower, Rigidified
(quotientIso, infiniteLevel, trivial).
Layer 0.general: ShimuraTower.generalInfiniteLevel, toroidal,
toroidalInfiniteLevel (openEmbedding, toMin, refine).
Layer 1: SiegelTorsion.strictIwahori (§1.11), SiegelTorsion.integralMin, hasseDomain, finiteLevel, finiteLevel_hasse,
GoodTriple (of_hasse_chart), SiegelTorsion.anticanonical,
anticanonical_integralModel, normalizedTrace and normalizedTrace_linear on completed tower rings,
htMapTop, htMap, openTower. The completed trace Checks
normalizedTrace_g1_monomial and normalizedTrace_traceCompatibility are in §1.16.
Layer 2: HodgeTower.embedding, toSiegel, imageCompactification, minToImage.
Layer 3: HodgeTate.FL, leviTorsor, associatedBundle, associatedBundle_tensor,
the analytic siegelGraphChart, graphDistanceDomain and pulled-back hodgeFrame.
Layer 4: ShimuraTower.PropertyP, ConnectedPropertyP, propertyP_hodge.
Layer 5: HilbertTower.geometric, intermediate, arithmetic, beta1, beta2,
the geometric levelAction, polAction, weilPairing, weilPairing_arith, qpAction.
Layer 6: AbelianType.hodgeCover, lovering, deltaGroup; LevelGroup.mk;
BruhatTube.mk; the logarithmic, de Rham and Hodge–Tate torsors.
-/

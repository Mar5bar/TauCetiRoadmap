import Mathlib

/-!
# Locally analytic distributions, growth and character spaces: suggested Lean forms

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`, and §k.n below refers to its subsections. The file records the light definitions with
real bodies, the end theorems and layer milestones that can be stated against the pinned Mathlib
and Tau Ceti, and checks that fix the conventions. Theorems are stated with `sorry` proofs; nothing
here is claimed formalised.

Coefficient spaces are Mathlib's `ZeroAtInftyContinuousMap` on a discrete index type (`C₀(I, A)`),
with input index first and output index second; `c0Single i a` is its finitely supported element.
Complete continuity over a normed commutative ring `A` is approximation in operator norm by maps
with finitely generated `A`-image, not finite `K`-rank, and is never identified with Mathlib's
`IsCompactOperator`. Open-disc and entire series are Mathlib power series that are
`PowerSeries.IsRestricted` at every radius below one, respectively every positive radius; their
Gauss norms are Mathlib's `PowerSeries.gaussNorm`. The Fredholm series of an operator on `C₀(I, A)`
is the signed sum of principal minors, with constant coefficient `1`; the finite spectral transform
is Mathlib's bounded `Polynomial.resultant` of the reflected characteristic polynomial and
`1 - T B(Y)`.

The README states, and this file omits because their carriers are not at the pins: the
nonarchimedean locally convex categories, their left hearts and completed tensor products; the
spaces `LA_h`, `LA` and `D` with their pullbacks, pushforwards, products and convolution; `C^r`,
order-`r` distributions and vector order; the global Amice and Mellin equivalences and the
character spaces; finite coordinate projections and bounded-family extension on `c₀`; the Fredholm
determinant of a `(Pr)` module, the Fredholm resolvent, its Hasse derivatives and the Riesz
projectors; the entire-series subring and its quotients; the Coleman entire spectral transform and
entire operator evaluation; specialization of distribution families and the universal-character
action; characteristic products of complexes, slope decompositions, finite-slope windows and the
torus slope adapters.
-/

namespace TauCetiRoadmap.LocallyAnalyticDistributions

noncomputable section
open Filter Topology
open scoped ZeroAtInfty AbstractMeasure

/-! ## Layer 0: analytic Banach stages, locally analytic functions and their strong duals -/

namespace LocallyAnalytic.SuggestedTest

/-- §0.1 (Amice's theorem on Mahler coefficients): `v_3((3²)!) = (3² − 1)/(3 − 1) = 4`, the
normalising factor of `C(x, 9)` in `LA₀`. -/
example : Nat.factorial 9 % 3 ^ 4 = 0 ∧ Nat.factorial 9 % 3 ^ 5 ≠ 0 := by
  norm_num [Nat.factorial]

/-- §0.1 check `maximum_not_L_points`: `X³ − X` has Gauss norm one on the unit disc but is bounded
by `1/3` on `ℤ_3`, so the maximum principle uses `ℂ_p`-points, not coefficient-field points. -/
example : (Polynomial.X ^ 3 - Polynomial.X : Polynomial ℤ_[3]).coeff 3 = 1 ∧
    ∀ x : ℤ_[3], ‖x ^ 3 - x‖ ≤ (1 / 3 : ℝ) := by sorry

end LocallyAnalytic.SuggestedTest

namespace NonarchimedeanFredholm

section Coefficients

variable {E : Type*} [TopologicalSpace E] [Zero E]
variable {I : Type*} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

/-- §0.3 and §4.1: the finitely supported element of Mathlib's `C₀(I, E)` with value `a` at `i` and
zero elsewhere; `c0Single i 1` is the basis vector `e_i` and supplies the chart monomials of the
analytic stages. -/
def c0Single (i : I) (a : E) : C₀(I, E) where
  toFun := Pi.single i a
  continuous_toFun := continuous_of_discreteTopology
  zero_at_infty' := by
    refine tendsto_const_nhds.congr' ?_
    filter_upwards [(isCompact_singleton (x := i)).compl_mem_cocompact] with j hj
    rw [Set.mem_compl_singleton_iff] at hj
    simp [hj]

/-- §0.3: a monomial on one chart has its single specified coefficient. -/
theorem c0Single_apply (i j : I) (a : E) : c0Single i a j = if j = i then a else 0 := by
  sorry

/-- §4.1 check `single_selected`. -/
example {A : Type*} [NormedCommRing A] (i : I) (a : A) : c0Single i a i = a := by
  simp [c0Single]

/-- §4.1 check `single_norm`: the sup norm detects the coefficient, not the support size. -/
example {A : Type*} [NormedCommRing A] (i : I) (a : A) : ‖c0Single i a‖ = ‖a‖ := by sorry

end Coefficients

section CoefficientAction

variable {A : Type*} [NormedCommRing A] {I : Type*} [TopologicalSpace I]

/-- §4.1 (Bounded coefficient action on c0): the pointwise `A`-action on `C₀(I, A)` satisfies
`‖a • x‖ ≤ ‖a‖ * ‖x‖`; Mathlib has no `IsBoundedSMul A C₀(I, A)` instance at the pin. -/
theorem c0_norm_smul_le (a : A) (x : C₀(I, A)) : ‖a • x‖ ≤ ‖a‖ * ‖x‖ := by sorry

/-- §4.1: consequently the pointwise action is jointly continuous for the sup norm. -/
theorem c0_continuousSMul : ContinuousSMul A C₀(I, A) := by sorry

/-- §4.1 check `scalar_single`. -/
example [DiscreteTopology I] [DecidableEq I] (i : I) (a b : A) :
    a • c0Single i b = c0Single i (a * b) := by sorry

end CoefficientAction

end NonarchimedeanFredholm

namespace NonarchimedeanTopologyTests

variable {K : Type*} [NontriviallyNormedField K]

/-- §0.0 check `naTopology_product`: in `K^ℕ` the unit vectors tend to zero coordinatewise. -/
example : Tendsto (fun n : ℕ => fun i : ℕ => if i = n then (1 : K) else 0) atTop (𝓝 0) := by
  sorry

/-- §0.0 check `naTopology_product`, continued: in the sup-norm `c₀` they do not. -/
example : ¬ Tendsto (fun n : ℕ => NonarchimedeanFredholm.c0Single n (1 : K)) atTop (𝓝 0) := by
  sorry

/-- §0.0 check `strict_split_line`: the split kernel embedding is a strict map. -/
example : Topology.IsStrictMap (fun x : K => (x, (0 : K))) := by sorry

/-- §0.0 check `c0Tensor_infinite`: the constant array is excluded from `c₀`. -/
example : ¬ ∃ f : C₀(ℕ, K), ∀ n, f n = 1 := by sorry

/-- §0.0 check `projectiveTensor_completion`: the decaying diagonal lies in `c₀(ℕ × ℕ)` but is not
a finite sum of separated coefficient arrays. -/
example : (∃ f : C₀(ℕ × ℕ, ℚ_[3]), ∀ i j, f (i, j) = if i = j then (3 : ℚ_[3]) ^ i else 0) ∧
    ¬ ∃ (r : ℕ) (x y : Fin r → ℕ → ℚ_[3]), ∀ i j,
      (∑ k : Fin r, x k i * y k j) = if i = j then (3 : ℚ_[3]) ^ i else 0 := by sorry

end NonarchimedeanTopologyTests

/-! ## Layer 1: the unbounded Amice transform and operations on distributions -/

namespace LocallyAnalytic.SuggestedTest

/-- Convention 13 and §1.4 (The transpose derivative and logarithm): with `(dμ)(f) = μ(f′)`, the
degree-two coefficient of `log(1 + T)·(1 + aT + a(a − 1)T²/2)` is `a − 1/2`. -/
example (a : ℚ) :
    ((PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else ((-1 : ℚ) ^ (n + 1) / (n : ℚ)))) *
      (1 + PowerSeries.C a * PowerSeries.X +
        PowerSeries.C (a * (a - 1) / 2) * PowerSeries.X ^ 2)).coeff 2 = a - 1 / 2 := by sorry

end LocallyAnalytic.SuggestedTest

namespace Mellin

variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]

/-- §1.2 hypothesis (b): an open-disc series is restricted at every radius strictly below one. -/
def OnOpenDisc (F : PowerSeries K) : Prop :=
  ∀ R : ℝ, 0 < R → R < 1 → PowerSeries.IsRestricted R F

/-- §1.2: `E(F, t)`, Mathlib's scalar-series sum of the coefficients of `F`; convergence is
asserted only on the open unit disc. -/
abbrev evalOpen (F : PowerSeries K) (t : K) : K :=
  FormalMultilinearSeries.ofScalarsSum (fun n => F.coeff n) t

/-- §1.2: evaluation is the sum of the evaluated coefficients. -/
theorem evalOpen_def (F : PowerSeries K) (t : K) :
    evalOpen F t = ∑' n : ℕ, F.coeff n * t ^ n := by sorry

/-- §1.2: evaluation at zero is the constant coefficient. -/
theorem evalOpen_zero (F : PowerSeries K) : evalOpen F 0 = F.coeff 0 := by sorry

/-- §1.2: evaluation is additive for open-disc series inside the disc. -/
theorem evalOpen_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F + H) t = evalOpen F t + evalOpen H t := by sorry

/-- §1.2 (Open-disc series and the native analytic radius): the scalar formal multilinear series
of an open-disc series has radius at least one. -/
theorem openDisc_native_radius (F : PowerSeries K) (hF : OnOpenDisc F) :
    (1 : ENNReal) ≤ (FormalMultilinearSeries.ofScalars K (fun n => F.coeff n)).radius := by sorry

/-- §1.2 (Summability inside the open disc). -/
theorem openDisc_summable (F : PowerSeries K) (hF : OnOpenDisc F)
    (t : K) (ht : ‖t‖ < 1) : Summable (fun n : ℕ => F.coeff n * t ^ n) := by sorry

/-- §1.2 (Analytic evaluation of an open-disc series; Colmez Lemma II.2.1 and Theorem II.2.2,
p. 30). -/
theorem analyticOnNhd_evalOpen (F : PowerSeries K) (hF : OnOpenDisc F) :
    AnalyticOnNhd K (evalOpen F) {t : K | ‖t‖ < 1} := by sorry

/-- §1.2 (Evaluation preserves products inside the disc). -/
theorem evalOpen_mul (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F * H) t = evalOpen F t * evalOpen H t := by sorry

/-- §1.2 (Evaluation commutes with an isometric coefficient extension). -/
theorem evalOpen_map {L : Type*} [NontriviallyNormedField L] [CompleteSpace L]
    [IsUltrametricDist L] (φ : K →+* L) (hφ : Isometry φ)
    (F : PowerSeries K) (hF : OnOpenDisc F) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (PowerSeries.map φ F) (φ t) = φ (evalOpen F t) := by sorry

/-- §1.2 check `MellinEvalTests.geometric`: the geometric series evaluates to `(1 − t)⁻¹` inside
the disc. -/
example (t : K) (ht : ‖t‖ < 1) :
    evalOpen (PowerSeries.mk (fun _ => (1 : K))) t = (1 - t)⁻¹ := by sorry

/-- §1.2 check `MellinEvalTests.boundary` (non-example): no convergence is claimed on the boundary. -/
example : ¬ Summable (fun _ : ℕ => (1 : K)) := by sorry

end Mellin

namespace AnalyticStageTests

/-- §0.3 check `stagePullback_affine`: pulling `y²` back along `y = 1 + 3x` keeps all three
coefficients. -/
example : (Polynomial.X ^ 2 : Polynomial ℚ).comp (1 + 3 * Polynomial.X) =
    1 + 6 * Polynomial.X + 9 * Polynomial.X ^ 2 := by sorry

/-- §1.3 check `pushforward_derivative`: for `f(x) = 1 + 3x`, `f_*(dδ_0)` takes `y²` to `6`. -/
example : (((Polynomial.X ^ 2 : Polynomial ℚ).comp (1 + 3 * Polynomial.X)).derivative).eval 0 = 6 := by
  sorry

/-- §1.3 check `multiply_derivative`: `x·dδ_0 = δ_0` under the positive derivative convention,
witnessed on the constant test function. -/
example : (Polynomial.X : Polynomial ℚ).derivative.eval 0 = 1 := by simp

/-- §0.1 check `measureToDist_two_atoms`: `δ_0 − δ_1` has total mass zero but takes `x` to `−1`. -/
example : (Polynomial.X : Polynomial ℚ).eval 0 - Polynomial.X.eval 1 = -1 := by simp

end AnalyticStageTests

/-! ## Layer 2: admissible growth, vector order and uniqueness -/

namespace LocallyAnalytic.SuggestedTest

/-- §2.1 (The Amice–Vélu–Vishik extension and uniqueness theorem): `d^{N+1}δ₀` kills every
polynomial of degree `≤ N`, so uniqueness fails at `r = N + 1`. -/
example (P : Polynomial ℚ) (N : ℕ) (h : P.natDegree ≤ N) :
    Polynomial.derivative^[N + 1] P = 0 :=
  Polynomial.iterate_derivative_eq_zero (by omega)

/-- §2.1 check (Order zero is bounded measures): the normalised locally constant Haar functional
has mass `p⁻ⁿ` on a residue ball and is additive over its `p` sub-balls. -/
example (p : ℚ) (hp : p ≠ 0) (n : ℕ) : (p ^ n)⁻¹ = p * (p ^ (n + 1))⁻¹ := by
  field_simp
  ring

/-- §2.1 check, continued: those masses are unbounded in the `3`-adic norm, so additivity alone
does not give a bounded measure. -/
example : Tendsto (fun n : ℕ => ‖((3 : ℚ_[3]) ^ n)⁻¹‖) atTop atTop := by sorry

end LocallyAnalytic.SuggestedTest

namespace AnalyticDistributions

section Rectangles

variable {p : ℕ} [hp : Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K]
variable {g : ℕ}

/-- §2.2: the rectangular residue class with one conductor exponent per coordinate. -/
def padicBox (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : Set (Fin g → ℤ_[p]) :=
  {x | ∀ i, x i - a i ∈ Ideal.span ({(p : ℤ_[p]) ^ m i} : Set ℤ_[p])}

/-- §2.2: a finite product of residue classes is clopen. -/
theorem padicBox_isClopen (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : IsClopen (padicBox a m) := by
  have h : padicBox a m = ⋂ i, (fun x : Fin g → ℤ_[p] => x i - a i) ⁻¹'
      (Ideal.span ({(p : ℤ_[p]) ^ m i} : Set ℤ_[p]) : Set ℤ_[p]) := by
    ext x
    simp [padicBox]
  rw [h]
  refine isClopen_iInter_of_finite fun i => IsClopen.preimage ?_ (by fun_prop)
  have hball : (Ideal.span ({(p : ℤ_[p]) ^ m i} : Set ℤ_[p]) : Set ℤ_[p]) =
      Metric.closedBall 0 ((p : ℝ) ^ (-(m i : ℤ))) := by
    ext x
    simp [← PadicInt.norm_le_pow_iff_mem_span_pow]
  rw [hball]
  exact IsUltrametricDist.isClopen_closedBall _ (zpow_pos (by exact_mod_cast hp.out.pos) _).ne'

/-- §2.2: the locally constant indicator of a rectangular residue class. -/
def boxIndicator (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : LocallyConstant (Fin g → ℤ_[p]) K :=
  LocallyConstant.charFn K (padicBox_isClopen a m)

/-- §2.2 (Rectangular growth for a locally constant functional): a uniform bound
`‖μ(1_{a + ∏ p^{m_i}ℤ_p})‖ ≤ C·p^{Σ r_i m_i}` on all rectangular residue classes. -/
def RectangularGrowth (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K) (r : Fin g → ℝ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ a m, ‖μ (boxIndicator a m)‖ ≤ C * (p : ℝ) ^ (∑ i, r i * (m i : ℝ))

/-- §2.2: increasing each component of the order preserves the bound. -/
theorem rectangularGrowth_mono (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r s : Fin g → ℝ) (h : ∀ i, r i ≤ s i) (hμ : RectangularGrowth μ r) :
    RectangularGrowth μ s := by sorry

/-- §2.2: a sum of two functionals of growth `≤ r` has growth `≤ r`. -/
theorem rectangularGrowth_add (μ ν : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r : Fin g → ℝ) (hμ : RectangularGrowth μ r) (hν : RectangularGrowth ν r) :
    RectangularGrowth (μ + ν) r := by sorry

/-- §2.2 check `rectangularGrowth_dirac`: a point mass has every nonnegative growth order. -/
example (a : Fin g → ℤ_[p]) (r : Fin g → ℝ) (hr : ∀ i, 0 ≤ r i) :
    RectangularGrowth (LocallyConstant.evalₗ K a) r := by sorry

/-- §2.2 check `rectangularGrowth_refinement`: a box mass is the sum of its `p` children in one
coordinate. -/
example (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) (i : Fin g) :
    μ (boxIndicator a m) = ∑ j : Fin p,
      μ (boxIndicator (Function.update a i (a i + (j.val : ℤ_[p]) * (p : ℤ_[p]) ^ m i))
        (Function.update m i (m i + 1))) := by sorry

end Rectangles

end AnalyticDistributions

namespace GrowthTests

/-- §2.1 check `Cr_mahler_iff`: the sparse Mahler coefficients `3^k` tend to zero, but their
`C¹`-weighted valuations `k − ℓ(3^k)` stay `−1`. -/
example : Tendsto (fun k : ℕ => (3 : ℚ_[3]) ^ k) atTop (𝓝 0) ∧
    ∀ k : ℕ, (k : ℤ) - (k + 1) = -1 := by sorry

/-- §2.1 check `digit_doubling_not_C2` at `p = 3`: the two `C²` Taylor ratios are `1` and `1/2`. -/
example : (1 : ℚ_[3]) ≠ (2 : ℚ_[3]) / (2 : ℚ_[3]) ^ 2 := by norm_num

/-- §2.1 check `digit_doubling_not_C2` at `p = 2`: the ratios are `1` and `5/9`. -/
example : (1 : ℚ_[2]) ≠ (5 : ℚ_[2]) / (3 : ℚ_[2]) ^ 2 := by norm_num

end GrowthTests

/-! ## Layer 3: character spaces and Mellin transforms -/

namespace Mellin

variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]

section Components

variable {G Δ : Type*} [TopologicalSpace G] [CompactSpace G]
  [Fintype Δ] [TopologicalSpace Δ] [DiscreteTopology Δ]

/-- §3.1 (Mellin series on a finite-character component; RJW Remark 3.47, pp. 25–26): for a chart
`H : G ≃ Δ × ℤ_p`, a value function `ν : Δ → K` and a bounded measure `μ`, the series
`Σ_n μ(g ↦ ν(H(g)_Δ)·binom(H(g)_ℤ, n)) Tⁿ`. -/
def componentMellin (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (μ : AbstractMeasure G K K) :
    PowerSeries K :=
  PowerSeries.mk fun n =>
    μ ⟨fun g => ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2), by fun_prop⟩

omit [CompleteSpace K] [IsUltrametricDist K] [CompactSpace G] [Fintype Δ] in
/-- §3.1: the `n`th coefficient is `μ(ν ∘ H_Δ · binom(H_ℤ, n))`. -/
theorem componentMellin_coeff (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (n : ℕ) :
    (componentMellin H ν μ).coeff n = μ ⟨fun g =>
      ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2), by fun_prop⟩ :=
  PowerSeries.coeff_mk _ _

/-- §3.1: `F_{μ+η} = F_μ + F_η`. -/
theorem componentMellin_add (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (μ η : AbstractMeasure G K K) :
    componentMellin H ν (μ + η) = componentMellin H ν μ + componentMellin H ν η := by sorry

/-- §3.1: `F_{aμ} = a·F_μ`. -/
theorem componentMellin_smul (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (a : K)
    (μ : AbstractMeasure G K K) :
    componentMellin H ν (a • μ) = a • componentMellin H ν μ := by sorry

/-- §3.1: `F_{δ_g} = ν(H_Δ g)·Σ_n binom(H_ℤ g, n) Tⁿ`. -/
theorem componentMellin_dirac (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (g : G) :
    componentMellin H ν (AbstractMeasure.dirac K g) =
      PowerSeries.mk (fun n => ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2)) := by sorry

/-- §3.1: `coeff_0 F_{μ,ν,H} = μ(ν ∘ H_Δ)`, the `ν`-weighted mass. -/
theorem componentMellin_mass (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (μ : AbstractMeasure G K K) :
    (componentMellin H ν μ).coeff 0 = μ ⟨fun g => ν (H g).1, by fun_prop⟩ := by sorry

/-- §3.1 (Bounded component Mellin coefficients): `‖coeff_n F‖ ≤ ‖μ‖·C` when `‖ν‖ ≤ C`. -/
theorem componentMellin_coeff_bound (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (C : ℝ) (hC : 0 ≤ C) (hν : ∀ δ, ‖ν δ‖ ≤ C) (n : ℕ) :
    ‖(componentMellin H ν μ).coeff n‖ ≤ ‖AbstractMeasure.toCLMEquiv μ‖ * C := by sorry

/-- §3.1 (Bounded component series are analytic on the disc). -/
theorem componentMellin_onOpenDisc (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) : OnOpenDisc (componentMellin H ν μ) := by sorry

/-- §3.1 (Character evaluation equals the component Mellin value; RJW Remark 3.47 and §5.3,
pp. 25–26 and 34–35): `E(F_{μ,ν,H}, t) = μ(g ↦ ν(H_Δ g)·κ_t(H_ℤ g))` with `κ_t(1) = 1 + t`. -/
theorem componentMellin_eval (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (componentMellin H ν μ) t = μ ⟨fun g => ν (H g).1 *
      PadicInt.addChar_of_value_at_one t
        (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr ht) (H g).2, by fun_prop⟩ := by sorry

/-- §3.1 check `generator_atom`: `F_{δ_(δ,1)} = ν(δ)(1 + T)`. -/
example (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (δ : Δ) :
    componentMellin H ν (AbstractMeasure.dirac K (H.symm (δ, 1))) =
      PowerSeries.C (ν δ) * (1 + PowerSeries.X) := by sorry

/-- §3.1 check `native_amice` (compatibility): on `ℤ_p` with the trivial chart this is Mathlib's
`AbstractMeasure.amiceTransform`. -/
example (μ : AbstractMeasure ℤ_[p] K K) :
    componentMellin (Homeomorph.uniqueProd PUnit ℤ_[p]).symm (fun _ => (1 : K)) μ =
      μ.amiceTransform := by sorry

end Components

/-- §3.2 (Mellin branches in an arithmetic parameter): `B_{F,q}(s) = E(F, κ_q(s) − 1)` with
`κ_q(1) = 1 + q`. -/
def branchMellin (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) : K :=
  evalOpen F (PadicInt.addChar_of_value_at_one q
    (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1)

/-- §3.2: `B_{F,q}(s) = E(F, κ_q(s) − 1)`. -/
theorem branchMellin_def (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin F q hq s = evalOpen F (PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1) := rfl

/-- §3.2: `B_{F,q}(0) = coeff_0 F`. -/
theorem branchMellin_zero (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 0 = F.coeff 0 := by sorry

/-- §3.2: `B_{F,q}(1) = E(F, q)`. -/
theorem branchMellin_one (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 1 = evalOpen F q := by sorry

/-- §3.2: additivity in the series, for open-disc series. -/
theorem branchMellin_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (F + H) q hq s = branchMellin F q hq s + branchMellin H q hq s := by sorry

/-- §3.2 (Arithmetic branches stay inside the character disc): `‖κ_q(s) − 1‖ ≤ ‖q‖`. -/
theorem branchCoordinate_norm_le (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    ‖PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1‖ ≤ ‖q‖ := by sorry

/-- §3.2 (Mellin evaluation at integral weights): `B_{F,q}(n) = E(F, (1 + q)ⁿ − 1)`. -/
theorem branchMellin_nat (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (n : ℕ) :
    branchMellin F q hq (n : ℤ_[p]) = evalOpen F ((1 + q) ^ n - 1) := by sorry

/-- §3.2 check `linear_at_one`: `B_{T,q}(1) = q`. -/
example (q : K) (hq : ‖q‖ < 1) : branchMellin (p := p) PowerSeries.X q hq 1 = q := by sorry

/-- §3.2 check `generator_at_zero`: `B_{1+T,q}(0) = 1`. -/
example (q : K) (hq : ‖q‖ < 1) : branchMellin (p := p) (1 + PowerSeries.X) q hq 0 = 1 := by sorry

/-- §3.2 check `BranchMellinTests.torsion_point`: a torsion point with zero principal coordinate has
weight-independent value. -/
example {G Δ : Type*} [TopologicalSpace G] [CompactSpace G] [Fintype Δ]
    [TopologicalSpace Δ] [DiscreteTopology Δ] (H : G ≃ₜ Δ × ℤ_[p])
    (ν : Δ → K) (δ : Δ) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (componentMellin H ν (AbstractMeasure.dirac K (H.symm (δ, 0)))) q hq s = ν δ := by
  sorry

/-- §3.2 (Mellin evaluation on a clearing-factor domain): `Q_{F,D}(t) = E(F, t)/E(D, t)`, used
only where `E(D, t) ≠ 0`. -/
def quotientMellin (F D : PowerSeries K) (t : K) : K := evalOpen F t / evalOpen D t

omit [CompleteSpace K] [IsUltrametricDist K] in
/-- §3.2: the defining quotient; meaningful use is guarded by `E(D, t) ≠ 0`. -/
theorem quotientMellin_def (F D : PowerSeries K) (t : K) :
    quotientMellin F D t = evalOpen F t / evalOpen D t := rfl

/-- §3.2: a zero numerator gives zero on every admissible domain. -/
theorem quotientMellin_zero (D : PowerSeries K) (t : K) : quotientMellin 0 D t = 0 := by sorry

/-- §3.2: `E(D, t)·Q_{F,D}(t) = E(F, t)` when `E(D, t) ≠ 0`. -/
theorem quotientMellin_clear (F D : PowerSeries K) (t : K) (hD : evalOpen D t ≠ 0) :
    evalOpen D t * quotientMellin F D t = evalOpen F t := by sorry

/-- §3.2: `Q_{F,1}(t) = E(F, t)`. -/
theorem quotientMellin_one (F : PowerSeries K) (t : K) : quotientMellin F 1 t = evalOpen F t := by
  sorry

/-- §3.2 (Agreement of Mellin clearing expressions): if `F D′ = F′ D` then the two quotients agree
wherever both denominators are nonzero. -/
theorem quotientMellin_independent (F D F' D' : PowerSeries K)
    (hF : OnOpenDisc F) (hD : OnOpenDisc D) (hF' : OnOpenDisc F') (hD' : OnOpenDisc D')
    (h : F * D' = F' * D) (t : K) (ht : ‖t‖ < 1)
    (hDt : evalOpen D t ≠ 0) (hD't : evalOpen D' t ≠ 0) :
    quotientMellin F D t = quotientMellin F' D' t := by sorry

/-- §3.2 check `simple_pole`: `Q_{1,T}(t) = t⁻¹` for `t ≠ 0`. -/
example (t : K) (ht : t ≠ 0) : quotientMellin 1 PowerSeries.X t = t⁻¹ := by sorry

/-- §3.2 check `trivial_character_excluded` (non-example): `E(T, 0) = 0`, so the chart for the
denominator `T` excludes the trivial character. -/
example : evalOpen (PowerSeries.X : PowerSeries K) 0 = 0 := by sorry

end Mellin

/-! ## Layer 4: analytic families, Fredholm theory and finite-slope complexes -/

namespace NonarchimedeanFredholm

section CompleteContinuity

variable {A M N : Type*} [NormedCommRing A]
  [NormedAddCommGroup M] [Module A M] [NormedAddCommGroup N] [Module A N]

/-- §4.1 (Complete continuity in the Banach algebra convention): approximation in operator norm
by continuous `A`-linear maps whose range is a finitely generated `A`-submodule. On affinoid
algebras it agrees with AdicSpacesPartIII's predicate of §R3.6 (README §4.1). -/
def IsCompletelyContinuous (f : M →L[A] N) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
    (LinearMap.range g.toLinearMap).FG ∧ ∀ x : M, ‖f x - g x‖ ≤ ε * ‖x‖

/-- §4.1: the image lies in a finitely generated `A`-submodule (finite `A`-image, not finite
`K`-rank). -/
def HasFiniteAImage (f : M →L[A] N) : Prop :=
  ∃ Q : Submodule A N, Q.FG ∧ LinearMap.range f.toLinearMap ≤ Q

end CompleteContinuity

universe u v w

variable {K A : Type u}
variable [NontriviallyNormedField K] [CompleteSpace K]
variable [NormedCommRing A] [NormOneClass A] [hNontrivialA : Nontrivial A]
variable [NormedAlgebra K A] [hCompleteA : CompleteSpace A] [hNoeth : IsNoetherianRing A]
variable {M N P : Type v}
variable [NormedAddCommGroup M] [NormedSpace K M] [Module A M]
variable [IsScalarTower K A M] [ContinuousSMul A M] [hCompleteM : CompleteSpace M]
variable [NormedAddCommGroup N] [NormedSpace K N] [Module A N]
variable [IsScalarTower K A N] [ContinuousSMul A N] [CompleteSpace N]
variable [NormedAddCommGroup P] [NormedSpace K P] [Module A P]
variable [IsScalarTower K A P] [ContinuousSMul A P] [CompleteSpace P]

section Section41

include hNoeth in
/-- §4.1 (Finite ambient image versus finitely generated range; Buzzard §2, p. 9). -/
theorem hasFiniteAImage_iff_range_fg (f : M →L[A] N) :
    HasFiniteAImage f ↔ (LinearMap.range f.toLinearMap).FG := by sorry

include hNoeth in
/-- §4.1: over Noetherian `A`, Buzzard's containing-submodule convention gives the same predicate. -/
theorem isCompletelyContinuous_iff_containing_finite (f : M →L[A] N) :
    IsCompletelyContinuous f ↔ ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
      HasFiniteAImage g ∧ ∀ x : M, ‖f x - g x‖ ≤ ε * ‖x‖ := by sorry

include hNoeth in
/-- §4.1 (Strict norm approximation by finite-image maps), in the `K`-operator norm. -/
theorem isCompletelyContinuous_iff_norm_approximation (f : M →L[A] N) :
    IsCompletelyContinuous f ↔ ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
      HasFiniteAImage g ∧ ‖(f - g).restrictScalars K‖ < ε := by sorry

include hNoeth in
/-- §4.1: a continuous map with finite `A`-image is completely continuous. -/
theorem finiteImage_isCompletelyContinuous (f : M →L[A] N) (hf : HasFiniteAImage f) :
    IsCompletelyContinuous f := by sorry

include K hNoeth in
/-- §4.1: composition with a bounded `A`-linear map on either side preserves complete continuity. -/
theorem isCompletelyContinuous_comp (f : M →L[A] N) (g : N →L[A] P)
    (h : IsCompletelyContinuous f ∨ IsCompletelyContinuous g) :
    IsCompletelyContinuous (g.comp f) := by sorry

include hNoeth in
/-- §4.1: completely continuous maps are the `K`-operator-norm closure of the finite-image maps. -/
theorem isClosed_completelyContinuous :
    {f : M →L[K] N | ∃ g : M →L[A] N, g.restrictScalars K = f ∧ IsCompletelyContinuous g} =
      closure {f : M →L[K] N | ∃ g : M →L[A] N,
        g.restrictScalars K = f ∧ HasFiniteAImage g} := by sorry

include K in
/-- §4.1 (Complete continuity of the identity detects finite generation; Buzzard Proposition 3.2,
p. 23). -/
theorem completelyContinuous_id_iff_finite :
    IsCompletelyContinuous (ContinuousLinearMap.id A M) ↔ Module.Finite A M := by sorry

/-- §4.1 check `identity_on_A`, including when `A` is infinite-dimensional over `K`. -/
example : IsCompletelyContinuous (ContinuousLinearMap.id A A) := by sorry

include K in
/-- §4.1 check `identity_on_infinite_c0` (non-example). -/
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) :
    ¬ IsCompletelyContinuous (ContinuousLinearMap.id A C₀(ℕ, A)) := by sorry

/-- §4.1 (Orthonormalizable and potentially orthonormalizable modules): a chosen potentially orthonormal chart `M ≃ C₀(I, A)`. -/
def PotentiallyONable (A : Type u) (M : Type v) [NormedCommRing A]
    [NormedAddCommGroup M] [Module A M] : Prop :=
  ∃ (I : Type v) (t : TopologicalSpace I),
    letI : TopologicalSpace I := t
    DiscreteTopology I ∧ Nonempty (M ≃L[A] C₀(I, A))

/-- §4.2 (Property (Pr)): `M` is a continuous retract of some `C₀(I, A)`. -/
def HasPr (A : Type u) (M : Type v) [NormedCommRing A]
    [NormedAddCommGroup M] [Module A M] : Prop :=
  ∃ (I : Type v) (t : TopologicalSpace I),
    letI : TopologicalSpace I := t
    DiscreteTopology I ∧ ∃ (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M),
      r.comp i = ContinuousLinearMap.id A M

include K in
/-- §4.1: potential orthonormalizability is orthonormalizability after a two-sided bounded change
of norm. -/
theorem potentiallyON_iff_equivalentNorm : PotentiallyONable A M ↔
    ∃ (I : Type v) (t : TopologicalSpace I),
      letI : TopologicalSpace I := t
      DiscreteTopology I ∧ ∃ (e : M ≃ₗ[A] C₀(I, A)) (c C : ℝ),
        0 < c ∧ 0 < C ∧ ∀ x, c * ‖x‖ ≤ ‖e x‖ ∧ ‖e x‖ ≤ C * ‖x‖ := by sorry

include K in
/-- §4.1: coordinates in an orthonormal chart reconstruct each element by unconditional
summation. -/
theorem orthonormalization_coordinates {I : Type w} [TopologicalSpace I] [DiscreteTopology I]
    [DecidableEq I] (e : M ≃L[A] C₀(I, A)) (x : M) :
    x = ∑' i, e x i • e.symm (c0Single i (1 : A)) := by sorry

include K in
/-- §4.1 (Operator bound from the coordinate vectors; Buzzard §2, pp. 8–9). -/
theorem c0_operator_norm_le_iff {I : Type w} [TopologicalSpace I] [DiscreteTopology I]
    [DecidableEq I] (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I, A) →L[A] C₀(I, A)) (C : ℝ) (hC : 0 ≤ C) :
    ‖f.restrictScalars K‖ ≤ C ↔ ∀ i, ‖f (c0Single i (1 : A))‖ ≤ C := by sorry

/-- §4.2: potentially orthonormalizable modules have (Pr). -/
theorem hasPr_of_potentiallyON (h : PotentiallyONable A M) : HasPr A M := by sorry

/-- §4.2: a continuous direct summand of a (Pr) module has (Pr). -/
theorem hasPr_retract (h : HasPr A N) (i : M →L[A] N) (r : N →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M) : HasPr A M := by sorry

omit [NormOneClass A] hNontrivialA hCompleteA hNoeth [ContinuousSMul A M] hCompleteM in
/-- §4.2: (Pr) is a continuous retraction from some `C₀(I, A)`; this is the definition. -/
theorem hasPr_iff_split_c0 : HasPr A M ↔
    ∃ (I : Type v) (t : TopologicalSpace I),
      letI : TopologicalSpace I := t
      DiscreteTopology I ∧ ∃ (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M),
        r.comp i = ContinuousLinearMap.id A M := Iff.rfl

include K hNoeth in
/-- §4.2 (Finite (Pr) modules are algebraically projective; Buzzard Lemma 2.11, p. 19). -/
theorem projective_of_finite_hasPr [Module.Finite A M] (hp : HasPr A M) :
    Module.Projective A M := by sorry

/-- §4.1 check `potential_not_isometric`: a rescaled line is potentially, not isometrically,
orthonormalizable. -/
example (c : ℝ) (hc : 0 < c) (hcvalue : ∀ a : K, ‖a‖ ≠ c)
    (e : M ≃ₗ[K] K) (he : ∀ x : M, ‖x‖ = c * ‖e x‖) :
    PotentiallyONable K M ∧ ¬ Nonempty (M ≃ₗᵢ[K] K) := by sorry

/-- §4.2 check `projective_not_free`: `eA` for `A = K × K`, `e = (1, 0)` has (Pr) and is not free. -/
example : let E := Submodule.span (K × K) ({(1, 0)} : Set (K × K))
    HasPr (K × K) E ∧ ¬ Module.Free (K × K) E := by sorry

/-- §4.1 check `unbounded_family` (non-example). -/
example (ρ : K) (hρ : 0 < ‖ρ‖) (hρ' : ‖ρ‖ < 1) :
    ¬ ∃ f : C₀(ℕ, K) →L[K] K, ∀ n, f (c0Single n (1 : K)) = (ρ⁻¹) ^ n := by sorry

end Section41

/-! ### §4.2 Fredholm determinants in an orthonormal chart -/

section Entire

/-- §4.2 (Entire power series over A): Mathlib's restrictedness at every positive radius. -/
def IsEntire (f : PowerSeries A) : Prop :=
  ∀ R : ℝ, 0 < R → PowerSeries.IsRestricted R f

/-- §4.2: evaluation of a power series at `a`, as the total coefficient sum; it is a convergent
evaluation only for entire series. -/
def entireEval (f : PowerSeries A) (a : A) : A := ∑' n : ℕ, f.coeff n * a ^ n

omit [NormOneClass A] hNontrivialA hCompleteA hNoeth in
/-- §4.12 (Entire series and native restrictedness): entire means Mathlib-restricted at every
positive radius. -/
theorem isEntire_iff_forall_isRestricted (f : PowerSeries A) :
    IsEntire f ↔ ∀ R : ℝ, 0 < R → PowerSeries.IsRestricted R f := Iff.rfl

/-- §4.2: `‖F(a)‖ ≤ G_R(F)` for entire `F` and `‖a‖ ≤ R`. -/
theorem norm_entireEval_le (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : PowerSeries A) (hf : IsEntire f) (a : A) (R : ℝ) (hR : 0 < R) (ha : ‖a‖ ≤ R) :
    ‖entireEval f a‖ ≤ PowerSeries.gaussNorm norm R f := by sorry

/-- §4.2 check `superexponential_coefficients`. -/
example (ρ : K) (hρ : 0 < ‖ρ‖) (hρ' : ‖ρ‖ < 1) :
    IsEntire (PowerSeries.mk (fun n : ℕ => ρ ^ (n * n))) := by sorry

/-- §4.2 check `geometric_nonexample`: the geometric series converges on the open disc but is not
entire. -/
example : ¬ IsEntire (PowerSeries.mk (fun _ : ℕ => (1 : A))) := by sorry

end Entire

section FredholmON

variable {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

/-- §4.1: the output coordinate `j` of the image of the input basis vector `e_i`. -/
def operatorEntry (f : C₀(I, A) →L[A] C₀(I, A)) (i j : I) : A :=
  f (c0Single i (1 : A)) j

/-- §4.1: `r_j(u) = sup_i ‖u_{ij}‖`, the norm of the output column `j`. -/
def columnSize (f : C₀(I, A) →L[A] C₀(I, A)) (j : I) : ℝ :=
  sSup (Set.range (fun i : I => ‖operatorEntry f i j‖))

/-- §4.2 (Fredholm determinant in an orthonormal chart; Buzzard, after Proposition 2.4, p. 12):
`c_n = (−1)ⁿ Σ_{|S| = n} det(u_{ij})_{i,j ∈ S}`. The sum is Mathlib's total `tsum`; it is a
convergent sum for completely continuous `f`. -/
def fredholmSeries (f : C₀(I, A) →L[A] C₀(I, A)) : PowerSeries A :=
  PowerSeries.mk fun n => (-1 : A) ^ n *
    ∑' S : {S : Finset I // S.card = n}, Matrix.det (fun i j : ↥S.val => operatorEntry f i j)

omit [NormOneClass A] hNontrivialA hCompleteA hNoeth in
/-- §4.2: the `n`th coefficient is the signed principal-minor sum. -/
theorem fredholmSeries_coeff (f : C₀(I, A) →L[A] C₀(I, A)) (n : ℕ) :
    (fredholmSeries f).coeff n = (-1 : A) ^ n *
      ∑' S : {S : Finset I // S.card = n}, Matrix.det (fun i j : ↥S.val => operatorEntry f i j) :=
  PowerSeries.coeff_mk _ _

include K in
/-- §4.2: the constant coefficient is one. -/
theorem fredholmSeries_constant (f : C₀(I, A) →L[A] C₀(I, A)) :
    (fredholmSeries f).coeff 0 = 1 := by sorry

include K hNoeth in
/-- §4.2: the Fredholm series of a completely continuous operator is entire. -/
theorem fredholmSeries_isEntire (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I, A) →L[A] C₀(I, A)) (hf : IsCompletelyContinuous f) :
    IsEntire (fredholmSeries f) := by sorry

include hNoeth in
/-- §4.2 (Gauss convergence under a common column majorant; Serre Proposition 8, p. 77). -/
theorem fredholmSeries_gauss_convergence (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : ℕ → C₀(I, A) →L[A] C₀(I, A)) (g : C₀(I, A) →L[A] C₀(I, A))
    (hf : ∀ n, IsCompletelyContinuous (f n)) (hg : IsCompletelyContinuous g)
    (hfg : Tendsto (fun n => (f n).restrictScalars K) atTop (𝓝 (g.restrictScalars K)))
    (b : I → ℝ) (hb : Tendsto b cofinite (𝓝 0))
    (hb0 : ∀ j, 0 ≤ b j) (hbd : ∃ C : ℝ, ∀ j, b j ≤ C)
    (hfb : ∀ n j, columnSize (f n) j ≤ b j) (hgb : ∀ j, columnSize g j ≤ b j)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n => PowerSeries.gaussNorm norm R (fredholmSeries (f n) - fredholmSeries g))
      atTop (𝓝 0) := by sorry

include K hNoeth in
/-- §4.2 (Determinant of a finite-coordinate operator; Buzzard Lemma 2.5(b), pp. 12–13): if the
outputs of `f` are supported in a finite `S`, its Fredholm series is `det(1 − T·u|_S)`. -/
theorem fredholmSeries_of_finite_support (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I, A) →L[A] C₀(I, A)) (S : Finset I) (hS : ∀ x j, j ∉ S → f x j = 0) :
    fredholmSeries f = ((Matrix.det (1 + (Polynomial.X : Polynomial A) •
      Matrix.map (-(fun i j : ↥S => operatorEntry f i j)) Polynomial.C) : Polynomial A) :
        PowerSeries A) := by sorry

include K hNoeth in
/-- §4.2 (Evaluated Fredholm product identity on c0; Serre Corollary 1 to Proposition 7, p. 76):
`P_{u+v−uv}(1) = P_u(1)·P_v(1)`, with no commutation hypothesis. -/
theorem fredholmSeries_eval_one_mul (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f g : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) (hg : IsCompletelyContinuous g) :
    entireEval (fredholmSeries (f + g - f.comp g)) 1 =
      entireEval (fredholmSeries f) 1 * entireEval (fredholmSeries g) 1 := by sorry

/-- §4.2 check `zero_operator`: `P_0 = 1`. -/
example : fredholmSeries (0 : C₀(I, A) →L[A] C₀(I, A)) = 1 := by sorry

/-- §4.2 check `rank_one_scalar`: multiplication by `a` on `A` has `P = 1 − aT`. -/
example (a : A) (f : C₀(Fin 1, A) →L[A] C₀(Fin 1, A)) (hf : ∀ x, f x = a • x) :
    fredholmSeries f = 1 - PowerSeries.C a * PowerSeries.X := by sorry

/-- §4.2 check `whole_series_product_nonexample`: evaluated multiplicativity must not be promoted
to whole-series multiplicativity. -/
example : (1 - PowerSeries.X : PowerSeries A) ≠ (1 - PowerSeries.X) * (1 - PowerSeries.X) := by
  sorry

end FredholmON

/-! ### §4.8 Finite generation and projectivity of root kernels -/

section RootKernels

include hNoeth in
/-- §4.8 (Property (Pr) of the complemented root kernel). -/
theorem riesz_kernel_hasPr (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1 - a • u) ^ h).ker F)
    (hp : HasPr A M) : HasPr A ((1 - a • u) ^ h).ker := by sorry

include K hNoeth in
/-- §4.8 (Finite generation of the root kernel; Buzzard Proposition 3.2, pp. 23–24). -/
theorem riesz_kernel_finite (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1 - a • u) ^ h).ker F)
    (hu : IsCompletelyContinuous u) : Module.Finite A ((1 - a • u) ^ h).ker := by sorry

include K hNoeth in
/-- §4.8 (Projectivity of the finite root kernel; Buzzard Lemma 2.11 and Proposition 3.2). -/
theorem riesz_kernel_projective (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1 - a • u) ^ h).ker F)
    (hu : IsCompletelyContinuous u) (hp : HasPr A M) :
    Module.Projective A ((1 - a • u) ^ h).ker := by sorry

end RootKernels

end NonarchimedeanFredholm

/-! ### §4.3–§4.4 Entire division and resultants -/

namespace NonarchimedeanFredholm

section LinearDivision

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A]

/-- §4.3 (Tail quotient for division by a linear factor; Coleman Lemma A3.5, p. 434):
`q_n = Σ_k c_{n+1+k} a^k`. -/
def entireLinearQuotient (a : A) (f : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk (fun n => ∑' k : ℕ, f.coeff (n + 1 + k) * a ^ k)

omit [NormOneClass A] [CompleteSpace A] in
/-- §4.3: the coefficient is the total tail sum `Σ_k c_{n+1+k} a^k`; it converges for entire `F`. -/
theorem entireLinearQuotient_coeff (a : A) (f : PowerSeries A) (n : ℕ) :
    (entireLinearQuotient a f).coeff n = ∑' k : ℕ, f.coeff (n + 1 + k) * a ^ k :=
  PowerSeries.coeff_mk _ _

/-- §4.3: `Q_a(0) = 0`. -/
theorem entireLinearQuotient_zero (a : A) : entireLinearQuotient a (0 : PowerSeries A) = 0 := by
  sorry

/-- §4.3: `Q_a(F + G) = Q_a(F) + Q_a(G)` for entire `F`, `G`. -/
theorem entireLinearQuotient_add (a : A) (f g : PowerSeries A) (hf : IsEntire f) (hg : IsEntire g) :
    entireLinearQuotient a (f + g) = entireLinearQuotient a f + entireLinearQuotient a g := by sorry

/-- §4.3: `Q_a(bF) = b·Q_a(F)` for entire `F`. -/
theorem entireLinearQuotient_C_mul (a b : A) (f : PowerSeries A) (hf : IsEntire f) :
    entireLinearQuotient a (PowerSeries.C b * f) = PowerSeries.C b * entireLinearQuotient a f := by
  sorry

/-- §4.3: `Q_a(b) = 0` for a constant `b`. -/
theorem entireLinearQuotient_C (a b : A) : entireLinearQuotient a (PowerSeries.C b) = 0 := by sorry

/-- §4.3: `Q_0(F)` is the shifted series, for every formal `F`. -/
theorem entireLinearQuotient_at_zero (f : PowerSeries A) :
    entireLinearQuotient 0 f = PowerSeries.mk (fun n => f.coeff (n + 1)) := by sorry

/-- §4.3 (Entireness of the linear quotient). -/
theorem entireLinearQuotient_entire (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (f : PowerSeries A) (hf : IsEntire f) : IsEntire (entireLinearQuotient a f) := by
  sorry

/-- §4.3 (Division identity with evaluation as remainder): `F = (T − a)·Q_a(F) + F(a)`. -/
theorem entire_linear_division (a : A) (f : PowerSeries A) (hf : IsEntire f) :
    f = (PowerSeries.X - PowerSeries.C a) * entireLinearQuotient a f +
      PowerSeries.C (entireEval f a) := by sorry

/-- §4.3 (An entire linear product cannot be a nonzero constant): the corrected form of Coleman
Lemma A3.1, p. 432. -/
theorem entire_linear_product_constant (a b : A) (f : PowerSeries A) (hf : IsEntire f)
    (h : (PowerSeries.X - PowerSeries.C a) * f = PowerSeries.C b) : f = 0 ∧ b = 0 := by sorry

/-- §4.3 (Uniqueness of the entire quotient and constant remainder). -/
theorem entire_linear_division_unique (a b c : A) (f g h : PowerSeries A)
    (hg : IsEntire g) (hh : IsEntire h)
    (hb : f = (PowerSeries.X - PowerSeries.C a) * g + PowerSeries.C b)
    (hc : f = (PowerSeries.X - PowerSeries.C a) * h + PowerSeries.C c) : g = h ∧ b = c := by sorry

/-- §4.3 (Agreement with native monic polynomial division). -/
theorem entireLinearQuotient_polynomial (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (P : Polynomial A) :
    entireLinearQuotient a (P : PowerSeries A) =
      ((P /ₘ (Polynomial.X - Polynomial.C a) : Polynomial A) : PowerSeries A) := by sorry

/-- §4.3 (Roots and linear factors in the entire-series ring). -/
theorem entire_root_iff_linear_factor (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (f : PowerSeries A) (hf : IsEntire f) :
    entireEval f a = 0 ↔
      ∃ g : PowerSeries A, IsEntire g ∧ f = (PowerSeries.X - PowerSeries.C a) * g := by sorry

/-- §4.3 check `linear_quotient_quadratic`: `Q_a(T²) = T + a`. -/
example (a : A) :
    entireLinearQuotient a (PowerSeries.X ^ 2 : PowerSeries A) = PowerSeries.X + PowerSeries.C a := by
  sorry

/-- §4.3 check `linear_quotient_zero_divisor`: nonzero nilpotents survive. -/
example (e : A) (he : e ^ 2 = 0) :
    entireLinearQuotient e (PowerSeries.C e * PowerSeries.X ^ 2) =
      PowerSeries.C e * PowerSeries.X := by sorry

/-- §4.3 check `linear_entire_uniqueness_boundary` (non-example): the formal geometric series
inverts `1 − aT` but is not entire for `a = p`, so Coleman A3.1 needs entireness. -/
example (a : A) :
    (1 - PowerSeries.C a * PowerSeries.X) * PowerSeries.mk (fun n : ℕ => a ^ n) = 1 := by sorry

end LinearDivision

section MonicDivision

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- §4.3 (Reciprocal-tail quotient by a monic polynomial): `s_n = Σ_k coeff_{n+d+k}(F)·b_k` with
`Σ b_k T^k` the inverse of `Q.reverse`. -/
def entireMonicQuotient (Q : Polynomial A) (F : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk fun n => ∑' k : ℕ, F.coeff (n + Q.natDegree + k) *
    (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k

omit [NormOneClass A] [CompleteSpace A] [Nontrivial A] in
/-- §4.3: the coefficient is the total sum `Σ_k coeff_{n+d+k}(F)·b_k`. -/
theorem entireMonicQuotient_coeff (Q : Polynomial A) (F : PowerSeries A) (n : ℕ) :
    (entireMonicQuotient Q F).coeff n = ∑' k : ℕ, F.coeff (n + Q.natDegree + k) *
      (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k :=
  PowerSeries.coeff_mk _ _

/-- §4.3: `S_Q(0) = 0`. -/
theorem entireMonicQuotient_zero (Q : Polynomial A) :
    entireMonicQuotient Q 0 = (0 : PowerSeries A) := by sorry

/-- §4.3: `S_Q(F + G) = S_Q(F) + S_Q(G)` for entire `F`, `G` and monic `Q`. -/
theorem entireMonicQuotient_add (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F G : PowerSeries A) (hF : IsEntire F) (hG : IsEntire G) :
    entireMonicQuotient Q (F + G) = entireMonicQuotient Q F + entireMonicQuotient Q G := by sorry

/-- §4.3: `S_Q(cF) = c·S_Q(F)` for entire `F` and monic `Q`. -/
theorem entireMonicQuotient_C_mul (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (c : A) :
    entireMonicQuotient Q (PowerSeries.C c * F) = PowerSeries.C c * entireMonicQuotient Q F := by
  sorry

/-- §4.3 (Entireness of the monic quotient). -/
theorem entireMonicQuotient_entire (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    IsEntire (entireMonicQuotient Q F) := by sorry

/-- §4.3 (The native polynomial remainder): `F = Q·S_Q(F) + R` with `deg R < deg Q`. -/
theorem entireMonicQuotient_division (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    let R := PowerSeries.trunc Q.natDegree (F - (Q : PowerSeries A) * entireMonicQuotient Q F)
    F = (Q : PowerSeries A) * entireMonicQuotient Q F + (R : PowerSeries A) ∧
      R.degree < (Q.natDegree : WithBot ℕ) := by sorry

/-- §4.3 (Uniqueness of monic entire division). -/
theorem entire_monic_division_unique (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F G H : PowerSeries A)
    (hG : IsEntire G) (hH : IsEntire H) (R S : Polynomial A)
    (hR : R.degree < (Q.natDegree : WithBot ℕ)) (hS : S.degree < (Q.natDegree : WithBot ℕ))
    (hFG : F = (Q : PowerSeries A) * G + (R : PowerSeries A))
    (hFH : F = (Q : PowerSeries A) * H + (S : PowerSeries A)) : G = H ∧ R = S := by sorry

/-- §4.3 (Compatibility with native polynomial division). -/
theorem entireMonicQuotient_polynomial (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (P : Polynomial A) :
    entireMonicQuotient Q (P : PowerSeries A) = ((P /ₘ Q : Polynomial A) : PowerSeries A) ∧
    PowerSeries.trunc Q.natDegree
      ((P : PowerSeries A) - (Q : PowerSeries A) * entireMonicQuotient Q (P : PowerSeries A)) =
      P %ₘ Q := by sorry

/-- §4.3 (Compatibility with the linear tail quotient). -/
theorem entireMonicQuotient_linear (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (F : PowerSeries A) (hF : IsEntire F) :
    entireMonicQuotient (Polynomial.X - Polynomial.C a) F = entireLinearQuotient a F := by sorry

/-- §4.3 (Division of entire series by a monic polynomial; Coleman Appendix A3, p. 434). -/
theorem entire_monic_division_existsUnique (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    ∃! qr : PowerSeries A × Polynomial A,
      IsEntire qr.1 ∧ qr.2.degree < (Q.natDegree : WithBot ℕ) ∧
      F = (Q : PowerSeries A) * qr.1 + (qr.2 : PowerSeries A) := by sorry

/-- §4.3 check `monic_quotient_one`: `S_1(F) = F`. -/
example (F : PowerSeries A) : entireMonicQuotient 1 F = F := by sorry

/-- §4.3 check `monic_quotient_quadratic`: for `Q = T² + aT + b`, `S_Q(T³) = T − a`. -/
example (a b : A) :
    entireMonicQuotient (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + Polynomial.C b)
      (PowerSeries.X ^ 3) = PowerSeries.X - PowerSeries.C a := by sorry

/-- §4.4 (Resultant of a monic polynomial and an entire series; Coleman Lemma A3.7, pp. 434–435):
`Res(Q, F)` is the norm, in Mathlib's `AdjoinRoot Q`, of the class of the entire-division remainder
of `F`. -/
def entireResultant (Q : Polynomial A) (F : PowerSeries A) : A :=
  Algebra.norm A (AdjoinRoot.mk Q
    (PowerSeries.trunc Q.natDegree (F - (Q : PowerSeries A) * entireMonicQuotient Q F)))

omit [NormOneClass A] [CompleteSpace A] [Nontrivial A] in
/-- §4.4: `Res(Q, F)` is the norm, in Mathlib's `AdjoinRoot Q`, of the class of the remainder of
`F`; equivalently the determinant of multiplication in the power basis indexed by `Fin d`. -/
theorem entireResultant_norm (Q : Polynomial A) (F : PowerSeries A) :
    entireResultant Q F = Algebra.norm A (AdjoinRoot.mk Q
      (PowerSeries.trunc Q.natDegree (F - (Q : PowerSeries A) * entireMonicQuotient Q F))) := rfl

/-- §4.4: `Res(T − a, F) = F(a)`, with no sign. -/
theorem entireResultant_linear (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) (a : A)
    (f : PowerSeries A) (hf : IsEntire f) :
    entireResultant (Polynomial.X - Polynomial.C a) f = entireEval f a := by sorry

/-- §4.4: the resultant depends only on `F` modulo `Q`. -/
theorem entireResultant_remainder (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (f g s : PowerSeries A)
    (hg : IsEntire g) (hs : IsEntire s) (h : f = (Q : PowerSeries A) * s + g) :
    entireResultant Q f = entireResultant Q g := by sorry

/-- §4.4: `Res(Q, F₁F₂) = Res(Q, F₁)·Res(Q, F₂)`. -/
theorem entireResultant_mul (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (f g : PowerSeries A) (hf : IsEntire f) (hg : IsEntire g) :
    entireResultant Q (f * g) = entireResultant Q f * entireResultant Q g := by sorry

/-- §4.4 (Entire resultant agrees with the native polynomial resultant), with exactly this argument
order and these degree bounds. -/
theorem entireResultant_polynomial (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q P : Polynomial A) (hQ : Q.Monic) :
    entireResultant Q (P : PowerSeries A) = Q.resultant P Q.natDegree P.natDegree := by sorry

/-- §4.4 (Bounded polynomial coefficient in the resultant Bezout identity). -/
theorem entireResultant_bezout (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    ∃ G : PowerSeries A, ∃ H : Polynomial A, IsEntire G ∧
      H.degree < (Q.natDegree : WithBot ℕ) ∧
      PowerSeries.C (entireResultant Q F) = (Q : PowerSeries A) * G + (H : PowerSeries A) * F := by
  sorry

/-- §4.4 (Resultant detects analytic coprimality; Coleman Lemma A3.7): `Res(Q, F)` is a unit iff
`Q` and `F` generate the unit ideal of the entire series. -/
theorem entireResultant_isUnit_iff (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    IsUnit (entireResultant Q F) ↔ ∃ G H : PowerSeries A, IsEntire G ∧ IsEntire H ∧
      (Q : PowerSeries A) * G + H * F = 1 := by sorry

/-- §4.4 check `constant_divisor`: `Res(1, F) = 1`, including `F = 0`. -/
example (f : PowerSeries A) : entireResultant 1 f = 1 := by sorry

/-- §4.4 check `linear_evaluation`: `Res(T − a, 1 − bT) = 1 − ba`. -/
example (a b : A) :
    entireResultant (Polynomial.X - Polynomial.C a) (1 - PowerSeries.C b * PowerSeries.X) =
      1 - b * a := by sorry

/-- §4.4 check `resultant_nilpotent_linear`: `Res(T², a + bT) = a²` with no reducedness. -/
example (a b : A) :
    entireResultant (Polynomial.X ^ 2)
      (((Polynomial.C a + Polynomial.C b * Polynomial.X : Polynomial A)) : PowerSeries A) =
      a ^ 2 := by sorry

end MonicDivision

end NonarchimedeanFredholm

/-! ### §4.5 and §4.7 Hasse derivatives and roots of entire series -/

namespace NonarchimedeanFredholm

section HasseFormal

variable {B : Type*} [Semiring B]

/-- §4.5 (Hasse derivatives of formal power series; Buzzard §3, p. 22): coefficient `n` of `Δ_s f`
is `binom(n + s, s)·coeff_{n+s} f`, with no inverse factorial. -/
def hasseSeries (s : ℕ) (f : PowerSeries B) : PowerSeries B :=
  PowerSeries.mk fun n => (n + s).choose s • f.coeff (n + s)

/-- §4.5: coefficient `n` of `Δ_s f` is `binom(n + s, s)·coeff_{n+s} f`. -/
theorem hasseSeries_coeff (s n : ℕ) (f : PowerSeries B) :
    (hasseSeries s f).coeff n = (n + s).choose s • f.coeff (n + s) :=
  PowerSeries.coeff_mk _ _

/-- §4.5: `Δ_0 f = f`. -/
theorem hasseSeries_zero (f : PowerSeries B) : hasseSeries 0 f = f := by sorry

/-- §4.5: `Δ_s` is additive. -/
theorem hasseSeries_add (s : ℕ) (f g : PowerSeries B) :
    hasseSeries s (f + g) = hasseSeries s f + hasseSeries s g := by sorry

/-- §4.5: `Δ_s (b f) = b Δ_s f`, including noncommutative `B`. -/
theorem hasseSeries_smul (s : ℕ) (b : B) (f : PowerSeries B) :
    hasseSeries s (b • f) = b • hasseSeries s f := by sorry

/-- §4.5 (Polynomial and series Hasse derivatives agree). -/
theorem hasseSeries_polynomial (s : ℕ) (p : Polynomial B) :
    hasseSeries s (p : PowerSeries B) = (Polynomial.hasseDeriv s p : PowerSeries B) := by sorry

/-- §4.5 (Hasse product formula for power series), with `f` before `g` in every product. -/
theorem hasseSeries_mul (s : ℕ) (f g : PowerSeries B) :
    hasseSeries s (f * g) = ∑ ij ∈ Finset.HasAntidiagonal.antidiagonal s,
      hasseSeries ij.1 f * hasseSeries ij.2 g := by sorry

/-- §4.5 check `hasse_top_monomial`: `Δ_s(b T^s) = b`, not `s!·b`. -/
example (s : ℕ) (b : B) : hasseSeries s (PowerSeries.monomial s b) = PowerSeries.C b := by sorry

/-- §4.5 check `hasse_characteristic_two`: over `ℤ/2`, `Δ_2(T²) = 1` although the second ordinary
derivative of `T²` vanishes. -/
example : hasseSeries 2 (PowerSeries.monomial 2 (1 : ZMod 2)) = 1 ∧
    Polynomial.derivative (Polynomial.derivative ((Polynomial.X : Polynomial (ZMod 2)) ^ 2)) = 0 := by
  sorry

end HasseFormal

/-- §4.5 (Hasse derivatives preserve entireness), over a possibly noncommutative normed ring. -/
theorem hasseSeries_entire {B : Type*} [NormedRing B] (f : PowerSeries B)
    (hf : ∀ R : ℝ, 0 < R → PowerSeries.IsRestricted R f) (s : ℕ) (R : ℝ) (hR : 0 < R) :
    PowerSeries.IsRestricted R (hasseSeries s f) := by sorry

section Roots

variable {A : Type*} [NormedCommRing A] [CompleteSpace A]

/-- §4.7 (Roots of an entire series with unit constant are units; Buzzard §3, p. 22): the inverse
is `−Σ_n f_{n+1} aⁿ`. -/
theorem entire_root_isUnit (f : PowerSeries A) (hf : IsEntire f)
    (h0 : f.coeff 0 = 1) (a : A) (ha : entireEval f a = 0) :
    IsUnit a ∧ a * (-(∑' n : ℕ, f.coeff (n + 1) * a ^ n)) = 1 ∧
      (-(∑' n : ℕ, f.coeff (n + 1) * a ^ n)) * a = 1 := by sorry

/-- §4.7 check `root_nonunit_constant` (non-example): without the unit constant the claim fails. -/
example [Nontrivial A] : entireEval (PowerSeries.X : PowerSeries A) 0 = 0 ∧ ¬ IsUnit (0 : A) := by
  sorry

end Roots

end NonarchimedeanFredholm

/-! ### §4.9–§4.11 The finite spectral transform and reciprocal resultants -/

namespace NonarchimedeanFredholm

section FiniteSpectral

open Polynomial

variable {A S : Type*} [CommRing A] [CommRing S]

/-- §4.9 (Monic reversal of a normalized polynomial). -/
theorem spectralReversal_monic [Nontrivial A] (P : A[X]) (n : ℕ)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    (P.reflect n).Monic ∧ (P.reflect n).natDegree = n := by sorry

/-- §4.9 (The finite polynomial spectral transform; Coleman Appendix A3, pp. 434–436): `D_{n,m}(B, P)`
is the bounded resultant over `A[T]` of `Q_n = reflect_n P` and `1 − T·B(Y)`. -/
def polynomialSpectralResultant (n m : ℕ) (B P : A[X]) : A[X] :=
  Polynomial.resultant ((P.reflect n).map Polynomial.C)
    (1 - Polynomial.C Polynomial.X * B.map Polynomial.C) n m

/-- §4.9: the value is the bounded resultant over `A[T]` with the two displayed bounds. -/
theorem polynomialSpectralResultant_def (n m : ℕ) (B P : A[X]) :
    polynomialSpectralResultant n m B P =
      Polynomial.resultant ((P.reflect n).map Polynomial.C)
        (1 - Polynomial.C Polynomial.X * B.map Polynomial.C) n m := rfl

/-- §4.9: for `B = 0` and `m = 0` the value is `1`, for any `P` and `n`. -/
theorem polynomialSpectralResultant_zero (n : ℕ) (P : A[X]) :
    polynomialSpectralResultant n 0 0 P = 1 := by sorry

/-- §4.9: for `P = 1` and `n = 0` the value is `1`, for any `B` and `m`. -/
theorem polynomialSpectralResultant_oneInput (m : ℕ) (B : A[X]) :
    polynomialSpectralResultant 0 m B 1 = 1 := by sorry

/-- §4.9 (Specializing the spectral parameter). -/
theorem polynomialSpectralResultant_eval (n m : ℕ) (B P : A[X]) (t : A) :
    (polynomialSpectralResultant n m B P).eval t =
      Polynomial.resultant (P.reflect n) (1 - Polynomial.C t * B) n m := by sorry

/-- §4.9 (Normalization of the finite transform). -/
theorem polynomialSpectralResultant_constantCoeff (n m : ℕ) (B P : A[X]) (hP : P.coeff 0 = 1) :
    (polynomialSpectralResultant n m B P).coeff 0 = 1 := by sorry

/-- §4.9 (Independence of the auxiliary degree bound). -/
theorem polynomialSpectralResultant_rightBound (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P = polynomialSpectralResultant n B.natDegree B P := by sorry

/-- §4.9 (A single polynomial eigenvalue). -/
theorem polynomialSpectralResultant_linear (m : ℕ) (B : A[X]) (a : A) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant 1 m B (1 - Polynomial.C a * Polynomial.X) =
      1 - Polynomial.C (B.eval a) * Polynomial.X := by sorry

/-- §4.9 (Multiplication of finite characteristic factors). -/
theorem polynomialSpectralResultant_mul (n k m : ℕ) (B P Q : A[X])
    (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (hk : Q.natDegree ≤ k) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (n + k) m B (P * Q) =
      polynomialSpectralResultant n m B P * polynomialSpectralResultant k m B Q := by sorry

/-- §4.9 (The exact zero-root padding factor). -/
theorem polynomialSpectralResultant_padding (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (n + 1) m B P =
      polynomialSpectralResultant n m B P * (1 - Polynomial.C (B.coeff 0) * Polynomial.X) := by sorry

/-- §4.9 (Stability when the operator series vanishes at zero). -/
theorem polynomialSpectralResultant_stable (n k m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) (hB : B.coeff 0 = 0) :
    polynomialSpectralResultant (n + k) m B P = polynomialSpectralResultant n m B P := by sorry

/-- §4.9 (Coefficient maps preserve the finite transform). -/
theorem polynomialSpectralResultant_map (f : A →+* S) (n m : ℕ) (B P : A[X]) :
    (polynomialSpectralResultant n m B P).map f =
      polynomialSpectralResultant n m (B.map f) (P.map f) := by sorry

/-- §4.9 (Finite spectral transform as a native algebra norm). -/
theorem polynomialSpectralResultant_norm (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P = Algebra.norm A[X]
      (AdjoinRoot.mk ((P.reflect n).map Polynomial.C)
        (1 - Polynomial.C Polynomial.X * B.map Polynomial.C)) := by sorry

/-- §4.9 (The finite root-product formula), with repetitions and zero roots allowed. -/
theorem polynomialSpectralResultant_split {ι : Type*} (s : Finset ι) (a : ι → A)
    (m : ℕ) (B : A[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant s.card m B (∏ i ∈ s, (1 - Polynomial.C (a i) * Polynomial.X)) =
      ∏ i ∈ s, (1 - Polynomial.C (B.eval (a i)) * Polynomial.X) := by sorry

/-- §4.10 (Finite spectral mapping for triangular matrices). -/
theorem polynomialSpectralResultant_charpolyRev_of_isUpperTriangular {ι : Type*} [Fintype ι]
    [DecidableEq ι] [LinearOrder ι] {M : Matrix ι ι A} (hM : M.IsUpperTriangular)
    (m : ℕ) (B : A[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev =
      (Polynomial.aeval M B).charpolyRev := by sorry

/-- §4.10 (Finite characteristic spectral mapping; Coleman Theorem A3.9, finite-operator step,
pp. 435–436): `D_{|I|,m}(B, P_M) = P_{B(M)}` over any commutative ring, for `deg B ≤ m`. -/
theorem polynomialSpectralResultant_charpolyRev {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : Matrix ι ι A) (m : ℕ) (B : A[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev =
      (Polynomial.aeval M B).charpolyRev := by sorry

/-- §4.11 (Reciprocal resultant with swapped factors; Coleman (9), p. 434). -/
theorem resultant_reflect_swap (f g : A[X]) (m n : ℕ) :
    Polynomial.resultant (f.reflect m) (g.reflect n) m n = Polynomial.resultant g f n m := by sorry

/-- §4.11 (Finite reciprocal spectral evaluation). -/
theorem polynomialSpectralResultant_one_sub_reverse_eval
    (Q P : A[X]) (hQ : Q.Monic) (n : ℕ) (hP : P.natDegree ≤ n) :
    (polynomialSpectralResultant n Q.natDegree (1 - Q.reverse) P).eval 1 =
      Polynomial.resultant Q P Q.natDegree P.natDegree := by sorry

end FiniteSpectral

/-- §4.9 check `nonzero_constant_padding` (non-example): `D_{1,0}(1, 1) = 1 − T` while
`D_{0,0}(1, 1) = 1`. -/
example : polynomialSpectralResultant 1 0 (1 : Polynomial ℤ) 1 = 1 - Polynomial.X ∧
    polynomialSpectralResultant 0 0 (1 : Polynomial ℤ) 1 = 1 := by sorry

/-- §4.9 check `repeated_root`: repeated roots and nonreduced coefficients are retained. -/
example : polynomialSpectralResultant 2 2 (Polynomial.X + Polynomial.X ^ 2 : Polynomial (ZMod 8))
    ((1 - Polynomial.C 2 * Polynomial.X) ^ 2) =
      1 + Polynomial.C 4 * Polynomial.X + Polynomial.C 4 * Polynomial.X ^ 2 := by sorry

/-- §4.10 check `constant_operator` (non-example): the matrix rank, not `deg P_M`, is the bound. -/
example : polynomialSpectralResultant 2 0 (1 : Polynomial ℤ)
    (0 : Matrix (Fin 2) (Fin 2) ℤ).charpolyRev = (1 - Polynomial.X) ^ 2 := by sorry

/-- §4.10 check `dense_nilpotent`: `B = Y + Y²` and `M = [[2,1],[2,2]]` over `ℤ/8`. -/
example : polynomialSpectralResultant 2 2 (Polynomial.X + Polynomial.X ^ 2)
    (!![2, 1; 2, 2] : Matrix (Fin 2) (Fin 2) (ZMod 8)).charpolyRev =
      1 + Polynomial.C 6 * Polynomial.X ^ 2 := by sorry

/-- §4.11 check `linear_sign`: `D_{1,1}(3T, 1 − 2T)(1) = −5`. -/
example : (polynomialSpectralResultant 1 1 (Polynomial.C 3 * Polynomial.X)
    (1 - Polynomial.C 2 * Polynomial.X : Polynomial ℤ)).eval 1 = -5 := by sorry

/-- §4.11 check `unnormalized` (non-example): without `P(0) = 1` the auxiliary bound matters. -/
example : (polynomialSpectralResultant 0 2 0 (Polynomial.C 2 : Polynomial ℤ)).eval 1 = 4 ∧
    (polynomialSpectralResultant 0 0 0 (Polynomial.C 2 : Polynomial ℤ)).eval 1 = 1 := by sorry

section EntireResultantLimit

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- §4.11 (Entire resultant as a limit of polynomial resultants). -/
theorem tendsto_resultant_trunc (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => Polynomial.resultant Q (PowerSeries.trunc (n + 1) F)
      Q.natDegree (PowerSeries.trunc (n + 1) F).natDegree)
      atTop (𝓝 (entireResultant Q F)) := by sorry

/-- §4.11 (The normalized scalar limit in Coleman A3.8; Coleman Lemma A3.8(11), p. 435). -/
theorem tendsto_spectral_simultaneous_trunc_eval (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F)
    (hF0 : F.coeff 0 = 1) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n n
      (PowerSeries.trunc (n + 1) ((1 - Q.reverse : Polynomial A) : PowerSeries A))
      (PowerSeries.trunc (n + 1) F)).eval 1)
      atTop (𝓝 (entireResultant Q F)) := by sorry

/-- §4.11 check `linear_limit`: for `Q = T − a` the scalar limit is the evaluation `F(a)`. -/
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) (a : A) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n 1
      (Polynomial.C a * Polynomial.X) (PowerSeries.trunc (n + 1) F)).eval 1)
      atTop (𝓝 (entireEval F a)) := by sorry

end EntireResultantLimit

end NonarchimedeanFredholm

/-! ### §4.12–§4.13 Gauss convergence and the spectral transform with entire input -/

namespace NonarchimedeanFredholm

section Gauss

variable {A : Type*} [NormedCommRing A]

/-- §4.12 (Entire truncations converge at every radius). -/
theorem tendsto_gaussNorm_sub_trunc (F : PowerSeries A) (hF : IsEntire F) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R (F - (PowerSeries.trunc N F : PowerSeries A)))
      atTop (𝓝 0) := by sorry

/-- §4.12 (Bounded coefficient limits converge in Gauss norms). -/
theorem tendsto_gaussNorm_of_coeff_tendsto_of_gauss_bounded
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) atTop (𝓝 (f.coeff k)))
    (hbd : ∀ S : ℝ, 0 < S → ∃ C : ℝ, 0 ≤ C ∧ ∀ i, PowerSeries.gaussNorm norm S (F i) ≤ C)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => PowerSeries.gaussNorm norm R (F i - f)) atTop (𝓝 0) := by sorry

/-- §4.12 (Unique entire limit of Gauss-Cauchy sequences). -/
theorem existsUnique_entire_gauss_limit [CompleteSpace A]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i))
    (hC : ∀ R : ℝ, 0 < R → ∀ ε : ℝ, 0 < ε →
      ∃ N : ℕ, ∀ i ≥ N, ∀ j ≥ N, PowerSeries.gaussNorm norm R (F i - F j) < ε) :
    ∃! f : PowerSeries A, IsEntire f ∧ ∀ R : ℝ, 0 < R →
      Tendsto (fun i => PowerSeries.gaussNorm norm R (F i - f)) atTop (𝓝 0) := by sorry

/-- §4.12 (Uniform evaluation of a Gauss limit) on the closed ball of radius `R`. -/
theorem tendstoUniformlyOn_entireEval_of_gauss [CompleteSpace A]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    {ι : Type*} (l : Filter ι) (F : ι → PowerSeries A) (hF : ∀ i, IsEntire (F i))
    (f : PowerSeries A) (hf : IsEntire f) (R : ℝ) (hR : 0 < R)
    (hlim : Tendsto (fun i => PowerSeries.gaussNorm norm R (F i - f)) l (𝓝 0)) :
    TendstoUniformlyOn (fun i a => entireEval (F i) a) (entireEval f) l {a : A | ‖a‖ ≤ R} := by
  sorry

/-- §4.12 (Multiplication of Gauss limits). -/
theorem tendsto_gaussNorm_mul (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (F H : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (hH : ∀ i, IsEntire (H i))
    (f h : PowerSeries A) (hf : IsEntire f) (hh : IsEntire h) (R : ℝ) (hR : 0 < R)
    (hFlim : Tendsto (fun i => PowerSeries.gaussNorm norm R (F i - f)) atTop (𝓝 0))
    (hHlim : Tendsto (fun i => PowerSeries.gaussNorm norm R (H i - h)) atTop (𝓝 0)) :
    Tendsto (fun i => PowerSeries.gaussNorm norm R (F i * H i - f * h)) atTop (𝓝 0) := by sorry

/-- §4.12 check `moving_monomials` (non-example): coefficientwise convergence to zero with Gauss
norm and value at `1` constantly one. -/
example [NormOneClass A] :
    (∀ k : ℕ, Tendsto (fun N : ℕ => (PowerSeries.monomial N (1 : A)).coeff k) atTop (𝓝 0)) ∧
    (∀ N : ℕ, PowerSeries.gaussNorm norm 1 (PowerSeries.monomial N (1 : A)) = 1) ∧
    (∀ N : ℕ, entireEval (PowerSeries.monomial N (1 : A)) 1 = 1) := by sorry

/-- §4.12 check `nilpotent_product` (non-example): Gauss norms are not multiplicative. -/
example (e : A) (he : e ^ 2 = 0) (hne : e ≠ 0) (R : ℝ) (hR : 0 < R) :
    let f := PowerSeries.monomial 1 e
    PowerSeries.gaussNorm norm R (f * f) = 0 ∧
      0 < PowerSeries.gaussNorm norm R f * PowerSeries.gaussNorm norm R f := by sorry

end Gauss

section FixedCharacteristic

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- §4.13 (Spectral transform with entire functional input and fixed polynomial input):
`E_n(B, P) = D_{n,n}(R_{Q_n}(B), P)`, using the entire monic remainder modulo `Q_n = reflect_n P`. -/
def entirePolynomialSpectral (n : ℕ) (B : PowerSeries A) (P : Polynomial A) : Polynomial A :=
  polynomialSpectralResultant n n
    (PowerSeries.trunc n (B - (P.reflect n : PowerSeries A) * entireMonicQuotient (P.reflect n) B)) P

omit [NormOneClass A] [CompleteSpace A] [Nontrivial A] in
/-- §4.13: the defining formula. -/
theorem entirePolynomialSpectral_def (n : ℕ) (B : PowerSeries A) (P : Polynomial A) :
    entirePolynomialSpectral n B P = polynomialSpectralResultant n n
      (PowerSeries.trunc n (B - (P.reflect n : PowerSeries A) *
        entireMonicQuotient (P.reflect n) B)) P := rfl

/-- §4.13: for `P(0) = 1` the constant coefficient is `1`. -/
theorem entirePolynomialSpectral_constantCoeff (n : ℕ) (B : PowerSeries A) (P : Polynomial A)
    (hP : P.coeff 0 = 1) : (entirePolynomialSpectral n B P).coeff 0 = 1 := by sorry

/-- §4.13: for normalized `P` of degree at most `n`, `E_n(0, P) = 1`. -/
theorem entirePolynomialSpectral_zero (n : ℕ) (P : Polynomial A) (hP : P.coeff 0 = 1)
    (hn : P.natDegree ≤ n) : entirePolynomialSpectral n 0 P = 1 := by sorry

/-- §4.13 (Agreement with the polynomial spectral construction). -/
theorem entirePolynomialSpectral_polynomial (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n m : ℕ) (B P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n)
    (hm : B.natDegree ≤ m) :
    entirePolynomialSpectral n (B : PowerSeries A) P = polynomialSpectralResultant n m B P := by
  sorry

/-- §4.13 (All-radius Gauss convergence at fixed characteristic rank). -/
theorem tendsto_spectral_fixed_polynomial_gauss (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n : ℕ) (B : PowerSeries A) (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant n N (PowerSeries.trunc (N + 1) B) P -
        entirePolynomialSpectral n B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := by sorry

/-- §4.13 (Simultaneous truncation convergence for polynomial characteristic input). -/
theorem tendsto_spectral_simultaneous_fixed_polynomial_gauss
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (B : PowerSeries A) (hB : IsEntire B) (hB0 : B.coeff 0 = 0)
    (P : Polynomial A) (hP : P.coeff 0 = 1) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant N N (PowerSeries.trunc (N + 1) B)
        (PowerSeries.trunc (N + 1) (P : PowerSeries A)) -
        entirePolynomialSpectral P.natDegree B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := by
  sorry

/-- §4.13 (The exact zero-root padding law for entire functional input). -/
theorem entirePolynomialSpectral_padding (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n : ℕ) (B : PowerSeries A) (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1)
    (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral (n + 1) B P =
      entirePolynomialSpectral n B P * (1 - Polynomial.C (B.coeff 0) * Polynomial.X) := by sorry

/-- §4.13 (Factor products for polynomial characteristic inputs). -/
theorem entirePolynomialSpectral_mul (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n k : ℕ) (B : PowerSeries A) (hB : IsEntire B) (P Q : Polynomial A)
    (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1) (hn : P.natDegree ≤ n) (hk : Q.natDegree ≤ k) :
    entirePolynomialSpectral (n + k) B (P * Q) =
      entirePolynomialSpectral n B P * entirePolynomialSpectral k B Q := by sorry

/-- §4.13 (Linear characteristic input evaluates the entire function). -/
theorem entirePolynomialSpectral_linear (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (B : PowerSeries A) (hB : IsEntire B) (a : A) :
    entirePolynomialSpectral 1 B (1 - Polynomial.C a * Polynomial.X) =
      1 - Polynomial.C (entireEval B a) * Polynomial.X := by sorry

/-- §4.13 check `constant_padding` (non-example): `E_2(c, 1) = (1 − cT)²`. -/
example (c : A) : entirePolynomialSpectral 2 (PowerSeries.C c) 1 =
    (1 - Polynomial.C c * Polynomial.X) ^ 2 := by sorry

/-- §4.13 check `nilpotent_coefficients`: `E_2(T, 1 − eT²) = 1 − eT²` for `e² = 0`. -/
example (e : A) (he : e ^ 2 = 0) :
    entirePolynomialSpectral 2 (PowerSeries.X : PowerSeries A) (1 - Polynomial.C e * Polynomial.X ^ 2) =
      1 - Polynomial.C e * Polynomial.X ^ 2 := by sorry

end FixedCharacteristic

/-- §4.13 check `EntireSpectralTests.nonzero_constant` (non-example): for `B = 1` and `P = 1` the
rank-`N` truncations `(1 − T)^N` have linear coefficients that are not Cauchy over `ℚ_3`, so
`B(0) = 0` is essential. -/
example : ¬ CauchySeq (fun N : ℕ =>
    (polynomialSpectralResultant N 0 (1 : Polynomial ℚ_[3]) 1).coeff 1) := by sorry

end NonarchimedeanFredholm

/-! ### §4.15 Affinoid-valued stages and their duals -/

namespace AnalyticDistributions

section StageDuals

variable {K : Type*} [NontriviallyNormedField K]
variable {I : Type*} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
variable {A : Type*} [NormedCommRing A]

/-- §4.15 (Affinoid-valued Banach-stage distributions): a continuous `A`-linear functional on
`C₀(I, A)` is determined by its bounded basis values. -/
theorem stageDual_ext [CompleteSpace A] (μ ν : C₀(I, A) →L[A] A)
    (h : ∀ i, μ (NonarchimedeanFredholm.c0Single i (1 : A)) =
      ν (NonarchimedeanFredholm.c0Single i (1 : A))) : μ = ν := by sorry

/-- §4.15 check `distributionStage_bounded_not_c0` (non-example): over an ultrametric field the
coefficient-sum functional has basis values constantly one, a family that is not `c₀`. -/
example [CompleteSpace K] [IsUltrametricDist K] : ∃ μ : C₀(ℕ, K) →L[K] K,
    (∀ n, μ (NonarchimedeanFredholm.c0Single n (1 : K)) = 1) ∧ ¬ ∃ f : C₀(ℕ, K), ∀ n, f n = 1 := by
  sorry

/-- §4.15 check, continued: over `ℝ` no continuous functional has value one on every basis vector. -/
example : ¬ ∃ μ : C₀(ℕ, ℝ) →L[ℝ] ℝ, ∀ n, μ (NonarchimedeanFredholm.c0Single n (1 : ℝ)) = 1 := by
  sorry

variable [NormedAlgebra K A]

/-- §4.15 (Integral distribution lattices): the stage-dual norm unit ball, tied to the chosen
Banach model. -/
def familyIntegralLattice : Set (C₀(I, A) →L[A] A) :=
  {μ | ‖μ.restrictScalars K‖ ≤ 1}

omit [DiscreteTopology I] [DecidableEq I] in
/-- §4.15: membership is the norm bound `≤ 1`. -/
theorem familyIntegralLattice_mem (μ : C₀(I, A) →L[A] A) :
    μ ∈ familyIntegralLattice (K := K) ↔ ‖μ.restrictScalars K‖ ≤ 1 := Iff.rfl

/-- §4.15: multiplication by `a` with `‖a‖ ≤ 1` preserves the lattice. -/
theorem familyIntegralLattice_smul (a : A) (ha : ‖a‖ ≤ 1) (μ : C₀(I, A) →L[A] A)
    (hμ : μ ∈ familyIntegralLattice (K := K)) : a • μ ∈ familyIntegralLattice (K := K) := by sorry

/-- §4.15 check `integralLattice_point`: at a point, multiplication by `a` lies in the lattice iff
`‖a‖ ≤ 1`. -/
example [NormOneClass A] (a : A) (μ : C₀(PUnit, A) →L[A] A) (hμ : ∀ f, μ f = a * f PUnit.unit) :
    μ ∈ familyIntegralLattice (K := K) ↔ ‖a‖ ≤ 1 := by sorry

end StageDuals

/-- §4.15 check `coefficientAction_wrongScalar`: the second-projection fibre of `(2,3)·(5,7)` at
`z²` with `z = 3` is `189`, the first `90`. -/
example : ((AlgHom.snd ℚ_[3] ℚ_[3] ℚ_[3]) ((2, 3) * (5, 7))) * (3 : ℚ_[3]) ^ 2 = 189 ∧
    ((AlgHom.fst ℚ_[3] ℚ_[3] ℚ_[3]) ((2, 3) * (5, 7))) * (3 : ℚ_[3]) ^ 2 = 90 := by norm_num

/-! ### §4.16 Banach complexes -/

section Complexes

open CategoryTheory

variable {K A : Type*} [NontriviallyNormedField K] [NormedCommRing A] [NormedAlgebra K A]
variable (C : CochainComplex (ModuleCat A) ℤ) (E : ℤ → Type*)
variable [∀ i, NormedAddCommGroup (E i)] [∀ i, Module A (E i)]
variable (e : ∀ i, C.X i ≃ₗ[A] E i)

/-- §4.16 (Bounded complexes of projective Banach modules): degreewise complete ultrametric norms
on the identified modules, continuous differentials, finite support and (Pr) in every degree. -/
def IsProjectiveBanachComplex : Prop :=
  (∀ i, IsUltrametricDist (E i)) ∧
  (∀ i (k : K) (x : E i), ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖) ∧
  (∀ i, ∃ c : ℝ, 0 ≤ c ∧ ∀ (a : A) (x : E i), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖) ∧
  (∀ i, CompleteSpace (E i)) ∧ (∀ i, ContinuousSMul A (E i)) ∧
  (∀ i j, Continuous (fun x : E i => e j (C.d i j ((e i).symm x)))) ∧
  (∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → Subsingleton (E i)) ∧
  ∀ i, NonarchimedeanFredholm.HasPr A (E i)

/-- §4.16: the zero complex is a projective Banach complex. -/
theorem projectiveBanachComplex_zero (hz : ∀ i, Subsingleton (E i)) :
    IsProjectiveBanachComplex (K := K) C E e := by sorry

/-- §4.16: degree shifts transport norms, differentials and finite support. -/
theorem projectiveBanachComplex_shift (n : ℤ)
    (D : CochainComplex (ModuleCat A) ℤ) (e' : ∀ i, D.X i ≃ₗ[A] E (i + n))
    (ε : A) (hd : ∀ i j (x : E (i + n)),
      e' j (D.d i j ((e' i).symm x)) = ε • e (j + n) (C.d (i + n) (j + n) ((e (i + n)).symm x)))
    (hC : IsProjectiveBanachComplex (K := K) C E e) :
    IsProjectiveBanachComplex (K := K) D (fun i => E (i + n)) e' := by sorry

/-- §4.16 check `banachComplex_infinite_rank`: `C₀(ℕ, A)` in degree zero is allowed although it is
not a finite `A`-module. -/
example [CompleteSpace A] [Nontrivial A] [IsNoetherianRing A]
    (hu : IsUltrametricDist (E 0))
    (hk : ∀ (k : K) (x : E 0), ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖)
    (ha : ∃ c : ℝ, 0 ≤ c ∧ ∀ (a : A) (x : E 0), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖)
    (hother : ∀ i, i ≠ 0 → Subsingleton (E i)) (e0 : E 0 ≃L[A] C₀(ℕ, A)) :
    IsProjectiveBanachComplex (K := K) C E e ∧ ¬ Module.Finite A (E 0) := by sorry

/-- §4.16: the degree map of a cochain endomorphism, transferred to the identified module. -/
def degreeCLM (U : C ⟶ C) (i : ℤ)
    (hc : Continuous (fun x : E i => e i (U.f i ((e i).symm x)))) : E i →L[A] E i :=
  ⟨(e i).toLinearMap.comp ((U.f i).hom.comp (e i).symm.toLinearMap), hc⟩

/-- §4.16 (Degreewise completely continuous representatives). -/
def DegreewiseCompletelyContinuous (U : C ⟶ C) : Prop :=
  ∀ i, ∃ hc : Continuous (fun x : E i => e i (U.f i ((e i).symm x))),
    NonarchimedeanFredholm.IsCompletelyContinuous (degreeCLM C E e U i hc)

/-- §4.16: the zero cochain endomorphism is completely continuous in every degree. -/
theorem degreewiseCompletelyContinuous_zero : DegreewiseCompletelyContinuous C E e 0 := by sorry

/-- §4.16: sums of degreewise completely continuous representatives. -/
theorem degreewiseCompletelyContinuous_add (U V : C ⟶ C)
    (hU : DegreewiseCompletelyContinuous C E e U) (hV : DegreewiseCompletelyContinuous C E e V) :
    DegreewiseCompletelyContinuous C E e (U + V) := by sorry

/-- §4.16 check `complexCompact_finite_free`: every continuous endomorphism of a complex of finite
modules is degreewise completely continuous. -/
example (U : C ⟶ C) [∀ i, Module.Finite A (E i)]
    (hc : ∀ i, Continuous (fun x : E i => e i (U.f i ((e i).symm x)))) :
    DegreewiseCompletelyContinuous C E e U := by sorry

/-- §4.16 (Compactness of a homotopy endomorphism): some continuously homotopic representative is
degreewise completely continuous. -/
def CompactHomotopyEndomorphism (U : C ⟶ C) : Prop :=
  ∃ V : C ⟶ C, DegreewiseCompletelyContinuous C E e V ∧
    ∃ H : Homotopy U V, ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))

/-- §4.16: a degreewise compact representative determines a compact class. -/
theorem compactHomotopyEndomorphism_of_rep (U : C ⟶ C)
    (hU : DegreewiseCompletelyContinuous C E e U) : CompactHomotopyEndomorphism C E e U := by sorry

/-- §4.16: continuously homotopic endomorphisms are compact together. -/
theorem compactHomotopyEndomorphism_homotopy (U V : C ⟶ C) (H : Homotopy U V)
    (hc : ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))) :
    CompactHomotopyEndomorphism C E e U ↔ CompactHomotopyEndomorphism C E e V := by sorry

/-- §4.16 check `homotopyCompact_contractible`: the identity of a contractible complex is
compact. -/
example (H : Homotopy (𝟙 C) 0)
    (hc : ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))) :
    CompactHomotopyEndomorphism C E e (𝟙 C) := by sorry

end Complexes

/-! ### §4.17 Fréchet presentations and the torus order -/

section StageFactorizations

variable {A : Type*} [NormedCommRing A]
variable (V : ℕ → Type*) [∀ n, NormedAddCommGroup (V n)] [∀ n, Module A (V n)]

/-- §4.17 (Compact factorization on Fréchet presentations; Urban §2.3.12 and Lemma 2.3.13): compact
transitions `t_n` and bounded `a_n` with `U_n = t_n a_n` and `U_{n+1} = a_n t_n`. -/
def CompactStageFactorization (t : ∀ n, V (n + 1) →L[A] V n) (U : ∀ n, V n →L[A] V n) : Prop :=
  (∀ n, NonarchimedeanFredholm.IsCompletelyContinuous (t n)) ∧
    ∃ a : ∀ n, V n →L[A] V (n + 1), ∀ n, (t n).comp (a n) = U n ∧ (a n).comp (t n) = U (n + 1)

/-- §4.17: compact transitions with zero stage operators factor with `a_n = 0`. -/
theorem compactStageFactorization_zero (t : ∀ n, V (n + 1) →L[A] V n)
    (ht : ∀ n, NonarchimedeanFredholm.IsCompletelyContinuous (t n)) :
    CompactStageFactorization V t (fun _ => 0) := by sorry

/-- §4.17: the factorization makes the stage operators compatible, `U_n t_n = t_n U_{n+1}`. -/
theorem compactStageFactorization_compatible (t : ∀ n, V (n + 1) →L[A] V n)
    (U : ∀ n, V n →L[A] V n) (h : CompactStageFactorization V t U) (n : ℕ) :
    (U n).comp (t n) = (t n).comp (U (n + 1)) := by sorry

/-- §4.17 check `frechetFactor_finite`: the constant system `A` with scalar `U = a`. -/
example (a : A) : CompactStageFactorization (fun _ : ℕ => A)
    (fun _ => ContinuousLinearMap.id A A) (fun _ => a • ContinuousLinearMap.id A A) := by sorry

end StageFactorizations

/-- §4.17 check `frechetFactor_noncompact` (non-example): the constant system `c₀(ℕ, K)` with
identity transitions fails the compact-transition condition. -/
example {K : Type*} [NontriviallyNormedField K] :
    ¬ CompactStageFactorization (fun _ : ℕ => C₀(ℕ, K))
      (fun _ => ContinuousLinearMap.id K C₀(ℕ, K)) (fun _ => 0) := by sorry

namespace TorusValuationTests

/-- §4.17 check `torusSlope_wrong_sign`: the character valuation is `+1` at `p`, the
ReductiveGroupsPartII apartment translation `−1`. -/
example : padicValRat 3 (3 : ℚ) = 1 ∧ -padicValRat 3 (3 : ℚ) = -1 := by
  have h3 : padicValRat 3 (3 : ℚ) = 1 := by
    convert padicValRat.self (by norm_num : 1 < (3 : ℕ)) using 1
  exact ⟨h3, by simp only [h3]⟩

/-- §4.17 check `torusValuation_split_line`: `w(p^{−2}) = −2`. -/
example : padicValRat 3 ((3 : ℚ) ^ (-2 : ℤ)) = -2 := by
  have h3 : padicValRat 3 (3 : ℚ) = 1 := by
    convert padicValRat.self (by norm_num : 1 < (3 : ℕ)) using 1
  rw [padicValRat.zpow, h3]
  norm_num

/-- §4.17 check `torusPositive_SL2`: the positive root `t ↦ t²` has valuation `2` at `t = p`. -/
example : padicValRat 3 ((3 : ℚ) ^ 2) = 2 ∧ padicValRat 3 ((3 : ℚ)⁻¹) = -1 := by
  have h3 : padicValRat 3 (3 : ℚ) = 1 := by
    convert padicValRat.self (by norm_num : 1 < (3 : ℕ)) using 1
  rw [padicValRat.pow, padicValRat.inv, h3]
  norm_num

/-- §4.17 check `torusSlope_SL2`: in the `SL₂` chamber the slope order is the real order. -/
example (s t : ℝ) : (∀ n : ℕ, 0 ≤ (n : ℝ) * (s - t)) ↔ t ≤ s := by sorry

/-- §4.17 check `torusSlope_rootless`: for `𝔾_m` alone comparability is equality. -/
example (s t : ℝ) : (∀ n : ℤ, 0 ≤ (n : ℝ) * (s - t)) ↔ t = s := by sorry

end TorusValuationTests

end AnalyticDistributions

end

end TauCetiRoadmap.LocallyAnalyticDistributions

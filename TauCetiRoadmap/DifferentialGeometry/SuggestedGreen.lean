import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.BoxIntegral.Integrability
import Mathlib.MeasureTheory.Function.AbsolutelyContinuous
import Mathlib.MeasureTheory.Integral.CurveIntegral.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral.AbsolutelyContinuousFun
import Mathlib.Topology.Connected.Basic
import TauCeti.Analysis.Contour.Winding.Number.Basic
import TauCeti.Analysis.Contour.PiecewiseC1On

/-!
# Green's theorem: suggested signatures for differential geometry layer 5.6

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These are suggested forms for particular milestones; discharging them finishes
neither the layer nor the roadmap. In particular, the directional region and boundary-chain
statements of 5.6.2 remain requirements of the markdown.

The definitions here fix coordinates and integration conventions using existing APIs.
`TauCeti.Contour.windingNumber` is imported directly; there is no replacement index.
-/

noncomputable section

open MeasureTheory Set
open scoped Classical

namespace TauCetiRoadmap.DifferentialGeometry.Green

/-- The bounded components of the complement, with no Jordan-curve assumption. -/
def inside (K : Set ℂ) : Set ℂ :=
  {z | z ∉ K ∧ Bornology.IsBounded (connectedComponentIn Kᶜ z)}

/-- Curl of `P dx + Q dy`, using real derivatives and the positive basis `(1, I)`. -/
def curl (P Q : ℂ → ℝ) (z : ℂ) : ℝ :=
  fderiv ℝ Q z (1 : ℂ) - fderiv ℝ P z Complex.I

/-- The boundary integrand; its integral is the existing `intervalIntegral`. -/
def circulationFun (P Q : ℂ → ℝ) (γ : ℝ → ℂ) (t : ℝ) : ℝ :=
  P (γ t) * (deriv γ t).re + Q (γ t) * (deriv γ t).im

/-- The real linear 1-form accepted by Mathlib's `curveIntegral`. -/
def oneForm (P Q : ℂ → ℝ) (z : ℂ) : ℂ →L[ℝ] ℝ :=
  (P z) • Complex.reCLM + (Q z) • Complex.imCLM

/-- On the trace the area weight is zero, independently of the principal-value index there. -/
def windingWeight (γ : ℝ → ℂ) (a b : ℝ) (z : ℂ) : ℝ :=
  if z ∈ γ '' Icc a b then 0 else (TauCeti.Contour.windingNumber γ a b z).re

/-- An ordinary interval in the existing one-dimensional gauge-integral API. -/
def intervalBox (a b : ℝ) (hab : a < b) : BoxIntegral.Box (Fin 1) :=
  ⟨fun _ ↦ a, fun _ ↦ b, fun _ ↦ hab⟩

/-- The finite-exception FTC retains conditional integrability at exceptional points. -/
theorem hasIntegral_Henstock_deriv {f f' : ℝ → ℝ} {a b : ℝ} (hab : a < b)
    (hf : ContinuousOn f (Icc a b)) (S : Finset ℝ)
    (hderiv : ∀ t ∈ Ioo a b \ (S : Set ℝ), HasDerivAt f (f' t) t) :
    BoxIntegral.HasIntegral (intervalBox a b hab) BoxIntegral.IntegrationParams.Henstock
      (fun t : Fin 1 → ℝ ↦ f' (t 0))
      (volume : Measure (Fin 1 → ℝ)).toBoxAdditive.toSMul (f b - f a) :=
  sorry

/-- The gauge value agrees with `intervalIntegral` when the integrand is Bochner integrable. -/
theorem Henstock_eq_intervalIntegral {f : ℝ → ℝ} {a b r : ℝ} (hab : a < b)
    (hf : IntervalIntegrable f volume a b)
    (hHK : BoxIntegral.HasIntegral (intervalBox a b hab) BoxIntegral.IntegrationParams.Henstock
      (fun t : Fin 1 → ℝ ↦ f (t 0))
      (volume : Measure (Fin 1 → ℝ)).toBoxAdditive.toSMul r) :
    (∫ t in a..b, f t) = r :=
  sorry

/-- Existing contour cycles use this stronger regularity, which supplies absolute continuity. -/
theorem absolutelyContinuousOnInterval_of_piecewiseC1 {γ : ℝ → ℂ} {a b : ℝ}
    (hγ : TauCeti.Contour.IsPiecewiseC1On γ a b) :
    AbsolutelyContinuousOnInterval γ a b :=
  sorry

/-- The `Path` and raw-function forms use the same existing curve integral. -/
theorem curveIntegral_oneForm_eq {p q : ℂ} (γ : Path p q) (P Q : ℂ → ℝ) :
    curveIntegral (oneForm P Q) γ = ∫ t in (0 : ℝ)..1, circulationFun P Q γ.extend t :=
  sorry

/-- Absolute continuity supplies boundary integrability; it is not an extra premise. -/
theorem circulationFun_intervalIntegrable {γ : ℝ → ℂ} {a b : ℝ} {P Q : ℂ → ℝ}
    (hγ : AbsolutelyContinuousOnInterval γ a b)
    (hP : ContinuousOn P (γ '' uIcc a b)) (hQ : ContinuousOn Q (γ '' uIcc a b)) :
    IntervalIntegrable (circulationFun P Q γ) volume a b :=
  sorry

/-- Ordinary off-curve winding integral for AC curves, consuming Tau Ceti's index. -/
theorem windingNumber_eq_integral_ac {γ : ℝ → ℂ} {a b : ℝ} {z : ℂ}
    (hγ : AbsolutelyContinuousOnInterval γ a b) (hz : z ∉ γ '' uIcc a b) :
    TauCeti.Contour.windingNumber γ a b z =
      (2 * (Real.pi : ℂ) * Complex.I)⁻¹ *
        ∫ t in a..b, (γ t - z)⁻¹ * deriv γ t :=
  sorry

/-- An AC trace is null for planar Lebesgue measure. -/
theorem volume_image_eq_zero_ac {γ : ℝ → ℂ} {a b : ℝ}
    (hγ : AbsolutelyContinuousOnInterval γ a b) : volume (γ '' uIcc a b) = 0 :=
  sorry

/-- Integrability of the area multiplicity is a theorem, not part of the curve definition. -/
theorem windingWeight_integrable_ac {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b) :
    Integrable (windingWeight γ a b) volume :=
  sorry

/-- The winding-weighted theorem permits repeated traversal and self-intersection. -/
theorem green_ac_winding {γ : ℝ → ℂ} {a b : ℝ} {U : Set ℂ} {P Q : ℂ → ℝ}
    (hab : a < b) (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b)
    (hU : IsOpen U) (htrace : γ '' Icc a b ⊆ U)
    (hP : ContDiffOn ℝ 1 P U) (hQ : ContDiffOn ℝ 1 Q U)
    (hindex : ∀ z ∉ U, TauCeti.Contour.windingNumber γ a b z = 0) :
    IntervalIntegrable (circulationFun P Q γ) volume a b ∧
      IntegrableOn (fun z ↦ windingWeight γ a b z * curl P Q z) U volume ∧
      (∫ t in a..b, circulationFun P Q γ t) =
        ∫ z in U, windingWeight γ a b z * curl P Q z :=
  sorry

/-- HOL Light's listed strength: index one on all bounded complementary components.
No simplicity, finite partition, nonzero speed, or field compact support is assumed. -/
theorem green_ac_index_one {γ : ℝ → ℂ} {a b : ℝ} {U : Set ℂ} {P Q : ℂ → ℝ}
    (hab : a < b) (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b)
    (hU : IsOpen U) (hregion : (γ '' Icc a b) ∪ inside (γ '' Icc a b) ⊆ U)
    (hP : ContDiffOn ℝ 1 P U) (hQ : ContDiffOn ℝ 1 Q U)
    (hindex : ∀ z ∈ inside (γ '' Icc a b), TauCeti.Contour.windingNumber γ a b z = 1) :
    IntervalIntegrable (circulationFun P Q γ) volume a b ∧
      IntegrableOn (curl P Q) (inside (γ '' Icc a b)) volume ∧
      (∫ t in a..b, circulationFun P Q γ t) =
        ∫ z in inside (γ '' Icc a b), curl P Q z :=
  sorry

/-- The AC flux expression fixes the outward-normal sign without requiring a unit tangent. -/
theorem green_ac_flux {γ : ℝ → ℂ} {a b : ℝ} {U : Set ℂ} {X Y : ℂ → ℝ}
    (hab : a < b) (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b)
    (hU : IsOpen U) (hregion : (γ '' Icc a b) ∪ inside (γ '' Icc a b) ⊆ U)
    (hX : ContDiffOn ℝ 1 X U) (hY : ContDiffOn ℝ 1 Y U)
    (hindex : ∀ z ∈ inside (γ '' Icc a b), TauCeti.Contour.windingNumber γ a b z = 1) :
    (∫ t in a..b, X (γ t) * (deriv γ t).im - Y (γ t) * (deriv γ t).re) =
      ∫ z in inside (γ '' Icc a b), fderiv ℝ X z (1 : ℂ) + fderiv ℝ Y z Complex.I :=
  sorry

end TauCetiRoadmap.DifferentialGeometry.Green

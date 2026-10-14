import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Geometry.Manifold.Morse.Index
import TauCeti.Analysis.Calculus.Morse.NormalForm
import Mathlib.Geometry.Manifold.LocalDiffeomorph
import Mathlib.Geometry.Manifold.MFDeriv.NormedSpace
import Mathlib.Topology.Homotopy.Equiv
import Mathlib.Data.Set.Card

/-!
These are suggested forms, not an exhaustive checklist. The README is the
specification. Use native Tau Ceti critical-point, Morse and index predicates;
these interfaces add normalized manifold charts, finite critical-set/count
and compact-band deformation statements. Counts have extended natural values
before finiteness is proved.
-/

noncomputable section

namespace TauCetiRoadmap.MorseTheory
open scoped Manifold ContDiff
open Set

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The critical set uses the native manifold derivative. -/
def criticalPoints (f : M → ℝ) : Set M :=
  {x | mvfderiv I f x = 0}

def criticalCount (f : M → ℝ) (j : ℕ) : ℕ∞ :=
  {x | x ∈ criticalPoints (I := I) f ∧ TauCeti.manifoldMorseIndex I f x = j}.encard

theorem finite_criticalPoints_inter (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    {K : Set M} (hK : IsCompact K) :
    (criticalPoints (I := I) f ∩ K).Finite := by
  sorry

theorem criticalCount_ne_top [CompactSpace M] (f : M → ℝ)
    (hf : TauCeti.IsMorse I f) (j : ℕ) :
    criticalCount (I := I) f j ≠ ⊤ := by
  sorry

/-- The normalized chart uses the native Morse index and has an actual smooth inverse. -/
theorem exists_normalized_morseChart (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M)
    (hx : TauCeti.IsManifoldNondegenerateCriticalPoint I f x) :
    ∃ ψ : PartialDiffeomorph I
        𝓘(ℝ, EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) M
        (EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) ∞,
      x ∈ ψ.source ∧ ψ x = 0 ∧
      ∀ y ∈ ψ.source,
        f y = f x + ∑ i : Fin (Module.finrank ℝ E),
          (if i.val < TauCeti.manifoldMorseIndex I f x then -1 else 1) * (ψ y i) ^ 2 := by
  sorry

/-- A proper Morse exhaustion has finite critical sets below each level when bounded below. -/
theorem finite_criticalPoints_sublevel (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (hp : IsProperMap f) (hlower : ∃ a : ℝ, ∀ x, a ≤ f x) (b : ℝ) :
    (criticalPoints (I := I) f ∩ {x | f x ≤ b}).Finite := by
  sorry

/-- Compact-band no-critical deformation on actual sublevel topological spaces. -/
theorem exists_sublevelHomotopyEquiv (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b : ℝ) (hab : a < b) (hcompact : IsCompact (f ⁻¹' Icc a b))
    (hnocrit : ∀ x, a ≤ f x → f x ≤ b → x ∉ criticalPoints (I := I) f) :
    ∃ e : ContinuousMap.HomotopyEquiv {x : M | f x ≤ a} {x : M | f x ≤ b},
      ∀ x : {x : M | f x ≤ a}, (e x : M) = x := by
  sorry

def sublevelInclusion (f : M → ℝ) (a b : ℝ) (hab : a ≤ b) :
    ContinuousMap {x : M | f x ≤ a} {x : M | f x ≤ b} :=
  ⟨fun x ↦ ⟨x.val, le_trans x.property hab⟩,
    continuous_subtype_val.subtype_mk _⟩

/-- The actual deformation homotopy is fixed on the entire lower sublevel. -/
theorem exists_sublevelDeformation [SecondCountableTopology M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b : ℝ) (hab : a < b) (hcompact : IsCompact (f ⁻¹' Icc a b))
    (hnocrit : ∀ x, a ≤ f x → f x ≤ b → x ∉ criticalPoints (I := I) f) :
    ∃ r : ContinuousMap {x : M | f x ≤ b} {x : M | f x ≤ a},
      (∀ x, r (sublevelInclusion f a b hab.le x) = x) ∧
      Nonempty (ContinuousMap.HomotopyRel
        ((sublevelInclusion f a b hab.le).comp r) (ContinuousMap.id _)
        {x : {x : M | f x ≤ b} | f x ≤ a}) := by
  sorry

end TauCetiRoadmap.MorseTheory

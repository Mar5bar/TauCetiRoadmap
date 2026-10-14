import Mathlib.Topology.VectorBundle.Basic
import Mathlib.Topology.VectorBundle.Constructions
import Mathlib.Topology.VectorBundle.Hom
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic

/-!
**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These forms check actual bundle maps, compact embedding, finite matrix
spectral splitting and the monoid exercise. `sorry` denotes a mathematical target.
The topological bundle category, K-groups and Thom maps are specified in the README;
they are not simulated by empty proposition fields or opaque replacement carriers.
-/

noncomputable section
open Topology
open scoped Matrix.Norms.Operator
namespace TauCetiRoadmap.TopologicalKTheory

universe u v

/-- A small variable-rank atlas using the existing cocycle construction.
T1 proves comparison with arbitrary topological-module fibre universes. -/
structure FiniteRankAtlas (X : Type u) [TopologicalSpace X] where
  rank : LocallyConstant X ℕ
  charts : ∀ n : ℕ, VectorBundleCore ℂ {x : X // rank x = n} (Fin n → ℂ)
    {x : X // rank x = n}

section Presentation
open CategoryTheory CategoryTheory.Limits

/-- T1 supplies the genuine bundle category, Whitney biproducts and smallness.
The K-group carrier then uses the existing split presentation, with no arbitrary
sum operation or new relation engine. -/
abbrev BundleCategoryK0 (C : Type*) [Category C] [HasZeroMorphisms C]
    [HasBinaryBiproducts C] [EssentiallySmall.{u} C] : Type u :=
  TauCeti.SplitK0.{u} C

/-- The actual monoidal/braided category hypotheses give its K-ring. -/
example {C : Type*} [Category C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] [EssentiallySmall.{u} C] [MonoidalCategory C]
    [MonoidalPreadditive C] [BraidedCategory C] : CommRing (BundleCategoryK0 C) :=
  inferInstance
end Presentation

/-- The monoid exercise used to turn a stabilized sequence monoid into a group. -/
theorem bijective_of_surjective_trivial_identity_fiber
    {S G : Type*} [Monoid S] [Group G] (f : S →* G)
    (hsurj : Function.Surjective f) (hone : ∀ s, f s = 1 → s = 1) :
    Function.Bijective f := by
  sorry

section Bundles
variable {X : Type u} [TopologicalSpace X]
  {F₁ F₂ : Type v} [NormedAddCommGroup F₁] [NormedSpace ℂ F₁]
  [NormedAddCommGroup F₂] [NormedSpace ℂ F₂]
  {E₁ E₂ : X → Type v}
  [∀ x, AddCommGroup (E₁ x)] [∀ x, Module ℂ (E₁ x)]
  [∀ x, TopologicalSpace (E₁ x)] [∀ x, IsTopologicalAddGroup (E₁ x)]
  [∀ x, ContinuousSMul ℂ (E₁ x)]
  [∀ x, AddCommGroup (E₂ x)] [∀ x, Module ℂ (E₂ x)]
  [∀ x, TopologicalSpace (E₂ x)] [∀ x, IsTopologicalAddGroup (E₂ x)]
  [∀ x, ContinuousSMul ℂ (E₂ x)]
  [TopologicalSpace (Bundle.TotalSpace F₁ E₁)]
  [TopologicalSpace (Bundle.TotalSpace F₂ E₂)]
  [FiberBundle F₁ E₁] [FiberBundle F₂ E₂]
  [VectorBundle ℂ F₁ E₁] [VectorBundle ℂ F₂ E₂]

/-- A relative symbol represented by a global morphism invertible on the relative set.
T3 also constructs the extension/comparison with maps initially defined only on Y. -/
structure RelativeSymbol (Y : Set X) where
  toLinear : ∀ x, E₁ x →L[ℂ] E₂ x
  continuous_total : Continuous (fun p : Bundle.TotalSpace F₁ E₁ ↦
    (⟨p.proj, toLinear p.proj p.2⟩ : Bundle.TotalSpace F₂ E₂))
  invertible_on : ∀ x ∈ Y, Function.Bijective (toLinear x)

/-- A compact base permits one finite trivial embedding, with fibre injectivity. -/
theorem exists_finite_trivial_embedding [CompactSpace X] [T2Space X]
    [FiniteDimensional ℂ F₁] :
    ∃ (N : ℕ) (j : ∀ x, E₁ x →L[ℂ] (Fin N → ℂ)),
      Continuous (fun p : Bundle.TotalSpace F₁ E₁ ↦ (p.proj, j p.proj p.2)) ∧
      ∀ x, Function.Injective (j x) := by
  sorry
end Bundles

section SpectralSplitting
variable {X : Type*} [TopologicalSpace X] [CompactSpace X] {n : ℕ}

/-- The actual spectral projection for an arbitrary finite matrix family.
This does not assume the matrices are self-adjoint. The generalized-eigenvector
condition fixes which spectral subspace is selected, in addition to idempotence. -/
theorem exists_continuous_inside_projection (B : C(X, Matrix (Fin n) (Fin n) ℂ))
    (hcircle : ∀ (x : X) (z : ℂ), ‖z‖ = 1 → IsUnit (z • (1 : Matrix (Fin n) (Fin n) ℂ) - B x)) :
    ∃ P : C(X, Matrix (Fin n) (Fin n) ℂ),
      (∀ x, P x * P x = P x) ∧
      (∀ x, P x * B x = B x * P x) ∧
      ∀ (x : X) (z : ℂ) (k : ℕ) (v : Fin n → ℂ),
        Matrix.mulVec ((B x - z • (1 : Matrix (Fin n) (Fin n) ℂ)) ^ k) v = 0 →
          Matrix.mulVec (P x) v = if ‖z‖ < 1 then v else 0 := by
  sorry

/-- Uniform Laurent approximation preserves invertibility along the straight segment. -/
theorem isUnit_segment_of_uniform_inverse_bound
    (u : (Matrix (Fin n) (Fin n) ℂ)ˣ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hsmall : ‖(↑(u⁻¹) : Matrix (Fin n) (Fin n) ℂ) * (B - ↑u)‖ < 1)
    (t : unitInterval) :
    IsUnit ((1 - (t : ℝ)) • (↑u : Matrix (Fin n) (Fin n) ℂ) + (t : ℝ) • B) := by
  sorry
end SpectralSplitting

end TauCetiRoadmap.TopologicalKTheory

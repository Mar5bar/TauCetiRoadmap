import Mathlib.CategoryTheory.GradedObject
import Mathlib.LinearAlgebra.Multilinear.Basic
import TauCeti.Algebra.Module.GradedModule.GradedObject
import TauCeti.Algebra.Homology.AInfinity.Algebra.MaurerCartan
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Symplectic.Lagrangian.TotallyReal
import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace

/-!
# Fukaya theory: native carriers and suggested boundary target

This file is not exhaustive and is not the definitive roadmap; see `README.md`.
The declarations below are proved carrier and convention checks. The completed curved category
and bordered virtual families require the constructions specified in the README. These checks use
native graded objects, native nullary multilinear maps, the implemented uncurved specialization
and the actual tangent range of a smooth embedding. No private category or virtual-space surrogate
is introduced.
-/

namespace TauCetiRoadmap.FukayaTheory

open CategoryTheory
open scoped Manifold ContDiff

universe u v w

/-- The external graded carrier; no claim of a completed tensor product is made by this alias. -/
abbrev GradedCoefficients (B : Type v) (R : Type u) [CommRing R] :=
  GradedObject B (ModuleCat.{u} R)

/-- Use the native internal-to-external grading bridge. -/
abbrev homogeneousPieces {R : Type u} {A : Type v} [CommRing R]
    [AddCommGroup A] [Module R A] (G : TauCeti.InternalGrading R A) :=
  G.toGradedObject

section Nullary
variable {R : Type u} {A : Type v} [CommRing R] [AddCommGroup A] [Module R A]

/-- A nullary operation can be nonzero. Multilinearity in an empty set of inputs imposes no
vanishing condition. Its degree is supplied by the actual homogeneous curvature element. -/
def curvatureOperation (c : A) : MultilinearMap R (fun _ : Fin 0 ↦ A) A :=
  MultilinearMap.constOfIsEmpty R (fun _ : Fin 0 ↦ A) c

@[simp] theorem curvatureOperation_apply (c : A) (x : Fin 0 → A) :
    curvatureOperation (R := R) c x = c := rfl

/-- This integer-graded example uses the degree-two homogeneous piece. The README also treats
parity gradings, where the degree-two class has even parity. -/
def homogeneousCurvatureOperation (G : TauCeti.InternalGrading R A) (c : G.piece 2) :
    MultilinearMap R (fun _ : Fin 0 ↦ A) A := curvatureOperation (c : A)

@[simp] theorem homogeneousCurvatureOperation_apply (G : TauCeti.InternalGrading R A)
    (c : G.piece 2) (x : Fin 0 → A) :
    homogeneousCurvatureOperation G c x = (c : A) := rfl

/-- The implemented A∞ algebra is precisely an uncurved test of the proposed adapter. -/
theorem native_uncurved_nullary (𝒜 : TauCeti.AInfinityAlgebra R A) (x : Fin 0 → A) :
    𝒜.m 0 x = 0 := by
  rw [𝒜.m_zero]
  rfl

/-- Native MC theory supplies the zero element under its own finite-arity definition. -/
theorem native_zero_maurerCartan (𝒜 : TauCeti.AInfinityAlgebra R A) :
    𝒜.IsMaurerCartan 0 := 𝒜.isMaurerCartan_zero
end Nullary

section Boundary
variable {E F H G L X : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [TopologicalSpace L] [ChartedSpace H L]
  [TopologicalSpace X] [ChartedSpace G X] [IsManifold J ∞ X]

/-- Pointwise bridge to the totally real boundary data. FK1 additionally constructs the smooth
subbundle, traces and family comparisons; this theorem does not state their existence. -/
theorem tangentRange_maximalTotallyReal
    (i : TauCeti.SmoothEmbedding I J ∞ L X)
    (hn : (∞ : ℕ∞ω) ≠ 0)
    (form : TauCeti.SmoothTwoForm J X) (hω : form.IsNondegenerate)
    (𝒥 : TauCeti.SmoothAlmostComplexStructure J X) (ht : form.Tames 𝒥)
    (hL : ∀ x, (hω.symplecticFormAt (i x)).IsLagrangian (i.tangentRange x hn)) :
    ∀ x, TauCeti.IsMaximalTotallyReal
      (𝒥.almostComplexStructureAt (i x)).toLinearMap (i.tangentRange x hn) := by
  intro x
  exact (hL x).isMaximalTotallyReal_of_tames ((hω.tames_iff).mp ht (i x))
end Boundary

end TauCetiRoadmap.FukayaTheory

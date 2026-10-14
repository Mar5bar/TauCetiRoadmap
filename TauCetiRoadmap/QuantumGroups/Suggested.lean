/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.FromMatrix
import Mathlib.LinearAlgebra.Matrix.ConjTranspose
import Mathlib.Algebra.Star.Unitary
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.Analysis.Complex.Order
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.Analysis.InnerProductSpace.PiL2
import TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
These prototypes use native Hopf algebras and existing comodule coefficient
matrices. The analytic tensor/coaction constructions belong to the README;
they are not replaced here by empty proposition fields.
-/

open scoped TensorProduct ComplexOrder
open Module
namespace QuantumGroups

universe u v w
section HopfCore

variable {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A]

/-- Star compatibility supplements the native Hopf algebra, without another carrier. -/
class StarCompatibleHopf : Prop where
  comul_star : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) =
    star (Coalgebra.comul (R := ℂ) a)

/-- Counit star compatibility is a consequence, not an extra defining axiom. -/
theorem counit_star [StarCompatibleHopf (A := A)] (a : A) :
    Coalgebra.counit (R := ℂ) (star a) = star (Coalgebra.counit (R := ℂ) a) := by
  sorry

/-- Antipode-star compatibility follows from uniqueness of convolution inverse. -/
theorem antipode_star_antipode_star [StarCompatibleHopf (A := A)] (a : A) :
    HopfAlgebra.antipode ℂ (star (HopfAlgebra.antipode ℂ (star a))) = a := by
  sorry

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [TauCeti.Comodule ℂ A H]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

omit [StarModule ℂ A] in
/-- The antipode inverse already supplied by the comodule API becomes the matrix adjoint. -/
theorem coefficientMatrix_map_antipode_eq_star (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis).map
      (HopfAlgebra.antipode ℂ) =
    star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis) := by
  let U := TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis
  have hright : U * star U = 1 := Unitary.mul_star_self_of_mem hu
  have hleft : U.map (HopfAlgebra.antipode ℂ) * U = 1 :=
    TauCeti.Comodule.map_antipode_mul_coefficientMatrix b.toBasis
  change U.map (HopfAlgebra.antipode ℂ) = star U
  calc
    U.map (HopfAlgebra.antipode ℂ) = U.map (HopfAlgebra.antipode ℂ) * (U * star U) :=
      by rw [hright, mul_one]
    _ = (U.map (HopfAlgebra.antipode ℂ) * U) * star U := (mul_assoc _ _ _).symm
    _ = star U := by rw [hleft, one_mul]

omit [StarModule ℂ A] in
/-- This entrywise convention is forced by the existing column-coaction orientation. -/
theorem antipode_coefficient (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A))
    (i j : ι) :
    HopfAlgebra.antipode ℂ (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) =
      star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis j i) := by
  have h := congrFun (congrFun (coefficientMatrix_map_antipode_eq_star (A := A) b hu) i) j
  simpa only [Matrix.map_apply, Matrix.star_apply] using h

/-- Haar invariance on the core is stated by actual slice equations. -/
structure AlgebraicHaar where
  functional : A →ₗ[ℂ] ℂ
  normalized : functional 1 = 1
  left_invariant : ∀ a : A,
    (TensorProduct.rid ℂ A) ((TensorProduct.map (LinearMap.id) functional)
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  right_invariant : ∀ a : A,
    (TensorProduct.lid ℂ A) ((TensorProduct.map functional (LinearMap.id))
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  positive : ∀ a : A, 0 ≤ functional (star a * a)

/-- The matrix Ft is the pre-antipode F̃ in the README, rather than its transpose F. -/
theorem schur_orthogonality [StarCompatibleHopf (A := A)]
    [IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]
    (h : AlgebraicHaar (A := A)) (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    ∃ Ft : Matrix ι ι ℂ, Ft.PosDef ∧ Matrix.trace Ft = Matrix.trace Ft⁻¹ ∧
      (∀ i j k l,
        h.functional (star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) *
          TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l) =
          (if j = l then Ft⁻¹ i k / Matrix.trace Ft⁻¹ else 0)) ∧
      (∀ i j k l,
        h.functional (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j *
          star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l)) =
          (if i = k then Ft j l / Matrix.trace Ft else 0)) := by
  sorry

end HopfCore

section StarPresentations

variable {A : Type u} [Ring A] [Algebra ℂ A] [StarRing A] [StarModule ℂ A]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

/-- Q5's coefficient relation uses the entrywise bar, not the matrix adjoint. -/
def freeOrthogonalRelation (F : Matrix ι ι ℂ) [Invertible F] (U : Matrix ι ι A) : Prop :=
  U ∈ unitary (Matrix ι ι A) ∧
    U = F.map (algebraMap ℂ A) * U.map star * (⅟ F).map (algebraMap ℂ A)

/-- The F indices fix the signed cup and tensor-product orientation. -/
noncomputable def freeOrthogonalCupVector (F : Matrix ι ι ℂ) :
    (ι → ℂ) ⊗[ℂ] (ι → ℂ) :=
  ∑ i, ∑ j, F j i • ((Pi.basisFun ℂ ι) i ⊗ₜ[ℂ] (Pi.basisFun ℂ ι) j)

/-- The cup intertwiner equation for the native U₁₃U₂₃ tensor convention. -/
theorem freeOrthogonalCup_invariant (F : Matrix ι ι ℂ) [Invertible F]
    (U : Matrix ι ι A) (hU : freeOrthogonalRelation F U) (i k : ι) :
    ∑ j, ∑ l, U i j * algebraMap ℂ A (F l j) * U k l =
      algebraMap ℂ A (F k i) := by
  sorry

/-- In orthonormal coordinates this is the signed cup-cap zigzag equation. -/
theorem freeOrthogonalCup_zigzag (F : Matrix ι ι ℂ) (c : ℝ)
    (hF : F * F.map star = (c : ℂ) • (1 : Matrix ι ι ℂ)) (j k : ι) :
    ∑ i, F j i * star (F i k) = (c : ℂ) * (if j = k then 1 else 0) := by
  have h := congrFun (congrFun hF j) k
  simpa only [Matrix.mul_apply, Matrix.map_apply, Matrix.smul_apply,
    Matrix.one_apply, smul_eq_mul] using h

/-- The SUq(2) fundamental matrix has the specified off-diagonal coefficient. -/
def suqMatrix (q : ℝ) (a c : A) : Matrix (Fin 2) (Fin 2) A :=
  !![a, -(q : ℂ) • star c; c, star a]

/-- These algebraic relations make sense for every real q; the CQG family has q≠0. -/
structure SUqRelations (q : ℝ) (a c : A) : Prop where
  initial : star a * a + star c * c = 1
  final : a * star a + (q ^ 2 : ℂ) • (star c * c) = 1
  c_normal : star c * c = c * star c
  ac : a * c = (q : ℂ) • (c * a)
  ac_star : a * star c = (q : ℂ) • (star c * a)

/-- Unitarity of this matrix is equivalent to the stated generator relations. -/
theorem suqMatrix_unitary_iff (q : ℝ) (a c : A) :
    suqMatrix q a c ∈ unitary (Matrix (Fin 2) (Fin 2) A) ↔ SUqRelations q a c := by
  sorry

end StarPresentations

end QuantumGroups

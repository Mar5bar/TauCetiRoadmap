import TauCeti.AlgebraicGeometry.CartierDivisor.ClassGroup
import TauCeti.AlgebraicGeometry.PicardFunctor.Rigidified
import TauCeti.AlgebraicGeometry.AbelianVariety.Albanese
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny

/-!
# Jacobian challenge (AG version): target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The signatures use Tau Ceti's Cartier class group, rigidified Picard functor and
abelian-variety carrier. Picard representability compares the functor on all test schemes;
multiplication statements carry the nonzero-integer and positive-dimension hypotheses.
The curve's Abel–Jacobi universal property uses `AbelianVariety.IsAlbanese`.

Note the name clash flagged in `README.md`: Mathlib's `WeierstrassCurve.Jacobian`
means Jacobian *coordinates*, not the Jacobian *variety*, so use `JacobianVariety`.
-/

namespace TauCetiRoadmap.JacobianChallenge

open CategoryTheory AlgebraicGeometry

universe u

/-- Cartier divisor classes on an integral scheme form the Picard group of line-bundle
classes, written additively. -/
noncomputable def cartierPicardEquiv (X : Scheme.{u}) [IsIntegral X] :
    TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.ClassGroup X ≃+
      Additive (TauCeti.AlgebraicGeometry.LineBundleClass X) :=
  TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass X

/-- Cartier divisors have isomorphic invertible sheaves exactly when their difference is
the divisor of a nonzero rational function. -/
theorem cartier_sheaf_iso_iff_principal {X : Scheme.{u}} [IsIntegral X]
    (D E : TauCeti.AlgebraicGeometry.Scheme.CartierDivisor X) :
    Nonempty (D.sheaf ≅ E.sheaf) ↔
      ∃ f : X.functionFieldˣ,
        TauCeti.AlgebraicGeometry.Scheme.principalCartierDivisor X f = D - E := by
  exact TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.nonempty_iso_sheaf_iff

/-- A proper geometrically integral group scheme over a field has commutative multiplication. -/
theorem properIntegralGroup_commutative {k : Type u} [Field k]
    (G : Over (Spec (.of k))) [GrpObj G] [IsProper G.hom]
    [GeometricallyIntegral G.hom] : IsCommMonObj G := by
  exact isCommMonObj_of_isProper_of_geometricallyIntegral G

/-- A pointed smooth proper geometrically integral curve has a separated Picard scheme,
flat and locally of finite presentation over the field, representing its existing
rigidified Picard functor naturally on all test schemes. -/
theorem pointedCurvePicard_representable {k : Type u} [Field k]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) [Smooth f] [IsProper f]
    [GeometricallyIntegral f] (hdim : topologicalKrullDim X = 1)
    (x₀ : Spec (.of k) ⟶ X) (hx₀ : x₀ ≫ f = 𝟙 _) :
    ∃ P : Over (Spec (.of k)), IsSeparated P.hom ∧ Flat P.hom ∧
      LocallyOfFinitePresentation P.hom ∧
      Nonempty ((uliftYoneda.{u + 1}.obj P) ≅
        TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor f x₀ hx₀) := by
  sorry

/-- Multiplication by a nonzero integer on an abelian variety is an isogeny. -/
theorem multiplication_isogeny {k : Type u} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) (n : ℤ) (hn : n ≠ 0) :
    TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny
      (TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A n) := by
  sorry

/-- On a positive-dimensional abelian variety, multiplication by an integer is étale
exactly when that integer is nonzero in the ground field. -/
theorem multiplication_etale_iff {k : Type u} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) (hdim : 0 < A.dim) (n : ℤ) :
    Etale (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom
      (TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A n)) ↔ (n : k) ≠ 0 := by
  sorry

end TauCetiRoadmap.JacobianChallenge

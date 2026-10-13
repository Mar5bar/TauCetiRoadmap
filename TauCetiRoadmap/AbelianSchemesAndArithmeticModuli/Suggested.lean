import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AbelianVariety.MorphismGroup
import TauCeti.Geometry.Hodge.WeightOne.RiemannForm
import TauCeti.Geometry.Lie.Exponential.LocalInverse

/-!
# Abelian schemes and arithmetic moduli: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular targets, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap.

The file records the light definitions of the roadmap with real bodies, and the theorems whose
carriers exist in the pinned Mathlib and Tau Ceti: the relative carrier `AbelianScheme`, isogenies
and multiplication maps over a base, the degree of a homomorphism of abelian varieties over a field,
simple abelian varieties, the finiteness, semisimplicity and characteristic-polynomial theorems,
coefficient Hom spaces, the alternating elementary-divisor theorem and the Siegel space. Statements
whose carriers are not yet in the libraries (the dual abelian scheme, polarizations, Tate modules of
abelian schemes, de Rham realizations, Barsotti–Tate groups, the complex uniformization, Weil
restriction) are specified in the README and listed at the end.

Design choices made explicit here:
* An abelian scheme is a group object in `Over S` with proper, smooth and geometrically connected
  structure morphism. Commutativity and the homomorphism property of zero-preserving maps are
  theorems (`isCommMonObj`, `isMonHom_of_zero_preserving`), not axioms.
* Over a field the carrier is Tau Ceti's `AbelianVariety K`, whose Hom groups are written
  multiplicatively; `End A = Additive (A ⟶ A)` is a ring, and rational endomorphisms are
  `ℚ ⊗[ℤ] End A`. Dimensions are `A.dim : WithBot ℕ∞`; a statement in dimension `g` carries
  `A.dim = g`.
* The degree of an isogeny is Mathlib's `Scheme.Hom.finrank`, which counts inseparable degree; a
  non-isogeny has degree `0`.
* Riemann forms are Tau Ceti's `IsRiemannForm`, with positivity `E(Jv, v) > 0`; the Hermitian form
  is linear in the first variable, `H(v, w) = E(Jv, w) + i E(v, w)`, and principal means unimodular
  on the lattice (README A5.2).
-/

open CategoryTheory Limits MonoidalCategory AlgebraicGeometry MonObj Polynomial
open scoped TensorProduct TauCeti.AlgebraicGeometry.AbelianVariety.Hom

namespace TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

universe u

/-! ## Layer A0: The carrier and its boundaries -/

/-- An **abelian scheme** over a scheme `S`: a group object in `Over S` whose structure morphism
is proper and smooth with geometrically connected fibres. No commutativity, dimension or ample line
bundle is part of the data (README A0.1). Over `Spec K` it agrees with Tau Ceti's
`AbelianVariety K` (`ofAbelianVariety`, `toAbelianVariety`). -/
structure AbelianScheme (S : Scheme.{u}) where
  /-- The underlying group scheme over `S`. -/
  toOver : Over S
  /-- The group law. -/
  grpObj : GrpObj toOver
  /-- The structure morphism is proper. -/
  isProper : IsProper toOver.hom
  /-- The structure morphism is smooth. -/
  smooth : Smooth toOver.hom
  /-- The structure morphism has geometrically connected fibres. -/
  geometricallyConnected : GeometricallyConnected toOver.hom

namespace AbelianScheme

attribute [instance] AbelianScheme.grpObj AbelianScheme.isProper AbelianScheme.smooth
  AbelianScheme.geometricallyConnected

variable {S : Scheme.{u}}

/-- The underlying scheme of an abelian scheme. -/
noncomputable abbrev toScheme (A : AbelianScheme S) : Scheme.{u} :=
  A.toOver.left

/-- The zero section `S ⟶ A`, the unit of the group law. -/
noncomputable abbrev zeroSection (A : AbelianScheme S) : S ⟶ A.toScheme :=
  η[A.toOver].left

/-- The zero section is a section of the structure morphism. -/
theorem zeroSection_comp (A : AbelianScheme S) : A.zeroSection ≫ A.toOver.hom = 𝟙 S :=
  Over.w η[A.toOver]

/-- Base change of an abelian scheme along `f : T ⟶ S`: the pullback group scheme.
Its group structure is transported by the monoidal pullback functor. -/
noncomputable def baseChange (A : AbelianScheme S) {T : Scheme.{u}} (f : T ⟶ S) :
    AbelianScheme T where
  toOver := (Over.pullback f).obj A.toOver
  grpObj := Functor.grpObjObj
  isProper := inferInstanceAs (IsProper (pullback.snd A.toOver.hom f))
  smooth := inferInstanceAs (Smooth (pullback.snd A.toOver.hom f))
  geometricallyConnected :=
    inferInstanceAs (GeometricallyConnected (pullback.snd A.toOver.hom f))

/-- The `Over` object of a base change is the pullback of the original one. -/
theorem baseChange_toOver (A : AbelianScheme S) {T : Scheme.{u}} (f : T ⟶ S) :
    (A.baseChange f).toOver = (Over.pullback f).obj A.toOver :=
  rfl

/-- The identity of a scheme has geometrically connected fibres. -/
theorem geometricallyConnected_id (S : Scheme.{u}) : GeometricallyConnected (𝟙 S) := by
  sorry

/-- The dimension-zero abelian scheme: the identity `S ⟶ S` with its trivial group law. -/
noncomputable def identity (S : Scheme.{u}) : AbelianScheme S where
  toOver := 𝟙_ (Over S)
  grpObj := inferInstance
  isProper := by dsimp; infer_instance
  smooth := by dsimp; infer_instance
  geometricallyConnected := geometricallyConnected_id S

/-- A Tau Ceti abelian variety over `K` is an abelian scheme over `Spec K`. -/
noncomputable def ofAbelianVariety {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) : AbelianScheme (Spec (.of K)) where
  toOver := A.toOver
  grpObj := A.grpObj
  isProper := A.isProper
  smooth := inferInstance
  geometricallyConnected := inferInstance

/-- Over a field, an abelian scheme is geometrically integral: a smooth group scheme with
geometrically connected fibres over a field is geometrically irreducible and geometrically
reduced (README A0.1). -/
theorem geometricallyIntegral {K : Type u} [Field K] (A : AbelianScheme (Spec (.of K))) :
    GeometricallyIntegral A.toOver.hom := by
  sorry

/-- An abelian scheme over `Spec K` as a Tau Ceti abelian variety. -/
noncomputable def toAbelianVariety {K : Type u} [Field K] (A : AbelianScheme (Spec (.of K))) :
    TauCeti.AlgebraicGeometry.AbelianVariety K where
  toOver := A.toOver
  grpObj := A.grpObj
  isProper := A.isProper
  geometricallyIntegral := A.geometricallyIntegral

/-- The two field adapters are inverse on underlying group schemes. -/
theorem toAbelianVariety_ofAbelianVariety {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    (ofAbelianVariety A).toAbelianVariety.toOver = A.toOver :=
  rfl

/-! ## Layer A1: Rigidity and normalized line bundles -/

/-- **Automatic commutativity** over an arbitrary base (README A1.2). -/
theorem isCommMonObj (A : AbelianScheme S) : IsCommMonObj A.toOver := by
  sorry

/-- **Rigidity** over an arbitrary base, nonreduced bases included: a morphism of abelian schemes
over `S` preserving the zero sections is a homomorphism (README A1.2). -/
theorem isMonHom_of_zero_preserving {A B : AbelianScheme S} (f : A.toOver ⟶ B.toOver)
    (hf : η[A.toOver] ≫ f = η[B.toOver]) : IsMonHom f := by
  sorry

/-- A homomorphism of abelian schemes over a base restricting to zero on a nilpotent closed
subscheme of the base is zero: restriction of homomorphisms across a nilpotent thickening is
injective (README A1.2(4)). -/
theorem eq_of_restrict_nilpotent {A B : AbelianScheme S} {S₀ : Scheme.{u}} (i : S₀ ⟶ S)
    [IsClosedImmersion i] (hi : IsNilpotent (Scheme.Hom.ker i))
    (f g : A.toOver ⟶ B.toOver) [IsMonHom f] [IsMonHom g]
    (h : (Over.pullback i).map f = (Over.pullback i).map g) : f = g := by
  sorry

/-- An abelian scheme of relative dimension zero is the base: its zero section is an
isomorphism (README A1.1). -/
theorem isIso_zeroSection_of_relDim_zero (A : AbelianScheme S)
    [SmoothOfRelativeDimension 0 A.toOver.hom] : IsIso A.zeroSection := by
  sorry

/-! ## Layer A3: Isogenies, finite-flat quotients, torsion and pairings -/

/-- Multiplication by `n` on an abelian scheme, `[n] = 𝟙 ^ n` in the group of endomorphisms of the
group object. -/
noncomputable def mulBy (A : AbelianScheme S) (n : ℤ) : A.toOver ⟶ A.toOver :=
  𝟙 A.toOver ^ n

/-- Check: on the dimension-zero abelian scheme every multiplication map, `[p]` included, is an
isomorphism; a definition requiring positive dimension excludes this object (README A0.1). -/
example (S : Scheme.{u}) (n : ℤ) : IsIso ((identity S).mulBy n) := by
  sorry

/-- An **isogeny** of abelian schemes over `S`: a homomorphism whose scheme morphism is finite, flat and surjective
(README A3.1). Over an affine base this is the condition of Tau Ceti's
`TauCeti.GroupScheme.IsIsogeny`; local finite presentation follows. -/
def IsAbelianIsogeny {A B : AbelianScheme S} (f : A.toOver ⟶ B.toOver) : Prop :=
  IsMonHom f ∧ IsFinite f.left ∧ Flat f.left ∧ Surjective f.left

/-- Check: the identity of an abelian scheme is an isogeny. -/
example (A : AbelianScheme S) : IsAbelianIsogeny (𝟙 A.toOver) := by
  refine ⟨inferInstance, ?_, ?_, ?_⟩ <;> rw [Over.id_left] <;> infer_instance

/-- Check: a map that is not a homomorphism, such as translation by a nonzero section,
is excluded even when its underlying scheme morphism is an isomorphism. -/
example {A B : AbelianScheme S} (f : A.toOver ⟶ B.toOver)
    (h : ¬ IsMonHom f) : ¬ IsAbelianIsogeny f := fun hf => h hf.1

/-- **Multiplication maps** over an arbitrary base: for `n ≠ 0` on an abelian scheme of relative
dimension `g`, `[n]` is an isogeny of constant rank `|n|^(2g)` (README A3.2). -/
theorem mulBy_isAbelianIsogeny (A : AbelianScheme S) (g : ℕ)
    [SmoothOfRelativeDimension g A.toOver.hom] (n : ℤ) (hn : n ≠ 0) :
    IsAbelianIsogeny (A.mulBy n) ∧
      ∀ x : A.toScheme, (A.mulBy n).left.finrank x = n.natAbs ^ (2 * g) := by
  sorry

/-- `[n]` is étale where `n` is invertible (README A3.2). -/
theorem etale_mulBy (A : AbelianScheme S) (n : ℕ) (hunit : IsUnit (n : Γ(S, ⊤))) :
    Etale (A.mulBy n).left := by
  sorry

end AbelianScheme

namespace OverField

open TauCeti.AlgebraicGeometry
open TauCeti.AlgebraicGeometry.AbelianVariety (IsIsogeny mulBy)

variable {K : Type u} [Field K]

/-- Over a field, the relative isogeny condition is Tau Ceti's `IsIsogeny` (finite and surjective):
flatness is automatic (README A3.1). -/
theorem isAbelianIsogeny_iff {A B : AbelianVariety K} (f : A ⟶ B) :
    AbelianScheme.IsAbelianIsogeny (A := AbelianScheme.ofAbelianVariety A)
        (B := AbelianScheme.ofAbelianVariety B) (AbelianVariety.Hom.toOverHom f) ↔ IsIsogeny f := by
  sorry

/-- **Prime-to-characteristic torsion is dense** over an algebraically closed field: the union of
the images of the `n`-torsion `K`-points, `n` invertible in `K`, is dense (README A3.2(2)). -/
theorem dense_primeToChar_torsion [IsAlgClosed K] (A : AbelianVariety K) :
    Dense (⋃ (x : 𝟙_ (Over (Spec (.of K))) ⟶ A.toOver)
      (_ : ∃ n : ℕ, 0 < n ∧ (n : K) ≠ 0 ∧ x ^ n = 1), Set.range x.left.base) := by
  sorry

/-- **Hom is torsion-free** (README A3.4, A6.2). -/
theorem hom_torsionFree {A B : AbelianVariety K} (f : A ⟶ B) (n : ℕ) (hn : 0 < n)
    (h : f ^ n = 1) : f = 1 := by
  sorry

end OverField

/-! ## Layer A5: Complex uniformization and families -/

/-- **Alternating elementary divisors** (README A5.4(1)): a nondegenerate integral alternating form
on `ℤ^(2g)` has, in a suitable basis, the matrix `[[0, D], [−D, 0]]` with `D` diagonal, positive and
divisibility-ordered; the determinant is `(∏ dᵢ)²`. -/
theorem alternating_elementaryDivisors {g : ℕ}
    (E : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ) (halt : E.transpose = -E)
    (hdiag : ∀ i, E i i = 0)
    (hdet : E.det ≠ 0) :
    ∃ (P : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ) (d : Fin g → ℕ),
      IsUnit P.det ∧ (∀ i, 0 < d i) ∧ (∀ i j, i ≤ j → d i ∣ d j) ∧
      P.transpose * E * P = Matrix.fromBlocks 0 (Matrix.diagonal fun i => (d i : ℤ))
        (-Matrix.diagonal fun i => (d i : ℤ)) 0 ∧
      E.det = (∏ i, (d i : ℤ)) ^ 2 := by
  sorry

/-- Check: the type `(1, 2)` form has determinant `(1 · 2)² = 4`. -/
example : (Matrix.fromBlocks (0 : Matrix (Fin 2) (Fin 2) ℤ) (Matrix.diagonal ![1, 2])
    (-Matrix.diagonal ![1, 2]) 0).det = 4 := by
  sorry

/-- The **Siegel space** `H_g`: symmetric complex `g × g` matrices with positive definite
imaginary part (README A5.8). -/
def SiegelUpperHalfSpace (g : ℕ) : Set (Matrix (Fin g) (Fin g) ℂ) :=
  {Ω | Ω.transpose = Ω ∧ (Ω.map Complex.im).PosDef}

/-- The action of an integral `2g × 2g` matrix `[[A, B], [C, D]]` on periods,
`Ω ↦ (AΩ + B)(CΩ + D)⁻¹`, in the column convention for the lattice `ℤ^g + Ωℤ^g`. -/
noncomputable def siegelAction {g : ℕ} (M : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ)
    (Ω : Matrix (Fin g) (Fin g) ℂ) : Matrix (Fin g) (Fin g) ℂ :=
  let Mc := M.map (Int.cast : ℤ → ℂ)
  (Mc.toBlocks₁₁ * Ω + Mc.toBlocks₁₂) * (Mc.toBlocks₂₁ * Ω + Mc.toBlocks₂₂)⁻¹

/-- Check: the identity block matrix fixes every period matrix. -/
example {g : ℕ} (Ω : Matrix (Fin g) (Fin g) ℂ) :
    siegelAction (1 : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ) Ω = Ω := by
  sorry

/-- Check: the upper unipotent block matrix translates a period by its upper-right block. -/
example {g : ℕ} (B : Matrix (Fin g) (Fin g) ℤ) (Ω : Matrix (Fin g) (Fin g) ℂ) :
    siegelAction (Matrix.fromBlocks 1 B 0 1) Ω = Ω + B.map (Int.cast : ℤ → ℂ) := by
  sorry

/-- `Sp_{2g}(ℤ)` preserves the Siegel space, and `CΩ + D` is invertible there (README A5.8). -/
theorem siegelAction_mem {g : ℕ} (M : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ)
    (hM : M ∈ Matrix.symplecticGroup (Fin g) ℤ) {Ω : Matrix (Fin g) (Fin g) ℂ}
    (hΩ : Ω ∈ SiegelUpperHalfSpace g) :
    IsUnit ((M.map (Int.cast : ℤ → ℂ)).toBlocks₂₁ * Ω + (M.map (Int.cast : ℤ → ℂ)).toBlocks₂₂).det ∧
      siegelAction M Ω ∈ SiegelUpperHalfSpace g := by
  sorry

/-- Check, genus one: `H₁` is the upper half-plane. -/
example (Ω : Matrix (Fin 1) (Fin 1) ℂ) : Ω ∈ SiegelUpperHalfSpace 1 ↔ 0 < (Ω 0 0).im := by
  sorry

/-- Check: a symmetric period matrix with singular imaginary part, here `0`, is not in `H_g` for
`g ≥ 1`. -/
example (g : ℕ) (hg : 0 < g) : (0 : Matrix (Fin g) (Fin g) ℂ) ∉ SiegelUpperHalfSpace g := by
  sorry

/-! ## Layer A6: Arithmetic Hom and exports -/

namespace OverField

open TauCeti.AlgebraicGeometry
open TauCeti.AlgebraicGeometry.AbelianVariety (IsIsogeny mulBy)

variable {K : Type u} [Field K]

/-- The **degree** of a homomorphism of abelian varieties: the rank of the finite morphism at the
zero point of the target if it is an isogeny, and `0` otherwise (README A6.1). It counts
inseparable degree. -/
noncomputable def Hom.deg {A B : AbelianVariety K} (f : A ⟶ B) : ℕ := by
  classical
  exact if IsIsogeny f then (AbelianVariety.Hom.toSchemeHom f).finrank B.zeroPoint else 0

/-- Degrees multiply for composable maps between varieties of equal dimension. -/
theorem deg_comp {A B C : AbelianVariety K} (f : A ⟶ B) (h : B ⟶ C) (hAB : A.dim = B.dim)
    (hBC : B.dim = C.dim) : Hom.deg (f ≫ h) = Hom.deg f * Hom.deg h := by
  sorry

/-- `deg [n] = |n|^(2g)`, with `0 ^ 0 = 1` in dimension zero. -/
theorem deg_mulBy (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (n : ℤ) :
    Hom.deg (mulBy A n) = n.natAbs ^ (2 * g) := by
  sorry

/-- For varieties of equal dimension, a homomorphism is an isogeny iff its degree is nonzero. -/
theorem isIsogeny_iff_deg_ne_zero {A B : AbelianVariety K} (f : A ⟶ B) (hAB : A.dim = B.dim) :
    IsIsogeny f ↔ Hom.deg f ≠ 0 := by
  sorry

/-- Every endomorphism of a zero-dimensional abelian variety has degree one. -/
theorem deg_dimension_zero (A : AbelianVariety K) (hg : A.dim = 0) (α : AbelianVariety.End A) :
    Hom.deg (AbelianVariety.End.toHom α) = 1 := by
  sorry

/-- Check: on an elliptic curve `deg [2] = 4`, in every characteristic. -/
example (A : AbelianVariety K) (hg : A.dim = 1) : Hom.deg (mulBy A 2) = 4 := by
  sorry

/-- Check: in positive dimension the zero endomorphism has degree `0` and the identity degree
`1`. -/
example (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (hpos : 0 < g) :
    Hom.deg (AbelianVariety.End.toHom (0 : AbelianVariety.End A)) = 0 ∧ Hom.deg (𝟙 A) = 1 := by
  sorry

/-- **Images over the original field**: the image of a homomorphism is an abelian subvariety,
through which the homomorphism factors by a surjection (README A6.3). -/
theorem exists_abelianImage {A C : AbelianVariety K} (f : A ⟶ C) :
    ∃ (B : AbelianVariety K) (q : A ⟶ B) (i : B ⟶ C),
      IsClosedImmersion (AbelianVariety.Hom.toSchemeHom i) ∧
        Surjective (AbelianVariety.Hom.toSchemeHom q) ∧ q ≫ i = f := by
  sorry

/-- An abelian variety is **simple** if it is not zero-dimensional and each of its abelian
subvarieties (closed-immersion homomorphisms into it) is zero-dimensional or an isomorphism
(README A6.4). -/
def IsSimple (A : AbelianVariety K) : Prop :=
  A.dim ≠ 0 ∧ ∀ (B : AbelianVariety K) (i : B ⟶ A),
    IsClosedImmersion (AbelianVariety.Hom.toSchemeHom i) →
    B.dim = 0 ∨ IsIso i

/-- Check: a zero-dimensional abelian variety is not simple, so that `End⁰` of a simple abelian
variety is never the zero ring. -/
example (A : AbelianVariety K) (hA : A.dim = 0) : ¬ IsSimple A := fun h => h.1 hA

/-- Check: a product of two positive-dimensional abelian varieties is not simple. -/
example (A B : AbelianVariety K) (gA gB : ℕ)
    (hA : A.dim = (gA : WithBot ℕ∞)) (hB : B.dim = (gB : WithBot ℕ∞))
    (hgA : 0 < gA) (hgB : 0 < gB) : ¬ IsSimple (AbelianVariety.prod A B) := by
  sorry

/-- A nonzero endomorphism of a simple abelian variety is an isogeny. -/
theorem isIsogeny_of_isSimple {A : AbelianVariety K} (hA : IsSimple A) (α : AbelianVariety.End A)
    (hα : α ≠ 0) : IsIsogeny (AbelianVariety.End.toHom α) := by
  sorry

/-- `End⁰` of a simple abelian variety is a division algebra (README A6.4). -/
theorem isUnit_of_isSimple {A : AbelianVariety K} (hA : IsSimple A)
    (x : ℚ ⊗[ℤ] AbelianVariety.End A)
    (hx : x ≠ 0) : IsUnit x := by
  sorry

/-- **Poincaré complete reducibility**: every abelian subvariety `B ⊆ A` has a complement `C`
such that addition `B × C → A` is an isogeny (README A6.5). -/
theorem poincareReducibility {A B : AbelianVariety K} (i : B ⟶ A)
    (hi : IsClosedImmersion (AbelianVariety.Hom.toSchemeHom i)) :
    ∃ (C : AbelianVariety K) (j : C ⟶ A), IsClosedImmersion (AbelianVariety.Hom.toSchemeHom j) ∧
      IsIsogeny ((AbelianVariety.prod.fst B C ≫ i) * (AbelianVariety.prod.snd B C ≫ j)) := by
  sorry

/-- **The degree is a homogeneous polynomial** of degree `2g` on every finite family of
endomorphisms, evaluated at integer points (README A6.6). -/
theorem degree_polynomial (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞))
    {I : Type*} [Fintype I] (e : I → AbelianVariety.End A) :
    ∃ p : MvPolynomial I ℚ, p.IsHomogeneous (2 * g) ∧
      ∀ x : I → ℤ, MvPolynomial.eval (fun i => (x i : ℚ)) p =
        (Hom.deg (AbelianVariety.End.toHom (∑ i, x i • e i)) : ℚ) := by
  sorry

/-- **Hom is free of finite rank**, of rank at most `4 · dim A · dim B` (README A6.7). -/
theorem homFreeFinite (A B : AbelianVariety K) (gA gB : ℕ) (hA : A.dim = (gA : WithBot ℕ∞))
    (hB : B.dim = (gB : WithBot ℕ∞)) :
    Module.Free ℤ (Additive (A ⟶ B)) ∧ Module.Finite ℤ (Additive (A ⟶ B)) ∧
      Module.finrank ℤ (Additive (A ⟶ B)) ≤ 4 * gA * gB := by
  sorry

/-- **`End⁰(A)` is a finite-dimensional semisimple `ℚ`-algebra** (README A6.8). -/
theorem endQ_isSemisimple (A : AbelianVariety K) :
    IsSemisimpleRing (ℚ ⊗[ℤ] AbelianVariety.End A) ∧
      Module.Finite ℚ (ℚ ⊗[ℤ] AbelianVariety.End A) := by
  sorry

/-- **The characteristic polynomial** of an endomorphism: the unique monic integral polynomial of
degree `2g` whose value at every integer `r` is `deg(α − r)` (README A6.10). -/
theorem exists_charpoly (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞))
    (α : AbelianVariety.End A) :
    ∃! P : ℤ[X], P.Monic ∧ P.natDegree = 2 * g ∧
      ∀ r : ℤ,
        P.eval r = (Hom.deg (AbelianVariety.End.toHom (α - (r : AbelianVariety.End A))) : ℤ) := by
  sorry

/-- Check: `(X − n)^(2g)` has the defining property of the characteristic polynomial of `[n]`. -/
example (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (n : ℤ) (r : ℤ) :
    ((X - C n) ^ (2 * g) : ℤ[X]).eval r =
      (Hom.deg (AbelianVariety.End.toHom
        ((n : AbelianVariety.End A) - (r : AbelianVariety.End A))) : ℤ) := by
  sorry

/-- Check: the characteristic polynomial is not the minimal polynomial; for `g > 0` the linear
polynomial `X − n` does not have the defining property for `[n]`. -/
example (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (hpos : 0 < g) (n : ℤ) :
    ¬ ∀ r : ℤ, ((X - C n : ℤ[X])).eval r =
      (Hom.deg (AbelianVariety.End.toHom
        ((n : AbelianVariety.End A) - (r : AbelianVariety.End A))) : ℤ) := by
  sorry

/-- A finite-order endomorphism congruent to the identity modulo an integer at least three
is the identity (README A6.18). Finiteness of the polarized automorphism group supplies finite
order; the congruence follows from killing the scheme-theoretic torsion. -/
theorem eq_one_of_finiteOrder_congruence (A : AbelianVariety K)
    (α β : AbelianVariety.End A) (n : ℤ) (hn : 3 ≤ n) (m : ℕ) (hm : 0 < m)
    (hfinite : α ^ m = 1) (hcongr : α = 1 + n • β) : α = 1 := by
  sorry

/-- Check of the hypothesis `n ≥ 3`: for `n = 2`, `ζ = −1 = 1 + 2 · (−1)` is a root of unity
different from `1`. -/
example : ((-1 : ℚ) = 1 + (2 : ℤ) * (-1 : ℚ)) ∧ (-1 : ℚ) ^ 2 = 1 ∧ (-1 : ℚ) ≠ 1 := by
  norm_num

/-- **Coefficient Hom spaces** (README A6.22): for a commutative `ℚ`-algebra `R`, the coefficient
extension `R ⊗[ℤ] Hom(A, B)`. The objects stay over `K`. -/
abbrev CoefficientHom (A B : AbelianVariety K) (R : Type*) [CommRing R] [Algebra ℚ R] :=
  R ⊗[ℤ] Additive (A ⟶ B)

namespace CoefficientHom

variable {R : Type*} [CommRing R] [Algebra ℚ R]

/-- The identity coefficient arrow. -/
noncomputable def id (A : AbelianVariety K) : CoefficientHom A A R :=
  1 ⊗ₜ[ℤ] Additive.ofMul (𝟙 A)

/-- The coefficient automorphism group: the units of `R ⊗[ℤ] AbelianVariety.End A`. -/
abbrev units (A : AbelianVariety K) := (R ⊗[ℤ] AbelianVariety.End A)ˣ

/-- Check: over dual numbers `1 + εα` has two-sided inverse `1 − εα`. -/
example (A : AbelianVariety K) (ε : R) (hε : ε * ε = 0) (α : R ⊗[ℤ] AbelianVariety.End A) :
    (1 + ε • α) * (1 - ε • α) = 1 ∧ (1 - ε • α) * (1 + ε • α) = 1 := by
  sorry

/-- Check: `2` is a unit of the rational endomorphism algebra, with inverse `1/2`. -/
example (A : AbelianVariety K) :
    (2 : R ⊗[ℤ] AbelianVariety.End A) * ((1 / 2 : ℚ) • (1 : R ⊗[ℤ] AbelianVariety.End A)) = 1 := by
  sorry

end CoefficientHom

/-- **Localized Hom** (README A6.26): for a subring `D ⊆ ℚ`, the coefficient change `D ⊗[ℤ] Hom`. -/
abbrev LocalizedHom (D : Subring ℚ) (A B : AbelianVariety K) :=
  D ⊗[ℤ] Additive (A ⟶ B)

/-- Check: an invertible coefficient acts invertibly on every localized Hom module. -/
example (D : Subring ℚ) (A B : AbelianVariety K) (u : Dˣ) (x : LocalizedHom D A B) :
    (↑u⁻¹ : D) • ((↑u : D) • x) = x := by
  simp [smul_smul]

end OverField

/-! Library declarations this roadmap builds on. -/

#check @AlgebraicGeometry.Scheme.Hom.finrank
#check @AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral
#check @LinearMap.IsPerfPair
#check @TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny
#check @TauCeti.AlgebraicGeometry.AbelianVariety.mulBy
#check @TauCeti.AlmostComplexStructure.IsRiemannForm
#check @TauCeti.AlmostComplexStructure.isRiemannForm_iff_isPolarization
#check @TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos
#check @lieExp
#check @isLocalDiffeomorphAt_lieExp_zero
#check @Matrix.symplecticGroup

/-!
## Targets of the README not typed here

The API and Checks of A0.1 and A2.2 include `AbelianScheme.field_agreement`,
`AbelianScheme.dual_baseChange`, `AbelianScheme.dual_elliptic`, `AbelianScheme.dual_field`,
`AbelianScheme.dual_prod`, `AbelianScheme.dual_product` and `AbelianScheme.dual_zero`.
A3.1 specifies `IsAbelianIsogeny.comp_rank`, `IsAbelianIsogeny.elliptic_two` and
`IsAbelianIsogeny.field_iff`; the last is the field comparison theorem above.
A5.8 specifies `siegelAction_one` and `siegelAction_translation` (tested above).
A6.1 specifies `deg_dual`, `deg_functionField`, `deg_mulBy_two_elliptic`, `deg_zero`,
`deg_frobenius_ne_card_ker` and `deg_neg_one`; its examples above test multiplication
by two and the positive-dimensional zero and identity maps. A6.9 states
`eq_of_padicNorm_roots_products` and `det_aeval_eq_prod_roots` with their hypotheses;
A6.18 states `eq_one_of_root_of_unity` with the necessary bound on the congruence modulus.
A6.22 specifies `CoefficientHom.scalar_isogeny`, `CoefficientHom.dual_numbers`,
`CoefficientHom.zero` and `CoefficientHom.not_field_extension`; its examples above
pin the scalar inverse and the dual-numbers inverse. A6.26 includes
`LocalizedHom.prime_to_p`.

The README states each of these with its hypotheses; most need carriers that are not in the pinned
Mathlib or Tau Ceti.

* **Relative Picard objects** (AlgebraicModuli Layer 7 carriers): `abelianPicardInputs`,
  `relativeSeesaw`, `relativeCube`, `torsionRestriction`, `raynaudRepresentability`,
  `AbelianScheme.dual`, `normalizedPoincare`, `mumfordMap`, `Polarization`,
  `polarizationRepresentatives`, `Polarization.graphBundle` (with `graphBundle_spec`),
  `projectivePresentation`, `nefNormalizedLines`, `AbelianNS` (with `AbelianNS.tensorQ`),
  `ThetaGroup`, `polarizedWeilPairing`, `dualIsogenyCartierKernel`, `Polarization.rosati`,
  `divisorAmpleCriterion`, `principalQuotient`, `symmetricHomRealization`, `polarizedIsogenyDegree`,
  `polarizationType` (parts (2) and (3)), `rosatiPositivity`, `rationalNSAmpleCone`, `neronSeveriRank`,
  `reducedTraceComparison`, `polarizedAutomorphisms`, `polarizationOrbits`, `realIsometries`,
  `WeakPolarization`, `Morikawa`.
* **Coherent and intersection-theoretic carriers**: `relativeInvariantForms`,
  `ampleCohomologyAndDegree`, `ampleIntersectionPositive`, `AbelianHodgeLine`.
* **Finite flat quotients and level structures**: `AbelianQuotient`, `torsionDivisibility`,
  `FullLevel`, `genusTwoTwoTorsion`, `homDescentFullLevel`.
* **Étale and `ℓ`-adic realizations** (with the étale cohomology of the CohomologicalPointCounting
  roadmaps for `exteriorCohomology`): `AbelianTate`, `homTateInjective`, `charpolyTate`,
  `traceDegreeSubfield`, `frobeniusSemisimple`, `exteriorCohomology`, `weilRestrictionTate`.
* **De Rham, divided-power and Barsotti–Tate carriers**: `AbelianVectorExtension`, `AbelianH1dR`,
  `BarsottiTate`, `AbelianPD`, `grothendieckMessing`, `polarizedEffectivity`, `serreTate`,
  `SerreTate.q`, `ordinaryFrobeniusWeighted`, `oddPrimeLifting`, `dyadicOrdinaryLifting`,
  `genusTwoJacobianLifting`, `polarizedFormalAlgebraization`, `genusTwoFormalEffectivity`.
* **Riemann forms** (Tau Ceti's `IsRiemannForm`, current library): `RiemannForm.hermitian`,
  `RiemannForm.im_hermitian`, `RiemannForm.hermitian_self_pos`,
  `RiemannForm.scale`, `RiemannForm.pullback`, `RiemannForm.homological`, `RiemannForm.hodgeDual`.
* **Complex analytic carriers**: `AbelianLattice`, `appellHumbert`, `polarizedHodgeEquivalence`,
  `analyticFamilies`, `realizationConventions`, `SiegelFamily` (beyond the Siegel space above),
  `cmIsotypic`.
* **Products and boundaries over a base**: `relativeProductsAndDimension` (beyond the
  dimension-zero case above), `fieldAndEllipticBoundary`.
* **Algebraic spaces and relative Hom**: `relativeEllipticEquivalence`, `relativeHom`,
  `CoefficientIsog`, `AbelianTwist`, `twistRealizations`, `weilRestriction`,
  `weilRestrictionSplits`, `weilRestrictionAbelian`, `QuadraticAbelianTwist`, `CurveGenerated`.
-/

end TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

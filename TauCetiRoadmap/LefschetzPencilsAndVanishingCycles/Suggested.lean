import Mathlib
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent
import TauCetiRoadmap.StableReduction.Suggested

/-!
# Lefschetz pencils, nearby cycles and vanishing cycles: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Nearby and vanishing cycles, Lefschetz pencils, perverse sheaves, semistable models and the other
geometric objects of the roadmap have no carriers in the pinned Mathlib and Tau Ceti: they are
targets of the README, with their intended signatures there, and do not appear here. What remains
is the linear algebra and commutative algebra that the geometric theorems reduce to, placed in the
layer of the README to which it belongs.

Design choices made explicit here:
* over a field, an ordinary quadratic form is Mathlib's `QuadraticMap.Nondegenerate` on a nonzero
  space; this is the characteristic-free notion, and no invertibility of two is assumed;
* the coordinate expansion of a quadratic form uses `Q (e i)` on the diagonal and the polar form
  off the diagonal, with no division by two, and "order at least three" is Mathlib's total-degree
  order, `3 ≤ MvPowerSeries.order R`;
* the centre of the even Clifford algebra is Mathlib's
  `Subalgebra.center K (CliffordAlgebra.even Q)`, with no separate name; Tau Ceti computes it when
  two is invertible (`CliffordAlgebra.adjoinRootEquivCenterEven`), and the theorem below covers
  characteristic two;
* local monodromy operators are Mathlib's `LinearMap.transvection` of the functional `c • B.flip δ`,
  covering transvections and reflections at once;
* the normalization differential lives on the oriented dual graph
  `TauCetiRoadmap.StableReduction.DualGraph`, the tail of an edge `e` being `endpoint e 0` and its
  head `endpoint e 1`;
* Frobenius spectra are compared through `Module.End.HasEigenvalue` over an algebraically closed
  field, which is the form in which the invariant-cycle theorems are stated.

Names are relative to the namespace `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles`; the README
writes them relative to the suggested home `TauCeti.AlgebraicGeometry`.
-/

namespace TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

/-! ## Layer LPV.0: Nearby and vanishing cycles over a henselian trait

The trait diagram of the README is built on Tau Ceti's generic and special fibres. -/

#check TauCeti.genericFiber
#check TauCeti.specialFiber

/-! ## Layer LPV.1: Inertia, variation and the monodromy operator -/

namespace VanishingCycles

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- A nilpotent endomorphism of a nonzero space of dimension `n` is maximally nilpotent when
`N ^ n = 0` and `N ^ (n - 1) ≠ 0`, that is, when it is a single Jordan block (Qian 2023,
Definition 3.6). The zero space is excluded. Belongs to README 1.6. -/
def IsMaximallyNilpotent (N : Module.End K V) : Prop :=
  0 < Module.finrank K V ∧ N ^ Module.finrank K V = 0 ∧ N ^ (Module.finrank K V - 1) ≠ 0

/-- A linear automorphism is maximally unipotent when `T - 1` is maximally nilpotent, that is,
when its minimal polynomial is `(X - 1) ^ n`. README 1.6. -/
def IsMaximallyUnipotent (T : LinearMap.GeneralLinearGroup K V) : Prop :=
  IsMaximallyNilpotent ((T : Module.End K V) - 1)

/-- A maximally unipotent automorphism is unipotent in the sense of Tau Ceti. -/
theorem IsMaximallyUnipotent.isUnipotent {T : LinearMap.GeneralLinearGroup K V}
    (hT : IsMaximallyUnipotent T) : LinearMap.GeneralLinearGroup.IsUnipotent T := by
  sorry

/-- The kernels of the powers of a maximally nilpotent endomorphism have the dimensions of a
single Jordan block. README 1.6, `maximalNilpotent_kernel_rank`. -/
theorem maximalNilpotent_kernel_rank [FiniteDimensional K V] {N : Module.End K V}
    (hN : IsMaximallyNilpotent N) (j : ℕ) :
    Module.finrank K (LinearMap.ker (N ^ j)) = min j (Module.finrank K V) := by
  sorry

/-- Maximal nilpotence is invariant under conjugation. -/
theorem maximalNilpotent_conj {W : Type*} [AddCommGroup W] [Module K W] (e : V ≃ₗ[K] W)
    {N : Module.End K V} (hN : IsMaximallyNilpotent N) :
    IsMaximallyNilpotent ((e : V →ₗ[K] W) ∘ₗ N ∘ₗ (e.symm : W →ₗ[K] V)) := by
  sorry

/-- README check `maximal_three_block`: the size-three Jordan block is maximally nilpotent. -/
example : IsMaximallyNilpotent
    (Matrix.toLin' !![(0 : ℚ), 1, 0; 0, 0, 1; 0, 0, 0] : Module.End ℚ (Fin 3 → ℚ)) := by
  sorry

/-- README check `maximal_not_two_plus_one`: a size-two Jordan block plus a trivial line is not
maximally nilpotent. -/
example : ¬ IsMaximallyNilpotent
    (Matrix.toLin' !![(0 : ℚ), 1, 0; 0, 0, 0; 0, 0, 0] : Module.End ℚ (Fin 3 → ℚ)) := by
  sorry

/-- README check `maximal_zero_dimension_excluded`: the zero space is excluded from the
definition. -/
example : ¬ IsMaximallyNilpotent (0 : Module.End ℚ (Fin 0 → ℚ)) := by
  sorry

/-- Zero on a line is maximally nilpotent. README `maximal_one_dimension`. -/
example : IsMaximallyNilpotent (0 : Module.End ℚ ℚ) := by
  sorry

/-- Identity on a line is maximally unipotent. README `maximal_one_dimension`. -/
example : IsMaximallyUnipotent (1 : LinearMap.GeneralLinearGroup ℚ ℚ) := by
  sorry

/-- The automorphism with matrix `1+J₃` is maximal. README `maximal_unipotent_three_block`. -/
example (T : LinearMap.GeneralLinearGroup ℚ (Fin 3 → ℚ))
    (hT : (T : Module.End ℚ (Fin 3 → ℚ)) =
      Matrix.toLin' !![(1 : ℚ), 1, 0; 0, 1, 1; 0, 0, 1]) :
    IsMaximallyUnipotent T := by
  sorry

/-- The automorphism with matrix `1+(J₂⊕0)` is not maximal.
README `maximal_unipotent_not_two_plus_one`. -/
example (T : LinearMap.GeneralLinearGroup ℚ (Fin 3 → ℚ))
    (hT : (T : Module.End ℚ (Fin 3 → ℚ)) =
      Matrix.toLin' !![(1 : ℚ), 1, 0; 0, 1, 0; 0, 0, 1]) :
    ¬ IsMaximallyUnipotent T := by
  sorry

/-- Identity in dimension two is not maximal. README `maximal_unipotent_identity_two`. -/
example : ¬ IsMaximallyUnipotent (1 : LinearMap.GeneralLinearGroup ℚ (Fin 2 → ℚ)) := by
  sorry

end VanishingCycles

/-! ## Layer LPV.2: Ordinary quadratic singularities and the Picard–Lefschetz formula -/

namespace Quadric

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- Over a field, a quadratic form is ordinary when the space is nonzero and the form is
nondegenerate in Mathlib's characteristic-free sense (radical zero, polar kernel of rank at most
one). This is the field case of the README's `Quadric.IsOrdinary` (README 2.1,
`isOrdinary_iff_nondegenerate`). -/
def IsOrdinaryOverField (Q : QuadraticForm K V) : Prop :=
  Nontrivial V ∧ Q.Nondegenerate

/-- Over a field in which two is invertible, ordinarity is nondegeneracy of the polar form. -/
theorem isOrdinaryOverField_iff_polar_nondegenerate [Invertible (2 : K)] [Nontrivial V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) :
    IsOrdinaryOverField Q ↔ (QuadraticMap.polarBilin Q).Nondegenerate := by
  sorry

/-- README check `isOrdinary_xy_add_sq_char_two`: over any field of characteristic two, `xy + z²`
is ordinary: the polar form has kernel the line of `e₂`, on which the form does not vanish, so the
conic `xy = z²` is smooth. -/
example [CharP K 2] : IsOrdinaryOverField
    (QuadraticMap.proj 0 1 + QuadraticMap.proj 2 2 : QuadraticForm K (Fin 3 → K)) := by
  sorry

/-- README check `not_isOrdinary_sum_sq_char_two`: over any field of characteristic two,
`x² + y² = (x + y)²` is not ordinary: `(1, 1)` lies in the radical. -/
example [CharP K 2] : ¬ IsOrdinaryOverField
    (QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1 : QuadraticForm K (Fin 2 → K)) := by
  sorry

/-- The coordinate expansion of a quadratic form on `Fin r → K` as a power series: the diagonal
coefficients are `Q (e i)` and the coefficient of `X i * X j`, `i < j`, is `polar Q (e i) (e j)`,
with no division by two. README 2.4. -/
noncomputable def quadraticSeries {r : ℕ} (Q : QuadraticForm K (Fin r → K)) :
    MvPowerSeries (Fin r) K :=
  (∑ i : Fin r, algebraMap K (MvPowerSeries (Fin r) K) (Q (Pi.single i 1)) *
      (MvPowerSeries.X i) ^ 2) +
    ∑ i : Fin r, ∑ j ∈ Finset.univ.filter (fun j => i < j),
      algebraMap K (MvPowerSeries (Fin r) K)
          (QuadraticMap.polar Q (Pi.single i 1) (Pi.single j 1)) *
        MvPowerSeries.X i * MvPowerSeries.X j

/-- The formal germ of an ordinary quadratic point in `r = n + 1` variables: a `K`-algebra
isomorphic to `K⟦x₁, …, x_r⟧ / (Q + R)` with `Q` ordinary and `R` of order at least three, that is
every coefficient of `R` of total degree at most two vanishes (Mathlib's `MvPowerSeries.order`,
with `MvPowerSeries.le_order` and `MvPowerSeries.coeff_of_lt_order`). This is the field
specialization of the README's `Quadric.IsOrdinaryQuadraticPoint` (README 2.4). -/
def IsOrdinaryQuadraticGerm (A : Type*) [CommRing A] [Algebra K A] (r : ℕ) : Prop :=
  0 < r ∧ ∃ (Q : QuadraticForm K (Fin r → K)) (R : MvPowerSeries (Fin r) K),
    IsOrdinaryOverField Q ∧ 3 ≤ R.order ∧
      Nonempty (A ≃ₐ[K] (MvPowerSeries (Fin r) K ⧸ Ideal.span {quadraticSeries Q + R}))

/-- The cone of an ordinary form is an ordinary germ. README 2.4,
`isOrdinaryQuadraticPoint_cone`. -/
theorem isOrdinaryQuadraticGerm_cone {r : ℕ} (hr : 0 < r) (Q : QuadraticForm K (Fin r → K))
    (hQ : IsOrdinaryOverField Q) :
    IsOrdinaryQuadraticGerm (K := K)
      (MvPowerSeries (Fin r) K ⧸ Ideal.span {quadraticSeries Q}) r := by
  sorry

/-- For the product of two coordinates the expansion is the monomial `X i * X j`, including the
case `i = j`. README 2.4, `quadraticSeries_proj`. -/
example : quadraticSeries (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 2 → ℚ)) =
    MvPowerSeries.X 0 * MvPowerSeries.X 1 := by
  sorry

/-- The diagonal case: `x₀²` expands to `X 0 ^ 2`, with no factor of two. -/
example : quadraticSeries (QuadraticMap.proj 0 0 : QuadraticForm ℚ (Fin 2 → ℚ)) =
    MvPowerSeries.X 0 ^ 2 := by
  sorry

/-- For an ordinary form of even rank the centre `Z(Q)` of the even Clifford algebra has
dimension two, in every characteristic. When two is invertible this is Tau Ceti's
`CliffordAlgebra.adjoinRootEquivCenterEven` (`Z(Q) ≅ K[X]/(X² - d)`); in characteristic two `Z(Q)`
is the Arf (Artin–Schreier) algebra of `Q`. The field case of README 2.2,
`center_even_isEtale`. -/
theorem finrank_center_even [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : IsOrdinaryOverField Q) (heven : Even (Module.finrank K V)) :
    Module.finrank K (Subalgebra.center K (CliffordAlgebra.even Q)) = 2 := by
  sorry

/-- The rank-one square is ordinary. README `isOrdinary_rank_one`. -/
example : IsOrdinaryOverField
    (QuadraticMap.proj 0 0 : QuadraticForm ℚ (Fin 1 → ℚ)) := by
  sorry

/-- Rank zero is excluded. README `isOrdinary_zero_rank_excluded`. -/
example : ¬ IsOrdinaryOverField (0 : QuadraticForm ℚ (Fin 0 → ℚ)) := by
  sorry

/-- The characteristic-two expansion of `xy+z²` keeps the mixed term.
README 2.4, `quadraticSeries`. -/
example [CharP K 2] : quadraticSeries
    (QuadraticMap.proj 0 1 + QuadraticMap.proj 2 2 : QuadraticForm K (Fin 3 → K)) =
    MvPowerSeries.X 0 * MvPowerSeries.X 1 + (MvPowerSeries.X 2) ^ 2 := by
  sorry

end Quadric

/-! ## Layer LPV.4: Global vanishing cycles -/

namespace LefschetzPencil

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The local monodromy operator `x ↦ x + c (x, δ) δ`: a transvection when `(δ, δ) = 0` and a
reflection when `c (δ, δ) = -2`. README 4.3. -/
def localTransvection (B : LinearMap.BilinForm K V) (c : K) (δ : V) : Module.End K V :=
  LinearMap.transvection (c • B.flip δ) δ

/-- The common fixed space of the local operators is the orthogonal of the span of the vanishing
cycles. README 4.3 (Weil I, Proposition 5.3). -/
theorem fixedSpace_localTransvections {ι : Type*} [Finite ι] (B : LinearMap.BilinForm K V)
    (hB : B.IsRefl) (c : ι → K) (hc : ∀ i, c i ≠ 0) (δ : ι → V) :
    (⨅ i, LinearMap.ker (localTransvection B (c i) (δ i) - 1)) =
      B.orthogonal (Submodule.span K (Set.range δ)) := by
  sorry

/-- README check `fixedSpace_reflection`: on `ℚ²` with the dot product, the reflection in
`δ = (1, -1)` swaps the coordinates. -/
example : localTransvection (Matrix.toBilin' (1 : Matrix (Fin 2) (Fin 2) ℚ)) (-1) ![1, -1]
    ![1, 0] = ![0, 1] := by
  sorry

/-- Reflections in an `A₂` pair of roots of square two with pairing `-1`: the composite has trace
`-1 = dim E - 4 + (δ, δ')²`, the identity used in README 5.10 (Weil II, p. 230, prints the
constant `2` in place of `4`, which would give `1` here). -/
example : LinearMap.trace ℚ (Fin 2 → ℚ)
    (localTransvection (Matrix.toBilin' !![(2 : ℚ), -1; -1, 2]) (-1) ![1, 0] ∘ₗ
      localTransvection (Matrix.toBilin' !![(2 : ℚ), -1; -1, 2]) (-1) ![0, 1]) = -1 := by
  sorry

/-- A plane symplectic transvection fixes precisely its isotropic line.
README `fixedSpace_symplectic_plane`. -/
example : LinearMap.ker
    (localTransvection (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) 1 ![1, 0] - 1) =
    Submodule.span ℚ {![1, 0]} := by
  sorry

/-- A zero vanishing vector gives identity. README `fixedSpace_symplectic_plane`. -/
example : localTransvection (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) 1
    (0 : Fin 2 → ℚ) = 1 := by
  sorry

/-- A zero coefficient gives identity even for a nonzero vector.
README `fixedSpace_needs_nonzero_coefficient`. -/
example : localTransvection (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) 0 ![1, 0] = 1 := by
  sorry

/-- The radical `E ∩ E^⊥` of the restriction of `B` to `E`, as a submodule of `E`. README 4.4. -/
def vanishingRadical (B : LinearMap.BilinForm K V) (E : Submodule K V) : Submodule K E :=
  (B.orthogonal E).comap E.subtype

/-- The radical quotient `E / (E ∩ E^⊥)`. README 4.4, `vanishingQuotient`. -/
abbrev vanishingQuotient (B : LinearMap.BilinForm K V) (E : Submodule K V) :=
  E ⧸ vanishingRadical B E

/-- A reflexive form induces a nondegenerate form on the radical quotient. README 4.4,
`vanishingForm`, `vanishingForm_nondegenerate`, `vanishingForm_mk`. -/
theorem exists_vanishingForm (B : LinearMap.BilinForm K V) (hB : B.IsRefl) (E : Submodule K V) :
    ∃ ψ : LinearMap.BilinForm K (vanishingQuotient B E), ψ.Nondegenerate ∧
      ∀ x y : E, ψ (Submodule.mkQ _ x) (Submodule.mkQ _ y) = B x y := by
  sorry

/-- The standard symplectic form on `ℚ⁴` with `B(e₀, e₁) = B(e₂, e₃) = 1`. -/
def stdSymplectic4 : LinearMap.BilinForm ℚ (Fin 4 → ℚ) :=
  Matrix.toBilin' !![0, 1, 0, 0; -1, 0, 0, 0; 0, 0, 0, 1; 0, 0, -1, 0]

/-- README check `vanishingQuotient_radical`: `E = span(e₀, e₁, e₂)` has radical `ℚ e₂` and a
two-dimensional radical quotient. -/
example : Module.finrank ℚ (vanishingQuotient stdSymplectic4
    (Submodule.span ℚ {Pi.single 0 1, Pi.single 1 1, Pi.single 2 1})) = 2 := by
  sorry

/-- README check `vanishingQuotient_radical`, second half: the totally isotropic `span(e₀, e₂)` has
zero radical quotient. -/
example : Module.finrank ℚ (vanishingQuotient stdSymplectic4
    (Submodule.span ℚ {Pi.single 0 1, Pi.single 2 1})) = 0 := by
  sorry

/-- The conic-pencil radical quotient is a line. README `vanishingQuotient_conic`. -/
example : Module.finrank ℚ (vanishingQuotient
    (Matrix.toBilin' (1 : Matrix (Fin 2) (Fin 2) ℚ))
    (Submodule.span ℚ {![1, -1]})) = 1 := by
  sorry

/-- The conic generator has square two. README `vanishingQuotient_conic`. -/
example : Matrix.toBilin' (1 : Matrix (Fin 2) (Fin 2) ℚ) ![1, -1] ![1, -1] = 2 := by
  sorry

/-- The first ordered basis pairing fixes the sign of `stdSymplectic4`. README 4.4. -/
example : stdSymplectic4 (Pi.single 0 1) (Pi.single 1 1) = 1 := by
  sorry

/-- Reversing the basis pair reverses its sign. README 4.4. -/
example : stdSymplectic4 (Pi.single 1 1) (Pi.single 0 1) = -1 := by
  sorry

/-- The matrix of `stdSymplectic4` has determinant one. README 4.4. -/
example : Matrix.det (!![(0 : ℚ), 1, 0, 0; -1, 0, 0, 0;
    0, 0, 0, 1; 0, 0, -1, 0] : Matrix (Fin 4) (Fin 4) ℚ) = 1 := by
  sorry

/-- The standard four-dimensional symplectic form is nondegenerate. README 4.4. -/
example : stdSymplectic4.Nondegenerate := by
  sorry

/-! ## Layer LPV.5: Conjugacy, monodromy and the open image theorem -/

attribute [local instance 100] LieRing.ofAssociativeRing

/-- The rank-one nilpotent `N(δ) : x ↦ ψ(x, δ) δ`. README 5.6. -/
def symplecticTransvectionGenerator (B : LinearMap.BilinForm K V) (δ : V) : Module.End K V :=
  (B.flip δ).smulRight δ

/-- Weil I, Lemme 5.11: a Lie subalgebra of `𝔰𝔭(V, ψ)` acting irreducibly and generated by
operators `N(δ_i)` is all of `𝔰𝔭(V, ψ)`. README 5.6. -/
theorem eq_skewAdjoint_of_generated [CharZero K] [FiniteDimensional K V]
    (B : LinearMap.BilinForm K V) (hB : LinearMap.IsAlt B) (hBnd : B.Nondegenerate)
    (L : LieSubalgebra K (Module.End K V)) (hL : L ≤ skewAdjointLieSubalgebra B)
    {ι : Type*} (δ : ι → V)
    (hgen : LieSubalgebra.lieSpan K (Module.End K V)
      (Set.range fun i => symplecticTransvectionGenerator B (δ i)) = L)
    [LieModule.IsIrreducible K L V] :
    L = skewAdjointLieSubalgebra B := by
  sorry

/-- The two plane generators generate the full symplectic Lie algebra. README 5.6. -/
example : LieSubalgebra.lieSpan ℚ (Module.End ℚ (Fin 2 → ℚ))
    (Set.range fun i : Fin 2 => symplecticTransvectionGenerator
      (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) (Pi.single i 1)) =
    skewAdjointLieSubalgebra (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) := by
  sorry

/-- Transvection generators scale quadratically and square to zero. README 5.6. -/
example (c : ℚ) (δ : Fin 2 → ℚ) :
    symplecticTransvectionGenerator (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) (c • δ) =
      c ^ 2 • symplecticTransvectionGenerator (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) δ ∧
    (symplecticTransvectionGenerator (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) δ) ^ 2 = 0 ∧
    symplecticTransvectionGenerator (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) δ ∈
      skewAdjointLieSubalgebra (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) := by
  sorry

/-- A single plane generator spans a one-dimensional Lie algebra and fails simplicity.
README 5.6. -/
example : let L := (LieSubalgebra.lieSpan ℚ (Module.End ℚ (Fin 2 → ℚ))
      {symplecticTransvectionGenerator (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]) ![1, 0]})
    Module.finrank ℚ L = 1 ∧ ¬ LieModule.IsIrreducible ℚ L (Fin 2 → ℚ) := by
  sorry

end LefschetzPencil

/-! ## Layer LPV.7a: Semistable curves and strictly semistable degenerations -/

namespace Semistable

open TauCetiRoadmap.StableReduction

variable {Λ : Type*} [CommRing Λ] {Ed : Type*}

/-- The normalization differential `(d a)(e) = a(tail e) - a(head e)` of the oriented dual graph
`Γ` of a nodal curve, the StableReduction roadmap's `DualGraph`, whose edge `e` has two branch labels in `Fin 2`, even for loops, with tail
`Γ.endpoint e 0` and head `Γ.endpoint e 1`. It is the degree-zero map of the two-term complex
computing `H⁰(Γ, Λ)` and `H¹(Γ, Λ)`. Its dual is the negative of the target-minus-source
integral boundary owned by NeronModelsAndSemistableAbelianVarieties §4.2. README 7a.1. -/
def normalizationDifferential (Γ : DualGraph) : (Γ.Vertex → Λ) →ₗ[Λ] (Γ.Edge → Λ) where
  toFun a e := a (Γ.endpoint e 0) - a (Γ.endpoint e 1)
  map_add' a b := by
    funext e
    simp only [Pi.add_apply]
    ring
  map_smul' c a := by
    funext e
    simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring

/-- `d` kills constant vertex functions. README 7a.1. -/
theorem normalizationDifferential_constant (Γ : DualGraph) (c : Λ) :
    normalizationDifferential Γ (fun _ => c) = 0 := by
  sorry

/-- README check `normalization_loop_test`: on the graph with one vertex and one loop, `d = 0`, so
the edge quotient is `Λ`, not zero: a loop is a cycle of the dual graph. -/
example : normalizationDifferential (Λ := ℚ)
    ({ Vertex := Unit, Edge := Unit, endpoint := fun _ _ => (), genus := fun _ => 0,
       connected := fun _ _ => .refl } : DualGraph) = 0 := by
  sorry

/-- A tree has surjective normalization differential and zero edge quotient.
README `normalization_tree_test`. -/
example : let Γ : DualGraph :=
      { Vertex := Fin 2, Edge := Unit, endpoint := fun _ i => i,
        genus := fun _ => 0, connected := by sorry }
    (∀ a b : ℚ, normalizationDifferential Γ ![a, b] = fun _ => a - b) ∧
      Module.finrank ℚ ((Γ.Edge → ℚ) ⧸ LinearMap.range (normalizationDifferential (Λ := ℚ) Γ)) = 0 := by
  sorry

/-- Parallel edges remain two coordinates and give a rank-one quotient.
README `normalization_parallel_test`. -/
example : let Γ : DualGraph :=
      { Vertex := Fin 2, Edge := Fin 2, endpoint := fun _ i => i,
        genus := fun _ => 0, connected := by sorry }
    (∀ a b : ℚ, normalizationDifferential Γ ![a, b] = ![a - b, a - b]) ∧
      Module.finrank ℚ ((Γ.Edge → ℚ) ⧸ LinearMap.range (normalizationDifferential (Λ := ℚ) Γ)) = 1 := by
  sorry

/-- Illusie's negative thickness-weighted edge form `u₋(a, b) = -Σ_e n_e a_e b_e`. README 7a.3. -/
def negEdgePairing [Fintype Ed] [DecidableEq Ed] (n : Ed → ℕ) : LinearMap.BilinForm Λ (Ed → Λ) :=
  Matrix.toBilin' (-(Matrix.diagonal fun e => (n e : Λ)))

/-- For the two-edge cycle of unit thickness the graph cycle `(1, -1)` has `u₋`-norm `-2`. -/
example : negEdgePairing (Λ := ℚ) (fun _ : Fin 2 => 1) ![1, -1] ![1, -1] = -2 := by
  sorry

/-- A thickness-three edge has norm minus three. README 7a.3, `negEdgePairing`. -/
example : negEdgePairing (Λ := ℚ) (fun _ : Fin 1 => 3) ![1] ![1] = -3 := by
  sorry

/-- Distinct edges are orthogonal in the negative edge form. README 7a.3. -/
example : negEdgePairing (Λ := ℚ) (fun _ : Fin 2 => 3) ![1, 0] ![0, 1] = 0 := by
  sorry

/-- Doubling thicknesses doubles the form. README 7a.3. -/
example [Fintype Ed] [DecidableEq Ed] (n : Ed → ℕ) (a b : Ed → Λ) :
    negEdgePairing (fun e => 2 * n e) a b = 2 * negEdgePairing n a b := by
  sorry

end Semistable

/-! ## Layer LPV.7b: Invariant cycles -/

namespace InvariantCycles

/-- The specialization map corestricted to the inertia invariants. README 7b.1. -/
noncomputable def invariantSpecialization {G k W V : Type*} [Group G] [CommRing k] [AddCommGroup V]
    [Module k V] [AddCommGroup W] [Module k W] (ρ : Representation k G V) (sp : W →ₗ[k] V)
    (h : ∀ w, sp w ∈ ρ.invariants) : W →ₗ[k] ρ.invariants :=
  LinearMap.codRestrict ρ.invariants sp h

/-- Identity specialization onto a trivial line is onto the invariants.
README `invariant_sp_identity_test`. -/
example (h : ∀ x : ℚ, x ∈ (Representation.trivial ℚ Unit ℚ).invariants) :
    Function.Surjective (invariantSpecialization (Representation.trivial ℚ Unit ℚ)
      LinearMap.id h) := by
  sorry

/-- Zero specialization onto a trivial line is not onto the invariants.
README `invariant_sp_zero_test`. -/
example (h : ∀ x : ℚ, (0 : ℚ →ₗ[ℚ] ℚ) x ∈
    (Representation.trivial ℚ Unit ℚ).invariants) :
    ¬ Function.Surjective (invariantSpecialization (Representation.trivial ℚ Unit ℚ) 0 h) := by
  sorry

/-- The shear invariants are its fixed line; identity does not corestrict.
README `invariant_sp_unipotent_test`. -/
example : let ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ) :=
      { toFun := fun t => Matrix.toLin' !![(1 : ℚ), ((Multiplicative.toAdd t : ℤ) : ℚ); 0, 1]
        map_one' := by sorry
        map_mul' := by sorry }
    let sp : ℚ →ₗ[ℚ] (Fin 2 → ℚ) := LinearMap.pi fun i => if i = 0 then LinearMap.id else 0
    (∃ h : ∀ x, sp x ∈ ρ.invariants, Function.Surjective (invariantSpecialization ρ sp h)) ∧
      ¬ (∀ v : Fin 2 → ℚ, (LinearMap.id : Module.End ℚ (Fin 2 → ℚ)) v ∈ ρ.invariants) := by
  sorry

/-- Spectral separation (README 7b.5): in an exact cross `L → M → C`, `M ↠ B` of
finite-dimensional spaces over an algebraically closed field, equivariant for endomorphisms of
`M`, `C` and `B`, if no eigenvalue on `B` is an eigenvalue on `C` then `L → B` is surjective. This
is the step of Weil II 3.6.1 that the weight bounds feed. -/
theorem surjective_of_disjoint_spectra {K L M C B : Type*} [Field K] [IsAlgClosed K]
    [AddCommGroup L] [Module K L] [AddCommGroup M] [Module K M] [FiniteDimensional K M]
    [AddCommGroup C] [Module K C] [FiniteDimensional K C]
    [AddCommGroup B] [Module K B] [FiniteDimensional K B]
    (f : L →ₗ[K] M) (g : M →ₗ[K] C) (p : M →ₗ[K] B) (hfg : Function.Exact f g)
    (hp : Function.Surjective p) (FM : Module.End K M) (FC : Module.End K C)
    (FB : Module.End K B) (hg : g ∘ₗ FM = FC ∘ₗ g) (hpF : p ∘ₗ FM = FB ∘ₗ p)
    (hdisj : ∀ μ : K, FB.HasEigenvalue μ → ¬ FC.HasEigenvalue μ) :
    Function.Surjective (p ∘ₗ f) := by
  sorry

/-- Overlapping spectra do not force surjectivity. README `separation_needed`. -/
example : let f : (Fin 0 → ℂ) →ₗ[ℂ] ℂ := 0
    let g : ℂ →ₗ[ℂ] ℂ := LinearMap.id
    let p : ℂ →ₗ[ℂ] ℂ := LinearMap.id
    Function.Exact f g ∧ Function.Surjective p ∧
      (1 : Module.End ℂ ℂ).HasEigenvalue 1 ∧ ¬ Function.Surjective (p ∘ₗ f) := by
  sorry

/-- A zero upper term leaves an onto map to the right term.
README `separation_trivial_C`. -/
example : let f : ℂ →ₗ[ℂ] ℂ := LinearMap.id
    let g : ℂ →ₗ[ℂ] (Fin 0 → ℂ) := 0
    let p : ℂ →ₗ[ℂ] ℂ := LinearMap.id
    Function.Exact f g ∧
      (∀ μ : ℂ, ¬ (0 : Module.End ℂ (Fin 0 → ℂ)).HasEigenvalue μ) ∧
      Function.Surjective (p ∘ₗ f) := by
  sorry

/-- Distinct coordinate eigenvalues separate the exact cross.
README `separation_two_eigenvalues`. -/
example (q : ℂ) (hq : q ≠ 1) :
    let f : ℂ →ₗ[ℂ] (Fin 2 → ℂ) := LinearMap.pi fun i => if i = 0 then LinearMap.id else 0
    let g : (Fin 2 → ℂ) →ₗ[ℂ] ℂ := LinearMap.proj 1
    let p : (Fin 2 → ℂ) →ₗ[ℂ] ℂ := LinearMap.proj 0
    let F : Module.End ℂ (Fin 2 → ℂ) := Matrix.toLin' !![(1 : ℂ), 0; 0, q]
    Function.Exact f g ∧ g ∘ₗ F = (q • LinearMap.id) ∘ₗ g ∧
      p ∘ₗ F = p ∧
      (∀ μ : ℂ, (1 : Module.End ℂ ℂ).HasEigenvalue μ →
        ¬ (q • LinearMap.id : Module.End ℂ ℂ).HasEigenvalue μ) ∧
      Function.Surjective (p ∘ₗ f) := by
  sorry

end InvariantCycles

/-!
## Targets stated in the README only

The prerequisite targets of Layer LPV.F and the remaining targets of the README have no carriers in the pinned Mathlib and Tau Ceti and are
stated there only, with their intended signatures: the henselian trait diagram, the tame character
of a henselian trait and absolute purity (0.1, 0.10); the topos `X_s ×_s S`, `Ψ`, `RΨ`, `RΦ`, the
variation and their functoriality (0.2–0.9); Grothendieck's monodromy theorems, the twisted
operator `N`, the monodromy filtration in an abelian category and its primitive decomposition, the
relative filtration, `can` and `var`, the filtered derived category and the two-component
semistable complex, and the semisimple trace (1.1–1.10); quadrics, their cohomology, ordinary
quadratic points over a base, standard degenerations and the Picard–Lefschetz theory (2.1–2.8);
Lefschetz pencils, Veronese embeddings, dual varieties and the existence of pencils (3.1–3.5); the
direct images of a pencil, the vanishing subspace and the blow-up formulas (4.1–4.5); Bertini,
conjugacy, generation, irreducibility, the middle-degree reduction, compact `ℓ`-adic subgroups, the
Kazhdan–Margulis theorem, the orthogonal and characteristic-two branches and the gcd lemma
(5.1–5.11); Gabber's perversity theorems and the tower criterion (6.1–6.6); nodal curves, the
Jacobian comparison and the weight spectral sequence (7a.1–7a.9); and the invariant-cycle theorems
(7b.1–7b.11). The README names of their API and checks, by namespace:

* `VanishingCycles`: `constructibleEtale`, `fieldSheavesEquiv`, `lisseMonodromyEquiv`,
  `enhancedDerivedSheaves`, `filteredColimit_cohomology`, `etaleBaseChange`, `etaleCompactSupports`,
  `nagataCompactification`, `etaleFiniteness`, `genericLocalAcyclicity`, `adicRealization`,
  `etaleExceptionalInverseImage`, `etaleVerdierDuality`, `smoothPurity`, `smoothPairGysin`,
  `etaleProjectiveBundle`, `etaleBlowup`, `etaleWeakLefschetz`, `fieldPerverseTStructure`,
  `intermediateExtension`, `etaleBettiComparison`, `frobeniusCohomology`, `etaleTraceFormula`,
  `PointwisePure`, `purity_pointwiseReduction`, `FSLogScheme`, `galoisSemistableAlteration`,
  `equivariantLogResolution`, `regularLogResolution`, `logSmooth_pointwisePure`,
  `pointwisePure_descent`, `RPhi_eq_zero_iff_locallyAcyclic`, `RPhi_node`, `RPhi_smooth`, `RPsi_stalk`,
  `RPsi_trait`, `equivSheavesOnTrait_constant`, `equivSheavesOnTrait_degenerate`,
  `equivSheavesOnTrait_jPushforward`, `filtrationFrobenius_mk`, `filtrationRepresentation_mk`,
  `gradedN_mk`, `inertia_eq_top_of_strictlyHenselian`, `inertia_eq_valuation_inertia`,
  `inertia_puiseux`, `maximalLog_iff`, `maximal_one_dimension`, `monodromyFiltration_conj`,
  `monodromyFiltration_eq_vectorSpace`, `monodromyFiltration_lowering`, `monodromyFiltration_mono`,
  `monodromyFiltration_not_kernel_filtration`, `monodromyFiltration_scalar`,
  `monodromyFiltration_three_block`, `monodromyFiltration_two_block`, `monodromyFiltration_zero`,
  `monodromyGradedPower_bijective`, `monodromyGradedPower_mk`, `monodromyOperator_eq_grothendieck`,
  `monodromyOperator_equivariant`, `monodromyOperator_generator`, `monodromyOperator_restrict`,
  `not_standard_char_two`, `not_triple_of_noninvariant`, `psiEta_ne_invariants`,
  `psiEta_smooth_constant`, `psiEta_trait`, `psi_leftExact`, `psi_proper_pushforward_id`,
  `psi_pushforward`, `semisimpleTrace_additive`, `semisimpleTrace_finiteImage`,
  `semisimpleTrace_frobeniusLift`, `semisimpleTrace_quadratic`, `semisimpleTrace_refinement`,
  `semisimpleTrace_shift`, `semisimpleTrace_shortExact`, `semisimpleTrace_trivial`,
  `semisimpleTrace_unipotent_block`, `specialization_direction`, `standard_double_point`,
  `standard_node`, `standard_trivial_family`, `tameCharacter_conj`,
  `tameCharacter_eq_inertiaTameCharacter`, `tameCharacter_kummer`, `tameCharacter_restrict`,
  `tameCharacter_surjective`, `twoComponentNearbyComplex_grades`,
  `twoComponentNearbyComplex_monodromy`, `twoComponentNearbyComplex_resolves`,
  `twoComponent_N_square`, `twoComponent_disjoint`, `twoComponent_node`,
  `twoComponent_not_sheaf_split`, `variation_left`, `variation_mul`, `variation_ne_sub_one`,
  `variation_of_phi_zero`, `variation_one`, `variation_picardLefschetz`, `variation_right`,
  `variation_unique`, `variation_wellDefined`, `wild_inertia_ne_bot`.
* `Quadric`: `canonical_iso`, `center_even_char_two`, `center_even_discriminant`,
  `center_even_hyperbolic`, `cusp_not_ordinary`, `doublePoint_char_two`, `isNondegenerate_iff`,
  `isOrdinaryQuadraticPoint_baseChange`, `isOrdinary_iff_nondegenerate_test`,
  `isOrdinary_iff_of_char_two`, `isOrdinary_iff_polar_nondegenerate`, `isOrdinary_rank_one`,
  `isOrdinary_zero_rank_excluded`, `isSmoothQuadric_of_isOrdinary`, `isSmoothQuadric_zero_iff`,
  `lagrangianIdempotent_eq_iff`, `lagrangianIdempotent_sum`, `node_isOrdinary`,
  `not_smoothQuadric_cone`, `smoothQuadric_dim_two`, `smoothQuadric_dim_zero`,
  `smoothQuadric_real_conic`, `smooth_point_not_quadratic`.
* `LefschetzPencil`: `cubic_surface`, `dualVariety_conic`, `dualVariety_conic_char_two`,
  `dualVariety_isIrreducible`, `dualVariety_linear`, `dualVariety_projectiveSpace`,
  `hermitian_curve_not_lefschetz`, `incidence_smooth_off_dual`, `line_in_plane`,
  `localMonodromy_vanishingCycle`, `mem_dualVariety_iff`, `quadric_surface`,
  `singularSet_eq_inter_dual`, `totalSpace_iso_blowup`, `vanishingCycle_changePath`,
  `vanishingCycle_conj_of_charTwo`, `vanishingCycle_depends_on_path`,
  `vanishingCycle_eq_zero_iff_forall`, `vanishingForm_isAlt`, `vanishingForm_on_E_degenerate`,
  `vanishingQuotient_conic`, `vanishingQuotient_lift`, `vanishingQuotient_lift_comp`,
  `vanishingQuotient_zero`, `vanishingSubspace_conic`,
  `vanishingSubspace_eq_bot_of_no_singular_fibre`, `vanishingSubspace_quadric_surface`,
  `vanishingSubspace_stable`, `veronese_hyperplane`, `veronese_isClosedImmersion`.
* `Semistable`: `normalizationDifferential_apply`, `normalizationDifferential_ker`,
  `normalizationDifferential_reverse`, `normalization_parallel_test`, `normalization_tree_test`,
  `weightSpectralSequence_abutment`, `weightSpectralSequence_e1`, `weightSpectralSequence_e2`,
  `weightSpectralSequence_reindex`, `weight_ss_curve_test`, `weight_ss_nonproper_test`,
  `weight_ss_smooth_test`.
* `InvariantCycles`: `arithmeticLocalMonodromy`, `genericHyperplaneRestriction`,
  `invariantSpecialization_coe`, `invariantSpecialization_natural`,
  `invariantSpecialization_range`, `invariantSpecialization_unique`, `invariant_sp_identity_test`,
  `invariant_sp_unipotent_test`, `invariant_sp_zero_test`.
-/

end TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.RepresentationNumber
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Scaling
import TauCeti.LinearAlgebra.IntegralLattice.Orthogonal.Sum
import TauCeti.NumberTheory.HurwitzClassNumber
import TauCeti.Algebra.Category.FGModuleCat.Basic
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import TauCeti.CategoryTheory.InvolutiveDual
import TauCeti.CategoryTheory.Exact.Split
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.CategoryTheory.Exact.Opposite

/-!
# Geometry of numbers and quadratic arithmetic: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the definitions and milestones that can
be stated against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge on
names and signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry`
marks goals, not results. Every target whose carrier is not available at the pins (the integral
quadratic map of a lattice, local densities, genera, the Q-constructions, the hermitian cone,
Grothendieck–Witt groups and spaces, stable and Poincaré categories, the certified LLL algorithm
itself, the dynamical incidence carriers, and the comparisons with declarations of the
ThetaSeries, LFunctions and PointProcesses roadmaps) is stated in the README with its intended
signature and does not appear here.

Design choices made explicit here:

* lattices are Mathlib's `IsZLattice` submodules and covolumes are `ZLattice.covolume`;
* successive minima are real numbers indexed by `Fin (finrank ℝ E)` on a `ConvexBody` with `0` in
  its interior, defined as the infimum of the dilations of the body that contain enough
  independent lattice vectors;
* integral quadratic lattices over a Dedekind domain are `Submodule.IsLattice` submodules with a
  quadratic form whose values on the lattice are integral, and no stored basis;
* hermitian pairings are conjugate-linear in the first argument;
* the theta series of a positive definite `ℤ`-lattice is stated on Tau Ceti's `IntegralLattice`
  carrier as the specialisation of ThetaSeries' theta series, and its coefficients are Tau Ceti's
  `representationNumber`;
* the three-square formula is stated against Tau Ceti's `hurwitzClassNumber`;
* unitarity of a representation is Tau Ceti's `ContRepresentation.IsUnitary`, with strong
  continuity added as a separate predicate;
* LLL data is exact, with integer change-of-basis certificates;
* exact categories are Tau Ceti's `ExactStructure`, and a strong duality bundles Tau Ceti's
  `Functor.IsInvolutiveDual` with exactness of the duality functor.
-/

noncomputable section
open scoped BigOperators ZeroObject Pointwise Topology
open MeasureTheory Module

namespace TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

/-! ## Layer 0: Lattices, Gram determinants and covolumes -/

section Gram
variable {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] {n : ℕ}

/-- **Gram–Hadamard** (0.1.2): the hermitian Gram determinant is real, nonnegative and bounded by
the product of the squared norms; the empty family is allowed. -/
theorem hermitian_gram_hadamard (v : Fin n → E) :
    (Matrix.gram 𝕜 v).det = (RCLike.re (Matrix.gram 𝕜 v).det : 𝕜) ∧
    0 ≤ RCLike.re (Matrix.gram 𝕜 v).det ∧
    RCLike.re (Matrix.gram 𝕜 v).det ≤ ∏ i, ‖v i‖ ^ 2 := by sorry

end Gram

-- The Gram matrix is conjugate-linear in the first argument: the family `(1, i)` in `ℂ` has Gram
-- matrix `[[1, i], [-i, 1]]` and determinant `0`. The unconjugated matrix `[[1, i], [i, -1]]` also
-- has determinant `0`, so this family does not test conjugation.
example : (Matrix.gram ℂ (![1, Complex.I] : Fin 2 → ℂ)).det = 0 := by sorry

-- Conjugation is what makes the Gram determinant nonnegative: the single vector `i` has Gram
-- determinant `1`, whereas its unconjugated bilinear Gram determinant `i * i` is `-1`.
example : (Matrix.gram ℂ (![Complex.I] : Fin 1 → ℂ)).det = 1 ∧
    (Matrix.of fun i j : Fin 1 =>
      (![Complex.I] : Fin 1 → ℂ) i * (![Complex.I] : Fin 1 → ℂ) j).det = -1 := by
  constructor
  · simp [Matrix.det_unique, Matrix.gram_apply]
  · simp [Matrix.det_unique]

section Orthogonal
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- An integral basis of the rational intersection `Δ ∩ W` extends to an integral basis of the full
lattice `Δ` (0.2.1); no orthogonality of the complement is asserted. -/
theorem saturated_adapted_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ∃ (r s : ℕ) (b : Basis (Fin r ⊕ Fin s) ℤ Δ)
      (c : Basis (Fin r) ℤ (ZLattice.comap ℝ Δ W.subtype)),
      ∀ i, (b (Sum.inl i) : E) = ((c i : W) : E) := by sorry

/-- Biorthogonally paired real bases have reciprocal Gram determinants (0.2.4). -/
theorem gram_det_biorthogonal {n : ℕ}
    (b d : Basis (Fin n) ℝ E)
    (hd : ∀ i j, inner ℝ (b i) (d j) = if i = j then 1 else 0) :
    (Matrix.gram ℝ b).det * (Matrix.gram ℝ d).det = 1 := by sorry

/-- The intrinsic inner dual of an orthogonal projection is the intersection of the ambient inner
dual with the orthogonal complement (0.2.5). -/
theorem dual_projection_comap
    (Δ : Submodule ℤ E) (W : Submodule ℝ E) :
    LinearMap.BilinForm.dualSubmodule (innerₗ Wᗮ)
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.comap ℝ (LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ) Wᗮ.subtype := by sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- The intrinsic covolume of the projection of `Δ` to `Wᗮ` is `covol Δ / covol (Δ ∩ W)` (0.3.1). -/
theorem covolume_projection
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.covolume Δ / ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

/-- In a self-dual lattice the primitive intersections with `W` and `Wᗮ` have equal intrinsic
covolumes (0.3.3). -/
theorem primitive_orthogonal_covolume
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (hΔ : LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ = Δ) (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume (ZLattice.comap ℝ Δ Wᗮ.subtype) =
      ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

end Orthogonal

section OrthogonalTests
local notation "V2" => EuclideanSpace ℝ (Fin 2)
local notation "udiag" => (WithLp.toLp 2 (![1,1] : Fin 2 → ℝ))
local notation "Wdiag" => (Submodule.span ℝ ({udiag} : Set V2))
local notation "Z2" =>
  (Submodule.span ℤ (Set.range (OrthonormalBasis.toBasis (EuclideanSpace.basisFun (Fin 2) ℝ))))

-- Projecting `ℤ²` off the diagonal gives intrinsic covolume `1/√2`.
example : ZLattice.covolume ((Z2).map
    (Wdiagᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) = (Real.sqrt 2)⁻¹ := by sorry

-- The diagonal and antidiagonal primitive intersections of `ℤ²` both have covolume `√2`.
example : ZLattice.covolume (ZLattice.comap ℝ Z2 (Wdiag).subtype) = Real.sqrt 2 ∧
    ZLattice.covolume (ZLattice.comap ℝ Z2 Wdiagᗮ.subtype) = Real.sqrt 2 := by sorry

-- Negative control: the ambient inner dual of the zero subgroup of `ℝ` is all of `ℝ`, not a
-- lattice; a lower-rank lattice must be dualized inside its own span.
example : LinearMap.BilinForm.dualSubmodule (innerₗ ℝ) (⊥ : Submodule ℤ ℝ) = ⊤ := by sorry

end OrthogonalTests

/-! ## Layer 1: Convex bodies, successive minima and Minkowski's theorems -/

section ElementaryBounds

/-- An increasing sequence `a_j ≥ 1` with product at most `V` has `a_i ≤ V^(1/(n-i))` (1.1.2). -/
theorem ordered_product_root_bound {n : ℕ} (a : Fin n → ℝ) (ha : Monotone a)
    (h1 : ∀ i, 1 ≤ a i) (V : ℝ) (hV : (∏ j, a j) ≤ V) (i : Fin n) :
    a i ≤ Real.rpow V ((n - i.val : ℕ) : ℝ)⁻¹ := by sorry

/-- The intrinsic unit ball of an `n`-dimensional real inner-product space, `n > 0`, has volume at
least `(2/√n)^n` (1.1.5). -/
theorem intrinsic_ball_lower_bound
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (hn : 0 < n) :
    ENNReal.ofReal ((2 / Real.sqrt n) ^ n) ≤ volume (Metric.closedBall (0 : E) 1) := by sorry

-- Negative control for the ordering hypothesis: `(4, 1)` has `4² > 4·1`.
example : ¬ (4 : ℝ) ^ 2 ≤ ∏ j : Fin 2, (![4, 1] : Fin 2 → ℝ) j := by sorry

end ElementaryBounds

section SuccessiveMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The `i`-th successive minimum `λ_i(L, K)`, `i : Fin d` zero-based (1.2.1): the infimum of the
`t > 0` for which `t • K` contains `i + 1` real-linearly independent lattice vectors. Its geometric
laws need `L` discrete and full and `0 ∈ interior K`. -/
def successiveMin (L : Submodule ℤ E) (K : ConvexBody E) (i : Fin (finrank ℝ E)) : ℝ :=
  sInf {t : ℝ | 0 < t ∧ ∃ v : Fin (i.val + 1) → E,
    (∀ j, v j ∈ (t • (K : Set E)) ∩ (L : Set E)) ∧ LinearIndependent ℝ v}

/-- The defining dilation infimum of `successiveMin`. -/
theorem successiveMin_def (L : Submodule ℤ E) (K : ConvexBody E) (i : Fin (finrank ℝ E)) :
    successiveMin L K i = sInf {t : ℝ | 0 < t ∧ ∃ v : Fin (i.val + 1) → E,
      (∀ j, v j ∈ (t • (K : Set E)) ∩ (L : Set E)) ∧ LinearIndependent ℝ v} := rfl

variable [FiniteDimensional ℝ E]
variable (L : Submodule ℤ E) [hLdis : DiscreteTopology L] [hLfull : IsZLattice ℝ L]
  (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))

include hLdis hLfull hK

/-- Every bounded gauge sublevel of a full discrete lattice is finite (1.2.2). -/
theorem finite_gauge_sublevel (r : ℝ) :
    Set.Finite {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r} := by sorry

/-- The successive minimum is the least gauge threshold at which the lattice vectors of gauge at
most the threshold span `i + 1` dimensions (1.2.3); no symmetry of `K` is needed. -/
theorem successiveMin_isLeast (i : Fin (finrank ℝ E)) :
    IsLeast {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})}
      (successiveMin L K i) := by sorry

/-- Every successive minimum of a full lattice is positive (1.2.4). -/
theorem successiveMin_pos (i : Fin (finrank ℝ E)) : 0 < successiveMin L K i := by sorry

/-- Successive minima increase with the index, allowing repeated values (1.2.5). -/
theorem successiveMin_monotone : Monotone (successiveMin L K) := by sorry

/-- `λ_i ≤ r` exactly when the lattice vectors in `r K` span `i + 1` dimensions (1.2.6). -/
theorem successiveMin_le_iff (i : Fin (finrank ℝ E)) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K i ≤ r ↔ i.val + 1 ≤
      finrank ℝ (Submodule.span ℝ ((L : Set E) ∩ r • (K : Set E))) := by sorry

/-- One real basis of lattice vectors attains all successive minima, with the strict-sublevel
flags (1.2.7); it need not be an integral basis, and `K` need not be symmetric. The greedy
construction behind it extends independent families one vector at a time through Mathlib's
`linearIndependent_finSnoc`. -/
theorem exists_successiveMin_witnesses :
    ∃ b : Basis (Fin (finrank ℝ E)) ℝ E,
      (∀ i, b i ∈ L) ∧
      (∀ i, gauge (K : Set E) (b i) = successiveMin L K i) ∧
      (∀ i, b i ∈ successiveMin L K i • (K : Set E)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i →
        (x : E) ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ b j = y} := by sorry

/-- Enlarging the body decreases every successive minimum (1.2.8). -/
theorem successiveMin_antitone_body (K' : ConvexBody E)
    (hK' : (0 : E) ∈ interior (K' : Set E)) (hKK' : K ≤ K')
    (i : Fin (finrank ℝ E)) : successiveMin L K' i ≤ successiveMin L K i := by sorry

/-- Passing to a full superlattice decreases every successive minimum (1.2.9). -/
theorem successiveMin_monotone_lattice (M : Submodule ℤ E)
    [DiscreteTopology M] [IsZLattice ℝ M] (hLM : L ≤ M)
    (i : Fin (finrank ℝ E)) : successiveMin M K i ≤ successiveMin L K i := by sorry

/-- `λ_i(L, cK) = λ_i(L, K)/c` for `c > 0` (1.2.10). -/
theorem successiveMin_smul_body (c : ℝ) (hc : 0 < c) (i : Fin (finrank ℝ E)) :
    successiveMin L (c • K) i = successiveMin L K i / c := by sorry

/-- Transporting lattice and body by the same linear equivalence preserves the minima (1.2.11). -/
theorem successiveMin_linearEquiv
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (e : E ≃ₗ[ℝ] F) (L' : Submodule ℤ F) [DiscreteTopology L'] [IsZLattice ℝ L']
    (K' : ConvexBody F) (hK' : (0 : F) ∈ interior (K' : Set F))
    (hL' : L' = L.map (e.toLinearMap.restrictScalars ℤ))
    (heK : (K' : Set F) = e '' (K : Set E))
    (i : Fin (finrank ℝ E)) (j : Fin (finrank ℝ F)) (hij : i.val = j.val) :
    successiveMin L' K' j = successiveMin L K i := by sorry

/-- `λ_0 ≤ r` exactly when `r K` contains a nonzero lattice vector (1.2.12). -/
theorem successiveMin_first_le_iff (hd : 0 < finrank ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K ⟨0, hd⟩ ≤ r ↔
      ∃ x : E, x ∈ L ∧ x ≠ 0 ∧ x ∈ r • (K : Set E) := by sorry

end SuccessiveMinima

section MinkowskiSecond
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- **Minkowski's second theorem, lower half** (1.3.4):
`(2^d/d!) covol L ≤ (∏ λ_i) vol K` for a symmetric convex body with `0` in its interior. -/
theorem minkowski_second_lower (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    ((2 : ℝ) ^ (finrank ℝ E) / (Nat.factorial (finrank ℝ E) : ℝ)) * ZLattice.covolume L ≤
      (∏ i : Fin (finrank ℝ E), successiveMin L K i) * volume.real (K : Set E) := by sorry

/-- **Minkowski's second theorem, upper half** (1.5.21, Henk's proof):
`(∏ λ_i) vol K ≤ 2^d covol L`. -/
theorem minkowski_second_upper
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    (∏ i : Fin (finrank ℝ E), successiveMin L K i) * volume.real (K : Set E) ≤
      2 ^ finrank ℝ E * ZLattice.covolume L := by sorry

end MinkowskiSecond

section PrescribedMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  (b : Basis (Fin (finrank ℝ E)) ℝ E) (K : ConvexBody E) (a : Fin (finrank ℝ E) → ℝ)
  (ha : ∀ i, 0 < a i) (ham : Monotone a)

include ha ham

/-- A weighted coordinate box has successive minima its increasing weights (1.3.5): the upper
bound of Minkowski's second theorem is attained. -/
theorem successiveMin_box
    (hK : (K : Set E) = {x : E | ∀ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

/-- A weighted cross-polytope has successive minima its increasing weights (1.3.6): the lower
bound of Minkowski's second theorem is attained. -/
theorem successiveMin_crosspolytope
    (hK : (K : Set E) = {x : E | ∑ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

end PrescribedMinima

/-- **Minkowski's linear forms theorem** (1.4.2): if `|det A| ≤ ∏ a_i`, some nonzero integer vector
satisfies every closed inequality `|(Az)_i| ≤ a_i`. -/
theorem minkowski_linear_forms {n : ℕ} (hn : 0 < n)
    (A : Matrix (Fin n) (Fin n) ℝ) (hA : A.det ≠ 0)
    (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) (hprod : |A.det| ≤ ∏ i, a i) :
    ∃ z : Fin n → ℤ, z ≠ 0 ∧ ∀ i, |∑ j, A i j * (z j : ℝ)| ≤ a i := by sorry

section MinimaTests

-- `λ_0(ℤ, [-2, 2]) = 1/2`.
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-2) 2) :
    successiveMin (Submodule.span ℤ {(1 : ℝ)}) K ⟨0, by simp⟩ = 1/2 := by sorry

-- The README's rectangle `K₂₃` has minima `(2, 3)`, attained along `e₀, e₁`.
example (K23 : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK23 : (K23 : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| ≤ 1/2 ∧ |x 1| ≤ 1/3}) :
    successiveMin (Submodule.span ℤ
      (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis)) K23 ⟨0, by simp⟩ = 2 ∧
    successiveMin (Submodule.span ℤ
      (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis)) K23 ⟨1, by simp⟩ = 3 := by sorry

-- Outside `ℝe₀`, `K₂₃` has least lattice gauge `3`, attained by `e₁`.
example (K23 : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK23 : (K23 : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| ≤ 1/2 ∧ |x 1| ≤ 1/3}) :
    gauge (K23 : Set (EuclideanSpace ℝ (Fin 2)))
      (EuclideanSpace.basisFun (Fin 2) ℝ 1) = 3 ∧
    ∀ z : Fin 2 → ℤ, z 1 ≠ 0 →
      3 ≤ gauge (K23 : Set (EuclideanSpace ℝ (Fin 2)))
        (WithLp.toLp 2 (fun i => (z i : ℝ))) := by sorry

-- The axis-swapped `K₃₂` has least lattice gauge `2` outside `ℝe₀`, attained by `e₁`.
example (K32 : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK32 : (K32 : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| ≤ 1/3 ∧ |x 1| ≤ 1/2}) :
    gauge (K32 : Set (EuclideanSpace ℝ (Fin 2)))
      (EuclideanSpace.basisFun (Fin 2) ℝ 1) = 2 ∧
    ∀ z : Fin 2 → ℤ, z 1 ≠ 0 →
      2 ≤ gauge (K32 : Set (EuclideanSpace ℝ (Fin 2)))
        (WithLp.toLp 2 (fun i => (z i : ℝ))) := by sorry

-- Negative control: without `0 ∈ interior K` positivity fails; the zero body gives `0`.
example : successiveMin (Submodule.span ℤ {(1 : ℝ)}) (0 : ConvexBody ℝ) ⟨0, by simp⟩ = 0 := by
  sorry

-- The unit diamond attains the lower bound for `ℤ²`: product `1` times area `2` is `2²/2!`.
example (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| + |x 1| ≤ 1}) :
    (∏ i, successiveMin (Submodule.span ℤ
      (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis)) K i) *
      volume.real (K : Set (EuclideanSpace ℝ (Fin 2))) = 2 := by sorry

-- Negative control for symmetry: `[-1/10, 1]` has minimum `1` and length `11/10 < 2`.
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-1/10) 1) :
    successiveMin (Submodule.span ℤ {(1 : ℝ)}) K ⟨0, by simp⟩ *
      volume.real (K : Set ℝ) = 11/10 ∧ (11/10 : ℝ) < 2 := by sorry

-- The linear forms bound is closed: `|2z| ≤ 2` has the witness `z = 1`, `|2z| < 2` has none.
example : (∃ z : ℤ, z ≠ 0 ∧ |2 * (z : ℝ)| ≤ 2) ∧
    ¬ (∃ z : ℤ, z ≠ 0 ∧ |2 * (z : ℝ)| < 2) := by sorry

end MinimaTests

/-! ## Layer 2: Integral quadratic and hermitian lattices -/

section IntegralQuadratic
variable (R K V : Type*) [CommRing R] [Field K] [Algebra R K]
  [AddCommGroup V] [Module R V] [Module K V] [IsScalarTower R K V]

/-- An integral quadratic lattice (2.2.1): a full finitely generated `R`-submodule of a
`K`-quadratic space on which the quadratic form takes values in `R`. No basis is stored. -/
structure IntegralQuadraticLattice where
  carrier : Submodule R V
  isLattice : Submodule.IsLattice K carrier
  form : QuadraticForm K V
  integral : ∀ x ∈ carrier, ∃ r : R, algebraMap R K r = form x

variable {R K V}

/-- Bundle a full submodule whose quadratic values lie in the coefficient ring. -/
def IntegralQuadraticLattice.ofCarrier (L : Submodule R V)
    (hL : Submodule.IsLattice K L) (q : QuadraticForm K V)
    (hq : ∀ x ∈ L, ∃ r : R, algebraMap R K r = q x) :
    IntegralQuadraticLattice R K V := ⟨L, hL, q, hq⟩

/-- For a fixed form, equal carriers give equal integral lattices. -/
theorem IntegralQuadraticLattice.ext (L M : IntegralQuadraticLattice R K V)
    (h : L.carrier = M.carrier) (hq : L.form = M.form) : L = M := by sorry

-- The carrier spans the ambient space and is finitely generated, without any basis parameter.
example (L : IntegralQuadraticLattice R K V) :
    Submodule.span K (L.carrier : Set V) = ⊤ := by sorry

-- Negative control: `B(x,y) = xy` on `ℤ` does not make `x²/2` integral, since `1/2 ∉ ℤ`.
example : ¬ ∃ z : ℤ, (z : ℚ) = (1 : ℚ) / 2 := by sorry

end IntegralQuadratic

section IntegralHermitian
variable (R K V : Type*) [CommRing R] [StarRing R] [Field K] [StarRing K]
  [Algebra R K] [AddCommGroup V] [Module R V] [Module K V] [IsScalarTower R K V]

/-- An integral hermitian lattice (2.7.1): a full `R`-submodule with an integral hermitian pairing,
conjugate-linear in the first argument. -/
structure IntegralHermitianLattice where
  carrier : Submodule R V
  isLattice : Submodule.IsLattice K carrier
  form : V →ₗ⋆[K] V →ₗ[K] K
  symmetric : form.IsSymm
  starCompatible : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)
  integral : ∀ x ∈ carrier, ∀ y ∈ carrier, ∃ r : R, algebraMap R K r = form x y

variable {R K V}

/-- Bundle the full submodule and its integral hermitian pairing. -/
def IntegralHermitianLattice.ofCarrier (L : Submodule R V)
    (hL : Submodule.IsLattice K L) (H : V →ₗ⋆[K] V →ₗ[K] K)
    (hH : H.IsSymm)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r))
    (hi : ∀ x ∈ L, ∀ y ∈ L, ∃ r : R, algebraMap R K r = H x y) :
    IntegralHermitianLattice R K V := ⟨L, hL, H, hH, hstar, hi⟩

/-- For a fixed pairing, equal carriers give equal hermitian lattices. -/
theorem IntegralHermitianLattice.ext (L M : IntegralHermitianLattice R K V)
    (h : L.carrier = M.carrier) (hH : L.form = M.form) : L = M := by sorry

/-- The dual lattice `L^∨ = {x | H(x, L) ⊆ R}` (2.7.2). -/
def IntegralHermitianLattice.dual (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) :
    Submodule R V where
  carrier := {x | ∀ y ∈ L.carrier, ∃ r : R, algebraMap R K r = L.form x y}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Membership in the dual is integrality of all pairings with `L`. -/
theorem IntegralHermitianLattice.mem_dual_iff
    (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) (x : V) :
    x ∈ L.dual hstar ↔ ∀ y ∈ L.carrier, ∃ r : R, algebraMap R K r = L.form x y := by sorry

/-- Integrality is exactly `L ⊆ L^∨`. -/
theorem IntegralHermitianLattice.integral_iff_le_dual
    (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) :
    (∀ x ∈ L.carrier, ∀ y ∈ L.carrier,
      ∃ r : R, algebraMap R K r = L.form x y) ↔ L.carrier ≤ L.dual hstar := by sorry

-- The pairing is conjugate-linear in the first argument and linear in the second.
example (L : IntegralHermitianLattice R K V) (x y : V) (a b : K) :
    L.form (a • x) (b • y) = star a * b * L.form x y := by sorry

end IntegralHermitian

section ReflexiveHermitianDual
variable {R K V : Type*} [CommRing R] [StarRing R] [IsDedekindDomain R]
  [Field K] [StarRing K] [Algebra R K] [IsFractionRing R K]
  [AddCommGroup V] [Module R V] [Module K V] [IsScalarTower R K V]

/-- Over a Dedekind domain the double dual of a nondegenerate hermitian lattice is the lattice. -/
theorem IntegralHermitianLattice.dual_dual (L : IntegralHermitianLattice R K V)
    (hn : ∀ x, (∀ y, L.form x y = 0) → x = 0) :
    {x : V | ∀ y ∈ L.dual L.starCompatible, ∃ r : R, algebraMap R K r = L.form x y} =
      (L.carrier : Set V) := by sorry

end ReflexiveHermitianDual

section PrimaryInvariantFactors
open scoped DirectSum
variable (R : Type*) [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
  (π : R) (M : Type*) [AddCommGroup M] [Module R M] (n : ℕ)

/-- Ordered elementary-divisor exponents of a `π`-primary torsion module with `n` generators
(2.7.3): `M ≅ ⊕_{i<n} R/(π^{a_i})`, `a` increasing. Existence is Mathlib's structure theorem for
modules over a principal ideal domain; the identification of `M` with `L^∨/L` is the README's. -/
structure HermitianLatticeInvariants where
  exponent : Fin n → ℕ
  ordered : Monotone exponent
  decomposition : Nonempty (M ≃ₗ[R] ⨁ i : Fin n, R ⧸ Ideal.span {π ^ exponent i})

namespace HermitianLatticeInvariants
variable {R π M n}

/-- The valuation `val(L) = Σ a_i`. -/
def valuation (a : HermitianLatticeInvariants R π M n) : ℕ := ∑ i, a.exponent i

/-- The type `t(L) = #{i | a_i > 0}`. -/
def type (a : HermitianLatticeInvariants R π M n) : ℕ :=
  (Finset.univ.filter (fun i => 0 < a.exponent i)).card

/-- The ordered exponents are determined by the module (2.5.4). -/
theorem exponent_unique (a b : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    a.exponent = b.exponent := by sorry

/-- Self-duality is the vanishing of the valuation. -/
theorem selfDual_iff (a : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    Subsingleton M ↔ a.valuation = 0 := by sorry

/-- Vertex lattices are those with all exponents at most one. -/
theorem vertex_iff (a : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    (∀ x : M, π • x = 0) ↔ ∀ i, a.exponent i ≤ 1 := by sorry

/-- Changing the uniformizer by a unit does not change the exponents (2.5.5). -/
theorem uniformizer_independent (a : HermitianLatticeInvariants R π M n) (u : Rˣ)
    (b : HermitianLatticeInvariants R ((u : R) * π) M n) (hπ : Irreducible π) :
    a.exponent = b.exponent := by sorry

-- Rank one with `L^∨/L ≅ ℤ/8 = ℤ/2³`: valuation `3`, type `1`.
example (a : HermitianLatticeInvariants ℤ 2 (ZMod 8) 1) : a.valuation = 3 ∧ a.type = 1 := by sorry

-- Exponents `(0, 1, 1)`: valuation `2` and type `2`.
example (a : HermitianLatticeInvariants R π M 3) (ha : a.exponent = ![0, 1, 1]) :
    a.valuation = 2 ∧ a.type = 2 := by sorry

end HermitianLatticeInvariants
end PrimaryInvariantFactors

section AtomicDVRForms
variable {R : Type*} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] {n : ℕ}

/-- Voight's atomic integral quadratic forms over a DVR (2.6.1): a unit unary form, or, when `2`
is not a unit, a binary form `[a, b, c]` with `v(b) < v(2a) ≤ v(2c)` and `a` or `b` a unit. -/
def IsAtomicIntegralQuadraticForm (q : QuadraticForm R (Fin n → R)) : Prop :=
  (∃ (a : R) (e : (Fin n → R) ≃ₗ[R] R), IsUnit a ∧ ∀ x, q x = a * (e x) ^ 2) ∨
  (¬ IsUnit (2 : R) ∧ ∃ (a b c : R) (e : (Fin n → R) ≃ₗ[R] (Fin 2 → R)),
    IsDiscreteValuationRing.addVal R b < IsDiscreteValuationRing.addVal R (2 * a) ∧
    IsDiscreteValuationRing.addVal R (2 * a) ≤ IsDiscreteValuationRing.addVal R (2 * c) ∧
    (IsUnit a ∨ IsUnit b) ∧
    ∀ x, q x = a * (e x 0) ^ 2 + b * (e x 0) * (e x 1) + c * (e x 1) ^ 2)

/-- The unary branch. -/
theorem IsAtomicIntegralQuadraticForm.unary (q : QuadraticForm R (Fin n → R))
    (a : R) (e : (Fin n → R) ≃ₗ[R] R) (ha : IsUnit a) (hq : ∀ x, q x = a * (e x) ^ 2) :
    IsAtomicIntegralQuadraticForm q := by sorry

/-- The dyadic binary branch. -/
theorem IsAtomicIntegralQuadraticForm.binary (q : QuadraticForm R (Fin n → R))
    (a b c : R) (e : (Fin n → R) ≃ₗ[R] (Fin 2 → R)) (h2 : ¬ IsUnit (2 : R))
    (hba : IsDiscreteValuationRing.addVal R b < IsDiscreteValuationRing.addVal R (2 * a))
    (hac : IsDiscreteValuationRing.addVal R (2 * a) ≤ IsDiscreteValuationRing.addVal R (2 * c))
    (hab : IsUnit a ∨ IsUnit b)
    (hq : ∀ x, q x = a * (e x 0) ^ 2 + b * (e x 0) * (e x 1) + c * (e x 1) ^ 2) :
    IsAtomicIntegralQuadraticForm q := by sorry

-- At a dyadic DVR the hyperbolic form `xy` is atomic and binary.
example (q : QuadraticForm R (Fin 2 → R)) (h2 : ¬ IsUnit (2 : R))
    (hq : ∀ x, q x = x 0 * x 1) : IsAtomicIntegralQuadraticForm q := by sorry

-- Negative control: the zero-dimensional form is not an atomic block.
example (q : QuadraticForm R (Fin 0 → R)) : ¬ IsAtomicIntegralQuadraticForm q := by sorry

end AtomicDVRForms

section QuaternionicLattices
open MulOpposite
variable (R K B V : Type*) [CommRing R] [IsDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K]
  [Ring B] [StarRing B] [Algebra R B] [Algebra K B] [IsScalarTower R K B]
  [AddCommGroup V] [Module R V] [Module K V] [IsScalarTower R K V]
  [Module Bᵐᵒᵖ V] [IsScalarTower K Bᵐᵒᵖ V]

/-- A quaternionic integral hermitian lattice (2.8.1): an `O`-stable full lattice in a right module
over a quaternion algebra, with an integral quaternionic hermitian pairing. Right multiplication is
the left action of the opposite ring. -/
structure QuaternionicIntegralHermitianLattice where
  parameterA : K
  parameterB : K
  parameterA_nonzero : parameterA ≠ 0
  parameterB_nonzero : parameterB ≠ 0
  quaternionModel :
    ∃ e : B ≃ₐ[K] QuaternionAlgebra K parameterA 0 parameterB, ∀ b, e (star b) = star (e b)
  order : Subalgebra R B
  orderFull : Submodule.IsLattice K order.toSubmodule
  star_stable : ∀ a ∈ order, star a ∈ order
  carrier : Submodule R V
  full : Submodule.IsLattice K carrier
  right_stable : ∀ x ∈ carrier, ∀ a ∈ order, op a • x ∈ carrier
  pairing : V →ₗ[K] V →ₗ[K] B
  right_sesquilinear : ∀ x y a b, pairing (op a • x) (op b • y) = star a * pairing x y * b
  symmetric : ∀ x y, pairing y x = star (pairing x y)
  nondegenerate : ∀ x, (∀ y, pairing x y = 0) → x = 0
  integral : ∀ x ∈ carrier, ∀ y ∈ carrier, pairing x y ∈ order

namespace QuaternionicIntegralHermitianLattice
variable {R K B V}

/-- Bundle an order-stable full lattice with its integral quaternionic pairing. -/
def ofOrderStableCarrier (a b : K) (ha : a ≠ 0) (hb : b ≠ 0)
    (hq : ∃ e : B ≃ₐ[K] QuaternionAlgebra K a 0 b, ∀ x, e (star x) = star (e x))
    (O : Subalgebra R B) (ho : Submodule.IsLattice K O.toSubmodule)
    (hs : ∀ a ∈ O, star a ∈ O) (L : Submodule R V) (hL : Submodule.IsLattice K L)
    (hr : ∀ x ∈ L, ∀ a ∈ O, op a • x ∈ L)
    (H : V →ₗ[K] V →ₗ[K] B)
    (hH : ∀ x y a b, H (op a • x) (op b • y) = star a * H x y * b)
    (ht : ∀ x y, H y x = star (H x y))
    (hn : ∀ x, (∀ y, H x y = 0) → x = 0)
    (hi : ∀ x ∈ L, ∀ y ∈ L, H x y ∈ O) :
    QuaternionicIntegralHermitianLattice R K B V :=
  ⟨a, b, ha, hb, hq, O, ho, hs, L, hL, hr, H, hH, ht, hn, hi⟩

/-- The dual `{x | h(x, L) ⊆ O}` of a quaternionic hermitian lattice. -/
def dual (L : QuaternionicIntegralHermitianLattice R K B V) : Submodule R V where
  carrier := {x | ∀ y ∈ L.carrier, L.pairing x y ∈ L.order}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- An integral quaternionic hermitian lattice is contained in its dual. -/
theorem integral_le_dual (L : QuaternionicIntegralHermitianLattice R K B V) :
    L.carrier ≤ L.dual := by sorry

-- The pairing is conjugate-linear on the left and linear on the right in the quaternions.
example (L : QuaternionicIntegralHermitianLattice R K B V) (x y : V) (a b : B) :
    L.pairing (op a • x) (op b • y) = star a * L.pairing x y * b := by sorry

end QuaternionicIntegralHermitianLattice
end QuaternionicLattices

section LipschitzOrder
open scoped Quaternion

/-- The Lipschitz order of Hamilton's rational quaternions: four integer coordinates. -/
def lipschitzOrder : Subalgebra ℤ ℍ[ℚ] where
  carrier := {q | (∃ a : ℤ, (a : ℚ) = q.re) ∧ (∃ b : ℤ, (b : ℚ) = q.imI) ∧
    (∃ c : ℤ, (c : ℚ) = q.imJ) ∧ (∃ d : ℤ, (d : ℚ) = q.imK)}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  algebraMap_mem' := by sorry

-- `i` is a Lipschitz quaternion.
example : (⟨0, 1, 0, 0⟩ : ℍ[ℚ]) ∈ lipschitzOrder := by sorry

-- Negative control: the Hurwitz element `(1 + i + j + k)/2` is not in the Lipschitz order.
example : (⟨1/2, 1/2, 1/2, 1/2⟩ : ℍ[ℚ]) ∉ lipschitzOrder := by sorry

end LipschitzOrder

section SignedFieldForms
variable (K V : Type*) [Field K] [StarRing K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- A perfect `ε`-hermitian space over a field with involution, `ε = ±1` (2.9). -/
structure SignedHermitianSpace [FiniteDimensional K V] (ε : K) where
  sign : ε = 1 ∨ ε = -1
  form : V →ₗ⋆[K] V →ₗ[K] K
  symmetry : ∀ x y, form y x = ε * star (form x y)
  nondegenerate : ∀ x, (∀ y, form x y = 0) → x = 0

variable {K V}

/-- A signed hermitian space is hyperbolic when it has a Lagrangian `N = N^⊥`; with `2 ≠ 0` this is
the hyperbolic condition. -/
def SignedHermitianSpace.IsHyperbolic [NeZero (2 : K)] {ε : K}
    (h : SignedHermitianSpace K V ε) : Prop :=
  ∃ N : Submodule K V, (N : Set V) = {x | ∀ y ∈ N, h.form x y = 0}

-- The complex line with `h(x, y) = conj(x) y` is perfect of sign `+1`, and `h(i, i) = 1`.
example : ∃ h : SignedHermitianSpace ℂ ℂ 1,
    (∀ x y, h.form x y = star x * y) ∧ h.form Complex.I Complex.I = 1 := by sorry

-- Negative control: a one-dimensional rational skew-symmetric space cannot be perfect.
example : IsEmpty (SignedHermitianSpace ℚ ℚ (-1)) := by sorry

-- The zero space is hyperbolic, with Lagrangian `0`.
example (h : SignedHermitianSpace ℚ (Fin 0 → ℚ) 1) : h.IsHyperbolic := by sorry

-- Negative control: a perfect rational line has no Lagrangian.
example (h : SignedHermitianSpace ℚ ℚ 1) : ¬ h.IsHyperbolic := by sorry

-- Characteristic two: `diag(1, 1)` over `𝔽₂` has the isotropic vector `(1, 1)` but
-- `B((1,0),(1,0)) = 1`, so a Lagrangian alone does not make a bilinear form hyperbolic there.
example : (1 : ZMod 2) * 1 + 1 * 1 = 0 ∧ (1 : ZMod 2) * 1 + 0 * 0 ≠ 0 := by sorry

end SignedFieldForms

/-! ## Layer 3: Representation densities, mass and theta coefficients -/

section FiniteHermitianCounts
local instance : StarRing (ZMod 3) := starRingOfComm
variable {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]
variable {m n : ℕ}

/-- The number of `m × n` matrices `X` with `Xᴴ G X = B` over a finite star ring (3.1.1). -/
def hermitianRepresentationCount (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ := by
  classical
  exact Fintype.card {X : Matrix (Fin m) (Fin n) A | X.conjTranspose * G * X = B}

/-- The empty source has one representation. -/
theorem hermitianRepresentationCount_empty (G : Matrix (Fin m) (Fin m) A) :
    hermitianRepresentationCount G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry

/-- Invertible changes of coordinates preserve the representation count. -/
theorem hermitianRepresentationCount_basisChange
    (G : Matrix (Fin m) (Fin m) A) (B : Matrix (Fin n) (Fin n) A)
    (U Ui : Matrix (Fin m) (Fin m) A) (V Vi : Matrix (Fin n) (Fin n) A)
    (hU : U * Ui = 1) (hUi : Ui * U = 1) (hV : V * Vi = 1) (hVi : Vi * V = 1) :
    hermitianRepresentationCount (U.conjTranspose * G * U) (V.conjTranspose * B * V) =
      hermitianRepresentationCount G B := by sorry

/-- The number of injective solutions of `Xᴴ G X = B` (3.1.2). -/
def hermitianEmbeddingCount (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ := by
  classical
  exact Fintype.card {X : Matrix (Fin m) (Fin n) A |
    X.conjTranspose * G * X = B ∧ Function.Injective X.mulVec}

/-- The empty source has one embedding. -/
theorem hermitianEmbeddingCount_empty (G : Matrix (Fin m) (Fin m) A) :
    hermitianEmbeddingCount G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry

/-- Embeddings are representations. -/
theorem hermitianEmbeddingCount_le (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) :
    hermitianEmbeddingCount G B ≤ hermitianRepresentationCount G B := by sorry

/-- Over a field with nonsingular source every representation is injective. -/
theorem hermitianEmbeddingCount_eq_of_nonsingular {F : Type*} [Field F] [StarRing F]
    [Fintype F] [DecidableEq F] (G : Matrix (Fin m) (Fin m) F)
    (B : Matrix (Fin n) (Fin n) F) (hB : B.det ≠ 0) :
    hermitianEmbeddingCount G B = hermitianRepresentationCount G B := by sorry

/-- **The finite hermitian embedding count** (3.1.3), with the radical dimension `a` of the source
retained in the product. -/
theorem finite_hermitian_isometry_formula {F : Type*} [Field F] [StarRing F]
    [Fintype F] [DecidableEq F] (q : ℕ) (hq : 2 ≤ q)
    (hcard : Fintype.card F = q ^ 2) (hstar : ∀ x : F, star x = x ^ q)
    (G : Matrix (Fin m) (Fin m) F) (B : Matrix (Fin n) (Fin n) F)
    (hG : G.conjTranspose = G) (hB : B.conjTranspose = B)
    (hGnd : G.det ≠ 0) (hmn : n ≤ m) :
    (hermitianEmbeddingCount G B : ℚ) = (q : ℚ) ^ (n * (2 * m - n)) *
      ∏ i ∈ Finset.range (n + finrank F (LinearMap.ker B.mulVecLin)),
        (1 - (-(q : ℚ)) ^ ((i : ℤ) - (m : ℤ))) := by sorry

/-- The finite count normalized by `q^{N n (2m - n)}` (3.2.1). -/
def normalizedHermitianCount (q N : ℕ) (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℝ :=
  (hermitianRepresentationCount G B : ℝ) / (q : ℝ) ^ (N * n * (2 * m - n))

/-- The empty-source normalized count is one. -/
theorem normalizedHermitianCount_empty (q N : ℕ) (G : Matrix (Fin m) (Fin m) A) :
    normalizedHermitianCount q N G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry

/-- Invertible changes of coordinates preserve the normalized count. -/
theorem normalizedHermitianCount_basisChange (q N : ℕ)
    (G : Matrix (Fin m) (Fin m) A) (B : Matrix (Fin n) (Fin n) A)
    (U Ui : Matrix (Fin m) (Fin m) A) (V Vi : Matrix (Fin n) (Fin n) A)
    (hU : U * Ui = 1) (hUi : Ui * U = 1) (hV : V * Vi = 1) (hVi : Vi * V = 1) :
    normalizedHermitianCount q N (U.conjTranspose * G * U) (V.conjTranspose * B * V) =
      normalizedHermitianCount q N G B := by sorry

/-- The Cho–Yamauchi weight `m_q(a; X) = ∏_{i<a} (1 - (-q)^i X)` (3.2.5). -/
def choYamauchiWeight (q a : ℕ) : Polynomial ℤ :=
  ∏ i ∈ Finset.range a, (1 - Polynomial.C ((-(q : ℤ)) ^ i) * Polynomial.X)

/-- The empty weight is `1`. -/
theorem choYamauchiWeight_zero (q : ℕ) : choYamauchiWeight q 0 = 1 := by sorry

/-- The next weight appends the factor with exponent `a`. -/
theorem choYamauchiWeight_succ (q a : ℕ) :
    choYamauchiWeight q (a + 1) = choYamauchiWeight q a *
      (1 - Polynomial.C ((-(q : ℤ)) ^ a) * Polynomial.X) := by sorry

/-- The derivative weight `-m_q(a; X)'(1) = ∏_{i=1}^{a-1} (1 - (-q)^i)` for `a ≥ 1`. -/
theorem choYamauchiWeight_derivative (q a : ℕ) (ha : 1 ≤ a) :
    -((choYamauchiWeight q a).derivative.eval 1) =
      ∏ i ∈ Finset.Icc 1 (a - 1), (1 - (-(q : ℤ)) ^ i) := by sorry

-- Over `ℤ/3` with trivial involution, `x² = 1` has two solutions.
example : hermitianRepresentationCount (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (1 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 2 := by sorry

-- Negative control: the zero source has one representation but no embedding.
example : hermitianRepresentationCount (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
      (0 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 1 ∧
    hermitianEmbeddingCount (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
      (0 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 0 := by sorry

-- The normalization uses `q`, not `q²`: `2/3` at `q = 3`, `N = 1`.
example : normalizedHermitianCount 3 1 (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (1 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 2/3 := by sorry

-- `m_q(1; X) = 1 - X`, and `m_3(2; X)` has derivative weight `1 + 3 = 4`.
example : choYamauchiWeight 3 1 = 1 - Polynomial.X := by sorry
example : -((choYamauchiWeight 3 2).derivative.eval 1) = 4 := by sorry

end FiniteHermitianCounts

section NumberRingTrace
open scoped NumberField
variable {K M : Type*} [Field K] [NumberField K] [AddCommGroup M] [Module (𝓞 K) M]

/-- The trace form `Tr_{K/ℚ} ∘ q` of a quadratic form over a number ring (3.3). -/
def numberRingTraceForm (q : QuadraticForm (𝓞 K) M) : QuadraticForm ℤ M :=
  (Algebra.trace ℤ (𝓞 K)).compQuadraticMap (q.restrictScalars (S := ℤ))

/-- The trace form evaluates to the trace of the original value. -/
theorem numberRingTraceForm_apply (q : QuadraticForm (𝓞 K) M) (x : M) :
    numberRingTraceForm q x = Algebra.trace ℤ (𝓞 K) (q x) := by sorry

-- Over `ℚ` the trace form is the form itself: `2x²` at `3` is `18`.
example : numberRingTraceForm (2 • QuadraticMap.sq (R := 𝓞 ℚ) (A := 𝓞 ℚ)) (3 : 𝓞 ℚ) = 18 := by
  sorry

end NumberRingTrace

section BoundedIntegralEndomorphisms
variable {M : Type*} [AddCommGroup M] [Module ℤ M]

/-- A positive definite integral form has finitely many endomorphisms with `q(Tx) ≤ C² q(x)`. -/
theorem finite_bounded_integral_endomorphisms [Module.Free ℤ M] [Module.Finite ℤ M]
    (q : QuadraticForm ℤ M) (hq : q.PosDef) (C : ℝ) (hC : 0 ≤ C) :
    {T : M →ₗ[ℤ] M | ∀ x : M, (q (T x) : ℝ) ≤ C ^ 2 * (q x : ℝ)}.Finite := by sorry

-- On `(ℤ, x²)` with `C = 1` the allowed multipliers are `-1, 0, 1`.
example : {a : ℤ | ∀ x : ℤ, ((a * x) ^ 2 : ℤ) ≤ x ^ 2} = {-1, 0, 1} := by sorry

-- Negative control: the zero form allows every multiplier.
example : ¬ {a : ℤ | ∀ x : ℤ, (0 : ℤ) * (a * x) ^ 2 ≤ 0 * x ^ 2}.Finite := by sorry

end BoundedIntegralEndomorphisms

section WeightedMass

/-- The mass `Σ 1/|O(M)|` of a finite class set with the given stabilizer orders (3.3.3). -/
def genusMass {I : Type*} [Fintype I] (stabilizerOrder : I → ℕ) : ℚ :=
  ∑ i, (1 : ℚ) / (stabilizerOrder i : ℚ)

/-- The summands do not depend on the indexing of the classes. -/
theorem genusMass_representative {I J : Type*} [Fintype I] [Fintype J]
    (w : I → ℕ) (e : I ≃ J) : genusMass (w ∘ e.symm) = genusMass w := by sorry

/-- A single class has mass the reciprocal stabilizer order. -/
theorem genusMass_singleton (a : ℕ) : genusMass (fun _ : Unit => a) = 1 / (a : ℚ) := by sorry

/-- A nonempty class set with positive stabilizer orders has positive mass. -/
theorem genusMass_pos {I : Type*} [Fintype I] [Nonempty I] (w : I → ℕ)
    (h : ∀ i, 0 < w i) : 0 < genusMass w := by sorry

-- The rank-one positive unimodular genus has mass `1/2`, not its class number `1`.
example : genusMass (fun _ : Unit => 2) = 1/2 := by sorry

/-- The local types of the maximal-lattice mass table (3.3.7). -/
inductive MaximalMassLocalType
  | zero | I | IIPlus | IIMinus | II | IIIPlus | IIIMinus
  deriving DecidableEq

/-- Convert the diagonal Hasse sign `c` to the Witt sign by the rank modulo eight. -/
def maximalMassWittSign (m : ℕ) (c hMinusMinus hMinusDisc hMinusNegDisc : ℤ) : ℤ :=
  if m % 8 = 1 ∨ m % 8 = 2 then c
  else if m % 8 = 5 ∨ m % 8 = 6 then c * hMinusMinus
  else if m % 8 = 0 ∨ m % 8 = 3 then c * hMinusDisc
  else c * hMinusNegDisc

/-- Select the local type from parity, discriminant valuation parity, square class, ramification
and Witt sign. -/
def maximalMassLocalType (odd oddVal square ramified : Bool) (wittPositive : Bool) :
    MaximalMassLocalType :=
  if odd then
    if oddVal then (if wittPositive then .IIPlus else .IIMinus)
    else (if wittPositive then .zero else .I)
  else if square then (if wittPositive then .zero else .I)
  else if ramified then (if wittPositive then .IIIPlus else .IIIMinus)
  else (if wittPositive then .zero else .II)

/-- The rational local mass factor `λ_p` of Kirschmer's table (3.3.8). -/
def maximalLocalMassFactor (q r : ℕ) (odd : Bool) (t : MaximalMassLocalType) : ℚ :=
  match t with
  | .zero => 1
  | .I => if odd then ((q : ℚ) ^ (2 * r) - 1) / (2 * ((q : ℚ) + 1))
      else (((q : ℚ) ^ (r - 1) - 1) * ((q : ℚ) ^ r - 1)) / (2 * ((q : ℚ) + 1))
  | .IIPlus => ((q : ℚ) ^ r + 1) / 2
  | .IIMinus => ((q : ℚ) ^ r - 1) / 2
  | .II => (((q : ℚ) ^ (r - 1) + 1) * ((q : ℚ) ^ r + 1)) / (2 * ((q : ℚ) + 1))
  | .IIIPlus | .IIIMinus => 1 / 2

/-- The good factor is `1`. -/
theorem maximalLocalMassFactor_zero (q r : ℕ) (odd : Bool) :
    maximalLocalMassFactor q r odd .zero = 1 := by sorry

/-- The odd-rank type-I factor. -/
theorem maximalLocalMassFactor_odd_I (q r : ℕ) :
    maximalLocalMassFactor q r true .I = ((q : ℚ) ^ (2 * r) - 1) / (2 * ((q : ℚ) + 1)) := by sorry

/-- The even-rank type-II factor. -/
theorem maximalLocalMassFactor_even_II (q r : ℕ) :
    maximalLocalMassFactor q r false .II =
      (((q : ℚ) ^ (r - 1) + 1) * ((q : ℚ) ^ r + 1)) / (2 * ((q : ℚ) + 1)) := by sorry

/-- Both even-rank type-III factors are `1/2`. -/
theorem maximalLocalMassFactor_even_III (q r : ℕ) :
    maximalLocalMassFactor q r false .IIIPlus = 1/2 ∧
      maximalLocalMassFactor q r false .IIIMinus = 1/2 := by sorry

-- Rank `3 ≡ 3 (mod 8)` uses `c (−1, d)`.
example : maximalMassWittSign 3 1 (-1) (-1) 1 = -1 := by sorry

-- Odd rank, odd discriminant valuation: the two Witt signs select different type-II cases.
example : maximalMassLocalType true true false true true = .IIPlus ∧
    maximalMassLocalType true true false true false = .IIMinus := by sorry

-- At `q = 2, r = 1`, odd types `I, IIPlus, IIMinus` give `1/2, 3/2, 1/2`.
example : maximalLocalMassFactor 2 1 true .I = 1/2 ∧
    maximalLocalMassFactor 2 1 true .IIPlus = 3/2 ∧
    maximalLocalMassFactor 2 1 true .IIMinus = 1/2 := by sorry

-- At `q = 3, r = 2`, even types `I, II` give `2, 5`.
example : maximalLocalMassFactor 3 2 false .I = 2 ∧ maximalLocalMassFactor 3 2 false .II = 5 := by
  sorry

end WeightedMass

section OrthogonalModels

/-- `|SO^±_{2r}(𝔽_q)|` as a polynomial in `q` (split for `true`). -/
def finiteEvenOrthogonalOrder (q r : ℕ) (split : Bool) : ℕ :=
  q ^ (r * (r - 1)) * (if split then q ^ r - 1 else q ^ r + 1) *
    ∏ i ∈ Finset.Icc 1 (r - 1), (q ^ (2 * i) - 1)

/-- The odd-dimensional order `q^{r²} ∏_{i=1}^r (q^{2i} - 1)`. -/
def finiteOddOrthogonalOrder (q r : ℕ) : ℕ :=
  q ^ (r * r) * ∏ i ∈ Finset.Icc 1 r, (q ^ (2 * i) - 1)

/-- The local volume ratio `(q^{-N_H} |H(k)|)/(q^{-N_G} |G(k)|)`. -/
def orthogonalLocalVolumeRatio (q NH NG countH countG : ℕ) : ℚ :=
  ((q : ℚ) ^ (-(NH : ℤ)) * countH) / ((q : ℚ) ^ (-(NG : ℤ)) * countG)

/-- Positive orders give a positive ratio. -/
theorem orthogonalLocalVolumeRatio_pos (q NH NG countH countG : ℕ)
    (hq : 2 ≤ q) (hH : 0 < countH) (hG : 0 < countG) :
    0 < orthogonalLocalVolumeRatio q NH NG countH countG := by sorry

/-- Identical models have ratio one. -/
theorem orthogonalLocalVolumeRatio_good (q N c : ℕ) (hq : 2 ≤ q) (hc : 0 < c) :
    orthogonalLocalVolumeRatio q N N c c = 1 := by sorry

-- At `q = 2`, `|SO₄⁺| = 36` and `|SO₄⁻| = 60`; swapping the signs changes the count.
example : finiteEvenOrthogonalOrder 2 2 true = 36 ∧ finiteEvenOrthogonalOrder 2 2 false = 60 := by
  sorry

-- `|SO₃(𝔽₂)| = 6`.
example : finiteOddOrthogonalOrder 2 1 = 6 := by sorry

-- The anisotropic rank-three quotient at `q = 3` against the good one has ratio `2`.
example : orthogonalLocalVolumeRatio 3 1 0 24 4 = 2 := by norm_num [orthogonalLocalVolumeRatio]

-- Negative control: a zero denominator order returns `0`, outside the positivity hypotheses.
example : orthogonalLocalVolumeRatio 2 1 1 6 0 = 0 := by norm_num [orthogonalLocalVolumeRatio]

end OrthogonalModels

section MassArchimedeanFactors

/-- The reciprocal compact orthogonal volume `γ` of the mass formula (3.3.5). -/
def orthogonalArchimedeanConstant (r : ℕ) (oddRank : Bool) : ℝ :=
  if oddRank then
    (∏ i ∈ Finset.range r, (Nat.factorial (2 * i + 1) : ℝ)) / (2 * Real.pi) ^ (r * (r + 1))
  else
    (Nat.factorial (r - 1) : ℝ) *
      (∏ i ∈ Finset.range (r - 1), (Nat.factorial (2 * i + 1) : ℝ)) / (2 * Real.pi) ^ (r * r)

/-- `γ` is positive, including the empty product. -/
theorem orthogonalArchimedeanConstant_pos (r : ℕ) (oddRank : Bool) :
    0 < orthogonalArchimedeanConstant r oddRank := by sorry

/-- `γ_odd(r+1) = γ_odd(r) (2r+1)!/(2π)^{2r+2}`. -/
theorem orthogonalArchimedeanConstant_odd_step (r : ℕ) :
    orthogonalArchimedeanConstant (r + 1) true =
      orthogonalArchimedeanConstant r true * (Nat.factorial (2 * r + 1) : ℝ) /
        (2 * Real.pi) ^ (2 * (r + 1)) := by sorry

/-- The volume `∏_{j=2}^n 2π^{j/2}/Γ(j/2)` of `SO(n)` for the skew-orthonormal metric. -/
def orthogonalSkewBasisVolume (n : ℕ) : ℝ :=
  ∏ k ∈ Finset.range (n - 1),
    2 * Real.pi ^ (((k + 2 : ℕ) : ℝ) / 2) / Real.Gamma (((k + 2 : ℕ) : ℝ) / 2)

/-- The real mass gauge scale `2^{-⌊n/2⌋}` in odd rank and `1` in even rank. -/
def orthogonalMassGaugeScale (n : ℕ) : ℝ :=
  if n % 2 = 1 then (2 : ℝ)⁻¹ ^ (n / 2) else 1

/-- The sphere-fibration recurrence `V_{n+1} = V_n · area(S^n)`. -/
theorem orthogonalSkewBasisVolume_step (n : ℕ) (hn : 1 ≤ n) :
    orthogonalSkewBasisVolume (n + 1) = orthogonalSkewBasisVolume n *
      (2 * Real.pi ^ (((n + 1 : ℕ) : ℝ) / 2) / Real.Gamma (((n + 1 : ℕ) : ℝ) / 2)) := by sorry

/-- `V_{2r+1} = 2^r/γ_odd(r)`. -/
theorem orthogonalSkewBasisVolume_odd (r : ℕ) :
    orthogonalSkewBasisVolume (2 * r + 1) = 2 ^ r / orthogonalArchimedeanConstant r true := by sorry

/-- `V_{2r} = 1/γ_even(r)` for `r ≥ 1`. -/
theorem orthogonalSkewBasisVolume_even (r : ℕ) (hr : 0 < r) :
    orthogonalSkewBasisVolume (2 * r) = 1 / orthogonalArchimedeanConstant r false := by sorry

-- `γ_odd(1) = 1/(4π²)` and `γ_even(2) = 1/(2π)⁴`; the odd formula at even rank is different.
example : orthogonalArchimedeanConstant 1 true = 1 / (4 * Real.pi ^ 2) ∧
    orthogonalArchimedeanConstant 2 false = 1 / (2 * Real.pi) ^ 4 := by sorry

-- `V₃ = 8π²`; the rank-three mass gauge is `V₃/2 = 4π²`, so the unscaled volume is not `4π²`.
example : orthogonalSkewBasisVolume 3 = 8 * Real.pi ^ 2 ∧ orthogonalMassGaugeScale 3 = 1/2 := by
  sorry

variable (K : Type*) [Field K] [NumberField K]

/-- Local restatement of LFunctions §0, to be replaced by the import once that roadmap is merged.
Specialized by §3's `dedekindZetaData` with zero shifts and the real/complex place multiplicities;
this real-bodied factor is required by the mass-value consumers because the card is unavailable at
the pins. It becomes an alias of `(dedekindZetaData K).gammaFactor`, with Mathlib's `Gammaℂ`.
LFunctions is an open TauCetiRoadmap pull request by roed-math. -/
def dedekindArchimedeanFactor (s : ℂ) : ℂ :=
  Complex.Gammaℝ s ^ NumberField.InfinitePlace.nrRealPlaces K *
    Complex.Gammaℂ s ^ NumberField.InfinitePlace.nrComplexPlaces K

/-- Local restatement of LFunctions §0, to be replaced by the import once that roadmap is merged.
The multiplier in `HasDirichletAgreement.completes`, specialized by §3 to conductor `|d_K|`, is
required by the mass-value and completed-zeta consumers. There is no separately named supplier
multiplier export; this is its real-bodied local spelling, not a new construction target.
LFunctions is an open TauCetiRoadmap pull request by roed-math. -/
def completedDedekindFactor (s : ℂ) : ℂ :=
  ((|NumberField.discr K| : ℤ) : ℂ) ^ (s / 2) * dedekindArchimedeanFactor K s

/-- The archimedean factor has no zero for `Re s > 0`. -/
theorem dedekindArchimedeanFactor_ne_zero {s : ℂ} (hs : 0 < s.re) :
    dedekindArchimedeanFactor K s ≠ 0 := by sorry

/-- The completed factor at `s = 1`. -/
theorem completedDedekindFactor_one :
    completedDedekindFactor K 1 =
      ((|NumberField.discr K| : ℤ) : ℂ) ^ (1/2 : ℂ) *
        (1 / (Real.pi : ℂ)) ^ NumberField.InfinitePlace.nrComplexPlaces K := by sorry

-- The mass-value consumers require the `ℚ` constants `1, 1/π, 1/(2π)` at `s = 1, 2, 3`.
example : dedekindArchimedeanFactor ℚ 2 = 1 / (Real.pi : ℂ) := by sorry
example : completedDedekindFactor ℚ 3 = 1 / (2 * Real.pi : ℂ) := by sorry

end MassArchimedeanFactors

section PinnedGaugeChecks

-- The rank-three pinned gauge: torus generator and short-root pair in skew coordinates have
-- determinant `-2`; replacing the primitive cocharacter by the coroot gives `-4`.
example : Matrix.det (!![-Complex.I, 0, 0; 0, -1, -1; 0, -Complex.I, Complex.I] :
    Matrix (Fin 3) (Fin 3) ℂ) = -2 := by
  eval_det
  ring_nf
  norm_num [Complex.I_sq]

example : Matrix.det (!![-2*Complex.I, 0, 0; 0, -1, -1; 0, -Complex.I, Complex.I] :
    Matrix (Fin 3) (Fin 3) ℂ) = -4 := by
  eval_det
  ring_nf
  norm_num [Complex.I_sq]

end PinnedGaugeChecks

section IntegralTheta
variable {V : Type*} [AddCommGroup V] [Module ℚ V]

/-- The theta series `Σ_{x ∈ L} exp(π i τ B(x,x))` of an integral lattice (3.4.1): ThetaSeries'
`thetaSeries` of the real model `realModel L`, on Tau Ceti's carrier. -/
def latticeThetaSeries (L : TauCeti.IntegralLattice V) (τ : ℂ) : ℂ :=
  ∑' x : L, Complex.exp ((Real.pi : ℂ) * Complex.I * τ * (L.integralForm x x : ℂ))

/-- For a positive definite lattice the series is absolutely summable on the upper half-plane:
ThetaSeries' `summable_thetaSeries` through the real model. -/
theorem latticeThetaSeries_summable [FiniteDimensional ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable (fun x : L => Complex.exp
      ((Real.pi : ℂ) * Complex.I * τ * (L.integralForm x x : ℂ))) := by sorry

/-- The coefficient of `exp(π i τ m)` is Tau Ceti's representation number `r_L(m)`: ThetaSeries'
expansion of an integral lattice through the real model. -/
theorem latticeThetaSeries_coeff [FiniteDimensional ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (τ : ℂ) (hτ : 0 < τ.im) :
    latticeThetaSeries L τ = ∑' m : ℕ,
      (L.representationNumber m : ℂ) * Complex.exp ((Real.pi : ℂ) * Complex.I * τ * m) := by sorry

/-- On the imaginary axis the theta series is the Gaussian sum of a real realization. -/
theorem latticeThetaSeries_gaussian
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (L : TauCeti.IntegralLattice V) (e : L →+ E)
    (he : ∀ x : L, ‖e x‖ ^ 2 = (L.integralForm x x : ℝ)) (t : ℝ) :
    latticeThetaSeries L ((t : ℂ) * Complex.I) =
      ∑' x : L, (Real.exp (-Real.pi * t * ‖e x‖ ^ 2) : ℂ) := by sorry

/-- For an even lattice the series is a power series in `exp(2π i τ)` whose coefficients are the
representation numbers `r_L(2m)`: ThetaSeries' `hasSum_thetaSeries` through the real model. -/
theorem latticeThetaSeries_coeff_even [FiniteDimensional ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (hE : L.IsEven) (τ : ℂ) (hτ : 0 < τ.im) :
    latticeThetaSeries L τ = ∑' m : ℕ,
      (L.representationNumber (2 * m) : ℂ) *
        Complex.exp (2 * (Real.pi : ℂ) * Complex.I * τ * m) := by sorry

/-- `Θ_{L ⊥ M} = Θ_L Θ_M` for Tau Ceti's orthogonal sum: ThetaSeries' `thetaSeries_orthSum`. -/
theorem latticeThetaSeries_directSum {W : Type*} [AddCommGroup W] [Module ℚ W]
    [FiniteDimensional ℚ V] [FiniteDimensional ℚ W]
    (L : TauCeti.IntegralLattice V) (M : TauCeti.IntegralLattice W)
    (hL : L.IsPosDef) (hM : M.IsPosDef) (τ : ℂ) (hτ : 0 < τ.im) :
    latticeThetaSeries (L.orthogonalSum M) τ = latticeThetaSeries L τ * latticeThetaSeries M τ := by
  sorry

/-- Rescaling the form by `a` rescales the variable: `Θ_{L(a)}(τ) = Θ_L(aτ)`. -/
theorem latticeThetaSeries_rescale (L : TauCeti.IntegralLattice V) (a : ℤ) (τ : ℂ) :
    latticeThetaSeries (L.scale a) τ = latticeThetaSeries L (a * τ) := by sorry

-- The rank-zero lattice has theta series `1`.
example (τ : ℂ) :
    let L := TauCeti.IntegralLattice.ofGramMatrix
      (Pi.basisFun ℚ (Fin 0)) (1 : Matrix (Fin 0) (Fin 0) ℤ) (by sorry)
    latticeThetaSeries L τ = 1 := by sorry

-- For `ℤ²` the shells of norm `1` and `2` have `4` points each.
example :
    let L := TauCeti.IntegralLattice.ofGramMatrix
      (Pi.basisFun ℚ (Fin 2)) (1 : Matrix (Fin 2) (Fin 2) ℤ) (by sorry)
    L.representationNumber 1 = 4 ∧ L.representationNumber 2 = 4 := by sorry

end IntegralTheta

/-! ## Layer 4: Lattice points, star bodies and homogeneous dynamics -/

section DavenportMultisets
variable {n : ℕ}

/-- The lattice count `Σ_{z ∈ ℤⁿ} μ(z)` of a multiplicity function (4.1). -/
def multisetLatticeCount (μ : (Fin n → ℝ) → ℕ) : ℝ :=
  ∑' z : Fin n → ℤ, (μ (fun i => (z i : ℝ)) : ℝ)

/-- The volume `∫ μ` of a multiplicity function, counting repeated points. -/
def multisetVolume (μ : (Fin n → ℝ) → ℕ) : ℝ := ∫ x, (μ x : ℝ)

/-- A bounded multiplicity integrates as the sum of its superlevel volumes. -/
theorem multisetVolume_superlevels (μ : (Fin n → ℝ) → ℕ) (m : ℕ)
    (hm : ∀ x, μ x ≤ m)
    (hmeas : Measurable μ) (hbound : Bornology.IsBounded (Function.support μ)) :
    multisetVolume μ = ∑ j ∈ Finset.range m, volume.real {x | j + 1 ≤ μ x} := by sorry

/-- The lattice count is the sum of the superlevel counts. -/
theorem multisetLatticeCount_superlevels (μ : (Fin n → ℝ) → ℕ) (m : ℕ)
    (hm : ∀ x, μ x ≤ m) (hbound : Bornology.IsBounded (Function.support μ)) :
    multisetLatticeCount μ = ∑ j ∈ Finset.range m,
      (Nat.card {z : Fin n → ℤ | j + 1 ≤ μ (fun i => (z i : ℝ))} : ℝ) := by sorry

-- Twice the indicator of `[0, N]` has count `2(N + 1)` and volume `2N`.
example (N : ℕ) :
    multisetLatticeCount (fun x : Fin 1 → ℝ => if x 0 ∈ Set.Icc 0 (N : ℝ) then 2 else 0) =
      2 * ((N : ℝ) + 1) := by sorry

-- The indicator of `{0, 2}` has count `2` and volume `0`.
example : multisetLatticeCount (fun x : Fin 1 → ℝ => if x 0 = 0 ∨ x 0 = 2 then 1 else 0) = 2 ∧
    multisetVolume (fun x : Fin 1 → ℝ => if x 0 = 0 ∨ x 0 = 2 then 1 else 0) = 0 := by sorry

end DavenportMultisets

section LatticePointCounting
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- **Henk's Lemma 2.1** (4.1.2): `|L ∩ K| ≤ [L : M] |M ∩ 2K|`, boundary points included. -/
theorem henk_sublattice_count
    (L M : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (hML : M ≤ L) (hindex : M.toAddSubgroup.relIndex L.toAddSubgroup ≠ 0)
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    {x : E | x ∈ L ∧ x ∈ K}.ncard ≤
      M.toAddSubgroup.relIndex L.toAddSubgroup *
        {x : E | x ∈ M ∧ x ∈ (2 : ℝ) • (K : Set E)}.ncard := by sorry

/-- **Henk (1.3)** (4.1.5): `|L ∩ K| ≤ (⌊2/λ_0⌋ + 1)^d`. -/
theorem lattice_count_le_first_minimum
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (hd : 0 < finrank ℝ E) :
    {x : E | x ∈ L ∧ x ∈ K}.ncard ≤
      (Nat.floor (2 / successiveMin L K ⟨0, hd⟩) + 1) ^ finrank ℝ E := by sorry

end LatticePointCounting

section HenkProduct
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- **Henk's Theorem 1.5** (4.1.12): `|L ∩ K| < 2^{d-1} ∏ (⌊2/λ_i⌋ + 1)` for `d ≥ 2`. -/
theorem lattice_count_lt_successive_minima
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (hd : 2 ≤ finrank ℝ E) :
    {x : E | x ∈ L ∧ x ∈ K}.ncard <
      2 ^ (finrank ℝ E - 1) *
        ∏ i : Fin (finrank ℝ E), (Nat.floor (2 / successiveMin L K i) + 1) := by sorry

end HenkProduct

-- Negative control for `d ≥ 2`: in rank one the strict bound would read `3 < 3`.
example : ¬ (3 : ℕ) < 2 ^ (1 - 1) * (3 : ℕ) := by sorry

section HilbertDynamics
variable {G H : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Strong continuity: every orbit map `g ↦ π(g) v` is continuous (4.2). Mathlib's
`ContRepresentation` bundles continuity of each operator, not continuity in `g`. -/
def StronglyContinuous (π : ContRepresentation ℂ G H) : Prop :=
  ∀ v : H, Continuous (fun g : G => π g v)

/-- A strongly continuous unitary representation is jointly continuous. -/
theorem stronglyContinuous_joint (π : ContRepresentation ℂ G H)
    (hs : StronglyContinuous π) (hu : TauCeti.ContRepresentation.IsUnitary π) :
    Continuous (fun x : G × H => π x.1 x.2) := by sorry

/-- Matrix coefficients `g ↦ ⟪π g v, w⟫` of a strongly continuous representation are continuous;
Tau Ceti's `ContRepresentation.matrixCoeff` asks instead for continuity in the operator norm. -/
theorem matrixCoeff_continuous (π : ContRepresentation ℂ G H)
    (hs : StronglyContinuous π) (v w : H) :
    Continuous (fun g : G => inner (𝕜 := ℂ) (π g v) w) := by sorry

-- The trivial representation is strongly continuous.
example (π : ContRepresentation ℂ G H) (h : ∀ g v, π g v = v) : StronglyContinuous π := by sorry

/-- The contraction subgroup `{u | a_j⁻¹ u a_j → 1}` of a sequence. -/
def contractionSubgroup (a : ℕ → G) : Subgroup G where
  carrier := {u | Filter.Tendsto (fun j => (a j)⁻¹ * u * a j) Filter.atTop (nhds 1)}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- The opposite contraction subgroup, for the inverse sequence. -/
abbrev oppositeContractionSubgroup (a : ℕ → G) : Subgroup G :=
  contractionSubgroup (fun j => (a j)⁻¹)

omit [IsTopologicalGroup G] in
/-- The opposite contraction subgroup is the contraction subgroup of `a_j⁻¹`. -/
theorem oppositeContractionSubgroup_eq (a : ℕ → G) :
    oppositeContractionSubgroup a = contractionSubgroup (fun j => (a j)⁻¹) := rfl

/-- Membership in the contraction subgroup. -/
theorem contractionSubgroup_mem (a : ℕ → G) (u : G) :
    u ∈ contractionSubgroup a ↔
      Filter.Tendsto (fun j => (a j)⁻¹ * u * a j) Filter.atTop (nhds 1) := by sorry

/-- The contraction subgroup is closed under inverses. -/
theorem contractionSubgroup_inv (a : ℕ → G) {u : G} (hu : u ∈ contractionSubgroup a) :
    u⁻¹ ∈ contractionSubgroup a := by sorry

/-- **Mautner phenomenon**: a weak limit of `π(a_j) v` is fixed by the closure of the contraction
subgroup. -/
theorem contraction_fixed_weak_limit (π : ContRepresentation ℂ G H)
    (hs : StronglyContinuous π) (hu : TauCeti.ContRepresentation.IsUnitary π)
    (a : ℕ → G) (v v₀ : H)
    (hw : ∀ w : H, Filter.Tendsto (fun j => inner (𝕜 := ℂ) (π (a j) v) w)
      Filter.atTop (nhds (inner (𝕜 := ℂ) v₀ w))) :
    ∀ u ∈ (contractionSubgroup a).topologicalClosure, π u v₀ = v₀ := by sorry

-- The constant sequence `1` in a Hausdorff group contracts only the identity.
example [T2Space G] : contractionSubgroup (fun _ : ℕ => (1 : G)) = ⊥ := by sorry

-- In `SL₂(ℝ)`, `a_j = diag(e^j, e^{-j})` contracts upper unipotents under `a_j⁻¹ u a_j`.
example (j : ℕ) (t : ℝ) :
    (!![Real.exp (-(j : ℝ)), 0; 0, Real.exp (j : ℝ)]) *
      (!![1, t; 0, 1]) * (!![Real.exp (j : ℝ), 0; 0, Real.exp (-(j : ℝ))]) =
      (!![1, t * Real.exp (-2 * (j : ℝ)); 0, 1]) := by sorry

end HilbertDynamics

section KoopmanActions
variable {G X : Type*} [Group G] [MeasurableSpace X] [MulAction G X]

/-- Local restatement of IncompressibleFlows §3.3, to be replaced by the import once that roadmap
is merged, for the scalar-flow pullback input. IncompressibleFlows is an open TauCetiRoadmap pull request by emberian; its §3.3 is Layer 3 item 3. The local L² representation carrier is required by the homogeneous-action consumers;
its arbitrary-group assembly uses Mathlib's `Lp.compMeasurePreservingₗᵢ`, with defining formula
`(π(g) f)(x) = f(g⁻¹ x)` almost everywhere. The supplier states forward-time flow pullback. -/
def quotientKoopman (μ : Measure X)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ContRepresentation ℂ G (Lp ℂ 2 μ) where
  toMonoidHom := {
    toFun := fun g => (Lp.compMeasurePreservingₗᵢ ℂ
      (fun x : X => g⁻¹ • x) (hμ g⁻¹)).toContinuousLinearMap
    map_one' := by sorry
    map_mul' := by sorry }

/-- The Koopman representation is unitary. -/
theorem quotientKoopman_unitary (μ : Measure X)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    TauCeti.ContRepresentation.IsUnitary (quotientKoopman μ hμ) := by sorry

section FiniteMeasure
variable (μ : Measure X)

/-- The mean-zero subspace `{f | ∫ f dμ = 0}` of `L²(μ)` for a finite measure. -/
def meanZeroL2 [IsFiniteMeasure μ] : Submodule ℂ (Lp ℂ 2 μ) where
  carrier := {f | ∫ x, f x ∂μ = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

variable [IsFiniteMeasure μ]

/-- Membership in the mean-zero subspace. -/
theorem mem_meanZeroL2 (f : Lp ℂ 2 μ) :
    f ∈ meanZeroL2 μ ↔ ∫ x, f x ∂μ = 0 := Iff.rfl

/-- The mean-zero subspace is closed. -/
theorem meanZeroL2_closed : IsClosed (meanZeroL2 μ : Set (Lp ℂ 2 μ)) := by sorry

/-- The mean-zero subspace is Koopman-invariant. -/
theorem meanZeroL2_invariant
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (g : G) (f : Lp ℂ 2 μ) (hf : f ∈ meanZeroL2 μ) :
    quotientKoopman μ hμ g f ∈ meanZeroL2 μ := by sorry

-- On a probability space a constant lies in the mean-zero subspace only when it is zero.
example [IsProbabilityMeasure μ] (c : ℂ) : Lp.const 2 μ c ∈ meanZeroL2 μ ↔ c = 0 := by sorry

end FiniteMeasure

-- Negative control: on `ℕ` with counting measure, `f(n) = 1/(n+1)` and `g = 1_{0} - f` are in
-- `L²` with totalized integral `0`, but `f + g` has integral `1`; finiteness of `μ` is needed.
example :
    let μ : Measure ℕ := Measure.count
    let f : ℕ → ℂ := fun n => 1 / (n + 1 : ℂ)
    let g : ℕ → ℂ := fun n => (if n = 0 then 1 else 0) - f n
    MemLp f 2 μ ∧ MemLp g 2 μ ∧
      (∫ n, f n ∂μ) = 0 ∧ (∫ n, g n ∂μ) = 0 ∧ (∫ n, (f + g) n ∂μ) = 1 := by sorry

section ContinuousAction
variable [TopologicalSpace G] [IsTopologicalGroup G]
  [TopologicalSpace X] [BorelSpace X] [R1Space X] [ContinuousSMul G X]
  (μ : Measure X) [Measure.InnerRegularCompactLTTop μ] [IsLocallyFiniteMeasure μ]

/-- A continuous measure-preserving action has a strongly continuous Koopman representation. -/
theorem quotientKoopman_strong
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    StronglyContinuous (quotientKoopman μ hμ) := by sorry

end ContinuousAction
end KoopmanActions

section ErgodicKoopman
variable {G X : Type*} [Group G] [MeasurableSpace X] [MulAction G X]
  (μ : Measure X) [IsProbabilityMeasure μ]

/-- Ergodicity is equivalent to the fixed `L²` vectors being the constants. -/
theorem ergodic_iff_L2_fixed_constants
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ErgodicSMul G X μ ↔
      ∀ f : Lp ℂ 2 μ, (∀ g : G, quotientKoopman μ hμ g f = f) ↔
        ∃ c : ℂ, f = Lp.const 2 μ c := by sorry

/-- An ergodic action has no nonzero fixed vector of mean zero. -/
theorem ergodic_meanZero_invariants
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (hE : ErgodicSMul G X μ) (f : Lp ℂ 2 μ)
    (hf : f ∈ meanZeroL2 μ) (hfix : ∀ g : G, quotientKoopman μ hμ g f = f) :
    f = 0 := by sorry

-- Negative control: the trivial action on two equiprobable points is not ergodic.
example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ¬ ErgodicSMul PUnit (Fin 2) μ := by sorry

end ErgodicKoopman

section ErgodicKernels
local instance : ∀ p : Prop, Decidable p := Classical.propDecidable
open ProbabilityTheory
variable {G X : Type*} [Group G] [MeasurableSpace X] [MulAction G X]

/-- An ergodic-component kernel: a stationary Markov kernel with almost surely ergodic values that
evaluates every essentially invariant set as its indicator at the base point. -/
structure ActionErgodicKernel (μ : Measure X) where
  κ : Kernel X X
  markov : IsMarkovKernel κ
  stationary : μ.bind κ = μ
  ae_ergodic : ∀ᵐ x ∂μ, ErgodicSMul G X (κ x)
  onInvariantSets : ∀ s : Set X, MeasurableSet s →
    (∀ g : G, (fun x : X => g • x) ⁻¹' s =ᵐ[μ] s) →
    ∀ᵐ x ∂μ, κ x s = if x ∈ s then 1 else 0

/-- **Ergodic decomposition** for countable groups on standard Borel probability spaces. -/
theorem exists_actionErgodicKernel (μ : Measure X) [IsProbabilityMeasure μ]
    [Countable G] [StandardBorelSpace X] [Nonempty X]
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    Nonempty (ActionErgodicKernel (G := G) μ) := by sorry

/-- Integration against `μ` is iterated integration over the ergodic components. -/
theorem ActionErgodicKernel.integral (μ : Measure X)
    (E : ActionErgodicKernel (G := G) μ) (f : X → ℝ) (hf : Integrable f μ) :
    ∫ x, ∫ y, f y ∂(E.κ x) ∂μ = ∫ x, f x ∂μ := by sorry

/-- For an ergodic action the component kernel is almost everywhere `μ`. -/
theorem ActionErgodicKernel.const_of_ergodic (μ : Measure X) [IsProbabilityMeasure μ]
    [StandardBorelSpace X] (E : ActionErgodicKernel (G := G) μ)
    (h : ErgodicSMul G X μ) : ∀ᵐ x ∂μ, E.κ x = μ := by sorry

-- Negative control: for the trivial action on two points the constant kernel is stationary but
-- is not a component kernel.
example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ¬ ∃ E : ActionErgodicKernel (G := PUnit) μ, E.κ = Kernel.const (Fin 2) μ := by sorry

end ErgodicKernels

section FinitePoissonConfigurations
open ProbabilityTheory
variable {X : Type*} [MeasurableSpace X]

/-- The finite Poisson configuration law: mix the normalized product measures with a Poisson
count of parameter `a μ(X)`. -/
def finitePoissonConfiguration (intensity : NNReal) (μ : Measure X) [IsFiniteMeasure μ] :
    Measure (Σ n : ℕ, Fin n → X) :=
  Measure.sum fun n => (poissonMeasure (intensity * (μ Set.univ).toNNReal)) {n} •
    (Measure.pi (fun _ : Fin n => (μ Set.univ)⁻¹ • μ)).map (Sigma.mk n)

/-- The number of configuration points in `s`, counting repetitions. -/
def configurationCount (s : Set X) (c : Σ n : ℕ, Fin n → X) : ℕ := by
  classical
  exact ∑ i : Fin c.1, if c.2 i ∈ s then 1 else 0

/-- The point measure `Σ_{i < n} δ_{x_i}` of a configuration; a repeated point keeps its
multiplicity. -/
def configurationMeasure (c : Σ n : ℕ, Fin n → X) : Measure X :=
  ∑ i : Fin c.1, Measure.dirac (c.2 i)

/-- On a measurable set the point measure of a configuration is its count. -/
theorem configurationMeasure_apply (c : Σ n : ℕ, Fin n → X) {s : Set X} (hs : MeasurableSet s) :
    configurationMeasure c s = configurationCount s c := by sorry

/-- The point measure depends measurably on the configuration; its image of
`finitePoissonConfiguration a μ` is PointProcesses' `poissonLaw (a • μ)`. -/
theorem measurable_configurationMeasure :
    Measurable (configurationMeasure : (Σ n : ℕ, Fin n → X) → Measure X) := by sorry

/-- The configuration law is a probability measure. -/
theorem finitePoissonConfiguration_probability (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] : IsProbabilityMeasure (finitePoissonConfiguration intensity μ) := by
  sorry

/-- The count in `s` is Poisson with parameter `a μ(s)`, PointProcesses' count law read through
`configurationMeasure_apply`. -/
theorem finitePoissonConfiguration_count (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] (s : Set X) (hs : MeasurableSet s) :
    (finitePoissonConfiguration intensity μ).map (configurationCount s) =
      poissonMeasure (intensity * (μ s).toNNReal) := by sorry

/-- Counts in disjoint sets are independent. -/
theorem finitePoissonConfiguration_indep_counts (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] {s t : Set X} (hs : MeasurableSet s) (ht : MeasurableSet t)
    (hst : Disjoint s t) :
    IndepFun (configurationCount s) (configurationCount t)
      (finitePoissonConfiguration intensity μ) := by sorry

/-- **Campbell's identity**: the expected sum of `f` over the configuration is `a ∫ f dμ`,
PointProcesses' Campbell formula read through `configurationMeasure`. -/
theorem finitePoissonConfiguration_campbell (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] (f : X → ℝ) (hf : Integrable f μ) :
    ∫ c, (∑ i : Fin c.1, f (c.2 i)) ∂finitePoissonConfiguration intensity μ =
      (intensity : ℝ) * ∫ x, f x ∂μ := by sorry

-- A repeated point is counted twice: `(0, 1, 0)` has count `2` in `{0}`.
example : configurationCount ({0} : Set (Fin 2))
    (⟨3, ![0, 1, 0]⟩ : Σ n : ℕ, Fin n → Fin 2) = 2 := by sorry

-- The point measure of `(0, 1, 0)` puts mass `2` on `0`.
example : configurationMeasure (⟨3, ![0, 1, 0]⟩ : Σ n : ℕ, Fin n → Fin 2) {0} = 2 := by sorry

-- On a singleton with `μ = δ` and intensity `1` the total count is Poisson of parameter `1`.
example : (finitePoissonConfiguration 1 (Measure.dirac PUnit.unit)).map
    (configurationCount Set.univ) = poissonMeasure 1 := by sorry

end FinitePoissonConfigurations

section ActionAverages
local instance : MeasurableSpace (Equiv.Perm (Fin 2)) := ⊤
local instance : TopologicalSpace (Equiv.Perm (Fin 2)) := ⊥
open ProbabilityTheory
variable {G X : Type*} [Group G] [MeasurableSpace G] [TopologicalSpace G]
  [MeasurableSpace X] [TopologicalSpace X] [MulAction G X]

/-- The normalized average `η(A)⁻¹ ∫_A f(g x) dη(g)`. -/
def normalizedActionAverage (η : Measure G) (A : Set G) (f : X → ℝ) (x : X) : ℝ :=
  (η.real A)⁻¹ * ∫ g in A, f (g • x) ∂η

/-- Compact Følner sets satisfying Lindenstrauss' tempering condition. -/
def TemperedFolnerSequence (η : Measure G) (A : ℕ → Set G) : Prop :=
  (∀ j, IsCompact (A j) ∧ MeasurableSet (A j) ∧ 0 < η (A j) ∧ η (A j) < ⊤) ∧
  (∃ C : ℝ, 0 < C ∧ ∀ j,
    η.real (⋃ k ∈ Finset.range j, (A k)⁻¹ * A j) ≤ C * η.real (A j)) ∧
  ∀ K : Set G, IsCompact K → (1 : G) ∈ K →
    Filter.Tendsto (fun j => η.real (symmDiff (K * A j) (A j)) / η.real (A j))
      Filter.atTop (nhds 0)

/-- Almost-everywhere convergence of the normalized averages of every compactly supported
continuous observable to its component integral. -/
def AveragingSequence (μ : Measure X) (η : Measure G)
    (A : ℕ → Set G) (κ : Kernel X X) : Prop :=
  (∀ j, MeasurableSet (A j) ∧ 0 < η (A j) ∧ η (A j) < ⊤) ∧
  ∀ f : X → ℝ, Continuous f → HasCompactSupport f →
    ∀ᵐ x ∂μ, Filter.Tendsto (fun j => normalizedActionAverage η (A j) f x)
      Filter.atTop (nhds (∫ y, f y ∂(κ x)))

/-- A constant averages to itself over a set of finite positive measure. -/
theorem normalizedActionAverage_const (η : Measure G) (A : Set G)
    (hA : MeasurableSet A) (hpos : 0 < η A) (hfin : η A < ⊤) (c : ℝ) (x : X) :
    normalizedActionAverage η A (fun _ => c) x = c := by sorry

-- The whole finite group is a tempered Følner sequence; a singleton in a nontrivial group is not.
example : TemperedFolnerSequence (Measure.count : Measure (Equiv.Perm (Fin 2)))
    (fun _ => Set.univ) := by sorry
example : ¬ TemperedFolnerSequence (Measure.count : Measure (Equiv.Perm (Fin 2)))
    (fun _ => {(1 : Equiv.Perm (Fin 2))}) := by sorry

-- Averaging `(1, -1)` over the full permutation group gives `0`.
example : normalizedActionAverage (Measure.count : Measure (Equiv.Perm (Fin 2)))
    Set.univ (fun x : Fin 2 => if x = 0 then 1 else -1) 0 = 0 := by sorry

-- Negative control: for the trivial action the constant kernel is not the averaging limit.
example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ¬ AveragingSequence (G := PUnit) μ Measure.count (fun _ : ℕ => Set.univ)
      (Kernel.const (Fin 2) μ) := by sorry

end ActionAverages

section PartitionEntropy
variable {X ι κ : Type*} [MeasurableSpace X]

/-- The entropy `-Σ p_i log p_i` of a finite labelling, with `0 log 0 = 0`. -/
def finitePartitionEntropy [Fintype ι] (μ : Measure X) (label : X → ι) : ℝ :=
  - ∑ i, μ.real {x | label x = i} * Real.log (μ.real {x | label x = i})

/-- A finite partition of a probability space has entropy at most `log (card ι)`. -/
theorem finitePartitionEntropy_le_log_card [Fintype ι] (μ : Measure X) [IsProbabilityMeasure μ]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    (label : X → ι) (hl : Measurable label) :
    finitePartitionEntropy μ label ≤ Real.log (Fintype.card ι) := by sorry

/-- The extended Shannon sum of a countable labelling. -/
def countablePartitionEntropy (μ : Measure X) (label : X → ι) : ENNReal :=
  ∑' i, ENNReal.ofReal (-μ.real {x | label x = i} * Real.log (μ.real {x | label x = i}))

/-- The conditional entropy `Σ p_ij log(p_j/p_ij)` of countable labellings. -/
def conditionalPartitionEntropy (μ : Measure X) (label : X → ι) (base : X → κ) : ENNReal :=
  ∑' p : ι × κ, ENNReal.ofReal
    (μ.real {x | label x = p.1 ∧ base x = p.2} *
      Real.log (μ.real {x | base x = p.2} / μ.real {x | label x = p.1 ∧ base x = p.2}))

/-- The length-`n` itinerary `(a(x), a(Tx), …, a(T^{n-1}x))`. -/
def iteratedPartitionLabel (T : X → X) (label : X → ι) (n : ℕ) : X → (Fin n → ι) :=
  fun x i => label (T^[i.val] x)

/-- The entropy rate `inf_{n ≥ 1} H(join_n a)/n`. -/
def partitionEntropyRate (μ : Measure X) (T : X → X) (label : X → ι) : ENNReal :=
  ⨅ n : ℕ, countablePartitionEntropy μ (iteratedPartitionLabel T label (n + 1)) / (n + 1)

/-- The Kolmogorov–Sinai entropy: the supremum of the rates of finite-entropy labels into `ℕ`. -/
def measureEntropy (μ : Measure X) (T : X → X) : ENNReal :=
  ⨆ label : X → ℕ, ⨆ (_ : Measurable label),
    ⨆ (_ : countablePartitionEntropy μ label < ⊤), partitionEntropyRate μ T label

/-- The chain rule `H(a ∨ b) = H(b) + H(a | b)`. -/
theorem conditionalPartitionEntropy_chain [Countable ι] [Countable κ]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    [MeasurableSpace κ] [MeasurableSingletonClass κ]
    (μ : Measure X) [IsProbabilityMeasure μ] (label : X → ι) (base : X → κ)
    (hl : Measurable label) (hb : Measurable base) :
    countablePartitionEntropy μ (fun x => (label x, base x)) =
      countablePartitionEntropy μ base + conditionalPartitionEntropy μ label base := by sorry

/-- For a measure-preserving `T` the normalized itinerary entropies converge to the rate. -/
theorem partitionEntropyRate_limit [Countable ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (μ : Measure X) [IsProbabilityMeasure μ]
    (T : X → X) (hT : MeasurePreserving T μ μ) (label : X → ι)
    (hl : Measurable label) (hf : countablePartitionEntropy μ label < ⊤) :
    Filter.Tendsto (fun n : ℕ =>
      countablePartitionEntropy μ (iteratedPartitionLabel T label (n + 1)) / (n + 1))
      Filter.atTop (nhds (partitionEntropyRate μ T label)) := by sorry

-- A fair binary label has entropy `log 2`.
example :
    finitePartitionEntropy ((1 / 2 : ENNReal) • (Measure.count : Measure (Fin 2))) id =
      Real.log 2 := by sorry

-- Conditioning a label on itself gives `0`; independent fair labels give `log 2`.
example : conditionalPartitionEntropy
    ((1/2 : ENNReal) • (Measure.count : Measure (Fin 2))) id id = 0 := by sorry
example : conditionalPartitionEntropy
    ((1/4 : ENNReal) • (Measure.count : Measure (Fin 2 × Fin 2))) Prod.fst Prod.snd =
      ENNReal.ofReal (Real.log 2) := by sorry

-- The two-point flip from `0` has itinerary `(0, 1, 0)`.
example : iteratedPartitionLabel (fun i : Fin 2 => 1 - i) id 3 0 = ![0, 1, 0] := by sorry

-- The fair two-sided Bernoulli shift has measure entropy `log 2`; the identity has entropy `0`.
example :
    let μ : Measure (Fin 2) := (1/2 : ENNReal) • Measure.count
    letI : IsProbabilityMeasure μ := by sorry
    let ν := Measure.infinitePi (fun _ : ℤ => μ)
    measureEntropy ν (fun x k => x (k + 1)) = ENNReal.ofReal (Real.log 2) := by sorry
example : measureEntropy (Measure.dirac PUnit.unit) id = 0 := by sorry

end PartitionEntropy

section ConditionalLabelEntropy
open ProbabilityTheory
variable {X Y Z : Type*} [MeasurableSpace X] [StandardBorelSpace X] [Nonempty X]
  [MeasurableSpace Y] [MeasurableSpace Z]

/-- The information `-log p` of an atom, infinite at `p = 0`. -/
def atomInformation (p : ENNReal) : ENNReal :=
  if p = 0 then ⊤ else ENNReal.ofReal (-Real.log p.toReal)

/-- The conditional entropy of a standard-Borel label given another, through the conditional
kernel; it allows uncountably many atoms. -/
def conditionalLabelEntropy (μ : Measure X) [IsFiniteMeasure μ]
    (label : X → Y) (base : X → Z) : ENNReal :=
  ∫⁻ x, atomInformation ((condDistrib id base μ (base x)) {y | label y = label x}) ∂μ

/-- For countable labels the kernel formula agrees with the joint-cell formula. -/
theorem conditionalLabelEntropy_countable [Countable Y] [Countable Z]
    [MeasurableSingletonClass Y] [MeasurableSingletonClass Z]
    (μ : Measure X) [IsProbabilityMeasure μ] (label : X → Y) (base : X → Z)
    (hl : Measurable label) (hb : Measurable base) :
    conditionalLabelEntropy μ label base = conditionalPartitionEntropy μ label base := by sorry

-- A zero-probability atom has infinite information; a fair atom has information `log 2`.
example : atomInformation 0 = ⊤ ∧ atomInformation (1/2) = ENNReal.ofReal (Real.log 2) := by
  sorry

-- The point label of a nonatomic uniform probability, given a constant, has infinite entropy.
example : conditionalLabelEntropy
    (volume.restrict (Set.Ico (0 : ℝ) 1)) id (fun _ => PUnit.unit) = ⊤ := by sorry

-- For the trivial leaf group the point partition has zero leaf entropy under every
-- measurable automorphism; this identity provides no assertion about total entropy.
example (μ : Measure X) [IsProbabilityMeasure μ] (s : X ≃ᵐ X) :
    conditionalLabelEntropy μ s.symm id = 0 := by sorry

end ConditionalLabelEntropy

section SubordinatePartitions
variable {X V Y : Type*} [MeasurableSpace X] [Group V] [TopologicalSpace V]
  [MulAction V X] [MeasurableSpace Y] [StandardBorelSpace Y]

/-- A measurable partition subordinate to `V`-orbits: almost every atom lies in one orbit,
inside a compact orbit piece, and contains an orbit neighbourhood of its point. The parameter
`V` records the leaf group of this partition. -/
structure SubordinatePartition (μ : Measure X) (V : Type*) [Group V]
    [TopologicalSpace V] [MulAction V X] (Y : Type*) [MeasurableSpace Y]
    [StandardBorelSpace Y] where
  label : X → Y
  measurable_label : Measurable label
  fiber_orbit : ∀ᵐ x ∂μ, ∀ y, label y = label x → ∃ v : V, v • x = y
  fiber_compact : ∀ᵐ x ∂μ, ∃ K : Set V, IsCompact K ∧
    ∀ y, label y = label x → ∃ v ∈ K, v • x = y
  fiber_neighborhood : ∀ᵐ x ∂μ, ∃ U : Set V, IsOpen U ∧ 1 ∈ U ∧
    ∀ v ∈ U, label (v • x) = label x

/-- Absolute continuity preserves subordinate partitions. -/
theorem SubordinatePartition.null_change (μ ν : Measure X) (h : μ ≪ ν)
    (P : SubordinatePartition ν V Y) :
    ∃ Q : SubordinatePartition μ V Y, Q.label = P.label := by sorry

-- For the trivial action on two points the singleton partition is subordinate.
example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := fun _ => rfl, mul_smul := fun _ _ _ => rfl }
    ∃ P : SubordinatePartition (Measure.dirac (0 : Fin 2)) PUnit (Fin 2), P.label = id := by sorry

-- Negative control: for translations of `ℝ` the singleton partition at a Dirac point fails the
-- neighbourhood condition.
example :
    letI : MulAction (Multiplicative ℝ) ℝ :=
      { smul := fun v x => v.toAdd + x
        one_smul := by intro x; exact zero_add x
        mul_smul := by intro a b x; exact add_assoc a.toAdd b.toAdd x }
    ¬ ∃ P : SubordinatePartition (Measure.dirac (0 : ℝ)) (Multiplicative ℝ) ℝ,
      P.label = id := by sorry

end SubordinatePartitions

section GoodFunctions
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [MeasureSpace E] [BorelSpace E]
  [hHaar : Measure.IsAddHaarMeasure (volume : Measure E)]

/-- Kleinbock–Margulis `(C, α)`-good functions, in division-free form. -/
def GoodOn [FiniteDimensional ℝ E] (f : E → ℝ) (C α : ℝ) (V : Set E) : Prop :=
  0 < C ∧ 0 < α ∧ ContinuousOn f V ∧
    ∀ a : E, ∀ r : ℝ, 0 < r → Metric.closedBall a r ⊆ V →
      ∀ δ : ℝ, 0 < δ →
        volume.real {x ∈ Metric.ball a r | |f x| <
          δ * sSup ((fun x => |f x|) '' Metric.ball a r)} ≤
          C * δ ^ α * volume.real (Metric.ball a r)

variable [FiniteDimensional ℝ E]
include hHaar

/-- The absolute value of a good function is good. -/
theorem GoodOn_abs {f : E → ℝ} {C α : ℝ} {V : Set E} (h : GoodOn f C α V) :
    GoodOn (fun x => |f x|) C α V := by sorry

/-- Scalar multiples of good functions are good. -/
theorem GoodOn_smul {f : E → ℝ} {C α : ℝ} {V : Set E}
    (h : GoodOn f C α V) (c : ℝ) : GoodOn (fun x => c * f x) C α V := by sorry

/-- The maximum of two absolute good functions is good. -/
theorem GoodOn_max {f g : E → ℝ} {C α : ℝ} {V : Set E}
    (hf : GoodOn f C α V) (hg : GoodOn g C α V) :
    GoodOn (fun x => max |f x| |g x|) C α V := by sorry

/-- A finite supremum of absolute good functions is good. -/
theorem GoodOn_sup {I : Type*} [Fintype I] (f : I → E → ℝ)
    {C α : ℝ} {V : Set E} (hC : 0 < C) (hα : 0 < α)
    (hf : ∀ i, GoodOn (f i) C α V) :
    GoodOn (fun x => sSup (Set.range fun i => |f i x|)) C α V := by sorry

/-- A real polynomial of degree at most `k ≥ 1` is `(2k(k+1)^{1/k}, 1/k)`-good. -/
theorem polynomial_good (p : Polynomial ℝ) (k : ℕ) (hk : 1 ≤ k) (hdeg : p.natDegree ≤ k) :
    GoodOn (fun t : ℝ => p.eval t) (2 * k * (k + 1 : ℝ) ^ (1 / (k : ℝ))) (1 / (k : ℝ))
      Set.univ := by sorry

-- The zero function is good by the zero-supremum branch.
example : GoodOn (fun _ : ℝ => (0 : ℝ)) 1 1 Set.univ := by sorry

-- On `(-1, 1)`, `t²` has sublevel proportion `√ε`, not `ε`: a degree-independent exponent fails.
example : volume.real {t : ℝ | t ∈ Set.Ioo (-1) 1 ∧ |t ^ 2| < (1/4 : ℝ)} = 1 ∧
    volume.real {t : ℝ | t ∈ Set.Ioo (-1) 1 ∧ |t| < (1/4 : ℝ)} = 1/2 := by sorry

end GoodFunctions

section SingularWedgeTests

-- The lower-left entry of `Ad(g) E₁₂` is `-g₁₀²` for a determinant-one matrix `g`.
example (α : ℝ) (a b c d : ℤ) (hdet : a * d - b * c = 1) :
    let g : Matrix (Fin 2) (Fin 2) ℝ :=
      !![1, 0; α, 1] * (!![a, b; c, d] : Matrix (Fin 2) (Fin 2) ℤ).map
        (fun z => (z : ℝ))
    (g * (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℝ) * g.adjugate) 1 0 =
      -(α * (a : ℝ) + (c : ℝ)) ^ 2 := by sorry

-- An irrational lower-unipotent translate has no integral representative whose wedge is
-- on the upper-unipotent line, although a constant trajectory has a constant wedge.
example (α : ℝ) (hα : Irrational α) (a b c d : ℤ) (hdet : a * d - b * c = 1) :
    -(α * (a : ℝ) + (c : ℝ)) ^ 2 ≠ 0 := by sorry

end SingularWedgeTests

section PrimitiveExteriorCovolumes
variable {d k : ℕ}

/-- The sup norm of the exterior product of `h b₁, …, h b_k`: the largest absolute coordinate
minor, `1` in rank zero. -/
def primitiveExteriorCovolume (h : Matrix (Fin d) (Fin d) ℝ)
    (Δ : Submodule ℤ (Fin d → ℝ)) (b : Basis (Fin k) ℤ Δ) : ℝ :=
  sSup (Set.range fun I : Fin k → Fin d =>
    |(Matrix.of fun i j : Fin k => (h.mulVec (b j : Fin d → ℝ)) (I i)).det|)

/-- The exterior covolume does not depend on the integral basis. -/
theorem primitiveExteriorCovolume_basisChange
    (h : Matrix (Fin d) (Fin d) ℝ) (Δ : Submodule ℤ (Fin d → ℝ))
    (b c : Basis (Fin k) ℤ Δ) :
    primitiveExteriorCovolume h Δ b = primitiveExteriorCovolume h Δ c := by sorry

/-- The exterior covolume is nonnegative. -/
theorem primitiveExteriorCovolume_nonneg
    (h : Matrix (Fin d) (Fin d) ℝ) (Δ : Submodule ℤ (Fin d → ℝ))
    (b : Basis (Fin k) ℤ Δ) : 0 ≤ primitiveExteriorCovolume h Δ b := by sorry

/-- The exterior covolume is continuous in the matrix. -/
theorem primitiveExteriorCovolume_continuous
    (Δ : Submodule ℤ (Fin d → ℝ)) (b : Basis (Fin k) ℤ Δ) :
    Continuous (fun h : Matrix (Fin d) (Fin d) ℝ => primitiveExteriorCovolume h Δ b) := by sorry

/-- An invertible matrix gives positive exterior covolume on independent basis vectors. -/
theorem primitiveExteriorCovolume_pos
    (h : Matrix (Fin d) (Fin d) ℝ) (hh : h.det ≠ 0)
    (Δ : Submodule ℤ (Fin d → ℝ)) (b : Basis (Fin k) ℤ Δ)
    (hind : LinearIndependent ℝ (fun i => (b i : Fin d → ℝ))) :
    0 < primitiveExteriorCovolume h Δ b := by sorry

-- The primitive vector `(1, 1)` has exterior sup norm `1`, not its Euclidean length `√2`.
example (Δ : Submodule ℤ (Fin 2 → ℝ)) (b : Basis (Fin 1) ℤ Δ)
    (hb : (b 0 : Fin 2 → ℝ) = ![1, 1]) : primitiveExteriorCovolume 1 Δ b = 1 := by sorry

-- `diag(2, 3)` sends `(1, 1)` to exterior norm `3`.
example (Δ : Submodule ℤ (Fin 2 → ℝ)) (b : Basis (Fin 1) ℤ Δ)
    (hb : (b 0 : Fin 2 → ℝ) = ![1, 1]) :
    primitiveExteriorCovolume (Matrix.diagonal ![2, 3]) Δ b = 3 := by sorry

end PrimitiveExteriorCovolumes

section QuantitativeNondivergence

/-- An integral subgroup of `ℤ^d ⊂ ℝ^d` saturated in `ℤ^d`. -/
def integralPrimitiveSubgroup {d : ℕ} (Δ : Submodule ℤ (Fin d → ℝ)) : Prop :=
  (∀ x ∈ Δ, ∃ z : Fin d → ℤ, (fun i => (z i : ℝ)) = x) ∧
  ∀ (z : Fin d → ℤ) (a : ℤ), a ≠ 0 →
    (fun i => ((a * z i : ℤ) : ℝ)) ∈ Δ → (fun i => (z i : ℝ)) ∈ Δ

/-- The parameters at which `h(x) ℤ^d` has a nonzero vector of sup norm below `ε`. -/
def shortIntegerVectorSet {s d : ℕ} (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (B : Set (Fin s → ℝ)) (ε : ℝ) : Set (Fin s → ℝ) :=
  {x ∈ B | ∃ z : Fin d → ℤ, z ≠ 0 ∧ ‖(h x).mulVec (fun i => (z i : ℝ))‖ < ε}

/-- The short-vector locus grows with the threshold. -/
theorem shortIntegerVectorSet_mono {s d : ℕ}
    (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (B : Set (Fin s → ℝ)) {ε δ : ℝ} (hεδ : ε ≤ δ) :
    shortIntegerVectorSet h B ε ⊆ shortIntegerVectorSet h B δ := by sorry

/-- The short-vector locus of a continuous family is measurable. -/
theorem shortIntegerVectorSet_measurable {s d : ℕ}
    (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ) (hh : Continuous h)
    (B : Set (Fin s → ℝ)) (hB : MeasurableSet B) (ε : ℝ) :
    MeasurableSet (shortIntegerVectorSet h B ε) := by sorry

/-- **Kleinbock–Margulis quantitative nondivergence** (Theorem 5.2). -/
theorem quantitative_nondivergence {s d : ℕ} (hd : 0 < d)
    (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (x₀ : Fin s → ℝ) (r C α ρ ε : ℝ) (hr : 0 < r) (hC : 0 < C) (hα : 0 < α)
    (hρ : 0 < ρ) (hρd : ρ ≤ (d : ℝ)⁻¹) (hε : 0 < ε) (hερ : ε ≤ ρ)
    (hh : ContinuousOn h (Metric.ball x₀ ((3 : ℝ) ^ d * r)))
    (hdet : ∀ x ∈ Metric.ball x₀ ((3 : ℝ) ^ d * r), (h x).det ≠ 0)
    (hgood : ∀ (Δ : Submodule ℤ (Fin d → ℝ)), integralPrimitiveSubgroup Δ → Δ ≠ ⊥ →
      ∀ (k : ℕ) (b : Basis (Fin k) ℤ Δ),
        GoodOn (fun x => primitiveExteriorCovolume (h x) Δ b) C α
          (Metric.ball x₀ ((3 : ℝ) ^ d * r)))
    (hsup : ∀ (Δ : Submodule ℤ (Fin d → ℝ)), integralPrimitiveSubgroup Δ → Δ ≠ ⊥ →
      ∀ (k : ℕ) (b : Basis (Fin k) ℤ Δ),
        ρ ≤ sSup ((fun x => primitiveExteriorCovolume (h x) Δ b) '' Metric.ball x₀ r)) :
    volume.real (shortIntegerVectorSet h (Metric.ball x₀ r) ε) ≤
      (d : ℝ) * C * ((3 : ℝ) ^ s * Besicovitch.multiplicity (Fin s → ℝ)) ^ d *
        Real.rpow (ε / ρ) α * volume.real (Metric.ball x₀ r) := by sorry

-- `ℤ(1, 1)` is primitive in `ℤ²`; `ℤ(2, 0)` is not.
example : integralPrimitiveSubgroup
    (Submodule.span ℤ ({(![1, 1] : Fin 2 → ℝ)} : Set (Fin 2 → ℝ))) := by sorry
example : ¬ integralPrimitiveSubgroup
    (Submodule.span ℤ ({(![2, 0] : Fin 2 → ℝ)} : Set (Fin 2 → ℝ))) := by sorry

-- With `h = 1`, threshold `1/2` gives the empty set and threshold `2` everything.
example : shortIntegerVectorSet (fun _ : Fin 1 → ℝ => (1 : Matrix (Fin 1) (Fin 1) ℝ))
    Set.univ (1/2) = ∅ ∧
    shortIntegerVectorSet (fun _ : Fin 1 → ℝ => (1 : Matrix (Fin 1) (Fin 1) ℝ))
    Set.univ 2 = Set.univ := by sorry

end QuantitativeNondivergence

section WeightedGaussianFourier
open MvPolynomial
open scoped FourierTransform

/-- The Fourier transform of a harmonic polynomial times a Gaussian (4.3). -/
theorem fourier_harmonic_gaussian {n ℓ : ℕ} (P : MvPolynomial (Fin n) ℝ)
    (hh : P.IsHomogeneous ℓ) (hP : ∑ i : Fin n, pderiv i (pderiv i P) = 0)
    (t : ℝ) (ht : 0 < t) (y : EuclideanSpace ℝ (Fin n)) :
    𝓕 (fun x : EuclideanSpace ℝ (Fin n) =>
      (eval (fun i => x i) P : ℂ) * Complex.exp (-(Real.pi * t : ℂ) * ‖x‖ ^ 2)) y =
      (-Complex.I) ^ ℓ * (t : ℂ) ^ (-((n : ℂ) / 2 + ℓ)) *
        (eval (fun i => y i) P : ℂ) * Complex.exp (-(Real.pi / t : ℂ) * ‖y‖ ^ 2) := by sorry

-- In dimension one, `x e^{-πx²}` transforms to `-i ξ e^{-πξ²}`; `+i` reverses the phase.
example (y : ℝ) :
    𝓕 (fun x : ℝ => (x : ℂ) * Complex.exp (-(Real.pi : ℂ) * x ^ 2)) y =
      -Complex.I * (y : ℂ) * Complex.exp (-(Real.pi : ℂ) * y ^ 2) := by sorry

end WeightedGaussianFourier

section HarmonicTheta
open MvPolynomial

/-- The integer points of the sphere `x² + y² + z² = n`. -/
def ternaryShell (n : ℕ) : Set (Fin 3 → ℤ) := {v | ∑ i, v i ^ 2 = (n : ℤ)}

/-- The signed finite expression for `r₃(n)` from Mortenson's Kronecker-type identity. -/
def signedThreeSquareCount (n : ℕ) : ℤ :=
  6 * (-1 : ℤ) ^ (n + 1) *
    (∑ r ∈ Finset.Icc 1 n, ∑ s ∈ Finset.Icc 1 n,
      if r * s = n then (-1 : ℤ) ^ (r + s) else 0) +
  4 * (-1 : ℤ) ^ (n + 1) *
    (∑ r ∈ Finset.Icc 1 n, ∑ s ∈ Finset.Icc 1 n, ∑ t ∈ Finset.Icc 1 n,
      if r * s + r * t + s * t = n then (-1 : ℤ) ^ (r + s + t) else 0)

/-- For `n > 0` the signed expression counts the ternary shell. -/
theorem gauss_signed_three_square_count {n : ℕ} (hn : 0 < n) :
    (Nat.card (ternaryShell n) : ℤ) = signedThreeSquareCount n := by sorry

/-- **Gauss's three-square theorem** in Hurwitz form: `r₃(n) = 12 (H(4n) - 2 H(n))`, with Tau Ceti's
Hurwitz class number. -/
theorem three_square_hurwitz {n : ℕ} (hn : 0 < n) :
    (Nat.card (ternaryShell n) : ℚ) =
      12 * (TauCeti.hurwitzClassNumber (4 * n) - 2 * TauCeti.hurwitzClassNumber n) := by sorry

/-- The polynomial Laplacian `Σ ∂_i² P`. -/
def polynomialLaplacian (P : MvPolynomial (Fin 3) ℝ) : MvPolynomial (Fin 3) ℝ :=
  ∑ i : Fin 3, pderiv i (pderiv i P)

/-- The shell coefficient `Σ_{v ∈ S_n} P(v)`. -/
def ternaryWeightedCoefficient (P : MvPolynomial (Fin 3) ℝ) (n : ℕ) : ℝ :=
  ∑' v : ternaryShell n, eval (fun i => (v.1 i : ℝ)) P

/-- The weighted ternary theta series `Σ_v P(v) e^{2π i τ |v|²}`. -/
def ternaryHarmonicTheta (P : MvPolynomial (Fin 3) ℝ) (τ : ℂ) : ℂ :=
  ∑' v : Fin 3 → ℤ, (eval (fun i => (v i : ℝ)) P : ℂ) *
    Complex.exp (2 * (Real.pi : ℂ) * Complex.I * τ * (∑ i, (v i : ℂ) ^ 2))

/-- The fundamental discriminant `-n` or `-4n` attached to a squarefree `n`. -/
def ternaryFundamentalDiscriminant (n : ℕ) : ℤ :=
  if n % 4 = 3 then -(n : ℤ) else -4 * (n : ℤ)

/-- Every ternary shell is finite. -/
theorem ternaryShell_finite (n : ℕ) : (ternaryShell n).Finite := by sorry

/-- The shell coefficient is additive in the polynomial. -/
theorem ternaryWeightedCoefficient_add (P Q : MvPolynomial (Fin 3) ℝ) (n : ℕ) :
    ternaryWeightedCoefficient (P + Q) n =
      ternaryWeightedCoefficient P n + ternaryWeightedCoefficient Q n := by sorry

/-- Odd homogeneous polynomials have zero shell coefficients. -/
theorem ternaryWeightedCoefficient_odd (P : MvPolynomial (Fin 3) ℝ) (ℓ : ℕ)
    (hhom : P.IsHomogeneous ℓ) (hodd : Odd ℓ) (n : ℕ) :
    ternaryWeightedCoefficient P n = 0 := by sorry

/-- The weighted theta series is absolutely summable on the upper half-plane. -/
theorem ternaryHarmonicTheta_summable (P : MvPolynomial (Fin 3) ℝ) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable (fun v : Fin 3 → ℤ => (eval (fun i => (v i : ℝ)) P : ℂ) *
      Complex.exp (2 * (Real.pi : ℂ) * Complex.I * τ * (∑ i, (v i : ℂ) ^ 2))) := by sorry

/-- The weighted theta series is the generating function of the shell coefficients. -/
theorem ternaryHarmonicTheta_coeff (P : MvPolynomial (Fin 3) ℝ) (τ : ℂ) (hτ : 0 < τ.im) :
    ternaryHarmonicTheta P τ = ∑' n : ℕ,
      (ternaryWeightedCoefficient P n : ℂ) *
        Complex.exp (2 * (Real.pi : ℂ) * Complex.I * τ * n) := by sorry

-- `r₃(3) = 8` and `r₃(7) = 0` through the signed expression.
example : signedThreeSquareCount 3 = 8 := by decide
example : signedThreeSquareCount 7 = 0 := by decide

-- Negative control: at `n = 0` the signed expression is `0` but the shell has one point.
example : signedThreeSquareCount 0 = 0 ∧ Nat.card (ternaryShell 0) = 1 := by sorry

-- `X₀² - X₁²` is harmonic; `X₀²` alone has Laplacian `2`.
example : polynomialLaplacian
    ((X (0 : Fin 3)) ^ 2 - (X (1 : Fin 3)) ^ 2 : MvPolynomial (Fin 3) ℝ) = 0 := by sorry
example : polynomialLaplacian ((X (0 : Fin 3)) ^ 2 : MvPolynomial (Fin 3) ℝ) = 2 := by sorry

-- The harmonic quartic `Σ X_i⁴ - (3/5)(Σ X_i²)²` has shell coefficient `12/5` at `n = 1`.
example :
    let P : MvPolynomial (Fin 3) ℝ :=
      (∑ i : Fin 3, X i ^ 4) - C (3/5) * (∑ i : Fin 3, X i ^ 2) ^ 2
    P.IsHomogeneous 4 ∧ polynomialLaplacian P = 0 ∧
      ternaryWeightedCoefficient P 1 = 12/5 := by sorry

-- `X₀` has vanishing theta series by `v ↦ -v`.
example (τ : ℂ) : ternaryHarmonicTheta (X (0 : Fin 3)) τ = 0 := by sorry

-- The fundamental discriminants of `1, 2, 3` are `-4, -8, -3`.
example : ternaryFundamentalDiscriminant 1 = -4 ∧ ternaryFundamentalDiscriminant 2 = -8 ∧
    ternaryFundamentalDiscriminant 3 = -3 := by decide

end HarmonicTheta

section KroneckerKernels

/-- The infinite `q`-Pochhammer product `∏_{n ≥ 0} (1 - a qⁿ)`. -/
noncomputable def qPochhammer (a q : ℂ) : ℂ := ∏' n : ℕ, (1 - a * q ^ n)

/-- Jacobi's product `J(a; q) = P(a; q) P(q/a; q) P(q; q)`. -/
noncomputable def jacobiProduct (a q : ℂ) : ℂ :=
  qPochhammer a q * qPochhammer (q / a) q * qPochhammer q q

/-- The summand `q^{st} y^s z^t/(1 - x q^{s+t})` of the double kernel. -/
def kroneckerSummand (q x y z : ℂ) (s t : ℤ) : ℂ :=
  q ^ (s * t) * y ^ s * z ^ t / (1 - x * q ^ (s + t))

/-- The double kernel: the sum over `s, t ≥ 0` minus the sum over `s, t < 0`. -/
noncomputable def kroneckerDoubleKernel (q x y z : ℂ) : ℂ :=
  (∑' st : ℕ × ℕ, kroneckerSummand q x y z st.1 st.2) -
  (∑' st : ℕ × ℕ, kroneckerSummand q x y z (-(st.1 + 1 : ℤ)) (-(st.2 + 1 : ℤ)))

/-- One cyclic term `T(x, y, z; q)` of Mortenson's identity. -/
noncomputable def kroneckerCyclicTerm (q x y z : ℂ) : ℂ :=
  (qPochhammer (x * y) (q ^ 2) * qPochhammer (q ^ 2 / (x * y)) (q ^ 2) *
    qPochhammer q q ^ 2) /
  (qPochhammer x q * qPochhammer y q * qPochhammer (q / x) q *
    qPochhammer (q / y) q * qPochhammer (q ^ 2) (q ^ 2)) *
  ∑' k : ℤ, (-1 : ℂ) ^ k * q ^ (k ^ 2) * (x * y) ^ k / (1 + q ^ (2 * k) * z)

/-- The product correction `C(x, y, z; q)` of Mortenson's identity. -/
noncomputable def kroneckerCorrection (q x y z : ℂ) : ℂ :=
  2 * qPochhammer (q ^ 2) (q ^ 2) ^ 3 *
    (qPochhammer (x * y) (q ^ 2) * qPochhammer (x * z) (q ^ 2) *
     qPochhammer (y * z) (q ^ 2) * qPochhammer (q ^ 2 / (x * y)) (q ^ 2) *
     qPochhammer (q ^ 2 / (x * z)) (q ^ 2) * qPochhammer (q ^ 2 / (y * z)) (q ^ 2)) /
    (qPochhammer x q * qPochhammer y q * qPochhammer z q *
     qPochhammer (q / x) q * qPochhammer (q / y) q * qPochhammer (q / z) q *
     qPochhammer (-x) (q ^ 2) * qPochhammer (-y) (q ^ 2) *
     qPochhammer (-z) (q ^ 2) * qPochhammer (-q ^ 2 / x) (q ^ 2) *
     qPochhammer (-q ^ 2 / y) (q ^ 2) * qPochhammer (-q ^ 2 / z) (q ^ 2))

/-- **Mortenson's double-sum Kronecker-type identity**, where every displayed quotient is
defined. -/
theorem kronecker_double_identity (q x y z : ℂ)
    (hq : 0 < ‖q‖ ∧ ‖q‖ < 1)
    (hy : ‖q‖ < ‖y‖ ∧ ‖y‖ < 1) (hz : ‖q‖ < ‖z‖ ∧ ‖z‖ < 1)
    (hx : x ≠ 0 ∧ ∀ k : ℤ, x ≠ q ^ k)
    (hp : ∀ k : ℤ, z ≠ -q ^ (2 * k) ∧ y ≠ -q ^ (2 * k) ∧ x ≠ -q ^ (2 * k)) :
    kroneckerDoubleKernel q x y z =
      kroneckerCyclicTerm q x y z + kroneckerCyclicTerm q x z y +
      kroneckerCyclicTerm q y z x - kroneckerCorrection q x y z := by sorry

/-- `P(a; q) = (1 - a) P(aq; q)` for `|q| < 1`. -/
theorem qPochhammer_shift (a q : ℂ) (hq : ‖q‖ < 1) :
    qPochhammer a q = (1 - a) * qPochhammer (a * q) q := by sorry

/-- `J(a⁻¹; q) = -a⁻¹ J(a; q)`. -/
theorem jacobiProduct_inversion (a q : ℂ) (ha : a ≠ 0) (hq : ‖q‖ < 1) :
    jacobiProduct (a⁻¹) q = -a⁻¹ * jacobiProduct a q := by sorry

-- The index-zero factor cannot be omitted: `P(1; q) = 0` and `P(a; 0) = 1 - a`.
example (q : ℂ) : qPochhammer 1 q = 0 := by sorry
example (a : ℂ) : qPochhammer a 0 = 1 - a := by sorry

-- `J(q; q) = 0` for `0 < |q| < 1`: the factor is `P(q/a)`, not `P(a/q)`.
example (q : ℂ) (hq0 : q ≠ 0) (hq : ‖q‖ < 1) : jacobiProduct q q = 0 := by sorry

-- At `q = 0` the factor `P(q/q; q)` is `P(0; 0) = 1` because `0/0 = 0`, so `J(0; 0) = 1`.
example : jacobiProduct (0 : ℂ) 0 = 1 := by
  simp [jacobiProduct, qPochhammer]

-- At `(q, x, y, z) = (1/2, 1/3, 2/3, 3/4)` the summand at `(-1, -1)` is `-3`.
example : kroneckerSummand (1/2) (1/3) (2/3) (3/4) (-1) (-1) = -3 := by
  norm_num [kroneckerSummand]

-- At `q = 0` the kernel, a cyclic term and the correction take the values `3/2`, `2`, `8/3`.
example : kroneckerDoubleKernel 0 (1/3) 0 0 = 3/2 := by sorry
example : kroneckerCyclicTerm 0 (1/3) (2/3) (3/4) = 2 := by sorry
example : kroneckerCorrection 0 0 0 (1/2) = 8/3 := by sorry

end KroneckerKernels

section HalfIntegralKloosterman

/-- The theta-multiplier phase `ε_d`: `1` for `d ≡ 1 (mod 4)` and `i` otherwise. -/
def thetaMultiplierPhase (d : ℕ) : ℂ := if d % 4 = 1 then 1 else Complex.I

/-- The weight `ℓ + 1/2` Kloosterman sum `Σ_d ε_d^{-(2ℓ+1)} (c/d) e((m d̄ + n d)/c)`. -/
noncomputable def halfIntegralKloosterman (ℓ m n c : ℕ) [NeZero c] : ℂ :=
  ∑ d : (ZMod c)ˣ,
    thetaMultiplierPhase (d.val.val) ^ (-(2 * (ℓ : ℤ) + 1)) *
      (jacobiSym (c : ℤ) d.val.val : ℂ) *
      Complex.exp (2 * Real.pi * Complex.I *
        (((m : ℂ) * (↑(d⁻¹).val.val : ℂ) + (n : ℂ) * (↑d.val.val : ℂ)) / c))

/-- The finite level-restricted sum `K_Q(x)` of Iwaniec's averaged estimate. -/
noncomputable def halfIntegralKloostermanPartialSum (ℓ n Q : ℕ) (x v : ℝ) : ℂ :=
  ∑ c ∈ Finset.range (Nat.floor x + 1),
    if hc : 0 < c then
      letI : NeZero c := ⟨Nat.ne_of_gt hc⟩
      if Q ∣ c then
        (Real.sqrt c : ℂ)⁻¹ * halfIntegralKloosterman ℓ n n c *
          Complex.exp (2 * Real.pi * Complex.I * (v : ℂ) * (2 * n / c : ℂ))
      else 0
    else 0

/-- The sum is periodic in `m` modulo `c`. -/
theorem halfIntegralKloosterman_period_m (ℓ m n c : ℕ) [NeZero c] :
    halfIntegralKloosterman ℓ (m + c) n c = halfIntegralKloosterman ℓ m n c := by sorry

/-- The sum has period two in the weight parameter. -/
theorem halfIntegralKloosterman_weight_period (ℓ m n c : ℕ) [NeZero c] :
    halfIntegralKloosterman (ℓ + 2) m n c = halfIntegralKloosterman ℓ m n c := by sorry

/-- The partial sum is continuous in its phase parameter. -/
theorem halfIntegralKloostermanPartialSum_continuous (ℓ n Q : ℕ) (x : ℝ) :
    Continuous (halfIntegralKloostermanPartialSum ℓ n Q x) := by sorry

-- The phases at `d = 1, 3` are `1, i`.
example : thetaMultiplierPhase 1 = 1 ∧ thetaMultiplierPhase 3 = Complex.I := by
  norm_num [thetaMultiplierPhase]

-- `K_{ℓ=0}(0,0;4) = 1 - i` and `K_{ℓ=1}(0,0;4) = 1 + i`: the exponent is negative.
example : halfIntegralKloosterman 0 0 0 4 = 1 - Complex.I ∧
    halfIntegralKloosterman 1 0 0 4 = 1 + Complex.I := by sorry

-- At `x = 0` every partial sum is zero.
example (ℓ n Q : ℕ) (v : ℝ) : halfIntegralKloostermanPartialSum ℓ n Q 0 v = 0 := by sorry

end HalfIntegralKloosterman

section PackingCovering
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- The packing radius: half the first Euclidean minimum, `0` in dimension zero (4.4.1). -/
def latticePackingRadius (L : Submodule ℤ E) : ℝ :=
  if finrank ℝ E = 0 then 0 else sInf {r : ℝ | ∃ x ∈ L, x ≠ 0 ∧ r = ‖x‖} / 2

/-- The covering radius `sup_x d(x, L)` (4.4.2). -/
def latticeCoveringRadius (L : Submodule ℤ E) : ℝ :=
  sSup (Set.range (fun x : E => Metric.infDist x (L : Set E)))

/-- In positive dimension the packing radius is half the first minimum. -/
theorem latticePackingRadius_eq_half (L : Submodule ℤ E) (h : 0 < finrank ℝ E) :
    latticePackingRadius L = sInf {r : ℝ | ∃ x ∈ L, x ≠ 0 ∧ r = ‖x‖} / 2 := by sorry

/-- The packing radius scales with the lattice. -/
theorem latticePackingRadius_smul (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (a : ℝ) (ha : 0 < a) :
    latticePackingRadius (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) =
      a * latticePackingRadius L := by sorry

/-- The covering radius of a full lattice is attained. -/
theorem latticeCoveringRadius_attained (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] : ∃ x : E, Metric.infDist x (L : Set E) = latticeCoveringRadius L := by sorry

/-- The covering radius scales with the lattice. -/
theorem latticeCoveringRadius_smul (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (a : ℝ) (ha : 0 < a) :
    latticeCoveringRadius (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) =
      a * latticeCoveringRadius L := by sorry

-- For `ℤ ⊂ ℝ` both radii are `1/2`.
example : latticePackingRadius (Submodule.span ℤ ({1} : Set ℝ)) = 1/2 ∧
    latticeCoveringRadius (Submodule.span ℤ ({1} : Set ℝ)) = 1/2 := by sorry

-- For `ℤ²` the covering radius `√2/2` exceeds the packing radius `1/2`.
example : latticeCoveringRadius (Submodule.span ℤ
    ({WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![0, 1]} : Set (EuclideanSpace ℝ (Fin 2)))) =
      Real.sqrt 2 / 2 := by sorry

end PackingCovering

section StarBodies
variable (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- A compact star body, given by its continuous definite positively homogeneous gauge (4.5.1);
convexity is not assumed. -/
structure CompactStarBody where
  gauge : E → ℝ
  continuous : Continuous gauge
  nonneg : ∀ x, 0 ≤ gauge x
  zero_iff : ∀ x, gauge x = 0 ↔ x = 0
  homogeneous : ∀ (a : ℝ), 0 ≤ a → ∀ x, gauge (a • x) = a * gauge x
  compact : IsCompact {x | gauge x ≤ 1}
  originInterior : (0 : E) ∈ interior {x | gauge x ≤ 1}

variable {E}

/-- Bundle a gauge with its properties. -/
def CompactStarBody.ofGauge (p : E → ℝ) (hc : Continuous p)
    (hn : ∀ x, 0 ≤ p x) (hz : ∀ x, p x = 0 ↔ x = 0)
    (hh : ∀ a : ℝ, 0 ≤ a → ∀ x, p (a • x) = a * p x)
    (hk : IsCompact {x | p x ≤ 1}) (hi : (0 : E) ∈ interior {x | p x ≤ 1}) :
    CompactStarBody E := ⟨p, hc, hn, hz, hh, hk, hi⟩

/-- Radial scaling of the gauge. -/
theorem CompactStarBody.radial (K : CompactStarBody E) (a : ℝ) (ha : 0 < a) (x : E) :
    K.gauge (a • x) ≤ 1 ↔ K.gauge x ≤ 1 / a := by sorry

/-- A lattice is admissible when the interior of the body contains no nonzero lattice point. -/
def CompactStarBody.admissible (K : CompactStarBody E) (L : Submodule ℤ E) : Prop :=
  ∀ x ∈ L, x ≠ 0 → 1 ≤ K.gauge x

/-- A convex star body as a `ConvexBody`. -/
def CompactStarBody.convexComparison (K : CompactStarBody E)
    (h : Convex ℝ {x | K.gauge x ≤ 1}) : ConvexBody E :=
  ⟨{x | K.gauge x ≤ 1}, h, K.compact, ⟨0, by sorry⟩⟩

-- The convex comparison has the unit sublevel as carrier.
example (K : CompactStarBody E) (h : Convex ℝ {x | K.gauge x ≤ 1}) :
    (K.convexComparison h : Set E) = {x | K.gauge x ≤ 1} := by sorry

-- Negative control: `(√|x| + √|y|)² ≤ 1` is a compact star body that is not convex.
example : ¬ Convex ℝ {x : EuclideanSpace ℝ (Fin 2) |
    (Real.sqrt |x 0| + Real.sqrt |x 1|) ^ 2 ≤ 1} := by sorry

end StarBodies

section CriticalDeterminants
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]
local instance : MeasureSpace E := measureSpaceOfInnerProductSpace

/-- The critical determinant `Δ(K)`: the infimum of covolumes of admissible full lattices
(4.5.2). -/
def criticalDeterminant (K : CompactStarBody E) : ℝ :=
  sInf {d | ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
    K.admissible L ∧ d = ZLattice.covolume L}

/-- `Δ(K)` is at most the covolume of every admissible lattice. -/
theorem criticalDeterminant_le_covolume (K : CompactStarBody E) (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (h : K.admissible L) :
    criticalDeterminant K ≤ ZLattice.covolume L := by sorry

/-- `Δ` is monotone in the body. -/
theorem criticalDeterminant_mono (K H : CompactStarBody E)
    (h : {x | K.gauge x ≤ 1} ⊆ {x | H.gauge x ≤ 1}) :
    criticalDeterminant K ≤ criticalDeterminant H := by sorry

/-- `Δ(aK) = a^n Δ(K)`. -/
theorem criticalDeterminant_smul (K H : CompactStarBody E) (a : ℝ) (ha : 0 < a)
    (h : ∀ x, H.gauge x = K.gauge x / a) :
    criticalDeterminant H = a ^ (finrank ℝ E) * criticalDeterminant K := by sorry

/-- In positive dimension the critical determinant is positive (4.5.5). -/
theorem critical_determinant_positive (K : CompactStarBody E) (hn : 0 < finrank ℝ E) :
    0 < criticalDeterminant K := by sorry

/-- Admissibility is closed under convergence of bases (4.5.7). -/
theorem star_admissibility_closed (K : CompactStarBody E) {n : ℕ}
    (b : ℕ → Fin n → E) (c : Basis (Fin n) ℝ E)
    (hconv : ∀ i, Filter.Tendsto (fun m => b m i) Filter.atTop (nhds (c i)))
    (h : ∀ m, K.admissible (Submodule.span ℤ (Set.range (b m)))) :
    K.admissible (Submodule.span ℤ (Set.range c)) := by sorry

/-- **Mahler's theorem** (4.5.9): every compact star body has a critical lattice. -/
theorem critical_lattice_exists (K : CompactStarBody E) :
    ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
      K.admissible L ∧ ZLattice.covolume L = criticalDeterminant K := by sorry

-- For `|x|` on `ℝ`, `Δ = 1`; for `|x|/2`, `Δ = 2`.
example (K : CompactStarBody ℝ) (h : ∀ x, K.gauge x = |x|) : criticalDeterminant K = 1 := by sorry
example (K : CompactStarBody ℝ) (h : ∀ x, K.gauge x = |x| / 2) : criticalDeterminant K = 2 := by
  sorry

end CriticalDeterminants

section GaussianSums
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The Gaussian lattice sum `ρ_s(L + u) = Σ_{x ∈ L} exp(-π ‖x + u‖²/s²)` (4.4.4), the value of
ThetaSeries' coset theta series `thetaCoset L u` at `i/s²`. -/
def latticeGaussianSum [FiniteDimensional ℝ E] (L : Submodule ℤ E) (s : ℝ) (u : E) : ℝ :=
  ∑' x : L, Real.exp (-Real.pi * ‖(x : E) + u‖ ^ 2 / s ^ 2)

variable [FiniteDimensional ℝ E]

/-- In rank zero the sum is `1`. -/
theorem latticeGaussianSum_zeroRank (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) (s : ℝ)
    (hs : 0 < s) : latticeGaussianSum L s 0 = 1 := by sorry

/-- Lattice translates do not change the sum. -/
theorem latticeGaussianSum_translate (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u v : E) (hv : v ∈ L) :
    latticeGaussianSum L s (u + v) = latticeGaussianSum L s u := by sorry

/-- Simultaneous scaling of `L`, `u` and `s` does not change the sum. -/
theorem latticeGaussianSum_scale (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s a : ℝ) (hs : 0 < s) (ha : 0 < a) (u : E) :
    latticeGaussianSum (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) (a * s) (a • u) =
      latticeGaussianSum L s u := by sorry

/-- Every positive-scale shifted Gaussian is summable on a full lattice (4.4.5): ThetaSeries'
`summable_poisson_left` for the Schwartz Gaussian `gaussian (i/s²)`. -/
theorem gaussian_lattice_summable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u : E) :
    Summable (fun x : L => Real.exp (-Real.pi * ‖(x : E) + u‖ ^ 2 / s ^ 2)) := by sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- **Poisson summation for the Gaussian** (4.4.6), with the integral inner dual: ThetaSeries'
`poissonSummation` for `gaussian (i/s²)` with its transform `fourier_gaussian`. -/
theorem gaussian_lattice_poisson (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u : E) :
    (latticeGaussianSum L s u : ℂ) = ((ZLattice.covolume L)⁻¹ * s ^ (finrank ℝ E) : ℝ) *
      ∑' y : LinearMap.BilinForm.dualSubmodule (innerₗ E) L,
        (Real.exp (-Real.pi * ‖(y : E)‖ ^ 2 * s ^ 2) : ℂ) *
          Complex.exp (2 * Real.pi * Complex.I * (inner ℝ (y : E) u : ℂ)) := by sorry

end GaussianSums

-- `ρ_2(2ℤ) = ρ_1(ℤ)`: simultaneous scaling.
example : latticeGaussianSum (Submodule.span ℤ {(2 : ℝ)}) 2 0 =
    latticeGaussianSum (Submodule.span ℤ {(1 : ℝ)}) 1 0 := by sorry

section SiegelTransform
variable {E : Type*} [AddCommGroup E]

/-- The Siegel transform `Σ_{v ∈ L ∖ 0} f(v)` (4.6). -/
def siegelTransform (L : Submodule ℤ E) (f : E → ℝ) : ℝ :=
  ∑' v : {v : L // (v : E) ≠ 0}, f (v.val : E)

/-- The transform is additive on summable functions. -/
theorem siegelTransform_add (L : Submodule ℤ E) (f g : E → ℝ)
    (hf : Summable (fun v : {v : L // (v : E) ≠ 0} => f (v.val : E)))
    (hg : Summable (fun v : {v : L // (v : E) ≠ 0} => g (v.val : E))) :
    siegelTransform L (f + g) = siegelTransform L f + siegelTransform L g := by sorry

/-- The transform of a nonnegative function is nonnegative. -/
theorem siegelTransform_nonneg (L : Submodule ℤ E) (f : E → ℝ)
    (hf : ∀ x, 0 ≤ f x) : 0 ≤ siegelTransform L f := by sorry

-- The zero lattice has transform `0` even when `f(0) ≠ 0`.
example (f : E → ℝ) : siegelTransform ⊥ f = 0 := by sorry

end SiegelTransform

-- Negative control for `n = 1`: on `ℤ` the indicator of `[-1/2, 1/2]` has transform `0` while its
-- integral is `1`.
example : siegelTransform (Submodule.span ℤ {(1 : ℝ)})
    ((Set.Icc (-1/2 : ℝ) (1/2)).indicator (fun _ => (1 : ℝ))) = 0 := by sorry

section GaussianAllIndex
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- The real span of the lattice vectors of norm strictly less than `r`. -/
def shortVectorSpan (L : Submodule ℤ E) (r : ℝ) : Submodule ℝ E :=
  Submodule.span ℝ {x : E | x ∈ L ∧ ‖x‖ < r}

/-- The short-vector span grows with the threshold. -/
theorem shortVectorSpan_mono (L : Submodule ℤ E) {r s : ℝ} (h : r ≤ s) :
    shortVectorSpan L r ≤ shortVectorSpan L s := by sorry

/-- Below `λ_i` the short-vector span has dimension at most `i` (zero-based). -/
theorem shortVectorSpan_dim_lt_minimum (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1)
    (i : Fin (finrank ℝ E)) (r : ℝ) (hr : r < successiveMin L K i) :
    finrank ℝ (shortVectorSpan L r) ≤ i.val := by sorry

/-- The Gaussian characteristic function `Σ e^{-π‖x‖²} cos(2π⟨x, u⟩)/ρ_1(L)`. -/
def gaussianCharacteristic (L : Submodule ℤ E) (u : E) : ℝ :=
  (∑' x : L, Real.exp (-Real.pi * ‖(x : E)‖ ^ 2) *
    Real.cos (2 * Real.pi * inner ℝ (x : E) u)) / latticeGaussianSum L 1 0

/-- The characteristic function is `1` at `0`. -/
theorem gaussianCharacteristic_zero (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] : gaussianCharacteristic L 0 = 1 := by sorry

/-- The characteristic function is periodic under the dual lattice. -/
theorem gaussianCharacteristic_periodic (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (u v : E)
    (hv : v ∈ LinearMap.BilinForm.dualSubmodule (innerₗ E) L) :
    gaussianCharacteristic L (u + v) = gaussianCharacteristic L u := by sorry

/-- Poisson summation: the characteristic function is `ρ_1(L* + u)/ρ_1(L*)`. -/
theorem gaussian_characteristic_poisson (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (u : E) :
    gaussianCharacteristic L u =
      latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 u /
      latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 0 := by sorry

-- The defining inequality is strict: for `ℤ`, threshold `1` gives `0`, threshold `2` all of `ℝ`.
example : shortVectorSpan (Submodule.span ℤ {(1 : ℝ)}) 1 = ⊥ ∧
    shortVectorSpan (Submodule.span ℤ {(1 : ℝ)}) 2 = ⊤ := by sorry

-- For `ℤ`, the characteristic function at `1/2` is strictly less than `1`.
example : gaussianCharacteristic (Submodule.span ℤ {(1 : ℝ)}) (1/2) < 1 := by sorry

end GaussianAllIndex

section HexagonalLattice

/-- The hexagonal lattice spanned by `(1, 0)` and `(1/2, √3/2)`. -/
noncomputable def hexagonalLattice : Submodule ℤ (EuclideanSpace ℝ (Fin 2)) :=
  Submodule.span ℤ {WithLp.toLp 2 (![1, 0] : Fin 2 → ℝ),
    WithLp.toLp 2 (![1/2, Real.sqrt 3 / 2] : Fin 2 → ℝ)}

/-- The hexagonal lattice is discrete. -/
theorem hexagonalLattice_discrete : DiscreteTopology hexagonalLattice := by sorry

/-- The hexagonal lattice is full. -/
theorem hexagonalLattice_full :
    letI := hexagonalLattice_discrete
    IsZLattice ℝ hexagonalLattice := by sorry

-- Its covolume is `√3/2` and `(0, 1)` is not a lattice point.
example : letI := hexagonalLattice_full; ZLattice.covolume hexagonalLattice = Real.sqrt 3 / 2 := by
  sorry
example : WithLp.toLp 2 (![0, 1] : Fin 2 → ℝ) ∉ hexagonalLattice := by sorry

-- Both Euclidean minima are `1`; the dual minima are `2/√3`, so the paired product exceeds `1`.
example (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = Metric.closedBall 0 1) :
    letI := hexagonalLattice_discrete
    ∀ i, successiveMin hexagonalLattice K i = 1 := by sorry

end HexagonalLattice

section Transference
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- **Banaszczyk's transference theorem** (4.4.13): `λ_i(L) λ_{n+1-i}(L*) ≤ n`. -/
theorem euclidean_dual_transference_upper (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1)
    (i j : Fin (finrank ℝ E)) (hij : i.val + j.val + 1 = finrank ℝ E) :
    successiveMin L K i *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K j ≤
        (finrank ℝ E : ℝ) := by sorry

/-- **Covering transference** (4.4.14): `1/2 ≤ μ(L) λ_1(L*) ≤ n`. -/
theorem covering_dual_transference (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1) (hd : 0 < finrank ℝ E) :
    (1/2 : ℝ) ≤ latticeCoveringRadius L *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K ⟨0, hd⟩ ∧
    latticeCoveringRadius L *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K ⟨0, hd⟩ ≤
        (finrank ℝ E : ℝ) := by sorry

end Transference

section Oppenheim

/-- **Margulis's theorem** (Oppenheim conjecture, 4.3.1): a nondegenerate indefinite form in at
least three variables that is not proportional to a rational form has dense values on `ℤⁿ`. -/
theorem oppenheim_values {n : ℕ} (hn : 3 ≤ n) (q : QuadraticForm ℝ (Fin n → ℝ))
    (hnd : ∀ x : Fin n → ℝ, x ≠ 0 → ∃ y, q (x + y) - q x - q y ≠ 0)
    (hind : (∃ x, q x > 0) ∧ (∃ x, q x < 0))
    (hirr : ¬ ∃ c : ℝ, c ≠ 0 ∧ ∀ z : Fin n → ℤ,
      ∃ r : ℚ, q (fun i => (z i : ℝ)) = c * (r : ℝ)) :
    Dense (Set.range (fun z : Fin n → ℤ => q (fun i => (z i : ℝ)))) := by sorry

-- `x² + y² - √2 z²` is irrational up to scalar.
example : ¬ ∃ c : ℝ, c ≠ 0 ∧ ∀ z : Fin 3 → ℤ,
    ∃ r : ℚ, QuadraticMap.weightedSumSquares ℝ
      (![1, 1, -Real.sqrt 2] : Fin 3 → ℝ) (fun i => (z i : ℝ)) = c * (r : ℝ) := by sorry

-- Negative control: `√2 (x² + y² - z²)` is proportional to a rational form.
example : ∃ c : ℝ, c ≠ 0 ∧ ∀ z : Fin 3 → ℤ,
    ∃ r : ℚ, QuadraticMap.weightedSumSquares ℝ
      (![Real.sqrt 2, Real.sqrt 2, -Real.sqrt 2] : Fin 3 → ℝ)
      (fun i => (z i : ℝ)) = c * (r : ℝ) := by sorry

end Oppenheim

/-! ## Layer 5: Certified LLL reduction -/

section LLL
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- The Gram–Schmidt coefficient `μ_{ij} = ⟨b_i, b*_j⟩/‖b*_j‖²` (5.1.1). -/
def lllCoefficient (b : Fin n → E) (i j : Fin n) : ℝ :=
  inner ℝ (b i) (InnerProductSpace.gramSchmidt ℝ b j) /
    ‖InnerProductSpace.gramSchmidt ℝ b j‖ ^ 2

/-- The defining ratio. -/
theorem lllCoefficient_eq (b : Fin n → E) (i j : Fin n) :
    lllCoefficient b i j = inner ℝ (b i) (InnerProductSpace.gramSchmidt ℝ b j) /
      ‖InnerProductSpace.gramSchmidt ℝ b j‖ ^ 2 := rfl

/-- Off-diagonal coefficients of an orthogonal family vanish. -/
theorem lllCoefficient_orthogonal (b : Fin n → E)
    (hb : Pairwise (fun i j => inner ℝ (b i) (b j) = 0)) (i j : Fin n) (h : i ≠ j) :
    lllCoefficient b i j = 0 := by sorry

/-- Independent input has positive denominators. -/
theorem lllCoefficient_denominator_pos (b : Fin n → E)
    (hb : LinearIndependent ℝ b) (j : Fin n) :
    0 < ‖InnerProductSpace.gramSchmidt ℝ b j‖ ^ 2 := by sorry

/-- LLL-reduced at `δ = 3/4` (5.1.2): independent, size-reduced, and Lovász. -/
def IsLLLReduced (b : Fin n → E) : Prop :=
  LinearIndependent ℝ b ∧
  (∀ i j, j < i → |lllCoefficient b i j| ≤ 1/2) ∧
  (∀ i j, j.val + 1 = i.val →
    (3/4 - (lllCoefficient b i j) ^ 2) * ‖InnerProductSpace.gramSchmidt ℝ b j‖ ^ 2 ≤
      ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2)

/-- A reduced family is independent. -/
theorem IsLLLReduced.linearIndependent {b : Fin n → E} (h : IsLLLReduced b) :
    LinearIndependent ℝ b := by sorry

/-- A reduced family is size-reduced. -/
theorem IsLLLReduced.size {b : Fin n → E} (h : IsLLLReduced b)
    (i j : Fin n) (hj : j < i) : |lllCoefficient b i j| ≤ 1/2 := by sorry

/-- A reduced family satisfies the Lovász condition. -/
theorem IsLLLReduced.lovasz {b : Fin n → E} (h : IsLLLReduced b)
    (i j : Fin n) (hj : j.val + 1 = i.val) :
    (3/4 - (lllCoefficient b i j) ^ 2) * ‖InnerProductSpace.gramSchmidt ℝ b j‖ ^ 2 ≤
      ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2 := by sorry

/-- **The LLL approximation factor** (5.1.4): `‖b₀‖² ≤ 2^{n-1} ‖x‖²` for nonzero `x` in the
integer span. -/
theorem lll_short_vector_factor (b : Fin n → E) (h : IsLLLReduced b) (hn : 0 < n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x ≠ 0) :
    ‖b ⟨0, hn⟩‖ ^ 2 ≤ (2 : ℝ) ^ (n - 1) * ‖x‖ ^ 2 := by sorry

/-- An integral change-of-basis certificate `c_i = Σ_j U_{ji} b_j` with `UV = VU = 1` (5.2.1). -/
structure UnimodularBasisCertificate (b c : Fin n → E) where
  matrix : Matrix (Fin n) (Fin n) ℤ
  inverse : Matrix (Fin n) (Fin n) ℤ
  rightInverse : matrix * inverse = 1
  leftInverse : inverse * matrix = 1
  coordinates : ∀ i, c i = ∑ j, matrix j i • b j

/-- Supply the integral matrices and output coordinates. -/
def UnimodularBasisCertificate.ofMatrices (b c : Fin n → E)
    (U V : Matrix (Fin n) (Fin n) ℤ) (hU : U * V = 1) (hV : V * U = 1)
    (h : ∀ i, c i = ∑ j, U j i • b j) : UnimodularBasisCertificate b c :=
  ⟨U, V, hU, hV, h⟩

/-- A certificate preserves the integer span. -/
theorem UnimodularBasisCertificate.span_eq {b c : Fin n → E}
    (h : UnimodularBasisCertificate b c) :
    Submodule.span ℤ (Set.range b) = Submodule.span ℤ (Set.range c) := by sorry

/-- A certificate has determinant `±1`. -/
theorem UnimodularBasisCertificate.det_unit {b c : Fin n → E}
    (h : UnimodularBasisCertificate b c) : h.matrix.det = 1 ∨ h.matrix.det = -1 := by sorry

/-- Compose certificates: the coordinate matrices multiply in the order `U U'`. -/
def UnimodularBasisCertificate.trans {b c d : Fin n → E}
    (h : UnimodularBasisCertificate b c) (k : UnimodularBasisCertificate c d) :
    UnimodularBasisCertificate b d where
  matrix := h.matrix * k.matrix
  inverse := k.inverse * h.inverse
  rightInverse := by sorry
  leftInverse := by sorry
  coordinates := by sorry

/-- A reduced output with a certificate against the input (5.4). -/
structure LLLReductionResult (b : Fin n → E) where
  output : Fin n → E
  certificate : UnimodularBasisCertificate b output
  reduced : IsLLLReduced output

/-- **LLL reduction exists** (5.4.1): an independent family with integral Gram matrix has a
certified LLL-reduced basis of its integer span. The README's `exactLLL` computes one. -/
theorem exists_lllReductionResult (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    Nonempty (LLLReductionResult b) := by sorry

/-- **Verification** (5.4.2): the first output vector is within `2^{(n-1)/2}` of every nonzero
vector of the input lattice. -/
theorem LLLReductionResult.shortVector {b : Fin n → E} (r : LLLReductionResult b) (hn : 0 < n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x ≠ 0) :
    ‖r.output ⟨0, hn⟩‖ ^ 2 ≤ (2 : ℝ) ^ (n - 1) * ‖x‖ ^ 2 := by sorry

end LLL

section IntegerPotential
variable {n : ℕ}

/-- The LLL potential `∏_k det Gram(b_0, …, b_{k-1})` of an integer basis matrix (5.3.1). -/
def lllIntegerPotential (A : Matrix (Fin n) (Fin n) ℤ) : ℤ :=
  ∏ k ∈ Finset.range n,
    Matrix.det (fun i j : {i : Fin n // i.val < k} => (A.transpose * A) i j)

/-- The potential of a nonsingular integer basis is positive. -/
theorem lllIntegerPotential_pos (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0) :
    0 < lllIntegerPotential A := by sorry

/-- Size reduction by an earlier column preserves the potential. -/
theorem lllIntegerPotential_sizeReduce (A : Matrix (Fin n) (Fin n) ℤ)
    (i j : Fin n) (hji : j < i) (a : ℤ) :
    lllIntegerPotential (fun r c => if c = i then A r c - a * A r j else A r c) =
      lllIntegerPotential A := by sorry

/-- A strict Lovász failure makes the adjacent swap decrease the potential below `3/4` of its
value, which proves termination. -/
theorem lllIntegerPotential_swap (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0)
    (i j : Fin n) (hij : i.val + 1 = j.val)
    (hfail : (3/4 - (lllCoefficient
      (fun c : Fin n => (WithLp.toLp 2 (fun r : Fin n => (A r c : ℝ)))) j i) ^ 2) *
      ‖InnerProductSpace.gramSchmidt ℝ
        (fun c : Fin n => (WithLp.toLp 2 (fun r : Fin n => (A r c : ℝ)))) i‖ ^ 2 >
      ‖InnerProductSpace.gramSchmidt ℝ
        (fun c : Fin n => (WithLp.toLp 2 (fun r : Fin n => (A r c : ℝ)))) j‖ ^ 2) :
    (4 : ℤ) * lllIntegerPotential (fun r c => A r (Equiv.swap i j c)) <
      3 * lllIntegerPotential A := by sorry

-- The potential of `diag(2, 1)` is `4`, and the empty potential is `1`.
example : lllIntegerPotential (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) = 4 := by sorry
example : lllIntegerPotential (1 : Matrix (Fin 0) (Fin 0) ℤ) = 1 := by sorry

end IntegerPotential

section LLLChecks

-- `μ₁₀ = 1/2` for `((1, 0), (1/2, 1))`.
example : lllCoefficient
    (![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![1/2, 1]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) 1 0 = 1/2 := by sorry

-- The standard basis is reduced; `((2, 0), (0, 1))` fails the Lovász condition.
example : IsLLLReduced
    (![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![0, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) := by
  sorry
example : ¬ IsLLLReduced
    (![WithLp.toLp 2 ![2, 0], WithLp.toLp 2 ![0, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) := by
  sorry

-- Negative control: a dependent family is never reduced.
example : ¬ IsLLLReduced
    (![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![2, 0]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) := by
  sorry

-- Negative control: `1 ↦ 2` has no integral inverse certificate.
example : ¬ Nonempty (UnimodularBasisCertificate
    (![(1 : ℝ)] : Fin 1 → ℝ) (![(2 : ℝ)] : Fin 1 → ℝ)) := by sorry

end LLLChecks

/-! ## Layer 6: Hermitian K-theory of exact categories -/

section C2NormMaps
variable {A : Type*} [AddCommGroup A]

/-- Local restatement of ComplexTori §4, to be replaced by the import once that roadmap is merged.
Local endomorphism spelling `1 + σ` required by the C₂ Tate-complex consumer; under the involution
hypothesis it is Milestone 4's period-two `cyclicNormHom`. ComplexTori is an open TauCetiRoadmap
pull request by Paul-Lez. -/
def c2Norm (σ : A →+ A) : A →+ A := AddMonoidHom.id A + σ

/-- Local restatement of ComplexTori §4, to be replaced by the import once that roadmap is merged.
Local endomorphism spelling `1 - σ` required by the C₂ Tate-complex consumer; under the involution
hypothesis it is Milestone 4's `oneSubPow` at exponent one. ComplexTori is an open TauCetiRoadmap
pull request by Paul-Lez. -/
def c2Difference (σ : A →+ A) : A →+ A := AddMonoidHom.id A - σ

end C2NormMaps

section CategoryDuality
open CategoryTheory Opposite
universe u v
variable (C : Type u) [Category.{v} C]

/-- A strong duality: a contravariant endofunctor with a double-dual isomorphism satisfying Tau
Ceti's `Functor.IsInvolutiveDual` (6.2). -/
structure StrongCategoryDuality where
  dual : Cᵒᵖ ⥤ C
  biddual : 𝟭 C ≅ dual.rightOp ⋙ dual
  coherence : dual.IsInvolutiveDual biddual

variable {C}

/-- A symmetric space `(X, φ)`: a pairing isomorphism `X ≅ DX` with `D(φ) η_X = φ` (6.2.2). -/
structure SymmetricSpace (D : StrongCategoryDuality C) where
  carrier : C
  pairing : carrier ≅ D.dual.obj (op carrier)
  symmetric : D.biddual.hom.app carrier ≫ D.dual.map pairing.hom.op = pairing.hom

/-- A morphism `f` preserves the forms when `φ_X = f φ_Y D(f)`. -/
def SymmetricSpace.preserves {D : StrongCategoryDuality C}
    (X Y : SymmetricSpace D) (f : X.carrier ⟶ Y.carrier) : Prop :=
  X.pairing.hom = f ≫ Y.pairing.hom ≫ D.dual.map f.op

/-- The identity preserves every form. -/
theorem SymmetricSpace.preserves_id {D : StrongCategoryDuality C} (X : SymmetricSpace D) :
    X.preserves X (𝟙 X.carrier) := by sorry

/-- Form-preserving maps compose. -/
theorem SymmetricSpace.preserves_comp {D : StrongCategoryDuality C}
    (X Y Z : SymmetricSpace D) (f : X.carrier ⟶ Y.carrier)
    (g : Y.carrier ⟶ Z.carrier) (hf : X.preserves Y f) (hg : Y.preserves Z g) :
    X.preserves Z (f ≫ g) := by sorry

-- The discrete one-object category carries a strong duality.
example : Nonempty (StrongCategoryDuality (Discrete PUnit)) := by sorry

-- The pairing of a symmetric space is invertible: a separating but non-perfect form such as
-- `2xy` on `ℤ` is not a symmetric space.
example {D : StrongCategoryDuality C} (X : SymmetricSpace D) : IsIso X.pairing.hom := by sorry

end CategoryDuality

section NativeExactDuality
open CategoryTheory CategoryTheory.Limits Opposite
universe u v w
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]

/-- An exact duality (6.2.1): a strong duality whose functor is additive and conflation-exact from
the opposite exact structure. -/
structure ExactCategoryDuality (E : TauCeti.ExactStructure C) extends StrongCategoryDuality C where
  additive : dual.Additive
  exact : @TauCeti.ExactStructure.IsConflationExact _ _ _ _ _ _ _ _ _ _ E.op E dual additive

attribute [instance] ExactCategoryDuality.additive

namespace ExactCategoryDuality
variable {E : TauCeti.ExactStructure C}

/-- Bundle an additive conflation-exact functor with a coherent double-dual isomorphism. -/
def ofExactFunctor (F : Cᵒᵖ ⥤ C) (eta : 𝟭 C ≅ F.rightOp ⋙ F) (hc : F.IsInvolutiveDual eta)
    [hF : F.Additive] (hex : TauCeti.ExactStructure.IsConflationExact E.op E F) :
    ExactCategoryDuality E where
  dual := F
  biddual := eta
  coherence := hc
  additive := hF
  exact := hex

/-- The duality reverses conflations. -/
theorem map_conflation (D : ExactCategoryDuality E) (S : ShortComplex Cᵒᵖ)
    (hS : E.op.Conflation S) : E.Conflation (S.map D.dual) := by sorry

/-- The sign-twisted duality, with double dual `-η`; the functor is unchanged. -/
def sign (D : ExactCategoryDuality E) : ExactCategoryDuality E where
  dual := D.dual
  biddual := { hom := -D.biddual.hom, inv := -D.biddual.inv,
               hom_inv_id := by sorry, inv_hom_id := by sorry }
  coherence := by sorry
  additive := D.additive
  exact := D.exact

/-- The sign twist negates the double-dual transformation. -/
theorem sign_biddual (D : ExactCategoryDuality E) (X : C) :
    D.sign.biddual.hom.app X = -D.biddual.hom.app X := by sorry

/-- Twisting twice recovers the duality. -/
theorem sign_sign (D : ExactCategoryDuality E) : D.sign.sign = D := by sorry

end ExactCategoryDuality

variable {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)

/-- An admissible Lagrangian `L ↣ X ↠ DL` (6.2.6). -/
structure ExactLagrangian (X : SymmetricSpace D.toStrongCategoryDuality) where
  carrier : C
  inclusion : carrier ⟶ X.carrier
  zero : inclusion ≫ X.pairing.hom ≫ D.dual.map inclusion.op = 0
  conflation : E.Conflation
    (ShortComplex.mk inclusion (X.pairing.hom ≫ D.dual.map inclusion.op) zero)

namespace ExactLagrangian
variable {D}

/-- Bundle a Lagrangian from its conflation. -/
def ofConflation (X : SymmetricSpace D.toStrongCategoryDuality) (L : C)
    (i : L ⟶ X.carrier) (hz : i ≫ X.pairing.hom ≫ D.dual.map i.op = 0)
    (hc : E.Conflation (ShortComplex.mk i (X.pairing.hom ≫ D.dual.map i.op) hz)) :
    ExactLagrangian D X := ⟨L, i, hz, hc⟩

/-- A Lagrangian inclusion is an inflation. -/
theorem isInflation {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : E.IsInflation L.inclusion := by sorry

end ExactLagrangian

/-- A form-preserving isomorphism of symmetric spaces (6.2.3). -/
structure SymmetricIsometry (X Y : SymmetricSpace D.toStrongCategoryDuality) where
  iso : X.carrier ≅ Y.carrier
  preserves : X.preserves Y iso.hom

/-- Isometry of symmetric spaces. -/
def symmetricIsometrySetoid : Setoid (SymmetricSpace D.toStrongCategoryDuality) where
  r X Y := Nonempty (SymmetricIsometry D X Y)
  iseqv := by sorry

/-- Isometry classes of symmetric spaces. -/
abbrev SymmetricIsometryClass := Quotient (symmetricIsometrySetoid D)

/-- The isometry class of a symmetric space. -/
def symmetricClass (X : SymmetricSpace D.toStrongCategoryDuality) : SymmetricIsometryClass D :=
  Quotient.mk _ X

-- The duality reverses conflations; the sign twist negates `η` and is an involution.
example (X : C) : D.sign.biddual.hom.app X = -D.biddual.hom.app X := by sorry
example : D.sign.sign = D := by sorry

end NativeExactDuality

section IsotropicSubobjects
open CategoryTheory CategoryTheory.Limits Opposite
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)

/-- An admissible isotropic subobject `L ↣ L^⊥ ↣ X` with both conflations retained (6.3.1). -/
structure ExactIsotropicSubobject (X : SymmetricSpace D.toStrongCategoryDuality) where
  carrier : C
  orthogonal : C
  quotient : C
  inclusion : carrier ⟶ orthogonal
  orthogonalInclusion : orthogonal ⟶ X.carrier
  quotientMap : orthogonal ⟶ quotient
  inclusionExact : E.IsInflation (inclusion ≫ orthogonalInclusion)
  quotientZero : inclusion ≫ quotientMap = 0
  quotientExact : E.Conflation (ShortComplex.mk inclusion quotientMap quotientZero)
  orthogonalZero : orthogonalInclusion ≫ X.pairing.hom ≫
    D.dual.map (inclusion ≫ orthogonalInclusion).op = 0
  orthogonalExact : E.Conflation (ShortComplex.mk orthogonalInclusion
    (X.pairing.hom ≫ D.dual.map (inclusion ≫ orthogonalInclusion).op) orthogonalZero)

/-- The composite inclusion `L → X`. -/
def ExactIsotropicSubobject.totalInclusion {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : L.carrier ⟶ X.carrier :=
  L.inclusion ≫ L.orthogonalInclusion

/-- The composite inclusion is an inflation. -/
theorem ExactIsotropicSubobject.totalInclusion_inflation
    {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : E.IsInflation (L.totalInclusion D) := by sorry

/-- **Exact five lemma** (6.3.2): a map of conflations that is invertible on the outer terms is
invertible in the middle. -/
theorem exact_five_lemma (S T : ShortComplex C) (hS : E.Conflation S) (hT : E.Conflation T)
    (f : S ⟶ T) [IsIso f.τ₁] [IsIso f.τ₃] : IsIso f.τ₂ := by sorry

/-- A hermitian `Q`-span `X ↞ U ↣ Y` whose pairing square is bicartesian (6.5.1). -/
structure HermitianQSpan (X Y : SymmetricSpace D.toStrongCategoryDuality) where
  middle : C
  deflation : middle ⟶ X.carrier
  inflation : middle ⟶ Y.carrier
  deflationExact : E.IsDeflation deflation
  inflationExact : E.IsInflation inflation
  cartesian : IsPullback inflation deflation
    (Y.pairing.hom ≫ D.dual.map inflation.op) (X.pairing.hom ≫ D.dual.map deflation.op)
  cocartesian : IsPushout inflation deflation
    (Y.pairing.hom ≫ D.dual.map inflation.op) (X.pairing.hom ≫ D.dual.map deflation.op)

/-- Equivalence of `Q`-spans by a middle isomorphism respecting both legs. -/
def HermitianQSpan.equivalent {X Y : SymmetricSpace D.toStrongCategoryDuality}
    (a b : HermitianQSpan D X Y) : Prop :=
  ∃ e : a.middle ≅ b.middle, e.hom ≫ b.inflation = a.inflation ∧ e.hom ≫ b.deflation = a.deflation

/-- Equivalence of `Q`-spans (6.5.2). -/
def hermitianQSpanSetoid (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    Setoid (HermitianQSpan D X Y) where
  r := HermitianQSpan.equivalent D
  iseqv := by sorry

end IsotropicSubobjects

section SFiltering
open CategoryTheory CategoryTheory.Limits Opposite
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]

/-- Schlichting's four s-filtering conditions on a fully exact, extension-closed subcategory
(6.6a); the last two witness kernels and cokernels inside the subcategory. -/
class SFiltering (E : TauCeti.ExactStructure C) (A : C → Prop) : Prop where
  zero_mem : A (0 : C)
  iso_closed : ∀ {X Y : C}, (X ≅ Y) → A X → A Y
  extension_closed : ∀ (S : ShortComplex C), E.Conflation S → A S.X₁ → A S.X₃ → A S.X₂
  left_factor : ∀ {X Y : C}, A X → (f : X ⟶ Y) →
    ∃ (B : C) (_ : A B) (i : B ⟶ Y) (_ : E.IsInflation i) (g : X ⟶ B), g ≫ i = f
  right_factor : ∀ {X Y : C}, A Y → (f : X ⟶ Y) →
    ∃ (B : C) (_ : A B) (p : X ⟶ B) (_ : E.IsDeflation p) (g : B ⟶ Y), p ≫ g = f
  lift_deflation : ∀ {X Y : C}, A Y → (p : X ⟶ Y) → E.IsDeflation p →
    ∃ (B : C) (_ : A B) (i : B ⟶ X), E.IsInflation i ∧
      ∃ (K : C) (_ : A K) (k : K ⟶ B) (h : k ≫ (i ≫ p) = 0),
        E.Conflation (ShortComplex.mk k (i ≫ p) h)
  descend_inflation : ∀ {X Y : C}, A X → (i : X ⟶ Y) → E.IsInflation i →
    ∃ (B : C) (_ : A B) (p : Y ⟶ B), E.IsDeflation p ∧
      ∃ (K : C) (_ : A K) (k : B ⟶ K) (h : (i ≫ p) ≫ k = 0),
        E.Conflation (ShortComplex.mk (i ≫ p) k h)

/-- Elementary weak isomorphisms: deflations with kernel in `A` and inflations with cokernel
in `A`. -/
def sFilteringWeakGenerator (E : TauCeti.ExactStructure C) (A : C → Prop) :
    MorphismProperty C := fun X Y f =>
  (∃ (B : C) (i : B ⟶ X) (h : i ≫ f = 0), E.Conflation (ShortComplex.mk i f h) ∧ A B) ∨
  (∃ (B : C) (p : Y ⟶ B) (h : f ≫ p = 0), E.Conflation (ShortComplex.mk f p h) ∧ A B)

/-- Finite composites of elementary weak isomorphisms, identities included. -/
abbrev sFilteringWeakIsomorphisms (E : TauCeti.ExactStructure C) (A : C → Prop) :=
  (sFilteringWeakGenerator E A).multiplicativeClosure

/-- The weak isomorphisms admit a calculus of left fractions. -/
theorem sFiltering_hasLeftCalculusOfFractions (E : TauCeti.ExactStructure C) (A : C → Prop)
    [SFiltering E A] : (sFilteringWeakIsomorphisms E A).HasLeftCalculusOfFractions := by sorry

/-- The weak isomorphisms admit a calculus of right fractions. -/
theorem sFiltering_hasRightCalculusOfFractions (E : TauCeti.ExactStructure C) (A : C → Prop)
    [SFiltering E A] : (sFilteringWeakIsomorphisms E A).HasRightCalculusOfFractions := by sorry

/-- The exact quotient `E/A` as Mathlib's localization at the weak isomorphisms. -/
abbrev sFilteringQuotient (E : TauCeti.ExactStructure C) (A : C → Prop) :=
  (sFilteringWeakIsomorphisms E A).Localization

/-- The quotient functor. -/
abbrev sFilteringQuotientFunctor (E : TauCeti.ExactStructure C) (A : C → Prop) :=
  (sFilteringWeakIsomorphisms E A).Q

/-- The subcategory is stable under the duality. -/
def DualityStable (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E)
    (A : C → Prop) : Prop := ∀ X, A X ↔ A (D.dual.obj (op X))

-- The zero and whole subcategories are duality-stable; omitting a dual fails.
example (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E) :
    DualityStable E D (fun X => IsZero X) := by sorry
example (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E)
    (A : C → Prop) (X : C) (hX : A X) (hDX : ¬ A (D.dual.obj (op X))) :
    ¬ DualityStable E D A := by sorry

-- Negative control: the empty predicate omits zero.
example (E : TauCeti.ExactStructure C) : ¬ SFiltering E (fun _ => False) := by sorry

-- Elementary generators become invertible in the quotient.
example (E : TauCeti.ExactStructure C) (A : C → Prop) {X Y : C} (f : X ⟶ Y)
    (hf : sFilteringWeakGenerator E A f) :
    IsIso ((sFilteringQuotientFunctor E A).map f) := by sorry

-- Negative control: the free groups are not s-filtering in finitely generated abelian groups.
example : ¬ SFiltering (TauCeti.ExactStructure.abelian (C := FGModuleCat ℤ))
    (fun X => Module.Free ℤ X) := by sorry

end SFiltering

section Formations
open CategoryTheory CategoryTheory.Limits Opposite
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)

/-- A formation: a symmetric space with two admissible Lagrangians (6.8.1). -/
structure Formation where
  space : SymmetricSpace D.toStrongCategoryDuality
  first : ExactLagrangian D space
  second : ExactLagrangian D space

namespace Formation
variable {D}

/-- Exchange the two Lagrangians. -/
def swap (F : Formation D) : Formation D := ⟨F.space, F.second, F.first⟩

/-- The formation with equal Lagrangians. -/
def diagonal (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X) :
    Formation D := ⟨X, L, L⟩

end Formation

/-- An isometry of formations, carrying each named Lagrangian to the corresponding one. -/
structure FormationIsometry (F G : Formation D) where
  isometry : SymmetricIsometry D F.space G.space
  first : F.first.carrier ≅ G.first.carrier
  second : F.second.carrier ≅ G.second.carrier
  first_comm : first.hom ≫ G.first.inclusion = F.first.inclusion ≫ isometry.iso.hom
  second_comm : second.hom ≫ G.second.inclusion = F.second.inclusion ≫ isometry.iso.hom

/-- Isometry of formations. -/
def formationSetoid : Setoid (Formation D) where
  r F G := Nonempty (FormationIsometry D F G)
  iseqv := by sorry

/-- Formation isometry classes. -/
abbrev FormationClass := Quotient (formationSetoid D)

-- Swapping is an involution exchanging the two Lagrangians.
example (F : Formation D) : F.swap.swap = F := by sorry
example (F : Formation D) : F.swap.first = F.second := by sorry

end Formations

section ExactFormFunctors
open CategoryTheory CategoryTheory.Limits Opposite
universe u v u' v'
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {C' : Type u'} [Category.{v'} C'] [Preadditive C'] [HasZeroObject C'] [HasBinaryBiproducts C']
  {E : TauCeti.ExactStructure C} {E' : TauCeti.ExactStructure C'}
  (D : ExactCategoryDuality E) (D' : ExactCategoryDuality E')

/-- A nonsingular exact form functor, with its bidual compatibility. -/
structure ExactFormFunctor where
  functor : C ⥤ C'
  additive : functor.Additive
  exact : @TauCeti.ExactStructure.IsConflationExact _ _ _ _ _ _ _ _ _ _ E E' functor additive
  duality : D.dual ⋙ functor ≅ functor.op ⋙ D'.dual
  coherence : ∀ X : C,
    functor.map (D.biddual.hom.app X) ≫ duality.hom.app (op (D.dual.obj (op X))) ≫
      D'.dual.map (duality.inv.app (op X)).op = D'.biddual.hom.app (functor.obj X)

attribute [instance] ExactFormFunctor.additive

namespace ExactFormFunctor
variable {D D'}

/-- Transport a symmetric space along an exact form functor. -/
def mapSpace (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality) :
    SymmetricSpace D'.toStrongCategoryDuality where
  carrier := F.functor.obj X.carrier
  pairing := F.functor.mapIso X.pairing ≪≫ F.duality.app (op X.carrier)
  symmetric := by sorry

/-- The transported pairing is the image pairing followed by the duality comparison. -/
theorem mapSpace_pairing_hom (F : ExactFormFunctor D D')
    (X : SymmetricSpace D.toStrongCategoryDuality) :
    (F.mapSpace X).pairing.hom =
      F.functor.map X.pairing.hom ≫ F.duality.hom.app (op X.carrier) := rfl

end ExactFormFunctor
end ExactFormFunctors

section SplitExactControls
open CategoryTheory CategoryTheory.Limits

-- Finite torsion is not reflexive for `ℤ`-linear duality.
example : Subsingleton (Module.Dual ℤ (ZMod 2)) := by sorry

-- Multiplication by two is injective but not an admissible split inflation.
example : ¬ (TauCeti.ExactStructure.split (ModuleCat ℤ)).IsInflation
    (ModuleCat.ofHom (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ))) := by sorry

end SplitExactControls

section DGDualitySigns

/-- The Koszul sign `(-1)^{ij}` of opposite composition. -/
def dgOppositeSign (i j : ℤ) : ℤ := (-1) ^ (i * j).natAbs

/-- The dual differential sign `(-1)^{i+1}` in degree `i`. -/
def dgDualDifferentialSign (i : ℤ) : ℤ := (-1) ^ (i + 1).natAbs

/-- The bidual sign `(-1)^i` in degree `i`. -/
def dgBidualSign (i : ℤ) : ℤ := (-1) ^ i.natAbs

/-- The dualization sign `(-1)^{i(j-i)}` on a component `X^i → Y^j`. -/
def dgDualMorphismSign (i j : ℤ) : ℤ := (-1) ^ (i * (j - i)).natAbs

/-- The opposite-composition sign is symmetric. -/
theorem dgOppositeSign_comm (i j : ℤ) : dgOppositeSign i j = dgOppositeSign j i := by sorry

/-- The bidual sign squares to one. -/
theorem dgBidualSign_sq (i : ℤ) : dgBidualSign i * dgBidualSign i = 1 := by sorry

/-- The dual differential sign alternates. -/
theorem dgDualDifferentialSign_next (i : ℤ) :
    dgDualDifferentialSign (i + 1) = -dgDualDifferentialSign i := by sorry

/-- Degree-zero morphisms have no dualization sign. -/
theorem dgDualMorphismSign_degree_zero (i : ℤ) : dgDualMorphismSign i i = 1 := by sorry

-- The differential changes sign in degree zero, the bidual does not.
example : dgDualDifferentialSign 0 = -1 ∧ dgBidualSign 0 = 1 := by decide
example : dgOppositeSign 1 1 = -1 ∧ dgOppositeSign 1 2 = 1 := by decide
example : dgDualMorphismSign 1 2 = -1 ∧ dgDualMorphismSign (-1) 1 = 1 := by decide

end DGDualitySigns

section SurgeryMatrixChecks

-- Two invertible singleton blocks with a degenerate combination: `[[1,1],[1,1]]` has kernel
-- vector `(1, -1)`.
example : Matrix.det (!![1, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ) = 0 := by norm_num
example : (!![1, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ).mulVec ![1, -1] = 0 := by
  ext i; fin_cases i <;> norm_num [Matrix.mulVec, dotProduct, Fin.sum_univ_two]

end SurgeryMatrixChecks

section ResidueDualityCoefficient
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- Restriction `Hom_R(R, M) → Hom_R(p, M)`. -/
def residueRestriction (p : Ideal R) : (R →ₗ[R] M) →ₗ[R] (p →ₗ[R] M) where
  toFun f := f.comp p.subtype
  map_add' := by intro f g; ext x; rfl
  map_smul' := by intro a f; ext x; rfl

/-- The residue coefficient `coker(Hom_R(R, M) → Hom_R(p, M))` (6.8a). -/
abbrev residueDualizingModule (p : Ideal R) (M : Type*) [AddCommGroup M] [Module R M] :=
  (p →ₗ[R] M) ⧸ LinearMap.range (residueRestriction (M := M) p)

/-- Restriction evaluates on ideal elements. -/
theorem residueRestriction_apply (p : Ideal R) (f : R →ₗ[R] M) (x : p) :
    residueRestriction p f x = f x := rfl

/-- The unit ideal has zero residue coefficient. -/
theorem residueDualizingModule_top :
    Subsingleton (residueDualizingModule (⊤ : Ideal R) M) := by sorry

-- `Hom(2ℤ, ℤ)/res Hom(ℤ, ℤ)` has two elements; at `3` it has three.
example : Nat.card (residueDualizingModule (Ideal.span ({2} : Set ℤ)) ℤ) = 2 := by sorry
example : Nat.card (residueDualizingModule (Ideal.span ({3} : Set ℤ)) ℤ) = 3 := by sorry

end ResidueDualityCoefficient

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

/-!
## Targets on these carriers stated only in `README.md`

The following README targets extend declarations of this file but need carriers that are not
available at the pins, or are steps of a proof rather than milestones; their signatures and
sources are in the README.

* Layer 2: `IntegralQuadraticLattice.quadraticMap`, `IntegralQuadraticLattice.localize` with
  `IntegralQuadraticLattice.localize_mem_iff` and `IntegralQuadraticLattice.localize_map`,
  `IntegralHermitianLattice.map`, `HermitianLatticeInvariants.ofDualQuotient`,
  `signedHermitianAdjoint`, `signedHermitianTwist`, `signedHermitianTransfer`.
* Layer 3: `maximalMassLocalType_basisChange`, `hermitianLocalDensity`,
  `normalizedSiegelPolynomial`.
* Layer 4: `diagonal_span_index` and `diagonal_lattice_avoidance` in Henk's proof of
  `lattice_count_lt_successive_minima`; `quotientKoopman_invariants` on a homogeneous quotient;
  `ternaryHarmonicTheta_cuspidal`, which needs half-integral weight cusp forms;
  `contracting_subordinate_entropy`, `leaf_entropy_bound_and_equality` and
  `contracting_leaf_support_reduction` on the homogeneous leaf and Haar-modulus carriers;
  `singularWedgeUniqueRepresentative`, `polynomialSingularAvoidance`,
  `unipotentSingularOrbitDetection` and `oneOrbitAverageIdentification` on the homogeneous
  wedge and singular-stratum carriers.
* Layer 5: the algorithm `exactLLL`.
* Layer 6: `hyperbolicSpace`, `orthogonalSum`, `negativeSpace`, `isotropicReduction`, `ExactGW0`,
  `ExactW0`, `HermitianQ`, `grothendieckWittSpace` and `hermitianCone`.
-/

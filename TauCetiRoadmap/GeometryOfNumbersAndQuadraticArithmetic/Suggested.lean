import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.RepresentationNumber
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Scaling
import TauCeti.LinearAlgebra.IntegralLattice.Orthogonal.Sum
import TauCeti.NumberTheory.HurwitzClassNumber
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import TauCeti.CategoryTheory.InvolutiveDual
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.CategoryTheory.Exact.Opposite
import TauCeti.CategoryTheory.DG.Basic
import TauCeti.CategoryTheory.DG.Functor
import TauCeti.CategoryTheory.DG.Opposite.Basic

/-!
# Geometry of numbers and quadratic arithmetic: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the definitions and milestones that can
be stated against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge on
names and signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry`
marks goals, not results. Every target whose carrier is not available at the pins (the integral
quadratic map of a lattice, local densities, genera, the Q-constructions, the hermitian cone,
Grothendieck–Witt groups and spaces, stable and Poincaré categories, the dynamical incidence
carriers, and the comparisons with declarations of the ThetaSeries, LFunctions and PointProcesses
roadmaps) is stated in the README with its intended
signature and does not appear here. The final README roadmap-for-a-roadmap on motivic/étale
comparisons and higher integer GW tables is motivation outside the targets of this file.

Design choices made explicit here:

* lattices are Mathlib's `IsZLattice` submodules and covolumes are `ZLattice.covolume`;
* successive minima are real numbers indexed by `Fin (finrank ℝ E)` on a `ConvexBody` with `0` in
  its interior, obtained by coercion and reindexing from `MeasureTheory.successiveMin`;
  the latter uses nonnegative dilation rank thresholds for arbitrary sets and natural indices;
* integral quadratic lattices over a Dedekind domain are `Submodule.IsLattice` submodules with a
  quadratic form whose values on the lattice are integral, and no stored basis;
* hermitian pairings are conjugate-linear in the first argument; primitive matrices have unit
  maximal-minor ideal, equivalently a matrix left inverse; a single unit minor is the local-ring
  specialization;
* the theta series of a positive definite `ℤ`-lattice is stated on Tau Ceti's `IntegralLattice`
  carrier as the specialisation of ThetaSeries' theta series, and its coefficients are Tau Ceti's
  `representationNumber`; its exponent `π i τ B(x,x)` equals `2π i τ q(x)` for
  `q(x)=B(x,x)/2`, which can be half-integral on an odd bilinear lattice;
* the three-square formula is stated against Tau Ceti's `hurwitzClassNumber`;
* unitarity of a representation is Tau Ceti's `ContRepresentation.IsUnitary`, with strong
  continuity added as a separate predicate;
* LLL-reduced bases use `δ = 3/4` and `η = 1/2`, with their short-vector approximation bound;
* DG duality acts on Tau Ceti's native cochain-complex enrichment, with its signed opposite and
  Mathlib factor order;
* the stable, Ind and Verdier carriers in the README are supplied by BordismFormalGroups
  F6.5; EnhancedDerivedSheaves supplies the stable calculus, compact/idempotent comparisons,
  spectrum and Eilenberg–MacLane carriers. This roadmap provides their K-theory and
  coefficient/duality adapters in the common spectrum category. GeneralizedCohomology supplies
  Γ-space group completion and derived prime completion; BordismFormalGroups supplies the coherent
  finite-group norm/Tate package. The README’s local names specialize these through
  EnhancedDerivedSheaves’ concrete-spectrum and coherent-tower comparisons. The mod-two
  characterization of `twoAdicEquivalence` is a consequence proved here from the supplied tower;
* `ringKTheoryModels` specializes the native finite-projective category to right modules,
  encoded over the opposite ring. AlgebraicKTheory supplies its matrix realization, stable
  GL/elementary groups, matrix K₁, Steinberg K₂ and Milnor boundary before the higher comparisons.
  This roadmap owns the common Q/S, Γ-space and Bass/Schlichting spectrum comparisons and
  `plusConstructionComparison`, including degree zero, one and two, ring maps, stabilization,
  Morita, opposite rings and boundary compatibility.
* `DerivedCoefficientLine` retains arbitrary action-swapping involutions with square one;
  signed integral and Dedekind-domain specializations choose the signs. Multiplication by
  three on `ZMod 8` supplies a coefficient involution distinct from both signs.
* the finite-field K branch consumes TopologicalKTheory's complex classifier and Bott theorem,
  with its CW/Milnor extension and BU-level Adams maps specified in the README;
* exact categories are Tau Ceti's `ExactStructure`, and a strong duality bundles Tau Ceti's
  `Functor.IsInvolutiveDual` with exactness of the duality functor.
-/

noncomputable section
open scoped BigOperators ZeroObject Pointwise Topology NNReal
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

end ElementaryBounds

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

namespace TauCeti.IntegralLattice
variable {V : Type*} [AddCommGroup V] [Module ℚ V]

/-- The natural squared-norm threshold for an independent family of size `i+1` (1.2.13a). -/
def successiveMinimum (L : TauCeti.IntegralLattice V) (i : Fin (finrank ℤ L)) : ℕ :=
  sInf {N : ℕ | ∃ v : Fin (i.val + 1) → L, LinearIndependent ℤ v ∧
    ∀ j, L.integralNorm (v j) ≤ (N : ℤ)}

/-- A natural squared-norm threshold is at most `N` exactly when an independent family meets
that bound, for any integral lattice (1.2.13a). -/
theorem successiveMinimum_le_iff (L : TauCeti.IntegralLattice V)
    (i : Fin (finrank ℤ L)) (N : ℕ) :
    L.successiveMinimum i ≤ N ↔ ∃ v : Fin (i.val + 1) → L, LinearIndependent ℤ v ∧
      ∀ j, L.integralNorm (v j) ≤ (N : ℤ) := by sorry

/-- One independent family simultaneously attains all semidefinite squared minima (1.2.13a). -/
theorem IsPosSemidef.exists_linearIndependent_integralNorm_eq_successiveMinimum
    {L : TauCeti.IntegralLattice V} (hL : L.IsPosSemidef) :
    ∃ v : Fin (finrank ℤ L) → L, LinearIndependent ℤ v ∧
      ∀ i, L.integralNorm (v i) = (L.successiveMinimum i : ℤ) := by sorry

end TauCeti.IntegralLattice

/-- The nonnegative dilation threshold where the real span has dimension greater than `i`
for an arbitrary set and natural index (1.2.1). -/
noncomputable def _root_.MeasureTheory.successiveMin {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (L : Submodule ℤ E) (s : Set E) (i : ℕ) : ℝ≥0 :=
  sInf {r : ℝ≥0 | i < Set.finrank ℝ (r • s ∩ (L : Set E))}

namespace TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

section SuccessiveMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The real-valued, zero-based `Fin` adapter of the foundational successive minima (1.2.1).
Its geometric laws need `L` discrete and full and `0 ∈ interior K`. -/
def successiveMin (L : Submodule ℤ E) (K : ConvexBody E) (i : Fin (finrank ℝ E)) : ℝ :=
  (MeasureTheory.successiveMin L (K : Set E) i.val : ℝ)

/-- In finite dimension the rank-threshold adapter equals the positive-dilation infimum of
independent families, without geometric hypotheses on the lattice or body (1.2.1). -/
theorem successiveMin_def [FiniteDimensional ℝ E]
    (L : Submodule ℤ E) (K : ConvexBody E) (i : Fin (finrank ℝ E)) :
    successiveMin L K i = sInf {t : ℝ | 0 < t ∧ ∃ v : Fin (i.val + 1) → E,
      (∀ j, v j ∈ (t • (K : Set E)) ∩ (L : Set E)) ∧ LinearIndependent ℝ v} := by sorry

/-- The zero-based natural-index extension of the successive minima, with value zero at and
beyond the ambient dimension (1.2.1a). -/
def successiveMinNat (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ) : ℝ :=
  if hi : i < finrank ℝ E then successiveMin L K ⟨i, hi⟩ else 0

/-- Below the ambient dimension the natural-index extension agrees with the `Fin`-indexed
minimum (1.2.1a). -/
theorem successiveMinNat_of_lt (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ)
    (hi : i < finrank ℝ E) :
    successiveMinNat L K i = successiveMin L K ⟨i, hi⟩ := by
  simp [successiveMinNat, hi]

/-- At and beyond the ambient dimension the natural-index extension is zero (1.2.1a). -/
theorem successiveMinNat_of_le (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ)
    (hi : finrank ℝ E ≤ i) : successiveMinNat L K i = 0 := by
  simp [successiveMinNat, Nat.not_lt.mpr hi]

-- A dimension known by a theorem suffices to interpret a natural index.
example (L : Submodule ℤ E) (K : ConvexBody E) (n i : ℕ)
    (hdim : finrank ℝ E = n) (hi : i < n) :
    successiveMinNat L K i = successiveMin L K ⟨i, by simpa [hdim] using hi⟩ := by
  exact successiveMinNat_of_lt L K i _

-- The first out-of-range index is already zero, including in dimension zero.
example (L : Submodule ℤ E) (K : ConvexBody E) :
    successiveMinNat L K (finrank ℝ E) = 0 :=
  successiveMinNat_of_le L K _ le_rfl

variable [FiniteDimensional ℝ E]

/-- The natural-index adapter equals the foundational minimum, including the zero values at
and beyond the ambient dimension (1.2.1a). -/
theorem successiveMinNat_eq (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ) :
    successiveMinNat L K i = (MeasureTheory.successiveMin L (K : Set E) i : ℝ) := by sorry

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
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- **Minkowski's second theorem, lower half** (1.3.4):
`(2^d/d!) covol L ≤ (∏ λ_i) μ(K)` for any additive Haar measure and a symmetric convex body
with `0` in its interior in a finite-dimensional real normed space, including dimension zero. -/
theorem minkowski_second_lower (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (μ : Measure E)
    [Measure.IsAddHaarMeasure μ] :
    ((2 : ℝ) ^ (finrank ℝ E) / (Nat.factorial (finrank ℝ E) : ℝ)) * ZLattice.covolume L μ ≤
      (∏ i : Fin (finrank ℝ E), successiveMin L K i) * μ.real (K : Set E) := by sorry

/-- **Minkowski's second theorem, upper half** (1.5.21, Henk's proof):
`(∏ λ_i) μ(K) ≤ 2^d covol L` for any additive Haar measure on a finite-dimensional real
normed space and a symmetric convex body with `0` in its interior, including dimension zero. -/
theorem minkowski_second_upper
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (μ : Measure E)
    [Measure.IsAddHaarMeasure μ] :
    (∏ i : Fin (finrank ℝ E), successiveMin L K i) * μ.real (K : Set E) ≤
      2 ^ finrank ℝ E * ZLattice.covolume L μ := by sorry

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

end SignedFieldForms

/-! ## Layer 3: Representation densities, mass and theta coefficients -/

section PrimitiveHermitianMatrices
variable {A : Type*} [CommRing A] {m n : ℕ}

/-- The ideal generated by all maximal minors of an `m × n` matrix (§3.2). -/
def hermitianMaximalMinorIdeal (X : Matrix (Fin m) (Fin n) A) : Ideal A :=
  Ideal.span (Set.range fun i : Fin n → Fin m => (X.submatrix i id).det)

/-- Unit maximal-minor ideal is equivalent to a matrix left inverse. -/
theorem hermitianMaximalMinorIdeal_eq_top_iff_split (X : Matrix (Fin m) (Fin n) A) :
    hermitianMaximalMinorIdeal X = ⊤ ↔
      ∃ Y : Matrix (Fin n) (Fin m) A, Y * X = 1 := by sorry

/-- Over a local ring, primitivity is equivalent to one maximal minor being a unit. -/
theorem hermitianMaximalMinorIdeal_eq_top_iff_unit_minor [IsLocalRing A]
    (X : Matrix (Fin m) (Fin n) A) :
    hermitianMaximalMinorIdeal X = ⊤ ↔
      ∃ i : Fin n → Fin m, IsUnit (X.submatrix i id).det := by sorry

/-- Invertible source and target basis changes preserve the maximal-minor ideal. -/
theorem hermitianMaximalMinorIdeal_basisChange (X : Matrix (Fin m) (Fin n) A)
    (U : Matrix (Fin m) (Fin m) A) (V : Matrix (Fin n) (Fin n) A)
    (hU : IsUnit U.det) (hV : IsUnit V.det) :
    hermitianMaximalMinorIdeal (U * X * V) = hermitianMaximalMinorIdeal X := by sorry

/-- Maximal-minor ideals commute with extension of scalars along any ring map. -/
theorem hermitianMaximalMinorIdeal_map {A' : Type*} [CommRing A'] (f : A →+* A')
    (X : Matrix (Fin m) (Fin n) A) :
    Ideal.map f (hermitianMaximalMinorIdeal X) =
      hermitianMaximalMinorIdeal (X.map f) := by sorry

end PrimitiveHermitianMatrices

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

end NumberRingTrace

section BoundedIntegralEndomorphisms
variable {M : Type*} [AddCommGroup M] [Module ℤ M]

/-- A positive definite integral form has finitely many endomorphisms with `q(Tx) ≤ C² q(x)`. -/
theorem finite_bounded_integral_endomorphisms [Module.Free ℤ M] [Module.Finite ℤ M]
    (q : QuadraticForm ℤ M) (hq : q.PosDef) (C : ℝ) (hC : 0 ≤ C) :
    {T : M →ₗ[ℤ] M | ∀ x : M, (q (T x) : ℝ) ≤ C ^ 2 * (q x : ℝ)}.Finite := by sorry

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

-- For `x² + y² + 3z²` over `ℚ₃`, the full quotient `O₂⁻(𝔽₃)` has order `8`.
-- Both the ratio against the good quotient and its reciprocal stabilizer volume are `1`.
example : orthogonalLocalVolumeRatio 3 1 0 24 8 = 1 := by norm_num [orthogonalLocalVolumeRatio]

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

variable (K : Type*) [Field K] [NumberField K]

/-- Consumer spelling of LFunctions §0/§3's supplied Gamma expression, with zero shifts,
real and complex place multiplicities and Mathlib's factor two in `Gammaℂ`. -/
def dedekindArchimedeanFactor (s : ℂ) : ℂ :=
  Complex.Gammaℝ s ^ NumberField.InfinitePlace.nrRealPlaces K *
    Complex.Gammaℂ s ^ NumberField.InfinitePlace.nrComplexPlaces K

/-- Consumer spelling of LFunctions §0/§3's supplied Gamma/conductor expression, with
conductor `|d_K|` and exponent `s/2`. -/
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

end MassArchimedeanFactors

section IntegralTheta
variable {V : Type*} [AddCommGroup V] [Module ℚ V]

/-- The theta series `Σ_{x ∈ L} exp(π i τ B(x,x))` of an integral lattice (3.4.1): ThetaSeries'
`thetaSeries` of the real model `realModel L`, on Tau Ceti's carrier. With `q(x)=B(x,x)/2`,
the exponent is also `2π i τ q(x)`; q-values can be half-integral on an odd lattice. -/
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

end HilbertDynamics

section KoopmanActions
open scoped ENNReal
variable {G X : Type*} [Group G] [MeasurableSpace X] [MulAction G X]

/-- Inverse-element pullback gives a representation by scalar Lp isometries. -/
def scalarLpKoopman (p : ℝ≥0∞) [Fact (1 ≤ p)] (μ : Measure X)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ContRepresentation ℂ G (Lp ℂ p μ) where
  toMonoidHom := {
    toFun := fun g => (Lp.compMeasurePreservingₗᵢ ℂ
      (fun x : X => g⁻¹ • x) (hμ g⁻¹)).toContinuousLinearMap
    map_one' := by sorry
    map_mul' := by sorry }

section ScalarLp
variable (p : ℝ≥0∞) [Fact (1 ≤ p)] (μ : Measure X)
  (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)

/-- The pullback representation acts by inverse elements almost everywhere. -/
theorem scalarLpKoopman_apply_ae (g : G) (f : Lp ℂ p μ) :
    (scalarLpKoopman p μ hμ g f : X → ℂ) =ᵐ[μ] (fun x => f (g⁻¹ • x)) := by sorry

/-- Each scalar Lp pullback preserves the norm, without a finite-measure hypothesis. -/
theorem scalarLpKoopman_norm (g : G) (f : Lp ℂ p μ) :
    ‖scalarLpKoopman p μ hμ g f‖ = ‖f‖ := by sorry

/-- Pullback by the identity fixes each Lp class. -/
theorem scalarLpKoopman_one (f : Lp ℂ p μ) :
    scalarLpKoopman p μ hμ 1 f = f := by sorry

/-- Inverse-element pullback respects the order of the group product. -/
theorem scalarLpKoopman_mul (g h : G) (f : Lp ℂ p μ) :
    scalarLpKoopman p μ hμ (g * h) f =
      scalarLpKoopman p μ hμ g (scalarLpKoopman p μ hμ h f) := by sorry

/-- Pullback by the inverse element inverts each scalar Lp operator. -/
theorem scalarLpKoopman_inv (g : G) (f : Lp ℂ p μ) :
    scalarLpKoopman p μ hμ g⁻¹ (scalarLpKoopman p μ hμ g f) = f := by sorry

end ScalarLp

/-- The L² specialization of the scalar pullback representation. -/
def quotientKoopman (μ : Measure X)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ContRepresentation ℂ G (Lp ℂ 2 μ) := scalarLpKoopman 2 μ hμ

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

end FiniteMeasure

section ContinuousAction
variable [TopologicalSpace G] [IsTopologicalGroup G]
  [TopologicalSpace X] [BorelSpace X] [R1Space X] [ContinuousSMul G X]
  (μ : Measure X) [Measure.InnerRegularCompactLTTop μ] [IsLocallyFiniteMeasure μ]

/-- A continuous measure-preserving action is strongly continuous on scalar Lp for finite p. -/
theorem scalarLpKoopman_strong (p : ℝ≥0∞) [Fact (1 ≤ p)] (hp : p ≠ ∞)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ∀ f : Lp ℂ p μ, Continuous (fun g : G => scalarLpKoopman p μ hμ g f) := by sorry

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

end ConditionalLabelEntropy

section KacReturnTimes
variable {X : Type*} [MeasurableSpace X]

/-- The first positive return time, with value `∞` when the orbit never returns. -/
def positiveReturnTime (T : X → X) (A : Set X) (x : X) : ℕ∞ :=
  sInf {r : ℕ∞ | ∃ n : ℕ, 0 < n ∧ r = (n : ℕ∞) ∧ T^[n] x ∈ A}

/-- First positive return times are measurable for a measurable map and return set. -/
theorem measurable_positiveReturnTime (T : X → X) (hT : Measurable T)
    (A : Set X) (hA : MeasurableSet A) : Measurable (positiveReturnTime T A) := by sorry

/-- Kac's formula supplies almost-everywhere finite, integrable return times and their
unnormalized integral `1` on every positive-measure return set. -/
theorem kac_return_time_integral (μ : Measure X) [IsProbabilityMeasure μ]
    (T : X ≃ᵐ X) (hT : Ergodic T μ) (A : Set X) (hA : MeasurableSet A) (hpos : 0 < μ A) :
    (∀ᵐ x ∂μ.restrict A, positiveReturnTime T A x < ⊤) ∧
      Integrable (fun x => ((positiveReturnTime T A x).toNat : ℝ)) (μ.restrict A) ∧
      (∫ x in A, ((positiveReturnTime T A x).toNat : ℝ) ∂μ) = 1 := by sorry

end KacReturnTimes

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

end GoodFunctions

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

/-- A rank-one exterior covolume is the sup norm of the transformed integral generator. -/
theorem primitiveExteriorCovolume_rank_one
    (h : Matrix (Fin d) (Fin d) ℝ) (Δ : Submodule ℤ (Fin d → ℝ))
    (b : Basis (Fin 1) ℤ Δ) :
    primitiveExteriorCovolume h Δ b = ‖h.mulVec (b 0 : Fin d → ℝ)‖ := by sorry

end PrimitiveExteriorCovolumes

section QuantitativeNondivergence

/-- An integral subgroup of `ℤ^d ⊂ ℝ^d` saturated in `ℤ^d`. -/
def integralPrimitiveSubgroup {d : ℕ} (Δ : Submodule ℤ (Fin d → ℝ)) : Prop :=
  (∀ x ∈ Δ, ∃ z : Fin d → ℤ, (fun i => (z i : ℝ)) = x) ∧
  ∀ (z : Fin d → ℤ) (a : ℤ), a ≠ 0 →
    (fun i => ((a * z i : ℤ) : ℝ)) ∈ Δ → (fun i => (z i : ℝ)) ∈ Δ

/-- An integer vector lies in the real span of a primitive integral subgroup exactly when
it lies in that subgroup. -/
theorem integralPrimitiveSubgroup.mem_realSpan_iff {d : ℕ}
    (Δ : Submodule ℤ (Fin d → ℝ)) (hΔ : integralPrimitiveSubgroup Δ) (v : Fin d → ℤ) :
    (fun i => (v i : ℝ)) ∈ Submodule.span ℝ (Δ : Set (Fin d → ℝ)) ↔
      (fun i => (v i : ℝ)) ∈ Δ := by sorry

/-- The integer-coordinate intersection of the real span of `Δ` and `v`; for integral `Δ`
this is the saturation of `Δ + ℤv` inside the integer-coordinate lattice. -/
def primitiveSpanExtension {d : ℕ} (Δ : Submodule ℤ (Fin d → ℝ))
    (v : Fin d → ℤ) : Submodule ℤ (Fin d → ℝ) :=
  (Submodule.span ℝ ((Δ : Set (Fin d → ℝ)) ∪ {fun i => (v i : ℝ)})).restrictScalars ℤ ⊓
    Submodule.span ℤ (Set.range fun z : Fin d → ℤ => (fun i => (z i : ℝ)))

/-- Adjoining an integer vector outside the real span gives a primitive saturation of rank
`k + 1` whose transformed exterior covolume is bounded by the wedge estimate. -/
theorem primitiveExteriorCovolume_sat_extension_le {d k : ℕ} (hd : 0 < d)
    (h : Matrix (Fin d) (Fin d) ℝ) (hh : h.det ≠ 0)
    (Δ : Submodule ℤ (Fin d → ℝ)) (hΔ : integralPrimitiveSubgroup Δ)
    (b : Basis (Fin k) ℤ Δ) (v : Fin d → ℤ)
    (hv : (fun i => (v i : ℝ)) ∉ Submodule.span ℝ (Δ : Set (Fin d → ℝ))) :
    integralPrimitiveSubgroup (primitiveSpanExtension Δ v) ∧
      ∃ c : Basis (Fin (k + 1)) ℤ (primitiveSpanExtension Δ v),
        primitiveExteriorCovolume h (primitiveSpanExtension Δ v) c ≤
          (d : ℝ) * primitiveExteriorCovolume h Δ b *
            ‖h.mulVec (fun i => (v i : ℝ))‖ := by sorry

/-- Saturating a nonzero integer vector's span cannot increase its transformed sup norm;
this is the rank-zero starting case of the exterior extension estimate. -/
theorem primitiveExteriorCovolume_sat_extension_zero_le {d : ℕ} (hd : 0 < d)
    (h : Matrix (Fin d) (Fin d) ℝ) (hh : h.det ≠ 0)
    (v : Fin d → ℤ) (hv : v ≠ 0)
    (c : Basis (Fin 1) ℤ (primitiveSpanExtension ⊥ v)) :
    primitiveExteriorCovolume h (primitiveSpanExtension ⊥ v) c ≤
      ‖h.mulVec (fun i => (v i : ℝ))‖ := by sorry

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

/-- **Kleinbock–Margulis quantitative nondivergence** (Theorem 5.2): the good-function
covering bound controls short integer vectors through rank-increasing primitive extensions,
with the rank-one norm bound for the zero starting term. -/
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
Hurwitz class number, including imprimitive classes and their stabilizer weights. -/
theorem three_square_hurwitz {n : ℕ} (hn : 0 < n) :
    (Nat.card (ternaryShell n) : ℚ) =
      12 * (TauCeti.hurwitzClassNumber (4 * n) - 2 * TauCeti.hurwitzClassNumber n) := by sorry

/-- The primitive vectors of the ternary shell, with coordinate gcd one (§4.3). -/
def primitiveTernaryShell (n : ℕ) : Set (Fin 3 → ℤ) :=
  {v | v ∈ ternaryShell n ∧ Finset.univ.gcd (fun i => (v i).natAbs) = 1}

/-- A positive shell partitions by the positive coordinate gcd into primitive shells (§4.3). -/
theorem ternaryShell_square_divisor_sum {n : ℕ} (hn : 0 < n) :
    Nat.card (ternaryShell n) = ∑ k ∈ Finset.Icc 1 n,
      if k ^ 2 ∣ n then Nat.card (primitiveTernaryShell (n / k ^ 2)) else 0 := by sorry

/-- Square-divisor Möbius inversion recovers the primitive three-square count (§4.3). -/
theorem primitive_three_square_moebius {n : ℕ} (hn : 0 < n) :
    (Nat.card (primitiveTernaryShell n) : ℤ) = ∑ k ∈ Finset.Icc 1 n,
      if k ^ 2 ∣ n then ArithmeticFunction.moebius k *
        (Nat.card (ternaryShell (n / k ^ 2)) : ℤ) else 0 := by sorry

/-- The polynomial Laplacian `Σ ∂_i² P` in any finite coordinate dimension (§4.3). -/
def polynomialLaplacian {n : ℕ} (P : MvPolynomial (Fin n) ℝ) : MvPolynomial (Fin n) ℝ :=
  ∑ i : Fin n, pderiv i (pderiv i P)

/-- A homogeneous real polynomial has a unique finite Fischer decomposition into powers of
the squared radius times homogeneous harmonic polynomials (§4.3). -/
theorem polynomial_fischer_decomposition {n m : ℕ} (hn : 0 < n)
    (P : MvPolynomial (Fin n) ℝ) (hP : P.IsHomogeneous m) :
    ∃! H : Fin (m / 2 + 1) → MvPolynomial (Fin n) ℝ,
      (∀ j, (H j).IsHomogeneous (m - 2 * j.val) ∧ polynomialLaplacian (H j) = 0) ∧
      P = ∑ j, (∑ i : Fin n, X i ^ 2) ^ j.val * H j := by sorry

/-- Every polynomial restricts on the unit sphere to a finite sum of homogeneous harmonics,
including constants (§4.3). -/
theorem polynomial_sphere_harmonic_span {n : ℕ} (hn : 0 < n)
    (P : MvPolynomial (Fin n) ℝ) :
    ∃ H : Fin (P.totalDegree + 1) → MvPolynomial (Fin n) ℝ,
      (∀ ℓ, (H ℓ).IsHomogeneous ℓ.val ∧ polynomialLaplacian (H ℓ) = 0) ∧
      ∀ x : EuclideanSpace ℝ (Fin n), ‖x‖ = 1 →
        eval (fun i => x i) P = ∑ ℓ, eval (fun i => x i) (H ℓ) := by sorry

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

-- At `q = 0` the factor `P(q/q; q)` is `P(0; 0) = 1` because `0/0 = 0`, so `J(0; 0) = 1`.
example : jacobiProduct (0 : ℂ) 0 = 1 := by
  simp [jacobiProduct, qPochhammer]

-- At `(q, x, y, z) = (1/2, 1/3, 2/3, 3/4)` the summand at `(-1, -1)` is `-3`.
example : kroneckerSummand (1/2) (1/3) (2/3) (3/4) (-1) (-1) = -3 := by
  norm_num [kroneckerSummand]

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

end SiegelTransform

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

end Oppenheim

/-! ## Layer 5: LLL-reduced bases -/

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

end LLL

/-! ## Layer 6: Hermitian K-theory of exact categories -/

section C2NormMaps
variable {A : Type*} [AddCommGroup A]

/-- Period-two consumer spelling of ComplexTori Milestone 4's period-two `cyclicNormHom`, with
endomorphism formula `1 + σ` under the involution hypothesis. -/
def c2Norm (σ : A →+ A) : A →+ A := AddMonoidHom.id A + σ

/-- Period-two consumer spelling of ComplexTori Milestone 4's `oneSubPow` at exponent one, with
endomorphism formula `1 - σ` under the involution hypothesis. -/
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

/-- The sign-twisted duality, with double dual `-η`; for linear duality its symmetric spaces
are skew-symmetric forms. Alternation is a separate condition when two is not invertible. -/
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

/-- A hermitian `Q`-span `X ↞ U ↣ Y` whose pairing square is bicartesian (6.5.1).
Equivalently, the restricted pairings agree and the kernel map induced by the inflation is an
isomorphism compatible with the inclusions into `Y`. -/
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

/-- Free finitely generated abelian groups are not s-filtering (6.6a); multiplication
by two tests the special-inflation condition in the induced exact structure. -/
theorem freeFGAb_not_sFiltering : ¬ SFiltering (TauCeti.ExactStructure.abelian (C := FGModuleCat ℤ))
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

section NativeDGDuality
open CategoryTheory Opposite
universe u v
variable (R : Type v) [CommRing R] (A : Type u) [TauCeti.DGCategory R A]

/-- A duality on the native DG category, with homogeneous bidual naturality and an
involutive evaluation, preserving the specified acyclic subcategory (§6.8a). -/
structure DGDuality (A₀ : A → Prop) where
  dual : EnrichedFunctor (CochainComplex (ModuleCat.{v} R) ℤ) Aᵒᵖ A
  bidual : ∀ X : A, TauCeti.DGHom R 0 X (dual.obj (op (dual.obj (op X))))
  bidualInv : ∀ X : A, TauCeti.DGHom R 0 (dual.obj (op (dual.obj (op X)))) X
  bidual_closed : ∀ X, TauCeti.dgDifferential R 0 (bidual X) = 0
  bidualInv_closed : ∀ X, TauCeti.dgDifferential R 0 (bidualInv X) = 0
  bidual_inv : ∀ X, TauCeti.dgComp R (bidual X) (bidualInv X) (by omega) =
    TauCeti.dgId R X
  inv_bidual : ∀ X, TauCeti.dgComp R (bidualInv X) (bidual X) (by omega) =
    TauCeti.dgId R (dual.obj (op (dual.obj (op X))))
  naturality : ∀ {X Y : A} {n : ℤ} (f : TauCeti.DGHom R n X Y),
    TauCeti.dgComp R f (bidual Y) (add_zero n) =
      TauCeti.dgComp R (bidual X)
        (dual.dgMap n (X := op (dual.obj (op X))) (Y := op (dual.obj (op Y)))
          (dual.dgMap n (X := op Y) (Y := op X) f)) (zero_add n)
  triangle : ∀ X, TauCeti.dgComp R (bidual (dual.obj (op X)))
    (dual.dgMap 0 (X := op (dual.obj (op (dual.obj (op X))))) (Y := op X)
      (bidual X)) (by omega) = TauCeti.dgId R (dual.obj (op X))
  acyclic : ∀ X, A₀ X ↔ A₀ (dual.obj (op X))

namespace DGDuality
variable {R A} {A₀ : A → Prop}

/-- DG duality reverses homogeneous composition with the native opposite's Koszul sign. -/
theorem map_comp (D : DGDuality R A A₀) {X Y Z : A} {p q n : ℤ}
    (f : TauCeti.DGHom R p X Y) (g : TauCeti.DGHom R q Y Z) (h : p + q = n) :
    D.dual.dgMap n (X := op Z) (Y := op X) (TauCeti.dgComp (C := A) R f g h) =
      (p * q).negOnePow • TauCeti.dgComp R
        (D.dual.dgMap q (X := op Z) (Y := op Y) g)
        (D.dual.dgMap p (X := op Y) (Y := op X) f) (by omega : q + p = n) := by sorry

/-- DG duality commutes with the differential on the native Hom complexes. -/
theorem map_differential (D : DGDuality R A A₀) {X Y : A} (n : ℤ)
    (f : TauCeti.DGHom R n X Y) :
    D.dual.dgMap (n + 1) (X := op Y) (Y := op X) (TauCeti.dgDifferential (C := A) R n f) =
      TauCeti.dgDifferential R n (D.dual.dgMap n (X := op Y) (Y := op X) f) := by sorry

end DGDuality

end NativeDGDuality

section DGDualitySigns

/-- The Koszul sign `(-1)^{ij}` of opposite composition. -/
def dgOppositeSign (i j : ℤ) : ℤ := (-1) ^ (i * j).natAbs

/-- The dual differential sign `(-1)^{i+1}` in degree `i`. -/
def dgDualDifferentialSign (i : ℤ) : ℤ := (-1) ^ (i + 1).natAbs

/-- The bidual sign `(-1)^i` in degree `i`. -/
def dgBidualSign (i : ℤ) : ℤ := (-1) ^ i.natAbs

/-- The dualization sign `(-1)^{j(j-i)}` on a component `X^i → Y^j`, whose dual has source
`DY^{-j}` and target `DX^{-i}`. It is the internal-Hom sign for a degree-`-j` functional. -/
def dgDualMorphismSign (i j : ℤ) : ℤ := (-1) ^ (j * (j - i)).natAbs

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
example : dgDualMorphismSign 1 2 = 1 ∧ dgDualMorphismSign 0 1 = -1 ∧
    dgDualMorphismSign (-1) 1 = 1 := by decide

open CategoryTheory CochainComplex.HomComplex

-- In the dual two-term example, `d_DY^{-1} = id` and `(Df)⁰ = id`. The native Hom
-- differential is `-id`, agreeing with dualization of `δf` with the degree-one sign.
example {DX DY : CochainComplex (ModuleCat ℚ) ℤ} (Df : Cochain DY DX 0)
    (hDX : DX.d (-1) 0 = 0) :
    (δ 0 1 Df).v (-1) 0 (by omega) =
      dgDualMorphismSign 0 1 • (DY.d (-1) 0 ≫ Df.v 0 0 (by omega)) := by
  rw [δ_v 0 1 (by omega) Df (-1) 0 (by omega) (-1) 0 (by omega) (by omega)]
  simp [hDX, dgDualMorphismSign]

end DGDualitySigns

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

end ResidueDualityCoefficient

section FiniteSBoundary

/-- The rational unit group is not finitely generated: prime valuations have infinite support
across the group. This is the all-primes boundary for the finite-S K-theory interface in the final README
roadmap-for-a-roadmap. -/
theorem rationalUnits_not_finitelyGenerated : ¬ Group.FG ℚˣ := by sorry

end FiniteSBoundary

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

/-!
## Targets on these carriers stated only in `README.md`

The following README targets extend declarations of this file but need carriers that are not
available at the pins, or are steps of a proof rather than milestones; their signatures and
sources are in the README.

* Layer 1: `TauCeti.IntegralLattice.successiveMinimum_eq_sq_successiveMin` through ThetaSeries'
  `realModel`; its squared-norm definition and threshold API are prototyped above.
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
* Layer 6: `stableIndBoundedTStructure`, `prespectrumToSharedSpectrum`, `stableMappingSpectrum`,
  `bottAdamsOperations`, `brauerLift`, `brauerLift_homotopyEquivalence`, `finiteFieldKGroups`,
  `PerfectDerivedInfinity` and `perfectDerivedHom` on the supplied EnhancedDerivedSheaves,
  BordismFormalGroups F6.5 and TopologicalKTheory carriers; `stableIndCompletion` is the
  space-valued Ind-completion of a stable category supplied by BordismFormalGroups F6.5
  (quotient/Ind sub-lane), with EnhancedDerivedSheaves E5:presentability.1's
  `indCompactComparison`. `finiteSemisimpleIsotypicDecomposition` and
  `stableKHeartComparison` on stable/finite-length category carriers; `hyperbolicSpace`, `orthogonalSum`, `negativeSpace`, `isotropicReduction`, `ExactGW0`,
  `ExactW0`, `rationalFormationParity`, `HermitianQ`, `grothendieckWittSpace` and `hermitianCone`.
-/

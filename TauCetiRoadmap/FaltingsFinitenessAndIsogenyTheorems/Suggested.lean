import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Hom

/-!
# FaltingsFinitenessAndIsogenyTheorems: representative target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It records the
definitions and theorem signatures of the roadmap that can be stated against the pinned Mathlib and
Tau Ceti APIs. These are suggested forms, not an exhaustive checklist. Every theorem
is proved by `sorry`; the definitions have real bodies.

Design choices made explicit here:

* Faltings' degree of a metrized line bundle on `Spec 𝓞 K` is recorded on fractional ideals with
  archimedean scalars, `‖x‖_v = c v * v x`; the weight of an infinite place is `InfinitePlace.mult`
  (`2` at a complex place), which is what makes the degree independent of the chosen section.
* Zarhin's quaternion matrix is the matrix of right multiplication by `a + b i + c j + d k`; only the
  identity `v * vᵀ = (a² + b² + c² + d²) • 1` is used.
* `V ^ 4` is `Fin 4 → V` and `V ^ 8` is `(Fin 4 → V) × (Fin 4 → V)`; a `4 × 4` matrix acts through
  the coefficients (`matAct`), commuting with any group acting diagonally.
* Elliptic curves are Mathlib Weierstrass curves with `IsElliptic`; their homomorphism groups are Tau
  Ceti's `TauCeti.Isogeny.Hom`, and "`K`-isogenous" means a nonzero element of that group.

The enriched carriers for abelian varieties with Tate modules, polarizations and semiabelian models
are not available at the pins, so their finiteness theorems are README targets; the closing comment
lists them. The worked rational-points application in the README states its geometric hypotheses explicitly.
-/

namespace TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

open NumberField Polynomial
open scoped nonZeroDivisors Matrix

/-! ## Layer R28.1: Semiabelian models, modular heights and finiteness of bounded height -/

section Degree

variable {K : Type*} [Field K] [NumberField K]

/-- Faltings' degree (§3, pp. 353–354) of the metrized line bundle on `Spec 𝓞 K` given by the
nonzero fractional ideal `I`, with positive `c v` and norm `‖x‖_v = c v * v x` at the infinite place `v`:
`deg = log #(I / 𝓞 K • p) − Σ_v ε_v log ‖p‖_v` for any nonzero `p ∈ I`, which equals
`− log N(I) − Σ_v ε_v log (c v)` (see `fracIdealDegree_eq_of_mem`). Belongs to R28.1.5. -/
noncomputable def fracIdealDegree (I : FractionalIdeal (𝓞 K)⁰ K) (c : InfinitePlace K → ℝ) : ℝ :=
  -Real.log (FractionalIdeal.absNorm I : ℝ) - ∑ v : InfinitePlace K, (v.mult : ℝ) * Real.log (c v)

/-- Independence of the section: computing the degree with any nonzero `p ∈ I` gives the same
value (the product formula, with the weights `InfinitePlace.mult`). -/
theorem fracIdealDegree_eq_of_mem (I : FractionalIdeal (𝓞 K)⁰ K) (c : InfinitePlace K → ℝ)
    (hc : ∀ v, 0 < c v) {p : K} (hp : p ∈ I) (hp0 : p ≠ 0) :
    fracIdealDegree I c =
      Real.log ((FractionalIdeal.absNorm (FractionalIdeal.spanSingleton (𝓞 K)⁰ p) : ℝ) /
          (FractionalIdeal.absNorm I : ℝ)) -
        ∑ v : InfinitePlace K, (v.mult : ℝ) * Real.log (c v * v p) := by
  sorry

/-- Rescaling every archimedean norm by `t` changes the degree by `− [K : ℚ] log t`: the weights
`InfinitePlace.mult` sum to `[K : ℚ]`. A definition with weight `1` at complex places fails this. -/
theorem fracIdealDegree_smul (I : FractionalIdeal (𝓞 K)⁰ K) (c : InfinitePlace K → ℝ)
    (hc : ∀ v, 0 < c v) {t : ℝ} (ht : 0 < t) :
    fracIdealDegree I (fun v => t * c v) =
      fracIdealDegree I c - (Module.finrank ℚ K : ℝ) * Real.log t := by
  sorry

/-- The trivial metrized bundle has degree `0`. -/
example : fracIdealDegree (1 : FractionalIdeal (𝓞 K)⁰ K) (fun _ => 1) = 0 := by
  simp [fracIdealDegree]

end Degree

/-! ## Layer R28.4: Semisimplicity and the Tate conjecture -/

section Quaternion

/-- The matrix of right multiplication by `a + b i + c j + d k` in the basis `1, i, j, k`, as in
Zarhin's trick (R28.4.2). -/
def quatMatrix {R : Type*} [CommRing R] (a b c d : R) : Matrix (Fin 4) (Fin 4) R :=
  !![a, -b, -c, -d; b, a, d, -c; c, -d, a, b; d, c, -b, a]

theorem quatMatrix_mul_transpose {R : Type*} [CommRing R] (a b c d : R) :
    quatMatrix a b c d * (quatMatrix a b c d)ᵀ = (a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) • 1 := by
  sorry

theorem quatMatrix_transpose_mul {R : Type*} [CommRing R] (a b c d : R) :
    (quatMatrix a b c d)ᵀ * quatMatrix a b c d = (a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) • 1 := by
  sorry

/-- `(2, 3, 5, 7)`: `4 + 9 + 25 + 49 = 87`; a sign error in an off-diagonal entry breaks this. -/
example : quatMatrix (2 : ℤ) 3 5 7 * (quatMatrix (2 : ℤ) 3 5 7)ᵀ = (87 : ℤ) • 1 := by
  rw [quatMatrix_mul_transpose]; norm_num

/-- Right multiplication by `i` sends the third basis vector to minus the fourth. -/
example : quatMatrix (0 : ℤ) 1 0 0 3 2 = -1 := by
  decide

/-- `−1` is a sum of four squares in `ℤ_l` for every prime `l`, `l = 2` included (R28.4.1). -/
theorem exists_sum_four_squares_eq_neg_one (l : ℕ) [Fact l.Prime] :
    ∃ a b c d : ℤ_[l], a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = -1 := by
  sorry

/-- The statement is genuinely `l`-adic: over `ℚ` no such quadruple exists. -/
example : ¬ ∃ a b c d : ℚ, a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = -1 := by
  rintro ⟨a, b, c, d, h⟩
  nlinarith [sq_nonneg a, sq_nonneg b, sq_nonneg c, sq_nonneg d]

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- A `4 × 4` matrix acting on `V ^ 4 = Fin 4 → V` through the coefficients. -/
def matAct (v : Matrix (Fin 4) (Fin 4) k) : (Fin 4 → V) →ₗ[k] (Fin 4 → V) where
  toFun x i := ∑ j, v i j • x j
  map_add' x y := by
    ext i
    simp [Finset.sum_add_distrib, smul_add]
  map_smul' r x := by
    ext i
    simp [Finset.smul_sum, smul_smul, mul_comm]

/-- The coefficient action of the identity matrix fixes every vector. -/
example (x : Fin 4 → V) : matAct (1 : Matrix (Fin 4) (Fin 4) k) x = x := by
  ext i
  simp [matAct, Matrix.one_apply]

/-- The coefficient action of the zero matrix kills every vector. -/
example (x : Fin 4 → V) : matAct (0 : Matrix (Fin 4) (Fin 4) k) x = 0 := by
  ext i
  simp [matAct]

/-- The orthogonal-sum form on `V ^ 8 = V ^ 4 × V ^ 4` induced by a form `B` on `V`. -/
def sumForm (B : LinearMap.BilinForm k V) (x y : (Fin 4 → V) × (Fin 4 → V)) : k :=
  ∑ i, B (x.1 i) (y.1 i) + ∑ i, B (x.2 i) (y.2 i)

/-- Eight equal coordinate pairings sum to eight times their common value. -/
example (B : LinearMap.BilinForm k V) (u w : V) :
    sumForm B ((fun _ => u), (fun _ => u)) ((fun _ => w), (fun _ => w)) = 8 * B u w := by
  simp [sumForm]
  ring

/-- The zero bilinear form gives the zero orthogonal-sum form. -/
example (x y : (Fin 4 → V) × (Fin 4 → V)) : sumForm (0 : LinearMap.BilinForm k V) x y = 0 := by
  simp [sumForm]

namespace QuaternionIsotropic

/-- Zarhin's subspace `W₁ = {(x, v x) : x ∈ W⁴} ⊕ {(y, −v y) : y ∈ (W^⊥)⁴}` of `V ^ 8` (R28.4.2). -/
def subspace (B : LinearMap.BilinForm k V) (v : Matrix (Fin 4) (Fin 4) k) (W : Submodule k V) :
    Submodule k ((Fin 4 → V) × (Fin 4 → V)) :=
  (Submodule.pi Set.univ fun _ => W).map (LinearMap.prod LinearMap.id (matAct v)) ⊔
    (Submodule.pi Set.univ fun _ => B.orthogonal W).map (LinearMap.prod LinearMap.id (-matAct v))

/-- `W₁` is isotropic for the orthogonal-sum form when `B` is alternating and `v vᵀ = −1`. -/
theorem subspace_isotropic (B : LinearMap.BilinForm k V) (hB : B.IsAlt)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1) (W : Submodule k V)
    {x y : (Fin 4 → V) × (Fin 4 → V)} (hx : x ∈ subspace B v W) (hy : y ∈ subspace B v W) :
    sumForm B x y = 0 := by
  sorry

/-- `dim W₁ = 4 · dim V = ½ · dim V ^ 8`, so `W₁` is maximal isotropic. -/
theorem finrank_subspace [CharZero k] [FiniteDimensional k V] (B : LinearMap.BilinForm k V)
    (hB : B.IsAlt) (hnd : B.Nondegenerate) (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1)
    (W : Submodule k V) :
    Module.finrank k (subspace B v W) = 4 * Module.finrank k V := by
  sorry

/-- A group acting on `V` by similitudes of `B` and preserving `W` preserves `W₁` (acting
diagonally on `V ^ 8`). -/
theorem subspace_invariant {G : Type*} [Group G] (ρ : Representation k G V)
    (B : LinearMap.BilinForm k V) (χ : G → k) (hρ : ∀ g x y, B (ρ g x) (ρ g y) = χ g * B x y)
    (hχ : ∀ g, χ g ≠ 0) (v : Matrix (Fin 4) (Fin 4) k) (W : Submodule k V)
    (hW : ∀ g, ∀ x ∈ W, ρ g x ∈ W) (g : G) {x : (Fin 4 → V) × (Fin 4 → V)}
    (hx : x ∈ subspace B v W) : ((fun i => ρ g (x.1 i)), (fun i => ρ g (x.2 i))) ∈ subspace B v W := by
  sorry

/-- The recovery map `(s, t) ↦ ½ (s + v⁻¹ t)` sends `W₁` onto `W⁴`. -/
theorem map_recover_subspace [CharZero k] (B : LinearMap.BilinForm k V) (hB : B.IsAlt)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1) (W : Submodule k V) :
    (subspace B v W).map
        ((1 / 2 : k) • (LinearMap.fst k _ _ + (matAct (-vᵀ)).comp (LinearMap.snd k _ _))) =
      Submodule.pi Set.univ fun _ => W := by
  sorry

/-- For `W = 0` the subspace is the graph of `−v`. -/
example (B : LinearMap.BilinForm k V) (v : Matrix (Fin 4) (Fin 4) k) :
    subspace B v ⊥ = (⊤ : Submodule k (Fin 4 → V)).map (LinearMap.prod LinearMap.id (-matAct v)) := by
  sorry

end QuaternionIsotropic

end Quaternion

/-! ## Layer R28.5: Finiteness of isogeny classes and the Shafarevich conjecture -/

section WeilPolynomials

/-- Finitely many monic integer polynomials of degree `n` have all complex roots of absolute
value `r` (R28.5.1); with `r = q ^ (w / 2)` these are the Weil `q`-polynomials of weight `w`. -/
theorem finite_weilPolynomials (r : ℝ) (n : ℕ) :
    {P : ℤ[X] | P.Monic ∧ P.natDegree = n ∧
      ∀ z ∈ (P.map (Int.castRingHom ℂ)).roots, ‖z‖ = r}.Finite := by
  sorry

/-- Degree `0`: only the constant `1`. -/
example : {P : ℤ[X] | P.Monic ∧ P.natDegree = 0 ∧
    ∀ z ∈ (P.map (Int.castRingHom ℂ)).roots, ‖z‖ = 1} = {1} := by
  sorry

/-- Fixed degree is needed: `X ^ n − 1` has all its roots on the unit circle for every `n`. -/
example (n : ℕ) (hn : 0 < n) :
    ∀ z ∈ ((X ^ n - 1 : ℤ[X]).map (Int.castRingHom ℂ)).roots, ‖z‖ = 1 := by
  sorry

end WeilPolynomials

section Lattices

variable (l : ℕ) [Fact l.Prime]

/-- Finitely many stable lattices up to isomorphism in a semisimple `ℚ_l`-representation
(R28.5.9): there is a finite set of stable lattices such that every stable lattice is the image of
one of them under a `G`-equivariant automorphism of `V`. -/
theorem finite_stableLattices {G V : Type*} [Group G] [AddCommGroup V] [Module ℚ_[l] V]
    [FiniteDimensional ℚ_[l] V] [Module ℤ_[l] V] [IsScalarTower ℤ_[l] ℚ_[l] V]
    (ρ : Representation ℚ_[l] G V)
    (hss : ∀ W : Submodule ℚ_[l] V, (∀ g, ∀ x ∈ W, ρ g x ∈ W) →
      ∃ W' : Submodule ℚ_[l] V, IsCompl W W' ∧ ∀ g, ∀ x ∈ W', ρ g x ∈ W')
    (hexists : ∃ Λ : Submodule ℤ_[l] V, Submodule.IsLattice ℚ_[l] Λ ∧
      ∀ g, ∀ x ∈ Λ, ρ g x ∈ Λ) :
    ∃ F : Finset (Submodule ℤ_[l] V),
      (∀ Λ ∈ F, Submodule.IsLattice ℚ_[l] Λ ∧ ∀ g, ∀ x ∈ Λ, ρ g x ∈ Λ) ∧
      ∀ Λ : Submodule ℤ_[l] V, Submodule.IsLattice ℚ_[l] Λ →
      (∀ g, ∀ x ∈ Λ, ρ g x ∈ Λ) →
      ∃ Λ' ∈ F, ∃ φ : V ≃ₗ[ℚ_[l]] V, (∀ g x, φ (ρ g x) = ρ g (φ x)) ∧ ∀ x, x ∈ Λ ↔ φ x ∈ Λ' := by
  sorry

end Lattices

/-! ## Layer R28.6: Elliptic curves and the integral commutant -/

section Elliptic

open TauCeti.Isogeny

/-- R28.6.6: if `E'` has only integer endomorphisms and `E` maps nontrivially to `E'`, then
`Hom(E, E')` is infinite cyclic. -/
theorem hom_isogenous_cyclic {F : Type*} [Field F] [CharZero F]
    {W W' : WeierstrassCurve.Affine F} [W.IsElliptic] [W'.IsElliptic]
    (hEnd : ∀ f : Hom W' W', ∃ n : ℤ, f = n • Hom.id W')
    (hne : ∃ f : Hom W W', f ≠ 0) :
    ∃ f₀ : Hom W W', f₀ ≠ 0 ∧ ∀ f : Hom W W', ∃! n : ℤ, f = n • f₀ := by
  sorry

/-- Degrees in a cyclic `Hom`: `deg (n • f₀) = n² · deg f₀` (Tau Ceti `Hom.degree_zsmul`). -/
example {F : Type*} [Field F] {W W' : WeierstrassCurve.Affine F} [W'.IsElliptic]
    (f₀ : Hom W W') (n : ℤ) : (n • f₀).degree = n.natAbs ^ 2 * f₀.degree :=
  Hom.degree_zsmul n f₀

/-- R28.6.5: the `K`-isogeny class of an elliptic curve over a number field contains only
finitely many curves up to `K`-isomorphism (Satz 6 for `g = d = 1`). -/
theorem finite_ellipticIsogenyClass {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) [W.IsElliptic] :
    ∃ S : Finset (WeierstrassCurve K), ∀ W' : WeierstrassCurve K, W'.IsElliptic →
      (∃ f : Hom W.toAffine W'.toAffine, f ≠ 0) →
      ∃ W'' ∈ S, ∃ C : WeierstrassCurve.VariableChange K, C • W' = W'' := by
  sorry

end Elliptic

/-!
The README states the remaining targets with their hypotheses and sources; their carriers
(abelian varieties with Tate modules, polarizations, semiabelian models, heights, Galois
representations of number fields with Frobenius elements) are not at the pins. By layer:

* R28.1: `hodgeLine_picard`, `SemiabelianModel.unique`, `CorrespondenceStack`,
  `modular_hodge_commensurable`, `metrizedDegree`, `modularHeight`, `HermitianMetric.HasLogSingularities`,
  `hodgeMetric_hasLogSingularities`, `northcott_logSingular`, `hermiteMinkowski`,
  `finite_forms_semiabelian`, `finite_ppav_bounded_height`, `Polarization.kernelPairing`,
  `Polarization.descend`, `principalReduction_uniform`.
* R28.2: `height_isogeny`, `height_isogeny_padicVal_bounds`, `inertia_trivial_quotient`,
  `card_invDiff_level`, `det_hodgeTate_local`, `ladicChar_eq_cyclotomic_pow_mul_finite`,
  `det_induced_at_l`, `frobenius_weights_induced`, `sum_local_dims_eq`.
* R28.3: `closure_tower_lDivisible`, `toric_intersection_lDivisible`, `card_invDiff_shifted`,
  `height_stationary`, `PolarizationReduction`, `ppav_pow`, `tate_invariance`,
  `exists_isomorphic_quotients`.
* R28.4: `QuaternionIsotropic.finrank_subspace_of_two_ne_zero`,
  `QuaternionIsotropic.map_recover_subspace_of_two_ne_zero`,
  `QuaternionIsotropic.subspace_tateModule`, `exists_idempotent_image_of_isotropic`, `exists_idempotent_image`, `tate_semisimple`,
  `tate_end_iso`, `tate_hom_iso`, `isogenous_iff_localFactors`, `finite_of_tateModules_iso`.
* R28.4 coefficient-action API in the README: `matAct_one`, `matAct_zero`, `matAct_mul`,
  `sumForm_isAlt`, `sumForm_block`.
* R28.5: `frobeniusTestSet`, `finite_isogenyClasses`, `auxBound`, `auxPoly_spec`, `twistedDet_unramified`,
  `modl_char_cyclotomic`, `raynaud_determinant`, `height_eq_of_large_prime_isogeny`,
  `finite_padicVal_heightQuotient`, `shafarevich`, `zarhinGraphDescent`, `zarhinTrick`,
  `finite_directFactors`, `shafarevich_unpolarized`, `rationalTorelli`, `finite_curves_goodReduction`.
* R28.6: `ellipticBridge`, `elliptic_semisimple`, `elliptic_tate_hom_iso`,
  `elliptic_isogenous_iff_ap`, `order_centralizer_reduce`, `commutant_almostAll`.
-/

end TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

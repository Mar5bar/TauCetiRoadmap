import Mathlib
import TauCeti.NumberTheory.NumberField.TotallyPositive

/-!
# ShimuraCompactifications: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the definitions and theorem
signatures of the toroidal compactification roadmap that can be stated against the pinned Mathlib and
Tau Ceti APIs, so that contributors and reviewers converge on names, hypotheses and conventions. The
geometric objects of the roadmap (relative torus embeddings, arithmetic cone systems, mixed boundary
data, toroidal and minimal compactifications, semi-abelian schemes and degeneration data, integral and
Hilbert models) need carriers that are not at the pins; they are README targets only and are listed
at the end of the file.

Design choices made explicit here:
* Monoid algebras are Mathlib's `AddMonoidAlgebra R P`; the face projection is coefficient restriction
  `AddMonoidAlgebra.comapDomain` along the inclusion of a face submonoid, never a reduction of the
  coefficient ring `R`, which may be zero or nonreduced (Layer C0, C0.1–C0.7).
* The union of the boundary divisors of a regular chart is cut out by the product monomial
  `x_1⋯x_r`, not by the ideal `(x_1, …, x_r)` of their intersection (C0.18).
* Real embeddings of a totally real field are `embedding_of_isReal`; Mathlib's `InfinitePlace` value is
  their absolute value. Total positivity is Tau Ceti's `NumberField.IsTotallyPositive` (Layer C6).
* Coefficient multipliers of Fourier expansions are units of an arbitrary commutative ring; vanishing
  of a constant term needs an injective multiplier, not merely a multiplier different from `1` (C6.8).
* Cyclotomic phases use integer exponents `n·Tr(ξx)` and only `ζ^n = 1`; they depend on `x` modulo the
  trace dual of the larger module `B` (C6.15–C6.19).
-/

noncomputable section

namespace TauCetiRoadmap.ShimuraCompactifications

open NumberField NumberField.InfinitePlace

/-! ## Layer C0: admissible fans and relative torus embeddings -/

namespace FaceProjection

variable {P : Type*} [AddCommMonoid P]

/-- **Face submonoid** (standing hypothesis (C0-b) of Layer C0). A submonoid `F` of `P` is a face when
`a + b ∈ F` exactly when `a ∈ F` and `b ∈ F`. This is what makes coefficient restriction to `F`
multiplicative. -/
def IsFace (F : AddSubmonoid P) : Prop :=
  ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F

variable (R : Type*) [CommRing R] (F : AddSubmonoid P)

/-- **The off-face monomial ideal** `J_F` (C0.4): the ideal of `R[P]` spanned by the monomials of
degree outside `F`. It is this ideal span, not its radical. -/
def offFaceIdeal : Ideal (AddMonoidAlgebra R P) :=
  Ideal.span {f | ∃ p : P, p ∉ F ∧ f = AddMonoidAlgebra.single p (1 : R)}

/-- **The face projection** `π_{R,F} : R[P] → R[F]` (C0.1): restriction of a finitely supported
coefficient family to the face `F`. On monomials `r e_p ↦ r e_p` for `p ∈ F` and `↦ 0` otherwise
(Lan, *Arithmetic compactifications of PEL-type Shimura varieties*, 6.1.2.1–6.1.2.6, pp. 443–445).
Multiplicativity uses the face condition `hF`. -/
def faceProjection (hF : IsFace F) : AddMonoidAlgebra R P →ₐ[R] AddMonoidAlgebra R F where
  toFun f := AddMonoidAlgebra.comapDomain (fun m : F => (m : P)) Subtype.val_injective f
  map_one' := by have _ := hF; sorry
  map_mul' := by have _ := hF; sorry
  map_zero' := by simp
  map_add' := by intro x y; simp
  commutes' := by have _ := hF; sorry

/-- The face projection on a monomial of degree in `F` (C0.1, `faceProjection_single_mem`). -/
theorem faceProjection_single_mem (hF : IsFace F) {p : P} (hp : p ∈ F) (r : R) :
    faceProjection R F hF (AddMonoidAlgebra.single p r) = AddMonoidAlgebra.single ⟨p, hp⟩ r := by
  sorry

/-- The face projection kills monomials of degree outside `F` (C0.1, `faceProjection_single_not_mem`). -/
theorem faceProjection_single_not_mem (hF : IsFace F) {p : P} (hp : p ∉ F) (r : R) :
    faceProjection R F hF (AddMonoidAlgebra.single p r) = 0 := by
  sorry

/-- **Coefficients of the face projection** (C0.2). -/
theorem faceProjection_coeff (hF : IsFace F) (f : AddMonoidAlgebra R P) (m : F) :
    (faceProjection R F hF f).coeff m = f.coeff (m : P) := by
  sorry

/-- **A section of the face projection** (C0.3): projection after the inclusion `R[F] → R[P]` is the
identity. -/
theorem faceProjection_comp_inclusion (hF : IsFace F) :
    (faceProjection R F hF).comp
        (AddMonoidAlgebra.mapDomainAlgHom R R (F.subtype : F →+ P)) =
      AlgHom.id R (AddMonoidAlgebra R F) := by
  sorry

/-- **The kernel of the face projection** is the off-face monomial ideal (C0.4). -/
theorem ker_faceProjection (hF : IsFace F) :
    RingHom.ker (faceProjection R F hF).toRingHom = offFaceIdeal R F := by
  sorry

/-- **The integral stratum quotient** (C0.5, milestone of the coefficient part of Layer C0):
`R[P]/J_F ≅ R[F]`, with the class of `f` sent to `π_{R,F}(f)`. -/
theorem faceQuotient_equiv (hF : IsFace F) :
    ∃ e : (AddMonoidAlgebra R P ⧸ offFaceIdeal R F) ≃ₐ[R] AddMonoidAlgebra R F,
      ∀ f, e (Ideal.Quotient.mk (offFaceIdeal R F) f) = faceProjection R F hF f := by
  sorry

/-- **Coefficient change commutes with face projection** (C0.6), for every ring homomorphism, flat or
not. -/
theorem faceProjection_coefficient_change (hF : IsFace F) {S : Type*} [CommRing S] (φ : R →+* S)
    (f : AddMonoidAlgebra R P) :
    faceProjection S F hF (AddMonoidAlgebra.mapRingHom P φ f) =
      AddMonoidAlgebra.mapRingHom F φ (faceProjection R F hF f) := by
  sorry

/-- **The face ideal commutes with coefficient change** (C0.7). -/
theorem offFaceIdeal_map {S : Type*} [CommRing S] (φ : R →+* S) :
    (offFaceIdeal R F).map (AddMonoidAlgebra.mapRingHom P φ) = offFaceIdeal S F := by
  sorry

-- The positive-degree monomial is killed over `ℤ/4` (C0.1, `faceProjection_positive_test`).
example (hF : IsFace (⊥ : AddSubmonoid ℕ)) :
    faceProjection (ZMod 4) ⊥ hF (AddMonoidAlgebra.single 1 1) = 0 := by
  sorry

-- The nilpotent scalar `2` survives (C0.1, `faceProjection_nilpotent_test`).
example (hF : IsFace (⊥ : AddSubmonoid ℕ)) :
    (faceProjection (ZMod 4) ⊥ hF (AddMonoidAlgebra.single 0 2)).coeff 0 = 2 ∧
      (2 : ZMod 4) ≠ 0 := by
  sorry

-- The even submonoid of `ℕ` is not a face: `1 + 1` is even but `1` is not (C0.1).
example : ¬ IsFace (AddSubmonoid.closure {2} : AddSubmonoid ℕ) := by
  sorry

end FaceProjection

namespace ToricBoundary

variable (R : Type*) [CommRing R]

/-- The coordinate algebra `R[x_1, …, x_r, y_1^{±1}, …, y_s^{±1}]` of a regular toric chart, as the
monoid algebra of `ℕ^r × ℤ^s` (C0.10). -/
abbrev RegularChart (r s : ℕ) : Type _ :=
  AddMonoidAlgebra R ((Fin r → ℕ) × (Fin s → ℤ))

/-- The product monomial `t = x_1⋯x_r`, which cuts out the union of the boundary divisors (C0.18). -/
def boundaryProduct (r s : ℕ) : RegularChart R r s :=
  AddMonoidAlgebra.single ((fun _ => 1), 0) 1

/-- **The integral toroidal boundary is flat** (C0.18, milestone): the quotient of a regular chart by
the product monomial is flat over every commutative ring `R`. -/
theorem boundaryUnion_flat (r s : ℕ) :
    Module.Flat R (RegularChart R r s ⧸ Ideal.span {boundaryProduct R r s}) := by
  sorry

/-- **Finite toric maps for a change of lattice, rank one** (C0.20): the map `q ↦ q^e` of the ray
chart is finite over every commutative ring. -/
theorem changeLattice_finite_rankOne (e : ℕ) (he : 0 < e) :
    (AddMonoidAlgebra.mapDomainRingHom R (AddMonoidHom.mulLeft e : ℕ →+ ℕ)).Finite := by
  sorry

-- Over `ℤ/4` the boundary ideal of the ray chart does not contain the constant `2` (C0.18).
example : AddMonoidAlgebra.single 0 (2 : ZMod 4) ∉ Ideal.span {boundaryProduct (ZMod 4) 1 0} := by
  sorry

-- Positivity only in the interior does not define the boundary ideal: `x ∉ (xy)` (C3.5).
example :
    (AddMonoidAlgebra.single ((fun i : Fin 2 => if i = 0 then 1 else 0), 0) (1 : ℤ) :
      RegularChart ℤ 2 0) ∉ Ideal.span {boundaryProduct ℤ 2 0} := by
  sorry

-- With no boundary rays the boundary equation is a unit and its ideal is the whole ring (C0.18).
example : Ideal.span {boundaryProduct ℤ 0 0} = ⊤ := by
  sorry

-- Lan's support-function convention is superadditive (C0.15): the inequality is strict here.
example :
    let pol : ℝ × ℝ → ℝ := fun v => v.1 + v.2 + min v.1 v.2
    pol (1, 1) = 3 ∧ pol (1, 0) + pol (0, 1) = 2 := by
  sorry

end ToricBoundary

/-! ## Layer C6: Hilbert cusp arithmetic -/

namespace HilbertCusp

variable {F : Type*} [Field F] [NumberField F] [IsTotallyReal F]
variable {R : Type*} [CommRing R]

/-- **A contracting unit** (C6.1): in a finite-index subgroup of units of a totally real field of
degree `> 1`, some unit is large at a given place and small at all others (Dimitrov, proof of
Théorème 8.3, p. 547). -/
theorem exists_unit_contracting_away (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0)
    (hd : 1 < Fintype.card (InfinitePlace F)) (w₀ : InfinitePlace F) :
    ∃ u ∈ U, 1 < w₀ (((u : (𝓞 F)ˣ) : 𝓞 F) : F) ∧
      ∀ w, w ≠ w₀ → w (((u : (𝓞 F)ˣ) : 𝓞 F) : F) < 1 := by
  sorry

/-- **A negative embedding** (C6.2): a nonzero element that is not totally positive is negative at
some real place. The hypothesis `ξ ≠ 0` is needed. -/
theorem exists_negative_embedding {ξ : F} (hξ : ξ ≠ 0) (hpos : ¬ IsTotallyPositive ξ) :
    ∃ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ < 0 := by
  sorry

/-- **Unbounded negative traces along unit orbits** (C6.3). -/
theorem trace_pairing_unbounded_below (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0)
    (hd : 1 < Fintype.card (InfinitePlace F)) {ξ : F} (hξ : ξ ≠ 0) (hpos : ¬ IsTotallyPositive ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w) (B : ℝ) :
    ∃ u ∈ U, ∑ w : InfinitePlace F,
      embedding_of_isReal (IsTotallyReal.isReal w) ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) * y w < B := by
  sorry

/-- **Unit covariance preserves nonvanishing** (C6.4), over any commutative ring. -/
theorem coeff_ne_zero_iff_of_unit_covariance (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ)
    (u : U) (ξ : F) :
    a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) ≠ 0 ↔ a ξ ≠ 0 := by
  sorry

/-- **Koecher support** (C6.5, milestone of the arithmetic part of Layer C6): a unit-covariant
coefficient family whose support has traces bounded below is supported on `0` and the totally positive
elements. The coefficient ring is arbitrary; the multipliers are units. -/
theorem bounded_cusp_support_is_positive (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0)
    (hd : 1 < Fintype.card (InfinitePlace F)) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w)
    (hbound : ∃ B : ℝ, ∀ ξ : F, a ξ ≠ 0 →
      B ≤ ∑ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ * y w) :
    ∀ ξ : F, a ξ ≠ 0 → ξ = 0 ∨ IsTotallyPositive ξ := by
  sorry

/-- **Totally positive characters pair positively with boundary rays** (C6.6). -/
theorem trace_pos_of_totallyPositive {ξ : F} (hξ : IsTotallyPositive ξ)
    (v : InfinitePlace F → ℝ) (hv : ∀ w, 0 ≤ v w) (hv0 : v ≠ 0) :
    0 < ∑ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ * v w := by
  sorry

/-- **The constant coefficient is annihilated by `c(u, 0) − 1`** (C6.7). -/
theorem constant_coeff_annihilated (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ) (u : U) :
    ((c u 0 : R) - 1) * a 0 = 0 := by
  sorry

/-- **Vanishing of the constant term** (C6.8): it needs a multiplier `c(u, 0) − 1` that is not a zero
divisor. -/
theorem constant_coefficient_eq_zero (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ)
    (u : U) (hregular : ∀ r : R, ((c u 0 : R) - 1) * r = 0 → r = 0) :
    a 0 = 0 := by
  sorry

-- Over `ℚ` the unit orbit of `−1` is `{−1}`, so degree one is excluded (C6.3, C6.11).
example (u : (𝓞 ℚ)ˣ) : (((u : 𝓞 ℚ) : ℚ)) ^ 2 * (-1 : ℚ) = -1 := by
  sorry

-- A unit different from `1` can fix a nonzero nilpotent coefficient (C6.8).
example : (3 : ZMod 4) ≠ 1 ∧ (3 : ZMod 4) * 2 = 2 ∧ (2 : ZMod 4) ≠ 0 := by
  sorry

-- `0` is not totally positive, so `ξ = 0` must be excluded in C6.2.
example : ¬ IsTotallyPositive (0 : ℚ) := by
  sorry

end HilbertCusp

/-! ### Layer C6: cyclotomic trace phases -/

namespace CyclotomicPhase

variable {K : Type*} [Field K] [NumberField K]
variable {R : Type*} [CommRing R]

/-- **Integral trace exponents** (C6.15). -/
theorem trace_exponent_integral (A B : Submodule ℤ K) (n : ℕ)
    (hn : ∀ ξ : K, ξ ∈ B → n • ξ ∈ A)
    (ξ x : K) (hξ : ξ ∈ B) (hx : x ∈ Submodule.traceDual ℤ ℚ A) :
    ∃ m : ℤ, (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x) := by
  sorry

/-- **Congruence of exponents under a change of lift** (C6.16). -/
theorem trace_exponents_congruent (B : Submodule ℤ K) (n : ℕ) (ξ x x' : K)
    (hξ : ξ ∈ B) (hx : x' - x ∈ Submodule.traceDual ℤ ℚ B) (m m' : ℤ)
    (hm : (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (hm' : (m' : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x')) :
    ∃ k : ℤ, m' - m = n * k := by
  sorry

/-- **Phases do not depend on the lift** (C6.17): only `ζ^n = 1` is used. -/
theorem phase_independent_of_lift (B : Submodule ℤ K) (n : ℕ) (ξ x x' : K)
    (hξ : ξ ∈ B) (hx : x' - x ∈ Submodule.traceDual ℤ ℚ B) (m m' : ℤ)
    (hm : (m : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (hm' : (m' : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x'))
    (ζ : Rˣ) (hζ : ζ ^ (n : ℤ) = 1) :
    ζ ^ m' = ζ ^ m := by
  sorry

/-- **Phases are additive** (C6.18). -/
theorem phase_additive (n : ℕ) (ξ η x : K) (m₁ m₂ m₃ : ℤ)
    (h₁ : (m₁ : ℚ) = (n : ℚ) * Algebra.trace ℚ K (ξ * x))
    (h₂ : (m₂ : ℚ) = (n : ℚ) * Algebra.trace ℚ K (η * x))
    (h₃ : (m₃ : ℚ) = (n : ℚ) * Algebra.trace ℚ K ((ξ + η) * x)) (ζ : Rˣ) :
    ζ ^ m₃ = ζ ^ m₁ * ζ ^ m₂ := by
  sorry

/-- **The phase function** underlying `tracePhase` (C6.19): `ξ ↦ ζ^{n·Tr(ξx)}`, the exponent being the
numerator of the rational number `n·Tr(ξx)`, which is an integer under the hypotheses of C6.15. -/
def tracePhaseFun (n : ℕ) (x : K) (ζ : Rˣ) (ξ : K) : Rˣ :=
  ζ ^ ((n : ℚ) * Algebra.trace ℚ K (ξ * x)).num

/-- The phase function is additive on `B` when `nB ⊆ A` and `x ∈ traceDual(A)` (C6.19,
`tracePhase_add`). -/
theorem tracePhaseFun_add (A B : Submodule ℤ K) (n : ℕ) (hn : ∀ ξ : K, ξ ∈ B → n • ξ ∈ A)
    (x : K) (hx : x ∈ Submodule.traceDual ℤ ℚ A) (ζ : Rˣ) {ξ η : K} (hξ : ξ ∈ B) (hη : η ∈ B) :
    tracePhaseFun n x ζ (ξ + η) = tracePhaseFun n x ζ ξ * tracePhaseFun n x ζ η := by
  sorry

-- For `K = ℚ`, `n = 3`, `x = 1`, the phase at `1/3` is `ζ` (C6.19, `phase_third_denominator`).
example (ζ : Rˣ) : tracePhaseFun (K := ℚ) 3 (1 : ℚ) ζ (1 / 3) = ζ := by
  sorry

-- The lift matters modulo `traceDual(B)`, not `traceDual(A)` (C6.19, `phase_wrong_dual`): for `n = 4`,
-- `ζ = 2` in `(ℤ/5)ˣ`, the phases at `1/4` for `x = 1` and `x = 0` are `2` and `1`.
example (ζ : (ZMod 5)ˣ) (hζ : (ζ : ZMod 5) = 2) :
    tracePhaseFun (K := ℚ) 4 (1 : ℚ) ζ (1 / 4) ≠ tracePhaseFun (K := ℚ) 4 (0 : ℚ) ζ (1 / 4) := by
  sorry

end CyclotomicPhase

end TauCetiRoadmap.ShimuraCompactifications

/-
Further README targets and API not declared here. The geometric carriers are not at the pins;
the elementary API and additional Checks of C0.1 are specified in the README.
Layer C0: additional API `faceProjection_eq_comapDomain` and Checks `faceProjection_zero_test`,
`faceProjection_laurent_test` (C0.1); `TauCeti.TorusTorsor.characterDecomposition`, `TauCeti.Toric.Relative.torusEmbedding`,
`faceOpenImmersion`, `regularCoordinateIso`, `stratumQuotientIso`, `boundaryCoordinateIso`,
`isProper_iff_support`, `ArithmeticFan` with `commonRefinement` and
`exists_smoothProjective_refinement`, `TauCeti.Toric.finiteFanScheme`, `TauCeti.Toric.completedChart_coeff`,
`TauCeti.Toric.changeLattice_finite`.
Layer C1: `MixedBoundaryDatum`, `BoundaryMHS`, `BoundaryTorsor`, `CuspLabel`,
`CuspLabel.arithmeticStabilizer`, `CuspLabel.finite_overlap`, `CuspLabel.boundary_incidence`.
Layer C2: `PartialBoundaryChart`, `quotient_separation`, `ToroidalSpace` with `normal`,
`interior_dense`, `compact_of_complete`, `smooth_normalCrossings`, `algebraization`, `toMinimal`;
`ToroidalCanonicalModel`; `MixedShimura.canonicalModel_exists`. Layer C2.general:
`ToroidalCanonicalModel.general`.
Layer C3: `ToroidalRefinement` with `levelDatum_extend`, `choice_comparison`,
`pushforward_structureSheaf`, `higherDirectImage_structureSheaf`, `pushforward_boundaryIdeal`,
`cohomology_iso`, `completed_local`; `ToroidalHeckeSpan`; `TauCeti.Toric.subdivision_structureSheaf`.
Layer C3.general: `ToroidalCanonicalModel.general_functorial`.
Layer C4: `SemiAbelianScheme` with `characterSheaf_spec`, `hodgeBundle`, `hom_extend`,
`isogeny_extend_quasiFiniteFlat`, `hasse_det`; `TorusExtension.classification`;
`PolarizedDegenerationData`; `MumfordDegeneration` with `equivalence`, `tate_compare`,
`tate_logKodairaSpencer`; `UniversalDegeneration` with `endomorphism_extend`, `level_compare`;
`SemiAbelianTateModule`; `KlingenToroidalCorrespondence` with `t1_acyclic`; `GroupScheme.verschiebung`.
Layer C5: `GoodCuspModel` with `etaleRelation`; `IntegralToroidalModel` with `formalCompletion`,
`proper`, `boundaryIntersection_smooth`, `exactStratum_fiberwiseDense`, `stratumComponent_eq`,
`stratumClosure_proper`, `stein_factor_finiteEtale`, `strata_detect_geometricComponents`,
`nonneat_descent`, `logKodairaSpencer`,
`hodgeLine_semiample`, `hodgeSectionAlgebra_fg`, `formallyCanonical`, `koecher`, `siegel_koecher`,
`ordinary_koecher`, `cyclicLevel_extend`, `siegel_canonicalBundle`, `goodReduction_geometry`;
`HodgeLineFJ`; `IntegralMinimalModel` with `hodgeLine_ample`, `moduli_quasiProjective`;
`NormalizedToroidalModel` with `chart_compare`; `ProjectiveToroidalModel`; `PrimeQGeneratorCover`;
`HilbertSiegel.minimalBoundary_codim`, `HilbertSiegel.formal_koecher`;
`SemiAbelianScheme.hodgeLine_generated`, `SemiAbelianScheme.isotrivial_of_degree_le_zero`.
Layer C6: `HilbertModular.meromorphic_support_bound`, `cusp_support_positive`, `koecher`,
`cuspidal_iff_constantTerm_eq_zero`, `HilbertCusp.Data`, `HilbertCusp.lattice_eq`,
`HilbertCusp.cocharacter_eq_traceDual`, `HilbertCusp.unramified_iff`,
`HilbertCusp.tracePairing_natural` (C6.13); `HilbertCusp.admissibleFan_iff`, `HilbertCusp.stabilizer_exact`, `CyclotomicPhase.tracePhase`,
`HilbertModular.cuspChart_family`, `toroidal_exists`, `toroidal_polarizationQuotient`,
`boundary_formal`, `boundary_etaleToric`, `regularRefinement_smooth`, `semiAbelian_extend`,
`conormal_compare`, `toroidal_proper`, `hodgeLine_semiample`, `minimal_contraction`, `sectionRing_fg`,
`minimal_normal_projective`, `minimal_polarizationQuotient`, `minimal_cusps`, `minimal_boundaryFibres`,
`minimal_formal`, `minimal_weightExtends_iff`, `qExpansion_compare`, `qExpansion_injective_module`,
`qExpansion_injective`, `qExpansion_descent`, `boundaryIdeal_pushforward`, `integralModel_compare`,
`hasseIdeal_compare`, `boundary_ordinary`, `nearOrdinary_compare`, `nearOrdinary_quotient`,
`levelMap_extend`, `integralDifferentials_compare`, `degreeOne_compare`, `degreeOne_cuspParameter`,
`degreeOne_primeDiamond`, `boundary_globalFunctions`; `FormalGluing.effective`.
-/

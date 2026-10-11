# Roadmap: p-adic measures, completed group algebras, and characteristic ideals

**Summary.** This roadmap builds the common language of Iwasawa theory and p-adic L-functions:
bounded measures on profinite spaces and their duals, completed group algebras with the Mahler–Amice
identification of measures on ℤ_p with power series, pseudo-measures and their values at characters
and on the weight space, Weierstrass preparation, the structure theory of finitely generated Iwasawa
modules with the invariants μ and λ, characteristic and Fitting ideals and how they behave under
specialisation and exact sequences. We want it because every p-adic L-function in the programme
(Kubota–Leopoldt, Katz, Hida families, the Rankin–Selberg and triple-product constructions) is a
measure or a pseudo-measure, and every main conjecture compares a characteristic ideal with such a
measure. Fixing the measure algebra and the module theory once lets those later roadmaps state their
theorems against shared, pinned objects.

The end theorems are: the comparison of integral measures on a profinite group with Tau Ceti's
completed group algebra (§1.7) and its reading in the power-series coordinate as the Amice transform
(§4.5); the Mahler–Amice calculus with ψφ = 1 and φψ the restriction to pℤ_p (§2.2) and the
identification of integral measures with the rational dual unit ball (§2.5); the evaluation of
pseudo-measures at characters (§3.1, §3.3, §3a.1); the structure theorem for finitely generated
Iwasawa modules and the growth formula over ℤ_p and over any mixed-characteristic coefficient ring
(§4.2, §4.7); the rational trivialization of the determinant of a perfect complex by the alternating
product of characteristic ideals (§5.1); and the Fitting-ideal identities of Dasgupta–Kakde for
character group rings, quadratic presentations and transposes (§6.1–§6.7).

This document is normative. [`Suggested.lean`](Suggested.lean) records the end theorems and layer
milestones that can be stated against the pinned libraries, with the few light definitions they need
and checks that fix the conventions; it is not exhaustive. Every target below states its hypotheses
and source; a closing *Lean:* note names the declaration that carries it, and a target without that
note is specified here only. New declarations live in the namespaces of `Suggested.lean`
(`AbstractMeasure`, `PowerSeries`, `Iwasawa`, `TauCeti.Iwasawa`, `TauCeti`, `Matrix`) or under
`TauCeti.` in the library.

## Scope and ownership

The roadmap owns:

- the operator calculus of bounded measures on compact spaces: clopen restriction and extension by
  zero, the weak and strong topologies, Dirac measures (Layer 0);
- finite coordinates of measures, the finite measure algebras, the finite quotients of ℤ_pˣ, the
  comparison of integral measures with `TauCeti.completedGroupAlgebra`, and coefficient extension
  (Layer 1);
- the Mahler–Amice dictionary on ℤ_p: weighting, the Mahler derivation, φ, ψ, division by x on the
  units, root-of-unity averaging, the bounded Amice norm, the rational integral lattice, the unit
  domain, the Cartier operators and residue averaging, dilation and residue classes (Layer 2);
- pseudo-measures, admissible evaluation at characters, characters of ℤ_pˣ and their integrals
  (Layer 3), and the character space of ℤ_pˣ with its bounded and meromorphic functions and the
  universal character (Layer 3a);
- Weierstrass theory of O⟦T⟧, pseudo-null modules, the structure theorem, μ and λ, the Iwasawa
  coordinate over O, characteristic ideals with base change and Galois-orbit components, the initial
  Fitting ideal, and the growth formulas (Layer 4);
- line modules and determinants of perfect complexes, their rational trivialization and
  specialization, and topological Nakayama (Layer 5);
- the coefficient-order algebra of Dasgupta–Kakde: character group rings, the involution #,
  contragredient duals and transposes, quadratic presentations, compound matrices and higher
  adjugates, Fitting ideals of extensions, and the exterior-power annihilation lemma (Layer 6).

It constructs no p-adic L-function (no Bernoulli, Eisenstein or zeta arithmetic), no Coleman map, no
locally analytic distributions beyond the bounded theory, no Galois cohomology, Selmer group or main
conjecture, no Euler- or Kolyvagin-system argument and no eigenvariety. It states no Gorenstein
property and no duality for character group rings: the lattice dual Hom_R(M, R) and the
finite-module dual Hom_O(M, K/O) already differ for M = O/ϖ (the first is 0, the second O/ϖ), and
the dualizing object, exactness, biduality and compatibility with # belong to the roadmap proving
the Brumer–Stark integrality statements, which will use the generic order and trace-dual lemmas
shared with GlobalNumberFields.

It leaves to named roadmaps:

- the completed group algebra, its topology, the ℤ_p power-series coordinate for a procyclic pro-p
  group, its continuity and the change of generator: Tau Ceti **ProfiniteProPGroups**, layer 9; they
  are consumed, never restated;
- Fitting ideals of finitely presented quasi-coherent modules for the singular locus Sing(f): Tau
  Ceti **StableReduction**, layer 1; the ring-level carrier for both roadmaps is
  `TauCeti.fittingIdeal`, which §4.5 and Layer 6 extend;
- the determinant of a finite locally free sheaf and its pullbacks: Tau Ceti
  **AlgebraicVectorBundles**, layer 0C. The ring-level foundation (invertible modules, the
  determinant of an arbitrary finite projective module through its clopen rank decomposition,
  locally constant parity, base change) is stated once in §5.1; AlgebraicVectorBundles L0C imports
  it and identifies its affine sheaf determinant with the sheaf associated with
  `projectiveDeterminant`, naturally in isomorphisms and ring base change. §5.1 imports nothing
  geometric;
- orders in number fields, their trace duals and Gorenstein orders: Tau Ceti **GlobalNumberFields**.
  The character group rings of Layer 6 are orders in products of copies of O and can have zero
  divisors, so they are never identified with a number-field order;
- the profinite integers and their units: **ProfiniteArithmetic**, layer 0; restricted products and
  adeles: **RestrictedProducts**.

## Conventions

p is a prime, p = 2 included unless a statement says otherwise; ℤ_p is `PadicInt`, k = 𝔽_p is `ZMod
p`; O is a complete discrete valuation ring with uniformizer ϖ and residue field 𝔽 (finite unless
stated), Λ = O⟦T⟧, Y = 1 + T. Indices n, m, r range over ℕ, including 0.

*Measures.* D(X, R) is Mathlib's `AbstractMeasure`, the continuous R-linear dual of C(X, R). It has
two topologies, the weak one (`AbstractMeasure.WeakTopology`) and the operator-norm one
(`AbstractMeasure.StrongTopology`, field coefficients only); neither is an instance and they are
never identified. Integral measures carry no norm. Convolution is Mathlib's right-handed product (μ
⋆ ν)(f) = μ(x ↦ ν(y ↦ f(xy))), commutative on a commutative monoid. Measures on ℤ_pˣ and on ℤ_p are
related by pushforward along `Units.val`, which is linear and not multiplicative for the two
convolutions.

*Amice transform.* A(μ) ∈ R⟦T⟧ has n-th coefficient μ(x ↦ binom(x, n)), so δ_a ↦ (1 + T)^a. Witness:
A(δ₁) = 1 + T, A(δ₀) = 1, and the n-th coefficient of A(δ₋₁) is (−1)^n. Multiplication of the
measure by x is the Mahler derivation ∂ = (1 + T)d/dT; φ(F) = F((1 + T)^p − 1) is pushforward along
x ↦ px; ψ satisfies ψφ = id and φψ = restriction to pℤ_p; 1 − φψ is restriction to ℤ_pˣ.

*Units and characters.* For odd p, ℤ_pˣ = μ_{p−1} × (1 + pℤ_p); for p = 2, ℤ_2ˣ = {±1} × (1 + 4ℤ_2)
and the integral theory keeps the order-two group-ring factor (no integral division by 2). The
characters x ↦ x^k and x ↦ x^{k′} agree on the torsion of ℤ_pˣ iff k ≡ k′ modulo p − 1 (odd p) or
modulo 2 (p = 2); at p = 2 the modulus p − 1 = 1 is wrong, since x and x² differ at −1.

*Iwasawa coordinate.* For Γ ≅ ℤ_p with generator γ, T = γ − 1 and ω_n = (1 + T)^{p^n} − 1 generates
the kernel of the projection to O[Γ/Γ^{p^n}]. In characteristic p, ω_n = T^{p^n}; over ℤ_p at n ≥ 1
the kernel is not (T^{p^n}) (witness: in ℤ_2[C_2], t = [g] − 1 has t² = −2t ≠ 0 while ω_1 maps to
0). ξ_n = ω_n/ω_{n−1} with ω_{−1} = 1.

*Pseudo-measures.* For a commutative group ring R with total quotient ring Q, pseudo-measures are
the λ ∈ Q with ([g] − 1)λ ∈ R for every g. A character is evaluated on a pseudo-measure only after
clearing a denominator [g] − 1 whose image is a unit; there is no character map on all of Q.

*Invariants.* μ is normalised by ϖ, never by p: vertical factors of the structure theorem are powers
of ϖ and μ is the length at (ϖ). Restriction of scalars from Λ_O to ℤ_p⟦T⟧ multiplies μ by f = [𝔽 :
𝔽_p] and λ by [O : ℤ_p]; base change along a finite extension multiplies μ by its ramification index
e. Formulas stated for O = ℤ_p (the growth law, the 𝔽_p-form of the minimal resolution) are
registered separately from their general forms; they are false over O ≠ ℤ_p. The
equal-characteristic case O = 𝔽⟦ϖ⟧ is excluded from the growth formula, where it fails.

*Idempotents.* For a finite abelian H with #H a unit of O, e_ω = (1/#H)Σ_a ω(a)⁻¹[a] with 1/#H =
`Ring.inverse` (#H); every statement about e_ω assumes #H invertible.

*Determinants.* det of a finite projective P of constant rank r in degree 0 is (⋀^r P, r mod 2), so
a rank-one module in degree 0 is odd; the determinant of a complex is ⊗_i det(P^i)^{(−1)^i} with
parity x ↦ Σ_i (−1)^i rank(P^i_x) mod 2; the symmetry of graded lines carries the Koszul sign, so
swapping two rank-one summands acts by −1; shifting by one inverts the line and keeps the parity.
Witness: for [Λ --a--> Λ] in degrees −1, 0 with a regular, det is Λ (even), H⁰ = Λ/(a), the
trivialization det(P)[1/a] → Λ[1/a] sends 1 to a⁻¹, and the image of det P in Frac Λ is a⁻¹Λ =
char(H⁰)⁻¹; in degrees 0, 1 the image is aΛ.

*Fitting ideals.* Fitt^i is `TauCeti.fittingIdeal R M i`; Fitt = Fitt⁰ (Dasgupta–Kakde, Appendix
B.2, p. 93). For an isomorphism σ : S → R and an ideal J of R, J^# = σ⁻¹(J).

## Exact supplier contracts

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Source | Declarations used |
|---|---|
| Mathlib, measures (`NumberTheory/Padics/Measure/`) | `AbstractMeasure` (`D(X, R)`), `dirac`, `map`, `toCLMEquiv`, `arrowCongrLeft`, `prodMk'`, `WeakTopology`, `StrongTopology`; the convolution `Ring`, `Algebra` and `CommRing` instances, `convolveFunRight`, `diracHom`, `monoidAlgebraHom`; `amiceTransform`, `coeff_amiceTransform`, `injective_amiceTransform`, `invTransform`, `amiceTransformEquiv` |
| Mathlib, Mahler and p-adics | `mahler`, `PadicInt.mahlerEquiv`, `PadicInt.hasSum_mahler`, `PadicInt.toZModPow`, `PadicInt.toZMod`, `PadicComplex`, `ZMod.unitsMap` |
| Mathlib, power series | `PowerSeries` with `subst`, `expand`, `derivative`, `exp`, `binomialSeries`, `HasEval`, `aeval`, `aeval_unique`, `exists_isWeierstrassFactorization`, `weierstrassDistinguished`; `Polynomial.IsDistinguishedAt`, `Polynomial.IsDistinguishedAt.algEquivQuotient`, `Polynomial.Monic.free_quotient` |
| Mathlib, algebra | `MonoidAlgebra`, `HopfAlgebra.antipodeAlgHom`, `IsFractionRing`, `Submodule.div`, `Module.length`, `LocalizedModule`, `IsRegularLocalRing`, `Module.FinitePresentation`, `Module.rankAtStalk`, `Module.Invertible`, `exteriorPower`, `HasEnoughRootsOfUnity`, `Algebra.Unramified`, `IsGalois`, `HomologicalComplex` |
| Tau Ceti, completed group algebra (`Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/`) | `TauCeti.completedGroupAlgebra R Γ` with `proj`, `of`, `mk`, `lift`, `ext` and its inverse-limit topology; `TauCeti.completedGroupAlgebra.powerSeriesCoordinate` with `powerSeriesCoordinate_X` and the generator change `powerSeriesCoordinate_padicPow_apply`; `TauCeti.isProP_multiplicative_padicInt`, `TauCeti.topologicallyGenerates_ofAdd_one_padicInt` |
| Tau Ceti, p-adic units | `PadicInt.isUnit_one_add_of_dvd`, `PadicInt.unitsToZModPow`, `surjective_units_map_toZModPow`, `PadicInt.continuous_toZMod`; `TauCeti.unitsPrincipal` with `mem_unitsPrincipal_iff`, `hasBasis_nhds_one_unitsPrincipal`, `iInf_unitsPrincipal_eq_bot`; `TauCeti.padicIntUnitsEquivProd` (odd p), `TauCeti.unitsPlusMinus` (p = 2), `exists_topologicalClosure_zpowers_eq_unitsPrincipal`, `not_isOfFinOrder_of_mem_unitsPrincipal`; `TauCeti.unitFiltration` |
| Tau Ceti, Fitting ideals (`RingTheory/FittingIdeal/`) | `TauCeti.fittingIdeal` with `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_eq_minorsIdealOfSet`, `fittingIdeal_congr`, `fittingIdeal_le_of_surjective`, `fittingIdeal_monotone`, `fittingIdeal_eq_top_of_surjective`, `fittingIdeal_quotient_zero`, `fittingIdeal_prod_add_finrank`, `fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_eq_top_iff_finrank_le`, `fittingIdeal_le_iff_lt_finrank`, `fittingIdeal_baseChange`, `fittingIdeal_eq_map` |
| Tau Ceti, other | `exists_forall_map_succ_eq_and_forall_eq_of_surjective` and `exists_forall_map_eq_of_compact_t2` (compact inverse limits); `hasAntitoneBasis_nhds_one_of_iInf_eq_bot`; `TauCeti.rightTranslationStabilizer`; `isDistinguishedAt_one_add_X_pow_sub_one`; `hasSubst_binomialSeries_sub_one`; `TauCeti.DiagonalizableGroup.point`; `TauCeti.MonoidAlgebra.augmentation`; `TauCeti.subgroupCharSum`; `TauCeti.AuslanderReitenTranspose` with `nonempty_linearEquiv_prod_dual`; `exteriorPower.map_top_eq_det_smul`; `Matrix.pairMinor` |

Reflexive modules are torsion-free (`Module.IsReflexive.to_isTorsionFree`); transposes are unique up
to projective summands (`nonempty_linearEquiv_prod_dual`); ω_n is distinguished of degree p^n at (p)
(`isDistinguishedAt_one_add_X_pow_sub_one`). These are used, not restated.

## How to read the build

Layers are built in the order 0 → 1 → 2 → 3 → 3a → 4 → 5 → 6. Each `### k.n` subsection lists its
targets in dependency order: a bold title, the statement with its hypotheses and source, then
*Checks* (each a discriminating instance) and *Needs* (earlier targets and library inputs). Every
layer ends with examples and dependencies.

## Layer 0: coefficients, continuous functions and duals

On a compact space X with a normed commutative coefficient ring R, this layer builds the operators
on D(X, R) that every later layer uses. Standing assumptions: s ⊆ X is clopen (possibly empty); no
field, completeness, ultrametricity, Hausdorffness or nonemptiness is assumed unless stated; K is a
nontrivially normed field. z_s is extension by zero of test functions on s, r_s the clopen
restriction of measures and j_s pushforward along s ↪ X. Density of locally constant functions is
Mathlib's, with Tau Ceti's `TauCeti.rightTranslationStabilizer` on compact groups.

### 0.1 Clopen restriction, extension and decomposition

References: RJW §3.5.3 and Remark 3.31, p. 127; §3.2, Definitions 3.7–3.8, pp. 119–121.

**Extension by zero.** Define z_s : C(s, R) →L[R] C(X, R), z_s(f) = f on s and 0 off s, with ‖z_s f‖
= ‖f‖ (also for s = ∅), (z_s f)|_s = f and z_s(f|_s) = χ_s f for the characteristic function χ_s.
*Checks:* on X = Fin 2, s = {0}, R = ℤ, the extension of the constant 7 is 7 at 0 and 0 at 1 (a
definition extending by the boundary value fails); on s = ∅ the extension of the unique test
function is 0. *Needs:* `ContinuousMap.liftCover_coe`, `LocallyConstant.coe_charFn`.

**Clopen restriction of measures.** Define r_s : D(X, R) →ₗ[R] D(s, R), r_s(μ)(f) = μ(z_s f). Prove
r_s ∘ j_s = id, (j_s r_s μ)(f) = μ(χ_s f), the Dirac values (r_s δ_x = δ_x for x ∈ s, 0 otherwise),
and naturality: restriction commutes with pushforward along q when the source clopen is q⁻¹(target
clopen). *Checks:* on Fin 2 with s = {0}, r_s(2δ₀ − 3δ₁) = 2δ₀, r_s(δ₁) = 0, and every measure
restricts to 0 on ∅. *Needs:* extension by zero, `AbstractMeasure.map`.

**Supported measures come from the clopen.** μ = j_s ν for a unique ν ∈ D(s, R) iff μ(f) = 0 for
every f vanishing on s; then ν = r_s μ. Along the way, χ_s f + χ_{sᶜ} f = f. *Needs:* the two
restriction identities. *Lean:* `AbstractMeasure.existsUnique_map_subtype_iff`.

**Decomposition over complementary clopens.** μ ↦ (r_s μ, r_{sᶜ} μ) is a linear equivalence D(X, R)
≃ D(s, R) × D(sᶜ, R) with inverse (ν, η) ↦ j_s ν + j_{sᶜ} η (`clopenDecomposition`). *Checks:* for
Fin 2, s = {0}, 2δ₀ − 3δ₁ ↦ (2δ₀, −3δ₁); recombining δ₀ and δ₁ gives δ₀ + δ₁; for s = ∅ the first
component is 0 and the second is μ carried to sᶜ = X. *Lean:* the inverse direction, as a weak
homeomorphism, is `AbstractMeasure.isHomeomorph_clopenRecombine_weak`.

### 0.2 Weak and strong topologies on measures

References: RJW Definitions 3.5, 3.7–3.8, p. 119; Example 3.10, p. 120; Remark 3.28(3), pp. 125–126;
Remark 3.31, p. 127; Corollary 3.32, Remark 3.33, p. 129.

**Weak topology.** Pushforward along a continuous map and clopen restriction are weakly continuous;
j_s is a weakly closed embedding whose range is the space of measures killing every test vanishing
on s; the decomposition above is a weak homeomorphism onto the product. *Needs:* §0.1. *Lean:*
`AbstractMeasure.isClosedEmbedding_map_subtype_weak`,
`AbstractMeasure.isHomeomorph_clopenRecombine_weak`.

**Strong topology.** (`norm_map_le`, `norm_restrictClopen_le`) For field coefficients, through
`toCLMEquiv`: ‖map q μ‖ ≤ ‖μ‖, ‖r_s μ‖ ≤ ‖μ‖, ‖j_s ν‖ = ‖ν‖; j_s is a strongly closed embedding and
the decomposition is a strong homeomorphism. *Needs:* §0.1 and the bound ‖z_s f‖ = ‖f‖.

**Dirac measures.** (`norm_dirac`, `norm_dirac_sub`) x ↦ δ_x is weakly continuous; ‖δ_x‖ = 1; ‖δ_x −
δ_y‖ = 1 for x ≠ y when X is totally separated and K ultrametric. *Checks:* on X = {0, 1} discrete,
δ₀ − δ₁ evaluated on 1_{0} gives 1.

**No norm compactness of the unit ball.** For X infinite, compact and totally separated and K a
nontrivially normed ultrametric field, the unit ball of the dual of C(X, K) is not compact in the
operator norm; no completeness of K is needed. The Dirac measures lie in the ball at mutual distance
one. *Needs:* the Dirac norms. *Lean:* `AbstractMeasure.not_isCompact_measure_unitBall`.

**Scaling rational tests.** (`exists_integral_test_scaling`) Every f ∈ C(X, ℚ_p) has p^n f ∈ C(X,
ℤ_p) for some n, and ν(f) = p^{−n} ν(p^n f); this feeds the unit-ball description of §2.5. *Needs:*
compactness of X.

### 0.3 Local constancy of reduction

References: RJW Lemma 12.13, pp. 182–183.

**Reduction modulo p is locally constant.** ℤ_p → 𝔽_p has kernel the open ideal (p) = {‖x‖ < 1}, so
its fibres are the clopen cosets a + pℤ_p; continuity is `PadicInt.continuous_toZMod`, and what is
stated is the fibre description through `PadicInt.ker_toZMod`. *Lean:* used in
`AbstractMeasure.pMultiplesIndicator`.

### Examples

- On Fin 2 with s = {0}, 2δ₀ − 3δ₁ decomposes as (2δ₀, −3δ₁).
- On an infinite profinite X with K = ℚ_p the dual unit ball is not norm compact; the Dirac sequence
  that witnesses this converges weakly (§2.7).

### Dependencies

Mathlib only (`AbstractMeasure`, `map`, `toCLMEquiv`, `WeakTopology`, `StrongTopology`,
`ContinuousMap.liftCover_coe`, `LocallyConstant.coe_charFn`, `PadicInt.ker_toZMod`) and Tau Ceti's
`TauCeti.rightTranslationStabilizer` and `PadicInt.continuous_toZMod`.

## Layer 1: completed group rings and convolution

For a profinite space or group this layer builds finite coordinates of measures, the finite measure
algebras, the finite quotients of ℤ_pˣ with their coordinates, and its endpoint: the comparison of
integral measures on a profinite group Γ with `TauCeti.completedGroupAlgebra ℤ_p Γ` as topological
ℤ_p-algebras, built from compatible families of finite coefficients, together with coefficient
extension. The convolution structure itself (`convolveFunRight`, the `Ring`, `Algebra` and
`CommRing` instances, `diracHom`) is Mathlib's; this layer adds the formula for `algebraMap`, the
pushforward of a convolution along a continuous monoid homomorphism and the multiplicativity of
total mass.

Standing assumptions: A, B are finite discrete spaces (monoids where a product is used); q : X → A
is continuous, not necessarily surjective; e_{q,a} = 1_{q⁻¹{a}}; ρ_r : ℤ_p → ZMod(p^r) is
`PadicInt.toZModPow`, with r = 0 allowed (zero ring). U = ℤ_pˣ, A_n = (ℤ/p^n)ˣ (A₀ trivial), red_n :
U → A_n is `PadicInt.unitsToZModPow`, t_{m,n} : A_n → A_m (m ≤ n) is `ZMod.unitsMap`; a compatible
family is c_n : A_n →₀ ℤ_p with (t_{m,n})_* c_n = c_m. M = D(U, ℤ_p) with the weak topology.

### 1.1 Finite coefficients and joint coordinates

References: RJW §3.2–3.3, Propositions 3.15–3.16, Definition 3.17, Example 3.19, pp. 119–123.

**Finite coefficients of a measure.** π_q : D(X, R) → (A →₀ R), π_q(μ)(a) = μ(e_{q,a}), R-linear.
Prove the pairing μ(g ∘ q) = Σ_a g(a) π_q(μ)(a), π_q(δ_x) = single(q x, 1), refinement π_{t∘q} = t_*
π_q, total mass Σ_a π_q(μ)(a) = μ(1), and reconstruction on a finite discrete space. *Checks:*
π_id(δ₀) on Fin 2 is the atom at 0; for Fin 2 → Fin 1 constant, 2δ₀ + 3δ₁ has coefficient 5, not an
average; for q : Fin 1 → Fin 2 constant 0, π_q(δ₀) vanishes at 1. *Lean:*
`AbstractMeasure.finiteProjection` (on `AbstractMeasure.fiberIndicator`).

**Measures on a finite discrete space.** π_id : D(A, R) → (A →₀ R) is bijective with inverse c ↦ Σ
c(a) δ_a; each π_q is weakly continuous. The map underlies `AbstractMeasure.monoidAlgebraHom`; only
bijectivity is new.

**Finite coefficients determine a measure.** For X profinite and R normed, π_q(μ) = π_q(ν) for all
continuous q : X → Fin n implies μ = ν. *Needs:* the pairing formula and density of locally constant
functions. *Lean:* `AbstractMeasure.finiteProjection_ext`.

**Joint finite and coefficient coordinates.** (`jointFiniteProjection`) π_{(r,q)} : D(X, ℤ_p) → (A
→₀ ZMod(p^r)) reduces each coefficient of π_q by ρ_r; prove the precision rule (reduction to r′ ≤
r), refinement and Dirac values, and that the joint coordinates over all r and q determine an
integral measure on a profinite X. *Checks:* at p = 2, π_{(2,id)}(δ₀) on Fin 1 is 1 in ZMod 4; at r
= 0 every coordinate vanishes; 2δ₀ projects to 0 mod 2 but to 2 mod 4.

### 1.2 Convolution and the finite measure algebras

References: RJW §3.3, Propositions 3.15–3.16, Remark 3.18, pp. 121–123; Loeffler, Mathlib
`Measure/Monoid.lean`.

**Finite algebra projections.** For a continuous monoid homomorphism q : G → A onto a finite
discrete monoid, Π_q(μ) = ofCoeff(π_q μ) is multiplicative, Π_q(μ ⋆ ν) = Π_q(μ)Π_q(ν), so it bundles
as an R-algebra map `finiteProjectionAlgHom` q : D(G, R) → R[A] with Π_q(δ_x) = single(q x, 1).
*Checks:* on G = ℤ/2 over ℤ, 2δ₁ + 3δ_g ↦ single(1, 2) + single(g, 3); δ_x ⋆ δ_y ↦ single(q(x)q(y),
1); the constant map to the trivial group sends 2δ_x + 3δ_y to single(1, 5). *Lean:*
`AbstractMeasure.finiteProjection_mul`.

**The finite measure algebra.** (`finiteProjectionAlgEquiv`) For finite discrete A, Π_id is an
R-algebra equivalence D(A, R) ≃ R[A] with inverse c ↦ Σ c(a) δ_a. *Checks:* δ_a ↦ single(a, 1); the
inverse of single(a, 2) + single(b, 3) is 2δ_a + 3δ_b, of total mass 5; the inverse of single(a,
r)single(b, s) is rs δ_{ab}.

**Finite-precision algebra coordinates.** (`jointFiniteProjectionRingHom`) For R = ℤ_p, μ ↦
ofCoeff(π_{(r,q)} μ) is a ring map D(G, ℤ_p) → ZMod(p^r)[A]. *Checks:* at p = 3, r = 1, 3δ_g ↦ 0
while δ_g ↦ single(g, 1); at r = 0 the unit maps to 0; at p = 2, r = 3, (2δ₁) ⋆ (3δ₁) ↦ single(1,
6).

### 1.3 Finite quotients of the p-adic units

References: RJW Definitions 3.7–3.8, Remarks 3.11–3.12, Proposition 3.16, pp. 119–122.

**Unit reductions.** red_n is Tau Ceti's `PadicInt.unitsToZModPow`, continuous, surjective, with
kernel `TauCeti.unitsPrincipal` p n; these kernels form a basis at 1 with trivial intersection
(library). Prove t_{m,n} ∘ red_n = red_m, red₀ = 1, and that ker(red_n) is the pullback of
`TauCeti.unitFiltration`(ℚ_p, n) along ℤ_pˣ → ℚ_pˣ. *Checks:* at p = 3, n = 2, red₂(2) = 2 and
red₂(−1) = 8; at n = 0 every unit reduces to 1; at p = 2, n = 1, ±1 have equal reductions.

**The modular-unit quotient.** Every open subgroup of U contains some ker(red_n). The isomorphism
e_n : U/ker(red_n) ≃ A_n induced by red_n (from `QuotientGroup.quotientKerEquivOfSurjective`) sends
the class of u to red_n(u). *Checks:* at p = 3, n = 0 every class maps to 1; at n = 2 the class of
2, which contains 11, maps to 2; at p = 2, n = 2 the classes of −1 and 1 differ.

**Factorisation through a unit quotient.** (`exists_unitsToZModPow_factor`) Every continuous
homomorphism from U to a discrete group factors as t ∘ red_n, uniquely for fixed n; a function on U
factors through red_n iff it is constant on the cosets of ker(red_n); every locally constant f : U →
A factors as g ∘ red_n, with refinement to deeper levels; the cylinder functions g ∘ red_n are dense
in C(U, R).

**Unit coordinates determine a measure.** (`unitsToZModPow_ext`) For any normed commutative R, two
measures on U with equal π_{red_n} for all n are equal; for R = ℤ_p the joint coordinates π_{(r,n)}
suffice, and so do the diagonal ones π_{(n,n)}. *Needs:* density of cylinder functions, §1.1.

### 1.4 Coordinates of unit measures

References: RJW Remark 3.11 and Proposition 3.16 with its inverse construction, pp. 120–122.

**Integration of locally constant unit tests.** (`unitCoordinateIntegral`) For a compatible family
c, I_c(f) = Σ_a g(a)c_n(a) for any presentation f = g ∘ red_n is well defined, ℤ_p-linear and
satisfies |I_c(f)| ≤ ‖f‖. *Checks:* at p = 3 with c_n = 2 single(red_n 1, 1) + 3 single(red_n 2, 1),
I_c(1_{1+3ℤ₃}) = 2 and I_c(1) = 5; I_c(const a) = a c₀(1); c_n = single(red_n u, a) gives I_c(f) = a
f(u).

**The measure of a compatible family.** (`ofUnitCoordinates`) μ_c is the continuous extension of
I_c: μ_c(f) = I_c(f) on locally constant f, |μ_c(f)| ≤ ‖f‖, π_{red_n}(μ_c) = c_n, μ_c(1) = c₀(1),
additive in c; every μ is μ of its own coordinates. *Checks:* c_n = single(red_n 1, 1) +
single(red_n 2, 1) at p = 3 gives μ_c(1_{1+3ℤ₃}) = 1 and μ_c(1) = 2; constant atoms give a δ_u; mass
5 survives when u and v have equal reductions.

**Existence and uniqueness.** (`existsUnique_ofUnitCoordinates`) Every compatible integral family is
the coordinate family of a unique μ ∈ D(U, ℤ_p).

### 1.5 The weak topology in unit coordinates

References: RJW Definition 3.5, p. 119; Proposition 3.16, pp. 121–122; Remark 3.18, pp. 122–123.

**The closed image of unit coordinates.** (`isClosedEmbedding_unitCoordinates_weak`) μ ↦ (π_n μ)_n
is a closed embedding of M (weak) into ∏_n (A_n → ℤ_p), with image the compatible families and
continuous inverse c ↦ μ_c; hence M is weakly compact. The joint coordinates embed M as a closed
subspace of a product of discrete rings ZMod(p^r).

**Weak convergence through joint coordinates.** (`tendsto_unitMeasures_weak_iff_joint`) μ_i → ν
weakly iff for all r, n eventually π_{(r,n)}(μ_i) = π_{(r,n)}(ν); the sets {π_{(n,n)}(μ) = 0} form a
basis at 0; M is a topological ring with a linear topology.

### 1.6 Characters of unit measures

References: RJW §3.6, Definition 3.34, equation (3-11), Remark 3.35, Lemma 3.36, pp. 129–131.

**Continuous-character integration.** For a continuous character κ : G → R,
`characterIntegralAlgHom` κ : D(G, R) →ₐ[R] R, μ ↦ μ(κ), is an algebra map with κ(δ_g) = κ(g) and
the trivial character giving total mass. *Checks:* on G = ℤ/2 over ℤ, δ₁ + δ_g has value 2 at the
trivial character; at the sign character δ₁ + δ_g ↦ 0 and δ₁ − δ_g ↦ 2; cδ_g ↦ cκ(g).

### 1.7 Comparison with the completed group algebra

References: RJW Proposition 3.16 and proof, pp. 121–122 (the inverse is built from compatible
families, which form additive functions on clopens, without a compactness theorem); Remark
3.28(1)–(2), p. 125.

**Towers of finite quotients.** A tower of Γ is a family of continuous surjections q_n : Γ → A_n
onto finite discrete groups with transitions t_{m,n} ∘ q_n = q_m and kernels separating points; for
compact Γ the kernels are cofinal among open normal subgroups (from
`hasAntitoneBasis_nhds_one_of_iInf_eq_bot`). Instances: red_n on ℤ_pˣ, ρ_n on ℤ_p. *Checks:* red_n
is a tower; a finite group with q_n = id is a tower whose compatible families are constant; the
trivial maps on a nontrivial Γ fail separation.

**Integral measures are the completed group algebra.** For a profinite group Γ there is a
ℤ_p-algebra isomorphism D(Γ, ℤ_p) ≅ `TauCeti.completedGroupAlgebra ℤ_p Γ`, whose projection to each
level Γ/U is the finite projection along Γ → Γ/U, sending δ_x to [x] and convolution to product; it
is a homeomorphism from the weak topology to the inverse-limit topology, so D(Γ, ℤ_p) is weakly
compact. The inverse is the limit of finite Dirac expansions of compatible families. Its reading in
the power-series coordinate is §4.5, stated after the coordinate. *Checks:* δ_x ⋆ δ_y projects to
single(x̄ȳ, 1) at every level; δ_x and δ_y have different images for x ≠ y; δ₁ ↦ 1. *Needs:* §1.1,
§1.2, §1.4–1.5, Tau Ceti `proj`, `of`, `mk`, `lift`, `ext`. *Lean:*
`AbstractMeasure.exists_algEquiv_completedGroupAlgebra`.

**Finite free coefficient extension.** For O a normed commutative ring that is finite free over ℤ_p
with continuous scalar action (`ContinuousSMul ℤ_p O`; the valuation ring of a finite extension of
ℚ_p is the case of use), there is an O-algebra isomorphism O ⊗_{ℤ_p} D(Γ, ℤ_p) ≅ D(Γ, O) with a ⊗
δ_x ↦ a δ_x; so D(Γ, O) ≅ lim_U O[Γ/U]. A finite basis gives a continuous bijection ℤ_p^d → O, a
homeomorphism by compactness, which supplies the coefficient coordinates. Inverting p gives the
bounded K-valued measures, which are not lim_U K[Γ/U]. *Checks:* for O = ℤ_p it is the canonical
map; 1 ⊗ δ_x ↦ δ_x; a ⊗ δ_x and b ⊗ δ_x have different images for a ≠ b. Negative control: ℤ_p with
the norm |σ(a)|_∞ for an abstract field embedding σ : ℚ_p → ℂ is free of rank one but p^n · 1 does
not tend to 0; for μ = Σ_{n≥1} p^n δ_{p^n} and f_m = (pm + 1)^{−1} 1_{p^m + p^{m+1}ℤ_p}, any
Dirac-preserving linear map gives E(μ)(f_m) = p^m/(pm + 1), unbounded while ‖f_m‖ → 0. *Lean:*
`AbstractMeasure.exists_baseChange_algEquiv` (with the negative control as an `example`).

**Extension of coefficients from the unit ball.** Let X be profinite, O a complete normed
commutative ring, K a complete nontrivially normed ultrametric field and j : O → K an isometric ring
map into the closed unit ball (the arithmetic case is a complete discrete valuation ring inside
ℂ_p). Then |j(μ(1_V))| ≤ 1 for every clopen V; setting ι_j(μ)(Σ c_i 1_{V_i}) = Σ c_i j(μ(1_{V_i}))
on locally constant K-valued tests and extending by density gives `extendCoefficients`, the unique
measure with ι_j(μ)(j ∘ f) = j(μ(f)), of operator norm ≤ 1. Prove compatibility with scalars, Dirac
measures, pushforward along continuous maps of profinite spaces, clopen restriction and (for a
commutative profinite monoid) convolution, so that ι_j is a ring map; injectivity from injectivity
of j; agreement with the integral extension of §2.5 for O = ℤ_p; and ι_j(a ⊗ μ) = j(a) ι(μ) on the
finite free base change. The extension need not exhaust D(X, K); §2.5 identifies its image for ℤ_p →
ℚ_p. *Checks:* ι_j(δ_x)(f) = f(x); for O = ℤ_p, K = ℚ_p, ι_j(δ₁ − δ₀) has Amice transform T;
ι_j(2δ_x) ≠ ι_j(δ_x) in characteristic zero; O = K with j = id fails the unit-ball hypothesis.
Negative control: on the ring ℚ_p with the discrete norm max(1, |a|_p) for a ≠ 0, Haar averaging
μ(f) = p^{−n}Σ_{a mod p^n} f(a) is a continuous O-measure with μ(1_{p^nℤ_p}) = p^{−n}; j = id into
the usual ℚ_p is contractive but not isometric, and an extension would give the null sequence p^n
1_{p^nℤ_p} constant integral 1. *Lean:* `AbstractMeasure.existsUnique_extendCoefficients`.

**Scalar evaluation of pseudo-measures at extended characters.** For G commutative profinite and a
continuous character χ : G → K, f_χ(μ) = ι_j(μ)(χ) is a ring map D(G, O) → K
(`extendedCharacterRingHom`, via `characterIntegralAlgHom`). For χ ≠ 1 pick g with χ(g) ≠ 1 and
define E_χ on pseudo-measures (§3.1) as the admissible evaluation with scalar map f_χ: (χ(g) −
1)E_χ(z) = f_χ(n_g z) for every such g, independent of g, equal to f_χ on measures, multiplicative
in the measure factor, and equal to §3.1's evaluation (`extendedPseudoCharacterEval`). Only χ(g) − 1
is inverted, in K; no Dirac difference is a unit in D(G, K), since its total mass is 0. *Checks:* at
p = 2 the sign character has χ(−1) − 1 = −2, and g = −1 gives (−2)E_χ(z) = f_χ(n_{−1} z). *Needs:*
§3.1 (a downstream compatibility; the constructions above take no input from Layer 3).

### Examples

- On G = ℤ/2 over ℤ, Π_id(2δ₁ + 3δ_g) = single(1, 2) + single(g, 3), while the constant map gives
  single(1, 5).
- At p = 3 the family c_n = 2 single(red_n 1, 1) + 3 single(red_n 2, 1) is the measure 2δ₁ + 3δ₂.
- Under the comparison, δ₁ ↦ 1 and distinct points have distinct images.
- For O = ℤ_p, K = ℚ_p, the extension of δ₁ − δ₀ has Amice transform T.

### Dependencies

Layer 0. Mathlib: the measure carrier and its convolution structure, `MonoidAlgebra`,
`QuotientGroup.quotientKerEquivOfSurjective`, `Algebra.TensorProduct`, `Module.Free`,
`ContinuousLinearMap.extend`. Tau Ceti: the p-adic unit API, `TauCeti.unitFiltration`,
`hasAntitoneBasis_nhds_one_of_iInf_eq_bot`, and `TauCeti.completedGroupAlgebra`
(ProfiniteProPGroups, layer 9).

## Layer 2: Mahler–Amice theory for bounded measures

The Mahler–Amice dictionary on ℤ_p and its operator calculus. Standing assumptions: Z = ℤ_p, U = Zˣ,
B = Z⟦T⟧ with the coefficientwise p-adic topology (`PowerSeries.WithPiTopology`), B₀ = 𝔽_p⟦T⟧ with
the coefficientwise discrete topology, ρ : B → B₀ the coefficient reduction, b = (1 + T)^p − 1
(constant coefficient 0, so `PowerSeries.subst` at b is defined). R is a normed commutative ring,
possibly zero; where R is a ℤ_p-algebra its scalar action is bounded, and completeness and
ultrametricity are added only where stated. K is a nontrivially normed field with bounded
ℤ_p-action. x is the identity of Z, χ the characteristic function of pZ, m_p(x) = px, d_a(x) = ax,
b_a = (1 + T)^a − 1 = `binomialSeries` a − 1. Additive convolution on Z and multiplicative
convolution on U are never identified.

### 2.1 Moments, the Mahler derivation and the Amice transform

References: RJW §3.5.1–3.5.2, Lemma 3.29, Corollary 3.30, pp. 126–127; §4.1, Lemma 4.3, Proposition
4.6, pp. 136–137.

**Weighted measures.** weight g μ = (f ↦ μ(g f)) on the existing carrier, R-linear in μ, with weight
1 = id, weight (gh) = weight g ∘ weight h, weight (const r) = r •, weight g δ_x = g(x)δ_x, map h
(weight (g ∘ h) μ) = weight g (map h μ) and (weight g)^k μ = (f ↦ μ(g^k f)). *Checks:* over ℤ₃,
weight x δ₀ = 0 although δ₀ ≠ 0 (weighting by x is not injective); weight x δ₁ = δ₁; weight x δ₂ =
2δ₂. *Lean:* `AbstractMeasure.weight`.

**Mahler derivation.** ∂ = (1 + T) · d/dT as a derivation of R⟦T⟧, with coeff_n(∂F) = (n +
1)coeff_{n+1}F + n coeff_n F, compatible with coefficient maps and their iterates; it rests on the
recurrence x · binom(x, n) = (n + 1)binom(x, n + 1) + n binom(x, n). *Checks:* over ℤ, ∂(C 7) = 0;
∂T = 1 + T, which rejects d/dT and T d/dT; ∂((1 + T)²) = 2(1 + T)². *Lean:*
`PowerSeries.mahlerDerivation`.

**Amice transform of multiplication by x.** A(x μ) = ∂A(μ), hence A(x^k μ) = ∂^k A(μ), and the
ordinary moments are μ(x^k) = constantCoeff(∂^k A(μ)). *Needs:* the two definitions above. *Lean:*
`AbstractMeasure.amiceTransform_weight_id`.

**Moments as exponential coefficients.** Over a commutative ℚ-algebra, d/dT(F(e^T − 1)) = (∂F)(e^T −
1) and constantCoeff(∂^k F) = k! coeff_k(F(e^T − 1)); hence for integral μ, μ(x^k) = k!
coeff_k(A(μ)(e^T − 1)) in ℚ_p, the integral being embedded and the exponential formal. *Lean:*
`AbstractMeasure.ordinaryMoment_eq_factorial_coeff`.

**Coefficient algebras.** (`amiceTransform_weight_id_algebra`) For R a ℤ_p-algebra with bounded
action, with x_R = j ∘ x for j : ℤ_p → R: the recurrence for j ∘ binom(·, n), constantCoeff A(μ) =
μ(1), A(x_R μ) = ∂_R A(μ) and its iterates, μ(x_R^k) = constantCoeff(∂_R^k A(μ)), and, when R is
moreover a ℚ-algebra, μ(x_R^k) = k! coeff_k(A(μ)(e^T − 1)). The ℚ-algebra structure is never imposed
on ℤ_p.

### 2.2 Translation, dilation, φ and ψ on power series

References: RJW §3.5.3 and §3.5.5, pp. 127–128; Corollary 3.32 and equations (3-7)–(3-8), pp.
128–129.

**Exact division on pℤ_p.** (`divideByP`) q : C(Z, Z) with q(px) = x for every x and q = 0 on U;
then p q(y) = y for y ∈ pZ; continuity holds because pZ and U are complementary clopens. *Checks:*
over ℤ₃, q(0) = 0, q(6) = 2, q(1) = 0 (q is not multiplication by an inverse of 3); at y = p the
clauses agree (q(p) = 1), whereas a definition vanishing outside U would force q(p) = 0 as well.

**Restriction to pℤ_p.** P = weight χ, an idempotent R-linear endomorphism with Pμ(f) = μ(χ f).
*Checks:* over ℤ₃, Pδ₀ = δ₀, Pδ₁ = 0, Pδ₃ = δ₃ (no rescaling). *Lean:*
`AbstractMeasure.pMultiplesIndicator`.

**Frobenius.** φ = map m_p, injective, with φμ(f) = μ(f ∘ m_p) and φδ_a = δ_{pa}. *Checks:* over ℤ₃,
φ(0) = 0, φδ₂ = δ₆, (φμ)(1) = μ(1) (no extra factor p). *Lean:* `AbstractMeasure.phiMeasure`.

**The left inverse of Frobenius.** ψ = (map q) ∘ P, with ψμ(f) = μ(χ · (f ∘ q)), ψ(φμ) = μ and φ(ψμ)
= Pμ; these two identities characterise ψ, and ψδ_a = δ_{a/p} for a ∈ pZ, 0 otherwise. *Checks:*
over ℤ₃, ψδ₀ = δ₀; ψδ₆ = δ₂ (no factor 1/3); ψδ₁ = 0, whereas bare pushforward by q gives δ₀.
*Lean:* `AbstractMeasure.existsUnique_psiMeasure`.

**Restriction to units.** (`unitRestriction`) E = id − P (multiplier 1 − χ = 1_U), idempotent, with
Eμ = μ iff μ(χ f) = 0 for all f, that is iff μ annihilates every test vanishing on U, iff ψμ = 0. A
measure supported on U need not kill the tests vanishing outside U: δ₁ is supported on U and δ₁(1_U)
= 1. *Checks:* over ℤ₃, Eδ₁ = δ₁, Eδ₀ = 0, Eδ₃ = 0. *Needs:* ψφ = id, φψ = P.

**Frobenius and the Amice transform.** binom(px, n) = Σ_{k≤n} coeff_n(b^k) binom(x, k), read off (1
+ T)^{px} = (1 + b)^x; at p = 2, n = 1 it says binom(2x, 1) = 2 binom(x, 1), the T-coefficient of b
= 2T + T². Hence A(φμ) = A(μ)(b) for integral μ. *Lean:*
`AbstractMeasure.amiceTransform_phiMeasure`.

**ψ on integral power series.** psiSeries = A ∘ ψ ∘ A⁻¹ : B →ₗ[Z] B (not a ring map), with
psiSeries(Aμ) = A(ψμ), psiSeries(F(b)) = F, and the Amice unit projector A(Eμ) = Aμ − (psiSeries
Aμ)(b). *Checks:* at p = 3, psiSeries((1 + T)³) = 1 + T (since (1 + T)³ = Aδ₃ and ψδ₃ = δ₁),
psiSeries(1) = 1, psiSeries(1 + T) = 0. *Needs:* `AbstractMeasure.amiceTransformEquiv`.

### 2.3 Inverting multiplication by x on the units

References: RJW equation (4-3), p. 138; Proposition 12.5, equation (12-3), pp. 179–180.

**Division by x.** `PadicInt.inv` is the unit inverse on U, zero on pZ, and continuous; J = weight
of it, so J lands in unit-supported measures, xJμ = Eμ and J(xμ) = Eμ, and J(map d_a μ) = a⁻¹ map
d_a (Jμ) for a ∈ U. *Checks:* at p = 3, Jδ₀ = 0, Jδ₁ = δ₁, 2Jδ₂ = δ₂ (multiplier 1/2).

**Unique unit-supported division by x.** If μ is supported on U, there is a unique ν supported on U
with xν = μ, namely Jμ. *Lean:* `AbstractMeasure.existsUnique_unitSupported_div_id`.

**Inverse Mahler derivative.** (`inverseMahler`) H = A ∘ J ∘ A⁻¹, with H(Aμ) = A(Jμ), psiSeries(HF)
= 0, ∂(HF) = F − (psiSeries F)(b) and H(∂G) = G when psiSeries G = 0; so if psiSeries F = 0 there is
a unique G with psiSeries G = 0 and ∂G = F. *Checks:* at p = 3, H(1) = 0, H(1 + T) = 1 + T, 2H((1 +
T)²) = (1 + T)².

### 2.4 Root-of-unity averaging and residue projections

References: RJW §3.5.3–5, equations (3-5), (3-6), (3-9), pp. 127–129; Lemma 4.7, p. 137.

**The integral coefficient embedding.** The valuation ring O of ℂ_p (`PadicComplex`,
`Valued.integer`) has a linear topology; j : ℤ_p → O lifting ℤ_p → ℚ_p → ℂ_p is continuous and
injective. Inputs proved here: |ζ − 1| = p^{−1/(p−1)} for a primitive p-th root ζ, so ζ − 1 is
topologically nilpotent; the uniform tail estimate and continuity of the inverse Amice transform;
continuity of psiSeries and of φ ∘ psiSeries; A(δ_a) = (1 + T)^a under coefficient maps. *Checks:*
|j(p)| = p⁻¹ (a nonunit); j is injective; √p ∈ O is not in the image of j.

**Root translation.** (`rootTranslation`) For ζ ∈ O with ζ^p = 1 and i ∈ ℕ, τ_i : ℤ_p⟦T⟧ → O⟦T⟧ is
the continuous evaluation with coefficients j at ζ^i(1 + T) − 1, given by the convergent sum Σ_n
j(coeff_n F)(ζ^i(1 + T) − 1)^n and by polynomial evaluation on polynomials; τ_i((1 + T)^n) = (ζ^i(1
+ T))^n. *Checks:* τ₀(T) = T; for p = 2, ζ = −1, τ₁(T) = −2 − T and τ₁((1 + T)³) = −(1 + T)³.

**Root averaging for ψ.** (`root_average`) For ζ primitive of order p, p · φ(psiSeries F) = Σ_{i<p}
τ_i(F) in O⟦T⟧, from Σ_{i<p} ζ^{ik} = p[p | k] on polynomials and continuity; psiSeries F is the
unique G ∈ ℤ_p⟦T⟧ with p · φ(G) = Σ_i τ_i(F). *Checks:* for p = 2 and F = T both sides are −2.

**Rational series.** (`rational_root_average`) For P, Q ∈ ℤ_p[T] with Q(0) a unit and QF = P, τ_i(F)
= P(ζ^iY − 1)/Q(ζ^iY − 1) in Frac(ℂ_p⟦T⟧) (the translated denominator has unit constant term), and p
· φ(psiSeries F) = Σ_{i<p} P(ζ^iY − 1)/Q(ζ^iY − 1); the same identity holds over any
characteristic-zero field K with ℤ_p → K and an embedding K → ℂ_p compatible with j, in Frac(K⟦T⟧).

**The finite-root partial-fraction identity.** For K of characteristic zero, ζ primitive of order p
and y^p ≠ 1, the denominators ζ^i y − 1 are nonzero and Σ_{i<p} 1/(ζ^i y − 1) = p/(y^p − 1). *Lean:*
`AbstractMeasure.sum_inv_root_mul_sub_one`.

### 2.5 Bounded Mahler coefficients and the Amice norm

References: RJW Definitions 3.5, 3.8, 3.23; Theorem 3.21; Theorem 3.25 and proof; Remark 3.28(1),
(3); pp. 119, 123–126.

**The bounded Mahler pairing and inverse transform.** For a bounded sequence c ∈ ℓ^∞(ℕ, R) the
series I_c(f) = Σ_n a_n(f)c_n converges (the Mahler coefficients a_n(f) tend to 0,
`PadicInt.hasSum_mahler`), with |I_c(f)| ≤ ‖c‖‖f‖; `boundedInvTransform` c is the measure f ↦
I_c(f), with Amice transform `PowerSeries.mk` c, unique with that transform, additive, and equal to
`invTransform` for integral coefficients. *Checks:* over ℚ₃ the constant sequence 1/3 gives value
1/3 on 1 (non-integral coefficients are allowed); c = e₁ gives δ₁ − δ₀, with Amice transform T and
I_c(x) = 1, I_c(1) = 0.

**Extension of integral measures on ℤ_p.** For μ integral, n ↦ j(coeff_n A(μ)) is bounded by |1_R|;
`extendIntegralCoefficients` μ = `boundedInvTransform` of it has Amice transform the coefficient
image of A(μ), value j(μ(f)) on j ∘ f, is characterised by these values, extends δ_a to δ_a, and
commutes with pushforward and with weighting by integral tests. *Checks:* over ℚ₃ the extension of
δ₂ takes the value 4 on x²; that of δ₁ − δ₀ has transform T; over ℤ_p it is the identity.

**Bounded Amice coefficients and the isometry.** For K with bounded ℤ_p-action, |coeff_n A(μ)| ≤
‖μ‖, so μ ↦ (coeff_n A(μ))_n is K-linear into ℓ^∞(ℕ, K); for K complete ultrametric it is an
isometric isomorphism from the dual of C(ℤ_p, K) (`boundedAmiceEquiv`), with inverse
`boundedInvTransform`. *Checks:* δ₀ over ℚ₃ has coefficients (1, 0, …); (1/3)δ₀ has coefficient 1/3;
δ₋₁ over ℚ₂ has coefficients (−1)^n, of supremum 1 and not eventually zero. *Lean:*
`AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`.

**The bounded-series range.** F ∈ K⟦T⟧ is an Amice transform iff its coefficients are bounded.
*Lean:* `AbstractMeasure.mem_range_amiceTransform_iff`.

**Integral measures are the rational dual unit ball.** The extension D(ℤ_p, ℤ_p) → D(ℤ_p, ℚ_p) is
injective with norm ≤ 1, and ν ∈ D(ℤ_p, ℚ_p) comes from a (unique) integral measure iff ‖ν‖ ≤ 1;
this image is weakly closed; every ν is p^{−n} times an extended integral measure. *Lean:*
`AbstractMeasure.exists_integral_iff_norm_le_one`.

### 2.6 Measures on the units inside measures on ℤ_p

References: RJW §3.5.3–5, Remark 3.31, Corollary 3.32, Remark 3.33, pp. 127–129.

**The unit locus.** (`unitsHomeomorphIsUnit`) V = {x ∈ ℤ_p : IsUnit x} is clopen, and u ↦ (u,
u.isUnit) is a homeomorphism h : ℤ_pˣ ≃ V. *Checks:* at p = 3, h(2) has value 2 (residue 2 mod 9,
not 5 = 2⁻¹); at p = 2, h(−1) = −1 and h⁻¹(1) = 1.

**Intrinsic unit restriction.** r_U = (transport along h⁻¹) ∘ r_V : D(ℤ_p, R) → D(ℤ_pˣ, R), with
r_U(j_U ν) = ν and j_U(r_U μ) = Eμ for j_U the pushforward along `Units.val`. *Checks:* over ℤ₃,
r_U(δ₁ + 2δ₃) = δ₁, r_U(δ₀) = 0, r_U(δ₃) = 0 although 3 ≠ 0.

**Unit measures as the kernel of ψ.** j_U is a linear isomorphism from D(ℤ_pˣ, R) onto ker ψ = {μ :
Pμ = 0}, with inverse r_U; for R = ℤ_p, ν ↦ A(j_U ν) is an isomorphism onto ker(psiSeries).
*Checks:* at p = 3, ambient δ₁ − δ₂ lies in ker ψ and δ₃ does not (ψδ₃ = δ₁); intrinsic δ₂ has
series (1 + T)², while (1 + T)³ = Aδ₃ is not in ker(psiSeries); at p = 2 intrinsic δ₋₁ maps to
ambient δ₋₁, whose series has T-coefficient −1. *Lean:*
`AbstractMeasure.map_unitsVal_injective_and_range`.

### 2.7 Weak and strong topologies on unit measures

References: RJW Definitions 3.5, 3.8, p. 119; Example 3.10, p. 120; Theorem 3.25, pp. 124–125;
Remark 3.28(1), (3), pp. 125–126.

**Weak topology.** (`amiceTransformEquiv`) r_U is weakly continuous and j_U is a weak homeomorphism
onto ker ψ; the integral Amice equivalence is a homeomorphism from the weak topology to the
coefficientwise topology, so D(ℤ_p, ℤ_p) is weakly compact; ν ↦ A(j_U ν) is a weak homeomorphism
onto ker(psiSeries); the integral extension is a weakly closed embedding into D(ℤ_p, ℚ_p), so the
integral weak topology is the weak subspace topology on the rational unit ball.

**Strong topology.** (`toCLMEquiv`) ‖j_U ν‖ = ‖ν‖ for field coefficients, and j_U is a strong
homeomorphism onto ker ψ.

**Weak and strong convergence differ.** In D(ℤ_p, ℚ_p), δ_{p^n} → δ₀ weakly, while ‖δ_{p^n} − δ₀‖ =
1 for every n, so there is no strong convergence. *Lean:*
`AbstractMeasure.tendsto_dirac_prime_pow_weak_not_strong`.

### 2.8 Integral coefficient extension on the unit domain

References: RJW Definitions 3.5, 3.7–3.8, p. 119; §3.5.2–5, Corollary 3.32, Remark 3.33, pp.
126–129.

**Extension on the units.** (`extendIntegralUnitCoefficients`) The integral extension commutes with
E; for R complete ultrametric with bounded action, I_{U,R}(μ) = r_U(I_R(j_U μ)) extends coefficients
of unit measures, is additive and semilinear, is the identity for R = ℤ_p, extends δ_u to δ_u,
commutes with j_U and r_U, and for R = ℚ_p is injective of norm ≤ 1. *Checks:* over ℚ₃ the extension
of δ₁ − δ₂ takes u ↦ u to −1 and 1 to 0; δ₁ extends to δ₁.

**The unit ball on the units.** (`unit_integral_extension_iff_norm_le_one`) ν ∈ D(ℤ_pˣ, ℚ_p) comes
from a unique integral unit measure iff ‖ν‖ ≤ 1; every ν is p^{−n} I_{U,ℚ_p}(μ) with one n for all
tests, and ‖r_U ν‖ ≤ ‖ν‖.

### 2.9 Cartier operators on power series

References: Rowland–Stipulanti–Yassawi, §3 and Proposition 4, p. 5 (v2); RJW Lemma 12.13, pp.
182–183.

**Cartier operators.** For a commutative ring k, a modulus q ≥ 1 and r ∈ ℕ, Λ_r is the k-linear map
with coeff_n(Λ_r F) = coeff_{qn+r}(F). For an actual residue r < q: Λ_r(F(T^q) G) = F Λ_r(G) over
any k, and F = Σ_{r<q} T^r (Λ_r F)(T^q); over a finite field with q elements, Λ_r(F^q G) = F Λ_r(G)
and F = Σ_{r<q} T^r (Λ_r F)^q. With modulus 1, Λ₀ = id. For r ≥ q the product identities fail (Λ_q
is Λ₀ followed by dropping the constant term and dividing by T). *Checks:* over 𝔽₃ with q = 3,
Λ₁(T⁷) = T² and Λ₀(T⁷) = 0; Λ₀(F³) = F. Negative controls: over ℤ with q = r = 1, Λ₁(T · 1) = 1 ≠ 0
= T Λ₁(1); over 𝔽₃ with r = 3, Λ₃(T³ · 1) = 1 ≠ 0 = T Λ₃(1). *Lean:* `PowerSeries.cartier`,
`PowerSeries.cartier_expand_mul`, `PowerSeries.sum_X_pow_mul_expand_cartier`,
`PowerSeries.cartier_pow_card_mul`, with the negative controls as `example`s.

### 2.10 Residue averaging modulo p

References: RJW §3.5.3–5, pp. 127–129; Lemma 12.13 and proof, pp. 182–183.

**Residue averaging operator.** ψ₀ = Σ_{0≤i<p} (−1)^i Λ_i on 𝔽_p⟦T⟧ (modulus p), so coeff_n(ψ₀F) =
Σ_{i<p} (−1)^i coeff_{pn+i}(F); it is continuous, ψ₀(F(T^p)G) = F ψ₀(G), and its values on (1 + T)^n
follow. *Checks:* at p = 3, ψ₀(T³) = T, ψ₀(T²) = 1, ψ₀(T) = −1 (not Λ₀); at p = 2, ψ₀(T) = 1.
*Needs:* `PowerSeries.cartier`.

**Reduction of ψ.** (`residue_psiSeries`) ρ is continuous and psiSeries((1 + T)^n) = (1 + T)^{n/p}
if p | n, else 0; hence ρ(psiSeries P) = ψ₀(ρP) on polynomials and ρ(psiSeries F) = ψ₀(ρF) for all
integral F. Along the way: ψ₀ is a left inverse of F ↦ F(T^p) = F^p over 𝔽_p, the pole terms T^{−i}
(0 < i < p) cancel in the signed sum, and a series with F(T^p)T^i = F for 0 < i < p is zero.

### 2.11 Dilation pushforward and binomial substitution

References: RJW §3.5.5, p. 128; Proposition 12.5, pp. 179–180.

**Amice transform of dilation.** For a ∈ Z and integral μ, A(map d_a μ) = A(μ)(b_a), the
substitution being defined by `hasSubst_binomialSeries_sub_one`; unit restriction commutes with
dilation by a unit, which preserves ker ψ; and H(F(b_a)) = a⁻¹ (HF)(b_a) for a ∈ U, the coefficients
of F(b_a) depending continuously on a. *Lean:* `AbstractMeasure.amiceTransform_map_mul`.

### 2.12 Restriction to residue classes

References: RJW §3.5.3, Remark 3.31, equation (3-5), p. 127; §3.5.4–5, pp. 127–128.

**Restriction to a residue class.** (`restrictResidue`) The fibre C_{n,a} = ρ_n⁻¹{a} = a + p^nℤ_p is
clopen, and P_{n,a} = weight 1_{C_{n,a}}: P_{n,a}P_{n,b} = P_{n,a} if a = b and 0 otherwise, Σ_a
P_{n,a} = id, P_{0,0} = id, P_{m,a} = Σ_{t(b)=a} P_{n,b} for m ≤ n, P_{n,a}μ(1) = π_{ρ_n}(μ)(a),
P_{n,a} is the translate of P_{n,0} by a, equals j_C ∘ r_C for C = C_{n,a}, is weakly continuous,
and at n = 1, a = 0 is P of §2.2. For R a ℤ_p-algebra, coeff_k A(P_{n,a}μ) = μ(1_{C_{n,a}} binom(x,
k)). *Checks:* at p = 2 over ℤ, depth 0 is the identity; the class 1 mod 4 keeps δ₅ and kills δ₃.

### Examples

- Over ℤ₃, weight x δ₀ = 0 while weight x δ₂ = 2δ₂; ∂T = 1 + T.
- At p = 3, psiSeries((1 + T)³) = 1 + T and psiSeries(1 + T) = 0; the unit projector sends (1 + T)³
  to 0 and 1 + T to itself.
- For p = 2, ζ = −1: τ₁(T) = −2 − T, and p φ(psiSeries T) = τ₀(T) + τ₁(T) = −2.
- Over ℚ₃ the constant sequence 1/3 is the coefficient sequence of a non-integral bounded measure.
- Over 𝔽₃, Λ₁(T⁷) = T², and Λ_r(F(T^q)G) = F Λ_r(G) fails for r = q.

### Dependencies

Layers 0 and 1. Mathlib: the Amice transform API, `PadicInt.mahlerEquiv`, `PadicInt.hasSum_mahler`,
`PowerSeries` (`subst`, `expand`, `exp`, `binomialSeries`, `WithPiTopology`), `PadicComplex`,
`Valued.integer`, `Ring.inverse`. Tau Ceti: `hasSubst_binomialSeries_sub_one`,
`PadicInt.continuous_toZMod`.

## Layer 3: pseudo-measures and evaluation

Pseudo-measures on a commutative group ring, evaluation at a character after clearing an admissible
denominator, the characters of ℤ_pˣ and their integrals, and evaluation at varying characters in the
form the Kubota–Leopoldt construction uses. Standing assumptions: G is a group, R a commutative
ring, δ : G →* R, c_g = δ(g) − 1; Q is a total quotient ring of R (`IsFractionRing` R Q, no domain
assumed) and ι = algebraMap R Q, injective; A is a commutative R-algebra with f = algebraMap R A.
For unit measures: Z = ℤ_p, U = Zˣ, M = D(U, Z) with its commutative convolution, δ = `diracHom`, Q
= `FractionRing` M, P the pseudo-measures; characters κ are continuous homomorphisms U → Z, and a
family κ : S → Hom_cts(U, Z) is continuous when it is continuous into C(U, Z) (uniformly, U being
compact).

### 3.1 Pseudo-measures and admissible evaluation

References: RJW §3.6, Definition 3.34, equation (3-11) and the calculation after it, Remark 3.35,
pp. 129–130.

**Pseudo-measures.** `pseudomeasures` δ Q = (1 : Submodule R Q) / span{ι(c_g)} (`Submodule.div`): z
belongs iff for every g there is r with ι(r) = ι(c_g)z. It is an R-module, not a subring, not a
fractional ideal in the domain sense; if δ is trivial it is all of Q. *Checks:* for G = PUnit, δ =
1, Q = ℚ, 1/2 is a pseudo-measure; for δ = `Units.coeHom` ℤ, Q = ℚ, 3 and 1/2 belong but 1/4 does
not, so pseudo-measures are not closed under products. *Lean:* `Iwasawa.pseudomeasures`,
`Iwasawa.mem_pseudomeasures_iff`.

**Integral inclusion and cleared numerators.** r ↦ ι(r) is an injective R-linear map R → P; for g ∈
G the numerator n_g : P → R is the unique R-linear map with ι(n_g z) = ι(c_g)z, and c_h n_g(z) = c_g
n_h(z) (cross-multiplication). *Checks:* for δ = `Units.coeHom` ℤ: the inclusion is not surjective
(1/2 is missing when δ = 1); n₁ = 0; n₋₁(2) = −4; n₋₁(1/2) = −1.

**Admissible evaluation.** If f(c_g) is a unit of A, there is a unique R-linear L : P → A with
f(c_g) L(z) = f(n_g z); it extends f on integral elements, is the unique R-linear extension of f,
commutes with algebra maps A → B, and the unit requirement cannot be weakened to nonvanishing.
*Checks:* for δ = `Units.coeHom` ℤ, Q = ℚ, A = ℤ/3, g = −1 (f(c_g) = −2 = 1 is a unit), the value at
1/2 is 2; with A = ℚ the value at 3 is 3 and at 1/2 is 1/2. *Lean:* `Iwasawa.existsUnique_evalAt`.

**Independence of the clearing element.** Two admissible g, h give the same evaluation, by
cross-multiplication. There is no ring map Q → A extending f once f kills a regular element; §3.2
turns this into the total-mass obstruction. *Lean:* `Iwasawa.evalAt_independent`.

### 3.2 Evaluation of unit measures at varying characters

References: RJW §3.6, Definition 3.34, (3-11), Remark 3.35, Lemma 3.36(i)–(iii), pp. 129–131.

**Positive moments determine unit measures.** (`units_eq_zero_of_positive_moments`) A measure on Z
killing every positive moment kills every polynomial test without constant term and every binom(x,
n), n > 0, so A(μ) = μ(1). Hence μ ∈ M with μ(u ↦ u^k) = 0 for all k > 0 is 0, using the unit-kernel
description of §2.6; and (μ ⋆ ν)(u^k) = μ(u^k)ν(u^k).

**Regular Dirac differences.** If μ(u^k) ≠ 0 for all k > 0 then μ is regular in M. For a ∈ U with
a^k ≠ 1 for all k > 0, δ_a − 1 is regular. p + 1 is a unit (`PadicInt.isUnit_one_add_of_dvd`) and (p
+ 1)^k ≠ 1 for k > 0: for odd p by `not_isOfFinOrder_of_mem_unitsPrincipal`, and for p = 2 because
3^k = 1 would give 9^k = 1 with 9 ∈ 1 + 4ℤ₂; so δ_{1+p} − 1 is regular.

**Positive moments of pseudo-measures.** For k > 0, the admissible evaluation at u ↦ u^k into ℚ_p,
computed with g = 1 + p, is `positivePseudoMoment`: additive, M-semilinear, equal to μ(u^k) on
measures, with n_g(z)(u^k) = (g^k − 1) · moment_k(z) for every g; the moments of all k > 0 determine
z. *Checks:* at p = 3 the atom at 2 has k-th moment 2^k, computed with a = 4 as 2^k(4^k − 1)/(4^k −
1) (the division is forced); the unit has all moments 1; the atom at −1 has moments (−1)^k, also at
p = 2.

**Total mass does not extend to the total quotient ring.** No ring map `FractionRing` M → ℤ_p
restricts to μ ↦ μ(1) on M, because δ_{1+p} − 1 is regular of total mass 0. *Lean:*
`no_totalMass_fraction_extension`.

### 3.3 Characters of the units and their integrals

References: RJW Definition 3.34, equation (3-11) and the independence argument, Remark 3.35, pp.
129–130.

**Nontrivial-character evaluation.** For κ ≠ 1, E_κ : P →+ ℚ_p (`unitCharacterEval`) is the
admissible evaluation with scalar map f_κ(μ) = μ(κ): E_κ(z) = f_κ(n_g z)/(κ(g) − 1) for every g with
κ(g) ≠ 1, E_κ(μ) = f_κ(μ) on measures, E_κ(μ z) = f_κ(μ)E_κ(z), and it is the unique additive map
with these two properties. No map Q → ℚ_p is constructed. *Checks:* at p = 3 with κ(u) = u², E_κ(δ₂)
= 4, computed with g = 2 as (16 − 4)/3; E_κ(1) = 1; E_κ(cδ_g) = cκ(g).

**Scalar-valued characters.** (`extendedPseudoCharacterEval`) Under the hypotheses of §1.7, E_χ of
§1.7 agrees with E_κ for G = ℤ_pˣ, O = ℤ_p, K = ℚ_p. At p = 2 the sign character is evaluated with g
= −1 and denominator −2.

**Moments and separation.** (`unitCharacterEval_ext`) If κ(g) = g^k with k > 0 then E_κ is the k-th
positive moment; hence the nontrivial characters separate pseudo-measures.

**Continuity away from the trivial character.** (`continuous_unitCharacterEval`) For a continuous
family κ : S → Hom_cts(U, Z) and a fixed z, s ↦ E_{κ_s}(z) is continuous on {s : κ_s ≠ 1}. Inputs:
|E_κ(z)| ≤ ‖n_g z‖/|κ(g) − 1|; κ ↦ f_κ(μ) is continuous in the compact-open topology; {s : κ_s(g) ≠
1} is open and s ↦ 1/(κ_s(g) − 1) is continuous there.

### Examples

- For δ = `Units.coeHom` ℤ, the pseudo-measures are the r ∈ ℚ with 2r ∈ ℤ; n₋₁(1/2) = −1 and the
  evaluation into ℤ/3 at g = −1 sends 1/2 to 2.
- At p = 3, κ(u) = u² evaluates the atom at 2 to 4 = 12/3.
- No ring map `FractionRing` M → ℤ_p restricts to total mass on M.

### Dependencies

Layer 1 (convolution on unit measures, `characterIntegralAlgHom`) and Layer 2 (the unit kernel of
§2.6). Mathlib `IsFractionRing`, `Submodule.div`, `ContinuousMonoidHom`; Tau Ceti
`not_isOfFinOrder_of_mem_unitsPrincipal`.

## Layer 3a: rigid character and weight spaces

The characters of ℤ_pˣ (and of a compact abelian p-adic group with an open ℤ_p^d) form a parameter
space on which measures are bounded analytic functions and pseudo-measures are meromorphic with at
most a simple pole at the trivial character. This layer fixes the space and its functions at the
level of points; nothing rigid-analytic is built, and consumers build that structure on the
universal property below. Every function here is a scalar evaluation through f_χ(μ) = ι_j(μ)(χ) of
§1.7.

Standing assumptions: ℂ_p is `PadicComplex`; O is the valuation ring of a finite extension of ℚ_p in
ℂ_p and j : O → ℂ_p the inclusion; ι_j : D(ℤ_pˣ, O) → D(ℤ_pˣ, ℂ_p) is the extension of §1.7, a ring
map for convolution. A norm ‖μ‖ of an O-valued measure means ‖ι_j(μ)‖ ≤ 1; no norm is installed on
D(ℤ_pˣ, O).

### 3a.1 The character space of ℤ_pˣ and its functions

References: RJW Remark 3.47, p. 135 (odd p; the decomposition at p = 2 has no source in this
register); Remark 8.3(2), pp. 160–161; Proposition 3.16, pp. 121–122; Theorem 3.25, p. 124.

**Continuous characters of the units.** W(A) = Hom_cts(ℤ_pˣ, Aˣ) for a complete normed commutative
ℚ_p-algebra A, with restrictions to the torsion and principal parts, evaluation, functoriality in A,
and the bijections W(A) ≅ Hom(μ_{p−1}, Aˣ) × Hom_cts(1 + pℤ_p, Aˣ) (odd p, from
`TauCeti.padicIntUnitsEquivProd`) and W(A) ≅ Hom({±1}, Aˣ) × Hom_cts(1 + 4ℤ₂, Aˣ) (p = 2, built here
on `TauCeti.unitsPlusMinus`). This splits points only: for odd p the idempotents of §4.6 split
D(ℤ_pˣ, O) into p − 1 copies of O⟦T⟧, whereas ℤ₂[{±1}] is local and the two torsion components at p
= 2 split only after inverting 2. *Checks:* x ↦ x^k and x ↦ x^{k′} have the same torsion restriction
iff k ≡ k′ mod p − 1 (odd p) or mod 2 (p = 2), and at p = 2 the exponents 1, 2 are congruent mod 1
but differ at −1; for odd p the Teichmüller character ω has `W.equivProd`(ω) = (inclusion, 1)
although ω ≠ 1; at p = 2 the sign character has `W.equivProd`(sgn) = (sgn|_{±1}, 1) and (1 − [−1])/2
∉ ℤ₂[{±1}]. *Lean:* the twist checks are `example`s in `UniversalCharacter`.

**Principal characters and the open unit disc.** For A = ℂ_p and a topological generator u of 1 +
pℤ_p (of 1 + 4ℤ₂ when p = 2; `exists_topologicalClosure_zpowers_eq_unitsPrincipal`), evaluation at u
identifies Hom_cts(1 + pℤ_p, ℂ_pˣ) with {z : |z − 1| < 1}, so W(ℂ_p) is a disjoint union of p − 1
(two, for p = 2) open discs indexed by the torsion characters.

**Measures as bounded functions.** F_μ(χ) = ι_j(μ)(χ) for μ ∈ D(ℤ_pˣ, O) (`W.measureFun`) satisfies
|F_μ(χ)| ≤ ‖ι_j(μ)‖ ≤ 1, F_{μ⋆ν} = F_μF_ν, F_{δ_a}(χ) = χ(a), μ ↦ F_μ is injective, and on each disc
F_μ is the Amice transform of the corresponding component evaluated at the disc coordinate. This is
an extension of an integral measure, not a claim that every ℂ_p-valued measure is one. *Checks:*
F_{δ_a}(x ↦ x^k) = a^k, F_{δ_a⋆δ_b} = F_{δ_a}F_{δ_b}, while F_{δ_a+δ_b}(x) = a + b; F_{δ_a−δ_b}
vanishes at the trivial character but not at x ↦ x; the bound is attained by δ_a.

**Pseudo-measures as functions with at most a simple pole.** For a pseudo-measure λ on ℤ_pˣ with
O-coefficients and χ ≠ 1, choose g with χ(g) ≠ 1 and put F_λ(χ) = F_{([g]−1)λ}(χ)/(χ(g) − 1)
(`W.pseudoMeasureFun`); cross-multiplication makes it independent of g, F_λ = F_μ on measures,
F_{μ⋆λ} = F_μF_λ, and the only possible pole is a simple one at the trivial character (([u] − 1)λ is
a measure and χ(u) − 1 is the disc coordinate). A fixed clearing element fails: at p = 2 the sign
character has χ(5) = 1, so the formula with g = 5 is 0/0, and for odd p a Teichmüller character ω^i
≠ 1 is trivial on 1 + pℤ_p. *Checks:* λ = 1 gives F_λ = 1 off the trivial character; for odd p, u =
1 + p and e₁ the trivial-torsion idempotent, λ = e₁/([u] − 1) is a pseudo-measure with a simple pole
on the trivial-torsion component and F_λ(ω^i) = 0 at nontrivial Teichmüller characters, while 1/([u]
− 1) is not a pseudo-measure; at p = 2, (1 + [−1])/([5] − 1) is one, finite at the sign character
only with g = −1. *Needs:* §1.7, §3.1.

**The universal character, adic case.** κ : ℤ_p → (ℤ_p⟦T⟧)ˣ, a ↦ (1 + T)^a = `binomialSeries` a, so
κ(n) = (1 + T)^n and κ(1) = 1 + T, with ℤ_p⟦T⟧ ≅ ℤ_p⟦ℤ_p⟧ through `powerSeriesCoordinate`. For S a
complete Hausdorff linearly topologized commutative ℤ_p-algebra with continuous action and z ∈ S
topologically nilpotent (`PowerSeries.HasEval` z), `PowerSeries.aeval` z is the unique continuous
map with T ↦ z (`aeval_unique`), a ↦ aeval_z(κ(a)) is a continuous character with value 1 + z at 1,
and every continuous character χ with χ(1) − 1 topologically nilpotent is of this form. *Checks:*
the T-coefficient of κ(n) is n; κ(−1) = Σ_k (−T)^k, not 1 − T; z = 0 gives the trivial character, z
= p gives n ↦ (1 + p)^n; p − 1 is not topologically nilpotent in ℚ_p, so no continuous map sends T
to p − 1 and n ↦ p^n is not a continuous character. *Lean:*
`UniversalCharacter.exists_character_of_hasEval`, `UniversalCharacter.eq_aeval_binomialSeries`.

**The universal character, normed case.** For a complete normed commutative ℚ_p-algebra A (its
topology is not linear, so `aeval` does not apply) and ‖z‖ < 1, F ↦ Σ_n coeff_n(F)z^n converges and
is the unique continuous map with T ↦ z; there is a unique continuous character with value 1 + z at
1, namely a ↦ Σ_n binom(a, n)z^n. Only this small-norm subfamily is parametrised by the norm disc;
for ℂ_p-valued points it is all principal characters. The adic and normed cases are separate, and
the condition is on the norm, not on the spectral radius. *Checks:* T ↦ p exists here but not
through `aeval`, since ℚ_p is not linearly topologized. Negative control: in ℚ_p[ε]/(ε²) with the
coefficient-maximum norm, a ↦ 1 + aε is a continuous character with ‖χ(1) − 1‖ = 1 (evaluation F ↦
coeff₀F + coeff₁F ε exists), so it lies outside the norm disc. *Lean:*
`UniversalCharacter.existsUnique_character_of_norm_lt_one`, with the dual-number control as an
`example`.

**Several variables.** For G = H × ℤ_p^d with H finite abelian, the universal character G → (O⟦T₁,
…, T_d⟧[H])ˣ sends (h, a) to [h]∏_i(1 + T_i)^{a_i}; a continuous character into Aˣ is a character of
H times d characters of ℤ_p; for ℂ_p-valued points the principal part is the open polydisc z_i =
χ(e_i) − 1, and for general A only the subfamily with ‖χ(e_i) − 1‖ < 1 is parametrised; the
comparison with the torsion components is coordinatewise, with the integral/generic distinction
above when p divides #H. *Needs:* `MvPowerSeries`.

### Examples

- At p = 2, (1 − [−1])/2 ∉ ℤ₂[{±1}]: the two components of W(ℚ₂) split only generically.
- For odd p, e₁/([1 + p] − 1) has a simple pole on the trivial-torsion component and vanishes at the
  nontrivial Teichmüller characters.
- κ(−1) = Σ_k (−T)^k; T ↦ p − 1 extends to no continuous map ℤ_p⟦T⟧ → ℚ_p.

### Dependencies

Layers 1–3 (`extendCoefficients`, the Amice unit projector, the bounded-series range,
`pseudomeasures`, `unitCharacterEval`); `charIdempotent` of §4.6 is cited only to say which
splittings are integral. Tau Ceti `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`,
`TauCeti.padicIntUnitsEquivProd`, `TauCeti.unitsPlusMinus`; Mathlib `PadicComplex`,
`PowerSeries.binomialSeries`, `PowerSeries.HasEval`, `PowerSeries.aeval`.

## Layer 4: Weierstrass theory and module structure

Weierstrass theory for Λ = O⟦T⟧ on Mathlib's factorization, the structure theorem for finitely
generated Λ-modules up to pseudo-isomorphism, μ and λ, characteristic ideals, character idempotents
and Galois-orbit components, the Iwasawa coordinate over O, the initial Fitting ideal, and the
growth formulas. Standing assumptions: A is a noetherian integrally closed domain with fraction
field K and height-one primes P(A) (A_𝔭 a DVR, A = ⋂ A_𝔭), factorial wherever the characteristic
ideal is used; O is a complete DVR with uniformizer ϖ and finite residue field 𝔽 of characteristic p
(NSW specialises to O = ℤ_p from (5.3.6) on); Γ ≅ ℤ_p with generator γ, T = γ − 1, Γ_n of index p^n;
H is finite abelian with #H a unit of O. Modules are finitely generated; λ and F are defined through
the torsion submodule; statements about characteristic ideals, additivity and orders assume torsion.

### 4.1 Pseudo-null modules and pseudo-isomorphism

References: NSW (5.1.4)–(5.1.6), pp. 269–271; §3, Exercise 1, p. 300; RJW §13.1, p. 189; [Stacks
0AVB](https://stacks.math.columbia.edu/tag/0AVB).

**The reflexive hull.** For a finitely generated torsion-free A-module M, the image of M** in M ⊗ K
is ⋂_{𝔭∈P(A)} M_𝔭; the image of M equals it exactly when M is reflexive. *Checks:* for A = ℤ_p⟦T⟧
and M = (p, T), every M_𝔭 at height one is A_𝔭, so the intersection and M** are A while M is proper;
M** cannot be replaced by M. Reflexive modules are torsion-free
(`Module.IsReflexive.to_isTorsionFree`).

**Pseudo-null modules.** M is pseudo-null if it is finitely generated with M_𝔭 = 0 at every prime of
height ≤ 1; equivalently every prime over ann(M) has height ≥ 2; pseudo-null modules are torsion;
over a Dedekind domain only 0 is pseudo-null; over a two-dimensional noetherian normal local domain
with finite residue field, pseudo-null means finite; submodules, quotients and extensions of
pseudo-null modules are pseudo-null. *Checks:* over Λ = ℤ_p⟦T⟧, Λ/(p, T) = 𝔽_p is pseudo-null and
Λ/(p) is not; over ℤ_p, ℤ/p is not pseudo-null. *Lean:* `TauCeti.Iwasawa.IsPseudoNull`,
`TauCeti.Iwasawa.isPseudoNull_iff_finite`.

**Pseudo-isomorphisms.** f : M → N with pseudo-null kernel and cokernel; equivalently f_𝔭 is an
isomorphism at every prime of height ≤ 1. Multiplication by α with supp(A/α) ∩ supp(M) ∩ P(A) = ∅ is
one (NSW Lemma 5.1.6); composites are; for torsion modules a pseudo-isomorphism exists in the
reverse direction; over O⟦T⟧ it means finite kernel and cokernel. *Checks:* p : Λ/(T) → Λ/(T) is
one; 𝔪 → Λ is one but no pseudo-isomorphism Λ → 𝔪 exists (NSW §3, Exercise 1), so the relation is
not symmetric off torsion; over a Dedekind domain they are isomorphisms. *Lean:*
`TauCeti.Iwasawa.IsPseudoIsomorphism`.

### 4.2 Structure of finitely generated Λ-modules

References: NSW (5.1.7)–(5.1.10), pp. 270–273; Theorem 5.3.8, p. 292; (5.3.19)–(5.3.20), pp.
298–300; RJW Theorem 13.1, p. 189.

**Torsion splitting.** (`Submodule.torsion`) Over A, M → T_A(M) ⊕ M/T_A(M) is a pseudo-isomorphism
up to choice; M → M** is a pseudo-isomorphism for torsion-free M; over a two-dimensional regular
local ring, finitely generated reflexive modules are free.

**Structure over a two-dimensional regular local ring.** (`IsRegularLocalRing`) M is
pseudo-isomorphic to A^r ⊕ ⊕_i A/𝔭_i^{n_i} with 𝔭_i of height one and n_i ≥ 1, where r = dim_K M ⊗
K, {𝔭_i} = supp T_A(M) ∩ P(A), and the n_i are unique (NSW Theorem 5.1.10).

**Structure theorem for Iwasawa modules.** M is pseudo-isomorphic to Λ^r ⊕ ⊕_i Λ/(ϖ^{m_i}) ⊕ ⊕_j
Λ/(F_j^{n_j}) with F_j irreducible distinguished, m_i, n_j ≥ 1, and r, the multisets (m_i), (n_j)
and the ideals (F_j) determined by M. The vertical factors are powers of ϖ, not of p: RJW Theorem
13.1 writes Λ/(p^{n_i}) over O_L⟦T⟧, which fails for ramified L. *Needs:* §4.1, §4.3. *Lean:*
`TauCeti.Iwasawa.exists_pseudoIso_elementary`, on `TauCeti.Iwasawa.Elementary`.

**Freeness criteria over ℤ_p.** (`Module.Free`) For O = ℤ_p, with H₀ = M/TM and H₁ = M[T]: M has
projective dimension ≤ 1 iff it has no nonzero finite submodule iff M[ω_n] is ℤ_p-free for some n; M
is free iff M[T] = 0 and M/TM is free; rank_Λ M + rank M[T] = rank M/TM; a minimal resolution 0 →
Λ^{d₂} → Λ^{d₁} → Λ^{d₀} → M → 0 has d₀ = dim_{𝔽_p}(H₀/p), d₁ = dim H₀[p] + dim H₁/p, d₂ = dim
H₁[p]. *Checks:* M = Λ gives (1, 0, 0); M = 𝔽_p gives (1, 2, 1), the Koszul resolution. *Needs:*
§4.7 (M_δ).

**The minimal resolution over a general O.** For O with residue field 𝔽 = O/ϖ the same holds with d₀
= dim_𝔽(H₀/ϖ), d₁ = dim_𝔽 H₀[ϖ] + dim_𝔽(H₁/ϖ), d₂ = dim_𝔽 H₁[ϖ] (the O-lengths), the differentials
having entries in the maximal ideal; the proof uses only that Λ is regular local of dimension two
with parameters ϖ, T. The 𝔽_p-form is false for O ≠ ℤ_p. *Checks:* O = ℤ_p recovers the previous
target; M = Λ_O gives (1, 0, 0) for every O; M = 𝔽 gives (1, 2, 1), not (f, 2f, f). Negative
control: over O = ℤ_p[√p] (e = 2, f = 1), M = Λ_O has d₀ = 1 while dim_{𝔽_p}(O/p) = 2. *Lean:*
`TauCeti.Iwasawa.exists_minimal_resolution`.

### 4.3 Weierstrass theory of O⟦T⟧

References: NSW (5.3.1)–(5.3.6), pp. 289–291; (5.3.13), p. 294.

**Λ is regular local of dimension two.** The maximal ideal is (ϖ, T), the residue field is 𝔽, and Λ
is regular local of dimension two with parameters ϖ, T. *Lean:*
`TauCeti.Iwasawa.powerSeries_isRegularLocalRing`.

**Mathlib's Weierstrass theory as NSW's division and preparation.** For a monic F over a commutative
ring, multiplication by `AdjoinRoot.root` F has characteristic polynomial F in the power basis (also
for F = 1); transport through `Polynomial.IsDistinguishedAt.algEquivQuotient` identifies T on
O⟦T⟧/(f) with its distinguished factor. Mathlib needs `IsAdicComplete` (maximalIdeal O) O.

**Factorisation and height-one primes.** Every f ≠ 0 is ϖ^μ · F · u with F distinguished and u a
unit (divide by ϖ^μ, μ the least valuation of a coefficient, and apply
`PowerSeries.exists_isWeierstrassFactorization`); the height-one primes are (ϖ) and (F) with F
irreducible distinguished; Λ/(F) ≅ O[X]/(F) is free of rank deg F
(`Polynomial.Monic.free_quotient`). *Lean:* `TauCeti.Iwasawa.exists_pow_mul_distinguished_mul_unit`,
`TauCeti.Iwasawa.height_one_prime_iff`.

**Cyclotomic polynomials.** ω_n is distinguished of degree p^n at 𝔪_O (from the library statement at
(p)), ω_n = ∏_{m≤n} ξ_m with each ξ_m distinguished of degree p^{m−1}(p − 1) (ξ₀ = T), and for O =
ℤ_p each ξ_m is irreducible (Eisenstein for m ≥ 1, via
`Polynomial.cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt`); irreducibility is stated for ℤ_p
only. *Checks:* over ℤ₂[i], ξ₂ = T² + 2T + 2 = (T − (i − 1))(T − (−i − 1)) splits. *Lean:*
`TauCeti.Iwasawa.xi_irreducible_padicInt`, with the splitting as an `example`.

### 4.4 The invariants μ and λ

References: NSW (5.3.9) with Remarks 1–3, pp. 292–293.

**μ, λ and the characteristic polynomial.** For finitely generated M, μ(M) is the length at (ϖ) of
the torsion submodule, F_{M,γ} = ∏ F_j^{n_j} the monic product of the horizontal factors of an
elementary decomposition of the torsion submodule (independent of the decomposition; free and
vertical factors contribute 1), and λ(M) = deg F_M = Σ n_j deg F_j. For torsion M, λ = dim_{Frac O}
M ⊗_O Frac O and F_M is the characteristic polynomial of T there; μ, λ are additive and F_M
multiplicative in short exact sequences of torsion modules; a torsion M is finite iff μ = λ = 0; a
linear equivalence preserves all three. *Checks:* M = Λ/(ϖ): μ = 1, λ = 0, F_M = 1 over every O; for
O = ℤ_p, M = Λ/(T² + pT + p): μ = 0, λ = 2, F_M = T² + pT + p; M = 𝔽_p: μ = λ = 0, F_M = 1. *Needs:*
§4.2, §4.3. *Lean:* through `TauCeti.Iwasawa.charIdeal_elementary` and the growth theorems, which
take the elementary data as hypotheses.

**Independence of the generator.** A change γ ↦ γ^u, u ∈ ℤ_pˣ, is the automorphism σ(T) = (1 + T)^u
− 1 (Tau Ceti's `powerSeriesCoordinate_padicPow_apply`); for a σ-semilinear N ≃ M the modules have
the same μ, λ and rank, while F_{M,γ} changes: with γ ↦ γ², Λ/(T − p) becomes Λ/(T − (2p + p²)).

### 4.5 The Iwasawa coordinate and the initial Fitting ideal

References: NSW (5.3.5), pp. 290–291; Stacks Section 15.8 (Tags 07Z6, 07Z8, 07Z9, 07ZA); RJW
Proposition 3.16 and Theorem 3.25, pp. 121–125; Dasgupta–Kakde Appendix B.2, p. 93.

**The level coordinate over O.** For O local noetherian, complete for 𝔪 with residue characteristic
p, there is an O-algebra map O⟦T⟧ → O[ℤ/p^n], T ↦ [1] − 1, preserving every coefficient (C(a) ↦
a·[0]), surjective with kernel (ω_n), continuous for the (𝔪, T)-adic and 𝔪-adic topologies,
compatible with transitions; it is the unique O-algebra map with that value on T, since ω_n maps to
0 and division by the distinguished ω_n reduces every series to a polynomial. They assemble into an
injective map to ∏_n O[ℤ/p^n] with image the compatible families (⋂_n (ω_n) = 0), and, through
`TauCeti.completedGroupAlgebra.lift`, into an O-algebra homeomorphism O⟦T⟧ ≅ O⟦ℤ_p⟧ with T ↦ [1] −
1; for O = ℤ_p it is Tau Ceti's `powerSeriesCoordinate`. The hypotheses are needed: for O = ℚ, ω_n
generates (T) and for n > 0 no ring map sends T to [1] − 1. In characteristic p, ω_n = T^{p^n}.
*Checks:* level 0 is the constant coefficient; (1 + T)^k ↦ [k]; over ℤ_p at level n ≥ 1, ω_n maps to
0 and T^{p^n} does not, and for p = 2, n = 1, t = [g] − 1 has t² = −2t ≠ 0; over 𝔽_p the two agree.
Negative control: for O = ℤ_p⟦S⟧, precomposing with S ↦ S + T fixes kernels, transitions and level
0, but sends C(S) to S + ([1] − 1), so it is not an O-algebra map. *Lean:*
`TauCeti.Iwasawa.exists_levelCoordinate`, `TauCeti.Iwasawa.levelCoordinate_unique`,
`TauCeti.Iwasawa.exists_completedCoordinate`, `TauCeti.Iwasawa.omega_eq_X_pow_of_charP`, with the
checks as `example`s.

**The measure comparison in the coordinate.** For Γ = ℤ_p with generator 1, the comparison of §1.7
followed by the inverse of `powerSeriesCoordinate` is the Amice transform: both send δ_a to (1 +
T)^a, both are continuous ℤ_p-algebra maps, and Diracs span a weakly dense subspace; at level n it
is the finite projection along ρ_n. It is a consequence of both constructions, so neither is defined
through it. *Checks:* δ₁ ↦ 1 + T, δ₀ ↦ 1, δ₋₁ ↦ (1 + T)⁻¹ with T-coefficient −1 (using T ↦ [1] would
send δ₁ to T and fail δ₀ ↦ 1). *Lean:*
`TauCeti.Iwasawa.exists_algEquiv_eq_powerSeriesCoordinate_amiceTransform`.

**The initial Fitting ideal.** For a finite R-module M, Fitt⁰ is `TauCeti.fittingIdeal` R M 0, with
presentation independence, base change, Fitt⁰(R/I) = I, invariance, monotonicity, the free-module
jumps and the fibre criterion in the library. New here: Fitt⁰(M) ⊆ ann(M), Fitt⁰(M × N) =
Fitt⁰(M)Fitt⁰(N), and Fitt⁰(M) = R iff M = 0 (Stacks 07ZA (2), (6)). StableReduction layer 1 uses
the same declaration. *Checks:* Fitt⁰(R/(a)) = (a); Fitt⁰(R^n) = 0 for n ≥ 1 over R ≠ 0 and Fitt⁰(0)
= R; Fitt⁰_ℤ(ℤ/2 ⊕ ℤ/2) = (4) while the annihilator is (2). *Lean:*
`TauCeti.Iwasawa.fittingIdeal_le_annihilator`, `TauCeti.Iwasawa.fittingIdeal_prod`,
`TauCeti.Iwasawa.fittingIdeal_eq_top_iff`.

### 4.6 Characteristic ideals

References: RJW Definition 13.3, Lemmas 13.4 and 13.6, Definition 13.5, p. 190; NSW (5.3.9) and
Remarks 2–3, pp. 292–293.

**The characteristic ideal.** For finitely generated torsion M over a noetherian normal factorial A,
div(M) = Σ_𝔭 length_{A_𝔭}(M_𝔭)[𝔭] over height-one primes (`charDivisor`, finitely supported) and
char(M) = ∏ 𝔭^{length}, principal. It is multiplicative in short exact sequences, invariant under
pseudo-isomorphism, equal to A iff M is pseudo-null, char(A/(f)) = (f), and transported along a ring
automorphism σ by σ⁻¹. *Checks:* char(Λ/(T² − p)) = (T² − p); char(Λ/(p, T)) = Λ while Fitt⁰ = (p,
T); div(0) = 0; div(Λ/(T²)) is 2 at (T); Λ/(T²) and Λ/(T) ⊕ Λ/(T) both have char = (T²) and are not
pseudo-isomorphic in either direction (any map Λ/(T²) → Λ/(T)² kills TΛ/(T²) ≅ ℤ_p, any map back has
image killed by T). *Lean:* `TauCeti.Iwasawa.charIdeal`, `TauCeti.Iwasawa.charIdeal_quotient_span`,
`TauCeti.Iwasawa.charIdeal_mul_of_exact`, `TauCeti.Iwasawa.charIdeal_eq_of_pseudoIso`, with the two
checks as `example`s.

**char = (ϖ^μ F_M).** On Λ = O⟦T⟧, char(M) = (ϖ^{μ(M)} F_{M,γ}); on an elementary torsion module it
is (ϖ^{Σ m_i} ∏ F_j^{n_j}). *Lean:* `TauCeti.Iwasawa.charIdeal_elementary`.

**Base change and restriction of scalars.** (`Algebra.TensorProduct`, `LinearMap.det`) For a finite
free extension O → O′ of complete DVRs with finite residue fields, char_{Λ_{O′}}(Λ_{O′} ⊗ M) is the
extension of char_{Λ_O}(M). For O finite free over ℤ_p with char_{Λ_O}(M) = (f), M as a
ℤ_p⟦T⟧-module has char generated by the norm det(f · on O⟦T⟧). *Checks:* M = Λ_O/(ϖ) with O′ of
ramification e has char (ϖ′^e), μ′ = eμ (μ′ = μ if unramified); Λ_O/(F) has char (F) on both sides;
p ≡ 3 mod 4, O = ℤ_p[i], M = O⟦T⟧/(T − ip) has char (T² + p²) over ℤ_p⟦T⟧; M = O⟦T⟧/(p) with [O :
ℤ_p] = ef has char (p^{ef}) over ℤ_p⟦T⟧, so μ_{ℤ_p} = ef while μ_O = e.

**Character idempotents and isotypic decomposition.** For O a domain with #H a unit and enough roots
of unity, e_ω e_{ω′} = δ_{ωω′}e_ω and Σ_ω e_ω = 1; M^{(ω)} = e_ω M is exactly the set on which h
acts by ω(h) (the eigencharacter criterion; e_ω m = m is the equivalent fixed-point form), and M ≅
∏_ω M^{(ω)}. *Checks:* H = {1, h}, p odd: e_± = (1 ± h)/2; for ℤ_pˣ, p odd, the ω^i take values in
ℤ_p; H = C_p: 1/p ∉ O and ℤ_p[C_p] is local; H = 1 gives the whole module; for C₂ the ranges are the
vectors fixed by h and those negated by h. *Lean:* `TauCeti.Iwasawa.charIdempotent`,
`TauCeti.Iwasawa.charIdempotent_mul`, `TauCeti.Iwasawa.sum_charIdempotent`.

**The characteristic ideal of the components.** For components M_i over A, `charIdealProduct` is the
ideal of the product ring ∏_i A whose i-th coordinate is char(M_i); over Λ(Γ × H) ≅ ∏_ω Λ this is
the characteristic ideal of M. It is not the characteristic ideal over the single ring Λ by
restriction of scalars, which is ∏_ω char(M^{(ω)}). *Checks:* the zero module gives the unit ideal;
H = 1, M = Λ/(T²) gives (T²); M = Λ/(T) in the plus component and 0 in the minus component gives
((T), Λ); two components Λ/(T) give ((T), (T)), containing (T, T) but not (T², 1), while
char_Λ(Λ/(T) ⊕ Λ/(T)) = (T²). *Lean:* `TauCeti.Iwasawa.charIdealProduct`.

**Nonsplit coefficients: Galois-orbit components.** Let L/K be a finite unramified Galois extension
of K = Frac(O) containing the character values of H (#H a unit of O), with O′ the integral closure
of O in L (`Algebra.Unramified`). O → L is injective; characters H → Lˣ take values in O′ˣ; the full
group Gal(L/K) acts by χ ↦ σ ∘ χ. Evaluation at orbit representatives (`MonoidAlgebra.lift`) is an
O-algebra isomorphism O[H] ≅ ∏_{[χ]} O[χ(H)], each factor O[ζ_m] (m the order of χ) a finite free
unramified DVR over O in which ϖ stays irreducible, independent of representatives; for split O the
orbits are singletons. *Checks:* O = ℤ_p, H = C₂, p odd: ℤ_p × ℤ_p; O = ℤ_p, H = C₃, p ≡ 2 mod 3:
the faithful characters form one orbit and ℤ_p[C₃] ≅ ℤ_p × ℤ_p[ζ₃], two factors not three; for
H = C_p the order is not a unit and ℤ_p[C_p] is local. Negative controls: the residue map ℤ₃ → 𝔽₃ is
not faithful; for L = ℚ₂(ζ₃)(α), α³ = 2ζ₃, no automorphism sends ζ₃ to ζ₃² (otherwise
(σα/α)³ = ζ₃, impossible in 𝔽₄), so automorphism orbits would give ranks 1 + 2 + 2 = 5 instead of
3; this L is not Galois. *Lean:* `TauCeti.Iwasawa.character_orbit_coefficients`, with both
negative controls as `example`s.

### 4.7 Cyclotomic polynomials and growth

References: NSW (5.3.11)–(5.3.18), pp. 293–298.

**The δ-submodule.** (`delta_submodule`, `cyclotomic_primary_submodule`) M_δ = ⋃_n ker(ω_n) is a
Λ-submodule (x ∈ M_δ iff ω_n x = 0 for some n), preserved by linear maps and equivalences. M_cycl is
the saturation C₀ = 0, C_{r+1} = preimage of δ(M/C_r); for finitely generated M it is finite over
ℤ_p and δ(M/M_cycl) = 0. *Checks:* M = 0 and M = Λ have M_δ = 0; M = Λ/(T) has M_δ = M; for Λ/(T²),
M_cycl is everything while M_δ = TΛ/(T²) is proper and M/M_δ = Λ/(T) is ℤ_p-free.

**The transition polynomial.** ν_{n,n₀} = ω_n/ω_{n₀−1} = ∏_{n₀≤j≤n} ξ_j. On Λ/(T), ω_n acts by 0
while ν_{n,n₀} acts by p^{n−n₀+1} (n₀ ≥ 1), with ϖ-valuation e(n − n₀ + 1); the horizontal growth
input uses ν, not ω_n, which is justified only after excluding the cyclotomic factors. *Lean:*
`TauCeti.Iwasawa.growthTransition`, `TauCeti.Iwasawa.growthTransition_constantCoeff`.

**Iwasawa's growth formula over ℤ_p.** For finitely generated torsion M over ℤ_p⟦T⟧ with μ = μ(M), λ
= λ(M), and n₀ such that M/ν_{n,n₀}M is finite for every n ≥ n₀ (NSW's choice, n₀ with ω_{n₀−1}
carrying M_δ into its coefficient torsion, is one), #(M/ν_{n,n₀}M) = p^{μp^n + λn + ν} for all large
n, with ν ∈ ℤ independent of n (NSW Proposition 5.3.17 and Lemma 5.3.18); n₀ = 0 gives #M/ω_nM. The
exponent is specific to ℤ_p. *Checks:* M = Λ/(p): #M/ω_nM = p^{p^n} (μ = 1, λ = ν = 0); M = Λ/(T −
p), p odd: ω_n acts by (1 + p)^{p^n} − 1, of valuation n + 1, so p^{n+1} (λ = 1, ν = 1); M = 𝔽_p: p
for every n. *Lean:* `TauCeti.Iwasawa.card_quotient_growthTransition` (μ and λ entered through an
elementary pseudo-isomorphism).

**The growth formula over a mixed-characteristic O.** For O of characteristic zero with p = uϖ^e (u
a unit, e ≥ 1) and residue field of order p^f, the ϖ-normalised μ, and n₀ as above, #(M/ν_{n,n₀}M) =
p^{fμp^n + efλn + ν} for large n. The proof is NSW's on the elementary module: #Λ/(ϖ^m, ν) =
(p^f)^{m(p^n − p^{n₀−1})} and v_ϖ(det(ν on Λ/(F))) = e·d·n + const for deg F = d. It specialises to
the ℤ_p statement for e = f = 1. It is false in equal characteristic: for O = 𝔽⟦ϖ⟧ and M = O⟦T⟧/(T −
ϖ) ≅ O (μ = 0, λ = 1), ω_n = ϖ^{p^n} on M and #M/ω_nM = (#𝔽)^{p^n}. *Checks:* O unramified
quadratic, M = O⟦T⟧/(p): #M/ω_nM = p^{2p^n}, missed by the ℤ_p formula; O = ℤ_p[√p], M = O⟦T⟧/(T −
√p): p^{2n+1} = p^{efλn+ν}. *Lean:* `TauCeti.Iwasawa.card_quotient_growthTransition_general`, with
the equal-characteristic failure as an `example`.

**Euler characteristic of finite coinvariants.** (`coinvariants_euler_product`) When M^{Γ_n} and
M_{Γ_n} are both finite (equivalently F_M is prime to ω_n), their orders have a quotient determined
by the invariants of M.

### Examples

- Λ/(T²) and Λ/(T) ⊕ Λ/(T) have char (T²) and are not pseudo-isomorphic.
- The minimal resolution of 𝔽 = Λ/(ϖ, T) is the Koszul complex, (1, 2, 1), over every O.
- Over ℤ_p[√p], O⟦T⟧/(T − √p) has #M/ω_nM = p^{2n+1}; over 𝔽⟦ϖ⟧ the growth formula fails.
- ℤ_p[C₃] ≅ ℤ_p × ℤ_p[ζ₃] for p ≡ 2 mod 3.

### Dependencies

Layer 1 (§1.2, §1.7) and Layer 2 (§2.4, §2.7) for the comparison in the coordinate; the Galois-orbit
decomposition uses `MonoidAlgebra.lift` directly, and Layer 6 consumes the idempotents of §4.6.
Mathlib: `LocalizedModule`, `Module.IsReflexive`, `Module.length`, `IsRegularLocalRing`, the
Weierstrass factorization, `Polynomial.IsDistinguishedAt`, `LinearMap.charpoly`,
`Algebra.Unramified`, `IsGalois`. Tau Ceti: `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`,
`isDistinguishedAt_one_add_X_pow_sub_one`, `TauCeti.fittingIdeal` (shared with StableReduction).

## Layer 5: determinants, specialization and exactness

Determinant lines of perfect complexes, their rational trivialization and specialization, and the
exactness of compact inverse systems. The determinant carrier is not at the pins and is a target of
this layer; the Lean records only the sign and rank witnesses.

### 5.1 Determinant lines of perfect complexes

Standing assumptions: A is a commutative ring; perfect complexes are bounded complexes of finite
projective A-modules (`HomologicalComplex` over `ModuleCat` A); a graded line is an invertible
module (`Module.Invertible`) with a locally constant parity Spec A → ℤ/2. The conventions are those
of the Conventions section.

References: Knudsen–Mumford, Chapter I, pp. 19–25 (Definition 1, pp. 23–24; Theorem 1, p. 25);
[Stacks 0FJ9](https://stacks.math.columbia.edu/tag/0FJ9), [Stacks
0FJI](https://stacks.math.columbia.edu/tag/0FJI); RJW Definition 13.3, Lemma 13.6, p. 190.

**Line modules and the determinant of a finite projective module.** For any finite projective P, the
locally constant rank Spec A → ℕ has finite image; the clopens U_r = {rank = r} give A = ∏_r A_r and
P = ∏_r P_r with P_r of constant rank r. `projectiveDeterminant` P = ∏_r ⋀^r_{A_r} P_r is
invertible, independent of refinements of the decomposition, functorial in isomorphisms, compatible
with direct sums and with every base change A → A′; its parity is x ↦ rank(P_x) mod 2. For constant
rank r it is (⋀^r P, r mod 2), computed with Mathlib's `exteriorPower` and Tau Ceti's
`exteriorPower.map_top_eq_det_smul`. Graded lines: tensor adds parity, base change pulls it back,
the symmetry is (−1)^{εε′} on each clopen piece, the inverse of (L, ε) is (Hom(L, A), ε). This
ring-level API is the one AlgebraicVectorBundles L0C imports; its affine sheaf determinant is the
sheaf associated with `projectiveDeterminant`, compatibly with pullback and determinant maps, and
neither side introduces a second ring-level determinant. *Checks:* ⋀¹A = A with odd parity; ⋀⁰P = A,
even; the swap of the two summands of A² acts on ⋀²A² by −1; for A = k × k and P = (1, 0)A the ranks
on the two points are 1 and 0, the determinant has underlying module A, and no single rank or scalar
parity describes it. *Lean:* the swap and the rank-(1, 0) checks are `example`s.

**The determinant of a perfect complex.** (`detLine`) det_A(P) = ⊗_i det(P^i)^{(−1)^i} with its
parity function, functorial in isomorphisms; a quasi-isomorphism induces a canonical isomorphism,
compatible with composition; a degreewise split short exact sequence gives det P ≅ det P′ ⊗ det P″;
det commutes with base change; det(P^∨) ≅ (det P)⁻¹; det(P[1]) = (det P)⁻¹ with the same parity; an
acyclic perfect complex has a canonical trivialization det P ≅ A. For [M --f--> N] with f an
isomorphism the trivialization is m^∨ ⊗ n ↦ m^∨(det(f)⁻¹ n), of coefficient det(f)⁻¹ in
independently fixed bases and 1 in compatible bases m, f(m); Stacks 0FJI's canonical section A → det
P, 1 ↦ det f, is its inverse. *Checks:* A in degree 0 is odd and A ⊕ A[1] is even; for A² in degree
0 the swap acts by −1; for [A --a--> A] in degrees −1, 0 with a regular, det ≅ A (even), H⁰ = A/(a),
the trivialization after inverting a sends 1 to a⁻¹ and the canonical section sends 1 to a, so det P
sits in A[1/a] as a⁻¹A; det(P[0]) = (⋀^r P, r mod 2).

**Rational trivialization and the characteristic ideal.** (`detLine_acyclic`) For Λ = O⟦T⟧ and a
perfect complex P of Λ-modules whose cohomology is finitely generated and torsion, P ⊗ Frac Λ is
acyclic and the image of det_Λ(P) under the trivialization det_Λ(P) ⊗ Frac Λ → Frac Λ is ∏_i
char(H^i(P))^{(−1)^{i+1}}. Pulling the lattice back through the inverse section gives the same
fractional ideal and exponent; the exponent (−1)^i belongs to the inverse determinant with its dual
trivialization. The identification with the alternating product of characteristic ideals is the
specification here. *Checks:* [Λ --a--> Λ] in degrees −1, 0 has image a⁻¹Λ = char(Λ/(a))⁻¹; Λ/(a) in
degree 0 is not a complex of projectives, but quasi-isomorphism invariance makes the image depend on
H⁰ only; in degrees 0, 1 the image is aΛ, so the degree matters. *Needs:* §4.6.

**Specialization and the Tor correction.** (`detLine_baseChange`) For P perfect over Λ and A′ =
Λ/(f), det_{A′}(P ⊗ A′) = det_Λ(P) ⊗ A′ canonically, with no condition on cohomology. For f ≠ 0
there are exact sequences 0 → H^i(P)/f → H^i(P ⊗ A′) → H^{i+1}(P)[f] → 0, and H^i(P ⊗ A′) = H^i(P)/f
when f is regular on all H^i(P). The specialized determinant is a product of determinants of these
modules only when each is perfect over A′, or perfect representatives are given; that is a
hypothesis, not a consequence. *Checks:* for P = [Λ --T--> Λ] and f = T, P ⊗ A′ = [O --0--> O] with
det ≅ O even, while O in degree 0 has (O, odd): the underlying lines agree, the graded ones do not,
and the Tor term H⁰(P)[T] = O corrects this; for f = T² the specialized determinant exists but both
cohomology modules O have infinite projective dimension over Λ/(T²) (resolution ⋯ → A′ --T--> A′
--T--> A′); a finite M has char(M) = Λ but M/TM ≠ 0 in general, so char does not commute with
specialization.

### 5.2 Compact inverse systems and topological Nakayama

References: RJW Proposition 13.13, p. 193 (exactness of an inverse limit, there from Mittag-Leffler;
here from compactness). Exactness of inverse limits of compact modules along surjective towers is
Tau Ceti's `exists_forall_map_succ_eq_and_forall_eq_of_surjective` (directed case
`exists_forall_map_eq_of_compact_t2`).

**Topological Nakayama.** For Λ = O⟦T⟧ (or any compact local ring with finite residue field) and a
compact Hausdorff Λ-module M with continuous action: M = 0 if M/𝔪M = 0; M is finitely generated if
M/𝔪M is finite, by lifts of generators; a map of compact Λ-modules surjective mod 𝔪 is surjective.
Compactness replaces finite generation (standard; no source in this register). *Checks:* M = Λ has
M/𝔪M = 𝔽 and one generator; M = ∏_n 𝔽 with trivial T-action has M/𝔪M = M infinite and is not
finitely generated; the discrete ℚ_p/ℤ_p has quotient 0 by p. *Needs:* the maximal ideal (ϖ, T) of
§4.3, `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`.

### Examples

- [Λ --a--> Λ] in degrees −1, 0: even parity, H⁰ = Λ/(a), image a⁻¹Λ in Frac Λ; in degrees 0, 1 the
  image is aΛ.
- The swap on A² acts by −1 on ⋀²A².
- ∏_n 𝔽 is compact with M/𝔪M infinite and not finitely generated.

### Dependencies

Layer 4 (`charIdeal`, the maximal ideal of Λ). Mathlib `exteriorPower`, `Module.Invertible`,
`HomologicalComplex`, `ModuleCat`, `Module.Projective`, `Module.rankAtStalk`, `IsFractionRing`; Tau
Ceti `exteriorPower.map_top_eq_det_smul` and the compact inverse-limit lemmas. The ring-level
line-module foundation is shared with AlgebraicVectorBundles layer 0C; neither roadmap imports the
other.

## Layer 6: coefficient orders, Fitting ideals and transposes

The ring theory of coefficient orders used in integral Brumer–Stark and Euler-system arguments, in
the setting of Dasgupta–Kakde §2.2: p odd; G finite abelian, G = G_p × G′ with G_p the p-Sylow; O
the valuation ring of a finite extension of ℚ_p containing the character values of G
(`HasEnoughRootsOfUnity` O (exponent G)); Ĝ = Hom(G, Oˣ). R is an arbitrary commutative ring unless
stated. The layer states no Gorenstein property and no duality (Scope and ownership). The generic
compound-matrix algebra lives in the `Matrix` namespace.

### 6.1 Character group rings and their duals

References: Dasgupta–Kakde §2.2, pp. 15–17 (Lemma 2.2, Corollary 2.3, Lemma 2.5); §2.3, p. 18; §5.1,
p. 34; §6.1, p. 40; §7.1, p. 43; §7.2.9, p. 49.

**Evaluation at characters.** For a commutative ring O, a commutative group G and ψ : G → Oˣ, ev_ψ :
O[G] → O is Tau Ceti's `TauCeti.DiagonalizableGroup.point` ψ (ev_ψ(a g) = aψ(g); ev_1 is the
augmentation `TauCeti.MonoidAlgebra.augmentation`); for a set Ψ, ev_Ψ : O[G] → ∏_{ψ∈Ψ} O; for G
finite and O a domain, ev_ψ(Σ_g g) = 0 when ψ ≠ 1, and ev at all characters is injective (column
orthogonality). *Checks:* with h² = 1, ψ(h) = −1: ev_ψ(1 + h) = 0, ev_ψ(1 − h) = 2; for G trivial
ev₁ is bijective; for h ≠ 1 and O ≠ 0 no single ev_ψ is injective (it kills h − ψ(h)). *Lean:*
`TauCeti.charEval`, `TauCeti.jointEval`, `TauCeti.jointEval_injective`.

**Character group rings.** R_Ψ is the image of ev_Ψ, with the surjection α_Ψ : O[G] ↠ R_Ψ;
equivalently O[G]/⋂_{ψ∈Ψ} ker ev_ψ. R_∅ = 0, R_{1} ≅ O, R_Ĝ ≅ O[G]; R_Ψ is in general a proper
non-maximal order and need not be Gorenstein. *Checks:* for O a domain, #G = p not a unit and enough
roots of unity, no coordinate idempotent of ∏_Ĝ O lies in R_Ĝ; for G = ⟨g, h⟩ ≅ C_p × C_p, O local
with maximal ideal (ζ − 1) and Ψ = {1, ψ₁, ψ₂} (ψ₁(g) = ζ, ψ₁(h) = 1, ψ₂(g) = 1, ψ₂(h) = ζ), R_Ψ is
the set of triples pairwise congruent mod (ζ − 1) and R_Ψ/(ζ − 1) is local with non-principal
maximal ideal of square 0, so its socle is two-dimensional and R_Ψ is not Gorenstein; R_∅ is zero.
*Lean:* `TauCeti.charGroupRing`, `TauCeti.charGroupRing.proj`, with the first check as an `example`.

**Lattice structure.** For O a principal ideal domain, G finite and #G ≠ 0 in O, R_Ψ is free of
rank #Ψ, of finite index in ∏_Ψ O (bounded through the scaled idempotents #G·e_ψ = Σ_g ψ(g)⁻¹g,
which evaluate to #G·δ_{ψψ′}); a regular element of the product lying in R_Ψ is regular in R_Ψ, and
conversely for elements with nonzero coordinates. *Lean:* `TauCeti.charGroupRing.free`.

**Norm quotients.** For a subgroup I with norm N_I = Σ_{σ∈I} σ (`TauCeti.subgroupCharSum`) and Ψ =
{ψ : ψ|_I ≠ 1}, ker α_Ψ = N_I · O[G], so O[G]/N_I ≅ R_Ψ (Dasgupta–Kakde Lemma 2.2). *Lean:*
`TauCeti.charGroupRing.ker_proj_eq_span_norm`.

**Components.** (`MonoidAlgebra.lift`) For χ ∈ Ĝ′ with idempotent e_χ (§4.6, H = G′) and Ψ_χ = {ψ :
ψ|_{G′} = χ}, ker α_{Ψ_χ} = (1 − e_χ)O[G], so R_{Ψ_χ} ≅ e_χO[G] = R_χ; π_χ : O[G] → O[G_p], g′g_p ↦
χ(g′)g_p, is surjective with the same kernel, giving R_χ ≅ O[G_p]_χ (for any complementary
decomposition with #G′ a unit); O[G] ≅ ∏_χ R_{Ψ_χ}, the Ψ_χ partitioning Ĝ; and R_χ/N_I ≅ R_Ψ for Ψ
= {ψ ∈ Ψ_χ : ψ|_I ≠ 1} (Dasgupta–Kakde Corollary 2.3), a finite-index subring of a product of copies
of O. *Checks:* for G′ = C₂, χ the sign, π_χ(hg_p) = −g_p, π_χ((1 − h)/2) = 1, π_χ((1 + h)/2) = 0;
for G′ trivial the component map is the identity of O[G]; for G_p trivial, α(g′) ↦ χ(g′).

**Units and locality.** For Ψ finite, x ∈ R_Ψ is a unit iff every ψ(x) is a unit iff ∏_ψ ψ(x) is
(R_Ψ is integral over O). If the characters of a nonempty Ψ differ by p-power-order characters (for
instance Ψ ⊆ Ψ_χ) and O is local of residue characteristic p, R_Ψ is local with maximal ideal {x :
ψ(x) ∈ 𝔪_O} for any ψ ∈ Ψ, residue field that of O, each ev_ψ local, and 𝔪_Ψ^N ⊆ 𝔪_O R_Ψ for some N;
if O is moreover noetherian and complete and R_Ψ finite over O, then R_Ψ is a complete noetherian
local ring. *Lean:* `TauCeti.charGroupRing.isUnit_iff`, `TauCeti.charGroupRing.isLocalRing`.

**The order of a principal quotient.** For O a Dedekind domain that is infinite with finite
quotients (`Ring.HasFiniteQuotients`, derived for a DVR with finite residue field), G finite with #G
≠ 0 in O, and x ∈ R_Ψ regular, R_Ψ/xR_Ψ is finite of order #(O/∏_ψ ψ(x)) (Dasgupta–Kakde Lemma 2.5).
*Lean:* `TauCeti.charGroupRing.card_quotient_span`.

**The involution #.** # : O[G] → O[G], g ↦ g⁻¹, is the antipode (`HopfAlgebra.antipodeAlgHom`), an
involution with ψ(x^#) = ψ⁻¹(x); it maps ker α_Ψ onto ker α_{Ψ⁻¹} and induces inverse isomorphisms
R_Ψ ≅ R_{Ψ⁻¹} with (#y)(ψ⁻¹) = y(ψ), an endomorphism of R_Ψ only when Ψ⁻¹ = Ψ; ideals transport as
(xR)^# = x^#R^#. *Checks:* ψ(τ) = ζ a primitive cube root gives ψ(τ^#) = ζ²; τ − ζ ∈ ker α_{ψ} but
τ⁻¹ − ζ ∉ ker α_{ψ} in characteristic zero, so # does not preserve R_{ψ}; for G trivial # is the
identity. *Lean:* `TauCeti.sharp`, `TauCeti.charEval_sharp`, with the second check as an `example`.

### 6.2 Transposed presentations

References: Dasgupta–Kakde §6.1, equations (80)–(81), Lemma 6.1, p. 40; Appendix A.4, p. 86; proof
of Lemma B.4, equation (171), p. 93.

**The contragredient dual.** For a ring isomorphism σ : S → R and an R-module M, M^* = Hom_R(M, R)
as an S-module, (s·φ)(x) = φ(σ(s)x) (`Module.compHom`); f : M → N induces f^* functorially, and
(R^m)^* is free on the dual basis. For R = R_Ψ, S = R^#, σ = # this is Dasgupta–Kakde's rule.
*Checks:* for R = S = O[G], σ = #, (g · id)(1) = g⁻¹, which differs from g when g⁻¹ ≠ g; for σ = id
it is the ordinary dual.

**The transpose of a presentation.** For P₁ →f P₀ → M → 0 by finite projectives, M^tr = coker(f^*),
an S-module along σ, on Tau Ceti's `TauCeti.AuslanderReitenTranspose` f with scalars restricted; it
has a quotient map from P₁^*, a universal property, and depends on the presentation (unique up to
projective summands, `nonempty_linearEquiv_prod_dual`). Dasgupta–Kakde's presentations need not be
minimal, and over ℤ[G] minimal presentations need not exist. *Checks:* id : R → R has transpose 0;
R² → R, (a, b) ↦ a, presents 0 with transpose S; R →(a) R has transpose S/(σ⁻¹a). *Lean:*
`TauCeti.PresentationTranspose`.

**The Fitting ideal of the transpose.** For a quadratic presentation with matrix (a_ij), M^tr is
quadratically presented over S by (σ⁻¹(a_ji)) and Fitt_S(M^tr) = σ⁻¹(Fitt_R M) (Dasgupta–Kakde Lemma
6.1); adding a free relation summand makes Fitt⁰ of the transpose 0. *Lean:*
`TauCeti.PresentationTranspose.fittingIdeal_eq`.

**Excess generators.** For P₁ → P₀ → M → 0 with P₁, P₀ finite projective of constant ranks t and t +
s (`Module.rankAtStalk`), Fitt⁰_S(M^tr) = σ⁻¹(Fitt^s_R M); in the free case it is the ideal of t × t
minors of the transposed matrix. No freeness is assumed: over ℤ[G] constant-rank projectives need
not be free. *Lean:* `TauCeti.PresentationTranspose.fittingIdeal_eq_excess`.

### 6.3 Quadratic presentations and the initial Fitting ideal

References: Dasgupta–Kakde §2.3, Lemma 2.4 and equations (27)–(28), pp. 16–17; Remark A.7, p. 86.

**Quadratically presented modules.** A quadratic presentation of N is (m ≥ 1, φ ∈ M_m(R), π : R^m ↠
N) with range φ = ker π; m ≥ 1 is part of the definition. *Checks:* R/(a) has one of size 1 with
determinant a; 0 is presented by (1); R^m (m ≥ 1) by φ = 0. *Lean:* `TauCeti.QuadraticPresentation`,
`TauCeti.IsQuadraticallyPresented`.

**The Fitting ideal of a quadratic presentation.** Fitt(N) = (det φ), principal. *Lean:*
`TauCeti.QuadraticPresentation.fittingIdeal_eq`.

**Locally quadratic presentations.** P₁ → P₀ → M → 0 exact with P₀, P₁ finite projective of the same
constant rank. Quadratic presentations are locally quadratic; base change preserves them; over a
ring with finitely many maximal ideals (local rings, finite products of local rings such as ℤ_p[G],
O[G], R_Ψ) a locally quadratic presentation gives a quadratic one, rank 0 giving M = 0. Over a
general ring this fails: a non-principal ideal I of a Dedekind domain gives a locally quadratic I ↪
R ↠ R/I of rank 1 with R/I not quadratically presented. *Checks:* over ℤ_p × ℤ_p, ℤ_p × 0 ↪ R ↠
R/(ℤ_p × 0) is not locally quadratic (ranks 1 and 0); 0 → 0 → 0 is locally quadratic of rank 0.
*Lean:* `TauCeti.isQuadraticallyPresented_of_finite_maximalSpectrum`.

**Finite-index inputs.** Over a principal ideal domain D, a square matrix with det d ≠ 0 has
cokernel of order #(D/d); for a finite-index subring B ⊆ B′ and a square matrix over B whose
determinant is regular in B′, the cokernels over B and B′ have the same order; reduction modulo an
ideal K ⊆ B that is finite as a set preserves the cokernel and regularity when the determinant is
regular in B; a regular element of a finite-index subring of a product of infinite domains is
regular in the product. For B ⊆ ∏_i D_i with finitely many principal ideal domains D_i, K is the
kernel of the projection of B onto the product of the infinite D_i: it is finite, B/K is a
finite-index subring of that product, and K = 0 when every D_i is infinite. K is not the conductor
{b : bB′ ⊆ B} (for B = {(a, b) ∈ ℤ² : a ≡ b mod 2} the conductor is 2ℤ × 2ℤ, infinite and nonzero).
*Checks:* finiteness of index is not enough: B = ℤ, K = (2), A = (4) give cokernels of orders 4 and
2. *Lean:* `TauCeti.natCard_quotient_range_toLin'_quotient_of_finite`,
`TauCeti.natCard_quotient_range_toLin'_subring`, with the check as an `example`.

**The order of a quadratically presented module.** Let B be a finite-index subring of a finite
product of principal ideal domains (each possibly a field, finite or infinite), for instance R_Ψ ⊆ ∏
O, and N quadratically presented over B with Fitt(N) = (x), x regular and B/(x) finite. Then N is
finite of order #(B/(x)) (Dasgupta–Kakde Lemma 2.4). *Lean:*
`TauCeti.QuadraticPresentation.card_eq`.

### 6.4 Compound matrices and higher adjugates

References: Dasgupta–Kakde, proof of Lemma 3.9, p. 26.

**Compound matrices.** For linearly ordered finite index types and A ∈ R^{ι×κ}, C_r(A)_{S,T} = det
A[S, T] on r-subsets (`Set.powersetCard`, enumerated increasingly); it is the matrix of ⋀^r A in the
exterior-power bases (`Module.Basis.exteriorPower`), C_r(AB) = C_r(A)C_r(B) (Cauchy–Binet), C_r(1) =
1, and C₂ is `Matrix.pairMinor`. *Checks:* C₁ of a 2×3 matrix is the matrix; C₂ of (a b; c d) is (ad
− bc); C₃ of a 2×3 matrix is empty. *Lean:* `Matrix.compound`, `Matrix.compound_mul`.

**Higher adjugates.** For A ∈ M_m(R) and r ≤ m, adj_r(A)_{T,S} = (−1)^{ΣS+ΣT} det A[Sᶜ, Tᶜ] (the
sign is the same for 0- or 1-based sums). The generalised Laplace expansion Σ_T (−1)^{ΣS′+ΣT} det
A[S, T] det A[S′ᶜ, Tᶜ] = δ_{SS′} det A gives C_r(A)adj_r(A) = adj_r(A)C_r(A) = det(A)·I, with the
shuffle sign (−1)^{ΣT − r(r−1)/2}; adj₁ is the adjugate, adj_m = (1); and det(A)·⋀^r R^m lies in the
span of the image of C_r(A). *Checks:* adj₁ of a 3×3 matrix is `Matrix.adjugate`; adj₃ = (1);
adj_r(1) = 1. *Lean:* `Matrix.higherAdjugate`, `Matrix.compound_mul_higherAdjugate`.

### 6.5 Higher Fitting ideals

References: Dasgupta–Kakde Appendix B.2, p. 93; [Stacks
07ZA](https://stacks.math.columbia.edu/tag/07ZA).

**The library calculus.** Fitt^i = `TauCeti.fittingIdeal` R M i carries presentation independence,
invariance, monotonicity, the chain Fitt^i ⊆ Fitt^{i+1}, Fitt^i = R once M has i generators,
Fitt⁰(R/I) = I, the free-summand shift Fitt^{i+r}(M ⊕ R^r) = Fitt^i(M) for i, r ≥ 0 with Fitt^j(M ⊕
R^r) = 0 for j < r (the subtraction form only for j ≥ r), the jumps of a free module, the fibre
criterion and base change; it is consumed, not restated.

**Fitting ideals in matrix form.** For a presentation R^m →A R^n → M → 0, Fitt^i(M) is generated by
the (n − i) × (n − i) minors of A: R for i ≥ n and 0 for i < n − m. *Checks:* Fitt^i(R^n) is 0 for i
< n and R for i ≥ n; Fitt⁰(R/(a)) = (a); R/(a) ⊕ R/(b) has Fitt⁰ = (ab), Fitt¹ = (a, b), Fitt² = R,
and the wrong minor size would give Fitt¹ = (ab). *Lean:* `TauCeti.fittingIdeal_eq_span_minors`.

### 6.6 Fitting ideals of extensions and fibre products

References: Dasgupta–Kakde Lemmas 2.6 and 2.7, p. 18.

**Extensions of quadratically presented modules.** For 0 → A → B → C → 0 with A, C quadratically
presented by (n, ψ_A) and (m, φ_C), lifts c̃_j of the generators of C satisfy Σ_j (φ_C)_{jk}c̃_j =
Σ_i X_{ik}a_i, and B is quadratically presented of size n + m by [[ψ_A, −X], [0, φ_C]], of
determinant det ψ_A det φ_C (independent of the lifts). If only C is quadratically presented and A
is finitely presented, B is finitely presented and Fitt(B) = Fitt(A)Fitt(C) (Lemma 2.6). *Lean:*
`TauCeti.fittingIdeal_eq_mul_of_exact`.

**Two extensions of a common quotient.** For quadratically presented B, B′ with 0 → A → B → C → 0
and 0 → A′ → B′ → C → 0, A, A′ finitely presented, Fitt(A)Fitt(B′) = Fitt(A′)Fitt(B) (Lemma 2.7).
*Lean:* `TauCeti.fittingIdeal_mul_comm_of_exact`.

### 6.7 Exterior powers and annihilators

References: Dasgupta–Kakde Lemma 3.9, pp. 25–26.

**Fitting ideals annihilate exterior-power cokernels.** For N ⊆ M with N finitely generated and M
finitely presented, Fitt(M/N) annihilates coker(⋀^r N → ⋀^r M) for every r ≥ 1. *Needs:* §6.4.
*Lean:* `TauCeti.fittingIdeal_le_annihilator_exteriorPower_cokernel`.

### Examples

- For #G = p not a unit, R_Ĝ ≅ O[G] contains no coordinate idempotent; for G = ⟨g, h⟩ and Ψ = {1,
  ψ₁, ψ₂}, R_Ψ is not Gorenstein.
- # maps R_{ψ} to R_{ψ⁻¹} and not to itself when ψ(τ) is a primitive cube root of unity.
- The presentation R² → R, (a, b) ↦ a, of 0 has transpose S ≠ 0.
- C₂ of (a b; c d) is (ad − bc).

### Dependencies

Layer 4 (`charIdempotent`, the initial Fitting ideal). Mathlib `HasEnoughRootsOfUnity`,
`MonoidAlgebra.lift`, `Module.compHom`, `Module.Dual`, `Module.rankAtStalk`, `Matrix.adjugate`,
`Set.powersetCard`, `Module.Basis.exteriorPower`, `exteriorPower`, `Ring.HasFiniteQuotients`. Tau
Ceti `TauCeti.DiagonalizableGroup.point`, `TauCeti.MonoidAlgebra.augmentation`,
`TauCeti.subgroupCharSum`, `HopfAlgebra.antipodeAlgHom`, `TauCeti.AuslanderReitenTranspose`,
`Matrix.pairMinor`, `TauCeti.fittingIdeal`.

## Downstream consumers

- p-adic L-functions (Kubota–Leopoldt and later) consume Layer 2 (φ, ψ, the unit projector, root
  averaging), Layer 3 (pseudo-measures and evaluation) and Layer 3a (the character space).
- The Brumer–Stark integrality roadmap of Dasgupta–Kakde consumes Layer 6 and supplies its own
  Gorenstein and duality statements.
- Euler-system and main-conjecture arguments consume Layer 4 (structure theorem, characteristic
  ideals, μ, λ, growth) and Layer 5 (determinants, specialization, topological Nakayama).
- StableReduction layer 1 consumes `TauCeti.fittingIdeal` with §4.5; AlgebraicVectorBundles layer 0C
  consumes the ring-level determinant of §5.1.

## References

- **RJW** — Joaquín Rodrigues Jacinto and Chris Williams. [An introduction to p-adic
  L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf). Essential Number Theory 4 (2025),
  no. 1, 101–216. Printed page numbers.
- **NSW** — Jürgen Neukirch, Alexander Schmidt and Kay Wingberg. Cohomology of Number Fields, second
  edition, corrected electronic version 2.3 (May 2020), Grundlehren 323. Cited by statement number
  (5.x.y) and printed page.
- **Dasgupta–Kakde** — Samit Dasgupta and Mahesh Kakde. [On the Brumer–Stark
  conjecture](https://arxiv.org/pdf/2010.00657v3). arXiv:2010.00657v3 (2022); arXiv PDF pages.
- **Rowland–Stipulanti–Yassawi** — Eric Rowland, Manon Stipulanti and Reem Yassawi. [An elementary
  proof of Bridy's theorem](https://arxiv.org/abs/2308.10977v2). arXiv:2308.10977v2 (2025).
- **Knudsen–Mumford** — Finn F. Knudsen and David Mumford. [The projectivity of the moduli space of
  stable curves. I](https://doi.org/10.7146/math.scand.a-11642). Math. Scand. 39 (1976), 19–55.
- **Stacks** — The Stacks Project. [Tag 07Z6](https://stacks.math.columbia.edu/tag/07Z6) (Fitting
  ideals), [Tag 0AVB](https://stacks.math.columbia.edu/tag/0AVB) (reflexive hull), [Tag
  0FJ9](https://stacks.math.columbia.edu/tag/0FJ9) (varying-rank determinants), [Tag
  0FJI](https://stacks.math.columbia.edu/tag/0FJI) (two-term determinants).
- **Loeffler** — David Loeffler. Ring structure on nonarchimedean measures, Mathlib
  `Mathlib/NumberTheory/Padics/Measure/Monoid.lean` (the right-handed convolution).

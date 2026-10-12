# Roadmap: perfectoid towers: finite quotients, closed perfectoid loci and continuous torsor descent

**Summary.** Perfectoid Shimura varieties are limits of towers of rigid spaces; this roadmap builds,
on top of [PerfectoidSpaces](../PerfectoidSpaces/README.md), the three tools their study needs.
Finite quotients: the invariant Huber pair and `|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|`, perfectoid
invariants for any `|G|`, and categorical quotients of affinoid perfectoid spaces, of adic, rigid
and perfectoid spaces with an invariant affinoid cover, and of analytically separated perfectoid
spaces. Closed perfectoid loci: Zariski-closed embeddings, good towers of projective varieties, and
perfectoidisation of integral extensions and closed subvarieties. Descent along pro-étale Galois
towers with perfectoid limit: of functions, finite locally free modules and twisted character sheaves
with weight-space coefficients, local freeness of character sheaves trivialised at finite level, and
coefficient change. The end results are the finite-quotient theorems for analytically separated
perfectoid spaces and good towers ([HJ] Theorem 5.8, Proposition 5.13), the closed-locus tilde-limit
comparison ([HJ] Lemma 5.7), and descent along towers ([CHJ] §2, [BHW] §3–4).

| Layer | Construction |
| --- | --- |
| P8 | Finite quotients and closed perfectoid loci in towers |
| P9 | Continuous torsor descent with coefficients |

## Scope and ownership

PerfectoidSpaces owns P0–P7; this roadmap owns P8–P9. DiamondsAndVStacks owns the v-topology,
diamonds, spatiality and its site equivalences, proved there from [KL16] directly; the tower
applications of its §2.9 and §6.9 (module and seminormal function descent along a given tower)
belong here. AdicEtaleGeometry owns the étale and pro-étale sites and finite étale torsor towers
(A1, A4); AdicSpacesPartII completed tensor products, separatedness and analytification (R0, R1);
AdicSpacesPartIII Kiehl's theorem (R3); AdicSpacesPartIV sousperfectoid coefficients and
coefficient localisation (R4, R5). Locally analytic distributions and Shimura varieties are
downstream.

## Conventions

Fix a prime `p`. Perfectoid Tate rings, pairs, `Perfd` (a full subcategory of Tau Ceti's
`PreAdicSpace`) and `Perf` are those of PerfectoidSpaces; no perfectoid base field is fixed. `R°`
and `R°°` are the power-bounded and topologically nilpotent elements, `X♭` the tilt, `♯` the sharp
map. Almost statements are for a stated setup, for perfectoid rings the root ideal of a
pseudouniformiser with compatible `p`-power roots, and are never upgraded silently. Actions on rings
are left actions, acting on valuations by `v ↦ v ∘ g`; a left action `ρ : G →* Aut X` on a space has
`ρ(gh) = ρ(g) ∘ ρ(h)`. Towers carry right actions, with `(γδ)^* = γ^*δ^*` on functions and Čech
increments `(x, g₁, …, gₙ) ↦ (x, xg₁, …, xg₁⋯gₙ)`. Twisted invariants use the inverse cocycle,
`γ·f = c(γ)⁻¹f`, `c(γδ) = c(γ)·γ(c(δ))`. Quotients are categorical, torsors only for free actions.
[HJ] is arXiv:2011.03951v2, whose adic spaces are analytic over `ℤ_p` (p. 27).

## Exact supplier contracts

| Object | Declaration at the pins | Layer |
| --- | --- | --- |
| Fixed rings, integrality, prime orbits | Mathlib `FixedPoints.subring`, `Algebra.IsInvariant`, `Algebra.IsInvariant.isIntegral`, `Algebra.IsInvariant.exists_smul_of_under_eq`, `MulSemiringAction.charpoly` | P8.1–P8.2 |
| Affine invariant quotients | Tau Ceti `AffineInvariantQuotient.isQuotientMap_projection`, `AffineInvariantQuotient.isFinite_projection` | P8.2, P8.10 |
| Huber pairs and Tate rings | Tau Ceti `Pair`, `Pair.Hom`, `IsTateRing`, `IsPseudoUniformizer`, `PairOfDefinition`, `powerBoundedSubring` | P8 |
| Adic spectra | Tau Ceti `ValuationSpectrum.spa`, `ValuationSpectrum.spaComap`, `ValuationSpectrum.spaComap_preimage_rationalSubset` | P8.2, P8.5 |
| Pre-adic spaces | Tau Ceti `PreAdicSpace`, `PreAdicSpace.Hom`, `PreAdicSpace.restrict`, `PreAdicSpace.isAdic`, `PreAdicSpace.isAffinoid`, `ValuationSpectrum.presentationLimitPreAdicSpace` | P8.6–P8.9 |
| Perfectoid rings and spaces | PerfectoidSpaces `IsPerfectoidTateRing`, `IsIntegralPerfectoid`, `PseudoUniformizerRoots`, `isAffinoidPerfectoid`, `isPerfectoidSpace`, `Perfd`, `Perf`, `padicCyclotomic` | P8–P9 |
| Disjoint translates, Hausdorff quotient | Mathlib `ProperlyDiscontinuousSMul.exists_nhds_disjoint_image`, `T2Quotient` | P8.13, P8.16 |
| Perfection and adic completion | Mathlib `PerfectClosure`, `AdicCompletion`, `AdicCompletion.map` | P8.18, P9.13 |
| Cocycles, invariants, averaging | Mathlib `groupCohomology.IsMulCocycle₁`, `Representation.invariants`, `Representation.averageMap`, `Representation.isProj_averageMap` | P9.9–P9.10 |
| Continuous cohomology in low degrees | Mathlib `ContinuousCohomology.zeroIso`; Tau Ceti `ContinuousCohomology.zeroIsoNatIso`, `ContCohomology.cochainEquiv0`, `ContCohomology.cochainEquiv1`, `ContCohomology.cochainEquiv2` | P9.5 |
| Galois descent and faithful flatness | Tau Ceti `GaloisDescent.span_invariants_eq_top`; Mathlib `Module.FaithfullyFlat.of_comap_surjective`, `Module.rankAtStalk` | P9.10 |
| Module sheaves and derived functors | Mathlib `SheafOfModules.IsLocallyFree`, `Functor.rightDerived`, `Functor.totalLeftDerived` | P9.2–P9.13 |

Sibling suppliers are cited by layer: AdicEtaleGeometry A1 (`AdicSpace.ProEtaleSite`) and A4
(`Algebra.galoisTensorMap`, `Algebra.IsFiniteEtaleTorsor`); AdicSpacesPartII R0 (`CompletedTensor`)
and R1; AdicSpacesPartIV R5 (`IsProfiniteFlat`, `mixedTensorInt`); DiamondsAndVStacks D2–D6
(`vTopology`, `geometricDiamond`).

## How to read the build

P8 goes from the invariant pair (P8.1–P8.5) through quotients (P8.6–P8.17) to perfectoidisation,
good towers and closed loci (P8.18–P8.21); P9 from pro-étale objects and completed sheaves
(P9.1–P9.3) and towers (P9.4–P9.5) to descent (P9.6–P9.8, P9.11–P9.12) and character sheaves
(P9.9–P9.10, P9.13). A target ends with the Lean declarations carrying it, if any; targets needing
sites, diamonds, completed tensors or towers are specified here only.

## Layer P8: finite quotients and closed perfectoid loci in towers

### P8.1 The invariant Huber pair

**Invariant Huber pair.** Let `(A, A⁺)` be a Tate–Huber pair and `G` a finite group acting on the
left by continuous ring automorphisms, with no condition on `|G|`; put `A^G` with the subspace
topology and `A^{+G} = A⁺ ∩ A^G`. Then (i) `A^G` is a Tate ring, closed if `A` is Hausdorff and
complete if `A` is: `N(ϖ) = ∏_g g(ϖ)` is an invariant pseudouniformiser of `A` and `A^G`, the
translates of a ring of definition `A₁` generate a `G`-stable ring of definition `A₀` (bounded as
each translate lies in `ϖ^{-n}A₁`), and `A₀^G` is a ring of definition of `A^G`; (ii)
`(A^G)° = A° ∩ A^G`; (iii) `A^{+G}` is a ring of integral elements, so `(A^G, A^{+G})` is a
Tate–Huber pair; (iv) if `G` preserves `A⁺`, then `A⁺` is the integral closure of `A^{+G}` in `A`,
as `A` is integral over `A^G` (Mathlib `Algebra.IsInvariant.isIntegral`). The construction is
functorial in equivariant maps of pairs and in subgroups `H ≤ G` ([Hansen] §2, p. 3, Theorem 3.1,
pp. 4–6). Checks: `N(ϖ) = ϖ^{|G|}` for `ϖ` fixed by `G`, and `N(0) = 0`, `N(1) = 1`; for `ℤ/2`
swapping `K × K` the fixed ring is the diagonal, `A^{+G}` the diagonal `K⁺`, and
`N(ϖ, ϖ) = (ϖ², ϖ²)`; in characteristic `p` with `|G| = p` acting trivially the trace `p·a` vanishes
although `A^G = A`, so invariants are not an image of averaging; `(a, 0) ∈ P × Q` with `a ∈ P ∖ Q`
has swap outside `P × Q`, so preserving `A⁺` is a real hypothesis. Lean: `normPseudoUniformizer`,
`isPseudoUniformizer_normPseudoUniformizer`, `isClosed_fixedPoints`, `isTateRing_fixedPoints`,
`isRingOfIntegralElements_comap_fixedPoints`, `invariantPair`.

**Extensions of valuations are conjugate.** For a normal algebraic extension `L/K` with
`Aut(L/K)` finite and a valuation `v` of any rank on `K`, `v` extends to `L`, uniquely along the
purely inseparable extension `K ⊆ L^{Aut(L/K)}`, and `Aut(L/K)` acts transitively on the classes of
extensions; restriction from the fixed field to `K` is a bijection on valuation spectra ([Hansen]
Theorem 3.1, Step 1, pp. 4–5). Mathlib supplies `Normal` and `IntermediateField.fixedField`.

### P8.2 The orbit space of the adic spectrum

**`|Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|`.** With `(A, A⁺)` and `G` as in P8.1 and `G` preserving
`A⁺` (no completeness, Hausdorffness or sheafiness), restriction `q : v ↦ v|_{A^G}` is a quotient
map `Spa(A, A⁺) → Spa(A^G, A^{+G})` whose fibres are the `G`-orbits. Moreover `Spa(A, A⁺)` is the
full preimage of `Spa(A^G, A^{+G})` in `Cont(A)`, and for a rational subset `U(f₁, …, fₙ/s)` of
`Spa(A^G, A^{+G})` (the `fᵢ, s ∈ A^G` generate the unit ideal of `A^G`, hence of `A`) the preimage
is the `G`-stable rational subset `U(f/s)` of `Spa(A, A⁺)` (Tau Ceti
`ValuationSpectrum.spaComap_preimage_rationalSubset`) ([Hansen] Theorem 3.1, p. 4). The `Spec`
analogue is Mathlib `Algebra.IsInvariant.exists_smul_of_under_eq` and Tau Ceti
`AffineInvariantQuotient.isQuotientMap_projection`; the free case is AdicEtaleGeometry A4. Lean:
`invariant_spectrum_homeomorphism`.

**Continuous valuations over the invariants.** `Cont(A) → Cont(A^G)` is surjective, and two
continuous valuations have the same restriction exactly when they differ by `v ↦ v ∘ g` ([Hansen]
Theorem 3.1, Step 1, pp. 4–5).

### P8.3 The quotient v-sheaf of the invariants

**`Spd(A, A⁺) × G ⇉ Spd(A, A⁺)` presents `Spd(A^G, A^{+G})`.** Let `A` be a complete Tate
`ℤ_p`-algebra with a continuous action of a finite group `G` and `A⁺ ⊆ A°` a `G`-stable open
integrally closed subring, with no perfectoidness and no condition on `|G|`. For `X = Spd(A, A⁺)`
and `X_G = Spd(A^G, A^{+G})`, the maps `X → X_G` and `X × G → X ×_{X_G} X` are surjections of
v-sheaves on `Perf`; hence `X × G ⇉ X → X_G` is a coequalizer of v-sheaves (equally of pro-étale
sheaves) and `X/G ≅ X_G` ([CGJ] Proposition 2.1.1, p. 4). Needs DiamondsAndVStacks D2 and D5.

### P8.4 Invariants of a perfectoid Tate ring

**Invariants are perfectoid.** For a perfectoid Tate ring `A` of any characteristic and a finite
group `G` acting by continuous ring automorphisms, `A^G` with the subspace topology is a perfectoid
Tate ring; `p` may divide `|G|` ([KL16] Theorem 3.3.26, p. 68; [Hansen] Theorem 3.6, p. 9, and
Theorem 3.5, p. 9, for a `K`-linear action over a perfectoid field). Checks: in characteristic `p`
the `p`-th root of an invariant is invariant, so `A^G` is perfect; for `ℤ/p` permuting the variables
of `K⟨T₁^{1/p^∞}, …, T_p^{1/p^∞}⟩` in characteristic `p` the invariants contain `T₁ + ⋯ + T_p`
together with its invariant `p`-th root; finiteness is needed: `ℤ_p(1)` acting on `K⟨T^{1/p^∞}⟩`
by `T^{m/pⁿ} ↦ ζ_{pⁿ}^{mγ}T^{m/pⁿ}` fixes a monomial iff `pⁿ | m`, so the invariants are `K⟨T⟩`,
which is not perfectoid; completeness of `A` is needed, as the trivial action on `ℚ` shows. Lean:
`invariants_perfectoid`.

**Tilting commutes with invariants.** For `G` finite acting continuously on a perfectoid pair and
preserving its plus ring, `(A^G)♭ = (A♭)^G` as perfectoid pairs inside `A♭` (same topology and plus
rings), compatibly with `♯` and with the tilt of `A^G → A`; `G` acts on `A♭` coordinatewise,
continuously, preserving the tilted plus ring ([ECD] Definition 3.9, Lemmas 3.10–3.11, pp. 16–17).
Checks: an action trivial on `A` is trivial on `A♭`; a moved coordinate gives a moved tilted
element.

**Frobenius on invariants of a `p`-group.** Let `|G| = p^k`, `ū` a `G`-invariant pseudouniformiser
of `A♭` and `n ≥ 0` with `u = (ū^{1/pⁿ})♯` satisfying `u^{p^{k+1}} | p` in `(A^G)°`. Then every
`x ∈ (A^G)°` is a `p`-th power modulo `u^p(A^G)°`. Such data exist: `ū = N(ϖ♭)`, and `n ≥ k` with
`p^{n−k} ≥ m` where `ū | (ϖ♭)^m` gives `u^{p^{k+1}} | ϖ^p | p` ([KL16] Theorem 3.3.26, proof,
p. 68). Checks: `k = 0` is Frobenius surjectivity on `A°/u^p`; `n = 0` forces the root to be `ū`.

### P8.5 Invariants and rational localisation

**Rational invariants of perfectoid pairs.** For a perfectoid Tate–Huber pair `(A, A⁺)` of any
characteristic with a continuous action of a finite group `G` of any order and
`q : X = Spa(A, A⁺) → Y = Spa(A^G, A^{+G})`, for every rational `U = U(T/s) ⊆ Y` the maps
`A^G⟨T/s⟩ → A⟨T/s⟩^G` and `A^{+G}⟨T/s⟩ → (A⁺⟨T/s⟩)^G` are isomorphisms (plus rings being integral
closures of images); hence `O_Y = (q_*O_X)^G` and `O_Y⁺ = (q_*O_X⁺)^G` ([CGJ] Proposition 2.1.3,
p. 5; the characteristic-`p` case for any `|G|` is [CGJ] Remark 2.1.4, pp. 5–6). The action extends
to the completed localisation on `q⁻¹(U)` by equivariance of its structure map. Checks: the empty
rational subset gives the zero ring on both sides; the whole spectrum recovers the fixed pair; a
trivial action extends to a trivial action. Needs PerfectoidSpaces P1.27 and P2.3.

### P8.6 The categorical quotient in Huber's category `V`

**`X/G` in `V`.** Huber's category `V` has objects a space with a sheaf of complete topological
rings and a valuation class on each stalk, with no locality imposed, and morphisms the continuous
sheaf maps whose stalk maps pull the valuations back. Tau Ceti's `PreAdicSpace` (local stalks,
valuations supported at the maximal ideal, a presheaf of rings) has exactly these morphisms,
`PreAdicSpace.Hom`. For `X` in `V` with a left action of a finite group `G`,
`X/G = (|X|/G, (q_*O_X)^G, (v_y))`, with `v_y` induced through `O_{X/G,y} → O_{X,x}` for any `x`
over `y`, is the categorical quotient, and `|q|` is the quotient map, open since `q⁻¹q(U) = ⋃_g gU`
([Hansen] Definitions 2.1–2.2, p. 3, Proposition 2.3, p. 4). Perfectoid spaces enter `V` through
their adic representatives ([ECD] Definition 3.19, p. 18). Checks: `ρ(gh)` is `ρ(h)` followed by
`ρ(g)`, pinned by `(0 1)(1 2)` sending `0` to `1` and `(1 2)(0 1)` sending it to `2`; if some
`ρ(g) ≠ 1` the identity is not a quotient, while for the trivial action it is; the empty object
has empty quotient and a transitive action one point; `Spa(K, K⁺)/G = Spa(K^G, K⁺ ∩ K^G)`, a valuation
ring; `(Y × G)/G ≅ Y` for translation; for `p` odd, `μ₂` acting on the perfectoid disc by
`T^{1/pⁿ} ↦ −T^{1/pⁿ}` has quotient map not étale at `0` (one geometric point over `q(0)`, two
elsewhere), so no torsor, and for `p = 2` the action does not exist. Lean:
`IsCategoricalQuotient`, the universal property against all pre-adic spaces.

### P8.7 The quotient of an affinoid perfectoid space

**Affinoid perfectoid quotients.** For a perfectoid Tate–Huber pair `(A, A⁺)` with a continuous
action of a finite group `G` preserving `A⁺` (any `|G|`, no base field), `Spa(A^G, A^{+G})` is
affinoid perfectoid and `Spa(A, A⁺) → Spa(A^G, A^{+G})` is the categorical quotient in `V`, and the
coequalizer of `X × G ⇉ X` in locally v-ringed spaces ([CGJ] Proposition 2.1.3(2), p. 5). Lean:
`exists_isCategoricalQuotient_of_invariant_cover` with the whole space as the invariant chart,
together with `invariants_perfectoid`.

**Quotients commute with orthonormalisable scalar extension.** Let `(A, A⁺)` be a complete Banach
Tate–Huber pair over `(K, K°)` with a continuous `K`-linear action of a finite group `G` preserving
`A⁺`, and `L/K` complete with a bounded isomorphism `L ≅ c₀(I, K)`, `G` acting trivially on `L`.
Then `A^G ⊗̂_K L → (A ⊗̂_K L)^G`, `a ⊗ l ↦ a ⊗ l`, is a topological ring isomorphism, computed
coordinatewise through `c₀(I, A)^G = c₀(I, A^G)` with no averaging (so `p = 2` and even `|G|` are
allowed); for `C = A ⊗̂_K L` uniform with the plus rings of AdicSpacesPartII R0 ([KL I] Definition
2.4.1, p. 38), `D⁺ = C⁺ ∩ C^G` and `|Spa(C, C⁺)|/G ≅ |Spa(D, D⁺)|` (the coordinatewise argument of
[CHJ] Lemma 2.23(2), pp. 19–20, stated there over `ℚ_p`). Checks: for `A = K × K`, `L = K`, a
singleton basis and the swap, the comparison fixes `(a, a) ⊗ l` and the action sends
`(a, b) ⊗ l` to `(b, a) ⊗ l`; an empty basis is impossible for `L ≠ 0`; `A = 0` gives zero maps.

### P8.8 Quotients under an invariant affinoid perfectoid cover

**Perfectoid quotients.** Let `X` be a perfectoid space with an action of a finite group `G`,
covered by `G`-stable open affinoid perfectoid subspaces `Uᵢ = Spa(Aᵢ, Aᵢ⁺)`. Then the categorical
quotient `X/G` is a perfectoid space with `|X/G| = |X|/G`, covered by the affinoid perfectoid opens
`Uᵢ/G = Spa(Aᵢ^G, Aᵢ^{+G})` with `q⁻¹(Uᵢ/G) = Uᵢ`; there is no condition on `|G|` ([CGJ] Theorem
2.1.2, p. 5; [Hansen] Theorem 1.4 is the case of invertible `|G|` or a linear action over a
perfectoid field). Lean: `exists_isCategoricalQuotient_of_invariant_cover`.

### P8.9 Adic quotients with invertible group order

**Adic quotients.** Let `X` be an analytic adic space with an action of a finite group `G` whose
order is invertible in `O_X(X)`, covered by `G`-stable open affinoids `Spa(Aᵢ, Aᵢ⁺)` with `Aᵢ` Tate.
Then `X/G` is an adic space with underlying space `|X|/G`, covered by the affinoids
`Spa(Aᵢ^G, Aᵢ^{+G})` ([Hansen] Theorem 1.1, p. 1). The input is that for a sheafy complete
Tate–Huber pair with `|G| ∈ A^×`, `A^G⟨f/h⟩ → A⟨f/h⟩^G` is an isomorphism for every rational
subset of `Spa(A^G, A^{+G})`, so `O_Y = (q_*O_X)^G` is a sheaf ([Hansen] Theorem 3.3, p. 7).
Invertibility is required in the Tate rings, not the plus rings: for the swap on `ℚ₂ × ℚ₂` the
averaging idempotent sends `(1, 0)` to `(1/2, 1/2) ∉ ℤ₂ × ℤ₂`, while `A^{+G}` is the diagonal `ℤ₂`.
Checks for Tate affinoids: `Spa(A, A⁺)` of a Tate–Huber pair is one, and every Tate affinoid is
affinoid in Tau Ceti's sense. Lean: `isTateAffinoidModel`, `isTateAffinoid`,
`exists_isCategoricalQuotient_of_invertible_order`.

### P8.10 Rigid quotients under an invariant affinoid cover

**Rigid quotients.** Let `X` be a rigid space over a complete nonarchimedean field `K` with a
`K`-linear action of a finite group `G` and an admissible cover by `G`-stable affinoid opens, with
no condition on `|G|`. Then `X/G` is rigid, `q` is finite, and `X/G` is affinoid when `X` is;
conversely a rigid quotient with `q` finite admits such a cover ([Hansen] Theorem 1.3, p. 2). The
inputs: for a `K`-affinoid algebra `A` with `G` acting by `K`-algebra automorphisms (any
characteristic, any `|G|`), `A^G` is `K`-affinoid and `A` is finite over `A^G` ([CHJ] §6.4, p. 53);
and with `(A^G)° = A° ∩ A^G`, `A^G⟨f/h⟩ = A⟨f/h⟩^G` for every rational subset of
`Spa(A^G, (A^G)°)` ([Hansen] Theorem 3.4, p. 8). Check: `μₙ` acting on `K⟨T⟩` by `T ↦ ζT` has
invariants `K⟨Tⁿ⟩`; a polynomial is fixed iff only exponents divisible by `n` occur. Needs Tau Ceti
`AffineInvariantQuotient.isFinite_projection` and AdicSpacesPartII R0.

### P8.11 The diamond of a finite quotient

**`X^◇/G ≅ (X/G)^◇`.** For an analytic adic space `X` over `ℤ_p` with an action of a finite group
`G`, covered by `G`-stable affinoid opens `Spa(Aᵢ, Aᵢ⁺)` such that `X/G` is adic and covered by the
`Spa(Aᵢ^G, Aᵢ^{+G})`, the canonical map `X^◇/G → (X/G)^◇` of v-sheaves is an isomorphism ([HJ]
Theorem 5.3 and proof, pp. 28–29). Needs P8.3, P8.8 and DiamondsAndVStacks D4.

### P8.12 Free actions and finite étale torsors

**Torsor criterion.** Let `X` be a perfectoid space with a left action of a finite group `G` such
that `X/G` is perfectoid with `(X/G)^◇ = X^◇/G`. The following are equivalent: (a) `q` is a finite
étale `G`-torsor, finite étale with `X × G ≅ X ×_{X/G} X` sending `(x, g)` to `(x, g·x)`; (b) `G`
acts freely on `X^◇`; (c) every geometric point has trivial stabiliser. Conversely, a surjective
finite étale `Y → X` with a `G`-action over `X` and `Y × G ≅ Y ×_X Y` has `X = Y/G`. Freeness makes
the orbit relation `X^◇ × G`, which gives a torsor in the sense of [ECD] Definition 10.12, p. 53,
and [ECD] Lemma 10.13, p. 53, with Proposition 10.11(iii), pp. 52–53, gives finite étaleness.
Checks: for the trivial group and for the empty space the stabiliser condition holds; a nontrivial
group acting trivially on a space with a geometric point fails it although `q` is the identity, so
the torsor isomorphism is essential.

### P8.13 `G`-clean neighbourhoods

**Clean neighbourhoods.** For a group `G` acting on a topological space and a point `x` with
stabiliser `Hₓ`, an open neighbourhood `U` of `x` is `G`-clean if `Uh = U` for `h ∈ Hₓ` and
`U ∩ Ug = ∅` for `g ∉ Hₓ` ([HJ], definition before Lemma 5.2, pp. 27–28). For `G` finite acting
continuously on a Hausdorff space, every neighbourhood of a point contains a clean one ([HJ] Lemma
5.2, p. 28); for a locally compact Hausdorff space this is Mathlib
`ProperlyDiscontinuousSMul.exists_nhds_disjoint_image` intersected over the stabiliser. An open
`U ∋ x` is clean iff it is `Hₓ`-stable and the contracted product `U ×^{Hₓ} G → X` is injective.
Checks: the empty set is invariant with disjoint translates but misses `x`; if `g·x ≠ x` and both
`y, g·y ∈ U` then `U` is not clean; for the trivial action every open neighbourhood is clean; for
`ℤ/2` acting on `ℝ` by negation, `(1/2, 3/2)` is clean at `1` and `(−1, 1)` at `0`, while
`(−1/2, 3/2)` meets its translate; on the line with a doubled origin, swapped by `ℤ/2`, no
neighbourhood of an origin is clean, so Hausdorffness cannot be dropped. Lean:
`MulAction.IsGClean`, `MulAction.exists_isGClean`.

### P8.14 Zariski-closed embeddings

**Zariski-closed embeddings and Zariski-open subsets.** A map of perfectoid spaces `Z → X` is a
Zariski-closed embedding if for every open affinoid perfectoid `U ⊆ X` the base change
`Z ×_X U → U` is a strongly Zariski-closed immersion of affinoid perfectoid spaces: `O(U) → S`
surjective with `S⁺` the integral closure of the image of `O⁺(U)` ([ECD] Definitions 5.6–5.7 and
5.8; [Torsion] Lemma II.2.2 and II.2.9(i); PerfectoidSpaces P4.15). All open affinoid perfectoids
are quantified, since locality on one cover is open. An open `U ⊆ X` is Zariski open if `X ∖ U` is
the image of a Zariski-closed embedding, which is then the universal perfectoid space over it
([HJ] Definition 5.4(1),(2) and the caution after it, p. 29). Checks: the identity (zero ideal)
and the empty subspace (unit ideal) are Zariski-closed embeddings; the point `T = 0` of the
perfectoid disc over `K` is cut out by `(T^{1/pⁿ})ₙ` with ring `K`, and `(T)` has the same locus
although `K⟨T^{1/p^∞}⟩/(T)` is not reduced; over an affinoid perfectoid base the notion is
strongly Zariski closed; the closure of the Gauss point is closed but not Zariski closed, since a
function vanishing there has Gauss norm `0`; the empty open, the whole space and the punctured disc
are Zariski open.

### P8.15 Analytically separated perfectoid spaces

**Analytic separation.** Let `K` be a complete nontrivially normed nonarchimedean field with a ring
of integral elements `K⁺`. A perfectoid space `X` over `Spa(K, K⁺)` is analytically separated if
the diagonal `X → X ×_{Spa(K, K⁺)} X` is a Zariski-closed embedding; the fibre product, defined by
its universal property on perfectoid test spaces, is perfectoid by the uniform completed tensor
product of PerfectoidSpaces P2.17. In an analytically separated space the intersection of two open
affinoid perfectoids is affinoid perfectoid ([HJ] Definition 5.4 and Lemma 5.5(2), pp. 29–30); the
closed diagonal makes `X^◇ → Spd(K, K⁺)` separated, also for `K` not perfectoid ([ECD] Definition
10.7, p. 51); and an analytically separated morphism is separated in the sense of PerfectoidSpaces
P4.19 ([HJ] Lemma 5.5(1), p. 29; [ECD] Definition 5.10, p. 25). Checks: every affinoid perfectoid
space over any such `K` is analytically separated, as `(A ⊗̂_K A)^u → A` is surjective; the
perfectoid projective line over `ℂ_p` is, with two perfected-disc charts meeting in the perfected
Laurent chart where the root coordinates multiply to one ([Sch12] Theorem 8.5(ii), pp. 45–46; [HJ]
Lemma 5.6, p. 30); two perfectoid discs glued along `{|T| ≥ |ϖ|}` have affinoid intersections, but
the rank-two point with `|T| = |ϖ|·γ`, `γ < 1` infinitesimal, has two lifts, so the diagonal is not
closed; the self-product over the identity has both projections isomorphisms, and an empty source
gives an empty product.

### P8.16 Finite quotients of separated rigid spaces

**Rigid finite quotients.** Let `X` be a separated rigid space over `K` with a `K`-linear action of
a finite group `G` such that every rank-one point has its closure in an open affinoid (true if `X`
is affinoid or partially proper), and distinct rank-one points of one orbit have distinct images in
the maximal Hausdorff quotient `|X|^h` (automatic for taut `|X|`; [HJ] footnote 7, p. 28; this orbit
condition is added to [HJ] Theorem 5.3 and ensures `Stab(π(x)) = Stab(x)`). Then `X/G` is rigid,
`q` is finite and `X^◇/G ≅ (X/G)^◇`, with no `G`-stable cover assumed and no condition on `|G|`
([HJ] Theorem 5.3 and proof, pp. 28–29). The chart lemma: for `x` of rank one with stabiliser `H`,
`V ∋ x` an `H`-stable open affinoid containing the closure of `x` with affinoid `V/H`, `U` a clean
neighbourhood of `π(x)` in `|X|^h` and `W = π⁻¹(U) ∩ V`, the set `W ×^H G` is a `G`-stable open
with `(W ×^H G)/G ≅ W/H` open in `V/H`, pulling back to `⊔ᵢ Wgᵢ → W/H`. Checks for the restricted
orbit relation: the trivial subgroup gives equality, the empty set an empty quotient, and the
transitive action on two points one class. Needs Mathlib `T2Quotient`.

### P8.17 Finite quotients of analytically separated perfectoid spaces

**Perfectoid finite quotients.** Let `X` be an analytically separated perfectoid space over
`Spa(K, K⁺)` (`K` as in P8.15) with an action of a finite group `G` over `Spa(K, K⁺)`, such that
the closure of every rank-one point lies in an open affinoid perfectoid and distinct rank-one points
of one orbit have distinct images in `|X|^h` (added to [HJ] Theorem 5.8, as in P8.16). Then `X/G`
is perfectoid, covered by opens `Wₓ/Hₓ` of the affinoid perfectoids `Spa(A^{Hₓ}, A^{+Hₓ})`, and
`X^◇/G ≅ (X/G)^◇`, with no condition on `|G|` ([HJ] Theorem 5.8 and proof, pp. 30–31). Every point of
`X/G` has a basis of affinoid perfectoid neighbourhoods with affinoid perfectoid preimage, so `X`
acquires a `G`-stable affinoid perfectoid cover ([HJ] Theorem 5.8, p. 30). A spatial diamond with a
profinite action having finitely many orbits on connected components, each perfectoid, is
perfectoid ([HJ] Lemma 5.1, p. 27). Checks for spatial presentations: an affinoid gives its point
space, the empty sheaf the empty space, and a noncompact point space is excluded. Needs
PerfectoidSpaces P5.3 and DiamondsAndVStacks D5.

### P8.18 Perfectoidisation of integral extensions

**Perfectoidisation.** For an integral map `R⁺ → S⁺` out of an integral perfectoid ring there is
an initial integral perfectoid ring `S⁺_perfd` under `S⁺`; `S⁺` and its `p`-adic completion have
the same perfectoidisation; in characteristic `p` it is the uncompleted perfection ([BS22] Theorem
1.17(1), p. 9, Theorem 10.11, p. 82, Corollary 8.14, p. 70). For `ϖ ∈ R⁺` a pseudouniformiser with
compatible roots, `T = (S⁺_perfd)^∧_ϖ[1/ϖ]` with `T⁺` the integral closure of the completion is a
perfectoid Tate pair, universal among maps from `(S⁺[1/ϖ], S⁺)` to perfectoid Tate pairs, by the
integral universality and integral closedness of `A⁺`. Checks: the identity extension has bijective
structure map; the zero algebra gives zero; in characteristic `p` the kernel of `S⁺ → S⁺_perfd` is
the nilradical and every element has a `pⁿ`-th power in the image; `S⁺ = R⁺/ϖ` gives `T = 0`, and
`S⁺ = R⁺` gives `T = R`; a nilpotent survives `p`-adic completion but dies in `S⁺_perfd`; when the
completed ring is a domain the inverse of a nonzero nonunit parameter is not integral. Lean:
`exists_perfectoidization`.

**Integral extensions of perfectoid pairs.** For a map `(R, R⁺) → (S, S⁺)` of Tate–Huber pairs with
`R` perfectoid and `R⁺ → S⁺` integral, `Spd(S, S⁺)` is represented by an affinoid perfectoid
`Spa(T, T⁺)`: maps `(T, T⁺) → (B, B⁺)` correspond to maps `(S, S⁺) → (B, B⁺)` for every perfectoid
Tate pair ([HJ] Lemma 5.10, p. 32). Lean: `integral_extension_of_perfectoid_pair`.

**Finite towers over perfectoid towers.** For a map `(Xᵢ) → (Yᵢ)` of cofiltered systems of locally
noetherian analytic adic spaces over `ℤ_p` with finite components and transitions and
`Y_∞ = lim Yᵢ^◇` perfectoid, `X_∞ = lim Xᵢ^◇` is perfectoid, `X_∞ → Y_∞` is quasicompact, and the
preimage of every affinoid perfectoid open pulled back from a finite-level affinoid is affinoid
perfectoid ([HJ] Lemma 5.9, pp. 31–32). Needs PerfectoidSpaces P4.15, P5.3 and AdicSpacesPartII R0.

### P8.19 Good towers

**Good towers.** Fix a complete nonarchimedean field `K`. A good tower is a cofiltered system
`(Xᵢ)` of locally noetherian adic spaces over `Spa K` with (1) each `Xᵢ` the analytification of a
projective variety and finite transitions, (2) `X = lim Xᵢ^◇` representable by a perfectoid space,
(3) two covers of `X` by affinoid perfectoid opens `Uⱼ ⊆ Vⱼ`, closure of `Uⱼ` inside `Vⱼ`, both
pulled back from affinoids at a finite level. The limit is analytically separated, and (3) gives
the closure hypothesis of P8.17 ([HJ] Definition 5.12, pp. 32–33, and Lemma 5.6, p. 30). For a
system with finite transitions and perfectoid limit, affinoid perfectoids pulled back from finite
levels form a basis ([HJ] Lemma 5.11, p. 32), and a tower mapping finitely to a good tower is good
([HJ] Proposition 5.13(1), p. 33). Analytification is tested on sheafy complete affinoid pairs over
`(K, K°)` ([Wedhorn] Proposition 8.61, Definition 8.64, pp. 91–92, Remark 10.1, p. 103; [Sch12]
Theorem 2.21, p. 12); non-sheafy tests are excluded ([HK] Remark 3.19, p. 9). Checks: for `K`
perfectoid the constant tower `Spa K` is good, the constant tower `ℙ¹` in mixed characteristic is
not, and a single projective level is good iff its diamond is representable, as for
`Spa(K[ε]/ε²)` whose diamond is `Spa K`; in characteristic `p` the constant `ℙ¹` is good with limit
its completed perfection, yet finite-level functions are not dense, so it is no tilde-limit ([SW13]
Definition 2.4.1, pp. 19–20, Proposition 2.4.5, pp. 20–21); the Frobenius tower of `ℙ¹_{ℂ_p}` is
good with limit the perfectoid projective line ([Sch12] Theorem 8.5(ii), pp. 45–46); the tower of
affine lines satisfies (2) and (3) but not (1); the empty variety and two points give empty and
two-point limits; the affine line has no projective presentation.

### P8.20 Finite quotients of good towers

**Quotients of good towers.** For a good tower `(Xᵢ)` over a complete nontrivially normed
ultrametric field `K` with topologically nilpotent `p`, and compatible actions of a finite group
`G` over `K`, the quotient `X/G` of `X = lim Xᵢ^◇` is perfectoid and `X/G ≅ lim Xᵢ/G` as
diamonds, where the `Xᵢ/G` are the analytified projective quotient varieties; conditions (1) and
(2) hold for `(Xᵢ/G)` ([HJ] Proposition 5.13(2), pp. 33–34). The input is that a cofiltered system
of separated rigid spaces, open in projective analytifications, with perfectoid limit has
analytically separated limit ([HJ] Lemma 5.6, p. 30). Checks: the trivial group returns the tower;
an empty level gives an empty quotient; an action incompatible at one projection is excluded.

### P8.21 Zariski-closed loci in perfectoid towers

**Closed loci in towers.** Let `(Yᵢ)` be a cofiltered system of analytified quasi-projective
varieties over `K` with finite transitions and perfectoid limit `Y ~ lim Yᵢ`, and `Xᵢ ⊆ Yᵢ`
compatible closed subvarieties. Then `X = lim Xᵢ^◇` is perfectoid, `X → Y` is a Zariski-closed
embedding and `X ~ lim Xᵢ`: on an affinoid perfectoid `V = Spa(R, R⁺)` pulled back from finite
level, `X ∩ V = Spa(S, S⁺)` with `R → S` surjective, `S⁺` the integral closure of the image of `R⁺`,
`R⁺ → S⁺` almost surjective for the root ideal, and finite-level functions dense in `S`. This is a
perfectoidisation of the closed locus, not completeness of `R/I` ([HJ] Lemma 5.7, p. 30, and the
proof of Lemma 5.6; [Torsion] Theorem IV.1.1, pp. 67–69; PerfectoidSpaces P7.1–P7.2). For
`U = Spa(R, R⁺)` and Zariski-closed `Wᵢ → U` cut out by increasing ideals `Iᵢ`, `lim Wᵢ` is cut out
by `Σ Iᵢ`; for a closed immersion `Y → X` of quasi-projective varieties and `Z → X^an` from a
perfectoid space, `Z ×_{X^an} Y^an → Z` is a Zariski-closed embedding, cut out on affinoid
perfectoid `Z` by finitely many sections of `f^*ℰ` for a bundle `ℰ` surjecting onto the ideal sheaf
([HJ] Lemma 5.7, pp. 29–30). Checks: zero ideals give the identity, one unit ideal the empty space,
and `V(I + J) = V(I) ∩ V(J)`; in the raw quotient of the perfected disc by `T` the image of `T^{1/p}`
is a nonzero nilpotent killed in the perfectoid locus; analytification preserves identities,
composition and the empty scheme; in the perfectoid torus the finite-level locus `T^{1/pⁿ} = 1` has
preimage `pⁿℤ_p` inside the fibre `T = 1 ≅ ℤ_p(1)` with ring `C(ℤ_p, K)`.

### Examples

Beyond the Checks above: `ℤ/p` permuting the variables of a perfected polydisc in characteristic
`p` acts freely exactly off the small diagonal, and `ℤ/p` acting on `K⟨T⟩` by `T ↦ T + 1` in
characteristic `p` has invariants `K⟨T^p − T⟩`.

### Dependencies

PerfectoidSpaces P1 (P1.1, P1.24, P1.27), P2 (P2.3, P2.16, P2.17), P3, P4 (P4.15, P4.19), P5.3 and
P7 (P7.1, P7.2, P7.11); AdicSpacesPartII R0–R1; AdicEtaleGeometry A4; DiamondsAndVStacks D2, D4,
D5 and D6.4; the Mathlib and Tau Ceti declarations of the supplier table.

## Layer P9: continuous torsor descent with coefficients

### P9.1 The pro-étale site of a rigid space

**Affinoid perfectoid objects.** Let `X` be a locally noetherian adic space over `Spa(k, k°)` for a
complete nonarchimedean `k ⊇ ℚ_p`. Its pro-étale site, with the corrected covering condition
([Sch13E], correction (1), p. 1), is AdicEtaleGeometry A1. An object `U = lim Uᵢ` with affinoid
`Uᵢ = Spa(Rᵢ, Rᵢ⁺)` is affinoid perfectoid if `R⁺ = (colim Rᵢ⁺)^∧_p`, `R = R⁺[1/p]` is a perfectoid
pair; then `Û = Spa(R, R⁺) ~ lim Uᵢ`, and the points of `Spa(R, R⁺)` match those of `lim |Uᵢ|`.
Affinoid perfectoid objects form a basis, and their products with profinite sets stay affinoid
perfectoid ([Sch13] Definition 4.3, Lemma 4.5(i), p. 23, Proposition 4.8, p. 25, Lemma 4.10 and
Remark 4.11, p. 26, Corollary 6.6, p. 36; PerfectoidSpaces P6.14). The predicate carries the map to
`Spa(ℚ_p, ℤ_p)`, so characteristic-`p` bases are excluded. Checks: over `ℂ_p` the root tower of the
torus is affinoid perfectoid with pair `ℂ_p⟨T^{±1/p^∞}⟩` ([Sch13] Example 4.4, p. 23); a constant
`Spa k⟨T⟩` over a discretely valued mixed-characteristic `k` is not; the empty object is, the
constant rational `2`-adic point is not, and products with profinite sets preserve the condition.

### P9.2 Completed structure sheaves

**`Ô⁺` and `Ô`.** On `X_proét` put `O⁺ = ν^*O⁺_{X_ét}`, `O = ν^*O_{X_ét}`, `Ô⁺ = lim O⁺/pⁿ` and
`Ô = Ô⁺[1/p]`. For affinoid perfectoid `U` with pair `(R, R⁺)`: (i) `O(U) = colim Rᵢ`,
`O⁺(U) = colim Rᵢ⁺`; (ii) `Ô⁺(U) = R⁺`, `Ô(U) = R`; (iii) `(O⁺/pᵐ)(U)` is almost `R⁺/pᵐ` and
`Hⁱ(U, O⁺/pᵐ)` is almost zero for `i > 0`; (iv) `Hⁱ(U, Ô⁺)` is almost zero and `Hⁱ(U, Ô) = 0` for
`i > 0`; (v) `Ô⁺(U × S) = C(S, R⁺)` and `Ô(U × S) = C(S, R)` for profinite `S`. Almost is for the
root ideal of a pseudouniformiser with compatible roots (PerfectoidSpaces P0.2, P3.21) ([Sch13]
Definition 4.1, p. 21, Lemma 4.10, pp. 26–27, Corollary 6.6, p. 36). The completion steps make sense
for a ring sheaf on any site: sheafified quotients by `pⁿ`, their limit, and the sheafified
localisation at `p`. Checks: on a constant point `Spa(C, O_C)` the four section rings are `O_C`,
`C`, `O_C`, `C`, and on two points their squares with distinct idempotents; on the torus root tower
the completed ring contains `Σ_{n≥1} pⁿT^{1/pⁿ}`, which lies at no finite level; over `Spa(ℚ₂, ℤ₂)`
the constant one-point, empty and two-point objects give `ℤ₂`, `0`, `ℤ₂²` (integral) and `ℚ₂`, `0`,
`ℚ₂²`; if `p = 0` in all sections integral completion recovers `F` and rational completion is zero,
if `p` is a unit both completions vanish (so completing `O` cannot give `Ô`), and completion
commutes with finite products.

### P9.3 Pushforward to the étale site of a smooth rigid space

**`ν_*Ô_X`.** Let `k` be complete discretely valued of characteristic `0` with perfect residue field
of characteristic `p`, and `X` smooth rigid over `k`. Then `ν_*Ô_X = O_{X_ét}`, `ν_*Ô_X(n) = 0` for
`n ≥ 1`, `R¹ν_*Ô_X(1) ≅ Ω¹_{X/k}` and `R¹ν_*Ô_X(n) = 0` for `n ≥ 2` ([Sch13] Definition 6.8,
p. 37, Corollary 6.19, p. 41; Lemma 4.5 for toric charts); higher direct images are out of scope.
The Tate twist tensors with powers of the module of compatible `p`-power roots of unity, whose
`ℤ_p`-action is exponentiation modulo `pⁿ`. Checks: that module vanishes for the zero ring and
`ℚ` and is free of rank one over an algebraically closed complete field; the scalar `1 + p` has
residue `1` modulo `p` but differs from `1` modulo `p²` in characteristic `p²`; continuous
differentials vanish for the identity, are nonzero on the disc, and are zero on the empty space.
Needs P9.2 and PerfectoidSpaces P1.31.

### P9.4 Pro-étale Galois towers

**Galois towers with perfectoid limit.** Let `X` be a locally noetherian adic space over
`Spa(ℚ_p, ℤ_p)` or a perfectoid space, and `G` profinite with a cofinal decreasing sequence of open
normal subgroups `Gⱼ`. A pro-étale `G`-tower is a system of finite étale `G/Gⱼ`-Galois covers
`Xⱼ → X` with compatible right actions, a perfectoid `X_∞ ~ lim Xⱼ` with a right `G`-action
continuous on functions and equivariant projections, and an affinoid cover `V` of `X` with
`V_∞ = V ×_X X_∞` affinoid perfectoid; rational `U ⊆ V` then have `U_∞` affinoid perfectoid and form
a basis. In `X_proét`, `X_∞ ×_X X_∞ ≅ X_∞ × G` via `(x, g) ↦ (x, xg)`, and base change to `U ∈ X_proét`
gives a tower over `U` ([CHJ] §4.1, p. 28; AdicEtaleGeometry A4; DiamondsAndVStacks D3.10).
Checks: for `G = {1}` and `X` perfectoid the tower is `X` itself; for the trivial torsor
`X × G`, `O(X × G) = C(G, O(X))` with constant invariants; a free finite action with perfectoid
`Y → Y/G` finite étale gives a constant tower with `O(Y)^G = O(Y/G)`; on the torus over `ℂ_p` with
`G = ℤ_p(1)` acting by `T^{1/pⁿ} ↦ ζ_{pⁿ}^γ T^{1/pⁿ}` the invariants of `ℂ_p⟨T^{±1/p^∞}⟩` are the
series in integral powers of `T`; `γ^*(δ^*f) = (γδ)^*f`, with `(01)(12)` and `(12)(01)` differing at
`0`; over `Spa(ℂ_p[ε]/ε², ℂ_p° + ℂ_pε)` the reduction is a perfectoid tilde-limit that is neither an
isomorphism nor finite étale, so the locally noetherian branch alone does not give these
conclusions ([SW13] Remark 2.3.5, p. 18, Proposition 2.4.4, p. 20).

### P9.5 The Čech descent datum

**Čech complex as continuous cochains.** For a tower and `U` with `U_∞` affinoid perfectoid, the
Čech nerve of `U_∞ → U` is `U_∞ × Gⁿ`, `F(U_∞ × Gⁿ) = C(Gⁿ, F(U_∞))` for `F = Ô⁺, Ô` (with the `p`-adic
and lattice topologies), and the Čech complex is the continuous inhomogeneous cochain complex with
`d⁰(a)(g) = g(a) − a` and `d¹(b)(g, h) = g(b(h)) − b(gh) + b(g)`; in degree zero this is `F(U_∞)^G`
([BHW] Lemma 3.7, p. 10; [CHJ] Remark 2.25, p. 20). The cochain model extends Tau Ceti's
degree-`0`–`2` comparisons `ContCohomology.cochainEquiv0`–`cochainEquiv2` to all degrees and
non-discrete coefficients. For a profinite `G` and a filtered system of `G`-sets with open kernels,
`colim(Mᵢ^G) → (colim Mᵢ)^G` is a bijection, as for any group when the transitions are eventually
injective ([CHJ] Lemma 2.24, p. 20). Checks: for the trivial group the normalised complex is
`F(U)` in degree `0`, and on the identity cover the unnormalised differentials begin `0, id`; for
`ℤ/2` and `U_∞ = U ⊔ U` the equaliser is the diagonal; degree zero agrees with Mathlib's
`ContinuousCohomology.zeroIso`.

### P9.6 Descent of functions along a tower

**Function descent.** Let `X` be smooth rigid over a complete discretely valued `k ⊇ ℚ_p` with
perfect residue field and `X_∞ → X` a pro-étale `G`-tower. For every open, or qcqs étale, `U ⊆ X`:
`O⁺_X(U) = O⁺_{X_∞}(U_∞)^G` and `O_X(U) = O_{X_∞}(U_∞)^G`, as equalities of rings, from
`O_X = ν_*Ô_X` (P9.3) and the sheaf property of `Ô_X` for `U_∞ → U`; the `O⁺` case follows since
`h⁻¹(U) → U` is surjective on points ([CHJ] Lemma 2.26, p. 20). For a Galois cover of a rigid
variety and qcqs `U`, every sheaf pulled back from `Y_ét` has `F(U) = F(U ×_Y Y_∞)^G` (P9.5
applied to `colim F(U ×_Y Yⱼ)`). After base change to a completed algebraic closure `C`, for
affinoid `U` with affinoid perfectoid `U_∞`, `H^q(U_proét, O⁺/pᵐ)` is almost
`H^q_cts(G, (O⁺/pᵐ)(U_∞))`, and `H^q(U_proét, Ô⁺)` is almost `lim H^q_cts(G, O⁺(U_∞)/pᵐ)` when the
`R¹lim` term is almost zero ([CHJ] Remark 2.25, p. 20). For a uniform Banach `K`-algebra `A_∞` with
continuous `K`-algebra automorphisms, `A_∞^G` is a closed uniform subalgebra with
`(A_∞^G)° = (A_∞°)^G` ([CHJ] Proposition 2.22, p. 19). Check: the example over the dual numbers in
P9.4 shows the smooth hypothesis cannot be dropped.

### P9.7 Descent after product with a weight space

**Weight-extended function descent.** Let `L₀ ⊇ ℚ_p` be complete discretely valued with perfect
residue field, `L ⊇ L₀` perfectoid, `Y` affinoid over `L₀` smooth rigid or perfectoid, `X → Y` an
affinoid perfectoid pro-étale `Γ`-torsor and `𝒰` smooth over `L`. For affinoid `V ⊆ Y` with
`W = h⁻¹(V)` and affinoid `𝒰′ ⊆ 𝒰`: `O⁺(W × 𝒰′)^Γ = O⁺(V × 𝒰′)` and `O(W × 𝒰′)^Γ = O(V × 𝒰′)`, the
products being sousperfectoid (AdicSpacesPartIV R5; PerfectoidSpaces P2.17); product affinoids are
not a basis ([BHW] Lemma 3.7, p. 10). For `Y` affinoid perfectoid,
`O⁺_X(X)^Γ = O⁺_Y(Y)` and `O_X(X)^Γ = O_Y(Y)` ([BHW] Lemma 3.7). For Banach `K`-spaces `E` with
continuous `G`-action and `V` with trivial action, of countable type or with `K` discretely
valued, `E^G ⊗̂_K V → (E ⊗̂_K V)^G` is a natural topological isomorphism, isometric for an
orthonormal basis ([CHJ] Lemma 2.23(2), pp. 19–20; AdicSpacesPartII R0). Check: the region
`|T|, |S| ≤ 1`, `|T − S| ≤ |π|` of the bidisc contains `(0, 0)` and `(1, 1)` but not `(0, 1)`, so it is
not a product open.

### P9.8 Descent of finite locally free modules

**Module descent.** For a tower as in P9.6 and finite locally free `O_X`-modules (or locally free
`O⁺_X`-modules of finite rank) `E, F`, on affinoid `U` with `E(U)` finite projective by Kiehl
(AdicSpacesPartIII R3): `E(U) = (E ⊗ O_{X_∞})(U_∞)^G` and `Hom(E, F) = Hom_G(h^*E, h^*F)`, so pullback
is fully faithful on finite locally free modules. It is not essentially surjective: effectivity
needs a finite-level trivialisation (P9.10) or an integral coboundary (P9.13). The affine form: if
`A → B` is injective and every `G`-fixed element of `B` comes from `A`, then for finite projective
`M` the map `m ↦ 1 ⊗ m` is injective with image the fixed tensors; no averaging enters ([KL16]
Corollary 8.2.4, p. 163). The sheaf form holds for any continuous inverse-image functor between
sites with finite limits and ring sheaves `R → h_*B` identifying `R` with the fixed sections.
Lean: `finite_projective_sections_descent`.

### P9.9 Twisted character sheaves

**`ω_c`.** For a tower over a smooth rigid or perfectoid base (P9.6, P9.7), a coefficient algebra
`A` (a small `ℤ_p`-algebra with the mixed completed tensor, or a reduced affinoid `ℚ_p`-algebra),
and a continuous cocycle `c : G → (O(X_∞) ⊗̂ A)^×`, `c(γδ) = c(γ)·γ^*c(δ)`, put
`ω_c(U) = {f ∈ O(U_∞) ⊗̂ A : γ^*f = c(γ)⁻¹f}`, a sheaf of `O_X ⊗̂ A`-modules, and `ω_c⁺` likewise
with `O⁺` and a bounded coefficient lattice. For a coboundary change `c′(γ) = c(γ)·F/γ^*F`,
multiplication by `F` gives `ω_c ≅ ω_{c′}` ([CHJ] Definition 2.18, p. 17). For a uniform `ℚ_p`-Banach
algebra `A_∞` with profinite `G` and a profinite flat `ℤ_p`-module `M` (AdicSpacesPartIV R5),
`(A_∞ ⊗̂ M)^G = A_∞^G ⊗̂ M` and `(A_∞° ⊗̂ M)^G = (A_∞°)^G ⊗̂ M`, computed on bounded coefficient
families ([CHJ] Lemma 2.23(1), pp. 19–20). Checks: `c = 1` gives the invariants; for a coboundary
`F/γ(F)`, `f` is twisted invariant iff `f/F` is invariant; the constant `−1` on the trivial group is
no cocycle and its twisted invariants in `ℚ` vanish; on the torus over `ℂ_p` the character
`γ ↦ ζ_{pⁿ}^{−kγ}` has `ω_c = T^{k/pⁿ}·O_X`; for the cyclotomic tower of `Spa ℚ_p` with
`c = χ_cyc⁻¹`, `ω_c(X) = 0` ([Sch13] Proposition 6.16(ii), proof, pp. 40–41), so a character sheaf
can vanish; the diagonal `(Tⁿ)` in `ℚ_p⟨T⟩ ⊗ ∏ℤ_p` lies in the mixed tensor but not in the
projective Banach tensor with `M[1/p]`. Lean: `twistedInvariants`.

### P9.10 Finite-level comparison and local freeness

**Finite-level comparison.** Let `U` be affinoid, `Gₙ ⊴ G` open with `Uₙ = U_∞/Gₙ` and
`Γₙ = G/Gₙ`. If `c(γ) = (γ^*u/u)·cₙ(γ)` for a unit `u` of `O(U_∞) ⊗̂ A` and a cocycle `cₙ` of `Γₙ`
with values in `O(Uₙ) ⊗̂ A`, then `f ↦ fu` identifies `ω_c(U)` with the `cₙ`-twisted invariants of
`O(Uₙ) ⊗̂ A`, a direct summand which is finite projective of rank one over `O(U) ⊗̂ A`, compatible
with restriction; if such decompositions exist on a finite affinoid cover and the coefficient Kiehl
comparison of AdicSpacesPartIV R5 holds, then `ω_c = Loc(ω_c(X))` is locally projective of rank one
and trivial over the finite levels ([CHJ] paragraph after Proposition 2.27, pp. 21–22, and Theorem
2.28, p. 22). Lean: `finite_character_comparison`.

**Finite Galois descent.** For `A → B` injective, finite étale and Galois with finite group `H`
(`B ⊗_A B ≅ ∏_H B`, AdicEtaleGeometry A4's `Algebra.galoisTensorMap` bijective), `B` is
faithfully flat, `B^H = A`, and `M ↦ B ⊗_A M`, `N ↦ N^H` are inverse equivalences onto semilinear
`H`-modules preserving finite projectivity and rank; `N^H = eN` for `e = |H|⁻¹Σ_h h` when `|H|` is a
unit (proof of [CHJ] Theorem 2.28, p. 22). Checks: `B = A` with the trivial group is Galois;
`B = 0` satisfies the Galois condition over `A ≠ 0`, so injectivity is a separate hypothesis; a
nontrivial group acting trivially is not Galois; the swap on `𝔽₂ × 𝔽₂` is Galois over `𝔽₂` with
diagonal invariants although averaging is impossible; the Galois map sends `e₁ ⊗ e₂` to `(0, e₁)`.

**Approximation of units.** For quasicompact `U` with `O⁺(U_∞)` the `p`-adic completion of
`colim O⁺(Uₙ)`, every `t ∈ O(U_∞)^×` and `m ≥ 1` admit `n`, `sₙ ∈ O(Uₙ)^×` and
`t′ ∈ 1 + pᵐO⁺(U_∞)` with `t = t′sₙ` ([CHJ] Proposition 2.27, p. 21).

**Integral coboundaries.** For an integral cocycle and `F ∈ (O⁺(V_∞) ⊗̂ A°)^×` with
`γ^*F = c(γ)⁻¹F`, `ω_c⁺|_V = F·(O⁺_V ⊗̂ A°)` is free of rank one; without such `F` the integral
twisted invariants need not be locally free, since `eₙ` is not integral when `p | |Γₙ|`, and even
an integral `eₙ` is not enough: for `ℚ_p(√p)/ℚ_p`, `p` odd, with the sign twist the invariants
of `ℤ_p[√p]` are `√p·ℤ_p`, generating a proper ideal ([BHW] Theorem 4.8, proof, p. 18).

**Coefficient change.** For `A_𝒰` noetherian, `A_𝒰 → A_𝒵` surjective with kernel generated by a
regular `x`, `K` discretely valued and `ω_𝒰 = Loc` of a finite projective module with finite-level
decompositions over an affinoid `X_w`, the sequences `0 → ω_𝒰 → ω_𝒰 → ω_𝒵 → 0` (first map `·x`) and
their `H⁰(X_w, −)` are exact ([CHJ] Lemma 2.29, p. 22). For separated quasicompact `X` with a finite
affinoid cover carrying finite-level decompositions, flat coefficient rings and the Kiehl and
acyclicity hypotheses on intersections, the ordered Čech complex is bounded flat with
`C^•(ω_𝒰) ⊗ A_𝒰/I ≅ C^•(ω_{𝒰/I})`, hence `RΓ(X, ω_𝒰) ⊗^L A_𝒰/I ≅ RΓ(X, ω_{𝒰/I})` with spectral
sequence `Tor_{−i}(H^j(X, ω_𝒰), A_𝒰/I) ⇒ H^{i+j}(X, ω_{𝒰/I})`, and for projective dimension `≤ 1` the
sequence `0 → H^q ⊗ A_𝒰/I → H^q(ω_{𝒰/I}) → Tor₁(H^{q+1}, A_𝒰/I) → 0`, so `H⁰` need not commute with
quotients for non-affinoid `X` ([CHJ] Lemma 2.29, pp. 22–23; [GR] §2.4.10, p. 24). Checks: a flat
module, a regular `x` and a surjection with kernel `xM` give an exact sequence; `0` is not regular in
`ℤ`; `ℤ --2→ ℤ` reduced to `𝔽₂ --0→ 𝔽₂` has `H⁰ = 0, 𝔽₂` and `H¹ = 𝔽₂, 𝔽₂`, with
`Tor₁(H¹, 𝔽₂) ≅ 𝔽₂` contributing in degree `0`.

**Profinite coefficients and inverse limits.** For a tower over a rigid space over `ℚ_p` and a
profinite flat `ℤ_p`-module `M` with continuous `G`-action and `G`-stable open `Iᵢ` with `M/Iᵢ`
finite of `p`-power exponent, `V ↦ (M ⊗̂ Ô(V ×_X X_∞))^G` is `ℚ̂_p ⊗ lim(ν^*M̃ᵢ ⊗ O⁺_X)`, almost at
finite level and exactly after the limit and inverting `p` ([CHJ] Lemma 4.1, p. 28). For finite
`G`-modules `Mₖ` of `p`-power exponent with surjective transitions and `Fₖ = ν^*M̃ₖ ⊗ O⁺`,
`Rⁱlim Fₖ` and `H^j(U, lim Fₖ)` are almost zero for positive degrees on the affinoid perfectoid
basis, and finiteness of `Hⁱ(X_C, Mₖ)` gives Mittag-Leffler, so cohomology commutes with the limit
([CHJ] Proposition 4.4, proof, pp. 29–30). Checks: sections of a limit of module sheaves are the
limit of sections; the zero system, a constant finite module with trivial monodromy, and the
exclusion of a `ℤ_p` stage.

### P9.11 Sheaf equalizers after coefficient base change

**Equalizers on every open.** Let `K` be perfectoid of mixed characteristic, `Y` affinoid smooth
rigid or affinoid perfectoid over `K`, `X → Y` an affinoid perfectoid pro-étale `Γ`-torsor and `𝒰`
smooth rigid over a perfectoid extension of `K`. For `h_𝒰 : X ×_K 𝒰 → Y ×_K 𝒰`,
`(h_{𝒰*}O)^Γ = O` and `(h_{𝒰*}O⁺)^Γ = O⁺` on every open of `Y ×_K 𝒰`, which is stronger than P9.7.
The product is smoothoid, so the integral structure sheaf is the pushforward from the v-site and
the base-changed torsor is a v-cover ([Heuer] Definition 2.2, p. 8, Lemma 2.6(2)–(3), p. 9,
Proposition 2.9(2), p. 10; [KL16] Theorem 8.2.3, pp. 162–163, for smooth rigid `Y`). Checks: bounded
functions on an affinoid are its plus ring, on the empty space the whole zero ring, and exclude the
inverse of a topologically nilpotent unit.

### P9.12 Function descent over a seminormal base

**Seminormal bases.** For `K` complete of mixed characteristic, `Y` a seminormal rigid space over
`K` and `X_∞ → Y` a pro-étale `G`-tower with perfectoid limit, `O_Y = (h_*O_{X_∞})^G` and
`O_Y⁺ = (h_*O⁺_{X_∞})^G`, by the argument of P9.6 with `O_Y ≅ ν_*Ô_Y` for seminormal `Y` ([KL16]
Definition 3.7.1, Theorem 8.2.3 and proof, pp. 162–163; [Berkeley] Proposition 10.2.3, p. 78).
Seminormality of a ring: reduced, and `a³ = b²` forces a common `c` with `c² = a`, `c³ = b` ([KL16]
Definition 1.4.1, p. 19, Remark 3.7.3, p. 80). Checks: fields are seminormal, the property commutes
with finite products, and the dual numbers over `ℚ` and the cusp algebra `K⟨t², t³⟩` are not.

### P9.13 Integral effectivity in finite rank

**Integral effectivity.** Let `h : X_∞ → X` be a tower with `O⁺` function descent and `N⁺` a
locally free finite-rank `O⁺_{X_∞}`-module with continuous semilinear `G`-action, free on `h⁻¹Uᵢ`
with action `v ↦ Cᵢ(g)g(v)`, `Cᵢ(gh) = Cᵢ(g)g(Cᵢ(h))`. If there are `Pᵢ ∈ GL(O⁺(h⁻¹Uᵢ))` with
`Cᵢ(g)g(Pᵢ) = Pᵢ`, then `E⁺ = (h_*N⁺)^G` is locally free and `h^*E⁺ → N⁺` is an isomorphism; the
converse holds after refining the cover, so an integral coboundary is exactly the local
effectivity condition and a rational one is not enough ([BHW] Theorem 4.8, proof, p. 18). With
bounded open lattices `E₀ ⊆ E` and `V₀ ≅ (⊕_I O)^∧_π`, `F₀ = E₀ ∩ E^G`, the map
`(F₀ ⊗ V₀)^∧ → ((E₀ ⊗ V₀)^∧)^G` is a topological isomorphism (coordinatewise as in [CHJ] Lemma
2.23(2); torsion-freeness gives `F₀ ∩ πⁿE₀ = πⁿF₀`). Checks: rank zero has a unique vector; over
`ℚ × ℚ` with the swap the frame `(diag(1, 2), diag(2, 1))` has cocycle `(diag(1/2, 2), diag(2, 1/2))`;
averaging `c(σ)σ` with `c(σ) = (1/2, 2)` lands on the line through `(1, 2)`; the sign twist on
`ℤ[√p]` has fixed lattice `√p·ℤ`. Lean: `integral_matrix_coboundary_effectivity`.

### Examples

The `ℤ_p(1)`-tower of the perfectoid torus, the trivial torsor, the cyclotomic tower of `Spa ℚ_p`,
`ℚ_p(√p)/ℚ_p` and the non-product open `|T − S| ≤ |π|` of the Checks above; the swap on `K × K` in
residue characteristic `2`, where averaging is unavailable and the descent statements do not use it.

### Dependencies

PerfectoidSpaces P0 (P0.2, P0.5), P1.31, P2 (P2.7, P2.8, P2.17), P3.21, P5 (P5.1, P5.3), P6.14 and
P7 (P7.1, P7.2); layer P8 (free quotients, P8.7); AdicEtaleGeometry A1 and A4; AdicSpacesPartII
R0; AdicSpacesPartIII R3; AdicSpacesPartIV R4–R5; DiamondsAndVStacks D2.5 and D3.10.

## Downstream consumers

DiamondsAndVStacks §2.9 and §6.9 use the tower forms of module descent (P9.8) and seminormal
function descent (P9.12); its site equivalences and geometric full faithfulness are proved there
directly from [KL16] and [Berkeley]. Perfectoid Shimura varieties and period spaces consume the
finite quotients of good towers, closed perfectoid loci, and descent of functions, modules and
character sheaves with weight-space coefficients.

## References

Locators are theorem and section numbers of the linked versions, with page numbers where stable.

- [GR] Ofer Gabber and Lorenzo Ramero, Almost ring theory, LNM 1800 (2003); arXiv:math/0201175v3. https://arxiv.org/abs/math/0201175.
- [Sch12] Peter Scholze, Perfectoid spaces, Publ. IHÉS 116 (2012); arXiv:1111.4914. https://arxiv.org/abs/1111.4914.
- [ECD] Peter Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4. https://arxiv.org/abs/1709.07343.
- [Berkeley] Peter Scholze and Jared Weinstein, Berkeley lectures on p-adic geometry, author manuscript dated 27 March 2020. https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf.
- [KL I] Kiran S. Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: Foundations, Astérisque 371 (2015); arXiv:1301.0792v5. https://arxiv.org/abs/1301.0792v5.
- [KL16] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory, II: imperfect period rings, arXiv:1602.06899v3. https://arxiv.org/abs/1602.06899.
- [Heuer] Ben Heuer, Moduli spaces in p-adic non-abelian Hodge theory, arXiv:2207.13819v2. https://arxiv.org/abs/2207.13819v2.
- [Sch13] Peter Scholze, p-adic Hodge theory for rigid-analytic varieties, Forum Math. Pi 1 (2013); arXiv:1205.3463v2. https://arxiv.org/abs/1205.3463.
- [Sch13E] Peter Scholze, Erratum to 'p-adic Hodge theory for rigid-analytic varieties'. https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf.
- [HK] David Hansen and Kiran Kedlaya, Sheafiness criteria for Huber rings. https://kskedlaya.org/papers/criteria.pdf.
- [Wedhorn] Torsten Wedhorn, Adic spaces, arXiv:1910.05934v1. https://arxiv.org/abs/1910.05934.
- [Torsion] Peter Scholze, On torsion in the cohomology of locally symmetric varieties, Ann. of Math. 182 (2015); arXiv:1306.2070v2. https://arxiv.org/abs/1306.2070.
- [SW13] Peter Scholze and Jared Weinstein, Moduli of p-divisible groups, Camb. J. Math. 1 (2013); arXiv:1211.6357v2. https://arxiv.org/abs/1211.6357.
- [BHW] Christopher Birkbeck, Ben Heuer and Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties, Ann. Inst. Fourier (2023); arXiv:1902.03985. https://arxiv.org/abs/1902.03985.
- [CHJ] Przemysław Chojecki, David Hansen and Christian Johansson, Overconvergent modular forms and perfectoid Shimura curves, Doc. Math. 22 (2017); arXiv:1507.04875. https://arxiv.org/abs/1507.04875.
- [HJ] David Hansen and Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures, arXiv:2011.03951v2. https://arxiv.org/abs/2011.03951v2.
- [Hansen] David Hansen, Quotients of adic spaces by finite groups, Math. Res. Lett. 28 (2021); author manuscript. http://davidrenshawhansen.net/adicgpquotient.pdf.
- [CGJ] Ana Caraiani, Daniel Gulotta and Christian Johansson, Vanishing theorems for Shimura varieties at unipotent level, J. Eur. Math. Soc. (2022); arXiv:1910.09214. https://arxiv.org/abs/1910.09214.
- [BS22] Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology, Ann. of Math. 196 (2022); arXiv:1905.08229v4. https://arxiv.org/abs/1905.08229.

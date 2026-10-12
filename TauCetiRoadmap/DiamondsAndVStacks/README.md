# Roadmap: diamonds and v-stacks

**Summary.** Diamonds let perfectoid covers be used to study spaces that are not themselves
perfectoid. This roadmap builds their foundations on Tau Ceti's perfectoid spaces: the spectral
topology, pro-categories, coherent topoi, size bounds and general-site stacks (D0); the totally and
strictly totally disconnected perfectoid spaces, w-localisation and the universally open strictly
totally disconnected cover (D1); the pro-étale and v-topologies with descent and acyclicity of `O`
and `O⁺` (D2); effective descent and the classes of morphisms of v-stacks (D3); diamonds, small
v-sheaves and small v-stacks with their underlying spaces (D4); spatial diamonds, limits,
presentations, relative representability and the Berkovich (maximal Hausdorff) quotient (D5); and
the diamondification `Y ↦ Y^◇` of analytic and integral pre-adic spaces (D6). The end results are
the étale-site identification `Y_ét ≃ Y^◇_ét` for an analytic adic space `Y` over `Spa ℤ_p` ([ECD]
Theorem 1.5), the descent theorem `H⁰_v(X, O) = R`, `H^{>0}_v(X, O) = 0` on affinoid perfectoid
`X = Spa(R, R⁺)` with the subcanonicity of the v-site ([ECD] Theorem 1.2), and full faithfulness of
diamondification on seminormal rigid spaces over a fixed field. They feed the étale cohomology of
diamonds and the six operations.

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| D0 | Spectral topology, size bounds, coherent topoi, stacks | quotient and limit criteria, Hochster, pro-categories, cutoff cardinals, stackification |
| D1 | Disconnected perfectoid spaces | Fargues' criterion, affinoidness, automatic flatness, w-localisation, the universally open cover |
| D2 | Pro-étale and v-topologies | v-descent of `O`, subcanonicity, acyclicity, vector bundles |
| D3 | Effective descent and morphisms of stacks | descent of affinoid, pro-étale and étale objects; étale, quasi-pro-étale, separated maps; torsors |
| D4 | Diamonds and small v-stacks | quotients, atlases, underlying spaces, geometric-point criteria |
| D5 | Spatial geometry | permanence, limits, presentations, representability, Berkovich quotient |
| D6 | Diamondification | `Spd`, the diamond of an analytic adic space, étale sites, integral and rigid comparisons |

## Scope and ownership

This roadmap owns, beyond the targets listed layer by layer: locally spectral spaces and the
spectral calculus not already in Mathlib or Tau Ceti; pro-categories as `(Ind Cᵒᵖ)ᵒᵖ` with spectral
spaces as pro-objects of finite `T₀` spaces; the qcqs vocabulary and cohomology of algebraic topoi;
general-site stackification, 2-fibre products and quotient stacks; the pro-étale and v-sites on
perfectoid spaces; diamonds, spatiality and diamondification. PerfectoidSpaces (imported) owns
perfectoid Tate rings and spaces (`Perfd`, `Perf` as full subcategories of Tau Ceti's
`PreAdicSpace`), tilting and untilts (P1–P2), almost purity (P3), immersions and separatedness (P4),
finite-stage étale descent (P5), `κ`-small spaces, pro-étale morphisms, products with profinite sets
and bounded pro-objects (P6); its P7.11 uses the same compact-open covering condition as the
v-precoverage defined here. AdicEtaleGeometry supplies the étale geometry of analytic adic spaces
(A1) and the perfectoid torsor presentation of a Tate pair (A4); AdicSpacesPartII the Tate norm and
fixed-field rigid spaces (R0–R1); AdicSpacesPartIII formal schemes and specialisation (F0, R2) and
the Gel'fand spectrum (R3); PerfectoidTowers the descent of modules and of functions along a
pro-étale tower over a seminormal base (P9). Scheme-theoretic stacks and the Čech, Leray and
flasque-vanishing statements on general sites are cited from the Stacks Project; the general
canonical compactification, derived left completion and integral smallness belong to the étale
cohomology of diamonds, not here.

## Conventions

Fix a prime `p`. `Perfd` is the category of perfectoid spaces and `Perf` its characteristic-`p`
subcategory; D1–D3 work in `Perfd`, D4–D6 in `Perf`. Perfectoid spaces have sheaf structure
presheaves: sheafiness is part of PerfectoidSpaces' `isPerfectoidSpace`.
`|X|` is the underlying space; `x ⤳ y` means `y` is a specialisation of `x`; a generalising subset
contains all generalisations of its points. "qc", "qs", "qcqs" abbreviate quasicompact and
quasiseparated. For stacks, quasiseparated maps have qc and qs diagonal, and object quasicompactness
is distinct from quasicompactness of `X → *`. Étale and quasi-pro-étale maps of stacks include local
separatedness ([ECD] Convention 10.2). Fibre products of stacks are 2-fibre products. A marked
untilt `(X♯, ι)` includes `ι : X♯♭ ≅ X`. Size is controlled by cutoff cardinals inside fixed
universes; "small v-sheaf" means [ECD] Definition 12.1. Cohomology is Mathlib's Ext-based `Sheaf.H`;
almost vanishing of `O⁺` is never upgraded to vanishing. Each target gives its hypotheses and source
locator, its discriminating Checks, and the Lean declarations carrying it, if any.

## Exact supplier contracts

| Object | Declaration at the pins | Layers |
| --- | --- | --- |
| Spectral spaces and maps | Mathlib `SpectralSpace`, `IsSpectralMap`, `QuasiSeparatedSpace`, `PrespectralSpace`, `GeneralizingMap` | D0–D1 |
| Constructible topology | Mathlib `constructibleTopology`, `WithConstructibleTopology`, `compactSpace_withConstructibleTopology` | D0 |
| Pro-constructible sets | Tau Ceti `IsProConstructible`, `IsProConstructible.spectralSpace`, `IsProConstructible.isCompact`, `IsSpectralMap.continuous_constructibleTopology` | D0–D1 |
| Quotients and components | Mathlib `IsQuotientMap`, `Continuous.isClosedMap`, `Quotient.compactSpace`, `ConnectedComponents.totallyDisconnectedSpace`, `T2Quotient`, `MulAction.orbitRel` | D0, D5 |
| Spectra, pro-objects, presentations | Mathlib `PrimeSpectrum`, `Ind`, `IsCofiltered.cofilteredClosure`, `CompHaus.projectivePresentation`, `Filter.Product` | D0 |
| Size | Mathlib `Cardinal.IsStrongLimit`, `Cardinal.beth`; PerfectoidSpaces `completion_cardinality_bound`, `IsKappaSmall`, `HasKappaSmallPresentation`, `ProKappa` | D0–D2 |
| Sites and cohomology | Mathlib `Precoverage.toGrothendieck`, `GrothendieckTopology.Subcanonical`, `Presheaf.IsSheaf`, `Sheaf.H`, `constantSheaf`, `TopCat.Presheaf.IsFlasque`; Tau Ceti `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` | D0, D2 |
| Stacks and representability | Mathlib `Pseudofunctor.DescentData`, `Pseudofunctor.IsStack`, `CategoricalPullback`, `Functor.IsRepresentable`, `MorphismProperty.presheaf` | D0, D3–D5 |
| Covers and continuous maps | Mathlib `IsCompactOpenCovered`, `AlgebraicGeometry.QuasiCompactCover`, `ContinuousMap.yonedaPresheaf`, `equalizerCondition_yonedaPresheaf` | D2–D3 |
| Perfectoid spaces | PerfectoidSpaces `Perfd`, `Perf`, `isPerfectoidSpace`, `isAffinoidPerfectoid`, `IsPerfectoidTateRing`, `hasPullbacks`; Tau Ceti `PreAdicSpace`, `PreAdicSpace.isSheafy`, `PreAdicSpace.forgetToTop`, `presentationLimitPreAdicSpace`; Mathlib `PresheafedSpace.Γ` | D1–D2 |
| Huber pairs and `Spa` | Tau Ceti `Pair`, `IsTateRing`, `IsPseudoUniformizer`, `spa`, `ValuationSpectrum.comap`, `spectralSpace_spa_of_pairOfDefinition`, `spaCompletionHomeomorph`, `IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic` | D1, D5–D6 |
| Flatness and seminorms | Mathlib `RingHom.Flat`, `RingHom.FaithfullyFlat`, `Ideal.quotientMap`, `MulRingSeminorm`, `IsNonarchimedean` | D1, D5 |
| Perfectoid fields in Checks | PerfectoidSpaces `padicCyclotomic`, `isPerfectoidField_padicCyclotomic`, `isPerfectoidField_of_isAlgClosed` | D1 |

## How to read the build

D0 is topology, category theory and ordinary sheaf theory and has four independent strands (spectral
spaces; quotients and limits; topoi and cohomology; size and stacks). D1 builds the disconnected
covers on which every descent argument of D2–D3 runs; D4 defines diamonds and their spaces; D5
develops spatial geometry; D6 attaches diamonds to adic spaces. Within a layer the order is
thematic. The Lean file carries the targets that can be stated against Mathlib, Tau Ceti and
PerfectoidSpaces as they stand; the others depend on carriers (pro-étale morphisms, stacks,
diamonds, untilts) that are formalisation targets in their own right and are stated here only.

## Layer D0: spectral, categorical and size foundations

Foundations on existing library carriers: spectral and locally spectral spaces, their quotients and
limits, pro-categories, coherent topoi and their cohomology, cutoff cardinals, and stacks on a
general site.

### D0.1 Locally spectral spaces and spectral maps

**Locally spectral spaces.** A space is locally spectral if it has an open cover by spectral
subspaces; a continuous map `f : X → Y` of locally spectral spaces is spectral if for every spectral
open `U ⊆ X` mapping into a spectral open `V ⊆ Y` the restriction `U → V` is spectral, all pairs
`(U, V)` being tested ([ECD] Definition 2.1, p. 10). Prove: a space is spectral iff it is locally
spectral and qcqs ([KL15] Definition 8.1.1, p. 156); locally spectral spaces have a basis of qc
opens and are sober; open subspaces are locally spectral; the map condition may be tested on one
cover, agrees with `IsSpectralMap` between spectral spaces, and is stable under composition. An open
`U` of a spectral space has spectral inclusion exactly when it is qc. Checks: `Spa(A, A⁺)` with a
pair of definition is spectral; discrete `ℕ` is locally spectral and not qc, so not spectral; `ℝ` is
not locally spectral; `ℕ × ℕ → ℕ` is locally spectral but not spectral; the map from the one-point
compactification of `ℕ` to `ℝ` (`n ↦ 1/(n+1)`, `∞ ↦ 0`) and positivity `ℝ → Prop` both satisfy the
relative condition, as `ℝ` has no nonempty spectral open, while their composite does not, so
composition needs a locally spectral middle space. Lean: `IsLocallySpectralSpace`,
`spectralSpace_iff_isLocallySpectralSpace`.

### D0.2 The constructible topology is profinite

**Profinite constructible topology.** For `X` spectral, `X` with the topology generated by
constructible subsets is compact, Hausdorff and totally disconnected; if `X = lim X_i` with finite
`T₀` stages along spectral maps, `X_cons` is the limit of the discrete `X_i` ([ECD] §2, paragraph
after Theorem 2.2, p. 10). Compactness is Mathlib's `compactSpace_withConstructibleTopology`.
Checks: the constructible topology of the Sierpiński space `Spec` of a DVR is discrete; on discrete
`ℕ`, which is not spectral, it is discrete and not compact; for `Spec` of a countable product of
fields, `X = X_cons` is the Stone space of the subsets of the index set. Lean:
`WithConstructibleTopology.t2Space_totallyDisconnectedSpace`.

### D0.3 Pro-constructible subsets

**Images of pro-constructible sets.** Pro-constructible subsets of a spectral space are those closed
in `X_cons` (Tau Ceti's `IsProConstructible`), and the image of one under a spectral map of spectral
spaces is pro-constructible ([ECD] Lemma 2.3, p. 10); on a locally spectral space the notions are
tested on spectral opens. Checks: `∅` and `X`; in the Sierpiński space the open point is
pro-constructible and generalising, the closed point pro-constructible and not generalising; for a
rank-two `K⁺`, the rank-one point of `Spa(K, K⁺)` is open. Lean: `isProConstructible_image`.

### D0.4 Closure of a pro-constructible subset

**Closures are specialisations.** For `S` pro-constructible in a spectral `X`, `closure S` is the
set of specialisations of points of `S` ([ECD] Lemma 2.4, pp. 10–11); dually, a pro-constructible
generalising `S` is the intersection of the qc opens containing it ([ECD] proof of Lemma 2.7, p.
12). Checks: in the Sierpiński space `True ⤳ False` and not conversely, so `closure {True}` is
everything and `{False}` is closed; on the closed unit disc the rank-one points form a generalising
dense set that is not an intersection of qc opens, so pro-constructibility is needed. Lean:
`closure_eq_setOf_specializes_of_isProConstructible`,
`eq_sInter_of_isProConstructible_of_stableUnderGeneralization`.

### D0.5 The inverse topology

**Hochster duality.** The inverse topology on a spectral `X` is generated by the complements of qc
opens; it is spectral, reverses specialisation, applied twice returns the original topology, has the
same constructible topology, and a map is spectral for the original topologies iff for the inverse
ones ([KL15] Definition 8.1.4, p. 156, after Hochster). Checks: a finite discrete space is
unchanged; on the Sierpiński space the closed point becomes open; on discrete `ℕ` the inverse
topology is cofinite and not sober, so spectrality is needed. Lean: `inverseTopology`,
`spectralSpace_inverseTopology`.

### D0.6 The profinite space of connected components

**Profinite `π₀`.** For `X` spectral, `ConnectedComponents X` is Hausdorff, hence profinite; its
clopens are those of `X`, and the component of `x` is the intersection of its clopen neighbourhoods
([ECD] proof of Lemma 7.3(i), p. 31). Mathlib's Hausdorffness instance needs `X` Hausdorff, which a
spectral space is not. Checks: a connected spectral space has one component; the Sierpiński space
has two clopens while its constructible topology has four. Lean: `t2Space_connectedComponents`.

### D0.7 Generalising surjections are quotient maps

**Quotient criterion.** A surjective generalising spectral map of spectral spaces is a quotient map
([ECD] Lemma 2.5, p. 11); a continuous surjection from a qc space onto a compact Hausdorff space is
one too ([ECD] Lemma 2.6, Mathlib `Continuous.isClosedMap`). Check: the identity `X_cons → X` of the
Sierpiński space is a bijective spectral map that is neither generalising nor a quotient map. Lean:
`isQuotientMap_of_generalizingMap`.

### D0.8 Quotients by pro-constructible equivalence relations

**`T₀` quotients and invariant neighbourhoods.** For `X` quasiseparated and locally spectral and
`R ⊆ X × X` a pro-constructible equivalence relation with qc generalising projections `s, t`, the
quotient `X/R` is `T₀`, and every qc open `W` lies in an `R`-invariant open `U` contained in
`E' = t(s⁻¹(W'))` for a qc open `W' ⊇ t(s⁻¹(W))`, an invariant intersection of qc opens ([ECD] Lemma
2.7 with proof, pp. 11–12). Checks: on the convergent sequence `{0} ∪ {1/n}` with `0 ∼ 1`, the
saturation of `{1}` is not open, so `t(s⁻¹(W))` itself cannot be required; the diagonal and the
total relation; for the total relation on discrete `ℕ` the projections are not qc and the quotient
map has non-qc preimage of the point.

### D0.9 Spectral and locally spectral quotients

**Spectral quotient criterion.** For `X` spectral and `R` pro-constructible with generalising
projections, if `X/R` has a basis of opens with qc preimages, then `X/R` is spectral and `q` is
spectral and generalising ([ECD] Lemma 2.9, pp. 12–13). In the situation of D0.8 with `R → X` open,
`X/R` is locally spectral and quasiseparated and `q` is open, spectral and qcqs ([ECD] Lemma 2.10,
p. 13). Check: for `X` the Stone–Čech compactification of discrete `[0, 1]` and `R = X ×_{[0,1]} X`,
the quotient `[0, 1]` is not spectral ([ECD] Remark 2.8). Lean: `spectralSpace_quotient`.

### D0.10 Cofiltered limits of spectral spaces

**Limits.** A cofiltered limit `X` of spectral spaces along spectral maps is spectral with spectral
projections; a map from a spectral space to `X` is spectral iff its composites are; if those
composites are generalising so is the map, and a surjective one is then a quotient map ([ECD] Lemma
2.11, pp. 13–14). Checks: a one-object index gives `X_i`; the constant discrete Boolean tower has a
two-point limit. Lean: `spectralSpace_limit`.

### D0.11 Spectral submersions

**Spectral submersions.** A spectral submersion is a surjective spectral map of spectral spaces
`f : X → Y` such that `U ⊆ Y` is open whenever `f⁻¹(U)` is qc open; it suffices to test
constructible `U`, spectral quotient maps are spectral submersions, and they compose ([Arc]
Definition 2.14 and Remark 2.15, p. 12). Checks: identities and surjective generalising spectral
maps are spectral submersions; the inclusion of the generic point of the Sierpiński space is not
surjective; the identity `X_cons → X` of the Sierpiński space is not a spectral submersion.

### D0.12 Limits of spectral submersions

**Stability under limits.** For a morphism `f_i : X_i → Y_i` of cofiltered diagrams of spectral
spaces with spectral transitions, if every `f_i` is a spectral submersion so is `lim f_i` ([Arc]
Lemma 2.17, pp. 12–13), while a limit of ordinary quotient maps need not be a quotient map ([Arc]
Remark 2.18). Check: constant systems return the given map.

### D0.13 Pro-categories and spectral spaces

**`Pro(C) = Ind(Cᵒᵖ)ᵒᵖ`.** For a category `C` (small on the relevant slices), the pro-category has
cofiltered diagrams as objects and `Hom(lim Y_i, lim Z_j) = lim_j colim_i Hom(Y_i, Z_j)`; Mathlib's
`Ind` gives the carrier, its cofiltered limits and, for finite limits in `C`, finite limits. The
bounded variant `Pro_κ` (presentations with fewer than `κ` arrows) is PerfectoidSpaces `ProKappa`.
The category of spectral spaces with spectral maps is equivalent to `Pro` of finite `T₀` spaces, and
every spectral space is the limit of its finite `T₀` quotients ([ECD] Theorem 2.2, last sentence, p.
10; [BS15] §2.1, p. 5). Checks: `Pro(finite sets)` is profinite sets; for the system `ℤ/pⁿ`, the
identity lies in `lim colim Hom` but not in the image of `colim lim Hom`; a finite `T₀` space is a
constant pro-object.

### D0.14 Ordinal assembly of cofiltered limits

**Cardinal induction on cofiltered diagrams.** A small cofiltered `I` of uncountable size `λ` is an
increasing union of cofiltered subcategories `I_α`, `α < λ`, of size at most `max(ℵ₀, |α|)`, closed
under identities, composition, finite cones and equalisers (from Mathlib's
`IsCofiltered.cofilteredClosure`); a countable `I` has a cofinal sequence; and
`lim_I F ≅ lim_α lim_{I_α} F` ([ECD] proofs of Lemma 11.22, Proposition 11.23, pp. 63–64, and Lemma
12.17, pp. 73–74). No cofinal ordinal chain in `I` is claimed. Checks: `ℕᵒᵖ` is its own chain; a
constant Boolean diagram has a two-point limit at every stage.

### D0.15 Hochster realisation

**Hochster's theorem.** A space is spectral iff it is homeomorphic to `Spec A` for a commutative
ring `A`, iff it is a limit of finite `T₀` spaces ([ECD] Theorem 2.2, p. 10). Checks: `∅ = Spec 0`
and a point is `Spec` of a field; the Sierpiński space is `Spec ℤ_p` and is realised by no finite
ring; `Spec` does not commute with limits, as `lim Spec(ℤ/pⁱ)` is a point while `Spec ℤ_p` has two.
Lean: `spectralSpace_iff_nonempty_homeomorph_primeSpectrum`.

### D0.16 Profinite presentations of compact Hausdorff spaces

**Compact Hausdorff quotients.** Every compact Hausdorff `T` is the quotient of the profinite
`Ultrafilter T` by the closed relation `S ×_T S` (Mathlib `CompHaus.projectivePresentation`), and
conversely the quotient of a compact Hausdorff space by a closed equivalence relation is compact
Hausdorff ([ECD] Remark 2.8, p. 12; Example 11.12, p. 58). Checks: `[0, 1]` arises this way and is
not profinite; `ℤ_p` modulo translation by the dense `ℤ` has a non-closed relation and a
non-Hausdorff quotient. Lean: `t2Space_quotient_of_isClosed`.

### D0.17 Quasicompact and quasiseparated objects; algebraic topoi

**qcqs in a topos.** In `Sheaf J (Type u)` on a small site, `X` is qc if every jointly epimorphic
family `X_i → X` has a finite jointly epimorphic subfamily, qs if fibre products over `X` of qc
objects are qc; a map is qc if its base changes to qc objects are qc, qs if its diagonal is qc; the
topos is algebraic if a generating full subcategory of qcqs objects is closed under fibre products
and has qs maps to `*` ([ECD] §8, pp. 40–41; [SGA 4 VI] Definitions 1.1, 1.7, 1.13, 2.3). Prove
stability of qc and qs maps under composition and base change, the qs criterion on a qcqs cover
([SGA 4 VI] Corollaries 1.17, 2.6, 2.8), and that `X` is qc when `*` is qc and `X → *` is qc.
Checks: `Set` is algebraic with finite sets qc; sheaves on discrete `ℕ` form an algebraic topos
whose terminal object is not qc while `id_*` is a qc map; sheaves on `ℝ` are not algebraic; the
terminal v-sheaf on `Perfd` is not qs (D2.4).

### D0.18 Filtered colimits and cohomology on algebraic topoi

**Cohomology commutes with filtered colimits.** For a qcqs object `X` of an algebraic topos and a
filtered system of abelian sheaves, `colim_j Hⁱ(X, F_j) → Hⁱ(X, colim_j F_j)` is an isomorphism for
all `i`, sections commute with filtered colimits for sheaves of sets, and for sheaves of groups so
do `H⁰` and the torsor classes `H¹` defined through stackification of the classifying prestack
([ECD] proof of Proposition 8.2, pp. 39–40; [SGA 4 VI] Corollary 5.2, Lemma 5.4). Check: on discrete
`ℕ` with `F_j = ℤ` on `{0, …, j}`, the degree-zero map is `⊕ ℤ → ∏ ℤ`, not surjective, so
quasicompactness is needed; `H¹` of the constant `ℤ/2` on the circle has two torsor classes.

### D0.19 Čech-to-derived, Leray and acyclic bases

**Spectral sequences.** The Čech-to-derived spectral sequence of a cover, the Leray spectral
sequence `H^a(X, R^b f_* F) ⇒ H^{a+b}(Y, F)` of a morphism of topoi `f : Y → X` (the direct image
preserving injectives because the inverse image is exact), and the comparison of Čech and sheaf
cohomology on a fibre-product-stable basis of acyclic objects that refines all covers are used on
the sites of D2 with the hypotheses of [ECD] Proposition 8.5(iii) and the proof of Proposition 8.8,
pp. 41–43 ([Stacks] Tags 03AV, 0732, 0734). Check: on an algebraic topos the affinoid basis
satisfies the refinement and fibre-product hypotheses.

### D0.20 Flasque constant sheaves

**Constant sheaves on irreducible spaces.** On an irreducible space the constant sheaf `A_X` has
value `A` on nonempty opens and `0` on `∅` and is flasque ([Stacks] Tag 02UW), so its positive
cohomology vanishes by Tau Ceti's `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`. Checks: on
`Spec` of a DVR the restriction to the generic point is the identity; on two discrete points the
global sections are `A × A` (flasque but not constant); on the circle `ℤ` is not flasque and
`H¹ = ℤ`. Lean: `isFlasque_constantSheaf`.

### D0.21 Cohomology of limits of coherent topoi

**Limits of coherent topoi.** For a small cofiltered diagram of coherent topoi with coherent
transitions and limit `E`, and `F = p_i^* F_i`, the maps
`colim_{j → i} Hⁿ(E_j, p_{ji}^* F_i) → Hⁿ(E, F)` are isomorphisms, and likewise for compatible
filtered systems of coefficients ([SGA 4 VI] Theorem 8.7.1, Corollaries 8.7.7–8.7.8; used in [ECD]
proof of Proposition 14.9, p. 86). Check: a one-stage diagram returns `Hⁿ(E_i, F_i)`.

### D0.22 Ordinary sheaves on profinite sets

**Clopen description.** For `S` profinite, sheaves of sets or abelian groups on `S` are equivalent
to functors on clopens sending `∅` to the terminal object and finite disjoint unions to products; on
`βI` the stalk of `J ↦ ∏_{i ∈ J} A_i` at an ultrafilter `U` is `colim_{J ∈ U} ∏_J A_i`, which is
Mathlib's `Filter.Product U A` when all factors are inhabited ([Arc] §3, Proposition 3.10, Example
3.12, Construction 3.13, pp. 18–20). Checks: on a finite discrete `S` sheaves are families; a
principal ultrafilter at `i` gives `A_i`; a nonprincipal ultrafilter gives the uncountable
ultraproduct of `ℤ/jℤ`; an empty factor away from the ultrafilter does not empty the stalk.

### D0.23 Cutoff cardinals

**Cutoff cardinals are cofinal.** There is a cofinal class of uncountable `κ` that are strong limits
of cofinality `> ω` and such that every `λ < κ` lies below a strong limit `κ_λ < κ` of cofinality
`> λ` ([ECD] Lemma 4.1, pp. 19–20). Checks: `0` and `ℵ₀` fail; `ℶ_ω` is an uncountable strong limit
of countable cofinality and fails. Lean: `IsCutoffCardinal`, `exists_isCutoffCardinal_gt`.

### D0.24 Cardinality of a completion

**Completion bound.** A Hausdorff first-countable uniform group with a dense subset of size `≤ λ`,
`λ` infinite, has completion of size `≤ λ^{ℵ₀} ≤ 2^λ`, which is `< κ` for a strong limit `κ > λ`
([ECD] Remark 4.3, p. 20). The first inequality is PerfectoidSpaces `completion_cardinality_bound`;
the rest is cardinal arithmetic. Checks: `ℚ` completes to `ℝ` of size `2^{ℵ₀}`; the Bohr topology on
`ℤ` is not first countable and its completion is larger.

### D0.25 Stackification

**General-site stackification.** For a site `(C, J)` and a pseudofunctor `F : Cᵒᵖ → Cat`, construct
a stack (Mathlib `Pseudofunctor.IsStack`) with a map from `F` such that composition gives an
equivalence of categories of maps (strong transformations and modifications) into any stack; a stack
is its own stackification and a discrete prestack stackifies to the sheafification ([Stacks] Tags
02ZM, 02ZP). For the trivial-torsor prestack of a group sheaf the result is the stack of torsors,
whose isomorphism classes form `H¹`, a presheaf whose sheafification is terminal. Checks: the
discrete two-point prestack keeps two classes; the classifying prestack of a nontrivial `G` keeps
`G` as automorphisms.

### D0.26 2-fibre products and quotient stacks

**Fibre products and quotients.** Maps of stacks `G₁ → G₃ ← G₂` have a 2-fibre product of triples
`(a, b, φ)` built from Mathlib's `CategoricalPullback`, again a stack, with the 2-universal
property. For a groupoid object `(X, R)` in sheaves, the quotient `[X/R]` is the stackification of
the objectwise groupoid; `R ≃ X ×_{[X/R]} X`, its sheaf of isomorphism classes is the sheafification
of `X/R`, it is a sheaf iff stabilisers are trivial, and maps `[X/R] → G` are descent data ([Stacks]
Tags 02ZL, 044O, 04M9, 04Y1; [ECD] Proposition 11.3(ii)–(iii), p. 54). Checks: the strict pullback
differs for two points of a groupoid with a nontrivial automorphism; a free discrete action gives
the sheaf quotient; `BG` is not a sheaf; the trivial groupoid gives `X`; the pair groupoid gives the
image of `X → *`.

### Examples

The Lean examples compute the Sierpiński space `Prop` (open point `True`): its constructible
topology is discrete, `True ⤳ False`, its inverse topology makes `False` open, it is `Spec ℤ_p` and
no finite ring's spectrum; discrete `ℕ` is locally spectral and not spectral and has non-sober
inverse topology; `ℝ` is not locally spectral; `ℤ_p/ℤ` is not Hausdorff; `ℵ₀` and `ℶ_ω` are not
cutoffs.

### Dependencies

Mathlib and Tau Ceti as in the supplier table; [Stacks] and [SGA 4 VI] for the cohomological and
stack statements. Within the layer, D0.2 feeds D0.3–D0.6; D0.7 feeds D0.8–D0.10; D0.13 feeds D0.15;
D0.17 feeds D0.18 and D0.21; D0.25 feeds D0.26.

## Layer D1: disconnected perfectoid spaces

The totally and strictly totally disconnected perfectoid spaces, their components, automatic
flatness, w-localisation and the universally open cover, and the classification of pro-étale spaces
over a strictly totally disconnected base. The topological conditions are stated on Tau Ceti's
pre-adic spaces; the perfectoid structure comes from PerfectoidSpaces.

### D1.1 Totally disconnected perfectoid spaces

**Total disconnectedness.** A perfectoid space `X` is totally disconnected if it is qcqs and every
open cover splits, i.e. `⊔ U_i → X` has a section ([ECD] Definition 7.1, p. 29). The name refers to
components of the form `Spa(K, K⁺)`, not to `|X|`; the splitting condition passes to closed subsets
of `|X|`. Checks: `Spa(K, K⁺)` for a perfectoid field is totally disconnected and connected; finite
disjoint unions are, infinite ones are not qc; discrete `ℕ` has split covers and is not qc; the
perfectoid closed disc is qcqs and not totally disconnected (connected with many closed points);
`S × Spa(C, O_C)` has `π₀ = S`; the rank-two `Spa(C, C⁺)` is a Sierpiński space and totally
disconnected; open covers of the Sierpiński space split and the cover of `ℝ` by `(-∞, 1)`, `(0, ∞)`
does not. Lean: `OpenCoversSplit`, `isTotallyDisconnected`.

### D1.2 Fargues' characterisation of split covers

**Fargues' criterion.** For `X` spectral, equivalent are: (i) every open cover splits; (ii) every
connected component has a unique closed point; (iii) global sections send epimorphisms of sheaves of
sets to surjections; (iv) global sections are exact on abelian sheaves; (v) `Hⁱ(X, F) = 0` for
`i > 0`; (vi) `H¹(X, F) = 0` ([ECD] Lemma 7.2, pp. 29–30). The form "global sections commute with
finite colimits" in the source is too strong: on two discrete points `Γ(1 ⊔ 1)` has four elements
and `Γ(1) ⊔ Γ(1)` two. Lean: `openCoversSplit_iff` ((i) ⇔ (ii)).

### D1.3 Connected components and affinoidness

**Components and affinoidness.** For `X` totally disconnected, `X → π₀(X)` is continuous onto a
profinite set with fibres `Spa(K, K⁺)`, `K` a perfectoid field and `K⁺` an open bounded valuation
subring; conversely a qcqs perfectoid space all of whose components have this form is totally
disconnected ([ECD] Lemma 7.3, pp. 30–31); and `X` is affinoid ([ECD] Lemma 7.5, p. 31). Check: for
`S × Spa(C, O_C)` the projection is the first projection. Lean:
`isAffinoidPerfectoid_of_isTotallyDisconnected`, with `t2Space_connectedComponents`.

### D1.4 Strictly totally disconnected perfectoid spaces

**Strict total disconnectedness.** `X` is strictly totally disconnected if it is qcqs and every
étale cover splits; for qcqs `X` this holds iff every component is `Spa(C, C⁺)` with `C`
algebraically closed ([ECD] Definition 7.15, Proposition 7.16, p. 36). It implies total
disconnectedness, passes to pro-constructible generalising subsets, and étale covering families
split. Checks: `Spa(C, C⁺)` for algebraically closed `C`; `Spa` of the completed cyclotomic field
(PerfectoidSpaces `padicCyclotomic`) is totally but not strictly totally disconnected; finite
unions; `S × Spa(C, O_C)`.

### D1.5 Pro-constructible generalising subsets

**Generalising subsets are affinoid perfectoid.** For `X` totally disconnected and `U ⊆ |X|`
pro-constructible and generalising, `U` is an intersection of sets `{|f| ≤ 1}`, `f ∈ O(X)`, hence a
totally disconnected affinoid perfectoid space; qc opens of `X` are affinoid ([ECD] Lemma 7.6 and
Remark 7.7, pp. 31–32). Checks: `X = {|1| ≤ 1}` and `∅ = {|ϖ⁻¹| ≤ 1}`; in a rank-two `Spa(K, K⁺)`
the open point is `{|g⁻¹| ≤ 1}`, while the closed point is not generalising and lies in no such set
avoiding the open point.

### D1.6 Automatic flatness

**Automatic flatness.** For `X = Spa(R, R⁺)` totally disconnected and any map from an affinoid
perfectoid `Spa(S, S⁺)`, `S⁺/ϖ` is flat over `R⁺/ϖ` for every pseudouniformiser `ϖ`, and faithfully
flat when `|Spa(S, S⁺)| → |X|` is surjective ([ECD] Proposition 7.23, pp. 38–39). The proof reduces
to components, where `S⁺_c` is torsion-free over the valuation ring `K⁺_c`, and identifies
`|Spa(K, K⁺)|` with `Spec(K⁺/ϖ)`. Checks: the identity is faithfully flat; the empty source is flat,
faithfully flat only over `X = ∅`; an extension of perfectoid fields `L/K` with `L⁺ ∩ K = K⁺` is
faithfully flat. Lean: `flat_quotientMap_of_openCoversSplit`,
`faithfullyFlat_quotientMap_of_openCoversSplit`.

### D1.7 w-local and w-strictly local perfectoid spaces

**w-locality.** A spectral space is w-local if open covers split and the closed points form a closed
subset; then the closed points map homeomorphically to `π₀` ([BS15] Definition 2.1.1, Lemma 2.1.4,
p. 5). A perfectoid space is w-local if `|X|` is, and w-strictly local if moreover all completed
residue fields are algebraically closed; w-local implies totally disconnected and w-strictly local
implies strictly totally disconnected ([ECD] Definitions 7.4, 7.17, pp. 31, 36). Checks: the
Sierpiński space and profinite sets are w-local, discrete `ℕ` is not; inside `S × Spa(C, C⁺)` with
`S = {0} ∪ {1/n}` and `C⁺` of rank two, the set `(S × {η}) ∪ {(0, s)}` is totally disconnected and
not w-local. Lean: `IsWLocalSpace`, `IsWLocalSpace.isHomeomorph_connectedComponentsMk`.

### D1.8 The w-localisation functor

**w-localisation.** The inclusion of w-local perfectoid spaces with w-local maps into qcqs
perfectoid spaces has a right adjoint `X ↦ X^wl` whose counit is pro-étale, affinoid pro-étale for
affinoid `X` (a limit of maps `⊔ U_i → X` over finite rational covers), and surjective;
`π₀(X^wl) = |X|_cons`, the component over `x` is the set of generalisations of `x`, `O⁺` is the
`ϖ`-completed pullback, and qc opens `U ⊆ X` give qc open embeddings `U^wl → X^wl` ([ECD]
Proposition 7.12, Lemmas 7.13–7.14, pp. 34–36; [BS15] Lemma 2.1.10). The source writes "left
adjoint"; the universal property is that of a right adjoint. The counit is not universally open.
Checks: for `Spa(C, O_C)` the counit is an isomorphism; for a rank-two `Spa(C, C⁺)`,
`X^wl = Spa(C, C⁺) ⊔ Spa(C, O_C)` with a two-to-one counit over the rank-one point; for `Spec ℤ` the
topological counit is not open.

### D1.9 The universally open strictly totally disconnected cover

**Universally open cover.** Every affinoid perfectoid `X` has an affinoid pro-étale, surjective,
universally open `X̃ → X` with `X̃` strictly totally disconnected, `κ`-small when `X` is, for a
cutoff `κ` ([ECD] Lemma 7.18, pp. 36–37). Checks: the identity if `X` is already strictly totally
disconnected; `∅`; a perfectoid field that is not algebraically closed has a non-isomorphic cover.

### D1.10 Pro-étale maps over a strictly totally disconnected base

**Profinite fibre criterion.** For `X` strictly totally disconnected and `f : Y → X` qc and
separated, `f` is pro-étale iff for each rank-one point `x = Spa(C, O_C)` the fibre is `x × S_x`
with `S_x` profinite; then `Y` is strictly totally disconnected and `f` affinoid pro-étale ([ECD]
Lemma 7.19, p. 37). Checks: the identity; the disc over a point is not pro-étale; `X × S` with `S`
profinite; `⊔_ℕ X` is pro-étale and not qc; the empty source.

### D1.11 Topological classification of pro-étale maps

**Spectral data.** For `T` spectral with chain components, a spectral `S → T` is affinoid pro-étale
when `S → T ×_{π₀ T} π₀ S` is a pro-constructible generalising embedding, and pro-étale when this
holds on a spectral open cover of a locally spectral `S`; for `X` strictly totally disconnected,
`Y ↦ |Y|` gives equivalences of affinoid pro-étale (respectively pro-étale) perfectoid spaces over
`X` with affinoid pro-étale spectral (respectively pro-étale locally spectral) maps to `|X|`,
preserving `κ`-smallness ([ECD] Definition 7.20, Remark 7.21, Corollary 7.22, p. 38). Checks: the
identity; over a point the affinoid objects are the profinite sets; over the Sierpiński chain the
open point qualifies and the closed point does not; discrete `ℕ` over a point is pro-étale and not
affinoid.

### Examples

The Lean examples compute splitting for the Sierpiński space (yes), `ℝ` (no) and discrete `ℕ` (yes,
but not qc), total disconnectedness of an empty pre-adic space, and w-locality of the Sierpiński
space against discrete `ℕ`.

### Dependencies

D0.1–D0.7, D0.10, D0.13, D0.23–D0.24; PerfectoidSpaces P1–P6; Mathlib `Module.Flat`,
`ConnectedComponents`; Tau Ceti `spa`, `Pair`.

## Layer D2: the pro-étale and v-topologies

The big and small pro-étale sites, the v-site, cutoff independence, algebraicity, the structure
sheaves, v-descent and acyclicity, and vector bundles.

### D2.1 The big pro-étale site

**Big pro-étale site.** On `Perfd` (or its `κ`-small part), `{f_i : Y_i → X}` covers if every `f_i`
is pro-étale and every qc open `U ⊆ X` is `⋃_{i ∈ J} f_i(V_i)` for a finite `J` and qc opens `V_i`
([ECD] Definition 8.1(i), p. 39); coverings are stable under base change and composition, refined by
affinoid ones, and restrict to `κ`-small spaces. The image condition is the fpqc one, which for
schemes is Mathlib's `AlgebraicGeometry.QuasiCompactCover`. Checks: a surjective pro-étale map of
qcqs spaces covers; jointly surjective open immersions cover; the point inclusions into
`S × Spa(C, O_C)` for infinite profinite `S` are jointly surjective and do not cover.

### D2.2 The small pro-étale site and the v-site

**v-site.** The pro-étale site `X_proét` has the pro-étale maps to `X` with the big-site covers; the
v-topology drops pro-étaleness and keeps the finite qc image condition ([ECD] Definition
8.1(ii)–(iii), p. 39). A map from a qc to a qs perfectoid space is a v-cover iff it is surjective;
v-covers are stable under base change and composition; `X_proét` has finite limits; there is no
small v-site. Checks: for algebraically closed `C ⊊ C'`, `Spa(C', O_{C'}) → Spa(C, O_C)` is a
v-cover and not pro-étale; the empty family covers exactly the empty space; point inclusions of an
infinite profinite set are not compact-open covering. Lean: `vPrecoverage`, `perfdToTop`,
`vTopology`, `singleton_mem_vPrecoverage_iff_surjective`.

### D2.3 Cutoff independence and small sheaves

**Change of cutoff.** For cutoffs `κ ≤ κ'` and `κ`-small `X`, pullback from `X_proét,κ` to
`X_proét,κ'` is fully faithful and preserves cohomology: the unit is an isomorphism for sheaves of
sets, groups (with `R¹ = 0`) and abelian groups (with `R^{i>0} = 0`); likewise for the big sites.
Small sheaves form the union over cutoffs, and a sheaf commuting with `ω₁`-filtered colimits of
affinoid perfectoid pairs is small, so `O` and `O⁺` are ([ECD] Proposition 8.2 and the following
remark, pp. 39–40). Checks: `κ = κ'`; `R⁰` is the sheaf itself, not zero; a smaller cutoff need not
contain `X`.

### D2.4 Algebraicity of the small-sheaf topoi

**Algebraic topoi.** Small sheaves on `Perfd` (pro-étale or v) and on `X_proét` form algebraic topoi
with the affinoid perfectoid spaces as a fibre-product-stable basis of qcqs objects; `X` is qc,
respectively qs, iff `|X|` is ([ECD] Proposition 8.3, Convention 8.4, p. 41). The terminal sheaf is
not qs: the absolute self-product of `Spa(𝔽_p((t^{1/p^∞}))^)` is a punctured open disc ([ECD] proof
of Proposition 11.4). Checks: an affinoid perfectoid space is qcqs; `∅`; the open unit disc is not
qc.

### D2.5 Pro-étale and étale comparison and the structure sheaves

**`ν : X_proét → X_ét`.** For a perfectoid `X`, `F ≅ ν_* ν^* F` and `R^{i>0} ν_* ν^* F = 0`; for an
affinoid pro-étale `Y = lim Y_i`, `(ν^* F)(Y) = colim F(Y_i)`; `O`, `O⁺` are small sheaves on
`X_proét` and, for affinoid `X`, `H^{i>0}(X_proét, O) = 0` and `H^{i>0}(X_proét, O⁺)` is almost zero
([ECD] Proposition 8.5, pp. 41–42). Checks: at a geometric point everything vanishes exactly;
constant coefficients on a pro-finite-étale tower give locally constant functions; exact vanishing
of `O⁺`-cohomology is not claimed.

### D2.6 The structure sheaves on the big pro-étale site

**Big-site sheaves.** `O` and `O⁺` are small sheaves on the big pro-étale site and that site is
subcanonical ([ECD] Corollary 8.6, p. 42), since a big-site cover is a cover of the small site of
its target. Check: the empty cover of `∅`.

### D2.7 v-descent of functions

**`O` is a v-sheaf.** The presheaves `O` and `O⁺` on the v-site are small sheaves and the v-site is
subcanonical ([ECD] Theorem 8.7, p. 43; Theorem 1.2, p. 3); in particular `H⁰_v(Spa(R, R⁺), O) = R`
and `H⁰_v(Spa(R, R⁺), O⁺) = R⁺`. The proof reduces to a totally disconnected base and uses D1.6.
Checks: for a finite Galois extension of perfectoid fields the sheaf condition is `K = L^G` and
`K° = (L°)^G`; `{∅ → X}` with `X ≠ ∅` is flat but not a cover and `O` fails descent along it. Lean:
`structurePresheaf`, `isSheaf_structurePresheaf`, `vTopology_subcanonical`.

### D2.8 Higher v-acyclicity

**v-acyclicity.** For affinoid perfectoid `X`, `H^{i>0}_v(X, O) = 0` and `H^{i>0}_v(X, O⁺)` is
almost zero ([ECD] Proposition 8.8, p. 43). Checks: exact vanishing at a geometric point; for a tame
cyclic cover `Spa(L) → Spa(K)` of degree `ℓ ≠ p` with `|p|^{1/ℓ} ∉ |K^×|`, the Čech `H¹(ℤ/ℓ, L°)`
vanishes exactly although `L° ⊗_{K°} L° ⊊ (L°)^ℓ`; the open disc is not covered.

### D2.9 Pro-étale and v vector bundles

**Vector bundles.** For a perfectoid `X`, finite locally free modules on the analytic, étale, small
and big pro-étale and v-sites are equivalent by pullback, and on `Spa(R, R⁺)` they are the finite
projective `R`-modules; for a rigid space the pro-étale and v versions agree ([KL16] Theorem 3.5.8,
p. 76; [Heuer] §2.1, pp. 5–6), the tower step being PerfectoidTowers P9. Checks: rank zero and
`X = ∅`; `Hom(Oᵐ, Oⁿ) = M_{n×m}(R)` on both sides; faithfully flat module descent does not apply to
v-covers.

### Examples

The Lean examples show that point inclusions of an infinite profinite set are not compact-open
covering, that the empty presieve covers exactly the empty perfectoid space, and that the structure
presheaf takes global sections.

### Dependencies

D0.7, D0.17–D0.19, D0.23; D1.6, D1.8; PerfectoidSpaces P0–P6; PerfectoidTowers P9; Mathlib
`Precoverage`, `GrothendieckTopology.Subcanonical`, `IsCompactOpenCovered`, `PresheafedSpace.Γ`.

## Layer D3: effective descent and morphisms of stacks

Full faithfulness and effectivity of v-descent, the classes of morphisms of v-stacks, sub-v-sheaves
of totally disconnected spaces, target-local criteria and torsors.

### D3.1 Full faithfulness of v-descent for morphisms

**Descent of morphisms.** For the prestack `X ↦ Perfd/X` and a v-cover `Y → X`, restriction to
descent data (Mathlib `Pseudofunctor.DescentData`) is fully faithful, also on the subprestacks of
affinoid, separated pro-étale, separated étale and finite étale objects ([ECD] Definition 9.1, Lemma
9.2, p. 44), by subcanonicity. Checks: the identity cover; the empty cover of `∅`.

### D3.2 Descended subsets cut out by functions

**Descent of `{|f| ≤ 1}`-sets.** For `X = Spa(R, R⁺)` totally disconnected, `X̃` affinoid perfectoid
over `X`, `A ⊆ |X̃|` and a surjection `Y → X` of affinoid perfectoids such that the preimage of `A`
in `X̃ ×_X Y` is cut out by conditions `|g| ≤ 1`, `A` is cut out by conditions `|f| ≤ 1` with
`f ∈ O(X̃)` ([ECD] Lemma 9.4, pp. 45–46). Input: an open of the Tate ball over algebraically closed
`(C, C⁺)` mapping onto `Spa(C, C⁺)` has a section ([ECD] Lemma 9.5, pp. 46–47), via finite
presentation of flat topologically finite type formal algebras (AdicSpacesPartIII R2) and refinement
of fppf covers of strictly henselian local rings by finite locally free ones ([Stacks] Tags 05WM,
05WN). Checks: the identity cover; `{|T| ≤ |ϖ|}` is cut out by `T/ϖ`; the open disc is not, by the
Gauss point.

### D3.3 Effective descent for affinoid perfectoid spaces

**Affinoid descent.** Over a totally disconnected affinoid `X`, affinoid perfectoid spaces descend
along affinoid v-covers, both the ring and its integral subring being recovered ([ECD] Proposition
9.3, p. 44). Checks: the identity; Galois descent along a finite Galois `L/K`; the minimal integral
subring is in general smaller than the descended one.

### D3.4 Effective descent for separated pro-étale perfectoid spaces

**Pro-étale descent.** Over a strictly totally disconnected `X`, separated pro-étale perfectoid
spaces descend along every v-cover ([ECD] Proposition 9.6, p. 47), using D1.11 and D0.8–D0.9.
Checks: the identity; affinoid pro-étale objects reduce to D3.3; `S × Spa(C', O_{C'})` over a larger
field.

### D3.5 Separated étale and finite étale perfectoid spaces form v-stacks

**Étale descent.** Separated étale and finite étale perfectoid spaces form v-stacks over every base
([ECD] Proposition 9.7, pp. 47–48), using that a qc separated étale space over `Spa(K, K⁺)` is a qc
open in a finite étale one ([ECD] Lemma 9.9, p. 49). Hence étaleness, finite étaleness and, over a
strictly totally disconnected base, pro-étaleness of a map of perfectoid spaces descend along
v-covers ([ECD] Corollary 9.11, p. 49). Checks: the identity; for `K⁺` of rank two the qc open
`Spa(K, O_K) ⊆ Spa(K, K⁺)` is compactified by `Spa(K, K⁺)` itself; finite étale maps are separated.

### D3.6 Étale, finite étale and quasi-pro-étale morphisms of stacks

**Morphism classes.** A map `f : Y' → Y` of v-stacks is quasi-pro-étale if locally separated and its
pullbacks to strictly totally disconnected perfectoid spaces are representable and pro-étale, étale
if locally separated with representable étale pullbacks to all perfectoid spaces, finite étale if
all pullbacks are representable finite étale ([ECD] Definition 10.1, Convention 10.2, pp. 49–50);
the classes are stable under composition and base change, `f` inherits them from `g` and `f ≫ g`,
and they agree with the perfectoid notions on representables ([ECD] Propositions 10.3–10.4, p. 50).
Checks: pro-étale maps of perfectoid spaces are quasi-pro-étale; identities and `∅ → Y`; maps from a
perfectoid space to a v-sheaf are locally separated; `B G̲ → *` for nontrivial profinite `G` is not
locally separated.

### D3.7 Sub-v-sheaves of a totally disconnected space

**Ind-representability.** A sub-v-sheaf of a totally disconnected `X` is the filtered colimit of the
pro-constructible generalising subsets it contains ([ECD] Proposition 10.5, pp. 50–51); a qc
injection of v-stacks is quasi-pro-étale with pullbacks to totally disconnected spaces represented
by pro-constructible generalising subsets ([ECD] Corollary 10.6, p. 51). Checks: `X` and `∅`; a
rank-one point; the union of closed points of `S × Spa(C, O_C)` is an injection that is not qc.

### D3.8 Immersions, separated maps and 0-truncated maps

**Immersions and separatedness.** Open immersions are tested on all perfectoid bases, closed
immersions on totally disconnected ones; `f` is separated if its diagonal is a closed immersion and
0-truncated if `Y'(X) → Y(X)` is faithful for all `X` ([ECD] Definition 10.7, Remark 10.8, p. 51).
Separated is equivalent to 0-truncated, qs and uniqueness of lifts along `Spa(K, O_K) → Spa(K, K⁺)`,
with a variant for general perfectoid pairs ([ECD] Propositions 10.9–10.10, pp. 51–52); the classes
compose and base change. Checks: open immersions of perfectoid spaces; some `X/φ^ℤ` is separated and
not qs; `B G̲` for nontrivial `G` is not 0-truncated; the doubled disc fails the valuative
criterion.

### D3.9 v-local nature of the morphism classes

**Target-local tests.** For a surjection `Ỹ → Y` of v-stacks, if the pullback of `f` is qc, qs, an
open or closed immersion, separated, finite étale, separated étale or separated quasi-pro-étale, so
is `f` ([ECD] Proposition 10.11, pp. 52–53). Checks: the identity; openness descends because
v-covers induce quotient maps (D0.7).

### D3.10 Locally profinite torsors

**Torsors.** For a space `T`, `T̲(X) = C(|X|, T)` is a v-sheaf ([ECD] §10, before Definition 10.12,
p. 53). A `G̲`-torsor for locally profinite `G` is a map of v-stacks with a `G̲`-action that is
v-locally `G̲ × X` ([ECD] Definition 10.12, p. 53); over a perfectoid space it is representable,
pro-étale, universally open and a v-cover, its pushouts along `G/K` are separated étale, finite
étale in finite index, and it is their limit ([ECD] Lemma 10.13, pp. 53–54). Checks: the split
torsor; finite `G` gives Galois covers; over `Spa(C, O_C)` with profinite `G` a torsor is `X × S`;
for infinite profinite `G` the torsor is not étale; `T̲` fails descent along a map whose underlying
continuous bijection is not a quotient map, so the quotient property of v-covers (D0.7) is used.
Lean: `isSheaf_yonedaPresheaf`.

### Examples

No Lean examples beyond the sheaf statement: the Checks need the perfectoid morphism classes.

### Dependencies

D0.3, D0.7–D0.9, D0.25–D0.26; D1.1–D1.11; D2.1, D2.2, D2.7; PerfectoidSpaces P0–P6;
AdicSpacesPartIII R2; Mathlib `ContinuousMap.yonedaPresheaf`, `Pseudofunctor.DescentData`.

## Layer D4: diamonds and small v-stacks

Diamonds as quotients of perfectoid spaces, their atlases and underlying spaces, compact Hausdorff
diamonds, small v-sheaves and v-stacks, and geometric-point criteria; everything on `Perf`.

### D4.1 Diamonds and pro-étale equivalence relations

**Diamonds.** A diamond is a v-sheaf on `Perf` isomorphic to `X/R` for `X` perfectoid and
`R ⊆ X × X` a representable equivalence relation with pro-étale projections (the quotient taken in
v-sheaves; D4.4 identifies it with the pro-étale quotient); no condition on the diagonal ([ECD]
Definitions 11.1–11.2, p. 54). Checks: representables are diamonds; free finite group quotients of
`S × Spa(C, O_C)`; `T̲ × Spa(K, O_K)` for compact Hausdorff `T`; on `Spa(K₀, O_{K₀})` the total
relation is not pro-étale and `*` is not a diamond.

### D4.2 Quotients by pro-étale equivalence relations

**Atlases.** `X/R` is a diamond, `R ≅ X ×_{X/R} X`, the quotient is unchanged under pro-étale covers
of `X`, and `X → X/R` is quasi-pro-étale; products and fibre products of diamonds are diamonds
([ECD] Propositions 11.3–11.4, pp. 54–55).

### D4.3 The atlas characterisation of diamonds

**Quasi-pro-étale atlases.** A pro-étale sheaf `Y` is a diamond iff it has a surjective
quasi-pro-étale map `q : X → Y` from a perfectoid space, which may be a disjoint union of strictly
totally disconnected spaces; diamonds are closed under quasi-pro-étale surjections, quasi-pro-étale
maps to diamonds and quotients by quasi-pro-étale equivalence relations ([ECD] Propositions
11.5–11.8, p. 56).

### D4.4 Diamonds are v-sheaves

**v-descent of diamonds.** Diamonds are v-sheaves ([ECD] Proposition 11.9, pp. 56–57); sub-v-sheaves
of diamonds are diamonds; a qcqs map of diamonds bijective on `(K, K⁺)`-points for algebraically
closed `K` is an isomorphism ([ECD] Proposition 11.10, Lemma 11.11, p. 57). Check:
`⊔_{ℤ_p} Spa(C, O_C) → ℤ_p̲ × Spa(C, O_C)` is bijective on points, not qc, and not an isomorphism.

### D4.5 The underlying topological space of a diamond

**`|Y|`.** For `Y = X/R`, `|X|/|R|` with the quotient topology is in bijection with equivalence
classes of maps `Spa(K, K⁺) → Y` and is independent of the presentation; open subfunctors correspond
to open subsets and surjections give quotient maps ([ECD] Proposition 11.13, Definition 11.14,
Proposition 11.15, pp. 59–60). Checks: for perfectoid `Y` it is the usual space; two presentations
of `Spa(C, O_C)` give a point; `|T̲ × Spa(K, O_K)| = T`.

### D4.6 Compact Hausdorff spaces as diamonds

**`T ↦ T̲ × Spa(K, O_K)`.** For a perfectoid field `K` of characteristic `p`, this is a fully
faithful functor from compact Hausdorff spaces to diamonds over `Spa(K, O_K)`, with
`S̲ × Spa(K, O_K)` the affinoid perfectoid `Spa(C(S, K), C(S, O_K))` for profinite `S` ([ECD]
Example 11.12, pp. 58–59). Checks: `∅`, a point, `n` points; for `T = [0, 1]` the space `|Y| = T` is
not spectral.

### D4.7 Small v-sheaves and small v-stacks

**Smallness.** A small v-sheaf admits a v-surjection from a perfectoid space; a small v-stack admits
one with `X ×_Y X` a small v-sheaf ([ECD] Definitions 12.1, 12.4, Remark 12.2, pp. 69–70). Diamonds
and qcqs v-stacks are small; for a surjection from a diamond `X` onto a v-sheaf `Y`, `X ×_Y X` is a
diamond and `Y = X/(X ×_Y X)` ([ECD] Proposition 12.3, p. 70); small v-stacks have 2-fibre products.

### D4.8 Underlying spaces and surjectivity for small v-stacks

**`|Y|` for small v-stacks.** The underlying space is defined through a presentation and is
independent of it; open substacks match open subsets, surjections give quotient maps, and
`|Y₁ ×_Y Y₂| → |Y₁| ×_{|Y|} |Y₂|` is surjective, not a homeomorphism ([ECD] Propositions 12.7, 12.9,
12.10, Definition 12.8, pp. 70–71). A surjection of v-stacks is surjective on spaces, and a qc map
surjective on spaces is a surjection ([ECD] Lemma 12.11, p. 72). Check: the map of D4.4 is
surjective on spaces and not a v-surjection.

### D4.9 Isomorphism and injectivity criteria on geometric points

**Geometric points.** A qcqs map of v-stacks is an isomorphism iff it is an equivalence on
`(K, K⁺)`-points for algebraically closed perfectoid `K` ([ECD] Lemma 12.5, p. 70); a map of small
v-sheaves that is qcqs or between locally spatial ones is injective iff injective on
`(K, K⁺)`-points iff `|f|` is injective and `Y' = Y ×_{|Y|̲} |Y'|̲` ([ECD] Proposition 12.15, pp.
72–73). Check: the map of D4.4 shows quasicompactness is needed.

### D4.10 Small quotients of v-sheaves

**Group quotients.** For a small v-sheaf `F` with an action of `G̲`, `G` locally profinite, `F/G̲`
is small and `|F/G̲| = |F|/G` ([GLX] Lemma 3.2, first assertion, pp. 16–17). The second assertion
there, `π₀(F/G̲) = π₀(F)/G`, fails for `ℤ` acting on `ℤ_p̲ × Spa(C, O_C)` by translation; D5.16
gives a corrected form.

### Examples

None in Lean: diamonds need the pro-étale morphisms of PerfectoidSpaces P6.

### Dependencies

D0.7, D0.16–D0.17, D0.26; D1.4–D1.5; D2.1–D2.3, D2.7; D3.4–D3.10; PerfectoidSpaces P1–P6.

## Layer D5: spatial geometry and Hausdorff reduction

Spatial diamonds, permanence, limits and presentations, local structure, relative representability,
the Berkovich quotient and group quotients.

### D5.1 Spatial and locally spatial diamonds

**Spatiality.** A diamond (or small v-sheaf) is spatial if qcqs and `|Y|` has a basis of images of
qc open subdiamonds, locally spatial if covered by spatial opens ([ECD] Definitions 11.17, 12.12,
pp. 61, 72). Then `|Y|` is spectral (locally spectral), qc opens are spatial, maps of locally
spatial diamonds are spectral and generalising, qc and qs are tested on `|Y|`, generalisations are
totally ordered, and a perfectoid space is spatial iff qcqs ([ECD] Propositions 11.18–11.19, 12.13).
Checks: `T̲ × Spa(K, O_K)` for non-profinite `T` is qcqs and not spatial; `∅` and `Spa(C, C⁺)` are
spatial.

### D5.2 Quasicompact injections and finite étale permanence

**Permanence I.** A qc injection `Y' → Y` into a locally spatial diamond has locally spatial source
with pro-constructible generalising image carrying the subspace topology ([ECD] Proposition 11.20,
p. 62); finite étale maps into (locally) spatial diamonds or spatial v-sheaves have (locally)
spatial source ([ECD] Lemma 11.21, p. 62; Lemma 12.16, p. 73).

### D5.3 Cofiltered limits and finite-stage étale comparisons

**Limits.** A cofiltered limit of diamonds along qcqs maps is a diamond with `|Y| → lim |Y_i|` a
continuous bijection, a homeomorphism in the (locally) spatial case, `κ`-small under the cutoff
hypotheses; for qcqs diamonds, finite étale, qcqs étale and qc separated étale objects over the
limit come from a finite stage ([ECD] Lemma 11.22, Proposition 11.23, pp. 63–64; Lemma 12.17, pp.
73–74).

### D5.4 The universally open strictly totally disconnected presentation

**Presentations.** A spatial diamond has a surjective universally open quasi-pro-étale map from a
strictly totally disconnected perfectoid space that is a limit of composites of qc open immersions
and finite étale maps (`κ`-small for `κ`-small `Y`); conversely a qcqs diamond with such a map from
a (locally) spatial diamond is spatial ([ECD] Proposition 11.24, p. 65; Proposition 11.26, Lemma
11.27, pp. 65–67).

### D5.5 Quasi-pro-étale and fibre-product permanence

**Permanence II.** A quasi-pro-étale map `Y' → Y` to a locally spatial diamond has locally spatial
source, and fibre products `Y' ×_Y Y''` of (locally) spatial diamonds are (locally) spatial ([ECD]
Corollaries 11.28–11.29, pp. 67–68; Remark 11.25, p. 65).

### D5.6 The two-out-of-three property

**Two out of three.** For maps of locally spatial diamonds `f`, `g` with `f` surjective
quasi-pro-étale, `g ∘ f` quasi-pro-étale and `g` separated, `g` is quasi-pro-étale; étale and finite
étale likewise ([ECD] Proposition 11.30, pp. 68–69). Check: a non-separated `g` fails.

### D5.7 Local structure of étale maps

**Local structure.** An étale map of locally spatial diamonds is, locally on source and target, a
composite `V' ↪ W → V` of a qc open immersion and a finite étale map ([ECD] Lemma 11.31, p. 69).

### D5.8 Localisation of a spatial diamond

**`Y_y`.** For `Y` spatial and `y ∈ |Y|`, the limit of the qc open neighbourhoods of `y` is spatial,
with space the generalisations of `y`, a qc injection into `Y` through which exactly the maps with
image in that set factor ([ECD] proof of Lemma 11.31, p. 69; Lemma 11.22, Proposition 11.20).

### D5.9 Locally closed generalising subdiamonds

**`Y_D`.** For `Y` locally spatial and `D ⊆ |Y|` locally closed and generalising, the maps with
image in `D` form a locally spatial diamond with space `D` ([ECD] Proposition 11.20, p. 62; [HK]
§2.1, p. 14). Check: for the non-generalising `D = {s}`, `s` the closed point of a rank-two
`Spa(C, C⁺)`, the maps with image in `D` form the empty sheaf, so `|Y_D| = D` fails without the
hypothesis.

### D5.10 Profinite products and closed projection

**`P̲ × S`.** For `P` profinite and `S` locally spatial, `P̲ × S` is locally spatial with space
`P × |S|`, and the projection to `S` is qc, separated and universally closed ([HK] proof of
Proposition 9.3.4, p. 60). Check: discrete `ℕ` in place of `P` has non-closed projection.

### D5.11 The spatial v-sheaf criterion

**Spatial v-sheaves are diamonds.** A spatial v-sheaf `Y` with a quasi-pro-étale map `f : X → Y`
from a perfectoid space such that `|f|` is surjective is a spatial diamond; `f` need not be a
v-surjection ([ECD] Theorem 12.18, Remark 12.19, p. 75; Proposition 12.20, Lemma 12.21, pp. 75–76).

### D5.12 Relative representability

**Representable maps.** A map `Y' → Y` of v-stacks is representable in diamonds, respectively in
(locally) spatial diamonds, if every `Y' ×_Y X` with `X` such an object is such an object; spatial
means locally spatial and qcqs, all such maps are 0-truncated, the classes are stable under base
change and descend under the stated surjectivity and qs hypotheses ([ECD] Definitions 13.1, 13.3,
Propositions 13.2, 13.4, pp. 76–77; Lemma 13.5). A separated map is quasi-pro-étale iff
representable in locally spatial diamonds with pro-étale geometric fibres ([ECD] Proposition 13.6,
pp. 78–79).

### D5.13 The Berkovich spectrum of a complete Tate ring

**`|X|_B` is the maximal Hausdorff quotient.** For a complete Tate ring `R` with pseudouniformiser
`ϖ`, the Berkovich spectrum is the space of continuous (equivalently bounded) nonarchimedean
multiplicative seminorms with `|ϖ| = 1/2` and the pointwise topology; it is independent of `ϖ` up to
canonical homeomorphism, and sending a point of `Spa(R, R⁺)` to the seminorm of its unique rank-one
generalisation identifies it with the maximal Hausdorff quotient of `Spa(R, R⁺)` ([ECD] Definition
13.7, Remark 13.8, Proposition 13.9, p. 79, stated there for affinoid perfectoid spaces; the
argument uses only that `R` is Tate). The section back to `Spa` is not continuous. Checks: `ϖ = 0`
gives the empty space; for `ℚ_p` at `ϖ = p` it is one point, `|·|_p^{log 2 / log p}`; the comparison
with the Gel'fand spectrum of the Tate norm is AdicSpacesPartIII R3. Lean: `BerkovichSpectrum`,
`nonempty_t2Quotient_spa_homeomorph`.

### D5.14 The Berkovich space of a small v-sheaf

**`|Y|_B`.** The affinoid construction extends uniquely to a colimit-preserving functor on small
v-sheaves with maps `|Y|_B → |Y| → |Y|_B` composing to the identity and `|Y| → |Y|_B` a quotient
map; for qcqs `Y`, `|Y|_B` is compact Hausdorff and the maximal Hausdorff quotient ([ECD]
Propositions 13.10–13.11, pp. 79–80).

### D5.15 Reduction to spatial diamonds and the Hausdorff cohomology comparison

**`Y → |Y|_B̲`.** For a qc separated diamond, this map is representable in locally spatial diamonds
([ECD] Proposition 13.12, pp. 80–81), and pullback along `|Y| → |Y|_B` is fully faithful on
`D⁺(−, ℤ)`, so `Hⁱ(|Y|_B, F) = Hⁱ(|Y|, f^* F)` ([ECD] Proposition 13.13, p. 81), proved with
D0.20–D0.21.

### D5.16 Components of restricted group quotients

**Components of orbit spaces.** For a topological group `G` acting continuously on `X`, components
of `X` map to components of `X/G`, inducing `π₀(X)/G → π₀(X/G)`, a bijection when `π₀(X)/G` is
totally disconnected, for instance when `X` is spectral and `G` compact ([GLX] Lemma 3.2, pp. 16–17,
with this hypothesis added; used in [GLX] Proposition 3.12, p. 24). Check: `ℤ` acting on `ℤ_p` by
translation has dense orbits and a connected orbit space. Lean:
`connectedComponents_mk_quotient_eq_iff`.

### Examples

The Lean examples compute the Berkovich spectrum at `ϖ = 0` (empty) and for `ℚ_p` (one point), and
the connected orbit space `ℤ_p/ℤ`.

### Dependencies

D0.1, D0.3–D0.4, D0.6–D0.7, D0.9–D0.10, D0.14, D0.16–D0.17, D0.20–D0.21, D0.23; D1.4–D1.5,
D1.9–D1.10; D3.5–D3.10; D4.1–D4.10; AdicSpacesPartII R0; AdicSpacesPartIII R3; Mathlib
`MulRingSeminorm`, `T2Quotient`, `MulAction.orbitRel`.

## Layer D6: analytic and integral diamondification

`Spd` by marked untilts, the diamond of an analytic adic space and its étale site, the integral
pre-adic v-sheaf, and seminormal full faithfulness.

### D6.1 `Spd ℤ_p` and `Spd(A, A⁺)` by marked untilts

**Marked untilts.** `Spd ℤ_p(X)` is the set of isomorphism classes of marked untilts of `X`;
`Spd(A, A⁺)` adds a continuous map of pairs `(A, A⁺) → (O(X♯), O⁺(X♯))` for a Tate `ℤ_p`-algebra `A`
with open integrally closed `A⁺`; both are v-sheaves because marked untilts have no automorphisms,
and for perfectoid `(A, A⁺)`, `Spd(A, A⁺) = Spa(A♭, A♭⁺)` ([ECD] Lemmas 15.1–15.2, pp. 89–90).
Checks: `Spd ℚ_p` is not representable; `Spd ℤ_p` is not a diamond, as `Spd 𝔽_p = *`; `C♭` and `C`
are distinct untilts of `Spa(C♭)`.

### D6.2 Descent of marked untilts along a v-cover

**Untilt descent.** For affinoid `X = Spa(R, R⁺)` of characteristic `p` and a v-cover `Y → X`, an
untilt of `Y` whose two pullbacks to `Y ×_X Y` agree descends uniquely to `X`, via
`R♯ = (W(R⁺)/ξ)[1/[ϖ]]` with `ξ` primitive of degree one ([ECD] proof of Lemma 15.1, pp. 89–90).
Check: for `R = 𝔽_p((t^{1/p^∞}))^` and `t = p♭`, `ξ = p − [t]` and `R♯ = ℚ_p(p^{1/p^∞})^`.

### D6.3 `Spd(A, A⁺)` is a spatial diamond

**Spatiality of `Spd`.** `Spd(A, A⁺)` is unchanged by completion (Tau Ceti
`spaCompletionHomeomorph`), is a spatial diamond, and `|Spd(A, A⁺)| = |Spa(A, A⁺)|`, through a
finite étale torsor tower with perfectoid completion (AdicEtaleGeometry A4) ([ECD] Lemma 15.3,
Proposition 15.4, pp. 90–91; [Wedhorn] Proposition 7.48).

### D6.4 Gluing and the diamond of an analytic adic space

**`Y^◇`.** For a rational open `U`, `Spd(O(U), O⁺(U)) → Spd(A, A⁺)` is the open subfunctor of `U`;
hence for an analytic adic space `Y` over `ℤ_p`, `Y^◇(X)` = classes of marked untilts `X♯` with a
map `X♯ → Y` is a functorial v-sheaf compatible with opens, fibre products and tilting ([ECD]
Definition 15.5, p. 91).

### D6.5 The étale-site comparison

**`Y_ét ≃ Y^◇_ét`.** For an analytic adic space `Y` over `ℤ_p`, `Y^◇` is a locally spatial diamond
with `|Y^◇| = |Y|`, and the étale and finite étale sites of `Y^◇` and `Y` are equivalent ([ECD]
Lemma 15.6, p. 91; Theorem 1.5, p. 4). This is not full faithfulness of `Y ↦ Y^◇`. Checks:
`Spd ℚ_p`; the rigid disc; a finite étale cover and a rational open.

### D6.6 Pre-adic diamondification

**Integral `X^◇`.** For a pre-adic space `X` over `Spa(ℤ_p, ℤ_p)`, `X^◇(S)` = classes of marked
untilts `S♯` over `ℤ_p` with `S♯ → X` is a v-sheaf; it gives `Spd(A, A⁺)` for complete Huber pairs
over `ℤ_p` and the analytic construction on the analytic locus ([Berkeley] Lemma 18.1.1, p. 161,
Proposition 18.2.2, p. 162, Proposition 10.3.7, p. 80).

### D6.7 The integral Galois quotient

**`Spd O_C / G̲_K ≅ Spd O_K`.** For `K` complete nonarchimedean with `p` topologically nilpotent and
`C` a completed algebraic closure, `Spd O_C → Spd O_K` is a proper v-cover with this quotient
([Berkeley] Lemma 18.1.2, pp. 161–162); on the special fibre `G_K` acts through `Gal(k̄/k)`, so it
is not a torsor there. Check: `K = C`.

### D6.8 Topology of pre-adic diamondification

**`|X^◇| → |X|`.** The point map is a continuous surjection, a homeomorphism for analytic `X` and
for `Spa(ℤ_p, ℤ_p)`, but not in general: for `X = Spa(𝔽_p[t], 𝔽_p[t])` the locus where `t` is
topologically nilpotent is open in `X^◇` and not the preimage of a subset of `|X|` ([Berkeley]
Example 18.2.1, Proposition 18.2.2, p. 162).

### D6.9 Seminormal rigid full faithfulness

**Full faithfulness.** For `K/ℚ_p` complete, `X` seminormal rigid and `Y` rigid over `K`,
`Hom_K(X, Y) → Hom_{Spd K}(X^◇, Y^◇)` is bijective ([Berkeley] Proposition 10.2.3, p. 78), using the
seminormalisation (a universal homeomorphism terminal among seminormal spaces over `X`, [KL16]
Remark 3.7.3, p. 80) and function descent over a seminormal base ([KL16] Theorem 8.2.3, p. 162;
PerfectoidTowers P9; [HK] §2.2, p. 15). Check: for the cusp `y² = x³` with normalisation
`t ↦ (t², t³)` the inverse of `X̃^◇ ≅ X^◇` is not induced by a morphism.

### Examples

None in Lean: marked untilts need the tilting equivalence of PerfectoidSpaces P1–P2.

### Dependencies

D2.7–D2.9; D3.8, D3.10; D4.1–D4.10; D5.1–D5.10; PerfectoidSpaces P0–P5; AdicEtaleGeometry A1, A4;
AdicSpacesPartII R0–R1; AdicSpacesPartIII F0; PerfectoidTowers P9; Tau Ceti
`spaCompletionHomeomorph`.

## Downstream consumers

The étale cohomology of diamonds consumes the whole roadmap and adds the canonical compactification
and the derived left-completion comparison; the six operations and the diamond descriptions of
period spaces and Shimura varieties use D4–D6 through it. PerfectoidTowers uses D2–D6 for quotients,
spatial presentations and torsor descent; AdicEtaleGeometry A4 feeds D6; the Fargues–Fontaine
diamond roadmap applies D6 to the Fargues–Fontaine curve.

## References

- [ECD] Peter Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4. https://arxiv.org/abs/1709.07343.
- [Berkeley] Peter Scholze and Jared Weinstein, Berkeley lectures on p-adic geometry, Annals of Math. Studies 207 (2020); author manuscript. https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf.
- [Arc] Bhargav Bhatt and Akhil Mathew, The arc-topology, arXiv:1807.04725v4. https://arxiv.org/abs/1807.04725.
- [BS15] Bhargav Bhatt and Peter Scholze, The pro-étale topology for schemes, Astérisque 369 (2015); arXiv:1309.1198. https://arxiv.org/abs/1309.1198.
- [KL15] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: foundations, Astérisque 371 (2015); arXiv:1301.0792. https://arxiv.org/abs/1301.0792.
- [KL16] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory, II: imperfect period rings, arXiv:1602.06899. https://arxiv.org/abs/1602.06899.
- [Heuer] Ben Heuer, A p-adic Simpson correspondence for smooth proper rigid varieties, arXiv:2307.01303v3. https://arxiv.org/abs/2307.01303.
- [HK] Sean Howe and Christian Klevdal, Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax–Lindemann theorem, arXiv:2308.11064v2. https://arxiv.org/abs/2308.11064.
- [GLX] Ian Gleason, Dong Gyu Lim and Yujie Xu, The connected components of affine Deligne–Lusztig varieties, arXiv:2208.07195v3. https://arxiv.org/abs/2208.07195.
- [Wedhorn] Torsten Wedhorn, Adic spaces, arXiv:1910.05934v1. https://arxiv.org/abs/1910.05934.
- [SGA 4 VI] Alexander Grothendieck and Jean-Louis Verdier, Conditions de finitude, topos et sites fibrés, Exposé VI of SGA 4, LNM 270 (1972).
- [Stacks] The Stacks Project authors, The Stacks Project (stable tags). https://stacks.math.columbia.edu.

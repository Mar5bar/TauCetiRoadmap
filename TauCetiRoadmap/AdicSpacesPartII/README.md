# Roadmap: foundations of adic spaces, part II — morphisms and analytification

**Summary.** Part II turns the adic spaces of [AdicSpaces](../AdicSpaces/README.md) into a
geometry of morphisms. It proves Huber's sheafiness theorem for rings of noetherian type, builds
completed tensor products and fibre products, and develops the morphism classes of adic spaces:
adic and finite-type morphisms, separated, proper and partially proper morphisms with their
valuative criteria, finite and quasi-finite morphisms, continuous differentials, and flat,
unramified, smooth and étale morphisms with their local structure. It then compares adic spaces
with the classical theories: Tate's `K`-affinoid algebras and rigid-analytic spaces, the
analytification `X ↦ X^ad` of schemes locally of finite type over a complete nonarchimedean field,
Huber's comparison functor from rigid to adic spaces, and analytic groups. These are the
foundations on which the étale cohomology of adic spaces, formal models, coherent sheaves and GAGA,
families and dagger geometry, and the perfectoid and Shimura-variety parts of the programme (the
analytifications of modular curves and Shimura varieties, their étale covers and proper maps) are
built.

| Layer | Title | What it builds |
|---|---|---|
| R0 | Morphisms and admissible affinoid products | rings of noetherian type and sheafiness, completed tensor products, `K`-affinoid algebras, fibre products, the morphism classes, differentials, smooth and étale morphisms |
| R1 | Analytification and algebraic correspondences | affinoid subdomains and rigid spaces, `X ↦ X^ad`, the rigid–adic comparison, analytic groups, dimension theory |

## Scope and ownership

Part II owns layers R0 and R1. AdicSpaces owns the adic-space foundations (valuation spectra,
rational subsets, the structure presheaf) and specifies closed immersions (its §5.1) and topological
finite type of pairs (its §5.2); Part II states both predicates on Tau Ceti's `TauCeti.AdicSpace`.
Tau Ceti proves sheafiness for strongly noetherian and stably uniform Tate rings; R0 adds a
noetherian ring of definition and the stable version. The shared geometric predicates are stated
here once for [AdicSpacesPartIII](../AdicSpacesPartIII/README.md),
[AdicEtaleGeometry](../AdicEtaleGeometry/README.md) and
[AdicSpacesPartIV](../AdicSpacesPartIV/README.md). AdicEtaleGeometry A1 owns the comparison of étale
morphisms with Huber's local descriptions; Part III R3 owns the sheaf of continuous differentials
glued from R0's modules.

## Conventions

1. Huber pairs are Tau Ceti's `Huber.Pair A` with explicit plus ring; morphisms are `Huber.Pair.Hom`
   (continuous, carrying `A⁺` into `B⁺`); pairs of definition are `Huber.PairOfDefinition`.
2. Complete includes Hausdorff; every statement about complete rings, modules or pairs assumes both.
3. Adic spaces are the objects of `TauCeti.AdicSpace` (locally `Spa(A, A⁺)` with a sheaf structure
   presheaf). A point is analytic if its support is not open; a space is analytic if every point
   has a Tate affinoid neighbourhood. A Huber ring is of noetherian type if it has a noetherian ring
   of definition or is a strongly noetherian Tate ring.
4. `K` is complete for a nontrivial rank-one nonarchimedean absolute value, `K°` its valuation ring,
   `ϖ` a pseudouniformiser, `Spa K = Spa(K, K°)`. `K°` is noetherian only when `K` is discretely
   valued; no statement assumes this unless it says so.
5. Completed tensor products `B ⊗̂_A C` are formed along adic structure maps; they need not be
   sheafy, so every fibre product carries its own existence and sheafiness hypotheses.
6. A morphism of affinoid charts is recorded together with the morphism of Huber pairs it induces on
   global sections (`AdicSpace.Affinoid.IsInducedBy`); Tau Ceti has the presheaf map of `Spa(φ)` but
   not yet the morphism of adic spaces, which is an R0 target.
7. Rigid spaces are Tate's; `X^an` is the rigid and `X^ad` the adic analytification.

## Exact supplier contracts

| Supplier | Exact file | Contract used |
|---|---|---|
| `TauCeti.Huber.IsHuberRing`, `IsTateRing`, `PairOfDefinition` | `TauCeti/RingTheory/Huber/Basic.lean:156,192,142` | Huber and Tate rings and their pairs of definition. |
| `TauCeti.Huber.Pair`, `Pair.Hom`, `Pair.quotient`, `Pair.quotientHom`, `Pair.powerBounded` | `TauCeti/RingTheory/Huber/Pair.lean:138,155,254,276,227` | Huber pairs, their morphisms, quotient pairs and `(A, A°)`. |
| `TauCeti.Huber.IsPowerBounded`, `powerBoundedSubring` | `TauCeti/RingTheory/Huber/PowerBounded.lean:117,433` | Power-bounded elements and `A°`. |
| `TauCeti.Huber.IsStronglyNoetherian`, `isNoetherianRing_of_isStronglyNoetherian` | `TauCeti/RingTheory/Huber/StronglyNoetherian.lean:135,229` | Strong noetherianness; a complete strongly noetherian Tate ring is noetherian. |
| `TauCeti.Huber.IsTopologicallyFiniteType`, `IsStrictlyTopologicallyFiniteType` | `TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean:117,133` | Topological finite type (Wedhorn 6.29); a `K`-affinoid algebra is a complete `K`-algebra strictly of topological finite type. |
| `TauCeti.Huber.IsWeightFamily`, `weightedRestrictedSubring`, `weightedC`, `weightedPolynomialHom`; `restrictedMvPowerSeriesCompletion` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Basic.lean:423,709,725,1020`; `TauCeti/RingTheory/Huber/Restricted/OneVariable.lean:122` | Weighted restricted power series and the Tate algebras `A⟨X₁,…,Xₙ⟩`. |
| `TauCeti.Huber.IsSheafyRing`, `IsStablySheafyRing` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafyRing.lean:82,175` | Sheafy and stably sheafy Huber rings (Wedhorn 8.26). |
| `TauCeti.ValuationSpectrum.spa`, `rationalSubset`, `IsAnalyticPoint`; `TauCeti.Huber.Pair.Hom.spaComap` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101`, `RationalSubset/Basic.lean:142`, `Analytic.lean:72`, `HuberPair.lean:62` | `Spa(A, A⁺)`, rational subsets, analytic points and the map of spectra of a pair morphism. |
| `TauCeti.ValuationSpectrum.presentationLimitPreAdicSpace`, `isPreAdic_presentationLimitPreAdicSpace`, `toPresentationLimit` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/PresentationLimit.lean:40`, `RationalOpen.lean:449`; `Spa/StructurePresheaf/GlobalSections.lean:79` | `Spa(A, A⁺)` as a pre-adic space and the map from `A` to its global sections. |
| `TauCeti.ValuationSpectrum.presentationLimitPresheafComap` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Comap.lean:381` | The presheaf half of `Spa(φ)` (Wedhorn §8.1); the morphism of adic spaces is R0's target. |
| `TauCeti.AdicSpace`, `TauCeti.PreAdicSpace.IsOpenImmersion`, `PreAdicSpace.Hom.stalkMap` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243`, `OpenImmersion.lean:61`, `Hom.lean:157` | The category of adic spaces, open immersions and stalk maps. |
| `LinearMap.isStrictMap_of_module_finite` | `TauCeti/RingTheory/Huber/StrictMorphism.lean:60` | Strictness of maps of finite modules over a complete Tate ring; R0.2 adds the case of a noetherian ring of definition. |
| `TauCeti.IsProConstructible` | `TauCeti/Topology/Spectral/ProConstructible.lean:112` | Pro-constructible subsets, for R0.18. |
| `smoothingSeminorm`; `spectralNorm` | `Mathlib/Analysis/Normed/Unbundled/SmoothingSeminorm.lean:521`; `SpectralNorm.lean:381` | The spectral seminorm of R0.4; `|f(x)|` at a maximal ideal of a `K`-affinoid algebra. |
| `IsJacobsonRing`, `MaximalSpectrum`, `ringKrullDim`, `Ideal.height` | `Mathlib/RingTheory/Jacobson/Ring.lean:60`, `Spectrum/Maximal/Defs.lean:27`, `KrullDimension/Basic.lean:26`, `Ideal/Height.lean:35` | Commutative algebra of `K`-affinoid algebras. |
| `RingHom.Etale`, `Algebra.FormallyUnramified` | `Mathlib/RingTheory/RingHom/Etale.lean:28`, `Unramified/Basic.lean:56` | Algebraic étale and unramified maps, compared with the adic notions. |
| `CategoryTheory.IsPullback`, `HasPullback`, `pullback.diagonal` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61`, `HasPullback.lean:87` | Fibre products in `TauCeti.AdicSpace`. |
| [ModularCurves](../ModularCurves/README.md) layers 0E, 2B | roadmap | Faithfully flat descent of modules and quotients of elliptic curves by finite subgroup schemes, used by R1.8. |

## How to read the build

`Suggested.lean` carries the definitions that are a few lines over Tau Ceti's carriers (noetherian
type, adic homomorphisms, affinoid charts, the morphism classes, `K`-affinoid algebras through Tau
Ceti's Tate algebras, affinoid subdomains of `Max A`) and the headline theorems about them. Each
target below is one paragraph: statement with hypotheses, source locator, the discriminating Checks,
and its Lean carrier or "README target". Within a layer, supporting results come last.

## Layer R0: morphisms and admissible affinoid products

### R0.1 ring-level inputs

**Huber rings of noetherian type.** (*noetherian-type-huber-ring*) A Huber ring `A` (no plus ring,
no completeness) is *of noetherian type* if (i) some pair of definition `(A₀, I)` has `A₀`
noetherian, or (ii) `A` is Tate and strongly noetherian (all `A⟨X₁,…,X_k⟩`, `k ≥ 0`, noetherian);
(i) concerns `A`, not `Â`, and for complete Hausdorff `A` this is Huber's condition (Huber94 §2,
Theorem 2.2, p. 524; Huber94 §3, Propositions 3.6–3.8, pp. 535–536). Discrete rings qualify (prime
subring, ideal `0`); for Tate rings (i) implies (ii), so the notion is strong noetherianness
(Wedhorn §6.7, Rem. 6.37(3), p. 54), and complete Hausdorff Tate rings of noetherian type are
noetherian. Checks: discrete `ℤ[T₁, T₂, …]` qualifies but is neither noetherian nor strongly
noetherian; `ℂ_p` qualifies by (ii), but no ring of definition `A₀ ⊇ p^N·O_{ℂ_p}` is noetherian
(`p^N·𝔪_{ℂ_p}` is not finitely generated over `A₀`). Lean: `Huber.IsNoetherianType`,
`IsNoetherianType.of_pairOfDefinition`, `IsNoetherianType.of_isStronglyNoetherian`,
`IsNoetherianType.isStronglyNoetherian`.

**Completion of a noetherian ring of definition.** (*noetherian-adic-completion*) For a pair of
definition `(A₀, I)` of `A`, the pair `(Â₀, Î)` of `Â` (closure of the image of `A₀`, ideal generated
by `I`) is the `I`-adic completion of `A₀`; if `A₀` is noetherian, so is `Â₀`, `Î`-adically complete
and separated with `A₀/Iⁿ ≅ Â₀/Îⁿ` (EGA I Ch. 0, §7.3, (7.3.1), p. 66; §7.2, (7.2.6), p. 64; Wedhorn
§6.6, proof of Prop. 6.35, p. 54); with (ii) also passing to `Â`, `Â` is of noetherian type when
`A` is. An `I`-adic `R` with `I` finitely generated has `R̂` complete for `I·R̂` (Stacks, Lemma
10.96.3, Tag 05GG). Check: this fails for `I = (X₀, X₁, …) ⊆ ℚ[X₀, X₁, …]`: `Σₙ Xₙ^{n+1}` is in the
closure of `I`, not in `I·R̂` (Stacks §110.7, Tag 05JA). Lean: `IsNoetherianType.completion`.

**Adic homomorphisms.** (*adic-ring-homomorphism*) A ring map `φ : A → B` of Huber rings is *adic* if
there are pairs of definition `(A₀, I)`, `(B₀, J)` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀` (Huber94 §3,
paragraph before the Def. of adic morphisms, p. 532; Wedhorn §6.5, Def. 6.23, p. 51). Adic maps are
continuous; identities and composites are adic, and `ψ` is adic if `φ`, `ψ` are continuous and
`ψ ∘ φ` is adic (Wedhorn 6.26(1),(2)); continuous maps out of Tate rings are adic with Tate target
(Wedhorn Prop. 6.25); `φ(I) ⊆ J` with `√(φ(I)B₀) = √J` suffices; out of a discrete ring, adic means
discrete target (Wedhorn Ex. 6.24); `A → Â`, `A → A⟨X⟩_T` and adic maps followed by open continuous
surjections are adic. Checks: `ℤ_p → ℤ_p⟦T⟧` (`(p, T)`-adic) is continuous, not adic (Morel
§II.3.2, Ex. II.3.2.2); along `ℤ → ℤ_p → 𝔽_p` the composite and the second map are adic, `ℤ → ℤ_p`
is not. Lean: `Huber.IsAdicHom`, `IsAdicHom.continuous`, `IsAdicHom.id`, `IsAdicHom.of_isTateRing`.

**Topologically-finite-type maps are adic.** (*topologically-finite-type-is-adic*) If `A` is Huber,
`B` complete Hausdorff Huber and `φ : A → B` topologically of finite type (an open quotient map `π`
from a completed weighted restricted power-series ring `A⟨X₁,…,X_k⟩_T` onto `B` extending `φ`), then
`φ` is adic: for each `(A₀, I)`, `π(closure of A₀⟨X⟩_T)` is a ring of definition with ideal of
definition generated by `φ(I)` (Huber94 §3, Lem. 3.3(ii), condition (b), p. 533; Wedhorn §8.5,
Rem. 8.49(2), p. 88). Check: `ℤ_p⟦T⟧` (`(p, T)`-adic) is not topologically of finite type over
`ℤ_p`, `ℤ_p⟨T⟩` is. Lean: `IsTopologicallyFiniteType.isAdicHom`.

**Topological finite type preserves noetherian type.** (*topologically-finite-type-noetherian-type*)
If `A` is complete Hausdorff of noetherian type and `φ : A → B` is topologically of finite type with
`B` complete Hausdorff, then `B` is of noetherian type: a noetherian ring of definition `A₀` yields
the noetherian ring of definition `π(Â₀⟨X⟩_T)` of `B` (Huber94 §3, Cor. 3.4(iii), p. 534; Wedhorn
Prop. 6.35), and strongly noetherian Tate `A` gives strongly noetherian Tate `B` (Huber94 §3,
Cor. 3.4(ii); Wedhorn §6.7, Rem. 6.37(1), p. 54; weighted-to-strict over a Tate base: Wedhorn §6.6,
Prop. 6.34, p. 54). Lean: `IsNoetherianType.of_isTopologicallyFiniteType`.

**Ideals of complete rings of noetherian type are closed.** (*noetherian-type-ideals-closed*) Let `A`
be complete Hausdorff of noetherian type, `A⁺` a ring of integral elements, `J ⊆ A` an ideal. Then
`J` is closed, `A/J` is complete Hausdorff of noetherian type, and `(A, A⁺)` maps by a quotient
mapping onto the complete pair `(A/J, integral closure of the image of A⁺)` (Huber94 §2,
Lem. 2.3(ii), p. 525; EGA I Ch. 0, §7.3, Cor. (7.3.6), p. 68). Checks: in `C(ℤ_p, ℚ_p)` (sup norm)
the functions vanishing near `0` form a non-closed ideal; Hausdorff is needed already for `J = 0`
(`ℤ` indiscrete, pair `(ℤ, (1))`). Lean: `IsNoetherianType.isClosed_ideal` (closedness of ideals).

### R0.2 sheafiness of rings of noetherian type

**Čech complex of localisations.** (*localization-cech-complex-exact*) For a commutative ring `R`,
`f₁, …, fₙ` generating the unit ideal and an `R`-module `M`, the augmented alternating complex
`0 → M → ∏_{i₀} M_{f_{i₀}} → ∏_{i₀<i₁} M_{f_{i₀}f_{i₁}} → ⋯` (strictly increasing tuples, alternating
face sums) is exact (Stacks Tag 01X9, Lem. 30.2.1; Huber94 §2, proof of (1.3), p. 527). Checks: for
the empty family over `ℤ` the augmentation is not injective; over `(1, 1, 1)` the cochain
`(s₀₁, s₀₂, s₁₂) = (2, 5, 7)` has differential `7 − 5 + 2 = 4`. Lean: README target.

**Completion preserves strict exactness.** (*strict-complex-completion-exact*) An exact complex of
abelian topological groups (not necessarily Hausdorff, each with a countable basis of open subgroups
at `0`) with strict differentials has exact Hausdorff completion with strict differentials and
`im d̂ = closure of im d` (Bourbaki, *Commutative Algebra*, Ch. III, §2, no. 12, Lemma 2; Huber94 §2,
proof of (1.3), p. 527). Check: indiscrete terms complete to `0`, so the hypotheses are imposed
before completing. Lean: README target.

**Linear maps of finite modules are strict.** (*noetherian-rod-module-topology-strict*) Let `A` be
Huber, not necessarily complete, with a noetherian ring of definition `A₀`, ideal `I`. On a finite
`A`-module the natural topology has basis `IⁿM₀` for any finitely generated generating
`A₀`-submodule `M₀` (Huber94 §2, before Lem. 2.3, p. 524), and `A`-linear maps of finite modules are
strict (Huber94 §2, Lem. 2.3(i) and its proof, p. 525; EGA I Ch. 0, §7.3, Thm (7.3.2), p. 66).
Check: in `C(ℤ_p, ℚ_p)` multiplication by `x ↦ x` has non-closed image. Lean: README target.

**Finite modules are complete with closed submodules.** (*noetherian-rod-module-complete*) If `A` is
complete Hausdorff with noetherian ring of definition `A₀` (ideal `I`) and `M` is finite, then `M`
is complete Hausdorff, its submodules are closed, and every finitely generated generating
`A₀`-submodule is open and `I`-adically complete and separated (Huber94 §2, Lem. 2.3(ii) and its
proof, p. 525; EGA I Ch. 0, §7.3, Cor. (7.3.6), p. 68). Lean: README target.

**Completion of a finite module is base change.** (*noetherian-rod-module-completion-tensor*) If `A`
has a noetherian ring of definition (no completeness) and `M` is finite, then `M ⊗_A Â → M̂` is an
isomorphism of topological `Â`-modules (Huber94 §2, Lem. 2.3(iii) and its proof, p. 525); so
`(P ⊗_B B_f) ⊗ B⟨F/f⟩` completes `P_f` for finite `P` over `B`. Checks: `A = ℤ_p[T]` (`p`-adic),
`M = A/(T)` gives `ℤ_p` on both sides; `A = ℤ` (`p`-adic), `M = ℤ/ℓ`, `ℓ ≠ p`, is indiscrete and both
sides vanish, so no Hausdorff hypothesis is made. Lean: README target.

**Spec of a Huber ring and an open subring.** (*open-subring-spec-isomorphism*) Let `B ⊆ A` be an
open subring of a Huber ring (no completeness or noetherianity) and `T ⊆ Spec B` the closed set of
open primes. Then `f : Spec A → Spec B` pulls `T` back to the open primes of `A` and restricts to an
isomorphism `Spec A ∖ f⁻¹(T) → Spec B ∖ T`; for `B = A₀` with ideal `I`, this is
`Spec A ∖ V(I·A) ≅ Spec A₀ ∖ V(I)` (Huber93 §3, Lem. 3.7, p. 469; Huber94 §2, proof of (1.3.1)(i),
p. 528). Check: for Tate `A` (e.g. `ℚ_p⟨T⟩`) `f⁻¹(T) = ∅` though `T ≠ ∅`. Lean: README target.

**The submodule blow-up.** (*submodule-blow-up*) Let `φ : C → B` be a ring map, `F ⊆ B` finite,
`J` the `C`-submodule spanned by `F`, `R(J) = ⊕_{n≥0} Jⁿ·Tⁿ ⊆ B[T]` (`J⁰ = φ(C)`) and
`g : Y = Proj R(J) → Spec C`. For any `F`: the `D₊(f·T)`, `f ∈ F`, cover `Y`; for nonempty `S ⊆ F`
with product `t`, `D₊(t·T^{|S|}) ≅ Spec C[f/f' : f ∈ F, f' ∈ S]` (inside `B_t`) over `Spec C`; `g`
is projective, `Y` noetherian if `C` is; for `φ = id`, `R(J)` is the Rees algebra of `span F`. If
`F·B = B`, `T ↦ 1` gives an affine `s : Spec B → Y` with `g ∘ s = Spec φ`, `s⁻¹(D₊(f·T)) = D(f)`
and `𝒪(s⁻¹D₊(t·T^{|S|})) = B_t` (Huber94 §2, proof of Thm 2.5, Case I, (1.1), p. 526; Huber94 §2,
(1.2)(i),(ii), p. 526). Checks: `ℤ_p⟨T⟩ ⊆ ℚ_p⟨T⟩` with `F = {p, T}` gives the blow-up of `(p, T)`;
for `C = B = ℤ_p⟨T⟩` no `s` exists, `(p, T)` lying in no `D(f)`. Lean: README target.

**The blow-up is an isomorphism away from the centre.** (*submodule-blow-up-isomorphism-away*) With
`F·B = B`, if `H ⊆ C` is an ideal with `Spec B ∖ V(H·B) ≅ Spec C ∖ V(H)` via `Spec φ`, then `g` is
an isomorphism over `Spec C ∖ V(H)`, so over `Spec C ∖ V(I)` for a ring of definition `C ⊆ B` with
ideal `I` (Huber94 §2, (1.2)(iii), p. 526; Huber94 §2, proof of (1.3.1)(i), p. 528). Check: for
`C = B = k[x, y]`, `F = {x, y}`, `H = C`, `g` has fibre `ℙ¹_k` over the origin. Lean: README target.

**Deep Čech cocycles are coboundaries.** (*blow-up-cech-artin-rees*) Let `B` have a pair of
definition `(C, I)` with `C` noetherian, `F = {f₀, …, fₙ}` generate the unit ideal, `g`, `s` be as
above, `P` a finite `B`-module, `N ⊆ P` a finitely generated generating `C`-submodule and
`𝒢 ⊆ s_*(P̃)` the coherent image of the adjoint `g*(Ñ) → s_*(P̃)`. Let `K_i^•` be the augmented Čech
complex on `{D₊(f_j·T)}` of `Iⁱ𝒢` (`i ≥ 1`), resp. of `s_*(P̃)` (`i = 0`, the Čech complex of `P̃`
on the `D(f_j)`). For all `p ∈ ℤ`, `u ≥ 1` there is `v ≥ u` with `ker(d_v^{p+1}) ⊆ d^p(K_u^p)`
(Huber94 §2, (1.3.1)(i), p. 527, and its proof, p. 528; EGA III₁ Ch. III, (3.3.2) Cor., p. 118).
Lean: README target.

**The filtration `K_i` gives the natural topology.** (*blow-up-cech-filtration-neighbourhoods*) In
that situation, with natural topologies on `P` and on each `P_t` (`t` the product of `S ⊆ F`) over
the uncompleted rational localisation `B(F/S)` (ring `B_t`, ring of definition
`C[f/f' : f ∈ F, f' ∈ S]`, ideal `I·C[f/f']`), the `K_i^p`, `i ≥ 1`, form a basis of neighbourhoods
of `0` in `K_0^p` for every `p` (Huber94 §2, (1.3.1)(ii), p. 527, and its proof, p. 528). Checks:
for `B = ℤ_p⟨T⟩`, `F = {1, T}`, `P = B`, `K_i^0 = pⁱB × pⁱB[1/T]`; for `(X)` in `ℤ_p⟨X⟩`, not
generating the unit ideal, no `p^N/X` lies in the chart ring. Lean: README target.

**Strict Čech exactness for standard rational coverings.** (*noetherian-rod-laurent-cech-strict*)
Let `B` be complete Hausdorff with noetherian ring of definition `C`, `B⁺` a ring of integral
elements, `f₀, …, fₙ` generating the unit ideal, `P` a finite `B`-module, `U_i = R(f₀, …, fₙ / f_i)`.
The augmented Čech complex `0 → P → ∏ P ⊗_B 𝒪(U_{i₀}) → ∏ P ⊗_B 𝒪(U_{i₀i₁}) → ⋯` (natural
topologies; `𝒪(U_{i₀…i_p})` completes `B_{f_{i₀}⋯f_{i_p}}`) is exact with strict differentials
(Huber94 §2, proof of Thm 2.5, Case I, p. 526; (1.3), p. 526; proof of (1.3), pp. 527–528). Check:
`(1, T)` on `ℤ_p⟨T⟩` gives `0 → B → B × ℤ_p⟨T, T⁻¹⟩ → ℤ_p⟨T, T⁻¹⟩ → 0`. Lean: README target.

**Noetherian ring of definition implies sheafy.** (*noetherian-rod-sheafy*) Let `(A, A⁺)` be a Huber
pair, `A` complete Hausdorff with a noetherian ring of definition (e.g. `ℤ_p⟦T⟧`, not Tate),
`X = Spa(A, A⁺)`. Then (a) each `𝒪_X(U)`, `U` rational, has a noetherian ring of definition
(Huber94 §2, proof of Thm 2.5, Case I, p. 529); (b) for finite `M`, Čech complexes of standard
rational coverings of rational `U` with terms `M ⊗_A 𝒪_X(V_{j₀…j_p})` are exact and strict; (c)
these refine every open covering of `U` (Huber94 §2, (1.5), p. 529; Wedhorn §7.6, Lem. 7.54, p. 70);
(d) `𝒪_X` is a sheaf of complete topological rings (Huber94 §2, Thm 2.2, p. 524; end of the proof
of Case I, p. 529; EGA I Ch. 0, §3.2, (3.2.2), p. 26). Lean: (d) is `PairOfDefinition.isSheafyRing`,
stated without completeness of `A` since sheafiness of `A` refers to `Â`.

**Discrete Huber pairs.** (*discrete-huber-pair-sheafy*) For a discrete ring `A` and an integrally
closed subring `A⁺`, `(A, A⁺)` is a complete Huber pair (pair of definition `(A, 0)`), sheafy as the
completion-free case of *noetherian-rod-sheafy*. For any `A`-module `M` and finite cover of rational
`R(T/s)` by rational `R(T_j/s_j)`, `𝒪(R(T/s)) = A_s` is discrete and `0 → M_s → ∏ M_{s_{j₀}} → ⋯`
is exact; `𝒪(W)` is discrete for quasi-compact `W`, else a complete limit (Wedhorn §8.2, Thm 8.28,
p. 81, case (c), and its proof). Check: for `k[T]`, `A⁺ = k`, `R(1, T / T)` alone misses the
valuation with support `(T)`, and `0 → k[T] → k[T, T⁻¹] → 0` is not exact. Lean: README target.

**Complete rings of noetherian type are stably sheafy.** (*noetherian-type-stably-sheafy*) A complete
Hausdorff Huber ring `A` of noetherian type is stably sheafy (Wedhorn §8.2, Def. 8.26, p. 81): every
complete Hausdorff `B` topologically of finite type over `A` is sheafy for every ring of integral
elements (Huber94 §2, Thm 2.2, p. 524), being strongly noetherian Tate (Tau Ceti's Tate case) or
with a noetherian ring of definition (*noetherian-rod-sheafy*, *discrete-huber-pair-sheafy*);
Wedhorn treats only the Tate and discrete cases (Wedhorn §8.2, Thm 8.28, p. 81). Check:
`Spa(ℤ_p⟦T⟧⟨X⟩, ℤ_p⟦T⟧⟨X⟩)` is sheafy. Lean: `IsNoetherianType.isStablySheafy`.

### R0.3 the completed tensor product

**The completed tensor product.** (*completed-tensor-product*) Let `f : (A, A⁺) → (B, B⁺)`,
`g : (A, A⁺) → (C, C⁺)` be morphisms of Huber pairs (not necessarily complete) with adic ring maps,
and `(A₀, I)`, `B₀ ⊆ B⁺`, `C₀ ⊆ C⁺` compatible pairs of definition. On `E = B ⊗_A C`, with `F` the
image of `B₀ ⊗_{A₀} C₀`, the `Iⁿ·F` give a Huber topology with pair of definition `(F, I·F)`,
independent of choices, making `b ↦ b ⊗ 1`, `c ↦ 1 ⊗ c` adic; the integral closure `E⁺` of the image
of `B⁺ ⊗_{A⁺} C⁺` is a ring of integral elements (Huber94 §3, proof of Lem. 3.9(i), p. 537; Morel
§II.3.2, Prop. II.3.2.1). `B ⊗̂_A C := (Ê, closure of E⁺)`, defined only for adic `f`, `g` and not
uniformised, is a complete Hausdorff Huber pair with `inl ∘ f = inr ∘ g` (Hübner §9, proof of
Thm 9.2, p. 41; Huber96 §1.2, proof of Prop. 1.2.2, part 1), p. 47), Tate if `B` or `C` is,
functorial, symmetric, with `(B ⊗̂_A C) ⊗̂_C C' ≅ B ⊗̂_A C'`; `B ⊗_A C → B ⊗̂_A C` has dense image,
kernel the closure of `0`. For adic rings with finitely generated ideals of definition and full plus
rings it is the adic completion of `B ⊗_A C` (Huber96 §1.2, Proposition 1.2.2(1), p. 47); for Banach
rings, the product-seminorm completion with Kedlaya–Liu's plus ring (KL15 §2.1, Definition 2.1.10,
p. 27; §2.4, Definition 2.4.1, p. 38). Checks: `L ⊗̂_{ℚ_p} L ≅ L × L` for `L = ℚ_p(√p)`, and `(1, 0)`
is in the plus ring, not in the image of `O_L ⊗_{ℤ_p} O_L`; for non-adic `ℤ_p → ℤ_p⟦X⟧` and
`ℤ_p → ℚ_p` no Huber topology on `ℤ_p⟦X⟧[1/p]` makes both maps continuous with `ℤ_p⟦X⟧` open (Morel
Ex. II.3.2.2). Lean: README target.

**Universal property.** (*completed-tensor-product-universal-property*) With `f`, `g` adic, let `R`
be complete Hausdorff nonarchimedean and `R⁺ ⊆ R` a closed integrally closed subring. For continuous
`φ : B → R`, `ψ : C → R` with `φ(B⁺), ψ(C⁺) ⊆ R⁺` and `φ ∘ f = ψ ∘ g` (no adicness needed) there is
exactly one continuous `χ : B ⊗̂_A C → R` with `χ((B ⊗̂_A C)⁺) ⊆ R⁺`, `χ ∘ inl = φ`, `χ ∘ inr = ψ`:
the square is cocartesian among complete Hausdorff Huber pairs; `χ` is adic if `R` is Huber and `φ`
adic (Huber94 §3, proof of Prop. 3.7, p. 536; Morel §II.3.2, Prop. II.3.2.1, reading
`u′ ∘ f = v′ ∘ g` for the printed `u ∘ f = v ∘ g`; Wedhorn §8.6, proof of Thm 8.56, p. 90). Check:
the two inclusions give `K⟨T⟩ ⊗̂_K K⟨S⟩ ≅ K⟨T, S⟩` (Hübner Ex. 9.3). Lean: README target.

**Base change of weighted restricted power series.** (*completed-tensor-restricted-power-series*)
Let `λ : (A, A⁺) → (B, B⁺)` have adic ring map and `M = (M₁, …, M_n)` be finite subsets of `A` with
`M_i·A` open. (a) The `λ(M_i)·B` are open, so `B⟨X⟩_{λ(M)}` exists, with plus ring the integral
closure of `{∑ b_ν X^ν : b_ν ∈ λ(M)^ν·B⁺}` (Huber94 §3, proof of Prop. 3.7, pp. 535–536); (b)
`A⟨X⟩_M ⊗̂_A B → B⟨X⟩_{λ(M)}`, `X_i ↦ X_i`, is an isomorphism of complete Huber pairs (Huber94 §3,
Lem. 3.5(i), p. 534); (c) for a quotient mapping `σ : A⟨X⟩_M → (C, C⁺)` of complete Huber pairs with
kernel `𝔞`, `C ⊗̂_A B ≅ B⟨X⟩_{λ(M)}/𝔟` (quotient topology and plus ring), `𝔟` the closure of
`λ'(𝔞)·B⟨X⟩_{λ(M)}`, equal to it if `B` is of noetherian type (Huber94 §3, proof of Prop. 3.7,
p. 536; Hübner §9, proof of Thm 9.2(iii), p. 42; Huber96 §1.2, proof of Prop. 1.2.2, part 2),
p. 48), so `B → C ⊗̂_A B` is topologically of finite type (pairs and rings); (d) the same ring arises
if `μ : A → C` is only topologically of finite type as a ring map and `C⁺ ⊇ μ(A⁺)` is any ring of
integral elements, the plus ring being the closure of the integral closure of the image of
`C⁺ ⊗_{A⁺} B⁺`, and `inr` is topologically of finite type. Checks: `ℤ_p⟨X⟩_{p}/(pX − 1) = ℚ_p`,
while weight `1` gives `0`; for `ℤ_p → ℤ_p⟦T⟧`, `M = {p}`, `p·ℤ_p⟦T⟧` is not open.
Lean: README target.

**Completed base change preserves noetherian type.** (*completed-tensor-noetherian-stability*) For
morphisms of complete Hausdorff Huber pairs `λ : (A, A⁺) → (B, B⁺)` adic and `μ : (A, A⁺) → (C, C⁺)`
topologically of finite type as a ring map, with `B` of noetherian type, `inl : B → B ⊗̂_A C` is
topologically of finite type (as pairs if `μ` is), and `B ⊗̂_A C` is complete Hausdorff of
noetherian type and stably sheafy, so sheafy for every ring of integral elements (Huber94 §3, proof
of Prop. 3.7, p. 536; Wedhorn §8.6, proof of Thm 8.56(ii), p. 90; HK §7, Rem. 7.2, p. 25: no
uniformity is claimed). Check: `Spa(ℚ_p⟨T⟩) ×_{Spa ℚ_p} Spa(ℚ_p⟨S⟩) = Spa(ℚ_p⟨T, S⟩)` is sheafy.
Lean: README target.

**Rational localisation and `⊗̂`.** (*completed-tensor-rational-localisation*) For adic morphisms
`f`, `g` of complete Hausdorff Huber pairs, `D = B ⊗̂_A C`, `p_B = Spa(inl)`, `p_C = Spa(inr)` and
rational `U = R(T/s) ⊆ Spa B`, `V = R(T'/s') ⊆ Spa C`, `W ⊆ Spa A` with `Spa(f)(U) ⊆ W ⊇ Spa(g)(V)`:
(1) `p_B⁻¹(U) = R(inl(T)/inl(s))`, `p_C⁻¹(V) = R(inr(T')/inr(s'))`, meeting in the rational set
`R(inl(T ∪ {s})·inr(T' ∪ {s'}) / inl(s)inr(s'))` (Wedhorn §7.5, Lem. 7.46(3), p. 68); (2) the maps
`𝒪(W) → 𝒪(U)`, `𝒪(W) → 𝒪(V)` are adic and `𝒪(U) ⊗̂_{𝒪(W)} 𝒪(V) ≅ 𝒪_D(p_B⁻¹(U) ∩ p_C⁻¹(V))` for
the rational localisation pairs `𝒪` (KL15 §2.4, after Def. 2.4.12, p. 41; Wedhorn §8.1, Lem. 8.1,
p. 74); (3) its spectrum maps homeomorphically onto the intersection, matching rational subsets
(Huber94 §1, Lem. 1.5(ii), p. 518; Wedhorn §8.1, Prop. 8.2(2), pp. 74–75). Check:
`ℚ_p⟨T/p⟩ ⊗̂_{ℚ_p} ℚ_p⟨S, S⁻¹⟩ ≅ ℚ_p⟨T, S⟩⟨T/p, 1/S⟩`. Lean: README target.

### R0.4 the spectral seminorm, uniformization and the uniform completed tensor product

**Norm of a Tate ring.** (*tate-ring-norm*) For a Tate ring `A`, a norm datum `d = (A₀, ϖ, r)` is a
ring of definition `A₀`, a pseudouniformiser `ϖ ∈ A₀` (Wedhorn §6.2, Prop. 6.14, p. 49) and
`0 < r < 1`; put `α_d(x) := inf{rⁿ : n ∈ ℤ, ϖ⁻ⁿx ∈ A₀}`. Then `α_d` is a nonarchimedean ring
seminorm, `α_d(ϖx) = r·α_d(x)`, `{α_d ≤ rⁿ} = ϖⁿA₀`, defining the topology, vanishing exactly on
`closure{0}`; another `A₀` gives an equivalent seminorm, `r'` gives `α_d^{log r'/log r}`, and
`α_{d'} ∘ φ ≤ α_d` for continuous `φ : A → B`, `d' = (B₀, φ(ϖ), r)`, `φ(A₀) ⊆ B₀` (KL15 §2.4, Rem.
2.4.4, p. 39; HK §2, Rem. 2.11, p. 5). Checks: on `ℚ_p` with `(ℤ_p, p, 1/p)`, `α_d = |·|_p`, and
`ϖ = p²` gives `α_d(p²) = 1/p ≠ α_d(p)²`. Need `ϖ ∈ A₀`: on `ℚ_p²`, `A₀ = {a ≡ b mod p²} ⊆ ℤ_p²`,
`ϖ = (p, p²)`, `α(1 + ϖ) = r⁻² > max(α(1), α(ϖ))`. Lean: README target.

**Spectral seminorm.** (*spectral-seminorm*) For `A`, `d` as above, `|x|_sp := lim_n α_d(xⁿ)^{1/n}`
(the smoothing of `α_d`) is a power-multiplicative nonarchimedean ring seminorm, `|·|_sp ≤ α_d`
(KL15 §2.1, Def. 2.1.9, p. 27). It does not depend on `A₀ ∋ ϖ`, and `r'` gives
`|·|_sp^{log r'/log r}`; `|x|_sp < 1` iff `x` is topologically nilpotent; `|x|_sp ≤ 1` on
power-bounded `x`; its kernel `⋂ₙ ϖⁿA°°` contains the nilradical and `closure{0}`; `|1|_sp = 1` if
`A` is Hausdorff and nonzero (HK §2, paragraph after Def. 2.10, p. 5); it decreases along continuous
maps with compatible data; for finite `L/K` (`K` complete nonarchimedean, unit-ball datum) it is
Mathlib's `spectralNorm K L`. Checks: on `ℚ_p⟨T⟩` with `(ℤ_p⟨T⟩, ϖ, |ϖ|_p)` it is the Gauss norm. On
`ℚ_p[ε]/(ε²)` with `(ℤ_p ⊕ ℤ_pε, p, 1/p)`, `|ε|_sp = 0` while `α_d(ε) = 1`. Lean: README target.

**Spectral topology.** (*spectral-topology*) For a Tate ring `A` (not necessarily complete or
Hausdorff), `A_sp` is `A` with the topology of `|·|_sp` (KL15 §2.3, Rem. 2.3.11(c), p. 36). For each
pseudouniformiser `ϖ` the `ϖⁿA°°` form a basis at `0`, so `A_sp` is independent of `d`; `A → A_sp`
is continuous; `A_sp` is Tate with pair of definition `({|·|_sp ≤ 1}, ϖ·{|·|_sp ≤ 1})` and the
topologically nilpotent elements of `A`, and `A_sp° = {|·|_sp ≤ 1}` is bounded, so it is uniform (HK
§2, Def. 2.3, p. 3); every ring of integral elements of `A` is one of `A_sp`; `A_sp` is functorial;
`A → A_sp` is a homeomorphism iff `A°` is bounded (HK §2, Rem. 2.11, p. 5; KL15 §2.8, Def.
2.8.1(b),(d), p. 59). Checks: for `ℚ_p[ε]/(ε²)` the closure of `0` in `A_sp` is `ℚ_pε`, so `A_sp` is
not Hausdorff. For `A = {Σ aₙTⁿ ∈ K⟦T⟧ : |aₙ|(n+1) → 0}` with `‖f‖ = sup |aₙ|(n+1)`, `|·|_sp` is the
Gauss norm, `T ∈ A_sp° ∖ A°` and `A_sp` is not complete. Lean: README target.

**Spectral topology and adic spectra.** (*spectral-topology-cont-eq*) For a Tate ring `A`,
`Cont(A_sp) = Cont(A)` in `Spv(A)`; hence `Spa(A_sp, A⁺) = Spa(A, A⁺)` for every ring of integral
elements `A⁺`, with the same rational subsets `R(T/s)`, and a finite set generates an open ideal of
`A` iff of `A_sp` (iff it generates `(1)`) (KL15 §2.8, Def. 2.8.13, p. 63, and §2.4, Def. 2.4.3 and
the paragraph after it, pp. 38–39). Checks: for `(ℚ_p[ε]/(ε²), ℤ_p + ℚ_pε)` both spectra are the
point `a + bε ↦ |a|_p`. For uniform `A` it is the identity. Lean: README target.

**Uniformization.** (*uniformization*) For a Huber pair `(A, A⁺)` with `A` Tate, `A^u` is the
Hausdorff completion of `A_sp`, `A^{u+}` the closure of the image of `A⁺`,
`ι : (A, A⁺) → (A^u, A^{u+})` (KL15 §2.8, Def. 2.8.13, p. 63; HK §6, proof of Prop. 6.7, p. 17). (a)
it is a complete Hausdorff uniform Tate pair, `|·|_sp` extending to a power-multiplicative norm
defining its topology; (b) `ι` has dense image and kernel `{|·|_sp = 0}`; (c) morphisms (continuous,
respecting plus rings; HK Rem. 2.11) to complete Hausdorff `(B, B⁺)` with `B°` bounded factor
uniquely through `ι`, functorially; (d) `Spa(ι)` is a homeomorphism matching rational subsets; (e)
`ι` is an isomorphism for complete Hausdorff uniform `A`. Checks:
`(ℚ_p[ε]/(ε²), ℤ_p + ℚ_pε)^u ≅ (ℚ_p, ℤ_p)`, `ι(a + bε) = a`. For the weighted series ring above,
`A^u ≅ K⟨T⟩ ≠ A` although `|·|_sp` is a norm, so completion is needed. Lean: README target.

**Uniform completed tensor product.** (*uniform-completed-tensor-product*) For morphisms of Huber
pairs `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)` with `A` Tate, `f`, `g` are adic and `B`,
`C`, `B ⊗̂_A C` are Tate (Wedhorn Prop. 6.25; Huber96, proof of Prop. 1.2.2(1), p. 47). Put
`B ⊗̂ᵘ_A C := (B ⊗̂_A C)^u` with `ι ∘ inl`, `ι ∘ inr` (KL15 §2.8, sentence before Def. 2.8.13, p.
63; HK §7, Rem. 7.2, p. 25, and §10, Ex. 10.5, p. 37). It is universal for compatible maps to
complete Hausdorff uniform Tate pairs, functorial, symmetric, with `B ⊗̂ᵘ_A A ≅ B^u`; `ι` induces a
`Spa` homeomorphism matching rational subsets, and is an isomorphism iff `B ⊗̂_A C` is uniform. No
sheafiness or fibre-product property is asserted. Checks: `K⟨T⟩ ⊗̂ᵘ_K K⟨S⟩ ≅ K⟨T, S⟩`.
`ℂ_p ⊗̂_{ℚ_p} ℂ_p` is not uniform (KL15 §2.8, Rem. 2.8.5, p. 60). Lean: README target.

### R0.5 completed tensor products of Banach modules

**Banach completed tensor products.** (*completed-tensor-banach-module*) Over a complete Hausdorff
Tate ring `A` with datum `(A₀, ϖ, r)`, a Banach module is a complete Hausdorff `A`-module `V` with
an `A₀`-stable subgroup `V₀`, `V = ⋃ ϖ⁻ⁿV₀`, the `ϖⁿV₀` a basis at `0` (KL15 §2.2, Def. 2.2.7, p.
31). `V ⊗̂_A W` is the Hausdorff completion of `V ⊗_A W` for `ϖⁿ·im(V₀ ⊗_{A₀} W₀)`, or for the
product seminorm `inf max_i |v_i||w_i|` (KL15 §2.1, Def. 2.1.10, p. 27), independent of the
lattices. (a) continuous bilinear maps into complete Hausdorff `A`-modules with a basis of open
subgroups at `0` factor uniquely through `⊗`; (b) functoriality, `A ⊗̂_A V ≅ V`, and agreement with
*completed-tensor-product* for adic algebras; (c) `− ⊗̂_A W` preserves topologically split exact
sequences; over a complete nonarchimedean field `L`, `V ⊗_L W ↪ V ⊗̂_L W`,
`ker(f) ⊗̂ X ≅ ker(f ⊗̂ X)`, and `f ⊗̂ X` is strict for strict `f` (KL15 Lem. 2.2.9(a)–(c)); (d)
`P ⊗_A W ≅ P ⊗̂_A W` for finite projective `P` (KL15 §2.2, Lem. 2.2.12(a), p. 32); (e) over `L` the
product seminorm is a norm, and an orthonormal (resp. `t`-orthogonal) basis `(e_i)_{i∈I}` of `V`
gives `E ⊗̂_L V ≅ c₀(I, E)`, `x ⊗ Σ c_ie_i ↦ (c_ix)_i`, isometrically (resp. with
`t|·|_sup ≤ |·| ≤ |·|_sup`) (CHJ §2, Lem. 2.23(2), p. 19, and proof, p. 20); (f) base change
`A' ⊗̂_A V` is transitive, and `M ⊗̂_A A⟨T/s⟩ = M ⊗_A A⟨T/s⟩` for `M` finite projective or finite
over strongly noetherian `A` (Huber94 Lem. 2.4(ii)). Checks: `ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩ ≅ ℚ_p⟨T, S⟩`,
and `Σ pⁿTⁿSⁿ` is not an algebraic tensor. `ℂ_p ⊗̂_{ℚ_p} c₀(ℕ, ℚ_p) ≅ c₀(ℕ, ℂ_p)` omits `(1, 1, …)`:
null, not bounded, families. Lean: README target.

### R0.6 adic morphisms, finiteness classes and locally noetherian spaces

**Affinoid charts.** An affinoid presentation is a complete Hausdorff Huber ring `A` with a Huber
pair `(A, A⁺)`, a pair of definition `(A₀, I)` with `A₀ ⊆ A⁺`, and the condition that the
structure presheaf of `Spa(A, A⁺)` is a sheaf; it defines an object `Spa(A, A⁺)` of
`TauCeti.AdicSpace` with the canonical map from `A` to its global sections. A chart of `X` is an
open immersion of such an affinoid into `X`; a chart of a morphism `f : X → Y` consists of charts
of source and target, a morphism between them that induces a given morphism of Huber pairs on
global sections, and the commuting square (Huber94, §1 and Theorem 2.2). Every morphism class
below is defined on these charts. Checks: a zero coefficient ring gives the empty space; the
identity of an affinoid is a chart; the empty space is locally noetherian, analytic and covered by
stably sheafy charts, while a nonempty discrete noetherian affinoid is locally noetherian but not
analytic. Lean: `AdicSpace.Affinoid`, `Affinoid.spa`, `Affinoid.coeff`, `Affinoid.IsInducedBy`,
`AdicSpace.Chart`, `AdicSpace.HomChart`.

**The morphism of affinoid adic spaces of a pair morphism.** A morphism `φ : (A, A⁺) → (B, B⁺)`
of complete sheafy Huber pairs induces a morphism `Spa(φ) : Spa(B, B⁺) → Spa(A, A⁺)` of adic
spaces which is the restriction of valuations on points and `φ` on global sections; `φ ↦ Spa(φ)`
is functorial (identities to identities, composites to reversed composites) and injective, and
every morphism of adic spaces between these affinoids is of this form (Huber94, §2, Prop. 2.1(i),
p. 522; Wedhorn §8.1). Checks: the identity pair morphism gives the identity; the coefficient map of
`Spa(φ)` recovers `φ`. Lean: README target (Tau Ceti has the presheaf half
`TauCeti.ValuationSpectrum.presentationLimitPresheafComap`; until `Spa(φ)` exists, statements
carry the morphism explicitly with `Affinoid.IsInducedBy`).

**Completed residue fields as affinoids.** For a point `x` of an affinoid `Spa(A, A⁺)`, the residue
field `k(x)` completed for the valuation topology (analytic `x`) or the discrete topology
(non-analytic `x`), with plus ring the closure of the valuation ring of `x`, is a complete affinoid
field `(k̂(x), k̂(x)⁺)` with a morphism `Spa(k̂(x), k̂(x)⁺) → Spa(A, A⁺)` hitting `x`; its ideal of
definition is generated by the image of that of `A`, zero at non-analytic and nonzero proper at
analytic points (Huber96, (1.1.8), (1.2.4); Wedhorn, Remark 6.8). Checks: at a non-analytic point
the completion is `k(x)` itself with the discrete topology. Lean: README target.

**Adic morphisms.** (*adic-morphism*) A point is analytic if the ring of some open neighbourhood has
a topologically nilpotent unit (on `Spa(A, A⁺)`: its support is not open; Huber94 §3, Def. of
analytic points, p. 532); they form an open `X_a`; `X` is analytic if `X = X_a`, i.e. locally `Spa`
of Tate rings (Huber96 §1.1, p. 39). `f : X → Y` is adic if every `x` has open affinoids `U ∋ x`,
`V ⊇ f(U)` with `O_Y(V) → O_X(U)` adic (`Huber.IsAdicHom`) (Huber94 §3, Def. of adic morphisms, p.
532; Huber96 §1.2, p. 46). On affinoids `Spa(φ)` is adic iff `φ` is; maps to analytic spaces, open
immersions, composites and base changes of adic maps are adic, and `g ∘ f` adic ⇒ `f` adic. Checks:
the closed disc over `Spa(ℚ_p, ℤ_p)` is adic. `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` (`(p, T)`-adic) is not adic:
the `T`-adic point of `𝔽_p((T))` is analytic, its image is not. Lean: `AdicSpace.IsAdic`,
`AdicSpace.IsAnalytic`, `IsAdic.iff_isAdicHom`, `IsAdic.of_isAnalytic`, `IsAdic.baseChange`.

**Adic iff analytic points preserved.** (*adic-iff-analytic-locus*) For `f : X → Y`: (i) for adic
`f`, every `O_Y(V) → O_X(U)` with `f(U) ⊆ V` is adic; (ii) `f` is adic iff `f(X_a) ⊆ Y_a`; (iii)
always `f(X_na) ⊆ Y_na` (Huber94 §3, Prop. 3.2(ii), p. 532; Wedhorn §7.5, Lem. 7.46(2), p. 68, and
§8.4, Prop. 8.39, p. 86). Checks: `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` sends an analytic point to a non-analytic
one. Lean: affinoid core `IsAdicHom.spaComap_analytic`, `isAdicHom_of_spaComap_analytic`.

**Finite-type classes.** (*finite-type-morphism-classes*) `f : X → Y` is locally of weakly finite
type if every `x` has open affinoids `U ∋ x`, `V ⊇ f(U)` with `O_Y(V) → O_X(U)` topologically of
finite type, and of weakly finite type if also quasi-compact (preimages of quasi-compact opens are
quasi-compact) (Wedhorn §8.5, Def. 8.48(1), p. 88; Huber96 Def. 1.2.1(iv), p. 46). It is locally of
finite type if the charts can be chosen with `O_X(U)` an open quotient of some
`O_Y(V)⟨X₁, …, X_n⟩_M` (finite weights) and `O_X⁺(U)` the integral closure of the closed subring
generated by `O_Y⁺(V)` and the weighted variables (Huber94 §3, Def. of morphisms locally of finite
type, p. 535). Hierarchy: locally of finite presentation ⇒ finite type ⇒ +weakly finite type ⇒
weakly finite type ⇒ adic (Huber96 §1.2, Def. 1.2.1 and the following remarks, pp. 45–47); each
class composes, contains open immersions, restricts to opens (Wedhorn 8.49(1), 8.50); `g ∘ f`
locally of weakly finite type ⇒ `f` is (Wedhorn 6.33(2)); it is not global on affinoids (Wedhorn
§8.5, Rem. 8.52, p. 89). Checks: for discrete `A → B` and full plus rings, the finite-type classes
mean finite type, finite presentation means finitely presented, and all maps are adic. The open disc
over `Spa ℚ_p` is locally of finite type, not of weakly finite type. Lean:
`AdicSpace.LocallyOfWeaklyFiniteType`, `AdicSpace.QuasiCompact`,
`AdicSpace.IsTopologicallyFiniteTypePair`, `AdicSpace.LocallyOfFiniteType`,
`LocallyOfWeaklyFiniteType.isAdic`, `LocallyOfFiniteType.locallyOfPlusWeaklyFiniteType`.

**Locally of +weakly finite type.** (*plus-weakly-finite-type*) `f` is locally of +weakly finite
type if the charts can be chosen with `O_Y(V) → O_X(U)` topologically of finite type and `O_X⁺(U)`
the integral closure of the subring generated by `O_Y⁺(V)`, a finite set `E` and `O_X(U)°°` (Huber96
§1.2, Def. 1.2.1(ii), p. 46); of +weakly finite type if also quasi-compact. It is the finiteness
condition of proper and partially proper maps (Huber96 §1.3, Defs. 1.3.2(ii), 1.3.3(ii), p. 51),
composes and restricts to opens. Checks: the closed unit disc over `Spa(ℚ_p, ℤ_p)` qualifies with
`E = {T}`. `Spa(K⟨T⟩, O_K + K⟨T⟩°°) → Spa(K, O_K)` qualifies with `E = ∅` but is not locally of
finite type (Huber94 Lem. 4.4; Berkeley Lecture 4, §4.1, p. 28). Lean:
`AdicSpace.LocallyOfPlusWeaklyFiniteType_affinoid`, `AdicSpace.LocallyOfPlusWeaklyFiniteType`.

**Locally of finite presentation.** (*locally-finite-presentation*) `f` is locally of finite
presentation if the charts can be chosen topologically of finite type as pairs, with `O_X(U)`
finitely presented over `O_Y(V)` whenever `O_Y(V)` is discrete (Huber96 §1.2, Def. 1.2.1(v), p. 46;
Wedhorn §6.6, Ex. 6.32(1), p. 53). It implies local finite type, equivalently so over analytic `Y`
or when every complete affinoid chart of `Y` with discrete ring has a noetherian ring (stronger than
noetherian type); it composes, contains open immersions, restricts to opens, but is not stable under
all base changes (*base-change-stability* (iv)). Checks: `Spa(ℚ_p⟨T, S⟩/(TS − p)) → Spa(ℚ_p)`
qualifies. For discrete `A = ℤ[T₁, T₂, …]`, `Spa(A/(T₁, T₂, …)) → Spa(A)` is locally of finite type,
not of finite presentation, though `A` is of noetherian type. Lean:
`AdicSpace.LocallyOfFinitePresentation`, `locallyOfFinitePresentation_iff_of_isAnalytic`.

**Locally noetherian adic spaces.** (*locally-noetherian-adic-space*) `X` is locally noetherian if
every point has an open affinoid neighbourhood `U` with `O_X(U)` of noetherian type
(`Huber.IsNoetherianType`), plus rings unrestricted (Huber94 §3, Prop. 3.7, p. 535; Zavyalov24 §5,
Def. 5.1, p. 8; Hübner §9, Def. 9.1, p. 41); discretely ringed spaces qualify. `Spa(A, A⁺)`
qualifies for complete sheafy `A` of noetherian type; such affinoids form a basis; the property
passes to open and closed subspaces, to sources of maps locally of weakly finite type, and from `Y`
to `X ×_S Y`; such `X` has stably sheafy charts (all complete topologically-finite-type algebras
over chart rings are sheafy; Wedhorn Def. 8.54); analytic `X` qualifies iff locally `Spa` of
complete strongly noetherian Tate rings. Checks: `Spa(ℤ_p⟦T⟧)` qualifies and is not analytic. The
perfectoid disc `Spa(K⟨T^{1/p^∞}⟩, K°⟨T^{1/p^∞}⟩)` is sheafy but not locally noetherian (the ideals
`(T^{1/pⁿ})` increase strictly near `T = 0`). Lean: `AdicSpace.IsLocallyNoetherian`,
`AdicSpace.HasStablySheafyCharts`, `IsLocallyNoetherian.spa`,
`IsLocallyNoetherian.of_locallyOfWeaklyFiniteType`, `IsLocallyNoetherian.isStablySheafy`.

### R0.7 fibre products

**Valuation amalgamation.** (*valuation-amalgamation*) For ring maps `A → B`, `A → C` and
`y ∈ Spv B`, `x ∈ Spv C` with equal pullbacks to `Spv A`, some `v ∈ Spv(B ⊗_A C)` pulls back to `y`
and `x` (Huber94 §3, proof of Lem. 3.9(i), pp. 537–538; Wedhorn §8.7, proof of Prop. 8.63, p. 92).
It reduces to the field form: for `K₀ ⊆ K₁, K₂` and valuation rings `V_i ⊆ K_i` with
`V₁ ∩ K₀ = V₂ ∩ K₀`, a residue field `L` of `K₁ ⊗_{K₀} K₂` has a valuation ring `W` with
`W ∩ K_i = V_i` (Huber96 §1.1, (1.1.14)(f), p. 45). Checks: `𝔽_2 ⊗_ℤ 𝔽_3 = 0`, matching distinct
pullbacks to `Spv ℤ`. For `ℚ_p(√p) ⊗_{ℚ_p} ℚ_p(√p) ≅ ℚ_p(√p)²` the amalgam is not unique. Lean:
`ValuationSpectrum.exists_amalgamation`; the field form is a README target.

**Affinoid fibre products.** (*affinoid-fibre-product*) For morphisms `(A, A⁺) → (B, B⁺)`,
`(A, A⁺) → (C, C⁺)` of complete Hausdorff sheafy Huber pairs with adic ring maps, if `D = B ⊗̂_A C`
is sheafy then `Spa D` is the fibre product `Spa B ×_{Spa A} Spa C` of adic spaces (Huber94 §3,
proof of Prop. 3.7, p. 536, and §2, Prop. 2.1(i), p. 522; Huber96 §1.2, Prop. 1.2.2 and proof part
1), p. 47). Sheafiness of `D` replaces Huber's convention (Huber96 §1.1, (1.1.1), p. 37); it holds
in the noetherian case (*completed-tensor-noetherian-stability*). Checks:
`Spa(K⟨T⟩) ×_{Spa K} Spa(K⟨S⟩) = Spa(K⟨T, S⟩)` (Hübner §9, Ex. 9.3). For `L = ℚ_p(√p)`,
`Spa(L, O_L) ×_{Spa ℚ_p} Spa(L, O_L) = Spa(L × L, O_L × O_L)`, two points. Lean: README target.

**Fibre products along finite type.** (*fibre-product-along-finite-type*) For complete Hausdorff
affinoids `S = Spa(A, A⁺)`, `X = Spa(C, C⁺)`, `Y = Spa(B, B⁺)`, `B` stably sheafy, `X → S`
topologically of finite type as pairs via `A⟨X₁, …, X_n⟩_M → C` with kernel `𝔞`, and `Y → S` given
by any, possibly non-adic, `λ`: for finite `L ⊆ B` generating an ideal of definition of a ring of
definition, let `W_m = Spa(B⟨X⟩_{M_{L,m}}/J_m)`, `M_{L,m} = (λ(M_i) ∪ Lᵐ)_i`, `J_m` the closed ideal
generated by `𝔞`, with integral-closure plus rings. `W_m` is topologically of finite type over `Y`
and is the rational subset `{|ℓX_i| ≤ 1, ℓ ∈ Lᵐ}` of `W_{m'}` (`m ≤ m'`); `⋃_m W_m = X ×_S Y`,
`Spa(C ⊗̂_A B)` for adic `λ`, in general not quasi-compact (Huber96 §1.2, proof of Prop. 1.2.2, part
2), pp. 47–48, universal property p. 49; Hübner §9, proof of Thm 9.2(iii), p. 42; Huber94 §3, proof
of Prop. 3.8, p. 537; Berkeley Lecture 4, §4.1, p. 28). Checks:
`Spa(ℚ_p, ℤ_p) ×_{Spa ℤ_p} Spa(ℤ_p⟦T⟧)` (`L = {p, T}`) gives `W_m = {|T|ᵐ ≤ |p| ≠ 0}` and the
non-affinoid open unit disc (Hübner §9, Ex. 9.4); `ℤ_p⟨T⟩` gives `Spa ℚ_p⟨T⟩`. Lean: README target.

**Existence of fibre products.** (*fibre-products-existence*) Let `f : X → S`, `g : Y → S` be
morphisms, `Y` covered by `Spa(B, B⁺)` with `B` complete and stably sheafy (e.g. locally
noetherian), and (a) `f` locally of finite type, or (b) `f` locally of weakly finite type and `g`
adic. Then `X ×_S Y` exists with stably sheafy charts; the projection `q` to `Y` is locally of
finite type in (a), of weakly finite type in (b), and `p` is adic if `g` is; locally `Spa(C ⊗̂_A B)`
for adic `g`, else the union of *fibre-product-along-finite-type* (Huber94 §3, Prop. 3.7, p. 535;
Huber96 §1.2, Prop. 1.2.2 and proof, pp. 47–49, and Cor. 1.2.3(i), (iii)(a), p. 49; Wedhorn §8.6,
Thm 8.56, p. 89; Berkeley Lecture 4, §4.1, p. 28). Checks: `Spa(ℤ_p⟦T⟧) ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p)`
exists, not affinoid. `Spa(ℤ[T₁, T₂, …], ℤ) × Spa K` is not representable (Berkeley Lecture 4, §4.1,
p. 28). Lean: existence `hasPullback_of_finiteType`.

**Points of fibre products.** (*fibre-product-points*) In case (b) of *fibre-products-existence*
(`f` locally of weakly finite type, `g` adic, `Y` with stably sheafy charts),
`|X ×_S Y| → |X| ×_{|S|} |Y|` is surjective (Huber94 §3, Lem. 3.9(i), p. 537, and proof, p. 538;
Huber96 §1.2, Cor. 1.2.3(iii)(d), p. 49). Checks: for `L = ℚ_p(√p)`,
`Spa(L, O_L) ×_{Spa ℚ_p} Spa(L, O_L)` has two points over one (Conrad-AWS §5.2, p. 49). Without
adicness it fails even for `f` locally of finite type: over discrete `ℤ_p`, the rank-2 point of
discrete `ℤ_p[T]` with `0 < |T| < |p|ⁿ` (all `n`) and the Gauss point of radius `|p|^{1/2}` of
`U`-adic `ℤ_p⟦U⟧` have no common lift, as `|U|^{2n} = |p|ⁿ > |T|`. Lean: `exists_pullback_point`.

**Stability under base change.** (*base-change-stability*) For `Z = X ×_S Y` as in
*fibre-products-existence*, with base changes `q : Z → Y` of `f` and `p : Z → X` of `g`: (i) `f`
locally of finite type ⇒ `q` is; (ii) `f` locally of weakly finite type, `g` adic ⇒ `q` is; (iii)
the same for +weakly finite type; (iv) `f` locally of finite presentation ⇒ `q` locally of finite
type, and of finite presentation if `Y` is analytic or `f` has charts `O_S(W)⟨X⟩_M/𝔞` with `𝔞`
finitely generated (e.g. `O_S(W)⟨X⟩_M` noetherian or `O_S(W)` discrete); (v) `g` adic ⇒ `p` adic;
(vi) for adic `g`, `q` (resp. `p`) is quasi-compact or quasi-separated if `f` (resp. `g`) is
(Wedhorn §8.6, Rem. 8.57, p. 90; Huber94 §3, Prop. 3.7, p. 535; Huber96 §1.2, Cor. 1.2.3, p. 49,
whose (i) needs (1.1.1)). Checks: for `A = ℤ_p ⊕ M`, `M = ⊕_ℕ 𝔽_p e_i`, `M² = 0`, basis `pⁿℤ_p ⊕ 0`
(adic by *noetherian-rod-sheafy*, Huber94 §2, Thm 2.2), `Spa ℤ_p → Spa(A, A)` is locally of finite
presentation, its adic base change to `Spa(𝔽_p ⊕ M)` is not. Non-adic base change to `Spa(ℤ_p⟦T⟧)`
turns `Spa(ℚ_p, ℤ_p) → Spa ℤ_p` into the non-quasi-compact open disc. Lean: clauses (ii), (v)
`LocallyOfWeaklyFiniteType.baseChange`, `IsAdic.baseChange`.

### R0.8 closed subspaces and the diagonal

**Closed subspaces and immersions.** (*closed-adic-subspaces-and-embeddings*) `h : T → X` is a
closed immersion if every point of `X` lies in an affinoid chart `Spa(A, A⁺)` with whole inverse
image an affinoid chart `Spa(B, B⁺)`, `A → B` a continuous open surjection (`B = A/J`, `J` closed),
`B⁺` the integral closure of the image of `A⁺`; then `Spa(A/J) ≅ {v : J ⊆ supp v}`. A locally closed
immersion is a closed immersion into an open subspace. An ideal sheaf `𝓘 ⊆ O_X` is admissible if
some affinoid cover by `U = Spa(A, A⁺)` has `J_U = 𝓘(U)` closed, `A/J_U` sheafy and
`𝓘(W) = ker(O_X(W) → O_{Spa(A/J_U)}(W ∩ V(J_U)))` for rational `W ⊆ U`; `V(𝓘)` is the adic space on
`Z = {x : 𝓘_x ≠ O_{X,x}}` with `(O_X/𝓘)|_Z`, valuations via `O_{X,z}/𝓘_z`. `V(𝓘) ∩ U ≅ Spa(A/J_U)`
over `U`, with kernel `𝓘` and stalks `O_{X,x}/𝓘_x`; `ι : V(𝓘) → X` is a closed immersion locally of
finite type, and every closed immersion `h` is `X`-isomorphic to `ι` for the admissible
`ker(O_X → h_*O_T)`; `V(𝓘) ×_X Y = V(𝓘·O_Y)` for `Y` with stably sheafy charts (locally
`B/closure(J·B)`); open and closed immersions are locally closed, closed under composition; on
locally noetherian `X` affinoid ideals are closed with sheafy quotients (Huber96 §1.4, (1.4.1), p.
60; Zavyalov24 §5, Def. 5.1, p. 8; Conrad-AWS §3.1, Ex. 3.1.5, p. 24). Checks: in the disc, `V(T²)`
and `V(T)` share their point, not their rings. In `C(ℤ_p, ℚ_p)` the non-closed ideal of functions
vanishing near `0` is inadmissible. Lean: `AdicSpace.IsClosedImmersion`,
`AdicSpace.IsLocallyClosedImmersion`; `V(𝓘)` and the ideal-sheaf correspondence are README targets.

**The diagonal.** (*diagonal-locally-closed*) For `f : X → Y` locally of weakly finite type, `X`
covered by complete stably sheafy affinoids (e.g. locally noetherian), `Δ_f` is a locally closed
immersion: the union `W` of the `U ×_V U` over open affinoids with `f(U) ⊆ V` and `O_Y(V) → O_X(U)`
topologically of finite type is open and contains `Δ_f(X)`, and `X → W` is a closed immersion, on
`U ×_V U` the multiplication `O_X(U) ⊗̂_{O_Y(V)} O_X(U) → O_X(U)` (Zavyalov-Q Appendix B.7, Lem.
B.7.3 and proof, pp. 57–58; Zavyalov24 §5, proof of Cor. 5.11, p. 12; Conrad-AWS §3.1, Def. 3.1.6,
p. 24, and §5.2, p. 49). Separatedness asks `Δ_f` to be a closed immersion into all of `X ×_Y X`.
Checks: for the disc over `ℚ_p`, `Δ` is cut out by `T ⊗ 1 − 1 ⊗ T`. For two discs glued along the
open disc `D°`, the rank-2 point with `|T| = γ < 1` infinitely near `1` lies in `closure(D°) ∖ D°`,
and its two copies lie in `closure(Δ(X)) ∖ Δ(X)`. Lean: `diagonal_locallyClosed`.

### R0.9 classical K-affinoid algebras

`K` is complete for a nontrivial rank-one nonarchimedean absolute value, `K̃ = K°/K°°`, `ϖ` a
pseudo-uniformiser. A *`K`-affinoid algebra* `A` is a commutative `K`-algebra with a complete
Hausdorff first-countable ring topology and a continuous open surjection `K⟨X₁,…,X_n⟩ → A`
(`TauCeti.Huber.IsStrictlyTopologicallyFiniteType`; Wedhorn §5.7, Def. 5.57).

**Noether normalisation.** (*affinoid-noether-normalisation*) A nonzero `K`-affinoid `A` is finite
over the image of an injective continuous `K⟨T₁,…,T_d⟩ → A`, and every finite injective `K`-algebra
map `K⟨T₁,…,T_d⟩ → A` (continuity not assumed) is strict with closed image (KL15 §2.5, Lem. 2.5.4,
p. 48; Conrad-AWS §1.2, Thm 1.2.6(4), p. 6, proof pattern before Thm 1.1.5); `|K^×|` need not be
discrete (BGR 6.1.2/2). Checks: on `K⟨X, Y⟩/(XY − 1)`, `T ↦ X + Y` is finite, `X ↦ X` is not; for
`A = 0` nothing is injective. Lean: `Affinoid.exists_finite_injective_tateAlgebra` (existence part).

**Residue fields are finite.** (*affinoid-residue-fields-finite*) For `m ∈ Max A`, `A/m` is finite
over `K` (Wedhorn §5.7, Prop. 5.61, p. 46; KL15 §2.5, Cor. 2.5.5(a), p. 48), so `|·|` extends
uniquely to `A/m`, and `K`-algebra maps of `K`-affinoid algebras pull back maximal ideals
(Conrad-AWS §1.2, Ex. 1.2.3, p. 5). Check: `K⟨T⟩/(T² − c) = K(√c)` has degree `2` for a non-square
`c ∈ K°`. Lean: `Affinoid.finiteDimensional_residueField`.

**Jacobson property.** (*affinoid-jacobson*) `K`-affinoid algebras are Jacobson (`IsJacobsonRing`)
(Conrad-AWS §1.1, Thm 1.1.5(2), p. 4; §1.2, after Def. 1.2.1, p. 5): `f` is nilpotent iff it
vanishes on `Max A`, a unit iff it vanishes nowhere. Check: `K°` (not `K`-affinoid) has Jacobson
radical `K°° ≠ 0` and nilradical `0`. Lean: `Affinoid.isJacobsonRing`.

**Maximal ideals of Tate algebras.** (*tate-algebra-maximal-ideals-polynomial*) Each maximal
`m ⊆ K⟨X₁,…,X_n⟩` is `(p₁,…,p_n)` with `p_i ∈ K[X₁,…,X_i]` monic in `X_i`, and `m ∩ K[X]` is maximal
with the same residue field (Conrad-IC Appendix A.1, proof of Lem. A.1.2(2), p. 32; GK00 §1, proof
of Prop. 1.5, printed p. 4). Check: over `ℚ_p`, `(X(X − p⁻¹)) = (X)`, so a monic generator may have
roots off the disc. Lean: README target.

**Supremum seminorm.** (*affinoid-supremum-seminorm*) `|f|_sup = sup_{x ∈ Max A} |f(x)|` (`0` if
`A = 0`), `|f(x)|` the spectral norm of `f mod m_x`. It is bounded by the residue norm
`inf{‖g‖ : π(g) = f}` of each presentation `π` (`‖·‖` the Gauss norm on `K⟨X⟩ ⊇ K[X]`); it is a
`K`-algebra seminorm with `|fⁿ|_sup = |f|_supⁿ` (`n ≥ 1`) and `|λ|_sup = |λ|` (`A ≠ 0`), contracted
by `K`-algebra maps (equality for surjections with nilpotent kernel), zero exactly on nilpotents,
the Gauss norm on `K⟨X⟩`, equal to `lim |fⁿ|_π^{1/n}` (KL15 Def. 2.1.9), valued in `√|K^×| ∪ {0}`
(Kedlaya06 §2.1, Def. 2.1.7, p. 9, and p. 10; Conrad-AWS §1.2, after Thm 1.2.6, p. 7; §1.1, Exercise
1.1.3(3)–(4), p. 3). Checks: `|T|_sup = 0` in `K⟨T⟩/(T²)`; `T^p − T ∈ ℚ_p⟨T⟩` (every `p`) has
`|·|_sup = 1`, attained over `ℚ_{p²}`, but is `≤ |p|` on `ℤ_p`. Lean:
`Huber.TateAlgebra.ofMvPolynomial`, `Huber.Affinoid.evalNorm`, `Huber.Affinoid.supNorm`.

**Maximum modulus.** (*affinoid-maximum-modulus*) For nonzero `A`, `|f|_sup = |f(x)|` for some
`x ∈ Max A` (Conrad-AWS §1.2, Thm 1.2.6(5), pp. 6–7; Kedlaya06 §2.1, properties after Def. 2.1.7, p.
10, citing BGR §6.2), and `min_x |u(x)| = |u⁻¹|_sup⁻¹` for units `u` (Conrad-AWS §1.2, Rem. 1.2.7,
p. 7). Check: over `ℚ_p`, `x` need not be rational. Lean: `Affinoid.exists_supNorm_eq`.

**Power-bounded elements.** (*affinoid-power-bounded-iff-sup*) `f ∈ A°` iff `|f|_sup ≤ 1`, and `f`
is topologically nilpotent iff `|f|_sup < 1` (Conrad-AWS §1.2, discussion after Thm 1.2.6, p. 7;
Kedlaya06 §2.1, Def. 2.1.8, p. 10; GK00 §1, proof of Prop. 1.6(2), p. 4, citing BGR 6.2.3/1). Check:
in `ℚ_p⟨T⟩/(T² − p)`, `T` is topologically nilpotent though of residue norm `1`. Lean:
`Affinoid.mem_powerBoundedSubring_iff_supNorm_le_one` (power-bounded half).

**Reduced algebras.** (*reduced-affinoid-supremum-norm*) For reduced `A`, `|·|_sup` is a norm with
`|f|_sup ≤ |f|_π ≤ C·|f|_sup` for each residue norm, some `C > 0` (KL15 §2.5, Cor. 2.5.6, p. 48,
citing BGR 6.2.4/1), so `A` is uniform (Conrad-Adic §2.1, Ex. 2.3, p. 6; converse for Hausdorff Tate
rings: Morel, Rem. IV.1.1.3, p. 121; §II.1.4, Examples, item 9, p. 63). Check: discrete `K[ε]/(ε²)`
(not Tate) is uniform, not reduced; with its affinoid topology it is not uniform (Conrad-Adic Ex.
2.4). Lean: README target.

**Automatic continuity.** (*affinoid-homomorphism-continuous*) `K`-algebra maps of `K`-affinoid
algebras are continuous, so all residue norms on `A` are equivalent (Wedhorn §5.7, Prop. 5.60, p.
46, citing BGR 6.1.3/1; Conrad-AWS §1.2, Thm 1.2.6(2), p. 6; GK00 §1, proof of Prop. 1.6(2), printed
pp. 4–5). Lean: `Affinoid.continuous_of_algHom`.

**Power-bounded elements are integral.** (*affinoid-power-bounded-integral*) For a continuous
surjection `π : K⟨X⟩ → A`, `A°` is the integral closure of `π(K°⟨X⟩)`, with no reducedness (Huber94
§4, proof of Lem. 4.4, p. 543, citing BGR 6.4.3; BL I §4, proof of Lem. 4.5, printed p. 309). Check:
`π(K°⟨T⟩) = K° ⊕ K°T ⊊ A° = K° ⊕ KT` in `K⟨T⟩/(T²)`. Lean: README target.

**Reductions of finite maps.** (*affinoid-reduction-finite*) A finite `A → B` of `K`-affinoid
algebras maps `A°`, `A°°` into `B°`, `B°°`, and `A°/A°° → B°/B°°` is finite (KL15 §2.5, Cor. 2.5.7,
p. 48, with KL15 Def. 2.1.7, citing BGR 6.3.4/2; Conrad-IC §3, proof of Thm 3.2.1, p. 19). Check:
`K⟨T₁,…,T_d⟩` reduces to `K̃[T₁,…,T_d]` (BGR 6.3.4/3). Lean: README target.

**Reduced reduction.** (*reduced-reduction-ring-of-definition*) If `A` is Tate with ring of
definition `A₀` and `ϖ ∈ A₀` a topologically nilpotent unit with `A₀/ϖA₀` reduced, then `A₀ = A°`
(FK Ch. 0, Appendix B.1(b), Prop. B.1.3(1), p. 236 (PDF p. 254 of arXiv v5); Kedlaya06 §2.1, Def.
2.1.8, p. 10). Checks: for `B = ℤ_p⟨T⟩[S]/(S² − p²T)` (every `p`), `B/pB` is not reduced and
`S/p ∈ A° ∖ B`; `A₀ = ℤ_p`, `ϖ = p²` shows reducedness is not necessary. Lean: README target.

### R0.10 separated, universally closed, proper and partially proper morphisms

Huber's Defs. 1.3.1–1.3.3 assume spaces locally of noetherian type (Huber96 §1.1, (1.1.1), p. 37),
hence stable (Wedhorn Cor. 8.35); here the relevant source has *stably sheafy charts*, a cover by
open `Spa(A, A⁺)` with `A` complete and stably sheafy (true if locally noetherian or, by Wedhorn
§8.6, Rem. 8.55(2), p. 89, locally of weakly finite type over such). Examples:
`D = Spa(K⟨T⟩, K°⟨T⟩)` with Gauss point `x_G`, the open disc `B = ⋃_n {|T|ⁿ ≤ |ϖ|}`, `P¹ = D₀ ∪ D_∞`
(AdicSpaces layers 5.3–5.4), and `A_∞ ⊊ k(x_G)⁺` the ring at `T = ∞` of `K̃(T)`.

**Separated morphism.** (*separated-morphism*) For `f : X → Y` locally of weakly finite type, `X`
with stably sheafy charts (both part of the notion), `f` is *separated* if `Δ_f(|X|)` is closed in
the adic `|X ×_Y X|`, not in `|X| ×_{|Y|} |X|` (Huber96 §1.3, Def. 1.3.1, p. 51; Zavyalov-Q Appendix
B.7, Def. B.7.1 and Rem. B.7.2, p. 57). Maps of affinoids with stably sheafy source, open and closed
embeddings are separated; it survives composition, cancellation and adic base change; over a
strongly noetherian Tate affinoid, for `f` locally of topologically finite type, affinoids meet in
affinoids (Zavyalov-Q B.7.5). Checks: `D → Spa(K, K°)` is separated though `Δ(|D|)` is not closed in
`|D| × |D|`; `D` with doubled origin is not separated. Lean: `AdicSpace.IsSeparated`.

**Universally closed morphism.** (*universally-closed-morphism*) `f` locally of weakly finite type
is *universally closed* if `|f'|` is closed for every base change `f'` of `f` along an adic
`g : Y' → Y` (Huber96 §1.3, Def. 1.3.2(i), p. 51), such pullbacks existing when `Y'` has stably
sheafy charts (Huber96 Prop. 1.2.2(b), pp. 47–49); it survives adic base change and composition and
implies universally specializing. Check: `D → Spa(K, K°)` has closed map but is not universally
closed: `(x_G, A_∞)` has a centre on `Spa(K, K°)`, none on `D`. Lean: `AdicSpace.UniversallyClosed`.

**Proper morphism.** (*universally-closed-and-proper-morphism*) For `X` with stably sheafy charts,
`f` is *proper* if of +weakly finite type (quasi-compact, `O_X⁺(U)` locally the integral closure of
`O_Y⁺(V)[E ∪ O_X(U)°°]`, `E` finite; Huber96 §1.2, Def. 1.2.1(ii),(iv), p. 46), separated and
universally closed (Huber96 §1.3, Def. 1.3.2(ii), p. 51); Kiehl's rigid notion (Conrad-AWS §3.2,
Def. 3.2.3, p. 27) is compared in layer R1. Checks: `P¹ → Spa(K, K°)` is proper; `D` is not, though
quasi-compact, separated, with closed map. Lean: `AdicSpace.IsProper`.

**Universally specializing morphism.** (*universally-specializing-morphism*) `f` is *specializing at
`x`* if every specialization of `f(x)` lifts to one of `x` (at all `x`: `SpecializingMap` for
`|f|`); `f` locally of weakly finite type is *universally specializing* (at `x₀`) if every adic base
change is specializing at all points (over `x₀`) (Huber96 §1.3, Def. 1.3.3(i), p. 51; no
analyticity, cf. before Def. 1.3.5, p. 52). Checks: `D₀ → P¹` is not specializing at `x_G`;
`B → Spa(K, K°)` is universally specializing, since `|T(x)|^{2n} < |ϖ(x)|`, unlike `|T(x)| < 1`,
passes to specializations. Lean: `AdicSpace.UniversallySpecializing`.

**Partially proper morphism.** (*partially-proper-morphism*) `f` is *partially proper* if locally of
+weakly finite type, separated and universally specializing (Huber96 §1.3, Def. 1.3.3(ii), p. 51);
it survives composition and adic base change and is relative (`B ⊆ D` is, `D ⊆ P¹` is not), unlike
Kedlaya–Liu's partially proper opens. Check: `B → Spa(K, K°)` is partially proper, not
quasi-compact. Lean: `AdicSpace.IsPartiallyProper`.

### R0.11 valuation rings, centres and the valuative criteria

**Valuation rings and centres.** (*adic-valuation-rings-and-centres*) For analytic `X`, `X_v` is the
set of `(x, A)` with `A` a valuation ring of the residue field `k(x)` of `O_{X,x}` inside the ring
`k(x)⁺` of `v_x` (Huber96 §1.3, Def. 1.3.5, p. 52), topologised by the sets
`D(U, h) = {(x, A) : x ∈ U, h(x) ∈ A}` (Huber96 §1.3, (1.3.11), p. 55). With `Â` the closure of `A`
in `k(x)^∧` (an affinoid field; Hübner §2, before Exercise 2.2, p. 3), `z ∈ Z` is a *centre* of
`(x, A)` for `g : Spa κ(x) → Z` if `g` extends over `Spa(k(x)^∧, Â)` sending the closed point to `z`
(Huber96 §1.3, Lem. 1.3.10, p. 55), equivalently `z` specializes `g(x)` and `k(z)⁺ = i⁻¹(A)`. On
`Spa(B, B⁺)` a centre exists, then uniquely, iff `B⁺` maps into `A`, and for `x ≻ y` exactly one `A`
has centre `y` (Huber96 §1.3, Lem. 1.3.6 and 1.3.6(i), p. 52); `(x, A) ↦ (f(x), A ∩ k(f(x)))`
preserves centres (after Lem. 1.3.6, p. 52). Check: at `x_G`, the ring at `T = a ∈ K̃` has one
centre on `D`, `A_∞` none. Lean: `AdicSpace.ValuationRing`, `ValuationRing.basicOpen`,
`ValuationRing.IsCentre` (pointwise form).

**Valuative criterion for separatedness (Huber 1.3.7).** (*valuative-criterion-separated*) For `f`
quasi-separated, locally of weakly finite type, between analytic spaces, `X` with stably sheafy
charts: `f` is separated iff each `(x, A) ∈ X_v` has at most one centre on `X` over each `y ∈ Y`
(Huber96 §1.3, Prop. 1.3.7, pp. 52–53; Stacks Tag 0903, Lem. 5.23.6). Checks: the disc doubled along
`{|ϖ| ≤ |T|}` (quasi-separated) has a pair with two centres; `D` with doubled origin satisfies
uniqueness, so quasi-separatedness is needed. Lean: `IsSeparated.iff_valuativeCriterion`.

**Valuative criterion for universal specialization (Huber 1.3.8).**
(*valuative-criterion-specializing*) For `f` locally of weakly finite type between analytic spaces,
`f` is universally specializing at `x₀` iff for each valuation ring `A ⊆ k(x₀)⁺` of `k(x₀)` every
centre of `(x₀, A)` on `Y` lifts to one on `X` (Huber96 §1.3, Prop. 1.3.8, p. 53; (⇐), p. 54).
Check: `Spa(ℚ_p, ℤ_p) → Spa(ℤ_p, ℤ_p)` meets the criterion but the point `(p)` does not lift, so `Y`
must be analytic. Lean: `UniversallySpecializing.iff_valuativeCriterion` (all points at once).

**Valuative criterion for partial properness and properness (Huber 1.3.9).**
(*separated-proper-partially-proper*) For `f` quasi-separated, locally of +weakly finite type,
between analytic spaces, `X` with stably sheafy charts: `f` is partially proper iff each
`(x, A) ∈ X_v` has exactly one centre on `X` over each of its centres on `Y`, and, for `f` of
+weakly finite type, proper iff the same holds (Huber96 §1.3, Cor. 1.3.9, pp. 54–55; Lem. 1.3.10, p.
55). Check: `D` fails existence at `(x_G, A_∞)`. Lean: `IsPartiallyProper.iff_valuativeCriterion`
(partially proper half; the properness half is a README target).

**Proper is partially proper and quasi-compact (Huber 1.3.4).**
(*proper-iff-partially-proper-quasi-compact*) With no analyticity, `f` is proper iff partially
proper and quasi-compact (Huber96 §1.3, Lem. 1.3.4 and proof, pp. 51–52; Stacks Tag 0903, Lem.
5.23.6; Tag 0A2S, Lem. 5.23.3). Check: `B` and `D` each satisfy only one side. Lean:
`IsProper.iff_isPartiallyProper_and_quasiCompact`.

**`X_v` is spectral (Huber 1.3.12).** (*valuation-ring-space-spectral*) For qcqs analytic `X`, `X_v`
is spectral, `D(U, h)` is quasi-compact for quasi-compact open `U`, and `X_v → X` is spectral
(Huber96 §1.3, (1.3.11) and Lem. 1.3.12, p. 55; proof pp. 55–57). Check: `Spa(K, K°)_v` is the
Riemann–Zariski space of `K̃`. Lean: `ValuationRing.spectralSpace` (spectrality).

**Closures under partially proper morphisms (Huber 1.3.13).**
(*partially-proper-closure-quasi-compact*) If `f : X → Y` is partially proper between analytic
spaces, `Y` qcqs, `X` with stably sheafy charts, closures of quasi-compact subsets of `X` are
quasi-compact (Huber96 §1.3, Lem. 1.3.13 and proof, p. 57). Lean: README target.

### R0.12 closure properties of separated, universally closed and proper morphisms

**The diagonal of a separated morphism.** (*separated-diagonal-closed-embedding*) For `f` locally of
weakly finite type, `X` with stably sheafy charts, `f` is separated iff `Δ_f` is a closed embedding,
since a locally closed embedding with closed image is closed (Zavyalov-Q Appendix B.6, Lem. B.6.14,
p. 57, the gluing working for admissible ideal sheaves; Appendix B.7, Cor. B.7.4, p. 58). Check:
`Δ_D` is cut out of the bidisc by `T ⊗ 1 − 1 ⊗ T`. Lean: `IsSeparated.iff_closedImmersion_diagonal`.

**Adic base change.** (*proper-base-change*) For `f` locally of weakly finite type and adic
`g : Y' → Y`, universal closedness (resp. separatedness, quasi-compactness, properness) passes to
`X ×_Y Y' → Y'`, for separatedness and properness if `Y'` has stably sheafy charts (Stacks Tag 01W4
(Morphisms, Lem. 29.42.5); Huber96 §1.2, Prop. 1.2.2 and proof, pp. 47–49, case b)). Check: along
the non-adic `Spa(ℤ_p⟦T⟧) → Spa(ℤ_p)` the quasi-compact `Spa(ℚ_p, ℤ_p) → Spa(ℤ_p, ℤ_p)` becomes
non-quasi-compact. Lean: `IsProper.baseChange` (proper case).

**Composition.** (*proper-comp*) For `f`, `g` locally of weakly finite type, universal closedness
(resp. separatedness, quasi-compactness, properness) of `f` and `g` passes to `g ∘ f` (Stacks Tag
01W3 (Morphisms, Lem. 29.42.4)). Check: the origin `Spa(K, K°) → D` and the composite identity are
proper, `D → Spa(K, K°)` is not. Lean: `IsProper.comp` (proper case).

**Cancellation.** (*proper-of-comp-separated*) If `g` is separated and `g ∘ h` locally of weakly
finite type and universally closed (resp. proper, with `h` locally of +weakly finite type), then so
is `h`, and `h(|X|)` is closed (Stacks Tag 01W6 (Morphisms, Lem. 29.42.7)). Checks: sections of
separated morphisms are proper closed embeddings; a copy of `P¹` in `P¹` with doubled `∞` is not
closed, so `g` must be separated. Lean: README target.

**Descent along surjections.** (*universally-closed-of-surjective*) For `p : X → S`, `q : Y → S`
locally of weakly finite type and a surjection `π : X → Y` with `q ∘ π = p`, `p` universally closed
makes `q` so, and proper if also separated, quasi-compact and locally of +weakly finite type (Stacks
Tag 03GN (Morphisms, Lem. 29.42.9); Zavyalov-Q §5.1, proof of Prop. 5.1.1, p. 34; §5.3, proof of
Prop. 5.3.1, p. 36). Check: surjectivity is needed (`∅ → D`). Lean: README target.

**Closed embeddings are proper.** (*closed-embedding-proper*) A closed embedding into `X` with
stably sheafy charts is proper, with no analyticity; its adic base changes are the closed embeddings
`V(𝓘·O_{X'})` (Stacks Tag 01W5 (Morphisms, Lem. 29.42.6); Zavyalov-Q Appendix B.6, Cor. B.6.10(1),
p. 56; Huber96 §1.4, Lem. 1.4.5, pp. 61–62). Checks: `V(T²) ⊆ D` is proper, `B ⊆ D` is not; a
locally closed embedding is proper iff closed. Lean: `IsClosedImmersion.isProper`.

### R0.13 finite morphisms

**Finite morphism of Huber pairs.** (*finite-huber-pair-hom*) `φ : (A, A⁺) → (B, B⁺)` of complete
Huber pairs is *finite* if topologically of finite type (Huber94 §3) with `A → B`, `A⁺ → B⁺`
integral (Huber96 §1.4, (1.4.2), p. 61; Zavyalov-Q Appendix B.2, Def. B.2.6 and Rem. B.2.7, p. 45).
Then `B⁺` is the integral closure of `φ(A⁺)`; for Tate `A`, `B` is module-finite with the natural
topology (Zavyalov-Q Appendix B.2, Lem. B.2.9, p. 45; Appendix B.3, Lem. B.3.4, p. 48), which with
integral `A⁺ → B⁺` characterises finiteness of complete Tate pairs (Lems. B.2.8–B.2.9). Check:
`(K, K⁺) → (K, K°)`, `K⁺ ⊊ K°`, is not finite. Lean: `Huber.Pair.Hom.IsFinite`.

**Finite morphism of adic spaces.** (*finite-morphism*) `f` is *finite* if each `y` has an open
affinoid `V ∋ y` with `f⁻¹(V)` affinoid and finite over `V` as Huber pairs (Huber96 §1.4, (1.4.4),
p. 61; Zavyalov-Q Appendix B.2, Def. B.2.12, p. 46); the global form ([Hu4, 3.6.20, 3.12.12]) is
proved only over strongly noetherian complete Tate affinoids (Zavyalov-Q Appendix B.2, Thm B.2.18
and Rem. B.2.19, p. 47). Finite morphisms are quasi-compact and closed under composition and base
change (Huber 1.4.5(i)). Check: `{|T| ≤ |ϖ|} ⊆ D` is not finite. Lean: `AdicSpace.IsFinite`.

**Finite algebras over noetherian affinoid rings.** (*finite-algebra-over-affinoid*) For `(A, A⁺)`
complete with `A` noetherian Tate or with a noetherian ring of definition, a finite `A`-algebra `C`
with its natural module topology (Huber94 p. 524) and `C⁺` the integral closure of the image of `A⁺`
form a complete Huber pair (Tate, resp. strongly noetherian Tate, with `A`; submodules closed),
finite over `(A, A⁺)`, whose maps under `(A, A⁺)` are the `A`-algebra maps; for `A` strongly
noetherian Tate all finite `X → Spa(A, A⁺)` arise, with `C = O_X(X)` (Huber94 §2, Lems. 2.3 and
2.4(ii), printed p. 525; Morel §II.4.2, Prop. II.4.2.2; Zavyalov-Q Appendix B.2, Thm B.2.18, p. 47;
Huber96 §1.4, (1.4.2), p. 61). Check: `A/J` with `J` not closed is not Hausdorff (Zavyalov-Q
Appendix B.3, Rem. B.3.3, p. 48). Lean: README target.

**Finiteness from monic relations (Huber 1.4.3).** (*finiteness-criterion-monic-relations*) A
morphism of complete Tate pairs, topologically of finite type via `A⟨T₁,…,Tₙ⟩ → B`, `Tᵢ ↦ tᵢ ∈ B⁺`,
is finite iff each `tᵢ` has a monic `pᵢ ∈ A⁺[X]` with `pᵢ(tᵢ)` topologically nilpotent (Huber96
§1.4, Lem. 1.4.3 and proof, p. 61; Zavyalov-Q Appendix B.2, Lem. B.2.9, p. 45). Check: for `K⟨T⟩`
each monic `p ∈ K°[X]` has `‖p(T)‖ = 1`. Lean: README target.

**Finite morphisms are proper (Huber 1.4.5(ii)).** (*finite-morphisms*) Finite morphisms to analytic
spaces with stably sheafy charts are proper (Huber96 §1.4, (1.4.4) and Lem. 1.4.5(ii) with proof,
pp. 61–62, via Huber96 §1.3, Cor. 1.3.9, pp. 54–55), integral plus rings giving unique centres;
Huber's general case via [HuKn, 2.1.2, 2.1.6] is not asserted. Lean: `IsFinite.isProper`.

**Closed embeddings are finite (Huber 1.4.5(iii)).** (*closed-embedding-finite*) A closed embedding,
cut out by an admissible ideal sheaf (Huber96 (1.4.1)), is finite with no noetherian or sheafiness
hypothesis: each `J_U` is closed, `A/J_U` sheafy, `(A, A⁺) → (A/J_U, integral closure)` finite
(Huber96 §1.4, (1.4.1) and Lem. 1.4.5(iii), pp. 60–62; Zavyalov-Q Appendix B.6, Cor. B.6.9, p. 55,
and proof of Cor. B.6.10, p. 56). Lean: `IsFinite.of_isClosedImmersion`.

**Fibre nilpotence spreads (Huber 1.4.8).** (*fibre-nilpotence-spreading*) Let `(A, A⁺) → (B, B⁺)`
be of topologically finite type between complete Tate pairs (cf. Zavyalov-Q B.2.17),
`x ∈ Spa(A, A⁺)`, `k(x)` the fraction field of `A/supp(x)`. If `b ∈ B` is topologically nilpotent in
`B ⊗̂_A k(x)`, it is so in `B ⊗̂_A O(U)` for a rational `U ∋ x` (Huber96 §1.4, Lem. 1.4.8, p. 63,
proof pp. 63–64). Check: for `B = A`, `b(x) = 0`, take `U = {|b| ≤ |ϖ|}`. Lean: README target.

**Finiteness near a proper fibre (Huber 1.4.6–1.4.7).** (*finite-from-proper-fibre*) If
`f : Spa(B, B⁺) → Spa(A, A⁺)` is of finite type between analytic affinoids, `(A, A⁺) → (B, B⁺)`
topologically of finite type (automatic for `A` strongly noetherian Tate, Zavyalov-Q B.2.17), and
the fibre over `y` is proper, then `f` is finite near `y`; so proper iff finite (Huber96 §1.4, Prop.
1.4.6 and Lem. 1.4.7, p. 62, proof pp. 62–63, citing [Hu4, 3.12.5]). Lean: README target.

**Faithfully flat descent of finiteness (Huber 1.4.9).** (*finiteness-faithfully-flat-descent*) For
`A` complete strongly noetherian Tate, `h : T' → T = Spa(A, A⁺)` finite with `O_{T'}(T')` faithfully
flat, and `f : S → T` locally of finite type: if `S ×_T T' → T'` is finite, so is `f` (Huber96 §1.4,
Lem. 1.4.9 and proof, p. 65; Zavyalov-Q Appendix B.4, Lem. B.4.10, p. 51; Appendix B.3, Lem. B.3.4,
p. 48), the descent carrying the natural topology. Lean: README target.

**Finite base change needs no completion.** (*finite-algebra-tensor-complete*) For finite
`ψ : (A, A⁺) → (B, B⁺)` of complete Tate pairs and continuous `A → C`, `C` complete Tate, the tensor
topology on `B ⊗_A C` is its natural `C`-module topology (Zavyalov-Q Appendix B.3, Lem. B.3.5, p.
48); if `A`, `C` are noetherian or `B` is finite projective, `B ⊗_A C = B ⊗̂_A C`, finite over
`(C, C⁺)` with the integral closure of `C⁺ ⊗ B⁺` (Zavyalov-Q Appendix B.3, Lem. B.3.6 and proof, pp.
48–49; §5.3, footnote 24, p. 36; KL15 §2.2, Lem. 2.2.12(a), p. 32); so for `A` strongly noetherian
or `B` finite projective, `B ⊗_A A⟨f/g⟩ ≅ B⟨ψ(f)/ψ(g)⟩`, the preimage of `R(f/g)` being
`R(ψ(f)/ψ(g))` (Zavyalov-Q Appendix B.3, Cor. B.3.7, p. 49). Check: `A⟨X⟩ ⊗_A C` (not finite) must
be completed to `C⟨X⟩`. Lean: README target.

### R0.14 quasi-finite morphisms

**Locally quasi-finite and quasi-finite morphisms.** (*quasi-finite-morphism*) `f : X → Y` is
locally quasi-finite if it is locally of weakly finite type and each fibre `f⁻¹(y)` is discrete in
the subspace topology of `|X|`, and quasi-finite if it is moreover quasi-compact (Huber96 §1.5, Def.
1.5.1, p. 66); the class contains open embeddings and is stable under composition and under base
change when `f` is locally of finite type or `g` is adic (Huber 1.5.3). Check: a countable disjoint
union of points over `Spa(K, K°)` is locally quasi-finite but not quasi-finite, so "finite fibres"
is the wrong definition. Lean: `AdicSpace.LocallyQuasiFinite`.

**Fibre criteria.** (*quasi-finite-fibre-criteria*) For `f : X → Y` quasi-compact and locally of
weakly finite type between analytic adic spaces, equivalent: (a) `f` quasi-finite; (b) all fibres
finite; (c) fibres over maximal points finite; (d) `k(x)^∧` finite over `k(f(x))^∧` for all `x`; (e)
the same for maximal `x`; (f) `X ×_Y Spa κ(y) → Spa κ(y)` finite for maximal `y` (Huber96 §1.5, Lem.
1.5.2 and proof, p. 66). Lean: (a) ⇔ (b) `LocallyQuasiFinite.iff_finite_fibres`.

**Stalk criterion.** (*quasi-finite-stalk-criterion*) For `f` locally of weakly finite type between
analytic adic spaces, `f` is locally quasi-finite iff `O_{X,x}` is finite over `O_{Y,f(x)}` at every
maximal `x`; if `f` is locally of finite type, iff each maximal `x` has opens `U ∋ x`, `V ⊇ f(U)`
with `f|_U : U → V` finite (Huber96 §1.5, Prop. 1.5.4 and proof, p. 68). Lean: README target.

**Quasi-finite and proper is finite.** (*quasi-finite-and-finiteness-criteria*) For `f` locally of
finite type between analytic adic spaces, `Y` locally noetherian, `f` is finite iff it is
quasi-finite and proper (+weakly finite type, separated, universally closed) (Huber96 §1.5, Prop.
1.5.5 and proof, pp. 68–70). Checks: `{|T| ≤ |ϖ|} ⊆ D` is quasi-finite, not proper; the open disc
`B ⊆ D` is partially proper, not quasi-compact. Lean: `IsFinite.iff_isProper_and_quasiFinite`.

**Partially proper quasi-finite morphisms.** (*partially-proper-quasi-finite-local-finiteness*) For
`f` locally of finite type between analytic adic spaces, `X` quasi-separated, `Y` quasi-compact,
quasi-separated and locally noetherian: `f` is locally quasi-finite and partially proper iff each
`x` has opens `U ⊇ closure{x}`, `V ⊇ closure{f(x)}`, `f(U) ⊆ V`, with `f|_U` finite (Huber96 §1.5,
Prop. 1.5.6 and proof, pp. 70–71). Lean: README target.

### R0.15 continuous differentials

**Continuous differentials.** (*continuous-differentials*) For `φ : A → B` topologically of finite
type between complete Hausdorff Huber rings, `A` of noetherian type (so `B`, `B ⊗̂_A B` are of
noetherian type, ideals closed, finite modules complete Hausdorff), and `I = ker(B ⊗̂_A B → B)`, put
`Ωᶜ_{B/A} := I/I²`, `d(b) = [1 ⊗ b − b ⊗ 1]` (Huber96 §1.6, Def. 1.6.1 and (1.6.2), pp. 76–77).
Prove: (a) `d(N)` generates if `A[N]` is dense, `N` finite; (b) `d` is the universal continuous
`A`-derivation into complete Hausdorff `B`-modules; (c) for a quotient mapping `A⟨X⟩_M → B` with
kernel `𝔞`, `Ωᶜ_{B/A} ≅ (⊕ B dXᵢ)/(dP : P ∈ 𝔞)`; (d) `Ω[B⁄A] ≅ Ωᶜ_{B/A}` for `B` finite over `A`;
functoriality and compatibility with adic base change to a complete noetherian-type `A'` and with
rational localisation (Huber96 Prop. 1.6.3(iii)–(iv), p. 77). Check: `Ωᶜ_{K⟨T⟩/K}` is free on `dT`,
but `Ω[ℚ_p⟨T⟩⁄ℚ_p]` is not finitely generated. Lean: README target.

**First fundamental sequence.** (*first-fundamental-sequence*) For complete Huber rings `A → B → C`,
`A` of noetherian type, `B` topologically of finite type over `A` and `C` over `B`,
`C ⊗_B Ωᶜ_{B/A} → Ωᶜ_{C/A} → Ωᶜ_{C/B} → 0` is exact (Huber96 §1.6, Prop. 1.6.3(i), p. 77). Check:
for `C = B/J` the first map has kernel the image of `J/J²`. Lean: README target.

**Conormal sequence.** (*conormal-sequence*) For `A → B` as above and a closed ideal `J` with
quotient mapping `B → C = B/J`, `J/J² → C ⊗_B Ωᶜ_{B/A} → Ωᶜ_{C/A} → 0`, `j ↦ 1 ⊗ dj`, is exact
(Huber96 §1.6, Prop. 1.6.3(ii), p. 77). Lean: README target.

**Stalks of differentials.** (*quasi-finite-stalk-differentials*) For `f` locally quasi-finite
between locally noetherian analytic adic spaces and maximal `x ↦ y`, `O_{X,x}` is finite over
`O_{Y,y}` and the colimit of `Ωᶜ_{O_X(U)/O_Y(V)}` over affinoid `U ∋ x`, `V ⊇ f(U)` is
`Ω[O_{X,x}⁄O_{Y,y}]`, compatibly with `d` (Huber96 §1.6, Lem. 1.6.4(i), p. 78). Lean: README target.

### R0.16 flat, unramified, smooth and étale morphisms

`Ω_{X/Y}` denotes the modules `Ωᶜ_{O_X(U)/O_Y(V)}` on affinoid charts. Unramified, smooth and étale
are defined by lifting (Huber96 §1.6, Def. 1.6.5, p. 78) against `Spa A` for complete Huber pairs
`(A, A⁺)` (not necessarily sheafy), closed ideals `I` with `I² = 0` and quotient pairs `A/I`.
The Lean predicates take the chart-local form (each point has a chart of `f` with the lifting
property); it agrees with Huber's form by *etale-smooth-locality*, for smooth morphisms between
locally noetherian spaces.

**Flat morphisms.** (*flat-morphism*) `f` is flat if all stalk maps `O_{Y,f(x)} → O_{X,x}` are flat
(Zavyalov-Q Appendix B.4, Def. B.4.1, p. 49); for strongly noetherian Tate affinoids this implies
flatness of `O_Y(Y) → O_X(X)`, with the converse for affinoids topologically of finite type over a
field (Zavyalov-Q B.4.3, B.4.6). Check: the origin `Spa(K, K°) → D` is not flat.
Lean: `AdicSpace.Flat`.

**Unramified morphisms.** (*unramified-morphism*) `f` is unramified if it is locally of finite type
and `Hom_Y(Spa A, X) → Hom_Y(Spa(A/I), X)` is injective (Huber96 §1.6, Def. 1.6.5, p. 78); for
finite maps over a noetherian Tate ring it is `Algebra.FormallyUnramified`. Checks: `S ↦ T²`
(`2 ∈ K^×`) is unramified exactly off the origin; a nonzero closed square-zero quotient `A → A/I`
has unique lifts but no lift of the identity.
Lean: `AdicSpace.Unramified_affinoid`, `AdicSpace.Unramified`.

**Smooth morphisms.** (*smooth-morphism*) `f` is smooth if it is locally of finite presentation and
the restriction is surjective (Huber96 §1.6, Def. 1.6.5, p. 78); for `X`, `Y` locally noetherian the
relative dimension is the locally constant rank of `Ω_{X/Y}` (Huber96 Prop. 1.6.9 and Cor. 1.6.10,
pp. 79–80). Checks: the `n`-polydisc is smooth of relative dimension `n` though
`Algebra.Smooth K K⟨T⟩` fails; the node `T₁T₂ = 0` is not smooth.
Lean: `AdicSpace.Smooth_affinoid`, `AdicSpace.Smooth`.

**Étale morphisms.** (*differentials-unramified-smooth-etale*) `f` is étale if it is locally of
finite presentation and the restriction is bijective (Huber96 §1.6, Def. 1.6.5, p. 78), i.e. smooth
and unramified; for locally noetherian analytic spaces this is "locally an open embedding followed
by finite étale" (AdicEtaleGeometry A1). Checks: `{|T| ≤ |p|} ⊆ Spa(ℚ_p⟨T⟩)` is étale with ring map
not of finite type, so `Algebra.Etale` is the wrong notion; `S ↦ T^p` in characteristic `p` is
finite and flat, not étale. Lean: `AdicSpace.Etale_affinoid`, `AdicSpace.Etale`.

**Open embeddings are étale.** (*open-embedding-etale*) Every open embedding of adic spaces is étale
(Huber96 §1.6, Prop. 1.6.7(i), p. 79, first clause). Lean: `Etale.of_isOpenImmersion`.

**Immersions are unramified.** (*immersion-unramified*) Monomorphisms of pre-adic spaces locally of
finite type, so locally closed embeddings, are unramified (Huber96 §1.6, Prop. 1.6.7(i), p. 79,
second clause, generalised). Lean: closed case `IsClosedImmersion.unramified`.

**Relative polydiscs are smooth.** (*restricted-power-series-smooth*) For complete `(A, A⁺)` and
finite `Mᵢ ⊆ A` with `MᵢA` open, `Spa A⟨X₁,…,Xₙ⟩_M → Spa A` is smooth, of relative dimension `n` if
`A` is of noetherian type (Huber96 §1.6, Prop. 1.6.7(i), p. 79, third clause). Lean: README target.

**Composites.** (*etale-smooth-composition*) Unramified, smooth and étale morphisms are each closed
under composition (Huber96 §1.6, Prop. 1.6.7(ii), p. 79). Check: the origin followed by
`D → Spa(K, K°)` is the identity, so the converse fails. Lean: étale case `Etale.comp`.

**Cancellation.** (*etale-smooth-cancellation*) If `g ∘ f` is unramified, so is `f`; if `g ∘ f` is
smooth (étale) and `g` unramified, `f` is smooth (étale) (Huber96 §1.6, Prop. 1.6.7(iii), p. 79).
Check: the same pair shows `g` unramified is needed. Lean: README target.

**Locality.** (*etale-smooth-locality*) Unramified, étale and smooth are local on the source
(smooth: `X`, `Y` locally noetherian) (Huber96 §1.6, Prop. 1.6.7(v) and Def. 1.6.5(ii), pp. 78–79).
Lean: README target.

**Unramified maps.** (*unramified-locally-quasi-finite*) An unramified, e.g. étale, `f : X → Y` of
locally noetherian spaces is locally quasi-finite (Huber96 §1.7, Cor. 1.7.4, p. 86). Lean: README
target.

**Unramified criteria.** (*infinitesimal-criteria*) For `f` locally of finite type between locally
noetherian spaces, equivalent: (a) unramified; (b) `Ω_{X/Y} = 0`; (c) `Δ_f` is an open embedding;
(d) locally a closed embedding then étale (Huber96 §1.6, Prop. 1.6.8, p. 79). Lean: README target.

**Differentials.** (*smooth-differentials-locally-free*) For smooth `f` of locally noetherian
spaces, `Ω_{X/Y}` is locally finite free (Huber96 §1.6, Prop. 1.6.9(i), p. 79). Lean: README target.

**Jacobian criterion.** (*jacobian-criterion-closed-subspace*) For `Z → Y` smooth between locally
noetherian spaces and `X ⊆ Z` closed with ideal `J`, `X → Y` is étale (smooth) near `x` iff `J` has
local generators whose differentials form a basis (part of a basis) of `Ω_{Z/Y}` (Huber96 §1.6,
Prop. 1.6.9(ii), p. 79). Check: for `a ∈ K^×`, `|a| ≤ 1`, `2 ∈ K^×`, `V(T² − a) ⊆ D` is étale since
`2T` is a unit on it, though not in `K⟨T⟩`. Lean: README target.

**Differential criterion.** (*differential-criterion-morphism*) For `X`, `X'` smooth over `Y`, all
locally noetherian, and a `Y`-map `h : X → X'`, `h` is étale (smooth) near `x` iff
`O_{X,x} ⊗ Ωᶜ_{X'/Y,h(x)} → Ωᶜ_{X/Y,x}` is bijective (split injective) (Huber96 §1.6, Prop.
1.6.9(iii), p. 79). Lean: README target.

**Base change.** (*smooth-etale-base-change*) For `f : X → S` and any `g : Y → S`, with `X ×_S Y`
existing by case (a) of *fibre-products-existence* and, for smooth and étale, `S` as in clause (iv)
of *base-change-stability*, the projection to `Y` is unramified (smooth, étale) if `f` is, of the
same relative dimension when `X`, `Y`, `S` are locally noetherian (Huber96 §1.6, Prop. 1.6.7(iv), p.
79). Check: for non-adic `g`, the étale `Spa(ℚ_p, ℤ_p) → Spa(ℤ_p, ℤ_p)` pulls back along
`Spa ℤ_p⟦T⟧` to the non-quasi-compact open disc over `ℚ_p`. Lean: étale case `Etale.baseChange`.

### R0.17 local structure of étale and smooth morphisms; étale affinoid morphisms over a field

Here `A = (A, A⁺)` is a Huber pair, not necessarily complete, whose completion is of noetherian type
or discrete (Huber's (1.1.1)); `Spa A` means `Spa Â`.

**Finite étale covers.** (*finite-etale-algebra-comparison*) For a complete strongly noetherian Tate
pair `(A, A⁺)`, `C ↦ Spa(C, C⁺)`, `C⁺` the integral closure of `A⁺`, is an equivalence from finite
étale `A`-algebras to spaces finite étale over `Spa(A, A⁺)`, inverse `X ↦ O_X(X)` (Huber96 §1.6, Ex.
1.6.6(ii), pp. 78–79). Lean: affinoid core `Etale.iff_ringHom_etale_of_finite`.

**Algebraically finite type.** (*algebraically-finite-type-ring-map*) For finite `Mᵢ ⊆ A` with `MᵢA`
open, `A[X₁,…,Xₙ]_M` has the topology of `A⟨X⟩_M` and plus ring the integral closure of `A⁺[mXᵢ]`;
`φ : (A, A⁺) → (B, B⁺)` is of algebraically finite type if it factors through a quotient mapping
`A[X]_M → B` (Huber94 §3, before Lem. 3.5, printed p. 534). Prove: this is Huber96 §1.2, Def.
1.2.5(i)–(ii), p. 50; the ring map has finite type and `Â → B̂` topologically finite type; one
finite `L ⊆ B` makes `B⁺` the integral closure of `A⁺[L]` and `A₀[L]` a ring of definition, with
`A·A⁺[L] = B` if `A` is Tate (Rem. 1.2.6(iii)); so are composites and `A → A[1/g]`. Check: for
`(ℤ_p, ℤ_p)`, weight `{p}`, `X` is not in the plus ring: spanning needs Tate. Lean: README target.

**Standard étale presentations.** (*etale-local-structure*) For `s : X → Spa A`, `X` affinoid,
equivalent: (i) `s` is étale; (ii) `X ≅ Spa(B/(f₁,…,fₙ))` over `Spa A` for some `B = A⟨X₁,…,Xₙ⟩_T`
(`Tᵢ` finite, `TᵢA` open) with `det(∂fᵢ/∂Xⱼ)` a unit in `B/(f)`; (iii) the same with `fᵢ ∈ A[X]`
(Huber96 §1.7, Prop. 1.7.1, p. 80); for Tate `A`, `Tᵢ = {1}` (Cor. 1.7.2(ii), p. 85). Check: the
unit is read in `B/(f)`: for `X² − S` it fails over the disc and holds over the annulus. Lean:
`Etale.exists_standardPresentation` ((i) ⇒ (iii), complete base).

**Perturbation.** (*etale-presentation-perturbation*) Given a presentation as in 1.7.1(ii) and a
neighbourhood `V` of `0` in `B/(f)`, some neighbourhood `S` of `0` in `B` ensures: if
`f'ᵢ − fᵢ ∈ S`, the Jacobian of `f'` is a unit in `B/(f')` and some `Spa(B/(f)) ≅ Spa(B/(f'))` over
`Spa A` moves coordinates within `V` (Huber96 §1.7, Cor. 1.7.2(i) and proof, p. 85). Lean: README
target.

**Algebraic models.** (*etale-algebraic-model*) An affinoid `Y → Spa A` is étale iff `Y ≅ Spa B` for
some `A → B` of algebraically finite type whose ring map is `Algebra.Etale` (Huber96 §1.7, Cor.
1.7.3(iii) and its proof, p. 86). Lean: README target.

**Smooth is locally étale over polydiscs.** (*smooth-local-structure*) `f : X → Spa A` is smooth iff
locally it is an étale map to some `Spa A⟨X₁,…,Xₙ⟩_M` followed by the projection, `Mᵢ = {1}` being
possible for Tate `A` (Huber96 §1.6, Cor. 1.6.10 and proof, p. 80). Lean: README target.

**Étale affinoid maps over a field.** (*etale-affinoid-finite-etale-embedding*) For `K` complete
with nontrivial rank-one valuation and `f : Spa(B, B°) → Spa(A, A°)` étale, `A`, `B` `K`-affinoid,
the target has a finite rational cover `(U_j)` and each `f⁻¹(U_j)` a finite cover by `T'` rational
in the source and in a finite étale `Z_j → U_j`, with `f|_{T'}` a rational embedding, a finite étale
map and a rational embedding (dJvdP §3.1, Prop. 3.1.4, p. 20). Lean: README target.

**Étale factorisation.** (*etale-local-open-finite-etale-factorisation*) For `f : X → Y` étale of
analytic affinoids with strongly noetherian Tate rings, each `y` has an open `U` over which `f` is
an open embedding then finite étale (Huber96 §2.2, Lem. 2.2.8 and proof, pp. 116–117),
`U ⊇ closure{y}` rational for maximal `y` (Scholze13 §5, proof of Lem. 5.2). Lean: README target.

**Toric charts.** (*smooth-toric-chart*) For `K` complete of rank one, `V` affinoid smooth over
`Spa(K, K°)`, `x ∈ V`, some rational `U ⊇ closure{x}` maps to the torus `Tⁿ` by a composite of
rational embeddings and finite étale maps (Scholze13 §5, Lem. 5.2, and its proof, p. 28). Lean:
README target.

**Étale is flat and unramified.** (*etale-flat-unramified*) For `f` locally of finite type between
analytic adic spaces, `Y` locally noetherian, equivalent: (a) étale; (b) flat and unramified; (c) at
maximal `x`, `O_{X,x}` is flat over `O_{Y,f(x)}` with fibre a finite separable field extension
(Huber96 §1.7, Prop. 1.7.5 and proof, p. 87). Checks: the origin is not flat; `S ↦ T^p` is not
unramified. Lean: `Etale.iff_flat_and_unramified` ((a) ⇔ (b)).

**Flatness of étale affinoid maps.** (*etale-ring-flatness*) For `X → Spa(A, A⁺)` étale between
affinoids, `A` complete with a noetherian ring of definition or strongly noetherian Tate, the ring
map is flat (Huber96 §1.7, Lem. 1.7.6 and proof, pp. 87–88). Lean: README target.

**Smooth morphisms are open.** (*smooth-morphism-open*) Smooth morphisms to a locally noetherian
`Y`, so also étale ones, are open (Huber96 §1.7, (1.7.7), Prop. 1.7.8 and Lem. 1.7.9, pp. 88–89).
Check: `S ↦ T^p` in characteristic `p` is open, not étale. Lean: `Smooth.isOpenMap`.

### R0.18 supporting results

**The Gauss norm is attained.** (*tate-algebra-gauss-norm-attained*) For `K` complete of rank one
and `f ∈ K⟨X₁,…,Xₙ⟩`, `|f(y)| ≤ ‖f‖_Gauss` on `Max K⟨X⟩` with equality at some point, so the
supremum seminorm is the Gauss norm (Conrad-AWS §1.1, Exercise 1.1.3(3), p. 3). Check: over `ℚ_p`,
`T^p − T` attains `1`, but not at `ℤ_p`-points. Lean: README target.

**Adic homomorphisms and rings of definition.** (*adic-hom-choice-independence*) An adic `φ : A → B`
is bounded; `φ(I)B₀` is an ideal of definition for all rings of definition `A₀`, `B₀` with
`φ(A₀) ⊆ B₀` and ideals of definition `I` of `A₀`; each open `B' ⊇ φ(A₀)` contains such a `B₀`
(Huber93 §1, Lem. 1.8 and proof, p. 459). Lean: README target.

**Analytic locus and adicness.** (*spa-comap-analytic-locus*) For continuous `φ : A → B` with
`φ(A⁺) ⊆ B⁺`, `Spa(φ)` sends non-analytic points to non-analytic ones, and analytic to analytic iff
`φ` is adic, the 'only if' for `B` complete Hausdorff (Wedhorn §7.5, Lem. 7.46(1),(2), p. 68).
Check: `ℤ_p → ℤ_p⟦T⟧` sends the analytic `T`-adic point of `𝔽_p((T))` to a non-analytic one. Lean:
`IsAdicHom.spaComap_analytic`, `isAdicHom_of_spaComap_analytic`.

**Orthogonal bases.** (*banach-countable-type-orthogonal-basis*) For `K` complete nontrivially
nonarchimedean, a `K`-Banach space `E` of countable type has a `t`-orthogonal Schauder basis for
each `0 < t < 1`, so `E ≅ c₀(I, K)` topologically (HK §7, Rem. 7.8, p. 26). Lean: README target.

**Tensor products over a field.** (*banach-completed-tensor-field-exactness*) For Banach modules
over `K` as above, the product seminorm is a cross norm, `V ⊗_K W → V ⊗̂_K W` is injective,
`ker(f) ⊗̂_K X ≅ ker(f ⊗̂ X)` for bounded `f`, and `f ⊗̂ X` is strict if `f` is (KL15 §2.2, Lem.
2.2.9(b), p. 31). Lean: README target.

**Fibre over a point.** (*fibre-over-point*) For `f` locally of weakly finite type and any `y`,
`X_y = X ×_Y Spa κ(y)` exists and projects homeomorphically onto `f⁻¹(G)`, `G` the secondary
generalizations of `y`, residue fields dense (Huber96 §1.2, (1.2.4), pp. 49–50). Lean: README
target.

**Flat quasi-finite base change.** (*flat-quasi-finite-base-change*) Flat locally quasi-finite
morphisms of analytic adic spaces stay flat after base change along `Y' → Y`, `Y'` analytic with
complete stably sheafy charts (Huber96 §1.6, Lem. 1.6.4(ii) and proof, p. 78). Lean: README target.

**Closure of a maximal point.** (*maximal-point-closure-rational*) For `A` Tate and maximal
`x ∈ Spa(A, A⁺)`, `closure{x}` is the intersection of the rational subsets containing it, and of
their closures (Huber96 §1.5, Lem. 1.5.10 and proof, pp. 75–76). Check: false for a type-5 point,
whose rational neighbourhoods contain its rank-one generalisation. Lean: README target.

**Affinoid fields are stably sheafy.** Complete nonarchimedean fields are strongly noetherian Tate,
so stably sheafy (AdicSpaces layers 0.5, 4.1); hence `Spa(K, K⁺)` for these and for discrete `K`, in
particular `Spa κ(y)`, can be the second factor in *fibre-products-existence*. Lean: README target.

**Pro-constructible sets.** A pro-constructible subset of a spectral space is closed iff it is
stable under specialization (Stacks Tag 0903), and images under spectral maps stay
pro-constructible (Stacks Tag 0A2S); Tau Ceti's notion is `TauCeti.IsProConstructible`. Lean:
README target.

**Images.** (*spectral-map-image-proconstructible*) For a quasi-compact spectral map `f : X → Y` of
locally spectral spaces and a pro-constructible `T ⊆ X`, `f(T)` is pro-constructible (Huber96 §1.1,
(1.1.13), p. 44). Lean: README target.

### Examples

The discrete `ℤ[T₁, T₂, …]`, `ℤ_p⟦T⟧` and `ℂ_p` test the two clauses of noetherian type, and the
perfectoid disc `K⟨T^{1/p^∞}⟩` satisfies neither. `ℤ_p → ℚ_p` is adic, `ℤ_p → ℤ_p⟦T⟧` is not. In
`K⟨T⟩/(T²)` the supremum seminorm is not a norm, and `ℚ_p⟨T⟩/(T² − p)` has `|T|_sup = |p|^{1/2}`.
Over `Spa(K, K°)` the closed disc `D` is smooth, separated and quasi-compact but not universally
closed, `P¹` is proper, and the open disc is partially proper but not quasi-compact; `D` with a
doubled origin is not quasi-separated. On `D`, `T ↦ T²` is finite, flat, quasi-finite and
unramified exactly off the origin, `T ↦ ϖT` is étale and not finite, and `T ↦ T^p` in
characteristic `p` is finite and flat but not étale. A nonzero closed square-zero quotient
`A → A/I` is unramified but neither smooth nor étale; a countable disjoint union of points is
locally quasi-finite but not quasi-finite; the torus `(W(κ)[1/p][T^{±1}], W(κ)[T^{±1}])` is of
algebraically finite type.

### Dependencies

From AdicSpaces: Huber rings and strong noetherianness of complete rank-one fields (layer 0), `Spa`
of possibly non-sheafy pairs and its stalks (layers 2–3), completion and stable sheafiness of
strongly noetherian Tate rings (layer 4), adic spaces, open and closed immersions, finite type,
gluing, discs and completed residue fields (layer 5). From Tau Ceti and Mathlib: the suppliers above,
Kähler differentials, flatness, formally unramified, smooth and étale algebras, spectral spaces,
valuation rings and pullbacks. Internally, noetherian type (R0.1) gives closed ideals and sheafiness
(R0.2), hence locally noetherian spaces and the finite-type classes (R0.6) and, with the completed
tensor products of R0.3–R0.5, fibre products (R0.7); these carry closed immersions, properness and
the valuative criteria (R0.8, R0.10–R0.12) and finite and quasi-finite morphisms (R0.13–R0.14);
`K`-affinoid algebras (R0.9) serve the field case; continuous differentials (R0.15) and the lifting
definitions (R0.16) lead to the local structure theory (R0.17); R0.18 collects auxiliary facts.

## Layer R1: analytification and algebraic correspondences

Throughout, `K` is complete for a nontrivial nonarchimedean absolute value of rank one and, in R1.1,
`A` is a `K`-affinoid algebra; `X^ad = X ×_{Spec K} Spa(K, K°)` is the adic analytification.

### R1.1 affinoid subdomains and rigid-analytic spaces

**Plus ring of a `K`-affinoid algebra.** (*tft-plus-ring-power-bounded*) For `A` `K`-affinoid (a Tate
ring with a continuous open surjection `g : K⟨T₁,…,Tₙ⟩ → A`, Wedhorn Definition 5.57), the only ring
of integral elements `A⁺ ⊇ im(K°)` making `(K, K°) → (A, A⁺)` topologically of finite type is `A°`,
the integral closure of `g(K°⟨T⟩)` (*affinoid-power-bounded-integral*), whatever the presentation
(Huber94 §4, Lem. 4.4, p. 543; Wedhorn §7.7, Def. 7.56, p. 71). Checks: for `A = K⟨T⟩` it is `K°⟨T⟩`.
Lean: `Huber.Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType`.

**Affinoid subdomains.** (*affinoid-subdomain*) Let `A` be `K`-affinoid (complete, Hausdorff, `K → A`
strictly topologically of finite type) and `X(f₁,…,fₙ/f₀) = {x ∈ Max A : |f_j(x)| ≤ |f₀(x)|}`.
`U ⊆ Max A` is an affinoid subdomain if `A` is `K`-affinoid and some map of `K`-affinoid algebras
`i : A → A_U` with `Max(i)(Max A_U) ⊆ U` is universal: every `φ : A → B` to a `K`-affinoid algebra
with `Max(φ)(Max B) ⊆ U` factors uniquely through `i`. Prove: `A_U` is unique up to unique
isomorphism; `Max(i)` is a bijection onto `U` preserving residue fields; restrictions `ρ^U_V` are
functorial; `X(f/f₀)`, `f₀,…,fₙ` without common zero, is affinoid with `A_U = A⟨T⟩/(f₀T_j − f_j)`;
`U ∩ U'` and `Max(φ)⁻¹(U)` are affinoid with coordinate rings `A_U ⊗̂_A A_{U'}` and `A_U ⊗̂_A B`
(Conrad-AWS Example 2.4.5, p. 20); subdomains of `Max A_U` are those of `Max A` inside `U`;
`A/mᵏ ≅ A_U/mᵏA_U` for `x ∈ U` with ideal `m`; for rational `U`, `Spa(A_U, A_U°) → Spa(A, A°)` is
`R(f/f₀)`, and `R(f/f₀) ∩ Max A = X(f/f₀)` (KL15 Prop. 2.5.14 in general) (Conrad-AWS §2.2,
Def. 2.2.1, p. 12; KL15 §2.5, Def. 2.5.8, p. 49; Conrad-AWS §2.1, Lem. 2.1.8, p. 11). Checks:
`{|T| ≤ |c|} ⊆ Max K⟨T⟩` (`0 < |c| ≤ 1`) has `A_U ≅ K⟨S⟩`, `T ↦ cS`; the open disc is not an affinoid
subdomain; the `A/mᵏ` isomorphism fails for `x ∉ U` (`x = 1`, `U = {|T| ≤ |ϖ|}`). Lean:
`RigidSpace.rationalDomain`, `RigidSpace.IsCoordinateRing`, `RigidSpace.IsAffinoidSubdomain`,
`IsAffinoidSubdomain.rational`, `IsAffinoidSubdomain.inter`; the rest is a README target.

**Flatness of coordinate rings.** (*affinoid-subdomain-flat*) For an affinoid subdomain `U`,
`A → A_U` is flat; for affinoid subdomains `U_i` covering `Max A`, `A → ∏ A_{U_i}` is faithfully flat
(Conrad-AWS §2.2, discussion after Def. 2.2.1, p. 13; KL15 §2.5, Lem. 2.5.17, p. 51, citing
BGR 7.3.2/6, and Prop. 2.5.18). Checks: `K⟨T⟩ → K⟨S⟩`, `T ↦ ϖS` (the domain `|T| ≤ |ϖ|`) is flat, not
faithfully flat: it misses `T = 1`. Lean: `IsCoordinateRing.flat` (faithful flatness: README target).

**Gerritzen–Grauert.** (*gerritzen-grauert*) For an affinoid subdomain `U ⊆ Max A`, rational
subdomains `V₁,…,Vₙ` induced by a rational covering of `Spa(A, A°)` cover `Max A` with each `U ∩ V_i`
rational in `Max A_{V_i}`; so `U` is a finite union of rational subdomains and canonically open
(Conrad-AWS §2.2, Thm 2.2.5, p. 14; KL15 §2.5, Thm 2.5.11, p. 49, citing BGR 7.3.5/1 and Temkin; KL15
§2.5, Lem. 2.5.10, p. 49). Checks: rational domains need `n = 1`; finite unions of rational
subdomains need not be affinoid (KL15 Thm 2.5.11). Lean:
`IsAffinoidSubdomain.exists_eq_iUnion_rationalDomain` (finite-union form).

**Tate acyclicity.** (*affinoid-covering-tate-acyclicity*) For any `A`-module `M` and affinoid
subdomains `U₁,…,Uₙ` covering `Max A`, the augmented Čech complex
`0 → M → ∏_i M ⊗_A A_{U_i} → ∏_{i<j} M ⊗_A A_{U_i ∩ U_j} → ⋯` is exact; so `U ↦ A_U` is a sheaf with
no higher Čech cohomology on finite affinoid covers, extending uniquely to the Tate topology
(Conrad-AWS §2.3, Thm 2.3.3, p. 17; KL15 §2.5, proof of Thm 2.5.20, p. 52, Thm 2.5.20(a)). Checks:
`0 → A → A⟨f⟩ × A⟨f⁻¹⟩ → A⟨f, f⁻¹⟩ → 0` is exact; `d(s₀, s₁) = s₁|₀₁ − s₀|₀₁`. Lean:
`RigidSpace.tate_acyclicity` (degree `0`, `M = A`).

**Local rings of affinoid spaces.** (*rigid-local-ring-completion*) For `x ∈ Max A` with ideal `m`,
`O_x = colim_{U ∋ x} A_U` is noetherian local with maximal ideal `mO_x`, `A_m → O_x` is faithfully
flat and `A/mᵏ ≅ O_x/mᵏO_x`, so `Â_m ≅ Ô_x` (Conrad-AWS §2.3, after Exercise 2.3.6, p. 17; KL15 §2.5,
proof of Lem. 2.5.12, p. 50; Stacks Tag 05GH (Algebra, Lem. 10.97.5)). Checks: at `0 ∈ Max K⟨T⟩`,
`K[T]_{(T)} ⊊ O_0 ⊊ K⟦T⟧`; for `A = K⟨T⟩/(T²)`, `O_0 = A`. Lean: README target.

**Rigid-analytic spaces.** (*rigid-analytic-space*) `Sp A` is `Max A` with `O_A` and the strong
G-topology: `U` is admissible open if some cover of `U` by affinoid subdomains has, for each
`K`-affinoid `φ : A → B` with `Max(φ)(Max B) ⊆ U`, finitely many members covering its image;
admissible opens admissibly cover their union if each such `φ` pulls them back to a cover of `Max B`
with a finite affinoid refinement. Define locally G-ringed `K`-spaces (local stalks; morphisms pull
back admissible covers and are local); rigid spaces, admissibly covered by affinoid spaces (category
`Rig_K`); admissible opens and covers, open subspaces, gluing under the cocycle condition, fibre
products (via `⊗̂`); closed immersions (an admissible affinoid cover `{U_i}` of the target with
`f⁻¹U_i` affinoid and `O(U_i) → O(f⁻¹U_i)` onto); the closed subspace `V(𝓘)` of a coherent ideal
(every closed immersion is one); separated, quasi-separated and Kiehl-proper (separated,
quasi-compact, relatively compact over an admissible affinoid cover) morphisms. Prove
`Hom(X, Sp A) ≅ Hom_{K-alg}(A, O_X(X))`, functorially (Conrad-AWS §2.2, Def. 2.2.6, p. 14, and
pp. 14–15; §2.3, Def. 2.3.1, p. 16, Thm 2.3.3, p. 17; §2.4, Def. 2.4.1, p. 19, Example 2.4.5; §3.1,
Ex. 3.1.5, p. 24, Def. 3.1.6; Definition 3.2.3; Huber94 §4, p. 541). Checks: `{|T| < 1}`, `{|T| = 1}`
is not an admissible cover of the disc (Conrad-AWS Example 2.2.8); the open disc is admissible
(covered by the `{|T| ≤ |c|^{1/n}}`), unlike in the weak G-topology. Lean: README target.

**Completed local rings at classical points.** (*analytification-completed-local-rings*) For `X`
locally of finite type over `K`, classical `x ∈ X^ad` (`k(x)` finite over `K`), `x₀ = q_X(x)`:
`O_{X^ad,x}` is noetherian and `O_{X,x₀} → O_{X^ad,x}` is local with isomorphic residue fields and
completions, so cotangent spaces and dimensions agree (Conrad-IC Appendix A.1, Lem. A.1.2(1)–(2),
p. 32; Conrad-Adic §3, discussion after Ex. 3.15, p. 16; Huber93 §4, Cor. 4.2, p. 473). Checks: at
the node `y² = x²(x+1)` (`char K ≠ 2`) the completion is not a domain. Lean: README target.

**Rigid analytification.** (*rigid-analytification*) For `X` locally of finite type over `K` there is
a rigid space `X^an` with a morphism of locally G-ringed `K`-spaces `i_X : X^an → X` inducing
`Hom_{Rig_K}(Y, X^an) ≅ Hom_K(Y, X)` for rigid `Y`; it is functorial, `A^{n,an}` is the union of the
polydiscs of radius `|c|^{-j}` (`0 < |c| < 1`), `V(I)^an` is cut out by `I`, `i_X` is bijective onto
closed points, Zariski opens `U` give admissible opens `U^an ≅ i_X⁻¹(U)`, and
`(X ×_Z Y)^an ≅ X^an ×_{Z^an} Y^an` (Conrad-IC Appendix A.1, p. 32, Lem. A.1.2(3) and its proof;
Conrad-AWS §2.4, Ex. 2.4.3, p. 19, Ex. 2.4.6, p. 21). Checks: `Hom(Sp A, (A¹_K)^an) ≅ A`, not the
unit ball of `A`; `(A¹_K)^an` is not quasi-compact. Lean: README target.

**Constructible closures.** (*analytification-constructible-closure*) For `X` locally of finite type
over `K` and `T ⊆ X` locally constructible, `q_X⁻¹(closure T) = closure(q_X⁻¹T)`, so `T` is closed
(open, dense) iff `q_X⁻¹(T)` is (Conrad-IC Appendix A.1, Thm A.1.3(2)–(3), p. 33; Huber93 §4,
Cor. 4.2, p. 473; Stacks Tag 005Z (Topology, Lem. 5.18.7)). Checks: `q⁻¹(G_m) = A^{1,ad} \ {0}` is
open and dense, not closed. Lean: README target.

**Finite locally free quotients.** (*finite-locally-free-quotient*) Let `p : X → Y` be a finite,
surjective, locally free (`p⁻¹V` affinoid with `O(p⁻¹V)` finite projective over `O(V)` for open
affinoid `V`) morphism of adic spaces locally of finite type over `Spa K`. Then `Y` is the
coequaliser of `X ×_Y X ⇉ X` in `Adic^{lft}_K` (Conrad-RA §4.2, Cor. 4.2.5, Thm 4.2.2; Stacks
Tag 023M (Descent, Lem. 35.3.6)). Checks: surjectivity is needed, as `∅ → Spa K` is finite locally
free with coequaliser `∅`; `Spa(K[ε]/(ε²)) → Spa K` has coequaliser `Spa K`. Lean: README target.

### R1.2 Huber's fibre product of a scheme and an adic space

**Affine charts of `X ×_Y S`.** (*affine-chart-analytification*) Let `λ : B → A` with `(A, A⁺)`
complete Huber, `A` with a noetherian ring of definition or strongly noetherian Tate,
`C = B[T₁,…,Tₙ]/I`, `E` a finite set of topologically nilpotent elements with `E·A` open, `E(k)` its
`k`-fold products (`E(0) = {1}`). Let `A(k) = A⟨T⟩_{E(k)}` be Huber's weighted restricted series
(plus ring: integral closure of the series with `ν`-th coefficient in the group generated by
`E(k)^{|ν|}A⁺`), `A_k = A(k)/I·A(k)`, `A_k⁺` the integral closure of the image of `A(k)⁺`,
`R_k = Spa(A_k, A_k⁺)`. Prove: (i) `A_k` is complete with the same noetherian property; (ii) for
`k ≤ h`, `A_h → A_k` maps `R_k` isomorphically onto `{|eTᵢ| ≤ 1 : e ∈ E(k)} ⊆ R_h`; (iii)
`R = ⋃_k R_k` with `p : R → Spa(A, A⁺)`, `q : R_ → Spec C` gives
`Hom_{Spa(A,A⁺)}(Spa(D, D⁺), R) ≅ Hom_B(C, D)`, `w ↦ q ∘ w_`, for complete `D`; nothing depends on
`E` (for Tate `A`, `E = {ϖ}`) (Huber94 §3, proof of Prop. 3.8, p. 537; Hübner §10, proof of
Prop. 10.2, p. 46; Wedhorn §8.7, proof of Prop. and Def. 8.61, p. 91). Checks: for `A = B = K`,
`C = K[T]`, `R_k` is the disc `|T| ≤ |ϖ|^{-k}` (Hübner Example 4.3) and `T = ϖ^{-3}` lies in `R_3`,
not `R_2`; for `C = K[T]/(T²)` the plus ring is `K° + Kε`. Lean: README target.

**Huber's fibre product.** (*scheme-fibre-product-analytification*) Let `f : X → Y` be locally of
finite type, `S` an adic space covered by open affinoids `Spa(A, A⁺)`, `A` complete and stably sheafy
(Wedhorn §8.7, Proposition and Definition 8.61, p. 91; e.g. `S` locally noetherian), and `g : S_ → Y`
a morphism of locally ringed spaces. There are an adic space `R = X ×_Y S`, an adic `p : R → S` and a
locally ringed `q : R_ → X` with `g ∘ p_ = f ∘ q`, such that for adic `u : U → S` and locally ringed
`v : U_ → X` with `g ∘ u_ = f ∘ v` a unique adic `w : U → R` has `p ∘ w = u`, `q ∘ w_ = v`. Moreover
`p` is locally of finite type; `R` has stably sheafy charts (locally noetherian if `S` is);
`p⁻¹(Spa(A, A⁺)) ∩ q⁻¹(Spec C) = ⋃_k R_k`; the construction is functorial in `X`, unique up to unique
isomorphism, has `X' ×_Y S ≅ q⁻¹(X')` for open `X' ⊆ X`, and `X ×_Y S ≅ X ×_{X'} (X' ×_Y S)` and
`(X ×_Y S) ×_S S' ≅ X ×_Y S'` for stably sheafy `S' → S` (Huber94 §3, Prop. 3.8, p. 536; Huber96
§1.2, (1.2.7), p. 50; Hübner §10, Prop. 10.2, p. 44; Wedhorn §8.7, Remark 8.62, p. 92). Checks: for
`X = A¹_K`, `S = Spa(K, K°)`, maps `Spa(D, D⁺) → R` are elements of `D`, not `D⁺`, so the unit disc
alone fails (`T ↦ ϖ^{-1}`). Lean: README target.

**Points.** (*analytification-points*) (i) For `x ∈ X`, `s ∈ S` with `f(x) = g(s)` some `r ∈ X ×_Y S`
has `q(r) = x`, `p(r) = s`; so `q_X` is surjective. (ii) For `X` locally of finite type over `K`,
`q_X` maps the classical points (`k(x)` finite over `K`) bijectively onto the closed points, the
fibre over a closed `x₀` is one point, and `k(x₀) ≅ k(x)`. (iii) Over the generic point of a
component of dimension `≥ 1` the fibre is infinite, so `q_X` is not injective if `dim X ≥ 1` (Huber94
§3, Lem. 3.9(ii), p. 537; Wedhorn §8.7, Prop. 8.63, p. 92; Conrad-AWS §2.4, Ex. 2.4.6; Wedhorn §7.7,
Ex. 7.58, p. 72). Checks: the Gauss point and a rank-two specialisation of it lie over the generic
point of `A¹_K`; `Spec K[T]/(T²)` has bijective `q`. Lean: README target.

### R1.3 the analytification functor over `K`

**Adic analytification.** (*analytification-functor*) Let `Spa K = Spa(K, K°)` (one point; only that
`K` is a complete strongly noetherian Tate field is used), `c_K : (Spa K)_ → Spec K` the identity.
For `X` locally of finite type over `K` (not necessarily separated or quasi-compact),
`X^ad := X ×_{Spec K} Spa K` with `q_X : X^ad_ → X`, a functor `Sch^{lft}_K → Adic^{lft}_K` with `q`
natural. For `X = Spec K[T]/I`, `X^ad = ⋃_k Spa(A_k, A_k°)`, `A_k = K⟨ϖ^kT⟩/I`, glued along
`{|ϖ^kTᵢ| ≤ 1}`, independently of `ϖ` and the presentation. Prove `(Spec K)^ad ≅ Spa K`,
`U^ad ≅ q_X⁻¹(U)` for open `U`, `(X ×_K L)^ad ≅ X^ad ×_{Spa K} Spa(L, L°)` for every complete
rank-one `L/K`, and that `X^ad` is locally noetherian (Wedhorn §8.7, Def. 8.64, p. 92; Hübner §10,
Def. 10.3, p. 46; Huber94 §4, Rem. 4.6(i), p. 543; Huber96 §1.7, Cor. 1.7.3, pp. 85–86). Checks:
`(Spec L)^ad` is one point for finite `L/K`; `(A¹_K)^ad` is not affinoid. Lean: README target.

**Universal property of `X^ad`.** (*analytification-universal-property*) For every adic space `Y`
over `Spa K`, `w ↦ q_X ∘ w_` is a bijection `Hom_{Spa K}(Y, X^ad) ≅ Hom_{LRS/Spec K}(Y_, X)`, natural
in `Y` and `X` (Zavyalov24 §6, Def. 6.1, p. 12, Rem. 6.2, p. 13; Conrad-AWS §2.4, Ex. 2.4.6;
Conrad-MR §1.3, p. 2; Stacks Tag 01I1 (Schemes, Lem. 26.6.4)). Checks: for `Y = Spa(D, D⁺)`, `D`
complete, and `X = Spec C` the Hom set is `X(D)`; `(A¹_K)^ad` represents `Y ↦ O_Y(Y)`, the closed
unit disc `Y ↦ O⁺_Y(Y)` (Berkeley Lecture 4). Lean: README target.

**The adic affine space.** (*analytic-affine-space*) For `n ≥ 1`: (i) `A^{n,ad}_K = ⋃_k D_k`,
`D_k = Spa(K⟨ϖ^kT⟩, K°⟨ϖ^kT⟩)`, with `D_k = {|ϖ^kTᵢ| ≤ 1} ⊆ D_{k+1}`, `D_0` the unit polydisc; (ii)
it is not quasi-compact; (iii) `O(A^{n,ad}_K) = lim_k K⟨ϖ^kT⟩`, the series with `|a_ν|r^{|ν|} → 0`
for all `r > 0`, properly containing `K[T]` (for `n = 0` both are `K`); (iv) it represents
`Y ↦ O_Y(Y)^n`; nothing depends on `ϖ` (Hübner §4, Ex. 4.3, pp. 16–17; Berkeley Lecture 4, p. 27,
p. 28; Conrad-AWS §2.4, Ex. 2.4.3). Checks: `T = ϖ^{-2}` lies in `D_2 \ D_1`; the closure of `D_0`
contains the rank-two point above the Gauss point with `|T| > 1`. Lean: README target.

**Surjectivity.** (*analytification-surjective*) For `h : X₁ → X₂` locally of finite type over `Y`
and `S → Y` as in *scheme-fibre-product-analytification*, `h` surjective implies `h_S` surjective;
for `K`-schemes, `h` is surjective iff `h^ad` is (Huber94 §3, Lem. 3.9(ii), p. 537; Conrad-RA §2.2,
Ex. 2.2.11). Checks: `G_m → A¹` analytifies to a map missing `0`. Lean: README target.

### R1.4 compatibilities

**Open and closed immersions.** (*analytification-immersions*) For `X` locally of finite type over
`K`: (i) an open immersion `j : U → X` gives an open embedding onto `q_X⁻¹(j(U))`; (ii) a closed
immersion `i : Z → X` with ideal `I` gives a closed embedding onto `q_X⁻¹(i(Z))`, identifying `Z^ad`
with the closed adic subspace of `I·O_{X^ad}` (on charts `Spa(A_k/IA_k, (A_k/IA_k)°)`); (iii)
immersions give locally closed embeddings; (i)–(ii) hold for `X ×_Y S → X' ×_Y S` (Conrad-RA §2.2,
Ex. 2.2.11; Zavyalov24 §6, Ex. 6.5, p. 13; Huber96 §1.4, (1.4.1), pp. 60–61). Checks: `V(T)` gives
the point `0`, `D(T)` gives `A^{1,ad} \ {0}`. Lean: README target.

**Fibre products.** (*analytification-fibre-products*) For `X → Z ← Y` locally of finite type over
`K`, `(X ×_Z Y)^ad → X^ad ×_{Z^ad} Y^ad` is an isomorphism (the right side exists by
*fibre-products-existence*), so `(·)^ad` preserves finite products; relatively,
`(X₁ ×_{X₂} X₃) ×_Y S ≅ (X₁ ×_Y S) ×_{X₂ ×_Y S} (X₃ ×_Y S)` (Conrad-IC Appendix A.1, Lem. A.1.2(3),
p. 32; Stacks Tag 01I4 (Schemes, Lem. 26.6.7) and Tag 01JN (Schemes, Rem. 26.16.2); Huber96 §1.1,
(1.1.11), p. 43). Checks: `(T ↦ T²)^ad` has two points over `1` (`char K ≠ 2`). Lean: README target.

**Finite morphisms.** (*analytification-finite*) Let `f : X → Y` be finite, `S → Y` as in
*scheme-fibre-product-analytification*. Over an open affinoid `Spa(A, A⁺) ⊆ S` over `Spec B ⊆ Y` with
`f⁻¹(Spec B) = Spec C`, `X ×_Y S` is `Spa(C ⊗_B A, (C ⊗_B A)⁺)` (module topology, plus ring the
integral closure of the image of `A⁺`), so `p` is finite; if `f` is finite locally free of rank `d`,
`C ⊗_B A` is finite projective of rank `d`. Hence the same for `f^ad` (Conrad-IC Appendix A.2, proof
of Thm A.2.1, p. 34, Thm A.2.1(2), p. 33; Huber96 §1.4, Lem. 1.4.5, pp. 61–62, and proof of
Lem. 1.4.5(i), p. 62). Checks: for `T ↦ T²` the preimage of `|T| ≤ |ϖ|^{-2k}` is `|S| ≤ |ϖ|^{-k}`;
`G_m → A¹` (not finite) has non-affinoid preimage of the unit disc. Lean: README target.

**Flatness of `q_X`.** (*analytification-map-flat*) For `X` locally of finite type over `K` and every
point `x ∈ X^ad`, `O_{X,q_X(x)} → O_{X^ad,x}` is flat; so is `X ×_{Spec A} S → X` for a strongly
noetherian Tate affinoid `S = Spa(A, A⁺)` (Zavyalov24 §6, Lem. 6.7, p. 14; Conrad-IC Appendix A.1,
proof of Lem. A.1.2, p. 32). The charts `K[T] → K⟨ϖ^kT⟩` are flat, as are those over Tate rings with
noetherian rings of definition (strongly noetherian case: *restricted-series-flat-over-polynomials*).
Checks: at the Gauss point `O_{X^ad,x}` is a field over `K(T)`. Lean: README target.

**Analytified modules.** (*analytification-of-modules*) Let `A` be a complete sheafy affinoid with
stably sheafy charts (e.g. `K`), `X` locally of finite type over `Spec A`, and
`F^ad := q_X^*F = O_{X^ad} ⊗_{q_X⁻¹O_X} q_X⁻¹F`. Prove `(O_X)^ad ≅ O_{X^ad}`,
`(F^ad)_x ≅ O_{X^ad,x} ⊗ F_{q(x)}`, `(F ⊗ G)^ad ≅ F^ad ⊗ G^ad` and `(h^*G)^ad ≅ (h^ad)^*G^ad`; for
strongly noetherian Tate `A` also: `F ↦ F^ad` is exact; for a submodule `I ⊆ O_X`, `I^ad → O_{X^ad}`
is injective with image `I·O_{X^ad}` (no quasi-coherence); a closed immersion with ideal `I` gives an
exact `0 → I^ad → O_{X^ad} → i^ad_*O_{Z^ad} → 0`; on an affinoid chart `Spa(B, B⁺)` of `(Spec C)^ad`,
`(M̃)^ad` has sections `B ⊗_C M` for all `C`-modules `M` (Conrad-IC Appendix A.1, Lem. A.1.2(4),
p. 32; Zavyalov24 §6, Lem. 6.9, p. 15, Cor. 6.8; §4, Lem. 4.3(2), Thm 4.2(2); Stacks, §6.26,
Definition 6.26.1 and Lemma 6.26.3, Lemma 6.29.1). Coherence: Part III, layer R3. Checks:
`(O_{A¹}/(T))^ad` is the skyscraper `K` at `0`; `q_X⁻¹F` fails (`q_X⁻¹O_X ≠ O_{X^ad}`); exactness
fails over arbitrary `Y` (`X = Y = A¹_K`, `S = Spa K` at `0`). Lean: README target.

**Continuous differentials of the charts.** (*analytic-kahler-differentials*) Let `h : X → Y` be
locally of finite type over `B₀`, `S → B₀` as in *scheme-fibre-product-analytification*,
`Spec C ⊆ X`, `Spec B' ⊆ Y` affine with `C = B'[T]/I`, and `A_k` the charts of `X_S` over an affinoid
`Spa(A', A'⁺) ⊆ Y_S` (complete, noetherian type) above `Spec B'`. Then
`A_k ⊗_C Ω_{C/B'} → Ωᶜ_{A_k/A'}`, `1 ⊗ dc ↦ dc`, is an isomorphism of finite `A_k`-modules,
compatible with `A_h → A_k`, rational localisation and shrinking; the gluing
`Ω¹_{X_S/Y_S} ≅ (Ω_{X/Y})^ad` is in Part III, layer R3 (Zavyalov24 §5, proof of Lem. 5.9, p. 11;
Huber96 §1.6, before Prop. 1.6.7, p. 79; Huber96 (1.6.2)(i), p. 76; Prop. 1.6.3(iv), p. 77). Checks:
`S₁ ↦ T₁ + T₂²`, `S₂ ↦ T₂` gives `dT₁ + 2T₂dT₂`, `dT₂`, of determinant `1` in every characteristic;
the smooth `y² = x³ + ax + b` (`char K ≠ 2`) has invertible `Ω`. Lean: README target.

**Étale, smooth and unramified morphisms.** (*analytification-etale-smooth*) For `h : X₁ → X₂`
locally of finite type over `Y` and `S → Y` as in *scheme-fibre-product-analytification*, `h` étale
(smooth, unramified) implies `h_S` étale (smooth, unramified) in the sense of Huber96
Definition 1.6.5; so `h^ad` inherits these, and smooth `X` of pure dimension `d` has `X^ad` smooth
with `Ωᶜ_{O(U)/K}` finite projective of rank `d` on each chart (Huber96 §1.7, Prop. 1.7.1, p. 80,
Cor. 1.7.3, pp. 85–86; Conrad-IC Appendix A.2, Thm A.2.1(1), p. 33). Checks: `K[X]_{P'}/(P)` over
`{|X| ≤ |ϖ|^{-k}}` becomes `K⟨ϖ^kX⟩/(P)`, the roots of `P` in that disc; `T ↦ T²` (`char K ≠ 2`)
analytifies to a map étale exactly away from `0`. Lean: README target.

### R1.5 local rings, constructible sets, connectedness

**Connectedness of `X^ad`.** (*analytification-connected*) For `K` complete of rank one and `X` a
`K`-scheme locally of finite type, `T ↦ q_X⁻¹(T)` identifies the open and closed subsets of `X` and
`X^ad`, so `X` is connected iff `X^ad` is. Checks: `A^{1,ad}_K` is connected and locally connected
(Zavyalov24 Lemma 2.2), its classical points totally disconnected. Lean: README target.

**Relative analytification over an adic base.** Adic spaces map to locally ringed spaces, keeping
sheaves and stalk maps. For `f : X → Y` locally of finite type and an adic space `S` with stably
sheafy charts and a morphism of locally ringed spaces `S → Y`, Huber's fibre product `X ×_Y S` is
universal for adic spaces with compatible maps to `X` and `S` (Huber94, Prop. 3.8, p. 536; Wedhorn
§8.7, Prop. and Def. 8.61, p. 91); along `Spa A → Spec A` (a point goes to its support) it is the
analytification over `A`, and over `Spa(K, K°)` it preserves finite products. Modules are
analytified by sheafified extension of scalars along `X ×_Y S → X`, with stalks the extension of
scalars along local rings; over a strongly noetherian Tate base the projection is flat, so this is
exact and preserves monomorphisms of ideal sheaves (Huber94, Prop. 3.11). Lean: README target.

### R1.6 separatedness and properness

**Analytified projective space is proper.** (*analytic-projective-space-proper*) For `K` complete of
rank one and `n ≥ 0`, `(P^n_K)^ad → Spa(K, K°)` is proper, covered by the closed polydiscs
`D_i = {|T_j| ≤ |T_i| ∀ j}`, and so is `(P^n_Y)^ad ≅ (P^n_K)^ad ×_{Spa K} Y^ad → Y^ad` for `Y`
locally of finite type over `K`. For a scheme `Y` and an analytic adic space `S` satisfying Huber's
condition with `S → Y`, `P^n_Y ×_Y S → S` is proper, covered over an affinoid `Spa(A, A⁺) ⊆ S` by
the `Spa(A⟨T_j/T_i⟩, A⟨T_j/T_i⟩⁺)`, with plus ring the integral closure of `A⁺⟨T_j/T_i⟩`; over a
strongly noetherian Tate affinoid `A`, `Proj B ×_{Spec A} Spa A → Spa A` is proper for `ℕ`-graded
`B` of finite type over `B_0 = A` (Huber96 Prop. 1.3.17; Conrad-AWS §3.2, Ex. 3.2.5; Hübner §4, Ex.
4.5, p. 19; Conrad-RA §2.3, Ex. 2.3.11). Checks: `O(P^{1,ad}_K) = K`. Lean: README target.

**Separatedness and properness of `f^ad`.** (*analytification-separated-proper*) For `K` complete of
rank one and `f : X → Y` a morphism of `K`-schemes locally of finite type: (i) `f` is separated iff
`f^ad` is; (ii) if `f` is proper so is `f^ad`; (iii) if `f` is of finite type and `f^ad` is proper,
`f` is proper; (ii′) for a proper morphism of schemes `X → Y` and an analytic adic space `S`
satisfying Huber's condition with `S → Y`, `X ×_Y S → S` is proper, and the forward half of (i)
holds likewise (Conrad-RA App. A.1, p. 38; Conrad-MR §1.3, p. 2; Zavyalov24 §6, Rem. 6.3, p. 13,
citing Huber96 Lem. 5.7.3; Stacks Tag 03GN). Checks: `⨆_{m≥0} Spec K → A¹_K`, `m ↦ ϖ^{-m}`, is not
proper, yet its analytification is a closed embedding, hence proper. Lean: README target.

**Finite maps and closed immersions.** (*analytification-reflects-finite-closed-immersion*) For `K`
complete of rank one and `f : X → Y` of finite type between `K`-schemes locally of finite type, `f`
is finite, resp. a closed immersion, iff `f^ad` is finite, resp. a closed embedding (Conrad-IC App.
A.2, Thm A.2.1(2), p. 33; Stacks Tag 02OG; Huber96 §1.4, Lem. 1.4.5, pp. 61–62). Checks: the
normalisation `A¹ → V(y² − x³)` is finite, bijective, but a closed immersion on neither side. Lean:
README target.

**Étaleness and smoothness of `f^ad`.** (*analytification-reflects-etale-smooth*) For `K` complete
of rank one and `f : X → Y` a morphism of `K`-schemes locally of finite type, `f` is étale (smooth,
unramified) iff `f^ad` is so in the sense of Huber96 Def. 1.6.5 (Conrad-IC App. A.2, Thm A.2.1(1),
p. 33; Stacks Tag 01V9; Huber96 §1.7, Prop. 1.7.5, p. 87). Checks: in characteristic `p`, `T ↦ T^p`
on `A¹` is flat but étale on neither side. Lean: README target.

### R1.7 rigid–adic comparison

**Huber's functor `r_K`.** (*rigid-adic-comparison-functor*) For `K` complete of rank one and rigid
spaces as in *rigid-analytic-space* (Conrad-AWS Def. 2.4.1, p. 19), construct
`r_K : Rig_K → Adic^{lft}_K` with natural locally coherent maps of ringed sites
`ρ_X : (|r_K X|, O) → (X, O_X)` over `Sp K`, bijective on sections, final: each locally coherent
`λ : (|Z|, O_Z) → (X, O_X)` over `Sp K`, `Z` locally of finite type over `Spa(K, K°)`, is `ρ_X ∘ f`
for a unique `f : Z → r_K X` over `Spa K` (Huber94 §4, Prop. 4.3, pp. 541–542); local coherence:
over an affinoid admissible `U`, quasi-compact opens in `λ(U)` meet `λ(V)` quasi-compactly for
quasi-compact admissible `V ⊆ U`. Moreover (Huber96 (1.1.11), (1.4.1)): (a)
`r_K(Sp A) = Spa(A, A°)`, and `r_K` is the algebra map on affinoid maps and global sections (Huber94
§4, proof of Prop. 4.3, p. 542); (b) open immersions go to open embeddings, preserving
intersections; (c) admissible opens cover admissibly iff their images cover (Conrad-Adic §3, Ex.
3.15, p. 16); (d) points of `X` are the classical points of `r_K X`, with `r_K U ∩ X = U`, and for
quasi-separated `X` (equivalently `r_K X`), `U ↦ r_K U` is an order isomorphism of quasi-compact
opens matching affinoids; (e) `r_K` preserves fibre products, affinoid-locally
`Spa(B ⊗̂_A C, (B ⊗̂_A C)°)` (Huber96 §1.1, (1.1.11), pp. 42–43); (f) `f` is a closed immersion iff
`r_K f` is a closed embedding (Huber96 §1.4, (1.4.1), p. 60); rational subsets of `Spa(A, A°)` and
of `Max A` match (Huber93 §4, after Cor. 4.3, p. 473). Checks: `{|T| < 1}`, `{|T| = 1}` cover the
disc as sets, not admissibly: their images miss a rank-two point below the Gauss point. Lean: README
target.

**`r_K` is fully faithful.** (*rigid-adic-quasi-separated-equivalence*) For `K` complete of rank
one: (i) `r_K` is fully faithful; (ii) adic spaces locally of finite type over `Spa(K, K°)` form the
smallest full subcategory containing its image and closed under open subspaces, open covers and
isomorphism; (iii) `r_K` is an equivalence between quasi-separated rigid spaces and quasi-separated
adic spaces locally of finite type over `Spa(K, K°)`, also over a rigid base `X` and `r_K X`; (iv)
`r_K X` is affinoid iff `X` is (Huber94 §4, Prop. 4.5(ii)–(v) and its proof, p. 543; Huber96 §1.1,
(1.1.11), pp. 42–43). Checks: for `K` algebraically closed, two discs `D` glued along
`D ∖ closure{η}`, `η` the Gauss point, are not in the image of `r_K`. Lean: README target.

**The rigid and adic topoi agree.** (*rigid-adic-topos-equivalence*) For `K` complete of rank one
and `X` a rigid space, `ρ_X` induces an equivalence of ringed topoi
`(Shv(r_K X), O) ≃ (Shv(X), O_X)` (Huber94 §4, Prop. 4.5(i), p. 543); for `Sp A`, sheaves on the
rational-subdomain topology of `Max A` are sheaves on `Spa(A, A°)` (Huber93 §4, Cor. 4.4, p. 473).
Checks: on `Sp K⟨T⟩` the sheaf matching the skyscraper at the Gauss point is nonzero with all
classical stalks zero. Lean: README target.

**`r_K(X^an) ≅ X^ad`.** (*rigid-analytification-comparison*) For `K` complete of rank one and `X` a
`K`-scheme locally of finite type (not necessarily separated), there is a unique isomorphism
`e_X : r_K(X^an) ≅ X^ad` over `Spa(K, K°)` with `q_X ∘ e_X = i_X ∘ ρ_{X^an}` as maps of ringed
sites, natural in `X` and compatible with the fibre-product isomorphisms of
*analytification-fibre-products* and of `r_K` (Huber94 §4, Rem. 4.6(i), p. 543; Wedhorn §10, Rem.
10.1, p. 103). Checks: `r_K((A¹)^an) = ⋃_k Spa(K⟨ϖ^k T⟩, K°⟨ϖ^k T⟩)`; the translation `T ↦ T + 1`
changes `q_X`, so the compatibility pins `e_X`. Lean: README target.

**Rigid versus adic properness.** (*proper-separated-comparisons*) For `K` complete of rank one, a
morphism `f : X → Y` of rigid spaces is partially proper if separated and `Y` has an admissible
affinoid covering `(Y_i)` with each `f⁻¹(Y_i)` admissibly covered by affinoids `U_ij ⋐_{Y_i} V_ij`
(`V_ij ⊆ f⁻¹(Y_i)` affinoid, with affinoid generators `a_l` of `O(V_ij)` over `O(Y_i)` such that
`|a_l| < 1` on `U_ij`; Huber96 Rem. 1.3.19(i), p. 59). Prove that Kiehl properness (the same with
finite coverings) is quasi-compactness plus partial properness, and: (i) `f` is separated iff
`r_K f` is; (ii)–(iii) if `f` is partially proper (proper), so is `r_K f`, with converses if `K°` is
discretely valued and (iv) for any `K` if `f` is locally quasi-finite (Huber96 §1.5, Lem. 1.5.9, pp.
73–75; §1.3, Rem. 1.3.19, pp. 59–60, citing [Hu4, 3.11.21] and [L1]; Conrad-AWS §3.2, Ex. 3.2.5).
Checks: the open unit disc in the closed one is partially proper, not proper. Lean: README target.

**Étale, unramified and smooth: rigid versus adic.** (*rigid-adic-etale-comparison*) Let `K` be
complete of rank one and `f : Y → X` a morphism of rigid spaces; `f` is rigid unramified if every
`O_{X,f(y)} → O_{Y,y}` is unramified (`m_{f(y)}` generates the maximal ideal, finite separable
residue extension), rigid étale if these maps are moreover flat (Huber96 Def. 1.7.10(i); on
affinoids `Ω^f_{B/A} = 0`, plus `A → B` flat for étale, dJvdP §3.1, Obs. 3.1.1, p. 19), and rigid
smooth if `Y` has an admissible affinoid covering by `V` over affinoids `W` with rigid-étale
`V → W ×_{Sp K} 𝔹^n` over `W` (`n ≥ 0` varying; Huber's Def. 1.7.10(ii)). Rigid étale maps contain
open immersions and are stable under composition and base change (Huber96 Props 1.6.7, 1.7.11).
Prove that `r_K f` is étale, unramified, smooth iff `f` is rigid étale, unramified, smooth, with no
quasi-compactness or quasi-separatedness (Huber96 §1.7, Def. 1.7.10, Prop. 1.7.11, p. 89; the
unramified case from Huber96 1.6.8 and dJvdP §3.1, cf. DLLZ-A §3.2, Rem. 3.2.15). Checks:
`Sp K → Sp K⟨T⟩`, `T ↦ 0`, is unramified but not flat on both sides, so the unramified case is not
implied by the étale one. Lean: README target.

### R1.8 analytic groups and invariant differentials

**Analytic groups.** (*analytification-group-objects*) For `K` complete of rank one, `(·)^ad`
preserves finite products of schemes and of adic spaces locally of finite type over `K` and
`Spa(K, K°)` (Huber94 Prop. 3.8; Huber96 (1.1.11)), so sends group schemes `(G, m, e, i)`
(commutative ones, homomorphisms) to analytic groups `G^ad` with operations `m^ad`, `e^ad`, `i^ad`;
relatively, `G ×_Y S` is a group over `S` for `G → Y` locally of finite type and `S → Y`, `S` with
stably sheafy charts (Wedhorn §8.7, Prop. 8.61, Rem. 8.62, pp. 91–92). Then (a)
`Hom(Spa(D, D⁺), G^ad) ≅ G(D)` as groups for affinoid `(D, D⁺)` over `(K, K°)`; (b) `G` finite
locally free of rank `d` over `Y` gives `G^ad → Y^ad` finite, affinoid-locally finite projective of
rank `d`; (c) for an abelian variety `A`, `A^ad` is commutative, connected, proper and smooth of
dimension `dim A` (Conrad-IC §2.3, Thm 2.3.1, pp. 16–17; App. A.1, p. 33); (d)
`ker(φ^ad) ≅ (ker φ)^ad` for homomorphisms `φ`, and isogenies analytify to finite surjective ones
(Conrad-MR §2, pp. 10–11; §3.2, Thm 3.2.3, p. 20). Checks: the unit circle is an open subgroup of
`G_m^ad` not of algebraic origin; for `char K = p`, `α_p^ad` is finite flat, non-reduced and not
étale. Lean: README target.

**Quotients by finite locally free kernels.** (*analytification-finite-quotient*) Let `π : A → B` be
a finite locally free surjective homomorphism of group schemes locally of finite type over `K`, with
kernel `G` (e.g. `E → E/C`, ModularCurves layer 2B, or an abelian variety modulo a finite locally
free subgroup, Stacks Tag 07S7, Lemma 66.14.2). Then `π^ad` is finite locally free and surjective
with kernel `G^ad`, `(a, g) ↦ (a, a·g)` is an isomorphism
`A^ad ×_{Spa K} G^ad ≅ A^ad ×_{B^ad} A^ad`, and for `Z` locally of finite type over `Spa K`,
`Hom(B^ad, Z)` is the set of right-`G^ad`-invariant `A^ad → Z` (Wedhorn Prop. 8.61; Conrad-RA §4.2,
Cor. 4.2.5, p. 33; Conrad-MR §2, p. 11). Checks: for `char K = p`, `[p]` on `G_m` has non-reduced
kernel `μ_p` and zero differential, yet is finite locally free of rank `p`. Lean: README target.

**Invariant differentials.** (*analytic-invariant-differentials*) For `K` complete of rank one, `Y`
a `K`-scheme locally of finite type and `(G, m, e, i)` a group scheme over `Y`, locally of finite
type with structure map `f`, let `ω_{G/Y} = e^*Ω¹_{G/Y}` and
`ω_{G^ad/Y^ad} = (e^ad)^*Ω¹_{G^ad/Y^ad}`. Prove `ω_{G^ad/Y^ad} ≅ (ω_{G/Y})^ad`, natural in
homomorphisms and base change in `Y`; `Ω¹_{G^ad/Y^ad} ≅ (f^ad)^*ω_{G^ad/Y^ad}`; local freeness of
rank `g` for `G` smooth of relative dimension `g`. For `Y = Spec K` the unit fibre of continuous
differentials is the Zariski cotangent space `m_e/m_e²` (`I/I²` for `G = Spec H`; the dual tangent
space for abelian varieties), where `μ^*db = pr₁^*db + pr₂^*db`, `e^*db = 0`, `[n]^*db = n·db`; for
locally finite-type maps of locally noetherian analytic spaces, algebraic and continuous stalk
differentials agree after tensoring with the residue field (Stacks Tag 047I; Huber96 (1.6.2)(i), p.
76, Prop. 1.6.3, pp. 77–78; Conrad-AWS §2.4, pp. 20–21; BHW §3.3, p. 1730; CHJ §1, p. 4). Checks:
`ω_{G_m^ad} = K·dT/T`, killed by `[p]^*` in characteristic `p`. Lean: README target.

### R1.9 dimension of affinoid domains and the rigid identity principle

**Affinoid integral domains are equidimensional.** (*affinoid-domain-equidimensional*) For `K`
complete of rank one and a `K`-affinoid algebra `A` (a quotient of `T_n(K) = K⟨X_1,…,X_n⟩`) that is
a domain of Krull dimension `d`, every maximal ideal of `A` has height `d`; in particular this holds
for `T_d(K)`, and a finite injective `T_e(K) → A` forces `e = d` (Conrad-IC §2.1, Lem. 2.1.5, p.
12). Checks: in `K⟨X⟩ × K` the maximal ideals have heights 1 and 0, so the domain hypothesis is
needed. Lean: `RigidSpace.height_eq_ringKrullDim_of_isDomain` (`e = d` is a README target).

**Identity principle.** (*rigid-identity-principle*) For `K` complete of rank one, `X` a connected
(no admissible covering by two disjoint nonempty admissible opens) and normal (all `O_{X,x}` normal
domains) rigid space and `U ⊆ X` a nonempty admissible open: (i) the only analytic subset (zero
locus `{x : 𝓘_x ≠ O_{X,x}}` of a coherent ideal sheaf) containing `U` is `X`; (ii) `X` is not a
union of two proper analytic subsets; (iii) a function, or a section of a locally free `O_X`-module
of finite rank, vanishing on `U` is zero (Conrad-IC §2.1, Lem. 2.1.4 and its proof, p. 12; proof of
Thm 2.1.2, p. 10). Affinoid core: `A → A_U` is injective for a `K`-affinoid integral domain `A` and
a nonempty affinoid subdomain `U`. Checks: on `Sp K⟨S, T⟩/(ST)` (not normal) `S ≠ 0` vanishes on
`{|T| ≥ |ϖ|}`; in the connected non-reduced `K⟨T, E⟩/(E², ET)`, `E ≠ 0` dies on `{|T| ≥ |ϖ|}`. Lean:
affinoid core `IsCoordinateRing.injective_algebraMap`.

**Weight families from open ideals.** (*open-ideal-weight-family*) Let `A` be a Huber ring and
`T ⊆ A` a subset, not necessarily finite or bounded, with `T·A` open. Then for all `n` and every
neighbourhood `U` of `0`, the additive group `T^n·U` generated by the `t₁⋯t_n·u` is a neighbourhood
of `0`; hence finite `M_1,…,M_k` with all `M_i·A` open form a weight family
(`TauCeti.Huber.IsWeightFamily`), and for `E·A` open the `k`-fold products from `E` generate the
open ideal `(E·A)^k` (Huber94 §1, Lem. 1.1, p. 516; Wedhorn §6.4, Lem. 6.20, p. 50; §8.5, p. 86).
Checks: in `ℚ_p⟨Y, Z⟩`, `T = {Y}` has `Y·A` not open and the conclusion fails. Lean: README target.

**Valuation extension in the divisible hull.** (*valuation-extension-divisible-hull*) Let
`φ : A → D` make `D` a finitely generated `A`-algebra, `v` a valuation of `A` and `q ⊆ D` a prime
with `φ⁻¹(q) = supp v`. Some valuation `r` of `D` has `supp r = q`, `r ∘ φ` equivalent to `v` and
`Γ_r/Γ_v` torsion (so `Γ_v` is cofinal in `Γ_r`); for fields, a finitely generated `L/K` carries an
extension `w` of `v` with `Γ_w/Γ_v` torsion (Wedhorn §8.7, proof of Prop. 8.63, p. 92; Huber94 §3,
proof of Lem. 3.9(ii), p. 538; Stacks Tag 00IA). Checks: rank-two extensions of the `p`-adic
valuation to `ℚ_p[T]` with `|T|` infinitesimal relative to `|p|` are excluded. Lean: README target.

**Scheme and locally ringed fibre products.** (*scheme-pullback-is-lrs-pullback*) For any morphisms
of schemes `X → Z ← Y`, `X ×_Z Y` is also the fibre product in locally ringed spaces (Stacks Tag
01I4, Lem. 26.6.7; Tag 01JN, Rem. 26.16.2; Tag 01HI, Lem. 26.3.5). Checks: morphisms over `Spec K`
from the locally ringed space of `Spa(K, K°)` to `A²_K` are the pairs in `K²`. Lean: README target.

**Rational refinements on `Max A`.** (*max-rational-covering-refinement*) For `K` complete of rank
one, a `K`-affinoid algebra `A` and rational subdomains `W_j = X(T_j/s_j)` covering `Max A` (`T_j`
finite without common zero, `s_j ∈ T_j`), the set `S` of products `∏_j t_j` (`t_j ∈ T_j`) with some
`t_k = s_k` generates the unit ideal and `X(S/f) ⊆ W_k` when `f` has `t_k = s_k`; so the standard
rational covering `{R(S/f)}` of `Spa(A, A⁺)`, any `A⁺`, refines `(W_j)` on `Max A` (KL15 §2.5, Lem.
2.5.10, p. 49, citing BGR 8.2.2/2; Huber94 §2, proof of Lem. 2.6, p. 531). Checks: `{|T| ≤ |ϖ|}`,
`{|T| ≥ |ϖ|}` on `Max K⟨T⟩` give `S = {ϖ², ϖT, T²}`. Lean: README target.

**Conrad's `Γ`–`Spec` lemma.** (*rigid-gamma-spec*) For `K` complete of rank one, a rigid space `Y`
and a `K`-scheme `X` locally of finite type, let a morphism `Y → X` be a map of sets pulling Zariski
opens and coverings back to admissible ones, with a map `O_X → f_*O_Y` of sheaves of `K`-algebras
(locality not assumed). Such maps send points to closed points with local stalk maps, and for
`X = Spec C` of finite type, global sections give `Hom_K(Y, Spec C) ≅ Hom_{K-alg}(C, O_Y(Y))`,
naturally in `Y` and `C` (Conrad-IC App. A.1, Lem. A.1.1, p. 31; Conrad-AWS §2.3, Ex. 2.3.2, p. 16).
Checks: `Hom_K(Sp A, A^n_K) = Aⁿ`. Lean: README target.

**Constructible density of classical points.** (*classical-points-constructible-density*) For `K`
complete of rank one and a `K`-affinoid algebra `A` with plus ring `A°` only, extending `|·|` to the
finite fields `A/m` embeds `Max A` into `Spa(A, A°)` as the classical points (Huber93 §4, before Thm
4.1, p. 471). Then (i) `L_A = {v ∈ Spv A : v ≤ 1 on A°, v < 1 on A°°}` is the constructible closure
of `Max A` in `Spv A` (Huber93 §4, Thm 4.1, p. 472; Wedhorn §7.7, Ex. 7.58, pp. 72–73); (ii) `Max A`
is constructibly dense in `Spa(A, A°)`, and (iii) constructible sets with the same classical points
are equal (Cor. 4.2, 4.3, p. 473); (iv) `U ↦ U ∩ Max A` is a bijection from rational subsets onto
rational subdomains (*affinoid-subdomain*; Conrad-AWS §2.2, pp. 12–13), preserving inclusions and
finite intersections, and detecting finite covers (after Cor. 4.3, p. 473; Rem. 4.7, p. 474).
Checks: the closed set `{x_{<1}}` below the Gauss point has no classical point, hence is not
constructible. Lean: README target.

**Restricted power series are flat over polynomials.** (*restricted-series-flat-over-polynomials*)
For a complete Hausdorff strongly noetherian Tate ring `A` (no noetherian ring of definition
assumed) and `d ≥ 0`, `A[T_1,…,T_d] → A⟨T_1,…,T_d⟩` is flat (Zavyalov24 §6, proof of Lem. 6.7, p.
14). Checks: `K⟨T⟩` is torsion-free over the principal ideal domain `K[T]`. Lean: README target.

**Affinoid opens over a noetherian-type base.** (*affinoid-over-noetherian-base-tft*) For
`f : X → Y` locally of finite type and any open affinoids `U ⊆ X`, `V ⊆ Y` with `f(U) ⊆ V`, where
`O_Y(V)` has a noetherian ring of definition or is a strongly noetherian Tate ring,
`(O_Y(V), O⁺_Y(V)) → (O_X(U), O⁺_X(U))` is topologically of finite type; so an affinoid `Spa(B, B⁺)`
locally of finite type over `Spa(K, K°)` has `B` `K`-affinoid and `B⁺ = B°` (Huber94 §3, Prop. 3.6,
p. 535; §4, proof of Prop. 4.5, p. 543; Huber96 §1.2, after Def. 1.2.1, p. 47). Checks: `{|T| = 1}`
in the closed disc has ring `K⟨T, S⟩/(TS − 1)`. Lean: README target.

**Connectedness and components of the rigid analytification.** (*rigid-analytification-connected*)
For `K` complete of rank one and `X` a `K`-scheme locally of finite type (neither separated nor
quasi-compact), `X` is connected iff `X^an` has no admissible covering by two disjoint nonempty
admissible opens (the empty space counting as connected); the core case is `X` normal and connected.
More precisely, for the analytic Zariski topology (closed sets the supports of coherent ideals; on
`Sp A` the Zariski topology of `Max A`), `Z ↦ i_X⁻¹(Z)` is a bijection between the irreducible
components of `X` and of `X^an`, the analytified reduced component being the reduced closed subspace
on `i_X⁻¹(Z)` (Conrad-IC §2.3, Thm 2.3.1 and its proof, pp. 16–17; Lem. 2.2.3, Thm 2.2.4, pp. 14–15;
App. A.1, proof of Thm A.1.3, p. 33). Checks: the nodal cubic `y² = x²(x + 1)` (`char K ≠ 2`) stays
irreducible despite two branches at the node. Lean: README target.

### Examples

`{|T| ≤ |c|} ⊆ Max K⟨T⟩` is an affinoid subdomain with ring `K⟨S⟩`, the open disc is not; the
covering `{|T| ≤ |ϖ|}`, `{|T| ≥ |ϖ|}` gives a faithfully flat map and an exact Laurent sequence.
`(A¹_K)^an` and `(A¹_K)^ad` are not quasi-compact; the adic affine line represents `Y ↦ O_Y(Y)` and
the closed disc `Y ↦ O⁺_Y(Y)`, and its Gauss point lies over the generic point. `G_m` analytifies to
the open, dense, non-closed `A^{1,ad} ∖ {0}`, and `T ↦ T²` to a finite locally free map of rank 2,
étale exactly off `0` when `char K ≠ 2`. `P^{1,ad}_K` is proper with `O(P^{1,ad}_K) = K`,
`A^{1,ad}_K` is separated but not proper, and the open unit disc in the closed one is partially
proper but not proper. `μ_n^ad` is finite étale of rank `n` for `n` invertible in `K`, `ω_{G_m^ad}`
is spanned by `dT/T`, and on a modular curve `ω_{E^ad/X^ad}` is the analytified Hodge bundle. The
annulus `K⟨X, Y⟩/(XY − ϖ)` has all its maximal ideals of height `1`.

### Dependencies

Layer R1 rests on R0 (`K`-affinoid algebras and plus rings, completed tensor products, noetherian
type and stable sheafiness, the finite-type classes and fibre products, closed subspaces, separated,
proper, finite and quasi-finite morphisms, continuous differentials, étale and smooth morphisms), on
AdicSpaces layers 0.5, 2.4, 4.1 and 5.4, on ModularCurves layer 2B, and on Mathlib's schemes, locally
ringed spaces, `Proj`, sheaves of modules, Kähler differentials and group objects. Internally, R1.1
feeds rigid analytification and R1.7; Huber's fibre product (R1.2) gives `X ↦ X^ad` (R1.3), whose
compatibilities (R1.4) yield R1.5, R1.6 and R1.8; R1.7 uses the point-level lemmas of R1.9.

## Downstream consumers

| Consumer | What it uses from Part II |
|---|---|
| [AdicSpacesPartIII](../AdicSpacesPartIII/README.md) | The shared predicates and charts of R0; the noetherian sheafiness and finite-module results of R0.1–R0.2 for coherent sheaves (R3.1); continuous differentials (R0.15) and R1's chart comparison for the sheaf of continuous differentials (R3.6); rigid spaces and analytification for formal generic fibres, GAGA and traces. |
| [AdicEtaleGeometry](../AdicEtaleGeometry/README.md) | Completed and uniform completed tensor products, affinoid fibre products and the analytic locus (A0); the local structure of étale morphisms and the finite-étale comparison (A1, *etale-morphisms-local-description-and-comparison*); separatedness, properness, smooth charts and relative polydiscs (A2). |
| [AdicSpacesPartIV](../AdicSpacesPartIV/README.md) | R0 and R1 for sites, families and dagger geometry; R0's completed tensor products in the mixed tensor construction (R5.6, *mixed-completed-tensor*). |
| [PerfectoidSpaces](../PerfectoidSpaces/README.md) P0–P4, P7; [PerfectoidTowers](../PerfectoidTowers/README.md) P8.21, P9 | Affinoid algebras, adic morphisms, completed tensor products and fibre products, exactness of completed tensor products over a field; analytification of closed immersions and their ideal sheaves. |
| [DiamondsAndVStacks](../DiamondsAndVStacks/README.md) | The norm of a Tate ring and `K`-affinoid algebras. |

## References

- [Bourbaki] Nicolas Bourbaki, *Commutative Algebra*, Hermann, 1972, Ch. III, §2, no. 12.
- [Huber94] Roland Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994), 513–551. https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217
- [Huber96] Roland Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996 (not freely available). https://link.springer.com/book/10.1007/978-3-663-09991-8
- [Wedhorn] Torsten Wedhorn, *Adic Spaces*, arXiv:1910.05934v1 (14 Oct 2019). https://arxiv.org/abs/1910.05934v1
- [Hübner] Katharina Hübner, *Adic spaces*, arXiv:2405.06435v1 (10 May 2024). https://arxiv.org/abs/2405.06435
- [Morel] Sophie Morel, *Adic spaces (lecture notes)*, version of April 22, 2019. https://web.math.princeton.edu/~smorel/adic_notes.pdf
- [KL15] Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5 (9 May 2015). https://arxiv.org/abs/1301.0792
- [Conrad-AWS] Brian Conrad, *Several approaches to non-archimedean geometry*, Arizona Winter School 2007 lecture notes. https://math.stanford.edu/~conrad/papers/aws.pdf
- [Zavyalov24] Bogdan Zavyalov, *Some foundational results in adic geometry*, arXiv:2409.15516v2 (17 Jul 2025). https://arxiv.org/abs/2409.15516
- [Berkeley] Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics Studies 207 (2020). https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
- [EGA I] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique I*, Publ. Math. IHÉS 4 (1960). http://www.numdam.org/item/PMIHES_1960__4__5_0/
- [HK] David Hansen, Kiran S. Kedlaya, *Sheafiness criteria for Huber rings*, version dated August 6, 2026. https://kskedlaya.org/papers/criteria.pdf
- [Huber93] Roland Huber, *Continuous valuations*, Math. Z. 212 (1993) 455–477. https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212
- [EGA III₁] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique III (première partie)*, Publ. Math. IHÉS 11 (1961). http://www.numdam.org/item/PMIHES_1961__11__5_0/
- [Stacks] The Stacks Project Authors, *The Stacks Project*, cited by tag. https://stacks.math.columbia.edu
- [CHJ] Przemyslaw Chojecki, David Hansen, Christian Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, arXiv:1507.04875v2 (22 Aug 2016), published in Documenta Math. 22 (2017); printed page numbers of the arXiv PDF. https://arxiv.org/abs/1507.04875
- [Zavyalov-Q] Bogdan Zavyalov, *Quotients of admissible formal schemes and adic spaces by finite groups*, arXiv:2102.02762v2 (7 June 2023); published in Algebra & Number Theory 18(3) (2024) 409–475. https://arxiv.org/abs/2102.02762
- [Scholze13] Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (3 Nov 2012) (Forum Math. Pi 1 (2013)). https://arxiv.org/abs/1205.3463
- [FK] Kazuhiro Fujiwara, Fumiharu Kato, *Foundations of Rigid Geometry I*, arXiv:1308.4734v5 (28 Feb 2017). https://arxiv.org/abs/1308.4734
- [BHW] Christopher Birkbeck, Ben Heuer, Chris Williams, *Perfectoid Hilbert modular forms and overconvergent Hilbert modular forms*, Annales de l'Institut Fourier 2023. https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf
- [dJvdP] Johan de Jong, Marius van der Put, *Étale cohomology of rigid analytic spaces*, Documenta Mathematica 1 (1996), 1–56; EMS Press PDF. https://ems.press/content/serial-article-files/25781
- [DLLZ-A] Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *Logarithmic adic spaces: some foundational results*, arXiv:1912.09836v2 (30 Oct 2022); PDF page = printed page. https://arxiv.org/abs/1912.09836
- [Conrad-IC] Brian Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999); author PDF irredpaper.pdf. https://math.stanford.edu/~conrad/papers/irredpaper.pdf
- [Conrad-RA] Brian Conrad, *Relative ampleness in rigid geometry*, Ann. Inst. Fourier 56 (2006) 1049–1126; author PDF amplepaperfinal.pdf (45 pp.). https://math.stanford.edu/~conrad/papers/amplepaperfinal.pdf
- [Conrad-MR] Brian Conrad, *Modular curves and rigid-analytic spaces*, Pure Appl. Math. Q. 2 (2006); author PDF genpaper.pdf. https://math.stanford.edu/~conrad/papers/genpaper.pdf
- [Conrad-Adic] Brian Conrad, *A brief introduction to adic spaces*, author notes Adicnotes.pdf (22 pp.). https://math.stanford.edu/~conrad/papers/Adicnotes.pdf
- [BL I] Siegfried Bosch, Werner Lütkebohmert, *Formal and rigid geometry I. Rigid spaces*, Math. Ann. 295 (1993) 291–317. https://gdz.sub.uni-goettingen.de/id/PPN235181684_0295
- [GK00] Elmar Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, arXiv:1408.3329v1 (14 Aug 2014), author's version of J. reine angew. Math. 519 (2000) 73–95, with a footnote to Lemma 4.7 correcting the published hypotheses. https://arxiv.org/abs/1408.3329
- [Kedlaya06] Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv:math/0208027v6 (Duke Math. J. 134 (2006) 15–97), with the author's errata file https://kskedlaya.org/papers/finiteness-errata.txt. https://arxiv.org/abs/math/0208027
- [BGR] S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*, Grundlehren der mathematischen Wissenschaften 261, Springer 1984.
- [Hu4] Roland Huber, *Bewertungsspektrum und rigide Geometrie*, Regensburger Mathematische Schriften 23, 1993 (Huber96's reference [Hu4]; cited through Huber96; not available online).
- [HuKn] Roland Huber, Manfred Knebusch, *On valuation spectra*, Contemp. Math. 155 (1994) 167–206 (Huber96's reference [HK]; the key `[HK]` of this README is Hansen–Kedlaya).
- [L1] Werner Lütkebohmert, *Formal-algebraic and rigid-analytic geometry*, Math. Ann. 286 (1990) 341–371 (cited through Conrad-MR and Huber96 as [L1]).

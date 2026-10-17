# Roadmap: Hodge–Tate theory, canonical subgroups, and automorphic period maps

**Summary.** Build the integral character differential and quantitative canonical-subgroup theory, then the Hodge–Tate flag and cyclotomic Levi comparison on the open Shimura limit v-sheaf. Construct the canonical and anticanonical Hilbert domains, integral lattices and AIP torsor comparison used by overconvergent forms. Finally build logarithmic adic geometry and comparison functors from fs log adic Kummer foundations in Layer 6, to obtain the finite-level Hodge–Tate filtration of canonical local systems for Shimura data of Hodge type.

## Scope and ownership

The Hodge–Tate period map is the device through which perfectoid Shimura varieties see automorphic vector bundles. Scholze's torsion paper, Caraiani–Scholze and their successors read Galois-theoretic information off the fibres of `π_HT`. Overconvergent Hilbert modular forms in the perfectoid approach of Birkbeck–Heuer–Williams are functions on the anticanonical tower with a cz + d law, where z is a Hodge–Tate coordinate. Higher Coleman theory (Boxer–Pilloni) uses the logarithmic version on toroidal compactifications. All of these consume the same inputs, which this roadmap provides at finite level and on the open limit tower:

- the conormal module and Fargues's degree of a finite flat group scheme, with the co-Lie complex, the degree of torsion modules over rank-one valuation rings and the conormal module of a p-divisible group over `O_C`, its divisor and its behaviour under generic isomorphisms, the finite Hodge–Tate map from Cartier duality and Fargues's bound `p^{1/(p−1)}` on its cokernel, the Verschiebung of an abelian scheme and quotients of truncated Barsotti–Tate groups (Layer 0);
- the abelian relative de Rham comparison over finite extensions of `ℚ_p` and its graded piece, identified with the Hodge–Tate map of Layer 0, with Hodge tensors, and the degree-one Hodge–Tate sequence over an arbitrary C (Layer 1);
- the p-level Shimura tower and its limit v-sheaf, the Hodge–Tate exact sequence of p-divisible groups and abelian schemes, the Hodge–Tate flag and parabolic reduction, the cyclotomic comparison of de Rham and Hodge–Tate Levi torsors, filtered fibre functors and their splittings, and the period map on the open limit tower, built before perfectoid representability (Layer 2);
- weak and strong canonical subgroups on Hasse neighbourhoods with Fargues's and Scholze's constants, their Hodge–Tate images, the Hilbert version at arbitrary p with its `𝒪_F`-module structure, and normal formal models with their analytic integral structure (Layer 3);
- canonical and anticanonical loci, Atkin–Lehner, the Hodge–Tate coordinate with its fractional-linear action, and the period estimates of BHW Proposition 5.18 (Layer 4);
- Igusa torsors, the modified integral lattice `ω^int`, the modified Hodge bundles of Pilloni–Stroh for Siegel data at `p ≥ 3` with the structure sheaf of the full-level minimal model, the Andreatta–Iovita–Pilloni torsor and its comparison with the Hodge–Tate section (Layer 5);
- the analytic theory of log adic spaces with the Kummer foundations in Layer 6, the pro-Kummer étale site, the logarithmic primitive comparison, logarithmic period sheaves and Riemann–Hilbert, and the finite-level Hodge–Tate filtration and Levi torsor of canonical local systems for Shimura data of Hodge type (Layer 6, Layer 7, Layer 8).

The downstream scope boundary is as follows. Perfectoid representability of Shimura towers, the perfectoid incarnation of `π_HT` and its extension to compactifications are PerfectoidShimuraVarieties S1–S3; the toroidal infinite-level Hodge–Tate morphism of Boxer–Pilloni Theorem 4.4.40 is PerfectoidShimuraVarieties S6. Coefficient sheaves of overconvergent forms, their comparison (BHW Theorem 7.14) and Hecke operators are OverconvergentAutomorphicForms O5–O6. Hasse invariants of BT₁ groups over arbitrary 𝔽_p-schemes, Fargues's isomorphism LF and the BT₁ Hodge–Tate sequence belong to `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2. The Verschiebung determinant of semi-abelian schemes on degeneration charts belongs to `ShimuraCompactifications` C4; Layer 0 names the Hasse section `Ha(G/S)` defined by that determinant, with its API, and proves the ordinary-locus and minimal-compactification statements. The fs log adic Kummer foundations (log structures on étale sites, logification and pullback, O⁺-charts, fs log adic spaces, Kummer maps, the Kummer étale site, its local systems and `R^iε_*(ℤ/n)`) are constructed in [6.0](#section-6-0), [6.12](#section-6-12), [6.15](#section-6-15) and [6.17](#section-6-17). `CohomologyComparisons` §6.1 constructs the logarithmic period sheaves of modular curves; the general constructions of Layers 6–7 specialize to it (7.15). Outside this roadmap are: Shimura data not of Hodge type in Layers 7–8 (their comparison uses special points, CM motives, Margulis superrigidity and the congruence subgroup property); Hilbert–Siegel models of GSp₄ over a totally real field in 0.17 and 5.5–5.7; the modified bundles at `p = 2`, whose boundary estimate the sources report without proof; abelian families over C that do not descend to a finite extension of `ℚ_p` (individual abelian varieties over C are treated); and integral tensor frames.

### Prerequisites and boundaries

Suppliers, by layer. The finite flat group schemes and Cartier duality of TauCetiRoadmap ModularCurves layer 0B carry the finite Hodge–Tate map; Tau Ceti's `TauCeti.Bialgebra.CotangentSpace` and `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` are the pinned components. The ReductiveGroups roadmap supplies the algebraic-group direction, its Tannakian reconstruction (Layer 1), quotients (Layer 3) and parabolic and Levi theory (Layer 7); filtered fibre functors and their splittings are 2.14, and Layer 2 keeps the rational Hodge–Tate application. The AdicSpaces roadmap supplies Huber pairs and adic spaces. `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1, R07.2 and R07.6 supply p-divisible and truncated Barsotti–Tate groups, Raynaud's embedding into abelian schemes, Tate modules, Cartier duals, Frobenius and Verschiebung of finite groups, BT₁ Hasse invariants and Illusie's obstruction theory; co-Lie complexes, Fitting degrees over rank-one valuation rings and conormal modules over `O_C` are 0.24–0.26. `AbelianSchemesAndArithmeticModuli` A2–A4 supply abelian schemes, duality, Weil pairings and de Rham cohomology; the Verschiebung of an abelian scheme is 0.27. `ShimuraCompactifications` C2–C6 supply toroidal compactifications with normal-crossings boundary (C2), refinement maps (C3), degeneration data and the Verschiebung of semi-abelian schemes (C4), the Siegel toroidal and minimal compactifications and their normalizations at p-power level (C5) and Hilbert models (C6). `HilbertModularVarietiesAndShimuraCurves` H2/H4 supply Hasse ideals and Hilbert level moduli; the 𝒪_F-structure of Hilbert canonical subgroups is 3.12. `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3 and §8.3 supply period sheaves, primitive comparison, geometric Hodge–Tate direct images and the relative comparison over finite extensions of `ℚ_p`; the degree-one Hodge–Tate sequence over an arbitrary C and the relative character compatibility are 1.4–1.5. `AutomorphicBundles` B0–B3 supply flags, tensors and Levi conventions, and `AlgebraicModuliForArithmeticGeometry` §1.3 the representable flag; the relative Grassmannian of locally free quotients is built by charts, gluing and a universal property in TauCetiRoadmap ModularCurves 0G for the Hopf algebra of a finite locally free group scheme, and for an arbitrary finite locally free module in `AlgebraicModuliForArithmeticGeometry` §1.3. `ShimuraVarieties` Layer 1 and Layer 8 supply canonical models, level maps and translations, and `ShimuraData` Layer 3 compact duals and filtration parabolics. `NeronModelsAndSemistableAbelianVarieties` Layer 3 supplies semistable reduction and Raynaud uniformization over complete discrete valuation rings. `AdicSpacesPartII` R1 and AdicSpacesPartIII R2 supply analytification, admissible formal models, blow-ups and strict transforms; `AdicEtaleGeometry` A1, `PerfectoidSpaces` P3 and `DiamondsAndVStacks` D1–D6 supply étale and pro-étale sites, almost purity (P3), v-descent of vector bundles (D2.9) and limits of diamonds; normalizations of formal models, coherent étale descent and normal extension across a boundary are 3.11, 6.1 and 6.18. `CrystallineCohomology` CR.5 supplies the monoid theory and log structures on schemes, while Layer 6 constructs the fs log adic Kummer foundations. `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 supplies étale and pro-étale cohomology of locally noetherian adic spaces, Huber's comparison and étale cohomological dimension; `EnhancedDerivedSheaves` E1–E2 derived functors on ringed topoi; `DiamondEtaleCohomology` C5–C7 proper base change and local systems; DerivedModuleAlgebra §§0.4–0.13 and 0.25 the cotangent complex and square-zero deformations; and `CohomologyComparisons` §§0.4, 2.15 and 6.1 the twist conventions, Hodge–Tate degeneration and the modular-curve logarithmic periods.

Consumers. PerfectoidShimuraVarieties S0–S6 build representability and the global period maps on Layer 2–Layer 8; S0 imports the p-level tower, its action and its limit v-sheaf from Layer 2, and S3 imports the open-tower period map and its Levi pullback. IgusaVarietiesAndTorsionConcentration IG.3 studies fibres of `π_HT`. OverconvergentAutomorphicForms O2–O8 use the Layer 3–Layer 5 domains, coordinates, lattices and torsors; O5 builds the coefficient sheaves on Layer 5's torsor comparison. The HigherHidaAndColemanTheory design and TorsionCohomologyInfrastructure TC.2 use the logarithmic primitive comparison.

## Conventions

- Valuations are normalised by `v(p) = 1`. C is a complete algebraically closed nonarchimedean field over `ℚ_p` and `O_C` its valuation ring. Degrees of finite flat group schemes are Fargues degrees, sums of valuations of Fitting invariants, never lengths.
- The Hodge–Tate map of an abelian scheme is a quotient `T_pA^∨ ⊗ Ô → ω_A` with kernel `Lie(A^∨)(1)`; flags use the quotient convention (the BHW convention). For `g = 1` the quotient line is `ω`.
- Hilbert data use dual-abelian level structures `α: 𝒪_p² ≅ T_pA^∨`, the kernel coordinate `z = −HT(e₂)/HT(e₁)`, the left fractional-linear action `z ↦ (az + b)/(cz + d)` and `j = cz + d`. Conversion to the right action on towers is `α′ = α ∘ γ^∨`.
- Towers are indexed by compact open subgroups `K_p ⊂ G(ℚ_p)` at fixed tame level `K^p`. `G(ℚ_p)` acts on the right, `T_{gh} = T_h ∘ T_g`. Infinite-level objects are limits of diamonds in v-sheaves over `Spd(C, O_C)`, not perfectoid spaces.
- Hasse heights `w ∈ [0, 1]` are truncated valuations of Hasse invariants. The weak and strong canonical ranges and the BHW position ranges are kept distinct (below).
- Logarithmic structures are fine and saturated on étale sites of analytic adic spaces; Kummer and pro-Kummer sites follow Diao–Lan–Liu–Zhu (below).

### Conventions and quantitative ranges of Layers 0–5

For H finite locally free over S, `ω_H` is the pullback of relative differentials along the unit. Affinely it is the existing augmentation cotangent space. The finite character map sends a point of H to a character of `H^D` and then to the class of its group-like element minus one. For an abelian family the quotient convention is `T_pA^∨⊗Ô→ω_A` with kernel `Lie(A^∨)(1)`. A kernel line and its quotient point describe the same projective point in dimension one, but their tautological bundles have different twists.

The Fargues ideal `δ_G` is `Fitt₀ω_G`. The trace codifferent is its inverse fractional line after restriction to the unit; it is not the torsion module `ω_G`. Degrees use a normalized real rank-one valuation `v(p)=1`, with finitely presented valuation-ring modules; module length over a nondiscrete valuation ring is a different invariant. Effective Cartier-divisor pullback requires the determinant to remain regular. Codimension-one checking is confined to integral normal noetherian schemes.

For a multiplicative p-divisible group with character lattice T, `ω_G=T⊗ω_μ` and its determinant uses det T. The normalized pullback is 0.12, applied on the boundary charts of `ShimuraCompactifications` C4. Factor the determinant as `p^r` times a unit, without asserting that the full lattice map is p times an automorphism. Normalize the character determinant over `ℤ_p` before tensoring with the base; this still defines the normalized map when p is nilpotent in the base. Boundary torsion uses a quasi-finite group with a separate finite Raynaud part of height `2g−r` and the full polarized one-motive `[Y→G̃]`; an arbitrary semi-abelian scheme has no asserted dual semi-abelian scheme.

The split finite multiplicative isomorphism uses the constant character fibre `(ℤ/p^n)^r⊗R′`, or the locally constant character sheaf tensored with `𝒪`. Global sections over a disconnected R′ give a different source; over `𝔽_p×𝔽_p` they double its rank.

The relative comparison distinguishes `B_dR⁺` from the structural `O B_dR⁺` sheaf. CS17’s two horizontal lattices M and M₀ produce the graded filtration; `gr⁰B_dR=Ô` is not an identity for `gr⁰O B_dR`. The families here are defined over finite extensions of `ℚ_p` and then base extended to C. For an individual abelian variety over arbitrary C the rational sequence is 1.4, with A4’s degree-one identifications and Weil duality; descent to a finite extension of `ℚ_p` is unnecessary. Rational homology tensors give rational `G(ℚ_p)` frames; integral frames are not used. The canonical raw Levi comparison is contracted with the Tate-basis torsor through central `μ`. A chosen basis gives an underlying untwisted comparison with its transported linearization; it does not erase the `μ`-weight twist.

Put `S_n=(p^n−1)/(p−1)` and w equal to the Hasse height. The weak formal condition is `S_n w<1/2`; the strong sufficient condition is `p^n w<1/2`. `HALO’s w≤p^{−(n+1)}` works for every prime: at `p=2` its weak inequality remains strict, although the strong inequality may be equality. FAR11’s HN range is strict: `w<1/(2p^{n−1})` for `p≥5` and `w<1/3^n` for `p=3`. The BHW geometric-position range is `w<1/(c_p p^{n−1})` with `c_p=2 (p≥5)` and `c_p=3 (p=3)`, strict as in FAR11, and `w≤1/(4·2^{n−1})` for `p=2`, HALO's range (4.6).

The HN induction uses a supplied Frobenius-congruent subgroup and the noncircular pointwise quotient-Hasse lemma. At level n it applies induction to `p^{−(n−1)}D/D`. The family quotient-radius theorem 3.8 is not used in this induction.

The canonical conormal comparison is truncated at `n−δ`, `δ=S_n w`. The raw dual character map has cokernel degree `w/(p−1)`; it is not an integral isomorphism at positive height. Subtracting this second error gives scalar kernel precision `x=n−p^n w/(p−1)`. This is an `O_C`-module congruence. The unsplit `O_F/p^n` canonical generator is 3.12; `O_F` stability plus an underlying rank count does not prove it.

Hilbert data use `O_p=O_F⊗ℤ_p`, dual-abelian level structures and kernel coordinate `z=−HT(e₂)/HT(e₁)`. The fixed left action gives `z↦(az+b)/(cz+d)` and `j=cz+d`. All formulas are on their invertible-denominator domains. Integral error balls use the integral closure of `O_p⊗O_C` in `O_p⊗C`, including ramified primes. Generic embedding projections do not identify the tensor order with an integral product. The finite standard Plücker chart indices are all g-subsets of 2g indices, and the full integral symplectic group does not permute those chart domains.

On a normal formal Hilbert chart choose the actual determinant ideal `Hdg_T` with `Hdg_T^{p−1}=Hdg`. The integral congruence ideals are `I_m=p^m Hdg_T^{−(p^m−1)}` and `I′_m=p^m Hdg_T^{−p^m}`. These are integral ideals on that chart, not formal real powers. AIPH Proposition 4.1 gives the lifted-generator matrix and its adjugate bound; 3.11 transfers that calculation to `O⁺`. Compatible higher-level generators give inclusion of lattices; equal regular determinant ideals make the comparison determinant a unit and prove equality. AIPH Proposition 4.7 compares weight sheaves rather than directly proving this lattice equality.

The AIP structure group is proved from the ratio of two actual AIP lifts over the same abelian base point. The ratio equals cz+d through the open embedding in the total Hodge bundle. The ambient-radius containment has only one direction and is not used backwards. Finite Atkin–Lehner maps use `n≥1` and source radius `p^nε<1/2`; infinite level uses structural forgetful pullback. O5 constructs the associated coefficient sheaves and the AIPH Theorem 6.7(3) restriction comparison on Layer 5's torsor comparison; O6 separately proves p-Hecke.

For determinant modifications (Siegel data, `p ≥ 3`) put `D=g/(p−1)`; bounds and reductions consistently use `p^D` and `p^{n−D}`. The minimal modified determinant pulls back to the toroidal modified determinant even though the whole finite-level Hodge bundle need not descend. The canonical adic section has no unconditional formal-model isomorphism attached.

For weight coefficients choose a common actual AIP coordinate, level, formal-radius and analytic-character domain. The printed all-unit supremum and analytic-radius formula are false; a level-index repair alone does not validate a positive radius. The finite-character integral generator with unit HT pullback, the invariants of completed structure sheaves on the anticanonical tower and the coefficient sheaves belong to OverconvergentAutomorphicForms O5; the torsor-level comparison here does not assume that the perfectoid equalizer is an invertible line. At `n=0` both constructions use `AL_1`.

### Conventions of the logarithmic layers

A log structure is a monoid sheaf on the ordinary étale ringed site, with unit fibre equal to the sheaf of units. Its characteristic is the quotient by that unit fibre. Log structures on the étale site of an étale-sheafy adic space, logification, pullback, O⁺-charts and fs log adic spaces are constructed in [6.0](#section-6-0), over the étale site of `AdicEtaleGeometry` A1; the monoid theory is `CrystallineCohomology` CR.5's. A chart has its structural image in the specified plus sheaf. For monoid algebras, the plus ring is the integral closure of the raw plus algebra (DLLZ-adic, Lemma 2.2.11, pp. 9–10, with the integral closure imposed). By contrast, the index in the Kummer étale criterion is invertible in **O**, without requiring invertibility in `**O⁺**`. Fine and fs are étale-local chart conditions. Saturated products use the fs category.

Normal crossings means étale locally a union of coordinate hyperplanes; global components may self-intersect. A strict normal crossings hypothesis is imposed only where a statement uses global smooth components. Continuous log differentials represent derivations into complete Hausdorff topological modules. Finiteness implies completeness in the natural topology under the explicit noetherian-type hypotheses of the differential construction, rather than for arbitrary complete Huber rings. For a coordinate boundary, residue sends dlog T to 1 and dT to 0.

Kummer root covers retain their boundary points. A pro-Kummer cover is jointly surjective on all underlying topological points and has the ordinal tower conditions specified below: a stage maps to the inverse limit of earlier stages by a pulled-back Kummer étale map, and sufficiently late maps are finite surjective. Log affinoid perfectoid presentations need an all-integer-divisible chart limit; taking only p-power roots misses the prime-to-p divisibility. Completed affinoids and their presentation diagrams are distinguished.

The primitive comparison is an almost isomorphism in the proper log-smooth setting, over a characteristic-zero algebraically closed field of residue characteristic p. The toric calculation needs a perfectoid base. Almost acyclicity, exact acyclicity, local-system extension, and cohomological finiteness each have separate hypotheses. Layer 6 uses neither the ordinary primitive comparison nor `CohomologyComparisons` §2.15; ordinary primitive comparison is consumed from `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3 in Layer 7.

For Riemann–Hilbert, k is a complete discretely valued p-adic field with perfect residue field, and K may be any perfectoid extension containing `k∞` unless the particular theorem requires the completion of an algebraic closure. For the arithmetic Galois-invariant formula choose `K=k̂∞`. Structural periods include a further filtration completion after inverting t, even with trivial logs. Residues are normalized in [0,1). Tensor equivalences require unipotent geometric boundary monodromy; the ramified-pullback isomorphisms have the stated multiplicity condition. Properness is required for every conclusion of the proper period-cohomology comparison.

For canonical coefficients, put `M = Ŵₚ⊗B⁺dR` and `M⁰ =` (WdR⊗OB⁺dR,log)^(∇=0) in their common BdR module. **Each lattice has its own t-adic filtration**, `FilʲL=tʲL`. The second lattice is not filtered by intersecting the Hodge filtration on the structural-period tensor product. The ascending image filtration is F₋ⱼ=image(M∩FilʲM⁰ `→ M/Fil¹M`), with kernel `Fil¹M∩FilʲM⁰`. For `M⁰=tᵃM` in rank one the jump is a; for the Tate line it is `−1`. In the homological Siegel convention `F₋₁=Lie(A)⊗Ô(1)` and `F₀=H₁(A,Qₚ)⊗Ô`. The graded relation is Grⱼ(Ŵₚ⊗Ô)(j)≃GrʲWdR⊗Ô, and the finite-level Levi comparison is MHT≃MdR×^{µ,Zₚ×}Zₚ(1).

For Shimura data of Hodge type `(Gᶜ = G)`, representations of G supply flat canonical local systems, associated through the universal abelian scheme and its Hodge tensors; an arbitrary Levi representation supplies no such full-group realization. V₀ is realized by H₁, the dual of `R¹f_*`; irreducible representations are cut out of individual tensor powers, and the general case follows by additivity.

## Exact supplier contracts

The declarations and roadmap layers below are the existing starting point, consumed as their suppliers state them.

### From Mathlib and Tau Ceti

Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These declarations supply only the interfaces described below; scheme and site constructions come from the roadmaps listed after them.

Tau Ceti’s augmentation cotangent space and finite locally free Cartier duality supply the affine components of the finite character differential. Mathlib’s quotient Grassmannian supplies its ambient module-valued flag, while cofiltered categories and initial-functor limit comparison supply the categorical operations on the level tower. These components require the geometric and sheaf interfaces below: an affine Spa and the ring `B_dR⁺` do not supply logarithmic sites or period-sheaf comparisons. Log structures on adic spaces are constructed in [6.0](#section-6-0) and the monoid theory from `CrystallineCohomology` CR.5.

- `TauCeti.Bialgebra.AugmentationIdeal` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The augmentation ideal `ker ε` of a commutative bialgebra over a commutative ring.
- `TauCeti.Bialgebra.CotangentSpace` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The cotangent space `(ker ε)/(ker ε)²` at the identity of the affine monoid of a commutative bialgebra over any commutative ring: `ω_H` for an affine group scheme.
- `TauCeti.Bialgebra.cotangentMap` (def, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The R-linear map a `↦ [a − ε(a)]` into the cotangent space; on a group-like element g it is the class of `g − 1`, i.e. dt/t pulled back.
- `TauCeti.Bialgebra.cotangentMap_mul` (lemma, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): Leibniz rule cotangentMap(ab) `=` ε(a)·cotangentMap(b) + ε(b)·cotangentMap(a), giving additivity on group-like elements.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`): The category of finite locally free (finite, flat, locally of finite presentation) commutative affine group schemes over an affine base. The same file defines its Cartier duality `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean`): Cartier duality commutes with base change `R → S`.
- `TauCeti.Cocharacter.parabolic` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): Dynamic parabolic as a subgroup of algebra-valued points. This does not alone provide representability or a parabolic group-scheme torsor API.
- `TauCeti.Cocharacter.levi` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): Dynamic Levi as a subgroup of algebra-valued points. Representability and the quotient morphism of group schemes require additional theory.
- `TauCeti.Huber.Pair` (structure, `TauCeti/RingTheory/Huber/Pair.lean`): A Huber pair `(A, A⁺)`: a ring of integral elements of a Huber ring.
- `Ideal.Cotangent` (def, `Mathlib/RingTheory/Ideal/Cotangent.lean`): `I/I²` as a module, the carrier of `TauCeti.Bialgebra.CotangentSpace`.
- `KaehlerDifferential` (def, `Mathlib/RingTheory/Kaehler/Basic.lean`): Kähler differentials `Ω_{S/R}` of a ring map.
- `IsGroupLikeElem` (structure, `Mathlib/RingTheory/Coalgebra/GroupLike.lean`): Group-like elements of a coalgebra: `ε(a) = 1` and `Δ(a) =` a `⊗ a`; these are the characters of the Cartier dual.
- `Module.Grassmannian` (structure, `Mathlib/RingTheory/Grassmannian.lean`): Submodules of M with locally free quotient of rank k (rank-k quotients), with base change: the ambient space of the Hodge–Tate flag point.
- `Module.Invertible` (class, `Mathlib/RingTheory/PicardGroup.lean`): Invertible modules (line bundles over a ring).
- `Module.length` (def, `Mathlib/RingTheory/Length.lean`): The length of a module; used only to state that the Fargues degree is not the length.
- `LinearMap.det` (irreducible_def, `Mathlib/LinearAlgebra/Determinant.lean`): Determinant of an endomorphism; finite free hypotheses give its usual properties. It does not supply determinants of maps between different vector bundles or determinant lines of complexes.
- `Valuation` (structure, `Mathlib/RingTheory/Valuation/Basic.lean`): Multiplicative valuations in a linearly ordered commutative monoid with zero; a real additive valuation used for Fargues degree requires an explicit conversion and normalisation.
- `ValuationSubring` (structure, `Mathlib/RingTheory/Valuation/ValuationSubring.lean`): `Valuation` subrings of a field.
- `PadicInt` (def, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`): The p-adic integers `ℤ_p`.
- `PadicComplex` (abbrev, `Mathlib/NumberTheory/Padics/Complex.lean`): `ℂ_p`, the completion of an algebraic closure of `ℚ_p`.
- `IsAdicComplete` (class, `Mathlib/RingTheory/AdicCompletion/Basic.lean`): I-adic completeness (Hausdorff and precomplete).
- `AlgebraicGeometry.Scheme` (structure, `Mathlib/AlgebraicGeometry/Scheme.lean`): Schemes.
- `AlgebraicGeometry.Scheme.Hom.normalization` (def, `Mathlib/AlgebraicGeometry/Normalization.lean`): Relative normalisation of the target of a scheme morphism in its source; normalisation of admissible formal schemes is 3.11.
- `AlgebraicGeometry.Scheme.Modules` (def, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`): The category of actual module sheaves over X.ringCatSheaf; the global conormal carrier is not merely a ring module.
- `AlgebraicGeometry.Scheme.Modules.pullback` (def, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`): Pullback of module sheaves along a scheme morphism; applied to the unit section and supplied relative differentials.
- `SheafOfModules.Submodule` (structure, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Submodule.lean`): A presheaf submodule with local membership, its associated sheaf and monomorphic inclusion; used for integral image lattices.
- `SheafOfModules.IsLocallyFree` (class, `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean`): Local generator maps are isomorphisms; this needs the declared sheafification hypotheses and is not a pointwise rank condition.
- `CategoryTheory.Grp` (structure, `Mathlib/CategoryTheory/Monoidal/Grp.lean`): Group objects in a Cartesian monoidal category, giving actual geometric group carriers rather than a predicate.
- `GroupLike` (structure, `Mathlib/RingTheory/Coalgebra/GroupLike.lean`): The bundled group-like elements of a coalgebra; Hopf algebras give their group structure and actual character-domain type.
- `TauCeti.Huber.Pair.Hom` (structure, `TauCeti/RingTheory/Huber/Pair.lean`): Continuous ring map respecting the specified plus subrings.
- `TauCeti.Huber.Pair.Hom.spaComap` (def, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean`): Contravariant continuous map on Spa attached to a pair homomorphism; only affinoid spectra, not a log adic site.
- `CategoryTheory.GrothendieckTopology` (structure, `Mathlib/CategoryTheory/Sites/Grothendieck.lean`): Covering sieves with maximality, pullback stability and transitivity.
- `CategoryTheory.Sheaf` (abbrev, `Mathlib/CategoryTheory/Sites/Sheaf.lean`): Sheaves of objects of a category on a Grothendieck site, implemented by the full subcategory of presheaves satisfying the sheaf condition.
- `Derivation` (structure, `Mathlib/RingTheory/Derivation/Basic.lean`): An R-linear derivation `A→M` with Leibniz rule; continuity is extra data in the analytic refinement.
- `AdicCompletion` (def, `Mathlib/RingTheory/AdicCompletion/Basic.lean`): Inverse limit of M/IⁿM for an ideal I, including the completion ring when M is the ring. Not the Banach completed tensor product.
- `BDeRhamPlus` (def, `Mathlib/RingTheory/Perfectoid/BDeRham.lean`): Completion at `ker θ` after inverting p in Witt vectors of the pretilt of a p-adically complete ring; the declaration alone supplies no field, principal-kernel or sheaf theorem.
- `fontaineThetaInvertP` (def, `Mathlib/RingTheory/Perfectoid/BDeRham.lean`): Localized Fontaine map from p-inverted Witt vectors to R[1/p], under the prime, nonunit-p and p-adic-completeness hypotheses.
- `CategoryTheory.IsCofiltered` (class, `Mathlib/CategoryTheory/Filtered/Basic.lean`): Cofiltered categories (cones over finite diagrams exist, nonempty); the poset of compact open subgroups of `G(ℚ_p)` under inclusion is one.
- `CategoryTheory.Functor` (structure, `Mathlib/CategoryTheory/Functor/Basic.lean`): Functors between categories; the p-level tower is a functor from the level poset to adic spaces over `Spa(C, O_C)`.
- `MulAction.toPermHom` (def, `Mathlib/Algebra/Group/Action/End.lean`): A group action as a homomorphism to permutations; the right action of `G(ℚ_p)` on the points of the tower is the action of the opposite group.
- `CategoryTheory.Limits.limit` (def, `Mathlib/CategoryTheory/Limits/HasLimits.lean`): A chosen limit of a functor; the infinite-level diamond is the limit of the tower of diamonds in v-sheaves.
- `CategoryTheory.Functor.Initial.limitIso` (def, `Mathlib/CategoryTheory/Limits/Final.lean`): For an initial functor F and a functor G with a limit, limit `(F ⋙ G) ≅` limit G; this is the independence of the infinite-level limit from a cofinal family of levels.

Tau Ceti at the same pin further supplies the following, which are used as they stand and are not restated here.

- Fitting ideals: `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker` (`TauCeti/RingTheory/FittingIdeal/Basic.lean`), `TauCeti.fittingIdeal_baseChange` and `IsBaseChange.fittingIdeal_eq_map` (`TauCeti/RingTheory/FittingIdeal/BaseChange.lean`) for finite modules over an arbitrary commutative ring, and the scheme-level ideal sheaf `AlgebraicGeometry.Scheme.Modules.fittingIdeal` with its pullback formula `AlgebraicGeometry.Scheme.Modules.fittingIdeal_pullback` (`TauCeti/AlgebraicGeometry/Modules/FittingIdeal/`) for quasicoherent modules of finite type. The rank-one valuation specialization used for Fargues's degree (valuation of a principal Fitting ideal over a nondiscrete valuation ring) is not there and is 0.24.
- Relative differentials: `AlgebraicGeometry.Scheme.relativeDifferentials` with its universal derivation (`TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean`); `ω_H` of 0.1 is its pullback along the unit section.
- Test groups and twists: the group scheme `μ_n` over any ring (`TauCeti.RootsOfUnityGroup.groupScheme`), the Hopf algebra of `α_p (TauCeti.AlphaP.CoordinateRing)` and `ℤ_p(1)` with its Galois action (`TauCeti.PadicTateTwist`); the Checks of 0.1, 0.2 and 0.11 and the Tate twists of 2.10 and 7.35 use these.
- Monogenic differents: `TauCeti.natCast_differentExponent_eq_addVal_aeval_derivative_minpoly` computes the different exponent of a monogenic extension of local fields as the valuation of f′(x); the monogenic case of 0.20 has the same shape over nondiscrete valuation rings, which this discretely valued statement does not cover.


Tau Ceti also provides `TauCeti.RestrictedProducts.CompactOpenSubgroups` in `TauCeti/Topology/Algebra/RestrictedProduct/Basic.lean`: a chosen family of compact open subgroups, with one subgroup in each factor. Layer 2 uses the poset of all compact open levels of one group and its intersection cones; its light subtype in Suggested.lean specializes the existing subgroup/topology notions and does not construct restricted-product theory.

### From TauCetiRoadmap roadmaps

- **ModularCurves**, layer 0B: finite flat group schemes and Cartier duality, carrying the finite Hodge–Tate map of 0.2; layer 0G: the relative Grassmannian scheme of locally free rank-N quotients of the Hopf algebra of a finite locally free group scheme, with its affine charts, gluing and universal property; the Grassmannian and flag bundle of an arbitrary finite locally free module that 2.7 uses are `AlgebraicModuliForArithmeticGeometry` §1.3's.
- **ReductiveGroups**, Layer 1: representations, comodules and Tannakian reconstruction (2.11, 2.14); Layer 3: closed subgroups and the fppf quotient G/H, whose representability is a theorem under stated hypotheses (2.9 takes the representing scheme of `G/P_µ` from `ShimuraData` Layer 3); Layer 7: parabolic subgroups and Levi decompositions, with the dynamic approach to parabolics kept as a parallel route (2.9, 2.14). The dynamic parabolic and Levi subgroups of a cocharacter, on points, are the pinned `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.levi`.
- **AdicSpaces**: Huber pairs and adic spaces, with the pinned `TauCeti.Huber.Pair`.

### From other roadmaps

Each item is consumed as the supplier states it; where a statement here needs more, the additional mathematics is a target of this roadmap, cited in parentheses.

- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory`.** R07.1: p-divisible groups, their Tate modules and Cartier duals, the finite part of a quasi-finite group, the Oort–Tate classification; R07.1.1 (relative Frobenius and Verschiebung of commutative group schemes, `V_G = (F_{G^D})^D` for finite locally free G); R07.1.5 (levels of a p-divisible group); R07.1.10–R07.1.11 (truncated Barsotti–Tate groups and Illusie's co-Lie criterion over bases where p is nilpotent); R07.1.14–R07.1.15 (dimension, and `dim G + dim G^D =` height over complete noetherian local rings); R07.1.40 (Raynaud's embedding of a finite locally free group into an abelian scheme, Zariski locally on any base). R07.2: BT₁ Hasse invariants and the Hasse–Witt duality, with R07.2.21's Frobenius-twist identity `det(ω^{(p)}) = (det ω)^{⊗p}` for a BT₁ over an 𝔽_p-scheme. R07.6.6: Illusie's obstruction theory for lifting homomorphisms of flat commutative group schemes along square-zero thickenings. Conormal modules of p-divisible groups over `O_C (0.25)`, the degree of finitely presented torsion modules over rank-one valuation rings (0.24), co-Lie complexes and their determinants (0.26), the normalized multiplicative determinant pullback (0.12), quotients of truncated Barsotti–Tate groups (0.28), Faltings's integral Hodge–Tate complex (0.5), Fargues's degree and canonical subgroups are this roadmap's.
- **`AbelianSchemesAndArithmeticModuli`.** A2: polarizations and the Poincaré bundle; A3 and A3.5: dual isogenies with Cartier-dual kernels and the Weil pairings `e_n`: `A[n] × A^∨[n] → μ_n`; A3.7: their polarized forms; A4, A4.2–A4.3: the p-divisible group of an abelian scheme, `H¹_dR(A/S)` with its Hodge filtration `0 → ω_A → H¹_dR(A/S) → Lie(A^∨) → 0`, `Lie(A^∨) = R¹π_*O_A`, and Poincaré duality, over an arbitrary base. The Verschiebung of an abelian scheme is 0.27.
- **`NeronModelsAndSemistableAbelianVarieties`.** Layer 3: semistable reduction after a finite extension, and rigid uniformization with the Raynaud extension and its dual polarized one-motive over a complete discrete valuation ring (0.18).
- **`ShimuraCompactifications`.** C2: toroidal compactifications, smooth with normal-crossings boundary at neat level for smooth fans, algebraized for projective fans, with canonical models over the reflex field; C3 (refinement map): refinement maps of toroidal charts; C4 (polarized degeneration data): polarized relative degeneration data `[Y → G̃]` over complete normal noetherian bases; C4 (semiabelian hasse boundary comparison): the Verschiebung of a semi-abelian scheme and its determinant on the Hodge line; C4 (constructible character sheaf, extended isogeny kernel, semi-abelian Tate module, homomorphism extension); C5 (integral toroidal space, integral minimal space, higher level toroidal normalization): the toroidal and minimal Siegel compactifications at prime-to-p level and the normalized toroidal model at higher p-power level, under their good-prime hypotheses; C5 (minimal Hodge ampleness); C6: the Hilbert near-ordinary model and the Hilbert Hasse ideal at the boundary. The pushforward of the structure sheaf modulo `p^k` to the full-level Siegel minimal model is 5.13.
- **`HilbertModularVarietiesAndShimuraCurves`.** H2: the Hilbert Hasse ideal and the Hasse formal domains; H4: hybrid, geometric and arithmetic full level structures, Γ₀(p^n)-level structures and their forgetful maps. The `𝒪_F`-module structure of Hilbert canonical subgroups is 3.12.
- **`PELModuli`.** M0: integral PEL data, the determinant condition and symplectic 𝒪-lattices; M1: level structures.
- **`ShimuraData`.** Layer 3: compact duals and filtration parabolics, with the reflex-field form of the flag variety.
- **`ShimuraVarieties`.** Layer 1: analytic points and right translations; Layer 8: level towers, finite level maps, translation laws, minimal descent and the abelian instance.
- **`AutomorphicBundles`.** B0: the Hodge parabolic convention and the central split quotient; B1: Hodge tensor realizations, the absolute-Hodge propagation of Hodge tensors (Deligne, Blasius), the tensor frame torsor and the filtration reduction of the de Rham frame torsor to graded frames; B2 and B2.general: automorphic vector bundles of representations of the centralizer, the étale coefficient local systems and their tensor and Hecke compatibilities; B3.7 and B3.general: Deligne's canonical logarithmic extension with nilpotent residues (zero exponents) of a full-group coefficient with unipotent monodromy, its identification with the automorphic canonical extension, and their boundary functoriality.
- **`AlgebraicModuliForArithmeticGeometry`.** §1.3: the coherent Grassmannian and flag bundle of a finite locally free module over an arbitrary base, with representability and pullback.
- **`PadicHodgeTheory`.** §§0.2–0.3: `B_dR⁺` and Fontaine's element t; §8.3: Hodge–Tate weights of abelian varieties; §§2.1–2.4: the period sheaves `B_dR⁺`, `OB_dR⁺` and their gradings, acyclicity on affinoid perfectoids, the power-series description, the formal Poincaré lemma and the Faltings extension; §§2.7, 7.1–7.3: the primitive comparison theorem for proper smooth rigid spaces over C (with its pro-étale and rational forms), the geometric Hodge–Tate direct images `R^jν_*Ô = Ω^j(−j)` over an arbitrary C, de Rham lisse sheaves, the relative Hodge–Tate filtration, and the relative de Rham comparison for de Rham pairs over finite extensions of `ℚ_p`. The degree-one Hodge–Tate sequence over an arbitrary C and the relative character compatibility are 1.4–1.5.
- **`CohomologyComparisons`.** §0.4: twist, Frobenius and filtration normalizations; `CohomologyComparisons` §2.15: Hodge–Tate degeneration; §6.1: the logarithmic period sheaves of modular curves, to which Layers 6–7 specialize (7.15).
- **`CrystallineCohomology`.** CR.5 and CR.5:log-algebra: the monoid theory (prelog rings, saturated, characteristic and Kummer monoid maps, integral fibre products), log charts and divisorial log structures on schemes, the log-smoothness chart criterion, log differentials and log de Rham complexes, used through their monoid-level and scheme-level statements.
- **AutomorphicBundles B3.log.1–B3.log.3.** The horizontal smooth-pair Kummer sites, canonical coefficient systems and unipotent logarithmic comparison supply their smooth proper boundary instances. Layer 6 constructs logification, integral charts and the Kummer topology for general étale-sheafy and locally noetherian fs log adic spaces; Layer 7 retains the general coefficient and residue-normalization theory, and identifies the Hodge-type unipotent instance with these supplied constructions.
- **`AdicSpacesPartII`.** R0: locally noetherian adic spaces, noetherian-type Huber rings, fibre products, finite, smooth and étale morphisms, continuous differentials, completed tensor products and uniformization; R1: analytification, with the dimension theory of affinoid domains (§R1.9).
- **AdicSpacesPartIII.** F0 and R2: formal schemes, admissible formal models, generic fibres, admissible blow-ups and Hasse domains (§R2.10); R3: coherent sheaves, Tate–Kiehl, Kiehl's proper mapping theorem and continuous differentials (§§R3.1–R3.7). Normalizations of formal models and their analytic integral structure (3.11), étale descent of finite coherent modules (6.1) and normal extension across a boundary (6.18) are constructed here.
- **AdicSpacesPartIV.** §R4.7: smooth pairs and their analytifications. The general normal-crossings charts of 6.5 also allow étale-local branches over finite separable field extensions.
- **`AdicEtaleGeometry`.** A1: the étale and corrected pro-étale sites of analytic adic spaces, the étale structure sheaf, pro-étale morphisms and the projection `ν`; A4: perfectoid uniform completion; §§A1.6–A1.6a: reduction of étale covers to rational and finite étale covers, and vector bundles on a stable étale basis.
- **`PerfectoidSpaces`.** P0: almost mathematics (almost Čech acyclicity, almost faithfully flat descent, almost finitely generated modules); P1: perfectoid Tate rings; P3: almost purity, étale almost acyclicity and the étale site tilting equivalence; P5: cofiltered limits of affinoid perfectoid spaces.
- **`DiamondsAndVStacks`.** D0: Čech-to-derived comparison, cohomology of filtered colimits on coherent sites, stackification; D1, D3–D6: pro-étale maps, quasi-pro-étale morphisms, underlying spaces, spatial diamonds and limits, the diamond functor and the étale site comparison; D2.9: v-descent of vector bundles on perfectoid spaces and the identification of completed pro-étale bundles on a rigid space with v-bundles.
- **`DiamondEtaleCohomology`.** C5: proper base change for the étale cohomology of diamonds; C7: local systems.
- **`ClassicalAdicEtaleCohomology`.** §§1.1–1.4, 8.2 and 11.1–11.2: étale and pro-étale cohomology of locally noetherian analytic adic spaces with the comparison `H^i(X_ét, F) ≅` H^i(X_proét, `ν^*F`), the Cartan–Leray spectral sequence for pro-finite-étale torsors, étale acyclicity of finite projective modules, torsion local systems and finite étale covers, Tate twists, Huber's comparison of algebraic and analytic étale cohomology with the normal-crossings purity computation, the derived limit of lisse towers (§1.3), and the étale cohomological dimension bound (§11.2); the comparison and purity statements are its §8.2 and §11.1. Its non-noetherian perfectoid, Kummer and finite-module versions are 6.28, 6.25 and 6.1.
- **`EnhancedDerivedSheaves`.** E1: the derived pullback–pushforward adjunction and derived tensor products on ringed topoi; E2: derived limits on replete topoi. The projection formula for locally free coefficients and derived limits over an acyclic basis are 6.37 and 6.31.
- **DerivedModuleAlgebra.** §§0.4, 0.6–0.8, 0.10 and 0.13: the full cotangent complex, its universal property, naive truncation, transitivity, derived base change and regular-quotient two-term models, from which 0.26 builds the co-Lie complex; §§0.5 and 0.25: square-zero extensions and their lifting obstructions.

## How to read the build

Layers 0–2 construct integral differentials and their supporting algebra over valuation rings, the relative comparison and the degree-one Hodge–Tate sequence, and the open-tower flag with its filtered-fibre-functor theory. Layers 3–5 add canonical subgroups with their Hilbert 𝒪_F-structure and normal formal models, Hilbert period estimates, and integral lattices, modified bundles and torsors. Layer 6 constructs fs log adic spaces and their Kummer and pro-Kummer geometry, independently of the comparison theorems of Layer 7. Layer 7 develops primitive comparison, periods and the canonical coefficient filtrations for Hodge-type data; Layer 8 assembles their finite-level export. Each subsection states its domain before its interfaces and checks. A subsection may cite a later subsection of the same layer (for instance 0.4 cites 0.25, and 2.11 cites 2.14); no subsection cites a later layer, and the citations have no cycle. Suggested.lean gives representative signatures over existing carriers; the full mathematical roadmap is this document. Its `HodgeTate.CompactOpenSubgroup` records the level index in 2.1. The numerical definitions `hasseValuation`, `canonicalSum`, `WeakCanonicalRange`, `StrongCanonicalRange`, `bhwConstant` and `BHWPositionRange` encode the height and bounds in 3.1, 3.4 and 4.6 (strict for `p ≥ 3`, inclusive for `p = 2`); their rational examples test the same real-valued inequalities. The definitions `autFactor`, `coordAction` and `aipExponent` encode 4.4 and the exponent of 5.8; `coordAction` agrees with Mathlib's action of GL (Fin 2) K on OnePoint K where its denominator is invertible.

## Layer 0: p-divisible groups and integral differentials

Layer 0 builds the local integral theory of finite flat group schemes over valuation rings: the conormal module, the finite and p-divisible Hodge–Tate maps from Cartier duality, Fargues's degree, divisor and Harder–Narasimhan filtration, and the different. Fargues's degree is computed in the worked case of an order-p subgroup of a supersingular E[p], and the cokernel bound `p^{1/(p−1)}` is stated for p-divisible groups and their finite flat subgroups. Layer 0 then applies the local theory on semi-abelian degeneration charts: torsion of semi-abelian schemes, the semi-abelian Hasse invariant (named here, over `ShimuraCompactifications` C4's Verschiebung determinant) with its ordinary locus and minimal-compactification extension, the Hodge–Tate map over the toroidal boundary and the Raynaud description of the Hodge–Tate filtration. Hasse invariants of BT₁ groups over arbitrary 𝔽_p-schemes are imported from R07.2. The layer closes with the inputs these statements need over nonnoetherian valuation rings and general bases: the degree of finitely presented torsion modules, the conormal module of a p-divisible group over `O_C`, the co-Lie complex, the Verschiebung of an abelian scheme and quotients of truncated Barsotti–Tate groups.

<a id="section-0-1"></a>

### 0.1 The conormal module `ω_H` of a finite locally free group scheme

Define `TauCeti.HodgeTate.conormal`. For a finite locally free commutative S-group H with unit e, define `ω_H=e*Ω¹_{H/S}`, as a finitely presented `O_S`-module. If `S=Spec R` and `H=Spec A`, identify it canonically with the existing `TauCeti.Bialgebra.CotangentSpace R A=(ker ε)/(ker ε)²`; this is an identification with the baseline, not a new affine cotangent theory. The conormal module of a p-divisible group over `O_C`, with `ω_{G[p^n]}≅ω_G/p^n`, is 0.25.

S is arbitrary for the finite locally free conormal sheaf; relative differentials and finitely presented module sheaves are imported.

Construct `e*Ω¹` and identify its affine presentation with `I/I²` using the counit; glue through the relative-differentials pullback API.

Finite presentation follows from finite presentation of H/S. Arbitrary base change and right exactness are the separately named conormal lemmas below.

The interface consists of the following named results.

- `TauCeti.HodgeTate.conormal`: `ω_H := e*Ω¹_{H/S}`, over Spec R the augmentation cotangent space `I/I²` of the Hopf algebra of H.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace`: Over Spec R, `ω_H` is `TauCeti.Bialgebra.CotangentSpace` R A for `H = Spec A` (definitional for the affine carrier).
- `TauCeti.HodgeTate.conormal_map`: A homomorphism f: `H → H′` induces f*: `ω_{H′} → ω_H`, with `(id)* = id` and `(g∘f)* = f*∘g*`.
- `TauCeti.HodgeTate.conormal_baseChange`: For a base change `S′→S`, the canonical pullback map `ω_H⊗O_{S′}→ω_{H_{S′}}` is an isomorphism.
- `TauCeti.HodgeTate.conormal_rightExact`: For an fppf-exact sequence `0→H′→H→H″→0` of finite locally free commutative groups, `ω_{H″}→ω_H→ω_{H′}→0` is right exact; injectivity on the left is not asserted.
- `TauCeti.HodgeTate.conormal_finitePresentation`: `ω_H` is a finitely presented R-module, killed by the order |H| when |H| is a non-zero-divisor.
- `TauCeti.HodgeTate.conormal_eq_zero_iff_etale`: `ω_H = 0` if and only if H is étale over S.

**Checks.**

- `TauCeti.HodgeTate.conormal_constant_eq_zero`: For the constant group `(ℤ/p^n)_R` over any ring R, `ω = 0`.
- `TauCeti.HodgeTate.conormal_mu`: For `μ_{p^n} = Spec R[t]/(t^{p^n} − 1)`, `ω ≅ R/p^n R`, generated by the class of `t − 1`.
- `TauCeti.HodgeTate.conormal_alphaP`: For `α_p = Spec 𝔽_p[t]/(t^p)` over `𝔽_p`, `ω` is one-dimensional although `α_p` has order p and is not étale; `ω_{α_p} ≠ 0 = ω_{ℤ/p}`, so the order of H does not determine `ω`.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace_test`: For the Hopf algebra A of H over R, the `R-module ω_H` equals `(ker ε)/(ker ε)²`, i.e. `TauCeti.Bialgebra.CotangentSpace` R A.
- `ω_{ℤ/p^n} = 0` over any base (étale group).
- `ω_{μ_{p^n}}` over `ℤ_p` is `ℤ_p/p^n`, generated by the class of `t − 1 (= dt/t)`.
- `ω_{α_p}` over `𝔽_p` is one-dimensional, so `ω` does not detect the order of H alone.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, before Définition 3, PDF p. 7: Fargues fixes `ω_G` as the conormal sheaf of the unit section; the statement takes the same definition and computes it as the augmentation cotangent space.

*Needs:* `TauCeti.Bialgebra.CotangentSpace`; `TauCeti.Bialgebra.cotangentMap`; `TauCeti.Bialgebra.AugmentationIdeal`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `Ideal.Cotangent`; `KaehlerDifferential`; `AlgebraicGeometry.Scheme.relativeDifferentials`; `AlgebraicGeometry.Scheme.Modules`; `AlgebraicGeometry.Scheme.Modules.pullback`.

Applications include Fargues 2010, §2, Définition 3: `δ_G = Fitt₀ ω_G` defines the degree; Scholze–Weinstein 2013 and Fargues 2010, Définition 17: target of the Hodge–Tate map `α_G`: `G(O_C̄) → ω_{G^D}`; Layer `5 (ω^int, ω^mod)`: the modified lattices are sub-O⁺-modules of `ω_A = ω_{A[p^∞]}` generated by Hodge–Tate images.

<a id="section-0-2"></a>

### 0.2 The finite-level Hodge–Tate map

Construct `TauCeti.HodgeTate.hodgeTateMap`. Let H be a finite locally free commutative group scheme over a scheme S, with Cartier dual `H^D = Hom(H, 𝔾_m)`. A point `x ∈ H(S)` is, by Cartier duality, a homomorphism x: `H^D_S → 𝔾_{m,S}`; the Hodge–Tate map `α_H`: `H(S) → ω_{H^D}` sends x to x*(dt/t), the pullback of the invariant differential dt/t of `𝔾_m`. Over `S = Spec R`, x corresponds to a group-like element `g_x` of the Hopf algebra of `H^D` and `α_H(x)` is the class of `g_x − 1` in `I/I²`. `α_H` is a homomorphism of groups, natural in H and compatible with base change; its R-linearisation is `α_H ⊗ 1`: `H(R) ⊗_ℤ R → ω_{H^D}`. When H(S) is replaced by H(S′) for an S-scheme S′ (for `S = Spec O_K`, `S′ = Spec O_K̄`), the same formula gives `α_H`: `H(O_K̄) → ω_{H^D} ⊗ O_K̄`.

H finite locally free and commutative over S.

Convention (pinned): `α_H` goes from points of H to the conormal module of the dual `H^D`. For an abelian scheme A, applied to `H = A^∨[p^n]` (whose Cartier dual is `A[p^n]` by the Weil pairing) it gives `A^∨[p^n] → ω_A/p^n`, the finite level of the map `T_pA^∨ ⊗ C → ω_A` displayed in the roadmap.

Identify H(S) with `Hom(H^D, 𝔾_m)` by Cartier duality (Tau Ceti `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`) and, over Spec R, with the group-like units of the Hopf algebra of `H^D`.

Additivity: (gh `− 1) = (g − 1) + (h − 1) + (g − 1)(h − 1`) and the last term lies in `I²`, so `x ↦ [g_x − 1]` is additive (the Leibniz rule `TauCeti.Bialgebra.cotangentMap_mul`).

Naturality and base change follow from those of Cartier duality (cartierDualBaseChangeIso) and of `ω (0.1)`.

The interface consists of the following named results.

- `TauCeti.HodgeTate.hodgeTateMap`: `α_H`: `H(S) → ω_{H^D}`, `x ↦ x*(dt/t)`, through Cartier duality.
- `TauCeti.HodgeTate.hodgeTateMap_add`: `α_H(x + y) = α_H(x) + α_H(y)` and `α_H(0) = 0`.
- `TauCeti.HodgeTate.hodgeTateMap_apply_groupLike`: Over Spec R, `α_H(x)` is the class of `g_x − 1` in `I/I²`, `g_x` the group-like element of the Hopf algebra of `H^D` attached to x.
- `TauCeti.HodgeTate.hodgeTateMap_natural`: For f: `H → H′` with Cartier dual `f^D`: `H′^D → H^D`, `α_{H′}(f(x)) = (f^D)*(α_H(x))` in `ω_{H′^D}`, where `(f^D)*`: `ω_{H^D} → ω_{H′^D}`.
- `TauCeti.HodgeTate.hodgeTateMap_baseChange`: For `R → R′`, `α_{H_{R′}}` restricted to H(R) is `α_H` followed by `ω_{H^D} → R′ ⊗ ω_{H^D}`.
- `TauCeti.HodgeTate.hodgeTateLinear`: The linearisation `α_H ⊗ 1`: `H(R′) ⊗_ℤ R′ → R′ ⊗_R ω_{H^D}` for an R-algebra R′.

**Checks.**

- `TauCeti.HodgeTate.hodgeTateMap_constant`: For `H = (ℤ/p^n)_R`, `α_H(1)` is the class of `t − 1` in `ω_{μ_{p^n}} = R/p^n`, a generator.
- `TauCeti.HodgeTate.hodgeTateMap_mu_eq_zero`: For `H = μ_{p^n,R}`, `α_H = 0` because `ω_{H^D} = ω_{ℤ/p^n} = 0`.
- `TauCeti.HodgeTate.hodgeTateMap_depends_on_model`: Over `R = ℤ_p[ζ_p]` the groups `ℤ/p` and `μ_p` have isomorphic generic fibres, yet `α_{ℤ/p}(1)` generates `ω_{μ_p} ≅ R/p` while `α_{μ_p} = 0`: the Hodge–Tate map depends on the integral model, not only on the generic fibre.
- `TauCeti.HodgeTate.hodgeTateMap_cotangentMap`: Over Spec R, `α_H(x) = TauCeti.Bialgebra.cotangentMap R A(g_x)` for A the Hopf algebra of `H^D`.
- `α_{μ_{p^n}}`: `μ_{p^n}(R) → ω_{ℤ/p^n} = 0` is zero, and `α_{ℤ/p^n}`: `ℤ/p^n → ω_{μ_{p^n}} = R/p^n` sends 1 to dt/t.
- `α_H` is additive and natural in H.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §9.2, Définition 17, PDF p. 25: Fargues's Hodge–Tate map `α_G`: `G(O_K̄) → ω_{G^D} ⊗ O_K̄`, with the direction pinned here. [SW13](https://arxiv.org/abs/1211.6357), §5.1, Proposition 5.1.6 and its proof (arXiv:1211.6357v2), PDF pp. 49–50: The map `T_pG → ω_{G^∨}` sends a point, viewed as a map from the dual to `μ_{p^∞}`, to the pullback of dt/t. [AIP15](https://arxiv.org/abs/1212.3812), §3.2, the Hodge–Tate map (arXiv:1212.3812), PDF p. 12: AIP's definition `x ↦ x*(dt/t)` of the Hodge–Tate map of a finite flat group scheme.

*Needs:* [0.1](#section-0-1); `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`; `TauCeti.Bialgebra.cotangentMap_mul`; `IsGroupLikeElem`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `GroupLike`; `CategoryTheory.Grp`; [0.21](#section-0-21).

Applications include Fargues 2010, Théorème 7: its cokernel after `⊗ O_K̄` is bounded by `p^{1/(p−1)}`; Fargues 2011 and AIP 2015: the canonical subgroup is characterised through `α` of the dual; Layer 2: the Hodge–Tate exact sequence is built from `α`; Layer 5: `ω^int` and `ω^mod` are generated by the image of `α` at level `p^n`.

<a id="section-0-3"></a>

### 0.3 Functoriality, endomorphisms and polarisations of the Hodge–Tate map

Prove `TauCeti.HodgeTate.hodgeTateMap_compatibilities`. Let S be a scheme. (1) For a homomorphism f: `H → H′` of finite locally free commutative S-group schemes, `α_{H′} ∘ f = (f^D)* ∘ α_H` as maps `H(S) → ω_{H′^D}`. (2) If a ring `𝒪` acts on H by endomorphisms, `α_H` is `𝒪`-equivariant for the induced action on `ω_{H^D}` through the dual action a `↦ (a^D)*`. (3) For an abelian scheme A/S with polarisation `λ`: `A → A^∨` and `n ≥ 1`, write `e_n`: `A[p^n] × A^∨[p^n] → μ_{p^n}` for the Weil pairing; then, identifying `A[p^n]^D = A^∨[p^n]` by `e_n`, the maps `α_{A[p^n]}`: A[p^n](S) `→ ω_{A^∨}/p^n` and `α_{A^∨[p^n]}`: `A^∨`[p^n](S) `→ ω_A/p^n` satisfy `α_{A^∨[p^n]}(λx) = λ*(α_{A[p^n]}(x))` for `x ∈ A`[p^n](S), where `λ*`: `ω_{A^∨} → ω_A`; so `λ` exchanges the Hodge–Tate maps of A and `A^∨`. (4) The same holds for p-divisible groups with a quasi-polarisation `λ`: G → G^D (R07.1, p divisible cartier dual).

(3) uses the sign convention of the Weil pairing fixed in `AbelianSchemesAndArithmeticModuli` A3; with the opposite convention `α` is exchanged up to `−1`.

(1) and (2) are the naturality of 0.2 applied to f and to the endomorphisms.

(3) The polarisation identifies `A[p^n] → A^∨[p^n]` compatibly with Cartier duality and the Weil pairing (A3); apply (1) to `λ` and use `(λ^∨)|_{A[p^n]} = λ` up to the symmetry of `λ`.

(4) is (1) for the levels of `λ`.

**Checks.**

- For E an elliptic curve with its principal polarisation, `α_{E[p^n]}` and `α_{E^∨[p^n]}` coincide under `E ≅ E^∨`.
- For `𝒪_F` acting on a Hilbert–Blumenthal abelian scheme, `α` is 𝒪_F-linear, so its image is an `𝒪_F ⊗` R-submodule of `ω`.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §9.2, Définition 17, PDF p. 25: Fargues uses the functoriality of `α_G` in G throughout §9 (the Hodge–Tate triple is functorial).

*Needs:* [0.2](#section-0-2); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `AbelianSchemesAndArithmeticModuli` A3 (polarized weil pairing); `AbelianSchemesAndArithmeticModuli` A4 (p divisible group).

<a id="section-0-4"></a>

### 0.4 The Hodge–Tate map of a p-divisible group and its completed linearisation

Construct `TauCeti.HodgeTate.pDivisibleHodgeTateMap`. Let `C/ℚ_p` be complete algebraically closed and `G/O_C` a p-divisible group. The compatible character differentials `α_{G[p^n]}` give a ℤ_p-linear map `α_G:T_pG→ω_{G^D}`, using `ω_{G^D[p^n]}=ω_{G^D}/p^n` and p-adic completeness (0.25). Its O_C-linearisation `T_pG⊗O_C→ω_{G^D}` is natural in G. For a group descending to a mixed-characteristic valuation subfield K, it is equivariant for the continuous Galois action. The source is the Tate module of R07.1 and the target the conormal module of 0.25, not newly defined objects.

The conormal module over `O_C`, its finite-level reduction and its completeness are 0.25; R07.1’s complete-noetherian-local dimension statement does not apply to `O_C` directly.

The transition on `G[p^{n+1}]` is multiplication by p; conormal transition maps are the corresponding reductions on the dual group.

For a compatible Tate point `(x_n)`, take `α_{G[p^n]}(x_n)`; finite-level naturality identifies its reduction at every smaller level.

Use `ω_{G^D}≅lim_n ω_{G^D}/p^n` to form `α_G`. Linearisation is extension of scalars from `ℤ_p` to `O_C`.

Naturality and the Galois formula follow at each finite level and then by uniqueness in the separated inverse limit.

The interface consists of the following named results.

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap`: `α_G`: `T_pG(R) → ω_{G^D}`, the inverse limit of `α_{G[p^n]}`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mod`: `α_G mod p^n` equals `α_{G[p^n]}` composed with `T_pG → G[p^n]`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateLinear`: `α_G ⊗ 1`: `T_pG ⊗_{ℤ_p} O_C → ω_{G^D}` over `O_C`, and its C-linearisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_natural`: Natural in homomorphisms of p-divisible groups, 𝒪-linear for endomorphism actions, exchanged under a quasi-polarisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_galois`: For G over `O_K`, `α_G ⊗ 1` is Gal(K̄/K)-equivariant.

**Checks.**

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_QpZp`: For `G = ℚ_p/ℤ_p` over `O_C`, `α_G(1) = dt/t`, so `α_G ⊗ 1` is an isomorphism `ℤ_p ⊗ O_C ≅ ω_{μ_{p^∞}}`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mu`: For `G = μ_{p^∞}`, `α_G = 0`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_not_surjective_integrally`: For `G = E[p^∞]` with E supersingular over `O_C`, `α_G ⊗ 1` is not surjective: its cokernel is nonzero and killed by `p^{1/(p−1)} (0.5)`, so the integral map is not a split surjection.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_tate`: For G over the ring of integers of a complete discretely valued K with perfect residue field, `α_G ⊗ C`: `T_pG ⊗ C → ω_{G^D} ⊗ C` is the projection of Tate's decomposition T_pG ⊗ C ≅ (t_{G^D}(K)^∨ ⊗ C) ⊕ (t_G(K) ⊗ C(1)) (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (hodge tate p divisible)) onto its first summand, `t_{G^D}(K)^∨ = ω_{G^D} ⊗ K`.
- For `G = μ_{p^∞}` over `O_C`, `α_G`: `T_pμ_{p^∞} = ℤ_p(1) → ω_{ℚ_p/ℤ_p} = 0` is zero; for `G = ℚ_p/ℤ_p`, `α_G`: `ℤ_p → ω_{μ_{p^∞}} = O_C·dt/t` sends 1 to dt/t.
- For an abelian variety A with good ordinary reduction and `G = A[p^∞]`, the C-linearisation is surjective with kernel `T_p(G^∘) ⊗_{ℤ_p} C`, the Tate module of the connected (multiplicative) part, which is `Lie(G) ⊗ C(1)`; the kernel is not `T_p(G^∘) ⊗ C(1)`.

[SW13](https://arxiv.org/abs/1211.6357), §5.1, Proposition 5.1.6 and its proof (arXiv:1211.6357v2), PDF pp. 49–50: Scholze–Weinstein define the Hodge–Tate map of a p-divisible group over `O_C` as the limit of the finite-level maps.

*Needs:* [0.2](#section-0-2); [0.3](#section-0-3); [0.1](#section-0-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible tate module); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `PadicInt`; `PadicComplex`; `IsAdicComplete`; [0.25](#section-0-25); [0.23](#section-0-23).

Applications include Scholze–Weinstein 2013, §4: the Hodge–Tate sequence of a p-divisible group over `O_C`; Layer 2: the abelian Hodge–Tate sequence `T_pA^∨ ⊗ C → ω_A`; PerfectoidShimuraVarieties S1 (continuous hodge tate map): the period map is built from `α` on the tower.

<a id="section-0-5"></a>

### 0.5 Fargues's bound on the cokernel of the Hodge–Tate map

Prove `TauCeti.HodgeTate.farguesHodgeTateCokernel`. For a p-divisible `G/O_C`, put `α:T_pG⊗_{ℤ_p}O_C→ω_{G^D}`. For every `a∈O_C` with `v(a)≥1/(p−1)`, `a·coker α=0`. The integral Faltings complex `Lie(G)⊗O_C(1)→T_pG⊗O_C→ω_{G^D}` has zero composite and all its cohomology annihilated by every such a. Thus it becomes exact over C. For a finite locally free subgroup H of a p-divisible group G over `O_C` (for instance the subgroup `H_n ⊂ G[p^n]` generated by a level-structure vector at a point of good reduction), G/H is p-divisible, the map `T_p(G/H) ⊗ O_C → H(O_C) ⊗ O_C` and the map `ω_{(G/H)^D} → ω_{H^D}` are surjective and intertwine the two character maps, so `coker(α_H ⊗ 1: H(O_C) ⊗ O_C → ω_{H^D})` is a quotient of `coker(α_{G/H} ⊗ 1)` and is killed by every a with `v(a) ≥ 1/(p−1)`. The same estimate holds for every finite locally free commutative p-power group `H/O_C`: Raynaud's theorem (R07.1.40) embeds H, Zariski locally on `Spec O_C` and therefore globally because `O_C` is local, into an abelian scheme A with A/H an abelian scheme, so `H ⊂ A[p^N]` for N large and `A[p^∞]/H = (A/H)[p^∞]` is p-divisible.

`v(p)=1`; C is complete and algebraically closed; Lie and `ω` are finite free over `O_C (0.25)`.

Use the integral Faltings complex and annihilator estimate of Scholze CDM12 Theorem 4.13, together with the character description in Remark 4.14; this supplies both the zero composite and the integral cohomology bound.

Fargues FAR10 Theorem 7/FAR11 Theorem 2 give the character-cokernel bound in the stated valuation-ring setting. For an abstract finite group embed it by R07.1.40 and use the right-exact conormal sequence (0.22).

Invert p for the rational exactness. A bound on the final cokernel alone would not identify the middle kernel.

**Checks.**

- For `G = μ_p` over `O_K` the cokernel is `ω_{ℤ/p} = 0`; for `G = ℤ/p` the map is onto `ω_{μ_p} = O_K/p`.
- The bound is uniform: it depends neither on ht G nor on the ramification of K.
- For `H_n ⊂ G[p^n]` étale-locally cyclic inside the p-divisible group of a semi-abelian scheme with good reduction at a rank-one point, `coker(HT_{H_n} ⊗ 1)` is killed by `p^{1/(p−1)}`; Pilloni uses this to bound `deg H_n^D`.

[CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), Theorem 4.13 and Remark 4.14, PDF pp. 27–28: The integral complex has bounded cohomology and its last map is the differential of characters. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §9, Théorème 7, PDF p.26 (author copy; `p≠2`): The character map has uniformly bounded cokernel over an algebraically closed rank-one valued base. [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §5.3.2, Théorème 2, PDF pp.24–25 (author copy): Restates the integral Hodge–Tate bound used for canonical subgroups. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §9, Théorème 7 and its proof, PDF p. 26 (author copy): States, for `p ≠ 2`, that the cokernel of the character map of a finite flat group scheme is killed by elements of valuation at least `1/(p−1)`, and proves it by embedding the group into a p-divisible group and passing to the quotient. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §14.1, proof of Lemma 14.1.1, p. 92: Applies the finite bound to the cyclic subgroup `H_n` of `G[p^n]` generated by e₁.

*Needs:* [0.2](#section-0-2); [0.4](#section-0-4); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (oort tate classification); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.40; [0.22](#section-0-22).

<a id="section-0-6"></a>

### 0.6 Fargues's degree of a finite flat group scheme

Define `TauCeti.HodgeTate.farguesDegree`. Let K be a henselian rank-one valued field of characteristic zero, `O_K` its valuation ring, `v(p)=1`, and G a finite locally free commutative group of constant p-power `rank p^h`. Its finitely presented torsion conormal module has principal nonzero Fitting ideal `δ_G=Fitt₀(ω_G)`. Define `deg G=v(δ_G)∈ℝ` and, for `h>0`, `μ(G)=deg G/h`. In a cyclic presentation `ω_G≅⊕_i O_K/(x_i)`, `deg G=Σ_i v(x_i)`, without truncating at 1. The group-theoretic degree uses the shared Fitting theory; affine Fitting operations are those of current Tau Ceti.

G is generically étale, as holds for finite p-power groups in characteristic zero; finite-flat conormal presentations over possibly nondiscrete valuation rings are required.

The degree of a finitely presented torsion module over the valuation ring is 0.24.

Fitting ideals, their base change and their scheme-level sheaves are those of current Tau Ceti (`TauCeti.fittingIdeal`, `AlgebraicGeometry.Scheme.Modules.fittingIdeal`); their valuation over a nondiscrete valuation ring is 0.24.

By 0.24, `Fitt₀ω_G = (∏x_i)` for every cyclic decomposition `ω_G ≅ ⊕ O_K/x_i`, which proves the cyclic formula and presentation independence.

The co-Lie divisor formulation is identified with this ideal by 0.26 (3), not through a determinant of an endomorphism alone.

The interface consists of the following named results.

- `TauCeti.HodgeTate.discriminantDivisor`: `δ_G = Fitt₀ ω_G` as an invertible ideal of `O_S`, for G generically étale over S.
- `TauCeti.HodgeTate.farguesDegree`: `deg G := v(Fitt₀ ω_G) ∈ ℝ_{≥0}` for G finite flat over `O_K`.
- `TauCeti.HodgeTate.farguesDegree_eq_sum`: If `ω_G ≅ ⊕ O_K/x_i` then `deg G = Σ v(x_i)`.
- `TauCeti.HodgeTate.fargueSlope`: For a nonzero group of p-power `rank p^h`, `μ(G)=deg G/h`. The zero object has degree zero and is excluded from slope comparisons.
- `TauCeti.HodgeTate.farguesDegree_isogeny`: If `G = ker(f: A → B)` for an isogeny of abelian schemes or p-divisible groups over `O_K`, `deg G = v(det(f*: ω_B → ω_A))`.
- `TauCeti.HodgeTate.farguesDegree_monogenic`: For `G = Spec O_K[T]/(f)` with unit section `T = 0`, `deg G = v(f′(0)) = Σ_{x ∈ G(O_K̄)∖0} v(x)`.

**Checks.**

- `TauCeti.HodgeTate.farguesDegree_constant`: `deg (ℤ/p^n)_{O_K} = 0`.
- `TauCeti.HodgeTate.farguesDegree_mu`: `deg μ_{p^n, O_K} = n`, since `ω = O_K/p^n`.
- `TauCeti.HodgeTate.farguesDegree_not_length`: deg is not the `O_K-length` of `ω_G`: for K with value group `ℚ` and G with `ω_G ≅ O_K/p^{1/2}`, the length is infinite (`O_K` is not noetherian) while `deg G = 1/2`.
- `TauCeti.HodgeTate.farguesDegree_ellipticTorsion`: For E an elliptic curve over `O_K` with good reduction, deg E[p] = 1 (BT_1 of dimension 1).
- `deg (ℤ/p^n) = 0`, `deg μ_{p^n} = n`, `deg G[p^n] = n·dim G` for a p-divisible group G.
- For `G = Spec O_K[T]/(f)`, f monic with `f(0) = 0`, `deg G = v(f′(0))`.
- For a supersingular elliptic curve E over W(l), l algebraically closed of characteristic p, every subgroup of order p of E[p] over O_C (C the completion of an algebraic closure of W(l)[1/p]) has degree 1/(p+1). Indeed [p] on the formal group has linear coefficient of valuation 1, unit coefficient at `T^{p²}` and all coefficients in between divisible by p. Its Newton polygon gives every nonzero p-torsion point valuation `1/(p²−1)`, so `deg = v(f′(0)) = (p−1)/(p²−1)`. For the lift Ã with p-divisible group `μ_{p^∞} ⊕ E[p^∞] ⊕ ℚ_p/ℤ_p` this is the degree 1/(p+1) of the biconnected part `L⁰` of an order-p³ subgroup `L = L^m ⊕ L⁰ ⊕ L^{ét} ⊂ Ã[p]` used by Pilloni.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, Définition 3, PDF p. 7: Definition of the discriminant divisor `δ_G`. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §3, Définition 4, PDF p. 9: Definition of the degree. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), Introduction, PDF p. 2: For a kernel of an isogeny f: `A → B`, deg is the valuation of det f* on `ω`; used as a test. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §7.4.2, proof of Proposition 7.4.2.1, p. 48: Uses that the biconnected order-p part of a subgroup of the p-torsion of the supersingular lift has degree 1/(p+1), so that the pullback on invariant differentials has elementary divisors p and an element of valuation 1/(p+1).

*Needs:* [0.1](#section-0-1); `Valuation`; `ValuationSubring`; `Module.length`; [0.24](#section-0-24); [0.26](#section-0-26); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group).

Applications include Fargues 2010, §§4–9: slopes and the Harder–Narasimhan filtration of finite flat group schemes; Fargues 2011, Théorème principal: the canonical subgroup has degree `d − w`; Bijakowski–Pilloni–Stroh 2016 and Pilloni 2020, §§6–13: degree functions on Siegel varieties cut out the loci where `U_p` improves; Boxer–Pilloni (Siegel), §4.2: the divisors `D_i` and generic isomorphisms.

<a id="section-0-7"></a>

### 0.7 Additivity, duality and extreme values of the degree

Prove `TauCeti.HodgeTate.farguesDegree_properties`. Let G be finite flat commutative of p-power order over O_K (K, v as in 0.6). (1) For an exact sequence `0 → G₁ → G₂ → G₃ → 0` of such group schemes, `deg G₂ = deg G₁ + deg G₃` (over a general base, `δ_{G₂} = δ_{G₁} + δ_{G₃}`). (2) `deg G + deg G^D =` ht G (over a base where |G| is a non-zero-divisor, `δ_G + δ_{G^D} =` div |G|). (3) For a valued extension L/K, `deg(G ⊗_{O_K} O_L) = deg G`; for a flat `S′ → S`, `δ` commutes with pullback. (4) `0 ≤ deg G ≤` ht G; `deg G = 0` iff G is étale, and `deg G =` ht G iff G is of multiplicative type; for ht `G>0`, `μ(G^D) = 1 − μ(G)`. (5) A truncated Barsotti–Tate group of level n and dimension d has degree nd; in particular `deg G[p^n] = n·dim G` for a p-divisible group G, and, for `n≥1` and ht `G>0`, `μ(G[p^n]) = dim G /` ht G.

(2) over a general base needs |G| locally a non-zero-divisor on S.

(1) from the triangle of co-Lie complexes `ℓ_{G₃} → ℓ_{G₂} → ℓ_{G₁}` of 0.26 (4) (Fargues 2010, Lemme 1).

(2) locally write `G = ker(f: A → B)` for an isogeny of abelian schemes (Raynaud's embedding, R07.1.40); the Hodge filtration triangle `ℓ_G[−1] → H¹_dR(B) → H¹_dR(A) → ℓ^∨_{G^D}` of 0.26 (5) gives δ_G + δ_{G^D} = Div(det f* on H¹_dR) = div `deg f =` div |G| (Lemme 2).

(3) Lemme 3 and the valuation of a Fitting ideal under faithfully flat base change.

(4) from (2), `Fitt₀ ω_G ⊂ O_K`, and `ω_G = 0 ⇔ G` étale; (5) because `ω` of a `BT_n` of dimension d is free of rank d over `O_K/p^n`, by the argument of 0.25 (1) through Illusie's co-Lie criterion (Exemple 2).

**Checks.**

- `deg μ_p + deg ℤ/p = 1 =` ht.
- The trivial group has height and degree zero; it is both étale and multiplicative, and no slope identity is asserted for it.
- `deg E[p] = 1` for an elliptic curve E with good reduction, and E[p] is neither étale nor multiplicative when E is supersingular.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, Lemme 1, PDF p. 7: Additivity of `δ` on exact sequences. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §3, Lemme 4, PDF p. 9: Duality. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §3, Exemple 2, PDF p. 9: Extreme values. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §3, Exemple 2, PDF p. 9: Degree of a `BT_n`.

*Needs:* [0.6](#section-0-6); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible dimension); `AbelianSchemesAndArithmeticModuli` A4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.40; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11; [0.26](#section-0-26); `AbelianSchemesAndArithmeticModuli` A4 (abelian h1 de rham).

<a id="section-0-8"></a>

### 0.8 The degree increases along generic isomorphisms

Prove `TauCeti.HodgeTate.farguesDegree_genericIsomorphism`. Let f: `G → G′` be a homomorphism of finite flat commutative group schemes over `O_K` inducing an isomorphism of generic fibres. Then `deg G ≤ deg G′`, with equality if and only if f is an isomorphism; more precisely `deg G′ = deg G + (2/|G|)·χ(A, f*A′)` where `G = Spec A`, `G′ = Spec A′` and `χ(A, f*A′) = v(Fitt₀(A/f*A′)) ≥ 0`. Consequently, for `G′ ↪ G → G″` with the first map a closed immersion, the composite zero and `G/G′ → G″` a generic isomorphism, `deg G ≤ deg G′ + deg G″` with equality iff `G → G″` is flat (an fppf epimorphism). Over a discrete valuation ring the degree is strictly increasing on Raynaud's lattice of prolongations of a given generic group, and it is exchanged with ht `− deg` under Cartier duality.

K of characteristic 0 complete for v with `v(p) = 1`; f an isomorphism on generic fibres (equivalently f*: `A′ → A` injective with torsion cokernel).

Reduce to `S = Spec A₀` affine with free Hopf algebras; with M the matrix of f*: B₂ ↪ B₁ and `Q_i` the trace forms, `Q₂ = ᵗM Q₁ M`, so (by the trace discriminant being the norm of the different, with group different generated by the unit pullback δ_G (FAR10 Proposition 1)) δ_{G₂}^n = det(M)² δ_{G₁}^n (Proposition 2).

Take valuations (Proposition 3); `χ ≥ 0` with equality iff f* is onto, i.e. f is an isomorphism (Corollaire 3).

**Checks.**

- For the generic isomorphism `ℤ/p → μ_p` over `ℤ_p[ζ_p]` given by `1 ↦ ζ_p`, `deg ℤ/p = 0 < 1 = deg μ_p`, and the map is not an isomorphism.
- Boxer–Pilloni use the equality case: a generic isomorphism `H₁ → H₂` with `deg H₁ = deg H₂` is an isomorphism.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, Proposition 2, PDF p. 8: The precise change of `δ` along a generic isomorphism. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §3, Corollaire 3, PDF p. 10: Equality iff isomorphism. [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.2.8, proof of Proposition 4.2.8 (author copy), PDF p. 45: Boxer–Pilloni use the equality case in the proof of Proposition 4.2.8.

*Needs:* [0.6](#section-0-6); [0.7](#section-0-7); [0.20](#section-0-20); [0.24](#section-0-24); [0.26](#section-0-26).

<a id="section-0-9"></a>

### 0.9 The divisor `D_H` of a generically étale finite flat group scheme

Define `TauCeti.HodgeTate.farguesDivisor`. For a finite locally free commutative group G/S, assume its co-Lie complex is perfect of amplitude `[−1,0]` and rank zero, and that its generic étale locus meets every component. The determinant section defines the effective Cartier divisor `δ_G`, whose invertible ideal is `Fitt₀ω_G`. Its support is the non-étale locus, δ_G+δ_{G^D}=div(rank G), and it commutes with every base change on which the defining section remains regular. On a valuation chart its value is deg G. Equality with a pointwise divisor may be checked at codimension one only on an integral normal noetherian scheme; on formal/valuation bases use the affine Fitting and determinant identities instead.

Use syntomicity, co-Lie determinants and duality from 0.26; require the determinant section to be regular for an effective Cartier divisor.

The finite flat rank is locally constant and regular as a scalar for the duality divisor. Normality without noetherianity is not a codimension-one detection theorem.

Use the co-Lie determinant and its Fitting comparison (0.26 (3)); the vanishing locus of `ω_G` is the étale locus.

Apply the co-Lie triangle and the abelian-isogeny Hodge triangle of 0.26 (4)–(5) to obtain additivity and Cartier duality (FAR10 §2 Lemmes 1–2).

For base change use the Fitting identity plus preservation of regularity; the divisor identity is not asserted when the pullback section is a zero divisor.

The interface consists of the following named results.

- `TauCeti.HodgeTate.farguesDivisor`: `D_H = Fitt₀ ω_H` as an effective Cartier divisor of X.
- `TauCeti.HodgeTate.farguesDivisor_support`: X ∖ Supp `D_H` is the largest open over which H is étale.
- `TauCeti.HodgeTate.farguesDivisor_add_dual`: `D_H + D_{H^D} = V(p^h)` for H of order `p^h`.
- `TauCeti.HodgeTate.farguesDivisor_pullback`: Base change pulls back `δ_G` whenever the pulled-back determinant section stays regular; in particular flat base change preserves the effective Cartier divisor.
- `TauCeti.HodgeTate.farguesDivisor_rankOne`: At x: `Spec V → X` with V rank one, `v(p) = 1`, `x*D_H = (a)` with `v(a) = deg H_x`.

**Checks.**

- `TauCeti.HodgeTate.farguesDivisor_mu`: `D_{μ_{p^n}} = V(p^n)`.
- `TauCeti.HodgeTate.farguesDivisor_etale`: `D_H = 0` for H étale over X.
- `TauCeti.HodgeTate.farguesDivisor_not_reduced`: `D_{μ_p} = V(p)` is not the reduced special fibre when `X = Spf ℤ_p[p^{1/2}]`: there `V(p) = 2·V(p^{1/2})`, so `D_H` records multiplicities, not only support.
- `D_{μ_{p^n}} = V(p^n)`, `D_{ℤ/p^n} = ∅`.
- On a normal formal model, `deg H_x` is a locally constant function on the rigid generic fibre exactly when `D_H` is locally a rational multiple of V(p) (that is, `b·D_H = a·V(p)` locally for integers a, `b > 0`); over `Spf ℤ_p[p^{1/2}]`, `D_H = V(p^{1/2})` has constant degree 1/2 although it is not an integral multiple of V(p).

[BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.1.8 (author copy), PDF p. 41: Boxer–Pilloni §4.1.8: the divisor `D_H`, its complement and `D_H + D_{H^D} = V(p^h)`.

*Needs:* [0.6](#section-0-6); [0.7](#section-0-7); AdicSpacesPartIII R2 (admissible formal scheme); `AlgebraicGeometry.Scheme`; [0.26](#section-0-26).

Applications include Boxer–Pilloni (Siegel), §§4.1.8, 4.2.7: the divisors `D_i` of the Siegel Hecke correspondences and `D_i + D_{2g+1−i} = V(p^n)`; BCGP 2021, §6.5.1: `δ_H` at rank-one points computes Fargues's degree.

<a id="section-0-10"></a>

### 0.10 The divisor of an isogeny of semi-abelian schemes and the section `δ_H`

Construct `TauCeti.HodgeTate.isogenyDivisor`. Let X be a normal ℤ_p-flat scheme (or formal scheme) and f: `G → G′` an isogeny of semi-abelian schemes over X which is étale after inverting p. `Lie(f)`: `Lie G → Lie G′` is a map of locally free modules of the same rank; its determinant `det Lie(f)` is a section of `det Lie(G)^{-1} ⊗ det Lie(G′)`, and the divisor of f is `D_f :=` div(det `Lie(f)`). `D_f` is an effective Cartier divisor, `D_{g∘f} = D_f + D_g`, and over the open where ker f is finite `D_f = D_{ker f} (0.9)`. Over an analytic adic space 𝒳 with such an isogeny on a formal model, `δ_H := det Lie(f)` for `H = ker f` is a section with `v_x(δ_H) = deg H_x` at each rank-one point x for which the specialised kernel `H_x` is finite flat over `O_{C_x}`.

ker f is in general only quasi-finite and flat at the boundary (`ShimuraCompactifications` C4 (extended isogeny kernel)), so `D_f` is defined through `Lie(f)`, not through a finite group scheme.

X normal and ℤ_p-flat, f étale after inverting p (so `det Lie(f)` is a non-zero-divisor).

Lie G, Lie G′ are locally free of rank dim G (semi-abelian, C4 (semi abelian scheme)); `det Lie(f)` is a non-zero-divisor because f is étale after inverting p.

Additivity: `Lie(g∘f) = Lie(g)∘Lie(f)`.

Where `ker f = H` is finite, `ω_H = coker(f*: ω_{G′} → ω_G)`, so `Fitt₀ ω_H = (det f*) = (det Lie f)` (Fargues 2010, introduction).

At rank-one points where the specialised kernel is finite flat, 0.9 gives `v_x(δ_H) = deg H_x`; no degree of a non-finite kernel is asserted.

The interface consists of the following named results.

- `TauCeti.HodgeTate.isogenyDivisor`: `D_f :=` div(det `Lie(f)`) for an isogeny f of semi-abelian schemes, étale after inverting p.
- `TauCeti.HodgeTate.isogenyDivisor_comp`: `D_{g∘f} = D_f + D_g`.
- `TauCeti.HodgeTate.isogenyDivisor_eq_farguesDivisor`: Over the open where ker f is finite flat, `D_f = D_{ker f}`.
- `TauCeti.HodgeTate.deltaSection`: `δ_H := det Lie(f)` on an analytic adic space with a formal model; `v_x(δ_H) = deg H_x` when `H_x` is finite flat over the valuation ring at x.
- `TauCeti.HodgeTate.isogenyDivisor_mulP`: `D_{[p]} = V(p^{dim G})`.

**Checks.**

- `TauCeti.HodgeTate.isogenyDivisor_id`: `D_{id} = 0`.
- `TauCeti.HodgeTate.isogenyDivisor_mulP_test`: For [p] on an abelian scheme of relative dimension g, `D_{[p]} = V(p^g)`.
- `TauCeti.HodgeTate.isogenyDivisor_kernel_not_finite`: The quotient of the Tate curve by `μ_p` extends on the toric chart as `t ↦ t^p`, has finite flat kernel `μ_p`, and `D_f = V(p)`. It is not a counterexample to `D_f = D_{ker f}`; this identity requires finite flatness of the kernel.
- For `f = [p]` on an abelian scheme of dimension g, `D_f = V(p^g)`.
- For the Tate curve, the quotient by `μ_p ⊂ 𝔾_m` has `D_f = V(p) = D_{μ_p}`, while over `ℤ_p[[q^{1/p}]]` the quotient by the étale subgroup generated by `q^{1/p}`, the isogeny `Tate(q) → Tate(q^{1/p})` induced by the identity of `𝔾_m`, has `D_f = 0` although its kernel is not finite over the cusp.

[PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §14.1 (author copy), PDF p. 92: Pilloni define the divisor of an isogeny of semi-abelian schemes by `det Lie(f)`. [BCGP21](https://arxiv.org/abs/1812.09269), §6.5.1 (arXiv:1812.09269v3), PDF p. 154: BCGP §6.5.1: the section `δ_H` and `v_x(δ_H) = deg H_x`. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §14.3 (author copy), PDF p. 93: Pilloni's section `δ` from the determinant of the differential of an isogeny.

*Needs:* [0.9](#section-0-9); `ShimuraCompactifications` C4 (semi abelian scheme); `ShimuraCompactifications` C4 (extended isogeny kernel); `LinearMap.det`.

Applications include Boxer–Pilloni (Siegel), §4.2: the divisors `D_i` of the Hecke correspondences, `D_i + D_{2g+1−i} = V(p^n)` (in HigherHidaAndColemanTheory); BCGP 2021, §6.5: the degree function on the Klingen tower via `δ_H`.

<a id="section-0-11"></a>

### 0.11 The Hodge–Tate map of a group of multiplicative type is an isomorphism

Prove `TauCeti.HodgeTate.multiplicativeHodgeTateIso`. Let H/R be finite locally free and étale-locally `μ_{p^n}^r`, with Cartier dual the étale sheaf M locally constant with fibre `(ℤ/p^n)^r`. The sheaf character map `M⊗_ℤ𝒪_S→ω_H` is an isomorphism. On a chosen split chart R′ it is the isomorphism `(ℤ/p^n)^r⊗_ℤR′→ω_H⊗_RR′` induced by the constant character lattice. This holds on disconnected charts too; the tensor of the group of all global sections `H^D(R′)` with R′ is a different module. In particular the universal multiplicative subgroup on a Siegel or Hilbert–Siegel chart has this sheaf Hodge–Tate isomorphism.

H étale-locally of multiplicative type `μ_{p^n}^r`; no hypothesis on p.

Use the locally constant character sheaf, or its chosen constant fibre on a split chart, rather than all global sections of that sheaf.

Reduce étale-locally to `H = μ_{p^n}^r`, `H^D = (ℤ/p^n)^r`; the standard basis maps to the r forms `dt_i/t_i`, a basis of ω_H ≅ (R/p^n)^r (0.2, test hodgeTateMap_constant).

Both sides commute with étale base change (0.2, 0.1).

**Checks.**

- For `H = μ_{p^n}`, `α_{ℤ/p^n}(1) = dt/t` generates `ω_{μ_{p^n}} = R/p^n`.
- For `R′=𝔽_p×𝔽_p` and `H=μ_p`, `M⊗R′≅R′`, while `H^D(R′)≅(ℤ/p)^2` and `H^D(R′)⊗R′≅(R′)^2`. The latter cannot be the source of the claimed isomorphism.

[PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §9.4 (author copy), PDF p. 56: Pilloni: `HT ⊗ O` is an isomorphism for `H_n` étale-locally `μ_{p^n}`.

*Needs:* [0.2](#section-0-2); [0.1](#section-0-1); [0.21](#section-0-21).

<a id="section-0-12"></a>

### 0.12 Normalized determinant pullback for multiplicative isogenies and its boundary application

Prove `TauCeti.HodgeTate.normalizedMultiplicativePullback_det`. Let S be a scheme on which p is locally nilpotent, or a p-adic formal scheme, and let G, G′ be multiplicative p-divisible groups of height h over S with étale ℤ_p-local character sheaves `T = X*(G)` and `T′ = X*(G′)`, free of rank h, so that `G = Hom(T, μ_{p^∞})`. Then `ω_G ≅ T ⊗_{ℤ_p} ω_{μ_{p^∞}}`, a character `χ` pulling dt/t back to `χ*(dt/t)`, and `det ω_G ≅ det T ⊗ ω_{μ_{p^∞}}^{⊗h}`. Let `λ`: `G → G′` be an isogeny and `λ₀ = X*(λ)`: `T′ → T`. Locally on S write `det λ₀ = p^r u` with `r ≥ 0` an integer and u a unit of the rank-one ℤ_p-lattice map `det T′ → det T`, and define the normalized pullback `λ̃*`: `det ω_{G′} → det ω_G` as `u ⊗ id`, the division by `p^r` being made on the ℤ_p-lattice before tensoring with `O_S`. Then (1) `λ̃*` is an isomorphism, independent of the local choices, compatible with base change, étale descent and composition `((μ∘λ)~* = λ̃*∘μ̃*)`; (2) `det(λ*) = p^r λ̃*` on `det ω`; (3) over an 𝔽_p-scheme, the Hasse invariant of a multiplicative group is a nowhere-vanishing section, and `λ̃*(Ha(G′)) = Ha(G)`, although `det(λ*) = 0` when `r > 0`. On the boundary charts of a toroidal compactification apply this to the toric part `T_Y[p^∞] = Hom(X, μ_{p^∞})` of the semi-abelian scheme, X the character sheaf of the degeneration data (`ShimuraCompactifications` C4, polarized degeneration data), and to the maps between toric parts induced by isogenies of semi-abelian schemes.

S as stated; G, G′ multiplicative of the same height; `λ` an isogeny. The factorization `det λ₀ = p^r u` does not say `λ₀ =` p·(automorphism): arbitrary invariant factors are allowed.

`ω_G = T ⊗ ω_μ`: reduce étale locally to `G = μ_{p^∞}^h`, where the coordinate characters give the basis dt_i/t_i (0.11 at each finite level, then 0.25 in the limit over a p-adically complete base); the identification is canonical because it is the pullback of dt/t along characters.

(1)–(2): `det λ* = det(λ₀ ⊗ id) = (det λ₀) ⊗ id` on `det T′ ⊗ ω_μ^{⊗h} → det T ⊗ ω_μ^{⊗h}`, and `det λ₀ = p^r u` in the ℤ_p-lattice; independence of choices because r is the p-adic valuation of `det λ₀` and u is then determined; composition multiplies determinants.

(3): Verschiebung of `μ_{p^∞}` is an isomorphism and acts on `ω_μ` by `dt/t ↦ (dt/t)^{(p)}`, so for an integral basis e of `det T ⊗ ω_μ^{⊗h}`, `Ha(G) = e^{−1} ⊗ e^{(p)}` under `det ω^{(p)} = (det ω)^{⊗p} (R07.2.21)`. Changing e by a p-adic unit changes this by `u^{p−1} ≡ 1` on `𝔽_p`, so `Ha(G)` is canonical, and `λ̃*` carries e′ to the unit multiple u·e, hence `Ha(G′)` to `Ha(G)`.

Boundary application: `ShimuraCompactifications` C4 (polarized degeneration data) supplies the torus with its character sheaf X on degeneration charts; its p-power torsion is the multiplicative p-divisible group with character sheaf `X ⊗ ℤ_p`, and an isogeny of semi-abelian schemes over the chart restricts to the toric parts (the semi-abelian Verschiebung of `ShimuraCompactifications` C4 on the split torus).

**Checks.**

- For `λ = [p]` on `μ_{p^∞}`, `λ* = p` on `ω` and `λ̃* = id`.
- For `λ = id × [p]`: `μ_{p^∞}² → μ_{p^∞}²`, `det λ₀ = p`, so `r = 1` and `λ̃* = id` on `det ω`, while `det λ* = p`; `λ₀` is not p times an automorphism.
- Over `𝔽_p`, `det λ* = 0` for `λ = [p]` on `μ_{p^∞}`, while `λ̃* = id` preserves `Ha(μ_{p^∞}) = (dt/t)^{⊗(p−1)}`: the unnormalized pullback loses the Hasse invariant.

[PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §6.3.4, Lemma 6.3.4.1 (author copy), PDF p. 34: the normalized pullback of the determinant of the conormal sheaf along isogenies of multiplicative p-divisible groups, through the character lattices, preserving the Hasse invariant; the character/cocharacter variance is the one fixed in the statement.

*Needs:* [0.1](#section-0-1); [0.11](#section-0-11); [0.21](#section-0-21); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.21; `ShimuraCompactifications` C4 (polarized degeneration data); `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); `ShimuraCompactifications` C4 (constructible character sheaf).

<a id="section-0-13"></a>

### 0.13 p-power torsion of semi-abelian schemes on degeneration charts

Construct `TauCeti.HodgeTate.semiAbelianTorsion`. For a semi-abelian S-group G with generic abelian dimension g, `G[p^n]` is a quasi-finite flat kernel; it need not be finite of constant abelian rank at the boundary. On a fixed complete henselian degeneration chart, the finite part is controlled by `0→T[p^n]→G̃[p^n]→B[p^n]→0`, with T of rank r and B of dimension `g−r`, and has `rank p^{n(2g−r)}`. The polarized degeneration one-motive `M=[Y→G̃]`, built from the polarized relative degeneration data of `ShimuraCompactifications` C4, restores the uniformizing lattice piece: `0→G̃[p^n]→M[p^n]→Y/p^n→0`; the full finite-level carrier and overlap data must be those supplied on the chosen full-level chart. At the generic fibre `T_pA` is an extension of `T_pG̃` by `Y⊗ℤ_p`. The character-differential map on the finite part factors through the abelian quotient and is zero on the toric Tate submodule because `ω_{T[p^n]^D}=0`.

The assertions about finite parts are on the henselian formal/Raynaud charts of R07.1 and C4, not for an arbitrary quasi-finite kernel over an arbitrary S.

The lattice Y and dual torus characters are distinguished; a polarization identifies them only through its specified pairing.

Cartier duality applies to the finite locally free pieces and the supplied one-motive torsion, never to the whole quasi-finite boundary kernel by fiat.

Import the finite-part/Raynaud chart descriptions and the polarized one-motive from C4; the toric and abelian ranks give the displayed finite-part rank.

Use the exact torsion sequences and then the inverse-limit transition maps to obtain the Tate-module extension by `Y⊗ℤ_p`.

Dualize the finite-part sequence and use right exactness of conormal modules; the conormal of the constant dual of `T[p^n]` vanishes, so `α` kills the toric Tate submodule.

The interface consists of the following named results.

- `TauCeti.HodgeTate.semiAbelianTorsion`: The quasi-finite flat kernel `G[p^n]`, with its separate finite locally free part on the supplied henselian chart; this is not a constant-height p-divisible family across strata.
- `TauCeti.HodgeTate.semiAbelianTorsion_finitePart_exact`: `0 → T[p^n] → G[p^n]^f → B[p^n] → 0` on a stratum Z of torus rank r.
- `TauCeti.HodgeTate.semiAbelianTorsion_card`: The finite part has order `p^{n(2g−r)}` on Z.
- `TauCeti.HodgeTate.semiAbelianTateModule_extension`: For the supplied uniformization `A^an=G̃^an/Y`, `0→T_pG̃→T_pA→Y⊗ℤ_p→0` is exact on the generic fibre.
- `TauCeti.HodgeTate.semiAbelianHodgeTate_toric`: `α` vanishes on the toric piece `T[p^n]`, and the Hodge–Tate map of the dual of `T[p^n]` is the isomorphism of 0.11 onto `ω_{T[p^n]}`.

**Checks.**

- `TauCeti.HodgeTate.semiAbelianTorsion_abelian`: For r = 0 (G abelian) the construction is `A[p^n]`, finite locally free of order `p^{2ng}`.
- `TauCeti.HodgeTate.semiAbelianTorsion_torus`: For `G = 𝔾_m^g` a split torus, `G[p^n] = μ_{p^n}^g`, of degree ng.
- `TauCeti.HodgeTate.semiAbelianTorsion_not_constant_height`: For the Tate curve over `ℤ_p[[q]]`, E[p] is not finite over `q = 0`: its finite part there has order p, not `p²`; a constant-height p-divisible group over the chart does not exist.
- For the Tate curve `𝔾_m/q^ℤ` over `ℤ_p((q))`, `E[p^n] = μ_{p^n}` extended by `ℤ/p^n` generated by `q^{1/p^n}`, and over the cusp only `μ_{p^n}` remains finite.

[SCH15](https://arxiv.org/abs/1306.2070), §3.3, Proposition 3.3.1 (arXiv v2, III.3.1), PDF p. 54: Scholze, Proposition 3.3.1: the Hodge–Tate filtration through the Raynaud extension of the connected Néron model. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §12.2.1 (author copy), PDF p. 74: Pilloni: HT over the toroidal boundary of `𝔛(p^n)`.

*Needs:* [0.2](#section-0-2); [0.11](#section-0-11); `ShimuraCompactifications` C4 (semi abelian scheme); `ShimuraCompactifications` C4 (semiabelian tate module); `ShimuraCompactifications` C4 (extended isogeny kernel); `ShimuraCompactifications` C4 (formal universal degeneration); `ShimuraCompactifications` C4 (polarized degeneration data); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (finite part of quasi finite group); `ShimuraCompactifications` C4; [0.23](#section-0-23).

Applications include Scholze 2015, Proposition 3.3.1 and Lemma 3.3.2: Hodge–Tate filtration and Hasse invariant at boundary points; Pilloni–Stroh 2016, Proposition 1.2; Pilloni 2020 p. 74: extension of HT over the toroidal boundary; `ShimuraCompactifications` C6 (hilbert hasse boundary comparison): the Hilbert Hasse ideal at the boundary.

<a id="section-0-14"></a>

### 0.14 The Hasse invariant of a semi-abelian scheme

Construct `TauCeti.HodgeTate.semiAbelianHasse`. Let S be an 𝔽_p-scheme and G a semi-abelian scheme of relative dimension g over S, with `ω_G = e*Ω¹_{G/S}` (locally free of rank g) and `det ω_G` its Hodge line. Let `G^{(p)}` be the pullback of G along the absolute Frobenius of S. The Verschiebung V: `G^{(p)} → G` (the Verschiebung of the smooth commutative group, compatible with Frobenius and multiplication by p; on the abelian locus it can also be constructed by duality, and on degeneration charts through the Raynaud extension) induces V*: `ω_G → ω_{G^{(p)}} ≅ ω_G^{(p)}`, and `Ha(G/S) := det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)})`. For `G = A` abelian this is Scholze's `Ha(A/S)`, and it equals `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2's Hasse invariant `Ha(A[p])` of the BT₁ A[p] under `ω_{A[p]} = ω_A/p`. On a split torus `𝔾_m^g`, V* is an isomorphism and Ha is a unit; on a degeneration chart Ha(G) = Ha(B) ⊗ (unit of the torus part) through `det ω_G ≅ det ω_T ⊗ det ω_B`.

The Hasse invariant `Ha(G) = det V*` of a BT₁ over any 𝔽_p-scheme, Fargues's isomorphism LF and the BT₁ Hodge–Tate sequence are `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2's; this construction owns only the semi-abelian and boundary extension and its comparison with R07.2.

S of characteristic p; semi-abelian schemes and their degeneration data from `ShimuraCompactifications` C4.

A general semi-abelian scheme has no dual semi-abelian scheme of the same kind. The existence and base-change compatibility of V over an arbitrary 𝔽_p-base, the determinant section, its value on split tori and its factorization on strata of constant torus rank are proved by `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison) (`ShimuraCompactifications` C4). This construction names the section `Ha(G/S)` and carries its API and tests; the identification `V_A = (F_{A^∨})^∨` for abelian schemes is 0.27.

On the abelian locus, V is the dual of the Frobenius of the dual abelian scheme and V* on `ω_A` agrees with V* on `ω_{A[p]} = ω_A/p (0.27)`.

On a chart, the Raynaud extension `0 → T → G̃ → B → 0` gives `0 → ω_B → ω_G̃ → ω_T → 0`; V is compatible with it, and on a split torus V is the identity of `𝔾_m^g` after Frobenius twist, so its determinant on `ω_T` is a unit.

Glue: the two descriptions agree on overlaps because both are det V* on ω_G (C4, homomorphism extension).

The interface consists of the following named results.

- `TauCeti.HodgeTate.semiAbelianHasse`: `Ha(G/S) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)})`.
- `TauCeti.HodgeTate.semiAbelianHasse_eq_bt1Hasse`: For `G = A` abelian, `Ha(A/S) = Ha(A[p])` of R07.2 under `ω_{A[p]} = ω_A/p`.
- `TauCeti.HodgeTate.semiAbelianHasse_baseChange`: Ha commutes with base change `S′ → S`.
- `TauCeti.HodgeTate.semiAbelianHasse_torus`: On a split torus Ha is a unit (det V* is an isomorphism on `ω_T`); this restates for the named section the split-torus value proved in `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison).
- `TauCeti.HodgeTate.semiAbelianHasse_raynaud`: On a degeneration chart, `Ha(G) = Ha(B)·u` with u a unit, through `det ω_G ≅ det ω_T ⊗ det ω_B`; the factorization is the one proved in `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison), transported to the named section.
- `TauCeti.HodgeTate.semiAbelianHasse_isUnit_iff`: `Ha(G/S)` is a unit iff every geometric fibre is ordinary (0.15).

**Checks.**

- `TauCeti.HodgeTate.semiAbelianHasse_tateCurve`: For the Tate curve over `𝔽_p((q))`, `Ha = 1` with respect to the canonical differential dt/t.
- `TauCeti.HodgeTate.semiAbelianHasse_torus_test`: For `G = 𝔾_m^g` over S, `Ha(G/S)` is a unit.
- `TauCeti.HodgeTate.semiAbelianHasse_supersingular`: For a supersingular elliptic curve over `𝔽̄_p`, `Ha = 0`: Ha is not a unit on every fibre, and the Hasse invariant detects supersingularity through V*, not through a count of points.
- `TauCeti.HodgeTate.semiAbelianHasse_bt1`: For A abelian, `Ha(A/S)` equals `R07.2's Ha(A[p])`.
- For an ordinary elliptic curve Ha is a unit, for a supersingular one `Ha = 0`.
- For the Tate curve, `Ha = 1` in the q-expansion normalisation.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, before Lemma 3.2.5, p. 33 (arXiv v2): Scholze's definition of `Ha(A/S)` from Verschiebung. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, before Lemma 3.2.5, p. 33 (arXiv v2): The name and the section of `ω^{⊗(p−1)}`.

*Needs:* [0.1](#section-0-1); [0.13](#section-0-13); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `ShimuraCompactifications` C4 (semi abelian scheme); `ShimuraCompactifications` C4 (homomorphism extension); [0.27](#section-0-27); `LinearMap.det`; `Module.Invertible`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality); `AbelianSchemesAndArithmeticModuli` A2 (normalized poincare comparison); `AbelianSchemesAndArithmeticModuli` A2 (polarization representatives and graph); `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); `ShimuraCompactifications` C4 (constructible character sheaf).

Applications include Scholze 2015, §3.2: Hasse domains `𝒳(ε) = {|Ha| ≥ |p|^ε}` and canonical subgroups; `ShimuraCompactifications` C6 (hilbert hasse boundary comparison): Hilbert Hasse ideal at the boundary (split-torus Verschiebung determinant a unit); PerfectoidShimuraVarieties S1 (siegel finite level spaces): Siegel Hasse domains; Layer 3: the Hasse neighbourhoods on which canonical subgroups exist.

<a id="section-0-15"></a>

### 0.15 The Hasse invariant is invertible exactly on the ordinary locus

Prove `TauCeti.HodgeTate.hasseInvariant_ordinaryLocus`. Let S be an 𝔽_p-scheme and `A → S` an abelian scheme of dimension g. Then `Ha(A/S)` is invertible if and only if A is ordinary, i.e. for every geometric point x̄ of S, A[p](x̄) has `p^g` elements. For a semi-abelian G with abelian part B on a stratum, `Ha(G/S)` is invertible at x̄ iff `B_x̄` is ordinary.

S of characteristic p.

Ha invertible ⇔ V: `A^{(p)} → A` is an isomorphism on tangent spaces ⇔ V is finite étale ⇔ ker V has `p^g` geometric points over every `x̄ (deg V = p^g)`.

Since `VF = p` and F is purely inseparable, A[p](x̄) `= (ker V)(x̄)`.

The semi-abelian statement follows from `0.14 (Ha(G) = Ha(B)·unit)`.

**Checks.**

- The Tate curve is ordinary: Ha is a unit near the cusp.
- A supersingular elliptic curve has `Ha = 0`.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, Lemma 3.2.5, p. 33 (arXiv v2): Lemma 3.2.5: invertible iff ordinary. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, proof of Lemma 3.2.5, p. 33: The key step of the proof.

*Needs:* [0.14](#section-0-14); [0.27](#section-0-27); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality).

<a id="section-0-16"></a>

### 0.16 The Hasse invariant on toroidal and minimal compactifications

Prove `TauCeti.HodgeTate.hasseInvariant_minimalCompactification`. For a neat prime-to-p Siegel moduli scheme `X/ℤ_(p)` and its normal toroidal and minimal compactifications, the section Ha of `(det ω)^{⊗(p−1)}` on `X_{𝔽_p}` extends by semi-abelian Verschiebung to the toroidal space and descends to the minimal space. Descent uses the descended determinant Hodge line and the structure-sheaf pushforward over the special fibre. At a boundary stratum, after the torus determinant trivialization, the value is Ha of the abelian part; toric directions contribute a unit. For `g=1` it takes value 1 in the Tate-cusp normalization. The HBAV version uses the separate Hilbert boundary model of `ShimuraCompactifications` C6.

The toroidal and minimal models, the descended Hodge line and special-fibre pushforward are from C5, with its prime and fan restrictions.

A boundary with positive-dimensional abelian part need not be ordinary; only the torus factor has unit Hasse invariant.

Apply semiAbelianHasse on the universal semi-abelian toroidal scheme.

Use `π_*O_{X^tor,𝔽_p}=O_{X*,𝔽_p}` and projection formula for the descended Hodge line; this proves special-fibre descent directly, without a blanket normality/Hartogs assertion on every normalized model.

Use the Raynaud determinant formula at the boundary and the Tate-cusp computation.

**Checks.**

- For `g = 1`, Ha extends to the cusps with value 1 (the Tate curve is ordinary).
- Ha is a section of an ample line bundle on `X*_{𝔽_p}`, so its non-vanishing locus is affine.

[SCH15](https://arxiv.org/abs/1306.2070), §III.2.2, PDF pp. 37–39; Lemma III.3.2, PDF p. 54: The compactified Hasse section and its value in the abelian part of a boundary degeneration.

*Needs:* [0.14](#section-0-14); [0.15](#section-0-15); `ShimuraCompactifications` C5 (integral toroidal space); `ShimuraCompactifications` C5 (integral minimal space); `ShimuraCompactifications` C5 (minimal hodge ampleness); `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); `ShimuraCompactifications` C4 (constructible character sheaf).

<a id="section-0-17"></a>

### 0.17 The finite-level Hodge–Tate map over the toroidal boundary

Prove `TauCeti.HodgeTate.hodgeTate_boundaryExtension`. On the normal full-level-p^n toroidal Siegel model, the finite-level character-differential map extends as a morphism `(ℤ/p^n)^{2g}⊗O→ω_G/p^n`. On each cusp chart it is computed using the polarized one-motive `[Y→G̃]`; the toric character piece vanishes and the abelian character differential descends from the base of the torus bundle. The lattice piece is handled by the dual one-motive pairing. The chart maps agree integrally modulo `p^n` by their functorial one-motive description and cone refinements. The models are the Siegel ones over `ℤ_(p)` with neat prime-to-p level; Hilbert–Siegel models of GSp₄ over a totally real field are not treated here.

Use the normal full-level Siegel charts: the normalized toroidal model at level `p^n` of `ShimuraCompactifications` C5, with the polarized degeneration data of C4 and the refinement maps of C3, under their good-prime hypotheses.

Use PS16 Proposition 1.5: the map on `G̃^D[p^n]` factors through the abelian part, vanishes on the torus character piece, and descends from the torus-bundle base.

Apply the one-motive pairing to the lattice part and extend along the cone charts; naturality under chart overlap and fan refinement gives gluing modulo `p^n`.

Equality on a dense characteristic-zero open alone would not prove equality modulo `p^n`; the chart computation is integral.

**Checks.**

- For the modular curve at level `Γ(p^n)`, HT at the cusp `∞` vanishes on `μ_{p^n} ⊂ E_q[p^n]` and sends a point lifting the generator `q^{1/p^n}` of the quotient `ℤ/p^n` to dt/t, a generator of `ω/p^n` (Pilloni–Stroh: the map is trivial on the toric part).

[PS16](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.4, Proposition 1.5 and Remark 1.6, PDF pp. 4–5: Constructs the integral boundary character map on polarized one-motive charts.

*Needs:* [0.13](#section-0-13); [0.2](#section-0-2); [0.11](#section-0-11); `ShimuraCompactifications` C5 (higher level toroidal normalization); `ShimuraCompactifications` C4 (polarized degeneration data); `ShimuraCompactifications` C3 (refinement map); `ShimuraCompactifications` C4 (formal universal degeneration); [0.23](#section-0-23).

<a id="section-0-18"></a>

### 0.18 The Hodge–Tate filtration of an abelian variety through its Raynaud extension

Prove `TauCeti.HodgeTate.raynaudHodgeTate_filtration`. Let K be a complete discretely valued extension of `ℚ_p`, C the completion of an algebraic closure of K, and A an abelian variety over K. After a finite extension of K, A has semistable reduction (`NeronModelsAndSemistableAbelianVarieties` Layer 3 (semistable reduction)), and the rigid uniformization of `NeronModelsAndSemistableAbelianVarieties` Layer 3 over that complete discrete valuation ring writes `A^an=G̃^an/Y` with `0→T→G̃→B→0`, torus rank r and `dim B=g−r`. The finite-height p-divisible group `G̃[p∞]` has height `2g−r` and dimension g, and `0→T_pG̃→T_pA→Y⊗ℤ_p→0` is exact. The integral Faltings inclusion `Lie(G̃)(1)⊗C→T_pG̃⊗C` identifies with the Hodge–Tate filtration `Lie(A)(1)⊗C⊂T_pA⊗C`; it contains `T_pT⊗C`. Applying the dual one-motive gives the quotient `T_pA^∨⊗C→ω_A`, including its toric-form lattice quotient. All maps are Gal(C/K)-equivariant.

Only abelian varieties defined over a complete discretely valued K are treated, where `NeronModelsAndSemistableAbelianVarieties` Layer 3's complete-DVR uniformization applies after a finite extension; over an arbitrary C the character description is given for good reduction in 2.5 and 1.5.

Use the dual Raynaud one-motive to compute the quotient; there is no dual semi-abelian scheme of the same kind by assumption.

Import semistable reduction after a finite extension and the uniformization with its dual polarized one-motive from `NeronModelsAndSemistableAbelianVarieties` Layer 3 over the ring of integers of that extension; base change to `O_C` and form the Tate extension.

Identify the finite-height Faltings inclusion with the analytic Hodge–Tate inclusion through the compatible differential/one-motive comparison of the supplier and SCH15 Proposition III.3.1.

Compute the torus inclusion and the lattice graded quotient through the polarized pairing; the dimensions `g,2g−r,2g` verify the stated filtration.

**Checks.**

- For a Tate curve `E_q`, the Hodge–Tate filtration is `ℤ_p(1) ⊗ C = T_pμ_{p^∞} ⊗ C ⊂ T_pE_q ⊗ C`, the line spanned by the μ_{p^∞}-part.

[SCH15](https://arxiv.org/abs/1306.2070), §3.3, Proposition 3.3.1 (arXiv v2, III.3.1), PDF p. 54: Proposition 3.3.1.

*Needs:* [0.4](#section-0-4); [0.3](#section-0-3); [0.13](#section-0-13); `NeronModelsAndSemistableAbelianVarieties` Layer 3 (raynaud extension comparison); `NeronModelsAndSemistableAbelianVarieties` Layer 3 (rigid uniformisation); `NeronModelsAndSemistableAbelianVarieties` Layer 3 (semistable reduction); `NeronModelsAndSemistableAbelianVarieties` Layer 3.

<a id="section-0-19"></a>

### 0.19 The Harder–Narasimhan filtration of a finite flat group scheme

Define `TauCeti.HodgeTate.harderNarasimhanFiltration`. Let K, v be as in 0.6 and `G ≠ 0` a finite flat commutative group scheme of p-power order over `O_K`; 'subgroup' means closed finite flat subgroup scheme. G is semi-stable if `μ(G′) ≤ μ(G)` for every nonzero subgroup G′. Every such G has a unique filtration `0 = G₀ ⊊ G₁ ⊊ … ⊊ G_k = G` by subgroups with `G_{i+1}/G_i` semi-stable and `μ(G_i/G_{i−1}) > μ(G_{i+1}/G_i)`; its Harder–Narasimhan polygon HN(G) is the concave polygon from (0, 0) to (ht G, deg G) with slopes `μ(G_i/G_{i−1})` of multiplicity ht(G_i/G_{i−1}). For every subgroup G′, `deg G′ ≤` HN(G)(ht G′), and HN(G) is the concave envelope of the points (ht G′, deg G′). The filtration is Aut(G)-stable, compatible with valued extensions (K henselian), its slope-1 step is the multiplicative part and its slope-0 quotient the étale part, and Cartier duality exchanges the filtration of `G^D` with the orthogonals of the steps of G, slopes `λ ↦ 1 − λ`.

Slopes and degrees from 0.6; the existence proof is the formal Harder–Narasimhan argument in an exact category with a degree function that increases along generic isomorphisms (0.8).

Show that every G not semi-stable has a unique semi-stable subgroup of maximal slope and maximal height among those (Fargues 2010, Proposition 4), using Corollaire 5 (slopes in exact sequences and along generic isomorphisms).

Induct on the height to build the filtration (Théorème 2), exactly as for vector bundles; uniqueness from the uniqueness of the maximal destabilising subgroup.

Polygon properties (Proposition 7), functoriality (Remark 1), duality (Lemme 9, Corollaire 8) and Galois descent (Proposition 6).

The interface consists of the following named results.

- `TauCeti.HodgeTate.farguesSlope_le_of_semistable`: G is semi-stable iff `μ(G′) ≤ μ(G)` for all nonzero subgroups G′, iff `μ(G) ≤ μ(G/G′)` for all proper nonzero G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration`: The unique filtration with semi-stable graded pieces of strictly decreasing slopes.
- `TauCeti.HodgeTate.harderNarasimhanPolygon`: HN(G): the concave polygon of the filtration.
- `TauCeti.HodgeTate.degree_le_harderNarasimhanPolygon`: `deg G′ ≤` HN(G)(ht G′) for every subgroup G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_dual`: The filtration of `G^D` is formed by the Cartier duals of the quotients `G/G_i`, with slopes `1 − μ_i`.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_aut`: Every automorphism of G preserves the filtration; it commutes with valued field extensions.

**Checks.**

- `TauCeti.HodgeTate.harderNarasimhanFiltration_ordinary`: For `G = μ_p × ℤ/p` over `O_K` the filtration is `0 ⊂ μ_p ⊂ G` with slopes 1 and 0.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_semistable`: If G is semi-stable the filtration is `0 ⊂ G`. This happens for `G = E[p]` with E elliptic over `O_C` and `w = Ha(E) ≥ 1/2`: every subgroup of order p has degree w/p or `1 − w` if `w < p/(p+1)`, and 1/(p+1) if `w ≥ p/(p+1)`; none exceeds the slope 1/2 of E[p].
- `TauCeti.HodgeTate.harderNarasimhanFiltration_not_connectedEtale`: The HN filtration is not the connected–étale filtration: for E supersingular with `0 < w = Ha(E) < 1/2` the first step is the canonical subgroup C of degree `1 − w ∈ (1/2, 1)`, which is neither étale nor multiplicative, while the connected–étale filtration of the connected E[p] is `0 ⊂ E[p]`. For `1/2 ≤ w < p/(p+1)` the subgroup of degree `1 − w` still exists (Katz–Lubin; outside the range of 3.4) but has degree at most 1/2, so it is not an HN step.
- For G ordinary `BT_n (μ_{p^n}^d × (ℤ/p^n)^{h−d})` with `0 < d < h` the filtration is `0 ⊂ G^0 ⊂ G` with slopes 1, 0; for `d = 0` or `d = h` it is `0 ⊂ G`.
- Fargues 2011: for a `BT_n` with small Hasse invariant the canonical subgroup is a step of the filtration (3.6 (2)).

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §4.6, Théorème 2, PDF p. 13: Existence and uniqueness of the HN filtration. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §4.9, Définition 9, PDF p. 14: The HN polygon. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §4.9, Proposition 7, PDF p. 14: Degrees of subgroups lie under the polygon.

*Needs:* [0.6](#section-0-6); [0.7](#section-0-7); [0.8](#section-0-8).

Applications include Fargues 2011, §§7–8: the canonical subgroup is a Harder–Narasimhan step; Bijakowski–Pilloni–Stroh 2016; Pilloni 2020 §14: degree functions and HN polygons on Siegel varieties.

<a id="section-0-20"></a>

### 0.20 The discriminant divisor is the different of the group algebra

Prove `TauCeti.HodgeTate.degree_different`. Let A be a ring, t a regular element, and B a finite syntomic A-algebra étale over A[1/t]. Its trace codifferent `D^{-1}_{B/A}` is an invertible fractional B-ideal, and its inverse `D_{B/A}` is `Fitt₀^B Ω¹_{B/A}` (Fargues Proposition 1 calls this ideal `Δ_{B/A}`). The discriminant of the trace pairing over A is its norm, rather than this B-ideal itself. For a finite locally free commutative generically étale group `G = Spec B` over `S = Spec A`, `D_{G/S} = f*δ_G`, where `δ_G = Fitt₀^A ω_G`. Thus `e*D^{-1}_{G/S} = δ_G^{-1}` as an invertible fractional A-module; it is not `ω_G`. In the monogenic valuation-ring case `B = O_K[T]/(f)`, `f(0) = 0`, `ω_G = O_K/(f′(0))` and `deg G = v(f′(0)) = Σ_{x≠0}v(x)`, counting all geometric roots.

B syntomic over A (finite locally free group schemes are, 0.26 (1)), t regular.

Counterexample distinguishing the objects: `ω_{μ_p} = A/pA` is torsion, whereas `e*D^{-1}_{μ_p/A} = p^{−1}A` is an invertible fractional module when p is regular.

Grothendieck duality for Spec B ↪ Y smooth over S: `f^!O_S = det L_{B/A}`, and the trace identifies `Hom_A(B, A)` with `Γ(det L)`; the section defining `Δ` maps to `tr_{B/A}` (Fargues 2010, Proposition 1).

For a group scheme, translation invariance gives `Ω¹_{G/S} = f*ω_G`, so `Fitt₀ Ω¹ = f*Fitt₀ ω_G = f*δ_G` (Fargues 2010, §2).

Monogenic case: `ω_G = O_K/f′(0)` and `f′(0) = ∏_{x ≠ 0} (−x)` up to a unit.

**Checks.**

- For `μ_p` over a p-torsion-free valuation ring, `ω_{μ_p}=R/pR` while `e*D^{−1}=p^{−1}R`; they are not isomorphic R-modules.
- For `f(T)=(1+T)^p−1`, `f′(0)=p` and `Σ_{i=1}^{p−1}v(ζ_p^i−1)=1`. The discriminant over R is the norm of the B-different.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §1.3–1.4, Proposition 1, PDF pp. 4–6; §2, PDF p. 7: Trace duality identifies the inverse different as an invertible fractional ideal and translation identifies the group different with the pullback of `Fitt₀ω`.

*Needs:* [0.6](#section-0-6); `KaehlerDifferential`; [0.26](#section-0-26).

<a id="section-0-21"></a>

### 0.21 Base change of invariant differentials

Prove `TauCeti.HodgeTate.conormal_baseChange`. For H/S finite locally free commutative and any `S′→S`, `ω_H⊗O_{S′}≅ω_{H_{S′}}` canonically, with identity/composition coherence.

Relative Kähler differentials and pullback are the shared sheaf operations.

Apply base change for `Ω¹_{H/S}`, then pull back along the base-changed unit; coherence is the pullback coherence.

**Checks.**

- For Spec R the map agrees with base change of the augmentation cotangent module.

[FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §2.1.1, PDF p. 6: The character map is computed in invariant differentials and behaves under extension of the base.

*Needs:* [0.1](#section-0-1); `AlgebraicGeometry.Scheme.Modules`; `AlgebraicGeometry.Scheme.Modules.pullback`.

<a id="section-0-22"></a>

### 0.22 Invariant differentials of an exact group sequence

Prove `TauCeti.HodgeTate.conormal_rightExact`. For an fppf-exact sequence `0→H′→H→H″→0` of finite locally free commutative groups over S, `ω_{H″}→ω_H→ω_{H′}→0` is right exact.

All three groups are finite locally free; no left injectivity is asserted.

Apply the cotangent transitivity/right-exact differential sequence to the quotient and pull back at the identity; use fppf descent.

**Checks.**

- The `μ_p` example has a torsion conormal; right exactness does not imply a vector-bundle short exact sequence.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, PDF pp. 6–8: Uses the co-Lie triangle and invariant differentials for finite-flat exact sequences.

*Needs:* [0.1](#section-0-1); `AlgebraicGeometry.Scheme.Modules`; `AlgebraicGeometry.Scheme.Modules.pullback`.

<a id="section-0-23"></a>

### 0.23 Naturality of the character differential

Prove `TauCeti.HodgeTate.hodgeTateMap_natural`. For `f:H→K` of finite locally free commutative S-groups and `x∈H(S)`, `α_K(f(x))=(f^D)*α_H(x)`; this identity commutes with base change.

Use the existing Cartier duality and conormal base-change isomorphism.

The character of f(x) is the composite of `f^D` with the character of x. Pullback of dt/t composes.

**Checks.**

- For [p], both sides are p times the character differential.

[FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §2.1.1, PDF p. 6: Character differentials give the functorial finite-level Hodge–Tate map.

*Needs:* [0.2](#section-0-2); [0.21](#section-0-21).

<a id="section-0-24"></a>

### 0.24 The degree of a finitely presented torsion module over a rank-one valuation ring

Define `TauCeti.HodgeTate.torsionDegree`. Let V be a valuation ring whose valuation v: `V → ℝ_{≥0} ∪ {∞}` has rank one (`v(p) = 1` when V is p-adic; the value group may be dense). For a finitely presented torsion V-module M, the Fitting ideal Fitt₀(M) is finitely generated and nonzero, hence principal, `Fitt₀(M) = (a)`; put `deg M := v(a) ∈ ℝ_{≥0}`. Every such M is isomorphic to `⊕_{i=1}^{r} V/x_iV` with `x_i ≠ 0`, and `deg M = Σ_i v(x_i)` for every such decomposition. The degree is additive in short exact sequences of finitely presented torsion modules, is invariant under extension of rank-one valuation rings `V → W` with `v_W|_V = v`, and vanishes exactly on the zero module. For finitely generated V-submodules `Λ₂ ⊂ Λ₁` of a finite-dimensional Frac(V)-vector space, both spanning it, `χ(Λ₁, Λ₂) := deg(Λ₁/Λ₂)` is the valuation of the determinant of the inclusion in any bases; when V is p-adic `(v(p) = 1)` it extends to arbitrary pairs of lattices of rank r by `χ(Λ₁, Λ₂) := χ(Λ₁, p^kΛ₂) −` kr for k large (for a general V, replace `p^k` by `ϖ^k` and kr by `k·r·v(ϖ)` for a nonzero nonunit `ϖ`), so that `χ(Λ₁, Λ₃) = χ(Λ₁, Λ₂) + χ(Λ₂, Λ₃)`. Fargues's degree of 0.6 is `deg ω_G`.

V is a valuation ring of rank one; it need not be noetherian, discrete or complete. M is finitely presented and torsion. A finitely generated torsion-free V-module is free, so finitely generated lattices are free.

A finitely presented torsion module has a presentation `V^r → V^r → M → 0` by a square matrix with nonzero determinant: diagonalize any presentation matrix by row and column operations pivoting on an entry of minimal valuation (finitely generated ideals of V are principal, so the entry of least valuation divides all others); torsion forces r nonzero diagonal entries and kills the extra columns. The diagonal form gives the cyclic decomposition and `Fitt₀(M) = (∏ x_i)`, independently of the presentation because Fitting ideals do not depend on it.

The square presentation is injective, so M has projective dimension at most one. For `0 → M₁ → M₂ → M₃ → 0` the horseshoe construction gives a block-triangular square presentation of M₂ whose determinant is the product of those of M₁ and M₃; hence `Fitt₀(M₂) = Fitt₀(M₁)·Fitt₀(M₃)` and the degree is additive. The general inclusion `Fitt₀(M₁)Fitt₀(M₃) ⊆ Fitt₀(M₂)` of Fitting ideals is an equality here because of the square presentations.

Base change: Fitting ideals commute with base change (`TauCeti.fittingIdeal_baseChange`), and `v_W` restricts to v. Vanishing: `deg M = 0` forces every `x_i` to be a unit.

The interface consists of the following named results.

- `TauCeti.HodgeTate.torsionDegree`: `deg M := v(Fitt₀ M)` for a finitely presented torsion V-module M.
- `TauCeti.HodgeTate.torsionDegree_cyclic`: `deg(V/xV) = v(x)` for `x ≠ 0`.
- `TauCeti.HodgeTate.exists_cyclic_decomposition`: `M ≅ ⊕_{i=1}^{r} V/x_iV` with `x_i ≠ 0`, and `deg M = Σ_i v(x_i)`.
- `TauCeti.HodgeTate.torsionDegree_add`: `deg M₂ = deg M₁ + deg M₃` for a short exact sequence of finitely presented torsion modules.
- `TauCeti.HodgeTate.torsionDegree_baseChange`: `deg(M ⊗_V W) = deg M` for an extension of rank-one valuation rings.
- `TauCeti.HodgeTate.torsionDegree_eq_zero_iff`: `deg M = 0` iff `M = 0`.
- `TauCeti.HodgeTate.latticeIndex`: `χ(Λ₁, Λ₂)` for finitely generated spanning lattices of rank r, equal to `v(det)` of the inclusion when `Λ₂ ⊂ Λ₁`, with `χ(Λ₁, p^kΛ₁) =` kr and `χ(Λ₁, Λ₃) = χ(Λ₁, Λ₂) + χ(Λ₂, Λ₃)`.

**Checks.**

- `TauCeti.HodgeTate.torsionDegree_half`: For `V = O_C` and `M = O_C/p^{1/2}O_C`, `deg M = 1/2`, while M has no finite composition series (the submodules `p^qO_C/p^{1/2}O_C`, `0 < q < 1/2` rational, form an infinite chain). A degree defined as a length fails this test.
- `TauCeti.HodgeTate.torsionDegree_dvr`: Over `V = ℤ_p`, `deg(ℤ_p/p^n) = n = length`; over the ring of integers of a totally ramified extension of degree e with uniformizer `π`, `deg(V/π) = 1/e` while the length is 1, so `deg = length · v(π)` on a discrete valuation ring.
- `TauCeti.HodgeTate.torsionDegree_not_injective`: `deg(V/p ⊕ V/p) = 2 = deg(V/p²)`, although the modules differ (Fitt₁ is (p) for the first and V for the second): the degree is not an isomorphism invariant that classifies.
- `TauCeti.HodgeTate.torsionDegree_ses`: `0 → V/p → V/p² → V/p → 0` gives `2 = 1 + 1`.
- The zero module has degree 0; the non-torsion module V has `Fitt₀(V) = 0` and is outside the domain of the definition.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, after Définition 3, PDF p. 7: over a valuation ring a cyclic decomposition `ω_G ≅ ⊕ V/x_iV` gives `δ_G = (∏ x_i)`; the statement proves the decomposition and the formula for every finitely presented torsion module. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §3, Définitions 4 and 5, PDF p. 9: the degree as the valuation of a principal Fitting ideal for nondiscrete valuations, and the lattice symbol `χ` of two lattices as the valuation of a Fitting ideal, extended to arbitrary pairs by p^k-shifts (the extension is normalized here so that `χ` is additive).

*Needs:* `TauCeti.fittingIdeal`; `TauCeti.fittingIdeal_baseChange`; `Valuation`; `ValuationSubring`; `Module.length`.

Applications include 0.6 (Fargues's degree is `deg ω_G`); 0.8 (the change `χ(A, f*A′)` along a generic isomorphism); 3.1–3.8 (degrees of canonical subgroups and of quotients); 5.4 (cokernel estimates of `ω^int`).

<a id="section-0-25"></a>

### 0.25 The conormal module and dimension of a p-divisible group over `O_C`

Prove `TauCeti.HodgeTate.pDivisibleConormal_free`. Let C be a complete algebraically closed nonarchimedean extension of `ℚ_p` with `v(p) = 1`, k its residue field, and G a p-divisible group of height h over `O_C`, with levels `G[p^n]` finite locally free over `O_C`. Put `ω_G := lim_n ω_{G[p^n]}`, the transition maps induced by `G[p^n] ⊂ G[p^{n+1}]`. Then (1) for every `n ≥ 1`, `ω_{G[p^n]}` is a free `O_C/p^n`-module of `rank d := dim G_k`, the dimension of the special fibre; (2) for `m ≥ n` the restriction `ω_{G[p^m]} → ω_{G[p^n]}` is surjective with kernel `p^nω_{G[p^m]}`; (3) `ω_G` is a free `O_C`-module of rank d, p-adically complete and separated, and `ω_G/p^n ≅ ω_{G[p^n]}`; (4) `dim G + dim G^D = h`; (5) the formation of `ω_G` commutes with base change to `O_{C′}` for a complete algebraically closed C′ ⊃ C. These are the conormal facts that R07.1 proves over complete discrete valuation rings, here over the nonnoetherian ring `O_C`.

C complete and algebraically closed, so `O_C` is a henselian valuation ring with algebraically closed residue field; G p-divisible over `O_C`. The same proof works over any p-adically complete local ring on which the `BT_n` conormal theorem of R07.1 applies modulo every `p^m`.

(1) `[p^n]` kills `G[p^n]`, so it kills `ω_{G[p^n]}`, which therefore equals its base change to `O_C/p^n (0.21)`. Over `O_C/p^n`, where p is nilpotent, `G[p^n]` is a truncated Barsotti–Tate group of level n, whose conormal module is locally free of rank dim over `O_C/p^n` by Illusie's co-Lie criterion (`FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.10–R07.1.11); `O_C/p^n` is local, so it is free, and the rank is read off on the special fibre.

(2) From `0 → G[p^n] → G[p^m] → G[p^{m−n}] → 0` and right exactness (0.22), the restriction is surjective; a surjection `(O_C/p^m)^d/p^n → (O_C/p^n)^d` of free modules of the same rank is an isomorphism.

(3) and (5) pass to the inverse limit of (2), `O_C` being p-adically complete; (4) is R07.1.15 for the special fibre `G_k` over the field k, together with the rank identification of (1) for G and `G^D`.

**Checks.**

- For `G = μ_{p^∞}`, `ω_G = O_C·dt/t` is free of rank one and `ω_{μ_{p^n}} = O_C/p^n`; for `G = ℚ_p/ℤ_p`, `ω_G = 0` and `d = 0`.
- For `G = E[p^∞]` with E an elliptic curve with good reduction over `O_C`, `d = 1` and `h = 2`, so `dim G + dim G^D = 1 + 1 = h`; `ω_{E[p]} = O_C/p`, of degree one (0.6).
- The isomorphism `ω_G/p^n ≅ ω_{G[p^n]}` is special to the levels: for `G = μ_{p^∞} ⊕ ℚ_p/ℤ_p`, `ω_G/p = O_C/p`; the subgroup `H = μ_p ⊂ G[p]` happens to have `ω_H = O_C/p` too, but `H = ℤ/p ⊂ G[p]` has `ω_H = 0 ≠ ω_G/p`.

[FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §2.2.1, PDF p. 7: for a truncated Barsotti–Tate group of level one, dimension d and height h over `O_K` (nondiscrete valuations allowed), `ω_{G^D}` is free of `rank h − d` over `O_K/p`, the level-one case of (1) and (4). [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §3, Exemple 2, PDF p. 9: a truncated Barsotti–Tate group of level n and dimension d has degree nd, which is (1) read through 0.24.

*Needs:* [0.1](#section-0-1); [0.21](#section-0-21); [0.22](#section-0-22); [0.24](#section-0-24); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.10; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.15; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group); `IsAdicComplete`.

Applications include 0.1 and 0.4 (the target `ω_{G^D}` of the p-divisible Hodge–Tate map), 0.5 (Lie and `ω` finite free in the Faltings complex), 2.4 (the Hodge–Tate sequence over `O_C`).

<a id="section-0-26"></a>

### 0.26 The co-Lie complex of a finite locally free group scheme

Construct `TauCeti.HodgeTate.coLieComplex`. Let S be a scheme and G a finite locally free commutative S-group with unit section e. (1) `G → S` is syntomic: flat, of finite presentation and a local complete intersection. (2) The co-Lie complex `ℓ_G := Le*L_{G/S}` (the derived pullback along e of the cotangent complex) is perfect of amplitude `[−1, 0]` and rank zero, with `H⁰(ℓ_G) = ω_G`; locally on S it is represented by `[E^{−1} → E⁰]` with `E^{−1}`, `E⁰` free of the same rank. (3) If G is étale over a schematically dense open of S, its determinant section defines an effective Cartier divisor `δ_G = Div(ℓ_G)` whose ideal is `Fitt₀(ω_G)`, and `det ℓ_G` is the underlying line bundle. (4) For an exact sequence `0 → G₁ → G₂ → G₃ → 0` of finite locally free groups there is a distinguished triangle `ℓ_{G₃} → ℓ_{G₂} → ℓ_{G₁} → ℓ_{G₃}[1]`, so `δ` is additive. (5) If `G = ker(f: A → B)` for an isogeny of abelian schemes over S, then `ℓ_G ≃ [ω_B → ω_A]` in degrees `[−1, 0]` with differential f*; it sits in the triangle of the Hodge filtrations, `ℓ_G[−1] → H¹_dR(B/S) → H¹_dR(A/S) → ℓ_{G^D}^∨`, using the Hodge sequences of A and B and `Lie(A^∨) = R¹π_*O_A`. Consequently det(f* on `H¹_dR) = det(f*` on `ω)·det((f^∨)*` on `ω_{A^∨}`) and `δ_G + δ_{G^D} =` div(deg f) whenever `deg f = |G|` is a non-zero-divisor on S. This `ℓ_G` is the co-Lie complex that `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11 and R07.6.6 use; this subsection supplies its perfectness, rank, determinant divisor and triangles.

S arbitrary for (1), (2) and (4); (3) needs G generically étale on a schematically dense open; (5) needs the isogeny f of abelian schemes over S and, for the divisor identity, |G| a non-zero-divisor.

(1) Locally on S embed G as a closed subgroup of a smooth commutative group scheme (the Weil restriction of `𝔾_m` along `G^D → S`, using Cartier duality); the quotient is smooth, so G is the fibre of a morphism of smooth S-schemes over the unit section, hence a local complete intersection of the expected codimension; flatness and finite presentation are given.

(2) For an lci morphism the cotangent complex is perfect of amplitude `[−1, 0]`, locally the two-term model of a regular quotient of a smooth algebra (DerivedModuleAlgebra §0.13); its pullback along e has rank dim of the smooth ambient minus dim of the quotient, which is zero. `H⁰` of the pullback is the conormal `ω_G` of 0.1.

(3) For a perfect complex of rank zero that is exact over a schematically dense open, the determinant section is a non-zero-divisor; locally `δ_G = (det(E^{−1} → E⁰)) = Fitt₀(ω_G)`, the Fitting ideal of the cokernel of a square matrix.

(4) The transitivity triangle of cotangent complexes for `G₂ → G₃` with fibre G₁, pulled back along the unit; additivity of determinants in triangles.

(5) The exact sequence `0 → G → A → B → 0` identifies `Le*L_{A/B}` with `ℓ_G`; since A and B are smooth, `ℓ_G = [ω_B → ω_A]`. Combining with the dual isogeny `f^∨`: `B^∨ → A^∨`, whose kernel is G^D (AbelianSchemesAndArithmeticModuli A3.5), and the Hodge sequences `0 → ω → H¹_dR →` Lie(dual) `→ 0` of A and B (A4.3) gives the triangle; det f* on `H¹_dR` is deg f by the Poincaré duality of A4.3.

The interface consists of the following named results.

- `TauCeti.HodgeTate.coLieComplex`: `ℓ_G = Le*L_{G/S}`, perfect of amplitude `[−1, 0]` and rank zero.
- `TauCeti.HodgeTate.coLieComplex_H0`: `H⁰(ℓ_G) = ω_G`.
- `TauCeti.HodgeTate.syntomic_of_finiteLocallyFree`: a finite locally free commutative group scheme is syntomic over S.
- `TauCeti.HodgeTate.coLieDivisor`: `δ_G = Div(ℓ_G)`, with ideal `Fitt₀ ω_G`, when G is generically étale on a schematically dense open.
- `TauCeti.HodgeTate.coLieComplex_triangle`: the triangle `ℓ_{G₃} → ℓ_{G₂} → ℓ_{G₁}` for an exact sequence.
- `TauCeti.HodgeTate.coLieComplex_baseChange`: `ℓ_{G_{S′}} =` Lg*ℓ_G for `S′ → S` (tor-independent because G is flat).
- `TauCeti.HodgeTate.coLieComplex_isogenyKernel`: for `G = ker f`, `ℓ_G ≃ [ω_B →^{f*} ω_A]` and the Hodge-filtration triangle relating `ℓ_G`, `ℓ_{G^D}`, `H¹_dR(A/S)` and `H¹_dR(B/S)`.

**Checks.**

- `TauCeti.HodgeTate.coLieComplex_mu`: For `μ_{p^n}` over a ring R, `ℓ = [R →^{p^n} R]`: `H⁰ = R/p^n`, and `H^{−1} = R[p^n]` is nonzero when R has p-torsion (for `R = 𝔽_p` both cohomology groups are `𝔽_p`).
- `TauCeti.HodgeTate.coLieComplex_etale`: For an étale G, `ℓ_G = 0` and `δ_G = 0`.
- `TauCeti.HodgeTate.coLieComplex_alphaP`: For `α_p` over `𝔽_p`, `ℓ = [𝔽_p →^{0} 𝔽_p]`: `H⁰ = H^{−1} = 𝔽_p`, so `δ` is undefined (`α_p` is nowhere generically étale over `𝔽_p`) although ℓ is perfect of rank zero.
- `TauCeti.HodgeTate.coLieComplex_isogeny_mulP`: For `f = [p]` on an abelian scheme of dimension g over `ℤ_p`, `ℓ_{A[p]} = [ω_A →^{p} ω_A]` and `δ_{A[p]} = (p^g)`; with `δ_{A[p]^D} = (p^g)`, the sum is div(p^{2g}) `=` div |A[p]|.

[FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §1.1, PDF pp. 3–4: a flat group scheme of finite presentation is syntomic, with the local complete-intersection characterisations used in (1). [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §1.2, PDF p. 4: the cotangent complex of a finite syntomic morphism is perfect of rank zero in degrees `[−1, 0]`, with a local two-term presentation (citing Illusie, Complexe cotangent, Proposition 3.2.6). [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, Définition 3 and the paragraph before it, PDF pp. 6–7: the co-Lie complex `ℓ_G` of a finite locally free group (Illusie VII.3.1), perfect of rank zero in degrees `[−1, 0]`, with `δ_G = Div(ℓ_G) = Fitt₀ ω_G`. [FAR10](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf), §2, Lemmes 1–2, PDF pp. 7–8: additivity of `δ` in exact sequences from the triangle of co-Lie complexes, and `δ_G + δ_{G^D} =` div |G| for kernels of isogenies through the Hodge filtration triangle.

*Needs:* [0.1](#section-0-1); `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`; `AlgebraicGeometry.Scheme.relativeDifferentials`; `AlgebraicGeometry.Scheme.Modules.fittingIdeal`; `AbelianSchemesAndArithmeticModuli` A3.5; `AbelianSchemesAndArithmeticModuli` A4.2; `AbelianSchemesAndArithmeticModuli` A4.3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.6.6; DerivedModuleAlgebra §0.4 (the full cotangent complex); DerivedModuleAlgebra §0.8 (the cotangent transitivity triangle); DerivedModuleAlgebra §0.10 (derived base change of the cotangent complex); DerivedModuleAlgebra §0.13 (regular quotients and two-term models).

Applications include 0.7 (additivity and duality of the degree), 0.9 (the divisor `D_H`), 0.20 (the different), 3.2 (the obstruction class lives in Ext of the co-Lie complexes), 3.6 (the co-Lie complex of `ker V^m` has determinant a power of the Hasse invariant).

<a id="section-0-27"></a>

### 0.27 The Verschiebung of an abelian scheme

Construct `TauCeti.HodgeTate.abelianVerschiebung`. Let S be an 𝔽_p-scheme and A an abelian scheme over S, with relative Frobenius `F_{A/S}`: `A → A^{(p)}` and dual abelian scheme `A^∨`. Using `(A^{(p)})^∨ = (A^∨)^{(p)}` and `A^{∨∨} = A`, define `V_{A/S}`: `A^{(p)} → A` as the dual isogeny `(F_{A^∨/S})^∨`. Then (1) `V_{A/S} ∘ F_{A/S} = [p]_A` and `F_{A/S} ∘ V_{A/S} = [p]_{A^{(p)}}`; (2) for every n, the restriction of `V_{A/S}` to `A^{(p)}[p^n] → A[p^n]` is the Verschiebung of the finite locally free group `A[p^n] (R07.1.1)`, that is the Cartier dual of F on `A^∨[p^n]` under the Weil pairing identification `A[p^n]^D = A^∨[p^n]`; (3) `V_{A/S}` agrees with the Verschiebung of A as a smooth commutative group scheme (the semi-abelian Verschiebung of `ShimuraCompactifications` C4); (4) `V_{A/S}` is compatible with base change, and with homomorphisms: `φ ∘ V_A = V_B ∘ φ^{(p)}` for `φ`: `A → B`, in particular `λ ∘ V_A = V_{A^∨} ∘ λ^{(p)}` for a polarization `λ`; (5) V*: `ω_A → ω_{A^{(p)}} = ω_A^{(p)}` is the map whose determinant is the Hasse invariant of 0.14, and it agrees with V* on `ω_{A[p]} = ω_A/p`.

S of characteristic p; A an abelian scheme (proper smooth with connected fibres); the dual and the Weil pairing are those of `AbelianSchemesAndArithmeticModuli` A3.

(1) `V_A ∘ F_A` and `[p]_A` agree on every `A[p^n]` by (2) and the relation `V ∘ F = p` for finite locally free groups (R07.1.1); likewise `F_A ∘ V_A` and [p] on every `A^{(p)}[p^n]`. A homomorphism of abelian schemes killing every `A[p^n]` is divisible by every `p^n` in the finitely generated free group of homomorphisms over each connected component of S, hence zero.

(2) The kernel of a dual isogeny is the Cartier dual of the kernel, compatibly with the Weil pairing (A3.5); restricting `(F_{A^∨})^∨` to p^n-torsion is the Cartier dual of `F_{A^∨[p^n]}`, which is `V_{A[p^n]}` by R07.1.1.

(3) Both satisfy `V ∘ F = [p]` with F an epimorphism of fppf sheaves, so they agree.

The interface consists of the following named results.

- `TauCeti.HodgeTate.abelianVerschiebung`: `V_{A/S} := (F_{A^∨/S})^∨`: `A^{(p)} → A`.
- `TauCeti.HodgeTate.abelianVerschiebung_comp_frobenius`: `V ∘ F = [p]` and `F ∘ V = [p]`.
- `TauCeti.HodgeTate.abelianVerschiebung_torsion`: on p^n-torsion, V restricts to the Verschiebung of `A[p^n]` of R07.1.1.
- `TauCeti.HodgeTate.abelianVerschiebung_eq_groupVerschiebung`: agreement with the semi-abelian Verschiebung of `ShimuraCompactifications` C4 for the smooth group A.
- `TauCeti.HodgeTate.abelianVerschiebung_baseChange`: compatibility with `S′ → S` and with homomorphisms and polarizations.
- `TauCeti.HodgeTate.abelianVerschiebung_cotangent`: V* on `ω_A` reduces to V* on `ω_{A[p]} = ω_A/p`.

**Checks.**

- `TauCeti.HodgeTate.abelianVerschiebung_ordinaryCurve`: For an ordinary elliptic curve over `𝔽̄_p`, `ker V ≅ ℤ/p` is étale and V* is an isomorphism on `ω`; for a supersingular one `ker V = ker F^{(p)} ≅ α_p` and `V* = 0` on `ω`.
- `TauCeti.HodgeTate.abelianVerschiebung_degree`: `deg V_{A/S} = p^g`, so ker V has order `p^g`; V is not an isomorphism for `g ≥ 1`.
- `TauCeti.HodgeTate.abelianVerschiebung_kernels`: For an ordinary elliptic curve over `𝔽̄_p`, `ker F ≅ μ_p` is connected while `ker V ≅ ℤ/p` is étale, so V is not the Frobenius of a twist; a definition of V that ignored the duality fails this test.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, before Lemma 3.2.5, p. 33 (arXiv v2): the Hasse invariant of an abelian scheme over an 𝔽_p-scheme is the determinant of the map that Verschiebung induces on invariant differentials, which is (5). [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §2.2.3, Remarque 1, PDF p. 10: Verschiebung of a finite flat group and the map `F_*` it induces on the conormal of the dual, computed for Oort–Tate groups; the finite-level form of (2).

*Needs:* `AbelianSchemesAndArithmeticModuli` A3.5; `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.1; `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); [0.1](#section-0-1).

Applications include 0.14 (the Hasse invariant on the abelian locus), 0.15 (the ordinary locus), 5.1 (Igusa torsors of the dual canonical subgroup through ker V).

<a id="section-0-28"></a>

### 0.28 Quotients of truncated Barsotti–Tate groups by subgroups of the p-torsion

Prove `TauCeti.HodgeTate.truncatedQuotient`. Let H be a p-divisible group of height h and dimension d over a scheme S, `n ≥ 2`, `G = H[p^n]`, and `D ⊂ G[p]` a finite locally free subgroup. For `1 ≤` a `≤ n − 1` put `p^{−a}D := ([p^a]|_{G[p^{a+1}]})^{−1}(D) ⊂ G[p^{a+1}]`. Then (1) `0 → G[p^a] → p^{−a}D → D → 0` is exact, so `p^{−a}D` is finite locally free of order p^{ah}|D|; (2) H/D is a p-divisible group of height h and dimension d, and `p^{−a}D/D = (H/D)[p^a]`, a truncated Barsotti–Tate group of level a, height h and dimension d; (3) the isogeny `H → H/D` induces `ω_{H/D} → ω_H` with cokernel `ω_D`, and over `O_C` its levels satisfy `ω_{(H/D)[p^a]} = ω_{H/D}/p^a (0.25)`; (4) if S is a scheme on which `p = 0` and `D = ker(F: G[p] → G[p]^{(p)})`, the relative Frobenius induces an isomorphism `p^{−1}D/D ≅ G[p]^{(p)}`, hence `det ω_{p^{−1}D/D} ≅ (det ω_{G[p]})^{⊗p}` carrying `Ha(p^{−1}D/D)` to `Ha(G[p])^{⊗p}`; (5) over `O_C`, if `D ⊗ O_C/p^{1−w} = ker F` on `G[p] ⊗ O_C/p^{1−w}` for some `0 ≤ w < 1`, then (4) holds after reduction modulo `p^{1−w}`.

H p-divisible over S; D finite locally free inside G[p]. Over `O_C` every subgroup `C ⊂ G[p]` of the canonical-subgroup theorems is of this kind for `G = A[p^n]` or `G = H[p^n]`.

(1) `[p^a]`: `G[p^{a+1}] → G[p]` is an epimorphism of fppf sheaves with kernel `G[p^a]`, because `G[p^{a+1}]` is a level of H (`FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.5).

(2) Multiplication by p on the fppf quotient H/D is an epimorphism because it is one on H; its kernel is `p^{−1}D/D`, where `p^{−1}D = [p]^{−1}(D)` is an extension of D by H[p], so the kernel is finite locally free of order `p^h` and H/D is p-divisible of height h. A point x of H with p^ax `∈ D` is exactly a point of `(H/D)[p^a]`, so `p^{−a}D/D = (H/D)[p^a]`. The dimension is unchanged since `ω_{H/D} → ω_H` is injective with torsion cokernel over a flat base and is computed fibrewise otherwise (R07.1.14).

(3) Right exactness of conormal modules (0.22) for `0 → D → H → H/D → 0`, levelwise, and 0.25 for H/D.

(4) For x in `p^{−1}D`, `pF(x) =` F(px) `= 0`, so F maps `p^{−1}D` into `G[p]^{(p)}`; its kernel there is `ker F = D`, and both `p^{−1}D/D` and `G[p]^{(p)}` have order `p^h`, so F induces an isomorphism. The determinant identity is `det(ω^{(p)}) = (det ω)^{⊗p}` of R07.2.21 applied to the BT₁ G[p], and Frobenius twisting carries Ha to its p-th tensor power.

(5) Reduce modulo `p^{1−w}` and apply (4) over `O_C/p^{1−w}`.

**Checks.**

- For `H = μ_{p^∞} ⊕ ℚ_p/ℤ_p` and `D = μ_p`, `H/D ≅ μ_{p^∞} ⊕ ℚ_p/ℤ_p` via p on the first factor, and `p^{−1}D/D = (H/D)[p]` has height 2 and dimension 1.
- For `D = 0`, `p^{−a}D/D = G[p^a]`; for `D = G[p]`, `p^{−a}D/D = G[p^{a+1}]/G[p] ≅ G[p^a]` through multiplication by p.
- For E supersingular over `𝔽̄_p` and `D = ker F = α_p ⊂ E[p]`, `p^{−1}D/D ≅ E[p]^{(p)}`, again supersingular: its Hasse invariant is `Ha(E[p])^{⊗p} = 0`.

[FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §7.4, Théorème 5 and its proof, PDF pp. 37–38: the quotient `p^{−1}C/C` of a level-two truncated group by a subgroup of its p-torsion is a level-one truncated group, and over a base killed by p, Frobenius identifies `p^{−1}ker F/ker F` with `G[p]^{(p)}` and transports the Hasse invariant to its p-th power; this gives (4)–(5). [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §7.5, proof of Théorème 6, PDF pp. 38–39: the inductive step uses `p^{−1}D/D` as a level-one truncated group of height h and dimension d, and `p^{−(n−1)}D/D` at level `n − 1`, which is (2).

*Needs:* [0.1](#section-0-1); [0.22](#section-0-22); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.5; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.10; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.14; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.21.

Applications include 3.5 (the Hasse height of the quotient) and 3.6 (the induction on the level in Fargues's theorem).

### Examples

The constant, multiplicative and additive order-p groups distinguish the conormal and character differential. The supersingular order-p example computes a fractional Fargues degree, and the Tate curve identifies the toric and abelian parts of the boundary filtration. The detailed computations and negative controls are included with the definitions above.

### Dependencies

`FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1; `AbelianSchemesAndArithmeticModuli` A3; `AbelianSchemesAndArithmeticModuli` A4; AdicSpacesPartIII R2; `ShimuraCompactifications` C4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2; `AbelianSchemesAndArithmeticModuli` A2; `ShimuraCompactifications` C5; `ShimuraCompactifications` C3; `NeronModelsAndSemistableAbelianVarieties` Layer 3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.6; DerivedModuleAlgebra §§0.4–0.13, 0.25. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 1: Period rings and relative comparison

Layer 1 applies `PadicHodgeTheory`'s relative comparison to proper smooth abelian families over finite extensions of `ℚ_p`, identifies the graded comparison map with the Hodge–Tate map of Layer 0, and proves compatibility with Hodge tensors for Hodge-type data. It then gives the degree-one Hodge–Tate sequence of an abelian variety over an arbitrary C and the identification of the relative quotient with the character differential. It builds no period rings of its own.

<a id="section-1-1"></a>

### 1.1 The relative de Rham comparison for abelian schemes

Establish `TauCeti.HodgeTate.abelianRelativeComparison`. Let K be a finite extension of `ℚ_p`, X/K a smooth adic space, and `f:A→X` the analytification of an algebraic abelian scheme. On X_proét, let `V=R¹f_*ℚ_p` and `H=H¹_dR(A/X)`, with its Hodge filtration and Gauss–Manin connection. PadicHodgeTheory §7.3’s proper-smooth theorem gives a canonical filtered horizontal isomorphism `V⊗OB_dR≅H⊗OB_dR`, natural in A and compatible with tensor products, duals and cup/Weil pairings with their Tate twists. The abelian Hodge–Tate filtration is formed from `M=V⊗B_dR^+` and `M₀=(H⊗OB_dR^+)^{∇=0}`, embedded in their common `B_dR module`; it is not obtained by replacing `gr⁰OB_dR` with `Ô_X`. On geometric points `V≅Hom(T_pA,ℚ_p)≅V_pA^∨(−1)`. The homology cyclotomic summand has weight +1 and the cohomology twist is `−1`.

The local-system finiteness hypothesis of CS17 Theorem 2.2.2 is satisfied by the algebraizable proper-smooth family; the base field is a finite extension of `ℚ_p`, the generality of `PadicHodgeTheory` §7.3 (de rham pair derived pushforward). Base change to a complete algebraically closed C ⊃ K is applied after the comparison.

PadicHodgeTheory §§2.1–2.4 and 7.3 supplies period sheaves, horizontal comparison and its relative Poincaré lemma. This is their degree-one abelian specialization.

Apply CS17 Theorem 2.2.2 and PadicHodgeTheory §7.3 in degree one; use A4’s Hodge filtration and Gauss–Manin connection.

Identify homology and cohomology through A3’s Weil pairing, tracking the `−1` twist rather than treating `T_pA` and `R¹f_*ℚ_p` as the same local system.

Use PadicHodgeTheory §7.3’s multiplicativity and duality to obtain the tensor and polarization comparisons; construct M and M₀ through horizontal sections as in CS17 §2.2.

**Checks.**

- For X a point and `A = E` an elliptic curve over K, the comparison reduces to the de Rham comparison of V_pE (PadicHodgeTheory §8.3 (abelian variety hodge tate weights)).

[CS17](https://arxiv.org/abs/1511.02418), §2.2, Theorem 2.2.2 and Proposition 2.2.3, PDF pp. 13–15: The structural comparison and the two horizontal `B_dR^+` lattices have different roles.

*Needs:* `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); `PadicHodgeTheory` §8.3 (abelian variety hodge tate weights); `CohomologyComparisons` §0.4 (twist frobenius filtration normalization); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (tate twists); `AbelianSchemesAndArithmeticModuli` A4; `AdicEtaleGeometry` A1 (pro etale site corrected); `PerfectoidSpaces` P0 (almost basic setup); `AbelianSchemesAndArithmeticModuli` A4 (abelian h1 de rham).

<a id="section-1-2"></a>

### 1.2 The graded comparison is the Hodge–Tate map of Layer 0

Establish `TauCeti.HodgeTate.hodgeTateGradedComparison`. In the degree-one abelian comparison, define the ascending cohomological Hodge–Tate filtration on `gr⁰M=V⊗Ô_X` by `F_{−j}=(M∩t^jM₀)/(tM∩t^jM₀)`. CS17 Corollary 2.2.4 identifies `gr^j_HT(V⊗Ô_X)` with gr^j_Hodge(H)⊗Ô_X(−j). Dualizing and applying the Weil pairing gives the quotient `T_pA^∨⊗Ô_X→ω_A⊗Ô_X`. Its identification with Layer 0’s character differential, at points of good reduction, at classical points with semistable reduction and in families over the good-reduction locus, is 1.5; it does not use analytic density of ordinary points.

M,M₀ and their common `B_dR` realization are those of 1.1; `gr⁰B_dR=Ô_X`, while `gr⁰OB_dR` is not replaced by `Ô_X`.

Use CS17 Proposition 2.2.3 to compute intersections of the two lattices; passing to graded modules gives Corollary 2.2.4.

CS17 Proposition 2.2.5 identifies the first step with the natural cohomological edge map.

**Checks.**

- For the Tate curve both maps send the class corresponding to `μ_{p^∞}` to 0 and the class of `ℚ_p/ℤ_p` to dt/t.

[CS17](https://arxiv.org/abs/1511.02418), §2.2, Proposition 2.2.3, Corollary 2.2.4 and Proposition 2.2.5, PDF pp. 14–16; Remark 4.2.8, PDF p. 47: Defines the relative filtration using two lattices and compares its pointwise abelian map with the character construction. [CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), Theorem 4.13, Remark 4.14 and Proposition 4.15, PDF pp. 27–29: Proves the good-reduction agreement through the Kummer/logarithmic character calculation.

*Needs:* [1.1](#section-1-1); [0.4](#section-0-4); [0.3](#section-0-3); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §7.3 (relative hodge tate first step).

<a id="section-1-3"></a>

### 1.3 Hodge tensors under the p-adic comparison

Prove `TauCeti.HodgeTate.hodgeTensorComparison`. Let (G, X) be a Shimura datum of Hodge type with a symplectic embedding G ↪ GSp(V) and tensors `(s_α) ⊂ V^⊗` cutting out G, and `A → Sh_K` the induced abelian scheme. The tensors `s_α` define absolute Hodge cycles `s_{α,dR} ∈ ℋ^⊗` and `s_{α,ét} ∈ (V_pA)^⊗` (using homology, the dual of `R¹f_*ℚ_p) (AutomorphicBundles` B1), and under the relative comparison of 1.1, `s_{α,ét} ⊗ 1 ↦ s_{α,dR} ⊗ 1`. Consequently the comparison isomorphism and its Hodge–Tate graded piece are compatible with the G-structures, and the resulting rational frame torsors are G_{ℚ_p}-torsors.

The input that the tensors are absolute Hodge (Deligne) and that p-adic comparisons respect absolute Hodge cycles (Blasius, Wintenberger) is a proved dependency supplied by `AutomorphicBundles` B1 (absolute hodge propagation), not an assumption of the Hodge conjecture.

The tensors and frame torsor are rational. Integral tensors or a reductive G_{ℤ_p}-model require a chosen stable lattice and additional hypotheses; they do not follow for arbitrary Hodge-type level K.

Blasius: for an abelian variety over a number field the de Rham comparison maps the étale components of absolute Hodge cycles to the de Rham components.

Use `AutomorphicBundles` B1 (absolute hodge propagation) and CS17 §2.3: equality is horizontal, so compare at a classical point on each connected component. This supplies the rational tensor assertion, not integrality of its étale realisations.

**Checks.**

- For `G = GSp(V)` the only tensor is the symplectic form, and the statement is the compatibility of the comparison with the Weil pairing.

[CS17](https://arxiv.org/abs/1511.02418), §2.3, after Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 20: Caraiani–Scholze §2.3, proofs of Lemmas 2.3.6–2.3.7: Blasius's theorem on Hodge tensors under the comparison.

*Needs:* [1.1](#section-1-1); `AutomorphicBundles` B1 (absolute hodge propagation); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B1 (tensor frame torsor).

<a id="section-1-4"></a>

### 1.4 The degree-one Hodge–Tate sequence over an arbitrary C

Prove `TauCeti.HodgeTate.hodgeTateSpectralSequence`. Let C be a complete algebraically closed extension of `ℚ_p` and X a proper smooth rigid analytic variety over C. (1) There is a spectral sequence `E₂^{ij} = H^i(X, Ω^j_X)(−j) ⇒ H^{i+j}_ét(X, ℚ_p) ⊗_{ℚ_p} C`, functorial in X and compatible with cup products. (2) In degree one its five-term sequence gives `0 → H¹(X, O_X) → H¹_ét(X, ℚ_p) ⊗ C → H⁰(X, Ω¹_X)(−1) →^{d₂} H²(X, O_X)`. (3) For an abelian variety A over C of dimension g, d₂ vanishes on `H⁰(A, Ω¹_A)(−1)`, so `0 → H¹(A, O_A) → H¹_ét(A, ℚ_p) ⊗ C → H⁰(A, Ω¹_A)(−1) → 0` is exact; with `H¹(A, O_A) = Lie(A^∨)`, `H⁰(A, Ω¹_A) = ω_A` and the Weil pairing `T_pA^∨ ≅ H¹_ét(A, ℤ_p)(1)`, its Tate twist is `0 → Lie(A^∨) ⊗ C(1) → T_pA^∨ ⊗ C → ω_A ⊗ C → 0`. (4) The sequences of A and `A^∨` are dual to each other under the Weil pairing `H¹_ét(A, ℤ_p) × H¹_ét(A^∨, ℤ_p) → ℤ_p(−1)`. (5) If A and its isogenies and endomorphisms are defined over a complete discretely valued `K ⊂ C`, the sequence is Gal(C/K)-equivariant.

C complete algebraically closed of characteristic zero, X proper smooth; no descent of X to a discretely valued field is assumed. Degeneration in all degrees is not asserted here; it is `CohomologyComparisons` §2.15 (hodge tate degeneration). Degree one for abelian varieties needs only a dimension count.

(1) The primitive comparison theorem (`PadicHodgeTheory` §§2.1–2.7, 7.1–7.3, primitive comparison and proper smooth finiteness) gives `H^i_ét(X, ℤ/p^n) ⊗ O_C/p^n ≅^a H^i(X_ét, O⁺_X/p^n)` by induction on n, and its rational pro-étale form `H^i_ét(X, ℚ_p) ⊗ C ≅` H^i(X_proét, `Ô_X`), which P8 states together with it. The Leray spectral sequence of `ν`: X_proét `→ X_ét` with R^jν_*Ô_X ≅ Ω^j_X(−j) (PadicHodgeTheory §§2.1–2.7, 7.1–7.3, geometric Hodge–Tate direct images) is the stated spectral sequence; cup products are compatible because the identifications of `R^jν_*Ô` with `Ω^j(−j)` are by exterior powers and cup products.

(2) is the five-term exact sequence of a first-quadrant spectral sequence.

(3) `H¹_ét(A, ℤ_p)` is free of rank 2g (A[p^n](C) `≅ (ℤ/p^n)^{2g}`, `AbelianSchemesAndArithmeticModuli` A4 (p divisible group)), while `H¹(A, O_A)` and `H⁰(A, Ω¹_A)` have dimension g (A4.2–A4.3 at a point); the image of `H¹_ét ⊗ C` in `H⁰(Ω¹)(−1)` therefore has dimension g and the map is onto, so `d₂ = 0` on that term. The identifications are A4.2–A4.3 and the Weil pairing of A3.5.

(4) The first Chern class of the Poincaré bundle on `A × A^∨` encodes both the de Rham duality between `H¹(A, O_A)` and `H⁰(A^∨, Ω¹)` and the étale Weil pairing; compatibility of the spectral sequence with cup products and Chern classes gives the duality.

(5) The construction is functorial for morphisms of rigid spaces and for automorphisms of C over K.

**Checks.**

- For an elliptic curve E over C, the sequence reads `0 → C(1) → T_pE ⊗ C → C → 0` after choosing a basis of `ω_E`, with the line of the connected part as the first term when E has ordinary good reduction.
- For X a point, the sequence is `C = C`; for `X = ℙ¹` (not an abelian variety) `H¹` vanishes and `E₂^{0,1} = H⁰(Ω¹) = 0`, so the degree-one statement is vacuous.
- For `A = E` with good supersingular reduction, the quotient `T_pE^∨ ⊗ C → ω_E ⊗ C` is surjective, although the integral map `T_pE^∨ ⊗ O_C → ω_E` is not: its cokernel is nonzero (its reduction modulo p is the cokernel of the Hodge–Tate map of E[p], nonzero at positive Hasse height) and is only bounded, being killed by `p^{1/(p−1)} (0.5)`. The rational statement does not see the integral defect.

[CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), Theorem 3.20 and Remark 3.21, PDF p. 20: the Hodge–Tate spectral sequence for proper smooth rigid spaces over C and the cases in which it degenerates. [CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), proof of Theorem 3.20 and Proposition 3.23, PDF p. 21: the route through primitive comparison, the derived inverse limit, and the higher direct images `R^jν_*Ô = Ω^j(−j)`. [CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), Proposition 4.10, PDF p. 26: duality of the Hodge–Tate sequences of A and its dual under the Weil pairing, through the Poincaré bundle.

*Needs:* `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness); `PadicHodgeTheory` §2.4 (geometric hodge tate direct images); `AbelianSchemesAndArithmeticModuli` A3.5; `AbelianSchemesAndArithmeticModuli` A4.2; `AbelianSchemesAndArithmeticModuli` A4.3; `AbelianSchemesAndArithmeticModuli` A4 (p divisible group); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (tate twists).

Applications include 2.5 (the rational Hodge–Tate sequence of an abelian variety over an arbitrary C) and 2.7 (the flag point).

<a id="section-1-5"></a>

### 1.5 The relative Hodge–Tate quotient is the character differential

Prove `TauCeti.HodgeTate.relativeHodgeTate_eq_character`. Let K be a finite extension of `ℚ_p`, X a smooth rigid space over K and f: `A → X` an abelian scheme as in 1.1, with q: `T_pA^∨ ⊗ Ô_X → ω_A ⊗ Ô_X` the quotient of 1.2. (1) At a geometric point x̄: `Spa(C_x, C_x⁺) → X` such that `A_x̄` has good reduction, that is extends to an abelian scheme 𝒜 over `O_{C_x}`, the fibre of q is the C_x-linearization of the character differential `α` of `𝒜^∨[p^∞] (0.4)`. (2) At a classical point x (residue field finite over K) and a geometric point above it, the fibre of q is the quotient described through the Raynaud extension in 0.18. (3) q is the unique map of `Ô_X`-modules on X_proét with (2) at all classical points. (4) If 𝔛 is a formal model of an open `U ⊂ X` over which A extends to an abelian scheme 𝒜, then on every affinoid perfectoid `V = Spa(R, R⁺)` in U_proét with `A[p^∞]` trivialized, `q|_V` is the R-linearization of the character differential of `𝒜^∨[p^∞]_{R⁺}`.

K finite over `ℚ_p`; X smooth; A the analytification of an algebraizable abelian scheme as in 1.1. The pointwise statements need the stated reduction hypotheses; the uniqueness statement uses only classical points.

(1) The fibre of q at x̄ is the Hodge–Tate quotient of 1.4 for A_x̄ (1.2 commutes with pullback to points). For good reduction, CDM12 Proposition 4.15 identifies it with the character differential: duality (1.4 (4)) reduces to one map, which for a character `λ`: `𝒜[p^∞] → μ_{p^∞}` is the pullback of the Kummer class of the coordinate of the unit disc, whose logarithmic differential is dt/t.

(2) is 0.18 at the classical point, after the finite extension over which `A_x` has semistable reduction.

(3) Dualizing the exact sequence `0 → Lie(A^∨) ⊗ Ô_X(1) → T_pA^∨ ⊗ Ô_X →^{q} ω_A ⊗ Ô_X → 0` of 1.2 and tensoring with `ω_A` gives `0 → End(ω_A) ⊗ Ô_X → Hom(T_pA^∨, ω_A) ⊗ Ô_X → (Lie(A^∨)^∨ ⊗ ω_A) ⊗ Ô_X(−1) → 0`, the first map being `φ ↦ φ ∘ q`. On an affinoid with a toric chart, global sections of `E ⊗ Ô_X(j)`, E a vector bundle, vanish for `j ≠ 0` and are E for `j = 0`, because `Ô(j) = gr^jB_dR` embeds in `gr^jOB_dR` (the map `B_dR → OB_dR` is strict) and Scholze 2013 Proposition 6.16 (ii) computes the sections of `gr^jOB_dR`. Hence every map of `Ô_X-modules T_pA^∨ ⊗ Ô_X → ω_A ⊗ Ô_X` is `φ ∘ q` for an analytic endomorphism `φ` of `ω_A`. If two maps q and q′ both satisfy (2), then `q − q′ = φ ∘ q` with `φ` vanishing at all classical points (q is surjective at points), so `φ = 0` because classical points are Zariski dense in the reduced space X.

(4) R is uniform, so a section of a finite free R-module vanishing at every point of `Spa(R, R⁺)` is zero; at every point, (1) applies because 𝒜 gives good reduction there.

**Checks.**

- For the Tate curve over the punctured disc, q sends the class of `μ_{p^∞}` to 0 and the class of `ℚ_p/ℤ_p` to dt/t, matching 0.18 at classical points.
- For a constant family `A = X × A₀` with A₀ of good reduction, q is the constant extension of the character differential of A₀.
- Uniqueness uses the vanishing of sections of `Ô(−1)` over X defined over the finite extension K: after base change to C a choice of Tate basis identifies `Ô(−1)` with `Ô`, and the argument of (3) no longer applies, which is why (3) is stated over K.

[CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), Proposition 4.15 and its proof, PDF pp. 28–29: the Hodge–Tate sequence of an abelian variety with good reduction over `O_C` coincides with Fargues's character sequence of its p-divisible group, through the Kummer class of the unit disc. [SCH13](https://arxiv.org/abs/1205.3463), Proposition 6.16, PDF p. 39 (arXiv:1205.3463v2): the cohomology of `gr^iOB_dR` on affinoids with toric charts vanishes unless `i = 0`, where `H⁰` is the ring of functions. [CS17](https://arxiv.org/abs/1511.02418), Remark 4.2.8, PDF p. 47: the relative Hodge–Tate filtration of an abelian family agrees pointwise with the character construction.

*Needs:* [1.2](#section-1-2); [1.4](#section-1-4); [0.4](#section-0-4); [0.18](#section-0-18); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §§2.1–2.4 (de rham period sheaf); `PadicHodgeTheory` §§2.1–2.4 (graded de rham period sheaf tate twist).

Applications include 2.6 (the relative sequence is the character sequence in families), 2.12 (the period map on perfectoid test objects of the good-reduction locus), 4.4–4.8 (the Hodge–Tate coordinate computed from canonical subgroups).

### Examples

For a Tate module of a good-reduction elliptic curve, the degree-one quotient is the character differential, with target `ω_A` and kernel `Lie(A^∨)(1)`. The two horizontal lattices distinguish constant from structural de Rham periods. The detailed computations and negative controls are included with the definitions above.

### Dependencies

Layer 0; `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3; `PadicHodgeTheory` §8.3; `CohomologyComparisons` §0.4; `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; `AbelianSchemesAndArithmeticModuli` A4; `AdicEtaleGeometry` A1; `PerfectoidSpaces` P0; `AutomorphicBundles` B1; `AbelianSchemesAndArithmeticModuli` A3. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 2: Hodge–Tate exact sequence and torsors

Layer 2 begins with the p-level Shimura tower at fixed tame level, its right `G(ℚ_p)`-action with the prime-to-p Hecke translations, and its limit v-sheaf over `Spd(C, O_C)`. These three constructions supply the tower interface. On them Layer 2 builds the Hodge–Tate exact sequences over `O_C` and on the pro-étale site, the Hodge–Tate flag point, the PEL and Hodge-type conditions on the filtration, the tensor filtration and the Hodge–Tate parabolic reduction with its Levi torsor and the cyclotomic comparison with the de Rham torsor. It ends with the period map `π_HT` on the open limit tower, constructed before perfectoid representability, and its Levi and automorphic-bundle pullback formulas. Perfectoid incarnations and compactified extensions are PerfectoidShimuraVarieties S1–S3.

<a id="section-2-1"></a>

### 2.1 The p-level tower of a Shimura datum at fixed tame level

Construct `ShimuraTower.pLevel`. Let (G, X) be a pure Shimura datum with reflex field E for which `ShimuraVarieties` Layer 8 supplies actual canonical models together with their descended level maps and minimal compactifications; this holds for data of abelian type through Layers 6 and 8 (abelian instance), which include the Siegel, PEL, Hodge-type and Hilbert data of Layer 2–Layer 5. Fix a prime p, a complete algebraically closed nonarchimedean field C of characteristic 0 over `ℚ_p`, an embedding `ι`: `E → C` and a compact open subgroup `K^p ⊂ G(𝔸_f^p)`. Let `CO_p` be the set of compact open subgroups of `G(ℚ_p)` ordered by inclusion; it is nonempty (intersect a closed faithful embedding `G(ℚ_p) ⊂ GL_d(ℚ_p)` with `GL_d(ℤ_p)`) and cofiltered because `K_p ∩ K′_p` is again compact open. The p-level tower at tame level `K^p` is the functor on `CO_p` that sends `K_p` to the analytic adic space `S_{K_p} := (Sh_{K^pK_p}(G, X) ⊗_{E,ι} C)^{ad}` over `Spa(C, O_C)`, and an inclusion `K′_p ⊆ K_p` to the analytification `π_{K′_p,K_p}`: `S_{K′_p} → S_{K_p}` of the descended forgetful map. The compactified tower `K_p ↦ S*_{K_p} := (Sh^{min}_{K^pK_p}(G, X) ⊗_{E,ι} C)^{ad}`, with the extended level maps, contains the open tower as the complement of the boundary, functorially in `K_p`. Every transition map is finite, and on the open tower it is finite étale when `K^pK_p` is neat. If `σ`: `C ≅ ℂ` is an isomorphism of abstract fields (one exists exactly when C has the cardinality of the continuum, for instance `C = ℂ_p`), then through `σ ∘ ι` the C-points are `S_{K_p}(C) = G(ℚ) ∖ (X × G(𝔸_f)/K^pK_p)`, compatibly with the transition maps.

(G, X) lies in the class of data whose canonical models and level maps are supplied: abelian type, through Layers 6 and 8 (abelian instance). General data with the Layer 7 and §8.22 models are handled by PerfectoidShimuraVarieties S0.general, which builds on this construction.

C is complete, algebraically closed and of characteristic 0 over `ℚ_p`, and the tower depends on `ι`. Descent of the tower to `E_v` or to another finite extension of `ℚ_p` is a separate statement, not part of this notation.

Neatness is needed only for étaleness; finiteness of the level maps holds without it (`ShimuraVarieties` Layer 8 (finite level maps)).

The index used here is the fixed-tame-level restriction of the `ShimuraVarieties` Layer 8 level tower to the levels `K^pK_p` with `K^p` fixed, indexed by the poset `CO_p` of subgroups of `G(ℚ_p)`.

Restrict the algebraic tower of `ShimuraVarieties` Layer 8 (level tower) and its finite level maps (`ShimuraVarieties` Layer 8 (finite level maps), instantiated for abelian type by `ShimuraVarieties` Layer 8 (abelian instance)) to the levels `K^pK_p` with `K_p ∈ CO_p`. Base change along `ι` and apply the analytification functor of `AdicSpacesPartII` R1, which preserves finite and étale morphisms (R1 (analytification finite), R1 (analytification etale smooth)).

For the compactified tower use the projective normal models over E of `ShimuraVarieties` Layer 8 (minimal descent) and the finite extended level maps of `ShimuraVarieties` Layer 8 (minimal map extension). The level maps carry boundary to boundary and interior to interior, so the open tower is the complement of the boundary termwise and functorially.

Identity and composition laws are inherited from the algebraic tower. For the points, base change of the canonical models along `σ ∘ ι` is the complex Shimura variety, whose points are the double cosets of `ShimuraVarieties` Layer 1 (analytic points); an identity between algebraic maps that holds over `ℂ` holds over E, hence after base change to any C, so no identification of C with `ℂ` is needed beyond the points statement.

The interface consists of the following named results.

- `ShimuraTower.pLevel`: The functor `K_p ↦ S_{K_p}` on compact open subgroups of `G(ℚ_p)`, for fixed (G, X), `K^p`, C and `ι`.
- `ShimuraTower.pLevelMin`: The minimally compactified tower `K_p ↦ S*_{K_p}` with its finite extended level maps.
- `ShimuraTower.toMin`: The open immersion of towers `S_{K_p} → S*_{K_p}`, with complement the boundary, natural in `K_p`.
- `ShimuraTower.transition_finite`: Every transition map is finite; on the open tower it is finite étale when `K^pK_p` is neat.
- `ShimuraTower.transition_comp`: `π_{K″_p,K_p} = π_{K′_p,K_p} ∘ π_{K″_p,K′_p}` and `π_{K_p,K_p} = id`.
- `ShimuraTower.points_eq_doubleCoset`: For a field isomorphism `σ`: `C ≅ ℂ`, `S_{K_p}(C) ≅ G(ℚ) ∖ (X × G(𝔸_f)/K^pK_p)` through `σ ∘ ι`, compatibly with transition maps.
- `ShimuraTower.reindex`: Restriction along a cofinal family of levels (an initial functor into `CO_p`) does not change the limits formed from the tower.

**Checks.**

- `ShimuraTower.pLevel_gl2_components`: For `GL_2`, `K^p = K(N)^p` with `N ≥ 3` prime to p and `K_p = K(p^m)`, `S*_{K_p}` has φ(Np^m) connected components, each the analytification of the connected complete modular curve X(Np^m, ζ)_C with a fixed primitive Weil-pairing value `ζ`. Their disjoint union is the full-basis modular curve X_full(Np^m)_C of TauCetiRoadmap ModularCurves; X_full is not the name of one component.
- `ShimuraTower.pLevel_gl2_transition_degree`: For `GL_2`, `N ≥ 3` and `m ≥ 1`, the map `S_{K(p^{m+1})} → S_{K(p^m)}` is finite étale of degree `p⁴ = [K(p^m) : K(p^{m+1})]`; no element of `K(p^m)` outside `K(p^{m+1})` acts trivially, because `−1 ∉ K(N)^p`.
- `ShimuraTower.pLevel_torus`: For a torus datum (T, {h}) every term is the finite set `T(ℚ)\T(𝔸_f)/K^pK_p` of C-points, viewed as a zero-dimensional adic space, and the transition maps are surjective.
- `ShimuraTower.pLevel_not_base_change`: For `GL_2` the tower over C is not the base change of a tower of geometrically connected spaces over `ℚ_p`: the component set (ℤ/Np^m)^× carries the cyclotomic Galois action, so a component is defined only over ℚ_p(ζ_{Np^m}).

- The `GL_2` component count and transition degree tests hold with the stated neatness assumption `N ≥ 3`.
- Restricting to a cofinal family of levels, for instance the principal congruence subgroups of a fixed integral model, gives a canonically isomorphic limit (`ShimuraTower.reindex`).

[MILNE-SV](https://www.jmilne.org/math/xnotes/svi.pdf), §5, 'Passage to the limit', Theorem 5.28 and Remark 5.29, p. 65: The Shimura varieties for varying compact open K form an inverse system with finite quotient maps and a right action of `G(𝔸_f)`, with `S_K` the quotient of `S_{K′}` by K/K′ for K′ normal in K. [CS17](https://arxiv.org/abs/1511.02418), §2.1, Theorem 2.1.2, PDF p. 11: For sufficiently small tame level the finite-level spaces `(S_{K^pK_p} ⊗ E_p)^{ad}` form the tower whose tilde-limit is the perfectoid Shimura variety; the tower itself is the input here.

*Needs:* `ShimuraVarieties` Layer 8 (level tower); `ShimuraVarieties` Layer 8 (finite level maps); `ShimuraVarieties` Layer 8 (minimal descent); `ShimuraVarieties` Layer 8 (minimal map extension); `ShimuraVarieties` Layer 8 (abelian instance); `ShimuraVarieties` Layer 1 (analytic points); `AdicSpacesPartII` R1 (analytification functor); `AdicSpacesPartII` R1 (analytification finite); `AdicSpacesPartII` R1 (analytification etale smooth); `CategoryTheory.IsCofiltered`; `CategoryTheory.Functor`.

Applications include [2.3](#section-2-3): its limit over `CO_p` is the open and the compactified infinite-level diamond; [5.2](#section-5-2): the anticanonical full-level Hilbert tower is a subtower of this tower for the Hilbert G* datum; Caraiani–Scholze 2017, §2.1, Theorem 2.1.2: the perfectoid Shimura variety at tame level `K^p` is a tilde-limit of exactly these finite-level spaces; PerfectoidShimuraVarieties S1, S2, S4, S5: the Siegel, Hodge-type, preabelian and Hilbert representability theorems are stated for this tower.

<a id="section-2-2"></a>

### 2.2 The right action of `G(ℚ_p)` and the prime-to-p Hecke translations on the p-level tower

Construct `ShimuraTower.translate`. In the situation of 2.1, let `g ∈ G(ℚ_p)`, embedded in `G(𝔸_f)` with trivial prime-to-p component, and `K_p ∈ CO_p`. The analytified descended right translation `T_g`: `S_{K_p} →` S_{g⁻¹K_pg} (on complex points before descent, [`x, a] ↦ [x`, ag]) is an isomorphism, and it extends to the compactified tower. These isomorphisms satisfy `T_1 = id`, `T_{gh} = T_h ∘ T_g`, and `π ∘ T_g = T_g ∘ π` for the transition maps `π`; for `k ∈ K_p` the map `T_k` on `S_{K_p}` is the identity. Hence, for `K′_p` normal in `K_p`, the finite group `K_p/K′_p` acts on `S_{K′_p}` over `S_{K_p}`, and `G(ℚ_p)` acts on the right on the pro-system `(S_{K_p})_{K_p}`, an action in the sense of Deligne. For `h ∈ G(𝔸_f^p)` the translations `S_{K^pK_p} →` S_{h⁻¹K^phK_p} commute with all `T_g` and all transition maps.

As in 2.1; g ranges over all of `G(ℚ_p)`, not only over a compact open subgroup.

The action is C-linear because it is formed after base change along `ι`. Scholze's spaces over `ℚ_p^cycl` carry a `GSp_{2g}(ℚ_p)`-action that moves the structure map to `Spa(ℚ_p^cycl)` (torsion paper, footnote 7); that twisted form is a different object and is not this action.

Base change along `ι` and analytify the descended algebraic right translations of `ShimuraVarieties` Layer 8 (translation laws) and their extensions to minimal models (`ShimuraVarieties` Layer 8, minimal map extension).

The identities `T_1 = id`, `T_{gh} = T_h ∘ T_g` and `T_k = id` for `k ∈ K_p` are the translation laws of `ShimuraVarieties` Layer 8; on complex points they are the double-coset formulas of `ShimuraVarieties` Layer 1 (right translation). Identities of algebraic maps descend from `ℂ` to E and survive base change to C and analytification.

Commutation with transition maps and with prime-to-p translations is the same double-coset computation: [`x, a] ↦ [x`, ag] and [`x, a] ↦ [x`, ah] commute because g and h are supported at disjoint sets of places.

The interface consists of the following named results.

- `ShimuraTower.translate`: `T_g`: `S_{K_p} →` S_{g⁻¹K_pg} for `g ∈ G(ℚ_p)`.
- `ShimuraTower.translate_one`: `T_1 = id`.
- `ShimuraTower.translate_mul`: T_{gh} = T_h ∘ T_g (a right action).
- `ShimuraTower.translate_of_mem`: `T_k = id` on `S_{K_p}` for `k ∈ K_p`.
- `ShimuraTower.translate_comm_transition`: `π ∘ T_g = T_g ∘ π` for compatible levels.
- `ShimuraTower.primeToPHecke`: Translations by `h ∈ G(𝔸_f^p)`, commuting with every `T_g` and every transition map.
- `ShimuraTower.quotientAction`: For `K′_p` normal in `K_p`, the action of `K_p/K′_p` on `S_{K′_p}` over `S_{K_p}`.

**Checks.**

- `ShimuraTower.translate_mul_order`: For non-commuting g, `h ∈ GL_2(ℚ_p)`, `T_{gh} = T_h ∘ T_g`, and on C-points T_{gh} `≠ T_g ∘ T_h` in general: the action is a right action.
- `ShimuraTower.translate_center_gl2`: For `GL_2`, `K^p = K(N)^p` with `N ≥ 3` prime to p, and `z = p·1 ∈ Z(ℚ_p)`, the translation `T_z` on `lim_{K_p} S_{K_p}(C)` equals translation by the prime-to-p scalar `p⁻¹`; it is the identity exactly when p ≡ 1 mod N.
- `ShimuraTower.translate_trivial_subgroup`: For the datum (`𝔾_m`, {norm}) with X a point, p odd, `K^p = Ẑ^{p×}`, `K_p = ℤ_p^×` and `K′_p = 1 + pℤ_p`: `S_{K′_p} = 𝔽_p^×/{±1}`, and quotientAction of `K_p/K′_p = 𝔽_p^×` is translation whose trivially acting subgroup is {±1}, the image of `ℚ^× ∩ K^pK_p`.

- The order test distinguishes the right action from the left action `T_g ∘ T_h`.
- The GL₂ centre test detects the prime-to-p congruence condition controlling triviality of this scalar. General action-kernel descriptions remain PerfectoidShimuraVarieties S0's targets.

[MILNE-SV](https://www.jmilne.org/math/xnotes/svi.pdf), §5, 'Passage to the limit', Remark 5.29(b)–(c), p. 65: The right action of `G(𝔸_f)` on the system by isomorphisms `S_K →` S_{g⁻¹Kg}, `[x, a′] ↦ [x, a′g]`, with elements of K acting trivially and K/K′ acting on `S_{K′}`.

*Needs:* [2.1](#section-2-1); `ShimuraVarieties` Layer 8 (translation laws); `ShimuraVarieties` Layer 8 (minimal map extension); `ShimuraVarieties` Layer 1 (right translation); `MulAction.toPermHom`.

Applications include [2.12](#section-2-12): G(ℚ_p)-equivariance and prime-to-p Hecke equivariance of `π_HT` are stated for this action; [5.12](#section-5-12): the twist `u_n =` translation by diag(p^n, 1) and the `Γ₀*(p)`-action on the anticanonical tower; Scholze, torsion paper, Theorem 3.1.2(i): the perfectoid Siegel space carries the `GSp_{2g}(ℚ_p)`-action for which the tilde-limit is equivariant; PerfectoidShimuraVarieties S0, S3, S4, S5: kernels of the action, equivariance of `π_HT`, property (P) and the Hilbert three-tower comparison.

<a id="section-2-3"></a>

### 2.3 The infinite-level Shimura diamond `S^◇_{K^p,∞}`

Construct `ShimuraTower.infiniteLevel`. In the situation of 2.1, put `S^◇_{K^p,∞} := lim_{K_p} (S_{K_p})^◇` and `S^{*◇}_{K^p,∞} := lim_{K_p} (S*_{K_p})^◇`, limits of v-sheaves on perfectoid spaces over `Spd(C, O_C)` of the diamonds of `DiamondsAndVStacks` D6; no perfectoidness is assumed. Then: (i) `S^{*◇}_{K^p,∞}` is a spatial diamond, its projections to the finite levels are quasicompact and quasiseparated, and `|S^{*◇}_{K^p,∞}| → lim_{K_p} |S*_{K_p}|` is a homeomorphism; (ii) `S^◇_{K^p,∞}` is the open subdiamond over the complement of the boundary, a locally spatial diamond with `|S^◇_{K^p,∞}| ≅ lim_{K_p} |S_{K_p}|`; (iii) for a perfectoid `(R, R⁺)` over `(C, O_C)`, `S^◇_{K^p,∞}(R, R⁺) = lim_{K_p} S_{K_p}(R, R⁺)`; (iv) the right action of 2.2 induces a right action of `G(ℚ_p)` on `S^◇_{K^p,∞}` and `S^{*◇}_{K^p,∞}`, continuous on compact open subgroups (each `K_p` acts on the K′_p-stage through the finite quotient `K_p/K′_p` for `K′_p` normal in `K_p`); (v) when `K^pK_p` is neat, `S^◇_{K^p,∞} → (S_{K_p})^◇` is separated and quasi-pro-étale: after pullback to a strictly totally disconnected perfectoid test space it is represented by the pro-étale limit of the finite étale covers above `K_p`. A cofinal family of levels gives a canonically isomorphic limit.

The limit is formed in v-sheaves over `Spd(C, O_C)` along the cofiltered poset `CO_p`, or along any family of levels that is initial in it.

`S*_{K_p}` is the analytification of a projective variety, hence quasicompact and quasiseparated; this gives spatiality in (i). The open tower is only locally spatial.

Each `(S*_{K_p})^◇` is a spatial diamond and each `(S_{K_p})^◇` a locally spatial diamond, with the same underlying topological space as the adic space (`DiamondsAndVStacks` D6 (etale site comparison), D5 (spatial diamond)).

The transition maps are finite, hence quasicompact and quasiseparated. Scholze's limit lemma (`DiamondsAndVStacks` D5 (limits and finite stage comparisons), ECD Lemma 11.22) gives (i). For (ii) the preimage of the open complement of the boundary is an open subdiamond (D4, underlying topological space), and the same lemma applies to the open tower.

(iii) is the evaluation of a limit of sheaves on `Spd(R, R⁺)`, using the description of the diamond functor on perfectoid test objects (D6, gluing and the diamond functor).

(iv): the `T_g` commute with the transition maps, so they induce maps of limits; a compact open `K_p` acts on each stage `S_{K′_p}` with `K′_p` normal in `K_p` through the finite group `K_p/K′_p`, hence continuously.

(v): pull back along a strictly totally disconnected perfectoid `T → (S_{K_p})^◇`. The finite étale covers at finer levels become finite étale affinoid perfectoid spaces over T. Their limit is affinoid perfectoid by `PerfectoidSpaces` P5 (cofiltered limits of affinoid perfectoid spaces) (ECD Proposition 6.5); its map to T is pro-étale, since over every rank-one point its fibre is that point times an inverse limit of finite discrete sets (`DiamondsAndVStacks` D1 (pro etale maps over std base), ECD Lemma 7.19). The projection is separated as a limit of separated maps. This proves quasi-pro-étaleness by `DiamondsAndVStacks` D3 (etale and quasi pro etale morphisms of stacks) (ECD Definition 10.1 and Convention 10.2). Independence of the cofinal family uses Mathlib's `CategoryTheory.Functor.Initial.limitIso`.

The interface consists of the following named results.

- `ShimuraTower.infiniteLevel`: `S^◇_{K^p,∞} = lim_{K_p} (S_{K_p})^◇` as a v-sheaf over `Spd(C, O_C)`.
- `ShimuraTower.infiniteLevelMin`: `S^{*◇}_{K^p,∞} = lim_{K_p} (S*_{K_p})^◇`.
- `ShimuraTower.infiniteLevel.proj`: The quasicompact quasiseparated projections to each finite level.
- `ShimuraTower.infiniteLevelMin_isSpatial`: `S^{*◇}_{K^p,∞}` is a spatial diamond.
- `ShimuraTower.infiniteLevel_isLocallySpatial`: `S^◇_{K^p,∞}` is a locally spatial diamond, open in `S^{*◇}_{K^p,∞}`.
- `ShimuraTower.infiniteLevel_space_homeo`: `|S^{*◇}_{K^p,∞}| ≅ lim |S*_{K_p}|` and `|S^◇_{K^p,∞}| ≅ lim |S_{K_p}|`.
- `ShimuraTower.infiniteLevel_points`: `S^◇_{K^p,∞}(R, R⁺) = lim S_{K_p}(R, R⁺)` for perfectoid `(R, R⁺)` over `(C, O_C)`.
- `ShimuraTower.infiniteLevel_action`: The induced right action of `G(ℚ_p)`, continuous on compact open subgroups.
- `ShimuraTower.infiniteLevel_quasiProEtale`: At neat level the open projection is separated and quasi-pro-étale; over a strictly totally disconnected perfectoid test space its pullback is represented by an affinoid pro-étale map.
- `ShimuraTower.infiniteLevel_reindex`: Restriction to an initial family of levels gives a canonically isomorphic limit.
- `ShimuraTower.infiniteLevel.lift`: For a v-sheaf Y over `Spd(C, O_C)` with compatible maps `f_K:Y → (S_K)^◇`, there is a unique map `Y → S^◇_{K^p,∞}` with those projections; likewise for the minimally compactified tower.
- `ShimuraTower.infiniteLevel.lift_proj`: The composite of the lifted cone map with proj_K equals `f_K`, for every level K.
- `ShimuraTower.infiniteLevel.hom_ext`: Two maps into either limit diamond agree when their composites with all finite-level projections agree.

**Checks.**

- `ShimuraTower.infiniteLevel_torus`: For (`𝔾_m`, {norm}) with X a point and `K^p = Ẑ^{p×}`, `|S^◇_{K^p,∞}|` is the profinite set `lim_{K_p} ℚ^×\𝔸_f^×/K^pK_p = ℤ_p^×/{±1}`, and `ℚ_p^×` acts through `ℚ_p^×/±p^ℤ` by multiplication.
- `ShimuraTower.infiniteLevel_gl2_points`: For `GL_2` and `K^p ⊆ K(N)^p` with `N ≥ 3`, the (C, O_C)-points of `S^◇_{K^p,∞}` are the isomorphism classes of elliptic curves E over C with level-K^p structure and a trivialisation `α`: `ℤ_p² ≅ T_pE`, the compatible systems of full level-p^m structures of the modular-curve moduli interpretation.
- `ShimuraTower.infiniteLevel_not_perfectoid`: The definition does not make `S^◇_{K^p,∞}` perfectoid: along a non-cofinal family with a least element `K_p⁰` the limit is the diamond of the rigid space `S_{K_p⁰}` of positive dimension, which is not representable by a perfectoid space.
- `ShimuraTower.infiniteLevel_least_level`: If the index family has a least element `K_p⁰`, the limit is `(S_{K_p⁰})^◇` itself.

- Over the open tower, the limit of the (C, O_C)-points is the set of compatible systems of level structures, as in the `GL_2` test.
- Representability by a perfectoid space is not part of this construction; it is PerfectoidShimuraVarieties S1–S2's theorem about this limit.

[ECD](https://arxiv.org/abs/1709.07343v4), §11, Lemma 11.22, p. 63: A cofiltered limit of diamonds along quasicompact quasiseparated transition maps is a diamond with quasicompact quasiseparated projections, (locally) spatial when the terms are, with underlying space the limit of the underlying spaces. [CS17](https://arxiv.org/abs/1511.02418), §2.1, Theorem 2.1.2, PDF p. 11: The perfectoid Shimura variety is a tilde-limit of the finite-level spaces of fixed tame level; its diamond is the limit formed here. [ECD](https://arxiv.org/abs/1709.07343v4), §6, Proposition 6.5, p. 29; §7, Lemma 7.19, p. 37; §10, Definition 10.1 and Convention 10.2, pp. 49–50: Affinoid perfectoid inverse limits exist. Over a strictly totally disconnected base, the profinite-fibre criterion proves pro-étaleness of the limit of finite étale covers; the diamond projection is therefore quasi-pro-étale with the required local separatedness.

*Needs:* [2.1](#section-2-1); [2.2](#section-2-2); `DiamondsAndVStacks` D6 (gluing and the diamond functor); `DiamondsAndVStacks` D6 (etale site comparison); `DiamondsAndVStacks` D5 (limits and finite stage comparisons); `DiamondsAndVStacks` D5 (spatial diamond); `DiamondsAndVStacks` D4 (underlying topological space); `CategoryTheory.Limits.limit`; `CategoryTheory.Functor.Initial.limitIso`; `PerfectoidSpaces` P5 (cofiltered limits of affinoid perfectoid spaces); `DiamondsAndVStacks` D1 (pro etale maps over std base); `DiamondsAndVStacks` D3 (etale and quasi pro etale morphisms of stacks).

Applications include [2.12](#section-2-12): `π_HT` is a morphism of v-sheaves out of `S^◇_{K^p,∞}`, constructed before perfectoid representability; [5.2](#section-5-2): the anticanonical full-level tower is an open subdiamond of the Hilbert infinite-level diamond; Hansen–Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures, Theorem 1.5: the representability theorem is an isomorphism with this limit of diamonds; PerfectoidShimuraVarieties S0–S6: perfectoid representatives, components, property (P) and the toroidal tower diamond are all built on this limit.

<a id="section-2-4"></a>

### 2.4 The Hodge–Tate exact sequence of a p-divisible group over `O_C`

Prove `TauCeti.HodgeTate.pDivisibleHodgeTateSequence`. Let C be a complete algebraically closed extension of `ℚ_p` and G a p-divisible group over `O_C` of height h and dimension d, with Cartier dual `G^D`. Then the sequence `0 → Lie(G) ⊗_{O_C} C(1) → T_pG ⊗_{ℤ_p} C → ω_{G^D} ⊗_{O_C} C → 0` is exact, where the second map is `α_G ⊗ C (0.4)` and the first is the C-linearisation of the dual map `α_{G^D}^∨` twisted by `ℤ_p(1)` through the Cartier pairing `T_pG × T_pG^D → ℤ_p(1)`. Integrally, `α_G ⊗ 1`: `T_pG ⊗ O_C → ω_{G^D}` has cokernel killed by `p^{1/(p−1)} (0.5)` and the composite of the two maps is zero.

G is over `O_C`; its conormal modules and dimensions are 0.25 and its integral Faltings complex is 0.5.

The zero composite and integral annihilator estimates are inputs independent of dimension counts.

Use 0.5 for the actual integral complex and its zero composite (CDM12 Theorem 4.13).

After inversion of p, the character map is surjective; apply the same bound to `G^D` and dualize via the Cartier Tate pairing to see that the first map is injective.

Use `dim Lie G=d`, `dim ω_GD=h−d (0.25)` and `rank T_pG=h` to identify image and kernel. The resulting sequence is natural and twisted by C(1) on the Lie term.

**Checks.**

- For `G = μ_{p^∞}`: `0 → C(1) → C(1) → 0 → 0`; for `G = ℚ_p/ℤ_p`: `0 → 0 → C → C → 0`.
- For `G = E[p^∞]` with E elliptic over `O_C`, both outer terms are one-dimensional.

[CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), Theorem 4.13, PDF pp. 27–28: The bounded integral complex becomes an exact Hodge–Tate sequence after inverting p. [SW13](https://arxiv.org/abs/1211.6357), §4.3, Proposition 4.3.6, PDF p.39 (arXiv:1211.6357v2): Uses the canonical Hodge–Tate exact sequence in the `O_C` classification setting.

*Needs:* [0.4](#section-0-4); [0.5](#section-0-5); [0.3](#section-0-3); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible tate module); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (tate twists); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.

<a id="section-2-5"></a>

### 2.5 The Hodge–Tate sequence of an abelian variety

Prove `TauCeti.HodgeTate.abelianHodgeTateSequence`. Let C be a complete algebraically closed extension of `ℚ_p` and A an abelian variety over C of dimension g. There is a canonical exact sequence `0 → Lie(A^∨)(1) → T_pA^∨ ⊗_{ℤ_p} C → ω_A → 0` (the roadmap's convention, with `Lie(A^∨)(1) := Lie(A^∨) ⊗ C(1)`), functorial in A, compatible with isogenies, with endomorphisms and with polarisations; for A defined over a complete discretely valued `K ⊂ C` it is Gal(C/K)-equivariant. Dually, the Hodge–Tate filtration `Lie A ⊗ C(1) ⊂ T_pA ⊗ C` is a Lagrangian subspace for the Weil pairing of any principal polarisation. For A with good reduction it is the sequence of 2.4 for `G = A^∨[p^∞]`; over arbitrary C its rational sequence is 1.4; for A defined over a complete discretely valued `K ⊂ C` the Raynaud character description is 0.18.

No good reduction is required for the rational analytic abelian sequence; the semistable character description is stated for abelian varieties over a complete discretely valued K (0.18).

For A/K, a Galois-equivariant filtration is asserted; no canonical Galois-equivariant splitting is claimed.

Apply the degree-one Hodge–Tate sequence of 1.4 over the given arbitrary complete algebraically closed C: `0→H¹(A,𝒪_A)⊗C→H¹_ét(A,ℚ_p)⊗C→H⁰(A,Ω¹_A)⊗C(−1)→0`.

Use `A4’s H¹(A,𝒪_A)=Lie(A^∨)`, `H⁰(A,Ω¹_A)=ω_A` and A3’s Weil duality `H¹_ét(A,ℚ_p)(1)=V_pA^∨` to obtain the stated homological quotient sequence. No descent of A to a finite extension of `ℚ_p` is required.

For good reduction identify the character map by CDM12 Proposition 4.15 (1.5 (1)); for semistable reduction over a discretely valued K use 0.18. Functoriality of the spectral sequence and the Weil pairing give endomorphisms, duality and isotropy; half dimension makes the Lie subspace Lagrangian.

**Checks.**

- For E elliptic with ordinary reduction, the filtration is `T_pE^0 ⊗ C`, the line of the connected part.
- Scholze's Lemma 3.3.4 reads the point of the flag variety off this sequence.

[BHW](https://arxiv.org/abs/1902.03985), §5.3, Remark 5.15 (arXiv:1902.03985v4), PDF p. 23: BHW's convention for the Hodge–Tate sequence of an abelian variety. [SCH15](https://arxiv.org/abs/1306.2070), §3.3, Lemma 3.3.4 (arXiv v2, III.3.4), PDF p. 55: Scholze's Lemma 3.3.4 uses the filtration on points. [CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), Theorem 3.20 and Remark 3.21, PDF p.20; Proposition 4.15, PDF pp.28–29: The arbitrary-C algebraic degree-one spectral sequence gives the rational sequence independently of the complete-DVR relative comparison.

*Needs:* [2.4](#section-2-4); [0.18](#section-0-18); [0.3](#section-0-3); [1.4](#section-1-4); [1.5](#section-1-5); `AbelianSchemesAndArithmeticModuli` A4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1; `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `AbelianSchemesAndArithmeticModuli` A3 (polarized weil pairing); `AbelianSchemesAndArithmeticModuli` A4 (p divisible group); `AbelianSchemesAndArithmeticModuli` A4 (abelian h1 de rham); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §7.3 (relative hodge tate first step).

<a id="section-2-6"></a>

### 2.6 The relative Hodge–Tate sequence on the pro-étale site

Prove `TauCeti.HodgeTate.relativeHodgeTateSequence`. Let X/K be smooth adic, with K a finite extension of `ℚ_p`, and let A/X be an algebraizable abelian family as in 1.1. After a chosen base extension to complete algebraically closed C if desired, on the pro-étale site there is a canonical exact sequence `0→Lie(A^∨)⊗Ô_X(1)→T_pA^∨⊗Ô_X→ω_A⊗Ô_X→0`. It specializes at points to the sequence of 2.5, it is the character sequence in the sense of 1.5, and it is compatible with pullback, isogenies, endomorphisms, polarizations and rational defining Hodge tensors.

A/X is an algebraizable abelian family on a smooth adic X over a finite extension K of `ℚ_p`; pull back the resulting sequence to complete algebraically closed C as needed. Families over C that do not descend to such a K are not treated; individual abelian varieties over an arbitrary C are 2.5.

The terms are finite locally free completed-structure-sheaf modules furnished by PadicHodgeTheory §7.3; exactness follows from the lattice filtration theorem, not a claim that rank-one points automatically detect arbitrary `O⁺` sheaf exactness.

Construct the cohomological filtration using the two `B_dR^+` lattices of 1.2 and apply CS17 Corollary 2.2.4.

In degree one the two graded pieces are Lie and invariant differentials, giving the displayed short exact sequence of `Ô_X`-modules after duality and the Weil twist.

1.5 identifies the quotient with Layer 0’s character differential at points of good reduction and in families over the good-reduction locus; pullback and tensor compatibility follow from the relative construction.

**Checks.**

- For the universal elliptic curve over the modular curve, the sequence is `0 → ω^{-1}(1) → T_pE ⊗ Ô → ω → 0`.

[CS17](https://arxiv.org/abs/1511.02418), §2.2, the relative Hodge–Tate filtration (arXiv:1511.02418v1), PDF p. 15: Caraiani–Scholze: the relative Hodge–Tate filtration on the pro-étale site.

*Needs:* [2.5](#section-2-5); [1.1](#section-1-1); [1.2](#section-1-2); [1.3](#section-1-3); [1.5](#section-1-5); `AdicEtaleGeometry` A1 (pro etale site corrected); `PerfectoidSpaces` P0 (almost basic setup); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §7.3 (relative hodge tate first step).

<a id="section-2-7"></a>

### 2.7 The Hodge–Tate filtration as a point of the flag variety

Construct `TauCeti.HodgeTate.hodgeTateFlagPoint`. Let `Λ` be a free `ℤ_p`-module of rank 2g with a perfect alternating pairing `ψ` (the Siegel case; `Λ` with an `𝒪`-action and hermitian or symplectic form in the PEL case), and Fl the Lagrangian Grassmannian of rank-g quotients `Λ ⊗ C ↠ W` with Lagrangian kernel (`Fl ⊂ Gr(g, Λ)`, Mathlib's `Module.Grassmannian` of rank-g quotients). For an abelian variety A over C with a symplectic similitude trivialisation `β`: `Λ ≅ T_pA^∨`, the Hodge–Tate quotient `T_pA^∨ ⊗ C ↠ ω_A` defines `π_HT(A, β) ∈ Fl(C)`. Fl carries the Plücker coordinates s_J (J ⊂ {1, …, 2g}, |J| = g, J any g-element subset) and the binomial(2g,g)-indexed affinoid charts Fl_J = {|s_{J′}| ≤ |s_J| for all J′}, which cover Fl. The full `GSp_2g(ℤ_p)` action does not permute this finite chart family. The construction is functorial: for `γ ∈ GSp(Λ ⊗ ℚ_p)` with `γΛ ⊂ Λ`, `π_HT(A′, β′) = γ·π_HT(A, β)` when `(A′, β′)` is the corresponding isogenous pair.

This is the pointwise quotient-flag construction. 2.12 promotes the relative filtration to a morphism on the open limit v-sheaf of 2.3; 2.13 gives its bundle formula. S1/S3 own representability, the adic incarnation and the compactified extensions.

Convention: quotients, not lines; for `g = 1` the quotient line is `ω_A`, so the tautological quotient bundle pulls back to `ω` (the BHW convention).

Define the point from the quotient map of 2.5 transported by `β`; the kernel `Lie(A^∨)(1)` is Lagrangian (2.5).

Plücker coordinates: the rank-g quotient is determined by the `g × g` minors of the `2g × g` matrix of β-coordinates; `Fl_J` is the locus where `s_J` has maximal absolute value, and every point lies in some `Fl_J`.

Equivariance under isogenies from 0.3.

The interface consists of the following named results.

- `TauCeti.HodgeTate.hodgeTateFlagPoint`: `π_HT(A, β) ∈ Fl(C)`, the Hodge–Tate quotient of `T_pA^∨ ⊗ C` transported by `β`.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_isLagrangian`: The kernel of the quotient is Lagrangian for `ψ`.
- `TauCeti.HodgeTate.plucker`: The Plücker coordinates `s_J` of a rank-g quotient of `Λ ⊗ C`.
- `TauCeti.HodgeTate.lagrangianChart`: `Fl_J = {|s_{J′}| ≤ |s_J| ∀J′}`, for every g-element subset J of {1,…,2g}.
- `TauCeti.HodgeTate.lagrangianChart_cover`: The binomial(2g,g)-indexed `Fl_J` cover Fl; no permutation action of the full integral symplectic group on this family is asserted.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_equivariant`: `π_HT(A′, β′) = γ·π_HT(A, β)` for the isogenous pair attached to `γ`.

**Checks.**

- `TauCeti.HodgeTate.hodgeTateFlagPoint_ordinaryElliptic`: For E with ordinary reduction and `β` adapted to the connected–étale sequence, `π_HT(E, β)` is a ℚ_p-rational point of `ℙ¹`.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_grassmannian`: `π_HT(A, β)` is an element of Mathlib's Module.Grassmannian C (C^{2g}) g (rank-g quotients), lying in the Lagrangian locus.
- `TauCeti.HodgeTate.lagrangianChart_count`: The chart index set has cardinality binomial(2g,g), hence six for `g = 2`. Lagrangian relations may identify some indexed chart domains; cardinality here concerns indices.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_not_line`: For `g = 1` the kernel line `Lie(A^∨)(1)` is its own symplectic orthogonal and determines exactly the same rank-one quotient point via its kernel. The tautological subbundle is `Lie(A^∨)(1)`, whereas the tautological quotient bundle pulls back to `ω_A`; confusing these bundles gives the wrong twist.
- `TauCeti.HodgeTate.lagrangianChart_not_permuted`: For `g = 1`, `γ = (1 0; 1 1)` sends the unit-disc chart D₀ by `z ↦ z/(z+1)`. Its image contains 0 and `∞` (images of 0 and `−1`), so it is neither D₀ nor `D∞`; the full integral group does not permute the two standard charts.
- For `g = 1`, `Fl = ℙ¹` with coordinates `s_1`, `s_2` and charts `{|s_2| ≤ |s_1|}`, `{|s_1| ≤ |s_2|}`.

[SCH15](https://arxiv.org/abs/1306.2070), §3.3, the affinoids `Fℓ_J` (arXiv v2), PDF p. 58: Scholze's definition of Fl, `ω_Fl` and the affinoids `Fl_J`. [SCH15](https://arxiv.org/abs/1306.2070), §3.3, Lemma 3.3.4 (arXiv v2, III.3.4), PDF p. 55: Lemma 3.3.4: the Hodge–Tate period map on points.

*Needs:* [2.5](#section-2-5); [0.3](#section-0-3); `Module.Grassmannian`; `ShimuraData` Layer 3 (compact dual); `PELModuli` M0 (symplectic o lattice); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle).

Applications include Scholze 2015, Lemma 3.3.4 and §3.3: `π_HT` on C-points and the charts `Fl_J`; PerfectoidShimuraVarieties S1 (continuous hodge tate map) and S3: the period map on the tower is built from this pointwise construction; Layer 4: the balls `B_r` around integral points of Fl.

<a id="section-2-8"></a>

### 2.8 PEL and Hodge-type conditions on the Hodge–Tate filtration

Prove `TauCeti.HodgeTate.pelHodgeType_filtration`. For a characteristic-zero PEL abelian family with its specified rational endomorphism algebra, polarization and determinant type `μ`, the rational Hodge–Tate filtration is stable under that algebra, isotropic for the polarization, and has the prescribed μ-type. Thus its quotient flag lies in the descended PEL flag variety. For Hodge type use the rational defining tensors and rational tensor frames of B1; the filtration on every tensor construction is compatible with those tensors and has type `μ`, hence defines a point of the descended flag variety `G/P_μ`. An integral `Λ` or `G_ℤp` tensor torsor is not inferred from rational Hodge cycles.

Frames are rational `G_ℚp` tensor frames throughout; integral tensor frames and reductive ℤ_p-models are not part of this roadmap.

The flag variety is the reflex-field form supplied by `ShimuraData` Layer 3 and `AlgebraicModuliForArithmeticGeometry` §1.3; a rational cocharacter over that field is not invented.

PEL determinant type follows the actual Lie-type convention; Hodge type uses CS17’s discrete type argument on each connected component.

Endomorphism stability and isotropy follow from the functorial abelian Hodge–Tate sequence and the Weil pairing.

Use 1.3 to put rational defining tensors in the required filtered degree.

Fpqc local splitting of the tensor filtration (2.14) identifies its stabilizer with `P_μ`; constancy of type on each connected component is checked at a classical point as in CS17 Lemmas 2.3.6–2.3.7.

**Checks.**

- For the Siegel datum `Fl_{G,μ}` is the full Lagrangian Grassmannian; for the Hilbert datum it is `Res_{F/ℚ}ℙ¹ ⊗ C = ∏_{τ: F → C} ℙ¹`.

[CS17](https://arxiv.org/abs/1511.02418), §2.3, Lemmas 2.3.6–2.3.7, PDF pp. 19–20: Uses rational tensor frames and constant filtration type to construct the parabolic torsor.

*Needs:* [2.7](#section-2-7); [2.11](#section-2-11); [2.14](#section-2-14); [1.3](#section-1-3); [0.3](#section-0-3); `PELModuli` M0 (determinant condition); `PELModuli` M0 (integral pel datum); `AutomorphicBundles` B0 (hodge parabolic convention); `ShimuraData` Layer 3 (compact dual); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B1 (tensor frame torsor).

<a id="section-2-9"></a>

### 2.9 The Hodge–Tate parabolic reduction and its Levi torsor

Construct `TauCeti.HodgeTate.hodgeTateParabolicReduction`. Let (G, X) be a Shimura datum of Hodge (or PEL) type, `Sh_K → Spec E` its Shimura variety at level `K = K_pK^p`, 𝒮 the adic space over C of `Sh_K`, and `A → 𝒮` the abelian scheme with tensors. On 𝒮_proét, the sheaf of trivialisations `β`: `Λ ⊗ ℚ_p ≅ V_pA^∨` respecting tensors (up to the similitude) is a G(ℚ_p)-torsor `𝒫_ét`, and the relative Hodge–Tate filtration (2.6) defines a reduction of `𝒫_ét ×^{G(ℚ_p)} G_{Ô}` to the parabolic `P_μ`: the P_μ-torsor `𝒫_HT` of trivialisations sending the standard filtration of type `μ` to the Hodge–Tate filtration. Its Levi quotient `ℳ_HT := 𝒫_HT ×^{P_μ} M_μ` is the Hodge–Tate Levi torsor. Both are functorial in K (finite-level Hecke maps), in morphisms of data and in base change of C.

This is the finite-level reduction on 𝒮_proét. Its pullback along the open limit-tower map is 2.13. S3 imports that result for the perfectoid incarnation and proves the compactified extension.

Use the rational tensor torsor of CS17 §2.3; integral G(ℤ_p)-torsors are not part of this roadmap. The algebraic groups `P_μ` and `M_μ = P_μ/U_μ`, the quotient `G/P_μ` and the homogeneous P_μ-torsor `G → G/P_μ` are those of TauCetiRoadmap ReductiveGroups Layers 3 and 7 (the fppf quotient, parabolic and Levi subgroups), with `G/P_μ` represented by the projective scheme of parabolics of type `μ` of `ShimuraData` Layer 3 and with the stabilizer description of 2.14; the dynamic point subgroups of the baseline are their points.

Use the rational étale tensor frame torsor from B1; extend scalars to the completed structure sheaf.

The type-μ tensor filtration gives the filtration-adapted frame sheaf. CS17 Lemma 2.3.6 proves its local nonemptiness by the discrete-type/classical-point argument; the representable `P_μ` and its torsor action come from ReductiveGroups Layers 3 and 7 and 2.14.

Push out the `P_μ` torsor along the actual algebraic quotient `P_μ→M_μ`. The baseline dynamic parabolic/Levi point subgroups are only comparisons, not replacements for this quotient.

The interface consists of the following named results.

- `TauCeti.HodgeTate.etaleFrameTorsor`: `𝒫_ét` is the G(ℚ_p)-torsor of rational tensor-preserving trivialisations `Λ ⊗ ℚ_p ≅ V_pA^∨`.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction`: `𝒫_HT` is the P_μ-reduction of `𝒫_ét ×^{G(ℚ_p)} G_Ô` defined by the relative Hodge–Tate filtration.
- `TauCeti.HodgeTate.hodgeTateLeviTorsor`: `ℳ_HT = 𝒫_HT ×^{P_μ} M_μ`.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_hecke`: Compatible with the finite-level Hecke maps `Sh_{K′} → Sh_K` and with prime-to-p Hecke correspondences.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_baseChange`: Compatible with base change `C → C′` and with morphisms of Shimura data.

**Checks.**

- `TauCeti.HodgeTate.hodgeTateLeviTorsor_modularCurve`: For the modular curve over C, with a specified determinant/polarization normalization, the Levi torsor frames the two graded lines `(ω^{-1}(1), ω)`. Before a determinant trivialization use `det H¹_dR⊗ω^{-1}(1)` in the first line for prime-to-p Hecke equivariance.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_torus`: For a torus datum with `μ` central, `P_μ = M_μ = T` and `𝒫_HT = 𝒫_ét ×^{T(ℚ_p)} T_Ô`.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_not_hodge`: The Hodge–Tate parabolic `P_μ` is opposite to the parabolic stabilising the Hodge filtration (`AutomorphicBundles` B0 (hodge parabolic convention)); using the Hodge filtration's parabolic gives a different reduction whose Levi torsor differs by the inverse of `μ`.
- For the modular curve over C, with a specified determinant/polarization normalization, the Levi torsor frames the two graded lines `(ω^{-1}(1), ω)`. Before a determinant trivialization use `det H¹_dR⊗ω^{-1}(1)` in the first line for prime-to-p Hecke equivariance.

[CS17](https://arxiv.org/abs/1511.02418), §2.3, before Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 19: Caraiani–Scholze: the Hodge–Tate torsor `P_p`.

*Needs:* [2.6](#section-2-6); [2.8](#section-2-8); [2.11](#section-2-11); [1.3](#section-1-3); `TauCeti.Cocharacter.parabolic`; `TauCeti.Cocharacter.levi`; `AutomorphicBundles` B1 (tensor frame torsor); `AdicEtaleGeometry` A1 (pro etale site corrected); [2.14](#section-2-14); TauCetiRoadmap ReductiveGroups Layers 3 and 7; `ShimuraData` Layer 3 (reflex flag descent); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle).

Applications include Caraiani–Scholze 2017, §2.3: `M_dR ≅ M_p`, from which automorphic bundles pull back along `π_HT`; PerfectoidShimuraVarieties S3 (hodge levi pullback): pullback of the Levi torsor along `π_HT`; Layer 7: the general logarithmic comparison agrees with this reduction for Hodge type.

<a id="section-2-10"></a>

### 2.10 Cyclotomic comparison of de Rham and Hodge–Tate Levi torsors

Prove `TauCeti.HodgeTate.deRhamHodgeTateLeviComparison`. For the rational Hodge-type family and parabolic reduction of Layer 2, let `ℳ_dR` be the de Rham Levi torsor of graded Hodge frames (`AutomorphicBundles` B1 (filtration reduction): the Hodge filtration reduces the de Rham frame torsor to the Hodge parabolic, whose quotient by its unipotent radical is a torsor under the common Levi `M_μ` of the Hodge and Hodge–Tate parabolics), pulled to the pro-étale site and extended to `Ô`. Let 𝒯(1) be the ℤ_p^×-torsor of Tate-module bases and let `μ:ℤ_p^×→M_μ` be the central cocharacter over a field defining `μ`. The canonical comparison is `ℳ_HT ≅ ℳ_dR ×^{μ,ℤ_p^×} 𝒯(1)`, independent of the symplectic embedding and compatible with the natural Hecke linearizations. For a Levi representation of central μ-weight a this gives the associated HT bundle `≅` the de Rham automorphic bundle `⊗Ô(a)`. The comparison is compatible with the Hecke linearizations of both torsors; when no trivialization of the similitude character is chosen, the determinant local system of the Tate module is kept in the contracted product. A chosen Tate basis over C gives an underlying untwisted isomorphism; it does not canonically descend over `E_𝔭` or retain every linearization.

Use rational tensor frames and the actual opposed-parabolic/Tate convention of B0/B1; `μ` is defined after an explicitly stated finite extension, with the intrinsic conjugacy-class descent kept separate.

The Tate-basis torsor is a pro-étale torsor, not a globally trivial sheaf over a finite extension of `ℚ_p`. Its contracted product uses `μ’s` central image.

The family obeys the finite-K algebraizability hypotheses of 1.1; frames are rational.

Pull the graded relative comparison to the Tate-basis torsor, where each twist can be trivialized. Tensor compatibility identifies the graded tensor frames there.

Changing the Tate basis rescales the graded pieces through `μ`. Descend to the contracted product `ℳ_dR ×^{μ,ℤ_p^×}𝒯(1)`, rather than to the untwisted `ℳ_dR`. Boxer–Pilloni §4.4.8 and Remark 4.4.23 explicitly state this correction to the raw CS17 formulation.

Functoriality of comparison and contraction gives the stated equivariance; keep the determinant local system if no polarization/determinant trivialization has been chosen.

**Checks.**

- For the normalized modular curve the HT graded lines are `ω` and `ω^{-1}(1)`; raw de Rham lines are `ω` and `ω^{-1}`. The μ-weight-one part detects the missing twist.
- For μ-weight zero representations the associated comparison is untwisted. Over a finite `K/ℚ_p` one cannot identify `Ô(1)` with `Ô` canonically; a C-valued Tate basis alone does not establish equivariance.

[CS17](https://arxiv.org/abs/1511.02418), §2.3, Proposition 2.3.9 (arXiv:1511.02418v1), PDF p. 21: The graded comparison and tensor argument; its untwisted torsor conclusion is corrected by the cyclotomic contraction. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.8, PDF pp.67–68; Remark 4.4.12, p.69; Remark 4.4.23, p.74: The revised manuscript gives the cyclotomic contracted product and the representation-weight twist.

*Needs:* [2.9](#section-2-9); [1.1](#section-1-1); [1.2](#section-1-2); [1.3](#section-1-3); `AutomorphicBundles` B1 (filtration reduction); `AutomorphicBundles` B2 (automorphic vector bundles from representations of the centralizer); `AutomorphicBundles` B1 (tensor frame torsor).

<a id="section-2-11"></a>

### 2.11 The Hodge–Tate tensor filtration

Define `TauCeti.HodgeTate.ExactTensorFiltration`. Apply the shared filtered-Tannakian theory to the rational Hodge-type étale fiber functor Rep_E(G)→finite locally free `Ô_X`-modules: assign to each representation its ascending Hodge–Tate filtration, with strict exactness, tensor/dual compatibility and locally free graded pieces. Its constant geometric type is the μ-conjugacy class. For an algebraic E-scheme S and an exact filtered fiber functor with reductive tensor automorphism group, Ziegler’s theorem gives fpqc-local splittings; the filtered stabilizer is parabolic, its graded quotient has unipotent kernel, and a chosen splitting identifies a Levi with the centralizer. This general theorem is 2.14; this subsection is its Hodge–Tate application. On the Shimura pro-étale site the stronger torsor assertion is obtained by CS17’s rational comparison and type argument; it is not a blanket change from fpqc to pro-étale splitting.

E is a characteristic-zero field and G/E reductive of finite type; `Rep_E(G)` has a tensor generator.

Filtered objects are exhaustive, separated, finite, strict under exact sequences, and have finite locally free graded pieces. An arbitrary filtration is not a filtered fiber functor.

No general integral `ℤ_p` variant, strictly henselian splitting theorem or universal étale/pro-étale splitting assertion is included.

Import representations, comodules and tensor reconstruction from TauCetiRoadmap ReductiveGroups Layer 1; filtered fibre functors and their splittings are 2.14.

2.14 (Ziegler Definition 3.4 and Theorems 3.14, 3.15 and 3.52) provides the precise fpqc splitting and reductive stabilizer statements.

Apply Layer 1’s tensor-compatible two-lattice filtration to each representation. CS17 Lemmas 2.3.6–2.3.7 identify its μ-type and the Shimura pro-étale frame torsor.

The interface consists of the following named results.

- `TauCeti.HodgeTate.ExactTensorFiltration`: The rational Hodge–Tate filtered fiber functor on `Rep_E(G)`, an instance of the filtered fibre functors of 2.14.
- `TauCeti.HodgeTate.ExactTensorFiltration.type`: The type: the conjugacy class of a splitting cocharacter (locally constant on Spec R).
- `TauCeti.HodgeTate.ExactTensorFiltration.splitLocally`: For the algebraic filtered-fiber-functor input, a splitting exists fpqc locally by Ziegler Theorem 3.14. For the Shimura completed-structure-sheaf application use CS17’s separate frame-torsor theorem.
- `TauCeti.HodgeTate.ExactTensorFiltration.frameTorsor`: The P_μ-torsor of frames carrying `Fil^•(μ)` to the given filtration.
- `TauCeti.HodgeTate.ExactTensorFiltration.equivFlag`: Filtrations of type `μ ≅ (G/P_μ)(R)`.

**Checks.**

- `TauCeti.HodgeTate.ExactTensorFiltration.gl_grassmannian`: For `G = GL_n` and `μ` of type `(1^r, 0^{n−r})`, filtrations of type `μ` are the elements of Mathlib's `Module.Grassmannian R (R^n) (n − r)`.
- `TauCeti.HodgeTate.ExactTensorFiltration.trivial`: For central `μ` and a supplied underlying tensor frame, the weight filtration needs no proper parabolic reduction and its framed torsor is trivial. Without that frame the underlying G-torsor need not be trivial.
- `TauCeti.HodgeTate.ExactTensorFiltration.not_arbitrary_filtration`: A rank-one R-module filtered by a non-direct-summand ideal with nonflat quotient does not satisfy the locally free graded-piece/strict exact tensor-filtration condition; for example `(2)⊂ℤ` at the local prime 2.
- For `G = GL_n` and `μ = (1, …, 1, 0, …, 0)`, an exact tensor filtration of type `μ` is a two-step filtration of the standard representation by a direct summand of rank r, and `G/P_μ` is the Grassmannian.

[ZIE](https://arxiv.org/pdf/1111.1981v2), §3.5, Theorem 3.52, PDF pp.27–28 (reductive case part (iii), p.28): Strict exact tensor filtrations split fpqc locally, and reductive automorphism groups give parabolic stabilizers. [CS17](https://arxiv.org/abs/1511.02418), §2.3, Lemmas 2.3.6–2.3.7, PDF pp. 19–20: The relative Hodge–Tate tensor filtration has the fixed Shimura cocharacter type.

*Needs:* [2.14](#section-2-14); `TauCeti.Cocharacter.parabolic`; `TauCeti.Cocharacter.levi`; `Module.Grassmannian`; `AutomorphicBundles` B0 (hodge parabolic convention); `ShimuraData` Layer 3 (filtration parabolic); TauCetiRoadmap ReductiveGroups Layer 1.

Applications include Caraiani–Scholze 2017, Lemma 2.3.6: the Hodge–Tate filtration has type `μ`, giving the P_μ-torsor `P_p`; [7.32](#section-7-32): the Tannakian extraction of a flag of prescribed type (from Layer 2); [2.9](#section-2-9): the P_μ-reduction.

<a id="section-2-12"></a>

### 2.12 Hodge–Tate map on the open limit tower

Construct `TauCeti.HodgeTate.openTowerHodgeTateMap`. For a Hodge-type datum with sufficiently small tame level `K^p` and rational tensor frames, let `S_∞^◇=lim_{K_p}S_{K^pK_p}^◇` be the open infinite-level diamond over C of 2.3. There is a canonical morphism of v-sheaves `π_HT:S_∞^◇→Fl_{G,μ}^{an,◇}`, defined by the relative type-μ filtration in the universal rational Tate frame. It is independent of a chosen Siegel embedding, equivariant for `G(ℚ_p)` and for prime-to-p Hecke translations between tame levels (trivial action on the flag for the latter). Its evaluation on any perfectoid test object is the tensor filtration quotient, and on geometric points it is Layer 2’s Hodge–Tate flag point. Perfectoid representability of `S_∞^◇` is not a hypothesis.

Use the genuine limit v-sheaf of 2.3 and its compatible universal rational Tate trivialization; the finite-level families meet Layer 1’s comparison hypotheses. The tower, its limit and its right `G(ℚ_p)`-action are the separate constructions 2.1, 2.2 and 2.3, not definitions made inside this construction.

The descended flag is the reflex-field form. A cocharacter or split Hilbert factorization requires an explicitly stated extension. Fix the dual-Tate quotient convention and transport the flag action accordingly; Layer 4 converts it to BHW’s left action.

The transfer to perfectoid test objects is `DiamondsAndVStacks` D2.9: finite locally free completed-structure-sheaf modules on the pro-étale site of each finite-level rigid space `S_K` are v-bundles on `S_K^◇`, and on a perfectoid test object v-bundles are analytic vector bundles; D6 supplies the diamond of the analytic flag. A geometric-point assignment alone does not define this morphism.

Pull Layer 2’s relative exact sequence and rational tensor-frame reduction along each projection of the limit sheaf of 2.3, using the universal Tate trivialization. On a perfectoid test untilt the resulting locally free tensor filtration of type `μ` represents a map to the analytic flag by §1.3’s universal property.

D2.9’s equivalences (pullback of completed-structure-sheaf bundles to the v-site and v-descent of bundles on perfectoid spaces) and D6’s diamond functor give compatible sections on every perfectoid test object. Their compatibility with restriction and v-descent produces the morphism; this sheaf construction precedes S2 representability. CS17 §2.3, after Lemma 2.3.7, uses the same relative frame-to-flag construction on its representing tower.

Changing rational frames by `G(ℚ_p)` gives the specified flag action. Naturality under the Hecke isogenies gives prime-to-p equivariance. CS17 Lemma 2.3.7’s tensor-idempotent argument establishes embedding independence; do not merely compare classical points.

The interface consists of the following named results.

- `TauCeti.HodgeTate.openTowerHodgeTateMap`: The v-sheaf morphism determined by the universal relative tensor filtration.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_ext`: Two candidate maps agree if their natural evaluations agree on every perfectoid test object, not merely on geometric points.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_eval`: On each perfectoid test untilt evaluation is the type-μ relative filtration quotient.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_point`: On (C′,C′⁺)-points the map equals hodgeTateFlagPoint with the fixed quotient convention.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_equivariant`: `π_HT` composed with a tower translation equals the induced flag translation composed with `π_HT`, with the chosen left/right dictionary.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_hecke`: Prime-to-p translation between tame levels commutes with `π_HT` and acts trivially on the flag.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_baseChange`: Base extending C and the tower commutes with the map, without choosing a splitting of F beforehand.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_embedding`: Under a Hodge-type Siegel embedding the two period maps commute with the corresponding flag embedding; its construction is independent of that choice.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_continuous`: On underlying spaces `π_HT` induces a continuous `G(ℚ_p)`-equivariant map `|S_∞^◇| → |Fl_{G,μ}|`, where `|S_∞^◇| = lim_{K_p} |S_{K^pK_p}|` by 2.3. For the Siegel datum it sends a point `(A, α)` over `(C′, C′⁺)` to the Hodge–Tate filtration `Lie A ⊂ C′^{2g}`; this is Scholze's Lemma III.3.4 on the complement of the boundary.

**Checks.**

- `TauCeti.HodgeTate.openTowerHodgeTateMap_modular`: For GL₂, evaluation on a perfectoid test family gives the kernel of the relative quotient to `ω_E`, with the tautological quotient pulling back to `ω_E`.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_torus`: For a central cocharacter the flag is a point, hence the map is its structural morphism regardless of whether the tower has a perfectoid representative.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_hilbertUnsplit`: For the Hodge-type Hilbert G* datum the target is `(Res_{F/ℚ}ℙ¹)^{an,◇}`; an embedding-product identification is asserted only after a specified splitting extension.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_kernelQuotient`: For an elliptic family the kernel line is `ω_E^{-1}(1)` (with determinant normalization), while the quotient is `ω_E`. Substituting the tautological subline for the quotient changes the bundle and twist.
- The elliptic quotient, central-cocharacter and unsplit Hilbert test cases below all evaluate the relative construction on perfectoid test families.
- On a perfectoid representative supplied by PerfectoidShimuraVarieties S2, this morphism is the diamond of S3’s adic period morphism; representability is used only for that realization.

[CS17](https://arxiv.org/abs/1511.02418), §2.1, Theorems 2.1.2–2.1.3, PDF pp.11–12; §2.3, Lemma 2.3.7 and subsequent frame-to-flag construction, pp.20–21: The relative tensor-frame construction and equivariance on the represented tower; its v-sheaf precursor is deduced through the v-descent of bundles of `DiamondsAndVStacks` D2.9. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.22–4.4.24, PDF pp.73–75: Universal rational frames, relative reduction and the open Hodge-type period map; the source proves the perfectoid incarnation downstream. [SCH15](https://arxiv.org/abs/1306.2070), §III.3, Lemma III.3.4, pp. 55–56 (arXiv:1306.2070v2): The Siegel instance on points: a continuous `GSp_{2g}(ℚ_p)`-equivariant map from the open perfectoid Siegel space to the flag variety, sending `(A, α)` to the Hodge–Tate filtration; recorded as the continuity API item.

*Needs:* [2.6](#section-2-6); [2.8](#section-2-8); [2.9](#section-2-9); [2.7](#section-2-7); [2.3](#section-2-3); [2.2](#section-2-2); `DiamondsAndVStacks` D6 (gluing and the diamond functor); `DiamondsAndVStacks` D2.9; `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle); [1.5](#section-1-5).

Applications include [4.4](#section-4-4): Defines the coordinate as a function on the open tower before S1–S3; [5.10](#section-5-10): Provides the relative quotient line and its tautological section on the open anticanonical tower; PerfectoidShimuraVarieties S3: Supplies the sheaf map to be realized on the perfectoid representative and extended to compactifications.

<a id="section-2-13"></a>

### 2.13 Open-tower Levi pullback and elliptic/Hilbert bundle formulas

Prove `TauCeti.HodgeTate.openTowerLeviPullback`. Along Layer 2’s open-tower `π_HT`, the tautological Levi torsor of the Hodge–Tate flag pulls back to `ℳ_HT` on the limit v-sheaf. Hence an associated Levi representation of central μ-weight a pulls back to the finite-level de Rham automorphic bundle tensored with `Ô(a)`, by the cyclotomic comparison. In the dual-Tate quotient convention the elliptic tautological quotient `𝒪(1)` pulls back to `ω_E`; for the Hodge-type Hilbert G* datum the flag is `(Res_{F/ℚ}ℙ¹)^{an,◇}` and `π_HT*Res_{𝒪_F/ℤ}𝒪(1)≅ω_A` as a `rank-[F:ℚ]` bundle with its `Res G_m`-action. These identifications hold before perfectoid representability; they inherit the transported frame/Hecke linearizations.

The homogeneous parabolic and Levi torsors are those of 2.9 (ReductiveGroups Layers 3 and 7, `AlgebraicModuliForArithmeticGeometry` §1.3’s flag bundle), not point-subgroup substitutes or a downstream S3 theorem. The automorphic representation is inflated from the common Levi.

For the Hilbert quotient, level structures use `T_pA^∨` and the polarization ideal convention of H2/H4. Over an unsplit field do not replace the restriction of scalars by an embedding-indexed product or its integral tensor order by its normalization.

The O(1) formula uses BHW’s kernel/quotient action on projective space, transported from CS17’s standard-representation convention. Raw CS17-compatible representations retain their `μ`-weight twist; no untwisted equivariance is inferred from a choice of roots of unity.

The pullback of the universal parabolic frame torsor along the relative filtration map is exactly the adapted frame torsor. Passing to its Levi quotient commutes with pullback by the supplied torsor universal property.

Apply Layer 2’s corrected cyclotomic Levi comparison and associated-bundle functor. For GL₂ identify the universal quotient with the actual relative character quotient to `ω_E`; this computes the O(1) convention directly, without erasing twists in other representations.

For G* use the O_F-linear rank-one quotient and the representability/universal bundle of restriction of scalars. The quotient map identifies its pulled-back bundle with `ω_A`. After an explicit splitting extension this is the direct sum of the embedding-indexed quotient lines; faithful base change descends the identification. BHW §5.3–5.4 states this unsplit construction.

**Checks.**

- At an elliptic point with normalized determinant, the quotient line is `ω_E` and the subline is `ω_E^{-1}(1)`.
- After a splitting extension of F the Hilbert `rank-[F:ℚ]` bundle is `⊕_σ𝒪(1)_σ`; before it the restriction-of-scalars bundle is retained.
- For μ-weight a the raw associated bundle formula includes (a); `a=0` is the untwisted special case.

[CS17](https://arxiv.org/abs/1511.02418), §2.3, Lemma 2.3.8 and Proposition 2.3.9, PDF p.21: Relative Levi frame pullback; the central cocharacter contracts the comparison with the Tate-basis torsor. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.8, PDF pp.67–68; Remark 4.4.12, p.69; Remarks 4.4.23–4.4.24, pp.74–75: Cyclotomic torsor contraction and representation-weight bundle pullback. [BHW](https://arxiv.org/abs/1902.03985), §3.3, (3.2) and Lemma 3.17, PDF pp.12–13; §5.3, Remark 5.15, p.23; §5.4, Definitions 5.22–5.24 and Proposition 5.25/Remark 5.28, pp.25–26: Quotient O(1) formula, Hilbert restriction of scalars and the splitting after an explicit splitting extension.

*Needs:* [2.12](#section-2-12); [2.10](#section-2-10); [2.9](#section-2-9); [2.5](#section-2-5); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle); `AutomorphicBundles` B0 (hodge parabolic convention); `AutomorphicBundles` B2 (automorphic vector bundles from representations of the centralizer); `HilbertModularVarietiesAndShimuraCurves` H2; `HilbertModularVarietiesAndShimuraCurves` H4; `DiamondsAndVStacks` D2.9; `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-2-14"></a>

### 2.14 Filtered fibre functors: splittings, type and the filtration parabolic

Prove `TauCeti.HodgeTate.filteredFiberFunctor_split`. Let k be a field, `𝒯 = Rep_k(G)` for an affine group scheme G of finite type over k (more generally a Tannakian category over k), and S a k-scheme. A filtered fibre functor on 𝒯 over S is an exact k-linear tensor functor `φ`: `𝒯 →` Fil(QCoh(S)) to exhaustive, separated, finite decreasing filtrations by quasi-coherent submodules with quasi-coherent graded pieces, whose underlying functor `forg∘φ` is a fibre functor; morphisms are tensor morphisms. A splitting is a graded fibre functor `γ` with `φ =` fil∘γ. Then (1) every filtered fibre functor is fpqc-locally splittable, and the sheaf Spl(φ) of splittings is a torsor under the group `U(φ)` of tensor automorphisms of `forg∘φ` that preserve the filtration and act trivially on gr; (2) the stabilizer `P(φ)` of the filtration in `Aut^⊗(forg∘φ)` maps onto the group `L(φ)` of tensor automorphisms of `gr∘φ` with kernel `U(φ)`, so `P(φ)/U(φ) ≅ L(φ)`; (3) `P(φ)` is flat over S, and smooth together with `U(φ)` when `Aut^⊗(forg∘φ)` is smooth; (4) if `Aut^⊗(forg∘φ)` is reductive, `P(φ)` is a parabolic subgroup with unipotent radical `U(φ)`, a splitting cocharacter `χ` gives the Levi subgroup Cent(χ) of `P(φ)`, `Lie P(φ)` is the sum of the non-negative χ-weight spaces, and splittings correspond bijectively to Levi subgroups; (5) when 𝒯 has a tensor generator, two filtered fibre functors over S have the same type (the conjugacy class of a splitting cocharacter) if and only if they are fpqc-locally isomorphic, and filtered fibre functors of the type of `φ` over an S-scheme S′ correspond to Aut^⊗(φ)_{S′}-torsors. Reindexing `F_j := Fil^{−j}` turns these into statements about ascending filtrations, the convention of 2.11.

k a field; filtrations exhaustive, separated, finite, with quasi-coherent graded pieces, and exact as tensor functors. Over a non-perfect k a filtered fibre functor may split only over an inseparable extension, and even over a field it may split Zariski locally without splitting globally: fpqc-local splitting is the general statement.

(1) Reduce fpqc locally to `forg∘φ = ω₀ ⊗ O_S` for the forgetful functor `ω₀` of G, then split by the reduction steps of Ziegler §4 (filtrations by sub-representations of the regular representation and their gradings); the torsor statement follows because two splittings differ by a unique automorphism that is the identity on gr.

(2) The map `P(φ) → L(φ)` induced by gr is split fpqc locally by the graded automorphisms of a splitting, hence an epimorphism; its kernel is `U(φ)` by definition.

(3)–(4) Flatness and smoothness from the filtration-stabilizer description; for reductive `Aut^⊗` apply the dynamic description of parabolic subgroups attached to a cocharacter (TauCetiRoadmap ReductiveGroups Layer 7; `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi` on points).

(5) The type is locally constant on S; compare two filtered fibre functors of the same type after fpqc-local splitting, where both become fil∘γ for graded functors of the same type, which are fpqc-locally isomorphic.

**Checks.**

- For `G = GL_n` and `φ` the filtration `0 ⊂ W ⊂ k^n` on the standard representation (W of dimension r, extended to all representations by tensor operations), `P(φ)` is the stabilizer of W, `U(φ) = Hom(k^n/W, W)` and `L(φ) = GL(W) × GL(k^n/W)`; the splittings are the complements of W.
- For the trivial filtration (concentrated in degree `0) P(φ) = Aut^⊗(forg∘φ`), `U(φ)` is trivial and the splitting is unique.
- Over `S = ℙ¹ = GL₂/B` with the tautological filtration `O(−1) ⊂ O²` on the standard representation, `φ` splits Zariski locally (on the two standard charts) but not globally, since the extension `0 → O(−1) → O² → O(1) → 0` is non-split.

[ZIE](https://arxiv.org/pdf/1111.1981v2), §3.2, Definition 3.4, PDF p. 15: filtered fibre functors as exact tensor functors to filtered quasi-coherent modules. [ZIE](https://arxiv.org/pdf/1111.1981v2), §3.3, Theorems 3.14–3.15, PDF p. 17: fpqc-local splittability and the U(φ)-torsor of splittings; the examples of non-splittable functors on the same page. [ZIE](https://arxiv.org/pdf/1111.1981v2), §3.3, Lemma 3.23, PDF p. 18: `P(φ)/U(φ) ≅ L(φ)`. [ZIE](https://arxiv.org/pdf/1111.1981v2), §3.5, Theorem 3.52, PDF pp. 27–28: flatness, smoothness, and for reductive tensor automorphisms the parabolic, its unipotent radical and the Levi subgroups as centralizers of splitting cocharacters; Theorems 3.54–3.55, PDF p. 28: type and torsors.

*Needs:* TauCetiRoadmap ReductiveGroups Layer 1 (representations and Tannakian reconstruction); TauCetiRoadmap ReductiveGroups Layer 7 (parabolic and Levi subgroups); `TauCeti.Cocharacter.parabolic`; `TauCeti.Cocharacter.levi`; `Module.Grassmannian`.

Applications include 2.8 (the stabilizer of the Hodge–Tate tensor filtration is `P_μ`), 2.9 (the P_μ-torsor of adapted frames), 2.11 (the Hodge–Tate application), 7.32–7.34 (the lattice Hodge–Tate filtration and its P^c_μ-reduction).

### Examples

The ordinary split p-divisible group and the Tate curve fix the Tate twist in the kernel. For an elliptic flag, the quotient line and kernel line produce the same projective point but distinct tautological bundles. Compact open level intersections determine a common level for translations. The detailed computations and negative controls are included with the definitions above.

### Dependencies

Layer 0; Layer 1; TauCetiRoadmap ReductiveGroups; `ShimuraVarieties` Layer 8; `ShimuraVarieties` Layer 1; `AdicSpacesPartII` R1; `DiamondsAndVStacks` D6; `DiamondsAndVStacks` D5; `DiamondsAndVStacks` D4; `PerfectoidSpaces` P5; `DiamondsAndVStacks` D1; `DiamondsAndVStacks` D3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1; `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; `AbelianSchemesAndArithmeticModuli` A4; `AbelianSchemesAndArithmeticModuli` A3; `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3; `AdicEtaleGeometry` A1; `PerfectoidSpaces` P0; `ShimuraData` Layer 3; `PELModuli` M0; `AlgebraicModuliForArithmeticGeometry` §1.3; `AutomorphicBundles` B0; `AutomorphicBundles` B1; `AutomorphicBundles` B2; `DiamondsAndVStacks` D2; `HilbertModularVarietiesAndShimuraCurves` H2; `HilbertModularVarietiesAndShimuraCurves` H4. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 3: Canonical subgroups with quantitative bounds

Layer 3 constructs canonical subgroups on Hasse neighbourhoods from the Hasse valuation: subgroup lifting and section rigidity, weak and strong canonical subgroups with their existence and uniqueness theorem, levels, functoriality and duality, the effect of quotients on the Hasse radius, the Hodge–Tate map of the dual canonical subgroup, and the Hilbert canonical subgroup at arbitrary p.

<a id="section-3-1"></a>

### 3.1 The Hasse valuation and Hasse neighbourhoods

Define `TauCeti.HodgeTate.hasseNeighbourhood`. (Points) For a truncated Barsotti–Tate group G over O_K (K complete valued over `ℚ_p`, `v(p) = 1`), the Hasse valuation is `Ha(G) := min(v(Ha(G ⊗ O_K/p)), 1) ∈ [0, 1]`, where `Ha(G ⊗ O_K/p)` is the Hasse invariant of the BT₁ G[p] ⊗ O_K/p (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2) computed in a basis of `det ω`; it is independent of the basis and of valued extensions, and `Ha(G) = Ha(G^D)`. (Families) For R a p-adically complete flat ℤ_p^cycl-algebra (or O_K-algebra) and A/R an abelian (or semi-abelian) scheme with reduction A₁/(R/p), A satisfies the Hasse condition of radius `ε (0 ≤ ε < 1, ε ∈ v(ℤ_p^cycl))` if `Ha(A₁)` divides `p^ε`, i.e. there is `u ∈ H⁰(Spf R, ω^{⊗(1−p)})` with `u·Ha(A₁) = p^ε` in R/p. For a formal model 𝔛 of a Shimura variety with universal A, the Hasse neighbourhood `𝔛(ε)` is the formal scheme of pairs (f, u) as above modulo `u ∼ u(1 + p^{1−ε}h)`; its generic fibre `𝒳(ε)` is the open `{|Ha| ≥ |p|^ε}` of the generic fibre, and `𝒳(ε) ⊂ 𝒳(ε′)` for `ε ≤ ε′`.

Hasse invariant of BT₁ groups: owned by `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2; for (semi-)abelian schemes it is 0.14.

Hilbert data use the total Hasse invariant (product of the partial Hasse invariants) of `HilbertModularVarietiesAndShimuraCurves` H2/ShimuraCompactifications C6; the Siegel and PEL data use Layer 0's Ha.

`𝔛(ε)` is an open chart of the admissible blow-up of the ideal `(H̃a, p^ε)`, not the whole blow-up.

Pointwise: Fargues 2011 §2.2.1 (valuation of `det ψ_G`, truncated at 1); duality `Ha(G) = Ha(G^D)` from R07.2's LF.

Families: Scholze, Definition 3.2.12 and Lemma 3.2.13: locally `𝔛(ε) = Spf(R⟨u⟩/(u·H̃a − p^ε))` for a lift H̃a, flat over `ℤ_p^cycl`; this is the section domain of AdicSpacesPartIII R2 (section valuation domain) and its formal model R2 (section domain formal model). As an admissible formal model, the chart is taken after removing p-power torsion, normalized as in [3.11](#section-3-11) when it is not normal; do not assume the raw displayed quotient is flat for every R.

The interface consists of the following named results.

- `TauCeti.HodgeTate.hasseValuation`: `Ha(G) ∈ [0, 1]` for a truncated BT group over `O_K`.
- `TauCeti.HodgeTate.hasseValuation_dual`: `Ha(G^D) = Ha(G)`.
- `TauCeti.HodgeTate.hasseValuation_eq_zero_iff`: `Ha(G) = 0` iff G is ordinary.
- `TauCeti.HodgeTate.hasseNeighbourhood`: `𝔛(ε)`: pairs (f, u) with `u·Ha = p^ε mod p`, modulo `u ∼ u(1 + p^{1−ε}h)`.
- `TauCeti.HodgeTate.hasseNeighbourhood_generic`: The generic fibre of `𝔛(ε)` is `{|Ha| ≥ |p|^ε}`.
- `TauCeti.HodgeTate.hasseNeighbourhood_mono`: `𝔛(ε) → 𝔛(ε′)` is an open immersion on generic fibres for `ε ≤ ε′`.

**Checks.**

- `TauCeti.HodgeTate.hasseValuation_ordinary`: `Ha(μ_{p^∞}[p] ⊕ ℚ_p/ℤ_p[p]) = 0`.
- `TauCeti.HodgeTate.hasseValuation_le_one`: `0 ≤ Ha(G) ≤ 1` for every BT₁ over `O_K` (truncation at 1, because it is computed in `O_K/p`).
- `TauCeti.HodgeTate.hasseNeighbourhood_zero`: 𝒳(0) is the ordinary locus `{|Ha| = 1}`.
- `TauCeti.HodgeTate.hasseNeighbourhood_not_blowup`: `𝔛(ε)` is not the full admissible blow-up of `(H̃a, p^ε)`: the chart where `p^ε` generates is omitted.
- For an ordinary BT₁, `Ha = 0`; for E[p] with E supersingular, Ha(E[p]) ∈ (0, 1].
- 𝒳(0) is the ordinary locus of the generic fibre.

[FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §2.2.1, PDF p. 7: Fargues's Hasse valuation of a BT₁ over `O_K`. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.2, Definition 3.2.12, p. 38 (arXiv v2): The Hasse neighbourhood functor. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.2, after Lemma 3.2.13, p. 38: Generic fibre `{|Ha| ≥ |p|^ε}`.

*Needs:* [0.14](#section-0-14); [0.16](#section-0-16); AdicSpacesPartIII R2 (section valuation domain); AdicSpacesPartIII R2 (section domain formal model); `ShimuraCompactifications` C6 (hilbert hasse boundary comparison); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal); `HilbertModularVarietiesAndShimuraCurves` H2 (hasse formal domains); `ShimuraCompactifications` C6 (hilbert near ordinary model); AdicSpacesPartIII R2 (hasse domain); [3.11](#section-3-11).

Applications include Scholze 2015, §§3.2.1–3.2.2: canonical subgroups exist on `𝔛(ε)`, `ε < 1/2`; Fargues 2011, Théorèmes 4 and 6: explicit bounds on `Ha(G)`; BHW 2019, §§3–5: Hilbert Hasse neighbourhoods `X(ε)` and overconvergence radii.

<a id="section-3-2"></a>

### 3.2 Lifting subgroups modulo p with explicit error

Prove `TauCeti.HodgeTate.subgroupLifting`. Let R be a p-adically complete flat ℤ_p^cycl-algebra, G a finite locally free commutative group scheme over R and `C₁ ⊂ G ⊗_R R/p` a finite locally free subgroup. If, for `H = (G ⊗ R/p)/C₁`, multiplication by `p^ε` on the co-Lie complex `ℓ̌_H` is homotopic to 0 for some `0 ≤ ε < 1/2`, then there is a finite locally free subgroup `C ⊂ G` over R with `C ⊗ R/p^{1−ε} = C₁ ⊗ R/p^{1−ε}`.

R is p-adically complete and torsion-free over the chosen rank-one cyclotomic valuation base containing the fractional powers used in the statement.

The quotient group over R/p is finite locally free; the co-Lie nullhomotopy and functorial square-zero obstruction theory are the R07.6 specialization of DerivedModuleAlgebra §§0.5 and 0.25.

The group-deformation foundation is the co-Lie obstruction interface of R07.6. SCH15 Corollary III.2.2 and HALO Proposition A.1 give the specific lifting consequence and its iteration used here.

Apply the functorial obstruction theory along the two square-zero thickenings used in SCH15 Corollary III.2.2; their obstruction transition is multiplication by the chosen annihilator, hence zero by the co-Lie nullhomotopy.

Lift the subgroup from precision `1−ε` to `2−2ε`. Because `ε<1/2`, iteration increases the precision without bound.

Use the finite-presentation/effectivity and completeness theorem of R07.6 to obtain a finite locally free subgroup over R, with the stated reduction.

**Checks.**

- For `ε = 0` and H étale, C₁ lifts uniquely (H étale means `ℓ̌_H ≃ 0`).

[SCH15](https://arxiv.org/abs/1306.2070), Corollary III.2.2 and its proof, PDF p. 32: States the subgroup lifting consequence of the co-Lie nullhomotopy. [HALO](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf), Appendix A.1, Proposition A.1, PDF pp. 37–38: Gives the same lifting mechanism over a complete torsion-free adic base, including `p=2`.

*Needs:* `IsAdicComplete`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.6 (illusie obstruction homomorphisms); DerivedModuleAlgebra §§0.4–0.13, 0.25 (square zero deformations).

<a id="section-3-3"></a>

### 3.3 Sections agreeing to high order are equal

Prove `TauCeti.HodgeTate.sectionRigidity`. Let O be a rank-one mixed-characteristic valuation ring containing scalars `p^ε,p^δ`, let R be a p-adically complete O-flat algebra, and `X=Spec A` affine of finite presentation over R with `p^εΩ¹_{A/R}=0`. If two R-sections s,t agree modulo `p^δ` and `δ>ε`, then `s=t`. The same comparison glues on a common affine cover. No smoothness hypothesis or assertion that every section lifts is needed: the theorem compares two sections that already exist.

`δ>ε` strictly; R is separated as well as complete, and O-flatness supplies the colon-ideal computation.

The affine statement covers the finite group quotients used in canonical-subgroup uniqueness; any global version requires common affine localization and gluing.

For s,t agreeing modulo `p^a`, their difference modulo `p^{2a}` is an R-derivation `A→p^aR/p^{2a}R`: cross terms vanish in the square-zero ideal.

The universal property of `Ω¹` and `p^εΩ¹=0` force the difference into `p^{2a−ε}R/p^{2a}R`, using O-flatness. Thus agreement improves from a to 2a−ε (HALO Lemma A.2).

Iterate `a_{k+1}=2a_k−ε`; since `a_0=δ>ε`, `a_k` tends to infinity. Separatedness gives equality of the original ring maps. This uses no obstruction to existence of lifts.

**Checks.**

- Used with `Ω¹` of `A[p^m]/C` killed by `p^ε` to show that two candidate canonical subgroups coincide.

[SCH15](https://arxiv.org/abs/1306.2070), Lemma III.2.4, PDF p. 32: The annihilator of differentials forces equality at improving p-adic precision. [HALO](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf), Appendix A.1, Lemma A.2, PDF p. 38: Computes the difference of two existing lifts in a square-zero ideal.

*Needs:* `IsAdicComplete`; `KaehlerDifferential`.

<a id="section-3-4"></a>

### 3.4 Weak and strong canonical subgroups of level m

Define `TauCeti.HodgeTate.canonicalSubgroup`. Let R be a complete p-torsion-free cyclotomic valuation-base algebra and A/R abelian of dimension g. For `m≥1` put `S_m=(p^m−1)/(p−1)`. A weak level-m canonical subgroup is the unique finite locally free subgroup `C_m⊂A[p^m]` reducing to `ker F^m` modulo `p^{1−η}`, under `Ha(A mod p)^{S_m}|p^η` with `η<1/2`. A strong sufficient condition is `Ha^{p^m}|p^η` with `η<1/2`. This is independent of the permitted `η` by uniqueness. The analogous finite BT-level construction uses the co-Lie lifting theorem with its explicit truncation hypotheses. A boundary version uses the supplied finite-height Raynaud/one-motive chart, not a constant-height abelian group across strata.

p is arbitrary, including `p = 2`: the deformation-theoretic construction (Scholze) is uniform in p; Fargues's pointwise Harder–Narasimhan construction needs `p ≠ 2` and the bounds of 3.6 (2).

The base ring may be replaced by any p-adically complete flat algebra over a sufficiently ramified extension of `ℤ_p` containing elements of valuation `ε`.

Construct `C_m` using the subgroup lifting theorem and the annihilator `Ha^{S_m}` of the relevant co-Lie quotient.

Compare two candidates through the quotient and section rigidity at precision `1−η>η`; this proves uniqueness and independence of `η`.

The strong condition implies the weak condition since `S_m≤p^m`; use the appropriate finite-BT chart supplier for the same construction.

The interface consists of the following named results.

- `TauCeti.HodgeTate.canonicalSubgroup`: `C_m ⊂ A[p^m]` on the locus where `Ha^{(p^m−1)/(p−1)} | p^ε`, `ε < 1/2`.
- `TauCeti.HodgeTate.canonicalSubgroup_modFrobenius`: `C_m ≡ ker F^m mod p^{1−ε}`, and `C_m` is the unique closed finite locally free subgroup with this property.
- `TauCeti.HodgeTate.canonicalSubgroup_points`: C_m(R′) ⊇ {s ∈ A[p^m](R′) `| s ≡ 0 mod p^{(1−ε)/p^m}`}, with equality for R′ integrally closed in R′[1/p] (corrected form of Scholze's Corollary 3.2.6).
- `TauCeti.HodgeTate.canonicalSubgroup_degree`: At a rank-one point with `Ha(A[p^m]) < 1/(2p^{m−1}) (p ≥ 5)`, `deg C_m =` mg `− ((p^m − 1)/(p − 1))·Ha`.
- `TauCeti.HodgeTate.canonicalSubgroup_isotropic`: `C_m` is maximal totally isotropic for the Weil pairing of a principal polarisation.
- `TauCeti.HodgeTate.canonicalSubgroup_baseChange`: Formation of `C_m` commutes with base change `R → R′` of p-adically complete flat algebras.
- `TauCeti.HodgeTate.canonicalSubgroup_level`: `C_{m′} = C_m[p^{m′}]` for `m′ ≤ m` (strong subgroups).

**Checks.**

- `TauCeti.HodgeTate.canonicalSubgroup_ordinary`: If `Ha(A₁)` is a unit, `C_m = A[p^m]^0 (multiplicative)`.
- `TauCeti.HodgeTate.canonicalSubgroup_ellipticDegree`: For E elliptic over `O_C` with `Ha(E[p]) = w < 1/2` and `p ≥ 5`, `deg C₁ = 1 − w` and `deg(E[p]/C₁) = w`.
- `TauCeti.HodgeTate.canonicalSubgroup_not_constant`: `C_m` is in general not isomorphic to the constant group `(ℤ/p^m)^g` over R: for A ordinary it is multiplicative, `μ_{p^m}^g` étale-locally; only its geometric generic points are `(ℤ/p^m)^g`.
- `TauCeti.HodgeTate.canonicalSubgroup_points_strict`: The printed equality of Corollary 3.2.6 fails over non-normal R′: for R′ = {(a, b) ∈ O_C² | a `≡ b mod p^{1/(p−1)}`}, A ordinary, `ε = 0`, `s = (ζ_p, 1) ∈ C₁(R′)` is not `≡ 0 mod p^{1/p}`.
- For A ordinary (Ha a unit) C_m is the connected part `A[p^m]^0`, of multiplicative type.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, Definition 3.2.7, p. 34 (arXiv v2): Definition 3.2.7 (weak). [SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, Definition 3.2.7, p. 34: Definition 3.2.7 (strong).

*Needs:* [3.1](#section-3-1); [0.14](#section-0-14); [0.13](#section-0-13); [3.2](#section-3-2); [3.3](#section-3-3).

Applications include Scholze 2015, Theorem 3.2.15: canonical Frobenius lifts and the anticanonical tower (PerfectoidShimuraVarieties S1); BHW 2019, §§3–5: Hilbert canonical subgroups and the anticanonical tower; Layer 4: canonical and anticanonical loci at `Γ₀(p^n)` level; Layer 5: Igusa torsors of the dual canonical subgroup and `ω^int`.

<a id="section-3-5"></a>

### 3.5 Hasse height of a supplied Frobenius-congruent quotient

Prove `TauCeti.HodgeTate.pointwiseQuotientHasse`. Let H be a p-divisible group over `O_C`, `p≠2`, `G = H[p²]` with Hasse height `w<1`, `C⊂G[p]` a finite flat subgroup of height dim G, and `E=p^{−1}C/C` the level-one truncated Barsotti–Tate quotient of 0.28. Assume C reduces to ker F modulo `p^{1−w}`. Then `min(Ha(E),1−w)=min(pw,1−w)`. In particular `Ha(E)=pw` for `w<1/(p+1)`, and `Ha(E)≥1−w` for `w≥1/(p+1)`. This statement assumes the subgroup; it proves no canonical-subgroup existence.

E, its height and dimension, and its conormal and reduction compatibilities are 0.28.

Use the arbitrary-characteristic-p-base Hasse theory of R07.2. Normalize `v(p)=1` and truncate Hasse heights at 1.

Over a base killed by p, Frobenius identifies `p^{−1}ker F/ker F` with `G[p]^(p)`; its conormal determinant transports the Hasse section to its pth tensor power.

Reduce the supplied C and E modulo `p^{1−w}`. Equality of these Hasse sections gives equality of their valuations truncated at `1−w`, as in the proof of FAR11 Theorem 5.

Compare pw with `1−w` to obtain the two stated branches. No invocation of the main canonical-subgroup theorem occurs.

**Checks.**

- For `w=0` the supplied Frobenius-congruent quotient has Hasse height zero.
- For `p=5` and `w=1/10` the height is 1/2; at `w=1/6` only the lower bound 5/6 follows.

[FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §7.4, proof of Théorème 5, PDF pp.37–38: The truncated Hasse identity in the proof uses only the supplied Frobenius congruence, allowing it before canonical-subgroup induction.

*Needs:* [3.1](#section-3-1); [0.28](#section-0-28); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.21; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality).

<a id="section-3-6"></a>

### 3.6 Existence, uniqueness and characterisations of canonical subgroups

Prove `TauCeti.HodgeTate.canonicalSubgroup_theorem`. (1) (Families, all p.) Let R be a p-adically complete flat ℤ_p^cycl-algebra and A/R an abelian scheme with `Ha(A₁)^{(p^m−1)/(p−1)} | p^ε`, `ε < 1/2`. There is a unique closed subgroup `C_m ⊂ A[p^m]`, finite locally free over R, with `C_m = ker F^m` modulo `p^{1−ε}`; for every p-adically complete flat R-algebra R′, C_m(R′) ⊇ {s ∈ A[p^m](R′) `| s ≡ 0 mod p^{(1−ε)/p^m}`}, with equality when R′ is integrally closed in R′[1/p]. (2) (Points, `p ≠ 2.`) Let `G = H[p^n]` for a p-divisible group H of height h and dimension `d < h` over `O_C`, with `Ha(G) < 1/(2p^{n−1})` if `p ≥ 5` and `Ha(G) < 1/3^n` if `p = 3`. Then the Harder–Narasimhan filtration of G (Fargues 2010) has a step C with `C(O_C)` free of rank d over `ℤ/p^n`; `deg(G/C) = ((p^n − 1)/(p − 1))·Ha(G)`; for `1 ≤ k ≤ n`, `C_k := C[p^k]` is the analogous step of `G[p^k]` and `C_k ⊗ O_C/p^{1−p^{k−1}Ha(G)}` is the kernel of `F^k`; `C(O_C) = ker α_{G, n−((p^n−1)/(p−1))Ha(G)}`, the kernel of the Hodge–Tate map of G reduced modulo `p^{n−((p^n−1)/(p−1))Ha(G)}`; and `C(O_C)^⊥ ⊂ G^D(O_C)` is the corresponding step of `G^D`. When `G = A[p^n]` for A as in (1) over `R = O_C` and both apply, the two subgroups coincide.

(1) is Scholze's Corollary 3.2.6 with the integral-points formula stated on its integral-closure domain (equality only for R′ integrally closed in R′[1/p]); uniqueness is proved through 3.3, not through the printed formula.

(2) is Fargues 2011, Théorèmes 4 and 6, stated for `p ≠ 2`; `p = 2` is covered by (1) only. Fargues states (2) for every truncated Barsotti–Tate group of level n; it is stated here for truncations of p-divisible groups, the generality of every use in this roadmap (abelian schemes and their p-divisible groups), so that the quotients in the induction are again truncations (0.28).

For `n = 1` and `p ≥ 5` the bound is `Ha(G) < 1/2`; for `p = 3` it is `Ha(G) < 1/3`.

(1) Existence: `H₁ := ker(V^m: A₁^{(p^m)} → A₁)` has co-Lie complex `Lie A₁^{(p^m)} → Lie A₁` with determinant `Ha^{(p^m−1)/(p−1)}`, so `p^ε ≃ 0` on `ℓ̌_{H₁}`; apply 3.2 to `ker F^m ⊂ A₁[p^m]`.

(1) Uniqueness and points: if C, C′ are both `≡ ker F^m mod p^{1−ε}`, the universal point of C maps to a point of `A[p^m]/C′` vanishing `mod p^{1−ε}`, and `Ω¹` of `A[p^m]/C′` is killed by `p^ε < p^{1−ε}`, so 3.3 gives `C ⊂ C′`.

(2) Use FAR11 Theorem 4 for level-one existence, degree, Frobenius congruence and character-kernel identification, with the stated HN/degree/cokernel and Oort–Tate inputs. For `n≥2` let `D⊂G[p]` be that level-one subgroup. 3.5 gives `Ha(p^{−1}D/D)=pw`; 0.28 supplies the level-(n−1) quotient `p^{−(n−1)}D/D = (H/D)[p^{n−1}]`, again the truncation of a p-divisible group. Apply induction to this quotient and take the inverse image of its canonical subgroup. HN/degree inequalities identify the resulting height-nd break (FAR11 Theorem 6, PDF pp.38–39). The family quotient-radius theorem 3.8 is not a prerequisite.

**Checks.**

- For E ordinary, `C₁ = E[p]^0 = μ_p` étale-locally and `ker α_{E[p]} = E[p]^0(O_C)`.
- For E with `Ha(E) = 1/4` and `p ≥ 5`, `deg C₁ = 3/4`.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, Corollary 3.2.6, p. 33 (arXiv v2): Corollary 3.2.6: existence and uniqueness. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, proof of Corollary 3.2.6, p. 33: Existence through the lifting corollary. [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §7.5, Théorème 6, PDF pp.38–39: Fargues's main theorem, `p ≠ 2`. [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §7.5, Théorème 6 (7), PDF pp.38–39: Hodge–Tate characterisation. [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §6.5, Théorème 4, PDF p. 32: Degree of the quotient at level 1.

*Needs:* [3.2](#section-3-2); [3.3](#section-3-3); [3.4](#section-3-4); [0.2](#section-0-2); [0.5](#section-0-5); [0.19](#section-0-19); [0.7](#section-0-7); [0.8](#section-0-8); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (oort tate classification); [3.5](#section-3-5); [0.28](#section-0-28).

<a id="section-3-7"></a>

### 3.7 Levels, functoriality, duality and generic points of canonical subgroups

Prove `TauCeti.HodgeTate.canonicalSubgroup_properties`. Let R be a p-adically complete flat ℤ_p^cycl-algebra and A, B abelian schemes over R; canonical means strong (3.4). (i) If A has a canonical subgroup `C_m` of level m, it has one of every level `m′ ≤ m`, and `C_{m′} = C_m[p^{m′}] ⊂ C_m`. (ii) If f: `A → B` is a homomorphism and both have canonical subgroups of level m, then `f(C_m) ⊂ D_m`; in particular `C_m` is stable under endomorphisms (e.g. an `𝒪_F`-action). (iii) For a principal polarisation `λ`, `C_m` is maximal totally isotropic for the Weil pairing on `A[p^m]`, and pointwise `C_m(O_C)^⊥ ⊂ A^∨`[p^m](O_C) is the canonical subgroup of `A^∨` at every rank-one point (`p ≠ 2`: Fargues 2011, Proposition 11 and Corollaire 1). (iv) If x̄ is a geometric point of Spec R[1/p], `C_m(x̄) ≅ (ℤ/p^m)^g`. (v) Formation of `C_m` commutes with base change `R → R′`.

(iv) needs the strong condition `(Ha^{p^m} | p^ε, ε < 1/2)`; for `m = 1` the weak subgroup already has `(ℤ/p)^g` geometric points since it has order `p^g` and is killed by p.

The printed proofs of (i)–(ii) use the incorrect equality of Corollary 3.2.6; this construction proves them through 3.3.

The duality statement over families: totally isotropic by uniqueness (the orthogonal of `C_m` also satisfies the defining congruence).

(i), (ii), (v): uniqueness in 3.6 (1) applied to `C_m[p^{m′}]`, `f(C_m)` and the base change, each of which satisfies the defining congruence modulo `p^{1−ε}`, via 3.3.

(iii): `ker F^m` is totally isotropic `mod p^{1−ε}`, so `C_m^⊥` satisfies the defining congruence of the canonical subgroup and equals `C_m` by uniqueness; pointwise duality from Fargues 2011 Proposition 11.

(iv): reduce to `R = O_K` with K algebraically closed (open-and-closed locus and specialisation); if `C_m(K) ≇ (ℤ/p^m)^g` there is `s ∈ C_m ∩ A[p]` outside C₁, whose image t in A[p]/C₁ is `≡ 0 mod p^{(1−ε)/p^m}`; 3.3 with `δ = (1 − ε)/p^m > ε/p^m` gives `t = 0`, a contradiction.

**Checks.**

- For A ordinary, `C_m = A[p^m]^0` and `C_m(x̄) = μ_{p^m}^g(x̄) ≅ (ℤ/p^m)^g`.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, Proposition 3.2.8(i), p. 34 (arXiv v2): Proposition 3.2.8(i). [SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, Proposition 3.2.8(ii), p. 34: Proposition 3.2.8(ii). [SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, Proposition 3.2.8(iv), p. 34: Proposition 3.2.8(iv).

*Needs:* [3.6](#section-3-6); [3.3](#section-3-3); [3.4](#section-3-4); `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `AbelianSchemesAndArithmeticModuli` A3 (polarized weil pairing); `AbelianSchemesAndArithmeticModuli` A4 (p divisible group).

<a id="section-3-8"></a>

### 3.8 Quotients by canonical and anticanonical subgroups and the Hasse radius

Prove `TauCeti.HodgeTate.quotientHasseRadius`. (1) Let A/R have a canonical subgroup `C_{m₁}` of level m₁ (radius `ε < 1/2`). Then `Ha(A/C_{m₁}) = Ha(A)^{p^{m₁}}` modulo `p^{1−ε}`, and `B := A/C_{m₁}` has a canonical subgroup `D_{m₂}` of level m₂ iff A has one of level `m = m₁ + m₂`; then `0 → C_{m₁} → C_m → D_{m₂} → 0` is exact and compatible with `0 → C_{m₁} → A → B → 0`. (2) (Points, `p ≠ 2.`) For a BT₂ G over `O_C` with `Ha(G) < 1/(p+1)` and C its canonical subgroup of level 1, `Ha(p^{-1}C/C) = p·Ha(G)`; if `1/(p+1) ≤ Ha(G) < 1/2` then `Ha(p^{-1}C/C) ≥ 1 − Ha(G)`. (3) (Anticanonical quotients.) If A′ has a weak canonical subgroup C′ of level 1 on `𝔛(ε)`, `ε < 1/2`, and `D ⊂ A′[p]` is a subgroup of order `p^g` with `D ∩ C′ = 0`, then A′/D has Hasse valuation `Ha(A′)/p`, and `(A′/D)/(A′[p]/D) ≅ A′`: dividing by a canonical subgroup multiplies the Hasse radius by p, dividing by an anticanonical subgroup divides it by p.

(1) needs the strong condition at level m₁; the exactness in (1) also uses `p^{m₂}C_m ⊂ C_{m₁}`, proved by the same congruence argument (not written in Scholze's proof).

(3) is the content of Scholze's Theorem 3.2.15(iii): `𝒳(p^{-1}ε) ≅ 𝒳_{Γ₀(p)}(ε)_a` by `A ↦ (A/C, A[p]/C)`.

(1): modulo `p^{1−ε}`, `A/C_{m₁} = A/ker F^{m₁} = A^{(p^{m₁})}`, whose Hasse invariant is `Ha(A)^{p^{m₁}}`; the exact sequence by uniqueness and 3.3, using `0 → ker F^{m₁}_A → ker F^m_A → ker F^{m₂}_B → 0 mod p^{1−ε}`.

(2) Apply 3.5 to the canonical level-one subgroup supplied by the main theorem and its Frobenius congruence.

(3): for A with `|Ha| ≥ |p|^{ε/p}`, `A′ = A/C` has radius `ε` by (1), and `D = A[p]/C` meets the weak canonical subgroup of A′ trivially (3.3); conversely `A′/D ≅ A`.

**Checks.**

- For ordinary E over `O_C`, `E/E[p]^0` is ordinary. Its special-fibre quotient is the Frobenius twist; no mixed-characteristic Frobenius-twist isomorphism is asserted.
- For `p≥5` and `Ha(E)=1/(2p)`, `Ha(E/C₁)=1/2` and `Ha(E/D)=1/(2p²)` for an anticanonical D.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.1, proof of Proposition 3.2.8(iii), p. 34 (arXiv v2): Hasse invariant of the quotient by the canonical subgroup. [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), §7.4, Théorème 5, PDF p. 37: Fargues's Théorème 5. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.2, Theorem 3.2.15(iii), pp. 39–40 (arXiv v2): Anticanonical subgroups and the radius change. [AIP15](https://arxiv.org/abs/1212.3812), §6.2.1, Proposition 6.2.1.1, PDF p.29 (arXiv:1212.3812v1; auxiliary `p>2` range): Dividing by an anticanonical subgroup divides the Hodge height by p.

*Needs:* [3.6](#section-3-6); [3.7](#section-3-7); [3.3](#section-3-3); [3.5](#section-3-5).

<a id="section-3-9"></a>

### 3.9 The Hodge–Tate map of the dual canonical subgroup

Prove `TauCeti.HodgeTate.canonicalSubgroup_hodgeTate`. Let `C/ℚ_p` be complete algebraically closed, `G/O_C` p-divisible of dimension d, and `n≥1`. In the strict FAR11/AIP15 range for `p≥3`, or in the HALO range `w≤p^{−(n+1)}` for every p, let `H_n` be canonical, w the Hodge height and `δ=S_n w`. Then `ω_{G[p^n]}/p^{n−δ}≅ω_{H_n}/p^{n−δ}`. The character map `H_n^D(C)⊗O_C→ω_{H_n}` has cokernel of valuation degree `w/(p−1)`. Its determinant ideal `Hdg_T` satisfies `Hdg_T^{p−1}=Hdg`, and its cokernel is killed by `Hdg_T`. In the FAR11 range `H_n(O_C)` is the kernel of `α_G` truncated at `n−δ`; HALO Proposition A.2 gives the level-one kernel in its own hypotheses. In normal formal families with trivialized dual canonical points, the determinant-ideal and annihilator statements hold on the AIPH/HALO models; their analytic `O⁺` form is obtained through 3.11. The modified-lattice quotient isomorphism is Layer 5’s result, not a raw integral Hodge–Tate isomorphism.

For `p≥5` the FAR11 HN range is `w<1/(2p^{n−1})`; for `p=3` it is `w<1/3^n`. Keep these strict inequalities separate from BHW’s larger inclusive position target.

For `p=2` the required uniform radius is `w≤1/2^{n+1}`; HALO Corollary A.2 and Proposition A.3 replace the excluded `p=2 FAR11` theorem.

Formal determinant ideals require a normal admissible torsion-free base, an invertible Hodge ideal, and the trivialized generic dual quotient of HALO Proposition A.3. Fractional powers mean powers of this `Hdg_T` ideal, not arbitrary formal real powers.

For `p≥3` use AIP15 Proposition 3.2.1 for the truncated conormal isomorphism and the raw character-cokernel defect; use FAR11 Theorem 6 for its kernel characterization in the strict HN range.

For `p=2` use HALO Corollary A.2(4) for conormal annihilators and Proposition A.3 for `Hdg_T^{p−1}=Hdg`; iterate the compatible quotients to level n. The `p=2` weak lift uses `S_n/2^{n+1}<1/2`.

HALO’s determinant argument reduces on normal models to FAR11 Proposition 7: the semilinear fixed-vector matrix has determinant valuation `w/(p−1)`, and its adjugate gives the annihilator. At `p=2` the needed `w≤1/4` is inside the matrix lemma’s strict `w<1/2` range.

Transfer these explicit generator matrices and quotient isomorphisms to `O⁺` through 3.11 (2); local freeness is not inferred from normality and pointwise ranks.

**Checks.**

- For A ordinary `(w = 0)`, `C_n = A[p^n]^0`, `C_n^D` is étale and `α` identifies `(C_n^D)(O_C) ⊗ O_C/p^n` with `ω_A/p^n (0.11)`.

[AIP15](https://arxiv.org/abs/1212.3812), §3.2, Proposition 3.2.1, PDF pp.12–13 (arXiv:1212.3812v1): Provides the truncated conormal comparison and the positive raw Hodge–Tate cokernel defect. [FAR11](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf), Proposition 7, PDF pp. 27–29; Théorème 6, PDF pp.38–39: The fixed-vector determinant calculation and the strict-range HN kernel theorem. [HALO](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf), Appendix A.2, Corollary A.2(4); A.3, Propositions A.2–A.3, PDF pp. 39–41: Supplies the all-prime formal canonical construction and determinant ideal, including the `p=2` range.

*Needs:* [3.6](#section-3-6); [3.7](#section-3-7); [0.5](#section-0-5); [0.11](#section-0-11); [0.2](#section-0-2); [0.22](#section-0-22); [3.11](#section-3-11); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal).

<a id="section-3-10"></a>

### 3.10 Canonical subgroups of Hilbert–Blumenthal abelian schemes at arbitrary p

Prove `TauCeti.HodgeTate.hilbertCanonicalSubgroup`. For a HBAV A/R on the specified normal admissible Deligne–Pappas/Rapoport Hilbert model, with total Hasse height `w≤ε≤p^{−(n+1)}`, a level-n canonical subgroup `H_n` exists for every p, has integral finite locally free `rank p^{ng}`, is O_F-stable, and its geometric generic points are locally free rank one over `O_F/p^n`. The dual canonical generic module has the corresponding invertible `O_F/p^n` type via the polarization ideal. The freeness over `O_F/p^n` is 3.12, not merely `O_F` stability and a `ℤ/p^n rank` count; for `n = 1` at a prime ramified in F it uses the level-two canonical subgroup, so there the radius is `ε ≤ p^{−3}`. Integral `H_n` may be multiplicative and is not identified with a constant group.

R is on the normal admissible Hilbert formal model where the total Hasse ideal is invertible and the HALO/AIPH construction applies. A general arbitrary R with the same numerical rank is insufficient.

The small-prime endpoint is allowed: `S_n ε≤(p^n−1)/((p−1)p^{n+1})<1/2` even for `p=2`. The stronger `p^nε<1/2` proof is not used at its `p=2` equality.

The unsplit `O_F/p^n` generator and the polarization-ideal type at ramified p are 3.12.

Apply HALO Corollary A.2 to `p∈Hdg^{p^{n+1}}`; alternatively apply the weak subgroup lifting condition using the displayed strictly smaller than 1/2 value `S_nε`.

Functorial uniqueness gives `O_F` stability. Frobenius reduction gives integral `rank p^{ng}`; HALO gives the geometric `ℤ/p^n` type.

Apply 3.12 at the geometric generic points, with the level-two canonical subgroup when `n = 1` and p ramifies in F; this upgrades the `ℤ/p^n` type to `O_F/p^n` freeness.

**Checks.**

- For `F = ℚ`, `C_n ⊂ E[p^n]` is the classical canonical subgroup of the modular curve, cyclic of order `p^n` on geometric generic points.

[BHW](https://arxiv.org/abs/1902.03985), §5.2, PDF pp. 21–23; §7.1, PDF p. 29: Uses the total-Hasse canonical subgroup and the Hilbert dual generator. [HALO](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf), Appendix A.2, Corollary A.2(1)–(6), PDF pp. 39–40: Gives existence, nesting, quotient, duality and geometric generic `ℤ/p^n` type at every prime. [AIPH](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf), §3, Propositions 3.2–3.3, PDF p.11 (Hilbert_adicfinal.pdf): The Hilbert formal setting and O_F-linear generator enter the integral lattice construction.

*Needs:* [3.4](#section-3-4); [3.6](#section-3-6); [3.7](#section-3-7); [3.1](#section-3-1); [3.12](#section-3-12); `ShimuraCompactifications` C6 (hilbert near ordinary model); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal); `HilbertModularVarietiesAndShimuraCurves` H2 (hasse formal domains); `ShimuraCompactifications` C6 (hilbert near ordinary model); AdicSpacesPartIII R2 (hasse domain); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-3-11"></a>

### 3.11 Normal formal models and their analytic integral structure

Prove `TauCeti.HodgeTate.normalFormalModel_plus`. Let K be a finite extension of `ℚ_p` and 𝔛 an admissible formal scheme over `Spf O_K` (topologically of finite type and p-torsion-free), with adic generic fibre `X = 𝔛_η` and specialization morphism of locally ringed spaces s: `(X, O⁺_X) → 𝔛`. (1) If 𝔛 is normal, then for every affine open `Spf A₀ ⊂ 𝔛` the generic fibre `s^{−1}(Spf A₀) = Spa(A, A⁺)` has `A = A₀[1/p]` and `A⁺ = A₀`; so `O⁺_X(s^{−1}U) = O_𝔛(U)` for affine U. (2) For a finite locally free `O_𝔛-module E`, the integral structure `E⁺ := s*E` is a locally free `O⁺_X`-module with `E⁺(s^{−1}U) = E(U)` on affines U where E is free, and `E⁺[1/p] = E_η`. A submodule `F ⊂ E` given on U by the columns of a matrix M over `O_𝔛(U)`, with det M generating an invertible ideal 𝔡, gives the sub-O⁺-module `F⁺ ⊂ E⁺` spanned by the same columns, with `𝔡E⁺ ⊂ F⁺` and the same adjugate relations; morphisms and congruences modulo an invertible ideal are given by the same matrices. (3) If X is reduced, the normalization 𝔛′ of 𝔛 in its generic fibre (on affines Spf of the integral closure of A₀ in A₀[1/p]) is a finite admissible formal 𝔛-scheme, normal, with `𝔛′_η = X`, so (1) applies to 𝔛′. (4) If X is reduced, then for a finite étale morphism `Y → X` of adic spaces the normalization of 𝔛 in Y is a finite normal formal model of Y over 𝔛, functorial in Y; normalizations commute with étale base change on 𝔛.

K finite over `ℚ_p`, so that topologically finite type O_K-algebras are noetherian and excellent; 𝔛 admissible. Over a nondiscretely valued base the finiteness in (3) is not asserted, and the analytic `O⁺` constructions over perfectoid fields are made directly on the generic fibre.

(1) A₀ is normal and p-torsion-free, so it is integrally closed in `A = A₀[1/p]`; every power-bounded element of the affinoid algebra A is integral over the formal model A₀ (maximum principle), so `A° ⊂ A₀ ⊂ A⁺ ⊂ A°`.

(2) s*E is computed on affines by `E(U) ⊗_{O_𝔛(U)} O⁺_X`, which is E(U) by (1); the matrix statements are the base change of the same identities along `A₀ = A⁺`.

(3) A₀ is excellent, so its integral closure in the reduced ring A is finite over A₀; it is again topologically of finite type and p-torsion-free, and inverting p does not change A.

(4) Apply (3) to the integral closure of A₀ in the finite étale A-algebra B; étale base change commutes with integral closure for excellent rings.

**Checks.**

- For `𝔛 = Spf ℤ_p⟨T⟩`, X is the closed unit disc and `O⁺(X) = ℤ_p⟨T⟩`.
- For the non-normal model `Spf ℤ_p⟨S`, `T⟩/(S² − p²T)` of the disc `Spa(ℚ_p⟨T′⟩)` with `S = pT′` (so `T = T′²`), the element `S/p = T′` is power-bounded but not in A₀, so `A⁺ ≠ A₀`; its normalization adjoins T′.
- For `E = O_𝔛` and F given by the `1 × 1` matrix (p), `F⁺ = pO⁺` and `𝔡 = (p)`. A congruence modulo the non-invertible ideal (p, T) of `ℤ_p⟨T⟩` has no analytic meaning, since (p, T) becomes the unit ideal on the generic fibre: (2) transports congruences only modulo invertible ideals.

[AIPH](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf), §3.3.1, PDF p. 11: the analytic fibre of the formal Hilbert models is taken with `A⁺` the normalization of A₀ in A₀[1/p], and the partial Igusa tower over the formal model is the normalization of the formal model in its generic-fibre torsor, as in (3)–(4). [AIPH](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf), §4.1, Proposition 4.1 and its proof, PDF pp. 15–16: the modified lattice is defined on a formal affine open by an explicit matrix of Hodge–Tate images with invertible determinant ideal, which (2) transports to the analytic fibre. [BHW](https://arxiv.org/abs/1902.03985), §4, Definition 4.2 and the paragraph before Definition 4.1, PDF p. 15: the integral `O⁺-module s*G` attached to a coherent sheaf G on a formal model, and the choice to work analytically over a perfectoid base to avoid normalizations in the nonnoetherian setting.

*Needs:* AdicSpacesPartIII R2 (admissible formal scheme); AdicSpacesPartIII R2 (generic fibre functor d); AdicSpacesPartIII R2 (admissible blow up); `AlgebraicGeometry.Scheme.Hom.normalization`; `TauCeti.Huber.Pair`.

Applications include 3.9 (the determinant-ideal statements on normal formal Hilbert charts), 4.2 (the formal canonical locus), 5.3–5.6 and 5.9 (the modified lattices and their analytic incarnations).

<a id="section-3-12"></a>

### 3.12 The `𝒪_F`-module structure of Hilbert canonical subgroups

Prove `TauCeti.HodgeTate.hilbertCanonical_OF_free`. Let F be a totally real field of degree g, p a prime, C a complete algebraically closed extension of `ℚ_p`, and A an abelian scheme of relative dimension g over `O_C` with `𝒪_F ⊂ End(A)` satisfying the determinant (Deligne–Pappas) condition of the Hilbert moduli problem (`HilbertModularVarietiesAndShimuraCurves` H2) and an 𝒪_F-linear 𝔠-polarization. Write `𝒪_F ⊗ ℤ_p = ∏_{𝔭|p} 𝒪_𝔭` with ramification indices `e_𝔭` and residue degrees `f_𝔭`. Let `n ≥ 1` and `H ⊂ A[p^n]` a finite flat 𝒪_F-stable subgroup with `H ⊗ O_C/p^δ = ker(F^n)` on `A ⊗ O_C/p^δ` for some `δ > 0` and `H(C) ≅ (ℤ/p^n)^g` as a group. Then (1) `T_pA` is free of rank two over `𝒪_F ⊗ ℤ_p`; (2) if `n ≥ 2`, or p is unramified in F, or `H = H′[p^n]` for a subgroup `H′ ⊂ A[p^{n+1}]` satisfying the same hypotheses at level n + 1, then H(C) is free of rank one over `𝒪_F/p^n`; (3) under the hypotheses of (2), A[p^n](C)/H(C) and the Cartier dual `H^D(C)` are free of rank one over `𝒪_F/p^n`, the latter through the 𝔠-polarization and the Weil pairing; (4) in families over a normal formal Hilbert chart on which the canonical subgroup `H_n` of 3.10 exists (with `n ≥ 2`, or p unramified in F, or the level-(n + 1) canonical subgroup also existing), `H_n^D` is étale locally on the generic fibre isomorphic to the constant `𝒪_F`-module scheme `𝒪_F/p^n`.

The determinant condition, the polarization and the Frobenius congruence of H are all used; 𝒪_F-stability together with the abelian-group type of H(C) does not imply (2) when p is ramified or has several primes above it.

(1) The idempotents of `𝒪_F ⊗ ℤ_p` split `A[p^∞] = ∏_𝔭 A[𝔭^∞]`, with `A[𝔭^∞]` a p-divisible `𝒪_𝔭`-module. The determinant condition gives `dim A[𝔭^∞] = e_𝔭f_𝔭`, and the polarization identifies `A[𝔭^∞]^D` with `A^∨[𝔭^∞]` of the same dimension, so its height is `2e_𝔭f_𝔭 (0.25 (4))`. Its Tate module is a finitely generated torsion-free module over the discrete valuation ring `𝒪_𝔭`, hence free, of rank two.

(2) `H = ∏_𝔭 H_𝔭` with `H_𝔭 ⊂ A[𝔭^∞][p^n]`, and the Frobenius congruence gives `|H_𝔭| = |ker F^n` on `A[𝔭^∞]| =` p^{ne_𝔭f_𝔭}. The group `H_𝔭(C)` is free over ℤ/p^n (a summand of H(C)), so it is a direct summand of the free `ℤ/p^n-module A[𝔭^∞]`[p^n](C) ≅ (𝒪_𝔭/p^n)² (ℤ/p^n is self-injective), and the quotient `Q_𝔭` is ℤ/p^n-free of `rank e_𝔭f_𝔭`. Write `Q_𝔭 ≅ 𝒪_𝔭/π^a ⊕ 𝒪_𝔭/π^b` with a `≥ b`, a `+ b =` ne_𝔭; if `b > 0` then `Q_𝔭[p]` has order `p^{f_𝔭(e_𝔭 + min(b, e_𝔭))} > p^{e_𝔭f_𝔭}`, contradicting ℤ/p^n-freeness. Here a `≥` ne_𝔭/2, so `min(a, e_𝔭) = e_𝔭` as soon as `n ≥ 2`; for `n = 1` and `e_𝔭 = 1`, `𝒪_𝔭/p` is the field `𝔽_{p^{f_𝔭}}` and `Q_𝔭` is a one-dimensional vector space over it; for `H = H′[p^n]` apply the level-(n + 1) case and take p^n-torsion of `𝒪_𝔭/p^{n+1}`. So `Q_𝔭 ≅ 𝒪_𝔭/p^n` and `H_𝔭(C)`, the kernel of a surjection of free `𝒪_𝔭/p^n`-modules of ranks two and one, is free of rank one. For `n = 1` at a ramified 𝔭 the group type alone allows `Q_𝔭 ≅ 𝒪_𝔭/π^a ⊕ 𝒪_𝔭/π^b` with a `+ b = e_𝔭`, which is why level n + 1 is then used.

(3) The quotient is `∏ Q_𝔭` from (2); the Weil pairing identifies `H^D(C)` with `Hom_ℤ(H(C), μ_{p^n})`, free of rank one over `𝒪_F/p^n` because the trace form identifies `Hom_ℤ(𝒪_F/p^n, ℤ/p^n)` with `𝔡^{−1}/p^n𝔡^{−1}`, an invertible `𝒪_F/p^n`-module.

(4) Apply (2)–(3) at every geometric point of the generic fibre; `H_n^D` is finite étale there (HALO Corollary A.2 (6)), and a finite étale `𝒪_F/p^n`-module scheme whose geometric fibres are free of rank one is étale locally constant.

**Checks.**

- For `F = ℚ`, (2) says that H(C) is cyclic of order `p^n`, the classical canonical subgroup of an elliptic curve.
- For `p = 𝔭₁𝔭₂` split in a real quadratic F, `𝒪_F/p = 𝔽_p × 𝔽_p` and A[p](C) `≅ (𝔽_p × 𝔽_p)²`; the 𝒪_F-stable subgroup A[𝔭₁](C) `= (𝔽_p × 0)²` has group type `(ℤ/p)² = (ℤ/p)^g` but is not free over `𝒪_F/p`; it fails the Frobenius congruence because its 𝔭₂-part is zero while ker F has 𝔭₂-part of order p.
- For `p = 𝔭²` ramified in a real quadratic F with uniformizer `π`, the `𝒪_F/p = 𝔽_p[π]/(π²)-module (𝔽_p[π]/π)²` has group type `(ℤ/p)² = (ℤ/p)^g` but is not free; this is the level-one ambiguity that (2) resolves through the level-two subgroup.

[AIPH](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf), §3.2, Proposition 3.2, PDF p. 11: the canonical subgroup `H_n` of the Hilbert formal model is 𝒪_F-stable, finite flat of `rank p^{ng}`, and its Cartier dual is étale locally isomorphic to `𝒪_F/p^n` as an `𝒪_F`-module on the generic fibre, which is (4). [HALO](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf), Appendix A.2, Corollaire A.2 (5)–(6), PDF pp. 39–40: duality of canonical subgroups and the étale ℤ/p^n-type of the quotient `G[p^n]/H_n` on the generic fibre. [BHW](https://arxiv.org/abs/1902.03985), §5.3, proof of Proposition 5.18, PDF pp. 24–25: the coordinates of the canonical subgroup in an 𝒪_p-frame, used through (2).

*Needs:* [0.25](#section-0-25); [3.7](#section-3-7); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `AbelianSchemesAndArithmeticModuli` A3.5.

Applications include 3.10 (the 𝒪_F/p^n-type of Hilbert canonical subgroups), 4.6–4.7 (the canonical generator in an anticanonical frame), 5.1–5.3 (Igusa torsors and the integral lattice).

### Examples

At `p=2`, `n=2` and `w=1/7`, `S_n w=3/7<1/2` while `p^n w=4/7>1/2`. At the all-prime endpoint `w=p^{−(n+1)}`, the weak inequality is strict, including `p=2`, while the strong inequality is an equality for `p=2`. The ordinary height `w=0` gives the multiplicative canonical subgroup at every positive level. The detailed computations and negative controls are included with the definitions above.

### Dependencies

Layer 0; AdicSpacesPartIII R2; `ShimuraCompactifications` C6; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2; `HilbertModularVarietiesAndShimuraCurves` H2; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.6; DerivedModuleAlgebra §§0.4–0.13, 0.25; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1; `AbelianSchemesAndArithmeticModuli` A3; `AbelianSchemesAndArithmeticModuli` A4; `HilbertModularVarietiesAndShimuraCurves` H4. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 4: Canonical/anticanonical geometry and period estimates

Layer 4 defines canonical and anticanonical loci at Γ₀(p^n)-level and identifies the canonical locus with a section of the cover. It proves that Atkin–Lehner carries anticanonical loci to smaller Hasse neighbourhoods. It introduces the Hodge–Tate coordinate with its fractional-linear action and factor cz + d, balls about integral points of the Hilbert flag variety, and the period estimates of BHW Proposition 5.18 together with their ramified version and the integral kernel congruence.

<a id="section-4-1"></a>

### 4.1 Canonical and anticanonical loci at Γ₀(p^n)-level

Define `TauCeti.HodgeTate.canonicalLocus`. Let X be the Siegel, Hilbert or PEL Shimura variety at prime-to-p level with Hasse neighbourhoods `X(ε) (3.1)`, `ε` small enough that the universal (semi-)abelian scheme A over `X(ε)` has a weak canonical subgroup `C ⊂ A[p]` of level 1 and, where needed, a canonical subgroup `C_n` of level n (3.4). Let `X_{Γ₀(p^n)}` parametrise (A, D) with `D ⊂ A[p^n]` a totally isotropic (𝒪_F-stable, for Hilbert data locally free of rank one over `𝒪_F/p^n` on geometric points) subgroup of the appropriate order, and `X_{Γ₀(p^n)}(ε)` the preimage of `X(ε)` under `(A, D) ↦ A`. The canonical locus `X_{Γ₀(p^n)}(ε)_c` is the open and closed subspace where `D = C_n`; the anticanonical locus `X_{Γ₀(p^n)}(ε)_a` is the open and closed subspace where `D[p] ∩ C = 0`. Both are defined on generic fibres by these subgroup conditions, and on formal models through the integral `C_n` and the schematic closure of D.

Hilbert data: `X_{Γ₀*(p^n)}` with BHW's level structure `Φ_n`: `C ↪ A^∨[p^n]` étale locally isomorphic to `𝒪_F/p^n` (the dual abelian variety carries the level structure in BHW's convention).

The canonical locus needs a canonical subgroup of level n, i.e. `ε` within the radius of 3.10 or 3.6; the anticanonical locus only needs the level-1 weak canonical subgroup.

Openness and closedness: the conditions `D = C_n` and `D[p] ∩ C = 0` are open and closed on the finite étale cover `X_{Γ₀(p^n)}(ε) → X(ε)` (comparison of finite étale subgroups).

For the Siegel case these loci and their open immersions are PerfectoidShimuraVarieties S1 (anticanonical open immersions) and S1 (anticanonical locus level p); this construction gives the general definition they use.

The interface consists of the following named results.

- `TauCeti.HodgeTate.canonicalLocus`: `X_{Γ₀(p^n)}(ε)_c = {(A, D) : D = C_n}`.
- `TauCeti.HodgeTate.anticanonicalLocus`: `X_{Γ₀(p^n)}(ε)_a = {(A, D) : D[p] ∩ C = 0}`.
- `TauCeti.HodgeTate.anticanonicalLocus_isClopen`: Both loci are open and closed in `X_{Γ₀(p^n)}(ε)`.
- `TauCeti.HodgeTate.anticanonicalLocus_forget`: The forgetful maps `X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a`, `(A, D) ↦ (A, D[p^n])`, give the anticanonical tower.
- `TauCeti.HodgeTate.canonicalLocus_section`: `X(ε) → X_{Γ₀(p^n)}(ε)_c`, `A ↦ (A, C_n)`, is an isomorphism (4.2).

**Checks.**

- `TauCeti.HodgeTate.anticanonicalLocus_ordinary`: On the ordinary locus, D is a complement to the connected multiplicative part `A[p^n]^0` and is étale-locally `(ℤ/p^n)^g`. Many complements may exist; D is not asserted equal to a previously chosen complement.
- `TauCeti.HodgeTate.canonicalLocus_modularCurve`: For the modular curve and `n = 1` the two loci partition `X_{Γ₀(p)}(ε)` into the canonical component (degree 1 over `X(ε)`) and the anticanonical component (degree p over `X(ε)`).
- `TauCeti.HodgeTate.anticanonicalLocus_not_complement`: For Hilbert data with several primes above p, 'D different from C' is not `'D ∩ C = 0'`: the anticanonical condition must be imposed at every prime above p.
- For the modular curve and `n = 1`, `X_{Γ₀(p)}(ε) = X_{Γ₀(p)}(ε)_c ⊔ X_{Γ₀(p)}(ε)_a` for every `ε < 1/2` in the range of 3.4 (two subgroups of order p either coincide or meet trivially).

[BHW](https://arxiv.org/abs/1902.03985), §5.2 (arXiv:1902.03985v4), PDF p. 21: BHW: the anticanonical locus parametrises subgroups meeting the canonical subgroup trivially. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.2, Theorem 3.2.15(iii), pp. 39–40 (arXiv v2): Scholze's anticanonical locus at level `Γ₀(p)`.

*Needs:* [3.4](#section-3-4); [3.10](#section-3-10); [3.1](#section-3-1); `HilbertModularVarietiesAndShimuraCurves` H4; `PELModuli` M1 (level structure); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

Applications include Scholze 2015, Theorem 3.2.15: anticanonical open immersions (PerfectoidShimuraVarieties S1); BHW 2019, §5.2, Theorem 5.11: the anticanonical tower is perfectoid; OverconvergentAutomorphicForms O2: domains of overconvergent Hilbert forms.

<a id="section-4-2"></a>

### 4.2 The canonical locus is a section of the Γ₀(p^n)-cover

Prove `TauCeti.HodgeTate.canonicalLocus_isomorphism`. In the situation of 4.1, `A ↦ (A, C_n)` defines an isomorphism `X(ε) ≅ X_{Γ₀(p^n)}(ε)_c` of adic spaces, inverse to the forgetful map; it is compatible with the forgetful maps in n, with prime-to-p Hecke correspondences and with base change.

`ε` within the radius of existence of the strong canonical subgroup of level n.

The formal-model version uses the normalization of 3.11 over one common admissible base model; the adic finite-étale section argument alone does not establish it.

`C_n` is totally isotropic and (for Hilbert data) 𝒪_F-stable of the right type (3.7), so `A ↦ (A, C_n)` is a section of the finite étale map `X_{Γ₀(p^n)}(ε) → X(ε)` landing in the canonical locus.

A section of a finite étale map is an open and closed immersion; its image is `X_{Γ₀(p^n)}(ε)_c` by uniqueness of `C_n`.

**Checks.**

- For the modular curve, `X_{Γ₀(p)}(ε)_c → X(ε)` has degree 1.

[SCH15](https://arxiv.org/abs/1306.2070), §3.2.2, Theorem 3.2.15(ii), p. 39 (arXiv v2): The canonical subgroup gives maps to Γ₀(p^m)-level.

*Needs:* [4.1](#section-4-1); [3.7](#section-3-7); [3.6](#section-3-6); [3.11](#section-3-11).

<a id="section-4-3"></a>

### 4.3 Atkin–Lehner identifies the anticanonical locus with a smaller Hasse neighbourhood

Prove `TauCeti.HodgeTate.atkinLehner_anticanonical`. For `n ≥ 1`, `ε ≥ 0` and ambient radius `δ = p^nε < 1/2` in the Siegel case (in the Hilbert case require the corresponding canonical-subgroup range at each quotient step), the map `AL_n`: `X_{Γ₀(p^n)}(p^nε)_a → X(ε)`, `(A, D) ↦ A/D`, is an isomorphism; its inverse sends `B ∈ X(ε)` to `(B/C_n(B), B[p^n]/C_n(B))` up to the identification `(B/C_n)/(B[p^n]/C_n) ≅ B`. Equivalently `X(p^{−n}ε) ≅ X_{Γ₀(p^n)}(ε)_a` by `A ↦ (A/C_n, A[p^n]/C_n)`. Under these isomorphisms the anticanonical tower `… → X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a` corresponds to the Frobenius tower `… → X(p^{−n−1}ε) → X(p^{−n}ε)` given by division by the canonical subgroup of level 1, which reduces to the relative Frobenius modulo `p^{1−δ}`, `δ = ((p+1)/p)ε`. The radius changes by the factor `p^n`: dividing by `C_n` multiplies the Hasse valuation by `p^n`, dividing by an anticanonical subgroup divides it by `p^n (3.8)`.

The Hilbert statement uses the total Hasse invariant; the Siegel statement is Scholze's Theorem 3.2.15(ii)–(iii) (whose open immersions are PerfectoidShimuraVarieties S1's); this construction is the radius bookkeeping both use.

BHW use the radius change `p^nε ↔ ε` for `AL_n` without separate proof; it is the inverse of 3.8 (1) iterated.

In the equivalent formulation use ambient `δ`: `AL_n`: `X_{Γ₀(p^n)}(δ)_a ≅ X(p^{−n}δ)`. A bound only on `ε`, with no control of `p^nε`, is insufficient.

`A ↦ (A/C_n, A[p^n]/C_n)` is well defined on `X(p^{−n}ε)` by 3.8 (1): `A/C_n` has radius `ε`; `A[p^n]/C_n` meets the canonical subgroup of `A/C_n` trivially (3.8 (3)).

The inverse is `(A′, D) ↦ A′/D`; composition is the identity since `(A/C_n)/(A[p^n]/C_n) = A/A[p^n] ≅ A`.

Frobenius tower: 3.8 (1) at level 1 and the congruence C₁ ≡ ker F.

**Checks.**

- For the modular curve and `pε < 1/2`, AL₁: `X_{Γ₀(p)}(pε)_a ≅ X(ε)` is the restricted Atkin–Lehner map.

[BHW](https://arxiv.org/abs/1902.03985), §5.2, proof of Theorem 5.11 (arXiv:1902.03985v4), PDF p. 22: BHW: Atkin–Lehner isomorphisms identify the anticanonical tower with the Frobenius tower. [SCH15](https://arxiv.org/abs/1306.2070), §3.2.2, after the proof of Theorem 3.2.15, p. 41 (arXiv v2): Scholze's description of the anticanonical locus as the image of `X(p^{-m}ε)`.

*Needs:* [4.1](#section-4-1); [3.8](#section-3-8); [3.7](#section-3-7).

<a id="section-4-4"></a>

### 4.4 The Hodge–Tate coordinate, the fractional-linear action and the factor cz + d

Define `TauCeti.HodgeTate.hodgeTateCoordinate`. Let `𝒪_p = 𝒪_F ⊗ ℤ_p` and `Fl = Res_{F/ℚ}ℙ¹`. Fix BHW’s kernel-line convention: `π_HT(A,α)` is the kernel of the quotient `𝒪_p² ⊗ C → ω_A`. On the chart where `HT(α(e₁))` generates, this kernel has coordinates (z:1), with `z = −HT(α(e₂))/HT(α(e₁))`. Convert the tower’s right action explicitly to the left fractional-linear action `z(γx) = (az+b)/(cz+d)`, and set `j(γ,x) = cz+d`. On chart intersections where denominators are invertible, `j(γδ,x) = j(γ,δx)j(δ,x)`. The associated quotient-line action is `det(γ)^{−1}γ`; its pullback uses `γ^∨ = det(γ)γ^{−1}`. Thus the section given by the class of e₁ transforms by cz+d (BHW Lemma 3.19). Unit and analytic structure-group assertions on anticanonical domains require the period estimates of 4.6; they are not true at every point of the affine chart. After splitting F these formulas hold componentwise and descend on the generic fibre. Integral descent uses the chosen O⁺-lattice, not an identification of the ramified order with its normalisation.

The coordinate formula is asserted on chart intersections with invertible denominator.

For `Γ₀(p)` on the anticanonical domain the unit estimate uses Layer 4’s period position. Membership in the actual AIP group `B_m` is 5.11, using the ratio of two lifts in the same torsor; it is not deduced from an ambient radius inclusion.

Represent the quotient by the functional (HT(e₁),HT(e₂)); its kernel generator on this chart is `(−HT(e₂)/HT(e₁),1)`.

Multiply the two matrices to prove the fractional-linear cocycle where the denominator is a unit. On a field-valued point this is Mathlib's action of GL (Fin 2) K on the projective line OnePoint K (`OnePoint.instGLAction`, computed by `OnePoint.smul_some_eq_ite`), restricted to the chart where `cz + d ≠ 0`. The derivative is `det(γ)/(cz+d)²`, not j.

Compute the pullback action of `γ^∨` on the class of e₁ modulo the kernel line: `γ^∨e₁ = (d,−c) ≡ (cz+d)e₁`, as in BHW Lemma 3.19.

Split the generic coefficient algebra to check the formulas, then descend; integral unit bounds require the period-domain estimates and require the additional period-domain interface.

The interface consists of the following named results.

- `TauCeti.HodgeTate.hodgeTateCoordinate`: On the kernel-line chart (z:1), `z = −HT(α(e₂))/HT(α(e₁))`; `HT(α(e₁))` is the quotient-line generator.
- `TauCeti.HodgeTate.fractionalLinear_action`: For the specified left action, `z(γx) = (az+b)/(cz+d)` on the domain where cz+d is invertible.
- `TauCeti.HodgeTate.automorphyFactor`: `j(γ, x) := cz(x) + d`.
- `TauCeti.HodgeTate.automorphyFactor_cocycle`: `j(γδ,x) = j(γ,δx)j(δ,x)` on common affine-chart domains with invertible denominators.
- `TauCeti.HodgeTate.automorphyFactor_unit`: For `γ ∈ Γ₀(p)`, `j(γ,x)` is an `O⁺-unit` on the anticanonical period domains satisfying 4.6; this uses that the coordinates are within radius `< 1` of `𝒪_p`.
- `TauCeti.HodgeTate.hodgeTateCoordinate_descent`: After splitting F, `z = (z_σ)_σ` and the generic formulas descend over `F ⊗ ℚ_p`. Integral descent requires the specified O⁺-lattice, not the false ramified product identification.

**Checks.**

- `TauCeti.HodgeTate.automorphyFactor_identity`: `j(1, x) = 1`.
- `TauCeti.HodgeTate.fractionalLinear_upperTriangular`: For `γ = (a b; 0 d)`, `z(γx) = (a z(x) + b)/d`.
- `TauCeti.HodgeTate.automorphyFactor_cocycle_test`: For `γ = (1 0; c 1)`, `δ = (1 0; c′ 1)`: `j(γδ, x) = (c + c′)z + 1 = j(γ, δx)·j(δ, x)`.
- `TauCeti.HodgeTate.automorphyFactor_not_rightAction`: With the right action `x·γ` the factor is cz + d for `γ^{-1}`, not for `γ`: the cocycle law fails for the naive formula `j(γ, x) = cz + d` with `z(xγ) = (az + b)/(cz + d)`.
- For `F = ℚ` and `γ = (1 0; c 1)`, `z(γx) = z/(cz + 1)`.

[BHW](https://arxiv.org/abs/1902.03985), §2, Definition 2.3 (arXiv:1902.03985v4), PDF p. 8: BHW: the parameter z on `ℙ¹`. [BHW](https://arxiv.org/abs/1902.03985), §3.3, Lemma 3.19 (arXiv:1902.03985v4), PDF p. 13: BHW Lemma 3.19: the factor cz + d.

*Needs:* [2.7](#section-2-7); `ShimuraData` Layer 3 (compact dual); `Module.Grassmannian`; `HilbertModularVarietiesAndShimuraCurves` H4; [2.12](#section-2-12); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

Applications include BHW 2019, §§3, 5, 7: overconvergent weights `κ(cz + d)` define the automorphy factor; OverconvergentAutomorphicForms O2 (hilbert automorphy factor): the Hilbert automorphy factor and cocycle law; [5.12](#section-5-12): s equivariant for cz + d.

<a id="section-4-5"></a>

### 4.5 Balls around the integral points of the Hilbert flag variety

Define `TauCeti.HodgeTate.flagBall`. For L a complete extension of `ℚ_p`, r ∈ (0, 1] ∩ |L^×| and `x ∈ Res_{𝒪_F/ℤ}𝔾_a(𝒪_p)`, the ball `B_r(x) := x + t·Res_{𝒪_F/ℤ}𝔾̂_a` with `|t| = r` is an open affinoid subspace of `Res_{𝒪_F/ℤ}ℙ¹` over L; `B_0(𝒪_p : 1) := 𝒪_p ⊂ ℙ¹(𝒪_p)` via a `↦ (a : 1)`, and `B_r(𝒪_p : 1)` is the union of the balls of radius r around the points of `𝒪_p`; analogously `B_r(𝒪_p^× : 1)` and `B_r(1 : p𝒪_p)` (around the points (1 : pb)). On C-points, `B_r(𝒪_p : 1)(C) = 𝒪_p + t·(𝒪_p ⊗ O_C)^∼` inside `𝒪_p ⊗ C`, where `(𝒪_p ⊗ O_C)^∼` denotes the integral closure (BHW's convention), so the definition is meaningful for p ramified in F.

The integral structure `Res 𝔾̂_a(C) = (𝒪_p ⊗ O_C)^∼` is the integral closure of `𝒪_F ⊗ O_C` in `F ⊗ C = C^Σ`; for p unramified this is `𝒪_p ⊗ O_C` itself.

Define the balls as images of the closed unit polydisc under affine maps over L, glued for the finitely many cosets of `t𝒪_p` in 𝒪_p (Res 𝔾̂_a is a product of discs after splitting).

For `r < 1`, `Γ₀(p)` preserves these two neighbourhoods using the two affine charts and unit denominators. Do not assert that all `GL₂(𝒪_p)` permutes affine balls, or that `Γ₀(p)` preserves the second ball for `r = 1`.

The interface consists of the following named results.

- `TauCeti.HodgeTate.flagBall`: `B_r(x) = x + t·Res 𝔾̂_a`, `|t| = r`.
- `TauCeti.HodgeTate.integralBall`: `B_r(𝒪_p : 1)`, `B_r(𝒪_p^× : 1)`, `B_r(1 : p𝒪_p)` as unions of balls.
- `TauCeti.HodgeTate.integralBall_points`: `B_r(𝒪_p : 1)(C) = 𝒪_p + t(𝒪_p ⊗ O_C)^∼`.
- `TauCeti.HodgeTate.integralBall_mono`: `B_r ⊂ B_{r′}` for `r ≤ r′`.
- `TauCeti.HodgeTate.integralBall_gamma0`: For `0 ≤ r < 1`, `Γ₀(p)` preserves `B_r(𝒪_p:1)` and `B_r(1:p𝒪_p)`. The `r = 1` assertion for the second chart is excluded.

**Checks.**

- `TauCeti.HodgeTate.integralBall_one`: `B_1(ℤ_p : 1)` is the closed unit disc `{|z| ≤ 1}` for `F = ℚ`.
- `TauCeti.HodgeTate.integralBall_disjoint`: For `F = ℚ` and `r < 1`, `B_r(ℤ_p : 1)` and `B_r(1 : pℤ_p)` are disjoint.
- `TauCeti.HodgeTate.integralBall_ramified`: For p ramified in F, `𝒪_p ⊗ O_C` is not the integral closure: `B_r` must be defined with the integral closure, or the ball misses points of `𝒪_p ⊗ C` of norm `≤ r`.
- For `F = ℚ`, B_r(ℤ_p : 1) = {z : |z − a| ≤ r for some a `∈ ℤ_p`}.

[BHW](https://arxiv.org/abs/1902.03985), §5.3, Definition 5.17, PDF p. 24 (arXiv:1902.03985v4): The balls `B_r(𝒪_p^× : 1)` and `B_r(1 : p𝒪_p)`.

*Needs:* [4.4](#section-4-4); AdicSpacesPartIII R2 (generic fibre functor d); `TauCeti.Huber.Pair`.

Applications include BHW 2019, Proposition 5.18: images of the canonical and anticanonical loci under `π_HT`; OverconvergentAutomorphicForms O2: evaluation of locally analytic weights on cz + d.

<a id="section-4-6"></a>

### 4.6 Hodge–Tate images of the canonical and anticanonical loci (BHW Proposition 5.18)

Prove `TauCeti.HodgeTate.periodMap_inclusions`. Let `1 > r > 0`, `m ≥ 1` with `p^{−m} ≤ r`, and `0 ≤ ε < 1/(c_p p^m)` with `c_p = 2` for `p ≥ 5` and `c_p = 3` for `p = 3`, or `0 ≤ ε ≤ 1/(4p^m)` for `p = 2`. Then `π_HT(X_{Γ(p^∞)}(ε)_c) ⊂ B_r(1 : p𝒪_p)` and `π_HT(X_{Γ(p^∞)}(ε)_a) ⊂ B_r(𝒪_p : 1)`. More precisely, with `n = m + 1` and `x = n − p^nε/(p−1)`, every point of the anticanonical locus has `π_HT ∈ B_{|p^x|}(𝒪_p : 1)`. The same `ε` serves all primes above p. The inequalities are exactly what is needed to evaluate a locally analytic weight on cz + d.

The open-locus value inclusions use Layer 2’s map. Boundary charts use the relative full one-motive flag and estimates supplied by Layer 0 and `ShimuraCompactifications` C4; whenever S3’s compactified map has been constructed, these yield the identical value inclusions for its extension. A global S3 map is not a prerequisite for the open estimate or local boundary calculation.

For `p ≥ 3` the bound is strict: with `n = m + 1` it is the range of FAR11 Théorème 6 and AIP15 Proposition 3.2.1 at level n. BHW print the inclusive bound (Propositions 5.18–5.19), whose endpoint is not covered by those strict-range theorems. For `p = 2` the inclusive bound `1/(4·2^m) = 2^{−(n+1)}` is HALO's all-prime range (3.10).

For boundary points require the compatible full dual one-motive estimates. The finite-height Raynaud Tate group by itself does not give a rank-2g coordinate frame.

Use the supplied level-n canonical subgroup and character estimates with `n=m+1`; apply 4.8 to obtain precision `x=n−p^nw/(p−1)`.

For the anticanonical full-level frame the canonical generic module has a unit second coordinate in every local factor; for the canonical frame it has a unit first coordinate. Its unsplit `O_F/p^n` generator is 3.12.

Apply the projection argument of 4.7: scalar `O_C` congruences give each generic embedding coordinate within `p^x` of the integral center, using the integral closure for the ball.

The inequalities give `p^nε/(p−1)≤p/(c_p(p−1))<1`, hence `x>m` and `|p^x|≤p^{−m}≤r`. Use the appropriate one-motive estimate at the boundary.

**Checks.**

- For `F = ℚ`, `p ≥ 5`, `m = 1`, `r = 1/p` and `ε = 1/(4p)`: `n = 2` and `x = 2 − p/(4(p − 1)) ≥ 27/16 > 1`, so `π_HT` of the anticanonical locus lies in the union of discs of radius 1/p around `ℤ_p`. The endpoint `ε = 1/(2p)` is excluded for `p ≥ 3`; for `p = 2` the endpoint `ε = 1/8` at `m = 1` is allowed.

[BHW](https://arxiv.org/abs/1902.03985), §5.3, Proposition 5.18, PDF p. 24 (arXiv:1902.03985v4): The statement and its hypotheses. [BHW](https://arxiv.org/abs/1902.03985), §5.3, Proposition 5.18, PDF p. 24: The constants `c_p`.

*Needs:* [2.7](#section-2-7); [4.5](#section-4-5); [4.1](#section-4-1); [3.9](#section-3-9); [3.10](#section-3-10); [0.7](#section-0-7); [4.8](#section-4-8); [4.7](#section-4-7); [3.12](#section-3-12); [2.12](#section-2-12); [0.17](#section-0-17).

<a id="section-4-7"></a>

### 4.7 The period estimates at primes ramified in F

Prove `TauCeti.HodgeTate.ramifiedPeriod_comparison`. Let `G/O_C` (or the supplied full dual one-motive realization at a boundary chart) have a canonical level-n subgroup and the scalar `O_C` kernel congruence of 4.8 at precision `x=n−p^nw/(p−1)>0`. The canonical generic module is free of rank one over `O_F/p^n (3.12)`. In an anticanonical frame write this generator as (c,1). Projection along every `σ:O_p⊗O_C→O_C` then puts the generic Hodge–Tate kernel coordinate in `σ(c)+p^xO_C`; equivalently the flag point lies in `B_{|p^x|}(O_p:1)` defined with the integral closure. The first-coordinate version gives the canonical ball around `(1:pO_p)`. This projection lemma applies at ramified primes without an integral product decomposition. 4.6 applies it with `n=m+1` and its separate radius hypotheses.

The integral kernel congruence is over `O_C`; the canonical generator is over the unsplit finite order `O_F/p^n`. Neither uses freeness of V over `O_p⊗O_C`.

The projection uses the canonical generator of 3.12 and the congruence of 4.8; the numerical radius alone is insufficient.

Use 4.8 and the canonical generator of 3.12. For an anticanonical frame its second coordinate is a unit in every local Artinian factor, so write the center as (c,1).

Lift the congruence to `(c,1)=v+p^x(e,f)`. Under each generic embedding `σ`, v has second coordinate `1−p^xσ(f)`, a unit since `x>0`; thus `z_σ∈σ(c)+p^xO_C`.

The tuples of errors lie in the integral closure `(O_p⊗O_C)^~⊂C^Σ`. This proves membership in the defined ball without asserting `O_p⊗O_C=O_C^Σ`. Use the first-coordinate version for the canonical chart.

**Checks.**

- For `F = ℚ(√p)` and `p ≥ 5` the statement gives the same radius as for p split.

[BHW](https://arxiv.org/abs/1902.03985), §5.3, proof of Proposition 5.18 (arXiv:1902.03985v4), PDF p. 24: BHW's proof uses the identification `ℙ¹(𝒪_p ⊗ O_C) ≅ ℙ¹(O_C)^Σ`, which fails for ramified p; the statement replaces that step.

*Needs:* [4.5](#section-4-5); [4.4](#section-4-4); [3.10](#section-3-10); `HilbertModularVarietiesAndShimuraCurves` H4; [4.8](#section-4-8); [3.12](#section-3-12); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-4-8"></a>

### 4.8 Congruence of the integral Hodge–Tate kernel

Prove `TauCeti.HodgeTate.canonicalKernel_congruence`. Let `G/O_C` be a p-divisible group with free Tate module, conormal rank g and height 2g, let `H_n` be canonical with the conormal and raw character estimates at height w, and set `δ=S_nw`, `y=n−δ`, `x=y−w/(p−1)=n−p^nw/(p−1)>0`. With `V=ker(T_pG⊗O_C→ω_GD)`, the images of V and `H_n(C)⊗O_C` in `(T_pG⊗O_C)/p^x` coincide. This is an `O_C`-module congruence, with no claim of local freeness over the ramified order `O_p⊗O_C`.

Require the canonical conormal isomorphism, truncated kernel containment, finite-presentation/elementary-divisor degree calculation and the actual rank-g generic canonical module.

On boundary charts use the full dual one-motive Tate realization and its conormal estimate, rather than silently replacing height 2g by the finite Raynaud height `2g−r`.

Let N be the kernel of the HT map modulo `p^y`. The raw cokernel degree `w/(p−1)` gives deg N=gy+w/(p−1).

The reduced saturated V and canonical point span are free rank-g submodules inside N, each of degree gy. For a torsion-module quotient of total degree `w/(p−1)`, the valuation elementary-divisor bound implies multiplication by any scalar of that valuation sends N into either submodule.

Both reductions therefore coincide after passage to precision `x=y−w/(p−1)`. This elementary-divisor argument is the degree of 0.24, not a ramified product decomposition.

**Checks.**

- At `w=0`, `x=y=n` and the two modules agree modulo `p^n`; at `w>0` the loss `w/(p−1)` cannot be omitted.

[BHW](https://arxiv.org/abs/1902.03985), §5.3, proof of Proposition 5.18, PDF pp. 24–25: The two rank-g submodules in the truncated kernel agree after losing the raw HT cokernel valuation.

*Needs:* [3.9](#section-3-9); [3.7](#section-3-7); [0.7](#section-0-7); [0.24](#section-0-24).

### Examples

For a translation matrix, z becomes z+b and `j=1`; for the Weyl matrix, z becomes `−1/z` and `j=z` on `z≠0`. These fix the action and its denominator. Integral balls at a ramified prime are measured in the integral closure, while the generic embeddings give only rational coordinates. The detailed computations and negative controls are included with the definitions above.

### Dependencies

Layer 0; Layer 2; Layer 3; `HilbertModularVarietiesAndShimuraCurves` H4; `PELModuli` M1; `ShimuraData` Layer 3; AdicSpacesPartIII R2. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 5: Igusa trivializations and the modified integral lattice

Layer 5 constructs the Igusa torsors of the dual canonical subgroup and compares them with the full p-level tower. It builds the modified integral lattice `ω^int` with its local freeness and level independence, the modified Hodge bundles `ω^mod` and `ω^{mod,+}` (with Pilloni's étale sheaf `ω^{mod,+}`) and the modified minimal model, and the Andreatta–Iovita–Pilloni torsor with the Hodge–Tate lift and automorphy factor. Its last target is the torsor-level comparison of the anticanonical tower with the AIP torsor, BHW Lemma 7.12 and diagram (7.2); the sheaf-level comparison of BHW Theorem 7.14 is OverconvergentAutomorphicForms O5's, built on it.

<a id="section-5-1"></a>

### 5.1 Igusa torsors of the dual canonical subgroup and the ordinary inverse tower

Construct `TauCeti.HodgeTate.igusaTorsor`. Let F be totally real of degree g (F = ℚ for the modular curve), `m ≥ 1` and `0 ≤ ε ≤ ε_m^can := p^{−(m+1)}`, so that the universal semi-abelian A over `X(ε)` has a canonical subgroup `H_m ⊂ A[p^m]`, étale-locally `𝒪_F/p^m` on geometric generic points (3.10). Its Cartier dual `H_m^∨ = A^∨[p^m]/H_m^⊥` is étale on the generic fibre. The Igusa torsor `X_{Ig(p^m)}(ε) → X(ε)` is the finite étale (𝒪_F/p^m)^×-torsor representing 𝒪_F-linear isomorphisms `𝒪_F/p^m ≅ H_m^∨`; these form a tower in m with transition maps reduction modulo `p^m`, and over the ordinary locus `ε = 0` the limit `X_{Ig(p^∞)}(0) = lim_m X_{Ig(p^m)}(0)` is a pro-étale 𝒪_p^×-torsor parametrising 𝒪_p ≅ T_pH^∨ (H the multiplicative p-divisible subgroup), with a finite étale formal model at each finite level (the ordinary inverse tower). A partial Igusa trivialisation (of `H_m^∨` only) is not a trivialisation of the whole Tate module.

ε≤p^{−(m+1)} (ε ≤ p^{−3} when `m = 1` and p ramifies in F), on the normal admissible Hilbert formal model (`ShimuraCompactifications` C6 (hilbert near ordinary model), normalized as in 3.11), with the dual O_F/p^m-type of 3.12.

At the boundary use the polarized one-motive finite-flat pieces and the toric canonical subgroup. Only over the ordinary formal locus is its dual étale integrally; away from that locus the torsor is asserted on the characteristic-zero generic fibre.

Use the rank-one dual canonical module of 3.12, including the polarization ideal. Its O_F-linear Isom sheaf from the chosen standard module is representable and a finite étale unit-group torsor on the generic fibre.

Reduction gives the transition maps on a common smaller Hasse neighborhood. Over the ordinary formal locus the canonical subgroup is multiplicative, so its dual is étale over the formal base itself; the finite torsors there form the pro-étale ordinary inverse tower.

The interface consists of the following named results.

- `TauCeti.HodgeTate.igusaTorsor`: `X_{Ig(p^m)}(ε) → X(ε)`, the (𝒪_F/p^m)^×-torsor of 𝒪_F-linear isomorphisms `𝒪_F/p^m ≅ H_m^∨`.
- `TauCeti.HodgeTate.igusaTorsor_transition`: Reduction `mod p^m` gives `X_{Ig(p^{m+1})}(ε′) → X_{Ig(p^m)}(ε′)` for `ε′ ≤ ε_{m+1}^can`, equivariant for `(𝒪_F/p^{m+1})^× → (𝒪_F/p^m)^×`.
- `TauCeti.HodgeTate.ordinaryIgusaTower`: `X_{Ig(p^∞)}(0) = lim X_{Ig(p^m)}(0)`, a pro-étale 𝒪_p^×-torsor over X(0) with finite étale formal models.
- `TauCeti.HodgeTate.igusaTorsor_universalTrivialisation`: The tautological isomorphism ψ_univ: `𝒪_F/p^m ≅ H_m^∨` over `X_{Ig(p^m)}(ε)`.
- `TauCeti.HodgeTate.igusaTorsor_baseChange`: Compatible with base change, prime-to-p Hecke correspondences and the `𝒪_F^{×,+}`-action on polarisations.

**Checks.**

- `TauCeti.HodgeTate.igusaTorsor_degree`: `X_{Ig(p^m)}(ε) → X(ε)` is finite étale of degree #(𝒪_F/p^m)^×; for `F = ℚ`, of degree `p^{m−1}(p − 1)`.
- `TauCeti.HodgeTate.igusaTorsor_cusp`: At a cusp of the modular curve (Tate curve), `H_m = μ_{p^m}` and `H_m^∨ = ℤ/p^m`, so the torsor is trivial over the cusp neighbourhood.
- `TauCeti.HodgeTate.igusaTorsor_not_fullLevel`: `X_{Ig(p^m)}(ε)` is not `X_{Γ(p^m)}(ε)`: its fibres have #(𝒪_F/p^m)^× points, not #GL₂(𝒪_F/p^m); a partial Igusa trivialisation is not a Tate-module basis.
- For the modular curve, `X_{Ig(p)}(0) → X(0)` is the classical Igusa curve of level p over the ordinary locus, a (ℤ/p)^×-torsor.

[BHW](https://arxiv.org/abs/1902.03985), §7.1, Definition 7.1(2), PDF p. 28 (arXiv:1902.03985v4): The Hilbert Igusa torsor. [BHW](https://arxiv.org/abs/1902.03985), §3.4, PDF p. 14: The elliptic ordinary Igusa tower and the map t.

*Needs:* [3.10](#section-3-10); [3.7](#section-3-7); [3.12](#section-3-12); [0.13](#section-0-13); [0.27](#section-0-27); `AdicEtaleGeometry` A1 (pro etale site corrected); `AbelianSchemesAndArithmeticModuli` A2 (normalized poincare comparison); `AbelianSchemesAndArithmeticModuli` A2 (polarization representatives and graph).

Applications include BHW 2019, §§3.4, 7: the Igusa tower receives the map from the anticanonical perfectoid tower; OverconvergentAutomorphicForms O7: ordinary Igusa forms and the Hida comparison; AIP (Hilbert) §§3–4: the torsor 𝔉 lives over the Igusa tower.

<a id="section-5-2"></a>

### 5.2 Igusa trivialisations and the full p-level tower

Establish `TauCeti.HodgeTate.igusaFullLevel_comparison`. For `0 ≤ ε ≤ ε_m^can`, the anticanonical full-level tower with universal `α: 𝒪_p² ≅ T_pA^∨` maps to the Igusa torsor by the generator `ψ`: `𝒪_p/p^m → H_m^∨` obtained from `α(e₁)` followed by the dual canonical-subgroup quotient. Anticanonicity makes `ψ` an isomorphism of finite `𝒪_p/p^m`-modules. The resulting map of spaces `φ`: `X_{Γ(p^∞)}(ε)_a → X_{Ig(p^m)}(ε)` is not claimed to be an isomorphism and does not factor through Γ₀-level, which forgets the generator. Under the pullback-frame convention `α′ = α ∘ γ^∨`, diagonal `γ =` diag(a,d) multiplies `ψ` by `d mod p^m`. BHW Proposition 7.11 uses `φ` and Hodge–Tate functoriality to lift the Igusa generator to the AIP torsor.

Uses the corrected indexing of BHW Proposition 7.11 (m, not n, in 'the dual of the inclusion `H_m → A[p^m]'` and `'(1, 0) mod p^m'`).

At a geometric point, the image of `α(e₁)` generates the dual canonical quotient exactly on the anticanonical domain; this proves that `ψ` is an isomorphism of finite modules, hence defines the map to the Igusa cover.

For diagonal matrices compute `γ^∨e₁ = d e₁`. General `Γ₀(p)` does not act by the scalar d on a fixed generator at arbitrary level, and forgetting a generator does not preserve the map `φ`.

**Checks.**

- For the modular curve at `ε = 0`, `φ` sends `(E, α)` to the image of `α(1, 0)` in `E[p^m]/E[p^m]^0 ≅ H_m^∨`.

[BHW](https://arxiv.org/abs/1902.03985), §7.2, Proposition 7.11 (arXiv:1902.03985v4), PDF p. 30: BHW Proposition 7.11 and its proof: the map `ϕ` to the Igusa tower.

*Needs:* [5.1](#section-5-1); [4.1](#section-4-1); [4.3](#section-4-3); [3.7](#section-3-7); [2.3](#section-2-3); [2.1](#section-2-1); [0.23](#section-0-23); `HilbertModularVarietiesAndShimuraCurves` H4; `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-5-3"></a>

### 5.3 The modified integral lattice `ω^int`

Construct `TauCeti.HodgeTate.integralDifferentialLattice`. On the Igusa cover of a normal admissible Hilbert Hasse model, let `ω⁺` be the integral conormal sheaf and `Hdg_T` the invertible determinant ideal of the canonical character matrix, with `Hdg_T^{p−1}=Hdg`. Put `I_m=p^m Hdg_T^{−(p^m−1)}` and `I′_m=p^m Hdg_T^{−p^m}`. In the radius `ε≤p^{−(m+1)}` these are integral ideals, with `I_m⊂I′_m`. The truncated conormal isomorphism gives the class `u=HT(ψ(1))` in `ω⁺/I_mω⁺` of the universal dual canonical generator. Define `ω^int` to be the inverse image of its `(O_F⊗O⁺)-span`. The formal generator-matrix theorem and its integral generic-fibre transfer identify this preimage with a locally free rank-one `O_F⊗O⁺-module F` satisfying `Hdg_Tω⁺⊂F⊂ω⁺` and `HT′:(O_F⊗O⁺)/I′_m≅F/I′_mF`. This uses integer powers of the supplied invertible ideal, not an undefined real power of Hdg.

Work on a normal p-torsion-free admissible formal chart with invertible total Hasse ideal, the dual canonical generator of 3.12 and the formal-to-O⁺ matrix transfer of 3.11.

The conormal projection has kernel contained in `I_mω⁺`. Equality of that kernel with `I_mω⁺` is not assumed, since the asserted middle exactness in BHW Lemma 7.2 fails in dimensions greater than one.

At ramified primes `ω⁺` may fail the rank-one Rapoport condition; F’s rank-one property is the explicit generator theorem, not a consequence of O_F-stability or of the generic embedding decomposition.

Construct u by the Igusa generator, finite character map and truncated conormal comparison.

On a formal chart choose the O_F-linear canonical generator. Write its character images in an R-basis of `ω` as columns of M, whose determinant generates `Hdg_T`. The adjugate gives `Hdg_Tω⊂im M`; the radius implies `I_mω⊂im M`.

Consequently the inverse-image definition equals im M. The regular determinant makes `R^g→im M` an isomorphism, and the explicit O_F-linear generator identifies this image with `O_F⊗R`. AIPH Proposition 4.1 proves the reduced HT′ isomorphism.

Use 3.11 (2) on the same matrix and its inverse to obtain the analytic `O⁺` statement.

The interface consists of the following named results.

- `TauCeti.HodgeTate.igusaHodgeTateClass`: `ψ(1) ∈ ω⁺/I_mω⁺`, the Hodge–Tate image of the universal Igusa generator.
- `TauCeti.HodgeTate.integralDifferentialLattice`: `ω^int :=` preimage in `ω⁺` of the `𝒪_F ⊗ O⁺-span` of `ψ(1)`.
- `TauCeti.HodgeTate.integralDifferentialLattice_locallyFree`: `ω^int` is locally free of rank one over `𝒪_F ⊗ O⁺`.
- `TauCeti.HodgeTate.integralDifferentialLattice_bounds`: `Hdg_Tω⁺⊂ω^int⊂ω⁺`, where `Hdg_T^{p−1}=Hdg` on the normal formal Hilbert model.
- `TauCeti.HodgeTate.integralDifferentialLattice_hodgeTate`: HT′: `𝒪_F ⊗ O⁺/I′_m ≅ ω^int/I′_mω^int`, `1 ↦ ψ(1)`.
- `TauCeti.HodgeTate.integralDifferentialLattice_indep`: After pullback to a common normal formal model with compatible canonical generators, the level-m and level-m′ lattices agree; use the determinant/inclusion argument of 5.9.

**Checks.**

- `TauCeti.HodgeTate.integralDifferentialLattice_ordinary`: On the ordinary locus `(ε = 0)`, `ω^int = ω⁺`.
- `TauCeti.HodgeTate.integralDifferentialLattice_colength`: At a rank-one point of Hodge height `w (F = ℚ)`, `ω⁺/ω^int ≅ O_C/p^{w/(p−1)}`.
- `TauCeti.HodgeTate.integralDifferentialLattice_ne_plus`: At a non-ordinary point `ω^int ≠ ω⁺` (its colength is `w/(p−1) > 0`), so `ω^int` is not the natural formal-model lattice; at ramified p, `ω⁺` is not even locally free over `𝒪_F ⊗ O⁺`.
- At an ordinary point `(Hdg = O⁺)`, `ω^int = ω⁺` and HT′ is the Hodge–Tate isomorphism of the multiplicative `H_m (0.11)`.

[BHW](https://arxiv.org/abs/1902.03985), §7.1, Definition 7.3 (arXiv:1902.03985v4), PDF p. 29: BHW Definition 7.3 / Proposition 7.4: the lattice `ω^int`. [BHW](https://arxiv.org/abs/1902.03985), §7.1, PDF p. 29 (arXiv:1902.03985v4): `ω^int` as a second integral structure, better behaved at ramified p. [AIPH](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf), §4.1, Proposition 4.1 (author copy), PDF p. 15: AIP (Hilbert), Proposition 4.1.

*Needs:* [5.1](#section-5-1); [3.9](#section-3-9); [0.2](#section-0-2); [0.1](#section-0-1); [0.11](#section-0-11); [3.1](#section-3-1); `Module.Invertible`; [0.22](#section-0-22); [3.11](#section-3-11); [3.12](#section-3-12); `SheafOfModules.Submodule`; `SheafOfModules.IsLocallyFree`.

Applications include BHW 2019, §7: comparison of the perfectoid and AIP overconvergent sheaves; AIP (Hilbert) §4: the torsor 𝔉 and the sheaves `w^κ`; OverconvergentAutomorphicForms O3 (ramified modified lattice): integral coefficients at ramified primes.

<a id="section-5-4"></a>

### 5.4 Local freeness, independence of level and cokernel estimates for `ω^int`

Prove `TauCeti.HodgeTate.integralLattice_properties`. Under 5.3’s exact formal-model and transfer hypotheses, `F=ω^int` is locally free of rank one over `O_F⊗O⁺`, `Hdg_Tω⁺⊂F⊂ω⁺`, and `HT′:(O_F⊗O⁺)/I′_m≅F/I′_mF`. Every lift in `ω⁺` of the universal canonical character belongs to F and agrees with HT′(1) modulo `I′_mF`. The lattices at different levels agree on a common radius/model by 5.9. These statements are compatible with the supplied integral base change, Igusa transitions and prime-to-p isogenies. On the ordinary formal locus `F=ω⁺`.

The formal matrix proof and integral `O⁺` transfer are separate inputs. Pointwise ranks and normality alone are not a sheaf-theoretic local-freeness proof.

Use `F/I′_mF`, not `F/I′_m` without a specified module action. The common model at all levels is the normalization of 3.11 over one admissible base model.

Apply the matrix/adjugate calculation of the construction and AIPH Proposition 4.1 for local freeness, bounds and HT′.

If two lifts agree modulo `I_mω⁺`, their difference lies in `I′_mF` because `I_m=I′_mHdg_T` and `Hdg_Tω⁺⊂F`; this proves the lift assertion.

Apply the separate level-independence lemma and naturality of the character matrix for compatible base changes/prime-to-p isogenies.

At height zero `Hdg_T` is the unit ideal and the multiplicative character map identifies F with `ω⁺`.

**Checks.**

- At a rank-one point of Hodge height w for `F = ℚ` and `m = 1`: `I′₁ = p^{1 − pw/(p−1)}` and `ω^int/I′₁ ≅ O_C/p^{1−pw/(p−1)}`.

[BHW](https://arxiv.org/abs/1902.03985), §7.1, Proposition 7.4 (arXiv:1902.03985v4), PDF p. 29: BHW Proposition 7.4. [BHW](https://arxiv.org/abs/1902.03985), §7.1, Corollary 7.6, PDF p. 29 (arXiv:1902.03985v4): Lifts of `ψ(1)` lie in the AIP torsor.

*Needs:* [5.3](#section-5-3); [3.9](#section-3-9); [0.3](#section-0-3); [5.1](#section-5-1); [3.11](#section-3-11); [5.9](#section-5-9).

<a id="section-5-5"></a>

### 5.5 The modified Hodge bundle `ω^mod` at full level `p^n`

Construct `TauCeti.HodgeTate.modifiedHodgeBundle`. Let `p ≥ 3`. For the normal admissible Siegel toroidal full-level-p^n formal model, let HT denote the extended one-motive character map of 0.17. Set `b=1/(p−1)` and take `n>b`. Its image lattice is the subsheaf generated by local lifts of HT and `p^bω`; the integral annihilator estimate makes it the inverse image of the finite-level HT image. Take the successive/simultaneous admissible minor blowups and normalization of PS16 (sizes `g,g−1,…,1`); use the strict transform, the torsion-free image inside the pulled-back `ω`. It is locally free of O-rank g, with `p^bω⊂ω^mod⊂ω` and a surjective reduced map to `ω^mod/p^{n−b}ω^mod`. The construction is for `p ≥ 3`: for `p = 2`, PS16 Remark 1.10 reports the exponent 2 without a written proof, and no `p = 2` modified bundle is part of this roadmap.

Use the normal admissible p-torsion-free formal model and the extended full one-motive HT map of 0.17. The finite-Raynaud group alone has the wrong boundary height for the full-level frame.

Use PS16 Theorem `1.9 (p ≥ 3)` for the uniform annihilator bound `p^{1/(p−1)}` of the cokernel.

Raw tensor pullback of the image need not be locally free. The normalized blowups principalize the relevant minor ideals and the construction retains the image/strict transform.

Form the image lattice on the full-level model using the extended character matrix and its uniform annihilator bound.

Principalize the successive determinantal ideals on the normal admissible blowups. On a chart where a chosen maximal minor generates its ideal, the adjugate gives a free set of image columns; continue over the required ranks and glue the torsion-free images.

The containments imply `p^nω⊂p^{n−b}ω^mod`, so the finite-level map factors through the reduced modified lattice; the selected image generators prove surjectivity.

The interface consists of the following named results.

- `TauCeti.HodgeTate.modifiedModel`: `𝔛^mod → 𝔛`, the normalised blow-up of the minor ideal of the Hodge–Tate matrix.
- `TauCeti.HodgeTate.modifiedHodgeBundle`: The strict-transform/image lattice on the specified normal admissible minor modification, with `b=1/(p−1)`.
- `TauCeti.HodgeTate.modifiedHodgeBundle_locallyFree`: `ω^mod` is locally free of rank g.
- `TauCeti.HodgeTate.modifiedHodgeBundle_bounds`: `p^bω⊂ω^mod⊂ω` with `b=1/(p−1)` and level `n>b`.
- `TauCeti.HodgeTate.modifiedHodgeBundle_hodgeTate_surjective`: The reduced linearized HT map surjects onto `ω^mod/p^{n−b}ω^mod` on the specified modified formal model.
- `TauCeti.HodgeTate.modifiedModel_generic`: `𝔛^mod → 𝔛` is an isomorphism on adic generic fibres.

**Checks.**

- `TauCeti.HodgeTate.modifiedHodgeBundle_ordinary`: On the ordinary locus the image lattice is `ω` and its minor ideal is a unit, so the required modification restricts to the identity there. This does not assert that every chosen extraneous blowup is the identity.
- `TauCeti.HodgeTate.modifiedHodgeBundle_colength`: For `g = 1` at a rank-one point with a canonical subgroup and Hodge height w, `ω/ω^mod ≅ O_C/p^{w/(p−1)}`.
- `TauCeti.HodgeTate.modifiedHodgeBundle_not_locallyFree_before_blowup`: Before the blow-up, the image sheaf is not locally free in general (it is generated by 2g sections with non-invertible minor ideal).
- On the ordinary locus `ω^mod = ω`.
- For the modular curve `(g = 1)`, `ω^mod` is generated by the Hodge–Tate images of the basis of `(ℤ/p^n)²` and `p^{1/(p−1)}ω`.

[PS16](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.8, construction before Proposition 1.13 (author copy; published Proposition 1.10), PDF p. 6: Pilloni–Stroh: blow-up along the minors of sizes g, …, 1. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §12.2.1, PDF p. 74: Pilloni's restatement for Siegel threefolds.

*Needs:* [0.17](#section-0-17); [0.5](#section-0-5); [0.1](#section-0-1); AdicSpacesPartIII R2 (admissible blow up); AdicSpacesPartIII R2 (generic fibre inverts admissible blow ups); `AlgebraicGeometry.Scheme.Hom.normalization`; [3.11](#section-3-11); `SheafOfModules.Submodule`; `SheafOfModules.IsLocallyFree`; AdicSpacesPartIII R2 (hasse domain).

Applications include Pilloni–Stroh 2016, §1.8; Pilloni 2020, §12: coherent cohomology at infinite level; PerfectoidShimuraVarieties S3 (hodge tate formal models): normalised formal models with Hodge–Tate sections.

<a id="section-5-6"></a>

### 5.6 The modified minimal model and the descent of the Hodge–Tate determinant

Construct `TauCeti.HodgeTate.modifiedMinimalModel`. Let `p ≥ 3`. On the normal full-level minimal model `𝔛^*_{K(p^n)}` (the Stein factorization of the Siegel toroidal model, 5.13), descend the degree-g exterior-power Hodge–Tate map modulo `p^n` using the pushforward identity of 5.13. Normalize the blowup of its coefficient ideal to obtain `𝔛^{*−mod}`, an isomorphism on generic fibres, with an invertible determinant image `L^mod⊂detω`. Put `b=1/(p−1)`, D=gb and require `n>D`. Then `p^D detω⊂L^mod⊂detω` and the exterior-power map surjects onto `L^mod/p^{n−D}`. The compatible toroidal modification maps to `𝔛^{*−mod}` and pulls `L^mod` back to `detω^mod` on the toroidal side.

Choose `n≥n₀`, the least integer strictly greater than `g/(p−1)`.

Use the `mod-p^k` structure-sheaf pushforward identity and projection formula of 5.13 to descend the determinant sections, as in PS16 Corollary 1.7 using A.10.

Normalize the blowup of the descended coefficient ideal. Its image is an invertible modified determinant lattice. Exterior powers of the bound `p^bω⊂ω^mod` give p^{gb}detω⊂detω^mod⊂detω and the reduced surjection.

The universal properties of the chosen blowups and normalizations (3.11) give the map from the toroidal modification.

The interface consists of the following named results.

- `TauCeti.HodgeTate.minimalLevelModel`: `𝔛^*_{K(p^n)}`, the Stein factorisation of `𝔛_{K(p^n)} → 𝔛^*`.
- `TauCeti.HodgeTate.hodgeTateDeterminant_descends`: `Λ^gHT` is the pullback of a map on `𝔛^*_{K(p^n)}`.
- `TauCeti.HodgeTate.modifiedMinimalModel`: `𝔛^{*−mod}_{K(p^n)}`, the normalised blow-up of the coefficient ideal of `Λ^gHT`.
- `TauCeti.HodgeTate.modifiedDetHodge_bounds`: For `D=g/(p−1)`, `p^D detω⊂L^mod⊂detω`.
- `TauCeti.HodgeTate.modifiedDetHodge_surjective`: For `n>D` the exterior-power character map surjects onto `L^mod/p^{n−D}`.

**Checks.**

- `TauCeti.HodgeTate.modifiedMinimalModel_ordinary`: Over the ordinary locus `𝔛^{*−mod} = 𝔛^*` and `det ω^mod = det ω`.
- `TauCeti.HodgeTate.modifiedDetHodge_siegel3`: For the Siegel threefold `(g = 2)` and `p = 3`, `D = 1`, so `n ≥ 2` is required; the descended determinant line satisfies `p·detω ⊂ L^mod ⊂ detω`.
- `TauCeti.HodgeTate.modifiedMinimalModel_not_toroidal`: The minimal modified determinant line pulls back along the compatible toroidal-to-minimal modified map to `detω^mod (PIL20 §12.9.1, PDF p.80)`. This determinant descent does not imply that the full finite-level Hodge bundle descends to the minimal model.
- For the modular curve, `𝔛^*_{K(p^n)}` is the normalisation of the minimal compactification at full level `p^n`, and `det ω^mod = ω^mod`.

[PS16](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.4, Corollaire 1.7 (author copy; published Corollaire 1.4), PDF p. 5: Pilloni–Stroh Corollaire 1.7: descent of the Hodge–Tate sections. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §12.9.1, PDF p. 80: Pilloni's restatement. [PS16](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.19, PDF p.8; Remark 1.10, PDF p.5; Corollary A.10, PDF p.26: Determinant precision is `n−g/(p−1)` at odd p; the pushforward identity is 5.13.

*Needs:* [5.5](#section-5-5); [5.13](#section-5-13); [0.17](#section-0-17); [3.11](#section-3-11); `ShimuraCompactifications` C5 (integral minimal space); AdicSpacesPartIII R2 (admissible blow up); AdicSpacesPartIII R2 (hasse domain).

Applications include Pilloni 2020, §12.9: Siegel threefolds; PerfectoidShimuraVarieties S3 (hodge tate formal models): `det ω^mod` descending to an ample sheaf.

<a id="section-5-7"></a>

### 5.7 The étale sheaf `ω^{mod,+}`

Define `TauCeti.HodgeTate.modifiedPlusSheaf`. Let `p ≥ 3`. Over the analytic Siegel variety 𝒳 at spherical level, `ω_G^{mod,+}` is the sheaf of `O⁺_𝒳`-modules on `𝒳_ét` whose sections over `U → 𝒳` étale are the integral differentials at the origin of G generated by the image of the Hodge–Tate period map over the full-level cover `U ×_𝒳 𝒳(p^n)`, descended; its pullback to `𝒳(p^n)` for `n ≥ 1` is the generic-fibre incarnation of `ω^mod (5.5)`, and in particular comes from a sheaf on the Zariski site of `𝒳(p^n)`. It does not come from the analytic site of 𝒳 in general, and it satisfies `p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺`.

An integral module sheaf on the actual étale site is supplied by descent; it is not asserted to arise from the analytic site.

Apply the level independence of PS16 Lemma 1.12 for `n≥1`. The strict `n>b` condition used for equal lattice descriptions must be distinguished from the lemma’s level convention.

On a finite full-level étale cover use the `O⁺-span` of the character images with the prescribed bound. PS16 Lemma 1.12 proves level independence under its hypotheses.

Character functoriality gives descent equivariance under the full-level group; effective integral étale descent identifies the sheaf at spherical level. The full-level pullback is the integral generic-fibre image lattice.

Transport the prime-dependent containment through descent. The resulting étale sheaf need not come from the analytic topology.

The interface consists of the following named results.

- `TauCeti.HodgeTate.modifiedPlusSheaf`: `ω^{mod,+}` on `𝒳_ét`, the `O⁺-span` of Hodge–Tate images, descended from finite level.
- `TauCeti.HodgeTate.modifiedPlusSheaf_pullback`: Its pullback to `𝒳(p^n)`, `n ≥ 1`, is the generic fibre of `ω^mod`.
- `TauCeti.HodgeTate.modifiedPlusSheaf_bounds`: `p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺`.
- `TauCeti.HodgeTate.modifiedPlusSheaf_indep`: Independent of the auxiliary level n used to define it.

**Checks.**

- `TauCeti.HodgeTate.modifiedPlusSheaf_ordinary`: `ω^{mod,+} = ω⁺` over the ordinary locus.
- `TauCeti.HodgeTate.modifiedPlusSheaf_rankOne`: At a rank-one point of an elliptic curve with Hodge height `w < 1/(p+1)`, `ω⁺/ω^{mod,+} ≅ O_C/p^{w/(p−1)}`.
- `TauCeti.HodgeTate.modifiedPlusSheaf_not_analytic`: `ω^{mod,+}` is not a sheaf on the analytic site of 𝒳 in general: its sections over an affinoid need not be determined by a single analytic formal model at spherical level.
- Over the ordinary locus `ω^{mod,+} = ω⁺`.

[PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §12.7.1, PDF p. 77: Pilloni's definition. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §12.7.1, PDF p. 77: Generated by Hodge–Tate images. [PIL20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §12.7.1, Remark 12.7.1.1, PDF p. 77: The sheaf lives on the étale site of 𝒳 and not on its analytic site, while its pullback to full level `p^n (n ≥ 1)` comes from a Zariski sheaf.

*Needs:* [5.5](#section-5-5); `AdicEtaleGeometry` A1 (pro etale site corrected); `PerfectoidSpaces` P0 (almost basic setup); `SheafOfModules.Submodule`; `SheafOfModules.IsLocallyFree`.

Applications include Pilloni 2020, §12.7: integral structures for higher Hida theory; PerfectoidShimuraVarieties S3: comparison with `π_HT^*ω_Fl⁺`.

<a id="section-5-8"></a>

### 5.8 The Andreatta–Iovita–Pilloni torsor

Construct `TauCeti.HodgeTate.aipTorsor`. In the situation of 5.3, let `𝔉_m := {w ∈ ω^int : w ≡ HT′(1) mod I′_m ω^int}`. Its analytic total space `𝔉_m(ε) → X_{Ig(p^m)}(ε)` is a torsor for the analytic topology under `1 + I′_m·Res_{𝒪_F/ℤ}𝔾̂_a`, and `𝔉_m(ε) → X(ε)` is an étale torsor under `B_m := 𝒪_p^×·(1 + I′_m·Res_{𝒪_F/ℤ}𝔾̂_a) ⊂ Res_{𝒪_F/ℤ}𝔾_m`; `𝔉_m(ε) → T(ω)` (the total space of `ω^×`) is an open immersion. Over `X(ε)` and for `x := m − εp^m/(p − 1)`, `B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a)`, with equality where `|Ha| = |p|^ε`. The associated weight sheaf is constructed by OverconvergentAutomorphicForms O5 from this torsor; this construction supplies the torsor and its action.

The inclusion goes `B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a)`, not the reverse as printed in BHW (7.1); where the reverse inclusion is used, use the point's own Hodge height or `c ∈ p𝒪_p`.

The level m is tied to the weight: `m = k + r − 1` for `κ` on the k-th piece of weight space (`r = 3`, or 5 for `p = 2`); BHW's Definition 7.9 prints `m = k + r`.

`𝔉_m` is an O⁺-torsor under `1 + I′_m` by 5.4 (3); adjoin the `𝒪_p^×`-action from the Igusa torsor to get the B_m-torsor over `X(ε)`.

Open immersion into `T(ω)`: `𝔉_m` is defined by a congruence on a generator of the locally free `ω^int`.

Bound on `B_m`: `p^ε ∈ Hdg` gives `|p^mHdg^{−p^m/(p−1)}| ≤ |p^x|`.

The interface consists of the following named results.

- `TauCeti.HodgeTate.aipTorsor`: `𝔉_m(ε) := {w ∈ ω^int : w ≡ HT′(1) mod I′_m}`, a torsor under `1 + I′_m Res 𝔾̂_a` over `X_{Ig(p^m)}(ε)`.
- `TauCeti.HodgeTate.aipTorsor_structureGroup`: `𝔉_m(ε) → X(ε)` is an étale B_m-torsor, `B_m = 𝒪_p^×(1 + I′_m Res 𝔾̂_a)`.
- `TauCeti.HodgeTate.aipTorsor_openImmersion`: `𝔉_m(ε) → T(ω)` is an open immersion.
- `TauCeti.HodgeTate.aipTorsor_bound`: `B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a)` over `X(ε)`, `x = m − εp^m/(p−1)`.
- `TauCeti.HodgeTate.aipTorsor_lift`: Every lift in `ω⁺` of `ψ(1) ∈ ω⁺_{H_m}` is a section of `𝔉_m (5.4 (4))`.

**Checks.**

- `TauCeti.HodgeTate.aipTorsor_ordinary`: At `ε = 0`, `B_m = 𝒪_p^×(1 + p^m Res 𝔾̂_a)` and `𝔉_m` is the torsor of generators of `ω⁺` congruent to the Igusa generator `mod p^m`.
- `TauCeti.HodgeTate.aipSheaf_classical`: The O5 sheaf associated to this torsor and an algebraic weight `κ=x^k` agrees with `ω^{⊗k}`; this is an imported consumer compatibility test, not a second construction of the weight sheaf.
- `TauCeti.HodgeTate.aipTorsor_bound_direction`: The reverse inclusion `𝒪_p^×(1 + p^x Res 𝔾̂_a) ⊂ B_m` fails at points where `|Ha| > |p|^ε`, since there `I′_m ⊊ p^xO⁺`.
- For `F = ℚ` at `ε = 0`, `𝔉_m` is the set of generators of `ω⁺` congruent to the Hodge–Tate image of the Igusa generator modulo `p^m`.

[BHW](https://arxiv.org/abs/1902.03985), §7.1, Definition 7.5, PDF p. 29 (arXiv:1902.03985v4): The AIP torsor. [BHW](https://arxiv.org/abs/1902.03985), §7.1, Definition 7.5, PDF p. 29: The (corrected) comparison with `𝒪_p^×(1 + p^x Res 𝔾̂_a)`. [AIPH](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf), §4.2, the torsor `F_{n,r,I}` (author copy), PDF p. 16: AIP (Hilbert): the torsor 𝔉.

*Needs:* [5.3](#section-5-3); [5.4](#section-5-4); [5.1](#section-5-1); `Module.Invertible`.

Applications include Andreatta–Iovita–Pilloni (Hilbert, Siegel): overconvergent sheaves of weight `κ`; BHW 2019, Theorem 7.14: comparison with the perfectoid sheaf; OverconvergentAutomorphicForms O5 (aip independent coefficients): the independent AIP construction.

<a id="section-5-9"></a>

### 5.9 Level independence of the integral lattice

Prove `TauCeti.HodgeTate.integralDifferentialLattice_level_eq`. On a common normal p-torsion-free Hilbert formal model with compatible dual canonical generators at `m′≥m` and `ε≤p^{−(m′+1)}`, the modified lattices `F_m` and `F_m′` inside `ω` are equal. Both have determinant ideal `Hdg_T` and rank-one O_F-linear generators, and their analytic `O⁺` pullbacks are equal as well.

Require the explicit matrices, invertible regular determinant ideal `Hdg_T` and a common integral model; mere equality of generic fibres is insufficient.

Use `I_m′⊂I_m` in this radius and compatibility of the finite character classes. AIPH Proposition 4.7 is a weight-sheaf comparison, not a citation for equality of these lattices.

The compatible higher-level generator reduces to the lower-level class. Since `I_m′⊂I_m`, every higher-level image column lies in `F_m`, so `F_m′⊂F_m`.

Locally both modules are free of rank g over R with the same determinant ideal `Hdg_T` inside `det ω`. The determinant of the inclusion matrix is a unit: cancel a regular generator of `Hdg_T` in the equality of determinant ideals.

The adjugate then inverts the inclusion matrix. Hence the two submodules are equal, and 3.11 (2) transfers this explicit equality to `O⁺`.

**Checks.**

- At `w=0` both lattices equal `ω`; compatible reductions without equal regular determinant ideals do not imply equality.

[AIPH](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf), §4.1, Proposition 4.1, PDF pp. 15–16; §4.3.1, Proposition 4.7, PDF p. 18: The local generator/determinant calculation supplies the inputs; the latter result compares weight sheaves, so the lattice equality requires the stated separate argument.

*Needs:* [5.3](#section-5-3); [0.23](#section-0-23); [3.11](#section-3-11); AdicSpacesPartIII R2 (admissible blow up); AdicSpacesPartIII R2 (hasse domain).

<a id="section-5-10"></a>

### 5.10 The Hodge–Tate lift to the AIP torsor

Prove `TauCeti.HodgeTate.hodgeTate_aipLift`. For `ε≤p^{−(m+1)}`, the canonical section `s=HT(α(e₁))` on the anticanonical full-level tower factors through the AIP torsor `F_m` over its Igusa generator map `φ`. This is a factorization into the actual open subspace of the total Hodge bundle.

Require the full one-motive boundary map, the finite-module generator theorem, the matrix lift assertion and its integral analytic transfer.

Use the dual-abelian frame convention `α′=α∘γ^∨` consistently.

The dual canonical quotient of `α(e₁)` is the Igusa generator `ψ` by anticanonicity.

Finite character naturality identifies s with a lift of `HT(ψ(1))`. The difference of any two such lifts lies in `I_mω⁺⊂I′_mω^int`.

The congruence defining `F_m` therefore holds. Its generator condition is an open condition on the total space of the line bundle, so it gives the map to the open total-space subdomain.

**Checks.**

- On the ordinary modular cusp this is the dt/t generator with its Igusa congruence, not a trivialization of the whole Tate module.

[BHW](https://arxiv.org/abs/1902.03985), §7.2, Proposition 7.11, PDF p. 30: Naturality of the character map makes the canonical HT section a lift of the Igusa generator.

*Needs:* [5.2](#section-5-2); [5.8](#section-5-8); [5.4](#section-5-4); [0.23](#section-0-23); [2.13](#section-2-13).

<a id="section-5-11"></a>

### 5.11 The AIP automorphy factor

Prove `TauCeti.HodgeTate.aip_automorphyFactor`. For `γ∈Γ₀(p)` acting on the anticanonical tower with the fixed left-coordinate convention, `γ*s=(cz+d)s` and the scalar `j(γ,x)=cz(x)+d` is a section of the actual AIP structure group `B_m`. Its scalar cocycle is the period-coordinate cocycle.

Require that the `Γ₀(p)` action preserves the anticanonical domain and that `F_m→X(ε)` is the faithfully acting B_m-torsor open in the total line bundle.

In the Hilbert case use the actual O_F-linear torsor before any generic σ-projection.

The coordinate action computes `γ*s=j(γ,−)s`, as in BHW Lemma 5.31 (the elliptic version is Lemma 3.19).

Both s(x) and `s(γx)` lie in `F_m` above the same underlying abelian point by 5.10. The torsor property gives a unique ratio `b∈B_m`, functorially over a common trivializing cover.

The faithful scalar embedding in the total line bundle identifies b with j. Uniqueness glues the ratio and gives an analytic B_m-valued morphism. This repairs BHW Lemma 7.12 without using the reversed bound (7.1).

**Checks.**

- At an ordinary elliptic point the ratio is a unit in `ℤ_p^×(1+p^mO⁺)`; the larger ambient ball bound alone cannot certify membership in this smaller group.

[BHW](https://arxiv.org/abs/1902.03985), §5.4, Lemma 5.31, PDF p. 26; §7.2, Lemma 7.12, PDF pp. 30–31: The scalar transformation formula and torsor diagram; the ratio proof replaces the invalid ambient-radius inclusion.

*Needs:* [5.10](#section-5-10); [5.8](#section-5-8); [4.4](#section-4-4).

<a id="section-5-12"></a>

### 5.12 The Hodge–Tate section compares the anticanonical tower with the AIP torsor

Prove `TauCeti.HodgeTate.aipTorsorHodgeTateComparison`. Let F be the totally real field of the Hilbert datum, `m ≥ 1`, let `ε` lie in the range of 5.10 (ε ≤ p^{−(m+1)}, inside the level-m canonical range), and let `n ∈ ℤ_{≥1} ∪ {∞}`. Write `X_n := X_{Γ*(p^∞)}(p^nε)_a` for the anticanonical full-level tower at radius `p^nε (X_∞ := X_{Γ*(p^∞)}(ε)_a)`, `u_n`: `X_n → X_{Γ*(p^∞)}(ε)_a` for the morphism given by the action of the matrix diag(p^n, 1) (BHW §7.2; `u_∞ = id`), and `s̃_n := s ∘ u_n`, where `s = HT(α(e₁))` is the canonical Hodge–Tate section factored through the AIP torsor `F_m(ε) ⊂ T(ω)` by 5.10. Then: (i) `s̃_n` is a morphism over the Atkin–Lehner isomorphism `AL_n`: `X_{Γ₀*(p^n)}(p^nε)_a ≅ X(ε)` of 4.3, that is, the projection of `F_m(ε)` to `X(ε)` composed with `s̃_n` equals `AL_n` composed with the projection of `X_n` to Γ₀*(p^n)-level (for `n = ∞`, the forgetful map `X_{Γ₀*(p^∞)}(ε)_a → X(ε)`); (ii) for `γ = (a b; c d)` in the deck group `Γ₀*(p^n)` of `X_n` over its Γ₀*(p^n)-quotient (for `n = ∞`, for every `γ` in `Γ₀*(p)`), the factor `j(γ, x) := c·z(x) + d`, with z the Hodge–Tate coordinate of 4.4 on `X_n`, takes values in the AIP structure group `B_m`, and `s̃_n(x·γ) = j(γ, x)·s̃_n(x)` for the B_m-torsor action on `F_m(ε)`, the action of `γ` on `X_n` being the one of BHW's diagram (7.2) in the conventions of 4.4; (iii) consequently, for a bounded smooth weight `κ`: `U → 𝒲*` and a section f of `𝒪_{F_m(ε)×U}` with `b*f = κ⁻¹(b)·f` for all `b ∈ B_m`, the pullback `g = s̃_n* f` satisfies `γ*g = κ⁻¹(c·z + d)·g` for every `γ ∈ Γ₀*(p^n)`, and `s̃_n*` carries 𝒪⁺-valued eigenfunctions to 𝒪⁺-valued functions. The identification of the resulting coefficient sheaves (Birkbeck–Heuer–Williams, Theorem 7.14) and its Hecke equivariance are OverconvergentAutomorphicForms O5/O6 theorems built on this one.

Conventions of 4.4: dual-abelian Hilbert level structures `α: 𝒪_p² ≅ T_pA^∨`, the kernel coordinate z and the left fractional-linear action, with the conversion `α′ = α ∘ γ^∨` to the right action on the tower fixed there.

`B_m` is the actual structure group of the étale torsor `F_m(ε) → X(ε)` of 5.8. That j lands in `B_m` is the ratio argument of 5.11; the containment printed as (7.1) in BHW holds only from `B_m` into the ambient ball and is not used backwards.

The level m attached to a weight follows the indexing of 5.8 (m = k + r − 1 on the k-th piece of weight space); (iii) is stated for any `κ` whose analytic extension is admitted on `B_m`.

Finite n uses the scaled radius `p^nε` with `p^nε < 1/2`, as required by 4.3. In the Hilbert case retain the canonical-subgroup range of [3.10](#section-3-10) at each quotient step. Level zero is recovered downstream for coefficient sheaves through AL_1 (BHW Theorem 7.14, proof, p. 31); it does not assert equivariance of this anticanonical branch under `Γ₀*(1) = G*(ℤ_p)`.

For `n = ∞`: 5.10 gives the factorization s: `X_∞ → F_m(ε)`. The square over `X(ε)` commutes because the projection of s(x) is the abelian variety underlying x (BHW Lemma 7.12, right square). The left square, `s(x·γ) = j(γ, x)·s(x)` with j in `B_m`, is 5.11.

For finite `n ≥ 1`, put `ρ = u_n γ u_n⁻¹ = (a p^n b; p^{−n} c d)`. Its lower-left entry need not be divisible by p, so do not apply the `Γ₀*(p)` assertion of 5.11 to `ρ`. Instead the general quotient-line transformation of 4.4 on the two charts gives `z(u_n x) = p^n z(x)` and `j(ρ,u_n x) = (p^{−n}c)(p^n z(x)) + d = cz(x)+d`. The two transformed HT lifts lie in `F_m(ε)` by 5.10 and over the same point of `X(ε)`, since `γ` fixes the `Γ₀*(p^n)` quotient and `u_n` lies over `AL_n`. Their unique ratio in that faithfully acting torsor is therefore cz+d, which proves membership in `B_m` and equivariance. The right square is 4.3. This interprets BHW diagram (7.2) with the finite-level group `Γ₀*(p^n)` used in the proof of Theorem 7.14, rather than the `Γ₀*(p)` printed in the diagram.

(iii) is formal from (ii): for f with `b*f = κ⁻¹(b)f`, `g(x·γ) = f(j(γ, x)·s̃_n(x)) = κ⁻¹(j(γ, x))·g(x)`. Integrality is preserved because `s̃_n` is a morphism of adic spaces and pullback preserves `𝒪⁺`.

**Checks.**

- For `n = ∞` and diagonal `γ =` diag(a, `d) ∈ Γ₀*(p`), (ii) reads `s(x·γ) = d·s(x)`, matching the transformation `ψ ↦ dψ` of the Igusa generator in 5.2.
- For `κ(t) = t^k` on 𝒪_p^× (an algebraic weight), (iii) gives `γ*g = (c·z + d)^{−k}·g`, the weight-k automorphy law on the anticanonical tower.
- The statement makes no claim that the pulled-back eigenfunctions span an invertible `𝒪⁺`-module or that the induced map of coefficient sheaves is an isomorphism; both are O5's.
- The level restriction is necessary: at an ordinary point with `z = 0`, the Weyl matrix `(0 −1; 1 0)` belongs to `G*(ℤ_p) = Γ₀*(1)` and sends the kernel line to `∞`, outside the chosen anticanonical chart. It cannot be treated as a deck transformation preserving this branch.

[BHW](https://arxiv.org/abs/1902.03985), §7.2, Proposition 7.11 and Lemma 7.12, PDF pp. 30–31 (arXiv:1902.03985v4): The Hodge–Tate section factors through the AIP torsor, and it intertwines the `Γ₀*(p)`-action on the anticanonical tower with the `B_m`-action through the factor cz + d, over the forgetful map to `X(ε)`. [BHW](https://arxiv.org/abs/1902.03985), §7.2, diagram (7.2) and the first step of the proof of Theorem 7.14, PDF p. 31: For finite n the twisted section `s ∘ u_n` lies over the Atkin–Lehner isomorphism and gives the equivariance used to pull back κ-eigenfunctions; Theorem 7.14 itself concludes the sheaf identification, which is not stated here. [BHW](https://arxiv.org/abs/1902.03985), §7.1, Definition 7.5, PDF p. 29: The AIP torsor `F_m(ε)` and its étale B_m-torsor structure over `X(ε)`, with `F_m(ε)` open in the total space of `ω`.

*Needs:* [5.10](#section-5-10); [5.11](#section-5-11); [5.8](#section-5-8); [5.2](#section-5-2); [4.3](#section-4-3); [4.4](#section-4-4); [4.1](#section-4-1); [2.2](#section-2-2); [2.3](#section-2-3); [3.10](#section-3-10).

<a id="section-5-13"></a>

### 5.13 The structure sheaf of the full-level minimal model modulo `p^k`

Prove `TauCeti.HodgeTate.minimalLevelModel_pushforward`. Let `p ≥ 3`, `n ≥ 1`, `X(p^n)^tor` the normal full-level-p^n toroidal Siegel model of 0.17 over the ring of integers of a finite extension of `ℚ_p(ζ_{p^n})` (or its p-adic completion), `X(p^n)^*` the Stein factorization of `X(p^n)^tor → X^*`, the minimal compactification at spherical level, and f: `X(p^n)^tor → X(p^n)^*` the contraction. Then (1) `f_*O_{X(p^n)^tor} = O_{X(p^n)^*}`; (2) for every `k ≥ 1` the natural map `f_*(O)/p^k → f_*(O/p^k)` is an isomorphism; (3) for a locally free `O_{X(p^n)^*}-module L` and every k, the projection formula gives `H⁰(X(p^n)^tor, f*L/p^k) = H⁰(X(p^n)^*, L/p^k)`. In particular a section of `det ω/p^n` on `X(p^n)^tor` that is the pullback of the descended Hodge line on `X(p^n)^*` descends to `X(p^n)^*`.

`p ≥ 3` and Siegel data with neat prime-to-p level, the toroidal and minimal compactifications and the normalized higher-level toroidal models of `ShimuraCompactifications` C5; the full-level minimal model is defined as the Stein factorization and is normal.

(1) is the definition of the Stein factorization.

(2) By dévissage along `0 → O/p^{k−1} →^{p} O/p^k → O/p → 0` it suffices to treat `k = 1`; test the map on completed local rings at points x of the special fibre of `X(p^n)^*`. Along the boundary stratum of x, the formal completion of `X(p^n)^tor` is described through the degeneration data and the toroidal embeddings of the stratum (`ShimuraCompactifications` C4 and C3), so that the completed local ring of `f_*(O)/p` and the completion of `f_*(O/p)` are both the product, over the same cone of exponents `λ`, of the λ-th Fourier–Jacobi coefficient modules `H⁰` over the abelian part of the stratum, compatibly with reduction modulo p (theorem on formal functions).

(3) The projection formula for the locally free L: `f_*(f*L ⊗ O/p^k) = L ⊗ f_*(O/p^k) = L/p^k` by (2) and (1).

**Checks.**

- For the modular curve, the toroidal and minimal compactifications at full level `p^n` coincide, f is the identity and (2) is trivial.
- For `g = 2` at a point of a boundary stratum whose abelian part is an elliptic curve, both sides of (2) are products over the same cone of exponents of the Fourier–Jacobi coefficient modules of that elliptic curve, reduced modulo `p^k`: the comparison is coefficientwise, and the sections of `det ω/p^n` descend coefficient by coefficient.
- On the open part, where f is an isomorphism, (2) is the identity.

[PS16](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), Appendice A, Théorème A.4 (1) and Lemme A.9, PDF pp. 24–26: the formal completion of the full-level toroidal compactification along a boundary stratum and the completed local rings of the minimal model as products of Fourier–Jacobi coefficients. [PS16](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), Corollaire A.10, PDF p. 26: `f_*(O)/p^k = f_*(O/p^k)`, proved by dévissage to `k = 1` and comparison of completions. [PS16](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.4, Corollaire 1.7, PDF p. 5: the exterior Hodge–Tate sections descend to the minimal model by the projection formula and Corollaire A.10.

*Needs:* [0.17](#section-0-17); `ShimuraCompactifications` C5 (integral toroidal space); `ShimuraCompactifications` C5 (integral minimal space); `ShimuraCompactifications` C5 (higher level toroidal normalization); `ShimuraCompactifications` C4 (polarized degeneration data); `ShimuraCompactifications` C3 (refinement map).

Applications include 5.6 (descent of the exterior-power Hodge–Tate map to the minimal model).

### Examples

At `ε=0` the AIP exponent is m. At `p=3`, `m=1`, `ε=1/9` it is 5/6. Two actual lifts over the same base point give `j=cz+d` in the structure group. Equal determinant ideals upgrade inclusion of two integral lattices to equality. The detailed computations and negative controls are included with the definitions above.

### Dependencies

Layer 0; Layer 2; Layer 3; Layer 4; `AdicEtaleGeometry` A1; `AbelianSchemesAndArithmeticModuli` A2; `HilbertModularVarietiesAndShimuraCurves` H4; AdicSpacesPartIII R2; `ShimuraCompactifications` C5; `PerfectoidSpaces` P0; `ShimuraCompactifications` C4; `ShimuraCompactifications` C3. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 6: Logarithmic adic sites before period sheaves

Layer 6 builds logarithmic adic geometry without any period comparison: logification and log structures on étale sites, monoid-algebra spaces and integral charts, normal-crossings log structures, saturated fibre products, log smoothness and continuous log differentials. It continues with Kummer étale maps, root covers, the Kummer étale site with higher direct images, finite Kummer descent and extension across a boundary, and finally the pro-Kummer étale site, log affinoid perfectoid objects, completed structure sheaves, almost acyclicity and Kummer local systems with their unipotent boundary monodromy.

<a id="section-6-0"></a>

### 6.0 Log structures, logification and integral charts

Construct `TauCeti.LogAdic.LogStructure` on an étale-sheafy adic space X: a sheaf of commutative monoids M on `X_ét` with a morphism `α:M→O_{X_ét}` whose unit fibre maps isomorphically to `O_{X_ét}×`. Morphisms commute with the structural maps. The intended carrier is the full subcategory of monoid sheaves over the multiplicative structure sheaf satisfying this unit-fibre condition. Both locally noetherian analytic spaces and perfectoid spaces are allowed; no log-smoothness, noetherianity or comparison theorem enters this definition.

Construct `TauCeti.LogAdic.logification`: for a prelog sheaf `P→O_{X_ét}`, take the sheaf-monoid pushout `P ⊕_{α⁻¹O×} O×`. Prove its universal property as the left adjoint to inclusion of log structures, with the unit map, counit isomorphism on log structures and idempotence. Construct TauCeti.LogAdic.logPullback f M along a morphism of étale-sheafy adic spaces by logifying `f⁻¹M→O_Y`. Prove that log morphisms over `f` correspond to maps `f*M→N` on `Y`, together with the identity and composition isomorphisms and their coherence. A morphism of log adic spaces is strict when its comparison `f*M_X→M_Y` is an isomorphism; its stalkwise criterion is 6.2.

Define `TauCeti.LogAdic.IntegralChart` by a constant-monoid-sheaf map `P_X→M` inducing a logification isomorphism and taking structural values in `O⁺_{X_ét}`. Define coherent, fine and fs log adic spaces by étale-local charts with finitely generated, fine and fs monoids, respectively. The API includes `LogStructure.unit_fibre`, `logification.homEquiv`, `logification.idempotent`, `logPullback.id`, `logPullback.comp`, `IntegralChart.logificationIso`, and restriction of charts and these three local properties to étale opens. Chart existence and change are 6.4; saturated fibre products are 6.6. The Kummer map and site carriers are constructed in 6.12 and 6.15, and their local inertia and higher direct images in 6.17.

**Checks.**

- Logifying the one-element prelog monoid gives `O×`, not the one-element sheaf. Its unit fibre contains every analytic unit.
- For `ℕ→k⟨T⟩`, `1↦T`, logification has characteristic `ℕ` at zero and zero on the punctured disc. The characteristic cannot be the constant sheaf `ℕ`.
- Pulling that log structure back to the origin retains characteristic `ℕ`, whereas pulling back the trivial log structure gives the trivial structure. Under two successive pullbacks the resulting logifications agree with the composite pullback.
- On `Spa(ℚ_p,ℤ_p)`, the prelog map `1↦p⁻¹` logifies to the trivial log structure but is not an integral chart; `1↦p` gives an integral chart of the same log structure. Thus logification and the `O⁺` chart condition are separate requirements.
- Logifying an existing log structure changes neither its sections nor its unit fibre. The identity pullback preserves each chart and is strict.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Convention 2.2.1, Definition 2.2.2 and Remark 2.2.3, pp.7–8, give log structures, logification, pullback and the adjunction. Definition 2.3.1 and Definition 2.3.5, p.13, give the integral-image chart condition and the coherent, fine and fs local conditions.

*Needs:* `AdicEtaleGeometry` A1 (étale site and structure sheaves); `CrystallineCohomology` CR.5:log-algebra (commutative monoids and associated log structures); Mathlib `CategoryTheory.Sheaf` and `CategoryTheory.GrothendieckTopology`.

<a id="section-6-1"></a>

### 6.1 Étale descent and acyclicity of coherent modules on noetherian affinoids

Prove `TauCeti.LogAdic.coherent_etale_descent`. Let `X = Spa(R, R⁺)` be a noetherian affinoid adic space (more generally a locally noetherian adic space, affinoid locally), B the basis of its étale site consisting of étale maps from affinoids, and M a finite R-module (not necessarily projective). Write `M̃_ét` for the presheaf `U ↦ M ⊗_R O_X(U)` on `X_ét` and M̃ for its restriction to the analytic site. Then (1) `M̃_ét` is a sheaf, and `H^i(Y, M̃_ét) = 0` for every `Y ∈ B` and `i > 0`, with `H⁰(Y, M̃_ét) = M ⊗_R O(Y)`; (2) `M ↦ M̃_ét` is an equivalence from finite R-modules to coherent `O_{X_ét}`-modules, with quasi-inverse `F ↦ F(X)`, and likewise `M ↦ M̃` on the analytic site; (3) in particular `O_{X_ét}` is a sheaf and X is étale sheafy; (4) for the projection `λ`: `X_ét → X_an`, `λ^*` and `λ_*` are inverse equivalences between coherent `O_X`-modules and coherent `O_{X_ét}`-modules, and `Rλ_*M̃_ét = M̃`.

X noetherian (or locally noetherian) affinoid; M finite. For an analytic stably adic affinoid that is not noetherian the same holds for finite projective M only (Kedlaya–Liu), which is `AdicEtaleGeometry` §A1.6a.

(1)–(2) On the analytic site this is Huber's acyclicity of coherent sheaves on noetherian affinoids together with Kiehl's theorem (AdicSpacesPartIII R3 (tate kiehl affinoid)). For the étale site, an étale covering of an affinoid is refined by compositions of rational coverings and finite étale surjections (`AdicEtaleGeometry` §A1.6); for a finite étale surjection `R → S`, faithfully flat descent of finite modules gives exactness of `M → M ⊗ S ⇉ M ⊗ S ⊗ S` and higher Čech exactness; combine with the analytic case through the Čech-to-derived comparison on a stable basis.

(3) is (1) for `M = R`. (4) follows from (1)–(2): `λ_*M̃_ét = M̃` and the higher direct images vanish on affinoids.

**Checks.**

- For `M = R/I`, `M̃_ét` is the pushforward of the structure sheaf of the closed subspace V(I) to `X_ét`, and `H^i(X_ét, M̃_ét) = 0` for `i > 0`, although M is not projective.
- For `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, `H¹(X_ét, O) = 0` while `H¹(X_ét, μ_p) ≠ 0`: the acyclicity is for coherent modules, not for torsion étale sheaves.
- For `M = R` and a finite étale R-algebra S, the sections of `M̃_ét` over `Spa(S, S⁺)` are S.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Appendix A, Proposition A.9, p. 97: acyclicity and the equivalence for coherent sheaves on the analytic site of a noetherian affinoid. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Appendix A, Proposition A.10 and Corollary A.11, pp. 97–98: the étale version on a stable basis, for finite modules on noetherian affinoids and finite projective modules on analytic stably adic affinoids, and étale sheafiness.

*Needs:* AdicSpacesPartIII R3 (tate kiehl affinoid); AdicSpacesPartIII R3 (coherent sheaf); `AdicEtaleGeometry` §A1.6; `AdicEtaleGeometry` §A1.6a; `AdicEtaleGeometry` A1 (etale site); `DiamondsAndVStacks` D0 (cech to derived comparison); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (etale acyclicity of vector bundles).

Applications include [6.6](#section-6-6) and [6.10](#section-6-10) (gluing fibre products and differentials by étale descent of coherent sheaves), [6.15](#section-6-15)–[6.16](#section-6-16) (coherent acyclicity on the Kummer étale site), [7.16](#section-7-16) (B_dR-coefficient structure sheaves).

<a id="section-6-2"></a>

### 6.2 Characteristic stalks, morphisms and exactness of log adic spaces

Prove `TauCeti.LogAdic.characteristic_stalks`. Let X be an étale sheafy analytic adic space with a log structure `α: M_X → O_{X_ét}` in the sense of [6.0](#section-6-0) (a sheaf of commutative monoids on `X_ét` whose inverse image of `O^×_{X_ét}` maps isomorphically onto it), with its logification and logified pullback. Put `M̄_X := M_X/α^{−1}(O^×_{X_ét})`, the characteristic. (1) The geometric stalks of `M̄_X` are sharp, and if `M_X` is integral then `M^gp_{X,x̄}/O^×_{X_ét,x̄} ≅ M̄^gp_{X,x̄}`. (2) `M_X` is integral (resp. saturated) if and only if every geometric stalk is. (3) A morphism of log adic spaces `(Y, M_Y) → (X, M_X)` is a morphism f: `Y → X` of adic spaces with a monoid-sheaf map f♯: `f^{−1}M_X → M_Y` compatible with f♯ on structure sheaves and with the structure maps; morphisms compose through the canonical isomorphism `(g∘f)* ≅ f*∘g*` of logified pullbacks, with identities. (4) f is strict (`f*M_X → M_Y` an isomorphism) if and only if `M̄_{X,f(ȳ)} → M̄_{Y,ȳ}` is an isomorphism at every geometric point ȳ. (5) f is exact if `(f*M_X)_ȳ → M_{Y,ȳ}` is an exact homomorphism of monoids at every geometric point ȳ; for integral log structures this holds if and only if every characteristic stalk map is exact. (6) The trivial log structure `O^×_{X_ét} → O_{X_ét}` has zero characteristic and pulls back to the trivial log structure.

X étale sheafy and analytic, carrying the étale site and structure sheaf of `AdicEtaleGeometry` A1 (locally noetherian analytic adic spaces and perfectoid spaces are both allowed). The log structure, logification, pullback and strictness are constructed in [6.0](#section-6-0); this subsection adds their stalkwise theory.

(1)–(2) Compute stalks of the quotient sheaf; a unit of a geometric stalk of M̄ is the class of an element mapping to a unit of O, hence trivial; integrality and saturation are stalk conditions because geometric stalks detect isomorphisms of étale sheaves.

(3) Composition through the logification adjunction; the identity pulls back to the identity.

(4) `f*M_X → M_Y` is a map of log structures, and a map of log structures is an isomorphism if and only if it is one on characteristics, because both have unit fibre O^× (f♯ is local on stalks).

(5) For integral monoids, `P → Q` is exact if and only if `P = (P^gp ×_{Q^gp} Q)`; dividing by units does not change this.

The interface consists of the following named results.

- `TauCeti.LogAdic.characteristic`: `M̄_X = M_X/α^{−1}(O^×_{X_ét})`, with sharp geometric stalks.
- `TauCeti.LogAdic.characteristic_gp`: For integral `M_X`, `M^gp_{X,x̄}/O^×_{X_ét,x̄} ≅ M̄^gp_{X,x̄}`.
- `TauCeti.LogAdic.isIntegral_iff_stalk`: integrality and saturation are checked on geometric stalks.
- `TauCeti.LogAdic.Hom`: morphisms of log adic spaces, with `Hom.id` and `Hom.comp` through `(g∘f)* ≅ f*∘g*`.
- `TauCeti.LogAdic.strict_iff_stalk`: strictness is equivalent to bijectivity of every characteristic stalk map.
- `TauCeti.LogAdic.IsExact`: exactness of a morphism at geometric points, and its characteristic form for integral log structures.
- `TauCeti.LogAdic.trivial_characteristic`: the trivial log structure has zero characteristic and is stable under pullback.

**Checks.**

- `TauCeti.LogAdic.characteristic_disc`: For the log disc `Spa(k⟨T⟩, k°⟨T⟩)` with the log structure generated by T, the characteristic stalk at `T = 0` is `ℕ` and away from `T = 0` it is 0.
- `TauCeti.LogAdic.strict_on_logified_pullback`: The inclusion of the origin into the log disc is strict when the origin carries the pulled-back log structure (characteristic `ℕ`), and not strict when it carries the trivial log structure (characteristic map `ℕ → 0`). Testing on `f^{−1}M_X → M_Y` instead of the logified pullback gives the wrong answer at units.
- `TauCeti.LogAdic.diagonal_not_exact`: The diagonal `D → D²`, T₁, `T₂ ↦ T`, of log polydiscs has characteristic map `ℕ² → ℕ`, `(a, b) ↦` a + b, at the origin; the preimage of `ℕ` in `ℤ²` is the half-plane a `+ b ≥ 0 ≠ ℕ²`, so the map is not exact, while the identity is exact.
- The trivial log structure is `O^×_X`, whose characteristic is 0; the one-element monoid mapping to 1 is not a log structure on `Spa(ℚ_p, ℤ_p)`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.2.2 (4), (7)–(8), p. 8: the characteristic, morphisms of log adic spaces, pullback, strictness and exactness at geometric points. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 2.2.4, Remarks 2.2.5–2.2.6 and Example 2.2.7, p. 9: stalkwise integrality and saturation, the characteristic of an integral log structure, the stalkwise criterion for strictness and the trivial log structure.

*Needs:* [6.0](#section-6-0); `AdicEtaleGeometry` A1 (etale site); `AdicEtaleGeometry` A1 (etale structure sheaf); `CrystallineCohomology` CR.5:log-algebra (characteristic monoid).

Applications include DLLZ-adic §4.1 (Kummer maps are tested on characteristic stalks), and [6.12](#section-6-12), [6.14](#section-6-14) (stalkwise Kummer and ramification conditions).

<a id="section-6-3"></a>

### 6.3 Monoid-algebra log adic spaces

Construct `TauCeti.LogAdic.MonoidAlgebraLog`. For a Huber pair `(R,R⁺)` with ring of definition R₀ adic for a finitely generated ideal I and a monoid P, `(R[P],R[P]⁺)`, where `R[P]⁺` is the integral closure of the raw monoid subring `R⁺[P]` in R[P], with ring of definition R₀[P] and ideal of definition IR₀[P] is a Huber pair (corrected form of Lemma 2.2.11; integral-closure convention); `(R⟨P⟩,R⁺⟨P⟩)` is its completion and `Spa(R[P],R[P]⁺)=Spa(R⟨P⟩,R⁺⟨P⟩)` (Remark 2.2.12). If P is finitely generated and R is analytic and strongly noetherian, or finitely generated over a noetherian ring of definition, then so is R⟨P⟩, `Spa(R⟨P⟩,R⁺⟨P⟩)` is étale sheafy, and the formation of `Spa(R⟨P⟩,R⁺⟨P⟩)→Spa(R,R⁺)` is compatible with rational localisation (Lemma 2.2.13). When it is étale sheafy, `Spa(R⟨P⟩,R⁺⟨P⟩)` carries the log structure `P^log` associated with the constant pre-log structure `P_X→O_{X_ét}`, `a↦e^a` (Definition 2.2.17, Convention 2.2.18). For a locally noetherian adic space Y with trivial log structure and P finitely generated, gluing over noetherian affinoid opens gives a morphism of log adic spaces `Y⟨P⟩→Y` (Example 2.2.19); for P toric and `Y=Spa(k,k⁺)` this is an affinoid toric log adic space, and for `P=ℕⁿ` it is the unit polydisc Dⁿ with the log structure associated with `(a₁,…,aₙ)↦T₁^{a₁}⋯Tₙ^{aₙ}` (Examples 2.2.20-2.2.21).

Lemma 2.2.13 needs P finitely generated and R analytic strongly noetherian or finitely generated over a noetherian ring of definition; this construction's carriers are the analytic case.

The tautological map `P→R⟨P⟩`, `a↦e^a`, takes values in `R⁺⟨P⟩`, so it satisfies the integral-image condition of DLLZ charts.

Throughout this construction, the plus ring of a monoid chart is the integral closure of the raw plus monoid algebra; `R⁺⟨P⟩` denotes its completion as a ring of integral elements. Raw `R⁺[P]` need not be integrally closed, even for fs P with torsion units. This correction changes the plus-ring carrier, while the bounded continuous valuations and rational subsets stay the same.

R₀[P] with the I-adic topology makes R[P] a Huber ring. The raw subring `R⁺[P]` is open and consists of power-bounded elements: powers of a monoid monomial remain in R₀[P], and a finite sum with power-bounded coefficients remains bounded under powers. Its integral closure `R[P]⁺` is open and remains in the integrally closed power-bounded subring, hence gives a ring of integral elements. A valuation bounded by 1 on raw `R⁺[P]` is bounded on its integral closure, so the Spa and rational subsets are unchanged. No unrestricted monoid-algebra normality theorem is used.

For finitely generated P, a surjection `ℕʳ→P` gives a continuous surjection `R⟨T₁,…,T_r⟩→R⟨P⟩`, so strong noetherianity, or a noetherian ring of definition, passes to R⟨P⟩; étale sheafiness is then the locally noetherian case (DLLZ Corollary A.11) (Lemma 2.2.13).

Define `P^log` by the CR.5 associated log structure on the étale site, and glue Y⟨P⟩ along rational localisations.

The interface consists of the following named results.

- `TauCeti.LogAdic.MonoidAlgebraLog.huberPair`: `(R[P],R[P]⁺)` is a Huber pair for `R[P]⁺` the integral closure of raw `R⁺[P]` in R[P], with ring of definition R₀[P] and ideal of definition IR₀[P]. Its completed pair is denoted `(R⟨P⟩,R⁺⟨P⟩)`. This is the corrected version of Lemma 2.2.11 and Remark 2.2.12.
- `TauCeti.LogAdic.MonoidAlgebraLog.noetherian`: For finitely generated P, R⟨P⟩ is analytic and strongly noetherian (resp. finitely generated over a noetherian ring of definition) when R is, and `Spa(R⟨P⟩,R⁺⟨P⟩)` is étale sheafy (Lemma 2.2.13).
- `TauCeti.LogAdic.MonoidAlgebraLog.logStructure`: The log structure `P^log` associated with `P_X→O_{X_ét}`, `a↦e^a` (Definition 2.2.17).
- `TauCeti.LogAdic.MonoidAlgebraLog.tautologicalChart`: `P→P^log(X)`, `a↦e^a`, with values in `R⁺⟨P⟩`; it is a chart of `P^log`.
- `TauCeti.LogAdic.MonoidAlgebraLog.relative`: `Y⟨P⟩→Y` for a locally noetherian Y with trivial log structure and finitely generated P, glued over noetherian affinoid opens (Example 2.2.19).
- `TauCeti.LogAdic.MonoidAlgebraLog.map`: A monoid map `u:P→Q` induces `Y⟨Q⟩→Y⟨P⟩` over Y, compatible with the tautological charts, with identity and composition laws.
- `TauCeti.LogAdic.MonoidAlgebraLog.rational_localization`: The formation of `Spa(R⟨P⟩,R⁺⟨P⟩)→Spa(R,R⁺)` commutes with rational localisation of `Spa(R,R⁺)` (Lemma 2.2.13).
- `TauCeti.LogAdic.MonoidAlgebraLog.lift`: For a log adic space X over Y, morphisms `X→Y⟨P⟩` of log adic spaces over Y correspond to monoid maps `P→M_X(X)` whose composite with `α` lands in `O⁺_{X_ét}(X)` (Remarks 2.3.2-2.3.3).
- `TauCeti.LogAdic.MonoidAlgebraLog.plus`: The integral closure of raw `R⁺[P]` in R[P]; it contains every tautological monomial, is open and lies in the power-bounded subring. Use this plus ring before forming a Huber.Pair, and its completed ring of integral elements afterward.

**Checks.**

- `TauCeti.LogAdic.MonoidAlgebraLog.nat_polydisc`: For `P=ℕⁿ` and `(R,R⁺)=(k,k°)`, `Spa(k⟨P⟩,k°⟨P⟩)` is the unit polydisc Dⁿ and `P^log` is the log structure associated with `(a₁,…,aₙ)↦T₁^{a₁}⋯Tₙ^{aₙ}`.
- `TauCeti.LogAdic.MonoidAlgebraLog.int_circle`: For `P=ℤ`, `Spa(k⟨P⟩,k°⟨P⟩)` is the circle `|T|=1` and `P^log` is the trivial log structure, because the image of P consists of units.
- `TauCeti.LogAdic.MonoidAlgebraLog.zero_monoid`: For `P=0`, `Y⟨P⟩→Y` is the identity of Y with the trivial log structure.
- `TauCeti.LogAdic.MonoidAlgebraLog.origin_nontrivial`: For `P=ℕ`, the point `T=0` lies in `Spa(k⟨ℕ⟩,k°⟨ℕ⟩)` and has characteristic `ℕ`, so `P^log` is not trivial and `Spa(k⟨ℕ⟩,k°⟨ℕ⟩)` is not the punctured disc.
- `TauCeti.LogAdic.MonoidAlgebraLog.torsion_units`: For `R=Q₂`, `R⁺=Z₂` and `P=C₂` with generator u and `u²=1`, `e=(1+u)/2` satisfies `e²=e`. It is integral over raw Z₂[C₂], but is not in that raw subring because its two coefficients are 1/2. Thus e belongs to `R[P]⁺` and a raw-plus constructor would fail the Huber-pair integral-closure condition. The algebraic Q/Z model has the same coefficient calculation.
- For `P=ℕ` over k, `Spa(k⟨P⟩,k°⟨P⟩)` is the closed unit disc with log structure generated by T, not the punctured disc with the trivial log structure.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 2.2.11 and Remark 2.2.12, pp. 9-10: Supplies the monoid-algebra topology and the completion convention. The plus-ring assertion of Lemma 2.2.11 is corrected by integral closure; bounded continuous valuations give the same Spa. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 2.2.13, p. 10: Noetherianity, étale sheafiness and compatibility with rational localisation for finitely generated P, with the two cases on R kept in the hypotheses. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.2.17 and Convention 2.2.18, p. 11: Defines the log structure `P^log` on `Spa(R⟨P⟩,R⁺⟨P⟩)`. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Examples 2.2.19-2.2.21, pp. 11-12: Constructs `Y⟨P⟩→Y` by gluing; Examples 2.2.20-2.2.21 give affinoid toric log adic spaces and the log polydisc Dⁿ.

*Needs:* [6.2](#section-6-2); `CrystallineCohomology` CR.5:log-algebra (associated log); `TauCeti.Huber.Pair`; `AdicSpacesPartII` R0 (noetherian type huber ring); `AdicSpacesPartII` R0 (topologically finite type noetherian type); `AdicSpacesPartII` R0 (locally noetherian adic space); `AdicEtaleGeometry` A1 (etale structure sheaf).

Applications include DLLZ-adic Remarks 2.3.2-2.3.3: charts are strict morphisms to `Spa(R⟨P⟩,R⁺⟨P⟩)` or Y⟨P⟩; DLLZ-adic Definition 3.1.1: log smoothness compares Y with `X×_{X⟨P⟩}X⟨Q⟩`; DLLZ-adic Remark 2.3.26 and Definition 4.1.5: saturation `X×_{Y⟨P⟩}Y⟨P^sat⟩` and root covers `X×_{X⟨P⟩}X⟨(1/n)P⟩`; DLLZ-RH §2.1: smooth toric charts `X→Dⁿ` give the local coordinates of the period sheaves.

<a id="section-6-4"></a>

### 6.4 Charts of log adic spaces and of morphisms

Prove `TauCeti.LogAdic.chart_theory`. Let `(X, M_X, α)` be a log adic space with charts `θ`: `P_X → M_X` in the sense of [6.0](#section-6-0) (the associated log structure of `α∘θ` is `M_X` and `α∘θ` takes values in `O⁺_{X_ét}`). (1) If X lies over `Spa(R, R⁺)`, P is finitely generated and `Spa(R⟨P⟩, R⁺⟨P⟩)` is étale sheafy ([6.3](#section-6-3)), charts of X modeled on P correspond to strict morphisms `X → Spa(R⟨P⟩, R⁺⟨P⟩)` of log adic spaces; over a locally noetherian Y with trivial log structure, to strict morphisms `X → Y⟨P⟩`. (2) At each geometric point x̄, `θ` induces `P/(α∘θ)^{−1}(O^×_{x̄}) ≅ M̄_{X,x̄}`; a chart need not be sharp. (3) A locally noetherian coherent log adic space is fine (resp. fs) if and only if it is integral (resp. saturated). (4) A fine (resp. fs) log adic space admits, étale locally at each geometric point x̄, a chart modeled on `M̄_{X,x̄}`. (5) A chart of a morphism f: `Y → X` is a triple `(θ_X: P_X → M_X, θ_Y: Q_Y → M_Y, u: P → Q)` with `f♯ ∘ f^{−1}(θ_X) = θ_Y ∘ u`; morphisms of fine (resp. fs) log adic spaces admit fine (resp. fs) charts étale locally.

The chart notion, its `O⁺` condition and the fs condition are those of [6.0](#section-6-0). (3) needs X locally noetherian and coherent; (4) needs X fine; (5) needs coherent, resp. fine or fs, source and target.

(1) By the universal property of the associated log structure (Remarks 2.3.2–2.3.3), using the tautological chart of [6.3](#section-6-3).

(2) Lemma 2.1.5 and Remark 2.2.5 (Remark 2.3.4).

(3) Lemma 2.3.7 (integral and saturated replacement charts, using that `O⁺` is integrally closed) with Lemma 2.2.4.

(4)–(5) Lemma 2.3.6 refines finitely generated charts keeping O⁺-integrality, and Lemma 2.3.12 gives an O⁺-adjusted splitting `M̄_{X,x̄} → M_{X,x̄}` (Propositions 2.3.13, 2.3.21–2.3.22).

The interface consists of the following named results.

- `TauCeti.LogAdic.chart_equivStrictToric`: charts modeled on P correspond to strict morphisms to `Spa(R⟨P⟩, R⁺⟨P⟩)` or to Y⟨P⟩.
- `TauCeti.LogAdic.chart_characteristic`: `P/(α∘θ)^{−1}(O^×_{x̄}) ≅ M̄_{X,x̄}`.
- `TauCeti.LogAdic.isFs_iff_saturated`: for locally noetherian coherent X, fine iff integral and fs iff saturated.
- `TauCeti.LogAdic.exists_characteristic_chart`: étale-local charts modeled on `M̄_{X,x̄}` for fine (fs) X.
- `TauCeti.LogAdic.ChartHom`: charts of morphisms, with étale-local existence for fine (fs) morphisms.

**Checks.**

- `TauCeti.LogAdic.chart_coordinate_axis`: For the chart `ℕ → k⟨T⟩`, `1 ↦ T`, the characteristic at `T = 0` is `ℕ` and off `T = 0` it is 0.
- `TauCeti.LogAdic.chart_unit`: A chart all of whose images are units has zero characteristic everywhere.
- `TauCeti.LogAdic.chart_reject_inverse_p`: On `Spa(ℚ_p, ℤ_p)`, `ℕ → ℚ_p`, `1 ↦ p^{−1}`, logifies to the trivial log structure but gives no morphism to `Spa(ℚ_p⟨ℕ⟩, ℤ_p⟨ℕ⟩)`, since `p^{−1} ∉ ℤ_p`; `1 ↦ p` is a chart of the same log structure and gives such a strict morphism.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §2.3, Remarks 2.3.2–2.3.4, p. 13: charts as strict morphisms to monoid-algebra spaces and the characteristic formula. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.11, p. 15: fine and fs versus integral and saturated for locally noetherian coherent spaces. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.3.19, p. 17; Propositions 2.3.13 and 2.3.22, pp. 16–18: charts of morphisms and the étale-local existence statements.

*Needs:* [6.2](#section-6-2); [6.3](#section-6-3); [6.0](#section-6-0); `CrystallineCohomology` CR.5:log-algebra (log chart); `TauCeti.Huber.Pair`; `AdicSpacesPartII` R0 (locally noetherian adic space); `AdicSpacesPartII` R0 (topologically finite type noetherian type); `AdicSpacesPartII` R0 (noetherian type stably sheafy).

Applications include DLLZ-adic Proposition 3.1.4 (chart changes prove intrinsic log smoothness) and DLLZ-RH §2.2 (integral monoid lifts define the structural period relations).

<a id="section-6-5"></a>

### 6.5 Analytic normal-crossings log structures

Construct `TauCeti.LogAdic.DivisorialLog`. Let X be a normal rigid analytic variety over a nonarchimedean field k, viewed as a locally noetherian adic space, `D⊂X` an effective Cartier divisor and `j:U=X−D→X`. Setting M_X(V)={f∈O_{X_ét}(V): f is invertible on the preimage of U}, that is `M_X=O_{X_ét}∩j_*O×_{U_ét}`, with `α` the inclusion, makes X a locally noetherian fs log adic space (normality is used for saturation), and U is the maximal open subspace on which `M_X` is trivial (Example 2.3.16). If X is smooth and D is a (reduced) normal crossings divisor, i.e. étale locally, equivalently analytic locally after a finite separable extension of k, `(X,D)≅(S×D^m,S×{T₁⋯T_m=0})` with S smooth, then `M_X` is the pullback of the log structure of `D^m `([6.3](#section-6-3)), so étale locally `ℕ^m→M_X`, `e_i↦T_i`, is an fs chart whose images lie in `O⁺`, and at a geometric point lying on exactly s local branches `M̄_{X,x̄}≅ℕ^s` (Example 2.3.17). Étale locally X then admits a smooth toric chart `X→Dⁿ`, `n=dim X`, pulling `{T₁⋯T_m=0}` back to D, so X is log smooth over k (Example 3.1.13). For a smooth scheme with a strict normal crossings divisor, the same construction on the analytification (a smooth pair of AdicSpacesPartIV R4) agrees with the logified pullback of the algebraic divisorial log structure, local algebraic equations being rescaled by constants of small absolute value where they are not power-bounded.

X normal over any nonarchimedean field k for Example 2.3.16 (no characteristic assumption); X smooth and D a normal crossings divisor in DLLZ's étale-local sense for the chart statements (Example 2.3.17). A smooth pair of AdicSpacesPartIV R4 (smooth pair) is the strict special case in which the charts exist analytic-locally over k itself.

Chart functions must lie in `O⁺ `([6.4](#section-6-4)): on `S×D^m` the coordinates `T_i` do; pulled-back algebraic equations may need rescaling by a constant, which changes neither `M_X` nor its characteristic.

On an étale chart `S×D^m`, sections of `O∩j_*O×` are units times monomials in the `T_i`; this gives the log structure of `D^m` (Example 2.2.21) and saturation by normality (Examples 2.3.16-2.3.17).

The characteristic at a point on s branches is `ℕ^s` by Remark 2.3.4 applied to the chart `ℕ^m→M_X`.

Smooth toric charts: compose `S→T^{n−m}` (rational localisations and finite étale maps) with `T^{n−m}×D^m⊂Dⁿ` (Example 3.1.13); log smoothness then follows from [6.7](#section-6-7).

For algebraic pairs, use AdicSpacesPartIV R4 (analytification of smooth pair) and the CR.5 divisorial chart, rescaling the local equations into `O⁺` before comparing charts.

The interface consists of the following named results.

- `TauCeti.LogAdic.DivisorialLog`: The log structure `O_X∩j_*O_U×` associated to the specified boundary complement.
- `TauCeti.LogAdic.DivisorialLog.restrict_open`: Restriction to U is the trivial log structure.
- `TauCeti.LogAdic.DivisorialLog.chart`: Étale locally on a normal crossings chart `S×D^m`, `ℕ^m→M_X`, `e_i↦T_i`, is an fs chart with images in `O⁺`; the characteristic at a point on exactly s branches is `ℕ^s`.
- `TauCeti.LogAdic.DivisorialLog.analytification`: For an algebraic smooth pair with strict normal crossings boundary, the logified pullback of the algebraic divisorial log structure to the analytification agrees with the analytic divisorial log structure; charts use local equations rescaled into `O⁺`.
- `TauCeti.LogAdic.DivisorialLog.trivial_locus`: `U=X−D` is the maximal open subspace on which `M_X` is the trivial log structure (Example 2.3.16).
- `TauCeti.LogAdic.DivisorialLog.smoothToricChart`: Étale locally X has a strictly étale `X→Dⁿ`, `n=dim X`, composed of rational localisations and finite étale maps, pulling `{T₁⋯T_m=0}` back to D (Example 3.1.13); hence X is log smooth over k.

**Checks.**

- `TauCeti.LogAdic.DivisorialLog.empty_boundary`: If D is empty, `M=O_X×`.
- `TauCeti.LogAdic.DivisorialLog.double_intersection`: At the crossing `T₁=T₂=0`, characteristic monoid is `N²`, while at its generic branches it is N.
- `TauCeti.LogAdic.DivisorialLog.not_all_functions`: At a point of U, a function vanishing at that point is not a section of M; M is not all of `O_X`.
- `TauCeti.LogAdic.DivisorialLog.unscaled_equation`: On the closed unit disc over k with `D={T=0}` and `c∈k` with `|c|>1`, the map `ℕ→M_X`, `1↦cT`, logifies to `M_X` but is not a chart because `cT∉O⁺`; the map `1↦T` is a chart.
- The construction applies to toroidal compactifications only with the requisite smooth/normal crossings charts.
- U is exactly the locus where the log structure is trivial.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.3.16, p. 16: Example 2.3.16 defines `M_X(V)` as functions invertible on the preimage of `X−D` on a normal rigid variety and asserts it is a locally noetherian fs log structure; the statement keeps the normality hypothesis. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.3.17, pp. 16-17: Defines normal crossings divisors étale locally, which the statement keeps rather than restricting to strict normal crossings. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.3.17, pp. 16–17: States that the divisorial log structure is the pullback of the toric log structure of `D^m`, which gives the chart `ℕ^m→M_X` of the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 3.1.13, p. 25: Gives the smooth toric charts and log smoothness over k included in the statement.

*Needs:* [6.4](#section-6-4); [6.3](#section-6-3); [6.7](#section-6-7); `CrystallineCohomology` CR.5:log-algebra (divisorial log); AdicSpacesPartIV R4 (smooth pair); AdicSpacesPartIV R4 (analytification of smooth pair); `AdicSpacesPartII` R1 (analytification functor); `AdicSpacesPartII` R0 (smooth morphism).

Applications include `AutomorphicBundles` B3.general: The canonical extension uses the same boundary pair; DLLZ-RH §3.2: SNC boundary supplies residue coordinates for the functors.

<a id="section-6-6"></a>

### 6.6 Saturated analytic log fibre products

Construct `TauCeti.LogAdic.FsAdicPullback`. (1) The inclusion of locally noetherian (resp. noetherian) fine log adic spaces into coherent ones has a right adjoint `X↦X^int` whose underlying map `X^int→X` is a closed immersion, and the inclusion of fs into fine ones has a right adjoint `X↦X^sat` whose underlying map is finite and surjective; `X^sat:=(X^int)^sat` is right adjoint to the inclusion of fs into coherent log adic spaces (Proposition 2.3.23, Remark 2.3.24). Both functors preserve strict finite and strict étale morphisms, and for X over a locally noetherian fs Y with a global chart modeled on a finitely generated (fine) P, `X^int≅X×_{Y⟨P⟩}Y⟨P^int⟩ (X^sat≅X×_{Y⟨P⟩}Y⟨P^sat⟩)` (Remarks 2.3.25-2.3.26). (2) If the fibre product `W=Y×_X Z` of the underlying locally noetherian adic spaces exists (for instance when `Y→X` is lft), W with the log structure associated with `pr_Y⁻¹M_Y⊕_{pr_X⁻¹M_X}pr_Z⁻¹M_Z` is the fibre product of log adic spaces, coherent when X, Y, Z are; the fine and fs fibre products are `W^int` and `W^sat`, modeled on `(Q⊕_P R)^int` and `(Q⊕_P R)^sat` for charts `P→Q`, `P→R` (Proposition 2.3.27, Remark 2.3.29). Their underlying adic spaces can differ from W (Remark 2.3.30); fibre products of fs log adic spaces are taken in the fs category (Convention 2.3.31). (3) Four-point lemma: if `f:Y→X` and `g:Z→X` are lft morphisms of locally noetherian fs log adic spaces and f is exact, then for `y∈Y` and `z∈Z` over the same `x∈X` some `w∈Y×_X Z` maps to y and to z (Proposition 2.3.32, via Lemma 2.3.33).

Locally noetherian carriers throughout; integralisation is defined on coherent, saturation on fine log adic spaces.

Fibre products exist only when the underlying adic fibre product exists (e.g. one map lft); the four-point lemma needs both maps lft and f exact.

Affinoid case with a global chart P: X^?=Spa(R⊗_{ℤ[P]}ℤ[P^?], integral closure of `R⁺⊗_{ℤ[P]}ℤ[P^?]`); `ℤ[P^?]` is finite over `ℤ[P]`, giving a closed immersion (int) or a finite surjection (sat), and the adjunction follows from Proposition 2.3.11 (Proposition 2.3.23).

Glue the local constructions by étale descent of coherent sheaves ([6.1](#section-6-1), DLLZ Proposition A.10) and finite morphisms; functoriality uses Proposition 2.3.22.

Fibre products: logify the pushout of the pulled-back log structures; coherence via charts `P→Q`, `P→R` from Proposition 2.3.21 and `S=Q⊕_P R`; the fine and fs cases apply (1) (Proposition 2.3.27).

Four-point lemma: reduce to geometric points by Huber Lemma 1.1.10; with `P=M̄_x`, `Q=M̄_y`, `R=M̄_z`, exactness of u and sharpness of R make `S=Q⊕_P R` quasi-integral (Nakayama Lemma 2.2.6), so the kernel of `l⟨S⟩→l⟨S^sat⟩` lies in the ideal generated by the nonzero monomials and W is nonempty (Lemma 2.3.33).

The interface consists of the following named results.

- `TauCeti.LogAdic.FsAdicPullback`: The analytic fs fibre product, with projections and compatibility over the base.
- `TauCeti.LogAdic.FsAdicPullback.lift`: Compatible fs log maps have a unique map to the fs pullback.
- `TauCeti.LogAdic.FsAdicPullback.strict_base_change`: Under strict base change the induced log structure is the ordinary pullback structure.
- `TauCeti.LogAdic.FsAdicPullback.symmetry`: Interchanging factors gives the canonical involutive isomorphism.
- `TauCeti.LogAdic.FsAdicPullback.integralization`: `X↦X^int` is right adjoint to the inclusion of locally noetherian fine into coherent log adic spaces, with `X^int→X` a closed immersion (Proposition 2.3.23(1)).
- `TauCeti.LogAdic.FsAdicPullback.saturation`: `X↦X^sat` is right adjoint to the inclusion of locally noetherian fs into fine (and, via `(X^int)^sat`, coherent) log adic spaces, with `X^sat→X` finite and surjective (Proposition 2.3.23(2), Remark 2.3.24).
- `TauCeti.LogAdic.FsAdicPullback.chart`: For fs charts `P→Q`, `P→R` of `Y→X`, `Z→X`, the fs product is modeled on `(Q⊕_P R)^sat` (Remark 2.3.29); separately, for a locally noetherian W over a locally noetherian fs T with a global chart modeled on a fine P, `W^sat≅W×_{T⟨P⟩}T⟨P^sat⟩` as adic spaces (Remark 2.3.26).
- `TauCeti.LogAdic.FsAdicPullback.exists_point_of_exact`: For lft f, g with f exact, points y, z over a common x lift to a point of the fs product (Proposition 2.3.32).

**Checks.**

- `TauCeti.LogAdic.FsAdicPullback.identity`: `Y×_X X≃Y` as fs log adic spaces.
- `TauCeti.LogAdic.FsAdicPullback.root_double`: For X the closed unit disc over k with chart `ℕ (1↦T)`, `Y=Spa(k⟨U⟩)` with `Uⁿ=T` and chart `ℕ→ℕ` multiplication by n, where n is invertible in k and `μ_n⊂k`: `(ℕ⊕_ℕℕ)^sat≅ℕ⊕ℤ/n`, so the fs product `Y×_X Y` is the disjoint union over `ζ∈μ_n` of copies of `Y (V=ζU)`, whereas the ordinary product `Spa(k⟨U,V⟩/(Uⁿ−Vⁿ))` is connected.
- `TauCeti.LogAdic.FsAdicPullback.mapping_property`: Two morphisms from an fs test space coincide if their two projection maps coincide.
- Keep the fs universal property separate from any claim about ordinary adic product points.
- The fs self-product of a Kummer root cover is computed through the saturated pushout, not the ordinary product.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.23(1)-(2), p. 18: States saturation as a right adjoint with finite surjective underlying map; part (1) gives integralisation with a closed immersion, both as in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.27(2), p. 19: Gives the existence condition kept in the statement; part (1) and the proof give the coherent product and its chart model. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 2.3.30, p. 20: States that the fine and fs fibre products can have a different underlying adic space, as in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.32 and Lemma 2.3.33, p. 20: The four-point lemma for lft morphisms of locally noetherian fs log adic spaces with f exact; Lemma 2.3.33 is its geometric-point case.

*Needs:* [6.4](#section-6-4); [6.3](#section-6-3); `CrystallineCohomology` CR.5:log-algebra (integral log fiber product); `CrystallineCohomology` CR.5:log-algebra (saturated monoid); `AdicSpacesPartII` R0 (fibre products existence); `AdicSpacesPartII` R0 (fibre product points); `AdicSpacesPartII` R0 (finite morphism); [6.1](#section-6-1); `AdicSpacesPartII` R0 (closed adic subspaces and embeddings).

Applications include DLLZ-adic §4.1: Kummer root covers are stable under fs base change; DLLZ-adic §5.3: Products of log perfectoid objects use these finite-level products.

<a id="section-6-7"></a>

### 6.7 Analytic log smoothness and log étaleness

Prove `TauCeti.LogAdic.log_smooth_chart_criterion`. Let `f:Y→X` be a morphism of locally noetherian fs log adic spaces. f is log smooth (resp. log étale) if étale locally on Y and X it has an fs chart `u:P→Q` such that `ker(u^gp)` and the torsion part of `coker(u^gp)` (resp. `ker(u^gp)` and `coker(u^gp)`) are finite of order invertible in `O_X`, and the induced morphism `Y→X×_{X⟨P⟩}X⟨Q⟩` is étale on underlying adic spaces (Definition 3.1.1); such f is lft, so fs fibre products along it exist (Remark 3.1.2). If X has a global fs chart P, then étale locally on Y and X, f has an injective fs chart `P→Q` satisfying these conditions, with Q torsion-free when P is (Proposition 3.1.4). Log smooth (log étale) morphisms are stable under fs base change by arbitrary morphisms of locally noetherian fs log adic spaces and under composition (Propositions 3.1.3, 3.1.6), and a strict log smooth (log étale) morphism is smooth (étale) on underlying adic spaces (Proposition 3.1.7). If X is log smooth over an affinoid field `Spa(k,k⁺)` with trivial log structure, then étale locally X has a toric chart, a strictly étale `X→Spa(k⟨P⟩,k⁺⟨P⟩)` with P a sharp fs monoid that is a composition of rational localisations and finite étale maps; if moreover X is smooth one may take `P=ℕⁿ`, a smooth toric chart `X→Dⁿ` (Proposition 3.1.10, Corollary 3.1.11, Definition 3.1.12).

The index is invertible in `O_X`, not necessarily `O_X⁺`. Log smoothness does not imply ordinary smoothness without strictness.

Toric charts need X log smooth over an affinoid field with the trivial log structure on the base.

Base change: by Proposition 2.3.22 the base change `Z→X` has an fs chart `P→R`; `Z×_X Y` is modeled on `(R⊕_P Q)^sat`, whose group cokernel over `R^gp` is that of `u^gp`, and the comparison map is a base change of `Y→X×_{X⟨P⟩}X⟨Q⟩` (Remarks 2.3.25-2.3.29; Proposition 3.1.3).

Chart change (Proposition 3.1.4): refine charts by Lemma 2.3.6, make `P₁→Q₁` injective through a cartesian diagram of groups, and extract n-th roots of units (n invertible in `O_X`) to lift the group extension; finite group corrections are étale by Huber Proposition 1.7.1; for torsion-free P adjoin roots of torsion units by a finite étale cover (after Nakayama).

Composition follows from Definition 3.1.1 and Proposition 3.1.4 (Proposition 3.1.6).

Strict case: with `P=M̄_{X,f(ȳ)}`, write `coker(u^gp)=K_tor⊕ℤʳ`, replace Q by `u(P)⊕K_tor⊕ℕʳ`, and use that `X⟨K_tor⟩×_X X⟨ℕʳ⟩` is smooth, and étale when `r=0`, by Huber Corollary 1.6.10 and Proposition 1.7.1 (Proposition 3.1.7).

Toric charts: from Proposition 3.1.4 take Q torsion-free, split `Q≅Q̄⊕ℤʳ` and localise; in the smooth case regularity of `κ(z)[[Q̄_F]]` forces `Q̄_F≅ℕˢ` (Proposition 3.1.10, Corollary 3.1.11).

**Checks.**

- Toric singularities are valid log smooth examples.
- In characteristic zero, p-th coordinate roots are log étale although p is not a unit of `O⁺`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.1.1 and Remark 3.1.2, p. 21: Defines log smoothness and log étaleness by fs charts with this group condition and étaleness of `Y→X×_{X⟨P⟩}X⟨Q⟩`, with invertibility in `O_X` as kept in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Propositions 3.1.3 and 3.1.6, pp. 21-23: States stability under fs base change; Proposition 3.1.6 gives stability under composition. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.4, pp. 21-23: Gives injective (and torsion-free when P is) charts over a given fs chart of the base, as stated here. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.7, p. 24: The strict case stated here. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.10, Corollary 3.1.11 and Definition 3.1.12, pp. 24-25: Existence of toric charts for log smooth X over an affinoid field; Corollary 3.1.11 gives smooth toric charts `X→Dⁿ` when X is smooth.

*Needs:* [6.6](#section-6-6); [6.4](#section-6-4); [6.3](#section-6-3); `CrystallineCohomology` CR.5:log-algebra (log smooth chart criterion); `AdicEtaleGeometry` A1 (etale site); `AdicSpacesPartII` R0 (smooth morphism); `AdicSpacesPartII` R0 (differentials unramified smooth etale); `AdicSpacesPartII` R0 (restricted power series smooth); `AdicSpacesPartII` R0 (smooth etale base change); `AdicSpacesPartII` R0 (etale smooth composition).

<a id="section-6-8"></a>

### 6.8 Continuous analytic log derivations

Define `TauCeti.LogAdic.ContinuousLogDerivation`. A pre-log Huber ring `(A,M,α)` is a Huber ring A (not necessarily complete), a monoid M and a monoid map `α:M→(A,·)`; it is a log Huber ring if A is complete and `α⁻¹(A×)→A×` is an isomorphism; a homomorphism `(A,M,α)→(B,N,β)` is a continuous ring map f with a monoid map `f♯:M→N` such that `β∘f♯=f∘α` (Definition 3.2.1). For such a homomorphism and a complete topological B-module L, an (A,M,α)-derivation of `(B,N,β)` into L is a pair `(d,δ)`: `d:B→L` is a continuous A-linear derivation and `δ:N→(L,+)` is a monoid map with `δ(f♯(m))=0` and `d(β(n))=β(n)·δ(n)` for all `m∈M`, `n∈N` (Definition 3.2.2). These form a `B-module Der^log_A(B,L)`; for trivial log structures `M=α⁻¹(A×)`, `N=β⁻¹(B×)` it is the module `Der_A(B,L)` of continuous A-derivations. Each pair extends to `(B,ᵃN,β)` without changing `Der^log_A(B,L)`, and `δ` extends uniquely to a group map `(ᵃN)^gp→L` (Remark 3.2.3).

L is complete. This construction's carriers take L complete and Hausdorff, which loses nothing because the representing module of [6.9](#section-6-9) is Hausdorff; continuous derivations are not replaced by algebraic derivations.

Refine Mathlib `Derivation` by continuity and the compatible monoid map.

Extend `δ` across logification using `δ(u)=u⁻¹d(u)` on units.

Use the group completion universal property for `δ^gp`.

For trivial log structures `δ` is forced by `δ(n)=β(n)⁻¹d(β(n))`, giving `Der^log_A(B,L)=Der_A(B,L)`.

The interface consists of the following named results.

- `TauCeti.LogAdic.ContinuousLogDerivation`: Bundle a continuous derivation and monoid-to-additive map satisfying the relative-zero and compatibility equations.
- `TauCeti.LogAdic.ContinuousLogDerivation.ext`: Equality of d and `δ` gives equality of the log derivation.
- `TauCeti.LogAdic.ContinuousLogDerivation.map_structural`: `d(βn)=βn·δ(n)`.
- `TauCeti.LogAdic.ContinuousLogDerivation.postcompose`: A continuous B-linear map `L→L′` induces a log derivation to L′; identity and composite maps agree.
- `TauCeti.LogAdic.ContinuousLogDerivation.instModule`: `Der^log_A(B,L)` is a B-module, with operations computed componentwise on d and `δ` (Definition 3.2.2).
- `TauCeti.LogAdic.ContinuousLogDerivation.toDerivation`: `(d,δ)↦d`, the forgetful B-linear map to continuous A-derivations; it is bijective when `M=α⁻¹(A×)` and `N=β⁻¹(B×)`.
- `TauCeti.LogAdic.ContinuousLogDerivation.deltaGp`: The unique group map `(ᵃN)^gp→L` extending `δ`, which vanishes on the image of `M^gp` (Remark 3.2.3).
- `TauCeti.LogAdic.ContinuousLogDerivation.logificationEquiv`: `Der^log_A(B,L)` is unchanged when `(B,N,β)` is replaced by its logification `(B,ᵃN,β)` (Remark 3.2.3).

**Checks.**

- `TauCeti.LogAdic.ContinuousLogDerivation.zero`: The pair of zero maps is a continuous log derivation.
- `TauCeti.LogAdic.ContinuousLogDerivation.unit_formula`: For a unit `β(n)`, `δ(n)=β(n)⁻¹d(β(n))`.
- `TauCeti.LogAdic.ContinuousLogDerivation.boundary_value`: For `B=k⟨T⟩` with `N=ℕ`, `β(1)=T`, over k with the pre-log structure given by the zero monoid `M=0` (whose logification is the trivial log structure; with `M=k×` no compatible `f♯:k×→ℕ` exists): into `L=B`, `d=T·d/dT` gives `d(T)=T` and forces `δ(1)=1`; into `L=B/(T)=k`, the pair `d=0`, `δ(1)=1` is a log derivation, so `d(T)=0` at `T=0` does not force `δ(1)=0` and `δ` is not determined by d.
- `TauCeti.LogAdic.ContinuousLogDerivation.trivial_log`: If `M=α⁻¹(A×)` and `N=β⁻¹(B×)`, every continuous A-derivation `d:B→L` extends uniquely to a log derivation, by `δ(n)=β(n)⁻¹d(β(n))`.
- On a coordinate chart, `δ(T)` is dlog T even at `T=0`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.1, p. 26: Defines pre-log Huber rings; parts (2)-(4) give log Huber rings, associated log Huber rings and homomorphisms as stated here. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.2, p. 26: Defines the pair `(d,δ)` with `δ(f♯m)=0` and `d(βn)=β(n)δ(n)`, its `B-module Der^log_A(B,L)` and the trivial-log case; the statement adds Hausdorffness of L for the analytic universal property. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 3.2.3, p. 26: Invariance under logification and the extension `δ^gp` stated here.

*Needs:* `CrystallineCohomology` CR.5:log-algebra (prelog ring); `CrystallineCohomology` CR.5:log-algebra (associated log); `Derivation`; `TauCeti.Huber.Pair`; `AdicSpacesPartII` R0 (continuous differentials).

Applications include DLLZ-adic Proposition 3.2.9: The analytic log differential module represents these pairs; DLLZ-RH (2.2.14): Defines the structural period connection on monoid generators.

<a id="section-6-9"></a>

### 6.9 Continuous log differential modules

Construct `TauCeti.LogAdic.ContinuousLogDifferentials`. Let `f:(A,M,α)→(B,N,β)` be a tft homomorphism of pre-log Huber rings: A and B complete, `A→B` topologically of finite type, and `N^gp/((f♯M)^gp·β⁻¹(B×))` finitely generated (Definition 3.2.4). Let `I⊂(B⊗̂_A B)[N]` be the ideal generated by `e^{f♯(m)}−1` and `(β(n)⊗1)−(1⊗β(n))e^n`, J the kernel of `((B⊗̂_A B)[N])/I→B (b₁⊗b₂↦b₁b₂, e^n↦1)`, and `Ω^log_{B/A}:=J/J²` with d(b)=class of `b⊗1−1⊗b` and δ(n)=class of `e^n−1`. Then `Ω^log_{B/A}≅(Ω_{B/A}⊕(B⊗_ℤN^gp))/R`, where `Ω_{B/A}` is the module of continuous differentials and R is generated by `(dβ(n),−β(n)⊗n)` and `(0,1⊗f♯(m)) ((3.2.7)-(3.2.8))`; it is a finite B-module, complete for its natural topology, d is continuous, and `(Ω^log_{B/A},d,δ)` is universal among (A,M,α)-derivations of `(B,N,β)` into complete topological B-modules (Proposition 3.2.9). For a strict homomorphism of log Huber rings, `Der^log_A(B,L)→Der_A(B,L)` is bijective and `Ω_{B/A}≅Ω^log_{B/A}` (Lemma 3.2.10).

f is tft, including the finite generation of `N^gp/((f♯M)^gp·β⁻¹(B×))`; the unrestricted algebraic Kähler module is not the analytic carrier.

A is of noetherian type (Huber's standing assumption (1.1.1)), as presupposed by DLLZ's use of Huber's continuous differentials (1.6.2) and needed for finite B-modules to be complete; all DLLZ applications are locally noetherian.

R0 (continuous differentials) uses the opposite diagonal convention `1⊗b−b⊗1`. Identify its representing module with the present ordinary summand by negating that diagonal generator; retain `dβ(n)=β(n)δ(n)` for the universal derivation.

Build `Ω^log` as `J/J²` from the completed tensor product and the monoid algebra; d is an A-linear derivation and `δ` a monoid map with the relations of Definition 3.2.2.

Identify `J/J²` with the presentation (3.2.7)-(3.2.8) over the imported continuous `Ω_{B/A}`; finiteness gives completeness and continuity of d.

Universal property: with `d(b)=b⊗1−1⊗b` and `δ(n)=e^n−1`, a log derivation `(d,δ)` into L gives the square-zero lift `b₁⊗b₂↦(b₁b₂,b₂d(b₁))`, `e^n↦(1,δ(n))`. The two terms of each structural relation then have equal second coordinate `dβ(n)=β(n)δ(n)`, and the induced `J/J²→L` sends the universal d to d, without a sign reversal (Proposition 3.2.9, with the indicated sign convention).

Strict case: every `n∈N` is a unit times f♯(m), so `δ` is determined by d (Lemma 3.2.10).

For formally log unramified `B→C`, uniqueness of lifts gives an injective restriction `Der^log_A(C,H)→Der^log_A(B,H)`. Its kernel `Der^log_B(C,H)` is zero for every H, hence the representing module `Ω^log_{C/B}` is zero. Surjectivity and left splitting belong to the formally log smooth clause (Theorem 3.2.18, with the indicated sign convention).

The interface consists of the following named results.

- `TauCeti.LogAdic.ContinuousLogDifferentials`: The complete representing module with d and dlog.
- `TauCeti.LogAdic.ContinuousLogDifferentials.lift`: Continuous B-linear maps out correspond bijectively to continuous log derivations.
- `TauCeti.LogAdic.ContinuousLogDifferentials.lift_unique`: A map is determined by values on d(b) and dlog(n).
- `TauCeti.LogAdic.ContinuousLogDifferentials.strict`: For a strict map the module identifies with the imported continuous `Ω¹_{B/A}`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.presentation`: `Ω^log_{B/A}≅(Ω_{B/A}⊕(B⊗_ℤN^gp))/R` with R generated by `(dβ(n),−β(n)⊗n)` and `(0,1⊗f♯(m)) ((3.2.7)-(3.2.8))`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.finite`: `Ω^log_{B/A}` is a finite B-module, complete and Hausdorff for its natural topology, and d is continuous.
- `TauCeti.LogAdic.ContinuousLogDifferentials.dlog_unit`: If `β(n)` is a unit then `δ(n)=β(n)⁻¹·d(β(n))`; `δ(f♯(m))=0`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.exact_sequence`: For tft `(A,M)→(B,N)→(C,O)`, `C⊗_BΩ^log_{B/A}→Ω^log_{C/A}→Ω^log_{C/B}→0` is exact; it is split exact on the left when `B→C` is formally log smooth for first-order log thickenings, `Ω^log_{C/B}=0` when `B→C` is formally log unramified, and the converses hold when C is formally log smooth over A (Theorem 3.2.18, Definitions 3.2.11 and 3.2.14).
- `TauCeti.LogAdic.ContinuousLogDifferentials.monoidAlgebra`: For fine monoids `u:P→Q` with `ker(u^gp)` and the torsion of `coker(u^gp)` (resp. `coker(u^gp)`) finite of order invertible in R, R⟨Q⟩ is formally log smooth (resp. log étale) over R⟨P⟩ and `δ` induces `Ω^log_{R⟨Q⟩/R⟨P⟩}≅R⟨Q⟩⊗_ℤ(Q^gp/u^gp(P^gp))`, a finite free R⟨Q⟩-module because the torsion of the cokernel has order invertible in R (Proposition 3.2.25).

**Checks.**

- `TauCeti.LogAdic.ContinuousLogDifferentials.identity`: For the identity log Huber map the module is zero.
- `TauCeti.LogAdic.ContinuousLogDifferentials.toric_rank`: Over k, `Ω¹_log` of `k⟨T₁,…,T_r⟩` with coordinate log structure is free on `dlog T_i`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.coordinate_relation`: In that module `dT_i=T_i dlog T_i`; imposing `dlog T_i=0` at `T_i=0` is incorrect.
- `TauCeti.LogAdic.ContinuousLogDifferentials.diagonal_sign`: For the coordinate chart T, use `d(T)=T·δ(1)`. The square-zero lift of `T⊗1−1⊗T` has second component d(T), while `e^1−1` has `δ(1)`. The alternative lift `b₁⊗b₂↦(b₁b₂,b₁d(b₂))` gives `−d(T)` and fails the structural relation when `d(T)≠0` in characteristic zero.
- Its rank on a log toric n-disc is n, including along the boundary.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.4, p. 26: Defines tft homomorphisms of pre-log Huber rings, including the finite generation condition on `N^gp` kept in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), (3.2.7)-(3.2.8), p. 27: Gives the presentation of `Ω^log_{B/A}` over Huber's continuous differentials stated here; the following sentence deduces finiteness and completeness. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.2.9, p. 27: States the universal property among derivations into complete topological B-modules. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 3.2.10, p. 28: The strict comparison `Ω_{B/A}≅Ω^log_{B/A}` stated here.

*Needs:* [6.8](#section-6-8); `CrystallineCohomology` CR.5 (log differentials); `AdicSpacesPartII` R0 (continuous differentials); `AdicSpacesPartII` R0 (completed tensor product); `AdicSpacesPartII` R0 (first fundamental sequence).

Applications include DLLZ-adic Construction 3.3.4: Descent glues the affine module; DLLZ-RH Corollary 2.4.2: The log de Rham complex uses the locally free module.

<a id="section-6-10"></a>

### 6.10 Analytic log differentials and transitivity

Prove `TauCeti.LogAdic.log_differential_descent`. For an lft morphism `f:Y→X` of locally noetherian coherent log adic spaces, the modules `Ω^log_{B/A}` of étale affinoid charts of f by noetherian affinoids inducing tft maps of log Huber rings glue, by étale descent of coherent sheaves, to a coherent `O_{Y_ét}-module Ω^log_{Y/X}` with a derivation `(d_{Y/X},δ_{Y/X})`, `δ_{Y/X}:M_Y→Ω^log_{Y/X}`, that is universal among derivations of Y over X into sheaves of complete topological `O_{Y_ét}`-modules and restricts to `Ω^log_{V/U}` on affinoid `V→U` in `Y_ét`, `X_ét` (Constructions 3.3.2-3.3.4, Lemmas 3.3.3 and 3.3.5). (1) For a cartesian square in the category of locally noetherian coherent (resp. fine, resp. fs) log adic spaces with `Y→X` lft and base change `Y′→X′`, the pullback of `Ω^log_{Y/X}` to Y′ is `Ω^log_{Y′/X′}` (Proposition 3.3.7). (2) For lft `Y→X→S` of locally noetherian coherent log adic spaces, `f*Ω^log_{X/S}→Ω^log_{Y/S}→Ω^log_{Y/X}→0` is exact (Theorem 3.3.17(1)). (3) For f log smooth between locally noetherian fs log adic spaces, `f*Ω^log_{X/S}→Ω^log_{Y/S}` is injective and `Ω^log_{Y/X}` is locally free of rank equal to the rank of `Q^gp/u^gp(P^gp)` for a chart u as in Definition 3.1.1; for f log étale, `f*Ω^log_{X/S}≅Ω^log_{Y/S}` and `Ω^log_{Y/X}=0`; if X, Y, S are fs and `g∘f` is log smooth, the converses hold; if g is log étale, `Ω^log_{Y/S}≅Ω^log_{Y/X}` and f is log smooth (log étale) iff `g∘f` is (Theorem 3.3.17(2)-(5)). (4) An lft morphism of locally noetherian fs log adic spaces is formally log smooth (formally log étale), i.e. has étale-locally at least one (exactly one) lift along strict first-order log thickenings (Definitions 3.3.8, 3.3.10), exactly when it is log smooth (log étale) in the chart sense (Proposition 3.3.16).

`Ω^log_{Y/X}` is defined for lft morphisms of locally noetherian coherent log adic spaces; parts (3)-(4) need fs log adic spaces, and fs products and pullbacks are the fs fibre products of [6.6](#section-6-6).

The injection in (3) is not asserted split as a map of sheaves; DLLZ prove splitting at the ring level (Theorem 3.2.18(2)), and local splitting follows from local freeness of `Ω^log_{Y/X}`.

Affinoid construction: Theorem 3.2.18 identifies `Ω^log_{C/A}` with `C⊗_BΩ^log_{B/A}` on each `Spa(C,C⁺)∈Y_ét`, giving a coherent sheaf with a universal derivation (Construction 3.3.2, Lemma 3.3.3); glue over finitely indexed étale affinoid coverings `{X_i→X}`, `{Y_i→Y}` from Proposition 2.3.21 by étale descent of coherent sheaves ([6.1](#section-6-1); Construction 3.3.4, Lemma 3.3.5).

Base change: compare `Der^log` for `B′=B⊗̂_A A′` (resp. its integral or saturated modification) using Remark 3.2.3 and the arguments of Ogus IV.1.1.3 and IV.1.1.9, with `(Q′)^gp=((Q′)^int)^gp=((Q′)^sat)^gp` (Proposition 3.3.7). The representing adjunction is `Hom_{B′}(B′⊗_BΩ,L)=Hom_B(Ω,L)`, with L regarded by restriction as a B-module; there is no extra tensor by B′ on the right.

Transitivity, injectivity and vanishing: globalise Theorem 3.2.18(1)-(5) and use the toric computation of Proposition 3.2.25 with Proposition 3.3.7 (Theorem 3.3.17). Formal log unramifiedness uses injectivity of the derivation restriction and zero kernel, not the surjectivity belonging to formal log smoothness.

Formal versus chart log smoothness: chart log smooth maps are formally log smooth by Proposition 3.2.25 and Remark 3.3.13; conversely Lemma 3.3.15 (local freeness for formally log smooth maps) yields an fs chart from elements `t_i` with `δ(t_i)` a basis, and Lemma 3.3.14 makes the strict comparison map étale (Proposition 3.3.16). The chart maps its free generators to `t_i` in the log monoid, whose `δ(t_i)` form the differential basis, not to elements of the differential module (using the log-monoid chart).

**Checks.**

- A strict étale pullback preserves `Ω¹_log`.
- A Kummer étale coordinate root has relative `Ω¹_log=0` after its index is invertible.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Construction 3.3.2, Lemma 3.3.3, Construction 3.3.4 and Lemma 3.3.5, pp. 34–35: Construction 3.3.4 glues the affinoid log differentials by étale descent; Lemma 3.3.5 extends the definition to lft morphisms of locally noetherian coherent log adic spaces, as stated here. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.3.7, pp. 35-36: Base change of `Ω^log` along any cartesian square in the coherent, fine or fs category with `Y→X` lft; the statement states this, not a log-étale base change. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.3.16, p. 38: The equivalence of formal and chart log smoothness for lft morphisms of locally noetherian fs log adic spaces, part (4) of the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 3.3.17, pp. 39-40: Part (1) is the right-exact transitivity sequence; parts (2)-(5) give injectivity and local freeness (with the rank formula) for log smooth f, vanishing for log étale f and the converses, as in the statement.

*Needs:* [6.9](#section-6-9); [6.7](#section-6-7); [6.6](#section-6-6); AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (coherent sheaf operations); AdicSpacesPartIII R3 (sheaf of continuous differentials); [6.1](#section-6-1); AdicSpacesPartIII R3 (tate kiehl affinoid); AdicSpacesPartIII R3 (locally free sheaf).

<a id="section-6-11"></a>

### 6.11 Analytic log de Rham complexes and residues

Construct `TauCeti.LogAdic.AnalyticLogDR`. Let `X→S` be a log smooth morphism of locally noetherian fs log adic spaces. Then `Ω^log_{X/S}` is locally free of finite rank and `Ω^{log,a}_{X/S}:=∧^aΩ^log_{X/S}` (DLLZ-adic Definition 3.3.19); d extends to a graded differential on `Ω^{log,•}_{X/S}` with `d(δ(m))=0`, which is the ordinary continuous de Rham complex for trivial log structures. For X log smooth over k, a log connection on a coherent `O_X-module E` is a k-linear map `∇:E→E⊗_{O_X}Ω^log_X` satisfying the Leibniz rule; it is integrable if `∇²=0`, and then `DR_log(E)=(E⊗_{O_X}Ω^{log,•}_X,∇)` is the log de Rham complex, with log de Rham cohomology H^i(X,DR_log(E)) (DLLZ-RH Definition 3.1.7(4)); the S-linear relative version is defined in the same way. If X is a smooth rigid analytic variety over k with a normal crossings divisor D (DLLZ-RH Example 2.1.2), F a vector bundle with an integrable log connection `∇` and Z an irreducible component of D, then after shrinking X so that Z is smooth and connected, and enlarging k so that a smooth toric chart has `Z={T₁=0}`, `Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁` is an O_Z-linear endomorphism of `F|_Z`, independent of the coordinate and compatible with rational localisation (DLLZ-RH (3.4.1)); on forms, contraction with T₁∂/∂T₁ followed by restriction to Z sends dlog T₁ to 1 and `dlog T_j (j≠1)` and all `dT_j` to 0. For a morphism `h:Y→X` of such log adic spaces, E the boundary of Y and `m_{WZ}` the multiplicity of a component W of E in `h⁻¹(Z)`, Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}·h_{WZ}*Res_Z(∇) (DLLZ-RH Theorem 3.2.3(4) and proof of Corollary 3.5.7).

DLLZ-RH Definition 3.1.7(4) imposes only k-linearity and the Leibniz rule; continuity of `∇` for coherent E on affinoids follows from the Leibniz rule, the continuity of d and the open mapping property of finite modules, so it is not an extra condition. Unrestricted algebraic modules are not the carrier.

Residues are taken along irreducible components of a normal crossings divisor (components via the normalisation of D); for a smooth pair of AdicSpacesPartIV R4 the charts exist over k itself, so k need not be enlarged; R4 imposes no condition on irreducible components (a component may be singular, e.g. an analytically split node), so X is still shrunk to make Z smooth. DLLZ-RH work over p-adic fields in §3, but the residue construction uses only smooth toric charts.

Exterior powers and differential: take `∧^a` of the locally free `Ω^log_{X/S} `([6.10](#section-6-10)) and extend d by the graded Leibniz rule with `d(δ(m))=0`, locally on charts where `Ω^log` is free on the `δ` of chart elements; for trivial log structures this is AdicSpacesPartIII R3 (f).

Coefficient complex: the CR.5 formalism of integrable log connections applies to coherent modules on X_an (DLLZ-RH Definition 3.1.7(4)).

Residues: define `Res_Z(∇)` on a smooth toric chart and check independence of T₁ under `T₁↦uT₁`, u a unit, since `dlog(uT₁)=dlog T₁+dlog u` and dlog u restricts to a regular form (DLLZ-RH §3.4).

Pullback: locally `h*T₁=u·∏_W s_W^{m_{WZ}}` with u a unit, so `h*dlog T₁=Σ m_{WZ} dlog s_W+dlog u`, giving the residue formula (proof of DLLZ-RH Corollary 3.5.7).

The interface consists of the following named results.

- `TauCeti.LogAdic.AnalyticLogDR`: The cohomological continuous coefficient log de Rham complex.
- `TauCeti.LogAdic.AnalyticLogDR.d_sq`: Successive differentials compose to zero by integrability.
- `TauCeti.LogAdic.AnalyticLogDR.residue`: The residue along an irreducible boundary component Z: `Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁` on `F|_Z`, and on forms the map `Ω^log_X|_Z→O_Z`, `dlog T₁↦1`.
- `TauCeti.LogAdic.AnalyticLogDR.pullback_residue`: Residues transform by the integer boundary-multiplicity matrix: `Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}h_{WZ}*Res_Z(∇)`.
- `TauCeti.LogAdic.AnalyticLogDR.forms`: `Ω^{log,a}_{X/S}=∧^aΩ^log_{X/S}` for log smooth `X→S`, with the graded differential extending d and `d(δ(m))=0` (DLLZ-adic Definition 3.3.19).
- `TauCeti.LogAdic.AnalyticLogDR.leibniz`: ∇(fe)=f∇(e)+e⊗df for sections f of `O_X` and e of E, extended to `E⊗Ω^{log,•}` by the graded Leibniz rule.
- `TauCeti.LogAdic.AnalyticLogDR.residue_independent`: `Res_Z(∇)` does not depend on the local equation T₁ of Z and is compatible with rational localisation (DLLZ-RH §3.4).

**Checks.**

- `TauCeti.LogAdic.AnalyticLogDR.empty_boundary`: With trivial log structure this is the ordinary continuous de Rham complex.
- `TauCeti.LogAdic.AnalyticLogDR.residue_coordinate`: res_{T=0}(dlog T)=1, while res(dT)=0.
- `TauCeti.LogAdic.AnalyticLogDR.root_pullback`: Under `T=S^n`, pullback `dlog T=n dlog S` and its residue is n.
- The degree-zero term is E and its first differential is `∇`.
- The residue of dT₁ along `T₁=0` is 0, since `dT₁=T₁ dlog T₁`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.3.19, p. 40: Defines `Ω^{log,a}_{X/S}` as exterior powers of the locally free `Ω^log_{X/S}` for log smooth `X→S`, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(4), p. 24: Defines log connections on coherent sheaves, integrability `∇²=0`, the log de Rham complex and its cohomology; no continuity condition is imposed. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.4, (3.4.1), p. 33: Defines `Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁` along an irreducible component of a normal crossings divisor, independent of the coordinate, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(4), p. 25, and proof of Corollary 3.5.7, p. 40: The pullback formula `Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}h_{WZ}*Res_Z(∇)`, with `m_{WZ}` the multiplicity of W in `h⁻¹(Z)` defined in Theorem 3.2.3(4).

*Needs:* [6.10](#section-6-10); [6.5](#section-6-5); [6.7](#section-6-7); `CrystallineCohomology` CR.5 (log de rham); AdicSpacesPartIII R3 (sheaf of continuous differentials); AdicSpacesPartIII R3 (coherent sheaf operations).

Applications include DLLZ-RH Corollary 2.4.2: The period Poincaré resolution is a coefficient log complex; DLLZ-RH Corollary 3.5.7: Pullback residue normalization controls base change.

<a id="section-6-12"></a>

### 6.12 Kummer étale maps: charts, the log-étale characterisation, cancellation and openness

Prove `TauCeti.LogAdic.kummerEtale_theory`. Let f: `Y → X` be a morphism of locally noetherian fs log adic spaces, and define Kummer maps (injective on sharp characteristic stalks, every element of the target having a positive power in the image) and the Kummer étale maps (Kummer and log étale) as `TauCeti.LogAdic.IsKummer` and `TauCeti.LogAdic.IsKummerEtale`, with log étaleness as in [6.7](#section-6-7). (1) f is Kummer étale (resp. finite Kummer étale) if and only if, étale locally on X and Y (resp. étale locally on X), it admits an fs chart u: `P → Q` that is a Kummer homomorphism with `Q^gp/u^gp(P^gp)` finite of order invertible in `O_Y`, such that `Y → X ×_{X⟨P⟩} X⟨Q⟩` is étale (resp. finite étale); the chart may be chosen with a prescribed sharp torsion-free chart P of X and with Q sharp. (2) f is Kummer étale if and only if it is log étale and Kummer, if and only if it is log étale and exact; it is finite Kummer étale if and only if it is log étale and finite Kummer. (3) For Kummer étale f, every characteristic stalk map `M̄_{X,f(y)} → M̄_{Y,y}` is a Kummer homomorphism of sharp fs monoids whose group cokernel has order invertible in `O_{Y,y}`. (4) If `f = g∘h` with f and g Kummer étale, then h is Kummer étale. (5) Kummer étale morphisms are open. (6) Strictly étale morphisms are Kummer étale. (7) Kummer étale (resp. finite Kummer étale) morphisms are stable under composition and under fs base change along arbitrary morphisms of locally noetherian fs log adic spaces; the Kummer étale site of [6.15](#section-6-15) is formed from them.

X, Y locally noetherian fs; fs fibre products as in [6.6](#section-6-6). The index condition is invertibility of the cokernel order in `O_Y`, not in `O⁺_Y`; the order and the exponent of the cokernel have the same prime divisors.

(1) Lemma 4.1.10 re-charts a Kummer étale map with a prescribed P, and the chart criterion of log étaleness ([6.7](#section-6-7), Proposition 3.1.4) gives the étale map to the chart fibre product.

(2) Lemma 4.1.13: a log étale exact map has, étale locally, an injective chart from the log étale chart criterion (Propositions 2.3.13, 3.1.4), which exactness makes Kummer; in the finite case pass to the prime-to-p part of Q.

(3) Lemma 4.1.11 (2) and Remark 4.1.4 (Kummer maps are exact).

(4) Proposition 4.1.15, from the cancellation of log étale maps (Theorem 3.3.17 (5)) and stalkwise Kummer maps.

(5) Corollary 4.1.9, from standard covers and strictly étale maps; (6) Remark 4.1.17 (1).

(7) Proposition 4.1.14: composition by the chart criterion of log étaleness (Proposition 3.1.6), Lemma 4.1.13 and the stability of exactness under composition; base change because the saturated pushout of a Kummer chart map `P → Q` along `P → R` is again Kummer, with the same index.

The interface consists of the following named results.

- `TauCeti.LogAdic.IsKummer`, `TauCeti.LogAdic.IsKummerEtale`: the characteristic-stalk Kummer condition and its conjunction with log étaleness, stable under identity and restriction.
- `TauCeti.LogAdic.kummerEtale_iff_chart`: the chart description, with the index invertible in `O_Y`.
- `TauCeti.LogAdic.kummerEtale_rootChart`: Lemma 4.1.10's choice of chart with prescribed P and sharp Q.
- `TauCeti.LogAdic.kummerEtale_iff_logEtale_exact`: Kummer étale iff log étale and Kummer iff log étale and exact.
- `TauCeti.LogAdic.kummerEtale_stalk`: stalkwise Kummer homomorphisms with invertible index.
- `TauCeti.LogAdic.kummerEtale_of_comp`: cancellation.
- `TauCeti.LogAdic.kummerEtale_isOpenMap`: openness.
- `TauCeti.LogAdic.kummerEtale_of_strictEtale`: strictly étale maps are Kummer étale.
- `TauCeti.LogAdic.kummerEtale_comp`, `TauCeti.LogAdic.kummerEtale_baseChange`: stability under composition and fs base change, also for finite Kummer étale maps.

**Checks.**

- `TauCeti.LogAdic.kummerEtale_strict`: A strict Kummer étale map is ordinarily étale.
- `TauCeti.LogAdic.kummerEtale_root_char_zero`: `T = S^p` with coordinate log structures is Kummer étale over a characteristic-zero p-adic field: the index p must be invertible in `O_Y`, not in `O⁺_Y`.
- `TauCeti.LogAdic.kummerEtale_reject_root_char_p`: Over a field of characteristic p the same coordinate root map is not log étale, because the index p is not invertible in `O_X`.
- Trivial log structures give ordinary étale (resp. finite étale) morphisms.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.2 (1)–(2), p. 41: the chart form of Kummer and Kummer étale maps proved equivalent in (1). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemmas 4.1.10–4.1.11, pp. 43–44; Lemma 4.1.13, p. 45: re-charting, stalkwise Kummer maps and the log-étale characterisations. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.1.15, p. 46; Corollary 4.1.9, p. 43: cancellation and openness. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.1.14, p. 46: stability under composition and base change.

*Needs:* [6.7](#section-6-7); [6.6](#section-6-6); [6.10](#section-6-10); [6.2](#section-6-2); [6.4](#section-6-4); [6.0](#section-6-0); `CrystallineCohomology` CR.5:log-algebra (kummer morphism).

Applications include [6.13](#section-6-13) (standard Kummer covers), [6.15](#section-6-15) (generators of the Kummer étale topology) and DLLZ-adic §5.1 (finite Kummer étale maps are the eventual transition steps of pro-Kummer towers).

<a id="section-6-13"></a>

### 6.13 Finite root covers and their Galois group

Construct `TauCeti.LogAdic.RootCover`. Let X be a locally noetherian log adic space with a chart modeled on a torsion-free fs monoid P and `n≥1`. Put `X^{1/n}:=X×_{X⟨P⟩}X⟨(1/n)P⟩` with its chart (1/n)P, where P↪(1/n)P is isomorphic to `[n]:P→P`. More generally, for a Kummer homomorphism `u:P→Q` of fs monoids with `G:=Q^gp/u^gp(P^gp)` finite, `Y:=X×_{X⟨P⟩}X⟨Q⟩→X` is a finite surjective Kummer cover with an action of `G^D_X:=X⟨G⟩` such that `G^D_X×_X Y≃Y×_X Y`, and for affinoid X the sequence `0→O(X)→O(Y)→O(Y×_X Y)` is exact. When G is annihilated by an integer invertible in `O_X`, `Y→X` is an open Galois finite Kummer étale cover with group `G^D_X`, which is the constant group `Hom(G,O_X(X)^×)` when `O_X(X)` contains the relevant roots of unity; for `X^{1/n}` with `μ_n⊂O_X(X)` this is `Hom(((1/n)P)^gp/P^gp,μ_n)` acting on root monomials by characters. These `Y→X` are the standard Kummer (étale) covers. If X is noetherian with a sharp fs chart P, every quasi-compact Kummer étale (resp. finite Kummer étale) `Y→X` becomes étale (resp. finite étale) after base change to some `X^{1/n}`, and every Kummer étale covering indexed by a finite set is refined by one whose members `V_j` are étale over root covers `X^{1/n_j}`; n may be taken invertible on X when X has at most one positive residue characteristic.

X locally noetherian with a chart modeled on a torsion-free fs monoid P (Definition 4.1.5); the refinement statements (Lemmas 4.2.5–4.2.6) assume X noetherian with a sharp fs chart.

The Galois description needs the order of G invertible in `O_X`; the constant-group form needs the corresponding roots of unity in `O_X(X)`, otherwise `G^D_X` is only an étale group object.

A single root level strictifying `Y→X` requires Y quasi-compact (or an explicitly supplied uniform bound on its characteristic exponents). Finite `Y→X` over noetherian X satisfies this automatically. This extra hypothesis repairs Lemma 4.2.5, without restricting the objects of the Kummer étale site.

Monoid side from CR.5: (1/n)P, and `(Q⊕_P Q)^sat≃Q⊕G` for Kummer u ([Ill02, Lem. 3.3], as cited in Proposition 4.1.6).

Proposition 4.1.6: finiteness and injectivity of `O(X)→O(Y)` since Z[P] is a direct summand of the finite Z[P]-module Z[Q]; exactness in low degrees by [Niz08, Lem. 3.28]; the torsor isomorphism from `(Q⊕_P Q)^sat≃Q⊕G`; for |G| invertible, `R⟨Q⟩^Γ=R⟨P⟩` and the finite quotient construction of Lemma 4.1.7 give the Galois property and openness.

Lemma 4.3.2: the full Čech complex of a standard Kummer cover is exact, by the explicit contracting homotopy of [Niz08, Lem. 3.28] on `O(Y)⊗R[G]^{⊗•}`.

For quasi-compact Y choose finitely many chart neighbourhoods re-charted with the prescribed sharp P (Lemma 4.1.10), and choose one n with `P→Q_i→(1/n)P` for those charts. The saturated pushouts `(Q_i⊕_P(1/n)P)^sat≃G_i⊕(1/n)P` make the base change strictly étale; finiteness follows when `Y→X` is finite. For a finite-index covering of noetherian X, first refine by quasi-compact chart domains, take a finite subcover of their open images in X, and then apply the preceding argument. This proves the covering refinement of Lemma 4.2.6 without inferring quasi-compactness of Y from that of X.

The interface consists of the following named results.

- `TauCeti.LogAdic.RootCover`: The n-th root cover `X×_{X⟨P⟩}X⟨(1/n)P⟩` of a torsion-free fs chart, and more generally the standard cover `X×_{X⟨P⟩}X⟨Q⟩` of a Kummer chart `P→Q`.
- `TauCeti.LogAdic.RootCover.action`: `Hom((1/n)P^gp/P^gp,μ_n)` acts by multiplying the root monomial of a by its character.
- `TauCeti.LogAdic.RootCover.refine`: For n dividing m the m-th root cover maps to the n-th root cover, compatibly under divisibility composition.
- `TauCeti.LogAdic.RootCover.strictify`: For X noetherian with a sharp fs chart, every quasi-compact Kummer étale (resp. finite Kummer étale) `Y→X` becomes étale (resp. finite étale) after base change to some `X^{1/n}` (Lemma 4.2.5).
- `TauCeti.LogAdic.RootCover.finite_surjective`: The standard cover is finite and surjective, and finite Kummer étale when the order of G is invertible in `O_X` (Definition 4.1.5, Proposition 4.1.6(1)).
- `TauCeti.LogAdic.RootCover.galois`: `G^D_X×_X Y≃Y×_X Y`, and for |G| invertible `Y→X` is an open Galois finite Kummer étale cover with group `G^D_X` (Proposition 4.1.6(3)–(4)).
- `TauCeti.LogAdic.RootCover.cech_exact`: For affinoid X with a sharp chart the Čech complex `O(X)→O(Y)→O(Y×_X Y)→⋯` of a standard Kummer cover is exact, with an O(X)-linear contracting homotopy (Lemma 4.3.2).
- `TauCeti.LogAdic.RootCover.refine_covering`: A finitely indexed Kummer étale covering of a noetherian X with a sharp chart is refined by one whose members are étale over root covers `X^{1/n_j}` and become a strict étale covering over `X^{1/n}` (Lemma 4.2.6).

**Checks.**

- `TauCeti.LogAdic.RootCover.one`: The first root cover is X.
- `TauCeti.LogAdic.RootCover.disc_action`: For `P=N` and `μ_n` present, `ζ` sends S to `ζS` on `T=S^n`.
- `TauCeti.LogAdic.RootCover.ramified_boundary`: For `n>1` the root map on the log disc has ramification index n at `T=0` and is not strict étale there.
- `TauCeti.LogAdic.RootCover.polydisc_degree`: For `P=N^r` over an affinoid field k with n invertible in k and `μ_n⊂k`, `X^{1/n}→X` is finite of degree `n^r` with Galois group `μ_n^r` acting coordinatewise on `S_i`, `S_i^n=T_i`.
- `TauCeti.LogAdic.RootCover.no_uniform_noncompact`: Let X be a coordinate log disc over `C_p` and let Y be the disjoint union of its q-th root discs, indexed by all primes q. For any root level n choose q not dividing n: its saturated pullback still has characteristic index q/gcd(q,n)=q at the boundary, so Y cannot become strict étale at that single level. Quasi-compactness or a uniform exponent bound is essential.
- Do not call the cover ordinarily étale along its boundary.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.5, p. 41: The root cover `X^{1/n}=X×_{X⟨P⟩}X⟨(1/n)P⟩` for a torsion-free fs chart, finite Kummer étale when n is invertible. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.1.6, pp. 41–42; Definition 4.1.8, p. 43: The group object `G^D_X=X⟨G⟩` acting on `Y=X×_{X⟨P⟩}X⟨Q⟩`; parts (1)–(4) give finiteness, surjectivity, the torsor isomorphism and the Galois property used here. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.3.2, p. 52: Čech exactness of O for standard Kummer covers (api cech_exact), valid without the étale condition. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemmas 4.2.5–4.2.6, pp. 49–50: Lemma 4.2.6 (refinement by members étale over root covers); Lemma 4.2.5 just before it gives strictification after base change to `X^{1/n}`. The statement keeps the noetherian sharp-chart hypothesis. The strictification clause is restricted to quasi-compact Y; the finite covering refinement uses a finite quasi-compact chart refinement.

*Needs:* [6.12](#section-6-12); [6.4](#section-6-4); [6.6](#section-6-6); `AdicSpacesPartII` R0 (fibre products existence); `AdicSpacesPartII` R0 (finite algebra over affinoid); `AdicSpacesPartII` R0 (finite morphism); [6.3](#section-6-3).

Applications include DLLZ-adic §5.3: All-root inverse limits give the log perfectoid basis; DLLZ-RH §2.3: Characters of the chart group control periods and residues.

<a id="section-6-14"></a>

### 6.14 Characteristic ramification index

Define `TauCeti.LogAdic.RamificationIndex`. For a Kummer morphism `f:Y→X` of locally noetherian fs log adic spaces and a geometric point y of Y, the ramification index of f at y is the smallest positive integer n annihilating the finite group `coker(M̄^gp_{X,f(y)}→M̄^gp_{Y,y})`, i.e. its exponent, not its order. The ramification index of a Kummer étale f is the least common multiple of the indices at the geometric points of Y, when this exists (it is not always defined). For Kummer étale f the index at y is invertible in `O_{Y,y}`, and the ramification index of a Kummer étale f is 1 if and only if f is strictly étale.

f is Kummer; the cokernel is finite because the characteristic stalk map is a Kummer homomorphism of sharp fs monoids (Lemma 4.1.11(2)).

The index is an exponent: for `N^r→N^r`, a↦na, it is n although the cokernel has order `n^r`.

Lemma 4.1.11(2): `f_y^♯` is Kummer, so its group cokernel is finite and its exponent exists; for Kummer étale f the order, hence the exponent, is invertible in `O_{Y,y}`.

If every local index is 1, each `f_y^♯` is an injective Kummer map with trivial group cokernel; Kummer maps are exact (Remark 4.1.4), so `f_y^♯` is an isomorphism and f is strict.

For strict Kummer étale f the Kummer charts `M̄_{X,f(y)}→M̄_{Y,y}` of Lemmas 4.1.10 and 4.1.13 are isomorphisms, so `Y→X×_{X⟨P⟩}X⟨P⟩=X` is étale; conversely a strictly étale map has isomorphic characteristic stalks.

The interface consists of the following named results.

- `TauCeti.LogAdic.RamificationIndex`: The exponent of the characteristic group cokernel at the specified geometric point of a Kummer map.
- `TauCeti.LogAdic.RamificationIndex.index_one`: A Kummer étale map has index one at every geometric point iff it is strictly étale.
- `TauCeti.LogAdic.RamificationIndex.base_change`: Compute the index from the saturated base-changed characteristic map; it can decrease after root base change.
- `TauCeti.LogAdic.RamificationIndex.global`: The least common multiple of the local indices of a Kummer étale map, when it exists.
- `TauCeti.LogAdic.RamificationIndex.isUnit`: For Kummer étale f the local index at y is invertible in `O_{Y,y}` (Lemma 4.1.11(2)).

**Checks.**

- `TauCeti.LogAdic.RamificationIndex.identity`: The identity has index one.
- `TauCeti.LogAdic.RamificationIndex.two_coordinates`: Multiplication by n on `N²` has index n, since the cokernel is `(Z/n)²`.
- `TauCeti.LogAdic.RamificationIndex.off_boundary`: On the boundary complement the coordinate-root characteristic cokernel is zero and the index is one.
- `TauCeti.LogAdic.RamificationIndex.root_cover_strata`: For the n-th root cover of a chart modeled on `N^r`, the index at a point where exactly `s≥1` coordinates vanish is n (cokernel `(Z/n)^s`), and 1 where none vanish.
- A product of two n-th coordinate roots has index n, not `n²`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.12, p. 44: The local index is the exponent of the group cokernel of the characteristic stalk map (the cokernel uses group completions). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.12, p. 44: The global index (api global), including the caveat that it need not exist. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.12, p. 44: The index-one characterisation (api index_one); strictness is equivalent to index one. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.1.11(2) proof, p. 44: Invertibility of the cokernel order, hence of the local index, for Kummer étale f (api isUnit).

*Needs:* [6.12](#section-6-12); `CrystallineCohomology` CR.5:log-algebra (characteristic monoid).

Applications include DLLZ-adic Lemma 5.3.8: Divisibility of the limit characteristic removes finite Kummer ramification.

<a id="section-6-15"></a>

### 6.15 Structure sheaves and projections on the Kummer étale site

Construct `TauCeti.LogAdic.KummerEtaleSite` and prove `TauCeti.LogAdic.kummerEtaleSite_sheaves`. Let X be a locally noetherian fs log adic space with Kummer étale site `X_két` (Kummer étale objects over X, jointly surjective coverings and fs fibre products). (1) The topology is generated by surjective strictly étale maps and standard Kummer étale covers ([6.13](#section-6-13)). (2) `U ↦ O_U(U)`, `U ↦ O⁺_U(U)` and `U ↦ M_U(U)` are sheaves on `X_két`; for every morphism `Y → X` of locally noetherian fs log adic spaces, `Mor_X(−, Y)` is a sheaf on `X_két`. (3) If X is affinoid, `H^i(X_két, O) = 0` for `i > 0`. (4) Restricting log structures to étale objects gives `ε_ét`: `X_két → X_ét` and `ε_an`: `X_két → X_an`, with `O_{X_ét} ≅ Rε_ét,*O_{X_két}`, `O_{X_an} ≅ Rε_an,*O_{X_két}` and `ε_ét,*M_{X_két} ≅ M_X`. (5) A morphism f: `Y → X` induces `f_két`: `Y_két → X_két` with `f_két,*F(U) = F(U ×_X Y)` and an exact left adjoint `f_két^{−1}`, compatible with identities and composition. (6) Affinoids with global fs charts form a basis of `X_két` inducing an equivalence of topoi.

X locally noetherian fs; all topological points, including higher-rank points, count in joint surjectivity. (3) is for affinoid (hence noetherian) X; it is the case `F = O` of [6.16](#section-6-16).

(1) Remark 4.1.18. (2) Theorem 4.3.1 (1): étale sheafiness (coherent étale descent, [6.1](#section-6-1), Proposition A.10) and the refinement Lemma 4.2.6 reduce sheafiness of O to Čech exactness for standard Kummer covers (Lemma 4.3.2); `O⁺` is cut out by `|f(x)| ≤ 1`; Proposition 4.3.4 for M by strict localisation and exactness of `0 → P → Q ⇉ Q ⊕ G`; Proposition 4.3.5 writes `Mor(−, Y)` for affinoid charted Y as a fibre product of the sheaves `Hom(R, O)`, `Hom(P, M)` and `Hom(P, O)`.

(3) Theorem 4.3.1 (2) by Lemma 4.2.6 and Proposition A.10. (4) Corollary 4.3.3 and Proposition 4.3.4. (5) fs base change (Remark 4.1.17 (2)). (6) Lemma 4.3.10.

The interface consists of the following named results.

- `TauCeti.LogAdic.KummerEtaleSite`: Kummer étale objects and log morphisms over X, with jointly surjective covering families; identity, composition and fs base change satisfy the site axioms by 6.12.
- `TauCeti.LogAdic.kummerEtaleSite_generated`: generation by strictly étale maps and standard Kummer covers.
- `TauCeti.LogAdic.kummerEtaleSite_structureSheaves`: the sheaves O, `O⁺`, M on `X_két`.
- `TauCeti.LogAdic.kummerEtaleSite_representable`: `Mor_X(−, Y)` is a sheaf for every Y over X.
- `TauCeti.LogAdic.kummerEtaleSite_affinoid_acyclic`: `H^i(X_két, O) = 0` for affinoid X and `i > 0`.
- `TauCeti.LogAdic.kummerEtaleSite_epsilon`: `ε_ét`, `ε_an` with `Rε_*O = O` and `ε_ét,*M = M`.
- `TauCeti.LogAdic.kummerEtaleSite_pullback`: `f_két` with `f_két,*` and `f_két^{−1}`, coherent for composition.
- `TauCeti.LogAdic.kummerEtaleSite_chartBasis`: the basis of affinoids with global fs charts.

**Checks.**

- `TauCeti.LogAdic.kummerEtaleSite_root_is_cover`: For n invertible on the log disc D, the n-th root cover `D → D`, `T = S^n`, is a single-member covering, surjective also over `T = 0`.
- `TauCeti.LogAdic.kummerEtaleSite_no_closed_point_shortcut`: On the closed unit disc with trivial log structure, the open disc `⋃_{m≥1}{|T|^m ≤ |ϖ|}` and the circle `{|T| = 1}` cover every rank-one point but miss the rank-two point with |T| infinitesimally below 1, so this family is not a covering.
- `TauCeti.LogAdic.kummerEtaleSite_root_invariants`: For the n-th root cover of the log disc over k with n invertible in k and `μ_n ⊂ k`, the equaliser of `O(D) ⇉ O(D ×_D D)` is `k⟨S⟩^{μ_n} = k⟨S^n⟩ = k⟨T⟩`, as sheafiness of O requires.
- For trivial log structure, `ε_ét` is an isomorphism of sites and (4) is the identity.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remarks 4.1.17–4.1.18, p. 47: the projection `ε_ét`, the morphisms `f_két` and the generators of the topology. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.3.1, p. 52; Corollary 4.3.3 and Proposition 4.3.4, p. 53; Proposition 4.3.5, p. 54: sheafiness of O, `O⁺` and M, affinoid acyclicity of O, the projections, and representable sheaves. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.3.10: the basis of charted affinoids.

*Needs:* [6.12](#section-6-12); [6.13](#section-6-13); [6.2](#section-6-2); [6.1](#section-6-1); [6.0](#section-6-0); `AdicEtaleGeometry` A1 (etale site); `AdicEtaleGeometry` A1 (etale structure sheaf); `CategoryTheory.GrothendieckTopology`; `CategoryTheory.Sheaf`; `DiamondsAndVStacks` D0 (cech to derived comparison).

Applications include DLLZ-adic Theorem 6.2.1 (the primitive comparison uses cohomology on `X_két`).

<a id="section-6-16"></a>

### 6.16 Affinoid Kummer coherent acyclicity

Prove `TauCeti.LogAdic.kummer_coherent_acyclicity`. Let X be an affinoid noetherian fs log adic space. An `O_{X_két}`-module is analytic coherent if it is isomorphic to the inverse image of a coherent sheaf on `X_an`, and coherent if its restrictions to the members of some Kummer étale covering are analytic coherent. Then `H^i(X_két,F)=0` for all `i>0` if (1) F is analytic coherent, or (2) F is coherent and X is over an affinoid field `(k,k⁺)`. The analytic qualification and the field alternative are retained: no claim is made for every coherent module over an arbitrary affinoid base, and Kummer étale descent of coherent sheaves is not effective in general.

Use the two alternatives of DLLZ Theorem 4.3.7 and the definitions of Definition 4.3.6.

Reduce, by Lemma 4.2.6 and [6.1](#section-6-1) (Proposition A.10), to the Čech complex of a standard Kummer cover `Y→X` of an affinoid X with a sharp fs chart.

(1): Y, `Y×_X Y`, … are finite over X (Proposition 4.1.6), so `C•_F(Y/X)≃C•(Y/X)⊗_{O(X)}F(X)`, and the O(X)-linear contracting homotopy of Lemma 4.3.2 makes it exact.

(2): with a sharp chart P, reduce étale locally to `F|_U` analytic coherent for `U=X^{1/n}`, n invertible in k. After a finite separable extension adjoining `μ_n`, the acting group is `Γ=Hom(((1/n)P)^gp/P^gp,μ_n)`, the constant form of the diagonalizable group `G^D`, rather than its character group G. By (1) the higher cohomology on the Čech terms vanishes. Averaging over `Γ` contracts the positive-degree group cohomology of F(U), since `|Γ|` is invertible in k. This computation on strict étale stalks gives `R^jε_ét,*F=0` for `j>0` and descends to the original field.

Hence `R^jε_ét,*F=0` for `j>0` and `ε_ét,*F` is coherent on `X_ét`; this is étale local (Proposition 2.3.13), so `H^i(X_két,F)≅H^i(X_ét,ε_ét,*F)=0` by Proposition A.10.

**Checks.**

- For `F=O` recover Theorem 4.3.1.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.3.6(1), p. 55: Definition of analytic coherent `O_{X_két}`-modules; part (2) defines coherent ones Kummer étale locally. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.3.7(2), p. 55: The field alternative of the theorem, kept as a hypothesis of case (2). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.3.7, proof of (2), p. 56: The finite-group vanishing argument, repaired by using the character-dual action after adjoining roots of unity, proves case (2).

*Needs:* [6.15](#section-6-15); [6.13](#section-6-13); [6.1](#section-6-1); AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (tate kiehl affinoid); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (etale acyclicity of vector bundles); `DiamondsAndVStacks` D0 (cech to derived comparison).

<a id="section-6-17"></a>

### 6.17 Finite Kummer descent and the Kummer fundamental group

Prove `TauCeti.LogAdic.finite_kummer_descent`. Let X be a locally noetherian fs log adic space. (i) For locally of finite type morphisms, being log smooth, log étale or Kummer étale can be checked after a surjective Kummer étale base change, and descends along a surjective Kummer étale source map: for surjective Kummer étale f: `Y → X` and lft g: `X → S`, g has the property iff `g∘f` has. (ii) Kummer étale covers are effective descent morphisms for finite Kummer étale objects: for surjective Kummer étale f: `Y → X` and `Y̆ ∈ Y_fkét` with descent datum `pr₁^{−1}Y̆ ≃ pr₂^{−1}Y̆` satisfying the cocycle condition, there is a unique `X̆ ∈ X_fkét` with `Y̆ ≃ X̆ ×_X Y`. (iii) `Y ↦ Mor_X(−, Y)` is an equivalence `X_fkét ≃ Loc(X_két)` onto locally constant sheaves of finite sets, preserving fibre products and quotients by finite groups. (iv) Every geometric point has a log geometric point above it (complete separably closed l, characteristic monoid uniquely n-divisible for n invertible in l), and these form a conservative family of fibre functors; for connected X and a log geometric point `ζ`, `X_fkét` with `Y ↦ Mor_X(ζ, Y)` is a Galois category, and `X_fkét ≃ Loc(X_két) ≃ π₁^két(X, ζ)-FSets`. Consequently, locally constant sheaves of finite `Λ`-modules (`Λ` a finite ring) correspond to finite `Λ`-modules with continuous `π₁^két(X, ζ)`-action. Define `TauCeti.LogAdic.KummerLocalSystem` as a locally constant sheaf of finite sets or finite `Λ`-modules on this site. Prove the strict-local identification `π₁^két(X_(ξ), ξ̃) ≅ Hom(M̄^gp_{X,ξ}, Ẑ′(1)(l))`, where `ξ=Spa(l,l⁺)` is geometric and Ẑ′(1)(l) takes roots of orders invertible in l. Its API is the fibre equivalence with continuous finite representations, exactness for `Λ`-modules, pullback and change-of-base-point conjugacy. For `n≥1` invertible in `O_X`, construct the logarithmic Kummer boundary map and prove `R^iε_ét,*(ℤ/n) ≅ (∧^i(M̄^gp_X/nM̄^gp_X))(−i)` for every `i≥0`, with cup products and pullback compatibility. The twist is essential unless a root-of-unity basis is chosen.

X locally noetherian fs; the fundamental-group statements need X connected and a log geometric point (not an unlogged geometric point) as base point. The `Λ`-module form is a formal consequence of (iv) applied to module objects; DLLZ state the finite-set form.

Propositions 4.2.7–4.2.8 for (i): reduce by Lemma 4.2.6 to a root cover `X^{1/m} → X` with a global chart, and descend formal log étaleness through invariants of the Galois cover (Proposition 4.1.6). Construction 4.4.3 builds a log geometric point above a geometric point from the reduced fibres of the root covers; Lemma 4.4.4 gives fibre functors and conservativity. Theorem 4.4.12 for (ii): étale localise to a Galois standard Kummer étale cover, take invariants (Lemma 4.1.7), descend the log structure, verify the descent isomorphism on strict localisations (Proposition 4.4.9), and conclude with Lemma 4.1.13 and Proposition 4.2.8. Theorem 4.4.15 and Corollaries 4.4.13, 4.4.18 for (iii)–(iv).

**Checks.**

- For the rank-two log point, the direct images of `ℤ/n` have ranks 1, 2, 1 in degrees 0, 1, 2 and vanish above 2; with trivial log structure only degree 0 remains. These calculations also distinguish the local system of a nontrivial root character from the constant system.
- On an fs log point over a complete separably closed field l with characteristic monoid `ℕ^r`, `π₁^két ≅ Ẑ′(1)(l)^r`; over a general field it is an extension of Gal(k^sep/k) by this group, split for a split log point.
- For trivial log structure, `X_fkét` is the category of finite étale covers and `π₁^két` is the étale fundamental group.
- The n-th root cover of the log point with n invertible is a connected finite Kummer étale cover of degree n, although its underlying map of adic spaces is a homeomorphism.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Propositions 4.2.7–4.2.8, pp. 50–52: descent of log smoothness, log étaleness and Kummer étaleness. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.4.12, p. 60: effective descent of finite Kummer étale objects. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.4.15 (2), p. 62; Corollary 4.4.18, p. 63: the equivalence with locally constant sheaves and the Kummer fundamental group. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.4.9, pp.59–60, Example 4.4.24, pp.63–64, and Lemmas 4.4.27–4.4.29, pp.64–65: strict-local inertia, log points, and the logarithmic Kummer map and exterior-power direct images.

*Needs:* [6.15](#section-6-15); [6.13](#section-6-13); [6.7](#section-6-7); [6.10](#section-6-10); [6.12](#section-6-12); [6.0](#section-6-0).

<a id="section-6-18"></a>

### 6.18 Normal extension of finite étale covers across a normal crossings divisor

Prove `TauCeti.LogAdic.normal_extension_boundary`. Let X be a smooth rigid analytic variety over a nonarchimedean field k of characteristic zero, `D ⊂ X` a normal crossings divisor and `U = X − D`. (1) Every finite étale surjective h: `V → U` extends to a finite surjective morphism f: `Y → X` with Y a normal rigid analytic variety and `f^{−1}(U) = V`; Y is the normalization of X in V and is unique up to unique isomorphism. (2) (Riemann extension) For a normal rigid analytic variety W and a nowhere dense analytic subset `Z ⊂ W`, every bounded analytic function on `W − Z` extends uniquely to W; in particular locally constant functions extend, so for every affinoid open W of Y as in (1), `π₀(W ∩ f^{−1}(U)) = π₀(W)`. (3) (Root extraction) For a finite étale cover of degree at most d of a punctured polydisc `S × (D^r_ρ − {T₁⋯T_r = 0})` over an affinoid smooth S, with `ρ = p^{−b(d,p)}` for an explicit b(d, p) depending only on d and p, each coordinate `T_i` acquires a d_i-th root with `d_i ≤ d` on every connected component after a finite extension of k and a strictly finite étale cover of S.

`char k = 0`; X smooth; D normal crossings (étale locally `S × {T₁⋯T_r = 0} ⊂ S × D^r`). Nothing is assumed about h over D.

(1) Hansen's extension theorem for finite étale covers across a Zariski-closed nowhere dense subset (Hansen 2020, Theorem 1.6), based on Lütkebohmert's Riemann existence theorem (Lütkebohmert 1993, Theorem 3.1 and its proof); uniqueness because Y is normal and f is finite.

(2) Bartenwerfer's first Riemann extension theorem for bounded functions on normal rigid spaces (Bartenwerfer 1976, §3).

(3) Lütkebohmert 1993, Lemma 3.2 and Theorem 2.2, by induction on r restricting to the slices `S × D^{r−1} × {a}` with `|a| = ρ`.

**Checks.**

- For X the closed unit disc, `D = {0}` and `V → U` the n-th power map of the punctured disc, Y is the disc with the n-th root of the coordinate adjoined, and `Y → X` is ramified at 0.
- For `D = ∅`, (1) is the identity statement `Y = V`.
- (2) fails for unbounded functions: 1/T on the punctured disc does not extend.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.2.1 and its proof, p. 47: the extension to a normal finite ramified cover by Hansen's Theorem 1.6 (after Lütkebohmert's Theorem 3.1), and the basis of affinoids with `π₀(W ∩ f^{−1}(U)) = π₀(W)` by Bartenwerfer's extension of bounded functions. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.2.3 and its proof, p. 48: the root extraction with `d_i ≤ d` and `ρ = p^{−b(d,p)}`, b(d, p) as in Lütkebohmert's Theorem 2.2, by induction on r.

*Needs:* `AdicSpacesPartII` R0 (smooth morphism); `AdicSpacesPartII` R0 (finite morphism); AdicSpacesPartIII R3 (finite morphism coherent algebra equivalence); AdicSpacesPartIV R4 (smooth pair).

Applications include [6.19](#section-6-19) (the rigid logarithmic Abhyankar lemma).

<a id="section-6-19"></a>

### 6.19 Rigid logarithmic Abhyankar lemma

Prove `TauCeti.LogAdic.rigid_abhyankar`. Let X be a smooth rigid analytic variety over a nonarchimedean field k of characteristic zero, `D⊂X` a normal crossings divisor (étale locally, equivalently analytic locally after a finite separable extension of k, of the form `S×{T₁⋯T_m=0}⊂S×D^m`; strict normal crossings is a special case) with the fs log structure of Example 2.3.17, and `U=X−D`. Every finite étale surjective `h:V→U` extends to a finite surjective Kummer étale `f:Y→X`, where Y is a normal rigid analytic variety with the log structure defined by `f⁻¹(D)`; `Y_an` has a basis of affinoids W with `π₀(W∩f⁻¹(U))=π₀(W)`. Locally, on `X_ρ=S×D^r_ρ` with `ρ=p^{−b(d,p)}` and after a finite extension of k and a strictly finite étale cover of S, each component of `Y_ρ` is `S⟨Q⟩_ρ` for a toric Q with `N^r⊂Q⊂⊕_i(1/d_i)N`, `d_i≤d=deg f`, and the pullback of Y to `X_ρ^{1/m}`, `m=d!`, splits completely and so is strictly finite étale.

`char k=0`, X smooth, D normal crossings in the sense of Example 2.3.17; h finite étale surjective; nothing is assumed about h over D.

The splitting statement is local on X and holds after finite extension of k; the radius `ρ` depends only on d and p.

Extend h to a finite ramified cover by a normal rigid variety Y ([6.18](#section-6-18) (1): Hansen, after Lütkebohmert); the basis statement follows from the unique extension of bounded functions across f⁻¹(D) ([6.18](#section-6-18) (2), Bartenwerfer).

Kummer étaleness is analytic local on X up to finite extension of k: reduce to `X=S×D^r`, `D=S×{T₁⋯T_r=0}`, with chart `P=N^r`.

Lemma 4.2.3, by induction on r using [Lüt93, Lem. 3.2] to extract d_r-th roots of `T_r` over a punctured polydisc of radius `ρ` and [Bar76] to extend them, gives the cover-refinement hypothesis of Lemma 4.2.2 with `d_i≤d`.

Lemma 4.2.2: components of `Y_ρ` are quotients of `S⟨P′⟩_ρ` by subgroups of the Galois group of Proposition 4.1.6, hence `S⟨Q⟩_ρ` with Q toric, identified by normality and uniqueness of normal extensions; `(Q⊕_P(1/m)P)^sat` is (1/m)P times a finite group, giving the splitting.

**Checks.**

- The n-th root cover of the punctured disc extends as its log root cover, not as an ordinarily étale disc cover.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.2.1, p. 47: The extension statement; the proposition's hypotheses (smooth X over k of characteristic zero, D a normal crossings divisor) are kept, SNC being a special case. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.2.1, proof, p. 47: The external normal-extension input of proof step 1. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.2.3, p. 48: The bound `d_i≤d` and, in the same lemma, `ρ=p^{−b(d,p)}` and `m=d!`. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.2.2, p. 48: The local strictification after the root cover `X_ρ^{1/m}`.

*Needs:* [6.5](#section-6-5); [6.13](#section-6-13); [6.18](#section-6-18); AdicSpacesPartIII R3 (finite morphism coherent algebra equivalence).

<a id="section-6-20"></a>

### 6.20 Extension across a normal crossings boundary

Prove `TauCeti.LogAdic.boundary_local_system_extension`. Let X be a smooth rigid analytic variety over a nonarchimedean field k with `char(k)=0` and `k⁺=O_k`, `D⊂X` a normal crossings divisor with the log structure of Example 2.3.17, `U=X−D` and j:U↪X (so `U_két=U_ét`). For every torsion local system L on `U_ét`, `j_két,*L` is a torsion local system on `X_két` and `R^ij_két,*L=0` for `i>0`; hence `H^i(U_ét,L)≅H^i(X_két,j_két,*L)` for all `i≥0`. Conversely every torsion local system L̄ on `X_két` satisfies `L̄≅j_két,*j⁻¹L̄`, so restriction and `j_két,*` are inverse equivalences between torsion local systems on `X_két` and on `U_ét`. In particular `Z/n≅Rj_két,*(Z/n)`, `Rε_ét,*(Z/n)≅Rj_ét,*(Z/n)` and `R^ij_ét,*(Z/n)≅∧^i(M̄^gp_X/nM̄^gp_X)(−i)`. No properness is assumed; finiteness of cohomology is a separate statement for proper X.

`char k=0` and `k⁺=O_k`, as in Theorem 4.6.1; D normal crossings (strict normal crossings is a special case).

Corollary 4.6.7 is stated for F_p-local systems; its proof (`L̄→Rj_két,*j⁻¹L̄` is a map of local systems that is the identity on the dense open U) applies by the same dense-open rigidity argument to torsion local systems, which is the form recorded here.

Trivialise L on a finite étale cover `V→U` and extend it by rigid Abhyankar (Proposition 4.2.1) to a finite Kummer étale `Y→X` with Y normal; sections of constant torsion sheaves over the preimage of U extend uniquely over every Kummer étale `Y′→Y` (Example 2.2.20, Proposition 4.1.6, Corollary 4.1.9), so `j_két,*L` is constant on Y and a local system on X.

Étale locally take `X^{1/m}→X` as in Lemma 4.2.5 so that `Z=Y×_X X^{1/m}` is smooth with a normal crossings log structure and `Z→X` is Kummer étale; this reduces the vanishing to `L=Z/n`.

Lemma 4.6.2: `Rε_ét,*(Z/n)→Rj_ét,*(Z/n)` is an isomorphism, by Lemma 4.4.29 (in its twisted form) and, étale locally after algebraising D, Huber's comparison of algebraic and analytic étale cohomology [Hub96, Thm. 3.8.1] and the normal-crossings purity computation (`ClassicalAdicEtaleCohomology` §11.1), with log purity for schemes [Ill02, Thm. 7.2].

Lemma 4.6.5: the cone of `Z/n→Rj_két,*(Z/n)` has vanishing cohomology on every composite of an étale covering and a standard Kummer étale cover, by Lemma 4.6.2 applied to it; Corollary 4.6.7 then follows by adjunction.

**Checks.**

- For empty boundary this is the identity; this alone gives no finiteness statement for a nonproper disc.
- For the punctured unit disc and `L=Z/n`, `R^1j_ét,*(Z/n)` is `Z/n(−1)` supported at 0, while `R^1j_két,*(Z/n)=0`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.6.1, p. 68: The hypotheses of the purity theorem (including `k⁺=O_k`); its conclusion, `j_két,*L` a torsion local system with vanishing higher direct images, follows in the same sentence. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.6.1, proof, p. 69: The reduction to constant coefficients through root covers (proof steps 2–4). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.6.2, proof, p. 69: Lemma 4.6.2 rests on the higher-direct-image computation of Lemma 4.4.29 and the algebraic purity comparison. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 4.6.7, p. 69: The converse half of the equivalence, stated for `F_p` and extended here to torsion coefficients by the same proof.

*Needs:* [6.19](#section-6-19); [6.17](#section-6-17); [6.13](#section-6-13); [6.15](#section-6-15); [6.5](#section-6-5); [6.0](#section-6-0); `ClassicalAdicEtaleCohomology` §11.1 (Huber's nonproper algebraic comparison and `normal_crossings_open_comparison`); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (torsion local systems); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (local systems and finite etale covers); `DiamondsAndVStacks` D0 (cech to derived comparison).

<a id="section-6-21"></a>

### 6.21 Pro-Kummer étale presentations

Define `TauCeti.LogAdic.ProKummerPresentation`. Let X be a locally noetherian fs log adic space; objects of pro-X_két are cofiltered limits `U=lim_{i∈I}U_i` of objects of `X_két`, with `|U|:=lim|U_i|`. A morphism `U→V` of pro-X_két is Kummer étale (resp. finite Kummer étale, étale, finite étale) if it is the pullback along some `V→V₀` of a Kummer étale (resp. finite Kummer étale, strictly étale, strictly finite étale) morphism `U₀→V₀` of `X_két`; this is a condition on the pro-morphism, stronger than a property of `|U|→|V|`. `U→V` is pro-Kummer étale if `U=lim_i U_i` with each `U_i→V` Kummer étale and `U_j→U_i` finite Kummer étale and surjective for all sufficiently large i (a pro-Kummer étale presentation), and pro-finite Kummer étale if moreover all `U_i→V` are finite Kummer étale. All these classes are stable under base change (the fibre products exist and `|U×_V W|→|U|×_{|V|}|W|` is surjective); the finite-stage classes are stable under composition; pro-Kummer étale morphisms are open; over `W∈X_prokét`, composites of pro-Kummer étale morphisms are pro-Kummer étale with source in `X_prokét`; and finite limits exist in `X_prokét`.

Cofiltered small presentations as in [Sch13a, Prop. 3.2]; the eventual clause of Definition 5.1.1(2) ('for all `i≥i₀'`) is part of the definition, not a consequence of surjectivity of `|U|→|V|`.

Use the description of pro-C by cofiltered diagrams with `Mor(F,G)=lim_J colim_I Mor(F_i,G_j)`.

Lemma 5.1.4(1)–(7), following [Sch13a, Lem. 3.10], with Propositions 2.3.23, 2.3.27 and 2.3.32, Corollary 4.1.9 (openness) and Proposition 4.1.14 (base change).

Cofinal reindexing changes neither the pro-object nor the eventual condition.

The interface consists of the following named results.

- `TauCeti.LogAdic.ProKummerPresentation`: A cofiltered finite-level Kummer presentation with eventually finite surjective transitions.
- `TauCeti.LogAdic.ProKummerPresentation.reindex`: Cofinal reindexing represents the same pro-object.
- `TauCeti.LogAdic.ProKummerPresentation.base_change`: Base change of the finite-level presentation represents the fs pullback pro-object, and `|U×_V W|→|U|×_{|V|}|W|` is surjective (Lemma 5.1.4(1)).
- `TauCeti.LogAdic.ProKummerPresentation.comp`: Over `W∈X_prokét`, a composite `U→V→W` of pro-Kummer étale (resp. pro-finite Kummer étale) morphisms is pro-Kummer étale (resp. pro-finite Kummer étale) and U, V lie in `X_prokét` (Lemma 5.1.4(6)).
- `TauCeti.LogAdic.ProKummerPresentation.isOpenMap`: Pro-Kummer étale morphisms induce open maps of underlying spaces (Lemma 5.1.4(4)).
- `TauCeti.LogAdic.ProKummerPresentation.IsProFinite`: The presentation is pro-finite Kummer étale when every `U_i→V` is finite Kummer étale (Definition 5.1.1(3)).

**Checks.**

- `TauCeti.LogAdic.ProKummerPresentation.constant`: Every Kummer étale `U→X` in `X_két` is pro-Kummer étale via the one-term presentation.
- `TauCeti.LogAdic.ProKummerPresentation.root_tower`: For X with a global sharp fs chart P over a characteristic-zero field, the divisibility-indexed system of root covers `X^{1/m}` is a pro-finite Kummer étale presentation over X.
- `TauCeti.LogAdic.ProKummerPresentation.eventual_surjectivity`: On the closed unit disc X with trivial log structure, the system of rational discs `{|T|≤|ϖ|^n}` has no eventually surjective transitions, and its limit is not pro-Kummer étale over X under any presentation: its image `{T=0}` in |X| is not open, while pro-Kummer étale maps are open.
- A constant Kummer object is allowed; no perfectoid condition is required.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.1(1), p. 70: Finite-stage Kummer étale morphisms in the pro-category are pullbacks of morphisms of `X_két`. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.1(2), p. 70: The pro-Kummer étale presentation with its eventual finite surjective clause. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.1.4(4), p. 71: Openness (api isOpenMap), which excludes the shrinking-disc system of the non-example test. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.1.4(7), p. 71: Finite limits; parts (1), (2), (5), (6) give base change, composition and the surjective-pullback property.

*Needs:* [6.15](#section-6-15); [6.12](#section-6-12); `AdicEtaleGeometry` A1 (pro etale morphism).

Applications include DLLZ-adic Definition 5.1.2: Provides the objects of the pro-Kummer site; DLLZ-adic Definition 5.3.1: Adds sharp charts and perfectoid completion to this presentation.

<a id="section-6-22"></a>

### 6.22 Corrected transfinite pro-Kummer coverings

Define `TauCeti.LogAdic.CorrectedProKummerCover`. Let `U∈X_prokét`. A covering of U is a family of pro-Kummer étale morphisms `{f_a:U_a→U}` with `|U|=∪f_a(|U_a|)` such that each `f_a` is an inverse limit `U_a=lim_{μ<λ}U_μ→U` over the ordinals less than some ordinal `λ`, with every `U_μ∈X_prokét`, `U₀=U` the initial term, and, for each `μ<λ`, `U_μ→U_{<μ}:=lim_{μ′<μ}U_{μ′}` (limits over U, the empty one being U) the pullback of a Kummer étale morphism of `X_két`, and the pullback of a surjective finite Kummer étale morphism of `X_két` for all sufficiently large `μ`. This is DLLZ Definition 5.1.2, the log analogue of the transfinite covering condition of Scholze's corrigendum [Sch16] to the pro-étale site of [Sch13a]; 'corrected' refers to that corrigendum. These tower conditions, not arbitrary jointly surjective families of pro-Kummer étale morphisms, define the coverings; they are stable under base change and composition.

Use Definition 5.1.2(1)–(3) exactly, including the eventual surjective finite clause; joint surjectivity is on `|U|=lim|U_i|`, all points included.

Record the ordinal tower as data attached to each member of the family.

Base change (Lemma 5.1.4(8)): pull the tower back termwise (Lemma 5.1.4(1)); for surjectivity reduce to quasi-compact U, a finite covering, and then a single map.

Composition: concatenate the towers along the ordinal sum, the second tower starting at the limit of the first; the eventual clause holds in the tail of the second tower. DLLZ leave this implicit, as in [Sch16].

A jointly surjective family of `X_két` gives the two-term towers `U₀=U`, `U₁=U_a`; an ℕ-indexed surjective presentation gives a tower of type `ω`, using Lemma 5.1.4(5)–(6).

The interface consists of the following named results.

- `TauCeti.LogAdic.CorrectedProKummerCover`: A joint-surjectivity proof plus the ordinal tower conditions with eventual finite-surjective steps.
- `TauCeti.LogAdic.CorrectedProKummerCover.pullback`: Pullback of a certified cover is a certified cover (Lemma 5.1.4(8)).
- `TauCeti.LogAdic.CorrectedProKummerCover.refinement`: Composite coverings are coverings, certified by the ordinal-sum concatenation of towers with the same step conditions.
- `TauCeti.LogAdic.CorrectedProKummerCover.ofCountablePresentation`: A surjective pro-Kummer étale `U→V` with an ℕ-indexed presentation is a one-member covering, certified by a tower of type `ω`.

**Checks.**

- `TauCeti.LogAdic.CorrectedProKummerCover.identity`: The identity family is a cover.
- `TauCeti.LogAdic.CorrectedProKummerCover.finite_stage`: Every finite-stage jointly surjective Kummer étale family gives a cover of constant pro-objects.
- `TauCeti.LogAdic.CorrectedProKummerCover.need_tower`: On the closed unit disc X with trivial log structure, `{X−{0}→X, lim_n{|T|≤|ϖ|^n}→X}` is jointly surjective and each member is a transfinite limit of pullbacks of étale maps, but it is not a covering: the second tower never has surjective finite steps (and its limit is not pro-Kummer étale, its image not being open).
- `TauCeti.LogAdic.CorrectedProKummerCover.root_tower`: For X with a global sharp fs chart over a characteristic-zero field, `{lim_m X^{1/m}→X}` is a covering, certified by the ω-tower of the root covers `X^{1/n!}`.
- The covering family includes its transfinite presentation and transition conditions.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2, p. 70: The covering condition is introduced with an explicit reference to [Sch16]; the three conditions follow. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2(3), p. 70: The step condition of the ordinal tower, with its eventual surjective finite clause. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.1.4(8), p. 71: Pullback stability (api pullback). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Bibliography, [Sch16], p. 99: [Sch16] is Scholze's corrigendum, the source of the transfinite covering condition that the word 'corrected' refers to.

*Needs:* [6.21](#section-6-21); `AdicEtaleGeometry` A1 (corrected covers pretopology); `CategoryTheory.GrothendieckTopology`.

Applications include DLLZ-adic Proposition 5.1.5: Needed for the algebraic topos and qcqs basis; DLLZ-adic Proposition 5.3.13: Refinement is used for acyclic torsion covers.

<a id="section-6-23"></a>

### 6.23 The corrected pro-Kummer étale site

Construct `TauCeti.LogAdic.ProKummerEtaleSite`. For a locally noetherian fs log adic space X, `X_prokét` is the full subcategory of pro-X_két of objects pro-Kummer étale over X, with the coverings of Definition 5.1.2 (a pretopology: Lemma 5.1.4(8) and tower concatenation); finite limits exist. Objects with a pro-Kummer étale presentation by affinoids are quasi-compact and quasi-separated, generate `X_prokét` and are stable under fibre products; the topos is algebraic; U is quasi-compact (resp. quasi-separated) iff |U| is, likewise for morphisms; `X_prokét` is quasi-separated (resp. coherent) iff |X| is. Constant objects give the projection `ν:X_prokét→X_két`, and `f:Y→X` induces `f_prokét`. For trivial log structure `X_két=X_ét` (Remark 4.1.17) and `X_prokét` is the pro-étale site of [Sch13a] with the covering condition of [Sch16], not the naive covering definition; this comparison follows from the definitions and is not separately stated in DLLZ. The pro-finite Kummer étale site `X_profkét` has underlying category pro-X_fkét and transfinite-tower coverings by pro-finite Kummer étale maps (Definition 5.1.9); for a profinite group G, G-PFSets is the category of profinite sets with continuous G-action with the analogous coverings (Definition 5.1.10). If X is connected and `ζ` is a log geometric point, `U=lim_i U_i↦S(U)=lim_i Mor_X(ζ,U_i)` is an equivalence of sites `X_profkét≃π_1^két(X,ζ)-PFSets`, matching coverings (Proposition 5.1.12).

X locally noetherian fs, pro-objects and covers as the preceding definitions.

Definition 5.1.2 with Lemma 5.1.4(6)–(8) for the pretopology and finite limits.

Proposition 5.1.5 via openness of pro-Kummer étale maps (Lemma 5.1.4(4)) and the arguments of [Sch13a, Prop. 3.12] as corrected in [Sch16].

`ν` from the constant-object functor `X_két→X_prokét`, which preserves fibre products and coverings; `f_prokét` by base change of presentations (opening of §5.2).

Trivial log: compare categories (Remark 4.1.17(1)) and the covering conditions term by term.

Proposition 5.1.12: by Corollary 4.4.18, `X_fkét≃π_1^két(X,ζ)-FSets`; pass to pro-categories, use G-PFSets≃pro-(G-FSets) (Remark 5.1.11), and compare the covering conditions of Definitions 5.1.9 and 5.1.10.

The interface consists of the following named results.

- `TauCeti.LogAdic.ProKummerEtaleSite`: The category, the Definition 5.1.2 coverings and the qcqs basis.
- `TauCeti.LogAdic.ProKummerEtaleSite.nu`: The site morphism `ν` induced by constant Kummer objects.
- `TauCeti.LogAdic.ProKummerEtaleSite.pullback`: Fs log maps induce pullback functors on the pro-Kummer topoi.
- `TauCeti.LogAdic.ProKummerEtaleSite.trivial_log`: Trivial logs recover the corrected ordinary pro-étale site.
- `TauCeti.LogAdic.ProKummerEtaleSite.qcqs_basis`: Objects with affinoid pro-Kummer étale presentations are qcqs, generate the site and are stable under fibre products (Proposition 5.1.5(1)–(2)).
- `TauCeti.LogAdic.ProKummerEtaleSite.hasFiniteLimits`: `X_prokét` has all finite limits (Lemma 5.1.4(7)).
- `TauCeti.LogAdic.ProKummerEtaleSite.isQuasiCompact_iff`: An object (resp. morphism) is quasi-compact or quasi-separated iff its underlying space (resp. map) is (Proposition 5.1.5(4), (6)).
- `TauCeti.LogAdic.ProKummerEtaleSite.profinite_galois_equivalence`: For connected X with log geometric point `ζ`, `U=lim U_i↦lim_i Mor_X(ζ,U_i)` is an equivalence of sites `X_profkét≃π_1^két(X,ζ)-PFSets` compatible with coverings (Proposition 5.1.12).

**Checks.**

- `TauCeti.LogAdic.ProKummerEtaleSite.final_object`: Constant X is final in the site category.
- `TauCeti.LogAdic.ProKummerEtaleSite.constant_root`: A finite root cover of X gives a constant covering object of `X_prokét`.
- `TauCeti.LogAdic.ProKummerEtaleSite.ordinary_compatibility`: On a trivially logged X, the `ν` projection matches the ordinary corrected `ν` under the site equivalence.
- `TauCeti.LogAdic.ProKummerEtaleSite.log_point_root_tower`: For the split fs log point `s=(Spa(l,l⁺),N)` with l algebraically closed of characteristic zero, `π_1^két(s)≅Ẑ(1)` (Corollary 4.4.22), and the root tower `lim_m s^{1/m}` corresponds under Proposition 5.1.12 to Ẑ(1) with its translation action.
- Its structure sheaves are defined by inverse image, not ad hoc values on the completed perfectoid space.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2, p. 70: The underlying category; the coverings are those of [6.22](#section-6-22). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.5(1), p. 71: The qcqs basis of affinoid presentations (api qcqs_basis); parts (2)–(7) give generation, algebraicity and the topological qcqs criteria. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.5(7), p. 72: Coherence of the site in terms of |X|. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §5.1, p. 72: The projection `ν` (written `υ` in the source). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.9, p. 72: Defines the pro-finite Kummer étale site added to the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.12, p. 73: States the equivalence `X_profkét≃π_1^két(X,ζ)-PFSets`; its proof also matches the coverings.

*Needs:* [6.22](#section-6-22); [6.21](#section-6-21); [6.15](#section-6-15); `AdicEtaleGeometry` A1 (pro etale site corrected); `CategoryTheory.Sheaf`; [6.17](#section-6-17); `AdicEtaleGeometry` A1 (profinite g sets site).

Applications include DLLZ-RH §2.2: All period sheaves are defined on this site; DLLZ-adic Lemma 5.2.3 and Proposition 6.1.1: Pro-finite Kummer étale Galois covers are described by profinite π_1^két-sets.

<a id="section-6-24"></a>

### 6.24 Pro-Kummer projection and cohomological descent

Prove `TauCeti.LogAdic.log_site_projections`. Let X be a locally noetherian fs log adic space and `ν:X_prokét→X_két` the projection. For every abelian sheaf F on `X_két` and every qcqs `U=lim_i U_i` in `X_prokét` (presented as in Proposition 5.1.5(1)), `H^j(U_prokét,ν⁻¹F)=colim_i H^j(U_{i,két},F)` for all `j≥0`. The unit `F→Rν_*ν⁻¹F` is an isomorphism; hence ν⁻¹:Sh_Ab(X_két)→Sh_Ab(X_prokét) is fully faithful and `RΓ(X_két,F)≅RΓ(X_prokét,ν⁻¹F)`. The composites with `ε_ét:X_két→X_ét` and `X_ét→X_an` are the projections from `X_prokét` used in [6.30](#section-6-30)–[7.7](#section-7-7). In the setting of Theorem 4.6.1, for a torsion local system L on `U_ét`, `H^i(U_ét,L)≅H^i(X_két,j_két,*L)≅H^i(X_prokét,ν⁻¹j_két,*L)`. For a quasi-compact quasi-separated morphism `f:Y→X` of locally noetherian fs log adic spaces and every abelian sheaf F on `Y_két`, the adjunction morphism `ν_X⁻¹Rf_két,*(F)→Rf_prokét,*ν_Y⁻¹(F)` is an isomorphism (Proposition 5.2.1).

Use qcqs U and finite-level basis as in Proposition 5.1.6, not an unrestricted sections formula on arbitrary objects.

Proposition 5.1.6: as [Sch13a, Lem. 3.16], using that affinoid presentations give a qcqs generating family stable under fibre products (Proposition 5.1.5(1)–(2)), so cohomology of qcqs objects commutes with the cofiltered limit.

Proposition 5.1.7: `R^jν_*ν⁻¹F` is the sheaf associated with `U↦H^j(U_prokét,ν⁻¹F)`; for `j=0` Proposition 5.1.6 gives F, for `j>0` Kummer étale cohomology classes vanish locally. Corollary 5.1.8 follows.

Compose with Theorem 4.6.1 and Corollary 4.6.7 ([6.20](#section-6-20)) for the boundary statement.

Proposition 5.2.1: the i-th cohomology sheaves of both sides of the adjunction morphism are the sheafification of the presheaf `U=lim_j U_j↦colim_j H^i(U_j×_X Y,F)` on qcqs U in `X_prokét` (Proposition 5.1.6 on Y and quasi-compactness of f).

**Checks.**

- Constant torsion sheaves have the same Kummer and pro-Kummer cohomology.
- For `f=id_X`, Proposition 5.2.1 reduces to `ν⁻¹F≅ν⁻¹F`; for `X=Spa(k,O_k)` with k algebraically closed it identifies `ν⁻¹` of the constant sheaf `H^i(Y_két,F)` with R^if_prokét,*ν⁻¹F.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.6, proof, p. 72: Proof of the colimit formula for qcqs U, which the statement keeps restricted to qcqs objects. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.7, p. 72: The unit isomorphism. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 5.1.8, p. 72: Full faithfulness of `ν⁻¹`. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.2.1, p. 73: Hypothesis of the base-change isomorphism `ν_X⁻¹Rf_két,*≅Rf_prokét,*ν_Y⁻¹` added to the statement; f must be qcqs. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Proposition 5.2.1, p. 73: The proof the statement follows: both sides compute the sheafified colimit of finite-level cohomology.

*Needs:* [6.23](#section-6-23); [6.15](#section-6-15); [6.20](#section-6-20); `AdicEtaleGeometry` A1 (proetale projection nu); `DiamondsAndVStacks` D0 (quasicompact objects in a topos); `DiamondsAndVStacks` D0 (filtered colimits and cohomology on coherent sites); `DiamondsAndVStacks` D0 (cech to derived comparison).

<a id="section-6-25"></a>

### 6.25 The Cartan–Leray spectral sequence for pro-finite Kummer Galois covers

Prove `TauCeti.LogAdic.kummer_cartan_leray`. Let X be a connected locally noetherian fs log adic space, `V ∈ X_prokét`, and `Ṽ = lim_j Ṽ_j → V` a pro-finite Kummer étale cover that is Galois with profinite group `Γ = lim_j Γ_j` (each `Ṽ_j → V` finite Kummer étale Galois with group `Γ_j`). Then (1) the (k+1)-fold fibre product of Ṽ over V is `Ṽ × Γ^k`, the pro-object `lim_j (Ṽ_j × Γ_j^k)`; (2) for every abelian sheaf F on `X_prokét` there is a spectral sequence `E₁^{k,q} = H^q(Ṽ × Γ^k, F) ⇒ H^{k+q}(V, F)` (the Čech-to-derived spectral sequence of the covering `Ṽ → V`); (3) if `H^q(Ṽ × Γ^k, F) = 0` for `q > 0` and all k, and `F(Ṽ × S) = C(S, F(Ṽ))` for profinite sets S, then `H^i(V, F) ≅` H^i_cont(Γ, F(Ṽ)); the same holds with "almost zero" and almost isomorphisms. The pro-finite-étale Galois case for trivial log structures is `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (cartan leray spectral sequence) (b).

X locally noetherian fs and connected; `Γ` profinite; the hypothesis `F(Ṽ × S) = C(S, F(Ṽ))` is required for the continuous-cohomology form (it holds for `F = ν^{−1}F′ ⊗ O⁺/p` and for the completed structure sheaves on log affinoid perfectoid Ṽ), and without it only the Čech form (2) is asserted.

(1) The pro-finite Kummer étale site is equivalent to `π₁^két(X, ζ)-PFSets` (DLLZ-adic Proposition 5.1.12, from the Galois category of [6.17](#section-6-17)), under which the fibre products of a Galois cover are computed as profinite sets.

(2) The Čech-to-derived spectral sequence of a covering in a topos (`DiamondsAndVStacks` D0 (cech to derived comparison)).

(3) Under the vanishing, the spectral sequence degenerates to the Čech complex, which by (1) and the hypothesis on F is the continuous cochain complex of `Γ` with coefficients F(Ṽ) (Scholze 2013, Proposition 3.7 (iii), with the corrected covering notion of the pro-étale site).

**Checks.**

- For the toric tower `Ṽ → V` of [6.26](#section-6-26) with `Γ ≅ Ẑ(1)^n`, (3) computes `H^i(V_két, L ⊗ O⁺/p)` as `H^i(Γ, L(Ṽ))` up to almost isomorphism, which vanishes for `i > n`.
- For trivial log structure and `Γ` finite, (3) is the Hochschild–Serre spectral sequence of a finite étale Galois cover.
- Without the profinite-function hypothesis, a skyscraper-type sheaf can have `F(Ṽ × Γ) ≠ C(Γ, F(Ṽ))`, and only the Čech form remains.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.12, p. 73: the pro-finite Kummer étale site of a connected space is equivalent to profinite π₁^két-sets. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), proof of Proposition 6.1.1, p. 84: the Cartan–Leray spectral sequence for the Galois cover `Ṽ → V` and the identification of its Čech cohomology with continuous Γ-cohomology through Proposition 5.1.12 and Scholze 2013 Proposition 3.7 (iii).

*Needs:* [6.17](#section-6-17); [6.23](#section-6-23); [6.24](#section-6-24); `DiamondsAndVStacks` D0 (cech to derived comparison); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (cartan leray spectral sequence).

Applications include [7.1](#section-7-1) (toric character cohomology), [7.18](#section-7-18)–[7.19](#section-7-19) (decompletion of Kummer towers).

<a id="section-6-26"></a>

### 6.26 All-root toric Kummer towers

Construct `TauCeti.LogAdic.AllRootTower`. Let P be a sharp fs monoid, (1/m)P its m-th root monoid and `P_{Q≥0}=colim_m (1/m)P` along the divisibility order (m|m′); `P_{Q≥0}` is uniquely n-divisible for every integer `n≥1`. (0) Toric charts (Proposition 3.1.10, Definition 3.1.12): a log smooth fs X over an affinoid field `(k,k⁺)` étale locally admits a toric chart, a strictly étale map `X→Spa(k⟨P⟩,k⁺⟨P⟩)` with P sharp fs that is a composition of rational localizations and finite étale maps. (a) Geometric tower (Lemma 5.3.4): if X is an analytic locally noetherian adic space over `Spa(Z_p,Z_p)` with trivial log structure, `Y=X⟨P⟩` and `lim_{i∈I} U_i` is an affinoid perfectoid object of X_proét, then, with `I×Z_{≥1}` ordered by `(i,m)≥(j,n)` iff `i≥j` and n|m, the system `U_i⟨(1/n)P⟩` is a pro-Kummer étale presentation over Y with an initial object, sharp fs charts (1/n)P, Kummer transition charts, perfectoid completed colimit and chart colimit `P_{Q≥0}`; it is a pro-Kummer étale (resp. pro-finite Kummer étale) cover of Y when `lim U_i` is a pro-étale (resp. pro-finite étale) cover of X. (b) Toric tower over a field (§6.1): for k a perfectoid field of characteristic zero containing all roots of unity, `k⁺=O_k` and `E=Spa(k⟨P⟩,k⁺⟨P⟩)`, the tower `Ẽ=lim_m E_m` with `E_m=Spa(k⟨(1/m)P⟩,k⁺⟨(1/m)P⟩)` has associated perfectoid space `Spa(k⟨P_{Q≥0}⟩,k⁺⟨P_{Q≥0}⟩)`; `E_m→E` is a Galois finite Kummer étale cover with group `Γ/m=Hom(P^gp,μ_m)`, and `Ẽ→E` is a Galois pro-finite Kummer étale cover with group `Γ=lim_m Γ/m=Hom(P^gp,Ẑ(1))`. The finite-order characters of `Γ` are identified with `P_Q^gp/P^gp`, and `k⁺[P_{Q≥0}]=⊕_χ k⁺[P_{Q≥0}]_χ`, where the χ-summand is spanned by the `e^a` with `a∈P_{Q≥0}` of class `χ`; the trivial-character summand is `k⁺[P]` and every summand is a finite `k⁺[P]`-module (Lemma 6.1.6). Pullback along a toric chart `V→E` gives `Ṽ=V×_E Ẽ=lim_m V_m`. (c) Arithmetic tower (DLLZ-RH §2.3 and (3.3.4)): over a p-adic field k with `k_m=k(μ_m)` and `k_∞=∪_m k_m`, the tower of `Spa(k_m⟨(1/m)P⟩,k_m⁺⟨(1/m)P⟩)` has associated perfectoid space `Spa(k̂_∞⟨P_{Q≥0}⟩,k̂_∞⁺⟨P_{Q≥0}⟩)`, and its Galois group `Γ` is an extension `1→Γ_geom→Γ→Gal(k_∞/k)→1` with Γ_geom=Hom(P^gp,Ẑ(1)) (≅Ẑ(1)^n for `P=Z^n_{≥0}`) on which `Gal(k_∞/k)` acts through the cyclotomic character.

Characteristic zero; residue characteristic p wherever the tower is required to be perfectoid.

In (b) k is perfectoid: DLLZ-adic §6.1 assumes only that k has characteristic zero and contains all roots of unity, but `k⟨P_{Q≥0}⟩` is perfectoid only when k is (already for `P=0`); every application (Theorem 6.2.1) has k algebraically closed. In (c) k is a p-adic field in DLLZ-RH's sense (complete discretely valued, perfect residue field) and roots of unity are adjoined level by level.

The index set is ordered by divisibility over all integers `m≥1`, not only powers of p.

Toric charts: by Proposition 3.1.4 étale locally there is a strictly étale map to `Spa(k⟨Q⟩,k⁺⟨Q⟩)` with Q torsion-free fs; split `Q≅Q̄⊕Z^r` (Lemma 2.1.10) and compose with the rational localization `Spa(k⟨Q⟩,k⁺⟨Q⟩)→Spa(k⟨P⟩,k⁺⟨P⟩)`, `P=Q̄⊕Z^r_{≥0}` (Proposition 3.1.10).

Geometric tower: each `U_i⟨(1/n)P⟩→U_i⟨P⟩` is a finite Kummer étale root cover (Proposition 4.1.6, Lemma 2.2.15), transition charts `(1/n)P→(1/m)P` are Kummer for n|m, cofinality and the pro-Kummer étale cover property follow from Lemma 5.1.4, and the completed colimit is the completed `R⟨P_{Q≥0}⟩` over the perfectoid completion R of `colim U_i`, which is perfectoid (Lemma 5.3.4).

Galois groups: `Γ/m=Hom(((1/m)P)^gp/P^gp,μ_∞)≅Hom(P^gp,μ_m)` acts on `e^a` by the character attached to the class of a, giving (6.1.3)–(6.1.4) and the decomposition (6.1.5); Lemma 6.1.6 uses `P_{Q≥0}∩P^gp=P` and a finite description of the cone of P to show each character summand is finite over `k⁺[P]`.

Arithmetic tower: adjoin `μ_m` at level m; `Gal(k_∞/k)` acts on the root monomials through the cyclotomic character, which gives the extension (3.3.4).

The interface consists of the following named results.

- `TauCeti.LogAdic.AllRootTower`: The divisibility-indexed root presentation together with its field/root-of-unity data.
- `TauCeti.LogAdic.AllRootTower.character_action`: `γ(e^a)=χ_a(γ)e^a` on a root monomial.
- `TauCeti.LogAdic.AllRootTower.geometric_group`: The geometric group is `Hom(P^gp,Ẑ(1))`.
- `TauCeti.LogAdic.AllRootTower.cyclotomic_conjugation`: Arithmetic conjugation acts on the geometric Ẑ(1)-directions through the cyclotomic character.
- `TauCeti.LogAdic.AllRootTower.chart_limit_divisible`: The chart colimit is `P_{Q≥0}=colim_m (1/m)P`, sharp, saturated and uniquely n-divisible for every `n≥1`.
- `TauCeti.LogAdic.AllRootTower.character_decomposition`: `k⁺[P_{Q≥0}]=⊕_χ k⁺[P_{Q≥0}]_χ` over the finite-order characters `χ∈P_Q^gp/P^gp` of `Γ`; the trivial summand is `k⁺[P]` and each summand is a finite `k⁺[P]`-module (Lemma 6.1.6).
- `TauCeti.LogAdic.AllRootTower.exists_toric_chart`: A log smooth fs X over `(k,k⁺)` étale locally admits a toric chart `X→Spa(k⟨P⟩,k⁺⟨P⟩)`, P sharp fs, that is a composition of rational localizations and finite étale maps (Proposition 3.1.10).

**Checks.**

- `TauCeti.LogAdic.AllRootTower.rank_zero`: For `P=0`, the geometric root group is trivial.
- `TauCeti.LogAdic.AllRootTower.two_coordinates`: For `P=N²` the geometric group is `Ẑ(1)²`.
- `TauCeti.LogAdic.AllRootTower.p_only_insufficient`: The monoid N[1/p] is not q-divisible for a prime `q≠p`; its p-only tower does not satisfy the all-root chart-limit condition.
- `TauCeti.LogAdic.AllRootTower.trivial_character_summand`: For `P=N`, the Γ-invariant summand of `k⁺[N_{Q≥0}]` is `k⁺[N]`: `e^{1/2}` lies in the summand of the character of order 2, not in the invariants.
- The chart-limit divisibility is for every integer n, not just powers of p.
- For `P=N`, `Γ/m≅μ_m` and `ζ∈μ_m` acts by `e^{1/m}↦ζ·e^{1/m}`; the invariant summand of `k⁺[N_{Q≥0}]` is `k⁺[N]`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.10 and Definition 3.1.12, pp. 24–25: States the existence of toric charts recorded in part (0); Definition 3.1.12 names such a map a toric chart. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.3.4, p. 75: Gives the divisibility-indexed geometric tower of part (a), which the lemma shows is log affinoid perfectoid and a pro-Kummer étale (pro-finite Kummer étale) cover. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §6.1, (6.1.3)–(6.1.5) and Lemma 6.1.6, pp. 81–82: Part (b): the Galois groups `Γ/m` and `Γ=Hom(P^gp,Ẑ(1))` of the toric tower and the character decomposition; the statement adds the perfectoid hypothesis on k that the tower needs. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §2.3, p. 15, and (3.3.4), p. 29: Part (c): the arithmetic tower over `k_m=k(μ_m)` and the extension of `Gal(k_∞/k)` by `Γ_geom` with the cyclotomic action.

*Needs:* [6.13](#section-6-13); [6.7](#section-6-7); [6.21](#section-6-21); `PerfectoidSpaces` P1 (perfectoid tate rings and algebras); `AdicEtaleGeometry` A4 (perfectoid uniform completion).

Applications include DLLZ-adic §6.1: Characters and Koszul computations prove local cohomology bounds; DLLZ-RH §3.3: Good finite-level models yield period pushforward acyclicity.

<a id="section-6-27"></a>

### 6.27 Log affinoid perfectoid pro-objects

Define `TauCeti.LogAdic.LogAffinoidPerfectoid`. Let X be an analytic locally noetherian fs log adic space over `Spa(Z_p,Z_p)`. An object U of `X_prokét` is log affinoid perfectoid if it has a pro-Kummer étale presentation `U=lim_{i∈I} U_i`, `U_i=Spa(R_i,R_i⁺)` with log structures, such that (1) I has an initial object 0; (2) each `U_i` has a global sharp fs chart `P_i` and each transition `U_j→U_i` is modeled on a Kummer chart `P_i→P_j`; (3) the completion `(R,R⁺)` of `colim_i (R_i^u,R_i^{u+})`, where `(R_i^u,R_i^{u+})` is the uniformization of `(R_i,R_i⁺)`, is a perfectoid affinoid algebra; (4) `P=colim_i P_i` is n-divisible for every `n≥1`, equivalently (P being sharp and saturated) uniquely n-divisible. Over `Spa(Q_p,Z_p)`, `(R,R⁺)` is simply the p-adic completion of `colim_i (R_i,R_i⁺)`. The associated `Û=Spa(R,R⁺)` is an affinoid perfectoid space and `|Û|≃lim|U_i|`; Û itself is not asserted to be an object of `X_prokét`.

Analytic locally noetherian fs X over `Spa(Z_p,Z_p)`; the structural-sheaf conclusions below use X over `Q_p`.

Use Definition 5.3.1 with uniformization before completing the colimit; over `Q_p` use Remark `5.3.2 (R_i⁺/p^n≅R_i^{u+}/p^n)`.

Show all-integer divisibility of the chart limit and sharpness/saturation (Remark 5.3.3, Kummer charts are injective) and the topological identification of Lemma 5.3.6 (continuous valuations and Kedlaya–Liu Lemma 2.6.5 on rational subsets).

Use Lemma 5.3.7 for strict closed pullbacks and Lemma 5.3.8 (via the root covers of Lemma 4.2.5 and condition (4)) to make finite-level Kummer maps strict étale after passage to U.

The interface consists of the following named results.

- `TauCeti.LogAdic.LogAffinoidPerfectoid`: The finite-stage sharp-chart presentation, all-integer divisibility and perfectoid completed-pair data.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.realization`: The associated completed perfectoid Huber pair and its Spa.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.topology`: The realization topology is canonically the inverse-limit topology of the presentation.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.strict_pullback`: Strict closed pullback and Kummer étale localization preserve these objects with the source completion convention.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.isQcqs`: A log affinoid perfectoid object is quasi-compact and quasi-separated in `X_prokét` (Remark 5.3.3, from Proposition 5.1.5).
- `TauCeti.LogAdic.LogAffinoidPerfectoid.realization_map`: `U↦Û` is a functor from log affinoid perfectoid objects to affinoid perfectoid spaces (Remark 5.3.5), compatible with the homeomorphism `|Û|≅lim|U_i|` of Lemma 5.3.6.

**Checks.**

- `TauCeti.LogAdic.LogAffinoidPerfectoid.trivial_chart`: With zero characteristic chart the definition agrees with ordinary affinoid perfectoid pro-objects.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility`: For each `n>0` and a in `colim P_i` there is a unique b with nb=a.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only`: A presentation over a perfectoid base whose chart colimit is N[1/p] (the p-power root tower of a coordinate) is not a perfectoid presentation: condition (4) fails for every `n>1` prime to p.
- The object/presentation and its completed affinoid realization are different data.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.3.1, pp. 74–75: Defines the notion by conditions (1)–(4), which the statement lists with the same hypotheses on X. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.3.1(3), p. 75: Fixes the completion convention of condition (3) used here. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 5.3.3, p. 75: Supports the equivalence of n-divisibility and unique n-divisibility of the chart colimit. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.3.8, p. 76: Hypothesis of the localization statement behind the strict_pullback API item; Remark 5.3.5 and Lemma 5.3.6 give the realization and its topology.

*Needs:* [6.26](#section-6-26); [6.23](#section-6-23); [6.13](#section-6-13); `AdicSpacesPartII` R0 (uniformization); `PerfectoidSpaces` P1 (perfectoid tate rings and algebras); `PerfectoidSpaces` P3 (almost purity theorem).

Applications include DLLZ-adic Theorem 5.4.3: Computes completed structural sheaves and almost cohomology; DLLZ-RH Definition 2.2.10: Defines periods by presentations on this basis.

<a id="section-6-28"></a>

### 6.28 Étale and pro-étale cohomology on perfectoid spaces

Prove `TauCeti.LogAdic.perfectoid_proetale_comparison`. Let X be a perfectoid space, `ν`: X_proét `→ X_ét` the projection from its pro-étale site. (1) For every abelian sheaf F on `X_ét`, `F → Rν_*ν^*F` is an isomorphism; hence `H^i(X_ét, F) ≅` H^i(X_proét, `ν^*F`), and for qcqs `U = lim U_j` in X_proét, `H^i(U, ν^*F) = colim_j H^i(U_j, F)`. (2) If `X = Spa(A, A⁺)` is affinoid perfectoid and every finite étale cover of X splits, then `H^i(X_ét, L) = 0` for `i > 0` and every p-torsion locally constant sheaf L, which is then constant. The locally noetherian case of (1) is `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (proetale etale comparison); the statement here removes that hypothesis. The analogue on the quasi-pro-étale site of a locally spatial diamond is `DiamondEtaleCohomology` C0.17 and C0.23; (1) is the statement on the pro-étale site X_proét of the adic space, on which the pro-Kummer étale site is built.

X perfectoid, not necessarily locally noetherian; the étale site of X has a basis of qcqs objects stable under fibre products, which is all that the argument uses.

(1) The colimit formula for cohomology of a pro-object on a coherent site (`DiamondsAndVStacks` D0 (filtered colimits and cohomology on coherent sites)) gives `H^j(U, ν^*F) = colim H^j(U_j, F)` for qcqs U; `R^jν_*ν^*F` is the sheafification of `U ↦ H^j(U, ν^*F)`, which vanishes locally for `j > 0`, and `ν_*ν^*F = F` (Scholze 2013, Corollary 3.17 (i), whose proof uses only these facts).

(2) Trivialize L; for `L = 𝔽_p`, Artin–Schreier on the tilt identifies `H^i(X_ét, 𝔽_p)` with the cohomology of `F − 1` on `O⁺/p` up to almost zero modules; almost acyclicity of `O⁺/p` on affinoid perfectoid spaces (`PerfectoidSpaces` P3 (etale almost acyclicity)) and surjectivity of `F − 1` on `A^♭` when all finite étale covers split give the vanishing (the last paragraph of the proof of Scholze 2013, Theorem 4.9); dévissage gives p-torsion L.

**Checks.**

- For `X = Spa(C, O_C)`, (2) gives `H^i(Spa(C)_ét, 𝔽_p) = 0` for `i > 0`.
- For `X = Spa(K, O_K)` with K a perfectoid field that is not algebraically closed (for instance the completion of `ℚ_p(μ_{p^∞})`), `H¹(X_ét, 𝔽_p) = H¹(Gal(K̄/K), 𝔽_p) ≠ 0`: the splitting hypothesis in (2) is needed.
- For `X = Spa(C, O_C)` and `F = ℤ/n`, both sides of (1) are `ℤ/n` in degree 0 and vanish in positive degrees.

[SCH13](https://arxiv.org/abs/1205.3463), Corollary 3.17, PDF p. 20 (arXiv:1205.3463v2): `F → Rν_*ν^*F` is an isomorphism, stated for locally noetherian X. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), proof of Proposition 5.3.13, p. 78: applies Scholze 2013 Corollary 3.17 (i) to affinoid perfectoid spaces, noting that the locally noetherian hypothesis is not needed, and the vanishing of `H^i(V̂_ét, L)` by the last paragraph of the proof of Scholze 2013 Theorem 4.9.

*Needs:* `DiamondsAndVStacks` D0 (filtered colimits and cohomology on coherent sites); `DiamondsAndVStacks` D0 (quasicompact objects in a topos); `PerfectoidSpaces` P3 (etale almost acyclicity); `PerfectoidSpaces` P3 (etale site tilting equivalence); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (proetale etale comparison).

Applications include [6.29](#section-6-29) (vanishing on a basis of log affinoid perfectoid objects).

<a id="section-6-29"></a>

### 6.29 Perfectoid basis and Kummer strictification

Prove `TauCeti.LogAdic.log_perfectoid_basis`. Let X be an analytic locally noetherian fs log adic space over `Spa(Z_p,Z_p)`. (1) The log affinoid perfectoid objects form a basis of `X_prokét` (Proposition 5.3.12) and are stable under fibre products, with `(V×_U W)^≅V̂×_Û Ŵ` (Proposition 5.3.11). (2) For a strict closed immersion `Z→X` and log affinoid perfectoid U, `U×_X Z` is log affinoid perfectoid in `Z_prokét` and `(U×_X Z)^→Û` is a closed immersion (Lemma 5.3.7). (3) If `V→U` is the pullback of a Kummer étale (resp. finite Kummer étale) map `V₀→U₀` of affinoids in `X_két`, then `V→U` is étale (resp. finite étale), V is log affinoid perfectoid and `V̂→Û` is étale (resp. finite étale); `V↦V̂` induces an equivalence of topoi Û_proét^∼≃(X_prokét/U)^∼ (Lemma 5.3.8). (4) `X_prokét` has a basis B of log affinoid perfectoid objects with `H^i(X_prokét/V,ν⁻¹L)=0` for all `V∈B`, all p-torsion locally constant sheaves L on `X_két` and all `i>0` (Proposition 5.3.13).

Analytic locally noetherian fs X over `Spa(Z_p,Z_p)`; neither log smoothness nor a perfectoid base field is required for Propositions 5.3.12–5.3.13.

Lemma 5.3.8: by Lemma 4.2.5 a root cover `U₀^{1/m}` makes V₀ strictly étale; m-divisibility of the chart colimit factors `P₀→(1/m)P₀→P_i`, so the pullback is strictly étale at a finite stage; the topos equivalence follows from Kedlaya–Liu Lemma 2.6.5 and Proposition 2.6.8. Lemma 5.3.7 uses strictness, uniform quotients and Kedlaya–Liu Theorem 3.6.17(b).

Proposition 5.3.11: re-present V and W over a common chart system (Lemma 5.3.10) and use Scholze 2012 Proposition 6.18 for the perfectoid fibre product.

Proposition 5.3.12: localize to an affinoid X with a sharp chart, embed strictly into X⟨P⟩, pull back the tower of Lemma 5.3.4 over an affinoid perfectoid pro-étale cover (Scholze 2013 Proposition 4.8, Scholze 2017 Lemma 15.3) by Lemma 5.3.7, and conclude with Lemma 5.1.4 and Corollary 5.3.9.

Proposition 5.3.13: refine U to V with V̂ the completed universal cover `Û_∞` (Lemma 5.3.8); L|V is trivial since finite Kummer étale covers of V split, and H^i(X_prokét/V,ν⁻¹L)≅H^i(V̂_proét,ν⁻¹L)≅H^i(V̂_ét,L)=0 by [6.28](#section-6-28) (Scholze 2013 Corollary 3.17(i) without the noetherian hypothesis, and the Artin–Schreier argument of the last paragraph of the proof of Scholze 2013 Theorem 4.9 with almost acyclicity of `O⁺` from `PerfectoidSpaces` P3), using only these local inputs.

**Checks.**

- Retain the analytic locally noetherian fs hypotheses; a smoothness assumption would unnecessarily weaken the source.
- For X with trivial log structure, (1) recovers the affinoid perfectoid basis of X_proét (Scholze 2013 Proposition 4.8).

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.3.12, p. 77: States part (1), the basis property, under the same hypotheses on X. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.3.11, p. 77: Stability under fibre products in part (1). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.3.8, p. 76: Hypothesis of part (3); the lemma concludes étaleness, log affinoid perfectoidness and the equivalence of topoi. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.3.13, p. 78: Part (4): the basis on which inverse images of p-torsion locally constant sheaves are acyclic.

*Needs:* [6.27](#section-6-27); [6.26](#section-6-26); [6.13](#section-6-13); [6.21](#section-6-21); `PerfectoidSpaces` P3 (almost purity theorem); `AdicEtaleGeometry` A1 (pro etale site corrected); `AdicEtaleGeometry` A4 (perfectoid uniform completion); [6.28](#section-6-28); `PerfectoidSpaces` P3 (etale almost acyclicity); `PerfectoidSpaces` P3 (etale site tilting equivalence).

<a id="section-6-30"></a>

### 6.30 Completed and tilted structural log sheaves

Construct `TauCeti.LogAdic.CompletedLogStructure`. For X a locally noetherian fs log adic space over `Spa(Q_p,Z_p)`, define on `X_prokét`: `O⁺=ν⁻¹O⁺_két` and `O=ν⁻¹O_két`; `Ô⁺=lim_n O⁺/p^n` and `Ô=Ô⁺[1/p]`. Define the characteristic-p ring sheaf `Ô^{♭+}=lim_Frob(O⁺/p)`. Its underlying multiplicative monoid identifies with `lim_{x↦x^p}Ô⁺`; addition is the tilt addition, not coordinatewise addition of characteristic-zero sequences. On a log affinoid perfectoid U with associated `(R,R⁺)`, the tilted structural pair has sections `(R♭,R^{♭+})`; the multiplicative carrier of `Ô♭` identifies with `lim_{x↦x^p}Ô`. Put `M=ν⁻¹M_két` with `α:M→O` and `M♭=lim_{a↦a^p}M`, with induced `α♭:M♭→Ô♭`. For qcqs pro-Kummer presentations `U=lim U_i` with qcqs finite stages, `M(U)=colim_i M_{U_i}(U_i)`; on arbitrary U use the sheaf associated with that presheaf and descent from the qcqs basis (Proposition 5.4.2, on the qcqs basis). Limits and localizations are formed in sheaves; ring sections alone do not define the topology.

X locally noetherian fs over `Spa(Q_p,Z_p)`; Frobenius is applied in characteristic p for the tilt.

The Frobenius inverse limit is taken in rings only after reduction modulo p. The sharp map `Ô^{♭+}→Ô⁺` is multiplicative and generally not additive. The sections/filtered-colimit formula is asserted on the qcqs basis, not on an arbitrary disjoint union.

Use inverse image along `ν` and sheaf limits/quotients.

Form `lim_Frob(O⁺/p)` as a characteristic-p ring sheaf; identify its multiplicative monoid with the power-map limit of `Ô⁺`, carrying the induced tilt addition. On the log perfectoid basis use the tilted perfectoid structural rings and glue. Compatible sequences of log structural sections give `α♭`, and sharp is multiplicative.

On qcqs presentations, use a finite covering refinement and a common finite stage to check the Čech equalizer for `U↦colim_iM_{U_i}(U_i)`, using the Kummer sheaf property of `M_két`. The qcqs filtered-colimit result gives the sections formula there; sheafify for arbitrary objects. Infinite products need not commute with this filtered colimit.

The interface consists of the following named results.

- `TauCeti.LogAdic.CompletedLogStructure`: The inverse-image, completed and tilted ring/monoid sheaves with their maps.
- `TauCeti.LogAdic.CompletedLogStructure.mod_p`: On a log affinoid perfectoid U with associated `(R,R⁺)`, `Ô⁺(U)/p=R⁺/p`. The natural map to `(O⁺/p)(U)` is an almost isomorphism; taking sections of a quotient sheaf is not identified with quotienting sections without proof (Theorem 5.4.3(1),(3)).
- `TauCeti.LogAdic.CompletedLogStructure.tilt_projection`: The nth ring projection `Ô^{♭+}→O⁺/p` from the characteristic-p Frobenius limit, and sharp:Ô^{♭+}→Ô⁺ as a multiplicative monoid map. Sharp is not asserted additive.
- `TauCeti.LogAdic.CompletedLogStructure.functorial`: Log pullback gives compatible maps of all structural sheaves and their completions.
- `TauCeti.LogAdic.CompletedLogStructure.monoid_sections`: For a qcqs pro-Kummer presentation `U=lim U_i` by qcqs finite stages, `M(U)=colim_iM_{U_i}(U_i)`. For arbitrary U recover M(U) by descent from this basis; there is no unrestricted sectionwise colimit formula (corrected scope of Proposition 5.4.2).

**Checks.**

- `TauCeti.LogAdic.CompletedLogStructure.constant_point`: For a log affinoid perfectoid U whose associated perfectoid space is `Spa(K,K⁺)` with K a perfectoid field, `Ô⁺(U)=K⁺` and `Ô(U)=K`.
- `TauCeti.LogAdic.CompletedLogStructure.frobenius_relation`: A tilt sequence satisfies `x_{n+1}^p=x_n` modulo p.
- `TauCeti.LogAdic.CompletedLogStructure.not_localize_first`: Taking p-adic completion after inverting p yields zero quotients, so it cannot replace `Ô⁺` followed by inversion.
- `TauCeti.LogAdic.CompletedLogStructure.trivial_log`: If X has trivial log structure, X_prokét=X_proét and `O⁺`, `Ô⁺`, `Ô`, `Ô^{♭+}` are Scholze's sheaves of the same names, with `M=O^×` and `α` the inclusion.
- `TauCeti.LogAdic.CompletedLogStructure.noncompact_sections`: On a countable disjoint union of coordinate log discs, take the same i!-root level on every component at stage i. In the all-root limit, the section whose j-th component has characteristic exponent 1/j! exists by sheaf descent, but descends to no common finite level. Thus filtered colimits of monoid sections cannot be computed sectionwise on arbitrary non-quasi-compact presentations.
- Distinguish `O⁺`, `Ô⁺` and their tilt before inverting p.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.4.1, p. 78: Introduces the integral, completed and tilted structure sheaves and the log structures `α`, `α♭` defined in the statement, with the same hypothesis on X. The characteristic-zero power-map limits are multiplicative carriers; the characteristic-p ring is the Frobenius limit modulo p. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.4.1(4), p. 78: Defines `M=ν⁻¹M_két`, its tilt M♭ and the structural maps. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.4.2, p. 78: The proof checks the sections presheaf on quasi-compact objects and finite covers. The statement retains the qcqs-basis formula and sheafifies elsewhere, correcting the unrestricted statement.

*Needs:* [6.24](#section-6-24); [6.15](#section-6-15); [6.27](#section-6-27); `AdicEtaleGeometry` A1 (etale structure sheaf); `AdicCompletion`; `DiamondsAndVStacks` D0 (filtered colimits and cohomology on coherent sites).

Applications include DLLZ-RH Definition 2.2.3: The tilt and `θ` feed the ordinary period-ring functor on this site; DLLZ-adic Theorem 6.2.1: `O⁺/p` is the primitive-comparison coefficient sheaf.

<a id="section-6-31"></a>

### 6.31 Derived inverse limits over a site with an acyclic basis

Prove `TauCeti.LogAdic.rlim_vanishing_of_acyclic_basis`. Let T be a site, `(F_i)_{i∈ℕ}` an inverse system of abelian sheaves on T, and B a basis of T such that for every `U ∈ B`: (i) `R¹lim_i F_i(U) = 0`, and (ii) `H^j(U, F_i) = 0` for all `j > 0` and all i. Then `R^j lim_i F_i = 0` for `j > 0`, `(lim_i F_i)(U) = lim_i F_i(U)` for every `U ∈ T`, and `H^j(U, lim_i F_i) = 0` for `U ∈ B` and `j > 0`. The same holds in the almost setting: if the groups in (i)–(ii) are almost zero, so are the conclusions. No repleteness of the topos is assumed.

T arbitrary; B a basis; (i) holds for instance when the transition maps `F_{i+1}(U) → F_i(U)` are surjective. `EnhancedDerivedSheaves` E2 proves the amplitude and pro-zero statements for replete topoi; `ClassicalAdicEtaleCohomology` §1.3 proves the lisse-tower case on the analytic pro-étale site; this is the general basis form used on `X_prokét`.

Factor lim on sheaves as forgetful functor to inverse systems of presheaves, inverse limit of presheaves, then sheafification. The forgetful functor has an exact left adjoint (sheafification), so it preserves injectives; (i)–(ii) make the derived functors of the composite vanish on sections over `U ∈ B` before sheafification, hence after. An inverse limit of sheaves computed as presheaves is a sheaf, which gives the formula for sections. For the last claim use the Grothendieck spectral sequence for the composite through `Sh(T)^ℕ → Sh(T)`, whose left vertical functor preserves injectives.

**Checks.**

- For T a point and `F_i = ℤ/p^i` with the natural surjections, `lim = ℤ_p` and `R¹lim = 0`.
- For `F_i = ℤ` with transition maps multiplication by p, (i) fails on a point: `R¹lim = ℤ_p/ℤ ≠ 0`, and `lim = 0`.
- For `F_i = O⁺/p^i` on a log affinoid perfectoid basis of `X_prokét`, (ii) holds only up to almost zero modules, and the almost form gives `H^j(U, Ô⁺)^a = 0` for `j > 0`.

[SCH13](https://arxiv.org/abs/1205.3463), Lemma 3.18 and its proof, PDF p. 21 (arXiv:1205.3463v2): derived inverse limits vanish when a basis has vanishing `R¹lim` of sections and vanishing higher cohomology of each term. [CDM12](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf), proof of Theorem 3.20, PDF p. 21: the passage to the inverse limit over n with Scholze 2013 Lemma 3.18.

*Needs:* `CategoryTheory.Sheaf`; `CategoryTheory.GrothendieckTopology`; `EnhancedDerivedSheaves` E2.2 (derived limits on a replete topos); `ClassicalAdicEtaleCohomology` §1.3 (lisse-tower derived limit).

Applications include [6.32](#section-6-32) (almost acyclicity of `Ô⁺` on log affinoid perfectoid objects), [6.34](#section-6-34) (completion of Kummer local systems), [7.3](#section-7-3), [7.5](#section-7-5), [7.20](#section-7-20), [7.27](#section-7-27).

<a id="section-6-32"></a>

### 6.32 Almost acyclicity on log perfectoid objects

Prove `TauCeti.LogAdic.log_perfectoid_almost_acyclicity`. Let X be a locally noetherian fs log adic space over `Spa(Q_p,Z_p)` and U a log affinoid perfectoid object of `X_prokét` with `Û=Spa(R,R⁺)` and tilt `(R♭,R^{♭+})`. (1) `O⁺(U)/p^n≅R⁺/p^n`, canonically almost isomorphic to `(O⁺/p^n)(U)`, for each `n>0`. (2) `H^i(U,O⁺/p^n)` and `H^i(U,Ô⁺)` are almost zero for all `i>0`. (3) `Ô⁺(U)≅R⁺`, `Ô(U)≅R`, and `Ô⁺(U)` is the p-adic completion of `O⁺(U)`. (4) `Ô^{♭+}(U)≅R^{♭+}` and `Ô^♭(U)≅R♭`. (5) `H^i(U,Ô^{♭+})` is almost zero for all `i>0`. (6) (Theorem `5.4.4) H↦H(U`) is an equivalence from finite locally free `Ô|_U`-modules on `X_prokét/U` to finite projective `Ô(U)`-modules, with quasi-inverse `H↦(V↦H⊗_{Ô(U)}Ô(V))` on log affinoid perfectoid V over U, and `H^i(X_prokét/U,H)=0` for all `i>0`; in particular `H^i(U,Ô)=0` for `i>0`.

Use Theorems 5.4.3–5.4.4 with their locally noetherian fs/Q_p and basis hypotheses; retain the valuation ideal defining almost mathematics.

Integral statements are almost; exact statements are (3), (4), (6) and the rational vanishing.

By Proposition 5.3.12, sheaves on `X_prokét` are determined on log affinoid perfectoid objects; for (1)–(2) reduce, by Proposition 5.1.5 and the almost Čech criterion (Scholze 2013 Lemma 3.16), to Kummer étale covers pulled back from compositions of finite Kummer étale maps and rational localizations, which become étale over Û by Lemma 5.3.8; conclude with almost acyclicity of `O⁺/p^n` on affinoid perfectoid spaces (Scholze 2012 Theorem 7.13) and the almost form of [6.31](#section-6-31) (Scholze 2013 Lemma 3.18).

(3): the images of `(O⁺/p^n)(U)` in `(O⁺/p^m)(U)` are `R⁺/p^m`, so the inverse limit is `R⁺`.

(5) and the almost form of (4): apply the basis-acyclicity derived-limit lemma to `O⁺/p` along Frobenius. For exact (4), use the canonical power-map-limit presentation of `Ô^{♭+}` as a multiplicative sheaf, with its tilt addition. Limits commute with sections, so (3) identifies its sections with `lim_{x↦x^p}R⁺=R^{♭+}`; the induced tilt addition agrees with the perfectoid tilt. Alternatively, tilted perfectoid descent gives the exact equalizer directly. Do not infer exactness of the untilted modulo-p Čech equalizer merely from p-torsionfreeness and sheafness (use the exact tilted descent statement).

(6): Lemma 5.3.8 reduces the equivalence to Kedlaya–Liu Theorem 9.2.15; the vanishing follows as in Liu–Zhu 2017 Proposition 2.3 with Lemma 5.1.4(3).

**Checks.**

- Integral higher cohomology is almost zero, not asserted to vanish exactly.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 5.4.3, p. 79: Hypotheses of parts (1)–(5), which the statement restates. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 5.4.3(3), p. 79: The exact identification `Ô⁺(U)≅R⁺` with the p-adic completion of `O⁺(U)` in part (3). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 5.4.4, p. 80: Part (6): finite locally free `Ô`-modules over U and their higher cohomology vanishing. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), proof of Theorem 5.4.3(4), p. 80: The exact tilted identification is retained, but the claim that an untilted modulo-p Čech equalizer is exact from sheafness and p-torsionfreeness is replaced by the completed power-map limit and tilted descent.

*Needs:* [6.29](#section-6-29); [6.30](#section-6-30); [6.23](#section-6-23); `PerfectoidSpaces` P3 (almost purity theorem); `PerfectoidSpaces` P0 (almost cech acyclicity criterion); [6.31](#section-6-31); `PerfectoidSpaces` P3 (etale almost acyclicity); `PerfectoidSpaces` P3 (etale site tilting equivalence).

<a id="section-6-33"></a>

### 6.33 Kummer étale p-adic local systems

Define `TauCeti.LogAdic.KummerLisse`. A lisse Z_p-sheaf on `X_két` is an inverse system `L_n` of locally constant finite-generated `Z/p^n`-module sheaves, isomorphic in the pro-category to one satisfying `L_{n+1}/p^n≃L_n`. Torsion is allowed. A Q_p-local system is an object of the stackification of the isogeny category, so a global `Z_p` lattice is not part of its definition.

X a locally noetherian fs log adic space; no base field is needed for the definition.

Use the finite-generated, not necessarily finite-free, convention of DLLZ Definition 6.3.1.

Build the torsion-system category from finite Kummer local systems.

Localize morphisms by p and stackify for the rational category.

Use finite-level compatibility for morphisms, dual/tensor on the finite-free rational part.

The interface consists of the following named results.

- `TauCeti.LogAdic.KummerLisse`: The compatible locally constant torsion system, with pro-isomorphism to a strict system.
- `TauCeti.LogAdic.KummerLisse.reduction`: Evaluation at level n and the reduction isomorphism for a strict representative.
- `TauCeti.LogAdic.KummerLisse.rationalization`: Pass to the isogeny stack to obtain the associated Q_p-local system.
- `TauCeti.LogAdic.KummerLisse.morphism`: Morphisms are compatible pro-morphisms of torsion systems; rational morphisms are local isogeny morphisms glued in the stack.
- `TauCeti.LogAdic.KummerLisse.stalk`: At a log geometric point `ξ̃` the stalk `L_ξ̃=lim_n (L_n)_ξ̃` of a strict representative is a finitely generated `Z_p`-module with a continuous action of `π_1^két(X,ξ̃)`; for a Q_p-local system, Definition 6.3.7 tests monodromy on the Q_p-stalk (`L_ξ̃` of a local Z_p-representative, `⊗Q_p`) under the restricted action of `π_1^két(X(ξ),ξ̃)`, `X(ξ)` the strict localization with pulled-back log structure.

**Checks.**

- `TauCeti.LogAdic.KummerLisse.constant_free`: The constant system `(Z/p^n)^r` realizes a free rank-r Z_p-local system.
- `TauCeti.LogAdic.KummerLisse.constant_torsion`: The compatible constant Fp-system is permitted and is not free over `Z_p`.
- `TauCeti.LogAdic.KummerLisse.zero`: The zero system has rank zero and rationalizes to zero.
- `TauCeti.LogAdic.KummerLisse.torsion_rationalizes_zero`: The constant F_p-system (`L_n=F_p` with identity transitions) becomes zero in the isogeny category, so its associated Q_p-local system is 0, while `Z_p` itself rationalizes to the constant rank-one Q_p-local system.
- Fp is a valid torsion Z_p-local system; rational tensor assertions use finite-rank local systems.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.1(1), p. 88: Defines Z_p-local systems as inverse systems of locally constant sheaves of finitely generated `Z/p^n`-modules, pro-isomorphic to strict systems; torsion is allowed. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.1(2), p. 88: Defines Q_p-local systems through the stack of the isogeny category, as in the statement.

*Needs:* [6.17](#section-6-17); [6.15](#section-6-15); `DiamondsAndVStacks` D0 (stackification).

Applications include DLLZ-adic Lemma 6.3.3: Completion transports these objects to the pro-Kummer site; DLLZ-RH §3.2: The rational stack is the input to log Riemann–Hilbert.

<a id="section-6-34"></a>

### 6.34 Completion of Kummer local systems

Construct `TauCeti.LogAdic.CompletedKummerLisse`. Let X be a locally noetherian fs log adic space over `Spa(Q_p,Z_p)`. On `X_prokét` let `Ẑ_p=lim_n Z/p^n` and `Q̂_p=Ẑ_p[1/p]`; a Ẑ_p-local system is a sheaf of `Ẑ_p`-modules locally isomorphic to `L⊗_{Z_p}Ẑ_p` for a finitely generated `Z_p-module L`, and Q̂_p-local systems are defined similarly. (1) `L=(L_n)↦L̂=lim_n ν⁻¹(L_n)` is an equivalence from Z_p-local systems on `X_két` to Ẑ_p-local systems on `X_prokét`, independent of the strict representative up to canonical isomorphism, and `L̂⊗_{Ẑ_p}Q̂_p` is a Q̂_p-local system. (2) `R^i lim_n ν⁻¹(L_n)=0` for all `i>0`. (3) (Lemma 6.3.6) If `ı:Z→X` is a strict closed immersion of locally noetherian fs log adic spaces over `Spa(Q_p,Z_p)` and L̂ is a Q̂_p-local system on `X_prokét`, then for every log affinoid perfectoid U of `X_prokét` there is a canonical isomorphism `(L̂⊗_{Q̂_p}Ô_X)(U)⊗_{Ô_X(U)}Ô_Z(U×_X Z)≅(ı_prokét⁻¹(L̂)⊗_{Q̂_p}Ô_Z)(U×_X Z)`.

X locally noetherian fs over `Spa(Q_p,Z_p)`; do not take an unrestricted inverse limit of arbitrary sheaves without acyclicity.

The source asserts no equivalence for Q_p-local systems; only that `L̂⊗Q̂_p` is a Q̂_p-local system.

Use the basis B of Proposition 5.3.13, on which the `ν⁻¹(L_n)` are acyclic.

Apply [6.31](#section-6-31) (Scholze 2013 Lemma 3.18: derived inverse limits over a basis with vanishing higher cohomology and surjective transition maps) to get (2) and `L̂/p^n≅ν⁻¹(L_n)` for strict systems.

Check the equivalence of (1) by reductions modulo `p^n`, local triviality on B and descent.

(3): `U×_X Z` is log affinoid perfectoid (Lemma 5.3.7) and `Ô_X(U)→Ô_Z(U×_X Z)` is surjective (Proposition 5.4.5, from Lemma 5.3.7 and Theorem 5.4.3); by Theorem 5.4.4 it suffices to check the isomorphism after passing to a log affinoid perfectoid V over U on which L̂ is trivial, where it is clear.

The interface consists of the following named results.

- `TauCeti.LogAdic.CompletedKummerLisse`: The inverse limit of `ν⁻¹L_n` over the completed coefficient ring.
- `TauCeti.LogAdic.CompletedKummerLisse.mod_pn`: For a strict system the nth reduction agrees with `ν⁻¹L_n`.
- `TauCeti.LogAdic.CompletedKummerLisse.equivalence`: Completion and reduction are quasi-inverse on the specified lisse categories.
- `TauCeti.LogAdic.CompletedKummerLisse.map_comp`: Completion preserves identity and composition of local-system morphisms.
- `TauCeti.LogAdic.CompletedKummerLisse.rlim_vanishing`: `R^i lim_n ν⁻¹(L_n)=0` for all `i>0`, so `L̂=R lim_n ν⁻¹(L_n)` and `RΓ(X_prokét,L̂)=R lim_n RΓ(X_két,L_n)` (Lemma 6.3.3(2) with Proposition 5.1.7).
- `TauCeti.LogAdic.CompletedKummerLisse.rationalization`: `L̂⊗_{Ẑ_p}Q̂_p` is a Q̂_p-local system on `X_prokét`, where `Q̂_p=Ẑ_p[1/p]` (Lemma 6.3.3(1)).
- `TauCeti.LogAdic.CompletedKummerLisse.closed_pullback_completed`: For a strict closed immersion `ı:Z→X` over `Spa(Q_p,Z_p)`, a Q̂_p-local system L̂ on `X_prokét` and log affinoid perfectoid U, `(L̂⊗Ô_X)(U)⊗_{Ô_X(U)}Ô_Z(U×_X Z)≅(ı⁻¹L̂⊗Ô_Z)(U×_X Z)` canonically (Lemma 6.3.6).

**Checks.**

- `TauCeti.LogAdic.CompletedKummerLisse.constant`: A constant finite-generated `Z_p` module L completes to `L⊗Z_p Ẑ_p`.
- `TauCeti.LogAdic.CompletedKummerLisse.torsion`: The constant Fp-system completes to the constant Fp-sheaf.
- `TauCeti.LogAdic.CompletedKummerLisse.representative`: Pro-isomorphic strict representatives give canonically isomorphic completed local systems.
- The construction commutes with finite direct sums and rationalization.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.2, p. 88: Definition of Ẑ_p-local systems on `X_prokét` as sheaves locally isomorphic to `L⊗Ẑ_p` with L finitely generated. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.3(1), p. 88: The completion functor `L↦L̂` is an equivalence onto Ẑ_p-local systems, as in part (1). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.3, proof, p. 88: The proof the statement follows: the acyclic basis of Proposition 5.3.13 and Scholze's derived-limit lemma, giving part (2). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.6, p. 89: Hypotheses of part (3), the pullback of completed Q̂_p-local systems along strict closed immersions. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Lemma 6.3.6, p. 89: The proof followed in the statement: Lemma 5.3.7, surjectivity of completed structure sheaves and Theorem 5.4.4.

*Needs:* [6.33](#section-6-33); [6.29](#section-6-29); [6.24](#section-6-24); [6.31](#section-6-31); [6.32](#section-6-32); [6.30](#section-6-30).

Applications include DLLZ-RH §2.2 and §3.2: L̂ tensors with periods before geometric/arithmetic pushforward; DLLZ-RH Lemma 3.4.9: Restriction of L̂⊗B_dR-type sheaves to boundary strata `Z_i`, used for residues in [7.23](#section-7-23).

<a id="section-6-35"></a>

### 6.35 Unipotent geometric boundary monodromy

Define `TauCeti.LogAdic.BoundaryMonodromy`. Let k, X, D be as in Example 2.3.17 (X smooth rigid analytic over k, D a normal crossings divisor), `U=X−D`, and L a Q_p-local system on `X_két`. `L|U_ét` has unipotent (respectively quasi-unipotent) geometric monodromy along D if, for each geometric point `ξ` of D and each log geometric point `ξ̃` above `ξ`, `π_1^két(X(ξ),ξ̃)` acts unipotently (respectively quasi-unipotently: an open subgroup acts unipotently) on the stalk `L_ξ̃`, where the strict localization `X(ξ)` carries the log structure pulled back from X. At a geometric point `ξ` where exactly r local branches of D meet, `π_1^két(X(ξ))≅Hom(M̄^gp_ξ,Ẑ′(1))≅Ẑ′(1)^r` (Corollary 4.4.22; `Ẑ′(1)=Ẑ(1)` when `char k=0`), a commuting product of one inertia factor per local branch; in the setting of Example 6.3.8 (each `X_J` smooth and geometrically connected), the branches at a point of the stratum `U_J` are the components `D_j`, `j∈J`, and this is `Ẑ′(1)^J≅Γ^J`. It suffices to test geometric points over the smooth locus of D (Lemma 6.3.11). For an irreducible component Z of D, `L|U_ét` has unipotent (respectively quasi-unipotent) geometric monodromy along Z if, at every geometric point `ξ` of Z lying over the smooth locus of D (so `J={Z}` and `π_1^két(X(ξ))≅Ẑ′(1)`), this inertia acts unipotently (respectively quasi-unipotently) on `L_ξ̃`; equivalently, by the specialization argument of Lemma 6.3.11, at every geometric point `ξ` of Z the factors of `π_1^két(X(ξ))` indexed by the local branches of Z at `ξ` do. `L|U_ét` has unipotent (respectively quasi-unipotent) geometric monodromy along D if and only if it does along every irreducible component of D (Lemma 6.3.11, Remark 6.3.13).

This is geometric inertia, not the whole arithmetic Galois group.

X, D, k as in Example 2.3.17 (normal crossings, not necessarily strict); L a Q_p-local system on `X_két`; when `char k=0` and `k⁺=O_k` (the setting of Theorem 4.6.1, assumed by Corollary 6.3.4), equivalently, by Corollary 6.3.4's extension statement, a Q_p-local system on `U_ét`.

Use log geometric points and the Kummer fundamental group of the strict localization (Proposition 4.4.9, Corollary 4.4.22).

Define unipotence of the inertia action on the finite-dimensional stalk; for Q_p-local systems pass through an isogeny class of Z_p-local systems.

Lemma 6.3.11: after base change to a complete algebraically closed field and étale localization to a smooth toric chart `X→D^n`, use the toric tower of §6.1 to embed the inertia groups `Γ^{J′}⊂Γ^J` for `J′⊂J` and pass from geometric points `ξ′` of `U_{J′}` lifted into Kummer étale neighbourhoods of ξ (U_J lies in the closure of `U_{J′}`), identifying `π_1^két(X(ξ′))↪π_1^két(X(ξ))` with `Γ^{J′}↪Γ^J`; `Γ^J` is generated by the commuting `Γ^{{j}}`.

Per component: the smooth locus of D is the disjoint union of the strata `U_{{j}}`, so Lemma 6.3.11 splits the condition along D into one condition per component; at a point of Z on several strata, the Z-factor of `Γ^J` is the image of the inertia of a nearby point of `U_{{Z}}` (proof of Lemma 6.3.11), so both per-component formulations agree.

The interface consists of the following named results.

- `TauCeti.LogAdic.BoundaryMonodromy`: The geometric inertia action with its specified log geometric stalk.
- `TauCeti.LogAdic.BoundaryMonodromy.logarithm`: For a unipotent generator, its finite logarithm is nilpotent; commuting generators give commuting logarithms.
- `TauCeti.LogAdic.BoundaryMonodromy.smooth_locus`: Unipotence/quasi-unipotence can be checked on the smooth part of each boundary component.
- `TauCeti.LogAdic.BoundaryMonodromy.tensor`: Tensor and dual of unipotent boundary local systems remain unipotent.
- `TauCeti.LogAdic.BoundaryMonodromy.unipotent_along`: For an irreducible component Z of D: unipotence (quasi-unipotence) of the inertia Ẑ′(1) at geometric points of Z over the smooth locus of D; L|U has unipotent geometric monodromy along D iff it has along every component. This defines `n_Z` in DLLZ-RH Theorem 3.2.3(4).

**Checks.**

- `TauCeti.LogAdic.BoundaryMonodromy.trivial`: The constant local system has zero logarithm and unipotent inertia.
- `TauCeti.LogAdic.BoundaryMonodromy.jordan`: For `U=[[1,1],[0,1]]`, `log U=[[0,1],[0,0]]` and its square is zero.
- `TauCeti.LogAdic.BoundaryMonodromy.finite_character`: A rank-one local system given by a finite-order character whose restriction to `π_1^két(X(ξ))` is nontrivial for some geometric point `ξ` of D (e.g. the quadratic character of adjoining √T on the closed unit disc with `D={T=0}`, `char k≠2`) has quasi-unipotent but not unipotent geometric monodromy along D; a nontrivial finite-order character that is trivial on all these inertia groups has unipotent monodromy.
- `TauCeti.LogAdic.BoundaryMonodromy.componentwise`: On `X=D²` over k with `char k≠2` and `D=Z₁∪Z₂`, `Z_i={T_i=0}`, the rank-one Kummer local system on which `γ₁` acts trivially and `γ₂` by `−1` (from adjoining √T₂) has unipotent geometric monodromy along Z₁ but not along Z₂, hence not along D.
- A finite nontrivial tame character is quasi-unipotent and is not unipotent.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.7, p. 89: The defining condition on the action of `π_1^két(X(ξ),ξ̃)` on stalks, with the strict localization convention kept in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §6.3, before Definition 6.3.7, p. 89: Sets the normal crossings setting of Example 2.3.17 for the definition. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 6.3.8, pp. 89–90: Identifies the local inertia with `Γ^J` on the strata `U_J`, as in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.11, p. 90: The smooth-locus reduction used in the smooth_locus API item. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 6.3.13, p. 91: Componentwise formulation at geometric points over the generic points (smooth locus) of the components, via the algebraic analogue of Lemma 6.3.11. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(4), p. 25: Use of unipotent geometric monodromy along a single component Z, which the unipotent_along API item supplies.

*Needs:* [6.33](#section-6-33); [6.17](#section-6-17); [6.26](#section-6-26); [6.5](#section-6-5); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2.

Applications include DLLZ-RH Theorem 3.2.12: Controls tensor compatibility and nilpotent residues; `AutomorphicBundles` B3.general: Canonical full-group coefficients have unipotent boundary monodromy; DLLZ-RH Theorem 3.2.3(4) and Corollary 3.5.7: `n_Z`, and nilpotence of `Res_Z`, use unipotence along a single component Z ([7.25](#section-7-25)).

<a id="section-6-36"></a>

### 6.36 Cohomological dimension of the analytic site

Prove `TauCeti.LogAdic.analytic_cohomological_dimension`. Let X be a quasi-compact quasi-separated rigid analytic variety of dimension d over a nonarchimedean field k (a locally noetherian analytic adic space locally of finite type over k). Then `H^i(X_an, F) = 0` for every abelian sheaf F on the analytic site and every `i > d`.

X qcqs, locally of finite type over k; d the dimension of X. The bound is for the analytic site; for the étale site with ℓ-torsion coefficients the corresponding bound is `ClassicalAdicEtaleCohomology` §11.2 (`ordinary_etale_cohomological_dimension`).

The topological space |X| is spectral of Krull dimension d (each affinoid of dimension d has a spectral space of Krull dimension d), and abelian sheaves on the analytic site are sheaves on |X|; Scheiderer's vanishing theorem for spectral spaces bounds the cohomological dimension by the Krull dimension.

**Checks.**

- For X a point `(d = 0)`, `H^i(X_an, F) = 0` for `i > 0`.
- For the closed unit disc `(d = 1)`, `H²(X_an, F) = 0` for every abelian sheaf F.
- For a Tate curve over `C (d = 1)`, `H¹(X_an, ℤ) ≅ ℤ` is nonzero, so the bound d cannot be lowered for arbitrary abelian sheaves, whereas coherent sheaves on affinoids are acyclic in all positive degrees ([6.1](#section-6-1)).

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), proof of the remaining statements of Theorem 6.2.1, p. 87: the cohomological dimension of `X_an` is bounded by dim X (citing de Jong–van der Put, Proposition 2.5.8), used to bound the logarithmic étale cohomology.

*Needs:* `AdicSpacesPartII` R0 (locally noetherian adic space); `AdicSpacesPartII` R1 (affinoid domain equidimensional).

Applications include [7.4](#section-7-4) (vanishing of `H^i(X_két, L)` for `i > 2 dim X`).

<a id="section-6-37"></a>

### 6.37 The projection formula for locally free coefficients

Prove `TauCeti.LogAdic.projection_formula_locallyFree`. Let `μ`: `(T, O_T) → (S, O_S)` be a morphism of ringed sites, F a complex of `O_T`-modules and E a finite locally free `O_S`-module (or a bounded complex of such). The natural map `Rμ_*F ⊗_{O_S} E → Rμ_*(F ⊗_{O_T} μ*E)` is an isomorphism, compatible with composition of morphisms of ringed sites and with tensor products in E. In particular, for the projection `μ′`: `X_prokét → X_an` of a log smooth fs log adic space and the log de Rham complex `Ω^{log,•}_X`, `Rμ′_*(L̂ ⊗ OB_dR,log ⊗ Ω^{log,•}_X) ≅ Rμ′_*(L̂ ⊗ OB_dR,log) ⊗ Ω^{log,•}_X`, termwise.

`μ` a morphism of ringed sites; E finite locally free, which is what makes the statement local and elementary; no flatness of `μ` and no general projection formula for arbitrary E is asserted.

The map is defined by adjunction (`EnhancedDerivedSheaves` E1: the pullback–pushforward adjunction and the derived tensor product of module sheaves on ringed topoi). Whether it is an isomorphism is local on S; locally `E ≅ O_S^n`, and both sides become `(Rμ_*F)^n` compatibly. For a bounded complex of finite locally free modules use the stupid filtration and the five lemma.

**Checks.**

- For `E = O_S` the map is the identity of `Rμ_*F`.
- For `μ` the identity of `(S, O_S)` the formula is the associativity of tensor products.
- For `E = O_S^n` the isomorphism is the n-fold sum of the identity of `Rμ_*F`: the formula carries no sign or twist, which fixes its normalization in the connection of `RH_log`.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.3, (3.3.1), p. 28: the projection formula for `Rμ′_*` with the locally free log de Rham terms, used to define the connection on `RH_log`. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.5, p. 42: the same projection formula in the relative comparison.

*Needs:* `EnhancedDerivedSheaves` E1 (presentability and derived tensor); `CategoryTheory.Sheaf`.

Applications include [7.16](#section-7-16), [7.20](#section-7-20), [7.27](#section-7-27) and [7.28](#section-7-28) (connections and comparisons on `Rμ′_*` of period sheaves).

### Examples

On a logarithmic disc, the root map `T↦S^n` keeps the point `T=0` and is Kummer étale when n is invertible in the analytic ring. The trivial log structure is the units sheaf; a one-element monoid fails over `Q_p`. The residue of dlog T is 1, while the residue of dT is 0. Prime-to-p roots are necessary in an all-integer-divisible tower. The detailed computations and negative controls are included with the definitions above.

### Dependencies

AdicSpacesPartIII R3; `AdicEtaleGeometry` §§A1.6–A1.6a; `AdicEtaleGeometry` A1; `DiamondsAndVStacks` D0; `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; `CrystallineCohomology` CR.5; `AdicSpacesPartII` R0; AdicSpacesPartIV R4; `AdicSpacesPartII` R1; `PerfectoidSpaces` P1; `AdicEtaleGeometry` A4; `PerfectoidSpaces` P3; `EnhancedDerivedSheaves` E2; `PerfectoidSpaces` P0; `EnhancedDerivedSheaves` E1. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 7: Logarithmic periods and canonical local systems

Layer 7 proves the logarithmic primitive comparison and its finiteness consequences, with the relative finiteness of proper smooth pushforwards. It then builds the logarithmic period sheaves, their connection, the logarithmic Poincaré lemma and Faltings extension, the geometric and arithmetic logarithmic Riemann–Hilbert functors with residues, pullback, tensor and proper comparisons, the agreement of these constructions with the modular-curve construction of `CohomologyComparisons` §6.1, and the canonical coefficients of a Shimura datum of Hodge type, associated through the universal abelian scheme, with their two de Rham lattices. These give the lattice Hodge–Tate filtration, the reduction `P_HT` and the finite-level cyclotomic Levi-torsor comparison, which agree on the open Shimura variety with the construction of Layer 2.

<a id="section-7-1"></a>

### 7.1 Toric character cohomology estimates

Prove `TauCeti.LogAdic.toric_kummer_cohomology`. Let k be a perfectoid field of characteristic zero and residue characteristic p containing all roots of unity, `k⁺=O_k`, P a sharp fs monoid, `V=Spa(S₁,S₁⁺)` a log smooth affinoid fs log adic space over `Spa(k,k⁺)` with a toric chart `V→E=Spa(k⟨P⟩,k⁺⟨P⟩)`, `n=dim V`, and L an F_p-local system on `V_két`. (1) `H^i(V_két,L⊗_{F_p}O⁺_V/p)` is almost zero for all `i>n`. (2) If `V′⊂V` is a rational subset strictly contained in V (the closure of V′ lies in V), the image of `H^i(V_két,L⊗O⁺_V/p)→H^i(V′_két,L⊗O⁺_V/p)` is an almost finitely generated `k⁺`-module for each `i≥0`. (3) (Lemma 6.1.7) Fix any `r≥0` (independent of `n=dim V`). For `Γ=Hom(P^gp,Ẑ(1))` and a `k⁺/p^r-module M` on which `Γ` acts through a primitive character `χ:Γ→μ_m`, every `H^i(Γ,M)` is killed by `ζ_m−1` for any primitive m-th root of unity `ζ_m`; if moreover `M≅M₀⊗_{k₀⁺/p^r}k⁺/p^r` as `Γ`-modules for a finite extension k₀ of `Q_p(μ_m)` in k, a finitely generated k₀⁺/p^r-algebra T₀ and a finite T₀-module M₀, then `H^i(Γ,M)` is a finitely presented `T₀⊗_{k₀⁺/p^r}k⁺/p^r`-module.

Strict containment means closure(V′)⊂V. For Lemma 6.1.7 the finite-presentation assertion requires its finite coefficient model.

k perfectoid over `Q_p`: DLLZ-adic Proposition 6.1.1 assumes only that k has characteristic zero and contains all roots of unity, but its proof uses that Ẽ is log affinoid perfectoid, which needs k perfectoid; Theorem 6.2.1 applies it with k algebraically closed. Almost mathematics is with respect to the maximal ideal of `O_k`.

Decompose `k⁺[P_{Q≥0}]` by the finite-order characters of `Γ` (Lemma 6.1.6) and compute `H^i(Γ,M)` by the Koszul complex of `Γ≅Ẑ(1)^{rk P^gp}` as in Scholze 2013 Lemma 5.5, with flat base change for the finite-presentation clause (Lemma 6.1.7, Remark 6.1.8).

For a log affinoid perfectoid U, `H^i(U_két,L⊗O⁺/p)` is almost zero for `i>0` and its `H^0` is almost finitely generated projective over `R⁺/p` (Lemma 6.1.11: Theorem 5.4.3 on a trivializing finite Kummer étale cover and almost faithfully flat descent).

(1): for the Galois cover `Ṽ→V` with group `Γ`, the Cartan–Leray spectral sequence of [6.25](#section-6-25) (Propositions 5.1.7 and 5.1.12 and Scholze 2013 Proposition 3.7(iii)) gives `H^i(V_két,L⊗O⁺/p)≅^a H^i(Γ,L(Ṽ))`; `Γ` has cohomological dimension n.

(2): choose rational `V=V^{(1)}⊃⋯⊃V^{(n+2)}=V′`, each strictly contained in the previous, approximate by finite levels (Lemma 6.1.9, analogue of Scholze 2013 Lemma 4.5), and use the Hochschild–Serre spectral sequence for `mΓ⊂Γ`, Remark 6.1.8 and Scholze 2013 Lemma 5.4.

**Checks.**

- For a nontrivial character `χ` of order m, every `H^i(Γ,(k⁺/p)[P_{Q≥0}]_χ)` is killed by `ζ_m−1` (Lemma 6.1.7); for `χ=1` the summand is `(k⁺/p)[P]` with trivial `Γ`-action and `H^i(Γ,(k⁺/p)[P])≅(k⁺/p)[P]^{⊕C(r,i)}`, `r=rk P^gp`, which is nonzero for `0≤i≤r`.
- For `P=0` and `V=Spa(k,O_k)`, `Γ` is trivial and `H^i(V_két,O⁺/p)` is almost zero for every `i>0`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 6.1.1, p. 81: Hypotheses of Proposition 6.1.1; the statement adds that k is perfectoid, which the proof uses. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 6.1.1(1), p. 81: Part (1): almost vanishing above the dimension. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 6.1.1(2), p. 81: Part (2): almost finite generation of restriction images to strictly contained rational subsets. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.1.7, p. 83: Part (3): the character cohomology estimate and, in the same lemma, the finite-presentation clause.

*Needs:* [6.26](#section-6-26); [6.32](#section-6-32); [6.17](#section-6-17); [6.24](#section-6-24); `PerfectoidSpaces` P0 (almost faithfully flat descent); [6.25](#section-6-25); `PerfectoidSpaces` P0 (almost finitely generated and presented); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness).

<a id="section-7-2"></a>

### 7.2 Proper log almost finiteness

Prove `TauCeti.LogAdic.proper_log_almost_finiteness`. Let `(k,k⁺)` be an affinoid field with k algebraically closed of characteristic zero and residue characteristic p, X a proper log smooth fs log adic space over `Spa(k,k⁺)` and L an F_p-local system on `X_két`. Then `H^i(X_két,L⊗_{F_p}O⁺_X/p)` is an almost finitely generated `k⁺`-module for each `i≥0` and is almost zero for i sufficiently large. Almost mathematics is with respect to the maximal ideal `m_k` of `O_k` (contained in `k⁺`). This is an integral almost statement, not finite generation or vanishing before almost localization.

Properness and log smoothness are both required; arbitrary open affinoids are excluded.

k is over `Q_p`: the source states only 'characteristic zero', but the proof uses log affinoid perfectoid objects, which live over `Spa(Z_p,Z_p)`.

Reduce to `k⁺=O_k`: for `X′=X×_{Spa(k,k⁺)}Spa(k,O_k)`, compare the Čech spectral sequences of a covering by log affinoid perfectoid objects using Lemma 6.1.11 and Proposition 5.1.7.

Lemma 6.2.4: by Proposition 3.1.10 and the argument of Scholze 2013 Lemma 5.3 (properness), choose N affinoid étale coverings by chains `V_h^{(N)}⊂⋯⊂V_h^{(1)}` of rational subsets, each strictly contained in the previous, with toric charts on `V_h^{(1)}` and fibre products that are compositions of rational localizations and finite étale maps.

Map the Čech spectral sequences of the N coverings to each other, apply Proposition 6.1.1(2) to the transition maps and Scholze 2013 Lemma 5.4 for almost finite generation; Proposition 6.1.1(1) and the first spectral sequence give almost vanishing in large degrees.

**Checks.**

- Proper smooth trivial-log spaces specialize to the ordinary primitive input.
- For `X=Spa(k,O_k)` and `L=F_p`, `H^0` is `k⁺/p` and `H^i=0` for `i>0`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1, p. 85: Hypotheses of Theorem 6.2.1, kept in the statement (properness and log smoothness). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1(1), p. 85: The almost finite generation conclusion of part (1). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.2.4, p. 86: The covering lemma used in the proof, with its properness hypothesis. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Theorem 6.2.1(1), p. 86: The reduction to `k⁺=O_k` used in the proof.

*Needs:* [7.1](#section-7-1); [6.26](#section-6-26); [6.29](#section-6-29); [6.24](#section-6-24); `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3; `DiamondsAndVStacks` D0 (cech to derived comparison); `PerfectoidSpaces` P0 (almost finitely generated and presented); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness).

<a id="section-7-3"></a>

### 7.3 Logarithmic primitive comparison

Prove `TauCeti.LogAdic.log_primitive_comparison`. For proper log smooth fs X over `Spa(k,k⁺)`, k algebraically closed of characteristic zero and residue characteristic p, and an F_p-local system L on `X_két`, the canonical map `H^i(X_két,L)⊗_{F_p}(k⁺/p)→H^i(X_két,L⊗_{F_p}O⁺_X/p)` is an almost isomorphism of `k⁺`-modules for every `i≥0`. Transport along `ν` gives the matching pro-Kummer formulation. Its properness hypothesis is retained by every finite-level application.

DLLZ Theorem 6.2.1; no SNC assumption is needed for the comparison itself.

The Artin–Schreier sequence `0→L→L⊗Ô^♭→L⊗Ô^♭→0` (σ=Id⊗(Φ−Id)) is exact on `X_prokét`, checked on log affinoid perfectoid objects trivializing L via Lemma 5.3.8 and the argument of Scholze 2013 Theorem 5.1.

Choose `ϖ∈k♭` with `ϖ♯=p`; by Theorem 6.2.1(1) and Scholze 2013 Lemma 2.12, `H^i(X_prokét,L⊗Ô^{♭+}/ϖ^m)^a≅(O^a_{k♭}/ϖ^m)^r` compatibly in m and with Frobenius; [6.31](#section-6-31) (Scholze 2013 Lemma 3.18) passes to `Ô^{♭+}` and inverting `ϖ` to `Ô^♭≅(k♭)^r`.

Take Frobenius invariants in the long exact sequence and use Proposition 5.1.7: `H^i(X_két,L)≅F_p^r` and `H^i(X_két,L)⊗k^{+a}/p≅H^i(X_két,L⊗O⁺/p)^a`.

**Checks.**

- For the constant Fp-sheaf on a geometric point the map is Fp⊗Fp `k⁺/p≃k⁺/p`.
- Empty boundary agrees with Scholze’s ordinary primitive theorem.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §6.2 and Theorem 6.2.1(2), p. 85: Introduces Theorem 6.2.1, whose part (2) is the almost isomorphism `H^i(X_két,L)⊗k⁺/p→H^i(X_két,L⊗O⁺/p)` stated here with the same hypotheses plus residue characteristic p (with the hypotheses stated here). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Theorem 6.2.1(2), p. 87: The Artin–Schreier step of the proof followed in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Theorem 6.2.1(2), p. 87: The tilt-side computation; it uses that k has residue characteristic p, made explicit in the statement.

*Needs:* [7.2](#section-7-2); [6.32](#section-6-32); [6.30](#section-6-30); [6.29](#section-6-29); [6.24](#section-6-24); [6.31](#section-6-31); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness).

<a id="section-7-4"></a>

### 7.4 Logarithmic cohomological finiteness and vanishing

Prove `TauCeti.LogAdic.log_cohomology_finite_vanishing`. Let k be algebraically closed of characteristic zero and residue characteristic p. (1) Under the hypotheses of Theorem 6.2.1 (X proper log smooth fs over `Spa(k,k⁺)`, L an F_p-local system on `X_két`), `H^i(X_két,L)` is a finite-dimensional F_p-vector space for each `i≥0` and vanishes for i sufficiently large. (2) If moreover X is a smooth rigid analytic variety with the log structure of a normal crossings divisor (Example 2.3.17), `H^i(X_két,L)=0` for `i>2 dim X`. (3) If `U = X − D` for a proper smooth rigid analytic variety X over k and a normal crossings divisor D, then `H^i(U_ét,L)` is finite-dimensional for each F_p-local system L on `U_ét` and each `i≥0`, and `H^i(U_ét,L)=0` for `i>2 dim U`.

The 2 dim bound is the normal crossings case; neither it nor finiteness is asserted for arbitrary nonproper rigid spaces.

In (3) the smooth compactification with normal-crossings boundary is a hypothesis. DLLZ-adic Corollary 6.2.3 assumes only that U is Zariski open in a proper rigid space and obtains such a compactification by resolution of singularities for rigid spaces, which is outside this roadmap; every application here has a smooth toroidal compactification.

(1): Theorem 6.2.1(2) with Theorem 6.2.1(1) gives `H^i(X_két,L)⊗k⁺/p` almost finitely generated and almost zero in large degrees, hence finiteness and vanishing.

(2): by Theorem 6.2.1(2) it suffices that `H^i(X_két,L⊗O⁺/p)` is almost zero for `i>2 dim X`; using smooth toric charts `X→D^n` (Example 3.1.13) the coverings of Lemma 6.2.4 can be taken analytic, Proposition 6.1.1 gives `R^jλ_*(L⊗O⁺/p)^a=0` for `j>dim X` for `λ:X_két→X_an`, and `X_an` has cohomological dimension at most dim X ([6.36](#section-6-36), de Jong–van der Put Proposition 2.5.8).

(3): apply Theorem 4.6.1 ([6.20](#section-6-20): `(H^i(U_ét,L)≅H^i(X_két,j_két,*L))` and (1)–(2).

**Checks.**

- The closed unit disc is a counterexample to finiteness without proper compactification, as Remark 6.2.2 states.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1, consequences, p. 85: Part (1), deduced in the source from the primitive comparison. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1, last sentence, p. 85: Part (2), for the normal crossings log structure of Example 2.3.17. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 6.2.2, p. 85: Supports the acceptance criterion: no finiteness without a proper compactification. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.2.3 and its proof, pp. 85–86: Part (3); the source reduces a Zariski open U in a proper rigid space to the normal-crossings case stated here by resolution of singularities, then applies Theorems 4.6.1 and 6.2.1.

*Needs:* [7.3](#section-7-3); [7.2](#section-7-2); [7.1](#section-7-1); [6.20](#section-6-20); [6.5](#section-6-5); [6.36](#section-6-36); `ClassicalAdicEtaleCohomology` §11.2 (`ordinary_etale_cohomological_dimension`); AdicSpacesPartIV R4 (smooth pair).

<a id="section-7-5"></a>

### 7.5 Proper p-adic boundary cohomology

Prove `TauCeti.LogAdic.proper_padic_boundary_cohomology`. Let k be a complete nonarchimedean extension of `Q_p` with `k⁺=O_k`, X a smooth rigid analytic variety over k with a normal crossings divisor D and its log structure (Example 2.3.17), `U=X−D` and `j:U→X`; k̄ denotes a completed algebraic closure of k. (1) For an étale Z_p-local system L on `U_ét` (torsion allowed), `L̄=j_két,*(L)` is a Kummer étale Z_p-local system on `X_két` extending L, and every Kummer étale Z_p-local system on `X_két` is of this form; the first comparison `H^i(U_{k̄,ét},L)≅H^i(X_{k̄,két},L̄)` holds levelwise by Theorem 4.6.1. Neither statement needs properness. (2) If X is proper, there are canonical isomorphisms `H^i(U_{k̄,ét},L)≅H^i(X_{k̄,két},L̄)≅H^i(X_{k̄,prokét},L̄^)` of finite `Z_p`-modules for each `i≥0`. This is the corrected form of DLLZ-adic Corollary 6.3.4 with properness imposed for finiteness; the extension assertion itself has no properness hypothesis.

Properness of X is added (properness is needed for finiteness) for the finiteness and for the second isomorphism read with `H^i(X_két,L̄)=lim_n H^i(X_két,L̄_n)`, whose proof needs `lim^1_n H^{i−1}(X_két,L̄_n)=0`; torsion Z_p-local systems are permitted.

Over k̄ the hypotheses of Theorem 6.2.1 hold for `X_{k̄}` (proper log smooth over an algebraically closed field over `Q_p`).

Extend each torsion reduction `L_m` by Theorem 4.6.1 and Corollary 4.6.7 (R^i j_két,*L_m=0 for `i>0`) and pass to the inverse system; the extended system is again strict.

By Theorem 6.2.1 applied to `X_{k̄}`, each `H^i(X_{k̄,két},L̄_m)` is finite, so the systems are Mittag-Leffler and the limits are finite `Z_p`-modules.

Compare with the completed pro-Kummer system by Proposition 5.1.7 and Lemma 6.3.3(2): `RΓ(X_prokét,L̄^)=R lim_m RΓ(X_két,L̄_m)`, whose `lim^1` terms vanish by finiteness.

**Checks.**

- Constant Fp on the nonproper closed disc is excluded from the finite-cohomology claim.
- For X proper with `D=∅` and `L=Z_p`, the statement is the finiteness of `H^i(X_{k̄,ét},Z_p)` and its agreement with pro-étale cohomology of `Ẑ_p`.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.4, p. 88: The corollary's hypotheses: those of Theorem 4.6.1, without properness; the statement adds properness for the finiteness (properness is needed for finiteness). [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.4, p. 88: The extension statement of part (1), valid without properness. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.4, p. 88: The finiteness clause, which the statement keeps only for proper X. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Corollary 6.3.4, p. 88: The proof invokes Theorem 6.2.1, whose hypothesis requires X proper; this is why properness is added.

*Needs:* [7.4](#section-7-4); [6.33](#section-6-33); [6.34](#section-6-34); [6.20](#section-6-20); [6.24](#section-6-24); [6.31](#section-6-31).

<a id="section-7-6"></a>

### 7.6 Relative finiteness of proper smooth pushforwards

Prove `TauCeti.LogAdic.proper_smooth_local_system`. Let f: `X → Y` be a proper smooth morphism of rigid analytic varieties over a complete nonarchimedean field k of characteristic zero and residue characteristic p, and L an 𝔽_p-local system (more generally a `ℤ/p^n-` or ℤ_p-local system) on `X_ét`. Then for every i, R^if_ét,*L is a local system on `Y_ét`, its formation commutes with base change along any morphism `Y′ → Y` of rigid analytic varieties, and its stalk at a geometric point ȳ is `H^i(X_ȳ,ét, L)`.

f proper and smooth; k of characteristic zero. Without smoothness R^if_*L is only constructible; without properness the stalks are not the cohomology of the fibres.

Pass to the diamonds of X and Y: proper base change for the étale cohomology of diamonds (`DiamondEtaleCohomology` C5) identifies the stalk of R^if_*L at ȳ with `H^i` of the geometric fibre, finite-dimensional by the primitive comparison theorem (`PadicHodgeTheory` §§2.1–2.7, 7.1–7.3, primitive comparison and proper smooth finiteness); constructibility and the local constancy of a constructible sheaf whose fibre cohomology is locally constant along a smooth proper map (`DiamondEtaleCohomology` C7, local systems) give a local system; ℤ_p-coefficients by passing to the limit over `p^n`.

**Checks.**

- For `f = id`, `R⁰f_*L = L` and R^if_*L `= 0` for `i > 0`.
- For f: `E → Y` the Tate curve over the punctured disc `0 < |q| < 1` (proper smooth), `R¹f_*𝔽_p` is a local system of rank two that is not constant (it is trivialized only after adjoining `μ_p` and `q^{1/p}`); over the whole disc f is not smooth, and `R¹f_*𝔽_p` is not a local system at `q = 0`.
- For the open immersion j (smooth, not proper) of the punctured disc into the disc, `R¹j_*𝔽_p` is supported at the puncture, where it is `𝔽_p(−1)`, so it is not a local system.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5 and its proof, p. 89: the Kummer proper pushforward of ℤ_p-local systems deduced from Scholze–Weinstein, Berkeley lectures, Theorem 10.5.1 (relative finiteness for proper smooth morphisms of rigid spaces) and Corollary 6.3.4.

*Needs:* `DiamondEtaleCohomology` C5.8 (proper base change for diamonds); `DiamondEtaleCohomology` C7.9 (local systems of finitely generated `Λ`-modules); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness); `AdicSpacesPartII` R0 (smooth morphism).

Applications include [7.7](#section-7-7) (Kummer proper pushforward of p-adic local systems) and [7.28](#section-7-28) (relative logarithmic de Rham comparison).

<a id="section-7-7"></a>

### 7.7 Kummer proper pushforward of p-adic local systems

Prove `TauCeti.LogAdic.kummer_proper_pushforward_local_systems`. Let k be a nonarchimedean field of characteristic zero with `k⁺=O_k`, and let `f:X→Y` be a log smooth morphism of log adic spaces, where X and Y are smooth rigid analytic varieties over k whose log structures are defined by normal crossings divisors `D⊂X` and `E⊂Y` as in Example 2.3.17. Assume that the underlying morphisms of adic spaces of f and of `f|_{X−D}:X−D→Y−E` are both proper. Then, for every Z_p-local system L on `X_két` and every `i≥0`, R^if_két,*(L) is a Z_p-local system on `Y_két`.

Both properness hypotheses are those of DLLZ-adic Corollary 6.3.5 and are kept; the proof uses properness of `f|_{X−D}` (to get `X−D=f⁻¹(Y−E)` and to apply the relative finiteness of [7.6](#section-7-6)) and separatedness of f. No claim is made that either hypothesis is necessary.

The characteristic-zero, `k⁺=O_k` setting is that of Theorem 4.6.1 and Corollary 6.3.4, which the proof uses; the source states only the setting of Example 2.3.17.

Only the extension statements of Corollary 6.3.4 are used, which hold without properness (properness is needed for finiteness).

Write `U=X−D`, `V=Y−E` and `j_X:U→X`, `j_Y:V→Y`. Since f is a log morphism, `f⁻¹(E)⊂D`; since `f|_U:U→V` is proper and U is dense in `f⁻¹(V)`, `U=f⁻¹(V)`. U and V carry trivial log structures, so `f|_U` is strict and log smooth, hence smooth.

By Theorem 4.6.1 and Corollary 4.6.7 applied levelwise, `L=j_X,két,*(L|_U)` with `R^q j_X,két,*(L_m|_U)=0` for `q>0`, so `Rf_két,*(L_m)≅R(f∘j_X)_*(L_m|_U)=Rj_Y,két,*R(f|_U)_ét,*(L_m|_U)`.

The relative finiteness theorem for the proper smooth morphism `f|_U `([7.6](#section-7-6); Scholze–Weinstein, Berkeley lectures, Theorem 10.5.1) makes each `R^q(f|_U)_ét,*(L_m|_U)` an étale local system on V, and the system over m an étale Z_p-local system; Theorem 4.6.1 on Y gives R^if_két,*(L_m)≅j_Y,két,*R^i(f|_U)_ét,*(L_m|_U).

By the extension statement of Corollary 6.3.4 on Y, `j_Y,két,*` of an étale Z_p-local system on V is a Kummer étale Z_p-local system on `Y_két`; hence R^if_két,*(L) is a Z_p-local system.

**Checks.**

- If `D=E=∅` the statement is the relative finiteness theorem for étale Z_p-local systems along a proper smooth morphism of rigid analytic varieties.
- If `Y=Spa(k,O_k)` with k algebraically closed and `E=∅`, properness of `X−D` forces `D=∅` and the conclusion is that `H^i(X_ét,L)` is a finitely generated `Z_p`-module.

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89: The setting of the statement, with normal crossings (not necessarily strict) divisors as in Example 2.3.17. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89: The two properness hypotheses, kept in the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89: The conclusion of the statement. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Corollary 6.3.5, p. 89: The two inputs of the proof sketch: the relative finiteness theorem for proper smooth maps and the Kummer extension of local systems.

*Needs:* [7.5](#section-7-5); [6.20](#section-6-20); [6.33](#section-6-33); [6.7](#section-6-7); [6.5](#section-6-5); [7.6](#section-7-6).

Applications include DLLZ-RH Theorem 3.2.7(5) and Corollary 3.5.14: R^if_két,*(L) is a Z_p-local system before its log de Rham comparison is formed.

<a id="section-7-8"></a>

### 7.8 Ordinary periods on the pro-Kummer site

Construct `TauCeti.LogAdic.LogConstantPeriods`. Let X be a locally noetherian fs log adic space over `Spa(Q_p,Z_p)`, with `Ô⁺`, `Ô` and `Ô^{♭+}=lim_Φ Ô⁺` on `X_prokét`. Set `A_inf=W(Ô^{♭+})`, `B_inf=A_inf[1/p]` with `θ:B_inf→Ô`, `B_dR⁺=lim_r B_inf/(ker θ)^r` with `Fil^r B_dR⁺=(ker θ)^r B_dR⁺`, and `B_dR=B_dR⁺[t⁻¹]` for any local generator t of `(ker θ)B_dR⁺`, with `Fil^r B_dR=∑_{s≥−r} t^{−s}Fil^{r+s}B_dR⁺` (Definition 2.2.3). For every log affinoid perfectoid `U∈X_prokét` with associated perfectoid space `Û=Spa(R,R⁺)` the canonical maps are isomorphisms `A_inf(U)≅A_inf(R,R⁺)=W(R^{♭+})`, `B_inf(U)≅B_inf(R,R⁺)`, `B_dR⁺(U)≅B_dR⁺(R,R⁺)`, `B_dR(U)≅B_dR(R,R⁺)`, and `H^j(U,B_dR⁺)=H^j(U,B_dR)=0` for all `j>0` (Proposition 2.2.4). Hence t exists locally and is a nonzerodivisor, so `B_dR` and its filtration are well defined and independent of t (Remark 2.2.5). If X lies over a perfectoid field containing all roots of unity, `gr^•B_dR≅⊕_{r∈Z}Ô(r)` (Corollary 2.2.6). These are the ordinary period functors applied on `X_prokét`; no new local period ring is defined.

X is a locally noetherian fs log adic space over `Spa(Q_p,Z_p)` (Definition 2.2.3); no log smoothness and no p-adic base field is needed for the definitions or for Proposition 2.2.4.

The evaluation and acyclicity are asserted only on log affinoid perfectoid objects U of `X_prokét` (DLLZ-adic Definition 5.3.1), via the associated perfectoid pair `(R,R⁺)`.

The Tate-twisted identification `gr^r B_dR≅Ô(r)` keeps the hypothesis of Corollary 2.2.6 (X over a perfectoid field containing all roots of unity); without it only `gr^r B_dR(R,R⁺)≅ξ^rR ((2.2.2))` is asserted sectionwise.

Sectionwise the pinned Mathlib carrier `BDeRhamPlus` is used with its own hypotheses (p prime, p not a unit, p-adically complete ring), applied to `R⁺`.

Apply W, inversion of p and (ker θ)-adic completion to the tilted completed structure sheaf `Ô^{♭+} `([6.30](#section-6-30)); log affinoid perfectoid objects form a basis of `X_prokét` (DLLZ-adic Proposition 5.3.12), so it suffices to work on them.

Proposition 2.2.4: argue as in the ordinary case (Scholze 2013, Theorem 6.5; `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3 (period sheaves on affinoid perfectoids; rational acyclicity of de Rham period sheaves)), with the ordinary almost acyclicity input replaced by DLLZ-adic Theorem 5.4.3 (Ô^{♭+}(U)=R^{♭+} and almost vanishing of higher cohomology on log affinoid perfectoid U).

Remark 2.2.5: `ker θ` on `A_inf(R,R⁺)` is principal, generated by a nonzerodivisor `ξ ((2.2.1))`, so a local generator t exists; two generators differ by a unit, so `B_dR⁺[t⁻¹]` and the filtration do not depend on t.

Corollary 2.2.6: combine `gr^r B_dR(R,R⁺)≅ξ^rR ((2.2.2))` with Proposition 2.2.4 as in the ordinary case (`PadicHodgeTheory` §§2.1–2.7, 7.1–7.3, graded de Rham period sheaf Tate twist); Corollary 2.2.7 (surjectivity along strict closed immersions on log affinoid perfectoid sections) follows from DLLZ-adic Proposition 5.4.5 and Proposition 2.2.4.

The interface consists of the following named results.

- `TauCeti.LogAdic.LogConstantPeriods`: The sheaves `A_inf`, `B_inf`, `B_dR⁺`, `B_dR` on `X_prokét` obtained from `Ô^{♭+}` by the ordinary period functors, with `θ` and the filtrations of Definition 2.2.3.
- `TauCeti.LogAdic.LogConstantPeriods.theta`: `θ:A_inf→Ô⁺`, and its p-inverted and completed versions `θ:B_inf→Ô`, `θ:B_dR⁺→Ô`, surjective with kernel `Fil¹`.
- `TauCeti.LogAdic.LogConstantPeriods.fil`: `Fil^r B_dR⁺=(ker θ)^r B_dR⁺` and `Fil^r B_dR=∑_{s≥−r}t^{−s}Fil^{r+s}B_dR⁺`; decreasing, separated and complete, independent of the local generator t.
- `TauCeti.LogAdic.LogConstantPeriods.grade`: If X lies over a perfectoid field containing all roots of unity, `gr^r B_dR≅Ô(r)` canonically for all `r∈Z` (Corollary 2.2.6); sectionwise `gr^r B_dR(R,R⁺)≅ξ^rR` in general.
- `TauCeti.LogAdic.LogConstantPeriods.sections`: For a log affinoid perfectoid U with associated perfectoid `Û=Spa(R,R⁺)`: `A_inf(U)≅W(R^{♭+})`, `B_inf(U)≅W(R^{♭+})[1/p]`, `B_dR⁺(U)≅B_dR⁺(R,R⁺)` and `B_dR(U)≅B_dR(R,R⁺)`, compatibly with `θ` and filtrations (Proposition 2.2.4(1)).
- `TauCeti.LogAdic.LogConstantPeriods.acyclic_log_affinoid_perfectoid`: For a log affinoid perfectoid U, `H^j(U,B_dR⁺)=H^j(U,B_dR)=0` for all `j>0` (Proposition 2.2.4(2)).
- `TauCeti.LogAdic.LogConstantPeriods.closed_restriction_surjective`: For a strict closed immersion `ı:Z→X`, `B_dR,X⁺→ı_{prokét,*}B_dR,Z⁺` is surjective, already on sections over every log affinoid perfectoid U (Corollary 2.2.7).

**Checks.**

- `TauCeti.LogAdic.LogConstantPeriods.trivial_log`: For the trivial log structure, under X_prokét≃X_proét these sheaves, `θ` and filtrations are `PadicHodgeTheory §§2.1–2.3’s A_inf`, `B_inf`, `B_dR⁺`, `B_dR`.
- `TauCeti.LogAdic.LogConstantPeriods.grade_zero`: `θ` induces `B_dR⁺/Fil¹B_dR⁺≅Ô`; on a log affinoid perfectoid U this is `B_dR⁺(R,R⁺)/ξ≅R`.
- `TauCeti.LogAdic.LogConstantPeriods.not_integral_completion`: `(lim_r A_inf(R,R⁺)/ξ^r)[1/p]=A_inf(R,R⁺)[1/p]` is not `B_dR⁺(R,R⁺)`: the convergent series `∑_{n≥0}p^{−n}ξ^n` lies in `B_dR⁺(R,R⁺)` but not in `A_inf(R,R⁺)[1/p]`.
- `TauCeti.LogAdic.LogConstantPeriods.point_values`: For `X=Spa(K,O_K)` with K a perfectoid field and trivial log structure, `U=X` is log affinoid perfectoid and `B_dR⁺(U)=B_dR⁺(K,O_K)`, Fontaine's ring, with `Fil^r=ξ^rB_dR⁺(K,O_K)`.
- There is no new local period-ring definition duplicating §§2.7, 7.1–7.3: sectionwise the rings are `A_inf(R,R⁺)`, `B_dR⁺(R,R⁺)`, `B_dR(R,R⁺)` of the associated perfectoid pair.
- On every log affinoid perfectoid U the sections are those of the associated perfectoid pair and `H^j(U,B_dR⁺)=H^j(U,B_dR)=0` for `j>0`; this is the evaluation used by PerfectoidShimuraVarieties S6.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.3(2), p. 12: Definition 2.2.3(2) sets `B_dR=B_dR⁺[t⁻¹]` for any generator t of `(ker θ)B_dR⁺` and fixes `t=log[ε]` only in (2.3.2); the statement keeps the arbitrary local generator and the convolution filtration of Definition 2.2.3(3). [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 2.2.4(1)–(2), p. 12: Proposition 2.2.4 gives the values of `A_inf`, `B_inf`, `B_dR⁺`, `B_dR` on a log affinoid perfectoid U through its associated perfectoid pair and the vanishing of higher cohomology of `B_dR⁺` and `B_dR`; both conclusions are required. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.2.5, p. 12: Remark 2.2.5 is the well-definedness of `B_dR` and its filtration used here. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.2.6, p. 12: Corollary 2.2.6 identifies `gr^•B_dR` with `⊕Ô(r)` under the stated base hypothesis, which the statement keeps.

*Needs:* [6.30](#section-6-30); [6.32](#section-6-32); [6.27](#section-6-27); [6.29](#section-6-29); `PadicHodgeTheory` §§2.1–2.4 (period sheaves definitions); `PadicHodgeTheory` §§2.1–2.4 (period sheaves on affinoid perfectoids); `PadicHodgeTheory` §§2.1–2.4 (rational acyclicity of de rham period sheaves); `PadicHodgeTheory` §§2.1–2.4 (de rham period sheaf); `PadicHodgeTheory` §§2.1–2.4 (graded de rham period sheaf tate twist); `BDeRhamPlus`; `fontaineThetaInvertP`.

Applications include DLLZ-RH Definition 2.2.10: The structural periods are B_dR⁺-algebras containing these constant coefficient periods; DLLZ-RH Proposition 2.3.15: `B_dR⁺|_X̃[[P−1]]` is built on the values `B_dR⁺(U)` of Proposition 2.2.4; DLLZ-RH Corollaries 2.4.2(4) and 2.4.5: `gr^r B_dR≅Ô(r)` gives the Tate twists in the graded Poincaré lemma and the Faltings extension; DLLZ-RH Lemma 3.6.1: Primitive comparison upgrades to B_dR⁺-cohomology; PerfectoidShimuraVarieties S6: Evaluation of `A_inf`, `B_dR⁺`, `B_dR` on log affinoid perfectoid test objects over the toroidal tower (sections and acyclic_log_affinoid_perfectoid), to restrict `P_HT` to perfectoid test objects.

<a id="section-7-9"></a>

### 7.9 Positive structural logarithmic periods

Construct `TauCeti.LogAdic.StructuralLogPeriodPlus`. Assume the residue field `κ` of k is perfect, so the W(κ)-algebra structures below are defined. Let X be a locally noetherian fs log adic space over Spa(k,k⁺) (k of characteristic 0, residue field `κ` of characteristic p). For a log affinoid perfectoid `U=lim_{i∈I}U_i∈X_prokét` with `U_i=(Spa(R_i,R_i⁺),M_i,α_i)` and associated perfectoid pair `(R,R⁺)`, put `M_i=M_i(U_i)`, `M=colim_iM_i=M(U)` and M♭=lim_{a↦pa}M=M♭(U), with `α♭:M♭→R♭`. For `r≥1`, `S_{i,r}` is the quotient of the monoid algebra `(R_i⊗̂_{W(κ)}(W(R^{♭+})/ξ^r))[M_i×_M M♭]` by the elements `α_i(a′)⊗1−(1⊗[α♭(a″)])e_a` for `a=(a′,a″)` (equation (2.2.8)); `[α♭(a″)]∈W(R^{♭+})[1/p]/ξ^r` acts because p is invertible in `R_i`. The map `θ_log:S_{i,r}→R` induced by `R_i→R` and `θ` with `θ_log(e_a)=1` is well defined since `θ([α♭(a″)])=α_i(a′) ((2.2.9))`. Put `Ŝ_i=lim_{r,s}S_{i,r}/(ker θ_log)^s`; `colim_iŜ_i` depends only on U. `OB⁺_dR,log` is the sheaf on `X_prokét` associated with `U↦colim_iŜ_i` on the log affinoid perfectoid basis, with `θ_log:OB⁺_dR,log→Ô` and `Fil^rOB⁺_dR,log=(ker θ_log)^rOB⁺_dR,log` (Definition 2.2.10(1)). It is an O_{X_prokét}-algebra and a filtered B_dR⁺-algebra.

X is a locally noetherian fs log adic space over `Spa(k,k⁺)`, k nonarchimedean of characteristic 0 with residue characteristic p (DLLZ-RH §2); the source applies the sheaf only to X log smooth over a p-adic field or to strata with induced log structure (Remark 2.2.12).

The completed tensor product is over `W(κ)`, which uses W(κ)-algebra structures on `R_i` and `W(R^{♭+})`; these exist when `κ` is perfect, in particular over p-adic fields.

The relation is `α_i(a′)=[α♭(a″)]e_a`, imposed without inverting `α_i(a′)` or `[α♭(a″)]`; where `α♭(a″)=0` it reduces to `α_i(a′)=0` and leaves `e_a` free (DLLZ-RH p. 18).

Form `S_{i,r}` by (2.2.8) and check that `θ_log` is well defined from `θ([α♭(a″)])=α_i(a′)` in R ((2.2.9)).

Complete at `ker θ_log`, take the limit over r and the colimit over i; a cofinal change of presentation of U induces canonical filtered isomorphisms, so `colim_iŜ_i` depends only on U.

Sheafify on the basis of log affinoid perfectoid objects (DLLZ-adic Proposition 5.3.12) and set `Fil^r=(ker θ_log)^r`; the maps `R_i→S_{i,r}` and `W(R^{♭+})/ξ^r→S_{i,r}` give the `O_{X_prokét}-` and B_dR⁺-algebra structures (using Proposition 2.2.4 for `B_dR⁺(U)`).

The interface consists of the following named results.

- `TauCeti.LogAdic.StructuralLogPeriodPlus`: The sheafification of `U↦colim_iŜ_i` on log affinoid perfectoid objects, with `θ_log` and the filtration `Fil^r=(ker θ_log)^r`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta_generator`: `θ_log(e_a)=1` for every `a∈M_i×_M M♭`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.structural_relation`: `α_i(a′)=[α♭(a″)]e_a` in `S_{i,r}`, hence in `OB⁺_dR,log`, for `a=(a′,a″)`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.presentation_invariance`: Cofinal changes of the pro-presentation of U induce canonical filtered isomorphisms of `colim_iŜ_i`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta_surjective`: `θ_log:OB⁺_dR,log→Ô` is surjective with kernel `Fil¹OB⁺_dR,log`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.bdr_algebra`: The filtered B_dR⁺-algebra structure induced by `W(R^{♭+})/ξ^r→S_{i,r}`; `θ_log` restricts to `θ` on `B_dR⁺`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.structure_algebra`: The O_{X_prokét}-algebra structure induced by `R_i→S_{i,r}`; `θ_log` restricts to `O_{X_prokét}→Ô`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.pullback`: A morphism `f:X→Y` of locally noetherian fs log adic spaces over `Spa(k,k⁺)` induces a filtered map `f_prokét⁻¹OB⁺_dR,log,Y→OB⁺_dR,log,X` compatible with `θ_log`, the `e_a` and the B_dR⁺-structures, with map_id and map_comp.

**Checks.**

- `TauCeti.LogAdic.StructuralLogPeriodPlus.rank_zero`: For the trivial log structure, under X_prokét≃X_proét, `OB⁺_dR,log` is filtered isomorphic to `PadicHodgeTheory` §2.3’s corrected `OB_dR⁺`, each `e_a` being `α_i(a′)[α♭(a″)]⁻¹`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta`: `θ_log` induces `OB⁺_dR,log/Fil¹≅Ô`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation`: If α♭(a″)=0 (a boundary coordinate vanishing on the stratum), the relation gives `α_i(a′)=0` and imposes no constraint on `e_a`; the relation is not rewritten as `e_a=α_i(a′)/[α♭(a″)]`.
- Boundary coordinates remain visible through `e_a`; replacing them by ordinary tensor periods loses dlog terms.
- For the trivial log structure the relation forces `e_a=α_i(a′)[α♭(a″)]⁻¹` and `S_{i,r}=R_i⊗̂_{W(κ)}(W(R^{♭+})/ξ^r)`, so `OB⁺_dR,log` agrees with `PadicHodgeTheory` §2.3’s corrected `OB_dR⁺`.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (2.2.8) and following, p. 13: The relation ring `S_{i,r}` of (2.2.8) with the structural relation `α_i(a′)=[α♭(a″)]e_a`, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (2.2.9), p. 13: The well-definedness of `θ_log` with `θ_log(e_a)=1` used here. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.10(1), p. 13: `OB⁺_dR,log` is the sheafification of `U↦colim_iŜ_i` with `Fil^r=(ker θ_log)^r`, for X over `Spa(k,k⁺)` as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.2.12, p. 14: Confirms that the definition is general and the applications are log smooth over p-adic fields or strata; the statement keeps the general definition.

*Needs:* [6.4](#section-6-4); [6.30](#section-6-30); [7.8](#section-7-8); [6.27](#section-6-27); [6.29](#section-6-29); `AdicCompletion`; `AdicSpacesPartII` R0 (completed tensor product).

Applications include DLLZ-RH §2.3: Completed monoid relations give the power-series coordinates; DLLZ-RH Corollary 2.4.2: Positive log Poincaré resolution starts with this sheaf; DLLZ-RH Corollary 2.3.20 and Corollary 2.4.6: Pullback along strict closed immersions and log smooth maps; PerfectoidShimuraVarieties S6: Evaluation of the logarithmic period sheaves on log affinoid perfectoid test objects over the toroidal tower diamond: `OB⁺_dR,log(U)=colim_iŜ_i`, and over a toric chart `Ŝ_i≅OB⁺_dR,log(U)≅B_dR⁺(U)[[P−1]]`.

<a id="section-7-10"></a>

### 7.10 Filtered completion of structural periods

Construct `TauCeti.LogAdic.StructuralLogPeriod`. Let t be a local generator of `Fil¹B_dR⁺` as in Definition 2.2.3(2). On `OB⁺_dR,log[t⁻¹]` put `Fil^r=∑_{s≥−r}t^{−s}Fil^{r+s}OB⁺_dR,log` (Definition 2.2.10(2)). `OB_dR,log` is the completion of `OB⁺_dR,log[t⁻¹]` for this filtration: `Fil^rOB_dR,log=lim_{s≥0}Fil^r(OB⁺_dR,log[t⁻¹])/Fil^{r+s}(OB⁺_dR,log[t⁻¹])` and `OB_dR,log=∪_{r∈Z}Fil^rOB_dR,log` (Definition 2.2.10(3)); `OC_log=gr⁰OB_dR,log`. `Fil⁰OB_dR,log` is a sheaf of rings and `OB_dR,log=(Fil⁰OB_dR,log)[t⁻¹]`. In general `OB_dR,log≠OB⁺_dR,log[t⁻¹]`, already for the trivial log structure, where `OB_dR,log` differs from the uncompleted `OB_dR` of Brinon and Scholze (Remark 2.2.11).

X is as for `OB⁺_dR,log` (locally noetherian fs over `Spa(k,k⁺)`).

The additional completion of Definition 2.2.10(3) is part of the definition; the filtration is the convolution filtration, not the t-adic filtration alone, and it does not depend on the choice of local generator t.

Define the convolution filtration on `OB⁺_dR,log[t⁻¹]`; two local generators of `Fil¹B_dR⁺` differ by a unit, so it is independent of t.

Complete each `Fil^r` against `Fil^{r+s}`, `s≥0`, as an inverse limit of sheaves, and take the union over r.

Check that `Fil⁰` is a sheaf of rings with `OB_dR,log=Fil⁰[t⁻¹]`, that `B_dR→OB_dR,log` is filtered, and set `OC_log=gr⁰`.

The interface consists of the following named results.

- `TauCeti.LogAdic.StructuralLogPeriod`: The filtration completion of `OB⁺_dR,log[t⁻¹]`, with its filtration pieces and `OC_log=gr⁰`.
- `TauCeti.LogAdic.StructuralLogPeriod.completion_map`: The filtered map from `OB⁺_dR,log[t⁻¹]` into its filtration completion.
- `TauCeti.LogAdic.StructuralLogPeriod.grade`: The completion map induces isomorphisms on all `gr^r`.
- `TauCeti.LogAdic.StructuralLogPeriod.complete_piece`: Each `Fil^r` is the inverse limit of its `Fil^r/Fil^{r+s}` quotients, `s≥0`.
- `TauCeti.LogAdic.StructuralLogPeriod.fil_zero_ring`: `Fil⁰OB_dR,log` is a sheaf of rings, `Fil^r·Fil^s⊂Fil^{r+s}`, and `OB_dR,log=(Fil⁰OB_dR,log)[t⁻¹]`.
- `TauCeti.LogAdic.StructuralLogPeriod.oc_log`: `OC_log=gr⁰OB_dR,log`, an Ô-algebra receiving `Fil⁰OB_dR,log`.
- `TauCeti.LogAdic.StructuralLogPeriod.bdr_algebra`: The filtered B_dR-algebra map `B_dR→OB_dR,log` extending `B_dR⁺→OB⁺_dR,log`.
- `TauCeti.LogAdic.StructuralLogPeriod.t_independent`: The filtration and the completion do not depend on the local generator t of `Fil¹B_dR⁺`.

**Checks.**

- `TauCeti.LogAdic.StructuralLogPeriod.zero_log`: For the trivial log structure `OB_dR,log` is the filtration completion of `PadicHodgeTheory §§2.1–2.3’s OB_dR⁺[t⁻¹]` and contains the series of cauchy_sum, which is not in `OB_dR⁺[t⁻¹]`; it is not the uncompleted `OB_dR`.
- `TauCeti.LogAdic.StructuralLogPeriod.cauchy_sum`: In the local one-variable model with `W=y/t`, `∑_{n≥0}t^nW^{n²}` converges in `Fil⁰=B_dR⁺{W}` for the coefficientwise t-adic completion.
- `TauCeti.LogAdic.StructuralLogPeriod.localization_insufficient`: The same series has y^{n²}-coefficient `t^{n−n²}`, with unbounded negative t-valuations, and hence is not in `B_dR⁺[[y]][1/t]`; its inclusion requires the additional filtration completion.
- Trivial logs compare with the filtration-completed ordinary structural periods, not with the uncompleted `OB_dR⁺[t⁻¹]` of Brinon and Scholze (Remark 2.2.11).
- `OC_log=gr⁰OB_dR,log` is an Ô-algebra; over a toric chart it is Ô[W_1,…,W_n] ([7.12](#section-7-12)).

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.10(3) and the note after it, p. 13: States the ring structure of `Fil⁰` and `OB_dR,log=(Fil⁰)[t⁻¹]` after the filtration completion defined in Definition 2.2.10(2)–(3), as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.2.11, p. 13: The additional completion is present even for trivial log structure; the statement's trivial-log test records this.

*Needs:* [7.9](#section-7-9); [7.8](#section-7-8).

Applications include DLLZ-RH §2.3: The completed local model has t-adically convergent power-series coefficients in W; DLLZ-RH §3.2: `RH_log` uses the completed structural sheaf; DLLZ-RH Proposition 3.3.3: `OC_log=gr⁰OB_dR,log` is the coefficient sheaf of the Higgs computation.

<a id="section-7-11"></a>

### 7.11 Continuous structural log connection

Construct `TauCeti.LogAdic.StructuralLogConnection`. For a log affinoid perfectoid `U=lim U_i` and `r≥1` there is a unique B_dR⁺(U)/ξ^r-linear log connection `∇:S_{i,r}→S_{i,r}⊗_{R_i}Ω^log_X(U_i)` extending `d:R_i→Ω^log_X(U_i)` and `δ:M_i→Ω^log_X(U_i)` with `∇(e_a)=e_aδ(a′)` for `a=(a′,a″)∈M_i×_M M♭ ((2.2.13)–(2.2.14))`; it satisfies `∇((ker θ_log)^s)⊂(ker θ_log)^{s−1}⊗_{R_i}Ω^log_X(U_i)` for `s≥1`. Completing, taking the limit over r and the colimit over i gives a B_dR⁺-linear log connection `∇:OB⁺_dR,log→OB⁺_dR,log⊗_{O_{X_prokét}}Ω^log_X ((2.2.15))`; it extends B_dR-linearly to `OB⁺_dR,log[t⁻¹]` with `∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_X ((2.2.16))`, and to `OB_dR,log` with `∇(Fil^rOB_dR,log)⊂Fil^{r−1}OB_dR,log⊗_{O_{X_prokét}}Ω^log_X` for all `r∈Z ((2.2.17))`. The connection is integrable. In the toric coordinates of §2.3, `∇y_j=δ(a_j)` and `∇W_j=t⁻¹δ(a_j) ((2.4.3)–(2.4.4))`.

X is as for `OB⁺_dR,log` (locally noetherian fs over `Spa(k,k⁺)`); `Ω^log_X` is the sheaf of log differentials of DLLZ-adic Definition 3.3.6, pulled back to `X_prokét`; it is a vector bundle when X is as in Remark 2.4.1.

The connection is B_dR⁺-linear (B_dR-linear after inverting t), not O_{X_prokét}-linear; it satisfies the log Leibniz rule for `(d,δ)`.

On `S_{i,r}` define `∇` by d on `R_i`, B_dR⁺(U)/ξ^r-linearity and `∇e_a=e_aδ(a′)`; it preserves the relation ideal because `d(α_i(a′))=α_i(a′)δ(a′)`, so `∇(α_i(a′)−[α♭(a″)]e_a)=(α_i(a′)−[α♭(a″)]e_a)δ(a′)`; uniqueness holds because `R_i`, the coefficients and the `e_a` generate.

Since `∇` lowers the (ker θ_log)-adic order by at most one, it extends to the completions, the limit over r and the colimit over i, then to the t-localization and the filtration completion with `∇Fil^r⊂Fil^{r−1}⊗Ω^log_X`.

Integrability: `∇²` vanishes on `R_i` and on each `e_a` because `d∘δ=0` and `δ(a′)∧δ(a′)=0` in `Ω^{log,2}_X`; the coordinate formulas follow from (2.2.14) with `y_j=log(e^{(a_j⁺,a_j⁺)})−log(e^{(a_j⁻,a_j⁻)})` and `W_j=t⁻¹y_j`.

The interface consists of the following named results.

- `TauCeti.LogAdic.StructuralLogConnection`: The continuous B_dR-linear log connection on `OB_dR,log` restricting to the B_dR⁺-linear one on `OB⁺_dR,log`.
- `TauCeti.LogAdic.StructuralLogConnection.generator`: `∇e_a=e_aδ(a′)` for `a=(a′,a″)∈M_i×_M M♭`.
- `TauCeti.LogAdic.StructuralLogConnection.transverse`: `∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_X` on `OB⁺_dR,log`, `OB⁺_dR,log[t⁻¹]` and `OB_dR,log`.
- `TauCeti.LogAdic.StructuralLogConnection.integrable`: `∇∘∇=0` on the associated log de Rham complex `OB_dR,log⊗Ω^{log,•}_X`.
- `TauCeti.LogAdic.StructuralLogConnection.leibniz`: ∇(fx)=f∇x+x⊗df for `f∈O_{X_prokét}`, and `∇` restricted to `O_{X_prokét}` is d.
- `TauCeti.LogAdic.StructuralLogConnection.bdr_linear`: `∇` is B_dR-linear; the image of `B_dR` in `OB_dR,log` is horizontal.
- `TauCeti.LogAdic.StructuralLogConnection.relative`: For a log smooth `f:X→X′`, composing with `Ω^log_X→Ω^log_{X/X′}` gives the relative connection `∇_{X/X′}`, linear over the image of `f_prokét⁻¹OB_dR,log,X′` (used in Corollary 2.4.6).

**Checks.**

- `TauCeti.LogAdic.StructuralLogConnection.constants`: `∇` vanishes on the image of `B_dR→OB_dR,log`.
- `TauCeti.LogAdic.StructuralLogConnection.log_coordinate`: For `X=D¹` with log structure at 0 and `y=log(e^{(a,a)})` over its all-root cover, `∇y=δ(a)=dlog T`; the same holds on the stratum `{T=0}` with the induced log structure, where dlog T is still a nonzero section of `Ω^log`.
- `TauCeti.LogAdic.StructuralLogConnection.normalized_coordinate`: `∇W_T=t⁻¹dlog T` for `W_T=y/t`, so omitting the `t⁻¹` would give the wrong filtered connection.
- The connection is not O_X-linear; it satisfies the log Leibniz rule.
- On `S_{i,r}`, `∇(α_i(a′)−[α♭(a″)]e_a)=(α_i(a′)−[α♭(a″)]e_a)δ(a′)`, so the structural relation is preserved.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equations (2.2.13)–(2.2.14), p. 14: Uniqueness and existence of the log connection on `S_{i,r}` extending d and `δ` with `∇(e_a)=e_aδ(a′)`, as stated here. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (2.2.15), p. 14: The B_dR⁺-linear connection on `OB⁺_dR,log` obtained from the (ker θ_log)-transversality, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equations (2.2.16)–(2.2.17), p. 14: The B_dR-linear extensions to `OB⁺_dR,log[t⁻¹]` and `OB_dR,log` with `∇Fil^r⊂Fil^{r−1}⊗Ω^log_X`, as in the statement.

*Needs:* [7.10](#section-7-10); [7.9](#section-7-9); [6.8](#section-6-8); [6.10](#section-6-10); [6.11](#section-6-11).

Applications include DLLZ-RH Corollary 2.4.2: The connection gives the Poincaré resolution; DLLZ-RH §3.2–3.3: Tensoring with L̂ and the projection formula (3.3.1) transfer it to `RH_log(L)`.

<a id="section-7-12"></a>

### 7.12 Toric power-series description of log periods

Prove `TauCeti.LogAdic.toric_structural_period_model`. Let k be a p-adic field, `P=P̄⊕Q` toric monoids, `E=Spa(k⟨P̄⟩,k⁺⟨P̄⟩)↪Spa(k⟨P⟩,k⁺⟨P⟩)` the stratum with pulled-back log structure, `X=Spa(A,A⁺)` an affinoid fs log adic space with a strictly étale map `X→E`, and `X̃→X` the pullback of the all-root tower `Ẽ=lim E_m`, log affinoid perfectoid with Galois group `Γ`. Let `M⊂B_dR⁺|_X̃[P]` be the ideal generated by `{e_a−1}_{a∈P}`, `B_dR⁺|_X̃[[P−1]]=lim_r B_dR⁺|_X̃[P]/M^r` with `Fil^r=(ξ,M)^r`. (1) There is a unique `v:O_{X_prokét}|_X̃→B_dR⁺|_X̃[[P−1]]` lifting `O→Ô` and sending `a∈P_{Q≥0}` to `[T^{ā♭}]e_a` (Lemma 2.3.7), and `β:M♭|_X̃→(B_dR⁺|_X̃[[P−1]])^×` with `v(α(a♯))=[α♭(a)]β(a)` (Lemma 2.3.12). (2) The map `B_dR⁺|_X̃[[P−1]]→OB⁺_dR,log|_X̃` of (2.3.14), `e_a↦e_{(a,a)}`, is an isomorphism of filtered sheaves (Proposition 2.3.15); for every log affinoid perfectoid `U=lim U_i` in `X_prokét/X̃`, `OB⁺_dR,log(U)≅B_dR⁺(U)[[P−1]]` and each `Ŝ_i→OB⁺_dR,log(U)` is an isomorphism. (3) For a Z-basis `a_1,…,a_n` of `P^gp` and y_j=y_{a_j} (y_a=log(e^{a⁺})−log(e^{a⁻}) for `a=a⁺−a⁻`), `B_dR⁺|_X̃[[P−1]]≅B_dR⁺|_X̃[[y_1,…,y_n]]`, matching `M^r` with `(y_1,…,y_n)^r` and `(ξ,M)^r` with `(ξ,y_1,…,y_n)^r ((2.3.6))`. (4) With `W_j=t⁻¹y_j`, `Fil^rOB_dR,log≅t^rB_dR⁺{W_1,…,W_n}` (t-adically convergent series) for all `r∈Z`, `gr^rOB_dR,log≅t^rÔ[W_1,…,W_n]` and `gr^•OB_dR,log≅Ô[t^{±1},W_1,…,W_n]` (Corollary 2.3.17). (5) For a strict closed immersion `Z→X` pulled back from the closed stratum of a direct summand Q′ of P̄, these isomorphisms for X and Z are compatible with pullback and pushforward, and `B_dR,X⁺(U)/ξ^r` modulo the completed ideal generated by the [T^{sa♭}] `(s∈Q_{>0}, a∈Q′−{0})` is B_dR,Z⁺(V)/ξ^r ((2.3.21), Corollary 2.3.20).

k is a p-adic field (§2.3), with `k_∞=k(µ_∞)`, `t=log[ε] ((2.3.2))` and `k→B_dR⁺` the unique lift of `k→k̂_∞`.

P is a toric (fs, sharp) monoid, not necessarily free; n is the rank of `P^gp`; `Q≠0` covers strata with the pulled-back log structure (Remark 2.4.1(2)).

The isomorphisms hold on the localized site `X_prokét/X̃` (equivalently on log affinoid perfectoid objects over X̃); the formal power series `B_dR⁺[[y]]` of the positive case and the t-adically convergent series `B_dR⁺{W}` of the completed case are not identified.

Lemma 2.3.7: for each `U_i` choose `m_i` with `U_i×_E E_{m_i}→E_{m_i}` strictly étale (DLLZ-adic Lemma 4.2.5), write its ring as the p-adic completion of an étale finite-type k[(1/m_i)P̄]/(Q−{0})-algebra (Huber, Corollary 1.7.3(iii)), and lift uniquely to `B_dR⁺(U)[[P−1]]` by Scholze's power-series lifting lemma (`PadicHodgeTheory` §§2.1–2.7, 7.1–7.3, power-series extension lemma for `B_dR⁺`).

Lemma 2.3.11: `A⊗̂_k(B_dR⁺/ξ^r)⊗̂(B_dR⁺/ξ^r)⟨P̄_{Q≥0}⟩→B_dR⁺(X̃)/ξ^r` is a `Γ`-equivariant isomorphism, by passing to ξ-graded pieces and the toric tower computation (DLLZ-adic Lemma 6.1.9); Lemma 2.3.12 constructs `β` from v and generators of `M♭|_X̃`.

Proposition 2.3.15: (2.3.16) induces `S_{i,r}→(B_dR⁺(U)/ξ^r)[[P−1]]` sending `ker θ_log` into `(ξ,M)`; after completion it is inverse to (2.3.14), both composites being B_dR⁺(U)-linear, fixing the `e_a` and agreeing on `R_i` by the uniqueness in Lemma 2.3.7; this also shows `Ŝ_i≅OB⁺_dR,log(U)`.

Corollary 2.3.17: transport the filtration through (2.3.6) and compute the convolution-filtration completion of `B_dR⁺[[y]][t⁻¹]` as `t^rB_dR⁺{W}`; Corollary 2.3.20 by comparing the constructions for X and Z through the surjection of Corollary 2.2.7.

**Checks.**

- For P=Z_{≥0} (X=D¹ with log structure at 0, `Q=0`): `OB⁺_dR,log|_X̃≅B_dR⁺|_X̃[[y]]` with `y=log(e^{(a,a)})` and `Fil^r=(ξ,y)^r`, and `Fil⁰OB_dR,log≅B_dR⁺{W}` with `W=y/t`; `∑_n t^nW^{n²}` lies in `Fil⁰OB_dR,log` but not in `B_dR⁺[[y]][t⁻¹]`.
- The positive model uses formal power series `B_dR⁺[[y]]`, the completed one t-adically convergent series `B_dR⁺{W}`; neither is replaced by the other.
- On every log affinoid perfectoid U over X̃ the presheaf value `Ŝ_i` is already the sheaf value `OB⁺_dR,log(U)` (the evaluation used by PerfectoidShimuraVarieties S6).

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 2.3.15, p. 18: Proposition 2.3.15 is part (2) of the statement, for the toric chart `X→E` of §2.3 with `P=P̄⊕Q`. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), paragraph after the proof of Proposition 2.3.15, p. 19: The evaluation `Ŝ_i≅OB⁺_dR,log(U)` on log affinoid perfectoid U over X̃ stated in part (2). [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.3.17, p. 19: Corollary 2.3.17 gives `Fil^rOB_dR,log≅t^rB_dR⁺{W}` and the graded pieces, part (4) of the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.3.20, pp. 19–20: Corollary 2.3.20 is the stratum compatibility, part (5) of the statement.

*Needs:* [7.9](#section-7-9); [7.10](#section-7-10); [7.8](#section-7-8); [6.26](#section-6-26); [6.27](#section-6-27); `PadicHodgeTheory` §§2.1–2.4 (structural algebra structure on bdr power series); `AdicSpacesPartII` R0 (etale algebraic model).

Applications include DLLZ-RH Corollaries 2.4.2 and 2.4.6: Reduce the Poincaré lemmas to explicit power-series complexes; DLLZ-RH Proposition 3.3.3 and §3.4: `OC_log|_Z̃=Ô[W_1,…,W_n]` computes Γ_geom-cohomology and residues; PerfectoidShimuraVarieties S6: Evaluation of `OB⁺_dR,log` and `Fil^rOB_dR,log` on log affinoid perfectoid test objects over toric charts of the toroidal tower: `Ŝ_i≅OB⁺_dR,log(U)≅B_dR⁺(U)[[P−1]]`.

<a id="section-7-13"></a>

### 7.13 Logarithmic period Poincaré lemma

Prove `TauCeti.LogAdic.log_poincare`. Let X be as in Remark 2.4.1 over a p-adic field k. On `X_prokét`, with tensor products over `O_{X_prokét}`: (1) `0→B_dR⁺→OB⁺_dR,log→OB⁺_dR,log⊗Ω^{log,1}_X→OB⁺_dR,log⊗Ω^{log,2}_X→⋯` (differentials `∇`) is exact; (2) the same holds with `B_dR` and `OB_dR,log`; (3) for each `r∈Z` the subcomplex `0→Fil^rB_dR→Fil^rOB_dR,log→Fil^{r−1}OB_dR,log⊗Ω^{log,1}_X→Fil^{r−2}OB_dR,log⊗Ω^{log,2}_X→⋯` is exact; (4) for each `r∈Z` the quotient complex `0→gr^rB_dR→gr^rOB_dR,log→gr^{r−1}OB_dR,log⊗Ω^{log,1}_X→⋯` is exact and identifies with `0→Ô(r)→OC_log(r)→OC_log(r)⊗Ω^{log,1}_X(−1)→OC_log(r)⊗Ω^{log,2}_X(−2)→⋯` (Corollary 2.4.2). If `f:X→X′` is log smooth with X and X′ both as in Remark 2.4.1, then `0→B⁺_dR,X⊗̂_{f⁻¹B⁺_dR,X′}f⁻¹OB⁺_dR,log,X′→OB⁺_dR,log,X→OB⁺_dR,log,X⊗Ω^{log,1}_{X/X′}→OB⁺_dR,log,X⊗Ω^{log,2}_{X/X′}→⋯` is exact, where `⊗̂` is the tensor product completed for the filtration (locally `B⁺_dR,X[[y′_1,…,y′_{n′}]]` in the base coordinates); the analogous complex with `B_dR,X`, `B_dR,X′`, `OB_dR,log,X`, `OB_dR,log,X′` (first term locally `B_dR,X{W′_1,…,W′_{n′}}`) is exact and strictly compatible with the filtrations (Corollary 2.4.6, with the completed tensor product).

k is a p-adic field and X is as in Remark 2.4.1: either (1) X is log smooth over k, or (2) X is a smooth intersection of irreducible components of a normal crossings divisor of a smooth Y over k, with the log structure pulled back from Y.

In the relative statement `f:X→X′` is log smooth and X′ is also as in Remark 2.4.1; `Ω^log_{X/X′}` is a vector bundle and `0→f*Ω^log_{X′}→Ω^log_X→Ω^log_{X/X′}→0` is exact.

The first term of the relative complex is the filtration-completed tensor product; with the uncompleted tensor product printed in Corollary 2.4.6 exactness at `OB⁺_dR,log,X` fails.

Exactness is a statement about sheaves on `X_prokét`, not about global sections.

Étale locally choose a strictly étale toric chart X→E=Spa(k⟨P̄⟩,k⁺⟨P̄⟩) (Q=0 in case (1), Q a direct summand in case (2)) and pass pro-Kummer étale locally to X̃ (proof of Corollary 2.4.2).

By Proposition 2.3.15 and Corollary 2.3.17 replace `OB⁺_dR,log` and `OB_dR,log` by `B_dR⁺|_X̃[[y_1,…,y_n]]` and `B_dR|_X̃{W_1,…,W_n}`; `Ω^log_X=⊕_jO_Xδ(a_j)` (DLLZ-adic Theorem 3.3.17, Corollary 3.3.18, Proposition 3.2.25, Corollary 3.2.29) and `∇y_j=δ(a_j)`, `∇W_j=t⁻¹δ(a_j) ((2.4.3)–(2.4.4))`.

Exactness, filtered and graded, is the formal Poincaré lemma for power series in the `y_j`, respectively the `W_j` (anti-derivatives preserve t-adic convergence; `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3, formal Poincaré lemma); identify the graded complex using `gr^rB_dR≅Ô(r)` and `gr^rOB_dR,log≅t^rÔ[W_1,…,W_n]`.

Relative case: take an injective sharp fs chart P′↪P (DLLZ-adic Propositions 3.1.4 and 3.1.10), compatible `X̃→X̃′`, and `a′_{n′+1},…,a′_n∈P` completing a basis of `(P′)^gp_Q` to one of `P^gp_Q`; then `Ω^log_{X/X′}=⊕_{j>n′}O_Xδ(a′_j)`, the horizontal Q-linear combinations of the `y_j` are spanned by `y′_1,…,y′_{n′}`, and the same computation gives exactness with first term `B⁺_dR,X[[y′_1,…,y′_{n′}]]` (respectively `B_dR,X{W′}`).

**Checks.**

- In rank zero `(Ω^log_X=0)` the resolution is `B_dR≅OB_dR,log` with no higher log-coordinate terms.
- The filtration of the qth term is `r−q`, not r.
- For `X=D¹` with log structure at 0, locally `0→B⁺_dR→B⁺_dR[[y]]→B⁺_dR[[y]]·dlog T→0` with `∇=∂/∂y⊗dlog T` is exact.
- For the projection `T²→T¹` (trivial log), the section ∑_k[T₂♭]^ky₁^k of `B⁺_dR,X[[y₁,y₂]]` is horizontal for `∇_{X/X′}` but is not in the image of the uncompleted tensor product, so the completed tensor product is needed.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.4.1, p. 20: Remark 2.4.1 gives the two cases (log smooth X, or a smooth stratum with pulled-back log structure) kept as the statement's hypothesis. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.2 and its proof, pp. 20–21: The proof of Corollary 2.4.2 reduces parts (1)–(4) to the explicit power-series complexes, as in the statement's proof sketch. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.6, p. 21: Corollary 2.4.6 is the relative Poincaré lemma with filtered strictness; the statement uses the filtration-completed tensor product in its first term instead of the printed uncompleted one.

*Needs:* [7.12](#section-7-12); [7.11](#section-7-11); [7.8](#section-7-8); [6.11](#section-6-11); [6.10](#section-6-10); [6.7](#section-6-7); [6.29](#section-6-29); `PadicHodgeTheory` §§2.1–2.4 (poincare lemma and faltings extension).

Applications include DLLZ-RH Lemma 3.3.2 and §3.6: The resolution computes `Rµ′_*(L̂⊗OB_dR,log)` and the de Rham comparison; DLLZ-RH Theorem 3.2.7(5): The relative version gives the relative log de Rham comparison.

<a id="section-7-14"></a>

### 7.14 Logarithmic Faltings extension

Prove `TauCeti.LogAdic.log_faltings_extension`. Let X be as in Remark 2.4.1 over a p-adic field k. There is a short exact sequence of `Ô`-modules on `X_prokét 0→Ô(1)→gr¹OB⁺_dR,log→Ô⊗_{O_{X_prokét}}Ω^log_X→0` (Corollary 2.4.5). The first map is `gr¹B_dR⁺≅Ô(1)` followed by `gr¹` of `B_dR⁺→OB⁺_dR,log`; the second is the graded piece of `∇`, `gr¹OB⁺_dR,log→gr⁰OB⁺_dR,log⊗Ω^log_X=Ô⊗Ω^log_X`. Over a toric chart, on X̃ one has `gr¹OB⁺_dR,log=Ô·ξ⊕⊕_jÔ·y_j` with `y_j↦δ(a_j)`, so the sequence is locally split.

k is a p-adic field and X is as in Remark 2.4.1: either (1) X is log smooth over k, or (2) X is a smooth intersection of irreducible components of a normal crossings divisor of a smooth Y over k, with the log structure pulled back from Y.

`gr¹B_dR⁺≅Ô(1)` is the canonical Galois-equivariant identification; Corollary 2.2.6 states it over a perfectoid base containing all roots of unity, and over k it is obtained on `X_prokét/X_{k̂_∞}` and descended.

Over a toric chart and on X̃, Proposition 2.3.15 and (2.3.6) give `gr¹OB⁺_dR,log=(ξ,y_1,…,y_n)/(ξ,y_1,…,y_n)²=Ô·ξ⊕⊕_jÔ·y_j`.

By (2.4.3) and `Ω^log_X=⊕_jO_Xδ(a_j)`, `gr¹(∇)` sends `y_j` to `δ(a_j)` and kills `ξ`; its kernel is `Ô·ξ=gr¹B_dR⁺≅Ô(1)` (Corollary 2.2.6 on `X_prokét/X_{k̂_∞}`); this is the `r=1` positive part of the graded Poincaré complex of Corollary 2.4.2.

The maps are defined globally (`gr¹` of `B_dR⁺→OB⁺_dR,log` and `gr¹∇`), so local exactness gives the sequence on `X_prokét`.

**Checks.**

- For the trivial log structure (X smooth) the sequence is `PadicHodgeTheory` §2.3’s Faltings extension `0→Ô(1)→gr¹OB_dR⁺→Ô⊗Ω¹_X→0`.
- For `X=D¹` with log structure at 0, the class of `y=log(e^{(a,a)})` maps to dlog T, which is not in `Ô⊗Ω¹_X` along `T=0`; a log coordinate contributes its dlog class.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.5, p. 21: Corollary 2.4.5 is the statement's short exact sequence; the statement records the hypothesis of Remark 2.4.1 under which Corollary 2.4.2 is proved. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.4.1, p. 20: The standing hypothesis on X for §2.4, kept by the statement.

*Needs:* [7.12](#section-7-12); [7.8](#section-7-8); [7.11](#section-7-11); [7.13](#section-7-13); [6.10](#section-6-10); `PadicHodgeTheory` §§2.1–2.4 (faltings extension).

<a id="section-7-15"></a>

### 7.15 Agreement with the modular-curve logarithmic period construction

Prove `TauCeti.LogAdic.modularCurve_logPeriod_agreement`. Let V₀ be a finite-level affinoid of the compactified modular curve over a finite extension K of `ℚ_p` with K-rational cusps D, carrying the divisorial fs log structure of D, as in `CohomologyComparisons` §6.1. Then (1) the Kummer étale and pro-Kummer étale sites of V₀ constructed in `CohomologyComparisons` §6.1 from cusp charts `ℕ → O_{V₀}`, `1 ↦ q`, are the sites of [6.15](#section-6-15) and [6.23](#section-6-23) for the log structure of [6.5](#section-6-5), with the same projections `ν`: `(V₀)_prokét → (V₀)_két` and `ν′`: `(V₀)_két → (V₀)_ét`; (2) `CohomologyComparisons` §6.1's sheaf `OB⁺_dR,log`, its map `θ_log`, its filtration and its log connection `∇_log` are canonically identified with `OB⁺_dR,log`, `θ_log` and `∇` of [7.9](#section-7-9)–[7.11](#section-7-11) for V₀; (3) under (2), its Poincaré sequence and logarithmic Faltings extension `0 → Ô(1) → gr¹OB⁺_dR,log → Ô ⊗ Ω¹_{V₀}(D) → 0` are those of [7.13](#section-7-13) and [7.14](#section-7-14); (4) the identifications are compatible with `G_K`, with the action of the small level group, and with change of level, field and chart. The general constructions of Layers 6–7 therefore specialize to `CohomologyComparisons` §6.1, which is not constructed again here.

V₀ as in `CohomologyComparisons` §6.1 (one-dimensional, smooth, with the divisorial log structure of rational cusps); the log structure is the normal crossings log structure of [6.5](#section-6-5) for D the set of cusps.

(1) Both sites are built from the same Kummer étale objects and the corrected inverse-limit coverings; a cusp chart `ℕ → O_{V₀}`, `1 ↦ q`, is a chart of the divisorial log structure ([6.4](#section-6-4)), and the identification of coverings is the comparison of DLLZ's Definition 5.1.2 with the covering condition used there.

(2) Both sheaves are defined on log affinoid perfectoid objects by the completed monoid-algebra presentation of DLLZ-RH Definition 2.2.10, with the relations `α_i(a′) = [α♭(a″)]e_a`; the presentations agree term by term, hence so do their completions in the kernel of `θ_log`, their filtrations and the unique log connection extending d and `δ` with `∇(e_a) = e_aδ(a′)`.

(3) The Poincaré lemma and the Faltings extension are statements about these sheaves, so they correspond under (2).

(4) Both constructions are functorial in the chart and the finite-level presentation.

**Checks.**

- At a one-dimensional chart, both sides are `B_dR⁺[[X]]` with X in filtration degree one, and the identification fixes X.
- The residue of dlog q at the cusp is 1 on both sides; replacing `Ω¹(D)` by `Ω¹` would fail this.
- Away from the cusps both log structures are trivial and (2) is the identification of the ordinary period sheaves of `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.10 and (2.2.13)–(2.2.15), pp. 13–14: the presentation of `OB⁺_dR,log` and its log connection used by both constructions. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 2.3.15, pp. 18–19; Corollaries 2.4.2 and 2.4.5, pp. 20–21: the local power-series description, the Poincaré lemma and the logarithmic Faltings extension.

*Needs:* [6.4](#section-6-4); [6.5](#section-6-5); [6.15](#section-6-15); [6.23](#section-6-23); [7.9](#section-7-9); [7.11](#section-7-11); [7.13](#section-7-13); [7.14](#section-7-14); `CohomologyComparisons` §6.1.

Applications include `CohomologyComparisons` §6.1 (its modular-curve sheaves are the restrictions of the general ones), PerfectoidShimuraVarieties (the modular-curve case of the general logarithmic Hodge–Tate comparison).

<a id="section-7-16"></a>

### 7.16 B_dR-coefficient structure sheaves on analytic sites

Construct `TauCeti.LogAdic.BdRCoefficientSheaf`. Let k be a p-adic field, K a perfectoid field containing `k_∞`, `B_dR⁺=B_dR⁺(K,O_K)`, `B_dR=B_dR(K,O_K)`, `t=log[ε]∈B_dR⁺`, and `k→B_dR⁺` the unique lift of `k→K` (Definition 3.1.1(1)). For a locally noetherian adic space X over k, `O_X⊗̂_k(B_dR⁺/t^r)` is the sheaf on `X_an` associated with `Spa(A,A⁺)↦A⊗̂_k(B_dR⁺/t^r)`; `O_X⊗̂_kB_dR⁺=lim_rO_X⊗̂_k(B_dR⁺/t^r)` and `O_X⊗̂_kB_dR=(O_X⊗̂_kB_dR⁺)[t⁻¹]`, with `Fil^r(O_X⊗̂_kB_dR⁺)=t^r(O_X⊗̂_kB_dR⁺)` and `Fil^r(O_X⊗̂_kB_dR)=t^{−s}Fil^{r+s}(O_X⊗̂_kB_dR⁺)` for any `s≥−r`; the same on `X_ét` using étale maps from affinoids (Definition 3.1.1(2)–(4)). Lemma 3.1.4: (1) for affinoid `X=Spa(A,A⁺)`, `H^i(X_ét,O_{X_ét}⊗̂_k(B_dR⁺/t^r))` is `A⊗̂_k(B_dR⁺/t^r)` for `i=0` and 0 for `i>0`; (2) `gr^r(O_{X_ét}⊗̂_kB_dR)≅O_{X_ét}⊗̂_kK(r)`; (3) `O_X⊗̂_k(B_dR⁺/t^r)≅λ_*(O_{X_ét}⊗̂_k(B_dR⁺/t^r))≅Rλ_*(O_{X_ét}⊗̂_k(B_dR⁺/t^r))`, and likewise for `B_dR⁺` and `B_dR`; (4) for affinoid X, finite projective `A⊗̂_kB_dR⁺`-modules, finite locally free `O_X⊗̂_kB_dR⁺`-modules and finite locally free `O_{X_ét}⊗̂_kB_dR⁺`-modules are equivalent; (5) `λ_*` is an equivalence from finite locally free `O_{X_ét}⊗̂_k(B_dR⁺/t^r)`-modules (resp. `O_{X_ét}⊗̂_kB_dR⁺`-modules) to the corresponding modules on `X_an`. The ringed spaces are `X⁺=(X_an,O_X⊗̂_kB_dR⁺)` and `X=(X_an,O_X⊗̂_kB_dR) (3.1.5)`; a vector bundle on `X⁺` is a finite locally free `O_X⊗̂_kB_dR⁺`-module, and vector bundles on X are the global sections of the stack obtained from vector bundles on `X⁺` over open subspaces by passing to the t-isogeny category.

k is a p-adic field and K a perfectoid field containing `k_∞=k(µ_∞) (§3)`; X is any locally noetherian adic space over k.

The tensor products are completed tensor products of Banach k-algebras (`A⊗̂_k(B_dR⁺/t^r)` with `B_dR⁺/t^r` a Banach k-algebra); the uncompleted `O_X⊗_kB_dR⁺` is not used.

A vector bundle on X is not required to come from a vector bundle on `X⁺` by a global extension of scalars (unlike Liu–Zhu Definition 3.5).

Define the sheaves on `X_an` and `X_ét` from the affinoid completed tensor products and take the limit over r and the localization at t.

Lemma 3.1.4: by Remark 3.1.3 (X_{K,an}, X_{K,ét} are generated by base changes from finite extensions k′ of k) the categories agree with those of Liu–Zhu §3.1, and the arguments of Liu–Zhu Lemmas 3.1–3.2, Proposition 3.3 and Corollary 3.4 apply: Tate acyclicity and Kiehl gluing for `A⊗̂_k(B_dR⁺/t^r)` by dévissage along t, `gr^r` via `t^r`, and étale descent for `λ`.

Form the stack of vector bundles on `X⁺` over opens and its t-isogeny category to define vector bundles on X.

The interface consists of the following named results.

- `TauCeti.LogAdic.BdRCoefficientSheaf`: The sheaves `O_X⊗̂_k(B_dR⁺/t^r)`, `O_X⊗̂_kB_dR⁺=lim_r` and `O_X⊗̂_kB_dR=(⋯)[t⁻¹]` on `X_an` and on `X_ét`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.fil`: `Fil^r=t^r(O_X⊗̂_kB_dR⁺)` and `Fil^r(O_X⊗̂_kB_dR)=t^{−s}Fil^{r+s}(O_X⊗̂_kB_dR⁺)` for any `s≥−r`; [a,b]-truncations `(O_X⊗̂_kB_dR)^{[a,b]}=Fil^a/Fil^{b+1}`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_sections`: Lemma 3.1.4(1): on affinoid `X=Spa(A,A⁺)`, sections are `A⊗̂_k(B_dR⁺/t^r)` and higher étale cohomology vanishes.
- `TauCeti.LogAdic.BdRCoefficientSheaf.grade`: Lemma 3.1.4(2): `gr^r(O_{X_ét}⊗̂_kB_dR)≅O_{X_ét}⊗̂_kK(r)`, Gal(K/k)-equivariantly.
- `TauCeti.LogAdic.BdRCoefficientSheaf.analytic_etale`: Lemma 3.1.4(3),(5): the analytic sheaves are `λ_*` and `Rλ_*` of the étale ones, and `λ_*` is an equivalence on finite locally free modules.
- `TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_modules`: Lemma 3.1.4(4): on affinoid X, finite projective `A⊗̂_kB_dR⁺`-modules are equivalent to finite locally free modules on `X_an` and on `X_ét`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.VectorBundle`: Vector bundles on `X⁺` (finite locally free `O_X⊗̂_kB_dR⁺`-modules) and on X (t-isogeny stack); `E⊗_{O_X}M` for a vector bundle E on `X_an`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.pullback`: A morphism `f:Y→X` of locally noetherian adic spaces over k induces `f⁻¹(O_X⊗̂_kB_dR⁺)→O_Y⊗̂_kB_dR⁺` compatibly with filtrations, with map_id and map_comp; Gal(K/k) acts through the coefficients.

**Checks.**

- `TauCeti.LogAdic.BdRCoefficientSheaf.point`: For `X=Spa(k,O_k)`, `O_X⊗̂_kB_dR⁺=B_dR⁺(K,O_K)` with `Fil^r=t^rB_dR⁺` and `gr⁰=K`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.gr_zero`: `gr⁰(O_X⊗̂_kB_dR)=O_X⊗̂_kK`; for `X=Spa(k⟨T⟩)` its sections are K⟨T⟩.
- `TauCeti.LogAdic.BdRCoefficientSheaf.not_algebraic_tensor`: For `X=Spa(k⟨T⟩)`, the section ∑_np^nx_nT^n of `O_X⊗̂_kK`, with `x_n∈O_K` linearly independent over k, is not in `k⟨T⟩⊗_kK`, whose elements have coefficients in a finite-dimensional k-subspace of K.
- `TauCeti.LogAdic.BdRCoefficientSheaf.twist`: Gal(K/k) acts on `gr¹(O_X⊗̂_kB_dR⁺)=t·(O_X⊗̂_kK)` through σ(tf)=χ(σ)t·σ(f), so `gr¹≅O_X⊗̂_kK(1)` and not `O_X⊗̂_kK` as Galois-equivariant sheaves.
- For `X=Spa(k)`, `O_X⊗̂_kB_dR⁺=B_dR⁺` with `Fil^r=t^rB_dR⁺` and `gr⁰=K`.
- `gr⁰(O_X⊗̂_kB_dR)=O_X⊗̂_kK`, so finite locally free `gr⁰`-modules are vector bundles on `X_{K,an}` (Remark 3.1.3).

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.1(1), p. 22: Definition 3.1.1 fixes `B_dR⁺=B_dR⁺(K,O_K)`, `t=log[ε]` and the lift `k→B_dR⁺` used to form `O_X⊗̂_kB_dR⁺`, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.4, p. 22: Introduces Lemma 3.1.4 with the proof route through Liu–Zhu used here. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.4(5), p. 23: Lemma 3.1.4(5), the equivalence between étale and analytic finite locally free modules used in Proposition 3.3.3. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.1.5) and following, p. 23: The definition of vector bundles on `X⁺` and X used here.

*Needs:* `PadicHodgeTheory` §§0.2–0.3 (de rham period ring); `PadicHodgeTheory` §§0.2–0.3 (fontaine element t); `AdicSpacesPartII` R0 (completed tensor product); [6.1](#section-6-1); [6.37](#section-6-37); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (etale acyclicity of vector bundles).

Applications include DLLZ-RH Definitions 3.1.6–3.1.7: The ringed spaces `X⁺` and X carry log connections, t-connections and Higgs fields; DLLZ-RH Lemma 3.3.2 and Proposition 3.3.3: Lemma 3.1.4(3),(5) reduce `µ′_*` to `ν′_*` on the étale site; DLLZ-RH Theorem 3.2.3: `RH_log(L)` is a vector bundle on X with filtration by locally free O_X⊗̂_kB_dR⁺-submodules.

<a id="section-7-17"></a>

### 7.17 Filtered period log connections and Higgs reduction

Define `TauCeti.LogAdic.FilteredLogConnection`. Let k be a p-adic field, K a perfectoid field containing `k_∞`, X a log smooth fs log adic space over k, and `X⁺=(X_an,O_X⊗̂_kB_dR⁺)`, `X=(X_an,O_X⊗̂_kB_dR)` as in [7.16](#section-7-16), with `Ω^log_{X/B_dR}=Ω^log_X⊗̂_kB_dR` and `Ω^log_{X⁺/B_dR⁺}=Ω^log_X⊗̂_kB_dR⁺` (Definition 3.1.6). (1) A log connection on a vector bundle E on X is a B_dR-linear `∇:E→E⊗_{O_X}Ω^log_{X/B_dR}` with the usual Leibniz rule; it is integrable if `∇²=0`, with log de Rham complex `DR_log(E)=(E⊗Ω^{log,•}_{X/B_dR},∇)`. (2) A log t-connection on a vector bundle `E⁺` on `X⁺` is a B_dR⁺-linear `∇⁺:E⁺→E⁺⊗_{O_{X⁺}}Ω^log_{X⁺/B_dR⁺}` with ∇⁺(fe)=(te)⊗df+f∇⁺(e); it is integrable if `(∇⁺)²=0`. (3) A log Higgs bundle on `X_K` is a vector bundle E on `X_{K,an}` with an O_{X_K}-linear `θ:E→E⊗Ω^log_{X_K}(−1)` such that `θ∧θ=0`, with Higgs complex `(E⊗Ω^{log,•}_{X_K}(−•),θ)`. (4) A log connection on a coherent sheaf E on X is a k-linear `∇:E→E⊗Ω^log_X` with the Leibniz rule; a decreasing filtration by coherent subsheaves with `∇(Fil^rE)⊂Fil^{r−1}E⊗Ω^log_X` gives `Fil^rDR_log(E)=(Fil^{r−•}E⊗Ω^{log,•}_X,∇)` with O_X-linear graded differentials (Definition 3.1.7). A filtered log connection on X is an integrable log connection `(E,∇)` on X with a decreasing filtration `(Fil^r)_{r∈Z}` by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Griffiths transversality `∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_{X⁺/B_dR⁺}` (the target of Theorem 3.2.3(1)). Lemma 3.1.8: `(E⁺,∇⁺)↦(E⁺⊗_{B_dR⁺}B_dR,t⁻¹∇⁺,{t^rE⁺}_{r≥0})` is an equivalence from integrable log t-connections on `X⁺` to integrable log connections on X with filtrations `{Fil^r}_{r≥0}` by locally free O_X⊗̂_kB_dR⁺-submodules satisfying `Fil^r=t·Fil^{r−1} (r≥1)` and Griffiths transversality. Lemma 3.1.9: `(E⁺,∇⁺)↦(E⁺/t,∇⁺ mod t)` is a functor to log Higgs bundles on `X_K`.

k is a p-adic field, K a perfectoid field containing `k_∞=k(µ_∞)`, `B_dR⁺=B_dR⁺(K,O_K)` and `t=log[ε]` (Definition 3.1.1(1)); X is log smooth fs over k (for (4), X as in Definition 3.1.7(4)).

Connections on X are B_dR-linear, t-connections B_dR⁺-linear, Higgs fields O_{X_K}-linear and valued in `Ω^log_{X_K}(−1)`, coherent connections k-linear; a t-connection is not an ordinary connection modulo t.

Filtrations of filtered log connections are by locally free O_X⊗̂_kB_dR⁺-submodules indexed by `r∈Z`; Lemma 3.1.8 concerns only filtrations `{Fil^r}_{r≥0}` with `Fil^r=t·Fil^{r−1}`.

Instantiate the CR.5 log-connection and log de Rham notions on the ringed spaces `X⁺` and X of [7.16](#section-7-16), with `Ω^log_{X/B_dR}` of Definition 3.1.6.

Lemma 3.1.8: `t⁻¹∇⁺` satisfies the usual Leibniz rule and maps `t^rE⁺` into `t^{r−1}E⁺⊗Ω^log`; conversely `E⁺=Fil⁰` and `∇⁺=t∇|_{Fil⁰}`, using `Fil^r=t·Fil^{r−1}` and transversality.

Lemma 3.1.9: modulo t the term (te)⊗df vanishes, so `∇⁺` induces an O_{X_K}-linear map with `θ∧θ=0` from `(∇⁺)²=0`; since `∇⁺=t∇` and `σ(t)=χ(σ)t`, `θ` is Gal(K/k)-equivariant as a map to `E⊗Ω^log_{X_K}(−1)`.

The interface consists of the following named results.

- `TauCeti.LogAdic.FilteredLogConnection`: An integrable B_dR-linear log connection on a vector bundle on X with a decreasing filtration by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Griffiths transversality.
- `TauCeti.LogAdic.FilteredLogConnection.transversality`: `∇(Fil^r)⊂Fil^{r−1}⊗Ω^log`; on the de Rham complex the qth term carries `Fil^{r−q}` and the differential maps `Fil^{r−q}` into `Fil^{r−q−1}`.
- `TauCeti.LogAdic.FilteredLogConnection.t_connection`: Lemma 3.1.8: `(E⁺,∇⁺)↦(E⁺⊗B_dR,t⁻¹∇⁺,{t^rE⁺}_{r≥0})` is an equivalence onto filtered log connections with `Fil^r=t·Fil^{r−1}` for `r≥1`.
- `TauCeti.LogAdic.FilteredLogConnection.higgs`: Lemma 3.1.9: reduction of an integrable log t-connection modulo t is a log Higgs bundle `E⁺/t→E⁺/t⊗Ω^log_{X_K}(−1)`, functorial in `(E⁺,∇⁺)`.
- `TauCeti.LogAdic.FilteredLogConnection.de_rham_complex`: The log de Rham complex `DR_log(E)=(E⊗Ω^{log,•}_{X/B_dR},∇)` and log de Rham cohomology `H^i_{log dR}(X,E)=H^i(X,DR_log(E))` (Definition 3.1.7(1)).
- `TauCeti.LogAdic.FilteredLogConnection.higgs_complex`: For a log Higgs bundle, the complex `(E⊗Ω^{log,•}_{X_K}(−•),θ)` and H^i_{log Higgs}(X_K,E) (Definition 3.1.7(3)).
- `TauCeti.LogAdic.FilteredLogConnection.coherent_filtered`: Definition 3.1.7(4): a k-linear log connection on a coherent sheaf with a Griffiths-transversal coherent filtration, `Fil^rDR_log(E)=(Fil^{r−•}E⊗Ω^{log,•}_X,∇)`, log Hodge cohomology H^{a,b}_{log Hodge}=H^{a+b}(X,gr^aDR_log(E)) and the Hodge–de Rham spectral sequence.

**Checks.**

- `TauCeti.LogAdic.FilteredLogConnection.trivial`: `E=O_X⊗̂_kB_dR` with `∇=d⊗1` and `Fil^r=t^r(O_X⊗̂_kB_dR⁺)` is a filtered log connection; under Lemma 3.1.8 it corresponds to `(O_X⊗̂_kB_dR⁺,t·d)`, whose reduction modulo t is `(O_{X_K},θ=0)`.
- `TauCeti.LogAdic.FilteredLogConnection.mod_t_linear`: The term (te)⊗df vanishes modulo t, so the reduced map is O-linear.
- `TauCeti.LogAdic.FilteredLogConnection.not_unshifted`: The filtered de Rham qth term has `Fil^{r−q}`; an unshifted `Fil^r` in every degree does not encode transversality.
- `TauCeti.LogAdic.FilteredLogConnection.higgs_twist`: If `∇` is Gal(K/k)-equivariant then `∇⁺=t∇` satisfies `∇⁺(σe)=χ(σ)⁻¹σ(∇⁺e)`, so `θ=∇⁺ mod t` is equivariant as a map to `E⊗Ω^log_{X_K}(−1)` and not to `E⊗Ω^log_{X_K}(1)`.
- The graded differential is O-linear; its Tate twist is `−1`.
- Lemma 3.1.8 sends `(E⁺,∇⁺)` to the filtration `{t^rE⁺}_{r≥0}`; it does not produce arbitrary transversal filtrations.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(2), p. 24: The modified Leibniz rule defining log t-connections, as in part (2) of the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(3), p. 24: The definition of log Higgs bundles with the `(−1)` twist, part (3) of the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.8, p. 24: Lemma 3.1.8, the equivalence with filtrations `{t^rE⁺}_{r≥0}`, `Fil^r=t·Fil^{r−1}`, used here. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.9, p. 24: Lemma 3.1.9, reduction modulo t to log Higgs bundles, used here.

*Needs:* [7.16](#section-7-16); [6.11](#section-6-11); [6.10](#section-6-10).

Applications include DLLZ-RH Theorem 3.2.3: Describes the geometric RH target category; DLLZ-RH Theorem 3.2.4: Its degree-zero reduction gives the log Higgs functor; DLLZ-RH Theorem 3.2.7: Part (4) is the target category of `D_dR,log` and the log Hodge–de Rham spectral sequence.

<a id="section-7-18"></a>

### 7.18 Decompletion of logarithmic Kummer towers

Prove `TauCeti.LogAdic.log_tower_decompletion`. A triple `({A_i}_{i∈I},Â_∞,Γ)` (filtered system of topological rings, a complete ring `Â_∞` with `lim A_i→Â_∞` of dense image, a topological group `Γ` acting compatibly) is a decompletion system if (1) every finite projective `Γ-module L_∞` over `Â_∞` has a model, a finite projective `Γ-module L_i` over some `A_i` with `L_i⊗_{A_i}Â_∞≅L_∞`, and (2) for every model there is `i_0≥i` such that `L_i⊗_{A_i}A_{i′}` is good, `H^•(Γ,L_{i′})≅H^•(Γ,L_∞)`, for all `i′≥i_0` (Definition A.1.2); then lim_iProj_{A_i}(Γ)→Proj_{Â_∞}(Γ) is an equivalence and two models agree after base change (Remark A.1.3). Twisted models (Corollary A.1.21): if the triple is weakly (resp. stably) decompleting with initial index 0 and `{ψ_s:Γ→A_0^×}_{s∈S}` is a family of continuous characters such that for every open neighbourhood U of 1 in `A_0` some open neighbourhood V of 1 in `Γ` has `ψ_s(V)⊂U` for all s, then for a model `L_i` of a finite free (resp. finite projective) `L_∞` each `L_i(ψ_s)=L_i⊗_{A_0}A_0(ψ_s)` is a model of `L_∞(ψ_s)`, and there is `i_0≥i` such that `L_{i′}(ψ_s)` is good for all `i′≥i_0` and all `s∈S` simultaneously. The following are decompletion systems. (A.2.1.2) Arithmetic towers: for a Huber pair `(A,A⁺)` over `(Q_p,Z_p)`, `A_{p^l}=A⊗_{Q_p}Q_p(µ_{p^l})` and `Â_{p^∞}` the p-adic completion of `∪_lA_{p^l}`, all stably uniform, `({A_{p^l}}_{l≥0},Â_{p^∞},Γ_1)` with `Γ_1=Gal(Q_p(µ_{p^∞})/Q_p)`; also with A_{p^l}=A⊗_kk(µ_{p^l}) for a Banach algebra A over a p-adic field k (Remark A.2.1.3). (A.2.2.3) Geometric towers: in the setup of §2.3 (X=Spa(A,A⁺) strictly étale over E, X̃ with ring `Â_∞`), `({A_{m,k̂_∞}}_{m≥1},Â_∞,Γ̃)` with `Γ_1=Hom(P^gp_Q/P^gp,µ_∞)≅Hom(P^gp,Ẑ(1))` acting by `γT^a=γ(a)T^a` and `Γ̃=Γ_1⋊Gal(k_∞/k)`, and also for every closed subgroup of `Γ̃` containing `Γ_1` (Remark A.2.2.4). (A.2.3.4) Deformations: for every `r≥1`, `({B_{r,m}}_{m≥1},B̂_{r,∞},Γ_1)` with `B_{r,m}=A⊗̂_k(B_dR⁺/ξ^r)⊗_{(B_dR⁺/ξ^r)⟨P⟩}(B_dR⁺/ξ^r)⟨(1/m)P⟩` and `B̂_{r,∞}≅B_dR⁺(X̃)/ξ^r` (Lemma 2.3.11). The first two triples are stably decompleting (Propositions A.2.1.1, A.2.2.1); the third is only shown to be weakly decompleting (Proposition A.2.3.3), and A.2.3.4 is not asserted to be stably decompleting.

Arithmetic towers: `(A_{p^l},A_{p^l}⁺)` and `(Â_{p^∞},Â_{p^∞}⁺)` stably uniform; Remark A.2.1.3 for Banach algebras over a p-adic field.

Geometric and deformation towers: k a p-adic field and the setup of §2.3 (toric chart `X=Spa(A,A⁺)→E` strictly étale, all-root tower, norms as in Appendix A.2.2–A.2.3).

Decompletion is asserted only for these towers and their pullbacks used in §3.3 (R_{K,m}, the boundary quotients `R̄_{K,m}`, and `{R′_{p^l}}`); no arbitrary tower is asserted to decomplete.

General formalism, proved here: a weakly decompleting triple (Definition A.1.6: isometric action, isometric splittings of `Â_∞→Â_∞/A_i`, uniform strict exactness of `C^•(Γ_i,Â_∞/A_i)`) is a weak decompletion system (Theorem A.1.8); a stably decompleting triple (Definition A.1.9) is a decompletion system (Theorem A.1.10).

Arithmetic towers: the Tate–Sen estimates with Banach coefficients (Berger–Colmez TS(3)) give uniform strict exactness with constant `p²`, norm-direct supplements give the splittings, and rational localization gives stability (Proposition A.2.1.1); combine with Theorem A.1.10.

Geometric towers: spectral norm, the decomposition (A.2.2.2) of `k_∞⁺[P_{Q≥0}]` into finite-order Γ_1-characters, and DLLZ-adic Lemma 6.1.7 give constant `c=p^{1/(p−1)}`; rational subsets are stabilized by open subgroups (Proposition A.2.2.1); combine with Theorem A.1.10.

Deformations: (A.2.2.2) gives submetric splittings, Lemma A.2.3.2 and induction on r give uniform strict exactness with constant `(2|ϖ|⁻¹)^{r−1}c^r` (Proposition A.2.3.3); models come from freeness over a finite rational cover, Theorem A.1.8 and gluing (Liu–Zhu, Proposition 3.3), and goodness from the ξ-adic dévissage to `r=1` (Theorem A.2.3.4).

**Checks.**

- For `r=1` the deformation tower is the geometric tower: `B_{1,m}=A_{m,k̂_∞}` and `B̂_{1,∞}=Â_∞` with equivalent norms.
- For `P=Z_{≥0}`, (A.2.2.2) reads `k_∞⁺[Q_{≥0}]=k_∞⁺[Z_{≥0}]⊕⊕_{χ≠1}(k_∞⁺[Q_{≥0}])_χ`, the χ-part spanned by the `T^a` with `a∉Z` on which `Γ_1` acts through `χ`.
- Decompletion is not used beyond the listed towers; Remark 3.3.12 (non-isomorphic boundary comparison) is a property of the unipotent part, not of the models.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition A.1.2(2), p. 67: The good-model condition of a decompletion system, stated here. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem A.2.1.2 and its proof, p. 73: Proof of Theorem A.2.1.2 (arithmetic towers are decompletion systems) from stable decompletion and Theorem A.1.10, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem A.2.2.3 and its proof, p. 74: Proof of Theorem A.2.2.3 (geometric towers) from Proposition A.2.2.1 and Theorem A.1.10; the theorem prints `{A_m}` for the tower `{A_{m,k̂_∞}}` of Proposition A.2.2.1. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem A.2.3.4, pp. 75–76: Theorem A.2.3.4 for the deformation towers `B_{r,m}`, every `r≥1`, as in the statement.

*Needs:* [6.26](#section-6-26); [7.12](#section-7-12); [7.1](#section-7-1); [6.25](#section-6-25).

<a id="section-7-19"></a>

### 7.19 Logarithmic OC pushforward and coherence

Prove `TauCeti.LogAdic.log_oc_pushforward`. Let k be a p-adic field, K a perfectoid field containing `k_∞`, X a smooth rigid analytic variety over k with the log structure of a normal crossings divisor D (Example 2.1.2), and Z either X or an open subspace of a smooth intersection of irreducible components of D with the log structure pulled back from X; `µ′_Z:Z_prokét/Z_K→Z_an`. For a Q_p-local system L on `X_két` with pullback `L̂_Z`: (1) `R^iµ′_{Z,*}(L̂_Z⊗_{Q̂_p}OC_log,Z)=0` for all `i>0`; (2) `µ′_{Z,*}(L̂_Z⊗_{Q̂_p}OC_log,Z)` is a finite locally free `O_Z⊗̂_kK-module (=gr⁰(O_Z⊗̂_kB_dR))`, of `rank rk_{Q_p}L` if `Z=X` (Proposition 3.3.3). Locally, for a smooth toric chart `X→Dⁿ` with `Z={T_1=⋯=T_l=0}` and `K=k̂_∞`, `H⁰(Z_prokét/Z_K,L̂_Z⊗OC_log,Z)≅L(Z_K)`, the unipotent part of a good decompleted model, and the higher cohomology vanishes (Lemma 3.3.15); `L(Z_K)` is finite projective over `R̄_K`, of rank rk L if `Z=X`, and its formation commutes with compositions of rational embeddings and finite étale maps `Y→Z` (Lemma 3.3.16). The natural map `L(X_K)⊗_{R_K}R_{K,m_0}→L_{m_0}(X_K)` need not be an isomorphism (Remark 3.3.12), and `L(X_K)/(T_1,…,T_l)→L(Z_K)` is in general only surjective (Remark 3.3.14).

k is a p-adic field and K a perfectoid field containing `k_∞=k(µ_∞) (§3)`; the proof reduces to `K=k̂_∞` and obtains larger K by base change.

X is smooth over k with the log structure of a normal crossings divisor D (Example 2.1.2), not necessarily strict normal crossings; Z is X or an open subspace of a smooth intersection of irreducible components of D (second case of Remark 2.4.1).

L is any Q_p-local system on `X_két` (no unipotence or de Rham hypothesis); the rank statement is only for `Z=X`.

Reduce to `K=k̂_∞`, to `ν′_Z:Z_prokét/Z_K→Z_ét` by Lemma 3.1.4(5) ([7.16](#section-7-16)), and to affinoid X with a smooth toric chart and `Z={T_1=⋯=T_l=0}`; then `(L̂_Z⊗OC_log,Z)|_Z̃≅L_Z|_Z̃[W_1,…,W_n]` (Corollary 2.3.17), and it suffices to prove statements (a) and (b) of §3.3.

By Theorem A.2.2.3, `L_X(X̃)` has a good model `L_{m_0}(X_K)` over `R_{K,m_0}`; by DLLZ-adic Lemma 6.3.6 its reduction `L_{m_0}(Z_K)` is a model of `L_Z(Z̃)`, good after enlarging `m_0`.

Lemma 3.3.8: `Γ_geom` acts quasi-unipotently (descent to `k′(µ_{p^l})` by Theorem A.2.1.2 and Remark A.2.1.3, then the argument of Liu–Zhu Lemma 2.15); decompose by finite-order characters `τ (3.3.9)`, take unipotent parts (3.3.10); (3.3.11) gives rank rk L for `Z=X`.

For `τ≠1` some `γ_j−1` is invertible, so only the unipotent part contributes; Lemma 3.3.5 (DLLZ-adic Theorem 5.4.4 and Corollary 2.3.17) identifies pro-Kummer cohomology with Γ_geom-cohomology, the W-variable argument of Liu–Zhu Lemma 2.9 gives Lemma 3.3.15, and base change of good models (Definition A.1.2) gives Lemma 3.3.16, hence (a), (b) and the proposition.

**Checks.**

- Keep the non-surjective boundary-model comparison of Remark 3.3.12 as a rejection test for an overly strong base-change claim.
- For `Z≠X` the rank of `µ′_{Z,*}(L̂_Z⊗OC_log,Z) can` be smaller than rk L (only the unipotent part along the stratum survives); no rank equality is asserted there.
- For L trivial of rank one and `Z=X`, the pushforward is `O_X⊗̂_kK`, with `L(X_K)=R_K`.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.3.3 and the definition of Z before Lemma 3.3.2, p. 28: Proposition 3.3.3 for Z equal to X or an open subspace of a smooth stratum of D; the statement keeps 'rank rk L if `Z=X'` and reads `gr⁰(O_X⊗̂_kB_dR)` as `O_Z⊗̂_kK`. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.3.15, p. 31: Lemma 3.3.15: the pro-Kummer cohomology of `L̂_Z⊗OC_log,Z` is the unipotent part `L(Z_K)` in degree 0 and vanishes above, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.3.16, p. 31: Lemma 3.3.16: rank and base-change compatibility of `L(Z_K)`, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 3.3.12, p. 31: Remark 3.3.12: the comparison of the unipotent part with the full model need not be an isomorphism; the statement keeps this as a rejection test.

*Needs:* [7.18](#section-7-18); [7.12](#section-7-12); [7.10](#section-7-10); [7.16](#section-7-16); [6.34](#section-6-34); [6.32](#section-6-32); [6.35](#section-6-35); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (profinite g set cohomology).

<a id="section-7-20"></a>

### 7.20 Geometric logarithmic Riemann–Hilbert

Construct `TauCeti.LogAdic.LogRH`. Let k be a p-adic field (complete, discretely valued, characteristic 0, perfect residue field of characteristic p), K a perfectoid field containing `k_∞=k(µ_∞)`, X a smooth rigid analytic variety over k with the log structure of a normal crossings divisor D, `𝒳=(X_an,O_X⊗̂_k B_dR)` and `µ′:X_prokét/X_K→X_an`. For a Q_p-local system L on `X_két`, `RH_log(L)=Rµ′_*(L̂⊗_{Q̂_p}OB_dR,log)` is concentrated in degree zero, and `L↦RH_log(L)` is an exact functor to Gal(K/k)-equivariant vector bundles on 𝒳 of `rank rk_{Q_p}L`, with integrable log connection `∇_L:RH_log(L)→RH_log(L)⊗Ω^log_{𝒳/B_dR}` and decreasing filtration `Fil^r RH_log(L)=µ′_*(L̂⊗Fil^r OB_dR,log)`, `r∈Z`, by locally free `O_X⊗̂_k` B_dR⁺-submodules satisfying Griffiths transversality. It is not asserted to be a tensor functor on all Q_p-local systems.

k is a p-adic field in the DLLZ-RH sense and K is any perfectoid field containing k_∞ (DLLZ-RH §3 opening); Gal(K/k) is the group of continuous automorphisms of K over k. The proofs may first take `K=k̂_∞` and then base change.

D is a reduced normal crossings divisor as in DLLZ-RH Example 2.1.2 (étale locally SNC with smooth toric charts).

L is a Q_p-local system on `X_két`; tensor compatibility is the separate unipotent theorem.

By the OC pushforward theorem (Proposition 3.3.3), `R^iµ′_*(L̂⊗OC_log)=0` for `i>0` and `µ′_*(L̂⊗OC_log)` is finite locally free of rank rk L; induct over `gr^r OB_dR,log≅OC_log(r)` and pass to the t-adic limit (as in LZ17 Theorems 2.1(i), 3.8(i)) to get `Rµ′_*(L̂⊗Fil^r OB_dR,log)` locally free over `O_X⊗̂_k B_dR⁺` of rank rk L for every r (§3.3, pp. 27–28).

Invert t: `RH_log(L)≅Rµ′_*(L̂⊗Fil⁰OB_dR,log)[t⁻¹]` is a vector bundle on 𝒳 with the stated filtration; the Gal(K/k)-action comes from factoring µ′ through `X_K,prokét→X_K,ét→X_K,an→X_an`.

Transport the structural period connection by the projection formula (3.3.1) of [6.37](#section-6-37); integrability and Griffiths transversality come from those of the connection (2.2.17).

Exactness follows from the vanishing of all higher direct images in the first step.

The interface consists of the following named results.

- `TauCeti.LogAdic.LogRH`: The geometric derived pushforward `Rµ′_*(L̂⊗OB_dR,log)`, identified with a degree-zero Gal(K/k)-equivariant filtered vector bundle on 𝒳 with integrable log connection.
- `TauCeti.LogAdic.LogRH.rank`: The bundle has `rank rk_{Q_p}L`.
- `TauCeti.LogAdic.LogRH.grade`: `gr^r RH_log(L)≅µ′_*(L̂⊗OC_log)(r)` for every `r∈Z`; this is `H_log(L)(r)` once the log Higgs functor is defined.
- `TauCeti.LogAdic.LogRH.plus`: `RH⁺_log(L)=Fil⁰RH_log(L)` is a vector bundle on `𝒳⁺` with integrable log t-connection `t∇_L`, and `Fil^r RH_log(L)=t^r RH⁺_log(L)` for all r (Lemma 3.1.8).
- `TauCeti.LogAdic.LogRH.exact`: `L↦RH_log(L)` is exact, and `R^iµ′_*(L̂⊗Fil^r OB_dR,log)=0` for `i>0` and all r.
- `TauCeti.LogAdic.LogRH.map_comp`: Pushforward of coefficient maps preserves identities and composition.
- `TauCeti.LogAdic.LogRH.restrict_open`: For an open immersion `j:X′→X` with the restricted divisor, `j*RH_log(L)≅RH_log(j⁻¹L)` compatibly with connections and filtrations (Remark 3.5.1).
- `TauCeti.LogAdic.LogRH.trivial_log`: Trivial-log specialization is the ordinary RH functor with the corrected filtration-completed structural periods.

**Checks.**

- `TauCeti.LogAdic.LogRH.constant`: `RH_log(Q_p)≅O_X⊗̂_k B_dR` with connection `d⊗1` (all residues zero) and `Fil^r=t^r(O_X⊗̂_k B_dR⁺)` (Lemma 3.3.2 with the whole interval).
- `TauCeti.LogAdic.LogRH.zero`: The zero local system gives the zero bundle.
- `TauCeti.LogAdic.LogRH.fractional_residue`: A finite boundary character with normalized residue 2/3 has a tensor square with normalized residue 1/3; it cannot be modeled by an unrestricted tensor functor adding residues to 4/3.
- Its rank equals that of L, without a de Rham assumption on L.
- K ranges over all perfectoid fields containing `k_∞`; the comparison theorems that need K to be the completion of k̄ are separate results.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3 opening, p. 22: Fixes the coefficient field: K is any perfectoid field containing k_∞ (k a p-adic field, k̄ its algebraic closure, bar lost in extraction); the statement uses exactly this generality. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.2.2) and Theorem 3.2.3(1), p. 25: States that `RH_log(L)=Rµ′_*(L̂⊗OB_dR,log)` is an exact functor to Gal(K/k)-equivariant vector bundles on 𝒳 with integrable log connection and locally free O_X⊗̂B_dR⁺-lattice filtration, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.3, proof of Theorem 3.2.3(1), pp. 27–28: Gives the `rank rk_{Q_p}L` of `RH_log(L)` on 𝒳 and its filtration `Fil^r=µ′_*(L̂⊗Fil^r OB_dR,log)`, deduced from the locally free B_dR⁺-lattices; no de Rham hypothesis is used. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.3, (3.3.1) and following, p. 28: Constructs `∇_L` by the projection formula and derives integrability and Griffiths transversality from the structural period connection, as in the statement's proof steps.

*Needs:* [7.19](#section-7-19); [7.11](#section-7-11); [7.17](#section-7-17); [6.34](#section-6-34); [6.37](#section-6-37); [6.31](#section-6-31); [7.16](#section-7-16).

Applications include DLLZ-RH Theorem 5.3.1: Arithmetic descent and normalized boundary extension compare canonical coefficients; BPC25 Proposition 4.4.38: Uses the canonical p-adic/de Rham association.

<a id="section-7-21"></a>

### 7.21 Geometric logarithmic Higgs functor

Construct `TauCeti.LogAdic.LogHiggs`. In the setting of the geometric log Riemann–Hilbert functor, `H_log(L):=gr⁰RH_log(L)=RH⁺_log(L)/t≅µ′_*(L̂⊗OC_log)` defines a natural functor from Q_p-local systems on `X_két` to Gal(K/k)-equivariant log Higgs bundles `θ_L:H_log(L)→H_log(L)⊗Ω^log_{X_K}(−1)` on `X_K,an`, of `rank rk_{Q_p}L`, where `θ_L` is the reduction modulo t of the log t-connection `t∇_L` on `RH⁺_log(L)=Fil⁰RH_log(L)` (Lemmas 3.1.8–3.1.9), so `θ_L∧θ_L=0`. Its log Higgs complex has degree q term `H_log(L)⊗Ω^{log,q}_{X_K}(−q)`.

Same p-adic field k, perfectoid `K⊇k_∞` and normal crossings pair (X,D) as `RH_log`; use the `−q` twists in the complex (Definition 3.1.7(3)).

By Lemma 3.1.8, `RH⁺_log(L)=Fil⁰RH_log(L)` is a vector bundle on `𝒳⁺` with integrable log t-connection `t∇_L`; reduce it modulo t (Lemma 3.1.9) to get an O_{X_K}-linear `θ_L` with `θ_L∧θ_L=0`.

Identify `gr⁰RH_log(L)` with `µ′_*(L̂⊗OC_log)`, finite locally free of rank rk L, by the OC pushforward theorem (Proposition 3.3.3).

Galois equivariance and functoriality are inherited from `RH_log`.

The interface consists of the following named results.

- `TauCeti.LogAdic.LogHiggs`: Degree-zero reduction with its O-linear integrable log Higgs field.
- `TauCeti.LogAdic.LogHiggs.underlying`: Its underlying module is `gr⁰ RH_log(L)`.
- `TauCeti.LogAdic.LogHiggs.pushforward_OC`: `H_log(L)≅µ′_*(L̂⊗OC_log)`, and `R^iµ′_*(L̂⊗OC_log)=0` for `i>0`.
- `TauCeti.LogAdic.LogHiggs.rank`: `H_log(L)` is a vector bundle on `X_K,an` of `rank rk_{Q_p}L`.
- `TauCeti.LogAdic.LogHiggs.field`: The field takes values in `Ω¹_log(−1)`.
- `TauCeti.LogAdic.LogHiggs.complex`: The log Higgs complex `(H_log(L)⊗Ω^{log,•}_{X_K}(−•),θ_L)` and its hypercohomology H^i_logHiggs(X_K,an,H_log(L)) (Definition 3.1.7(3)).
- `TauCeti.LogAdic.LogHiggs.map_comp`: The assignment preserves identity and composition of coefficient morphisms.

**Checks.**

- `TauCeti.LogAdic.LogHiggs.constant`: The constant local system has `H_log(Q_p)=O_{X_K}` with zero log Higgs field.
- `TauCeti.LogAdic.LogHiggs.twist`: The qth Higgs-complex term carries Tate twist `−q`.
- `TauCeti.LogAdic.LogHiggs.residue`: For X the closed unit disc over k with `D={T=0}` and a rank-two Q_p-local system on `X_két` whose boundary inertia acts unipotently but nontrivially, `θ_L` is nonzero, `θ_L∧θ_L=0`, and its residue along D is a nonzero nilpotent endomorphism of `H_log(L)|_D` (valued in the `(−1)` twist); for the constant system the residue is zero.
- The Tate twist cannot be discarded when describing the Higgs field.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.4(1), p. 25: States the existence of the natural functor `H_log` to Gal(K/k)-equivariant log Higgs bundles with `θ_L` valued in `Ω^log_{X_K}(−1)` on `X_K,an`, as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.4(1), pp. 25–26: Defines `H_log` as `gr⁰RH_log=RH⁺_log/t` via Lemmas 3.1.8–3.1.9, which is the statement's construction. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.9, p. 24: Reduction modulo t of an integrable log t-connection gives a log Higgs bundle; this produces `θ_L`. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(3), p. 24: Defines log Higgs bundles with `θ:E→E⊗Ω^log(−1)`, `θ∧θ=0`, and the complex with terms `E⊗Ω^{log,q}(−q)` used by the statement.

*Needs:* [7.20](#section-7-20); [7.17](#section-7-17); [7.19](#section-7-19).

Applications include DLLZ-RH Theorem 3.2.7(3): Its proper cohomology gives the Hodge–Tate decomposition.

<a id="section-7-22"></a>

### 7.22 Regularity and normalized log extensions

Prove `TauCeti.LogAdic.log_regularity_and_extension`. Let X be a smooth rigid analytic variety over k with normal crossings divisor D and `U=X−D`. (1) A torsion-free coherent `O_X-module F` with integrable log connection `∇:F→F⊗Ω^log_X` is locally free if F is reflexive and, along every irreducible component of D, all eigenvalues of the residue of `∇` lie in Q∩[0,1). (2) If F is locally free and F′ is torsion-free coherent, both with integrable log connections whose residues along all irreducible components of D have eigenvalues in Q∩[0,1), then every horizontal morphism `F→F′` whose restriction to U is an isomorphism is an isomorphism on X. Statement (2) also holds for `O_X⊗̂_k B_dR`-modules with integrable log connections on 𝒳.

Retain reflexivity for the local-freeness result, the normalized residue interval for both sheaves, and the horizontal morphism.

For a torsion-free coherent sheaf the residue along a component Z is taken on the locally free locus, whose complement has codimension at least two and contains no component of D (DLLZ-RH §3.4, p. 33).

(1): under reflexivity and the residue condition the completion of the stalk of F at each classical point is free, as in André–Baldassarri [AB01, Ch. 1, Prop. 4.5 and Lem. 4.6.1] or [ABC20, Lem. 11.5.1] (Proposition 3.4.16).

(2): replace F′ by its bidual F″ with the induced log connection, which has the same residues; F″ is locally free by (1), and `F→F′→F″` are injective because they are isomorphisms on the dense U.

Locally on a strictly étale chart to Dⁿ with F and F″ free of rank d, the matrix of `F→F″` is invertible off D; the normalized residue condition makes the meromorphic entries of its inverse regular (classical argument of [AB01, Ch. 1, Prop. 4.7] or the uniqueness in [ABC20, Thm. 11.2.2]) (Proposition 3.4.17).

For `O_X⊗̂_k B_dR`-modules run the same argument through the filtration of Lemma 3.1.4.

**Checks.**

- A boundary modification changing residue by an integer shows why the normalization interval matters.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.4.16, p. 37: States part (1): local freeness under reflexivity and residue eigenvalues in `Q∩`[0,1), with exactly these two conditions. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.4.17, p. 37: States part (2) for F locally free and F′ torsion-free with normalized residues; the source adds that the same holds for `O_X⊗̂_k B_dR`-modules, which the statement keeps. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Proposition 3.4.17, p. 37: The bidual reduction used in the statement's second proof step.

*Needs:* [6.11](#section-6-11); [6.5](#section-6-5); [7.17](#section-7-17); AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (coherent sheaf operations); AdicSpacesPartIII R3 (locally free sheaf).

<a id="section-7-23"></a>

### 7.23 Rational normalized logarithmic residues

Prove `TauCeti.LogAdic.normalized_log_residues`. Let k, K, (X,D) be as for the geometric log Riemann–Hilbert functor and L a Q_p-local system on `X_két`. For an irreducible component Z of D with `Z_k̄` irreducible (always achievable after a finite extension of k), all eigenvalues of `Res_Z(∇_L)` on `RH_log(L)` lie in Q∩[0,1). Locally, on an affinoid X with a smooth toric chart and `Z_i={T_i=0}`, Lemma 3.4.3 identifies `RH⁺_log(L)(X)` with `N⁺`, the elements c of `N_∞=(L̂⊗B_dR⁺)(X̃)` with `(γ−1)^Λc→0` t-adically, and `RH_log(L)(X)` with `N=N⁺[t⁻¹]`; under this identification `Res_{Z_i}(∇_L)` is the endomorphism `t⁻¹log(γ_i)` of `N/T_iN`, independent of the choice of roots of unity. If the boundary inertia along `Z_i` acts unipotently, in particular if L|U has unipotent geometric monodromy along D, `Res_{Z_i}(∇_L)` is nilpotent.

`Z_k̄` irreducible for the `RH_log` statement, so that the characteristic polynomial of `Res_Z` has coefficients in `B_dR`; otherwise replace k by a finite extension. Z is an irreducible component in the sense of Conrad and the residue is defined by (3.4.1).

Nilpotence needs unipotent geometric (not arithmetic) boundary monodromy (DLLZ-adic Definition 6.3.7).

The arithmetic analogue for `D_dR,log(L)` is part of [7.24](#section-7-24), which consumes this construction.

Reduce to an affinoid X with smooth toric chart, `Z_i` irreducible and `RH_log(L)` free; use the toric period model to identify `RH⁺_log(L)(X)≅N⁺` (Lemma 3.4.3, Lemma 3.4.6) and compute the residue as `t⁻¹log(γ_i)` on `N/T_iN` (Lemma 3.4.7, Remark 3.4.8).

At a k-point of `Z_i` the boundary inertia acts quasi-unipotently, so eigenvalues of `γ_i` on the boundary fibre are `ζ^y` with `y∈Q` (Lemma 3.4.11, using Lemma 3.4.9).

Decomplete `N_∞/ξ^r` to a finite level (Lemma 3.4.12, Theorem A.2.3.4) and use the T_i^{a/m}-filtration to show eigenvalues of `γ_i` on `N⁺/(ξ^r,T_i)` have the form `ζ^y[ε^z]` with z∈Q∩[0,1) (Lemma 3.4.13).

Combine with the t-adic convergence of `(γ_i−1)^l v` to get eigenvalues z∈Q∩[0,1) of `t⁻¹log γ_i` (end of the proof of Theorem 3.2.3(2), p. 36).

If `γ_i` acts unipotently on the stalks, `x=1` in Lemmas 3.4.11 and 3.4.13, so all eigenvalues vanish (proof of Theorem 3.2.12).

**Checks.**

- Unipotent Jordan inertia produces zero residue eigenvalues, not necessarily a zero residue operator.
- A nontrivial finite-order Kummer character along D gives a nonzero rational residue eigenvalue, so nilpotence genuinely needs unipotence.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(2), p. 25: The normalization for `RH_log`; the extracted 'Zk' is `Z_k̄` (bar lost in extraction), the geometric-irreducibility hypothesis the statement keeps. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.4.7, p. 35: The local residue formula stated here; Remark 3.4.8 records independence of the choice of roots of unity. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Theorem 3.2.12, p. 38: Nilpotence of the residues under unipotent geometric boundary monodromy, the statement's last clause.

*Needs:* [7.20](#section-7-20); [6.35](#section-6-35); [7.18](#section-7-18); [7.12](#section-7-12); [6.11](#section-6-11); [6.34](#section-6-34).

<a id="section-7-24"></a>

### 7.24 Arithmetic logarithmic de Rham functor

Construct `TauCeti.LogAdic.ArithmeticLogDR`. For µ:X_prokét→X_an (k, (X,D) as in the geometric functor, K any perfectoid field containing `k_∞`) set `D_dR,log(L)=µ_*(L̂⊗_{Q̂_p}OB_dR,log)`. For the invariant computation choose `K=k̂_∞`; then `D_dR,log(L)≅RH_log(L)^{Gal(k_∞/k)}` and `Fil^•D_dR,log(L)=(Fil^•RH_log(L))^{Gal(k_∞/k)}`. Then `L↦D_dR,log(L)` is a functor to vector bundles on `X_an` with integrable log connection `∇_L` and decreasing filtration by coherent subsheaves satisfying Griffiths transversality; for every irreducible component Z of D all eigenvalues of `Res_Z(∇_L)` lie in Q∩[0,1), and they are 0 if L|U has unipotent geometric monodromy along D. The adjunction map `D_dR,log(L)⊗̂_k B_dR→RH_log(L)` is injective and strictly compatible with filtrations. If L|U is de Rham it is an isomorphism compatible with connections and filtrations, and `gr D_dR,log(L)` is a vector bundle of `rank rk_{Q_p}L`. Without that hypothesis the rank of `D_dR,log(L)` need not equal rk L.

The same p-adic field and normal crossings pair as the geometric RH construction; no geometric-irreducibility hypothesis is needed for the arithmetic residues (Theorem 3.2.7(2)).

De Rham means L|U de Rham in Scholze's sense (as in the DLLZ-RH introduction); it is needed only for the adjunction isomorphism and the graded rank.

The intrinsic µ-pushforward does not depend on K. Its Galois-invariant description here uses `K=k̂_∞`, as in Lemma 3.3.17; it is not asserted for arbitrary Aut(K/k). General perfectoid K remains allowed for the geometric RH coefficient extension and the adjunction comparison.

Choose `K=k̂_∞` for the invariant computation. Compute `D_dR,log(L)` as the sheaf associated with `Y↦H⁰(Gal(k_∞/k),RH_log(L)(Y))`; with `K=k̂_∞`, decompletion (Theorem A.2.1.2, Corollary A.1.21) gives finitely generated graded pieces compatible with rational and finite étale localization, so `D_dR,log(L)` is coherent (Lemma 3.3.17); it is reflexive by the codimension-two extension argument [Kis99, Cor. 2.2.4], [Ser66, Prop. 7] (Lemma 3.3.18).

`D_dR,log(L)(X)≅N^{Gal(k_∞/k)}` and its residue is still `t⁻¹log(γ_i)`, so the eigenvalue analysis of [7.23](#section-7-23) gives eigenvalues in Q∩[0,1) (Proposition 3.4.15), and 0 under unipotent monodromy (proof of Theorem 3.2.12(2)); Proposition 3.4.16 then gives local freeness (Theorem 3.2.7(1)).

The adjunction map is injective and strict by comparing `⊕_{a+b=r}gr^a(RH_log(L))^{Gal(k_∞/k)}⊗K(b)` with `gr^r RH_log(L)` (Lemma 3.4.18).

If L|U is de Rham the map is an isomorphism on U (LZ17 Cor. 3.12(ii), from Scholze's association `L̂⊗OB_dR≅E⊗OB_dR`), hence on X by Proposition 3.4.17 and the normalized residues on both sides (Corollary 3.4.21); then `⊕_a gr^a D_dR,log(L)⊗K(−a)≅H_log(L)` gives the graded rank (Corollary 3.4.22).

The interface consists of the following named results.

- `TauCeti.LogAdic.ArithmeticLogDR`: The arithmetic degree-zero pushforward with its induced connection and coherent filtration.
- `TauCeti.LogAdic.ArithmeticLogDR.geometric_invariants`: For `K=k̂_∞`, the arithmetic pushforward is `RH_log(L)^{Gal(k_∞/k)}`, with `Fil^rD_dR,log(L)=(Fil^rRH_log(L))^{Gal(k_∞/k)}` (Lemma 3.3.17). This formula is not a descent claim through Aut(K/k) for arbitrary perfectoid K.
- `TauCeti.LogAdic.ArithmeticLogDR.residue_eigenvalues`: For every irreducible component Z of D the eigenvalues of `Res_Z(∇_L)` lie in Q∩[0,1); they are all 0 when L|U has unipotent geometric monodromy along D.
- `TauCeti.LogAdic.ArithmeticLogDR.toRH`: The adjunction map `D_dR,log(L)⊗̂_k B_dR→RH_log(L)` is horizontal, injective and strictly compatible with filtrations (Lemma 3.4.18).
- `TauCeti.LogAdic.ArithmeticLogDR.toRH_iso_of_isDeRham`: If L|U is de Rham, the adjunction map is an isomorphism of filtered vector bundles with log connection (Corollary 3.4.21).
- `TauCeti.LogAdic.ArithmeticLogDR.de_rham_grade_rank`: For de Rham interior input its total graded rank equals rk L.
- `TauCeti.LogAdic.ArithmeticLogDR.restrict_interior`: On U with trivial log structure, `D_dR,log(L)|U` is the ordinary arithmetic de Rham functor of L|U (Remark 3.5.1).
- `TauCeti.LogAdic.ArithmeticLogDR.map_comp`: Coefficient maps induce horizontal filtered maps, preserving composition.

**Checks.**

- `TauCeti.LogAdic.ArithmeticLogDR.constant`: For the trivial `Q_p` coefficient system, `D_dR,log=O_X` with d and its weight-zero filtration.
- `TauCeti.LogAdic.ArithmeticLogDR.tate`: For `L=Q_p(m)`, `D_dR,log(L)=O_X·(e_m⊗t^{−m})` with `∇=d`, and `gr^{−m}` is its only nonzero graded piece.
- `TauCeti.LogAdic.ArithmeticLogDR.zero`: The zero local system maps to the zero filtered bundle.
- `TauCeti.LogAdic.ArithmeticLogDR.non_de_rham`: For `X=Spa(k,O_k)` with empty boundary and a Q_p-character of Gal(k̄/k) whose Sen weight is not an integer, `D_dR,log(L)=0` although `rk L=1`, so the rank equality needs the de Rham hypothesis.
- Do not require de Rham input to define the functor or assert equal ranks for non-de Rham input.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.2.6) and Theorem 3.2.7(1), p. 26: Defines `D_dR,log(L)=µ_*(L̂⊗OB_dR,log)` and states it is a functor (not claimed exact) to vector bundles with integrable log connection and coherent Griffiths-transversal filtration. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(2), p. 26: The arithmetic residue normalization, stated without a geometric-irreducibility hypothesis; the same item gives the graded `rank rk_{Q_p}L` for de Rham L|U. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.4.18, p. 38: The adjunction map `D_dR,log(L)⊗̂_k B_dR→RH_log(L)` is injective and strict, as in the statement and its toRH API item. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 3.4.21, p. 38: The de Rham isomorphism with `RH_log` stated here; Corollary 3.4.22 then gives the graded rank. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.3.17 and its proof, pp. 31–32: Explicitly chooses `K=k̂_∞` to compute the arithmetic pushforward and its coherent graded pieces as cyclotomic Galois invariants; the intrinsic pushforward construction remains independent of this choice.

*Needs:* [7.20](#section-7-20); [7.21](#section-7-21); [7.19](#section-7-19); [7.18](#section-7-18); [7.23](#section-7-23); [7.22](#section-7-22); `PadicHodgeTheory` §§2.1–2.4 (de rham period sheaf); `PadicHodgeTheory` §7.2 (de rham lisse sheaf); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (coherent sheaf operations); AdicSpacesPartIII R3 (locally free sheaf).

Applications include DLLZ-RH Theorem 5.3.1: Canonical coefficients are identified with their standard filtered de Rham realizations; DLLZ-RH §§3.4–3.6 (Theorem 3.2.12(2), Corollary 3.5.7, Lemmas 3.6.3–3.6.4, Corollary 3.5.14): The adjunction isomorphism with `RH_log` for de Rham interior input drives the tensor, pullback, proper and relative comparisons.

<a id="section-7-25"></a>

### 7.25 Restricted logarithmic comparison under pullback

Prove `TauCeti.LogAdic.log_rh_pullback`. Let `h:Y→X` be a morphism of log adic spaces, where X and Y are smooth rigid analytic varieties over k with log structures given by normal crossings divisors D and E (so `h⁻¹(D)⊂E` set-theoretically), and let L be a Q_p-local system on `X_két`. The adjunction maps `h*H_log(L)→H_log(h⁻¹L)`, `h*RH_log(L)→RH_log(h⁻¹L)` and `h*D_dR,log(L)→D_dR,log(h⁻¹L)` are injective, the last two strictly compatible with filtrations. For components Z of D and W of E let `m_WZ≥0` be the multiplicity of W in `h⁻¹(Z)`, and `n_Z=0` (resp. 1) if L|U has (resp. does not have) unipotent geometric monodromy along Z. If `∑_Z m_WZ n_Z≤1` for every W, the three maps are Gal(K/k)-equivariant (for the geometric ones) isomorphisms compatible with log connections, Higgs fields and filtrations. In local coordinates `Res_W(h*∇_L)=∑_{h(W)⊂Z} m_WZ h*_{WZ}Res_Z(∇_L)`, with commuting summands.

Boundary multiplicities are those of the divisors `h⁻¹(Z)`; `n_Z` refers to geometric boundary monodromy; no isomorphism is claimed when `∑_Z m_WZ n_Z≥2` for some W.

Injectivity (Lemma 3.5.3): `V_K` is dense in `Y_K`, `h*H_log(L)` is a vector bundle and the interior Higgs pullback map for `h|V:V→U` is an isomorphism (LZ17 Thm. 2.1(iii)); deduce the `RH_log` case from `gr^r RH_log≅H_log(r)`, and the `D_dR,log` case from Lemma 3.4.18.

Compute `Res_W(h*∇_L)=∑m_WZ h*_{WZ}Res_Z(∇_L)` in toric coordinates; `Res_Z` is nilpotent when `n_Z=0`, so under the hypothesis at most one summand is non-nilpotent and it has `m_WZ₀=1`; hence the eigenvalues lie in Q∩[0,1) (Theorems 3.2.3(2), 3.2.7(2)).

Both sides then have normalized residues and agree over V by the interior pullback theorem (LZ17 Thm. 3.8(iv), 3.9(ii)); Proposition 3.4.17 gives the isomorphisms for `RH_log` and `D_dR,log`, and taking `gr⁰` gives the Higgs case (Corollary 3.5.7).

**Checks.**

- For `h:S↦T=S²` on the disc `(m_WZ=2)` and a Kummer character along `Z={T=0}` with residue `2/3 (n_Z=1)`, the pulled-back residue is 4/3 while `RH_log(h⁻¹L)` has residue 1/3, so the adjunction map is injective but not an isomorphism.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(4), p. 25: Defines `m_WZ` and `n_Z`; the same item assumes `∑_Z m_WZ n_Z≤1` for each component W of E (checked on the rendered page) and gives the filtered `RH_log` isomorphism; Theorems 3.2.4(3), 3.2.7(4) give the Higgs and `D_dR,log` analogues. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.5.3, p. 39: Unconditional injectivity and strictness of the `RH_log` and `D_dR,log` adjunction maps (the Higgs map is stated injective). [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 3.5.7, p. 39: The isomorphism stated here, under its hypothesis. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Corollary 3.5.7, p. 40: Starts the residue argument: nilpotent residues along unipotent components leave at most one non-nilpotent summand, with multiplicity 1.

*Needs:* [7.20](#section-7-20); [7.21](#section-7-21); [7.24](#section-7-24); [7.23](#section-7-23); [7.22](#section-7-22); [6.35](#section-6-35); [6.11](#section-6-11).

<a id="section-7-26"></a>

### 7.26 Tensor comparison for unipotent boundary systems

Prove `TauCeti.LogAdic.unipotent_log_tensor`. (1) `RH_log` (resp. `H_log`) restricts to a tensor functor from the category of Q_p-local systems L on `X_két` such that L|U has unipotent geometric monodromy along D to the category of filtered Gal(K/k)-equivariant vector bundles on 𝒳 with integrable log connection with nilpotent residues along D (resp. Gal(K/k)-equivariant log Higgs bundles on `X_K,an`). (2) `D_dR,log` restricts to a tensor functor from the category of Q_p-local systems L on `X_két` such that L|U is de Rham and has unipotent geometric monodromy along D to filtered vector bundles on `X_an` with integrable log connection with nilpotent residues along D. For such L the period maps `µ′⁻¹H_log(L)⊗OC_log→L̂⊗OC_log` and `µ′⁻¹RH_log(L)⊗OB_dR,log→L̂⊗OB_dR,log`, and in case (2) `µ⁻¹D_dR,log(L)⊗OB_dR,log→L̂⊗OB_dR,log`, are isomorphisms. No tensor compatibility is asserted for arbitrary Q_p-local systems.

Unipotence is geometric boundary unipotence as in DLLZ-adic Definition 6.3.7; `D_dR,log` also requires L|U de Rham.

Unipotent geometric monodromy forces `x=1` in Lemmas 3.4.11 and 3.4.13, so the residues of `RH_log(L)` are nilpotent (Lemma 3.4.7), and those of `D_dR,log(L)` as well by Proposition 3.4.15.

In the decomposition (3.3.9) only characters `τ` with `τ(γ_i)=1` for every boundary coordinate occur, so after enlarging m₀ the map (3.3.13) is an isomorphism; hence the period maps for `H_log` and `RH_log` are isomorphisms (cf. LZ17 Thm. 2.1(ii), 3.8(iii)).

With these isomorphisms argue as in LZ17 Thm. 2.1(iv) and 3.8(i): the multiplication maps for tensor products and the unit are isomorphisms, compatibly with connections, filtrations, Higgs fields and Galois actions.

For (2), Corollary 3.4.21 makes `D_dR,log(L)⊗̂_k B_dR→RH_log(L)` an isomorphism, so the arithmetic period map is an isomorphism and one concludes as in LZ17 Thm. 3.9(v).

**Checks.**

- For a Kummer character `χ` along D with residue 2/3, `RH_log(χ)⊗RH_log(χ)` has residue 4/3 while `RH_log(χ²)` has residue 1/3, so the unrestricted tensor statement is false; `χ` does not have unipotent monodromy.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.12(1), p. 27: Part (1) for `RH_log` and `H_log`, with targets filtered equivariant bundles with nilpotent residues (resp. equivariant log Higgs bundles), as in the statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.12(2), p. 27: Part (2): the arithmetic functor needs de Rham and unipotent interior restriction. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Paragraph before Theorem 3.2.12, p. 27: Supports the statement's refusal of an unrestricted tensor statement. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Theorem 3.2.12, p. 39: The final step of the proof sketch, after the period maps are shown to be isomorphisms.

*Needs:* [7.20](#section-7-20); [7.21](#section-7-21); [7.24](#section-7-24); [7.19](#section-7-19); [7.23](#section-7-23); [6.35](#section-6-35); `PadicHodgeTheory` §7.2 (de rham lisse sheaf).

<a id="section-7-27"></a>

### 7.27 Proper logarithmic period cohomology comparison

Prove `TauCeti.LogAdic.proper_log_period_cohomology`. Let X be proper over k (smooth, with normal crossings divisor D), K the completion of an algebraic closure k̄ of k, and L a Z_p-local system on `X_két`. For each `i≥0` there are canonical Gal(K/k)-equivariant isomorphisms `H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(𝒳,RH_log(L))`, compatible with filtrations, and H^i(X_K,két,L)⊗_{Z_p}K≅H^i_logHiggs(X_K,an,H_log(L)); they factor through `H^i(X_K,prokét,L̂⊗B_dR)` and `H^i(X_K,prokét,L̂⊗Ô)` (Lemmas 3.6.1–3.6.2). If moreover L|U is de Rham, `H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(X_an,D_dR,log(L))⊗_k B_dR` compatibly with filtrations, the log Hodge–de Rham spectral sequence of `D_dR,log(L)` degenerates at E₁, and H^i(X_K,két,L)⊗_{Z_p}K≅⊕_{a+b=i}H^{a,b}_logHodge(X_an,D_dR,log(L))⊗_k `K(−a)`, the 0-th graded piece of the previous isomorphism. No compactly supported or subcanonical version is asserted.

X proper over k and K the completion of k̄ for every conclusion; L|U de Rham only for the `D_dR,log` comparison, the E₁-degeneration and the Hodge–Tate decomposition; the `RH_log/H_log` comparisons hold for every Z_p-local system (torsion allowed, DLLZ-adic Definition 6.3.1).

Lemma 3.6.1: as in Scholze's Theorem 8.4, with his primitive comparison replaced by the log primitive comparison (DLLZ-adic Theorem 6.2.1) and the finiteness of `H^i(X_K,két,L)`, obtain `H^i(X_K,két,L)⊗B_dR⁺≅H^i(X_K,prokét,L̂⊗B_dR⁺)` compatibly with filtrations, and its `gr⁰` version with `Ô`.

Lemma 3.6.2: by the log Poincaré lemma (Corollary `2.4.2) L̂⊗B_dR≃DR_log(L̂⊗OB_dR,log`) and L̂⊗Ô≃Higgs_log(L̂⊗OC_log); by Theorem 3.2.3(1), Proposition 3.3.3 and the projection formula ([6.37](#section-6-37)), `Rµ′_*` of these complexes are `DR_log(RH_log(L))` and Higgs_log(H_log(L)). This gives Theorems 3.2.3(3) and 3.2.4(2).

Lemmas 3.6.3–3.6.4: for L|U de Rham, Corollary 3.4.21 gives `RH_log(L)≅D_dR,log(L)⊗̂_k B_dR`, and Lemma 3.5.9 (proper pushforward commutes with `⊗̂_k B_dR`, via `gr^r B_dR≅K(r)`) moves `B_dR` outside the hypercohomology; taking `gr⁰` gives the Hodge–Tate decomposition.

E₁-degeneration: (3.2.8) and (3.2.9) give `dim_k H^i_logdR=∑_{a+b=i}dim_k` H^{a,b}_logHodge.

**Checks.**

- The Tate twist is `−a`; the decomposition concerns coefficient log Hodge cohomology, not just ordinary differential-form cohomology.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(3), p. 25: The standing hypotheses of all cohomology comparisons: X proper and K the completed algebraic closure (the hat and bar are lost in extraction); Theorems 3.2.4(2) and 3.2.7(3) refer back to them. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.6.1, pp. 41–42: The `B_dR⁺` upgrade of the log primitive comparison, the statement's first proof step. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.6, after Lemma 3.6.2, p. 42: The `RH_log` and `H_log` comparisons hold for every Z_p-local system, without a de Rham hypothesis. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(3), p. 26: The de Rham-interior comparison with `D_dR,log(L)⊗_k B_dR`, E₁-degeneration and Hodge–Tate decomposition with twist `K(−a)`, as in the statement.

*Needs:* [7.5](#section-7-5); [7.3](#section-7-3); [7.8](#section-7-8); [7.13](#section-7-13); [7.20](#section-7-20); [7.19](#section-7-19); [7.21](#section-7-21); [7.24](#section-7-24); `PadicHodgeTheory` §7.2 (de rham lisse sheaf); [6.37](#section-6-37); [6.31](#section-6-31); AdicSpacesPartIII R3 (kiehl proper mapping theorem); AdicSpacesPartIII R3 (proper coherent cohomology field extension).

<a id="section-7-28"></a>

### 7.28 Relative logarithmic de Rham comparison

Prove `TauCeti.LogAdic.relative_log_comparison`. Let `f:X→Y` be a proper log smooth morphism, where X and Y are smooth rigid analytic varieties over k with log structures given by normal crossings divisors D and E, such that `f|_U:U→V (U=X−D, V=Y−E)` is proper smooth; then `D=f⁻¹(E)`. For a Z_p-local system L on `X_két` with L|U de Rham, each R^if_két,*(L) is a Z_p-local system on `Y_két` whose restriction to V is de Rham, and there is a canonical isomorphism D_dR,log(R^if_két,*L)≅(R^if_logdR,*(D_dR,log(L),∇_L))_free compatible with log connections (Gauss–Manin) and filtrations, where the subscript free denotes the O_Y-torsion-free quotient.

Both proper log smooth f and proper smooth interior restriction are required; L|U de Rham; retain the torsion-free quotient.

`D=f⁻¹(E)` by the argument of Lemma 3.5.2 and density of U; R^if_két,*(L) is a Z_p-local system by DLLZ-adic Corollary 6.3.5, and its completion is R^if_prokét,*(L̂) (DLLZ-adic Definition 6.3.2, Proposition 5.2.1).

The relative log Poincaré lemma (Corollary 2.4.6), `Rµ′_{Y,*}` and the projection formula give the filtered map (3.5.8) RH_log(R^if_két,*L)→R^if_logdR,*(RH_log(L)); for L|U de Rham rewrite the target as R^if_logdR,*(D_dR,log(L))⊗̂_k `B_dR` (Corollary 3.4.21, Lemma 3.5.9) and take Gal(K/k)-invariants to get (3.5.10).

R^if_*(L)|V is de Rham by Scholze's relative comparison (Sch13 Thm. 8.8); by Corollary 3.4.22 and density of V the induced map to the torsion-free quotient is injective and strictly filtered (Lemma 3.5.11).

By Katz's argument [Kat71, Sec. VII] the residues of (R^if_logdR,*D_dR,log(L))_free have eigenvalues in Q∩[0,1); Proposition 3.4.17, Theorem 3.2.7(1) and the interior comparison on V give the isomorphism (Corollary 3.5.14).

**Checks.**

- A relative conclusion omitting the interior properness or the torsion-free quotient is rejected.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(5), p. 26: The two properness hypotheses of the statement; the same item states that R^if_két,*(L) is a Z_p-local system on `Y_két` that is de Rham on V. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(5), p. 27: The torsion-free quotient in the comparison isomorphism, which the statement retains. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Corollary 3.5.14, p. 41: The final extension-uniqueness step, after Katz's residue argument shows the free quotient has normalized residues. [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89: The Kummer proper pushforward used in the first proof step; its hypotheses (f log smooth, f and `f|_{X−D}` proper) are those of the statement.

*Needs:* [7.13](#section-7-13); [7.20](#section-7-20); [7.24](#section-7-24); [7.22](#section-7-22); [6.34](#section-6-34); [6.20](#section-6-20); `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); [6.37](#section-6-37); [7.6](#section-7-6); [7.7](#section-7-7); [6.24](#section-6-24); AdicSpacesPartIII R3 (kiehl proper mapping theorem).

<a id="section-7-29"></a>

### 7.29 Canonical coefficients of a Hodge-type datum on the log site

Construct `TauCeti.LogAdic.CanonicalLogRealizations`. Let (G, X) be a Shimura datum of Hodge type with a Siegel embedding, faithful symplectic representation V₀ and universal polarized abelian scheme f: `A → S_K` at a neat level K (for data of Hodge type `Gᶜ = G`), and `S^tor_{K,Σ}` a smooth projective toroidal compactification whose boundary D is a normal-crossings divisor. For an algebraic representation W of G, import the canonical automorphic étale ℚ_p-local system `W_p` on `S_K` and the automorphic filtered connection `W_dR` with its canonical extension (nilpotent residues along D, filtration by subbundles). V₀ is realized by `H₁(A) = (R¹f_*)^∨`, so `V₀^{⊗m}(−t)` is realized by the duals of the cohomology of the m-fold fibre product `A^m` up to Tate twist, and every irreducible W is cut out of some `V₀^{⊗m_W}(−t_W)` by a Hodge tensor `s_W`. (1) `W_p` extends uniquely to a Kummer-étale ℚ_p-local system on `S^tor_{K,Σ}` (boundary local-system equivalence, characteristic 0), completed to `Ŵ_p` on the pro-Kummer-étale site, and this extension has unipotent geometric monodromy along D. (2) Over a finite extension k of `ℚ_p` containing the p-adic completion of the reflex field (and the coefficient field), `W_p|S_K` is de Rham: for `W = V₀^{⊗m}(−t)` because the relative étale cohomology of the proper smooth `A^m → S_K` is de Rham (relative comparison), and for every W because `W_p` is a direct summand cut out by the horizontal tensor `s_W`, whose étale and de Rham realizations correspond (1.3). (3) `p-W_dR := D_dR,log(W_p)` is a filtered log connection on `S^tor_{K,Σ,k}` with nilpotent residues along D; after `ι`: `ℚ̄_p ≅ C`, the horizontal sections of the analytified base change of `p-W_dR|S_K` form the C-local system `p-W_B`. Each of `W ↦ W_p`, `W_dR`, `p-W_dR`, `p-W_B` is a `G(𝔸_f)`-equivariant tensor functor on Rep(G), functorial for morphisms of Hodge-type Shimura data. Full-group coefficients, not arbitrary Levi representations, carry these flat connections.

(G, X) of Hodge type; smooth projective toroidal compactification with normal-crossings boundary (strict normal crossings after étale localization); canonical full-group coefficients and their tensor and Hecke functoriality come from `AutomorphicBundles`. Shimura data not of Hodge type are not treated in this roadmap: the de Rham property and the comparison of their canonical local systems use special points, CM motives, Margulis superrigidity and the congruence subgroup property (DLLZ-RH §§5.4–5.6).

Import B2's full-group realizations `W_p` and `W_dR` and B3.general's canonical logarithmic extension of `W_dR` with nilpotent residues (DLLZ-RH Proposition 5.2.10), and B1's realization of V₀ by the homology of A.

Unipotent geometric monodromy of `W_p` along D (DLLZ-RH p. 55, after (5.2.13)) and the boundary local-system equivalence ([6.20](#section-6-20)) give the Kummer-étale extension; complete it on the pro-Kummer-étale site.

De Rham property: for `A^m → S_K` proper smooth over k, R^if_*ℚ_p is de Rham with D_dR(R^if_*ℚ_p) `≅` R^if_dR,* (`PadicHodgeTheory` §§2.1–2.7, 7.1–7.3, de Rham pair derived pushforward); `V₀^{⊗m}(−t)` is cut out of the cohomology of `A^m` by an endomorphism (Lieberman's trick), and irreducible W by s_W (DLLZ-RH Lemma 5.5.6); direct summands of de Rham local systems are de Rham.

Apply `D_dR,log` to the de Rham local system `W_p (DLLZ-RH (5.2.14)–(5.2.16))`; nilpotent residues and the tensor property come from Theorem 3.2.12(2); push out along `L⊗k→k`, algebraize by rigid GAGA on the proper `S^tor_{K,Σ,k}` (Köpf; DLLZ-RH p. 55, D^alg_dR,log), base change the algebraic object via `ι` and take horizontal sections to obtain `p-W_B` (Proposition 5.2.17).

Check tensor, dual, unit and Hecke pullback compatibility on the unipotent coefficient subcategory.

The interface consists of the following named results.

- `TauCeti.LogAdic.CanonicalLogRealizations`: The imported coefficient functors instantiated on the toroidal Kummer/pro-Kummer ringed sites, together with the p-adic realizations `p-W_dR` and `p-W_B`.
- `TauCeti.LogAdic.CanonicalLogRealizations.etale_restriction`: Restriction to the interior recovers the canonical p-adic local system.
- `TauCeti.LogAdic.CanonicalLogRealizations.de_rham_extension`: Its filtered log bundle is B3.general’s nilpotent-residue canonical extension.
- `TauCeti.LogAdic.CanonicalLogRealizations.de_rham`: `W_p|S_K` is de Rham, through the relative comparison for `A^m` and the Hodge tensors `s_W`.
- `TauCeti.LogAdic.CanonicalLogRealizations.hecke`: Pullbacks under finite-level Hecke maps agree with the coefficient representation action.
- `TauCeti.LogAdic.CanonicalLogRealizations.unipotent_monodromy`: `W_p|S_K` has unipotent geometric monodromy along every boundary component, which makes the residues of `p-W_dR` nilpotent (DLLZ-RH Theorem 3.2.12(2)); the Kummer-étale extension itself is unique by the boundary local-system equivalence, independently of unipotence.
- `TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham`: `p-W_dR=D_dR,log(W_p)` is a filtered log connection with nilpotent residues on `S^tor_{K,Σ,k}`; `W↦p-W_dR` is a tensor functor (DLLZ-RH Theorem 3.2.12(2)).
- `TauCeti.LogAdic.CanonicalLogRealizations.p_betti`: After `ι:ℚ̄_p≅C`, the horizontal sections of the analytified `p-W_dR|S_K` form a C-local system `p-W_B`; `W↦p-W_B` is a `G(𝔸_f)`-equivariant tensor functor.
- `TauCeti.LogAdic.CanonicalLogRealizations.tensor`: Tensor, dual and unit isomorphisms for `W_p`, `W_dR`, `p-W_dR` and `p-W_B` are canonical and coherent.

**Checks.**

- `TauCeti.LogAdic.CanonicalLogRealizations.unit`: The trivial representation gives the constant `ℚ_p` sheaf and trivial filtered O bundle.
- `TauCeti.LogAdic.CanonicalLogRealizations.siegel`: In the Siegel case the standard representation is the semiabelian Tate/de Rham coefficient with its boundary extension.
- `TauCeti.LogAdic.CanonicalLogRealizations.no_levi_connection`: An arbitrary Levi coefficient has an automorphic bundle but is not thereby assigned a full-group flat local system.
- `TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham_unit`: For the trivial representation `p-W_dR` is O with d and the filtration `Fil⁰=O`, `Fil¹=0`, and `p-W_B` is the constant sheaf C; a nontrivial filtration jump or residue would fail this.
- For the modular curve and `W = V₀`, `W_p` is the dual of `R¹f_*ℚ_p` of the universal elliptic curve, de Rham with `D_dR = (H¹_dR)^∨`; its residue at a cusp is nilpotent and nonzero (Tate curve).

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.2.10, p. 54: States the Betti and automorphic de Rham coefficient functors as `G(𝔸_f)`-equivariant tensor functors on Rep(Gᶜ); the statement imports them and their canonical log extension. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §5.2, (5.2.12)–(5.2.16), p. 55: Gives the unipotent boundary monodromy of the étale coefficient used for the Kummer extension and builds `p-dR V^can` with nilpotent residues. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §5.5, the setting before Lemma 5.5.3, p. 62, and Lemma 5.5.6, p. 63: for Hodge type, `V₀^{⊗m}(−t)` is realized by the cohomology of `A^m` and every irreducible representation is cut out by a Hodge tensor. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.2.17, p. 56: States the tensor-functor and Hecke properties of the p-adic realizations p-dR and p-B that the statement constructs. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.38, p. 79: BPC25’s finite-level coefficients on `S^tor_{K,Σ}`: the pro-Kummer-étale local system and the filtered log connection that the statement supplies.

*Needs:* [6.20](#section-6-20); [6.34](#section-6-34); [6.35](#section-6-35); [7.24](#section-7-24); [7.26](#section-7-26); [1.3](#section-1-3); `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B2 (etale coefficient local system); `AutomorphicBundles` B2.general (general flat realizations); `AutomorphicBundles` B3.general.2 (general logarithmic comparison); `AutomorphicBundles` B3.log.2–B3.log.3 (the unipotent Hodge-type instance); `ShimuraCompactifications` C2 (smooth normal crossings).

Prove that the Hodge-type, unipotent smooth-pair instance agrees with `AutomorphicBundles` B3.log.2–B3.log.3, preserving its period maps, tensors and residues. Applications include DLLZ-RH Theorem 5.3.1 (the comparison identifies these two canonical realizations) and PerfectoidShimuraVarieties S6 (imports these finite-level tensor-compatible coefficients).

<a id="section-7-30"></a>

### 7.30 Canonical p-adic and de Rham association

Prove `TauCeti.LogAdic.canonical_log_period_comparison`. Let (G, X), f: `A → S_K` and `S^tor_{K,Σ}` be as in [7.29](#section-7-29), and k a finite extension of `ℚ_p` containing the p-adic completion of the reflex field E. (1) For every `W ∈ Rep(G)` there is a canonical isomorphism of filtered log connections `p-W_dR ≅ W_dR ⊗_E k` on `S^tor_{K,Σ,k}`, characterized on `S_K` as follows: for `W = V₀^{⊗m}(−t)` it is induced by the relative de Rham comparison D_dR(R^if^m_*ℚ_p) `≅` R^if^m_dR,* for the proper smooth `A^m → S_K`, and for general W it is induced from these through the Hodge tensors `s_W`. (2) Composed with the log Riemann–Hilbert isomorphism `µ⁻¹D_dR,log(W_p) ⊗ OB_dR,log ≅ Ŵ_p ⊗ OB_dR,log` of [7.24](#section-7-24) (`µ: S^tor_{K,Σ,prokét} → S^tor_{K,Σ,an}` the projection of sites, not the Hodge cocharacter), it gives a canonical isomorphism `Ŵ_p ⊗_{ℚ_p} OB_dR,log ≅ W_dR ⊗_O OB_dR,log` on the pro-Kummer-étale site, compatible with filtrations and connections. (3) These isomorphisms are tensor isomorphisms, compatible with duals, the Hecke action, change of level and morphisms of Hodge-type Shimura data, and with descent along the reflex field; they identify the nilpotent-residue boundary extensions, not only their interior restrictions; after `ι` they induce `p-W_B ≅ W_B,C` on horizontal sections.

(G, X) of Hodge type with a fixed Siegel embedding; K neat; `S^tor_{K,Σ}` smooth projective with normal-crossings boundary. `W_p` is de Rham with unipotent geometric monodromy by [7.29](#section-7-29).

(1) On `S_K`: the relative de Rham comparison for f^m (PadicHodgeTheory §§2.1–2.7, 7.1–7.3, de Rham pair derived pushforward; Scholze 2013 Theorems 8.8 and 9.1) identifies D_dR(R^if^m_*ℚ_p) with the Gauss–Manin filtered connection, functorially in `A^m`; Lieberman's trick cuts `V₀^{⊗m}(−t)` out of the cohomology of `A^m` by an endomorphism, which gives `p-W_dR|S_K ≅ W_dR|S_K` for these W (DLLZ-RH Lemma 5.5.3). For irreducible W, `s_W` cuts W out of some V₀^{⊗m_W}(−t_W) (DLLZ-RH Lemma 5.5.6, Corollary 5.5.7), and the étale and de Rham realizations of `s_W` correspond under the comparison (1.3), so the isomorphism restricts to W; additivity gives every W. The two sides are filtered log connections on `S^tor` with nilpotent residues along D ([7.29](#section-7-29) (3) and the canonical extension of `W_dR`), so the isomorphism on `S_K` extends uniquely by [7.22](#section-7-22) (2).

(2) The period isomorphism holds for de Rham local systems with unipotent geometric boundary monodromy (DLLZ-RH Corollary 3.4.21 and the proof of Theorem 3.2.12(2)); tensor it with (1).

(3) Tensor compatibility from the compatibility of the relative comparison with cup products and of 1.3 with tensor operations; Hecke and level compatibility because the relative comparison is functorial for isogenies and for the level maps of the abelian scheme; extension of compatibilities across the boundary by uniqueness of normalized extensions ([7.22](#section-7-22)) and the unipotent tensor theorem ([7.26](#section-7-26)); reflex-field descent because A and its Gauss–Manin connection are defined over E and `D_dR,log` commutes with Galois descent.

**Checks.**

- For the trivial representation the isomorphism is the identity of (O, d) with `Fil⁰ = O`, `Fil¹ = 0`.
- For the modular curve and `W = V₀`, the isomorphism is the relative de Rham comparison of the universal elliptic curve; its Hodge–Tate graded piece on `S_K` is the sequence `0 → ω^{−1}(1) → T_pE ⊗ Ô → ω → 0` of 2.6.
- The isomorphism is not chosen up to scalar: it is fixed by the relative comparison of the abelian scheme, so no normalization at special points is needed in Hodge type.

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 5.5.3 and its proof, pp. 62–63: for Hodge type, the comparison for `V₀^{⊗m}(−t)` induced by Scholze's relative comparison for `A^m` (Theorems 8.8 and 9.1 of Scholze 2013) and Lieberman's trick. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 5.5.6 and Corollary 5.5.7, p. 63: every irreducible representation is cut out by a Hodge tensor, giving the comparison for all W. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 5.3.1, p. 56: the canonical isomorphism `p-dR V ≅ dR V` with tensor, Hecke, functoriality and canonical-model descent, of which the statement is the Hodge-type case. [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), proof of Theorem 3.2.12(2), pp. 38–39: the period isomorphism `µ⁻¹D_dR,log(L) ⊗ OB_dR,log ≅ L̂ ⊗ OB_dR,log` for de Rham L with unipotent geometric boundary monodromy. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.38 and Remark 4.4.39, p. 79: the isomorphism `W_p ⊗ OB_dR,log = W_dR ⊗ OB_dR,log` on `S^tor_{K,Σ}`, and in Hodge type, off the boundary, its identification with the abelian-variety comparison with Hodge tensors.

*Needs:* [7.29](#section-7-29); [7.24](#section-7-24); [7.22](#section-7-22); [7.26](#section-7-26); [7.25](#section-7-25); [1.1](#section-1-1); [1.3](#section-1-3); `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B3.general (general canonical extension); `AutomorphicBundles` B3.general (general boundary functoriality).

Applications include [7.31](#section-7-31)–[7.35](#section-7-35) (the two lattices, the lattice Hodge–Tate filtration, `P_HT` and the finite Levi comparison) and PerfectoidShimuraVarieties S6.

<a id="section-7-31"></a>

### 7.31 The two de Rham lattices of a canonical coefficient

Construct `TauCeti.LogAdic.TwoDeRhamLattices`. On the pro-Kummer-étale site of `S^tor_{K,Σ}`, for `W∈Rep(Gᶜ)` put `M:=Ŵ_p⊗_{Q_p}B_dR⁺` and `M⁰:=(W_dR⊗_{O}OB⁺_dR,log)^{∇=0}`. Both are B_dR⁺-local systems of rank dim W, and they are lattices in one B_dR-local system: `M⊗_{B_dR⁺}B_dR=Ŵ_p⊗B_dR` and `M⁰⊗_{B_dR⁺}B_dR=(W_dR⊗OB_dR,log)^{∇=0}`, identified by the horizontal sections of the canonical comparison isomorphism. Each lattice `L∈{M,M⁰}` defines the decreasing filtration Fil^iL:=Fil^iB_dR·L (=t^iL wherever t is defined), `i∈Z`, of this B_dR-local system; `Fil⁰M=M`, `Fil⁰M⁰=M⁰` and `M/Fil¹M=Ŵ_p⊗Ô`. Horizontal sections are taken before extracting the lattice filtration; the filtration of `M⁰` is its own t-adic one, not the Hodge filtration of `W_dR` (whose horizontal part is `Fil^jM`).

Canonical associated unipotent/de Rham full-group coefficient; sheafwise lattices in the same localized module.

`S^tor_{K,Σ} log` smooth with normal-crossings boundary, so the toric description of `OB⁺_dR,log` and the log Poincaré lemma apply.

On a log affinoid perfectoid above a toric chart, write `OB⁺_dR,log` as the formal power-series ring of the toric structural-period model. Solve the integrable coefficient connection coefficient by coefficient over this Q-algebra, starting from a basis at zero coordinates. Commuting partial equations and the formal recursion give a horizontal frame. Thus `M⁰` is a rank-dim W B_dR⁺-local system and its scalar extension to `OB⁺_dR,log` recovers `W_dR⊗OB⁺_dR,log`. This uses formal horizontal trivialization, not only exactness of the untwisted Poincaré complex.

Extend this horizontal frame through localization and the additional filtration completion defining `OB_dR,log`. The completed log Poincaré lemma identifies its horizontal scalar coefficients with `B_dR`. Hence `(W_dR⊗OB_dR,log)^{∇=0}=M⁰[1/t]`, while the canonical association identifies this horizontal local system with `Ŵ_p⊗B_dR`. No equality `OB_dR,log=OB⁺_dR,log[1/t]` is asserted (DLLZ-RH Remark 2.2.11).

Carry both lattice filtrations into the common ambient space and identify `M/Fil¹M` with `Ŵ_p⊗Ô` using `B_dR⁺/Fil¹=Ô`.

The interface consists of the following named results.

- `TauCeti.LogAdic.TwoDeRhamLattices`: The common localized module with M, `M⁰` and their specified filtrations.
- `TauCeti.LogAdic.TwoDeRhamLattices.common_localization`: Inverting t identifies both lattice localizations with the association’s period local system.
- `TauCeti.LogAdic.TwoDeRhamLattices.first_quotient`: `M/Fil¹M` identifies with `W_p⊗Ô`.
- `TauCeti.LogAdic.TwoDeRhamLattices.map`: A morphism of canonical coefficient representations carries both lattices and filtrations compatibly.
- `TauCeti.LogAdic.TwoDeRhamLattices.fil_eq`: `Fil^iM=Fil^iB_dR·M` and `Fil^iM⁰=Fil^iB_dR·M⁰` for all `i∈Z`; in particular `Fil^{i+1}L=t·Fil^iL` where t is defined.
- `TauCeti.LogAdic.TwoDeRhamLattices.horizontal_frame`: `M⁰⊗_{B_dR⁺}OB⁺_dR,log≅W_dR⊗_{O}OB⁺_dR,log` compatibly with connections.
- `TauCeti.LogAdic.TwoDeRhamLattices.tensor`: M and `M⁰` of `W⊗W′` and of `W^∨` are the tensor products and duals of those of W and W′, compatibly with their filtrations.

**Checks.**

- `TauCeti.LogAdic.TwoDeRhamLattices.unit`: For the trivial representation the two lattices agree with `B_dR⁺`.
- `TauCeti.LogAdic.TwoDeRhamLattices.relative_position`: For scalar rank-one lattices `M=Ae` and `M⁰=tᵃAe` in A[1/t]e, both localize to A[1/t]e, `Fil^iM⁰=t^{a+i}Ae=Fil^{a+i}M` for all `i∈Z`, and `M∩Fil^jM⁰=t^{max(0,a+j)}Ae`; for `a≠0` the lattices differ although their localizations agree.
- `TauCeti.LogAdic.TwoDeRhamLattices.horizontal_requirement`: The unrestricted module `W_dR⊗OB_dR,log⁺` is not itself `M⁰`; its horizontal kernel is required.
- `TauCeti.LogAdic.TwoDeRhamLattices.tate_line`: For a rank-one associated pair with `Ŵ_p≅Q_p(1)` and `W_dR=(O,d)` with `Gr^{−1}W_dR=W_dR`, one has `M⁰=Fil^{−1}B_dR·M=t⁻¹M`, whereas `Fil⁰` of the Hodge-induced filtration on `(W_dR⊗OB_dR,log)^{∇=0}` is M itself.
- The construction needs the relative position of two lattices; a single filtration of `W_dR` alone is insufficient.

[BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), Remark 4.4.39 and following text, p. 79: BPC25’s definition of the two lattices M and `M⁰` in a common B_dR-local system. BPC25 prints `M=W_p⊗B⁺_{dR,log}`; the sheaf meant is `B_dR⁺` (the surrounding text identifies M a B_dR⁺-local system), and the statement uses `B_dR⁺`. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), Remark 4.4.39 and following text, p. 79: The two filtrations `Fil^iM` and `Fil^iM⁰` are the ones determined by the two lattices; the statement defines them as `Fil^iB_dR·L`.

*Needs:* [7.30](#section-7-30); [7.13](#section-7-13); [7.8](#section-7-8); [7.12](#section-7-12); `PadicHodgeTheory` §§2.1–2.4 (poincare lemma and faltings extension). The horizontal frame for the coefficient connection is constructed here; §§2.7, 7.1–7.3:local-rational supplies the untwisted Poincaré lemma.

Applications include BPC25 Remark 4.4.39: Intersection images in the first-lattice quotient define the ascending HT filtration.

<a id="section-7-32"></a>

### 7.32 The lattice Hodge–Tate filtration

Construct `TauCeti.LogAdic.LatticeHTFiltration`. With M, `M⁰` and their lattice filtrations from [7.31](#section-7-31), define the ascending filtration `F_{−j}(Ŵ_p⊗Ô):=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰)`, equivalently the image of `M∩Fil^jM⁰` in `M/Fil¹M=Ŵ_p⊗Ô`. Each `F_i` is a locally direct-summand Ô-submodule, the filtration is of the type of the Hodge cocharacter, and with BPC25’s negative filtration indexing its graded pieces satisfy `Gr_j(Ŵ_p⊗Ô)(j)≃Gr^jW_dR⊗_{O}Ô`. Record the convention by the displayed `F_{−j}` formula, rather than silently replacing the ascending filtration by the de Rham one.

Two associated `B_dR⁺` lattices from the canonical coefficient comparison; intersections and quotients are sheafwise.

Use intersection submodules in the common `B_dR` space and project to `M/Fil¹M`.

Compute locally: the horizontal part of the j-th filtered piece of `W_dR⊗OB_dR,log` is `Fil^jM` by the filtered comparison and the filtered log Poincaré lemma, and the relative position of `M⁰` with respect to M has elementary divisors given by the jumps of the Hodge filtration; this gives local splitting and the ranks (the argument of Caraiani–Scholze §2.2 for the open case, to which BPC25 Remark 4.4.39 refers, run with `OB_dR,log`).

Apply the graded comparison and `gr^rB_dR≃Ô(r)` to identify each graded component with the specified Tate twist.

The interface consists of the following named results.

- `TauCeti.LogAdic.LatticeHTFiltration`: The image filtration with F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M).
- `TauCeti.LogAdic.LatticeHTFiltration.mem`: A quotient class lies in `F_{−j}` iff it has a lift belonging to `M∩Fil^jM⁰`.
- `TauCeti.LogAdic.LatticeHTFiltration.mono`: The image filtration is increasing in the HT index because `Fil^jM⁰` is decreasing.
- `TauCeti.LogAdic.LatticeHTFiltration.grade`: With the displayed BPC25 indexing, its graded identification has the Tate twist: `Gr_j(Ŵ_p⊗Ô)(j)≃Gr^jW_dR⊗Ô`.
- `TauCeti.LogAdic.LatticeHTFiltration.map`: Compatible maps of the two filtered lattices induce filtered quotient maps.
- `TauCeti.LogAdic.LatticeHTFiltration.locally_split`: Each `F_i` is a locally direct-summand Ô-submodule, `F_i=0` for i below the lowest Hodge jump and `F_i=Ŵ_p⊗Ô` from the highest jump on.

**Checks.**

- `TauCeti.LogAdic.LatticeHTFiltration.weight_zero`: For a weight-zero line, `F_i=0` for `i<0` and `F_i` is the full line for `i≥0`.
- `TauCeti.LogAdic.LatticeHTFiltration.lattice_shift`: For scalar t-adic filtration and `M⁰=t^aM` in rank one, `F_i` is zero for `i<a` and the full quotient for `i≥a`.
- `TauCeti.LogAdic.LatticeHTFiltration.correct_denominator`: The quotient kernel at `−j` is `Fil¹M∩Fil^jM⁰`, not all of `Fil¹M` when that is not contained in `Fil^jM⁰`.
- `TauCeti.LogAdic.LatticeHTFiltration.tate_line`: For the associated pair `Ŵ_p≅Q_p(1)`, `W_dR=(O,d)` with `Gr^{−1}W_dR=W_dR`, `F_{−2}=0` and `F_{−1}=Ô(1)`, so `Gr_{−1}(−1)≅Ô≅Gr^{−1}W_dR⊗Ô`; a convention with `F_j` in place of `F_{−j}` would put the jump at +1.
- `TauCeti.LogAdic.LatticeHTFiltration.siegel_h1`: On the open Siegel variety, for the pair `(H₁(A,Q_p),H_{1,dR}(A))` of the universal abelian scheme, `F_{−2}=0`, `F_{−1}=Lie(A)⊗Ô(1)` and `F₀=H₁(A,Q_p)⊗Ô`, recovering `0→Lie(A)⊗Ô(1)→H₁(A,Q_p)⊗Ô→ω_{A^t}⊗Ô→0 (BPC25 §4.4.8, p. 67)`.
- Increasing the ascending index enlarges F.
- For scalar t-adic filtration and a rank-one second lattice `M⁰=t^aM`, the ascending filtration jumps at a; translating this to named Tate weights requires the imported Layer 1 convention.

[BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 79: Introduces the displayed definition `Fil_{−j}(W_p⊗Ô)=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰)` that the statement states. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 79: The filtration is defined from the canonical comparison of §4.4.38 on `S^tor_{K,Σ}`; the relation `Gr_j(W_p⊗Ô)(j)=Gr^jW_dR⊗Ô` is displayed at the top of p. 80.

*Needs:* [7.31](#section-7-31); [7.30](#section-7-30); [7.13](#section-7-13); [1.2](#section-1-2); [2.11](#section-2-11); `CohomologyComparisons` §0.4 (twist frobenius filtration normalization).

Applications include PerfectoidShimuraVarieties S6: Imports the finite-level flag before trivializing the p-adic torsor on its tower; BPC25 Remark 4.4.39: The filtration defines `P_HT` and the Levi reduction.

<a id="section-7-33"></a>

### 7.33 Tensor and Hecke compatibility of the finite-level HT flag

Prove `TauCeti.LogAdic.canonical_ht_tensor`. For canonical full-group Gᶜ coefficients the lattice HT filtration is compatible with tensor products, duals, the unit representation and finite-level Hecke pullbacks: `F_i(W⊗W′)=∑_{a+b=i}F_a(W)⊗F_b(W′)`, `F_i(W^∨)=(F_{−i−1}(W))^⊥`, and for the unit `F_{−1}=0`, `F₀=Ô`. The functor `W↦(Ŵ_p⊗Ô,F_•)` is exact, its graded pieces are exact in W, and it is of type µ. This is the filtered fibre functor from which [7.34](#section-7-34) extracts the prescribed P^c_µ-reduction of the completed p-adic coefficient torsor.

Use canonical unipotent tensor association; this is not a tensor theorem for arbitrary log local systems.

Use the tensor-compatible association to compare the two filtered lattice systems: M and `M⁰` are tensor and dual compatible.

Check the lattice image filtration in locally split cocharacter coordinates; exactness of the graded pieces follows from the graded relation with `Gr^jW_dR`, which is exact in W.

Verify Hecke naturality from the Hecke equivariance of the comparison.

**Checks.**

- Tate lines of weights m,n tensor to the line of weight m+n.

[BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80: BPC25’s statement that the lattice HT filtration is Hecke functorial and tensor compatible, which the statement makes precise (sums over `a+b=i`, duals, unit, exactness).

*Needs:* [7.32](#section-7-32); [7.31](#section-7-31); [7.30](#section-7-30); [7.26](#section-7-26); `AutomorphicBundles` B2 (coefficient tensor hecke); [7.25](#section-7-25); [2.11](#section-2-11); `AutomorphicBundles` B0 (hodge parabolic convention).

<a id="section-7-34"></a>

### 7.34 The Hodge–Tate P^c_µ-reduction of the canonical p-adic torsor

Construct `TauCeti.LogAdic.HodgeTateReduction`. Over S^tor_{K,Σ} (K neat, smooth projective toroidal compactification with normal-crossings boundary, over a finite extension F of `Q_p` containing the reflex field and splitting G, with a cocharacter µ in the Hodge class defined over F), let `G_pet,p` be the pro-Kummer-étale Gᶜ(Q_p)-torsor of tensor isomorphisms `W⊗_{Q_p}Q̂_p≅Ŵ_p`, `W∈Rep_{Q_p}(Gᶜ)`, so that `G_pet,p×^{Gᶜ(Q_p)}W=Ŵ_p`. Extend `G^{c,an}` to the pro-Kummer-étale site by `U↦Gᶜ(Ô(U))` as in BPC25 §4.4.8. The subsheaf `P_HT⊆G_pet,p×^{Gᶜ(Q_p)}G^{c,an}` of tensor trivializations `W⊗Ô≅Ŵ_p⊗Ô` carrying the standard ascending filtration Fil_iW:=⊕_{w≥−i}W[µ-weight w] to the lattice HT filtration `F_i(Ŵ_p⊗Ô)` for all W is a P^{c,an}_µ-torsor, P^c_µ={g: lim_{t→0}Ad µ(t)g exists}. On the de Rham side the canonical-extension torsor `G^an_dR` (étale site) has the P^{std,c,an}_µ-reduction `P_dR` given by the Hodge filtration, P^{std,c}_µ={g: lim_{t→∞}Ad µ(t)g exists}. Both reductions are Hecke-equivariant and compatible with change of level.

The HT filtration is the tensor-compatible, exact, locally split filtration of type µ of [7.33](#section-7-33); arbitrary filtered local systems are not claimed to give parabolic reductions.

`G_pet,p` is defined from the coefficient functor `W↦Ŵ_p`, not from the toroidal level tower; its comparison with the tower’s deck group and its triviality over the tower diamond belong to PerfectoidShimuraVarieties S6 (BPC25 Theorem 4.4.40, §4.6.1).

`G_pet,p` is a torsor: locally on the pro-Kummer-étale site the coefficient functor `W↦Ŵ_p` is tensor-isomorphic to the constant one, since it comes from Gᶜ(Q_p)-representations through the canonical coefficient construction.

An exact tensor filtration of type µ of a fibre functor is locally splittable, so `P_HT` is locally nonempty; it is a torsor under the stabilizer of the µ-filtration, which is `P^c_µ` (Tannakian extraction, imported convention).

For a faithful W the stabilizer of `Fil_•W` in Gᶜ is `P^c_µ`, so membership in `P_HT` may be tested on one faithful representation.

Hecke equivariance and level change follow from those of the comparison, the lattices and the filtration; the de Rham reduction is imported.

The interface consists of the following named results.

- `TauCeti.LogAdic.HodgeTateReduction`: The pair `(G_pet,p, P_HT)` on the pro-Kummer-étale site of `S^tor_{K,Σ}`, with the imported de Rham reduction `P_dR`.
- `TauCeti.LogAdic.HodgeTateReduction.torsor_assoc`: `G_pet,p×^{Gᶜ(Q_p)}W≅Ŵ_p` naturally and tensor-compatibly in W.
- `TauCeti.LogAdic.HodgeTateReduction.mem`: A local trivialization lies in `P_HT` iff it carries `Fil_•W⊗Ô` to `F_•(Ŵ_p⊗Ô)` for one (equivalently every) faithful W.
- `TauCeti.LogAdic.HodgeTateReduction.isTorsor`: `P_HT` is locally nonempty and simply transitive under `P^{c,an}_µ`.
- `TauCeti.LogAdic.HodgeTateReduction.levi`: `P_HT×^{P^{c,an}_µ}M^{c,an}_µ` is `M_HT^an`, the Levi torsor of [7.35](#section-7-35); similarly `P_dR` gives `M_dR^an`.
- `TauCeti.LogAdic.HodgeTateReduction.hecke`: Hecke pullbacks and change of level carry `(G_pet,p,P_HT)` and `P_dR` to the corresponding objects.
- `TauCeti.LogAdic.HodgeTateReduction.open_restriction`: Restricted to the pro-étale site of `S_K`, `P_HT` is the reduction defined by the same filtration of the interior local systems.

**Checks.**

- `TauCeti.LogAdic.HodgeTateReduction.torus`: If Gᶜ is a torus (µ central), `P^c_µ=Gᶜ` and `P_HT` is the whole pushed-out torsor.
- `TauCeti.LogAdic.HodgeTateReduction.siegel`: On the open Siegel variety `P_HT` is the torsor of similitude trivializations of `H₁(A,Q_p)⊗Ô` carrying the µ-weight-one Lagrangian of `Q_p^{2g}` (which is `Fil_{−1}`) to Lie(A)⊗Ô(1) (BPC25 §4.4.8, with W the standard representation realized as `H₁(A,Q_p)`).
- `TauCeti.LogAdic.HodgeTateReduction.stabilizer_faithful`: For a faithful W the stabilizer in Gᶜ of the ascending filtration `Fil_•W` is `P^c_µ`, not `P^{std,c}_µ`; the latter stabilizes the Hodge filtration of `W_dR`.
- `P_HT` has structure group `P^c_µ` and `P_dR` has structure group `P^{std,c}_µ`; they are opposite parabolics with common Levi `M^c_µ`.
- No statement about the toroidal tower, its diamond or v-descent is made here.

[BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80: BPC25’s finite-level torsor `G_pet,p` over `S^tor_{K,Σ}`, whose P^c_µ-reduction `P_HT` (“corresponding to the filtration on `W_p⊗Ô”`) and de Rham P^{std,c}_µ-reduction `P_dR` are defined in the same paragraph. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80: The defining property of `P_HT` stated by the statement (layout text of the PDF). [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.8, p. 68: In the Siegel case BPC25 define `P_HT` as the trivializations of `H₁(A,Q_p)⊗Ô` respecting the HT filtration, which is the statement’s membership description for a faithful representation. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.0, p. 49: Conventions `P^std_µ` (limit `t→∞`) and `P_µ` (limit `t→0`) used for `P_dR` and `P_HT`.

*Needs:* [7.33](#section-7-33); [7.32](#section-7-32); [7.29](#section-7-29); `AutomorphicBundles` B0 (central split quotient); `AutomorphicBundles` B0 (hodge parabolic convention); `AutomorphicBundles` B1 (filtration reduction); `AutomorphicBundles` B3.general (general canonical extension); [2.9](#section-2-9); [2.11](#section-2-11).

Applications include PerfectoidShimuraVarieties S6 (kummer to v bridge): Evaluates `P_HT` on perfectoid test objects over the toroidal tower diamond; BPC25 text after Remark 4.4.39: `M_HT^an:=P_HT×^{P^{c,an}_µ}M^{c,an}_µ`; OverconvergentAutomorphicForms O8: Uses the opposite parabolic conventions for the HT and de Rham reductions.

<a id="section-7-35"></a>

### 7.35 Finite-level cyclotomic Levi-torsor comparison

Construct `TauCeti.LogAdic.FiniteLeviComparison`. Let `P_dR⊆G_dR^an` be the P^{std,c,an}_µ-reduction of the canonical-extension de Rham torsor given by the Hodge filtration (étale site of `S^tor_{K,Σ}`) and `P_HT` the P^{c,an}_µ-reduction of `G_pet,p×^{Gᶜ(Q_p)}G^{c,an}` given by the lattice HT filtration (pro-Kummer-étale site), where P^{std}_µ={g: lim_{t→∞}Ad µ(t)g exists} and P_µ={g: lim_{t→0}Ad µ(t)g exists} have common Levi `M_µ`. Put `M_dR^an:=P_dR×^{P^{std,c,an}_µ}M^{c,an}_µ` and `M_HT^an:=P_HT×^{P^{c,an}_µ}M^{c,an}_µ`. There is a canonical isomorphism of M^{c,an}_µ-torsors `M_HT^an≃M_dR^an×^{µ,Z_p^×}Z_p(1)` on the pro-Kummer-étale site of `S^tor_{K,Σ}`, compatible with the Hecke action, where `Z_p(1)` is the pro-étale Z_p^×-torsor of generators and `µ:Z_p^×→M^{c,an}_µ` is central. Hence a cyclotomic twist of `M_HT^an` is defined on the étale site. An untwisted equality requires an explicit cyclotomic trivialization.

The central cocharacter µ acts on the common Levi; the de Rham and HT parabolic conventions are distinguished (`P^{std,c}_µ` stabilizes the Hodge filtration, `P^c_µ` the ascending HT filtration).

BPC25 states the identification “on the pro-étale site”; the statement states it on the pro-Kummer-étale site of `S^tor_{K,Σ}`, where `P_HT` and the graded relation live.

Import canonical de Rham torsor and flag conventions from `AutomorphicBundles` (canonical extension, P^{std,c}_µ-reduction by the Hodge filtration).

Take the HT torsor and its P^c_µ-reduction from [7.34](#section-7-34).

Use the graded comparison `Gr_j(Ŵ_p⊗Ô)≃Gr^jW_dR⊗Ô(−j)`, tensor-compatibly in W, to identify the two Levi fibre functors after twisting the µ-weight w part by `Z_p(1)^{⊗w}`; this is the central cyclotomic contracted product. Check descent and Hecke coherence.

The interface consists of the following named results.

- `TauCeti.LogAdic.FiniteLeviComparison`: The finite-level comparison of Levi torsors with the µ-contracted cyclotomic torsor.
- `TauCeti.LogAdic.FiniteLeviComparison.central_twist`: The twisting action is through the central cocharacter `µ:Z_p×→M_µᶜ`.
- `TauCeti.LogAdic.FiniteLeviComparison.hecke`: The comparison commutes with finite-level Hecke pullbacks.
- `TauCeti.LogAdic.FiniteLeviComparison.trivialization`: Choosing a compatible generator of `Z_p(1)` identifies the contracted product with `M_dR`; changing that generator acts through µ.
- `TauCeti.LogAdic.FiniteLeviComparison.assoc_bundle`: For an M^c_µ-representation V on which µ(z) acts by `z^w`, `M_HT^an×^{M^c_µ}V≅(M_dR^an×^{M^c_µ}V)⊗Ô(w)`, compatibly with tensor products and duals.

**Checks.**

- `TauCeti.LogAdic.FiniteLeviComparison.weight_zero`: For central weight zero the cyclotomic twist is trivial.
- `TauCeti.LogAdic.FiniteLeviComparison.weight_one`: On a central weight-one character the contracted product is the associated Tate line, not an untwisted line with the same Galois action.
- `TauCeti.LogAdic.FiniteLeviComparison.change_generator`: Replacing a cyclotomic generator by u times it changes the trivialized comparison by µ(u); there is no generator-independent untwisted equality.
- `TauCeti.LogAdic.FiniteLeviComparison.graded_compatibility`: For `W∈Rep(Gᶜ)`, the isomorphism induced on associated graded bundles is `Gr_j(Ŵ_p⊗Ô)≅Gr^jW_dR⊗Ô(−j)`, the graded relation of [7.32](#section-7-32); the twist by `µ⁻¹` instead of µ would give `Ô(j)`.
- The result exported to S6 includes the central cyclotomic twist; it does not construct the tower map.

[BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80: Introduces the displayed identification `M_HT^an=M_dR^an×^{µ,Z_p^×}Z_p(1)`, compatible with Hecke, which is this statement. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80: The Hecke compatibility and the étale-site descent of the twisted torsor stated here. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.8, p. 68: Definition of the contracted product `M_dR×^{µ,Z_p^×}Z_p(1)` through the central cocharacter µ, used by the statement (Siegel case; §4.4.23, p. 74, repeats it for Hodge type). [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.0, p. 49: BPC25’s conventions `P^std_µ` (limit `t→∞`) and `P_µ` (limit `t→0`) with common Levi `M_µ`, which the statement records.

*Needs:* [7.34](#section-7-34); [7.33](#section-7-33); [7.30](#section-7-30); `AutomorphicBundles` B0 (hodge parabolic convention); `AutomorphicBundles` B3.general (general canonical extension); [2.9](#section-2-9); [2.10](#section-2-10).

Applications include PerfectoidShimuraVarieties S6; BPC25 Theorem 4.4.40: The tower trivialization pulls back this finite-level Levi comparison, including its twist; OverconvergentAutomorphicForms O8 toroidal coefficient instance: Imports `M_HT=M_dR×^{µ,Z_p^×}Z_p(1)` with its tensor/dual compatibility over the toroidal boundary.

<a id="section-7-36"></a>

### 7.36 Agreement with the open-tower construction of Layer 2

Prove `TauCeti.LogAdic.hodge_type_comparison_agreement`. Let (G, X) be of Hodge type as in [7.29](#section-7-29), with V₀ realized by `H₁(A) = (R¹f_*)^∨` as in BPC25 §4.4.8 and `AutomorphicBundles` B1 (hodge tensor realizations) (DLLZ-RH (5.5.2) use the contragredient normalization `V₀ ↦ R¹f_*`; the argument applies to the dual realizations). On the open Shimura variety `S_K`: the period isomorphism of [7.30](#section-7-30) restricts to the abelian-scheme comparison with Hodge tensors of 1.1–1.3 (Caraiani–Scholze §§2.2–2.3); hence the two lattices M and `M⁰` of [7.31](#section-7-31), the lattice Hodge–Tate filtration of [7.32](#section-7-32), the P^c_µ-reduction `P_HT` of [7.34](#section-7-34) and the finite-level Levi comparison of [7.35](#section-7-35) restrict on `S_K` to the relative Hodge–Tate filtration of 2.6, the parabolic reduction `𝒫_HT` of 2.9 and the cyclotomic Levi comparison of 2.10.

Hodge type with a fixed Siegel embedding and neat K; the statement is on the open Shimura variety `S_K` only (BPC25 Remark 4.4.39, p. 79). Across the boundary the canonical extension is characterized by nilpotent residues, not by an abelian-scheme comparison.

By construction ([7.30](#section-7-30) (1)) the de Rham comparison on `S_K` is the relative comparison of `A^m` with Hodge tensors; the period isomorphism is `µ⁻¹D_dR` of it tensored up, so M and `M⁰` on `S_K` are the two horizontal lattices of 1.1. The lattice filtration of `M/Fil¹M` is then the filtration of CS17 Proposition 2.2.3 and Corollary 2.2.4 (1.2), whose degree-one quotient is 2.6's sequence; `P_HT` and `𝒫_HT` are both the stabilizer reductions of this filtration in a faithful representation, and the Levi comparisons are both induced by the graded comparison contracted with the Tate-basis torsor.

**Checks.**

- For the modular curve, `M/Fil¹M = T_pE ⊗ Ô` with lattice filtration `0 ⊂ ω^{−1} ⊗ Ô(1) ⊂ T_pE ⊗ Ô` on `S_K`, the sequence of 2.6.
- The agreement is proved on the open Shimura variety; across the boundary only the nilpotent-residue characterization applies.

[BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), Remark 4.4.39, p. 79: in Hodge type, off the boundary, the comparison is the abelian-variety one with Hodge tensors, with the consequences for the Hodge–Tate filtration and `P_HT`. [CS17](https://arxiv.org/abs/1511.02418), §2.2, Proposition 2.2.3 and Corollary 2.2.4, PDF pp. 14–15: the Hodge–Tate filtration of an abelian family from the two horizontal lattices.

*Needs:* [7.30](#section-7-30); [7.31](#section-7-31); [7.32](#section-7-32); [7.34](#section-7-34); [7.35](#section-7-35); [1.2](#section-1-2); [2.6](#section-2-6); [2.9](#section-2-9); [2.10](#section-2-10); `AutomorphicBundles` B1 (hodge tensor realizations).

Applications include PerfectoidShimuraVarieties S6 (identifies `π^tor_HT` on the open subdiamond with the Hodge-type period map of S3) and BPC25 Remark 4.4.39.

### Examples

A proper log-smooth toric compactification has the almost primitive comparison; a nonproper affine space does not inherit its finiteness conclusion. A normalized rank-one residue 3/4 tensor itself reduces to 1/2 modulo integers, exposing the need for unipotent monodromy in unrestricted tensor comparison. The two-lattice construction gives the Tate twist on a one-dimensional coefficient. The detailed computations and negative controls are included with the definitions above.

### Dependencies

Layer 1; Layer 2; Layer 6; `PerfectoidSpaces` P0; `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3; `DiamondsAndVStacks` D0; `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; AdicSpacesPartIV R4; `DiamondEtaleCohomology` C5; `DiamondEtaleCohomology` C7; `AdicSpacesPartII` R0; `CohomologyComparisons` §6.1; `PadicHodgeTheory` §§0.2–0.3; AdicSpacesPartIII R3; `AutomorphicBundles` B1; `AutomorphicBundles` B2; `AutomorphicBundles` B2.general; `AutomorphicBundles` B3.general; `ShimuraCompactifications` C2; `CohomologyComparisons` §0.4; `AutomorphicBundles` B0. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Layer 8: Canonical local systems of Hodge-type data and logarithmic comparison

Layer 8 exports the finite-level canonical comparison package for Shimura data of Hodge type that PerfectoidShimuraVarieties S6 assembles into the toroidal-tower Hodge–Tate morphism of Boxer–Pilloni Theorem 4.4.40.

<a id="section-8-1"></a>

### 8.1 Finite-level canonical comparison package

Assemble `TauCeti.LogAdic.finite_level_canonical_package`. For every neat Shimura datum of Hodge type and smooth projective toroidal model `S^tor_{K,Σ}`, the canonical coefficient tensor functors are associated through completed logarithmic periods on the pro-Kummer-étale site. They yield the ascending Hodge–Tate flag, its P^c_µ-reduction `P_HT` and the cyclotomic Levi comparison `M_HT≅M_dR×^{µ,Z_p^×}Z_p(1)` at finite level, Hecke-compatibly, and they agree on the open Shimura variety with the constructions of Layer 2 from the universal abelian scheme and its Hodge tensors. Export the full package to PerfectoidShimuraVarieties S6, which owns the toroidal-tower diamond Hodge–Tate map and coefficient pullback (BPC25 Theorem 4.4.40). The log primitive comparison of [7.3](#section-7-3) is available separately to completed and coherent cohomology consumers.

It assumes no toroidal diamond is a perfectoid space.

Assemble the canonical association, flag tensor compatibility, the P^c_µ-reduction, the finite Levi comparison and the Hodge-type agreement.

Name the S6 interface with the central twist and the smooth/SNC hypotheses preserved.

The site-only and primitive-comparison exports do not depend on the canonical comparison.

**Checks.**

- S6 imports the finite-level package; there is no reverse prerequisite S6→Layer 8.

[BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.38, p. 79: Opens the finite-level passage (§4.4.38–Remark 4.4.39 and the text before Theorem 4.4.40) that the package assembles for Hodge-type data. [BPC25](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), text before Theorem 4.4.40, p. 80: Ownership boundary: from this sentence on (diamond limit, Theorem 4.4.40) the material belongs to PerfectoidShimuraVarieties S6; the package asserts nothing about the tower.

*Needs:* [7.30](#section-7-30); [7.35](#section-7-35); [7.33](#section-7-33); [7.34](#section-7-34); [7.36](#section-7-36); [7.3](#section-7-3).

### Examples

On the open variety, the canonical filtration is the universal abelian-scheme construction of Layer 2. The finite-level package supplies its twisted Levi torsor before any assertion of perfectoid representability. The detailed computations and negative controls are included with the definitions above.

### Dependencies

Layer 7. The Mathlib and Tau Ceti declarations are named in each subsection and in the supplier boundary.

## Downstream consumers

PerfectoidShimuraVarieties S0–S6 consumes the tower, the open Hodge–Tate morphism and the finite canonical coefficient package for Shimura data of Hodge type. OverconvergentAutomorphicForms O2–O8 uses the canonical domains, coordinates, integral lattices and AIP torsor; its O5 owns coefficient sheaves and their comparison. IgusaVarietiesAndTorsionConcentration IG.3 studies period-map fibres. TorsionCohomologyInfrastructure TC.2 and HigherHidaAndColemanTheory use the proper logarithmic primitive comparison.

## References

Locators refer to the versions named here, identified by SHA-256, and not to the different pagination of published versions where these differ.

- **FAR10.** Laurent Fargues, [*La filtration de Harder–Narasimhan des schémas en groupes finis et plats*](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf). J. reine angew. Math. 645 (2010), 1–39; author copy HNgp.pdf (29 pp.), whose page numbers differ from Crelle's. SHA-256 67b58427c00ea67b20bd8e9f7fcd0d90b50b4f0965e90cd95ad2324265c7637a.
- **FAR11.** Laurent Fargues, [*La filtration canonique des points de torsion des groupes p-divisibles (avec la collaboration de Yichao Tian)*](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf). Ann. Sci. ÉNS 44 (2011), 905–961; author copy canoniqueHN.pdf dated 20 October 2011 (46 pp.). SHA-256 2424f3b23fa138b44dbf98cbad50db8be4944c6640514084fc0fb26e2a65ccd4.
- **SCH15.** Peter Scholze, [*On torsion in the cohomology of locally symmetric varieties*](https://arxiv.org/abs/1306.2070). arXiv:1306.2070v2 (2 June 2015); published Ann. of Math. 182 (2015), 945–1066 (numbering `III.x.y = 3.x.y`). SHA-256 `e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285`.
- **SCH13.** Peter Scholze, [*p-adic Hodge theory for rigid-analytic varieties*](https://arxiv.org/abs/1205.3463). arXiv:1205.3463v2; published Forum Math. Pi 1 (2013), e1. SHA-256 `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959`.
- **BHW.** Christopher Birkbeck, Ben Heuer, Chris Williams, [*Overconvergent Hilbert modular forms via perfectoid modular varieties*](https://arxiv.org/abs/1902.03985). arXiv:1902.03985v4 (10 May 2021); published Ann. Inst. Fourier 73 (2023), 1709–1794 (§5/§7 statements collated with the published version). SHA-256 8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac.
- **PIL20.** Vincent Pilloni, [*Higher coherent cohomology and p-adic modular forms of singular weights*](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), 1647–1807; author copy complexhidatheorygsp4.pdf (113 pp.). SHA-256 4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58.
- **PS16.** Vincent Pilloni, Benoît Stroh, [*Cohomologie cohérente et représentations galoisiennes*](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf). Ann. Math. Québec 40 (2016), 167–202; author copy koko.pdf (31 pp.), numbered differently from the published version. SHA-256 2c9f90c39f0efacd3fa076ef189b1d552da900d1968e34c3c8b3e551dcb4e3a1.
- **BP26.** George Boxer, Vincent Pilloni, [*Higher Hida theory for Siegel modular forms*](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Invent. Math. (2026); author copy higherhidaSiegel.pdf (65 pp.). SHA-256 `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.
- **BCGP21.** George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://arxiv.org/abs/1812.09269). arXiv:1812.09269v3 (28 Nov 2021); published Publ. Math. IHÉS 134 (2021). SHA-256 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed.
- **CS17.** Ana Caraiani, Peter Scholze, [*On the generic part of the cohomology of compact unitary Shimura varieties*](https://arxiv.org/abs/1511.02418). arXiv:1511.02418v1 (8 Nov 2015); published Ann. of Math. 186 (2017), Proposition 2.3.9 collated at pp.673–674. SHA-256 `aa93df3947e57ab78b070a82d638e70c25ae2ae15aeb60346575e74fdf85b349`.
- **SW13.** Peter Scholze, Jared Weinstein, [*Moduli of p-divisible groups*](https://arxiv.org/abs/1211.6357). arXiv:1211.6357v2 (13 Apr 2013); Camb. J. Math. 1 (2013). SHA-256 984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d.
- **AIPH.** Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [*The adic, cuspidal, Hilbert eigenvarieties*](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf). Res. Math. Sci. 3 (2016); author copy Hilbert_adicfinal.pdf dated 16 May 2016 (40 pp.). SHA-256 34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd.
- **AIP15.** Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [*p-adic families of Siegel modular cuspforms*](https://arxiv.org/abs/1212.3812). arXiv:1212.3812v1 (16 Dec 2012); published Ann. of Math. 181 (2015), 623–697. SHA-256 546120d2dcbf50bc86a3b980602728c9dcebd90cc2b08528df4415ec2f7ea851.
- **HALO.** Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [*Le halo spectral*](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf). Author copy Halo_spectral.pdf; Appendix A. SHA-256 154459bdefa0e91b5a103ba5a78d81bcced20e67d8bb9a0fb737de22494bee27.
- **CDM12.** Peter Scholze, [*Perfectoid spaces: a survey*](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf). Current author copy of the 2012 Current Developments in Mathematics survey. SHA-256 85a0b85e13163d8953c25d521c7f568afcc2a67c8f192228a8608f533b5f11eb.
- **ZIE.** Paul Ziegler, [*Graded and filtered fiber functors on Tannakian categories*](https://arxiv.org/pdf/1111.1981v2). arXiv:1111.1981v2. SHA-256 7e553f590404cd31f92bf528d925755043ad4e2bb009e058a6ca39ab8d39ed40.
- **BPC25.** George Boxer, Vincent Pilloni, [*Higher Coleman theory*](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). Author revised manuscript dated 3 March 2025, HigherColeman.pdf (180 pp.); locators refer to this version. SHA-256 `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.
- **DLLZ-adic.** Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, [*Logarithmic adic spaces: some foundational results*](https://www.kwlan.org/articles/log-adic.pdf). Public author copy, 100 pages; arXiv:1912.09836v2 final-version record (2022-10-30); published chapter `DOI 10.1007/978-3-031-21550-6_3 (2022)`. SHA-256 209e59836048eabbbf9735012a38c7c393fb2a30f69ce50ffac7e83b37ee1105.
- **DLLZ-RH.** Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, [*Logarithmic Riemann–Hilbert correspondences for rigid varieties*](https://www.kwlan.org/articles/log-RH.pdf). Public author copy, 80 pages; J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1002. SHA-256 `dccd18f6605380a92e6fa9e2143547b7cfa12ddb01b08ff5af0e083818539d04`.
- **MILNE-SV.** J. S. Milne, [*Introduction to Shimura varieties*](https://www.jmilne.org/math/xnotes/svi.pdf). Notes dated 23 October 2004, revised 16 September 2017 (numbering as in Harmonic analysis, the trace formula, and Shimura varieties, Clay Math. Proc. 4, 2005); printed page `= PDF` page. SHA-256 `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`.
- **ECD.** Peter Scholze, [*Étale cohomology of diamonds*](https://arxiv.org/abs/1709.07343v4). arXiv:1709.07343v4; printed page `= PDF` page. SHA-256 78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc.

BPC25 and BP26 are different papers of Boxer and Pilloni: BPC25 is *Higher Coleman theory* and BP26 is *Higher Hida theory for Siegel modular forms*.

Related published versions and model references:

- [Published AIF 73 (2023), 1709–1794; §5 and §7.](https://www.numdam.org/item/10.5802/aif.3560.pdf) (published, SHA-256 `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4`)
- [Published Annals 182 (2015), 945–1066; §III.3.](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf) (published, SHA-256 `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16`)
- [Kai-Wen Lan, Integral models of toroidal compactifications with projective cone decompositions, IMRN 2017, no. 11, 3237–3280, doi:10.1093/imrn/rnw123; author compilation incorporates known errata. Definition 8.5 and Theorems 8.6–8.7.](https://www.kwlan.org/articles/cpt-ram-nbl.pdf) (author copy, SHA-256 `ff2229d32fc6dd99174d8ff392ebdf6c93c3a455118bd7d54f54a74a967d31ac`)
- [Integral models of toroidal compactifications with projective cone decompositions — Errata; author errata linked from Lan’s academic page. Item (3) adds the dimension-one boundary exception to Theorem 8.7.](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf) (author errata, SHA-256 `e0ecf94c74332660867965dc9877836ef97f2a03161c53b5f0ff1a1a7f616b04`)
- [Caraiani–Scholze, Annals 186 (2017), 649–766; Proposition 2.3.9 and proof, pp.673–674 (published formulation)](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) (published version, SHA-256 4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a)

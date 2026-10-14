# Roadmap: enhanced derived categories of sheaves

**Summary.** An ordinary derived category remembers cohomology, shifts and distinguished triangles, but not the homotopies between maps or the coherences among them. Descent along hypercovers, inverse limits of complexes, Kan extensions along diagrams of topoi, adjoints of colimit-preserving functors and the reconstruction of adic coefficient systems all need that higher structure. This roadmap gives unbounded derived categories of sheaves of modules a concrete enhancement, the dg nerve of a K-injective model inside Mathlib's quasicategories, proves that its homotopy category is Mathlib's `DerivedCategory`, and builds in it the operations later roadmaps use: derived tensor products and internal Hom on ringed sites, pullback and pushforward, Koszul complexes, coherent inverse limits and Postnikov completion on replete topoi, hypercover descent, coherent Kan extensions and adjoints, accessible localizations, derived completion and the reconstruction of complete complexes from their reductions modulo powers of a regular ideal, together with the commutative algebra of regular rings and perfect 𝔽_p-algebras that descent on perfect schemes needs (global dimension, Kunz's theorem, Tor independence). It then supplies the shared higher algebra: symmetric monoidal ∞-categories and ∞-operads, algebras and modules, monoidal localizations, Verdier quotients, Barr–Beck–Lurie, descendable algebras and module descent (with h-descent for perfect schemes as the main application), Ind-completion, presentable, dualizable and rigid categories, the ∞-category of spectra, animated commutative rings, Frobenius on animated 𝔽_p-algebras, and the cotangent complex. Every comparison with an ordinary category is a theorem about mapping spaces, never a definition by passage to the homotopy category. The main sources are Lurie's *Higher Topos Theory* and *Higher Algebra*, Bhatt–Scholze's *The pro-étale topology for schemes* (§3) and *Projectivity of the Witt vector affine Grassmannian* (§§3, 6 and 11), Liu–Zheng's *Enhanced six operations*, Nikolaus–Scholze's *On topological cyclic homology* (Appendix A and §I.3), Mathew's *The Galois group of a stable homotopy theory* (§3), and the Stacks Project.

## Scope and ownership

This roadmap owns the generic enhanced sheaf theory and the abstract higher-categorical algebra on which the étale, diamond, prismatic, K-theoretic and Langlands roadmaps build. It owns:

- quasicategorical foundations beyond Mathlib's: joins, slices and right mapping spaces, categorical equivalences detected on mapping spaces, functor quasicategories, cores, Dwyer–Kan localizations, limits and colimits, final maps, stability, Cat∞ and Spaces, coCartesian fibrations and straightening, cardinal filteredness, accessibility and presentability (Layer E0);
- the dg nerve and its comparison with Mathlib's cochain shift, mapping cone and pretriangulated structure (Layer E0);
- the enhanced unbounded derived category D∞(O) of a small ringed site, K-injective and K-flat replacement, presentability, derived tensor product and internal Hom, ringed pullback and pushforward, coefficient change, Koszul complexes, the global dimension of regular rings and Kunz's theorem, the algebra of perfect 𝔽_p-algebras, the enhanced quasicoherent derived sheaves and derived base change on perfect schemes (Layer E1);
- Kan extensions, finality, representability, the adjoint functor theorem, localizations, limits of presentable categories, compact generation, ringed diagrams and coherent mates (Layer E3);
- derived limits of towers, pro-zero towers and multiplicative derived-limit filtrations (Layer E2:towers), the inverse-limit theory of replete topoi (slices and covers, relative epimorphisms, countable products, the amplitude of Rlim, the Milnor sequence and pro-zero errors), Postnikov completion and convergence, exact sections over projective objects and locally weakly contractible topoi, hypercover descent, sheaves of spaces, and h-descent on perfect schemes with the descendability results for schemes that it needs (Layer E2);
- derived completion of sheaves, the completed tensor product, Koszul models, regular ideals and coefficient-system reconstruction (Layer E4); its point-topos case is the generic derived completion of complexes of modules, which DerivedDeRhamCohomology and the other completion consumers import from here;
- symmetric monoidal ∞-categories, operads, algebras, modules, monoidal localizations, idempotent completion, Verdier quotients and Barr–Beck–Lurie (Layer E5:abstract); presentable categories, Ind, spectra, the tensor product of presentable categories, group actions, dualizable and rigid categories (Layer E5:presentability); descendable algebras and module descent (Layer E5:descent); animation, animated rings, Frobenius and Witt vectors on animated 𝔽_p-algebras (Layer E5:animation); the cotangent complex and its properties, and the comparison of animated rings with commutative algebra objects (Layer E5:cotangent-export); Eilenberg–Mac Lane rings and the module comparison (Layer E5:spectra-comparison).

The boundaries are as follows.

- `TauCetiRoadmap.DGAInfinity` owns graded signs and the Koszul braiding (Layer 0), dg algebras, dg categories, their Z⁰ and H⁰ categories and dg functors (Layer 1), and the dg-categorical derived Morita theory, perfect envelopes and quotients of its later layers. This roadmap uses Layers 0 and 1 and adds only the dg nerve, its homotopy-coherent comparison and the dg description of complexes of module sheaves. The current Tau Ceti library implements part of Layer 1 (`TauCeti.DGCategory`, `TauCeti.dgHomComplex`, `TauCeti.DGHomotopyCategory`, `CategoryTheory.EnrichedFunctor.mapDGHomotopyCategory`); those declarations are used, not redefined.
- Weakly contractible objects of a topos (BS-proet Definition 3.2.1, p. 17) use Mathlib's `CategoryTheory.Projective`. In a topos this is exactly the condition that every epimorphism onto the object splits: projectivity splits such a map by lifting the identity, and the converse follows by pulling back an arbitrary epimorphism along a map out of the object. The one-point set and every set are projective by choice; for a nontrivial finite group G the terminal G-set is not, since G → 1 has no equivariant section. Section E2.5 adds exactness of sections on abelian sheaves and the coherent covering condition for a locally weakly contractible topos.
- `TauCetiRoadmap.StablePeriodicCurved` owns Frobenius exact categories and ordinary triangulated stable categories; the stable ∞-categories, idempotent completions and Verdier quotients here are their higher analogues and do not replace them.
- `TauCetiRoadmap.ProfiniteCohomology` owns discrete modules over profinite groups and continuous cohomology (Layers 0 and 10); Section E5:presentability.3 uses them unchanged.
- The current Tau Ceti library has extension by zero for presheaves on preorders and for open subsets in abelian sheaves (`TauCeti.CategoryTheory.PresheafExtensionByZero.functor`, `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback`); the slice-free modules of Section E1.1 are the extension by zero of the structure sheaf along an arbitrary object of a ringed site, which that library does not cover. Mathlib has their presheaf version (`PresheafOfModules.freeYoneda`, with `PresheafOfModules.freeYonedaEquiv` and `PresheafOfModules.freeYoneda.isSeparating`); the sheaf version is built here by sheafification. The current Tau Ceti library also makes the sheaves of modules over a sheaf of commutative rings on a small site a closed symmetric monoidal category (`TauCeti.SheafOfModules.monoidalCategory`, `TauCeti.SheafOfModules.symmetricCategory` and `TauCeti.SheafOfModules.monoidalClosed`, in `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Monoidal.lean` and `Closed.lean`); the ordinary tensor product and internal Hom of module sheaves under `IsKFlat`, `derivedTensor` and `derivedInternalHom` are these, and the tensor product of complexes is Mathlib's `HomologicalComplex.monoidalCategory` over it.
- `DiamondsAndVStacks` (Layer D0) owns quasicompact and quasiseparated objects of a topos and algebraic topoi (D0.17), and the comparison of cohomology with filtered colimits of abelian sheaves on the qcqs objects of an algebraic topos (D0.18, the algebraic-topos case of `TauCetiRoadmap.SchemeAndStackFoundations` §2.5).
- `TauCetiRoadmap.SchemeAndStackFoundations` owns schemes and quasicoherent modules, perfect schemes, the colimit perfection and perfectly finitely presented and perfectly proper maps (Layer 0, §§0.24–0.25); higher direct images on sites and the Leray and Čech-to-cohomology spectral sequences (§§2.1–2.2), cohomology commuting with filtered colimits (§2.5), quasicoherent higher direct images with flat base change (§2.6, `qcoh_higherDirectImages`); depth and Cohen–Macaulay modules (§0.17); and generic flatness, flattening by blowing up and regular schemes (§§4.12–4.13). Its §2.17 owns the repleteness predicate `IsReplete` (BS-proet Definition 3.1.1) with `IsReplete.lim_epi`, `IsReplete.derived_limits` (lim = Rlim for a tower of abelian sheaves with epimorphic transitions, BS-proet Proposition 3.1.10), `IsReplete.derivedCategory_leftComplete` (K ≅ Rlim τ^{≥−n} K for every K in Mathlib's `DerivedCategory`, BS-proet Proposition 3.3.3), `isReplete_of_locallyWeaklyContractible` (BS-proet Proposition 3.2.3(1)) and the pro-étale case of compact generation by weakly contractible objects. Its §2.18 owns `DQCoh X` inside Mathlib's `DerivedCategory X.Modules`, with `DQCoh.affineEquiv` and `DQCoh.restrict`, the derived tensor product, internal Hom, pullback and pushforward of a scheme on that triangulated category, and Tor-independent base change (`torIndependent_baseChange`). All of these are used here unchanged; the targets of this roadmap in the same direction are their refinements to the enhancement D∞ on arbitrary small ringed sites and topoi, and the results those sections do not state.
- `TauCetiRoadmap.JacobianChallenge` (Layer C) owns the coherence of the higher direct images of a coherent sheaf along a proper map to a locally Noetherian scheme (Stacks 02O5), which Section E2.8 uses.
- The geometric roadmaps verify the hypotheses of the abstract theorems: `DiamondEtaleCohomology` proves that the v- and quasi-pro-étale sites of diamonds are locally weakly contractible, hence replete, and exhibits the accessibility and colimit closure of its étale subcategories; `DiamondSixOperations` builds the six operations from the diagram categories, mates and Beck–Chevalley transformations of Layer E3; `AdicCoefficientsAndComparisons` applies coefficient-system reconstruction to étale objects; `VStackSheavesAndLisseCategories`, `PerfectoidQuotients`, `EtaleDualityAndPerverseSheaves`, `PrismaticCohomology`, `AInfCohomology` and `CrystallineCohomology` consume the enhancement, descent and completion.
- `DerivedDeRhamCohomology` builds derived de Rham cohomology, its Hodge filtration and its completions on top of the cotangent complex and derived exterior powers of Layer E5:cotangent-export and the completion theory of Layer E4.
- Concrete point-set models of spectra (symmetric spectra and their stable model structures) and their comparison with the ∞-category Sp of Layer E5:presentability belong to `StableHomotopyKTheory`, which applies `monoidalModelLocalization` of Layer E5:abstract; this roadmap uses only Sp.
- `SchemeKTheoryOperations` and `DeformationAndDerivedPatchingAlgebra` use the enhancement of Layer E1 and the completion of Layer E4 rather than building their own.

## Conventions

**Higher categories.** "Quasicategory" and "∞-category" both mean a quasicategory in Mathlib's sense (`SSet.Quasicategory`); "space" means a Kan complex. Mapping spaces are right mapping spaces (Section E0.1). An equivalence of quasicategories is a categorical equivalence (Section E0.2), never just an equivalence of homotopy categories.

**Grading and signs.** Complexes are cochain complexes, with differentials raising degree. For an object A of the heart, A[1] is concentrated in cohomological degree −1. Lurie's dg nerve uses homological grading; the cohomological Hom complexes of Mathlib, Tau Ceti and `DGAInfinity` are reindexed by m ↦ −m and their composition order is converted with the Koszul braiding of `DGAInfinity` Layer 0. Good truncation puts cycles in degree zero, so π_i of a mapping space is H^{−i} of the derived Hom complex for i ≥ 0: negative cohomology appears as positive homotopy. Suspension, cofibres and the rotation of triangles agree with Mathlib's cochain shift and mapping cone; this is the theorem `dgNerve_shift_cone_comparison`, not a choice made to suit the enhancement.

**Universes and cardinals.** Each small site or diagram lives in a fixed universe u, its presheaves of spaces in u + 1, and large-universe Ind of a presentable category in a further enlargement; raising a cardinal cutoff comes with explicit comparison functors (`cutoffRightAdjoint_compat`). Local smallness means small Kan models of mapping homotopy types, not small simplex sets. Presentable means accessible for some regular cardinal with all small colimits; it never means ω-compactly generated. Compact means ω-compact unless a cardinal is named.

**Replacements.** Functorial K-injective and K-flat replacements, bounded by one regular cardinal, are what the enhancement uses; objectwise existence is weaker. K-injective complexes need not be closed under tensor products, so the derived tensor product uses K-flat replacements.

**Inverse limits and completeness.** A replete topos is one satisfying `IsReplete` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (BS-proet Definition 3.1.1). Repleteness concerns sequences only; it does not make all cofiltered limits exact. Pro-zero (every stage killed by a later transition) is stronger than vanishing limit: multiplication by p on ℤ has lim = 0 and lim¹ = ℤ_p/ℤ. For coherent towers of complexes, a pro-isomorphism asks every cohomology tower of the cone to be pro-zero, with no uniform stage across degrees. Hypercompleteness (descent along all hypercovers) and Postnikov completeness (convergence and effectivity of Postnikov towers) are different. Derived completeness is tested on every slice and every local section of the ideal. Recovery of a unit by an infinite totalization is weaker than descendability, which asks for a finite index.

**Stable subcategories.** Stable, thick and localizing closures are kept apart: a stable subcategory need not be closed under retracts, and the kernel of a Verdier quotient is the retract closure of the subcategory.

**Animated rings.** Homotopy groups of animated rings are indexed homologically, so π_n sits in cohomological degree −n. Ordinary polynomial algebras are Mathlib's `MvPolynomial`, ordinary rings `CommRingCat`, Witt vectors `WittVector`, perfect rings `PerfectRing`. The perfection of an 𝔽_p-algebra is the colimit along Frobenius, not Mathlib's inverse-limit `Perfection`.

**Notation.**

| Symbol | Meaning |
| --- | --- |
| N_dg(C) | the dg nerve of a dg category C |
| Hom^R_C(x, y), Map_C(x, y) | the right mapping space, and the mapping space up to equivalence |
| Fun(K, C) | the functor quasicategory (simplicial internal Hom) |
| C_{/p}, C_{p/} | cone and cocone quasicategories of p, through the join K ⋆ L |
| Cat∞, Spaces, Sp | small quasicategories, Kan complexes, spectra |
| D∞(O), D(X, R) | the enhanced unbounded derived category of a ringed site or topos |
| ⊗ᴸ, RHom, RℋOM | derived tensor product, derived Hom complex, derived internal Hom |
| τ^{≤n}, τ^{≥n} | truncations, cohomological indexing |
| Rlim | the derived limit of a tower, fib(1 − s) on the product |
| T(K, x) | the derived limit of K ←x K ←x ⋯ |
| Dcomp(X, R, I), L_I, ⊗̂ | derived I-complete objects, the completion reflector, the completed tensor product |
| Red, Rec | reduction to (K ⊗ᴸ R/I^n)_n and inverse-limit reconstruction |
| Dqc(X), Perf(X) | quasicoherent derived sheaves and perfect complexes on a scheme |
| N(Fin_∗) | the nerve of finite pointed sets ⟨n⟩ |
| Alg_O(C), CAlg(C), LMod_A(M) | operadic algebras, commutative algebras, left modules |
| Ind_κ(C), C^κ | κ-filtered colimits of representables, κ-compact objects |
| PrL, PrR | presentable categories with colimit-preserving functors, with accessible right adjoints |
| PΣ(C), AnimAlg_R | the nonabelian derived category, animated commutative R-algebras |
| L_{B/A}, L∧^n | the cotangent complex and its derived exterior powers |

**Sources and locators.** HTT is Lurie's *Higher Topos Theory* (author PDF of 9 April 2017); its PDF pages run 18 ahead of the printed pages, and each locator says which it gives. HA is Lurie's *Higher Algebra* (author PDF of 18 September 2017; PDF page equals printed page). BS-proet is Bhatt–Scholze, *The pro-étale topology for schemes* (author copy, PDF page equals printed page). BS17 is Bhatt–Scholze, *Projectivity of the Witt vector affine Grassmannian* (author PDF). ECD is Scholze, *Étale cohomology of diamonds* (arXiv:1709.07343v4). Stacks locators give the chapter, the result number within the chapter PDF, the tag and the chapter-PDF page. Full references are at the end.

**Prerequisite labels.** In the *Needs* lines, Lean names in backticks are targets of this roadmap (located by the section that states them), of Mathlib or of Tau Ceti; other roadmaps are cited by name and layer, or by name and section where the roadmap numbers its sections. The few statements that can be made against the pinned libraries are in [Suggested.lean](Suggested.lean).

## Exact supplier contracts

The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

### From Mathlib

- Simplicial sets and higher categories: `SSet`, `SSet.Quasicategory`, `SSet.KanComplex`, `SSet.InnerFibration`, `SSet.quasicategory_iff_innerFibration`, the simplicial internal Hom of `SSet` with its quasicategory instance, `CategoryTheory.Nerve.quasicategory`, the homotopy bicategory `SSet.QCat.bicategory` and `SSet.QCat.strictBicategory`, `CategoryTheory.SimplicialNerve` (the homotopy-coherent nerve of a simplicially enriched category), `SSet.HomotopyCategory`, `SSet.mapHomotopyCategory`, `CategoryTheory.Abelian.DoldKan.equivalence` and `CategoryTheory.SimplicialObject`. Mathlib proves that the nerve of a category and the simplicial internal Hom into a quasicategory are quasicategories; equivalences, mapping spaces, limits and straightening are built here.
- Category theory: `CategoryTheory.Limits` (cones, cocones, `IsLimit`, filtered colimits, zero objects), `CategoryTheory.Functor.IsLeftKanExtension`, `CategoryTheory.Grothendieck`, `CategoryTheory.mateEquiv`, `CategoryTheory.Bicategory.mateEquiv` and `CategoryTheory.Bicategory.mateEquiv_vcomp`, `CategoryTheory.MonoidalCategory`, `CategoryTheory.SymmetricCategory`, `CategoryTheory.Idempotents.Karoubi`, `CategoryTheory.Ind`, `CategoryTheory.IsSifted`, `CategoryTheory.IsFiltered`, `CategoryTheory.Functor.ReflectsIsomorphisms`, `CategoryTheory.ObjectProperty` and `CategoryTheory.ObjectProperty.IsSerreClass`, `CategoryTheory.isIsomorphicSetoid`, `Cardinal.IsRegular`, `Small`.
- Homological algebra: `CochainComplex`, `HomologicalComplex.monoidalCategory`, `CochainComplex.IsKInjective`, `DerivedCategory` with `DerivedCategory.Q`, `DerivedCategory.isIso_iff` and `DerivedCategory.isIso_Q_map_iff_quasiIso`, `CategoryTheory.Pretriangulated` (with `CategoryTheory.Pretriangulated.Triangle.coyoneda_exact₃` and `CategoryTheory.Pretriangulated.exists_iso_binaryBiproduct_of_distTriang`), `CategoryTheory.HasShift`, `CategoryTheory.Triangulated.TStructure` with `TStructure.eTruncGE`, `TStructure.truncLE` and `TStructure.truncLEι`, `CategoryTheory.Tor`, `CategoryTheory.HasProjectiveDimensionLE`, `CategoryTheory.HasInjectiveDimensionLE`, `ModuleCat.projectiveDimension_eq_of_linearEquiv`.
- Sheaves: `CategoryTheory.Sheaf`, `CategoryTheory.GrothendieckTopology`, `CategoryTheory.GrothendieckTopology.OneHypercover`, `SheafOfModules` with its Grothendieck abelian instance (`CategoryTheory.IsGrothendieckAbelian`), `SheafOfModules.free`, `SheafOfModules.restrictScalars`, pushforward and pullback of sheaves of modules, `PresheafOfModules.freeYoneda` with `PresheafOfModules.freeYonedaEquiv` and `PresheafOfModules.freeYoneda.isSeparating`, `PresheafOfModules.sheafification` and `PresheafOfModules.sheafificationAdjunction`, `SheafOfModules.IsQuasicoherent`, `CategoryTheory.CountableAB4Star` and `LightCondensed.epi_π_app_zero_of_epi`.
- Commutative algebra: `MvPolynomial`, `CommRingCat`, `Module.Flat`, `Module.FaithfullyFlat`, `RingTheory.Sequence.IsRegular`, `IsAdicComplete`, `ExteriorAlgebra.exteriorPower`, `exteriorPower.ιMulti`, `exteriorPower.alternatingMapLinearEquiv`, `KaehlerDifferential`, `Algebra.Extension.cotangentComplex`, `Algebra.Extension.toKaehler`, `Algebra.Extension.exact_cotangentComplex_toKaehler`, `Algebra.H1Cotangent`, `Algebra.Generators.equivH1Cotangent`, `derivationToSquareZeroEquivLift`, `TrivSqZeroExt`, `PerfectRing`, `PerfectClosure`, `frobenius`, `frobeniusEquiv`, `RingHom.Flat`, `IsRegularRing`, `IsRegularLocalRing`, `ringKrullDim`, `WittVector`, `ValuationSubring`, `Bornology.IsBounded` and `isBounded_iff_forall_norm_le'`.

- Projective objects: `CategoryTheory.Projective`, `CategoryTheory.Projective.factors`,
  `CategoryTheory.Projective.factorThru` and `CategoryTheory.Projective.factorThru_comp`
  (`Mathlib.CategoryTheory.Preadditive.Projective.Basic`). These work in an arbitrary category;
  on a topos they express weak contractibility, using stability of epimorphisms under pullback.
  The same module supplies the projectivity instance for every object of `Type u`.

### From Tau Ceti

- `TauCeti.DGCategory` and `TauCeti.dgHomComplex` (`TauCeti.CategoryTheory.DG.Basic`),
  `TauCeti.DGHomotopyCategory` (`TauCeti.CategoryTheory.DG.HomotopyCategory`) and
  `CategoryTheory.EnrichedFunctor.mapDGHomotopyCategory` (`TauCeti.CategoryTheory.DG.Functor`)
  supply dg categories, their cohomological Hom complexes, H⁰ and the functor induced on H⁰.
  E0.6 uses them through the grading and braiding conventions of DGAInfinity Layers 0–1.
- `TauCeti.SheafOfModules.monoidalCategory` and `TauCeti.SheafOfModules.symmetricCategory`
  (`TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Monoidal`), with
  `TauCeti.SheafOfModules.monoidalClosed`
  (`TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Closed`), supply the ordinary
  tensor product, Koszul-compatible symmetry and internal Hom of module sheaves over a sheaf
  of commutative rings. E1.4 derives these operations; it introduces no second ordinary tensor
  or internal Hom.
- `TauCeti.CategoryTheory.PresheafExtensionByZero.functor` and
  `TauCeti.CategoryTheory.PresheafExtensionByZero.adjunction`
  (`TauCeti.CategoryTheory.Sites.ExtensionByZero`) supply presheaf extension by zero on a
  preorder and its adjunction to restriction. The same module's
  `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` gives
  exactness of Mathlib's sheaf extension functor on a lower interval, in particular for
  abelian sheaves along an open inclusion. E1.1 constructs the slice-free O-module for an
  arbitrary object of a ringed site.

- `TauCeti.linearHomComplexEnrichedCategory` (`TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean`): cochain complexes in an R-linear preadditive category, enriched in cochain complexes of R-modules, with Mathlib's composition order and the Koszul braiding. Section E1.1 uses it for complexes of module sheaves.

### From TauCetiRoadmap

- `DGAInfinity`, Layer 0: the cohomological-to-homological reindexing, graded signs and the Koszul braiding comparing composition orders, and the k-linear Hom complex with its enrichment.
- `DGAInfinity`, Layer 1: dg categories as categories enriched in cochain complexes, the Z⁰ and H⁰ categories, dg functors and full dg subcategories.
- `ProfiniteCohomology`, Layer 0 (discrete modules and continuous sections) and Layer 10 (continuous cohomology in all degrees, with the finite-quotient description colim_U Hⁿ(G/U, M^U)).

- `SchemeAndStackFoundations` §2.17 supplies the Lean predicate
  `TauCetiRoadmap.SchemeAndStackFoundations.Proetale.IsReplete` from
  `TauCetiRoadmap.SchemeAndStackFoundations.Suggested`. Its contract quantifies over every
  inverse sequence with epimorphic successive transitions, every limit cone and every stage,
  requiring the corresponding projection to be epimorphic. The enhanced consequences in E2
  use this predicate. The other names in the §2.17 contract below are that roadmap's theorem
  targets; they do not assert the existence of an enhanced derived category at the library pins.

- `SchemeAndStackFoundations`, Layer 0: quasicoherent modules and their direct images (§§0.1, 0.4), depth and Cohen–Macaulay modules (§0.17), perfect schemes and the colimit perfection `Scheme.perfection` (§0.24), perfectly finitely presented and perfectly proper maps (§0.25). Layer 2: higher direct images on sites (§2.1), `cech_to_cohomology` (§2.2), `cohomology_filtered_colimits` (§2.5), `qcoh_higherDirectImages` with flat base change (§2.6); `IsReplete`, `IsReplete.lim_epi`, `IsReplete.derived_limits`, `IsReplete.derivedCategory_leftComplete` and `isReplete_of_locallyWeaklyContractible` (§2.17); `DQCoh`, `DQCoh.affineEquiv`, `DQCoh.restrict` and `torIndependent_baseChange` (§2.18). Layer 4: `generic_flatness` and `flattening_by_blowup` (§4.12), regular schemes and `IsRegular.isCohenMacaulay` (§4.13).
- `JacobianChallenge`, Layer C: coherence of the higher direct images of coherent sheaves along proper maps to locally Noetherian schemes.

### From other roadmaps

- `DiamondsAndVStacks`, Layer D0: D0.17 quasicompact and quasiseparated objects and morphisms of a topos, and algebraic topoi; D0.18 filtered colimits of abelian sheaves and their cohomology on the qcqs objects of an algebraic topos.

## How to read the build

The layer labels are identifiers that other roadmaps cite; the build order differs from their numbering. E0 builds the quasicategorical foundations and the dg nerve. E1 constructs D∞(O) and its operations and contains the commutative algebra the later layers need. E3 gives Kan extensions, adjoints and localizations; it uses only E0 and E1. E2:towers isolates derived limits of towers and pro-zero towers. E5:abstract, E5:presentability and E5:descent develop monoidal ∞-categories, presentable categories and descendable algebras, and E5:animation develops animated rings; E2 uses descendability and Frobenius on animated rings for h-descent on perfect schemes, so these come before it. E2 then proves repleteness, Postnikov completion and descent, and E4 builds derived completion on replete topoi. The cotangent complex, the Eilenberg–Mac Lane comparison and the compatibility of all the comparisons come last.

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| [E0](#layer-e0-a-concrete-enhancement-and-higher-category-operations) | Quasicategorical foundations and the dg nerve | Mapping spaces and equivalences, Dwyer–Kan localization, limits and final maps, stability, Cat∞ and Spaces, the dg nerve and its sign comparison, straightening, presentability |
| [E1](#layer-e1-unbounded-derived-sheaves-and-presentability) | The enhanced derived category D∞(O) | K-injective and K-flat replacement, comparison with `DerivedCategory`, presentability, ⊗ᴸ, RℋOM, Lf^∗ ⊣ Rf_∗, Koszul complexes, perfect 𝔽_p-algebras, Dqc and perfect base change |
| [E3](#layer-e3-coherent-diagrams-kan-extensions-and-adjoints) | Kan extensions and adjoints | Relative left Kan extension, representability, the adjoint functor theorem, localizations, presentable limits, compact generation, ringed diagrams, mates |
| [E2:towers](#layer-e2towers-coherent-towers-and-pro-towers) | Towers | Rlim = fib(1 − s), pro-zero towers, multiplicative derived-limit filtrations |
| [E5:abstract](#layer-e5abstract-the-monoidal-stable-categorical-baseline) | Monoidal ∞-categories | Operads, algebras, modules, monoidal localizations, the symmetric monoidal D∞(O), idempotent completion, Verdier quotients, Barr–Beck–Lurie |
| [E5:presentability](#layer-e5presentability-presentable-categories-ind-completion-and-their-extensions) | Large categories | Ind, PrL and its limits, Sp, ⊗ of presentable categories, group actions, dualizable and rigid categories |
| [E5:descent](#layer-e5descent-descendable-algebras-and-module-descent) | Descendability | Finite index, module descent, uniform index along colimits |
| [E5:animation](#layer-e5animation-animated-commutative-algebra) | Animation | Sifted colimits, PΣ, animated rings, Frobenius and perfection, simplicial Witt vectors, bounded totalizations |
| [E2](#layer-e2-repleteness-inverse-limits-postnikov-convergence-and-descent) | Inverse limits and descent | Countable products and Rlim in replete topoi, Milnor sequences, left completeness, Postnikov convergence, hypercover descent, sheaves of spaces, h-descent on perfect schemes |
| [E4](#layer-e4-derived-completion-of-sheaves-and-coefficient-reconstruction) | Derived completion | Dcomp and L_I, completed ⊗ and RℋOM, Koszul models, regular ideals, Dcomp(X, R, I) ≃ lim D(X, R/I^n) |
| [E5:cotangent-export](#layer-e5cotangent-export-the-cotangent-complex-of-animated-rings) | The cotangent complex | Animated rings as commutative algebras, derivations, L_{B/A} and its properties, derived exterior powers |
| [E5:spectra-comparison](#layer-e5spectra-comparison-eilenbergmac-lane-rings-and-derived-modules) | Eilenberg–Mac Lane rings | Mod_{HR}(Sp) ≃ D(R) |
| [E5](#layer-e5-compatibility-of-the-enhancements) | Compatibility | Agreement of all the comparisons on units, polynomial and regular-quotient computations |

## Layer E0: A concrete enhancement and higher-category operations

The basic higher category is a quasicategory in Mathlib's sense (`SSet.Quasicategory`) and the basic space is a Kan complex (`SSet.KanComplex`). This layer builds, on those carriers, the operations every later layer uses: joins, slices and right mapping spaces; categorical equivalences detected on mapping spaces; functor quasicategories, full subcategories and cores; Dwyer–Kan localization at a set of edges; limits and colimits with their space-valued universal properties, weakly contractible simplicial sets and final maps; stable quasicategories; the coherent nerve of a locally Kan simplicial category, with Cat∞ and Spaces; the dg nerve of a dg category and its comparison with Mathlib's cochain shift and mapping cone; coCartesian fibrations and straightening over the shapes the later layers need; and cardinal filteredness, accessibility and presentability. Every comparison with an ordinary category is a theorem about mapping spaces, never a definition by passage to the homotopy category.

### E0.1 Joins, slices and right mapping spaces

**The simplicial join** (`join`). For simplicial sets K and L, the join K ⋆ L has as n-simplices the disjoint union of K_n, L_n and the products K_a × L_b over a + b + 1 = n. Equivalently, in augmented simplicial degrees with K_{−1} = L_{−1} = ∗, it is the degreewise product ⨿_{a+b+1=n} K_a × L_b. Faces and degeneracies act in the factor they touch; at the boundary between the factors they pass into the other one. Every vertex of K precedes every vertex of L, and this orientation is the one that makes the two slice constructions of the next target come out right. (HTT §1.2.8, PDF pp. 58–59.)

Provide `join` (functorial in both variables), `join_inclusions` (the canonical maps K → K ⋆ L ← L) and `join_map` (maps of factors induce maps of joins, preserving identities and composition). The operators are defined by splitting an ordered simplex at its last vertex in K, and the simplicial identities hold because both sides restrict the same monotone map.

**Checks.**

- ∅ ⋆ K ≅ K ≅ K ⋆ ∅.
- Δ[0] ⋆ Δ[0] ≅ Δ[1], with the vertex of the first factor as source.
- Δ[a] ⋆ Δ[b] ≅ Δ[a + b + 1]; reversing the order of the factors reverses the orientation of the result.

*Needs:* Mathlib `SSet`.

**Right mapping space** (`rightMappingSpace`). For a quasicategory C and vertices x, y, Hom^R_C(x, y) is the simplicial set whose n-simplices are the maps Δ[n+1] → C that are constant at x on the first n + 1 vertices and send the last vertex to y. A monotone map α : [m] → [n] acts by extending α to [m+1] → [n+1], sending the final vertex to the final vertex. The Kan property and the comparison with other models of the mapping space are separate targets (Section E0.2). (HA Remark 1.3.1.12, p. 83.)

Provide `rightMappingSpace`, `rightMappingSpace_vertices` (its vertices are exactly the edges x → y of C) and `rightMappingSpace_map` (a simplicial map C → D induces maps of right mapping spaces, compatibly with composition). The construction selects, degreewise, a subset of maps of simplices; restriction along the extended monotone maps preserves both endpoint conditions.

**Checks.**

- For the terminal simplicial set and its unique vertex, the right mapping space is terminal.
- For the nerve of an ordinary category A, Hom^R(x, y) is the constant simplicial set on Hom_A(x, y).
- A 1-simplex of Hom^R_C(x, y) is a 2-simplex of C whose first edge is the identity of x and whose last vertex is y, not an arbitrary 2-simplex.

*Needs:* Mathlib `SSet`, `SSet.Quasicategory`.

**Slices and cone categories** (`overDiagram`, `underDiagram`). For p : K → C define C_{/p} by Hom(Y, C_{/p}) ≅ {q : Y ⋆ K → C | q restricted to K is p}, and C_{p/} with K ⋆ Y in place of Y ⋆ K. When C is a quasicategory both are quasicategories. Their vertices are coherent cones on p with cone point before, respectively after, the diagram, and the projection to C remembers the cone point. (HTT §1.2.9, PDF pp. 59–61, and Proposition 1.2.9.3, PDF p. 61.)

Provide `overDiagram`, `underDiagram`, `slice_vertex` (the projection to C) and `slice_joinEquiv` (the representing bijections above, natural in Y). The quasicategory property is proved by extending an inner horn along the inner anodyne join inclusion.

**Checks.**

- For K = ∅ both slices are C.
- For C = N(A) and p a single object a, the slices are N(A/a) and N(a/A).
- For K two discrete vertices, a cone consists of two edges out of its cone point; it imposes no arrow between the two prescribed vertices.

*Needs:* `join`; Mathlib `SSet.Quasicategory`.

### E0.2 Equivalences and mapping spaces

**Categorical equivalences** (`IsCategoricalEquivalence`). A simplicial map F : C → D of quasicategories is a categorical equivalence when it has a quasi-inverse G with natural equivalences GF ≃ id_C and FG ≃ id_D, expressed as an equivalence in Mathlib's homotopy bicategory of quasicategories (`SSet.QCat.bicategory`). It is equivalent to essential surjectivity on homotopy categories together with equivalences on all mapping spaces (Section E0.2, next target). An equivalence of homotopy categories alone is not enough. (HTT Definition 1.2.10.1 and Remark 1.2.10.2, PDF p. 61; Theorem 2.2.5.1, PDF p. 107.)

Provide `IsCategoricalEquivalence`, `categoricalEquivalence_comp` (closure under composition), `categoricalEquivalence_of_comp_left` (two-out-of-three) and `categoricalEquivalence_nerve` (N(F) is a categorical equivalence exactly when the ordinary functor F is an equivalence).

**Checks.**

- The identity of a quasicategory is a categorical equivalence.
- The nerve of the inclusion of a skeleton into an ordinary category is a categorical equivalence.
- Let A = ℤ ⊕ ℤε be the one-object dg algebra with ε in cohomological degree −1, ε² = 0 and dε = 0. Its projection to ℤ induces an equivalence of homotopy categories, but the self-mapping space has π₁ = ℤ for A and π₁ = 0 for ℤ (Section E0.6), so the induced map of dg nerves is not a categorical equivalence.

*Needs:* Mathlib `SSet.QCat.bicategory`, `SSet.QCat.strictBicategory`.

**Right mapping spaces are Kan and detect equivalences** (`rightMappingSpace_isKan`, `isCategoricalEquivalence_iff`). For a quasicategory C and vertices x, y, Hom^R_C(x, y) is a Kan complex. A categorical equivalence C → D induces weak homotopy equivalences on right mapping spaces; conversely, a map that is essentially surjective on homotopy categories and induces weak homotopy equivalences on all right mapping spaces is a categorical equivalence. For maps of Kan complexes, weak homotopy equivalence and categorical equivalence agree. (HTT Proposition 1.2.2.3, PDF p. 45; Propositions 2.2.2.7, 2.2.2.9 and 2.2.2.13, PDF pp. 94–96; Theorem 2.2.5.1, PDF p. 107.)

**Checks.**

- For the nerve of an ordinary category, every right mapping space is the discrete set Hom_A(x, y).
- For the square-zero dg algebra of the previous Checks, the self-mapping space has nonzero π₁.

*Proof route.* An outer horn in the right mapping space becomes an inner horn in C with fixed initial face, which C fills. For the detection statement compare Hom^R with the mapping space of the simplicial localization through the Q-cosimplicial model of HTT §2.2.2 and apply its equivalence criterion.

*Needs:* `rightMappingSpace`; `IsCategoricalEquivalence`; Mathlib `SSet.KanComplex`.

### E0.3 Functor quasicategories, full subcategories, cores and localizations

**Functor quasicategories and coherent transformations** (`coherentFun`). For a simplicial set K and a quasicategory C, Fun(K, C) is the simplicial internal Hom: its n-simplices are the maps K × Δ[n] → C. It is a quasicategory, its edges are the coherent natural transformations, and an edge is invertible exactly when its evaluation at every vertex of K is invertible. (HTT Proposition 1.2.7.3, printed p. 39, PDF p. 57; pointwise detection of equivalences in §2.3.4, printed p. 106, PDF p. 124.)

The internal Hom and its quasicategory instance already exist at the pinned Mathlib (the simplicial internal Hom of `SSet`, with the inner-anodyne pushout-product instance); they are used unchanged. The new API is `coherentFun` (that carrier with its quasicategory instance), `coherentFun_eval` (evaluation at a vertex as a functor), `coherentNatTrans` (edges are maps K × Δ[1] → C with the two prescribed restrictions) and `coherentFun_pointwiseEquiv` (vertexwise detection of invertible transformations, proved by the equivalence extension theorem).

**Checks.**

- Fun(Δ[0], C) ≅ C.
- Fun(N(A), N(B)) ≅ N(A ⥤ B) for small ordinary categories A, B.
- The vertices of Fun(Δ[1], C) are the edges of C, and its edges are squares together with their filling 2-simplices, not four unrelated arrows.

*Needs:* `IsCategoricalEquivalence`; Mathlib `SSet`, `SSet.QCat.bicategory`.

**Full enhanced subcategories** (`fullEnhancedSubcategory`). Given a predicate P on the vertices of a simplicial set C, take the simplices all of whose vertices satisfy P. The inclusion is full; when C is a quasicategory so is the subobject, and its vertices are the vertices satisfying P. (HTT §1.2.11, printed p. 44, PDF p. 62.)

Provide `fullEnhancedSubcategory`, `fullEnhancedSubcategory_inclusion` and `fullEnhancedSubcategory_vertices` (the vertex equivalence with {x | P x}). Inner horns whose vertices satisfy P are filled in C, and every vertex of the filler already occurs in the horn.

**Checks.**

- Taking P always true gives C.
- Taking P always false gives the empty simplicial set.
- For C = N(A), the full enhanced subcategory on P is the nerve of Mathlib's full subcategory of A on P.

*Needs:* `coherentFun`.

**The maximal Kan core** (`enhancedCore`). For a quasicategory C, its core is the simplicial subset of simplices all of whose edges are equivalences. It contains every vertex of C, it is a Kan complex, and every map from a Kan complex into C factors uniquely through it. (HTT Proposition 1.2.5.3 and its proof, printed pp. 35–36, PDF pp. 53–54.)

Provide `enhancedCore`, `enhancedCore_inclusion`, `enhancedCore_vertices` (all vertices survive) and `enhancedCore_edges` (its edges are the equivalence edges of C). The subset is a quasicategory by inner horn filling, an inverse of a retained edge is again an equivalence, and the outer horn criterion for equivalence edges makes it Kan.

**Checks.**

- The core of Δ[0] is Δ[0].
- The core of Δ[1] is the discrete simplicial set on two vertices.
- A Kan complex is isomorphic to its own core.

*Needs:* `fullEnhancedSubcategory`; `IsCategoricalEquivalence`.

**Dwyer–Kan localization** (`IsDwyerKanLocalization`, `dwyerKanLocalization`). Let C be a quasicategory and W a set of edges of C. A functor f : C → D of quasicategories exhibits D as the localization C[W^{−1}] when, for every quasicategory E, precomposition with f is fully faithful from Fun(D, E) to Fun(C, E) (it induces equivalences on all right mapping spaces, Section E0.2) and its essential image consists of the functors carrying every edge of W to an equivalence. A localization exists for every C and W and is unique up to a contractible space of choices. It is formed by inverting W in the marked sense, not by localizing the homotopy category; its homotopy category is the ordinary localization of the homotopy category of C at the image of W (Mathlib's `CategoryTheory.Functor.IsLocalization`). A reflective full subcategory with left adjoint L is the localization at the edges that L inverts, which relates this notion to `accessibleLocalization` of Layer E3. (HA Definition 1.3.4.1, Remark 1.3.4.2 and Example 1.3.4.3, p. 108.)

Provide `IsDwyerKanLocalization`, `dwyerKanLocalization` (a chosen localization with its functor), `dwyerKanLocalization_universal` (the restriction equivalence onto the W-inverting functors) and `dwyerKanLocalization_homotopyCategory` (the comparison of `SSet.HomotopyCategory` of C[W^{−1}] with Mathlib's ordinary localization).

**Checks.**

- If W consists of equivalences, the identity of C exhibits C as C[W^{−1}].
- For C = Δ[1] and W its nondegenerate edge, C[W^{−1}] ≃ Δ[0].
- For an ordinary category A and a class W of morphisms, the homotopy category of N(A)[W^{−1}] is Mathlib's localization of A at W; for cochain complexes of abelian groups and the quasi-isomorphisms it is Mathlib's `DerivedCategory`, while N(A)[W^{−1}] itself keeps the higher homotopy of mapping spaces (Section E1.3).

*Proof route.* Mark the edges of W, take a fibrant replacement in the marked model structure over a point, and read the universal property off the marked mapping spaces; the homotopy-category comparison comes from the adjunction between homotopy categories and nerves.

*Needs:* `coherentFun`; `rightMappingSpace_isKan`; `IsCategoricalEquivalence`; `enhancedCore`; Mathlib `SSet.HomotopyCategory`, `CategoryTheory.Functor.IsLocalization`.

### E0.4 Limits, colimits and stability

**Enhanced limits and colimits** (`IsEnhancedLimit`, `IsEnhancedColimit`). A cone c ∈ C_{/p} is a limit cone when it is a terminal object of C_{/p}, and a cocone c ∈ C_{p/} is a colimit cocone when it is initial in C_{p/}. Initial means that every right mapping space out of the object is contractible; terminal is the dual condition. Equivalently, for every z the maps Map_C(z, lim p) → lim_k Map_C(z, p(k)) and Map_C(colim p, z) → lim_k Map_C(p(k), z) are equivalences of spaces, naturally in z, and the limit is unique up to a contractible space of choices. (HTT Definition 1.2.12.1, PDF pp. 62–63; Remark 1.2.13.3 and Definition 1.2.13.4, PDF p. 65; Lemma 4.2.4.3, PDF p. 275.)

Provide `IsEnhancedLimit`, `IsEnhancedColimit`, `enhancedLimit_mapEquiv` and `enhancedColimit_mapEquiv` (the natural mapping-space equivalences) and `enhancedLimit_nerve` (in N(A), limit cones are exactly the cones that are limits in Mathlib's sense, `CategoryTheory.Limits.IsLimit`, and dually).

**Checks.**

- The limit of the empty diagram is a terminal object and its colimit an initial object.
- In the nerve of the category of sets, the product cone of two sets is the cartesian product.
- In Kan complexes, the homotopy pullback ∗ ×_{K(ℤ,1)} ∗ is K(ℤ, 0) = ℤ, not a point; computing the pullback of π₀ alone misses it.

*Needs:* `overDiagram`, `underDiagram`; `rightMappingSpace`; `rightMappingSpace_isKan`; Mathlib `CategoryTheory.Limits.Cocone`.

**Weakly contractible simplicial sets and final maps** (`IsWeaklyContractibleSSet`, `IsFinal`). A simplicial set K is weakly contractible when, for every Kan complex Z, the inclusion of the constant maps Z → Fun(K, Z) is a categorical equivalence (for Kan complexes, a homotopy equivalence); equivalently K → Δ[0] is a weak homotopy equivalence. A map f : K → L into a quasicategory is final when, for every vertex y of L, the simplicial set K ×_L L_{y/} is weakly contractible. By the quasicategorical Theorem A this agrees with Joyal's definition through right fibrations, and it holds exactly when, for every quasicategory C, a cocone L ⋆ Δ[0] → C is a colimit cocone if and only if its restriction along f ⋆ Δ[0] is. If f is final, a further map g is final exactly when g ∘ f is. For the nerve of a functor between ordinary categories finality is stronger than Mathlib's `CategoryTheory.Functor.Final`, which asks the comma categories only to be connected. (HTT Definition 4.1.1.1 and Proposition 4.1.1.3, printed p. 223, PDF p. 241; Proposition 4.1.1.8, printed p. 226, PDF p. 244; Theorem 4.1.3.1, printed p. 236, PDF p. 254.)

Provide `IsWeaklyContractibleSSet`, `IsFinal`, `isFinal_iff_colimit` (the colimit characterization), `isFinal_comp` (composition and right cancellation) and `isFinal_nerve` (comparison with `CategoryTheory.Functor.Final`).

**Checks.**

- Δ[0] is weakly contractible and the empty simplicial set is not; the boundary ∂Δ[2] is connected but not weakly contractible, since maps into the nerve of the group ℤ detect its loop.
- The inclusion of a terminal vertex into a quasicategory is final; for instance {1} → Δ[1].
- The inclusion {0} → Δ[1] is not final: over the vertex 1 the fibre product {0} ×_{Δ[1]} Δ[1]_{1/} is empty.
- For the nerve of a functor between ordinary categories, finality implies Mathlib's `CategoryTheory.Functor.Final`.

*Proof route.* For Theorem A, factor f through a categorical equivalence followed by an inner fibration, reduce to the left fibrations L_{y/} → L, and compare spaces of sections fibrewise (HTT §4.1.3); the colimit characterization follows because colimit cocones are the initial objects of the cocone quasicategories.

*Needs:* `join`; `overDiagram`, `underDiagram`; `coherentFun`; `IsCategoricalEquivalence`; `IsEnhancedColimit`; Mathlib `SSet.KanComplex`, `CategoryTheory.Functor.Final`.

**Stable quasicategories** (`IsStable`). A quasicategory is stable when it has a zero object, all finite limits and all finite colimits, and a commutative square is a pullback exactly when it is a pushout. Fibre and cofibre are the pullback over and the pushout from zero, suspension is Σx = cofib(x → 0) and loop is Ωx = fib(0 → x). A functor between stable quasicategories is exact when it preserves finite limits, equivalently finite colimits. This is the stable notion used throughout; the monoidal theory of Layer E5:abstract builds on it. (HA Definition 1.1.1.9, p. 19; Proposition 1.1.3.4, pp. 31–32; Proposition 1.1.4.1, p. 33.)

Provide `IsStable`, `stable_fibre_cofibre` (fibre and cofibre functors with their canonical maps), `stable_suspension_loop` (Σ and Ω are inverse categorical equivalences) and `stable_exact_iff` (finite-limit and finite-colimit preservation agree).

**Checks.**

- The terminal quasicategory Δ[0] is stable.
- N(Mod_ℤ) is not stable: the pullback square of 0 → ℤ ← 0 has pullback 0, and the square with corners 0, 0, 0, ℤ is a pullback but not a pushout.
- In the dg nerve of complexes (Section E0.6) ΣK agrees with K[1], including the sign of its differential.

*Needs:* `IsEnhancedLimit`, `IsEnhancedColimit`; `IsCategoricalEquivalence`; Mathlib `CategoryTheory.Limits.HasZeroObject`.

### E0.5 Coherent nerves, Cat∞ and Spaces

**Coherent nerve of a locally Kan simplicial category** (`simplicialNerve_quasicategory`). Let C be a simplicial category all of whose mapping objects are Kan complexes. Its homotopy-coherent nerve N(C) (Mathlib's `CategoryTheory.SimplicialNerve`) is a quasicategory, and for objects x, y its right mapping space is naturally equivalent to the mapping Kan complex C(x, y). The comparison respects composition in the homotopy category and is natural in simplicial functors. Mapping objects are raised to the universe of the nerve where necessary. Simplicial categories whose mapping objects are not Kan are not covered. (HTT Proposition 1.1.5.10 and its proof, printed pp. 23–24, PDF pp. 41–42; Propositions 2.2.2.7, 2.2.2.9, 2.2.2.13 and Remark 2.2.2.11, printed pp. 76–78, PDF pp. 94–96.)

**Checks.**

- For a discrete ordinary category the comparison recovers its Hom sets.
- For a one-object simplicial group the comparison retains the whole mapping group, not only its π₀.

*Proof route.* An inner horn in N(C) corresponds to an extension problem along a simplicial thickening; only the mapping cube between the endpoints differs, the punctured-cube inclusion is anodyne, and the Kan hypothesis supplies the filler. The right mapping space is identified with Sing_Q C(x, y) (HTT 2.2.2.13), and the Q-realisation/singular comparison for Kan objects identifies that with C(x, y).

*Needs:* `rightMappingSpace_isKan`; Mathlib `CategoryTheory.SimplicialNerve`.

**The ∞-category of small quasicategories** (`catInfinity`). Cat∞ is the homotopy-coherent nerve of the simplicial category whose objects are the u-small quasicategories and whose mapping object from C to D is the core of Fun(C, D). It is a quasicategory in universe u + 1, and Map_{Cat∞}(C, D) is equivalent to core Fun(C, D): it retains functors and invertible transformations of all orders. (HTT Definition 3.0.0.1 and Remarks 3.0.0.2–3.0.0.5, printed pp. 144–145, PDF pp. 162–163; Proposition 1.1.5.10, PDF p. 41.)

Provide `catInfinity`, `catInfinity_vertices` (vertices are the u-small quasicategories), `catInfinity_mappingComparison` (the comparison with the universe lift of core Fun(C, D)) and `catInfinity_mappingEquiv` (it is an equivalence of Kan complexes). Composition is the strictly associative internal-Hom composition restricted to cores.

**Checks.**

- The mapping space from any C to Δ[0] is contractible.
- The mapping space out of Δ[1] retains the core of the arrow quasicategory, not only its set of objects.
- Map_{Cat∞}(Δ[0], Δ[1]) has two components and is not contractible; using the whole of Fun(Δ[0], Δ[1]) instead of its core would give a contractible space.

*Needs:* `enhancedCore`; `coherentFun`; `rightMappingSpace_isKan`; `simplicialNerve_quasicategory`.

**The ∞-category of spaces** (`spaceInfinity`). Spaces_u is the homotopy-coherent nerve of the simplicial category of u-small Kan complexes with internal-Hom mapping objects. For Kan K and L, Map_{Spaces}(K, L) is equivalent to Fun(K, L) in the next universe. The representable functors used for compactness (Section E0.8) take values here. (HTT §1.2.5, printed pp. 34–36, PDF pp. 52–54; Definition 3.0.0.1, printed p. 144, PDF p. 162.)

Provide `spaceInfinity`, `spaceInfinity_vertices`, `spaceInfinity_mappingComparison` and `spaceInfinity_mappingEquiv`. The internal Hom into a Kan complex is Kan, so `simplicialNerve_quasicategory` applies.

**Checks.**

- Map(∗, K) recovers K.
- For nonempty K, Map(K, ∅) has no vertices.
- The self-mapping space of the discrete two-point space is the discrete four-point space.

*Needs:* `enhancedCore`; `coherentFun`; `catInfinity`; `simplicialNerve_quasicategory`.

**Universe control for mapping spaces** (`IsLocallySmall`). A quasicategory C in universe u + 1 is locally u-small when every right mapping space is homotopy equivalent, after universe lift, to a u-small Kan complex. One chooses such small models with comparison equivalences, and the coherent representable Map_C(x, −) then lands in Spaces_u, with its value at y naturally equivalent to the chosen model. The simplices of the original mapping space need not form a u-small type: local smallness concerns homotopy types, not raw simplex sets. (HTT Corollary 5.4.1.5 and Proposition 5.4.1.7, printed pp. 421–423, PDF pp. 439–441.)

Provide `HasSmallSpaceModel` (a Kan complex has a lifted u-small Kan model with comparison maps inverse up to simplicial homotopy), `IsLocallySmall`, `smallMappingSpace` with `smallMappingSpace_compare`, `representableSpaceFunctor` (the coherent Map(x, −) into Spaces_u), `representableSpaceFunctor_vertex` (its value at y is equivalent to Map_C(x, y)) and `representableSpaceFunctor_vertexComparison` (the evaluation comparison, an equivalence natural in y). The coherent functor is transported through the full inclusion of Spaces_u into larger spaces as a whole diagram, never by unrelated vertexwise choices.

**Checks.**

- The universe lift of a u-small quasicategory is locally u-small.
- The nerve of the category of u-small sets is locally u-small.
- The nerve of an ordinary category with a Hom type that is not u-small is not locally u-small.
- A contractible Kan complex whose nondegenerate simplices do not form a u-small type (for example the nerve of the indiscrete groupoid on a larger nonempty type) still has a u-small model, the point; the predicate must accept it.

*Needs:* `rightMappingSpace`; `spaceInfinity`; Mathlib `Small`.

### E0.6 The dg nerve and its comparisons

Lurie's dg nerve uses homological grading, while Mathlib's and Tau Ceti's complexes, and the dg categories of `TauCetiRoadmap.DGAInfinity` (Layers 0 and 1), use cohomological grading with enriched composition Hom(x, y) ⊗ Hom(y, z) → Hom(x, z). Every target here is stated for the homological reindexing Hom_m = Hom^{−m}, with composition order converted by the Koszul braiding of `DGAInfinity` Layer 0; Conventions fixes the signs.

**The differential graded nerve** (`dgNerve`). Let C be a small dg category over a commutative ring, viewed over ℤ by restriction of scalars, in homological grading. An n-simplex of N_dg(C) is a sequence of objects X₀, …, X_n together with, for every subset I ⊆ [n] with at least two elements, an element f_I ∈ Hom_C(X_{min I}, X_{max I}) of degree |I| − 2, such that, writing the interior vertices of I as i_m < ⋯ < i₁,

```text
d f_I = Σ_{j=1}^{m} (−1)^j ( f_{I∖{i_j}} − f_{{i_j < ⋯ < i_1 < max I}} ∘ f_{{min I < i_m < ⋯ < i_j}} ).
```

A monotone map α : [k] → [n] pulls these data back: on subsets on which α is injective use f_{α(J)}; on a two-element subset collapsed to a point use the identity; on larger collapsed subsets use zero. (HA Construction 1.3.1.6, p. 81; Example 1.3.1.8, p. 82.)

Provide `dgNerve`, `dgNerve_vertices` (vertices are the objects of C), `dgNerve_edges` (edges x → y are the closed degree-zero elements of Hom_C(x, y)) and `dgNerve_degeneracy` (a collapsed edge is an identity; a larger collapsed coherence is zero). The simplicial identities are checked case by case for the three kinds of operator above.

**Checks.**

- A 2-simplex with edges f : x → y, g : y → z and h : x → z carries a degree-one element η of Hom_C(x, z) with dη = g ∘ f − h: it records a homotopy, not an equality.
- The degeneracy of a vertex x is the identity of x, not zero.
- For a preadditive category viewed as a dg category with Hom complexes in degree zero, the dg nerve is isomorphic to the ordinary nerve.
- For the one-object dg ℤ-algebra ℤ ⊕ ℤε with ε in homological degree 1, ε² = 0 and d = 0, the self-mapping space has π₁ = ℤ, so N_dg is not equivalent to the nerve of any ordinary category.

*Needs:* Mathlib `SSet`, `CategoryTheory.Preadditive`; `TauCetiRoadmap.DGAInfinity` Layer 0 (graded signs, the Koszul braiding) and Layer 1 (dg categories and their Hom complexes).

**Inner horn filling for the dg nerve** (`dgNerve_quasicategory`). For every dg category C, N_dg(C) is a quasicategory. Given an inner horn Λⁿ_j → N_dg(C) with 0 < j < n, the missing data are f_{[n]} and f_{[n]∖{j}}; take f_{[n]} = 0 and

```text
f_{[n]∖{j}} = Σ_{0<p<n} (−1)^{p−j} f_{{p,…,n}} ∘ f_{{0,…,p}} − Σ_{0<p<n, p≠j} (−1)^{p−j} f_{[n]∖{p}}.
```

Outer horns are not filled in general. (HA Proposition 1.3.1.10, p. 82.)

**Checks.**

- For n = 2 and j = 1 the filler is h = g ∘ f with the zero homotopy.
- The outer horn Λ²₀ given by f : x → y and h : x → z need not fill: a filler would need g with g ∘ f homotopic to h.

*Proof route.* The displayed formula solves the equation on the full set by construction; applying d, the Leibniz rule and the equations already known on proper faces verifies the remaining equation.

*Needs:* `dgNerve`; Mathlib `SSet.Quasicategory`.

**Homotopy category of the dg nerve** (`dgNerve_homotopyCategoryIso`). The canonical functor from the homotopy category H₀(C) of the dg category (morphisms are degree-zero homology classes of Hom complexes) to the homotopy category of N_dg(C) is an isomorphism, the identity on objects. Here H₀(C) is the degree-zero homology category of `DGAInfinity` Layer 1, not the category of closed degree-zero maps. (HA Remarks 1.3.1.5 and 1.3.1.11, pp. 81 and 83.)

**Checks.**

- For Hom complexes concentrated in degree zero this recovers the original preadditive category.
- Two closed maps differing by a boundary dh give the same morphism of the homotopy category, witnessed by a 2-simplex with a degenerate edge.

*Proof route.* Edges are degree-zero cycles; triangles with one degenerate edge relate two edges exactly when they differ by a degree-one boundary; the Leibniz rule makes composition descend.

*Needs:* `dgNerve`; `dgNerve_quasicategory`; `TauCetiRoadmap.DGAInfinity` Layer 1 (the H⁰ category).

**Dold–Kan mapping-space comparison** (`dgNerve_rightMappingSpaceIso`). For objects x, y of a dg category in homological grading there is an isomorphism of simplicial sets Hom^R_{N_dg(C)}(x, y) ≅ DK(τ_{≥0} Map_C(x, y)), where τ_{≥0} is the good connective truncation (cycles in degree zero) and DK is the Dold–Kan functor. In cohomological terms, π_i of the mapping space is H^{−i} of the Hom complex for i ≥ 0. (HA Remark 1.3.1.12, p. 83.)

**Checks.**

- Hom complexes concentrated in degree zero give discrete mapping spaces.
- A copy of ℤ in homological degree one of Hom_C(x, y) contributes π₁ = ℤ.

*Proof route.* Restrict the dg simplex equation to simplices constant on their first face: only coherences containing the final vertex survive, and after a sign change these families are exactly chain maps N_∗(ℤΔ[n]) → Map_C(x, y). The normalized-chain description of Dold–Kan (HA 1.2.3.12) then identifies the two sides; the pinned normalization and the composition-order comparison of `DGAInfinity` Layer 0 are part of the statement.

*Needs:* `rightMappingSpace`; `dgNerve`; Mathlib `CategoryTheory.Abelian.DoldKan.equivalence`; `TauCetiRoadmap.DGAInfinity` Layer 0.

**Simplicial enrichment of a dg category** (`dgSimplicialCategory`). For a dg category C in homological grading, C_Δ has the same objects and has as mapping simplicial set the underlying simplicial set of DK(τ_{≥0} Map_C(x, y)). Composition is induced by the lax monoidal structures of good truncation and of Dold–Kan (the Alexander–Whitney map), followed by forgetting the abelian group structure. All mapping objects are Kan, since simplicial abelian groups are. (HA Construction 1.3.1.13 and Remark 1.3.1.14, pp. 83–84.)

Provide `dgSimplicialCategory`, `dgSimplicialCategory_hom` and `dgSimplicialCategory_unit` (the enriched unit is the constant simplex on id_x). The lax monoidal structure of Dold–Kan and its unit and associativity constraints, and the Kan property of simplicial abelian groups, are part of this target: Mathlib's `CategoryTheory.Abelian.DoldKan.equivalence` supplies the equivalence but not the lax monoidal constraints.

**Checks.**

- For Hom complexes in degree zero every mapping simplicial set is constant.
- A zero Hom complex gives the one-point simplicial set.
- On vertices, composition is the original composition of closed degree-zero maps.

*Needs:* `dgNerve`; Mathlib `CategoryTheory.Abelian.DoldKan.equivalence`, `SSet.KanComplex`; `TauCetiRoadmap.DGAInfinity` Layer 1.

**Homotopy-coherent nerve comparison** (`dgNerve_coherentNerveEquivalence`). For every dg category C the canonical map θ : N(C_Δ) → N_dg(C), from the homotopy-coherent nerve of the simplicial enrichment, is a categorical equivalence. It is bijective in dimensions at most two but not an isomorphism in general; and N(C_Δ) is not the ordinary nerve of the underlying category. (HA Construction 1.3.1.16 and Proposition 1.3.1.17, pp. 84–85.)

**Checks.**

- For Hom complexes in degree zero, θ is an isomorphism with the nerve of the underlying preadditive category.
- θ is a bijection on vertices, edges and 2-simplices; the comparison must not be upgraded to an isomorphism in higher dimensions.

*Proof route.* θ sends a coherence f_I to the alternating sum, over permutations of the interior vertices of I, of its values on chains of subsets in the thickening C[Δⁿ]; check faces and degeneracies. θ is the identity on vertices, the source mapping spaces are Sing_Q DK(τ_{≥0} Map) and the target ones are given by `dgNerve_rightMappingSpaceIso`; apply `isCategoricalEquivalence_iff`.

*Needs:* `dgSimplicialCategory`; `dgNerve_rightMappingSpaceIso`; `dgNerve_quasicategory`; `simplicialNerve_quasicategory`; `isCategoricalEquivalence_iff`; Mathlib `CategoryTheory.SimplicialNerve`.

**The stable API and the sign comparison** (`dgNerve_shift_cone_comparison`). Let C be a dg category of cochain complexes closed under zero, shifts and mapping cones (for instance the K-injective model of Layer E1, with these operations transported through replacement). Then N_dg(C) is stable; its suspension is the cochain shift K ↦ K[1] and its cofibre of f is the mapping cone of f, each with the sign conventions of Mathlib (`CategoryTheory.HasShift` on cochain complexes and `CochainComplex.mappingCone`); and the triangulated structure that stability induces on the homotopy category (HA Theorem 1.1.2.14) is the pretriangulated structure Mathlib puts on the homotopy category of complexes. No alternative sign convention is chosen to make the comparison trivial. (HA Definition 1.1.1.9 and Theorem 1.1.2.14, printed pp. 19 and 27.)

**Checks.**

- For an object A of the heart, ΣA is A[1], concentrated in cohomological degree −1, not degree +1.
- The cofibre of the identity of K is contractible, and the cofibre of 0 → K is K.
- The rotation of the triangle of f : K → L carries the negated shifted map −f[1], matching Mathlib's rotation of distinguished triangles.

*Proof route.* Construct zero objects, fibres, cofibres and suspension in the dg nerve of complexes through mapping cones; identify Σ with the shift and the cofibre with the cone; compare the induced triangles on the homotopy category with Mathlib's pretriangulated structure, signs included.

*Needs:* `dgNerve_homotopyCategoryIso`; `dgNerve_rightMappingSpaceIso`; `join`; `IsEnhancedLimit`; `IsStable`; Mathlib `CategoryTheory.Pretriangulated`, `CategoryTheory.HasShift`, `CategoryTheory.Limits.HasZeroObject`, `DerivedCategory`.

### E0.7 CoCartesian fibrations and restricted straightening

**CoCartesian edges and fibrations** (`IsCoCartesianEdge`, `IsCoCartesianFibration`). Let p : E → B be an inner fibration of quasicategories. An edge e : x → y over a : u → v is p-coCartesian when, for every z, the square formed by Map_E(y, z) → Map_E(x, z) over Map_B(v, pz) → Map_B(u, pz) is a homotopy pullback; equivalently it has the lifting property for outer horns Λⁿ₀ (n ≥ 2) with first edge e. p is a coCartesian fibration when every pair (x, a : px → v) has a coCartesian lift. A coCartesian section is a section B → E sending every edge to a coCartesian edge. The sections form the relative functor quasicategory Fun_B(B, E), whose n-simplices are the maps Δ[n] × B → E over the projection to B; the coCartesian sections are a full subcategory of it, so transformations of sections lie over the identity of B. (HTT Definitions 2.4.1.1 and 2.4.2.1, PDF pp. 133 and 139; Proposition 2.4.4.3, PDF p. 149, dualised; Corollary 3.3.3.2 and the relative mapping object before it, printed pp. 215–216, PDF pp. 233–234.)

Provide `IsCoCartesianEdge`, `IsCoCartesianFibration`, `coCartesianEdge_comp` (composites of coCartesian edges are coCartesian), `coherentSections` (the relative section quasicategory over B), `coherentSections_simplices` (its n-simplices are the maps Δ[n] × B → E over B, compatibly with all simplicial operators), `coherentSections_inclusion` (its inclusion into Fun(B, E), forgetting the fixed projection) and `coCartesianSections` (the full subcategory on coCartesian sections). The horn condition is the definition; its equivalence with the mapping-space criterion is part of the target.

**Checks.**

- The projection B × C → B is a coCartesian fibration; a lifted edge is coCartesian exactly when its C-component is an equivalence.
- Over the identity of B every edge is coCartesian.
- Over a point the coCartesian edges are exactly the equivalences.
- The non-invertible edge of Δ[1] is not coCartesian over Δ[0].
- For the nerve of the Grothendieck construction of a functor F : A → Cat, the canonical transport edges are coCartesian.
- For an interval-classified functor T : C → D, a coCartesian section is an object x of C together with an equivalence T(x) ≃ y in D, not an arbitrary map T(x) → y.
- For p = id_B the coCartesian sections form Δ[0]. With B = BG for a nontrivial abelian group G, the full subcategory of Fun(B, B) on sections would wrongly retain automorphisms coming from the centre of G.

*Needs:* `rightMappingSpace_isKan`; `IsEnhancedLimit`; `coherentFun`; `fullEnhancedSubcategory`; Mathlib `SSet.InnerFibration`.

**Restricted straightening and sections** (`restrictedStraightening`). Let B be the nerve of a small ordinary category; the cases used later are N(Δ), N(ℕ^{op}), N(Fin_∗), nerves of small posets, the categories of hypercovers and refinements of Layer E2, and products of these with Δ[1]. Straightening and unstraightening identify functors B → Cat∞ with coCartesian fibrations over B. Under this identification the fibre over b is the value at b, transport along an edge is the assigned functor, base change is restriction, and the quasicategory of coCartesian sections is the limit of the classified diagram in Cat∞. Straightening over arbitrary small bases is a target of Layer E5:abstract (`derivedFamily`). (HTT Theorem 3.2.0.1, PDF p. 187; Corollary 3.3.3.2, PDF p. 234, with the coCartesian dual.)

**Checks.**

- For an ordinary functor A → Cat, unstraightening recovers the nerve of its Grothendieck construction (`CategoryTheory.Grothendieck`).
- For a constant diagram with value C the coCartesian sections are Fun(B^gpd, C), the full subcategory of Fun(B, C) of functors sending every edge to an equivalence; over an interval this is equivalent to C.
- For an inverse sequence of quasicategories the section quasicategory retains the coherent transition equivalences; its homotopy category need not be the limit of the homotopy categories.

*Proof route.* Use marked simplicial sets whose marked edges are the coCartesian edges, construct the relative coherent realisation and its nerve, prove the marked Quillen equivalence, and restrict its derived equivalence to the listed bases. Identify sections with the limit through their fibrewise universal property.

*Needs:* `IsCoCartesianFibration`; `coherentFun`; `IsEnhancedLimit`; `catInfinity`; Mathlib `CategoryTheory.Grothendieck`.

### E0.8 Filtered diagrams, accessibility and presentability

**Cardinal filteredness of coherent diagrams** (`IsKappaFiltered`). For an infinite regular cardinal κ, a quasicategory K is κ-filtered when every map Y → K from a simplicial set with fewer than κ nondegenerate simplices extends to Y ⋆ Δ[0] → K. For Y empty this asks for a vertex of K; for Y two points it asks for a common cocone. (HTT Definition 5.3.1.7 and Example 5.3.1.8, printed pp. 382–383, PDF pp. 400–401.)

Provide `IsKappaFiltered`, `HasKappaFilteredColimits` (colimits exist for all small κ-filtered diagrams) and `PreservesKappaFilteredColimits` (such colimit cocones are sent to colimit cocones). Nondegenerate simplices are counted, not all simplices; for nerves of posets the definition recovers upper bounds of fewer than κ elements.

**Checks.**

- Δ[0] is κ-filtered for every infinite regular κ.
- The empty simplicial set is not κ-filtered.
- The nerve of the discrete category on two objects is not ω-filtered.

*Needs:* `join`; Mathlib `Cardinal.IsRegular`.

**Accessible and presentable quasicategories** (`IsPresentable`). Fix universes with C in u + 1 and locally u-small, and an infinite regular cardinal κ. An object c is κ-compact when C admits κ-filtered colimits and Map(c, −) preserves them. C is κ-accessible when it admits κ-filtered colimits and is generated under them by a u-small full subcategory of κ-compact objects; a functor is accessible when it preserves κ-filtered colimits for some regular κ. C is presentable when it is κ-accessible for some κ and admits all u-small colimits. Compactness is a condition on mapping spaces, not on homotopy classes; presentable never means ω-compactly generated. The ∞-categories PrL and PrR of presentable categories, and the characterisation of presentable categories as accessible localizations of presheaf categories, are targets of Layer E5:presentability. (HTT Definition 5.3.4.5, PDF p. 414; Definition 5.4.2.1 and Proposition 5.4.2.2, PDF pp. 441–442; Definition 5.5.0.1, PDF p. 474.)

Provide `IsKappaCompact`, `IsKappaAccessible`, `IsAccessible`, `IsAccessibleFunctor`, `IsPresentable` and `presentable_universe` (all diagrams and generating families are u-small; a change of universe is an explicit comparison).

**Checks.**

- In Spaces the point is ω-compact: Map(∗, −) is the identity.
- In Spaces the discrete space ℕ is not ω-compact: its identity does not factor through any finite subset in the presentation ℕ = colim of its finite subsets.
- Δ[0] is presentable and its unique object is compact.
- (With Layer E1.) A finite free R-module in degree zero is compact in D(R), while ⊕_{n∈ℕ} ℤ[0] is not compact in D(ℤ): its identity does not factor through a finite subsum.

*Needs:* `IsEnhancedLimit`, `IsEnhancedColimit`; `rightMappingSpace_isKan`; `IsLocallySmall`; `IsKappaFiltered`.

### Examples

- The one-object dg algebras ℤ and ℤ ⊕ ℤε (ε in cohomological degree −1, ε² = dε = 0) have the same homotopy category but different dg nerves: the second has π₁ = ℤ in its self-mapping space. This single example tests `IsCategoricalEquivalence`, `dgNerve_rightMappingSpaceIso` and the convention that negative cohomology appears as positive homotopy.
- In the dg nerve of cochain complexes of abelian groups, ΣA = A[1] sits in degree −1 and the cofibre of p : ℤ → ℤ is the two-term complex [ℤ → ℤ] in degrees −1 and 0, quasi-isomorphic to ℤ/p[0].
- Map_{Cat∞}(Δ[0], Δ[1]) has two components while Fun(Δ[0], Δ[1]) is contractible; the core in the definition of Cat∞ is what separates them.

### Dependencies

Mathlib (simplicial sets, quasicategories, Kan complexes, the homotopy bicategory of quasicategories, the simplicial nerve, Dold–Kan, pretriangulated categories and shifts); `TauCetiRoadmap.DGAInfinity` Layers 0 and 1. No other layer of this roadmap.

## Layer E1: Unbounded derived sheaves and presentability

This layer constructs the enhanced unbounded derived category D∞(O) of module sheaves on a small ringed site, as the dg nerve of a K-injective model, and identifies its homotopy category with Mathlib's `DerivedCategory`. It then builds the operations on it: derived tensor product through K-flat replacement, internal Hom, pullback and pushforward along morphisms of ringed topoi, change of coefficients and the action of perfect complexes. It also contains the algebra that later layers need about regular rings and perfect 𝔽_p-algebras (the global dimension of regular rings, Kunz's theorem in both directions, Tor independence, Tor and global dimension after perfection), the Koszul complex, quasicoherent derived sheaves on schemes and derived base change for perfect schemes. Throughout, a small ringed site is a small site with a sheaf of commutative rings O; Mathlib's `SheafOfModules O` is the category of O-modules and its Grothendieck abelian instance is used as it stands.

### E1.1 Complexes of module sheaves as a dg category

**Slice-free module sheaves** (`SheafOfModules.sliceFree`). For an object U of a small ringed site, O_U = j_{U!}(O|_U) is the sheafification of the presheaf of O-modules freely generated by the representable presheaf of U. It represents sections: Hom(O_U, F) ≅ F(U), naturally in F and in U. Each O_U is flat, and the O_U for U in the site form a generating family of `SheafOfModules O`. (Stacks, Modules on Sites, Section 18.19, tag 03DH: Lemma 18.19.2, tag 03DI, for the adjunction j_{U!} ⊣ j_U^∗ and Lemma 18.19.3, tag 03DJ, for exactness of j_{U!}; Lemma 18.28.7, tag 03EV, for flatness. The generating property follows from Hom(O_U, F) ≅ F(U), since a sheaf with no nonzero local sections is zero.)

Provide `sliceFree`, `sliceFree_homEquiv` (the representing bijection), `sliceFree_flat` and `sliceFree_isSeparating`. Mathlib supplies the presheaf version, `PresheafOfModules.freeYoneda` with `PresheafOfModules.freeYonedaEquiv` and `PresheafOfModules.freeYoneda.isSeparating`; `sliceFree U` is the image of that free presheaf under `PresheafOfModules.sheafification`, so `sliceFree_homEquiv` and `sliceFree_isSeparating` come from the presheaf statements through `PresheafOfModules.sheafificationAdjunction`. Mathlib's `SheafOfModules.free` (sums of copies of the unit) does not give this family over objects of the site.

**Checks.**

- For U the final object of the site (when it exists), O_U is the unit O.
- For the one-point site with ring R, O_U is R.
- O_U ⊗ F is the extension by zero of F|_U, so its global sections need not be F(U); the representing property is about Hom out of O_U, not about global sections of O_U ⊗ F.

*Needs:* Mathlib `SheafOfModules`, `SheafOfModules.free`, `PresheafOfModules.freeYoneda`, `PresheafOfModules.freeYonedaEquiv`, `PresheafOfModules.sheafification`, `PresheafOfModules.sheafificationAdjunction`, `CategoryTheory.Sheaf`.

**The dg category of complexes of module sheaves** (`sheafComplexDG`). For a small ringed site, the unbounded cochain complexes of `SheafOfModules O` form a dg category through Tau Ceti's linear Hom-complex enrichment (`TauCeti.linearHomComplexEnrichedCategory`). After the homological reindexing Hom_m(F, G) = Hom^{−m}(F, G) and the Koszul braiding that converts Mathlib's forward composition order into Lurie's, it is the dg category of HA Definition 1.3.2.1, so `dgNerve` applies to it. (HA Definition 1.3.2.1 and Remark 1.3.2.2, p. 88.)

**Checks.**

- Closed degree-zero elements of the Hom complex are exactly the cochain maps.
- Two cochain maps differ by a homological degree-one boundary exactly when they are chain homotopic.
- The underlying ordinary category is Mathlib's category of cochain complexes in `SheafOfModules O`.

*Needs:* `dgNerve`; Mathlib `SheafOfModules`, `CategoryTheory.IsGrothendieckAbelian`, `CategoryTheory.Preadditive`; Tau Ceti `TauCeti.linearHomComplexEnrichedCategory`; `TauCetiRoadmap.DGAInfinity` Layer 0 (grading reindexing and braiding).

### E1.2 K-injective and K-flat replacements

**Unbounded K-injective replacement** (`kInjectiveReplacement`). Let A be a Grothendieck abelian category in a fixed universe. Every unbounded complex K admits a monomorphic quasi-isomorphism K → J(K) with J(K) a K-injective complex of injectives (Mathlib's `CochainComplex.IsKInjective`), functorially in K. More precisely, the injective model structure on complexes of A (weak equivalences the quasi-isomorphisms, cofibrations the monomorphisms) exists and is combinatorial, its fibrant objects are the K-injective complexes of injectives, and one regular cardinal, depending on A only, bounds the generating lifting problems. (HA Proposition 1.3.5.3, Warning 1.3.5.4, Remark 1.3.5.5, Proposition 1.3.5.6, Corollary 1.3.5.7 and Lemma 1.3.5.11, pp. 121–126.)

Provide `kInjectiveReplacement` (the functorial replacement with its natural quasi-isomorphism) and `kInjectiveReplacement_exists` (its objectwise consequence: every complex has a quasi-isomorphism to a K-injective complex).

**Checks.**

- The replacement applies to complexes with nonzero terms in arbitrarily negative degrees.
- A quasi-isomorphism between K-injective complexes is a homotopy equivalence.
- The cardinal bound is fixed by the site and the ring; it is not chosen separately for each map.

*Proof route.* Use a generator and the AB5 axiom to choose a regular cardinal bounding small subcomplexes closed under the differential; run the small-object argument for the injective model to factor K → 0; identify the fibrant objects by Hom from acyclic complexes and termwise injectivity. Functoriality comes from the fixed generating set.

*Needs:* `sheafComplexDG`; Mathlib `CochainComplex.IsKInjective`, `CategoryTheory.IsGrothendieckAbelian`.

**K-flat complexes of module sheaves** (`IsKFlat`). A complex P of O-modules on a small ringed site with O commutative is K-flat when A ⊗_O P is acyclic for every acyclic complex A of O-modules, where ⊗_O is the direct-sum total tensor product of sheaves with the Koszul signs. Termwise flatness is not the definition. (Stacks, Cohomology on Sites, Definition 21.17.2 and Lemmas 21.17.4–21.17.6, tags 06YN, 0E8K, 07A2, 07A3, PDF p. 29.)

Provide `IsKFlat`, `isKFlat_boundedAbove` (bounded above complexes of flat modules are K-flat), `isKFlat_tensor` (the tensor of two K-flat complexes is K-flat) and `isKFlat_quasiIso_tensor` (a quasi-isomorphism between K-flat complexes stays a quasi-isomorphism after tensoring with any complex).

**Checks.**

- O[0] is K-flat.
- A flat module placed in any single degree is K-flat.
- For p prime, (ℤ/p)[0] is not K-flat over ℤ: tensoring it with the acyclic cone of [ℤ →p ℤ] → (ℤ/p)[0] produces nonzero cohomology.

*Needs:* Mathlib `CochainComplex`, `SheafOfModules`, `CategoryTheory.Abelian`, `HomologicalComplex.monoidalCategory`.

**Unbounded K-flat replacement** (`kFlatReplacement`). On a small ringed site every unbounded complex K of O-modules admits a termwise surjective quasi-isomorphism P(K) → K with P(K) termwise flat and K-flat. After fixing a universe and the generating family of slice-free modules, P can be chosen functorially, with cardinality bounded by that of the input, the site, the ring and one regular closure cardinal. Functoriality and the single cardinal bound are part of the statement, not consequences of objectwise existence. (Stacks, Cohomology on Sites, Lemmas 21.17.8–21.17.12, tags 06YQ, 06YR, 077J, 06YS, 06YT, PDF pp. 30–31.)

**Checks.**

- No lower bound on K is assumed.
- The tensor of two replacements computes the derived tensor, and changing either replacement changes the result by a quasi-isomorphism.
- For K = 0, H^i(P(0)) = 0 for every integer i, as required by the quasi-isomorphism P(0) → 0.

*Proof route.* Cover each module by the sum of slice-free modules over all its local sections, resolve the bounded-above truncations by these flat covers, and arrange the resolutions in a staircase with degreewise split injective transitions. Its filtered colimit is K-flat (AB5) and resolves K. Taking the sum over all sections, rather than a choice, makes the construction functorial.

*Needs:* `IsKFlat`; `sliceFree`; `sheafComplexDG`.

### E1.3 The enhanced derived category

**The enhanced derived category** (`enhancedDerived`). For a Grothendieck abelian category A, D∞(A) is the dg nerve of the full dg subcategory of K-injective complexes of injectives. For a ringed site, D∞(O) = D∞(`SheafOfModules O`). Its homotopy category is equivalent to Mathlib's `DerivedCategory A`, through the localization at quasi-isomorphisms, sending a complex to its K-injective replacement; more precisely, the functor from the nerve of complexes to D∞(A) is a Dwyer–Kan localization at the quasi-isomorphisms (`IsDwyerKanLocalization`; HA Proposition 1.3.5.15). Map(K, L) is the Dold–Kan image of the good connective truncation of the derived Hom complex, so π_i Map(K, L) = H^{−i} RHom(K, L) for i ≥ 0. D∞(A) is stable, with suspension and cofibres given by Mathlib's shift and mapping cone. (HA Definition 1.3.5.8 and Propositions 1.3.5.9 and 1.3.5.15, pp. 124–127.)

Provide `enhancedDerived`, `enhancedDerived.homotopyCategory` (the equivalence with `DerivedCategory A`), `enhancedDerived.mappingSpaces` (the Dold–Kan formula and π_i = H^{−i} RHom), `enhancedDerived.isStable` (with the sign comparison of `dgNerve_shift_cone_comparison`) and `enhancedDerived.detection` (a map of complexes becomes an equivalence exactly when it is a quasi-isomorphism, and equivalences are detected by all integer cohomology objects, as in Mathlib's `DerivedCategory.isIso_iff`).

**Checks.**

- The zero complex is a zero object and its self-mapping space is contractible.
- For p prime, Map(ℤ/p, ℤ/p[1]) in D∞(ℤ) has π₀ = Ext¹(ℤ/p, ℤ/p) = ℤ/p and π₁ = Hom(ℤ/p, ℤ/p) = ℤ/p; a discrete set of maps would lose π₁.
- The equivalence of homotopy categories carries the class of a map of complexes to `DerivedCategory.Q.map` of that map.

*Proof route.* Compare the nerve of complexes localized at quasi-isomorphisms with the dg nerve of fibrant complexes: K-injective replacement gives essential surjectivity and the Hom-acyclicity of K-injectives gives full faithfulness on mapping spaces. Identify the ordinary localization with Mathlib's `DerivedCategory`; zero objects, cones and shifts give stability.

*Needs:* `kInjectiveReplacement`; `sheafComplexDG`; `dgNerve`; `IsDwyerKanLocalization`; `dgNerve_rightMappingSpaceIso`; `dgNerve_shift_cone_comparison`; `IsStable`; Mathlib `DerivedCategory`, `DerivedCategory.isIso_iff`, `DerivedCategory.isIso_Q_map_iff_quasiIso`.

**Presentability of unbounded derived sheaves** (`enhancedDerived_isPresentable`). For a small ringed site, D∞(O) is presentable. The localization functor from complexes inverts exactly the quasi-isomorphisms and is accessible. Filtered colimits in D∞(O) are computed by degreewise filtered colimits of complexes, and cohomology commutes with them. The shifts of the slice-free modules form a small family detecting zero objects, which becomes a family of κ-compact generators for a sufficiently large regular κ. This asserts accessibility, not compact generation: on a general site the generators need not be ω-compact, and D∞(O) need not be left complete. (HA Proposition 1.3.5.21 and Warning 1.3.5.22, pp. 128–130.)

**Checks.**

- Infinite coproducts are computed by degreewise direct sums of complexes.
- The existence of a sheaf generator does not make it ω-compact: on the site of a profinite group with infinite cohomological dimension, presentability holds while left completeness fails.

*Proof route.* Identify D∞(O) with the underlying ∞-category of the combinatorial injective model; its small generating cofibrations give an accessibility cardinal. AB5 identifies filtered homotopy colimits with degreewise colimits. The slice-free generators and their shifts detect cohomology; choose κ so that their derived mapping functors preserve κ-filtered colimits.

*Needs:* `enhancedDerived`; `kInjectiveReplacement`; `sliceFree_isSeparating`; `IsDwyerKanLocalization`; `IsPresentable`; Mathlib `CategoryTheory.IsGrothendieckAbelian`.

### E1.4 Tensor, internal Hom, pullback, pushforward and change of coefficients

**Derived sheaf tensor** (`derivedTensor`). For a sheaf of commutative rings O, define K ⊗ᴸ_O L as the total tensor product of K-flat replacements, transferred through the localization to D∞(O), with differential d(x ⊗ y) = dx ⊗ y + (−1)^{deg x} x ⊗ dy. It is a functor D∞(O) × D∞(O) → D∞(O) of ∞-categories, independent of the replacements, with natural associativity, unit (O[0]) and symmetry equivalences, and it preserves small colimits separately in each variable. The full symmetric monoidal ∞-category structure, with all higher coherences, is `derivedTensor_symmetricMonoidal` of Layer E5:abstract. On a scheme its homotopy-category shadow is the derived tensor product of `TauCetiRoadmap.SchemeAndStackFoundations` §2.18; the target here is the functor of ∞-categories on an arbitrary small ringed site. K-injective complexes are not used for the tensor product, since they need not be closed under it. (Stacks, Cohomology on Sites, Lemmas 21.17.5 and 21.17.12 and Definition 21.17.13, tags 07A2, 06YT, 06YU, PDF pp. 29–31; Liu–Zheng §3.1–§3.2, Proposition 3.1.3 and Lemma 3.2.2, pp. 84–87.)

Provide `derivedTensor`, `derivedTensor_map` (functoriality in pairs of maps), `derivedTensor_unit` (O[0] is a unit; the associativity and Koszul symmetry equivalences are natural), `derivedTensor_ordinary` (on homotopy categories it is the K-flat derived tensor) and `derivedTensor_colimits`.

**Checks.**

- O[0] ⊗ᴸ K ≃ K.
- Over ℤ, (ℤ/p) ⊗ᴸ (ℤ/p) has cohomology ℤ/p in degrees −1 and 0 and nothing else.
- For a flat module F in degree zero, F ⊗ᴸ K is the ordinary tensor F ⊗ K.
- Interchanging two homogeneous elements of degree one introduces the sign −1.

*Proof route.* Tensoring a quasi-isomorphism between K-flat complexes with a K-flat complex gives a quasi-isomorphism, so the total tensor product of K-flat complexes descends to the localization at quasi-isomorphisms, which is D∞(O) because every complex has a K-flat replacement; compare with the K-injective model through `enhancedDerived`. Liu–Zheng build the coherent structure for topoi with enough points; no enough-points hypothesis is imposed here, because the higher coherences come from the monoidal Dwyer–Kan localization of Layer E5:abstract, which needs only the tensor-stability of quasi-isomorphisms between K-flat complexes.

*Needs:* `IsKFlat`; `kFlatReplacement`; `enhancedDerived`; `enhancedDerived_isPresentable`; `restrictedStraightening`; Mathlib `CategoryTheory.MonoidalCategory`, `HomologicalComplex.monoidalCategory`.

**Derived internal Hom** (`derivedInternalHom`). For K, L in D∞(O), RℋOM_O(K, L) is the right adjoint in L to − ⊗ᴸ K, with a natural equivalence Map(M ⊗ᴸ K, L) ≃ Map(M, RℋOM(K, L)). It is computed by the sheaf Hom complex into a K-injective replacement of L; its global sections give the derived Hom complex of `enhancedDerived.mappingSpaces`, and restriction to a slice commutes with it. On a scheme its homotopy-category shadow is the internal Hom of `TauCetiRoadmap.SchemeAndStackFoundations` §2.18. (HTT Proposition 5.5.2.2 and Corollary 5.5.2.9, PDF pp. 481–484; ECD Lemma 17.8, p. 100.)

Provide `derivedInternalHom`, `derivedInternalHom_mapEquiv`, `derivedInternalHom_unit` (RℋOM(O, L) ≃ L) and `derivedInternalHom_ordinary` (its homotopy-category shadow is the K-injective derived sheaf Hom).

**Checks.**

- RℋOM(0, L) ≃ 0 and RℋOM(K, 0) ≃ 0.
- RℋOM(O, L) ≃ L.
- Over ℤ, RHom(ℤ/p, ℤ) is ℤ/p in degree 1 and zero elsewhere.

*Proof route.* The ordinary tensor–Hom adjunction for a K-flat first argument and a K-injective second argument descends to equivalences of all derived mapping spaces; the slice-free generators prove compatibility with restriction. The presentable adjoint functor theorem gives a second construction.

*Needs:* `derivedTensor`; `kInjectiveReplacement`; `enhancedDerived`; `sliceFree`.

**Enhanced pullback and pushforward of ringed topoi** (`enhancedPullback`, `enhancedPushforward`). For a morphism of ringed topoi f : (Y, S) → (X, R) with ring map f^{−1}R → S, define Lf^∗K = S ⊗ᴸ_{f^{−1}R} f^{−1}K and Rf_∗ by K-injective right derivation of f_∗. They form an adjunction on D∞, with Map_Y(Lf^∗K, L) ≃ Map_X(K, Rf_∗L); for S = f^{−1}R, Lf^∗ is the exact inverse image; and composites of ringed morphisms give coherent composition equivalences. For a morphism of schemes the homotopy-category shadows are `derivedPullback` and `totalDirectImage` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.18. (Stacks, Cohomology on Sites, Lemmas 21.18.1–21.18.3, tags 0G7E, 06YY, 0D6D, PDF pp. 33–34; Lemmas 21.19.1–21.19.2, tags 07A6, 0D6E, PDF p. 37, the second for composites; Lemma 21.20.2, tag 0D6F, PDF pp. 40–41, for cohomology on a slice; Liu–Zheng §3.2, pp. 85–87.)

Provide `enhancedPullback`, `enhancedPushforward`, `enhancedPullPush_mapEquiv`, `enhancedPullback_comp` (coherent composition with its associativity) and `enhancedPullback_constant` (agreement with the exact inverse image when S = f^{−1}R). A right adjoint preserves K-injectives when its left adjoint is exact (slice restriction, unchanged coefficients), but general ringed pushforward does not: restriction of scalars from ℤ/p to ℤ does not preserve injectives.

**Checks.**

- For the identity morphism both functors are the identity.
- For the point topos and ℤ → ℤ/p, pullback is derived extension of scalars and pushforward is restriction of scalars.
- Pulling back (ℤ/p)[0] along ℤ → ℤ/p gives cohomology in degrees −1 and 0; the underived extension of scalars is not enough.

*Needs:* `kFlatReplacement`; `kInjectiveReplacement`; `derivedTensor`; `coherentFun`; Mathlib `SheafOfModules`, `SheafOfModules.pushforward`, `SheafOfModules.pullback`.

**Change of coefficients and the action of perfect complexes** (`enhancedCoeffChange`). For a map of sheaves of commutative rings R → S on one topos, derived extension of scalars − ⊗ᴸ_R S is left adjoint to restriction of scalars, with coherent identities and composites. The D∞(R)-action on its module categories restricts to Perf(R), the smallest stable idempotent-complete subcategory containing R. For an exact functor with coherent R-linear structure, compatibility with the Perf(R)-action follows from finite sums, cones, shifts and retracts. (Liu–Zheng Lemma 3.2.8, pp. 87–88.)

Provide `enhancedCoeffChange`, `enhancedCoeffChange_comp` ((K ⊗ᴸ_R S) ⊗ᴸ_S T ≃ K ⊗ᴸ_R T coherently), `enhancedCoeffChange_ordinary` (restriction agrees with Mathlib's `SheafOfModules.restrictScalars` in degree zero) and `perfectAction_exactFunctor`.

**Checks.**

- Changing coefficients along the identity R → R is the identity.
- R^r[0] ⊗ᴸ_R S ≃ S^r[0].
- Tensoring with R[1] is the suspension, and an exact R-linear functor commutes with it.

*Needs:* `enhancedPullback`; `derivedTensor`; `IsStable`; Mathlib `SheafOfModules.restrictScalars`.

### E1.5 Koszul complexes

**Koszul complexes** (`koszulComplex`). For a commutative ring A, an A-module E and a linear map φ : E → A, the Koszul complex K_A(φ) is the cochain complex with K^{−q} = ⋀^q_A E for q ≥ 0 and zero in positive degrees, with differential

```text
d(e₁ ∧ ⋯ ∧ e_q) = Σ_{j=1}^{q} (−1)^{j−1} φ(e_j) e₁ ∧ ⋯ ∧ ê_j ∧ ⋯ ∧ e_q.
```

Exterior multiplication makes it a commutative dg A-algebra. For a finite sequence f = (f₁, …, f_r), K_A(f) is the case E = A^r, φ(e_i) = f_i; it lives in degrees [−r, 0] and augments to A/(f). E is arbitrary; boundedness and perfectness are asserted for finite projective E. (Stacks, More on Algebra, §29, Definitions 29.1–29.2 and Lemmas 29.3–29.12, tags 0622, 0623, 0624, 0663, 0664, pp. 69–72; Lemma 31.2, tag 062F, p. 76.)

Provide `koszulComplex`, `koszulComplex_degree` (degree −q is Mathlib's q-th exterior power), `koszulComplex_differential`, `koszulComplex_map` (ψ : E → E′ with φ′ψ = φ induces a dg algebra map, functorially), `koszulComplex_tensor` (concatenating sequences corresponds to the signed tensor product), `finiteKoszulComplex`, `koszulComplex_augmentation`, `koszulComplex_regular` (for a regular sequence in Mathlib's sense, `RingTheory.Sequence.IsRegular`, the augmentation is a quasi-isomorphism) and `koszulComplex_nullHomotopy` (wedging with e is a null-homotopy of multiplication by φ(e)).

**Checks.**

- The empty sequence gives A in degree zero.
- For a prime p, K_ℤ(p) = [ℤ →p ℤ] resolves ℤ/p, with no cohomology in degree −1.
- For any nonzero A, K_A(0) has H^{−1} = A and H⁰ = A; it is not A[0].
- For one element f the differential in degree −1 is multiplication by f, not zero.

*Proof route.* The contraction is alternating, including the relation e ∧ e = 0 in characteristic two, so it descends through Mathlib's universal property of exterior powers (`exteriorPower.alternatingMapLinearEquiv`); the two terms deleting a given pair cancel, so d² = 0. The Leibniz rule and functoriality are checked on decomposable wedges. For finite sequences, identify the complex with the tensor product of one-element complexes and prove the regular-sequence statement by induction using the cone of multiplication by f_i.

*Needs:* Mathlib `CochainComplex`, `ExteriorAlgebra.exteriorPower`, `exteriorPower.ιMulti`, `exteriorPower.alternatingMapLinearEquiv`, `HomologicalComplex.monoidalCategory`, `RingTheory.Sequence.IsRegular`.

### E1.6 Perfect 𝔽_p-algebras

A perfect 𝔽_p-algebra is a commutative ring of characteristic p on which Frobenius is bijective (Mathlib's `PerfectRing R p`, with inverse roots from `frobeniusEquiv`). The perfection of an 𝔽_p-algebra is the colimit along Frobenius, Mathlib's `PerfectClosure` (as in `TauCetiRoadmap.SchemeAndStackFoundations` §0.24), not Mathlib's inverse-limit `Perfection`. A regular ring is a Noetherian ring all of whose localizations at primes are regular local rings (Mathlib's `IsRegularRing` and `IsRegularLocalRing`).

**Global dimension of regular rings** (`isRegularRing_projectiveDimension_le`, `isRegularLocalRing_of_projectiveDimension_residueField`). Let R be a regular ring of finite Krull dimension d (`IsRegularRing R` and `ringKrullDim R ≤ d`). Then every R-module, finitely generated or not, has projective dimension at most d (`CategoryTheory.HasProjectiveDimensionLE (ModuleCat.of R M) d`). Conversely, a Noetherian local ring whose residue field has finite projective dimension is a regular local ring, of dimension equal to that projective dimension. Hence a Noetherian ring has global dimension d exactly when it is regular of Krull dimension d. (Stacks, Commutative Algebra, Proposition 10.110.1, tag 00O7, Proposition 10.110.5, tag 00OC, and Lemma 10.110.8, tag 00OE; Lemma 10.109.12, tag 065T, reduces arbitrary modules to cyclic ones.)

**Checks.**

- For a field (d = 0) every module is projective.
- Over ℤ (d = 1) every module has projective dimension at most 1, and ℤ/p has projective dimension exactly 1: it is not projective, and [ℤ →p ℤ] resolves it.
- For a field k and R = k[x₁, …, x_d], the residue field at the origin has projective dimension exactly d (its Koszul resolution has length d), so the bound is sharp.
- For the non-regular ring k[ε]/(ε²), of Krull dimension 0, the residue field has infinite projective dimension (its minimal resolution ⋯ → B →ε B →ε B → k never stops), so regularity cannot be dropped.

*Proof route.* By Lemma 10.109.12 it suffices to bound the projective dimension of cyclic, hence finite, modules; projective dimension of a finite module over a Noetherian ring is the supremum over maximal ideals of that of its localizations. Over a regular local ring of dimension d a minimal generating set of the maximal ideal is a regular sequence, its Koszul complex resolves the residue field (`koszulComplex_regular`), so Tor_{d+1}(κ, M) = 0 for every finite M and a minimal free resolution of M stops after d steps. Conversely, finite projective dimension of κ bounds the minimal number of generators of the maximal ideal by the dimension through the Koszul complex of a minimal generating set.

*Needs:* `koszulComplex_regular`; Mathlib `IsRegularRing`, `IsRegularLocalRing`, `ringKrullDim`, `CategoryTheory.HasProjectiveDimensionLE`, `CategoryTheory.Tor`, `RingTheory.Sequence.IsRegular`.

**Kunz's theorem: regular rings have flat Frobenius** (`frobenius_flat_of_isRegular`). Let p be a prime and R a regular ring of characteristic p (`IsRegularRing R`, `CharP R p`). Then the absolute Frobenius R → R, a ↦ a^p (Mathlib's `frobenius R p`), is flat (`RingHom.Flat (frobenius R p)`). With `isRegular_of_frobenius_flat` below this is Kunz's characterisation of regularity in characteristic p. (Stacks, Local Cohomology, Lemma 51.17.6, tag 0EC0, the implication from regularity to flatness.)

**Checks.**

- For 𝔽_p[t], Frobenius makes the ring a free module over itself with basis 1, t, …, t^{p−1}.
- For a perfect field Frobenius is an isomorphism, hence flat.
- For the non-regular ring 𝔽_p[ε]/(ε²), Frobenius kills ε and is not flat, so regularity cannot be dropped.

*Proof route.* Spec of Frobenius is the identity, and flatness and regularity are both tested at local rings, so assume R local with maximal ideal 𝔪. Frobenius is then a local homomorphism carrying a system of parameters x₁, …, x_d to x₁^p, …, x_d^p, again a system of parameters, so its closed fibre R/F(𝔪)R has dimension zero. R is Cohen–Macaulay (a minimal generating set of 𝔪 is a regular sequence, Stacks, Commutative Algebra, Lemma 10.106.3, tag 00NQ), and a local homomorphism from a regular local ring to a Cohen–Macaulay local ring whose dimensions add up along the closed fibre is flat (miracle flatness, Stacks, Commutative Algebra, Lemma 10.128.1, tag 00R4); this flatness criterion is part of the target.

*Needs:* Mathlib `IsRegularRing`, `IsRegularLocalRing`, `frobenius`, `RingHom.Flat`, `RingTheory.Sequence.IsRegular`; `TauCetiRoadmap.SchemeAndStackFoundations` §0.17 (depth and Cohen–Macaulay modules) and §4.13 (`IsRegular.isCohenMacaulay`).

**Frobenius-root ideals** (`frobeniusRootIdeal`). Let R be a perfect 𝔽_p-algebra and f ∈ R. Put J_f = ⋃_n (f^{1/p^n}) = √(f). The sequential colimit of copies of R, with transition n → n+1 multiplication by f^{1/p^n − 1/p^{n+1}}, maps isomorphically onto J_f by sending a at stage n to f^{1/p^n} a. Hence J_f is flat and J_f² = J_f, also when R has zero divisors. (BS17, proof of Lemma 3.16, p. 14.)

Provide `frobeniusRootIdeal`, `frobeniusRootIdeal_radical` (J_f = √(f)), `frobeniusRootIdeal_root_mem` (every f^{1/p^n} lies in J_f), `frobeniusRootIdeal_colimit` (the colimit presentation) and `frobeniusRootIdeal_flat` (flatness and idempotence).

**Checks.**

- J_0 = 0 in any perfect ring.
- J_1 = R.
- In 𝔽_p[t^{1/p^∞}], t^{1/p} ∈ J_t but t^{1/p} ∉ (t), so J_t is not the principal ideal (t).

*Proof route.* Perfectness gives unique roots; the stage maps are compatible; if f^{1/p^n} a = 0 then taking a p-th root and using reducedness shows that a dies at a later stage, so the map is injective. A filtered colimit of free modules is flat.

*Needs:* Mathlib `PerfectRing`, `frobeniusEquiv`, `Module.Flat`, `CategoryTheory.Limits.HasFilteredColimits`.

**Tor independence of perfect algebras** (`perfectRing_tor_eq_zero`). For maps B ← A → C of perfect 𝔽_p-algebras, Tor_i^A(B, C) = 0 for all i > 0; equivalently B ⊗ᴸ_A C is concentrated in degree zero and equals B ⊗_A C. All three rings must be perfect: the statement is not about arbitrary modules over a perfect ring. (BS17 Lemma 3.16, p. 14; Lemma 11.10, p. 42.)

**Checks.**

- The statement covers perfect quotients that are not flat over A, such as A → A/J_f.
- For the perfect ring R = (k[x, y]/(xy))_perf and the non-perfect R-modules R/(x), R/(y), Tor₂^R can be nonzero (see `perfectRing_tor_dimension_counterexample`).

*Proof route.* Factor A → B as a perfect polynomial extension, which is a filtered colimit of polynomial extensions and hence flat, followed by a quotient by a radical ideal. Write the radical ideal as a filtered colimit of ideals generated by finitely many roots and reduce to one generator J_f; tensor its flat length-one resolution with C and identify the result with the corresponding root ideal of C, which injects into C. No animated ring theory is used.

*Needs:* `frobeniusRootIdeal`; `derivedTensor` (on the point topos); Mathlib `CategoryTheory.Tor`.

**Finite Tor dimension for perfect presentations** (`perfectPresentation_torDimension_le`). If R is perfect and S is the perfection of R[X₁, …, X_n]/(f₁, …, f_m), then S has Tor dimension at most m over R; in particular every perfectly finitely presented map of perfect rings has finite Tor dimension. Likewise R/√(f₁, …, f_m) has Tor dimension at most m over R. (BS17 Remark 3.17, p. 14; Proposition 11.29, pp. 47–48.)

**Checks.**

- m = 0 gives a flat perfect polynomial extension.
- The bound is the number of equations; perfectly finitely presented maps are not claimed to be flat: for R = 𝔽_p[t^{1/p^∞}] and f = t, R/J_t has Tor dimension exactly one, since Tor₁^R(R/J_t, R/(t)) = (t)/tJ_t ≠ 0.

*Proof route.* Perfect polynomial extensions are flat; a quotient by one root ideal has a flat resolution of length one; kill the m generators successively and add the bounds.

*Needs:* `frobeniusRootIdeal`; `perfectRing_tor_eq_zero`; `derivedTensor`.

**Finite global dimension after perfection** (`perfect_projectiveDimension_le`). Let k = (k₀)_perf with k₀ a regular Noetherian 𝔽_p-algebra of finite Krull dimension, and let R be perfectly finitely presented over k. Choose a surjection P = (P₀)_perf → R with P₀ regular Noetherian of dimension d. Then every R-module has projective dimension at most d + 1 (Mathlib's `HasProjectiveDimensionLE`). The number d belongs to the chosen regular presentation, not to R. (BS17 Proposition 11.31 and Remark 11.32, p. 48.)

**Checks.**

- For k a perfect field and R = k the bound is finite (d + 1 with d = 0), while the true global dimension is zero.
- The proof needs the regular presentation and its finite dimension; the bound is not asserted for arbitrary perfect rings.

*Proof route.* Regularity makes the Frobenius steps P_n → P flat (the forward Kunz theorem, Kunz 1969, for regular Noetherian rings of characteristic p). For a P-module M put F_n = M|_{P_n} ⊗_{P_n} P; each has projective dimension at most d and colim F_n = M, and the sequential telescope gives pd_P M ≤ d + 1. Tor independence makes P → R a homological epimorphism, M ≃ M ⊗ᴸ_P R, and transports resolutions to R.

*Needs:* `isRegularRing_projectiveDimension_le`; `frobenius_flat_of_isRegular`; `perfectRing_tor_eq_zero`; `perfectPresentation_torDimension_le`; `enhancedDerived_isPresentable`; Mathlib `IsRegularRing`, `PerfectClosure`, `CategoryTheory.HasProjectiveDimensionLE`, `ModuleCat.projectiveDimension_eq_of_linearEquiv`; `TauCetiRoadmap.SchemeAndStackFoundations` §0.25 (perfectly finitely presented maps).

**Intrinsic Tor bound and its counterexample** (`perfect_torDimension_le_two_mul_dim`, `perfectRing_tor_dimension_counterexample`). Under the hypotheses of the previous target, every R-module has Tor dimension at most 2 dim R. The bound dim R is false: for k perfect and R = (k[x, y]/(xy))_perf, Tor₂^R(R/(x), R/(y)) ≠ 0 although dim R = 1. The source also announces a global-dimension bound 2 dim R + 1 without proof; it is not a target of this roadmap. (BS17 Remark 11.33 and footnotes 24–25, p. 49.)

**Checks.**

- In the counterexample the two modules are ordinary, non-perfect quotient modules.
- The class of y in Ann(x)/y·Ann(x) is nonzero and maps to zero in R/(y); this is the Tor₂ witness.

*Proof route.* Reduce to perfections of complete Noetherian local rings with a regular Noether normalization P₀ → R₀, finite étale away from a nonzero f. Tensoring with the flat idempotent root ideal I_f turns modules into retracts of complexes induced from P; with J = I_f R, the exact sequences relating Tor₁^R(R/J, M), J ⊗ M, JM and M/JM let an induction on the dimension of the quotient give the bound 2 dim R. For the counterexample, Ann(x) is the ideal generated by the positive roots of y.

*Needs:* `perfect_projectiveDimension_le`; `frobeniusRootIdeal`.

**The converse of Kunz's theorem via perfection** (`isRegular_of_frobenius_flat`). A Noetherian 𝔽_p-algebra whose absolute Frobenius is flat is regular (`IsRegularRing`). The forward direction is `frobenius_flat_of_isRegular`, an input to `perfect_projectiveDimension_le`; it is not deduced from this target. (BS17 Corollary 11.35, pp. 49–50; Stacks, Local Cohomology, Lemma 51.17.6, tag 0EC0, proves the same implication by a length count.)

**Checks.**

- For 𝔽_p[t] Frobenius makes the ring a free module of rank p over itself.
- For 𝔽_p[ε]/(ε²) Frobenius is not flat, and the ring is not regular.

*Proof route.* Pass to complete local rings (completion preserves Frobenius flatness) and choose a Cohen presentation. Flat Frobenius makes R → R_perf faithfully flat; finite global dimension of the perfection descends to finite Tor dimension, hence finite projective dimension, of the residue field over R, and `isRegularLocalRing_of_projectiveDimension_residueField` applies.

*Needs:* `perfect_projectiveDimension_le`; `isRegularLocalRing_of_projectiveDimension_residueField`; Mathlib `IsRegularRing`, `frobenius`, `RingHom.Flat`.

### E1.7 Bounded saturated valuation modules

**Bounded saturated valuation modules** (`IsValuationSaturated`). Let K be a complete nonarchimedean field with valuation ring V and maximal ideal 𝔪, and let M ⊆ K^r be a V-submodule. M is bounded when its underlying set is bounded in the sense of Mathlib's `Bornology.IsBounded` (equivalently, by `isBounded_iff_forall_norm_le'`, its coordinates have a common norm bound). M is 𝔪-saturated when the multiplication map M → Hom_V(𝔪, M), x ↦ (a ↦ ax), is bijective. (BS17 Lemma 6.14 and its proof, p. 26.)

Provide `valuationModule_isBounded_iff` (boundedness as one common coordinate bound, using Mathlib's predicate rather than a private one), `valuationSaturationMap`, `IsValuationSaturated` and `valuationSaturation_transport` (both properties transport along V-linear automorphisms of K^r that preserve bounded sets).

**Checks.**

- The zero submodule is bounded and saturated.
- If the value group is all of ℝ_{>0}, a nonzero closed ball of finite radius in K is principal and saturated.
- A nonzero open ball of finite radius is not saturated: Hom_V(𝔪, M) is the closed ball of the same radius.

*Needs:* Mathlib `Bornology.IsBounded`, `isBounded_iff_forall_norm_le'`, `ValuationSubring`.

**Finite freeness of saturated lattices** (`valuationSaturated_finite_free`). If K is spherically complete with value group all of ℝ_{>0}, and M ⊆ K^r is bounded and 𝔪-saturated, then M is a finite free V-module of rank at most r. (BS17 Lemma 6.14 and its proof, p. 26.)

**Checks.**

- r = 0 gives the zero module.
- Without saturation the open unit ball is a bounded, non-principal submodule of K.

*Proof route.* For r = 1 a bounded submodule is an open or a closed ball; saturation excludes the open ball and the value-group hypothesis makes the closed ball principal. For general r intersect with K^{r−1}; spherical completeness gives Ext¹_V(𝔪, V) = 0, hence saturation of the rank-one quotient, and the free quotient splits the extension.

*Needs:* `IsValuationSaturated`.

### E1.8 Quasicoherent derived sheaves and base change

**Quasicoherent derived sheaves** (`QuasicoherentDerived`, `PerfectDerived`). For a qcqs scheme X, Dqc(X) is the full subcategory of D∞(O_X) on the objects whose image in the homotopy category lies in `DQCoh X` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.18 (all cohomology sheaves quasicoherent), and Perf(X) ⊆ Dqc(X) is the full subcategory of complexes locally representable by bounded complexes of finite projective modules. For X = Spec R, Dqc(X) ≃ D∞(R) as ∞-categories, unbounded complexes included; on homotopy categories this is §2.18's `DQCoh.affineEquiv`, and the target is its lift to mapping spaces. (BS17 discussion after Lemma 3.18, p. 15; §11.1, pp. 40–41.)

Provide `QuasicoherentDerived`, `quasicoherentDerived_affine` and `PerfectDerived`. Membership is a condition on objects, so restriction to opens preserves the subcategory by §2.18's `DQCoh.restrict`. Quasicoherence is Mathlib's notion for sheaves of modules on schemes; the affine comparison uses affine acyclicity and the convergence of truncations.

**Checks.**

- O_{Spec R} corresponds to R[0].
- The zero complex is quasicoherent and perfect.
- On Spec ℤ, ⊕_{n∈ℕ} ℤ[0] is quasicoherent but not perfect.

*Needs:* `enhancedDerived`; `enhancedPushforward`; `fullEnhancedSubcategory`; Mathlib `SheafOfModules.IsQuasicoherent`; `TauCetiRoadmap.SchemeAndStackFoundations` §0.4 (quasi-coherent modules and their direct images), §2.6 (quasi-coherent cohomology) and §2.18 (`DQCoh`, `DQCoh.affineEquiv`, `DQCoh.restrict`).

**Derived base change on perfect schemes** (`perfectScheme_baseChange`). For a cartesian square of perfect qcqs 𝔽_p-schemes, X′ = X ×_Y Y′ with maps f : X → Y, g : Y′ → Y, f′ : X′ → Y′ and g′ : X′ → X, the base-change map Lg^∗ Rf_∗ K → Rf′_∗ Lg′^∗ K is an equivalence for every K ∈ Dqc(X). No flatness of g and no boundedness of K is assumed: the square is Tor independent by `perfectRing_tor_eq_zero`, so this is the perfect case of the Tor-independent base change `torIndependent_baseChange` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.18, stated in the enhancement. (BS17 Lemma 3.18, pp. 14–15.)

**Checks.**

- In the affine case X = Spec A, Y = Spec B, Y′ = Spec B′, X′ = Spec A′, the input is A ⊗ᴸ_B B′ ≃ A′, with B as base ring; B carries no A-module structure.
- The analogous square of ordinary schemes Spec 𝔽_p → Spec ℤ ← Spec 𝔽_p is not Tor independent: 𝔽_p ⊗ᴸ_ℤ 𝔽_p has cohomology in degree −1.

*Proof route.* On affines, A ⊗ᴸ_B B′ ≃ A′ by `perfectRing_tor_eq_zero`, so Tor_i^{O_Y}(O_X, O_{Y′}) = 0 for i > 0 everywhere and §2.18's `torIndependent_baseChange` gives the isomorphism on homotopy categories; an isomorphism there is an equivalence in D∞.

*Needs:* `QuasicoherentDerived`; `perfectRing_tor_eq_zero`; `enhancedPullback`, `enhancedPushforward`; `TauCetiRoadmap.SchemeAndStackFoundations` §0.24 (perfect schemes) and §2.18 (`torIndependent_baseChange`).

**The cohomology base-change map** (`cohomologyBaseChange`). For a map of commutative rings A → B and K ∈ D^{≥0}(A), the truncation map H⁰(K)[0] → K induces H⁰(K) ⊗_A B → H⁰(K ⊗ᴸ_A B). It is natural in K and in B, compatible with composite base changes, and an isomorphism when B is flat over A; without flatness it can fail. (Bhatt, *Direct summand*, Lemma 5.3 and proof of Theorem 5.4, pp. 9–10.)

Provide `cohomologyBaseChange`, `cohomologyBaseChange_comp` and `cohomologyBaseChange_flat`.

**Checks.**

- For A → A the map is the identity.
- For K = M[0] it is the usual isomorphism M ⊗_A B ≅ H⁰(M ⊗ᴸ_A B).
- For A = ℤ, B = ℤ/p and K = (ℤ/p)[−1], the source is zero while the target H⁰ is Tor₁^ℤ(ℤ/p, ℤ/p) = ℤ/p.

*Needs:* `enhancedCoeffChange`; Mathlib `CategoryTheory.Triangulated.TStructure.truncLE`, `CategoryTheory.Triangulated.TStructure.truncLEι`.

**Splitting obstructions transported along an exact functor** (`liftingObstruction_map`). For a distinguished triangle A → B → Q →δ A[1] in a pretriangulated category, a map s : M → Q lifts to B exactly when δ ∘ s = 0, and B → Q has a section exactly when δ = 0; both are Mathlib (`CategoryTheory.Pretriangulated.Triangle.coyoneda_exact₃` and `CategoryTheory.Pretriangulated.exists_iso_binaryBiproduct_of_distTriang`). The target is the comparison statement: an exact functor F carries the obstruction δ ∘ s to the obstruction of the image triangle, and vanishing of F(δ ∘ s) implies vanishing of δ ∘ s when F is injective on Hom(M, A[1]). (Bhatt, *Direct summand*, proof of Theorem 5.4, pp. 9–10.)

**Checks.**

- For the split triangle A → A ⊕ Q → Q the connecting map is zero.
- For the triangle of 0 → ℤ →p ℤ → ℤ/p → 0, p prime, the connecting map ℤ/p → ℤ[1] is nonzero and the triangle does not split.
- A functor that kills the obstruction but is not injective on Hom(M, A[1]) (for instance − ⊗ᴸ ℚ on the previous triangle) does not certify a splitting.

*Needs:* `cohomologyBaseChange`; `dgNerve_shift_cone_comparison`; Mathlib `CategoryTheory.Pretriangulated`.

### Examples

- Over ℤ, (ℤ/p) ⊗ᴸ (ℤ/p) has cohomology ℤ/p in degrees −1 and 0, RHom(ℤ/p, ℤ) is ℤ/p[−1], and Map(ℤ/p, ℤ/p[1]) has π₀ = π₁ = ℤ/p: the three basic computations that a wrong derived tensor, internal Hom or mapping space would fail.
- For perfect 𝔽_p-algebras, B ⊗ᴸ_A C = B ⊗_A C; over the imperfect field 𝔽_p(t), the tensor of two copies of its perfection is not even reduced (Layer E5:animation).

### Dependencies

Layer E0. Mathlib (sheaves of modules and their Grothendieck structure, derived categories, K-injective complexes, the monoidal structure on complexes, Tor, projective dimension, exterior powers, regular sequences, regular rings, perfect rings and perfect closures, normed fields); Tau Ceti `TauCeti.linearHomComplexEnrichedCategory`; `TauCetiRoadmap.DGAInfinity` Layer 0; `TauCetiRoadmap.SchemeAndStackFoundations` Layer 0 (§§0.4, 0.17, 0.24–0.25), Layer 2 (§§2.6, 2.18) and Layer 4 (§4.13).

## Layer E3: Coherent diagrams, Kan extensions and adjoints

This layer comes after E1 and before E2 in the build: it uses only Layers E0 and E1, and the sheaves of spaces of Layer E2 use its accessible localizations. It supplies relative left Kan extension along full inclusions, finality of a terminal fibre and the fibrewise criterion for preserving coCartesian edges; space-valued representability, the adjoint functor theorem, accessible localizations and coreflections; limits of presentable categories along left adjoints for the diagram shapes of restricted straightening; the stable criteria for colimit preservation; coherent diagrams of derived categories over diagrams of ringed topoi with their point-free comparison for coefficient towers; coherent mates and Beck–Chevalley transformations; and the compatibility of adjoints with changes of cardinal cutoff.

### E3.1 Kan extensions and finality

**Relative left Kan extension along a full inclusion** (`leftKanExtension_restrict_trivialFibration`). Let i : C₀ → C be the inclusion of a full subcategory of a quasicategory, let p : D → B be a categorical fibration, and fix a functor C → B. A lift F₀ : C₀ → D of the composite extends by relative left Kan extension when, for every c ∈ C, the diagram (C₀)_{/c} → D admits a p-colimit over the given image of the cone point. Then restriction, from the full subcategory of Fun_B(C, D) of relative left Kan extensions to the full subcategory of Fun_B(C₀, D) of extendible F₀, is a trivial Kan fibration. The value at c is that relative colimit, and the space of extensions of a fixed F₀ is contractible. Inner horn lifting alone does not give the trivial fibration; the equivalence-lifting part of a categorical fibration is used. (HTT Definition 4.3.2.2, PDF p. 289; Lemmas 4.3.2.12–4.3.2.13, Proposition 4.3.2.15, Corollary 4.3.2.16 and Proposition 4.3.2.17, PDF pp. 297–303.)

Provide `IsCategoricalFibration` (inner horn lifting together with lifting of every equivalence in B out of the image of a vertex to an equivalence in D) and `IsEnhancedLeftKanExtension` (for a transformation η : F₀ → i^∗F, precomposition with η identifies Map(F, H) with Map(F₀, i^∗H) for every H).

**Checks.**

- The identity of a simplicial set is a categorical fibration, and a quasicategory maps to Δ[0] by a categorical fibration.
- The projection B × C → B of quasicategories is a categorical fibration.
- The nerve of the inclusion of one object into the indiscrete groupoid on two objects is an inner fibration but not a categorical fibration: the equivalence to the missing object has no lift.
- For p : D → ∗ the value at c is colim_{(x → c) ∈ C₀/c} F₀(x); for c ∈ C₀ the slice has the final object id_c, so the extension restricts to F₀.
- For nerves of ordinary categories the absolute statement recovers Mathlib's `CategoryTheory.Functor.IsLeftKanExtension`, with its comma-category formula.

*Proof route.* Build the restriction map on relative functor categories and extend over simplices one at a time, using the prescribed slice colimits and their contractible spaces of choices; HTT 4.3.2.12–4.3.2.13 give the boundary lifting and identify the image.

*Needs:* `overDiagram`, `underDiagram`; `IsEnhancedLimit`, `IsEnhancedColimit`; `coherentFun`; `restrictedStraightening`; Mathlib `CategoryTheory.Functor.IsLeftKanExtension`.

**Finality of a terminal fibre** (`final_fibre_inclusion`). If p : E → B is a coCartesian fibration of quasicategories and b is a terminal object of B, the inclusion of the fibre E_b → E is final. More generally E_b → E ×_B B_{/b} is final. Hence the colimit of a diagram on the latter total category can be computed on E_b, whenever either colimit exists. (HTT Theorem 4.1.3.1, printed p. 236, PDF p. 254, the quasicategorical Theorem A, applied to the comma categories, which have initial objects given by coCartesian transport; Lemma 4.1.3.2 on the same page is the companion statement that a Cartesian fibration with weakly contractible fibres is cofinal.)

**Checks.**

- For an interval-classified functor T : C → D, the terminal fibre D computes colimits over the total category of the coCartesian fibration.
- The initial fibre C is not final in general.

*Proof route.* For x over u, transport x along u → b by a coCartesian edge; this gives an initial object of x/E_b, unique up to contractible choice, and the quasicategorical Theorem A applies. Replace B by B_{/b} for the general statement.

*Needs:* `IsFinal`; `IsWeaklyContractibleSSet`; `IsCoCartesianFibration`; `overDiagram`; `IsEnhancedLimit`.

**The fibrewise criterion for preserving coCartesian edges** (`preservesCoCartesianEdges_iff`). Let E, E′ → B be coCartesian fibrations of quasicategories and F : E → E′ a functor over B. Then F preserves coCartesian edges if and only if, for every a : b → c in B and x ∈ E_b, the comparison a′_! F_b(x) → F_c(a_! x) is an equivalence. Such functors correspond under straightening to coherent natural transformations of the classified diagrams. (HTT Proposition 2.4.4.3, PDF p. 149; §2.4.5 and Theorem 3.2.0.1, PDF pp. 150–155 and 187.)

**Checks.**

- For constant product fibrations B × C → B and B × C′ → B, a fibrewise functor preserves transport edges exactly when its transport comparisons are equivalences.
- A fibrewise functor whose comparison maps are not invertible fails the criterion and does not straighten to a natural transformation.

*Proof route.* Factor the image of a coCartesian lift through a chosen coCartesian lift in E′; the image is coCartesian exactly when the remaining vertical edge is an equivalence. Contractibility of the spaces of lifts makes this independent of choices.

*Needs:* `IsCoCartesianEdge`, `IsCoCartesianFibration`; `restrictedStraightening`; `IsCategoricalEquivalence`.

### E3.2 Representability, adjoints and localizations

**Space-valued representability** (`representable_iff_preservesLimits`). If C is presentable, a functor F : C^{op} → Spaces is representable if and only if it preserves small limits; the space of pairs (representing object, representing equivalence) is contractible. Consequently presentable categories admit all small limits. (HTT Proposition 5.5.2.2 and Corollary 5.5.2.4, PDF pp. 481–482.)

**Checks.**

- Map_C(−, c) is represented by c.
- The statement concerns space-valued functors and all higher homotopy groups, not functors to sets.

*Proof route.* Present C as an accessible localization of a presheaf category; a limit-preserving functor extends to a representable presheaf whose representing object is local, hence lies in C; full faithfulness of Yoneda gives contractible uniqueness.

*Needs:* `IsPresentable`; `coherentFun`; `IsEnhancedLimit`; `spaceInfinity`.

**The adjoint functor theorem** (`adjointFunctorTheorem`). Let F : C → D be a functor between presentable quasicategories. F has a right adjoint if and only if it preserves small colimits; F has a left adjoint if and only if it is accessible and preserves small limits. The adjunction is space-valued, Map_D(Fc, d) ≃ Map_C(c, Gd), and unique up to contractible choice. In particular, a full presentable subcategory whose inclusion preserves colimits has a right adjoint to the inclusion. (HTT Corollary 5.5.2.9, PDF p. 484.)

**Checks.**

- Given an accessibility and colimit-closure hypothesis on the full subcategory of étale objects (supplied by the consuming roadmap), the inclusion has a right adjoint, the coreflection.
- An arbitrary fully faithful inclusion need not have a right adjoint.
- For nerves of ordinary categories it recovers ordinary adjunctions, while the enhanced statement keeps all mapping spaces.

*Proof route.* For d ∈ D represent c ↦ Map_D(Fc, d) to obtain Gd, and assemble G and the adjunction by the coherent Yoneda embedding; for a left adjoint, accessibility reduces the solution-set argument to one regular cardinal. Yoneda gives uniqueness and the triangle coherences.

*Needs:* `representable_iff_preservesLimits`; `IsPresentable`; `coherentFun`; `enhancedDerived_isPresentable` (for the étale check only).

**Accessible localization and coreflection** (`accessibleLocalization`, `presentableCoreflector`). Let C be presentable and S a small set of morphisms. An object x is S-local when Map(v, x) → Map(u, x) is an equivalence for every s : u → v in S. The full subcategory C_S of S-local objects is presentable and its inclusion has an accessible left adjoint L_S. Separately, an accessible full presentable subcategory A ⊆ C closed under small colimits has a right adjoint G to its inclusion. The two directions are stated apart. (HTT Proposition 5.5.4.15, PDF pp. 500–501; Corollary 5.5.2.9, PDF p. 484.)

Provide `IsLocalObject`, `accessibleLocalization` with its unit, `localization_mapEquiv` (for local x, Map(L_S c, x) ≃ Map(c, x)), `presentableCoreflector` and `localization_idempotent` (L_S L_S ≃ L_S, and G i ≃ id_A for the coreflector).

**Checks.**

- For S = ∅, C_S = C and L_S is the identity.
- In a stable C whose generators g detect zero objects, localizing at all maps g → 0 (and their shifts) gives the zero category.
- For a colimit-closed presentable A ⊆ C, Map_C(i a, c) ≃ Map_A(a, Gc); exchanging the two variables gives the wrong adjoint.

*Needs:* `adjointFunctorTheorem`; `rightMappingSpace_isKan`; `IsPresentable`.

**Limits of presentable categories along left adjoints, for restricted shapes** (`presentable_limit_restricted`). Let K be the nerve of a small ordinary category (the bases of `restrictedStraightening`; for instance a discrete category, a pullback shape, N(ℕ^{op}), NΔ or a small poset), and let K → Cat∞ be a diagram of presentable quasicategories and colimit-preserving functors. Its limit, computed as the quasicategory of coCartesian sections, is presentable; the projections preserve colimits and colimits in the limit are computed componentwise. In particular, a coherent inverse limit of D∞(X, R/I^n) along derived scalar extension is presentable. Diagrams indexed by arbitrary small ∞-categories, and stability of the limit, are `presentable_limit` of Layer E5:presentability. (HTT Propositions 5.5.3.12–5.5.3.13 and Corollary 5.5.3.14, PDF pp. 487–488.)

**Checks.**

- A product of a small family of presentable categories is presentable.
- A limit of the homotopy categories does not compute the homotopy category of the limit, and does not supply this result.
- The inclusion of derived complete sheaves into all sheaves can fail to preserve colimits (Layer E4) although the complete category is presentable.

*Proof route.* For a pullback lift objects together with an equivalence of their images, choose a common accessibility cardinal and compute colimits componentwise; build the other shapes from products and pullbacks through the section description.

*Needs:* `IsPresentable`; `restrictedStraightening`; `adjointFunctorTheorem`.

### E3.3 Stable colimits and compact generation

**Exactness and coproducts** (`exact_preservesColimits_iff_coproducts`). Stable quasicategories with small coproducts have all small colimits, and an exact functor between them preserves small colimits if and only if it preserves small coproducts. (HA Proposition 1.4.4.1(1)–(2) and its proof, p. 154.)

**Checks.**

- Derived extension of scalars is exact and preserves coproducts, hence all colimits.
- An exact right adjoint need not preserve coproducts: on D(ℤ), RHom(⊕_{n∈ℕ} ℤ, −) = ∏_ℕ is right adjoint to − ⊗ᴸ ⊕_{n∈ℕ} ℤ and does not commute with infinite direct sums.

*Proof route.* A sequential colimit is the cofibre of 1 − shift on a coproduct; a general colimit is the geometric realization of its simplicial replacement, which is a sequential colimit of finite skeleta. Exactness handles the finite pieces and cofibres; coproduct preservation handles the sums.

*Needs:* `IsStable`; `IsEnhancedColimit`; `coherentFun`.

**The compact-generation criterion for right adjoints** (`rightAdjoint_preservesCoproducts_iff`). Let F : C ⇄ D : G be an adjunction of stable categories with coproducts, with C generated by a small set of compact objects whose shifts detect zero. If F sends the compact generators to compact objects, then G preserves coproducts; conversely, if G preserves coproducts, F sends every compact object to a compact object. Compact generation of C is the detecting hypothesis; presentability alone does not replace it. (Fargues–Scholze Lemma IV.2.20, p. 123, for the first direction on homotopy categories; HTT Proposition 5.5.7.2, printed p. 501, PDF p. 519, for both directions in the accessible form; HA Proposition 1.4.4.1(3), p. 154, for compactness tested against coproducts in a stable category; ECD Proposition 23.7 and its use, pp. 144–145.)

**Checks.**

- For a finite free ring map R → S, restriction of scalars preserves coproducts.
- The test is made against every shift of every compact generator.

*Proof route.* For each shift of a compact generator c compare Map_C(c, ⊕ G y_i) with Map_D(Fc, ⊕ y_i) using the adjunction and compactness; generator detection shows ⊕ G y_i → G(⊕ y_i) is an equivalence. The converse uses the adjunction on any compact c.

*Needs:* `IsPresentable`; `IsStable`; `exact_preservesColimits_iff_coproducts`; `adjointFunctorTheorem`.

### E3.4 Ringed diagrams, coefficient towers and mates

**Coherent diagrams of ringed topoi** (`ringedDiagramDerived`). For a small poset Ξ and a diagram of ringed topoi with enough points indexed by Ξ, localizing the relative diagram of dg-flat complexes at quasi-isomorphisms gives a coherent diagram ξ ↦ D∞(X_ξ, R_ξ) whose transitions are the enhanced derived pullbacks. For a fixed topos X and a diagram of commutative rings Λ : Ξ^{op} → CommRing, D∞(X, Λ) is the enhanced derived category of module sheaves over the ringed topos Fun(Ξ^{op}, X); its Cartesian objects are those whose derived scalar-transition maps are equivalences. The enough-points hypothesis belongs to the flat model used in the source; the point-free coefficient comparison needed later is the next target. (Liu–Zheng Proposition 3.1.3, Definitions 3.2.1 and 3.2.5, Lemmas 3.2.2 and 3.2.10, pp. 84–88.)

Provide `ringedDiagramDerived`, `ringedDiagram_eval` (evaluation at ξ and at each transition), `ringedDiagram_constant` (for constant coefficients D∞(X, Λ_Ξ) ≃ Fun(NΞ^{op}, D∞(X, Λ))) and `ringedDiagram_cartesian` (the full subcategory of Cartesian sections).

**Checks.**

- For Ξ a point the category is D∞(X, R).
- For Ξ = [1] with constant coefficients it is the enhanced arrow category, which retains homotopies of commuting squares.
- For ℤ → ℤ/p, the Cartesian transition of (ℤ/p)[0] is its derived reduction, with cohomology in degrees −1 and 0; the ordinary tensor does not give a Cartesian section.

*Proof route.* Mark quasi-isomorphisms among dg-flat complexes before taking the multisimplicial nerve; pullback preserves marked maps; relative localization and straightening assemble the coherent diagram; compare fibrewise with the K-injective enhancement.

*Needs:* `enhancedPullback`; `kFlatReplacement`; `IsDwyerKanLocalization`; `restrictedStraightening`; `coherentFun`.

**Point-free comparison for coefficient towers** (`ringedSystemComparison`). Let X be a topos presented by a fixed small site and (R_n) an inverse sequence of sheaves of commutative rings on X. The Cartesian full subcategory of the enhanced derived category of R_•-modules on the topos Fun(ℕ^{op}, X) is equivalent, on mapping spaces as well as on objects, to the limit lim_n D∞(X, R_n) along derived scalar extension. No enough-points hypothesis is imposed. (HA Proposition 1.3.4.25, p. 119, for the comparison of coherent and strict diagram categories; BS-proet Definition 3.5.3 and Lemma 3.5.7, pp. 24–25, for the ordinary ringed-system description.)

**Checks.**

- For constant rings this is the constant-diagram comparison of `ringedDiagram_constant`.
- For the tower R/I^n every transition tensor is derived.
- An equivalence of triangulated homotopy categories does not prove the statement.

*Proof route.* Use the injective model for module sheaves on the diagram topos (Layer E1 applies to it, being a ringed topos with a small site) and localize the derived transitions; identify homotopy-coherent Cartesian sections through mapping-space localization (HA 1.3.4.25); prove full faithfulness on mapping spaces and essential surjectivity on systems. The constant-diagram case alone does not give the variable-coefficient one.

*Needs:* `ringedDiagramDerived`; `enhancedDerived`; `enhancedCoeffChange`; `restrictedStraightening`.

**Coherent mates and Beck–Chevalley transformations** (`coherentMate`). For adjunctions L₁ ⊣ R₁ and L₂ ⊣ R₂ between quasicategories and a square α : g L₂ → L₁ h, the mate R₁ g → h R₂ is the pasting of unit, α and counit; it is Mathlib's bicategorical mate (`CategoryTheory.Bicategory.mateEquiv`) in the homotopy bicategory of quasicategories, with vertical pasting `CategoryTheory.Bicategory.mateEquiv_vcomp`. The square satisfies Beck–Chevalley when the mate is invertible. The target is a coherent natural transformation representing this mate, functorial for the ringed-diagram constructions of this section; the finite mate in the homotopy bicategory alone does not provide it. (Liu–Zheng Proposition 2.2.4 and its proof, pp. 79–81.)

Provide `coherentMate` (a coherent representative with its bicategorical class), `beckChevalley` (the representative is invertible exactly when its class is), `coherentMate_pasting` (agreement with `mateEquiv_vcomp`) and `coherentMate_ordinary` (for nerves of ordinary categories it is Mathlib's `CategoryTheory.mateEquiv`).

**Checks.**

- For identity adjunctions the mate of α is α.
- The mate of a vertical composite of two squares is the composite of the two mates, with the prescribed whiskerings.
- For extension and restriction along ℤ → ℤ/p in the self-base-change square, the derived multiplication (ℤ/p) ⊗ᴸ_ℤ (ℤ/p) → ℤ/p has nonzero fibre in degree −1, so the base-change mate is not an equivalence.

*Needs:* `coherentFun`; `ringedDiagramDerived`; Mathlib `SSet.QCat.bicategory`, `CategoryTheory.Bicategory.mateEquiv`, `CategoryTheory.Bicategory.mateEquiv_vcomp`, `CategoryTheory.mateEquiv`.

**Adjoints at cardinal cutoffs** (`cutoffRightAdjoint_compat`). Let (D_κ) be a filtered system of presentable categories with fully faithful transition functors, C a fixed presentable category, and i_κ : C → D_κ compatible colimit-preserving functors with right adjoints G_κ. Then G_λ restricted along D_κ → D_λ is naturally equivalent to G_κ, with all coherences for three cutoffs, and the G_κ assemble on the objects lying in some cutoff. If the source also varies as C_κ, one needs in addition that G_λ sends D_κ into the essential image of C_κ; without it compatibility fails. (ECD Lemma 17.1 and Corollary 17.2, pp. 96–97.)

**Checks.**

- With a fixed source, the étale coreflections at two cutoffs are compatible.
- A larger ambient site does not by itself put the value of a varying-source right adjoint in the smaller category.

*Proof route.* For y ∈ D_κ, G_κ y and G_λ y represent the same functor on C by adjunction and full faithfulness; Yoneda gives the comparison, and its contractible uniqueness gives the coherences.

*Needs:* `adjointFunctorTheorem`; `coherentFun`; `ringedDiagramDerived`.

### Examples

- For the inclusion of the full subcategory C₀ = {0} into N([1]) and p : D → ∗, the left Kan extension of an object d is the constant arrow d → d, as the slice (C₀)_{/1} has final object 0 → 1.
- The base-change mate for ℤ → ℤ/p fails to be an equivalence exactly because Tor₁^ℤ(ℤ/p, ℤ/p) ≠ 0, the same class that makes (ℤ/p)[0] non-Cartesian under the underived transition.

### Dependencies

Layers E0 and E1. Mathlib (Kan extensions, the bicategorical and ordinary mate correspondences, the homotopy bicategory of quasicategories).

## Layer E2:towers: Coherent towers and pro-towers

This short layer holds the inverse-limit constructions that use only Layers E0 and E1: the coherent derived limit of a tower in a stable category, pro-zero towers and pro-isomorphisms, and the multiplicative filtration of derived limits used to bound descendability indices. It precedes Layer E5:descent, which uses it, and Layer E2, which uses both.

### E2:towers.1 Derived limits of towers

**Coherent inverse towers and the product–difference formula** (`derivedTowerLimit`). Let C be a stable quasicategory with countable products and K : N(ℕ^{op}) → C a coherent tower. Its limit is

```text
Rlim_n K_n = fib( 1 − s : ∏_n K_n → ∏_n K_n ),
```

where the n-th component of s is the transition K_{n+1} → K_n after projection. The fibre carries compatible projections Rlim K → K_n, and Map(z, Rlim K) ≃ lim_n Map(z, K_n) for every z: it is the limit of Section E0.4. A strict tower of complexes or modules gives a coherent tower by localization; an arbitrary diagram in the homotopy category is not substituted for a coherent tower. (Stacks, Derived Categories, Definition 13.34.1, Lemma 13.34.2 and Remark 13.34.4, tags 08TC, 07KC, 0H9J, PDF pp. 105–106; Cohomology on Sites, Lemma 21.23.1, tag 0941, PDF pp. 47–48; Bhatt, *Direct summand*, §3, Definition 3.2 and Lemma 3.4, p. 6, in the almost setting.)

Provide `coherentTower` (the functor quasicategory Fun(N(ℕ^{op}), C)), `towerDifference` (the endomorphism 1 − s of the product), `derivedTowerLimit`, `derivedTowerLimit_projection` and `derivedTowerLimit_mapEquiv`.

**Checks.**

- The constant tower with identity transitions has Rlim ≃ K.
- If every transition is zero then 1 − s is the identity and Rlim = 0.
- For p prime, the tower ℤ ←p ℤ ←p ⋯ has lim = 0 and lim¹ = ℤ_p/ℤ, so its derived limit is (ℤ_p/ℤ)[−1], nonzero in cohomological degree 1.

*Needs:* `IsStable`; `IsEnhancedLimit`; `coherentFun`; `enhancedDerived`.

**Products of lim¹ classes in a sequential limit** (`towerLimit_lim1_mul_eq_zero`). Let C be a stable symmetric monoidal quasicategory whose tensor is exact in each variable, A ∈ C, and (F_i) an ℕ-indexed sequence with colimit F. The Milnor sequence

```text
0 → lim¹_i π₁ Map(F_i, A) → π₀ Map(F, A) → lim_i π₀ Map(F_i, A) → 0
```

is exact, and the map π₀ Map(F^{⊗m}, A) × π₀ Map(F^{⊗m}, A) → π₀ Map(F^{⊗2m}, A) induced by tensoring and multiplication A ⊗ A → A, for A an algebra, sends a pair of classes in the lim¹ subgroups to zero, because it factors through a lim² term, and lim² vanishes for ℕ-indexed towers. (BS17 proof of Lemma 11.22, p. 44.)

**Checks.**

- If every F_i is zero then all terms vanish.
- For a constant sequence the lim¹ term is zero.
- The argument uses ℕ-indexing only through lim² = 0; it does not apply as stated to towers of cohomological dimension two or more (see the next target).

*Needs:* `derivedTowerLimit`; `IsStable`; Mathlib `CategoryTheory.MonoidalCategory`.

**Multiplicative derived-limit filtration for finite cohomological dimension** (`derivedLimitFiltration`). Let I be a small filtered category such that lim^s over I^{op} of diagrams of abelian groups vanishes for s > d. Let C be a stable quasicategory with I^{op}-indexed limits, X : I^{op} → C a diagram and z an object. Then the abelian groups π_∗ Map(z, lim X) carry a filtration F^s, functorial in z and X, whose graded pieces are subquotients of lim^s_{I^{op}} π_{∗+s} Map(z, X_i); hence F^{d+1} = 0. If C is symmetric monoidal with tensor exact in each variable, the pairing on mapping groups induced by the tensor product is filtered, F^s · F^t ⊆ F^{s+t}, so a product of d + 1 classes in F¹ vanishes. For I = ℕ this is `towerLimit_lim1_mul_eq_zero` with d = 1. (BS17 Lemma 11.22, p. 44, which proves the sequential case and leaves the general case to the reader.)

**Checks.**

- For I = ℕ, d = 1 and the statement reduces to the vanishing of products of two lim¹ classes.
- For I a point, d = 0 and F¹ = 0.
- Without the bound d the filtration need not be finite, and a product of classes of positive filtration need not vanish.

*Proof route.* Write lim X as the totalization of the cosimplicial replacement and filter by the totalization degree; the E₂-page is lim^s π_t X. External products of cosimplicial replacements are compatible with the Alexander–Whitney pairing of totalizations, which is filtered.

*Needs:* `derivedTowerLimit`; `IsEnhancedLimit`; `IsStable`.

### E2:towers.2 Pro-zero towers

**Pro-zero towers and pro-isomorphisms** (`IsProZero`, `IsProIsomorphism`). An ordinary tower M of modules (or of module sheaves) is pro-zero when for every n there is m ≥ n such that the transition M_m → M_n is zero. A morphism of ordinary towers is a pro-isomorphism when its kernel and cokernel towers are pro-zero. For a morphism of coherent derived towers, the condition is that every cohomology tower of its cone is pro-zero; the stage at which a cohomology tower dies may depend on the degree, and a vanishing stage uniform in all degrees is a stronger condition that is not part of the definition. Pro-zero is a condition on transition maps, not on the limit. (Bhatt, *Direct summand*, Definition 3.2 and Lemmas 3.4–3.6, p. 6, which treat the almost version, where a later transition is killed by every t^{1/p^k} instead of being zero; Lemma 5.3, p. 9, for a pro-isomorphism of Noetherian Hom towers.)

Provide `IsProZero`, `IsProIsomorphism`, `pMultiplicationTower` (the tower ℤ ←p ℤ ←p ⋯, the basic non-example), `proZero_cofinal` (invariance under cofinal monotone reindexing) and `proIso_comp` (composition and two-out-of-three).

**Checks.**

- The zero tower is pro-zero.
- An arbitrary family of nonzero modules with zero transitions is pro-zero.
- The tower ℤ with all transitions multiplication by p is not pro-zero (no transition into a fixed stage is zero) although its limit is zero.

*Needs:* `derivedTowerLimit`; Mathlib `CategoryTheory.Abelian`.

### Examples

- The tower ℤ ←p ℤ ←p ⋯ separates three notions: its limit vanishes, its derived limit does not (lim¹ = ℤ_p/ℤ), and it is not pro-zero. The tower with all transitions zero is pro-zero with Rlim = 0.

### Dependencies

Layers E0 and E1. Mathlib (abelian categories, monoidal categories).

## Layer E5:abstract: The monoidal stable categorical baseline

This layer gives the higher algebra that the K-theory, trace, Langlands and prismatic roadmaps consume: symmetric monoidal ∞-categories and ∞-operads as coCartesian fibrations over N(Fin_∗), algebra and module objects, the monoidal envelope, symmetric monoidal localizations (of a relative category, of a model category, and fibrewise in a coCartesian family, which also gives straightening over arbitrary small bases), the symmetric monoidal structure of the derived tensor product of Layer E1, exact monoidal functors, idempotent completion, stable tensor ideals and Verdier quotients, and the Barr–Beck–Lurie theorem. "∞-category" here means a quasicategory, as in Layers E0–E4, and the stable ∞-categories and exact functors are those of Section E0.4. N(Fin_∗) is the nerve of the category of finite pointed sets ⟨n⟩ = {∗, 1, …, n}; a map is inert when it is a bijection away from the preimage of ∗, and active when only ∗ maps to ∗. The layer uses Layers E0, E1 and E3.

### E5:abstract.1 Symmetric monoidal ∞-categories and ∞-operads

**Symmetric monoidal ∞-categories** (`SymmetricMonoidalInfinityCategory`). A symmetric monoidal ∞-category is a coCartesian fibration p : C^⊗ → N(Fin_∗) such that, for every n, the n inert maps ρ^i : ⟨n⟩ → ⟨1⟩ induce an equivalence C^⊗_{⟨n⟩} → (C^⊗_{⟨1⟩})^n. The underlying ∞-category is C = C^⊗_{⟨1⟩}; the fibre over ⟨0⟩ is contractible; coCartesian transport along the active map ⟨2⟩ → ⟨1⟩ is the tensor product and along ⟨0⟩ → ⟨1⟩ the unit. CoCartesian lifts are required over all maps, not only inert ones. (HA Definition 2.0.0.7, p. 169; Remark 2.1.2.19, p. 182.)

Provide `SymMonData` (total space, projection, fibres and the Segal equivalences; coCartesianness is part of the definition), `SymMonData.tensor` (active binary transport), `SymMonData.unit` (active nullary transport) and `SymMonData.ofOrdinary` (the nerve of the operadic category of a symmetric monoidal ordinary category, Mathlib's `CategoryTheory.SymmetricCategory`, whose objects over ⟨n⟩ are n-tuples and whose morphisms are multimorphisms built from the tensor product).

**Checks.**

- The fibre over ⟨0⟩ is equivalent to Δ[0].
- The fibre over ⟨1⟩ is the underlying ∞-category.
- For a symmetric monoidal ordinary category C, the homotopy category of the underlying fibre of `SymMonData.ofOrdinary C` is equivalent to C, with the same tensor product (Mathlib's `SSet.HomotopyCategory` and `SSet.mapHomotopyCategory`).

*Needs:* `IsCoCartesianFibration`; `restrictedStraightening`; Mathlib `SSet`, `SSet.Quasicategory`, `CategoryTheory.SymmetricCategory`, `CategoryTheory.MonoidalCategory`, `CategoryTheory.Grothendieck`, `SSet.HomotopyCategory`, `SSet.mapHomotopyCategory`.

**∞-operads** (`InfinityOperad`). An ∞-operad is an inner fibration O^⊗ → N(Fin_∗) with coCartesian lifts of inert maps, such that for every map f : ⟨m⟩ → ⟨n⟩ the space of maps over f is the product over the n outputs of the spaces of maps over ρ^i ∘ f, and the fibre over ⟨n⟩ is equivalent through the inert projections to the n-th power of the colour ∞-category. Nullary operations are included. An ∞-operad need not have coCartesian lifts of active maps. (HA Definition 2.1.1.10, pp. 174–175.)

Provide `OperadData` (the underlying map and colour category; the lifting and operation-space conditions are part of the definition), `commOperad` (the identity of N(Fin_∗), the commutative operad) and `assOperad` (the associative operad, whose operations are maps of finite pointed sets with totally ordered fibres, composed by concatenating orders).

**Checks.**

- The colour ∞-category of the commutative operad is Δ[0].
- The space of n-ary operations of the associative operad has n! components, one for each total order.
- The space of nullary associative operations is contractible.

*Needs:* `rightMappingSpace`; `rightMappingSpace_isKan`; `SymmetricMonoidalInfinityCategory`.

**Monoidal ∞-categories over an operad** (`OMonoidalCategory`). For an ∞-operad O^⊗, an O-monoidal ∞-category is a coCartesian fibration C^⊗ → O^⊗ such that, for every object T of O^⊗ over ⟨n⟩ with inert images T_i, the fibre C_T → ∏_i C_{T_i} is an equivalence; the composite C^⊗ → N(Fin_∗) is then an ∞-operad. A map of O-monoidal ∞-categories is O-monoidal when it preserves all coCartesian edges, and lax O-monoidal when it is a map of ∞-operads over O^⊗ preserving inert edges only. (HA Proposition 2.1.2.12, p. 180; Definition 2.1.2.13, p. 182; Definition 2.1.3.7, p. 185.)

Provide `OMonoidalData`, `strongMonoidalFunctors` and `laxMonoidalFunctors` (the full ∞-categories of strong and lax maps over O^⊗).

**Checks.**

- For O = Comm this recovers symmetric monoidal ∞-categories.
- The identity map is strong monoidal.
- A lax monoidal functor carries a unit comparison 1 → F(1); for a strong one it is invertible.

*Needs:* `InfinityOperad`; `SymmetricMonoidalInfinityCategory`; `coherentFun`.

### E5:abstract.2 Algebras, modules and the monoidal envelope

**Operadic algebras** (`operadicAlgebras`). For an O-monoidal ∞-category C^⊗ → O^⊗, Alg_O(C) is the full ∞-category of sections O^⊗ → C^⊗ over O^⊗ that carry inert edges to inert edges. CAlg(C) is the case O = Comm and associative algebras the case O = Ass. A section need not preserve active coCartesian edges. Composing an associative algebra with the cuts functor Δ^{op} → Ass^⊗ gives a simplicial diagram in the total category whose n-th term is the n-tuple of copies of the underlying object; when the tensor product is cartesian this is a Segal simplicial object with A_n ≃ A_1^n and A_0 terminal. (HA Definition 2.1.3.1, p. 184; Nikolaus–Scholze Appendix B, construction before Proposition B.1, p. 140.)

Provide `operadicAlgebras` (for symmetric monoidal C, pull C^⊗ back along O^⊗ → N(Fin_∗) and take inert-preserving sections), `relativeOperadicAlgebras` (the general O-monoidal case), `commutativeAlgebras`, `algebraForget` (evaluation at the unique colour of Comm), `algebraAtColour` (evaluation at a colour) and `assCuts`.

**Checks.**

- Algebras in the terminal monoidal ∞-category form a contractible ∞-category.
- Commutative algebras in the cartesian monoidal nerve of sets are ordinary commutative monoids.
- For cartesian sets an associative algebra has A_2 ≃ A_1 × A_1 and A_0 terminal.

*Needs:* `OMonoidalCategory`; `InfinityOperad`; `coherentFun`.

**Modules and extension of scalars** (`leftModuleObjects`). For an associative algebra A in a monoidal ∞-category C and a left C-tensored ∞-category M, LMod_A(M) is the fibre over A of the ∞-category of LM-algebras, LM being the two-coloured operad of an algebra acting on a module. Its objects carry a coherently unital and associative action A ⊗ M → M. If C and M have geometric realizations and the tensor product and the action preserve them in each variable, a map f : A → B has an extension-of-scalars functor B ⊗_A − left adjoint to restriction, computed by the realization of the two-sided bar construction Bar(B, A, M). For commutative A in a presentably symmetric monoidal C, Mod_A(C) is symmetric monoidal under the relative tensor product, with unit A. (HA Definitions 4.2.1.12–4.2.1.13, pp. 506–507; Definition 4.2.1.19, p. 508; Proposition 4.6.2.17, p. 627.)

Provide `leftModuleObjects`, `moduleObjects` (the commutative case Mod_A(C)), `extensionScalars` and `moduleUnit` (the unit of Mod_A(C) is A).

**Checks.**

- Modules over the unit 1 are equivalent to C.
- Extension of scalars along the identity of A is equivalent to the identity.
- For composable maps A → B → C of commutative algebras, C ⊗_B (B ⊗_A M) ≃ C ⊗_A M.

*Needs:* `operadicAlgebras`; `overDiagram`.

**The monoidal envelope** (`monoidalEnvelope`). For an ∞-operad C^⊗, Env(C^⊗) has as objects the finite lists of colours and as morphisms the active operadic maps; the tensor product concatenates lists. Inclusion as one-element lists induces an equivalence between strong monoidal functors Env(C^⊗) → D and lax monoidal functors C^⊗ → D, for every symmetric monoidal D. The construction uses active arrows of the operad, not the free ordinary tensor category on the homotopy category. (Nikolaus–Scholze Proposition III.3.2, p. 76.)

Provide `monoidalEnvelope`, `envelopeSingleton` and `envelopeRestriction`.

**Checks.**

- For the terminal symmetric monoidal ∞-category, whose operad is Comm, the envelope is the category of finite sets, so its isomorphism classes of objects are indexed by ℕ (the length of the list).
- The tensor product of an m-list and an n-list has length m + n.
- The unit is the empty list, of length zero.

*Needs:* `OMonoidalCategory`; `operadicAlgebras`; Mathlib `CategoryTheory.isIsomorphicSetoid`.

### E5:abstract.3 Monoidal localizations and coCartesian families

**Symmetric monoidal Dwyer–Kan localization** (`monoidalDwyerKanLocalization`). Let C^⊗ be symmetric monoidal and W a class of morphisms of C stable under tensoring with any object in either variable. Then the Dwyer–Kan localization C[W^{−1}] has a symmetric monoidal structure for which C → C[W^{−1}] is strong monoidal; restriction along it is fully faithful on strong and on lax monoidal functor ∞-categories, with essential image the functors inverting W; and for every K → N(Fin_∗) the localization of the pulled-back total space is the corresponding Dwyer–Kan localization. The saturated class generated by W is used; an ordinary localization of the homotopy category does not give this. (Nikolaus–Scholze Definitions A.1, A.2 and A.4, Remark A.3 and Proposition A.5, pp. 128–130.)

**Checks.**

- Localizing at the equivalences only recovers C and its unit.
- Restriction is fully faithful on both strong and lax monoidal functors, and its image inverts every map of W; inert and nullary operations are checked as well as binary ones.
- After base change along any K → N(Fin_∗) the operadic localization comparison is an equivalence.

*Proof route.* Mark the vertical product edges of W in the fibres of C^⊗, localize the total space over N(Fin_∗) and use compatibility with inert projections to prove the Segal equivalences; verify the universal properties after arbitrary base change.

*Needs:* `IsDwyerKanLocalization`; `OMonoidalCategory`; `overDiagram`.

**Monoidal localization of a model category** (`monoidalModelLocalization`). A symmetric monoidal model category satisfying the pushout-product and unit axioms has a symmetric monoidal ∞-localization. The localization of the cofibrant objects carries the derived tensor product and is strongly monoidally equivalent to the Dwyer–Kan localization of all objects with this derived structure; the map from all objects is lax monoidal and initial among lax monoidal functors inverting weak equivalences; and the construction is compatible with base change over N(Fin_∗). If the unit is not cofibrant, the derived unit is its cofibrant replacement, and no strong monoidal map from all objects is asserted. (Nikolaus–Scholze Theorem A.7, pp. 130–131.)

**Checks.**

- For chain complexes, tensoring cofibrant replacements computes the derived tensor product; the ordinary tensor product of non-flat complexes does not.
- With a non-cofibrant unit, its cofibrant replacement maps to the derived unit.
- The comparison from all objects is lax monoidal; a strong monoidal comparison from all objects is not claimed.

*Proof route.* Apply `monoidalDwyerKanLocalization` to cofibrant objects, where the pushout-product axiom and Ken Brown's lemma give tensor-stability of weak equivalences; use the unit axiom and cofibrant replacement for the comparison with all objects.

*Needs:* `monoidalDwyerKanLocalization`.

**Derived coCartesian families and straightening over arbitrary bases** (`derivedFamily`). Let X → S be a coCartesian fibration over a small ∞-category, with a class of vertical weak equivalences in each fibre. It is left derivable when every transition functor has an absolute left derived functor, in the sense of a right Kan extension along the localization of its source (Nikolaus–Scholze Definition A.8), and the comparisons between derived composites are equivalences over every 2-simplex of S. Localizing the fibres then gives a coCartesian fibration over S whose transitions are the derived transitions, compatibly with base change along any K → S from a small ∞-category; a transition that preserves the weak equivalences keeps its original coCartesian lifts. As part of this target, straightening and unstraightening are extended from the bases of `restrictedStraightening` to arbitrary small ∞-categories: points and intervals generate Cat∞ under colimits, coCartesian families glue along those colimits, and pullback preserves the gluing. (Nikolaus–Scholze Definition A.8, pp. 131–132; Proposition A.14 and Corollary A.15, pp. 134–135; Lemmas A.16–A.17, pp. 136–137.)

Provide `DerivedFamilyData` (base, total space, projection and localized fibres; derivability conditions are part of the definition), `derivedFamily` and `derivedFamilyBaseChange`.

**Checks.**

- Over a point the construction is the localization of the fibre.
- Over Δ[1] the transition is the derived transition, not the underived functor.
- If the weak equivalences are the equivalences, the localized family is equivalent to the original one.

*Proof route.* Glue straightening along Cat∞-colimits of points and intervals (NS A.16–A.17), not along colimits of raw simplicial sets; localize fibres and derive transitions using `leftKanExtension_restrict_trivialFibration`; assemble a functor S → Cat∞ from the absolute property and the 2-simplex comparisons; identify the total localization by NS A.14–A.15.

*Needs:* `IsDwyerKanLocalization`; `restrictedStraightening`; `leftKanExtension_restrict_trivialFibration`; `coherentFun`; `catInfinity`.

### E5:abstract.4 Stable monoidal structures

**The symmetric monoidal derived tensor product** (`derivedTensor_symmetricMonoidal`). For a small ringed site with O commutative, D∞(O) carries a symmetric monoidal ∞-category structure whose underlying tensor bifunctor is `derivedTensor` of Layer E1, with unit O[0]. It is obtained by applying `monoidalDwyerKanLocalization` to the symmetric monoidal category of K-flat complexes and the quasi-isomorphisms between them, which are stable under tensoring with K-flat complexes; it needs no hypothesis on points of the topos. The tensor product preserves colimits in each variable, so D∞(O) is presentably symmetric monoidal. (Nikolaus–Scholze Proposition A.5, pp. 129–130; Stacks, Cohomology on Sites, Lemma 21.17.12, tag 06YT, PDF p. 31; Liu–Zheng §3.1, pp. 84–86, for the case of enough points.)

**Checks.**

- The unit is O[0].
- On homotopy categories the associativity, unit and symmetry isomorphisms are those of the ordinary derived tensor product; the symmetry on two classes of degree one carries the sign −1.
- The structure on D∞(ℤ) restricted to the heart is not the ordinary tensor product of abelian groups: (ℤ/p) ⊗ (ℤ/p) has a nonzero H^{−1}.

*Needs:* `derivedTensor`; `IsKFlat`; `kFlatReplacement`; `monoidalDwyerKanLocalization`; `enhancedDerived_isPresentable`.

**Stable monoidal comparison** (`stableMonoidal_homotopyCategory`). Let C be a stable ∞-category (Section E0.4) with a symmetric monoidal structure whose tensor product is exact in each variable. Then the tensor product descends to a symmetric monoidal structure on the homotopy category compatible with suspension and with the distinguished triangles of cofibre sequences. For D∞(R), with the structure of `derivedTensor_symmetricMonoidal`, this is the derived tensor product on Mathlib's `DerivedCategory`, with Mathlib's shift and triangles. Exactness in each variable is a hypothesis; it does not follow from the existence of a monoidal structure. (HA Theorem 1.1.2.14, p. 27; §4.8.1, Corollary 4.8.1.14 and Propositions 4.8.1.15 and 4.8.1.17, pp. 711–715.)

**Checks.**

- For R-modules the comparison sends the unit to R[0] and a cofibre triangle to Mathlib's mapping-cone triangle.
- Tensoring the triangle R → R → 0 with any K gives K → K → 0, with the shift convention of `dgNerve_shift_cone_comparison`.

*Needs:* `dgNerve_shift_cone_comparison`; `derivedTensor_symmetricMonoidal`; `SymmetricMonoidalInfinityCategory`; Mathlib `DerivedCategory`.

**Exact monoidal functors and triangles** (`exactMonoidalFunctor_triangle`). Let C, D be stable ∞-categories with symmetric monoidal structures exact in each variable. An exact strong (respectively lax) monoidal functor induces a strong (respectively lax) monoidal functor of homotopy categories and carries the cofibre triangle of f to that of F(f), with the suspension comparison of Section E0.4. Lax monoidal does not imply exact, and exact does not imply strong monoidal. (HA Proposition 1.1.4.1, pp. 33–35; §2.1.2, pp. 177–182.)

**Checks.**

- The suspension comparison of the identity functor is the identity, and the comparisons of two exact monoidal functors compose.
- For derived extension of scalars along R → S, the image of a cone triangle is the cone triangle of the derived tensor, with no flatness assumption on S.

*Needs:* `dgNerve_shift_cone_comparison`; `OMonoidalCategory`; `stableMonoidal_homotopyCategory`.

**Idempotent completion and its monoidal extension** (`idemCompletion`). For a small ∞-category C, Idem(C) is the full subcategory of the presheaf ∞-category Fun(C^{op}, Spaces) on retracts of representables. C → Idem(C) is fully faithful, and restriction Fun(Idem(C), D) → Fun(C, D) is an equivalence for every idempotent-complete D. If C is stable so is Idem(C); a tensor product exact in each variable extends to retracts, giving a symmetric monoidal completion with the corresponding universal property. Idempotents are homotopy-coherent idempotents, not idempotents of the homotopy category. For an ordinary category C, Idem(N C) is equivalent to the nerve of Mathlib's Karoubi envelope. (HTT §5.1.4, Propositions 5.1.4.2 and 5.1.4.9, printed pp. 321–323, PDF pp. 339–341.)

Provide `idemCompletion`, `idemInclusion` and `idemRestriction`.

**Checks.**

- Completing an idempotent-complete category changes it by an equivalence.
- Idem(N C) ≃ N(`CategoryTheory.Idempotents.Karoubi` C) for an ordinary category C.
- Idem(Δ[0]) is Δ[0].

*Needs:* `dgNerve_shift_cone_comparison`; `leftKanExtension_restrict_trivialFibration`; `SymmetricMonoidalInfinityCategory`; Mathlib `CategoryTheory.Idempotents.Karoubi`.

**Stable subcategories and tensor ideals** (`stableClosure`, `thickTensorClosure`). A stable subcategory of a stable ∞-category C is a full subcategory containing zero and closed under fibres and cofibres; it need not be closed under retracts. If C is symmetric monoidal with tensor exact in each variable, a stable subcategory D is a tensor ideal when X ⊗ Y ∈ D for all X ∈ C and Y ∈ D; a thick tensor ideal is also closed under retracts. For commutative A → B, the thick tensor ideal generated by B is taken in Mod_A(C). Stable, thick and localizing closures are kept distinct. (Nikolaus–Scholze Definition I.3.2, p. 18; Mathew Definition 3.18, p. 19.)

Provide `stableClosure`, `thickTensorClosure` and `tensorIdealInduction` (a thick tensor ideal containing the generators contains their thick tensor closure).

**Checks.**

- The thick tensor closure of 0 consists of the zero objects.
- The thick tensor closure of the unit is all of C.
- A retract of a generator lies in its thick tensor closure, but need not lie in its stable closure.

*Needs:* `dgNerve_shift_cone_comparison`; `leftModuleObjects`; Mathlib `CategoryTheory.ObjectProperty`.

**Verdier quotients of small stable ∞-categories** (`verdierQuotient`). For a small stable C and a stable subcategory D, C/D is the Dwyer–Kan localization at the maps whose cofibre lies in D. It is stable and universal among exact functors out of C that kill D. Its mapping spaces are Map_{C/D}(X, Y) = colim_{Z→Y, Z∈D} Map_C(X, cofib(Z → Y)), a filtered colimit. The objects sent to zero form the retract closure of D, which is D only when D is thick. If D is a tensor ideal and the tensor product is exact in each variable, C/D is symmetric monoidal and universal among exact lax monoidal functors killing D. No compact generation is used, and idempotent completion of the quotient is a separate construction. (Nikolaus–Scholze Theorems I.3.3 and I.3.6, pp. 18–23.)

Provide `verdierQuotient`, `verdierProjection`, `verdierRestriction` and `verdierMapping`.

**Checks.**

- C/0 ≃ C.
- C/C is the zero category.
- q(ΣX) ≃ Σ q(X).

*Needs:* `IsDwyerKanLocalization`; `thickTensorClosure`; `monoidalDwyerKanLocalization`; `overDiagram`.

### E5:abstract.5 Monadicity

**The Barr–Beck–Lurie theorem** (`barrBeckLurie`). Let F : C ⇄ D : G be an adjunction of ∞-categories (Layer E3) and T = GF the associated monad. The comparison D → LMod_T(C) is an equivalence if and only if G is conservative, and D admits geometric realizations of G-split simplicial objects and G preserves them. The comparison commutes with the forgetful functors to C. Preservation of all colimits suffices in applications but is not the criterion. (HA Theorem 4.7.3.5, p. 685.)

**Checks.**

- For the free–forgetful adjunction of modules over an algebra, the comparison is an equivalence compatible with the forgetful functors.
- For the identity adjunction the monad is the identity and LMod_T(C) ≃ C.
- Conservativity and the G-split realization condition are separate hypotheses; each is verified on its own in applications (for extension of scalars along a descendable map, in Layer E5:descent).

*Proof route.* Build the monad and the comparison from the unit and counit; the split augmented bar resolution and conservativity give full faithfulness and essential surjectivity.

*Needs:* `adjointFunctorTheorem`; `operadicAlgebras`; `overDiagram`; Mathlib `CategoryTheory.Functor.ReflectsIsomorphisms`.

### Examples

- For a commutative ring R, D∞(R) is a symmetric monoidal stable ∞-category with unit R[0]; CAlg(D∞(R)) contains the ordinary commutative R-algebras, and Mod_A(D∞(R)) for such an A is D∞(A).
- In Perf(ℤ), the thick tensor ideal generated by ℤ/p consists of the perfect complexes with p-power torsion cohomology, and the Verdier quotient of Perf(ℤ) by it is Perf(ℤ[1/p]) up to idempotent completion.

### Dependencies

Layers E0, E1 and E3. Mathlib (symmetric monoidal categories, the Grothendieck construction, Karoubi envelopes, homotopy categories of simplicial sets, object properties, conservative functors).

## Layer E5:presentability: Presentable categories, Ind-completion and their extensions

This layer develops the theory of large categories that the trace, Langlands and lisse-sheaf roadmaps consume: compact generation, Ind-completion and its universal property, stable and monoidal Ind, the ∞-categories PrL and PrR and their limits, the ∞-category of spectra as the stabilization of spaces, the tensor product of presentable categories, formal inversion of an object, Ind of a Verdier quotient, the accessible form of the compactness criterion, coherent actions of finite and profinite groups, compact morphisms, dualizable and compactly assembled categories, filtered colimits of dualizable categories and rigid categories. The basic definitions of κ-compact objects, accessibility and presentability are those of Section E0.8. The layer uses Layers E0, E1, E3 and E5:abstract.

### E5:presentability.1 Compact generation and Ind-completion

**Compact objects and compact generation** (`compactObjects`, `IsCompactlyGenerated`). For a quasicategory C with κ-filtered colimits, C^κ is the full subcategory of κ-compact objects (`IsKappaCompact`, Section E0.8), and compact means ω-compact. A presentable stable C is compactly generated when there is a small set of compact objects whose shifts detect zero objects. Finite colimits and retracts of compact objects are compact. Compactness is a condition on mapping spaces, not finite generation of cohomology. (HTT Definition 5.3.4.5, printed p. 396, PDF p. 414.)

Provide `compactObjects`, `compactMappingComparison` (Map(x, colim y_i) ≃ colim Map(x, y_i) for compact x and filtered index), `compactRetract`, `compact_finiteColimit` and `IsCompactlyGenerated`.

**Checks.**

- The zero object of a stable C is compact.
- R is compact in D∞(R), and its shifts detect zero, so D∞(R) is compactly generated.
- For a nonzero field k, the countable direct sum ⊕_ℕ k is not compact in D∞(k).

*Needs:* `IsKappaCompact`; `rightMappingSpace`; `IsEnhancedColimit`; `dgNerve_shift_cone_comparison`.

**Ind-completion** (`indCompletion`). For a small quasicategory C, Ind_κ(C) is the full subcategory of Fun(C^{op}, Spaces) on κ-filtered colimits of representables. The Yoneda embedding lands in it and is fully faithful, representables are κ-compact, and every object has a κ-filtered presentation. If C is small, idempotent complete and has finite colimits, Ind(C) is compactly generated and its compact objects are C. For an ordinary category C, the 0-truncated part compares with Mathlib's set-valued `CategoryTheory.Ind`; Ind(N C) itself is not equivalent to it. (HTT Definition 5.3.5.1, printed p. 403; Propositions 5.3.5.10–5.3.5.11, printed pp. 406–407.)

Provide `indCompletion`, `indYoneda` and `indCompactComparison`.

**Checks.**

- Ind(Δ[0]) is Δ[0].
- For a small stable idempotent-complete C, the compact objects of Ind(C) are C.
- For a discrete ordinary category, a filtered presentation never creates a new connected component.

*Needs:* `compactObjects`; `leftKanExtension_restrict_trivialFibration`; Mathlib `CategoryTheory.Ind`.

**The universal property of Ind** (`indExtension`). For small C and D with κ-filtered colimits, restriction along Yoneda gives an equivalence between κ-filtered-colimit-preserving functors Ind_κ(C) → D and all functors C → D; the extension sends colim_i y(c_i) to colim_i F(c_i), independently of the presentation. For κ = ω, if C has finite colimits, D is presentable and F preserves finite colimits, the extension preserves all small colimits; for larger κ the corresponding statement uses κ-small colimits. The extension is an equivalence exactly when F is fully faithful with κ-compact values that generate D under κ-filtered colimits. (HTT Propositions 5.3.5.10–5.3.5.11, printed pp. 406–407, PDF pp. 424–425; Proposition 5.5.1.9, printed pp. 461–462, PDF pp. 479–480; HA Corollary 4.8.1.14(2), pp. 711–712.)

**Checks.**

- Restricting the extension of F gives F back, and two presentations of one Ind-object give the same value.
- For small stable idempotent-complete C, the extension of the inclusion C → Ind(C) is the identity.
- The equivalence criterion fails when the generators are not compact, even if they generate under colimits.

*Needs:* `indCompletion`; `leftKanExtension_restrict_trivialFibration`.

**Stable and monoidal Ind-completion** (`indStable`, `indMonoidal`). For small stable C, Ind_κ(C) is stable and Yoneda is exact. For small symmetric monoidal C, Ind(C) has a symmetric monoidal structure whose tensor product preserves filtered colimits in each variable and extends that of C; if C is stable with tensor exact in each variable, the tensor product of Ind(C) preserves all colimits in each variable. Exact strong monoidal functors on C extend uniquely, with their monoidal structure, to colimit-preserving strong monoidal functors on Ind(C). (HA Proposition 1.1.3.6, p. 32; Corollary 4.8.1.14, pp. 711–712.)

**Checks.**

- Yoneda preserves zero objects, cofibres and suspension.
- The tensor product of two filtered presentations is computed on the product diagram, and the unit is the representable of the unit.
- Exactness and filtered-colimit preservation together give preservation of all colimits in the stable case.

*Needs:* `indCompletion`; `indExtension`; `SymmetricMonoidalInfinityCategory`; `dgNerve_shift_cone_comparison`.

### E5:presentability.2 Presentable categories, their limits and spectra

**PrL and PrR** (`PrL`, `PrR`). Presentable ∞-categories (Section E0.8) are exactly the accessible localizations of presheaf ∞-categories Fun(C^{op}, Spaces) of small C. PrL is the subcategory of Cat∞ (in a larger universe) of presentable ∞-categories and colimit-preserving functors; PrR has the same objects and the accessible functors with left adjoints. Taking adjoints identifies PrL with the opposite of PrR. Presentability does not include compact generation at ω. (HTT Definition 5.5.0.1, printed p. 456, PDF p. 474; Theorem 5.5.1.1, printed pp. 457–460; Proposition 5.5.2.2, printed p. 463, PDF p. 481; Corollary 5.5.3.4, printed p. 467, PDF p. 485.)

Provide `PresentableData` (a quasicategory, an accessibility cardinal and a small generating subcategory), `PrL`, `PrR`, `presentableLeftFunctors`, `presentableRightFunctors` and `isPresentable_iff_accessibleLocalization`.

**Checks.**

- D∞(R) is presentable.
- The zero stable ∞-category is presentable.
- On a presentable C, a functor C^{op} → Spaces that preserves small limits is representable (`representable_iff_preservesLimits`); this checks the variance.

*Needs:* `IsPresentable`; `indCompletion`; `compactObjects`; `accessibleLocalization`; `adjointFunctorTheorem`; `catInfinity`.

**Limits in PrL** (`presentable_limit`). Every small diagram of presentable ∞-categories and colimit-preserving functors, indexed by any small ∞-category, has a limit in PrL whose underlying ∞-category is the limit in Cat∞. Colimits in the limit are computed and detected by the projections. If all the categories are stable, so is the limit. This extends `presentable_limit_restricted` (Layer E3) from nerves of ordinary categories to arbitrary small ∞-categories; it does not say that an unrelated inclusion (for example of complete objects) preserves colimits. (HTT Propositions 5.5.3.12–5.5.3.13, printed pp. 469–470, PDF pp. 487–488; ECD Lemma 17.1, p. 96, and Proposition 26.2, p. 162, for the applications.)

**Checks.**

- The limit over a point is the input category, and the empty limit is Δ[0].
- In a pullback C ×_E D along left adjoints, coproducts and cofibres are computed componentwise.
- The inclusion of derived complete modules into all modules does not preserve coproducts; this is consistent with the theorem because that inclusion is not a map in PrL.

*Needs:* `PrL`; `presentable_limit_restricted`; `derivedFamily`; `IsEnhancedLimit`.

**The ∞-category of spectra** (`spectra`). For a pointed quasicategory C with finite limits, Sp(C) is the limit in Cat∞ of the tower ⋯ → C →Ω C →Ω C. Sp(C) is stable; Ω^∞ : Sp(C) → C is an equivalence exactly when C is stable; for presentable C, Sp(C) is presentable and Ω^∞ has a left adjoint Σ^∞. Sp is Sp(Spaces_∗), the stabilization of pointed spaces, with sphere spectrum S = Σ^∞ S⁰. Sp is the unit of the tensor product of presentable stable ∞-categories (next target). No model of spectra by spectrum objects of simplicial sets is used. (HA Corollary 1.4.2.17 and Proposition 1.4.2.21, p. 146; Proposition 1.4.2.24 and Remark 1.4.2.25, p. 147; Proposition 4.8.2.18, p. 722.)

Provide `spectra`, `stabilization` (Sp(C) for pointed C with finite limits), `omegaInfinity`, `sigmaInfinity` and `stabilization_stable`.

**Checks.**

- Sp(C) ≃ C for a stable C, through Ω^∞.
- The stabilization of Δ[0] is Δ[0].
- Ω^∞ : Sp → Spaces_∗ is not an equivalence: Spaces_∗ is not stable, since the pushout of ∗ ← S⁰ → ∗ is S¹, while its loop space recovers ℤ, not S⁰.

*Needs:* `presentable_limit`; `overDiagram` (pointed objects as the slice under the point); `spaceInfinity`; `IsStable`.

**Tensor products of presentable categories and module base change** (`presentableTensor`). For presentable C and D, C ⊗ D represents functors out of C × D that preserve colimits separately in each variable: FunL(C ⊗ D, E) ≃ FunL,L(C × D, E). This makes PrL symmetric monoidal with unit Spaces, and its full subcategory of stable presentable ∞-categories symmetric monoidal with unit Sp. For a presentably monoidal C, a presentable right C-module M and an algebra A in C, M ⊗_C RMod_A(C) ≃ RMod_A(M). Extension of scalars and these comparisons are coherent for composites and units. This categorical tensor product is distinct from the derived tensor product of objects. (HA Propositions 4.8.1.15 and 4.8.1.17, pp. 712–715; Proposition 4.8.2.18, p. 722; Theorem 4.8.4.6, p. 737.)

Provide `presentableTensor`, `presentableTensorUniversal` and `categoricalModuleBaseChange`.

**Checks.**

- Spaces ⊗ C ≃ C for presentable C.
- Sp ⊗ C ≃ C for presentable stable C.
- 0 ⊗ C ≃ 0 in stable presentable categories.

*Needs:* `PrL`; `spectra`; `leftModuleObjects`; `indMonoidal`.

**Formal inversion of an object** (`tensorInversion`). For a presentably symmetric monoidal C and X ∈ C, C[X^{−1}] is initial among presentably symmetric monoidal ∞-categories with a colimit-preserving strong monoidal functor from C under which X becomes invertible. For a presentable C-module M, M ⊗_C C[X^{−1}] is the universal inversion of X on M. If the cyclic permutation of X ⊗ X ⊗ X is homotopic to the identity, the underlying presentable ∞-category is the colimit in PrL of the telescope M → M → ⋯ with transitions X ⊗ −; without this condition the telescope formula is not asserted. (Robalo Proposition 4.10, pp. 75–76; Definition 4.18, p. 88; Proposition 4.21, p. 90; Remark 4.23 and Corollary 4.24, p. 92.)

Provide `tensorInversion`, `tensorInversionMap` and `tensorInversionUniversal`.

**Checks.**

- Inverting the unit changes C by an equivalence.
- Inverting 0 in a stable C gives the zero category.
- Inverting an object that is already invertible changes nothing.

*Needs:* `operadicAlgebras`; `leftModuleObjects`; `adjointFunctorTheorem`; `PrL`; `presentableTensor`.

### E5:presentability.3 Verdier quotients, compactness and group actions

**Ind of a Verdier quotient** (`indVerdierLocalization`). For a small stable C and a stable subcategory D, Ind(C) → Ind(C/D) is a localization whose kernel is Ind(D); its right adjoint is fully faithful, preserves colimits, and extends the approximation of C/D in Ind(C) given by the mapping-space formula of `verdierQuotient`. The monoidal version holds for tensor ideals with tensor exact in each variable. The compact objects of Ind(C/D) are Idem(C/D), not C/D unless C/D is idempotent complete. (Nikolaus–Scholze Proposition I.3.5, pp. 21–22.)

**Checks.**

- For D = 0 the localization is the identity; for D = C its target is zero.
- Objects of Ind(D) map to zero, and the counit of the localization is invertible.
- The compact objects are the retract closure of C/D.

*Needs:* `verdierQuotient`; `indExtension`; `indStable`; `idemCompletion`.

**The accessible compactness criterion for right adjoints** (`rightAdjoint_preservesKappaFiltered_iff`). Let F : C ⇄ D : G be an adjunction of presentable ∞-categories with C κ-accessible. F preserves κ-compact objects if and only if G preserves κ-filtered colimits. For κ = ω and compactly generated stable C this is `rightAdjoint_preservesCoproducts_iff` (Layer E3): F preserves compact objects if and only if G preserves coproducts, equivalently all colimits. (HTT Proposition 5.5.7.2, printed p. 501, PDF p. 519; Fargues–Scholze Lemma IV.2.20, pp. 123–124; ECD Proposition 23.7 and its proof, pp. 144–145.)

**Checks.**

- For extension of scalars D∞(R) → D∞(S), the compact object R goes to the compact object S and restriction commutes with coproducts.
- The test is made on every shift of every compact generator.
- Compact generation of C is needed for the converse; preservation on an empty set of compact objects says nothing.

*Needs:* `compactObjects`; `PrL`; `adjointFunctorTheorem`; `rightAdjoint_preservesCoproducts_iff`.

**Coherent group actions and continuous fixed points** (`homotopyFixedPoints`). For a finite group G, an action of G on an ∞-category C is a functor BG → Cat∞ with value C, equivalently a coCartesian fibration over BG. Its homotopy fixed points C^{hG} are its limit; for two actions, the equivariant functors are the homotopy fixed points of Fun(C, D) under conjugation. Actions of G by equivalences on presentable stable categories have presentable stable fixed points. For a profinite G, categorical actions that factor through a specified finite quotient are pulled back coherently from it. For a discrete G-module M with open stabilizers, the derived invariants in the enhancement of Layer E1 agree with continuous cochain cohomology, and in degree n with colim_U Hⁿ(G/U, M^U), the finite-quotient description of `TauCetiRoadmap.ProfiniteCohomology` Layer 10. No filtered-colimit formula is asserted for homotopy fixed points of arbitrary categorical actions; general continuous actions on ∞-categories need a continuity model and are not covered. (HTT Propositions 5.5.3.12–5.5.3.13, printed pp. 469–470; Nikolaus–Scholze Lemma A.16, p. 136.)

Provide `CoherentActionData`, `homotopyFixedPoints`, `equivariantFunctors` and `continuousDerivedInvariants`.

**Checks.**

- For the trivial group, C^{hG} = C.
- For the trivial action of a finite G, C^{hG} ≃ Fun(BG, C).
- For finite G and a G-module M, the derived invariants of M have cohomology Hⁿ(G, M) in every degree n ≥ 0.

*Needs:* `derivedFamily`; `presentable_limit`; `enhancedDerived`; `coherentFun`; `catInfinity`; `TauCetiRoadmap.ProfiniteCohomology` Layer 0 (discrete modules and continuous sections) and Layer 10 (continuous cohomology in all degrees).

### E5:presentability.4 Dualizable, compactly assembled and rigid categories

**Compact morphisms and compact exhaustions** (`IsCompactMorphism`). In a quasicategory with filtered colimits, a map f : x → y is weakly compact when every map from y into a filtered colimit factors, after composing with f, through some stage; compact when the square comparing colim_i Map(y, z_i) → Map(y, colim z_i) and colim_i Map(x, z_i) → Map(x, colim z_i), by precomposition with f, has a coherent diagonal; and strongly compact when its representable transformation factors through a filtered-colimit-preserving functor. A compact exhaustion of x is a sequential presentation x ≃ colim x_n with compact transitions. The three notions agree in compactly assembled categories and are kept apart otherwise; an object is compact exactly when its identity is. (Ramzi, *Dualizable presentable ∞-categories*, Definitions 2.1, 2.3 and 2.5, pp. 26–27; Definition 2.23 and Lemma 2.24, pp. 31–32.)

Provide `compactMorphismSquare`, `IsCompactMorphism`, `compactExhaustion` and `compactIdentityComparison`.

**Checks.**

- The zero morphism is compact in a stable compactly assembled category.
- The identity of a countably infinite-dimensional ℚ-vector space in degree zero is not compact in D∞(ℚ).
- Every finite-rank map of ℚ-vector spaces in degree zero is compact.

*Needs:* `compactObjects`; `rightMappingSpace`; `IsEnhancedColimit`; Mathlib `CategoryTheory.IsFiltered`.

**Dualizable and compactly assembled categories** (`IsDualizablePresentable`). A presentable stable ∞-category C is dualizable when it is dualizable in the symmetric monoidal ∞-category of presentable stable categories: it has a dual with evaluation and coevaluation satisfying the triangle identities up to coherent homotopy. Equivalently C is a retract, by colimit-preserving functors, of a compactly generated stable category; equivalently the colimit functor Ind(C) → C, with Ind taken in a larger universe, has a left adjoint. In compactly assembled terms, filtered colimits commute with finite limits and the objects with compact exhaustions generate under filtered colimits. Compact generation of C is not assumed. (Ramzi, *Dualizable*, Theorem 1.49, pp. 17–18; Definition 1.68, p. 25; Theorem 2.39, p. 39; Scholze, *Berkovich motives*, Definition 2.7 and Remark 2.8, p. 9.)

Provide `DualPairData`, `IsDualizablePresentable`, `dualizableRetractComparison` and `assemblyLeftAdjoint`.

**Checks.**

- D∞(R) is dualizable, with evaluation given by the relative tensor product over R.
- The zero category is self-dual.
- A retract, through colimit-preserving functors, of a compactly generated category is dualizable.

*Needs:* `PrL`; `presentableTensor`; `IsCompactMorphism`; `indCompletion`.

**Filtered colimits of dualizable categories** (`dualizable_filteredColimit`). A left adjoint is strongly continuous when its right adjoint preserves colimits. A filtered diagram of dualizable presentable stable categories with strongly continuous transitions has a dualizable colimit in PrL, and the comparison from the colimit of the compact subcategories (in small idempotent-complete stable categories) to the compact subcategory of the colimit is an equivalence. Neither the inputs nor the colimit are asserted to be compactly generated. (Scholze, *Berkovich motives*, Lemma 10.5, p. 55; Ramzi, *Dualizable*, Proposition 1.62, p. 22; Efimov, *K-theory and localizing invariants of large categories*, Propositions 2.63, 2.67 and 2.70, pp. 52–55, arXiv v4.)

**Checks.**

- A constant filtered diagram recovers the category and its compact objects.
- For a filtered diagram of rings R_i with colimit R, the colimit of the Perf(R_i) is Perf(R).
- The compact comparison is checked on mapping spaces and retracts, without assuming compact generation.

*Proof route.* Choose an uncountable regular cardinal uniform in the diagram; embed each input by its assembly left adjoint into Ind of its cardinal-compact objects, so the compact objects of the input are a kernel between two small compact subcategories. Filtered colimits preserve the strongly continuous fully faithful embeddings and their exact sequences (Efimov 2.67), and finite kernels commute with filtered colimits of small idempotent-complete stable categories.

*Needs:* `IsDualizablePresentable`; `rightAdjoint_preservesKappaFiltered_iff`.

**Trace-class maps and rigid categories** (`IsTraceClass`, `IsRigid`). In a presentably symmetric monoidal closed C, a map f : x → y is trace-class when there are d, a pairing d ⊗ x → 1 and a map 1 → y ⊗ d whose contraction is f; equivalently its class lifts through Hom(x, 1) ⊗ y. C is locally rigid over a base V when it is dualizable as a V-module and its multiplication C ⊗_V C → C is an internal left adjoint over C ⊗_V C (its right adjoint preserves colimits and is bilinear); it is rigid when moreover its unit is V-atomic, which over Sp means compact. Over Sp in the stable case, local rigidity is equivalent to dualizability together with every compact morphism being trace-class, and a compact unit with trace-class compact exhaustions generating under colimits implies rigidity. Dualizability of objects is distinct from rigidity of the category. For a colimit-preserving strong symmetric monoidal functor between rigid stable presentable categories, the right adjoint preserves colimits and is linear over the source. (Ramzi, *Locally rigid ∞-categories*, v2: Definition 3.1, p. 21; Definition 4.5, p. 24; Proposition 4.15, pp. 26–27; Definition 4.36, p. 33; Observation 4.51, pp. 34–35; Corollary 4.60, p. 38.)

Provide `TraceClassData`, `IsTraceClass`, `RigidData`, `IsRigid` and `rigidRightAdjointLinearity`.

**Checks.**

- For commutative R, D∞(R) is rigid with compact unit R.
- The identity of a dualizable object is trace-class.
- The identity of an infinite-dimensional ℚ-vector space is not trace-class.

*Needs:* `IsDualizablePresentable`; `IsCompactMorphism`; `presentableTensor`; `leftModuleObjects`; `spectra`.

### Examples

- D∞(R) for a commutative ring R is compactly generated by R, presentably symmetric monoidal, dualizable and rigid; ⊕_ℕ R is not compact, and its identity is neither compact nor trace-class.
- Sp ⊗ D∞(R) ≃ D∞(R); inverting R[1] in D∞(R) changes nothing because R[1] is already invertible.

### Dependencies

Layers E0, E1, E3 and E5:abstract. Mathlib (set-valued Ind objects, filtered categories); `TauCetiRoadmap.ProfiniteCohomology` Layers 0 and 10.

## Layer E5:descent: Descendable algebras and module descent

This layer defines descendable maps of commutative algebras in a presentably symmetric monoidal stable ∞-category, with their finite index, proves module descent and the permanence properties of descendability, and bounds the index along filtered colimits. Layer E2 uses it for h-descent on perfect schemes. Throughout, C is a presentable stable symmetric monoidal ∞-category whose tensor product preserves colimits in each variable, and A → B is a map in CAlg(C). The layer uses Layers E0, E2:towers, E5:abstract and E5:presentability.

**Descendable algebras and their index** (`IsDescendable`, `descendabilityIndex_le`). A → B is descendable when A lies in the thick tensor ideal of Mod_A(C) generated by B. With I = fib(A → B), A → B has index at most m when the natural map I^{⊗_A m} → A is null-homotopic. Descendability is equivalent to having index at most m for some m, and to the augmented Amitsur tower {Tot_{≤n} B^{⊗_A(•+1)}} being pro-isomorphic to the constant tower A. The definition uses finite thick generation, not recovery of A by the infinite totalization. Index at most 0 forces A = 0, and null-homotopy is stronger than vanishing on homotopy groups. (BS17 Definitions 11.14 and 11.18, p. 43; Lemma 11.20, pp. 43–44; Mathew Definition 3.18 and Proposition 3.20, pp. 19–20.)

Provide `IsDescendable`, `descendabilityIndex_le` and `amitsurTower` (the coherent tower of finite totalizations with its augmentation).

**Checks.**

- The identity of A has index at most 1.
- Index at most 0 forces A = 0.
- ℤ_p → 𝔽_p in D∞(ℤ_p) is not descendable, although the totalization of its Amitsur complex is the p-complete unit ℤ_p.

*Proof route.* Relate the cubical bar tower {I^{⊗n}} to the tower of partial totalizations by a pro-comparison (Carlsson's identification of the fibre of {A} → {Tot_{≤n}} with {I^{⊗(n+1)}}); a null-homotopic I^{⊗m} → A makes the fibre tower pro-zero; conversely, thick generation gives a nilpotence bound by Mathew Proposition 3.27 (cited in BS17 as Proposition 3.26 of an earlier version).

*Needs:* `leftModuleObjects`; `thickTensorClosure`; `dgNerve_shift_cone_comparison`; `IsProZero`; `derivedTowerLimit`; `PrL`.

**Module descent and permanence of descendability** (`moduleDescent`). If A → B is descendable, the functor Mod_A(C) → lim_{[n]∈Δ} Mod_{B^{⊗_A(n+1)}}(C) along extension of scalars is a symmetric monoidal equivalence, and extension of scalars along A → B is conservative. Descendability is preserved by composition, by passage to an intermediate algebra (if A → C is descendable, so is A → B for A → B → C), and by exact strong monoidal functors. A colimit-preserving lax monoidal functor Φ preserves a given index: if I^{⊗m} → A is null-homotopic, so is Φ(I)^{⊗m} → Φ(A). For a finite simplicial diagram of presentably stable symmetric monoidal categories, a commutative algebra in the limit is descendable if and only if each of its evaluations is. All limits here are coherent limits; arbitrary inverse limits of categories are not covered by the last statement. (BS17 Theorem 11.15 and Lemma 11.17, p. 43; Lemma 11.20, pp. 43–44; Mathew Propositions 3.19, 3.22, 3.24–3.25 and 3.27, Corollary 3.21 and Definition 3.26, pp. 19–22.)

**Checks.**

- For A → A the Amitsur diagram is constant and its limit is Mod_A(C).
- Extension of scalars along a descendable map detects zero modules, and the unit and relative tensor products descend.
- ℤ_p → 𝔽_p fails the finite thick-generation test, so the descent equivalence is not claimed for it.

*Proof route.* The finite index makes the augmented Amitsur resolution of every module effective; apply the dual Barr–Beck–Lurie theorem to extension of scalars, whose conservativity follows from thick generation. Composition and intermediate algebras follow by induction through thick ideals; the lax monoidal statement transports the null-homotopy along the structure maps Φ(I)^{⊗i} → Φ(I^{⊗i}); finite limits use pointwise detection of a pro-constant tower (Mathew 3.25).

*Needs:* `IsDescendable`; `barrBeckLurie`; `leftModuleObjects`; `presentable_limit`.

**Uniform index along filtered colimits, and examples** (`isDescendable_colimit_of_uniformIndex`). Fix A ∈ CAlg(C) and a small filtered category I such that lim^s over I^{op} vanishes for s > d. If (B_i) is a coherent I-diagram of A-algebras and every A → B_i has index at most the same m, then A → colim_i B_i is descendable; for I = ℕ the index is at most 2m. Without a uniform bound this fails. For ordinary commutative rings: a quotient by a nilpotent ideal is descendable, but a quotient by a locally nilpotent ideal need not be; a faithfully flat map A → B with B countably presented as an A-algebra (countably many generators and relations) is descendable; and if A is Noetherian of finite self-injective dimension d (for example Gorenstein of Krull dimension d), every faithfully flat A → B has index at most d + 1. (BS17 Example 11.19, p. 43; Example 11.21, Lemma 11.22, p. 44; Remark 11.24, p. 45; Mathew Corollary 3.33, p. 24.)

**Checks.**

- For a sequential diagram with the same index m at every stage, the colimit has index at most 2m.
- For A = 𝔽_p[x₁, x₂, …]/(x₁², x₂³, …) and I = (x₁, x₂, …), every finitely generated subideal is nilpotent, so each A → A/J is descendable, but I is not nilpotent and A → A/I is not descendable: the uniform bound cannot be removed.
- For A = ℤ[a, b, c, d]/(ab + cd − 1), which is smooth over ℤ of relative dimension 3, hence regular of Krull dimension 4 and of global dimension 4, and B = A[1/a] × A[1/c], the faithfully flat map A → B has index at most 5 by the Gorenstein bound. (Since a and c generate the unit ideal, it is also a Zariski cover by two opens, which gives a sharper bound; the check exercises the injective-dimension argument.)
- Identity maps have index at most 1, and a zero unit allows index 0.

*Proof route.* For I = ℕ, Map(F, A) ≃ lim Map(F_i, A) with F = colim F_i the fibre of A → colim B_i; the class of F^{⊗m} → A lies in the lim¹ part, and products of two such classes vanish (`towerLimit_lim1_mul_eq_zero`), giving 2m. For general I use `derivedLimitFiltration`. For the Gorenstein bound, with Q = B/A flat, F^{⊗m} ≃ Q^{⊗m}[−m] and the map to A is a class in Ext^m_A(Q^{⊗m}, A), which vanishes for m > d (Mathlib `HasInjectiveDimensionLE`). Countable presentations use Mathew Corollary 3.33; nilpotent quotients have index bounded by the nilpotence order, since I^{⊗m} → A has image I^m.

*Needs:* `IsDescendable`; `moduleDescent`; `towerLimit_lim1_mul_eq_zero`; `derivedLimitFiltration`; `derivedTowerLimit`; `enhancedDerived`; Mathlib `CategoryTheory.HasInjectiveDimensionLE`, `Module.Flat`, `Module.FaithfullyFlat`.

### Examples

- In D∞(ℤ), ℤ → ℤ/p is not descendable: its fibre is ℤ mapping to ℤ by p, and I^{⊗m} → ℤ is multiplication by p^m, never null-homotopic. A finite Zariski cover A → ∏_i A[1/f_i] with (f_i) = A is descendable (`descendableCover_zariski`, Layer E2).

### Dependencies

Layers E0, E2:towers, E5:abstract and E5:presentability. Mathlib (injective dimension, flat and faithfully flat modules).

## Layer E5:animation: Animated commutative algebra

This layer builds animation: sifted colimits, the nonabelian derived category PΣ(C) of a small category with finite coproducts and its universal property, animated commutative rings as PΣ of finitely generated polynomial algebras, the vanishing of Frobenius on positive homotopy in characteristic p with the discreteness of perfections, the degreewise Witt vector functor on simplicial 𝔽_p-algebras, and the commutation of bounded totalizations with filtered colimits. Homotopy groups of an animated ring are indexed homologically: π_n sits in cohomological degree −n. The layer uses Layers E0, E3, E5:abstract and E5:presentability, and it precedes Layer E2, whose h-descent for perfect schemes uses `perfection_isDiscrete`.

### E5:animation.1 Sifted colimits and animation

**Sifted ∞-categories** (`IsSiftedInfinity`). A small ∞-category I is sifted when it is nonempty and the diagonal I → I × I is final (`IsFinal`, Section E0.4); equivalently, colimits over I in Spaces commute with finite products. Filtered ∞-categories and Δ^{op} are sifted. For the nerve of an ordinary category, Mathlib's `CategoryTheory.IsSifted` asks only that comma categories of the diagonal be connected, which does not give finality in the sense of `IsFinal`; the two agree when the diagonal is final in that sense. (HTT Definition 5.5.8.1, Warning 5.5.8.2, Example 5.5.8.3 and Lemma 5.5.8.4, printed p. 506; Propositions 5.5.8.6–5.5.8.7 and Lemma 5.5.8.11, printed pp. 507–508, PDF pp. 524–526.)

Provide `siftedDiagonal`, `siftedProductComparison` (colim(F × G) → colim F × colim G is an equivalence) and `siftedRealization` (geometric realization is a sifted colimit and commutes with finite products of spaces).

**Checks.**

- The empty ∞-category is not sifted: its colimit does not preserve the empty product.
- Δ^{op} is sifted.
- The discrete category on two objects is not sifted.

*Needs:* `IsFinal`; `overDiagram`; `final_fibre_inclusion`; `leftKanExtension_restrict_trivialFibration`; Mathlib `CategoryTheory.IsSifted`.

**The nonabelian derived category** (`nonabelianDerived`). For a small category C with finite coproducts, PΣ(C) is the full subcategory of Fun(C^{op}, Spaces) of functors carrying finite coproducts, the empty one included, to products. It is presentable; Yoneda is fully faithful, preserves finite coproducts, and has compact projective image (Map(y(c), −) preserves sifted colimits, which is stronger than compactness); every object is a sifted colimit of representables, namely the geometric realization of a simplicial object of coproducts of representables. Space-valued presheaves are essential; set-valued ones would lose animation. (HTT Proposition 5.5.8.10 and Lemma 5.5.8.14, printed pp. 507–510.)

Provide `nonabelianDerived`, `animationYoneda` and `animationResolution`.

**Checks.**

- If C is the category with one object, the initial one, PΣ(C) is Δ[0].
- PΣ(FinSet) is Spaces.
- Yoneda preserves finite coproducts in PΣ, unlike in the full presheaf category, where y(c ⊔ d) ≠ y(c) ⊔ y(d).

*Needs:* `IsSiftedInfinity`; `PrL`; `accessibleLocalization`; `leftKanExtension_restrict_trivialFibration`.

**The universal property of animation** (`animationExtension`). For C small with finite coproducts and D with filtered colimits and geometric realizations, restriction along Yoneda gives an equivalence between sifted-colimit-preserving functors PΣ(C) → D and all functors C → D; the inverse is sifted left Kan extension. The extension preserves all colimits exactly when the input preserves finite coproducts (D having them). Its value on a simplicial resolution is the realization of the values. PΣ(C) is presented by simplicial objects of the finite-product theory C^{op} with objectwise weak equivalences; this rectification is part of the statement. (HTT Proposition 5.5.8.15, printed p. 510, PDF p. 528; Proposition 5.5.9.1 and Corollary 5.5.9.3, printed pp. 516–517.)

**Checks.**

- For C = FinSet the extension of the inclusion into Spaces is the identity of Spaces.
- The extension of a finite-coproduct-preserving functor preserves finite coproducts, and two simplicial resolutions give equivalent values.
- Natural transformations extend uniquely: the statement is an equivalence of functor ∞-categories.

*Needs:* `nonabelianDerived`; `leftKanExtension_restrict_trivialFibration`.

**Animated commutative rings** (`animatedAlgebras`). For a commutative ring R, Poly_R is the category of polynomial R-algebras R[x₁, …, x_n] (Mathlib's `MvPolynomial (Fin n) R`) and all R-algebra maps, and AnimAlg_R = PΣ(Poly_R). It is equivalent to the localization of simplicial commutative R-algebras (`CategoryTheory.SimplicialObject` of commutative R-algebras) at the maps inducing isomorphisms on all homotopy groups. Ordinary R-algebras form a full subcategory (the discrete objects), whose inclusion has left adjoint π₀. The pushout B ⊗ᴸ_A C is computed by simplicial polynomial resolutions; for ordinary rings its homotopy groups are Tor_∗^A(B, C), and the underived pushout is correct only when the positive Tor groups vanish. Animated means simplicial commutative, not strictly commutative dg. (HTT §5.5.9, Propositions 5.5.9.1–5.5.9.2 and Corollary 5.5.9.3, printed pp. 516–517.)

Provide `animatedAlgebras`, `animatedDiscrete`, `animatedPiZero` and `animatedPushout`.

**Checks.**

- R[x₁, …, x_n] is discrete, and π₀ returns it.
- For k = 𝔽₂, π₁(k ⊗ᴸ_{k[t]} k) = k, with t acting by zero on both factors.
- A ⊗ᴸ_A B ≃ B.

*Needs:* `nonabelianDerived`; `animationExtension`; `IsDwyerKanLocalization`; Mathlib `MvPolynomial`, `CommRingCat`, `CategoryTheory.SimplicialObject`.

### E5:animation.2 Characteristic p

**Frobenius on homotopy and discreteness of perfection** (`frobenius_zero_on_positive_homotopy`, `perfection_isDiscrete`). For a simplicial commutative 𝔽_p-algebra A, Frobenius acts by zero on π_i(A) for i > 0. Hence the perfection colim(A →φ A →φ ⋯) is discrete and equals the perfection of π₀A; perfect discrete 𝔽_p-algebras are closed under colimits in animated rings; in particular B ⊗ᴸ_A C is discrete and perfect for perfect A, B, C, and equals B ⊗_A C. The perfection of a derived affine scheme is that of its classical truncation. That the multiplication A × A → A based at (0, 0) induces zero on positive homotopy does not mean the graded product on π_∗ vanishes. Over an imperfect base the statement fails: for A = 𝔽_p(t), A_perf ⊗_A A_perf contains the nonzero nilpotent t^{1/p} ⊗ 1 − 1 ⊗ t^{1/p}. Cosimplicial perfection need not be discrete. (BS17 Proposition 11.6 and its proof, Remarks 11.7, 11.8 and 11.11, Corollary 11.9 and Lemma 11.10, pp. 41–42; Bhatt, *Direct summand*, proof of Lemma 2.6, p. 5, for an application.)

**Checks.**

- For A = 𝔽_p ⊗ᴸ_{𝔽_p[x]} 𝔽_p, π₁A = 𝔽_p while the perfection of A is 𝔽_p, discrete: the derived class dies.
- For perfect B ← A → C all positive Tor groups vanish, as in `perfectRing_tor_eq_zero`.
- Over 𝔽_p(t) the tensor product of two perfections has the nonzero nilpotent above, so perfect factors over an imperfect base do not give a perfect pushout.

*Proof route.* Every class in π_i(A) comes from the universal class of A_i = Sym_{𝔽_p}(𝔽_p[i]) along a map A_i → A, so it suffices to treat A_i. For i = 1, A_1 = 𝔽_p ⊗ᴸ_{𝔽_p[x]} 𝔽_p and π_1 = (x)/(x²), killed by Frobenius; induct using A_{i+1} = 𝔽_p ⊗ᴸ_{A_i} 𝔽_p, whose π_{i+1} is identified with π_i(A_i) compatibly with Frobenius. Alternatively (BS17 Remark 11.8) the multiplication A × A → A induces zero on π_i for i > 0, and Frobenius is the diagonal followed by p-fold multiplication. Since π_i commutes with filtered colimits, perfection kills positive homotopy.

*Needs:* `animatedAlgebras`; `animationExtension`; Mathlib `PerfectRing`, `frobeniusEquiv`.

**The simplicial Witt vector functor** (`simplicialWitt`). For a simplicial commutative 𝔽_p-algebra A, apply Mathlib's p-typical Witt vectors `WittVector p` degreewise. The underlying simplicial set of W(A) is A^ℕ, so W preserves weak equivalences and π_i W(A) ≅ ∏_ℕ π_i A as pointed sets, as groups for i > 0 (Eckmann–Hilton); π₀W(A) = W(π₀A) with Witt addition, not coordinatewise addition. Witt Frobenius acts by zero on positive homotopy, its sequential localization is discrete, and W(A) → W(π₀A) becomes an equivalence after Frobenius localization. The fibre of W(A) → W(π₀A) is killed by p as a map, through a coherent factorization of p as VF and a null-homotopy of F on the fibre; p-torsion of its homotopy groups alone does not give this. (BS17 Lemma 11.43 and Remark 11.44, p. 52.)

Provide `simplicialWitt`, `simplicialWittPi` and `wittFrobeniusLocalization`.

**Checks.**

- For a constant simplicial ring A, W(A) is constant at Mathlib's W(A), and its n-th coordinate is `WittVector.coeff n`.
- For A = 𝔽_p ⊗ᴸ_{𝔽_p[x]} 𝔽_p, π₁W(A) ≅ ∏_ℕ 𝔽_p; computing W on π₀A alone would give zero.
- π₀W(A) is W(π₀A) with Witt addition: for A = 𝔽_p constant, π₀ = W(𝔽_p) = ℤ_p, not ∏_ℕ 𝔽_p as a ring.

*Proof route.* The coordinate description reduces weak-equivalence preservation to that of countable products of Kan complexes; Frobenius vanishing comes from `frobenius_zero_on_positive_homotopy` coordinatewise; the p-annihilation of the fibre is built from the coherent identity VF = p and the null-homotopy of F on positive homotopy.

*Needs:* `animatedAlgebras`; `frobenius_zero_on_positive_homotopy`; Mathlib `WittVector`.

### E5:animation.3 Bounded totalizations

**Bounded totalizations commute with filtered colimits** (`tot_filteredColimit_of_bounded`). For a cosimplicial diagram of n-truncated spaces (n ≥ 0 fixed), the totalization equals the partial totalization Tot_{n+1}. Consequently totalization commutes with filtered colimits of such diagrams when the truncation bound is uniform in the filtered index and the cosimplicial degree. For cosimplicial objects of a stable ∞-category all of whose terms are bounded above by b (in the sense of the t-structure, for spectra or for D∞(R)), π_k of the totalization is computed by Tot_r for r ≥ max(0, b − k + 1), which gives filtered-colimit commutation degree by degree; coconnective terms are the case b = 0. Arbitrary totalizations do not commute with filtered colimits. (BS17 §11, footnote 23, p. 46, and the coconnective argument in the proof of Proposition 11.41, p. 53; the finite-stage bounds are obtained from the matching-object tower.)

**Checks.**

- For 0-truncated terms Tot₁, the equalizer, suffices; for 1-truncated terms Tot₂ is needed for the coherence condition.
- The same bound is used for every input of the filtered diagram, and only finite limits are interchanged with the colimit.
- For terms bounded above by 0, the window for π_k is r ≥ max(0, 1 − k); there is no single finite stage for all degrees at once.

*Proof route.* In the Reedy tower, passing from Tot_{r−1} to Tot_r has obstruction in degree r − 1 of the matching fibre and space of choices Ω^r of it. For n-truncated spaces both vanish when r > n + 1. For terms bounded above by b, the layer Ω^r of a matching fibre is bounded above by b − r, so π_k and π_{k−1} of the layer vanish for r > b − k + 1. Partial totalizations are finite limits, which commute with filtered colimits and with homotopy groups.

*Needs:* `IsSiftedInfinity`; `IsEnhancedLimit`; `IsStable`.

### Examples

- 𝔽_p ⊗ᴸ_{𝔽_p[x]} 𝔽_p has π₀ = π₁ = 𝔽_p and no higher homotopy; its perfection is 𝔽_p and its degreewise Witt vectors have π₁ = ∏_ℕ 𝔽_p.
- PΣ(FinSet) = Spaces and PΣ(Poly_R) = AnimAlg_R are the two basic instances of animation.

### Dependencies

Layers E0, E3, E5:abstract and E5:presentability. Mathlib (sifted categories, polynomial rings, simplicial objects, commutative rings, perfect rings and Frobenius, Witt vectors).

## Layer E2: Repleteness, inverse limits, Postnikov convergence and descent

This layer develops the inverse-limit theory of sheaves: the permanence of repleteness and the exactness of countable products in replete topoi; derived limits of sequences and the Milnor sequence; Postnikov completion and the left completeness of D(X) on a replete topos, with the criteria for convergence of Postnikov towers from cohomological bounds; weakly contractible objects and locally weakly contractible topoi; hypercovers and descent for the enhanced derived category, bounded below and unbounded; sheaves of spaces and their Postnikov towers; and h-descent for quasicoherent and perfect complexes on perfect schemes. Here a topos means a Grothendieck topos presented by a fixed small site, D(X) = D∞(X, ℤ) unless coefficients are named, and all universes are fixed. The layer uses Layers E0, E1, E3, E2:towers, E5:descent and E5:animation.

### E2.1 Slices, covers and countable products in replete topoi

**Slices of replete topoi** (`IsReplete.over`, `IsReplete.of_equivalence`). If X is replete and U ∈ X, then X/U is replete. Repleteness is also invariant under equivalences of categories (`IsReplete.of_equivalence`), so it does not depend on the site presenting the topos. (BS-proet Lemma 3.1.2, p. 16.)

**Checks.**

- The slice over the final object recovers X.
- The forgetful functor X/U → X creates the limit of a sequence (the index category is connected) and preserves epimorphisms.

*Needs:* `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (`IsReplete`).

**Repleteness detected on a cover** (`IsReplete.of_over_epi`). If U → 1 is an epimorphism in a topos X and X/U is replete, then X is replete. (BS-proet Lemma 3.1.3, p. 16.)

**Checks.**

- Together with `IsReplete.over`, X is replete if and only if X/U is, for any U covering 1.
- For U = 1 the statement is trivial.

*Proof route.* Base change the sequence to U; pullback commutes with the limit, the projections become epimorphic in X/U, and a map of X is epimorphic when its pullback along U → 1 is.

*Needs:* `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (`IsReplete`).

**Epimorphisms of inverse limits** (`IsReplete.lim_map_epi`). In a replete topos, a map of inverse sequences F → G induces an epimorphism lim F → lim G when F_0 → G_0 and every F_{i+1} → F_i ×_{G_i} G_{i+1} are epimorphisms. Levelwise epimorphisms alone do not suffice. (BS-proet Lemma 3.1.8, p. 17.)

**Checks.**

- If F_i = G_i for all i the map is the identity.
- Levelwise surjective maps of inverse sequences of sets can induce a non-surjective map of limits; the relative condition is the hypothesis.

*Proof route.* For V → lim G start with V_0 = V ×_{G_0} F_0 and set V_{n+1} = V_n ×_{F_n ×_{G_n} G_{n+1}} F_{n+1}; the maps V_{n+1} → V_n are epimorphisms, and repleteness gives an epimorphism lim V_n → V with a compatible lift to lim F.

*Needs:* `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (`IsReplete`).

**Countable products in a replete topos** (`IsReplete.countableProduct_epi`). In a replete topos a countable product of epimorphisms is an epimorphism; consequently countable products of abelian sheaves are exact (Mathlib's `CategoryTheory.CountableAB4Star` holds for abelian sheaves). Uncountable products are not covered. (BS-proet Proposition 3.1.9, p. 17.)

**Checks.**

- For Set this is the countable product of surjections.
- The statement gives `CountableAB4Star` for abelian sheaves on a replete topos, as Mathlib proves it for light condensed abelian groups (`LightCondensed.epi_π_app_zero_of_epi`).

*Proof route.* Apply `IsReplete.lim_map_epi` to the finite partial products; finite products of epimorphisms are epimorphisms in a topos; products preserve kernels.

*Needs:* `IsReplete.lim_map_epi`; Mathlib `CategoryTheory.CountableAB4Star`.

### E2.2 Derived limits on a replete topos

**Amplitude of sequential derived limits** (`IsReplete.rlim_amplitude`). On a replete topos, Rlim of any inverse sequence of abelian sheaves has cohomology only in degrees 0 and 1. (BS-proet Proposition 3.1.11, p. 17.)

**Checks.**

- For epimorphic transitions the degree-one cohomology vanishes (`IsReplete.derived_limits` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.17).
- On the point, ℤ ←p ℤ ←p ⋯ has H⁰ = 0 and H¹ = ℤ_p/ℤ.

*Needs:* `IsReplete.countableProduct_epi`; `enhancedDerived`; `derivedTowerLimit`.

**The Milnor exact sequence** (`IsReplete.milnor`). For a coherent tower K_n in D∞(O) on a replete topos and every integer q there is a natural short exact sequence

```text
0 → lim¹_n H^{q−1}(K_n) → H^q(Rlim_n K_n) → lim_n H^q(K_n) → 0,
```

where lim¹ of a tower of module sheaves is the cokernel of its product–difference map. On an arbitrary topos derived products replace products and the sequence need not split this way. (Stacks, Cohomology on Sites, Lemma 21.23.2, tag 0D6K, PDF p. 48, with exact countable products.)

**Checks.**

- If the cohomology towers are eventually constant, the lim¹ term vanishes.
- The statement holds for negative and positive q alike.
- For strict towers of modules on the point it is the ordinary Milnor sequence.

*Needs:* `derivedTowerLimit`; `IsReplete.countableProduct_epi`; `IsReplete.rlim_amplitude`.

**Pro-zero errors and derived limits** (`IsReplete.rlim_eq_zero_of_proZero`). In a replete topos a pro-zero tower of module sheaves has lim = lim¹ = 0. Hence a coherent tower all of whose cohomology towers are pro-zero has Rlim = 0, and a map of coherent towers whose cone has this property induces an equivalence on Rlim. The killing stage may depend on n and on the degree. (Bhatt, *Direct summand*, Lemmas 3.4–3.6, p. 6, in the almost setting, and Lemma 5.3, p. 9; BS-proet Lemma 3.5.4, p. 25.)

**Checks.**

- A tower with zero transitions has Rlim = 0.
- Tensoring a degreewise pro-isomorphism of coefficient rings with a varying unbounded tower does not by itself give a pro-isomorphism; `coefficientProTorComparison` (Layer E4) proves the case needed, using uniform Koszul amplitude.

*Proof route.* For a pro-zero tower solve (1 − s)x = y componentwise by a finite sum, since only finitely many composites into a fixed stage are nonzero; the kernel is zero. Apply `IsReplete.milnor` in each degree to the cone and detect equivalences on cohomology.

*Needs:* `IsProZero`; `IsReplete.milnor`; `enhancedDerived`.

### E2.3 Postnikov completion and left completeness

**Postnikov left completion** (`postnikovCompletion`, `postnikovFunctor`). The left completion D̂(X) is the full subcategory of the coherent tower category Fun(N(ℕ^{op}), D(X)) on towers (K_n) with K_n ∈ D^{≥−n} and with τ^{≥−n} K_{n+1} → K_n an equivalence. Ψ : D(X) → D̂(X) sends K to (τ^{≥−n} K)_n. The construction does not presuppose that Ψ is an equivalence, and it uses coherent towers, not diagrams in the homotopy category. (BS-proet Definition 3.3.1, p. 18.)

Provide `postnikovCompletion`, `postnikovCompletion_eval` (the n-th term lies in D^{≥−n}), `enhancedCohomology` (integer cohomology objects, through the comparison with `DerivedCategory`), `postnikovFunctor`, `postnikovFunctor_eval` (the n-th term of Ψ(K) is τ^{≥−n} K with its canonical transition), `enhancedTruncGE` (the enhanced good truncation, compared with Mathlib's `CategoryTheory.Triangulated.TStructure.eTruncGE`), `truncGEUnit` and `IsPostnikovTower`.

**Checks.**

- Ψ(0) is the zero tower.
- For an abelian sheaf A in degree zero, Ψ(A) is the constant tower A.
- For A ≠ 0 in the heart, Ψ(A[1]) has Ψ(A[1])_0 = 0 and Ψ(A[1])_n = A[1] for n ≥ 1; the constant tower A[1] violates the condition at n = 0.

*Needs:* `enhancedDerived`; `enhancedPushforward`; `fullEnhancedSubcategory`; `coherentFun`; Mathlib `CategoryTheory.Triangulated.TStructure.eTruncGE`.

**The derived limit is right adjoint to Ψ** (`postnikovCompletion_adjunction`). The functor Rlim : D̂(X) → D(X) is right adjoint to Ψ, with unit K → Rlim τ^{≥−n} K. The adjunction is proved on mapping spaces: truncation adjunction identifies maps into the connective objects L_n, but the full derived Hom complexes are not identified degree by degree. (BS-proet Lemma 3.3.2, p. 18, with the proof corrected as described.)

**Checks.**

- On the point, with K = ℤ[1] and L_0 = ℤ[0], τ^{≥0}K = 0 but RHom(K, L_0) = ℤ[−1] has H¹ = ℤ ≠ 0: the degreewise comparison of RHom fails while both mapping spaces are contractible, as the adjunction requires.
- The unit is K → Rlim τ^{≥−n} K; being an adjunction does not make it invertible.

*Proof route.* Compute mapping spaces of coherent towers as homotopy equalizers of products, identify maps into the L_n by truncation adjunction, and pass to the limit of mapping spaces to get Map(ΨK, L) ≃ Map(K, Rlim L).

*Needs:* `postnikovCompletion`; `enhancedDerived`; `derivedTowerLimit`.

**Reconstruction of a compatible truncation tower** (`IsReplete.postnikov_counit`). If X is replete and L ∈ D̂(X), then τ^{≥−n} Rlim L → L_n is an equivalence for every n ≥ 0. Every integer degree m is treated, the negative ones included: H^m(L_n) is constant for n ≥ max(0, −m). (BS-proet Proposition 3.3.3, p. 19, essential surjectivity part, with the indexing corrected: the printed argument treats only nonnegative degrees and drops a finite prefix of a product.)

**Checks.**

- For L = Ψ(A[1]) the degree m = −1 is forced, and is treated.
- For m ≥ 0 the cohomology towers stabilize from n = 0.

*Proof route.* The Milnor sequence with eventually constant H^m and H^{m−1} towers gives H^m(Rlim L) ≅ H^m(L_n) for m ≥ −n; compare on all cohomology sheaves after truncation.

*Needs:* `postnikovCompletion`; `IsReplete.countableProduct_epi`; `IsReplete.rlim_amplitude`; `IsReplete.milnor`; `enhancedDerived`.

**Left completeness of replete topoi** (`IsReplete.leftComplete`). If X is replete, Ψ : D(X) → D̂(X) is an equivalence of ∞-categories with inverse Rlim. Its unit, K ≃ Rlim τ^{≥−n} K for every K, is `IsReplete.derivedCategory_leftComplete` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.17; the target adds essential surjectivity onto the coherent towers of D̂(X) (`IsReplete.postnikov_counit`) and the equivalence on mapping spaces. Repleteness alone is not asserted to give convergence of Postnikov towers of sheaves of spaces. (BS-proet Proposition 3.3.3, p. 19.)

**Checks.**

- Set is replete, so D(Ab) is left complete.
- For the topos of continuous sets of a profinite group of infinite cohomological dimension, presentability of D holds (`enhancedDerived_isPresentable`) but left completeness can fail; that topos is not replete.

*Needs:* `postnikovCompletion_adjunction`; `IsReplete.postnikov_counit`; `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (`IsReplete.derivedCategory_leftComplete`).

**Postnikov comparison under exact sections** (`postnikov_sections_of_exact`). If Γ(U, −) is exact on abelian sheaves of X, then RΓ(U, K) → Rlim RΓ(U, τ^{≥−n} K) is an equivalence for every K ∈ D(X); repleteness of X is not needed. This does not reconstruct K unless such section functors detect equivalences. (BS-proet Proposition 3.3.7(1), p. 20.)

**Checks.**

- For U weakly contractible (Section E2.5) the hypothesis holds.
- With only one exact section functor, K itself need not be recovered.

*Proof route.* With Γ(U, −) exact, derived sections are sections of any representative and commute with good truncations; apply left completeness of D(Ab).

*Needs:* `enhancedPushforward`; `derivedTowerLimit`; `IsReplete.leftComplete`.

### E2.4 Postnikov convergence from cohomological bounds

These targets are stated on a ringed site with D(O) = D∞(O); "cover" means a covering family of the site, H^p(V, F) is sheaf cohomology on V, and a cofinal system of covers of V is one refining every cover of V.

**Local injectivity for derived limits** (`rlim_cohomology_injective`). Let (K_n) be an inverse system in D(O), V an object and m an integer. Suppose a cofinal system of covers {V_i → V} and one N ≥ 0 satisfy lim¹_n H^{m−1}(V_i, K_n) = 0 and injectivity of H^m(V_i, K_n) → H^m(V_i, K_N) for all n ≥ N, for every member V_i. Then H^m(Rlim K_n)(V) → H^m(K_N)(V) is injective. (Stacks, Cohomology on Sites, Lemma 21.23.6, tag 0D6L.)

**Checks.**

- A single cover without cofinal refinements does not suffice: the proof refines a second time after choosing local representatives.
- For a constant system the conclusion is the identity.

*Needs:* `enhancedDerived`; `enhancedPushforward`; `TauCetiRoadmap.SchemeAndStackFoundations` §2.2 (`cech_to_cohomology`, sheaf cohomology on sites and the Čech comparison).

**Uniform stabilization of truncation cohomology** (`truncation_cohomology_window`). Let E ∈ D(O). For an object V suppose a cofinal family of covers and an integer function b_V satisfy H^p(V_i, H^{t−p}(E)) = 0 for p > b_V(t), all t and all members V_i. Fix m and put

```text
N = max(0, 1 + max(−m, b_V(m−1) − m, b_V(m) − m − 1, b_V(m+1) − m − 2)).
```

For n ≥ N the transitions of K_n = τ^{≥−n} E induce isomorphisms on H^{m−1}(V_i, −) and H^m(V_i, −), uniformly in the members. (Stacks, Cohomology on Sites, Lemma 21.23.7, tag 0D6M, explicit bound extracted from the proof.)

**Checks.**

- For b_V ≡ 0 and m = 0 the bound is N = 1.
- Controlling only the total degree m misses the two adjacent groups.

*Proof route.* Use the triangle H^{−n−1}(E)[n+1] → K_{n+1} → K_n → H^{−n−1}(E)[n+2]; the obstructing groups sit in cohomological degrees m + n, m + n + 1, m + n + 2, and the inequalities kill all three.

*Needs:* `enhancedDerived`; `enhancedPushforward`; `TauCetiRoadmap.SchemeAndStackFoundations` §2.2 (`cech_to_cohomology`); Mathlib `CategoryTheory.Triangulated.TStructure.eTruncGE`.

**Convergence from diagonal cohomology bounds** (`postnikov_converges_of_diagonalBound`). Let B be a family of objects covering the site and E ∈ D(O). If every V ∈ B has a cofinal family of covers and bounds b_V as in `truncation_cohomology_window`, then E → Rlim τ^{≥−n} E is an equivalence. No exactness of products is assumed. (Stacks, Cohomology on Sites, Lemma 21.23.7, tag 0D6M.)

**Checks.**

- The bound may depend on V and on the degree.
- On a replete topos the conclusion also follows from `IsReplete.derivedCategory_leftComplete` (`TauCetiRoadmap.SchemeAndStackFoundations` §2.17); here no repleteness is assumed.

*Proof route.* Fix m and V; the stabilization gives the hypotheses of `rlim_cohomology_injective`, eventually constant towers have lim¹ = 0, and E → K_N is an isomorphism on H^m for N ≥ −m; conclude on cohomology sheaves and use `DerivedCategory.isIso_iff`.

*Needs:* `truncation_cohomology_window`; `rlim_cohomology_injective`; Mathlib `DerivedCategory.isIso_iff`; `TauCetiRoadmap.SchemeAndStackFoundations` §2.2 (`cech_to_cohomology`).

**Convergence from local dimension bounds** (`postnikov_converges_of_localDimension`). Let B cover the site and E ∈ D(O). If every V ∈ B has d_V ≥ 0 and a cofinal family of covers with H^p(V_i, H^q(E)) = 0 for p > d_V and q < 0, then E → Rlim τ^{≥−n} E is an equivalence. (Stacks, Cohomology on Sites, Lemma 21.23.8, tag 0D6N.)

**Checks.**

- Different objects of B may have different bounds.
- The bound concerns the negative cohomology sheaves of E only.

*Proof route.* Take b_V(t) = d_V + max(0, t) and apply `postnikov_converges_of_diagonalBound`.

*Needs:* `postnikov_converges_of_diagonalBound`.

**The finite cohomological dimension criterion** (`postnikov_converges_of_finiteDimension`). Let B cover the site, E ∈ D(O) and d ≥ 0 with H^p(V, H^q(E)) = 0 for all V ∈ B, p > d and q < 0. Then E → Rlim τ^{≥−n} E is an equivalence. This is a statement about E; left completeness of D(O) needs it for every E. (Stacks, Cohomology on Sites, Lemma 21.23.10, tag 0D6P.)

**Checks.**

- For weakly contractible covering objects take d = 0.
- A bound for one E does not give left completeness of D(O).

*Proof route.* Covers by members of B are cofinal; apply `postnikov_converges_of_localDimension` with d_V = d.

*Needs:* `postnikov_converges_of_localDimension`.

### E2.5 Weakly contractible objects

**Exact sections over projective objects** (`projective_sections_exact`). For a projective object U of a topos X, Γ(U, −) is exact on abelian sheaves. (BS-proet Definition 3.2.1 and the proof of Proposition 3.2.3, pp. 17–18.)

**Checks.**

- Over the one-point set, Γ(U, −) is the identity on abelian groups.
- Over a set U, Γ(U, −) is the product indexed by U, hence is exact by choice.
- For a nontrivial finite group G, the terminal G-set is not projective: G → 1 has no equivariant section, and taking invariant sections need not preserve epimorphisms. For G cyclic of prime order p, the augmentation ℤ[G] → ℤ is surjective but its map on invariants has image pℤ.

*Proof route.* Sections preserve finite limits. Given an epimorphism of abelian sheaves F → G and a section g over U, pull it back to an epimorphism of objects over U. Projectivity supplies a section of that pullback, and therefore a lift of g.

*Needs:* Mathlib `CategoryTheory.Sheaf`, `CategoryTheory.Projective` and `CategoryTheory.Projective.factors`.

**Locally weakly contractible topoi** (`IsLocallyWeaklyContractible`). A topos is locally weakly contractible when every object admits an epimorphism from a coproduct of coherent weakly contractible objects. Coherence (quasicompact and quasiseparated, as in `DiamondsAndVStacks` D0.17) is part of the definition; it is used for compact generation and is stronger than the covering condition alone. Such a topos is replete: this is `isReplete_of_locallyWeaklyContractible` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (BS-proet Proposition 3.2.3(1)), whose hypothesis is this predicate; the converse is not claimed. (BS-proet Definition 3.2.1, p. 17, and Example 3.2.2, p. 18.)

Provide `IsLocallyWeaklyContractible`, `IsLocallyWeaklyContractible.cover` and `IsLocallyWeaklyContractible.detect_epi` (a map is an epimorphism exactly when it is surjective on sections over every coherent weakly contractible object).

**Checks.**

- Set is locally weakly contractible, through covers by points.
- For a finite group G, G-sets are covered by free transitive G-sets, which are coherent and weakly contractible.
- In Set the terminal object is covered by one point.

*Needs:* `CategoryTheory.Projective`; `DiamondsAndVStacks` D0.17 (quasicompact and quasiseparated objects of a topos).

**Compact generators from weakly contractible objects** (`IsLocallyWeaklyContractible.compactlyGenerated`). If X is locally weakly contractible, D(X, ℤ) is compactly generated by the objects j_!ℤ for coherent weakly contractible j : U → 1, one for each member of a small covering family. `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 states the case of the pro-étale topos of a scheme; this is the statement for every locally weakly contractible topos. (BS-proet Proposition 3.2.3(2), p. 18.)

**Checks.**

- For X = Set the generator is ℤ, which generates D(Ab).
- Maps from shifts of j_!ℤ compute the cohomology of sections over U.

*Proof route.* Maps out of j_!ℤ[−i] are H^i(U, −); Γ(U, −) is exact and, for coherent U, commutes with filtered colimits (`DiamondsAndVStacks` D0.18), so j_!ℤ is compact; if all maps out of the generators vanish, every cohomology sheaf vanishes on a covering family.

*Needs:* `IsLocallyWeaklyContractible`; `enhancedDerived_isPresentable`; `IsPresentable`; `DiamondsAndVStacks` D0.18 (filtered colimits of abelian sheaves and their cohomology on an algebraic topos).

### E2.6 Hypercovers and descent

**Hypercovers in a topos** (`Hypercover`). An augmented simplicial object U_• → 1 in a topos is a hypercover when U_0 → 1 is an epimorphism and every matching map U_n → (cosk_{n−1} U)_n, n > 0, is an epimorphism, the coskeleton being taken in augmented simplicial objects. (BS-proet Proposition 3.3.6 and the notation after it, p. 20.)

Provide `Hypercover`, `Hypercover.matching_epi` and `Hypercover.oneHypercover` (its degree-zero and degree-one data give Mathlib's `CategoryTheory.GrothendieckTopology.OneHypercover` after choosing representable covers on a site).

**Checks.**

- The constant simplicial object at the final object is a hypercover.
- The Čech nerve of an epimorphism U → 1 is a hypercover.
- In Set, the constant simplicial two-element set augmented to a point is not a hypercover: the degree-one matching map {0, 1} → {0, 1}² is not surjective.

*Needs:* Mathlib `CategoryTheory.GrothendieckTopology.OneHypercover`, `SSet`, `CategoryTheory.SimplicialObject`.

**Cartesian derived systems on a hypercover** (`cartesianDerivedSystem`). For a hypercover f : U_• → 1 in X, form the enhanced derived category of the simplicial topos X/U_• and its full subcategory D_cart(U_•) of systems K for which every simplicial operator α : [n] → [m] induces an equivalence α^∗K_n → K_m. Pullback f^∗ sends K ∈ D(X) to its restrictions to the X/U_n. (BS-proet Proposition 3.3.6, p. 20, notation before the proof.)

Provide `cartesianDerivedSystem`, `cartesianDerivedSystem_transition`, `hypercoverPullback` and `cartesianDerivedSystem_truncate` (good truncation preserves the Cartesian condition, since slice pullbacks are exact).

**Checks.**

- For the identity hypercover, D_cart is D(X).
- The family of restrictions of one complex is Cartesian.
- On the identity hypercover of Set, the cosimplicial system [n] ↦ ℤ[Hom_Δ([0], [n])] in degree zero is not Cartesian: a coface gives ℤ → ℤ², not an isomorphism.

*Needs:* `Hypercover`; `enhancedDerived`; `enhancedPullback`; `restrictedStraightening`.

**Bounded-below hypercover descent** (`hypercoverDescent_boundedBelow`). For a hypercover of any topos, f^∗ is an equivalence D^+(X) ≃ D^+_cart(U_•), the lower bound being uniform in the simplicial degree, with inverse Rf_∗. Repleteness is not needed. (BS-proet Proposition 3.3.6(1) and (3), p. 20; Stacks, Simplicial Spaces, Lemmas 85.17.1, 85.17.3 and 85.17.5, tags 0D8G, 0D8I, PDF pp. 39–42; Cohomology on Sites, Lemma 21.28.5, tag 0D7U, PDF p. 60.)

**Checks.**

- The identity hypercover gives the identity equivalence.
- A separate lower bound in each simplicial degree, not uniform, is not the hypothesis.

*Proof route.* Present the topos by a site with fibre products and use the total site of the hypercover; ordinary descent identifies abelian sheaves on X with Cartesian sheaves, a weak Serre subcategory (Stacks 85.12.6, 85.17.1); the hypercover resolution and K-injective totalization give the unit (85.17.3); extend from sheaves to uniformly bounded below complexes by triangles and the truncation spectral sequence (21.28.5); the dg localization upgrades unit and counit to enhanced equivalences.

*Needs:* `cartesianDerivedSystem`.

**Full faithfulness of unbounded hypercover pullback** (`hypercoverPullback_unit`). For any hypercover of a topos X, the unit K → Rf_∗ f^∗ K is an equivalence for every K ∈ D∞(X). Repleteness is not needed for the unit. (Stacks, Simplicial Spaces, Lemma 85.17.3, tag 0D8G, and its proof, PDF pp. 39–40.)

**Checks.**

- No cohomological dimension bound is needed.
- For the identity hypercover the unit is the identity.

*Proof route.* Resolve by K-injectives and compare the product-total Hom double complex of the hypercover; the augmented free hypercover complex is acyclic, so the comparison is a quasi-isomorphism in each degree, identified with the enhanced unit through mapping spaces.

*Needs:* `cartesianDerivedSystem`; `kInjectiveReplacement`.

**The left adjoint counit** (`hypercoverPullback_counit_left`). For a hypercover in a replete topos and the adjunction f_! ⊣ f^∗ (f_! from `adjointFunctorTheorem`), the counit f_! f^∗ → id is an equivalence on D(X). It is f_!, not f_∗, in this counit. (BS-proet Proposition 3.3.6(2), p. 20.)

**Checks.**

- For the identity hypercover f_! = id.
- A fully faithful right adjoint always has invertible counit; this is the input used.

*Needs:* `hypercoverPullback_unit`; `cartesianDerivedSystem`; `adjointFunctorTheorem`.

**Unbounded hypercover descent** (`hypercoverDescent`). For a hypercover of a replete topos X, f^∗ : D(X) → D_cart(U_•) is an equivalence. (BS-proet Proposition 3.3.6(3), p. 20.)

**Checks.**

- For the identity hypercover this is Postnikov reconstruction.
- Both full faithfulness and essential surjectivity are proved; existence of one equivalence does not give independence of the hypercover, which is `hypercoverDescent_refinement`.

*Proof route.* Full faithfulness is `hypercoverPullback_unit`. Truncate a Cartesian system uniformly (still Cartesian), descend each truncation by `hypercoverDescent_boundedBelow`, and reconstruct the limit using that slice pullbacks preserve limits and every slice is replete.

*Needs:* `hypercoverPullback_unit`; `hypercoverDescent_boundedBelow`; `IsReplete.over`; `IsReplete.postnikov_counit`.

**Independence under refinement** (`hypercoverDescent_refinement`). For a refinement V_• → U_• of hypercovers of a replete topos X, pullback D_cart(U_•) → D_cart(V_•) is an equivalence, compatible with composition of refinements, and identified with the identity of D(X) under the descent equivalences. On uniformly bounded below Cartesian subcategories the same holds for any topos. (BS-proet Proposition 3.3.6, p. 20; Stacks, Simplicial Spaces, Lemmas 85.18.4 and 85.20.4, tags 0DA2, 0DA7, PDF pp. 43–45.)

**Checks.**

- The identity refinement acts by the identity.
- Two successive refinements give their composite up to the prescribed natural equivalence.
- The statement concerns Cartesian systems, not arbitrary simplicial derived objects.

*Needs:* `hypercoverDescent`; `hypercoverDescent_boundedBelow`; `coherentFun`; `restrictedStraightening`.

### E2.7 Sheaves of spaces

**Space-valued sheaves and Postnikov towers** (`spaceSheaves`). For a small site, the sheaves of spaces are the accessible localization of the presheaf ∞-category Fun(C^{op}, Spaces) at the covering-sieve inclusions; localizing further at all hypercovers gives the hypercomplete subcategory. Truncations τ_{≤n} and the coherent Postnikov tower are formed there. Hypercompleteness (descent along all hypercovers) and Postnikov completeness (convergence and effectivity of Postnikov towers) are different, and the second is not automatic for hypercomplete topoi. (HTT Definitions 6.2.2.1 and 6.2.2.6, Proposition 6.2.2.7 and Construction 6.2.2.9, PDF pp. 595–599; Proposition 6.5.2.8 and the hypercompletion, PDF pp. 686–687; Theorem 6.5.3.12 and Corollary 6.5.3.13, PDF p. 698; Definition 5.5.6.23 and Proposition 5.5.6.26, PDF pp. 516–517; Proposition 7.2.1.10, PDF pp. 738–739.)

Provide `spaceSheaves`, `hypercompleteSpaceSheaves`, `spacePostnikovTower` and `spacePostnikov_convergence` (convergence means F → lim_n τ_{≤n} F is an equivalence; categorical completeness also asks effectivity of towers).

**Checks.**

- On the one-point site sheaves are spaces and every Postnikov tower converges.
- A 0-truncated sheaf of spaces is the nerve of an ordinary sheaf of sets.
- For n ≥ 1, τ_{≤n−1} K(ℤ, n) is a point while τ_{≤n} K(ℤ, n) ≃ K(ℤ, n).

*Needs:* `coherentFun`; `restrictedStraightening`; `accessibleLocalization`; `Hypercover`; `spaceInfinity`.

**Postnikov convergence for sheaves of spaces on a locally weakly contractible topos** (`IsLocallyWeaklyContractible.spacePostnikov`). If X is locally weakly contractible, Postnikov towers converge in the hypercomplete ∞-topos of sheaves of spaces on X. Repleteness alone is not claimed to suffice, and this is not deduced from left completeness of D(X). (BS-proet Proposition 3.2.3(3), p. 18.)

**Checks.**

- On Set this is convergence of the Postnikov tower of a space.
- The proof evaluates on weakly contractible objects, where homotopy sheaves become homotopy groups of the values.

*Needs:* `IsLocallyWeaklyContractible`; `spaceSheaves`.

### E2.8 h-descent on perfect schemes

Schemes are qcqs; perfect schemes and the colimit perfection are those of `TauCetiRoadmap.SchemeAndStackFoundations` §0.24, and perfectly finitely presented and perfectly proper maps those of §0.25. Coherence of higher direct images along proper maps to locally Noetherian schemes is `TauCetiRoadmap.JacobianChallenge` Layer C, and flat base change for quasicoherent higher direct images is `qcoh_higherDirectImages` of `TauCetiRoadmap.SchemeAndStackFoundations` §2.6.

**The h-topology on perfect schemes** (`perfectHTopology`). On perfect qcqs 𝔽_p-schemes, an h-cover is the perfection of an h-cover of qcqs 𝔽_p-schemes, the h-topology on schemes being generated by fppf covers and by finitely presented proper surjections (equivalently by finitely presented v-covers, BS17 Theorem 2.4 and Definition 2.7). Over a fixed perfect base, the site of perfectly finitely presented schemes uses the same covers; cardinal cutoffs make the site small. (BS17 Definition 11.1, p. 40; Theorem 2.4 and Definition 2.7, pp. 5–6; Theorem 2.9, pp. 6–8.)

Provide `perfectHTopology`, `perfectHCovers_pullback` and `perfectHCovers_perfection`.

**Checks.**

- The identity is an h-cover.
- The perfection of an fppf cover is an h-cover.
- The empty scheme does not h-cover a nonempty scheme.

*Needs:* `QuasicoherentDerived`; `TauCetiRoadmap.SchemeAndStackFoundations` §0.24 (scheme perfection) and §0.25 (perfectly finitely presented and perfectly proper maps).

**Inductive level of proper surjections** (`properSurjective_inductiveLevel`). A finitely presented proper surjection f : X → Y of qcqs schemes has inductive level 0 when, after refinement, it is a proper fppf cover followed by a finitely presented nil-immersion into Y; it has level ≤ n when, after refinement, it factors as X′ → X₀ → Y₀ → Y with Y₀ → Y a finitely presented nil-immersion, X₀ → Y₀ proper surjective of finite presentation and an isomorphism outside a finitely presented closed Z ⊆ Y₀ over which it has level ≤ n − 1, and X′ → X₀ a proper fppf cover. Every such f has finite inductive level (at most dim Y after Noetherian approximation). These notions are stable under base change. (BS17 Definition 2.5 and Lemma 2.6, pp. 5–6.)

**Checks.**

- A finite étale cover has level 0.
- The blow-up of 𝔸²_k at the origin has level ≤ 1: it is an isomorphism away from the origin, over which it is the projective line, a proper fppf cover of the point.
- Level 0 alone does not cover all proper surjections; the induction on the closed complement is needed.

*Proof route.* Reduce to Y of finite type over ℤ by Noetherian approximation and induct on dim Y: by generic flatness and flattening by blowing up, refine X → Y by X′ → X₀ → Y with X′ → X₀ a proper fppf cover and X₀ → Y a blow-up that is an isomorphism outside Z with dim Z < dim Y.

*Needs:* `TauCetiRoadmap.SchemeAndStackFoundations` §0.9 (Noetherian approximation) and §4.12 (`generic_flatness`, `flattening_by_blowup`).

**Descendable maps from algebraic geometry** (`descendableCover_zariski`, `descendableCover_fppf`, `descendableCover_nilpotent`, `descendable_pushforward`). For a map f : X → Y of qcqs schemes, in Dqc: (1) for a finite cover of X by quasicompact opens j_i : U_i → X, O_X → ∏_i Rj_{i∗} O_{U_i} is descendable; (2) if f is fppf, O_Y → Rf_∗ O_X is descendable; (3) for a nilpotent quasicoherent ideal I, O_X → O_X/I is descendable; (4) if A → B is descendable in Dqc(X), then Rf_∗A → Rf_∗B is descendable in Dqc(Y). (BS17 Lemma 11.23, p. 44, which cites the first arXiv version of Mathew; in the version cited here the inputs are Proposition 3.25 for (1), Corollary 3.33 for (2) and Proposition 3.35 for (3), pp. 21–24, while (4) is the preservation of descendability by colimit-preserving lax monoidal functors, as in `moduleDescent`.)

**Checks.**

- A single open U = X gives the identity, of index 1.
- For a nilpotent ideal with I^m = 0 the index is at most m.
- For a non-surjective open immersion j : U → X, O_X → Rj_∗O_U is not descendable: tensoring with Rj_∗O_U kills every nonzero complex supported on the complement of U, so extension of scalars is not conservative.

*Proof route.* (1) writes Dqc(X) as a finite limit of the Dqc of intersections and uses pointwise detection (`moduleDescent`); (2) reduces by (1) and lax monoidal pushforward to affines, where it is faithfully flat descendability of a countably presented algebra after approximation (`isDescendable_colimit_of_uniformIndex`); (3) is the nilpotent case of the same target; (4) is preservation by lax monoidal colimit-preserving functors.

*Needs:* `IsDescendable`; `moduleDescent`; `isDescendable_colimit_of_uniformIndex`; `QuasicoherentDerived`; `enhancedPushforward`.

**Descendability of h-covers of Noetherian schemes** (`descendable_hCover_noetherian`). For an h-cover f : X → Y of Noetherian schemes, O_Y → Rf_∗ O_X is descendable in Dqc(Y). (BS17 Proposition 11.25, p. 45.)

**Checks.**

- An fppf cover is a special case, by `descendableCover_fppf`.
- The blow-up of a regular surface at a point is descendable.
- A non-surjective map is never descendable; surjectivity is part of being an h-cover.

*Proof route.* Reduce to f proper surjective (`descendableCover_zariski` and refinement), of inductive level ≤ n, and induct on n. For n = 0 combine the fppf and nilpotent cases. In general, after refinement and the n = 0 case, assume f is an isomorphism outside Z = V(I) on affine Y. The fibre F of O_Y → Rf_∗O_X has coherent bounded cohomology supported on Z (coherence of proper higher direct images, `TauCetiRoadmap.JacobianChallenge` Layer C, and flat base change to Y − Z, `TauCetiRoadmap.SchemeAndStackFoundations` §2.6), so it is an O_Y/I^k-complex for large k; by induction F^{⊗k} → O_Y factors through I, and F^{⊗(k+1)} → O_Y factors through I ⊗ F → F, which is null since F is an O_Y/I-complex.

*Needs:* `properSurjective_inductiveLevel`; `descendableCover_zariski`, `descendableCover_fppf`, `descendableCover_nilpotent`, `descendable_pushforward`; `IsDescendable`; `TauCetiRoadmap.JacobianChallenge` Layer C (coherence of proper higher direct images); `TauCetiRoadmap.SchemeAndStackFoundations` §2.6 (`qcoh_higherDirectImages`, flat base change).

**Quantitative descendability of perfect h-covers** (`perfectHCover_descendable`). For an h-cover f : X → Y of perfect qcqs 𝔽_p-schemes, O_Y → Rf_∗ O_X is descendable: some finite tensor power of its fibre maps null-homotopically to O_Y. No index uniform over all h-covers is asserted; along the Frobenius approximation of a fixed fppf or proper Noetherian cover the index is bounded independently of the stage. An arbitrary filtered colimit of descendable maps is not descendable (BS17 Example 11.21). (BS17 Theorem 11.27 and its proof, p. 46; Lemmas 11.22–11.23, p. 44; Proposition 11.25, p. 45; Proposition 11.6, pp. 41–42.)

**Checks.**

- For the perfection of an fppf cover f₀ of index m, every Frobenius stage has index m and the limit has index at most 2m.
- In the proper case the stages are derived fibre products; their limit is still the perfection X, because the perfection of an animated 𝔽_p-algebra is discrete (`perfection_isDiscrete`, Layer E5:animation).

*Proof route.* By approximation, dévissage and derived base change reduce to f the perfection of an fppf or proper surjective map f₀ : X₀ → Y₀ of Noetherian schemes, descendable of some index m by `descendableCover_fppf` or `descendable_hCover_noetherian`. With W_n = X_n ×_{Y_n} Y (derived fibre product in the proper case), each O_Y → Rg_{n∗}O_{W_n} has index ≤ m by base change, and X = lim W_n, the derived terms disappearing in the limit by `perfection_isDiscrete`; `isDescendable_colimit_of_uniformIndex` for I = ℕ concludes.

*Needs:* `perfectHTopology`; `QuasicoherentDerived`; `perfectScheme_baseChange`; `perfectRing_tor_eq_zero`; `perfection_isDiscrete`; `descendableCover_fppf`; `descendable_hCover_noetherian`; `isDescendable_colimit_of_uniformIndex`; `derivedTowerLimit`; `IsReplete.milnor`.

**Boundedness detected by perfect h-covers** (`perfect_hBoundedness`). For an h-cover f : X → Y of perfect qcqs schemes and K ∈ Dqc(Y), if Lf^∗K is bounded then K is bounded. On perfectly finitely presented schemes, pullback preserves bounded complexes by finite Tor dimension. Arbitrary ring maps do not reflect boundedness. (BS17 Lemma 11.30 and proof of Theorem 11.2(3), pp. 47–48.)

**Checks.**

- For the perfection of an fppf cover this is faithfully flat detection on cohomology.
- The finite-presentation condition is kept in the preservation statement.

*Proof route.* For fppf covers use faithfully flat detection; for proper covers refine to modifications and induct on the closed complement, using the pullback square of structure sheaves, the projection formula and finite cohomological dimension to write K as a finite limit of pullbacks of bounded complexes.

*Needs:* `perfectHTopology`; `perfectPresentation_torDimension_le`; `perfectScheme_baseChange`; `properSurjective_inductiveLevel`.

**h-descent for quasicoherent and perfect complexes** (`perfect_hDescent`). The functor X ↦ Dqc(X) on perfect qcqs 𝔽_p-schemes satisfies h-Čech descent, and X ↦ Perf(X) satisfies h-hyperdescent. On perfectly finitely presented maps, the bounded subcategory Dqc^b is functorial and satisfies h-descent, since finite Tor dimension preserves boundedness and h-covers detect it. Unbounded h-hyperdescent over an arbitrary perfect base is not asserted. (BS17 Theorem 11.2(1)–(3), p. 40; Lemmas 11.22–11.23 and Proposition 11.25, pp. 44–45; Theorem 11.27 and its proof, p. 46; the amplitude argument, pp. 46–48.)

**Checks.**

- Perfect complexes have uniform local amplitude along a hypercover, which is what gives hyperdescent for Perf.
- An h-Čech statement for unbounded Dqc is not upgraded to hyperdescent without the finite-dimensional base of `perfect_hHyperdescent`.

*Proof route.* `perfectHCover_descendable` and `moduleDescent` give Čech effectivity for Dqc. For Perf restrict to complexes of finite amplitude, whose mapping spaces are truncated, and use that a Cartesian hypercover datum keeps the amplitude of its degree-zero term. Finite Tor dimension and `perfect_hBoundedness` handle Dqc^b.

*Needs:* `perfectHTopology`; `perfectScheme_baseChange`; `perfectPresentation_torDimension_le`; `perfect_hBoundedness`; `QuasicoherentDerived`; `perfectHCover_descendable`; `moduleDescent`.

**Tensor products and bounded totalizations** (`tensor_tot_of_bounded`). If R has finite global dimension, N^• is a cosimplicial R-module (each term in degree zero) and Tot N^• is bounded, then for every unbounded M ∈ D∞(R), M ⊗ᴸ_R Tot N^• → Tot(M ⊗ᴸ_R N^•) is an equivalence. Arbitrary tensor products do not commute with arbitrary totalizations of unbounded cosimplicial complexes. (BS17 Lemma 11.36, pp. 50–51.)

**Checks.**

- For a constant cosimplicial module the comparison is the identity.
- Both the boundedness of Tot N^• and the degree-zero condition on the N^n are used.

*Proof route.* The global-dimension bound controls tensor products of unbounded M with bounded complexes through truncations; for bounded M reduce to projective modules and compute Tot by Dold–Kan; pass through the truncation towers degree by degree using the uniform bounds.

*Needs:* `perfect_projectiveDimension_le`; `derivedTensor`; `derivedTowerLimit`; `IsReplete.milnor`.

**Unbounded h-hyperdescent over a finite-dimensional perfect base** (`perfect_hHyperdescent`). Let k be the perfection of a regular Noetherian 𝔽_p-algebra of finite Krull dimension. On perfectly finitely presented perfect k-schemes, X ↦ Dqc(X) satisfies h-hyperdescent: for an h-hypercover X_• → Y and K ∈ Dqc(Y), RΓ(Y, K) ≃ Tot RΓ(X_•, K|_{X_•}), and every Cartesian Dqc datum on X_• is effective. The bound is on the regular presentation of the base, not on arbitrary perfect rings. (BS17 Theorem 11.2(4), p. 40; Lemmas 11.37–11.38 and Remark 11.39, pp. 50–51.)

**Checks.**

- The conclusion is an equivalence of enhanced categories, mapping spaces and essential surjectivity included.
- Over an arbitrary perfect base only Čech descent (`perfect_hDescent`) is asserted.

*Proof route.* Refine to an affine hypercover; the totalization of structure sheaves is the base ring in degree zero, so finite global dimension and `tensor_tot_of_bounded` give hyperdescent of RΓ for any K. For a Cartesian datum define its sheaf by totalization after each base change and use h-Čech effectivity on X_0.

*Needs:* `perfect_hDescent`; `tensor_tot_of_bounded`; `QuasicoherentDerived`; `spaceSheaves`.

### Examples

- The pro-étale topos of a scheme and the topos of condensed sets are locally weakly contractible, hence replete; their consuming roadmaps verify this. Set and presheaf topoi are the elementary examples, and BG for a nontrivial finite group G shows that the terminal object need not be weakly contractible.
- On the point, the tower ℤ ←p ℤ ←p ⋯ has lim = 0 and Rlim = (ℤ_p/ℤ)[−1], the Milnor sequence in degree 1; the tower (ℤ/p^n) has epimorphic transitions and Rlim = ℤ_p[0].
- The blow-up of 𝔸²_k at the origin has inductive level 1; its perfection is an h-cover, so O → Rf_∗O is descendable after perfection.

### Dependencies

Layers E0, E1, E3, E2:towers, E5:descent and E5:animation. Mathlib (sheaves, limits, countable AB4∗, hypercovers of degree one, t-structures and truncations); `DiamondsAndVStacks` D0.17 (qcqs objects of a topos) and D0.18 (filtered colimits and cohomology on algebraic topoi); `TauCetiRoadmap.SchemeAndStackFoundations` §§0.9, 0.24–0.25 (approximation, perfect schemes, perfectly finitely presented maps), §§2.2, 2.6, 2.17 (the Čech comparison, quasi-coherent cohomology and flat base change, repleteness) and §4.12 (generic flatness and flattening); `TauCetiRoadmap.JacobianChallenge` Layer C (coherence of proper higher direct images).

## Layer E4: Derived completion of sheaves and coefficient reconstruction

This layer defines derived I-complete complexes of sheaves on a replete topos and builds the completion reflector, completed tensor products and their internal Hom, the comparison with classical completeness, the Koszul model of completion and the algebra of regular ideals, and the reconstruction of complete complexes from their derived reductions modulo I^n. Its point-topos cases are the generic derived completion of complexes of modules, which other roadmaps import from here. Throughout, X is a replete topos (Layer E2), R a sheaf of commutative rings (or a commutative ring, viewed as a constant sheaf) and I ⊆ R an ideal, locally finitely generated; D(X, R) = D∞(X, R) with cohomological grading. In Section E4.5 and in `regularIdeal_quotients`, R is a commutative ring and I = (f₁, …, f_r) is generated by a finite regular sequence in Mathlib's sense (`RingTheory.Sequence.IsRegular`, which includes nontriviality of R/I); the empty sequence covers I = 0, no Noetherian hypothesis is imposed, R_n = R/I^n for n ≥ 1, and all tensor products are derived. For x a local section of R, T(K, x) is the derived limit of the tower K ←x K ←x ⋯.

### E4.1 Derived complete sheaves and the completion reflector

**Derived complete sheaves** (`DerivedCompleteSheaves`). Dcomp(X, R, I) is the full subcategory of D(X, R) on those K such that T(K|_U, x) = 0 for every object U of X and every x ∈ I(U). The condition is imposed on every slice and every local section of the ideal. On the point topos this is derived I-completeness of complexes of R-modules. (BS-proet Definition 3.4.1 and the paragraph after it, p. 21.)

Provide `IsDerivedComplete` (the module predicate of the point topos: for every f ∈ I, (x_n) ↦ (x_n − f x_{n+1}) is bijective on M^ℕ), `DerivedCompleteSheaves` with its fully faithful inclusion, `derivedCompleteSheaf_iff` (membership is the vanishing of all local telescopes), `derivedCompleteSheaf_restrict` (stable under restriction to slices, coherently) and `derivedCompleteSheaf_zero`.

**Checks.**

- For I = 0 every complex is complete: a tower with zero transitions has zero limit.
- For X = Set, R = ℤ and I = (p), ℤ[1/p] is not complete: its p-telescope is ℤ[1/p] itself. Equivalently ℤ[1/p][−1] is not complete although Map(ℤ[1/p], ℤ[1/p][−1]) is contractible, so a test by maps from the unshifted generator alone would wrongly accept it; the telescope (equivalently maps from all shifts of R[1/f]) detects it.
- For X = Set and a module M in degree zero, the condition agrees with the elementary one: for every f ∈ I the map M^ℕ → M^ℕ, (x_n) ↦ (x_n − f x_{n+1}), is bijective.
- ℤ_p[0] is (p)-complete over ℤ, and so is every module killed by a power of p.

*Needs:* `IsReplete.over`; `enhancedDerived`; `derivedTensor`; `derivedTowerLimit`; `fullEnhancedSubcategory`; `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (`IsReplete`).

**The local generator criterion** (`derivedComplete_iff_generators`). If {U_a → 1} covers X and I|_{U_a} is generated by f_{a,1}, …, f_{a,r(a)}, then K is derived I-complete if and only if T(K|_{U_a}, f_{a,j}) = 0 for all a and j. In particular different finite generating families define the same subcategory. (BS-proet Lemmas 3.4.6–3.4.8, pp. 21–22; Lemma 3.4.12, pp. 22–23.)

**Checks.**

- For I = 0 the empty generating family imposes no condition.
- Testing global sections only does not replace the slice condition.

*Proof route.* Vanishing for all local sections implies the finite tests. Conversely, on each slice, vanishing of T(−, x) is stable under multiplying x by a section and under sums of two generators (by the localization and Mayer–Vietoris argument for R[1/(x + y)]); restriction commutes with the limits and equivalences are local.

*Needs:* `DerivedCompleteSheaves`; `IsReplete.over`; `enhancedDerived`; `derivedTensor`.

**Limits of complete sheaves** (`derivedComplete_limits`). The inclusion Dcomp(X, R, I) → D(X, R) creates small limits and the subcategory is stable: limits, zero, shifts and finite cofibres of complete objects are complete. Coproducts in D(X, R) of complete objects need not be complete. (BS-proet paragraph after Definition 3.4.1, p. 21; proof of Lemma 3.4.13, p. 23.)

**Checks.**

- Objects killed by a power of I, and limits of such objects, are complete.
- ⊕_ℕ ℤ_p is not p-complete over ℤ_p, although each summand is.

*Needs:* `DerivedCompleteSheaves`; `derivedTowerLimit`; `IsReplete.milnor`; `enhancedDerived`.

**The completion reflector** (`completeSheaf`). The inclusion Dcomp(X, R, I) → D(X, R) has a left adjoint L_I, compatible with restriction to slices. If I = (f₁, …, f_r) globally, put F₀(K) = K and F_j(K) = cofib(T(F_{j−1}(K), f_j) → F_{j−1}(K)); then L_I K = F_r(K). For a locally finitely generated ideal the local reflectors glue by hypercover descent, and the adjunction makes the result independent of choices. On the point topos this is the derived I-completion of complexes of modules. (BS-proet Lemma 3.4.9, pp. 21–22.)

Provide `completeSheaf` with its unit η_K : K → L_I K, `completeSheaf_map`, `completeSheaf_mapEquiv` (for complete L, Map(L_I K, L) ≃ Map(K, L) through η_K), `completeSheaf_restrict` and `completeSheaf_idempotent`.

**Checks.**

- For I = 0, L_I is the identity.
- For X = Set, L_{(p)} ℤ[1/p] = 0 and L_{(p)} ℤ[0] = ℤ_p[0].
- For complete K the unit is an equivalence.
- For X = Set and R = ℤ_p, the completion of ⊕_ℕ ℤ_p is the p-adic completion of the direct sum (sequences tending to zero), not the direct sum.

*Proof route.* For one generator, the cofibre of T(K, f) → K is complete and maps universally to complete objects by orthogonality of R[1/f]-modules to complete objects; apply the generators in turn, checking that each step preserves completeness for the earlier ones. Glue the local functors and units by `hypercoverDescent` and check the mapping-space adjunction locally.

*Needs:* `DerivedCompleteSheaves`; `derivedComplete_iff_generators`; `derivedComplete_limits`; `ringedSystemComparison`; `presentable_limit_restricted`; `hypercoverDescent`; `enhancedDerived`; `derivedTensor`.

**Colimits of complete sheaves** (`derivedComplete_colimit`). For a small diagram F : J → Dcomp(X, R, I), its colimit is L_I(colim_J i F), with i the inclusion; so Dcomp has small colimits, but i does not preserve them. (BS-proet Lemma 3.4.9, pp. 21–22; ECD Proposition 26.2, p. 162.)

**Checks.**

- For X = Set and R = ℤ_p, colim(ℤ_p →p ℤ_p →p ⋯) is ℚ_p in D(ℤ_p) but 0 in Dcomp(ℤ_p, (p)).
- For I = 0 it is the ordinary colimit.

*Needs:* `completeSheaf`; `presentable_limit_restricted`; `enhancedDerived`.

### E4.2 Koszul models and regular ideals

**The Koszul power model of completion** (`koszulCompletionTower`). For a finitely generated ideal I = (f₁, …, f_r) of a commutative ring A and any unbounded K ∈ D∞(A), the completion has the natural model

```text
L_I K ≃ Rlim_n ( K ⊗ᴸ_A K_A(f₁^n, …, f_r^n) ),   n ≥ 1,
```

where the transition from m to n (m ≥ n) is the identity in degree zero and sends the i-th exterior generator e_i to f_i^{m−n} e_i. No Noetherian or regularity hypothesis is used; the terms are Koszul complexes, not quotient rings. The same construction on a ringed slice is compatible with restriction. (Stacks, More on Algebra, Situation 15.93.15 and Lemmas 15.93.16–15.93.18, tags 0BKC, 091Y, 091Z, 0920, pp. 266–267; Lemma 15.30.6, tag 0913, pp. 74–75.)

**Checks.**

- For the empty sequence the tower is constant at K and its limit is K.
- For I = (p) and K = ℤ[0], the Koszul tower is quasi-isomorphic to the tower ℤ/p^n, whose limit is ℤ_p.
- For the zero ideal with generator f = 0, every term is K ⊕ K[1] and the transitions kill the K[1] summand, so the limit is K = L_{(0)} K; the terms are Koszul complexes, not the quotient A/(0) = A.

*Proof route.* Koszul functoriality gives the transitions; f_i^n acts null-homotopically on each term, so every term and the limit are complete. On complete K, the inverse limit of each negative graded piece of the Koszul filtration is a finite sum of telescopes for products of generators, which vanish; so the unit is an equivalence on complete objects. The finite-free dual Koszul model of the extended Čech complex and tensor–Hom adjunction give the universal property.

*Needs:* `koszulComplex`; `DerivedCompleteSheaves`; `derivedComplete_iff_generators`; `completeSheaf`; `derivedInternalHom`; `derivedTowerLimit`; `IsReplete.milnor`.

**Regular ideal quotients** (`regularIdeal_quotients`). Let I = (f₁, …, f_r) be generated by a finite regular sequence in a commutative ring A. The ideals J_n = (f₁^n, …, f_r^n) are cofinal with the I^n, K_A(f₁^n, …, f_r^n) resolves A/J_n, gr_I A is the polynomial algebra over A/I on the classes of the f_i, and every A/I^n is perfect over A with Tor amplitude in [−r, 0]. Hence for unbounded K the Koszul model identifies naturally with Rlim_n (K ⊗ᴸ_A A/I^n). Arbitrary finitely generated ideals are not covered. (Stacks, More on Algebra, Lemmas 15.31.2–15.31.6, tags 062F, 062G, 062I, pp. 76–78; Situation 15.93.15 and Lemma 15.93.18, pp. 266–267; BS-proet, discussion after Lemma 3.5.4 and proof of 3.5.5, p. 25; ECD proof of Proposition 26.2 and Remark 26.3, p. 162.)

**Checks.**

- For a non-zero-divisor f, K_A(f^n) resolves A/f^n.
- For A = k[x, y] and I = (x, y), the powers I^n have bounded perfect resolutions although I^n ≠ J_n for n ≥ 2.
- The sequence (0) in a nonzero ring is not regular, and K_A(0) keeps its H^{−1}.

*Proof route.* Powers of a regular sequence are regular; J_n ⊆ I^n and I^{r(n−1)+1} ⊆ J_n give cofinality. A regular sequence is quasi-regular, so gr_I A is polynomial and each I^j/I^{j+1} is finite free over A/I; a finite filtration gives perfection of A/I^n with the stated amplitude. Replace Koszul terms by A/J_n and use cofinality.

*Needs:* `koszulComplex`; `koszulCompletionTower`; `enhancedCoeffChange`; Mathlib `RingTheory.Sequence.IsRegular`.

### E4.3 Complete modules and cohomology

**Kernels and cokernels of complete modules** (`derivedCompleteModules_weakSerre`). Derived I-complete module sheaves (in degree zero) contain zero and are closed under extensions and under kernels and cokernels of maps between complete modules. They are not closed under arbitrary submodules or quotients, so they are not a Serre class in the sense of Mathlib's `CategoryTheory.ObjectProperty.IsSerreClass`. (BS-proet Lemma 3.4.14 and its proof, p. 23.)

**Checks.**

- For X = Set, R = ℤ, I = (2): ℤ₂ is complete but its submodule ℤ is not.
- The statement concerns kernels and cokernels of maps whose source and target are both complete.

*Proof route.* For f : M → N apply T to the triangle ker(f)[1] → [M → N] → coker(f); the middle term is complete. Rlim on degree-zero towers has amplitude [0, 1] (repleteness), so the two outer terms lie on opposite sides of the t-structure and must both vanish.

*Needs:* `DerivedCompleteSheaves`; `derivedComplete_limits`; `IsReplete.rlim_amplitude`; `IsReplete.over`; `enhancedDerived`.

**Completeness is detected on cohomology sheaves** (`derivedComplete_iff_cohomology`). K ∈ D(X, R) is derived I-complete if and only if every H^m(K), m ∈ ℤ, is a derived I-complete module sheaf. (BS-proet Proposition 3.4.4, p. 21, with proof on p. 23.)

**Checks.**

- All integer degrees are quantified, unbounded complexes included.
- Completeness is stable under good truncations and shifts.

*Proof route.* If the cohomology is complete, finite truncations are complete by extensions, and left completeness (`IsReplete.leftComplete`) writes each bounded-above truncation as a limit of finite ones; T(K, x) is then arbitrarily connective, hence zero. Conversely the amplitude bound in the truncation triangles gives completeness of the truncations and their cohomology.

*Needs:* `DerivedCompleteSheaves`; `derivedComplete_limits`; `derivedCompleteModules_weakSerre`; `IsReplete.leftComplete`; `IsReplete.rlim_amplitude`; `enhancedDerived`.

**Classical and derived completeness** (`isAdicComplete_iff_derivedComplete_separated`). For an R-module sheaf M, M → lim_n M/I^n M is an isomorphism if and only if M[0] is derived I-complete and M is I-adically separated (the intersection of the subsheaves I^n M is zero). For X = Set the left side is Mathlib's `IsAdicComplete I M`. Derived complete modules in degree zero need not be classically complete. (BS-proet Proposition 3.4.2 and Remark 3.4.3, p. 21; Lemma 3.4.13, p. 23; proof of 3.4.2, p. 24.)

**Checks.**

- For X = Set, ℤ_p is classically and derived p-complete.
- A module M with pM = 0 is derived p-complete and separated, and M → lim M/p^n M is the identity.
- ℤ[0] over ℤ is p-adically separated but not derived p-complete, and ℤ → ℤ_p is not an isomorphism; both conditions on the right are needed.

*Proof route.* Classical completeness presents M as the limit of its epimorphic quotient tower, which repleteness identifies with the derived limit; nilpotent quotients are complete. Conversely use `koszulCompletionTower` locally and the Milnor sequence in degree zero to see that M maps onto its classical completion; separatedness gives injectivity.

*Needs:* `DerivedCompleteSheaves`; `derivedComplete_limits`; `derivedComplete_iff_generators`; `koszulCompletionTower`; `enhancedDerived`; Mathlib `IsAdicComplete`; `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (`IsReplete.derived_limits`).

### E4.4 Completed tensor product and internal Hom

**Complete internal Hom** (`derivedComplete_internalHom`). For K ∈ D(X, R) arbitrary and L ∈ Dcomp(X, R, I), RℋOM_R(K, L) is derived I-complete. Only L is assumed complete. (BS-proet Lemma 3.4.11, p. 22.)

**Checks.**

- K = R recovers completeness of L.
- The statement does not say that tensor products of complete objects are complete: ℤ_p ⊗ᴸ_ℤ ℤ_p is not p-complete over ℤ.

*Proof route.* T(RℋOM(K, L), x) ≃ RℋOM(K, T(L, x)), on every slice.

*Needs:* `DerivedCompleteSheaves`; `derivedInternalHom`; `derivedTowerLimit`; `enhancedDerived`.

**Completed sheaf tensor product** (`completedSheafTensor`). For K, L ∈ Dcomp(X, R, I), K ⊗̂_R L = L_I(K ⊗ᴸ_R L). With the symmetric monoidal structure of `derivedTensor_symmetricMonoidal` and the compatibility of L_I with tensor products (its kernel is a tensor ideal), Dcomp is symmetric monoidal with unit L_I R. On the point topos this is the generic completed tensor product. Completing the ordinary tensor product instead would give the wrong torsion. (BS-proet Definition 3.4.10, p. 22.)

Provide `completedSheafTensor`, `completedSheafTensor_map`, `completedSheafTensor_comparison` (the unit K ⊗ᴸ L → K ⊗̂ L) and `completedSheafTensor_unit`.

**Checks.**

- Tensoring with zero gives zero.
- For I = 0 it is the derived tensor product.
- For X = Set, R = ℤ_p, I = (p): ℤ/p ⊗̂ ℤ/p has H⁰ = ℤ/p and H^{−1} = ℤ/p and nothing else; completion does not change it.

*Needs:* `completeSheaf`; `derivedTensor`; `derivedTensor_symmetricMonoidal`; `monoidalDwyerKanLocalization`; `enhancedCoeffChange`.

**Completed tensor–Hom adjunction** (`completedTensor_hom_adjunction`). For K, K′, L ∈ Dcomp(X, R, I), Map(K′ ⊗̂_R K, L) ≃ Map(K′, RℋOM_R(K, L)), naturally in all three variables, the internal Hom lying in Dcomp. No compactness of K is needed. (BS-proet Lemma 3.4.11, p. 22.)

**Checks.**

- For K = L_I R both sides are Map(K′, L).
- Naturality in all three variables holds.

*Needs:* `completedSheafTensor`; `derivedComplete_internalHom`; `completeSheaf`; `derivedInternalHom`.

### E4.5 Coefficient systems and reconstruction

**Compatible coefficient systems** (`CompatibleCoefficientSystems`). Sys_I(X, R) is the limit in Cat∞ of the tower ⋯ → D(X, R_{n+1}) → D(X, R_n) → ⋯ → D(X, R_1) along derived reductions − ⊗ᴸ_{R_{n+1}} R_n; equivalently the coCartesian sections of the classifying fibration over N(ℕ^{op}). An object is a family K_n ∈ D(X, R_n) with equivalences K_{n+1} ⊗ᴸ_{R_{n+1}} R_n ≃ K_n and all their composition coherences. The limit of the homotopy categories is a different, wrong category. (BS-proet Definition 3.5.3, p. 24; Lemma 3.5.7, pp. 25–26; ECD Proposition 26.2 and its proof, p. 162.)

Provide `CompatibleCoefficientSystems`, `coefficientSystem_eval`, `coefficientSystem_transition`, `coefficientSystem_mapEquiv` (a map of systems is an equivalence exactly when each component is), `coefficientSystemTotal` (the unstraightened quotient-ring diagram), `coefficientSystemProjection` with `coefficientSystemProjection_coCartesian`, `coefficientSystem_transition_equiv` (each chosen successor comparison is invertible), and `coefficientSystem_zeroIdeal_eval` (for I = 0, evaluation at the first index is an equivalence onto D(X, R)).

**Checks.**

- The zero system is a zero object.
- The family R_n[0] with the canonical equivalences is a system.
- For X = Set, R = ℤ_p, I = (p): the tower with ℤ/p[0] at every n and identity transitions is not a system, since (ℤ/p) ⊗ᴸ_{ℤ/p²} ℤ/p has nonzero H^{−1}.
- For I = 0, Sys_I(X, R) ≃ D(X, R).

*Needs:* `ringedSystemComparison`; `presentable_limit_restricted`; `enhancedDerived`; `enhancedCoeffChange`; `IsCoCartesianEdge`.

**The reduction functor** (`coefficientReduction`). Red : Dcomp(X, R, I) → Sys_I(X, R), Red(K)_n = K ⊗ᴸ_R R_n, with transitions and coherences from associativity of the derived tensor product. (BS-proet Lemma 3.5.7, p. 25; ECD Proposition 26.2, p. 162.)

Provide `coefficientReduction`, `coefficientReduction_eval` and `coefficientReduction_map`.

**Checks.**

- Red(0) is the zero system.
- For I = 0 it is the constant system with identity transitions.
- For X = Set, R = ℤ_p and K = ℤ/p[0], every reduction modulo p^n has cohomology ℤ/p in degrees 0 and −1; it is not the underived constant tower ℤ/p[0].

*Needs:* `DerivedCompleteSheaves`; `CompatibleCoefficientSystems`; `derivedTensor_symmetricMonoidal`; `enhancedCoeffChange`.

**The inverse limit of a coefficient system** (`reconstructCoefficientSystem`). Rec : Sys_I(X, R) → Dcomp(X, R, I), Rec(K_•) = Rlim_n K_n after restricting each K_n to R. Each K_n is killed by I^n, hence complete, and limits of complete objects are complete. (BS-proet proof of Lemma 3.5.7, p. 25.)

Provide `reconstructCoefficientSystem`, `reconstructCoefficientSystem_projection`, `reconstructCoefficientSystem_map` and `reconstructCoefficientSystem_complete`.

**Checks.**

- The zero system reconstructs zero.
- For X = Set, R = ℤ_p, the system ℤ/p^n[0] reconstructs ℤ_p[0].
- For I = 0 the constant system at K reconstructs K.

*Needs:* `CompatibleCoefficientSystems`; `derivedComplete_limits`; `derivedTowerLimit`; `ringedSystemComparison`; `enhancedDerived`.

**Pro-Tor coefficient comparison** (`coefficientProTorComparison`). For a system (K_n) of complexes of R_n-modules, possibly unbounded, the change-of-rings maps {K_n ⊗ᴸ_R R/I} → {K_n ⊗ᴸ_{R_n} R/I} have a cone whose cohomology towers are pro-zero in every degree, and hence induce an equivalence of derived limits. The uniform finite Tor amplitude of the R/J_n (`regularIdeal_quotients`), not a boundedness hypothesis on K_n, is what allows tensoring with varying unbounded complexes. (BS-proet Lemma 3.5.4 and the regular-ideal paragraph, p. 25; ECD proof of Proposition 26.2, p. 162.)

**Checks.**

- The amplitude bound is independent of n.
- The Noetherian bounded-above argument of the source does not apply to an unbounded system as such; the regular-sequence amplitude replaces it.

*Needs:* `derivedTowerLimit`; `IsReplete.milnor`; `IsReplete.rlim_eq_zero_of_proZero`; `koszulComplex`; `regularIdeal_quotients`; `ringedSystemComparison`; `enhancedDerived`.

**Reduction of the reconstructed limit** (`reconstruction_counit`). For K_• ∈ Sys_I(X, R) and every k ≥ 1, (Rlim_n K_n) ⊗ᴸ_R R/I^k → K_k is an equivalence. I^k need not be generated by a regular sequence. (BS-proet Lemma 3.5.5 and its proof, p. 25.)

**Checks.**

- For R = 𝔽_p[[x, y]] and I = (x, y), the case k = 2 holds although I² has three minimal generators and is not generated by a regular sequence.
- For k = 1 the statement uses that R/I is perfect over R.

*Proof route.* For k = 1, R/I is perfect, so − ⊗ᴸ R/I commutes with Rlim; `coefficientProTorComparison` identifies {K_n ⊗ᴸ_{R_n} R/I} with the constant tower K₁. For general k use the exact sequences with quotients I^j/I^{j+1}, finite free over R/I, and induct on k.

*Needs:* `reconstructCoefficientSystem`; `coefficientProTorComparison`; `regularIdeal_quotients`; `derivedTowerLimit`; `IsReplete.rlim_eq_zero_of_proZero`.

**Recovery from derived reductions** (`reconstruction_unit`). For K ∈ Dcomp(X, R, I), K → Rlim_n (K ⊗ᴸ_R R/I^n) is an equivalence. For non-regular ideals an additional comparison is needed and is not asserted. (BS-proet Proposition 3.5.1, p. 24, and Lemma 3.5.7(2), p. 25; ECD proof of Proposition 26.2, p. 162.)

**Checks.**

- For X = Set this is the algebraic statement L_I K ≃ Rlim K ⊗ᴸ R/I^n, from `koszulCompletionTower` and `regularIdeal_quotients`.
- For R = ℤ_p and K = ℤ_p the limit is ℤ_p.

*Needs:* `coefficientReduction`; `reconstructCoefficientSystem`; `completeSheaf`; `regularIdeal_quotients`; `koszulCompletionTower`; `derivedTowerLimit`.

**The completed coefficient sheaf** (`completedCoefficientRing`). Let R̂_X = lim_n (R/I^n)_X in X. Then R̂_X ⊗ᴸ_R R/I^k ≃ R/I^k for every k ≥ 1, and restriction of scalars identifies the derived I-complete subcategories for R̂_X and for the constant sheaf R. Even if R is I-adically complete, the constant sheaf R_X need not equal R̂_X. (BS-proet Definition 3.5.2, p. 24; Lemma 3.5.6, p. 25.)

**Checks.**

- For X = Set and R complete, R̂_X = R.
- For I = 0, every quotient R/I^n equals R and R̂_X is the constant sheaf R_X on any topos.
- In light condensed sets (a replete topos), the constant sheaf on the ring ℤ_p has as sections over a profinite set S the locally constant maps S → ℤ_p, while R̂_X = lim ℤ/p^n has all continuous maps; the identity of S = ℤ_p distinguishes them.

*Needs:* `reconstruction_counit`; `reconstruction_unit`; `completeSheaf`; `regularIdeal_quotients`; `enhancedCoeffChange`; `TauCetiRoadmap.SchemeAndStackFoundations` §2.17 (`IsReplete.derived_limits`).

**Coefficient-system reconstruction** (`coefficientSystemReconstruction`). For a replete topos X and a commutative ring R with I generated by a finite regular sequence (I = 0 allowed), Red and Rec are inverse equivalences of stable ∞-categories Dcomp(X, R, I) ≃ lim_n D(X, R/I^n). No Noetherian or boundedness hypothesis is needed, and by `completedCoefficientRing` the same holds with R̂_X. It applies to I-adically complete non-Noetherian rings. It is not deduced from an equivalence of homotopy categories. (BS-proet Lemma 3.5.7, pp. 25–26; ECD Proposition 26.2 and its proof, p. 162.)

Provide `reconstructionUnit`, `reconstructionCounit` and `coefficientSystemReconstruction`.

**Checks.**

- For I = 0 the diagram is constant and the equivalence is the identity.
- For R = (∏_{m≥0} 𝔽_p)[[t]] and I = (t), R is complete and non-Noetherian and t is a non-zero-divisor; the theorem applies.
- Over ℤ_p, the constant system ℤ/p[0] (underived transitions) is not in the target, so it is not the reduction of anything.

*Needs:* `coefficientReduction`; `reconstructCoefficientSystem`; `reconstruction_unit`; `reconstruction_counit`; `completedCoefficientRing`; `ringedSystemComparison`; `presentable_limit_restricted`; Mathlib `RingTheory.Sequence.IsRegular`.

**Perfect coefficient change for exact functors** (`perfectCoefficientChange`). Let C, D be stable R-linear ∞-categories with compatible actions of Perf(R), and F : C → D an exact functor with coherent R-linear structure. For every perfect R-complex P and K ∈ C there is a natural equivalence F(K ⊗_R P) ≃ F(K) ⊗_R P; in particular for P = R/I^n under the regular-sequence hypothesis. Comparing with a separately defined functor at finite level also needs an identification of that functor with this scalar extension; exactness of a right adjoint alone is not enough. (ECD Remark 26.3, p. 162.)

**Checks.**

- For a two-term perfect complex the statement is preservation of a cofibre.
- A right adjoint not shown to be R-linear with a coherent action does not satisfy the hypothesis.

*Proof route.* Start from P = R, extend to finite sums and shifts by exactness, then to cofibres and retracts, hence to Perf(R); R/I^n is perfect by `regularIdeal_quotients`.

*Needs:* `perfectAction_exactFunctor`; `regularIdeal_quotients`; `koszulComplex`; `presentable_limit_restricted`.

**Equivalences detected modulo the ideal** (`isIso_of_isIso_mod`). A map f : K → L of derived I-complete objects is an equivalence if and only if f ⊗ᴸ_R R/I is. For a finitely generated ideal on the point topos the same holds with the Koszul complex K_R(f₁, …, f_r) in place of R/I (derived Nakayama). Completeness cannot be dropped, and the test uses the derived, not the ordinary, reduction. (ECD Remark 26.3, p. 162; Stacks, More on Algebra, Lemma 15.93.20, tag 0G1U, p. 268.)

**Checks.**

- Over ℤ_p, 0 → ℚ_p becomes an equivalence modulo p but is not one: ℚ_p is not complete.
- For complete K with K ⊗ᴸ ℤ/p = 0 over ℤ_p, K = 0.

*Proof route.* For the cofibre C, vanishing of C ⊗ᴸ R/I gives vanishing modulo every I^n by dévissage along the finite free graded pieces I^j/I^{j+1}; `reconstruction_unit` gives C = 0. On the point topos with a finitely generated ideal, each Koszul term is killed by nilpotent dévissage and so is the limit (`koszulCompletionTower`).

*Needs:* `DerivedCompleteSheaves`; `derivedComplete_limits`; `reconstruction_unit`; `koszulCompletionTower`; `enhancedDerived`.

### Examples

- On the point with R = ℤ and I = (p): L_I ℤ = ℤ_p, L_I ℤ[1/p] = 0, L_I(ℚ_p) = 0, and the Koszul tower of ℤ is the tower ℤ/p^n.
- Over ℤ_p, D(ℤ_p)^∧_p ≃ lim_n D(ℤ/p^n), and ℤ/p ⊗̂ ℤ/p = ℤ/p ⊕ ℤ/p[1].

### Dependencies

Layers E0, E1, E2:towers, E2, E3 and E5:abstract. Mathlib (adic completeness, regular sequences, Serre classes as a comparison).

## Layer E5:cotangent-export: The cotangent complex of animated rings

This layer defines the cotangent complex of a map of animated commutative rings and proves its basic properties: the universal property through derivations, the comparison with Kähler differentials and Mathlib's naive cotangent complex in low degrees, transitivity, base change, localization and filtered colimits, the smooth, étale, regular-quotient and local complete intersection computations, and derived exterior powers. It first relates animated rings to commutative algebra objects of the derived category, which also gives modules over animated rings. The derived de Rham, prismatic and deformation-theoretic roadmaps build on these targets. Throughout, R is a commutative ring, animated R-algebras are those of Layer E5:animation, D(R) = D∞(R) with the symmetric monoidal structure of `derivedTensor_symmetricMonoidal`, and D(R)_{≥0} denotes its connective part (cohomology in degrees ≤ 0). The layer uses Layers E0, E1, E3, E5:abstract, E5:presentability and E5:animation.

### E5:cotangent-export.1 Animated rings as commutative algebras

**Animated rings and connective commutative algebras** (`animatedToCAlg`). There is a sifted-colimit-preserving functor θ : AnimAlg_R → CAlg(D(R)_{≥0}) extending the inclusion of polynomial R-algebras as discrete commutative algebras. It is an equivalence when R contains ℚ. For every R, simplicial associative R-algebras are equivalent to connective associative algebra objects of D(R). In positive characteristic θ is not an equivalence: the free commutative algebra object on R[0] keeps the homology of symmetric groups, which the polynomial algebra R[x] lacks; strictly commutative dg algebras model the situation only in characteristic zero. (HA Proposition 7.1.4.11, p. 1223; Propositions 7.1.4.18 and 7.1.4.20, pp. 1225–1227; Warning 7.1.4.21, p. 1227. HA formulates these with modules over R viewed as a discrete E∞-ring; HA Theorem 7.1.2.13, p. 1212, identifies that category symmetric monoidally with D(R), which is the form used here.)

Provide `animatedToCAlg`, `animatedToCAlg_polynomial` (θ(R[x₁, …, x_n]) is the polynomial algebra, discrete), `animatedToCAlg_equiv_of_rational` and `simplicialAssociative_equiv`.

**Checks.**

- Over ℚ, θ is an equivalence on objects and mapping spaces and sends ordinary polynomial algebras to themselves.
- Over 𝔽₂, the degree-two part of the free commutative algebra object on 𝔽₂[0] is (𝔽₂^{⊗2})_{hΣ₂}, with homology H_∗(BΣ₂; 𝔽₂), nonzero in every degree ≥ 0; the animated polynomial algebra 𝔽₂[x] is discrete. So θ is not an equivalence over 𝔽₂.
- The associative comparison holds over every R and is kept separate from the commutative one.

*Proof route.* Polynomial algebras are flat and their tensor products are discrete, so the inclusion of Poly_R preserves finite coproducts; extend by `animationExtension`. Over ℚ, free commutative algebra objects on flat modules are polynomial because homotopy orbits of Σ_n on a ℚ-vector space are its coinvariants, and both sides are generated by them under sifted colimits.

*Needs:* `animationExtension`; `animatedAlgebras`; `operadicAlgebras`; `derivedTensor_symmetricMonoidal`; `enhancedDerived`.

**Modules over animated rings** (`animatedModules`). For B ∈ AnimAlg_R put Mod_B = Mod_{θB}(D(R)), modules in the sense of `leftModuleObjects`. The connective part of Mod_B is the animation of the functor sending a pair (P, F) of a polynomial R-algebra and a finite free P-module to F, so a connective B-module is a sifted colimit of finite free modules over polynomial algebras. For discrete B, Mod_B ≃ D(B), and extension of scalars along A → B is − ⊗ᴸ_A B. (HA Definition 4.2.1.13, p. 507, and Theorem 7.1.2.13, p. 1212; HTT Corollary 5.5.9.3, printed p. 517, for the animated description.)

Provide `animatedModules`, `animatedModules_discrete` (Mod_B ≃ D(B) for discrete B) and `animatedModules_baseChange`.

**Checks.**

- For B = R, Mod_B = D(R).
- For discrete B, the unit B[0] corresponds to B.
- For A = ℤ and B = 𝔽_p ⊗ᴸ_ℤ 𝔽_p, Mod_B is not D(π₀B) = D(𝔽_p): the unit has π₁ = 𝔽_p.

*Needs:* `animatedToCAlg`; `leftModuleObjects`; `animatedAlgebras`; `enhancedDerived`.

### E5:cotangent-export.2 Derivations and the cotangent complex

**Square-zero extensions and derivations** (`squareZeroExtension`, `derivedDerivations`). For B ∈ AnimAlg_A and a connective B-module M, the trivial square-zero extension B ⊕ M is the animated A-algebra obtained by animating Mathlib's `TrivSqZeroExt` on pairs (P, F), with multiplication (b, m)(b′, m′) = (bb′, bm′ + b′m). The space of A-derivations of B into M is Der_A(B, M) = Map_{AnimAlg_A/B}(B, B ⊕ M), the space of sections of the projection B ⊕ M → B; it retains higher homotopy. (Bhatt, *p-adic derived de Rham cohomology*, Remark 6.6 and equivalence (6), p. 25.)

Provide `squareZeroExtension` with its projection and zero section, `derivedDerivations`, `derivationZero` (the zero derivation as base point), `derivationPostcompose` (a map M → N induces Der_A(B, M) → Der_A(B, N)) and `derivationDiscrete` (for discrete B and M, π₀ Der_A(B, M) is the set of ordinary A-derivations).

**Checks.**

- Der_A(A, M) is contractible.
- For B = A[t], Der_A(B, M) is the underlying space of M, via δ ↦ δ(t).
- For discrete M a section sends t² to (t², 2tδ(t)); with the product ring B × M instead of the square-zero extension the Leibniz term disappears.

*Needs:* `animatedAlgebras`; `animatedModules`; `animationExtension`; Mathlib `TrivSqZeroExt`.

**The cotangent complex** (`cotangentComplex`). For a map A → B of animated rings, L_{B/A} ∈ Mod_B is the connective B-module obtained by animating (P ↦ Ω¹_{P/A} ⊗_P B) from polynomial algebras. For ordinary A → B and a free simplicial polynomial resolution P_• → B, L_{B/A} is represented by the normalization of Ω¹_{P_•/A} ⊗_{P_•} B, simplicial degree n placed in cohomological degree −n; comparisons between resolutions and naturality in commutative squares are coherent. All negative cohomology is retained. (Stacks, The Cotangent Complex, Definition 3.2, tag 08PN, p. 3; Lemmas 4.3–4.7, tags 08PU, 08QF, 08QH, pp. 5–6; Remark 5.5, tag 08QI, p. 9; Bhatt–Lurie, *Absolute prismatic cohomology*, Appendix B, Construction B.1 and Remark B.2, p. 225.)

Provide `cotangentComplex`, `cotangentMap` (a square (A → B) → (A′ → B′) gives L_{B/A} ⊗ᴸ_B B′ → L_{B′/A′}, with identities and composites), `cotangentResolutionEquiv` (the normalized model for any free resolution) and `cotangentH0` (H⁰ L_{B/A} ≅ Ω_{B/A}, Mathlib's `KaehlerDifferential A B`, compatibly with the universal derivation).

**Checks.**

- L_{A/A} = 0.
- L_{A[t]/A} ≃ A[t]·dt in degree zero.
- For a field k of characteristic ≠ 2 and B = k[ε]/(ε²), L_{B/k} is [B → B·dε] in degrees −1, 0 with the map 1 ↦ 2ε dε, so H^{−1}L_{B/k} = εB ≠ 0.

*Needs:* `animatedAlgebras`; `animationExtension`; `animatedModules`; `enhancedDerived`; `derivedTensor`; Mathlib `KaehlerDifferential`, `DerivedCategory`.

**The universal property of the cotangent complex** (`cotangentComplex_corepresents`). For A → B animated and a connective B-module M, there is a natural equivalence Map_{Mod_B}(L_{B/A}, M) ≃ Der_A(B, M), compatible with base squares and module maps. (Bhatt, *p-adic derived de Rham cohomology*, Remark 6.6, p. 25.)

**Checks.**

- For B = A[t] the equivalence is evaluation at dt.
- For B = A both sides are contractible.

*Proof route.* For polynomial A-algebras the equivalence is the coordinate description of derivations, whose π₀ is Mathlib's correspondence between derivations and lifts to square-zero extensions (`derivationToSquareZeroEquivLift`); both sides send sifted colimits of polynomial algebras to limits, so the equivalence extends by `animationExtension`.

*Needs:* `cotangentComplex`; `derivedDerivations`; `animationExtension`; Mathlib `derivationToSquareZeroEquivLift`.

**Degree zero and the naive cotangent complex** (`cotangentComplex_naive`). For ordinary A → B, H⁰L_{B/A} ≅ Ω_{B/A}. For a polynomial presentation P → B with kernel J, τ^{≥−1}L_{B/A} is represented by the two-term complex [J/J² → Ω_{P/A} ⊗_P B] in degrees −1 and 0, Mathlib's `Algebra.Extension.cotangentComplex`, and H^{−1}L_{B/A} is Mathlib's `Algebra.H1Cotangent`. The two-term complex is not the whole cotangent complex of an arbitrary quotient. (Stacks, The Cotangent Complex, Lemma 4.5, tag 08QF, p. 5; Lemmas 11.2 and 11.3, tags 08RA, 08RB, p. 21.)

**Checks.**

- For B = k[x, y]/(x, y)² over k[x, y], H^{−2}L_{B/k[x,y]} ≠ 0, which the two-term truncation misses.
- For k[ε]/(ε²) → k (ε ↦ 0), transitivity gives H^{−1}L = k and H^{−2}L = k; the naive complex sees only the first.

*Proof route.* H⁰ is the coequalizer of the first two terms of the resolution; the first two simplicial degrees identify the conormal map with Mathlib's naive cotangent map, compatibly with `Algebra.Extension.exact_cotangentComplex_toKaehler` and `Algebra.Generators.equivH1Cotangent`.

*Needs:* `cotangentComplex`; Mathlib `Algebra.Extension.cotangentComplex`, `Algebra.Extension.toKaehler`, `Algebra.Extension.exact_cotangentComplex_toKaehler`, `Algebra.H1Cotangent`, `Algebra.Generators.equivH1Cotangent`.

### E5:cotangent-export.3 Properties

**Transitivity** (`cotangentComplex_transitivity`). For maps A → B → C of animated rings there is a natural cofibre sequence L_{B/A} ⊗ᴸ_B C → L_{C/A} → L_{C/B} in Mod_C. (Stacks, The Cotangent Complex, Proposition 7.4, tag 08QX, p. 16.)

**Checks.**

- For ℤ → ℤ[x] → ℤ[x]/(x) = ℤ the sequence gives L_{ℤ/ℤ[x]} ≃ ℤ[1], the boundary identifying ℤ·dx with the conormal class of x.
- For k → k[ε]/(ε²) → k it gives H^{−1}L_{k/k[ε]/(ε²)} = k and H^{−2} = k.

*Proof route.* For polynomial B over A and polynomial C over B the sequence of differentials is split exact; resolve the pair by a bisimplicial polynomial pair and realize; identify the terms by `cotangentComplex_corepresents`.

*Needs:* `cotangentComplex`; `cotangentComplex_corepresents`; `animatedModules_baseChange`.

**Base change** (`cotangentComplex_baseChange`). For an animated pushout B′ = B ⊗ᴸ_A A′, L_{B′/A′} ≃ L_{B/A} ⊗ᴸ_B B′ naturally. For ordinary rings this applies to the ordinary pushout only when Tor_i^A(B, A′) = 0 for i > 0. (Stacks, The Cotangent Complex, Lemmas 6.2–6.4, tag 08QQ, p. 12.)

**Checks.**

- For ℤ → 𝔽_p base changed along ℤ → 𝔽_p, Tor₁ = 𝔽_p, and the ordinary pushout 𝔽_p would give the wrong answer L_{𝔽_p/𝔽_p} = 0 instead of L_{𝔽_p ⊗ᴸ 𝔽_p / 𝔽_p} ≠ 0.
- For flat A → A′ the ordinary pushout suffices.

*Needs:* `cotangentComplex`; `animatedAlgebras`; `animatedModules_baseChange`.

**Localization and filtered colimits** (`cotangentComplex_localization`, `cotangentComplex_filteredColimit`). For an ordinary ring B and a multiplicative set S, L_{S^{−1}B/B} = 0 and L_{S^{−1}B/A} ≃ L_{B/A} ⊗ᴸ_B S^{−1}B. For a filtered colimit B = colim_j B_j of animated A-algebras, L_{B/A} ≃ colim_j (L_{B_j/A} ⊗ᴸ_{B_j} B). (Stacks, The Cotangent Complex, Lemma 8.4, tag 08R2, and Lemma 8.6, tag 08SF, for localization, pp. 18–19; Lemma 3.4, tag 08S9, for filtered colimits.)

**Checks.**

- L_{ℚ/ℤ} = 0.
- For B = colim_n A[x_1, …, x_n] = A[x_1, x_2, …], L_{B/A} is free on the dx_i in degree zero.

*Needs:* `cotangentComplex`; `cotangentComplex_transitivity`; `cotangentComplex_baseChange`; `animationExtension`.

**Smooth and étale maps** (`cotangentComplex_smooth`). For a smooth ring map A → B, L_{B/A} ≃ Ω_{B/A}[0], a finite projective module when the map is of finite presentation; for étale maps L_{B/A} = 0. A polynomial ring on any set has free Ω in degree zero. (Stacks, The Cotangent Complex, Lemma 9.1, tag 08R5, p. 19; Lemma 8.4, tag 08R2, p. 18.)

**Checks.**

- L_{A[t₁,…,t_r]/A} ≃ B^r[0].
- L_{A/A} = 0, and L_{A[1/f]/A} = 0.

*Needs:* `cotangentComplex`; `cotangentComplex_baseChange`; `cotangentComplex_localization`.

**Regular quotients** (`cotangentComplex_regularQuotient`). If J ⊆ P is generated by a finite regular sequence f₁, …, f_r and B = P/J, then L_{B/P} ≃ (J/J²)[1] with J/J² free on the classes of the f_i. If moreover P is smooth over A, L_{B/A} is the two-term complex [J/J² → Ω_{P/A} ⊗_P B], f_i ↦ df_i, in degrees −1, 0. No flatness of B over A is needed. (Stacks, The Cotangent Complex, Lemma 14.2 and Proposition 14.4, tags 08SJ, 08SL, p. 29.)

**Checks.**

- For B = k[x]/(x²) over k the map is 1 ↦ 2x dx; in characteristic 2 it is zero and both terms survive in cohomology.
- The quotient k[x, y]/(x, y)² is not regular and has lower cotangent cohomology; the formula does not apply.

*Needs:* `cotangentComplex`; `cotangentComplex_transitivity`; `cotangentComplex_smooth`; Mathlib `RingTheory.Sequence.IsRegular`.

**Local complete intersections** (`cotangentComplex_lci`). If A → B is a local complete intersection map (locally a quotient of a smooth algebra by a regular sequence), L_{B/A} is perfect with Tor amplitude in [−1, 0]; smooth maps have amplitude [0, 0]. (Stacks, The Cotangent Complex, §14, tag 08SH, and Proposition 14.4, tag 08SL, p. 29.)

**Checks.**

- A smooth map has amplitude [0, 0].
- A flat hypersurface A → A[x]/(g) with g a non-zero-divisor has amplitude [−1, 0] and not [0, 0] unless it is smooth.

*Needs:* `cotangentComplex_regularQuotient`; `cotangentComplex_naive`; `PerfectDerived`.

**Derived exterior powers** (`derivedExteriorPower`). For an animated ring B and a connective B-module M, L∧^n_B(M), n ≥ 0, is the animation of the exterior power on finite free modules over polynomial algebras (computed by a simplicial projective resolution of M). It is connective, has base change L∧^n_B(M) ⊗ᴸ_B B′ ≃ L∧^n_{B′}(M ⊗ᴸ_B B′) and a graded multiplication, agrees with Mathlib's exterior power for flat discrete M, and imposes x ∧ x = 0 also at p = 2. Applied to M = L_{B/A} it gives the derived exterior powers of the cotangent complex. (Bhatt–Lurie, *Absolute prismatic cohomology*, Appendix B, Construction B.1, p. 225, and Remark B.5, p. 226.)

Provide `derivedExteriorPower`, `exteriorPowerZero` (L∧⁰ ≃ B), `exteriorPowerOne` (L∧¹ ≃ M), `exteriorPowerBaseChange` and `exteriorPowerFlat`.

**Checks.**

- L∧⁰_B(0) = B and L∧^n_B(0) = 0 for n > 0.
- For the free rank-one module Be, L∧²(Be) = 0, also over 𝔽₂.
- For M = B, L∧^n(M[1]) ≃ Γ^n(M)[n], the divided power, so positive powers of a shifted line are nonzero; divided and symmetric powers are not identified by forgetting factorials.

*Needs:* `animationExtension`; `animatedModules`; Mathlib `ExteriorAlgebra.exteriorPower`, `exteriorPower.ιMulti`.

### Examples

- L_{𝔽_p/ℤ} ≃ 𝔽_p[1] (the regular quotient by p); L_{ℤ[x]/ℤ} = ℤ[x] dx; L_{k/k[ε]/(ε²)} has H^{−1} = k and H^{−2} = k.
- Over ℚ animated algebras and connective commutative algebras in D(ℚ) agree; over 𝔽₂ the free commutative algebra object on 𝔽₂ has the homology of BΣ₂ in its quadratic part.

### Dependencies

Layers E0, E1, E3, E5:abstract, E5:presentability and E5:animation. Mathlib (Kähler differentials, the naive cotangent complex and H1Cotangent, trivial square-zero extensions, regular sequences, exterior powers).

## Layer E5:spectra-comparison: Eilenberg–Mac Lane rings and derived modules

This layer compares the derived categories of Layer E1 with modules over ring spectra in the abstract stable ∞-category Sp of Layer E5:presentability. It uses Layers E1, E5:abstract and E5:presentability.

**Eilenberg–Mac Lane rings and the module comparison** (`eilenbergMacLane`, `moduleSpectra_equiv_derived`). Since D(R) = D∞(R) is a commutative algebra in presentable stable ∞-categories, the unique colimit-preserving symmetric monoidal functor Sp → D(R) has a lax symmetric monoidal right adjoint; it sends the unit R[0] to a commutative algebra HR ∈ CAlg(Sp), the Eilenberg–Mac Lane ring of R. For every commutative ring R there is a symmetric monoidal equivalence Mod_{HR}(Sp) ≃ D(R) carrying HR to R[0] and the relative tensor product over HR to the derived tensor product over R; on homotopy categories it recovers Mathlib's `DerivedCategory (ModuleCat R)` with its shift and distinguished triangles, and mapping spectra correspond to derived Hom complexes. Comparing a concrete point-set model of spectra (symmetric spectra and their model structures) with Sp is the work of the roadmap that builds that model, which applies `monoidalModelLocalization`. (HA Theorem 7.1.2.13, p. 1212; Theorem 7.1.2.1, p. 1206; Proposition 4.8.2.18, p. 722.)

Provide `eilenbergMacLane`, `eilenbergMacLane_homotopy` (π_n HR is R for n = 0 and zero otherwise), `moduleSpectra_equiv_derived` and `moduleSpectra_equiv_derived_unit`.

**Checks.**

- HR corresponds to R[0]; the relative tensor product corresponds to ⊗ᴸ_R, and the shift of spectra to Mathlib's cochain shift [1] (cohomological degree −1).
- Mapping spectra between HR-modules compare with derived Hom complexes, not only maps in the homotopy category.
- For non-flat R-modules M, N the relative tensor product M ∧_{HR} N has π₁ = Tor₁^R(M, N); for R = ℤ, M = N = ℤ/p it is ℤ/p.

*Proof route.* R[0] is a compact generator of D(R) with End(R[0]) = HR concentrated in degree zero, so the Schwede–Shipley theorem (HA 7.1.2.1) gives D(R) ≃ Mod_{HR}(Sp); the symmetric monoidal refinement follows from the uniqueness of colimit-preserving symmetric monoidal structures extending the one on the generator (HA 7.1.2.13). Compare shifts and triangles through `stableMonoidal_homotopyCategory`.

*Needs:* `spectra`; `presentableTensor`; `leftModuleObjects`; `derivedTensor_symmetricMonoidal`; `stableMonoidal_homotopyCategory`; `enhancedDerived`; `IsCompactlyGenerated`.

### Examples

- Hℤ is the unit of D(ℤ) seen in Sp; Mod_{Hℤ}(Sp) ≃ D(ℤ), and Hℤ/p ∧_{Hℤ} Hℤ/p has homotopy 𝔽_p in degrees 0 and 1.

### Dependencies

Layers E1, E5:abstract and E5:presentability. Mathlib (`DerivedCategory`, `ModuleCat`).

## Layer E5: Compatibility of the enhancements

The last layer checks that the constructions of the roadmap fit together: the derived category of Layer E1, the monoidal theory of Layer E5:abstract, animation, the cotangent complex and the Eilenberg–Mac Lane comparison describe the same objects. It uses all earlier layers.

**Compatibility of the enhancement and algebra comparisons** (`enhancement_compatibility`). The following comparisons commute up to coherent equivalence: (i) for a commutative ring R, the unit of D∞(R) (Layer E1), the unit of Mod_R(D∞(ℤ)) (Layer E5:abstract, through `animatedModules_discrete`) and HR under `moduleSpectra_equiv_derived` correspond, and so do their derived tensor products, compatibly with Mathlib's `DerivedCategory`; (ii) passage from ordinary rings to animated rings and from algebras to their module categories commutes with these identifications; (iii) for the polynomial algebra B = R[x₁, …, x_n], L_{B/R} is the free B-module of rank n in degree zero, and for B = R/I with I generated by a regular sequence of length c, L_{B/R} ≃ (I/I²)[1] is free of rank c in degree −1; (iv) exact functors carry cofibre triangles to cofibre triangles with the signs of `dgNerve_shift_cone_comparison`. (HA Theorem 7.1.2.13, p. 1212; Stacks, The Cotangent Complex, Lemmas 4.7 and 14.2, tags 08QH, 08SJ, pp. 6 and 29.)

**Checks.**

- The unit, polynomial and regular-quotient computations agree when computed through any of the three descriptions.
- The derived pushout 𝔽_p ⊗ᴸ_ℤ 𝔽_p and the cotangent complex of k[ε]/(ε²) → k keep their higher terms (π₁ = 𝔽_p; H^{−2} = k) in every description.
- Cofibre triangles are transported with the sign convention of Layer E0.

*Proof route.* Each comparison is determined by its value on the unit or on polynomial generators, by the universal properties of `animationExtension`, `presentableTensor` and `moduleSpectra_equiv_derived`; the composites agree there and hence everywhere, naturally.

*Needs:* `animatedAlgebras`; `animatedModules`; `cotangentComplex_regularQuotient`; `cotangentComplex_smooth`; `moduleSpectra_equiv_derived`; `exactMonoidalFunctor_triangle`; `enhancedDerived`.

### Examples

- For R = ℤ: the unit ℤ[0] of D(ℤ), the unit of Mod_ℤ(D(ℤ)) and Hℤ agree; L_{ℤ[x]/ℤ} = ℤ[x] dx and L_{𝔽_p/ℤ} = 𝔽_p[1] in each description.

### Dependencies

All earlier layers.

## Downstream consumers

- Layer E0 (quasicategorical foundations, the dg nerve, straightening): `EtaleDualityAndPerverseSheaves`, `PerfectoidQuotients`, `DiamondSixOperations`, `HabiroCohomologyFoundations`, `HabiroRings`, `LefschetzPencilsAndVanishingCycles`, `PrismaticCohomology`, `CrystallineCohomology`, `RefinedTraceMethods`, `SchemeKTheoryOperations`, `StableHomotopyKTheory`, `VStackSheavesAndLisseCategories`.
- Layer E1 (D∞(O) and its operations, Koszul complexes, regular rings and Kunz's theorem, perfect 𝔽_p-algebras): `AInfCohomology`, `AdicCoefficientsAndComparisons`, `ArithmeticLocallySymmetricSpaces`, `ClassicalAdicEtaleCohomology`, `CohomologyComparisons`, `CrystallineCohomology`, `DerivedDeRhamCohomology`, `DiamondEtaleCohomology`, `EtaleDualityAndPerverseSheaves`, `PerfectoidQuotients`, `SmoothRepresentationsOfLocalGroups`, `DeformationAndDerivedPatchingAlgebra` (also for the global dimension of regular rings), `HabiroCohomologyFoundations`, `HabiroRings`, `HodgeStructuresPartII`, `IgusaVarietiesAndTorsionConcentration` (Kunz's theorem), `PrismaticCohomology`, `SchemeKTheoryOperations`, `VStackSheavesAndLisseCategories`.
- Layers E2:towers and E2 (repleteness, Postnikov completion, hypercover descent, h-descent): `AdicCoefficientsAndComparisons`, `CrystallineCohomology`, `DiamondEtaleCohomology`, `LefschetzPencilsAndVanishingCycles`, `PerfectoidQuotients`, `PrismaticCohomology`, `AInfCohomology`, `ClassicalAdicEtaleCohomology`, `CohomologyComparisons`, `DiamondSixOperations`, `InverseGaloisAndArithmeticFundamentalGroups`, `MotivicEtaleKTheory`, `SchemeKTheoryOperations`, `VStackSheavesAndLisseCategories`.
- Layer E3 (Kan extensions, adjoints, localizations, mates): `AdicCoefficientsAndComparisons`, `DerivedDeRhamCohomology`, `DiamondEtaleCohomology`, `DiamondSixOperations`, `EtaleDualityAndPerverseSheaves`, `PerfectoidQuotients`, `GeometricSatakeAndFusion`, `HabiroRings`, `PrismaticCohomology`, `RefinedTraceMethods`, `VStackSheavesAndLisseCategories`.
- Layer E4 (derived completion and reconstruction): `AdicCoefficientsAndComparisons`, `PerfectoidQuotients`, `VStackSheavesAndLisseCategories`, `AInfCohomology`, `CohomologyComparisons`, `EtaleDualityAndPerverseSheaves`, `LefschetzPencilsAndVanishingCycles`, `DerivedDeRhamCohomology`, `HabiroCohomologyFoundations`.
- Layers E5:abstract, E5:presentability and E5:descent (higher algebra, large categories, descent): `ExcursionOperatorsAndSpectralAction`, `GeneralAlgebraicKTheory`, `GeometricSatakeAndFusion`, `HabiroRings`, `HabiroCohomologyFoundations`, `HeckeStacksAndLocalShtukas`, `LanglandsParameterStacks`, `MotivicEtaleKTheory`, `RefinedTraceMethods`, `StableHomotopyKTheory`, `VStackSheavesAndLisseCategories`, `PrismaticCohomology`, `AInfCohomology`.
- Layer E5:animation (animated rings): `DerivedDeRhamCohomology`, `LanglandsParameterStacks`, `PerfectoidQuotients`, `PrismaticCohomology`, `HabiroCohomologyFoundations`, `ExcursionOperatorsAndSpectralAction`, `RefinedTraceMethods`.
- Layers E5:cotangent-export and E5:spectra-comparison: `DerivedDeRhamCohomology`, `PrismaticCohomology`, `HabiroRings`, `MotivicEtaleKTheory`, `RefinedTraceMethods`, `StableHomotopyKTheory`.

## References

- [HTT] J. Lurie, *Higher Topos Theory*, author PDF of 9 April 2017, <https://www.math.ias.edu/~lurie/papers/HTT.pdf>. PDF pages are printed pages plus 18.
- [HA] J. Lurie, *Higher Algebra*, author PDF of 18 September 2017, <https://www.math.ias.edu/~lurie/papers/HA.pdf>.
- [BS-proet] B. Bhatt and P. Scholze, *The pro-étale topology for schemes*, Astérisque 369 (2015); arXiv:1309.1198 and author copy <https://people.mpim-bonn.mpg.de/scholze/proetale.pdf>.
- [BS17] B. Bhatt and P. Scholze, *Projectivity of the Witt vector affine Grassmannian*, Invent. Math. 209 (2017); author PDF <https://people.mpim-bonn.mpg.de/scholze/Witt.pdf>.
- [ECD] P. Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4, <https://arxiv.org/abs/1709.07343>.
- [Liu–Zheng] Y. Liu and W. Zheng, *Enhanced six operations and base change theorem for higher Artin stacks*, arXiv:1211.5948, <https://arxiv.org/abs/1211.5948>.
- [Nikolaus–Scholze] T. Nikolaus and P. Scholze, *On topological cyclic homology*, Acta Math. 221 (2018); author PDF <https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf>.
- [Mathew] A. Mathew, *The Galois group of a stable homotopy theory*, Adv. Math. 291 (2016); arXiv:1404.2156v2, <https://arxiv.org/abs/1404.2156v2>. Numbers follow v2; BS17 cites the first version, whose numbering differs by one from Proposition 3.21 on.
- [Bhatt, *Direct summand*] B. Bhatt, *On the direct summand conjecture and its derived variant*, Invent. Math. 212 (2018); arXiv:1608.08882, <https://arxiv.org/abs/1608.08882>.
- [Bhatt, *p-adic derived de Rham*] B. Bhatt, *p-adic derived de Rham cohomology*, arXiv:1204.6560v1, <https://arxiv.org/abs/1204.6560>.
- [Bhatt–Lurie] B. Bhatt and J. Lurie, *Absolute prismatic cohomology*, arXiv:2201.06120, <https://arxiv.org/abs/2201.06120>.
- [Robalo] M. Robalo, *K-theory and the bridge from motives to noncommutative motives*, Adv. Math. 269 (2015); arXiv:1206.3645, <https://arxiv.org/abs/1206.3645>.
- [Ramzi, *Dualizable*] M. Ramzi, *Dualizable presentable ∞-categories*, arXiv:2410.21537v1, <https://arxiv.org/abs/2410.21537>.
- [Ramzi, *Locally rigid*] M. Ramzi, *Locally rigid ∞-categories*, arXiv:2410.21524v2, <https://arxiv.org/abs/2410.21524>.
- [Efimov] A. I. Efimov, *K-theory and localizing invariants of large categories*, arXiv:2405.12169v4, <https://arxiv.org/abs/2405.12169>.
- [Fargues–Scholze] L. Fargues and P. Scholze, *Geometrization of the local Langlands correspondence*, author PDF <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>; Lemma IV.2.20 is on printed p. 123.
- [Scholze, *Berkovich motives*] P. Scholze, *Berkovich motives*, author PDF <https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf>.
- [Stacks] The Stacks Project Authors, *The Stacks Project*, <https://stacks.math.columbia.edu>: chapters *Commutative Algebra*, *Modules on Sites*, *Cohomology on Sites*, *Derived Categories*, *More on Algebra*, *Local Cohomology*, *Simplicial Spaces*, *Cohomology of Schemes* and *The Cotangent Complex*; results are cited by tag.

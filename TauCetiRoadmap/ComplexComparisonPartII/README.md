# Roadmap: complex comparison, part II — coherent, de Rham–Betti and étale comparison

**Summary.** This roadmap compares complex algebraic geometry with complex analytic geometry and
classical topology, for coherent, de Rham and étale coefficients. It builds the
category of coherent analytic modules on the analytic space of a complex scheme and the exact
analytification functor into it; computes coherent analytic cohomology by analytic means
(Dolbeault's lemma, the weighted `∂̄`-estimate, Cartan's theorem B on strongly 1-complete spaces,
Cartan–Serre finiteness, and Serre's analytic generation and vanishing on projective space); states
the consequences of coherent GAGA that arithmetic consumers use (projection and base change,
ideal, section and line-bundle dictionaries, coherent descent on algebraic spaces and derived GAGA);
proves Remmert's proper mapping theorem, the Remmert–Stein closure theorem and Chow's theorem with
nilpotents, and with them the algebraicity of holomorphic maps out of proper schemes and the
connectedness comparison for affine curves; and compares algebraic de Rham cohomology with singular
cohomology — for proper smooth schemes (Grothendieck), in proper smooth families (Gauss–Manin,
Katz–Oda), with Hodge theory (harmonic forms on compact Kähler manifolds, the pure Hodge structure
of a proper smooth scheme, Deligne's relative Hodge theorem), with integration over analytic cycles
and the Chern normalisation, for regular singular connections (Deligne's Riemann–Hilbert equivalence
and nonproper comparison), and for proper log-smooth schemes over the standard log point (Kato's
logarithmic structures and the logarithmic monodromy triangle). It also supplies scheme
compactifications over qcqs bases, their coherent refinement API, stratified topology and finite
cover comparison for complex schemes, and ordinary, compact-support, relative and integral/rational
adic Artin comparison for constructible coefficients.

Finite-coefficient ordinary and compact-support comparison are supplied by
ComplexComparisonPartII §§C6.3–C6.4 / `artinComparison`, `artinComparisonCompactSupport`;
coherent GAGA and de Rham comparison have their own coefficient categories and canonical maps.
The analytic local algebra (convergent germs,
Weierstrass preparation and division, Oka coherence), the category of
complex analytic spaces with nilpotents, analytification of schemes and algebraic spaces, flatness
of the analytic local rings over the algebraic ones, and proper coherent GAGA itself are built in
AlgebraicModuliForArithmeticGeometry, Layer 7, §7.10; this roadmap starts where that section stops.
Every object keeps its nilpotents and every comparison is a named canonical map (pullback,
exchange, integration, residue, coefficient change), so that an arithmetic application can identify
its own sections, residues, periods and monodromy through those maps rather than through
unlabelled dimension counts.

The layers are C0–C6:

| Layer | Title | Headline targets |
| --- | --- | --- |
| C0 | Coherent analytic modules and coherent analytification | `CoherentAnalyticModule`, `coherentOperations`, `CoherentAnalyticIdeal`, `holomorphicBundleDictionary`, `CoherentAnalytification`, `HigherImageComparison`, `fibreDimensionLoci` |
| C1 | Analytic coherent cohomology | `localDolbeault`, `HodgeStar`, `HodgeLaplacian`, `kaehlerIdentities`, `ChernConnection`, `bochnerKodaira`, `weightedDolbeaultEstimate`, `cartanTheoremB`, `schwartzFiniteness`, `cartanSerreFiniteness`, `AnalyticTwist`, `analyticTwistCohomology`, `analyticSerreGeneration`, `analyticSerreVanishing` |
| C2 | Projective and proper consequences of coherent GAGA | `gagaBaseChange`, `projectiveGeometricDictionaries` |
| C3 | Algebraic spaces: analytic descent and derived GAGA | `analyticEtaleDescent`, `spaceQuasiCoherator`, `pseudoCoherenceDetection`, `derivedGagaProperSpace` |
| C4 | Scheme compactification, analytic images, Chow algebraization and morphism comparison | `Compactification`, `DenseCompactification`, `nagataCompactification`, `compactificationCommonRefinement`, `remmertProperImage`, `remmertSteinExtension`, `projectiveChowNonreduced`, `properSupportAlgebraization`, `properSourceMorphismAlgebraicity`, `affineCurveConnectedness` |
| C5 | de Rham–Betti comparison, Hodge theory and logarithmic comparison | `AlgebraicDeRham`, `holomorphicPoincare`, `sheafSingularComparison`, `properDeRhamBetti`, `GaussManin`, `relativeHodgeBundles`, `kaehlerHodgeDecomposition`, `properPureHodge`, `AnalyticCycleIntegration`, `LogStructure`, `logChartCriterion`, `deligneRiemannHilbert`, `regularSingularDeRhamComparison`, `properLogGagaMonodromy` |
| C6 | Stratified topology, Riemann existence and finite/adic Artin comparison | `complexAlgebraicTopology`, `topologicalCoefficientComparison`, `riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`, `relativeArtinComparison`, `adicArtinComparison` |

## Scope and ownership

The roadmap owns coherent analytic modules and their operations on complex analytic spaces; coherent
ideals and their nilpotent quotients; the dictionary between holomorphic vector bundles and finite
locally free analytic modules; the analytification functor on coherent algebraic modules with its
faithfulness and its tensor, Hom, dual and determinant comparisons; the canonical exchange map for
higher direct images; the Cartan–Remmert fibre-dimension loci. The local and weighted Dolbeault
theory, the Hodge star, the Hodge Laplacian and the Kähler identities, the Chern connection and
the Bochner–Kodaira identity, Cartan's theorem B, Montel's and Schwartz's theorems, Cartan–Serre finiteness, analytic projective twisting sheaves with their
cohomology, and Serre's analytic generation, vanishing and twist presentations. The base-change and
dictionary consequences of projective GAGA. Coherent analytic descent on étale presentations, the
quasi-coherator of an algebraic space (on AlgebraicModuliForArithmeticGeometry's `spaceDQCoh`), Hall's
pseudo-coherence detection and derived GAGA for proper algebraic spaces. Remmert's and
Remmert–Stein's theorems, Chow's theorem with nilpotents, algebraization
with proper support, algebraicity of holomorphic maps from proper sources and of maps with algebraic
graphs, the morphism interfaces for families, and the affine-curve connectedness comparison. In
Layer C5: sheafification of the shared algebraic de Rham complex and the holomorphic de Rham complex, the holomorphic and relative Poincaré
lemmas, the analytic equivalence between flat connections and local systems with holomorphic
parameters, the nilpotent-retaining Artin-base de Rham–Betti comparison, analytification of differential
operators and proper hypercohomology comparison for operator complexes, small singular cochains and the sheaf–singular comparison for arbitrary abelian
coefficients, the proper de Rham–Betti comparison with its multiplicative and integral structure,
the underlying-smooth analytification adapter for Ehresmann fibrations and Betti local systems, the Gauss–Manin connection and the relative
comparison, compact elliptic theory for the Hodge Laplacian, harmonic projection and the Green
operator, the compact Kähler Hodge decomposition, pure Hodge structures on proper smooth schemes, Deligne's relative Hodge theorem, the test-form topology and current calculus with positivity, mass and local regularization, integration over analytic
cycles, positivity of (1,1)-forms, the integral first Chern class of a holomorphic line bundle
and its integral identification with the shared smooth first Chern class, and the Chern normalisation, sheafification and analytification of
shared ordinary connections,
regular singularities, canonical logarithmic extensions, Deligne's Riemann–Hilbert equivalence and
nonproper comparison, the curve logarithmic and compact-support complexes with residues, and the
specializations and analytic adapters for shared logarithmic structures and de Rham complexes,
split log cotangent transitivity, and the proper logarithmic comparison over the standard log point.

The scheme geometry of §§C4.3a–C4.3c has its single owner here: `Compactification`,
`DenseCompactification`, their category, dense replacement, base change, Nagata existence and
common refinements for separated finite-type morphisms over qcqs bases. The shared implementation
namespace is `TauCeti.AlgebraicGeometry`; the Noetherian finite-type case uses these same carriers
and refinement comparisons. SchemeAndStackFoundations §2.19, ClassicalAdicEtaleCohomology §0.8
and LefschetzPencilsAndVanishingCycles §F.2 consume this geometry and own their respective
coherent and étale coefficient constructions and independence theorems.

C6 owns the noncompact/locally-closed and algebraic-gluing extensions of
AffineMorseLefschetz A4’s compact closed-family triangulation. It owns finite locally constant
module sheaves and their fibre-preserving equivalence with the finite-stalk full subcategory
of the native `TauCeti.LocalCoefficientSystem`, constructible topological coefficients,
their sheaf–cochain comparisons, Riemann existence,
the analytic-to-étale site morphism, and ordinary, compact-support and relative finite Artin
comparison. These use AlgebraicModuliForArithmeticGeometry §7.10.1's analytic-space carrier
and analytification functor. InverseGaloisAndArithmeticFundamentalGroups uses the same cover
equivalence and comparison maps for its puncture, ramification and Hurwitz-space adapters.
C5.1's constant sheaf–singular comparison retains arbitrary abelian coefficients and its
non-Hausdorff domain. C6 uses it and constructs the local-system sheaf resolution, stratified and compact-support
comparisons; generic direct local-system cochains and their topological identities come from
AlgebraicTopology Stage 6.1.

C6.6 is the single owner of the topological realization of normalized adic systems, its derived
inverse limit and rationalization, and integral/rational ordinary and compact-support Artin
comparison. LefschetzPencilsAndVanishingCycles §§F.0–F.4 owns the finite/adic étale coefficient
categories and their geometric operations; ClassicalAdicEtaleCohomology §§0.1–0.4 owns generic
enhancements, derived limits and completion. The dependency order is §§F.0–F.3 → C6.0–C6.5,
with §F.4 additionally supplying C6.6, followed by the nearby-cycle and inertia application
in §F.9. C6 does not use that application to construct its comparisons.

**Built in other roadmaps and cited.**

- *DerivedDeRhamCohomology, Layer 2, §§2.1–2.19.* The ordinary algebraic de Rham
  differential, its square-zero and graded Leibniz laws (`DeRham.d_squared`,
  `DeRham.d_leibniz`), `DeRham.complex A B`, and its pullback and complex-map API
  (`DeRham.pullback`, `DeRham.complexMap`) over arbitrary commutative rings. C5.1 sheafifies
  this core; its affine differential and functoriality are the supplier's constructions.
- *CrystallineCohomology, CR.1, “Modules with integrable connection and their de Rham
  complexes”.* `Crystalline.Connection`, with extension, curvature, coefficient de Rham
  complex, base change, tensor and Hom. C5.2 uses the ordinary Kähler-differential case,
  sheafifies it on smooth schemes, and analytifies it; no PD or quasi-nilpotence condition
  enters the complex comparison.
- *CrystallineCohomology, CR.5:log-algebra.1–.4 and CR.5.1.* `LogCrystalline.PrelogRing`,
  `LogCrystalline.PrelogRing.IsLog`, the étale log-structure, associated-log, inverse-image,
  fine-chart and divisorial-log APIs; `LogCrystalline.IsFineMonoid`,
  `LogCrystalline.IsSaturatedMonoid`, `LogCrystalline.IsLogSmooth`, the Kato chart criterion,
  `LogCrystalline.divisorialLog`,
  `LogCrystalline.logDifferentials` and `LogCrystalline.logDeRham`. These own the
  all-characteristic algebraic core. C5.5 uses that carrier on algebraic sites and builds
  its analytic adapter `logAnalytification`. The order is the ordinary Layer 2 core →
  CR.1 ordinary connections and CR.5 logarithmic cores → C5.1–C5.2 sheafification and
  C5.5 analytic adapters → C5.6–C5.7 comparisons. No supplier uses C5's GAGA or Hodge theory
  to construct these cores; the supplier section order between the crystalline and derived
  roadmaps is retained.
- *AlgebraicModuliForArithmeticGeometry, Layer 7, §7.10.1.* The holomorphic structure sheaf
  `HolomorphicStructureSheaf n` on `ℂⁿ` and its stalks `ConvergentGerm n a ≅ ℂ{z₁,…,zₙ}`;
  `convergentWeierstrassPreparation`, `convergentWeierstrassDivision` and
  `convergentGerm_noetherian`; the category `ComplexAnalyticSpace` of locally `ℂ`-ringed spaces
  locally isomorphic to `(V(I), O_U/I)` with arbitrary (also non-radical) finitely generated ideal
  sheaves, with `closedSubspace`, `openSubspace`, `glue`, `fibreProduct` and `coherentStructure`
  (Oka's coherence theorem for the structure sheaf); and `complexSchemeAnalytification`, the
  functor `X ↦ X^an` on schemes locally of finite type over `ℂ` with its canonical morphism of
  locally ringed spaces `φ_X : X^an → X`.
- *Same roadmap, §7.10.3.* `complexSpaceAnalytification` for locally separated algebraic spaces of
  finite type over `ℂ`; `completedAnalyticStalkComparison` with `localHom`, `completionIso`,
  `flat` and `coherentPullbackExact` (the local map `O_{X,x} → O_{X^an,x}` is flat and induces an
  isomorphism of completions, and analytification of coherent modules is exact); and proper coherent
  GAGA: `properSchemeGagaPushforward` (for proper `f` between schemes of finite type over `ℂ` and
  coherent `F`, the canonical map `(R^q f_*F)^an → R^q f^an_* F^an` is an isomorphism for all `q`;
  the base need not be proper; as a consequence, on a proper scheme coherent cohomology and every
  global Ext group are compared), `properSchemeGagaEquivalence` (on a proper scheme, analytification
  is an exact equivalence of coherent categories) and
  `properSpaceComplexGaga` (the same for proper algebraic spaces, with proper pushforward). Projective
  coherent GAGA is the projective case of these statements. Since the local map is a flat local
  homomorphism of local rings, it is faithfully flat (Mathlib's flat-local criterion).
- *Same roadmap, Layer 9, §9.5.* `sncCompactification` (a smooth quasi-projective variety in
  characteristic zero embeds as a dense open in a smooth projective variety with strict normal
  crossings complement) and `analyticPolydisc` (SNC polydisc charts on the analytification).
- *Same roadmap, Layers 1–3.* Algebraic projective bundles, twisting sheaves and relative Serre
  generation and vanishing (Layer 1); coherent dévissage `coherentDevissage` and
  `devissageViaChow` (Layer 2, §2.3); effective étale descent on algebraic spaces and the
  algebraic Hom/Isom representability for projective families (Layer 3).
- *Same roadmap, §7.7.* `spaceDQCoh X`, the full subcategory of the derived category of
  `O_X`-modules on the ringed small étale site of an algebraic space with quasi-coherent cohomology
  sheaves, and `spacePerfect X`, with `spaceDQCoh.chartRestriction`,
  `spaceDQCoh.schemeEtaleEquivalence`, `spaceDQCoh.derivedPullback`,
  `spaceDQCoh.derivedPushforward`, `spaceDQCoh.tensor` and `spaceDQCoh.cohomologyComparison`. C3.2
  builds the quasi-coherator on this category.
- *LefschetzPencilsAndVanishingCycles, §§F.0–F.3.* Finite étale covers and monodromy,
  finite/constructible module sheaves, the bounded constructible finite-Tor category, finite
  cohomology and products, proper/smooth base change, compact supports, finiteness and Künneth.
  C6.2–C6.5 use these inputs, with their precise coefficient and geometric hypotheses.
  Its §F.4 supplies normalized adic systems and their classical/pro-étale realizations for C6.6.
- *ClassicalAdicEtaleCohomology, §§0.1–0.4, 0.7–0.8.* Enhanced module-sheaf categories,
  canonical derived functors, derived limits/completion, étale support localization and
  compactification-defined proper supports. These use the geometry of §§C4.3a–C4.3c;
  coherent proper-support algebraization in C4.3 uses the same geometry with `O_X`-modules.
- *SmoothBundlesConnections, B1.5.* The general proper-surjective-submersion theorem on
  finite-dimensional Hausdorff second-countable real smooth manifolds without boundary,
  with native `FiberBundle`/`Trivialization` charts smooth in both directions over the base,
  componentwise model fibres and restriction/pullback maps. C5.2's `ehresmannFibration`
  supplies the underlying-smooth holomorphic/analytification adapter and the relative Betti
  consequence. This dependency uses B1.5's submersion construction, not its principal-bundle
  applications or the rest of that roadmap.
- *Same roadmap, B2 and B6.1–B6.4.* Native smooth complex bundles and Hermitian metrics;
  the integral exponential/Čech-to-singular construction for the inverse-character line of a
  right principal circle bundle, its pullback/tensor/dual laws, rank-one curvature comparison
  and flat-holonomy Bockstein. C5.4 forgets holomorphic structure and identifies its class
  integrally with this one. CharacteristicClasses C1.5 and C3 use the same line class.
- *AffineMorseLefschetz, A4, opening triangulation paragraphs.* The compact semialgebraic
  finite closed-family theorem, subcomplexes, compatible subdivisions and dimension API.
  C6.0 constructs the noncompact/locally-closed and separated algebraic chart-gluing
  extensions. Only this foundational leaf is consumed, not A4's complement duality or its
  Lefschetz applications.
- *UniversalCovers.* Fundamental-groupoid transport, covering classification, lifting and deck
  transformations for C6's finite topological covers and local systems.
- *SchemeAndStackFoundations.* Algebraic spaces, their étale sites and descent (Layer 1); site
  cohomology functoriality, higher direct images, Leray and Čech-to-cohomology (§2.1 `Sheaf.H.pullback`,
  §2.1 `Sheaf.higherDirectImage`, §2.2 `leray_spectral_sequence`, §2.2 `cech_to_cohomology`),
  quasi-coherent higher direct images, cohomology of line bundles on projective space and Serre
  vanishing (§2.6 `qcoh_higherDirectImages`, §2.6 `projectiveSpace_cohomology`,
  §2.6 `ample_serre_vanishing`), the quasi-coherent derived category of a scheme with derived
  pullback and pushforward, its perfect generator and Tor-independent base change
  (§2.18 `DQCoh`, §2.18 `derivedPullback`, `totalDirectImage`,
  §2.18 `perfect_generator`, §2.18 `torIndependent_baseChange`); coherent duality and its trace
  (§2.19 `upperShriek`, `trace`; §2.20 `relativeDualizingModule_smooth`, `cm_serre_duality`,
  `sheafified_grothendieck_duality`), used for the Hodge-cohomology retraction in C5.3;
  Chow's lemma (§4.12).

**Tau Ceti roadmaps this roadmap builds on.** AlgebraicVectorBundles (general sheaf-module tensor
product, internal Hom, finite local freeness, exterior powers, duals and determinants); DifferentialGeometry (smooth differential forms on
manifolds, wedge product, exterior derivative, integration and Stokes, smooth de Rham cohomology and
its products, the Laplace–Beltrami operator); AlgebraicTopology (singular chains and cochains with
arbitrary coefficients, cup products, manifold duality and trace); PDE (scalar elliptic estimates on
Euclidean domains); JacobianChallenge (relative coherent cohomology and base change); AlgebraicCurves
(normal affine charts in Layer 2 and the smooth projective model of a function field in
Layers 12B–12C; C4.5 constructs the affine completion immersion); StableReduction (coherent curve
theory); and the completed HodgeStructures roadmap
(abstract pure Hodge structures, implemented in Tau Ceti as `TauCeti.Hodge.HodgeStructureOn` and
`TauCeti.Hodge.Conjugation`). None of these is re-planned; where this roadmap needs more in one of
their directions (Hodge stars, Kähler identities, compact elliptic theory on bundles,
holomorphic submersion adapters, Chern connections), the additional target is stated here with its exact relation to the
supplier.

**Already in the Tau Ceti library.** Montel's theorem for open subsets of `ℂ` is `TauCeti.montel`
(at the pinned commit); `montelTheorem` in C1.6 is its several-variable form. The pinned library
also supplies singular cohomology with coefficients and its cup product
(`TopCat.singularCohomology`, `TopCat.singularCup`), the complex of singular chains small for an
open cover with its inclusion equivalence (`TopCat.smallSingularSubcomplex`,
`TauCeti.smallSingularChainHomotopyEquiv`), and the stability of Fredholm operators under compact
perturbation (`ContinuousLinearMap.IsFredholm.add_of_isCompactOperator`). These are used, not
restated: `SmallSingularCochains` (C5.1) measures smallness by a nesting of neighbourhoods attached
to the barycentres of the faces of a simplex rather than by one open cover, and `schwartzFiniteness` (C1.6) perturbs a surjection
whose kernel may be infinite-dimensional, so it is not a statement about Fredholm operators.
The cochain and cup suppliers are in `TauCeti.AlgebraicTopology.Cohomology.Basic` and
`TauCeti.AlgebraicTopology.Cohomology.Cup`; subdivision and the inclusion equivalence are in
`TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Homotopy` and
`TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Equiv`. The Fredholm supplier is in
`TauCeti.Analysis.Fredholm.CompactPerturbation`. The native local-system carrier is
`TauCeti.LocalCoefficientSystem Λ T` (ring first), with evaluation, path transport,
monodromy and pullback in `TauCeti.AlgebraicTopology.LocalCoefficient`. Its finite-stalk
full subcategory is `FiniteModuleLocalSystem Λ T` in C6.1. The pinned
`TauCeti.LocalCoefficientSystem.twistedCochainComplex` in
`TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic` takes Hom from twisted chains;
with scalar target it computes dual-system cochains. C6.1 consumes AlgebraicTopology
Stage 6.1's direct cochains with the actual coefficient fibres.

Outside this scope are definable Chow and o-minimal algebraization
(LogicAndDefinabilityInNumberTheory, LD.6); Borel's algebraicity theorem for maps into arithmetic
quotients (ShimuraVarieties, V3), which needs an extension theorem and does not follow from proper
GAGA; the Kato–Nakayama Betti space of a log scheme; crystalline sites, divided-power envelopes,
the full cotangent complex and derived de Rham cohomology (CrystallineCohomology,
DerivedDeRhamCohomology, which supply the ordinary and logarithmic cores used in C5); variations of
Hodge structure, period maps, limiting Hodge structures and nilpotent orbits (HodgeStructuresPartII,
which imports the connection, canonical-extension, Gauss–Manin, proper-log and geometric-Hodge
outputs of C5); rigid and dagger de Rham cohomology (AdicSpacesPartII); the Kodaira–Spencer
normalisation of modular curves (ModularCurvesPartII, R12.5).

## Conventions

- **Analytic spaces.** A complex analytic space is an object of `ComplexAnalyticSpace`: locally
  finite complex dimension, with a uniform dimension bound only where a target explicitly requires
  one; structure sheaf locally a quotient `O_U/I` of the holomorphic sheaf of an open
  `U ⊆ ℂⁿ` by a finitely generated ideal sheaf `I`, which need not be radical. Nilpotents are never
  discarded: a closed analytic subspace is given by a coherent ideal, not by its zero set.
- **Dimensions.** The empty analytic fibre has dimension `−∞`, so the zeroth
  fibre-dimension locus in the target is the image of the map, rather than the entire base.
- **Manifolds and analytic cohomology.** Manifolds in C1 and C5 are finite-dimensional,
  Hausdorff, second countable and without boundary. Strongly 1-complete spaces and the compact
  analytic spaces of C1 are Hausdorff and second countable; the coherent categories and descent
  of C0 and C3 also apply to the non-Hausdorff analytic spaces of the supplier.
- **Algebraic schemes** are locally of finite type over `ℂ` unless a target names another base;
  algebraic spaces are locally separated and of finite type over `ℂ`.
- **Compactification geometry** in §§C4.3a–C4.3c is over any qcqs base `S` with `f : X → S`
  separated and finite type. In Lean, finite type is `LocallyOfFiniteType f` together with
  `QuasiCompact f`, and qcqs is `CompactSpace S` together with `QuasiSeparatedSpace S`.
- **Finite and adic coefficients.** C6 uses a finite commutative ring `Λ`, killed by an integer
  `N ≥ 1`; invertibility is required only by the particular geometric input using it (over `ℂ`
  it is automatic). `Dᵇ_ctf` means bounded constructible cohomology and finite Tor amplitude,
  not just constructibility. Adic objects have coherent derived reductions at all levels and
  uniform cohomological and Tor intervals. Arithmetic fibre transport requires a specified
  family and an étale path or specialization datum.
- **Classical topology.** C6 always uses the underlying space of
  AlgebraicModuliForArithmeticGeometry §7.10.1's `complexSchemeAnalytification`, restricted to
  finite-type complex schemes. Forgetting the ring sheaf supplies the topological carrier;
  its nilpotents remain in the analytic object. Global Hausdorff/paracompact and compact-support
  claims carry separatedness; arbitrary finite-type schemes retain the affine-local topology
  and ordinary comparison.
- **Analytification of modules.** For a scheme `X` with `φ_X : X^an → X`, and an `O_X`-module `F`,
  `F^an = O_{X^an} ⊗_{φ_X⁻¹O_X} φ_X⁻¹F`: Mathlib's pullback of sheaves of modules along the
  morphism of ringed spaces `φ_X`. It is never an independently chosen analytic module.
- **Coherence** of an analytic module means local finite presentation over a coherent structure
  sheaf (equivalently, finite type with locally finitely generated relation sheaves); Noetherian
  stalks alone do not give it.
- **Cohomology** is Mathlib's `Sheaf.H` (Ext from the constant sheaf) and the derived categories of
  sheaves of modules; Čech complexes are Mathlib's `cechComplexFunctor`, compared with derived
  cohomology through SchemeAndStackFoundations §2.2 `cech_to_cohomology`.
  DiamondsAndVStacks D0.19 uses this same general theorem on perfectoid sites; the analytic
  application here uses the general supplier directly.
- **Linearity of differentials.** Exterior derivatives, connections and differential operators are
  `ℂ`-linear (relative ones `f⁻¹O_S`-linear), never `O_X`-linear. A de Rham complex is a complex of
  sheaves of `ℂ`-vector spaces whose terms happen to be coherent `O_X`-modules; its comparison runs
  through differential operators and principal parts (C5.1), not through coherent GAGA applied to
  the differential.
- **Periods and Chern classes.** The positively oriented unit circle gives `∮ dz/z = 2πi`. The first
  Chern form of a Hermitian holomorphic line bundle is `(i/2π)Θ`; the normalised Fubini–Study form
  represents `c₁(O(1))` and integrates to `1` over a projective line. SmoothBundlesConnections
  B6's right principal circle class is the class of its inverse-character associated line;
  the standard-character line has its negative. For a holomorphic line `L`, the unit-frame
  bundle of `L∨` supplies that convention, so its inverse-character line is `L`.
- **Hermitian pairing.** Smooth bundle metrics use Mathlib's convention, conjugate-linear in
  the first slot: `h(s,t) = s* H t` in column coordinates. The pairing displayed in the Hodge
  star identity is `⟨α,β⟩ = h(β,α)`, linear in the first slot. Transport this swap when
  comparing Chern connections with SmoothBundlesConnections B2–B4.
- **Hodge star and Laplacian.** The Hodge star on complex forms is `ℂ`-linear, defined by
  `α ∧ *β̄ = ⟨α, β⟩ vol`; complex conjugation sits in the Hermitian pairing, not in `*`. The Hodge
  Laplacian `Δ = dδ + δd` is nonnegative; on functions it is the negative of DifferentialGeometry's
  `laplaceBeltrami = div ∘ grad` (in `ℝ³`, `Δ(x₁²) = −2`).
- **Residues and monodromy.** For the connection `d + a dz/z` the residue at `0` is `a` and the
  monodromy along the positive loop is `exp(−2πia)`. Canonical logarithmic extensions use the
  residue strip `0 ≤ Re λ < 1`; tensor products of canonical extensions need integer residue
  adjustment, while the unipotent extension is tensor compatible.
- **Log structures** are monoid sheaves with a multiplicative structure map to `(O, ·)`; charts may
  send non-units to `0` (the standard log point `ℕ → ℂ`, `1 ↦ 0`). "Fine" means integral and
  finitely generated; saturation is a separate condition and is never assumed silently.
- **Lean.** Declarations live in `TauCetiRoadmap.ComplexComparisonPartII`; the names below are
  relative to it. Targets whose carriers are not in Mathlib or Tau Ceti at the pins (complex
  analytic spaces, analytification, algebraic spaces, compact manifolds with forms) are specified in
  this README only; `Suggested.lean` records the light definitions and the statements that can be
  typed against the pinned libraries.

## Exact supplier contracts

### From Mathlib (pinned)

- Sheaves of modules: `SheafOfModules`, `SheafOfModules.IsFinitePresentation` (finite presentation
  by quasi-coherent data), `SheafOfModules.IsLocallyFree`, pullback along morphisms of ringed sites,
  `AlgebraicGeometry.LocallyRingedSpace`, `AlgebraicGeometry.Scheme.Modules`.
- Cohomology: `CategoryTheory.Sheaf.H F n` (Ext from the constant sheaf; needs sheafification and
  `HasExt`), `CategoryTheory.cechComplexFunctor`, derived categories `DerivedCategory`, and
  `CategoryTheory.Abelian.Ext.mapExactFunctor` (the map on Ext induced by an exact additive functor).
- Commutative algebra: `KaehlerDifferential` with `KaehlerDifferential.D : Derivation R S Ω[S⁄R]`,
  `Derivation`, `exteriorPower` with `exteriorPower.ιMulti`, `Module.Flat`,
  `Module.FaithfullyFlat.of_flat_of_isLocalHom` (a flat local homomorphism of local rings is
  faithfully flat), `MvPowerSeries`, `Monoid.FG`, `AddMonoid.FG`, group completion
  `Algebra.GrothendieckGroup` (group completion of a commutative monoid);
  `AddSubmonoid.NSMulSaturated` (root saturation in the given ambient additive monoid).
  C5.5 applies the latter to the chart submonoid inside its generated subgroup.
- Schemes: `AlgebraicGeometry.IsProper`, `IsSeparated`, `LocallyOfFiniteType`, `IsOpenImmersion`
  (a `MorphismProperty`), `IsLocallyNoetherian`; `QuasiCompact`, `CompactSpace`,
  `QuasiSeparatedSpace`, `IsSchemeTheoreticallyDominant`, `Scheme.Hom.ker`, `Flat`,
  `CategoryTheory.Over` and scheme pullbacks for compactification geometry.
- Analysis: `AnalyticAt`, `Filter.Germ.valueRingHom`, `ContDiff`, `fderiv`, the multivariable inverse
  function theorem `ContDiffAt.to_localInverse` (valid at analytic smoothness `ω`), Montel-type
  compactness via Arzelà–Ascoli, `circleIntegral` with
  `circleIntegral.integral_sub_inv_of_mem_ball` (`∮ (z − w)⁻¹ = 2πi`), Lebesgue measure on `ℂ`,
  `Matrix.PosSemidef`, `Matrix.det`. `TestFunction` has the locally convex inductive-limit
  topology of compactly supported smooth functions; `Distribution Ω F ⊤` is the compact-convergence
  continuous real-linear dual of real-valued test functions, with values in `F`.
  `Distribution.lineDerivCLM`, `Distribution.ofFun` and `Distribution.delta` supply the
  chartwise derivative, locally integrable coefficients and Dirac distribution for `CurrentCalculus`.
  Module lengths use `Module.length`; `DualNumber ℂ` is the square-zero algebra in the Artin check.
- Manifolds: `ModelWithCorners`, `𝓘(ℂ, E)`, `IsManifold I ω M` (complex manifolds),
  `ContMDiffVectorBundle`, `topologicalKrullDim`, `LocallyContractibleSpace` (a predicate).
- Singular chains: `AlgebraicTopology.singularChainComplexFunctor` (singular cohomology itself is
  not in Mathlib at the pin; see AlgebraicTopology below).

### From Tau Ceti (pinned)

- `TauCeti.SheafOfModules.ringCatSheaf R` in
  `TauCeti.Algebra.Category.ModuleCat.Sheaf.Defs`: the sheaf of rings underlying a sheaf of
  commutative rings on any site. Applied to a locally ringed space's structure sheaf, this is the
  ring sheaf used in C0.1.
- `TauCeti.SheafOfModules.isMonoidal_isFinitePresentation` in
  `TauCeti.Algebra.Category.ModuleCat.Sheaf.Quasicoherent.Monoidal`: the monoidal unit is finitely
  presented and tensor products of finitely presented modules are finitely presented. These parts
  of `coherentOperations` use that supplier; kernels, internal Hom, extensions and analytic gluing
  remain the additional coherence assertions in C0.1.
- `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`: positive-degree `Sheaf.H` of a flasque sheaf of
  abelian groups on a topological space vanishes.
- `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf X`: the full subcategory of finitely presented
  `X.Modules`, the algebraic coherent category on a locally Noetherian scheme.
- `TauCeti.Hodge.Conjugation W` (an antilinear involution of a complex vector space) and
  `TauCeti.Hodge.HodgeStructureOn W ω n` (a decreasing filtration `F` with `F^p` and the conjugate of
  `F^{n+1−p}` complementary): the abstract pure Hodge structure that C5.3 instantiates.
- `TauCeti.holomorphicSheaf E`: the sheaf of `E`-valued holomorphic functions on `ℂ` (one variable;
  types-valued), used only as a sanity check for the `n = 1` holomorphic sheaf.
- `TauCeti.montel`: Montel's theorem for a locally bounded sequence of holomorphic maps from an open
  subset of `ℂ` to a proper complex normed space (subsequence converging locally uniformly, with
  holomorphic limit); C1.6 extends it to open subsets of `ℂⁿ`.
- `TopCat.singularCochainComplex R k M` and `TopCat.singularCohomology R k M q`:
  the complex of `k`-linear coefficient morphisms from singular chains with coefficient object
  `R` to `M`, and its degree-`q` cohomology in `ModuleCat k`. For abelian coefficients take
  `C = ModuleCat ℤ`, `R = ℤ` and `M = A`; for complex coefficients take `C = ModuleCat ℂ`.
  `TopCat.singularCup` uses a coefficient diagonal `T → R ⊗ S` and a product `M ⊗ N → P`,
  is natural, associative and unital (the scalar cases use their usual diagonal and product).
  The small-chain suppliers are `TopCat.smallSingularSubcomplex`,
  `TauCeti.smallSingularSubdivisionHomotopy` (subdivision is homotopic to the identity on
  cover-small chains), and `TauCeti.smallSingularChainHomotopyEquiv` (their inclusion into
  all chains is a chain homotopy equivalence). They require an open family covering the space.
- `TauCeti.LocalCoefficientSystem Λ T := FundamentalGroupoid T ⥤ ModuleCat Λ` in
  `TauCeti.AlgebraicTopology.LocalCoefficient`, with `constantFunctor`, `fiberFunctor`,
  `transport`, `monodromyRepresentation`, `pullback` and the identity/composition/homotopy comparisons.
  `FiniteModuleLocalSystem Λ T` is its full subcategory cut out by
  `∀ x, Finite (L.obj x)`; finite means finite underlying sets, not finite projectivity.
  Sheaf equivalence identifies these modules and their path maps themselves.
  `TauCeti.LocalCoefficientSystem.twistedCochainComplex` is Hom from twisted chains,
  hence dual-valued with scalar target; it is used only with that convention.
- `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` (compact perturbations of Fredholm
  operators are Fredholm), for Banach spaces. This supplies the finite-kernel case;
  `schwartzFiniteness` treats a surjection with no finite-kernel hypothesis.
- `TauCeti.IsSemialgebraic`, `TauCeti.IsSemialgebraicOn`, `TauCeti.IsSemialgebraicMap` in
  `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic` and `.Function`: polynomial sign sets,
  finite Boolean operations, polynomial inverse images and graph-defined maps. C6.0 extends
  AffineMorseLefschetz A4’s compact compatible triangulations using these carriers.

### From TauCetiRoadmap roadmaps

- **AlgebraicVectorBundles.** L0A: the closed symmetric monoidal category of sheaves of modules,
  internal Hom (an isomorphism on stalks for finitely presented sources), strong monoidal pullback;
  L0B: finite locally free sheaves, duals, `Hom(E, F) ≅ E^∨ ⊗ F`; L0C: symmetric and exterior powers
  and `determinant`. C0 and C5 use these for coherent and locally free analytic modules.
- **DifferentialGeometry.** Layers 0–1: differential forms on manifolds, wedge and exterior
  derivative; Layer 2: orientations; Layer 5: integration of top forms and Stokes; Layer 6:
  `deRhamCohomology`; Layer 8: the de Rham theorem `deRhamEquiv`; Layer 9: Poincaré duality and
  `finiteDimensional_deRhamCohomology` for compact manifolds; Layer 12: Riemannian metrics and
  `laplaceBeltrami = div ∘ grad`. All over `ℝ`; complex manifolds, Hermitian metrics, Chern
  connections and the Hodge star are C1 targets; SmoothBundlesConnections B1.5 owns the
  general Ehresmann theorem used through C5.2’s holomorphic adapter.
- **AlgebraicTopology.** Stage 6: singular cochains with coefficients in an arbitrary module
  (abelian groups over `ℤ`), universal coefficients, cup and cap products, orientation and
  fundamental class, Poincaré duality; Stage 6.1: direct local-system cochains, relative
  cochains, coefficient maps, homotopy/excision/Mayer–Vietoris and constant-system comparison,
  with no projectivity assumption. Its tensor-paired products supply C6.1's cup identities.
  C6.1 owns the locally constant sheaf/native-functor dictionary and its sheaf resolution;
  this supplier owns the generic direct complex. Stage 8: compact smooth manifolds are of finite CW type.
- **SmoothBundlesConnections.** B1.5 supplies the native smooth proper-submersion
  trivializations to C5.2. B2 supplies the smooth complex bundle carrier/operations and
  conjugate-first Hermitian metrics; B6.1–B6.4 supplies the integral circle/exponential
  class, Čech–singular–de Rham comparison and Bockstein to C5.4. The holomorphic bundle
  adapter and equality with this integral class are C5.4 targets; CharacteristicClasses
  C1.5 and C3 supply its universal/classical first-Chern identification on these bundles.
- **AffineMorseLefschetz.** A4's opening triangulation foundation supplies a finite
  simplicial complex `K`, a semialgebraic homeomorphism `|K| ≅ S` for compact `S`,
  subcomplexes for a finite closed family and compatible subdivisions. C6.0 extends that
  model and owns its comparison with separated complex algebraic charts and open simplices.
  No complement duality or Lefschetz theorem is an input to these extensions.
- **PDE.** Lane A: Sobolev spaces and Rellich compactness on bounded Euclidean domains; Lane D:
  Gårding's inequality, Lax–Milgram and the Fredholm alternative for scalar elliptic operators;
  Lane E: interior regularity. Scalar and Euclidean only; the compact bundle version is a C5 target.
- **JacobianChallenge.** Layer B: coherent cohomology over a field (affine acyclicity, Čech equals
  derived, finiteness for proper schemes); Layer C: proper flat pushforward, flat base change,
  cohomology and base change and semicontinuity, formal functions.
- **StableReduction.** Layer 2: coherent sheaves over locally Noetherian bases, proper pushforward,
  cohomology and base change, relative dualizing sheaves of curves.
- **AlgebraicCurves.** Layer 12B–12C: the regular projective model of a function field and the
  anti-equivalence with regular projective curves (algebraic only; the comparison with compact
  Riemann surfaces is excluded there and is built in C4 here); Layer 2: normal affine charts
  and their DVR/place dictionary. C4.5 constructs the open immersion into the projective model.
- **Completed HodgeStructures.** Abstract pure, polarized and mixed Hodge structures, Tate twists and
  morphisms, implemented as the Tau Ceti declarations above.

### From AlgebraicModuliForArithmeticGeometry and SchemeAndStackFoundations

- **AlgebraicModuliForArithmeticGeometry.** Layer 7, §7.10.1: `HolomorphicStructureSheaf`,
  `ConvergentGerm`, `convergentWeierstrassPreparation`, `convergentWeierstrassDivision`,
  `convergentGerm_noetherian`, `ComplexAnalyticSpace` with `closedSubspace`, `openSubspace`, `glue`,
  `fibreProduct`, `coherentStructure`, and `complexSchemeAnalytification` with `map`, `homEquiv`,
  `closedSubspace`, `openSubspace`, `fibreProduct`, `etaleLocalIso`. §7.10.3:
  `complexSpaceAnalytification`, `completedAnalyticStalkComparison` (`localHom`, `completionIso`,
  `flat`, `coherentPullbackExact`), `properSchemeGagaPushforward`, `properSchemeGagaEquivalence`,
  `properSpaceComplexGaga`. §7.7: `spaceDQCoh`, `spacePerfect`, `spaceDQCoh.schemeEtaleEquivalence`,
  `spaceDQCoh.tensor`. Layer 9, §9.5: `sncCompactification`, `analyticPolydisc`. Layer 1:
  algebraic projective twists and relative Serre theorems. Layer 2, §2.3: `coherentDevissage`,
  `devissageViaChow`. Layer 3: effective étale descent on algebraic spaces and Hom/Isom
  representability for projective families. These are consumed exactly as stated there; in
  particular the exchange map whose invertibility `properSchemeGagaPushforward` asserts is
  `HigherImageComparison` of C0. The local models and flat stalk comparison are prerequisites
  of C0–C1; the proper GAGA proofs consume C0's coherent API and C1's analytic cohomology
  before their outputs are used in C2–C5. In particular C1 does not use proper GAGA.
- **SchemeAndStackFoundations.** Layer 1 (algebraic spaces, étale sites, effective descent); Layer 2 (the site-cohomology, quasi-coherent cohomology and derived
  quasi-coherent declarations named in *Scope and ownership*), including §§2.19–2.20's coherent
  duality, smooth dualizing module, trace and Serre duality for C5.3; §4.12 (Chow's lemma).

### Finite and adic étale suppliers

- **LefschetzPencilsAndVanishingCycles §F.0.** `VanishingCycles.constructibleEtale`,
  `VanishingCycles.finiteEtaleGaloisCategory` and `VanishingCycles.etaleTateTwists` supply
  finite module sheaves, finite covers, étale paths and twists. Constructibility is globally
  finitely stratified on Noetherian schemes and affine-local on locally Noetherian schemes.
  Cover classification and pure constructibility impose no coefficient invertibility;
  twists use SchemeAndStackFoundations §§2.9, 2.11's roots of unity and Kummer with invertible `N`.
- **Its §F.1.** `VanishingCycles.constructibleDerivedCategory` and
  `VanishingCycles.finiteCoefficientCohomology` use the common enhanced module-sheaf category
  and retain the distinction between constructible and ctf complexes, coefficient modules,
  cups and coherent finite group actions. The underlying abelian `D⁺` cohomology agrees with
  SchemeAndStackFoundations §§2.1–2.2, which supply the generic site functors and Leray.
- **Its §F.2.** `VanishingCycles.properBaseChange` covers arbitrary torsion on the proper
  `D⁺` domain without invertibility; `VanishingCycles.smoothBaseChange` uses invertible
  torsion in the rotated smooth/qcqs square. `VanishingCycles.localAcyclicity`,
  `VanishingCycles.etaleKunneth`, `VanishingCycles.etaleCompactSupports`,
  `VanishingCycles.compactSupportCohomology` and `VanishingCycles.etaleKunnethCompactSupport`
  supply finite-level exchange, ULA and ordinary/compact products on their stated domains.
  The lower-shriek construction itself is ClassicalAdicEtaleCohomology §0.8's
  `ClassicalAlgebraic.properSupports`, using §§C4.3a–C4.3c here.
- **Its §F.3.** `VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`,
  `VanishingCycles.affineArtinVanishing`, `VanishingCycles.lisseDirectImageTransport`
  and `VanishingCycles.compactSupportFiniteness`
  supply geometric bounds, affine Artin vanishing, constructibility and finite/perfect
  cohomology. For `Rf_!` preservation of ctf use separated finite type between Noetherian
  schemes and invertible `N`; geometric finiteness is over a separably closed field.
- **Its §F.4.** `VanishingCycles.normalizedAdicSystems`, `VanishingCycles.classicalAdicRealization`,
  `VanishingCycles.etaleProetaleAdicComparison`, `VanishingCycles.adicFiniteness`,
  `VanishingCycles.rationalAdicRealization` and `VanishingCycles.adicFunctoriality` supply
  coherent uniform ctf towers, derived-complete realization, all reductions and continuous
  actions. C6.6 applies them over `ℂ`, with compact support for separated schemes, and uses
  rationalization of this integral object. These foundations do not use its §F.9 comparison
  application.
- **ClassicalAdicEtaleCohomology §§0.1–0.4, 0.7–0.8.** `ClassicalDerived.tensorHom`,
  `ClassicalDerived.functorCoherence`, `ClassicalDerived.inverseLimits`,
  `ClassicalDerived.derivedCompletion`, `ClassicalAlgebraic.supportLocalization` and
  `ClassicalAlgebraic.properSupports` give the enhancement, canonical transformations,
  derived products/limits, reduction conservativity, étale localization and proper supports.
  Constructibility and geometric isomorphism theorems come from the preceding suppliers.
- **UniversalCovers** supplies the topological fundamental groupoid and finite-cover
  classification on locally path-connected, semilocally simply connected spaces, with deck
  groups and basepoint-change transport. **RealAlgebraicGeometry Layers 3, 6** supply the
  polynomial-sign, cell decomposition and projection theory; **AlgebraicTopology** supplies
  simplicial/CW topology and ordinary constant singular coefficients. C6.0 adds triangulation;
  C6.1 adds local and stratified cochains on these existing foundations.

## How to read the build

C0 puts coherent sheaf theory on the analytic spaces of AlgebraicModuliForArithmeticGeometry
§7.10: the coherent category, ideals with nilpotents, holomorphic bundles, the analytification
functor on coherent modules and the exchange map for higher direct images, which every later
comparison uses. C1 computes coherent analytic cohomology without any algebraization: local and
weighted Dolbeault theory (with the Hermitian and Kähler linear algebra it needs) give Cartan's
theorem B, functional analysis gives Cartan–Serre finiteness, and Čech computations on projective
space give twist cohomology and Serre's analytic generation and vanishing. These are the analytic
half of Serre's projective comparison, and they feed Chow's theorem in C4. C2 states the projective
consequences of GAGA that families need (projection and base change, dictionaries for ideals,
sections and bundles). C3 passes to algebraic spaces: analytic étale descent, the quasi-coherator on
the quasi-coherent derived category of an algebraic space and Hall's derived GAGA. C4 proves the
analytic image theorems and uses them, with the compactification objects, Nagata theorem and
refinements of §§C4.3a–C4.3c, to algebraize analytic subspaces and
holomorphic maps out of proper schemes, and compares connectedness of affine curves. C5 is the
de Rham layer, in seven parts: ordinary proper comparison (C5.1), families (C5.2), geometric Hodge
theory (C5.3), integration over analytic cycles (C5.4), logarithmic structures (C5.5), regular
singular connections and the Riemann–Hilbert correspondence (C5.6), and curves with the proper
logarithmic comparison (C5.7). C6 develops stratified topology and topological coefficients,
Riemann existence, finite-level ordinary/compact-support/relative Artin comparison, then adic
comparison using the supplied normalized étale systems. C6.0–C6.5 use the finite-level
foundations independently of adic realization. Each layer ends with its checks and dependencies.

<a id="c0"></a>

## Layer C0: Coherent analytic modules and coherent analytification

Work on a complex analytic space `T` in the sense of AlgebraicModuliForArithmeticGeometry §7.10.1,
whose structure sheaf is coherent by `ComplexAnalyticSpace.coherentStructure`. For a scheme `X`
locally of finite type over `ℂ`, write `φ_X : X^an → X` for the canonical morphism of locally
ringed spaces of `complexSchemeAnalytification`.

### C0.1 Coherent analytic modules

Define `CoherentAnalyticModule T` as the full subcategory of Mathlib's `SheafOfModules` over the
structure sheaf `O_T` on the objects satisfying `SheafOfModules.IsFinitePresentation`; morphisms are
all `O_T`-linear morphisms of sheaves of modules. Because `O_T` is coherent, finite presentation is
equivalent to coherence in the classical sense: finite local generation, and finite local
generation of the relation sheaf of every local finite family of sections (Demailly, *Complex
Analytic and Differential Geometry*, II.3.11–3.16, pp. 87–88). The API is
`CoherentAnalyticModule.ofPresentation` (a local finite cokernel presentation `O^p → O^q → F → 0`
on a cover gives an object), `CoherentAnalyticModule.presentation_iff` (local finite presentation
is equivalent to the classical coherence condition over coherent `O_T`) and
`CoherentAnalyticModule.hom_ext` (a morphism is determined by its restrictions to an open cover).
The definition makes sense over any locally ringed space, and `Suggested.lean` states it in that
form (`CoherentAnalyticModule`, using `TauCeti.SheafOfModules.ringCatSheaf`); it is the coherent
category exactly when the structure sheaf is coherent. *Needs:* Mathlib `SheafOfModules.IsFinitePresentation`; AlgebraicModuliForArithmeticGeometry
§7.10.1 `ComplexAnalyticSpace.coherentStructure`.

**Checks.**

- `CoherentAnalyticModule.free`: `O_T^r` is an object, and it is Mathlib's free sheaf of modules of
  rank `r` (rank `0` included); a definition that forgot the module structure would fail the
  comparison.
- `CoherentAnalyticModule.zero`: the zero sheaf is an object, with a presentation of ranks `0` and
  `0`.
- `CoherentAnalyticModule.torsion`: `O_ℂ/(z)` (the skyscraper `ℂ` at `0`) is coherent but not
  locally free at `0`; a definition by local freeness would exclude it.

Prove `coherentOperations`: on a complex analytic space, kernels, cokernels, images and extensions
of coherent modules are coherent, the internal Hom of two coherent modules is coherent,
restriction to an open preserves coherence, and coherent modules with
compatible gluing isomorphisms on an open cover glue to a coherent module. Consequently
`CoherentAnalyticModule T` is an abelian full subcategory of all `O_T`-modules, closed under
extensions. Finite tensor products are already coherent by
`TauCeti.SheafOfModules.isMonoidal_isFinitePresentation`, and use that declaration.
The proof of the remaining operations reduces each operation to kernels and cokernels of maps between finite free
modules, using coherence of `O_T`; Hom is presented as the kernel of a map between finite sums of
the second argument, and gluing is sheaf descent. The pinned tensor supplier constructs the
tensor product as a cokernel by tensoring a finite presentation of the first argument with the
second. The general monoidal structure
and internal Hom of sheaves of modules are AlgebraicVectorBundles'; this theorem adds coherence of
the outputs (Demailly, II.3.13–3.16, pp. 87–88, for kernels, images, cokernels and extensions;
II §9.4, p. 124, for analytic spaces with nilpotents; II, Exercise 11.3 c), p. 127, for Hom; the
tensor product is the cokernel argument just given). *Needs:* `CoherentAnalyticModule`;
TauCetiRoadmap.AlgebraicVectorBundles (sheaf-module tensor and internal Hom).

### C0.2 Coherent analytic ideals and nilpotent quotients

Define `CoherentAnalyticIdeal T` as the coherent `O_T`-submodules `I ⊆ O_T`. Its closed analytic
subspace is `ComplexAnalyticSpace.closedSubspace` of AlgebraicModuliForArithmeticGeometry, with
underlying set the zero locus of `I` and structure sheaf `O_T/I`; `I` is never replaced by its
radical. The API is `CoherentAnalyticIdeal.quotient` (the structure sheaf of the closed subspace is
`O_T/I`), `CoherentAnalyticIdeal.quotientMap` (`O_T → O_T/I` is surjective with kernel exactly
`I`) and `CoherentAnalyticIdeal.pullbackQuotientIso` (for a morphism `g : T' → T`, the pullback of
`O_T/I` is `O_{T'}/I·O_{T'}`: pullback extends the ideal, it does not take the preimage of the
zero set) (Demailly, II.9.10–9.13, p. 124). *Needs:* `coherentOperations`;
AlgebraicModuliForArithmeticGeometry §7.10.1 `ComplexAnalyticSpace.closedSubspace`.

**Checks.**

- `CoherentAnalyticIdeal.dualNumbers`: for `I = (z²)` on `ℂ`, the stalk of the quotient at `0` is
  `ℂ{z}/(z²)`, with basis `1, z`, `z ≠ 0` and `z² = 0`; replacing `I` by its radical `(z)` gives
  the reduced point and fails.
- `CoherentAnalyticIdeal.zeroIdeal`: `I = 0` gives `T` with its whole structure sheaf.
- `CoherentAnalyticIdeal.unitIdeal`: `I = O_T` gives the empty analytic subspace.

### C0.3 Holomorphic vector bundles and locally free modules

Prove `holomorphicBundleDictionary`. Let `M` be a complex manifold (Mathlib: `ChartedSpace EM M`
with `IsManifold 𝓘(ℂ, EM) ω M` for a finite-dimensional complex normed space `EM`), regarded as a
complex analytic space whose local models are open subsets of `ℂⁿ` with the zero ideal. Taking
sheaves of holomorphic sections gives, for each `r : ℕ`, an equivalence between holomorphic
bundles with model fibre `Fin r → ℂ` (Mathlib's `FiberBundle` and `VectorBundle ℂ` with
`ContMDiffVectorBundle ω` over `𝓘(ℂ, EM)`, holomorphic bundle maps) and finite locally free
coherent `O_M`-modules of rank `r` (AlgebraicVectorBundles L0B's `isFiniteLocallyFreeOfRank`,
on Mathlib's `SheafOfModules.IsLocallyFree` carrier). For arbitrary locally constant finite
rank, the bundle carrier consists of a locally constant function `ρ : M → ℕ` and a bundle
with model fibre `Fin r → ℂ` on each clopen stratum `M_r = {x | ρ x = r}`. A morphism between
two such objects is a holomorphic bundle map on each intersection of their rank strata;
source and target ranks may differ. Glue their section sheaves on this disjoint open cover.
Conversely the local ranks of a finite locally free sheaf define `ρ`, and the fixed-rank
dictionary on each `M_r` gives the inverse. This yields the full finite locally free category,
including objects whose ranks differ between components; no global bound on `ρ` or
connectedness assumption is required. Tensor products use the common rank-stratum refinement
and pointwise product of ranks; duals preserve ranks, exterior powers use binomial ranks,
determinants have rank one, and pullback uses `ρ ∘ f`. Compare determinants on fixed-rank
subcategories and on the core of all objects, as in AlgebraicVectorBundles L0C. Prove that these operations correspond
to the module operations of AlgebraicVectorBundles. A finite holomorphic frame identifies the section sheaf
with `O^r`; conversely transition matrices between module frames glue a bundle (Demailly,
II.3.1–3.6, pp. 83–86). The dictionary is a theorem about smooth spaces: on a singular space there
is no tangent bundle and no such equivalence is used. *Needs:* `coherentOperations`; Mathlib
`SheafOfModules.IsLocallyFree`, `ContMDiffVectorBundle`; TauCetiRoadmap.AlgebraicVectorBundles
(L0B rank predicates, exterior powers and determinants of finite locally free modules).

**Checks.**

- Rank zero: the model fibre `Fin 0 → ℂ` gives the zero section sheaf, and its determinant is `O_M`.
- Fixed positive rank: the trivial model bundle `M × (Fin r → ℂ)` has section sheaf `O_M^r`;
  its dual and pullbacks agree with the fixed-rank dictionary.
- On `M = ℂ ⊔ ℂ`, glue rank one on the first component and rank two on the second to obtain
  `O ⊔ O²`. No single fixed-model-fibre bundle on all of `M` represents this object; the
  clopen-stratum carrier does, and its second exterior power has ranks `(0,1)`.

### C0.4 Coherent analytification

Define `CoherentAnalytification X` for `X` locally of finite type over `ℂ`: the functor from
coherent `O_X`-modules (Tau Ceti's `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` carrier over
a locally Noetherian scheme) to `CoherentAnalyticModule X^an` sending `F` to
`F^an = O_{X^an} ⊗_{φ_X⁻¹O_X} φ_X⁻¹F`, i.e. Mathlib's pullback along `φ_X`. A local finite
presentation of `F` pulls back to one of `F^an`, and `O_{X^an}` is coherent, so `F^an` is coherent.
Its exactness is `completedAnalyticStalkComparison.coherentPullbackExact`. The API is
`CoherentAnalytification.obj` (the displayed tensor pullback), `CoherentAnalytification.map`
(pullback of morphisms, preserving identities and composition), `CoherentAnalytification.tensorIso`
(`(F ⊗ G)^an ≅ F^an ⊗ G^an`, natural) and `CoherentAnalytification.idealQuotientIso`
(`(O_X/I)^an ≅ O_{X^an}/I·O_{X^an}` for a coherent ideal `I`) (SGA 1, Exposé XII, §1.3, printed
p. 241). *Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`;
AlgebraicModuliForArithmeticGeometry §7.10.1 `complexSchemeAnalytification`; `CoherentAnalyticModule`.

**Checks.**

- `CoherentAnalytification.structureSheaf`: `(O_X)^an = O_{X^an}` canonically.
- `CoherentAnalytification.freeModule`: `(O_X^r)^an = O_{X^an}^r`, including `r = 0`.
- `CoherentAnalytification.dualNumberQuotient`: for `X = Spec ℂ[ε]/(ε²)`, `(O_X)^an` is the
  length-two algebra `ℂ[ε]/(ε²)` on one point; an analytification of the reduced space would give
  `ℂ`.

Prove `coherentAnalytification_faithful`: for `X` locally of finite type over `ℂ`, coherent
analytification is faithful and reflects isomorphisms and zero objects. A nonzero coherent module
has a closed point in its support (finite type over `ℂ` is Jacobson), closed points are complex
points, and at a complex point `O_{X,x} → O_{X^an,x}` is a flat local homomorphism, hence faithfully
flat, so the stalk of the analytification is nonzero; apply this to kernels, cokernels and images
(SGA 1, XII, Proposition 1.3.1 and its proof, printed pp. 241–242). The functor is not full when `X`
is not proper: on `A¹` multiplication by `exp(z)` is an endomorphism of `O_{A¹,an}` that is not
algebraic (Serre, *GAGA*, n° 12, Remarque 1, printed p. 20, notes that the comparison theorems fail
for affine varieties).
*Needs:* `CoherentAnalytification`; AlgebraicModuliForArithmeticGeometry §7.10.3
`completedAnalyticStalkComparison.flat`; Mathlib (a flat local homomorphism of local rings is
faithfully flat); Mathlib `JacobsonSpace` (schemes locally of finite type over a field).

Prove `coherentPullbackOperations`: analytification commutes, by the canonical maps, with tensor
products and internal Hom of coherent modules, with dual and determinant of finite locally free
modules, with restriction to opens, with direct image along closed immersions and with short exact
sequences. For internal Hom present the first argument by two finite free modules and use exactness
of analytification on the resulting kernel; tensor, exterior powers and determinants follow from
the monoidal structure of pullback and local frames (Serre, *GAGA*, n° 14, Lemma 6 and its proof,
printed p. 22; SGA 1, XII, 1.1 a) and 1.3, printed pp. 240–241). *Needs:* `coherentAnalytification_faithful`;
`coherentOperations`; `completedAnalyticStalkComparison.coherentPullbackExact`.

### C0.5 The exchange map for higher direct images

Define `HigherImageComparison f F`. For a morphism `f : X → S` of schemes locally of finite type
over `ℂ`, the square formed by `φ_X`, `φ_S`, `f` and `f^an` commutes, and for every `O_X`-module `F`
there is a canonical morphism in the derived category of `O_{S^an}`-modules
`θ_{f,F} : φ_S^*(Rf_*F) → Rf^an_*(F^an)`, the adjoint of `F → Rφ_{X*}φ_X^*F` pushed forward along
`f`; on cohomology sheaves it gives `θ^q_{f,F} : (R^q f_*F)^an → R^q f^an_* F^an` whenever the left
side is defined as an analytification (for instance when `R^q f_*F` is coherent). The map is defined
for all `f`; properness is only used to prove it invertible, which is
`properSchemeGagaPushforward`. The API is `HigherImageComparison.degreeZero` (`θ⁰` is the
pullback–pushforward adjunction map), `HigherImageComparison.naturality` (a morphism of modules
gives commuting squares in every degree) and `HigherImageComparison.composition` (for composable
`f`, `g` the derived `θ` of `g ∘ f` is the composite of the exchange maps, compatibly with the Leray
edge maps) (SGA 1, XII, 4.1 and (4.1.1), printed pp. 247–248, for the degreewise maps `θ^q` and
their invertibility for proper `f` in Theorem 4.2, pp. 248–249; the derived form and the
composition law are the construction given here). *Needs:* `CoherentAnalytification`;
SchemeAndStackFoundations §2.1 `Sheaf.higherDirectImage`, §2.2 `leray_spectral_sequence`.

**Checks.**

- `HigherImageComparison.identity`: for `f = id`, `θ⁰` is the identity and all positive higher
  images vanish on both sides.
- `HigherImageComparison.twist`: for `P¹ → Spec ℂ` and `O(−2)`, `θ¹` sends the class of the inverse
  Laurent monomial `z₀⁻¹z₁⁻¹` in the algebraic Čech complex of the standard cover to the same class
  in the analytic Čech complex; a comparison built from arbitrary chosen isomorphisms in each degree
  would not be pinned by this.
- `HigherImageComparison.nonreducedPoint`: for `Spec ℂ[ε]/(ε²) → Spec ℂ`, `θ⁰` is the identity of the
  two-dimensional algebra and keeps `ε ≠ 0`.

### C0.6 Fibre-dimension loci

Define and prove `analyticSetGeometry` on reduced complex analytic spaces: local dimension,
finite decompositions of analytic germs into irreducible branches, the closed analytic singular
locus and dense open manifold regular locus. On Hausdorff second-countable spaces, construct the
locally finite global irreducible components, distinguishing them from branches at a point.
For each irreducible germ of dimension `d`, construct a finite projection of a sufficiently small
representative onto a polydisc in `ℂᵈ`, an analytic discriminant, and a constant positive sheet number
off that discriminant. Construct finite analytic normalization, its isomorphism over the regular
locus and its stalk description by integral closure in the total ring of fractions. Prove
compatibility with open restriction and invariance of local dimension under nilpotent reduction.
The finite-projection construction uses Weierstrass division; the regular-locus and normalization
constructions use the supplier's coherence APIs (Demailly, II §§4–7, pp. 90–115, especially II.4.7,
II.4.19, II.4.31, II.5.3 and II.7.9–7.15). *Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1
(`ComplexAnalyticSpace`, `convergentWeierstrassDivision`, `coherentStructure`).

**Checks.**

- A reduced point has dimension zero, is regular and is its own normalization; a nilpotent
  thickening of the point still has dimension zero.
- The node `xy = 0` has two branches at zero, singular locus `{0}`, and normalization the disjoint
  union of the two lines.
- The cusp `y² = x³` has one branch at zero and a nontrivial normalization
  `t ↦ (t²,t³)`; projection to `x` has two sheets away from zero.

Prove `fibreDimensionLoci` (Cartan–Remmert): for a holomorphic map `f : T → S` of finite-dimensional
complex analytic spaces and `k ≥ 0`, the set
`A_k = {x ∈ T : dim_x f⁻¹(f(x)) ≥ k}` is a closed analytic subset of `T` (with its reduced
structure). Properness is not assumed. Upper semicontinuity of the fibre dimension (Demailly,
II.8.2, p. 116) shows `A_k` is closed; analyticity is the stronger statement (Peterzil–Starchenko,
*Complex analytic geometry in a nonstandard setting*, Theorem 7.2 and Lemma 8.2, author PDF
pp. 21–23, where analyticity of `A_k` is quoted from Whitney, *Complex Analytic Varieties*,
Theorem 9F, p. 240, whose proof is the one relied on). Nilpotents do not change local fibre
dimensions. Only the `B_k` statement of `remmertProperImage` (C4.1) uses the analyticity; elsewhere
closedness suffices. *Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1
(`ComplexAnalyticSpace`, `ComplexAnalyticSpace.fibreProduct`); `analyticSetGeometry`.

### Examples

- On `ℂ`, multiplication by `z` on `O/(z²)` has kernel `zO/(z²)` and cokernel `O/(z)`, both coherent;
  the kernel is not free of rank one over `O`.
- For `f : ℂ² → ℂ`, `(z, w) ↦ zw`, every fibre has local dimension one, so `A₁ = ℂ²` and `A₂ = ∅`;
  for the blow-up of `ℂ²` at `0`, `A₁` is the exceptional curve and `A₀` is the whole source.
- The locally finite-type scheme `∐_{n≥0} Aⁿ_ℂ` analytifies to `∐_{n≥0} ℂⁿ`, with locally
  finite dimension and no uniform dimension bound.
- On `A¹`, the holomorphic endomorphism of `O_{A¹,an}` given by multiplication by `exp(z)` is not the
  analytification of an algebraic endomorphism: analytification is exact and faithful but not full
  on nonproper schemes.
- On `P¹`, the analytic dual of `O(1)^an` is `O(−1)^an` and the determinant of `O(1) ⊕ O` is `O(1)`.

### Dependencies

AlgebraicModuliForArithmeticGeometry, Layer 7, §§7.10.1 and 7.10.3; SchemeAndStackFoundations
Layer 2; Mathlib `JacobsonSpace`; TauCetiRoadmap.AlgebraicVectorBundles; Mathlib sheaves of modules and vector bundles; Tau
Ceti `FinitelyPresentedSheaf`.

<a id="c1"></a>

## Layer C1: Analytic coherent cohomology

This layer computes coherent analytic cohomology by analysis alone, so that it can serve as input
to GAGA and to Chow's theorem without circularity: no statement here uses algebraization. Its
outputs are Cartan's theorem B on strongly 1-complete spaces, Cartan–Serre finiteness on compact
spaces, the cohomology of analytic twisting sheaves on projective space in every degree, and
Serre's analytic generation, vanishing and finite twist presentations. Smooth forms on open subsets
of `ℂⁿ` use Mathlib's `ContDiff ℝ ∞` functions; `∂̄ = d''` is the `(0,1)`-part of the real
derivative, `∂f/∂z̄ⱼ = ½(∂f/∂xⱼ + i ∂f/∂yⱼ)`.

### C1.1 The local Dolbeault lemma

Prove `localDolbeault`. Let `Δ ⊆ ℂⁿ` be a polydisc, `p ≥ 0`, `q ≥ 1`, and `v` a smooth
`(p,q)`-form on `Δ` with `∂̄v = 0`. For every smaller concentric polydisc `Δ' ⋐ Δ` there is a
smooth `(p,q−1)`-form `u` on `Δ'` with `∂̄u = v` on `Δ'`. If the coefficients of `v` depend
holomorphically on parameters `t` in an open subset of `ℂᵐ` (jointly smooth in `(z,t)`), `u` can be
chosen with the same dependence. For `q = 0`, a smooth `(p,0)`-form with `∂̄v = 0` is a holomorphic
`p`-form. Consequently `(E^{p,•}, ∂̄)` is a fine resolution of the sheaf `Ω^p` of holomorphic
`p`-forms on any complex manifold. The proof solves `∂u/∂z̄ = g` in one variable by the
Cauchy–Green integral of `g` times a cutoff, differentiates under the integral sign for the
parameters, and removes the `dz̄ⱼ` components one variable at a time, shrinking the polydisc so the
cutoffs stay inside. The base case `n = 1`, `q = 1` is `localDolbeault_oneVariable`: for smooth
compactly supported `g`, the Cauchy–Green transform `cauchyGreen g (z) = π⁻¹ ∫ g(w)/(z − w) dλ(w)`
is smooth and `dbar (cauchyGreen g) = g`, where `dbar f = ½(∂f/∂x + i ∂f/∂y)` (Demailly, I.3.29,
p. 28, for the statement, whose proof there uses the Bochner–Martinelli kernel instead; I.3.2–3.4,
p. 21, for the one-variable Cauchy–Green solution; Exercise I.8.5, p. 61, for the proof one
variable at a time; Serre, *Faisceaux analytiques sur l'espace projectif*, Séminaire Henri Cartan 6
(1953–54), exposé 18, §1, nos. 1–3, pp. 18-1–18-4, for the parameter version). *Needs:* Mathlib `ContDiff`, `fderiv`, Lebesgue integration on `ℂ`;
TauCetiRoadmap.DifferentialGeometry (forms on manifolds, Layers 0–1).

The one-variable definitions have a separate elementary API. For real-differentiable `f` and
`g`, `dbar.add` and `dbar.smul` give complex linearity, `dbar.mul` gives
`dbar(fg) = f dbar(g) + g dbar(f)`, and `dbar.eq_zero_iff` identifies vanishing with complex
differentiability at the point. The hypothesis of real differentiability is essential, since
Mathlib's total `fderiv` is zero at a point where its derivative does not exist. For the Cauchy–Green
transform of compactly supported smooth functions, prove `cauchyGreen.add`, `cauchyGreen.smul`
and `localDolbeault_oneVariable`; the integral is absolutely
integrable because `1/|z-w|` is locally integrable on the real two-dimensional plane.
These formulas use the Cauchy–Green locators above.

**Checks for `dbar`.**

- A constant has `dbar = 0`.
- For the coordinate `f(z) = z`, `dbar f = 0`; this agrees with complex differentiability.
- For `f(z) = z̄`, `dbar f = 1`, fixing the factor `1/2` and the sign of `i`.

**Checks for `cauchyGreen`.**

- The zero function has zero transform.
- If `g` is smooth, radial and compactly supported, `cauchyGreen g 0 = 0` by the angular integral;
  an incorrectly oriented kernel would still have to pass the next test.
- If such a radial `g` equals `1` near zero, `dbar (cauchyGreen g) 0 = 1`; a missing factor
  `1/π` or the kernel `1/(w-z)` fails this normalization.

### C1.2 The Hodge star, formal adjoints and the Kähler identities

Define `HodgeStar` on an oriented Riemannian real manifold `M` of dimension `m`: on each fibre of the
exterior powers of the cotangent bundle (DifferentialGeometry's forms) the unique linear map
`* : Λʳ → Λ^{m−r}` with `α ∧ *β = ⟨α, β⟩ vol` for real forms, where `vol` is the oriented Riemannian
volume form; on complex forms extend `*` complex-linearly, so that `α ∧ *β̄ = ⟨α, β⟩ vol` with the
Hermitian pairing `⟨α, β⟩` antilinear in `β`. It is smooth in local orthonormal frames. The API is
`HodgeStar.wedge_identity` (`α ∧ *β̄ = ⟨α, β⟩ vol`), `HodgeStar.square` (`** = (−1)^{r(m−r)}` on
`r`-forms) and `HodgeStar.isometry` (`*` preserves the pointwise norm and exchanges complementary
degrees) (Demailly, VI.3.1–3.9, pp. 291–293). *Needs:* TauCetiRoadmap.DifferentialGeometry (forms,
wedge, orientations and Riemannian metrics, Layers 0–2 and 12).

**Checks.**

- `HodgeStar.dimensionZero`: on the positively oriented point (`m = 0`), `*` is the identity of
  `Λ⁰`; on the negatively oriented point, `* = −id`. The corresponding volume forms are
  `+1` and `−1`, as in Mathlib's `Orientation.volumeForm_zero_pos` and
  `Orientation.volumeForm_zero_neg`; the defining wedge identity determines `*1`.
- `HodgeStar.euclideanPlane`: on `ℝ²` with `dx ∧ dy` positive, `*dx = dy`, `*dy = −dx`, `*1 = dx ∧ dy`;
  the opposite orientation flips all three signs.
- `HodgeStar.complexLinearity`: `*(iα) = i(*α)`; putting the conjugation into `*` instead of into the
  pairing makes `*` antilinear and fails this.

Define `HodgeLaplacian` on an oriented Riemannian manifold of dimension `m`: the codifferential on
`r`-forms `δ = (−1)^{m(r+1)+1} * d *` and `Δ = dδ + δd`. On compactly supported forms `δ` is the
formal `L²` adjoint of `d`, so on a compact manifold without boundary
`⟨Δα, α⟩ = ‖dα‖² + ‖δα‖² ≥ 0`. On functions `Δ = −laplaceBeltrami` of DifferentialGeometry (whose
convention is `div ∘ grad`, as is Mathlib's `Δ`; `hodgeLaplacianFun f = −Δ f` records the sign). The API is `HodgeLaplacian.formalAdjoint` (`⟨dα, β⟩ = ⟨α, δβ⟩` for
compactly supported `α`, `β`, by Stokes and the wedge identity), `HodgeLaplacian.energy` (the
displayed identity on a compact manifold without boundary) and `HodgeLaplacian.commute_d`
(`Δd = dΔ` and `Δδ = δΔ`, immediate from `d² = 0` and `δ² = 0`) (Demailly, VI.1.5, p. 288, for
formal adjoints; VI.3.9–3.14, pp. 292–294; the energy identity follows (3.15), p. 295).
*Needs:* `HodgeStar`; TauCetiRoadmap.DifferentialGeometry (Stokes, Layer 5; `laplaceBeltrami`,
Layer 12).

**Checks.**

- `HodgeLaplacian.constant`: `Δ` of a constant function is `0`.
- `HodgeLaplacian.euclideanSign`: in `ℝ³`, `Δ(x₁²) = −2`; with the `div ∘ grad` sign it would be
  `+2`.
- `HodgeLaplacian.starSign`: in real dimension `2` on `1`-forms, the formula gives `δ = −*d*`; a degree
  shift in the sign exponent gives `+*d*` and fails the formal-adjoint identity.

Prove `kaehlerIdentities`. A Kähler manifold is a complex manifold with a Hermitian metric whose
fundamental `(1,1)`-form `ω` is closed. On a Kähler manifold, with `L = ω ∧ ·` and `Λ` its pointwise adjoint,
`[Λ, ∂̄] = −i ∂*` and `[Λ, ∂] = i ∂̄*`; consequently `Δ_d = 2Δ_∂ = 2Δ_∂̄` with the nonnegative sign
convention, and `Δ_d` preserves bidegree. On a Hermitian manifold that is not Kähler the identities
acquire torsion terms and are not asserted. The commutators are computed in flat coordinates at a
point, and Kähler normal coordinates (the metric agrees with the flat one to first order) transfer
them to the manifold (Demailly, VI.6.1–6.7, pp. 304–306, and VI.6.8–6.9, pp. 306–307).
*Needs:* `HodgeStar`; `HodgeLaplacian`.

For the Euclidean specialization `hodgeLaplacianFun`, prove complexification compatibility with
the function part of `HodgeLaplacian`, linearity on twice differentiable real functions and the
coordinate-square formula `hodgeLaplacianFun (xᵢ²) = −2`. Its API uses `Laplacian.laplacian`
with the negative sign specified in C1.2, rather than a second construction of a Laplacian.

**Checks for `hodgeLaplacianFun`.**

- Constants have value zero.
- On `ℝ³`, the value on `x₁²` is `−2`.
- On a zero-dimensional Euclidean space every function is constant and the operator is zero.

### C1.3 Hermitian bundles, the Chern connection and the Bochner–Kodaira identity

Define `ChernConnection E h` for a holomorphic vector bundle `E` of finite rank over a complex
manifold `M` (C0.3) with a smooth Hermitian metric `h`: the unique connection
`D = D' + D''` on the smooth sections of `E` that is compatible with `h` and whose `(0,1)`-part is
the `∂̄`-operator of the holomorphic structure. Its curvature `Θ(E) = D²` is an
`End(E)`-valued `(1,1)`-form, and `i Θ(E)` is Hermitian. In a holomorphic frame with Hermitian
matrix `H` for the conjugate-first metric `h(s,t) = s* H t`, `D = d + H⁻¹ ∂H`, `Θ = ∂̄(H⁻¹ ∂H)`. The API is `ChernConnection.dbar_part`
(`D'' = ∂̄_E`), `ChernConnection.metric` (`d h(s,t) = h(Ds,t) + h(s,Dt)`) and
`ChernConnection.curvature_type` (`Θ(E)` has type `(1,1)`) (Demailly, V.10.3, p. 267, and
V.12.1–12.2, pp. 268–269; normal frames V.12.10, p. 270). DifferentialGeometry's connections are
real and Riemannian; this construction adds the Hermitian holomorphic case. *Needs:*
`holomorphicBundleDictionary`; TauCetiRoadmap.DifferentialGeometry (forms, Layers 0–1).

**Checks.**

- `ChernConnection.trivialFlat`: the trivial line bundle with the constant metric `|s|²` has
  `D = d` and `Θ = 0`.
- `ChernConnection.lineBundleCurvature`: for a line bundle with local metric `e^{−φ}`,
  `Θ = ∂∂̄φ`, so `iΘ = i∂∂̄φ`; for `φ = |z|²` on `ℂ` this is `i dz ∧ dz̄`, a positive form (sign check).
- `ChernConnection.notLeviCivita`: on `ℂ` with a nonconstant conformal metric the Chern connection of
  the holomorphic tangent bundle differs from the flat connection `d`; a definition that ignored
  `h` would give `Θ = 0`.

Prove `bochnerKodaira`. Let `(M, ω)` be a Kähler manifold, `E` a Hermitian holomorphic vector
bundle with Chern connection `D = D' + D''`, `L = ω ∧ ·` and `Λ` its adjoint. Then
`Δ'' = Δ' + [iΘ(E), Λ]` on smooth `E`-valued forms, and for compactly supported `u`
`‖D''u‖² + ‖D''*u‖² = ‖D'u‖² + ‖D'*u‖² + ⟨[iΘ(E), Λ]u, u⟩`. The torsion terms of a general Hermitian
metric vanish because `ω` is Kähler. The identity is computed at a point in a normal holomorphic
frame (Demailly, VII.1.1–1.3 and proofs, pp. 329–331, with normal frames from V.12.10, p. 270,
the Hermitian commutation relations VI.6.8 and graded Jacobi VI.5.7). *Needs:* `ChernConnection`;
`kaehlerIdentities`; `localDolbeault`.

### C1.4 The weighted L² estimate

Prove `weightedDolbeaultEstimate`. Let `(M, ω)` be a complete Kähler manifold, `E` a Hermitian
holomorphic bundle, `p, q` with `q ≥ 1`, and suppose the curvature operator
`A = [iΘ(E), Λ]` is positive semidefinite on `(p,q)`-forms. For every `L²` form `g` of bidegree
`(p,q)` with `D''g = 0` and `∫ ⟨A⁻¹g, g⟩ dV < ∞` (the inverse being taken on the range of `A`;
the integral is infinite if `g` leaves it) there is `u` with `D''u = g` and
`‖u‖² ≤ ∫ ⟨A⁻¹g, g⟩ dV`; the solution orthogonal to `ker D''` is unique, and smooth when `g` is.
For the weighted scalar `(0,q)` specialization on a domain of `ℂⁿ`, identify scalar
`(0,q)`-forms with `(n,q)`-forms valued in `K_M⁻¹`, and weight that bundle by `e^{−φ}` for a
smooth strictly plurisubharmonic `φ`. Retain a complete Kähler metric and the displayed curvature
and integrability hypotheses; the induced metric on `K_M⁻¹` also contributes curvature. The proof
uses the Bochner–Kodaira identity, completeness to make the
operator domains agree (cutoffs and Friedrichs mollification), and the Riesz representation of
`D''*v ↦ ⟨v, g⟩` (Demailly, VIII.1.2, pp. 364–365; VIII.3.2–3.3, pp. 368–369; VIII.4.5–4.8,
pp. 371–372). In the cutoff argument of VIII.2.4 (statement p. 366, proof p. 367) the cutoff is
decreasing, so the bound to use is `|ρ'| ≤ 2` (equivalently `−2 ≤ ρ' ≤ 0`), not a nonnegative
derivative. *Needs:* `bochnerKodaira`; `localDolbeault`.

### C1.5 Strongly 1-complete spaces and Cartan's theorem B

Define `SteinManifold M` for a complex manifold `M` by holomorphic convexity and local
separation by global holomorphic functions. For a compact `K`, its holomorphic hull is
`{x : ∀ f ∈ O(M), |f(x)| ≤ sup_K |f|}` (the empty hull is empty), and holomorphic convexity
means that this hull is compact. Local separation means that every `x` has a neighbourhood `V`
such that for each `y ∈ V ∖ {x}` some `f ∈ O(M)` has `f(y) ≠ f(x)`.
Supply hull monotonicity and restriction of separating witnesses to smaller neighbourhoods;
construct a smooth plurisubharmonic exhaustion from convexity and a smooth strictly
plurisubharmonic function from local separation, giving `StronglyOneComplete.ofStein`
(Demailly, I.6.6–6.8 and I.6.13–6.18, pp. 47–51). *Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1 `HolomorphicStructureSheaf`;
Mathlib compact sets.

**Checks.**

- `ℂⁿ`, including `n = 0`, is Stein: coordinates separate points and bound compact hulls.
- A polydisc with positive radii is Stein; its compact hull stays inside a smaller closed polydisc.
- `P¹` is holomorphically convex but not Stein: its global holomorphic functions are constant,
  so they do not locally separate points.

Define `StronglyOneComplete T` for a Hausdorff second-countable complex analytic space `T`: there is a smooth exhaustion
function `ψ : T → ℝ` (all sublevel sets relatively compact) that is strictly plurisubharmonic,
meaning that `T` is covered by local embeddings into opens `Ω ⊆ ℂᴺ` on which `ψ` extends to a smooth
function with positive definite complex Hessian. The API is
`StronglyOneComplete.closedSubspace` (a closed analytic subspace of a strongly 1-complete space is
strongly 1-complete, by restricting `ψ`), `StronglyOneComplete.prod` (products, with `ψ₁ + ψ₂`) and
`StronglyOneComplete.ofStein` (a Stein manifold is strongly 1-complete) (Demailly, I.6.13–6.18,
pp. 49–51, for manifolds; IX.2.1, IX.2.5 and IX.2.7, pp. 409–410, for analytic schemes).
*Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1 (`ComplexAnalyticSpace`, local embeddings);
`SteinManifold` for `StronglyOneComplete.ofStein`.

**Checks.**

- `StronglyOneComplete.polydisc`: a polydisc `∏ {|zᵢ| < rᵢ}` is strongly 1-complete with
  `ψ = |z|² − Σ log(rᵢ² − |zᵢ|²)`.
- `StronglyOneComplete.torusProduct`: `ℂᵃ × (ℂ*)ᵇ` is strongly 1-complete with
  `ψ = |z|² + |w|² + Σ (log|wⱼ|)²`; `|z|² + |w|²` alone is not an exhaustion near `wⱼ = 0`.
- `StronglyOneComplete.notCompact`: a compact space of positive dimension, such as `P¹`, is not
  strongly 1-complete (a strictly plurisubharmonic function has no interior maximum on a positive
  dimensional space); the point is.

Prove `StronglyOneComplete.completeKaehlerMetric` on manifolds. Given a smooth strictly
plurisubharmonic exhaustion `ψ`, shift it to be nonnegative, put `ω = i∂∂̄ψ` and
`ω̂ = ω + i∂∂̄(ψ²)`. Prove that `ω̂` is positive and closed and hence Kähler, and that it is
complete: `ω̂ ≥ ω + 2i∂ψ ∧ ∂̄ψ` bounds `|dψ|_{ω̂}` by one, so escape to infinity has infinite
length by the exhaustion criterion (Demailly, VIII.2.4, pp. 366–367, and VIII.5.2, p. 372).
*Needs:* `StronglyOneComplete`; DifferentialGeometry's metric, forms and length APIs.

**Checks.**

- On `ℂⁿ`, `ψ = |z|²` gives a metric dominating the complete Euclidean metric.
- On the unit disc, `ψ = −log(1 − |z|²)` gives infinite length to every escaping path,
  including a radial path approaching the boundary.
- In dimension zero the forms vanish and the resulting metric is complete; on a positive
  dimensional compact manifold no strictly plurisubharmonic exhaustion exists.

Prove `cartanTheoremB`: on a strongly 1-complete complex analytic space `T` (finite-dimensional,
Hausdorff, second countable, nilpotents allowed), `H^q(T, F) = 0` for every coherent analytic module `F` and
every `q ≥ 1`. In particular this holds on polydiscs, on `ℂᵃ × (ℂ*)ᵇ`, on their closed analytic
subspaces and on Stein manifolds. A finite open cover by itself proves nothing of the kind. The
vector-bundle case on a manifold first uses `StronglyOneComplete.completeKaehlerMetric` to
construct `ω̂`. Identify the `F`-valued `(0,q)` Dolbeault complex with the `(n,q)` complex valued
in `F ⊗ K_M⁻¹`, with induced metrics. Apply `weightedDolbeaultEstimate` to that twisted bundle
and `ω̂`, choosing a rapidly increasing bundle weight `χ ∘ ψ` to dominate its curvature and make
the given form integrable. The added curvature acts positively in bidegree `(n,q)` for `q ≥ 1`.
For coherent modules on analytic spaces resolve locally by free modules of an
ambient chart and pass along a countable exhaustion by sublevel sets with Runge-type approximation
(Demailly, IX.4.1, pp. 419–420; IX.4.10–4.11 with `q = 1`, p. 425; IX.4.12–4.13, pp. 426–428).
*Needs:* `StronglyOneComplete`; `StronglyOneComplete.completeKaehlerMetric`;
`weightedDolbeaultEstimate`; `coherentOperations`; `holomorphicBundleDictionary` and exterior
powers/duals for `K_M⁻¹`.

**Checks for the weighted Cartan-B application.**

- On `ℂ²` with `ω = iΣ dzⱼ ∧ dz̄ⱼ`, the trivial line with metric `e^{−|z|²}` has
  `[iΘ,Λ] = −id` on `(0,1)`-forms and `+id` on `(2,1)`-forms; the canonical twist fixes the degree.
- For `F = O_M`, the identification is `A^{0,q}(O_M) ≅ A^{n,q}(K_M⁻¹)` and preserves `∂̄`.
- On a polydisc, a sufficiently increasing weight makes any smooth closed form square integrable
  and dominates the twisted-bundle curvature on successive compact sublevels.

### C1.6 Montel, Schwartz and Cartan–Serre finiteness

Prove `montelTheorem`: for an open `Ω ⊆ ℂⁿ`, a sequence of holomorphic functions on `Ω` that is
uniformly bounded on every compact subset has a subsequence converging uniformly on compact
subsets, and the limit is holomorphic; equivalently, for `Ω' ⋐ Ω` the restriction map between the
Fréchet spaces of holomorphic functions is compact (Demailly, I.3.12, p. 23). It differs from Tau
Ceti's `TauCeti.montel` only in allowing several variables: Cauchy estimates on polydiscs give
equicontinuity on compacts and the Arzelà–Ascoli argument of the one-variable proof applies
unchanged. *Needs:* Tau Ceti `TauCeti.montel` (the one-variable case and its compactness
argument); Mathlib Arzelà–Ascoli, Cauchy estimates.

Prove `frechetOpenMapping`: every continuous complex-linear surjection between complete
metrizable Hausdorff locally convex complex vector spaces is open. No separability or normability
is assumed. Use Baire category and absorbing balanced neighbourhoods to obtain a neighbourhood
in the closure of each image, then successive approximation in a decreasing neighbourhood basis
to remove the closure (Demailly, IX.1.7–1.10, pp. 405–408, for the open-mapping input and its uses;
the Baire and approximation argument is part of this target). *Needs:* Mathlib Baire category,
complete uniform additive groups, locally convex spaces and continuous linear maps.

**Checks.**

- A surjection of complex Banach spaces recovers Mathlib's Banach open mapping theorem.
- The shift `(z₀,z₁,…) ↦ (z₁,z₂,…)` on `ℂ^ℕ` with its complete product topology is open;
  this topology is not normable.
- The continuous bijection from finitely supported sequences with the `ℓ¹` norm to the same
  space with the `ℓ²` norm is not open: completeness cannot be omitted.

Prove `schwartzFiniteness` (L. Schwartz): let `E`, `F` be Fréchet spaces, `g : E → F` a continuous
linear surjection and `h : E → F` a compact linear map. Then `g + h` has closed image of finite
codimension (Demailly, IX.1.8–1.9, pp. 406–407). Its special case for Banach spaces is
`schwartzFiniteness_banach`. *Needs:* `frechetOpenMapping`; Mathlib `IsCompactOperator`.

Prove `cartanSerreFiniteness`: for a compact Hausdorff second-countable complex analytic space `T` (nilpotents allowed) and a
coherent analytic module `F`, every `H^q(T, F)` is a finite-dimensional complex vector space, and
`H^q(T, F) = 0` for `q > dim T`. The sections of a coherent module on a distinguished chart carry a
Fréchet topology induced from a local presentation; construct this topology and its
independence of presentation using `frechetOpenMapping`; for finite covers `U'_α ⋐ U_α` by strongly
1-complete charts both Čech complexes compute `H^q` (Cartan B and SchemeAndStackFoundations §2.2), the refinement map is
compact by Montel and surjective on cohomology, and Schwartz's theorem gives finite dimension
(Demailly, IX.4.6–4.8 and proof, pp. 422–424; vanishing above the dimension IX.4.15, p. 428).
*Needs:* `montelTheorem`; `frechetOpenMapping`; `schwartzFiniteness`; `cartanTheoremB`; SchemeAndStackFoundations §2.2 `cech_to_cohomology`.

### C1.7 Projective charts and analytic twisting sheaves

Prove `projectiveLerayCover`: on the analytification of `Pʳ`, the standard affine charts
`Uᵢ = {Zᵢ ≠ 0}` and all their finite intersections (repeated indices allowed) are isomorphic to
`ℂᵃ × (ℂ*)ᵇ`, hence strongly 1-complete; so for every coherent analytic module on `Pʳ_an`, or on a
closed analytic subspace, the alternating Čech complex of this cover computes `Sheaf.H` in every
degree (Serre, exposé 18, §2, no. 5, Proposition 4 and its corollary, pp. 18-5–18-6, for the standard
cover; that the intersections are products of affine and punctured lines is read off the charts).
*Needs:* `cartanTheoremB`; SchemeAndStackFoundations §2.2 `cech_to_cohomology`; Mathlib
`cechComplexFunctor`, `Sheaf.H`.

Define `AnalyticTwist r k` for `r ≥ 0`, `k ∈ ℤ`: the invertible analytic module `O(k)` on `Pʳ_an`
whose sections over `V` are the holomorphic functions on the cone over `V` in `ℂ^{r+1} ∖ {0}` that
are homogeneous of degree `k`; equivalently, glued from `O_{Uᵢ}` with transition factor
`(Zⱼ/Zᵢ)ᵏ` from the frame on `Uᵢ` to the frame on `Uⱼ`. The API is
`AnalyticTwist.chartTransition` (the transition factor is `(Zⱼ/Zᵢ)ᵏ`), `AnalyticTwist.tensorIso`
(`O(k) ⊗ O(l) ≅ O(k + l)`) and `AnalyticTwist.analytificationIso` (the analytification of the
algebraic `O(k)` of AlgebraicModuliForArithmeticGeometry Layer 1 is `O(k)`, by the same homogeneous
frames) (Serre, exposé 18, §2, nos. 5–6, pp. 18-5–18-8; Serre, *GAGA*, n° 16, printed p. 24, for
the analytification of the algebraic twists). *Needs:* `coherentOperations`;
`CoherentAnalytification`.

**Checks.**

- `AnalyticTwist.zero`: `O(0) ≅ O`.
- `AnalyticTwist.degreeOneSections`: on `P¹_an`, `H⁰(O(1))` is two-dimensional with basis `Z₀, Z₁`.
  This fixes the direction of the transition factor: the reversed factor `(Zᵢ/Zⱼ)ᵏ` glues `O(−1)`,
  which has no nonzero global section, and a definition ignoring `k` gives the one-dimensional
  `H⁰(O)`. (The duality `O(k)^∨ ≅ O(−k)` does not detect the direction, since it also holds for
  the reversed convention.)
- `AnalyticTwist.hyperplaneSection`: `Zᵢ` is a global section of `O(1)` whose zero scheme is the
  reduced hyperplane `Zᵢ = 0`.

Prove `analyticTwistCohomology`: for `r ≥ 1` and `k ∈ ℤ`, `H^q(Pʳ_an, O(k)) = 0` unless `q = 0` or
`q = r`; `H⁰` has the basis of monomials of degree `k` (zero for `k < 0`), so
`h⁰ = binom(k + r, r)` for `k ≥ 0`; `H^r` has the basis of Laurent monomials `Z^a` with every
`aᵢ ≤ −1` and `Σ aᵢ = k` (zero for `k > −r − 1`), so `h^r = binom(−k − 1, r)` for `k ≤ −r − 1`.
For `r = 0`, `H⁰(P⁰, O(k)) = ℂ` and higher cohomology vanishes. The map from the algebraic Čech
complex (Laurent polynomials) to the analytic one (convergent Laurent series on the chart
intersections) is a quasi-isomorphism and identifies these bases, products and connecting maps. The
proof expands sections on the Čech intersections in convergent Laurent series and splits by the sign
pattern of the exponents: every pattern except "all nonnegative" and "all negative" gives an
acyclic piece (Serre, exposé 18, §2, no. 5, Proposition 4, pp. 18-5–18-7; no. 7, Proposition 7,
and Remarks 1–2 (Remark 2 is this Laurent-series method),
the hyperplane sequence and Remark 1, pp. 18-9–18-10). *Needs:* `AnalyticTwist`;
`projectiveLerayCover`; SchemeAndStackFoundations §2.6 `projectiveSpace_cohomology` (the
algebraic calculation).

### C1.8 Serre's analytic theorems on projective space

Prove `analyticSerreGeneration` (Serre's analytic theorem A): for a coherent analytic module `F` on
`Pʳ_an` (supported on any closed analytic subspace, nilpotents allowed) there is `k₀` such that for
every `k ≥ k₀` the twist `F(k)` is generated by finitely many global sections. The proof is a
joint induction on `r` with `analyticSerreVanishing`. By compactness it suffices to generate the
stalk at one point `x` for large `k`. Choose a hyperplane `H ∋ x` with equation `z₀`;
multiplication by `z₀` gives `0 → P → F(−1) → F → Q → 0` with `P` and `Q` coherent and supported on
`H ≅ P^{r−1}`. Vanishing on `H` for large twists makes `dim H¹(F(k))` (finite by Cartan–Serre)
nonincreasing, hence eventually constant, and then `H⁰(F(k)) → H⁰(Q(k))` is surjective; generation
of `Q(k)` on `H` and Nakayama at `x` give generation of `F(k)_x` (Serre, *Faisceaux analytiques sur
l'espace projectif (suite)*, Séminaire Henri Cartan 6 (1953–54), exposé 19, §3, no. 8,
pp. 19-1–19-4; the statement is exposé 18, no. 7, p. 18-8). It uses no algebraization. *Needs:*
`cartanSerreFiniteness`; `AnalyticTwist`; `coherentOperations`; `analyticSerreVanishing` on
`P^{r−1}` (the joint induction).

Prove `analyticSerreVanishing` (Serre's analytic theorem B): for `F` as above there is `k₁` with
`H^q(Pʳ_an, F(k)) = 0` for all `q ≥ 1` and `k ≥ k₁`; one `k₁` can be chosen for finitely many
modules at once. Generation gives `O(−a)ⁿ → F → 0`; descending induction on `q` from `q > r`
(vanishing above the dimension) with the coherent kernel and `analyticTwistCohomology` closes the
argument (Serre, exposé 19, §3, no. 9, pp. 19-4–19-5). *Needs:*
`analyticSerreGeneration`; `analyticTwistCohomology`.

Prove `twistPresentations`: every coherent analytic module `F` on `Pʳ_an` has an exact sequence
`O(−b)^m → O(−a)^n → F → 0` with finite `a, b, m, n`, and the construction iterates to any
prescribed finite length of a resolution by sums of twists. No global finite locally free
resolution is claimed on a singular or nonreduced support (Serre, exposé 19, §3, nos. 8–9,
pp. 19-1–19-5; Serre, *GAGA*, nos. 16–17, Lemma 8 and the finite presentation, printed pp. 24–27).
*Needs:* `analyticSerreGeneration`; `coherentOperations`.

### Examples

- On `C × C*` the structure sheaf has no positive-degree cohomology; a skyscraper `ℂ` at a point has
  `H⁰ = ℂ` and no higher cohomology.
- On `P¹`: `h⁰(O(2)) = 3`, `h¹(O(−2)) = 1` with generator the class of `(Z₀Z₁)⁻¹` on the overlap
  `ℂ*`, and `O(−1)` is acyclic in all degrees; `O(−2)(k) = O(k − 2)` is globally generated for
  `k ≥ 2` and has no higher cohomology for `k ≥ 1`, while `H¹(O(−2)) ≠ 0`.
- For the double point `2p ⊂ P¹`, `0 → O(−2) → O → O_{2p} → 0` is a twist presentation whose
  cokernel has length two (the reduced point would have length one); `H⁰(O_{2p}) = ℂ[ε]/(ε²)` has
  dimension two and there is no higher cohomology.
- The compact non-Hausdorff space obtained by gluing two copies of `P¹` along `P¹ ∖ {0}`
  has `H¹(O) ≅ O(ℂ)/ℂ`, which is infinite-dimensional: the two `P¹` charts have only constant
  global functions and their overlap has all entire functions. This excludes dropping
  Hausdorffness from Cartan–Serre finiteness.
- The weighted estimate needs completeness (or a separate boundary argument): it is not applied
  formally on an incomplete ball.

### Dependencies

C0; AlgebraicModuliForArithmeticGeometry §7.10.1 and Layer 1; SchemeAndStackFoundations Layer 2;
SchemeAndStackFoundations §2.2 `cech_to_cohomology`; Tau Ceti `TauCeti.montel`; TauCetiRoadmap.DifferentialGeometry (Layers 0–2, 5
and 12); Mathlib analysis
(smooth functions, integration, Arzelà–Ascoli, open mapping theorem).

<a id="c2"></a>

## Layer C2: Projective and proper consequences of coherent GAGA

Coherent GAGA for proper schemes — the isomorphism `θ` of C0.5 for proper morphisms, and the exact
equivalence `Coh(X) ≃ Coh(X^an)` for proper `X` with comparison of cohomology and Ext — is
`properSchemeGagaPushforward` and `properSchemeGagaEquivalence` of
AlgebraicModuliForArithmeticGeometry §7.10.3; the projective case is Serre's theorem, whose analytic
inputs are `analyticTwistCohomology`, `analyticSerreVanishing` and `twistPresentations` of C1. This
layer states the compatibilities and dictionaries that families and moduli problems use on top of
it.

### C2.1 Projection formula and base change

Prove `gagaBaseChange`. Let `f : X → S` be a proper morphism of schemes locally of finite type over
`ℂ` and `F` a coherent `O_X`-module. Then:

1. (projection) for a finite locally free `O_S`-module `E`, the comparison `θ_{f, F ⊗ f^*E}`
   corresponds to `θ_{f,F} ⊗ E^an` under the algebraic and analytic projection formulas;
2. (flat base change) for a flat morphism `g : S' → S` locally of finite type over `ℂ`, with
   `f' : X' = X ×_S S' → S'`, the comparison maps `θ_{f',g'^*F}` and `g^{an*}θ_{f,F}` agree under the
   algebraic flat base-change isomorphism and its analytic counterpart;
3. (derived base change) for an arbitrary `g : S' → S` such that `X` and `S'` are Tor-independent over
   `S`, the derived exchange maps are compatible in the same sense, for the complexes to which
   SchemeAndStackFoundations §2.18 `torIndependent_baseChange` applies.

An isomorphism `(R^q f_*F)|_{S'} ≅ R^q f'_*(F|_{X'})` in a single degree is asserted only under the
hypotheses of the algebraic cohomology-and-base-change theorem (flatness of `F` over `S` and the
surjectivity conditions of JacobianChallenge Layer C and StableReduction Layer 2), never for jumping
cohomology. All three statements are diagram chases on the derived exchange maps before taking
cohomology, using that finite locally free factors commute with pullback and pushforward (SGA 1,
Exposé XII, 4.1–4.2, printed pp. 247–249, for the exchange maps and their invertibility; the
compatibilities themselves are the diagram chases just described and are not stated there). *Needs:* `HigherImageComparison`;
AlgebraicModuliForArithmeticGeometry `properSchemeGagaPushforward`; SchemeAndStackFoundations
§2.18 `torIndependent_baseChange`; TauCetiRoadmap.JacobianChallenge (Layer C);
TauCetiRoadmap.StableReduction (Layer 2).

### C2.2 Ideals, sections and bundles

Prove `projectiveGeometricDictionaries`. Let `X` be a proper scheme over `ℂ` (in particular a
projective one), nilpotents allowed. Then:

1. every coherent ideal of `O_{X^an}` is `I^an` for a unique coherent ideal `I ⊆ O_X`, so closed
   analytic subspaces of `X^an` are exactly the analytifications of closed subschemes of `X`, with
   their nilpotent structure;
2. global sections, morphisms of coherent modules, invertible modules and finite locally free
   modules correspond under analytification, and the Picard groups agree;
3. a coherent module `F` is finite locally free if and only if `F^an` is, and the dual and
   determinant agree with those of `coherentPullbackOperations`.

For (1) algebraize the ideal as a coherent submodule of `O_X` and its inclusion by full faithfulness;
the ideal property and the quotient are checked by faithfulness. For (3) use that finite projectivity
descends along the faithfully flat local maps of C0 (SGA 1, XII, Corollary 4.3, Theorem 4.4 and
Corollary 4.5, printed pp. 249–251, for (1) and (2); the descent argument for (3) is the one just
given).
*Needs:* AlgebraicModuliForArithmeticGeometry `properSchemeGagaEquivalence`;
`CoherentAnalyticIdeal`; `coherentAnalytification_faithful`; `coherentPullbackOperations`;
`holomorphicBundleDictionary`.

### Examples

- For `P¹ × S → S` and `O(−2)`, `R¹f_*O(−2) ≅ O_S` and the comparison commutes with flat base change
  and with tensoring by a line bundle on `S`.
- The doubled hyperplane `(Z₀²) ⊂ Pʳ` and its quotient algebraize together, with the square ideal;
  algebraizing only the reduced support fails.
- On `P¹` the analytic `O(1)` has algebraic dual `O(−1)` and `O(1) ⊗ O(−1) ≅ O`.
- For `S = A¹` and `X = P¹ × S`, the comparison holds for algebraic coefficients; the analytic
  function `exp(s)` on `S^an` is not thereby algebraic: nothing here algebraizes analytic data over a
  nonproper base.

### Dependencies

C0, C1; AlgebraicModuliForArithmeticGeometry §7.10.3; SchemeAndStackFoundations Layer 2;
TauCetiRoadmap.JacobianChallenge (Layer C); TauCetiRoadmap.StableReduction (Layer 2).

<a id="c3"></a>

## Layer C3: Algebraic spaces — analytic descent and derived GAGA

The abelian GAGA theorem for proper algebraic spaces is `properSpaceComplexGaga` of
AlgebraicModuliForArithmeticGeometry §7.10.3, proved by Chow modification and support induction.
This layer supplies coherent analytification on algebraic spaces through étale descent, the
quasi-coherator on the quasi-coherent derived category `spaceDQCoh` of
AlgebraicModuliForArithmeticGeometry §7.7, and Hall's derived GAGA, which upgrades the abelian
equivalence to bounded coherent derived categories without a projective reduction.

### C3.1 Coherent analytification on algebraic spaces

Prove `analyticEtaleDescent`. Let `X` be a locally separated algebraic space of finite type over `ℂ`,
`U → X` an étale presentation by a scheme, `R = U ×_X U`. Then `U^an → X^an` (from
`complexSpaceAnalytification`) is a surjective local biholomorphism with
`R^an ≅ U^an ×_{X^an} U^an`, and pullback identifies coherent analytic modules on `X^an` with
coherent analytic modules on `U^an` equipped with effective descent data along `R^an ⇉ U^an`.
Defining `F^an` for a coherent `O_X`-module `F` as the descent of `(F|_U)^an` with the analytified
descent datum gives a functor `SpaceCoherentAnalytification X`, independent of the presentation up
to canonical isomorphism, extending `CoherentAnalytification` on schemes, exact and faithful, and
compatible with the algebraic étale descent of AlgebraicModuliForArithmeticGeometry Layer 3 and
SchemeAndStackFoundations Layer 1. The charts `U` need not be proper and no GAGA statement is made about
them (Hall, *GAGA theorems*, Example 9.8, pp. 23–24, for the analytification of locally separated
algebraic spaces, under which étale morphisms become local isomorphisms; SGA 1, XII, §1, printed
pp. 239–242, and §3, 3.1 (iii), 3.2 (i) and Remark 3.3 a), printed pp. 244–247, for étale and
surjective morphisms of schemes; the effective descent of coherent modules along the surjective
local biholomorphism `U^an → X^an` is sheaf gluing on the analytic side and is proved here). *Needs:* AlgebraicModuliForArithmeticGeometry `complexSpaceAnalytification`;
`CoherentAnalytification`; `coherentAnalytification_faithful`; SchemeAndStackFoundations Layer 1;
AlgebraicModuliForArithmeticGeometry Layer 3.

**Checks.**

- `SpaceCoherentAnalytification.scheme`: for a scheme `X` with the identity presentation the functor is
  `CoherentAnalytification X`, including on the dual-number point, where `(O_X)^an = ℂ[ε]/(ε²)`.
- `SpaceCoherentAnalytification.twoCharts`: for the presentation `U ⊔ U → X` by two copies of the same
  chart, the restriction of the descended module to either copy of `U^an` is `(F|_U)^an`;
  the descent isomorphism identifies the two pullbacks rather than doubling the module.
  For `z ↦ z² : G_m → G_m` and `F = O/(t−1)`, the descended support is `{t=1}` on the base,
  while its pullback to either chart has support `{z=±1}`.
- `SpaceCoherentAnalytification.doubledOrigin`: on the affine line with doubled origin (a locally
  separated, non-separated algebraic space) the structure sheaf analytifies to the structure sheaf of
  the non-Hausdorff analytic space; the construction does not require separatedness.

### C3.2 The quasi-coherator of an algebraic space

The quasi-coherent derived category of an algebraic space `X` is `spaceDQCoh X` of
AlgebraicModuliForArithmeticGeometry §7.7: the full subcategory of Mathlib's derived category
`D(X_ét, O_X)` of `O_X`-modules on the ringed small étale site of SchemeAndStackFoundations Layer 1
whose cohomology sheaves are quasi-coherent, with its perfect objects `spacePerfect X`, its derived
pullback, pushforward and tensor product, and its comparison `spaceDQCoh.schemeEtaleEquivalence`
with SchemeAndStackFoundations §2.18 `DQCoh` for schemes. This layer uses that category and its API
as stated there and adds the quasi-coherator.

Define `spaceQuasiCoherator X` for a quasi-compact quasi-separated algebraic space `X`: the right
adjoint `RQ_X : D(X_ét, O_X) → spaceDQCoh X` of the inclusion, with `M → RQ_X M` an isomorphism for
`M` in `spaceDQCoh X`. For a morphism of ringed topoi `c : 𝔛 → X_ét`, `Rc_{qc,*} = RQ_X ∘ Rc_*` is
right adjoint to `Lc^*` restricted to `spaceDQCoh X`, and the projection morphism
`M ⊗ᴸ Rc_{qc,*}N → Rc_{qc,*}(Lc^*M ⊗ᴸ N)` is an isomorphism for `M` in `spacePerfect X` (Hall, §4,
the quasi-coherator and Lemma 4.3, pp. 10–11). The API is `spaceQuasiCoherator.adjunction` (the
right adjoint `RQ_X`), `spaceQuasiCoherator.unit_iso` (`M ≅ RQ_X M` on `spaceDQCoh X`) and
`spaceQuasiCoherator.projection_perfect` (the projection isomorphism for perfect `M`). *Needs:*
AlgebraicModuliForArithmeticGeometry §7.7 `spaceDQCoh`, `spacePerfect`,
`spaceDQCoh.schemeEtaleEquivalence`, `spaceDQCoh.tensor`; SchemeAndStackFoundations Layer 1
(algebraic spaces and étale sites) and §2.18 `DQCoh`, §2.18 `perfect_generator`; Mathlib
`DerivedCategory`.

**Checks.**

- `spaceQuasiCoherator.affine`: for `X = Spec A` an affine scheme, `RQ_X K` is the quasi-coherent
  complex of `RΓ(X_ét, K) ∈ D(A)` (the adjunction of `O_X ⊗ᴸ_A −` with `RΓ(X_ét, −)`), so through
  `spaceDQCoh.schemeEtaleEquivalence` and Layer 2's affine equivalence `spaceDQCoh X ≃ D(A)` it is
  the identity on `spaceDQCoh X` (Stacks, Tag 08D9, on the Zariski site).
- `spaceQuasiCoherator.zero`: for the empty space, `spaceDQCoh X` is the zero category and
  `RQ_X = 0`.
- `spaceQuasiCoherator.extensionByZero`: for `X = Spec A`, `A` a DVR with generic point `η`, the
  extension by zero `j_!O_η` of the structure sheaf of the open point `j : {η} → X` is not
  quasi-coherent (its global sections vanish, since a nonzero section over `{η}` does not have
  closed support in `X`, while its restriction to `{η}` is `O_η ≠ 0`), so the counit
  `RQ_X(j_!O_η) → j_!O_η` is not an isomorphism; a quasi-coherator equal to the identity of
  `D(X_ét, O_X)` would make it one.

Prove `pseudoCoherenceDetection`. Let `A` be a ring and `X → Spec A` a quasi-compact, separated,
pseudo-coherent morphism of algebraic spaces. A complex `M` in `spaceDQCoh X` is pseudo-coherent (étale
locally quasi-isomorphic to a bounded-above complex of finite free modules), respectively
pseudo-coherent and bounded, as soon as `RHom(P, M) ∈ D(A)` is pseudo-coherent (and bounded) for
every `P` in `spacePerfect X`. Consequently, for `c : 𝔛 → X_ét` such that `RΓ(𝔛, −)` sends bounded
pseudo-coherent complexes to bounded pseudo-coherent `A`-complexes, `Rc_{qc,*}` preserves bounded
pseudo-coherent complexes (Hall, Theorem 3.8, p. 8, and Proposition 4.1, p. 10). *Needs:*
`spaceQuasiCoherator`; AlgebraicModuliForArithmeticGeometry §7.7 `spaceDQCoh`, `spacePerfect`;
SchemeAndStackFoundations §2.18 `perfect_generator`.

### C3.3 Derived GAGA for proper algebraic spaces

Prove `derivedGagaProperSpace`. Let `X` be a proper algebraic space of finite type over `ℂ`, nilpotents
allowed, and `c : X^an → X_ét` the morphism of ringed topoi given by the étale charts of
`complexSpaceAnalytification`. Then `Lc^* : D^b_coh(X) → D^b_coh(X^an)` is a t-exact equivalence of
triangulated categories. On hearts it is the coherent analytification of C3.1, so it recovers the
abelian equivalence and the cohomology comparison of `properSpaceComplexGaga`, and on a proper scheme
it agrees with `properSchemeGagaEquivalence`. The proof checks the hypotheses of Hall's
Tor-independent GAGA theorem (Theorem 9.1) with the family of closed points: `RΓ(X^an, −)` has finite-dimensional
cohomology on bounded coherent complexes (`cartanSerreFiniteness`); `c` is flat and Tor-independent
of each closed point (`completedAnalyticStalkComparison.flat`); at a closed point the residue fields
agree and pullback is an equivalence on the residue-field modules (`completionIso`); `O_X` is
coherent (and `O_{X^an}` is coherent by Oka's theorem, `ComplexAnalyticSpace.coherentStructure`); and
the residue fields of the closed points form a pseudo-conservative family on both sides (Nakayama on
top cohomology and the Jacobson property). Full faithfulness and essential surjectivity then follow
from the adjunction of C3.2 (Hall, Theorem 9.1 and the proof of Theorem A, pp. 20–21; Lemma 5.5,
p. 12; Examples 7.1–7.2, p. 18, and Lemma 7.4, p. 19, for pseudo-conservative families). *Needs:* `spaceQuasiCoherator`;
`pseudoCoherenceDetection`; `analyticEtaleDescent`; `cartanSerreFiniteness`;
AlgebraicModuliForArithmeticGeometry `completedAnalyticStalkComparison`, `properSpaceComplexGaga`.

### Examples

- For the degree-two étale map `G_m → G_m`, `z ↦ z²`, coherent descent along the analytified chart
  uses the deck cocycle on `(G_m ×_{G_m} G_m)^an`; both charts are nonproper and no GAGA statement is
  applied to them.
- For a proper scheme viewed as an algebraic space, `derivedGagaProperSpace` restricts on hearts to the
  scheme GAGA functor; for the doubled closed point `Spec ℂ[ε]/(ε²)`, the residue-field test detects the
  nonzero nilpotent module `ε·ℂ[ε]/(ε²)`.
- An étale chart of a proper algebraic space need not be proper; nothing in this layer applies
  absolute GAGA to it.

### Dependencies

C0, C1; AlgebraicModuliForArithmeticGeometry Layer 3, §7.7 and §7.10.3; SchemeAndStackFoundations
Layer 1 and Layer 2; Mathlib derived categories.

<a id="c4"></a>

## Layer C4: Analytic images, Chow algebraization and morphism comparison

This layer proves the classical image theorems of complex analytic geometry and uses them, with
coherent GAGA, to algebraize closed analytic subspaces of projective space (keeping nilpotents),
coherent modules with proper support, and holomorphic maps out of proper schemes. It ends with the
comparison of algebraic and analytic connectedness for smooth affine curves. Borel's algebraicity of
maps from nonproper sources into arithmetic quotients and definable Chow are not consequences of
anything here.

### C4.1 Remmert's theorems

Prove `remmertProperImage`: for a proper holomorphic map `f : T → S` of finite-dimensional complex
analytic spaces and a closed analytic subset `A ⊆ T`, the image `f(A)` is a closed analytic subset of
`S` (with its reduced structure); properness of `f|_A` suffices. Nilpotent structure on images is
handled separately through coherent ideals. In particular, for proper `f` the sets
`B_k = {s ∈ S : dim f⁻¹(s) ≥ k} = f(A_k)` are closed analytic, by `fibreDimensionLoci`. The proof is
the simultaneous induction on dimension with `remmertSteinExtension`: away from a lower-dimensional
critical image the image is described by finite projections and symmetric functions of the sheets,
and the extension theorem fills in the critical image; closedness is topological properness
(Demailly, II.8.8 with the simultaneous proof of II.8.7, pp. 118–121, using the semicontinuity
results II.8.2–8.6, pp. 116–118). *Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1
(`ComplexAnalyticSpace`, `convergentWeierstrassPreparation`, `coherentStructure`);
`analyticSetGeometry`; `fibreDimensionLoci` for the `B_k` statement.

Prove `remmertSteinExtension`: let `T` be a complex analytic space, `E ⊆ T` a closed analytic subset
of dimension at most `p`, and `Z` an analytic subset of `T ∖ E` with `dim_x Z > p` at every
`x ∈ Z`. Then the closure of `Z` in `T` is analytic (Demailly, II.8.7 and the simultaneous proof,
pp. 118–121). The strict inequality cannot be weakened: a sequence of points converging to a point
of a zero-dimensional `E` has non-analytic closure (see the Examples). *Needs:* `remmertProperImage` (in the simultaneous
induction); `analyticSetGeometry`; `convergentWeierstrassPreparation`.

### C4.2 Chow's theorem with nilpotents

Prove `projectiveChowNonreduced`: every closed analytic subspace `Z ⊆ Pʳ_an` defined by a coherent
ideal `I`, radical or not, is `W^an` for a unique closed subscheme `W ⊆ Pʳ`, and `I = I_W^an`. For
reduced `Z` this is Chow's theorem. The proof generates `I(k)` for large `k` by finitely many global
sections (`analyticSerreGeneration`), identifies them with homogeneous polynomials
(`analyticTwistCohomology` in degree `0`), and algebraizes the inclusion and the quotient, keeping every
nilpotent order; the reduced statement can also be read off from `remmertSteinExtension` applied to
the cone in `ℂ^{r+1}` (Serre, exposé 19, §4, no. 10, Propositions 8–9 and the corollary,
pp. 19-5–19-7; Demailly, II.8.10,
p. 121). It says nothing about closed analytic subsets of `Aⁿ`. *Needs:* `analyticSerreGeneration`;
`analyticTwistCohomology`; `projectiveGeometricDictionaries`; `remmertSteinExtension`.

### C4.3a Scheme compactification objects

The carrier and category here, together with §§C4.3b–C4.3c's existence and refinement API,
are the shared scheme compactification package in `TauCeti.AlgebraicGeometry`. Coherent and
étale proper-support functors use this package with their own coefficient categories.

**Scheme compactification objects — `Compactification`, `DenseCompactification`.**
For a separated finite-type morphism `f : X → S` with `S` qcqs, a `Compactification f`
contains a scheme `Xbar`, a quasi-compact open immersion `j : X → Xbar`, a proper
`p : Xbar → S`, and `j ≫ p = f`. A morphism `Compactification.Hom C D` is a scheme map
`h : C.Xbar → D.Xbar` satisfying `C.j ≫ h = D.j` and `h ≫ D.p = C.p`; identities and
composition give the compactification category. `DenseCompactification f` is its full
subcategory where `j` is schematically dense, expressed by Mathlib's
`IsSchemeTheoreticallyDominant j`. For a quasi-compact open immersion this also implies
topological density. The factorization carrier makes sense for any `f`; the existence
theorems below use the separated finite-type/qcqs hypotheses.

Supply transport along isomorphisms of the source, base and factorization, products over `S`,
restriction over base opens, and `Compactification.baseChange` along any `S' → S`.
`Compactification.denseReplacement` replaces `Xbar` by the schematic closure of `j(X)`,
with `Compactification.denseReplacementMap` as its canonical map to the original
compactification. Prove this is functorial and retains
the original open subscheme, including its nilpotents. Under arbitrary base change supply the
canonical map from the dense replacement after base change to the base change of the dense
replacement; it is an isomorphism for flat base change. Density of the pulled-back `j` is
asserted for flat base change. For arbitrary base change take dense replacement again.
These comparisons satisfy the identity and composition laws. `Compactification.identity`
is the dense identity choice when `f` is proper.

*Source:* Stacks, §38.32 (*Compactifications*), §29.7 (*Scheme theoretic closure and density*),
and §29.6 (*Scheme theoretic image*); the flat density API is also Mathlib's
`IsSchemeTheoreticallyDominant.of_isPullback`.
*Needs:* SchemeAndStackFoundations Layer 0 (scheme gluing and schematic images);
Mathlib `Scheme`, `Over`, pullbacks, `IsOpenImmersion`, `QuasiCompact`, `IsProper` and
`IsSchemeTheoreticallyDominant` with their isomorphism/composition/base-change APIs.

**Checks.**

- A proper `f` has `Xbar = X`, `j = id`, `p = f` as its identity compactification.
- `A¹_k ⊂ P¹_k` is a dense compactification with the single boundary point `∞`.
- For `Spec k[t,ε]/(ε²)` inside `P¹_{k[ε]/(ε²)}`, schematic closure keeps the square-zero
  structure. Taking the reduced closure would change the open subscheme.
- `D(t) ⊂ Spec k[t]` is schematically dense, but after base change to `t = 0` its interior
  is empty inside a point; the dense replacement there is empty.

### C4.3b Nagata compactification over a qcqs base

**Nagata compactification over a qcqs base — `nagataCompactification`.**
For every qcqs scheme `S` and separated finite-type `f : X → S`, construct a
`Compactification f`; applying `Compactification.denseReplacement` gives a
`DenseCompactification f`. The Lean existence theorem states `Nonempty (DenseCompactification f)`.
No Noetherian, field, finite-presentation or complex-base hypothesis is added to this theorem.

Build the geometric steps of the Noetherian proof: extension and composition of admissible
blowups over quasi-compact opens, their strict transforms, separation of closures of disjoint
constructible closed subsets by an admissible blowup, and gluing across a dense common open
after blowups. Establish enlargement of a compactified dense open and the two-open
compactifiability step. A finite affine cover with dense total intersection reduces existence
to affine embeddings and schematic closures in projective space. For a qcqs base, first
embed `X` as a closed subscheme of a separated finitely presented `X' → S`, descend `X'`
and separatedness through a Noetherian approximation of `S`, compactify at that stage, and
pull back. The schematic closure of `X` then supplies the compactification of the original
finite-type morphism; finite type must not be replaced by finite presentation.

*Source:* Stacks, §38.33, Lemmas 38.33.1–38.33.7 and Theorem 38.33.8
([0F41](https://stacks.math.columbia.edu/tag/0F41)); the reduction uses Limits,
Propositions 32.9.6 and 32.5.4, Lemmas 32.10.1 and 32.8.6.
*Needs:* §C4.3a; SchemeAndStackFoundations §0.9 (limits and approximation), scheme images
and gluing; StableReduction Layer 4's blowup geometry and SchemeAndStackFoundations §4.11's
schematic strict transforms. The admissible-blowup extension, disjoint-closure and gluing
results just specified are targets here, using the existing blowup carriers.

**Checks.**

- A proper morphism admits the identity choice of §C4.3a.
- `A¹_k → Spec k` admits `A¹_k ⊂ P¹_k` over any field `k`.
- The open immersion for a nonproper morphism need not be surjective; for the preceding
  affine line its boundary is nonempty.

### C4.3c Common refinements and coherent comparison

**Common refinements and coherent comparison — `compactificationCommonRefinement`.**
For separated finite-type `f : X → S` with `S` qcqs and compactifications `C₁`, `C₂`, take
the schematic closure of `(j₁,j₂)(X)` in `C₁.Xbar ×_S C₂.Xbar`. It is a dense
compactification with proper projections to both choices fixing `X`. The Lean statement
supplies a dense `C` and `Compactification.Hom` maps from `C` to `C₁`, `C₂`.
Prove properness of every compactification morphism (`Compactification.Hom.proper`) and
finite-diagram refinement.
The dense full subcategory is nonempty and cofiltered, and two maps out of a dense
compactification into any fixed compactification agree, since the target is separated over `S`.
The Lean forms are `denseCompactification_cofiltered` and `denseCompactification_hom_unique`.
For nondense sources equalize parallel maps after dense replacement; agreement on the interior
does not itself assert equality on their extra components.

Export the canonical cones and their compatibility with products and base change. Under
arbitrary base change a refinement remains a refinement; use §C4.3a's dense replacement
to return to the dense subcategory. Flat base change also preserves the schematic-closure
construction. Prove the categorical comparison principle: a functor assigning equivalences
to refinement arrows, with its identity/composition laws, has canonical choice comparisons
independent of the refining cone, satisfying the identity, inverse, three-choice cocycle and
base-change laws. Coherent and étale consumers construct their own coefficient functors
and discharge these hypotheses; the geometry does not identify those functors.

*Source:* Stacks, Lemma 38.32.1, §29.7 (uniqueness on a schematically dense open), and
§63.9, Lemma 63.9.1 (the coefficient-specific use of coherent refinement comparisons).
*Needs:* §§C4.3a–C4.3b; schematic images, proper products and separated diagonals;
Mathlib's category/limit API. No étale base-change theorem is needed to construct the geometry.

**Checks.**

- A refinement of the proper identity choice has its specified comparison map to that choice.
- Comparisons among three compactifications satisfy `α₂₃ ∘ α₁₂ = α₁₃`.
- Refining `A¹ ⊂ P¹` leaves the étale consumer's forget-supports map unchanged once that
  consumer has proved its refinement equivalences.

### C4.3 Compactification and algebraization with proper support

Use the compactification objects, Nagata theorem and common refinements of
§§C4.3a–C4.3c. Every compactification in this coherent application has base `Spec ℂ`;
for quasi-projective schemes projective closure supplies a choice.

Prove `properSupportAlgebraization`: let `Y` be a separated scheme of finite type over `ℂ` and `G` a
coherent analytic module on `Y^an` whose support is compact. Then `G ≅ F^an` for a coherent `O_Y`-module
`F` with proper support and a specified isomorphism `F^an ≅ G`; this pair is unique up to
unique isomorphism compatible with the specified identification, and morphisms between such
modules algebraize uniquely. In particular a closed analytic subspace of `Y^an` with compact support is `W^an`
for a unique closed subscheme `W ⊆ Y`, proper over `ℂ`, nilpotents included. For `Y = A¹_ℂ`,
the analytic module `O_{Y^an}` has noncompact support and is not covered. Choose a compactification `Y ⊆ Ȳ` (§C4.3b `nagataCompactification`); the support of `G` is closed
in `Ȳ^an`, so `G` extended by zero is coherent; apply `properSchemeGagaEquivalence` on `Ȳ`;
faithfulness puts the support of the algebraic module inside `Y`, and full faithfulness, applied on a
common refinement of two compactifications (§C4.3c `compactificationCommonRefinement`), makes the result independent of
the compactification (SGA 1, XII, Theorem 4.4, printed pp. 249–250, applied on `Ȳ`; Serre, *GAGA*,
n° 19, Proposition 14, printed p. 29, for reduced compact analytic subsets; the reduction to a
compactification is the argument just given).
*Needs:* §§C4.3a–C4.3c (`Compactification`, `nagataCompactification`,
`compactificationCommonRefinement`); AlgebraicModuliForArithmeticGeometry
`properSchemeGagaEquivalence`; `coherentAnalytification_faithful`; AlgebraicModuliForArithmeticGeometry
`complexSchemeAnalytification.openSubspace`.

**Checks.**

- On `A¹_ℂ`, the analytic structure sheaf has support `ℂ`, which is not compact.
- On `P¹_ℂ`, the analytic structure sheaf has compact support and algebraizes to `O_{P¹}`.
- On `Spec ℂ`, the structure sheaf is covered and algebraizes to the rank-one module `ℂ`.

### C4.4 Holomorphic maps out of proper schemes

Prove `properSourceMorphismAlgebraicity`: for a proper scheme `X` over `ℂ` and a separated scheme
`Y` of finite type over `ℂ`, nilpotents allowed on both, the map
`Hom_ℂ(X, Y) → Hom(X^an, Y^an)` is bijective; `Y` need not be proper. The graph of a holomorphic
`h : X^an → Y^an` is a closed analytic subspace of `(X × Y)^an` isomorphic to `X^an`, hence with
compact support; `properSupportAlgebraization` makes it `Γ^an` for a closed subscheme
`Γ ⊆ X × Y`; the first projection `Γ → X` is proper and quasi-finite, hence finite, and the map
`O_X → p_*O_Γ` becomes an isomorphism after analytification, hence is one by faithfulness; compose its
inverse with the second projection (SGA 1, XII, Corollary 4.5 and its graph argument, printed
pp. 250–251, for `X` and `Y` both proper; Serre, *GAGA*, n° 19, Propositions 14–15, printed
pp. 29–30, for reduced complete `X` and arbitrary `Y`; the general case is the graph argument just
given). *Needs:*
`properSupportAlgebraization`; `CoherentAnalyticIdeal`; `coherentAnalytification_faithful`;
AlgebraicModuliForArithmeticGeometry `properSchemeGagaEquivalence`, `complexSchemeAnalytification.homEquiv`,
`complexSchemeAnalytification.fibreProduct`.

Prove `algebraicGraphRegular`: let `X`, `Y` be reduced schemes of finite type over `ℂ` and
`h : X^an → Y^an` holomorphic. If the graph of `h` is (the analytification of) a locally closed
algebraic subvariety `Γ ⊆ X × Y`, then `h` is the analytification of a morphism `X → Y`. Neither
properness nor smoothness of `X` is assumed; for nonreduced sources the graph must be algebraic as a
subspace. The first projection `Γ → X` is bijective on complex points and an analytic isomorphism;
Serre's comparison of the usual and Zariski closures of an image (*GAGA*, n° 7, Proposition 7,
printed p. 12) makes it a homeomorphism for the Zariski topology, a count of generic fibre degrees
makes it birational on components, and the flat local comparison identifies the local rings (Serre,
*GAGA*, n° 8, Propositions 8–9 and proofs,
printed pp. 13–15). This is the second step of the definable-Chow route of Bakker–Klingler–Tsimerman
(Theorem 4.12, printed p. 933), whose first step — making a nonproper graph algebraic — is
LogicAndDefinabilityInNumberTheory LD.6. *Needs:* AlgebraicModuliForArithmeticGeometry
`completedAnalyticStalkComparison`; `coherentAnalytification_faithful`; AlgebraicModuliForArithmeticGeometry
Layer 2; SchemeAndStackFoundations Layer 1.

Prove `familyMorphismInterface`: (1) if `X → S` and `Y → S` are morphisms of schemes of finite type over
`ℂ` with `X` proper over `ℂ` and `Y` separated, every holomorphic `S^an`-morphism `X^an → Y^an` is the
analytification of a unique `S`-morphism; (2) for a projective family `X → S` and `Y → S` with
`Hom_S(X, Y)` represented as in AlgebraicModuliForArithmeticGeometry Layer 3, at every complex point
`s` of `S` the fibre `Hom(X_s, Y_s) → Hom(X_s^an, Y_s^an)` is bijective, while a holomorphic section of
`Hom_S(X, Y)^an` over a nonproper `S^an` need not be algebraic; (3) for abelian varieties `A`, `B`
over `ℂ`, every holomorphic group homomorphism `A^an → B^an` is the analytification of a unique
homomorphism of abelian varieties, and an analytic isogeny algebraizes together with its finite
kernel and degree. Group-law diagrams are checked by faithfulness (SGA 1, XII, §4.5, printed
pp. 250–251; Bakker–Klingler–Tsimerman, Theorem 4.12, printed p. 933, for the separate graph
interface). *Needs:* `properSourceMorphismAlgebraicity`; `algebraicGraphRegular`; `gagaBaseChange`;
AlgebraicModuliForArithmeticGeometry Layer 3.

### C4.5 Connectedness of affine curves

Prove `affineCurveCompletionInterface`: let `U` be a connected component of a smooth affine curve
over `ℂ`. AlgebraicCurves Layer 12B–12C gives its smooth projective model `C` (unique up to unique
isomorphism). Construct `U → C` here by extending the identity of function fields to the
DVR stalks of the regular affine curve, using Layer 2's normal affine charts and the proper model's
valuative criterion. The local maps glue by separatedness; prove that the birational morphism
between regular curves is an open immersion. Then `D = C ∖ U` is a finite set of closed points
(a proper closed subset of an irreducible
one-dimensional Noetherian scheme), and `U^an = C^an ∖ D` as an open analytic subspace. Holomorphic
functions on `U^an` are not the coordinate ring of `U` (AlgebraicCurves, Layers 2 and 12B–12C, for
the affine chart dictionary and model; SGA 1, XII, 1.1 a), printed p. 240, for open immersions under
analytification). *Needs:* TauCetiRoadmap.AlgebraicCurves
(Layers 2 and 12B–12C); AlgebraicModuliForArithmeticGeometry `complexSchemeAnalytification.openSubspace`;
Mathlib `topologicalKrullDim`.

**Checks.**

- For `U = A¹`, the model is `P¹`, the immersion is the standard affine chart and the complement
  is the single point `∞`.
- For `U = G_m`, the same model has complement `{0,∞}`.
- For an elliptic curve with its origin removed, the model is that elliptic curve and the
  complement is the origin; the construction is not restricted to rational function fields.

Prove `puncturedRiemannSurfaceConnected`: if `M` is a connected Riemann surface (a connected
Hausdorff complex manifold of dimension one: Mathlib `ChartedSpace ℂ M` with `IsManifold 𝓘(ℂ) ω M`)
and `D ⊆ M` is finite, then `M ∖ D` is connected and path-connected. Connected manifolds are path
connected; a path meeting `D` is rerouted around each point of `D` inside a punctured coordinate disc,
which is path connected because the real dimension is two. The statement fails for real intervals
(SGA 1, XII, Lemma 2.5, printed p. 244, proves the general form: the complement of a nowhere dense
closed analytic subset of a connected normal analytic space is connected). *Needs:* Mathlib manifolds and path connectedness.

Prove `affineCurveConnectedness`: a smooth affine curve `U` over `ℂ` is connected if and only if
`U^an` is connected. Work component by component: for a connected `U` the projective model `C` is
connected, so `H⁰(C, O_C)` has no nontrivial idempotents; `properSchemeGagaEquivalence` identifies
these with the idempotents of `H⁰(C^an, O)`, so `C^an` is connected; `puncturedRiemannSurfaceConnected`
removes `D`. Conversely a decomposition of `U` into open and closed pieces analytifies. No full
faithfulness on the nonproper `U` is used, and the false claim that every holomorphic function on an
affine variety is algebraic is not invoked (SGA 1, XII, Proposition 2.4, printed pp. 243–244, proves
the comparison of connectedness for every scheme locally of finite type over `ℂ`; this target is its
one-dimensional case, by the route above). *Needs:* `affineCurveCompletionInterface`;
`puncturedRiemannSurfaceConnected`; AlgebraicModuliForArithmeticGeometry `properSchemeGagaEquivalence`.

### Examples

- The projection `P¹ × P¹ → P¹` maps a compact analytic subset to an analytic subset; the
  non-proper map `ℂ² → ℂ²`, `(x, y) ↦ (x, xy)` has image `{x ≠ 0} ∪ {(0, 0)}`, which is not closed.
- The closure of `ℂ* ⊂ ℂ` across `E = {0}` is analytic since `1 > 0`; a sequence of points converging
  to `0` (dimension `0`, not greater than `dim E = 0`) has a closure that is not analytic at `0`.
- The double hyperplane cut out by `L²`, `L` a linear form, keeps the square ideal under Chow.
- A finite-length analytic module supported at `0 ∈ A¹` algebraizes with its nilpotents; `O_{A¹,an}`
  does not satisfy the compact-support hypothesis.
- Maps `Spec ℂ[ε]/(ε²) → Y` keep their tangent vectors under analytification; every holomorphic map
  `P¹_an → A¹_an` is constant, consistent with `Hom(P¹, A¹) = ℂ`.
- `A¹` and `G_m` analytify to the connected `ℂ` and `ℂ*`; the disjoint union of two affine lines stays
  disconnected; `P¹ ∖ {0, ∞}` is path connected, an interval minus an interior point is not.

### Dependencies

C0–C2; AlgebraicModuliForArithmeticGeometry §§7.10.1, 7.10.3 and Layers 1–3;
SchemeAndStackFoundations Layer 1 and §0.9; §§C4.3a–C4.3c
(`Compactification`, `nagataCompactification`, `compactificationCommonRefinement`);
StableReduction Layer 4 and SchemeAndStackFoundations §4.11 for compactification geometry;
TauCetiRoadmap.AlgebraicCurves (Layers 2 and 12B–12C); Mathlib schemes and manifolds.

<a id="c5"></a>

## Layer C5: de Rham–Betti comparison, Hodge theory and logarithmic comparison

The de Rham layer. Its seven parts are: the ordinary comparison for proper smooth schemes (C5.1);
families, the Gauss–Manin connection and Ehresmann's theorem (C5.2); geometric Hodge theory (C5.3);
integration over analytic cycles and the Chern normalisation (C5.4); logarithmic structures (C5.5);
regular singular connections and Deligne's Riemann–Hilbert theory (C5.6); curves and the proper
logarithmic comparison (C5.7). Throughout, de Rham complexes are complexes of sheaves of
`ℂ`-vector spaces (relative ones of `f⁻¹O_S`-modules) whose terms are coherent, and they are compared
through differential operators, never by applying coherent GAGA to a `ℂ`-linear differential.

### C5.1 The ordinary comparison

Define `AlgebraicDeRham X` for a smooth scheme `X` over `ℂ` (more generally over a field `k` of
characteristic zero), by sheafifying DerivedDeRhamCohomology Layer 2's ordinary
`DeRham.complex k A` on affine opens `Spec A` and gluing along its localization pullbacks
`DeRham.complexMap`. Thus `Ω^p_{X/ℂ} = Λ^p Ω¹_{X/ℂ}`, with the shared `ℂ`-linear differential determined by
`d(a₀ da₁ ∧ ⋯ ∧ da_p) = da₀ ∧ da₁ ∧ ⋯ ∧ da_p`. It satisfies `d² = 0` and the graded Leibniz rule and is
not `O_X`-linear. Forgetting the module structures gives a complex of sheaves of `ℂ`-vector spaces in
degrees `p ≥ 0` with finite locally free terms; `H^q_dR(X/ℂ)` is its hypercohomology. Near a point
`x` the module `Ω¹_{X/ℂ}` is free of rank `dim_x X`, so `Ω^p_{X/ℂ} = 0` for `p > dim X`: the complex
is bounded when `X` is finite-dimensional, in particular when `X` is of finite type, and finite local
freeness of each term does not bound it in general. The API is
`AlgebraicDeRham.d_on_generator` (the displayed formula), `AlgebraicDeRham.d_squared`
(`d ∘ d = 0`), `AlgebraicDeRham.pullback` (a morphism of smooth schemes induces pullback of forms
commuting with `d`) and `AlgebraicDeRham.bounded` (`Ω^p_{X/ℂ} = 0` for `p > dim X` when `X` is
finite-dimensional) (Grothendieck, *On the de Rham cohomology of algebraic varieties*, Publ. Math.
IHÉS 29 (1966), notation (1)–(4), printed pp. 95–96; Stacks, §10.132, tag 0FKF;
Deligne, *Équations différentielles à points
singuliers réguliers*, LNM 163 (1970), I.2.20.3–2.21, printed pp. 13–14). *Needs:*
DerivedDeRhamCohomology Layer 2 §§2.1–2.19 (`DeRham.complex`, `DeRham.complexMap`,
`DeRham.d_squared`, `DeRham.d_leibniz`); Mathlib `KaehlerDifferential.D`,
`exteriorPower.ιMulti`; TauCetiRoadmap.AlgebraicVectorBundles (L0C exterior powers of locally free
sheaves); Mathlib `DerivedCategory` (hypercohomology of a bounded-below complex of sheaves of
`ℂ`-vector spaces on the Zariski site, as morphisms from the constant sheaf in the derived category).

**Checks.**

- On `Spec A`, sections on each principal open recover `DeRham.complex k A_f`; restriction
  is the supplier's localization complex map. For `z ↦ z²` on `k[z]`, the affine pullback is
  `DeRham.complexMap` and sends `dz` to `2z dz`.
- `AlgebraicDeRham.point`: for `Spec ℂ` the complex is `ℂ` in degree `0`.
- `AlgebraicDeRham.polynomial`: on `A¹ = Spec ℂ[z]`, `d(zⁿ) = n zⁿ⁻¹ dz`.
- `AlgebraicDeRham.torus`: on `G_m = Spec ℂ[z, z⁻¹]`, `dz/z` is closed and not exact (it is not
  `d` of any Laurent polynomial), so `H¹_dR(G_m) ≠ 0`; a complex that forgot the units would miss it.
- `AlgebraicDeRham.disjointUnion`: `X = ⊔_{n ≥ 0} Aⁿ_ℂ` is smooth and locally of finite type over `ℂ`,
  and `Ω^p_X ≠ 0` for every `p` (restrict to the component `A^p_ℂ`), so its de Rham complex is not
  bounded; `AlgebraicDeRham.bounded` needs `dim X < ∞`.

Define `HolomorphicDeRham T` for a complex manifold `T`: `Ω^p_T` the coherent sheaf of holomorphic
`p`-forms (the locally free module of the holomorphic cotangent bundle's `p`-th exterior power, by
`holomorphicBundleDictionary`) with the holomorphic exterior derivative, a bounded complex of sheaves of
`ℂ`-vector spaces with `Ω⁰_T = O_T` and `ℂ`-linear, not `O_T`-linear, differential. The API is
`HolomorphicDeRham.degreeZero` (`Ω⁰_T = O_T`), `HolomorphicDeRham.d_squared` (`d² = 0`) and
`HolomorphicDeRham.pullback` (holomorphic maps induce pullbacks commuting with `d`) (Deligne 1970,
I.2.10–2.15, printed pp. 9–11, with the canonical connection `∇f = df` of I.2.7.3, p. 8). *Needs:* `holomorphicBundleDictionary`; TauCetiRoadmap.AlgebraicVectorBundles
(L0C).

**Checks.**

- `HolomorphicDeRham.point`: on a point the complex is `ℂ` in degree `0`.
- `HolomorphicDeRham.coordinate`: `d(zᵢ) = dzᵢ` in a holomorphic chart, and `d(fg) = f dg + g df`.
- `HolomorphicDeRham.torusPeriod`: on `ℂ*` the closed form `dz/z` integrates to `2πi` over the
  positively oriented unit circle (Mathlib `circleIntegral.integral_sub_inv_of_mem_ball`), so it is not
  exact on `ℂ*`.

Prove `holomorphicPoincare`: on a complex manifold `T`, the inclusion of the constant sheaf `ℂ` into
`Ω^•_T` is a quasi-isomorphism. On a coordinate ball every closed holomorphic `p`-form with `p ≥ 1` is
exact on a smaller ball, and the kernel of `d : O → Ω¹` is the sheaf of locally constant functions.
The radial homotopy `K` with `dK + Kd = id − ev₀` proves it, the parameter integral preserving
holomorphy (Deligne 1970, I.2.19 and I.2.23 (ii) with 2.23.2–2.23.3, printed pp. 13–17, where the
homotopy integrates power series term by term). *Needs:* `HolomorphicDeRham`.

Define `IsDifferentialOperator m D` for a commutative `k`-algebra `A`, `A`-modules `M`, `N` and a
`k`-linear map `D : M → N` (Grothendieck's definition): order `≤ 0` means `A`-linear; order `≤ m + 1`
means that for every `a ∈ A` the commutator `[D, a] = D ∘ (a·) − a · D` has order `≤ m`. Sheafified
on a scheme or analytic space, a differential operator of order `≤ m` between coherent modules `F`, `G`
is the same as an `O`-linear map `P^m(F) → G` (`Suggested.lean` states the algebraic definition with
`commutatorWith`) from the module of principal parts of order `m` (the
quotient of `O_{X×X} ⊗ F` by the `(m+1)`-st power of the diagonal ideal), composed with the universal
jet (EGA IV₄, §§16.7–16.8, especially (16.8.1)–(16.8.2), Proposition (16.8.8) and
Proposition (16.8.9), printed pp. 40–44). Define `DifferentialOperatorAnalytification`: for coherent `F`, `G` on `X` of finite type over `ℂ`
and an algebraic differential operator `D` of order `≤ m`, analytify the factorization through
`P^m(F)` to obtain the analytic differential operator `D^an : F^an → G^an`, independent of the chosen
`m`. The API is `DifferentialOperatorAnalytification.orderZero` (order-zero operators go to the
analytification of `O`-linear maps), `DifferentialOperatorAnalytification.composition`
(`(D ∘ E)^an = D^an ∘ E^an`, orders adding) and `DifferentialOperatorAnalytification.deRham` (the
analytification of the algebraic exterior derivative is the holomorphic one) (Deligne 1970, II.6.6,
printed pp. 100–101, stated there for proper `X`; the construction through principal parts is
local). *Needs:* `CoherentAnalytification`; `CoherentAnalyticIdeal` (the diagonal
ideal); `coherentPullbackOperations`.

For `commutatorWith k a D`, prove additivity in `D`, additivity in `a`, and vanishing exactly
when `D` commutes with scalar multiplication by `a`. For `IsDifferentialOperator`, prove the
order-zero equivalence with `A`-linearity, monotonicity in the order bound, closure under sums
at a common order, and the composition bound `ord(D ∘ E) ≤ ord(D) + ord(E)`. These are the
local commutator and order APIs underlying the principal-parts construction, not substitutes
for its sheafification (EGA IV₄, §§16.7–16.8, especially (16.8.1)–(16.8.2),
Propositions (16.8.8)–(16.8.9), printed pp. 40–44).

**Checks for the commutator and order predicates.**

- Multiplication by `a ∈ A` has order zero; every commutator of two multiplication maps vanishes.
- On `ℂ[z]`, `[d/dz, z]` is the identity, and `d/dz` has order one but not zero.
- The zero map has order zero and every higher order, including on the zero module; order bounds
  express “at most”, rather than exact order.

**Checks.**

- `DifferentialOperatorAnalytification.scalar`: multiplication by an algebraic function `f`
  analytifies to multiplication by `f^an`.
- `DifferentialOperatorAnalytification.derivative`: `d/dz` on `ℂ[z]` analytifies to the holomorphic
  derivative on `O_ℂ`, with `exp(z) ↦ exp(z)`.
- `DifferentialOperatorAnalytification.nonLinearOverO`: for `D = d/dz`, `D(z · 1) − z D(1) = 1`, so `D`
  has order exactly `1` and is not `O`-linear; a construction that analytified it as an `O`-linear map
  fails.

Prove `boundedOperatorHyperGaga`: for a proper scheme `X` over `ℂ` and a bounded complex `K` of
coherent `O_X`-modules whose differentials are `ℂ`-linear differential operators, the canonical map
`RΓ(X, K) → RΓ(X^an, K^an)` is a quasi-isomorphism; more generally, for a proper morphism `f : X → S`
and a bounded complex of coherent modules with `f⁻¹O_S`-linear differential operators as
differentials, `(Rf_*K)^an → Rf^an_* K^an` is a quasi-isomorphism (on cohomology sheaves after
analytification of coherent hypercohomology sheaves). Compatible short exact sequences of such
complexes give compatible triangles and connecting maps. Induct on the length of `K` with the
brutal truncation triangles `σ^{≥p+1}K → σ^{≥p}K → K^p[−p] →`, which analytification respects
because the analytified operators are the differentials of `K^an`; the terms are compared by
`properSchemeGagaPushforward`, and the five lemma closes the induction (equivalently, the first pages
of the spectral sequences of the stupid filtration agree and boundedness gives convergence)
(Deligne 1970, II.6.5–6.6 and proof, printed pp. 100–101, for the absolute statement; the relative
statement is proved here by the same induction, with `properSchemeGagaPushforward` for the terms;
Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106,
Proposition 3.6, pp. 18–19, applies it to logarithmic de Rham complexes). *Needs:* `DifferentialOperatorAnalytification`; `HigherImageComparison`;
AlgebraicModuliForArithmeticGeometry `properSchemeGagaPushforward`; SchemeAndStackFoundations
§2.1 `Sheaf.higherDirectImage` (higher direct images); Mathlib `DerivedCategory` (its triangulated
structure, for the truncation triangles).

Define `SmallSingularCochains T A` for a topological space `T` and an abelian group `A` (Sella's
construction). A nesting assigns an open set to every finite sequence of points of `T`, the whole
space to the empty sequence and a neighbourhood of `x₁` to `(x₁, …, x_n)` whenever `x₁` lies in the
set assigned to `(x₂, …, x_n)`; the set of a sequence lies in the set of every sequence obtained from
it by a nondecreasing reindexing, in particular of every subsequence. A
singular simplex is small for the nesting when, for every chain of faces `σ₁ ⊂ ⋯ ⊂ σ_m` of it, the
face `σ₁` lies in the set assigned to the images of the barycentres of `σ₁, …, σ_m`. Small
`A`-valued cochains, taken in the directed colimit over refinements of nestings, form a complex of
flasque sheaves on `T` with degree-zero augmentation from the constant sheaf `A`. Use Tau Ceti's singular cochain complex as the
complex of all cochains; the extra construction here is its nesting-small flasque resolution. The API is
`SmallSingularCochains.augmentation` (on a semilocally contractible `T`, the degree-zero cocycles
are the locally constant `A`-valued functions; on a totally path-disconnected space every function
is a cocycle), `SmallSingularCochains.restriction_surjective` (every restriction map of the cochain
sheaves is surjective, so the sheaves are flasque) and
`SmallSingularCochains.small_inclusion_equivalence` (for each nesting on an open, the small chains
include into all singular chains by a chain homotopy equivalence, built from subdivision and prism
homotopies corrected on faces; in the colimit over nestings the map from all singular cochains to
the small ones is a quasi-isomorphism) (Sella, *Comparison of sheaf cohomology and singular
cohomology*, arXiv:1602.06674v3, the definition of nestings, p. 6, Lemma 0.1, pp. 2–4, and
Steps 1–3, pp. 7–19). *Needs:* Tau Ceti `TopCat.singularCochainComplex` and
`TauCeti.smallSingularChainHomotopyEquiv` (the open-cover construction);
TauCetiRoadmap.AlgebraicTopology (Stage 6, cochain products); Mathlib `AlgebraicTopology.singularChainComplexFunctor`.

**Checks.**

- `SmallSingularCochains.point`: on a point the cohomology of global sections is `A` in degree `0`
  and zero in positive degrees.
- `SmallSingularCochains.empty`: on the empty space every cochain group is zero.
- `SmallSingularCochains.nonHausdorff`: on Sella's five-point locally contractible non-Hausdorff
  space, the map from singular `1`-cochains to global sections of the sheafification of the presheaf
  of all singular `1`-cochains is not surjective, so an argument through the naive sheafification
  breaks down there, while the nesting construction still has surjective restriction maps (Sella,
  Example 0.3, p. 5).

Prove `sheafSingularComparison`: for a space `T` in which every neighbourhood of every point contains a
smaller neighbourhood whose inclusion is null-homotopic (semilocal contractibility, which is Mathlib's
`LocallyContractibleSpace`; manifolds satisfy it through coordinate balls, and C6.0 supplies it
for finite-type complex schemes), and for every abelian group `A`, the canonical map
`Sheaf.H(T, A) → H^q_sing(T, A)` is an isomorphism in every degree, natural in `T` and `A`. No
Hausdorff assumption on `T` and no finiteness assumption on `A` is made. The small cochains are a
flasque resolution of the constant sheaf (`TauCeti.Topology.subsingleton_H_succ_of_isFlasque` makes
it acyclic), and their global sections are quasi-isomorphic to the singular cochains (Sella, the
Theorem, p. 2, and Lemma 0.1, pp. 2–4; the subdivision construction and proof, pp. 6–19). This is additive;
compatibility with cup products is `multiplicativePeriodInterface`. *Needs:*
`SmallSingularCochains`; Tau Ceti `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`; Mathlib
`Sheaf.H`, `LocallyContractibleSpace`; TauCetiRoadmap.AlgebraicTopology (Stage 6).

Prove `properDeRhamBetti` (Grothendieck): for a smooth proper scheme `X` over `ℂ` and every `q ≥ 0`
there is a canonical `ℂ`-linear isomorphism `H^q_dR(X/ℂ) ≅ H^q_sing(X^an, ℂ)`, natural for morphisms of
smooth proper schemes. It is the composite of `boundedOperatorHyperGaga` for `Ω^•_X` (bounded by
`AlgebraicDeRham.bounded`, since `X` is of finite type; its analytification is `Ω^•_{X^an}` by local
coordinates), `holomorphicPoincare` and
`sheafSingularComparison`. Projectivity is not assumed (Grothendieck 1966, Theorem 1′ and the remark
on complete schemes, printed p. 96); smoothness is, since the ordinary de Rham complex of a singular
scheme does not compute Betti cohomology in general. *Needs:* `AlgebraicDeRham`; `HolomorphicDeRham`;
`boundedOperatorHyperGaga`; `holomorphicPoincare`; `sheafSingularComparison`.

Prove `multiplicativePeriodInterface`: the isomorphism of `properDeRhamBetti` is compatible with
pullback, carries the wedge product to the cup product (through DifferentialGeometry's de Rham theorem
and its multiplicativity, and AlgebraicTopology's cup product), and carries the de Rham trace in top
degree, `∫_{X^an}` with the complex orientation, to the manifold trace. Keep `H^q_sing(X^an, ℤ)`, its
torsion subgroup and its image in `H^q_sing(X^an, ℂ)` distinct: the image of integral cohomology is a
lattice of full rank in the real subspace, and the coefficient-change map `H_ℤ ⊗ ℂ → H_ℂ` is the named
comparison; finite generation of `H_ℤ` uses that compact manifolds are of finite CW type. The period
of the positively oriented loop on `G_m` against `dz/z` is `2πi`, the integral
`circleIntegral.integral_sub_inv_of_mem_ball` (Grothendieck 1966, Theorem 1, printed p. 95, for the
comparison on the affine `G_m`; the product, trace and period compatibilities are assembled here from
the suppliers named below). *Needs:* `properDeRhamBetti`; TauCetiRoadmap.DifferentialGeometry
(Layers 5, 6, 8 and 9); TauCetiRoadmap.AlgebraicTopology (Stages 6 and 8).

### C5.2 Families, Ehresmann and the Gauss–Manin connection

Use the ordinary connection carrier `Crystalline.Connection` from CrystallineCohomology CR.1,
sheafified as `Crystalline.Connection E` for a smooth scheme `X` over a field `k` of characteristic zero and a
coherent `O_X`-module `E`: a `k`-linear sheaf map `∇ : E → Ω¹_X ⊗ E` with
`∇(a s) = da ⊗ s + a ∇s`. It extends uniquely to `∇ : Ω^p ⊗ E → Ω^{p+1} ⊗ E` with the graded Leibniz rule;
its curvature `∇ ∘ ∇ : E → Ω² ⊗ E` is `O_X`-linear, and `∇` is integrable (flat) when the curvature
vanishes, equivalently when `(Ω^• ⊗ E, ∇)` is a complex — the de Rham complex of `(E, ∇)`. The API is
`Crystalline.Connection.leibniz` (the displayed rule), `Crystalline.Connection.tensor` (`∇_E ⊗ 1 + 1 ⊗ ∇_F`
on `E ⊗ F`, and the dual connection when `E` is finite locally free) and `Crystalline.Connection.curvature` (zero curvature
iff the extended `∇` squares to zero; the trivial connection is `(A, d)`) (Deligne 1970, I.2.3–2.15, printed pp. 6–11, for holomorphic bundles, and I.2.20.3–2.21, pp. 13–14,
for smooth schemes). The same
definitions on complex manifolds give holomorphic connections, and analytification carries one to the
other. For a holomorphic submersion `f : T → S`, use the same sheafified carrier with
relative holomorphic forms `Ω¹_{T/S}`, the relative exterior derivative and
`f⁻¹O_S`-linearity. On an affine `Spec A`, use the supplier's ordinary `Ω¹_{A/k}` case and
its tensor order `E ⊗ Ω¹`; tensor symmetry identifies this with `Ω¹ ⊗ E` in the
geometric formula. Additivity and the Leibniz rule imply `k`-linearity because `d` kills
base scalars. Extension, curvature, tensor and dual connections are the CR.1 operations,
using `DeRham.complex` from DerivedDeRhamCohomology Layer 2. Sheafify by localization
and analytify via `DifferentialOperatorAnalytification`; prove that tensor symmetry and
restriction identify the coefficient complexes and their curvature with those of the shared
carrier. *Needs:* CrystallineCohomology CR.1, “Modules with integrable connection and their
de Rham complexes” (`Crystalline.Connection`, `.extend`, `.curvature`, `.tensor`, `.hom`,
`.baseChange`); `AlgebraicDeRham`; `coherentOperations`; `DifferentialOperatorAnalytification`;
Mathlib `Derivation`, `KaehlerDifferential`.

**Checks.**

- `Crystalline.Connection.trivial`: on `O_X` the exterior derivative `d` is an integrable connection.
- `Crystalline.Connection.point`: on `Spec k` every connection is zero, with zero curvature.
- `Crystalline.Connection.rankOneTorus`: on `O_{G_m}`, `∇ = d + a dz/z` is integrable for every
  `a ∈ ℂ`, its horizontal sections on `ℂ*` are the branches of `z^{−a}`, and its monodromy along the
  positive loop is `exp(−2πia)`.

Prove `analyticFlatConnectionLocalSystem`: let `f : T → S` be a holomorphic submersion of
complex manifolds and `(E, ∇)` a finite locally free holomorphic module with integrable relative
connection on the shared carrier above. Its horizontal sheaf `V = ker ∇` is an `f⁻¹O_S`-module
locally isomorphic, on a product chart, to the inverse image of a finite locally free module on
an open of `S`, with the same local rank as `E`. The canonical evaluation map
`O_T ⊗_{f⁻¹O_S} V → E`, `a ⊗ v ↦ av`, is an isomorphism carrying the connection
`d_{T/S} ⊗ 1` to `∇`. Conversely, for an `f⁻¹O_S`-module `V` locally of this form,
the unit `V → (O_T ⊗_{f⁻¹O_S} V)^{d_{T/S}⊗1}` is an isomorphism. These maps give
quasi-inverse functors between such relative local systems and finite locally free holomorphic
modules with integrable relative connection; prove naturality for horizontal morphisms,
compatibility with tensor products and duals, and pullback along diagrams of holomorphic
submersions with extension of base scalars. For `S` a point this is the equivalence with
finite-dimensional complex local systems, preserving the locally constant rank function of C0.3.

Construct the local horizontal frames with holomorphic parameters: for a holomorphic matrix
`A(z,t)` and holomorphic initial matrix `G₀(t)`, solve `∂G/∂z = −A(z,t)G`,
`G(0,t) = G₀(t)`, uniquely on a smaller product polydisc; with invertible initial matrix the
solution is invertible after shrinking. Starting with the identity on the zero section, extend
a frame successively in the fibre variables, using the preceding frame as initial value at each
step. Integrability and uniqueness make each extension horizontal in the preceding variables. The frames identify evaluation with
multiplication in a free module; horizontal morphisms have coefficients pulled back from the base,
which proves the functorial assertions (Deligne 1970, I.2.22–2.23(iii) and proof, printed
pp. 14–19, especially the Cauchy problem with parameters and induction on pp. 17–18).
*Needs:* `holomorphicBundleDictionary`; `HolomorphicDeRham`; CrystallineCohomology CR.1's
shared connection operations and their holomorphic/relative sheafification above.

**Checks.**

- Rank zero gives the zero horizontal sheaf and the zero evaluation isomorphism; for
  `(O_T^r, d_{T/S})` the horizontal sheaf is `(f⁻¹O_S)^r` and evaluation is the usual free-module
  isomorphism.
- On a disc, `d + dz` has the nowhere vanishing horizontal frame `exp(−z)`.
  The scalar radial operator gives `K(∇1) = K(dz) = z`, whereas `(id − ev₀)(1) = 0`;
  the coefficient contraction is obtained by conjugating through the horizontal frame.
- For `T = D_z × D_t → D_t`, `d_z + t dz` has frame `exp(−tz)`, holomorphic in both variables,
  normalized to one at `z = 0`; its horizontal sheaf is the inverse image of `O_{D_t}`.
- Gluing local frames `z^{−a}` for `d + a dz/z` on `ℂ*` gives monodromy
  `exp(−2πia) = localMonodromy a` along the positive loop, matching C5.6.

Prove `relativePoincare`: for a holomorphic submersion `f : T → S` of complex manifolds, the relative
holomorphic de Rham complex `Ω^•_{T/S}` (with `f⁻¹O_S`-linear differential) is a resolution of
`f⁻¹O_S`; with coefficients in a finite locally free holomorphic module with integrable relative
connection it resolves its horizontal sheaf `V`. The scalar degree-zero kernel is `f⁻¹O_S`.
Apply the radial homotopy in the fibre coordinates of a local product chart for scalar forms;
the parameter integral keeps holomorphic dependence on the base. For coefficients, first use
`analyticFlatConnectionLocalSystem` to identify `(E, ∇)` with
`(O_T ⊗_{f⁻¹O_S} V, d_{T/S} ⊗ 1)` and transport the scalar contraction through its evaluation
isomorphism (Deligne 1970, I.2.23(ii)–(iii) and proof, printed pp. 15–19).
*Needs:* `HolomorphicDeRham`; `holomorphicPoincare`; `analyticFlatConnectionLocalSystem`.

Prove `ehresmannFibration`, the holomorphic/analytification adapter to
SmoothBundlesConnections B1.5: for a proper surjective holomorphic submersion
`f : T → S` of finite-dimensional Hausdorff second-countable complex manifolds without
boundary, forget to their real smooth structures and prove `Manifold.IsSubmersion I J ∞ f`.
The native continuous map has the same properness and surjectivity. Consume B1.5's
regular-fibre manifold carrier and smooth `FiberBundle` atlas, componentwise on `S`:
for every `s`, a `Trivialization` over an open `V` represents an actual diffeomorphism
`f⁻¹(V) ≅ V × f⁻¹(s)` with first projection `f`. Compare the total-space identification
with the original `T`; both chart maps are smooth for the underlying real models.
For a proper smooth surjective morphism of smooth separated finite-type complex schemes,
prove these hypotheses for its analytification using §7.10.1's properness and local analytic
submersion comparisons.

For a holomorphic base map `g : S′ → S` between these manifolds, identify the native
pullback bundle with `T ×_S S′ → S′` on its submersion fibre-product manifold. Pull back
each supplied chart, retaining the projection square and fibre map; prove the identity and
composition comparisons. The smooth local trivializations are imported from B1.5, not
chosen independently after base change. The general proper-submersion theorem and horizontal
lift infrastructure have their single owner in that supplier; this adapter supplies
`relativeBettiLocalSystem` (tom Dieck, *Differential Manifolds*, January 2009,
Theorems 2.2.1 and 2.2.3 and Corollary 2.2.4, pp. 52–53; Deligne 1970, I.2.24–2.25, p. 19).
*Needs:* SmoothBundlesConnections B1.5's foundational submersion/trivialization leaf;
AlgebraicModuliForArithmeticGeometry §7.10.1; Mathlib `Manifold.IsSubmersion`,
`FiberBundle`, `Trivialization` and the real smooth structure of complex manifolds.

**Checks.**

- `P¹ × S → S` uses the product smooth chart, and its pullback to `S′` is the same product
  chart with the base coordinate changed by `g`.
- Over two disjoint base components, the families with fibres `P¹` and an elliptic curve have
  componentwise bundle models; both fibres have complex dimension one, but they are not
  diffeomorphic, so no single fixed fibre is asserted for both components.
- For `z ↦ zⁿ` on `ℂ*`, `n ≥ 1`, the proper holomorphic submersion has `n`-point fibres;
  its smooth trivializations and those of its pullback give the same fibre permutations.

Prove `relativeBettiLocalSystem`: for a proper smooth holomorphic map `f : T → S` of complex manifolds
(proper surjective submersion) and an abelian group `A`, `R^q f_* A` is a locally constant sheaf with
stalk `H^q_sing(f⁻¹(s), A)` at `s`; for `A = ℂ` (or `ℚ`) it has finite rank, and for `A = ℤ` finitely
generated stalks. Local triviality comes from `ehresmannFibration`; on a trivialized `V × F` with `V`
contractible, `R^q f_*A|_V` is the constant sheaf `H^q(F, A)` by `sheafSingularComparison` and homotopy
invariance; finiteness uses that the compact fibre has finite CW type (Deligne 1970, I.2.24–2.25,
printed p. 19, for the stalks of `R^q f_*`; tom Dieck, Corollary 2.2.4, p. 53). *Needs:* `ehresmannFibration`;
`sheafSingularComparison`; TauCetiRoadmap.AlgebraicTopology (Stage 8, finite CW type).

Prove `coherentFlatConnection_locallyFree`: a coherent module with an integrable ordinary
connection on a smooth scheme over a characteristic-zero field is finite locally free.
Over `ℂ`, first establish the horizontal-frame equivalence on arbitrary coherent analytic
coefficients: locally the module is the structure sheaf tensored with a finite-dimensional
horizontal vector space (Deligne 1970, I.2.22–2.23(iii), pp. 14–19, with the coherent-presentation
argument in the proof). This argument does not assume freeness or use the finite locally free equivalence
`analyticFlatConnectionLocalSystem`. Analytify the coherent
algebraic module and connection, then descend freeness along C0's faithfully flat analytic stalk
maps, using `Module.Flat.of_flat_tensorProduct` and `Module.free_of_flat_of_isLocalRing`.
Over any characteristic-zero field, work on affine charts and descend the smooth algebra,
finite presentation, connection and integrability to a finitely generated subfield of `k` over `ℚ`;
embed that subfield in `ℂ`, apply the complex case, and use faithful scalar extension and pullback
to `k`. Include this descent of finite connection data in the target; smoothness descends
with the finite presentation. Sheafify `Crystalline.Connection` on coherent coefficients before
constructing
`GaussManin`; apply this freeness theorem only after constructing its integrable connection.
*Needs:* CrystallineCohomology CR.1 `Crystalline.Connection`; `CoherentAnalytification`;
`coherentPullbackOperations`; `completedAnalyticStalkComparison.flat`; Mathlib
`Module.Flat.of_flat_tensorProduct`, `Module.free_of_flat_of_isLocalRing`;
SchemeAndStackFoundations Layer 0 (localization and affine gluing).

**Checks.**

- The zero module with its zero connection is locally free of rank zero.
- `(O_X^r,d)` is locally free of rank `r`, including disconnected rank strata.
- On `A¹` in characteristic zero, `O/(t)` cannot carry a connection: applying Leibniz to
  `t·1 = 0` would give `dt ⊗ 1 = 0`. In characteristic `p`, `O/(t^p)` does carry the induced
  integrable connection and is not locally free, so the characteristic hypothesis is necessary.

Define `GaussManin f` for a smooth proper morphism `f : X → S` of smooth schemes over a field `k` of
characteristic zero: filter the absolute de Rham complex `Ω^•_{X/k}` by the subcomplexes generated by
`p` forms pulled back from `S`; smoothness makes the graded pieces `f^*Ω^p_S ⊗ Ω^•_{X/S}[−p]`. The
connecting map of the two-step quotient is
`∇ : H^q_dR(X/S) → Ω¹_S ⊗ H^q_dR(X/S)` (with `H^q_dR(X/S) = R^q f_*Ω^•_{X/S}`, coherent because `f` is proper, then finite locally free by
`coherentFlatConnection_locallyFree` after constructing the integrable connection below). It
is a connection, and it is integrable: the first page of the spectral sequence of the filtration is
`Ω^p_S ⊗ H^q_dR(X/S)` with differential the extension of `∇`, and its square is zero. The API is
`GaussManin.connection` (the connecting-map definition), `GaussManin.integrable` (zero curvature) and
`GaussManin.horizontalComparison` (over `ℂ`, the analytic horizontal sections of
`(H^q_dR(X/S)^an, ∇^an)` form the local system `R^q f^an_* ℂ`) (Katz–Oda, *On the differentiation of
de Rham cohomology classes with respect to parameters*, J. Math. Kyoto Univ. 8 (1968), §1,
pp. 199–201, §2, Theorem 1 and proof, pp. 201–204, and §3, sequence (13), pp. 204–205, for the
filtration construction and integrability; Deligne 1970, II.7.7, printed p. 117, for
`horizontalComparison`, and II.7.8, pp. 117–118). *Needs:* `AlgebraicDeRham`; `Crystalline.Connection`; `coherentFlatConnection_locallyFree`;
`relativePoincare`; `analyticFlatConnectionLocalSystem`; `relativeBettiLocalSystem`;
`boundedOperatorHyperGaga`; SchemeAndStackFoundations Layer 2.

**Checks.**

- `GaussManin.constantFamily`: for `X = F × S`, `H^q_dR(X/S) = H^q_dR(F) ⊗ O_S` and `∇` differentiates
  only the `O_S`-coefficients.
- `GaussManin.degreeZero`: for a family with geometrically connected fibres, `H⁰_dR(X/S) = O_S` with
  `∇ = d`.
- `GaussManin.leibniz`: `∇(a v) = da ⊗ v + a ∇v`; an `O_S`-linear map fails this already for
  `a = t` on `S = A¹`.

Prove `relativeDeRhamBetti`: for a smooth proper morphism `f : X → S` of smooth schemes over `ℂ`, the
canonical map `(R^q f_*Ω^•_{X/S})^an → R^q f^an_* ℂ ⊗_ℂ O_{S^an}` is an isomorphism of locally free
holomorphic modules carrying `∇^an` to the connection `d ⊗ 1` whose horizontal sections are
`R^q f^an_* ℂ`, compatible with base change and with the fibrewise `properDeRhamBetti`. No projectivity
is assumed. Compare the relative operator complexes by `boundedOperatorHyperGaga` over each
quasi-compact open `V ⊆ S`, over which `Ω^•_{X/S}` is bounded (`f` is quasi-compact and `Ω¹_{X/S}` is
finite locally free, so its rank on `f⁻¹(V)` is bounded), resolve
`f^{an,−1}O_{S^an}` by `relativePoincare`, and use `relativeBettiLocalSystem` with the projection
formula; identify the horizontal sheaf and its evaluation map by
`analyticFlatConnectionLocalSystem` (Deligne 1970, I.2.27–2.29, printed pp. 19–21, and II.7.7, p. 117; Deligne, *Théorème de
Lefschetz et critères de dégénérescence de suites spectrales*, Publ. Math. IHÉS 35 (1968), Theorem 5.5,
printed pp. 123–125, for local freeness). *Needs:* `GaussManin`;
`relativePoincare`; `analyticFlatConnectionLocalSystem`; `relativeBettiLocalSystem`;
`boundedOperatorHyperGaga`.

**Artin-base relative comparison — `artinDeRhamBetti`.** Let `A` be a finite-dimensional
commutative local `ℂ`-algebra with maximal ideal `m` and specified residue identification `A/m ≅ ℂ`,
and let `f : X → Spec A` be smooth and proper, with special fibre `X₀`. Sheafify the shared
`DeRham.complex A B` on affine opens of `X` to form `Ω^•_{X/A}`; analytify its terms and relative
operators to obtain `Ω^•_{X^an/(Spec A)^an}` on the nilpotent-retaining analytic ringed space.
Its underlying topological space is `X₀^an`, whereas its structure sheaf and relative forms retain
`A`. Prove that the canonical augmentation from the constant sheaf `A` is a quasi-isomorphism,
and that it gives canonical `A`-linear isomorphisms, natural for morphisms over `A` and compatible
with extension of these Artin coefficient algebras,

```text
A_const → Ω^•_{X^an/(Spec A)^an},
H^n_dR(X/A) ≅ H^n_sing(X₀^an, A) ≅ H^n_sing(X₀^an, ℂ) ⊗_ℂ A.
```

In particular `H^n_dR(X/A)` is free of rank `dim_ℂ H^n_sing(X₀^an, ℂ)` and
`length_A H^n_dR(X/A) = length_A(A) · dim_ℂ H^n_sing(X₀^an, ℂ)`.
No freeness or base-change hypothesis on the individual Hodge cohomology modules is used.
Smoothness makes the relative forms flat over `A`: analytified étale coordinates identify them
locally with `A ⊗_ℂ Ω^•` on a polydisc. For the finite `m`-adic filtration,
`gr_m^i Ω^•_{X^an/(Spec A)^an} ≅ (m^i/m^{i+1}) ⊗_ℂ Ω^•_{X₀^an/ℂ}`.
The associated graded augmentation is a quasi-isomorphism by `holomorphicPoincare`; induction
through this finite filtration proves the augmentation over `A`. Apply
`boundedOperatorHyperGaga` to the bounded relative complex (properness bounds the relative
dimension), then `sheafSingularComparison` with coefficients in the additive group of `A`.
Finite-dimensional coefficient extension gives the final tensor isomorphism and the length
formula (Deligne 1968, Lemma (5.5.3) and equation (5.5.4), printed p. 124).
*Needs:* DerivedDeRhamCohomology Layer 2 (`DeRham.complex`, `DeRham.complexMap`);
AlgebraicModuliForArithmeticGeometry §§7.10.1 and 7.10.3 (`ComplexAnalyticSpace`,
`complexSchemeAnalytification`, its nilpotent and étale comparisons, `properSchemeGagaPushforward`);
`DifferentialOperatorAnalytification`; `boundedOperatorHyperGaga`; `holomorphicPoincare`;
`sheafSingularComparison`; AlgebraicTopology Stage 8 (finite CW type of the compact special fibre);
Mathlib `Module.length`.

**Checks.**

- For `A = ℂ`, the maps recover `holomorphicPoincare` and `properDeRhamBetti`.
- For `A = ℂ[ε]/(ε²)` and `X = P¹_A`, degrees zero and two are each free rank-one `A`-modules
  of length two, and degree one is zero. Reduction sends these modules to the corresponding
  one-dimensional `ℂ`-cohomology; discarding `ε` before comparison loses their length.
- For `X = Spec A` over itself, the relative complex is `A` in degree zero and zero otherwise;
  its augmentation is the identity. For any local coefficient map `A → B` of the stated type,
  this comparison becomes the identity on `B` after tensoring with `B`.

### Examples (C5.1–C5.2)

- `H¹_dR(G_m)` is one-dimensional, spanned by `dz/z`; its period on the positive loop is `2πi`, so the
  rational Betti lattice is `ℚ · (2πi)⁻¹[dz/z]` under the comparison.
- For the product of a compact Riemann surface of genus `g` with a smooth base, `R¹f_*ℤ` has stalks
  `ℤ^{2g}` and trivial monodromy; `R¹f_*ℂ` has rank `2g` (a complex dimension, not a generation count).
- For a constant elliptic family `E × S → S`, a fixed fibre class times a holomorphic coefficient is
  carried to the corresponding Betti class times that coefficient, and `∇` differentiates the
  coefficient.
- A singular proper scheme (the nodal cubic) is not assigned the ordinary de Rham comparison.

### C5.3 Geometric Hodge theory

Prove `compactEllipticHodge`: let `M` be a compact oriented Riemannian manifold without boundary and
`P` the Hodge Laplacian on `r`-forms (C1.2), or more generally a formally self-adjoint second-order
operator on a Hermitian vector bundle whose principal symbol is `|ξ|²` times the identity. Then, with
Sobolev spaces `Hˢ` defined through finitely many trivializations and a partition of unity:
(1) shifted coercivity: there exist operator-dependent constants `c > 0` and `λ ≥ 0`
such that `c ‖u‖²_{H¹} ≤ Re ⟨Pu, u⟩ + λ ‖u‖²_{L²}` for every smooth section `u`;
(2) regularity: for every integer `s ≥ 0`, if `u ∈ L²` and `Pu ∈ Hˢ` weakly,
then `u ∈ H^{s+2}` and `‖u‖_{H^{s+2}} ≤ C_s(‖Pu‖_{Hˢ} + ‖u‖_{L²})`, so weak solutions
with smooth `Pu` are smooth;
(3) Rellich: `H^{s+1} → Hˢ` is compact; (4) `ker P` is finite-dimensional and consists of smooth
sections, `P` maps the smooth sections orthogonal to `ker P` bijectively onto themselves, and the inverse
is bounded from `Hˢ ∩ (ker P)^⊥` to `H^{s+2} ∩ (ker P)^⊥`. The shift in (1) is auxiliary:
the kernel and inverse in (4) belong to `P`, not to `P + λ id`. For the nonnegative Hodge
Laplacian one can choose `λ = 1` after adjusting `c`. In local frames the operator is `−Σ gⁱʲ ∂ᵢ∂ⱼ` times the identity plus lower
order terms, so the scalar Euclidean estimates of the PDE roadmap apply componentwise up to terms
absorbed by the partition of unity and an operator-dependent `L²` term in (1);
compactness then gives (3)–(4) (Demailly, VI.1.5–1.8,
pp. 288–289, for formal adjoints, symbols and ellipticity; VI.2.1–2.4, pp. 289–290, where 2.1–2.3
are stated with references to the standard texts and 2.4 is proved; VI.2.3 supplies
the graph-norm estimate in (2); (1) follows from the positive scalar principal symbol and
absorption of lower-order terms).
*Needs:* `HodgeLaplacian`; TauCetiRoadmap.PDE (Lane A: Sobolev spaces and Rellich; Lane D: Gårding;
Lane E: interior regularity).

**Checks.**

- For the nonnegative Hodge Laplacian on the standard circle, integration by parts gives
  `⟨Pu,u⟩ = ‖u'‖²_{L²}` and the usual `H¹` norm satisfies (1) with `c = λ = 1`.
- For `P = −d²/dθ² − 2 id` on the trivial line bundle over the standard circle and `u = 1`,
  `Re ⟨Pu,u⟩ + ‖u‖²_{L²} = −‖u‖²_{L²}`. The coefficient-one estimate fails, while
  `λ = 3`, `c = 1` gives (1) for every smooth section with the usual `H¹` norm.
- For `P = −d²/dθ² − id`, `ker P` is spanned by the modes `e^{iθ}`, `e^{-iθ}`.
  The shift `λ = 2` makes (1) coercive but gives `ker(P + 2 id) = 0`; the inverse in (4)
  still excludes the original two modes.

Define `HarmonicGreen` on a compact oriented Riemannian manifold without boundary: the harmonic
projection `H_r` onto `ℋʳ = ker Δ_r` (finite-dimensional, smooth) and the Green operator `G_r`, zero on
`ℋʳ` and the inverse of `Δ_r` on its orthogonal complement. Then `id = H + ΔG = H + GΔ` on smooth forms,
`G` commutes with `d` and `δ`, every smooth form decomposes orthogonally as harmonic plus exact plus
coexact, and each de Rham class has a unique harmonic representative. The API is
`HarmonicGreen.projection_idempotent` (`H² = H`, `H` self-adjoint), `HarmonicGreen.green_identity`
(`ΔG = GΔ = id − H`) and `HarmonicGreen.cohomologyEquiv` (`ℋʳ → H^r_dR(M)` of DifferentialGeometry is an
isomorphism) (Demailly, VI.2.4, pp. 289–290; VI.3.15–3.17, pp. 294–295). *Needs:* `compactEllipticHodge`;
`HodgeLaplacian`; TauCetiRoadmap.DifferentialGeometry (`deRhamCohomology`, Layer 6).

**Checks.**

- `HarmonicGreen.point`: on a point, `H₀ = id` and `G₀ = 0`.
- `HarmonicGreen.circle`: on the unit circle with its standard metric, the harmonic `1`-forms are the
  one-dimensional span of `dθ`, and the harmonic functions are the constants.
- `HarmonicGreen.projectiveLine`: on `P¹` with the Fubini–Study metric, harmonic `1`-forms vanish while
  harmonic `0`- and `2`-forms are one-dimensional (constants and multiples of the volume form).

Prove `ddbarLemma`: on a compact Kähler manifold without boundary, a smooth complex form `α`
of pure type `(p,q)` with `dα = 0` has equivalent d-, ∂- and ∂̄-exactness, each equivalent to
the existence of a smooth form `β` of type `(p−1,q−1)` with `α = ∂∂̄β`.
Spaces of forms with a negative bidegree are zero. Derive the equivalence
from the harmonic/Green decomposition and the Kähler identities: exactness makes the harmonic
projection vanish, and the identities eliminate the coexact component in the successive
`∂̄` and `∂` decompositions. This also identifies exactness with orthogonality to harmonic
`(p,q)`-forms (Demailly, VI.8.6 and proof, p. 311). *Needs:* `HarmonicGreen`; `kaehlerIdentities`.

**Checks.**

- For a smooth function `f`, `∂∂̄f = d(∂̄f)` is a d-closed d-exact `(1,1)`-form.
- When `p = 0` or `q = 0`, a d-closed d-exact `(p,q)`-form is zero; in particular on a point
  a degree-zero form is exact only when it vanishes.
- On `P¹` the Fubini–Study form has positive integral, so it is neither d-exact nor `∂∂̄`-exact.

Prove `kaehlerHodgeDecomposition`: for a compact Kähler manifold `T` and each `n`,
`H^n_dR(T, ℂ) = ⊕_{p+q=n} ℋ^{p,q}`, the harmonic forms of type `(p,q)`, and `ℋ^{p,q} ≅ H^q(T, Ω^p_T)`
canonically; complex conjugation exchanges `ℋ^{p,q}` and `ℋ^{q,p}`. The Hodge filtration
`F^p = ⊕_{p' ≥ p} ℋ^{p',n−p'}` and its conjugate are opposed, so `(H^n(T, ℚ), F)` is a pure Hodge
structure of weight `n` in the sense of `TauCeti.Hodge.HodgeStructureOn` (with the conjugation
`TauCeti.Hodge.Conjugation` induced by the real structure), and the Hodge-to-de Rham spectral sequence
degenerates at `E₁`. Because `Δ_d = 2Δ_∂̄` preserves bidegree (`kaehlerIdentities`), the harmonic
representative splits by type; Dolbeault's resolution (`localDolbeault`) identifies the pieces with
coherent cohomology; `ddbarLemma` gives filtration compatibility (Demailly, VI.8.1–8.6,
pp. 310–311). On a general compact complex manifold, `E₁`-degeneration of the Hodge-to-de Rham
spectral sequence (Demailly, VI.11.3, pp. 322–323) does not by itself give Hodge symmetry or a
splitting by harmonic forms; Demailly's strong Hodge decomposition (VI.12.5, p. 326) is the notion
that does, and compact Kähler manifolds have it. *Needs:* `HarmonicGreen`; `kaehlerIdentities`;
`ddbarLemma`; `localDolbeault`; Tau Ceti
`TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.Conjugation`.

Prove `properPureHodge`: for a smooth proper scheme `X` over `ℂ`, projective or not, `H^n_sing(X^an, ℚ)`
carries a pure Hodge structure of weight `n` whose Hodge filtration is, under `properDeRhamBetti`, the
filtration of `H^n_dR(X/ℂ)` by form degree (the image of the hypercohomology of `Ω^{≥p}_X`). A
nonprojective `X^an` need not be Kähler, so the structure is transported: Chow's lemma and resolution of
singularities in characteristic zero give a smooth projective `Y` with a birational proper `π : Y → X`;
`π^*` is injective on cohomology with a retraction given by the trace (Poincaré duality on Betti
cohomology). On Hodge cohomology specialize SchemeAndStackFoundations §§2.19–2.20's coherent
duality and smooth dualizing modules to construct the derived trace and its induced maps
`Tr_π : H^q(Y, Ω_Y^p) → H^q(X, Ω_X^p)` with `Tr_π ∘ π^* = id`, by transposing pullback under
Serre duality. The derived composite induces an endomorphism of the locally free sheaf `Ω_X^p`
which is the identity on a dense open, hence everywhere (Deligne 1968, (4.2) and Proposition 4.3,
printed p. 120). Pullback is compatible with the algebraic filtrations, and the Kähler
Hodge structure of `Y^an` restricts (Deligne 1968, Proposition 5.3, printed pp. 121–123). The completed HodgeStructures roadmap
supplies only the linear algebra; no geometric theorem is attributed to it. *Needs:*
`kaehlerHodgeDecomposition`; `properDeRhamBetti`; `multiplicativePeriodInterface` (trace);
AlgebraicModuliForArithmeticGeometry Layer 2 (`devissageViaChow`) and Layer 9 (resolution);
SchemeAndStackFoundations §§2.19–2.20 (coherent duality, trace and Serre duality), §4.12
(Chow's lemma); Tau Ceti `TauCeti.Hodge.HodgeStructureOn`.

Prove `relativeHodgeBundles` (Deligne): let `f : X → S` be smooth and proper with `S` locally Noetherian
over a field of characteristic zero; `S` may be nonreduced. Then each `R^q f_*Ω^p_{X/S}` is finite
locally free and its formation commutes with arbitrary base change `S' → S`; the relative
Hodge-to-de Rham spectral sequence `E₁^{p,q} = R^q f_*Ω^p_{X/S} ⇒ R^{p+q} f_*Ω^•_{X/S}` degenerates at
`E₁`, and each step of the Hodge filtration of `H^n_dR(X/S)` is a locally direct summand compatible with
base change. If a finite group whose order is invertible on `S` acts on `X` over `S`, each isotypic
summand cut out by a character idempotent defined over the coefficient field is again finite locally free and inherits the filtration and the comparison.
Reduce by Noetherian approximation to `S` of finite type, then by completion and formal functions
to Artin local thickenings of points. Choose a coefficient field in the equicharacteristic Artin
ring, descend the finite data to a finitely generated characteristic-zero subfield and embed that
subfield into `ℂ`; faithful field extension reduces to the Artin `ℂ`-algebras of `artinDeRhamBetti`.
That comparison supplies the total de Rham length. The bounds
`length_A H^q(X, Ω^p_{X/A}) ≤ length_A(A) · dim_ℂ H^q(X₀, Ω^p_{X₀/ℂ})`, with equality forcing
freeness, together with the spectral-sequence length inequality and `properPureHodge` on `X₀`,
force equality in every bound, degeneration and freeness. Coherent base change and formal
functions then give local freeness and arbitrary base change on `S`; idempotents of the group
algebra cut out direct summands (Deligne 1968, Theorem 5.5 and proof, printed pp. 123–125; the
character summands are the argument just given, and Qian, *Potential automorphy for GL_n*, Lemma
3.10(2), printed p. 1266, applies them to the Dwork family). *Needs:* `properPureHodge`;
`artinDeRhamBetti`; TauCetiRoadmap.JacobianChallenge (Layer C, cohomology and base change,
formal functions); SchemeAndStackFoundations §0.9 (Noetherian approximation);
Mathlib
`AlgebraicGeometry.IsLocallyNoetherian`, `SheafOfModules.IsLocallyFree`.

### C5.4 Integration over analytic cycles and the Chern normalisation

**Test forms and current calculus — `CurrentCalculus`.** On the same smooth complex manifolds
`M` as the forms API, of complex dimension `n`, construct compactly supported smooth complex
test forms with the locally convex inductive-limit topology over compact supports: on a fixed
compact support, the seminorms bound every derivative of every coefficient in finitely many charts.
A current of degree `k` is a continuous `ℂ`-linear functional on test forms of degree `2n − k`,
with the compact-convergence dual topology; weak convergence means convergence on each test form.
In a real chart identify it with a finite family of Mathlib `Distribution Ω ℂ ⊤` coefficients,
complexifying the real-valued `TestFunction Ω ℝ ⊤` arguments. Prove independence of coordinates,
restriction, extension by zero of test forms on opens, and gluing of compatible local currents
using partitions of unity. These constructions use DifferentialGeometry's form bundles.

Pin degree `k` versus dimension `2n − k`, and bidegree `(a,b)` versus bidimension `(n−a,n−b)`;
a current of bidegree `(a,b)` acts on test forms of type `(n−a,n−b)`. Define
`(dT)(η) = (−1)^{k+1} T(dη)`, and the same duality sign for `∂T` and `∂̄T`, the type components
of `dT`. Prove `d² = ∂² = ∂̄² = 0` and `∂∂̄ + ∂̄∂ = 0`, continuity and compatibility with
restriction and weak limits. Embed locally integrable forms by `T_α(η) = ∫_M α ∧ η`, injectively
up to almost-everywhere equality; for smooth forms `dT_α = T_{dα}`, also for `∂` and `∂̄`.
For a smooth form `β`, set `(T ∧ β)(η) = T(β ∧ η)`; prove graded commutation with left wedge,
the graded Leibniz laws and `supp(T ∧ β) ⊆ supp T ∩ supp β`. Construct the integration current
of a closed smooth oriented submanifold by the existing manifold integral, with its Stokes
identity `d[Z] = (−1)^{2n−dim_ℝ Z+1}[∂Z]` when `Z` has smooth boundary. This supplies the
integration-by-parts pairing used by the cycle and Poincaré–Lelong targets.

For every `0 ≤ p ≤ n`, strongly positive `(p,p)`-forms are sums with nonnegative coefficients
of `iα₁ ∧ ᾱ₁ ∧ ⋯ ∧ iα_p ∧ ᾱ_p`, where the `α_j` have type `(1,0)`;
positive forms pair nonnegatively with complementary
strongly positive forms. A positive current of bidimension `(p,p)` acts nonnegatively on
strongly positive test forms; a strongly positive current acts nonnegatively on positive test
forms. Keep these cones distinct in intermediate degrees and prove compatibility with smooth
forms, restriction and weak limits. Prove that positive currents have order zero, hence
locally finite complex Radon-measure coefficients in charts. For a Hermitian metric with
fundamental form `ω = (i/2)Σ h_jk dz_j ∧ dz̄_k`, define its trace mass measure by
`T ∧ ω^p/p!`. On compact sets this controls the total variations of all coefficient measures,
and two such metrics give comparable mass measures. Thus finiteness near a deleted closed set
is independent of the metric. For an order-zero current on `M ∖ E` with coefficient variations
finite near `E`, extend those measures by zero to construct a coordinate-independent current
on `M`, assigning no mass to `E`; positivity is preserved. Closedness of this extension is the
separate theorem `closedCurrentExtension`.

In complex coordinate opens construct convolution regularization by nonnegative smooth kernels of
integral one, on smaller opens. Prove weak convergence, commutation with `d`, `∂`, `∂̄`,
preservation of positivity and closedness there, and local mass bounds. Include dominated
convergence for bounded smooth cutoffs tending to one off `E` in the finite-mass zero extension,
and the positive-current Cauchy–Schwarz bounds for the mixed test forms used in Skoda–El Mir.
Use the same convolution to regularize locally integrable plurisubharmonic functions on smaller
complex coordinate opens, retaining plurisubharmonicity and their distributional derivatives
(Demailly, I §2.A–B, pp. 13–16, I §2.D.3, p. 19, I (3.20), p. 25; III (1.1)–(1.14),
pp. 129–133, (1.21)–(1.22), pp. 135–136; III (2.2)–(2.3) and proof, pp. 138–140).
*Needs:* DifferentialGeometry Layers 0–2 and 5 (forms, orientation, partitions of unity,
integration and Stokes); Mathlib `TestFunction`, `Distribution`, `Distribution.lineDerivCLM`,
`Distribution.ofFun`, `Distribution.delta`, convolution and Radon measures.

**Checks.**

- For a smooth `k`-form `α`, `(dT_α)(η) = (−1)^{k+1}∫ α ∧ dη = ∫ dα ∧ η`.
  In a chart a scalar coefficient derivative is Mathlib's negative transpose
  `Distribution.lineDerivCLM`, with no second distribution carrier.
- The point current `[a]`, of bidimension `(0,0)` and bidegree `(n,n)`, is `f ↦ f(a)`;
  its chart coefficient is `Distribution.delta a`, it is positive and has trace mass one.
- For the closed coordinate submanifold `Z = ℂ^p × {0} ⊂ ℂ^n`, `[Z](η)` is the
  DifferentialGeometry integral of the restricted form, is closed and strongly positive,
  and its trace mass for the Euclidean metric is the usual volume on `Z`.
- Extending the positive measure `|z|⁻² dx dy` from a punctured disc by zero fails the local
  finite-mass hypothesis at zero; positivity on the complement alone does not provide an extension.

Prove `closedCurrentExtension` (Skoda–El Mir): let `E` be a closed complete pluripolar subset of a
complex manifold `M` (locally `{v = −∞}` for a plurisubharmonic `v`; analytic subsets qualify) and `Θ` a
closed positive current on `M ∖ E` with locally finite mass near every point of `E`. Then the extension
of `Θ` by zero across `E` is a closed positive current on `M`. Finite mass cannot be dropped. Use cutoffs
built from the plurisubharmonic function with pole set `E` (smoothed locally by convolution); Stokes and
Cauchy–Schwarz bound the error by the mass on shrinking neighbourhoods (Demailly, III.2.3 and its proof,
pp. 138–140). *Needs:* `CurrentCalculus`; `remmertSteinExtension` (local structure of analytic sets);
TauCetiRoadmap.DifferentialGeometry (forms, Stokes); Mathlib convolution.

Define `AnalyticCycleIntegration` for a pure `d`-dimensional analytic subset `Z` of a complex manifold
`M`: the current `[Z](η) = ∫_{Z_reg} η` on compactly supported smooth `2d`-forms, with the complex
orientation of `Z_reg`. The integral converges near the singular locus and `[Z]` is a closed positive
current of bidimension `(d,d)`; for a cycle `Σ mᵢZᵢ` take `Σ mᵢ[Zᵢ]`. Nilpotent structure enters only
through the multiplicities of the cycle. Local mass is bounded by the sheet number of a finite
projection; closedness follows from `closedCurrentExtension` applied across `Z_sing`. The API is
`AnalyticCycleIntegration.regular` (on a closed submanifold it is the manifold integral of
DifferentialGeometry), `AnalyticCycleIntegration.add` (additivity in multiplicities) and
`AnalyticCycleIntegration.closed` (`[Z](dη) = 0`) (Demailly, III.2.1–2.3, pp. 138–140, and
III.2.5–2.7, p. 140). *Needs:* `analyticSetGeometry`; `CurrentCalculus`; `closedCurrentExtension`; `remmertSteinExtension`;
TauCetiRoadmap.DifferentialGeometry (integration, Layer 5).

**Checks.**

- `AnalyticCycleIntegration.point`: for a reduced point `Z = {a}`, `[Z](f) = f(a)` on functions.
- `AnalyticCycleIntegration.line`: for the coordinate line `{z₂ = 0} ⊂ ℂ²` and
  `η = χ(|z₁|² + |z₂|²) (i/2) dz₁ ∧ dz̄₁` with `χ ≥ 0` smooth and compactly supported and `χ(0) > 0`,
  `[Z](η) > 0`: the complex orientation `dx ∧ dy = (i/2)dz ∧ dz̄` is used, not its negative.
- `AnalyticCycleIntegration.doubleLine`: the cycle `2[L]` integrates to twice `[L]`; integrating over the
  reduced regular locus of the double line would lose the multiplicity.

Prove `semipositiveWedge`: with the complex orientation, products of semipositive real `(1,1)`-forms
are positive, and if `α`, `β` and `α − β` are semipositive `(1,1)`-forms on a neighbourhood of a pure
`d`-dimensional analytic set `Z`, then `∫_Z χ βᵈ ≤ ∫_Z χ αᵈ` for every nonnegative compactly supported
smooth `χ`; every mixed term `(α − β)^j ∧ β^{d−j}` integrates nonnegatively. Pointwise this is
`det B ≤ det A` for Hermitian matrices `0 ≤ B ≤ A` (`det_le_det_of_posSemidef`) (Demailly, III.1.7–1.12, pp. 131–132;
Dimitrov–Gao–Habegger, proof of Proposition 4.2, display (4.3), PDF p. 17). *Needs:*
`AnalyticCycleIntegration`;
Mathlib `Matrix.PosSemidef`.

Prove `lelongPoincareSection`: let `M` be a complex manifold, `(L, h)` a Hermitian holomorphic line
bundle on `M` with Chern curvature `Θ(L, h)` (`ChernConnection`) and `c₁(L, h) = (i/2π)Θ(L, h)`, and
`s` a meromorphic section of `L` vanishing identically on no connected component of `M`. Its divisor
`div s = Σ mⱼZⱼ` runs over the irreducible components `Zⱼ` of the zero and pole sets, `mⱼ` the order
of vanishing (negative along poles) of the coefficient of `s` in a local frame at a generic point of
`Zⱼ`. Then `log ‖s‖_h` is locally integrable and, as currents of bidegree `(1,1)`,
`(i/π)∂∂̄ log ‖s‖_h = [div s] − c₁(L, h)`, with `[div s] = Σ mⱼ[Zⱼ]` (`AnalyticCycleIntegration`).
The local and the global equation differ. For a local meromorphic coefficient `f` (a function,
`s = f e` in a holomorphic frame `e` on an open `Ω`, `f` vanishing identically on no component of
`Ω`) the equation is `(i/π)∂∂̄ log|f| = [div f]`, with no curvature term; for the global section `s`
the
curvature term is present, since `log ‖s‖_h = log|f| + log ‖e‖_h` and
`(i/π)∂∂̄ log ‖e‖_h = −c₁(L, h)` on `Ω` (from `ChernConnection.lineBundleCurvature` with
`‖e‖²_h = e^{−φ}`). Consequently `[div s]` and `c₁(L, h)` agree on closed forms:
`Σ mⱼ ∫_{Zⱼ} η = ∫_M c₁(L, h) ∧ η` for every closed compactly supported smooth `(2n − 2)`-form `η`,
`n = dim_ℂ M`, because the left side of the equation is `d((i/π)∂̄ log ‖s‖_h)`. The function equation is
proved near a regular point of a component, in coordinates where it is `w₁ = 0` and `f = u w₁^{mⱼ}` with
`u` invertible (`convergentWeierstrassPreparation`), from the one-variable identity
`(i/π)∂∂̄ log|z| = [0]` (Cauchy's formula for `1/z`); the difference of the two sides is then a
closed current of order zero (away from the zero and pole sets both sides vanish) supported in the
singular locus of the support of the divisor, of dimension `< n − 1`, and it vanishes by the first
support theorem (a normal current of bidimension `(p,p)` supported in an analytic set of dimension
`< p` is zero), which is proved with this target (Demailly, III.2.10–2.11, p. 141, for the support
theorem; III.2.15 and proof, pp. 143–144, for meromorphic functions;
V.13.1–13.4, p. 271, for sections of Hermitian line bundles, equation (13.2) and Theorem 13.4).
*Needs:* `CurrentCalculus`; `AnalyticCycleIntegration`; `ChernConnection`; AlgebraicModuliForArithmeticGeometry
§7.10.1 `convergentWeierstrassPreparation`; TauCetiRoadmap.DifferentialGeometry (forms, Stokes);
Mathlib `circleIntegral`.

**Checks.**

- `lelongPoincareSection.projectiveLine`: for `O(1)` on `P¹` with the Fubini–Study metric and the
  section `z₀`, vanishing simply at one point, the left side integrates to `0` over `P¹` (it is `d` of
  a current on a compact manifold), `[div z₀]` to `1` and `c₁(O(1), h)` to `1`
  (`fubiniStudy_integral_eq_one`); the function equation applied to the section would assert `0 = 1`.
- `lelongPoincareSection.coordinate`: for the trivial bundle on `ℂ` with constant metric, `f = zᵐ`
  gives `m[0]` and `f = z/(z − 1)` gives `[0] − [1]`; poles count negatively.
- `lelongPoincareSection.frame`: for a nowhere vanishing holomorphic `e` with `‖e‖²_h = e^{−|z|²}` on
  `ℂ`, `(i/π)∂∂̄ log ‖e‖_h = −(i/2π) dz ∧ dz̄ = −c₁(L, h)`, and `c₁(L, h)` is positive, matching
  `ChernConnection.lineBundleCurvature`.

Define `integralLineBundleChernClass L ∈ H²_sing(M, ℤ)` for a holomorphic line bundle `L`
on a complex manifold `M` by forgetting to SmoothBundlesConnections B2's native smooth
complex `VectorBundle`/`ContMDiffVectorBundle` carrier. Construct this forgetful adapter
from C0.3's holomorphic bundle dictionary by restricting scalars on the base charts;
its maps remain fibrewise complex-linear. Prove compatibility with pullback, tensor, dual
and the trivial line. Equip the underlying line with a smooth Hermitian metric only to form
its unit-frame circle bundle: let `P_L` be the right unit-frame bundle of the dual smooth
line. Identify `P_L ×_Circle ℂ` for the inverse character `z ↦ z⁻¹` with the underlying
smooth `L`. Changes of metric induce the same bundle class.

Consume SmoothBundlesConnections B6.1–B6.4's integral exponential/Čech-to-singular
construction and define the class using its `c₁(P_L)`. Prove equality in integral singular
cohomology with CharacteristicClasses C1.5/C3's first Chern class of the underlying
complex line, before coefficient change. Pullback, tensor additivity, dual negation and
triviality commute with this equality. The generic exponential sequence, cover refinement,
Čech comparison and curvature/Bockstein comparison have their single owner in
SmoothBundlesConnections B6; the holomorphic adapter and integral identification are here.

Identify the cocycles explicitly. If `g_αβ` changes β-coordinates to α-coordinates in unitary
frames of `L` and `g_αβ = exp(2πiu_αβ)`, then the dual-frame principal cocycle is
`g^P_αβ = g_αβ⁻¹` with angle `φ^P_αβ = −2πu_αβ`. B6's inverse-character class has
integer representative `−δφ^P/(2π) = δu`, where
`(δu)_αβγ = u_βγ − u_αγ + u_αβ`. Prove this equality through the shared integral
Čech-to-singular map, its refinements and coefficient connecting maps. The inclusion of
unitary transitions into smooth nonzero complex transitions identifies this class with
the connecting image of `[g]` for `u ↦ exp(2πiu)` in the smooth complex exponential
sequence (the positive real factor has a global smooth logarithm). No metric or meromorphic
section is part of the integral class.

For C1.3's Chern connection, transport the conjugate-first bundle metric
`h(s,t) = s* H t` to B2–B4's convention; the linear-first Hodge pairing is `h(t,s)`.
On `P_L`, the dual connection's real circle curvature `F_P` satisfies
`Θ(L) = −i F_P`. B6.1–B6.3's Čech–singular–de Rham comparison therefore sends the
real coefficient image of the integral class to `[(i/2π)Θ(L,h)] = [F_P/(2π)]`;
extending coefficients gives the complex comparison. Prove this square uses
DifferentialGeometry's integration comparison and C5.1's `sheafSingularComparison`.
Changing the metric changes the curvature representative by an exact form
(Demailly, V.8.2 and V.9.2–9.5, printed pp. 264–265; IV.6.11 for the Čech–de Rham sign;
V.12.1–12.2, pp. 268–269 for the Chern connection).
*Needs:* `holomorphicBundleDictionary`; `ChernConnection`; `sheafSingularComparison`;
SmoothBundlesConnections B2–B4 and B6.1–B6.4; CharacteristicClasses C1.5 and C3;
DifferentialGeometry Layers 6–8.

**Checks.**

- The trivial holomorphic line has the shared integral class zero. On `ℂ`, the metric
  `‖1‖² = e^{−|z|²}` has nonzero exact normalized curvature, still with integral class zero.
- For `O(1)` on `P¹`, `P_L` is the Hopf bundle of frames of `O(−1)`; the shared
  inverse-character class and `integralLineBundleChernClass O(1)` are the positive integral
  generator, pairing to one (`fubiniStudy_integral_eq_one`).
- For any right circle bundle `P`, its inverse-character line has class `c₁(P)` and its
  standard-character line has class `−c₁(P)`. Thus the underlying dual of `L` has class
  `−integralLineBundleChernClass L`, and `L ⊗ L∨` has integral class zero.
- For a flat circle cocycle with holonomy class `h` and nonzero torsion Bockstein
  `β(h)`, the shared integral representatives `−δφ^P/(2π)` and `δu` coincide and represent
  `β(h)`; their real images vanish. Equality only after real coefficient change would miss
  this test. Use B6.4's torsion cocycle and its connecting-map comparison.

Prove `chernFubiniStudyIntersection`: for a Hermitian holomorphic line bundle `L` on a complex
manifold, the form `(i/2π)Θ(L)` of its Chern connection is closed and its de Rham class is the image of the integral
first Chern class `integralLineBundleChernClass L`; on `Pʳ` the normalised Fubini–Study form
represents `c₁(O(1))` and integrates to `1` over a line (in the affine chart, `∫_ℂ π⁻¹(1 + |z|²)⁻² dλ = 1`,
`fubiniStudy_integral_eq_one`); and for a projective `d`-dimensional algebraic cycle `Z` (with multiplicities) and a
line bundle `L`, `∫_Z c₁(L, h)ᵈ` equals the algebraic intersection degree `(c₁(L)ᵈ · Z)`, with mixed
degrees and Segre pullbacks normalised the same way. The assertion on any complex manifold uses
the integral class and Čech–curvature comparison of `integralLineBundleChernClass`.
For the projective intersection assertion, `lelongPoincareSection` identifies the class of
the curvature form with that of the divisor current — for a global section `s` of `(L, h)` through
`(i/π)∂∂̄ log ‖s‖_h = [div s] − c₁(L, h)`, not through the function equation
`(i/π)∂∂̄ log|f| = [div f]`, which holds only for a local coefficient `f` — and induction on dimension
cuts by divisors (Demailly, V.9.2–9.5, pp. 264–265; V.13.2–13.9, pp. 271–273; V.15.8, V.15.10
and V.15.12 and proofs, pp. 279–281). *Needs:*
`AnalyticCycleIntegration`; `semipositiveWedge`; `lelongPoincareSection`; `ChernConnection`;
`integralLineBundleChernClass`; `multiplicativePeriodInterface`;
`projectiveChowNonreduced`; SchemeAndStackFoundations Layer 5 (degrees and intersection products);
AlgebraicModuliForArithmeticGeometry Layer 1.

Prove `dghIntegrationApplication`: in the setting of Dimitrov–Gao–Habegger, Proposition 4.2, the volume
estimate on an analytic component is obtained as follows: represent the line bundle on the product of
projective spaces by the Segre pullback of the normalised Fubini–Study form, keep the pullback along
the paper's second projection (the bundle `O(0,1,1)` on the triple product, not `O(1,1,1)`), apply
`semipositiveWedge` to the semipositive difference of the two forms compared there, with compact
support supplied by a cutoff pulled back from the base and the integrals over the smooth locus made
finite by Lelong's theorem (`AnalyticCycleIntegration`), and identify the total with the algebraic
intersection degree by `chernFubiniStudyIntersection` after discarding the contribution of the
lower-dimensional boundary (Dimitrov–Gao–Habegger, Proposition 4.2 and proof, PDF pp. 16–19, with
the integration–intersection identity at (4.9), p. 18).
*Needs:* `AnalyticCycleIntegration`; `semipositiveWedge`; `chernFubiniStudyIntersection`.

### Examples (C5.3–C5.4)

- For an elliptic curve `E`, `H¹(E, ℂ)` splits into the one-dimensional `(1,0)` part spanned by the
  invariant differential and its conjugate; for `P¹`, `H¹ = 0` and `H²` has type `(1,1)`.
- A dual-number base `Spec ℂ[ε]/(ε²)` satisfies the local freeness and base change of
  `relativeHodgeBundles`; dimension counting on reduced fibres is not a proof of it. An averaging
  projector is used only when the group order is invertible; a character projector also requires
  the corresponding character to be defined over the coefficient field.
- On `P¹`, the normalised curvature of `O(1)` integrates to `1` and that of `O(m)` to `m`; a doubled cycle
  contributes twice its reduced degree.
- For `α = tω`, `β = sω` with `t ≥ s ≥ 0`, `∫_Z χ βᵈ = sᵈ ∫_Z χ ωᵈ ≤ tᵈ ∫_Z χ ωᵈ`.
- The integration current of a complex line extends across a deleted point (finite mass) and stays
  closed.

### C5.5 Logarithmic structures

The algebraic carrier and its basic API are supplied by CrystallineCohomology
CR.5:log-algebra.1–.4 and CR.5.1, over arbitrary characteristics. On algebraic sites the
names `PrelogStructure`, `LogStructure`, `AssociatedLog`, `LogPullback`, `FineLogChart`,
`DivisorialLog`, `LogSmooth`, `logChartCriterion` and `LogDeRham` below are specializations
or aliases of that API. Their formulas and checks specify the shared interface, rather than
separate constructions. On complex analytic ringed spaces use the same monoid-sheaf and
universal-derivation definitions, transported through `logAnalytification`. This roadmap
owns that analytic transport, the SNC identification and boundedness of the specialized
complex, and `logDifferentialTransitivitySplit` on the shared carrier.

Define and prove `logAnalytification`: for a fine log scheme `X` locally of finite type
over `ℂ`, transport the shared étale monoid sheaf to `X^an` and logify its structure map
along `φ_X`. On an étale chart `P → O_X`, this is the associated analytic log structure
of `P → O_{X^an}`; analytified étale charts are local biholomorphisms, and their descent
identifications make this construction independent of charts. It commutes with log
pullback. For a morphism `X → S` of such log schemes, the universal pair `(d, dlog)` induces
`(Ω¹_log(X/S))^an ≅ Ω¹_log(X^an/S^an)`, and exterior powers and
`DifferentialOperatorAnalytification` give the same identification of log de Rham complexes.
For an SNC pair, identify this log structure with the analytic divisorial structure and
the complex with `Ω^•_{X^an}(log D^an)`. Residue along a labelled component puts its
`dlog` factor first: `Res_z(dlog z ∧ η) = η|_{z=0}`. These are identifications of the
supplier's carrier and operations (Kato, §§1.3–1.9, pp. 193–196, for logification,
inverse image, the universal quotient and its complex; Deligne 1970, II.6.6,
pp. 100–101, for local differential-operator analytification; the chart descent and
residue compatibility follow from these formulas). *Needs:* CrystallineCohomology
CR.5:log-algebra.1–.4 and CR.5.1; `CoherentAnalytification`;
`DifferentialOperatorAnalytification`; AlgebraicModuliForArithmeticGeometry §7.10.1
(`complexSchemeAnalytification.etaleLocalIso`) and §9.5 (`analyticPolydisc`).

**Checks.**

- Trivial log structures give the ordinary Kähler module and `AlgebraicDeRham`; on each
  affine their differential and pullback are `DeRham.complex` and `DeRham.complexMap`.
- The standard log point over the trivial complex point has `ℂ · dlog t` in degree one,
  while its identity relative differential module is zero, on both sides of analytification.
- For the SNC coordinate boundary `xy = 0` in the smooth plane, the shared absolute
  log complex has basis `dlog x`, `dlog y`, with
  `Res_x(dlog x ∧ dlog y) = dlog y` and `Res_y(dlog x ∧ dlog y) = −dlog x`.
  These conventions persist in the analytic complex used in C5.6–C5.7.

Use the shared prelog carrier as `PrelogStructure T`: a sheaf of commutative monoids `M` with a morphism of sheaves of monoids
`α : M → (O_T, ·)`. Non-units, including `0`, are allowed in the image. On a ring `A` with a chart
monoid `P` this is a monoid homomorphism `P → (A, ·)`, not an additive map and not a map into `Aˣ`.
Morphisms commute with the structure maps. The API is `PrelogStructure.structureMap` (multiplicative,
`α(1) = 1`), `PrelogStructure.morphism` (morphisms of monoid sheaves compatible with `α`) and
`PrelogStructure.restrict` (restriction to opens) (Kato, *Logarithmic structures of Fontaine–Illusie*,
in *Algebraic Analysis, Geometry, and Number Theory* (1989), §1.1, printed p. 192). *Needs:*
CrystallineCohomology CR.5:log-algebra.1, “Prelog rings” and “Étale log structures”
(`LogCrystalline.PrelogRing` on rings); SchemeAndStackFoundations Layer 1 (sites of schemes);
Mathlib monoid homomorphisms and sheaves of monoids.

**Checks.**

- `PrelogStructure.trivialChart`: the one-element monoid maps its unit to `1`.
- `PrelogStructure.coordinateChart`: `ℕ → ℂ[z]`, `n ↦ zⁿ`, is a prelog structure on the affine line.
- `PrelogStructure.standardLogpoint`: `ℕ → ℂ`, `n ↦ 0ⁿ` (so `0 ↦ 1` and `n ↦ 0` for `n ≥ 1`) is a
  prelog structure; restricting targets to units would exclude this standard log point.

Use the shared log carrier as `LogStructure T`: a prelog structure for which `α` restricts to an isomorphism
`α⁻¹(O_T^×) → O_T^×` (tested on sections, equivalently on stalks). A morphism of log ringed spaces is a
morphism of ringed spaces with a compatible map from the pulled-back monoid sheaf. The API is
`LogStructure.unitsIso` (the inverse-image unit map is the stated isomorphism), `LogStructure.trivial`
(the trivial log structure `O_T^× ⊆ O_T`) and `LogStructure.restrict` (restriction preserves the unit
condition). On a ring the condition reads: every unit has exactly one preimage
(`LogCrystalline.PrelogRing.IsLog` for the bundled chart; the standard-point chart map
is `standardLogPoint`) (Kato, §1.2–1.5(2), printed pp. 193–194). *Needs:* CrystallineCohomology CR.5:log-algebra.1,
“Étale log structures” (`LogCrystalline.LogStructure`, `LogCrystalline.PrelogRing.IsLog`);
`PrelogStructure`.

**Checks.**

- `LogStructure.trivialUnits`: for the trivial log structure the characteristic monoid
  `M/O_T^×` is the one-element monoid.
- `LogStructure.point`: on a field the trivial log structure is its unit group.
- `LogStructure.rawNChart`: the raw chart `ℕ → ℂ[z]` is not a log structure (it misses the units of
  `ℂ[z]`, namely `ℂ^×`); logification adds them.

The chart condition `LogCrystalline.PrelogRing.IsLog` has the API that the map on inverse images of units is
bijective, hence a monoid isomorphism, is invariant under chart isomorphisms, and agrees with the
sheaf condition on a one-point ringed site. The specialization `standardLogPoint` is
`powersHom ℂ 0`; its API evaluates the identity to `1`, every positive exponent to `0`, and
identifies its logification with `ℂˣ × ℕ` (Kato, §§1.2–1.3, pp. 193–194).

**Checks for chart log structures and the standard point.**

- The inclusion `Aˣ → A` satisfies `LogCrystalline.PrelogRing.IsLog`, including the zero ring where its unit
  group and its multiplicative monoid both have one element.
- The raw standard-point chart does not satisfy `LogCrystalline.PrelogRing.IsLog`: the unit `2 ∈ ℂˣ` has no
  preimage. Its logification adds those missing units.
- The projection from `ℂˣ × Multiplicative (ZMod 2)` to `ℂ` maps onto every unit but has two
  preimages for each one, so it fails `LogCrystalline.PrelogRing.IsLog`; surjectivity alone does not suffice.

**Checks for `standardLogPoint`.**

- Exponent `0` maps to `1`; sending every exponent to zero is not a monoid homomorphism.
- Every positive exponent, including `1` and `2`, maps to `0`, so this chart includes non-units.
- Its logification has monoid `ℂˣ × ℕ` and characteristic monoid `ℕ`; logifying it as the
  trivial log structure would lose the nonzero characteristic generator.

Use shared logification as `AssociatedLog`: for a prelog structure `α : M → O_T`, the log structure
`M^a = M ⊕_{α⁻¹(O_T^×)} O_T^×`, the pushout of commutative monoid sheaves (sheafified), with the induced
map to `O_T`. It is left adjoint to forgetting a log structure to its prelog structure. The API is
`AssociatedLog.unit` (the canonical prelog map `M → M^a`), `AssociatedLog.lift_unique` (prelog maps to a
log structure factor uniquely through `M^a`) and `AssociatedLog.idempotent` (logification of a log
structure is itself) (Kato, §1.3 with the pushout description, printed p. 193). *Needs:*
CrystallineCohomology CR.5:log-algebra.1, “Associated log structures”; `LogStructure`.

**Checks.**

- `AssociatedLog.trivialMonoid`: logifying the one-element chart gives `O_T^×`, the trivial log
  structure.
- `AssociatedLog.coordinate`: logifying `ℕ → O`, `n ↦ zⁿ` on a disc gives characteristic monoid `ℕ` at
  `z = 0` and `0` elsewhere.
- `AssociatedLog.unitChart`: a chart whose generators all map to units logifies to the trivial log
  structure.

Use shared inverse image as `LogPullback`: for a morphism of ringed sites `f : T → S` and a log structure `M` on `S`,
`f^*M` is the logification of `f⁻¹M → f⁻¹O_S → O_T`. It is not `f⁻¹M`: units of `O_T` may come from
non-units of `O_S`. The API is `LogPullback.chart` (a chart pulls back by composing with the ring map
and logifying), `LogPullback.identity` and `LogPullback.composition` (the canonical isomorphisms)
(Kato, §1.4 and §1.6, printed pp. 193–195). *Needs:* CrystallineCohomology
CR.5:log-algebra.1, “Inverse image log structures”; `AssociatedLog`.

**Checks.**

- `LogPullback.openComplement`: the divisorial structure of `z = 0` on a disc pulls back to the trivial
  structure on `{z ≠ 0}`.
- `LogPullback.origin`: its pullback to the origin is the standard log point `ℕ → ℂ`, `1 ↦ 0`.
- `LogPullback.trivial`: the pullback of a trivial log structure is trivial.

Use the shared fine-chart carrier as `FineLogChart`. A commutative monoid is integral if it is cancellative (equivalently, it injects
into its group completion `GrothendieckGroup`), fine if integral and finitely generated, saturated if
integral and `x ∈ P^gp`, `nx ∈ P` for some `n ≥ 1` imply `x ∈ P`. A chart for a log structure `M` is a
fine monoid `P` with a map `P → M` whose logification is an isomorphism (kept as data); `M` is fine if
such charts exist étale locally. Fine does not imply saturated. The API is
`FineLogChart.groupCompletionEmbedding` (integral monoids embed in their group completion),
`FineLogChart.logificationIso` (the chosen chart logifies to `M`) and `FineLogChart.etaleLocal` (fine
charts exist étale locally and pull back along `LogPullback`); the monoid conditions are
`LogCrystalline.IsFineMonoid` and `LogCrystalline.IsSaturatedMonoid` (Kato, §2.1–2.5 and §2.9–2.10, printed pp. 197–200, for
integral and fine monoids and charts; Kato does not use saturation, which is recorded here only to
make explicit that nothing below assumes it). For `LogCrystalline.IsFineMonoid`, the API projects cancellation
and finite generation, transports fineness along monoid isomorphisms, and proves fineness of
finite products. For `IsSaturatedSubmonoid`, the API identifies it with
`AddSubmonoid.NSMulSaturated` in the generated subgroup, transports it along group isomorphisms,
and agrees with `LogCrystalline.IsSaturatedMonoid` for the multiplicative form of the
submonoid. These use the intrinsic group, rather than any chosen larger ambient group.
*Needs:* CrystallineCohomology CR.5:log-algebra.1, “Integral monoids”, “Fine monoids”,
“Saturated monoids” and “Log charts”; `AssociatedLog`; `LogPullback`; Mathlib `Monoid.FG`, `GrothendieckGroup`.

**Checks.**

- `FineLogChart.free`: `ℕʳ` is fine and saturated, including `r = 0`.
- `FineLogChart.unsaturated`: the submonoid of `ℤ` generated by `2` and `3` is fine but not saturated
  (`1 ∈ P^gp` and `2·1 ∈ P`, but `1 ∉ P`).
- Saturation is intrinsic: `2ℕ ⊆ ℤ` is saturated in its generated group `2ℤ`, despite
  `2·1 ∈ 2ℕ` and `1 ∉ 2ℕ`. Testing roots in all of `ℤ` would wrongly exclude it.
- `FineLogChart.noncancellative`: the additive monoid `ℕ ∪ {∞}` with `∞` absorbing is finitely
  generated (by `1` and `∞`) but not integral, since `0 + ∞ = 1 + ∞` while `0 ≠ 1`.

Specialize `LogCrystalline.divisorialLog` as `DivisorialLog D` for a smooth scheme `X` with a strict normal crossings divisor `D` and
`j : U = X ∖ D → X`: the subsheaf `M_D ⊆ (O_X, ·)` of functions invertible on `U`. Locally, with
`D = {z₁ ⋯ z_r = 0}`, it is the logification of `ℕʳ → O_X`, `eᵢ ↦ zᵢ`, so it is fine and saturated. The
API is `DivisorialLog.chart` (at an `r`-fold crossing the chart is `ℕʳ`), `DivisorialLog.offBoundary`
(trivial on `U`) and `DivisorialLog.changeEquation` (multiplying a local equation by a unit gives the
same structure) (Kato, §1.5(1), printed p. 194, and Example 2.5(1), pp. 197–198). *Needs:*
CrystallineCohomology CR.5:log-algebra.4, “Divisorial log structures”
(`LogCrystalline.divisorialLog`); `FineLogChart`; AlgebraicModuliForArithmeticGeometry
Layer 9 (`sncCompactification`, SNC boundaries).

**Checks.**

- `DivisorialLog.empty`: the empty divisor gives the trivial log structure.
- `DivisorialLog.oneBranch`: at a smooth boundary point the characteristic monoid is `ℕ`.
- `DivisorialLog.crossing`: at the origin of `xy = 0 ⊂ A²` the characteristic monoid is `ℕ²`, not `ℕ`.

Use `LogCrystalline.logDifferentials` from CrystallineCohomology CR.5.1: for a morphism of prelog rings `(A, Q) → (B, P)` (structure maps
`α : P → B`, `β : Q → A`), `Ω¹_log = (Ω¹_{B/A} ⊕ (B ⊗_ℤ P^gp)) / R`, where `R` is generated by
`dα(p) − α(p) ⊗ p` for `p ∈ P` and `1 ⊗ q` for `q` in the image of `Q`; write `dlog p` for the class of
`1 ⊗ p`. It carries the universal pair `(d, dlog)` with `dα(p) = α(p) dlog p` and
`dlog(pp') = dlog p + dlog p'`; it glues on the ringed site, is invariant under logification, satisfies
log base change, and is coherent for fine charts of finite type. The API is
`LogCrystalline.logDifferentials.lift` (maps out classify log derivations), `LogCrystalline.logDifferentials.d_alpha`
(`dα(p) = α(p) dlog p`) and `LogCrystalline.logDifferentials.dlog_mul`
(`dlog(pp') = dlog p + dlog p'`), with the supplier's log base-change isomorphism (Kato,
§1.7–1.8, pp. 195–196, and §2.1, p. 197; Qian, arXiv:2103.00106, Proposition 3.6,
pp. 18–19). *Needs:* CrystallineCohomology CR.5.1, “Logarithmic differentials”;
`PrelogStructure`; `AssociatedLog`; `FineLogChart`; Mathlib `KaehlerDifferential`,
`GrothendieckGroup`.

**Checks.**

- `LogCrystalline.logDifferentials.trivial`: for trivial log structures `Ω¹_log = Ω¹_{B/A}`.
- `LogCrystalline.logDifferentials.logpoint`: for the standard log point over `ℂ` with trivial structure,
  `Ω¹_log = ℂ · dlog t` although `Ω¹_{ℂ/ℂ} = 0`.
- `LogCrystalline.logDifferentials.relativeLogpoint`: for the identity of the standard log point the relative module
  is `0`; omitting the base relation `1 ⊗ q` gives `ℂ · dlog t` and fails.

The algebraic quotient and its relation submodule are the supplier's construction;
analytification transports them through the universal log-derivation pair. For a chart
`Q → P`, the base relation kills the image of `Q`, not an independently selected subgroup.
On the standard log point it kills `dlog t` for the identity base map, while the trivial
base imposes no such relation (Kato, §1.7–1.8, pp. 195–196).

Use `LogCrystalline.IsLogSmooth` as `LogSmooth`: a morphism of fine log schemes `f : X → Y` is log smooth if its underlying map is
locally of finite presentation and every square-zero lifting problem with an exact closed immersion
(the source log structure is the pullback of the target's) on the left has a solution étale locally on
the test object; log étale if the solution is moreover unique. Fibre products are taken in the fine
category (integralizing when needed). The API is `LogSmooth.lift` (the lifting property),
`LogSmooth.strict_iff` (for strict `f`, log smooth iff smooth) and `LogSmooth.baseChange` (stable under
fine base change) (Kato, Definitions 3.1–3.3, pp. 200–201; Proposition 3.8, p. 203, for the strict
case; (2.8), p. 199, for fine fibre products). *Needs:* CrystallineCohomology
CR.5:log-algebra.2–.3, “Log fiber products” and “Log smooth morphisms”; `FineLogChart`;
`LogCrystalline.logDifferentials`; Mathlib `Algebra.FormallySmooth`.

**Checks.**

- `LogSmooth.identity`: the identity of a fine log scheme is log étale.
- `LogSmooth.trivialStructures`: with trivial log structures, log smooth is smooth.
- `LogSmooth.semistableChart`: `Spec ℂ[x, y, t]/(xy − t)` with chart `ℕ²` over the base chart
  `ℕ → ℕ²`, `1 ↦ (1, 1)` is log smooth over the `t`-line with its divisorial structure, although its
  central fibre `xy = 0` is singular.

Use the Kato chart criterion of CrystallineCohomology CR.5:log-algebra.3 as `logChartCriterion`: a morphism of fine log schemes `f : X → Y` with a chart `Q → M_Y` is
log smooth if and only if étale locally on `X` there is a chart `Q → P` of `f` such that the kernel and
the torsion part of the cokernel of `Q^gp → P^gp` are finite of order invertible on `X`, and
`X → Y ×_{Spec ℤ[Q]} Spec ℤ[P]` is étale; `f` is log étale if and only if the same holds with the
whole cokernel finite of invertible order. Log smoothness implies that `Ω¹_log(X/Y)` is finite
locally free. No saturation is assumed (Kato,
Proposition 3.4, pp. 201–202, Theorem 3.5, p. 202, with Remark 3.6 and the proof 3.13,
pp. 202–205; Proposition 3.10, p. 203). *Needs:*
CrystallineCohomology CR.5:log-algebra.3, “Kato chart criterion”, and CR.5.1,
“Logarithmic differentials”; `LogSmooth`; `LogCrystalline.logDifferentials`.

Specialize `LogCrystalline.logDeRham` as `LogDeRham`: for a fine log morphism, `Ω^p_log = Λ^p Ω¹_log` with the differential extending the
universal log derivation by `d(dlog p) = 0` and the graded Leibniz rule; it is a complex of
`f⁻¹O_Y`-modules (`ℂ`-linear in the complex case), with finite locally free terms when `f` is log
smooth. It is bounded when moreover `X` is quasi-compact, since the locally constant rank of
`Ω¹_log` then takes finitely many values; log smoothness alone does not bound it (with trivial log
structures, `⊔_{n ≥ 0} Aⁿ_ℂ` over `Spec ℂ` is log smooth, see `AlgebraicDeRham.disjointUnion`). For
a divisorial structure with SNC boundary it is the classical `Ω^•_X(log D)` generated by the
`dzᵢ/zᵢ` and the remaining `dzⱼ`. The API is `LogDeRham.dlogClosed` (`d(dlog p) = 0`),
`LogDeRham.d_squared` (`d² = 0`) and `LogDeRham.SNC` (agreement with `Ω^•_X(log D)`) (Kato, §1.9, p. 196,
and Proposition 3.10, p. 203; the agreement with `Ω^•_X(log D)` follows from the chart formula (1.8),
p. 196; Qian, Proposition 3.6, pp. 18–19, uses it over the standard log point). *Needs:* CrystallineCohomology CR.5.1,
“Log de Rham complexes” (`LogCrystalline.logDeRham`); `LogCrystalline.logDifferentials`; `logChartCriterion`;
`AlgebraicDeRham`.

**Checks.**

- `LogDeRham.emptyBoundary`: for a trivial structure it is the ordinary de Rham complex.
- `LogDeRham.coordinate`: on the log line, `dz = z dlog z` and `dlog z` is closed.
- `LogDeRham.crossing`: on the smooth plane with SNC boundary `xy = 0`, `Ω¹_log` is free on `dlog x`, `dlog y`, and `Ω²_log` on
  `dlog x ∧ dlog y`.

Prove `logDifferentialTransitivitySplit`: for morphisms of fine log schemes `X → Y → S` with `X → Y`
log smooth, `0 → f^*Ω¹_log(Y/S) → Ω¹_log(X/S) → Ω¹_log(X/Y) → 0` is exact and locally split, with
`Ω¹_log(X/Y)` finite locally free; no smoothness of `Y → S` is needed. Taking exterior powers over the
standard log point gives the short exact sequence of log de Rham complexes used in C5.7 (Kato,
Propositions 3.10 and 3.12, printed pp. 203–204). *Needs:* `LogCrystalline.logDifferentials`; `LogSmooth`;
`logChartCriterion`.

**Checks for `logDifferentialTransitivitySplit`.**

- For an identity `X → X → S`, the last term is zero and the first map is the identity.
- With trivial log structures and `A²_ℂ → A¹_ℂ → Spec ℂ` the sequence splits as
  `ℂ[x,y] dx ⊕ ℂ[x,y] dy`, recovering ordinary smooth cotangent transitivity.
- For the log-smooth node `xy = 0` over the standard log point, the absolute module is
  free on `dlog x`, `dlog y`; the base generator maps to `dlog x + dlog y`, and the
  relative quotient imposes that sum equal to zero. Individual component residues
  are defined on the absolute module and do not descend to this relative quotient.

### C5.6 Regular singular connections and Deligne's Riemann–Hilbert theory

Define `RegularSingular`: an integrable algebraic connection `(E, ∇)` (finite locally free `E`) on a
smooth variety `U` of finite type over `ℂ` is regular singular if for every smooth curve `C` with a map
`C → U`, the pulled-back connection has, at each point at infinity of the smooth completion of `C`, a
lattice on which it has at most a logarithmic pole (Deligne 1970, II.4.1–4.6, printed pp. 85–91).
*Needs:* `Crystalline.Connection`; `DivisorialLog`; `LogCrystalline.logDifferentials`;
C4.5 `affineCurveCompletionInterface` on affine curve charts.

The internal order is the curve-condition definition, the analytic `CanonicalLogExtension`, then
the curve/logarithmic-lattice equivalence and compactification independence. The analytic extension
is constructed for every finite-rank complex local system, independently of algebraic regularity.

**Checks.**

- `RegularSingular.trivial`: `(O_U, d)` is regular singular on every smooth `U`.
- `RegularSingular.logarithmic`: `d + a dz/z` on `G_m` has logarithmic lattices at `0` and at `∞`.
- `RegularSingular.irregularInfinity`: `d + dz` on `A¹` is integrable but not regular singular at `∞`
  (in `w = 1/z` it is `d − dw/w²`, a double pole), so integrability does not imply regularity.

Define `CanonicalLogExtension`: for a local system `V` of finite rank on `U^an`, `U = X ∖ D` with `X`
smooth proper and `D` SNC, and a set-theoretic section `τ` of `ℂ → ℂ/ℤ` (for instance
`0 ≤ Re λ < 1`), the unique locally free extension `(Ē, ∇)` of `(V ⊗ O_{U^an}, d)` to `X^an` with
logarithmic poles whose residues along each component of `D` have eigenvalues in `τ`.
The initial bundle and its identification with the horizontal local system use the inverse and
unit of `analyticFlatConnectionLocalSystem`. Local monodromy
along a positive loop is conjugate to `exp(−2πi Res)`: the section `τ` excludes nonzero
integral differences between distinct residue eigenvalues. A matrix equality uses the chosen
fibre identification from the local logarithmic model, with its change-of-frame compatibility.
The extension is exact in `V`; tensor products need integer
shifts of residues, while the unipotent extension (nilpotent residues) is tensor compatible. Choose
logarithms of the commuting local monodromies with eigenvalues in `τ` and twist multivalued flat frames
by the corresponding exponentials; moderate growth glues and characterizes the extension. The API is
`CanonicalLogExtension.residueSpectrum` (residue eigenvalues in `τ`), `CanonicalLogExtension.monodromy`
(the conjugacy above, and equality with a retained fibre identification;
rank-one scalar `localMonodromy`; strip representatives `residueStripRep`) and
`CanonicalLogExtension.uniqueness` (uniqueness of an extension with the
strip condition) (Deligne 1970, II.5.1–5.6, printed pp. 91–96: the choice of `τ` in II.5.3, misnumbered
4.3 in print, and Proposition 5.4, p. 94; the monodromy in Corollary 5.6, p. 96).
*Needs:* `analyticFlatConnectionLocalSystem`; `DivisorialLog`; `LogCrystalline.logDifferentials`;
`logAnalytification`;
AlgebraicModuliForArithmeticGeometry Layer 9 (`analyticPolydisc`).

**Checks.**

- `CanonicalLogExtension.emptyBoundary`: with `D = ∅` the extension is `(V ⊗ O, d)` itself.
- `CanonicalLogExtension.rankOne`: residue `a` has monodromy `exp(−2πia)`.
- Under independent changes of basis on the boundary and nearby fibres, the two matrices
  need not be equal; their conjugacy class is unchanged.
- `CanonicalLogExtension.tensorCarry`: residues `3/4` and `3/4` add to `3/2`, whose strip representative
  is `1/2`; so the canonical extension with the strip `[0,1)` is not an unadjusted tensor functor.

Prove the logarithmic-lattice criterion for `RegularSingular`: on a smooth proper compactification
`X ⊇ U` with SNC boundary `D`, the curve condition is equivalent to the existence of a finite locally
free extension of `E` to `X` with logarithmic connection `Ē → Ω¹_X(log D) ⊗ Ē`, and it is independent
of the compactification. Use the analytic `CanonicalLogExtension` of the horizontal local system:
the curve condition makes its identification with `E^an` meromorphic along the boundary, by a
uniform pole bound from Baire category and extension across codimension two; proper GAGA then
algebraizes the lattice and connection. The API is `RegularSingular.restrict` (restriction to an
open), `RegularSingular.pullback` (pullback along morphisms of smooth varieties) and
`RegularSingular.tensor` (tensor products and duals) (Deligne 1970, II.4.1–4.6, printed pp. 85–91,
and II.5.1–5.9, pp. 91–98, with the replacement proof of II.4.1 in the author's 1971 erratum,
pp. 1–3). *Needs:* the curve-condition `RegularSingular` definition; `CanonicalLogExtension`;
`analyticFlatConnectionLocalSystem`; `DifferentialOperatorAnalytification`;
AlgebraicModuliForArithmeticGeometry Layer 9 (`sncCompactification`) and
§7.10.3 (`properSchemeGagaEquivalence`).

The residue-strip functions also have an elementary API. For `a ∈ ℂ`,
`residueStripRep a = a − floor(Re a)`; `residueStripRep_mem` proves membership in the half-open
strip and integer difference, and the API includes invariance under integer translation and
idempotence. The imaginary part is preserved. For `localMonodromy a = exp(−2πia)`,
`localMonodromy_add_int` proves integer invariance; the API includes nonvanishing and the
addition-to-multiplication law. These are the scalar normalizations of Deligne's residue
construction (II.5.3–5.6, pp. 94–96).

**Checks for residue-strip representatives.**

- At `a = 0` the representative is `0`; at `a = 1` it is again `0`, so the upper boundary is excluded.
- At `a = −1/4` it is `3/4`, with no change in the imaginary part for a non-real residue.
- At `a = 3/4 + 3/4` it is `1/2`, detecting the tensor carry.

**Checks for local monodromy.**

- Residue zero has monodromy `1`, as does every integer residue.
- Residue `1/2` has monodromy `−1`.
- Residue `1/4` has monodromy `−i`; this detects the negative sign in the exponent.

Prove `deligneRiemannHilbert`: for a smooth variety `U` of finite type over `ℂ`, analytification followed
by horizontal sections is an equivalence between the category of regular singular integrable algebraic
connections on `U` and the category of local systems of finite-dimensional complex vector spaces on
`U^an`; it is exact, fully faithful and compatible with tensor products and duals. In particular a
horizontal analytic morphism between regular singular algebraic connections is algebraic. Descent of
such tensors to a smaller field of definition is an additional arithmetic input not supplied here.
Use `analyticFlatConnectionLocalSystem` for the analytic horizontal-section functor, its rank
property, unit and evaluation counit, and its tensor/dual compatibility. On a smooth quasi-projective
`U`, take the canonical logarithmic extension on an SNC compactification
(`sncCompactification`), algebraize it and its logarithmic connection by proper GAGA
(`properSchemeGagaEquivalence` and `DifferentialOperatorAnalytification`), and algebraize horizontal
maps by moderate growth; a general `U` is covered by quasi-projective opens (Deligne 1970, II.5.7–5.9
and proof, printed pp. 96–98, with the corrected II.4.1; Caraiani–Scholze, *On the generic part of the
cohomology of compact unitary Shimura varieties*, arXiv:1511.02418v1, §2.3, PDF p. 17, which uses it
on a Hodge-type Shimura variety to make horizontal Hodge tensors algebraic).
*Needs:* `CanonicalLogExtension`; `analyticFlatConnectionLocalSystem`; `relativePoincare`;
`DifferentialOperatorAnalytification`;
AlgebraicModuliForArithmeticGeometry `properSchemeGagaEquivalence`, `sncCompactification`;
SchemeAndStackFoundations Layer 1.

Prove `regularSingularDeRhamComparison`: for a smooth variety `U` of finite type over `ℂ` and a regular
singular integrable connection `(E, ∇)` with local system `V = (E^an)^∇`, `H^q_dR(U, (E, ∇)) ≅ H^q(U^an, V)`
for all `q`. For a smooth proper SNC compactification `j : U → X` and a logarithmic extension `Ē` whose
residue eigenvalues are not positive integers, `Ω^•_X(log D) ⊗ Ē → Rj_*(Ω^•_{U^an} ⊗ E^an)` is a
quasi-isomorphism (after analytification); an arbitrary logarithmic lattice need not compute the same
cohomology. On a boundary polydisc expand in Laurent series and contract the negative-exponent part with
the inverses of `k + Res` (available because no residue eigenvalue is a positive integer); then apply
`boundedOperatorHyperGaga` and the coefficient Poincaré lemma (Deligne 1970, Theorem II.6.2, printed
p. 98, and II.6.7–6.10 and proof, pp. 101–105, with II.3.13–3.15, pp. 80–85, for the passage from
logarithmic to meromorphic forms). *Needs:* `deligneRiemannHilbert`; `boundedOperatorHyperGaga`; `LogDeRham`;
`sheafSingularComparison`; `analyticFlatConnectionLocalSystem`; `relativePoincare`.

**Checks for `regularSingularDeRhamComparison`.**

- For the trivial connection on `G_m = P¹ ∖ {0, ∞}`, choose `z⁻¹ℂ{z}` at `0` and the
  unshifted lattice `ℂ{w}`, `w = 1/z`, at `∞`. The residues `(−1,0)` meet the comparison
  condition. Both terms of the logarithmic complex are `O_{P¹}(1)` and have no higher
  cohomology. In the global bases `(1,z⁻¹)` and `(dz/z,z⁻¹ dz/z)`, its differential has
  matrix `diag(0,−1)`, giving `H⁰ = H¹ = ℂ`.
- Replacing only the first lattice by `zℂ{z}` gives residues `(1,0)`. Both terms of the
  logarithmic complex are `O_{P¹}(−1)` and have zero cohomology, so its hypercohomology is zero.
- Using `e′ = z⁻¹` as a global frame instead gives residues `(−1,+1)`. Both terms are
  `O_{P¹}` and their global differential is multiplication by `−1` in the basis `dz/z`;
  this logarithmic complex is acyclic despite trivial monodromy at both boundaries.

### C5.7 Curves and the proper logarithmic comparison

Define `CurveLogComplex` for a smooth projective curve `C` over `ℂ`, a reduced finite set `D` of points
and `U = C ∖ D`: the logarithmic complex `Ω^•_C(log D) = [O_C → Ω¹_C(D)]` and the compact-support complex
`Ω^•_C(log D)(−D) = [O_C(−D) → Ω¹_C]`, with `ℂ`-linear differentials. The first computes `H^•_dR(U)`, the
second `H^•_c(U)`, and the inclusion of the second into the first induces the natural map
`H¹_c(U) → H¹(U)`, whose image is the parabolic cohomology. The local logarithmic Poincaré lemma
identifies the first complex with `Rj_*ℂ`. The second is identified with `j_!ℂ` by a local
computation: at `p ∈ D` with coordinate `z`, `d` maps `zℂ{z}` isomorphically onto `ℂ{z} dz`
(`z^{n+1} ↦ (n+1)zⁿ dz`), so the stalk at `p` is acyclic, as is `(j_!ℂ)_p`. The API is `CurveLogComplex.ordinary` (terms `O_C`,
`Ω¹_C(D)`), `CurveLogComplex.compactSupport` (terms `O_C(−D)`, `Ω¹_C`) and `CurveLogComplex.parabolic`
(parabolic `H¹` is the image of `H¹_c → H¹`) (Grothendieck 1966, Theorem 2, printed p. 97, for the
meromorphic de Rham complex; Deligne 1970, II.6.9–6.10, printed pp. 102–105, for the logarithmic
one; the compact-support identification is the computation just given). *Needs:* `LogDeRham`; `regularSingularDeRhamComparison`;
`affineCurveCompletionInterface`.

**Checks.**

- `CurveLogComplex.emptyBoundary`: for `D = ∅` the two complexes coincide with `Ω^•_C`.
- `CurveLogComplex.affineLine`: for `U = P¹ ∖ {∞}`, `H¹(U) = 0` and `H²_c(U)` is one-dimensional.
- `CurveLogComplex.torus`: for `U = P¹ ∖ {0, ∞}`, `H¹(U)` is spanned by `dz/z` and the parabolic `H¹`
  is `0`.

Prove `curveResidueLocalization`: in the setting of `CurveLogComplex`,
`0 → Ω^•_C → Ω^•_C(log D) → ⊕_{p ∈ D} ℂ_p[−1] → 0` is exact with `Res_p(a dz/z) = a` in a local
coordinate `z` at `p`. Its hypercohomology sequence is the de Rham localization sequence. Let `comp`
be the comparison given by `holomorphicPoincare` (`Ω^•_{C^an} ≃ ℂ`) and `CurveLogComplex`
(`Ω^•_C(log D)^an ≃ Rj_*ℂ`), and let the Betti residue `res_B : (R¹j_*ℂ)_p → ℂ` be evaluation on the
positively oriented loop around `p`. The analytified sequence maps to the Betti triangle
`ℂ_C → Rj_*ℂ → ⊕_{p ∈ D} (R¹j_*ℂ)_p[−1]` by `comp` on the first two terms and, on the third, by the
map whose composite with `res_B` is `2πi · Res_p`:
the square

```
H¹_dR(U)      ──Res──→  ⊕_{p ∈ D} ℂ
   │ comp                    │ 2πi
   ↓                         ↓
H¹(U^an, ℂ)  ──res_B──→  ⊕_{p ∈ D} ℂ
```

commutes, that is `res_B ∘ comp = 2πi · Res`, equivalently `Res = (2πi)⁻¹ · res_B ∘ comp`, and the
same factor `2πi` on the residue terms makes the connecting maps into `H²` of the two localization
sequences correspond under `comp`. The factor is the period `∮ dz/z = 2πi` of
`HolomorphicDeRham.torusPeriod`; the residue convention and the monodromy `exp(−2πia)` are unchanged.
The sum of residues of a global logarithmic form is `0`, compatibly with the trace; and
the pairing between compact-support and ordinary `H¹` induces the nondegenerate pairing on parabolic
`H¹` with the same normalisations (Deligne 1970, II.3.5–3.7, printed pp. 75–78, for the Poincaré
residue, and II.6.10, p. 105, for the identification with `Rj_*ℂ`; Grothendieck 1966, Theorem 2,
printed p. 97; the factor `2πi` is the stalk computation at `p`, where `H¹` of the logarithmic complex
is spanned by `dz/z`). *Needs:* `CurveLogComplex`; `holomorphicPoincare`;
`multiplicativePeriodInterface`; `boundedOperatorHyperGaga`.

**Checks.**

- `curveResidueLocalization.puncturedDisc`: on a disc around `p` with coordinate `z`, `dz/z` has de
  Rham residue `1` and Betti residue `∮ dz/z = 2πi`, so `res_B ∘ comp = 2πi · Res`; the reversed
  statement `Res = 2πi · res_B ∘ comp` would give `1 = (2πi)²`.
- `curveResidueLocalization.torus`: on `G_m = P¹ ∖ {0, ∞}`, `dz/z` has de Rham residues `(1, −1)` at
  `(0, ∞)` and positive local-loop periods `(2πi, −2πi)`; the positive loop around `∞` (positive in
  `w = 1/z`) is the circle `|z| = R` traversed clockwise.
- `curveResidueLocalization.residueSum`: on `P¹ ∖ {0, 1, ∞}`, `a dz/z + b dz/(z − 1)` has residues `a`,
  `b`, `−(a + b)` at `0`, `1`, `∞`, which sum to `0`.

Prove `properLogGagaMonodromy`: let `X` be a proper fine log-smooth log scheme over the standard log
point `0^† = (Spec ℂ, ℕ → ℂ, 1 ↦ 0)`. Analytification compares the hypercohomology of the relative log
de Rham complex `Ω^•_{X/0^†}` with its analytic counterpart in every degree, and compares the exact
sequence of complexes `0 → Ω^•_{X/0^†}[−1] → Ω^•_{X/ℂ} → Ω^•_{X/0^†} → 0` (absolute log differentials
relative to the trivial base; the first map is `dlog t ∧ −`) together with its connecting endomorphism
`N` of `H^q(X, Ω^•_{X/0^†})`. The exactness comes from `logDifferentialTransitivitySplit`, the terms are
coherent with differential-operator differentials, the complexes are bounded because `X` is proper,
hence quasi-compact, and `boundedOperatorHyperGaga` applies; the sign of
`N` is fixed by the `dlog t ∧ −` map. This is a de Rham statement: no Kato–Nakayama Betti comparison is
claimed (Qian, arXiv:2103.00106, Theorem 1.8, pp. 3–4, and Proposition 3.6 and proof, pp. 18–19).
*Needs:* `LogDeRham`; `logAnalytification`; `logDifferentialTransitivitySplit`; `boundedOperatorHyperGaga`;
`DifferentialOperatorAnalytification`.

### Examples (C5.5–C5.7)

- On `P¹`, `dz/z` has residues `1` at `0` and `−1` at `∞`; on `G_m` the ordinary `H¹` is `ℂ`, its
  parabolic part is `0`, and the Betti residue of `comp[dz/z]` at `0` is `2πi` times its de Rham
  residue.
- For the identity of the standard log point the relative complex is `ℂ` in degree `0` and `N = 0`;
  over the standard log point the first map of the transitivity sequence is multiplication by `dlog t`.
- The semistable chart `xy = t` is log smooth with a singular central fibre, and the chart
  criterion does not require saturation.

### Dependencies

C0–C4; AlgebraicModuliForArithmeticGeometry (§§7.10.1 and 7.10.3; Layers 1–3 and 9);
SchemeAndStackFoundations (Layer 1, Layer 2 including §§2.19–2.20, §4.12, Layer 5); TauCetiRoadmap.DifferentialGeometry (Layers 0–3,
5, 6, 8, 9 and 12); TauCetiRoadmap.AlgebraicTopology (Stages 6 and 8); TauCetiRoadmap.PDE (Lanes A,
D and E); TauCetiRoadmap.AlgebraicVectorBundles (L0C); SmoothBundlesConnections B1.5, B2–B4, B6.1–B6.4;
CharacteristicClasses C1.5, C3; TauCetiRoadmap.JacobianChallenge (Layer C);
Tau Ceti `TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.Conjugation`,
`TauCeti.Topology.subsingleton_H_succ_of_isFlasque`; Mathlib Kähler differentials, exterior powers,
derivations, monoids and group completions, `circleIntegral`.

<a id="c6"></a>

## Layer C6: Stratified topology, Riemann existence and Artin comparison

Use `complexSchemeAnalytification` from AlgebraicModuliForArithmeticGeometry §7.10.1 on
finite-type complex schemes, and write `T_X` for its underlying topological space. This layer
owns the finite-stalk sheaf/native-local-system dictionary and constructible coefficients,
finite-cover equivalence, comparison-site morphism
and finite/adic Artin equivalences on that analytic carrier. Its algebraic coefficient and
operation suppliers are LefschetzPencilsAndVanishingCycles §§F.0–F.4 and
ClassicalAdicEtaleCohomology's generic enhancement; coherent `O_X`-modules and de Rham complexes
retain the comparisons of C0–C5. The nearby-cycle and inertia compatibility of
LefschetzPencilsAndVanishingCycles §F.9 consumes these general equivalences.

### C6.0 Stratified topology of complex algebraic schemes

**Stratified topology of complex algebraic schemes — `complexAlgebraicTopology`.**
For separated finite-type `X/ℂ` and any prescribed finite algebraic stratification, construct
a finite compatible triangulation of `T_X`: a homeomorphism from a union of open simplices
in a finite simplicial complex, with each stratum a union of those simplices. In the proper
case the union is a finite subcomplex, giving a compact finite-polyhedron model of the reduced
carrier. No smoothness, irreducibility or reducedness is required for the topological theorem.
Prove that `T_X` is Hausdorff, locally compact, second countable, paracompact, locally
contractible and locally path-connected, has finite cohomological dimension for finite
coefficients, and is homotopy equivalent to a finite CW complex. Finite CW type means a
homotopy equivalence, not compactness of `T_X`.

Use `TauCeti.IsSemialgebraic` and its Boolean, product and polynomial inverse-image API,
and `TauCeti.IsSemialgebraicOn` for maps. Consume RealAlgebraicGeometry's cell and projection
theory and AffineMorseLefschetz A4's opening compact finite closed-family triangulation
foundation: its output is a finite simplicial complex `K`, a semialgebraic homeomorphism
`|K| ≅ S`, and subcomplexes for the prescribed closed subsets. Its compatible subdivision
maps realize the identity on `S` and preserve those subcomplexes. The dimension comparison
is that leaf's API; no complement duality or Lefschetz application is consumed.

Construct here the extension to noncompact locally closed semialgebraic sets and finite
locally closed strata. After a bounded semialgebraic embedding, in the compact closure
record the closures and boundaries of the locally closed pieces as closed subsets; apply
the supplied closed-family theorem and express each piece as a difference of subcomplexes,
hence a union of open simplices. Retain the ambient finite complex and the selected open
simplices, rather than asserting that this union is compact. Construct common compatible
refinements, with realization homeomorphisms over the original space and subdivision maps
on cochains commuting with stratum restrictions. Pass from affine algebraic charts in
`ℂⁿ = ℝ²ⁿ` to separated schemes by finite gluing: identify chart-overlap maps with the
algebraic coordinate changes, refine on the overlaps, and prove that the resulting realization
maps glue to a homeomorphism over `T_X`. Prove cover/refinement independence and the finite
CW and finite-cohomological-dimension consequences used by Artin comparison. For arbitrary finite-type `X`
use finite affine covers to prove local compactness, local contractibility and local path
connectedness, and also second countability and finite cohomological dimension via the
finite-cover cohomology bound. Hausdorffness, global triangulation and the preceding global
finiteness package are asserted for separated `X`.

*Source:* Hironaka, *Triangulations of algebraic sets*, Proc. Sympos. Pure Math. 29 (1975),
165–185; Bochnak–Coste–Roy, *Real Algebraic Geometry*, §9.2, Theorem 9.2.1
(triangulation compatible with a finite family); SGA 1 XII §§1–3 for analytification's
local topology and separatedness.
*Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1; the pinned semialgebraic carriers;
RealAlgebraicGeometry Layers 3, 6; AffineMorseLefschetz A4's compact triangulation leaf;
AlgebraicTopology's simplicial and CW topology. The noncompact/locally-closed extension,
algebraic chart gluing and finiteness consequences just specified are constructed here.

**Checks.**

- A nodal complex curve is locally contractible at its singular point.
- `A¹_ℂ` has the homotopy type of a point despite being noncompact; its finite ambient
  triangulation selects open simplices, not a compact realization of the whole ambient complex.
- On `P¹` stratified by `{0}`, `{∞}` and `ℂ*`, the point strata are subcomplexes and the
  locally closed open stratum is a difference of subcomplexes. The two affine charts have
  inversion as overlap map; their compatible refinement maps realize that same identification.
- The affine line with doubled origin has the stated local topology and is not Hausdorff.

### C6.1 Local-coefficient and constructible topological cohomology

**Local-coefficient and constructible topological cohomology — `topologicalCoefficientComparison`.**
For finite commutative `Λ`, build the category of finite `Λ`-local systems as locally
constant topological module sheaves. On locally path-connected, semilocally simply connected
spaces identify it with `FiniteModuleLocalSystem Λ T`, the finite-stalk full subcategory of
`TauCeti.LocalCoefficientSystem Λ T`, not a separate functor carrier. The unit/counit identify
the actual sheaf stalk at each vertex with `L.obj x` and match path maps with native
`transport`; use a basepoint only for a based representation statement. Supply stalks,
pullback, finite limits/colimits, extensions, tensor, dual and path-change coherence using
the native constant/evaluation/monodromy and identity/composition/homotopy pullback maps.

Consume AlgebraicTopology Stage 6.1's direct coefficient complex: in degree `n` it is
`∏_σ L.obj(σ(v₀))`. Its first face term is transported from `σ(v₁)` back to `σ(v₀)`
by the inverse of the native first-edge transport; the other face terms keep `v₀` and the
alternating signs. The supplier owns the square-zero, pullback, homotopy, pair, excision,
Mayer–Vietoris and tensor-paired cup identities. Its comparison with the pinned Hom-from-
twisted-chains complex identifies cochains for the dual system with that Hom complex;
identifying direct `L` with a double dual requires a displayed reflexivity isomorphism.
No projectivity or reflexivity is imposed on finite coefficients here or in Artin comparison.
For constant coefficients consume C5.1's `SmallSingularCochains` and `sheafSingularComparison`
and Tau Ceti's ordinary singular complex and cup product.

On locally contractible paracompact spaces construct the sheaf resolution by direct
small local cochains using C5.1’s neighbourhood nestings: trivialize the local system on
small opens, use the constant resolution there, and glue using its actual transport maps. Prove the augmentation preserves
vertex fibres, local exactness, acyclicity and the quasi-isomorphism from the supplier's
all-singular direct complex to global sections. This gives the natural derived sheaf/singular
comparison for these local systems. C6.1 owns this sheaf/native-functor dictionary and
resolution on this domain; AlgebraicTopology Stages 2.6 and 6.1 own generic coefficient
functors and direct cochains. Apply the bridge to the analytic carrier and constructible strata.
For a finite triangulation compatible with a finite constructible stratification, construct
stratified cochains using the sheaf's restriction
and specialization maps, and prove their derived comparison with sheaf cohomology for
bounded constructible complexes. These coefficients need not be locally constant across
strata. Prove compatibility with restriction and finite open-cover descent; the local-system
resolution and descent also give ordinary comparison on the possibly non-Hausdorff `T_X`
of a finite-type complex scheme using its finite affine cover.

For locally compact Hausdorff, paracompact, locally contractible spaces define exact
topological `j_!` along open embeddings, `Rf_!` for locally proper separated continuous
maps, and `RΓ_c`, with stalks, adjunction, composition, proper agreement, base change and
localization. On the finitely triangulated constructible domain prove comparison with
compactly supported stratified cochains, and with compact singular cochains for local
systems. The complexes are bounded with finite cohomology over `Λ`; they are perfect
when the coefficient complex has a uniform finite Tor interval at its stalks.
All maps retain coefficient change, cup/external products and coherent finite group actions.

*Source:* Dimca, *Sheaves in Topology*, §§2.1–2.5, §3.2 and §4.1 (local systems,
proper supports and constructibility); Sella, Theorem and Lemma 0.1, pp. 2–4, for the
constant ordinary resolution used in C5.1; Hatcher, §3.H, printed pp. 333–334, for direct
local cochains. The transport-preserving sheaf equivalence, local-system resolution and
stratified cochain construction are the extensions specified here.
*Needs:* §C6.0; the native `TauCeti.LocalCoefficientSystem` and its finite-stalk restriction;
AlgebraicTopology Stages 2.6 and 6.1; UniversalCovers' groupoid/cover classification; C5.1; the singular suppliers
in *Exact supplier contracts*; ClassicalAdicEtaleCohomology §§0.1–0.4 on topological
module sheaves, including `ClassicalDerived.tensorHom` and `ClassicalDerived.functorCoherence`.

**Checks.**

- A rank-one `𝔽₃`-local system on `ℂ*` with monodromy `−1` is retained as a nonconstant
  object; its degree-zero global sections are zero.
- On `ℂ*`, a rank-one `𝔽₅` system with positive-loop transport `2` has dual transport
  `3 = 2⁻¹`. The sheaf/native unit identifies transport `2` itself, while direct cochains'
  first-face term uses the reverse-edge transport `3`. Testing just the vanishing cohomology
  groups would not distinguish the two systems.
- Constant coefficients retain C5.1's augmentation and the ordinary singular cup product.
- On a point, the finite nonprojective module `ℤ/2` over `ℤ/4` has direct degree-zero
  cochains and sheaf sections equal to that module, and higher cohomology zero; the comparison
  requires no projectivity. It does not replace the coefficient module by its dual.
- A skyscraper at a closed point uses its point stratum and has no local-system extension
  across that point as a locally constant sheaf.
- On a point, `ℤ/2` over `Λ = ℤ/4` has bounded cohomology but is not perfect.

### C6.2 Riemann existence for finite-type complex schemes

**Riemann existence for finite-type complex schemes — `riemannExistence`.**
For every finite-type `X/ℂ`, analytification induces an equivalence between finite étale
`X`-schemes and finite topological covering spaces of `T_X`. Include singular, nonreduced,
disconnected and nonseparated `X`. Construct full faithfulness and essential surjectivity
by finite-cover analytic algebraization, building extension across compactification
boundaries, finite analytic algebras, and descent to singular charts as needed for that
construction. Glue the affine-local equivalences. Use the existing analytification functor
and UniversalCovers' topological covering API.

The equivalence commutes with pullback, fibre products, disjoint unions and connected
components, identifies Galois covers and deck groups, and identifies finite lisse
`Λ`-sheaves with finite topological local systems. For a connected nonempty `X` and a
chosen complex point identify the étale fundamental group with the profinite completion
of the topological fundamental group, using the same fibre functor and deck-action
convention. Unbased and disconnected statements use groupoids; identity and composite
path changes, tensor operations and coefficient changes commute with this equivalence.

*Source:* SGA 1 XII, Theorem 5.1, with §§2–3 for components and finite/étale analytification.
*Needs:* AlgebraicModuliForArithmeticGeometry §7.10.1; §§C6.0–C6.1;
LefschetzPencilsAndVanishingCycles §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`,
`VanishingCycles.constructibleEtale`; UniversalCovers; the coherent algebraization tools
of C0–C4 for the finite-cover analytic algebraization constructed in this target.

**Checks.**

- `z ↦ zⁿ` on `ℂ*`, `n ≥ 1`, gives the cyclic degree-`n` cover and its cyclic deck group.
- A nilpotent thickening induces the same finite-cover category on both sides.
- A disconnected finite cover retains its components and their fibrewise cardinalities.

### C6.3 Finite-level Artin comparison for ctf coefficients

**Finite-level Artin comparison for ctf coefficients — `artinComparison`.**
For every finite-type `X/ℂ`, finite commutative `Λ` and `K ∈ Dᵇ_ctf(X_ét,Λ)`, construct
the site morphism `ε_X : (T_X)_lh → X_ét` by analytifying étale maps as local
homeomorphisms. The small local-homeomorphism site with jointly surjective covers has
the same sheaf category as the open-set site of `T_X`; prove and use this equivalence.
Define `K^an = ε_X^*K`, preserving stalks, finite lissity, constructibility, tensor,
duals and coefficient maps. The unit gives the canonical comparison
`RΓ_ét(X,K) → RΓ(T_X,K^an)`; prove it is an equivalence of enhanced derived
`Λ`-module objects, natural in `X` and `K`. No smoothness, properness or separatedness
hypothesis is imposed on `X`.

Prove comparison through elementary fibrations. Construct `U ⊂ Ubar → S` with
`Ubar → S` a smooth projective relative curve with geometrically connected fibres and
`Ubar ∖ U → S` finite étale with nonempty fibres. For every point of a positive-dimensional
smooth complex variety of dimension `d`, build a Zariski neighbourhood admitting such a
fibration over a smooth base of dimension `d−1`: supply the projective embedding,
normalization, generic projection, shrinking and boundary arguments. Dimension zero
is the separate point/finite-disjoint-union base case. For finite lisse coefficients
prove degree-zero/one fibre and higher-direct-image comparison, higher vanishing and
monodromy agreement. Leray and dimension induction give the smooth lisse comparison.
Noetherian stratification, finite direct images, localization and induction give the
constructible case. Use bounded truncations in the ambient constructible derived category,
then restrict to ctf; arbitrary truncations are not asserted to remain ctf.

Supply ordinary singular corollaries for finite local systems and constant finite abelian
groups, viewing a finite abelian `A` as a finite `ℤ/n`-module for an annihilator `n`.
State both comparison directions, and coherent compatibility with cups, ordinary Künneth
on its supplier domain, twists, derived coefficient reduction and finite group actions.

*Source:* SGA 4 XI §4, especially §4.6 (elementary fibrations), and XVI §4 (comparison);
Milne, *Lectures on Étale Cohomology*, §21, Theorems 21.1, 21.5, Definition 21.7 and
Proposition 21.8, pp. 130–134, for the smooth induction.
*Needs:* §§C6.0–C6.2 and AlgebraicModuliForArithmeticGeometry §7.10.1;
LefschetzPencilsAndVanishingCycles §§F.0–F.3 (the ctf/cohomology, base-change,
local-acyclicity, fibre-transport, dimension, finiteness and ordinary Künneth contracts above);
SchemeAndStackFoundations §§2.1–2.2 (site functors and Leray);
ClassicalAdicEtaleCohomology §§0.1–0.4 and §0.7 / `ClassicalAlgebraic.supportLocalization`.
Its localization and finite-open Mayer–Vietoris use étale module coefficients.

**Checks.**

- On `G_m`, `H¹(ℤ/n) = ℤ/n`; with `ζ_n = exp(2πi/n)` the Kummer class of the coordinate
  evaluates as `1` on the positive loop through the root-of-unity coordinate.
- A singular finite-type complex scheme is admitted without choosing a manifold structure.
- On `Spec ℂ` with `ℤ/2` coefficients the comparison is the canonical identity in degree zero.

### C6.4 Compact-support Artin comparison

**Compact-support Artin comparison — `artinComparisonCompactSupport`.**
For separated finite-type `X/ℂ`, finite commutative `Λ` and `K ∈ Dᵇ_ctf(X_ét,Λ)`,
construct the canonical equivalence
`RΓ_c,ét(X,K) → RΓ_c(T_X,ε_X^*K)` using §§C4.3a–C4.3c's compactifications,
proper analytic comparison and the exchange with topological `j_!`. Prove independence
of compactification by the refinement comparisons and their cocycle. Supply the local-system
and constant compact singular corollaries via §C6.1. The source and target are the
compact-support constructions, not the cohomology of coherent modules with proper support.

The equivalence commutes with proper pushforward, open extension by zero, localization
triangles and their connecting maps, compact-support external products/Künneth, derived
coefficient change, twists and finite group actions. For complex conjugation use the
conjugate scheme and the transported coefficient object together with the induced continuous
homeomorphism; track its action on orientation and root-of-unity coordinates. Arbitrary
abstract field automorphisms of `ℂ` do not supply continuous maps on the classical topology.

*Source:* SGA 4 XVII §§3–5; SGA 4½, *Théorèmes de finitude*, §§1–2;
SGA 4 XVI §4's comparison applied to a proper compactification.
*Needs:* §§C4.3a–C4.3c, §§C6.0–C6.3; AlgebraicModuliForArithmeticGeometry's analytic
properness API; LefschetzPencilsAndVanishingCycles §§F.2–F.3 /
`VanishingCycles.etaleCompactSupports`, `VanishingCycles.compactSupportCohomology`,
`VanishingCycles.compactSupportFiniteness`, `VanishingCycles.etaleKunnethCompactSupport`;
ClassicalAdicEtaleCohomology §§0.7–0.8 / `ClassicalAlgebraic.supportLocalization`,
`ClassicalAlgebraic.properSupports` with §F.2's `VanishingCycles.properBaseChange`.

**Checks.**

- `H⁰_c(A¹,Λ) = 0` on both sides, although ordinary `H⁰` is `Λ`.
- The localization sequence for `G_m ⊂ A¹` has the same connecting map after comparison.
- Conjugation on `P¹` reverses its complex orientation; the comparison transports the
  coefficient/twist coordinate with this action, rather than declaring it trivial.

### C6.5 Proper and lower-shriek relative Artin comparison

**Proper and lower-shriek relative Artin comparison — `relativeArtinComparison`.**
Let `f : X → Y` be a morphism between finite-type complex schemes, `Λ` finite
commutative and `K ∈ Dᵇ_ctf(X_ét,Λ)`. If `f` is proper, the canonical exchange
`ε_Y^* Rf_*K → R(f^an)_* ε_X^*K` is an equivalence. If `f` is separated and finite
type, prove the lower-shriek exchange
`ε_Y^* Rf_!K → R(f^an)_! ε_X^*K` is an equivalence. For nonseparated `Y`, construct
the analytic lower-shriek functor and exchange on Hausdorff affine base opens, where `X`
is separated over `ℂ`, and prove effective gluing with identity/composition coherence.
Thus no global Hausdorff hypothesis on `Y` is added to the relative theorem.

Both equivalences identify fibre/stalk comparisons, coefficient maps, cups, twists and
finite group actions and commute with base-change transformations and composition. On a
lisse higher-direct-image stratum, intertwine transport along a supplied topological/étale
path under §C6.2. A path choice is retained; no canonical comparison of unrelated fibres
is inferred. Proper agreement identifies the two exchanges when `f` is proper.

*Source:* SGA 4 XII, XVI §4 and XVII §§3–5 (proper exchange, comparison and lower shriek);
the stalk proof uses §§C6.3–C6.4 and proper/lower-shriek base change.
*Needs:* §§C6.0–C6.4; LefschetzPencilsAndVanishingCycles §§F.2–F.3 /
`VanishingCycles.properBaseChange`, `VanishingCycles.smoothBaseChange`,
`VanishingCycles.localAcyclicity`, `VanishingCycles.lisseDirectImageTransport`,
`VanishingCycles.etaleCompactSupports`, `VanishingCycles.etaleFiniteness`,
`VanishingCycles.compactSupportFiniteness`; ClassicalAdicEtaleCohomology's
`ClassicalDerived.functorCoherence`, `ClassicalAlgebraic.supportLocalization` and
`ClassicalAlgebraic.properSupports`.

**Checks.**

- For proper `f`, the lower-shriek exchange agrees with the ordinary proper exchange.
- For an open immersion the theorem gives the topological `j_!` exchange.
- For a smooth proper family, the comparison commutes with the transport along each
  specified path, including a loop with nontrivial monodromy.

### C6.6 Integral and rational Artin comparison

The topological adic realization and both integral and rational Artin equivalences are owned
here. The étale normalized-system category and classical/pro-étale realizations are those of
LefschetzPencilsAndVanishingCycles §F.4, and the generic limit/completion operations are those
of ClassicalAdicEtaleCohomology §0.3.

**Integral and rational Artin comparison — `adicArtinComparison`.**
Fix a prime `ℓ`, finite-type `X/ℂ` and a normalized system `K_n ∈ Dᵇ_ctf(X_ét,ℤ/ℓⁿ)`,
`n ≥ 1`, with coherent derived reduction equivalences and uniform cohomological and Tor
intervals. Use LefschetzPencilsAndVanishingCycles §F.4's unique étale adic category and
classical/pro-étale realizations. Construct the corresponding topological system
`ε_X^*K_n`, its derived `ℓ`-complete realization `K_Zℓ^an = Rlim_n ε_X^*K_n`, all
derived reductions and the rational object `K_Qℓ^an = K_Zℓ^an ⊗ᴸ_Zℓ Qℓ`.
These topological coefficient objects carry coherent maps and operations, not just a
sequence of unrelated sheaves.

Prove the canonical integral ordinary equivalence
`RΓ_ét(X,K_Zℓ) ≃ RΓ(T_X,K_Zℓ^an)`, and the compact-support equivalence for
separated `X`, then their rationalizations. Establish on the topological side the
cohomology/derived-limit comparisons and reduction equivalences using §C6.0's finite
triangulations and the uniform ctf bounds, keeping Milnor `lim¹`. Ordinary comparison
for possibly nonseparated `X` follows by finite affine-open descent of the separated
comparisons and their coherent limits. Rationalization commutes with these cohomology
functors on this bounded constructible domain. Preserve cups, ordinary and compact
Künneth on their proved domains, reduction at every level, twists, finite group actions
and lattice comparison when two lattices define the same rational coefficient object.

For the constant system deduce integral and rational singular-cohomology corollaries;
the `Zℓ` and `Qℓ` coefficients on that side are the derived-limit and scalar-extension
constructions just given. On the finite CW/triangulated domain compare these with the
ordinary constant singular coefficient complex. Keep geometric fibre comparisons and
path-dependent transport separate from Frobenius or any identification of unrelated fibres.

*Source:* Bhatt–Scholze, *The pro-étale topology for schemes*, §§5–6, especially §§6.5,
6.7–6.8 (normalized realization, continuity and rationalization), combined with
§§C6.3–C6.5's finite comparisons and §C6.1's finite topological cochain construction.
*Needs:* §§C6.0–C6.5; LefschetzPencilsAndVanishingCycles §F.4 /
`VanishingCycles.normalizedAdicSystems`, `VanishingCycles.classicalAdicRealization`,
`VanishingCycles.etaleProetaleAdicComparison`, `VanishingCycles.adicFiniteness`,
`VanishingCycles.rationalAdicRealization`, `VanishingCycles.adicFunctoriality`;
ClassicalAdicEtaleCohomology §0.3 / `ClassicalDerived.inverseLimits`,
`ClassicalDerived.derivedCompletion`; the finite-level operations of §§F.0–F.3.

**Checks.**

- Every reduction modulo `ℓⁿ` of integral comparison is the finite comparison, and the
  squares for adjacent derived reductions commute.
- A torsion integral coefficient object becomes zero after rationalization on both sides.
- On `P¹`, degree two has rank one and the same Tate/orientation coordinate after comparison.

### Dependencies

AlgebraicModuliForArithmeticGeometry §7.10.1 supplies analytification; C0–C4 supply the
coherent algebraization used in §C6.2; C5.1 supplies the constant ordinary resolution.
§§C4.3a–C4.3c supply compactification geometry. C6.0–C6.5 use only the finite-level
étale foundations of LefschetzPencilsAndVanishingCycles §§F.0–F.3, generic site cohomology
and Leray from SchemeAndStackFoundations §§2.1–2.2, and the enhancement/support functors
of ClassicalAdicEtaleCohomology §§0.1–0.4, 0.7–0.8. C6.6 additionally uses §F.4's adic
realizations and ClassicalAdicEtaleCohomology's generic derived limits/completion. UniversalCovers,
RealAlgebraicGeometry Layers 3, 6, AffineMorseLefschetz A4’s compact triangulation leaf
and AlgebraicTopology Stages 2.6 and 6.1 supply the specified topology. C6.1’s
`FiniteModuleLocalSystem` restricts the native functor carrier to finite fibres.
LefschetzPencilsAndVanishingCycles §F.9 consumes C6 for its nearby-cycle/inertia application.

## Worked examples

These computations cross the layers and fix the normalisations that consumers rely on. Each one is
an instance of the named targets, not a separate theorem.

1. **Twists and nilpotent points.** On `P¹`: `h⁰(O(2)) = 3`, `h¹(O(−2)) = 1`, `O(−1)` acyclic, both
   algebraically and analytically, with `HigherImageComparison` matching the Laurent bases
   (`analyticTwistCohomology`). The double point `Spec ℂ[ε]/(ε²) ⊂ P¹` has `H⁰(O) = ℂ[ε]/(ε²)` of
   length two, and multiplication by `ε` is a nonzero square-zero endomorphism that analytification
   keeps (`CoherentAnalytification`, `projectiveGeometricDictionaries`).
2. **An elliptic curve.** For an elliptic curve `E` over `ℂ` (the carrier of the Tau Ceti EllipticCurves
   roadmap), `H⁰(E, Ω¹)` is the one-dimensional space of invariant differentials, it is the `(1,0)` part
   of `H¹_dR(E) ≅ H¹(E^an, ℂ)` (`properDeRhamBetti`, `kaehlerHodgeDecomposition`), and
   `H¹(E^an, ℤ)` is free of rank two with the alternating intersection form (`multiplicativePeriodInterface`).
   A holomorphic isogeny of the analytifications is the analytification of an algebraic isogeny,
   with its group law, finite kernel and degree (`familyMorphismInterface`). No uniformization
   theorem is proved here.
3. **The logarithmic loop.** On `G_m`, `Res₀(dz/z) = 1` and the positive loop period is `2πi`
   (`curveResidueLocalization`, `HolomorphicDeRham.torusPeriod`). `Ω^•(log D)(−D)` computes compact
   support cohomology and its image in `H¹` is the parabolic part, which vanishes for `G_m`
   (`CurveLogComplex`).
4. **Modular normalisation.** With `q = e^{2πiτ}`, `dq/q = 2πi dτ`: the factor `2πi` is the period
   of `dz/z` fixed above (`HolomorphicDeRham.torusPeriod`), and the comparison maps of this roadmap
   carry it unchanged. A downstream Kodaira–Spencer identification, such as that of
   ModularCurvesPartII matching `f(q)(du/u)²` (with `du/u` the relative differential of the Tate
   curve) to `f(q) dq/q` on the base, is not constructed or used here.
5. **Proper moduli fibres.** The proper ambient spaces of PEL moduli and of Baily–Borel
   compactifications, with their nilpotent coherent ideals, use the analytic carrier of C0; the
   proper-source comparison keeps graph projections (`properSourceMorphismAlgebraicity`), while the
   nonproper definable Chow step stays with LogicAndDefinabilityInNumberTheory LD.6.
6. **Relative Hodge and characters.** Over the dual numbers in characteristic zero, the relative Hodge
   bundles are free and commute with base change (`relativeHodgeBundles`); for a finite group of
   invertible order, each character idempotent cuts out a vector-bundle summand. For the identity of
   the standard log point the relative log de Rham complex is `ℂ` in degree `0` and its monodromy is
   `N = 0` (`properLogGagaMonodromy`).
7. **Integral realization.** The algebraic de Rham realization, its rational and integral Betti
   coefficient maps, products and trace (`properDeRhamBetti`, `multiplicativePeriodInterface`) are
   compatible; torsion stays in `H_ℤ` and is killed only by the named coefficient change.

## Downstream consumers

| Consumer | Supplied targets and coefficient boundary |
| --- | --- |
| LefschetzPencilsAndVanishingCycles §F.2 | §§C4.3a–C4.3c / `Compactification`, `DenseCompactification`, `nagataCompactification`, `compactificationCommonRefinement` supply the general qcqs geometry used with its étale coefficients. |
| ClassicalAdicEtaleCohomology §0.8 and its valuation-base support constructions | The same compactification objects and refinements give coherent choice comparisons; that roadmap constructs `ClassicalAlgebraic.properSupports` and retains its own finite-presentation/amplitude hypotheses. |
| SchemeAndStackFoundations §2.19 | §§C4.3a–C4.3c supply only geometry for coherent exceptional inverse image; étale lower shriek has its separate coefficient owner. |
| LefschetzPencilsAndVanishingCycles §F.9 | §§C6.0–C6.6 / `complexAlgebraicTopology`, `topologicalCoefficientComparison`, `riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`, `relativeArtinComparison`, `adicArtinComparison` supply general comparisons; nearby-cycle/inertia compatibility is its application. |
| InverseGaloisAndArithmeticFundamentalGroups §§IG.3.1, IG.5.5 and its Hurwitz topology | C6 supplies finite covers/local coefficients, ordinary comparison on finite-type complex schemes and compact/rational comparison on separated ones. Its puncture, ramification, opposite-group and chosen-path adapters retain their own conventions. |
| AlgebraicModuliForArithmeticGeometry §7.10.1 | Its analytic carrier supplies C6; the ensuing local topology, finite-cover and finite/adic comparisons are C6's outputs, distinct from its coherent GAGA. |
| SchemeAndStackFoundations' finite/adic comparison boundary | §§C6.3–C6.6 supply Artin comparison; its generic site and pro-étale topos foundations remain the inputs to the coefficient owners. |

- **MotivesAndAlgebraicCycles, MC.2** use the algebraic de
  Rham and Betti realizations with `properDeRhamBetti`, `multiplicativePeriodInterface` and
  `chernFubiniStudyIntersection` (functoriality, coefficient change, products, trace, first Chern class
  and intersection normalisation).
- **AlgebraicModuliForArithmeticGeometry §9.10** uses `DivisorialLog`, `LogDeRham`,
  `LogDeRham.SNC` and `LogDeRham.d_squared` as the C5.5 specializations of
  CrystallineCohomology's shared carriers; its residue puts the labelled `dlog` factor first,
  as in C5.6–C5.7. Its §9.5 SNC charts precede the analytic adapter here. CrystallineCohomology
  and DerivedDeRhamCohomology supply the algebraic cores listed under scope; their
  foundational constructions do not import C5.
- **HodgeStructuresPartII** imports the ordinary connection and curvature (H.0), canonical logarithmic
  extensions and the Gauss–Manin comparison (H.2), the proper logarithmic comparison with its monodromy
  triangle and residue normalisation (H.6), and the geometric pure Hodge structure and relative Hodge
  bundles (H.8); variations, period maps and limiting Hodge structures stay there.
- **AbelianSchemesAndArithmeticModuli**, **PELModuli**, **ShimuraVarieties**,
  **ShimuraCompactifications**, **AutomorphicBundles** and **AlgebraicModularFormsAndSerreWeights** use
  coherent analytification, the GAGA dictionaries and the proper-source morphism comparison; Borel's
  algebraicity of nonproper maps is ShimuraVarieties' own V3.
- **MordellLawrenceVenkatesh**, **InverseGaloisAndArithmeticFundamentalGroups**,
  **AbelianVarietiesIsogenousToNoJacobian**, **HyperbolicCurveVolumesAndGonality**,
  **EllipticRegulators**, **Polylogarithms**, **PeriodsAndSpecialValues** and
  **LefschetzPencilsAndVanishingCycles** use the analytic image theorems, Chow's theorem, the affine
  curve comparison, the Gauss–Manin connection, the residue and period normalisations and the
  integration of C5.4.

## References

- J.-P. Demailly, *Complex Analytic and Differential Geometry*, author's public version
  (<https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf>); cited by chapter
  (roman), statement number and page.
- J.-P. Serre, *Géométrie algébrique et géométrie analytique*, Ann. Inst. Fourier 6 (1956), 1–42
  (<https://www.numdam.org/item/AIF_1956__6__1_0.pdf>).
- J.-P. Serre, *Faisceaux analytiques sur l'espace projectif* and *(suite)*, Séminaire Henri Cartan 6
  (1953–54), exposés 18 and 19 (<https://www.numdam.org/item/SHC_1953-1954__6__A18_0.pdf>,
  <https://www.numdam.org/item/SHC_1953-1954__6__A19_0.pdf>).
- A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*, Exposé XII,
  *Géométrie algébrique et géométrie analytique*, revised edition arXiv:math/0206203v2, printed page
  numbers of that edition.
- M. Artin, A. Grothendieck and J.-L. Verdier, *Théorie des topos et cohomologie étale des
  schémas (SGA 4)*, Exposés XI, XII, XVI and XVII; P. Deligne, *Cohomologie étale (SGA 4½)*,
  *Théorèmes de finitude*, §§1–2.
- J. S. Milne, *Lectures on Étale Cohomology*, version 2.21 (2013), §21
  (<https://www.jmilne.org/math/CourseNotes/LEC.pdf>).
- H. Hironaka, *Triangulations of algebraic sets*, Proc. Sympos. Pure Math. 29 (1975), 165–185;
  J. Bochnak, M. Coste and M.-F. Roy, *Real Algebraic Geometry*, Springer 1998, §9.2.
- A. Dimca, *Sheaves in Topology*, Springer 2004, §§2.1–2.5, §3.2 and §4.1.
- B. Bhatt and P. Scholze, *The pro-étale topology for schemes*, Astérisque 369 (2015), 99–201,
  §§5–6 (<https://arxiv.org/abs/1309.1198>).
- The Stacks Project, §§29.6–29.7, §§38.32–38.33 and §63.9, with the Limits locators
  cited in §C4.3b (<https://stacks.math.columbia.edu/>).
- A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique IV₄*, Publ. Math. IHÉS 32
  (1967), §§16.7–16.8, printed pp. 40–44.
- A. Grothendieck, *On the de Rham cohomology of algebraic varieties*, Publ. Math. IHÉS 29 (1966),
  95–103 (<https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf>).
- P. Deligne, *Théorème de Lefschetz et critères de dégénérescence de suites spectrales*, Publ. Math.
  IHÉS 35 (1968), 107–126 (<https://www.numdam.org/item/PMIHES_1968__35__107_0.pdf>).
- P. Deligne, *Équations différentielles à points singuliers réguliers*, Lecture Notes in Math. 163,
  Springer 1970 (<https://publications.ias.edu/sites/default/files/Number9.pdf>), with the author's
  1971 erratum (<https://publications.ias.edu/sites/default/files/Erratum%20to%20SLN%20163.pdf>).
- N. Katz and T. Oda, *On the differentiation of de Rham cohomology classes with respect to
  parameters*, J. Math. Kyoto Univ. 8 (1968), 199–213.
- K. Kato, *Logarithmic structures of Fontaine–Illusie*, in *Algebraic Analysis, Geometry, and Number
  Theory*, Johns Hopkins Univ. Press 1989, 191–224.
- J. Hall, *GAGA theorems*, author's version
  (<https://bpb-ap-se2.wpmucdn.com/blogs.unimelb.edu.au/dist/5/501/files/2021/05/get.pdf>).
- Y. Sella, *Comparison of sheaf cohomology and singular cohomology*, arXiv:1602.06674v3.
- T. tom Dieck, *Differential Manifolds*, author's notes, January 2009
  (<https://www.uni-math.gwdg.de/tammo/GT03.pdf>).
- Y. Peterzil and S. Starchenko, *Complex analytic geometry in a nonstandard setting*, author's version
  (<http://math.haifa.ac.il/kobi/Newton.pdf>); H. Whitney, *Complex Analytic Varieties*,
  Addison-Wesley 1972, Theorem 9F, p. 240 (quoted there).
- L. Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106v1;
  L. Qian, *Potential automorphy for GL_n*, Invent. Math. 231 (2023), 1239–1275; NSF public access
  version (<https://par.nsf.gov/servlets/purl/10388233>).
- V. Dimitrov, Z. Gao and P. Habegger, *Uniformity in Mordell–Lang for curves*, Ann. of Math. 194
  (2021); arXiv:2001.10276v3.
- B. Bakker, B. Klingler and J. Tsimerman, *Tame topology of arithmetic quotients and algebraicity of
  Hodge loci*, J. Amer. Math. Soc. 33 (2020), 917–939.
- A. Caraiani and P. Scholze, *On the generic part of the cohomology of compact unitary Shimura
  varieties*, Ann. of Math. 186 (2017); arXiv:1511.02418v1.
- N. Mok, J. Pila and J. Tsimerman, *Ax–Schanuel for Shimura varieties*, Ann. of Math. 189 (2019);
  arXiv:1711.02189v3 (motivation for the graph interface of C4.4).
- TauCetiRoadmap: AlgebraicVectorBundles, DifferentialGeometry, AlgebraicTopology, PDE,
  JacobianChallenge, StableReduction, AlgebraicCurves and the completed HodgeStructures roadmap, as cited in *Exact supplier contracts*.

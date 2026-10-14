# Roadmap: algebraic topology of spaces and manifolds

This roadmap develops the map-level algebraic topology needed to calculate spaces from open
covers, CW structures, fibrations, and manifold decompositions.  It starts at Mathlib's singular
chains, fundamental groupoid, topological pairs, cubical homotopy groups, and classical CW
complexes.  It ends with reusable van Kampen, relative homology, excision, cellular comparison,
duality, Euler-characteristic, Hurewicz, Whitehead, ordinary Eilenberg–MacLane
representability, and relative obstruction theorems.

The point is a coherent library, not a collection of answers for particular spaces.  Every
calculation is induced by maps, chain maps, or natural transformations.  Homology groups are not
stored as fields asserting the desired answer, and a list of cell counts is not accepted in place
of an actual CW structure.

Suggested homes are `TauCeti/AlgebraicTopology/FundamentalGroupoid/`,
`TauCeti/AlgebraicTopology/Singular/`, `TauCeti/AlgebraicTopology/Cellular/`,
`TauCeti/AlgebraicTopology/Cohomology/`, and `TauCeti/AlgebraicTopology/Homotopy/`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti supplies all of the following, with naturality and the
stated coefficient generality.

1. The fundamental-groupoid functor sends an open cover to the appropriate colimit and yields
   based van Kampen and presentation corollaries without connectedness assumptions on
   intersections.
2. Relative singular homology is a functor on `TopPair`, obtained through `SSetPair`, and satisfies
   the long exact sequence, homotopy invariance, excision, Mayer--Vietoris, dimension, and
   additivity axioms, including local-coefficient pair/triple sequences,
   transported homotopy invariance, excision and Mayer--Vietoris.
3. Mathlib's `CWComplex` and `RelCWComplex` structures have cellular chain complexes whose
   homology is naturally isomorphic to singular homology, including module-valued local
   systems with attaching-path transport. Cofibration, mapping-cylinder,
   cellular-approximation, and skeletal-induction APIs make those comparisons usable.
4. Mapping tori, finite covers, finite open covers, and fibre bundles have reusable chain-level
   tools: Wang and transfer sequences, coefficient-sensitive Kunneth theorems, Cartan--Leray and
   Serre spectral sequences, torus calculations, and a finite-open-cover Čech double complex.
5. Singular cohomology, cup and cap products, twisted relative fundamental
   classes, both local-coefficient Poincare--Lefschetz forms and their oriented
   integral corollaries, and Euler characteristic are available with naturality.
6. Relative homotopy groups, Hurewicz, Whitehead, and homological Whitehead are proved for CW
   complexes and then for spaces of CW type.  The cubical and Kan-simplicial models of homotopy
   groups are naturally compared rather than allowed to form separate incompatible APIs.
7. Countable towers have the generic lim/lim¹, exact-sequence, Mittag--Leffler
   and integer-graded Milnor APIs, including cofinal-shift naturality, the
   derived-limit cone and its maps for specified homotopy-commuting squares.

8. Ordinary cohomology is represented on arbitrary CW complexes and CW pairs by the shared
   Eilenberg–MacLane models; nonabelian classifying spaces, universal classes, loop comparisons,
   and primary relative obstruction cochains have explicit normalization and transport maps.

The scope includes ordinary cohomology on arbitrary CW complexes and the tools needed for
compact manifolds and finite CW-type spaces.  It
does not include generalized cohomology theories, spectra, bordism, or surgery obstruction
groups.  Those theories consume this roadmap's chain, CW, duality, and homotopy interfaces.

## Ownership and dependencies

- The [universal-covers roadmap](../../Completed/UniversalCovers/README.md) owns universal-cover
  construction, deck transformations, quotient covers, basepoint change, and induced maps on
  homotopy groups.  This roadmap consumes those maps, extends the higher-homotopy API with
  relative groups and comparison theorems, and does not construct another universal cover.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns smooth and PL
  triangulations, manifold boundaries and collars, gluing, connected sum, cobordism carriers,
  and geometric surgery.  This roadmap owns algebraic topology of CW pairs and proves results
  about any space of CW type. The finite-dimensional Hausdorff second-countable
  smooth-manifold CW comparison consumes geometric topology's smooth triangulation;
  compact manifolds have finite CW type.
- The [differential-geometry roadmap](../DifferentialGeometry/README.md) owns the
  Mathlib-compatible manifold orientation and degree API (its layers 2 and 10),
  and the outward-normal-first boundary orientation of Layer 5.1, which the
  [Heegaard Floer roadmap](../HeegaardFloer/README.md) also consumes.  This roadmap consumes it to
  compare smooth orientations with sections of the homological orientation
  system, construct twisted relative fundamental classes and their oriented
  integral specializations, and own the chain-level proof and consequences of
  manifold duality.
- The differential-geometry roadmap consumes this roadmap's singular chains and cochains, relative
  cohomology, subdivision and small chains (Stages 2, 3 and 6), and needs Stage 6's universal
  coefficients, cup product and cochain Mayer--Vietoris sequence for the de Rham theorem.  It owns
  smooth singular chains, integration over them, and the de Rham comparison, and constructs no
  second singular theory.
- The [profinite-cohomology roadmap](../ProfiniteCohomology/README.md) owns continuous
  cohomology of profinite groups.  The singular cohomology here is cohomology of topological
  spaces; neither development introduces a second version of the other's objects.
- [DGFloer](../DGFloer/README.md) Layer 1 item 4 owns the single functorial
  abelian K(A,n) family: its degree-one model aliases Stage 8.8's generic bar
  construction, and n≥2 uses the fixed Dold–Kan Γ(A[n]) realization. It owns
  the coefficient-natural normalized π_n identification, including comparison
  of Γ(A[1]) with the abelian nerve. Stage 8.8 owns the generic discrete-group
  bar/CW/cover proof and consumes no DGFloer EM constructor. Stage 8.10
  consumes that abelian family and DGFloer Layer 1 item 1's degree-one Hurewicz.
  DGFloer's constructor uses only AT8.1–8.8, preceding representability and
  obstruction theory; its Layer 1 item 2 owns the Serre-fibration carrier and ordinary homology
  Serre spectral sequences consumed in 5.5; its CW approximation is used in 8.11.
  The standing Moore-loop comparison and Layer 2 item 3 supply loop carriers;
  [HomotopySpheres §3A](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284)
  owns the pointed compactly generated suspension–loop adjunction.
- [HomotopySpheres §3A.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284)
  owns the compact-generation coreflection and CW comparison consumed by
  4.5's kified CW product and 8.10–8.11. [GeneralizedCohomology G2.1](../GeneralizedCohomology/README.md)
  owns the single simplicial-realization product comparison consumed by
  8.10–8.11; its foundation uses AT4/8.2 and this compact-generation API,
  with no ordinary representability, EM-family or HA input.
- [Topological K-theory](../TopologicalKTheory/README.md) T1.6 owns the named
  fixed-rank infinite Grassmannian carriers, their final/weak CW topology and
  universal bundles. [CharacteristicClasses C1.5](../CharacteristicClasses/README.md)
  owns the finite-projective/cellular/cup comparisons on their rank-one RP∞
  and CP∞ carriers. Stage 8.12 consumes that construction/comparison portion
  and owns only their identification as ordinary EM spaces. Those portions
  use earlier CW/cohomology tools and do not consume Stage 8.12.
- The high-dimensional differential-topology and homotopy-sphere roadmap consumes Hurewicz,
  Whitehead, duality, finite CW type, and the homology of spheres from this roadmap.  Stable
  homotopy, framed bordism, and the Kervaire--Milnor calculation live there.

## Encoding conventions

These choices are part of the specification.

- **Use Mathlib's categories.**  Spaces and maps live in `TopCat`; pairs live in `TopPair` and
  `SSetPair`; chains live in `ChainComplex`; exact sequences use the existing homological-complex,
  `ShortComplex`, and exactness APIs.  Do not bundle a space together with claimed homology.
- **Keep maps visible.**  Every induced map is the image of a continuous map, a pair map, or a
  chain map.  A result expressed only as unrelated equivalences in each degree is incomplete.
- **Work at natural coefficient generality.**  Singular chains and relative homology take a
   coefficient object in the appropriate preadditive category.  Module-valued corollaries state
   the ring and module hypotheses they use.  Field isomorphisms, PID or hereditary-ring short
   exact sequences, and general-ring spectral sequences are separate theorems.  Integral
   specialization occurs only where orientations, torsion, degree, or Euler characteristic
   require it.
- **Use groupoids before groups.**  Van Kampen is first a colimit theorem for the fundamental
  groupoid on a set of basepoints.  The familiar based group theorem is derived under explicit
  path-connectedness hypotheses.  Disconnected intersections never acquire arbitrary paths.
- **Use actual CW structures.**  Cellular chains use `CWComplex.cell` and characteristic maps;
  relative statements use `RelCWComplex`.  Attaching degrees define differentials, and the proof
  that consecutive differentials compose to zero comes from the filtration exact couple.
- **Pin reduced and unreduced conventions.**  Reduced homology is the kernel of augmentation in
  degree zero and agrees with ordinary homology in positive degrees.  Relative homology of
  `(X, empty)` agrees naturally with ordinary homology.  All connecting morphisms use the
  homological grading convention `d : C_(n+1) -> C_n`.
- **Pin signs once.**  The singular boundary uses the alternating deletion convention.  The
  Mayer--Vietoris map from an intersection is `(i_U, -i_V)`, the cochain differential is induced
  by precomposition with the chain differential, and cup/cap signs follow the
  Alexander--Whitney convention. Pin cap to Hatcher's front-face/back-face formula
  `σ⌢φ=φ(σ|[v₀,…,v_k])·σ|[v_k,…,v_n]`. In the local-coefficient version,
  pair coefficients at v₀ and transport the result along [v₀,v_k] to the
  first vertex of the surviving back face. Its boundary identity is
  `∂(c⌢φ)=(−1)^k(∂c⌢φ−c⌢δφ)` for φ of degree k.
  Convention-checking examples below must compute with these signs.
- **Treat homotopy models by comparison.**  Mathlib's cubical `HomotopyGroup` remains a public
  interface.  Kan-simplicial homotopy groups are also constructed because they interact well
  with `TopCat.toSSet`; a natural comparison identifies the two, including induced maps,
  basepoint change, suspension, and relative boundary morphisms.
- **Base relative homotopy in the subspace.**  Relative homology remains a functor on unbased
  `TopPair`, but relative homotopy uses a `BasedTopPair` containing `pair : TopPair` and
  `basepoint : pair.snd`. Its morphisms are pair maps whose subspace component preserves that
  point. Relative cubes, groups, boundary maps, the long exact sequence, basepoint change,
  functoriality, and relative Hurewicz all take this based carrier; no declaration chooses a point
  from a bare pair.
- **Finiteness is a hypothesis.**  Euler characteristic is defined for finite CW structures and
  extended to finite-CW-type spaces by transport and invariance.  Additivity and multiplicativity
  state the necessary cofibration, excision, and finite-generation hypotheses.

## Inventory: consume Mathlib and follow its interface direction

The development starts from these current APIs.

- `TopCat`, `TopCat.toSSet`, `SSet.chainComplex`, `singularChainComplexFunctor`, and
  `singularHomologyFunctor`.
- `TopPair`, `TopPair.ofSubset`, `TopPair.incl`, `TopPair.diag`, and the
  `TopPair.HomologyPretheory` classes already present at the dependency pin.
- `FundamentalGroupoid`, `FundamentalGroup`, induced maps, homotopy invariance, and Mathlib's
  covering and homotopy-lifting APIs.
- Tau Ceti's native `LocalCoefficientSystem` and its constant/pullback/
  transport API in `TauCeti.AlgebraicTopology.LocalCoefficient`, absolute
  twisted chains in `TauCeti.AlgebraicTopology.Singular.Twisted.Basic`, and
  `TopPair.twistedChainComplex`/`twistedHomology` in its `Twisted.Relative`
  module. Ordinary relative chains use `TopPair.singularChainComplexFunctor`
  from `TauCeti.AlgebraicTopology.Singular.Relative`; ordinary cohomology uses
  `TopCat.singularCohomology` from `TauCeti.AlgebraicTopology.Cohomology.Basic`.
  Native `LocalCoefficientSystem.twistedCochainComplex` and
  `TopPair.twistedCochainComplex` in `Cohomology.Twisted.Basic`/`Relative`
  apply Hom to L-twisted chains, so they compute dual-system cochains.
  Consume those constructions with their dual-system convention, and build
  direct L-valued cochains without assuming fibrewise reflexivity.
  Consume these carriers and extend their APIs for the comparisons below.
- Native relative quotient colimits and short exact sequences in `Singular.Relative`,
  pair/triple sequences in `Singular.Triple`, `singularHomologyPretheory` in
  `Singular.HomologyPretheory`, and the `DiskSphere`, `DiscretePair` and
  `Additivity` modules. Consume their constant-coefficient objects and proofs,
  extending the comparisons and local-coefficient theory below.
- Native `FundamentalGroupoid.CoverGeneration`, groupoid `Pushout`,
  `FundamentalGroup.VanKampen` and `WedgeSum`, and `FundamentalGroupoid.Circle`:
  cover generation, two-open-set groupoid/group pushouts, the wide-groupoid
  van Kampen equivalence, wedge-of-circles free groups and the disconnected
  two-arc circle test. Extend their naturality and example computations.
- Native `TopCat.eilenbergZilberHomotopyEquiv`, Alexander–Whitney and shuffle
  maps in `Singular.EilenbergZilber`/`AlexanderWhitney`/`Shuffle`; the missing
  local-coefficient and Kunneth extensions use these maps.
- Native Euler–Poincare and finite-generation results in
  `Cellular.EulerCharacteristic.Basic`/`Singular`, including
  `finsum_finrank_singularHomology_of_finite_cwComplex`; transport the native
  alternating cell count to finite-CW-type spaces rather than introducing
  another cellular Euler invariant.
- Tau Ceti's native `FundamentalGroupoid.cechDiagram`, `cechCocone` and
  `isColimitCechCocone` in `FundamentalGroupoid.Cech.Diagram`/`Colimit`, using
  the `Grpd` category and native nonempty finite-intersection `CechIndex`.
  Its map/refinement modules supply functoriality; consume the colimit and
  extend the group-presentation and example consequences below.
- Native `TopPair.excisionMap` and its singular-homology isomorphism theorems
  in `Singular.Excision`, and `TopCat.mayerVietorisδ`/`mayerVietoris_exact₁`–`₃`
  in `Singular.MayerVietoris.Basic`, with subdivision and small-chain suppliers.
  Consume these maps and extend them to local coefficients.
- Native `TauCeti.cellularChainComplex`, `cellularChainGroupIso` and
  `cellularSingularHomologyIso` in `Cellular.Chains`/`Coproduct`/`Comparison`.
  They use relative CW skeleta, T2 ambient spaces, abelian-category coefficients
  and exact cell-indexed coproducts; the current homology comparison requires
  a finite-dimensional relative CW complex. Stage 4 extends that carrier to
  arbitrary CW dimension, chosen chain representatives and local systems.
- Native `TopCat.singularCap` and singular cup products in `Cohomology.Cap.Basic`
  and `Cohomology.Cup`. Consume their Alexander–Whitney maps and pairings,
  extending to direct local-system cochains, relative products and duality.
- Abstract and classical `CWComplex`/`RelCWComplex`, subcomplexes, skeleta,
  `CWComplex.FiniteDimensional`, `CWComplex.FiniteType`, and `CWComplex.Finite`.
- `HomotopyGroup`, based cubes, `ContinuousMap.HomotopyEquiv`, mapping cones and pointed cones,
  category-theoretic colimits, chain homotopies, homology functors, and exact couples.

The following Mathlib pull requests determine interface shapes.  Import every declaration present
at the dependency pin.  Implement the rest in Tau Ceti now with the same object and map shapes,
and replace local code by imports whenever a later pin supplies it.

- [mathlib4#44117](https://github.com/leanprover-community/mathlib4/pull/44117):
  generic `Projectivization.instTopologicalSpace`, `isQuotientMap_mk'`,
  `continuous_mk'`, `continuous_mk`, `continuous_iff`, `continuous_map`,
  `isOpenMap_mk'`, `isOpenQuotientMap_mk'`, `mk'_eq_mk'_iff` and
  `preimage_image_mk'`, together with `SubMulAction.continuousConstSMul`
  and `Units.continuousConstSMul_nonZero`. Stage 4.6
  builds the absent interface here with these shapes: division-ring modules
  with a topology for quotient continuity, and `ContinuousConstSMul 𝕜ˣ V`
  for the open-quotient theorem; its manifold examples specialize to ℝ and ℂ.
- [mathlib4#41603](https://github.com/leanprover-community/mathlib4/pull/41603): the
  fundamental groupoid as a cosheaf and van Kampen as a colimit theorem.
- [mathlib4#41285](https://github.com/leanprover-community/mathlib4/pull/41285): relative
  simplicial homology through `SSetPair`.
- [mathlib4#38369](https://github.com/leanprover-community/mathlib4/pull/38369): the remaining
  Eilenberg--Steenrod axiom-class interfaces for `TopPair.HomologyPretheory`.
- [mathlib4#42435](https://github.com/leanprover-community/mathlib4/pull/42435): homotopy groups
  of Kan simplicial sets.
- [mathlib4#30109](https://github.com/leanprover-community/mathlib4/pull/30109) and
  [mathlib4#29792](https://github.com/leanprover-community/mathlib4/pull/29792): the lattice of
  CW subcomplexes and the colimit universal property of skeleta.
- [mathlib4#28246](https://github.com/leanprover-community/mathlib4/pull/28246): simple
  connectivity of spheres of dimension greater than one.

## Stage 1: van Kampen through the fundamental groupoid

This stage is independent of Stages 2--8.

1. For an open cover `U : i -> Opens X`, consume the native Cech diagram of all nonempty finite
   intersections, with inclusion functors between their fundamental groupoids.  State the cover
   using native `TopologicalSpace.IsOpenCover U` and its union/supremum cover criterion.
2. Consume native cover generation by subdivision of paths: every morphism in `FundamentalGroupoid X` is a composite of
   morphisms lying in cover members. Derive from the native colimit that two
   such composites agree exactly under the Cech relations.
3. Consume the native cocone to `FundamentalGroupoid X` and its colimit universal property,
   including naturality under maps of covered spaces and refinement of covers.
4. Consume native groupoid and fundamental-group two-open-set pushouts and the based theorem when the two opens and their
   intersection are path connected and contain the basepoint.  Derive iterated finite-cover and
   group-presentation corollaries.
5. Consume the native groupoid calculation on a circle covered by two arcs with disconnected intersection and
   on a wedge of circles.  The first check must use more than one basepoint and the second must
   consume the native wedge-of-circles free-group equivalence and recover its presentation maps.

The proof spine is Brown, *Topology and Groupoids*, Chapters 6--7: subdivision gives generation,
the square-grid subdivision of a homotopy gives relations, and the universal property identifies
the colimit.  Hatcher, *Algebraic Topology*, Section 1.2 supplies the based corollaries.

## Stage 2: relative singular chains and homology

1. Consume native relative singular chains on `TopPair`, obtained by applying the `SSetPair` relative-chain
   construction to `TopCat.toSSet`. Consume its cokernel colimit and exhibit the relative complex both as the quotient
   `C_*(X) / C_*(A)` and in the exact-sequence form selected by #41285, and prove the two forms
   naturally isomorphic.
2. Define the relative homology functor for coefficient objects in the natural preadditive
   category.  Prove functoriality, compatibility with composition, and the comparison
   `H_*(X, empty) ~= H_*(X)`.
3. Consume the native short exact sequence of chain complexes for a pair and its natural long
   exact sequence, with its connecting morphism and naturality square.  Do the same for triples
   `B subset A subset X`.
4. Consume native `singularHomologyPretheory` and its homotopy invariance, dimension and additivity,
   extending its interfaces and proving reduced/unreduced comparison in the interface shape of #38369.
5. Consume the native `(D^n,S^(n-1))`, point, discrete-space and disjoint-union calculations,
   extending their natural comparisons and local-coefficient instances.  These calculations
   fix the degree-zero and connecting-map conventions used in every downstream stage.
   Own the integral `coordinateCubeReferenceClass`: [I,∂I] is the class of
   t↦t with boundary [1]−[0]; [I^n,∂I^n] is its coordinate-order n-fold
   native Eilenberg–Zilber shuffle product, projected to relative chains.
   Prove its cycle/generator property and boundary-facet signs. Own
   `coordinateCubeSupBallHomeomorph`: t↦(2t_j−1)_j from Iⁿ to the native
   sup-norm closed unit ball in Fin n→ℝ. Own `supBallEuclideanDiskHomeomorph`:
   x↦(‖x‖_∞/‖x‖₂)x for x≠0 and 0↦0, using the native coordinate linear
   equivalence to EuclideanSpace. Pin these actual formulas and boundary
   images for all n≥0. Their positive radial factors preserve the ordered
   coordinate orientation. Define the sup-ball and Euclidean-disk reference
   classes by the actual pair-map pushforwards of the cube class; prove their
   comparisons. Own `coordinateDiskNativeComparisonCoefficient` as the actual
   value of native singularHomologyDiskBoundaryPairIso on the coordinate disk
   class, and prove it is a unit; at dimension zero it is 1 by augmentation.
   This early normalization supplies cellular generators, independently of
   Stage 4.4's quotient homeomorphisms. Stage 4.4
   consumes these same maps and classes, with no earlier input from Stage 4.
   Stage 4 uses this early class for cell orientations; Stage 6 later proves
   equality with the coordinate-oriented ball's canonical relative fundamental
   class. This reference construction uses only native chains/shuffles and
   relative homology, without Stage 6 manifold duality. Own the sphere's
   normalized reference class by its positive local chart
   v↦(sqrt(1−‖v‖²),v), with positively scaled chart cube and outward-first
   local generator; use the native sphere homology/excision API to specify
   its unique absolute class. Stage 4.4 compares q to this earlier class.
   Own `coordinateCubeReferenceChain_eq_shuffle`: after the actual coordinate
   product identifications, the signed triangulation chain equals the native
   iterated `TopCat.shuffle` of the n positive interval chains, factor order
   0,…,n−1. Prove the permutation/inversion sign equality, including n=0.
6. Define a local coefficient system as a functor from Mathlib's fundamental groupoid to the
   coefficient-module category. A simplex σ carries its chain coefficient at
   σ(e₀); its zeroth face transports that coefficient along [e₀,e₁], while
   other faces retain the first vertex. Consume native twisted chains, relative
   homology, map pullbacks, basepoint/monodromy formulas and constant-system
   comparison; extend their naturality and remaining APIs. Construct the pair/triple short
   exact sequences and their natural long exact sequences. Prove homotopy
   invariance with the coefficient-system identification transported along the
   homotopy, including relative homotopies. This uses the existing groupoid object and does
   not depend on Stage 1's van Kampen theorem.

7. Own the single generic no-retraction and finite-dimensional Brouwer
   theorem. DifferentialGeometry 10.5 consumes it and supplies its degree
   proof comparison. Own the fixed-point theorem for every nonempty compact
   convex subset C of a real finite-dimensional normed space E:
   `brouwerFixedPoint_compactConvex` states that each continuous self-map of
   the actual subtype C has a fixed point. The function-level adapter
   `brouwerFixedPoint_compactConvex_continuousOn` takes ContinuousOn f C and
   MapsTo f C C. No full-dimensional or nonempty ambient-interior hypothesis
   is imposed. Give closed-ball (including radius0), simplex, singleton,
   transport along affine homeomorphisms and homeomorphic-domain
   specializations, with native
   Function.IsFixedPt and the compact fixed-point locus obtained from the
   native `isClosed_fixedPoints` in Mathlib/Dynamics/FixedPoints/Topology.
   First prove `noRetraction_diskBoundary` using the already-proved native
   `TauCeti.reducedSingularHomologyTopCatSphereIso`,
   `TauCeti.TopCat.contractibleSpace_disk` and
   `TauCeti.isZero_reducedSingularHomologyFunctor_of_contractibleSpace`.
   These native sphere/vanishing prerequisites precede this theorem;
   its proof does not consume Stage3's later Mayer–Vietoris computation.
   Apply reduced H_(n−1) with integral coefficients to the retraction
   equation: for n≥1 the identity of ℤ would factor through the zero
   module. The empty boundary at dimension0 is treated directly.
   A fixed-point-free disk map gives its continuous
   retraction along the ray from f(x) through x; pin that construction and
   its boundary identity, and derive `brouwerFixedPoint_topCatDisk`.
   For general C work inside affineSpan ℝ C, choose a point of the native
   intrinsicInterior, and construct `compactConvexClosedBallHomeomorph`
   from its direction-space unit ball by the continuous positive radial
   reach `compactConvexRadialReach C c u =
   sSup {t : ℝ | 0≤t ∧ c+t•u∈C}` for unit direction vectors u.
   Prove this reach is finite, positive, attained and continuous on the
   direction-space unit sphere, and that the radial homeomorphism takes
   t•u to c+(t*reach(u))•u for 0≤t≤1. Prove its comparison with the
   inverse of Mathlib's native `gauge` on
   {v:(affineSpan ℝ C).direction | c+(v:E)∈C}; use its existing convex-gauge
   continuity and homogeneity API. Prove the boundary/intrinsicFrontier comparison;
   dimension0 is a singleton. Own `normedUnitBallTopCatDiskHomeomorph`:
   for a finite-dimensional real normed E of rankk, its unit closed ball
   is homeomorphic to the actual lifted TopCat.disk k. Take as data a continuous
   linear equivalence e:E≃L[ℝ]EuclideanSpace ℝ (Fin k) and use
   x↦(||x||/||e(x)||)e(x), with value0 at0, followed by the native ULift
   homeomorphism. Pin `_apply`, `_symm_apply`, `_zero` and `_norm`;
   prove the inverse radial formula, center and norm equality;
   the latter identifies boundaries. Compose this with the direction-space
   homeomorphism to apply the native-disk theorem to general C.
   Export `brouwerFixedPoint_compactConvex_finiteSpan` when C lies in a
   specified finite-dimensional submodule V of an arbitrary real normed
   ambient space: restrict its subtype and map to V, apply the theorem there,
   and transport the fixed point back. Finite convex hulls use the span of
   their finitely many vertices. This uses existing sphere/disk APIs
   independently of manifold duality. Analytic
   Schauder compact-map approximation and Lomonosov's operator theorem are
   owned by BanachAlgebras A8 and consume this finite-dimensional theorem.
   Follow the native fixed-point vocabulary and compare the compact-convex
   statement with [the Lean community Brouwer interface](https://lean-lang.org/eval/problems/brouwer_fixed_point/).
   The [Zulip homology/Sperner discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Brouwer%27s.20fixed.20point.20theorem.3F.html)
   records the compatible homology proof direction;
   [QICLean's compact-convex development](https://sirui-lu.com/QICLean/docs/QICLean/Topology/CompactConvexFixedPoint.html)
   supplies a comparison source for its function-level API and metric-projection
   proof. Use the direction-space radial construction here, and compare the
   resulting fixed-point statement without duplicating native closed-locus lemmas.
   Compare [Brendan Murphy's homological Brouwer development](https://github.com/Shamrock-Frost/BrouwerFixedPoint)
   on the native chain/homology carriers here, retaining its convex-body
   transport proof as migration material rather than another homology API.
   Follow Mathlib [#36770](https://github.com/leanprover-community/mathlib4/pull/36770)'s
   `BrouwerFixedPoint E` closed-unit-ball hypothesis. The exact adapter
   `brouwerFixedPoint_unitClosedBall_continuous` takes
   f:closedBall(0:E)1→closedBall(0:E)1 and Continuous f and yields
   ∃x,Function.IsFixedPt f x. Prove it from the continuous-map theorem;
   for real inner-product E it supplies that PR's class field, with no
   assumption of a Brouwer instance. Adopt the upstream class interface
   when it lands.

The source spine is Eilenberg--Steenrod, *Foundations of Algebraic Topology*, Chapters I--III,
and Hatcher, Sections 2.1--2.2 and 3.H.  The Lean proof should pass through short exact sequences
of chain complexes and Mathlib's homology functor, rather than reconstructing an elementwise
exact sequence in every application.

## Stage 3: subdivision, excision, and Mayer--Vietoris

This stage consumes Stage 2.

Every subdivision, prism, small-chain, excision and Mayer–Vietoris construction
in this stage includes Stage 2's local coefficient systems. Transport along
paths in each contractible simplex gives its subdivision coefficients; prove
naturality in both space maps and coefficient-system morphisms, and compatibility
with the pair/triple connecting maps.

1. Define affine subdivision of the standard simplex and barycentric subdivision of singular
   simplices in every degree.  Prove the boundary formula and construct the prism operator giving
   a chain homotopy from subdivision to the identity.
2. For an open cover, prove that every singular simplex becomes subordinate after sufficiently
   many subdivisions.  Turn the small chains into a subcomplex and prove its inclusion is a
   natural chain-homotopy equivalence.
3. Consume native excision for `TopPair` and extend to local coefficients: if the closure of the excised set lies in the interior of the
   subspace, the induced map on relative homology is an isomorphism.  Include maps of excision
   data and compatibility with the pair connecting morphism.
4. Consume native Mayer--Vietoris for a binary open cover and extend its natural
   long exact sequence to local coefficients.  Prove that its first map is `(i_U, -i_V)` under the pinned sign convention.
5. Check Mayer--Vietoris on `S^1` from two arcs and on `S^n` from two hemispherical
   neighbourhoods, including the connecting isomorphism in top degree.

Hatcher, Proposition 2.21 and the proof of excision in Section 2.1 give the small-chain proof;
Section 2.2 gives Mayer--Vietoris.  Eilenberg--Steenrod supplies the natural formulation for
pairs.

## Stage 4: CW pairs, cellular homology, and cofibrations

This stage consumes Stages 2 and 3. Use the native cellular complex and its
relative-CW carrier, with its Hausdorff and exact-coproduct hypotheses; module
coefficients satisfy the categorical exactness assumptions. Extend its API below.

1. Use Mathlib's characteristic maps and skeleta and native `cellularChainGroup`
   in degree n as the relative homology of consecutive skeleta. Consume
   `cellularChainGroupIso` to identify it with cell-indexed coproducts. In modules,
   identify it naturally with finitely supported coefficient-module-valued
   functions on `RelCWComplex.cell C n`, with the relative base explicit.
   For coefficient module R this is the free R-module on the cells. Use
   finite-support rather than finite-cell assumptions in the general definition.
2. Consume native `cellularDifferential` and its triple connecting-map description,
   including `d²=0`; identify its matrix entries with degrees of attaching maps,
   and prove naturality for cellular maps.
3. Consume native `cellularSingularHomologyIso` for finite-dimensional relative
   CW complexes and extend it to arbitrary CW dimension. Prove compact singular
   simplex images lie in finite subcomplexes, identify singular chains with the
   filtered colimit over skeleta, and pass to homology using exact filtered
   colimits in module categories (or displayed exactness assumptions in
   categorical coefficient generality). Construct the skeletal filtration exact
   couple and prove the cellular-to-singular comparison as a natural equivalence
   in the filtered derived or chain-homotopy category. Normalize oriented cell
   generators by pushing forward Stage 2.5's
   coordinate-oriented ball class through the characteristic map; reversing
   the orientation negates that generator. Construct chosen chain
   representatives, with naturality only up to specified chain homotopies; do
   not claim a strict natural transformation from cellular chains to ordinary
   singular chains. Extend the comparison to `RelCWComplex` and subcomplex pairs.
   Extend items 1–3 to Stage 2's module-valued local systems,
   with attaching-path transport and relative comparison. The degree-n chain
   module is the direct sum over n-cells of their integral orientation module
   tensored with the coefficient fibre at a chosen cell point, with the ring
   acting on the coefficient factor. A chosen cell orientation identifies that
   summand with the fibre; arbitrary coefficient fibres need not be free.
4. Consume native finite-CW Euler--Poincare and finite-generation results;
   extend their coefficient hypotheses, naturality and local-coefficient consequences.
   Own the earlier pointed quotient carrier `ordinaryPairQuotient`: collapse
   B together with a separately added point in X⊔*, with the quotient topology,
   actual collapse map, universal mapping property and subspace naturality.
   Thus X/∅ means X₊. Item 5 consumes this carrier for relative comparisons.

   Own the single chosen based sphere identifications
   `diskQuotientSphereHomeomorph`, `coordinateCubeQuotientSphereHomeomorph`,
   `sphereSmashHomeomorph` and `reducedSuspensionSphereHomeomorph` for all
   n,m≥0. Use native `TopCat.disk n`, its actual boundary-inclusion image,
   and native `TopCat.sphere n` (the lifted metric sphere); its basepoint
   is the positive first-coordinate pole p. The disk/cube quotient's basepoint
   is the collapsed boundary together with the added point. For n=0 the
   boundary is empty: D⁰⊔* is sent bijectively to S⁰ with its disk point at −p
   and its added point at p. For n>0, the cube-to-sphere map is the same
   `cubicalSphereQuotient` used by item 8.6. Construct the coordinate-order
   `coordinateCubeDiskHomeomorph` as the composite of Stage 2.5's
   coordinateCubeSupBallHomeomorph and supBallEuclideanDiskHomeomorph,
   with their boundary maps; the induced quotient homeomorphism commutes with both
   chosen sphere homeomorphisms and the actual collapse maps. These
   equations determine the two quotient homeomorphisms from the same q.


   Use the same pointed quotient to construct the compact based smash carrier
   (X×Y)/(X×{y₀}∪{x₀}×Y) and reduced suspension
   (X×I)/(X×∂I∪{x₀}×I), with the collapsed locus at the added point.
   The bare smash model is used here for compact Hausdorff inputs,
   including spheres; the raw suspension also applies to pointed Hausdorff CW
   spaces because X×I and its quotient are compactly generated. Own
   `compactBasedSmashCarrierComparison`, `compactReducedSuspensionCarrierComparison`
   and `cwReducedSuspensionKelleyComparison`: these compare the raw quotient Z
   with kZ using only HomotopySpheres §3A.1's coreflection, compact and CW
   compact-generation/locally-compact-product API. Pin their inverse to the
   actual inclusion/coreflection counit, with quotient/basepoint naturality.
   This item has no input from §3A.2. That later item owns
   `compactConvenientSmashComparison`, `compactConvenientSuspensionComparison`
   and `cwConvenientSuspensionComparison`, comparing its pointed convenient
   constructions with these same kified raw quotients. It consumes this item's
   k-counit comparisons. RiemannianGeometry R3 uses that two-stage adapter.

   Own their quotient maps and continuity/universal-property API.
   `sphereSmashHomeomorph` sends Sᵐ∧Sⁿ to S^(m+n), with m coordinates
   followed by n coordinates; `reducedSuspensionSphereHomeomorph` sends
   Σ_right Sⁿ to S^(n+1), with the interval coordinate last. Prove their
   compatibility through I/∂I≃S¹, their basepoint equations, and the diagrams
   with cube concatenation as exact equations: sphereSmashCubePairMap m n
   equals basedCubeSpherePairMap (m+n), and
   reducedSuspensionSphereCubePairMap n equals basedCubeSpherePairMap (n+1).
   The surjective cube maps determine these homeomorphisms uniquely.
   Include associativity (with the dimension reassociation) and unit diagrams,
   whose nonbasepoint of S⁰ is −p, and
   the factor-interchange degree (−1)^(mn). These are actual based
   homeomorphisms, before homotopy, James or stable-spectrum constructions;
   item 8.11 supplies the homology/cohomology suspension machinery and owns
   `reducedSuspensionTwoStepHomeomorph`, from its CB/B quotient followed by
   collapse of the basepoint meridian to the same raw interval-last quotient,
   with identity formula on (x,t) representatives.
   GeneralizedCohomology supplies its categorical monoidal adapters.

   Pin `basedSphereReferenceGenerator` in H_n(Sⁿ,{p};ℤ) independently:
   for n≥1 it is the image of the Stage 2.5 positive-local-chart/outward-first
   sphere class, and for n=0 it is [−p]−[p], using native
   `reducedSingularHomologySphereZeroIso_inv_ι`, transported through
   `diskBoundaryHomeomorph` and its coordinate linear isometry (which
   commutes with negation), and the reduced/pole-pair comparison. Prove that the disk/cube quotient, smash and right-suspension
   maps send their coordinate-order relative reference classes to this
   generator with coefficient +1; a homeomorphism alone does not establish
   the generator comparison. Define the right-suspension reference by the
   ordered cube shuffle, with the last interval oriented by [1]−[0]; this
   uses Stage 2.5's early native shuffles, not Stage 5's product packaging.
   Compare with native `reducedSingularHomologyTopCatSphereIso` through
   diskBoundaryHomeomorph and its actual recursive choices: prove the
   comparison is a unit ε_n∈ℤˣ, expressed through those choices, rather
   than asserting a fixed numerical sign for `Classical.arbitrary` poles.
   Retain the normalized reference independently of that generator. Own the
   native sphere unit and its comparison with the early disk coefficient:
   in dimension n+1 the disk coefficient is ε_n for n≥1 and −ε_0 for n=0.
   The latter minus sign follows from the native reduced pair boundary; ε_0=1
   exactly when its transported native `Classical.arbitrary` zero-sphere pole
   is p. Stage 2.5 owns the disk coefficient itself; this item derives its
   relation to the sphere normalization. The radial
   D^(n+1)-boundary→Sⁿ comparison has coefficient +1 for n≥1; for n=0
   the oriented interval boundary [p]−[−p] is minus the chosen reduced
   generator. HomotopySpheres §3A/§3B and RiemannianGeometry R3 consume these
   homeomorphisms and the explicit generator comparisons, without constructing
   a second sphere-suspension identification.
5. Prove that relative CW inclusions are closed cofibrations with the homotopy extension
   property.  Construct mapping cylinders, cellular approximation, and skeletal induction.
   Prove that a cofibration which is a homotopy equivalence is a strong deformation retract.
   Own `relativeCylinderCW`: for a relative CW pair (X,B), construct native
   `RelCWComplex` on X×I relative to (X×{0,1})∪(B×I), with original cell
   coordinates first and interval coordinate last. Prove the product weak
   topology using compactness and local compactness of I; endpoint maps are
   the actual inclusions. Stages 8.9–8.10 consume this cylinder construction.
   Own `cwProductKelley`: for arbitrary Hausdorff CW X and Y construct
   the product-cell native CW structure on k(X×Y), with factor coordinates
   in that order, product characteristic maps, subcomplexes and cellular
   map naturality. Own `cwSubcomplexNeighborhoods`: for subcomplexes A,B
   choose compatible open radial neighborhoods U,V with deformation
   retractions of U,V,U∩V,U∪V onto A,B,A∩B,A∪B respectively, using
   the same cellwise parameters. Prove the weak-topology continuity, the
   exact intersection/union identities and relative/subcomplex naturality.
   DGFloer 1.2 uses these neighborhoods for Serre preimage excision.
   Prove its weak topology is the compactly generated
   product topology (Hatcher Appendix A.6), and its comparison with the
   ordinary product when either factor is locally compact. Consume the
   single k coreflection/CW compact-generation API of HomotopySpheres §3A.1.
   Construct the cellular approximation of the actual diagonal X→k(X×X)
   and its homotopy, using this product structure. DGFloer 1.2 consumes that
   diagonal in the multiplicative Serre construction; G2.1 retains ownership
   of the distinct simplicial-realization product comparison.
   Own `ordinaryPairQuotientComparison` and `ordinaryPairQuotientCohomologyComparison`:
   for closed CW/cofibration-NDR pairs (X,B), the actual collapse map induces
   H_n(X,B;M)≃H̃_n(X/B;M) and H^n(X,B;M)≃H̃^n(X/B;M), for every n≥0,
   for constant modules over any coefficient ring; extend homology to the
   abelian-category coefficient generality and exactness assumptions of Stage 2. For local
   coefficients require a specified system on the quotient and its pullback
   identification on X; do not assert descent of an arbitrary system on X.
   Use item 4’s pointed pushout carrier X←B→*; for B empty it is X
   with an added basepoint. Construct the natural
   comparison with the mapping-cone homotopy cofiber, with the cone coordinate
   last and B at cone parameter 1. Own `ordinaryPairMappingConeHomologyExactSequenceComparison` and
   `ordinaryPairMappingConeCohomologyExactSequenceComparison`, the commuting diagrams for singular chains and raw relative cochains, retaining the actual
   quotient/inclusion maps and the extend-then-d boundary convention. These
   comparisons use Stages 2–3 and native cochain algebra, independently of
   Stage 6's product packaging and Stage 8's suspension construction. Item 8.11
   owns their cup/suspension compatibility and the explicit cone sign formulas.
6. Construct real projective n-space using native `Projectivization ℝ (Fin (n+1) → ℝ)`.
   Own #44117's generic quotient topology on native `Projectivization 𝕜 V`
   for division-ring modules V with a topology on V, induced by nonzero vectors modulo
   scalar multiplication, with its continuity and quotient-map APIs above. ComplexKahlerGeometry K7 consumes that topology. Build the real
   finite projective-coordinate atlas (ratios by a nonzero coordinate) and
   boundaryless C^∞ Mathlib manifold structure; prove its
   homeomorphism and smooth local comparison with the antipodal sphere quotient.
   Construct its finite CW structure, with one cell in each dimension 0,…,n,
   and show the cellular differential is ±2 in positive even degree and 0 in
   odd degree; the sign records the chosen characteristic maps and cell generators. The chart and CW
   constructions use only Stages 2–4 and native manifold calculus, independently
   of Stage 6. For RP² construct the rank-one integral sign system from the
   antipodal double cover and compute its monodromy −1 around the generating
   loop by lifting that loop to a path from x to −x. Separately prove the
   linear-algebra orientation calculation on S²: the outward-first ambient
   bases `(x,v₁,v₂)` and `(−x,−v₁,−v₂)` in ℝ³ have determinants of opposite
   signs. This compares orientations at different points; a tangent-plane
   −identity in one fixed basis does not. Stage 6.3 consumes this determinant
   calculation to identify the sign system with the homological orientation
   system. This supplies
   RiemannianGeometry R4.7's single real projective carrier; its quotient
   metric remains owned there. For RP² calculate the sign-system cellular differential:
   d₂=0 and d₁=±2, while for constant integral coefficients d₂=±2 and d₁=0.
   Construct the sign system directly from the quotient's local lifts and
   their transition signs, without using Stage 5's general covering theory. Calculate a two-cell
   complex whose attaching map has degree `m`; its cellular differential must
   be multiplication by `m`.

7. Own `simplicialRealizationCW` for every native simplicial set K: on
   `SSet.toTop.obj K`, construct one cell per `K.nonDegenerate n`, with the
   realized simplex as characteristic map. Own an orientation-preserving
   homeomorphism `standardCellBallToOrderedSimplex n` from the native
   sup-norm cell ball to Δ^n, carrying Stage 2.5's ball class to the relative
   ordered identity-simplex class with coefficient +1. Fix the map radially:
   send 0 to the centroid c=(1/(n+1),…,1/(n+1)); for nonzero z in the
   sup-norm unit ball set w=(-Σz_j,z_0,…,z_(n−1)), r=‖z‖∞ and
   m=max_i(−w_i)>0, and use weights c_i+r w_i/((n+1)m). This uses the
   ordered tangent basis e_(j+1)−e_0 and positive radial scaling. In degree
   zero use the unique point map. Prove it is a homeomorphism of pairs and
   fixes the stated positive homology class. The characteristic
   map is realized σ composed with this fixed homeomorphism; compare it
   with 8.2's +1 cube-to-simplex map. Prove Hausdorffness, closure
   finiteness and the weak topology. Realized simplicial maps are cellular
   and sub-simplicial inclusions identify actual CW subcomplexes. Bar,
   Dold–Kan and singular realizations consume this one construction. Prove
   the general paracompactness of Hausdorff CW complexes used by bundle suppliers.
   Own the cell-neighborhood local contraction API for arbitrary Hausdorff
   CW complexes: for x∈U open construct a smaller open V containing x
   and a homotopy V×I→U from inclusion to the constant x, compatible with
   the cell weak topology. CC C1.2 consumes this for its locally acyclic
   singular-cochain sheaf resolution; it does not presume a good cover.

Hatcher, Sections 0.4 and 2.2, supplies CW pairs, cellular approximation, and cellular homology.
Whitehead, *Elements of Homotopy Theory*, Chapters II--IV, supplies cofibrations, mapping
cylinders, and skeletal induction.  The categorical implementation follows Mathlib's actual
skeleta and their colimit maps rather than a parallel cell-filtration record.

## Stage 5: bundles, covers, products, and finite-cover descent

This stage consumes Stages 2--4, with one exception: the product maps of item 1 (the
Alexander--Whitney and Eilenberg--Zilber maps, the shuffle map, and the chain homotopies between
them) consume only Stage 2 and can proceed alongside Stages 3 and 4.  The Kunneth spectral
sequence and theorems of item 1, and items 2--7, consume all of Stages 2--4.

1. Consume native Alexander--Whitney, shuffle and Eilenberg--Zilber chain-homotopy
   equivalences for singular chains. Extend their natural/local-coefficient and relative APIs.  Over every commutative
   ring `R`, construct the first-quadrant Kunneth spectral sequence
   `E^2_(p,q) = directSum_(i+j=q) Tor^R_p(H_i(X;R),H_j(Y;R))` converging naturally to
   `H_(p+q)(X times Y;R)`.  Prove convergence from the bounded-below, degreewise-free singular
   chain complexes.  For a field `k`, prove that the cross product gives
   `directSum_(i+j=n) H_i(X;k) tensor H_j(Y;k) ~= H_n(X times Y;k)`.  For a PID, and more
   generally a hereditary commutative coefficient ring, prove the natural short exact sequence
   from that tensor sum to product homology and then to
   `directSum_(i+j=n-1) Tor^R_1(H_i(X;R),H_j(Y;R))`; prove that it splits, and record that no
   splitting is natural.  State and prove the general-ring collapse corollaries under explicit
   flatness or projectivity hypotheses.
2. Derive the Wang long exact sequence for a mapping torus from a mapping-cone model.  Identify
   its endomorphism as `id - f_*`, and prove naturality under commuting squares of monodromies.
3. For a finite covering with connected base and constant fibre cardinality `d`, construct transfer
   on chains by summing lifts and prove `p_* transfer = d * id`.  For a regular cover with finite
   deck group `G`, also prove `transfer p_* = sum_(g in G) g_*` and identify the quotient chain
   complex `C_*(E;R)_G` naturally with `C_*(B;R)`.  Construct the Cartan--Leray spectral sequence
   `E^2_(p,q) = H_p(G;H_q(E;R))` converging to `H_(p+q)(B;R)`.  Only when `|G|` is invertible in
   `R`, or under a separately stated exactness hypothesis, derive the coinvariant isomorphism and
   the transfer identification with invariants.  For a nonregular finite cover, encode the sheets
   by the permutation local system and prove transfer and composition through that system.  For a
   disconnected base, state every formula componentwise using the locally constant fibre
   cardinality instead of a single global degree.
4. Calculate homology of finite products of circles as exterior powers, naturally under integer
   matrices acting on the first homology.  This is a theorem about the product and Kunneth maps,
   not a separately declared answer for a torus.
5. Consume DGFloer Layer 1 item 2's Serre-fibration carrier, pullbacks,
   maps of fibrations and native locally trivial `FiberBundle` bridge without
   a paracompactness hypothesis. Consume its `arbitraryCWSerreSpectralSequence` and
   `arbitraryBaseSerreSpectralSequence`, with actual skeletal filtration,
   monodromy local system `H_q(F;R)`, `E²_(p,q)=H_p(B;H_q(F;R))`,
   strong convergence and abutment filtration. Consume its named
   cohomological counterparts and multiplicative/local-pairing APIs for the
   corresponding applications. The homological constructions use only
   Stages 1–4 and DGFloer Layer 1 item 3's filtered-complex API; they do not
   consume this item. Their cohomological counterparts additionally use
   Stage 6.0–6.2's independent foundational tower/cochain/cup portion. Apply their
   naturality and componentwise versions.
   Under trivial monodromy, identify the `E²` page with
   `H_p(B;R) tensor_R H_q(F;R)` under the stated Kunneth hypotheses, but
   do not infer collapse or product homology. Recover the product calculation
   for an actual product fibration; more generally, obtain it from a
   Leray–Hirsch hypothesis or separately proved vanishing of differentials
   and resolution of extensions. Derive Euler-characteristic multiplicativity
   when base and fibre have finite CW type.
6. For an ordered finite open cover, construct the double complex
   `directSum_(i_0<...<i_p) C_q(U_(i_0...i_p);R)`.  Define the alternating Cech differential by
   dropping one index and the vertical singular differential with the total-complex sign.
7. Use Stage 3's small-chain theorem to prove that the augmented total complex is naturally
   quasi-isomorphic to singular chains.  Construct its first-quadrant spectral sequence,
   bounded by the cover cardinality, with
   `E^1_(p,q) = directSum H_q(U_(i_0...i_p);R)` and prove natural convergence.

Eilenberg--Zilber and Eilenberg--Mac Lane's acyclic-model proof, Hatcher Sections 3.B and 4.G,
and McCleary, *A User's Guide to Spectral Sequences*, Chapters 1--2, form the source spine.  The
mapping-torus calculation follows the mapping-cone derivation of the Wang sequence; transfer
follows Hatcher Section 3.G, and the bundle filtration follows Serre's skeletal construction.

## Stage 6: cohomology, products, and manifold duality

The tower, raw cochain, coefficient and cup constructions in 6.0–6.2 are foundational:
construct them from Stages 2–4 and the independent product maps in 5.1 before
using any Serre sequence, manifold duality or EM representability. DGFloer 1.2's
multiplicative cohomological Serre sequence consumes only that portion,
including 6.0's Milnor/lim¹ comparison for complete inverse cochain filtrations.

0. **Countable inverse-system algebra.** Use functors `ℕᵒᵖ ⥤ ModuleCat R`,
   including abelian groups through their canonical ℤ-module structure. Consume
   Mathlib's `Functor.IsMittagLeffler` on the underlying type functor and its
   [eventual-range/surjectivity API](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/CofilteredSystem.lean),
   following the [inverse-system design discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Properties%20on%20%60fintype_inverse_systems%60).
   Define δ on the product by
   `δ(x)_n=x_n−f_n(x_(n+1))`; identify ker δ with the categorical inverse
   limit and define lim¹ as coker δ. Own functoriality under tower maps,
   shift/cofinal-subsequence comparison, product compatibility, the six-term
   inverse-limit/lim¹ sequence and vanishing for surjective or Mittag–Leffler
   countable towers. State the complex-level theory and its naturality for
   towers in `CochainComplex (ModuleCat R) ℤ`. For degreewise surjective
   countable towers prove the product-complex short exact sequence and Milnor
   cochain sequence `0→lim¹ H^(k−1)(C_n)→H^k(lim C_n)→lim H^k(C_n)→0`
   in every integer degree k. Extend ℕ-indexed chains/cochains by zero using
   `HomologicalComplex.extend` with `ComplexShape.embeddingDownNat` or
   `embeddingUpIntGE 0`, and prove their nonnegative homology/cohomology
   comparison. Reindex homological degree j as cohomological degree−j to derive
   the chain sequence
   `0→lim¹ H_(j+1)(C_n)→H_j(lim C_n)→lim H_j(C_n)→0`.
   Prove naturality in integer-graded chain maps and compatibility with
   reindexing, chain isomorphisms and cofinal shifts/zigzags. Construct the derived inverse limit as the
   shifted mapping cone of δ on the product complex, using native ℤ-indexed
   `CochainComplex.mappingCone`. The derived inverse
   limit's possible cohomological degree-1 group lim¹H₀ (homological degree−1)
   is retained in this integer-graded carrier.
   Homotopy-commuting product squares induce actual cone maps, retaining the
   specified square homotopies in their composition laws. Compatible second
   homotopies of the square data induce homotopies of cone maps; no independence
   from arbitrary choices of square homotopy is asserted. For degreewise surjective towers compare this
   cone with ker δ, hence with the ordinary limit complex. Prove levelwise
   quasi-isomorphisms between these surjective towers induce
   isomorphisms on the homology-group inverse limits and lim¹ terms and hence
   on limit-complex homology. This is the shared generic tower API.
   CharacteristicClasses C3 consumes the cochain Milnor sequence and
   Mittag–Leffler vanishing; AffineMorseLefschetz A4 consumes the integer-graded
   Milnor sequences, strict-map/cofinal-shift naturality and limit-homology
   comparison for levelwise excision quasi-isomorphisms; CStarClassification
   CL8 consumes lim¹ and its functoriality for KK telescopes. The derived-limit
   cone and homotopy-square constructions supply the comparison theory for
   homotopy-compatible towers as part of this stage's own scope.
   Item 0 uses native module/category/complex algebra independently of the
   manifold, product and orientation developments below.

Items 1–4 consume Stages 2–3 and the product maps of Stage 5 item 1; the cellular
comparisons and RP² checks also consume Stage 4; item 1 uses item 0 for its
infinite-dimensional skeletal-limit passage. Item 5 consumes Stage 4 and
items 1–4. Their manifold statements also
consume the orientation-and-degree API owned by differential geometry and the boundary/collar
conventions owned by geometric topology.

Every manifold theorem in this stage uses a finite-dimensional Mathlib manifold carrier with
Hausdorffness, second countability or the resulting paracompactness, and the chosen boundary model
stated explicitly.  A global fundamental class assumes compactness.  A conclusion identifying top
homology with one copy of the coefficient ring also assumes connectedness.

1. Define absolute and relative singular cochains by applying `Hom` to singular chains.  Extend
   the construction to Stage 2's local coefficient systems: a degree-k cochain
   assigns to σ a value in L(σ(e₀)); the zeroth face term is transported back
   along [e₁,e₀] and other terms retain e₀. Relative cochains vanish on A.
   Identify cochains with coefficients in the dual system L* with Hom of
   twisted chains with L into R; recovering L by double dual requires the
   displayed fibrewise reflexivity, for example finite projectivity.
   Construct cellular cochains with local coefficients as the product over
   k-cells of Hom from the integral cell-orientation module to the coefficient
   fibre, and prove the relative cellular-to-singular cohomology comparison,
   naturally in cellular maps and coefficient morphisms. Use the skeletal
   filtration and cellular relative cohomology. For arbitrary CW dimension,
   identify direct singular cochains with the inverse limit of their
   restrictions to finite-dimensional skeleta: compact simplex images lie
   in finite subcomplexes, and degreewise restrictions are surjective by
   extension by zero on the other simplices. Apply item 0's Milnor sequence;
   for each n the tower H^(n−1)(X^k;L) is eventually constant by the cellular
   relative long exact sequence, so lim¹ vanishes and the degree-n comparison
   passes to X. Prove the relative version over subcomplex pairs as well;
 no freeness or reflexivity of
   arbitrary coefficient fibres is assumed. For finite free integral fibres
   prove that the Stage 4 chain-homotopy comparison dualizes, identifying
   L*-cochains with Hom of L-chains; use fibrewise reflexivity only to recover
   L. On RP²'s sign system compute δ⁰=±2 and δ¹=0, so independently of
   duality H⁰(RP²;or)=0, H¹(RP²;or)=ℤ/2 and H²(RP²;or)=ℤ after the
   Stage 6.3 identification of the sign system with or.
   Prove functoriality,
   the long exact sequence, homotopy invariance, additivity, the Mayer--Vietoris sequence of a
   binary open cover (dual to Stage 3's), and constant-system comparison.  For
   integral coefficients, and more generally over a PID or hereditary ring, prove the natural
   short exact sequence
   `0 -> Ext^1_R(H_(n-1)(X;R),M) -> H^n(X;M) -> Hom_R(H_n(X;R),M) -> 0`; prove that it splits and
   that the splitting is not natural.  Over a general commutative ring, construct the spectral
   sequence `E_2^(p,q) = Ext^p_R(H_q(X;R),M)` converging to `H^(p+q)(X;M)`, and derive collapse
   theorems only from displayed projectivity or injectivity hypotheses.
   For every short exact sequence of coefficient modules, use degreewise freeness
   of singular chains to construct the short exact sequence of absolute and
   relative cochain complexes on arbitrary `TopCat`/`TopPair`, and derive the
   coefficient long exact sequence and Bockstein. Prove naturality in spaces,
   pairs and coefficient-sequence maps, and compatibility with pair connecting
   maps, and cup-product Leibniz signs when compatible coefficient pairings
   are given. Include `0 -> Z ->[times 2] Z -> F2 -> 0`
   and `0 -> Z -> R -> R/Z -> 0`, with coefficient maps and connecting
   normalization explicit. SmoothBundlesConnections B6.1 consumes this generic
   construction and proves its good-cover/analytic comparison; it does not
   supply a second singular coefficient theory.
2. Use Alexander--Whitney to define cup products and Eilenberg--Zilber to compare them with cross
   products.  Define cap products, including tensor pairings of local coefficient systems, and
   prove naturality, associativity, the unit law, graded signs, and the boundary formula.
   Construct both same-pair caps
   `H^k(X;L)⊗H_n(X,A;L')→H_(n−k)(X,A;L⊗L')` and
   `H^k(X,A;L)⊗H_n(X,A;L')→H_(n−k)(X;L⊗L')`,
   proving descent to relative chains and compatibility with connecting maps.
   Own local-coefficient cups with every specified R-linear pairing
   L⊗_R L′→L″ for a commutative ring R. Use 6.1's first-vertex cochains:
   for σ and degrees p,q pair the front-face value with the back-face value
   transported from vertex p to vertex0 by the inverse initial path. Prove
   the actual cochain rule d(a∪b)=da∪b+(−1)^p a∪db for degree-p a,
   coefficient/pairing naturality, cup units,
   associativity and graded commutativity under the corresponding pairing
   hypotheses, including relative forms on the excisive couples below.
   Construct the absolute-relative module action and same-pair relative cup
   product for every pair. For products with different relative subsets and
   target their union, require an excisive couple, an NDR triad, or the stated
   open-complement compact-support hypotheses; prove the small-chain/excision
   comparison before using that multiple-relative cup or cross product.
   Include its graded/local-coefficient signs and compatibility with the
   absolute, pair and coefficient connecting maps. Arbitrary closed-subset
   unions do not receive an unqualified singular relative product.
3. On a boundaryless m-manifold U define the integral orientation local
   system by `or_U(x)=H_m(U,U\{x};ℤ)`, with the excision transport below.
   Own the boundaryless interior carrier of each smooth
   manifold with boundary: use Mathlib's `I.interior M` and
   `ModelWithCorners.isOpen_interior`, and construct on its subtype the
   boundaryless atlas with model `𝓘(ℝ, EuclideanSpace ℝ (Fin m))` from interior
   half-space charts, inheriting M's smoothness class. Prove inclusion smooth.
   On a manifold with boundary extend the interior orientation system through
   collar charts; prove independence using the fundamental-groupoid equivalence
   induced by int M→M. Ordinary local top homology at a boundary point is not
   its orientation fibre. Compare this homological system with DG Layer 2's
   tangent orientation via chart local generators and Jacobian signs. In ℝ^m
   pin the standard local generator to the affine simplex with ordered vertices
   `v₀=−∑_i e_i`, `v_i=e_i` for 1≤i≤m, containing 0 in its interior.
   Its ordered edge determinant is positive; use its relative class modulo
   ℝ^m\{0}, including the positive point class for m=0. Transport this
   normalization through charts in every dimension before the boundary comparison.
   Prove naturality of the homological orientation system and its tangent
   comparison under smooth open embeddings and local diffeomorphisms,
   using excision and the derivative orientation map. In particular this
   supplies the pullback comparison along S²→RP². Prove that the canonical
   outward-first sphere and coordinate-ball fundamental classes equal Stage
   2.5's earlier positive local/coordinate-chain reference classes, and compare
   with the native sphere/disk generator while recording its sign. Prove canonical
   identifications `or_U|_V≃or_V` for opens
   V and `or_U|_K≃or_K` for codimension-0 compact submanifolds K with boundary.
   Construct the natural pairing `or_M⊗or_M≃ℤ`, normalized by o⊗o↦1 for
   each local generator o; simultaneous sign changes preserve it. In RP²
   compare the chart-local generators with Stage 4.6's sign system using
   that stage's outward-first S² orientation computation.
   For every boundaryless m-manifold U and R-module system L construct the
   local top-homology functor `T_L:FundamentalGroupoid U→ModuleCat R`, with
   fibre `H_m(U,U\{x};L)` and transport defined by excision on coordinate
   balls. Prove independence of balls, path-homotopy invariance and gluing,
   and construct its natural identification `T_L≃L⊗_ℤ or_U`, using the
   R-action on L. Pin the inverse comparison to the coefficient-extension
   map `ℓ⊗[c]↦[c·ℓ]`: trivialize L on a coordinate ball about x by transport
   from x, multiply an integral relative cycle by ℓ in this trivialization,
   and use excision. Prove independence of the ball and representative,
   compatibility with path transport, bilinearity over ℤ and R-linearity
   in ℓ, and naturality in L. On a coordinate ball under its transport
   trivialization require equality with the coefficient map z↦z·ℓ on chains
   and homology; for constant integral coefficients require `[c·1]=[c]`.
   For each open inclusion B→U prove the excision map carries `[c·ℓ]` on B
   to `[c·ℓ]` on U; this local restriction law pins the construction even for
   globally nontrivial systems. For every ring homomorphism use native exact
   restriction of scalars to compare twisted chains and homology; pin its
   chain map on every simplex/fibre generator to the same simplex and coefficient.
   The integer-to-R restriction comparison gives the same normalization for
   every R. This actual coefficient multiplication fixes the sign of the comparison.
   Define a section on an open V⊆U by pointwise local
   classes s(x), with the following local condition: each x∈V lies in a
   coordinate ball B⊂V and there is a class in `H_m(U,U\B;L)` whose local
   image at every y∈B is s(y). Prove that these sections correspond exactly
   to transport-compatible sections of T_L restricted to V, expressed as
   natural transformations from the constant rank-one R-module functor.
   For L=or_U the canonical section is the preimage of 1 under the composite
   `T_or≃or_U⊗or_U≃ℤ`; it makes no choice of orientation.
   Before duality, prove the local-coefficient compact-support local-homology
   lemma: for boundaryless m-manifold U, compact K⊂U and every module-valued
   local system L, `H_i(U,U\K;L)=0` for i>m, and the degree-m group injects
   into its local images at points of K. Prove existence as well: every
   section satisfying this ball-local condition over a neighborhood of K
   comes from exactly one relative class with those local images at K.
   Derive the twisted compact-boundary fundamental class
   `[M,∂M]∈H_m(M,∂M;or_M)` by applying this to the canonical section on
   the interior with K the complement of an open boundary collar, then using
   the collar comparison. Characterize it uniquely by canonical interior
   local images. With the outward-normal-first boundary identification prove
   `∂_*[M,∂M]=[∂M]` for m>0; the dimension-0 boundary is empty. A chosen
   orientation gives the integral relative class; empty boundary gives the
   absolute class.
   Use trivialization on coordinate
   balls, Stage 3's twisted excision/Mayer--Vietoris and compact finite-cover
   induction, as in Hatcher Lemma 3.27. Deduce `H_i(U;L)=0` for i>m by
   compact support of singular cycles and the pair/triple sequence (the route
   of Proposition 3.29), and prove `H_i(M,∂M;L)=0` for i>m and injectivity
   into interior local images for compact boundary manifolds using collars.
4. Prove both Poincare--Lefschetz isomorphisms by cap with that class for
   every coefficient-module local system L:
   `H^k(M;L)≃H_(m−k)(M,∂M;L⊗or_M)` and
   `H^k(M,∂M;L)≃H_(m−k)(M;L⊗or_M)`. Include naturality for oriented/local-
   system isomorphisms; for an R-module system the twist means `L⊗_ℤ or_M`
   with R acting on L. Include
   excision and restriction comparisons on compact codimension-0 pieces K
   embedded in boundaryless U, where K carries an actual Mathlib manifold-
   with-boundary structure and smooth embedding. Use the pair-map zigzag
   `(K,∂K)→(U,U\int K)←(U,U\K)`, with the two isomorphisms proved by
   excision and a two-sided tube around the boundaryless compact ∂K in U from
   GT Layer 1. Trivialize its normal line by DG5.1's outward-pointing field;
   use half-space charts and compactness of ∂K to shrink the tube to a
   uniform positive radius before proving that its positive/negative sides
   lie outside/inside K. This supplies the exterior collar without
   presupposing a manifold
   structure on U\int K. Prove cap compatibility
   and agreement with `or_U|_K≃or_K`; there is no direct pair map
   `(K,∂K)→(U,U\K)`. Empty boundary gives Poincare duality. Then derive the field-coefficient
   and integral orientable corollaries.  State connectedness in the corollary identifying top
   homology with the coefficient ring.
5. Derive the homological characterization and duality formulas for the shared manifold degree and
   the intersection pairing.  For a closed connected oriented `n`-manifold of finite CW type,
   construct the nonsingular torsion linking pairing
   `Tor H_i(M;Z) times Tor H_(n-i-1)(M;Z) -> AddCircle (1 : ℚ)`.  Prove finiteness of the torsion
   groups, naturality under orientation-preserving diffeomorphisms, and the symmetry law
   `lambda_i(x,y) = (-1)^((i+1)(n-i)) lambda_(n-i-1)(y,x)` with the pinned cap-product sign.
   Derive universal-coefficient consequences through the natural duality maps, and do not define a
   competing degree invariant.

The proof spine is Hatcher Sections 3.1--3.3 for cohomology operations and duality, and Dold,
*Lectures on Algebraic Topology*, Chapters VII--VIII for natural products and local coefficients.
Collars fix the boundary sign; orientation is never reconstructed from a hand-written chart list.

## Stage 7: Euler characteristic and finite decompositions

This stage consumes every one of Stages 2--6.  Stage 1 is not a prerequisite.

1. Consume the native alternating cell count and Euler--Poincare equality
   with alternating homology rank over a field for finite CW complexes.  Transport it to spaces of
   finite CW type and prove independence of the chosen model.
2. Prove homotopy invariance, product multiplicativity, and multiplicativity for fibre bundles
   with finite-CW base and fibre.  The bundle theorem must be derived from Stage 5's chain or
   spectral-sequence machinery.
3. Prove finite-cover multiplicativity from transfer and additivity for finite excisive
   decompositions from Mayer--Vietoris.  Prove cellular-stratification additivity from the
   relative cellular filtration.
4. State cofibration, compactness, and finiteness assumptions explicitly.  Establish the standard
   checks `chi(S^n)=1+(-1)^n`, `chi(T^n)=0` for `n>0`, and
   `chi(CP^n)=n+1`. The complex-projective check consumes
   ComplexKahlerGeometry K7's model and cell construction, which depends only
   on AT Stages 4 and 6; no complex-projective construction is required in Stage 4.

## Stage 8: relative homotopy, Hurewicz, Whitehead, and ordinary representability

This stage consumes Stages 2--4, the universal-covers roadmap's induced-map and basepoint API,
and geometric topology's smooth-triangulation result for the manifold corollaries.
Items 8–12 additionally consume Stage 6 cohomology and the item-level suppliers above;
items 1–7 are independent of those later constructions.

1. Define `BasedTopPair` from a `TopPair` and an actual point of its subspace, together with
   basepoint-preserving maps of pairs. Extend cubical `HomotopyGroup` with pointed maps,
   functoriality, basepoint change, relative homotopy groups `pi_n(X,A,a_0)`, and the boundary maps
   and long exact sequence of that based pair. State relative groups for NDR pairs/cofibrations,
   rather than attaching them to arbitrary inclusions without hypotheses. The empty-subspace pair
   admits no such based carrier.
   Keep the low-degree algebra honest: use pointed-set and group carriers in the ranges where
   relative homotopy is not abelian, and expose a `ModuleCat Z` carrier only in degrees at least
   three.  In particular, `pi_2(X,A)` is group-valued in general; its abelianization, not the
   unmodified group, is the module-valued source available without connectivity assumptions.
2. Following #42435, construct homotopy groups of Kan simplicial sets, prove
   `TopCat.toSSet.obj X` is Kan, and compare these groups naturally with cubical homotopy groups.
   Prove compatibility with induced maps, boundary maps, and basepoint change.
   Pin the Kan/cubical comparison `kanCubicalHomotopyComparison` by the
   ordered-simplex orientation: a Kan spherical simplex σ realizes to the
   cubical class whose normalized Hurewicz image is the actual relative
   simplex class σ_*[Δ^n,∂Δ^n] in H_n(X,{x₀}), transported to absolute
   H_n(X) for n≥1 by the pair sequence. An unnormalized even-dimensional
   singular simplex need not itself be an absolute cycle. Construct `coordinateCubeSimplexOrientationComparison`
   between I^n/∂I^n and Δ^n/∂Δ^n, with Δ^n oriented by its ordered vertices;
   it sends the Stage 2.5 coordinate cube class to the relative identity
   simplex class with coefficient +1. Prove its Hurewicz compatibility and
   the corresponding Moore/realization comparison, without an independent sign.
   Own `simplicialGroupKan`: every simplicial group is a native `SSet.KanComplex`.
   Own the natural Moore comparison `simplicialGroupMooreHomotopyIso`:
   for simplicial abelian groups G, π_n(G)≃H_n(NG), including components in
   degree zero. For general simplicial groups set N_n=⋂_(i=1)^n ker d_i
   with differential d₀, matching native `normalizedMooreComplex` in the
   abelian case. Prove π_n(G)≃ker(d₀|N_n)/d₀(N_(n+1)) for n≥1,
   with normality of the boundary subgroup and commutativity of the quotient;
   π₀(G) is the possibly nonabelian group G₀/d₀(N₁). Own
   `kanRealizationUnitHomotopyIso`: Mathlib's actual `sSetTopAdj.unit.app K`
   from a Kan K to `TopCat.toSSet.obj (SSet.toTop.obj K)` induces a bijection
   on components and the normalized based π_n isomorphisms in every positive
   degree. Prove it by compatible finite-simplex restrictions, subdivision,
   Kan filling and relative simplicial approximation (owned here, including subcomplexes
   and homotopies fixed there); fix the sphere orientation
   through Stage 4.4, with item 8.6's cubical representative comparison. DGFloer item 4 consumes these classical results to compute
   π_n|Γ(A[n])|. GeneralizedCohomology G2.1 consumes this unit theorem in
   its Quillen comparison, rather than reconstructing its underlying weak-equivalence proof.
3. Own the general absolute Hurewicz map for every n≥1. A native generalized
   cubical loop g descends through the Stage 4.4 quotient q to a pointed sphere
   map ḡ; define h[g]=ḡ_*[S^n] on the outward-first normalized generator.
   Prove independence of representatives, group law and naturality. In degree
   one it factors through abelianization; DGFloer Layer 1 item 1 owns the
   theorem that this exact map is an isomorphism, through its chain comparison.
   For arbitrary spaces consume DGFloer 1.2's direct Eilenberg-subcomplex
   connected-map comparison; it uses face-compatible compression and prisms,
   not this Hurewicz theorem. Prove the absolute theorem: an `(n-1)`-connected pointed
   space has reduced integral homology zero below `n` and `pi_n(X) ~= H_n(X;Z)` for `n>=2`.
4. Prove relative Hurewicz for a based cofibration/NDR pair.  If `A` and `X` are simply connected
   and `pi_i(X,A)=0` for `i<n`, prove `H_i(X,A;Z)=0` below `n` and that relative Hurewicz is an
   isomorphism in degree `n`.  Derive the exact isomorphism and surjectivity range for
   `H_i(A)->H_i(X)` from the pair sequence.  In degree two, first derive commutativity of
   `pi_2(X,A)` from these connectivity hypotheses, prove that the map to its abelianization is an
   isomorphism, and only then identify it with relative homology.
5. Prove Whitehead's theorem for CW complexes using cellular approximation and skeletal
   induction.  Combine relative Hurewicz with the mapping cylinder to prove homological
   Whitehead for simply connected CW complexes, then extend both results to spaces of CW type.
6. Consume Stage 4.4's single pointed orientation-normalized cube quotient
   homeomorphism and its generator comparison, for n≥1, and prove
   compatibility with cubical representatives. Its quotient q collapses precisely
   ∂I^n to the positive first-coordinate pole and sends Stage 2.5's ordered
   cube class to the normalized sphere class after absolute-to-relative comparison.
   Use Stage 2.5's independently pinned positive-hemisphere-chart sphere
   class and disk normalization, together with Stage 4.4's degree +1 equation
   and its explicit n=0 versus n≥1 radial boundary/native-sphere comparison.
   Stage 6.3 identifies the canonical outward-first fundamental class with
   this earlier reference.
   Pin the sphere basepoint
   to the positive first-coordinate pole and export the boundary-generator comparison.
7. Prove that every finite-dimensional Hausdorff second-countable smooth manifold
   with the Euclidean or half-space model, with or without boundary, has
   countable locally finite CW type by consuming GeometricTopology's
   smoothing-and-triangulation comparison item1 and its realization homeomorphism.
   The compact case has finite CW type; include the boundary-pair forms and
   finitely many prescribed interior marked points outside the relative boundary locus. As a reusable corollary, prove that a simply connected integral homology
   `n`-sphere, `n>=2`, is homotopy equivalent to the standard `S^n`.

8. **Nonabelian classifying spaces (`groupClassifyingSpace`,
   `groupClassifyingSpace_isEMOne`, `mapsToGroupClassifyingSpaceEquiv`).**
   Own the single generic bar/nerve construction for every discrete group π. Use native `CategoryTheory.nerve`, `SingleObj π`,
   and `SSet.toTop`; construct the contractible free π-space Eπ, its covering
   Eπ→Bπ; consume Stage 4.7's single realization CW structure on both. Prove its native
   `TauCeti.IsEilenbergMacLaneSpaceOne π` property and identify its π₁ with π,
   naturally in group homomorphisms. Pin the bar edge labelled g to g under
   Mathlib's `SingleObj` composition and `FundamentalGroup.mul_def` conventions: both
   compose the later traversal on the left. Prove the oriented-edge identification
   is compatible with the native group operation.
   DGFloer Layer 1 item 4 aliases the abelian specialization as K(A,1);
   the generic CW/cover proof is supplied only here. For each connected
   pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)` and that forgetting basepoints
   gives the conjugation-orbit description of `[X,Bπ]`. Treat disconnected X
   componentwise. Use the exact classifying-space and local-coefficient comparison
   to identify `H*(Bπ;A)` with Mathlib's `groupCohomology A n` for every
   `A : Rep ℤ π`, through its native `inhomogeneousCochains` complex. Construct
   the corresponding `LocalCoefficientSystem ℤ Bπ` and chain comparison.
   For Stage 6's first-vertex direct cochains the zeroth face uses inverse
   transport: pin the comparison with native inhomogeneous cochains by
   ψ(g₁,…,g_k)=φ(g₁⁻¹,…,g_k⁻¹). Prove differential, coefficient and
   change-of-group naturality with this formula. Own the all-degree discrete
   homogeneous/inhomogeneous comparison, extending the existing low-degree
   `ContCohomology.GroupCohomologyIso` API. Consume the existing all-degree
   finite-discrete existence comparison
   `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
   from `ContCohomology.DiscreteGroup`; this item adds the actual natural
   cochain comparison for arbitrary discrete groups. Transport native
   `TauCeti.TopPairing.cup` for discrete group/coefficient topologies to
   `groupCohomologyCup`. Prove the standard inhomogeneous formula
   P(ψ(g₁,…,g_p), (g₁⋯g_p)·χ(g_(p+1),…,g_(p+q))) and agreement with
   the Stage 6 singular cup under the displayed label inversion.
9. **Relative obstruction cochains (`relativeObstructionLocalSystem`,
    `relativeObstructionCochain`, `relativeObstructionCochain_isCocycle`,
    `relativeDifferenceCochain`, `relativeDifferenceCochain_realize`,
    `relativeObstructionClass_zero_iff_adjusted_extension`).**
    For each relative CW complex (X,B), n≥1 and path-connected target Y with
    π₁Y acting trivially on π_nY (so π₁Y is abelian when n=1), and a map on
    X^n∪B, construct its relative cellular (n+1)-cochain with coefficient π_nY
    by its characteristic-map boundary classes. Use the outward-first
    orientation induced by Stage 2.5's coordinate-oriented ball reference
    class, identified with Stage 6's canonical relative fundamental class,
    transported to the cell by Stage 4.4, and its
    degree +1 boundary-sphere homeomorphism. Choose the positive first-coordinate
    boundary point; transport the based class from f(φ_e(v₀)) to the fixed
    y₀ along a specified path in Y. Prove choice independence using the trivial
    π₁ action on π_n, with the degree-one commutativity hypothesis explicit.
    These oriented, transported boundary classes define c(f)(e); prove the
    cochain is a cocycle. Prove that this fixed
    map on X^n∪B extends to X^(n+1)∪B exactly when the cochain is zero.
    For maps agreeing on X^(n−1)∪B construct the difference n-cochain by
    gluing their cell disks along their common boundary. Pin its orientation
    so `δd(f₀,f₁)=c(f₁)−c(f₀)`; prove addition, symmetry and naturality.
    Realize every prescribed relative difference cochain by changing the map
    on n-cells while fixing X^(n−1)∪B. Consequently `[c(f)]=0` exactly when
    a map agreeing with f on X^(n−1)∪B extends over X^(n+1)∪B; choose the
    negative of a coboundary preimage to cancel c under the pinned difference
    convention. A zero class does not assert extension of the fixed n-skeleton.
    Prove the full local-coefficient lifting/section version for Stage 5's
    Serre fibrations with path-connected n-simple fibres: use fibre π_n and
    its transport along base paths as a module-valued functor on the fundamental
    groupoid, concretely `LocalCoefficientSystem ℤ X`. For a lifting problem
    along a given map b:X→Z, place the cell coefficient at b(φ_e(0)); transport
    the boundary-point class along b∘φ_e on the reversed radial segment from
    v₀ to 0. The base map is defined on the whole cell, even when its section
    is defined only on the boundary. Allow arbitrary base monodromy, and prove
    the same cocycle,
    difference, realization and two distinct extension criteria. In n=1 require
    abelian fibre π₁; in degree zero use component-set extension data, without
    an abelian obstruction class. Include pullback, relative subcomplex and
    homotopy naturality. When the fibre is (n−1)-connected, prove the resulting
    first obstruction class is independent of the chosen n-skeleton extension;
    no such independence is asserted without those connectivity hypotheses.
10. **Ordinary cohomology representability (`ordinaryEMUniversalClass`,
    `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability`).**
    Consume DGFloer's single functorial abelian CW/bar/Dold–Kan K(A,n) constructors
    for every abelian A and n≥1; this item consumes the constructor and its homotopy
    groups, rather than rebuilding its models. Export
    `ordinaryEilenbergMacLaneFamily` / `ordinaryEMModelFromFamily` with its normalized identification and the
    natural maps induced by homomorphisms A→A′. Own the universal class
    `ι_(A,n)∈H^n(K(A,n);A)`: under Hurewicz, degree-one abelianization and universal
    coefficients its evaluation is the identity A→A. Fix degree-one identification
    by the bar's oriented one-simplex labelled a. Construct the pullback map
    `[f]↦f*ι_(A,n)` and prove it is a bijection, for every CW complex X of arbitrary
    dimension and any number of components, with `H^n(X;A)`. Prove surjectivity
    by realizing cellular cocycles on n-cells and extending over all higher cells;
    prove injectivity by realizing cellular coboundaries as homotopies, using the
    Stage 4.5 relative cylinder CW structure and weak topology. There is no finite-CW
    hypothesis, and no passage from finite subcomplex bijections that suppresses
    phantom-map issues. Prove naturality in X and A, compatibility with normalized
    homotopy-group identifications, zero, addition and inverses. Obtain addition
    from the simplicial abelian models. Consume GeneralizedCohomology G2.1's
    foundational `realizationProductKelleyComparison`, identifying |A•×A•|
    with k(|A•|×|A•|); that portion consumes only AT4/8.2 and the convenient
    category, preceding HA and ordinary representability. Consume
    HomotopySpheres §3A.1's right adjoint k in i⊣k, counit and CW compact-
    generation comparison, on native `CompactlyGenerated`,
    `UCompactlyGeneratedSpace` and `TopologicalSpace.compactlyGenerated`.
    Consume those named suppliers in their stipulated shapes. Route paired maps
    from compactly generated X through this product comparison before applying
    realized addition, and compare back to ordinary TopCat homotopy classes on
    CW sources. Prove the pullback map is an additive equivalence.
    For n≥2 the distinguished class on |Γ(A[n])| is represented by the
    normalized cellular cocycle e_a↦a on the actual counit-labelled n-cells.
    For n=0 use discrete A; its universal H⁰ class is the identity function on A,
    not an identification H₀(A)≃A. Identify `[X,A_discrete]` with functions from
    `ZerothHomotopy X` to A and with H⁰(X;A). For every CW pair (X,B), prove
    relative representability by maps sending B to 0 and homotopies fixed on B,
    including the quotient `(X/B,*)`; for B empty use X with an added basepoint.
    Export the pointed/reduced version and the comparison with unreduced groups.
11. **Ordinary EM loop comparison (`ordinaryEMLoopComparison`,
    `ordinaryEMLoopComparison_pi`).** Construct coefficient-natural pointed
    maps K(A,n)→ΩK(A,n+1) for every n≥0 inducing the identity on A. Use the
    native fixed-interval loop carrier and `HomotopyGroup.pathLoopSpaceMulEquiv`
    in positive degrees, with the loop coordinate last. In degree zero use
    `HomotopyGroup.zerothHomotopyLoopSpaceEquivFundamentalGroup` and the pinned
    bar-edge identification. Compare with DGFloer's standing Moore conventions
    and Layer 2 item 3, preserving constant loops and addition.
    Define `ordinaryCohomologySuspension` here, including its unreduced
    cone adapter. For any CW space B form the actual unreduced cone CB by
    adjoining an apex to B×I and collapsing B×{0} to it. Define Σ_uB=CB/B
    by Stage 4.5's pointed collapse of B×{1}; when B is empty its two apices
    remain distinct. Let σ_right:H^n(B;M)→H̃^(n+1)(Σ_uB;M) be (−1)^n
    times the cone-pair connecting map, transported by that quotient comparison.
    For a pointed CW complex with 0-cell basepoint, collapse its basepoint
    meridian and pass to reduced cohomology. Own the actual
    `reducedSuspensionTwoStepHomeomorph` to Stage 4.4's interval-last raw
    quotient, sending every representative (b,t) to that same (b,t) class,
    with the collapsed meridian at the same basepoint. Prove naturality and
    transport the suspension/connecting maps through this homeomorphism
    using Stage4.4's `cwReducedSuspensionKelleyComparison`, then §3A.2's
    `cwConvenientSuspensionComparison`. This gives the reduced suspension
    ΣB=B∧S¹ with S¹ last; σ_right is the positive cross product with the
    interval generator u with ⟨u,[I,∂I]⟩=+1; the chain boundary is [1]−[0]. In degree zero the unreduced construction
    kills constant functions and factors through H⁰(B)/im H⁰(CB); do not
    identify the suspension of a constant ordinary H⁰ class with a circle class.
    Define the reflected cone with B at 0/apex 1 and interval first, its
    suspension Σ_u,left B, and σ_left as minus its cone-pair connecting map.
    On pointed reduced classes it is the positive product u×a.
    Distinguish these from the full ordinary suspension for B₊=B⊔{*}:
    `ordinaryCohomologySuspension` on the pointed B₊ gives isomorphisms
    H^n(B;M)→H̃^(n+1)(Σ(B₊);M), including the degree-zero constant classes.
    The actual quotient q_+:Σ_uB→Σ(B₊) identifies the two apices; prove
    q_+^*σ_plus=σ_u for both coordinate orders. When B is empty this is
    the collapse of the two-apex space to a point. The pointed mapping-cone
    collapse used in spectral cofibers has target Σ(B₊), and its pullback
    kills constant degree-zero classes as the ordinary pair boundary does.
    For the mapping cone M_AT(i)=X∪_(B×{1})CB of B→X, let
    c_AT:M_AT(i)→Σ_uB be the actual collapse of X. Define M_G(i) and c_G
    using the reflected interval-first cone. Under Stage 4.5's actual pair-to-
    mapping-cone comparison prove δ_(X,B)=(−1)^(n+1)c_AT^*σ_right
    and δ_(X,B)=c_G^*σ_left. After composing each collapse with q_+,
    prove the same formulas using σ_plus with target Σ(B₊); this is the
    adapter for based mapping cones C(B₊→X₊). Reflection t↦1−t has degree−1 and moving
    the interval first contributes (−1)^n, so their composite on ΣS^n
    has degree (−1)^(n+1). Prove both the cone-pair and ordinary-pair formulas
    by actual chain comparisons and the interval/endpoints test at n=0 with
    the class 1 at endpoint 1. Prove coefficient, pair-map, relative-cup and
    suspension compatibility under Stage 6's excisive-triad hypotheses;
    cup products require the stated commutative-ring hypotheses.
    Pin δ(i^*a∪b)=(−1)^p a∪δb and δ(b∪i^*a)=δb∪a for
    degree-p a, using actual pair module maps and the local-system pairing.
    Under the pointed-smash reassociation with coordinates (X,Y,I), prove
    σ_right(a×b)=a×σ_right(b); moving I past degree-q b gives
    σ_right(a)×b=(−1)^qσ_right(a×b). State the actual smash/interchange
    comparison maps; this is cross-product compatibility, not a claim that
    suspension preserves the ordinary cup ring.
    Prove σ sends the distinguished universal class to the class whose adjoint
    induces identity under the native last-coordinate shift. Consume
    HomotopySpheres §3A's pointed compactly generated suspension–loop adjunction
    and G2.1's foundation-only realization-product comparison for addition.
    Own `finiteSourceMappingCWType`, the finite-CW-source pair specialization
    of Milnor 1959 Theorems 3–4 for n-ads: mapping spaces from a finite CW pair
    into a Hausdorff CW pair, with prescribed relative/basepoint values,
    have based CW type in the compact-open/Kelley topology. Own the full inputs
    in their relative n-ad forms. Replace any CW n-ad by the weak realization
    K_w of a native abstract simplicial n-ad, with actual homotopy equivalences,
    using skeletal simplicial approximation and mapping cylinders. Construct
    the metric realization K_m on the same finite-support barycentric points
    (the bounded ℓ¹ metric topology), and prove Dowker's K_w≃K_m comparison,
    relative to the subcomplexes. Develop the metric ANR/ANE neighborhood-
    retraction/extension API using actual closed embeddings and open
    neighborhoods in arbitrary metric ambient spaces, without a separability
    assumption. Own the Arens–Eells/Wojdysławski closed embedding of every
    metric space into a convex subset of a normed real vector space; keep the
    convex-hull carrier rather than imposing completeness or separability.
    Own Dugundji's extension theorem for continuous maps from closed subsets
    of metric spaces into convex subsets of normed spaces, using native
    `PartitionOfUnity` and locally finite barycentric combinations. Use these
    inputs to prove ANR⇔ANE. Construct an open neighborhood of the diagonal
    of an ANR with a continuous homotopy joining each pair of its points,
    constant on the diagonal; deduce that maps close in this neighborhood
    are homotopic, with the relative version, rather than assuming a uniform
    global distance bound. Prove homeomorphism invariance, open-
    neighborhood and finite-product properties, and relative finite n-ad forms.
    Prove K_m is a metric ANR by its star/nerve extension construction. Prove
    maps from a compact metric source into a metric ANR have metric ANR type
    using the compact-open/uniform metric and the tube lemma to curry
    neighborhood extensions; include finite-CW subcomplex constraints,
    prescribed values and the constant map. Construct domination of metric
    ANRs by native simplicial complexes using numerable open covers and nerves.
    Finally prove the CW-domination criterion by an explicit homotopy-idempotent
    mapping telescope, with dominating maps and homotopies fixed on the
    relative n-ad. These inputs establish the function-space CW-type theorem
    independently of any weak-equivalence upgrade.
    Apply it to (I,{0,1})→(X,{x₀}) with x₀ a 0-cell to obtain
    `basedLoopCWType`; compare native fixed-interval loops with the Kelley
    mapping carrier. Own the interval-product comparison
    k(Y×I)≅k(Y)×I from HomotopySpheres §3A.1's compact-test/product API,
    and prove k preserves homotopy equivalences, including
    their relative forms; transport the CW-type witnesses through it. Only after that independent CW-type proof, consume
    DGFloer 1.2's CW approximation and 8.5 to upgrade the EM loop weak
    equivalences to pointed homotopy equivalences. Own the bijection induced
    by these weak equivalences on maps from arbitrary CW sources via cellular
    lifting, independently of that upgrade. Prove coefficient/addition/adjunction
    naturality and the relative/basepoint versions.
    Generalized cohomology and spectra consume these ordinary interfaces.
12. **Classical EM comparisons (`projectiveEMComparisons`).** Consume T1.6's
    rank-one RP∞ and CP∞ carriers with their final/weak CW topology, and
    CharacteristicClasses C1.5's finite-stage and cellular/cup comparisons with
    AT4.6's RPⁿ and CKG K7's CPⁿ. Own their identification as K(ℤ/2,1)
    and K(ℤ,2), respectively, and the coefficient-natural EM comparison maps.
    Pin the complex degree-two universal generator h by ⟨h,[CP¹]⟩=+1 for
    CKG K7's complex orientation. The real degree-one class is the unique
    nonzero class for the double-cover generator. Compare with native
    `AddCircle.isEilenbergMacLaneSpaceOne` at period 1 and basepoint 0, with
    t↦t mod ℤ, 0≤t≤1, corresponding to +1. Prove finite-stage restriction
    compatibility and coefficient change along every additive homomorphism
    ℤ→A, including reduction ℤ→ℤ/m for each m≥1. No new infinite-projective
    carrier, characteristic-class definition or finite-projective comparison
    is constructed here.

Hatcher Section 4.1 gives the absolute Hurewicz and Whitehead arguments; Whitehead, Chapters
IV--VII, gives the relative and cellular forms.  May, *Simplicial Objects in Algebraic Topology*,
Chapters 3 and 12, supplies the Kan-group construction and comparison route.
Hatcher Section 4.3 supplies ordinary representability and obstruction theory;
[*Vector Bundles and K-Theory*, Section 3.3](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)
supplies the relative section obstruction and difference-cochain construction. The
local-coefficient extension retains the stated fibre transport rather than assuming
trivial monodromy.

## Dependency order

| Stage | Depends on | Can proceed alongside |
| --- | --- | --- |
| 1 van Kampen | current Mathlib and #41603's shape | 2--8 |
| 2 relative homology | current Mathlib and #41285/#38369's shapes | 1 |
| 3 subdivision/excision | 2 | 1 and 6.0 tower algebra |
| 4 CW/cellular and raw quotient comparisons | 2--3, native cochain algebra, HomotopySpheres §3A.1 for kified CW products and raw quotient/k-counit comparisons; 2.5 supplies sphere reference shuffles; general cohomological product/suspension compatibility belongs to 8.11 | 1 |
| 5 product maps (item 1) | 2 | 1, 3, 4 |
| 5 bundles/covers/finite covers | 2--4; DGFloer 1.2 Serre carrier/homology SS from 1–4 and DG1.3, cohomology SS additionally from independent 6.0–6.2 | 1 |
| 6.0 tower algebra | native module/category/complex algebra | 1--8 |
| 6.1--6.4 cohomology/duality | 6.0 for 6.1 skeletal limits; 2--3, Stage 5 item 1 product maps, external orientation/collars; Stage 4 for cellular comparisons/RP² | 1 |
| 6.5 linking/degree consequences | 2--4 and 6.1--6.4 | 1 |
| 7 Euler characteristic | 2--6 and ComplexKahlerGeometry K7 for CPⁿ | 1 |
| 8.1–8.7 Hurewicz/Whitehead | 2--4 and the cited external roadmaps | 1, 5--7 |
| 8.8 generic classifying spaces | 4, 6, native nerve/realization and universal-cover APIs; no DGFloer EM input | 8.9 |
| 8.9 primary relative obstructions | 4, DGFloer 1.2 fibre transport, 6 cellular cochains, 8.1–8.7 | 8.8 |
| 8.10 ordinary representability | 4, 6, 8.3/8.6, 8.9, DGFloer Layer 1 items 1 and 4, GeneralizedCohomology G2.1 foundational product comparison and HomotopySpheres §3A.1 kification | 7 |
| 8.11 ordinary EM loops | 8.5, 8.10, DGFloer Layer 1 item 2 and standing/Layer 2 item 3 loop comparison, HomotopySpheres §3A.1 compact-generation/product API and §3A.2 adjunction, G2.1 foundation-only realization-product comparison | 7 |
| 8.12 classical EM comparisons | 8.8, 8.10, TopologicalKTheory T1.6 carrier construction and DGFloer 1.2 Serre LES via CharacteristicClasses C1.1 bundle adapter/C1.5 finite comparisons and universal sphere-bundle portion | 7 |

In particular, Stage 1 is independent; the chain `2 -> 3 -> 4` is strict; Stages 2--4 all feed
Stage 5, except that Stage 2 alone feeds the product maps of Stage 5 item 1; and every stage from
2 through 6 feeds Stage 7.  No implementation may reverse one of these arrows by assuming a
downstream comparison theorem as input.

## Acceptance checks

- A two-open-set cover with disconnected intersection is handled by the groupoid colimit and
  yields the correct based theorem only after explicit basepoints are chosen.
- Relative homology of `(D^n,S^(n-1))` and the connecting morphism to the sphere generator have
  the pinned sign.
- Mayer--Vietoris is derived from excision and agrees with the map induced by inclusions; it is
  not supplied as an unrelated exact sequence.
- The cellular differential of a two-cell attachment of degree `m` is multiplication by `m`,
  and cellular homology compares naturally with singular homology.  At chain level the comparison
  is a filtered/derived equivalence or is natural up to displayed chain homotopy, not a strictly
  natural choice of singular representatives.
- The field, PID or hereditary-ring, and general-ring Kunneth and universal-coefficient theorems
  have distinct statements; neither short exact sequence is advertised over an arbitrary ring.
- Transfer for a constant-degree-`d` finite cover satisfies `p_* transfer = d * id` on chains and
  on homology, including the induced map on `H_0`.  A regular cover also satisfies the deck-sum
  formula and has the stated Cartan--Leray spectral sequence; the torus calculation is natural
  under integer matrices.
- The Serre spectral sequence starts from an explicit Serre fibration, exposes the monodromy local
  system, is natural under maps of fibrations, and proves finite-CW bundle Euler multiplicativity.
  Trivial monodromy makes the `E^2` coefficients constant but does not imply collapse: the Hopf
  fibration and the product `S^1 times S^2 -> S^2` are a required comparison, with identical
  constant-coefficient `E^2` pages and different abutments.
- Natural-number-indexed cap product and Poincare duality carry the complementary-degree
  hypothesis `p <= n`.  In particular no above-dimension cohomology group of a connected closed
  manifold is identified with `H_0` by truncated subtraction.
- Poincare--Lefschetz duality uses the boundary orientation from the shared manifold API and
  produces the correct sign in the cap-product boundary formula.
- Nonorientable checks use RP²'s orientation system: `H^0(RP²;or)=0`
  corresponds to `H_2(RP²;ℤ)=0`, and `H^2(RP²;or)≃ℤ` to `H_0(RP²;ℤ)`.
  Both sides are computed independently by Stage 4.6 and Stage 6.1
  cellular calculations on the single Stage 4.6 carrier, with the coefficient
  identification proved in Stage 6.3. The twisted relative fundamental class has canonical local images and
  boundary equal to the outward-first class of the boundary.
- The tower difference map, six-term sequence, Mittag--Leffler vanishing,
  integer-graded Milnor sequences and cofinal shifts satisfy their naturality
  diagrams. The derived-limit cone compares with ordinary limits of degreewise
  surjective towers; homotopy-square cone maps retain their chosen homotopies.
- Torsion linking has complementary degrees, target `AddCircle (1 : ℚ)`, the displayed symmetry
  sign, and nonsingularity under the stated finite-generation hypotheses.
- Euler characteristic gives the standard values on spheres, tori, and complex projective
  spaces and proves both additivity and finite-cover multiplicativity from earlier maps.
- Homological Whitehead produces a homotopy inverse to the given homology equivalence between
  simply connected CW-type spaces; it does not merely assert that some unrelated equivalence
  exists.
- The proposed relative-homotopy API does not make `pi_2(X,A)` a `Z`-module in general.  Its
  degree-two Hurewicz theorem derives the needed commutativity from connectivity, while the direct
  module-valued carrier starts in degree three.
- Every relative-homotopy group, induced map, boundary morphism, long exact sequence, and Hurewicz
  map takes a `BasedTopPair`; its point lies in the subspace and all maps preserve it. The API
  cannot construct `pi_n(X,A)` from an unbased `TopPair` or from an empty subspace.

- Ordinary representability's pullback map is bijective on arbitrary CW complexes,
  including disconnected and infinite-dimensional ones, and additive for every abelian
  coefficient group. Degree zero uses component functions; relative maps fix the subcomplex.
- The normalized universal class evaluates to the identity on the distinguished homotopy
  group, and the ordinary loop comparison induces that identity with the pinned suspension sign.
- A fixed n-skeleton extends exactly when its obstruction cochain vanishes. Vanishing of
  its cohomology class permits alteration of the n-skeleton relative to the lower skeleton
  and the specified subcomplex. Fibre transport and difference signs agree with these maps.

## References

- Ronald Brown, *Topology and Groupoids*, 3rd ed., Booksurge, 2006, Chapters 6--7.
- Samuel Eilenberg and Norman Steenrod, *Foundations of Algebraic Topology*, Princeton
  University Press, 1952, Chapters I--III.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  Sections 0.4, 1.2, 2.1--2.2, 3.1--3.3, 3.B, 3.G--3.H, 4.1, and 4.G.
- George W. Whitehead, *Elements of Homotopy Theory*, Springer GTM 61, 1978,
  Chapters II--VII.
- Albrecht Dold, *Lectures on Algebraic Topology*, Springer, 1972, Chapters VII--VIII.
- J. Peter May, *Simplicial Objects in Algebraic Topology*, University of Chicago Press, 1967,
  for Kan complexes, simplicial homotopy groups, and comparison with realization.
- Jean-Pierre Serre, *Homologie singulière des espaces fibrés. Applications*, Annals of
  Mathematics 54 (1951), 425--505, for the homology spectral sequence of a fibration.
- John McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Cambridge University Press,
  2001, Chapters 1--2.
- Charles Weibel, *An Introduction to Homological Algebra*, Cambridge University Press, 1994,
  Chapters 3 and 5, for `Tor`, `Ext`, and the Kunneth and universal-coefficient spectral sequences.
- Kenneth Brown, *Cohomology of Groups*, Springer GTM 87, 1982, Chapter VII, for the
  Cartan--Leray spectral sequence and transfer comparison.

- John Milnor, [On Spaces Having the Homotopy Type of a CW-Complex](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnorcw.pdf), Section 2 and Theorems 3–4, for arbitrary-CW and n-ad function-space CW type; its countable class W₀ is distinct from the general class W used here.

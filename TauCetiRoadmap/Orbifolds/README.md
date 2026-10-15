# Smooth orbifolds with finite isotropy

Construct smooth orbifolds with their finite isotropy, including ineffective isotropy: usable
proper étale presentations and finite charts, generalized maps and pullbacks, orbibundles,
invariant differential forms, weighted integration and rational duality. Construct compatible
coarse triangulations and the actual comparison between the classifying space and coarse space.
Include globally collared saturated domains and parameter-box products, with individually labelled
faces, used by parameter families and cobordisms.

The definitive specification is this README. `Suggested.lean` gives suggested forms and is not
an exhaustive checklist.

## Conventions and suppliers

A presentation has finite-dimensional Hausdorff second-countable smooth object and arrow
manifolds. Source and target are local diffeomorphisms, and `(s,t)` is proper, expressed using native
[`IsProperMap`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Maps/Proper/Basic.lean). Dimensions are
fixed on each connected component. The coarse space is the actual orbit quotient with its
quotient topology. Retain every arrow; two distinct arrows can induce the same germ on objects.
An orientation is preserved by all arrows, including isotropy. A boundaryless oriented assertion
therefore has orientation-preserving local isotropy. The boundary/corner carrier is the full
restriction to `D={x | rho_i(x)≥0 for all i}` in a boundaryless presentation, for a finite
family of arrow-invariant smooth functions with linearly independent active differentials
and supplied compatible invariant collars, together with products `Γ×[0,1]^k`. O1.6 constructs
these global corner groupoids and their charts. Each labelled face is preserved individually;
face-permuting quadrant actions are outside this carrier. Reflection loci of boundaryless
quotient charts remain distinct from these designated faces.

An orbifold map is represented by a principal bibundle, equivalently by a refinement span of
smooth functors with its 2-isomorphisms. A coarse continuous map alone is not such data.
Effectivization preserves the coarse space but need not preserve the orbifold. For a nontrivial
finite group `K`, the point presentation `[*/K]` retains isotropy `K` and is not equivalent to a
point with trivial isotropy.

Use ordinary cohomology `H*(BΓ;R)` for a presentation `Γ`. It is distinct from Chen–Ruan
cohomology. Rational comparison with the coarse space concerns constant coefficients, and the
orientation local system on locally orientable presentations, meaning each isotropy group
acts trivially on its local orientation line. Construct its descended coarse local system
and the pullback identification. These comparisons do not identify arbitrary integral or
isotropy-sensitive local systems with coarse ones. If isotropy reverses orientation, this
descent hypothesis fails: reflection on ℝ with the sign coefficient has local
`H^*(B(ℤ/2);ℚ_sign)=0`, and no rank-one coarse orientation local system is asserted.
Weighted integration is an operation on the orbifold, not ordinary manifold integration on
its generally infinite-dimensional classifying space. Use `[N/K]` for a quotient orbifold and
`BΓ` for its classifying space. Weighted integration uses the full finite isotropy
orders. In particular `∫_[*/K]1=1/|K|`.

- [LieGroupoidsPoisson](../LieGroupoidsPoisson/README.md) G0 supplies the native categorical
  groupoid, total-arrow topology/smooth structure and transverse-fiber-product interfaces;
  G3.5 supplies principal bibundles, balanced composition and Morita/isotropy comparison.
  Use those carriers and operations, including the direction `gh = h ≫ g` for first `h`, then
  `g`. This roadmap constructs the proper étale subtheory and its finite-chart reconstruction.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) B1.4 supplies proper
  finite-dimensional action slices, the free quotient and finite-isotropy local quotient
  charts. Finite Bochner linearization is constructed in O2.1. B2 supplies ordinary frame and bundle operations. Consume these for the action
  specialization and frame construction; build the arbitrary proper étale atlas here.
  B3 supplies ordinary connections, their affine one-form action and existence by partitions
  of unity; B4 supplies curvature, covariant exterior derivative and Bianchi. O2.4 and O4
  construct their invariant and nerve-level adapters using those exact contracts.
- [DifferentialGeometry](../DifferentialGeometry/README.md) supplies manifold forms,
  orientations, outward-normal-first boundary convention, smooth integration and de Rham
  comparison. [CharacteristicClasses](../CharacteristicClasses/README.md) and
  [TopologicalKTheory](../TopologicalKTheory/README.md) supply ordinary characteristic classes
  and bundle classifiers. Consume CC C4.1's invariant homogeneous polynomials, curvature
  evaluation and connection transgression, and C4.3's degreewise finite-Stiefel universal
  Chern–Weil/stabilization contract. O4-W constructs the simplicial/universal comparison.
- [AlgebraicTopology](../AlgebraicTopology/README.md) supplies singular chains/cochains,
  relative and small-chain comparison, subdivision, ordinary cup/cap products, realization,
  finite-group bar theory and cellular comparison. O5 owns the rational-homology-manifold
  compact-class/local-to-global duality extension using these generic chain APIs.
  O4 constructs the required finite-orbifold-atlas descent adapter from these, with actual
  maps. No general theorem about arbitrary singular-space sheaf cohomology is an input.
- [LieGroups](../RepresentationTheory/LieGroups/README.md) supplies the orthogonal Lie groups and their smooth
  matrix actions, consumed with SBC frames.
- [GeometricTopology](../GeometricTopology/README.md) supplies smooth manifold triangulation
  and relative collars. O3 constructs the extra orbit-stratum, locally-polyhedral and
  quotient-compatible triangulation theory needed for coarse orbifolds.
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K1 supplies complex orientations
  and their manifold comparison for complex-chart examples. A complex deformation family,
  a nodal domain, or a moduli-specific properness/slice theorem is additional geometric data,
  not supplied by a generic orbifold presentation.

[HamiltonianReduction R3](../SymplecticGeometry/HamiltonianReduction/README.md)
and [ConvexityToric T4](../SymplecticGeometry/ConvexityToric/README.md) retain their application
constructions. R3 owns the possibly ineffective retained-arrow quotient presentation and
invariant symplectic/orbifold forms. T4 owns its effective-model integration and rational
characteristic-class comparisons. Compare only on those actual common hypotheses.
O7 compares the general interfaces here with those application models on their common scope.
This comparison constructs no second moment map, symplectic reduction or toric classification.
[FuchsianOrbifolds](../FuchsianOrbifolds/README.md) retains its specified elliptic/cusp quotients
and area/signature calculations; O7 provides their generic orbifold comparison.

## O1. Presentations, maps and finite-action models

1. Define the Hausdorff proper étale subcategory on LGP G0's actual groupoid carrier, proving
   closure under the specified open restrictions, products and smooth equivalences. Consume
   LGP's unit/action groupoids and their total-arrow topology, together with native
   `CategoryTheory.ActionCategory` and `MulAction.orbitRel.Quotient`. Construct the adapter
   using `ActionCategory.objEquiv`; objects are not identified with X definitionally.
   Identify the total arrow space with `G×X` by its source and element label, and prove the
   topology, source, target, unit, inverse and multiplication formulas. Construct
   `MulAction.stabilizer G x ≃* CategoryTheory.Aut (CategoryTheory.ActionCategory.objEquiv G X x)`
   with multiplication `gh=h≫g`, comparing the native End/stabilizerSubmonoid interface and
   the opposite vertex-group convention. Retain labels even for elements acting trivially.
2. Consume LGP G0.4's smooth functors/natural isomorphisms and G3.5's principal bibundles,
   balanced composition, associators/unitors and their coherence. Construct the
   refinement-span/principal-bibundle comparison on this proper étale Hausdorff subcategory,
   its composition/refinement laws and equivariant-object descent. Prove coarse maps compose
   and Morita equivalences induce coarse homeomorphisms and isotropy isomorphisms. Prove the
   coarse quotient is Hausdorff, second countable, locally compact and paracompact. These
   adapters extend the existing carriers rather than define a second functor or bibundle theory.
3. Construct weak fiber products as actual triples `(x,h,y)` with `h:f(x)→g(y)` and the
   commuting arrow pairs, using LGP's transverse fiber products. State the required
   transversality of the displayed object/arrow maps; a submersion hypothesis is a sufficient
   case. Prove smoothness, proper étaleness, universal property up to natural isomorphism,
   composition/base-change and Morita independence under these hypotheses. A pullback whose
   fiber is a singular nodal curve is not asserted to be a smooth orbifold by this theorem.
4. Construct the étale presentation of a proper locally-free finite-dimensional Lie-group
   action with finite stabilizers from a countable collection of SBC slices, retaining actual
   transporting group elements. Construct its Morita bibundle to the action groupoid and
   prove slice-refinement independence. This is a general action specialization; the
   Hamiltonian comparison is O7. Do not assume every ineffective orbifold is a global
   compact-Lie-group quotient via an effective frame construction.
5. Use LGP G3.1's algebraic fibered action carrier to construct continuous equivariant
   families `p:Z→Γ₀`, with their actual continuous fibered action map and continuous
   intertwining maps, where `Z` is an arbitrary topological space. Construct the topological
   action groupoid and base-change along
   continuous maps of object charts. Supply the underlying fiber-product homeomorphisms.
   The smooth specialization uses O1.3's manifold/transversality hypotheses; it is separate
   from this topological construction.

6. Construct the global collared-domain carrier from the finite invariant `rho_i` data in
   the conventions. Its objects are D and its arrows are the full saturated restriction;
   prove saturation, inherited composition and properness. Use active rho coordinates and
   the supplied compatible collar fields to construct actual quadrant charts on objects
   and arrows. Prove source/target are face-preserving local diffeomorphisms in those charts
   and all structure maps smooth on the relative corner domains. Construct restrictions,
   neat face intersections, changes/refinements of this data and products with ordered
   boxes. Average local straightening data where needed, preserving the individually fixed
   faces and the collar compatibility equations. These are explicit globally collared
   orbifolds with faces; arbitrary corner actions are not part of this assertion.

   Pin the supplied collars as inward maps `c_i:F_i×[0,epsilon_i)→D` on their stated
   neighborhoods, with `c_i(x,0)=x`, `rho_i(c_i(x,t))=t` and
   `rho_j(c_i(x,t))=rho_j(x)` for `j≠i`. They commute on common domains and are equivariant
   for the actual arrows, including their restrictions to all labelled intersections.
   Collar radii may be positive invariant functions. Retain this compatible collar datum
   as a hypothesis of the carrier. O1.6 owns the box product, face-restriction and averaged
   straightening maps; their orientation conventions and integral laws occur later.

   Define the full topological restriction to the closed union `∂D=⋃_i F_i` and its nerve,
   using the face/intersection charts rather than assuming that this union is a single
   smooth object chart. Construct compatible invariant NDR/collar data for
   `(N_pΓ_D,N_pΓ_∂D)` in every nerve degree, compatible with all structure maps, and the
   closed-subspace/relative-pair comparison after fat realization. The corner-union
   retraction is constructed from the commuting collars and continuous quadrant face
   coordinates; it is not the saturated-open restriction theorem. These maps give the
   good pair `(BΓ_D,BΓ_∂D)` used in O4-P.

## O2. Retained-arrow charts, averaging and effective reduction

1. At each object `x`, construct a sufficiently small invariant neighborhood `U` and an
   isomorphism `Γ|U ≅ Γ_x⋉U`. Prove finiteness of `Γ_x` by properness and étaleness. Choose
   actual local bisections for its elements, shrink so all multiplication identities hold,
   and use properness to exclude additional arrows near `(x,x)`. Keep the distinct label
   `g` even if its action on all of `U` is the identity. Own finite Bochner linearization:
   choose `c:U→T_xU` with `c(x)=0` and `dc_x=id`, write `L_g=d(g)_x`, and set
   `A(y)=|G|⁻¹Σ_g L_g⁻¹ c(g·y)`. Prove `A(h·y)=L_h A(y)` and `dA_x=id`.
   Apply the inverse function theorem, shrink simultaneously, and average an inner product
   to obtain an invariant ball and the equivariant chart. This works for nonfaithful
   actions and proves the derivative representation detects the ineffective kernel.
2. Construct finite-chart atlas data with actual overlap-arrow torsors, composition and
   natural transformations. The overlap data include the separated/proper condition on the
   resulting arrow relation. Construct the presenting smooth groupoid, prove properness,
   refinement and the two inverse comparisons up to Morita equivalence. Replacing overlaps
   by only germs of chart diffeomorphisms would erase ineffective isotropy and is not the
   chart model. Prove local change-of-chart and stabilizer-conjugation formulas, restriction,
   products and the independence of the chosen local linearization.
3. Define the ineffective kernel by arrows inducing the identity germ. Prove it is locally a
   finite normal kernel acting trivially on the connected chart, construct the effective
   quotient presentation and prove equality of coarse spaces. Prove the kernel-order
   function is locally constant on each connected orbifold component; retain the actual
   kernel groups and their conjugation/monodromy. Prove the full stabilizer equals this
   kernel on a dense principal open subset by the faithful finite linear fixed-subspace
   calculation. Give the trivial gerbe `K×N⇒N` as a
   required example. Effective reduction is not asserted to be a Morita equivalence.

   On an O1.6 face or labelled intersection prove that its ineffective germ kernel equals
   the ambient ineffective kernel. If g fixes its face germ, its derivative is the identity
   on the face tangent space. Preservation of each active rho gives identity on the normal
   quotient, so `dg=Id+N`, where N maps normal directions to tangent directions and N²=0.
   Finite order gives `0=(Id+N)^m-Id=mN`, hence N=0 over ℝ. O2.1's Bochner chart then gives
   the ambient identity germ. The converse is restriction. Thus the same kernel order k
   appears on all incident labelled faces, including at corners; conjugation identifies
   these kernel groups along arrows.
4. Reuse
   [`GroupAlgebra.average`, `Representation.invariants`, `averageMap` and `isProj_averageMap`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Invariants.lean) for finite representations over a coefficient ring in which the group
   order is invertible. Prove the intertwiner and change-of-group compatibilities needed
   here, exactness of invariants by averaging lifts, and the resulting positive-degree
   finite-group cohomology contraction with the native bar/action convention. Construct
   invariant smooth partitions and finite-action metric averages. Construct affine
   averaging of connections on a fixed equivariant bundle: after choosing ∇₀, differences
   of connections are End(E)-valued one-forms by SBC B3, so average the pulled-back connections in
   this affine space and prove independence of ∇₀, invariance, Leibniz and refinement laws.
   Native linear `averageMap` alone is not this affine construction. Consume AT8.8's actual
   bar/group-cohomology comparison for the stated finite-group contraction. These have
   actual coefficient/order hypotheses; integral invariants are not advertised as exact.
5. For each dimension `n`, let `Γ₀^(n)` be the union of **all** connected components of the
   object manifold having dimension `n`, and let `Γ^(n)` denote the full restriction of the
   groupoid to that union (including every arrow between its objects). Construct an invariant
   positive metric and the orthonormal object-frame bundle `E_n→Γ₀^(n)`. Prove Γ₀^(n)
   is saturated, open and closed, and `Γ≅⊔_n Γ^(n)` as an actual groupoid. Apply the lift
   to `Γ_eff^(n)`, the effective reduction of that restriction; prove its frame action
   free and proper. Construct its smooth quotient `F_n:=E_n/Γ_eff^(n)` as a manifold. The residual right
   `O(n)` action on `F_n` is proper and locally free, using LieGroups/SBC smooth O(n). Prove the effective presentation
   restricted to `Γ^(n)` is Morita equivalent to `F_n⋊O(n)` and that
   `F_n/O(n)≅|Γ^(n)|`. Assemble componentwise as `E=⊔_n E_n`, `F=⊔_n F_n`, and
   `|Γ|≅⊔_n(F_n/O(n))`; no single `O(n)` acts across components of different dimensions.
   Use SBC frame/quotient and Lie-group interfaces. For an ineffective presentation apply
   this construction only to its effective reduction for coarse-space purposes; its kernel
   fixes object frames and cannot be discarded in the original groupoid, its bundles or
   integration.

6. Construct the coarse diffeology using native
   [`DiffeologicalSpace`, `Diffeology.IsPlot`, `DSmooth`, `dTopology` and
   `IsDTopologyCompatible`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Geometry/Diffeology/Basic.lean).
   First construct the manifold diffeology from smooth chart plots, proving chart independence
   and equality of its D-topology with the stated manifold topology. For a finite smooth
   action on `U`, construct the quotient diffeology on the native orbit carrier: a map from
   a Cartesian test space is a plot precisely when it locally lifts to a smooth plot of
   `U`. Use native `DiffeologicalSpace.ofCorePlotsOn` to construct the structure and prove
   the required generated/coinduced-plot lemmas. Prove constant, reparametrization and locality laws, smoothness and the subduction
   property of the quotient projection, and the descent criterion for a function out of
   the quotient to be `DSmooth`. Prove its D-topology equals the ordinary quotient topology.
   Supply open restrictions, common refinements and the finite-product comparison, proving
   topology compatibility for these models rather than assuming D-topology preserves
   arbitrary products or subspaces. O3.4 constructs the separate relative quadrant adapter.

   Glue the finite-chart quotient plots to the coarse space of a presentation. Prove Morita
   independence and functoriality for the actual generalized maps of O1, including natural
   isomorphisms and compositions. Construct the local linear-quotient identifications for
   the effective reduction. Compare this coarse local-model notion with the effective
   finite-linear-subgroup formulation in
   [Eltschig's existing diffeological development](https://github.com/peabrainiac/lean-catdg/blob/1ee4a2614b033dd1b4aded95759eb31eb9b0fbf4/CatDG/Diffeology/LocallyModelled.lean).
   This comparison concerns the underlying coarse smooth space. Keep the retained-arrow
   presentation as the orbifold carrier: identical coarse diffeologies do not determine
   ineffective isotropy, its representations or weighted integration. Compare its fixed
   dimension-n formulation per Γ_eff^(n), not on a mixed-dimensional disjoint union.

## O3. Coarse triangulation, finite covers and boundary models

1. Prove the Yang/Cairns route for a proper locally free smooth action of a compact Lie
   group on a separable metric manifold, with finite stabilizers. Use SBC slices and O2.1's
   finite linearization to prove local finiteness of the needed orbit types and construct
   regular locally-polyhedral slice/join charts with frontier compatibility. Own the full
   Cairns locally-polyhedral triangulation proof needed by Yang's reduction, including
   locally finite construction, relative subdivision/gluing and its realized homeomorphism.
   Apply it separately to each `(F_n,O(n))`; take their dimension-indexed disjoint union.
2. Transport this triangulation to the coarse space and construct atlas-subordinate stellar
   refinements. Closed simplices and sufficiently small star closures lie in designated
   charts; isotropy is constant on simplex interiors, with face subgroup inclusions and
   conjugation maps. Prove the simplex/star lift homeomorphisms and their compatible
   restrictions. Lift to the original ineffective charts with their full groups. Prove
   local finiteness and compactness-implies-finiteness. This construction precedes descent
   and duality and does not use those comparisons to establish triangulation.
3. On each dimension-n coarse component construct a locally finite barycentric open-star
   cover of multiplicity at most n+1, with its actual intersection/refinement diagram.
   Supply chart models, contractible lifted intersections with equivariant contractions
   whenever used, centred isotropy-fixed charts for the required point-local models,
   isotropy maps and commuting restrictions. Its Čech complexes use products for cochains
   and direct sums for chains. Fix a total order on the vertices and first use strictly
   increasing-index Čech cochains; equivalently construct the alternating normalized
   complex. Multiplicity bounds its horizontal degree by n. For unrestricted ordered
   tuples, including repetitions, construct the normalization/alternation chain maps and
   homotopies before applying that bound. Construct small-chain augmentations,
   cover/refinement homotopies and singular/cellular comparisons. Compact coarse space
   gives a finite cover/finite CW model. For an open U in the coarse space reapply O3.1–3
   to `Γ|q⁻¹U`, whose dimension-n frame manifold is the open O(n)-invariant restriction of
   F_n. Such an open need not be a subcomplex of the previous triangulation. There is no
   globally uniform dimension bound
   across unbounded-dimensional components; apply the construction componentwise and use
   the actual component product/sum decompositions. The coarse CW model is not a finite CW
   model of BΓ, which retains finite-group integral cohomology.
4. For O1.6's global collared domains construct face-adapted relative triangulations using
   compatible collars/doubling and the additional relative locally-polyhedral gluing proof.
   Prove each labelled face is a subcomplex after refinement, and obtain finite CW pairs in
   the compact case. Construct the quadrant diffeology by locally smooth extension plots;
   prove its D-topology equals the given relative topology and prove the smooth-extension
   criterion relating DSmooth to the manifold-with-corners chart notion on these models.
   Supply the face-preserving gluing/refinement and finite-product laws. Neither this
   quadrant smoothness theorem nor the relative triangulation is inferred from Yang's
   boundaryless result. Parameter coordinates have trivial isotropy and face swaps are excluded.
5. On O1.6's existing products and face/collar maps construct the outward-normal-first
   product orientations and their index-transport laws. Prove codimension-two oriented
   face cancellation and the two interval-end signs. Integral Stokes identities belong
   to O5.2. Reflection strata of a
   boundaryless quotient remain singular strata, not designated boundary faces. Smooth
   transverse parameter families use this carrier and its actual collar hypotheses.

## O4. Orbibundles, forms and the finite-atlas comparison

1. Define real/complex finite-rank orbibundles and principal bundles as ordinary bundles on
   objects with coherent smooth arrow actions. Construct pullbacks on refinement spans and
   generalized maps, tensor/dual/exterior operations, metrics, connections, sections and
   their Morita equivalences. Include nontrivial representations of ineffective kernels on
   fibers. The coarse total space need not be a vector bundle and invariant sections need
   not give an invariant local frame. Construct equivariant connections from ordinary local
   frames, SBC B3's affine connection/existence contract, O2.4 finite averages and
   invariant partitions, without that false frame assumption. Use SBC B4 for curvature,
   Bianchi and connection pullback; the orbifold descent equations are proved here.
2. Define invariant forms by `s*ω=t*ω`, with the actual manifold exterior derivative, wedge,
   contractions where defined and pullbacks. Prove Morita descent and chain-level maps.
   Support is measured in the coarse space. Compact-support pullback requires the displayed
   coarse/support map to be proper on the relevant support. Construct extension by zero for
   compactly supported forms on open suborbifolds, restriction and relative complexes,
   Mayer–Vietoris and their support maps. For `R→point`, pulling back the function `1` does
   not preserve compact support, so no arbitrary-map compact-support statement is used.
3. **O4-N: the classifying model.** Define BΓ primarily as the fat realization of the
   topological nerve, with the inherited topology on every composable-arrow manifold and
   its actual face maps. Define `q:BΓ→|Γ|` by the orbit of any vertex. For saturated open U,
   prove its preimage is precisely the fat realization of the full restricted nerve, as a
   subspace with the same quotient topology. This open-restriction equality is primary.
   Construct good-degeneracy/NDR lemmas for these manifold nerves, the fat-to-thin weak
   equivalence and the comparison with realization of diagonal objectwise Sing; prove
   naturality, products and the necessary realization/diagonal comparison. These are O-owned
   topological-nerve adapters to AT, not assertions that discrete nerve realization suffices.

   Prove realization descent for the Čech nerve of a numerable surjective submersion: use
   actual local sections, a subordinate locally finite partition of unity and barycentric
   contraction to construct the augmentation weak equivalence and its homotopies. Apply the
   bisimplicial realization comparison to common refinements of principal bibundles, including
   their required auxiliary submersion-pullback Lie groupoids. Obtain Morita weak equivalences
   with refinement/composition coherence. The auxiliary groupoids need not be étale; their
   nerve good-degeneracy and numerability premises are constructed here in precisely this
   use. Compare a finite-action chart with `EG×_G U`. For any invariant contractible U,
   the projection `EG×_G U→BG` is a weak equivalence, by its associated-bundle contractible
   fiber and the constructed fibration comparison. A fixed point x with an equivariant
   contraction to x is a sufficient local model that additionally identifies this G with
   Γ_x and supplies a specified equivalence with BΓ_x. No necessity assertion about fixed
   points is used.
4. **O4-S: locally finite descent.** On every dimension-n component and every open subset,
   reapply O3's bounded-multiplicity locally finite open-star construction to that open
   restriction, using full restricted subgroupoids
   and O4-N's actual preimage maps. Form the two augmented Čech/singular cochain double
   complexes with products over strictly increasing intersections, horizontal degree0
   through n after O3.3's normalization, and
   `d_tot=δ+(-1)^p d`. Construct small-chain/subdivision augmentations, common-refinement
   maps and actual cochain homotopies. The finite horizontal filtration proves the
   quasi-isomorphisms without a cohomology-of-exhaustion or inverse-limit assertion.
   Local finite-group averaging and the centred contractions identify q* on each local
   cohomology group over ℚ/ℝ. Prove the global ring isomorphism
   `q*:H*(|Γ|;R)≅H*(BΓ;R)` and the chain/homology comparison, using direct-sum chain
   totalizations rather than an unrestricted coefficient duality shortcut. Prove cup and
   Alexander–Whitney compatibility with total product sign `(-1)^(q p')`.
   Apply the same absolute theorem to `|Γ|\K` for every closed K, and the pair long exact
   sequences/five lemma to obtain the relative isomorphism for that K. Apply componentwise
   product/sum decompositions when dimensions vary. This finite-atlas/local-finiteness
   adapter uses AT's generic chains, not an unwritten singular-space sheaf theorem.

   **O4-P: collared pairs.** For every O1.6 carrier construct the actual pair map
   `q_D:(BΓ_D,BΓ_∂D)→(|D|,|∂D|)` and prove its homology and cohomology isomorphisms over
   ℚ/ℝ, with the descended orientation coefficients under the stated local-orientability
   hypothesis. Use O3.4's face-adapted star covers on D and the closed union of faces,
   their intersection maps and O1.6's closed-face NDR/realization comparison. The lifted
   intersections and their boundary-star restrictions have the finite-action contractible
   or averaged-acyclic models constructed there. Apply the same finite-horizontal
   augmentations to get both absolute comparisons, then the natural pair LES and five
   lemma. Construct boundary-map, cup/cap, refinement and all labelled-face compatibilities.
   This is a theorem for the closed pair, not an application of the saturated-open equality.
   O2.3's equality of ambient and face ineffective kernels supplies the same k on the
   boundary and interior in every later weighted boundary equation.
5. **O4-R: forms and descent.** On those same covers construct the invariant-form Čech
   double complex, finite averaged Poincaré contractions and locally finite partition
   homotopies. Construct the zigzag to the constant Čech complex and O4-S singular cochains,
   with actual maps, products, common-refinement and pullback homotopies. Use the bounded
   horizontal filtration on noncompact opens as well. Construct levelwise smooth-singular
   integration and its realization/Eilenberg–Zilber comparison when using forms on the
   manifold nerve. A coarse singular simplex is not assumed globally smoothly liftable.
6. Relative pairs use the actual O1.6/O3 collared domains. Define coarse-compact classifying
   support by `H^*_{c,q}(BΓ;R)=colim_(K compact in |Γ|)H^*(BΓ,BΓ\q⁻¹K;R)` and the actual
   relative restriction maps. O4-S proves q* for each closed K before taking this compact
   colimit. At fixed K the form model is the actual mapping-fiber complex
   `Cone(Ω_inv(X)→Ω_inv(X\K))[-1]`, with its native cone/shift signs and comparison map
   to relative cochains. It is not the complex of smooth forms supported in K. Construct
   these maps for every K, then the compact-K colimit and its comparison with compactly
   supported invariant forms using partitions and extension by zero. Prove all support
   enlargement, restriction and proper-support pullback squares. The map q need not be proper;
   this is not ordinary compact support on BΓ.
   Pullback with compact support requires the displayed coarse map to be proper on that
   support. Distinguish full cochain products from compact-support sums. No interchange of
   exhaustion cohomology with a limit is part of this construction. For locally orientable
   presentations construct the descended coarse orientation line and the same comparisons
   with that coefficient; its isotropy-triviality hypothesis is retained throughout.
7. **O4-K: the represented bundle.** From an arrow-equivariant bundle construct the actual
   topological vector/principal bundle `E_B→BΓ`, using nerve-level vertex pullbacks and arrow
   identifications. Prove local triviality/numerability on fat realization via the specified
   local-section/barycentric covers, compatibility with diagonal-Sing comparison and
   pullback/refinement/Morita laws. Nontrivial ineffective kernel representations remain in
   E_B. Consume CC/TopK ordinary classes on this represented bundle. State precise descent
   conditions for a coarse bundle; a rational cohomology isomorphism alone is not descent.
8. **O4-W: simplicial Chern–Weil comparison.** For an invariant connection on an orbibundle,
   pull the bundle to each vertex of N_pΓ and use actual composite-arrow bundle isomorphisms
   to identify them with the vertex0 pullback. On `Δ^p×N_pΓ` form the barycentric affine
   connection `Σ_i t_i∇_i` using SBC B3/B4. For an invariant connection these arrow bundle
   isomorphisms identify every ∇_i with ∇_0; the barycentric connection is then constant
   in simplex directions. Prove compatibility under every face and degeneracy, including
   the vertex0 gauge transformation; apply CC C4.1's invariant polynomials to its curvature.
   Construct Chern–Simons forms for changes of connection and their face/degeneracy and
   higher-parameter transgression identities. Integrate over oriented simplices to the
   total complex with O4-S's differential/product signs and compare to singular cochains.
   Construct the numerable classifying map of E_B to the stable ordinary classifier.
   On each component of fixed object dimension and bundle rank, choose Stiefel/Grassmann
   stages N(p) on its finite-dimensional simplicial cover, growing
   with p and, where needed, with the finite subdiagram under comparison. Construct
   finite-stage classifying maps and connection comparisons using the finite-dimensional
   paracompact cover/order bound, relative face extension and common refinements; prove
   their stabilized face, degeneracy and higher-concordance compatibility. No single
   finite universal bundle is asserted to classify E_B over the whole infinite realization.
   Apply CC C4.3's degreewise universal Chern–Weil/stable compatibility and the explicit
   affine transgression to prove the resulting total class is the pullback of
   the ordinary universal characteristic class. This owns the simplicial-to-universal
   bridge, not a deduction from agreement on small charts. Prove refinement/Morita/products
   and support-compatible laws. Integral characteristic classes and kernel representations
   remain in E_B even when their real Chern–Weil images vanish.

## O5. Weighted integration, Thom classes and rational duality

1. Construct the arrow-invariant orientation line and its orientation transport from DG.
   For an oriented orbifold and compactly supported top form define the local integral on
   `U/G` by `|G|⁻¹∫_U`, including the full ineffective kernel. Prove chart-change and
   isotropy-index formulas, partition/refinement and Morita independence, additivity and
   product/Fubini. Work over `ℚ` for rational classes and `ℝ` for forms; versions over a
   different coefficient ring state that every required isotropy order is invertible.
2. Prove the integral Stokes identity on O1.6's existing global collared domains and box
   products with the orientation/sign maps fixed in O3.5, using DG's boundary integration
   theorem. The identity includes both interval signs and codimension-two cancellation.
   Prove refinement/change-of-variables invariance. The trivial gerbe
   `K×N⇒N` has integral `(1/|K|)∫_N`; `[*/K]` has integral1 equal to1/|K|. These are
   orbifold integrals, not ordinary integration over the infinite CW space B(K).
3. **O5-L: local homology.** Prove the relative rational homology calculation for an
   orientation-preserving finite linear ball quotient and its punctured/sphere pair, from
   the admissible subdivision, equivariant chains and finite averaging. It has one oriented
   top generator and no other relative rational homology. Include the compatible half-space
   and labelled-corner pair calculations for the supplied global face carrier. An isotropy
   orientation reversal fails this hypothesis and is not repaired by calling the coarse
   singular locus a boundary.
4. **O5-A then O5-P: compact classes and duality.** Own the rational-homology-manifold
   extension of the compact-class lemma on O3's locally finite coarse complexes, using
   O5-L and only AT's generic excision, Mayer–Vietoris, cap and coefficient maps.
   For each compact K in a boundaryless dimension-n coarse component, prove
   `H_i(X,X\K;ℚ)=0` for i>n, injectivity of the degree-n restriction to all point-local
   classes on K, and existence of a unique class for each compatible local orientation
   section. Construct the class map and restriction/additivity laws by compact
   neighborhood subdivision and relative Mayer–Vietoris gluing; existence is a target,
   not inferred from matching stalks alone. Supply the corresponding orientation-line
   version using the coarse orientation local system already constructed in O4.6 under
   its local-orientability hypothesis. This constructs the local-to-global
   bridge beyond AT's manifold-specific theorem.

   From these compact classes prove rational cap duality by Mayer–Vietoris induction on
   the adapted neighborhoods, with direct limits over compact supports. Prove the compact
   boundaryless PD theorem and Poincaré–Lefschetz for O1.6's compact collared pairs, using
   collars for the boundary-relative class. Construct their actual fundamental classes,
   cap maps and perfect compact cup pairings over ℚ and ℝ. For a compact connected oriented
   component with generic ineffective order k, **define** the weighted BΓ fundamental
   class by `q_*[Γ]_orb=(1/k)[|Γ|]` through O4-S, and for a collared pair through O4-P.
   Prove compatibility with the boundary map using the same face kernel order from O2.3.
   The substantive normalization theorem is that evaluation under O4-R's de Rham comparison
   equals O5.1's chartwise full-isotropy integral. Prove it by comparing O5-L's local
   generator with DG's oriented chart generator and then partition/refinement and compact
   gluing. The weighted-class equation is its definition, not a substitute for this theorem.
   A noncompact component is used through
   compact-support comparisons; no ordinary noncompact fundamental class is asserted here.
5. **O5-T: Thom and wrong-way maps.** For an oriented rank-r orbibundle use its represented
   ordinary bundle `π_B:E_B→BΓ`. The Thom target is the actual pair
   `(E_B,E_B\0_B)` (equivalently its constructed disk/sphere bundle pair), and the
   isomorphism is `a↦π_B* a∪u` with degree shift r. Pullback to each ordinary oriented
   fiber has Thom generator1. Construct its form representative with compact vertical
   support, the zero-section Euler pullback, orientation reversal, products and excision.
   Combine vertical compact support with coarse-compact base support for the integration
   formula `∫_E π*α∧Φ=∫_Γ α`. In a U/G chart both sides use the same1/|G| factor, so the
   weights cancel; an effective/coarse re-normalization has its separate kernel factor.

   Own the equivariant tubular-neighborhood theorem for a representable proper smooth
   embedding with identified oriented normal orbibundle: construct invariant metrics,
   compatible normal exponentials and a positive invariant radius function, then prove
   the global open normal-neighborhood comparison with chart/refinement independence.
   For the collared carrier require neatness and compatible labelled-face collars.
   Use this actual tubular data and Thom excision to define the Gysin map. Proper oriented
   submersions with compact fibers use integration along fibers with stated vertical/base
   supports. Prove transverse base change, projection/products and refinement laws. A
   generalized map alone supplies neither tubular data nor a Gysin operation.

## O6. Maps, families and comparison laws

Prove bundle/form/cohomology functoriality for generalized maps and 2-isomorphisms, with the
actual common-refinement maps and higher composition laws needed for families. Prove the
relative and compact-support projection formulas under their stated properness/orientation
hypotheses. Construct parameter products and restrictions at all faces, naturality of Stokes,
Thom and Gysin comparison, and the corresponding collared-cobordism laws. Here a cobordism
is an O1.6 oriented carrier W with disjoint designated incoming/outgoing boundary unions,
actual face-presentation identifications with Γ_0 and Γ_1, and compatible collars; any remaining
faces and support restrictions are specified. The boundary orientation is outward first,
`∂W=−Γ_0 ⊔ Γ_1` on those designated faces. Require a closed coarse support that is compact
(or proper over a stated compact parameter support), restricts to compact supports on the
faces, and avoids any other faces. For closed forms whose degree admits Stokes, prove equality
of the outgoing/incoming supported integrals with these signs; relative cohomology and class
maps use O4-P and retain the same support data. Integration and the cohomology comparison
use the retained-arrow presentation
throughout, even when its coarse model is obtained by effective reduction.

For a supplied continuous equivariant family `p:Z→Γ₀`, construct O1.5's topological action
groupoid, chart pullbacks and overlap maps. For a supplied complex or nodal family retain
its actual local models, including `xy=a` where specified. Recover its actual fiber after pullback to an object chart;
its coarse forgetful fiber can be a quotient by automorphisms. Smooth transverse families use
O1.3. For supplied nodal families retain their singular fibers and their separate complex-domain
family carrier; construct the compatibility of the presentation maps without asserting that the
nodal fiber is a smooth orbifold. Domain deformation, map stability/slicing and virtual
obstruction/perturbation data are additional constructions of their respective theories.

## O7. Required examples and overlap comparisons

- A manifold with unit groupoid, a finite effective linear quotient, and a point with arbitrary
  finite isotropy. Test classifying/coarse comparison, isotropy, bundles and integration on
  each, including a nontrivial kernel representation over a point.
- Trivial finite gerbes over oriented manifolds; compute the weighted fundamental class,
  product/interval signs and characteristic-class comparison. Effective reduction preserves
  the coarse space but not these isotropy-sensitive objects.
- Given the compact Hamiltonian locally-free quotient model of HamiltonianReduction R3,
  compare its actual retained-group-element slice groupoid and refinement bibundles with
  O1–2. Compare the invariant/symplectic forms on the possibly ineffective HR model;
  no HR integral or characteristic-class construction is presumed. Compare integration
  and rational characteristic classes with ConvexityToric T4 only on its effective common
  model, using its actual bundle/form data. On a connected ineffective input with kernel
  order k, prove for the
  corresponding coarse form that `∫_effective=k·∫_full`; supply the componentwise version.
  Keep both normalizations explicit in common-weight-factor examples. Retain their symplectic descent,
  reduced volume and common-weight-factor examples; these remain application constructions.
  No prerequisite from this roadmap is imposed on those existing application contracts.
- Compare finite Fuchsian elliptic quotient charts with the corresponding finite-action
  orbifold charts and their orientation/area normalization. Cusp compactification and
  hyperbolic area/signature calculations remain in FuchsianOrbifolds.
- For any supplied stable finite-isotropy complex-domain chart groupoid, compare its complex
  orientation with O5 and its true chart-pulled-back universal family with O6. The input
  includes the actual moduli-specific deformation charts and properness proof. A prestable
  object with positive-dimensional automorphisms is not an orbifold merely by naming its
  coarse quotient. Similarly a nonregular stable-map space does not acquire a virtual class
  from these regular orbifold APIs.

## Construction order

O1.1–5 consume LGP carriers/maps and SBC slices. O2 owns finite Bochner linearization
and affine averaging, after which O1.6 constructs the global collared-domain charts.
Effective frames and the native coarse-diffeology adapter remain boundaryless O2 constructions; O3
builds coarse triangulation, relative pairs and cover diagrams without using rational coarse
cohomology or PD. O4 uses those covers and O2's native averaging to construct local-to-global
comparison, the closed collared-pair O4-P theorem and the independent simplicial
characteristic-class bridge. The descended coarse orientation line in O4.6 precedes the
orientation-line compact-class theorem. O1.6's carrier/NDR data precede O5-L. O5-L precedes
O5-A compact-class existence, then O5-P duality; the equivariant tubular construction
precedes Thom/Gysin. O5 constructs the weighted integration/duality and Thom operations; O6 and
O7 prove their map/family and overlap laws. The triangulation proof does not use the O4
comparison to establish its own existence. The classifying space and coarse finite model are
kept distinct at every step.

## References

- I. Moerdijk, [*Orbifolds as Groupoids: an Introduction*](https://arxiv.org/abs/math/0203100),
  §§2–4, for retained-arrow presentations, generalized maps, local charts and coarse comparison.
- I. Moerdijk and D. Pronk, *Orbifolds, Sheaves and Groupoids*, K-Theory 12 (1997), 3–21,
  for the effective specialization; its faithful-slice theorem is not substituted for the
  ineffective chart theorem here.
- I. Moerdijk and D. Pronk,
  [*Simplicial Cohomology of Orbifolds*](https://arxiv.org/abs/q-alg/9708021), §1.2,
  for adapted simplex/star lifts and atlas refinements.
- C. T. Yang, *The triangulability of the orbit space of a differentiable transformation group*,
  Bull. AMS 69 (1963), 405–408, and S. S. Cairns, contribution to
  *Lectures in Topology*, University of Michigan, 1941, pp.143–157,
  for the locally-polyhedral triangulation floor used in the orbit-space route;
  the triangulation and relative proof floors used here are explicit O3 targets.
- A. Adem, J. Leida and Y. Ruan, *Orbifolds and Stringy Topology*, Cambridge, 2007,
  Chapters 1–2, for ineffective groupoids, bundles, forms and weighted integration.

Mathlib's native diffeology foundation originates in
[PR #26484](https://github.com/leanprover-community/mathlib4/pull/26484).
The existing [lean-catdg development](https://github.com/peabrainiac/lean-catdg)
provides effective coarse local-model work. Reuse the native definitions and construct the
stated compatibility adapters; its effective coarse notion does not replace the
retained-arrow orbifold and general ineffective bundle theory here.

The [D-topology development in Mathlib PR #27274](https://github.com/leanprover-community/mathlib4/pull/27274)
describes a compatible generated-plot/coinduced-topology API direction. Follow that direction and
construct the required lemmas for these smooth quotient models. Its continuous diffeology
uses all continuous plots and has delta-generated D-topology; it is not the smooth
finite-quotient diffeology specified above.

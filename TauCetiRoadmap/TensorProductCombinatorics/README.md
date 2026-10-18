# Hives, honeycombs, puzzles and type-A tensor products

Build the integral and real combinatorial models of rational GLₙ tensor products,
their piecewise-linear associator and commutor, the saturation and Horn theorems,
and the ordinary Grassmannian puzzle rule. The result includes usable finite
polytope, honeycomb-diagram, puzzle and type-A path interfaces, with explicit
comparisons to existing tableaux, representations, cohomology and Hermitian
spectral data. Suggested homes are `TauCeti/Combinatorics/Hive/`,
`TauCeti/Combinatorics/Puzzle/` and `TauCeti/RepresentationTheory/TypeAPath/`.

The source is Knutson's seven-page **hives** handout and the hive, honeycomb,
puzzle and Grassmannian lectures and homework in the two Lie Groups notebooks.
The notebook assertions enlarge the handout's scope: they include saturation,
all puzzle inequalities, rigid puzzles, overlay/PRV and actual Grassmannian cup
products. Generic highest-weight classification, Schur functions and LR tableaux
have existing owners. This roadmap builds the comparisons and the geometry of
the new combinatorial objects.

## Conventions and suppliers

1. Use `TauCeti.DominantWeight n`, the native antitone `Fin n → ℤ` subtype,
   including all determinant twists. Its `shift`, `detShiftShape`,
   `weightOfShape` and shape equivalence supply the partition dictionary.
   Define λ*ᵢ=−λₙ₋₁₋ᵢ. For integral hives, the cyclic boundary triple
   (λ,μ,ν) has sum of all coordinates zero and counts invariants in
   Vλ⊗Vμ⊗Vν. The product coefficient for Vγ is the triple (λ,μ,γ*).
   Rank0 has one normalized empty hive and the empty dominant weight; statements
   using a last coordinate, interior face or regular boundary require positive rank.
2. The triangular lattice is `Δₙ={(x,y,z)∈ℕ³:x+y+z=n}`. Use finite subtypes,
   with A=(n,0,0), B=(0,n,0), C=(0,0,n), normalize h(A)=0 and read cyclic
   edge differences A→B→C→A. Embed (x,y,z) at
   `(z+y/2, √3*y/2)`; A→B→C is **clockwise**. These are respectively
   KTW’s NW, NE and south sides read clockwise. The handout’s counterclockwise
   triple, starting at A, is `(ν*,μ*,λ*)` for this roadmap’s `(λ,μ,ν)`. A unit rhombus has two **obtuse** corners on
   its short diagonal; require their sum ≥ the sum at the acute corners.
   Thus the continuous interpolation affine on unit triangles is **concave**
   in the conventional mathematical sense; −h is convex. All three orientations
   are required. Unnormalized hives differ by an additive constant; adding an
   affine function preserves rhombus slacks and changes boundary weights.
   Keep this gauge action explicit. For forward differences
   `D_v h(p)=h(p+v)-h(p)`, directions v,w with dot product1 satisfy
   `D_v D_w h≤0`; edge dominance uses a_i−a_(i−1). Prove these corrected
   comparisons with the short-diagonal inequality. At n=2, the rhombus with
   short corners m_AB,m_CA has slack
   `h(m_AB)+h(m_CA)-h(A)-h(m_BC)=-(λ₂+μ₁+ν₂)`; its selected0 positions
   are λ₁,μ₂,ν₁. This pins the chirality and sign dictionary.
3. Scalars are ℤ for counting and ℝ for polyhedra, with ℚ for rational witnesses.
   The ℤ→ℝ map commutes with all inequalities and boundaries. A real hive with
   integral boundary need not itself be integral, and its polytope need not have
   only integral vertices. Saturation asserts existence of an integral witness.
   Real hives form a convex cone; integer hives form an additive monoid, not a
   vector space. Finite fixed-boundary fibres are counted with `Nat.card` only
   after proving `Finite`.
4. Consume [SchurWeyl Layers 0 and 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md):
   native `YoungDiagram`, `Nat.Partition`, `BoundedSSYT`, standard tableaux,
   `diagramSchurPoly`, finite Schur basis and horizontal Pieri; the same owner's
   skew/LR tableaux, insertion/rectification/dual-equivalence, vertical Pieri,
   stable ring Λ and its coefficient/specialization maps are dependencies.
   Consume [ClassicalGroups Layers 3–6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md):
   native dominant weights, signed `GTPattern`, `gtPatternEquivSSYT`, rational
   Weyl representations, characters and LR-to-tensor-multiplicity comparison,
   and its weight/branching basis. Consume [LieHighestWeight Layer 6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/797f5b74355c8cee4c8a2dfa1bb34bcb5c90ce69/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md)
   for the Weyl character/multiplicity formula and generic Lie-module
   representation ring. Consume the generic native `TauCeti.kostantPartition P b`
   from `TauCeti/LinearAlgebra/RootSystem/KostantPartition/Basic.lean` for a
   `RootPairing` P and its base b; HW3's Lie-theoretic specialization has a
   different carrier and is compared only through an explicit slₙ Cartan bridge.
   H2 builds the type-A Steinberg coefficient-extraction adapter and the rational
   representation Grothendieck ring R(GLₙ) with its character map, using
   CG’s rational category and the generic K₀ supplier in H2.5. There is one GT carrier and one LR carrier throughout.
5. Native `TauCeti.IsConvexPolyhedron` and `IsPiecewiseAffineOn` supply finite
   affine-inequality cells, closedness, convexity, pasting, restriction and
   composition. Use these predicates for the real cells and maps. Consume native
   Gordan/Stiemke/Tucker from `Geometry/Convex/Cone/Alternative.lean` and
   Mathlib `ProperCone.hyperplane_separation'` and finite-dimensional linear
   algebra. H1 builds the **finite rational elimination, exact dual certificate,
   face and lattice adapters** that these declarations alone do not provide.
6. For finite Grassmannians consume the complex rank-k Grassmannian, topology,
   charts and tautological bundle of [TopologicalKTheory T1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f2c908debdefa440e7dfda339a54cb3b74cdc51c/TauCetiRoadmap/TopologicalKTheory/README.md),
   reusing `Submodule ℂ (Fin N → ℂ)` underneath. Pin quotient rank N−k
   and consume T1.5's sole finite-subspace/native-Grassmannian comparison.
   Construct the quotient bundle Q in H6 on that same carrier. Native
   `Module.Grassmannian ℂ (Fin N → ℂ) (N-k)` parametrizes quotient rank N−k;
   consume [ModularCurves 0G](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ba158a94935fcdc3e26804b3ee77ece7fb48d6c1/TauCetiRoadmap/ModularCurves/README.md)
   for the algebraic subspace/quotient and universal-bundle comparisons over Spec ℂ;
   H6 owns their comparison with the topological complex-point bundles.
   The open [Mathlib Grassmannian scheme design #14686](https://github.com/leanprover-community/mathlib4/pull/14686)
   uses quotient rank r and complementary rank c with r+c=N and affine chart
   gluing. Also consume the actual Tau Ceti `Module.Grassmannian.chart`,
   `chartEquiv`, `chartHomEquiv`, chart-locus openness/cover, `glueData`,
   `scheme` and `toSpec` (Tau Ceti `4f1bd4f`, beyond the `a91d3aaf` Lake pin)
   from `RingTheory/Grassmannian/Chart/*` and
   `AlgebraicGeometry/Grassmannian/Basic`: these use the native quotient-rank
   carrier and represent chart families by symmetric-algebra quotients. Compare
   their finite-free charts with the design above; the complex
   manifold/ring targets here do not require a second scheme representability
   development. Adopt the resulting Mathlib design and implement missing adapters
   here without waiting for publication.
7. Consume [LieGroups Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/blob/85f49c01009d5df11d3a6e8935fe7b14ed21c1cd/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md)
   for flags, full-flag Bruhat cells and Borel–Weil, and [ReductiveGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/90b03f934ee3db6fc1a079daa0fd7b2f40fa40d8/TauCetiRoadmap/ReductiveGroups/README.md)
   for rational actions, parabolics and characteristic-zero linear reductivity.
   H6 owns the **finite Grassmannian** cell/closure, geometric class and integral
   ring comparisons beyond those full-flag statements. Consume
   [AlgebraicTopology Stages 2–6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/50af6084a401dffe3db1e50dac46fe4bca36f4fd/TauCetiRoadmap/AlgebraicTopology/README.md) for cellular/
   singular/relative cohomology, cup, Künneth, orientations and duality,
   [CharacteristicClasses C2–C3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/01224fe30cf811f9e6d239b75f4003bb8c0b685a/TauCetiRoadmap/CharacteristicClasses/README.md) for Thom,
   Gysin, Leray–Hirsch and integral Chern classes, and
   [ComplexKahlerGeometry K7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/13b2335ea038b439655df55654e71b19603d8ee1/TauCetiRoadmap/ComplexKahlerGeometry/README.md) for projective
   embeddings and their Kähler structures. H6 supplies each map connecting these
   theories on the common Grassmannian carrier. Consume
   [DifferentialGeometry 10.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/DifferentialGeometry/README.md) for manifold
   Sard. H6.3 constructs the homogeneous parameter-transversality theorem
   needed by the incidence argument; it is not presumed to be a DG10.2 result.
8. Consume Mathlib finite-dimensional `LinearMap.IsSymmetric.eigenvalues`, its
   antitone order, multiplicity and eigenvector-basis APIs, matrix conjugate
   transpose and the unitary group. No infinite-dimensional spectral theorem is
   needed for Horn. Consume [PolarDecomposition PD-A50–A53](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md)
   for finite matrix min–max/monotonicity/Weyl perturbation. [HamiltonianReduction R2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93ad76c0f2a89760726126e98fcdb41cee38fe93/TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md)
   supplies compact coadjoint orbits/KKS; its R1 supplies moment-map products.
   [ConvexityToric T3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93ad76c0f2a89760726126e98fcdb41cee38fe93/TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md) supplies the
   compact chamber/quotient dictionary. H7 owns the projective **invariant-to-
   moment-zero bridge**, plus the Schubert-incidence compression inequality
   proving the real converse and rational-hive approximation. Neither a bare
   moment map nor the word 'GIT' supplies this bridge.
9. Consume [SchubertGeometry S4.1–5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e89539810e9a2821960d01212df5ebf319e0d209/TauCetiRoadmap/SchubertGeometry/README.md)'s single
   generic finite-root-data path/crystal construction. H8 owns its actual
   **type-A** coordinate, tableau/GT, row/column and tensor/hive applications,
   including all the concrete algorithms and examples below. Specialize to
   X=ℤⁿ with α_i=e_i−e_(i+1), its coroot heights and its central determinant
   direction; compare the actual SLₙ restriction lattice as well. Use type
   A_(n−1) only for n≥2; n=0 and the rank1 torus have no simple-root operators.
   SchubertGeometry S9.5 owns the generic-to-concrete comparison maps;
   H8 consumes those SAME maps and owns the concrete tableau/GT, reading-word
   and hive comparisons on its existing carriers, not a second generic engine.
   Its comparisons include the straight dominant path, the row-coordinate
   dominant path of S2p91, Japanese column words and fundamental-column paths.
   Generic S4.1–5 has no tableau, hive, recurrence or Schubert-section premise;
   this application adds no return dependency into that generic construction.
   SchubertGeometry S4.6–7/S5–8's geometric sections, splitting and SMT, and
   S9.1–4's analytic comparisons, are not prerequisites for these path-only maps.
   Quantum-group/crystal-basis and Kac–Moody extensions are not inferred from
   this finite-type specialization.

`Suggested.lean` pins representative carriers and target forms. It is not an
exhaustive checklist; this markdown is definitive.

The construction order is H1, H2.1–4, H3.1–2, H2.5, H4, H5, H6.1–7,
H6.8’s stretching theorem, H7 and H8. The component/
path comparison of H8 precedes H9’s coherence comparison; the elementary
excavation and ring associativity are independent of it. For H8's path lane,
construct generic SchubertGeometry S4.1–5 first and H8's concrete coordinate
and tableau objects, then S9.5's generic-to-concrete maps on those objects,
then the tensor/hive and H9 comparisons. The independent
H1–H7 constructions do not gain a Schubert splitting or SMT premise.

## H1. Lattices, rhombi, boundaries and finite polytope operations

1. Give finite lattice and unit-triangle/edge/rhombus index types, coordinate
   extensionality, all three rotations and reflection. State short/long diagonals
   arithmetically in barycentric coordinates; prove the Euclidean model agrees.
   Build real and integral normalized hives, unnormalized/gauge comparisons,
   pointwise addition and nonnegative scaling, zero/affine hives, restriction to
   lattice subtriangles and the extension/interpolation map. Prove interpolation
   is concave iff all rhombus inequalities hold, by the adjacent-triangle bending
   test and line-segment subdivision. Boundary differences are antitone, cyclic
   trace is zero, and the boundary restriction is an actual linear map before
   restricting to the hive cone. Export rotation/dualization effects with the
   new dual-weight involution on the native carrier, and entry/boundary equality lemmas.
2. Build equality/inequality matrix presentations over ℤ, ℚ and ℝ on the finite
   coordinate spaces. Prove normalized fixed-boundary fibres are closed bounded
   convex polyhedra, hence compact; prove explicit entry bounds by summing
   rhombi along lattice parallelograms. The same estimates uniformly bound fibres
   over a bounded boundary set, giving properness of the boundary projection
   onto its image. Prove normalized zero-boundary fibre={0}. For integral fibres
   export a finite instance, a bounding-box enumeration and decidable membership.
   Prove central-degree conservation, the dominance bound γ≤λ+μ in product
   convention and lower-coordinate bound γₙ≥λₙ+μₙ. These bounds prove **finite
   output support** for fixed λ,μ, independently of the representation theorem.
3. Build reusable finite rational polyhedron adapters: Fourier–Motzkin projection
   with equality elimination, rational feasible witnesses for nonempty rational
   fibres, clearing denominators, finite generation of rational cones including
   lineality, faces/facets relative to their affine span, relative interiors and
   finite supporting-halfspace descriptions. Consume the native alternative and
   separation results; prove the finite matrix Farkas certificate with both
   nonnegative inequality multipliers and unrestricted equality multipliers.
   A valid boundary functional is a nonnegative sum of rhombus slacks **modulo
   normalization and trace equalities**. Prove exactness of projected cones;
   a closed-cone map defined using closure is insufficient by itself.
4. For a rational polyhedron P and a linear projection with compact fibres,
   build the largest-lift selection for a linear objective generic on the finite
   fibre-edge directions. Prove existence/uniqueness, finite polyhedral chamber
   decomposition, continuous piecewise-affine selection, coefficient extraction
   from active systems, homogeneity for cones and compatibility on chamber
   walls. Build the integer-coefficient piece comparison used by H4; a rational
   linear selection alone does not prove saturation. Prove a generic objective
   exists in any nonempty open cone of admissible objectives by avoiding finitely
   many hyperplanes. Export rational perturbations and dense relative interiors.

## H2. Native GT and LR comparisons and the hive ring

1. Define the directional finite-difference map from a hive to native signed
   `GTPattern n`. A convenient equivalent chart is h(i,j), 0≤i≤j≤n:
   h(0,j)=Σ_{r≤j}λ_r, h(j,j)=Σ_{r≤j}γ_r,
   h(i,n)=|λ|+Σ_{r≤i}μ_r, with h(0,0)=0, in product convention.
   Specify and prove its rotation/gauge conversion with H1's cyclic triple.
   The chart map is `(i,j)↦(n−j,j−i,i)` in H1’s coordinates.
   The two appropriate rhombus families are precisely GT interlacing; export
   the **remaining** rhombus-family image condition, top-row and successive
   row-sum weight identities. Partial sums reconstruct the hive from the pattern
   and one boundary, proving injectivity and the exact image equivalence.
   The handout's orientation gives native `topRow` λ (its long row drawn below) and pattern weight μ*−ν; the
   product chart rotates this to an equivalent formula. Prove these agree.
2. Build the explicit hive-to-LR equivalence on the shared `LRTableau λ γ μ`.
   In the product chart write a_{ij} for the number of zero-indexed letter i−1
   in skew row j−1. Its forward map is
   `h(i,j)=Σ_(r≤j)λ_r + Σ_(k≤i)Σ_(k≤r≤j)a_(k,r)`.
   For i<j the inverse takes the mixed difference
   `a_(i,j)=h(i,j)-h(i-1,j)-h(i,j-1)+h(i-1,j-1)`;
   on the diagonal use `a_(i,i)=h(i,i)-h(i-1,i)`.
   Prove LR entries in row j are ≤j, nonnegativity including the diagonal,
   semistandard inequalities, ballot prefix inequalities and their equivalence
   to the three rhombus families. Recover each row by weakly sorting its entries,
   prove both inverses, content, boundary and integrality, including empty
   diagrams/zero strips. For arbitrary signed weights use explicit affine
   determinant shifts making all three product weights polynomial; prove the
   answer is independent of shifts and compatible with the native shape carrier.
   This is a bijection of **objects**, not just equality of cardinalities.
3. Consume SchurWeyl's LR product and ClassicalGroups' character comparison to
   prove the invariant dimension and tensor-multiplicity hive formulas. Prove
   affine determinant-shift covariance, cyclic/dual symmetry, symmetry in the
   two inputs, and coefficient change/stable finite-alphabet compatibility.
   In the stable range `π_i-π_(i+1)≥λ₁-λₙ` in the handout's notation, prove
   the directional GT injection is onto its specified weight fibre; the third
   rhombus family follows from that uniform gap. Build the source’s type-A
   Steinberg alternating formula by dominant-coefficient extraction in the
   Weyl-denominator tensor character using CG/HW, and identify the same
   weight multiplicity through this adapter. State the input/output permutation
   and dual signs, and treat n=1 separately. Prove the quasi-GT/positive-root
   partition limit after setting `x_(k,i)=entry_(k,i)-λ_i` on the long-row
   λ pattern (so x_(n,i)=0): retain
   `x_(k+1,i)≥x_(k,i)` and drop
   `x_(k,i)+λ_i≥x_(k+1,i+1)+λ_(i+1)`.
   The row differences are the nonnegative coefficients of e_i−e_j and
   telescope to `λ−wt`. For a fixed positive-root sum ζ this dropping is
   exact whenever every adjacent λ gap is at least the sum of its nonnegative
   simple-root coordinates: each positive-root coefficient is bounded by this
   height, so the unused inequalities hold automatically. State the finite
   ζ-weight-fibre equivalence with that threshold, not a limit of all fibres
   simultaneously. Consume [RootSystems’ type-A realization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/RootSystems/README.md)
   and CG3’s weight dictionary. Map ζ∈ℤⁿ with sum0 into that root model by
   `ζ=Σ_(k<n) (Σ_(i≤k)ζ_i)(e_k−e_(k+1))`; prove injectivity, positive-root
   indexing `(i,j)↦e_i−e_j` and base/pairing compatibility. For GLₙ with n≥2
   use RootSystems' `A (n−1)` in the sum-zero hyperplane of ℚⁿ: its `A r`
   convention uses ℚ^(r+1). Compare this map with native
   `TauCeti.kostantPartition P b` using this specified RootPairing/Base;
   the n=1 empty-root partition is handled separately.
   The source’s negative weight is the re-centered weight.
4. Prove hive vertical Pieri directly: the exterior boundary (1^k,0^(n−k))
   forces γ−λ to be a 0/1 vector of sum k; the line of kinks determines the
   unique completion. Give its entry formula, eight local rhombus cases,
   dominance criterion, k=0,n and repeated-coordinate degeneracies, and its
   collapsed honeycomb picture under H4. Prove the horizontal Pieri version by
   the LR/transpose comparison, using the existing Schur involution.
   Summed parallelogram inequalities give the unique top hive at γ=λ+μ.
5. Construct the category of finite-dimensional **rational GLₙ** representations
   on the native CG/FDRep carrier, its rational subobjects/quotients, additive
   and tensor closure, and an essentially small model via standard coordinate
   spaces Fin d→ℂ with intertwiner matrices. Consume the generic
   [GrothendieckEulerForms Layers1–2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/GrothendieckEulerForms/README.md),
   native `TauCeti.SplitK0` and its exact-K₀ comparison; build this category's
   Grothendieck **representation ring** R(GLₙ) from that same carrier. Prove
   tensor multiplication well-defined, unit, functoriality, and split=exact
   using CG/RG characteristic-zero complete reducibility. Its basis [Vλ] is a
   target here: finite irreducible isotypic multiplicities give an additive
   equivalence `R(GLₙ)≃ DominantWeight n →₀ ℤ`, and character comparison gives
   an injective map to the symmetric Laurent character ring. This ring is
   distinct from the ambient torus group algebra. Compare its character map
   with HW9 differentiation without treating all glₙ modules as semisimple.
   Build the free ℤ-module hive multiplication on `DominantWeight n →₀ ℤ`,
   with finite support from H1. H3 supplies direct combinatorial associativity;
   H2.2–3 independently supply the LR comparison. Prove unit, bilinearity,
   commutativity, central ℤ-grading, dominance filtration and determinant inverse,
   and identify its basis/generators with the newly constructed R(GLₙ) basis
   and exterior/determinant representations. Prove the Laurent presentation for
   n≥1 (n=0 gives ℤ) using triangular highest weights and a linear extension
   of dominance within each central degree; generator-exponent lexicographic
   order does not supply that triangularity. Export coordinates, generator
   normal forms and finite multiplication algorithms.

## H3. Octahedron recurrence and the excavation bijection

1. Define the size-n tetrahedral lattice and its unit tetrahedral/octahedral
   subdivision, and compare it with HK's space-time lattice
   `L={(x,y,t)∈ℤ³:0≤x,y≤n, x+y+t even}`. Sections are graphs in the
   2-skeleton meeting each vertical line once. The associator region is
   `A={|x−y|≤t≤n−|n−x−y|}`. Its lower section S is t=|x−y| and its
   upper section S′ is t=n−|n−x−y|. In H1 barycentric coordinates,
   embed the first input face by `(x,y,z)↦(n−x,z,y)` and the second by
   `(x,y,z)↦(y,n−x,z)`. Read the µ,ν,τ* output face by
   `(x,y,z)↦(n−z,n−x,n−y)`, subtracting |λ| to normalize its A-corner;
   read the λ,τ,π* face by `(x,y,z)↦(y,z,n−x)` without a constant shift.
   Prove these maps land on S/S′ and give exactly the displayed boundaries.
   In the inverse, add |λ| back to the first output face before gluing. Match the first hive's A,C with the second's A,B; their common
   dominant-weight partial sums agree with both A-values0.
   There are no extra rhombus inequalities across this shared edge.
   For n≥1 define the full bounded modified recurrence of HK(5) on
   `Y=[0,n]²×ℝ`, before restricting it to A. To compute f(x,y,t+1), subtract
   f(x,y,t−1) from the maximum of the two opposite-neighbour sums in the
   interior; on y=0,n use only f(x+1,y,t)+f(x−1,y,t), and on x=0,n use
   only f(x,y+1,t)+f(x,y−1,t). At each of the four corners use the sum of
   its two inward neighbours. Define its time inverse by t↦−t, prove finite
   dependency recursion from a section, and build the integral, real and PL
   state-transition APIs on finite future/past regions. Treat n=0's one-point
   hive maps separately. The interior rule is `e'=max(a+c,b+d)-e`.
   For the associator restriction prove every dependency stays in A and wall points
   already lie on S. Give the equivalent legal unit-cell excavation schedule,
   termination and agreement with time recursion, rather than relying on an
   undefined shelling. Reverse time gives the inverse recurrence; ties are
   included. Prove unchanged four exterior boundaries, integral coefficients,
   homogeneity, continuity and native finite piecewise-affineness from max branches.
2. Build oriented wavefronts and the **transverse hive condition** of HK3.1:
   require the inequality only for rhombi R_α whose short diagonal α lies
   in W∩S, for W transverse to S. Prove it is equivalent on S and S′ by
   the four elementary cutcurve moves: split one edge into two, merge two into
   one, slide an edge along a wall, and cross a cutpoint. Build the local max
   inequalities in both directions and all orientation/boundary cases, including
   the half-/quarter-octahedron rules used by the cutcurve comparison.
   For A use the wavefront family excluding those containing a face of the big
   tetrahedron; prove this family exactly captures the individual hive-face
   rhombi on both S and S′. Do not impose a condition on every arbitrary
   rhombus across an intermediate frontier's glued edges.
   Obtain the explicit integral and real equivalences
   `Σσ Hive(λ,μ,σ*)×Hive(σ,ν,π*) ≃
    Στ Hive(μ,ν,τ*)×Hive(λ,τ,π*)`.
   Both directions preserve hive conditions and the four external product
   boundaries. Intermediate dominant weights vary; H1 proves finite support.
   Extract the associativity sums and H2's hive-ring associativity. This proof
   is independent of LR counting and of H9's later coherence comparison.

## H4. Honeycombs, overlay and saturation

1. Construct the canonical rank-n triangular honeycomb graph dual to the
   unit-triangle lattice: finite vertices, finite edges and 3n labelled rays.
   A configuration locates vertices in `{(u,v,w)∈ℝ³:u+v+w=0}`, with each
   oriented edge in its assigned coordinate direction and nonnegative length.
   Prove the edge-constant-coordinate description is equivalent, finite linear
   constraints, boundary order/trace, and linear coordinate isomorphism with
   normalized hives. Hives' affine gradients give vertex locations; their
   jumps give lengths. Conversely integrate crossed edge constants along the
   dual graph; zero tension gives path independence, normalization and boundary
   partial sums. Prove slack=length with the chosen lattice normalization.
   Export ℤ/ℚ/ℝ compatibility and the native piecewise-affine comparison.
2. Build reduced weighted diagrams, allowing zero-length contractions,
   coincident edges with positive integer multiplicities and transverse crossings.
   Equality is equality of the embedded weighted diagram after subdividing at
   vertices/crossings; it is not equality of arbitrary graph presentations.
   Prove finite support, six-direction zero tension, convex complementary
   regions and reconstruction of the unique canonical rank-n configuration.
   Classify degeneracy regions and local vertex types, reconstruct the dual
   graph from directions/multiplicities and prove subdivision/contraction
   invariance. Show the three n-ray families determine rank; a finite balanced
   component without rays is impossible. Treat repeated boundary values and
   multiple coincident rays without a strict-dominance assumption.
3. Define diagram overlay by adding multiplicities and compare it with the
   rank-(n+m) configuration reconstructed in item2. Boundaries are **sorted
   multiset unions**, not coordinatewise sums. On hives prove its tropical
   convolution formula
   `(h⊞k)(a)=max_{b∈Δₙ,c∈Δₘ,b+c=a}(h(b)+k(c))`.
   Prove decomposition sets are nonempty and finite, rhombus preservation,
   gauge/normalization, ℤ-compatibility, associativity and commutativity and
   rank0 identity. Prove the formula by the integrated diagram/affine-envelope
   comparison, not by assuming an arbitrary pointwise maximum preserves
   concavity. Distinguish this operation from pointwise addition of same-rank
   hives. Prove the max-plus convolution distributivity on ambient finite
   functions and identify the domain on which hive closure holds.
4. Derive the **type-A PRV theorem**: for dominant integral λ,μ and permutations
   w,v, if γ=wλ+vμ is dominant, then Vγ occurs in Vλ⊗Vμ. Overlay rank1
   honeycombs with triples `(λ_i,μ_j,-λ_i-μ_j)` according to the chosen
   permutations; the three sorted boundary multisets are λ,μ,γ*. Prove
   integrality and invoke H2's actual tensor comparison. Include the extremal
   Cartan summand and determinant cases. No general semisimple PRV theorem is
   inferred from this type-A construction.
5. Build fixed-boundary honeycomb deformation theory: hexagon breathing,
   virtual configurations, elision of simple crossings, loop deformations and
   local molting at six-valent vertices, rakes and five-valent vertices.
   Choose a generic superharmonic weighted-perimeter objective: exterior-region
   weights0, each interior hexagon weight greater than the mean of its six
   neighbours. Construct such weights by the finite Dirichlet/discrete-Laplacian
   solution (positive inverse/maximum principle), then avoid H1's finitely many
   forbidden hyperplanes. Prove every allowed inflation increases the objective.
   For regular boundary prove its largest lift has only simple degeneracies and,
   after elision, an acyclic graph. Exclude high multiplicity via the windward
   maximal-multiplicity path and compatible local molting, prove monotone
   progress/termination, and exclude cycles by the nonzero fibre deformation.
6. On each regular largest-lift chamber, remove forest leaves recursively:
   two known ray coordinates determine the third by `c=-a-b`. Prove termination,
   integral coefficient formulas for every vertex/edge and reconstruction.
   Each full-dimensional chamber of H1’s largest-lift linearity subdivision
   has dense regular feasible points. Finitely many forest integral matrices
   describe their lifts; a finite union of proper linear subspaces cannot cover
   a relatively open chamber, so that chamber’s linear map equals one of these
   matrices. Every boundary point belongs to a full-dimensional chamber closure.
   Continuity extends its integral formula to all walls, including repeated coordinates. Prove regular feasible
   boundaries are dense by an explicit strict honeycomb perturbation; use a
   chamber incident to a wall, not rounding an arbitrary hive's labels.
   Thus every nonempty real fibre with integral boundary has an integral point.
   Rational witnesses/clearing denominators plus H2 give
   `c^(Nγ)_(Nλ,Nμ)>0 ↔ c^γ_(λ,μ)>0` for N≥1.
   Export the invariant-triple form, decidable positivity and an integral-witness
   algorithm. Include KT1 figure18's nonintegral extreme point to distinguish
   saturation from total unimodularity of all active hive systems.

## H5. Puzzles, boundary certificates and facets

1. Define finite puzzles of side N as exact tilings by unit 000-triangles,
   unit 111-triangles and rhombi whose outer edge clockwise after an obtuse
   corner is1 and clockwise after an acute corner is0. Allow rotations, prohibit
   independent reflections; reflecting and swapping0/1 is a duality.
   Build edge/triangle occupancy, matching labels, boundary words, extensionality,
   finite enumeration, rotation/duality, gluing and connected monochromatic
   regions. Force balance proves each boundary has the same number k of1s.
   Deflate/expand regions with nonnegative real lengths, retaining edge-direction
   data; prove collapse/subdivision independence and zero tension.
   Prove counts k² one-triangles, (N−k)² zero-triangles and k(N−k) rhombi,
   with both orientations' binomial counts.
2. A puzzle places disjoint rhombi in the hive lattice. Prove the sum of their
   slacks telescopes to the sum of selected cyclic **0-edge** boundary entries,
   a nonnegative boundary functional. Using trace0 equivalently the sum of
   selected **1-edge** entries is ≤0. Give both formulas and their coordinate
   signs, normalization independence and rotation. Conversely for a nonempty
   collection of interior-disjoint rhombi with coefficient1 whose total functional
   is supported on the outer boundary, prove the source homework: connectedness,
   constant0/1 labels on complementary regions and convexity of same-type
   regions, by the five forbidden local configurations. Handle empty collections
   separately and prove the boundary equal-k condition by force balance.
3. Show the boundary cone has dimension3N−1 for N≥1 inside trace0 and give
   explicit nondegenerate configurations/trading perturbations. For each regular
   facet, take H4's generic forest lift; it splits into two connected components
   after elision. Here a clockwise overlay consists of two honeycombs of
   ranks r and N−r, with 0<r<N, whose intersections are isolated points in
   the interior of an edge of each factor, with the first factor turning
   clockwise to the second at every crossing. Trading through crossings
   forces this consistent clockwise overlay. Reconstruct its puzzle and prove the supporting hyperplane really
   is a facet by a3N−2-dimensional perturbation family. Conversely every
   clockwise overlay supplies that facet. With chamber inequalities this proves
   real hive feasibility iff **all** puzzle boundary functionals are nonnegative.
   Export the exact finite certificate list and a witness/certificate alternative.
   One inequality alone is only necessary. Include rank1 and rank2 explicitly;
   chamber inequalities are essential for N>2 but redundant for N=2.
4. Build gentle paths/loops in puzzles, arrows and turn restrictions. Prove
   loop-free puzzles admit clockwise-overlay witnesses by rake propagation;
   these puzzles are uniquely determined by boundary words. If a gentle loop
   exists, choose a minimal one, prove the radius1 neighbourhood's allowed
   intersections, and perform the reversible breathing move giving a distinct
   puzzle with the same boundary. Hence rigid iff loop-free. Prove regular
   facets correspond bijectively to rigid nonconstant puzzles, while a nonrigid
   puzzle's face meets only chamber walls. Export irredundancy **relative to
   the dominant trace-zero chamber** and account for trivial all0/all1 words.
   Export rigidity under one-region inflation and its dual operation; H6.8
   uses the exact honeycomb-scaling comparison for multiplicity-one stretching.

## H6. Grassmannian cohomology and the puzzle rule

1. On the supplied rank-k subspace Grassmannian Grₖ(ℂᴺ), N=k+q, construct
   the supplied graph charts and complex-point identifications, transporting
   along 0G's algebraic subspace/quotient comparison over Spec ℂ to the
   quotient-rank-q Mathlib carrier. Consume Tau Ceti `chartEquiv`/`chartHomEquiv`
   at `4f1bd4f`, beyond the `a91d3aaf` Lake pin; prove homogeneous models U(N)/(U(k)×U(q)) and GL(N)/Pₖ,
   connectedness, compactness, complex dimension kq, Plücker smooth/holomorphic
   embedding and its induced Kähler form. Identify the supplied tautological
   bundle S and quotient Q, exact sequence0→S→ℂᴺ→Q→0, bundle ranks,
   flag forgetful maps and associated-bundle actions. Compare the algebraic
   chart shape with the native `Module.Grassmannian.scheme` gluing and #14686; scheme gluing is not a prerequisite for singular
   cohomology. Include k=0,q=0 and orthogonal-complement/dual homeomorphisms.
2. A binary word w of length N with k ones gives their positions p₁<⋯<pₖ.
   Set `λ_i=q+i-p_i` with one-indexed i, the number of zeroes after its ith1.
   This is the partition inside k×q; prove inverse, inversion count |λ| and
   reversal w↦reverse(w) gives rectangle dual `λ∨_i=q-λ_(k+1-i)`.
   Use the standard increasing coordinate flag F. Define cells by exact
   `dim(V∩F_j)=#ones(w[1..j])`, and Schubert varieties by ≥.
   Prove row-echelon chart cells `ℂ^(kq−|λ|)`, closure and word partial order,
   with `C_µ⊆X_λ ↔ λ⊆µ` (equivalently `p_µ,i≤p_λ,i`), boundary union, and
   the partial-flag projection comparison with LG8's Bruhat cells. Consume the
   single finite CW characteristic-map and rank-one partial-flag incidence
   construction on this same complex subspace carrier from TopK T1.5; do not
   reconstruct it or assume a generic Bott–Samelson resolution. With `a=k` and
   `N=k+q`, identify the row-word pivots with the partition by
   `λ_i=q+i-p_i`, prove the inverse and inversion-count formula `|λ|`, and
   prove reversal `w↦reverse(w)` gives `λ∨_i=q−λ_(k+1−i)`. Compare the
   transferred characteristic maps' open-cell orientation with the complex
   orientation of the row-echelon charts. Use the resulting CW structure and
   these cell/partition comparisons to construct the integral cellular basis
   and compare it with the Schubert cohomology basis in item 3; export free
   integral even homology and cohomology through AT, without passing through
   real coefficients.
3. Define σλ as the integral cohomology class dual to the Schubert cycle of
   complex codimension|λ|, degree2|λ|. Construct the cycle via the complex
   orientation on its top cell and prove the boundary cancellation/extension
   in its closure; identify its pushforward in ambient homology and Poincaré
   dual. Singular Schubert varieties are not falsely declared smooth.
   Opposite-flag intersection gives `∫σλσμ=δ_(μ,λ∨)` and the top point class
   pairs+1. Prove σ∅=1, positivity of transverse complex local multiplicities
   and actual generic-flag incidence counting. Own the homogeneous parameter
   theorem: for a transitive smooth action, G×Y→X is a submersion; inverse
   image of Z is a manifold and Sard applied to its projection to G gives
   dense/full-measure regular parameters, with a residual form using countable
   compact exhaustions and Baire. Export transversality and product-action
   variants. Openness needs a proper/compact incidence hypothesis; it is not
   asserted for arbitrary noncompact strata. Apply this to each finite
   Schubert-cell stratum. When total codimension is kq, lower-stratum
   intersections have negative expected dimension and are empty generically.
   Compactness of the closed Schubert incidence space and openness of
   transversality near the finitely many remaining top-stratum points then
   give a **dense open** good-flag locus, stable under small parameter changes. When total codimension
   is kq and flags are in that locus, the intersection is finite in the smooth
   top strata and its cardinality is the cup evaluation. Degenerate flags may
   give nontransverse/infinite intersections; no unqualified four-lines claim.
4. Prove the geometric Pieri and Giambelli identities. Special row classes are
   c_r(Q), column classes c_r(S*) under CC's c₁(O(1))=+h convention.
   Use the flag incidence resolution and iterated projective-bundle Gysin,
   prove its top-stratum degree1, pushforward and tautological exact sequences,
   and compute the determinantal formula in special classes. This is the
   **Grassmannian-specific incidence resolution**, not generic Bott–Samelson
   or Schubert rational-singularity theory. Build the needed flag/Grassmann
   fibre integrations using CC C2 and LH/Chern relations, including integral
   pushforward normalization. Prove the ring presentation
   `H*(Grₖ(ℂᴺ);ℤ)≅ℤ[e₁,…,eₖ]/(h_(q+1),…,h_(q+k))`, where e_i=c_i(S*)
   and h_r are complete functions in its Chern roots (h₀=1, h_r=0 for r<0).
   Prove generation, straightening/reduction and independence by the geometric
   Schubert basis, not by presuming the LR ring statement being established.
5. Build the surjective graded map from supplied Λℤ to this ring, sending
   sλ to σλ inside the rectangle and to0 otherwise. Prove the kernel is the
   span/ideal of outside-rectangle Schur functions, specialization compatibility,
   multiplication and LR coefficients. Degrees double under this map.
   Identify σλ with the determinant of c_(λ_i−i+j)(Q), retaining vanishing
   terms and the k=0 case. Thus the Grassmannian multiplication constants are
   the supplied LR constants restricted to rectangle outputs.
6. Define the puzzle-to-integral-honeycomb equivalence **with fixed boundary
   words**, following KTW§5. Set partitions λ,μ,γ from their1-positions.
   Rotate the puzzle30°, attach infinite rhombus strips at boundary1-edges,
   deflate one-regions, and recover zero-tension vertices with multiplicities
   equal to strip thickness. Boundary coordinates are λ,μ,γ* at rank k.
   Prove all vertices lie in the coordinate triangle of side q, then inflate
   each edge into its prescribed rhombus thickness and each vertex into a
   polygon of one-triangles. Prove tiling, absence of gaps/overlap, matching
   labels, coordinate bounds, both inverses and dependence on origin/rotation.
   The inequalities0≤λ_i,μ_i≤q do not alone prescribe the three boundary words;
   the full boundary partition data is required. Include k=0 and repeated
   coordinates. Combined with H2 gives the puzzle-count cup-product theorem.
   With all three sides read cyclically, it counts the triple integral; for a
   product coefficient read the south word in reverse cyclic direction.
7. Build the free integral binary-word module and puzzle multiplication, its
   unit word0^q1^k, grading, commutative associative ring and isomorphism to
   the actual cohomology ring. Associativity follows through the ring
   isomorphism in item5–6. Export rotation/triple duality and
   complement/transpose symmetry between Grₖ and Gr_q in the dual space.
   Implement finite puzzle enumeration and compare cardinalities with the
   existing LR/hive algorithms. This is ordinary cohomology: no equivariant
   puzzle weights, quantum corrections or K-theoretic pieces are inferred.

8. Prove the multiplicity-one stretching theorem after item6: reduce arbitrary
   signed weights by determinant shifts, choose a rectangle containing the
   resulting partitions, and use the puzzle-count theorem. Define dual inflation
   by complement/reflection, one-region inflation, complement/reflection back;
   at dilation d it changes side N=k+q to k+dq, stretches the partition
   coordinates by d and leaves k fixed. Prove it corresponds exactly to scaling
   the rank-k honeycomb by d. Gentle-loop rigidity is preserved in both directions,
   so a unique original puzzle gives a unique dilated puzzle and
   `c^γ_(λ,μ)=1 ⇒ c^(dγ)_(dλ,dμ)=1` for d≥1.

## H7. Hermitian spectra, the weighted-flag bridge and Horn recursion

1. Define the spectrum of a Hermitian N×N complex matrix using the native
   symmetric linear operator on the **Euclidean inner-product** coordinate space.
   Consume native `Matrix.IsHermitian.eigenvalues₀` (sorted),
   `isSymmetric_toEuclideanLin_iff`, `eigenvalues₀_antitone`, `charpoly_eq`,
   trace/eigenvalue and roots APIs; reindex Fin(card(Fin N)) to Fin N.
   Prove the sorted-spectrum equality iff the characteristic polynomial is the
   product of the corresponding linear factors, retaining multiplicities.
   Consume the PiLp/matrix conversion and trace=sum and determinant=product, unitary conjugacy classification,
   diagonal realization, direct sums as sorted multiset union, negation as
   reverse-negation and scalar shifts. Consume PolarDecomposition PD-A50–A53
   for finite min–max and Weyl; build the matrix/Euclidean operator adapter and
   deduce ordered eigenvalue continuity and perturbation/Lipschitz bounds,
   closedness and bounded representatives for feasible triples. A zero-sum
   triple A+B+C=0 has trace-zero spectral triple. The sum-of-two convention
   uses (α,β,−reverse(γ)). Export n=0 and n=1 normalizations separately.
2. For an integral dominant λ form the compact flag orbit of the highest-weight
   line in the native Vλ, inside P(Vλ), with its Hermitian invariant norm.
   Construct the repeated-eigenvalue partial-flag carrier as the closed
   incidence subset of the supplied finite Grassmannians for its block-end
   dimensions. Build its charts, block-parabolic stabilizer, compact unitary
   homogeneous model and full-flag projection, and identify it with this
   highest-line orbit. Prove the smooth/complex projection and orbit embeddings;
   these partial-flag comparisons are H7 targets, beyond LG8’s full flags. Compute the projective norm-square moment map
   `⟨μ([z]),H⟩=Re⟨z,dρ(H)z⟩/⟨z,z⟩` for Hermitian H; its orbit has spectrum λ.
   With CKG’s FS class normalized to integral1 and R1’s `ι_ξω=dμ_ξ`,
   identify H with the Lie generator **−2πiH** (its action is exp(−2πitH)).
   The corresponding u(N)-dual functional pairs ξ by the Hermitian matrix
   `(i/(2π))ξ`. Prove this scaling/sign dictionary and KKS equality; no
   unnormalized expectation is called the moment map for generator iH.
   Prove the central character supplies the scalar part even though it acts
   trivially on projective points. Compare its KKS/Fubini–Study normalization
   with HamiltonianReduction R2 and CKG K7. Construct the finite Segre map
   on the native projectivizations of the three representation spaces, prove
   well-definedness, equivariance, injective closed holomorphic embedding and
   its local inverse in nonzero-coordinate charts. Identify its O(−1) pullback
   with the tensor of the three tautological lines and its normalized FS
   pullback with the sum of factor forms by the log-product norm formula.
   Prove its tensor moment map is the sum of the three factor maps. The line is in Vλ and sections of O(1) are dual;
   invariant nonvanishing is unchanged by dualizing all factors. Export the
   actual highest-line/Cartan-product coordinate comparison for every positive
   power, including determinant shifts and linearisations. The projective
   highest line has fibre character+λ for the upper-triangular stabilizer;
   its O(1) dual has fibre character−λ and coordinate module Vλ*. Build the
   Borel–Weil comparison directly from LG8 with the same positive-root Borel,
   associated character −λ and H⁰ module L(λ)*, retaining this explicitly
   computed character. The polynomial-coordinate bridge below is
   proved from CG’s highest-weight cyclic span and does not assume all
   holomorphic sections are ambient polynomial restrictions.
3. Build the invariant-to-moment-zero direction of projective Kempf–Ness
   for these flag products. Define its polynomial coordinate space in degree d
   as the dual of the cyclic span of `(vλ⊗vμ⊗vν)^d` in Sym^d(Vλ⊗Vμ⊗Vν)
   under GL(N)³. Construct that span and identify it with
   `V_(dλ)⊗V_(dμ)⊗V_(dν)` by the Cartan highest-line maps and CG’s
   classification, including their product-group/external-tensor comparison.
   This is **dilation of weights**, not the ordinary tensor power. Prove the
   equivariant restriction from ambient homogeneous polynomials is surjective
   onto its dual, with kernel exactly the homogeneous polynomials vanishing
   on the orbit. Build degree0, graded multiplication and the Cartan-product
   compatibility on these actual coordinate spaces. Construct the finite-
   dimensional invariant lift through this surjection using CG/RG's semisimplicity
   and its comodule-to-rational-representation comparison; the Reynolds splitting
   and its homogeneous-degree preservation are explicit adapters here.
   For d≥1, a nonzero invariant section has nonzero value at some point;
   its positive-degree invariant homogeneous polynomial lift P gives a
   positive lower norm bound on that point's GL(N) orbit, using
   |P(v)|≤C‖v‖^d for some C>0. The degree0 coordinate space is retained in
   the graded algebra; its constants supply no such norm bound. The Euclidean orbit closure has a nonzero norm minimum
   by bounded minimizing sequences and finite-dimensional compactness.
   Prove closure is GL(N)-stable, the Segre/flag cone is closed, and the minimum
   represents a point of the same compact flag product. Polar decomposition
   and differentiation along all Hermitian directions show its moment map is0.
   Build log-norm convexity, criticality/minimal-norm equivalence, unitary
   covariance and central-character normalizations on these orbits. The minimum
   can be in the closure rather than the original orbit. These arguments prove
   nonzero invariant on a weight dilation ⇒ zero-sum Hermitian realization.
4. Prove the converse for arbitrary **real** spectra using H6's actual
   Grassmannian intersections. For a puzzle with k selected1-positions I,J,K,
   H6's triple product is nonzero. For any three eigenflags, approximate them
   by H6's dense generic transverse flag triples; their intersections are
   nonempty. Compactness of Grₖ and closed incidence conditions give a common
   subspace V for the original eigenflags, also with repeated eigenvalues.
   Own the required compression inequality: if A has antitone spectrum α and
   `dim(V∩F_j)≥#(I∩{1,…,j})` for its top-eigenvector flag, then
   `tr(P_V A|_V)≥Σ_(i∈I)α_i`. Prove the finite projection-trace identities,
   positivity and `tr(P_V P_(F_j)|_V)≥dim(V∩F_j)` by an orthonormal basis
   starting in the intersection. Expand A as α_N identity plus its nonnegative
   spectral gaps times the top-eigenflag projections. Summing the three
   compression inequalities for A+B+C=0 gives the selected1 sum≤0, hence
   every H5 puzzle inequality and a real hive.
   Conversely approximate a real hive by rational points of the **entire
   normalized rational hive cone**, including points on faces, using H1's
   rational generators/lineality. Their boundary spectra stay feasible because
   they are actual hives. Clear denominators, apply H2's integral invariant
   formula and item3, then rescale the Hermitian matrices. Native unitary
   diagonalization chooses uniformly bounded representatives; compactness and
   eigenvalue continuity pass to the limiting real spectra. Conclude real hive
   feasibility iff a zero-sum Hermitian triple exists. At integral boundary,
   H4 supplies the undilated invariant and saturation. Export this specialized
   flag/invariant/spectral equivalence, rather than assume Hilbert–Mumford,
   real-weight destabilizing filtrations or singular symplectic-volume formulas.
   Prove coordinatewise-addition closure through hives; matrix direct sum only
   gives sorted union in larger rank.
5. State and prove the Horn system in two-input convention. For N≥1 and
   1≤r<N let U_r^N consist of r-subsets I,J,K of {1,…,N} satisfying
   `ΣI+ΣJ=ΣK+r(r+1)/2`. Define T_1^N=U_1^N; for r>1 retain exactly those
   triples in U_r^N such that for every p<r and (F,G,H)∈T_p^r,
   `Σ_(f∈F)i_f+Σ_(g∈G)j_g ≤ Σ_(h∈H)k_h+p(p+1)/2`,
   where I,J,K are listed increasingly. Prove termination and the dictionary
   with H6 rectangle partitions (positions/reflections in the output are
   explicit). The recursive condition is equivalent to the smaller-rank
   LR-positive/puzzle-feasible triple by H4–H6: for I={i₁<⋯<i_r}, use
   `λ(I)_a=i_(r+1-a)-(r+1-a)`, equivalently H6’s word with ones at
   `N+1-i_j`. Use the same formula for J,K, with the third invariant weight
   dualized. Prove the position/reversal dictionary rather than dropping it; establish it inductively in r.
   Then A+B has spectrum γ with input spectra α,β iff total traces add and
   `Σ_(k∈K)γ_k ≤ Σ_(i∈I)α_i+Σ_(j∈J)β_j` for every T_r^N.
   Derive it from H5 and item4, with the selected0/1/complement sign conversion.
   Include the Weyl rank1 inequalities, lower inequalities by complement,
   all repeated eigenvalues and n=2. Export the irredundant rigid-puzzle form,
   decidable rational/integral feasibility and witness conversion to hives;
   the matrix witness is an existence theorem unless a numerical construction
   with proved error control is additionally supplied.

## H8. Type-A paths, crystals and object comparisons

1. Specialize SchubertGeometry S4.1's path-crystal category and basic API
   to finite normal type-A objects with weights in ℤⁿ,
   partial raising/lowering `Fin(n−1) → B → Option B`, string lengths ε,φ,
   inverse/weight/string identities, strict morphisms and connected components.
   Construct the actual coordinate/reindexing and strict-isomorphism maps on
   these objects; do not define a second generic category or infer a
   classification of arbitrary edge-labelled graphs from rank-one identities.
   Build tensor product on the ordinary product of sets with a **fixed**
   convention: use HK§5’s tensor convention, where e_i acts
   on a in a⊗b iff ε_i(a)>φ_i(b), while f_i acts on a iff ε_i(a)≥φ_i(b);
   otherwise it acts on b. An undefined chosen action returns none. Provide
   the reversal equivalence with the
   left-highest/λ-translated-path convention. Prove rebracketing, unit and
   connected-component transport. These are actual finite maps, not Prop fields
   naming an unconstructed classification.
2. Equip native `BoundedSSYT n λ` and the supplied skew tableau carrier with
   signature operators. Own coplacticity (slides commute with these operators),
   the semistandard Schützenberger involution ξ_λ:B_λ→B_λ with weight
   **reversal** w₀wt, e_i↔f_(n−i) in one-indexed notation, and involutivity.
   Pin the Bender–Knuth composition `s₁(s₂s₁)⋯(s_(n−1)⋯s₁)` and prove
   its equality with evacuation/rectification. This is distinct from the dual
   representation weight −w₀wt; signed determinant shifts add the same constant
   on both sides. Build its straight/skew comparisons; SchurWeyl’s standard-tableau evacuation is a supplier comparison,
   not the definition of the semistandard operation. Prove preservation, string-length formulas, endpoint
   content/weight identities, highest tableau, connectivity and that raising
   terminates. Transport to native GT patterns through `gtPatternEquivSSYT`.
   Consume native `SemistandardYoungTableau.benderKnuth`,
   `benderKnuth_involutive` and `content_benderKnuth`. Transport to GT patterns
   through `gtPatternEquivSSYT` and prove the adjacent-row min/max formula and weight swap
   from S1pp177–178, with endpoint bounds taken from the neighbouring row
   instead of ±∞ in ℤ. Compare with the existing Schur-symmetry involution;
   it is not falsely identified with a Weyl-group action satisfying braid.
   Include determinant-shift crystals by the native normalized polynomial part,
   adding the constant weight without introducing infinite tableaux.
   Use the Japanese-signature tableau operators transported through H8.1's
   factor-reversal equivalence. As an explicit GL₃ shape-(2,1) computation,
   display entries with labels
   1,2,3 (native tableau entries are 0,1,2). Write abc for the tableau whose
   top row is a,b and whose second row consists of c. Its eight vertices are
   112,122,132,113,123,133,223,233. Prove that the complete lowering edges are
   f₁:112→122, 113→123→223, 133→233 and
   f₂:112→113, 122→132→133, 223→233; every unlisted lowering action is undefined
   and raising reverses these edges. Compute each content weight and identify
   the SL₃ adjoint crystal after subtracting (1,1,1): six root weights and the
   two distinct zero-weight vertices 123 and 132. Verify the two zero vertices'
   different string data; a weight-set diagram alone does not specify this crystal.
3. Specialize SchubertGeometry S4.1–5 to the type-A coordinate paths below.
   The existing `RationalPath n` is a finite-presentation carrier. Construct
   its coordinate evaluation and normalization. Consume S9.5's mutually
   inverse maps between its reparametrization quotient and the generic
   specialized path carrier, with these actual coordinate formulas; do
   not assert a bijection between unquotiented presentations and paths.
   Compare rational reparametrization equivalence with the generic convention
   by a common rational normalization. In coordinates these are rational
   piecewise-linear paths [0,1]→ℝⁿ starting0, with finite
   rational breakpoints and rational vertex positions, with integral endpoints, modulo nondecreasing continuous
   surjective rational PL reparametrizations (take their equivalence closure).
   Remove stationary segments and normalize by cumulative rational L¹ lengths
   of nonzero linear segments; constant0 has its separate representative.
   H_i=π_i−π_(i+1) is the coroot height. Transport the generic
   running-extremum operators and prove equality with the actual type-A
   coordinate formulas, including the multiple reflection/excursion
   decomposition of Littelmann's §1: e_i is undefined if min H_i>−1 and f_i is undefined
   if H_i(1)−min H_i<1. Reflect only the record-decreasing pieces for e_i and
   record-increasing pieces for f_i, leave intervening equal-height excursions
   unchanged, and translate the final tail by +α_i/−α_i. Specify the first/last
   record-height cut times and prove subdivision independence, endpoint change,
   inverse, rationality and reparametrization invariance. For the operator-stable
   components constructed in item4 prove all coroot global minima are integers.
   For LS and column-word components additionally prove **local** minimum
   integrality; on those components the operators simplify to reflection of the entire first-minimum
   interval from m+1 to m for e_i, respectively the last-minimum interval from m
   to m+1 for f_i. Prove the simplification and ε_i=−m, φ_i=H_i(1)−m there.
   Ambient integer endpoints or integer minima of one path alone are not an
   assumption that every subsequent root-operator image stays integral. Build
   concatenation and reversal with their operator/string/tie-case identities.
   These proofs compare the actual operators and normalized representatives,
   not merely character counts. On column-word components give the concrete
   local-minimum integrality proof by their integral word/prefix heights;
   global-minimum integrality on an arbitrary dominant-path component is not
   silently strengthened to that local statement.
4. For each dominant λ build the finite path crystal generated from its straight
   path by these operators and the equivalent crystal generated from the
   dominant concatenation of its fundamental-column paths plus determinant
   path. A fundamental-column path is the straight tω_k; read columns right
   to left. The letter-path comparison uses Japanese reading, each column top
   to bottom with letters0,…,n−1 sent to coordinate paths e₁,…,eₙ. Prove
   the comparison between each straight column component and its letter-path
   component, then concatenate; this is distinct from the Knuth row word.
   Prove a finite sequence/chain encoding: decreasing permutations modulo
   the weight stabilizer, rational breakpoints satisfying the integral-chain
   conditions: each break a admits a saturated decreasing chain of orbit
   weights ξ₀>⋯>ξ_s in **Bruhat order on W/W_λ**, with endpoints
   ξ₀=τ_iλ, ξ_s=τ_(i+1)λ (the corresponding dominance direction is reversed),
   and ξ_j=s_β ξ_(j−1), β=e_p−e_q (p<q),
   pairing⟨ξ_(j−1),β∨⟩<0 and `a⟨ξ_(j−1),β∨⟩∈ℤ` at every step.
   Prove root reflection/chain closure under operators, including repeated weights.
   Specialize the type-A adjacent-transposition/Bruhat conditions, consuming
   native Coxeter and [RootSystems Layer3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/RepresentationTheory/RootSystems/README.md) order/exchange, and prove equivalence with the
   generated paths. This supplies the straight-path finiteness and the precise
   LS-type encoding used here, rather than assuming all rational PL paths form
   a finite highest-weight component. Prove the column-reading map from native
   tableaux to the column-path component, its inverse by successive strip shapes,
   and the highest-weight component equivalence with the straight-path model.
   Prove operator, weight and cardinality compatibility. For an integral
   central character χ=(c,…,c), pointwise π(t)+tχ is a formula on
   parametrized representatives, not an operation on the ambient quotient
   by arbitrary PL reparametrizations. On B(λ) use its unique λ-LS
   parametrization with slopes in Wλ and send those slopes to W(λ+χ);
   handle constant/central shapes separately. Prove the resulting
   B(λ)→B(λ+χ) preserves the operators and shifts weight by χ: it is a
   strict crystal isomorphism AFTER twisting the source weight by χ,
   equivalently from B(λ) tensor the one-point central crystal T_χ.
   Its coroot heights, cut times and string lengths are unchanged. For the
   chosen column/row models transport this map through their straight-path
   comparisons and compare it with the explicit determinant-prefix models;
   do not infer representative independence from centrality alone.
   Also construct the row-reading
   comparison with rows taken from top to bottom and entries within each row
   from right to left. Prove this reading gives the same tableau crystal under
   H8.1's tensor convention as the Japanese column reading. Explicitly realize a
   read word w₁…w_N as w_N⊗…⊗w₁ under that HK convention, via H8.1's
   factor-reversal equivalence, and prove the corresponding reversed-word
   insertion/coplacticity comparison. The two readings can give
   distinct literal paths: compare their crystal operators, endpoints and component
   isomorphisms rather than equating paths. The source's unspecified order of rows
   is retained as a fidelity uncertainty, not used to infer a different convention.
   For the notebook’s row-coordinate
   highest path, turn on polynomial-part coordinates successively, row1 through
   rown; precede this by the central determinant path for signed weights.
   Prove the path remains dominant and compare its component with the straight
   and column models by the same endpoint theorem. Specialize SchubertGeometry S4.4's generic dominant-path
   deformation theorem to type A: any rational PL path staying in the closed
   chamber with integral endpoint λ generates a component strictly isomorphic
   to these models, carrying its distinguished highest path to the highest
   tableau. Prove uniform positive-integer stretching, subdivision and operator
   compatibility. Prove a uniform root-operator distance estimate for a word
   of length L (the finite type-A version of Littelmann3.1), and construct
   linked paths at level L using subdivisions finer than its exponential bound.
   Build gluing pairs of truncated LS paths, their a-chains and operator-stable
   integrality as in Littelmann5.5–5.7. For two segments with dominant first
   endpoint and dominant total endpoint, interpolate the split, prove linkedness
   at every L and uniqueness of the highest endpoint, then obtain equality of
   operator-word fibres (6.1–6.3). Induct on segments and use positive-integer
   stretching (2.4–2.5) to clear rational vertices, giving7.1. These distance,
   level-L linking, truncation/gluing, interpolation and stretching statements
   are the full type-A specializations of the generic supplier, with actual
   coordinate/subdivision/operator compatibility checked here. They do not
   reconstruct a second generic proof engine from the tableau application.
   Prove
   operator-stable integrality and finiteness, rather than assuming them from
   integer endpoints. Rank1/n=0 require no operators.
5. Specialize SchubertGeometry S4.4's generic path tensor rule: concatenation
   decomposes into highest-weight components with unique dominant path and
   endpoints the corresponding dominant weights. The multiplicity of Vγ in
   Vλ⊗Vμ is the number of paths in the μ-component with endpoint γ−λ for
   which λ+π(t) is dominant for all t. Prove equality through the maps of
   items3–4 with the independent tableau tensor/rectification component
   theorem, preserving ε/φ convention and endpoint weights, and consume
   H2's LR-to-representation comparison. This specialization and concrete
   comparison do not become premises of the generic tensor theorem.
 In type A the translated chamber condition
   maps explicitly to HK’s η⊗b_λ under factor reversal; the concatenation
   π_λ*η convention is Kashiwara’s, opposite HK’s. Its dominant-path condition
   is precisely the missing third hive rhombus family after the directional
   GT map. Export the actual finite equivalences from these path witnesses to
   native GT image fibres, LR tableaux and hives, including all inverse maps.
   After this component/tensor proof, H9 builds the HK recurrence/slide
   correspondence. Export its corollary identifying **which** multiplicity object
   corresponds under rebracketing and the commutor. The component/tensor proof
   itself does not assume that recurrence comparison or coherence theorem.

## H9. Bounded recurrence, commutor and coherence

After H8’s tableau/component theorem, consume H3’s full bounded recurrence
on `Y=[0,n]²×ℝ`, its parity lattice and all interior/wall/corner variants,
with its inverse-time, wavefront and integral/PL APIs.
The commutor region is the quarter-octahedron
`{x+y≤t≤2n−x−y}`. Translate HK’s triangle coordinates by
`(X,Y,Z)=(y,z,x)` before using its formulas. Thus in H1 coordinates embed
input Δₙ by `(x,y,z)↦(x,y,n−z)` and read output by
`(x,y,z)↦(y,z,n+x)`, subtracting f(0,0,2n) to normalize its A-corner.
Prove the raw map changes (λ,µ,π*) to (µ,λ,π*) with these exact directions.
At n=1 its new top label is −µ and the normalized boundary is (µ,λ,−λ−µ). Prove its boundary
interchange and preservation of all hive-face rhombi by the transverse family.

Prove recurrence slices equal the successive supplied jeu-de-taquin slides and
recording/rectification data (HK7.10–7.14), with H8's coplacticity, and prove the
quarter-octahedron map equals the semistandard Schützenberger crystal commutor
(HK7.15). These are comparisons of the actual finite maps. H8's ordinary
product rebracketing then proves the H3 associator's pentagon and unit triangles;
the crystal reversal proves the hive commutor's involutivity and coboundary/
cactus identities. No earlier commutor-involution theorem is assumed. Give the
HK§6 rank3 Yang–Baxter counterexample: this commutor does not satisfy the
symmetric-monoidal hexagon or braid law. The basic H3 excavation/ring theorem
remains independent of this coherent comparison.

## Source acceptance and references

- Handout hives1–2 and S1pp78–82: rank2 inequalities, gauge action, boundary
  duals, GT difference/reconstruction and the stated uniform-gap stable range.
  Preserve the source’s precise gap statements; the ambiguous S1p81 sketch
  is not used in place of the verified width threshold. WCFandGC4–6's signed Steinberg/Kostant/branching
  identities are consumed and their sign/row-sum comparisons tested by H2.
- Handout hives3–6 and S1pp84–89: exterior/determinant generators, unique top
  hive, direct Pieri, both sums in the associativity identity and every local
  excavation inequality; verify n=2 and a nontrivial n=3 intermediate-boundary
  example. S1pp182–187 require the unique kink completion, all eight rhombi,
  repeated λ entries and the collapsed edge multiplicities.
- Handout hives7 and S1p83: V_(2,1,0)² decomposes as
  V_(4,2,0)⊕V_(4,1,1)⊕V_(3,3,0)⊕2V_(3,2,1)⊕V_(2,2,2), dimensions
  27+10+10+16+1=64. Undo determinant shifts to the source's signed adjoint
  square. Identify the two SL₃ adjoint copies in alternating/symmetric squares
  by bracket and traceless symmetrized product, and the trivial pairing by trace,
  consuming existing classical-group/Lie-module constructions.
- S1pp90–97,188–190: breathing, nongeneric diagrams, overlay and tropical
  convolution; construct the stated PRV witnesses. Reproduce the nonoverlapping
  rhombus homework including convex same-type regions and boundary force balance.
  In rank6 prove the displayed necessary invariant inequality
  λ₄+λ₅+μ₄+μ₆+ν₂+ν₄≤0 by the puzzle with cyclic words
  000110,000101,010100. For rank5 prove the corrected certificate
  λ₄+μ₄+ν₃≤0 (words00010,00010,00100), and its cyclic counterpart
  λ₄+μ₃+ν₄≤0 (words00010,00100,00010). Treat the printed ν₃ version as
  an acceptance **counterexample**: λ=(1,1,1,1,0), μ=(1,1,1,0,0),
  γ=(2,2,1,1,1), ν=γ* give a hive/invariant by exterior Pieri, while
  λ₄+μ₃+ν₃=1. No single inequality is an iff criterion.
- S1pp93–100: real-to-integer feasibility at integral boundary, all-puzzle and
  rigid-puzzle inequalities, deflation/inflation and the binary-word ring. Verify
  `(σ0101)²=σ0110+σ1001` in Gr₂(ℂ⁴), its unit σ0011, and the two puzzle
  fillings. S1pp108–111: all six Gr₂(ℂ⁴) cells, σ0101⁴[Gr₂]=2 and two lines
  in ℂP³ meeting four flags in general position. Verify c₁(Q)=σ0101 with the
  bundle sign conventions. The exponent4 and four-letter0101 are essential.
- S1pp106,109–110 and S2pp69–73: actual rectangle quotient of Λ, partial-flag
  incidence maps and Grassmannian homogeneous/Kähler structure. Full-flag
  Bott–Samelson resolutions and generic Demazure restriction remain separate
  constructions; H6 uses the specified finite Grassmannian incidence resolution.
- S1pp177–180 and S2pp91–92: native signed GT involutions/weight swaps,
  quasi-GT/Kostant inverse and type-A path↔GT and tensor-path↔hive equivalences.
  S2p5's general-K path motivation and S2p90's generic Demazure path theorem
  are not misreported as proved by the type-A tensor connector.

Proof references, each with the constructions it supplies:

- Knutson–Tao, [*The honeycomb model of GLₙ tensor products I*](https://arxiv.org/abs/math/9807160),
  §§2–4 configurations/weighted diagrams/reconstruction, §5 largest lifts,
  §6 forest integrality, appendices BZ/LR and hive dictionary. H1/H4 build its
  finite-polyhedron and deformation prerequisites. The nonintegral vertex in
  figure18 is an acceptance counterexample, not a contradictory saturation case.
- Knutson–Tao–Woodward, [*The honeycomb model II: puzzles determine facets*](https://arxiv.org/abs/math/0107011),
  §§2–4 boundary certificates/trading/clockwise overlays/gentle loops, §5 the
  puzzle–honeycomb bijection, §6 Horn and multiplicity1. Its appendix's
  invariant-to-zero-level passage is built explicitly by H7; the real converse
  uses Schubert compression without inferring existence from symplectic volume.
- Knutson–Tao–Woodward, [*A positive proof of the Littlewood–Richardson rule
  using the octahedron recurrence*](https://arxiv.org/abs/math/0306274), §§3–5:
  direct hive Pieri, the ring presentation and the actual excavation bijection.
- Henriques–Kamnitzer, [*The octahedron recurrence and gl(n) crystals*](https://arxiv.org/abs/math/0408114),
  §§3–4 bounded recurrence, §§5–7 tableau crystals and precise recurrence/slide
  equivalence. Its coboundary commutor is not a symmetric braiding.
- Buch, [*Notes on Grassmannians*](https://sites.math.rutgers.edu/~asbuch/notes/grass.pdf),
  §§1–3: charts, cells, intersections, geometric Pieri and LR comparison.
  Its general cycle/transversality facts are built on the specific H6 carrier
  using the cited AT/CC/DG suppliers.
- Fulton, *Young Tableaux*, §§9–10: finite Grassmannian cell/cycle, incidence
  and integral Schubert ring proofs; SchurWeyl supplies its earlier tableau/LR
  theory. Littelmann, [*Paths and root operators in representation theory*](https://doi.org/10.2307/2118553),
  §§1–7 for running-extremum root operators, a-chain encoding, gluing/linking
  and the dominant-path isomorphism; H8 constructs the type-A specialization
  and both coordinate-path and straight-path comparisons in full.

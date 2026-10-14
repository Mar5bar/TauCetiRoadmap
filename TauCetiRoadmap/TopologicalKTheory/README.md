# Topological K-theory of vector bundles

Build real and complex topological K-theory as usable functors of spaces and pairs,
with bundle operations, compact supports, complex Bott periodicity, complex Thom
isomorphisms and compact-Lie-group equivariance. The basic objects are actual
finite-rank Mathlib vector bundles and their isomorphisms. Virtual classes must
retain their rank information and relative classes must retain their gluing map.
The endpoint includes the support and associated-bundle products needed to turn
an elliptic symbol into topological data.

## Scope, carriers and suppliers

Ordinary K⁰ and KO⁰ are the group completions of finite-rank complex and real
bundles over compact Hausdorff spaces. Ranks are locally constant functions;
spaces need not be connected. Compactly supported theory is defined for locally
compact Hausdorff spaces. Relative compact pairs have a closed subspace;
cofibration/CW hypotheses are displayed when skeletal or obstruction arguments
need them. T1.6 separately classifies numerable bundles over paracompact Hausdorff bases;
that classification is distinct from compact-support theory.
A class on a noncompact space is never silently called compactly supported.

Use `FiberBundle`, `VectorBundle`, `VectorBundleCore`, `Bundle.TotalSpace`, their
pullbacks and Mathlib's Hom/dual bundle constructions. A variable-rank object is
a locally constant rank `r:X→N`, topological-module fibres `E x`, and actual
`VectorBundle C (Fin n→C)` structures on each subtype `{x // r x=n}`. Give
constructed tensor/dual/exterior fibres their module topology and prove its
comparison with the transported chart topology; fibre norms are metric data,
not part of the object. The real carrier uses the same construction over R.
The `FiniteRankAtlas` prototype specifies an equivalent small cocycle model
using actual `VectorBundleCore` data indexed by the points of each stratum.
For `X:Type u`, pin `K(X):Type u` and `KO(X):Type u`; the full category may
have fibres in `Type v`, but prove essential smallness in universe u and a
ULift/change-of-fibre-universe equivalence, including invariance of the group
presentation and operations. Prove the comparison with the glued total space. Bundle morphisms are continuous maps of total spaces
covering the base map and linear on fibres; invertible morphisms carry the actual
inverse. Build the category and its small isomorphism-class model in T1. Construct zero morphisms, a zero object, Whitney-sum binary biproducts,
`Preadditive`, `MonoidalPreadditive` and the symmetric tensor structure on this
genuine category. Define K/KO with existing `TauCeti.SplitK0.{u}` and consume
`of_biprod`, `liftEquiv`, `grothendieckAddGroupEquiv` and the monoidal K-ring API;
prove their comparison with the bundle pair/group-completion model. No private
manifold, bundle or group-completion vocabulary replaces an existing API.

- [AlgebraicTopology](../AlgebraicTopology/README.md) supplies CW pairs,
  cofibrations, homotopies, relative homotopy sequences and ordinary
  (co)homology. T1 supplies the bundle-specific section-extension argument; T3
  supplies K-theory's own exact sequences.
- [DGFloer Layer 1 item 2](../DGFloer/README.md) supplies the Serre-fibration
  homotopy sequence and bundle-to-Serre comparison used by T1.5.
- [GrothendieckEulerForms](../GrothendieckEulerForms/README.md) supplies the
  categorical presentation/universal-property infrastructure. Topological
  bundle categories and comparisons with their direct-sum monoids belong here.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) supplies
  smooth principal/associated bundles, connections and smooth bundle operations.
  T1 and T6 build continuous counterparts and their smoothing/descent comparisons.
- [GeneralizedCohomology G4.0b](../GeneralizedCohomology/README.md) supplies
  the smooth graph-chart upgrade on T1.5's existing finite real/complex
  Grassmannian carriers for T6.6's homogeneous-space diffeomorphism.
  Its direct inputs from this roadmap are T1.5–T1.6's topological carriers;
  the join-classifier input through CharacteristicClasses C1.1 consumes T6.4.
  All precede T6.6, and those classifiers do not consume the smooth upgrade
  or T6.6.
- [ComplexKahlerGeometry K5–K7](../ComplexKahlerGeometry/README.md) supplies
  static Laplace-type estimates, Dolbeault Hodge theory, Kähler identities and
  projective examples. T6 owns the continuous-parameter, vertically smooth
  family bridges needed for its projective transfer. A static Hodge theorem does not
  supply those family bridges.
- [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md)
  supplies Haar averaging and Peter–Weyl; [LieGroups](../RepresentationTheory/LieGroups/README.md)
  supplies the compact Lie subgroup/torus vocabulary. Representation rings of
  continuous finite-dimensional representations and their bundle comparison are T6.
- [SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md)
  supplies Clifford algebras, their graded tensor products, exterior spin modules
  and algebraic periodicity. Existing Tau Ceti `Spin.Structure`, `Spin.OddStructure`
  and `Spin.Polarization.CliffordAction` are consumed; algebraic periodicity does
  not prove topological periodicity.
- [HomotopySpheres §4A–4B](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284)
  supplies stable O/SO, finite oriented Grassmannians, stable BSO, stable oriented
  real-bundle classification and the full real Bott loop chain, including its
  Clifford comparison. T7 extends the bundle classification to unoriented
  bundles and proves the geometric KO comparison and multiplicative normalization.
  The real loop-space proof remains that supplier's target; consume its exact
  §4B.1–4B.9 contract and build any unavailable mathematics in Tau Ceti in
  that shape before using the comparison.
- Mathlib `Analysis/Normed/Operator/Fredholm/{Basic,Open}` supplies
  native Fredholm packages, composition, openness and local index constancy.
  Tau Ceti `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}`
  supplies its additional perturbation and continuous-family interfaces. T6.5
  owns finite-bundle stabilization and the kernel-bundle family index; an
  closed-manifold index consumer must reuse this construction.
- [GeometricTopology Layer1](../GeometricTopology/README.md) supplies smooth
  embeddings and tubular neighbourhoods. T5 supplies K-theory extension through
  a tubular neighbourhood for an embedding with complex normal bundle. The
  tangent/cotangent normal comparison, topological index and Atiyah–Singer
  theorem are consumers of this interface, not prerequisites for Bott or Thom.

Characteristic cohomology classes, Chern character, Chern–Weil and genera are
outside this roadmap. Exterior-power operations are built here without invoking
characteristic classes. Smooth Clifford bundles, spin lifts and Dirac operators
also have their geometric owners. The closed-manifold index proof consumes the
relative, equivariant and Thom APIs below.

## Conventions

K⁰(pt)=KO⁰(pt)=Z by dimension, and an operator triple `[E,F,σ]` has absolute image
`[E]−[F]`. Reduced K is the kernel of restriction to the chosen basepoint;
K(X,empty)=K(X) uses an adjoined disjoint basepoint. Reduced and relative rings
are generally nonunital. A pullback on compact supports requires a proper map.
An open inclusion has a covariant extension map defined by the relative/triple
model, not an ordinary contravariant bundle pullback.

Identify S² with the one-point compactification of C using `CP¹ ∋ [z:1] ↔ z`.
Pin the first disc `D₀={|z|≤1}` and the second disc D∞ in the reciprocal
coordinate. For a triple `[E,F,σ]`, put E over D₀ and F over D∞, and use σ as
the first-to-second coordinate transition in the compactification comparison.
Let L have transition `z ↦ z`. On the overlap its frames satisfy
`s₀=(z,1)=z·s∞`, so L is the tautological O(−1); prove this isomorphism using
ComplexKahlerGeometry K7's actual projective/one-point charts and O(−1).
Set `β=[L]−1`, and fix the compact-support generator on C to map to β.
The complex Thom class of E uses the Koszul complex on `π*Λ• E*` with
contraction by the tautological vector; equivalently its folded even-to-odd map
is contraction plus its Hermitian adjoint. Its zero-section restriction is
`λ_(−1)(E*)`. Prove comparison with the wedge-only complex on `π*Λ• E`: on rank-r strata
its class is `(-1)^r [π*det(E)]·u_dual(E)`, by exterior degree reversal.
Prove the actual differential/folding intertwining maps and their signs; these
conventions are not interchangeable.
With the stated first-to-second disc gluing convention, the folded rank-one
Koszul symbol is conjugate z, so its compact-support class is −β; prove this
comparison. Higher-rank trivial Koszul classes are the external products of
these generators. Tensor products use the Koszul sign for Z/2 gradings.

## T1. Continuous finite-rank bundles as a category

1. Construct the finite-rank bundle category, morphism composition and fibrewise
   exactness; fixed-rank and clopen-stratum comparisons. Prove essential smallness
   on each compact base by finite trivializing covers and finite-matrix cocycles,
   and give an actual small model whose object-facing API is independent of
   representatives and the universe-u/ULift comparisons specified above. Cover
   the zero-rank bundle and disconnected/empty bases.
2. Build pullback, direct sum, tensor, dual, conjugate, Hom, exterior powers,
   determinant, realification and complexification, including
   `Λ^j(L⊗E)≃L^(⊗j)⊗Λ^j(E)` for a line bundle L, with identity/composition,
   rank, associativity, symmetry, distributivity and base-change isomorphisms.
   On compact spaces rank has finite image. Short exact bundle sequences have
   locally constant ranks and continuous kernels/images/quotients when fibre
   rank is locally constant; prove this from local matrices, not as an assumption
   on a symbol record.
3. Construct continuous positive-definite real/Hermitian metrics by partitions
   of unity. Every bundle over a compact Hausdorff base embeds into a finite
   trivial bundle; construct its orthogonal complementary bundle and prove
   `E⊕Eperp≃trivial N`. Prove splitting of short exact sequences, independence
   of complements and homotopy of metric choices. For paracompact bases use
   locally finite partitions; assert a finite trivial complement only with an
   additional finite-generation/finite-cover hypothesis.
4. Prove bundle homotopy invariance over X×I for compact Hausdorff X.
   For every closed Y⊆X, extend a specified cylinder trivialization over Y×I
   that is the identity at time0 to one over X×I, retaining its exact agreement
   with the specified data. Prove the compact CW case as a corollary. Establish
   extension of bundle maps from closed subsets to neighbourhoods and extension
   of fibrewise invertibility by a uniform bound. Construct clutching over closed
   disc/cone decompositions, its functoriality, dependence on the gluing map up to
   homotopy and changes of trivialization.
5. Construct the single finite Grassmannian carrier `finiteGrassmannian 𝕜 r N`
   for 𝕜=ℝ or ℂ as the native subtype
   `{V : Submodule 𝕜 (Fin N→𝕜) // Module.finrank 𝕜 V = r}`.
   Compare this subspace convention, for r≤N, with Mathlib's native
   `Module.Grassmannian 𝕜 (Fin N→𝕜) (N−r)` (locally free quotients),
   retaining the underlying submodule; the native algebraic functor and
   quotient-rank convention in `Mathlib/RingTheory/Grassmannian.lean` are
   used as supplied. The topological subspace construction below supplies
   its field-specialized comparison rather than another algebraic functor.
   Give it the quotient topology of the full-rank frame-span map, where frames
   are linearly independent r-tuples in Fin N→𝕜 with the inherited coordinate
   topology. Prove surjectivity, the GL(r,𝕜)-orbit/fibre identification, quotient
   maps and the comparison with orthonormal frames using native
   EuclideanSpace/WithLp coordinate transport and Gram–Schmidt. Treat r=0,
   r=N and r>N explicitly. Construct the continuous graph charts, their
   transitions, and agreement with these quotient topologies; construct the
   tautological and orthogonal-complement bundles, finite Stiefel principal
   bundles and their local trivializations, stabilization, direct-sum and
   scalar-forgetting maps on these same carriers. GeneralizedCohomology G4.0b
   supplies the smooth graph-chart/native-projective upgrade; this item owns
   the topological construction, used unchanged by T1.6 and T6.6. Compare its
   local-coordinate bundle charts with Mathlib bundles. Prove
   the real `(n−k−1)` and complex `2(n−k)` connectivity bounds for k-frames in
   n-space. The first-column stabilizer includes its contractible off-diagonal
   factor; construct its deformation comparison with the smaller classical
   group before using a fibration sequence. On finite-dimensional CW pairs,
   prove existence/uniqueness of section extensions with the corresponding
   strict/weak dimension bounds, applied to the bundle of surjections E→F.
6. Build stable complex/unoriented real Grassmannian classification of bundles
   of bounded rank over compact bases and stable classes over finite CW bases,
   with clutching and sum naturality. For oriented real stable bundles compare
   with HomotopySpheres §4A; identify the unoriented stable Grassmannian
   and rank carrier with §4B.1's BO×Z, including stabilization and group law.
   This is also T7's BO/BSO classification input,
   not a second construction there. Prove numerable fixed-rank classification
   over paracompact Hausdorff bases, with the universal numerable bundle and
   locally finite partition/classifying-map proof explicitly constructed.
   Name the fixed-rank universal carrier `Gr_k∞(𝕜)` as the union of the
   T1.5 carriers finiteGrassmannian 𝕜 k (N+k) along coordinate closed embeddings,
   with the final topology for those inclusions. Construct the Schubert-cell
   CW structure and prove agreement with its weak topology and with the
   compactly generated colimit; construct the universal tautological bundle
   by the same compatible finite stages. This is the fixed-rank carrier used
   for numerable classification, distinct from stabilization in k giving BO/BU.
   In rank one use Gr_1(𝕜^(N+1)): name `RP∞` for 𝕜=ℝ and `CP∞` for 𝕜=ℂ,
   with one cell in each nonnegative degree or each even nonnegative degree,
   respectively, using the rank-one Schubert cells from T1.5.
   CharacteristicClasses C1.5 compares these cells with AT4.6's finite RPⁿ
   and CKG K7's finite CPⁿ characteristic maps and owns the cellular/cup comparisons
   with these carriers. The carrier/bundle/CW construction precedes classification
   and uses earlier AT CW/Whitehead tools, without AT8.10–8.12.
   On smooth finite-dimensional manifolds prove that
   continuous bundles admit smooth representatives, continuous isomorphisms
   admit smooth representatives, and continuous homotopies induce the same
   stable smooth classes, using partitions and the matrix models above.

## T2. K-rings, universal properties and exterior operations

1. Group-complete the direct-sum monoid. Prove universality, induction,
   functoriality and equality `[E]=[F]` iff `∃G,E⊕G≃F⊕G`. For compact X replace
   G by a common trivial stabilization; unequal trivial ranks also change the
   absolute rank. Prove equivalence of the pair model
   `(E,F)~(E',F')` iff `∃G,E⊕F'⊕G≃E'⊕F⊕G` with the categorical presentation.
2. Tensor product gives a commutative unital ring; pullbacks are ring maps.
   Extend dual/conjugate/realification/complexification, with realification
   additive but not a unital ring map in its usual normalization. Prove
   `r c=2` on KO and `c r=1+conjugation` on K. Export the locally constant rank
   map, its splitting by trivial bundles and basepoint reduced decomposition
   `K(X)≃Kred(X)⊕Z`; do not identify all rank-zero classes using one basepoint
   on a disconnected space.
3. Build λ_t(E)=Σ[Λ^j E]t^j for actual bundles and the direct-sum product
   identity. Extend λ_t to virtual classes as a unit formal power series with
   constant1 and prove its inverse identity. Construct on each rank-r stratum
   `Λ^j(E*)≃Λ^(r−j)(E)⊗det(E*)` for 0≤j≤r and base-change compatibility.
   Extract individual λ^j operations and their sum law. After T5's projective
   flag pullback injectivity, prove the universal polynomial product laws for
   λ^j(E⊗F) by reduction to split lines, and extend them to virtual classes.
   Evaluating at t=−1 is allowed for an actual finite-rank bundle polynomial;
   no arbitrary infinite-series evaluation is asserted. Relative operations in
   T3 must preserve the chosen trivialization.
4. Prove the monoid exercise: a surjective monoid homomorphism to a group whose
   identity fibre consists just of the identity is an isomorphism, by first
   constructing inverses in the source. Use it when establishing the stabilized
   sequence model, not to declare an unstabilized tuple monoid a group.

## T3. Relative complexes, compact support and exactness

1. Define relative triples `(E,F,σ:E|Y≃F|Y)` with isomorphism, homotopy and
   stabilization by `(G,G,id)`; construct addition/inverse, degenerate classes
   and their relations. Retain σ as data. Prove comparison with
   `Kred(X/Y)` for compact Hausdorff closed pairs, including the empty pair
   and based point. Supply neighbourhood extension/gluing and the quotient
   descent proof, rather than assuming a boundary isomorphism determines a
   class uniquely.
2. First construct the source's finite sequences of bundles on X with their
   differentials defined only on Y, exact there, and isomorphism, homotopy and
   adjacent identity-pair stabilization. Separately construct global complexes
   exact on Y and prove their stable-homotopy comparison with that sequence
   model. Extend the split exact sequence to a neighbourhood using the metric
   image/kernel projections and their locally constant ranks; supply projection
   extension and correction of d²=0, then use a cutoff for a global differential.
   If stabilization is needed, prove its precise effect on the class. Do not
   assume arbitrary independent extensions still form a complex. Prove append-zero `L_n→L_(n+1)`
   is an isomorphism for n≥1, both directions, using T1's surjection extension
   for finite CW pairs and extension/gluing for general compact pairs. Prove
   their Euler class agrees with the triple model and is uniquely natural with
   alternating absolute image. Give a proof for the general compact case rather
   than applying a finite-dimensional rank bound to an arbitrary compact space.
   Folding uses an adjoint and is invertible on Y; the original complex differential
   and the folded parity operator are separate maps.
3. Define compact-support K via one-point compactification and prove the
   complex/triple description with an isomorphism off a compact subset,
   uniform compact support for homotopies, and equivalence with the filtered
   colimit over compact pairs/neighbourhoods. Prove metric-independent support
   control, Kc(X)=K(X) for compact X, proper pullback, and open extension with
   identity/composition and pullback/extension compatibility.
4. Construct nonpositive degrees by iterated right reduced suspension
   `suspensionRight`, appending each S¹ coordinate after the base coordinates,
   in order x then y for the two-coordinate comparison with C via x+iy.
   Construct connecting maps `coneBoundary` by clutching/cones with parameter
   increasing from0 to1 and endpoint boundary signs(−0,+1) and the long exact sequence of a pair. Prove
   exactness and naturality in every constructed degree, reduced wedge
   additivity for finite wedges, excision and Mayer–Vietoris, including compact
   supports and their support hypotheses. The sequence `K(X,Y)→K(X)→K(Y)`
   is exact at the middle; its first map need not be injective.
   Reversing the cone parameter negates the boundary, and switching suspension
   factors carries the corresponding graded sign. No blanket
   surjection from the two K-groups of an open cover is asserted.
5. Build relative products
   `K(X,Y)×K(X,Z)→K(X,Y∪Z)` and external products into
   `K(X×X',Y×X'∪X×Y')`; prove independence, graded associativity/commutativity,
   module laws and compatibility with connecting maps and suspensions.
   For compact support the noninvertibility set of the graded tensor complex
   lies in the product of the two compact supports. Specify the block matrix
   with its actual row/column bundle order. For σ:E₀→E₁ and τ:F₀→F₁ use
   `M=[[σ⊗1,−1⊗τ*],[1⊗τ,σ*⊗1]]` from E₀F₀⊕E₁F₁ to E₁F₀⊕E₀F₁.
   Prove M*M has diagonal blocks `σ*σ⊗1+1⊗τ*τ` and
   `σσ*⊗1+1⊗ττ*`; MM* has blocks `σσ*⊗1+1⊗τ*τ` and
   `σ*σ⊗1+1⊗ττ*`. All cross terms cancel. These positive endomorphisms
   prove invertibility outside the support product.

## T4. Complex Bott periodicity without an index theorem

Prove the external-product isomorphism
`K(X)⊕K(X)→K(X×S²), (a,b)↦a⊠1+b⊠β` for compact Hausdorff X.
The proof follows the elementary clutching/polynomial approach of Atiyah–Bott;
all steps below are targets, including independence of the constructed inverse.

1. Construct generalized clutching from an automorphism of the pullback of a
   bundle E→X over X×S¹, in the D₀-to-D∞ direction fixed above. Prove every bundle over X×S² arises this way by T1
   homotopy invariance on the two discs, and give precisely the equivalence
   under changes of trivialization. A clutching map is a continuous family of
   invertible linear maps, not a group homomorphism in the circle variable.
2. Prove uniform approximation of continuous endomorphism-valued circle
   families by finite Laurent polynomials with continuous bundle-endomorphism
   coefficients. Use trigonometric Stone–Weierstrass or Poisson/Fejér means;
   ordinary Fourier partial sums of an arbitrary continuous function need not
   converge uniformly. Prove the relative parameter version over X×I, retaining
   prescribed polynomial endpoints, uniform degree bounds and invertibility
   by a uniform inverse-norm bound. Local approximants are patched as
   endomorphisms in the same bundle, not averaged as automorphisms.
3. Clear negative powers and linearize a polynomial clutching function of
   degree d by the explicit `(d+1)`-block companion pencil with upper rows
   `(1,−z)` and final row `(p_d,…,p_0)`. Prove invertibility on the circle and
   elementary-row/column homotopy to `diag(id_(E^d),p(z))`;
   export additivity and naturality of this stabilization.
4. Prove the finite-dimensional spectral-projection lemma for continuous
   endomorphism families whose spectrum avoids S¹: the Riesz contour projector
   is continuous, idempotent, commutes with the endomorphism and has locally
   constant rank; its images are actual subbundles with inside/outside spectra.
   Derive this from finite-dimensional generalized eigenspaces and Mathlib's
   complex contour-integral/resolvent API, building contour parametrization,
   resolvent identities, the projection and rank-continuity proofs here.
   Self-adjoint spectral theory does not suffice for a general pencil.
5. Reduce `Az+B` to a pencil with invertible leading coefficient through
   `H_t(z)=(A+tB)z+(tA+B)`, with one uniform t<1 sufficiently close to1 on
   compact X; prove the circle Möbius identity and endpoint invertibility.
   Normalize by the actual left/right inverse in the correct multiplication
   order. Apply the spectral splitting to prove the clutch bundle decomposes
   as the L-twist of one subbundle plus the untwisted other subbundle. Prove
   independence of the extracted K-class from the admissible choice of t by
   a uniform parameter homotopy. Prove the explicit rotation homotopy
   `L⊕L≃L²⊕1`, hence β²=0, here before negative-power clearance uses it.
6. For polynomial p on E define the bundle V_d(E,p) extracted from its
   stabilized linear pencil. Prove its K-class is independent of polynomial
   homotopy and increasing d, that multiplying p by z adds E to V, and that
   direct sum and bundle pullback commute with V. These prove independence
   from Laurent approximation, power clearance and chosen clutching coordinates.
   V_d is the image of the inside Riesz projection of `−A′⁻¹B′` in the
   normalized companion pencil, matching the strict |z|<1 spectral choice.
   The coefficient of β for `z^(−m)p` is `[V_d(E,p)]−m[E]`; prove the sign
   and constant coefficient by computing z, z^(−1), identity and scalar powers.
7. Construct the inverse to the product map, prove both inverse laws, rank
   and basepoint compatibility. Extract `K(S²)≃Z[β]/(β²)` as a corollary of
   the product theorem, not a premise in its injectivity proof.
8. Use T3 relative exactness to pass to smash products and prove
   `Kred(X)≃Kred(S²∧X)`. Extend to compact pairs, compact supports and every
   suspension degree. Define the full Z-graded 2-periodic theory with natural
   products, connecting maps and periodicity comparisons. Compute all sphere
   groups and the coefficients `K*(pt)=Z[u,u^−1]` with |u|=−2. Pin
   `Σ²S⁰≃C⁺` by `(x,y)↦x+iy` with its ordered coordinates and set u=β
   under the reduced-sphere/right-suspension comparison. Positive degrees
   and their boundaries use multiplication by u and its inverse. Compute the
   endpoint normalization: if γ∈K^(−1)(I,∂I) is carried to u by the ordered
   right suspension, then `coneBoundary(0,1)=u^(−1)γ` in K¹(I,∂I). Derive
   it from the negative-degree cone map before transporting by periodicity.

## T5. Complex Thom classes and pushforwards

1. Construct the Koszul class of a finite-rank complex bundle E→X on its total
   space, using disc/sphere or compact-support relative data. Prove exactness
   away from zero, its folded invertibility, metric independence, zero-section
   restriction `λ_(−1)(E*)`, pullback, direct sums and graded tensor formulas.
   If X is noncompact the class is fibre-compact; define the corresponding
   multiplier on Kc(X), and prove the product has genuine compact support in E.
   Do not call the bare class compactly supported over a noncompact base.
2. Prove the ordinary complex projective-bundle theorem with powers of the
   tautological line as a free K(X)-basis and relation
   `Σ_(j=0)^r (−1)^j [Λ^j E] t^(r−j)=0`. First give CP^(r−1) its affine-cell
   filtration and identify the relative cell generator with the Koszul external
   Bott product from T4, including the factor (−1)^k for a k-dimensional
   complex cell in the dual-Koszul convention. For every compact Hausdorff parameter A run the
   filtration on A×(CP^k,CP^(k−1)); T4's relative Bott identifies its relative
   groups with K*(A). Compute K*(A×CP^(r−1)) through this parameterized
   filtration, proving it free over K*(A) on 1,…,t^(r−1), and identify
   the powers of the tautological class, including the transition signs. Then
   prove the K-theory Leray–Hirsch statement for a finite trivializing cover by
   Mayer–Vietoris and its degree-shifted diagram: fibre basis classes supplied
   globally on P(E) give the module isomorphism. Use compact closed refinements
   or compact-support open-cover statements with their exact hypotheses, not
   an unqualified K-group surjection from an open cover. The tautological
   bundle sequence and λ-identities give the displayed relation. Prove the
   corresponding free-basis theorem for K(X,Y) on compact closed pairs, and
   its compact-support colimit version on noncompact bases.
   Build the coordinate-free twisted-line proof as well, for M→X and
   P(M⊕1), following Atiyah–Bott §§2–5. Laurent coefficients for clutching
   E₀→E∞ on S(M) are maps M^k⊗E₀→E∞; companion stabilization retains
   those line powers. For a linear pencil p(z)=az+b define the two intrinsic
   projectors `Q₀=(1/(2πi))∮p⁻¹dp` and `Q∞=(1/(2πi))∮dp p⁻¹`.
   Prove their continuity, frame independence, idempotence and
   `p Q₀=Q∞ p`. The pointwise calculation uses T4's resolvent lemma, but
   no global leading-coefficient normalization is assumed. Prove the split
   pencil is invertible outside/inside S(M) and homotope it by scaling b on
   its outside block and a on its inside block. Construct the global inverse,
   its homotopy/degree/Laurent-clearance independence and both inverse laws.
   With tautological t this proves the rank2 relation `(t−1)(t−[M])=0`.
   This intrinsic proof supplies T6's equivariant line case without invoking
   a nonequivariant local cover.
3. Prove the Thom isomorphism `Kc(X)→Kc(E)` by multiplication by the Koszul
   class. For a trivial line it is −β, so compare its multiplier with the
   negative of T4's β Bott map and prove both inverse laws in that convention.
   For a line bundle prove
   it using the projective compactification/exact sequence in item2. Pull back
   a higher-rank bundle to its iterated projective flag bundle, where it splits
   into lines; prove K-theory pullback injective by the projective basis theorem
   for the splitting identities. Prove the ordinary Thom isomorphism by
   finite-cover Mayer–Vietoris from the trivial
   Bott theorem, with its support diagrams. T6 supplies a different transfer
   argument for general compact-group equivariance. At this point prove the
   λ-product identities of T2.3 using the injective flag pullback.
4. Prove Thom module, naturality, direct-sum, zero-section and inverse laws,
   comparison of relative disc/sphere and full-bundle compactification models,
   and agreement with the Clifford exterior action from SpinRepresentations
   in its negative-metric convention. Export the Euclidean Bott inverse with
   normalization at the point.
5. For a closed smooth embedding of compact manifolds with a specified complex
   structure on its normal bundle, compose Thom with open tubular extension
   to define the K pushforward. Prove independence of metric/tube choices,
   isotopy and direct-sum stabilization, composition under compatible complex
   normal structures, projection formula and transverse pullback. Consume
   GeometricTopology's actual tubular map; K-theory owns its support/extension
   comparison. For proper embeddings of noncompact manifolds state support
   conditions and prove the compact-support version.

## T6. Equivariant K-theory and associated-bundle products

G is a compact Lie group. Base actions are continuous and bundle actions are
continuous, fibrewise linear and cover the base action. Use compact G-spaces for
ordinary theory, locally compact Hausdorff G-spaces for compact support, and
invariant closed pairs. Smoothness is an extra hypothesis on the manifold
comparisons, not an assumption on every K-object.

1. Construct equivariant bundle metrics by Haar averaging, sums/tensors/duals,
   pullbacks and their small category. Prove equivariant splitting of bundle
   exact sequences and finite-dimensional representation embedding over a
   compact G-base: finitely many sections are approximated by finite
   Peter–Weyl subspaces, giving a surjective evaluation map X×V→E and a
   Hermitian complement. Supply the missing representation-level approximation:
   for every strongly continuous Banach representation of compact G, convolution
   with representative functions gives G-finite vectors, and approximate-identity
   convolution gives their density. Prove continuity of the sup-norm action on
   continuous sections and strong continuity on L² sections, then apply that
   theorem to both spaces. Peter–Weyl for C(G)/L²(G) alone is insufficient.
   The ambient representation need not be trivial.
2. Construct K_G, relative and compact-support groups and products by T2/T3's
   same machinery; prove equivariant homotopy invariance, proper pullback,
   invariant-open extension, exact and Mayer–Vietoris sequences. Define R(G)
   as SplitK0 of the finite-dimensional full subcategory of genuine continuous
   representations: use Mathlib ContRepresentation with the additional
   continuity of G→(V→L[C]V), which that carrier alone does not require.
   Construct biproduct/monoidal instances and compare with compact-group
   representation models. Export the forgetful ring map to TauCeti.repRing C G;
   prove it an isomorphism for finite discrete G, not for arbitrary compact G
   where abstract representations may be discontinuous. Prove the ring
   isomorphism K_G(pt)≃R(G), restriction maps
   and naturality under continuous homomorphisms. No injectivity of restriction
   to a connected torus of a disconnected group is presumed.
3. Make T4's approximation, companion homotopy and spectral splitting
   equivariant: average endomorphism coefficients, use uniform approximation
   before homotopy, and prove contour projections intertwine the action.
   Obtain equivariant Bott for the trivial complex line. Make T5.2's typed
   twisted-line Laurent coefficients, line-power companion blocks and intrinsic
   two-projector integrals equivariant. Prove equivariant Fejér approximation
   over the circle bundle, covariance of dp and frame-independent projectors,
   and use its block-scaling homotopy, which respects the line action. The
   trivial-line Möbius homotopy is not asserted for a nontrivial character.
   Prove the quotient-polynomial inverse and both inverse laws equivariantly;
   identify the supported kernel generator with the stated Koszul class.
   This gives equivariant Thom for complex line bundles, and for their direct
   sums by the Koszul tensor identity. No assertion that an arbitrary
   equivariant bundle splits into lines on an invariant cover is used.
4. Let H be a compact Lie group. For a free proper H-action whose quotient
   map is a numerable principal
   bundle, construct equivariant-bundle descent and its inverse, retaining a
   commuting G-action, and prove
   `K_(G×H)(Y)≃K_G(Y/H)` and relative/compact-support versions. Build the
   continuous principal/associated-bundle category needed here and compare
   smooth descent with SmoothBundlesConnections. Prove the supported-subset
   correspondence and properness of the quotient for compact H. Also prove
   change-of-group `K_H(X)≃K_G(G×_H X)` for a closed subgroup H of G,
   consuming SmoothBundlesConnections B1.4's principal map G→G/H.
5. Construct the following family index specifically for the unitary subgroup
   transfer. For compact Hausdorff parameter X and the fixed compact complex
   projective fibre F=CP^(r−1), every topological finite-rank bundle on X×F admits
   a representative smooth in the fibre direction, with continuous dependence
   on X in all required vertical derivative seminorms. Prove the corresponding
   relative and equivariant approximation/isomorphism/homotopy statements.
   Pin this carrier by an equivariant self-adjoint idempotent matrix
   `p:X×F→M_N(C)` acting on a unitary representation with fixed model
   `EuclideanSpace C (Fin N)`,
   with all derivatives in F continuous on X×F; E is its actual image bundle
   from T1. Give this regularity the finite-chart C^k seminorms and prove their
   chart independence. Construct the projected vertical connection
   `∇=p∘d_F∘p` and compare other vertical connections through affine homotopies.
   Realize L²/H¹ fibres as the images of multiplication by p on fixed
   `L²/H¹(F,C^N⊗Λ^(0,•))`, proving boundedness and nearby-image charts from
   continuity of p and d_F p. This is the continuous-base/smooth-vertical
   carrier; X itself has no asserted manifold structure.
   Obtain L² and integer Sobolev Hilbert bundles by local identification of
   nearby projection images over the compact fibre, comparing with
   SmoothBundlesConnections B2 and K5's actual carriers. Prove separability and
   compare these complete Hilbert spaces with one fixed Hilbert model on each
   rank stratum, using orthonormal-basis classification; construct the actual
   Mathlib bundle instances. Zero-rank and point-fibre cases use their finite
   models separately. Prove that vertical
   even-to-odd Dolbeault–Dirac operators twisted by these bundles define a
   continuous family of bounded maps H¹(Ω^(0,even)⊗E)→L²(Ω^(0,odd)⊗E). Their squares have Laplace-type principal
   part; prove uniform local estimates, compact embeddings, regularity and
   Fredholmness from K5's static estimates plus compact parameter/fibre
   localization, with every uniformity bridge explicit. In particular derive
   `‖u‖_(H¹)≤C(‖D_x u‖_(L²)+‖u‖_(L²))` with one C on a compact
   parameter neighbourhood, and the adjoint estimate. Prove distributional
   adjoint-kernel regularity, finite kernel/cokernel and closed range; a
   second-order static estimate alone is not the asserted first-order API.

   Stabilize a continuous family of Fredholm maps by a finite equivariant
   bundle W of target sections so that `(D,W)` is fibrewise surjective; over
   a compact base choose W from a finite-dimensional group representation
   using item1. Prove operator-norm openness of surjectivity for the infinite
   Hilbert target: a surjective Fredholm map has a bounded right inverse from
   its complemented kernel, and a Neumann-series perturbation retains a right
   inverse. Consume the native Fredholm package's neighbourhood normal form.
   Prove its kernels
   form a continuous finite-rank bundle, with local graph charts and constant
   dimension where asserted. Define `[ker(D,W)]−[W]`; prove independence of
   stabilization, changes of vertical connection, smoothing choices and
   homotopy, plus direct sum, pullback and the projection formula under
   tensoring by a bundle pulled from X. Consume Mathlib's native Fredholm
   package/openness/index APIs and the additional Tau Ceti perturbation/family
   APIs named above. Export this kernel-bundle family-index construction for
   the closed-manifold index development's finite-family consumers; its elliptic construction here is
   limited to the projective transfer. This is not an
   Atiyah–Singer theorem or a theorem about arbitrary elliptic symbol families.
6. Construct the block subgroup H_r=U(r−1)×U(1), its principal quotient,
   and the equivariant diffeomorphism `U(r)/H_r≃CP^(r−1)` with the projective
   charts of ComplexKahlerGeometry K7 and GeneralizedCohomology G4.0b's
   smooth graph charts on T1.5's same complex Grassmannian carrier.
   Consume G4.0b's rank-one graph-chart/native-Projectivization diffeomorphism
   with K7's same projective smooth structure; prove
   this homogeneous quotient diffeomorphism and its U(r)-equivariance by
   composing that comparison with the actual frame/plane quotient maps.
   Own the bundle comparison carrying T1.5's tautological line through that
   rank-one map to K7.2's O(−1), retaining the underlying fibre inclusion and
   U(r)-action.
   Consume K7's projective Dolbeault/Hodge calculation to extract
   `H^(0,0)(CP^(r−1))=C`, with trivial U(r)-action, and
   `H^(0,q)(CP^(r−1))=0` for q>0. Prove the constant-function/action comparison;
   a bare dimension equality is insufficient. Include r=1 point and rank0
   cases separately.

   For compact Lie G and a compact G×U(r)-space X, use the family of item5
   and change of group
   `K_(G×H_r)(X)≃K_(G×U(r))(X×CP^(r−1))` to define the projective transfer
   `K_(G×H_r)(X)→K_(G×U(r))(X)`. Prove its module projection formula and
   transfer(1)=1 from those harmonic representations, hence that it is a left
   inverse of restriction. Iterate with the remaining U(r−1) factor, treating
   the U(1) factors as commuting spectators, to construct
   `K_(G×T)(X)→K_(G×U(r))(X)` left inverse to torus restriction. Prove the
   compact-support and relative versions by the exact sequences, and prove
   extension and Koszul-multiplier compatibility. This is the general
   equivariant splitting needed for Thom, established by projective families
   before using any equivariant projective-bundle module-basis theorem.
7. For any complex G-bundle E, lift to its unitary frame principal U(r)-bundle
   P, retaining the commuting G-action. On P the pullback is the trivial
   `(G×U(r))`-bundle with standard U(r) fibre action. Restrict U(r) to T;
   its standard representation splits into character lines, so item3 gives
   Thom there. Use the transfer on base and total space and its Koszul
   compatibility to prove injectivity and surjectivity before descending along
   P→X by item4. Treat variable ranks on invariant clopen strata. This proves
   general complex equivariant Thom and representation Bott
   `R(G)≃K_(G,c)(V)`, including nontrivial G-action on V. Afterwards derive
   the equivariant projective/flag module-basis and relation theorems from
   these Thom/transfer maps, with the explicit inverse and descent laws.
8. For a smooth principal bundle P→X of a compact Lie group H, with commuting
   smooth G-action and compact smooth base X, and a compact smooth
   G×H-manifold F, set Z=P×_H F. Build associated bundles of representations,
   exterior/tensor/pullback comparisons, the vertical tangent bundle and
   `0→T(Z/X)→TZ→π*TX→0`. Choose an invariant splitting and prove its space
   is contractible. Construct
   `K_(G,c)(TX)×K_(G×H,c)(TF)→K_(G,c)(TZ)` and
   `R(G×H)→K_G(X)` with bilinearity, associativity, base change, extension
   and Thom compatibility. Prove compactness of the product support from
   the factor supports and compactness of H in principal local trivializations;
   also prove the noncompact X/F version for classes whose supports K_A⊆TX
   and K_B⊆TF are compact. Before multiplication, the pullback of the TF symbol
   to P×TF is a vertical-support multiplier, exact outside P×K_B, not a Kc
   class. Define that relative-complex multiplier and multiply with the TX
   symbol; the resulting support lies above K_A and K_B simultaneously.
   Prove that intersection compact after quotient using compact H and finite
   principal trivializations over the compact projection of K_A. No nonproper
   pullback on Kc is used.
   These are products of classes, not assertions about operator kernels.
9. Prove associated Thom-class naturality: exterior powers, Koszul
   differentials and folding commute with association. For a real O(n)-bundle
   N, apply this to its complexification and prove its class is associated
   to the O(n)-equivariant Koszul class of C^n. Export this interface for the
   index embedding proof without proving an analytic index value.

## T7. Real K-theory and concrete acceptance calculations

1. Develop KO⁰'s finite-bundle/relative/support API and all negative suspension
   degrees, reusing T1.6's unoriented BO classification and its oriented BSO
   comparison. First work on finite CW pairs. Use HomotopySpheres §4B.1–4B.9's
   actual stable-space maps, increasing-connectivity comparisons and Clifford
   comparison; identify the eight coefficient groups by sphere clutching.
   Construct the category of finite-dimensional Z/2-graded real Clifford
   modules, its restriction functors and the cokernels of their Grothendieck
   group maps; these graded-module interfaces are additional work here, beyond
   SpinRepresentations' algebra classification. Define the real ABS classes
   using those graded modules and Clifford
   multiplication on the disc, modulo extension to one higher Clifford algebra.
   Prove this respects that quotient and agrees with the sphere-clutching
   comparison, and that graded tensor product corresponds to external product.
   Compute the module restriction cokernels and tensor products in degrees0–8
   from SpinRepresentations' real Clifford classification. Choose η in degree−1
   as Möbius−1, a in degree−4 and b in degree−8 by the specified irreducible
   module representatives, with negative quadratic form Cl(0,n): the raw
   volume e₁⋯e₄ acts by −1 on the even part for a, and e₁⋯e₈ by +1
   for b. Prove the
   low-degree geometric comparison: Möbius clutching in degree1, the explicit
   winding-one SO(2) loop and its stable Z/2 class in degree2, quaternionic Hopf
   clutching in degree4, and the degree8 class compared with the supplier's
   real Bott map. In particular prove the Clifford tensor square of the
   degree1 representative gives that nonzero stable loop; an additive table
   alone cannot show η²≠0. Prove η² is the nonzero degree−2 generator,
   `2η=η³=ηa=0` and `a²=4b`. On the Clifford-module quotient side prove
   eightfold periodicity via a graded-Clifford Morita equivalence: construct
   tensoring with the degree8 irreducible graded module, prove it intertwines
   restriction, and compute its action on both simple-module generators using
   grading/volume-element signs and dimensions. The ungraded matrix-algebra
   periodicity of the supplier is an input to that proof, not the entire proof.
   For every n≥0 prove the precise geometric bridge: the coefficient map B_n
   induced by RB's composite eight loop equivalences satisfies
   `B_n(α_n(m))=α_(n+8)(m⊗λ₈)` for the ABS maps α and chosen graded
   degree8 module λ₈. Construct the pointed comparison homotopies from the
   supplier's concrete geodesic/stable maps, respecting the ordered eight
   Clifford generators and stabilization; this full-degree compatibility is
   a target here, beyond citing §4B.9's general comparison statement. Using
   the degree0–7 clutching checks and the two periodic isomorphisms, prove
   α_n bijective for every n. ABS multiplicativity then identifies B_n with
   external product by b in every degree, including ηb≠0 and the other
   torsion generators. No additive period table alone proves this bridge. This
   proves the ring, not just the additive table. Pin complexification by
   `c(a)=2u²`, `c(b)=u⁴`, where u is T4's degree−2 generator; compute c and r
   on all eight degrees with the real/quaternionic module comparisons.
   In particular prove `r(1)=2`, `r(u)=η²`, `r(u²)=a`, `r(u³)=0`,
   `r(u⁴)=2b`, and c kills the η-torsion. The KO coefficients in degrees
   0,−1,…,−7 are respectively Z,Z/2,Z/2,0,Z,0,0,0, with periodicity
   given by this b, not just an unnamed additive isomorphism.

   Multiplication by this actual b is a natural map of relative cohomology
   theories. Prove it an isomorphism on finite CW pairs by the cell relative
   groups and five-lemma induction. In degree0 use the attaching-map mapping
   cylinder pair `(M_f,∨S^(k−1))`, whose quotient is the attached skeleton,
   so KO⁰ of that skeleton is central in five defined nonpositive-degree
   exact-sequence terms; do not use an undefined positive-degree endpoint.
   The construction precedes identifying a weak stable-space
   equivalence with an arbitrary compact-source mapping equivalence. Extend
   to all compact Hausdorff pairs by the following continuity theorem, owned
   here: represent a compact base by its finite-coordinate finite-polyhedral
   neighbourhood system in a cube and prove the K/KO groups are the filtered
   colimits of those finite CW groups. Supply the system and refinement maps;
   prove descent of matrix-projection representatives, stabilized isomorphisms
   and homotopies by uniform approximation and spectral projection, including
   the relative data and X×I version. Then pass product-by-b and exact sequences
   through that colimit, and through the compact-support colimit of T3.3.
   Export the full Z-graded theory and coefficient ring
   `Z[η,a,b,b^−1]/(2η,η³,ηa,a²−4b)`, with degrees−1,−4,−8. Algebraic Clifford
   periodicity supplies the module calculation, while the geometric identification
   uses the real Bott proof supplier; neither substitutes for the other.
2. Compute K⁰(S¹)=Z, KO⁰(S¹)=Z⊕Z/2 and their geometric generators; the
   reduced real generator is Möbius−1. Compute the ring K⁰(S²)=Z[β]/(β²)
   with the specified gluing line, all complex sphere groups, and verify
   real/complex dimension-zero and disconnected-base rank examples.
3. Give explicit failures of relative injection and restriction surjection:
   for the pair (D²,S¹), `K(D²,S¹)≃Z→K(D²)` is zero, whereas for
   `(D³,S²)` the restriction `K(D³)→K(S²)` misses β. Include the full long
   exact fragments and the connecting generators.
4. Prove the doubled-space formula
   `K(X,Y)≃ker(K(X∪_Y X)→K(X))`, where the restriction is to one copy and
   the folding map splits it; construct the triple/gluing comparison. Prove
   finite-sequence append-zero stabilization and the alternating Euler map
   give the relative ring isomorphism L1≃K. Apply T2.4's trivial-kernel
   monoid criterion to the stabilized sequence model.
   Verify graded external-product supports and the exact block-map ordering.
5. On the disc/sphere of a complex bundle verify zero-section λ_(−1)(E*),
   complex Thom naturality and exterior-product multiplicativity. Check the
   equivariant point ring and the free-action descent examples. Construct the
   sphere de Rham symbol on the continuous dual of Mathlib's tangent bundle:
   fibres `TangentSpace I x →L[R] R` with model `R^n →L[R] R`, using Mathlib's
   Hom/dual bundle construction and SmoothBundlesConnections B2's dual metric.
   Prove the real metric identification with tangent fibres and its O(n)
   equivariance. For Sⁿ=Rⁿ∪{∞}, define the finite-support point classes q₀ and
   q∞ by invariant coordinate-ball representatives, extending through the open
   chart inclusions of T3.3. In the first chart fix the complex coordinate
   `w=v−ix` on `R^n_x⊕R^n_v`. Compare the wedge representative `w∧−`
   with T6.7's O(n)-representation Bott class of Cⁿ and T5's dual-Koszul
   convention, retaining the explicit determinant/parity conversion.
   Prove the two-chart homotopies `(v−isx)∧−` and `(v+isx)∧−`, their compact
   support control, the reflection transition on the equator and cotangent
   negation. Prove the global equation `ρ_(Sⁿ)=q₀+f* q∞` in that wedge
   convention, where `f(x,v)=(x,−v)`. The q-classes are these explicit chart
   extensions, not undefined embedding pushforwards; no analytic index value
   normalizes the equation.

## Dependency order and references

T1→T2's additive/λ-sum basics→T3 supplies the cohomology machinery used by T4;
T2's λ-product identities follow the T5 splitting theorem. T4 precedes T5. T6 first constructs equivariant bundles and line Thom, then
descent, the projective-family index and normalized transfer; only then does it prove
general equivariant Thom and projective comparisons. T7's real
periodicity consumes the existing HomotopySpheres proof, independently of the
complex Thom and index developments. Every analytic step in T4 concerns finite
matrix/bundle families; no elliptic operator or index theorem proves Bott.

- Atiyah–Bott, [*On the periodicity theorem for complex vector bundles*](https://doi.org/10.1007/BF02391772), Acta Math.112 (1964), 229–247, for the polynomial-clutching proof.
- Hatcher, [*Vector Bundles and K-Theory*](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), §1 and §2.2, for bundle/classification foundations and the elementary product proof.
- Freed's K-theory lectures, [notes by Arun Debray](https://www.math.purdue.edu/~adebray/lecture_notes/m392c_Knotes.pdf), §§5–6, for the companion-pencil, spectral bundle and inverse-independence proof spine, with uniform approximation and signs proved as specified above.
- Segal, [*Equivariant K-theory*](https://www.numdam.org/item/PMIHES_1968__34__129_0/), Publ.Math.IHÉS34 (1968), for equivariant bundles, representation embeddings, descent and complex Thom theory.
- Atiyah, [*Bott periodicity and the index of elliptic operators*](https://doi.org/10.1093/qmath/19.1.113), Quart.J.Math.19 (1968), §§2 and4 (especially Proposition4.9), for the minimal family-index transfer; prove the analytic bridges of T6.5 rather than importing a general index theorem.
- Atiyah–Bott–Shapiro, [*Clifford modules*](https://doi.org/10.1016/0040-9383(64)90003-5), Topology3 Supplement1 (1964), §§6 and11, for the graded-module product computation and its geometric comparison in T7.

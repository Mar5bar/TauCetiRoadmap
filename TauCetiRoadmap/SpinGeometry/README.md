# Clifford bundles, spin structures, and Dirac geometry

Develop the geometric theory of real and complex Clifford modules, spin lifts,
spinor bundles and their compatible connections. The resulting library must
support the de Rham, signature and twisted spin Dirac operators, with their
metrics, gradings and curvature formulas pinned. This README is definitive;
`Suggested.lean` gives selected interfaces and is not an exhaustive checklist.

## Scope, conventions and suppliers

The algebraic Clifford algebra, its real periodicity and the abstract spin
representations are supplied by
[SpinRepresentations L0–L4,L7,L9](../RepresentationTheory/SpinRepresentations/README.md)
and [OrthogonalSpinGroups L0–L2](../OrthogonalSpinGroups/README.md).
Use Mathlib's `CliffordAlgebra`, `ExteriorAlgebra`, `CliffordAlgebra.equivExterior`,
`equivBaseChange`, `equivOfIsometry`, `prodEquiv`, `evenOdd`, `involute` and
`reverse`. Tau Ceti already has `TauCeti.spinAction`,
`SpinPolarizationData.cliffordEquivEnd`, its even/odd matrix classification,
half-spin actions, raw orthogonal-product volume identities and real algebraic
eight-periodicity. G1–G2 supply the geometric metric/complexification/chirality
comparisons with those objects. They do not construct another abstract Fock
action, classification table or Bott-periodicity proof. Real algebraic
periodicity is distinct from the topological Bott theorem.

For the remaining suppliers:

- [SmoothBundlesConnections B1–B5,B6.0](../SmoothBundlesConnections/README.md)
  owns smooth principal/associated bundles, descent, frames, sums/tensors/duals,
  scalar extension, metrics, connections, curvature and parallel transport.
  Use its actual Mathlib `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`
  carriers, and its metric-parametrized L² sections. G3 adds Clifford algebra
  multiplication and module data to those bundles; G4 adds a spin lift of the
  oriented frame bundle. B3 supplies the invariant-vector parallel-section
  theorem used in G3.
- [HopfRinow L1](../HopfRinow/README.md) supplies the actual Levi-Civita
  covariant derivative. [RiemannianGeometry R1,R5,R7](../RiemannianGeometry/README.md)
  supplies curvature identities, pullback/normal connections and the real
  Weitzenböck comparison. The metric uses Mathlib's `RiemannianBundle` and
  `IsContMDiffRiemannianBundle`.
- [DifferentialGeometry L0–L2,L5–L9](../DifferentialGeometry/README.md)
  supplies forms, exterior calculus, orientation, densities, integration,
  Stokes and de Rham comparison.
  [ComplexKahlerGeometry K5](../ComplexKahlerGeometry/README.md) supplies
  the shared exterior Gram metrics, pointwise real Hodge star and its
  complex-linear extension, complex-type stars, formal adjoints, p=2 bundle Sobolev/distribution theory,
  Laplace-type regularity, Hodge theorem and compact resolvent. Its K1/K4
  complex/type and Hermitian bundle interfaces supply the almost-complex
  pointwise comparisons below. The pointwise exterior metric/star API
  precedes the analytic Hodge theorem.
- [CharacteristicClasses C1,C3.5](../CharacteristicClasses/README.md) owns
  mod2 cohomology, universal w₂ and its equality with the real spin-cover
  transition obstruction. G4.3 consumes that universal equality for lift
  existence; G4.4 constructs the H¹ torsor once a lift is given. [AlgebraicTopology Stages 2–6](../AlgebraicTopology/README.md)
  supplies cochains, cup/cross products and CW comparisons; SBC B6.0 supplies
  smooth good covers. On general paracompact bases keep Čech cohomology;
  identify it with singular cohomology on CW-type bases using C1's comparison.
- [TopologicalKTheory T1–T3,T6.4](../TopologicalKTheory/README.md) supplies the
  vector-bundle K-ring and products for G5's virtual spinor formula. Its
  T6.4 owns the continuous numerable principal/associated-bundle category;
  CharacteristicClasses C1 owns its continuous orthonormal/oriented frames.
  [PseudodifferentialOperators P1,P5–P6](../PseudodifferentialOperators/README.md)
  owns generic operator/symbol calculus and elliptic estimates. G6 constructs
  geometric Dirac operators on the shared carriers and compares with these
  suppliers. Numerical topological index formulas, the Hirzebruch signature theorem and
  the Â-genus formula are outside this roadmap.

Finite-dimensional Euclidean spaces and finite-rank real/complex bundles are
the fiber setting. Smooth bases are Hausdorff, second-countable boundaryless
manifolds, with orientation, compactness and completeness stated per theorem.
Spin structures on general bundles use paracompact Hausdorff numerable bases;
singular H¹/H² statements also require CW type. Ranks are fixed on each
connected component. Include ranks zero and one explicitly.

Use `Q(v)=−g(v,v)` for geometric Clifford multiplication, hence
`c(v)c(w)+c(w)c(v)=−2g(v,w)Id`. Mathlib's Clifford generators square to Q.
Complexification is `Cl_ℝ(V,−g)⊗_ℝℂ ≃ Cl_ℂ(V⊗_ℝℂ,−g_ℂ)`;
g_ℂ is complex bilinear. The positive Hermitian form h on V⊗ℂ is the
conjugate-linear/linear form induced by g, and is not g_ℂ. Hermitian products
follow Mathlib's convention of conjugate linearity in the first argument.
The Clifford adjoint conjugates scalars, reverses products and sends each real
vector to its negative; c(v) is skew-Hermitian.

For an oriented real 2ℓ-space and positively oriented orthonormal basis,
`Γ=i^ℓ c(e₁)…c(e_(2ℓ))`, S⁺ is its +1 eigenspace and S⁻ its −1 eigenspace.
An orthogonal complex structure J uses the orientation
`(u₁,Ju₁,…,u_ℓ,Ju_ℓ)`. Set `v^(1,0)=(v−iJv)/2` and
`v^(0,1)=(v+iJv)/2`; the normalized Fock action is
`c(v)=√2(ε(v^(1,0))−ι(v^(0,1)))`, where contraction uses g_ℂ.
This makes Γ exterior parity, with vacuum in S⁺.

Use `R(X,Y)=[∇_X,∇_Y]−∇_[X,Y]`, positive round-sphere curvature,
`D=Σ c(e_j)∇_(e_j)` and nonnegative rough Laplacian ∇*∇. The geometric
principal symbol has `σ_geom(D)(ξ)=c(ξ♯)`; the Fourier symbol of
`−i∂_j` is ξ_j and `σ_F(D)=i c(ξ♯)`. Thus the Fourier symbol of D² is
|ξ|²Id. The Hodge star on complexified real forms here is complex linear;
conjugate-linear Hermitian/Dolbeault stars have separate names.

## G1. Negative-metric Clifford modules and their positive metrics

1. Build the real-to-complex negative-metric dictionary on the native tensor
   and Clifford carriers, with generator evaluation, isometry naturality,
   grading, involution and reverse compatibility. Compare the negative form
   `realCliffordForm 0 n` with an orthonormal coordinate model; transport its
   existing real classification and periodicity results. For n≥1 compare compact
   Spin from the positive-form supplier with the negative-form geometric model:
   construct its real even-algebra comparison, sending the positive-form
   bivector e_i e_j to −e_i e_j in the negative form, and pin its vector
   conjugation action and central ±1. In rank0 construct μ₂⊂Cl(0)=ℝ
   on native `CliffordAlgebra.evenUnitaryGroup` and compare it with the
   native trivial Spin group using `range_spinGroup_toUnits`; this
   algebraic geometric branch precedes the later frame adapters.
   Over ℂ the map from
   the positive full algebra to the negative full algebra sends v to i v.
   Its even restriction must be compared to the real group map, with the
   bivector sign made explicit. Do not infer a real full-algebra isomorphism
   from the complex multiplication by i.
2. For (V,J), build the two isotropic J-eigenspaces, their perfect g_ℂ pairing
   and the adapted `SpinPolarizationData`. The native action on ΛW is
   `ε(v^(1,0))−2ι(v^(0,1))`, since polar(−g_ℂ)=−2g_ℂ.
   Conjugate it by T|_(Λ^pW)=2^(p/2)Id to obtain the √2 Fock action;
   prove this exact intertwining equation. Use h_ℂ(x,y)=g_ℂ(bar(x),y)
   restricted to W: |v^(1,0)|²=|v|²/2. On (V,J) Mathlib's conjugate-first
   Hermitian form is h_J(v,w)=g(v,w)−i g(v,Jw), twice the pullback of
   h_ℂ|_W under v↦v^(1,0). Translate the source's g+i g(·,J·) by
   conjugating its slot convention. The native-action metric pulled back
   along T has degree-p factor 2^p relative to the normalized Fock metric.
   Prove the three
   creation/annihilation anticommutators, wedge/contraction metric adjointness,
   c(v)²=−|v|²Id, and skew-Hermitian real-vector multiplication. Include
   unit orthogonal 2-plane and tensor-product computations. Use K5's exterior
   Gram metric and the increasing orthonormal wedge basis.
3. Construct the conjugate-linear Clifford star intrinsically and identify it
   with grade-involution followed by reversal and scalar conjugation.
   Given an algebra isomorphism `Cl_ℂ(V,−g)≃End_ℂ(S)` in even dimension,
   construct a positive Hermitian metric with ρ(a*)=ρ(a)†, unique up to a
   **positive** scalar. Prove existence using the native Fock metric transported
   along the representation intertwiner, and uniqueness via Schur. For an
   arbitrary finite-dimensional module E, construct
   `S⊗Hom_Cl(S,E) → E`, s⊗T↦T(s), prove it an evaluation isomorphism and
   give inverse/naturality/dimension API. Compatible metrics are positive
   Hermitian metrics on the multiplicity space, rather than unique up to scale
   for reducible E. On S* pin the dual Clifford action as
   `(a·φ)(s)=φ(ρ(reverse(a))s)`, with the transported positive dual metric;
   distinguish it from conjugate-linear Hermitian adjunction. Treat zero
   modules and dimension-zero V.
4. In oriented dimension n=2ℓ+1 consume the existing Nonempty two-matrix-
   factor classification, then construct labeled factors using
   ω_ℂ=i^(ℓ+1)e₁⋯e_n, prove it central with square 1, and use the explicit
   idempotents (1±ω_ℂ)/2. Label the two irreducibles by ω_ℂ=±Id and pin
   the polarization line action to these labels: in the ordered orientation
   (u₁,Ju₁,…,u_ℓ,Ju_ℓ,u), c(u)=λ·exterior-parity and ω_ℂ=iλ,
   so λ=−i gives the + factor and λ=i gives the − factor. Arbitrary modules have one
   multiplicity space for each factor. Supply the negative-form generator
   dictionary for `Cl_n≃Cl^even_(n+1)`: e_j↦e₀e_j and
   x⁰+x¹↦x⁰+e₀x¹, with the inclusion of V into V×ℝ explicit.
   Mathlib's `EquivEven.Q'` orders V first and e₀ last. Prove
   multiplicativity, bijectivity and grading correspondence using this
   native `equivEven` design. In the ordered orientation (e₁,…,e_n,e₀),
   prove ψ(ω_ℂ)=−Γ_(V⊕ℝ); therefore the odd ω=+1 module is the
   restriction of S⁻_(V⊕ℝ), and the odd ω=−1 module restricts S⁺.
   Moving e₀ first reverses orientation for odd n and interchanges these
   two labels. Construct these specific module intertwiners. State the effect of
   reversing orientation and
   choosing the other central factor, not an even-dimensional chirality
   splitting for an ungraded odd irreducible module.

## G2. Volume, chirality and exterior-form comparisons

Consume K5's pointwise real Hodge star, characterized by
`α∧*β=⟨α,β⟩vol`, its complex-linear extension and native exterior-power
Gram metric. This finite-dimensional metric package is available before K5's
bundle/analytic Hodge theory and independently of Clifford representations.
G2 supplies its Clifford/chirality comparisons; R7 retains its real-bundle
Weitzenböck/star specialization on the same carrier.

1. Define the normalized complex volume from the native orthogonal product.
   Prove independence under **orientation-preserving** orthonormal changes,
   sign reversal under orientation reversal, Γ²=1 and Γ*=Γ. Prove
   Γa=(−1)^deg(a)aΓ for homogeneous a and the two eigenspace/direct-sum
   decomposition of every finite module. Give canonical projections
   (Id±Γ)/2, and through G1.3's evaluation identify the eigenspaces of E
   with S⁺⊗Hom_Cl(S,E) and S⁻⊗Hom_Cl(S,E). Give restrictions, isometry/duality naturality and the graded algebra
   map to End(S). Identify Γ on the adapted Fock module with exterior parity
   and compare the eigenspaces literally with the supplier's half-spin modules.
   The canonical rank-zero empty frame gives Γ=Id. For every signed rank-zero
   orientation σ∈{±1}, use Γ_σ=σ·Id and interchange the half-spin labels
   for σ=−1; the canonical zero-frame carrier is unchanged.
2. On the shared complexified real exterior algebra, construct
   c(v)=ε(v)−ι(v), with multiplication/Clifford/module comparison to
   `equivExterior`. Prove it is a ℤ/2-graded module for exterior parity,
   with even Clifford elements preserving parity and odd elements reversing it.
   Prove, on degree p,
   `Γω=i^(ℓ+p(p−1))*ω`, including star-square and orientation signs.
   Through the adapted Fock polarization construct the Clifford-module
   identification `Λ*V_ℂ≃S⊗S*≃End(S)`; the Clifford algebra acts by left
   multiplication on End(S). Specify the pairing/intertwiner and its values
   on wedge basis elements: use the inverse Chevalley/antisymmetrization map
   to Cl, then G1.2's normalized Fock action with its normalized metric and the tensor-to-endomorphism
   evaluation map. The increasing orthonormal wedge e_I maps to c(e_I).
   Its exterior Gram metric corresponds to normalized Hilbert–Schmidt
   metric `2^(−ℓ)tr(A†B)` on End(S); with the ordinary tensor/dual metrics
   the squared norm acquires the factor 2^ℓ. Prove this normalization and
   the metric/duality comparisons. Prove the chiral action is
   Γ_S⊗Id, while exterior parity is Γ_S⊗Γ_(S*) with the induced dual parity.
   These are different decompositions of forms.
   Here the induced dual parity is Γ_S transposed. The chirality of the
   reverse-dual Clifford module is `(−1)^ℓ Γ_S^transpose`; prove this
   comparison before identifying any geometric dual half-spin labels.
3. Build graded direct-sum/tensor comparisons for even V and W: the action
   on S_V⊗S_W is `c(v,0)=c_V(v)⊗Id`,
   `c(0,w)=Γ_V⊗c_W(w)`, and Γ_(V⊕W)=Γ_V⊗Γ_W for the ordered product
   orientation. Prove associativity, symmetry with Koszul signs, duality and
   orientation reversal, and compare to `CliffordAlgebra.prodEquiv` and its
   native graded tensor product. No ungraded algebra tensor product replaces
   it. Give the rank-zero unit and the one-plane acceptance computations.
   For any finite-dimensional graded multiplicity space A=A⁺⊕A⁻, construct
   the graded twist S⊗̂A with even part S⁺⊗A⁺⊕S⁻⊗A⁻ and odd part
   S⁺⊗A⁻⊕S⁻⊗A⁺. Its Clifford action is c(v)⊗Id and its tensor grading
   Γ_S⊗γ_A; its intrinsic chiral grading remains Γ_S⊗Id. Give the graded
   evaluation/naturality comparison, including the induced grading on the
   multiplicity space of a graded Clifford module.

## G3. Smooth Clifford bundles and compatible connections

1. Construct the algebra bundle Cl(V,−g) and its complexification from the
   orthonormal frame principal bundle by the supplier's isometry action.
   Build smooth fiberwise unit/product, generator inclusion, grading, star,
   norm and local multiplication formulas. Use the exterior Gram norm
   transported through the Chevalley map, and prove its basis-independence
   and multiplication bounds rather than leaving the norm unspecified. Prove gluing, extensionality,
   pullback along bundle maps, metric isometry naturality and the G1
   complexification/even-algebra comparisons as smooth bundle maps. Apply
   this to TM and T*M using the musical isometry and to pullback/normal bundles.
   For a compact Lie group G with orthogonal ρ:G→O(V), unitary
   μ:G→U(E) and intertwining equality
   c(ρ(g)v)=μ(g)c(v)μ(g)^(−1), descend the algebra/module structures to
   P×_GCl(V), P×_GV and P×_GE for any principal G-bundle P. Prove the
   smooth generator/action/metric comparisons and functoriality; this includes
   the general compact-group course construction, not only the frame case.
   Identify c with the corresponding tensor in V_ℂ*⊗E*⊗E, using finite-
   dimensional Hom/tensor and scalar-extension maps. Prove the intertwining
   equation is equivalent to that tensor being G-fixed, with the induced
   tensor representation written explicitly.
2. A Hermitian Clifford module is an existing smooth finite-rank Hermitian
   vector bundle E with a smooth real-linear c:V→End_ℂ(E) satisfying the
   concrete Clifford and skew-adjoint equalities. It comes with a unital
   algebra-bundle action obtained by the Clifford universal property; prove
   the two presentations equivalent. Define module maps, isometries, direct
   sums, pullbacks, tensor twists and graded modules with anticommutation
   equations, and supply local-frame change and smoothness APIs.
3. For a metric connection on V and a Hermitian connection on E, Clifford
   compatibility is the actual Leibniz identity
   `∇^E_X(c(v)s)=c(∇^V_Xv)s+c(v)∇^E_Xs`. Prove equivalence to ∇c=0,
   affine/skew-adjoint description of compatible connections, induced
   tensor/dual/pullback connections and curvature compatibility
   `[R^E(X,Y),c(v)]=c(R^V(X,Y)v)`. In the principal associated construction,
   use B3's invariant-vector parallel-section theorem on the invariant tensor
   c. The principal connection must induce the prescribed V connection;
   an arbitrary principal connection is not automatically Levi-Civita.
4. On exterior forms build the induced Levi-Civita connection, c=ε−ι,
   Clifford compatibility and the local frame formulas for d and d*;
   G6 then identifies its Dirac operator with d+d*. Pullback of a module
   connection is general bundle functoriality; a pullback does not identify
   tangent Dirac operators on manifolds of different dimensions.

## G4. Spin lifts, obstruction and classification

1. **G4.1a. Topological frame adapters.** For n≥1 consume the native
   positive-form compact real covering
   `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`
   in `Topology/Algebra/CliffordAlgebra/Spin/Covering.lean`, with
   `instCompactSpaceRealCliffordSpinGroupZero` from `Compact.lean` and the
   supplied surjectivity/central two-element kernel. Native
   `pathConnectedSpace_realCliffordSpinGroupZero_add_two` supplies
   path-connectedness for n≥2 independently of this covering.
   Consume `TauCeti.CliffordAlgebra.realCliffordSpinContinuousMulEquivUnitsRange`;
   the canonical topological Spin-to-units-range comparison is already native.
   For SO consume `TauCeti.QuadraticMap.isEmbedding_specialOrthogonalToGeneralLinear`,
   `matrixSpecialOrthogonalEquivWeightedSumSquaresOne`, its forward/inverse
   continuity theorems and
   `mem_range_specialOrthogonalToGeneralLinear_realCliffordForm_iff`, and
   `realCliffordForm_zero_eq_weightedSumSquares_one`.
   Own their general oriented-orthonormal-basis conjugation and vector-action,
   determinant and basis-change laws, and transport the native cover through
   these topological frame adapters, using their native default topologies.
   Include their compatibility with the native
   continuous projection
   `TauCeti.CliffordAlgebra.realCliffordSpinToSpecialOrthogonalRange` and
   `realCliffordSpinToSpecialOrthogonalRange_surjective`. Prove the Spin(2) squaring-cover
   identification. In rank1 prove Spin={±1} and SO={1}. Native Mathlib
   Spin(0), generated by invertible vectors, is {1}; for geometric rank0
   lift data consume G1.1's μ₂⊂Cl(0)=ℝ and construct μ₂→SO(0)={1},
   keeping the native trivial group distinct. All lift/direct-sum formulas use that geometric branch.
   This subsection precedes C3.5 and supplies its frame/rank0 adapters.

   **G4.1b. Smooth refinement.** Consume
   `Geometry/Lie/CliffordAlgebra/Spin/Projection.lean`'s closed-subgroup
   Lie structures on the Spin range in Clifford units and SO range in matrix
   units, `realCliffordSpinToSpecialOrthogonalSmoothRange` and
   `realCliffordSpinToSpecialOrthogonalRangeLieMap_eq_lieMap`.
   Keep these native units-range carriers as the Lie and SBC B2 frame
   structure-group carriers, using SBC B2's explicit
   `Matrix.linftyOpNormedRing` and `Matrix.linftyOpTopologicalSpace`
   instances on the general linear ambient group, as in the native Lie files.
   Opening `Matrix.Norms.Operator` alone does not choose the topology.
   Consume SBC B2's units-level identity homeomorphism from default Pi to
   operator-induced GL topology and restrict it to the SO units range with
   its induced subspace topology; use it to transport G4.1a's covering data.
   Do not introduce second
   smooth structures on the abstract Spin or matrix-submonoid SO carriers.
   Consume `Differential.lean`'s
   `TauCeti.CliffordAlgebra.realCliffordSpinToSpecialOrthogonalCoordinateLieHom_eq_bivectorEquivSo`;
   prove bijectivity of the Lie differential by composing its coordinate
   equivalences. Use
   `leftInvariantDerivationLieEquivGroupLieAlgebra_lieMap` to identify
   the manifold derivative at1; transport by translations and apply native
   `TauCeti.isLocalDiffeomorph_of_mfderiv_eq` to prove local diffeomorphism.
   Refine G4.1a's cover to a smooth covering with smooth evenly covered
   local sections. Own smooth general-basis frame conjugation and the
   smoothness of the composite of G1.1's negative-form comparison
   from the positive Lie units range into the finite-dimensional ambient
   `CliffordAlgebra (realCliffordForm 0 n)`, with its pinned
   bivector/vector-action signs. A second negative-form Lie structure
   is not an input to this composite.
   SpinRepresentations L7 consumes native covering/connectivity for its
   remaining simple-connectivity/universal-cover comparison. This smooth
   refinement is independent of C3.5 and those topological conclusions.
2. On TopologicalKTheory T6.4's continuous principal-bundle carrier and
   CharacteristicClasses C1's actual oriented orthonormal frame bundle,
   use G4.1a's native Spin units range when n≥1 and G1.1's
   μ₂=`evenUnitaryGroup (realCliffordForm 0 0)` when n=0 as the
   topological structure group. Smooth bundles use G4.1b's Lie structure
   for n≥1. For rank0 equip G1.1's same μ₂ subgroup of Cl(0)ˣ with
   `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`'s
   embedded Lie-subgroup data. Prove its Lie algebra is zero and its induced
   topology discrete, giving the zero-dimensional smooth structure.
   A spin structure on an
   oriented metric V of rank n is a numerable principal Spin(n)-bundle P with an equivariant map P→Fr⁺_SO(V) over the
   identity, inducing an isomorphism `P×_Spin SO(n)≃Fr⁺_SO(V)`.
   Define equivalences, pullback and descent; prove metric-change independence
   by constructing the unique positive g-self-adjoint B with
   g'(u,v)=g(Bu,v), its positive square root, and the frame map B^(−1/2).
   Prove smooth dependence through the invertible Sylvester differential
   H↦B^(1/2)H+HB^(1/2), and naturality under pullback and bundle isometries.
   Compare composite metric changes through homotopies in the contractible
   positive-metric space; noncommuting square roots need not compose literally.
   A lift is data, not merely the proposition w₂(V)=0. For a smooth base
   prove each continuous lift has the unique smooth structure transported
   through its covering of the smooth oriented frame bundle.
3. For smooth bases choose good-cover orthonormal transitions and local lifts
   to Spin. For a general paracompact numerable base, consume C3.5's
   atlas-refinement/local-lifting construction using locally finite shrinkings
   and evenly covered neighborhoods; specialize it to the frame bundle. Use the locally constant Z/2 coefficient sheaf in its Čech groups.
   Apply C3.5's universal cocycle construction and its independence,
   naturality and w₂ comparison to this frame bundle. Identify the
   pulled-back cocycle as the local triple-product discrepancy. Prove a spin
   structure exists iff
   this class vanishes, by correcting lifted transitions with a 1-cochain
   and gluing. In the smooth setting use locally constant central cochains
   and B1 descent. Identify singular w₂ on paracompact Hausdorff CW-type bases; do not assert
   singular/Čech equality for arbitrary paracompact spaces.
4. Given one lift, twist by a principal Z/2-bundle. Prove this action is free
   and transitive on equivalence classes, giving an H¹(X;Z/2) torsor, with
   explicit relative gauge transformations and cocycle comparisons. Construct
   product/direct-sum lifts using `(Spin(m)×Spin(n))/{(1,1),(−1,−1)}`
   and the actual homomorphism to Spin(m+n). Pin the ordered orientations,
   associativity, pullback and metric-change maps, and their low-rank central
   kernels, using the μ₂ geometric branch whenever a rank is 0. The rank 0
   frame bundle is C1's canonical oriented zero-frame bundle; retain any
   additional rank-zero orientation sign as separate data in chirality and
   characteristic comparisons. The rank 0 unit is the trivial μ₂ lift; an arbitrary rank 0 lift acts by its central
   flat-line twist. This is a construction on supplied bundles, not an assertion
   that every oriented bundle is spin.

## G5. Spinor bundles, chiral products and rank-two roots

1. Associate the irreducible complex spin representation to a chosen lift;
   build S(V), its positive metric, Clifford action and, in even dimension,
   the G2 half-spin subbundles. Give local transition/rank formulas,
   functoriality under spin isometries, pullback, orientation reversal and
   change of spin structure by a flat central line. In odd dimension retain
   the chosen Clifford factor for S(V), and also construct the faithful
   ungraded module S_odd^+⊕S_odd^- from both ω-labeled factors, with its
   metric and diagonal action/connection. This is the source's “complex
   spinor module”; its factor labels are not an even-dimensional chiral
   grading. The chosen-factor geometric spinor has half its rank. Lift the metric connection through the Lie
   algebra isomorphism to the principal spin connection; construct its
   compatible spinor connection and curvature formula. For TM use precisely
   the Levi-Civita connection, and prove Γ parallel.
2. Prove the smooth bundle version of G2's graded tensor product for direct
   sum spin lifts. On compact bases, in TopologicalKTheory T2's supplied K-ring derive
   `[S⁺(V⊕W)]−[S⁻(V⊕W)]=([S⁺(V)]−[S⁻(V)])([S⁺(W)]−[S⁻(W)])`.
   Keep actual spin structures and intertwiners in the bundle theorem; an
   equality of ungraded ranks alone does not prove this formula.
3. For an oriented metric two-plane bundle let E=(V,J), J the positive
   quarter-turn. Pin the spin parameter
   `z=cos θ+sin θ e₁e₂` in Cl(V,−g), whose conjugation rotates V by
   2θ. The corresponding positive-form units-range element is
   `cos θ−sin θ e₁e₂` by G1.1's bivector sign. Thus E has
   weight z². With the G1 Fock action and Γ=i c(e₁)c(e₂), S⁺ has weight
   z^(−1) and S⁻ weight z. Thus `(S⁺)²≃E*`, `(S⁻)²≃E` and
   `S⁻≃(S⁺)*`. Prove the equivalence of spin lifts with Hermitian line
   square roots of E (including the root isomorphism), and construct the
   connections with curvature halving. The labels must obey these explicit
   characters; reversing the orientation interchanges them. The course's
   unqualified S⁺²=E must be translated to this convention.

## G6. Dirac operators and curvature formulas

1. On a Riemannian manifold with a Clifford module for TM and a compatible
   connection define D=Σc(e_j)∇_(e_j) on smooth sections. Prove frame
   independence, first-order locality, Leibniz rule D(fs)=c((df)♯)s+fDs,
   smoothness, the pinned symbols and ellipticity. On compactly supported
   sections prove the formal adjoint integration identity; on a closed base
   give the shared H¹→L² realization and its self-adjoint closed extension.
   Use K5/PDO estimates and density to prove compact resolvent and smooth
   finite-dimensional kernel, with Sobolev-order comparison. The full
   self-adjoint Dirac index is zero; chiral D⁺ may have nonzero index. For
   even-dimensional graded spin modules,
   prove DΓ=−ΓD and D=(0 D⁻;D⁺ 0), using Γ parallel and vector
   anticommutation. Prove the formal L² adjoint of D⁺ is D⁻; on a closed
   base prove their closed unbounded L² realizations are adjoints with H¹
   domains. Keep this distinct from the bounded Hilbert adjoint of H¹→L².
   Here columns and rows are ordered (S⁺,S⁻), D⁺ maps S⁺→S⁻ and D⁻
   maps S⁻→S⁺. Matrix displays using the opposite off-diagonal labels are
   translated through these domain/codomain conventions. In particular
   In the ordered splitting S=S⁺⊕S⁻, D has blocks (0 D⁺;D⁻ 0); its symbol triple
   [S⁺,S⁻,c] fixes D⁺:S⁺→S⁻, so the ordered block here corrects that
   source-level label/order mismatch.
2. Prove D²=∇*∇+Σ_(i<j)c(e_i)c(e_j)R^E(e_i,e_j), including the curvature
   contraction and normal-frame calculation. This is the connection-induced
   Dirac operator; an arbitrary first-order Dirac-type operator may carry an
   additional zero-order term. Compare its Bochner connection with PDO P1's
   canonical construction and its Laplace-type realization with K5.
3. For the spin connection prove
   `R^S(X,Y)=¼Σ_(i,j)⟨R(X,Y)e_i,e_j⟩c(e_i)c(e_j)` and
   `D_S²=∇*∇+Scal/4`. For a Hermitian twist W with connection prove
   `D_W²=∇*∇+Scal/4+Σ_(i<j)c(e_i)c(e_j)⊗F^W(e_i,e_j)`.
   Build gauge/isometry naturality and direct-sum/product formulas before
   deriving the compact positive-scalar-curvature absence of harmonic
   spinors, the nonnegative case's parallel-spinor conclusion and the
   corresponding twisted curvature-positivity criterion. Numerical topological
   index obstructions are outside this development.
4. On exterior forms prove D=d+d*, D² the nonnegative Hodge Laplacian and
   recover R7's real Weitzenböck curvature term. Exterior parity gives the
   Euler operator; G2's chiral grading gives the signature operator on
   even-dimensional oriented bases. Prove DΓ=−ΓD, the block/formal-adjoint
   comparison and harmonic-kernel identification. The numerical Euler/signature
   formulas are outside this geometric
   development; retain the operator and harmonic-space identifications.
5. Acceptance cases include the flat Euclidean operator, periodic and
   antiperiodic spin structures on the flat circle of length 2π, with their
   integer/half-integer Fourier spectra and kernels: the periodic kernel has
   complex dimension 1 and the antiperiodic kernel is 0. Include product tori
   with all H¹ spin twists, round-sphere
   positive-scalar-curvature kernel vanishing. The periodic lift is the
   disconnected trivial Spin(1)=Z/2 cover of the oriented circle frame bundle;
   the antiperiodic lift is its connected double cover.
   Construct the spin structures: trivial tangent frames for Euclidean space,
   circle and tori; for Sⁿ use TSⁿ⊕ℝ≃Sⁿ×ℝ^(n+1), with the radial normal
   section, the universal w₂ Whitney formula and G4's existence theorem.
   Identify the two circle lifts and all torus lifts through the actual H¹
   calculations. Use the shared Riemannian distance/metric structures and
   the induced Fourier/L² normalization in the spectral calculations.
   Circle spinors are ungraded; no even-dimensional half-spin decomposition
   is imposed there.
6. On a closed even-dimensional spin manifold construct the exact-off-zero
   bundle triple `(π*S⁺,π*S⁻,c(v))` on TM. Through TopologicalKTheory T3
   export its compact-support class in K_c(TM); its support is the compact
   zero section. Prove metric-musical comparison with the T*M carrier and
   the phase homotopy between c(v) and the Fourier symbol i c(v), preserving
   invertibility away from zero. Export the graded product, pullback along
   spin isometries and twisted-bundle comparisons. Numerical analytic versus
   topological index equality is outside this roadmap.

## Dependency order and references

G1–G2 use the algebraic suppliers and pointwise exterior metrics, before
bundle analysis. G3 uses SBC and the Levi-Civita carrier. Native compact-real
covering/connectivity supply G4.1a's topological frame/rank0 adapters and
SpinRepresentations L7's remaining universal-cover comparison. The item order
is G4.1a → CharacteristicClasses C3.5 → G4.3. G4.1b's smooth refinement
uses G4.1a and native Lie differential APIs, independently of C3.5.
G4.4's torsor uses a given lift and central-bundle descent independently of
that obstruction equality. G5 follows G1–G4. G6 follows G3/G5 and uses
K5/PDO analysis; the exterior instance only needs G2/G3. Numerical topological index theorems are separate consumers of this development. For each object supply constructors/characterization,
extensionality, regularity, naturality, local-frame/gluing comparison and edge
cases, not only the headline theorem.

- H. B. Lawson and M.-L. Michelsohn, *Spin Geometry* (1989), Chapters I–II:
  algebraic module suppliers, spin structures, spinor bundles and Dirac
  operators; Chapter II's curvature formulas and Lichnerowicz theorem.
  Their negative-first Clifford signature is the reversed order of
  `TauCeti.realCliffordForm p q`.
- L. Nicolaescu, [*Lectures on the Geometry of Manifolds*](https://www3.nd.edu/~lnicolae/Lectures.pdf),
  Clifford modules and Dirac operators, for metric/chirality/bundle comparisons.
- M. F. Atiyah, R. Bott and A. Shapiro,
  [*Clifford modules*](https://doi.org/10.1016/0040-9383(64)90003-5), for
  graded products and the distinction between algebraic and topological classes.
- The [Mathlib contraction API](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.html)
  and [Zulip reference discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/References.20in.20QuadraticForm.20and.20CliffordAlgebra.2EContraction/near/400464524)
  fix the native algebra/exterior vocabulary. Mathlib
  [#41920](https://github.com/leanprover-community/mathlib4/pull/41920)
  studies the positive-form pseudoscalar, so its square is translated through
  G1 rather than copied to the negative metric. Follow
  [#44146](https://github.com/leanprover-community/mathlib4/pull/44146)'s basis
  construction if adopted by Mathlib; build required interfaces in Tau Ceti
  now and replace equivalent declarations when supplied.


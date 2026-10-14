# Morse functions, sublevel topology and Morse–Bott attachments

Develop the finite-dimensional topology of Morse and Morse–Bott functions:
intrinsic Hessians and indices, normal forms, genericity, deformation of
sublevels, handles and cells, proper exhaustions, strong inequalities and
critical-submanifold attachments and compact-trapped gradient convergence.
The resulting library supplies geodesic Morse theory,
[AffineMorseLefschetz](../AffineMorseLefschetz/README.md) and Hamiltonian moment-map topology.

## Scope, conventions and dependencies

Use finite-dimensional real smooth Hausdorff second-countable manifolds with
boundaryless models. Compactness, properness, a lower bound, and compactness of
a particular level band are separate hypotheses. A Morse function means smooth
with nondegenerate critical points; do not incorporate properness or
Palais–Smale into that predicate. Cobordisms here are the compact bands
f⁻¹([a,b]) inside a boundaryless manifold, with regular boundary levels;
they use DifferentialGeometry 5.1's boundary model and GeometricTopology
Layer 1's collars. The general
boundary-critical-point and infinite-dimensional theories are separate from
these regular-level cobordisms.

Use actual Tau Ceti `IsManifoldNondegenerateCriticalPoint`, `IsMorse`,
`IsMorseOn` and `manifoldMorseIndex`, from
`Geometry/Manifold/Morse/{Basic,Index}`. The vector-space suppliers are
`Analysis/Calculus/Morse/{Basic,NormalForm,Generic}`, including
`IsNondegenerateCriticalPoint.exists_morse_chart` and the small linear-
perturbation theorem. Consume `MDifferentiableAt.mvfderiv_eq_fderiv_comp_extChartAt_symm`,
`manifoldMorseIndex_le_finrank`, the complementary-index theorem,
`manifoldMorseIndex_comp_fst_add_comp_snd`, and `Morse/Sphere/{Basic,Prod}`.
Consume the manifold `TauCeti.MorseChart` and
`IsManifoldNondegenerateCriticalPoint.nonempty_morseChart` from
`Geometry/Manifold/Morse/Lemma`; its quadratic equation carries a factor 1/2
and an unordered list of ±1 weights. M1 supplies arbitrary-model transport,
ordering/scaling and intrinsic-Hessian comparisons.
Own recharting a boundaryless I-manifold as an `𝓘(ℝ,E)`-manifold through the
model's open-range identification, with `mfderiv`, `ContMDiff`, critical/index
and `IsAdaptedPseudoGradient` comparisons. All arbitrary-model consumers use
this same transport. Use Mathlib `PartialDiffeomorph`, `IsProperMap`, `CWComplex`, `RelCWComplex`,
`ContinuousMap.HomotopyEquiv` and native singular (co)homology.

[DG Layers 3,5,10,12](../DifferentialGeometry/README.md) supply flows, boundaries,
partitions of unity, sharp finite-dimensional Sard, metrics and Hessians.
[AlgebraicTopology Stages 2–8](../AlgebraicTopology/README.md) supply relative
chains, cofibrations, cellular/singular comparison, products, integral duality
and relative homotopy. [GT Layer 1](../GeometricTopology/README.md) supplies
normal/tubular geometry, collars, handle gluing and disc bundles; [CharacteristicClasses C2](../CharacteristicClasses/README.md)
supplies ordinary Thom classes and their local orientation coefficients.

This roadmap owns ordinary finite Morse deformation/attachment and their
abstract Morse–Bott extension. RiemannianGeometry R3 owns the broken-geodesic
vertex carrier, Jacobi/index comparison and path-space limit, consuming this
core. The symmetric-space and Bott applications use the same broken-path
carrier and the attachments here, following
[HomotopySpheres §4B](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284).
[HeegaardFloer Lane M](../HeegaardFloer/README.md) owns stable/unstable
manifolds, Morse–Smale trajectory spaces, compactification/gluing, Morse
homology and its singular comparison. It consumes the finite Morse core here;
this roadmap does not construct a second trajectory complex.

At a critical point the Hessian is d²f, with no factor 1/2. A normalized Morse
chart has `f=f(p)−Σ_(i<λ)y_i²+Σ_(i≥λ)y_i²`, hence Hessian diagonal ±2.
λ is the negative inertia index. Gradient descent uses −grad f. Set
`M_a={x | f(x)≤a}`; regular-level deformation fixes M_a pointwise. Different
metrics change gradients and flow parametrizations but not the Hessian/index
at a critical point or the sublevel homotopy conclusions.

## M1. Critical Hessians, indices and usable normal forms

Define the critical set as `{x | mvfderiv I f x = 0}` and consume its native
preferred-chart comparison. Define the critical Hessian as a symmetric
continuous bilinear form on `TangentSpace I x`, transported from d²f in the
preferred extended chart under the hypothesis df_x=0. Prove it is independent
of coordinates and connection, and identify
it with DG's Hessian for every chosen smooth metric. Prove symmetry, change of
coordinates by congruence, inertia invariance, λ≤dim M, complementary index
under f↦−f, and direct-sum/product additivity. Keep the noncritical Hessian's
connection dependence explicit. Give the tangent-quadratic-form and matrix
comparisons, restrictions to subspaces and positivity/negativity tests.

Extend the native manifold Morse chart to an actual partial diffeomorphism
for every boundaryless model, with a Euclidean target and center 0. Compose its
linear coordinate map with an index-ordering permutation and division by √2,
using `exists_hessianQuadraticForm_equivalent_weightedSumSquares`; prove both smooth maps and the
normalized sum-of-squares equation on the whole source. Derive isolation,
strict local minima/maxima, the two-dimensional saddle model and finite critical
sets on compact subsets for a global Morse function. Consume native
`IsMorse.finite_setOf_mfderiv_eq_zero` and `MorseChart.mfderiv_eq_zero_iff`
for compact standard-model manifolds, extending them to compact subsets and
the shared arbitrary-model transport. Define chartwise C^k
seminorm neighborhoods on fixed compact coordinate sets before using them.
Prove persistence of
nondegenerate critical points under small C² perturbations on fixed compact
neighborhoods, with the implicit-function critical-point continuation, index
and value dependence. Construct critical counts with extended natural/cardinal
values first; use finite natural counts only after the relevant compactness
proof, avoiding junk values on infinite critical sets.

## M2. Compact-band deformation, handles and cells

If a<b are regular values, f⁻¹([a,b]) is compact and has no critical points,
consume [LieGroupoidsPoisson G0.1](../LieGroupoidsPoisson/README.md)'s regular-
level manifold and tangent-kernel construction. Build regular sublevels and
bands as actual manifolds with boundary by the submersion coordinate normal
form. For dimension m>0 choose the same continuous linear equivalence
E≃ℝ^m throughout the model comparison and put the inward half-space coordinate
in Mathlib's coordinate 0; the model is `𝓡∂ m` with `NeZero m`.
For M_a={f≤a} that coordinate is a−f; for the band use f−a at its lower
boundary and b−f at its upper boundary. Prove the
boundary is the corresponding regular level, its induced smooth structure
agrees with G0.1, and pin the band boundary co-orientations by −grad f
at the lower level and +grad f at the upper level. When M is oriented,
identify the induced `boundaryOrientation`; do not assume orientability
(Lee, Smooth Manifolds, Proposition 5.47).
In dimension 0 regular level fibers and critical-free bands are empty; their
sublevels are clopen boundaryless 0-manifolds, without a half-space model.
Construct the normalized-gradient deformation retract M_b→M_a. The field
is −grad f/|grad f|² on that band; build a smooth cutoff extension, prove flow
existence up to the prescribed hitting time and continuity at the fixed
sublevel. Construct the regular-band product homeomorphism
`f⁻¹[a,b]≃f⁻¹(a)×[a,b]`, preserving the value coordinate, with a smooth
interior diffeomorphism and smooth maps between the corresponding boundary
pieces. Use their own product/interior models; do not identify the cornered
product model with the half-space model. Construct a
homeomorphism of M_b with M_a carrying f⁻¹(b) onto f⁻¹(a). Identify a sufficiently
small local minimum sublevel component inside its Morse neighborhood with a
closed disc, and the opposite local maximum statement. For a unique global
minimum with compact sublevels prove the sufficiently small whole sublevel
has this disc description.
Prove restriction to smaller regular bands commutes up to relative homotopy
and the retraction homotopy fixes M_a throughout.
Completeness of an arbitrary metric alone is not a compactness argument for
this flow.
Consume native `IsAdaptedPseudoGradient` from
`Geometry/Manifold/Morse/PseudoGradient/Basic`,
`IsMorse.exists_isAdaptedPseudoGradient` from `PseudoGradient/Existence`,
`PseudoGradient/Local`'s `MorseChart.linearFlow` and coordinate-flow laws,
`PseudoGradient/Flow`'s smooth flow/diffeomorphism/energy and convergence
statements, and `PseudoGradient/Energy`'s trajectory energy identity.
`PseudoGradient/Gradient` compares metric gradients when the chosen metric is
Euclidean in its Morse charts; it does not cover every smooth metric.
Native `Analysis/Calculus/Morse/CompactSublevel` gives vector-space orbit/
trajectory compactness, not a cell-attachment or band deformation. Extend
compact-manifold pseudo-gradient existence to a neighborhood of a specified
compact level band by a finite cover, with the field unchanged on chosen
smaller critical charts. For each compact critical-free band use a positive
smooth rescaling giving df(X)=−1; compare the resulting descending
deformation with the normalized-gradient construction, including hitting
times and the fixed lower sublevel.

Across one critical value with finitely many nondegenerate points and compact
band, attach one index-λ handle D^λ×D^(m−λ) at each point using disjoint M1
charts. The handle conclusion is a homeomorphism with the topological handle
adjunction along ∂D^λ×D^(m−λ), respecting the regular boundary away from
the attachment; no diffeomorphism of a cornered handle space is asserted.
Build the modified-function/cutoff deformation, control all chart
boundaries and prove continuity of the local modified-function deformation.
Consume GT's collars for the attaching-face boundary identifications and
native TopCat pushouts for the topological handle adjunction. Give the homotopy cell attachment directly,
without needing a corner-smoothing theorem, and specify characteristic and
attaching maps. Prove the homotopy class of the attaching map into M_(c−ε)
is independent of auxiliary chart/metric choices, with identifications of the
regular lower sublevel explicit. The cell-attachment comparison homotopy fixes
that entire lower sublevel pointwise; prove this before compactification gluing.
Include simultaneous critical points, index 0 and top-index cases.

Iterate finite critical levels to construct compatible relative CW models for
sublevel pairs. For a proper bounded-below Morse function, choose an exhausting
sequence of regular levels with finite critical sets at each stage, prove the
cofibration/compatibility statements and pass to a genuine CW complex homotopy
equivalent to M with one λ-cell per critical point. Consume Mathlib TopCat
pushouts and general `RelativeCellComplex` for critical-level-ordered mixed-
dimension attachments. At each finite critical stage construct the classical
finite CW model inductively on the pushout, proving its cell/weak-topology
properties before using cellular approximation. Apply AT
Stage 4 cellular approximation to each attaching map into the existing model's
(λ−1)-skeleton, with its homotopy comparison; critical-value order need not
agree with cell dimension. At the infinite union reindex the resulting cellular attachments by
dimension to obtain `TopCat.RelativeCWComplex` and prove the dimension-filtered
and critical-level colimit topologies agree. Prove closure-finiteness and weak
topology and the classical `Topology.CWComplex`/`RelCWComplex` comparison on
that realization. Prove homotopic
attaching maps give homotopy-equivalent spaces and a homotopy equivalence of
bases extends over matched attached cells (Milnor Lemmas 3.6–3.7). Build the
mapping telescope of the compatible sublevel/CW sequence using AT Stage 4's
cylinders and cofibrations, and prove its comparison with the exhausted
manifold and the CW realization. Prove strictly compatible levelwise homotopy
equivalences induce a homotopy equivalence of mapping telescopes, constructing
compatible inverse maps and cylinder homotopies. Give compact-family
factorization and coherent homotopies. Compact M gives a finite CW model. For regular-level compact
cobordisms build the relative version from the incoming boundary, with outgoing
boundary identified by the opposite function and complementary indices.

## M3. Approximation and proper Morse exhaustions

On native smooth maps `C^∞⟮I,M;ℝ⟯`, define strong C^k neighborhoods by a
locally finite compact chart family and a positive tolerance on each member,
bounding every coordinate derivative of order≤k. Define the strong smooth
topology as generated by these neighborhoods for all finite k, without
unbounded derivative orders varying per chart. Prove chart-family independence
and agreement with compact C^k seminorm neighborhoods when M is compact.
Prove every smooth function can be approximated by Morse functions in this
topology. Use native local
linear perturbations and DG Sard, multiply them by cutoffs, and run a compact
exhaustion construction. Choose perturbations with summable C^k bounds on each
fixed compact set and with tails preserving earlier C² nondegeneracy. Prove
smooth convergence, persistence on every exhaustion interior, and the prescribed
fine error bounds for every prescribed finite-order neighborhood. This gives the global theorem without an unstated Baire
space or transversality theorem on a function space.

For a proper bounded-below input preserve those properties by a global C⁰
error less than 1. Prove existence of a smooth proper bounded-below exhaustion
on every manifold here using a compact exhaustion and a locally finite smooth
partition of unity, then its Morse approximation. Give relative approximation
which fixes a neighborhood of a prescribed closed set where the function is
already Morse, with compact-support control for local perturbations. Include
M1's continuous/smooth finite parameter dependence of nondegenerate critical
branches; do not claim every parameter value of a generic family is Morse
through birth-death events. General exhaustion existence here is separate
from RiemannianGeometry R6's distance exhaustion for a given closed embedding.

## M4. Strong inequalities and topology tests

For compact M and a field k let c_j be the finite count of index-j critical
points and b_j=dim_k H_j(M;k), using actual singular homology. From the cellular
complex of M2 prove

`Σ c_j t^j = Σ b_j t^j + (1+t)Q(t)`, with Q∈ℕ[t].

Identify Q's coefficients with the ranks of adjacent boundary maps; derive
all strong alternating inequalities, the weak inequalities, Euler equality
and total-critical-point lower bounds. Weak inequalities plus Euler equality
alone do not prove nonnegative coefficients of Q. Extend the statements to
regular sublevel/cobordism pairs and finite critical-band intervals, with the
relative homology maps visible.

Prove subgroups of free abelian groups of arbitrary rank are free, using a
well-order filtration and compatible basis extension over successive rank-one
quotients; apply it to the top cellular kernel, including countably many cells.
Thus top cellular homology of a d-dimensional CW model is free abelian and
cohomology above d vanishes by AT Stage 6.1's integral UCT. Do not infer that degree-d integral
cohomology is torsion-free. Apply the proper-index≤d version of M2 to obtain
those conclusions for noncompact M.

Acceptance: standard height on S^m; cosine functions on T^m with binomial
critical counts; the two-dimensional torus's minimum/saddles/maximum; explicit
integer counts satisfying weak inequalities/Euler but violating a strong
inequality; and closed connected positive-dimensional M with exactly two
critical points is homeomorphic to a sphere. The last conclusion follows from
two disc handles and the topological radial extension of the boundary gluing;
no diffeomorphism-to-standard-sphere assertion is made. Complex projective
moment functions use CKG K7's actual projective carrier and yield one critical
point in each even index 0,…,2n, compared with CKG K7's cellular calculation.
Also prove critical-count parity equals Euler-characteristic parity, sphere
critical counts are even, and closed odd-dimensional manifolds have Euler
characteristic 0 by comparing f and −f. The equality is
`c_j(−f)=c_(m−j)(f)` for 0≤j≤m, not symmetry of the counts of an arbitrary single f.
For RP² consume AlgebraicTopology AT4.6's single projectivization/manifold/CW
carrier and use the quadratic coordinate function with three distinct weights:
three critical points and no perfect Morse function over ℚ, contrasted with
its perfect F₂ count. More generally π₁(M)≠0 and b₁(M;ℚ)=0 obstruct
perfection over ℚ by the necessary 1-cells in a connected CW model.

## M5. Morse–Bott normal bundles and attachments

Define Morse–Bott intrinsically: the critical locus near each critical point
is a smooth submanifold and ker Hess=T C. Use a locally finite family of
embeddings i_a:S_a→M, each with its own model/dimension, whose images are the
critical components; pin the normal Hessian on GT Layer 1's general normal
bundle. Build positive/negative normal subbundles and smooth spectral
projections by extending native `Morse/SpectralSplitting` to these families.
Prove rank local constancy and independence of their isomorphism class from
the metric; the actual subspaces can depend on that metric. Build smooth
square-root/inverse-square-root operations on positive matrices from native
`sqrtNearOne`, with local conjugation and uniqueness/naturality to glue;
prove chart/frame compatibility without assuming smooth eigenbases.

Prove the parametric Morse lemma on GT's actual normal bundle, fixing the zero
section and carrying f to its positive-minus-negative fiber quadratic form.
Own the base-dependent parametric congruence lemma extending native
`exists_congruence_of_symmetric_family`: both reference B₀(b) and perturbed
form vary smoothly with b. Give the integral-Hessian formula, compact-base
bounds, local fiber inversion and compatibility with bundle transitions;
patch the changes to a neighborhood of the zero section.
For a compact critical component and a compact isolated critical band, attach
the negative disc bundle, give the relative homotopy equivalence and identify
the resulting relative homology with H_(j−λ)(C;orientation(ν⁻)). Use Thom
local coefficients, or F₂; untwisted integral/rational coefficients require the
negative-bundle orientation. Include multiple critical components and prove
compatibility with regular-band deformation.

Consume [DGFloer Layer 1 item 3](../DGFloer/README.md)'s generic filtered-complex
`SpectralObject`, independently of its trajectory layers. Construct the
critical-band filtration and identify its spectral sequence, naturality
and finite convergence on compact M. Deduce Morse–Bott strong inequalities
with the shifted critical-component Betti polynomials and the correct negative-
orientation coefficients. Prove the ordinary Morse specialization is M2/M4.
Hamiltonian [ConvexityToric T2](../SymplecticGeometry/ConvexityToric/README.md) consumes this attachment theorem and supplies
complex negative bundles/equivariant perfection; Riemannian/PR284 path
applications supply their own critical components and Jacobi negative bundles.

## M6. Gradient convergence and exponential decay

Consume `TauCeti.Manifold.riemannianGradient`, DG's maximal smooth gradient
flow and native vector-space
`Morse/{GradientFlow,Convergence,Linearization,ExponentialConvergence}` estimates,
including `IsIntegralCurveOn.exists_tendsto_atTop`,
`exists_sub_le_mul_exp_atTop` and `exists_norm_sub_le_mul_exp_atTop` and their
atBot versions. Consume `Geometry/Manifold/IntegralCurve/GlobalFlow` and
`PseudoGradient/Flow`'s compact-manifold convergence. Extend the fixed-inner-
product estimates to variable Riemannian metric gradients, which need not
be adapted pseudo-gradients, and compact trapping inside noncompact manifolds.
For a forward
negative-gradient trajectory trapped in a compact set, prove global forward
existence, energy monotonicity and dissipation. Construct its nonempty
connected omega-limit set, show it consists of critical points using flow
invariance and dissipation, and use finiteness of the critical set to identify
a single limit p. A proper bounded-below Morse function traps every forward
trajectory in its initial compact sublevel, giving that corollary.

Transport native `exists_mul_abs_sub_le_norm_gradient_sq` to manifold charts
with equivalent metric norms. Prove locally `|f−f(p)|≤C‖grad f‖²` and
two-sided gradient/distance estimates. On a convergent descending trajectory
E(t)=f(γ(t))−f(p)≥0; derive exponential decay of E and bound tail length by
a constant times √E using its derivative and dissipation. Deduce
`dist(γ(t),p)≤C' exp(−ct)` after a finite entry time. Treat an equilibrium
separately; a saddle limit does not require local positivity of f−f(p).

Use normalized-gradient reparametrization only on compact critical-free
bands in M2; it need not be complete near a critical point. Closedness and
isolation of the critical set supply finiteness on compact sets. Prove the
proper/bounded-below and compact-trapped corollaries with these explicit
hypotheses.

## References and course targets

- Milnor, *Morse Theory*, §§2–6 for local/deformation/CW/inequality proofs.
- Cohen, Iga and Norbury, [Topics in Morse Theory](https://math.stanford.edu/~ralph/morsecourse/biglectures.pdf),
  classical part, for manifold normal forms, sublevels and cellular comparison.
- Thomas Mark's *Math240 Riemannian Geometry* lecture/homework notes,
  2001 lectures and Homework 11, catalogued separately in the course-source
  audit, supply the
  local/handle/CW/strong-inequality and Morse–Bott acceptance targets above.
  Their global “Morse” convention is handled by separate properness/compact-band
  hypotheses, matching native Tau Ceti's predicate.

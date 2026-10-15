# Complex manifolds, Dolbeault theory, and Kähler geometry

Develop the local analytic and differential geometry of complex manifolds, holomorphic
bundles, Dolbeault cohomology and compact Hermitian/Kähler Hodge theory. The development
includes analytic germs and subvarieties, canonical Hermitian connections, duality and
explicit projective, torus and non-Kähler examples. These are reusable theories with basic
calculus and functorial APIs, not only statements of Hodge decomposition or the Kähler
identities.

## Conventions and suppliers

Manifolds are finite-dimensional, Hausdorff and second-countable, without boundary;
compactness and connectedness are stated where used. Complex manifolds use Mathlib's
complex `IsManifold`; holomorphic means `MDifferentiable ℂ` in charts. K3.0 proves its
equivalence to complex analytic and complex `ContMDiff ∞` maps in finite dimensions. Their
real scalar restriction, holomorphic quotients, open gluing and holomorphic vector-bundle
objects follow the [ComplexManifolds proposal
#279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279). Its Milestones
1 and 2 supply real restriction, atlas transport, the canonical complex
orientation and its compatibility laws in DG's orientation carrier. Milestone 3
owns the OnePoint complex atlas consumed by K7.1; Milestones
4–6 own discrete holomorphic quotients, open gluing and their topology;
Milestone 7 owns the holomorphic-transition mixin, bundle cocycle gluing
and operations on native vector bundles. Consume these specified Tau Ceti
targets, including their model and tangent comparisons; the milestone references
are pinned to the [ComplexManifolds contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/581f66fed0f12fe49b8f5dd96aa18d3e435c190a/TauCetiRoadmap/ComplexManifolds/README.md).
Complex-torus quotients follow
[#280](https://github.com/TauCetiProject/TauCetiRoadmap/pull/280) Milestone 1, with the fixed-torus
theory used in K7 and the [specified ComplexTori contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/583f86009a6841d01e758fdefec6ff41014b2f6a/TauCetiRoadmap/ComplexTori/README.md).

Use [DifferentialGeometry](../DifferentialGeometry/README.md)'s generic smooth forms,
exterior derivative, pullback, wedge, integration, Stokes and de Rham comparison. Its chain integration and Stokes already allow complete vector-valued coefficients;
its de Rham comparison is stated over ℝ. K5a owns the complex-linear manifold
integration compatibility and complex-coefficient de Rham comparison on the same
generic form carrier, viewed over ℝ; do not construct a second form carrier.
Consume [RealAlgebraicGeometry Layer 7](../RealAlgebraicGeometry/README.md#layer-7-analytic-preparation-and-mccallum-projection)
for analytic inversion and local real-germ complexification in model spaces;
consume the native joint analytic implicit-function theorem as specified in K1,
which owns the complex-manifold, chart and local-uniqueness adapters.
[SmoothBundlesConnections](../SmoothBundlesConnections/README.md) supplies real smooth
bundles with complex structure, tensor/dual/Hom/complexification, Hermitian metrics,
connections, curvature and their principal-bundle comparison maps. [PDE](../PDE/README.md)
supplies scalar real-domain Sobolev, embedding, Rellich and elliptic estimates, not system
estimates. [PseudodifferentialOperators P1.0](../PseudodifferentialOperators/README.md)
supplies differential-operator carriers, jets, symbols and formal density adjoints
after K5a's initial density-line construction and before its analytic scale.
K5 owns generic finite-rank real/complex bundle distributions,
the all-real-order Hilbert scale, smooth Laplace-type regularity, pointwise real
Hodge star and real/complex Hodge theory. The later pseudodifferential calculus
and its Peetre theorem consume that analysis; K5a's analytic operator layer
consumes only P1.0. The initial pointwise star and density layer consumes no PDO.
[AlgebraicTopology](../AlgebraicTopology/README.md) owns singular cohomology
and products. The linear Hodge-structure objects in `Completed/HodgeStructures` are a
target for K6's comparison, not a proof of analytic Hodge theory.

The complex structure J has `J²=-1`; `T^(1,0)` and `T^(0,1)` are its `+i` and `−i`
eigensubbundles in `TM⊗ℂ`. Define the type projections explicitly. Write `d=∂+∂̄` on an
integrable complex manifold and `d^c=i(∂̄−∂)`, so `dd^c=2i∂∂̄`. Hermitian inner products
are conjugate-linear in the first argument and linear in the second. For a real Hermitian
metric and its fundamental form, pin `g(u,v)=ω(u,Jv)`; positivity and compatibility are
Tau Ceti's `SmoothTwoForm.Compatible` convention. The definitive degree-two
carrier is DG0.4's `SmoothForm I M ℝ 2`, with closedness `mextDeriv ω = 0`.
Transport the pinned native two-form compatibility and closedness API through
DG0.4's `legacySmoothTwoFormEquiv` and
`legacySmoothTwoFormEquiv_isClosed_iff`; the prototypes use that native
carrier to pin these preservation laws during its migration. No independent
two-form carrier is introduced. On `(TM,J)` set
`h_T(u,v)=g(u,v)+iω(u,v)` (conjugate-linear first slot). Transport through
`u↦u^(1,0)=(u−iJu)/2`. If `g_ℂ` is the complex-bilinear extension, then
`h_T(u^(1,0),v^(1,0))=2g_ℂ(bar(u^(1,0)),v^(1,0))`. In holomorphic coordinates,
`ω=(i/2)Σ h_T(∂_(z_k),∂_(z_j)) dz^j∧dbar(z^k)`; the standard metric has
`h_T(∂_(z_j),∂_(z_k))=δ_jk` and `ω=Σdx^j∧dy^j`. A coframe's h_T-dual norm
is its complexified-real Gram norm divided by √2.

For the source's tensor notation `h_src=2Σdz^j⊗dbar(z^j)` alongside
`ω=(i/2)Σdz^j∧dbar(z^j)`, record the dictionary `h_src=2h_T`.
If that tensor is instead used as the Hermitian tangent metric itself, its
associated form is twice the displayed ω; prove this scaling comparison.

For a column of section coefficients in a holomorphic frame with metric matrix
`h=(h(e_i,e_j))`, the Chern connection is `d+A` with `A=h⁻¹∂h`. Frame change `e′=e g`
gives `h′=g*hg` and `A′=g⁻¹Ag+g⁻¹dg`. Its curvature is `dA+A∧A`. The normalized
Fubini–Study form is `ω_FS=(i/(2π))∂∂̄ log(1+∑|z_j|²)`; its integral over a projective
line is 1. The O(1) Chern curvature is `−2πiω_FS`. These conventions match the
dual-character line in SmoothBundlesConnections and GeometricQuantization.

Hodge Laplacians are the nonnegative operators `Δ_d=dd*+d*d` and `Δ_∂̄=∂̄∂̄*+∂̄*∂̄`. On
functions the real one is the negative of DifferentialGeometry's `div grad`
Laplace–Beltrami operator. Do not use one sign for both without the comparison theorem.

## K1. Complex structures and type calculus

Consume #279 Milestones 1 and 2, including the orientation construction,
atlas independence, product law and preservation by biholomorphisms (M2.4).
These targets use DifferentialGeometry 2.1's `Manifold.Orientation`, whose fibers are
`Orientation ℝ (TangentSpace I x) ι`. Reindex `Fin (2 * finrank ℂ E)`
to `Fin (finrank ℝ E)` using the scalar-restriction dimension equality,
and prove every chart sign of the resulting `OrientationLift` is positive.
Consume #279 Milestone 2.1's real determinant positivity, expressed by
`LinearMap.det_restrictScalars` and `Algebra.norm_complex_eq`.
The shared carrier in #279 is literally DG2.1's `Manifold.Orientation`
through HeegaardFloer's delegation to DG. K1 owns the tangent-index and
positive-chart-sign comparisons just stated, derived from #279 M2.1's
determinant positivity and M2.2's overlap lemma; it constructs no second
orientation. The consumed orientation laws include compatibility with
DG 2.2's pullback along open inclusions and along
the identity between compatible atlases, and with its product orientation.
K1 also proves, from the same determinant comparison, that every local biholomorphism is
`IsOrientationPreservingAt` for these complex orientations. Transport the
orientation and these laws together.
Holomorphic differentials are complex-linear; a smooth map is holomorphic iff its
differential intertwines J, equivalently carries `T^(1,0)` into `T^(1,0)`. Consume
`ContDiffAt.to_localInverse` and `ContDiffAt.implicitFunction` over ℂ, with
RealAlgebraicGeometry Layer 7's analytic inverse/complexification comparison, and prove their
complex-manifold transport, composition and inverse APIs, with the relevant derivative invertible.
For holomorphic `G(z,v)` with invertible v-derivative at `(z₀,v₀)`, construct
the joint holomorphic implicit map `F(z,w)` near `(z₀,G(z₀,v₀))`, with
`F(z₀,G(z₀,v₀))=v₀` and `G(z,F(z,w))=w`, and prove its local uniqueness.
Consume `ImplicitFunctionData.contDiffAt_implicitFunction` and
`ImplicitFunctionData.analyticAt_implicitFunction` from
`TauCeti.Analysis.Analytic.Inverse`, which already give joint smooth and
analytic regularity of `implicitFunction.uncurry`, by applying their data to
`(z,v)↦(z,G(z,v))`. Prove the holomorphic/chart and local-uniqueness adapters
from those native joint theorems; the fixed-level `ContDiffAt.implicitFunction`
wrapper supplies the single-level specialization.
Develop holomorphic submanifolds, embeddings and their tangent/normal exact sequences,
extending #279 Milestone 7.4's codimension-one normal bundle to arbitrary codimension.
Prove equivalence of regular holomorphic parametrizations and regular holomorphic zero
sets.

For any smooth almost complex structure, apply SBC B2's complexification to TM and construct
the eigenbundles, exterior type `(p,q)`, projections, wedge/pullback/conjugation and the
decomposition of d into its four bidegrees. Define the Nijenhuis tensor by
`N_J(X,Y)=[JX,JY]−[X,Y]−J[JX,Y]−J[X,JY]`; prove tensoriality, skew-symmetry, its type
identities and the precise formulas connecting the non-`(1,0)/(0,1)` components of d and
the squares of ∂/∂̄ to N. Use DifferentialGeometry's determinant wedge and
`dα(X,Y)=Xα(Y)−Yα(X)−α([X,Y])` evaluation, without a 1/2 factor. On `(0,1)` fields X,Y,
pin `∂̄²f(X,Y)=−(1/4)∂f(N_J(X,Y))`; on `(1,0)` fields pin `∂²f(X,Y)=−(1/4)∂̄f(N_J(X,Y))`,
extending N complex-bilinearly. Deduce the same evaluation formulas on real
tangent vectors by projecting to their (0,1) or (1,0) components and using
`N(X^(0,1),Y^(0,1))=N(X,Y)^(1,0)` and its conjugate identity.
For the convention N′=N/4, prove the
corresponding evaluation formulas without the factor 1/4.
The first right-hand side uses ∂f, as required by its type.

Prove equivalence of `N_J=0` and involutivity of both eigenbundles, using local sections.
Prove the smooth **Newlander–Nirenberg theorem**: `N_J=0` iff J is induced by a compatible
complex atlas. Its proof includes the local complex first-order coordinate equations and
transition holomorphicity. Follow Webster's 1989 rapidly converging proof: construct
Henkin's homotopy operator on strictly convex domains with its half-derivative
Hölder–Zygmund gain, smoothing operators and their tame estimates, the nonlinear
correction estimates and shrinking-domain KAM/Nash–Moser iteration. Prove convergence and
invertibility of the composed coordinate maps and smooth regularity by
iteration/bootstrapping. These analytic prerequisites belong here, consuming PDE's scalar
Hölder/Schauder tools. A fixed-Hölder contraction using polydisc Cauchy–Green alone does
not give the required derivative control. This is not a consequence of real Frobenius
alone. LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds
their complex Lie algebroid structures.

## K2. Dolbeault calculus and the local lemmas

On an integrable complex manifold construct ∂ and ∂̄ on the generic type forms and prove
their bidegrees, squares zero, anticommutation, graded Leibniz, conjugation and
holomorphic-pullback naturality. Prove the local Dolbeault–Grothendieck lemma for smooth
`(p,q)` forms with q>0 on a polydisc, including the one-variable Cauchy-kernel solution
operator, cutoff and parameter-smoothness estimates used in the several-variable proof.
Require exactness on the whole open polydisc: use exhaustion by smaller polydiscs and
holomorphic approximation to glue solutions, following GH chapter 0; local shrinking alone
does not satisfy this target. Also prove ∂̄-exactness on products of planar domains by
Laurent/Runge approximation and exhaustion, explicitly on ℂ*×ℂ and ℂ*×ℂ*. Prove the
corresponding 𝒪 and holomorphic-form sheaves acyclic there, making K7's punctured-plane
cover a verified Leray cover.
Here 𝒪 is Mathlib's `smoothSheafCommRing` for `𝓘(ℂ,ℂ)`, with the native
carrier comparison of K3.0; K2 precedes K3's local coherence calculations.

Define the Dolbeault complex and `H^(p,q)_∂̄(M)`, its quotient maps, functoriality, wedge
product and identification of `H^(p,0)` with holomorphic p-forms. Construct the sheaves
Ω^p and smooth type forms, prove the latter fine/acyclic using partitions of unity, and
prove the Dolbeault theorem `H^q(M;Ω^p)≃H^(p,q)_∂̄(M)` with naturality and products. Build
the needed analytic-sheaf/Čech/derived comparison using Mathlib's Ext-based sheaf
cohomology carrier. Prove fine-implies-acyclic on the paracompact Hausdorff manifolds here
and the Čech comparison for acyclic covers. Also prove that for every
abelian sheaf on a paracompact Hausdorff manifold, the colimit of Čech
cohomology over locally finite open refinements agrees with native derived
sheaf cohomology. Construct refinement maps, prove independence up to cochain
homotopy, use paracompact shrinking for exactness after refinement, and compare
with an injective/flabby resolution. No coherent Cartan B is an input.
RealAnalyticGeometry R3.2 consumes this colimit theorem after proving vanishing
on an arbitrarily fine cofinal family of finite-order Stein covers; it does
not assume F is already acyclic on their intersections.
 SmoothBundlesConnections B6 supplies scalar
good-cover comparison where it applies, not a general coherent-sheaf theorem.

After K4 constructs 𝒪(E), E-valued type forms and ∂̄_E, prove the
bundle-valued comparison `H^q(M;𝒪(Ω^p⊗E))≃H^(p,q)(M;E)` for every finite-rank
holomorphic vector bundle E, its naturality, and `Ω^(n,q)(E*)≃Ω^(0,q)(E*⊗K_M)`.

Acceptance: whole-polydisc exactness and no nonzero holomorphic one-form on
K7.1's `Projectivization ℂ (Fin 2 → ℂ)` carrier. Consume
Mathlib’s `MDifferentiable.exists_eq_const_of_compactSpace` for functions on connected
compact complex manifolds and `MDifferentiable.isLocallyConstant` without the
connectedness hypothesis. Do not assert global constancy for disconnected manifolds.

## K3. Analytic germs and subvarieties

K3.0 supplies K1's holomorphic/analytic comparisons. Consume the native
`TauCeti.Analysis.Complex.CauchyIntegralPolydisc` polydisc Cauchy formula,
`DifferentiableOn.analyticOnNhd_of_finiteDimensional` and
`TauCeti.analyticOnNhd_iff_differentiableOn_of_finiteDimensional`, including
finite-dimensional complex domain, complete codomain and open-set hypotheses.
Consume its `TauCeti.analyticAt_circleIntegral` and
`TauCeti.analyticOnNhd_circleIntegral` for jointly analytic integrands near
the parameter set times the integration circle. Prove Osgood separate
holomorphy and its locally uniform contour bounds, then use that joint
analyticity with the native parametric integral theorem. Consume Mathlib's
one-variable Cauchy APIs as well; construct the manifold/chart transports.
Use `AnalyticAt.restrictScalars` on the resulting analytic
chart transitions and inverses, followed by `AnalyticAt.contDiffAt`, to build
the realified atlas's `HasGroupoid M (contDiffGroupoid ω 𝓘(ℝ,E))`, equivalently
real `IsManifold 𝓘(ℝ,E) ω M`. Its underlying smooth structure agrees with
#279 Milestone 1. Export the real-analytic transition and local defining-equation
comparisons required by K6's analytic-set triangulation. Use the native
`contDiffGroupoid` at order ω; no separate analytic groupoid carrier is needed.

Define holomorphic germs using the analytic/smooth sheaf stalk carrier. Consume
`smoothSheafCommRing`, its `IsLocalRing` stalk instance and `isUnit_stalk_iff` after K3.0
identifies analytic and complex-smooth sections. Supply restriction/pullback and the
maximal-ideal comparison. Consume `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` for
the identity theorem. Develop several-variable convergent power-series comparisons. Prove
Weierstrass preparation and division with their precise uniqueness: when `w ↦ f(0,w)` has
order d, the germ is a unit times a monic degree-d polynomial with holomorphic coefficient
germs vanishing at the origin. Construct the contour/power-sum proof and Newton
identities, using ContourIntegration's residue/argument-principle inputs and K3.0
parameter dependence. Consume `MvPolynomial.mul_esymm_eq_sum` for Newton identities and
align the factorization API with `PowerSeries.IsWeierstrassFactorization`.

Prove the analytic local rings are Noetherian and factorial of dimension n, with regular
parameters. Follow GH chapter 0 §§1–2/Demailly chapter II: prove local parametrization of
a pure-dimensional analytic germ by a finite branched projection to a polydisc,
elimination under finite projections, density of regular points and dimension/finite-fiber
formulas. Prove the hypersurface weak Nullstellensatz: for irreducible f, a germ h
vanishing on the zero germ of f is divisible by f. Prove Rückert's Nullstellensatz
`I(V(𝔞))=√𝔞` for every ideal 𝔞 of the convergent local ring using local parametrization.
Define reduced analytic subsets, their dimension, regular/singular loci and locally finite
irreducible components. For every pure k-dimensional reduced analytic subset V,
construct on the subtype `Reg(V)` K1's holomorphic-submanifold atlas with model ℂ^k.
Prove second countability, the complex `IsManifold` instance, compatibility with
the subspace topology, and that its inclusion into the ambient manifold is a
holomorphic embedding. Export K3.0's realification and the corresponding smooth
immersion and tangent comparisons. For subsets of mixed dimension apply this
construction to each constant-dimensional regular piece. Prove Oka coherence via Weierstrass division and
relations induction in the following primitive local form: for every open U,
every finite tuple of holomorphic functions on U and every x∈U, construct a
neighborhood V of x and finitely many holomorphic relation vectors on V whose
germs generate the relation module at every point of V.

Own Cartan's coherence theorem for the reduced ideal sheaf as a separate
local-algebra target: for every closed analytic subset A of an open complex
manifold Ω, locally the common zero set of finitely many holomorphic functions,
and every point of Ω, construct a neighborhood and finitely many holomorphic
functions whose germs generate its reduced ideal at every point of that
neighborhood. By Rückert this ideal is
the radical of the defining ideal, so the construction must produce generators
of the radical. Prove the theorem by reducing to irreducible germs, using
local parametrization and the Weierstrass-polynomial description on the
branched cover, and applying the preceding Oka relations theorem. Recombine
local irreducible components using `I_A=⋂I_(A_k)`; generate each finite
intersection from Oka relations of concatenated generating tuples `(f,−g)`.
Follow Demailly chapter II §4.4, Theorem4.29. Give also the local-generator statement for ideals
locally specified by a finite holomorphic tuple.
RealAnalyticGeometry R3.2 item0 owns the native coherent `SheafOfModules`
predicate and the translation of these primitive statements to that predicate;
these local proofs consume only the preceding convergent local algebra.
Prove that the singular locus of every reduced analytic subset is a closed analytic
subset, with strictly smaller complex dimension for a nonempty subset. Use the
local generators of the reduced ideal and the holomorphic Jacobian criterion on each local
irreducible component, then include the intersections of distinct components; local
parametrization and its discriminant give density of regular points and the dimension
drop. This also covers subsets that are not pure-dimensional. Follow
[Demailly, chapter II §4.4, Theorem 4.31](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf).
For a compact analytic subset V, build the finite descending sequence
`S₀=V`, `S_(i+1)=Sing(S_i)` until it is empty. Split each regular difference
`S_i∖S_(i+1)` by its constant complex dimension and connected components, and
prove the pieces lying in V are locally closed analytic submanifolds and
semianalytic in the realified atlas. R1 local finiteness and compactness of V
give finitely many such pieces; dimension drop bounds the iteration count.
The components of M∖V give a locally finite complementary family. When the
ambient M is compact, that family is finite as well.
The iterates can have components of different dimensions, so no whole regular
difference is given a single fixed-dimensional manifold model. This partition
supplies K6's finite family; RealAnalyticGeometry R5 supplies the global compatible
triangulation and its frontier refinement, and R5 owns compatible analytic triangulation.
Prove the analytic closure theorem for a regular-locus component and the locally finite
global component decomposition. Prove an irreducible reduced analytic subset has connected
regular locus, and conversely, first for hypersurfaces and then from local parametrization
and density in general.

On a complex manifold, prove locally bounded holomorphic functions on the complement of a
nowhere-dense analytic subset extend across it. Prove Hartogs extension across an analytic subset
A with `dimℂ A ≤ n−2` in an n-dimensional complex manifold, without a boundedness
assumption. No extension theorem for arbitrary singular ambient spaces is asserted. Work
out the node `z²=w²+w³` and cusp `z²=w³`, distinguishing global irreducibility from local
analytic branches on the actual zero sets and germs.

## K4. Holomorphic and Hermitian bundles

Consume #279 Milestone 7's holomorphic-transition mixin on the native bundle,
cocycle gluing, tensor/dual/exterior operations and canonical bundle Ω^n.
Construct the holomorphic `Hom(E,F) ≃ E*⊗F` comparison from those operations.
Compare their underlying smooth complex bundles with SmoothBundlesConnections B2.
Build holomorphic sections and their local frame, transition and restriction
formulas. Supply the RingCat-valued holomorphic structure sheaf R for native
`SheafOfModules`: compose K3's `smoothSheafCommRing` with
`forget₂ CommRingCat RingCat` and verify the underlying sheaf condition.
For each open U, identify the holomorphic structure sheaf on U with R
restricted by native `U.sheafRestrict`, compatibly with ring operations,
restrictions and germ maps. Use `Opens.overPullbackSheafEquivOver` to compare
this restriction with the native over-site carrier.
These are the ring-sheaf inputs for bundle sections here and coherent analytic
sheaves in RealAnalyticGeometry R3.2. For every native finite-rank `VectorBundle ℂ F E` equipped with
that holomorphic-transition mixin, construct the sheaf of holomorphic sections
in Mathlib's `SheafOfModules` over R.
Define its sections on each open set by holomorphic local frame coordinates,
prove frame independence and local freeness of rank r, and compare with the
sections of the bundle glued by #279 from a holomorphic GL_r cocycle.
Reconstruct the bundle from a locally
free finite-rank O-module using local bases. Prove the section/reconstruction
equivalence, including morphisms and pullbacks, on these actual carriers.
K4 supplies the holomorphic bundle and holomorphic-connection carriers for
FormalConnectionsOpers F2.4's analytification comparison. F2.4 owns the
algebraic-to-holomorphic comparison, consuming K1's manifold inverse/implicit
function theorem; K4 does not construct algebraic analytification.

Prove existence and uniqueness of the Chern connection on a Hermitian holomorphic bundle,
with `(0,1)` part ∂̄ and metric compatibility; prove the local formula and curvature type
`(1,1)`, frame independence, tensor/dual and pullback formulas. Construct Dolbeault
operators on complex bundles and prove **Koszul–Malgrange**: an integrable `(0,1)`
connection gives a holomorphic bundle structure recovering the given operator: sections
are holomorphic exactly when `∂̄_E s=0`. Build its local frame-solving theorem and gluing,
first in rank one and then at arbitrary fixed finite rank. For rank r, build the induced
almost complex structure on the total space from the `(0,1)` connection, prove its
Nijenhuis tensor vanishes iff the connection is integrable, and apply K1
Newlander–Nirenberg to obtain local holomorphic bundle frames; prove projection, fiber
addition and scalar multiplication are holomorphic for that structure. Use the holomorphic
implicit-function theorem to obtain local sections through a basis and prove they remain a
frame, giving compatibility with the fiberwise complex-linear structure. This supplies the
nonlinear rank-r solvability step rather than assuming scalar ∂̄ solves a matrix equation.
This supplies GeometricQuantization's holomorphic prequantum line dictionary.

Define a holomorphic connection on a holomorphic bundle E as a ℂ-linear
sheaf operator `∇:E→Ω¹_hol⊗E` with `∇(fs)=df⊗s+f∇s`; its contraction
with a holomorphic vector field is O-linear in that field. Give local
holomorphic connection matrices, their gauge-change law, pullback, tensor,
dual and Hom operations and curvature. Construct the smooth connection D
agreeing with ∇ on local holomorphic sections and prove uniqueness. It
has `(0,1)` part ∂̄_E and holomorphic `(1,0)` coefficients; prove the
converse comparison. Prove D² equals the holomorphic curvature ∇² viewed
as a smooth `(2,0)` form, so their flatness criteria coincide. Every holomorphic
connection on a complex curve is flat. This assertion concerns holomorphic
connections; the Hermitian Chern connection above has its stated `(1,1)`
curvature. For flat holomorphic connections prove parallel local frames are
holomorphic. With a frame e at a basepoint, continue it along γ to
e_γ=e·M(γ), and pin `T_γ∘e=e∘M(γ)`, where T_γ is B5's source-to-target
parallel transport; thus M(γ)=e⁻¹T_γe, with the same frame-bundle holonomy,
not its inverse. The inverse in B5's deck quotient remains in that quotient
action. Prove an equivalence of groupoids between flat holomorphic connections,
flat smooth ℂ-linear connections and finite-rank ℂ-local systems. The
local-system carrier is a functor from Mathlib's `FundamentalGroupoid M` to
`ModuleCat ℂ` with finite-dimensional value at each object; build its
comparison with locally constant sheaves of ℂ-modules with finite-dimensional
stalks by local parallel frames and path transport. Include the inverse
sheaf/gluing construction and stalk/monodromy naturality. Extract
(D^(0,1),D^(1,0)) by Koszul–Malgrange, and construct the inverse holomorphic
object as L⊗𝒪 with connection 1⊗d: use local parallel frames of L and their
constant GL_r transition cocycle in the preceding bundle construction, and
identify its sections sheaf with the tensor sheaf. Include morphisms and naturality in
holomorphic pullback. This is the analytic correspondence on the common carrier.

For bundle-valued forms construct ∂_∇, ∂̄ and curvature identities on the generic carrier.
Prove the torsion tensor and Cartan frame structure equations for tangent connections,
consuming existing covariant-derivative curvature and torsion APIs and translating frame
conventions. These include the dual and tensor-connection exercises as specializations of
B3 rather than new connection objects.

## K5. Compact Hermitian elliptic theory and Serre duality

**K5a. Real and complex-coefficient analysis on real manifolds.** This shared
layer uses DifferentialGeometry, SmoothBundlesConnections B2–B4, PDE Lane A.3,
VariationalMethods V2–V5.2, AlgebraicTopology and Mathlib, and HopfRinow Layer 1's Levi-Civita connection
through PDO P1.0. Its pointwise real star, orientation line and
density bundle precede PDO P1.0. Its distributional operator action and
Laplace analysis then consume P1.0's operator and symbol core. It precedes the complex-manifold
and holomorphic-bundle applications in K5b.

Consume SmoothBundlesConnections B2's RCLike L² section construction. The
bundle is DifferentialGeometry's actual alternating bundle
`V_x=T_xM [⋀^Fin k]→L[ℝ] E_x`, with `E_x=𝕜` in the scalar real/complex cases.
Prove its natural identification with the appropriate exterior-power bundle,
its `VectorBundle 𝕜` structure and the basis-independent Gram⊗h_E metric as
B2's `ContinuousFiberMetric`: `h.inner x : V_x →L⋆[𝕜] V_x →L[𝕜] 𝕜`.
Supply chartwise smoothness and positivity. Use `μ=TauCeti.riemannianVolume I M`;
consume DifferentialGeometry 12.4's full-support/open-positive comparison to
provide B2's `IsOpenPosMeasure μ`. Consume the native
`TauCeti.isLocallyFiniteMeasure_riemannianVolume` instance with the
finite-dimensional, continuous-metric, Borel and Lindelöf hypotheses in
`TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`; second countability
supplies the Lindelöf condition here.
Use B2's compactly supported smooth density and `MeasureTheory.Lp` comparison
on these bundles.

Pin the pointwise product on exterior forms by Gram determinants, making increasing wedges
of an orthonormal real coframe orthonormal (not summing over all ordered tuples).
On an oriented real inner-product space V of dimension m construct the
pointwise Hodge star on all exterior degrees, with vol the native
`Orientation.volumeForm` (including its signed degree-zero value), characterized by
`α∧*β=⟨α,β⟩vol`, with `*²=(−1)^(k(m−k))` on degree k. Prove isometry,
oriented-isometry naturality, orientation-reversal sign and wedge/contraction
adjoint identities. Transport smoothly to real cotangent/exterior bundles.
Construct the orientation line from the sign-of-determinant tangent-frame
transition cocycle, identifying its square with the trivial line and its
oriented trivializations with DG's orientations. Without orientation the
star codomain is twisted by this line and its local sign changes glue.
This pointwise algebra precedes the elliptic scale
and is the shared supplier for RiemannianGeometry and SpinGeometry's
Clifford–star/chirality comparison.
Complex-linearly extend this real star to the complexified exterior algebra.
Pin `α∧*β=B_ℂ(α,β)vol=⟨bar α,β⟩_Gram vol`, where B_ℂ is the bilinear
extension of the real Gram product and the Hermitian product is
conjugate-linear in its first slot. Define `barStar β=*(bar β)` already
on these complexified real forms and prove
`α∧barStar β=⟨β,α⟩vol`. For a finite-dimensional orthogonal complex
structure on the real fiber, prove the pointwise (p,q) type law for this
star and barStar on its complexified exterior algebra. This algebra uses
no integrability or holomorphic bundle. K5b transports that law to its type bundles.

First equip DG's actual `Density V (finrank ℝ V)` with pointwise
`AddCommGroup` and `Module ℝ` extending DG's existing pointwise `SMul ℝ`,
and prove evaluation on any basis is a
linear equivalence with ℝ. Transport its rank-one topology through this
equivalence, proving basis independence and continuity of the |det| action.
Construct the smooth real density line bundle `DensityBundle M` with local
transition |det D(chart change)|, its dual/tensor and pullback maps, and construct
its `ContMDiffVectorBundle ∞` structure. Identify its smooth sections with
chart-smooth values of DG 5.5's `RoughDensity` carrier; scalar-extend it
to 𝕜 for complex coefficient bundles. Define
`BundleTest(E*⊗DensityBundle M)` as the compactly supported smooth sections,
using native `ContMDiffSection` with `ContMDiffVectorBundle ∞`, and fixed-compact
derivative seminorms. Prove equivalence with chart/frame seminorms and independence
of atlas and auxiliary connection on each fixed compact support. Equip it with
the final locally convex topology for the native `TestFunction Ω F ⊤`
chart/frame extension maps. Pin those maps by their pointwise extension-by-zero
formula and prove the universal continuity criterion: a linear map into a
locally convex space is continuous iff its compositions with every such native
test map are continuous. Prove this topology equals the fixed-compact inductive
limit and its real/complex scalar compatibility. Define
`BundleDistribution(E)=BundleTest(E*⊗DensityBundle M) →L_c[𝕜] 𝕜`,
with compact-convergence topology, matching native Distribution. Keep the
pointwise topology of native TemperedDistribution distinct; prove the
localized test-pairing maps into these carriers continuous, using uniform
estimates on compact test families, without silently identifying topologies.
Consume Mathlib `TestFunction Ω F ⊤`, its LF topology and
`TestFunction.continuous_iff_continuous_comp`, and `Distribution Ω F ⊤`.
Build frame/chart/restriction/gluing comparisons with native real-test
F-valued distributions. For 𝕜=ℂ, complex-linearly extend real tests; prove
compatibility with `TemperedDistribution`'s complex-test convention.
After PDO P1.0's differential-operator and density-transpose core, construct
the action of differential operators on distributions by the
bilinear transpose on E*⊗density tests. Prove compactly supported
Euclidean distributions extend uniquely to tempered distributions after
cutoff, with the explicit test-pairing and cutoff-independence on their
support. Prove finite derivative order on each fixed compact support.
Construct the Fréchet topology on all smooth sections of every finite-rank
bundle, including E*⊗DensityBundle M,
from a countable exhaustion by compact chart/frame sets and all derivative
seminorms; prove completeness, atlas independence and continuous restriction.
Identify its continuous dual with compactly supported distributions, proving
that continuity bounds the pairing by finitely many such seminorms and hence
forces compact support. These carriers precede the Hilbert scale.

For compact M define `BundleSobolev E s`, s∈ℝ, as the subspace of
BundleDistribution(E) whose localizations χ_i u in a fixed finite smooth
bundle atlas, after tempered extension, satisfy native
`TemperedDistribution.MemSobolev s 2`; bundle them in the corresponding
`BesselPotentialSpace ℝⁿ F_i s 2`.
Choose a real continuous linear equivalence from the finite-dimensional
M's model space E_M to `EuclideanSpace ℝ (Fin n)`. Use finite-dimensional complex Hilbert
fiber models F_i and χ_i supported inside
chart/frame domains with Σχ_i²=1; extension by zero is distributional.
Pin the norm `‖u‖²=Σ_i‖χ_i u‖²_(Bessel s)`. Prove the localization map is
injective with closed image in `PiLp 2` of those complete Hilbert spaces,
using overlap compatibility and reconstruction Σχ_i(χ_i u). Prove the
Euclidean bounded cutoff/chart-change estimates below first; they make
reconstruction bounded and its compatibility equations closed.
This gives the complete/Hilbert carrier. Define H^s_loc on noncompact M by
membership of every compactly supported chart localization in the native
space, with its localization seminorm topology. For real bundles use
the complexification and real-distribution comparison below, not an
unidentified subspace of complex distributions.

For every real bundle V, consume SBC B2's fibers `ℂ⊗_ℝ V_x`, their natural
inclusion and conjugation, and its dual/tensor comparison for density-valued
tests. Prove the real topological linear equivalence
`BundleTest(V_ℂ) ≃L[ℝ] RealBundleTest(V) × RealBundleTest(V)` given by
`φ=ι(φ_R)+iι(φ_I)`. Multiplication by i corresponds to
`(φ_R,φ_I)↦(−φ_I,φ_R)`; conjugation corresponds to `(φ_R,−φ_I)`.
Prove these identities and continuity in the LF topologies through real
chart/frame maps. Construct the real-linear continuous extension of real
distributions, pinned by `u_ℂ(φ)=u(φ_R)+i u(φ_I)`, and the inverse on fixed
points by evaluation on included real tests. Construct distribution
conjugation `κu(φ)=conj(u(κφ))` as a continuous real-linear involution and
prove that the extension image is exactly its fixed-point subspace, with
the compact-convergence subspace topology and inverse-continuity comparison.
These statements apply to the dual coefficient bundle tensored with the
density line used in the distribution pairing.

Equip complexified real Hilbert fiber models, identified with native
`EuclideanSpace ℂ (Fin r)`, with the sesquilinear extension of the real metric:
`h(a+ib,c+id)=g(a,c)+g(b,d)+i(g(a,d)−g(b,c))`.
The real inclusion is isometric and componentwise `star` is antiunitary.
Prove the coordinate-free tensor-product comparison. Construct conjugation on
their native Schwartz functions, tempered distributions and Bessel spaces.
Prove Fourier conjugation includes reflection `ξ↦−ξ`; since the real-order
Bessel symbol is real and even, conjugation commutes with `besselPotential`
and is isometric on every H^s, including negative s. Choose real cutoff
functions and complexified real frames; prove localization, tempered
extension and reconstruction commute with conjugation. Thus the fixed
part of the closed compatible-tuple carrier is a closed real Hilbert
subspace, with inner product `Re⟨·,·⟩`, canonically a subspace of
`RealBundleDistribution(V)` by the inverse extension. Prove real chart
independence, norm equivalence, density and all scale/duality/regularity
comparisons on this actual carrier. The same construction defines real
H^s_loc using the compact localization seminorms. Consume SBC B2's
isometric geometric `L²(V_ℂ)` complexification identity, using pairs of
real L² sections and its real/imaginary-part maps on the complete
almost-everywhere quotient. Prove conjugation has exactly the real L²
image as fixed points. At s=0, compose that identity with the distribution extension
to give `RealBundleSobolev V 0 ≃L[ℝ] L²(V)`, with the same distributional
image and equivalent norms. The complexification identity uses geometric
L² norms and is isometric; the s=0 distributional comparison uses the
pinned atlas Sobolev norm and is only a norm equivalence. Real operator adjoints and
orthogonal projections use the geometric inner product.

Before chart estimates, construct the Euclidean bilinear density pairing
on native `BesselPotentialSpace` H^s(ℝⁿ;F)×H^(−s)(ℝⁿ;F*)→𝕜,
and prove its continuous-dual identification directly by weighted Plancherel
and reciprocal Fourier weights. Prove density and transpose compatibility on
Schwartz functions first and extend to the completed spaces. This Euclidean
duality precedes the bundle carrier's closed-image/completeness argument.
In the complex Euclidean case also compare the course's Fourier-side
bilinear pairing `B_F(f,g)=∫ f̂(ξ)·ĝ(ξ)dξ` with the spatial density
pairing `B₀(f,g)=∫ f(x)·g(x)dx`. For `Rg(x)=g(−x)`, prove in the
native Fourier normalization `B_F(f,g)=B₀(f,Rg)` by bilinear Plancherel,
and prove R is an involutive isometry on every real-order Euclidean H^s.
Consequently the two transposes satisfy `T^(t_F)=R T^(t₀) R` on
Schwartz functions. Prove the abstract reciprocal-Fourier-weight duality
lemma, including the pairing normalization, and derive the transpose
bound with the same C in the matched primal/dual norms. Apply it to
the native Bessel norms and separately to the course's angular-weight
norms with their chosen pairing constant, then extend by density.
Transporting to other equivalent norms uses their explicit equivalence
constants; it does not preserve C automatically.
For matrix multiplication identify the B_F transpose as multiplication
by `A(−x)ᵀ`, rather than a Hermitian adjoint. These comparisons include
the real-fiber complexification convention already specified above.
Consume PDE Lane A.3's Euclidean H^(k,2)=W^(k,2) comparison with equivalent
norms for every nonnegative integer k, componentwise in each finite-dimensional
fiber model. Construct pullback of distributions
by smooth diffeomorphisms using the dual density pushforward and its Jacobian;
prove support, composition and localized tempered comparisons. Prove
multiplication and compactly localized chart-change estimates first
at nonnegative integer orders by chain rule, coefficient derivative bounds
and the Jacobian change of variables; obtain negative integers by transpose
and density duality. Build the p=2 Hilbert interpolation theorem from weighted
Fourier L², `verticalClosedStrip`, `DiffContOnCl`,
`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`
and the bounded-operator interpolation argument for this weighted Hilbert scale.
This argument is built here; PDE Lane B.9 supplies the distinct Lp
Riesz–Thorin theorem. Construct complex-order multipliers
Λ^z from `fourierMultiplierCLM` with symbol
`exp((z/2) log(1+|ζ|²))`. Prove temperate growth at each z, analytic
dependence and imaginary-axis L² isometry. Apply three-lines first to Schwartz
functions with smooth compactly supported Fourier transform, verifying strip
boundedness and density in every real-order space, then extend
these estimates to every real s. Prove choice-independent equivalent norms,
smooth density, connection W^(k,2) comparison and localization naturality.
Own global matrix multiplication by every smooth A:ℝⁿ→Hom(F,G)
with all derivatives, including order0, uniformly bounded: prove bounded
H^s→H^s for each real s by the integer Leibniz estimates, density transpose
and this Hilbert interpolation. This includes the bounded Jacobian factors
in the global diffeomorphism theorem and precedes its negative-order proof.
Pin the global and bounded-domain instances of these coordinate estimates.
Before Laplace estimates, own the differential-operator mapping theorem:
for every P1.0 bundle differential operator P of integer order at most m≥0,
prove `P : BundleSobolev E (s+m) →L[𝕜] BundleSobolev F s` for every real s
on a compact base, with cutoff/local versions on arbitrary chart domains.
On native Euclidean Bessel carriers prove the Fourier-multiplier bound for
each ∂_j, then compose derivatives and the matrix multipliers above in P's
local coefficient formula. Patch by the bounded localization/reconstruction
maps and prove agreement on smooth sections and distributions, independently
of the general pseudodifferential calculus. P5 compares this extension with
its quantization extension when both are defined.
For a smooth diffeomorphism φ:ℝⁿ→ℝⁿ whose every positive-order derivative
and every positive-order derivative of φ⁻¹ is uniformly bounded, prove
pullback extends to a continuous linear isomorphism of each native H^s,
s∈ℝ, inverse to pullback by φ⁻¹, agreeing with distributional pullback
in the native tempered-distribution carrier. Construct that global tempered
pullback first: prove the dual density pushforward
`f ↦ |det Dφ⁻¹|·(f∘φ⁻¹)` maps native Schwartz functions continuously to
Schwartz functions. Bounded first derivatives of φ and φ⁻¹ give linear
growth and properness, while all higher bounds control each Schwartz seminorm.
Define pullback on tempered distributions by this transpose and compare its
image in distributions with the preceding local construction.
The adjoint used at negative orders
includes the Jacobian factor from the dual density pushforward.
For bounded smooth domains U,V, define a smooth diffeomorphism of their
closures as a mutually inverse pair satisfying `ContDiffOn ℝ ∞` on each
closure. Construct
extension of smooth functions/maps across a smooth boundary by a collar,
the half-space Seeley extension and a finite partition of unity; include its
derivative estimates. Use the inverse function theorem and compactness to
extend such a closure diffeomorphism to a diffeomorphism between open
neighbourhoods of the closures, shrinking both neighbourhoods as necessary.
For this extension prove the
corresponding estimate on C_c^∞(V), with both norms computed after
zero extension to ℝⁿ. Export the completion isomorphism and its
compatibility with distributional pullback. This carrier is the completion
of test functions in the whole-space zero-extension norm; its theorem does
not identify it with the restriction Sobolev space on a domain.
The localized cutoff estimates above apply inside arbitrary chart domains
and precede the finite-atlas norm comparison.
Define ξ as the angular frequency, so σ_F(∂_j)=iξ_j. The native Fourier
variable is ζ=ξ/(2π) and its weight is 〈ζ〉^s; prove equivalence, rather than
equality, to 〈ξ〉^s and connection norms. Also prove for every real s
`(1+|ξ|)^(2s) ≍ (1+|ξ|²)^s`, with both constants explicit in s, and
compare the associated completed norms before using either source weight.
Prove continuous embeddings
H^s→C^k for s>k+n/2 and supported Rellich H^s→H^r for every real r<s.
For fixed compact support, prove compactness H^s→C^k under the same strict
margin by choosing k+n/2<r<s and composing Rellich with the continuous
H^r→C^k map. Patch to compact bundles; use the sum over the fixed finite
atlas of `sup_x Σ_(|α|≤k)|D^α(χ_j f_j)(x)|` in its bundle frames, with
the chart cutoffs χ_j extended by zero, and prove equivalence with connection
norms. For every smooth bundle map A:E→F on a compact base prove
`u↦Au : BundleSobolev E s →L[𝕜] BundleSobolev F s` for every real s,
using this same localization and the Euclidean matrix multiplier theorem.
For Rellich, fix a common compact support. Use its distributional pairing
bounds to make Fourier transforms and their frequency derivatives uniformly
bounded on each bounded frequency ball, apply Arzelà–Ascoli there, and bound
the H^r high-frequency tail by 〈ζ〉^(2(r−s)) times the uniform H^s bound.
Use a diagonal subsequence, then the bundle localization/reconstruction maps.
Use the Riemannian density to identify E*⊗DensityBundle M with E* in the
continuous bilinear density pairing H^s(E)×H^(−s)(E*)→𝕜. This pairing identifies
H^(−s)(E*) with the 𝕜-linear continuous dual of H^s(E). Hermitian Riesz
transport to E is conjugate-linear and gives the second/first slot pairing
∫⟨v,u⟩, consistent with Mathlib's conjugate-first inner product.
Finite distribution order and these continuous embeddings then show every
bundle distribution lies locally in H^(−N) for some finite N.
The general pseudodifferential calculus consumes this shared scale; this
Laplace-type layer consumes P1.0's differential operators, not the general
calculus or P1.1's Peetre theorem. Prove BundleSobolev E 0 and B2's
geometric L² have the same distributional image and equivalent norms, using
`TemperedDistribution.memSobolev_zero_iff`, the distribution map
`s ↦ (φ ↦ ∫ φ(s))`, the chart metric/density bounds
and B2's chart isometries. This gives a continuous linear equivalence, not
an isometry for the pinned atlas norm. Every formal adjoint, self-adjoint
realization, harmonic projection and orthogonal Hodge splitting uses B2's
inner product ∫⟨s,t⟩_h dμ; the atlas H^s inner products provide the Hilbert
scale and compactness. Compare P1.0's formal density adjoints with that
geometric L² pairing even on nonorientable real manifolds, and prove the
real de Rham instantiation on this shared API.

Own the complex-linear manifold top-form integration and pairing API by real
and imaginary parts on DifferentialGeometry's carrier, proving agreement with
DG8.4's existing vector-valued simplex/chain integrals and Stokes. Use that
agreement for the complex-linear de Rham integration map and its naturality. On an
oriented real Riemannian manifold, extend compactly supported smooth top-form
integration to integrable `f dvol_g` through the L¹ density completion;
prove independence of the approximants. Combine DG 5.5's
`integralTopForm_eq_integralDensity` and 12.4's
`integral_riemannianVolume_eq_integralDensity` to prove
`∫_M f dvol_g=∫ f d(riemannianVolume I M)` for integrable complex f,
first on compactly supported smooth functions and then by L¹ density. Use
this comparison in every L² formal-adjoint and Hodge pairing identity.
Construct the ℂ-valued
de Rham complex and prove `H_dR(M;ℂ)≃ℂ⊗_ℝ H_dR(M;ℝ)` via scalar extension of the complex,
together with the singular-cohomology comparison supplied by DifferentialGeometry and
AlgebraicTopology.

Consume P1.0's differential-operator carrier and Laplace-type predicate:
order at most 2 and Fourier principal symbol c|ξ|²_g Id for a fixed c>0.
Consume P1.0's restriction-compatible symbol and formal-adjoint maps,
bilinear density transpose and their local coordinate formulas.
Own local elliptic estimates for these operators on finite-rank real Riemannian and
complex Hermitian bundles over `[RCLike 𝕜]`, with smooth coefficients and
principal symbol `c g^{ij}ξ_iξ_j Id` for a fixed c>0, using the convention
`σ(∂_j)=iξ_j` (complexify real operators for this symbol), including the c=1
Laplace-type normalization. Give the positive-scalar rescaling of norm,
resolvent and Green-operator identities. Use frozen-principal-part Fourier estimates at every real order and absorb
smooth matrix lower-order coupling by the Hilbert interpolation inequalities
and interior cutoffs. Compare the integer-order conclusions with PDE's scalar
estimates, without using its H¹-weak theorem as the distributional starting step. Prove frame
invariance, localization/partition estimates and bundle Sobolev Rellich compactness.
Pin s∈ℝ throughout the Hilbert-scale estimates. Build the local regularizing
mollifier/Friedrichs commutator estimates for smooth matrix coefficients,
uniform for 0<ε≤1: for chart-localized order 2 P and convolution
regularizer J_ε, prove `[P,J_ε]:H^r→H^(r−1)` bounded independently of ε,
for every real r, with nested cutoff versions and strong J_ε→Id on each
fixed Sobolev order. Prove them from Fourier convolution,
the following explicit Fourier targets, proved here: for every real s,
`〈ζ+η〉^s≤2^(|s|/2)〈ζ〉^s〈η〉^|s|`, and the weighted Schur
test together with the L¹*L² Young bound. Consume native
`SchwartzMap.fourier_convolution` for the Fourier product/convolution
identity. Use cutoffs to give rapidly decaying
coefficient transforms. Combine frozen constant-principal-part Fourier
estimates with the following all-real-order coefficient estimate. For every
smooth compactly supported matrix f and s∈ℝ, prove
`[Λ^s,M_f]:H^(s−1)→L²` bounded by Fourier convolution, Peetre and Schur
estimates, hence
`‖fw‖_(H^s) ≤ sup_x‖f(x)‖·‖w‖_(H^s)+C_f,s‖w‖_(H^(s−1))`.
Here `sup_x‖f(x)‖` is the fiber operator norm and the Euclidean H^s norm
is the native Bessel norm `‖Λ^s w‖₂`; the leading coefficient is 1 in
that norm. Compare the resulting estimate with the equivalent angular-
frequency and connection norms, allowing their fixed equivalence constants.
The lower-order constant
may depend on derivatives and support. This permits the small principal
coefficient term to be absorbed on small charts; interpolation absorbs the
remaining lower-order terms. Use this estimate and interior cutoffs to prove
interior estimates before passing from smooth to weak inputs. For cutoffs
χ,χ′ with χ′=1 on a neighbourhood of supp χ, every real s and r<s+2,
prove for smooth u and some C>0 depending on these fixed data

`‖χu‖_(H^(s+2)) ≤ C(‖χ′Pu‖_(H^s)+‖χ′u‖_(H^r))`.

Apply the uniform regularization/commutator estimates and weak compactness to
gain one Sobolev derivative starting from H^r_loc. Iterate from the proved
finite negative local order to obtain distributional regularity:
Pu∈H^s_loc implies u∈H^(s+2)_loc. In particular explicitly prove the
L²_loc→H¹_loc starting step, rather than invoking scalar PDE's H¹-weak
regularity on an L² input. On compact boundaryless manifolds give the global
estimate with any lower r<s+2, extend it to the operator domains, and prove
L²-weak solutions with Pu∈H^s lie in H^(s+2). Smooth right-hand sides then
give smooth solutions. These are targets for general smooth Laplace-type
bundle systems before the specific Hodge applications.
HamiltonianReduction R5 consumes this smooth-coefficient layer at smooth
reference connections for the Laplace operator of `d_A⊕d_A*`. K5 computes
the exterior-multiplication/contraction symbols to prove
`σ_F((d_A⊕d_A*)*(d_A⊕d_A*))=|ξ|²_g Id` on each degree, for every smooth
metric connection A, compatibly with P1.0's symbol and Dirac-type API. R5 owns its
Sobolev-coefficient perturbation estimates, gauge-specific identifications and
Coulomb slice.

For every formally self-adjoint nonnegative Laplace-type system on a compact
boundaryless base, identify its coercive shifted form with
VariationalMethods V5.1's abstract form-represented self-adjoint operator in
B2's geometric L². Prove its operator domain and adjoint/maximal weak domain
are H² by regularity, thereby obtaining the specified H² realization.
Prove the shifted energy form coercive on H¹ using its scalar principal part
and bounded lower-order coefficients. Consume
[VariationalMethods V2.2–V2.4](../VariationalMethods/README.md)'s RCLike
coercive solution operator and its `toRealBilin` comparison with native
real `IsCoercive.continuousLinearEquivOfBilin`; complex Hermitian forms
use the realification and i-test supplied there. Use H¹ Rellich and
[VariationalMethods V3–V4](../VariationalMethods/README.md)'s abstract compact-
embedding form/solution-operator spectral theorem to prove compact resolvent,
finite-dimensional kernel, complete smooth eigensections, Green inverse on
the kernel's orthogonal complement and its projection/recovery identities.
The elliptic weak-domain identification and smoothness are owned here;
V3–V4 supplies the abstract form and compact spectral argument. Use
V5.1–V5.2's graph/domain and eigen-expansion API in that comparison;
self-adjointness is consumed from V5.1. Apply the
same construction to Δ_d and Δ_A; PDO P7 and HamiltonianReduction
R5 consume it for smooth reference operators before their additional estimates.

Pin d* as the formal L² adjoint and the nonnegative Hodge Laplacian
`Δ=d*d+dd*`, `σ_F(Δ_d)=|ξ|²_g Id`. Prove its self-adjoint realization with
domain H² and compact resolvent by the shared estimates/weak-domain
identification, before constructing its eigensection decomposition. On
functions it is the negative of DG's `laplaceBeltrami=div∘grad`. Construct
harmonic projection and Green operator, the orthogonal harmonic/exact/coexact
splitting, and the de Rham Hodge theorem on compact real Riemannian manifolds;
identify its cohomology with DifferentialGeometry's de Rham object.
Own `d*=(−1)^(m(k+1)+1)*d*` on real k-forms of an oriented m-manifold
and `*Δ_d=Δ_d*`; PDO P1.1, Riem R7.4 and K5b consume these identities.

**K5b. Hermitian type calculus, Dolbeault Hodge theory and Serre duality.**
**K5b.0 — Local Hermitian identities on arbitrary complex manifolds.**
Consume K1, K2, K4 and K5a's pointwise density/formal-adjoint layer.
The Gram/type/star identities, Dolbeault formal adjoint on compact supports
and principal symbol `σ(Δ_∂̄_E)(ξ)=½|ξ|²_g Id` below hold on arbitrary
Hermitian complex manifolds and their open sets, without compactness.
RealAnalyticGeometry R3.1 consumes them for its weighted noncompact estimate.
Prove
`dvol_g=ω^n/n!` for the complex orientation. Identify K1's
(p,q) summands as smooth Gram-orthogonal subbundles, with their orthogonal
splitting and coefficient-space models. Prove the complex Dolbeault
formal-adjoint instantiation on K5a's shared density and L² API.
For H_kl=h_T(∂_(z_k),∂_(z_l)), pin
`|dz_j|²_Gram=2(H⁻¹)_jj` and
`dz_j♯=2 Σ_k (H⁻¹)_kj ∂_(z_k)`. Thus `|dz_j|²=2` and
`dz_j♯=2∂_(z_j)` hold where H=I, including the standard metric.
For a `(1,0)` coframe ψ orthonormal in the complexified-real Gram product,
define wedge `e_θ=θ∧·` and `i_θ=e_θ*=ι_(θ♯)`, where ♯ is the
conjugate-linear Gram dual. Prove `(1,0)` and `(0,1)` cotangent subspaces are
Gram-orthogonal. For ψ_j and its conjugate, pin `i_j=e_j*`, `bar(i_j)=bar(e_j)*`,
`e_θ i_η+i_η e_θ=⟨η,θ⟩_Gram`. In particular the two same-type
anticommutators are δ_jk and both mixed-type anticommutators vanish.
In coordinates use the preceding H⁻¹ formula for contraction; interior at
the ordinary dual-frame vector is a different normalization.
A unitary `(1,0)` coframe φ for h_T* has Gram norm √2; prove the scaling
ψ=φ/√2 and the resulting identity
`e_(φ_j)i_(φ_k)+i_(φ_k)e_(φ_j)=2δ_jk`. Transport K5a's pointwise type law to the
complex-linear Hodge star `*:Ω^(p,q)→Ω^(n−q,n−p)`, its degree
square identities, and the `(n−p,n−q)` type of K5a's `barStar β=*(bar β)`. Pin
`α∧barStar β=⟨β,α⟩dvol` and `∂̄*=−*∂*`. Consume K5a's
`*Δ_d=Δ_d*` and prove `barStar Δ_∂̄=Δ_∂̄ barStar`.
For a Hermitian holomorphic bundle E construct conjugate-linear
`barStar_E:Ω^(p,q)(E)→Ω^(n−p,n−q)(E*)` using the fiberwise metric identification; pin
the identity `α∧_ev barStar_E β=⟨β,α⟩_(Gram⊗h_E)dvol_g`, using
`wedgeWith` with evaluation `(s,φ)↦φ(s)` in that order, and its integral/norm
consequence. Use this same slot order in the Serre pairing. Prove inverse/square
and `barStar_E Δ_∂̄_E=Δ_∂̄_(E*) barStar_E`, where E* has B2's Riesz-transported
dual metric.


**K5b.1 — Compact Dolbeault Hodge theory.**
On compact boundaryless Hermitian manifolds, consume K5b.0's symbol and
instantiate K5a's full real-manifold generic
estimates, regularity, self-adjoint H² realization in B2's geometric L²,
compact resolvent, kernel and smooth eigenbasis at c=½,
equivalently using `2Δ_∂̄_E` at c=1. Construct harmonic
projection and Green operator, prove orthogonal decomposition into harmonic, ∂̄-exact and
∂̄*-exact terms, and identify Dolbeault cohomology with harmonic forms.

Prove the integration pairing `H^(p,q)(M;E) × H^(n-p,n-q)(M;E*) → ℂ` is nondegenerate and
identifies the second factor with the linear dual. Derive holomorphic-vector-bundle Serre
duality `H^q(M;E)*≃H^(n-q)(M;E*⊗K_M)` via Dolbeault comparison. Prove finite Hodge
numbers, metric independence and the dual Hodge-diamond symmetry on compact complex
manifolds. No Kähler hypothesis is needed for these Hermitian/Dolbeault statements.
For scalar coefficients, transport `barStar` through the harmonic
identification to an anti-complex-linear isomorphism
`H^(p,q)(M) ≃ H^(n−p,n−q)(M)`. Prove its inverse and square sign.
It depends on the Hermitian metric; it is distinct from the complex-linear
pointwise star, whose type is `(n−q,n−p)`.

## K6. Kähler identities and Hodge decomposition

### K6.0. Local Kähler and curvature identities

The canonical predicate is a Hermitian metric on a complex manifold with closed
fundamental form. Prove its comparison, through K1 Newlander–Nirenberg, with the
real-carrier `IsKahler` prototype (Compatible, closed and N=0). Define Kähler metrics by
closedness of the fundamental form and prove equivalence to `∇J=0` for Levi-Civita and
holomorphic coordinates with `h_ij=δ_ij+O(|z|²)` at a point. Prove the adapted unitary
frame lemma, the standard Kähler structure on ℂⁿ, that complex submanifolds inherit Kähler
metrics, and that every Hermitian metric on a complex curve is Kähler. Develop `L=ω∧·`,
its adjoint Λ, primitive forms and `[Λ,L]=(n-k)` on degree k. Prove `[Λ,∂]=i∂̄*`,
`[Λ,∂̄]=-i∂*` and the adjoint/conjugate identities, explicitly `[Λ,d]=−(d^c)*` and
`[L,d*]=d^c`. For `d_c=d^c/(4π)`, prove the corresponding commutator
identities with the factor 4π. Prove
`Δ_d=2Δ_∂=2Δ_∂̄`, preserving type.

For a smooth Hermitian holomorphic bundle E with K4's Chern connection, prove
pointwise Lefschetz algebra on E-valued forms and the twisted Kähler identities
`[Λ,∂̄_E]=−i(D'_E)*` and their adjoints. Prove
`Δ''_E=Δ'_E+[iΘ(E),Λ]` and the integrated Bochner–Kodaira–Nakano identity
on compactly supported smooth forms. On `(n,k)` forms prove the curvature
lower bound: if `iΘ(E)≥aω⊗Id_E` in Nakano sense, then
`[iΘ(E),Λ]≥ka Id` for `k≥1`, with the corresponding pointwise bounds for
scalar weight curvature. Define Nakano positivity by its Hermitian form on
`T^(1,0)M⊗E`; prove the contraction/eigenvalue calculation in a unitary frame.
This local layer consumes K1/K2 type calculus, K4 Chern connections, and K5a's
local formal-adjoint comparison. It uses no compact Hodge theorem, analytic-set
triangulation or RealAnalyticGeometry R5. RealAnalyticGeometry R3 consumes these
identities and owns their complete-metric weighted domain and existence theory.

### K6.1. Compact Kähler Hodge theory and analytic cycles

On compact Kähler M prove the `∂∂̄` lemma, then prove Hodge decomposition `H^k_dR(M;ℂ)≃⊕_(p+q=k)H^(p,q)(M)`, Hodge
conjugation/symmetry, and compatibility with wedge/singular cup product and
integral/rational coefficient images. Construct the corresponding pure real/rational Hodge
structures using the existing linear Hodge-structure library. Prove odd real Betti numbers
are even from Hodge symmetry and decomposition, including the degree-one obstruction
consumed by SymplecticGeometry. Prove Hard Lefschetz `L^(n-k):H^k→H^(2n-k)` is an
isomorphism for k≤n, primitive decomposition and Hodge–Riemann bilinear relations: for a
nonzero primitive `(p,q)` class α, `k=p+q≤n`, the real value
`i^(p−q)(−1)^(k(k−1)/2)∫α∧bar(α)∧ω^(n−k)/(n−k)!` is positive. Construct the associated
real polarization; obtain a rational polarization from this Lefschetz construction when
the Kähler class is rational.

Prove `[ω^k]≠0` for 0≤k≤n on nonempty compact Kähler manifolds, and that a nonzero
holomorphic k-form is d-closed and has nonzero de Rham class. For a nonempty compact pure
k-dimensional analytic subvariety V, construct integration over V_reg as a de Rham
functional, not an unspecified singular fundamental class. Define this integral using
K5a's L¹ extension on the complex-oriented smooth manifold V_reg with its induced
metric obtained from DG12.1's pullback along the regular-locus immersion on
K1/K3's actual holomorphic-submanifold carrier and its realification. K6.1
constructs and installs as local instances the `RiemannianBundle`,
`IsContinuousRiemannianBundle` and `IsContMDiffRiemannianBundle` structures
for that metric, preserving the given topology. Derive local compactness
and σ-compactness from the finite-dimensional second-countable manifold
structure before applying `riemannianVolume`. For each metric separately,
write the pulled-back top form as `f dvol_g` and integrate the L¹ function f
against the native Riemannian volume. Own Lelong local finite-mass estimates, and
deduce integrability from those estimates and boundedness of the ambient smooth
form on compact M. Prove agreement with DG5's `integralTopForm` when the pullback
has compact support, independence of the induced metric, Wirtinger's calibrated
volume equality and Stokes for analytic sets. Own the analytic cutoff lemma:
for a compactly supported smooth (2k−1)-form β on M, construct smooth ambient
cutoffs χ_j vanishing near S, tending to one on V_reg, with
`∫_(V_reg) |dχ_j∧ι*β| → 0` and convergence of the integrals of
`χ_j ι*(dβ)` to the L¹ integral of `ι*(dβ)`. Derive these bounds from the
analytic local parametrizations, their finite-sheet mass estimates and
the lower-dimensional singular-set covering estimates, proving the required
covering and gradient bounds; dimension drop alone is not an integral estimate.
Combine smooth compact-support Stokes with this cutoff lemma to obtain
`∫_(V_reg)dβ=0`, using singular-locus cutoffs and finite-mass boundary control. Prove
positivity `∫_(V_reg)ω^k/k!>0`, hence the nonzero functional `[α]↦∫_(V_reg)α` on
`H^(2k)_dR(M;ℝ)`. This avoids presupposing a triangulation/fundamental class of a singular
space. Via the real de Rham comparison and the perfect evaluation pairing for compact
ambient manifolds, identify this functional with a nonzero ambient class in `H_(2k)(M;ℝ)`;
construct that comparison from AlgebraicTopology's universal-coefficient and
finite-dimensionality APIs. This supplies the real homology class by ambient perfect duality;
an integral singular cycle on V is not presupposed by this analytic construction.
Also construct the integral fundamental class rather than stopping at that
real class. For compact pure-dimensional analytic V, define `[V]` as the
unique class in `H_(2k)(V;ℤ)` whose local images at regular points are K1's
complex-orientation generators. Prove existence and uniqueness by the
following construction, including reducible V with coefficient one on every
regular component. For smooth V this definition agrees with AT6.3's integral
fundamental class. Consume DG9.3's general fundamental-class integration
formula to identify its real pushforward with the analytic integration class.

For singular V, consume K3's finite regular-piece partition and construct the
subcomplex comparison for a triangulation of the compact ambient M with V and
S=V_sing as subcomplexes.
Use K3.0's real `IsManifold` at order ω and its real-analytic defining
equations. Derive `dim_ℝ S≤2k−2` from K3's complex dimension drop and the
realified analytic-submanifold dimensions. Consume
[RealAnalyticGeometry R0–R5](../RealAnalyticGeometry/README.md), including
real semianalytic normal decomposition, the affine Łojasiewicz theorem,
real-analytic embedding and transport, for the manifold-level semianalytic
triangulation theorem of Łojasiewicz (§3, Theorem 2, p. 464).
This theorem applies to second-countable real-analytic manifolds and locally
finite semianalytic families. Prove that M, V, S and the chosen strata meet
these hypotheses using K3.0's real-analytic chart equations; compactness
reduces the locally finite triangulation to a finite complex. Require the
realization map on each open simplex to be an analytic isomorphism onto
its analytic-submanifold image inside a single stratum. Its differential is
injective, so simplex dimension is at most the stratum's dimension. Derive
that V has no simplices above dimension 2k and S none above dimension 2k−2.
Use GT Layer11's carrier `|K|` and a homeomorphism `|K|≃ₜ M`, with the two
subcomplex images exactly V and S. Semialgebraic triangulation alone does not
supply this theorem. Transport the native CW structures using GT Layer11
and AT4.7's `simplicialRealizationCW`; AT Stage4's cellular/singular comparison
then gives homology vanishing for S in degrees 2k and 2k−1. Prove that
the oriented top simplices define the relative class in
`H_(2k)(V,S;ℤ)`. Prove that each (2k−1)-simplex outside S has exactly two
top-dimensional cofaces, by the local homology of the smooth 2k-manifold
V_reg and the simplicial star/link description. Own the comparison
`H_j(|L|,|L|∖{x};ℤ) ≃ H̃_(j−d−1)(Lk_L τ;ℤ)` for x in the interior
of a d-simplex τ, using GT Layer11's star/link API, excision and the suspension
homology comparison, including the empty-link/augmented degree convention.
In codimension one the link is a finite set of c points, whose reduced H₀ is
`ℤ^(c−1)`; the local orientation group is ℤ, forcing c=2.
The complex orientations
induce opposite face orientations, so their contributions cancel. The long exact
sequence identifies this with `H_(2k)(V;ℤ)`. Its local orientation images
establish the characterization above and independence of the triangulation.
For k=0, S is empty and `[V]` is the sum of the positively oriented points.

Own the integration comparison for this class through forms supported away
from S; do not integrate a smooth form over nonsmooth triangulation simplices.
Construct an open neighborhood N of S in M which deformation retracts onto
S, using AT Stage4's `cwSubcomplexNeighborhoods` and transport through the
ambient triangulation. For k>0, cellular dimension
vanishing, AT's real universal-coefficient comparison and DG8's de Rham
isomorphism give `H^(2k)_dR(N)=0`. Thus every closed smooth 2k-form α on M
restricts to `dβ` on N. Choose a smooth χ with `tsupport χ⊆N` and equal to
one on an open neighborhood U of S, using DG's bump functions and partitions
of unity. Extend χβ by
zero and set `α′=α−d(χβ)`. Prove α′ is smooth, closed, cohomologous to α
and zero on U. Analytic-set Stokes gives
`∫_(V_reg)α′=∫_(V_reg)α`; the ambient homology pairing is unchanged too.
DG8.4's open-pair cone sends `(α′,0)` to `[α′]_rel∈H^(2k)(M,U;ℝ)`,
whose absolute image is `deRhamHom[α′]`. Evaluate this relative class on
the image of `[V]` under the continuous map of pairs
`(V,V∩U)→(M,U)`. Excise the closed singular locus, which is contained in
the interior of V∩U, to obtain
`H_(2k)(V_reg,V_reg∩U;ℤ)≃H_(2k)(V,V∩U;ℤ)`.
The remaining inclusion `(V_reg,V_reg∩U)→(M,U)` is smooth, so DG8.4's
relative `chainIntegral_map` compares evaluation with the pulled-back form.
Let C be the closed support of that top form on V_reg; prove C is compact,
and `V_reg∩U⊆V_reg∖C`. Under enlargement of the relative subset to
V_reg∖C, the class coming from `[V]` is AT6.3's compact-set orientation
class. Prove this by its local orientation images and excision naturality.
Prove the analytic integral of a form whose pullback has compact support
equals DG5's `integralTopForm` on the oriented smooth manifold V_reg.
Apply DG9.3's compactly supported relative integration formula and DG8.3's
smooth/continuous relative-chain comparison, with compatibility of the
two relative evaluation maps under enlargement.
This yields `∫_(V_reg)α=⟨deRhamHom[α],ι_*[V]_ℝ⟩` without a smoothness
assumption on the analytic triangulation. Positivity proves the integral
ambient class is nonzero. Extend to effective analytic cycles by summing
their irreducible component classes with the specified positive integer
multiplicities, and prove additivity of the integration comparison.

## K7. Projective, torus, and Hopf examples

**K7.1. Projective charts and orientation.** Use the single carrier
`Projectivization ℂ (Fin (n+1) → ℂ)` with AlgebraicTopology Stage 4.6's
quotient topology from the nonzero vectors. Consume #279 Milestones 1–3's
complex-manifold, real-restriction and atlas-transport interfaces,
K3.0's finite-dimensional holomorphic calculus and
K1's complex orientation. This construction precedes associated bundles
and uses neither SmoothBundlesConnections B2 nor K5.

Construct the affine chart on `U_i={ [v] : v_i≠0 }` by the ratios
`(v_(i.succAbove j)/v_i)_(j : Fin n)`. Fix the coordinate enumeration
`Fin.succAbove i`, its inverse insertion `Fin.insertNth i 1 z`, and
the chart model `Fin n → ℂ` with
`𝓘(ℂ, Fin n → ℂ)`. Prove openness, representative independence, the
inverse `[1:z]` in those coordinate positions, chart homeomorphism and
holomorphic transition maps. Give the complex-linear comparison to
`EuclideanSpace ℂ (Fin n)` and its real scalar restriction. These affine
charts construct the projective manifold directly; the discrete quotient
theorem in #279 is not used for the ℂ× action.

Prove `T2Space`, `CompactSpace`, `SecondCountableTopology` and
`ConnectedSpace` on this same carrier for every n≥0. Use chart ratios to
separate distinct lines, the continuous surjection from the finite-dimensional
unit sphere for compactness, and the finite atlas for second countability;
include ℂP⁰ as a point. Prove the underlying real smooth atlas and its
complex orientation agree with K1. Upgrade the existing equivalence
`OnePoint.equivProjectivization ℂ` to a homeomorphism and a biholomorphism
for #279's OnePoint atlas, using its formulas `t ↦ [t:1]`, `∞ ↦ [1:0]`
and the complex-linear identification `Fin 1 → ℂ ≃ ℂ`. Supply chart,
inclusion, coordinate-permutation and linear-action naturality APIs.
The n=1 member of this projective family has its own native carrier;
the biholomorphism identifies its atlas with #279's `OnePoint ℂ` atlas.
The single-carrier convention in #279 governs its Riemann-sphere construction
on `OnePoint ℂ`; K7.1 owns the general-n projective family, including n=1.
Projective-family consumers use the `Projectivization` carrier; Riemann-sphere
consumers use `OnePoint ℂ` and this biholomorphism. Use that comparison for
every ℂP¹ example and transport theorem.

**K7.2. Projective bundles, forms and cohomology.** Construct tautological O(−1),
dual powers O(k), Hermitian metrics and normalized Fubini–Study form. Prove
the holomorphic tensor and dual laws `O(a)⊗O(b)≃O(a+b)` and
`O(k)*≃O(−k)` for all integers a,b,k by their transition maps. Prove global
well-definedness, positivity, closedness, Chern-curvature formula and the hyperplane
identity `∫_(ℂPⁿ)ω_FS∧β=∫_H β` for every closed degree-(2n−2) form β, in the real de Rham
carrier. Prove `∫_(ℂPⁿ)ω_FS^n=1` with complex orientation. Identify `H⁰(O(k))` with
homogeneous degree-k polynomials for k≥0 by the local transition/Hartogs argument, and
prove dimension `binomial(n+k,n)`. For ℂP¹ prove H⁰(O(k))=0 for k<0
directly from its two projective charts and the Laurent/Cauchy growth estimates.
Construct the holomorphic isomorphism `K_(ℂP¹)≃O(−2)` from
`dz=−w⁻²dw`, keeping the transition-frame convention. With K5b's Serre
duality deduce H¹(O(−1))=0 and `h⁰(O(−1))−h¹(O(−1))=0`, independently of
Riemann–Roch or classification of Pic(ℂP¹) by degree.
Compute the projective Dolbeault/Hodge groups and cup
ring: construct on this same carrier Mathlib's `CWComplex` structure with
one cell in each even dimension 0,2,…,2n and none in odd dimensions, specifying
its characteristic maps and skeleta. The CW construction uses only K7.1
and AlgebraicTopology Stage 4. Its cellular/cup calculation consumes Stage 6, without
its Stage 7 Euler-characteristic theorem. Own the cellular/cup calculation `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, |u|=2, using
AlgebraicTopology's cellular groups and products, with u the hyperplane class
normalized by `⟨u,[ℂP¹]⟩=+1`. Compare its real de Rham image with
`[ω_FS]` and SBC B6.2's `c₁(P)` for the Hopf circle bundle P,
whose dual-character associated line is O(1),
using SBC B6.3's Chern–Weil comparison. This c₁ is the independently
constructed circle-bundle class; it does not consume CharacteristicClasses'
later universal class construction.
Use Stage 6 Poincaré duality and restrictions to ℂP^k to identify the
powers of u and the cup multiplication, beyond the additive cellular groups.
CharacteristicClasses C1.5 consumes these finite carrier inclusions, cup
rings and restriction-normalized u classes for its finite-to-infinite
comparison; AT 8.12 consumes that later comparison.
Prove nonempty closed complex submanifolds of projective space are compact Kähler and `h^(k,k)≥1` for
0≤k≤dim from nonzero Kähler powers. These are the geometric inputs to
GeometricQuantization, whose scaled symplectic forms use k≥1.

For a complex torus `ℂⁿ/Λ` with a full real lattice, consume #280's quotient and descent.
Prove its flat Kähler structure, invariant holomorphic forms, and
`h^(p,q)=binomial(n,p)binomial(n,q)`. Include the elliptic one-dimensional case and its
genus/Betti dictionary. For every compact connected Riemann surface define
its geometric genus g=h^(1,0) and prove `h^(0,0)=h^(1,1)=1`,
`h^(0,1)=g` and `b₁=2g` by Hodge comparison. Prove the topological dictionary:
on a closed oriented surface presented as a connected sum of j tori, use
AlgebraicTopology's cellular comparison on the standard polygon cell model
(one vertex, 2j edges, one face attached by the product of commutators) to
compute b₁=2j, hence g=j. Consume GeometricTopology Layer 1's
polygon/smooth-surface comparison; its compact surface
classification supplies such a presentation and its uniqueness, while K7
owns the cohomology and genus comparison. On the same oriented polygon model compute
`H²(Σ;ℤ)≃ℤ`, identify its generator by evaluation on AlgebraicTopology
Stage6.3's fundamental class, and prove that evaluation is an isomorphism.
Compute the integral degree-one cup pairing on the 2g polygon generators
as the standard unimodular symplectic matrix, preserving the complex
orientation and the cohomology comparison with the smooth surface.
These are the integral fundamental/intersection comparisons used in Index I7.4.
Define the geometric genus of a
compact n-fold as `h^(n,0)`. The theta sections of positive torus line bundles and their
quantization are GeometricQuantization's targets.

Construct the primary Hopf surface `(ℂ²\{0})/(z↦2z)` using #279
Milestone 4's free properly discontinuous holomorphic quotient, and its smooth
diffeomorphism to `S¹×S³`. Compute its de Rham groups and prove it is not Kähler since
`H²(M;ℝ)=0`. Prove `h^(1,0)=0` by Hartogs extension and dilation invariance, compute
`h^(0,1)=1`, and identify the failure of Hodge symmetry. Own the Laurent/Čech computation
of `H¹(ℂ²\{0},𝒪)` and its dilation action: its invariant part is zero, while
`H¹(ℤ,𝒪(ℂ²))≃ℂ` by coefficientwise coinvariants. Own the covering Čech/group-cohomology
(Cartan–Leray) comparison and use it to obtain h^(0,1)=1. Extend the same Leray-cover
Laurent computation to Ω¹ with its twisted dilation action: holomorphic monomials times
dz_j have weights `2^(d+1)` (d≥0); H¹ Laurent monomials `z₁^(−m)z₂^(−n)dz_j` have weights
`2^(1−m−n)` (m,n≥1). No weight is 1; prove vanishing of coinvariants and invariants to
obtain `h^(1,1)=0`. Prove the full diamond has precisely
`h^(0,0)=h^(0,1)=h^(2,1)=h^(2,2)=1` and all others zero; consequently
`b_k=Σ_(p+q=k)h^(p,q)` despite failure of symmetry. Prove it admits no holomorphic
embedding in any ℂPⁿ.

## K8. The Frölicher spectral sequence and non-Kähler comparison

Construct the spectral sequence of the double complex of smooth type forms, with
`E₁^(p,q)=H^(p,q)_∂̄`, converging to complex de Rham cohomology. Consume DGFloer's generic
filtered-complex spectral sequence and own its decreasing cohomological column-filtration
adapter, with `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)`, finite filtration and associated-graded
convergence. Use Mathlib's `SpectralObject`/bicomplex carriers; do not create another
spectral-sequence object. Prove E₁ degeneration in the compact Kähler case using K6.

Construct the complex Heisenberg group and its Gaussian-integer lattice, the compact
Iwasawa quotient and invariant form equations. Compute `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4`
with a proof that the invariant-form calculation gives the relevant cohomology. Exhibit
the nonzero first spectral differential and the failure of an additive Hodge decomposition
on this compact complex manifold. Own the Heisenberg group and lattice, the
freeness and proper discontinuity of its holomorphic lattice action, and
cocompactness. Consume #279 Milestone 4 for the quotient complex manifold and
its projection/descent API; build the cohomology-comparison prerequisites here. Consume LieGroupoidsPoisson G1.3's all-degree real
Chevalley–Eilenberg differential and own its scalar-extension and complex-summand adapter:
on the underlying real algebra, identify the complexification with `𝔤⊕bar(𝔤)`, with zero
mixed bracket, and construct the complex-linear CE complex of `bar(𝔤)` and the invariant
Dolbeault bicomplex. Own Nomizu's real de Rham comparison for compact nilmanifolds and
Sakane's Dolbeault comparison for compact complex parallelizable nilmanifolds. For a
central extension by a compact torus, filter the CE complex by base/horizontal degree and
prove the Hochschild–Serre E₂ identification with base CE cohomology tensor central-fiber
cohomology. For the full de Rham complex own the central-torus bundle spectral-sequence
page identifications (vertical de Rham E₁ followed by base cohomology E₂). For Dolbeault
own the Borel spectral-sequence construction for these holomorphic central-torus
fibrations: fiberwise ∂̄ harmonic projection and translation-invariant fiber cohomology,
the smooth local-system/trivial-monodromy comparison, and the corresponding base/fiber E₂
identification. Prove the inclusion from invariant to full filtered complexes induces the
comparison on these pages; apply induction on the central torus quotient and the
finite-filtration comparison theorem. Generic DGFloer machinery supplies
convergence/naturality, not these geometric page identifications. Apply Sakane only to
this precise complex-parallelizable nilpotent class. An invariant subcomplex alone does
not prove its inclusion is a quasi-isomorphism.

## Order and references

K3.0 several-variable calculus precedes K1. K1's scalar-restriction and
orientation paragraph precedes K7.1 and SBC B1's acceptance examples;
K1's eigenbundle calculus consumes SBC B2's complexification and precedes
K2's scalar calculus, local lemma and Ω^p sheaves, which precede K4's
holomorphic bundles and connections. K2's bundle-valued comparison follows
K4's holomorphic-section sheaf and ∂̄_E. The rest of K3 uses that local analysis and feeds K4's
analytic-sheaf examples. K5a's pointwise real
star, orientation line and density bundle use DG and SBC B2 independently
of PDO P1.0 and K1–K4. K5a's BundleTest, BundleDistribution and Fréchet
section carriers follow its density line and use chart/frame analysis
and SBC B3–B4's connection comparisons,
independently of P1.0. PDO P1.0 consumes that density bundle; K5a's
distributional operator action, Hilbert-scale, Laplace-type and de Rham Hodge
developments then consume P1.0, SBC B2–B4, PDE Lane A.3 (componentwise
on finite-dimensional fibers), VariationalMethods V2–V5.2 and AT, with
HopfRinow Layer 1's Levi-Civita connection through P1.0. VM V2–V5.2
are abstract prerequisites; its geometric comparison V5.3 follows K5a.
PDO P1.1 and P2 onward consume this analysis. K5b uses K1, K2, K4
and K5a. K6.0 uses K1/K2/K4 and K5a local identities, and precedes
RealAnalyticGeometry R3/R4/R5. K6.1 follows K5b, K6.0 and K3's analytic-set theory, K3.0's real-analytic
atlas, RealAnalyticGeometry R1/R5, DG8.3–8.5/9.3/12.1, AT4.5/4.7/6.1/6.3
and GT Layer11. K7.1 uses K3.0, K1's complex orientation and
#279 Milestones 1–3 and AT Stage4.6's projective quotient topology, and precedes K2's ℂP¹ acceptance. K7.2's CW
construction uses K7.1 and AT Stage 4 before AT Stage 7, independently
of K2–K6; its bundle/forms/Hodge applications use K4–K6. K8 uses K2/K5/K6
and the generic spectral-sequence machinery. K7.2's torus computations follow
#280 Milestone 1 and K5b/K6.1. Its Riemann-surface genus and integral cup
computations follow GT Layer 1, AT Stage4's CW theory, Stage6's
cellular/cohomology-product comparisons including Stage6.3, and K6.1. Its Hopf computations
follow #279 Milestone 4, K2's Leray-cover comparison, K3's Hartogs theorem,
K5b's Serre duality and DG's Mayer–Vietoris theorem. The Iwasawa quotient
consumes #279 Milestone 4; its invariant cohomology comparisons consume
LieGroupoidsPoisson G1.3 and the filtered-complex machinery as specified in K8.
Every local definition and bundle construction has restriction, gluing, functoriality and transport
APIs before it becomes a global theorem's input.
Within K3, the convergent complex local-algebra and singular-locus targets
precede RealAnalyticGeometry R1's local semianalytic/component results; those
results then supply K3's finite regular-piece partition. R1 does not consume
that later partition. RealAnalyticGeometry R5 applied to that finite family
supplies the compatible triangulation in K6.

- Griffiths and Harris, *Principles of Algebraic Geometry*, chapter 0, for
  local analytic geometry, Dolbeault/Hermitian and Kähler foundations.
- [Demailly, *Complex Analytic and Differential Geometry*](https://www-fourier.ujf-grenoble.fr/~demailly/manuscripts/agbook.pdf),
  for analytic germs, bundle connections, elliptic theory and Kähler identities.
- Webster, *A new proof of the Newlander–Nirenberg theorem*, Math. Z. 201 (1989), 303–316, for the convex-domain homotopy and rapidly converging iteration route.
- [Sakane, *On compact complex parallelisable solvmanifolds*](https://ir.library.osaka-u.ac.jp/repo/ouka/all/5964/ojm13_01_13.pdf), Theorem 1 and the nilpotent case, for the invariant Dolbeault comparison.
- Wells, *Differential Analysis on Complex Manifolds*, for Dolbeault, elliptic
  Hodge theory and duality.
- [Angella, *The cohomologies of the Iwasawa manifold and of its small deformations*](https://arxiv.org/abs/1212.4351),
  for the explicit non-Kähler cohomology comparison.

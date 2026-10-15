# Roadmap: Heegaard Floer homology, analytically

Heegaard Floer homology (Ozsváth–Szabó) and its knot-theoretic sibling knot Floer
homology are among the most consequential inventions of twenty-first-century
low-dimensional topology: they categorify the Alexander polynomial, detect Seifert
genus and fiberedness, bound the slice genus and unknotting number, and power most
modern progress on surgery, concordance, and contact geometry.
This roadmap is the **analytic half**: the full holomorphic
tower — Morse homology, Fredholm theory, transversality and Sard–Smale, the
Cauchy–Riemann elliptic package, Gromov compactness, gluing, Lagrangian Floer
homology, and `HF̂` via holomorphic disks in `Sym^g(Σ)`. The theories that are
combinatorial all the way down (grid homology, lattice homology, the
Ozsváth–Stipsicz–Szabó stable `HF̂`) are its companion
[Combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md);
the two meet at precisely-stated reconciliation theorems, which this roadmap owns
(they depend on the analytic tower, the long pole).

This is **not a linear roadmap**. It is a family of lanes with several independent
on-ramps. Suggested homes: `TauCeti/Analysis/` and
`TauCeti/Geometry/Symplectic/` (the analytic lanes), with `TauCeti/LowDimTopology/`
holding the Heegaard-diagram geometry where the analytic tower lands.

## Why this is less hopeless than folklore says

The analytic track has a reputation as a "major research project" (Patrick Massot),
and it is — but two findings, both verified against the sources, make it materially
less hopeless than the folklore suggests:

- Heegaard Floer needs **no virtual machinery**. Ozsváth–Szabó's transversality
  ([arXiv:math/0101206](https://arxiv.org/abs/math/0101206), Theorem 3.4) is
  classical Sard–Smale over nearly-symmetric almost complex structures, with Oh's
  boundary-injectivity as input, so polyfolds and virtual fundamental cycles are off
  the critical path entirely.
- The **`Sym^g` route is analytically lighter for a formalizer than the cylindrical
  one**: fixed strip domain, genus-zero disk-tree bubbling only, no Riemann mapping
  theorem, no Deligne–Mumford, no SFT compactness. The only index theorem the whole
  tower needs is Riemann–Roch-with-boundary via Robbin–Salamon spectral flow;
  Atiyah–Singer never appears.

Armstrong–Kempe's De Giorgi–Nash–Moser formalization
([arXiv:2604.05984](https://arxiv.org/abs/2604.05984), ~56k lines of Lean 4 built in
weeks from human blueprints) is an existence proof that this kind of analytic
substrate yields quickly to blueprint-driven effort.

## The end goals

- **v3 (the long game, analytic).** Morse homology; Lagrangian Floer homology of
  exact Lagrangians; `HF̂(Y)` over 𝔽₂ via holomorphic disks in `Sym^g(Σ)`.
- **Reconciliations (this roadmap owns them).** The three "the two definitions
  agree" theorems that join each combinatorial invariant to its holomorphic
  counterpart. They depend on the analytic tower, which is the long pole, so they
  live here rather than being split across both roadmaps; see the
  [Reconciliations](#reconciliations-the-seams-and-the-long-pole) section below for
  the precise statements.

```lean
-- the shape we are building toward (state in Suggested.lean as the types land):
--
-- v3: the analytic invariant for a pointed Heegaard diagram, over 𝔽₂:
-- def HFhat (D : PointedHeegaardDiagram) (hD : D.WeaklyAdmissible) (J : ...) :
--     GradedModule (ZMod 2) := ...   -- Lagrangian-Floer-type homology in Sym^g
-- theorem HFhat_invariant : ...      -- diagram moves + J-independence, naturality-ready
```

## Standing conventions (spell them out; never bake in)

- **Ordinary Morse theory over ℤ; holomorphic theories over 𝔽₂ and then ℤ.**
  Lane M constructs integral orientation lines and signed counts, without
  requiring an orientation of the ambient manifold. The holomorphic theory has orientation systems (an
  affine torsor of choices, and a historical source of errata). State every 𝔽₂
  theorem so the coefficient ring can be generalized without restating the geometry.
- **State invariance naturality-ready.** In a proof assistant you must decide on
  day one whether "the invariant" is an isomorphism class, a group, or a transitive
  system of groups and isomorphisms (Juhász–Thurston–Zemke
  [arXiv:1210.4996](https://arxiv.org/abs/1210.4996)). Phrase invariance as
  specified isomorphisms attached to elementary moves, with composition laws stated
  as separate (later) targets, even while the first theorems prove only the
  isomorphism class. ⚠ Basepoint-moving maps act nontrivially (Zemke); do not
  quotient them away silently.
- **In the analytic lanes, hypotheses stay unbundled** exactly as in the PDE
  roadmap: totally real vs Lagrangian boundary conditions, tame vs compatible `J`,
  weak vs strong admissibility are separate named hypotheses, never a bundled
  structure.
- **Do every analytic move once, in the cleanest setting first.** Morse homology
  (Lane M) is the full Floer proof architecture at ODE cost; exact Lagrangian Floer
  (Lane F3) is the first genuine Floer homology with bubbling switched off. Each is
  a deliberate rehearsal of the moves the `Sym^g` theory needs, not a detour.

## Existing substrate (consume)

- **Singular homology** (`Mathlib/AlgebraicTopology/SingularHomology/*`, with
  homotopy invariance): the comparison target for Morse homology in Lane M.
- **Homological algebra:** `Mathlib/Algebra/Homology/*`, complexes over any
  `ComplexShape ι`, homology via `ShortComplex`, homotopies and
  `HomotopyEquiv.toHomologyIso`, **mapping cones** (`HomotopyCofiber.lean`,
  `HomotopyCategory/MappingCone.lean`), long exact sequences, Euler characteristics:
  the bookkeeping for every Floer complex and continuation map.
- **Fredholm theory:** Mathlib's
  [`ContinuousLinearMap.IsFredholm`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean)
  includes closed range, finite-dimensional kernel/cokernel, complemented kernel,
  `FredholmPackage` decompositions and continuous quasi-inverses modulo finite-rank
  errors. Consume Mathlib's `IsFredholm.index_comp`,
  `IsFredholm.eventually_nhds_index_eq` and `index_continuousOn_isFredholm`
  in [Fredholm/Open.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean).
  Tau Ceti's `Analysis.Fredholm` modules add direct-sum and compact-perturbation
  formulas, continuous-family/path and Hilbert adjoint/cokernel comparisons. The strip-operator and
  nonlinear Fredholm-section constructions in F0 are new geometric consumers.
- **Sard and nonlinear Fredholm maps:** consume Tau Ceti's
  `ContDiff.addHaar_image_criticalPoints_eq_zero`, `Fredholm.NormalForm`,
  `Fredholm.Proper`, `isMeagre_image_criticalPoints_of_isFredholm`,
  `dense_compl_image_criticalPoints_of_isFredholm`, `levelSetChartedSpace`,
  `isManifold_levelSet`, and the parametric regular-value APIs. Their existing
  finite-order Sard bounds are `k≥(dim E)²+1` and, in the Fredholm reduction,
  `k≥(dim ker)²+1`; the smooth specializations are direct suppliers. F0 owns
  the sharp Fredholm bound and Banach-manifold/bundle adapters;
  DifferentialGeometry10.2 owns the sharp finite-dimensional bound and chart transfer.
- **Analysis, genuinely ready:** Banach-space calculus with **inverse and implicit
  function theorems in Banach generality**
  (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/*`, `Implicit.lean`);
  **manifolds over arbitrary Banach model spaces by design** (`ModelWithCorners`,
  tangent bundles, smooth vector bundles, manifolds with boundary/corners), with
  integral curves and flows on Banach manifolds; compact operators and the
  **Fredholm alternative** (`Operator/Compact/FredholmAlternative.lean`); Arzelà–Ascoli;
  Banach–Alaoglu; Lax–Milgram; strong one-variable complex analysis (Cauchy
  integral, removable singularity, identity theorem, Schwarz lemma); Hofer's lemma
  (`Mathlib/Analysis/Hofer.lean`, whose docstring already names bubbling-off
  analysis for holomorphic curves as its purpose); Bessel-potential Sobolev spaces
  `H^{s,p}(ℝⁿ)` on tempered distributions.
  ⚠ Partitions of unity and smooth approximation require `FiniteDimensional`;
  fine for our purposes, but check before citing them in a Banach context.

## Inventory: what is missing (build here)

Build the nonlinear Fredholm-section and asymptotic-strip operator theory in F0;
the sharp finite-order Sard and Sard–Smale statements, then their
Banach-manifold and Banach-bundle section/transversality adapters; Sobolev spaces in the shape PDE needs them (`W^{k,p}`
on domains, embeddings, multiplication, Rellich: the **shared spine with the PDE
roadmap**, which builds exactly this in its Lane A); elliptic estimates for the
first-order operator ∂̄ (Calderón–Zygmund inequality, boundary regularity for
totally real boundary conditions, bootstrapping); almost complex structures and
the generic symplectic form-calculus adapters in F2.1; Morse–Smale trajectory
dynamics, stable manifolds and Morse homology. Consume MorseTheory's finite
function/sublevel theory and DG's smooth flow. Manifold orientations and degree theory are built by
the [differential-geometry roadmap](../DifferentialGeometry/README.md) (its layers 2 and 10) and
consumed here.

The combinatorics of pointed Heegaard diagrams — generators, domains, periodic
domains, admissibility — that Lane F4 puts a holomorphic count on are built in the
[combinatorial roadmap](../CombinatorialHeegaardFloer/README.md)'s Lane H; consume
them rather than rebuild.

---

## The lanes

The analytic foundation is PDE/domain Sobolev theory and F1's linear estimates,
then F0's nonlinear sections and genericity. M.0a's local dynamics and λ-lemma
precede F0.4, the sole owner of metric existence/genericity. M.0b consumes
that theorem; comparison with arbitrary Morse–Smale metrics is in M.5. Ordinary M.1–M.5 then precede Bott
M.6's conditional trajectory/normal-bundle constructions then precede
F0.7's Bott genericity, which precedes M.7 gluing/complex/continuation and
M.8–M.10 comparisons. F0.5 follows F1's surface estimates and precedes
the holomorphic moduli lanes; F0.6 follows M.0a's dynamics and F0.1–3,
independently of Bott complexes. The holomorphic lanes consume
these foundations; F1 is shared with the PDE roadmap. Canonical
references are named per stage because "follow the canonical text" is the only
sane formalization mode here, and every "standard gluing argument" citation in
the literature is treated as a stub to be re-proved.

### Lane M: Morse homology (Stage 0)

Work on a closed smooth real manifold with a smooth Morse function f and
metric g, using the flow of −grad f. Compactness, Morse–Smale transversality
and choices of unstable orientation are separate hypotheses. Noncompact
compact-band and relative versions carry explicit trapping/completeness
hypotheses. Consume [MorseTheory M1–M6](../MorseTheory/README.md) for native
critical points, Hessian/index, normalized charts, finite attachments,
Morse–Bott negative bundles and convergence/decay, and DG3 for maximal flows.
This lane owns ordinary Morse homology and the Bott trajectory/cascade
complexes under the transversality hypotheses specified in M.6 and F0.7. MorseTheory's attachment CW model and its
inequalities do not assume a trajectory complex.

**M.0a Local stable dynamics.** Extend the native local invariant-manifold
and exponential-dichotomy results to general C^k vector fields at hyperbolic
zeros on finite-dimensional manifold models, for each integer k≥1. Construct
C^k stable/unstable manifolds and prove C¹-continuous dependence of fixed
compact graph pieces on the vector field in the C¹ topology; for smoother
parameter families record the smooth finite-dimensional parameter theorem when the field and
parameter family are smooth. At the C¹ metric threshold, F0.4 consumes
only the stated C¹-continuity of compact graph pieces, not differentiability
of a Banach-C¹ graph assignment. Apply this to −g⁻¹df for C^k metrics and smooth f, and to
smooth metrics. Prove
their injectively immersed open-ball parametrizations, tangent eigenspaces,
flow invariance and local embedded charts; establish the global embedding
properties used for a Morse gradient, rather than inferring them from a
local graph. Prove the λ-lemma and the transverse intersection theorem.
**M.0b Standard metrics.** Consume F0.4 for existence of Morse–Smale
metrics fixing Euclidean models in chosen disjoint Morse neighborhoods.
All-corner smooth gluing/evaluation below is first constructed for those
standard-near-critical models. M.5 owns continuation/metric comparison to
arbitrary smooth Morse–Smale metrics. Do not silently assume a smooth
compactified evaluation theorem for every metric from the local C¹ result.
In MorseTheory's normalized charts use
`f=f(p)−|x⁻|²+|x⁺|²` and the Euclidean metric, so the linear flow is
`(x⁻,x⁺)↦(e^(2t)x⁻,e^(−2t)x⁺)`. Convert the half-quadratic convention
and time/gluing parameters in
[Wehrheim's construction](https://arxiv.org/html/1205.0713v1#S1) explicitly.
For arbitrary Morse–Smale metrics, topological conjugacy transports a
chosen corner structure; it does not make the original level evaluations
smooth automatically.

**M.1 Parametrized and unparametrized trajectories.** Define entire negative
gradient trajectories with limits p at −∞ and q at +∞, the translation
action and its comparison with `W^u(p)∩W^s(q)`. For p≠q prove this action
free and proper, construct quotient charts of dimension ind(p)−ind(q)−1,
evaluation on regular level slices, and independence of those slices.
Treat empty spaces and p=q constant trajectories separately. Prove
sequential broken compactness with ordered time shifts, convergence on
compact time windows and exponential estimates uniform on compact families.
Lyapunov decrease and index drop exclude cycles of nonconstant breaks.

**M.2 Corners and gluing.** Construct compactified moduli with every
codimension-k stratum the ordered product of k+1 nonconstant trajectory
quotients through intermediate critical points. Prove Hausdorffness,
compactness and compatibility of broken convergence with this topology.
Build pregluing, uniformly bounded right inverses and nonlinear quadratic
estimates; prove the Newton correction, uniqueness and surjectivity onto
neighborhoods of each stratum. Specify the gluing profiles and corner
parameters, and prove smooth overlap maps, iterated-gluing associativity
and evaluation compatibility. Construct both the finite-dimensional
flow/slice proof and its F0 `W¹,²` Fredholm-section realization, with an
actual diffeomorphism between their regular moduli. Prove that it carries
M.3's finite-dimensional orientation to F1.4's determinant-line orientation,
including the translation factor. Use Audin–Damian,
Schwarz and Wehrheim's corner/gluing construction as proof references.

**M.3 Integral orientations and the complex.** Choose orientations of
descending spaces D(p)=W^u(p). Orient the quotient by the determinant
isomorphism with ordered factors
`TD(p)=T𝓜(p,q)⊕ℝ(negative-flow tangent)⊕TD(q)`.
Construct the line isomorphism, local-system transport and its changes under
orientation reversal. With outward-first boundary orientation prove
`∂ overline𝓜(p,q)=Σ_r (−1)^(ind(p)+ind(r)−1)`
`overline𝓜(p,r)×overline𝓜(r,q)` for the codimension-one faces;
derive higher-face signs from this same order. Construct finite signed
zero-dimensional counts, the free integral chain group on index-i critical
points and its degree−1 differential; prove d²=0 from compact oriented
one-manifolds. Give coefficient change, orientation-change chain
isomorphisms and the coefficient-free orientation-line version. Compute
the sphere with two maxima/one saddle/one minimum (including the signed
sum of maxima), the torus's opposite-pair cancellations and its integral
homology, and the nongeneric saddle connection with its perturbation.
Compute the ordinary Morse complex of ℝP² over ℤ with one generator in
each degree0,1,2, differential d₂=±2 and d₁=0, recovering H₁=ℤ/2.

**M.4 Integral geometric comparison.** Consume
[GeometricCurrents G1–G4a](../GeometricCurrents/README.md)'s integral carriers,
boundary/pushforward, transverse pullback, dimension-drop and homology
comparison, and CalibratedGeometry C2's integral smooth-chain comparison.
Construct a face-transverse smooth/geometric chain subcomplex for the
stable manifolds and all broken strata. Prove its inclusion is a
quasi-isomorphism by relative moving/approximation and prove the counting
maps respect the actual integral geometric relations. Neither real currents
nor normalized cubical coordinate degeneracies replace these integral APIs.

Construct compactified unstable manifolds with corner strata, their
fundamental integral chains and smooth evaluation maps. Prove the
compactified unstable-disc/characteristic-map theorem and the resulting
actual unstable-cell CW decomposition; compare it to MorseTheory M2's
homotopy CW tower. Construct simplex-to-critical half-trajectory spaces,
including all simplex-face and broken strata, and maps A from geometric
chains to Morse chains and D in the reverse direction. Prove
`∂ overlineD(p)=Σ_r(−1)^(ind(p)+ind(r)+1)`
`overline𝓜(p,r)×overlineD(r)`, the dimension-drop evaluation terms,
the two chain-map identities and AD=id from the positive constant
intersection. Construct the compactified forward-orbit homotopy F and
prove `dF+Fd=DA−id`. Include the quartic-cube truncations, octagon faces
and relative cobordism chains used to verify these identities. Deduce the
integral Morse/singular comparison by these actual maps, with naturality.

**M.5 Continuation and ordinary Cerf families.** Construct endpoint-fixed function/metric paths and
admissible parameter vector fields with positive parameter component.
Specify endpoint critical-index shifts and the universal transversality
condition; slice-wise Morse–Smale is not the parameterized condition.
Use signed compactified spaces to construct the continuation chain map,
constant-path identity and reverse-path inverse up to specified homotopy.
Construct the digon degree-one chain homotopy and the triangle composition
homotopy, together with the singular-comparison square and endpoint-relative
parameter independence. Check both circle counterexamples to naive
continuation. Prove the ordinary contractible-parameter-space invariance
theorem without imposing trivial monodromy on unrelated Floer parameter spaces.
Give the birth/death and handle-slide chain changes and their comparison
with these continuation maps. Own the ordinary one-parameter Cerf theorem
here. Construct relative transversality for partial spatial jets through
order3 of smooth families f_t, fixed in endpoint germs, using localized
polynomial perturbations, finite-dimensional Sard and compact exhaustion
of jet charts. Prove a residual set has only isolated A₂ degeneracies:
`d_xf_t=0`, spatial Hessian corank1, and for a kernel vector v≠0,
`D_x³ f_t(v,v,v)≠0` and `∂_t(d_xf_t)(v)≠0`. Exclude the higher-corank
and higher-degeneracy strata by their codimensions, and prove the
parameterized normal form. This produces birth/death folds with
local potential `x₁³/3±(t−t₀)x₁−Σ_(j=2)^i x_j²/2+Σ_(j>i)x_j²/2`;
full function/metric or horizontal-lift variation gives transverse handle
slides. In that normal form require i≥1; its half-quadratic transverse
coordinates convert to M.0b's unhalved coordinates by rescaling by√2,
and the Euclidean metric/flow is transported with them. Prove the local trajectory/gluing and signed elementary chain
changes at each event. This exact-function theorem uses M.0a/F0 and M.2,
not MorseNovikov N6. Also construct comparison from standard metrics to
arbitrary smooth Morse–Smale metrics through these continuation maps.

**M.6 Bott trajectories and orientation coefficients.** For a compact
Morse–Bott function consume MorseTheory M5's normal form and negative bundle ν⁻_C
of rank λ_C. Use its determinant orientation local system o(ν⁻_C),
including rank>1 and nonorientable bundles. Construct standard normal
metrics/connections whose local negative flow fixes the base point and is
linear on the normal fibers. Build trajectory quotients with source/target
maps to critical components and dimension
`λ_C−λ_D+dim C−1`. Specify component-wise unstable/stable
transversality and transverse iterated endpoint fiber products as hypotheses
on the Bott data; prove the broken-stratum and gluing theorems under them.
The stronger condition W^u(x) transverse to W^s(D) for every x∈C is a
separate hypothesis, verified for the adapted bundle data in M.8; it is
not asserted generic. Endpoint maps need not be submersions. F0.7 owns
the permitted auxiliary-data/moving-chain transversality theorems.
Orient unstable bundles fiber first, `det TW^u(C)=det ν⁻_C⊗det TC`.
Pin the trajectory determinant identification, with negative flow orienting ℝ_flow,

`s*(det ν⁻_C⊗det TC) ≃ det T𝓜(C,D)⊗ℝ_flow⊗t*det ν⁻_D`.

Construct it from the transverse unstable/stable intersection, transporting the
normal of W^s(D) from ν⁻_D along stable fibers. Determinant lines have their
rank parity and tensor swaps use Koszul signs. For transverse α:X→T and
β:Y→T define Q=X×_T Y by the exact sequence with quotient map
`(ξ,η)↦dα ξ−dβ η`. Use subspace-first lifts and pin
`[TX][TY]=(-1)^(dim Y·dim T)[TQ][TT]`; this defines the trajectory-first
order `[TX][TT]^∨[TY]`. Prove associativity, the swap exponent
`dim X·dim Y+dim T·(dim X+dim Y)+dim T`, and the boundary formula
`∂Q=(∂X)×_T Y+(-1)^(dim X+dim T)X×_T∂Y`.
Construct all pullback/pushforward coefficient transports from these identities.
For a broken trajectory through E put `m_CE=dim 𝓜(C,E)` and e=dim E;
prove the outward-first face of the compactified trajectory space has sign
`(-1)^(m_CE+e λ_E)` on `𝓜(C,E)×_E𝓜(E,D)`.
Build the C¹ collar charts in the standard normal flow, using
`s=exp(-2t)` and the rescaled unstable coordinate, and prove that its incoming
negative-flow line gives the outward collar direction. Compare the resulting
determinant identification with the free-endpoint Fredholm determinant
precursors in F0.7/F1.4, compatibly with endpoint evaluation, translation,
parameter families and broken gluing; its isolated-point specialization is M.2.

**M.7 Bott complexes and cascades.** Construct the integral geometric-chain
complex on critical components with coefficients o(ν⁻_C) and total degree
`chain degree+λ_C`, with internal differential `(-1)^λ_C ∂` and the signed
trajectory correspondences. Identify o(ν⁻_C) explicitly with GC's rank-one
free integral local system by determinant-frame signs and prove path
transport/cocycle and orientation-reversal compatibility. Put this graded
line of degree λ_C to the left of the geometric chain. Use trajectory-first
fiber products `𝓜(C,D)×_C σ`, with M.6's exact-sequence orientation
`det T𝓜 ⊗ (det TC)^∨ ⊗ det Tσ` and its negative-bundle coefficient
transport. For `m_CD=dim 𝓜(C,D)` set `g_CD=(λ_D+1)m_CD`.
Define F_CD as `(-1)^g_CD` times the endpoint pushforward, with the output
negative-bundle line placed on the left. Equivalently, it is the outward-first
face of the unstable flowout of σ, read fiber first. Prove this equivalence;
the scalar is independent of the degree of σ. It changes unshifted chain degree
by `d_CD=λ_C−λ_D−1` and total degree by−1. The input-boundary face of
∂F_CD(σ) is `(-1)^d_CD F_CD(∂σ)`, so the internal cross-term has coefficient
`(-1)^λ_D (-1)^d_CD+(-1)^λ_C=0`, including λ_C=λ_D.
For a broken face through E put a=m_CE, b=m_ED and e=dim E. Prove
`g_CD+λ_D+a+e λ_E ≡ g_CE+g_ED+ab+e(a+b)+e+1 (mod 2)`.
This compares M.6's outward-first face with the swap of the two trajectory
factors, proving cancellation of Σ_E F_ED F_CE. Derive the same signs from
the codimension-two boundary of the unstable flowout.
Consume GeometricCurrents G3's ungraded rank-one orientation-line current
extension and F0.7's moving/genericity theorem. Its twisted boundary is the
ordinary chain boundary with flat coefficient transport; apply the shift
`(-1)^λ_C` once in the Bott complex. Here prove
the dimension-drop identities, D²=0, and the continuation maps and
natural homotopies from F0.7's endpoint-relative parameter spaces.
Independently construct the cascade complex using auxiliary Morse–Smale
functions on the critical components, with compactification/gluing of all
intermediate cascades and coherent zero-length identifications. Prove its
comparison with a small cutoff perturbation of f, including normal-constant
extensions, uniform estimates and orientations. The cascade construction
does not require currents. Compare both constructions after their proofs.

Check the constant-function and ordinary-Morse specializations and the product
with an auxiliary manifold N, obtaining `d_Morse⊗1+(-1)^λ 1⊗∂_N`.
On S² construct the minimum-circle, index-one saddle and index-two cap model;
compute the two distinct endpoint faces of the cap-to-circle arc and their
broken composites through the saddle, verifying cancellation with the stated
signs. Check symmetric and nonsymmetric torus differentials and the
endpoint-map chain homotopy;
the reflection mapping-torus/Klein-bottle example with its nontrivial
negative orientation line and integral homology; and the surgery-sphere
component differential. Hamiltonian-circle perfection consumes
ConvexityToric's attachment/equivariant theorem with its actual coefficient
and invariant-metric hypotheses; prove the compatibility with this complex.

**M.8 Filtrations and bundle comparison.** Consume DGFloer1.3's independent
filtered-complex algebra. Construct the critical-value filtration and its
shifted critical-component homology, convergence filtration and extension
data, with explicit torus/sphere computations. Construct index filtrations
only under the stated index-monotonicity hypotheses. Weak self-indexing can
retain same-index trajectory terms in d₀; do not identify E₁ with the sum
of component homologies in that regime.

For a smooth bundle with closed fiber over a closed Morse base, construct the pullback Bott
function, the pullback base negative spaces/orientation systems and a
horizontal connection/adapted metric making projected trajectories
index-decreasing. Build the actual filtered chain comparison with the
ordinary Serre construction owned by DGFloer1.2, identifying E₂ onward
with monodromy, natural maps and the abutment filtration. Include the
actual SU(2)→SU(3)→S⁵ bundle and its cohomology calculation. This comparison
follows M.4–M.7 and the independent ordinary Serre supplier. A point-fiber
specialization of a later DG-coefficient theorem is not an input to M.4.

**M.9 Products and duality.** Construct the signed product complex and
its actual chain comparison for product Morse data. Prove Künneth with
Tor over ℤ and the local-coefficient variants. Identify opposite-function
orientation lines and the dual complex with the correct dimension shifts,
using the ambient orientation system for nonorientable manifolds. Prove
compatibility with AT products, Poincaré and relative duality, rather than
identifying only abstract homology ranks. Compare the Morse Euler/index
proof with MN N7's orientation-free Poincaré–Hopf theorem and CC C2.3's
oriented Euler pairing after the ordinary comparison is available.

**M.10 Witten comparison.** On closed manifolds construct
`d_t=e^(−tf)d e^(tf)=d+t df∧`, its formal adjoint and self-adjoint Witten
Laplacian on CKG K5a's real form-bundle Hilbert/Sobolev carrier. Compute
in an orthonormal frame
`Δ_t=Δ+t²|df|²+t Σ_(i,j)Hess f(e_i,e_j)[e^i∧,ι_(e_j)]`,
where `[a,b]=ab−ba`. Work first with Morse–Smale standard metrics of
M.0b, Euclidean near critical points. For arbitrary smooth Morse–Smale
metrics prove the semiclassical localization and integration-map comparison
by the local Hessian/quadratic-operator approximation with controlled Taylor
remainders. M.5 then identifies the resulting Morse cohomology groups;
it does not transfer an eigenvalue statement between metrics. The model `f=fp−|x⁻|²+|x⁺|²` has Hessian
eigenvalues±2, so derive the factor-of-two conversion from half-quadratic
models. No orientation is required: use K5a's orientation-twisted Hodge
star and its density formal adjoint. Prove the harmonic-oscillator local model, uniform
localization estimates, low-energy cluster rank equal to the critical
counts and a linear-in-t gap above it. On the small complex construct
`I_t(ω)(p)=∫_(D(p))e^(tf)ω` by M.4's compactified evaluation/integration,
prove its cochain identity and its eventual isomorphism with the real
Morse cochain complex. Identify de Rham/singular comparison and the
Morse inequalities through the same maps. These semiclassical estimates
are new targets; K5a supplies the generic closed elliptic realization.

### Lane F0: the nonlinear-analysis substrate

Consume the existing Fredholm operator/index, perturbation and splitting APIs
listed above and the existing smooth nonlinear-map normal-form, regular-level
and parametric-transversality APIs. Consume DifferentialGeometry10.2's sharp
finite-dimensional Sard theorem at `k>max(dim E−dim F,0)`. Own Sard–Smale for a Fredholm map at
`k>max(index,0)` (Smale 1965), using these shapes. Build their Banach-manifold
and Banach-bundle versions, including sections and parametric regularity; prove
the strip-operator and moduli-space dimension/index package using F1's
`∂s−A(s)` convention (McDuff–Salamon, Appendix A). Finite
`C^ℓ` almost-complex parameter spaces use the stated sharp bound: for an
index upper bound N≥0 take k≥N+1, and prove the universal section and
regular projection have class C^k for the selected ℓ and Sobolev order r
(choose ℓ≥k+r+1 to cover the r derivative loss). Export that regularity
comparison before applying Sard–Smale; keep N,r,k,ℓ explicit. Banach IFT: consume
from Mathlib.

1. Construct the actual C^k function and symmetric-tensor Banach spaces
   on compact manifolds for finite integer k, prove positive metrics form
   an open subset, and construct endpoint-fixed parameter-path spaces.
   Give finite-atlas norm equivalence, evaluation/composition regularity,
   localized perturbations and smooth density. C∞ is represented as the
   compatible smooth category, not called a Banach space.
2. Construct `W¹,²` path charts about fixed asymptotic reference paths,
   tangent-section charts and the L² bundle. Use normal/exponential charts,
   metric comparisons, trace and exponential asymptotics with explicit
   weights when needed. Define the gradient-trajectory section and compute
   its full vertical/universal linearization and differentiability class.
   Prove the Fredholm/splitting estimates from F1 before applying the
   section IFT; an annihilator-zero calculation alone gives only dense range.
3. Construct universal zero sets and the regular-parameter projection,
   prove closed/split range and the kernel/cokernel/index comparison with
   the native `parameterProj` linear model. Prove surjectivity by localized
   metric variations along a nonconstant trajectory and the required
   adjoint uniqueness theorem. Separate constant trajectories and
   endpoint-fixed neighborhoods. Apply sharp Sard–Smale under the actual
   finite-order inequality; these universal-section results feed the
   metric-genericity theorem of item4 and the surface-section theorem of
   item5, rather than independently owning those conclusions. For
   gradient sections on W^(r,p) paths use finite C^ℓ metrics and C^(ℓ+1)
   functions, choose ℓ≥k+r+1, and prove C^k universal-section/projection
   regularity with this derivative budget before applying Sard–Smale.
   The low C¹ metric theorem in item4 uses finite-window arguments instead.
4. For fixed smooth Morse f prove Morse–Smale metrics residual in C^k
   positive metrics for every integer k≥1. Supply smooth approximation,
   finite-window transversality openness in C¹ and the countable Baire
   argument needed to reach this threshold; do not apply a high-index
   Sard–Smale theorem directly at k=1. Prove the relative fixed-normal-model
   version consumed by M.0b. For M.5's endpoint-parameter theorem vary
   the full function/metric path or a horizontal lift with fixed endpoint
   germs; metric variation along an arbitrary fixed function path alone
   is not assigned this genericity conclusion.
5. Build the regularity-loss comparisons for the surface/strip universal
   Cauchy–Riemann section and finite C^ℓ almost-complex families, including
   compact supports and relative parameter restrictions. Prove the Banach
   completions yield smooth solutions and the resulting moduli/charts
   are independent of Sobolev completion. Carry the explicit N,r,k,ℓ
   inequalities into each genericity theorem.
6. Prove the C^k closed-return genericity theorem for general vector
   fields on a compact manifold: residual nondegeneracy of periodic
   orbits and their iterates in each bounded-period window, with the
   equilibrium/short-period exclusion, flow-box parameter variations,
   countable intersection and continuation of isolated returns. State
   k and regularity loss explicitly. Compare its fixed-point signs with
   MorseNovikov N5's specialized closed-one-form theorem; the latter does
   not itself give genericity for arbitrary vector fields.

7. For fixed smooth Morse–Bott f on a closed manifold, construct the
   C^ℓ metric Banach space with fixed standard normal models near the
   critical components. Prove residual/dense componentwise unstable/stable
   transversality and simultaneous transversality of all iterated endpoint
   fiber products. Construct exponential-weight trajectory charts with
   free endpoint variables in TC and TD; choose a weight below the uniform
   nonzero normal-Hessian spectral gap and prove the Fredholm index,
   extended-domain and split-range statements using F1.3–5. Prove universal
   surjectivity for each finite broken string by localized metric variations
   in disjoint regular-level windows, then sharp Sard–Smale and a countable
   compact-window argument. Keep the finite-order derivative budget explicit,
   using ℓ≥k+r+1 for C^k sections at the chosen Sobolev order r.
   Group components at a common critical value; no nonconstant trajectory
   connects them, so a false strict ordering of all component values is not
   presumed. Include relative perturbations preserving the normal models.

   Prove the endpoint-fixed one- and two-parameter transversality statements
   for continuation and its composition/identity homotopies. Use full
   interpolation data on M×ℝ and M×ℝ², constant near parameter ends/faces,
   with a parameter potential having the required positive derivative in
   each open continuation interval. Prove compact trapping, preservation of
   fixed boundary data, extended-end Fredholm and all broken-stratum
   transversality. M.7 alone owns the resulting gluing, signed continuation
   maps and small-perturbation correspondence. Follow
   [Zhou §8.1–8.3](https://arxiv.org/abs/1902.06587), Proposition8.4 and
   the relative continuation construction, converting its positive-gradient
   and stable-bundle conventions to the negative-gradient conventions here.

   Prove genericity of auxiliary Morse functions/metrics transverse to
   all cascade beginning/end maps, and face-relative moving-chain
   transversality on critical components, with boundaries and homotopies.
   [Banyaga–Hurtubise](https://arxiv.org/abs/1110.4609), definitions10–11
   and lemma12, supplies the stronger all-fixed-endpoint/submersion case.
   For the weaker iterated-transverse data, redo the localized perturbation
   and fiber-product argument without assuming a submersion, using the
   simultaneous regular-string construction above. No all-fixed-endpoint
   genericity theorem is asserted. Arbitrary Bott f also has its small
   ordinary Morse perturbation and M.3 homology; M.7 proves comparison
   with its Bott constructions.

### Lane F1: the Cauchy–Riemann elliptic package (shared with the PDE roadmap)

The PDE roadmap's Lane A/B builds `W^{k,p}(Ω)`, embeddings, Rellich, and
Calderón–Zygmund in general; this lane needs only the **2-dimensional,
first-order-elliptic-system slice** (McDuff–Salamon, Appendix B), and should
consume the shared spine rather than duplicate it:

1. Construct the finite-chart W^(k,p) surface/bundle adapters, trace and
   multiplication (`kp>2`), using the PDE carriers. Include bordered and
   cylindrical-end surfaces, totally real subbundles and actual transition
   maps. Prove norm equivalence, density, parameter dependence and the
   nonlinear composition estimates used in F0/F2.
2. Prove the Cauchy-kernel interior estimate
   `‖u‖_(W¹,p(K))≤C(‖∂̄u‖_(Lp(U))+‖u‖_(Lp(U)))` for K compact in U,
   1<p<∞, and its variable-coefficient/lower-order and bundle versions.
   Construct boundary flattening/reflection for totally real conditions,
   boundary estimates with the stated coefficient/trace regularity,
   bootstrapping and weak-to-smooth regularity. A global estimate omitting
   the Lp/kernel term requires separate coercivity or normalization.
3. Own spectral flow for real or complex self-adjoint Fredholm families
   on a fixed Hilbert space. Consume
   [SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)'s
   unbounded spectral measure SA-E01, common-domain graph calculus and
   native `Resolvent.Unbounded`. Construct spectral flow from its finite spectral projections
   and prove partition independence, concatenation, direct sum, reversal,
   endpoint-fixed homotopy and the regular-crossing formula (positive
   crossings count positively). Include unbounded families with common
   dense domain D compactly embedded in H, a fixed graph-equivalent
   Hilbert norm on D, C¹ dependence in `D→L H`, self-adjointness on D
   and limits at ±∞ in L(D,H), invertible as maps D→H. Supply
   uniform graph-norm estimates, dichotomies and adjoint-cokernel control.
   The operator `∂s−A(s)` on `W¹,²(ℝ;H)∩L²(ℝ;D)` is Fredholm with
   index `−SF(A)`; prove the actual domain/range estimate and index theorem.
   Give graph-gap transport for changes of trivialization satisfying those
   domain hypotheses, not an assertion for arbitrary discontinuous domains.
   Check A(s)=tanh(s): kernel0, cokernel span(sech(s)), index−1.
   Construct escaping approximate kernels when a limiting eigenvalue is0
   and prove the resulting failure of Fredholmness. Use finite-time evolution
   and dichotomy projections, not a normalized-limit map that loses linearity.
4. Define the Maslov and Conley–Zehnder indices with crossing normalization,
   homotopy, concatenation, direct sum, trivialization-change and gluing
   laws. This is the single owner; DGFloer7 consumes its graph/Robbin–Salamon
   construction. Normalize the CZ index of `exp(t J S)` for sufficiently
   small nondegenerate symmetric S to `−signature(S)/2`; in particular
   a small positive rotation on ℝ² has index−1. For the Hamiltonian
   convention `ι_(X_H)ω=dH` used by DGFloer this gives
   `CZ=n−ind_Morse(H)=ind_Morse(−H)−n`. Our CZ is explicitly
   `−μ_RS`; retain the standard sign of the Lagrangian Maslov index in
   bordered Riemann–Roch. In `(-ω)⊕ω` relative to the diagonal, pin
   `CZ(Ψ)=−μ_RS(graph Ψ,Δ)`. Prove the graph/crossing-form comparison.
   Check `ω=dx∧dy`, `H=ε(x²+y²)/2`, ε>0 small: X_H is clockwise,
   S=−εI and CZ=+1. The small Floer trajectories are negative gradient
   trajectories of −H, consistent with the degree shift FH_*≃H_(*+n). For negative-gradient
   trajectories use A=−Hess f, yielding index ind(p)−ind(q).
   Construct the Fredholm determinant line, dual/adjoint and gluing
   isomorphisms and orientation transport, with translation and parameter
   factors explicitly ordered as in M.3.
5. Prove closed and bordered real Cauchy–Riemann Riemann–Roch:
   `ind_R D=nχ(Σ)+2c₁(E)[Σ]` in the closed case and
   `ind_R D=nχ(Σ)+μ(E,F)` for a totally real rank-n boundary subbundle.
   Build relative c₁ from end/boundary trivializations and its independence,
   excision and clutching laws, consuming CharacteristicClasses C3.2's
   c₁ and determinant-line comparison. Own the elementary symplectic-bundle
   clutching construction independently of DGFloer: prove triviality over
   a disc and over an oriented surface minus a disc from connectedness of
   Sp(2n), choose compatible complex/unitary structures and the transition
   g expressing the complement frame in the disc frame along the positively
   oriented disc boundary. Define the number by `wind(det g)` and prove
   choice/homotopy independence and equality with topological c₁ pairing.
   Pin the graph-loop Maslov number as twice this winding. For frame
   change e′(t)=e(t)g(t), prove `CZ_(e′)=CZ_e+2wind(det g)`, using
   the coordinate path g(t)⁻¹Ψ(t)g(0) and CZ=−μ_RS. Check c₁(TS²)[S²]=2.
   DGFloer consumes this construction/comparison and supplies no input to it. Extend to punctured surfaces with ends
   `(s,t)∈[R,∞)×S¹` positive and `(-∞,-R]×S¹` negative, with complex
   orientation ds∧dt, `A_e=−J∂t−S_e(t)` and `D=∂s−A_e` asymptotically.
   For complex rank n and the CZ convention of F1.4 prove
   `ind_R D=nχ(Σdot)+2c₁^τ(E)−Σ_(e positive)CZ^τ(A_e)+Σ_(e negative)CZ^τ(A_e)`.
   Define CZ(A_e) by the symplectic path solving `Ψ'=J S_e Ψ`, using
   that convention. For the decay weight exp(δ_e|s|), conjugation replaces
   A_e by A_e+δ_e at a positive end and A_e−δ_e at a negative end;
   use those shifted operators in the same formula. As a decay weight
   increases through one exceptional value, the Fredholm index decreases
   by the crossed real eigenspace multiplicity, at either end. Prove the
   formula by gluing and test scalar crossing, trivial cylinder, capped
   disk and constant closed sphere. When A_e has a zero eigenspace,
   choose positive weights smaller than every nonzero end spectral gap.
   For a specified subset S of ends extend the decaying domain by cutoff
   constant sections in ker A_e, leaving the weighted target unchanged.
   Prove this finite-dimensional extension is Fredholm and
   `ind D_extended=ind D_weighted+Σ_(e∈S)dim_R ker A_e`, with its
   determinant-line comparison; use precisely the chosen free endpoint
   variables in each Bott application. These linear theorems precede
   the moduli-space dimension and orientation applications.

### Lane F2: J-holomorphic curves

McDuff–Salamon (*J-holomorphic Curves and Symplectic Topology*, 2nd ed.) as spine,
with boundary versions from Oh and Floer–Hofer–Salamon:

1. **Symplectic and almost-complex foundations.** Consume Tau Ceti's
   compatible/tame J, J-holomorphic maps and the implemented
   `Geometry/Symplectic/Manifold/Energy` and `JHolomorphic/Energy` theory.
   State the new form calculus on DifferentialGeometry 0.4's common
   `SmoothForm I M ℝ 2` carrier; consume its migration comparison
   with the pinned `SmoothTwoForm`. Consume exterior derivative in 1.1 and
   pullback in 0.3, with its exterior-derivative naturality in 1.2, Lie
   derivative/Cartan in 1.4, autonomous flow domain/smoothness/composition in 3.2–3.4 and local
   exactness in 6.1–6.2. Use `RoughForm.interior` for `ι_Xω=ω(X,·)`.
   Build the shared strongly nondegenerate contraction inverse and smooth base
   dependence required here, following
   [HamiltonianSystems Layer1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/480)'s
   existing design. This missing prerequisite is an explicit F2.1 target in
   Tau Ceti's shared symplectic API; the Hamiltonian df case and the generic-
   form migration consume that same construction. The inverse prototypes pin
   the transport interface. Prove their comparison
   through the generic-form migration. Its linear-equivalence
   interface acts on arbitrary covectors. For
   `J : TopologicalSpace.Opens ℝ`, give this construction on the vertical tangent
   bundle over `↥J × M` for a smooth two-form family with nondegenerate slices;
   prove joint smoothness of the inverse. Pin its df specialization to
   `hamiltonianVectorField`, with `ι_(X_f)ω=df`, and use that same inverse on
   general one-forms to construct the Moser field.

   Prove the **domain-local Moser lemma**: for a smooth symplectic family
   ω_t and smooth one-form family α_t on an open time interval containing
   [0,1], with `∂_tω_t=dα_t`, the time-dependent field determined by
   `ι_(X_t)ω_t=−α_t` has `φ_t*ω_t=ω_0` wherever its flow exists through
   [0,1]. Represent families by smooth forms on `↥J × M`, where
   `J : TopologicalSpace.Opens ℝ` contains [0,1],
   with slice forms obtained by `mpullback` along x↦(t,x); define their
   time derivative slice-wise; closedness and nondegeneracy apply to these
   vertical slices. Consume DG 3.5's full maximal time-dependent flow, including
   two-time composition, joint smoothness, inverses and the compact-time escape
   criterion, to obtain compact global flow through [0,1]. Prove the time-dependent pullback differentiation
   identity and the corresponding restriction/naturality statements.
   Derive the smooth-parameter local primitive corollary from DG 5.4's
   homotopyOperator under radial chart contraction centred at x₀, with
   primitive vanishing at x₀, using its smooth regularity and slice naturality.
   Darboux uses the affine form path and one such
   primitive; the parameterized lemma is the interface for C4's families. Prove **Darboux** on
   finite-dimensional boundaryless manifolds using this local
   Moser lemma, shrinking the domain to guarantee flow through [0,1].
   Every point has a partial diffeomorphism pulling back a constant
   nondegenerate form to ω. Consume
   `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `IsAlt.even_finrank`
   and `exists_basis_apply_eq_J_inl_zero_eq` from Tau Ceti's symplectic-basis API.
   Build the continuous-linear symplectic transport to `stdSymplecticForm` on
   `EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n)`: send b(inr a) to
   (e_a,0) and b(inl a) to (0,e_a), so both forms evaluate to +1 in that order.
   Compose this transport with the local Darboux chart to give the standard-model
   Darboux corollary.

   Prove **global Moser** on compact finite-dimensional Hausdorff manifolds with
   boundaryless model (`[T2Space M]` and `[I.Boundaryless]`): the given
   families produce an isotopy from the identity with `φ_t*ω_t=ω_0`.
   Prove smooth-family primitive selection for exact positive-degree forms
   on compact manifolds as a separate target. Compactness gives sigma-compactness;
   the finite-dimensional model with corners supplies second countability of H,
   so `ChartedSpace.secondCountable_of_sigmaCompact` provides the manifold
   hypothesis needed by B6. Consume SmoothBundlesConnections
   B6.0's finite smooth good cover and B6.1's real-constant Čech–de Rham
   comparison. Run the exported smooth contractions
   and partition-of-unity zig-zag on slices of J×U_i, proving smooth dependence
   by differentiation under the homotopy integral. Its final finite-dimensional
   Cech cocycle of constants is a coboundary because the input is exact.
   Choose a fixed linear right inverse of the Cech coboundary on its image;
   apply it to the smooth parameter functions and back-substitute through the
   zig-zag. Prove the resulting one-form primitive varies jointly smoothly.
   For a cohomologous symplectic path, prove that the zig-zag cocycle map commutes
   with time differentiation. Its class is constant, so the derivative cocycle
   is a coboundary; the Čech–de Rham isomorphism implies ∂_tω_t is exact.
   Applying the constructed primitive selector gives the path corollary. Class equality
   without a symplectic path does not suffice. DG 8.5 supplies de Rham
   comparison independently of good covers; good-cover construction is B6's.
   CotangentLagrangian C4 owns only submanifold-relative primitive selection
   and its neighbourhood refinements, consuming the domain-local lemma here.
   Cite the Darboux-by-Moser development in `t4v1/damian_formalizare`,
   `Part2/Darboux.lean`, as existing work; any integration follows the
   repository's author-coordination and licence requirements.
2. **Local theory** (MS Chapter 2): unique continuation, critical points,
   somewhere-injectivity; Oh's boundary-injectivity for totally real boundary.
3. **Compactness** (MS Chapter 4): mean-value inequalities, monotonicity, removal
   of singularities, and **Gromov compactness for strips/disks with totally real
   boundary under energy bounds**, bubbling into trees of disks and spheres. ⚠ No
   Deligne–Mumford, no varying-domain stable maps: fixed genus-zero domains only;
   resist the general theory.
4. **Transversality** (MS Chapter 3; Floer–Hofer–Salamon for strips): universal
   moduli spaces over Banach spaces of `J`'s, Sard–Smale via somewhere-injectivity.
5. **Gluing** (Schwarz's model, then MS Chapter 10): pregluing, uniformly bounded
   right inverses, quadratic estimates, Newton iteration, *including* surjectivity
   onto neighborhoods of broken configurations, the historically under-written
   half.

### Lane F3: Lagrangian Floer homology, exact case

Floer's theorem in its cleanest nontrivial generality, and the first genuine Floer
homology in any prover: **exact Lagrangians in an exact symplectic manifold**
(zero section vs its Hamiltonian image in `T*S¹`, then `T*M`); exactness kills
bubbling outright, so F2.3's bubbling analysis is not yet load-bearing.
Generators, the action functional, moduli of strips, `∂² = 0` by gluing +
compactness, continuation maps, Hamiltonian-isotopy invariance, and
`HF(L, φ(L)) ≅ H_*(L)`-type computations in cotangent bundles. ⚠ Skip monotone
Floer theory entirely: Heegaard Floer replaces monotonicity with admissibility, so
the monotone chapter is a detour on this roadmap.

### Lane F4: Heegaard Floer homology, holomorphically

Ozsváth–Szabó ([arXiv:math/0101206](https://arxiv.org/abs/math/0101206)) §§2–4
over 𝔽₂, consuming Lanes F0–F3 and the diagram combinatorics of the combinatorial
roadmap's Lane H.1:

1. **`Sym^g(Σ)` geometry:** smooth complex structure (elementary symmetric
   functions), the totally real tori `T_α`, `T_β`, `π₂ ≅ ℤ` for `g > 2`, the
   basepoint divisor and positivity `n_z(φ) ≥ 0`. ⚠ `T_α` is only ever needed
   *totally real* (with a taming form); do not chase Lagrangian-ness.
2. **Spin^c structures** (Turaev's vector-field model) and `s_z`; domains and the
   combinatorial Maslov index (Lipshitz's formula `e(D) + n_x(D) + n_y(D)`,
   stateable now, against F1.3 later).
3. **Nearly-symmetric `J`** and transversality (OS Theorem 3.4 = Sard–Smale + Oh);
   **admissibility energy bounds** (OS Lemmas 4.12–4.13) replacing monotonicity.
4. **`HF̂` over 𝔽₂:** `∂² = 0` (boundary degenerations have `n_z ≥ 1`, so they are
   absent from the hat differential); `J`-independence and isotopy invariance by
   continuation; **handleslides via Perutz**
   ([arXiv:0801.0564](https://arxiv.org/abs/0801.0564)): the handleslid torus is
   Hamiltonian-isotopic, so invariance reduces to F3's continuation maps instead of
   a new (triangle) moduli problem; stabilization.
5. **Then, staged:** orientation systems and ℤ; `HF^±`, `HF^∞` (boundary
   degenerations now matter: OS Theorem 3.15); holomorphic triangles and cobordism
   maps; surgery exact triangles; `d`-invariants; naturality (JTZ) as the
   capstone. Each is its own milestone; none blocks v3.

### Lane F5: beyond (far horizon, named so nobody mistakes the scope)

Lipshitz's cylindrical reformulation
([arXiv:math/0502404](https://arxiv.org/abs/math/0502404) **with** the erratum
[arXiv:1301.4919](https://arxiv.org/abs/1301.4919)), with varying source curves and
SFT/Bourgeois–Eliashberg–Hofer–Wysocki–Zehnder compactness
([arXiv:math/0308183](https://arxiv.org/abs/math/0308183)), and, through it,
bordered Floer homology ([arXiv:0810.0687](https://arxiv.org/abs/0810.0687)).
Knot Floer homology via doubly-pointed diagrams lives here too; it is what the
**grid homology = HFK** reconciliation (below) is stated against. ⚠ Polyfolds and
virtual techniques stay off this roadmap: nothing here needs them.

## Reconciliations (the seams, and the long pole)

These are the "the two definitions agree" theorems that join each combinatorial
invariant (built in the
[combinatorial roadmap](../CombinatorialHeegaardFloer/README.md)) to its holomorphic
counterpart built here. Every one depends on the analytic tower above, so the
analytic track is the blocker, and the reconciliations are owned and tracked here
rather than split across both roadmaps. The combinatorial side keeps only pointers
back to this section.

1. **`HF̂_st` = stabilized holomorphic `HF̂`** (the appendix of
   [arXiv:0912.0830](https://arxiv.org/abs/0912.0830)): the Ozsváth–Stipsicz–Szabó
   stable invariant agrees with the holomorphic `HF̂` of Lane F4 up to the tracked
   `(𝔽 ⊕ 𝔽)`-factors, exactly `HF̂` for `b₁(Y) = 0`. Depends on F4.4 (stabilization
   and diagram-move invariance) and the combinatorial Lane H.
2. **Lattice homology = `HF⁻` of plumbed manifolds** (Zemke
   [arXiv:2111.14962](https://arxiv.org/abs/2111.14962)): Némethi's `ℍ⁻` computes the
   holomorphic `HF⁻` of every plumbed 3-manifold. Depends on the staged `HF^-`/`HF^∞`
   flavors of F4.5 and the combinatorial Lane L.
3. **Grid homology = knot Floer homology**
   ([arXiv:math/0607691](https://arxiv.org/abs/math/0607691)): the combinatorial grid
   invariant agrees with `HFK̂`, computed holomorphically from doubly-pointed
   diagrams via the cylindrical reformulation of Lane F5. Depends on F5 and the
   combinatorial Lane G.

The first seam crossed end to end is the genus-1 computation below: `HF̂(L(p,q))`
read off the holomorphic theory matches the combinatorial Lane H answer. ⚠ State
each reconciliation naturality-ready (JTZ): the agreement is an isomorphism attached
to a specific identification of the two complexes, not a bare rank equality.

## Acceptance criteria ("checks along the way")

Concrete checks that rule out vacuous or mis-stated definitions:

- **Morse homology:** `S^n` and `T^n` from standard Morse functions; the
  isomorphism with Mathlib's singular homology (Lane M's reconciliation).
- **Exact Floer:** `HF(L₀, φ(L₀))` in `T*S¹` has rank 2 = `rank H_*(S¹)`; the
  Arnold-type intersection bound in the exact case.
- **`HF̂` computes:** `HF̂(L(p,q))` over 𝔽₂ from the genus-1 diagram (every moduli
  count a bigon) gives `𝔽^p`, one generator per spin^c structure.
- **The two definitions meet:** `HF̂(L(p,q))` computed analytically from the genus-1
  diagram agrees with the combinatorial roadmap's Lane H computation: the first
  reconciliation seam crossed end to end.

## References

- P. Ozsváth, Z. Szabó,
  [arXiv:math/0101206](https://arxiv.org/abs/math/0101206) and
  [arXiv:math/0105202](https://arxiv.org/abs/math/0105202) (Ann. of Math. 2004):
  the holomorphic theory; Lane F4's text.
- M. Audin, M. Damian, *Morse Theory and Floer Homology*, Springer Universitext,
  2014; M. Schwarz, *Morse Homology*, Birkhäuser, 1993; K. Wehrheim,
  [arXiv:1205.0713](https://arxiv.org/abs/1205.0713): Lane M.
- D. McDuff, D. Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed.,
  AMS Colloquium Publications 52, 2012: Lanes F0–F2 (Appendices A–C and Chapters
  2–4, 10); Y.-G. Oh, *Symplectic Topology and Floer Homology* I–II, Cambridge,
  2015: the boundary-condition versions and Lane F3.
- J. Robbin, D. Salamon, *The Maslov index for paths*, Topology 32 (1993);
  *The spectral flow and the Maslov index*, Bull. LMS 27 (1995): F1.3.
- T. Perutz, [arXiv:0801.0564](https://arxiv.org/abs/0801.0564): handleslides as
  Hamiltonian isotopies (F4.4).
- R. Lipshitz, [arXiv:math/0502404](https://arxiv.org/abs/math/0502404) with
  erratum [arXiv:1301.4919](https://arxiv.org/abs/1301.4919); Lipshitz–Ozsváth–
  Thurston [arXiv:0810.0687](https://arxiv.org/abs/0810.0687): Lane F5.
- I. Zemke, [arXiv:2111.14962](https://arxiv.org/abs/2111.14962); Manolescu–
  Ozsváth–Sarkar [arXiv:math/0607691](https://arxiv.org/abs/math/0607691): the
  reconciliation targets (lattice = `HF⁻`, grid = HFK), owned by this roadmap.
- A. Juhász, D. Thurston, I. Zemke,
  [arXiv:1210.4996](https://arxiv.org/abs/1210.4996): naturality, the capstone.
- P. Kronheimer, T. Mrowka, *Monopoles and Three-Manifolds*, Cambridge, 2007: not
  a target, but the gold standard of analytic completeness the analytic lanes
  should hold themselves to.
- S. Armstrong, T. Kempe, [arXiv:2604.05984](https://arxiv.org/abs/2604.05984):
  De Giorgi–Nash–Moser in Lean 4: evidence on formalization speed for the F1
  substrate, and a candidate source to mine.

## How to drive it

Lane M and F0 start as soon as anyone wants the analytic track moving, and so do
the bare symplectic/almost-complex definitions of F2.1; none of them waits for the
[combinatorial roadmap](../CombinatorialHeegaardFloer/README.md). F1 should be
planned jointly with the PDE roadmap rather than alone; F3 is the first analytic
headline and F4 the second. The seams that join the two roadmaps are the
reconciliation theorems above; because each depends on this tower, the analytic
track is what paces them, which is why they are tracked here.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean
Zulip](https://leanprover.zulipchat.com/), and would not have been possible without
them:

- [#maths > Feasibility of formalizing Grid Homology for summer pro...](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Feasibility.20of.20formalizing.20Grid.20Homology.20for.20summer.20pro.2E.2E.2E)
  (summer 2025): Kevin Buzzard's encouragement ("It would be a shame to miss this
  opportunity to get Heegaard Floer homology into mathlib") and Patrick Massot's
  caution that the holomorphic theory is "a major research project", which this
  roadmap takes seriously rather than dismisses.
- [#general > dreams of big projects](https://leanprover.zulipchat.com/#narrow/channel/113488-general/topic/dreams.20of.20big.20projects)
  (2025, Siddhartha Gadgil, Patrick Massot): the holomorphic theory as a dream
  target, and the observation that combinatorial computation must "relate the
  result to actual information" — which the reconciliation targets, joining this
  roadmap to its combinatorial companion, are designed to answer.
- [#general > O(1000) definitions for Annals](https://leanprover.zulipchat.com/#narrow/channel/113488-general/topic/O.281000.29.20definitions.20for.20Annals)
  (2026, Kevin Buzzard and others): Heegaard Floer homology as a recurring missing
  definition in recent Annals papers; also raised in recent TauCetiProject
  target-selection discussions.

Thanks to everyone who contributed to these discussions.

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
For the preliminary sphere example use S²⊂ℝ³ with f=z²: critical equator C
has negative-normal rank0 and the two poles have index2. Choose a metric
invariant under rotations and meridian reflection, standard near these
critical components and diagonally interpolated on the regular cylinder.
The reflection removes angular/normal cross terms; rotation alone does not.
Prove meridian flow, identify each pole-to-equator quotient with S¹ by its
endpoint diffeomorphism, and identify descending compactifications with
hemispherical disks. Choose the two unstable orientations so both endpoint
pushforwards are +[C]. The component-homology differential is
ℤ²_(degree2)→ℤ_(degree1), (a,b)↦a+b; prove H₂=ℤ⟨(1,−1)⟩, H₁=0,
H₀=ℤ and the comparison with an oriented sphere fundamental class.
This two-cap example is separate from the torus arc and surgery-sphere models.
Check symmetric and nonsymmetric torus differentials and the
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
   Consume PDE Lane A7's Banach Hölder spaces. Prove their product
   estimates and local composition/inversion estimates, retaining the
   derivative budget for changes of variables at each finite order. Construct the planar Cauchy–Green and Beurling
   operators with their Hölder bounds: on nested discs and compactly
   supported C^(k,α) data, 0<α<1, the Cauchy right inverse gains one
   derivative locally and the Beurling operator B=∂T is bounded
   on C^(k,α), for every integer k≥0. Specify support radii, cutoff/extension
   operators, normalization of the holomorphic kernel and constants in the
   estimates. Prove ∂̄T=id, ∂T=B, differentiation on compactly supported
   data and continuity for parameter families with common support and norm bounds.
   For an elliptic Beltrami coefficient |μ|<1, use real-linear normalization
   to arrange μ(0)=0. In rescaled coordinates
   μ_ε(z)=χ(z)μ(εz) tends to0 in C^(1,α). On the closed Banach subspace
   of C^(1,α) data supported in one fixed closed disc containing supp χ,
   solve h=μ_ε(1+Bh) by contraction.
   For ψ=z+Th prove positive Jacobian and local invertibility from its
   C¹ closeness to identity. Subtract its value at0 and divide by its
   nonzero complex derivative there; μ_ε(0)=0 makes that normalization
   complex-linear. Rescale back to obtain C^(2,α) local coordinates for
   C^(1,α) coefficients. Bootstrap smooth coefficients to smooth coordinates. These planar
   operators and estimates are targets here, beyond the Lp estimates.
   Construct the normalized real-boundary disc solver before nonlinear
   coordinate changes. For p>2 let X be the closed real subspace of
   W^(2,p)(D,ℂ^n) whose trace lies in e^(3iθ/2)ℝ^n, with its inherited
   Sobolev norm; let Y=W^(1,p)(D,ℂ^n)×ℂ^n×ℂ^n with product norm.
   Prove completeness, bounded trace and center/first-jet evaluation, and
   that ξ↦(∂̄ξ,ξ(0),∂sξ(0)) is a bounded real-linear isomorphism.
   First construct the boundary analytic input: the M. Riesz/Szegő
   projection on the W^(2−1/p,p) trace space and the Cauchy boundary
   extension estimates, with the totally real reflection comparison.
   Use them with the interior estimate to solve the boundary problem
   with W^(2,p) regularity. Fourier modes compute the kernel of the
   unaugmented ∂̄ as a₀+a₁z+conj(a₁)z²+conj(a₀)z³, componentwise;
   the center and first-jet constraints determine those coefficients. On the closed boundary
   subspace of C^(1,α)(D,ℂ^n), prove the same augmented map is a Banach
   isomorphism onto C^α(D,ℂ^n)×ℂ^n×ℂ^n. Use Privalov-type
   boundary estimates for existence and C^(1,α) regularity up to the
   boundary; the open mapping theorem then bounds the inverse.
   Apply this inverse to the inhomogeneous real-boundary operator
   ∂̄u+A(z)∂u+B(z)u with prescribed center and first jet, small
   C^α coefficients and arbitrary C^α forcing, including forcing
   outside W^(1,p). Prove its bounded inverse and parameter dependence
   by the Neumann series. Export this as a standalone local Hölder boundary-problem API;
   identify its Sobolev realization on common data when regularity permits.
   These direct disc constructions use no closed-surface RR theorem.
   Cite existing work in [t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare),
   MorseFloer/Part2/CauchyPompeiu.lean and CauchyHolder.lean, for its Cauchy/Beurling
   Hölder-scale development. Compare its differential/kernel normalization
   with ∂̄=(∂s+i∂t)/2 here. Any code integration follows the repository's
   author-coordination and licence requirements.
   Construct boundary flattening/reflection for totally real conditions,
   boundary estimates with the stated coefficient/trace regularity,
   bootstrapping and weak-to-smooth regularity. A global estimate omitting
   the Lp/kernel term requires separate coercivity or normalization.
   Construct the real CR line-bundle similarity principle: a solution which
   is not identically zero on a connected closed Riemann surface has isolated
   zeros of positive integer order, whose sum is the line bundle's c₁.
   Prove local factorization, unique continuation, coordinate/frame invariance
   and weak-solution regularity. Construct formal adjoints and identify
   dual-Sobolev cokernel functionals with smooth adjoint solutions. The
   formal adjoint is a ∂-type operator on (0,1)-forms; use the metric/density
   and conjugation to put it into the CR-system form. Prove weak regularity
   and unique continuation with locally L^p coefficients for p>2,
   including locally bounded coefficients. Export the standalone local
   vector similarity theorem: a ℂ^m-valued W^(1,p) solution of
   ∂̄ξ+Aξ+Bconj(ξ)=0, with locally L^p matrix coefficients and
   p>2, is an invertible W^(1,p) matrix times a holomorphic vector
   on a sufficiently small disc. F2.2a/c use this theorem. Absorb the antilinear
   term for a given solution into an L^p (p>2) matrix coefficient with
   pointwise norm at most that of the antilinear term, solve the
   small-disc Cauchy integral equation for an invertible similarity frame,
   and reduce to a holomorphic vector. A nonzero adjoint solution therefore
   has a dense nonzero locus. Retain the coefficient/Sobolev hypotheses.
   These linear constructions precede nonlinear intersections and moduli;
   map unique continuation is not a substitute for the adjoint theorem.
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
   Here χ is the finite CW Euler characteristic. Consume
   CharacteristicClasses C2.3's diagonal-self-intersection/duality trace
   comparison with the alternating Betti sum and C3.2's rank-one `c₁=e`.
   AlgebraicTopology Stage7.1's Euler–Poincaré equality and independence
   of a Hausdorff finite CW model identify that Betti sum with χ_CW.
   Apply them to the same `compactManifoldFiniteCWType` used by
   FuchsianOrbifolds Layer5, obtaining `c₁(TΣ)[Σ]=χ_CW(Σ)` with the
   complex/oriented fundamental class and its branched-cover convention.
   Work over ℝ and use AlgebraicTopology Stage6.1's universal coefficient
   theorem over the field, together with duality, to compare cohomology
   dimensions with homology ranks. The finite-CW witness
   is AlgebraicTopology Stage8.7's compact smooth-manifold corollary, which
   consumes GeometricTopology's smooth triangulation; HF constructs no
   second triangulation. This uses no Morse homology or nonlinear moduli.
   Prove the closed formula for an arbitrary given complex structure j
   on the surface, independently of uniformization. Construct the local
   parametrix, the fixed-Sobolev Fredholm family under deformations of j
   and the zeroth-order coefficients, and the cut/glue index comparison
   along a smooth surface decomposition with collars. Compute the local
   Euler and clutching contributions using the bordered linear theorem
   and determinant gluing. No nonlinear curve-moduli or genus-zero
   classification theorem is an input to this linear index proof.
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
   Strengthen this same primitive selector to a continuous linear right
   inverse of d on exact smooth two-forms in the compact-source C-infinity
   topology, linear and therefore satisfying S(0)=0. Prove seminorm estimates
   `‖Sη‖Ck≤Ck‖η‖C(k+r_k)` with specified finite derivative losses and
   continuity of the Moser solution and flow in every Ck norm, uniformly
   on compact time and compact parameter subsets. Assemble continuity in
   C-infinity; testing only smooth finite-dimensional parameter families
   does not establish it. Include support-controlled global flow when the
   field vanishes outside one fixed compact set on a noncompact manifold.

   Construct the spaces of smooth tame and compatible J on a finite-dimensional
   symplectic manifold using the native bundle carriers. Prove nonemptiness,
   a contraction fixing a chosen compatible J₀, and extension of prescribed
   smooth finite-parameter families relative to closed parameter faces and
   closed spatial regions with an open neighborhood of prescribed data.
   Give the pointwise linear-algebra homotopies, smooth bundlewise assembly,
   finite-Ck estimates and C-infinity continuity on compact sources. Retain
   tameness/compatibility as the corresponding distinct hypotheses. These
   constructions precede closed-sphere transversality and group applications.
   CotangentLagrangian C4 owns only submanifold-relative primitive selection
   and its neighbourhood refinements, consuming the domain-local lemma here.
   Cite the Darboux-by-Moser development in `t4v1/damian_formalizare`,
   `MorseFloer/Part2/Darboux.lean`, as existing work; any integration follows the
   repository's author-coordination and licence requirements.
2. **Local theory** (MS Chapter 2). Construct the following local analytic
   floor, before branched-cover normalization, using F1.2's vector Carleman
   similarity principle and elliptic regularity:
   a. For J of class C¹ and a nonconstant C¹ curve on a connected
      domain, first obtain W^(2,p) regularity, p>2, from F1.2. Prove local unique
      continuation and isolated point-preimages. Apply the similarity
      principle also to its differentiated CR equation after trivializing
      the pulled-back complex tangent bundle; prove isolated critical points.
      Compact closed domains therefore have finite critical sets and finite
      fibers, hence finite u⁻¹(u(Crit u)) (MS Lemma2.4.1).
   b. Straighten an embedded reference disc to (a,0) with J(a,0)=i,
      choose a J-complex basis {∂_su₀,Z₂,…,Z_n} along the disc,
      and use its complex normal frame in the local coordinate map
      Φ(a,x+iy)=u₀(a)+Σ_(j=2)^n(x_jZ_j(a)+y_jJ(u₀(a))Z_j(a)), a=w₁,
      in a real target chart. Retain
      the finite-regularity budget: for C^ℓ J, ℓ≥2, the chart is
      C^(ℓ−1). Prove the transverse Lipschitz/normal derivative control
      of the transformed J directly from this frame-linear construction; do not
      infer full C¹ coefficients from an arbitrary C¹ chart (Lemma2.4.2).
   c. Prove the local accumulation-to-factorization lemma (Lemma2.4.3):
      if u₀(0)=u₁(0), du₀(0)≠0, J is C², and exact coincidences
      u₀(z_ν)=u₁(ζ_ν) have z_ν,ζ_ν→0 with ζ_ν≠0, then locally
      u₁=u₀∘φ for holomorphic φ with φ(0)=0. The second branch may
      be critical. In b's adapted coordinates write u₁=(a,b). The normal
      coefficient control gives |∂̄b|≤C|b||du₁|. Set
      C̃=−(∂̄b)b*/|b|² where b≠0 and0 otherwise; it is bounded
      on a smaller compact disc and ∂̄b+C̃b=0. F1.2's vector
      similarity writes b=Gσ with G invertible and σ holomorphic.
      The accumulating zeros force σ=0; the tangential curve equation
      then makes φ=a holomorphic. This proof uses no full Micallef–White
      normal form, root-of-unity exclusion or simple-branch isolation.
   Deduce the somewhere-injectivity results through F2.6b's factorization.
   Construct Oh's boundary-injectivity for totally real boundary separately.
3. **Compactness** (MS Chapter 4): first prove the mean-value inequalities,
   monotonicity and finite-Dirichlet-energy puncture-removal theorem under
   compact-image/uniform-geometry hypotheses, including smooth extension
   and its elliptic regularity. Then construct **Gromov compactness for strips/disks with totally real
   boundary under energy bounds**, bubbling into trees of disks and spheres. ⚠ No
   Deligne–Mumford, no varying-domain stable maps: fixed genus-zero domains only;
   resist the general theory.
4. **Transversality** (MS Chapter 3; Floer–Hofer–Salamon for strips): universal
   moduli spaces over Banach spaces of `J`'s, Sard–Smale via somewhere-injectivity.
5. **Gluing** (Schwarz's model, then MS Chapter 10): pregluing, uniformly bounded
   right inverses, quadratic estimates, Newton iteration, *including* surjectivity
   onto neighborhoods of broken configurations, the historically under-written
   half.


#### F2.6 Closed spheres and rational symplectic applications

This block constructs closed genus-zero curves and their zero/one-marked
moduli on the same analytic substrate. Use compact connected finite-dimensional
Hausdorff symplectic targets, with countable atlases and no boundary, unless
an explicit common compact image set and uniform geometry are supplied.
All map/manifold hypotheses, regularity conditions and family bounds remain
in the statements. The complex orientation and F1.5's closed index
`ind_R D=nχ+2c₁` are fixed throughout. F2.2a–c is the local
analytic floor preceding part b. Part e's local normal-form construction
uses this floor, without quotient moduli. Part b proves the
no-open-noninjective-set lemma;
part e's simple-branch isolation consumes that lemma. The local normal form
uses no quotient moduli, compactness, transversality, intersection positivity
or global adjunction.

**F2.6a Sphere domains and automorphisms.** Use `OnePoint ℂ` with its native
complex charts, ComplexKahlerGeometry K1's real restriction and K7.1's
projectivization comparison. Fix `(0,1,∞)`, complex orientation and the
integral-one Fubini–Study form; scale this same form for other areas.
Reuse native `PSL(2,ℂ)` and its faithful algebraic action. Construct the
jointly continuous/holomorphic Möbius action, including infinity, and its
comparison with biholomorphic self-maps. Compare the SL/center quotient
topology with the open determinant-nonzero locus in ℂP³. Normalize determinants
by local square-root branches and descent; no global continuous square root
on ℂ* is used. Prove sharp triple transitivity and the biholomorphism from
PSL to ordered triples of distinct sphere points. For surjectivity onto all
automorphisms, normalize infinity, use degree/local multiplicity one and
Cauchy estimates to show the resulting entire map is affine.

Construct full stabilizers of one, two and three points, their orbit maps,
and first/second jet coordinates with their source/target chart or connection
transition laws. The one-point stabilizer is ℂ⋊ℂ*, not the native unipotent
`lineStab`. Construct PSU(2)⊂PSL(2,ℂ) as the Fubini–Study isometry subgroup
and identify it with the image of the native SU(2) under its inclusion
into SL(2,ℂ) and center quotient. Prove that inclusion continuous and
identify its kernel after quotienting as {±I}. Use the finite closed
center argument for T2Space on PSL(2,ℂ), as proved by
`pslComplex_t2` in Suggested, with the native quotient topology,
before compact-to-Hausdorff comparisons.
Through K7.1's projectivization map, send a complex line to its orthogonal
rank-one projector P and then √2(P−I/2), a unit traceless Hermitian matrix
for the Frobenius real inner product `Re tr(A*B)`. Use the orthonormal
Pauli basis `σ_i/√2`, with its orientation chosen to match the complex
orientation of the sphere, for the isometry to ℝ³ and prove equivariance with
LieGroups' SU(2) adjoint SO(3) cover, including the center quotient and
complex/outward sphere orientation. Compare the normalized area-one
Fubini–Study metric g_FS with the unit round sphere metric:
`g_round=4π g_FS`, where g_FS=ω_FS(·,j·) and ∫ω_FS=1. Construct
UT(S²,g_round)≃SO(3) by the oriented frame `(x,v,x×v)` and transport it
to this same OnePoint carrier and round metric. These comparisons
pin the rotational subgroup and unit frames used in part h.
Identify the quotient of four ordered distinct points by the
cross ratio, pinning the convention `(0,1,∞,z)↦z` and its permutation laws,
so `M(0,4)=OnePoint ℂ∖{0,1,∞}`.

For a compact connected complex Riemann surface of topological genus zero,
construct a biholomorphism to this fixed sphere. Build O(p) by transition
functions, its degree/c₁=1 comparison and holomorphic sections using
ComplexKahlerGeometry K4's bundle carrier. Apply closed linear RR to obtain
complex index2. Construct the canonical section of O(p) vanishing once at p;
choose an independent section and divide by that canonical section. The
ratio is a nonconstant meromorphic function with exactly one simple pole. Construct the
native finite holomorphic map, identify degree1 and consume
`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`. The complex atlas is an
input; a normalization atlas needed below is constructed there.
Construct the Euler/genus input independently: F1.5 on the trivial complex
line has real indexχ and is complex linear, so χ is even. On a compact
connected complex Riemann surface, holomorphic functions are constants by the
maximum principle; its complex kernel dimension1 gives χ≤2. Use
FuchsianOrbifolds Layer5's independent branched-cover Euler formula
`2=dχ(Σ′)−R`, d>0,R≥0. It makes χ(Σ′)>0; evenness and the bound give
χ(Σ′)=2 and topological genus0, before applying the O(p) construction.
This order precedes nonlinear moduli and uses no nonlinear uniformization
or GW theorem.

**F2.6b Simple maps and the quotient.** Define P_A as the entire smooth class-A
J-holomorphic sphere locus with somewhere-injectivity, where A is an integral
spherical homology class and ω(A)>0. Reuse native almost-complex structures,
`IsPseudoholomorphic`, actual map differentials and section bundles. Construct
its C-infinity topology and comparisons to sufficiently high W(k,p), p>2,
with the derivative budget from F0. Construct factorization of every
nonconstant sphere through a positive-degree finite holomorphic map to a
compact normalization and a simple J-curve. Build the normalization from
the local analytic floor and McDuff–Salamon Proposition2.5.1's
coincident-branch relation Γ₀⊂(Σ∖X)², where
X=u⁻¹(u(Crit u)) is the full preimage of the critical values. Prove
finiteness of Crit u and of each fiber from the local analytic floor,
so X is finite by F2.2a; part b uses no part e result. On Σ∖X define Γ₀ by equality of
the local image germs, including the diagonal and excluding isolated
intersections of distinct image branches. Prove equivalence with the
accumulation-sequence relation using F2.2c, and prove Γ₀ closed
in (Σ∖X)². Construct its holomorphic local transition maps and prove
that projection to the first factor is a proper local diffeomorphism.
For properness, a convergent partner over z∉X cannot limit into X,
because its image equals u(z), a noncritical value. The finite covering
has constant fiber cardinality on the connected punctured surface.
Prove Γ=cl(Γ₀) is an equivalence relation on Σ and X is invariant.
Construct local multiplicities m(z), equal1 off X, satisfying
Σ_(ζ∼z)m(ζ)=m. Extend the local transition maps across the punctures
by holomorphic removability and construct the product quotient
coordinate Π_j w(ψ_j(z)), with its local branched degree and holomorphic
transition maps. The descended v has finite Dirichlet energy by the
degree/pullback identity off the punctures; apply F2.3's puncture removal
to extend it smoothly. When m=1, equivalently Γ₀ is the diagonal,
prove noninjective points accumulate only at critical points using
F2.2c, including a regular point of X with a possibly critical partner.
Use finite fibers to discard a subsequence with a constant partner
parameter before applying that lemma. Prove Γ₀(v) is diagonal: germ
coincidences for v lift to Γ₀(u) and are identified by the quotient.
Apply the m=1 argument to v to prove it is somewhere injective. In particular a somewhere-injective map has no nonempty open
set of noninjective points. Establish Hausdorffness, complex charts, compactness,
degree, uniqueness and the integral homology identity
`u_*[S²]=d v_*[normalization]`. Part a identifies this normalization with
S². This Γ₀ route uses neither part e's branch-isolation theorem nor
intersection positivity. Primitivity rules out a multiple cover; it does not rule out splitting
into different positive-energy classes.

The right action is `(u,g)↦u∘g`. Prove that simple-map stabilizers are trivial
using an injective regular point and holomorphic uniqueness. Prove properness
on the nonconstant simple-map locus: an escaping PSL sequence has a normalized
rank-one limit and converges to a constant off one point, contradicting
smooth convergence of both maps in the properness test. Establish the actual
metrizability, countable charts and properness criteria used.
For regular solutions construct slices through three distinct injective
points with codimension-two image incidence constraints. Prove chart
independence and a Hausdorff second-countable smooth quotient. Reparametrization
loses derivatives: prove C^r dependence from W(k+r,p) to W(k,p), then
bootstrap finite-dimensional solution slices; no smooth action on a single
fixed Banach completion is assumed. Orient det(D) by deformation to complex
linear CR operators and give the complex orbit orientation, orbit-first
quotient convention and naturality. The unmarked dimension is
`2n+2c₁(A)−6`.

Construct the one-marked quotient `(P_A×S²)/PSL` under
`(u,z)·g=(u∘g,g⁻¹z)`. It is the associated sphere bundle over unmarked
moduli, with dimension `2n+2c₁(A)−4` on the regular locus and smooth
well-defined evaluation `[u,z]↦u(z)`. Construct target-symplectomorphism,
parameter, marking and representative-change comparisons. Nonregular
loci retain their actual topology, without an asserted manifold structure.

**F2.6c Energy and compactness.** Construct the global closed-surface energy
as half the integrated raw norm-square of du for the associated tame metric
and a conformal domain metric. Prove chart/conformal invariance, equality
with `∫u*ω=ω(A)` for J-holomorphic maps, and the integral-homology/de Rham
comparison. Include Stokes, positivity, zero-energy constancy, degree scaling
and product projections. The native energy-density identity is a local input.
For compatible J consume [CalibratedGeometry C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/9cd2a3a0c35915978d29583f68b33b11782597de/TauCetiRoadmap/CalibratedGeometry/README.md#c4-hermitian-linear-algebra-and-k%C3%A4hler-calibrations)'s Hermitian linear
Wirtinger inequality and positive complex-plane equality, on C1's comass
carriers. This pointwise core requires no integrability. Apply C2/C3's
integration and actual finite bounding-chain hypotheses for the resulting
parametric area/minimization statements.

For K compact in the C-infinity topology on smooth tame J and a=ω(A)>0,
assume explicitly that every
nonconstant J-sphere, for every J∈K, has area at least a. Prove compactness
of the zero/one-marked class-A quotient over K. Extend the fixed-domain
analytic compactness construction to the closed sphere: uniform elliptic and
mean-value estimates, rescaling, removal, finite energy quantization,
no-neck energy and neck oscillation/diameter control. Construct integral
class splitting `A=Σd_i A_i` by homotopy and capping in small target charts;
vanishing real ω area alone does not identify an integral class.
The area bound permits exactly one positive-energy component and excludes
its multiple covering. Recenter by Möbius maps if the principal component
is constant. With at most one mark, prove by tree valence/stability that
there is no stable constant subtree; collapse unstable constants and pass
the mark to its limit on the surviving sphere. Establish C-infinity
quotient convergence and family/evaluation continuity, then compactness
from the countable metrizable models. Include the standard ℂP² line
moduli, dual-projective-plane and line-point incidence identifications.

**F2.6d Transversality and degree.** Construct universal simple-sphere
sections and localized J variations with F0's split Fredholm range and
finite-order Sard–Smale budget, first in C^ℓ tame J spaces. In the tame
case variations anti-commute with J; for compatible J add the symplectic
symmetry condition `ω(v,Yw)=ω(w,Yv)`. Prove in each of these actual tangent
spaces the localized cokernel-surjectivity linear algebra. Establish the
smooth-J residual theorem by a countable exhaustion of compact pieces
with uniform image/derivative/injectivity bounds: regularity is open on
each piece, finite-C^ℓ perturbations give density, and smooth approximation
relative to the prescribed region plus the Taubes countable-intersection
argument gives a residual subset of smooth J. Use the quantitative
simple-point condition at some z,
`inf_(ζ≠z) d(u(z),u(ζ))/d(z,ζ)≥1/K`, together with `‖du‖∞≤K`;
for a spatially relative theorem also bound the image point's distance
from the fixed region below by1/K. Prove these pieces cover every relevant
simple curve for some K. Uniform elliptic bootstrapping makes the bounded
pieces compact; this gives openness and the C^ℓ-regular/smooth-approximation
density argument of McDuff–Salamon §3.2, printed54–56. Carry the same
budgets, compact-piece estimates and endpoint-relative smoothing to paths. Prove
surjectivity modulo map variations
by pairing a nonzero adjoint section with a J variation near an injective
point, including the anti-commuting endomorphism linear algebra and bump
extension. Prove the relative theorem when each relevant map has an
injective point in the allowed open perturbation region. For a prescribed
compact inner ball and collar inside an exact open ball, Stokes excludes a
nonconstant sphere lying wholly there; the dense injective locus supplies
an allowed point outside the fixed region.

For regular endpoint J's and generic smooth paths fixed near their endpoints,
construct the compact oriented one-marked universal cobordism under part c's
uniform area bound. Use parameter-first orientation; its boundary is the
final moduli minus the initial moduli. Construct evaluation pushforward and
degree invariance using AlgebraicTopology's relative fundamental classes.
Degree+1 implies surjectivity. Nonregular endpoints require a regular
approximation/compactness passage or another explicit regularity theorem.
The path interior need not keep a spatial germ fixed when only its final
endpoint has that prescribed germ.

**F2.6e Four-dimensional curves and regularity.** Construct positive local
intersection multiplicities of distinct simple J-branches, their chart
invariance, isolation, tangency and critical-branch cases, and the global
integral homological intersection formula. Assume no common open image
component when comparing two curves. Construct the Micallef–White
simultaneous normal form for a J-holomorphic map nonconstant on every
component meeting Ω, where Ω has compact closure and x₀∈u(Ω) lies
outside u(∂Ω). Prove finiteness of u⁻¹(x₀)∩Ω from isolated preimages
and compactness. For its points z_i construct pairwise disjoint U_i⊂Ω,
C² source charts φ_i:(U_i,z_i)→(ℂ,0), and one C¹ target chart
Ψ:(W,x₀)→(ℂ^n,0). With u_i=Ψ∘u∘φ_i⁻¹ obtain polynomial branches
`L_i u_i(z)=z^k_i(1,p_i(z))`,
with p_i(0)=0, Ψ_*J(x₀)=J₀, and the same unitary L for equal tangent
lines. Prove local injectivity of simple critical branches using part b's
no-open-noninjective-set lemma to exclude root-of-unity identifications.
For isolation
of distinct branches, use the lower bound on `|λa+μb|` when the leading
tangent vectors are independent, and the root-of-unity polynomial identity
when they are dependent. The linear similarity principle alone
does not supply this normal form.

Define the local index using compact source neighborhoods U_i and a
compact contractible target neighborhood W whose boundary contains no
intersection under consideration and with `W∩u_i(∂U_i)=∅`; perturb
transversely inside the preimages of W, keeping the images there inside W. Construct the cutoff perturbation replacing z^k by
`Π_(j=0)^(k−1)(z+jε)`, first giving a C¹ immersion with positive pulled-back
compatible two-form, then a smooth transverse immersion equal to u outside a prescribed
neighborhood of the noninjective set, including critical points and
nontransverse intersections between immersed branches. The form used for this local perturbation need not be
closed. Prove the local-index comparison, positivity and the strict
contribution from every critical branch; tangent immersed branches and
critical branches require these separate arguments. Use McDuff–Salamon,
*J-holomorphic Curves and Symplectic Topology*, second edition,
Theorem E.1.1 and E.2.1–E.2.4, printed655–663, for this construction.
Construct the simultaneous normal-form proof here, including its
Hartman–Wintner asymptotic expansion input and the C¹ simultaneous target
coordinate change, following the proof in Appendix E.5–E.7. The original
source is Micallef–White, [Annals141(1995),35–85](https://doi.org/10.2307/2118627).
Build the required local analytic package in the following order,
using F1.2's explicit Hölder Cauchy/Beurling estimates and Banach inversion.
Consume its normalized two-dimensional Beltrami inverse: C^(1+α)
coefficients give C^(2+α) coordinates for 0<α<1, with smooth
coefficients giving smooth coordinates. Here construct the
isothermal-coordinate/elliptic-principal-part comparison; the
full higher-dimensional Newlander–Nirenberg theorem remains CKG K1.
Prove Hartman–Wintner's [elliptic finite-order expansion](https://doi.org/10.2307/2372496)
for C² vector-valued u with u(0)=0 and
`|a u_ss+2b u_st+c u_tt|≤C(|u|+|du|)`, where a,b,c are real C^(1+α),
a,c>0 and ac−b²>0: either u vanishes identically or it has a nonzero
homogeneous leading polynomial together with its derivative asymptotic.
Use the flattened Laplacian, annular Cauchy–Green formulas, weighted
bootstrap estimates and the limiting derivative coefficient. This leading
polynomial is real homogeneous; holomorphicity needs the next CR argument.

Construct the punctured-disc symbol classes with every derivative bounded
by `|z|^(ℓ−order)` and prove their product/composition/inverse and
Cauchy-solution/removability rules. For ℓ≥2 prove the symbol inclusion
into local W^(2,∞), justifying weak derivative extension across the origin;
then C^(1,1) embeds into C^(1,α) on smaller discs for 0<α<1.
For E.6.4 prove the coefficient deviations a−1,b,c−1 have order k+1;
adding back the constants gives the required C^(1,α) elliptic coefficients.
The C² regularity of H=F₂−F₁ comes separately from E.5.10's C²
source reparametrizations and normal components; symbol order alone
does not imply C² at the origin. Retain that premise before using
Hartman–Wintner.
Obtain the single-branch form
`(z^k,F(z))` with F of order k+1. Construct E.6.2's smooth block
normalization using F1.2's actual Sobolev spaces X,Y and disc solver.
On the open set of u∈X with image in the J chart, use
F(u)=(½(∂s u+J(u)∂t u),u(0),∂s u(0)); its derivative at0 is the
normalized solver. Choose a sufficiently small nonzero ξ₀ in the chosen
complex tangent line and transverse centers x with (0,x,ξ₀) in the
inverse's domain. The discs u_x=F⁻¹(0,x,ξ₀), elliptic bootstrapping and
parameter estimates give smooth Φ(z,x)=u_x(z). Its derivative at(0,0)
is (ζ,ξ)↦ζξ₀+ξ, an isomorphism. For Ψ=Φ⁻¹ prove Ψ(x₀)=0,
dΨ(Π₀)=ℂ×0 and Ψ_*J=[[i,J₃],[0,J₄]], with J₃(0)=0 and J₄(0)=i.
Derive this differential from u_x(0)=x, ∂s u_x(0)=ξ₀ and J(0)=i,
with the Sobolev parameter estimates and their Morrey comparisons.
Prove E.6.5's leading-difference transformation law: the invertible
normal differential block transports the coefficient, preserving its
nonvanishing and order, with the source reparametrizations included.
For same-tangent branches, reduce their
difference consistently as H=F₂−F₁ to a uniformly elliptic inequality;
the CR coefficient-order estimate then makes its first nonzero homogeneous
term holomorphic. Finally construct the finite root-of-unity invariant
branch families, their order-separation averages, supported corrections
with derivative zero at the origin and their C¹ inverse estimates.
Treat equal orders, then a common multiple of differing orders, then
combine corrections in disjoint cones for distinct tangent directions.
These constructions give one simultaneous C¹ target change, not separate
incompatible charts for different branches. Follow Appendix E.3–E.7,
printed664–694, for this complete local proof route.

Prove singular adjunction for
a simple normalized curve in a real four-manifold:
`c₁(TX)(A)=χ(Σ)+A·A−2δ(u)`, δ≥0, with δ=0 exactly for embeddings.
Here δ is the total algebraic singularity number, the sum of signed
unordered local indices of the controlled transverse immersed perturbation.
Prove its nonnegativity from the local-index comparison and the strictly
positive total contribution in each critical-branch neighborhood; positivity
of a two-form on an immersed surface alone does not make every crossing positive. Prove
its independence of perturbations by the normal Euler/self-intersection
and Chern-class identities. Distinguish it from the cardinal count of
distinct self-intersection pairs: tangencies have higher weight and
critical branches contribute even without distinct preimages. Prove
the corresponding cardinal inequality and equality precisely for
immersions with transverse self-intersections. Consume CharacteristicClasses'
Euler, normal self-intersection and Whitney-sum comparisons.

For an embedded sphere construct the quotient real CR operator on its normal
line N using `TS²→u*TX→N`; retain the upper-triangular coupling and its exact
kernel/cokernel comparison. For a real CR line operator of degree d, F1's
zero count and RR give automatic surjectivity when d≥−1. At d=−1 the kernel
vanishes and index0 gives zero cokernel. At d≥0 evaluate the kernel at d+1
distinct points: zero counting makes this injective, while index2(d+1)
forces it to be an isomorphism and the cokernel to vanish. Prove the Sobolev
trace and finite-codimension restriction statement: one-point evaluation
of the kernel is onto, so a solution can be adjusted by a kernel section
to meet a zero point constraint. No smooth divisor-twist of a general
real-linear zeroth-order term is presumed. The tangent sphere operator
has degree2; the normal operator has degree A·A.

For square0 and c₁(A)=2, normal evaluation is an isomorphism of real
2-dimensional spaces, giving a local diffeomorphism of one-marked evaluation.
Prove finite-parameter smoothness and C-infinity dependence with estimates.
Compute the source tests: smoothing/genus/index changes from δ, and an
embedded Lagrangian S² has square−2 because J's tangent-to-normal
identification reverses the induced normal orientation.

**F2.6f Nonsqueezing.** For a symplectic embedding of B(r) into
`B²(R)×ℝ^(2n−2)`, n≥1, first take each compact inner ball r′<r.
Embed its bounded image into `S²(a)×T^(2n−2)` with a=πR²+ε and torus
periods large enough to avoid seams. Construct these symplectic embeddings
and normalizations. Prove from π₂(T)=0 and π₂(S²)=ℤ that all spherical
areas are integer multiples of a. Thus every positive area is at least a
for every tame J. The ruling class has c₁=2.
For product J identify all class-A curves by constant torus projection and
degree-one sphere projection, prove regularity using F1's line RR/zero count,
and identify one-marked evaluation with the identity with degree+1.

Extend the pushed-forward standard J near the inner ball by F2.1's relative
construction. Choose a constrained regular endpoint and an endpoint-relative
generic path from product J; part d and compactness give a sphere through
the center. Holomorphic monotonicity in the standard ball gives area at
least π(r′)², including positive local multiplicity at a critical point.
Its total area is a. Pass ε→0 and r′→r to obtain r≤R. Product-sphere
compactifications require their full spherical-area subgroup calculation;
large unrelated factor areas alone do not establish the same area gap.

Before the ruling applications, prove the four-dimensional mixed-wedge
lemma: if ω₀ is a product symplectic form on complementary oriented
2-planes and a symplectic form β is positive on each plane, then
`ω₀∧β>0`. Evaluate on a product symplectic basis. Together with positive
ω₀² and β² this proves the whole convex path nondegenerate. Include
naturality under oriented linear changes of coordinates.

**F2.6g Rulings and relative recognition.** On equal-area S²×S², the two
ruling classes have square0, c₁=2 and minimum positive area. Parts b–e give
simple compact moduli, embeddedness, automatic regularity and evaluation
local diffeomorphisms. Evaluation degree+1 gives existence; intersection
positivity gives disjointness of distinct leaves in each class and a
unique transverse intersection between opposite leaves. Construct smooth
rulings, their family dependence, and the product diffeomorphism by
intersections, with smooth inverse. The raw map pulls ω back positively on both
coordinate planes: they map to the oriented J-ruling planes, with the
orientation fixed at the standard seeds and extended by nondegeneracy
and connectedness. A degree-one map alone is insufficient.

Let X be connected, noncompact, symplectic of dimension4 with H₂(X;ℤ)=0,
and a given symplectic end identification with standard ℝ⁴ outside a
compact set. Construct an extension agreeing with that map on a smaller
end. Choose a larger equal-area polydisc, a rounded compact cut and a
collared gluing to the product-sphere cap. Prove compactness of the cut
core, Hausdorffness and the smooth symplectic atlas of X′ from the closed
collared gluing; an open-overlap gluing alone does not ensure Hausdorffness.
Compute H₂(X′), its intersection form and equal area pairings by the actual
excision/Mayer–Vietoris maps. Fix product J on a neighborhood of
`(U×S²)∪(S²×U)`, where U is a round disc centered at ∞ in the chosen
cap coordinate.
The two transverse cap spheres are standard there; their embedded adjunction
gives c₁=2. They seed the two moduli spaces. On this X′, compactness and
evaluation local diffeomorphisms make the evaluation image open and closed;
connectedness and the seed imply surjectivity. Intersection positivity gives
one sheet. This argument does not assume that X′ is a product beforehand.
Construct the intersection diffeomorphism F using the standard seed
parametrizations. It fixes the two seeds and U×U and maps the cap-strip
coordinate leaves to themselves. It need not equal the end identification
on those strips. Normalize it as follows, in the cap coordinates.
On S²×U write `F(z,w)=(φ(z,w),w)`, where each φ(·,w) is an
orientation-preserving diffeomorphism, φ(z,w)=z for z∈U or w=∞, and
w↦φ(z,w) is holomorphic. The corresponding form on U×S² is
`F(z,w)=(z,θ(z,w))`, with each θ(z,·) an orientation-preserving
diffeomorphism, z↦θ(z,w) holomorphic and θ(z,w)=w for w∈U or z=∞. Prove these identities from the standard cap curves
and their transverse intersections, rather than assuming F is a product map.

Choose a smaller concentric round disc D compactly inside U and a smooth map ρ:S²→S²
which is constant∞ on D, is the identity off U, maps U to U, and has
nonnegative Jacobian. In a disc coordinate centered at∞ take
`ρ(ζ)=b(|ζ|)ζ` with b nondecreasing, zero near D and one near∂U;
prove smoothness, the support conditions and
`det(dρ)=b(r)(b(r)+r b′(r))≥0`. On
`(S²∖U)×U` replace F by `(φ(z,ρ(w)),w)`; on
`U×(S²∖U)` replace it by `(z,θ(ρ(z),w))`. Leave it equal to F
elsewhere. On the overlaps U×U both formulas are the identity, and
near the strip boundaries ρ is the identity. Prove the resulting F′
is a global diffeomorphism by its fiberwise diffeomorphism inverses,
is isotopic to F through these same formulas with radial interpolations,
and equals the end identification on `(D×S²)∪(S²×D)`.
For the moved graph direction, holomorphic dependence composed with ρ
has nonnegative Jacobian and the other component is the identity;
for the fiber direction use the orientation-preserving fiber map.
Thus F′*ω remains positive on both coordinate planes, including on the
transition annuli. This is the relative adjustment of McDuff–Salamon,
*J-holomorphic Curves and Symplectic Topology*, second edition,
Theorem9.4.7(ii), printed340–341; construct both symmetric strip maps.

To obtain a symplectomorphism, use the mixed-wedge lemma above for
β=F′*ω; the isotopy from F shows F′ preserves orientation, so β²>0
in the product orientation. This gives the symplectic form path. Compute
the relative cohomology difference and construct a primitive vanishing on
`(D′×S²)∪(S²×D′)` for a smaller concentric disc D′ compactly inside D. From a global primitive, use H¹=0 on the chosen neighborhood
of the two transverse cap spheres to subtract an extended exact primitive.
Prove H¹(U)=0 for U=(D×S²)∪(S²×D) by Mayer–Vietoris and
DifferentialGeometry's open-manifold de Rham comparison. For a global
primitive α choose f on U with df=α|U, take a smooth cutoff χ equal1
on a smaller cap neighborhood and supported in U, and extend χf by0.
Then α′=α−d(χf) has the same exterior derivative and vanishes on
that smaller neighborhood. Prove these extension/collar/support assertions
for this cap union and apply F2.1's compact-support Moser flow. Restrict
to the end-fixed symplectomorphism X≃ℝ⁴.

**F2.6h The equal-area group.** Use native compact-source `Diffeomorph`
weak Whitney C-infinity topology, group structure, inversion and evaluation.
Construct the symplectic subgroup with the shared pullback predicate and
its action on integral H₂. Define G₀ as the kernel of that action. Fix the
product round J₀ and p₀=∞. Let E consist of `(J,u,v)` where u and v
parametrize respectively an A and a B leaf and `u(p₀)=v(p₀)`.
At J₀ identify the fiber with PSL(2,ℂ)² by
`(a,b)↦(z↦(az,bp₀),w↦(ap₀,bw))`. Independent reparametrization does not
preserve the common-value incidence; at a fixed value the fiber uses the
one-point stabilizers.

Construct a deformation of E relative to standard rotations onto
K=SO(3)×SO(3), acting on OnePoint through part a's explicit PSU/adjoint
and unit-frame comparisons. Over the common value x, identify parametrizations by
nonzero complex first derivatives in the two ruling lines and their
second covariant jets, using chosen smooth complex connections and part a's
jet inverse. Prove all transition laws and smooth/continuous inverse
dependence. Normalize derivative lengths and contract the affine second-jet
directions to zero, leaving the two unit-frame bundles over X. Transport
these frames along F2.1's contraction of tame J to J₀ using metric
connections/projections and ODE estimates. At J₀ they are the round tangent
unit-frame bundles, hence K. Choose connections and normalization fixing
every rotational parametrization. Prove actual C-infinity continuity and
the K-relative property. Contractibility of the J base and a fiber homotopy
type alone are insufficient.

Construct the deformation retraction of PSL(2,ℂ) onto PSU(2),
followed by the adjoint homeomorphism to SO(3), on the native groups.
LieGroups Layer9 owns the general Cartan decomposition. Here construct
its explicit determinant-one2×2 computation: for g∈SL(2,ℂ), set
H=g* g and P=(H+I)/sqrt(tr H+2), using the positive real trace
and square root, embedded in ℂ. By Cayley–Hamilton prove P²=H,
P positive and det P=1. Identify P with native CFC.sqrt H using
MatrixOrder and CFC.sqrt_unique; this gives the standard polar factor,
rather than another square-root construction. Prove U=gP⁻¹∈SU(2)
and continuous dependence directly from the explicit formula. Contract
P to I by Q_s=((1−s)P+sI)/sqrt(det((1−s)P+sI)), with positive
real determinant and root. Prove Q_s positive, det Q_s=1, Q₀=P
and Q₁=I, so g_s=UQ_s stays in SL(2,ℂ) and fixes SU(2).
Prove −g=(−U)P. The center-quotient SL→PSL is open, hence its
product with [0,1] is a quotient map; use this for joint continuous
descent of the homotopy. Its image is part a's PSU(2). Consume
LieGroups' worked SU(2)/SO(3) acceptance example, based on Layers3–5:
the surjective adjoint cover Ad:SU(2)→SO(3), with kernel{±I}; derive the center-quotient
homeomorphism used in part a. No second matrix group or double cover is introduced.

Define A:G₀→E by pushforward of the standard data and reconstruct F:E→Diff(X)
by intersections of leaves. Prove joint C-infinity continuity, inverse
continuity, finite-parameter smoothness and FA=id. The form β=F*ω is
positive on both standard coordinate planes, so the earlier mixed-wedge
lemma proves every `(1−t)ω+tβ` symplectic. The named H₂ basis
and equal areas give `[β]=[ω]`. Apply F2.1's continuous primitive selector
S and Moser field `ι_(X_t)ω_t=−S(β−ω)`. If ψ_t*ω_t=ω, put
B(e)=F(e)∘ψ₁(e). Prove B maps to G₀, BA=id by S(0)=0, and B fixes K.
For the K-relative deformation H of E, the homotopy BHA deforms G₀ onto K.
Only then identify G₀ with the identity component. For the full group,
compute the intersection/area-preserving integral H₂ actions as identity
and swap, realize swap by factor exchange and prove the split homotopy
comparison with `(SO(3)×SO(3))⋊ℤ/2`.

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
  2–4, 9–10 and Appendix E); Y.-G. Oh, *Symplectic Topology and Floer Homology* I–II, Cambridge,
  2015: the boundary-condition versions and Lane F3.
- M. J. Micallef, B. White, [*The structure of branch points in minimal surfaces
  and in pseudoholomorphic curves*](https://doi.org/10.2307/2118627), Ann. of Math.
  141(1995),35–85; P. Hartman, A. Wintner,
  [*On the local behavior of solutions of non-parabolic partial differential equations*](https://doi.org/10.2307/2372496),
  Amer. J. Math.75(1953),449–476: F2.6e's local normal-form and elliptic expansion.
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

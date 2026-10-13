# Euclidean isoperimetry, sharp inequalities, and rigidity

Build Euclidean isoperimetric theory on Mathlib and Tau Ceti, including the sharp inequality
for all finite-volume finite-perimeter sets in every dimension `n ≥ 2`, equality exactly
for balls up to null sets, and the classical theorem for every rectifiable planar Jordan
curve, with equality exactly for circles. Develop the supporting convex and functional
inequalities as reusable mathematics: Prékopa–Leindler, Brunn–Minkowski, symmetrization,
sharp BV Sobolev, and the periodic curve inequality with its equality analysis.

This is a library specification, not a request to certify or reproduce a particular proof.
No milestone assumes an external isoperimetric repository as a dependency or a chosen proof
route. Every milestone is required. Quantitative stability, anisotropic perimeter, and
isoperimetric inequalities on curved ambient manifolds are outside this roadmap.
[Suggested.lean](Suggested.lean) illustrates interfaces; this README is definitive.

## Constants, statements, and scope

Work in `EuclideanSpace ℝ (Fin n)` and transport to arbitrary finite-dimensional real
inner-product spaces by linear isometries. Let `ω_n = volume (ball 0 1)`. Use normalized
Euclidean Hausdorff measure `μHE[k]`, written `Hᵏ`, and the perimeter measure defined by
[GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G3–G5. In dimension two,
`ω_2 = π` and the oriented real plane is `ℂ`.
Set measurability in the general statements is Lebesgue measurability
(`NullMeasurableSet E volume`), with Borel-representative versions and a.e. transport;
`MeasurableSet` is used where the result explicitly concerns Borel sets.

For a measurable set `E` with finite volume and finite perimeter, establish

```
P(E)^n ≥ n^n ω_n |E|^(n−1),                         n ≥ 2.
```

For `0 < |E| < ∞`, equality holds **if and only if** there are `c` and `r > 0` such that
`χ_E = χ_(ball c r)` a.e. with respect to `volume`. No boundedness, connectedness, convexity,
or boundary regularity is imposed on `E`. For zero volume, prove perimeter zero and the
corresponding degenerate inequality separately. Provide extended nonnegative statements,
and real-valued versions carrying the required finiteness hypotheses. Never turn an
infinite perimeter into zero by using `ENNReal.toReal` without those hypotheses.

For a rectifiable Jordan curve `C` let `Ω = TauCeti.filledHull C \ C`, let
`A = volume Ω`, and let `L = H¹(C)`. Establish

```
4π A ≤ L²,       4π A = L² ↔ ∃ c r, 0 < r ∧ C = sphere c r.
```

Include the raw-curve formulation for every continuous `γ : ℝ → ℂ` on `[a,b]`, `a < b`,
with `γ(a)=γ(b)`, injective on `[a,b)`, and `BoundedVariationOn γ [a,b]`. In that formulation
`C = γ '' [a,b]` and `L = eVariationOn γ [a,b]`; show agreement with the geometric formulation.
Do not require the supplied parametrization to be AC, Lipschitz, differentiable, or
piecewise smooth. The curve equality is literal equality of traces with a circle; the
set equality above is equality a.e. These are different assertions with a required bridge.

## Dependencies and ownership

- [GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G1–G2, supplies arclength,
  normalized Hausdorff length and surface measure, area/coarea, and sphere normalization.
  G3–G5 supplies BV, finite perimeter, strict approximation, reduced boundary, and
  `P(E) ≤ Hⁿ⁻¹(frontier E)`. G6 supplies Gauss–Green and
  `P(filledHull C \ C) = H¹(C)` for rectifiable Jordan curves.
- [DifferentialGeometry](../DifferentialGeometry/README.md), 5.6.1–5.6.3, supplies AC
  winding-number calculus and Green's genuine planar area identity. It retains ownership
  of curve integration and Green's theorem. I3 below owns the sharp periodic inequalities
  and their equality cases. The area and length bridge uses the existing curve APIs.
- [ConformalMapping](../ConformalMapping/README.md), L5, supplies Jordan separation and
  filled-hull topology. Use the implemented `TauCeti.IsJordanCurve` and `TauCeti.filledHull`;
  no private predicate for a Jordan curve or surrogate for its inside.
- [PDE](../PDE/README.md), Lane A, owns weak Sobolev spaces, density, domain Poincaré and
  trace theory. This roadmap owns sharp Euclidean BV Sobolev and the periodic sharp
  Wirtinger equality theorem, with comparisons to that canonical weak derivative.
  PDE's nonsharp estimates do not depend on this roadmap.

The geometric foundation has no dependency on the sharp inequality. I1–I2 can be developed
alongside it. I3 uses the existing AC calculus and the Green/length inputs. I4 consumes GMT
G2–G5, I1, and I2's set symmetrization and convex geometry. I2's BV Pólya–Szegő comparison
follows I4; I5 consumes I4 and GMT G4; I6 consumes I3–I4, GMT G6, and Jordan topology.
No optimal-transport theorem is an assumed input. Any analytic, geometric, or equality
lemma needed to complete these milestones and absent from their stated inputs is a target
here, including the proof machinery enumerated in I2 and I4.

## Existing floor and design evidence

Consume Mathlib's `Convex`, `ConvexBody`, pointwise set addition and scalar multiplication,
`volume`, Brunn–Minkowski-compatible set operations, Fourier series and Hilbert bases,
and the interval AC FTC. Keep a.e. function arguments on the existing measure-theory API.
For compact convex sets use [`ConvexBody`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Convex/Body.html)
where its hypotheses match; positive volume and nonempty interior are separate hypotheses,
not silently added to its definition. Do not model Minkowski addition as an additive group.

Follow the [Brunn–Minkowski/Prékopa–Leindler discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Brunn-Minkowski%20Inequality%20%2B%20Theory)
and [convex-body API discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Convex%20bodies).
[Mathlib4#44802](https://github.com/leanprover-community/mathlib4/pull/44802) develops
one-dimensional Brunn–Minkowski, including `Real.volume_add_volume_le` and the compact-set
version. Adopt Mathlib's resulting signatures and naming; build missing versions in Tau
Ceti in that shape without waiting for upstream. Consume imported results whenever they
express a target. These design references do not discharge the higher-dimensional,
measurability, or equality targets below.

## I1 — Prékopa–Leindler and Brunn–Minkowski

Prove Prékopa–Leindler in every finite dimension for nonnegative measurable functions,
in its weighted extended-integral form: for `0 < θ < 1`,

```
h((1−θ)x + θy) ≥ f(x)^(1−θ) g(y)^θ
⇒ ∫ h ≥ (∫ f)^(1−θ) (∫ g)^θ.
```

State the pointwise hypothesis on measurable representatives. Include integrable real
versions, zero-integral and infinite-integral cases with explicit conventions, linear
isometric transport, product/tensorization, approximation, and the one-dimensional
monotone-transport or equivalent integral argument. The induction, parameter measurability,
and Tonelli steps are part of the target. Do not assume equality characterization for
arbitrary Prékopa–Leindler functions.

Derive Brunn–Minkowski for nonempty compact sets, then nonempty bounded Borel sets and
nonempty arbitrary measurable finite-volume sets, with outer-measure formulations when
their sum is not measurable:

```
|A + B|^(1/n) ≥ |A|^(1/n) + |B|^(1/n),              n ≥ 1.
```

Retain nonemptiness even in zero-volume cases; the unweighted inequality is false when
one summand is empty and the other has positive volume. Supply the weighted Minkowski
version and the elementary translation/dilation laws,
monotonicity, continuity for decreasing compact sets and the neighborhood approximation
needed for passing to measurable sets. Address measurability explicitly: the sum of two
Lebesgue measurable sets is not an automatically measurable input. Include positive-volume
**compact convex** equality: for `0 < θ < 1`, equality in the weighted inequality holds
exactly when `B = c + λ • A` for some translation `c` and `λ > 0`. Prove the convex equality argument and the
bridge between positive volume and nonempty interior. A measure inequality alone does
not provide this rigidity theorem.

## I2 — Symmetrization, rearrangements, and convex geometry

Build Steiner symmetrization along a unit direction for measurable finite-volume sets:
replace a.e. line section by the centered interval of the same one-dimensional volume.
Provide representative independence, measurability, preservation of volume, monotonicity,
translation conventions, dilation, orthogonal transport, and preservation of convexity.
Prove perimeter nonincrease for finite-perimeter sets using GMT's slicing/coarea theory,
including the nonsmooth approximation and limit argument. For every bounded measurable
positive-volume finite-perimeter set, construct a sequence of unit directions whose
successive Steiner symmetrizations converge in `L¹` of their indicators to the centered
volume-matched ball. Prove the compactness and limit identification used in this
construction. Single-step equality is not
assumed to imply that arbitrary sets are balls.

Define Schwarz rearrangement of nonnegative measurable functions from their distribution
function. Establish equimeasurability, layer cake, all `Lᵖ` norm comparisons that reduce
to equimeasurability, order preservation, `Lᵖ` contraction for `1 ≤ p < ∞`, and the
Hardy–Littlewood inequality. Prove BV Pólya–Szegő from coarea and the set inequality of I4;
this particular comparison is sequenced **after I4**, not used as an unexplained input
to its proof. Supply the corresponding `W¹,¹` comparison through the GMT/PDE bridge.

For convex bodies construct surface area from GMT's perimeter and show agreement with
Hausdorff boundary area. Relate outer parallel volume `(K + r • closedBall 0 1)` to
surface area by the right derivative at zero. Prove the needed boundary charts and volume
limit, including degenerate bodies in separate statements. Derive the isoperimetric
inequality for positive-volume convex bodies from Brunn–Minkowski. Prove the sharp
isodiametric inequality `|E| ≤ ω_n (diam E / 2)^n` for measurable bounded sets using their
closed convex hull and the difference-body argument. The volume-maximizing convex-body
case has ball rigidity; supply the equality proof. For measurable sets, equality implies
agreement a.e. with a ball of radius `diam E / 2`. A converse also requires the diameter
bound: arbitrary null modifications can increase diameter.

## I3 — Sharp periodic inequalities and curve energy

Prove the sharp periodic Wirtinger inequality for real- and finite-dimensional
inner-product-valued AC functions on `[0,T]`, `T > 0`, with equal endpoint values,
mean zero, and square-integrable derivative:

```
∫₀ᵀ ‖f‖² ≤ (T / (2π))² ∫₀ᵀ ‖f'‖².
```

Equality holds exactly for `f(t) = a cos(2πt/T) + b sin(2πt/T)` on the interval. Include
the canonical periodic `W¹,²` formulation and its AC representative, translation of
the mean, rescaling to any parameter interval, and complex-valued specialization.
Build the Fourier/weak-derivative integration-by-parts and Parseval comparison or the
equivalent variational argument, rather than assuming the smooth inequality extends
automatically to AC functions or that its equality cases survive density.

For any closed AC plane curve with square-integrable derivative, define signed area by
the real boundary integral `½∫ (x y' − y x')`. Prove

```
4π |signedArea γ| ≤ T ∫₀ᵀ ‖γ'‖².
```

Give the complete equality analysis: equality means a constant curve, or a translated
circle traversed once at constant angular speed with one of the two orientations.
Prove the derivative relation a.e. and solve it using the AC FTC. The mean-zero
Wirtinger equality alone also permits ellipses, so the area/energy equality needs its
own argument. Compare this signed integral with DifferentialGeometry 5.6's winding-weighted
area; for a positively oriented simple curve it is the actual volume of the inside.

For a rectifiable curve use GMT G1's arclength parametrization. Prove the constant-speed
energy identity and the invariance of trace, length, and signed area under admissible
parametrization changes. The resulting length inequality uses actual total variation;
it is not an inequality involving the energy of an arbitrarily supplied parametrization.

## I4 — Sharp Euclidean perimeter inequality and ball rigidity

Establish the full finite-volume finite-perimeter inequality stated above, including
unbounded sets. Supply the smooth/bounded case, the volume-and-perimeter approximation
passage using GMT G4, and the exact constants from ball volume and surface measure. Give
equivalent normalized forms, scaling laws, and explicit formulas for balls. State versions
with relative perimeter only when their domain terms and hypotheses are separately proved;
the headline is whole-space Euclidean perimeter.

Prove **rigidity at finite-perimeter regularity**. For every positive finite-volume set,
equality holds iff it agrees a.e. with a ball. This includes nonsmooth, disconnected,
and unbounded measurable representatives. Smooth equality plus approximation is not a
proof of this assertion. Develop the strictness/equality lemmas, symmetrization equality
analysis, and measure-theoretic connectedness or slicing arguments needed by the proof
actually used. If indecomposable finite-perimeter sets are introduced, define them using
partitions with additive perimeter and build their decomposition, uniqueness, and volume
and perimeter summation theory here. Every further object introduced in the rigidity
proof must receive its basic restriction, invariance, and comparison API.

Give the topological-frontier corollary for every bounded measurable set, and the more
general finite-volume version, with `Hⁿ⁻¹(frontier E)` on the right. An infinite frontier
measure makes the extended inequality immediate; the finite case uses GMT G5's boundary
criterion and `P(E) ≤ Hⁿ⁻¹(frontier E)`. Supply its sharp-constant equality consequences:
for positive finite volume and finite frontier measure, equality implies agreement a.e.
with a ball. Do not assert literal ball equality for arbitrary representatives or a
converse for every null modification: topological frontier is sensitive to null sets.
Give exact ball rigidity for bounded regular open sets when equality holds, proving the
passage from a.e. equality to point-set equality under that hypothesis.

Specialize to bounded Lipschitz and `C¹` domains with actual Hausdorff surface area and
their classical outward normals. The surface-area/perimeter identification is GMT G6's
comparison, not a new definition chosen to make this inequality immediate.

## I5 — Sharp BV Sobolev and its equality cases

For `n ≥ 2`, `p = n/(n−1)`, prove on the whole space

```
‖u‖_p ≤ (n ω_n^(1/n))⁻¹ |Du|(ℝⁿ),                u ∈ BV(ℝⁿ).
```

Derive it from coarea, layer cake, and I4, with the integral Minkowski inequality and
its equality analysis made explicit. Prove membership in `Lᵖ`; the norm expression alone
is not sufficient. Equality for a nonzero real-valued `u` holds exactly when
`u = c χ_(ball a r)` a.e., with `c ≠ 0`, `r > 0`. Establish the nesting and proportionality
of superlevel sets and the absence of sign cancellation required for this classification;
do not merely classify each level set separately as a ball. Treat the zero function
separately. Give the `W¹,¹` corollary and nonattainment by nonzero `W¹,¹` functions, as well
as normalized smooth near-extremizers approximating a ball indicator. This is the sharp
endpoint complement to PDE's general Sobolev embedding theory.

## I6 — Full planar Jordan theorem and compatibility

Prove the geometric and parameterized statements in the scope section, using actual
Lebesgue area, Hausdorff length, and total variation. Supply the equivalence of the
parameterized hypotheses with the existing `IsJordanCurve` trace plus rectifiability.
Derive area positivity and finiteness, length positivity and finiteness, and the
orientation-independent inequality.

Give both compatibility results: the planar finite-perimeter specialization via GMT G6,
and the AC/arclength area–energy specialization via I3 and Green's theorem. They must
use the same inside and the same length. For the finite-perimeter equality argument,
prove that the Jordan inside is regular open, that equality a.e. with a ball implies
actual equality of the inside with the ball, and hence that its frontier is the circle.
For the curve argument, transport equality of the arclength trace back to the original
curve, without imposing constant speed on that original parametrization. Prove the
converse for every continuous rectifiable simple parametrization of a circle.

## Acceptance examples and completion

Prove the disk/circle and `n`-ball formulas with the exact constants; an ellipse and a
rectangle have strict planar inequality unless the domain is a disk (in particular every
nondegenerate ellipse with unequal axes and every rectangle are strict). Compute annulus
area and perimeter and prove strictness. Give separated unions of two positive-radius
balls as strict examples. Check a punctured ball: it has equality for perimeter and a.e.
ball rigidity, while literal ball equality fails. Check a circle traversed twice: its
trace is a circle, but its parameterized length and winding-weighted area reflect
multiplicity and it is not a simple-curve equality case. Include a circle parametrized
by a continuous singular increasing homeomorphism, which tests the full rectifiable
statement beyond AC parameters. Verify the BV extremizers and smooth near-extremizers.

Completion requires the full inequality **and** equality statements, the geometric bridges,
and the reusable APIs of I1–I5. An outer-neighborhood-volume inequality without the
perimeter comparison, a smooth-only theorem, a supplied area/perimeter identity, or an
equality hypothesis assumed as input does not discharge the target. Proofs must use the
ordinary kernel-checked Mathlib/Tau Ceti foundation, with no additional mathematical axioms,
and the final declarations must have explicit integrability and finiteness hypotheses.

## References and existing formalizations

- Francesco Maggi, [*Sets of Finite Perimeter and Geometric Variational Problems*](https://cvgmt.sns.it/paper/1880/),
  for finite-perimeter isoperimetry and symmetrization. GMT's roadmap owns the underlying
  measure and boundary theory.
- [The Brunn–Minkowski exposition by Terence Tao](https://terrytao.wordpress.com/2011/09/16/the-brunn-minkowski-inequality-for-nilpotent-groups/)
  includes the Euclidean Prékopa–Leindler argument.
- [Freek Wiedijk's isoperimetric entry and HOL Light proof](https://www.cs.ru.nl/~freek/100/hol.html#43)
  provide a classical planar comparison: arbitrary rectifiable simple closed curves and
  geometric circle equality.
- **Humanfia's [public Lean source archive](https://huggingface.co/datasets/humanfia-lab/lean-eval-source/tree/main/problems/isoperimetric_inequality)**
  contains a higher-dimensional bounded-set inequality using volume and Hausdorff measure
  of the topological frontier. It is relevant prior work for I1 and I4; the canonical
  finite-perimeter theory and equality cases remain intrinsic requirements here.
- **Jonathan Ho's [isoperimetric repository](https://github.com/hojonathanho/isoperimetric)**,
  also distributed [in LeanPool](https://github.com/LeanPool/lean-pool/tree/main/LeanPool/Isoperimetric),
  develops Prékopa–Leindler, Brunn–Minkowski, and outer-neighborhood volume inequalities.
  These are relevant to I1–I2. A neighborhood inequality still requires its bridge to
  geometric perimeter and rigidity.
- **[kim-em/isoperimetric](https://github.com/kim-em/isoperimetric)** is a parallel development
  directed at the classical isoperimetric theorem. Cite and examine its mathematical
  results as existing work; neither its implementation nor any chosen dependencies
  prescribe this roadmap's design or discharge a milestone without its full requirements.

All three are prior work, not required imports, prescribed sources to port, or assumed
proof strategies. Contributors develop the mathematics properly on the canonical
Mathlib/Tau Ceti APIs and assess every result against the statements above. Reuse of code
follows the repository's coordination and attribution rules. New definitions must receive
their full usable basic theory, and all comparisons must agree with the geometric
normalizations and a.e. conventions fixed here.

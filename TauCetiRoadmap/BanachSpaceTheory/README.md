# Banach space theory

Build the geometry and duality of Banach spaces, from weak compactness and bases to
approximation, tensor norms, summing operators and finite-dimensional geometry. The
depth milestones are James's theorem, Pietsch domination and factorization,
Grothendieck's inequality, local reflexivity and Dvoretzky's theorem. Each sits inside
a usable theory of spaces, operators and their constructions.

## Scope and conventions

Spaces are over `𝕜 = ℝ` or `ℂ`, expressed with `RCLike` where appropriate; completeness
is a hypothesis, not part of the meaning of normed space. The local geometry in B7
is over `ℝ`. All duals are continuous duals `StrongDual 𝕜 E`; reflexivity means
surjectivity of `NormedSpace.inclusionInDoubleDual`, not algebraic reflexivity.
Use `WeakSpace 𝕜 E` and `WeakDual 𝕜 E`, with explicit transport between topologies.
Weak convergence in a dual is different from weak-star convergence.

Operators are `ContinuousLinearMap`; subspaces and quotients use Mathlib's
`Submodule` and normed quotient constructions. A Banach subspace is closed.
Compactness and relative compactness must be distinguished: the latter means
compact closure in the stated ambient topology. A Schauder series converges along
initial segments; an unconditional series converges along the net of finite sets.
Use `SchauderBasis`, `UnconditionalSchauderBasis` and `SummationFilter` accordingly.

The prerequisites are Mathlib's Hahn–Banach theorem, Banach–Alaoglu theorem,
uniform boundedness, open mapping theorem, Bochner integration and finite-dimensional
linear algebra. Supply the additional constructions below in Tau Ceti. This roadmap
owns general Banach-space tensor norms and absolutely summing operators.
[Operator ideals](../OperatorTheory/OperatorIdeals/README.md) owns Hilbert-space Schatten ideals,
trace norms and singular values; [operator theory](../OperatorTheory/README.md) owns
the Hilbert-space spectral theory. C*-tensor norms are outside this Banach-space
scope. No operator-algebra roadmap is a prerequisite here.

## B1. Duality and weak topologies

Develop annihilators and preannihilators, order reversal, annihilators of sums and
intersections, and the double-annihilator theorem with the correct closure. For a
closed subspace `F ≤ E`, identify `(E/F)*` isometrically with `Fᗮ`, and `F*` with
`E*/Fᗮ`; construct restriction, quotient and inclusion maps and prove their naturality.
Develop the adjoint of a bounded map, its norm, kernels, ranges and composition.
For a bounded operator between Banach spaces, with both domain and codomain
complete, prove the closed-range theorem: `range T` is norm closed iff
`range T*` is norm closed. Separate the unconditional identities
`ker T*=(range T)ᗮ`, `ker T=(range T*)_⊥`, and
`closure(range T)=(ker T*)_⊥` from the closed-range conclusion
`range T*=(ker T)ᗮ`. Give the incomplete-domain counterexample
`c₀₀⊂ℓ²` with its ℓ² norm: inclusion has dense proper range,
while its adjoint is surjective by extension to the completion.

Extend the existing canonical bidual embedding by its naturality under bounded
maps, Goldstine's theorem (its closed unit ball has weak-star dense image in the
bidual unit ball), and norming by the dual unit ball. Prove the bipolar theorem for
absolutely convex sets and the weak/norm closure agreement for convex sets; over
complex scalars convexity still means real convexity. Include the finite-convex-
combination form of Mazur's lemma for weakly convergent sequences.

Give weak and weak-star continuity criteria by evaluation, boundedness consequences
of weak boundedness, and the weak-star metrizability of a dual unit ball when the
predual is separable. Specify an actual compatible metric from a dense sequence in
the predual unit ball and prove independence of the chosen sequence at the topology
level. Do not impose separability on Banach–Alaoglu or Goldstine.

## B2. Weak compactness and reflexivity

Prove the following with reusable intermediate separation, compactness and
subsequence lemmas.

* **Eberlein–Šmulian:** a subset of a normed space is weakly compact iff it is
  weakly sequentially compact. Also prove the relative version, where subsequential
  limits may lie in the ambient space. No separability assumption is allowed.
* **Reflexivity:** a Banach space is reflexive iff its closed unit ball is weakly
  compact. Establish invariance under bounded linear equivalence, inheritance by
  closed subspaces and quotients, and equivalence with reflexivity of the dual.
* **James:** for a nonempty weakly closed subset `A` of a Banach space, weak
  compactness is equivalent to attainment on `A` of the supremum of `|f|` for every
  continuous linear functional `f`. Attainment includes existence of a finite
  maximum. Deduce reflexivity iff every functional attains its norm on the closed
  unit ball. Develop the separable reduction and finite norming sets needed in the
  proof; completeness cannot be dropped from the theorem.
* **Krein–Šmulian:** a convex subset of the dual of a Banach space is weak-star
  closed iff its intersection with every closed ball centered at zero is weak-star
  closed. Include the linear-subspace criterion using just the unit ball.
* **Bishop–Phelps:** norm-attaining continuous linear functionals are norm dense
  in the dual; support points are dense in the boundary of a nonempty closed convex
  set. State the support-functional version with boundedness of the set.
* **Milman–Pettis:** every uniformly convex Banach space is reflexive. Develop the
  modulus of convexity, passage to closed subspaces and invariance of reflexivity
  under equivalent norms. Include the standard uniform convexity estimates for
  `Lᵖ`, `1 < p < ∞`.

For a bounded operator, weak compactness means relative weak compactness of the
image of the unit ball. Prove the Gantmacher criterion
`T**(E**) ⊆ J_F(F)`, weak compactness iff weak compactness of the adjoint, stability
under sums and bounded compositions, and compact implies weakly compact.
Use the identity on an infinite-dimensional reflexive space to separate the two.

## B3. Schauder bases and classical spaces

Extend Mathlib's basis and coordinate maps with coefficient uniqueness, basis
constants, equivalent norms making a basis monotone, subsequences and block bases
as bases of their closed spans, and equivalence of bases by two-sided inequalities
on finite linear combinations. Build the induced continuous linear equivalence of
closed spans. Prove the small perturbation theorem: if `(bₙ)` is a Schauder basis
and `∑ ‖bₙ*‖ ‖bₙ−cₙ‖ < 1`, then `(cₙ)` is an equivalent basis, via the bounded
invertible operator sending `bₙ` to `cₙ`. Give its norm and inverse-norm estimates.

A basis is shrinking when its coordinate functionals span a norm-dense subspace of
the dual. It is boundedly complete when every scalar sequence with bounded initial
partial sums gives a norm-convergent series. Develop the dual basic sequence on its
closed span, the shrinking/boundedly-complete duality, and James's basis criterion:
a Banach space with a Schauder basis is reflexive iff that basis is both shrinking
and boundedly complete. Do not equate an ordinary Schauder expansion with `tsum`
using the unconditional filter.

For unconditional bases, give the equivalent uniform bound on finite coordinate
projections and on signed coordinate multipliers, suppression and permutation
invariance, and extension of bounded scalar multipliers. Construct the canonical
bases of `c₀` and `ℓᵖ`, `1 ≤ p < ∞`, identify `c₀* = ℓ¹` and `(ℓᵖ)* = ℓᑫ` for
`1 < p < ∞`, and identify `(ℓ¹)* = ℓ∞`. Use Mathlib's sequence-space models and
give isometric equivalences rather than introducing competing spaces.

Prove Schur's theorem for `ℓ¹`. Exhibit the unit-vector sequence in `c₀` as weakly
null but not norm null, the nonreflexivity of `c₀` and `ℓ¹`, and reflexivity of `ℓᵖ`
for `1 < p < ∞`. These examples also distinguish shrinking from bounded completeness.
Construct the Haar basis of `Lᵖ([0,1])`, `1 ≤ p < ∞`, with the constant first vector
and increasing dyadic levels; prove it is unconditional for `1 < p < ∞`.

## B4. Approximation and Banach tensor products

Define the approximation property by uniform approximation of the identity on
each norm-compact subset by bounded finite-rank operators. The `λ`-bounded
approximation property adds `‖T‖ ≤ λ`; BAP means such a finite `λ` exists and MAP
means `λ = 1`. Prove MAP implies BAP implies AP, stability under bounded linear
equivalence (with the appropriate change in `λ`), inheritance by complemented
subspaces, and BAP from a Schauder basis with its basis constant. Prove MAP for
`c₀`, `ℓᵖ` and `Lᵖ([0,1])`, `1 ≤ p < ∞`, using the explicit projections.

Prove Grothendieck's equivalence: `E` has AP iff every compact operator `F → E`
from every Banach space is an operator-norm limit of finite-rank operators. Include
the compact-disk construction and the fact that a relatively norm-compact set is
contained in the closed convex hull of a null sequence.

On the algebraic tensor product define the projective norm by the infimum of
`∑ ‖xᵢ‖ ‖yᵢ‖` over finite decompositions and the injective norm by
`sup {|∑ f(xᵢ)g(yᵢ)| : ‖f‖ ≤ 1, ‖g‖ ≤ 1}`. Prove they are norms over `ℝ` and `ℂ`,
the elementary-tensor equality, and `ε ≤ π`. Construct their completions, their
dense algebraic embeddings, the maps induced by bounded maps in both variables,
and symmetry, associativity and scalar-unit isometries with coherence on pure
tensors. The injective tensor product preserves isometric embeddings; the
projective tensor product preserves metric quotient maps.

Prove the norm-preserving universal property of the completed projective tensor
product for bounded bilinear maps into a Banach space, and its dual identification
with bounded bilinear forms. Identify the injective completion `E* ⊗ε F` with the
operator-norm closure of finite-rank maps `E → F`. Construct the canonical map
`E* ⊗π F → (E →L[𝕜] F)` and its range with quotient norm: nuclear operators.
Prove completeness, rank-one norm, the ideal inequality and the series
representation `T x = ∑ fₙ(x)yₙ` with `∑ ‖fₙ‖‖yₙ‖ < ∞`; the nuclear norm is the
infimum over those representations. Keep this norm distinct from the operator
norm and from the Hilbert-space trace-class identification owned by OperatorIdeals.

## B5. Function spaces and weak compactness

For compact Hausdorff `K`, develop the Banach-space duality between `C(K,𝕜)` and
finite regular scalar Borel measures, with the total-variation norm, evaluation
measures and the weak-star topology. Extend Mathlib's measure representation API
as needed. Prove the Banach–Stone theorem in its operator form: a surjective linear
isometry `C(K,𝕜) → C(L,𝕜)` is `f ↦ h · (f ∘ φ)`, where `φ : L ≃ₜ K` and
`h : C(L,𝕜)` has pointwise modulus one; include uniqueness and the converse.

For a finite measure `μ`, prove the Dunford–Pettis weak compactness criterion:
a subset of `L¹(μ)` is relatively weakly compact iff it is norm bounded and its
integrals are uniformly absolutely continuous with respect to `μ`. Relate this
to the uniform tail-integral criterion. Build the truncation, Radon–Nikodym and
weak-closure arguments, and prove weak sequential completeness of `L¹(μ)`.

An operator is completely continuous if weakly convergent sequences have
norm-convergent images. Prove equivalence to taking weakly compact sets to
norm-compact sets. The Dunford–Pettis property of a space means that every weakly
compact operator from it to any Banach space is completely continuous. Prove the
criterion `fₙ(xₙ) → 0` when both sequences are weakly null in the space and its
dual, and prove the property for `C(K)` and `L¹(μ)`. Include an infinite-dimensional
Hilbert space as a counterexample. Weak-star null functionals cannot replace
weakly null functionals in the criterion.

## B6. Summing operators and Grothendieck's inequality

For real `1 ≤ p < ∞`, define the weak `p`-norm of a finite family `(xᵢ)` as
`sup_{‖f‖≤1} (∑ |f(xᵢ)|ᵖ)^(1/p)`. A bounded operator is absolutely `p`-summing
if `(∑ ‖Txᵢ‖ᵖ)^(1/p)` is bounded by a constant times that weak norm; `πₚ(T)`
is the least constant. Construct the Banach operator ideal, with rank-one norm,
`‖T‖ ≤ πₚ(T)`, completeness, ideal inequality and inclusion `π_q(T) ≤ π_p(T)`
for `p ≤ q`. For `p = 1`, prove the characterization by taking unconditionally
convergent series to absolutely convergent series.

Prove Pietsch domination: `πₚ(T) ≤ C`, for `C ≥ 0`, iff there is a regular Borel
probability measure `ν` on the weak-star compact dual unit ball such that
`‖Tx‖ ≤ C (∫ |f(x)|ᵖ dν(f))^(1/p)` for all `x`. Include the separating-convex-sets
argument constructing `ν`, measurability of evaluations, and factorization through
the closure of the canonical image of `E` in `Lᵖ(ν)`, with factor norm at most `C`.
Do not assert extension of this factor to all `Lᵖ(ν)` with arbitrary codomain.

Prove the real and complex Grothendieck inequalities with finite universal
constants: for any finite scalar matrix `a`, the supremum of
`|∑ aᵢⱼ ⟨uᵢ,vⱼ⟩|` over Hilbert unit vectors is bounded by `K_G` times the
supremum of `|∑ aᵢⱼ sᵢtⱼ|` over scalar unit balls. Give the real Gaussian/sign
construction, its covariance calculation and the passage to complex scalars;
no optimal value of `K_G` is required. Derive the bounded bilinear-form version
on `C(K) × C(L)` and `π₂(T) ≤ K_G ‖T‖` for `T : C(K) → L¹(μ)` with finite `μ`.

## B7. Local theory and Euclidean sections

Define Banach–Mazur distance between nonzero finite-dimensional real normed
spaces of equal dimension as `inf ‖T‖‖T⁻¹‖`. Prove symmetry, multiplicative
triangle inequality, invariance under isometry and distance one iff isometry.
Define finite representability using arbitrarily small distortion embeddings of
each finite-dimensional subspace; prove transitivity and inheritance by subspaces.

Prove local reflexivity: for finite-dimensional `F ≤ E**`, `G ≤ E*` and `ε > 0`,
there is a linear embedding `T : F → E` with distortion at most `1+ε`, preserving
every pairing with `G` and satisfying `T(J_E x) = x` whenever `J_E x ∈ F`.
Give the equivalent `(1−ε,1+ε)` norm bounds for `0 < ε < 1`. Develop the
finite-system separation and norm approximation lemmas used in its proof.
Deduce finite representability of `E**` in `E`.

Develop symmetric convex bodies in finite-dimensional Euclidean spaces, polar
bodies, ellipsoids, volume and change of variables. Prove John's ellipsoid theorem
and its contact-point decomposition for symmetric bodies; derive
`d(E,ℓ²_n) ≤ √n` and the Kadec–Snobar projection theorem: every `n`-dimensional
subspace of a real Banach space admits a projection of norm at most `√n`.

Prove Dvoretzky's theorem: for every `k ≥ 1` and `ε > 0` there is `N` such that
every real normed space of dimension at least `N` has a `k`-dimensional subspace
at Banach–Mazur distance less than `1+ε` from `ℓ²_k`. Deduce that `ℓ²` is finitely
representable in every infinite-dimensional real Banach space. Build the sphere
concentration and net estimates used for this: normalized spherical measure,
rotation invariance, a bound `2 exp(−c n t²/L²)` about a median for real
`L`-Lipschitz functions on `Sⁿ⁻¹` with its Euclidean distance, for `n ≥ 2`, `L > 0`
and `t > 0`, with a universal positive `c`; also construct a finite `η`-net of
`Sᵏ⁻¹` of size at most `(1+2/η)^k`, for `η > 0`.
Combine these with John's position to obtain the dimension threshold; specify a
concrete valid threshold in the implementation, without an optimality claim.

## Sources and API alignment

* Megginson, *An Introduction to Banach Space Theory*: §§2.6–2.11 (Goldstine
  2.6.26, Krein–Šmulian 2.7.11, Eberlein–Šmulian 2.8.6, James 2.9.3–2.9.4,
  Bishop–Phelps 2.11.14), §3.4 (AP equivalence 3.4.32), §4.4 (basis criterion
  4.4.15), §5.2 (Milman–Pettis 5.2.15).
* Albiac–Kalton, *Topics in Banach Space Theory*: Chapters 1–5 (bases and
  function spaces), Chapter 8 (Grothendieck 8.1.1, Pietsch 8.2.8), §12.2
  (local reflexivity 12.2.4), §12.3 and Chapter 13 (Dvoretzky 12.3.13,
  John 13.1.5, Kadec–Snobar 13.1.7).
* Runde, *Lectures on Amenability*, Appendix B.2: injective/projective tensor
  norms, completions, functoriality and the projective universal property.

Mathlib's `Analysis.Normed.Module.Bases` already supplies generalized Schauder
bases, finite projections and projection bounds. Follow the designs discussed in
[Extending Functional Analysis Coverage on Zulip](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Extending%20Functional%20Analysis%20Coverage)
and [PR #34209](https://github.com/leanprover-community/mathlib4/pull/34209).
For the bipolar theorem and uniform convexity use the shape of
[PR #26345](https://github.com/leanprover-community/mathlib4/pull/26345) and
[PR #28693](https://github.com/leanprover-community/mathlib4/pull/28693).

Tensor-product spelling requires care: the `injectiveSeminorm` in the pinned
Mathlib is not the classical `ε` norm above. Follow `leastCrossnorm` and the
projective API in [PR #33969](https://github.com/leanprover-community/mathlib4/pull/33969),
including compatibility of binary and finite-family tensors. Follow the nuclear
operator design in [PR #42197](https://github.com/leanprover-community/mathlib4/pull/42197),
whose `ContinuousLinearMap.nuclearOperators` uses the range of the completion map
from `F ⊗π E*`; the tensor symmetry identifies this with the ordering used in B4.
Build every needed missing result in Tau Ceti with these interfaces; adopt
Mathlib's implementation when available.

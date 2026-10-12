# Roadmap: integral Hecke actions, determinants and interpolation

**Summary.** This roadmap builds the integral algebra that attaches Galois data to Hecke eigensystems: Chenevier's determinants (polynomial laws whose characteristic coefficients survive torsion and nonreduced coefficient rings), reconstruction of representations over henselian and complete local rings, integral and derived Hecke actions on cohomology, the normalisation of Hecke polynomials for GL_n and GSp₄, interpolation of determinants through finite quotients with quantified nilpotent errors, and integral Ribet modules with their Fitting ideals. We want it because the modern route to Galois representations for torsion classes, and to modularity lifting over CM fields, works with Hecke algebras that are not reduced and coefficient rings that are not fields; determinants, derived Hecke actions and the quantified interpolation are exactly the tools those arguments use, and the Ribet modules are what the Euler-system and main-conjecture roadmaps consume.

The end theorems are the interpolation theorem of Layer IHG.4 (a unique continuous determinant over
a nonreduced complete coefficient ring with prescribed Frobenius polynomials on a fixed group
`G_{F,S}`), the quantified descent of Layer IHG.5 (the same over the quotient by a nilpotent error
ideal, with exponents that compose and are uniform in limits), and the integral Ribet theorem of
Layer IHG.6 (a finite module with a cocycle class whose zeroth Fitting ideal lies in the congruence
ideal, including coincident residual characters and residue characteristic two). Every interface
keeps its coefficient ring: reconstruction carries its residual hypotheses, Hecke images keep the
action, interpolation carries its error ideal.

## Scope and ownership

Owned here: polynomial laws and Chenevier determinants with their coefficients, kernels, Roby
representing rings, trace comparisons, duals, projective and Azumaya determinants,
invariant-coordinate reductive pseudocharacters and rational cohomology of flat affine group schemes
(IHG.0); Cayley–Hamilton algebras, field and henselian reconstruction, generalized matrix algebras,
reducibility ideals, coefficient descent, Caraiani–Newton compressions and `GL` reconstruction
(IHG.1); Hecke images, ghosts, local factors and ordinary parts (IHG.2); `GL_n` and `GSp₄`
polynomial conversions (IHG.3a) and Galois-type maximal ideals (IHG.3b); interpolation (IHG.4);
nilpotent error ideals (IHG.5); the Ribet construction with its Fitting bound, integral `GL₂` good
filtrations and the Koszul and Buchsbaum–Rim relation complexes (IHG.6).

Outside the scope: completed coefficient-tensor evaluation, completed Cayley–Hamilton topology and
continuous pseudodeformation representability. Applications supply their geometric Hecke
comparisons and congruence witnesses in the algebraic form fixed here.

Cited roadmaps: SmoothRepresentationsOfLocalGroups (SR.4 spherical generators, Satake and the
`GSp₄` spin polynomial; SR.6.3 the cocycle scheme and excursion algebra), ReductiveGroups (layer 9,
split groups over `ℤ`), ReductiveGroupsPartII (RG2.2, RG2.3), SemisimpleAlgebras (layers 0, 2–5),
ClassFieldTheory (layer 7), Chebotarev (layer 10), ProfiniteCohomology (layer 2), ModularForms
(layer 9), PadicMeasuresIwasawaAlgebras (§4.5 `TauCeti.fittingIdeal_le_annihilator`, §5.1
determinant lines) and SchemeAndStackFoundations (§0.20 Japanese rings, §2.22 Azumaya splitting).

## Conventions

**Rings and laws.** `A` is commutative and `R` an associative unital `A`-algebra. A polynomial law
is a natural family over all commutative `A`-algebras `S` in the universe of `A` (Mathlib's
`toFun'`); identities between determinants are identities of laws, not of values on `R`.

**Characteristic polynomials.** For a degree-`d` determinant, `χ_D(x, X) = D_{A[X]}(X − x)`, monic,
with `χ = Σ (−1)^i Λ_i X^{d−i}` and `Tr = Λ₁`; degree zero gives the constant law `1`. The monic
inverse-root polynomial of `P` with unit constant term is `X^d P(X⁻¹)/P(0)`. Scholze's `D(1 − Xg)`
is the reversal `X^d P(X⁻¹)` of ours. Coefficient change on a group algebra is read on the
polynomials of group elements, which by Amitsur's formula determine the law.

**Frobenius and Satake.** Arithmetic Frobenius has cyclotomic value `ε = q`, geometric `ε = q⁻¹`;
a chosen Artin map names its convention. Spherical measures have `vol(K) = 1`; `T₀ = 1` for `GL_n`,
`s² = q`; for `GSp₄` the central double coset `T₀` is a unit and the full multiplier `μ` is kept
separately from `det = μ²`.

**Ribet modules.** `α = χψ⁻¹` acts on the left; cocycles satisfy `κ(gh) = κ(g) + α(g)κ(h)`
(Mathlib's `groupCohomology.IsCocycle₁` shape), coboundaries are `(α(g) − 1)y`. Fitting ideals are
zeroth Fitting ideals `TauCeti.fittingIdeal A M 0`.

**Matrix modules.** A matrix representation `ρ : R → M_d(K)` acts on `Kᵈ` through `matrixModule`;
irreducible and semisimple mean Mathlib's `IsSimpleModule` and `IsSemisimpleModule` (so dimension
zero is not irreducible).

**Names and pins.** Lean names are relative to `TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants`
in [Suggested.lean](Suggested.lean). The pins are Mathlib `6b7abb3c76` and Tau Ceti `a91d3aaf`.
Locators give the theorem or section and the printed page of the editions under *References*.

## Exact supplier contracts

| Object | Supplier | File |
| --- | --- | --- |
| Polynomial laws | `PolynomialLaw`, `PolynomialLaw.ground`, `PolynomialLaw.id`, `PolynomialLaw.comp` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` |
| Divided powers | `DividedPowerAlgebra`, `DividedPowerAlgebra.dp` | `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` |
| Matrices after scalar extension | `matrixEquivTensor`, `Matrix.charpoly`, `Matrix.toLinAlgEquiv'` | `Mathlib/RingTheory/MatrixAlgebra.lean`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`, `Mathlib/LinearAlgebra/Matrix/ToLin.lean` |
| Group algebras | `MonoidAlgebra.of`, `MonoidAlgebra.lift`, `MonoidAlgebra.mapDomainAlgHom` | `Mathlib/Algebra/MonoidAlgebra/Basic.lean` |
| Two-sided ideals, corners | `TwoSidedIdeal.span`, `IsIdempotentElem.Corner`, `TauCeti.cornerSubmodule` | `Mathlib/RingTheory/TwoSidedIdeal/Operations.lean`, `TauCeti/RingTheory/Idempotents/Corner.lean` |
| Azumaya algebras, constant rank | `IsAzumaya`, `Module.rankAtStalk` | `Mathlib/Algebra/Azumaya/Defs.lean`, `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean` |
| Derived categories | `DerivedCategory`, `DerivedCategory.homologyFunctor`, `ModuleCat.finite_ext`, `Module.DirectLimit` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`, `Mathlib/Algebra/Category/ModuleCat/Ext/Finite.lean`, `Mathlib/Algebra/Colimit/Module.lean` |
| Adic topologies | `IsAdicComplete`, `IsAdic`, `Ideal.adicModuleTopology`, `IsAdicComplete.henselianRing` | `Mathlib/RingTheory/AdicCompletion/Basic.lean`, `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean`, `Mathlib/RingTheory/Henselian.lean` |
| Exterior algebra, regular sequences | `exteriorPower.map`, `CliffordAlgebra.contractLeft`, `RingTheory.Sequence.IsWeaklyRegular` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`, `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean`, `Mathlib/RingTheory/Regular/RegularSequence.lean` |
| Ideal powers, Fitting decomposition | `Ideal.sup_pow_add_le_pow_sup_pow`, `LinearMap.eventually_isCompl_ker_pow_range_pow`, `IsArtinianRing.equivPi` | `Mathlib/RingTheory/Ideal/Operations.lean`, `Mathlib/RingTheory/Artinian/Module.lean`, `Mathlib/RingTheory/Artinian/Ring.lean` |
| Polynomial transforms | `Polynomial.reflect`, `Polynomial.scaleRoots` | `Mathlib/Algebra/Polynomial/Reverse.lean`, `Mathlib/RingTheory/Polynomial/ScaleRoots.lean` |
| Fitting ideals | `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, `TauCeti.fittingIdeal_baseChange` | `TauCeti/RingTheory/FittingIdeal/Basic.lean`, `TauCeti/RingTheory/FittingIdeal/BaseChange.lean` |
| Comodules, Hopf points, `GL_n` | `TauCeti.Comodule`, `TauCeti.HopfAlgebra.points`, `TauCeti.GeneralLinear.coordinateHopfAlgebra` | `TauCeti/Algebra/Coalgebra/Comodule/Basic.lean`, `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean`, `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Borel.lean` |
| Completed group algebras, `ℤ_p` limits | `TauCeti.completedGroupAlgebra`, `PadicInt.inverseLimitRingEquiv` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`, `TauCeti/NumberTheory/Padics/InverseLimit.lean` |
| Classical comparisons | `HeckeRing.GL2.Newform.satakeParameters`, `IsArithFrobeniusLift.coe_localCyclotomicCharacter`, `exists_unit_conj_of_algEquiv` | `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean`, `TauCeti/NumberTheory/ClassFieldTheory/Local/Cyclotomic.lean`, `TauCeti/Algebra/CentralSimple/SkolemNoether.lean` |
| Spin polynomial | `SmoothRepresentationsOfLocalGroups.SpinPolynomial`, `SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal` (its `T1, T2` are `T₂, T₁` here) | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean` |

## How to read the build

`README.md` fixes every target; `Suggested.lean` states those statable against the pins, each with a
*Lean:* line below. Build order: IHG.0 → IHG.3a → IHG.1 → IHG.2 → IHG.3b → IHG.4 → IHG.5 → IHG.6
(IHG.3a precedes symplectic descent, field reconstruction precedes Galois-type ideals).

## Layer IHG.0: polynomial laws, determinants and invariant evaluations

Determinants as multiplicative homogeneous laws: coefficients, kernels, representing rings, trace
comparisons, and invariant-coordinate pseudocharacters.

### IHG.0.1 Homogeneous and multiplicative laws

**Homogeneous polynomial laws.** A law `f : M → N` is homogeneous of degree `n` if
`f_S(s·x) = sⁿ·f_S(x)` for every commutative `A`-algebra `S`, `s ∈ S`, `x ∈ S ⊗ M`. The zero law has
every degree, sums of degree-`n` laws have degree `n`, composition multiplies degrees, and degree
one means base change of a linear map ([Chenevier] §1.1, pp. 6–7). *Checks:* the identity has degree
one but the identity of `ℤ` does not have degree two (scale by `2`); over `𝔽_p` a degree-`(p+1)` law
can vanish on all `𝔽_p`-points without being zero, so homogeneity must be tested after scalar
extension.
*Lean:* `PolynomialLaw.IsHomogeneousOfDegree`.

**Multiplicative polynomial laws.** A law `f : R → B` between `A`-algebras is multiplicative if
`f_S(1) = 1` and `f_S(xy) = f_S(x)f_S(y)` on every `S ⊗ R` with Mathlib's tensor-product ring
structure; the identity is multiplicative and composites of multiplicative laws are ([Chenevier]
§1.1, p. 7). *Checks:* `det` on `M_d(A)` is multiplicative after every scalar extension; the zero
law on a nonzero ring preserves products but not `1`; `2 • id` on `ℤ` fails both conditions.
*Lean:* `PolynomialLaw.IsMultiplicative`.

### IHG.0.2 Scalar-extension laws and degree one

**The polynomial law of a linear map.** An `A`-linear `ℓ : M → N` gives the degree-one law
`ℓ_S = S ⊗ ℓ` with ground map `ℓ` ([Chenevier] Example 1.2(i), p. 7). *Checks:* `ℓ = id` gives the
identity law, `ℓ = 0` the zero law, and the ground value is `ℓ(m)`.

**Degree-one polynomial laws are linear.** For arbitrary modules, a law is homogeneous of degree one
iff it is the law of a unique linear map; no flatness is needed. Expand `P(uX + vY)`, compare
degrees after `(X, Y) ↦ (XT, YT)` for additivity, and use naturality for torsion modules
([Chenevier] Example 1.2(i) and footnote 11, p. 7).

**Determinants (Chenevier).** A `d`-dimensional `A`-valued determinant on `R` is a multiplicative
law `D : R → A` homogeneous of degree `d`, `d ≥ 0`; on `R = A[G]` it is a determinant of `G`. Then
`D(xy) = D(x)D(y)`, `D(1) = 1`, `D(ax) = a^d D(x)` and units go to units; in degree zero `D = 1`
([Chenevier] §1.5, Definition, p. 9). *Checks:* over `𝔽_p`, the `p`-th powers of evaluation at `0`
and at `1` on `𝔽_p[T]` are distinct `p`-dimensional determinants with the same (zero) trace, so
traces do not suffice.
*Lean:* `Determinant`, `Determinant.eval`.

**Characteristic polynomial and trace of a determinant.** `χ(x, X) = D_{A[X]}(X − x)` is monic of
degree `d` (when `A ≠ 0`) with constant term `(−1)^d D(x)`; `Tr = Λ₁` is `A`-linear with `Tr(1) = d`
([Chenevier] §1.10, (1.3), p. 12). *Checks:* `χ(1) = (X − 1)^d`, which fixes the sign convention
`X − x`; for `det ∘ ρ` the polynomial is `Matrix.charpoly (ρ x)` and the trace is the matrix trace,
not its negative.
*Lean:* `Determinant.charpoly`, `Determinant.trace`, `Determinant.traceLinear`.

**The determinant of a matrix representation.** For `ρ : R → M_d(A)`, `det ∘ ρ`, computed after each
scalar extension through `S ⊗ M_d(A) ≅ M_d(S)`, is a `d`-dimensional determinant with value
`det ρ(x)`, polynomial `charpoly ρ(x)` and trace `tr ρ(x)`; conjugate representations give the same
determinant ([Chenevier] §1.5, p. 9). *Checks:* at `[[2,3],[4,5]] ∈ M₂(ℤ)` the value is
`−2 = ad − bc`, the polynomial `X² − 7X − 2` and the trace `7`; in degree zero the polynomial is `1`
and the trace `0`; a block sum gives the product.
*Lean:* `Determinant.ofMatrix`, `Determinant.charpoly_ofMatrix`.

**Direct sums of determinants.** The pointwise product of determinants of dimensions `d₁, d₂` is a
determinant of dimension `d₁ + d₂` with `Tr = Tr₁ + Tr₂` and `χ = χ₁χ₂` ([Chenevier] proof of Lemma
2.2, p. 24). *Checks:* it matches `det` of a block sum; multiplying by the degree-zero determinant
changes nothing.

**Restriction of determinants.** For `φ : R′ → R`, `D ∘ φ` (composition with the law of `φ`) is a
`d`-dimensional determinant on `R′`, functorial in `φ`; along `A[H] → A[G]` it is restriction to a
subgroup ([Chenevier] §1.5, p. 9). *Checks:* restriction along the identity is `D`; restriction of
`det ∘ ρ` is `det ∘ (ρ ∘ φ)`.

**Scalar extension of determinants.** For a commutative `A`-algebra `S`, `D ⊗ S` is an `S`-valued
`d`-dimensional determinant on `S ⊗ R` with `(D ⊗ S)(1 ⊗ x) = D(x)`, compatible with `χ` and `Tr`;
this identifies determinants over `S` of `R` and of `S ⊗ R` ([Chenevier] Remark 1.4 and §1.5, p. 9).
*Checks:* `D ⊗ A = D`; `(D ⊗ S) ⊗ T = D ⊗ T`; base change of `det ∘ ρ` is `det ∘ (ρ ⊗ S)`.

**One-dimensional determinants are algebra homomorphisms.** `D ↦ D_A` is a bijection from
`1`-dimensional determinants on `R` to `A`-algebra maps `R → A`; on `A[G]` these are the characters
`G → Aˣ` ([Chenevier] §1.5, p. 9).

**Two-dimensional determinants on a group.** For a group `G`, `D ↦ (Tr, D|_G)` is a bijection onto
pairs `(T, δ)` with `δ : G → Aˣ` a homomorphism, `T(1) = 2`, `T(gh) = T(hg)` and
`δ(g)T(g⁻¹h) − T(g)T(h) + T(gh) = 0` ([Chenevier] Example 1.8 and Lemma 1.9, pp. 10–11).
*Checks:* at `diag(2,3)` the pair is `(5, 6)` and at the swap matrix `(0, −1)`, fixing which
component is the determinant.

**D(1 + rr′) = D(1 + r′r).** For every determinant and `r, r′ ∈ R` ([Chenevier] Lemma 1.12(i),
pp. 12–13).

**Pseudocharacters.** A `d`-dimensional pseudocharacter is a central `A`-linear `T : R → A` with
`T(1) = d` and `Σ_{σ ∈ S_{d+1}} sgn(σ) T^σ(x₁, …, x_{d+1}) = 0`, where `T^σ` has one factor
`T(x_{j₁}⋯x_{j_s})` for each cycle `(j₁ … j_s)`, fixed points included; Chenevier's assumption
`d! ∈ Aˣ` is moved to the comparison theorems ([Chenevier] §1.10, Lemma 1.12(iii) and §1.26, pp. 12,
20). *Checks:* the identity of `ℚ` is `1`-dimensional; the trace on `M₂(ℚ)` is not (`T(1) = 2`); a
transposition contributes a single factor `T(x₀x₁)`.
*Lean:* `cycleProduct`, `cycleTerm`, `IsPseudocharacter`.

### IHG.0.3 Kernels and quotient laws

**The kernel of a polynomial law.** `Ker(P)` is the submodule of `x` with `P_S(b ⊗ x + m) = P_S(m)`
for all `S`, `b ∈ S`, `m ∈ S ⊗ M`; `P` is faithful if `Ker(P) = 0` ([Chenevier] §1.17, p. 16).
*Checks:* the identity is faithful and the zero law has full kernel; the determinant on upper
triangular `2 × 2` matrices kills the strictly upper triangular ones.
*Lean:* `PolynomialLaw.ker`.

**Kernels are compatible with base change.** The image of `Ker(P) ⊗ B` lies in `Ker(P ⊗ B)` for
every commutative `A`-algebra `B` ([Chenevier] Lemma 1.18(iii), p. 16). **Laws factor through their
kernel.** `P` factors through `M/K` iff `K ⊆ Ker(P)`, so `Ker(P)` is the largest such submodule
([Chenevier] Lemma 1.18(i), p. 16). **The induced law on M/Ker(P) is faithful.** ([Chenevier] Lemma
1.18(ii), p. 16.)

### IHG.0.4 Roby algebras and representability

**Homogeneous divided-power piece.** `Γ^d_A(M)` is the submodule of `DividedPowerAlgebra A M`
spanned by `∏_j γ_{n_j}(m_j)` with `Σ n_j = d`, containing `γ_d(m)` and functorial in `M`
(`γ_d(m) ↦ γ_d(f(m))`); it is a graded piece, not a subalgebra ([Chenevier] §1.2, p. 8). *Checks:*
`Γ⁰ ≅ A` with `γ₀(m) = 1`; `Γ¹ ≅ M`; in `Γ_ℤ(ℤ)`, `γ₁(1)² = 2γ₂(1)` and `γ₂(1)` spans `Γ²`, so the
grading is not the polynomial one.

**Direct-sum grading of divided powers.** `⊕_d Γ^d_A(M) → Γ_A(M)` is an isomorphism, products
add degrees and `γ_d(m)` has degree `d`; directness as well as generation must be proved, by
weighting the generators and checking the Roby relations are homogeneous ([Roby] III §§1–2,
pp. 248–250).

**Universal homogeneous polynomial law.** The law `γ^univ_d : M → Γ^d(M)` sends `Σ s_j ⊗ m_j` to
`Σ_{Σ n_j = d} (∏ s_j^{n_j}) ⊗ ∏ γ_{n_j}(m_j)`; its ground value is `γ_d` and the coefficient of
`∏ T_j^{n_j}` in `γ^univ_d(Σ T_j m_j)` is `∏ γ_{n_j}(m_j)` ([Roby] Proposition IV.1, Theorem IV.1,
pp. 265–267). *Checks:* degree zero is `1`; degree one is the identity law; the coefficient of `UV`
in `γ²(Ux + Vy)` is `γ₁(x)γ₁(y)` with no factor `2`.

**Roby representability.** Composition with `γ^univ_d` is a natural linear equivalence
`Hom_A(Γ^d(M), N) ≅ {degree-d homogeneous laws M → N}`, with no flatness of `M` ([Roby] Theorem IV.1
and proof, pp. 266–267).

**Arbitrary base change of divided powers.** `B ⊗ Γ^d_A(M) → Γ^d_B(B ⊗ M)`,
`1 ⊗ γ_d(m) ↦ γ_d(1 ⊗ m)`, is an isomorphism for every `B`, flat or not, and the universal law is
compatible with it ([Roby] Theorem III.3 and proof, pp. 261–262). *Checks:* modulo `2`, `γ₀` stays
`1`, the degree-one generator is nonzero and `γ₂(2)` vanishes.

**Tensor map for homogeneous divided powers.** The natural map `Γ^d(M) ⊗ Γ^d(N) → Γ^d(M ⊗ N)`,
`γ_d(m) ⊗ γ_d(n) ↦ γ_d(m ⊗ n)`, given on mixed monomials by the sum over nonnegative integer
matrices with prescribed row and column sums; no isomorphism is claimed ([Chenevier] §1.2, p. 8;
[Roby] IV §11, Proposition IV.9, pp. 284–286). *Checks:* for `d = 2`, `M = N = ℤ`,
`γ₂(1) ⊗ γ₂(1) ↦ γ₂(1 ⊗ 1)` with coefficient `1`.

**Roby algebra of multiplicative laws.** `Γ^d_A(R)` carries the internal product
`Γ^d(R) ⊗ Γ^d(R) → Γ^d(R ⊗ R) → Γ^d(R)` with unit `γ_d(1)`, `γ_d(x) ⋆ γ_d(y) = γ_d(xy)`; algebra
maps `Γ^d(R) → S` are naturally the multiplicative degree-`d` laws `R → S` ([Chenevier] §1.2 and
footnote 13, p. 8). *Checks:* in degree one it is `R`; for `R = ℤ`, `γ₂(1) ⋆ γ₂(1) = γ₂(1)` while
the graded square is `6γ₄(1)`; `γ₂(2) ⋆ γ₂(3) = 36γ₂(1)`.

**Determinant coordinate ring.** `Z_A(R, d) = Γ^d_A(R)^ab`, the quotient by the two-sided ideal of
internal commutators, carries a universal determinant: `Hom_{A-alg}(Z_A(R,d), B) ≅ Det_d(B ⊗ R, B)`,
naturally in `B` and on fully scalar-extended inputs, and `B ⊗ Z_A(R,d) ≅ Z_B(B ⊗ R, d)`
([Chenevier] Proposition 1.6, Example 1.7(iv), pp. 9–10). *Checks:* `Z_A(R, 1) = R^ab`;
`Z_A(A, d) = A` with law `a ↦ a^d`; `Z_A(A[t], d) = A[e₁, …, e_d]` with universal polynomial
`X^d − e₁X^{d−1} + ⋯ + (−1)^d e_d`.

**Free divided powers and symmetric tensors.** For free `M`, `γ_d(m) ↦ m^{⊗d}` is an isomorphism
of `Γ^d_A(M)` onto the `S_d`-invariant tensors ([Roby] Theorem IV.2, Proposition IV.5, p. 272).

**Vaccarino universal determinant theorem.** For any set `X`, the determinant of generic `d × d`
matrices gives `Γ^d_ℤ(ℤ{X})^ab ≅ E_X(d)`, the subring of `ℤ[x_{a,ij}]` generated by characteristic
coefficients of words in generic matrices, sending the class of `γ_d(r)` to the generic determinant
of `r`; in particular `Z` is torsion-free. Characteristic-zero invariant theory does not give the
integral relations ([Chenevier] Theorem 1.15, pp. 14–15; [Emerson–Morel] Theorem 1.12, p. 5).

### IHG.0.5 Characteristic coefficients and trace comparisons

**Coefficient reconstruction from group words.** For a monoid `G`, two determinants on `A[G]` of the
same degree with equal characteristic polynomials at every `g ∈ G` are equal as laws (Amitsur's
expansion of coefficients of sums through coefficients of words); no factorial is inverted
([Chenevier] Lemma 1.12(ii), (1.4)–(1.5), Corollary 1.14, pp. 12–15).
*Lean:* `Determinant.eq_of_charpoly_eq`.

**Integral Newton identities.** With `p_j = Tr(r^j)`,
`kΛ_k(r) = Σ_{j=1}^k (−1)^{j−1} Λ_{k−j}(r) p_j` for `1 ≤ k ≤ d`; recovering `Λ_k` needs `k`
invertible ([Chenevier] Example 1.11(ii), (1.3), p. 12). *Checks:* for `[[2,3],[4,5]]`,
`2 det = 7² − 53 = −4`.

**The trace of a determinant is a pseudocharacter.** For every `A`, `Tr` of a `d`-dimensional
determinant is a `d`-dimensional pseudocharacter ([Chenevier] Lemma 1.12(iii) and proof,
pp. 12–14).
*Lean:* `Determinant.isPseudocharacter_trace`.

**A determinant is determined by its trace when d! is invertible.** If `d! ∈ Aˣ`, `D ↦ Tr` is
injective; without it this fails (the `𝔽_p` example above) ([Chenevier] Proposition 1.27, p. 20).
*Lean:* `Determinant.injective_trace`.

**Over ℚ-algebras determinants are pseudocharacters.** For a `ℚ`-algebra `A`, `D ↦ Tr` is a
bijection onto `d`-dimensional pseudocharacters; the inverse is the Newton polynomial in power
traces, and multiplicativity comes from a faithful extension on which the pseudocharacter is a
matrix trace (Procesi) ([Chenevier] Proposition 1.27 and proof, p. 20).
*Lean:* `Determinant.exists_unique_trace_eq`.

**Determinants and pseudocharacters when (2d)! is invertible.** The same bijection holds if
`(2d)! ∈ Aˣ`, or `d = 2` and `2 ∈ Aˣ`, by an integral antisymmetriser in the symmetric-group algebra
over `ℤ[1/(2d)!]` (an `S₄` idempotent over `ℤ[1/2]` in degree two) ([Chenevier] Proposition 1.29
and proof, pp. 20–22).
*Lean:* `Determinant.exists_unique_trace_eq_of_isUnit`.

**The kernel of a determinant.** `r ∈ Ker(D)` iff `D_S(1 + r r′) = 1` for all `S` and `r′ ∈ S ⊗ R`,
iff the same with `r′ r` ([Chenevier] Lemma 1.19(i), p. 17).

**The kernel of a determinant is a two-sided ideal.** `Ker(D)` is a two-sided ideal, proper when
`d > 0` and `R ≠ 0`, and the largest one through which `D` factors ([Chenevier] Lemma 1.19(ii), p.
17). *Checks:* zero kernel for `det` on `M_d(A)`, `d > 0`; full kernel in degree zero; the strictly
upper triangular ideal on triangular matrices.

**The characteristic polynomial law χ : R → R.** `χ(r) = r^d − Λ₁(r)r^{d−1} + ⋯ + (−1)^d Λ_d(r)` is
a degree-`d` law; its coefficients `χ_α(r₁, …, r_n)` are those of `χ(t₁r₁ + ⋯ + t_nr_n)`, extracted
through the monomial basis since `R` may be noncommutative ([Chenevier] §1.10, p. 12). *Checks:*
`χ = 0` for `det` on `M_d(A)`; `χ(r) = r − D(r)` in degree one; `χ(1) = 0` for `d ≥ 1`.

**The Cayley–Hamilton identity for determinants.** `D(1 + χ_α(r₁, …, r_n) r) = 1` for all `r, r_i`
and `α`, with no hypothesis on `A` ([Chenevier] Lemma 1.12(iv) and the paragraph on Vaccarino's
theorem, pp. 12–15).

**A determinant descends to the subring of its coefficients.** For a determinant on a monoid `G`
with coefficient subring `C` generated by all `Λ_i(g)`, there is exactly one `C`-valued determinant
extending to `D`; every `D(Σ t_j g_j)` has coefficients in `C` ([Chenevier] Corollary 1.14, p. 14).
*Checks:* the character `n ↦ (1/2)^n` of `ℕ` gives `ℤ[1/2]`; degree zero gives the prime subring.

**Continuous determinants.** For topological `G` and `A`, `D` on `A[G]` is continuous if every
`g ↦ Λ_i(g)` is; over a topological ring this is Chenevier's continuity of the maps `D^{[α]}`
([Chenevier] §2.30, p. 37). *Checks:* on a discrete group every determinant is continuous; a
one-dimensional determinant of a discontinuous character is not, over a topological ring (for `ℤ`
with the upper-set topology, where negation is discontinuous, the sign character of `ℤ/2` is a
counterexample).
*Lean:* `Determinant.IsContinuous`.

**Continuous determinants are determined on a dense subgroup.** For Hausdorff `A` and dense
`H ≤ G`, equal polynomials on `H` force equality ([Chenevier] Example 2.31, p. 38).

**Continuity is openness of the kernel.** For profinite `G` and discrete `A`, `D` is continuous iff
`g − gh ∈ Ker(D)` for all `g` and `h` in some open normal `H`; then `G → (A[G]/Ker D)ˣ` factors
through `G/H` ([Chenevier] Lemma 2.33, p. 38). *Checks:* compactness is needed for finite image:
`n ↦ 2ⁿ` on discrete `ℤ` into discrete `ℚˣ` has infinite image.

### IHG.0.6 Duals, projective modules and reduced norms

**Contragredient determinant.** For a group `G`, `D∨` is `D` precomposed with the anti-involution
`g ↦ g⁻¹` of `A[G]`; it is a determinant of the same degree, `(D∨)∨ = D`,
`χ_{D∨}(g) = χ_D(g⁻¹) = X^d χ_D(g)(X⁻¹)/χ_D(g)(0)`, and it is the determinant of the
transpose-inverse representation. Twisting by a unit character `θ` (restriction along `h ↦ θ(h)h`)
multiplies `D(g)` by `θ(g)^d` ([Quast] §3.4, p. 17; [Chenevier] §1.5, p. 9). *Checks:* the dual of a
character is its inverse; at `diag(2,3)` the dual polynomial is `X² − (5/6)X + 1/6`; the trivial
character fixes `D` under twisting.

**Determinant of a finite projective representation.** For `V` finite projective of constant rank
`d` (`Module.rankAtStalk V = d`) and `ρ : R → End_A(V)`, `∧^d ρ(r)` is multiplication by a scalar
`D_ρ(r)`, and doing this after every scalar extension gives a `d`-dimensional determinant equal to
the matrix determinant in a basis and compatible with base change; invertibility of the top exterior
power and gluing over local trivialisations are part of the target ([Chenevier] §1.5, p. 9;
PadicMeasuresIwasawaAlgebras §5.1). *Checks:* on `A²` with a basis the value is `ad − bc`, not
`ad + bc`.

**Azumaya reduced-norm determinant.** For an Azumaya algebra `R` of constant rank `d²`, `d > 0`, the
reduced norm is the unique degree-`d` determinant that becomes `det` under every faithfully flat
matrix splitting; it is built after an étale faithfully flat splitting (SchemeAndStackFoundations
§2.22 `IsAzumaya.exists_etale_matrix_splitting`) and descended, and every degree-`d` determinant on
`R` equals it ([Chenevier] Example 1.7(ii), p. 10, Example 2.5, p. 24; [Grothendieck] Théorème 5.1,
pp. 208–211). *Checks:* `ad − bc` on `M₂(A)`; the identity for `R = A`; `a² + b² + c² + d²` on the
Hamilton quaternions, computed after splitting over `ℂ` (there is no `ℝ`-splitting).

### IHG.0.7 Connected reductive invariant evaluations

**Invariant coordinate algebras under conjugation.** For a commutative Hopf `O`-algebra `C`
(`CommHopfAlgCat O`), `C_n` is the subalgebra of the left-associated tensor power `O ⊗ C ⊗ ⋯ ⊗ C` of
functions unchanged by simultaneous conjugation of `n`-tuples of points over every commutative
`O`-algebra (scheme invariants, also at nonreduced points), with evaluation at point tuples,
reindexing pullbacks and the pullback multiplying the last two coordinates ([Quast] Definition 3.1,
pp. 10–11; [DKSW] Definition 4.1, p. 22). *Checks:* for `GL₁` every coordinate is invariant; for
`GL₂` over nonzero `O`, trace and determinant are invariant but the upper-left coordinate is not;
reindexing is precomposition (the three-cycle sends `(2,3,5)` to `(3,5,2)`).

**Rational cohomology of a flat affine group scheme.** For flat commutative Hopf `H` and an
`H`-comodule `M`, the Hochschild complex `M ⊗ H^{⊗n}` (cofaces: coaction, coproducts, unit) computes
derived scheme invariants; `H⁰` is `ker(ρ − (m ↦ m ⊗ 1))`, the regular comodule is acyclic, the
theory is functorial with long exact sequences, and a cochain product `Hⁱ(M) × H⁰(N) → Hⁱ(M ⊗ N)`
commutes with connecting maps when the invariant factor is flat ([Jantzen] I.4.2, I.4.14–4.16, pp.
50, 55–56). *Checks:* `d⁰(m) = ρ(m) − m ⊗ 1`; for the trivial group over `ℤ` the module `ℤ` is
acyclic but not injective.

**Algebraic induction.** For flat Hopf algebras and a bialgebra map `f : H → K`, induction of a
`K`-comodule `M` is the cotensor equalizer in `M ⊗ H`; it satisfies Frobenius reciprocity against
restriction, with the convention `F(hg) = hF(g)` ([Jantzen] I.3.3–3.7, pp. 37–41). *Checks:*
induction along the identity is `M`; reciprocity evaluates through the counit.

**Compatible invariant-coordinate evaluation.** For `C_n = O[Hⁿ]^H` and the points `H(A)`, a
compatible evaluation is a family of algebra maps `E_n : C_n → Map(H(A)ⁿ, A)` respecting reindexing
and the multiplication of the last two coordinates; evaluation at actual scheme points is one. Over
an algebraically closed field, regular `GL_d` evaluations are polynomial in entries and inverse
determinants ([Quast] Definition 3.1, pp. 11–12; [BHKT] Definition 4.1, Lemma 4.3, pp. 13–14).
*Checks:* products are ordered: for `f(x, y) = tr(xy)` with `x = diag(2,1)`, `g = [[1,1],[0,1]]`,
`h = [[1,0],[1,1]]`, `f(x, gh) = 5` and `f(x, hg) = 4`.

**Connected reductive pseudocharacter.** An `H`-pseudocharacter of `Γ` with values in `A` is a
family of algebra maps `Θ_m : O[H^m]^H → Map(Γ^m, A)` compatible with reindexing and with
multiplying the last two coordinates; `ρ : Γ → H(A)` with a compatible evaluation gives
`Θ_{ρ,n}(f)(γ) = E_n(f)(ρ ∘ γ)`; coefficient maps postcompose and group maps precompose ([Quast]
Definition 3.1, pp. 10–11). *Checks:* for `G_m` it is a character; over algebraically closed `k`,
the upper unipotent representation of `ℤ` and the trivial rank-two representation have the same
`GL₂`-pseudocharacter.

**Continuous reductive pseudocharacter.** `Θ` is continuous if every `Θ_m(f)` is; continuous `ρ`
with continuous evaluations gives continuous `Θ_ρ`, and continuous pseudocharacters with Hausdorff
values agreeing on a dense subgroup are equal ([Quast] Definition 3.1, Lemma 3.2, pp. 11–12).

**Kernel of a reductive pseudocharacter.** `ker Θ`, the `δ` with `Θ_m(f)(γ₁, …, γ_m δ) = Θ_m(f)(γ)`
for all data, is a normal subgroup containing `ker ρ` for `Θ_ρ`, and `Θ` descends uniquely to `Γ/Δ`
for normal `Δ ⊆ ker Θ` ([Quast] Definition 3.10, Lemmas 3.11–3.12, p. 16). *Checks:* in
characteristic zero the upper unipotent representation of `ℤ` is faithful but its pseudocharacter
kernel is `ℤ`.

**Determinants and GLn excursion pseudocharacters.** For every `A`, `Γ` and `d ≥ 1`, determinants on
`A[Γ]` are naturally the `GL_d`-pseudocharacters, for the actual Hopf algebra
`TauCeti.GeneralLinear.coordinateHopfAlgebra A d`, normalised by the coefficients of the generic
characteristic polynomial; no factorial is inverted ([Emerson–Morel] Theorem 4.1, pp. 13–15).
*Checks:* in dimension two the trace and determinant give `X² − tX + d`, also in characteristic two.

**Untwisted excursion comparison.** For the trivial action, `F_n`-cocycles are homomorphisms, so the
coordinate ring of SR.6.3's cocycle scheme is the `n`-fold tensor power of `C` and its gauge
invariants are `C_n`, with evaluation at a cocycle equal to tensor evaluation at its free-basis
values; the trivial-action excursion algebra of SR.6.3 is the ring `B_H^Γ` of IHG.1.7, the excursion
of `(n, γ, f)` going to `θ_n(f)(γ)`. No twisted Weil action is asserted ([Quast] §3.6–3.7,
Proposition 3.19, Theorem 3.20, pp. 19–20; SmoothRepresentationsOfLocalGroups SR.6.3). *Checks:* the empty excursion
is `1`; the excursion of a product word in a pair is the singleton evaluation at `gh`.

### Examples

`M_d(A)` with `det` (faithful, Cayley–Hamilton); triangular matrices (not faithful); `Γ_ℤ(ℤ)`
(graded versus internal products); trace-blind `𝔽_p` determinants; quaternions; `G_m`, `GL₂`.

### Dependencies

Mathlib's polynomial laws, divided powers, matrices, group algebras, exterior powers and Azumaya
algebras; Tau Ceti comodules, Hopf points and `GL_n`; ReductiveGroups layer 9;
PadicMeasuresIwasawaAlgebras §5.1; SchemeAndStackFoundations §2.22; SR.6.3.

## Layer IHG.3a: Hecke polynomial and multiplier conventions

Coefficient comparisons between Hecke operators and Frobenius polynomials over any commutative ring;
Satake and the spin polynomial come from SR.4, the Artin normalisation from ClassFieldTheory layer 7.

### IHG.3a.1 GL_n Hecke polynomials and Frobenius conventions

**Integral GLn Hecke polynomial.** For `q, T₀, …, T_n ∈ A`,
`P(X) = Σ_{i=0}^n (−1)^i q^{i(i−1)/2} T_i X^{n−i}`, with `T_i` the double coset of
`diag(π, …, π, 1, …, 1)` (`i` entries `π`) for `vol(K) = 1`. Its coefficient of `X^{n−i}` is
`(−1)^i q^{i(i−1)/2} T_i`; it is monic if `T₀ = 1` (also over the zero ring), of degree `n` if
`A ≠ 0`, and compatible with every ring map, with no square root of `q` ([ACC] §2.2.5, equation
(2.2.6), p. 922). *Checks:* `n = 1` gives `X − T₁` (no power of `q`); `n = 2`, `q = 2`,
`T = (1,3,5)` gives `X² − 3X + 10`; `T₀ = 0` in rank zero is not monic.
*Lean:* `Spherical.glnPolynomial`.

**Normalized Satake coefficients for GLn.** With `q = s²` and `T_i = s^{i(n−i)} e_i(z₁, …, z_n)`,
`P(X) = ∏_j (X − s^{n−1} z_j)`, because `i(i−1) + i(n−i) = i(n−1)`; this holds for all `s, z` in any
commutative ring ([ACC] §2.2.5, equation (2.2.6), pp. 921–922). *Checks:* `s = 2`, `z = (3,5)` gives
`(X − 6)(X − 10)`, with determinant `60`, not `−60`.
*Lean:* `Spherical.glnPolynomial_satake`.

**Determinant coefficient of the GLn parameter.** If a degree-`n` determinant has `χ_D(r) = P` at an
element `r`, then `D(r) = q^{n(n−1)/2} T_n`, including `n = 0`; at a Frobenius element with Satake
parameters this is `s^{n(n−1)} ∏ z_j` ([ACC] §2.2.5, equation (2.2.6), p. 922).
*Lean:* `Determinant.eval_eq_of_charpoly_eq_glnPolynomial`.

**Characteristic polynomial under a character twist.** The coefficient of `X^{d−i}` of `χ_D(a·r)` is
`aⁱ` times that of `χ_D(r)`; applied to `r = g`, `a = θ(g)` and restriction along `h ↦ θ(h)h`, a
twist by `θ` multiplies `Λ_i(g)` by `θ(g)ⁱ` and the determinant character by `θ^n` ([ACC]
§2.2.20–24, pp. 932–934). *Checks:* roots `2, 3` twisted by `5` give `X² − 25X + 150`.
*Lean:* `Determinant.charpoly_smul_coeff`.

**Normalized reciprocal characteristic polynomial.** For a determinant on `A[G]` and `g ∈ G`, with
`P_g = Σ a_i X^{n−i}`, the polynomial at `g⁻¹` is `a_n⁻¹ Σ a_i X^i = X^n P_g(X⁻¹)/P_g(0)`, the monic
polynomial of inverse roots; equivalently after multiplying by the unit `a_n` ([ACC] §2.2.20, p.
932). *Checks:* roots `2, 3` give `X² − (5/6)X + 1/6`; the raw reversal is not monic.
*Lean:* `Determinant.reciprocal_charpoly`.

**Arithmetic and geometric Frobenius conversion.** With `F^geom = (F^ar)⁻¹`, the polynomial at one is
the normalised reciprocal of the polynomial at the other, and `ε(F^ar) = q`, `ε(F^geom) = q⁻¹`;
importing [ACC]'s geometric polynomials needs this conversion ([ACC] Notation §1.2, pp. 905–906,
and §2.2.20).

**Inversion of spherical double cosets.** For `q, T_n` units and `T₀ = 1`, substituting
`T_i ↦ T_{n−i}/T_n` gives `q^{n(n−1)} P^rec(q^{1−n}X)`: coefficientwise, the coefficient of
`X^{n−i}` times `P(0)` is `q^{i(n−1)}` times the coefficient of `X^i`; for geometric Frobenius the
corresponding determinant is `D∨ ⊗ ε^{1−n}`. Constructing the double-coset involution is outside the
target ([ACC] §2.2.20, p. 932). *Checks:* `q = 2`, `T = (1,5,3)` gives
`X² − (5/3)X + 2/3 = (2/3) reflect₂(P)(X/2)`.

**Rank-one normalization by reciprocity.** For `GL₁`, `P = X − T₁`; an unramified character with
`θ(F^ar) = u` has arithmetic polynomial `X − u` and geometric polynomial `X − u⁻¹`, so the opposite
Artin convention inverts the character ([ACC] §2.2.5, pp. 921–922).

**Rank-two classical modular-form normalization.** For a normalised eigenform of weight `k ≥ 2` and
nebentype `ω` at `ℓ ∤ Np`, `X² − T₁X + ℓT₂` with `T₁ = a_ℓ`, `T₂ = ω(ℓ)ℓ^{k−2}` is
`X² − a_ℓX + ω(ℓ)ℓ^{k−1}`, matching Tau Ceti `HeckeRing.GL2.Newform.satakeParameters` and
ModularForms layer 9; geometric Frobenius takes its reciprocal ([ACC] §2.2.5, (2.2.6), pp. 921–922).
*Checks:* `k = 4`, `q = 2`, `a = 3`, `ω = 1` gives `X² − 3X + 8`; truncated subtraction at weight
one would give the wrong constant.

### IHG.3a.2 Spin, dual-spin and full multiplier

**GSp4 dual-spin Hecke polynomial.** The monic spin polynomial
`Q(X) = X⁴ − T₁X³ + (qT₂ + (q³+q)T₀)X² − q³T₀T₁X + q⁶T₀²` is the reflection of SR.4's
`SpinPolynomial` with `T₁, T₂` exchanged (`T₀, T₁, T₂` the double cosets of `diag(ϖ,ϖ,ϖ,ϖ)`,
`diag(ϖ,ϖ,1,1)`, `diag(ϖ²,ϖ,ϖ,1)`). For a unit `T₀` the scaled dual
`P(X) = X⁴ − T₀⁻¹T₁X³ + T₀⁻²(qT₂ + (q³+q)T₀)X² − q³T₀⁻²T₁X + q⁶T₀⁻²` satisfies, for `q` a unit,
`P(X)Q(0) = X⁴Q(q³/X)` and `P(0) = q⁶T₀⁻²`: its roots are `q³` over the spin roots ([BCGP] equation
(1.8.27), Lemma 1.8.28, p. 17). *Checks:* `(q, T₀, T₁, T₂) = (2, 1, 3, 5)` gives
`Q = X⁴ − 3X³ + 20X² − 24X + 64`, detecting the exchanged indices; at `q = T₀ = 2` the dual is
`X⁴ − (3/2)X³ + (15/2)X² − 6X + 16`, and the constants `Q(0) = 256`, `P(0) = 16` distinguish scaled
duality from the plain reciprocal.
*Lean:* `Spherical.gsp4SpinPolynomial`, `Spherical.gsp4DualSpinPolynomial`,
`Spherical.gsp4DualSpinPolynomial_reciprocal`.

**Geometric-Frobenius dual-spin conversion.** If a degree-four determinant on `A[G]` has polynomial
`Q` at `g`, with `q, T₀` units, then `D∨ ⊗ ε⁻³` has polynomial `P` at `g`, that is `D` has
polynomial `P` at `q³ g⁻¹`; for [BCGP]'s geometric Frobenius this converts `ρ` to `ρ∨ ⊗ ε⁻³`, and
arithmetic values need the reciprocals ([BCGP] Lemma 1.8.28, p. 17).
*Lean:* `Determinant.charpoly_dualSpin`.

**Full similitude character under duality and twist.** If `rᵀJr = μJ` for invertible `r, J`, then
`θr⁻ᵀ` preserves `J⁻¹` up to `μ⁻¹θ²`, in every size; so `ρ∨ ⊗ θ` has multiplier `μ⁻¹θ²`, and the
cohomological dual-spin representation has `μ⁻¹ε⁻⁶`. The determinant `μ²` does not determine `μ`
([BCGP] §1.8.7–8 and Lemma 1.8.28, pp. 9–10, 16–17). *Checks:* `diag(2,3)` on the symplectic plane
has multiplier `6`, its dual twisted by `5` has `25/6`; in `ℤ/4`, `1 ≠ −1` with equal squares.
*Lean:* `similitude_dual_twist`.

### Examples

The two-root computations over `ℚ` fix the reciprocal, twist and dual-spin conventions; the
`GSp₄` values at `q = T₀ = 2` separate scaled and plain duality.

### Dependencies

IHG.0 (characteristic polynomials, restriction, contragredient); SR.4; ClassFieldTheory layer 7;
ReductiveGroups layer 9 for `GSp₄`; Tau Ceti `HeckeRing.GL2.Newform.satakeParameters`.

## Layer IHG.1: Cayley–Hamilton algebras and reconstruction

The Cayley–Hamilton quotient over fields and henselian rings, generalized matrix algebras,
reducibility ideals, coefficient descent, local compressions and `GL` reconstruction.

### IHG.1.1 The Cayley–Hamilton ideal and Cayley–Hamilton algebras

**The Cayley–Hamilton ideal.** `CH(D)` is the two-sided ideal generated by all `χ_α(r₁, …, r_n)`; it
contains each such coefficient and lies in `Ker(D)` ([Chenevier] §1.17, p. 17). *Checks:* `CH = 0`
for `det` on `M_d(A)` and on triangular matrices; in degree one `CH` is generated by the `r − D(r)`
(the identity character of `ℤ` has `CH = 0`, whereas omitting the constant term would give `(1)`).

**Cayley–Hamilton algebras.** `D` is Cayley–Hamilton if `CH(D) = 0`, equivalently the law `χ`
vanishes ([Chenevier] §1.17, p. 17). *Checks:* triangular matrices are Cayley–Hamilton but not
faithful.

**Cayley–Hamilton is stable under base change.** If `D` is Cayley–Hamilton, so is `D ⊗ S`
([Chenevier] §1.17, p. 17). **Cayley–Hamilton restricts to subalgebras.** For injective
`φ : R′ → R`, `D ∘ φ` is Cayley–Hamilton when `D` is ([Chenevier] Example 1.20(ii), p. 18). **The
kernel contains the Cayley–Hamilton ideal.** `CH(D) ⊆ Ker(D)` for every `A` ([Chenevier] Lemma 1.21,
p. 18).

**Faithful determinants are Cayley–Hamilton.** In particular `R/Ker(D)` is Cayley–Hamilton
([Chenevier] Lemma 1.21, p. 18).

### IHG.1.2 Field structure and semisimple reconstruction

**Determinants on product algebras.** Over nonzero `A` with connected spectrum, a determinant on
`R₁ × R₂` is uniquely `D₁D₂` with `d₁ + d₂ = d`; otherwise the dimensions are locally constant on
`Spec A` ([Chenevier] Lemma 2.2(iii), pp. 23–24).

**Corner determinant.** For nonzero connected `A` and `e² = e`, `D_e(x) = D(x + 1 − e)` on the
corner `eRe` (unit `e`), after every scalar extension, is a determinant of degree `r(e)` read from
`D(1 − e + te) = t^{r(e)}`; `r(e) + r(1 − e) = d` and `D` restricts to `D_e D_{1−e}` on the diagonal
corners ([Chenevier] Lemma 2.4(1–2), p. 25). *Checks:* `e = diag(1,1,0)` in `M₃(A)` gives the
`2 × 2` determinant; `e = 0` gives degree zero; over `𝔽₂` a rank-two projection has trace `0` but
corner degree two.

**Cayley–Hamilton corner restriction.** `D_e` is Cayley–Hamilton (faithful) when `D` is, and corners
commute with scalar extension ([Chenevier] Lemma 2.4(3), p. 25). **Bound on orthogonal nonzero
corners.** For Cayley–Hamilton `D` over nonzero connected `A`, nonzero idempotents have `r(e) > 0`,
an orthogonal family of them has at most `d` members, and its ranks sum to `d` iff it sums to `1`
([Chenevier] Lemma 2.4(4), pp. 25–26).

**Cayley–Hamilton unit criterion.** For Cayley–Hamilton `D`, `x` is a unit iff `D(x)` is
([Chenevier] proof of Lemma 2.7(i), p. 27). **Nilpotent ideals vanish under field determinants.**
Over a field, a nilpotent two-sided ideal lies in `Ker(D)`, with no Cayley–Hamilton hypothesis
([Chenevier] Lemma 2.7(v), p. 27).

**Separable algebraic base change of the determinant kernel.** For `K/k` separable algebraic,
`Ker(D_K) = K ⊗ Ker(D)`, by Galois descent through finite subextensions; purely inseparable
extensions are excluded ([Chenevier] Lemma 2.8(i), Example 2.9, pp. 27–28). **Field Cayley–Hamilton
radical and kernel.** For Cayley–Hamilton `D` over a field, `Ker(D) = Rad(R)` and every element of
it satisfies `x^d = 0` (a nil ideal, without a uniform power bound in small characteristic)
([Chenevier] Lemma 2.8(ii), pp. 27–28).

**Bounded algebraicity bounds simple-module dimension.** If every element of a `k`-algebra has
algebraic degree `< n`, every simple module `V` with division endomorphism ring `E` has
`dim_E V < n` and `R → End_E(V)` is onto ([Chenevier] proof of Lemma 2.14, pp. 29–30). **Finiteness
of simple factors.** Zero radical, a uniform algebraicity bound and a bound on orthogonal
idempotents give finitely many simple modules and `R ≅ ∏ End_E(V)` ([Chenevier] proof of Lemma 2.14,
p. 30).

**Centers of bounded algebraic semisimple factors.** The division factors are finite over their
centres, whose extensions of `k` have finite separable part and inseparable exponent bounded by the
largest `p`-power below `n`; finiteness over `k` follows if `k` is perfect, `[k : k^p] < ∞` or
`p > n` ([Chenevier] Lemma 2.14, pp. 29–30). **Determinants on split simple factors.** Over
algebraically closed `k`, a faithful `d`-dimensional determinant identifies `R` with `∏ M_{n_i}(k)`
and is `∏ det_i^{m_i}`, `m_i > 0`, `Σ n_i m_i = d` ([Chenevier] proof of Theorem 2.12, pp. 30–31).

**Semisimple reconstruction of field determinants.** Over algebraically closed `k`, every
`d`-dimensional determinant, `d ≥ 1`, is `det ∘ ρ` for a semisimple `ρ : R → M_d(k)` with
`ker ρ = Ker(D)`, unique up to conjugation; no factorial is inverted ([Chenevier] Theorem 2.12, pp.
28–31). *Checks:* the zero-dimensional representation is not irreducible (it is semisimple); the
natural action of `M_n(k)`, `n > 0`, is irreducible; the upper unipotent action is not semisimple.
*Lean:* `matrixModule`, `Determinant.exists_semisimple_ofMatrix_eq`.

**Faithful quotients over arbitrary fields.** For any field and `d > 0`, `R/Ker(D)` is a nonempty
finite product of matrix algebras of positive size over division rings finite over their centres,
with `D` a product of reduced norms and inseparable norm laws; it is finite over `k` under the three
conditions above and need not be in general ([Chenevier] Theorem 2.16, pp. 31–32).

**Residual determinant properties.** For local `A` with residue field `k`, `D̄ = D ⊗ k`. It is split
if `(k ⊗ R)/Ker(D̄)` is a finite product of matrix algebras over `k` (a realising `k`-representation
is weaker); absolutely irreducible if `d > 0` and its reconstructed representation over every
algebraically closed extension is irreducible; multiplicity-free if the constituents there are
pairwise distinct ([Chenevier] Definition-Proposition 2.18, Definition 2.19, pp. 32–33). *Checks:* a
character is split and absolutely irreducible; `χ²` is split but not multiplicity-free, also when
`2χ = 0`; `χψ` for distinct `χ, ψ` is multiplicity-free and reducible; the quaternion norm over `ℝ`
is absolutely irreducible but not split; the norm `ℂ → ℝ` is realised by the regular representation
but not split; two copies of the trivial character are not absolutely irreducible.
*Lean:* `IsAbsolutelyIrreducible` (for a realising matrix family).

### IHG.1.3 Henselian lifting and generalized matrix algebras

**Radical of a local Cayley–Hamilton algebra.** For Cayley–Hamilton `D` over local `A`, `Rad(R)` is
the preimage of `Ker(D̄)` ([Chenevier] Lemma 2.10(i), p. 28). **Henselian lifting of matrix units.**
For henselian local `A` and `R` integral over `A` with `R/Rad(R) ≅ ∏ M_{d_i}(k)`, a complete
orthogonal system of idempotents and matrix units lifts to `R` with its relations; `R` need not be
module-finite ([Chenevier] proof of Theorem 2.22, p. 34).

**Rank-one Cayley–Hamilton algebras.** A degree-one Cayley–Hamilton `D` makes `A → R` an isomorphism
with inverse `D` ([Chenevier] Lemma 2.6, p. 26). **Reconstruction from rank-one corners.** A
complete `d × d` matrix-unit system with `E_ii R E_ii = A E_ii` (faithful) gives `M_d(A) ≅ R`,
`(a_ij) ↦ Σ a_ij E_ij` ([Chenevier] proof of Theorem 2.22(i), p. 34).

**Henselian irreducible reconstruction.** For Cayley–Hamilton `D` of dimension `d > 0` over henselian
local `A` with `D̄` split and absolutely irreducible, `R ≅ M_d(A)` and `D` is the matrix determinant.
For `R = A[G]/CH(D)`: a determinant on `A[G]` whose reduction is `det ρ̄` for an absolutely
irreducible `ρ̄` over the residue field is `det ρ` for a representation `ρ : A[G] → M_d(A)`, unique
up to conjugation. Without splitness a central simple obstruction remains ([Chenevier]
Theorem 2.22(i), p. 34).
*Lean:* `Determinant.exists_ofMatrix_eq_of_henselian`.

**Generalized matrix algebra.** A GMA of block sizes `(d_i)` is an algebra with orthogonal
idempotents `e_i` summing to `1`, identifications `e_i R e_i ≅ M_{d_i}(A)` and a cyclic trace equal
to the matrix trace on diagonal blocks; the entry modules `A_ij` (corners of primitive idempotents,
via `TauCeti.cornerSubmodule`) give `R ≅ ⊕ e_i R e_j` with associative pairings `A_ij ⊗ A_jk → A_ik`
([Bellaïche–Chenevier] Definition 1.3.1, Lemma 1.3.2, pp. 20–21). *Checks:* `M_d(A)` has every
`A_ij = A`; triangular matrices have `A₂₁ = 0`; `[[A, J],[A, A]]` with a nonprincipal ideal `J` has
a non-free entry module.

**Adapted GMA representation ring.** Representations standard on the diagonal blocks are represented
by `Sym_A(⊕_{i≠j} A_ij)` modulo `xy − φ_ijk(x, y)`, and the universal map `R → M_d(B_ad)` has an
`A`-linear retraction, so it is universally injective ([Wang–Erickson] §2.3, pp. 15–16;
[Bellaïche–Chenevier] Propositions 1.3.9, 1.3.13). *Checks:* one block gives `A`; `M₂(A)` gives
`A[b, c]/(bc − 1)`; triangular matrices give `A[b]`.

**Canonical GMA determinant.** A GMA carries a Cayley–Hamilton determinant `D_E`, the signed cycle
product of the corner pairings, with the given trace and realised by every adapted representation
after scalar extension; no factorial is inverted ([Wang–Erickson] Proposition 2.23 and proof, pp.
16–17). *Checks:* `ad − φ(b, c)` for scalar `2 × 2` blocks; over `𝔽₂`, `D_E = χ²` while `Tr = 0`.

**Ordered residual GMA constituents.** For henselian local `A`, the residual data are
representations `ρ̄_i : k ⊗ S → M_{n_i}(k)` with absolutely irreducible pairwise non-isomorphic
modules, `ρ̄_i(e_j) = δ_ij`, compatible with the diagonal identifications, whose determinants
multiply to the residual GMA determinant as laws; reduction from `A/J`, `J ⊆ m`, goes through
`k ⊗_{A/J} (A/J ⊗ S) ≅ k ⊗ S` ([Allen–Newton–Thorne] Theorem 2.4, Proposition 2.5, pp. 5–6;
[Bellaïche–Chenevier] §1.4.1, Lemma 1.4.3, pp. 29–30). *Checks:* on the triangular algebra the
ordered characters evaluate at `a` and `c`; two isomorphic labelled constituents are rejected.

**Multiplicity-free henselian GMA structure.** For Cayley–Hamilton `D` over henselian local `A` with
split multiplicity-free `D̄`, the algebra and trace admit GMA data with the residual block sizes;
entry modules need not be free ([Chenevier] Theorem 2.22(ii), p. 34).

### IHG.1.4 Reducibility ideals and quotient extensions

**Partition reducibility for determinants.** For henselian local `A`, split multiplicity-free
`D̄ = ∏ det ρ̄_i` and a partition `P` of the constituents, there is an ideal `I_P` with `I_P ⊆ J`
(`J ⊆ m`) iff a unique family of factors `F_m` of the right degrees has `D mod J = ∏ F_m` as laws and
the prescribed residual products; for any quotient `R → S` with `CH(D) ⊆ ker ⊆ Ker(D)` and adapted
data, `I_P` is the sum of the opposite pairing ideals between parts. With `d!` invertible this is
the trace statement of [Bellaïche–Chenevier] ([Bellaïche–Chenevier] Proposition 1.5.1, pp. 32–34;
[Allen–Newton–Thorne] Proposition 2.5 and proof, pp. 5–6).

**Two-block determinant reducibility ideal.** For a two-block Cayley–Hamilton GMA with distinct
residual characters, `I_red = A_ij A_ji` satisfies `I_red ⊆ J` iff `D_E mod J = F_i F_j` for a
unique ordered pair of determinants lifting the residual factors, and is compatible with quotients
`A → A/J`; no factorial is inverted ([Caraiani–Newton] Proposition 3.2.3, p. 49;
[Allen–Newton–Thorne] Proposition 2.5, pp. 5–6). *Checks:* triangular algebras give `0`;
`[[A, A],[π^r A, A]]` over a DVR gives `(π^r)`; `M₂(A)` gives the unit ideal (a factorisation over
the zero ring is not a witness).

**GMA quotient constituent module.** For a singleton part `{i}` and `I_P ⊆ J`, compression
`x ↦ e_i x e_i` reduced modulo `J` is a representation of `(A/J) ⊗ S` on `(A/J)^{n_i}`; this module,
restricted along a chosen quotient `R → S`, is the Ext endpoint ([Bellaïche–Chenevier] §1.5.4,
Theorems 1.5.5–1.5.6, pp. 34–37). *Checks:* on the triangular algebra over a field `Ext¹` of the
second constituent by the first is one-dimensional, and zero in the other order.

**GMA extension module.** `E_ij = A_ij / Σ_{k≠i,j} A_ik A_kj`; the multiplication defect of the `ij`
block vanishes in it and `E₁₂ = A₁₂` for two blocks ([Bellaïche–Chenevier] §1.5.3, p. 35). *Checks:*
for `M₃(A)`, `E₁₃ = 0`.

**GMA extension identification.** With `d!` invertible, `Hom_A(E_ij, A/J) ≅ Ext¹_{S_J}(M_j, M_i)` for
the specified quotient constituents (existence of a linear equivalence) ([Bellaïche–Chenevier]
Theorem 1.5.6(1), pp. 36–37).

**Off-diagonal extension injection.** For henselian local `A` with `d!` invertible, a split
residually multiplicity-free `D`, a surjection `q : R → S` with `CH(D) ⊆ ker q ⊆ Ker(D)`, GMA data
with `D_E ∘ q = D`, and singleton parts `{i}, {j}` with `I_P ⊆ J ⊆ m`, there is an injection
`Hom_A(E_ij, A/J) → Ext¹_{R_J}(q* M_j, q* M_i)` whose image is the restriction of
`Ext¹_{S_J}(M_j, M_i)` ([Bellaïche–Chenevier] Theorem 1.5.5 and proof, pp. 35–36). *Checks:*
`U₅ diag(2,3) U₋₅ = [[2,5],[0,3]]` fixes the coboundary sign `t(ψ − χ)`.

**Extension dimensions bound reducibility generators.** For reduced noetherian henselian `A`, a
split residually two-block multiplicity-free trace with `d!` invertible, `I_red` needs at most
`dim Ext¹(ρ̄₁, ρ̄₂) · dim Ext¹(ρ̄₂, ρ̄₁)` generators ([Bellaïche–Chenevier] Proposition 1.7.1, p. 42).

**Classical Ribet lattice.** For a complete DVR `A` whose fraction field `K` is complete, locally
compact and nonarchimedean with unit ball `A`, a compact group `G` and continuous irreducible
`ρ : G → GL₂(K)` with integral characteristic polynomials reducing to `(X − χ̄)(X − ψ̄)` for distinct
`χ̄, ψ̄`, there is a `G`-stable free full lattice with an integral basis in which the reduction is
upper triangular with diagonal `(χ̄, ψ̄)` and an upper entry that is not a coboundary: a nonsplit
extension of `ψ̄` by `χ̄` ([Ribet] Proposition 2.1 and proof, pp. 154–155).

### IHG.1.5 Universal algebras and coefficient descent

**Universal Cayley–Hamilton algebra.** For a group `G`, `R(G, d) = (Z(G,d) ⊗ ℤ[G])/CH(D_univ)` with
its quotient map; a coefficient map `φ : Z(G,d) → B` gives `D_φ`, Cayley–Hamilton algebras with a
compatible determinant receive a unique lift, `B ⊗ R(G,d) ≅ B[G]/CH(D_φ)`, and for henselian local
`B` with `D_φ` residually split absolutely irreducible this is `M_d(B)` ([Chenevier] §1.22,
Proposition 1.23, pp. 18–19). *Checks:* `R(G, 1)` is the universal character ring; `R({1}, d) = ℤ`
for `d ≥ 1`; degree zero gives the zero ring.

**Absolutely irreducible coefficient descent.** For complete noetherian local `A ⊆ B` with
`m_B ∩ A = m_A` and the same residue field, a continuous `ρ : G → GL_d(B)` of a profinite group with
absolutely irreducible reduction and all traces in `A` is conjugate by `1 + M_d(m_B)` into
`GL_d(A)` ([CHT] Lemma 2.1.10 and proof, pp. 13–15).
*Lean:* `coefficient_descent`.

**Symplectic coefficient descent with prescribed multiplier.** In the same setting with residue
characteristic `p > 2`, `d = 4`, a nondegenerate alternating form `J` over `A` and a continuous
multiplier `ν : G → Aˣ` with `ρᵀJρ = νJ` over `B`, the descended representation can be chosen with
the same form and multiplier, conjugated by `P ≡ 1 mod m_B` in `GSp(J, B)` ([Gee–Geraghty]
Lemma 7.1.1 and proof, p. 25).
*Lean:* `symplectic_coefficient_descent`.

### IHG.1.6 Compatible local compression

**Cayley–Hamilton recognition of isotypic modules.** For henselian local `A` and `ρ : G → GL_d(A)`
residually split absolutely irreducible, an `A[G]`-module killed by `CH(det ρ)` is `A^d ⊗ N` with
`G` acting through `ρ` ([Chenevier] Theorem 2.22(i) and proof, pp. 34–35). **Residual projector from
a local subgroup.** For two inequivalent absolutely irreducible residual representations whose
restrictions to `H` have disjoint constituents, the projector `(1, 0)` of their product image lies
in the image of `k[H]` ([Caraiani–Newton] Lemma 3.2.2(1–2), pp. 48–49).

**Integral lift of the local projector.** With `Ã` finite flat over a complete DVR, `Ã[1/p]` a product
of fields and integral coefficients, the residual projector lifts to an idempotent of the integral
local image algebra, projecting on the chosen local subrepresentations when their constituents are
exactly the selected block ([Caraiani–Newton] Lemma 3.2.2(3–4), pp. 48–49).

**Global compression modulo reducibility.** For a two-block GMA and `J ⊇ I_red`, `x ↦ exe` mod `J`
is an algebra map realising the factor lifting the selected constituent ([Caraiani–Newton]
Proposition 3.2.4(1), p. 50). **Integral compression on a stable local summand.** `x ↦ ẽxẽ` from
`Ã[H]` is an algebra map when `im(ẽ)` is `H`-stable in every generic factor, and is the chosen local
subrepresentation after inverting `p` ([Caraiani–Newton] Proposition 3.2.4(2), p. 50).

**Inner conjugacy of local matrix algebras.** Every `A`-algebra automorphism of `M_d(A)`, `A` local,
`d > 0`, is conjugation by an invertible matrix (Tau Ceti's `exists_unit_conj_of_algEquiv` is the
field case) ([Allen–Newton–Thorne] proof of Theorem 2.4, p. 5; [Caraiani–Newton] proof of
Proposition 3.2.4(3), p. 50).

**Local lifts compatible with global quotient reconstruction.** For `B → A` surjective, `B` local,
`A` henselian, a two-block GMA of sizes `(d, d)` over `B` with a group map `r`, global
representations with equal determinants (one residually absolutely irreducible), a local
representation equal to the selected corner of `r` on `H`, and bases over finitely many fields
`K_i` over `B`, there is a `B`-valued representation of `H` reducing to `ρ|_H`, conjugate to the
local one, and conjugate to the selected representation over every `K_i` ([Caraiani–Newton]
Proposition 3.2.4(3) and proof, p. 50).

### IHG.1.7 GL reconstruction and representing rings

**GL pseudocharacter reconstruction.** Over algebraically closed `k`, every
`TauCeti.GeneralLinear.coordinateHopfAlgebra k d`-pseudocharacter of `Γ`, `d > 0`, is realised by
a semisimple representation, unique up to conjugacy, with determinant and coefficients given by the
`GL_d` comparison ([Emerson–Morel] Theorem 4.1, pp. 13–15; [Chenevier] Theorem 2.12).

**Universal reductive pseudocharacter ring.** **Universal compatible evaluations.** `B_H^Γ`, the
colimit of `O[H^m]^H` over free-group maps `F_m → Γ` (SR.6.3's word colimit, by the untwisted
comparison), represents `H`-pseudocharacters, `Hom_O(B_H^Γ, A) ≅ PC_H^Γ(A)` naturally in `A`, and is
generated by the values of its universal pseudocharacter (no reductivity used); its completion at an
ideal is Mathlib's `AdicCompletion`, with no deformation or noetherianity claim ([Quast]
Theorem 3.20, p. 20). *Checks:* trivial `H` gives `O`; `GL₁` and `Γ = ℤ` give `O[t, t⁻¹]`.

**Generic Cayley–Hamilton representation algebra.** For a Cayley–Hamilton `A`-algebra `(E, D)`
finite over `A`, there is a finite-type `A_gen` with a universal determinant-preserving
`E → M_d(A_gen)`: maps `A_gen → B` are the `f : E → M_d(B)` with `det ∘ f = D_B`; `A_gen` need not
be module-finite ([BIP] Lemma 3.1 and proof, pp. 10–11). *Checks:* `E = A`, `d = 1` gives `A`;
`E = A × A`, `D(a, b) = ab` gives a positive-dimensional ring.

### Examples

Triangular matrices; the corner `diag(1,1,0)`; quaternions and `ℂ/ℝ`; `[[A, J],[A, A]]`,
`B_ad = A[b, c]/(bc − 1)`, `[[A, A],[π^r A, A]]`; `R(G, 1)` and `B_{GL₁}^ℤ = O[t, t⁻¹]`.

### Dependencies

IHG.0 throughout; IHG.3a for the multiplier in symplectic descent; SemisimpleAlgebras layers 0, 2–5;
ReductiveGroupsPartII RG2.2–RG2.3 for integral models; Mathlib `IsSimpleModule`,
`IsSemisimpleModule`, `HenselianLocalRing`, `IsAdicComplete`.

## Layer IHG.2: integral and derived Hecke actions

Over a commutative ring `A`, with the standard module derived category; an action keeps its map
`α : H →ₐ[A] End(C)`, `H` commutative, and `T_der = α.range`. Endomorphism multiplication is
composition, cohomological degree one is `M[−1]`, and the telescope relation is
`[n, x] = [n+1, tx]`.

### IHG.2.1 Hecke images in the derived category

**Finite morphism modules.** For noetherian `A` and `M, N` with finite cohomology supported on
bounded intervals, `Hom(M, N)` is finite, by induction on amplitudes with truncation triangles and
`ModuleCat.finite_ext`; no finite projective dimension is assumed. Hence `α.range` is finite
([Boxer–Pilloni] proof of Lemma 2.4.3, p. 18).
*Lean:* `HeckeImage.Supported`, `HeckeImage.FiniteCohomology`, `HeckeImage.derived_hom_finite`.

**Chain, homotopy and derived images.** A chain action descends to the homotopy and derived
categories with `α_K(h) = quotient.map(α(h))` and `α_D(h) = Q.map(α(h))`, giving surjections
`T_ch → T_hom → T_der` of image algebras, with the homotopy-to-derived comparison bijective for a
K-projective source ([ACC] §2.2.3, pp. 920–921). *Checks:* the identity of `A --1→ A` is nonzero as
a chain map but zero in `K(A)` and `D(A)`.

**Cohomology action and its quotient.** The homology functors assemble to an algebra map
`End(C) → ∏_i End(Hⁱ(C))`; its kernel is the ghost ideal (endomorphisms zero on all cohomology). For
an action, the kernel on `H` contains `ker α` and differs from the kernel on `α.range`, and
`α.range` modulo the latter is the image in `∏ End(Hⁱ)` ([ACC] Lemma 2.2.4 and setup, p. 920).
*Checks:* for `ℤ[X]` acting on `𝔽₂[0] ⊕ 𝔽₂[−1]` through a nonzero `Ext¹` class, the source kernel is
`(2, X)` while `ker α = (2, X²)`; evaluation `X ↦ 0` on `ℤ[0]` separates the two kernels.
*Lean:* `HeckeImage.IsGhost`.

### IHG.2.2 Ghosts and local factors

**Ghost nilpotence and annihilators.** If `Hⁱ(C) = 0` outside `[a, b]`, every ordered product of
`b − a + 1` ghosts vanishes in the (noncommutative) endomorphism ring; so an ideal of `H` acting by
ghosts has `(b − a + 1)`-st power in `ker α` ([ACC] proof of Lemma 2.2.4, pp. 920–921). *Checks:*
one degree needs one ghost; on `[0, 1]` the exponent two is attained by a nonzero square-zero `Ext¹`
class from degree one to degree zero.
*Lean:* `HeckeImage.ghost_nilpotence`, `HeckeImage.action_annihilator_power`.

**Finite local factors.** A finite commutative algebra over a complete noetherian local ring is a
finite product (possibly empty) of finite complete noetherian local algebras ([Stacks]
Lemma 10.160.2, tag 0323).
*Lean:* `HeckeImage.finite_local_factors`.

**Specified idempotent summands.** Every idempotent `e` of `End(C)` splits (`i ≫ p = 1`,
`p ≫ i = e`), so `C ≅ eC ⊕ (1 − e)C`, `Hⁱ(eC) = im Hⁱ(e)`, and `eC = 0` iff every `Hⁱ(e) = 0`; the
input is countable coproducts in `D(A)` ([Bökstedt–Neeman] Corollary 1.7, p. 213, Proposition 3.2,
pp. 221–222). *Checks:* on `(ℤ²)[0]` the projectors `0`, `1`, `(a, b) ↦ (a, 0)` give summands of
ranks `0, 2, 1`.
*Lean:* `HeckeImage.exists_idempotent_splitting`.

### IHG.2.3 Operator localization and ordinary parts

**Telescope and homology.** For any `t ∈ End(C)` the telescope `C[t⁻¹]` sits in a triangle whose
first map is `ι_n − t ≫ ι_{n+1}` on `⊕_ℕ C`; `Hⁱ(C[t⁻¹])` is the module colimit of `Hⁱ(C)` under
`Hⁱ(t)` (Mathlib's `Module.DirectLimit`, also the quotient of `ℕ →₀ M` by
`single n x − single (n+1)(tx)`) ([Bökstedt–Neeman] Definition 2.1, Remark 2.2, p. 213). *Checks:*
for `t = −1`, `[0, 3] + [1, 3] = 0`; multiplication by `2` on `ℤ` gives `ℤ[1/2]`.

**Comparison with an idempotent.** If `e² = e`, `te = et`, `t` is invertible on `eC` and nilpotent on
`(1 − e)C`, the telescope is `eC`, the initial map becoming the splitting projection; valid over any
`A` ([Boxer–Pilloni] proof of Lemma 2.4.3, p. 18).

**Factorial powers.** For complete noetherian local `A` with finite residue field and finite
commutative `T`, `t^{n!}` converges `m_A`-adically to an idempotent that is `0` modulo maximal
ideals containing `t` and `1` otherwise ([Calegari–Geraghty 2018] §7.1, p. 73). *Checks:*
`(1, 0)^{n!} = (1, 0)` in `𝔽₂ × 𝔽₂`; `2^{n!} ≠ 1` in `ℚ`.

**Ordinary finiteness.** Over artinian local `A`, every operator on a bounded `C` with finite
cohomology has such an idempotent decomposition, and its telescope has finite cohomology on the same
interval; for `u : M → C`, `v : C → M` the telescopes of `vu` and `uv` agree compatibly with `u`
([Boxer–Pilloni] Lemma 2.4.3, p. 18, Lemma 2.4.6 and proof, p. 19). *Checks:* over `ℤ` the telescope
of `2` on `ℤ[0]` is nonzero.

**Completion of a supplied split algebra.** If `O ⊗ T ≅ O^s` for a complete local `O`, completion at
the preimage of `m_O` under the `i`-th projection is `O`; no noetherian hypothesis is needed
([Stacks] §10.96, tag 00M9).

### Examples

The nonzero `Ext¹` ghost on `𝔽₂[0] ⊕ 𝔽₂[−1]` pins the exponent and orientation; the three projectors
on `(ℤ²)[0]` and the sign computation for `t = −1` pin the splitting and telescope conventions.

### Dependencies

Mathlib's derived categories, `ModuleCat.finite_ext`, `TwoSidedIdeal`, `Module.DirectLimit`. IHG.5
consumes ghost nilpotence.

## Layer IHG.3b: residual maximal ideals of Galois type

### IHG.3b.1 Galois-type and non-Eisenstein maximal ideals

**Maximal ideals of Galois type.** For a maximal ideal `m` of a commutative ring `T` with finite
discrete residue field `k`, a topological group `G`, `Frob : V → G` and `P : V → k[X]`, `m` is of
Galois type if some continuous semisimple representation on `kⁿ` has polynomial `P v` at `Frob v`,
and non-Eisenstein if it can moreover be taken absolutely irreducible (so `n > 0`); for a spherical
Hecke algebra take `G = G_{F,S}` and the reductions of IHG.3a's polynomials ([ACC] Definition 2.3.6,
p. 938). *Checks:* at a Frobenius element equal to `1` the polynomial is `(X − 1)ⁿ`; rank zero is
Galois type but not non-Eisenstein; two trivial characters in characteristic two are semisimple but
not absolutely irreducible.
*Lean:* `Spherical.IsGaloisType`, `Spherical.IsNonEisenstein`.

**Basic consequences.** Non-Eisenstein implies Galois type of positive rank, and every observed
polynomial of a Galois-type system is monic of degree `n` with nonzero constant term.
*Lean:* `Spherical.IsNonEisenstein.isGaloisType`.

**Uniqueness.** Over a Hausdorff topological field, continuous determinants with equal polynomials
at a family whose conjugates are dense are equal; by IHG.1 the semisimple realisations agree over a
common algebraic closure ([Chenevier] Theorem 2.12 and its uniqueness proof, pp. 28–31). *Checks:*
the trivial and sign characters of `C₂` over `𝔽₃` agree at the identity only.

### IHG.3b.2 Duality and character twists of residual polynomial systems

**Transport.** For a continuous character `θ`, twisting preserves both predicates with `P_v`
replaced by `P_v.scaleRoots(θ(Frob v))`, and the dual twist `g ↦ θ(g)ρ(g⁻¹)ᵀ` with
`(C(P_v(0)⁻¹) · reflect_n P_v).scaleRoots(θ(Frob v))`; the [ACC] dual twist is `θ = ε^{1−n}`, root
multiplier `q_v^{n−1}` at geometric Frobenius ([ACC] paragraph after Definition 2.3.6, p. 938).
*Checks:* roots `2, 3` with multiplier `5` give `X² − 25X + 150`; the dual twist for `n = 2`,
`q = 5` has roots `5/2, 5/3`, not `1/10, 1/15`.

### Examples

The trivial line, its doubled semisimple representation in characteristic two and the tautological
character of `𝔽₅ˣ` separate Galois type from non-Eisenstein.

### Dependencies

IHG.1 (matrix modules, absolute irreducibility, field reconstruction); IHG.3a.

## Layer IHG.4: interpolation over integral coefficient rings

Characteristic polynomials on a conjugacy-dense set determine a continuous determinant; existence
needs integral descent or compatible quotient laws. Laws are on ordinary group algebras, over any
commutative ring and in every degree, with `G = G_{F,S}` fixed in the Galois application.
*Checks:* at eigenvalues `1, −1` the monic and reversed conventions give `X² − 1` and `1 − X²`, which
agree only in characteristic two.

### IHG.4.1 Uniqueness and gluing of continuous determinants

**Group-algebra coefficient change.** For `φ : A → B`, the coefficient change of a determinant on
`A[G]` is scalar extension followed by `B ⊗ A[G] ≅ B[G]`; its polynomials are the images, and it is
functorial in `φ`. By Amitsur's formula it is determined by those polynomials ([Chenevier] §1.1, pp.
6–7, §2.30, p. 37). *Checks:* `X² − 1 ↦ X² + 1` along `ℤ → 𝔽₂`; the value `3 ∈ ℤ/4` becomes `1`
modulo `2`.
*Lean:* `Determinant.IsCoefficientChange`.

**Uniqueness from Frobenius density.** For Hausdorff `A`, continuous determinants with equal
polynomials at every `Frob v`, where `{h Frob(v) h⁻¹}` is dense, are equal; Chebotarev layer 10
supplies the density in `G_{F,S}`, chosen representatives alone need not be dense ([Chenevier]
Lemma 1.12(ii), §2.30, pp. 12, 37; [Scholze] Corollary 5.1.10, p. 1037).
*Lean:* `Determinant.eq_of_charpoly_frobenius`.

**Compact coefficient-ring gluing.** For compact Hausdorff `A` and a jointly injective family of
continuous maps `φ_i : A → B_i` to Hausdorff rings, continuous determinants `D_i` whose coefficients
on a dense set lift to a common element of `A` come from a unique continuous determinant over `A`:
compactness makes `A → ∏ B_i` a closed embedding, and Amitsur's formula descends the law; `G` need
not be compact ([Chenevier] Example 2.32, Corollary 1.14, pp. 38, 14). *Checks:* the theorem applies
to discrete `ℤ` with the identity of `𝔽₂`.
*Lean:* `Determinant.existsUnique_isCoefficientChange_of_compact`.

**Gluing over an intersection of quotient ideals.** The case `A/(I ∩ J) → A/I × A/J` with compact
Hausdorff `A/(I ∩ J)`: laws on the two quotients with simultaneous coefficient lifts on a dense set
glue uniquely; agreement after passing to reduced rings is not enough ([Scholze] proof of
Corollary 5.1.11, p. 1038).

### IHG.4.2 Finite-quotient witnesses and interpolation

**Compatible quotient determinants.** For a descending chain `J_r` and a topological group `G`,
compatible data are laws `D_r` over `A/J_r` with locally constant coefficients whose reductions
agree for `r ≤ s`; no finiteness is built in ([Chenevier] Lemmas 2.33 and 3.2, pp. 38–39, 41).
*Checks:* the unit-ideal system has the unique zero-ring law; values `1` and `−1` at one element are
incompatible in a constant `𝔽₃` system.

**Refining the group quotient.** For normal `V ≤ U`, a law on `(A/J_r)[G/U]` pulls back to
`(A/J_r)[G/V]` with the same polynomial at the class of `g`; there need not be one subgroup working
at every level ([Chenevier] Lemma 2.33, pp. 38–39).

**The quotient-limit ring.** The compatible sequences in `∏ A/J_r` form a subring; a completeness
identification must send `a` to `(a mod J_r)_r` ([Chenevier] proof of Lemma 3.2, p. 41). *Checks:*
`J₀ = ⊤`, `J_r = 0` otherwise gives sequences with initial coordinate `0`.

**Determinant from a compatible inverse limit.** For `A` complete for the chain, compatible data
give a unique law on `A[G]` with the given reductions (through the representing ring of
multiplicative laws over `ℤ`; no tensor–limit exchange is asserted), continuous for the limit
topology ([Chenevier] Lemma 3.2, p. 41). *Checks:* rank-one values `1, −1` at `g, h` give `−1` at
`2[g] + 3[h]`; over `ℤ/4` the value `3` is kept, distinct from `1`.

**Uniform congruence witnesses for classical systems.** Over compact Hausdorff `A`, a witness is a
finite jointly injective family of continuous maps to Hausdorff `A`-algebras with continuous laws,
dense Frobenius conjugates, and a common lift of each Frobenius coefficient; compact gluing gives
its descended law, and transport of all Frobenius polynomials along a continuous map gives transport
of laws. The geometric input is one ideal controlling all unramified places at each level
([Chenevier] Example 2.32, p. 38; [Scholze] proof of Corollary 5.1.11, p. 1038). *Checks:* an empty
witness exists only over the zero ring.

**Integral interpolation with uniform congruences.** Let `A` be separated and complete for a
descending chain `J_r` forming a neighbourhood basis of `0`, `Frob : V → G` with dense conjugates,
`P_v ∈ A[X]`, and `D_r` laws over `A/J_r` with locally constant coefficients and polynomial
`P_v mod J_r` at `Frob v` (as supplied by uniform congruence witnesses). Then there is a unique
continuous determinant over `A` with polynomial `P_v` at every `Frob v`; compactness of `G` is not
needed ([Chenevier] Example 2.32, Lemma 3.2, pp. 38, 41; [Scholze] Corollary 5.1.11, p. 1038).
*Lean:* `Determinant.existsUnique_interpolation`.

**Coefficient change in interpolation.** Compatible ring maps `A → B`, `A/J_r → B/K_r` carrying the
quotient laws to each other carry the limit laws to each other; no topology is needed ([Chenevier]
proof of Lemma 3.2, p. 41). **Hecke level change in interpolation.** A continuous map `A → B`, `B`
Hausdorff, transporting all Frobenius polynomials of continuous laws transports the laws ([Scholze]
Corollary 5.1.11, p. 1038).

**Fixed ramification set in coefficient limits.** For `q : G → H`, if the level laws on `G` are the
pullbacks of those on `H`, so is the limit law; applied to `G → G_{F,S}` this keeps the ramification
set fixed ([Chenevier] proof of Lemma 3.2, p. 41). **Failure of field-point integrality on
nilpotents.** Over `k[ε]/ε²` the characters `n ↦ 1` and `n ↦ 1 + nε` of `ℤ` give distinct rank-one
laws that agree after every map to a field, also in characteristic two ([Chenevier] §2.24, p. 35).

### Examples

Degree zero, the unit ideal, empty witnesses, characteristic two, nonreduced rings;
`A = ℤ_p`, `J_r = (p^r)` with Tau Ceti's `PadicInt.inverseLimitRingEquiv`.

### Dependencies

IHG.0 (coefficients, continuity, representability); IHG.3a; Chebotarev layer 10.

## Layer IHG.5: quantified nilpotent comparison

A Hecke comparison supplies an error ideal with a uniform exponent, and descent produces a
determinant over the quotient; no factorial or residue-characteristic restriction.

### IHG.5.1 Descent through a nilpotent error ideal

**Determinant from a quantified Hecke comparison.** For compact `G`, `φ : T → B`, `J = ker φ` with
`T/J` compact Hausdorff and `T/J → B` continuous into Hausdorff `B`, a continuous determinant over
`B` whose coefficients on a dense set lie in the image descends uniquely to a continuous
determinant over `T/J`; `J^N = 0` in the application, but descent does not use it ([Scholze] proof
of Theorem 5.4.1, pp. 1058–1059).
*Lean:* `Determinant.existsUnique_descent_kerLift`.

**Functoriality of nilpotent descent.** A continuous `T/J → T′/J′` (Hausdorff target) matching the
Frobenius polynomials of continuous quotient laws, conjugates dense, transports the laws ([Scholze]
Corollary 5.1.10, p. 1037).

### IHG.5.2 Nilpotence exponents

**Nilpotence through a quotient extension.** `K^a = 0` and `J^b ⊆ K` give `J^{ab} = 0` ([Scholze]
proof of Theorem 5.4.1, p. 1059). *Checks:* in `ℤ/64`, `J = (2)`, `K = (8)`: `J⁶ = 0`, `J⁵ ≠ 0`.

**Nilpotence of sums of commutative ideals.** For `a, b > 0`, `I^a = J^b = 0` gives
`(I + J)^{a+b−1} = 0`, sharpening `Ideal.sup_pow_add_le_pow_sup_pow`; a finite family has exponent
`1 + Σ(a_i − 1)`, one for the empty family. *Checks:* in `ℚ[x, y]/(x², y³)`, `(x + y)³ = 3xy² ≠ 0`,
`(x + y)⁴ = 0`; in `ℤ/8`, `(2)³ = 0` but `(2)² ≠ 0`.
*Lean:* `Nilpotence.sup`.

**Nilpotence in a product of coefficient rings.** A jointly injective family detects a common
exponent; a finite family with bounds `a_i > 0` gives `1 + max(a_i − 1)`.

**Error ideal on a filtered module.** `J^a M′ = 0` and `J^b M ⊆ M′` give `J^{a+b} M = 0`; an action
faithful on a two-step filtration has square-zero kernel on both factors. *Checks:*
`U = [[0,1],[0,0]]` on `0 ⊂ ℤe₁ ⊂ ℤ²`; the zero module does not detect nilpotence.

**Quantified composition of Hecke error ideals.** `(ker f ∩ ker g)^a = 0`, `J₁^b = 0`, `J₂^c = 0`
give `(f⁻¹J₁ ∩ g⁻¹J₂)^{a·max(b,c)} = 0`; a derived-to-cohomology comparison uses the amplitude
exponent of IHG.2 ([Scholze] proof of Theorem 5.4.1, p. 1059).
*Lean:* `Nilpotence.comparison`.

**Uniform nilpotence in an inverse limit.** If `⋂ K_r = 0` and the image of `J` in every `A/K_r` has
`N`-th power zero, then `J^N = 0`; uniformity is essential ([Scholze] Corollary 5.4.2, footnote 29,
p. 1060). *Checks:* `2` has `(r+1)`-st power zero in `ℤ/2^{r+1}` but is not nilpotent in `ℤ₂`.
*Lean:* `Nilpotence.inverse_limit`.

### IHG.5.3 Residual specialization, representations and lattices

**Residual semisimple specialization.** For `d > 0`, `J ⊆ m` and algebraically closed `k` over
`T/m`, the coefficient change of a determinant over `T/J` along `T/J → T/m → k` is realised by a
semisimple representation unique up to conjugation ([Chenevier] Theorem 2.12, p. 28; [Scholze]
Corollary 5.4.3, p. 1060).
*Lean:* `Determinant.exists_semisimple_specialization`.

**Representation over the nilpotent quotient.** For `d > 0`, `T/J` henselian local and the residual
determinant split and absolutely irreducible, `(T/J)[G]/CH(D) ≅ M_d(T/J)` realises `D`, and every
realising representation is conjugate to it ([Chenevier] Theorem 2.22(i), pp. 34–35; [Scholze]
Corollary 5.4.4, p. 1060).

**Local conditions and change of lattice.** A linear map preserves the scalar-action cocycle
equation and local coboundary witnesses `c(h) = (α(h) − 1)y`; for `ρ′ = PρP⁻¹`, `P = diag(r, s)`,
the upper entry and its cocycle scale by `r/s`. A non-injective map can kill a nontrivial class.
*Checks:* `diag(2,3)` turns `c = 2` into `4/3`.

### Examples

`ℤ/64`, `ℤ/8` and `ℚ[x, y]/(x², y³)` pin the exponents; `ℤ₂` shows uniformity is needed.

### Dependencies

IHG.4 (gluing, Frobenius uniqueness); IHG.2 (ghost nilpotence); IHG.1 (reconstruction).

## Layer IHG.6: integral Ribet modules and Fitting ideals

The cocycle module and its local quotient, the weighted Fitting containment through stabilised
relation minors, integral scheme invariants and two explicit relation complexes, then the local and
global extension theorems.

**Standing hypotheses of Layer IHG.6.** ([DKSW] Theorem 2.1, pp. 7–8.) `T ⊆ T̃` are noetherian, `T`
local with maximal ideal `m`, both `m`-adically complete; `Ĩ ⊆ T̃` is proper and nonzero, `I = Ĩ ∩ T`;
the total fraction ring `K` of `T̃` is artinian principal (a finite product of local rings with
principal maximal ideals, reduced quotient a product of fields `k_i`), with a Hausdorff ring
topology making `T → K` an embedding. `G` is compact, `ρ : G → GL₂(K)` continuous, every
characteristic polynomial lies in `T[X]` and is `(X − χ)(X − ψ)` modulo `I` for continuous
`χ, ψ : G → Tˣ` with `χ ≡ ψ` modulo `m`, and every `G → GL₂(k_i)` is irreducible. The local data are
subgroups `G_v`, `v ∈ S = Σ ⊔ P`, bases triangularising `ρ|_{G_v}` with diagonal `η_v, ξ_v : G_v → T̃ˣ`,
`ξ_v ≡ ψ` on `G_v` for `v ∈ Σ`, `ξ_v ≡ χ` on `I_v ⊆ G_v` for `v ∈ P`, a chosen `v₀ ∈ Σ` and `σ_v ∈ G_v`.
The global hypotheses ([DKSW] Theorem 1.1, pp. 2–3) are `T̃ = T`, `S = ∅`, `T` reduced and no
congruence `χ ≡ ψ`.
*Checks:* the scalar representation `ψ·I₂` with `χ = ψ` satisfies every congruence but is not
irreducible, and without irreducibility the conclusions fail (for the trivial group the only
cocycle is `0`, with Fitting ideal `(1)`); the zero ring is not the total fraction ring of `ℤ`.
*Lean:* `IntegralRibet.Congruence`, `IntegralRibet.fieldRepresentation`,
`IntegralRibet.IrreducibleOnFields`, `IntegralRibet.LocalInput`.

**Fitting annihilator bound.** `Fitt₀(M) ⊆ Ann(M)` for finite `M`, without finite presentation, is
PadicMeasuresIwasawaAlgebras §4.5's `TauCeti.fittingIdeal_le_annihilator` ([Stacks] Lemma 15.8.4(6),
tag 07ZA). *Checks:* `Fitt₀((ℤ/2)²) = (4)` while the annihilator is `(2)`.

### IHG.6.1 Character differences and the Ribet cocycle

**Character congruence on the group algebra.** If `tr ρ(g)`, `det ρ(g)` lie in `A` and reduce to
`χ(g) + ψ(g)`, `χ(g)ψ(g)` modulo `J` for all `g`, the same holds for every `t ∈ A[G]` ([DKSW] §2.1,
equation (13), p. 8).

**Character difference modules.** `Δψ` is the range of `t ↦ ρ(t) − ψ(t)I₂` on `A[G]`, generated by
the `ρ(g) − ψ(g)I₂`; `ΔχΔψ` is the span of products ([DKSW] §2.1, equation (14), pp. 8–9). *Checks:*
for `ρ(n) = [[1, n],[0, 1]]`, `χ = ψ = 1`: `Δψ = ℤE₁₂`, `ΔχΔψ = 0`; for `G = ℤˣ`, `ρ(u) = uI₂`,
`χ = ψ = 1`: `Δψ = 2ℤI₂` and `ΔχΔψ = 4ℤI₂`, so the product is not a bracket or a sum.
*Lean:* `IntegralRibet.differenceMap`, `IntegralRibet.differenceModule`.

**Product containment of difference modules.** `ΔχΔψ ⊆ Δψ` ([DKSW] §2.1, p. 9).

**Initial Ribet quotient module.** `M₀ = Δψ/ΔχΔψ`, generated by the classes of `ρ(g) − ψ(g)I₂`
([DKSW] §2.1, equation (14), p. 9). *Checks:* `M₀ = 0` for scalar data; `M₀ ≅ ℤ` for the unipotent
example.
*Lean:* `IntegralRibet.productInside`, `IntegralRibet.initialModule`.

**Canonical Ribet cocycle.** `κ₀(g) = ψ(g)⁻¹[ρ(g) − ψ(g)I₂]` is a cocycle for `α = χψ⁻¹` whose
values span `M₀` ([DKSW] Lemma 2.3 and proof, p. 9). *Checks:* `κ₀(1) = 0`; `κ₀(n) = n` for the
unipotent example; for `g = diag(2,3)`, `h = [[1,1],[0,1]]` over `ℚ`,
`κ(gh) = 2/3 = κ(g) + (2/3)κ(h)`, fixing the `ψ⁻¹` normalisation.
*Lean:* `IntegralRibet.canonicalCocycle`.

**Ribet module with local conditions.** `N = N₀/Q` with `N₀ = M₀ ⊕ ⊕_{v ∈ Σ∖{v₀}} A y_v` and `Q`
generated by `κ₀(G_{v₀})`, `κ₀(g) − (α(g) − 1)y_v` for `g ∈ G_v`, and `κ₀(I_v)` for `v ∈ P`; the
image `κ` vanishes on `G_{v₀}` and `I_v` and is the coboundary of `y_v` on `G_v`, and `κ(G)` with
the `y_v` generates `N` ([DKSW] §2.1, pp. 9–10, signs as in Theorem 2.1). *Checks:* `S = ∅` gives
`N = M₀`; `Σ = {v₀}`, `G_{v₀} = G` gives `N = 0`; scalar data with two trivial `Σ` places give
`N ≅ A y_{v₁}`, not generated by `κ`.
*Lean:* `IntegralRibet.LocalData`, `IntegralRibet.extraPlaces`, `IntegralRibet.enlargedModule`,
`IntegralRibet.localRelations`, `IntegralRibet.localModule`, `IntegralRibet.localCocycle`,
`IntegralRibet.localVector`.

**Finite and continuous Ribet modules.** A finite `T`-submodule `Λ ⊆ M₂(K)` containing `Δχ, Δψ`
makes `Δχ, Δψ, M₀, N` finite; if its induced topology is `m`-adic (Artin–Rees for submodules, and
the adic topology of a quotient is the quotient topology) both cocycles are continuous ([DKSW] §2.1,
(13)–(14), pp. 8–9; [Stacks] Lemma 10.51.2). *Checks:* over `k = 𝔽₂(u₁, u₂, …)` and
`T = k[[t]] ⊆ k′[[t]]`, `k′ = k(√u_i)`, an action of `∏ ℤ₂` through `I₂ + [[0,t],[1,0]]` and
`(1 + √u_i tⁱ)I₂` gives an infinite empty-local quotient, so the lattice input cannot be dropped.

**Finite orders and the global coefficient ring.** An `A`-subalgebra of `M₂(K)` containing `ρ(G)`
contains both difference modules. For `T` complete reduced noetherian local and `K = Frac(T)` with
field-factor irreducibility and integral polynomials, both lie in a finite submodule (matrix factors
by trace duality; quadratic-field factors by finiteness of normalisation, also when inseparable,
from SchemeAndStackFoundations §0.20 `IsJapanese.of_complete_local`), and that submodule has the
`m`-adic topology ([DKSW] Theorem 1.1, pp. 2–3, §2.1, pp. 8–9; [Stacks] Lemma 10.162.8, tag 032W).
*Checks:* in characteristic two `[[0, t],[1, 0]]` with `t` nonsquare acts irreducibly with all
traces zero, so trace duality alone fails.

**Every cocycle representative generates.** Over local `T` with `α ≡ 1` modulo `m`, if `κ` spans a
finite `M`, so does every `κ + (α − 1)y` (Nakayama) ([DKSW] Theorem 1.1, §2.1, pp. 3, 9). **Ribet
theory for distinct residual characters.** Under the global hypotheses with `χ ≢ ψ` modulo `m`,
diagonalise `ρ(τ)` for `τ` with `χ(τ) − ψ(τ)` a unit using its henselian roots; the upper entries
generate a faithful finite `B`, and `κ = ψ⁻¹b` modulo `IB` is a continuous cocycle every
representative of which generates `B/IB`, with `Fitt₀(B/IB) ⊆ I` ([DKSW] Introduction, pp. 4–5).

### IHG.6.2 Relation minors and the auxiliary matrices

**Five types of Ribet module relations.** With generators `ρ_i = ρ(g_i) − ψ(g_i)` of `Δψ`, the `y_v`
and `ν_i = ψ(g_i) − χ(g_i)`, a presentation of `N` has relations (I) linear among the `ρ_i`, (II)
`(ρ_i + ν_i)ρ_j = Σ δ_ijk ρ_k`, (III) from `σ ∈ G_{v₀}`, (IV) from `σ ∈ I_v`, (V) from `σ ∈ G_v`
with `ψ(σ) − χ(σ)` in the `y_v` column ([DKSW] §2.2, (18)–(24), pp. 10–11). **Stabilization of local
relation rows.** Adjoining each local `ρ(σ) − ψ(σ)` as a generator with a pivot row keeps the square
relation determinant up to sign and leaves local rows with one pivot and at most one `y_v` entry
([DKSW] §2.3, pp. 11–12).

**Weighted auxiliary matrix.** Bordering a stabilised minor `D` by the block with diagonal
`z_v = ξ_v(σ_v) − χ(σ_v)` and the coefficients of `ρ(σ_v) − ψ(σ_v)` gives `E` with
`det E = (∏_{v ∈ P} z_v) det D`. With `ρ_j = [[a_j, b_j],[c_j, d_j]]`, `x_σ = ξ_v(σ) − ψ(σ)` and
`a(σ) = Σ_j a_j α_{σ,j}`, the altered matrix `E′` replaces each `z_v` by `x_{σ_v} − a(σ_v)`, keeps the
rows of types I and III, replaces `δ_ijj` by `δ_ijj − a_i − ν_i` and `δ_iji` by `δ_iji − d_j` in type
II rows, puts `x_σ − a(σ)` in the `v`-column of type IV rows, and replaces the `y_v`-entry of type V
rows by `x_σ − a(σ)` ([DKSW] §2.4, (28)–(30), pp. 12–13).

**Kernel vector for the altered matrix.** On each artinian principal local factor of `K`, `E′` has a
kernel vector with a unit coordinate ([DKSW] Lemma 2.4 and proof, pp. 13–14). **Vanishing of the
altered determinant.** `det E′ = 0` in `K` ([DKSW] Lemma 2.4, pp. 13–14). **Trace congruences for
difference words.** For a noncommutative polynomial `f` without constant term,
`tr f(ρ₁, …, ρ_r) ≡ f(−ν₁, …, −ν_r)` modulo `I`, and `det(Δψ) ⊆ I` ([DKSW] Lemmas 2.5–2.6, pp.
15–16).

### IHG.6.3 Formal matrix algebra and invariant error

**Formal Ribet matrix ring.** `R = R₀[a_i, b_i, c_i, d_i]/(b_σ : σ ∈ B_{v₀})` over
`R₀ = ℤ[ν_i, ε, δ, x_σ]` (one variable per selected coefficient), with the lower Borel of `GL₂/ℤ`
coacting by conjugation of `Y_i = [[a_i, b_i],[c_i, d_i]]`, `R₀` fixed, and the evaluation
`π : R → K` at the relation data ([DKSW] §3.1, (35)–(37), pp. 17–18). *Checks:* no variables gives
`ℤ`; `b = 0` gives `ℤ[a, c, d]` with `c` of weight `x/z` relative to `a, d`; `δ(b) = (z/x) ⊗ b` for
an upper entry.

**Formal Ribet relation ideals.** `J` is generated by the four entries of the linear rows, the
product rows `(Y_i + ν_i)Y_j − Σ δ_ijk Y_k` and the local matrices with
`A_στ = b_σc_τ − (x_τ − d_τ)(x_σ − a_σ)`, `B_στ = b_σ(x_τ − a_τ) − b_τ(x_σ − a_σ)`,
`C_στ = c_σ(x_τ − d_τ) − c_τ(x_σ − d_σ)`, `D_στ = A_τσ`; `J′ ⊆ J` uses only the `b`-entries; both
are lower-Borel stable ([DKSW] §3.2, (39)–(42), pp. 18–19, Lemma 4.18, p. 30). *Checks:* for
`ε₁X₁ + ε₂X₂`, `J′ = (ε₁b₁ + ε₂b₂)`; `B_σσ = 0` also over `𝔽₂`; at `Y_σ = [[1,2],[3,4]]`,
`Y_τ = [[5,6],[7,8]]`, `x = 9, 10` the local matrix is `[[−2, −38],[−29, −7]]`.

**Evaluation annihilates the formal relation ideal.** `π(J) = 0` ([DKSW] Lemma 3.1, p. 19).

**Trace and determinant invariant subring.** `A = A₀[d_τ : τ ∈ B_{v₀}]`, `A₀` generated over `R₀` by
traces and determinants of noncommutative words in the `Y_i`, contains every word trace and equals
`H⁰(B, R)` for rational cohomology ([DKSW] §3.3, p. 19, Corollary 4.17, p. 27). *Checks:* one matrix
has invariants `ℤ[a + d, ad − bc]`; over `𝔽₂` scalar matrices have trace `0` but determinant `a²`.

**Polarized local character congruence.**
`(ξ(σ) − χ(σ))(ξ(τ) − ψ(τ)) + (ξ(τ) − χ(τ))(ξ(σ) − ψ(σ)) ≡ 0` modulo `Ĩ` for a local
triangularisation ([DKSW] Lemma 3.2, (47), pp. 20–21). **Invariant intersection with the character
error ideal.** With `I_R = (a_i + ν_i, b_i, c_i, d_i)`, `π(A ∩ (I_R + J)) ⊆ Ĩ` ([DKSW] Lemma 3.2,
pp. 20–21).

### IHG.6.4 Koszul complexes, induction and good filtrations

**Koszul complex of a finite sequence.** `K(x)` is `⋀(Aⁿ)` with `d(e_i) = x_i`: `d₁(v) = Σ x_i v_i`,
`H₀ = A/(x)`, `K(x, y) ≅ K(x) ⊗ K(y)`, functorial in the sequence, and acyclic in positive degrees
for a weakly regular sequence; Mathlib's pending `koszulComplex` (PR #43708) is to be used once
merged ([Stacks] Definitions 15.29.1–2, Lemmas 15.29.3, 15.29.12, 15.31.2, tags 0622, 0624, 0664,
062F). *Checks:* `K(2)` over `ℤ` has `H₁ = 0`, over `ℤ/4` has `H₁ ≅ ℤ/2`; for `(2, 3)`,
`d(e₀ ∧ e₁) = 2e₁ − 3e₀`.

**Integral restriction to the lower Borel.** For `G = GL₂/ℤ`, its lower Borel `B` and every rational
`G`-module, `Hⁱ(G, V) → Hⁱ(B, V)` is an isomorphism (scheme cohomology, not that of `G(ℤ)`) ([DKSW]
Theorem 4.4, p. 23). **Adjoint weight and dual identities.** In the adjoint representation
`𝒜 = ℤA ⊕ ℤB ⊕ ℤC ⊕ ℤD` of `B`, `V = ℤA ⊕ ℤB` has `A ↦ A + (y/x)B`, `B ↦ (z/x)B`; with `ℤ(1) = ℤB`,
`∧²V ≅ ℤ(1)`, `V* ≅ V(−1)`, `V ⊗ V* ≅ 𝒜`, `V ⊗ V ≅ 𝒜(1)` ([DKSW] Example 4.2, p. 22, Lemma 5.10, p.
42).

**Lower-Borel Hopf coordinates.** `O(B) = ℤ[x, z, y, x⁻¹, z⁻¹]` with `x, z` group-like,
`Δy = y ⊗ x + z ⊗ y`, `ε(y) = 0`, `S(y) = −x⁻¹yz⁻¹`; restriction sends the generic `GL₂` matrix to
`[[x, 0],[y, z]]`; characters `x^a z^b` ([DKSW] Definition 4.1, Example 4.2, p. 22; [Jantzen] I.2.3,
I.3.3). *Checks:* the lower-left entries of `gh` and `hg` for `g = [[2,0],[3,5]]`,
`h = [[7,0],[11,13]]` are `76` and `61`, pinning `Δy`.

**Good filtrations and acyclicity.** `Ind_B^G(λ) = H⁰(λ)` (functions with `f(gb) = λ(b)⁻¹f(g)`),
nonzero iff `λ₁ ≥ λ₂`; a good filtration is a countable exhaustive filtration with successive
quotients zero or some `H⁰(λ)`. Good modules are `G`-acyclic (finite case by [DKSW], exhaustive case
by filtered colimits) and tensor products of good modules are good ([DKSW] Definition 4.6, Theorems
4.7–4.8, pp. 23–24; [Jantzen] I.3.3, II.2.6, II.4.16, I.4.17). *Checks:*
`H⁰((0, −1)) = ℤb ⊕ ℤd ≅ (ℤ²)^∨` while `H⁰((0, 1)) = 0`; `ℤ²` and its dual are good but not
isomorphic; `H¹(G, V) ≠ 0` excludes a good filtration; `ℤ[a, b, c, d]` under conjugation has an
exhaustive but no finite good filtration.

**Twisted lower-Borel calculations.** With `M(j)` the coaction twisted by `(z/x)^j`, for good `V`:
`Hⁱ(B, V(j)) = 0` for `i > j`; `H¹(B, V(1)) ≅ H⁰(G, V)` (so `H¹(B, ℤ(1)) ≅ ℤ`); for `i > 1`,
`Hⁱ(B, V(i)) ⊗ 𝔽_p = 0` for `p > 2` and `≅ H⁰(G, V) ⊗ 𝔽₂` for `p = 2`; these identifications are
compatible with the twisted-invariant products of good algebras, which are surjective on diagonal
classes ([DKSW] Lemmas 4.11–4.12, Corollary 4.13, pp. 24–25). *Checks:* `H¹(B, ℤ(1)) ≠ 0`,
`H¹(B, ℤ) = 0`, `H²(B, ℤ(1)) = 0`.

**Finite twisted resolutions and triangular acyclicity.** A `B`-module with a bounded augmented exact
resolution by `V_k(k)`, `V_k` good, has no positive cohomology; hence for `ℤ`-flat good `V`,
`V ⊗ R` is `B`-acyclic for the partially triangular formal ring `R`, and so are the terms built from
adjoint tensor powers ([DKSW] Lemma 4.14, Theorem 4.15, Corollary 4.9, Proposition 5.5(2),
pp. 24–26, 39–40).

**Integral trace and determinant invariants.** For `ℤ`-flat `R₀`, the `GL₂` invariants of
`R₀[a_i, b_i, c_i, d_i]` are generated by traces and determinants of the algebra of generic matrices
([DKSW] Theorem 4.16, pp. 26–27). **Invariants of entirely triangular matrices.** Killing every
`b_τ` gives `R^B = R₀[a_τ, d_τ]` ([DKSW] Corollary 4.17, p. 27). **Invariants of the formal Ribet
ring.** `H⁰(B, R) = A₀[d_τ]` for the formal ring ([DKSW] Corollary 4.17, pp. 27–28).

**Lower-Borel stability of relation ideals.** Under `[[x, 0],[y, z]]` each local quadruple
transforms by `A ↦ A + (y/x)B`, `B ↦ (z/x)B`, `C ↦ (x/z)C − (y/z)A − (y²/xz)B + (y/z)D`,
`D ↦ D − (y/x)B` (it is `−(x_σ − Y_σ)·adj(x_τ − Y_τ)`), so `J` and `J′` are `B`-stable ([DKSW]
Lemma 4.18, pp. 29–30).

### IHG.6.5 Buchsbaum–Rim complexes and generic regularity

**Composition of exterior contractions.** Determinant contraction satisfies
`ω(λ₁ ∧ ⋯ ∧ λ_r) = (−1)^{r+1} ω(λ₁)⋯ω(λ_r)` ([Buchsbaum] Lemma 1.1, pp. 184–185). *Checks:* on `ℤ²`,
`ω(e₁* ∧ e₂*)(e₁ ∧ e₂) = 1` while `ω(e₁*)ω(e₂*)(e₁ ∧ e₂) = −1`.

**Exterior-bar construction.** For `f : Rⁿ → Rᵐ`, `ω : ∧(W*) → End(∧U)` extends `ℓ ↦ −(ℓ ⌋ ·)`
(Mathlib's `CliffordAlgebra.contractLeft` with zero form), and Buchsbaum's bar differential on
`(∧W*)^{⊗k} ⊗ ∧U` contracts the last form and merges adjacent forms with signs; it preserves the
submodules `T(f; k; p, q)` ([Buchsbaum] §1, pp. 185–187). *Checks:* on `1 ⊗ e* ⊗ e` in rank one with
`f = id` the differential is `1 ⊗ 1 + e* ⊗ e`.

**Buchsbaum–Rim module complex.** For `1 ≤ m ≤ n`, `BR(f) = K(f; 1, m)` is finite free with
`d₁ = f`, `d₂` the signed maximal-minor contraction (`r_ij e_k + r_jk e_i + r_ki e_j` for `m = 2`)
and bar differentials above; for `m = 1` it is the Koszul complex of the row ([Buchsbaum] §1, pp.
185–187; [DKSW] (60)). *Checks:* `f = id` gives an exact two-term complex; `f = 0 : R³ → R²` has
`H₁ = R³`.

**Buchsbaum–Rim determinant complex.** `DetBR(f) = K(f; m, 1)` has `d₁ = ∧ᵐf`, is functorial for
`f′ ∘ g = f`, and after trivialising `det W` has `H₀ = R/I_m(f)` ([Buchsbaum] §1, p. 186; [DKSW]
(62), p. 37). *Checks:* `m = 1` gives the Koszul complex; a square `f` gives `R --det f→ R`; a
generic `2 × 3` matrix has three minors, two syzygies and no division by `2`.

**Regularity of a finite free map.** `f` is regular if `H₁(BR(f|_{Rᵏ})) = 0` for every prefix with
`m ≤ k ≤ n`; prefixes of regular maps are regular and for `m = 1` this is weak regularity
([Buchsbaum] §3, p. 194; [DKSW] Definition 5.1, p. 37).
*Checks:* a square matrix is regular iff injective (the identity over `ℤ/4` is); `2` is regular on
`ℤ` but not on `ℤ/4`.

**Mapping cone for adjoining a column.** `BR(f ⊕ ρ)` is the cone of a contraction map
`DetBR(f) → BR(f)` ([Buchsbaum] Proposition 2.1, Corollary 2.2, p. 187). **Transfer of acyclicity to
determinant complexes.** If `H_i(BR(f) ⊗ E) = 0` for `i ≥ j > 0`, the same holds for `DetBR(f) ⊗ E`,
through the contraction-cycle normal forms of [Buchsbaum] Lemmas 2.3–2.11 ([Buchsbaum] Theorem 2.9,
pp. 191–193).

**Exactness of regular Buchsbaum–Rim maps.** For regular `f`, `BR(f)` and `DetBR(f)` are acyclic in
positive degrees, so `DetBR(f)` resolves `R/I_m(f)` ([Buchsbaum] Proposition 3.1, pp. 194–195;
[DKSW] Theorem 5.2, p. 37). **Tensor resolutions of ordered determinantal ideals.** If each `f_i` is
regular modulo `J₁ + ⋯ + J_{i−1}`, `J_i = I_{m_i}(f_i)`, then `⊗ DetBR(f_i)` resolves `R/Σ J_i`
([DKSW] Lemma 5.4, pp. 37–38).

**A two-column regularity criterion.** For `f : Rⁿ → R²` with minors `r_ij`, if
`r_{1k}x ∈ (r₁₂, …, r_{1,k−1})` implies `x ∈ (r_ij : i, j < k)` for all `k ≥ 2`, then `f` is regular
([DKSW] Lemma 5.11, p. 43). **Localized chart for generic two-column minors.** For
`R = R₀[b_i, b′_i]`, `J_k = (r_ij : i, j ≤ k)`,
`R[1/b′₁]/J_k ≅ R₀[b′₁, …, b′_n, b₁, b_{k+1}, …, b_n, 1/b′₁]`, where `r_{1,k+1}` is a
non-zero-divisor ([DKSW] Corollary 5.12, (70), p. 43).

**Saturation of the generic minor ideal.** `R ∩ J_k R[1/b′₁] = J_k` ([DKSW] Corollary 5.12, proof,
p. 43). **Regularity of a generic two-column map.** For every `R₀` and `n ≥ 2`, the generic map with
columns `(b_i, b′_i)` is regular ([DKSW] Corollary 5.12, p. 43). **A pivot chart for generic linear
sequences.** In `R₀[α_ij, x_j]`, `L_i = Σ_j α_ij x_j − c_i` (`m ≤ n`) is weakly regular after
inverting `α₁₁` ([DKSW] Proposition 5.13, Claim 1, pp. 44–45).

**Generic linear prefixes at a zero pivot.** `L₁, …, L_{m−1}` is weakly regular modulo `α₁₁` ([DKSW]
Proposition 5.13, Claim 2, p. 45). **Cancellation of pivot denominators.**
`α₁₁^e P ∈ (L₁, …, L_{m−1})` implies `P` is ([DKSW] Proposition 5.13, Claim 3, p. 45).

**Weak regularity of generic linear equations.** For every `R₀` and `m ≤ n`, `Σ α_ij x_j − c_i` is
weakly regular, and regular in Mathlib's sense when the quotient is nonzero ([DKSW] Proposition
5.13, pp. 44–45). **Mixed minor and linear resolutions.** For blocks of generic columns and generic
linear equations, the tensor product of the determinant complexes resolves the quotient by the sum
of the minor ideals (singleton blocks omitted) ([DKSW] Proposition 5.14, p. 46).

**Generic variable count for the Ribet relations.** After stabilisation, `J′` consists of local
`2 × 2` minors and `r` generic linear equations in exactly `r` unassigned `b` variables ([DKSW] §5.9,
p. 46).

### IHG.6.6 The two relation complexes

**Upper-entry relation complex.** `C = Koszul(f) ⊗ ⊗_v DetBR(f_v)(−1)` with `f(e_i) = L_i` and
`f_v(e_σ) = A ⊗ b_σ + B ⊗ (x_σ − a_σ)`, degree zero `R`, degree-one image `J′`, augmented to `R/J′`
([DKSW] §5.4, (63)–(65), pp. 38–39). *Checks:* no relations give `R`; one linear relation gives
`R --L→ R`; two local rows give `R --(b₁b′₂ − b₂b′₁)→ R`.

**Exactness of the upper-entry resolution.** `C → R/J′` is a finite free resolution ([DKSW]
Proposition 5.5(1), §5.9, pp. 39, 46).

**Full-entry relation complex.** `D` tensors the multilinear Koszul subcomplex of the matrix rows
(distinct rows, one copy of `M₂(R)` each) with the distinct-index local determinant subcomplexes for
the columns `(x_σ − d_σ, c_σ)`, `(b_σ, x_σ − a_σ)`; `D₀ = R`, the degree-one image is `J`, each term
is a sum of adjoint tensor powers, and no exactness is claimed ([DKSW] §5.4, (66), p. 39). *Checks:*
a single matrix row gives `𝒜 ⊗ R → R` with its four entries; same-block wedges are excluded, so the
image is exactly `J`.

**Equivariant comparison of the relation complexes.** Both complexes carry lower-Borel coactions
agreeing with the formal ring in degree zero, and there is an equivariant chain map `C → D` that is
the identity in degree zero; with the exactness of `C` and the acyclicity of the terms of `D`, the
maps `H^j(B, J′) → H^j(B, J)` vanish for `j ≥ 1` ([DKSW] Theorems 4.22–4.23, pp. 33–34; Proposition
5.5, Lemmas 5.6–5.10, pp. 39–42). *Checks:* the wedges `A_σ ∧ A_τ`, `A_σ ∧ B_τ`, `B_σ ∧ A_τ`,
`B_σ ∧ B_τ` go to `−C_στ, −D_στ, A_στ, B_στ`, with values `29, 7, −2, −38` in the numerical example
above.

### IHG.6.7 Invariant determinant comparison and extension theorems

**The determinant difference in the formal error ideal.** `e = det E′ − det E ∈ I_R` ([DKSW] §3.3,
p. 19). **Pairing determinant terms along a local column.** A square matrix whose distinguished
column has nonlocal entries in `J′`, local rows with entries `b_σ`, `x_σ − a_σ` in it and its place
column, and same-place `2 × 2` minors in `J′`, has determinant in `J′` ([DKSW] Lemma 4.20, (54), pp.
31–32).

**Unipotent invariance for product rows.** Moving the product rows of `E′` by the lower unipotent
universal element leaves `det E′` unchanged modulo `J′` ([DKSW] Lemma 4.20, pp. 31–32). **Unipotent
invariance for one local block.** Changing `x_σ − a_σ` to `x_σ − a_σ − t b_σ` for one place leaves
`det E′` unchanged modulo `J′` ([DKSW] Lemma 4.21, pp. 32–33). **Borel invariance of the determinant
difference.** The image of `e` in `R/J′` is `B`-invariant ([DKSW] Lemma 4.19, pp. 30–33).

**Lifting the invariant error across the full ideal.** From `0 → J′ → R → R/J′ → 0`,
`0 → J → R → R/J → 0` and the zero map on `H¹`, the image of `e` in `R/J` lies in the image of
`H⁰(B, R) = A` ([DKSW] §4.4, (52), p. 29).

**Formal determinant comparison.** For every stabilised minor, `det E′ − det E` evaluates into `Ĩ`;
with `π(det E′) = 0` and `det E = (∏ z_v) det D` this is the weighted minor containment. The chain is:
rational-cohomology functoriality, twisted calculations, triangular acyclicity, equivariant
comparison, vanishing of `H^j(B, J′) → H^j(B, J)`, invariant lifting, this comparison ([DKSW]
Proposition 3.3, p. 21, §§4.4–4.6).

**Weighted Fitting containment.** Under the standing hypotheses and `Module.Finite T N`,
`(∏_{v ∈ P} (ξ_v(σ_v) − χ(σ_v))) · Fitt₀(N) · T̃ ⊆ Ĩ`, in `T̃` ([DKSW] Theorem 2.1, (12), pp. 7–8).

**Ribet extension with all local conditions.** Under the standing hypotheses and a finite
`T`-lattice `Λ ⊆ M₂(K)` containing `Δχ, Δψ` with `m`-adic induced topology, `N` is finite, `κ` is
continuous with the prescribed local values, `κ(G)` and the `y_v` generate `N`, and the weighted
containment holds ([DKSW] Theorem 2.1, pp. 7–8, §2.1, pp. 8–9).
*Lean:* `IntegralRibet.local_ribet`.

**Irreducibility excludes an exact split determinant.** Under the global hypotheses with `T ≠ 0`,
`I ≠ 0`: otherwise every field factor would have the determinant of `χ ⊕ ψ`, contradicting
irreducibility by field reconstruction ([DKSW] Theorem 1.1 and its reduction to Theorem 2.1,
pp. 2–3, 7–8).

**Ribet extension without residual distinctness.** For `T` complete reduced noetherian local, any
ideal `I`, compact `G` and continuous `ρ : G → GL₂(Frac T)` irreducible on every field factor with
integral polynomials `≡ (X − χ)(X − ψ)` modulo `I`, there are a finite `T`-module `M` and a continuous
cocycle for `χψ⁻¹` all of whose cohomologous translates generate `M`, with `Fitt₀(M) ⊆ I`; residual
equality and residue characteristic two are allowed. `I = T` takes `M = 0`, `I = 0` is excluded, and
otherwise the coincident and distinct cases use the two constructions above ([DKSW] Theorem 1.1,
pp. 2–3).
*Lean:* `IntegralRibet.global_ribet`.

### Examples

The unipotent representation of `ℤ`; scalar data with two `Σ` places; one generic matrix with
`b = 0`; `K(2)` over `ℤ` and `ℤ/4`; `f = id`, `f = 0`; the relation complexes in low cases.

### Dependencies

IHG.0 (Amitsur's formula, invariant coordinates, rational cohomology); IHG.1 (henselian lifting,
field quotients); Tau Ceti `TauCeti.fittingIdeal`, `TauCeti.Comodule`; ProfiniteCohomology layer 2;
PadicMeasuresIwasawaAlgebras §4.5; SchemeAndStackFoundations §0.20; Mathlib exterior algebras and
regular sequences.

## Downstream consumers

Locally symmetric spaces and torsion cohomology (IHG.4 and IHG.5 are the algebraic form of
[Scholze] Corollary 5.1.11 and Theorem 5.4.1); higher coherent cohomology and higher Hida theory for
`GSp₄` (IHG.2 ordinary parts, IHG.3a dual-spin conversion, IHG.1 symplectic descent); automorphic
congruences and modularity lifting (IHG.3b, IHG.1 reconstruction and Caraiani–Newton compressions);
Iwasawa theory and Ribet's method (IHG.6); Galois deformation spaces (IHG.1 universal and generic
representation algebras). Each supplies its geometric Hecke comparison in the form fixed here: a
congruence witness (IHG.4.2), an error ideal with exponent (IHG.5.1), the residual representation
(IHG.3b.1), or the lattice and local triangularisations (IHG.6.7).

## References

- **[Chenevier]** G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group
  and pseudorepresentations over arbitrary rings*,
  [arXiv:0809.0415v2](https://arxiv.org/pdf/0809.0415v2); LMS Lecture Note Series 414 (2014),
  221–285. Preprint pages.
- **[ACC]** Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor, Thorne,
  *[Potential automorphy over CM
  fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf)*, Ann. of Math. 197 (2023).
  Journal pages.
- **[BCGP]** Boxer, Calegari, Gee, Pilloni, *[Modularity theorems for abelian
  surfaces](https://arxiv.org/pdf/2502.20645v1)*, arXiv:2502.20645v1.
- **[Bellaïche–Chenevier]** J. Bellaïche, G. Chenevier, *[Families of Galois representations and
  Selmer groups](https://arxiv.org/pdf/math/0602340v2)*, arXiv:math/0602340v2; Astérisque 324
  (2009).
- **[BHKT]** Böckle, Harris, Khare, Thorne, *[G-local systems on smooth projective curves are
  potentially automorphic](https://arxiv.org/pdf/1609.03491)*, Acta Math. 223 (2019).
- **[BIP]** Böckle, Iyengar, Paškūnas, *[On local Galois deformation
  rings](https://arxiv.org/pdf/2110.01638)*, Forum Math. Pi 11 (2023).
- **[Bökstedt–Neeman]** M. Bökstedt, A. Neeman, *[Homotopy limits in triangulated
  categories](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf)*, Compositio Math. 86 (1993),
  209–234.
- **[Boxer–Pilloni]** G. Boxer, V. Pilloni, *[Higher Hida theory for Siegel modular
  forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf)*, Invent. Math.
  244 (2026), 45–141; author PDF.
- **[Buchsbaum]** D. A. Buchsbaum, *[A generalized Koszul complex.
  I](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf)*, Trans. AMS 111 (1964), 183–196.
- **[Calegari–Geraghty 2018]** F. Calegari, D. Geraghty, *[Modularity lifting beyond the
  Taylor–Wiles method](https://arxiv.org/pdf/1207.4224)*, arXiv:1207.4224.
- **[Caraiani–Newton]** A. Caraiani, J. Newton, *[On the modularity of elliptic curves over
  imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3)*, arXiv:2301.10509v3.
- **[CHT]** L. Clozel, M. Harris, R. Taylor, *[Automorphy for some l-adic lifts of automorphic mod l
  Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0.pdf)*, Publ. IHÉS 108
  (2008), 1–181.
- **[DKSW]** S. Dasgupta, M. Kakde, J. Silliman, J. Wang, *[The residually indistinguishable case of
  Ribet's method for GL₂](https://math.iisc.ac.in/~maheshkakde/rl.pdf)*, author manuscript (2023);
  printed pages of [arXiv:2310.16396v2](https://arxiv.org/pdf/2310.16396v2).
- **[Emerson–Morel]** K. Emerson, S. Morel, *[Comparison of different definitions of
  pseudocharacters](https://arxiv.org/pdf/2310.03869v2)*, arXiv:2310.03869v2.
- **[Gee–Geraghty]** T. Gee, D. Geraghty, *[Companion forms for unitary and symplectic
  groups](https://arxiv.org/pdf/1001.2044)*, Duke Math. J. 161 (2012), 247–303.
- **[Grothendieck]** A. Grothendieck, *[Le groupe de Brauer
  I](http://www.numdam.org/item/SB_1964-1966__9__199_0.pdf)*, Séminaire Bourbaki 9, exposé 290,
  199–219.
- **[Jantzen]** J. C. Jantzen, *Representations of Algebraic Groups*, 2nd ed., AMS Math. Surveys and
  Monographs 107 (2003).
- **[Quast]** J. Quast, *[Deformations of G-valued
  pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf)*,
  arXiv:2310.14886v1.
- **[Ribet]** K. A. Ribet, *[A modular construction of unramified p-extensions of
  Q(μ_p)](https://math.berkeley.edu/~ribet/Articles/invent_34.pdf)*, Invent. Math. 34 (1976),
  151–162.
- **[Roby]** N. Roby, *[Lois polynômes et lois formelles en théorie des
  modules](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf)*, Ann. Sci. ENS (3) 80 (1963),
  213–348.
- **[Scholze]** P. Scholze, *[On torsion in the cohomology of locally symmetric
  varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf)*, Ann.
  of Math. 182 (2015).
- **[Stacks]** The Stacks Project authors, *[The Stacks Project](https://stacks.math.columbia.edu)*,
  cited by tag.
- **[Allen–Newton–Thorne]** P. B. Allen, J. Newton, J. A. Thorne, *[Automorphy lifting for
  residually reducible l-adic Galois representations, II](https://arxiv.org/pdf/1912.11269v2)*,
  arXiv:1912.11269v2.
- **[Wang–Erickson]** C. Wang-Erickson, *[Algebraic families of Galois representations and
  potentially semi-stable pseudodeformation rings](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf)*,
  Math. Ann. 371 (2018), 1615–1681.

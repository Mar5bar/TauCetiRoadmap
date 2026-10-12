# Roadmap: smooth representations of local groups

**Summary.** This roadmap builds the smooth representation theory of locally profinite groups over
an arbitrary commutative coefficient ring, and then the local representation theory of a reductive
p-adic group: the smooth category and Hecke algebras, induction and Jacquet functors,
admissibility, second adjointness, the Bernstein decomposition and centre, the Satake isomorphism
with its normalisations, integral families for GL_n through Whittaker models, and the parameters
that enter excursion operators. We want it because the local components of automorphic
representations are smooth representations, the Hecke algebras acting on the cohomology of locally
symmetric spaces are the ones defined here, and local–global compatibility and the integral
(torsion) theory of modularity need the statements over general rings rather than over ℂ. It is the
bridge between the local groups of the previous roadmap and the Galois side.

Everything that makes sense over any ring is stated over any ring: smoothness, invariants, compact
induction, Jacquet modules, the permutation-module Hecke algebra and Frobenius reciprocity need no
averaging, and the hypothesis that does (compact open subgroups of pro-order invertible in the
coefficients) is attached to the statements that use it. The end results are second adjointness
`Hom_G(i_P τ, π) ≅ Hom_M(τ, r_{P̄} π)`, the Bernstein decomposition `SmoothRep ℂ G = ∏_s Rep_s(G)`
with centre the regular functions on `Ω(G)`, the Satake isomorphism onto twisted Weyl invariants,
Helm's co-Whittaker families for GL_n, and the finite-wild cocycle scheme with its excursion
algebra. The complex theory is developed in the order in which it is proved: uniform admissibility
and the Bernstein centre precede second adjointness, whose proof uses them.

## Scope and ownership

The roadmap owns: the smooth category over any commutative ring with smooth vectors, invariants,
invertible pro-order, averaging, admissibility, characters, contragredients, coefficient change and
the centre (SR.0); Hecke algebras over rings in the convolution and permutation-module models, the
comparison with the double-coset Hecke ring, Hecke modules, the Λ-linear Bernstein centre, positive
Hecke algebras and the Iwahori–Matsumoto and Bernstein presentations (SR.1); the Grothendieck
property, the derived smooth category, derived invariants, compact generation, derived duality and
the derived Hecke algebra (SR.0d); induction, Jacquet functors, first adjointness, the geometric
lemma, Casselman's pairing and Whittaker functionals (SR.2); cuspidal representations, uniform
admissibility, cuspidal support, the Bernstein decomposition and centre, noetherianity, the
conditional Langlands classification and Iwahori blocks (SR.3a, SR.3); stabilisation and second
adjointness over ℂ (SR.2a); the Satake transform and isomorphism with explicit GL_n, unitary and
GSp_4 normalisations (SR.4); integral families for GL_n (SR.5); and finite-wild parameters,
cocycle schemes, excursion algebras, centre images and stable operators (SR.6).

Outside the roadmap: the ∞-categorical enhancement of the derived smooth category (v-stack and
enhanced-sheaf roadmaps); the geometric Hecke action on Bun_G and the results that need it ([FS]
Theorems IX.0.1 and IX.5.1; [DHKM1] Theorems 1.1–1.2, Corollary 1.3); the arithmetic GL_n
double-coset multiplication (ModularForms); geometric Satake (GeometricSatakeAndFusion); Plancherel
theory; Bushnell–Kutzko types beyond the Iwahori case; two-parahoric unitary operators, the Iwahori
and Klingen computations for GSp_4, the GL_2 newvector theorem and integral essential vectors.

Cited roadmaps: ReductiveGroupsPartII (RG2.0 point topology, RG2.1 valued root data, RG2.3
parahoric subgroups, RG2.4 decompositions and the modulus, RG2.5 the dual group), ReductiveGroups
(layers 3, 7, 9), ProfiniteCohomology (layers 0, 1, 7, 10), ProfiniteProPGroups (layer 1),
RepresentationTheory/InductionRestriction (layers 0, 3), ModularForms (layer 2), ClassFieldTheory
(layer 9) and LocalFieldsRamification (layer 4).

## Conventions

**Groups.** A locally profinite group is a Hausdorff topological group in which the compact open
subgroups form a neighbourhood basis of `1`. Reductive statements concern `G = 𝐆(F)` for `𝐆`
connected reductive over a nonarchimedean local field `F` with residue field of order `q = p^f`,
with the point topology of ReductiveGroupsPartII RG2.0; unit tests use `GL_n(ℚ_p)`.

**Coefficients.** `A` is any commutative ring. Averaging needs compact open subgroups of pro-order
invertible in `A` (for a locally pro-`p` group: `p ∈ Aˣ`). Normalised induction and Jacquet functors
need a chosen `q^{1/2} ∈ Aˣ`; the unnormalised functors exist always and are written `I_P`, `R_P`.
SR.3a, SR.3 and SR.2a are over ℂ; SR.1's Λ-linear centre, SR.5 and SR.6 have residue characteristic
`ℓ ≠ p`. Admissibility means finite generation over `A` of every compact-open invariant module.

**Measures and modulus.** An `A`-valued Haar measure is a finitely additive left-invariant function
on compact open subsets. The modulus `δ_P` of `P = MN` is the factor by which conjugation by
`p ∈ P` scales a Haar measure of `N`; it is Mathlib's modular character of `P`, so
`δ_B(diag(a, d)) = |a/d|_p` in `GL_2(ℚ_p)` and `δ_{P̄} = δ_P⁻¹` on `M`. Normalised induction is
`i_P σ = Ind_P^G(δ_P^{1/2} ⊗ σ)` and the normalised Jacquet functor `r_P V = δ_P^{−1/2} ⊗ V_N`.

**Hecke algebras.** `H(G, U; A)` acts on `V^U = Hom_G(A[G/U], V)` on the right. With `μ(U) = 1` the
convolution operator of `1_{UgU}` on `V^U` is `v ↦ Σ_{xU ⊆ UgU} ρ(x)v`, which is the right action of
`[Ug⁻¹U]`. The double coset `[UgU]` has degree `#(UgU/U)`. The integral Iwahori quadratic relation
is `(T_s + 1)(T_s − q_s) = 0`.

**Adjunctions and centres.** First adjointness is `r_P ⊣ i_P`; second adjointness is
`i_P ⊣ r_{P̄}`, in unnormalised terms `I_P ⊣ δ_P ⊗ R_{P̄}`. Compact induction from an open subgroup
is left adjoint to restriction; smooth induction from a closed subgroup is right adjoint. The
centre of a category is Mathlib's `CatCenter`.

**Satake and parameters.** The Weyl group is the relative Weyl group `W₀` of a maximal split torus,
with the Frobenius action on the dual group retained. Arithmetic Frobenius satisfies
`Fr s Fr⁻¹ = s^q`. The lattice `T(F)/T(F)⁰` is the character lattice of the dual torus via
`λ(ϖ) ↦ λ`, and an unramified character `θ` corresponds to `t_θ` with `λ(t_θ) = θ(λ(ϖ))`. One affine
scheme of crossed cocycles is chosen over `ℤ[1/p]`; every `ℤ_ℓ`-model is its base change.

**Names.** Lean names are relative to the namespace
`TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` of [Suggested.lean](Suggested.lean). The pinned
libraries are Mathlib `6b7abb3c76` and Tau Ceti `a91d3aaf`. Source locators give the theorem or
section and the printed page of the editions under *References*.

## Exact supplier contracts

| Object | Supplier | File |
| --- | --- | --- |
| Representations and their category | `Representation`, `Rep`, `Representation.stabilizer`, `Representation.dual` | `Mathlib/RepresentationTheory/Rep/Basic.lean`, `Mathlib/RepresentationTheory/Stabilizer.lean`, `Mathlib/RepresentationTheory/Basic.lean` |
| Full subcategories | `CategoryTheory.ObjectProperty.FullSubcategory`, `CategoryTheory.ObjectProperty.lift` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` |
| Invariants, coinvariants | `Representation.invariants`, `Rep.invariantsFunctor`, `Representation.Coinvariants`, `Rep.quotientToCoinvariantsFunctor` | `Mathlib/RepresentationTheory/Invariants.lean`, `Mathlib/RepresentationTheory/Coinvariants.lean` |
| Restriction, induction, coinduction | `Rep.resFunctor`, `Rep.indFunctor`, `Rep.indResAdjunction`, `Rep.coindFunctor`, `Rep.resCoindAdjunction` | `Mathlib/RepresentationTheory/Rep/Res.lean`, `Mathlib/RepresentationTheory/Induced.lean`, `Mathlib/RepresentationTheory/Coinduced.lean` |
| Grothendieck categories, derived categories, Ext | `CategoryTheory.IsGrothendieckAbelian`, `DerivedCategory`, `CategoryTheory.Abelian.Ext` | `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean`, `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` |
| Continuous cohomology | `continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` |
| Centre of a category | `CategoryTheory.CatCenter` | `Mathlib/CategoryTheory/Center/Basic.lean` |
| Modular character, compact opens | `MeasureTheory.Measure.modularCharacter`, `TopologicalSpace.CompactOpens` | `Mathlib/MeasureTheory/Group/ModularCharacter.lean`, `Mathlib/Topology/Sets/Compacts.lean` |
| Double-coset Hecke ring | `HeckeRing`, `IsHeckeTriple`; ring structure `HeckeCosetModule.instRingHeckeRing`; `HeckeCoset.heckeSum` | `Mathlib/NumberTheory/HeckeRing/Defs.lean`, `TauCeti/NumberTheory/HeckeRing/Associativity.lean`, `TauCeti/NumberTheory/HeckeRing/Representation.lean` |
| Finite-group averaging | `Representation.averageMap` | `Mathlib/RepresentationTheory/Invariants.lean` |
| Fitting decomposition | `LinearMap.eventually_isCompl_ker_pow_range_pow` | `Mathlib/RingTheory/Artinian/Module.lean` |
| Local fields, Witt vectors | `IsNonarchimedeanLocalField`, `WittVector` | `Mathlib/NumberTheory/LocalField/Basic.lean`, `Mathlib/RingTheory/WittVector/Defs.lean` |
| Character twists, base change | `Representation.charTwist`, `Representation.baseChange` | `TauCeti/RepresentationTheory/CharacterTwist.lean`, `TauCeti/RepresentationTheory/BaseChange.lean` |
| Discrete modules over profinite groups | `TauCeti.SmoothDiscreteTopRep`, `TauCeti.discreteRepEquivSmoothTopRep`, `TauCeti.iSup_fixedPoints_openNormal_eq_top` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean`, `TauCeti/Topology/Algebra/GroupAction/Discrete.lean` |
| Pro-`p` groups | `TauCeti.IsProP` | `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean` |
| Reductive groups of finite type | `TauCeti.FiniteTypeCommHopfAlgCat`, `TauCeti.reductiveCommHopfAlgProperty` | `TauCeti/Algebra/AlgebraicGroup/FiniteType/CommHopfAlgCat.lean`, `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` |
| Dynamic parabolic, Levi and unipotent subgroups | `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`, `TauCeti.Cocharacter.unipotent`, `TauCeti.Cocharacter.limitToLevi` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`, `TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean` |
| Point topology on `𝐆(F)` | `PointTopology.instTopologicalSpaceWithConv`, `PointTopology.instIsTopologicalGroupLocal`, `PointTopology.instLocallyCompactSpaceLocal` | `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` |

## How to read the build

`README.md` fixes the hypotheses and conclusions of the targets; `Suggested.lean` states the
targets that are statable against the pins, with proof placeholders, and each such target carries a
*Lean:* line below. The layers depend on one another in the order SR.0 → SR.1 → SR.0d → SR.2 →
SR.3a → SR.3 → SR.2a → SR.4 → SR.5 → SR.6. SR.0d follows SR.1 because the derived Hecke algebra
extends the permutation-module Hecke algebra; SR.2a follows SR.3a and SR.3 because Bernstein's
stabilisation theorem uses uniform admissibility, the Bernstein decomposition, noetherianity and
generic irreducibility, while SR.3 uses nothing from SR.2a. SR.4 uses SR.1 and SR.2, SR.5 uses
SR.3, and SR.6 uses SR.0–SR.3, SR.2a and SR.4.

## Layer SR.0: the smooth category and its basic API

A is a commutative ring and G a topological group, locally profinite wherever compact open subgroups
U occur; smooth representations form an abelian, coreflective full subcategory of `Rep A G`.

### SR.0.1 Locally profinite groups and smoothness

**Compact open subgroups form a neighbourhood basis.** A Hausdorff topological group G is locally
compact and totally disconnected iff it is locally compact and a `NonarchimedeanGroup` iff every
neighbourhood of 1 contains a compact open subgroup (G is then locally profinite). Then open
subgroups in a compact neighbourhood of 1 are compact, compact open subgroups are profinite, and
those in a given one form a directed cofinal family ([Ber92] Ch. I §1.1, Definition 1, p. 7).
*Lean:* `exists_compactOpenSubgroup_le`.

**Smooth representations.** A representation ρ of G on an A-module V (no topology) is smooth if
every v ∈ V has open stabiliser, hence is fixed by a compact open U, so V = ⋃_U V^U;
subrepresentations and quotients stay smooth ([Ber92] Ch. I Definition 2, Proposition 1, p. 7).
*Checks:* for G = ℤ_p, ℤ[ℤ_p ⧸ p^n ℤ_p] is smooth but the regular representation ℤ[ℤ_p] is not.
*Lean:* `Representation.IsSmooth`.

**Smooth vectors and the smooth part functor.** Vectors with open stabiliser in a representation V
form a smooth subrepresentation V^∞ = ⋃_U V^U, which is V iff V is smooth; V ↦ V^∞ is right adjoint
to the inclusion (counit V^∞ ↪ V) ([Ber92] Ch. I §1.1, Definition 2, Proposition 1, p. 7).
*Checks:* for G = ℤ_p, ℤ[ℤ_p]^∞ = 0 and ∏_n ℤ[ℤ_p ⧸ p^n ℤ_p] is not smooth.
*Lean:* `Representation.smoothVectors`, `SmoothRep.smoothPart`,
`SmoothRep.nonempty_smoothPartAdjunction`.

### SR.0.2 The abelian category and the discrete comparison

**The category of smooth representations.** SmoothRep A G is the full A-linear subcategory of Rep A
G on the smooth representations ([Ber92] Ch. I §2, p. 11).
*Checks:* for G = ℤ_p a discontinuous ℚ-linear map ℚ_p → ℚ gives a non-smooth self-extension of ℚ.
*Lean:* `SmoothRep`, `SmoothRep.ι`.

**Smooth representations form an abelian category.** SmoothRep A G is abelian, with kernels,
cokernels and colimits computed in Rep A G and limits the smooth parts of limits; monos and epis are
the injective and surjective maps, but it is not closed under extensions ([Ber87] §1.1, p. 3).
*Lean:* `SmoothRep.instAbelian`.

**Smooth representations as discrete continuous representations.** For discrete A, discrete
topologies give SmoothRep A G ≃ `TauCeti.SmoothDiscreteTopRep` over A-modules (discrete `TopRep`s;
open stabilisers ⇔ joint continuity) ([Ber92] Ch. I §1.3, Important Example and Fact, p. 10).

### SR.0.3 Compact open invariants and averaging

**Invariants under compact open subgroups.** Over any A, V ↦ V^U is a left exact A-linear functor to
A-modules, antitone in U, with ρ(g)V^U = V^{gUg⁻¹} and V^U = (V^{U'})^{U/U'} for open U' ⊴ U; V is
smooth iff V = ⨆ V^U over any compact open basis ([Ber92] Ch. I §2.2, Proposition 6(1), p. 14).
*Lean:* `SmoothRep.invariantsFunctor`.

**Profinite groups of invertible pro-order.** Compact U has invertible pro-order in A if #(U/N) ∈ Aˣ
for all open normal N, equivalently [U : U'] ∈ Aˣ for all open U', or every prime of its
supernatural order is a unit. It passes to open subgroups, to closed subgroups of profinite groups
and along A → B, and holds for pro-p U if p ∈ Aˣ; for G non-discrete locally pro-p and A ≠ 0,
compact open subgroups of invertible pro-order form a basis at 1 iff p ∈ Aˣ ([Ber87] §1.3, p. 4).
*Checks:* ℤ_p has it iff p ∈ Aˣ; the circle has it over F_p but its closed subgroup μ_p does not.
*Lean:* `HasUnitProOrder`.

**The averaging projector onto U-invariants.** For U of invertible pro-order in A and V smooth, e_U
v = [U : U']⁻¹ Σ_{u ∈ U/U'} ρ(u)v, for any open U' ⊴ U fixing v, is independent of U', commutes with
U-equivariant maps, and is idempotent with image V^U and kernel spanned by the ρ(u)v − v, with e_U
e_{U'} = e_{U'} e_U = e_U for U' ≤ U ([Ber92] Ch. I §2.1, p. 11, Proposition 6(1), p. 14).

**Exactness of invariants for invertible pro-order.** For U of invertible pro-order in A, V ↦ V^U is
exact and commutes with filtered colimits, with V^U a natural A[U]-summand of V; for U = ℤ/p, A =
F_p it fails: F_p[U] → F_p is not onto on invariants ([Ber92] Ch. I §3.3, Proposition 10(2), p. 17).
*Lean:* `SmoothRep.preservesFiniteColimits_invariantsFunctor`.

### SR.0.4 Admissibility, characters, duals, coefficients and the centre

**Admissible representations.** Smooth V is admissible if all V^U are finitely generated over A. A
neighbourhood basis of U suffices if A is noetherian or all compact open U have invertible
pro-order; finite sums are admissible, so are subrepresentations (A noetherian) and quotients
(pro-order hypothesis) ([Cas95] §0, (a)–(b), p. 2).
*Checks:* ℚ[ℚ_p ⧸ ℤ_p] is smooth but not admissible; the trivial action of ℤ_p on ℚ^{(ℕ)} is not
admissible, while on ℚ_p^ℕ, which has no compact open subgroup, the condition is vacuous.
*Lean:* `Representation.IsAdmissible`.

**Finitely generated and locally admissible representations.** Smooth V is finitely generated if so
over A[G], locally admissible if each A[G]v is admissible. For A noetherian, admissible ⇒ locally
admissible, and finitely generated + locally admissible ⇒ admissible if compact open subgroups have
invertible pro-order; neither admissible nor finitely generated implies the other ([CG18-arXiv] v2
Definition 9.11, p. 91; §9.2.2, p. 94).
*Checks:* ⊕_n χ_n, χ_n : ℤ_p → ℚ(μ_{p^∞})ˣ of conductor p^n, is admissible, not finitely generated.

**Smooth characters and twists.** A smooth character is χ : G →* Aˣ with open kernel, equivalently
A(χ) is smooth, or χ is continuous for discrete Aˣ; they form a group. The twist V ↦ V ⊗ χ (same
module, action χ(g)ρ(g)) is an exact autoequivalence of SmoothRep A G, multiplicative in χ up to
isomorphism, fixing V^U for U ≤ ker χ ([BZ76] Ch. I §1, 1.19, p. 11; §2, 2.25(c), p. 23).
*Checks:* x ↦ t^{v_p(x)} on ℚ_p^× is smooth for t ∈ Aˣ; x ↦ (1+p)^x into discrete ℤ_p^× is not.
*Lean:* `IsSmoothCharacter`, `SmoothRep.twistFunctor`.

**The smooth contragredient.** Ṽ = Hom_A(V, A)^∞ is contravariant in V, with Hom_G(V, W̃) ≅ Hom_G(W,
Ṽ) and a natural evaluation V → Ṽ̃. For U of invertible pro-order Ṽ^U ≅ Hom_A(V^U, A); over a field
where all compact open subgroups have invertible pro-order, V ↦ Ṽ is exact and V → Ṽ̃ is injective,
bijective iff V is admissible ([Ber92] Ch. I §2.2, Definition 8, Propositions 6–7, Lemma 5, p. 14).

**Change of coefficients.** For A → B, base change V ↦ B ⊗_A V : SmoothRep A G ⥤ SmoothRep B G is
left adjoint to restriction of scalars; B ⊗_A V^U → (B ⊗_A V)^U is an isomorphism if B is A-flat or
U has invertible pro-order in A, not in general. An automorphism σ of A gives an autoequivalence V ↦
A ⊗_{A,σ} V preserving admissibility and irreducibility ([Ber87] §2.0, Generalization, p. 9).
*Checks:* for U = ℤ/2 acting by sign on ℤ and B = F₂ the map is 0 → F₂.

**The centre of the smooth category.** Z(G, A) is Mathlib's `CatCenter` of SmoothRep A G, a
commutative A-algebra. Equality is tested on the A[G/U]; z_V restricts to subobjects and quotients,
and Z(G, A) acts compatibly from both sides on Hom_G(V, W) and Ext groups ([Ber87] §1.8, p. 8).
*Checks:* Z(G, A) is the centre of A[G] for finite discrete G, A[t, t⁻¹] for discrete ℤ, A a field.

### Examples

ℤ[ℤ_p ⧸ p^n ℤ_p] versus ℤ[ℤ_p]; ℚ[ℚ_p ⧸ ℤ_p], finitely generated, not admissible; the double-coset
basis of ℤ[GL_2(ℚ_p)/GL_2(ℤ_p)]^{GL_2(ℤ_p)}; failures of exact invariants and base change.

### Dependencies

Mathlib's `Representation`, `Rep`, invariants, averaging and `CatCenter`; Tau Ceti's discrete
carrier and profinite exhaustion; ProfiniteCohomology layers 0, 1; ProfiniteProPGroups layer 1.

## Layer SR.1: Hecke algebras over rings

Hecke algebras over a coefficient ring A, by convolution against an A-valued Haar measure and as
endomorphisms of permutation modules (defined over every A), and their presentations.

### SR.1.1 Functions, measures and convolution

**Locally constant compactly supported functions.** For an l-space X and an A-module M, every f ∈
C_c^∞(X, M) is a finite sum Σ m_i 1_{K_i} with K_i disjoint compact open, and any two such
expansions have a common refinement; on G every such f is bi-invariant under some compact open K,
and the right U-invariant ones are the finitely supported functions on G/U ([Ber92] Ch. I §1.1–1.2,
Lemma 1, pp. 7–8).

**The open–closed exact sequence.** For an l-space X ⊇ U open, Z = X ∖ U, 0 → C_c^∞(U, M) → C_c^∞(X,
M) → C_c^∞(Z, M) → 0 is exact, of smooth G-modules if G acts continuously preserving U; finite open
filtrations have the C_c^∞ of strata as subquotients ([Ber92] Ch. I §1.2, Prop. 2, p. 8).

**Haar measures with values in a ring.** For U₀ compact open of invertible pro-order, a unique
A-valued Haar measure has μ(U₀) = 1: μ(U) = [U : U ∩ U₀][U₀ : U ∩ U₀]⁻¹ is a unit iff U has
invertible pro-order, in ℤ[1/p] if U₀ is pro-p, haar(U)/haar(U₀) over ℝ ([He18] §1.2, pp. 6–7).
*Checks:* μ(p^n ℤ_p) = p^{−n} (n ∈ ℤ) on ℚ_p over ℤ[1/p]; no F_p-valued μ on ℤ_p has μ(ℤ_p) = 1.
*Lean:* `HaarMeasureWithValues`, `HaarMeasureWithValues.existsUnique_vol_eq_one`.

**Finite-sum integration.** For G Hausdorff, μ any A-valued Haar measure and M any A-module, ∫ f dμ
= Σ μ(U) • m_U for f = Σ m_U 1_U (compact open U, overlaps allowed) is well defined, A-linear and
natural in M, and products μ(U)ν(V) satisfy Fubini in both orders ([BH06] §3.2, pp. 28–29, over ℂ).

**The Hecke algebra of a locally profinite group.** For normalised μ, H(G, A) = C_c^∞(G, A) with (f₁
∗ f₂)(x) = ∫ f₁(y)f₂(y⁻¹x) dμ(y) is an associative A-algebra, unital iff G is discrete (A ≠ 0);
supp(f₁ ∗ f₂) ⊆ supp f₁ · supp f₂, f₁ (f₂) passes on left (right) U-invariance, 1_U ∗ 1_U = μ(U)1_U,
f^∨(g) = f(g⁻¹)Δ(g⁻¹) (Δ modular) is an anti-automorphism, cμ rescales ∗, H(G, A) ⊗_A B ≅ H(G, B)
([Ber92] Ch. I §2.1, Thm. 2, pp. 11–12).

**Normalised idempotents.** If μ(U) ∈ Aˣ, the idempotent e_U = μ(U)⁻¹1_U averages smooth V onto V^U,
e_U e_{U'} = e_{U'} e_U = e_U (U' ≤ U), e_U H (H e_U) = {left (right) U-invariant f}, H(G, A) = ⋃
e_U H e_U (unital corners) for cofinal such U; else only 1_U exists ([Ber92] Ch. I §2.1, pp. 11–12).

### SR.1.2 Level algebras and the double-coset ring

**Hecke algebras of permutation modules.** For a discrete G-set S with compact open stabilisers,
invariant kernels h : S × S → A supported on finitely many orbits form an algebra under the matrix
product, equal to End_G(A[S]) via h·s = Σ_t h(t, s)t if S/G is finite. For U compact open, H(G, U;
A) (S = G/U) has basis [UgU] and acts on V^U = Hom_G(A[G/U], V); for U' ≤ U, inclusion and trace tr
= Σ_{U/U'} ρ(u) come from G-maps, tr ∘ incl = [U : U'], incl ∘ tr = Σ_{U/U'} ρ(u) if U' ⊴ U, and
[UgU] ↦ [Ug⁻¹U] is an anti-involution ([TV] §2.10, pp. 187–188).
*Checks:* [U diag(p, 1) U] is p + 1 cosets for U = GL_2(ℤ_p); H(G, U; A) ≅ A[G/U] for U normal in G.
*Lean:* `HeckeAlgebraLevel`.

**Comparison with the double-coset Hecke ring.** For U compact open, [UgU] ↦ UgU is an A-algebra
isomorphism of H(G, U; A) with Mathlib's `HeckeRing ⊤ U A`. If μ(U) = 1, 1_{UgU} ↦ [UgU] identifies
e_U H(G, A) e_U with H(G, U; A), and 1_{UgU} ∗ 1_{UhU} = Σ_D m(UgU, UhU; D)1_D (Shimura's
multiplicities); both respect base change and invariants ([He18] §1.2, p. 7, (a); §4.1, p. 15).
*Checks:* for G = ℤ and U = 0 the basis element [U1U] sends δ_0 to δ_{−1}, so [UgU] acts on V^U as
the convolution operator of 1_{Ug⁻¹U}.
*Lean:* `HeckeAlgebraLevel.exists_ringEquiv_heckeRing`.

### SR.1.3 Smooth representations as Hecke modules

**Idempotented algebras and nondegenerate modules.** A non-unital A-algebra H is idempotented if
each finite subset lies in some eHe, e² = e; nondegenerate (HM = M) modules form a full abelian
subcategory closed under subquotients, sums and exact filtered colimits, with products the
nondegenerate parts, centre the bimodule endomorphisms of H, and Hom_H(He, M) ≅ eM, so the He are
finitely generated projective generators ([Ber87] §1.1–1.2, §1.8, pp. 3–4, 8).

**Smooth representations as nondegenerate Hecke modules.** If G has cofinally many compact open
subgroups of pro-order invertible in A, V ↦ (V, f·v) is an A-linear equivalence of SmoothRep A G
with nondegenerate H(G, A)-modules, V^U = e_U V, inverse g·m = μ(U)⁻¹1_{gU}·m on e_U M, respecting
base change and centres (not for F_p, p-adic G; [Ber92] Ch. I §2.1, Thm. 2, Lemma 4, pp. 12–13).

**Hecke corners and irreducible representations.** If μ(U) ∈ Aˣ, V ↦ V^U ∈ Mod-H(G, U; A) is exact
with left adjoint H(G, A)e_U ⊗_{e_U H e_U} − and invertible unit. Over a field k, V^U is 0 or simple
for irreducible V, a bijection from irreducibles with V^U ≠ 0 to simple H(G, U; k)-modules, an
equivalence on the U-generated factor if U splits the category ([Ber92] Ch. I §4.2, Lemma 7, p. 19).

**The Λ-linear Bernstein centre via Hecke corners.** For a cofinal set 𝒦 of compact open subgroups
of pro-order invertible in Λ, restriction to Λ[G/K] identifies the centre Z(G, Λ) of SmoothRep Λ G
with lim_{K ∈ 𝒦} Z(H(G, K; Λ)) (transitions z ↦ e_K z), compatibly with Λ → Λ'; for G abelian, lim_K
Λ[G/K]. For Λ over ℤ_ℓ[√q], ℓ ≠ p, this is [FS]'s centre (Def. I.9.2(i), p. 34; §IX.6.4, p. 333).

**ℓ-adic separatedness of the Bernstein centre.** For Λ = ℤ_ℓ[√q] (or any noetherian ℓ-adically
separated domain), ℓ ≠ p, and G locally pro-p, H(G, K; Λ) (K open pro-p) and Z(G, Λ) are ℓ-adically
separated: ⋂_n ℓ^n Z(G, Λ) = 0 ([FS] proofs of Thm. IX.7.2, Cor. IX.7.3, pp. 335–337).

### SR.1.4 Iwahori decompositions and positive Hecke algebras

**Iwahori decompositions and positive elements.** For G connected reductive over F, opposite
parabolics P = MN, P̄ = MN̄ of G(F), U compact open and U_X = U ∩ X: U has an Iwahori decomposition
if U = U_{N̄}U_MU_N = U_NU_MU_{N̄} with unique factorisations; Δ_M⁺ = {m : mU_N m⁻¹ ⊆ U_N,
m⁻¹U_{N̄}m ⊆ U_{N̄}} ⊇ U_M, Δ⁺ = U_N Δ_M⁺ U_{N̄}; z ∈ Z(M) ∩ Δ_M⁺ is strongly positive if for all
open H₁, H₂ ≤ U_N, K₁, K₂ ≤ U_{N̄} some n, m ≥ 0 give z^n H₁ z^{−n} ⊆ H₂, z^{−m} K₁ z^m ⊆ K₂ ([ACC]
§2.1.9, after Lemma 2.1.12, p. 914).

**The positive Hecke monoid homomorphism.** For Iwahori-decomposed U and H(Δ_M⁺, U_M), H(Δ⁺, U) the
ℤ-spans of [U_M m U_M] (m ∈ Δ_M⁺), [UδU] (δ ∈ Δ⁺): UmUm'U = UmU_M m'U (m, m' ∈ Δ_M⁺), t : [U_M m
U_M] ↦ [UmU] is an injective ring map, and t ∘ 𝒮, 𝒮 ∘ t (𝒮 = r_M ∘ r_P) scale basis elements by
|δ_P(m)|⁻¹ = #(U_N/mU_N m⁻¹). For split G, M = T, U = K_p, t ↦ [K_p t K_p] on ℤ[T⁺/T_{K_p}] has
commutative image; both contraction conditions are needed ([ACC] §2.1.9, Lemma 2.1.12 ff., p. 914).

**Localisation at a strongly positive element.** For z strongly positive and a ring R with q ∈ Rˣ,
[UzU] ∈ (H(G, U) ⊗ R)ˣ: [U_M z U_M] is a central unit of H(M, U_M; ℤ), H(Δ_M⁺, U_M)[[U_M z U_M]⁻¹] =
H(M, U_M; ℤ), and t ⊗ R, 𝒮 ⊗ R extend uniquely to isomorphisms H(M, U_M) ⊗ R ≅ (H(Δ⁺, U) ⊗
R)[[UzU]⁻¹], inverse up to a |δ_P|-twist ([ACC] §2.1.9, Lemma 2.1.13, p. 915).

**The torus inside the pro-p Iwahori Hecke algebra.** For G split reductive over O_v (residue field
k(v), char. p), Iw ⊇ Iw₁ the preimages of B(k(v)) ⊇ U(k(v)), O = O_E, E/ℚ_ℓ finite (ℓ > 2) with
q_v^{1/2} ∈ O, H₁ = O[Iw₁\G(F_v)/Iw₁]: x ↦ [Iw₁xIw₁] is multiplicative on T(F_v)⁺ = {t : α(t) ∈ O_v,
α simple} into H₁[1/p]ˣ (H₁ˣ if p ∈ Oˣ), and xy⁻¹ ↦ δ_B^{1/2}(xy⁻¹)[Iw₁xIw₁][Iw₁yIw₁]⁻¹ is a
homomorphism T(F_v) → H₁[1/p]ˣ with kernel ker(T(O_v) → T(k(v))); for Iw, O[X_*(T)][1/p] embeds
([BCGP] §2.4.1, Prop. 2.4.2 and after 2.4.4, pp. 174–176; their p is our ℓ).

**The positive Klingen Hecke algebra of GSp_4.** For J = (0 A; −A 0), A = antidiag(1, 1), GSp_4(ℚ_ℓ)
= {g : gᵀJg = ν(g)J} (diag(a, b, c, d) ∈ GSp_4 iff ad = bc) and Kli(ℓ) ⊆ GSp_4(ℤ_ℓ) the Klingen
parahoric fixing F_ℓe₁ mod ℓ, U₀, U₁, U₂ = [Kli t Kli] for t = ℓ, diag(ℓ², ℓ, ℓ, 1), diag(ℓ, ℓ, 1,
1) generate a polynomial ring in H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ) (no U₀⁻¹) ([Pil] §5.1.4, p. 21).

### SR.1.5 Presentations of the Iwahori–Hecke algebra

**The Iwahori–Matsumoto presentation.** For G split reductive over F, I Iwahori and W̃ =
N_G(T)(F)/T(O_F) = W_aff ⋊ Ω (W_aff Coxeter on S_aff, ℓ(Ω) = 0): G = ⊔_{w ∈ W̃} IwI, [IwI : I] =
q^{ℓ(w)}, and H(G, I; ℤ) is free on T_w = [IwI], presented by T_wT_{w'} = T_{ww'} if ℓ(ww') = ℓ(w) +
ℓ(w'), (T_s − q)(T_s + 1) = 0 (s ∈ S_aff), T_ωT_w = T_{ωw} (ω ∈ Ω); over A, T_w is a unit if q ∈ Aˣ,
and H(G, I; A) ≅ A[W̃] if q = 1 ([IM65] Prop. 2.8, Thm. 2.16, pp. 33–36; §3, pp. 44–47).

**The Bernstein presentation.** For G split, A ∋ q^{±1/2}, θ_λ = q^{−ℓ(λ)/2}T_{λ(ϖ)} (λ dominant)
and θ_{λ−μ} = θ_λθ_μ⁻¹: θ : A[X_*(T)] → H(G, I; A) is an injective algebra map, A[X_*(T)] ⊗_A H(K,
I; A) ≅ H(G, I; A) by multiplication (K = G(O_F), basis T_w, w ∈ W), and for simple s = s_α, T_sθ_λ
− θ_{s(λ)}T_s = (q − 1)(θ_λ − θ_{s(λ)})/(1 − θ_{−α^∨}) ∈ A[X_*(T)] ([Lus89] 3.2–3.7, pp. 607–609).

**The centre of the Iwahori–Hecke algebra.** For G split, A = ℂ[v, v⁻¹]: Z(H(G, I; A)) =
θ(A[X_*(T)]^W), free on z_λ = Σ_{μ ∈ Wλ} θ_μ (λ dominant), H(G, I; A) is θ(A[X_*(T)])-free of rank
|W| ([Lus89] Prop. 3.11, §3.12, p. 610); for q = 1, Z(A[X_*(T) ⋊ W]) = A[X_*(T)]^W (W faithful).

### Examples

ℚ_p over ℤ[1/p]; finite groups, normal U; GL_2(ℚ_p) with GL_2(ℤ_p) and Iwahori; F_p, ℚ as negatives.

### Dependencies

SR.0; Mathlib's `LocallyConstant`, `haarMeasure`, `CatCenter`, `HeckeRing` (product from Tau Ceti);
ModularForms layer 2; ReductiveGroups layer 7; ReductiveGroupsPartII RG2.3, RG2.4.

## Layer SR.0d: the derived smooth category

SmoothRep A G is Grothendieck abelian, with unbounded derived category and dg enhancement; derived
invariants are continuous cohomology; permutation modules generate at invertible pro-order.

### SR.0d.1 The Grothendieck property and the derived category

**The smooth category is a Grothendieck category.** SmoothRep A G is Grothendieck abelian, so has
enough injectives: filtered colimits are exact and ⊕_{U ∈ 𝒰} A[G/U] generates for any compact open
basis 𝒰, as Hom_G(A[G/U], V) ≅ V^U. Restriction to compact open U preserves injectives, as its left
adjoint A[G] ⊗_{A[U]} − is exact and keeps smoothness ([Ber87] §1.1–1.2, pp. 3–4).
*Lean:* `SmoothRep.instIsGrothendieckAbelian`.

**The derived category of smooth representations.** D(G, A), D⁺(G, A), Ext^n_G are taken in
SmoothRep A G. For finite G, D(G, A) ≃ D(A[G]); for U open, restriction and algebraic induction are
exact adjoints on D(−) ([FS] Theorem V.1.1, p. 168, only for G locally pro-p, nA = 0, n prime to p).

**K-injective resolutions in Grothendieck categories.** Every unbounded complex X in a Grothendieck
abelian category is quasi-isomorphic to a K-injective complex I_X, so additive functors have total
right derived functors and RHom(X, Y) := HomComplex(X, I_Y) has H^n = Hom(X, Y[n]); for SmoothRep A
G this gives unbounded RΓ(U, −), equal on D⁺ to the bounded-below one ([Stacks] Tag 079P).

### SR.0d.2 Derived invariants, dg enhancement, generators, duality and the derived Hecke algebra

**Derived invariants and continuous cohomology.** RΓ(U, −) : D⁺(G, A) → D⁺(A), right derived from V
↦ V^U, is RHom_G(A[G/U], −), with natural H^i RΓ(U, V) ≅ H^i_cont(U, V) (V discrete); it commutes
with filtered colimits, is Γ(U, −) at invertible pro-order, and is RΓ(U/N, RΓ(N, −)) for closed N ⊴
U ([CG18-arXiv] Lemma 9.14, Remark 9.15, p. 92, only for a locally admissible block over O/ϖ^k).

**The dg enhancement of the derived smooth category.** K-injective smooth complexes form a dg
category with homotopy category D(G, A); RHom_G(V, W) := HomComplex(V, I_W) is functorial on D(G,
A)ᵒᵖ × D(G, A), with H^n ≅ Hom(V, W[n]) and RHom_G(A[G/U], −) ≅ RΓ(U, −) natural; forgetting,
restriction, RΓ and ⊗^L_A are dg or use K-flat/K-injective replacements ([Stacks] Tags 070Y, 079P).
*Checks:* for G finite RHom_G is RHom over A[G]; [ℤ →id ℤ]^{⊗2} has differential (x, y) ↦ x − y.

**Compact induction from pro-p subgroups generates the derived category.** For a cofinal family 𝒦 of
compact open subgroups of invertible pro-order in A (G locally pro-p: p ∈ Aˣ), the A[G/K], K ∈ 𝒦,
are projective, compact in D(G, A), and generate: V = 0 if all V^K are acyclic; their thick closure
consists of compact objects, all of them for ℤ_ℓ-algebras, ℓ ≠ p ([FS] Theorem I.5.1(iii), p. 24).

**Derived smooth duality and admissible complexes.** With 𝒦 as above, 𝔻 : D(G, A)ᵒᵖ → D(G, A) is the
right derived functor of V ↦ Hom_A(V, A)^∞, with Hom(B, 𝔻V) ≅ Hom(B ⊗^L_A V, A) naturally. V is
admissible if each V^K, K ∈ 𝒦, is perfect over A. Then 𝔻(V)^K ≅ RHom_A(V^K, A), so 𝔻 keeps
admissibility and V → 𝔻𝔻V is an isomorphism on admissible V, which over a field is V → Ṽ̃ on V[0]
([FS] Corollary V.1.4, pp. 170–171, for G locally pro-p, nA = 0, n prime to p).

**Central characters separate Ext groups.** If z ∈ Z(G, A) acts by a on V and b on W, a − b kills
Ext^*_G(V, W), so it is 0 if a − b ∈ Aˣ; for abelian locally profinite T and smooth χ, χ' with some
χ(t) − χ'(t) ∈ Aˣ, Ext^*_T(A(χ), A(χ')) = 0 ([CG18-arXiv] v2 §9.2.1, proof of Lemma 9.12, p. 91).

**The derived Hecke algebra.** For commutative S, H*(G, U; S) = Ext*_G(S[G/U], S[G/U]) is a graded
S-algebra under Yoneda product (Venkatesh's opposite convention), acting naturally on H*(U, V) =
Ext*_G(S[G/U], V) for smooth V; in degree 0 it is SR.1's *Hecke algebras of permutation modules*. By
Shapiro, H*(G, U; S) ≅ ⊕_{x ∈ U\G/U} H*(U ∩ xUx⁻¹, S) as graded S-modules, with product through
restriction, conjugation and corestriction. Ext*_G(S[G/U₁], S[G/U₂]) carries compatible actions of
H*(G, U₁; S) and H*(G, U₂; S) ([Ven-arXiv] §2.2, Definition 2.2, (21), p. 12; §2.3; §4.2, §4.4).

### Examples

ℤ_p with F_p-coefficients (Ext¹, H¹ one-dimensional, H² = 0); vanishing for F_ℓ, ℓ ≠ p, and at
invertible pro-order; RHom over A[G] for finite G; the non-admissible F_ℓ[ℚ_p/ℤ_p].

### Dependencies

SR.0, SR.1; Mathlib's Grothendieck, derived, K-injective, Ext API; ProfiniteCohomology layers 7, 10.

## Layer SR.2: induction, compact induction and Jacquet functors

Induction and Mackey theory; Jacquet functors, parabolic induction; Casselman and Whittaker theory.

### SR.2.1 Smooth and compact induction

**Smooth induction from a closed subgroup.** For H closed in a locally profinite G and (σ, W) smooth
on H over any A, Ind_H^G σ, the smooth part of Mathlib's `Representation.coind`, is the unnormalised
A-linear functor of f : G → W with f(hg) = σ(h)f(g), smooth under right translation. Evaluation at 1
is an H-surjection to σ, nonzero on each nonzero G-subrepresentation ([Cas95] Thm. 2.4.1(a)–(c), p.
26).
*Checks:* over ℤ, for H = 1 in ℤ_p, the indicator of a non-open set is coinduced but not in Ind.
*Lean:* `SmoothRep.res`, `SmoothRep.indFunctor`.

**Compact induction.** For H closed, c-Ind_H^G σ ⊆ Ind_H^G σ is the subfunctor of maps compactly
supported mod H (all for compact H\G); for H open, f ↦ Σ_{G/H} g ⊗ f(g⁻¹) identifies it naturally
with Mathlib's `Rep.ind`, so c-Ind_U^G A ≅ A[G/U], U compact open ([Cas95] Thm. 2.4.1(d), p. 26).
*Checks:* c-Ind_{ℤ_p}^{ℚ_p} A ≅ A[ℚ_p/ℤ_p]; for H = 0 in ℚ_p and A ≠ 0, the constant 1 lies in Ind
but not in c-Ind.
*Lean:* `SmoothRep.cIndFunctor`.

**Frobenius reciprocity for smooth induction.** For H closed, Res ⊣ Ind by evaluation at 1; c-Ind ⊣
Res for H open (Hom_G(A[G/U], π) ≅ π^U), but not always for closed H ([Cas95] Thm. 2.4.1(e), p. 26).
*Lean:* `SmoothRep.frobeniusReciprocity`, `SmoothRep.compactFrobeniusReciprocity`.

**Invariants of induced representations.** For H closed, K compact open and x over H\G/K, (Ind_H^G
σ)^K ≅ ∏_x σ^{H ∩ xKx⁻¹} and (c-Ind_H^G σ)^K ≅ ⊕_x σ^{H ∩ xKx⁻¹}; for P = MN parabolic and K with an
Iwahori decomposition, (Ind_P^G σ)^K ≅ ⊕_x σ^{pr_M(P ∩ xKx⁻¹)} ([Ber87] §2.3(vii), p. 11).

**Exactness of induction.** For H closed, c-Ind_H^G is exact and preserves sums; Ind_H^G is left
exact, preserves products, and is exact if H\G is compact or all compact open subgroups of H have
pro-order invertible in A; for H\G compact both keep admissibility ([BZ77] §1.9(a),(e), p. 445).

**Induction in stages.** For closed K ≤ H ≤ G, f ↦ (g ↦ f(g)(1)) gives (c-)Ind_H^G ∘ (c-)Ind_K^H ≅
(c-)Ind_K^G naturally, and c-Ind_H^G(σ ⊗ π|_H) ≅ c-Ind_H^G σ ⊗ π ([Cas95] Prop. 2.4.5, p. 28).

**Induced representations as sections over H\G.** For G countable at infinity and H closed, Ind_H^G
σ, c-Ind_H^G σ are the smooth and compactly supported sections of a G-equivariant l-sheaf 𝓕_σ on X =
H\G with stalk σ at H ∈ X, and σ ↦ 𝓕_σ is an equivalence onto these; for G'-stable open Y ⊆ X (G' ≤
G closed), Γ_c(Y, 𝓕_σ) ↪ c-Ind_H^G σ ↠ Γ_c(X∖Y, 𝓕_σ) is G'-exact ([BZ77] §5.10–5.14, pp. 463–465).

**The Mackey filtration.** For G countable at infinity, H, Q ≤ G closed with finitely many locally
closed Q-orbits Z₁, …, Z_k on H\G, each Z₁ ∪ … ∪ Z_i open, and representatives x_i, (c-Ind_H^G σ)|_Q
has a filtration, natural in σ, with F_i/F_{i−1} ≅ c-Ind_{Q ∩ x_i⁻¹Hx_i}^Q(σ(x_i · x_i⁻¹)) via f ↦
(q ↦ f(x_i q)); for H, Q open it splits (Mackey decomposition) ([BZ77] §5.1–5.2, pp. 459–460).

### SR.2.2 Jacquet functors and parabolic induction

**The modulus character and its square root.** For N ≤ G closed, a union of compact open subgroups,
normalised by m, mod_N(m) = [mN₀m⁻¹ : I]/[N₀ : I] ∈ ℚ_{>0} (N₀ ⊆ N compact open, I = mN₀m⁻¹ ∩ N₀),
the Haar-measure scaling of u ↦ mum⁻¹ on N, is multiplicative. For P = M ⋉ N parabolic and q⁻¹ ∈ A,
δ_P = mod_N : P → q^ℤ ⊆ Aˣ is a smooth character trivial on N, equal to |det Ad(p)|_{Lie N}|_F and
to Mathlib's `MeasureTheory.Measure.modularCharacter`; δ_P^{1/2} needs a choice of q^{1/2} ∈ Aˣ
([Cas95] §1.5, Lemma 1.5.1, p. 16; [BH06] §3.3, p. 29 uses the inverse, |d/a|_F at diag(a,d)).
*Checks:* in GL_2(ℚ_p), δ_B(diag(a, d)) = |a/d|_p, so δ_B(diag(ϖ, 1)) = q⁻¹; δ_G = 1.
*Lean:* `LeviDecomposition.modulusCharacter`, `LeviDecomposition.modulusCharacter_isSmooth`.

**The Jacquet module.** For P = M ⋉ N closed in G (continuous retraction P → M, kernel N) and V
smooth on P, V_N = V/V(N), V(N) = ⟨ρ(n)v − v⟩, is Mathlib's `Representation.Coinvariants` of V|_N,
with smooth M-action. Unnormalised, (−)_N is A-linear, right exact over any A, commutes with
colimits and base change, has (V_{N₂})_{N₁ ∩ M₂} ≅ V_{N₁} for P₁ ⊆ P₂, and keeps finite generation
if G = PK₀, K₀ compact; r_P V = δ_P^{−1/2} ⊗ V_N ([Cas95] §3.2, pp. 33–34; Thm. 3.3.1, p. 35; §4.4,
p. 45).
*Checks:* the trivial representation of GL_2(ℚ_p) has Jacquet module the trivial character of T.
*Lean:* `LeviDecomposition`, `LeviDecomposition.normal`, `SmoothRep.jacquetFunctor`.

**Jacquet's lemma and exactness of the Jacquet functor.** If N is an increasing union of compact
open N_i of pro-order invertible in A (unipotent radicals if p ∈ Aˣ), V(N) = ⋃_i ker e_{N_i} and
(−)_N is exact; for pro-p N in characteristic p it is not left exact ([Cas95] §3.2, pp. 33–34).

**Normalised parabolic induction.** For G reductive over F (or P\G compact) and P = M ⋉ N parabolic,
I_P = Ind_P^G ∘ infl over any A and i_P^G σ = Ind_P^G(δ_P^{1/2} ⊗ σ) if q^{±1/2} ∈ A; i_P^G is exact
(Ind = c-Ind), keeps admissibility, commutes with unramified twists and base change, and i_P^G ∘
i_{Q ∩ M}^M ≅ i_Q^G for Q ⊆ P ([Cas95] §3.1, p. 32).
*Lean:* `SmoothRep.parabolicInduction`.

**First adjointness.** For P = M ⋉ N closed in G, (−)_N ⊣ Ind_P^G, so r_P ⊣ i_P^G if q^{±1/2} ∈ A;
i_P^G keeps injectives if r_P is exact, r_P projectives if i_P^G is exact ([Cas95] Thm. 3.2.4, p.
34).
*Lean:* `SmoothRep.firstAdjointness`.

**Contragredients of induced representations.** For G unimodular and σ on closed H over a field k
with invertible pro-orders, ∮_{H\G}⟨f, f'⟩ gives (c-Ind_H^G σ)~ ≅ Ind_H^G(σ̃ ⊗ δ_H) and (i_P^G σ)~ ≅
i_P^G σ̃ naturally for P parabolic, q^{±1/2} ∈ k ([Cas95] Thm. 2.4.2, Cor. 2.4.3, pp. 27–28; Prop.
3.1.2, p. 32).

**The geometric lemma.** For G connected reductive over F, standard P = MN, Q = LV, W^{M,L} the
shortest representatives of W_L\W/W_M and σ smooth on M over ℂ (or A ∋ p⁻¹, q^{±1/2}), r_Q i_P σ has
a filtration, natural in σ, ordered by closure of Pw⁻¹Q (open orbits giving subfunctors), with
graded pieces i^L_{L ∩ wPw⁻¹}(w · r^M_{M ∩ w⁻¹Qw} σ), w ∈ W^{M,L}. For closed P = MU, Q = NV of an
l-group with finitely many Q-orbits on P\G, U, V unions of compact subgroups and [BZ77] 5.1(1)–(4),
r_V ∘ i_U is glued from functors indexed by orbits ([BZ77] Lem. 2.11–2.12, p. 448; Thm. 5.2, pp.
459–460).

**Jacquet modules of principal series.** For a Borel B = TU of quasi-split G, W the Weyl group and χ
: T → ℂˣ smooth, r_B(i_B χ) has graded pieces wχ, split for regular χ; each irreducible subquotient
π of i_B χ has r_B π ≠ 0, semisimplified a sub-sum of ⊕_w wχ, and embeds in some i_B(wχ); length(i_B
χ) ≤ |W| ([BZ77] Thm. 2.8, p. 448, Cor. 2.13(c), p. 449; unnormalised GL_2: [BH06] 9.3, pp. 63–64).

### SR.2.3 Pairings, canonical lifting, Iwahori invariants and Whittaker functionals

**Jacquet's lemma on invariants and canonical lifting.** For reductive G, K₀ = N̄₀M₀N₀ compact open,
Iwahori-decomposed for (P, P̄), V admissible over ℂ (or a field with invertible pro-orders) and
[K₀aK₀] = Σ_{x ∈ K₀aK₀/K₀} π(x), projection V^{K₀} → (V_N)^{M₀} is onto and intertwines [K₀aK₀] with
δ_P(a)⁻¹π_N(a) if a ∈ M, aN₀a⁻¹ ⊆ N₀; for a contracting enough, its kernel is the generalised kernel
of [K₀aK₀], and it maps [K₀aK₀]V^{K₀} (independent of a; they act invertibly on it) bijectively onto
(V_N)^{M₀}, inverse to Casselman's canonical lifting. Over R ∋ p⁻¹ it is onto for all smooth V if
[K₀aK₀] ∈ (H(G, K₀) ⊗ R)ˣ ([Cas95] Thms. 3.3.3–3.3.4, p. 35; 4.1.1–4.1.7, pp. 38–40).
*Checks:* for GL_1(ℚ_p), K₀ = ℤ_p^× and χ(p) = 2 the operator [K₀pK₀] is 2 = δ_P(p)⁻¹χ(p), while the
right action of [K₀pK₀] gives 1/2.

**Casselman's pairing for admissible representations.** For opposite P = MN, P̄ = MN̄ in reductive G
and V admissible over ℂ, a unique pairing V_N × (Ṽ)_{N̄} → ℂ has ⟨π(a)v, ṽ⟩ = ⟨π_N(a)u, ũ⟩_N (u, ũ
the images) for a in the ε-contracting part A⁻(ε) of the split centre of M, ε depending on v, ṽ; it
is M-invariant and nondegenerate: (V_N)~ ≅ (Ṽ)_{N̄}, r_{P̄}(Ṽ) ≅ (r_P V)~ ([Cas95] §4.2, pp. 40–42).

**Iwahori invariants and the Jacquet module.** For G connected reductive over F, a minimal parabolic
P = MN, an Iwahori B = N̄₀M₀N₀ in good position and V admissible over ℂ (or Ē), projection gives V^B
≅ (V_N)^{M₀}, with 1_{BmB} (m in the contracting cone M⁻) acting as meas(BmB)π_N(m) =
δ_P(m)⁻¹π_N(m). For split G and the pro-p Iwahori Iw₁ (over ℂ, or a field of characteristic ≠ p with
q^{1/2}) the same holds, normalised, with (V_N)^{T(O)₁} ([Cas80] §2, Props. 2.3–2.5, pp. 395–396;
[BCGP] §2.4.1).

**Generic characters and Whittaker functionals.** For G quasi-split over F, B = TU, A a field and ψ
: U → Aˣ smooth, ψ is generic if nontrivial on each simple root subgroup, and V is ψ-generic if
Hom_U(V, ψ) ≅ Hom_G(V, Ind_U^G ψ), dual to V_{U,ψ} = V/span{ρ(u)v − ψ(u)v}, is nonzero, depending
only on ψ's T(F)-orbit; c-Ind_U^G ψ is the Gelfand–Graev representation ([BZ77] §1.8, pp. 444–445).
For GL_2(F) over ℂ and ψ ≠ 1, an irreducible V has dim V_{U,ψ} = 1 and occurs once in Ind_U^G ψ if
dim V = ∞, V_{U,ψ} = 0 if dim V = 1 ([BH06] 36.1, p. 226); principal series have one-dimensional
Whittaker quotients (§36.2), a sum of two generic irreducibles a two-dimensional one.

### Examples

Running example GL_2(ℚ_p): f ∈ i_B(χ₁ ⊗ χ₂) has f((a b; 0 d)g) = χ₁(a)χ₂(d)|a/d|^{1/2}f(g).

### Dependencies

SR.0, SR.1, SR.0d; Mathlib's (co)induction, modular character, coinvariants; InductionRestriction
layers 0, 3; ProfiniteCohomology layer 0; ReductiveGroups layer 7; ReductiveGroupsPartII RG2.3–2.4.

## Layer SR.3a: early uniform admissibility

Compact and cuspidal representations, and admissibility of irreducibles uniformly in the level.

### SR.3a.1 Compact and cuspidal representations

**Compact representations.** For G unimodular, locally profinite and countable at infinity, smooth
complex V is compact if its matrix coefficients (equivalently all g ↦ e_K π(g⁻¹)v) have compact
support. Finitely generated compact V are admissible; an irreducible compact W has nonzero formal
degree and idempotents E_{W,K}, central in e_K H(G) e_K, not in H(G), equal to e_K on W and 0 on
other irreducibles; so {W} splits SmoothRep ℂ G, W is projective and injective, and compact
representations are semisimple ([Ber92] Ch. I §5, Thms. 6–8, pp. 22–26).

**Cuspidal representations.** For G = 𝐆(F) reductive, smooth V over any A is quasi-cuspidal if V_N =
0 for all proper F-parabolic P = MN (maximal standard P suffice), cuspidal if also finitely
generated, supercuspidal if also irreducible complex. Quasi-cuspidality is closed under
subquotients, extensions, direct sums and character twists, and holds iff Hom_G(V, i_P σ) = 0 for
all proper P and smooth σ ([Ber92] Defs. 14 and 16, pp. 34–36, p. 42).
*Checks:* every smooth representation of a torus is quasi-cuspidal; no i_B χ of GL_2(ℚ_p) is.

**Harish-Chandra's compactness theorem.** For G reductive and V smooth complex, equivalent: V is
quasi-cuspidal; each g ↦ e_K π(g⁻¹)v is compactly supported modulo Z(G); V|_{G°} is compact (G°
generated by compact subgroups); for admissible V, the same for all matrix coefficients of V (or Ṽ).
So irreducible cuspidals are admissible ([Ber92] Ch. II §1.3, Thm. 11, Corollary, pp. 34–37).

**Jacquet's subrepresentation theorem.** For G reductive, each irreducible smooth complex V embeds
in some i_P σ, σ irreducible cuspidal of M ([Ber92] Ch. II §1.3, Lemma 17, p. 37).

**Irreducible representations are admissible.** For G = 𝐆(F) reductive, every irreducible smooth
complex V is admissible; so End_G(V) = ℂ, V has a central character, Ṽ is irreducible with V ≅ Ṽ̃,
and V^K is 0 or a simple H(G, K; ℂ)-module. Schur's lemma needs no admissibility if G is locally
profinite with all G/K countable ([Ber92] Ch. II §1.3, Thm. 12, p. 37; Thm. 15; Ch. I §4.2).
*Lean:* `Points`, `isAdmissible_of_isIrreducible`.

**Compact-induction irreducibility criterion.** For G unimodular locally profinite, all G/U
countable, smooth complex irreducibles admissible, K ⊇ Z = Z(G) open, K/Z compact, ρ smooth
irreducible of K: if exactly K intertwines ρ, c-Ind_K^G ρ is irreducible and compact modulo Z
(cuspidal for GL_2(F)), else it has nonscalar endomorphisms ([BH06] 11.4, Remarks 1–2, pp. 80–81).

### SR.3a.2 Uniform admissibility

**The Hecke algebra decomposition.** For G reductive, K₀ special maximal compact, K ⊲ K₀ congruence
with Iwahori decompositions for standard parabolics (RG2.3), Λ = Z(F)/Z(F)₀ for the minimal Levi Z,
Λ⁺ its dominant cone (G = ⊔ K₀λK₀, RG2.4), and Λ_Z ⊆ Λ the finite-index image of Z(Z)(F), lifted as
a group: H(G, K; ℂ) = H₀DCH₀ with H₀ = H(K₀, K), D spanned by finitely many further double cosets
(set-theoretic lifts) and C = span{[KλK] : λ ∈ Λ_Z ∩ Λ⁺} commutative, finitely generated; lifts of
all Λ⁺ are not claimed to commute ([Ber92] Ch. II §1.1, Thm. 9, pp. 29–30; §2.1, Thm. 13).

**Dimension bound for commutative subalgebras.** For R ⊆ End(ℂ^m), m ≥ 1, commutative unital and
generated by l ≥ 1 elements, dim R ≤ m^{2 − 2^{1−l}} ([BZ76] Ch. II §4, Lemma 4.10, pp. 39–40).

**Uniform admissibility.** For G reductive and K compact open, some c(G, K) bounds dim V^K for all
irreducible smooth complex V (all simple H(G, K; ℂ)-modules); c = d^{2^l} works if H(G, K) =
Σ_{i,j≤d} u_i C v_j, C commutative on l generators ([Ber92] Ch. II §1.4, pp. 37–38).
*Lean:* `exists_finrank_invariants_le`.

**Finitely many cuspidal components at fixed level.** For G reductive and K compact open, one
compact Ω(G, K) ⊆ G° supports every K-bi-invariant coefficient e_K π(g⁻¹)ξ of every irreducible
cuspidal of G°, so finitely many irreducible cuspidals of G°, and cuspidal components of G, have
K-fixed vectors ([Ber92] Ch. II §1.4, Prop. 21, pp. 38–39; §2.2).

### Examples

T(F) (all quasi-cuspidal), i_B χ of GL_2(ℚ_p) (not), and the depth-zero supercuspidal of GL_2(ℚ_p).

### Dependencies

SR.0–SR.2; Mathlib (Schur, transcendence, Burnside); ReductiveGroups layer 7; RG2.0, RG2.3, RG2.4.

## Layer SR.3: admissible complex representations

Cuspidal support, Bernstein decomposition and centre, temperedness, Langlands data, Iwahori blocks.

### SR.3.1 Cuspidal support and finite length

**Unramified characters and the group G°.** For G reductive, G°, generated by compact subgroups, is
open normal, Λ(G) = G/G° is a lattice of rank the split rank of the centre, Z(G)G° has finite index,
and Ψ(G) = Hom(Λ(G), ℂ^×) is a torus of smooth characters with coordinate ring ℂ[Λ(G)], acting by
twisting ([Ber92] Ch. II §2.1, Prop. 22, p. 39). For M minimal, weakly unramified characters are
those trivial on M₁ = ker κ_M; M°/M₁ is the torsion of Ω_M = M(F)/M₁, so Ψ(M) is the identity
component of Hom(Ω_M, ℂ^×), all of it automatically only for split G ([Ros14] §§2.5–2.9, §3.2).
*Checks:* Ψ(ℚ_p^×) ≅ ℂ^× via χ ↦ χ(p); for the ramified norm-one torus of RG2, Ψ = 1 but Hom(Ω_M,
ℂ^×) has two elements.

**Finite length.** For G reductive, finitely generated admissible representations have finite length
(Howe), and i_P σ has finite length if σ does, at most |N_G(M)/M| for σ irreducible cuspidal
([Cas95] Cors. 6.3.7–6.3.8, Thm. 6.3.10, pp. 59–61; Cor. 7.2.3).
*Lean:* `isFiniteLength_of_isAdmissible`.

**Cuspidal support.** Cuspidal data of reductive G are G-classes of (M, σ), σ irreducible cuspidal
of a Levi M. Each irreducible V is a subquotient of i_P σ (any P ⊇ M) for a unique datum, its
cuspidal support scs(V); each datum supports finitely many irreducibles, each embedding in some
i_P(wσ), w ∈ N_G(M)/M ([Ber92] Ch. III §2.1, Thm. 18, Prop. 30, pp. 55–56).
*Checks:* the trivial and the Steinberg representation of GL_2(ℚ_p) both have support [T, |·|^{−1/2}
⊗ |·|^{1/2}].

**Generic irreducibility of induced representations.** For σ irreducible cuspidal of a Levi M of
reductive G, i_P(ψσ) is irreducible on a nonempty principal Zariski open of Ψ(M), where central z
act by scalars z(ψσ) regular in ψ ([Ber92] Ch. III §3.3, Lemma 35, p. 69; Ch. IV, Thm. 27).

### SR.3.2 The Bernstein decomposition and centre

**Inertial classes and Bernstein components.** Cuspidal data (M, σ), (M', σ') of reductive G are
inertially equivalent if gMg⁻¹ = M', gσ ≅ ψσ' (g ∈ G, ψ ∈ Ψ(M')), with classes s = [M, σ]_G ∈ B(G)
and inertial support the class of scs(V). D_s = Ψ(M)σ ≅ Ψ(M)/(finite stabiliser), W_s =
Stab_{N_G(M)/M}(D_s) is finite, Ω(G) = ⊔_s D_s/W_s, and Rep_s(G) holds the V whose irreducible
subquotients have inertial support s ([Ber92] Ch. II §3, Lemma 21, Def. 19, p. 44; Ch. III §2.1).

**Splitting off cuspidal components.** For G reductive, each cuspidal component D splits off:
SmoothRep ℂ G = ∏_D M(D) × M_ind. For D = Ψ(G)ρ, Π(D) = c-Ind_{G°}^G(ρ|_{G°}) ≅ ℂ[Λ(G)] ⊗ ρ is a
finitely generated projective generator of M(D), so M(D) ≃ modules over End(Π(D))ᵒᵖ, a twisted
crossed product of B = ℂ[Λ(G)] by the finite self-twist group: J_χ f = a_χ(f)J_χ, a_χ(f)(t) = f(χt),
J_χJ_ψ = c(χ, ψ)J_{χψ}, c a normalised 2-cocycle (arguments reversed by the opposite); B need not be
central ([Ber92] Ch. II §3, Props. 26–28, Thm. 17, pp. 44–49).

**The Bernstein decomposition.** For G reductive, SmoothRep ℂ G = ∏_{s∈B(G)} Rep_s(G): V = ⊕ V_s
naturally, V_s ∈ Rep_s(G) ([Ber92] Ch. III §2.2, Decomposition Theorem, pp. 58–59).

**Noetherianity.** For G reductive, SmoothRep ℂ G is locally noetherian and i_P, r_P preserve finite
generation ([Ber92] Ch. III §2.2, Lemma 29, Props. 32–33, pp. 59–61).
*Lean:* `isNoetherian_of_finite`.

**The Bernstein centre.** For G reductive, the centre Z(G) of SmoothRep ℂ G is ∏_s Z_s, Z_s ≅
ℂ[D_s]^{W_s}, so Z(G) = 𝒪(Ω(G)); z acts on i_P(π), π ∈ D_s, by z(π), on irreducible V by z(scs V),
and on ℂ[G/K] as in SR.1 ([BD84] Props. 1.15, 2.11, pp. 11, 21; Thm. 2.13).

**Finiteness of Hecke algebras over the centre.** For G reductive and K compact open, only finitely
many s have K-fixed vectors, finitely generated smooth V are Z(G)-admissible, H(G, K; ℂ) is finite
over Z(G)'s image, hence over its centre, a finitely generated ℂ-algebra, and End of the s-part of
ℂ[G/K] is finite over Z_s ([BD84] §3.2, p. 25; Prop. 3.3, Cor. 3.4).

**The universal unramified twist.** For reductive G (construction over any A ∋ q^{±1/2}), P = MN, σ
smooth of M and tautological χ_univ : M → ℂ[Λ(M)]^×, the (G, ℂ[Λ(M)])-module i_P(σ ⊗ χ_univ)
specialises at ψ ∈ Ψ(M) to i_P(σ ⊗ ψ); for σ admissible its K-invariants are finitely generated
projective (free for the unramified principal series), compatibly with specialisation. For split G,
i_B(χ_univ) ≅ c-Ind_{T(O)N}^G 1 after transporting coefficients by [λ] ↦ [−λ]; HKP's untransported
action gives i_B(χ_univ⁻¹), with fibre i_B(χ⁻¹) at χ ([HKP] §§1.4–1.5, Lemma 1.6.1, pp. 2–3).

**Compatibilities of the Bernstein centre.** Inner automorphisms of reductive G fix Z(G) pointwise,
so Z(G) ≅ Z(G') from G ≅ G' depends only on its G'(F)-conjugacy class; for G = G₁ × G₂, irreducibles
are π₁ ⊠ π₂, B(G) = B(G₁) × B(G₂), Z_{(s₁,s₂)} ≅ Z_{s₁} ⊗ Z_{s₂} ([BD84] Thm. 2.13, p. 22).

### SR.3.3 Tempered representations and the conditional Langlands classification

**Square-integrable and tempered representations.** For G reductive, admissible complex V with
unitary central character ω is square-integrable modulo the centre if all |⟨ṽ, π(g)v⟩|² are
integrable on G/Z(G), and tempered if all exponents (characters of the split centres A_M in the r_P
V) have |χ| ≤ 1 on the negative cone (Casselman's criterion as definition). Irreducible
square-integrable V are unitary with a formal degree ([Cas95] §2.5, §4.4, §5.2.4–5.2.5, pp. 28–48).
*Checks:* the Steinberg representation of GL_2(ℚ_p) is square-integrable, a unitary i_B(χ₁ ⊗ χ₂) is
tempered, the trivial one is not.

**Casselman's criterion.** Admissible V with central character ω is square-integrable modulo the
centre iff ω is unitary and each exponent χ of r_P V, P = MN proper standard, has |χ| < 1 on closed
A_M⁻ off its compact-times-central part (A_Θ⁻ ∖ A_∅(𝒪)A_Δ in [Cas95], whose δ_∅^{−1/2} is δ_P^{−1/2}
on A_Θ); tempered replaces < by ≤. For irreducible π ⊆ i_{P_Θ} σ, σ irreducible cuspidal, testing
P_Ω (Ω associate to Θ) suffices (not for all V) ([Cas95] Thm. 4.4.6, p. 45; 6.5.1).

**Harish–Chandra tempered support.** For connected reductive G, each irreducible tempered complex
representation is a direct summand of i_P σ, σ irreducible square-integrable of a rational Levi M,
with (M, σ) unique up to G(F)-conjugacy; [Kon03] §2.4, Prop. 2.2, p. 390, assumes this.

**The conditional Langlands classification.** For G reductive (any char F), given *Harish–Chandra
tempered support*: for standard P = MN, irreducible tempered τ of M and ν ∈ a_P^{*,+} (open
chamber), with |χ_ν(m)| = q^{⟨ν, H_M(m)⟩}, q^{⟨χ, H_M(m)⟩} = |χ(m)|_F (so δ_P^{1/2} = χ_{ρ_P}),
i_P(τ ⊗ χ_ν) has a unique irreducible quotient J_P(τ, ν); every irreducible V is a J_P(τ, ν), (P, τ,
ν) unique up to W-conjugacy, and V is tempered iff P = G, ν = 0 ([Kon03] Thm. 3.5, p. 396).

### SR.3.4 The split Iwahori block and nonsplit components

**The Iwahori block.** For split connected reductive G with connected Iwahori I, I splits SmoothRep
ℂ G: I-generated representations form the block [T, 1], V ↦ V^I is an equivalence with H(G, I;
ℂ)-modules, irreducible V has V^I ≠ 0 iff it is a subquotient (equivalently a subobject) of an
unramified i_B χ ([Bor76] Thm. 4.10, Cor. 4.11, pp. 249–250, admissible case; [Ber87] §3).

**Connected-Iwahori components in general.** For reductive G, S maximal split, P ⊇ M = Z_G(S)
minimal, connected Iwahori I and M₁ = I ∩ M(F): characters of the finite group M°/M₁ extend to Ω_M
uniquely up to unramified twist, V ↦ V^I identifies the I-generated category with H(G, I;
ℂ)-modules, it is ∏ [M, η]_G over W(G, S)\Hom(M°/M₁, ℂ^×), its irreducibles embed in i_P η, η weakly
unramified, and the compact full fixer may not replace I ([Ros14] §§2.5–2.9, Lemma 3.2.1).

**The Steinberg representation.** For connected reductive G with minimal parabolic B, St_G =
C^∞(B\G)/Σ_{B⊊P} C^∞(P\G) is irreducible and square-integrable modulo the centre, r_B(St_G) ≅
δ_B^{1/2}, dim St_G^I = 1; for GL_2, 0 → 1 → Ind_B^G 1 → St → 0 (unnormalised) is exact, so St ⊆
i_B(δ_B^{1/2}) ([Cas95] Thm. 8.1.3, p. 70; [BH06] §9.10 uses the inverse module).

**Isotypic quotients of the regular representation.** For irreducible complex σ, admissible or G
reductive, f ↦ σ(f) maps C_c^∞(G) onto End(σ)^∞ ≅ σ ⊗ σ̃, equivariant for (a, b)·T = σ(a)Tσ(b⁻¹),
split if σ is compact (formal degree) ([Ber92] Ch. I §5.2, Prop. 13, Thm. 8, pp. 23–25).

### Examples

GL_2(ℚ_p): trivial and Steinberg (square-integrable) share cuspidal support, not Jacquet modules.

### Dependencies

SR.0–SR.3a; Mathlib's `CatCenter`; ReductiveGroups layer 7; RG2.0, RG2.1, RG2.4, norm-one tori.

## Layer SR.2a: second adjointness in characteristic zero

Bernstein's route over ℂ: a strictly dominant central element splits V^K for every smooth V.

### SR.2a.1 Stabilisation and the second adjunction

**Bernstein's stabilisation theorem.** Let G be reductive over F, coefficients ℂ, P, P̄ opposite
with Levi M, K = K₋K_MK₊ compact open in good position, a ∈ Z(M) strictly dominant for (P, P̄, K),
and h convolution by 1_{KaK} on V^K (the right action of [Ka⁻¹K]). For smooth V and n ≥ c(G, K) of
*Uniform admissibility*, V^K = V^K_0 ⊕ V^K_∗ with V^K_0 = ker hⁿ = V^K ∩ ker e_C and V^K_∗ = im hⁿ =
e_K e_{C̄}V (C ⊆ N, C̄ ⊆ N̄ large compact open), independent of n and a; h is invertible on V^K_∗,
and V^K → (V_N)^{K_M} has kernel V^K_0 and is bijective on V^K_∗ ([Ber87] §5.1–5.4, pp. 19–24).

**Jacquet's lemma for all smooth representations.** For P = MN, K in good position in reductive G,
smooth complex V, V^K → (V_N)^{K_M} is onto with a natural section onto V^K_∗ (Bernstein's canonical
lifting), independent of the dominant a and compatible as K shrinks ([Ber92] Ch. III §3.2, Jacquet's
Lemma (Final Version), p. 65).

**Jacquet modules of contragredients.** For smooth complex V and opposite P = MN, P̄ = MN̄ in
reductive G, a unique nondegenerate M-equivariant pairing (Ṽ)_{N̄} × V_N → ℂ has ⟨ṽ, π(aⁱ)v⟩ = ⟨p̄ṽ,
π_N(aⁱ)pv⟩ for i ≫ 0 (a strictly dominant central, p, p̄ the projections), so (Ṽ)_{N̄} ≅ (V_N)~,
r_{P̄}(Ṽ) ≅ (r_P V)~ naturally; for admissible V it is Casselman's pairing ([Ber87] §0.2, p. 2).

**Unit and counit of the second adjunction.** Over ℂ, for opposite P, P̄ in reductive G and Haar
measures on N, N̄, the unit η_τ : τ ↪ r_{P̄}(i_P τ) has image the functions supported in PN̄; the
counit i_P(r_{P̄}π) → π matches the identity via *Jacquet modules of contragredients*, *First
adjointness* and *Contragredients of induced representations* ([Ber92] Ch. III §3.1, p. 61;
Important Comment on Thm. 20, pp. 66–67).
*Checks:* for P = G the unit and counit are identities; for proper minimal P and τ ≠ 0, η_τ is not
invertible.

**Second adjointness.** For connected reductive G over F, opposite P = MN, P̄ = MN̄ (P = P(λ), P̄ =
P(λ⁻¹) for a cocharacter λ with centraliser M) and coefficients ℂ, i_P ⊣ r_{P̄}: Hom_G(i_P τ, π) ≅
Hom_M(τ, r_{P̄}π) naturally, with the above unit and counit; unnormalised, the right adjoint of
Ind_P^G ∘ infl is δ_P ⊗ (−)_{N̄}. So r_{P̄} preserves products, i_P projectives, and Hom_G(i_P τ,
π̃) ≅ Hom_M(τ, (r_P π)~) for admissible π, compatibly with Casselman's pairing ([Ber87] §0.1, p. 1).
*Lean:* `cocharacterDecomposition`, `oppositeCocharacter`, `levi_oppositeCocharacter`,
`oppositeDecomposition`, `instLocallyCompactSpaceParabolic`, `secondAdjointness`.

### Examples

For GL_2, η_χ identifies χ with the functions in i_B χ supported on BN̄ inside r_{B̄}(i_B χ).

### Dependencies

SR.0–SR.2, SR.3a and SR.3 (uniform admissibility, Bernstein decomposition, cuspidal splitting,
universal unramified twist, generic irreducibility, noetherianity); SR.3 uses nothing from SR.2a.

## Layer SR.4: spherical representations and Satake

Integral Satake for hyperspecial K; spherical parameters; GL_n, unitary, GSp_4 and derived variants.

### SR.4.1 The Satake transform and isomorphism

**Integral and normalized Satake transforms.** For 𝐆 unramified, K hyperspecial, P = TN minimal, Λ =
T(F)/T(F)⁰ and p invertible, S∗f(t) = ∫_N f(tn) dn, vol(N ∩ K) = 1, is finitely supported,
ℤ[q⁻¹]-valued, base-change compatible and sends 1_K to 1; on level-K operators its coefficient at m
is ∫_N f(KmnK) dn (no volume on G). Given q^{1/2}, S = δ_P^{1/2}S∗ ([TV] §7.2, pp. 206–207).

**The twisted relative Weyl action.** For Σ∗ the positive-root sum for P, as dual-torus
cocharacters, S∗f is fixed by w ∗ a = w(a)·((wΣ∗ − Σ∗)/2)(q), w ∈ W₀, integral as wΣ∗ − Σ∗ is even,
and Sf by W₀ ([TV] §7.2, (7.2.4)–(7.2.6), pp. 206–207). [TV] (2.9.2), p. 187, also uses [λ(ϖ)] ↦ λ,
but its twist ((Σ∗ − wΣ∗)/2)(q) ((7.2.1), p. 206) and α₀² = Σ∗(q) (§7.4(a)(i), p. 209) invert ours,
contradicting (7.2.5), (7.4.2), until transported by [λ] ↦ [−λ] on S∗, a ↦ a⁻¹ on points.
*Checks:* For GL_2, S∗(1_{K diag(ϖ,1) K}) = qX₁ + X₂ (X₁ the class of diag(ϖ,1), vol ϖ⁻¹O = q) is
fixed by the reflection twist (−α)(q), not the opposite one (q⁻¹X₁ + q²X₂), and S = q^{1/2}(X₁ + X₂)
is symmetric. In Lean at q = 3, TV's twist fixes the lattice-inverted version.

**Classical Satake isomorphism.** For q a unit, S∗ is an algebra isomorphism from the spherical
Hecke algebra onto the twisted W₀-invariants, and S (given q^{1/2}) onto the ordinary ones, via the
integral triangular orbit-sum basis, never inverting #W₀ ([TV] §7.2, pp. 206–207).

**Unramified torus characters.** Over k = k̄, p ∈ kˣ, for T split over an unramified extension,
T(F)/T(F)⁰ is the Frobenius-fixed cocharacter lattice and unramified characters are points of the
Frobenius-coinvariant dual torus (a point for the norm-one rank-one torus; [TV] §2.9, pp. 186–187).

**Twisted conjugation on the Frobenius component.** Restriction from Ĥ ⋊ Fr to the dual torus
identifies Ĥ-conjugation-invariant regular functions with Laurent functions on the Frobenius-fixed
lattice invariant under the Frobenius-fixed Weyl group (rings of [TV] §7.3); closed twisted orbits,
those meeting the torus, are the semisimple parameters ([TV] Lemma 7.3, pp. 207–209).

### SR.4.2 Spherical parameters

**Local pseudoroots.** A local pseudoroot is a dual-torus point a₀ with a₀² = Σ∗(q)⁻¹ fixed by the
twisted action (both required); translation by a₀ takes ordinary W₀-orbits to twisted ones. A chosen
q^{1/2} gives a₀ = t_{δ_P^{1/2}} = (Σ∗/2)(q)⁻¹, and Σ∗ = 2η the canonical η(q)⁻¹ ([TV] §7.4(a)–(b),
(7.4.2)–(7.4.4), pp. 209–210). TV's pseudoroot is our a₀⁻¹ (square and twist invert together).
*Checks:* For GL_2, q = 4, diag(1/2, 2) times the scalar 2 is twisted-fixed but fails the square.
*Lean:* `Pseudoroot`, `Pseudoroot.inv_iff`.

**Spherical eigencharacters and parameters.** Over k = k̄, char k ≠ p, spherical Hecke characters
correspond to semisimple unramified parameters: on the line Ind_P^G(θ)^K (unnormalized), f acts by
convolution as (S∗f)(t_θ), giving t_θa₀⁻¹ ⋊ Fr, and i_Pχ = Ind_P^G(χδ_P^{1/2}) gives t_χ ⋊ Fr; a
newform's pair at p is Tau Ceti's `HeckeRing.GL2.Newform.satakeParameters` ([TV] §7.5, pp. 210–211).

**Canonical c-group Satake formulation.** Over k = k̄, char k ≠ p, 2, the C-group (L-group ×
G_m)/⟨(Σ∗(−1), −1)⟩ maps to Γ × G_m by (g, γ, c) ↦ (γ, c²); the c-group is the preimage of c² =
cyclo(γ) (for PGL_2, det g = cyclo(γ) in GL_2 × Γ). Regular functions on its Frobenius fibre modulo
dual conjugacy give the Satake algebra canonically: changing q^{1/2} alters both identifications by
Σ∗(−1); char k may divide #G(k_F); char 2 keeps pseudoroots ([TVpre] Theorem 7.9, pp. 29–31).

### SR.4.3 The general linear group

**Explicit GL_n spherical generators.** On Mathlib's `HeckeRing` of integral matrices in GL_n(F),
localised at the scalar coset, S is an isomorphism onto symmetric Laurent polynomials with S([K
diag(ϖ, …, ϖ, 1, …, 1) K]) = q^{r(n−r)/2}e_r(X) (r entries ϖ) ([TV] Theorem 7.2, pp. 206–207).

**Hall–Littlewood spherical functions.** For dominant λ ∈ ℤⁿ, P_λ(X; t) = v_λ(t)⁻¹ Σ_{w∈S_n} w(X^λ
∏_{i<j}(X_i − tX_j)/(X_i − X_j)), v_λ the stabiliser Poincaré polynomial, is universally a symmetric
Laurent polynomial over ℤ[t], homogeneous of degree Σλ_i, so specialising (even at X_i = X_j or
v_λ(t) = 0) inverts no differences ([Les] proof of Lemma 3.2, p. 24); a field-valued rational
evaluation agrees for λ ≥ 0, characteristic 0, distinct X_i and v_λ ≠ 0.

**Macdonald formula for GL_n.** For GL_n(E), E/F unramified quadratic, q = #k_F (so q_E = q²):
S(1_λ) = q^{⟨λ,2ρ⟩}P_λ(X; q⁻²), by Hall–Littlewood branching ([Les] proof of Lemma 3.2, pp. 24–25).

**Spherical parabolic descent.** Over ℂ, for GL_n(E) as above, K = GL_n(O_E), M = GL_a(E) × GL_b(E),
P = MN, f^P(m) = δ_P(m)^{1/2}∫_N∫_K f(kmnk⁻¹) dk dn (vol(K) = vol(N ∩ K) = 1; δ_P via |·|_E, not the
|·|_F printed in [Les], p. 23) has compact support mod M ∩ K, S_M(f^P) = S_G(f)|_{dual Levi}, and
nested descents agree. [Les]'s ξ_{(a,b)} also twists by |det|_E^{b/2}, |det|_E^{a/2}: dual embedding
(m₁, m₂) ↦ diag(q^{−b}m₁, q^{−a}m₂) ([Les] Lemmas 3.1–3.2, pp. 23–25).

### SR.4.4 Unramified unitary groups

**Ordered unitary Satake parameters.** Over a ring L, an inert rank-N paired parameter is an ordered
tuple of units with α_iα_{N+1−i} = 1, middle entry 1 for odd N; P_α(T) = ∏(T − α_i) satisfies P_α(T)
= (−T)^N P_α(T⁻¹) and is invariant under permuting and inverting pairs. Reciprocal polynomials need
not split (T² − 3T + 1 over ℚ), so need not arise ([LTXZZ] Def. 3.1.3, Constr. 3.1.8, pp. 139–141).

**Polynomial unitary genericity predicates.** For P ∈ L[T] and any q: odd Tate genericity P'(1) ∈
Lˣ, odd intertwining P(−q) ∈ Lˣ, even level-raising specialness P(q) = 0, P'(q) ∈ Lˣ, even
intertwining P(−1) ∈ Lˣ. At rank N add q ∈ Lˣ, P monic, degree N, reciprocal with sign (−1)^N, N of
matching parity; all survive ring maps (rank N: to nonzero rings) ([LTXZZ] Def. 3.1.5, pp. 139–140).

**Unitary dual-group trace coordinates.** For GL_N ⋊ ⟨θ⟩, θ the pinned transpose-inverse, relative
Weyl invariants form the polynomial algebra on the elementary symmetric functions of μ_i =
x_i/x_{N+1−i} + x_{N+1−i}/x_i, and θ-extended ρ_{N,δ} = ∧^δ ⊗ (∧^δ)^∨ has Frobenius-component trace
Σ_{|I|=δ} ∏_{i∈I} x_i/x_{N+1−i} ([LTXZZ] Remark B.1.1, Lemmas B.1.2–B.1.4, pp. 332–334).

**Unitary minuscule triangular Satake matrix.** For 0 ≤ δ ≤ ⌊N/2⌋, q a unit and T_δ = [K t_δ K], t_δ
= (1^δ, 0^{N−2δ}, (−1)^δ), q^{δ(N−δ)}tr(ρ_{N,δ}) = Σ_{i=0}^{δ} [N−2i choose δ−i]_{−q} S(T_i),
unitriangular, Gaussian binomials at −q ([2 choose 1]_{−q} = 1 − q; [LTXZZ] Lemma B.2.6, p. 337).

**Mixed-level spherical product counts.** The product I of the two lattice correspondences (the
neighbour scales the first ⌊N/2⌋ basis vectors by ϖ⁻¹) has coefficient at T_δ the number of maximal
isotropic subspaces of a hermitian 𝔽_{q²}-space of dim N − 2δ: ∏_{i≤k}(q^{2i−1} + 1) for 2k and
∏_{i≤k}(q^{2i+1} + 1) for 2k + 1 ([LTXZZ] Def. B.2.3, Lemmas B.2.4, B.2.7–B.2.8, pp. 335–339).

**Even-rank unitary spherical identities.** For N = 2r ≥ 2, with R = Σ_δ c_{r−δ}T_δ, c_m =
Σ_{j<m}(−q)^j∏_{i≤m}(q^{2i−1} + 1), and T as in *Odd-rank unitary spherical identities*: S(I) =
q^{r²}∏_i(μ_i + 2), S((q+1)R − I) = −q^{r²}∏_i(μ_i − q − q⁻¹) and S(R + (q+1)T) = −q^{r²−1}(q² − 1)
Σ_j ∏_{i≠j}(μ_i − q − q⁻¹) ([LTXZZ] Lemmas B.3.1–B.3.4, Prop. B.3.5, pp. 339–343).

**Odd-rank unitary spherical identities.** For N = 2r + 1, q a unit, S(I) = q^{r²+r}∏_i(μ_i + q +
q⁻¹), S(T) = q^{r²+r}∏_i(μ_i − 2) for T = Σ_δ d_{r−δ,q}T_δ, d_{k,q} = Σ_{j=0}^{k} (−1)^j (2j+1)
q^{j(j+1)} [2k+1 choose k−j]_{−q}; even-rank T = Σ_δ d•_{r−δ,q}T_δ, d•_{k,q} = (d_{k,q} − Σ_{j≤k}
(−q)^j ∏_{i≤k}(q^{2i−1} + 1))/(q+1) ∈ ℤ[q] ([LTXZZ] Lemmas B.4.1–B.4.2, Prop. B.4.3, pp. 344–346).

### SR.4.5 GSp_4, derived Satake and comparisons

**The GSp_4 spherical spin polynomial.** For generators T₀ (scalar ϖ), T₁ (diag(ϖ², ϖ, ϖ, 1)), T₂
(diag(ϖ, ϖ, 1, 1)), keeping the similitude, let Q(X) = 1 − T₂X + q(T₁ + (q² + 1)T₀)X² − q³T₂T₀X³ +
q⁶T₀²X⁴, whose reciprocal roots pair as αδ = βγ = q³T₀. Then Q(0) = 1 and X⁴Q(1/X) has coefficients
1, −T₂, qT₁ + (q³ + q)T₀, −q³T₂T₀, q⁶T₀² ([Pil] §5.1.3–5.1.5, pp. 21–22).
*Checks:* (q, T₀, T₁, T₂) = (2,1,2,3) gives 1 − 3X + 14X² − 24X³ + 64X⁴, and (0,1,2,3) gives 1 − 3X.
*Lean:* `SpinPolynomial`, `SpinPolynomial.reciprocal`.

**GSp_4 spin and monic polynomial comparison.** Under the q^{−3/2} similitude twist, Q(X) =
∏_{ξ∈{α,β,γ,δ}}(1 − ξX) for the paired roots with the generator values of [Pil] Lemma 5.1.5.1, and
T_{x,1} = T₂, T_{x,2} = T₁, S_x = T₀ turns the reciprocal polynomial into Calegari–Geraghty's, a
local comparison only ([CG20-arXiv] Definition 6.7, p. 28; [Pil] Remark 5.1.5.1, p. 21).

**Derived Satake at Taylor–Wiles primes.** For split 𝐆, S = ℤ/ℓ^r, q ≡ 1 mod ℓ^r and ℓ ∤ #W, derived
spherical restriction is a graded algebra isomorphism for cup-convolution onto (S[Λ] ⊗ H*(T(k_F),
S))^W (W on both factors), classical Satake in degree zero, T(k_F) the prime-to-p quotient of the
maximal compact torus. The Iwahori-to-spherical Morita comparison holds only over the étale locus of
Spec S[Λ] → Spec S[Λ]^W ([Ven-arXiv] §3.2, Theorem 3.3, pp. 21–22; Lemmas 4.5, 4.7, pp. 28–31).

**Unitary Iwahori center comparison.** For F/ℚ_p finite, p odd, E/F ramified quadratic, G
quasi-split unitary of rank 2k + 1, K special, not hyperspecial, and B the full chamber stabiliser,
of index two over the connected Iwahori ([CT] §2.1): over ℂ, comparison with the split Sp_{2k}
Iwahori algebra gives centre ℂ[Λ]^W, acting on K-fixed vectors by normalized Satake ([CT] Prop. 2.2,
pp. 7–8). Indicator functions obey (T_s + 1)(T_s − q_s) = 0 (opposite sign on p. 7); integrally use
the positive braid monoid (braid group once q_s ∈ Aˣ), which alone gives no comparison beyond ℂ.

### Examples

GL_2 (S∗ = qX₁ + X₂, S = q^{1/2}(X₁ + X₂)); tori; Hall–Littlewood X^m, e_r; T² − 3T + 1 over ℚ.

### Dependencies

SR.1 (spherical Hecke algebra), SR.2 (induction), SR.0d (derived Satake); ModularForms layer 2;
ReductiveGroups layers 3, 7; ReductiveGroupsPartII RG2.1, RG2.4, RG2.5; ClassFieldTheory layer 9.

## Layer SR.5: integral local families for GL_n

Generic integral representation theory of GL_n(F) with ℓ ≠ p: derivatives, Whittaker models and
co-Whittaker families interpolating the local Langlands correspondence.

### SR.5.1 Derivatives

**Whittaker coinvariants.** For a representation ρ of a group U on an A-module V and ψ : U → Aˣ,
V_{U,ψ} = V/⟨ρ(u)v − ψ(u)v⟩ is the `Representation.Coinvariants` of ρ ⊗ ψ⁻¹; it is universal for f
with f(ρ(u)v) = ψ(u)f(v), and M ⊗_A V_{U,ψ} ≅ (M ⊗_A V)_{U,ψ} for all M ([EH] §3.1, pp. 12–15).
*Checks:* the sign character of (ℤ/6)ˣ on a trivial line gives A/(2) ≠ 0; a character value with
ψ(u) − 1 a unit gives 0.
*Lean:* `WhittakerCoinvariants`.

**Mirabolic functors and derivatives.** In SR.5.1, k is perfect of characteristic ℓ ≠ p, A is
Noetherian over W(k), and functors are [EH]'s unnormalised ones over W(k)[μ_{p^∞}]. On P_n =
GL_{n−1} ⋉ F^{n−1}: Ψ⁻ ⊣ Ψ⁺ (last-row coinvariants, inflation) and Φ⁺ ⊣ Φ⁻ ⊣ Φ̂⁺ (compact induction,
last-row ψ-coinvariants for ψ ≠ 1, smooth induction). D⁰ = Id and D^r = Ψ⁻(Φ⁻)^{r−1} commute with
Noetherian base change and ⊗_A, D^n = (−)_{U,ψ} for nondegenerate ψ, and the functors and composite
adjunction maps, unlike V → Φ⁻V, descend to W(k) ([EH] Def. 3.1.1, Rem. 3.1.2, p. 12; Prop. 3.1.4,
pp. 13–14).

**Exactness and mirabolic filtration.** Then Ψ^±, Φ⁻, Φ⁺, Φ̂⁺ and all D^r are exact, Ψ⁻Ψ⁺ = Id =
Φ⁻Φ⁺, Ψ⁻Φ⁺ = 0 = Φ⁻Ψ⁺, and 0 → Φ⁺Φ⁻ → Id → Ψ⁺Ψ⁻ → 0 is exact ([EH] Props. 3.1.3–3.1.4, pp. 12–14).

**Schwartz submodule.** For smooth V over P_n, J(V) ⊆ V is the image of the canonical injection
(Φ⁺)^{n−1}Ψ⁺(V^{(n)}) → V; J(V)^{(n)} = V^{(n)}, J commutes with ⊗_A, D^n gives End_{P_n}(J(V)) ≅
End_A(V^{(n)}), and J(V) = 0 if V^{(n)} = 0 ([EH] §3.1, p. 14; Prop. 3.1.16 proof, p. 17).

### SR.5.2 Integral blocks, Whittaker projectives and families

**Essentially AIG representations.** Over a field of characteristic ≠ p, smooth V is essentially AIG
if it is locally of finite length, its socle is AIG, i.e. absolutely irreducible (simple after any
field extension) and generic (V_{U,ψ} ≠ 0), and V/soc V has zero top derivative; for GL_n and
nondegenerate ψ its endomorphisms are scalars ([Hel12] Def. 3.3, Lemma 3.4, pp. 5–6).
*Checks:* zero and a sum of two generic simples are not essentially AIG; a trivial line is generic
for U = 1 and not for a nontrivial ψ.
*Lean:* `AbsolutelyIrreducible`, `IsGeneric`, `EssentiallyAIG`.

**Integral GL_n Bernstein blocks.** For k = k̄ of characteristic ℓ ≠ p, smooth W(k)[GL_n(F)]-modules
split by mod-ℓ inertial supercuspidal support; each block centre A_{[L,π]} is reduced,
ℓ-torsion-free and of finite type over W(k), its k-points classifying exact supercuspidal supports
of its simples ([Hel16] Def. 4.12, Thms. 11.8, 12.8–12.9, Cor. 12.12, pp. 13–14, 58, 67–69).

**Distinguished type projectives and their fibers.** For (K, τ) a maximal distinguished cuspidal
k-type, the compactly induced projective envelope has commutative End ring E, is E-admissible with
locally free rank-one top derivative, and has prime fibres with AIG cosocle and essentially AIG
smooth dual ([Hel12] Thm. 4.1, Props. 4.3, 4.8, Cor. 4.9, pp. 6–9).

**Universal block Whittaker projective.** For F p-adic, G = GL_n(F), k as above, ψ : U → W(k)ˣ
smooth nondegenerate on a Borel's unipotent radical, and W_{[L,π]} the [L, π]-summand of W =
c-Ind_U^G ψ, π supercuspidal over k: Hom_G(W_{[L,π]}, −) is the top derivative of the block part,
and W_{[L,π]} is projective and admissible over its block centre E = End_G(W_{[L,π]}), with
W_{[L,π]}^{(n)} ≅ E ([Hel12] §3, Lemma 3.2, pp. 4–5; Thm. 5.2, Prop. 5.3, pp. 10–11). Hom_G(W, V) is
a product over blocks, not V^{(n)} for V a sum of characters of GL_1(ℚ_p), p odd, from infinitely
many blocks.

**Co-Whittaker families.** For Noetherian A over W(k), a smooth A[G]-module V is co-Whittaker if it
is admissible, V^{(n)} ≅ A, and every fibre V ⊗_A κ(𝔞) has essentially AIG smooth dual (U upper
unitriangular, u ↦ ψ(Σ u_{i,i+1})); then A ≅ End_{A[G]}(V) ([Hel12] Def. 6.1, Prop. 6.2, p. 12).
*Checks:* the trivial line with U = 1 and ψ = 1 is co-Whittaker over every A; over a field an
admissible finite-length V qualifies iff dim V^{(n)} = 1 with AIG cosocle.
*Lean:* `whittakerUnipotent`, `genericCharacter`, `CoWhittaker`, `CoWhittaker.scalars`.

**Universal co-Whittaker domination.** For Noetherian A and A_{[L,π]} → A, W_{[L,π]} ⊗ A is
co-Whittaker and surjects onto every co-Whittaker A-family with that centre character; a quotient
need not be universal ([Hel12] Thm. 6.3, pp. 12–13).

**Reconstruction from minimal-prime fibers.** For A reduced Noetherian over the block centre and
nonzero generic-cosocle quotients V_𝔞 of the universal fibres at minimal primes, the diagonal image
of the universal family (or any co-Whittaker source) in ∏ V_𝔞 is co-Whittaker, A-torsion-free and
determined up to isomorphism by the V_𝔞 ([Hel12] Lemma 6.4, p. 13).

**Classical parameters and the generic convention.** A continuous ρ : G_F → GL_n(E), E/ℚ_ℓ complete,
has a Frobenius-semisimple WD parameter (r, N), r(w)Nr(w)⁻¹ = q^{deg w}N (arithmetic Frobenius of
degree 1), and (r, N)∨ = (r∨, −Nᵗ). In characteristic zero, local Langlands (uniformisers ↦
arithmetic Frobenius) has a generic-socle variant normalised by |det|^{−(n−1)/2}; the normalised
fibre (smooth dual of the generic-socle representation of ρ∨) has essentially AIG dual and the
expected supercuspidal support ([EH] Thm. 4.1.6, Def. 4.2.1, Cor. 4.3.3, pp. 26–27, 29–30, 32).

**Integral centre interpolation.** For A complete local reduced ℓ-torsion-free Noetherian over W(k),
residue field k, and continuous ρ : G_F → GL_n(A), a unique map z_ρ from the integral block centre
of ρ̄^{ss} to A gives at each characteristic-zero point the normalised fibre's centre character; it
is framing-independent and natural in A ([HM18] Conj. 7.1, Thms. 7.4–7.5, Cor. 7.7, pp. 1018–21).

**The local-Langlands family construction.** For F p-adic and A, ρ as above, π(ρ) is the
*Reconstruction from minimal-prime fibers* of the universal module base-changed along z_ρ at the
normalised fibres; in rank one it is g ↦ ρ(w), w over det g ([Hel12] Thms. 7.1, 7.8, pp. 13, 15–16).

### SR.5.3 Coefficient change, Ext and local blocks

**Endomorphisms after arbitrary coefficient tensoring.** For a co-Whittaker GL_n(F)-family V over
Noetherian A over W(k) and any A-module M, End_A(M) ≅ End_{A[G]}(M ⊗_A V) by f ↦ f ⊗ 1 ([Nak] Lemma
B.10, p. 274, for GL_2 with ℓ and p swapped; the Schwartz proof gives GL_n).

**Ext and exact supercuspidal support.** For irreducible admissible π, π′ of GL_n or a Levi over a
field of characteristic ≠ p, Ext^i(π, π′) ≠ 0 forces equal exact, not just inertial, supercuspidal
support: distinct unramified twists of a supercuspidal have no Ext ([EH] Thm. 3.2.13, Cor. 3.2.14,
pp. 21–22). Without √q, unnormalised supports differ by an integral power of the modulus ratio.

**The distinct-eigenvalue local block.** For A = O/ϖ^k, q ≡ 1 mod ℓ and distinct residual unramified
Frobenius eigenvalues, hence a unique irreducible unramified principal series π, locally admissible
representations with all irreducible subquotients π are equivalent to locally finite-length modules
over the completed ordered-character deformation algebra (per character, a pro-ℓ cyclic
residual-unit variable of order d, a formal unramified one) ([CG18-arXiv] Lemmas 9.9–9.10, p. 90;
Def. 9.11, Lemma 9.12, Cor. 9.13, p. 91).

**Derived hyperspecial–parahoric comparison.** In that block, restriction then the projector e_α to
a simple residual Frobenius root maps hyperspecial onto distinguished line-parahoric invariants
isomorphically, as on all right derived functors ([CG18-arXiv] Lemma 9.14, Rem. 9.15, Thm. 9.16, pp.
92–93).

**Characteristic-zero highest-derivative adapter.** In [AKY]'s multisegment convention
(characteristic zero, Zelevinsky labels, normalised derivatives), the highest nonzero derivative of
an irreducible π of GL_n is irreducible, obtained by lowering the upper endpoint of every segment;
Langlands labels need the Zelevinsky involution first ([AKY] §§1.2, 2.3, Lemma 2.9, pp. 3, 8–9, 14).

### Examples

GL_1 (J(V) = V); the trivial representation of GL_n, n ≥ 2 (D^n = 0); sums of two generic simples.

### Dependencies

SR.0–SR.4 (centre, Hecke corners, induction, cuspidal support); ClassFieldTheory layer 9.

## Layer SR.6: finite-wild parameters, center images and stability

Crossed cocycles of a finite-wild discrete Weil group, their scheme over ℤ[1/p] and its invariant
quotient, the excursion algebra, centre images and stable Hecke operators.

### SR.6.1 Finite-wild parameters

**Crossed cocycles and gauge action.** For Γ acting on a group H by α, a crossed cocycle is c : Γ →
H with c(γδ) = c(γ) α(γ)(c(δ)), and h ∈ H acts by (h·c)(γ) = h c(γ) α(γ)(h)⁻¹. Then c(1) = 1, gauge
is a left action functorial in H, and γ ↦ (c(γ), γ) is a homomorphism to H ⋊ Γ, gauge by h being
conjugation by (h, 1); geometric parameters are (c(Fr) ⋊ Fr)⁻¹ ([DHKM2] §1.2, §2.1, pp. 4–6, 10).
*Checks:* for ℤ acting on ℚˣ by inversion at the generator, gauge by 2 sends the trivial cocycle to
the value 4 at the generator.
*Lean:* `CrossedCocycle`, `CrossedCocycle.gauge`.

**Finite-wild Weil discretization.** For Fr and a tame generator s, W_F⁰ is the preimage of ℤ[1/q] ⋊
Fr^ℤ: open profinite wild inertia, discrete tame–Frobenius quotient, dense in W_F (finer topology),
finitely presented mod open W_F-normal P_F^e ⊆ P_F trivial on Ĥ ([DHKM2] §§1.2, 2.1, pp. 4–6, 10).

**One integral finite-wild cocycle scheme.** For Ĥ the pinned split dual group over R = ℤ[1/p], W_F
acting through a finite quotient by R-automorphisms, and Γ = W_F⁰/P_F^e, B ↦ Z¹(Γ, Ĥ(B)) is
represented by a finitely presented affine R-scheme, flat of fibre dimension dim Ĥ, and Z¹//Ĥ is
Spec of the functions gauge-invariant on all B-points ([DHKM2] §§1.2, 2.1–2.2, pp. 4–6, 10–11).

**ℓ-adic cocycle extension and changes of discretization.** Over ℤ_ℓ the universal cocycle extends
uniquely and continuously to W_F/P_F^e in DHKM's sense; changing Fr and s gives canonical ℓ-adic
comparisons, not identifications over ℤ[1/p] ([DHKM2] Thm. 4.1(ii), Cor. 4.2, pp. 29–30).

### SR.6.2 Finiteness of the invariant quotient

**Finite wild strata and reductive centralizers.** With Ĥ split reductive over ℤ[1/p], action, P_F^e
as above, R = Z̄[1/p] (Z̄ the algebraic integers), cocycles of P_F/P_F^e form finitely many orbit
schemes; for an R-point φ in each, C = C_Ĥ(φ) is smooth with split reductive C⁰ and constant π₀(C).
The finitely many extensions φ̃ to W_F⁰/P_F^e normalise a Borel pair of C⁰, multiplying by φ̃
identifies tame cocycle schemes with open-closed pieces of the fixed-wild fibre, and inducing from
stabilisers in C decomposes the scheme for fixed e ([DHKM2] Props. 1.1–1.2, pp. 5–6; [DHKM1] Thm.
2.3, Step 1, pp. 6–7).

**Twisted reductive-component quotient finiteness.** For N ≥ 1, R = Z̄[1/N], Ĝ reductive over R, θ
any finite-order R-automorphism, Ĥ ⊆ Ĝ closed reductive and g ∈ Ĝ(R) with Int(g)θ preserving Ĥ, x ↦
xg induces a finite map (Ĥg ⋊ θ)//Ĥ → (Ĝ ⋊ θ)//Ĝ over R ([DHKM1] Lemmas 2.1–2.2, p. 5).

**Tame torus isogeny engine.** For Ĥ reductive over R = Z̄[1/N], p | N, with tame finite-image
W_F-action preserving a Borel pair (B, T), s a tame generator, N_T^s the preimage of (N_Ĥ(T)/T)^s,
T^{s,0} the maximal subtorus of T^s and N_s = {n ∈ N_T^s : n s^q(n)⁻¹ ∈ T^{s,0}}, the fibre A_s ⊆
T^{s,0} × N_s of the isogeny (t, n) ↦ (n Fr(t) n⁻¹ t^{−q}, n) over (s^q(n)n⁻¹, n) is finite over N_s
and hits every geometric point of the tame invariant quotient ([DHKM1] Lemmas 2.7–2.9, pp. 7–8).

**Finite Frobenius evaluation on cocycle quotients.** Over ℤ[1/p], evaluation at Fr makes
Z¹(W_F⁰/P_F^e, Ĥ)//Ĥ finite over (Ĥ ⋊ Fr)//Ĥ, and a Weil-stable closed reductive subgroup gives a
finite map of quotients ([DHKM1] Thm. 2.3, Cors. 2.4–2.5, pp. 6–10).

### SR.6.3 The excursion algebra and its coefficient functions

**Finite-wild excursion algebra.** For Ĥ split reductive over ℤ_ℓ, W_F acting through a finite
quotient Q and W = W_F⁰/P_F^e, Exc(W, Ĥ) = colim O(Z¹(F_n, Ĥ))^Ĥ over free F_n → W. An excursion
datum (I finite, a (Ĥ ⋊ Q)^I-representation V, diagonally Ĥ-invariant α : 1 → V, β : V → 1, γ ∈ W^I)
has coefficient function (h_i) ↦ β((h_i)·α(1)), conjugation-invariant and ⊗-multiplicative;
pullback, product and concatenation give relations ([FS] Def. VIII.3.4, Prop. VIII.3.7, Def.
VIII.4.2, pp. 287–294).

**Excursion and cocycle quotient comparison.** For Ĥ as above, P ⊆ P_F open normal acting trivially
and a finitely generated dense discrete W ⊆ W_F/P, Exc(W, Ĥ) → O(Z¹(W, Ĥ))^Ĥ is a universal
homeomorphism with nilpotent ℓ-power-torsion kernel, an isomorphism after inverting ℓ and if ℓ is
prime to |π₁(Ĥ)_tors| ([FS] Thm. VIII.3.6, pp. 287–288). Over Z̄[1/N], p | N, Exc(W, Ĥ)_red → Exc(W,
Ĥ′)_red is finite for W_F-stable closed reductive Ĥ′ ⊆ Ĥ and any ℓ ([DHKM1] Cor. 2.6, p. 6).

### SR.6.4 Finiteness over the centre

**Z-finite smooth representations.** For smooth V over R, Z_V ⊆ End_R(V) is the image of the centre
of smooth R[G]-modules; V is Z-finite if Z_V is of finite type over R and each V^K is Z_V-finite.
For G = 𝐆(F), R Noetherian, p ∈ Rˣ, Z-finiteness passes to subquotients ([DHKM1] Lemma 3.1, p. 9).

**Depth projective generators and center criteria.** With p invertible, the depth-r part (generated
by Moy–Prasad r+ invariants) is a central direct factor with a finitely generated projective
generator compactly induced from pro-p groups; its finitely generated objects are all Z-finite iff
its Hecke corners are finite over a finite-type centre ([DHKM1] Lemma 3.2, pp. 9–10).

**Torsion-free projective cuspidal embeddings.** For R = ℤ_ℓ[√q] ⊂ Q̄_ℓ, every finitely generated
projective R[G]-module embeds in a finite direct sum of normalised parabolic inductions of finitely
generated ℓ-torsion-free cuspidal Levi modules ([DHKM1] Lemma 3.4, p. 10).

### SR.6.5 Stable module operators

**Stable contracting Hecke operators.** An endomorphism T of a module M is stable if M = ker(T^c) ⊕
I for some c ≥ 1 and T-stable I on which T is invertible; then I ≅ M[T⁻¹], and stability passes to
Hom(M, E) (adjoint operator). For decomposed compact open K and strictly P-positive central λ, the
invertible part of T_λ (convolution by 1_{KλK} on V^K) maps by Jacquet projection to the Levi
compact-open Jacquet invariants, which are V^K[T_λ⁻¹] ([DHKM1] Rems. 4.6–4.7, pp. 13–14).
*Checks:* a nilpotent T is stable with invertible part 0 and an automorphism with nilpotent part 0.
*Lean:* `StableOperator`.

### Examples

Trivial-action cocycles; excursion data of the unit and of β = 0; ℚ^{(ℕ)} for G = 1 (not Z-finite).

### Dependencies

SR.0–SR.4, SR.2a; `TauCeti.AffineGroupSchemeCat`, `Representation.tprod`; ReductiveGroups 7 and 9;
ReductiveGroupsPartII RG2.5; ClassFieldTheory layer 9; LocalFieldsRamification layer 4.

## Downstream consumers

The v-stack and enhanced-sheaf roadmaps build the ∞-categorical enhancement of the derived smooth
category on the dg model of SR.0d. GeometricSatakeAndFusion compares geometric Satake with the
normalised Satake data of SR.4. The roadmaps for two-parahoric unitary operators, for the Iwahori
and Klingen computations for GSp_4, for the GL_2 newvector theorem and for minimal lifts consume the
spherical products, the spin polynomial and the co-Whittaker families of SR.4–SR.5;
IntegralHeckeAndGaloisDeterminants imports the spin polynomial. The modularity-lifting roadmaps
match their families of Galois representations against the integral local families of SR.5 and
use the finite-wild cocycle scheme and excursion algebra of SR.6.

## References

Locators use the printed page numbers of the following editions.

- [BH06] C. J. Bushnell and G. Henniart, *The Local Langlands Conjecture for GL(2)*, Grundlehren der mathematischen Wissenschaften 335, Springer, 2006. Paragraph numbers identify statements as in the book (for example, “2.8 Proposition”).
- [Ber92] J. Bernstein, *Representations of p-adic groups*, Harvard lectures 1992, written by K. Rumelhart, [author copy](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bernst_Lecture_p-adic_repr.pdf).
- [Ber87] J. Bernstein, *Second adjointness for representations of reductive p-adic groups*, 1987 manuscript, [author copy](https://www.math.tau.ac.il/~bernstei/Unpublished_texts/unpublished_texts/Bernstein87-second-adj-from-chicago.pdf).
- [BD84] J. Bernstein and P. Deligne, *Le « centre » de Bernstein*, in Représentations des groupes réductifs sur un corps local, Hermann 1984, 1–32, [scan](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bern_Center.pdf).
- [BZ76] I. Bernstein and A. Zelevinsky, *Representations of the group GL(n, F)*, Russian Math. Surveys 31:3 (1976), 1–68, [copy](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf).
- [BZ77] I. Bernstein and A. Zelevinsky, *Induced representations of reductive p-adic groups I*, Ann. Sci. ENS 10 (1977), 441–472, [Numdam](http://archive.numdam.org/article/ASENS_1977_4_10_4_441_0.pdf).
- [Cas95] W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*, draft of 1995, [author copy](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf).
- [Cas80] W. Casselman, *The unramified principal series of p-adic groups I*, Compositio Math. 40 (1980), 387–406, [Numdam](http://archive.numdam.org/article/CM_1980__40_3_387_0.pdf).
- [Bor76] A. Borel, *Admissible representations of a semi-simple group over a local field with vectors fixed under an Iwahori subgroup*, Invent. Math. 35 (1976), 233–259, [GDZ](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0035/LOG_0029.pdf).
- [IM65] N. Iwahori and H. Matsumoto, *On some Bruhat decomposition and the structure of the Hecke rings of p-adic Chevalley groups*, Publ. IHÉS 25 (1965), 5–48, [Numdam](http://archive.numdam.org/article/PMIHES_1965__25__5_0.pdf).
- [HKP] T. Haines, R. Kottwitz and A. Prasad, *Iwahori–Hecke algebras*, [arXiv:math/0309168](https://arxiv.org/pdf/math/0309168).
- [Lus89] G. Lusztig, *Affine Hecke algebras and their graded version*, J. AMS 2 (1989), 599–635, [AMS](https://www.ams.org/journals/jams/1989-02-03/S0894-0347-1989-0991016-9/S0894-0347-1989-0991016-9.pdf).
- [Kon03] T. Konno, *A note on the Langlands classification and irreducibility of induced representations of p-adic groups*, Kyushu J. Math. 57 (2003), 383–409, [J-STAGE](https://www.jstage.jst.go.jp/article/kyushujm/57/2/57_2_383/_pdf).
- [FS] L. Fargues and P. Scholze, *Geometrization of the local Langlands correspondence*, [arXiv:2102.13459v4](https://arxiv.org/pdf/2102.13459v4).
- [TV] D. Treumann and A. Venkatesh, *Functoriality, Smith theory, and the Brauer homomorphism*, Ann. of Math. 183 (2016), [published](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf); [TVpre] [arXiv:1407.2346v1](https://arxiv.org/pdf/1407.2346v1), whose §§7.8–7.9 are not in the published version.
- [Ven-arXiv] A. Venkatesh, *Derived Hecke algebra and cohomology of arithmetic groups*, [arXiv:1608.07234v3](https://arxiv.org/pdf/1608.07234v3).
- [He18] X. He, *Cocenters of p-adic groups I*, Forum Math. Pi 6 (2018), [doi](https://doi.org/10.1017/fmp.2018.1).
- [ACC] P. Allen et al., *Potential automorphy over CM fields*, Ann. of Math. 197 (2023), [author copy](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
- [BCGP] G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*, [arXiv:1812.09269v3](https://arxiv.org/pdf/1812.09269v3).
- [Pil] V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weight*, Duke Math. J. 169 (2020), [author copy](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).
- [CG18] F. Calegari and D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 211 (2018), [author copy](https://math.uchicago.edu/~fcale/papers/CG.pdf); [CG18-arXiv] [arXiv:1207.4224v2](https://arxiv.org/pdf/1207.4224v2), whose §9.2.1 is the published §9.4.1.
- [CG20] F. Calegari and D. Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, Duke Math. J. 169 (2020), [author copy](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf); [CG20-arXiv] [arXiv:1907.08691v1](https://arxiv.org/pdf/1907.08691v1).
- [CT] L. Clozel and J. Thorne, *Level-raising and symmetric power functoriality III*, Duke Mathematical Journal 166 (2017), [author manuscript](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf).
- [Stacks] *The Stacks project*, [stacks.math.columbia.edu](https://stacks.math.columbia.edu).
- [Les] S. Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*, [arXiv:1911.07907v3](https://arxiv.org/pdf/1911.07907v3).
- [LTXZZ] Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Invent. Math. 228 (2022), 107–375, [published](https://par.nsf.gov/servlets/purl/10323568).
- [Hel12] D. Helm, *Whittaker models and the integral Bernstein center for GL_n*, [arXiv:1210.1789v1](https://arxiv.org/pdf/1210.1789v1).
- [Ros14] S. Rostami, *The Bernstein presentation for general connected reductive groups*, [arXiv:1312.7374v3](https://arxiv.org/html/1312.7374v3), §§2.5–2.9, 3.2.
- [HM18] D. Helm and G. Moss, *Converse theorems and the local Langlands correspondence in families*, Invent. Math. 214 (2018), 999–1022, [published](https://link.springer.com/content/pdf/10.1007/s00222-018-0816-y.pdf).
- [Hel16] D. Helm, *The Bernstein center of the category of smooth W(k)[GL_n(F)]-modules*, [arXiv:1201.1874v3](https://arxiv.org/pdf/1201.1874v3).
- [EH] M. Emerton and D. Helm, *The local Langlands correspondence for GL_n in families*, [arXiv:1104.0321v1](https://arxiv.org/pdf/1104.0321v1).
- [Nak] K. Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023), [published](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf).
- [AKY] H. Atobe, S. Kondo and S. Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*, [arXiv:2110.09070v4](https://arxiv.org/pdf/2110.09070v4).
- [DHKM1] J.-F. Dat, D. Helm, R. Kurinczuk and G. Moss, *Finiteness for Hecke algebras of p-adic groups*, [arXiv:2203.04929v2](https://arxiv.org/pdf/2203.04929v2).
- [DHKM2] J.-F. Dat, D. Helm, R. Kurinczuk and G. Moss, *Moduli of Langlands parameters*, [arXiv:2009.06708v3](https://arxiv.org/pdf/2009.06708v3).

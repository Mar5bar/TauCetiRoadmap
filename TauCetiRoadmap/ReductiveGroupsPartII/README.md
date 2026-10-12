# Roadmap: reductive algebraic groups, part II — local structure and arithmetic models

**Summary.** This roadmap builds the local structure of a connected reductive group over a
nonarchimedean local field: the topology on rational points, Weil restriction, valued root data and
the Bruhat–Tits building, parahoric and Iwahori subgroups with their Moy–Prasad filtrations,
integral models and hyperspecial points, the Iwasawa, Cartan and Iwahori–Bruhat decompositions with
their double-coset combinatorics, and the dual group with its L-group. We want it because the
representation theory of p-adic groups, Hecke algebras at parahoric level, local models and integral
models of Shimura varieties, and the unramified local Langlands correspondence all start from this
material, and none of it exists in Mathlib or Tau Ceti beyond root data. It is the local foundation
on which the adelic, smooth-representation and Hecke roadmaps are built.

The groups live over a nonarchimedean local field `E` and over the completion `Ĕ` of its maximal
unramified extension. The end results are the parahoric group schemes `𝒢°_F` with their Moy–Prasad
filtrations, the decompositions

```text
G(E) = ⊔_{w ∈ W̃} IẇI,      G(E) = K Z(E) K,      G(E) = K P(E),
```

with their index formulas, and the L-group `ᴸG = Ĝ ⋊ Γ` as a group functor over `ℤ`. It extends
the Reductive groups roadmap (`TauCetiRoadmap/ReductiveGroups/README.md`), which owns the unvalued
theory of its layers 0–9.

## Scope and ownership

The roadmap owns, layer by layer:

- RG2.0: the point topology on `X(R)` for affine schemes over topological rings (including the
  adelic coefficients used by AdelicAlgebraicGroups) and for schemes over local topological rings
  whose units are open with continuous inversion; integral points and congruence subgroups; the
  field `Ĕ` with its Frobenius.
- RG2.0a: restriction of scalars of affine schemes and affine group schemes along finite locally
  free maps, with representability, fibre products, smoothness and closed immersions; norm tori and
  quotients of restricted roots of unity; the Deligne torus.
- RG2.1: valuations of root data, apartments, affine roots, the affine Weyl group, `π₁(G)`,
  z-extensions and the Kottwitz homomorphism. Of the unvalued theory it states from the coordinate
  Hopf algebra only the objects the valued theory consumes (maximal split tori, relative roots, root
  subgroups, coroots, the absolute root datum with Galois action), without their structure theory.
- RG2.2: the Bruhat–Tits building, its axioms, metric, fixed points, facets and fixers, unramified
  and tame descent, functoriality for finite extensions, central surjections, Levi and twisted Levi
  subgroups, the lattice-chain models of classical groups and the tree of `SL_2`.
- RG2.3: smooth affine and reductive models, Néron models of tori, Bruhat–Tits and parahoric group
  schemes, hyperspecial vertices, Moy–Prasad filtrations, Lang's theorem (also for pro-algebraic
  groups over finite fields) and level subgroups. It is the single owner in Tau Ceti of Lang's
  theorem for connected smooth groups over finite fields, of the Moy–Prasad filtrations and of the
  parahoric group schemes.
- RG2.4: the Iwahori–Weyl group and its combinatorics up to admissible sets, the Iwahori–Bruhat,
  Cartan and Iwasawa decompositions, double cosets and their indices, unimodularity and the Iwasawa
  integration formula.
- RG2.5: the dual group over `ℤ`, its Galois action and the L-group as group functors, with their
  pointwise product comparisons and standard Levi subgroups over coefficient fields.

Outside the roadmap: adeles, Haar measures on restricted products and arithmetic quotients
(AdelicAlgebraicGroups); Hecke algebras, the Satake isomorphism and smooth representations
(SmoothRepresentationsOfLocalGroups); affine Grassmannians, local models and Schubert varieties;
spaces of Langlands and Weil–Deligne parameters; types for tame groups, z-embeddings and central
pushouts `G ×_Z T`; restriction of scalars of non-affine schemes and algebraic spaces. Also outside:
the compatibility of the scheme point topology with fibre products, the transcendence degree of `Ĕ`
over `E` in equal characteristic, a Witt-vector description of `O_Ĕ` for `E ≠ ℚ_p`; the
preservation by restriction of scalars of étale and surjective maps and of open immersions, its
commutation with centres and derived groups, and the multiplicities of the relative roots of a
Weil restriction; the vanishing of `κ_G` on unipotent elements; uniqueness and Galois equivariance
of toral embeddings into the building of `GL_n` for non-split groups; Lang's theorem for torsors
under smooth models with connected special fibre; Shapiro's lemma for parameters of a Weil
restriction and the dual embedding of a z-extension over `ℤ`. The associated-parahoric interface of
RG2.3 is restricted to specified central surjections: association for arbitrary identified adjoint
groups ([Kisin–Zhou], §2.3.1, arXiv v2 pp. 11–12), R-smoothness of tori and centralizers and its
criteria ([Kisin–Zhou], §2.4.2–2.4.6, pp. 13–14; [Kisin–Pappas–Zhou], §2.1.4, arXiv v3 p. 11), the
R-smooth kernel sequence ([Kisin–Zhou], Prop. 2.4.13, pp. 17–18) and fixer immersions under
R-smoothness ([Kisin–Zhou], Prop. 2.4.8 and 2.4.10, pp. 15–16) are outside.

Cited roadmaps: ReductiveGroups (layers 0, 2–7 and 9: functor of points, Lie algebras, quotients,
characters, unipotent radicals, reductivity, structure theory over a field, pinned
Chevalley–Demazure groups), LocalFieldsRamification (layers 0, 2, 3), ModularCurves (layer 0F, the
affine Hom scheme along a finite locally free map, which RG2.0a extends to arbitrary affine targets;
layer 4D, strict henselisation), RepresentationTheory/RootSystems (layers 3, 4), ProfiniteProPGroups
(layer 3) and ClassFieldTheory (layer 9, the local Weil group).

## Conventions

Let `K` be a field, henselian for a nontrivial discrete valuation `ω` of rank one normalized by
`ω(ϖ) = 1` for a uniformizer `ϖ`, with valuation ring `O = 𝒪[K]`, maximal ideal `m` and perfect
residue field `κ = 𝓀[K]`: the class `ModelField K` (rank one is a separate condition because
`ValuativeRel.IsDiscrete` alone admits the lexicographic value group `ℤ × ℤ`). The two instances
used throughout are a nonarchimedean local field `E` (`κ` finite of order `q`, `|ϖ| = q^{-1}`,
`p = char κ`) and `L = Ĕ`, the completion of the maximal unramified extension of `E`, with
arithmetic Frobenius `σ` and `E = L^σ`. `O^sh` is the strict henselization of `O`, `I` the inertia
group. Mixed characteristic is assumed only where stated.

An affine group scheme over a commutative ring `R` is a commutative Hopf `R`-algebra `H`; its points
over an `R`-algebra `A` form the convolution group `WithConv (H →ₐ[R] A)`, written `G(A)`.
Smoothness, connectedness and reductivity are hypotheses where stated; "connected reductive over a
field" is `TauCeti.reductiveCommHopfAlgProperty` (ReductiveGroups layer 6).

For connected reductive `G` over `K`: `S` is a maximal `K`-split torus, `Z = Z_G(S)` the minimal
Levi, `N = N_G(S)`, `W_0 = N(K)/Z(K)`, `Φ = Φ(G,S)` the relative root system (possibly non-reduced;
`a` is multipliable when `2a ∈ Φ`), `U_a` the root subgroups and `V = X_*(S) ⊗ ℝ`. The apartment `A`
is an affine space under `V`; the reduced apartment is its quotient by `X_*(A_G) ⊗ ℝ`. The torus
valuation map is normalized by `⟨χ, v(z)⟩ = −ω(χ(z))`, and `z ∈ Z(K)` acts on `A` by translation by
`v(z)`; the Kottwitz homomorphism of `G_m` is `ω` itself, so the two differ by a sign on split tori.
Affine roots are the functions `a + k`; `U_{a,x}` is the filtration subgroup at `x ∈ A`.

The building `B(G,K)` is the enlarged building unless the reduced one is named. A parahoric subgroup
is the group of `O`-points of the connected Bruhat–Tits group scheme `𝒢°_F` of a facet `F`; the
fixer scheme `𝒢_F` and the stabilizer of `F` can be larger. Over `L`, `π₁(G) = X_*(T)/Q^∨`
(Borovoi), `κ_G : G(L) → π₁(G)_I` is the Kottwitz homomorphism and `W̃ = N(K)/Z(K)_0`, with
`Z(K)_0` the unique parahoric subgroup of `Z(K)`; the length on `W̃` vanishes exactly on the
stabilizer `Ω` of the base alcove. The dual group `Ĝ` is the pinned split reductive group over `ℤ`
with the flipped based root datum, and `ᴸG = Ĝ ⋊ Γ` with `Γ` acting through pinned automorphisms
with finite image; no square root of `q` is part of the integral dual data.

Source locators give the theorem or section and the page (arXiv pages for the stated arXiv version,
printed pages for Numdam scans). A derivation from a special case of a source says so.

## Exact supplier contracts

| Object | Supplier | File |
| --- | --- | --- |
| Nonarchimedean local fields | `IsNonarchimedeanLocalField` | `Mathlib/NumberTheory/LocalField/Basic.lean` |
| Normalized valuation and absolute value | `TauCeti.normalizedValuation`, `TauCeti.normalizedAbsoluteValue` | `TauCeti/NumberTheory/LocalField/NormalizedValuation.lean` |
| Maximal unramified extension and Frobenius | `TauCeti.maximalUnramifiedExtension`, `TauCeti.maximalUnramifiedFrobenius` | `TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean` |
| Unit filtration | `TauCeti.unitFiltration` | `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean` |
| Uniform completion, extension of ring automorphisms | `UniformSpace.Completion`, `UniformSpace.Completion.mapRingEquiv` | `Mathlib/Topology/Algebra/UniformRing.lean` |
| Maps of points along coefficient and Hopf maps | `TauCeti.AlgHom.mapValue`, `TauCeti.AlgHom.mapDomain` | `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean`, `TauCeti/Algebra/AlgebraicGroup/Hopf/Map.lean` |
| `GL_n` and its points | `TauCeti.GeneralLinear.coordinateHopfAlgebra`, `TauCeti.GeneralLinear.pointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/FunctorOfPoints.lean` |
| Hopf ideals and points of closed subgroups | `TauCeti.HopfIdeal`, `TauCeti.CommHopfAlgCat.quotientPointsSubgroup` | `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Basic.lean`, `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Basic.lean` |
| Reductive, torus, split torus | `TauCeti.reductiveCommHopfAlgProperty`, `TauCeti.torusCommHopfAlgProperty`, `TauCeti.splitTorusCommHopfAlgProperty` | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`, `TauCeti/Algebra/AlgebraicGroup/Torus/Basic.lean` |
| Smooth, geometrically connected | `TauCeti.smoothCommHopfAlgProperty`, `TauCeti.geometricallyConnectedCommHopfAlgProperty` | `TauCeti/Algebra/AlgebraicGroup/Smooth/CommHopfAlgCat.lean`, `TauCeti/Algebra/AlgebraicGroup/Connected/CommHopfAlgCat.lean` |
| Semisimple, simply connected, derived subgroup | `TauCeti.semisimpleCommHopfAlgProperty`, `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`, `TauCeti.CommHopfAlgCat.derivedDefiningIdeal` | `TauCeti/Algebra/AlgebraicGroup/Semisimple/Basic.lean`, `TauCeti/Algebra/AlgebraicGroup/SimplyConnected/Basic.lean`, `TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean` |
| Reductive group schemes over a base | `TauCeti.reductiveCommHopfAlgPropertyOver` | `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean` |
| Character group | `TauCeti.CommHopfAlgCat.additiveCharacterGroup` | `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/CharacterLattice/Basic.lean` |
| Adjoint action, cotangent space | `Derivation.adjointAction`, `TauCeti.Bialgebra.CotangentSpace` | `TauCeti/Algebra/AlgebraicGroup/Tangent/Representation.lean`, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean` |
| Dynamic parabolic, Levi and unipotent subgroups | `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`, `TauCeti.Cocharacter.unipotent` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` |
| Pinnings, Tits systems | `TauCeti.Pinning`, `TauCeti.TitsSystem` | `TauCeti/Algebra/AlgebraicGroup/Pinning/Basic.lean`, `TauCeti/GroupTheory/TitsSystem/Basic.lean` |
| Scalar torsion ideal | `TauCeti.scalarTorsionIdeal` | `TauCeti/RingTheory/Ideal/ScalarTorsion.lean` |
| Pro-p groups | `TauCeti.IsProP` | `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean` |
| Root pairings, flips, bases, Weyl groups | `RootPairing`, `RootPairing.flip`, `RootPairing.Base`, `RootPairing.weylGroup` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean`, `Mathlib/LinearAlgebra/RootSystem/Base.lean`, `Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean` |
| Corepresentable functors | `CategoryTheory.Functor.IsCorepresentable` | `Mathlib/CategoryTheory/Yoneda.lean` |
| Lattices over a DVR, Smith normal form | `Submodule.IsLattice`, `Module.Basis.SmithNormalForm` | `Mathlib/Algebra/Module/Lattice.lean`, `Mathlib/LinearAlgebra/FreeModule/PID.lean` |
| Trees | `SimpleGraph.IsTree` | `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean` |
| Double cosets, relative index | `DoubleCoset.doubleCoset`, `Subgroup.relIndex` | `Mathlib/GroupTheory/DoubleCoset.lean`, `Mathlib/GroupTheory/Index.lean` |
| Haar measure, modular character | `MeasureTheory.Measure.haar`, `MeasureTheory.Measure.modularCharacter` | `Mathlib/MeasureTheory/Measure/Haar/Basic.lean`, `Mathlib/MeasureTheory/Group/ModularCharacter.lean` |
| Lifting along formally smooth maps | `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | `Mathlib/RingTheory/Smooth/Basic.lean` |
| Coxeter systems, semidirect products, group cohomology | `CoxeterSystem`, `SemidirectProduct`, `groupCohomology` | `Mathlib/GroupTheory/Coxeter/Basic.lean`, `Mathlib/GroupTheory/SemidirectProduct.lean`, `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` |

Kept variants: `NormTorus.norm` is `Algebra.norm` of `R ⊗_k k'` over `R` after swapping the tensor
factors; `BruhatTits.subgroupPoints` is `TauCeti.CommHopfAlgCat.quotientPointsSubgroup` indexed by
the coefficient type; `SchematicClosure.closureIdeal` at the zero ideal is
`TauCeti.scalarTorsionIdeal`; `IntegralModel.SmoothModel.IsReductive` is the two-fibre form of
`TauCeti.reductiveCommHopfAlgPropertyOver`.

## How to read the build

`README.md` specifies the mathematics; `Suggested.lean` gives signatures for the targets that are
statable against the pinned Mathlib and Tau Ceti. A target with such a signature ends with a
*Lean:* line naming its declarations. The other targets, among them the field `Ĕ`, the representing
algebra of a Weil restriction, the valued root datum of a reductive group, the building, the
Bruhat–Tits and parahoric group schemes, the Moy–Prasad filtrations, the Iwahori–Weyl group, the
Kottwitz homomorphism, the dual group and the L-group, are specified by this README alone; building
them is part of the target. *Checks* record the discriminating test cases and the counterexamples
that pin each hypothesis; those with a Lean form are `example`s next to their declaration. Each
*Needs:* clause names the inputs of a target.

## Layer RG2.0: topologies on rational points

The point topology on `X(R)`, glued over affine charts for schemes; over a nonarchimedean local
field `E` (`IsNonarchimedeanLocalField`) the topological group `G(E)`, integral points and congruence
subgroups; the field `Ĕ` with its Frobenius. The adelic, smooth-representation and Shimura-level
roadmaps use these objects. Throughout, `A`, `R` are
commutative `k`-algebras; `O = 𝒪[E]` has maximal ideal `m`, residue field `κ` of order `q`,
uniformizer `ϖ`, and `𝒢 = Spec H` is an `O`-group, `G` its generic fibre.

### RG2.0.1 the point topology

**The topology on points of an affine algebra.** For any topology on `R`, the point topology on
`Hom_k(A, R)` and on `WithConv (A →ₐ[k] R)` is the coarsest making all `f ↦ f(a)` continuous; for
`R` a topological ring, `g` into it is continuous iff all `y ↦ g(y)(a)` are, and `f ↦ ⇑f` embeds it
in `A → R` ([Conrad], Prop. 2.1, p. 2; no finiteness needed).
*Checks:* `Hom_{𝔽₂}(𝔽₂[x₀, x₁, …], 𝔽₂) = 𝔽₂^ℕ` is not discrete (discreteness needs finite type). On
`G_m(ℚ_p)` the hyperbola topology is the subspace topology.
*Lean:* `PointTopology.topology`, `PointTopology.instTopologicalSpace`,
`PointTopology.continuous_iff`, `PointTopology.instTopologicalSpaceWithConv`,
`PointTopology.isEmbedding_toPi`.

**Presentations give embeddings into affine space.** For `R` a topological ring: if `R` is T1 and
`a_1, …, a_n` generate `A`, `x ↦ (x(a_i))_i` is a closed embedding onto the zeros of
`ker(k[t_i] ↠ A)` (for any generators, an embedding); if `R` is Hausdorff, locally compact, `A` of
finite type, `Hom_k(A, R)` is locally compact ([Conrad], Prop. 2.1 and its proof, pp. 2–3).
*Lean:* `PointTopology.isClosedEmbedding_eval_generators`,
`PointTopology.locallyCompactSpace_of_finiteType`.

**Functoriality of the point topology.** For `R` a topological ring, restriction is a homeomorphism
`Hom_k(A ⊗_k B, R) ≅ Hom_k(A, R) × Hom_k(B, R)`. In general, `B → A` and continuous `ψ : R → R'`
give continuous maps (closed embeddings for `B ↠ A`, `R` T1; embeddings, closed or, for `A` of
finite type, open, if `ψ` is one), `Hom_{k'}(k' ⊗_k A, R) ≅ Hom_k(A, R)`, and `Hom_k(A ⊗_C B, R)` is
closed in the product for `R` T1 ([Conrad], Prop. 2.1 and its proof, pp. 2–3; Ex. 2.2, p. 3).
*Lean:* `PointTopology.isHomeomorph_tensorProduct`.

**Localizations give open embeddings.** For `R` a topological ring with `R^×` open and inversion
continuous on it, and `f ∈ A`, `Hom_k(A_f, R) → Hom_k(A, R)` is an open embedding onto
`{x : x(f) ∈ R^×}` ([Conrad], §3 and proof of Prop. 3.1, pp. 3–4).
*Checks:* For `f = t ∈ k[t]` it is `R^× ⊂ R`; both hypotheses are needed, and fail for `𝔸_ℚ`.
*Lean:* `PointTopology.isOpenEmbedding_localization`.

**The topology on points of a scheme, and its functoriality.** For `R` local and `X` a `k`-scheme,
`X(R) = ⋃_U U(R)` has the finest topology making all charts `U(R) = Hom_k(Γ(U), R) → X(R)`, `U`
affine open, continuous. If `R^×` is open with continuous inversion, charts are open embeddings,
`Hom_k(A, R) ≅ (Spec A)(R)`, and morphisms, open immersions and, for `R` Hausdorff, closed
immersions give continuous maps, open and closed embeddings; for `R` Hausdorff, `X(R)` is Hausdorff
if `X` is separated, and locally compact if `X` is locally of finite type and `R` locally compact
([Conrad], Prop. 3.1 and its proof, p. 4; Prop. 2.1, p. 2).
*Checks:* Conjugation of `Spec ℂ` is not a `ℂ`-point over `Spec ℂ`. For discrete `R`, `X(R)` is
discrete if `X` is locally of finite type, not in general.

### RG2.0.2 local fields: the topological group of points

**Points over a local field are locally compact and Hausdorff.** For `H` a commutative Hopf
`E`-algebra, `G(E) ⊂ E^H` is Hausdorff and totally disconnected, and locally compact and second
countable if `H` is of finite type. In general, `X(E)` is Hausdorff and locally compact for `X`
separated, locally of finite type, and `𝒳(O)` is locally compact for `𝒳` locally of finite type over
`O` ([Conrad], Prop. 2.1, p. 2; Prop. 3.1 and Rem. 3.2, p. 4).
*Checks:* `G_m(ℝ) = ℝ^×` is not totally disconnected. `X(E)` is compact for `X` proper ([Conrad],
proof of Prop. 4.4, p. 11; Cor. 5.6, p. 16): the glued topology is not that of the disjoint charts.
*Lean:* `PointTopology.instT2SpaceLocal`, `PointTopology.instLocallyCompactSpaceLocal`,
`PointTopology.instSecondCountableTopologyLocal`, `PointTopology.instTotallyDisconnectedSpaceLocal`.

**The topological group of rational points.** For `H` a commutative Hopf `k`-algebra and `R` a
topological ring, not necessarily Hausdorff, `WithConv (H →ₐ[k] R)` is a topological group, in
general functorial in `H` and `R` ([Conrad], Prop. 2.1 and the discussion after it, p. 2).
*Lean:* `PointTopology.isTopologicalGroup`, `PointTopology.instIsTopologicalGroupLocal`.

**Smooth morphisms are open on local points.** For `X → Y` smooth over `E`, `Y` locally of finite
type, `X(E) → Y(E)` is open ([Conrad], §4, the paragraph before Thm 4.5, p. 11); so smooth
homomorphisms of affine finite-type `E`-groups map compact open subgroups to compact open ones.

### RG2.0.3 integral points and congruence subgroups

**Integral points of an affine model are compact open.** For `A` a finitely generated `O`-algebra,
`Hom_O(A, O)` is compact and `x ↦ (O ⊂ E) ∘ x` an open, hence closed, embedding in `Hom_O(A, E)`,
for `O`-groups equal to `TauCeti.AlgHom.mapValue (Algebra.ofId O E)`, so `𝒢(O)` is compact open in
`G(E)`; in general the image is `{x : x(A) ⊂ O}` ([Conrad], Ex. 2.3, p. 3; Prop. 2.1, p. 2).
*Lean:* `PointTopology.isOpenEmbedding_integralPoints`, `PointTopology.compactSpace_integralPoints`.

**GL_n: point topology equals the units topology.** For `R` a topological ring and `n ≥ 0`,
`TauCeti.GeneralLinear.pointsMulEquiv` is a homeomorphism onto `GL_n(R)` with the topology of
`g ↦ (g, g^{-1})`; over `O`, `g ∈ M_n(E)` is a point of `GL_n` iff `g ∈ M_n(O)` and `det g ∈ O^×`
([Conrad], §3, p. 3; Ex. 2.3, p. 3; `Matrix.isUnit_iff_isUnit_det`).
*Checks:* `diag(ϖ, 1)` is integral, `det ≠ 0`, but not in `GL_2(O)`; `GL_1(𝔸_ℚ) → 𝔸_ℚ` is no
embedding.
*Lean:* `PointTopology.generalLinearPointsHomeomorph`.

**Congruence subgroups of an integral group model.** For `H` a commutative Hopf `O`-algebra and
`n ≥ 0`, `𝒢(O)_n := ker(𝒢(O) → 𝒢(O/m^n))` is normal; `x ∈ 𝒢(O)_n` iff `x ≡ 1 mod m^n`, and the
`𝒢(O)_n` decrease from `𝒢(O)_0 = 𝒢(O)`, are open for `H` of finite type, and are functorial
([Platonov–Rapinchuk–Rapinchuk], §3.1, p. 126, and §3.3, (3.15), p. 160, for `𝒢 ⊂ GL_n`, char. `0`).
*Checks:* For `G_m` it is `TauCeti.unitFiltration E n`; `⋂_n 𝒢(O)_n = 1`;
`diag(1 + ϖ, 1) ∈ 𝒢(O)_1 ∖ 𝒢(O)_2` for `GL_2`.
*Lean:* `CongruenceSubgroup.subgroup`, `CongruenceSubgroup.normal`.

**Congruence subgroups form a neighbourhood basis.** For `H` of finite type the `𝒢(O)_n` form a
basis at `1` and `𝒢(O)_1` is pro-`p` (`TauCeti.IsProP`, `p = char κ`), as `𝒢(O)_n/𝒢(O)_{n+1}`,
`n ≥ 1`, embeds in `ε`-derivations into `m^n/m^{n+1}`; so `G(E)` is locally profinite and compact
open subgroups contain some `𝒢(O)_n` with finite index ([Platonov–Rapinchuk–Rapinchuk], §3.1, p.
126, and Lem. 3.38, p. 160, for `𝒢 ⊂ GL_n` in characteristic `0`; [Milne AG], 12.5, pp. 184–185).
*Checks:* `GL_2(O)` is not pro-`p`: its quotient `GL_2(κ)` has order `q(q − 1)(q² − 1)`.
*Lean:* `CongruenceSubgroup.hasBasis_nhds_one`, `CongruenceSubgroup.isProP_one`.

**Congruence quotients of smooth models.** For `H` smooth over `O`, `I = ker ε`, `n ≥ 1`,
`𝒢(O)_n/𝒢(O)_{n+1} ≅ Hom_O(I/I², m^n/m^{n+1})` has order `q^d`, `d = rk I/I² = dim Lie 𝒢_κ`, by
smooth lifting ([Milne AG], 12.5, pp. 184–185, for `k[ε] → k`); and `𝒢(O)/𝒢(O)_1 ≅ 𝒢_κ(κ)`.
*Checks:* For `G_m` and `n = 0` the quotient is `κ^×`, with `q − 1` elements, not `q`.
*Lean:* `CongruenceSubgroup.natCard_quotient_succ`.

### RG2.0.4 the completed maximal unramified extension

**The completed maximal unramified extension Ĕ.** Let `E^ur ⊂ AlgebraicClosure E` be generated by
the roots of `X^(q^n) − X`, `n > 0`, `Ĕ` its completion (discretely, nontrivially valued) and `σ`
the continuous extension of `ζ ↦ ζ^q`. Then `σ(x) ≡ x^q mod m_Ĕ` on `O_Ĕ`, `Ĕ^σ = E`, `O_Ĕ^σ = O_E`,
`κ_Ĕ` is algebraically closed, `ϖ` is a uniformizer, `E ⊂ Ĕ` is closed, and `trdeg_E Ĕ = ∞` for
`char E = 0` ([He 2018], §4.3, p. 12, in the setting of §1.1, p. 5; [Kottwitz 1997], 1.1, pp.
257–258; [Chen], §1, p. 730, for `E = ℚ_p`, and Prop. 2.0.3 with its proof, pp. 734–735).
*Checks:* `√ϖ ∉ Ĕ` (valuation `1/2`). Over `ℚ₂`, `σ(ζ) = ζ² ≠ ζ⁴` for `ζ` of order `7` (arithmetic
Frobenius). For `ℚ_p`, `Ĕ ≅ Frac W(F̄_p)` with Witt-vector Frobenius. `Ĕ` is not algebraic over `E`.

**Rational points as Frobenius fixed points.** For an `E`-algebra `A`, `σ` acts continuously on
`X(Ĕ)` by `x ↦ σ ∘ x`, and `X(E) = X(Ĕ)^σ` is closed in `X(Ĕ)`; for `G` affine, `G(E) = G(Ĕ)^σ` as
topological groups, `σ` acting by `TauCeti.AlgHom.mapValue σ`; and a `σ`-fixed map to `Ĕ` with
values in `O_Ĕ` has values in `O_E` ([He 2018], §4.3, p. 12, for connected reductive `G`).

### Examples

The examples of this layer are the Checks above: `𝔽₂^ℕ`, `G_m(ℚ_p)`, `GL_2(O)`, `G_m` and `ℚ₂`.

### Dependencies

ReductiveGroups layers 0 and 2; LocalFieldsRamification layers 0 and 2; ProfiniteProPGroups layer 3;
Tau Ceti `TauCeti.AlgHom.mapValue`, `TauCeti.maximalUnramifiedFrobenius`.

## Layer RG2.0a: Weil restriction, norm tori and the Deligne torus

Weil restriction of affine schemes and groups along finite locally free `k → k'`, norm tori,
integral models, Edixhoven's theorem and the Deligne torus, used by the adelic roadmap and by Shimura
data.

### RG2.0a.1 the functor and its representing algebra

**The Weil restriction functor of an affine scheme.** For a ring map `k → k'` and a `k'`-algebra
`A'`, `Res_{k'/k}(X')`, `X' = Spec A'`, is `R ↦ Hom_{k'}(A', k' ⊗_k R)` on commutative `k`-algebras,
contravariant in `A'` ([Stacks], Section 97.11 (Tag 05Y8), and Proposition 97.11.5 (Tag 05YF);
[Bruhat–Tits II], 1.5.2, pp. 26–27; [Milne AG], 2.35–2.36, p. 50).
*Checks:* For `k' = k` it is `Hom_k(A', R)`; `Res(Spec 0)` has no points where `k' ⊗_k R ≠ 0`.
*Lean:* `WeilRestriction.functor`.

**The representing algebra of a Weil restriction.** For `k'` finite projective over `k`, the functor
is corepresentable for every `A'`; explicitly by `Res A'`, `u : A' → k' ⊗_k Res A'`,
`φ ↦ (id ⊗ φ) ∘ u` bijective, natural in `R` and `A'`: for `A' = Sym_{k'}(k' ⊗_k M)/I`, `M` free,
`Res A' = Sym_k(k'^∨ ⊗_k M)/((λ ⊗ id) j(I))_{λ ∈ k'^∨}`, `k'^∨ = Hom_k(k', k)`, `j` universal; for a
basis `(b_i)` of `k'`, `Res k'[X_j]/(P_t)` is `k[Y_{ij}]` mod the `b`-coordinates of
`P_t(∑_i b_i Y_{ij})`, `u(X_j) = ∑_i b_i ⊗ Y_{ij}` ([Bruhat–Tits II], 1.5.1–1.5.7 and 1.5.10, pp.
26–29).
*Checks:* `Res_{ℂ/ℝ} ℂ[t] = ℝ[x, y]`, not `ℝ[t]`, and `u(t) = 1 ⊗ x + i ⊗ y` is not onto.
`Res((k × k) ⊗_k B) = B ⊗_k B`. `Res 0 = 0` for `k'` faithfully flat but `= k` for `k' = 0`.
*Lean:* `WeilRestriction.functor_isCorepresentable`.

**Finiteness and coordinates of a Weil restriction.** For `k → k'` finite locally free, `Res A'` is
of finite type (finitely presented) if `A'` is, finite type sufficing for `k` noetherian; for `k'`
free of rank `d`, `Res 𝔸^n ≅ 𝔸^{nd}` and `Res G_m = 𝔸^d ∖ {N = 0}`, `N` the norm form, e.g.
`ℝ[x, y][(x² + y²)⁻¹]` for `ℂ/ℝ` ([Bruhat–Tits II], 1.5.8 and 1.5.10, pp. 28–29, and 1.5.13, p. 30;
[Milne AG], proof of Lem. 14.38, p. 238; [Harpaz–Wittenberg], §4, p. 15).

**Base change, composition and products of Weil restrictions; Weil restriction is adjoint to base
change.** For `k → k'` finite locally free, `l ⊗_k Res A' ≅ Res_{l'/l}(l' ⊗_{k'} A')`
(`l' = l ⊗_k k'`), `Res_{k'/k} Res_{k''/k'} ≅ Res_{k''/k}` (`k''/k'` finite locally free) and
`Res(A' ⊗_{k'} B') ≅ Res A' ⊗_k Res B'`, each fixed by its effect on points ([Bruhat–Tits II],
1.5.3–1.5.4, p. 27; [Milne AG], 2.38–2.41, p. 51). `Res` is left adjoint to `k' ⊗_k −` on algebras,
with counit `u` and unit the diagonal `X → Res(X_{k'})`, a closed immersion for `k'` faithfully flat
([Milne AG], 2.37–2.38, pp. 50–51; [Bruhat–Tits II], 1.5.11, p. 29).
*Checks:* `ℂ ⊗_ℝ Res_{ℂ/ℝ} G_m ≅ G_m²`; the swap twist (`A' = B'`) breaks the point condition. For
`k' = 0 ≠ k` the unit `k → k[t]` is not onto; for `ℂ/ℝ` the diagonal `t ↦ (t, 0)` is no isomorphism.

### RG2.0a.2 Weil restriction of group schemes

**Weil restriction of an affine group scheme.** For `k → k'` finite locally free and commutative
Hopf `H'` over `k'`, `Res H'` is uniquely a Hopf algebra with `(Res G')(R) ≅ G'(k' ⊗_k R)` a group
isomorphism, natural in `R`, `H'`; so `(Res G)(R) = G(k' ⊗_k R)` for `G = G_m, GL_n, μ_n`, and
`x ↦ id ⊗ x` is the diagonal `G → Res(G_{k'})` ([Bruhat–Tits II], 1.5.4, p. 27; [Milne AG], 2.36, p.
50; [Kaletha], §3.1, p. 10, for `Res μ_n`).
*Checks:* For `ℤ → 𝔽_p`, not projective, `R ↦ 𝔽_p ⊗ R` (from `G_a`) is not representable: `ℤ ⊂ ℚ`
would inject `p` points into one. `Res_{ℂ/ℝ} GL_2` is not commutative.

**Weil restriction preserves smoothness and closed immersions.** For `k → k'` finite locally free,
`Res` preserves (formal) smoothness and surjections but not flatness; for `k'/k` finite separable
and `A'` of finite type, `dim Res A' = [k' : k] dim A'` ([Bruhat–Tits II], 1.5.8–1.5.9, p. 28).
*Checks:* For `k' = k(β^{1/p})` of degree `p` and `a ∈ k ∖ k'^p`,
`Res k'[x]/(x^p − a) = k[c_i]/(∑_i β^i c_i^p − a)` has dimension `p − 1 ≠ 0`. For
`O' = ℤ_p[ε]/(ε²)`, `Res O'[x]/(x² − pε) = ℤ_p[a, b]/(a², 2ab − p)` has `p`-torsion `a ≠ 0`.

**Splitting of a Weil restriction over a separable extension.** For `k'/k` finite separable and `Ω`
separably closed over `k`, `(Res A')(Ω) = ∏_τ A'(Ω_τ)` over the `k`-embeddings `τ : k' → Ω`, `Ω_τ`
being `Ω` via `τ`; over a field containing the normal closure, `(Res X')_Ω ≅ ∏_τ X'_{τ,Ω}`,
`σ ∈ Aut(Ω/k)` taking the `τ`- to the `στ`-factor ([Bruhat–Tits II], 1.5.14–1.5.16, pp. 30–31;
[Milne AG], Lem. 14.39, p. 238).
*Checks:* For `ℂ/ℝ`, `1 ⊗ α + i ⊗ β` has components `α ± iβ`; it fails for `Ω = ℝ` (no `τ`).

**Weil restriction of reductive groups; character lattices of Weil-restricted tori.** For `k'/k`
finite separable and `G'` of finite type, `Res G'` is reductive iff `G'` is ([Springer], §3.3, p.
12; the converse by splitting). For `D'` of multiplicative type, so is `Res D'`:
`X^* = Ind_{Γ_{k'}}^{Γ_k} X^*(D')`, dually for `X_*`; so `X^*(Res G_m) = ℤ[Hom_k(k', k^sep)]` and
`X^*(Res μ_n) = (ℤ/n)[Hom_k(k', k^sep)]` ([Bruhat–Tits II], 1.5.17, pp. 31–32; [Milne AG], Lem.
14.39, p. 238; [Kaletha], §3.1, p. 10, for `μ_n`, `k'/k` Galois).
*Checks:* For `[k' : k] = p` purely inseparable, `Res G_m` is not reductive: `Res G_m/G_m` is
unipotent of dimension `p − 1` ([Milne AG], 17.23, p. 296, and 22.153–22.154, pp. 426–427).

**Norm maps and norm-one tori.** For a `k`-algebra `k'`, `Nm : (k' ⊗_k R)^× → R^×` is the algebra
norm of `R ⊗_k k'` over `R`, and `R^1_{k'/k} G_m(R) = ker Nm`; `Nm(1 ⊗ r) = r^d` for `k'` finite
free of rank `d`. For `K'/K` finite separable of degree `d`, a finite-type commutative Hopf
`K`-algebra with points naturally isomorphic to `ker Nm` is a torus, and `ker Nm ≅ (Ω^×)^{d−1}` over
separably closed `Ω ⊇ K`. The abstract quotient `μ_n(k' ⊗_k R)/μ_n(R)` (`μ_0` = all units) is not
identified with points of `(Res μ_n)/μ_n` ([Kaletha], §3.1, display (3.1), p. 10, for `k'/k` Galois;
[Bruhat–Tits II], 1.5.13 and 1.5.17, pp. 30–32; [Česnavičius], Rem. 6.3, display (6.3.3), p. 14).
*Checks:* For `ℂ/ℝ`, `Nm(x + iy) = x² + y²`, the norm-one real points are the unit circle, and
`Nm : ℂ^× → ℝ^×` is not onto, though onto as tori; for `n = 4`, `{±1, ±i}/{±1}` has order `2`.
*Lean:* `NormTorus.norm`, `NormTorus.normOne`, `NormTorus.norm_comp_diagonal`,
`NormTorus.normOne_isTorus`, `NormTorus.characterGroup_normOne`.

**Topology on points of a Weil restriction.** For `k → k'` finite locally free, `R` a topological
`k`-algebra with `k' ⊗_k R` a topological quotient of a free `R`-module, and `A'` of finite type,
`(Res A')(R) ≅ X'(k' ⊗_k R)` is a homeomorphism, of groups for groups ([Conrad], Ex. 2.4, p. 3, for
`k = R`); so `(Res_{E'/E} G_m)(E) = E'^× ⊂ E'` for nonarchimedean `E'/E` with `E → E'` continuous.

**Weil restriction of integral points and models.** For `O → O'` finite free and `𝒳'` affine over
`O'`, `(Res 𝒳')(O) = 𝒳'(O')`. For discrete valuation rings `O ⊂ O'` with `K ⊗_O O' = K'`,
`(Res 𝒳')_K = Res_{K'/K} 𝒳'_{K'}`, `Res` keeps finite type and smoothness, and a semilinear
`Gal(K'/K)`-action on `𝒳'` induces an `O`-linear one, `y ↦ (γ^{-1} ⊗ id) ∘ y ∘ γ` ([Edixhoven], 2.4,
p. 292; [Kisin–Pappas], proof of Prop. 1.3.3 and Prop. 1.3.9, displays (1.3.8)–(1.3.10), pp.
142–143; [Kisin–Pappas–Zhou], §2.1.2, p. 11).
*Checks:* For `ℂ/ℝ` it is `y ↦ −y` on `ℝ[x, y]`, not trivial; `(Res_{ℤ[i]/ℤ} G_m)(ℤ) = {±1, ±i}`.

**Edixhoven's tame fixed-point theorem.** For `O` a discrete valuation ring, `O'` finite free over
it with a finite group `Γ` of order invertible in `O` acting `O`-linearly, and `X` smooth affine
over `O'` with semilinear `Γ`-action, `(Res_{O'/O} X)^Γ`, cut out by the `γf − f`, is `O`-smooth,
without henselian hypothesis ([Edixhoven], Prop. 3.1, p. 293, and Prop. 3.4, pp. 294–295). For `O`
strictly henselian, `K'/K` tame Galois with group `Γ`, `T` a `K`-torus split by `K'` and `𝒯'` the
split `O'`-torus of `T_{K'}`, `((Res 𝒯')^Γ)°` is the connected Néron model of `T` ([Kisin–Pappas],
proof of Prop. 1.1.4, p. 129; [Kisin–Pappas–Zhou], proof of Prop. 2.2.2, pp. 12–13, and Rem.
2.4.3(b), p. 16). Over a field see RG2.2, *Fixed points of finite groups of invertible order*.

### RG2.0a.3 the Deligne torus

**The Deligne torus.** `S := Res_{ℂ/ℝ} G_m = Spec ℝ[x, y, (x² + y²)^{-1}]`, `z = x + iy`, has
`S(R) = (ℂ ⊗_ℝ R)^×`, `S(ℝ) = ℂ^×` topologically, and `S(ℂ) ≅ (ℂ^×)²`, `a ⊗ b ↦ (ab, āb)`, with
`S(ℝ) ∋ z ↦ (z, z̄)`; conjugation acts by `(z_1, z_2) ↦ (z̄_2, z̄_1)` and on `X^*(S) = ℤ²`
(`z_1^p z_2^q`) by `(p, q) ↦ (q, p)`. Pinned: `d : G_m → S`, `r ↦ r`; `w := d ∘ inv`;
`Nm(z) = z z̄`, `Nm ∘ d = r²`, `ker Nm = U(1)`; `μ : G_{m,ℂ} → S_ℂ`, `μ(z) = (z, 1)` ([Milne ISV],
§2, 'Hodge structures as representations of S', p. 26, displays (20)–(23)).
*Checks:* `i ∈ S(ℝ)` goes to `(i, −i)`, `1 ⊗ i ∈ S(ℂ)` to `(i, i)`; `w(2) = 1/2`; `(p, q)` is
`r^{−(p+q)}` on `w(r)`. `S` is not split (`ℂ^×` has infinitely many torsion points, `(ℝ^×)²` four),
and `μ(−1) = (−1, 1)` is not `(z, z̄)`, so `μ` is not defined over `ℝ`.

### Examples

The examples of this layer are the Checks above: `ℂ/ℝ`, `k × k`, `0`, `ℤ_p[ε]/(ε²)`, `k(β^{1/p})`
and the Deligne torus `S`.

### Dependencies

RG2.0; ModularCurves layer 0F; ReductiveGroups layers 0, 4, 6 and 7; Mathlib `Algebra.norm`; Tau
Ceti `TauCeti.AlgHom.instGroup`, `TauCeti.reductiveCommHopfAlgProperty`.

## Layer RG2.1: relative roots and valued root data

Over a henselian discretely valued `K`, `G(K)` carries a generating root datum on the relative roots
of a maximal split torus. This layer builds its valuations, apartments, affine roots and affine Weyl
group, and `π₁(G)`, z-extensions and Kottwitz maps. Signs: `⟨χ, v(z)⟩ = −ω(χ(z))`; `κ_{G_m} = ω`.

### RG2.1.1 quasi-split forms and rational tori over Ĕ

**Steinberg's theorem over the completed unramified field.** If `L` is complete or henselian for a
discrete valuation with algebraically closed residue field (e.g. `Ĕ`, `K^sh`), `H^1(L, H) = 1` for
connected reductive `H` (Steinberg for perfect `L`, Borel–Springer otherwise; all connected linear
`H` if `char L = 0`), so reductive `L`-groups are quasi-split; finite tame Galois extensions of `L`
are totally ramified, cyclic, of order prime to `p` ([Bruhat–Tits II], 5.1.1, p. 145;
[Kisin–Pappas], proof of Prop. 1.1.4, p. 128; [Haines–Rapoport], after Rem. 4, p. 2).

**A rational maximal L-split torus.** For `E` a nonarchimedean local field, `L = Ĕ` with Frobenius
`σ`, and `G` reductive over `E` with maximal `E`-split torus `S`, some `E`-torus `S_L ⊇ S` has
maximal `L`-split base change ([Bruhat–Tits II], Corollary 5.1.12, p. 150, over `E^sh`, with the
same Galois group as `Ĕ`); `Z_G(S_L)` is a maximal `E`-torus, and `A(G_L, S_L)` is `σ`-stable with
fixed locus `A(G, S)` ([Bruhat–Tits II], Lemma 5.1.13, p. 150, and Theorem 5.1.20, pp. 153–154).

### RG2.1.2 root data in a group and their valuations

**Generating root datum in an abstract group.** Let `Φ` be a Mathlib `RootPairing ι ℝ M N` (roots in
`M = V*`, coroots in `N = V`, possibly non-reduced). A root datum of type `Φ` in a group `G` is a
subgroup `T`, subgroups `U_a`, right cosets `M_a = Tm_a` and a regular vector of `N`, with (DR1)
`U_a ≠ 1`; (DR2) `[U_a, U_b] ⊂ ⟨U_{pa+qb} : p, q ≥ 1⟩` if `b ∉ −ℝ_{>0}a`; (DR3) `U_{2a} ⊊ U_a`;
(DR4) `U_{−a} ∖ 1 ⊂ U_aM_aU_a`; (DR5) `mU_bm^{-1} = U_{s_a b}` for `m ∈ M_a`; (DR6) `TU^+ ∩ U^− = 1`
for its positive system; it is generating if `⟨T, U_a⟩ = G`. For `N := ⟨T, M_a⟩`, `T ⊲ N` normalizes
each `U_a`, `U_a ≠ U_{−a}`, and for finite `ι` some `ν : N/T ≅ W(Φ)` has `nU_an^{-1} = U_{ν(n)a}`
([Bruhat–Tits I], 6.1.1, p. 107; 6.1.2 (3) and (10), pp. 108–109; 6.1.11 (ii), p. 115).
*Checks:* With no roots, generating iff `T = G`. `SL_2(K)`, any field `K`, has a generating datum.
*Lean:* `BruhatTits.RootDatum`, `BruhatTits.RootDatum.weylNormalizer`,
`BruhatTits.RootDatum.exists_weylGroupEquiv`, `BruhatTits.RootDatum.IsGenerating`.

**Rational points carry a root datum.** A connected reductive `G` over a field `K` has a maximal
split torus `S`, cut out (as the points vanishing on it) by a Hopf ideal minimal among those with
split-torus quotient. With `Φ = Φ(G, S)` the nonzero weights of `S` on `Lie(G) ⊗ K̄`, `U_a ⊇ U_{2a}`
the root subgroups, `a^∨` the relative coroot (twice that of `2a` if `2a ∈ Φ`; [Tits], 3.5,
pp. 52–53) and `m_a ∈ N(K)` inducing `s_a`, `(Z(K), (U_a(K), Z(K)m_a))` is a generating root datum
in `G(K)` of type `Φ ⊂ X^*(S) ⊗ ℝ`, `N(K) = ⟨Z(K), M_a⟩`, `N(K)/Z(K) = W_0` ([Bruhat–Tits I], 6.1.3
c), p. 110, semisimple `G`; [Bruhat–Tits II], 4.1.19 (ii), pp. 87–88, quasi-split, and 5.1.2,
p. 146; [Springer], §§3.5 and 3.7, pp. 13–14); if `G` is quasi-split, commutators of `U_a` generate
`U_{2a}` ([Bruhat–Tits II], 4.1.9–4.1.10, pp. 82–83); for any reductive `G`, `U_{2a}` is the unique
smooth geometrically connected unipotent closed subgroup normalized by `Z_G(S)` with Lie algebra
`g_{2a}` (specializing [Springer], §3.5, p. 13, which assumes normalization by `S`).
*Checks:* Quasi-split is needed (rank-one inner form of `Sp_6` in characteristic two, `±2 = 0`).
Restricting characters of `Z_G(S)` to `S` needs `S` commutative: for `SL_2 ⊂ GL_2` (char `≠ 2`) the
identity character of the centralizer `G_m` is `−1` at `−I`, while `SL_2` has no nontrivial character.
*Lean:* `BruhatTits.LocalRootData`, `BruhatTits.exists_localRootData`, `BruhatTits.subgroupPoints`.

**Valuation of a root datum.** A valuation is a family `φ_a : U_a → ℝ ∪ {∞}` with (V0)
`|φ_a(U_a)| ≥ 3`; (V1) `φ_a(u) = ∞` iff `u = 1`, `U_{a,k} := φ_a^{-1}[k, ∞]` a subgroup; (V2) for
`m ∈ M_a`, `φ_{−a}(u) − φ_a(mum^{-1})` constant on `U_{−a} ∖ 1`; (V3) `[U_{a,k}, U_{b,l}]` lies in
`⟨U_{pa+qb,pk+ql} : p, q ≥ 1⟩` if `b ∉ −ℝ_{>0}a`; (V4) `φ_{2a} = 2φ_a|U_{2a}`; (V5) `u'uu'' ∈ M_a`,
`u ∈ U_a ∖ 1`, `u', u'' ∈ U_{−a}` imply `φ_{−a}(u') = φ_{−a}(u'') = −φ_a(u)`. With
`Γ_a := φ_a(U_a ∖ 1)` (so `Γ_{−a} = −Γ_a`) and `Γ'_a ⊆ Γ_a` (equal if `2a ∉ Φ`) the values at `u`
maximal on `uU_{2a}`, `φ` is discrete if each `Γ_a ∩ [r, s]` is finite, and `ω`-compatible if
`φ_a(zuz^{-1}) = φ_a(u) + ω(a(z))` on `Z(K)`, `ω(a(z)) := ω(χ(z))/m` for rational `χ` restricting to
`ma`, `m > 0` ([Bruhat–Tits I], Def. 6.2.1, pp. 116–117, 6.2.2, p. 117, 6.2.5, p. 120, and Def.
6.2.21, p. 127; [Bruhat–Tits II], 4.2.7–4.2.9, p. 91).
*Checks:* Two values violate (V0): trivial `ω` gives none on `SL_2(K)`. For real `ω ≠ 0`,
`φ_±(x_±(c)) = ω(c)` is one ([Bruhat–Tits I], 6.2.3 a), p. 117), `φ_− = −ω` not.
*Lean:* `BruhatTits.Valuation`, `BruhatTits.Valuation.valueSet`, `BruhatTits.Valuation.IsDiscrete`,
`BruhatTits.Valuation.valueSet_neg`, `BruhatTits.Valuation.primedValueSet`.

**The valuation homomorphism of the minimal Levi.** As `X^*_K(Z) ↪ X^*(S)` has finite cokernel,
`⟨χ, v(z)⟩ = −ω(χ(z))` (`χ ∈ X^*_K(Z)`) defines `v : Z(K) → V`. For `ω` nontrivial, discrete, of
rank one and `K` henselian, `Z(K)^1 := ker v` is the maximal bounded subgroup ([Bruhat–Tits II],
4.4.2 (ii), p. 107, for a torus), compact for local `K`, `Λ := v(Z(K))` is a full lattice, and
`v(nzn^{-1}) = w(n)v(z)` ([Bruhat–Tits II], 4.2.5–4.2.7, pp. 90–91; 5.1.22–5.1.23, pp. 154–155;
[He 2018], §1.1, p. 5 (citing [Tits], §1); [Richarz], §1.1, p. 118 (arXiv p. 1)).
*Checks:* If `χ(z) = ϖ`, `⟨χ, v(z)⟩ = −1` and `⟨χ, v(z²)⟩ = −2`; for `SL_2`, `z = diag(ϖ, ϖ^{-1})`
has `⟨a, v(z)⟩ = −2`. Not henselian: on `R^1_{ℚ(i)/ℚ}G_m`, `5`-adically, `((3+4i)/5)^n ∈ ker v`.

**The apartment of a valued root datum.** `ψ ~ φ` (equipollent) if `ψ_a = φ_a + a(v)`, `v ∈ V`; the
apartment `A(φ)` of such pairs `(ψ, v)` is affine under `V` via `v`. For finite `Φ`, `N` acts by
`(n·ψ)_a(u) = ψ_{ν(n)^{-1}a}(n^{-1}un)` (linear part `ν(n)`, translation in the coroot span, kernel
in `T`), and `m = u'uu'' ∈ M_a` with `φ_a(u) = k` is the reflection `x ↦ x − (a(x − φ) + k)a^∨`; for
compatible `φ`, `z ∈ Z(K)` translates `A(G,S,K)` by `v(z)`.
`U_{a,x,r} := {u : φ_a(u) + a(x − φ) ≥ r}` ([Bruhat–Tits I], 6.1.11 (ii), p. 115, 6.2.5–6.2.6, p.
120, 6.2.7, p. 121, 6.2.10, pp. 122–123, 7.4.1–7.4.3, pp. 170–172; [Bruhat–Tits II], 4.2.16, p. 94).
*Checks:* With no roots, distinct central displacements give distinct points.
*Lean:* `BruhatTits.Equipollent`, `BruhatTits.Apartment`,
`BruhatTits.Apartment.displacement_bijective`.

**Root-group coordinates in quasi-split groups.** For `G` quasi-split with a Chevalley–Steinberg
system and `K_a` the field of definition of `a` ([Bruhat–Tits II], 4.1.8, p. 81): if `2a ∉ Φ`,
`x_a : K_a ≅ U_a(K)` and `U_a ≅ Res_{K_a/K} G_a`; if `2a ∈ Φ`, `K_a/K_{2a}` is separable quadratic,
`U_a ≅ Res_{K_{2a}/K} U_0` (`U_0` the unipotent radical of a Borel of `SU_3(K_a/K_{2a})`) and
`x_a : H_0 ≅ U_a(K)`, `H_0 = {(u, v) : v + v̄ = uū}` with `(u, v)(u', v') = (u + u', v + v' + ūu')`,
`x_a(0, v) ∈ U_{2a}`; `⟨U_a, U_{−a}⟩` is covered by `Res_{K_a/K} SL_2` or `Res_{K_{2a}/K} SU_3`
([Bruhat–Tits II], 4.1.4, p. 78; 4.1.8–4.1.14, pp. 81–85). For an involution `τ`,
`I + ce_{0i} + de_{−i,i} − τ(c)e_{−i,0}` is unitary iff `τ(c)c + d + τ(d) = 0` ([Bruhat–Tits II],
4.1.9, p. 82; [van Hoften], App. A by R. Zhou, A.3.5–A.3.6, pp. 60–61 (arXiv v4 pp. 70–71)).
*Checks:* `H_0` is nonabelian if `2 ≠ 0`; for the order-three `x ↦ x²` of `𝔽_8` the criterion fails.

**The valuation of a quasi-split group.** For `ω` a nontrivial real valuation of `K` extending
uniquely to a finite Galois splitting field and `G` quasi-split (`Z_G(S)` a torus; [Bruhat–Tits II],
4.1.1, p. 77), `φ_a(x_a(u)) = ω_a(u)` if `2a ∉ Φ`, and `φ_a(x_a(u, v)) = ½ω_a(v)`,
`φ_{2a}(x_a(0, v)) = ω_a(v)` if `2a ∈ Φ`, is an `ω`-compatible valuation; other systems give
equipollent ones (4.2.2, p. 89; Theorem 4.2.3, pp. 89–90; Proposition 4.2.9, p. 91; 4.2.21, p. 98).

**Affine roots and root-group filtrations.** Affine roots are the `α = a + k : x ↦ a(x − φ) + k` on
`A`, `a ∈ Φ`, `k ∈ Γ'_a` (not `Γ_a`), with walls `{α = 0}`, `U_α := U_{a,k}`, and `U_β ⊂ U_α` when
`α ≤ β` with equal gradients. For reductive `G` and `2a ∉ Φ`, `Γ_a = Γ'_a` is a coset of a discrete
group fixed by the ramification of `K_a` ([Bruhat–Tits I], 6.2.2–6.2.6, pp. 117–120;
[Bruhat–Tits II], 4.2.20–4.2.23, pp. 97–99; [He 2018], proof of Lem. 4.6, pp. 13–14).
*Checks:* For ramified `SU_3`, `p` odd, `Γ'_a = ½ℤ ⊊ ¼ℤ = Γ_a`; using `Γ_a` adds spurious walls.
*Lean:* `BruhatTits.AffineRoot`, `BruhatTits.AffineRoot.eval`, `BruhatTits.AffineRoot.wall`.

**Commutator estimates for valued root groups.** `[U_{a,x,r}, U_{b,x,s}] ⊂ ⟨U_{pa+qb,x,pr+qs}⟩`
(`p, q ≥ 1`) for non-proportional `a, b`; `U_{a,x,r}U_{−a,x,s} ⊂ U_{−a,x,s}Z(K)^1U_{a,x,r}` if
`r + s > 0`; `nU_{a,x,r}n^{-1} = U_{b,ν(n)x,r}` if `nU_an^{-1} = U_b` ([Bruhat–Tits I], 6.2.1 (V3),
p. 117; 6.3.9, p. 131, with doubled-root depths `2r, 2s`, and 6.4.7 (QC1), 6.4.9, pp. 135–136; and
6.2.10 (iii), p. 122; [Bruhat–Tits II], Annexe (Relations de commutation), pp. 169–177).

### RG2.1.3 existence of the valued root datum

**Existence of the valued root datum.** For `K` henselian for a nontrivial discrete rank-one
valuation with perfect residue field and `G` reductive over `K`, `(Z(K), (U_a(K)))` has an
`ω`-compatible valuation, unique up to equipollence; other `S` give `G(K)`-conjugate data
([Bruhat–Tits II], 5.1.1, 5.1.20 and 5.1.23, pp. 145–155; Introduction, p. 7).
**Valuations and apartments under unramified extension.** For `K'/K` unramified Galois (finite or
`Ĕ`) and `S ⊂ S'` with `S'` `K`-rational maximal `K'`-split, `φ` restricts a Galois-invariant
compatible `φ'`: `U_a(K) = (∏_{b↦a} U_b(K'))^{Gal}`, `φ_a = inf φ'_b`, `A(G,S,K) = A(G,S',K')^{Gal}`
for `N(K)` adjusted by `Z(S)(K')` ([Tits], §1.10, p. 36), affine roots restrict ([Bruhat–Tits II],
5.1.16–5.1.21, pp. 151–154; [Bruhat–Tits I], 9.2.1–9.2.14, pp. 204–209).

### RG2.1.4 the affine structure of the apartment

**Walls, alcoves and facets of the apartment.** With `α(x) := a(x − φ) + k`, facets are the classes
of `sgn α(x) = sgn α(y)` for all `α`. For `φ` discrete and finitely many roots, only finitely many
affine roots vanish on a closed segment; alcoves are the components of `A ∖ ⋃{α = 0}`, facets are
relatively open convex polyhedra ordered by closure, as in [Bruhat–Tits I], 1.3.3, pp. 20–21 (see
7.2.5, p. 162); `x` is special if for each root `a` a wall through `x` has gradient in `ℝ_{>0}a`
(`a`, `2a` or `a/2`) ([Bruhat–Tits I], 1.3.1–1.3.7, pp. 19–22; 7.2.1–7.2.7, pp. 161–163).
*Checks:* For roots `±a` with constants `ℤ`, alcoves are `n < a(x − φ) < n + 1`, none special.
*Lean:* `BruhatTits.AffineRoot.finite_walls_segment`, `BruhatTits.Apartment.IsSpecial`.

**The échelonnage root system.** For discrete `φ`, finite `Φ` and `Φ_nm = {a : 2a ∉ Φ}`, walls of
gradient `∝ a` are `{a = k}`, `k` in a coset of `ℤc_a`; `Σ = {a/c_a : a ∈ Φ_nm}` is reduced with the
reflections of `Φ`, the walls at a special `x₀` are `{α(x − x₀) ∈ ℤ}`, `α ∈ Σ`, and `Σ = Φ` if `Φ`
is reduced with all `Γ_a = ℤ`. Ramified `SU_{2n}`, `n ≥ 2`: `Φ = C_n`, `Σ` is `B_n` with coroot
lattice `{x ∈ (½ℤ)^n : Σx_i ∈ ℤ} = v(T(K))`; ramified `SU_{2n+1}`: `Σ` is `C_n` ([Bruhat–Tits I],
1.3.8, pp. 22–23, 1.4.1, pp. 25–26, and 6.2.21–6.2.22, p. 127; [Haines], §4.3, pp. 9–10, Thm. 6.1
and Rem. 6.2, p. 13, arXiv v2; [van Hoften], Appendix A by R. Zhou, A.1, p. 54 (arXiv v4 p. 64)).
*Checks:* For `BC_1` with `Γ'_a = ½ℤ`, `Γ'_{2a} = ½ + ℤ`, `2a` gives `4a ∈ Σ`.

**The affine Weyl group.** `W_a ⊂ Aff(A)` is generated by wall reflections `x ↦ x − α(x)a^∨`
([Bruhat–Tits I], 6.2.10 (ii), p. 122), i.e. by `ν(M_a)`, and normal in `ν(N)`; for discrete `φ`,
finite `Φ` it is simply transitive on alcoves, Coxeter on the walls of an alcove, `W(Φ) ⋉ Q^∨(Σ)` at
special points ([Bruhat–Tits I], 1.3.3–1.3.4, p. 21, 1.3.7–1.3.8, pp. 22–23, 6.2.10–6.2.11,
pp. 122–123, 6.2.19, p. 126, and 6.2.22, p. 127; [Kisin–Zhou], §2.1.4, arXiv v2 p. 7).
*Checks:* `W_a` is not normal in `Aff(A)` (conjugate `x ↦ −x` by `x ↦ x + ¼`).

**Kernel and image of the action on the apartment.** `N(K)` acts on `A` with kernel `Z(K)^1`
([Bruhat–Tits I], 6.2.10 (i), p. 122; [Bruhat–Tits II], 4.2.16, p. 94; [Richarz], §1.1, p. 118), so
`ν(N(K))` extends `W_0` by `Λ`; for `φ` discrete, `ν(N) = W_a ⋊ Stab(C)` for an alcove `C`
([Bruhat–Tits I], 1.3.18, p. 25; [Richarz], (1.5)–(1.6), p. 119); `ν(N(K)) = W_a` for simply
connected `G` over a complete discretely valued field with perfect residue field of cohomological
dimension `≤ 1` ([Richarz], (1.5), p. 119, Rem. 1.5, p. 120), not for `PGL_2`.

**Affine Frobenius action on the apartment over Ĕ.** For an `E`-torus `S_L ⊇ S` maximal split over
`Ĕ`, Frobenius acts affinely on `A(G_L, S_L)`, dually to its action on characters, with finite order
and a fixed point ([Bruhat–Tits II], 4.2.12, pp. 92–93, 5.1.4, p. 147, and Lemma 5.1.13, p. 150),
linearly on the central factor (4.2.16, p. 94). The descent of `A(G, S, E)` onto the fixed locus is
affine (Theorem 5.1.20, pp. 153–154) and matches filtrations (5.1.16, pp. 151–152). For finite
residue field some alcove is Frobenius-stable ([Tits], 1.10.3, p. 37).
*Checks:* For the unramified quadratic norm-one torus it is `x ↦ −x`, never `x ↦ c − x`, `c ≠ 0`.

**The Levi subgroup centralizing a vector of the apartment.** For `v ∈ V` (over `Ĕ`,
`V = X_*(T)_I ⊗ ℝ`), `M_v := ⟨T, U_a : ⟨a, v⟩ = 0⟩`; `M_{cv} = M_v` for `c ≠ 0`, `M_v = G` iff `v`
is central (generating data), `nM_vn^{-1} = M_{w(n)v}`, and `σ(M_v) = M_{ς(v)}` for `σ` compatible
with a linear `ς`, so `M_v` is rational iff `v`, `ς(v)` are killed by the same roots ([Kisin–Zhou],
2.1.6, arXiv v2 p. 8, with `ς` as in 2.1.3, p. 7; [He 2018], §6.1, arXiv v3 p. 16).
*Checks:* For unramified `U_3`, regular `v = (2, 1, 0) ≠ ς(v)` still gives a rational `M_v = T`.

**Independence of choices.** `A`, affine roots, walls, `U_{a,x,r}` and `ν` are canonical: an
equipollent `φ` with given displacement translates `A` (else up to central translation); other
Chevalley–Steinberg systems and any two compatible valuations give equipollent `φ`
([Bruhat–Tits II], 4.2.9–4.2.10, pp. 91–92, and 5.1.23, p. 155); `Int(g)` transports all to
`gSg^{-1}` (depending on `g` mod `Z(K)^1`), and maximal split tori are conjugate ([Bruhat–Tits I],
6.2.5–6.2.12, pp. 120–125; [Bruhat–Tits II], 4.1.13, p. 84, 4.2.12–4.2.13, pp. 92–93).

**Minuscule coweights and the dominance order.** For a based root datum, a coweight `μ` is dominant
if `⟨a, μ⟩ ≥ 0` for `a > 0` and minuscule if `⟨a, μ⟩ ∈ {−1, 0, 1}` for all roots (unlike
`TauCeti.IsMinuscule`); for dominant `λ, μ`, `λ ≤ μ` iff `μ − λ ∈ ℕΔ^∨`; `μ_dom` is dominant in
`Wμ`; for dominant minuscule `μ`, `⟨2ρ, μ⟩ = #{a > 0 : ⟨a, μ⟩ = 1} = dim G/P_μ` ([Kisin–Pappas],
§2.1.1, footnote 3, arXiv v3 p. 25; [Zhu], §1.4, Prop. 1.23 and Cor. 1.24, arXiv v3 p. 19).

### RG2.1.5 arithmetic invariants: π₁, z-extensions and the Kottwitz homomorphism

**The algebraic fundamental group.** For connected reductive `G/K`, maximal torus `T` and based
Galois action `μ_G`, `π₁(G) := X_*(T)/Q^∨` ([Pappas–Rapoport], §2.a.2, p. 10, after Borovoi), `Γ_K`
acting by the inverse transpose of `μ_G` (the transpose fails for cyclic cubic norm-one tori); `W`
acts trivially, so `π₁(G)` is independent of `T` ([Kaletha], Lem. 4.2 and its proof, p. 17, char.
`0`). Its torsion is `π₁(G_der) = Q̄^∨/Q^∨`; `π₁(G) = 0` iff `G` is semisimple simply connected
([Springer], 2.15 (a) and (e), p. 11). Maps with `T ↦ T'` induce `Γ_K`-maps of `π₁` ([Kaletha],
p. 18, the sentence before (4.3)); central torus kernels `Z` give `0 → X_*(Z) → π₁(G̃) → π₁(G) → 0`
(cf. [Haines–Rapoport], (2), p. 3); `ker(π₁(M) → π₁(G))` is spanned by simple coroots outside `M`.
*Checks:* `π₁(GL_n) = ℤ`, `π₁(SL_2) = 0` although `X_*(T) = ℤ`, and `π₁(PGL_n) = ℤ/n`.

**z-extensions.** A z-extension of `G` over a field `K` is a quotient `G̃ ↠ G` of connected
reductive groups whose kernel `Z` is central and an induced torus, with `G̃_der` semisimple simply
connected ([Nguyễn Quốc Thắng], §2.0, p. 4). `G̃(K') ↠ G(K')` for every field `K'/K` (Shapiro,
Hilbert 90; cf. [Kottwitz 1997], 7.4, pp. 297–298), `π₁(G̃)` is torsion-free, `H^1(K, Z) = 1`, and
`Z`-cocycles trivial in `G̃` bound points of `G(K)`. **Existence of z-extensions.** Every connected
reductive `G` over any field has one ([Nguyễn Quốc Thắng], Lemma 2.1(a), p. 4, proof p. 5).
*Checks:* `id_G` is one if `G_der` is simply connected; `SL_2 → PGL_2` is not (kernel `μ_2`).
*Lean:* `ZExtension.DerivedSimplyConnected`, `ZExtension.IsZExtension`,
`ZExtension.surjective_points`, `ZExtension.exists_zExtension`.

**The Kottwitz homomorphism of a torus.** Let `L` be henselian for a nontrivial discrete rank-one
valuation with separably closed residue field, `I = Γ_L`, `T` an `L`-torus ([Haines–Rapoport], p. 1,
(1); [Kottwitz 1997], 1.1, pp. 257–258; [Pappas–Rapoport], §2.a.2, p. 10). A functorial surjection
`κ_T : T(L) → X_*(T)_I` satisfies `⟨λ, κ_T(t)⟩ = ω(λ(t))` for `L`-rational `λ` ([Kottwitz 1997],
7.2, (7.2.1)–(7.2.4), p. 294, and (7.2.5)–(7.2.7), pp. 295–296); it is `ω_{L'}` on `Res_{L'/L}G_m`
(perfect residue field; 7.3, pp. 296–297), and `ker κ_T ⊂ T(L)^1 = κ_T^{-1}(tors)`
([Bruhat–Tits II], 4.4.2, p. 107; [Haines–Rapoport], Remark 10, p. 6). For `E/ℚ_p` finite, `L = Ĕ`,
`κ_T` commutes with `σ` and `κ_T(T(E)) = (X_*(T)_I)^σ`, with kernel `T(E)_0 := T(E) ∩ T(L)_0`
([Kottwitz 1997], 7.5, p. 299, and 7.6–7.7, pp. 299–301).
*Checks:* `κ_{G_m}(ϖ) = 1` ([Pappas–Rapoport], §2.a.2, Step 1, p. 10), but `diag(ϖ, 1) ∈ GL_2` moves
the apartment by `(−1, 0)`; `κ(ϖ_L) = e` on `Res_{L'/L}G_m` for `L'/L` totally ramified of degree
`e`. On the norm-one torus of `L(a)`, `κ_T(−1) ≠ 0` if `a² = ϖ`, `= 0` if `a² ∈ O_L^×` (`ℚ̆_2(i)`).

**The Kottwitz homomorphism.** For `L` as above and `G` connected reductive over `L` there is a
surjection `κ_G : G(L) → π₁(G)_I` ([Kottwitz 1997], 7.4, pp. 297–298; [Pappas–Rapoport], §2.a.2,
pp. 10–11), `κ_D ∘ (G ↠ D = G/G_der)` if `G_der` is simply connected, else via a z-extension. It is
independent of choices, functorial, `κ_T` on tori, satisfies `⟨h|_T, κ_G(g)⟩ = ω(h(g))` for
`L`-rational characters `h` ([Kottwitz 1997], (7.4.3)–(7.4.5), p. 298), and kills the image of
`G_sc(L)` ([Haines–Rapoport], proof of Proposition 3 (b), p. 2); for `E/ℚ_p`, `L = Ĕ`,
`κ_G` commutes with `σ` and `κ_G(G(E)) = (π₁(G)_I)^σ` ([Kottwitz 1997], 7.5, p. 299, and 7.7,
(7.7.1), p. 300).
*Checks:* For `PGL_2`, `κ((0 1; ϖ 0))` is the nonzero class of `ℤ/2`.

### Examples

**The valued root datum of SL_2 and PGL_2.** For `SL_2`, `φ_{±a}(x_±(x)) = ω(x)`; on `A ≅ ℝ`
(`a^∨ ↦ 1`) the walls are `½ℤ`, `diag(t, t^{-1})` acts by `−ω(t)` and `W_a = ν(N(K)) ≅ D_∞`; for
`PGL_2`, `diag(ϖ, 1)` acts by `−½` and `ν(N(K))/W_a ≅ ℤ/2 = π₁(PGL_2)` ([Bruhat–Tits I], 6.1.3 a),
p. 109, 6.2.3 a), pp. 117–118, 6.2.10 (ii), p. 122, 2.1.13, p. 35, 10.2.3 and 10.2.5–10.2.6,
pp. 236–237; [Tits], 3.10, p. 56; p. 124 misprints `ν(m(u)) = (x ↦ −x − ω(u))`).

**The quasi-split unitary group in three variables.** For separable quadratic `K'/K` and
`G = SU_3(K'/K)`: `Φ = BC_1`, `U_a(K) = {(u, v) : v + v̄ = uū}`, `U_{2a}(K) = {(0, v) : v̄ = −v}`,
`φ_a(x_a(u, v)) = ½ω(v)` ([Bruhat–Tits II], 4.1.4, p. 79, and 4.1.9–4.1.12, pp. 81–84; 4.2.2
(3)–(4), p. 89); for discrete `ω`, `Γ'_a` is one coset of `ω(K'^×)` in `Γ_a = ½ω(K'^×)`
(4.2.20–4.2.21, pp. 97–98), `Σ = A_1`, of local Dynkin type `C-BC_1` if ramified (4.2.23, p. 99),
where `Γ_{2a} ⊊ 2Γ_a` (DR3 and V4 give `Γ_{2a} ⊆ 2Γ_a` for every valued root datum, [Bruhat–Tits I],
6.1.1, p. 107, and 6.2.1–6.2.2, p. 117); hyperspecial vertices exist iff `K'/K` is unramified
([Tits], the paragraph after 1.10.2, p. 36; §1.15 (9)–(10) and the hyperspecial criterion, p. 42;
3.8.1, p. 55).

**Nonsplit tori: apartments and Kottwitz maps.** For `T = R^1_{E'/E}G_m`, `E'/E` separable
quadratic, `A` is a point, `T(E)` is compact and `X_*(T) = ℤ` with Galois acting by `−1`; if
unramified, `X_*(T)_I = ℤ`, `σ = −1`, `κ_T|T(E) = 0`; if ramified, `X_*(T)_I = ℤ/2` and `κ_T|T(E)`
is onto ([Kottwitz 1997], 7.6–7.7, pp. 299–301). For `p ≠ 2`, `T(E)_0` is the units `≡ 1 mod m_{E'}`
and `−1 ∉ T(E)_0` ([Pappas–Rapoport], §3.b.1, (3.12)–(3.13), p. 14); for `ℚ_2(i)`, `−1 ∈ T(E)_0`.

### Dependencies

RG2.0 and RG2.0a; ReductiveGroups layer 7 (unvalued relative and absolute root data) and layer 6
(z-extensions); RootSystems layers 3 and 4; LocalFieldsRamification layer 3; Mathlib `RootPairing`,
`CoxeterSystem`, `Valuation`, `Representation.Coinvariants`.

## Layer RG2.2: buildings and group action

The enlarged building `B(G, K) = G(K) × A / ∼` over the apartment of RG2.1: axioms, metric, facets,
fixers, reduced building, functoriality, descent and the classical models.

### RG2.2.1 the building and its axioms

**The Bruhat–Tits building.** For `K` nontrivially discretely valued (not necessarily henselian),
`φ` a valuation of `(Z(K), (U_a(K))_a)` compatible with the torus valuation map, `A` its enlarged
apartment and `P_x := ⟨N(K)_x, U_{a,−a(x)}⟩`, let `B(G,K) := G(K) × A / ∼`, `(g,x) ∼ (h,y)` iff
`y = nx`, `g⁻¹hn ∈ P_x` for some `n ∈ N(K)`. Then `A ↪ B` is `N(K)`-equivariant, `B = G(K)A`,
`Stab(x) = P_x` (so `B ≠ G(K) × A`), and `B` depends only on the equipollence class of `φ`
([Bruhat–Tits I], 7.4.1–7.4.4, pp. 170–172; [Bruhat–Tits II], 4.2.12–4.2.16, pp. 92–95).

**Apartments and the building axioms.** Apartments `g·A` ↔ maximal split tori `gSg⁻¹`; two points,
facets, or a facet and a sector germ share an apartment; `g` acts on the enclosed set `A ∩ g⁻¹A` as
some `n ∈ N(K)`; `Stab(A) = N(K)`, with pointwise fixer `Z(K)¹ = ker v`; a chamber `C ⊂ A'` gives a
unique retraction `B → A'`, equal to `b⁻¹·` (`b` fixing `C`) on apartments through `C`
([Bruhat–Tits I], Prop. 7.4.4, Prop. 7.4.8, Cors. 7.4.9–7.4.10, Thm 7.4.18, Thm 7.4.19, pp.
172–175).

**The building is a complete CAT(0) space.** A `W_0`-invariant scalar product on `V` (unique up to
positive factors on irreducible components and on `V¹`) gives a unique metric Euclidean on
apartments, `G(K)`-invariant, complete for discrete `φ`, with `1`-Lipschitz retractions, and CAT(0):
`d(z,m)² + d(x,y)²/4 ≤ (d(z,x)² + d(z,y)²)/2` for the midpoint `m` of `[x,y]` ([Bruhat–Tits I],
Prop. 7.4.20 (with 2.5.1–2.5.16), pp. 43–46 and 175, Lemma 3.2.1, p. 63, 2.5.12 and 7.5.1, pp. 45
and 180; [Bruhat–Tits II], 4.2.12 and 4.2.16, pp. 92–95).

**The Bruhat–Tits fixed point theorem.** For `φ` discrete, an isometry group with a bounded orbit
fixes its circumcentre, which lies in the orbit's closed convex hull; bounded (for `E` local:
compact) subgroups fix a point of `B_red`, and of `B` if inside `G(E)¹ := ⋂_χ ker(ω∘χ)`; maximal
bounded subgroups of `G(K)¹` are point stabilizers (not conversely: an `SL_2` edge midpoint gives
the Iwahori), for `G` simply connected semisimple the maximal parahorics, with classes ↔ vertices of
a closed chamber; fixed points of compact `H` persist over finite `E'/E` ([Bruhat–Tits I],
3.2.1–3.2.4 and Thm 3.3.1 with Cors. 3.3.2–3.3.3, pp. 63–65).

### RG2.2.2 facets, fixers and the reduced building

**Facets, chambers and special points of the building.** The translates of facets of `A` partition
`B(G,K)`, with `G(K)`-invariant closure order; chambers (alcoves) and vertices are the maximal and
minimal facets (in `B`, times `V¹`); a point is special if so in some, equivalently every, apartment
through it. `B` is a polysimplicial `G(K)`-complex, types being orbits of the type-preserving
subgroup (which contains the parahorics); `ε_F : Stab(F) → {±1}` is the determinant sign on the span
of the reduced facet, the vertex-permutation sign for affinely independent vertices
([Bruhat–Tits I], Définition 7.4.12, Prop. 7.4.13, Cor. 7.4.14, pp. 173–174, and 1.3.4–1.3.7, pp.
21–22).
*Checks:* For `GL_2` an edge midpoint is not special and `(0 1; ϖ 0)` swaps its edge (`ε_F = −1`);
reversing one factor of a square has `ε_F = −1` but vertex-permutation sign `+1`.

**Stabilizers and pointwise fixers in the building.** For `Ω ≠ ∅`, `G(K)_Ω ⊂ Stab(Ω)` (equal for
points) is antitone, `G(K)_{gΩ} = gG(K)_Ωg⁻¹`, and `G(K)_Ω = ⟨N(K) ∩ G(K)_Ω, U_{a,Ω}⟩` for `Ω ⊂ A`;
for `E` local and `Ω` bounded it is compact open in `G(E)¹`, and `B_red`-stabilizers are open,
compact modulo the centre; a facet's fixer is its closure's and its vertices' (in `B_red`,
type-preservingly) ([Bruhat–Tits I], 7.1.1–7.1.11 and Prop. 7.4.4, pp. 156–160 and 172;
[Bruhat–Tits II], 4.2.14, 4.2.16 and 4.2.19, pp. 93–97; [Haines–Rapoport], Rem. 11, p. 7).
*Checks:* `[O²] ∈ B` has fixer `GL_2(O) ≠ E^×GL_2(O)`; `(0 1; ϖ 0)` stabilizes, not fixes, an edge.

**Reduced versus enlarged building.** With `V¹ := Hom(X^*_K(G), ℝ) ≅ X_*(A_G) ⊗ ℝ =: V_Z` and
`⟨θ(g), χ⟩ = −ω(χ(g))` (`θ` depends on `ω`: for `GL_1/ℚ`, `θ(2)` is `−1` `2`-adically, `0`
`3`-adically), `B_red(G,K)` (apartment `A/V_Z`) is `B(G_der,K) = B(G^ad,K)` as a `G(K)`-set, with
trivial central action, and `B ≅ B_red × V¹`, `g(x,v) = (gx, v + θ(g))`, as products of apartments,
facets and metrics (on `A`: projection to `V_Z` along coroots), canonically up to `V¹`-translation
([Bruhat–Tits II], 4.2.14–4.2.16, pp. 93–95; [Prasad], Introduction, pp. 1–2).

**Cocompact action and fundamental domain.** For `E` local a closed `B_red`-chamber is a fundamental
domain for `G(E)⁰ := ⟨parahorics⟩`, so facet orbits and parahoric classes are finite and `G(E)`
(like `G'(E)`, `G'` tame twisted Levi) acts cocompactly on `B_red`, `B` ([Bruhat–Tits I], Théorème
7.4.18 and Remarque 7.4.22, pp. 174–176; [Fintzen], proof of Thm 6.1, after Lem. 6.1.1, p. 23).

**Independence of the building from choices.** `B(G,K)` with action, apartments, facets and affine
structure is independent of `S`, of `φ` up to equipollence and of the Chevalley–Steinberg system
(unique equivariant affine bijections; on `B` up to `V¹`-shifts); valued-field isomorphisms
transport it ([Bruhat–Tits II], 4.2.12–4.2.13, pp. 92–93; [Bruhat–Tits I], Cor. 7.4.32, p. 179).

### RG2.2.3 descent and functoriality

**Buildings under finite field extensions.** For `K` henselian discretely valued with perfect
residue field and `K'/K` finite with extending valuation, a canonical injective `G(K)`-equivariant
`i_{K,K'} : B(G,K) → B(G,K')`, affine on apartments, scaling normalized distances by `e`, transitive
in towers, natural in valued-field isomorphisms, with Galois-fixed image (the whole fixed set if
tame, not always if wild); for `K'/K` unramified, points special in `B(G,K')` are special,
hyperspecial if `G` splits over `K'`; for `G` split semisimple, `G^ad(K)` is transitive on special
points ([Tits], 2.6.1 and §§2.5–2.6, p. 47; [Bruhat–Tits II], 5.1.41, pp. 161–162).
*Checks:* No `SL_2(ℚ)`-map from the `2`-adic to the `3`-adic tree exists; over the non-henselian
`5`-adic `ℚ`, `B(R¹_{ℚ(i)/ℚ}G_m, ℚ)` is a point while `(2+i)/(2−i)` translates the line over `ℚ(i)`.

**Unramified descent of the building.** For `K` as above, `B(G,K) → B(G,K^sh)` is an isometry onto
`B(G,K^sh)^Σ = G(K)·A(G,S,K)`, `Σ := Gal(K^sh/K)`; for `E` local, `B(G,E) = B(G,Ĕ)^σ = B(G,E^ur)^σ`,
`E`-facets (alcoves) are fixed parts of (maximal) `σ`-stable `Ĕ`-facets; `Σ` fixes a unique point of
`B_red(Z)`, `Z` centralizing a maximal `K^sh`-split `K`-torus ([Bruhat–Tits II], 5.1.1, pp. 145–146,
5.1.21, p. 154, 5.1.24–5.1.28, pp. 155–157; [Bruhat–Tits I], 9.2.14–9.2.15, pp. 209–210).

**Fixed points of finite groups of invertible order.** For `H` connected reductive over a field `k`
and a finite group `Θ` acting on `H` with `|Θ|` invertible in `k`, `R ↦ H(R)^Θ` is represented by a
smooth closed subgroup `H^Θ` ([Edixhoven], Prop. 3.1, p. 293, and Prop. 3.4, p. 294). General
target: `(H^Θ)°` is reductive ([Prasad], §2.4, p. 6); for `K` henselian discretely valued, `Θ` acts
on `B(H,K)` isometrically, compatibly with `H(K)`, and if the residue field is separably closed of
characteristic prime to `|Θ|`, `(𝓗_Ω)^Θ` is smooth closed with generic fibre `H^Θ` (`Ω ≠ ∅` bounded
`Θ`-stable in an apartment) ([Prasad], §2.5(i), pp. 6–7).
*Checks:* Inversion on `G_m` (characteristic `≠ 2`) fixes `{±1}`: `H^Θ` need not be connected.
*Lean:* `TameDescent.smooth_fixedPoints`.

**Buildings of Weil restrictions.** For `K'/K` finite separable and `H = Res_{K'/K} G'`, an
`H(K)`-equivariant bijection `B(H,K) ≅ B(G',K')`, unique up to `V¹`, affine on apartments, isometric
up to the ratio of normalized valuations, with stabilizer models related by `Res_{O_{K'}/O_K}`
([Kisin–Pappas–Zhou], §2.1.2, p. 11; [Bruhat–Tits II], 4.2.12 and 4.2.9, pp. 91–93).

**Containment in Galois fixed points.** For `K'/K` finite Galois as above, `Gal(K'/K)` acting on
`B(G,K')` by transport of structure fixes `i_{K,K'}(B(G,K))`, by naturality, with no tameness
([Tits], §2.6.1, p. 47; [Bruhat–Tits II], 5.1.41, pp. 161–162).

**Tame descent of buildings.** Let `K` be henselian, discretely valued, with perfect residue field
of characteristic `p`, `G` connected reductive, `K̃/K` finite Galois with group `Γ` and ramification
index `e` (`ω_{K̃} = e·ω_K` on `K^×`; `e = 1` if unramified, even of degree `p`) prime to `p`. Then
`Γ` acts isometrically on `B(G,K̃)` by transport of structure, compatibly with `G(K̃)^Γ = G(K)`, and
`i_{K,K̃}` maps bijectively onto `B(G,K̃)^Γ` (false for the trivial action); `B(G,K̃)^I = B(G,K̃^I)`
(`I` inertia); `A(T,K̃)` meets `B(G,K)` for a maximal `K`-torus `T` split by `K̃`; if
`G_{K̃} ≅ H_{K̃}`, `H` pinned Chevalley, then `G(K) = H(K̃)^Γ` and `B(G,K) = B(H,K̃)^Γ` for
`γ·h = c(γ)γ(h)`, `c` a cocycle in `H^ad(K̃) ⋊ Aut_pin(H)` ([Prasad], §4.5, p. 27, and Thm 3.17, p.
23; [Bruhat–Tits II], 5.1.1, pp. 145–146, 5.1.25, p. 155; [Tits], 2.6.1, p. 47; [Kisin–Pappas],
§1.2.14, pp. 135–136; [Kisin–Pappas–Zhou], §2.1.2, p. 11).

**Buildings under central extensions and quotients.** A central surjection `α : G → G'` of connected
reductive groups carries `S`, root groups and `φ` to those of `G'` (`φ'(α(u)) = φ(u)`); the induced
map is equivariant, affine on apartments (dual to pulling back characters along `α|_S`), depends on
central origins and need not be injective; it induces an isometric equivariant bijection
`B_red(G,K) ≅ B_red(G',K)` ([Bruhat–Tits II], 4.2.12–4.2.16, pp. 92–95, and 5.1.1, pp. 145–146).

**Products and Levi subgroups.** `B(∏G_i,K) = ∏B(G_i,K)`; a `K`-Levi `M ⊃ S` gives an
`M(K)`-equivariant toral injection `B(M,K) → B(G,K)`, `A(S)` onto `A(S)`, unique up to
`X_*(A_M) ⊗ ℝ`, with canonical image `M(K)·A`; for `∏GL(V_i) ⊂ GL(⊕V_i)`, `(Λ_i, c_i + t_i) ↦ ⊕Λ_i`
and `(α_i) ↦ min_i α_i(x_i)` ([Bruhat–Tits I], Définition 7.6.1, Props. 7.6.3–7.6.4, Cor. 7.6.5, pp.
184–187; [Bruhat–Tits II], 4.2.17–4.2.18, pp. 95–96; [Kisin–Pappas], §1.2.25, p. 138).

**Twisted Levi subgroups and their buildings.** A smooth closed `G' ⊂ G` is a twisted Levi if
`G'_{K'}` is a Levi of `G_{K'}` for a finite `K'/K` ([Fintzen], Def. 3.3, p. 9), tame if `K'` can be
tamely ramified Galois (automatic if the tori of `G` split tamely); twisted Levis are connected
reductive, stable under finite base change, and include `K`-Levis, maximal `K`-tori and torus
centralizers; for `K` local and `G'` tame, Levi embeddings over `K'` descend to a toral
`G'(K)`-equivariant `B(G',K) ↪ B(G,K)` ([Fintzen], Rem. 3.9, p. 11).
*Checks:* `E'^× ⊂ GL_2(E)`, `[E':E] = 2`: a twisted Levi, no `E`-Levi, not tame for wild `E'/E`.

### RG2.2.4 classical groups, the tree and examples

**The building of GL(V) via norms and lattice chains.** For `K` nonarchimedean local, `ω` normalized
(`ω(ϖ) = 1`, `ω(0) = ∞`): a splittable norm is `α : K^n → ℝ ∪ {∞}` with `α(tx) = α(x) + ω(t)`,
`α(x+y) ≥ min(α(x), α(y))`, `α⁻¹(∞) = 0` and `α(Σx_ie_i) = min_i(ω(x_i) + α(e_i))` in some basis; a
graded periodic lattice chain is a nonempty `K^×`-stable chain of `O`-lattices with strictly
decreasing grading, `c(tΛ) = c(Λ) + ω(t)`. For `n > 0` they correspond: `α` goes to its balls
`{α ≥ r}`, graded by `inf α(Λ)`. General target: both are `B(GL_n,K)`, equivariantly for
`(gα)(x) = α(g⁻¹x)`, apartment points `v` giving `min_i(ω(z_i) + v_i)` (`φ_ij(I + cE_ij) = ω(c)`;
[Bruhat–Tits I] negate `v`) and `t(1,…,1)` acting by `α ↦ α + t`; a chain has a period `r ∈ [1, n]`
and a determining segment `ϖΛ^0 ⊊ Λ^{r−1} ⊊ ⋯ ⊊ Λ^0`, stabilizer `⋂_i GL(Λ^i)`, and `B_red` has
vertices `[Λ]`, facets the ungraded chains ([Bruhat–Tits 1984], 1.1, p. 262, 1.4–1.5, pp. 263–264,
1.7–1.8, pp. 266–267, 1.9, p. 268, 1.17(i), pp. 273–274, 1.25, p. 277, 2.10–2.11, pp. 282–283;
[Bruhat–Tits I], 10.2.1–10.2.5, pp. 234–237).
*Checks:* The zero space has a norm but no graded chain (`c = c + 1`); `c(ϖΛ) = c(Λ) + 2` is no
grading; `ϖ·1` maps each lattice into itself, fixing no norm; `GL_2(𝔽_2)` has no valuation.
*Lean:* `GLBuilding.ω`, `GLBuilding.SplittableNorm`, `GLBuilding.GradedLatticeChain`,
`GLBuilding.exists_normEquivChain`.

**Equivariant toral embeddings into the GL building.** For `K` nonarchimedean local, `G` connected
reductive with maximal split `S` and a closed immersion `ρ : G → GL_n`: (1) there is a
`G(K)`-equivariant toral isometric embedding `ι : B(G,K) → B(GL_n,K)`, `ι(x) = h·α_{A(x)}` on `A(S)`
with `hρ(S)h⁻¹` diagonal and `A` affine, depending on the image of a special point ([Kisin–Pappas],
§1.2.1, p. 131); (2) shifts `t + ι` are again such ([Kisin–Pappas], Rem. 1.2.7(b), p. 133); (3) for
`char K = 0`, `G` split, `ρ` irreducible minuscule, two such embeddings over `K^ur` differ by a
shift ([Kisin–Pappas], Prop. 1.2.10 and Cor. 1.2.11, pp. 134–135).
*Checks:* `ρ` must be algebraic: over `𝔽_q((u))` an abstract `K^× ↪ O^× ⊂ GL_1(K)` fixes every norm.

**Kisin–Pappas minuscule building embeddings.** (1) For `G` split with reductive model `G_O`,
hyperspecial `x_o`, `ρ = ⊕ρ_i` with `ρ_i` irreducible through epimorphisms onto split reductive
groups (separable on root subgroups if `K = k((π))`) and lattices `Λ_i` with
`ρ_i(G_O(O^ur)) ⊂ GL(Λ_i ⊗ O^ur)`, there is a Galois- and `G(K^ur)`-equivariant toral
`ι : B(G,K^ur) → B(GL(V),K^ur)` with `ι(x_o) = [(⊕Λ_i) ⊗ O^ur]`, for faithful `ρ` a unique isometric
embedding restricting to `B(G,K)` ([Kisin–Pappas], Prop. 1.2.3 and Lem. 1.2.5, pp. 132–133). (2) For
`char K = 0`, `G` split over tame Galois `K̃ ⊃ K^ur`, `ρ` minuscule, inertia invariants of the
(twisted-Galois-equivariant) split map give a toral `G(K^ur)`-map compatible with Levis, an
embedding for faithful `ρ`; for `K = k((π))`, likewise for restrictions of scalars of twisted
minuscule Weyl modules ([Kisin–Pappas], Prop. 1.2.21 and §§1.2.22–1.2.27, pp. 137–139).

**The building of GSp(V) via self-dual norms and chains.** For perfect alternating `ψ` and
`αᵛ(x) := inf_{y ≠ 0}(ω(ψ(x,y)) − α(y))`, `B(Sp(V),K)` is the locus `αᵛ = α` and the enlarged
`GSp(V)` building, `≅ B(Sp(V),K) × ℝ` via `m/2`, the locus `αᵛ = α − m` (`m ∈ ℝ`); self-dual norms
are the maximal ones dominated by `ω(ψ(x,y))` ([Bruhat–Tits I], note added in proof, p. 239). For
`Λᵛ := {x : ψ(x,Λ) ⊆ O}`, `{α ≥ r}ᵛ = {αᵛ > −r−1}`, so self-dual chains are dual-stable, duals
graded by the next value `> −r−1`, with a segment `Λ^{r−1} ⊂ ⋯ ⊂ Λ^0 ⊂ (Λ^0)ᵛ ⊂ ⋯ ⊂ ϖ⁻¹Λ^{r−1}`,
`(Λ^i)ᵛ = Λ^{−i−a}`, `a ∈ {0,1}`, stabilizer `GSp ∩ GL(V)_x`, and a diagonal embedding into the
symplectic sum over `−(r−1)−a ≤ i ≤ r−1` ([Kisin–Pappas], §1.1.11 and (1.1.12), pp. 130–131).
*Checks:* On `K²`, `ψ(e,f) = 1`, `min(ω(x) + a, ω(y) − a)` is self-dual for `0 < a < 1/2`; at
`a = 1/10`, `Oe + Of`, `Oe + ϖOf` have dual-grade sums `−1/5`, `−4/5`: no common constant.

**Buildings of GL_m over a division algebra.** For `D` central division of index `d` over `K`
(`ω(ϖ_D) = 1/d`) and `V = D^m`, `B(GL_D(V))` is the splittable `D`-norms and the graded periodic
right `O_D`-chains, point stabilizers being unit groups of the associated orders
([Bruhat–Tits 1984], 1.1–1.8, pp. 262–267, and 3.2–3.6, pp. 286–288); for `L/K` unramified of degree
`d`, `B(GL_m(D),K) = B(GL_{md},L)^{Gal(L/K)}` ([Bruhat–Tits 1984], 4.2, 4.7 and 4.10, pp. 292–296).

**The Bruhat–Tits tree of SL_2.** Let `K` be nonarchimedean local, `|κ| = q`, `K^×` acting on
`O`-lattices of `K²` by scaling. The graph `T_K` on `K^×`-classes `[Λ]`, `[Λ] ∼ [Λ']` iff
`ϖΛ ⊊ Λ' ⊊ Λ` for some representatives and uniformizer `ϖ`, is a tree with all degrees `q + 1`
(lines of `Λ/ϖΛ`). General target: `T_K` is the facet complex of `B_red` for `GL_2`, `SL_2`;
`GL_2(K)` acts via `PGL_2(K)`, edge- and vertex-transitively; `type[Λ] := ω(det Λ) mod 2` shifts by
`ω(det g)`, so `SL_2(K)` keeps types, has two vertex orbits and no inversions; `(0 1; ϖ 0)` inverts
an edge ([Garrett], §§19.1–19.3, pp. 322–330; [Serre], Ch. II §§1.2–1.3, pp. 104–105).
*Checks:* `[O²]` and `[O ⊕ ϖ²O]` are not adjacent.
*Lean:* `BTTree.instMulActionUnitsLattice`, `BTTree.Vertex`, `BTTree.Adj`, `BTTree.tree`,
`BTTree.isTree`, `BTTree.natCard_neighborSet`.

**Ihara's theorem: SL_2 as an amalgam.** For adjacent `x_0 = [O²]`, `x_1 = [O ⊕ ϖO]` with
stabilizers `K_0 = SL_2(O)`, `K_1 = gSL_2(O)g⁻¹` (`g = diag(1,ϖ)`) and Iwahori `I = K_0 ∩ K_1`,
`K_0 *_I K_1 ≅ SL_2(K)` (Mathlib `Monoid.PushoutI`), for any field with a discrete valuation;
likewise for `PSL_2(K)` and `PGL_2(K)^{ev}` (`ω(det)` even), but not `PGL_2(K)`, which inverts edges
([Serre], Ch. I §4.1, Thm. 6, p. 48, and Ch. II §1.4, Thm. 3 and Cor. 1, p. 110;
[Calegari–Geraghty], §9.1, Rem. 9.7, pp. 89–90).

**Buildings of tori and anisotropic groups.** For a torus `T` with split part `S_T`,
`B(T,K) = X_*(S_T) ⊗ ℝ`, `T(K)` acting via `θ`, all stabilizers `T(K)¹`; for `G` anisotropic modulo
centre `B_red` is a point; for `G` anisotropic (e.g. `R¹_{E'/E}G_m`) `G(K)` is bounded and `B(G,K)`
is the unique `Gal(K^sh/K)`-fixed point of `B(G,K^sh)` ([Bruhat–Tits II], 5.1.26–5.1.27, p. 156).

### Examples

The examples of this layer are the models of RG2.2.4 (`GL(V)`, `GSp(V)`, `GL_m(D)`, the tree of
`SL_2`, tori) and the `GL_2` Checks above.

### Dependencies

RG2.1, RG2.0a; ReductiveGroups, layers 6–7; LocalFieldsRamification, layer 3; Tau Ceti
`TauCeti.AlgHom.mapDomain`, `TauCeti.AlgHom.mapValue`, `TauCeti.AlgHom.baseChangePointsMulEquiv`;
Mathlib `Submodule.IsLattice`, `SimpleGraph.IsTree`, `Monoid.PushoutI`, `ValuativeExtension`.

## Layer RG2.3: parahoric and congruence group schemes

This layer builds integral models over `O = 𝒪[K]`, their parahoric and level subgroups, Moy–Prasad
filtrations and Lang's theorem. Over a DVR, `K` has a discrete nontrivial valuative relation of rank
one (discreteness alone admits lexicographic `ℤ × ℤ`); `ModelField K` adds henselian `O` and perfect
`κ` ([Bruhat–Tits II], 5.1.1, pp. 145–146), as for `ℚ_p`, not for trivially valued fields. `p` is
the residue characteristic and `T_ϖ` the norm-one torus of `K(a)`, `a² = ϖ`.

### RG2.3.1 smooth affine models and their closures

**Smooth affine integral models.** For `K` with a valuative relation, a smooth affine model `𝒢` of
`G = Spec H` is a smooth finite-type commutative Hopf `O`-algebra `A` with a Hopf isomorphism
`K ⊗_O A ≅ H`, special fibre `κ ⊗_O A` and `𝒢(O) := {g ∈ G(K) : g(A) ⊆ O}`; morphisms are Hopf maps
over `H` (at most one). Over a DVR, for connected `G`, `𝒢°` (open, special fibre `(𝒢_κ)°`) is a
smooth affine model, `𝒢 = 𝒢°` iff `𝒢` has connected fibres, a model with connected fibres maps
to `𝒢°` iff it maps to `𝒢` (which determines `𝒢°`), and `𝒢(O)/𝒢°(O) ↪ π_0(𝒢_κ)(κ)` is finite
([Bruhat–Tits II], 1.2.2–1.2.5 and 1.2.12, pp. 17–20; Lemma 2.2.6, p. 46).
*Checks:* `O[x]/(x^p − 1)` is flat, not smooth; in `O[t, t⁻¹]`, integral `ϖ ∉ 𝒢(O)`; for
disconnected `G`, `𝒢°_K = G°`; `Spec(O × K) ⊂ ℤ/2` has one-point special, two-point generic fibre.
*Lean:* `IntegralModel.SmoothModel`, `IntegralModel.SmoothModel.specialFibre`,
`IntegralModel.SmoothModel.integralPoints`.

**Reductive models over O and hyperspecial subgroups.** `𝒢` is reductive if both fibres are
connected reductive, and `P ≤ G(K)` is hyperspecial if `P = 𝒢(O)` for a reductive `𝒢`; `GL_{n,O}` is
reductive. For `K` henselian with perfect `κ`, `𝒢_κ` is reductive iff `G` splits over `K^sh` and
`𝒢 ≅ 𝒢°_x`, `x` special in `B(G, K^sh)` ([Bruhat–Tits II], 4.6.31, pp. 136–137; 5.1.40, p. 161); for
finite `κ`, such `𝒢` exists iff `G` is unramified ([Tits], 1.10.2, p. 36).
*Checks:* The `GL_2` Iwahori scheme is smooth, not reductive; `SL_1(D)`, `D` quaternion over `ℚ_p`,
splits over `ℚ_p^{ur}` but has no reductive `ℤ_p`-model.
*Lean:* `IntegralModel.SmoothModel.IsReductive`,
`IntegralModel.SmoothModel.generalLinear_isReductive`, `IntegralModel.IsHyperspecialSubgroup`.

**Schematic closure in an integral model.** For a field `K` over `O`, an `O`-algebra `A` and
`I ⊂ K ⊗_O A`, let `I^♮ := A ∩ I` (closure `A/I^♮`). For `O` a DVR with fraction field `K` and `A`
flat, it is flat with generic fibre `(K ⊗_O A)/I`, `I^♮` is the unique `J` with `A/J` flat and
`K ⊗ J = I`, its `O'`-points are `V(I)(K ⊗ O') ∩ (Spec A)(O')` for flat domains `O'`, and Hopf
ideals of `K ⊗_O B` pull back to Hopf ideals of Hopf `B` ([Bruhat–Tits II], 1.2.5–1.2.7, pp. 17–18).
*Checks:* `0^♮ = 0` for flat `A`, but `0 × O/(ϖ)` for `A = O × O/(ϖ)`; for `A = O[x]`,
`I = (x − ϖ^{-1})`, the closure `O[x]/(ϖx − 1)` has empty special fibre.
*Lean:* `SchematicClosure.closureIdeal`, `SchematicClosure.closure`,
`SchematicClosure.closure_flat`, `SchematicClosure.closure_unique`,
`SchematicClosure.closureIdeal_isHopfIdeal`.

**The Bruhat–Tits extension principle.** Over a strictly henselian DVR, a `K`-homomorphism `G → G'`
extends (uniquely) to smooth affine models `𝒢 → 𝒢'` iff it maps `𝒢(O)` into `𝒢'(O)`. General target:
`O[𝒢] = {φ ∈ K[G] : φ(𝒢(O)) ⊆ O}`, so `𝒢(O)` determines `𝒢`, and over any DVR the same holds with
`O^sh`-points ([Bruhat–Tits II], 1.7.1–1.7.6, pp. 37–39).
*Lean:* `IntegralModel.extend_iff`.

**Big-cell criteria.** Over a DVR, a morphism `𝒢 → 𝒢'` of smooth affine groups with connected
fibres that is a generic isomorphism and an open immersion on a fibrewise dense open `U ∋ 1` is an
open immersion, an isomorphism if `𝒢'` has connected fibres, and maps defined on `U` extend uniquely.
If the closure `𝒢` of `G` (with a schematic root datum) in a smooth affine group is flat with smooth
closures `𝒯`, `𝒰_a`, then `∏_{a<0}𝒰_a × 𝒯 × ∏_{a>0}𝒰_a ↪ 𝒢` is an open dense big cell, `𝒢` is smooth
and `𝒢°` affine ([Bruhat–Tits II], 1.2.13–1.2.14, pp. 20–21; 2.2.3–2.2.5, pp. 44–45).

**Quotients of group schemes over a DVR.** For `S` locally noetherian, `dim S ≤ 1`, `𝒢` locally of
finite type and `ℋ ⊂ 𝒢` closed, `S`-flat, `𝒢/ℋ` (fppf) is a scheme, faithfully flat under `𝒢`, a
group if `ℋ ⊲ 𝒢`, smooth if `𝒢` is ([Anantharaman], Chapitre IV, 4.0, Théorèmes 4.A–4.D, pp. 53–54).

**Prasad–Yu closed-immersion criterion.** Over a DVR with `char κ ≠ 2`, a homomorphism from a
reductive model `𝒢` to an affine finite-type `O`-group `ℋ` that is generically a closed immersion is
one: `O[ℋ] → O[𝒢]` is surjective if it is after `K ⊗_O −`. General target: the same if `G_{K̄}` has
no normal `SO_{2n+1}`, and faithful `G → GL(V)` with `𝒢(O^sh) ⊂ GL(Λ)(O^sh)` give `𝒢 ↪ GL(Λ)`
([Prasad–Yu], Cor. 1.3, p. 2; [Kisin–Pappas–Zhou], proof of Prop. 2.4.2, arXiv p. 16).
*Checks:* It fails for `SO_{2n+1}` in characteristic `2` ([Prasad–Yu], §7.1, p. 13).
*Lean:* `IntegralModel.surjective_of_reductive_of_generic`.

**Faithful representations of integral models.** Over a DVR each smooth affine model `𝒢` embeds
closedly in some `GL_{n,O}`: some Hopf map `O[GL_n] → O[𝒢]` is surjective. General target: over
Dedekind `O`, with `GL_{n,O}/𝒢` quasi-affine, affine for reductive `𝒢` ([Zhu], §1.4.1, arXiv p. 17).
*Lean:* `IntegralModel.exists_closedImmersion_generalLinear`.

### RG2.3.2 Néron models of tori and quasi-tame groups

**The lft Néron model of a torus.** Over a DVR a `K`-torus `T` has a smooth separated lft group
model `𝒯` with generic fibre `T` through which maps to `T` from generic fibres of smooth `O`-schemes
extend uniquely; so `𝒯(O) = T(K)` ([Bosch–Lütkebohmert–Raynaud], §10.2, Theorem 2, p. 297).
**Finite-type and connected Néron models of tori.** `𝒯^ft` is the largest finite-type open subgroup
of `𝒯`, smooth affine, and `𝒯°(O)` has finite index in `𝒯^ft(O)`; over a local field `𝒯^ft(O)`
contains all subgroups of `T(K)` with compact closure, and over a `ModelField`, `𝒯°(O)` lies in
every apartment parahoric ([Bruhat–Tits II], 4.4.2, p. 107, 4.4.12–4.4.14, pp. 110–112).
*Checks:* For `G_m`, `𝒯` is not affine and `ϖ ∈ 𝒯(O) ∖ 𝒯^ft(O)`. For `T_ϖ`, `𝒯 = 𝒯^ft` and, in every
residue characteristic, `−1 = a/ā` has `κ_T(−1) = 1`, so `[𝒯^ft(O) : 𝒯°(O)] = 2`.

**Quasi-tame and essentially tame groups.** For `K` local, `G` is quasi-tame iff
`G ≅ ∏_i Res_{K_i/K} H_i` with `K_i/K` finite separable and `H_i` split over a tame extension;
essentially tame iff `G^ad` is; tamely ramified iff split by a Galois extension of ramification
index prime to `p`. Tame implies quasi-tame, and `Res_{K'/K}` preserves quasi-tameness
([Kisin–Pappas–Zhou], Def. 3.1.4 (1)–(2), arXiv p. 18).
*Checks:* Wild `Res_{K'/K} G_m` is quasi-tame; wild quadratic norm-one tori over `ℚ_2` are not.

**Exact sequences of tori and their models.** For `1 → T' → T → T'' → 1` exact, `T` tamely split,
there is an fppf-exact `1 → 𝒮' → 𝒯° → 𝒯''° → 1` with `𝒮'° = 𝒯'°`, `π_0(𝒮'_κ) ⊂ (X_*(T')_I)_tors`,
and `T(E)_r → T''(E)_r` is onto with kernel `T'(E)_r` for `r > 0` ([Pappas–Rapoport], Lem. 6.7,
arXiv pp. 28–29 (for `k((t))`, `k = k̄`); [Fintzen], Lem. 7.1, arXiv p. 26).

### RG2.3.3 Bruhat–Tits and parahoric group schemes

**The Bruhat–Tits group scheme of a bounded subset.** For `K` a `ModelField` and nonempty bounded
`Ω ⊂ A`, `𝒢_Ω` is the smooth affine model with `𝒢_Ω(O^sh) = Fix(Ω) ∩ G(K^sh)^1` and
`𝒢_Ω(O) = Fix(Ω) ∩ G(K)^1`; it depends only on the enclosure of `Ω`, `𝒢_{gΩ} = g𝒢_Ωg^{-1}`, and
`Ω ⊆ Ω'` gives `𝒢_{Ω'} → 𝒢_Ω`. Over `K^sh` it has big cell `∏_{a<0}𝒰_{a,Ω} × 𝒵 × ∏_{a>0}𝒰_{a,Ω}`
(`𝒵 = 𝒵^ft` for a torus `Z`); over `K` it is the étale descent; over strictly henselian `O` its
connected points are `Fix(Ω) ∩ ker κ_G` ([Bruhat–Tits II], 4.6.26–4.6.30, pp. 135–136, discrete
case; 5.1.8–5.1.9, p. 148; [Haines–Rapoport], Proposition 3 and Remarks 4 and 11, pp. 1–3, 7).
*Checks:* `(1/2, 0)` and the vertices `0`, `(1, 0)` of a `GL_2` alcove give one model. `𝒢_x ≠ 𝒢°_x`
for `T_ϖ` and at a `PGL_2` edge midpoint. Positive-dimensional apartments are unbounded.

**Parahoric group schemes.** `𝒢°_Ω := (𝒢_Ω)°` is a smooth affine model with connected fibres,
`𝒢°_Ω(O) = P°_Ω` (the connected fixer) and big cell `∏𝒰_{a,Ω} × 𝒵° × ∏𝒰_{a,Ω}`; `𝒢°_Ω → 𝒢_Ω` is
open, a generic isomorphism, and an isomorphism iff `(𝒢_Ω)_κ` is connected, e.g. for simply
connected `G`. `𝒢°_F := 𝒢°_x` is independent of `x ∈ F` (unlike `𝒢_x`), depending only on `F`'s
image in the reduced building ([Bruhat–Tits II], 4.6.28 and 4.6.32, pp. 135–137; 5.2.6, p. 164).
*Checks:* For `PGL_2` at an edge midpoint the Iwahori has index `2` in `𝒢_x(O)`.

**Parahoric, Iwahori and pro-p Iwahori subgroups.** `P` is parahoric iff `P = P°_x := 𝒢°_x(O)` for
some `x ∈ B(G, K)`; `P°_{gx} = gP°_xg^{-1}`, `P°_x ≤ Fix(x) ≤ Stab(x)`, and `P°_F(Ĕ)^σ = 𝒢°_F(O_E)`
for `σ`-stable `F`. Iwahoris (alcove parahorics) are the minimal parahorics, all conjugate, with
pro-p radical `I^+`. For `E` local, parahorics are compact open in finitely many conjugacy classes;
maximal ones match vertices of the reduced building, standard ones `σ`-stable finite-type sets of
affine simple reflections ([Bruhat–Tits II], 5.2.6–5.2.8, pp. 164–165).
*Checks:* `GL_2(O)` is parahoric, not Iwahori; the stabilizers of a `GL_2` alcove (containing
`(0 1; ϖ 0)`, determinant `−ϖ`) and of a `PGL_2` edge are not parahoric.

**Parahorics as fixers in the Kottwitz kernel.** For `L` strictly henselian discretely valued with
perfect residue field, and `Ω` bounded in a reduced or enlarged apartment with reduced image `Ω̄`:
`P°_Ω = Fix(Ω) ∩ ker κ_G = Fix(Ω̄) ∩ ker κ_G`, `ker κ_G` is generated by parahorics, and
`𝒢_Ω(O_L)/𝒢°_Ω(O_L) ↪ (π₁(G)_I)_tors` and `G(L)_x = G(L)_{x̄} ∩ G(L)^1`,
`G(L)^1 := κ_G^{-1}((π₁(G)_I)_tors)`. Over `E`, `P°_Ω = Fix_{G(E)}(Ω) ∩ ker κ_G` (`κ_G` over `Ĕ`)
depends only on `Ω̄ ⊂ B(G^ad, E)` ([Haines–Rapoport], Def. 1, Prop. 3, Rem. 4, pp. 1–3).

**Full fixers versus connected parahorics.** For `G` over `E` and `x ∈ B(G, Ĕ)`: `𝒢_x = 𝒢°_x` iff
`κ_G(𝒢_x(O_Ĕ)) = 1`; `π_0((𝒢_x)_κ) ⊂ (π₁(G)_I)_tors`, so `𝒢_x = 𝒢°_x` if `π₁(G)_I` is torsion-free;
for types `J ⊂ K`, a connected `K`-parahoric has connected `J`-parahoric; for simply connected `G`,
fixer, connected fixer and type-preserving stabilizer agree; `𝒢_x = 𝒢°_x` if `G_der` is a product of
Weil restrictions of split groups, `X_*(G_ab)_I` is torsion-free and `x` is very special ([van
Hoften], Lem. 2.2.2 and Lem. 2.2.4, arXiv pp. 13–15; [Kisin–Zhou], Lem. 4.2.4, arXiv pp. 34–35).
*Checks:* For `PGL_2` at an edge midpoint, `Fix(x) = N(I) ⊋ I = P°_x`.

**The reductive quotient of the special fibre.** `𝒢̄_F := 𝒢°_{F,κ}/R_u` is connected reductive; for
`F ⊂ A(S)` the closure of `S` maps onto a maximal split torus, the relative roots are the gradients
of the affine roots vanishing on `F` (the non-multipliable ones over `κ̄`), the Weyl group is
`Fix(F) ⊂ W_aff`, and for perfect `κ`, `P°_F/P_F^+ ≅ 𝒢̄_F(κ)` ([Bruhat–Tits II], 4.6.12, p. 129;
5.1.31, p. 158).
*Checks:* `GL_2` Iwahori: `𝒢̄_C ≅ G_m²`; `T_ϖ`: `𝒢̄_x = 1` but `𝒢°_{x,κ} = G_a` (`char κ ≠ 2`).

**Pro-unipotent radicals, reduction and nested facets.** `P_F^+ := ker(P°_F → 𝒢̄_F(κ))` is
`G_{x,0+}`, normal, pro-p for finite `κ`; for perfect `κ`, `P°_F ↠ 𝒢̄_F(κ)`. If `F ⊂ F̄'`,
`𝒢°_{F'} → 𝒢°_F` extends the identity, `P°_{F'} ⊂ P°_F`, `P_F^+ ⊂ P_{F'}^+`, and `P°_{F'}` is the
preimage of `p(F')(κ)` for a `κ`-parabolic `p(F')` with Levi `𝒢̄_{F'}`, `F' ↦ p(F')` an
order-reversing bijection to `κ`-parabolics ([Bruhat–Tits II], 4.6.33, pp. 137–138; 5.1.32, p. 158).
*Checks:* At the `GL_n` vertex `P⁺_x = 1 + ϖM_n(O)`; for the `GL_2` Iwahori `|I/I⁺| = (q − 1)²`.

**Parahorics under unramified base change.** For `K'/K` unramified Galois (finite, `K^sh` or `Ĕ`),
`𝒢_Ω ⊗_O O' ≅ 𝒢'_Ω` and `𝒢°_Ω ⊗_O O' ≅ 𝒢'°_Ω` equivariantly, `P°_Ω(K) = P°_Ω(K')^{Gal(K'/K)}`, and
the `E`-parahorics of `σ`-stable facets of `B(G, Ĕ)` are the `σ`-fixed `Ĕ`-parahorics
([Bruhat–Tits II], 5.1.8–5.1.9 and 5.1.30–5.1.31, pp. 148, 157–158; 5.2.6–5.2.8, pp. 164–165;
[He 2018], §4.3, p. 12).

**Hyperspecial vertices.** `x` is hyperspecial if `𝒢°_x`, equivalently `𝒢_x`, is reductive (then
they agree), iff `G` splits over `K^sh` and `x` is special in `B(G, K^sh)` (very special does not
suffice), and hyperspecial subgroups are the conjugates of these `𝒢°_x(O)`. Over a local field they
exist iff `G` is unramified, reductive models are the `𝒢_x` at hyperspecial vertices, the `𝒢_x(O)`
form one `G^ad(K)`-orbit, and hyperspecial points stay so over finite extensions ([Bruhat–Tits II],
4.6.31, pp. 136–137; 5.1.40, p. 161; [Kisin–Pappas–Zhou], proof of Prop. 2.2.2, arXiv p. 12).
*Checks:* `T_ϖ`, ramified quasi-split groups and `SL_1(D)` (split over `K^sh`) have none.

**Compact subgroups lie in hyperspecial subgroups after extension.** If `g ∈ G(ℚ_p)` lies in a
compact open subgroup and finite `F/ℚ_p` splits `G` and a maximal torus through the semisimple part
of `g`, `g` lies in a hyperspecial parahoric over `F` ([Kisin–Zhou], Lem. 6.2.1, arXiv p. 57).

**Generic points of facets and connected stabilizers.** `x ∈ F` is generic iff `𝒢_{x'} = 𝒢_x` for
`x' ∈ F` near `x`. If `𝒢_x = 𝒢°_x`, then `𝒢_y = 𝒢_x` for `y` generic in the facet of `x`; for `G`
unramified over `ℚ_p`, each `x` has `x'` generic in its facet with `𝒢°_x = 𝒢_{x'}`
([Kisin–Pappas–Zhou], footnote 3 to Prop. 2.2.2, arXiv p. 12).
*Checks:* `T_ϖ` has a one-point building but `[𝒢_x(O) : 𝒢°_x(O)] = 2`.

### RG2.3.4 associated, quasi- and very special parahorics

**Associated parahorics under central surjections.** For `K` a `ModelField`, a central surjection
`f : G → G′` and finite `Ω` in an apartment, `f` extends uniquely to `𝒢°_Ω → 𝒢′°_{f(Ω)}`, so
`f(P°_x) ⊆ P′°_{f(x)}` ([Bruhat–Tits II], 4.2.15, pp. 93–94; [Kisin–Pappas], §1.1.3, arXiv v3 p. 7).
*Checks:* Squaring on `G_m`: `t ↦ t²` is no isomorphism, `f(O^×) = (O^×)²` has index `2` (`p` odd).

**Quasi-parahoric levels.** For `K` a `ModelField`, `𝒦` is quasi-parahoric if `𝒢°_x(O) ⊆ 𝒦 ⊆ 𝒢_x(O)`
(the enlarged-building fixer) for some `x` ([Kisin–Pappas–Zhou], §2.1.1, arXiv v3 pp. 10–11, on
`Ŏ`-points, `p > 2`); as `𝒢°_x(O) ⊴ 𝒢_x(O)` has finite index ([Haines–Rapoport], Rem. 11, p. 7),
these are the subgroups of `𝒢_x(O)/𝒢°_x(O)` (`QuotientGroup.comapMk'OrderIso`).
*Checks:* For `GL_n` they are the parahorics, `T_ϖ` has two, and none contains `ϖ ∈ GL_2(K)`.

**Very special points and parahorics.** For maximal split tori `S ⊂ A` over `E` and `Ĕ`,
`x ∈ A(S, E)` is very special if special with special image in the apartment of `A` ([Haines], §6.2,
p. 14; [van Hoften], §2.2.5, p. 15); they exist for quasi-split `G`, and `P°_Ω ⊆ P°_v` for `v ∈ Ω`,
so an Iwahori lies in its vertex parahorics ([Haines–Rapoport], Prop. 3, p. 1, and Rem. 4, p. 3).
*Checks:* For `GL_2`, `(v₀, v₁)` is very special iff `v₀ − v₁ ∈ ℤ`; for unramified `SU_3`, the
vertex special over `E` that is an edge midpoint over `Ĕ` is not.

**Parahorics under central extensions.** For `K` as in [Kisin–Pappas], §1.1.1, arXiv v3 p. 6, and a
central extension `α : G → G̃` with kernel `Z`, `α` extends uniquely to `𝒢_x → 𝒢̃_{αx}` and
`𝒢°_x → 𝒢̃°_{αx}`; if `G` is tamely split and `Z` is a torus or finite of order prime to `p`, the
closures of `Z` in `𝒢°_x` and in `𝒢_x` (the kernel there) are smooth, `𝒢°_x → 𝒢̃°_{αx}` is
fppf-surjective with kernel the first, which is the connected Néron model of `Z` when `Z` is a direct
summand of an induced torus ([Kisin–Pappas], §1.1.3, Prop. 1.1.4, arXiv v3 pp. 7–8). Over
a local field, with no tameness or `p` condition, a split-torus kernel makes `𝒢°_x → 𝒢̃°_{αx}`
faithfully flat, finitely presented ([Kisin–Zhou], Prop. 2.4.13, arXiv v2 p. 17).
*Checks:* `𝒢_x → 𝒢̃_{αx}` need not be fppf surjective.

### RG2.3.5 integral models of stabilizers for classical and Hodge-type groups

**Parahorics of GL and GSp as lattice-chain automorphism groups.** For `x ∈ B(GL(V), K)` with
lattice chain `Λ_•`, `𝒢ℒ_x` is the closure of `GL(V)` in `∏_{i<r} GL(Λ_i)`, equal to `Aut(Λ_•)`,
smooth, and closed in `GL(⊕_i Λ_i)` ([Bruhat–Tits 1984], 3.6 Théorème, p. 288; [Kisin–Pappas–Zhou],
Lem. 2.3.1, arXiv v3 pp. 13–14); for an almost self-dual chain, `𝒢𝒮𝒫_x` is the closure of `GSp(V)`
in `∏_i GL(Λ^i)`, the similitudes of `Λ^•` ([Kisin–Pappas], §1.1.11, pp. 9–10).

**Closed immersion of fixer schemes for minuscule embeddings.** For `K` `p`-adic of characteristic
`0`, `G` split over a tame Galois `K̃/K` (group `Γ`), `ρ : G ↪ GL(V)` faithful minuscule and `ι` the
toral embedding of [Kisin–Pappas], §1.2.12, p. 13, `ρ` extends to closed immersions
`𝒢_x → 𝒢ℒ_{ι(x)}`, via `𝒢_{Ω,K} ≅ (Res_{Õ/O} 𝒢_{Ω,K̃})^Γ` and smooth closures ([Kisin–Pappas], Prop.
1.3.3, arXiv v3 pp. 16–20); for `K = k((π))` the same holds when `ρ` decomposes into restrictions
of scalars of twisted Weyl modules (§1.2.27, p. 16, and §1.3.13), separability alone not sufficing;
a point-group map without `ι`'s lattice data does not suffice (Rem. 1.3.7).

**Tame realization of stabilizers as fixed points of hyperspecial models.** Let `p > 2`, `K` finite
over `ℚ_p` or `Q̆_p`, `G` tame classical (no exceptional or triality factors in `G^ad`, factors
`Res_{L/K} PGL_m(D)` with `p ∤ ind D`), and `x` generic in its facet. Some `x′` with `𝒢_{x′} = 𝒢_x`
is hyperspecial over a tame Galois `K̃/K` (group `Γ`) splitting `G`, `𝒢_x ≅ (Res_{Õ/O} 𝒢̃_{x′})^Γ`,
and for `ρ : G ↪ GL(V)` a `Γ`-stable `Λ̃` gives closed immersions `𝒢̃_{x′} ↪ GL(Λ̃)` and
`𝒢_x ↪ (Res_{Õ/O} GL(Λ̃))^Γ = GL(L)`, `L = {(π̃^iΛ̃)^Γ}`; and `F^t = F·ℚ_p^t` ([Kisin–Pappas–Zhou],
Prop. 2.2.2, arXiv v3 pp. 12–13; Lem. 2.3.3, pp. 14–15; Prop. 2.4.2, p. 16; Lem. 6.1.2, p. 65).

**Models of similitude, derived and adjoint groups.** `GO(V,h)` (`dim V = 2n`) has two components;
`c(g)^n = det g` on `GO^+`. For `p > 2`, smooth `𝒢 ⊂ GSp(Λ)`, `Λ = Λ^∨`, containing `G_m` has smooth
similitude; for `G` tame of Hodge type with `p ∤ |π₁(G^der)|`, the closure of `G^der` in the
stabilizer `𝒢` of `x` is that of `x^ad` for `G^der`, and if `Z_G` is connected or `p ∤ |Z_{G^der}|`,
the `G^ad`-parahoric is `(𝒢/𝒵)°` ([Kisin–Pappas–Zhou], §6.2.1, arXiv v3 p. 69; Lem. 7.2.14, p. 85).

**Hyperspecial lattices for orthogonal and quaternionic groups.** Let `p > 2`. A hyperspecial
Galois-fixed point for `GO^+(V,h)` split over a tame `K̃/K` stabilizes a stable `Λ̃` with
`Λ̃^∨ = π̃^aΛ̃`, and over `K̃(√π̃)` the model is `GO^+(Λ̃,h)` with `Λ̃^∨ = Λ̃`, since `Λ^∨ = cΛ`,
`s² = c ≠ 0` give `(sΛ)^∨ = sΛ` ([Kisin–Pappas–Zhou], proof of Thm 6.2.3, arXiv v3 p. 71);
quaternionic hermitian forms are `Σ d̄_i d′_i` in a suitable basis, so `σ_{T_0}`, `σ_{V_0}` are sums
of basic symplectic representations (§6.2.2, pp. 69–70).

### RG2.3.6 Moy–Prasad filtrations

**The Moy–Prasad filtration.** For `K` a `ModelField`, `ω(ϖ) = 1` (`ω` not renormalized on
extensions), `y ∈ B^e(G,K)`, `r ≥ 0`: over `K^ur`, with `T = Z_G(A)` for a maximal `K^ur`-split
`A ⊇ S` over `K`, `G(K^ur)_{x,r} = ⟨T(K^ur)_r, U_ψ : ψ(x) ≥ r⟩` with
`T(K^ur)_r = {t ∈ T(K^ur)_0 : ω(χ(t) − 1) ≥ r ∀ χ}`; `G_{x,r}` is its Galois-fixed part,
`G_{y,r+} = ∪_{s>r} G_{y,s}`, `Z(K)_r` likewise. Then `G_{x,0} = 𝒢°_x(O)`,
`G_{gx,r} = gG_{x,r}g^{−1}`, it decreases, `G_{y,r+} ⊴ G_{y,r} ⊴ G_{y,0}`,
`[G_{y,r}, G_{y,s}] ⊆ G_{y,r+s}`, and `G_{x,r} = ⟨Z(K)_r, U_{a,x,r}⟩` for `r > 0`, with no tameness
([Adler], §1.4, pp. 8–9, Prop. 1.4.2, p. 10; [Moy–Prasad 1996], §3.2, p. 103, indices there times a
splitting field's ramification index).
*Checks:* For `G_m`, `G_{y,r} = 1 + m^{⌈r⌉}`: `G_{y,1/2} = G_{y,1} ≠ G_{y,1+}`; for `GL_2`,
`1 + ϖE₁₂ ∈ G_{x,1} ∖ Z(K)_1`; for `Z = SL_1(D)` characters would give `Z(K)_r = Z(K)`.

**Moy–Prasad lattices in the Lie algebra and its dual.** For `g = Lie(G)(K)` (counit derivations;
`Derivation.adRepresentation`) and `r ∈ ℝ`, `g_{x,r}` is built as `G_{x,r}` from
`{H : ω(dχ(H)) ≥ r ∀ χ}` and root lattices; `g*_{y,r} = {X : X(g_{y,(−r)+}) ⊆ m}`,
`d(y,X) = sup{r : X ∈ g*_{y,r}}`. They decrease, `ϖg_{y,r} = g_{y,r+1}`,
`[g_{y,r}, g_{y,s}] ⊆ g_{y,r+s}`, `Ad(G_{y,0})` preserves them, `g_{y,r} = g ∩ (g_{K′})_{y,e·r}` for
finite `K′/K` of ramification index `e` (`K′`-normalized depths), with discrete jumps ([Adler],
§1.4, Prop. 1.4.1 and 1.4.2, pp. 8–10; [Moy–Prasad 1994], §3.2, §3.4 and §3.5, pp. 399–400).
*Checks:* At the `GL_2` barycentre `g_{x,1/2}` is no `ϖ^kM_2(O)`; for `G_m`, `g_{y,0+} = m ≠ O`, and
`d(x₀₀) ∈ g*_{y,0} ∖ g*_{y,1}`, which fails with `g_{y,r+}` for `g_{y,(−r)+}`.

**Yu's mixed-depth groups and lattices.** For a tame twisted Levi sequence `G⁰ ⊆ ⋯ ⊆ Gᵈ = G` over
`E`, `y ∈ Bᵉ(G⁰,E)` and `0 ≤ r₀ ≤ ⋯ ≤ r_d`, `G⁰_{y,r₀} ⋯ Gᵈ_{y,r_d}` is a group between `G_{y,r_d}`
and `G_{y,r₀}`; lattice `Σ gⁱ_{y,r_i}`; constant depth gives `G_{y,r}`, zero depth the product of
stage parahorics, and `G⁰_{y,s}G¹_{y,t} ∩ G⁰(E) = G⁰_{y,s}` for `0 < s ≤ t` ([Kim–Yu], §6.1, p. 9).
Under [Fintzen], Assumption 2.1, p. 7, Yu's `(G′,G)_{y,s,t}`, `s ≥ t ≥ s/2 > 0`, and its lattice are
choice-free and meet `G′(E)` in `G′_{y,s}` ([Fintzen], §4, pp. 16–17).
*Checks:* For diagonal `T ⊂ GL₂`, depths `(1,2)`: `v(g − 1) ≥ 1` on, `≥ 2` off the diagonal.

**The Moy–Prasad isomorphism.** For `r > 0`, `G_{y,r}/G_{y,r+} ≅ g_{y,r}/g_{y,r+}`, which is
abelian; for perfect `κ`, `G_{x,0}/G_{x,0+} ≅ 𝒢̄_x(κ)` ([Moy–Prasad 1996], §3.1–3.3, pp. 102–104).
**Positive-depth subgroups are pro-p and cofinal.** For `E` local of residue characteristic `p` and
`r > 0`, `G_{y,r}` is compact open, normal in `G_{y,0}` and pro-`p`; the `G_{y,r}` form a
neighbourhood basis of `1`; for an alcove barycentre `x_C ∈ C` the `G_{x_C,n}`, `n ≥ 1`, are normal
in the Iwahori, decreasing and cofinal ([Moy–Prasad 1996], §3.2, p. 103; [He 2018], §4.2, p. 12).

**Mock exponential.** With tame splitting data (and `p ∤ |W(G)|` for general tame `G`), Adler's map,
built from `χ_i(e(H)) = 1 + dχ_i(H)` on a split torus, root parametrizations, an ordered product on
`g_{y,0+}` and tame descent, gives `g_{y,r}/g_{y,s} ≃ G_{y,r}/G_{y,s}` for `0 < r ≤ s ≤ 2r`,
independent of choices; it preserves depth, is additive modulo depth `r+s`, matches commutators with
brackets modulo depth `r+s+min(r,s)`, satisfies
`Ad(e(Y))Z − Z − [Y,Z] ∈ g_{y,2r+t}` for `Y ∈ g_{y,r}`, `Z ∈ g_{y,t}`, and is parahoric-equivariant
([Adler], §1.5, Lemma 1.5.1, pp. 11–13; Propositions 1.6.2, 1.6.3 and 1.6.5, pp. 13–16).
*Checks:* For `GL_2` the `(0,0)` entry of `e(X)e(Y) − e(X+Y)` is `X₀₀Y₀₀ + X₀₁Y₁₀`.

**Generation of Moy–Prasad subgroups by a torus and the derived group.** Under [Fintzen], Assumption
2.1, p. 7, for `H′ ∈ {G′^der, G′}`, `T ⊂ G′` maximal and tamely split with `x ∈ A(T,E)`, and
`r > 0`, `G′_{x,r} = ⟨T(K)_r, H′(K) ∩ G′_{x,r}⟩` ([Fintzen], Lem. 7.1 and Cor. 7.2, arXiv v2 p. 26);
over a local field with `Z_G(S)` a split torus this holds at `y ∈ A(S)`.

**Lifting cocharacters of the reductive quotient.** A `κ`-cocharacter `λ̄` of `𝒢̄_x` lifts uniquely
to `λ : G_m → S` for a `K`-split torus `S`, `x ∈ A(S)`; as `α(x+ελ) − α(x) = ε⟨grad α, λ⟩`, if
`X ∈ g*_{x,r}` and `λ̄(t)X̄ → 0` in `g*_{x,r}/g*_{x,r+}` as `t → 0`, then `X ∈ g*_{x+ελ,r+}` for
small `ε` ([Fintzen], proof of Cor. 3.8, arXiv v2 p. 11).

### RG2.3.7 Lang's theorem and lifting

**Lang's theorem.** For `F` finite, `σ(z) = z^{|F|}` and `H` a smooth geometrically connected affine
`F`-group of finite type, `g ↦ g^{−1}σ(g)` is surjective on `H(F̄)` ([Milne AG], Prop. 27.54, v2.00
p. 487, and Cor. 27.55, p. 488); hence `H^1(F, H) = 1` (Cor. 27.56, p. 488) and `H(F) ↠ H″(F)` for
`1 → H′ → H → H″ → 1` smooth exact with `H′` connected.
*Checks:* On `μ₂`, `|F|` odd, the Lang map is `z ↦ z^{−1}z^{|F|} = 1`; for the constant group `ℤ/2`
it is trivial and `H^1(F, ℤ/2) = ℤ/2` ([Milne AG], remark after Cor. 27.56, p. 488).
*Lean:* `Lang.lang_surjective`.

**Lang's theorem for pro-algebraic groups.** For a nonempty directed inverse system of such groups
`H_i` with compatible transition maps over `F`, every compatible family `a_i ∈ H_i(F̄)` is
`g_i⁻¹σ(g_i)` for compatible `(g_i)` (stagewise solutions do not suffice): the Lang fibres are
finite and nonempty ([Milne AG], Corollary 27.55, p. 488), and compactness concludes.
*Checks:* For the constant system `μ₂` over `𝔽₃` the Lang map misses every nonidentity tuple.
*Lean:* `Lang.lang_proAlgebraic_surjective`.

**Fixed cosets.** For `σ ∈ Aut(H)` and `J ≤ H` with every element of `J` of the form `z⁻¹σ(z)`,
`z ∈ J`, `hJ` meets `H^σ` if
`h⁻¹σ(h) ∈ J`, and `H^σ/J^σ ≅ (H/J)^σ` if `σ(J) = J` ([He 2018], proof of Lem. 4.5, arXiv v3 p. 13).

**Connected finite-level presentation of an intersection.** For a `σ`-stable alcove, `n ≥ 1` and
`g ∈ G(E)`, construct from root filtrations and completeness of `O_Ĕ` smooth geometrically connected
affine `𝔽_q`-groups `J_i` in a directed system with `Ĭ_n ∩ gĬ_ng⁻¹ ≅ lim_i J_i(𝔽̄_q)`, `σ` going to
Frobenius; neither pro-`p`-ness nor [Haines–Rapoport], Remark 9, p. 5, gives this.
**Frobenius-fixed coset lifting at positive level.** Given it and `I_n = Ĭ_n^σ`,
`I_n/(I_n ∩ gI_ng⁻¹) ≅ (Ĭ_n/(Ĭ_n ∩ gĬ_ng⁻¹))^σ` by pro-algebraic Lang and *Fixed cosets*; RG2.4's
positive-level counts keep this hypothesis ([He 2018], Lemma 4.5 and proof, arXiv v3 p. 13).

**Reduction of smooth models.** Over a complete DVR, for any `κ`, a smooth affine model has
`𝒢(O) ↠ 𝒢(κ)`, by Mathlib's `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`.

### Examples

**Iwahori and congruence levels of classical groups.** For `K` with a valuative relation,
`ḡ = g mod 𝔪`: `GL_n(O)` (`g^{±1}` integral), the Iwahori `I = {g ∈ GL_n(O) : ḡ upper triangular}`,
the pro-`p` Iwahori `I^+ = {g ∈ I : ḡ unipotent}` and `GL_n(O) ∩ (1 + 𝔪^m M_n(O))`. Over a local
field these are the parahorics at the standard vertex and at the barycentre `v_i = −i/n`, its
radical, and `G_{x_0,m}` (`m ≥ 1`) ([Bruhat–Tits 1984], 3.6 Théorème, p. 288; [Casselman], §1.4,
proof of Prop. 1.4.4, p. 14); pro-`p` Iwahori elements of `GSp_4 ⊂ GL_4` have characteristic
polynomial `≡ (X − 1)^4 mod ϖ` ([Kisin–Pappas], §1.1.11, arXiv v3 pp. 9–10).
*Checks:* `GL_n(O)` is the image of `Matrix.GeneralLinearGroup.map`; `diag(ϖ, 1) ∉ GL_2(O)`;
`(1 0; 1 1) ∉ I`; for local `K`, `[GL_2(O) : I] = q + 1` and `I^+ = I` if `κ = 𝔽_2`.
*Lean:* `LevelSubgroups.integralGL`, `LevelSubgroups.iwahori`, `LevelSubgroups.proPIwahori`,
`LevelSubgroups.principalCongruence`.

**Parahorics of nonsplit tori.** For `E′/E` separable quadratic and `T = R^1_{E′/E}G_m`: if `E′/E`
is unramified, `T(E)_0 = T(E)`; if ramified, `X_*(T)_I = ℤ/2` and
`T(E)_0 = ker κ_T = {x/σ(x) : x ∈ O_{E′}^×}` has index `2`, as `κ_T(x/σ(x)) = v_{E′}(x) mod 2`, so
`a/σ(a)` (`a` a uniformizer of `E′`; `= −1` if `a² ∈ E`) lies in the other coset, and for odd `p`,
`T(E)_0 = {u ≡ 1}`; over a strictly henselian base `𝒯^ft(O)/𝒯°(O)` is the torsion of `X_*(T)_I`
([Haines–Rapoport], proof of Prop. 3 a), p. 2, and Rem. 10–11, pp. 6–7).
*Checks:* `N(−1 − 1) = 4` puts `−1 ∉ 𝒯°(O)` for odd `p`; for `p = 2`, `4 ∈ m` and the test fails.

### Dependencies

- RG2.0, RG2.0a, RG2.1, RG2.2; ReductiveGroups layers 0, 2, 3, 5–7; LocalFieldsRamification layer 3.
- Mathlib `QuotientGroup.comapMk'OrderIso`; Tau Ceti `TauCeti.unitFiltration`,
  `Derivation.adRepresentation`.

## Layer RG2.4: decompositions and double cosets

The Iwahori–Weyl group and its affine Tits system; Iwahori–Bruhat, parahoric, Cartan and Iwasawa
decompositions; the Kottwitz quotient; Iwahori double cosets, translations, admissible sets and Haar
measure. `K` is a `ModelField`; Kottwitz statements follow [Richarz] (`K` complete, `cd(κ) ≤ 1`).

### RG2.4.1 the Iwahori–Weyl group

**The Iwahori–Weyl group.** For `S` maximal `K`-split, `Z = Z_G(S)`, `N = N_G(S)`, the unique
parahoric `Z(K)_0` of `Z(K)` (`O`-points of the connected Néron model if `Z` is a torus) is normal
in `N(K)` and equals `P_Ω ∩ Z(K)` for every parahoric `P_Ω`, `Ω ⊂ A` nonempty bounded.
`W̃ = N(K)/Z(K)_0` acts on `A` via `ν`, maps onto `W_0 = N(K)/Z(K)`, and is `W_a ⋊ Ω`, where `W_a`,
the image of `N(K) ∩ G(K)_1` (`G(K)_1 = ⟨parahorics⟩`), acts faithfully and `Ω` stabilizes a base
alcove `C` (an alcove with a point: alcoves have no vertices if `V_Z ≠ 0`). `I = 𝒢°_C(O)` is
independent of the point, closed alcoves contain special points, `Z(L)_0 = ker κ_Z` and
`W̃_E ≅ (W̃_L)^σ` ([Haines–Rapoport], Lem. 5, p. 3, Def. 7 and (3), p. 4, Rem. 9, p. 5, and Lem. 14,
p. 9, and p. 10; [Richarz], Def. 1.1, (1.1) and (1.2), p. 118, and Lem. 1.6, p. 120;
[Bruhat–Tits II], 5.2.4 and 5.2.6, p. 164, and Prop. 5.2.12, p. 166; [Bruhat–Tits I], (1.3.7), p.
22; [He 2018], §1.1, p. 5).
*Checks:* For `GL_2`, `G(K)_1 = {ω(det g) = 0}` and `W̃ → W_0` is not injective. Non-example: the
ramified norm-one torus (`char K ≠ 2`) has `#W̃ = [ker ν : Z(K)_0] = 2` but `N(K)/ker ν = 1`.

**Structure of the Iwahori–Weyl group.** (1) `1 → Z(K)/Z(K)_0 → W̃ → W_0 → 1` is exact, the abelian
kernel being `X_*(T)_I` over `L` (via `κ_T`) and `Λ_Z := Z(E)/Z(E)_0 ≅ π₁(Z)_I^σ` over `E`, torsion
included ([Haines–Rostami], Proposition 1.0.2, p. 3), which is `(X_*(Z)_I)^σ` only for `Z` a torus.
(2) `Ω ≅ W̃/W_a`, which is `π₁(G)_I` over `L` and `(π₁(G)_I)^σ` over `E`. (3) A special `x` splits
(1) by `W_0 ≅ W_a ∩ Stab_W̃(x)` (`σ`-equivariantly if `σx = x`), so `W̃_E ≅ Λ_Z ⋊ W_0(E)`. (4)
`ker(W̃ → Aff(A)) = Z(K)_b/Z(K)_0` is finite, `(X_*(T)_I)_tors` over `L` ([Haines–Rapoport], (3), p.
4, Rem. 10, p. 6, Prop. 13, p. 8, and Lem. 14, p. 9; [Richarz], Lem. 1.3, (1.5) and (1.6), p. 119,
and Lem. 1.6, p. 120; [Kisin–Zhou], §2.1.2, (2.1.2.1), p. 6).
*Checks:* Quaternionic `PGL₁(D)` has `S = 1` and `Λ_Z ≅ ℤ/2`, its unramified torus has
`X_*(T)^σ = 0`.

**Length and Bruhat order on the Iwahori–Weyl group.** For `(W_a, S̃)` the Coxeter system of `C`,
`ℓ(wτ) = ℓ_{W_a}(w)` (`τ ∈ Ω`) counts the walls between `C` and `wτ(C)`, `S̃ = W_a ∩ ℓ⁻¹(1)`, and
`wτ ≤ w'τ'` iff `τ = τ'` and `w ≤ w'` (Tau Ceti's `CoxeterSystem.BruhatLE`), a partial order;
`ℓ⁻¹(0) = Ω`, `Ω` permutes `S̃`, and `ℓ` is `Ω`-conjugation and inversion invariant and strictly
monotone; over `E`, `ℓ̆ = ℓ_{W̃_L}|_{(W̃_L)^σ} ≠ ℓ` in general ([Geck–Iancu], Theorem 1, p. 1, and
Corollary 6, p. 3; [He 2018], §1.1, p. 5; [He 2021], §2.1, pp. 4–5; [Richarz], §1.3, p. 121, Prop.
1.11, p. 122, Sublemma 1.12, p. 123, and Lem. 1.6, p. 120).
*Checks:* For `GL_2`, `t` the translation by `(1, −1)` and `s` the reflection fixing `0`: `ℓ(t) = 2`,
`ℓ(st) = 3`, `ℓ(ts) = 1`. Non-examples: in `PGL_2`, `1 ≰ τ ∈ Ω ∖ {1}`; the order is not total.

### RG2.4.2 Iwahori–Bruhat decomposition, the affine Tits system and double cosets

**The affine Tits system of the parahoric subgroup.** (1) `(G(K)_1, I, N(K)_1, S̃)`,
`N(K)_1 = N(K) ∩ G(K)_1`, is a Tits system with Weyl group `W_a`; (2) `G(L)_1 = ker κ_G`,
`G(L)/G(L)_1 ≅ Ω`, and `G(K) = ⟨G(K)_1, Ω̇⟩` for lifts `Ω̇` of `Ω` normalizing `I`; (3)
`G(K) = ⋃_{w ∈ W̃} IẇI` ([Bruhat–Tits I], §6.5, Théorème, p. 154; [Bruhat–Tits II], 5.2.11 and Prop.
5.2.12, p. 166; [He 2018], §1.1, p. 5; [Richarz], §1.1, (1.2), Lem. 1.2, p. 118, and Lem. 1.3, p.
119; [Haines–Rapoport], Lem. 17, p. 9). **The Iwahori–Bruhat decomposition.** For `C` an alcove
(`σ`-stable over `E`), `w ↦ IẇI` is a bijection `W̃ → I\G(K)/I`, the cells compact open over `E`
([Haines–Rapoport], Prop. 8, p. 4; [Richarz], Thm 1.4, p. 119, and (1.7), p. 120; [He 2018], §0.6,
p. 3, and §2.5, p. 9).

**The Kottwitz quotient G(K) → Ω.** (1) `G(K)_1 ⊴ G(K)` and `N(K)/N(K)_1 ≅ G(K)/G(K)_1`, giving
`κ : G(K) ↠ Ω` with kernel `G(K)_1` (for `GL_2`, `κ(g)` is read off from `|det g|`); (2)
`κ(IẇI) = pr_Ω(w)`; (3) `κ = κ_G` over `L`, valued in `(π₁(G)_I)^σ` over `E`; (4) if `θ ∈ Aut G(K)`
preserves `I`, `N(K)`, `κ(hgθ(h)⁻¹) = κ(g) + κ(h) − θκ(h)`, so only the class in `Ω/(1 − θ)Ω` is
invariant ([He 2018], §1.1, p. 5, §1.3, p. 6, and §2.1, p. 7; [Richarz], Lem. 1.2, p. 118, Lem. 1.3,
(1.5) and (1.6), p. 119; [Haines–Rapoport], Lem. 14, p. 9).

**Surjectivity of the Kottwitz map on rational points.** (1) `κ_G : G(E) ↠ (π₁(G)_I)^σ`; (2) for a
parahoric `𝒢` over `O_E` and `ρ : G_sc → G_der`, `ker κ_G ∩ G(E) = ρ(G_sc(E))𝒢(O_E)`; (3) for `G`
reductive over `ℤ_p`, `T = Z_G(S)` (`S` maximal split), `Γ = Gal(ℚ̄_p/ℚ_p)`, `X_*(T)^Γ ↠ π₁(G)^Γ`
and `G(ℚ_p)/ρ(G_sc(ℚ_p))G(ℤ_p) ≅ π₁(G)^Γ`; (4) if `κ̃_{G_ad}(g_ad)` lifts to `π₁(G)^Γ`,
`g_ad G_ad(ℤ_p)` comes from `G(ℚ_p)` ([van Hoften], Lem. 3.4.2, p. 40, and its proof, p. 41, for `G`
split over a tamely ramified extension, (2) in general from [Richarz], Lem. 1.3, p. 119, and Rem.
1.5, p. 120, with [Haines–Rapoport], Lem. 17, p. 9; [Kisin], Lem. (1.2.3) and Lem. (1.2.4), p. 13).

**Double cosets of parahoric subgroups.** For facets `F, F' ⊂ C̄` with parahorics `P, Q` and finite
standard parabolics `W_F = (P ∩ N(K))/Z(K)_0`, `W_{F'}` (`W_C = 1`), `w ↦ PẇQ` gives
`W_F\W̃/W_{F'} ≅ P\G(K)/Q`, so `G(K) = ⊔ PẇQ` over minimal representatives `w ∈ ^F W̃^{F'}` (for
`GL_2`, `F = {0}`, `F' = C`, the permutation matrix gives the coset of `1`) ([Haines–Rapoport], Lem.
6, p. 3, and Prop. 8, p. 4; [Richarz], Thm 1.4, p. 119, and (1.7), p. 120; [He 2018], §1.1, p. 5).

**Multiplication of Iwahori double cosets.** (1) For `s ∈ S̃`, `IṡI·IẇI = IṡẇI` if `ℓ(sw) > ℓ(w)`,
else `IṡẇI ⊔ IẇI` (likewise on the right), so `IẇI·Iẇ'I = Iẇẇ'I` if lengths add; (2) over `E`,
`I_n g I_n ⊆ g I_{n−1}` for `g ∈ IṡI`, `I_n` Moy–Prasad; (3) a compact set meets finitely many
cells, and `IẇI·Iẇ'I` is a finite union of `Iu̇I`, `ℓ(u) ≤ ℓ(w) + ℓ(w')` ([He 2018], §2.4, p. 8, the
proof of Prop. 2.3, p. 8, Prop. 4.3, p. 12, and the proof of Lem. 4.7, p. 14; [Richarz], (1.14) in
the proof of Prop. 1.11, p. 123; [Bruhat–Tits I], §6.5, Théorème, p. 154).

**The Iwahori factorization.** For a `K`-parabolic `P = MN` (`M ⊇ Z`) and `H` an Iwahori, `P_F^+` or
`G_{x,r}` (`r > 0`): (1) `(H ∩ N^-) × (H ∩ M) × (H ∩ N) → H` is bijective in every order, with
`H ∩ U_a(K) = U_{a,f_H(a)}`; (2) over `L`, `Ĭ_nṡĬ_n/Ĭ_n ≅ 𝔸^{ℓ̆(s)}` over `κ̄`, with `q^{ℓ̆(s)}`
`σ`-fixed points; (3) `z ∈ Δ_M = {⟨a, v(z)⟩ ≤ 0, a ∈ Φ_N}` contracts `H ∩ N`, so
`HzH = (H ∩ N^-)z(H ∩ M)(H ∩ N)` and `[H : H ∩ zHz⁻¹] = δ_P(z)⁻¹` ([He 2018], proof of Lem. 4.6, pp.
13–14; [Casselman], §1.4, pp. 13–15, and Lem. 1.5.1, p. 16; [Bruhat–Tits I], Prop. (6.4.9), p. 136,
and Prop. (6.4.48), p. 152).
*Checks:* `SL_2`, `z = diag(ϖ, ϖ⁻¹) ∈ Δ_B`: `[I : I ∩ zIz⁻¹] = q² = δ_B(z)⁻¹`; `z⁻¹` expands
`I ∩ U`.

**Cardinalities of Iwahori double cosets.** For `I` the Iwahori of a `σ`-stable alcove: (1)
`#(IẇI/I) = q^{ℓ̆(w)}`, where `ℓ̆(s) = 1` iff the `σ`-orbit of `s` in `S̃_L` is trivial (so `ℓ̆ = ℓ`
for `G` residually split); (2) assuming RG2.3's *Connected finite-level presentation of an
intersection* for the intersections used, `#(I_n g I_n/I_n) = q^{ℓ̆(w)}` for `g ∈ IẇI`, `n ≥ 1`, and
(3) `IẇI` is a union of `[I : I_n]` `I_n`-double cosets ([He 2018], Lem. 4.5, p. 13, Lem. 4.6, pp.
13–14, and the proof of Thm 5.3, p. 16; [Richarz], Proposition 1.11, p. 122, and Remark 1.13, p.
124).

**Finiteness of compact double cosets.** For a topological group `G`, open subgroups `C, C'` with
`C` compact and `g ∈ G`, `CgC'` is the disjoint union of exactly `[C : C ∩ gC'g⁻¹]` left cosets
`hC'`. General target: `μ(CgC') = [C : C ∩ gC'g⁻¹]μ(C')` for left Haar `μ`; for `C'` compact, `CgC'`
is also a union of `[C' : C' ∩ g⁻¹Cg]` right cosets (with the right-Haar analogue) and `C\G/C'` is
finite iff `G` is compact, so noncompact `G(E)` has infinitely many Cartan double cosets
([Casselman], §1.5, proof of Prop. 1.5.2, p. 16, for `C' = C`; supplier Tau Ceti's
`DoubleCoset.doubleCoset_eq_iUnion_leftCosets`).
*Lean:* `Decomposition.doubleCoset_finite_of_isCompact`.

### RG2.4.3 cocharacters, lengths and admissible sets

**Dominant inertia-coinvariant cocharacters.** For `T = Z_G(S)`, `S` maximal `L`-split over `E`,
`V = X_*(T)_I ⊗ ℝ` carries the échelonnage system `Σ`; a `σ`-stable `C` and a special `x₀ ∈ C̄` fix
the chamber `C^+ ⊇ C` at `x₀`. (1) `t^λ` (`λ ∈ X_*(T)_I`, or `Λ_Z` over `E`) is the preimage of `−λ`
under `T(L)/T(L)_0 ≅ X_*(T)_I` (`λ(ϖ)⁻¹` for split `λ`); it acts by `λ̄`, blind to torsion. (2) `λ`
is dominant if `λ̄ ∈ C^+` ([He 2021]: opposite chamber); `W_0λ` contains a unique dominant `λ_dom`.
(3) If Frobenius preserves `C^+` with order `m` on `V`, `μ^♦ = m⁻¹Σ_{i<m}σ^i(μ)`, and the Newton
displacement of `t^λ`, via `(t^λσ)^m`, is `dom(m⁻¹Σσ^i(λ̄))` (`λ^♦` for dominant `λ`; the
valuation-normalized Newton point is its `−w₀`). (4) `λ ≤ λ'` iff `λ' − λ ∈ ℕΣ^{∨,+}`, giving
`t^λ ≤ t^{λ'}` for `λ, λ'` dominant. (5) `μ̄`, the Hodge coweight of `{μ}`, is the image of its
`B`-dominant member ([Haines–Rapoport], Lem. 15 and the preceding discussion, pp. 7–9; [Kisin–Zhou],
§2.1.3–2.1.5, p. 7; [He 2021], §2.1, p. 5, and §2.2, p. 6; [Gleason–Lim–Xu], §2, (2.5)–(2.7), pp.
14–15).
*Checks:* Unramified `Res GL_2`, `λ = ((1,0),(0,1))`: displacement `((½,½),(½,½))`, not
`((1,0),(1,0))`. Non-examples: `GL_2`: `(−1, 1) ≤ (0, 0)`, lengths `2, 0`; `GL_3`: `0 ≤ (1, −1, 0)`,
yet `x₂ − x₃` is `−1` on it; `PGL_2`: `1 ∉ 2ℕ`.

**Length of translations.** With `W̃ = Λ ⋊ W_0`: (1) `ℓ(t^λ) = ⟨λ_dom, 2ρ_Σ⟩ = Σ_{a ∈ Σ^+}|⟨λ, a⟩|`,
zero iff `λ̄` is central; (2) `ℓ(xt^λ) = ℓ(x) + ℓ(t^λ)` for dominant `λ`, `x ∈ W_0`, and for `G`
quasi-split simple `xt^λ` is cordial with `η_σ(xt^λ) = x` and `ℓ(xt^λ) − ℓ(x) = ⟨λ^♦, 2ρ⟩`
([He 2021], Theorem 4.2, transported); (3) over `E`, `ℓ̆(t^λ) = ⟨λ_dom, 2ρ_{Σ_L}⟩` ([Kisin–Zhou],
§2.1.5, (2.1.5.1), p. 7; [He 2021], §4.3, p. 8; [Richarz], Proposition 1.11, p. 122).

**Dominant double-coset normal form.** Each `w ∈ W̃` is uniquely `xt^λy`, `λ` dominant, `x, y ∈ W_0`,
`t^λy` minimal in `W_0t^λy`, and `ℓ(w) = ℓ(x) + ℓ(t^λ) − ℓ(y)` ([He–Nie–Yu], §2E, p. 1687, with §2A,
pp. 1684–1685, quasi-split; [He 2021], §2.2, p. 5, and §4.3, p. 8; [He 2018], §1.1, p. 5).

**The μ-admissible set.** For `{μ}` with dominant Hodge coweight `μ̄`, `t^{μ̄} ∈ W_aτ_μ`, put
`Adm(μ) = {w : w ≤ t^{x(μ̄)}, x ∈ W_0}` and `Adm^F(μ) = W_F Adm(μ) W_F`. `Adm(μ)` is a finite lower
set in `W_aτ_μ` whose maximal elements `t^{x(μ̄)}` are its only elements of length `⟨μ̄, 2ρ_Σ⟩`; a
Bruhat automorphism preserving `{yt^μy⁻¹}` preserves it, e.g. Frobenius if `W_0μ̄` is `σ`-stable and
`x₀` fixed. For `G` split over `L`,
`Adm(μ) ⊆ Perm(μ) = {w ≡ τ_μ mod W_a : w(v) − v ∈ conv(W_0μ̄) ∀ v ∈ C̄}`, equality holding for
`GL_n` and for `GSp_{2n}` with `μ` a sum of minuscules ([Rapoport], Lemma 3.1, p. 9, (3.4) and
(3.9), p. 10, Proposition 3.2, p. 11, Theorem 3.4, p. 12; [Gleason–Lim–Xu], §2, (2.3)–(2.4), p. 14,
and §3.2, p. 19; [van Hoften], §2.2.15, p. 19).
*Checks:* For `GL_2`, `μ = (1, 0)`: `Adm(μ) = {t^{(1,0)}, t^{(0,1)}, τ}`, whereas the lower set of
`t^{μ̄}` misses `t^{(0,1)}`; additive maps `ℤ/2 → ℝ` vanish, so the congruence is needed.

### RG2.4.4 Cartan and Iwasawa decompositions

**The Cartan decomposition.** For special `x`, `K_x = 𝒢°_x(O)`, `K̂_x = 𝒢_x(O)`: (1)
`G(K) = K_xZ(K)K_x`; (2) `W_x ≅ W_0`, `K_x\G(K)/K_x ≅ W_0\W̃/W_0 = (Z(K)/Z(K)_0)/W_0`; (3) for split
`G` and hyperspecial `𝒢(O)`, `G(E) = ⊔_{λ ∈ X_*(T)^+} K_xλ(ϖ)K_x`; (4) over `E` it is infinite iff
`S ≠ 1`, and `K̂_x`-double cosets are `W_0 ⋉ (K̂_x/K_x)`-orbits; (5) for non-special `x`,
`G(K) ≠ P_xZ(K)P_x` ([Bruhat–Tits I], Prop. (4.4.3), p. 80; [Haines–Rapoport], Prop. 8, p. 4, and
Prop. 13, p. 8; [Zhu], Lem. 1.8 (ii), p. 11, and Prop. 1.23, p. 19).

**The Iwasawa decomposition.** For special `x`, minimal `P = ZU`: (1) `G(K) = K_xP(K) = U(K)Z(K)K_x`
(also with `K̂_x`); (2) `K_x\G(K)/U(K) ≅ W_0\W̃`; (3) over `E`,
`K̂_x ∩ P(E) = (K̂_x ∩ Z(E))(K̂_x ∩ U(E))` and `G(E)/P(E)` is compact ([Bruhat–Tits I], Prop.
(7.3.1) and §7.3, p. 164, Cor. (7.3.2) (ii), p. 165, and Prop. (4.4.3), p. 80; [Casselman], Lem.
1.4.5 and Prop. 1.4.6, p. 15, and §3.1, p. 32).

**Iwasawa decomposition for an arbitrary parabolic and its integral form.** For a `K`-parabolic
`Q = M_QN_Q ⊇ P` and `K_x = 𝒢_x(O)` or `𝒢°_x(O)`: (1) `G(K) = K_xQ(K)`; (2)
`K_x ∩ Q(K) = (K_x ∩ M_Q(K))(K_x ∩ N_Q(K))`; (3) `G(E)/Q(E)` is compact; (4) for a reductive model
`𝒢`, `𝒢(O)` hyperspecial, and `𝒬 = 𝒩 ⋊ ℳ` the parabolic with generic fibre `Q`, `G(E) = 𝒢(O)Q(E)`
and `𝒢(O) ∩ Q(E) = 𝒩(O)ℳ(O)` (derived from [Casselman], §3.1, p. 32, and Prop. 1.4.6, p. 15;
[Bruhat–Tits I], Prop. (7.3.1), p. 164, Prop. (4.4.3), p. 80, and Prop. (6.4.9), p. 136;
[Gille 2009], §4.2, p. 53).
*Checks:* No parabolic of an isotropic group is a parahoric.

**The Kneser–Tits theorem over a local field.** For `G` semisimple, simply connected, absolutely
almost simple and isotropic, `G(K)^+ = ⟨U_a(K)⟩`: (1) if `#K ≥ 4`, proper normal subgroups of
`G(K)^+` are central and `G(K)^+` is perfect; (2) `G(E)^+ = G(E)` (Platonov 1969, characteristic
`0`; [Prasad–Raghunathan] in general); (3) so `G(E)` has no proper finite-index subgroup (derived);
(4) `G(K)^+ = 1` for anisotropic `G` ([Gille 2009], §1, p. 39, §4, p. 52, Fait 4.1, p. 52, and §3.3,
p. 51; [Prasad–Raghunathan], Comment. Math. Helv. 60 (1985), 107–121).
*Checks:* Not simply connected: `G(K)^+ = SL_2(K)` for `GL_2`, `W(E, PGL_2) = E^×/(E^×)²`.

**Unimodularity, the parabolic modulus and the Iwasawa integration formula.** (1) For `G` connected
reductive over a nonarchimedean local field `E`, Mathlib's `MeasureTheory.Measure.modularCharacter`
of `G(E)` is `1` ([Cartier], §4.1, p. 144; [Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196, and
Corollary 3.72, p. 197, in characteristic `0`). (2) For `H` smooth affine of finite type over such
`E` (any characteristic), the modular character of `H(E)` is `g ↦ |det Ad(g)|_E` on `Lie H`; for
`P = MN`, `δ_P(m) = |det(Ad(m)|Lie N)|_E`, on `S ⊂ M` equal to `q^{Σ_a dim 𝔤_a·a(v(s))}`
(`χ(v(s)) = −ω(χ(s))`; `dim 𝔤_a`, not `dim U_a`), and `modularCharacter(nm) = δ_P(m)`, the inverse
of Cartier's `Δ` (§4.1, (11), p. 145) ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196, and p.
197; [Casselman], §1.5 and Lemma 1.5.1, p. 16). (3) For minimal `P`, special maximal compact `K`,
`vol(K) = vol(M ∩ K) = vol(N ∩ K) = 1`: `∫_G f = ∫_K∫_M∫_N δ_P(m)⁻¹ f(nmk)` ([Cartier], §4.1,
formulas (3), (4) and (9), p. 145).
*Checks:* `G_m` has modulus `1`. At `diag(ϖ, 1)` the upper Borel of `GL_2(ℚ_3)` and of
`GL_2(𝔽_3((t)))` has modular character `1/3`, the lower `3`. In `SU_3` the exponent is `4`, not `5`.
*Lean:* `Decomposition.modularCharacter_eq_one`, `LocalIntegration.adjointModulus`,
`LocalIntegration.modularCharacter_eq_adjointModulus`.

**Non-injectivity of the Kottwitz map for proper Levis.** For `G` adjoint `ℚ_p`-simple and `M` a
proper Levi, `π₁(M)_I^φ → π₁(G)_I^φ` has kernel of positive rank, as `X_*(A_M) ↪ π₁(M)_I^φ ⊗ ℚ`
([Gleason–Lim–Xu], Lem. 4.12 and its proof, with (4.15), p. 31).
**Rational coset spaces are infinite.** For `G` over `ℚ_p` with a nontrivial split torus `S` and
`C ⊂ G(ℚ_p)` compact open, `λ ↦ λ(p)C` embeds `X_*(S)` in `G(ℚ_p)/C`; for adjoint `G` and
`C ≤ ker κ_G`, `G(ℚ_p)/C → π₁(G)_I^φ` is not injective ([Gleason–Lim–Xu], Prop. 4.11, p. 29,
(4.12)–(4.13), pp. 30–31, and Lem. 4.12, p. 31).
*Checks:* In `PGL_2(E)`, `τ = [[0,1],[ϖ,0]]` normalizes `I`, `κ(τ) ≠ 0`, so `I ∪ τI ⊄ ker κ`.

**Transport of root combinatorics to an unramified comparison group.** For `G` quasi-split adjoint
simple over `ℚ_p`, `σC = C`: (1) an unramified adjoint `G'` has `(W̃', σ') ≅ (W̃, σ)`, matching `Σ`,
`X_*(T)_I`, `π₁`, lengths, Bruhat orders, Levi subsets and `Adm(μ) ↔ Adm(μ')`; (2) for `σ`-stable
`Q^∨ ⊆ Λ ⊆ P^∨`, `W_{Q^∨} ⊆ Λ ⋊ W(Σ) ⊆ W_{P^∨}` are compatible ([van Hoften], §A.3.2, p. 69;
[He 2021], §4.1, footnote 1, p. 7; [Haines–Rapoport], Lem. 15, p. 9).
*Checks:* For quaternionic `PGL₁(D)`, Frobenius swaps `s₀, s₁`, matching no split `PGL_2`.

**Generation of parahoric and hyperspecial points by root groups and the torus.** (1) `𝒢°_x(O)` is
generated by `Z(K)_0` and the `U_{a,x}` ([Bruhat–Tits II], 5.2.4, p. 164); for `𝒢` split reductive
over `O_L` pinned by `(𝒯, 𝒰_a)`, `𝒢(O_L)` hyperspecial: (2) `𝒢(O_L) = ⟨𝒯(O_L), 𝒰_a(O_L)⟩`; (3) `𝒯`
and the `⟨𝒰_{±a}⟩(O_L)`, `a ∈ Δ`, suffice; (4) `𝒢(O_L) = ⊔_{W_0} I_CẇI_C`, each cell lying in the
generated subgroup ([Bruhat–Tits I], Prop. (6.4.9), p. 136, and Théorème (7.3.4), p. 165).

### Examples

**Decompositions for GL_n.** For `K` a `ModelField` (henselian, nontrivial discrete rank-one
valuation, perfect residue field; e.g. a nonarchimedean local field), a uniformizer `ϖ`, `n ≥ 0`,
`B` upper triangular and `I` the standard Iwahori (integral, upper triangular mod `𝔪`): (1) each `g`
lies in `GL_n(𝒪) diag(ϖ^μ) GL_n(𝒪)` for a unique `μ ∈ ℤⁿ` with `μ₁ ≥ ⋯ ≥ μₙ`; (2)
`GL_n(K) = B(K)GL_n(𝒪)`; (3) each `g` lies in `I(P_σ diag(ϖ^μ))I` for a unique `(σ, μ) ∈ Sₙ × ℤⁿ`.
Over `E`: `GL_n(E)/B(E)` is compact, the Iwasawa cells are `GL_n(O)ẇU(E)`, `#(IẇI/I) = q^{ℓ(w)}`,
`[K₀ϖ^{(1,0,…,0)}K₀ : K₀] = (q^n − 1)/(q − 1)`, `[K₀ϖ^λK₀ : K₀] = q^{⟨λ, 2ρ⟩}(1 + O(q⁻¹))`
(`K₀ = GL_n(O)`, computed here), and `GL_n(W(k))` is transitive on each `Gr_μ(k)`, `k` perfect
([Zhu], Lem. 1.8 and (1.2.3), p. 11, and §0.5, pp. 6–7; [Garrett], §17.5, p. 297).
*Checks:* For `n = 1` over a local field, `x = u ϖ^{ω(x)}` with `u ∈ 𝒪^×`.
*Lean:* `Decomposition.cartan_generalLinear`, `Decomposition.iwasawa_generalLinear`,
`Decomposition.iwahoriBruhat_generalLinear`.

**Rank-one and nonsplit Cartan sets.** Each Cartan set is `ℕ`, with `n`-th index: (1) `(q+1)q^{2n−1}`
for `SL_2`; (2) `(q+1)q^{n−1}` for `PGL_2`, odd `n` nontrivial in `π₁ = ℤ/2`, the order-two element
of `Ω` swapping the base-edge vertices, which `SL_2(E)` cannot do; (3) `(q³+1)q^{4n−3}` for
unramified `U_3` (biregular tree; `ℓ_E = 2n`, weighted `ℓ_L = 4n`); (4) `(q+1)q^{2n−1}` at both
vertices for ramified `SU_3`, `p` odd (walls `¼ℤ`, `Ω = 1`) ([Garrett], §17.5, p. 297;
[Haines–Rapoport], Prop. 8, p. 4, Lem. 14 and Lem. 15, p. 9; [Bruhat–Tits I], Prop. (4.4.3) and §4.4,
pp. 79–80; indices computed here from [Tits], §1.15, formulas (9)–(10), p. 42).

### Dependencies

- RG2.0–RG2.3: point topology, apartment, Kottwitz map, fixers, parahorics, Moy–Prasad filtrations.
- ReductiveGroups layers 6–7; RootSystems layer 3.
- Tau Ceti `TauCeti.TitsSystem`, `CoxeterSystem.BruhatLE`; Mathlib `CoxeterSystem`, Haar measure.

## Layer RG2.5: integral dual data

The dual based root datum, the pinned dual group `Ĝ` over `ℤ` with its Galois action, and the L-group
`ᴸG = Ĝ ⋊ Γ`. The `ℤ`-group of [Conrad RGS], Theorem 6.1.16(2), p. 196, and Theorem 6.1.17, p. 197,
base-changes to that of [Buzzard–Gee] and [Kaletha]; no `√q` is adjoined.

### RG2.5.1 the dual group and its Galois action

**The dual based root datum with its Galois action.** `Ψ_0(G) = (X^*, Δ, X_*, Δ^∨)` is the absolute
based root datum of an actual maximal torus, with base-preserving `μ_G : Γ_K → Aut(Ψ_0(G))` (the
actual action up to Weyl transport, [Springer], §3.2, p. 12; for quasi-split `G` the base of a
`K`-Borel, [Bruhat–Tits II], 4.1.2, p. 77). Its dual `(X_*, Δ^∨, X^*, Δ)` is Mathlib's flip
(`RootPairing.flip`, `RootPairing.Base.flip`); `Aut(Ψ_0(G)) ≅ Aut(Ψ_0(G)^∨)`, with the same index
permutation, sends `f` to `(f_X^t)⁻¹` on `X_*` (Mathlib's `RootPairing.Equiv.coweightEquiv` is
`f_X^t`), and `μ̂_G` preserves `Δ^∨` and factors through `Gal(K'/K)`, `K'` a finite Galois splitting
field ([Buzzard–Gee], §2.1, pp. 4–5; [Kaletha], §5.6, pp. 46–47).
*Checks:* `GL_n` is self-dual. Non-example: `f ↦ f_X^t` is not multiplicative on the `S_3` of `D_4`.

**The Langlands dual group over ℤ.** `Ĝ` is the pinned split reductive `ℤ`-group (smooth affine,
connected reductive fibres, [Conrad RGS], Definition 3.1.1, p. 81) of `Ψ_0(G)^∨` ([Conrad RGS],
Theorem 6.1.16(2), p. 196, and Theorem 6.1.17, p. 197): `T̂(R) = Hom(X_*(T), R^×)`, `B̂ ⊃ T̂` with
simple roots `Δ^∨`, root groups `x_{α^∨}` with `t x_{α^∨}(r) t⁻¹ = x_{α^∨}(α^∨(t)r)`, closed
immersions natural in `R` ([Buzzard–Gee], §2.1, pp. 4–5, over `ℚ̄`; §2.2, p. 10, for the `√p` not
adjoined).
*Checks:* `x_{α^∨}(1) ∉ T̂(ℚ)`; the root groups of `±α^∨` meet only in `1`, over every ring; the
trivial group and `G_m` (no roots) have different `Ĝ(ℚ)`.

**Pinned automorphisms of the dual group.** (1) `Aut(Ĝ, pinning) ≅ Aut(Ψ_0(G)^∨, Δ^∨)`, the
stabilizer (`MulAction.stabilizer`) of the base, faithful on `Ĝ(R)` for infinite fields `R`
([Conrad RGS], Theorem 6.1.17, p. 197). (2) Over a field `k`,
`Aut_k(Ĝ_k) = Ĝ^ad(k) ⋊ Aut(Ĝ, pinning)` ([Conrad RGS], Proposition 7.1.6, pp. 243–244), with
`Ĝ^ad(k) = Ĝ(k)/Z` for `k` algebraically closed ([Springer], Proposition 2.13 and Corollary 2.14, p.
10). (3) `Ĝ^ad(k)` acts simply transitively on pinnings ([Conrad RGS], the discussion before
Proposition 7.1.6, pp. 242–243; Theorem 7.1.9(3), p. 246).
*Checks:* `diag(−1, 1) ∈ PGL_2(ℝ)` does not lift to `SL_2(ℝ)`. Non-examples: a Weyl lift `Int(n)` is
not pinned; for `Ĝ = G_m`, inversion is trivial on `Ĝ(𝔽_2)` and on `Ĝ(ℤ)`.

**The Galois action on the dual group.** The pinned lift `μ̂_G : Γ_K → Aut(Ĝ, pinning)` acts on each
`Ĝ(R)`, naturally in `R`, preserving `T̂`, `B̂` and the pinning, with open kernel, and on `T̂(R)` by
`(γt)(y) = t(γ⁻¹y)`; it is trivial iff `μ_G` is (detected on one infinite field), iff `G` is an inner
form of a split group ([Springer], §3.2, p. 12); the Weil form pulls back along `W_K → Γ_K`
([Buzzard–Gee], §2.1, p. 5; [Kaletha], §2, p. 9, and §5.6, p. 46).
*Checks:* For quasi-split unitary groups, `γ` acts on `GL_n(R)` by `g ↦ J(g^t)⁻¹J⁻¹`, `J` antidiagonal
`(1, −1, 1, …)` ([Conrad RGS], Example 7.1.5, p. 243, and Example 7.1.10, p. 247).

### RG2.5.2 the L-group and its functoriality

**The L-group.** For `Γ = Γ_K`, `Gal(K'/K)` or (by pull-back) `W_K`, `^LG(R) = Ĝ(R) ⋊ Γ` via `μ̂_G`,
`(g, γ)(g', γ') = (g μ̂_G(γ)g', γγ')`, with projection to `Γ` of kernel `Ĝ(R)` and section, natural
in `R`; the finite form is an affine `ℤ`-group scheme with `(ᴸG)° = Ĝ`, `π_0 = Gal(K'/K)`, inflated
to the Galois form ([Buzzard–Gee], §2.1, p. 5; [Kaletha], §2, p. 9).
*Checks:* Trivial `μ_G` gives `Ĝ(R) × Γ`; for unitary `G` and infinite `R`, `^LG(R)` is not a
product.

**Independence of the L-group from choices.** `^LG` is canonical over `Γ`: `Ψ_0(G)` and `μ_G` are
canonical, two pinned duals are related by a unique `Γ`-equivariant pinned isomorphism, and for
pinnings of `Ĝ_k` (`k` algebraically closed) related by `h ∈ Ĝ(k)`, `μ̂' = Int(h)μ̂Int(h)⁻¹` and
`(g, γ) ↦ (hgh⁻¹, γ)` depends on `h` modulo the centre ([Buzzard–Gee], §2.1, pp. 4–5).

**Centre of the dual group and π₁.** `Z(Ĝ) ⊂ T̂` is diagonalizable with character group
`X_*(T)/Q^∨ = π₁(G)`, `Γ_K`-equivariantly (so `Z(Ĝ(R)) = Hom(π₁(G), R^×)` for `R = R̄`);
`X^*(Z(Ĝ)^I) = π₁(G)_I`; `Z(Ĝ)` is a torus iff `G_der` is simply connected, finite iff `G` is
semisimple ([Kaletha], §5.3, proof of Prop. 5.3, p. 33; [Springer], 2.15, pp. 10–11;
[Haines–Rapoport], introduction, (1), p. 1).
*Checks:* `PGL_2` has dual `SL_2`, whose centre `ℤ/2` is absent from `PGL_2(ℂ)`.

**Standard Levi subgroups on field-valued points.** For a field `R` and Galois-stable `Δ_M ⊆ Δ^∨`,
`M̂(R)` is generated by `T̂(R)` and the root groups in `ℤΔ_M`, and `^LM(R) = ⟨M̂(R), section⟩` meets
`Ĝ(R)` in `M̂(R)`, so `^LM(R) = M̂(R) ⋊ Γ_K` ([Kaletha], §5.5, proof of Lem. 5.7, p. 45).
*Checks:* `Δ_M = ∅` gives `T̂(R)`, proper if there are roots; unstable `Δ_M` are excluded.

**Dual groups of isogenies, products and z-extensions.** (1) For `Z ⊂ G` finite central,
`X_*(T) ⊂ X_*(T/Z)` gives a pinned equivariant isogeny `(G/Z)^∧ → Ĝ` with kernel dual to `X^*(Z)`
([Kaletha], §5.3, p. 33, and §4.1, pp. 16–17; [Conrad RGS], Theorem 6.1.16(1), p. 196); (2)
`(G × G')^∧ ≅ Ĝ × Ĝ'` ([Conrad RGS], Theorem 6.1.17, p. 197); (3) for a z-extension `G̃ → G` with
induced kernel `Z`, `X_*(Z) ↪ X_*(T̃) ↠ X_*(T)` is exact and `Z(Ĝ̃)` is a torus ([Springer], §2.15(b),
(e), (f), p. 11). **The L-group of a Weil restriction.** For `K'/K` finite separable, `G'` connected
reductive over `K'` and `H = Res_{K'/K}G'`, `X^*(T_H) = ⊕_{τ : K' → K^sep} X^*(T')_τ` ([Springer],
§3.3, p. 12), so `Ĥ = ∏_τ Ĝ'`, `μ̂_H(γ)(g_τ) = (μ̂_{G'}(γ_τ⁻¹γγ_{γ⁻¹τ})g_{γ⁻¹τ})`, `γ_τ|_{K'} = τ`
([Buzzard–Gee], §2.3, pp. 13–14).

### Examples

**Dual groups of tori and GL_n.** `T̂` is the split torus on `X_*(T)` (inversion on `G_m` for the
norm-one torus, permuted `G_m^{[K':K]}` for `Res_{K'/K}G_m`); `GL_n` is self-dual; `SL_n ↔ PGL_n`
([Buzzard–Gee], §2.2, Remark 2.2.1, p. 7; [Conrad RGS], Theorem 6.1.17, p. 197).
**GSp_4 is its own dual.** For `T = diag(st₁, st₂, st₂⁻¹, st₁⁻¹)`,
`X^* = {(a₁, a₂; c) : c ≡ a₁ + a₂ mod 2}` (`s^c t₁^{a₁} t₂^{a₂}`), basis `e₁ = (1,0;1)`,
`e₂ = (0,1;1)`, `e₃ = (0,0;2)`, and `X_* = {(b₁, b₂; d) ∈ (½ℤ)³ : bᵢ + d ∈ ℤ}`, dual basis
`f₁ = (1,0;0)`, `f₂ = (0,1;0)`, `f₃ = (−½,−½;½)` ([Pilloni], §5.1.1, p. 20); the symmetric unimodular
`((1,1,1), (1,0,1), (1,1,2))` maps `e₂ − e₁ ↦ −f₂`, `e₃ − 2e₂ ↦ f₂ − f₁`: `Ψ ≅ Ψ^∨` ([Conrad RGS],
Theorem 6.1.17, p. 197).
*Checks:* The printed coroots of [Pilloni] fail: `⟨e₃ − 2e₂, f₂⟩ = −2`.

### Dependencies

- RG2.0a (Weil restriction, norm tori); RG2.1 (`π₁`, z-extensions); ClassFieldTheory layer 9.
- ReductiveGroups layers 7 and 9 (root data, pinned Chevalley–Demazure groups).
- Mathlib `RootPairing`, `SemidirectProduct`; Tau Ceti `TauCeti.Pinning`.

## Downstream consumers

AdelicAlgebraicGroups uses RG2.0 (the point topology `PointTopology.instTopologicalSpaceWithConv`
with the local instances, `PointTopology.isTopologicalGroup`, the compact open integral points and
the congruence subgroups `CongruenceSubgroup.subgroup`), RG2.0a (the Weil restriction functor
`WeilRestriction.functor`, its representing Hopf algebra and the Deligne torus), the modulus
`LocalIntegration.adjointModulus`, the integral Iwasawa decomposition of RG2.4 (`G(F_v) = K_v P(F_v)`
with `K_v ∩ P(F_v) = P(O_v)` at almost all places) and the Kneser–Tits consequence that `G(E)` has no
proper subgroup of finite index; it states the adelic and `F_v` instances of RG2.0 and RG2.0a
itself. SmoothRepresentationsOfLocalGroups uses the point topology, the Iwahori decompositions and
the modulus statements of RG2.4 (the Iwahori factorization, the double-coset cardinalities, the
modulus `δ_P` and the Iwasawa integration formula) without restating them, and builds Hecke algebras
and the Satake isomorphism on them together with the dual group and L-group of RG2.5. The
Shimura-datum and Shimura-level consumers use the Deligne torus of RG2.0a, the parahoric group
schemes, hyperspecial vertices and tame realizations of RG2.3, and the admissible sets of RG2.4.
Roadmaps on types for tame groups, z-embeddings and central pushouts, affine Grassmannians and local
models cite RG2.2–RG2.5 for the building, the Moy–Prasad filtrations, the Iwahori–Weyl
combinatorics and the L-group.

## References

- [Adler] Jeffrey D. Adler, *Refined anisotropic K-types and supercuspidal representations*,
  Pacific J. Math. 185 (1998), 1–32. https://msp.org/pjm/1998/185-1/
- [Anantharaman] Sivaramakrishna Anantharaman, *Schémas en groupes, espaces homogènes et espaces
  algébriques sur une base de dimension 1*, Mém. Soc. Math. France 33 (1973), 5–79.
  http://www.numdam.org/item/MSMF_1973__33__5_0.pdf
- [Bosch–Lütkebohmert–Raynaud] Siegfried Bosch, Werner Lütkebohmert, Michel Raynaud,
  *Néron Models*, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 21, Springer (1990).
  https://doi.org/10.1007/978-3-642-51438-8
- [Bruhat–Tits 1984] François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes
  classiques sur un corps local*, Bull. Soc. Math. France 112 (1984), 259–301.
  http://www.numdam.org/item/10.24033/bsmf.2006.pdf
- [Bruhat–Tits I] François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données
  radicielles valuées*, Publ. Math. IHÉS 41 (1972), 5–251.
  http://www.numdam.org/item/10.1007/BF02715544.pdf
- [Bruhat–Tits II] François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas
  en groupes. Existence d'une donnée radicielle valuée*, Publ. Math. IHÉS 60 (1984), 5–184.
  http://www.numdam.org/item/10.1007/BF02700560.pdf
- [Buzzard–Gee] Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic
  representations and Galois representations*, LMS Lecture Note Series 414 (2014), 135–187;
  arXiv:1009.0785v3. https://arxiv.org/abs/1009.0785
- [Calegari–Geraghty] Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles
  method*, Invent. Math. 211 (2018), 297–433; arXiv:1207.4224v2. https://arxiv.org/abs/1207.4224
- [Cartier] Pierre Cartier, *Representations of p-adic groups: a survey*, in *Automorphic Forms,
  Representations and L-functions* (Corvallis 1977), Proc. Sympos. Pure Math. 33, Part 1, AMS 1979,
  111–155.
- [Casselman] W. Casselman, *Introduction to the theory of admissible representations of p-adic
  reductive groups*, draft of 1 May 1995.
  https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf
- [Česnavičius] Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168 (2019),
  1461–1486; arXiv:1711.06456v4. https://arxiv.org/abs/1711.06456
- [Chen] Miaofen Chen, *Composantes connexes géométriques de la tour des espaces de modules
  de groupes p-divisibles*, Ann. Sci. Éc. Norm. Supér. 47 (2014), 723–764.
  https://www.numdam.org/item/10.24033/asens.2225.pdf
- [Conrad] Brian Conrad, *Weil and Grothendieck approaches to adelic points*, L'Enseignement
  Math. 58 (2012), 61–97; page numbers are those of the author's version dated 31 December 2011.
  https://math.stanford.edu/~conrad/papers/adelictop.pdf
- [Conrad RGS] Brian Conrad, *Reductive group schemes*, author notes (390-page version).
  https://math.stanford.edu/~conrad/papers/luminysga3.pdf
- [Edixhoven] Bas Edixhoven, *Néron models and tame ramification*, Compositio Math. 81 (1992),
  291–306. http://www.numdam.org/item/CM_1992__81_3_291_0.pdf
- [Fintzen] Jessica Fintzen, *Types for tame p-adic groups*, Ann. of Math. 193 (2021), 303–346;
  arXiv:1810.04198v2. https://arxiv.org/abs/1810.04198
- [Garrett] Paul Garrett, *Buildings and Classical Groups*, Chapman & Hall (1997).
  https://www-users.cse.umn.edu/~garrett/m/buildings/book.pdf
- [Geck–Iancu] Meinolf Geck, Lacrimioara Iancu, *Coxeter groups and automorphisms*,
  arXiv:1412.5428v1 (2014). https://arxiv.org/abs/1412.5428
- [Gille 2009] Philippe Gille, *Le problème de Kneser–Tits*, Séminaire Bourbaki, exp. 983,
  Astérisque 326 (2009), 39–81. http://www.numdam.org/item/AST_2009__326__39_0.pdf
- [Gleason–Lim–Xu] Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine
  Deligne–Lusztig varieties*, Invent. Math. 243 (2026), 805–861; arXiv:2208.07195v3.
  https://arxiv.org/abs/2208.07195
- [Haines] Thomas J. Haines, *Dualities for root systems with automorphisms and applications to
  non-split groups*, Represent. Theory 22 (2018), 1–26; arXiv:1604.01468v2.
  https://arxiv.org/abs/1604.01468
- [Haines–Rapoport] Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*, appendix to
  Pappas–Rapoport, *Twisted loop groups and their affine flag varieties*, Adv. Math. 219 (2008),
  118–198. https://www.math.umd.edu/~tjh/HRParahoric3.pdf
- [Haines–Rostami] Thomas J. Haines, Sean Rostami, *The Satake isomorphism for special maximal
  parahoric Hecke algebras*, Represent. Theory 14 (2010), 264–284; arXiv:0907.4040.
  https://arxiv.org/abs/0907.4040
- [Harpaz–Wittenberg] Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et
  problème de Galois inverse*, J. Amer. Math. Soc. 33 (2020), 775–805; arXiv:1802.09605v2.
  https://arxiv.org/abs/1802.09605
- [He 2018] Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*, Forum Math. Pi 6
  (2018), e2; arXiv:1610.04791v3. https://arxiv.org/abs/1610.04791
- [He 2021] Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*, Forum
  Math. Pi 9 (2021), e9; arXiv:2001.03325v1. https://arxiv.org/abs/2001.03325
- [He–Nie–Yu] Xuhua He, Sian Nie, Qingchao Yu, *Affine Deligne–Lusztig varieties with finite Coxeter parts*, Algebra & Number Theory 18 (2024), 1681–1714.
  https://msp.org/ant/2024/18-9/ant-v18-n9-p03-p.pdf
- [van Hoften] Pol van Hoften (appendix by Rong Zhou), *Mod p points on Shimura varieties of
  parahoric level*, Forum Math. Pi 12 (2024), e20; arXiv:2010.10496v4.
  https://arxiv.org/abs/2010.10496
- [Kaletha] Tasho Kaletha, *Rigid inner forms of real and p-adic groups*, Ann. of Math. 184 (2016),
  559–632; arXiv:1304.3292v5. https://arxiv.org/abs/1304.3292
- [Kim–Yu] Ju-Lee Kim, Jiu-Kang Yu, *Construction of tame types*, arXiv:1612.04204v1 (2016).
  https://arxiv.org/pdf/1612.04204v1
- [Kisin] Mark Kisin, *Mod p points on Shimura varieties of abelian type*, J. Amer. Math. Soc. 30
  (2017), 819–914. https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf
- [Kisin–Pappas] Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric
  level structure*, Publ. Math. IHÉS 128 (2018), 121–218; arXiv:1512.01149v3.
  https://arxiv.org/abs/1512.01149
- [Kisin–Pappas–Zhou] Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties
  with parahoric level structure, II*, Forum Math. Pi 14 (2026), e14; arXiv:2409.03689v3.
  https://arxiv.org/abs/2409.03689
- [Kisin–Zhou] Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to
  abelian varieties*, Ann. of Math. 202 (2025), 1077–1156; arXiv:2103.09945v2.
  https://arxiv.org/abs/2103.09945
- [Kottwitz 1997] Robert E. Kottwitz, *Isocrystals with additional structure. II*,
  Compositio Mathematica 109 (1997), 255–339,
  [published article](https://doi.org/10.1023/A:1000102604688).
- [Milne AG] J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a
  field*, version 2.00 (2015; numbering differs from the CUP 2017 book).
  https://www.jmilne.org/math/CourseNotes/iAG200.pdf
- [Milne ISV] J. S. Milne, *Introduction to Shimura varieties*, revised 2017 (numbering of Clay
  Math. Proc. 4 (2005)). https://www.jmilne.org/math/xnotes/svi.pdf
- [Moy–Prasad 1994] Allen Moy, Gopal Prasad, *Unrefined minimal K-types for p-adic groups*,
  Invent. Math. 116 (1994), 393–408.
- [Moy–Prasad 1996] Allen Moy, Gopal Prasad, *Jacquet functors and unrefined minimal K-types*,
  Comment. Math. Helv. 71 (1996), 98–121.
- [Nguyễn Quốc Thắng] Nguyễn Quốc Thắng, *On corestriction principle in non-abelian Galois
  cohomology over local and global fields. II: Characteristic p > 0*, ICTP IC/2004/78 (2004).
  https://cds.cern.ch/record/984004/files/cer-002647101.pdf
- [Pappas–Rapoport] Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag
  varieties*, Adv. Math. 219 (2008), 118–198. https://arxiv.org/abs/math/0607130
- [Pilloni] Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular
  weights*, Duke Math. J. 169 (2020), 1647–1807; author preprint, §5.1.1 on p. 20.
  https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf
- [Platonov–Rapinchuk–Rapinchuk] V. Platonov, A. Rapinchuk and I. Rapinchuk,
  *Algebraic Groups and Number Theory*, Volume I, 2nd edition, Cambridge Studies in
  Advanced Mathematics 205, Cambridge University Press, 2023.
- [Prasad] Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified
  descent in Bruhat–Tits theory*, Amer. J. Math. 142 (2020), 1239–1267; arXiv:1705.02906v5.
  https://arxiv.org/abs/1705.02906
- [Prasad–Raghunathan] Gopal Prasad, M. S. Raghunathan, *On the Kneser–Tits problem*, Comment.
  Math. Helv. 60 (1985), 107–121.
- [Prasad–Yu] Gopal Prasad, Jiu-Kang Yu (appendix by Brian Conrad), *On quasi-reductive group
  schemes*, J. Algebraic Geom. 15 (2006), 507–549. https://arxiv.org/abs/math/0405381
- [Rapoport] Michael Rapoport, *A guide to the reduction modulo p of Shimura varieties*,
  author preprint (40-page version). https://www.mi.uni-koeln.de/mi/Forschung/Rapoport/redshi.pdf
- [Richarz] Timo Richarz, *On the Iwahori–Weyl group*, Bull. Soc. Math. France 144 (2016), 117–124;
  arXiv:1310.4635v1. https://arxiv.org/abs/1310.4635
- [Serre] Jean-Pierre Serre, *Arbres, amalgames, SL₂*, Astérisque 46, Société Mathématique de
  France (1977); English translation *Trees*, Springer (1980). Page numbers are those of the Numdam
  scan. https://www.numdam.org/item/AST_1983__46__1_0/
- [Springer] T. A. Springer, *Reductive groups*, in *Automorphic Forms, Representations
  and L-functions* (Corvallis 1977), Proc. Sympos. Pure Math. 33, Part 1, AMS 1979, 3–27.
- [Stacks] The Stacks Project Authors, *The Stacks Project*, Tag 05Y8 (restriction of scalars) and
  Tag 05YF. https://stacks.math.columbia.edu/tag/05Y8
- [Tits] J. Tits, *Reductive groups over local fields*, in *Automorphic Forms,
  Representations and L-functions* (Corvallis 1977), Proc. Sympos. Pure Math. 33,
  Part 1, AMS 1979, 29–69.
- [Zhu] Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, Ann. of
  Math. 185 (2017), 403–492; arXiv:1407.8519v3. https://arxiv.org/abs/1407.8519

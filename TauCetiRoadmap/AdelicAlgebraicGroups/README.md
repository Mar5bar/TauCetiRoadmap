# Roadmap: adelic algebraic groups and arithmetic quotients

**Summary.** This roadmap develops algebraic groups over number fields on the adeles: the adelic
points and their topology, Haar and Tamagawa measures, the arithmetic quotient `G(F)\G(𝔸_F)` with
reduction theory, finiteness of class numbers, finite volume and compactness criteria, strong
approximation, neat levels and Hecke correspondences, with `GL₁`, `GL₂` and quaternion algebras as
worked examples. We want it because automorphic forms live on these quotients: the locally
symmetric spaces whose cohomology carries Hecke eigensystems and Galois representations are exactly
`G(F)\G(𝔸_F)/K`, and their finiteness, compactness and level structure are what make the
cohomology finite-dimensional and the Hecke action well defined. Everything about automorphic
representations and arithmetic manifolds downstream rests on these statements.

## Scope and ownership

The roadmap owns:

- AA.0: Borel structure and Haar measures of restricted products of countably many second countable
  locally compact groups (usable unchanged over function fields), convergent rescalings, and the
  normalized Haar measures on adeles and ideles;
- AA.1: adelic points of affine `F`-groups and their topology, integral models, the restricted-product
  comparison, the discrete diagonal, restriction of scalars, `G_a`, `G_m`, `GL_n`, unimodularity and
  compact open levels;
- AA.2: rational characters, `H_G`, `A_G(ℝ)^0`, the norm-one subgroup, parabolic moduli, quotient
  integration, rational quotient measures, gauge forms, Artin convergence factors, Tamagawa measures
  and numbers and their behaviour under restriction of scalars;
- AA.3: reduction theory: rational parabolics and Iwasawa integration, fixed-`K` real Siegel
  coordinates, reduced forms, primitive and closed-orbit reduction, adelic Siegel sets, class numbers,
  finite volume and compactness, heights, cusps and Orr–Schnell containment;
- AA.4: weak and strong approximation with their torsor and arithmetic-closure inputs, neat levels,
  level quotients, coverings and fibre formulas, Hecke correspondences, volumes, abelianization,
  quaternion norms, idele classes modulo squares and Fourier limits on compact abelian groups;
- AA.5: `GL₁` quotients and logarithmic tori, `GL₂` level quotients over `ℚ` and the upper half-plane
  with change of level, and definite quaternion groups.

Outside the roadmap: representation and spectral theory of automorphic forms; locally symmetric
spaces, Shimura data and Shimura varieties beyond the neat levels and level quotients of AA.4; the
construction of a quaternion residual quotient and of arithmetic torus images in it (AA.4.7 applies
to a specified compact quotient); the comparison of the `GL₂` quotients with algebraic modular
curves.

Cited roadmaps: ReductiveGroups (`TauCetiRoadmap/ReductiveGroups`; layers 1, 3, 4, 6, 7: comodules,
closed subgroups and quotients, character lattices, centre and derived group, rational parabolics,
relative roots and Weyl groups; Cartier's theorem is a standing input there); ReductiveGroupsPartII
(RG2.0 point topology, RG2.0a Weil restriction, RG2.1 root data and z-extensions, RG2.3 reductive
models and Lang's theorem, RG2.4 local decompositions, unimodularity, Iwasawa integration and
local Kneser–Tits); GlobalNumberFields (layers 0, 1, 4, 5, 6, 8: places, product formula, weak
approximation, adeles, idele norms and compactness of `C_F^1`, scalar extension of adeles);
NumberFieldArithmetic layer 4; the LieGroups (layer 9) and CompactGroups (layers 0, 5) roadmaps of
RepresentationTheory; GlobalQuadraticForms layer 5; Chebotarev layer 10; ClassFieldTheory layers
11–12; AlgebraicTopology stages 5–6; LocalFieldsRamification layer 0;
SmoothRepresentationsOfLocalGroups SR.1.1; IntegralLattices 2F–2G; FuchsianOrbifolds layers 0, 1,
4, 5; and the LFunctions (layers 5–6), MassFormula (layer 2), ArithmeticHeights (§0.1) and
SchemeAndStackFoundations (§§1.15, 2.3) roadmaps.

## Conventions

- **Groups and points.** `F` is a number field, `𝒪_F` its integers. An affine algebraic `F`-group
  `G` is a finite-type commutative Hopf `F`-algebra `H`; `G(R) = WithConv (H →ₐ[F] R)` under
  convolution, coordinate maps are contravariant. Points with values in a topological ring carry
  the point topology (the coarsest making every evaluation continuous); homogeneous and double
  quotients carry the quotient topology. Smoothness, connectedness, reductivity and simple
  connectedness are hypotheses where stated. Finite sets of places contain the archimedean places
  when so stated; integral-model indices refer to finite places.
- **Adeles and normalizations.** `𝔸_F`, `𝔸_{F,f}`, `F_∞ = F ⊗ ℝ`, `𝔸_F^S` are the adeles, finite
  adeles, archimedean product and adeles away from `S`. Absolute values satisfy the product formula
  (squared at complex places). Additive measures: `vol(𝒪_v) = 1`, `dx` at real and `2 dx dy` at
  complex places. Multiplicative idele measure: `vol(𝒪_v^×) = 1`; the form measure `|dx/x|_v` gives
  `𝒪_v^×` volume `1 − q_v⁻¹`.
- **Modular characters.** Mathlib's `Δ` is fixed by `(right translation by g)_* μ_left = Δ(g) μ_left`.
  Integration on `H\G` uses right Haar measures with `Δ_G|_H = Δ_H`. For a parabolic `P = N ⋊ M`,
  `δ_P(m) = |det(Ad(m) | Lie N)|_𝔸`; `Δ_P(nm) = δ_P(m)`, left Haar measure is `δ_P(m)⁻¹ dn dm` and
  right Haar measure is `dn dm`.
- **Characters and the split centre.** `X*_F(G)` is the group of `F`-rational characters,
  `a_G = Hom(X*_F(G), ℝ)`, `H_G` the Harish-Chandra map and `G(𝔸)^1 = ker H_G`. `A_G` is the largest
  `ℚ`-split central torus of `Res_{F/ℚ} G` and `A_G(ℝ)^0` its positive real points; it need not be
  the whole archimedean centre, and `G(𝔸)^1` is not `G(F_∞)^1 × G(𝔸_f)`.
- **Gauge forms.** A gauge form is a nonzero vector of the top exterior power of the identity
  cotangent space; place-by-place scalar Jacobians are kept until the global discriminant identity.
- **Siegel sets and neatness.** Real Siegel sets use one maximal compact `K`, fixed throughout a
  comparison. Neatness uses a faithful algebraic representation (a closed immersion) at one
  embedding `F → ℂ` and is independent of both; it is weaker than neatness after restriction of
  scalars to `ℚ`. A level `U` is neat when every `G(F) ∩ xUx⁻¹` is neat.
- **Standing analytic inputs.** The analytic bridges used below (nonarchimedean charts and change of
  variables, finite-field orders, the `p`-adic closed-subgroup theorem, Borel density, local torsor
  vanishing, Hermite–Minkowski reduction, closed-orbit weight bounds, geometry-of-numbers counts,
  Cholesky bounds) are targets of this roadmap, not consequences of its rank-one examples.
- **Locators.** Each locator attaches to its target; the References fix the editions (arXiv and
  journal pages are distinguished). A derivation from a special case of a source says so.

## Exact supplier contracts

| Object | Supplier | File |
| --- | --- | --- |
| Restricted products and their topology | `RestrictedProduct`, `RestrictedProduct.isTopologicalGroup`, `RestrictedProduct.locallyCompactSpace_of_group`, `RestrictedProduct.isOpenEmbedding_inclusion_principal`, `RestrictedProduct.unitsEquiv` | `Mathlib/Topology/Algebra/RestrictedProduct/` |
| Finite splitting and change of restricting subgroups | `TauCeti.awayDecomposition`, `TauCeti.restrictedProductCongr` | `TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.lean`, `.../Congr/Basic.lean` |
| Haar measures, products, modular character | `MeasureTheory.Measure.addHaarMeasure`, `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.infinitePi`, `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`, `MeasureTheory.Measure.modularCharacter`, `RealRMK.integral_rieszMeasure` | `Mathlib/MeasureTheory/` |
| Fundamental domains and unfolding | `MeasureTheory.IsFundamentalDomain`, `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`, `QuotientGroup.integral_eq_integral_automorphize`, `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul` | `Mathlib/MeasureTheory/Group/`, `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean` |
| Adeles, ideles, mixed space | `NumberField.AdeleRing`, `IsDedekindDomain.FiniteAdeleRing`, `NumberField.IdeleGroup`, `NumberField.IdeleClassGroup`, `NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace`, `NumberField.mixedEmbedding.volume_fundamentalDomain_latticeBasis`, `NumberField.InfiniteAdeleRing.homeomorphMixedSpace` | `Mathlib/NumberTheory/NumberField/`, `TauCeti/NumberTheory/NumberField/Global/Adeles/Basic.lean` |
| Idele norm, product formula, discreteness | `TauCeti.GlobalNumberFields.ideleNorm`, `TauCeti.GlobalNumberFields.IdeleClassGroup.isCompact_normOne`, `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`, `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`, `TauCeti.GlobalNumberFields.weakApproximation_denseRange` | `TauCeti/NumberTheory/NumberField/Global/` |
| Class group of the finite ideles | `IsDedekindDomain.FiniteAdeleRing.integralUnits`, `IsDedekindDomain.FiniteAdeleRing.quotientEquivClassGroup` | `TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/ClassGroup.lean` |
| Dedekind zeta residue | `NumberField.dedekindZeta_residue`, `NumberField.dedekindZeta_residue_pos`, `TauCeti.dedekindZeta_eulerProduct_hasProd` | `Mathlib/NumberTheory/NumberField/`, `TauCeti/NumberTheory/` |
| Points of Hopf algebras and coefficient maps | `WithConv`, `TauCeti.HopfAlgebra.points`, `TauCeti.AlgHom.mapValue` | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean`, `.../FunctorOfPoints.lean` |
| Closed subgroups, centre, derived group | `TauCeti.HopfIdeal`, `TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, `TauCeti.CommHopfAlgCat.centerDefiningIdeal`, `TauCeti.CommHopfAlgCat.derivedDefiningIdeal` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Basic.lean`, `.../Center/Basic.lean`, `.../Derived/Basic.lean` |
| Concrete groups | `TauCeti.GeneralLinear.pointsMulEquiv`, `TauCeti.GeneralLinear.determinantGroupLike`, `TauCeti.SpecialLinear.coordinateHopfAlgebra`, `TauCeti.MultiplicativeGroup.pointsMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/`, `.../SpecialLinear/Basic.lean`, `.../MultiplicativeGroup/Basic.lean` |
| Group-theoretic predicates | `TauCeti.reductiveCommHopfAlgProperty`, `TauCeti.geometricallyConnectedCommHopfAlgProperty`, `TauCeti.geometricallyReducedCommHopfAlgProperty`, `TauCeti.SemisimpleCommHopfAlgCat`, `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`, `TauCeti.smoothUnipotentCommHopfAlgProperty`, `TauCeti.torusCommHopfAlgProperty`, `TauCeti.splitTorusCommHopfAlgProperty` | `TauCeti/Algebra/AlgebraicGroup/` |
| Characters, cotangent space, adjoint action | `GroupLike`, `GroupLike.toUnits`, `IsGroupLikeElem.map`, `TauCeti.CommHopfAlgCat.additiveCharacterGroup`, `TauCeti.Bialgebra.CotangentSpace`, `Derivation.adjointAction`, `exteriorPower` | `Mathlib/RingTheory/`, `TauCeti/Algebra/AlgebraicGroup/Tangent/` |
| Dynamic parabolics | `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`, `TauCeti.Cocharacter.unipotent`, `TauCeti.Cocharacter.leviDecompositionMulEquiv` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/` |
| Double cosets, levels, coverings | `DoubleCoset.Quotient`, `DoubleCoset.quotientMapOfLELeft`, `HeckeCoset.degree_eq_relIndex`, `Subgroup.Commensurable`, `IsCoveringMap`, `IsQuotientCoveringMap.isCoveringMap_of_comp`, `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`, `CategoryTheory.ActionCategory.stabilizerIsoEnd` | `Mathlib/GroupTheory/DoubleCoset.lean`, `TauCeti/GroupTheory/DoubleCoset/Map.lean`, `TauCeti/NumberTheory/HeckeRing/Basic.lean`, `TauCeti/Topology/Covering/Quotient.lean` |
| Positive matrices | `TauCeti.cholesky` | `TauCeti/LinearAlgebra/Matrix/Cholesky/Basic.lean` |
| Upper half-plane and congruence subgroups | `UpperHalfPlane.glAction`, `ModularGroup.exists_smul_mem_fd`, `Subgroup.IsArithmetic`, `CongruenceSubgroup.Gamma`, `CongruenceSubgroup.Gamma0`, `CongruenceSubgroup.Gamma1`, `Matrix.GLPos` | `Mathlib/NumberTheory/ModularForms/`, `Mathlib/Analysis/Complex/UpperHalfPlane/` |
| Quaternion norm | `QuaternionAlgebra`, `QuaternionAlgebra.normForm` | `Mathlib/Algebra/Quaternion.lean`, `TauCeti/Algebra/Quaternion/NormForm.lean` |
| Point topology and local points (RG2.0) | `PointTopology.instTopologicalSpaceWithConv`, `PointTopology.isTopologicalGroup`, `PointTopology.locallyCompactSpace_of_finiteType`, `PointTopology.generalLinearPointsHomeomorph`, `PointTopology.compactSpace_integralPoints` | `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` |
| Weil restriction, local integration (RG2.0a, RG2.4) | `WeilRestriction.functor`, `WeilRestriction.functor_isCorepresentable`, `LocalIntegration.modularCharacter_eq_adjointModulus`, `Decomposition.modularCharacter_eq_one` | `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` |
| Scalar extension of adeles | `adeleBaseChangeEquiv` | `TauCetiRoadmap/GlobalNumberFields/Suggested.lean` |

Kept variants: `AdelicPoints.diagonal`, `finiteDiagonal`, `infiniteDiagonal`, `finiteProjection`,
`infiniteProjection` are `TauCeti.AlgHom.mapValue` along the structure and projection maps;
`Adeles.finiteAdeleHaar` is `MeasureTheory.Measure.addHaarMeasure` at `∏_v 𝒪_v`; the topology
on adelic points is RG2's point topology at `R = 𝔸_F`, `𝔸_{F,f}`, `F_∞` or `F_v`.

## How to read the build

`README.md` specifies the mathematics; `Suggested.lean` gives signatures for the targets statable
against the pinned Mathlib, Tau Ceti and ReductiveGroupsPartII, each ending with a *Lean:* line. The
other targets (the Tamagawa measure, `A_G`, quotient measures on coset spaces, adelic Siegel sets,
heights, torsors and restriction of scalars on adelic points among them) are specified here alone; building them
is part of the target. *Checks* are discriminating cases and counterexamples to dropped hypotheses,
with a Lean form as `example`s where one exists; *Needs:* clauses name inputs; `AA.k.n` is a
subsection of this roadmap.

## Layer AA.0: restricted products of Haar measures

`ι` is countable, `G_i` second countable locally compact Hausdorff groups with Borel σ-algebras,
`B_i ≤ G_i` open subgroups, compact for all but finitely many `i`, and `μ_i` left Haar measures.
Purely topological splitting statements allow arbitrary index sets.

### AA.0.1 Borel structure and local normalization

**Second countability of restricted products.** For countable `ι`, second countable `G_i` and open
`B_i`, `Πʳ i, [G_i, B_i]` is second countable, so its Borel σ-algebra is generated by the boxes
`Π_i C_i` with `C_i` open and `C_i = B_i` for all but finitely many `i` ([Sutherland], §23.3, p. 6).
*Needs:* Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`.
*Lean:* `RestrictedHaar.secondCountableTopology`.

**Borel structure on a restricted product.** The restricted product carries its Borel σ-algebra;
coordinate maps are measurable, a box with Borel factors that are cofinitely `B_i` is measurable,
the inclusion of every principal piece `U_S = Π_{i∈S} G_i × Π_{i∉S} B_i` is measurable, and the
Borel σ-algebra is generated by the boxes with open factors ([Sutherland], §23.3, p. 6).
*Checks:* `box univ = univ`, and a box with one empty factor is empty. For `ι = ℕ`, `G_i = ℤ/4`,
`B_i = 2ℤ/4`, the singleton `{0}` is a decreasing intersection of boxes, hence measurable, but is
not itself a box; the σ-algebra generated by the subgroups `U_S` and their cosets misses it.
*Lean:* in `RestrictedHaar`: `instMeasurableSpace`, `instBorelSpace`, `box`.

**Normalized local Haar measures.** For a finite place `v` of a number field `K` there is a unique
additive Haar measure `μ_v` on `K_v` with `μ_v(𝒪_v) = 1`, and `map (a · ·) μ_v = |a|_v⁻¹ μ_v` for
`a ∈ K_v^×`, `|a|_v = q_v^{−v(a)}` the normalized absolute value ([Sutherland], §23.3, p. 6).
*Needs:* Tau Ceti `TauCeti.normalizedAbsoluteValue`; Mathlib `MeasureTheory.Measure.addHaarMeasure`.

### AA.0.2 Compatible measures on principal pieces

**Product measure on a level subgroup.** For finite `S` with `B_i` compact and `μ_i(B_i) = 1` for
`i ∉ S`, the level measure `μ_S` on `U_S` is the product of `Measure.pi (μ_i)_{i∈S}` with the
infinite product of the probability measures `μ_i|_{B_i}`, `i ∉ S`. A box with factors `C_i`
(`i ∈ S`) and `B_i` (`i ∉ S`) has mass `∏_{i∈S} μ_i(C_i)`; `μ_S` is left Haar on `U_S`; if every
`B_i` is compact of mass `1`, `μ_∅` is a probability measure ([Sutherland], §23.3, p. 6; [Borel],
§5.5, p. 21).
*Checks:* For `S = {i₀}`, `G_{i₀} = ℤ/4` with counting measure, `B_{i₀} = 2ℤ/4`, `C = {0}`:
`μ_S{x | x_{i₀} ∈ C} = 1`; renormalizing the exceptional factor would give `1/2`.

**Compatibility of level measures.** For finite `S ⊆ S′` as above, the restriction of `μ_{S′}` to
the open subgroup `U_S ⊆ U_{S′}` is `μ_S` ([Borel], §5.5, p. 21).

**Directed suprema of compatible measures.** If `(U_S)` is a countable directed family of
measurable sets covering `X` and `ν_S` are measures carried by `U_S` with `ν_{S′}|_{U_S} = ν_S`,
then `E ↦ sup_S ν_S(E ∩ U_S)` is the unique measure restricting to every `ν_S` ([Borel], §5.5,
p. 21).

**Restricted product of Haar measures.** Given left Haar `μ_i` with `μ_i(B_i) = 1` for all but
finitely many `i`, the directed supremum `∏ʳ μ_i` of the `(U_S ↪ Πʳ)_* μ_S` is a Borel measure on
`Πʳ i, [G_i, B_i]`, and it scales by `∏ᶠ c_i` when `μ_i` is scaled by `c_i`, `c_i = 1` cofinitely
([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the construction after it, pp. 188–189; [Borel],
§5.5, p. 21).
*Checks:* Integral masses `1` give integral box mass `1`; exceptional masses `2`, and `2, 3`, give `2`
and `6` (normalizing every factor gives `1`); a factor of infinite mass gives infinite total mass;
for a finite index set and full level the measure is `Measure.pi`.
*Lean:* `RestrictedHaar.exists_unique_haarProduct`.

**Restriction of the restricted product measure to a level.** For finite `S` containing the indices
where `B_i` is noncompact or `μ_i(B_i) ≠ 1`, `(∏ʳ μ_i)|_{U_S} = (U_S ↪ Πʳ)_* μ_S`, and `∏ʳ μ_i` is the
unique Borel measure with this property ([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63, pp. 188–189).
*Checks:* At the empty level it is the pushforward of the integral probability; at a singleton level
of integral mass `2` both sides give `2`, with no division by `2`.

**Measure of a box.** For Borel `C_i ⊆ G_i` with `C_i = B_i` cofinitely, `∏ʳ μ_i(Π_i C_i) = ∏ᶠ_i μ_i(C_i)`;
this property determines `∏ʳ μ_i` ([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63, pp. 188–189).
*Lean:* `RestrictedHaar.exists_unique_haarProduct`.

**The restricted product measure is a Haar measure.** `∏ʳ μ_i` is invariant under left translation,
finite on compacts and positive on nonempty open sets; if every `μ_i` is right invariant, so is
`∏ʳ μ_i` ([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63, pp. 188–189).
*Checks:* The zero measure fails positivity on open sets; the integral box has mass `1` when all
integral masses are `1`, although the whole group can have infinite mass.
*Lean:* `RestrictedHaar.exists_unique_haarProduct`.

### AA.0.3 Products, transport and changes of normalization

**Change of local normalizations.** If `μ′_i = c_i μ_i` with `0 < c_i < ∞`, `c_i = 1` outside a finite
set, then `∏ʳ μ′_i = (∏ᶠ c_i) ∏ʳ μ_i` ([Rosengarten], §1, p. 2); infinitely many nontrivial `c_i`
need the convergent construction below.

**Changing the restricting subgroups at finitely many places.** If `B′_i = B_i` for all but finitely
many `i`, the identity of `Π_i G_i` restricts to a topological group isomorphism
`Πʳ [G_i, B_i] ≃ₜ* Πʳ [G_i, B′_i]` carrying `∏ʳ μ_i` to `∏ʳ μ_i` ([Conrad], Theorem 3.6, p. 6).
*Needs:* Tau Ceti `TauCeti.restrictedProductCongr`.

**Fubini for restricted product measures.** Under `TauCeti.awayDecomposition` for finite `S`,
`∏ʳ_ι μ_i` corresponds to `(Measure.pi (μ_i)_{i∈S}) × ∏ʳ_{ι∖S} μ_i`, and for integrable `f`,
`∫ f d∏ʳ μ = ∫_{Π_{i∈S} G_i} ∫_{Πʳ_{ι∖S}} f(x_S, x^S)` ([Borel], §5.5, p. 21).

**Integral of a factorizable function.** For integrable `f_i : G_i → ℂ`, with `f_i = 1_{B_i}` for
all but finitely many `i`, `f(x) = ∏_i f_i(x_i)` is integrable and `∫ f d∏ʳ μ_i = ∏ᶠ_i ∫ f_i dμ_i`
([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63, pp. 188–189).
*Checks:* With no factors the integral is `1`; on `C₂` with counting measure the constant `2` has
integral `4`; on two copies of `C₂` the constants `2` and `3` give `24`; probability normalization
would give `2` and `6`.

**Restricted products of unimodular groups are unimodular.** The modular character of
`Πʳ [G_i, B_i]` is `x ↦ ∏ᶠ_i Δ_{G_i}(x_i)` (finite since almost all `x_i ∈ B_i` compact), so the
restricted product of unimodular groups is unimodular ([Borel], §5.5, p. 21).

**Functoriality of restricted product measures.** For topological group isomorphisms
`φ_i : G_i ≃ G′_i` with `φ_i(B_i) = B′_i` for almost all `i`, the induced isomorphism `Φ` of
restricted products satisfies `Φ_*(∏ʳ μ_i) = ∏ʳ (φ_i)_* μ_i` ([Rosengarten], Lemma 3.5, p. 26).

**Convergent restricted products of local Haar measures.** For finite `S` with `B_i` compact for
`i ∉ S`, `a_i = μ_i(B_i)` and `∑_{i∉S} |a_i − 1| < ∞`, put `C_S = ∏_{i∉S} a_i > 0`. The convergent
Haar product is `C_S` times the restricted product of `μ_i` (`i ∈ S`) and `a_i⁻¹ μ_i` (`i ∉ S`). It
does not depend on `S`, is a nonzero Haar measure, and gives a box with `C_i = B_i` off finite
`T ⊇ S` the mass `∏_{i∈T} μ_i(C_i) · ∏_{i∉T} a_i` ([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63,
pp. 188–189; Mathlib `Real.multipliable_one_add_of_summable`).
*Checks:* All `a_i = 1` gives the restricted product; for `SL₂`, `a_v = 1 − q_v⁻²` gives integral box
mass `∏ a_v < 1`; a tail factor of mass `2` becomes `μ/2` while the product keeps the factor `2`.

**Independence under finite changes of integral subgroups.** Changing the compact open `B_i` at
finitely many indices transports the convergent Haar product to the same measure on the
canonically identified restricted product ([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63,
pp. 188–189).
*Checks:* On copies of `C₄` with counting measure, changing `C₄` to `{1}` at one or two indices
preserves the masses `4` and `16`; normalizing the changed subgroups would not.

### AA.0.4 Adeles and ideles

**Normalized Haar measure on the finite adeles.** `μ_f` on `𝔸_{K,f}` is the Haar measure with
`μ_f(∏_v 𝒪_v) = 1`; it is the restricted product of the normalized `μ_v`, so a measurable box with
cofinitely integral factors has mass `∏ᶠ_v μ_v(C_v)`; for a finite idele `a`,
`map (a · ·) μ_f = (∏_v |a_v|_v)⁻¹ μ_f` ([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63, pp. 188–189).
*Checks:* The closure of a nonzero ideal `𝔞` has mass `N(𝔞)⁻¹`; `μ_f` is not finite; over `ℚ` the
box with factor `2ℤ₂` and integral factors elsewhere has mass `1/2`.
*Lean:* in `Adeles`: `finiteIntegers`, `finiteAdeleHaar`, `finiteAdeleHaar_box`,
`finiteAdeleHaar_closure_ideal`.

**Normalized Haar measure on the adeles.** `μ_𝔸 = μ_∞ × μ_f` on `𝔸_K = K_∞ × 𝔸_{K,f}`, with `μ_∞`
Lebesgue at real places and `2 dx dy` at complex places, transported from the mixed space
(`2^{r₂}` times its volume). It is an additive Haar measure, and `D_∞ × ∏_v 𝒪_v`, `D_∞` the
parallelotope of an integral basis, is a fundamental domain for `K` of mass `|d_K|^{1/2}`, so
`vol(𝔸_K/K) = |d_K|^{1/2}` ([Sutherland], §23.3, p. 6).
*Checks:* For `K = ℚ`, `[0,1) × ∏_p ℤ_p` has mass `1`. At the complex place of an imaginary
quadratic field the unit square has mass `2`; `dx dy` would give `1`, and omitting the factor `2`
gives covolume `2^{−r₂}|d_K|^{1/2}`. The self-dual measure gives covolume `1` instead.
*Lean:* in `Adeles`: `infiniteAdeleHaar`, `adeleHaar`, `adeleHaar_isAddHaarMeasure`,
`adeleFundamentalSet`, `isAddFundamentalDomain_adeleFundamentalSet`.

**Normalized Haar measure on the ideles.** `d^×x` on `𝔸_K^×` is the restricted product, through
`RestrictedProduct.unitsEquiv`, of the measures with `vol(𝒪_v^×) = 1` at finite places, times
`dx/|x|` at real and `2 dx dy/(x² + y²)` at complex places: on the units of `K_∞` it is `μ_∞` with
density `∏_w |x_w|_w⁻¹`, the normalized absolute value squared at complex places. It is a Haar
measure, invariant under `K^×`, and `∏_v 𝒪_v^× × C` has the archimedean mass of `C`
([Sutherland], §23.3, p. 6; [Rosengarten], §1, p. 2).
*Checks:* Over `ℚ`, `∏_p ℤ_p^× × [1, e]` has mass `1` and `(1 + 4ℤ₂) × ∏_{p odd} ℤ_p^× × [1, e]` mass
`1/2` (`1/4` without the factor at `2`); a complex annulus `1 ≤ |z| ≤ e` has mass `4π` (not `2π`).

**Products of form measures need convergence factors.** For `K = ℚ` and `ω = dx/x`,
`|ω|_p(ℤ_p^×) = 1 − p⁻¹` and `∏_p (1 − p⁻¹) = 0`, so the `|ω|_p` violate the normalization of the restricted
product and no global constant repairs it; `G_m` needs `λ_p = (1 − p⁻¹)⁻¹`, and over `K` the pole
of `ζ_K` at `1` ([Rosengarten], §1, p. 2; [Borel], §5.5, p. 21).
*Lean:* `tendsto_prod_one_sub_inv_prime`.

### Examples

With all local integral masses `1` the integral box has mass `1`; masses `2` and `2, 3` at
exceptional places give `2` and `6`. `[0,1) × ∏_p ℤ_p` has `μ_𝔸`-mass `1`, `∏_p ℤ_p^× × [1, e]` has
`d^×x`-mass `1`, `vol(𝔸_K/K) = |d_K|^{1/2}`, and `∏_p (1 − p⁻¹) = 0`.

### Dependencies

Mathlib restricted products, product and Haar measures and adeles; Tau Ceti local fields at
finite places, `TauCeti.awayDecomposition`, `TauCeti.restrictedProductCongr`; GlobalNumberFields
layers 4 and 6.

## Layer AA.1: adelic points of algebraic groups

Hopf-algebra points get the point topology, and the points over the adeles are compared with a
restricted product of local groups through an integral model. Every comparison keeps coefficient
naturality, the topology and the actual rational diagonal.

### AA.1.1 Affine points and integral models

**Adelic points of an affine algebraic group.** For `H` finitely generated over a number field `F`,
`G(𝔸_F) = WithConv (H →ₐ[F] 𝔸_F)` with the point topology is a topological group, and likewise
`G(𝔸_{F,f})`, `G(F_∞)`, `G(F_v)`; the diagonal and the projections are coefficient maps along
`F → 𝔸_F` and the projections of `𝔸_F`, evaluations are continuous, and `x ↦ (1, x)` embeds
`G(𝔸_{F,f})` in `G(𝔸_F)` as a group (not a ring map with archimedean coordinate `0`) ([Conrad],
Prop. 2.1, p. 2; [Arthur], §2, p. 11).
*Checks:* `finiteEmbed x` has archimedean component `1`; `G_a(𝔸_F) = 𝔸_F`; for `G_m` evaluation at
`T` is injective but no embedding into `𝔸_F` (inversion is discontinuous for the subspace topology);
the trivial group has one point.
*Lean:* `AdelicPoints` and, in its namespace, `FiniteAdelicPoints`, `InfinitePoints`, `LocalPoints`,
the topology and group instances, `diagonal`, `finiteDiagonal`, `infiniteDiagonal`,
`finiteProjection`, `infiniteProjection`, `finiteEmbed`.

**Integral models over S-integers.** An integral model of `H` away from finite `S` is a finitely
presented commutative Hopf `𝒪_{F,S}`-algebra `𝓗` with a Hopf isomorphism `F ⊗ 𝓗 ≅ H`; for `v ∉ S`,
`𝓗(𝒪_v) ⊂ G(F_v)` (injectively) is the set of points integral on the image of `𝓗`. Enlarging `S`
base-changes `𝓗` by a Hopf isomorphism compatible with the generic fibres, with the same local
points; equal local points alone do not pin the enlargement ([Conrad], Rem. 3.5 and §3, p. 6).
*Checks:* The standard `GL_n` model gives `GL_n(𝒪_v)`, not all integral matrices of nonzero
determinant. The `G_a` model `X ↦ cT` gives `c⁻¹𝒪_v`, which is `p⁻¹𝒪_v ⊋ 𝒪_v` for `c = p`, `v | p`.
The product of `𝓗` with `𝒪_{F,S′}[ε]/(ε^p, pε)` (`ε` primitive, `p ∉ S′`) is a Hopf algebra (middle
binomial coefficients of `Δ(ε^p)` die modulo `pε`) with the same generic fibre and local points but a
non-reduced fibre at `p`; `𝔽₃[ε]/ε²` carries no such structure, as `Δ(ε²) = 2ε ⊗ ε ≠ 0`.
*Lean:* `SIntegers`, `IntegralModel`, `IntegralModel.localPoints`, `IntegralModel.level`.

**Spreading Hopf structure and its identities.** A finitely presented `F`-algebra with Hopf
structure descends to a finitely presented Hopf algebra over `𝒪_{F,S}` after enlarging `S`, and a
prescribed finite set of Hopf morphisms and identities among them descends simultaneously, with
Hopf generic-fibre identifications ([Conrad], Thm 3.4(1)–(2), pp. 5–6; Rem. 3.5, p. 6).

**Spreading out.** Every finitely generated commutative Hopf `F`-algebra has an integral model away
from some finite `S` ([Conrad], Thm 3.4(1), p. 5).
*Lean:* `IntegralModel.exists_of_finiteType`.

**Reductive models outside finitely many places.** An integral model is reductive if it is smooth
over `𝒪_{F,S}` and every field-valued fibre is connected reductive
(`TauCeti.reductiveCommHopfAlgProperty`). Reductivity passes to the generic fibre and to every
enlargement, the standard model of `GL_n` is reductive in every rank, and a finite-type connected
reductive `F`-group has a reductive model for some `S` ([Conrad RGS], Def. 3.1.1, p. 81;
Cor. 3.1.11, pp. 88–89).
*Checks:* `GL_0` and `GL_1 = G_m` models are reductive; no model of `G_a` is, its generic fibre
being a nontrivial unipotent group; the non-reduced product above keeps the local points and fails
reductivity.

**Uniqueness of integral models up to enlarging S.** Two models of `H` become isomorphic over some
`𝒪_{F,S″}`, compatibly with the identifications with `H`; hence `𝓗(𝒪_v) = 𝓗′(𝒪_v)` for all but
finitely many `v`; a Hopf map `H′ → H` spreads to a map of enlarged models ([Conrad], Thm 3.4(3),
p. 5).

### AA.1.2 Restricted-product realization

**Points over a product of rings.** `G(R₁ × R₂) ≃ G(R₁) × G(R₂)` naturally and as topological groups,
and likewise for finite products ([Conrad], Prop. 2.1, proof, p. 2). *Needs:* Mathlib `AlgHom.prod`.

**Finite adeles as a directed union of S-adeles.** The `S`-adeles `∏_{v∈S} F_v × ∏_{v∉S} 𝒪_v` are
open subrings of `𝔸_{F,f}` forming a directed union, and for finitely generated `H` with model `𝓗`,
`G(𝔸_{F,f}) = ⋃_S 𝓗(𝔸_{F,S})` ([Conrad], Rem. 3.5, p. 6).

**The restricted-product bijection on S-adelic points.** For a finitely presented model `𝓗` over
`𝒪_{F,S}` and finite `S′ ⊇ S`, evaluation is a group bijection from the `S′`-adelic points of `𝓗` onto
`∏_{v∈S′} G(F_v) × ∏_{v∉S′} 𝓗(𝒪_v)` ([Conrad], Thm 3.6, p. 6).

**Topology of the restricted-product comparison.** The bijection `G(𝔸_{F,f}) → Πʳ_v [G(F_v), B_v]` is
a homeomorphism: on each `S`-integral principal piece it is the product homeomorphism of affine
points, and the principal pieces are open on both sides ([Conrad], Thm 3.6, pp. 7–8; §4, p. 9).

**Adelic points as a restricted product.** For finitely generated `H` with a model away from `S`,
`x ↦ (x_v)_v` is an isomorphism of topological groups
`G(𝔸_{F,f}) ≃ Πʳ_v [G(F_v), B_v]`, `B_v = 𝓗(𝒪_v)` for `v ∉ S`, `B_v = G(F_v)` for `v ∈ S`, and
`G(𝔸_F) ≃ G(F_∞) × G(𝔸_{F,f})` ([Conrad], Thm 3.6, p. 6; [Borel], §1.2, p. 7).
*Lean:* `IntegralModel.exists_restrictedProductEquiv`.

**Independence of the model and of the exceptional set.** Under the comparison, two models give
restricted products identified by `TauCeti.restrictedProductCongr`, and enlarging `S` changes
nothing ([Conrad], Thm 3.6, p. 6).

**Adelic groups are locally compact.** For finitely generated `H`, `G(𝔸_F)`, `G(𝔸_{F,f})` and
`G(F_∞)` are Hausdorff, locally compact and second countable ([Borel], §1.2, p. 7).
*Needs:* RG2 `PointTopology.locallyCompactSpace_of_finiteType`.
*Lean:* in `AdelicPoints`: `instT2Space`, `instLocallyCompactSpace`,
`instSecondCountableTopology`, `instLocallyCompactSpaceFinite`.

**Splitting off finitely many places.** For finite `S`, `G(𝔸_F) ≃ G(F_S) × G(𝔸_F^S)` as topological
groups, carrying the diagonal to the pair of diagonals; in particular
`G(𝔸_F) ≃ G(F_∞) × G(𝔸_{F,f})` ([Borel], §1.2, p. 7). *Needs:* Tau Ceti `TauCeti.awayDecomposition`.

### AA.1.3 Rational points and functoriality

**Rational points are discrete in the full adeles.** For finitely generated `H` the diagonal
`G(F) → G(𝔸_F)` is injective with discrete closed image ([Conrad], Ex. 2.3, p. 3; [Borel], §1.2,
p. 7). *Needs:* Tau Ceti `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`.
*Checks:* For `H = F[x₁, x₂, …]` (not of finite type) the rational points are not discrete.
*Lean:* `AdelicPoints.discreteTopology_range_diagonal`, `AdelicPoints.isClosed_range_diagonal`.

**Discreteness in the finite adeles alone.** `G(F)` is discrete in `G(𝔸_{F,f})` iff `G(F) ∩ U` is
finite for one, equivalently every, compact open `U` ([Borel], §1.8, p. 9).
*Checks:* `F` is not discrete in `𝔸_{F,f}`; `SL₂(ℚ)` is not discrete in `SL₂(𝔸_{ℚ,f})` since
`SL₂(ℤ)` is infinite; `ℚ^×` is discrete in `𝔸_{ℚ,f}^×` since `ℚ^× ∩ ∏_p ℤ_p^× = {±1}`.

**Functoriality of adelic points.** A Hopf map `φ* : H′ → H` induces a continuous homomorphism
`G(𝔸_F) → G′(𝔸_F)`, `x ↦ x ∘ φ*`, functorial (contravariant on Hopf algebras), compatible with the
diagonals and the local projections, and equal under the comparison to the restricted product of
the local maps, which send `𝓗(𝒪_v)` into `𝓗′(𝒪_v)` for almost all `v` ([Borel], §1.3, p. 7).
*Checks:* For `GL_1` the determinant map is the identity of the ideles. The squaring map of
`G_m/ℚ` has closed image `(𝔸^×)²` of infinite index, and that image is not open (basic
neighbourhoods allow nonsquare units at almost all odd primes).

**The centre on adelic points.** For the centre `Z` (`TauCeti.CommHopfAlgCat.centerDefiningIdeal`),
`Z(𝔸_F)` is closed in `G(𝔸_F)`, central, and `Z(F) = Z(𝔸_F) ∩ G(F)` ([Borel], §1.6, p. 8).

### AA.1.4 Restriction of scalars and concrete groups

**Restriction of scalars on adelic points.** For `E/F` finite and `G_E` affine over `E`, with
`Res = Res_{E/F} G_E` (RG2.0a, through its point adjunction `Res(R) = G_E(E ⊗_F R)`) and the
canonical isomorphism `E ⊗_F 𝔸_F ≅ 𝔸_E` (GlobalNumberFields `adeleBaseChangeEquiv`), there is an
isomorphism of topological groups `Res(𝔸_F) ≃ G_E(𝔸_E)` carrying the diagonal of `Res(F) = G_E(E)`
to that of `G_E(E)`, natural in `G_E`, and transitive in towers `F ⊂ E ⊂ L` through the Hopf
isomorphism `Res_{E/F} Res_{L/E} ≃ Res_{L/F}` that agrees on points with `L ⊗_E (E ⊗_F R) ≅ L ⊗_F R`
([Conrad], Ex. 4.2, p. 10; [Arthur], §2, p. 11).
*Checks:* `G_m` gives `(E ⊗ 𝔸_F)^× ≃ 𝔸_E^×`; `Res_{ℚ(i)/ℚ} G_m(ℚ) = ℚ(i)^×`; `E = F` gives the unit
equivalence; a tower isomorphism twisted by inversion sends `2` to `1/2`.
*Needs:* RG2 `WeilRestriction.functor`, `WeilRestriction.functor_isCorepresentable`.

**Local factors of restriction of scalars.** The projection of `Res(𝔸_F)` to `F_v` corresponds to
`Res(F_v) ≃ ∏_{w|v} G_E(E_w)`, and for almost all `v` integral points of a model of `Res` correspond
to `∏_{w|v} 𝓗_E(𝒪_w)` ([Borel], §1.4, p. 8).

**Naturality of adelic restriction of scalars.** The comparison commutes with every morphism
`G_E → G′_E`, the diagonal `F → 𝔸_F`, the projections to `F_v` and the tensor associator for towers
`E/F/k` ([Conrad], Ex. 2.4 and 4.2, pp. 3 and 9–10).

**The additive group.** For `G_a`, `G(𝔸_F) ≃ 𝔸_F` as topological groups, the diagonal is
`algebraMap F 𝔸_F`, and the comparison recovers `𝔸_{F,f}` as a restricted product ([Arthur], §2,
p. 11).

**The multiplicative group and the ideles.** For `G_m`, `TauCeti.MultiplicativeGroup.pointsMulEquiv`
is a homeomorphism `G(𝔸_F) ≃ 𝔸_F^×` for the units topology, and the finite part is
`Πʳ_v [F_v^×, 𝒪_v^×]` through `RestrictedProduct.unitsEquiv` ([Borel], §1.3, p. 7).
*Lean:* `AdelicPoints.isHomeomorph_gm`.

**The general linear group.** For `n ≥ 1`, `TauCeti.GeneralLinear.pointsMulEquiv` is a homeomorphism
`GL_n(𝔸_F) ≃ (M_n(𝔸_F))^×` for the units topology (RG2 `PointTopology.generalLinearPointsHomeomorph`
at `R = 𝔸_F`), and the finite part is `Πʳ_v [GL_n(F_v), GL_n(𝒪_v)]`, both given by the matrix of
coordinates ([Arthur], §2, p. 11).
*Checks:* `g ↦ (gᵀ)⁻¹` is also a topological isomorphism onto `GL_n(𝔸_{F,f})`; at `n = 1` it is
inversion and differs from the comparison on every finite idele of order greater than two.

### AA.1.5 Unimodularity and compact open levels

**The modular character on compact and central elements.** For a locally compact group the modular
character is trivial on every compact subgroup and on the centre ([Borel], §5.5, p. 20).
*Needs:* Mathlib `MeasureTheory.Measure.modularCharacter`.

**Weyl orbit products lie in the split centre up to finite index.** For a maximal split torus `A`
of a connected reductive group over a field and its relative Weyl group `W`, `∏_{w∈W} w(a)` lies in
`(Z(G) ∩ A)(E)` up to an element of a finite group, so a power of it is in the split centre
([Borel], §5.5, p. 20).

**Local unimodularity of reductive groups.** `G(E)` is unimodular for connected reductive `G` over a
local field `E` of characteristic `0` ([Borel], §5.5, p. 20). *Needs:* RG2
`Decomposition.modularCharacter_eq_one` (nonarchimedean), RepresentationTheory/LieGroups layer 9
(archimedean).

**Adelic groups of reductive groups are unimodular.** For connected reductive `G` over `F`,
`G(𝔸_F)`, `G(𝔸_{F,f})` and `G(F_∞)` are unimodular ([Borel], §5.5, p. 20).
*Lean:* `AdelicPoints.finiteTypeObj`, `AdelicPoints.modularCharacter_eq_one`.

**Compact open subgroups and product levels.** Every compact open `U ⊂ G(𝔸_{F,f})` contains and is
contained in product subgroups `∏_v U_v` with `U_v` compact open and `U_v = 𝓗(𝒪_v)` for almost all
`v`; any two compact open subgroups are commensurable, with
`μ(U)/μ(U′) = [U : U ∩ U′]/[U′ : U ∩ U′]` ([Borel], §1.7, pp. 8–9). *Needs:* RG2
`PointTopology.compactSpace_integralPoints`; Mathlib `MeasureTheory.Subgroup.index_mul_measure`.

**Conjugation changes a level at finitely many places.** For `g ∈ G(𝔸_{F,f})`, `g_v ∈ 𝓗(𝒪_v)` for
almost all `v`; so `gUg⁻¹ = ∏_v g_vU_vg_v⁻¹` agrees with `U = ∏_v U_v` at almost all `v`, and
`g = g_B u` with `g_B` supported on a finite set and `u ∈ ∏_v 𝓗(𝒪_v)` ([Borel], §1.2, p. 7).

### Examples

`G_a(𝔸_F) = 𝔸_F` and `G_m(𝔸_F) = 𝔸_F^×`; the `GL_n` finite part is `Πʳ_v [GL_n(F_v), GL_n(𝒪_v)]`;
the model `X ↦ pT` of `G_a` has local points `p⁻¹𝒪_v` at `v | p`; `ℚ^×` is discrete in `𝔸_{ℚ,f}^×`
while `SL₂(ℚ)` is not discrete in `SL₂(𝔸_{ℚ,f})`; `Res_{ℚ(i)/ℚ} G_m(ℚ) = ℚ(i)^×`.

### Dependencies

AA.0; Tau Ceti Hopf points, `TauCeti.AlgHom.mapValue` and the concrete-group comparisons;
ReductiveGroupsPartII RG2.0, RG2.0a and RG2.4; GlobalNumberFields layers 4, 5, 6 and 8;
ReductiveGroups layer 7; RepresentationTheory/LieGroups layer 9.

## Layer AA.2: characters, quotient measures and Tamagawa measures

The character lattice separates the positive split centre from the norm-one subgroup; right-Haar
quotient integration is developed before it is applied to rational quotients; gauge forms and
convergence factors then fix a normalization compatible with the product formula and restriction of
scalars.

### AA.2.1 Characters, logarithms and the split centre

**F-rational characters.** `X*_F(G) = GroupLike F H` under multiplication, `χ` acting on points by
`χ(x) = x(χ) ∈ R^×`, multiplicatively for convolution; it is the group of bialgebra maps
`F[T, T⁻¹] → H` (`T ↦ χ`), and `χ ↦ 1 ⊗ χ` embeds it in the geometric character group of `F̄ ⊗ H`,
with image the `Field.absoluteGaloisGroup F`-invariants in characteristic zero ([Arthur], §3, p. 16;
[Borel], §1.3, p. 7). The value equations pin both maps (inversion preserves every other clause).
*Checks:* `X*_F(GL_n) ≃ ℤ` (`n ≥ 1`) with `TauCeti.GeneralLinear.determinantGroupLike ↦ 1`;
`X*_F(SL_n) = 1`, also for `n = 0, 1`; for `G_m`, `T` gives the identity of `F[T, T⁻¹]` and base
change `1 ⊗ T`, not `1 ⊗ T⁻¹`; `Res_{ℚ(i)/ℚ} G_m` has rational rank `1`, geometric rank `2`.
*Lean:* `RationalCharacter`, `RationalCharacter.apply`.

**Rational characters form a lattice.** For `G` of finite type, geometrically reduced and
geometrically connected (automatic reducedness in characteristic zero), `X*_F(G)` is free abelian of
finite rank; for connected reductive `G`, restriction to the identity component of the centre is
injective with finite cokernel ([Borel], Lemma 5.9, p. 22; [Arthur], §5, p. 24).
*Lean:* `RationalCharacter.free`.

**The real vector space a_G.** `a_G = Hom(X*_F(G), ℝ)`, finite-dimensional of dimension the rank of
`X*_F(G)`, with dual `X*_F(G) ⊗ ℝ` and complexification `X*_F(G) ⊗ ℂ`; a Hopf map `φ : H′ → H` induces
`a(φ) : a_G → a_{G′}`, `a(φ)(a)(χ′) = a(φ(χ′))` (pulled-back characters are group-like by Mathlib
`IsGroupLikeElem.map`), functorially ([Arthur], §3, p. 16). Functoriality alone does not pin
`a(φ)`: conjugating by rescalings of the spaces preserves it.
*Checks:* `dim a_{GL_n} = 1`, `dim a_{Res_{ℚ(i)/ℚ} G_m} = 1`, `a_{SL_n} = 0`; squaring on `G_m` induces
`2·`; for the diagonal `G_m → G_m²`, `a(φ)(a)` is `a(T)` on the first coordinate (rescaling gives `a(T)/2`).
*Lean:* `RealCharacterSpace`.

**The Harish-Chandra map H_G.** `H_G : G(𝔸_F) → a_G`, `⟨H_G(x), χ⟩ = log ‖χ(x)‖` with the idele norm
`TauCeti.GlobalNumberFields.ideleNorm`, is a homomorphism, continuous for `H` of finite type,
natural (`H_{G′} ∘ φ = a(φ) ∘ H_G`), and vanishes on compact subgroups ([Arthur], §3, p. 16).
*Checks:* For `G_m` it is `log ‖·‖`; over `ℚ` the ideles `1` and `p` at `p` agree at `∞` but have
norms `1`, `p⁻¹`; `H_{SL_n} = 0`; for `ℚ[ℤ^{(ℕ)}]` (not finite type) `H_G` is discontinuous (points
tending to `1` have logarithms `e_n`, and a continuous functional is `1` on every `e_n`).
*Lean:* `AdelicPoints.logHeight`.

**H_G vanishes on rational points.** `H_G(g) = 0` for `g ∈ G(F)`, by the product formula
([Arthur], §3, p. 16). *Needs:* Tau Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`.
*Lean:* `AdelicPoints.logHeight_diagonal`.

**The norm-one subgroup G(𝔸)^1.** `G(𝔸_F)^1 = ker H_G = ⋂_χ ker ‖χ‖` is a closed normal subgroup
containing `G(F)`, every compact subgroup and the commutator subgroup; `x ∈ G(𝔸)^1` iff `‖χ(x)‖ = 1`
for every `χ`, and `G(𝔸)^1 = G(𝔸)` when `X*_F(G) = 0` ([Arthur], §3, p. 16; [Borel], §5.8, p. 22).
*Checks:* For `G_m` it is the group of norm-one ideles, with image `TauCeti.GlobalNumberFields.IdeleClassGroup.normOne`
in the idele class group; `SL₂(𝔸)^1 = SL₂(𝔸)`; over `ℚ` the idele `p` at `∞` and at `p` has norm `1`
but archimedean absolute value `p`, so `G(𝔸)^1 ≠ G(F_∞)^1 × G(𝔸_f)`.
*Lean:* `AdelicPoints.normOne`.

**The split component A_G.** For connected reductive `G`, `A_G(ℝ)^0 ⊂ G(F_∞)` (the positive real
points of the largest `ℚ`-split central torus of `Res_{F/ℚ} G`, `≅ (ℝ_{>0})^k`, `k = rank X*_F(G)`) is
central, meets `G(𝔸)^1` trivially, and `H_G` maps it isomorphically onto `a_G` ([Arthur], §3,
pp. 15–16; [Borel], §1.5, p. 8). These clauses do not pin it (for `G_m × T¹`, `T¹` the norm-one torus
of a real quadratic field, a graph of `ℝ_{>0} → T¹(ℝ)^0` satisfies them); the defining clause: for the
maximal central `F`-split torus `S`, it is the archimedean points of `S` at which every character of
`S` has one positive real value at all archimedean places.
*Checks:* For `GL_n/ℚ` it is the positive scalars at `∞`; for `G_m/F` it is a line inside the
`(r₁ + r₂)`-dimensional `(F ⊗ ℝ)^×_{>0}`, and the norm-one idele `(2, 1/2)` at the two infinite places
of a real quadratic field lies outside it; it is trivial when `X*_F(G) = 0`.

**H_G on the split centre.** For connected reductive `G`, `H_G|_{A_G(ℝ)^0}` is a topological
isomorphism onto `a_G`; in particular `H_G` is surjective ([Arthur], (5.1), p. 24).
*Lean:* `AdelicPoints.logHeight_surjective`.

**The decomposition G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0.** For connected reductive `G`, multiplication
`G(𝔸_F)^1 × A_G(ℝ)^0 → G(𝔸_F)` is an isomorphism of topological groups ([Arthur], §3, p. 16).

**Two normalizations of the quotient.** For connected reductive `G`, the inclusion induces a
homeomorphism `G(F)\G(𝔸)^1 ≃ G(F)\G(𝔸)/A_G(ℝ)^0`, equivariant for `G(𝔸)^1`; it fails if `A_G(ℝ)^0` is
replaced by a larger central subgroup such as `Z(F_∞)^0` ([Arthur], §6, p. 30).
*Checks:* The identity class goes to the identity class; `x` and `xa`, `a ∈ A_G(ℝ)^0`, have the same
image; over a real quadratic field the class of the `(2, 1/2)` idele is nontrivial in the norm-one
quotient but trivial modulo the whole archimedean centre.

### AA.2.2 Parabolic modulus and homogeneous integration

**Modulus character of a parabolic.** For a finite-type `F`-group `P` with finite-dimensional
identity cotangent space, its modulus is the idele norm of the determinant of
`Derivation.adjointAction` on `𝔸_F ⊗ Lie P`; for a parabolic `P = M_P N_P` of a connected reductive
group it is `δ_P(p) = ‖det(Ad(p) | Lie N_P)‖`. It is `1` on `P(F)` (product formula) and identically
`1` for connected reductive `P` ([Arthur], §5, p. 25).
*Checks:* The trivial group and `G_m` have modulus `1` (not the tautological character); on the
upper Borel quotient of `GL₂`, real `diag(2, 1)` and `diag(1, 2)` (identity finite components) have
moduli `2` and `1/2` while both determinants have norm `2`.

**Modular function of P(𝔸).** Mathlib's modular character of `P(𝔸_F)` is the modulus, so
`dμ_l = δ_P⁻¹ dμ_r`; `δ_P` is nontrivial for proper `P` and `1` for `P = G` ([Arthur], §5, p. 25). At
finite places use RG2 `LocalIntegration.modularCharacter_eq_adjointModulus` (a point supported at
one place has the local adjoint modulus), then finite-support products, continuity and the integral
compact opens, and real and complex change of variables at infinity. No square root enters.
*Checks:* `diag(3, 1)` at a place of residue cardinality `3` has modulus `1/3` in the upper Borel and
`3` in the lower; for `GL₂/ℚ` the real `diag(2, 1)` has modular character `2`, not `1/2`.

**Topology of a closed homogeneous quotient.** For `G` second countable locally compact Hausdorff
and `H ≤ G` closed, `H\G` is locally compact, Hausdorff and second countable, the projection is open,
and compact subsets of `H\G` lift to compact subsets of `G` ([Arthur], §1, pp. 7–9; [BHV],
Lemma B.1.1, pp. 343–344).

**Continuity and support of fibre averaging.** For a right Haar measure `dh` on `H` and
`f ∈ C_c(G, ℝ)`, `Pf(Hg) = ∫_H f(hg) dh` is continuous, compactly supported in `q(supp f)`, and
positive for positive `f` ([Arthur], §1, pp. 7–9; [BHV], Lemma B.1.2, p. 344).

**A cutoff over a compact part of the quotient.** For compact `C ⊂ H\G` there is `β ∈ C_c(G)`,
`β ≥ 0`, with `Pβ = 1` on `C` ([BHV], Lemma B.1.2 and its proof, p. 344).

**Averaging over a closed subgroup is surjective on compact supports.** `P : C_c(G) → C_c(H\G)` is
surjective and every `f ≥ 0` is `Pφ` with `φ ≥ 0` ([Arthur], §1, p. 7; [BHV], Lemma B.1.2, p. 344).

**The right-Haar exchange identity.** For right Haar `dg`, `dh` with `Δ_G|_H = Δ_H` and
`f, β ∈ C_c(G)`, `∫_G β(g) Pf(Hg) dg = ∫_G f(g) Pβ(Hg) dg` ([Arthur], §1, pp. 7–9; [BHV],
Lemma B.1.3, pp. 344–346).

**Weil's functional is well defined under the modular condition.** Under `Δ_G|_H = Δ_H`, `Pf = 0`
implies `∫_G f = 0`, so `Pf ↦ ∫_G f dg` is a well-defined positive `G`-invariant functional on
`C_c(H\G)` ([Arthur], §1, p. 9; [BHV], Lemma B.1.3, pp. 344–346).

**Invariant measure on a coset space.** For `G` second countable locally compact Hausdorff, `H`
closed with `Δ_G|_H = Δ_H` and right Haar `dg`, `dh`, there is a measure `dġ` on the right coset
space `H\G` (Borel σ-algebra) with `∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ` for `f ∈ C_c(G)`, invariant
under the right action of `G`, unique among invariant Radon measures up to scalars, and
`c · dh` gives `c⁻¹ · dġ` ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.64, pp. 189–190, after
inversion from the left action on `G/H`). *Needs:* Mathlib `RealRMK.integral_rieszMeasure`,
`MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
*Checks:* `H = ⊥` recovers `dg`; for the Borel `B ⊂ SL₂(ℝ)`, `Δ_G|_B ≠ Δ_B` and `ℙ¹(ℝ)` has no
invariant Radon measure; the Borel σ-algebra is needed (on two points the identity from the trivial
to the full σ-algebra is not measurable).

**Tonelli extension of quotient integration.** For Borel `f : G → [0, ∞]`, fibre integration is
measurable on `H\G` and `∫_G f = ∫_{H\G} ∫_H f(hg) dh` in `[0, ∞]` ([Arthur], §1, pp. 7–9).

**Weil's formula for integrable functions.** For `f ∈ L¹(G)`, `h ↦ f(hg)` is integrable for almost
every `Hg`, the fibre integral is integrable on `H\G`, and Weil's formula holds ([Arthur], §1, p. 9).

**Quotient measures in stages.** For closed `H₁ ≤ H₂ ≤ G` with compatible modular characters,
`∫_{H₁\G} f = ∫_{H₂\G} ∫_{H₁\H₂} f(hg)` ([Arthur], §1, p. 9).
*Checks:* In `{1} ≤ C₂ ≤ C₄` with counting measures the masses are `2`, `2` and `4`; doubling the
middle measure gives `1` and `4` with product `4`; tripling the bottom measure as well gives `1` and
`4/3`: scaling the middle measure cancels, scaling the bottom does not.

**Inversion between left and right quotient conventions.** `Hg ↦ g⁻¹H` is a homeomorphism
`H\G ≃ G/H`; for `G` unimodular, `Γ` countable discrete and a bi-invariant Haar measure it preserves
the normalized quotient measures and carries left-orbit unfolding to Mathlib's
`QuotientGroup.integral_eq_integral_automorphize` ([Arthur], §1, p. 7).

### AA.2.3 Rational quotients

**Borel fundamental domains for countable discrete subgroups.** A countable discrete subgroup of a
second countable locally compact Hausdorff group acting by translation has a Borel fundamental
domain, by `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul` (the
action is free).

**Fundamental domains for rational points.** For finitely generated `H` with `G(𝔸_F)` (or
`G(𝔸_F)^1`) unimodular, for instance connected reductive `G`, `G(F)` acting by left translation has a
Borel fundamental domain, and the quotient measure on `G(F)\G(𝔸_F)` is the pushforward of Haar
measure restricted to any measurable fundamental domain, independently of the choice. *Needs:*
Mathlib `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`.

**The measure on the automorphic quotient.** For connected reductive `G` and Haar `dx` on `G(𝔸_F)`,
the measure on `[G]^1 = G(F)\G(𝔸)^1` is induced through `G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0` and the Haar
measure `λ` on `a_G` giving the fundamental domains of `Hom(X*_F(G), ℤ)` mass `1`: for measurable
`A ⊆ G(𝔸)^1` injective modulo `G(F)` and `E ⊆ a_G`, `dx(A · (H_G|_{A_G(ℝ)^0})⁻¹(E)) = vol([A]) λ(E)`; it
is right `G(𝔸)^1`-invariant, linear in `dx`, and transported by the two-normalizations homeomorphism
([Borel], Thm 5.8, p. 22).
*Checks:* For `GL₁/ℚ` the norm-one quotient has mass `1` and `ℚ^×\𝔸^×` infinite mass; doubling `λ`
gives fundamental domain mass `2`; over a quadratic field `H_G(t) = 2 log t`, so `λ` is `2 dt/t`.

### AA.2.4 Gauge forms and Tamagawa normalization

**Invariant top-degree forms.** For `G` smooth of dimension `d` over a field `k`, the line
`ω_G = ∧^d (𝔪_ε/𝔪_ε²)` of left-invariant top forms (top exterior power of
`TauCeti.Bialgebra.CotangentSpace`) is one-dimensional, commutes with base change through
`c ⊗ (dh₁ ∧ ⋯ ∧ dh_d) ↦ c · (d(1 ⊗ h₁) ∧ ⋯ ∧ d(1 ⊗ h_d))` (a line admits every rescaling, so the formula
pins the map), and right pullback by `g` acts by `det Ad(g)⁻¹` ([Rosengarten], §1, p. 2).
*Checks:* For `G_m`, `ω` is spanned by `dT/T` (class of `T − 1`); the trivial group gives `k`; on the
upper Borel of `GL₂`, `diag(2, 1)` pulls `ω` back to `ω/2`, `diag(1, 2)` to `2ω`, and the unipotent
`[[1, 1], [0, 1]]` fixes `ω`; along `ℚ → ℝ`, `1 ⊗ dT/T` goes to the class of `1 ⊗ T`, not twice it.
*Lean:* `GaugeForm`, `GaugeForm.finrank_eq_one`.

**The Haar measure of a gauge form over a local field.** For `K` nondiscrete locally compact of
characteristic `0`, `G` smooth of dimension `d` and an invariant top form `ω ≠ 0`, `|ω|` integrates
`|f|_K` in charts `ω = f dx₁ ∧ ⋯ ∧ dx_d` against the normalized additive measure (`vol(𝒪_K) = 1`, `dx`,
`2 dx dy`, `|z|_ℂ = zz̄`); it is chart independent and left Haar, `|cω| = |c|_K|ω|` (one factor for every
`d`), `map (· g) |ω| = |det Ad(g)|_K |ω|` ([Platonov–Rapinchuk–Rapinchuk], Thm 3.71, pp. 192–196,
whose complex measure is `dx dy`, so ours is `2^d` times theirs). Over a number field `|ω|_v` is that
of the scalar extension, and `∏_{w|∞} |ω|_w` is Haar on `G(F_∞)`, scales by `∏_w |c|_w`, and is `μ_∞`
for `G_a`.
*Checks:* For `G_a`, `|dT|_v` is the normalized Haar measure; `|dT/T|_v(𝒪_v^×) = 1 − q_v⁻¹` (`1/2` at
`q_v = 2`); over `ℂ` the unit square has mass `2`, its square `4`, `[0, 2]²` mass `8`, a segment `0`.

**Weil's volume formula for integral points.** For a smooth affine group scheme `𝓗` of relative
dimension `d` over `𝒪_v` with residue field of order `q_v` and a gauge form generating the invariant
top forms of `𝓗`, `|ω|_v(𝓗(𝒪_v)) = #𝓗(k_v) q_v^{−d}` ([Gordon], §2.1, (1), p. 3); for `GL_n` and the
wedge of the classes `d(X_ij − δ_ij)` this fixes the scale of the local measure.
*Checks:* For `GL₂` at `q_v = 2` the mass is `6/16 = 3/8`; normalizing `vol(GL₂(𝒪_v)) = 1` would give
`1`.

**Convergence factors from the character module.** For connected `G`, `X = X*(G_{F̄}) ⊗ ℂ` with its
finite-image Galois action has local factors `L_v(X, s) = det(1 − q_v^{−s} Frob_v | X^{I_v})⁻¹`
(arithmetic Frobenius, inertia invariants). For every finite-image representation the Euler product
converges on `Re s > 1` and `(s − 1)^r L(X, s)`, `r = dim X^{Gal}`, has a finite nonzero limit at `1`,
positive for lattices: Brauer induction to finite-order Hecke characters (LFunctions roadmap) and
the residue of `ζ_F` ([Marzec–Neururer], Def. 5.11, Rem. 5.12, p. 62; Thm 5.14, pp. 62–64; Thm 5.20,
Cor. 5.21, p. 67). The split case is `(1 − q_v^{−s})^{−r}` with leading coefficient `(res ζ_F)^r`;
deleting finitely many factors divides the coefficient by their values at `1`.
*Checks:* Rank `0` gives `1`; at residue cardinality `2` and `s = 1` rank `1` gives `2` and rank `2`
gives `4`; leading coefficients `1`, `res ζ_F`, `(res ζ_F)²`; at `q = 2`, `s = 1` the factors of `ζ`
and `ζ⁻¹` (cube roots of unity) differ.
*Lean:* `Tamagawa.splitLocalFactor`, `Tamagawa.splitLeadingCoeff`.

**One-dimensional Artin–Hecke comparison.** For a finite-order Galois character `χ`, the Artin
L-function equals the L-function of the primitive ray class character with value `χ(Frob_v)` at
unramified `v` (ClassFieldTheory reciprocity, arithmetic Frobenius; compose with inversion if the
reciprocity map uses geometric Frobenius), on `Re s > 1` and as meromorphic germs, ramified
factors included; for a larger modulus the primitive function is multiplied by the Euler factors at
the extra primes ([Marzec–Neururer], Thm 5.14, pp. 62–64).
*Checks:* The nontrivial character of `ℚ(i)/ℚ` is the primitive character mod `4`, with factor `1` at
`2`; raising the modulus to `12` introduces the correction `1 + 3^{−s}`; `Ind_{ℚ(i)}^ℚ 1 = 1 ⊕ χ₄`
gives `ζ_{ℚ(i)}`, and in general `L_F(Ind_E^F 1, s) = ζ_E(s)` for finite separable `E/F`.

**Orders of connected reductive groups over finite fields.** For connected reductive `H/𝔽_q` with an
`F`-stable Borel pair `(B, T)`, `W = W(H, T)`, `N = #Φ⁺`:
`#H(𝔽_q) = q^N · #T(𝔽_q) · ∑_{w∈W^F} q^{ℓ(w)}` and `#T(𝔽_q) = |det(F* − 1 | X*(T) ⊗ ℚ)|`, with absolute
Weyl length ([Dudas–Michel], Prop. 7.12(iii), p. 27; Prop. 7.14, p. 28). *Needs:* ReductiveGroups
layer 7 (Lang, Bruhat decomposition).
*Checks:* Split rank one at `q = 2`: `|2 − 1| = 1`; nonsplit: `|−2 − 1| = 3`, not `−3`; `SL₂/𝔽₂`:
`2 · 1 · (1 + 2) = 6`.

**Absolute convergence of the corrected volumes.** For connected reductive `G` with a reductive
model over `𝒪_{F,S}`, `∏_{v∉S} λ_v #𝓗(k_v) q_v^{−d}` converges absolutely, the factors being
`1 + O(q_v^{−2})` uniformly (`λ_v = 1` for semisimple `G`): writing `F* = qθ`, the `q⁻¹` coefficient of
the normalized torus order is `−tr θ` on `X*(T)`, the Bruhat sum contributes the trace on the
simple-root span, and the difference, minus the trace on `X*(G)`, is cancelled by `L_v(X*(G), 1)`;
sum `q_v^{−2}` with the Euler product of `ζ_F` at `2` (a derivation, not an assertion of
[Rosengarten], §3, p. 25). *Needs:* Tau Ceti `TauCeti.dedekindZeta_eulerProduct_hasProd`.

**Tamagawa measure.** For `G` smooth connected of dimension `d` with `ρ_G` the leading coefficient
of the convergence factors and the corrected integral volumes convergent and nonzero,
`τ_G = |d_F|^{−d/2} ρ_G⁻¹ ∏_v λ_v |ω|_v` (the convergent Haar product, `λ_v = L_v(X, 1)` at finite
places including ramified inertia invariants, `λ_v = 1` at infinite places). It is a Haar measure;
on `∏ C_v` with `C_v = 𝓗(𝒪_v)` almost everywhere it is `|d_F|^{−d/2} ρ_G⁻¹ ∏ λ_v |ω|_v(C_v)`; for `G_a`
it is `|d_F|^{−1/2} μ_𝔸`; if the geometric character lattice is zero, `λ_v = ρ_G = 1` but the
convergent product is still needed ([Platonov–Rapinchuk–Rapinchuk], proof of Thm 5.22, p. 315).
*Checks:* `G_a/ℚ`: `[0, 1) × ℤ̂` has mass `1`; `G_m`: `∏_p |dT/T|_p` is zero but
`λ_v|dT/T|_v(𝒪_v^×) = 1`; the trivial group gives the point mass; scaling `ω` by `2` scales a complex
factor by `|2|_ℂ = 4`.

**Independence of the gauge form.** `τ_G` does not depend on `ω`: `cω`, `c ∈ F^×`, multiplies each
`|ω|_v` by `|c|_v` and `∏_v |c|_v = 1` ([Rosengarten], §1, p. 2).

**Corrected volumes for GL_n and SL_n.** For `n ≥ 1` and the standard models,
`(1 − q_v⁻¹)⁻¹ #GL_n(k_v) q_v^{−n²} = ∏_{i=2}^{n} (1 − q_v^{−i})` and
`#SL_n(k_v) q_v^{−(n²−1)} = ∏_{i=2}^{n} (1 − q_v^{−i})`, and both products over `v` converge
([Platonov–Rapinchuk–Rapinchuk], Example 5.23, p. 316, for `SL₂/ℚ`).
*Checks:* At `q = 2`, `#GL₂(𝔽₂) = 6` and the corrected volume is `3/4`; in rank `0` the `GL` correction
would give `2` against the empty product `1`, so `n ≥ 1` is needed.
*Lean:* `Tamagawa.gl_correctedVolume`.

**Tamagawa number.** For connected reductive `G`, `τ(G) = vol(G(F)\G(𝔸)^1) ∈ [0, ∞]` for the measure
induced by `τ_G` and the lattice-normalized `λ` on `a_G`; it is positive, invariant under restriction
of scalars, and finite by AA.3.4 ([Rosengarten], §1, p. 3).
*Checks:* The trivial group has `τ = 1`. `τ(G_m) = 1` (the residue formula for `ζ_F` in
measure-theoretic form, with `λ_v = (1 − q_v⁻¹)⁻¹`, `dx/x` and `[F : ℚ] dt/t`): over `ℚ(i)` the residue
`π/4` and idele volume `π/2` give `(1/2)(4/π)(π/2) = 1`, while omitting `|d_F|^{−1/2}` gives `2` and
omitting the factor `2` at the complex place gives `1/2` (over `ℚ` neither omission is visible);
`vol(G_m(F)\G_m(𝔸)) = ∞`.

### AA.2.5 Scalar Jacobians and restriction of scalars

The linear Haar input is the lattice-index and regular-Haar scaling law over a complete discretely
valued field with finite residue field: `μ(MA) = |det M| μ(A)` (MassFormula roadmap, layer 2);
pushforward has inverse absolute determinant.

**Finite-place scalar Jacobian for a chosen basis.** For `E/F` of degree `n`, a finite place `v` and
an `F`-basis `β` of `E`, read as `β : F_v^n ≃ ∏_{w|v} E_w`, with normalized Haar measures, the factor
`j_{β,v}` in `β_* μ_{F_v}^n = j_{β,v} ∏_{w|v} μ_{E_w}` is `vol(∑_j 𝒪_v β_j)⁻¹`, equal to `1` if `β` is an
`𝒪_v`-basis of `∏ 𝒪_w` ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.60, p. 186, uniqueness of Haar
measure).

**Archimedean scalar Jacobian for a chosen basis.** At an infinite `v`, with `dx` and `2 dx dy` on
both sides: if `F_v = ℝ` and `E ⊗ F_v = ℝ^a × ℂ^b`, `j_{β,v} = 2^{−b} |D_{β,v}|⁻¹`, `D_{β,v}` the real
determinant in real and imaginary coordinates; if `F_v = ℂ`, `j_{β,v} = |det_ℂ β|^{−2}` (the factors `2`
cancel) ([Platonov–Rapinchuk–Rapinchuk], pp. 192–196, change of variables).

**Global scalar Jacobian and absolute discriminants.** The `j_{β,v}` are `1` for almost all `v` and
`∏_v j_{β,v} = |d_F|^{[E:F]/2} |d_E|^{−1/2}`, so `|d_F|^{−nd/2} ∏_v j_{β,v}^d = |d_E|^{−d/2}`: identify the
integral trace determinant (`NumberField.discr_eq_of_integralBasis`), the square of a basis change
(`Algebra.discr_of_matrix_vecMul`), lattice indices (`AddSubgroup.index_eq_natAbs_det`, decomposed
into primary parts), the factor `2^b` at real places, and remove the basis by the product formula
on the basis-change determinant. *Needs:* NumberFieldArithmetic layer 4.

**Gauge forms under restriction of scalars.** For `ω_E` a gauge form, `β` an `F`-basis of `E` and an
`E`-basis of the cotangent space dual to `ω_E`, let `ω_β` be the `F`-top form dual to the basis
`β_j e_i` of the restricted cotangent space; transported to `G_E(∏_{w|v} E_w)`,
`|ω_β|_v = j_{β,v}^d ∏_{w|v} |ω_E|_w` ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196,
chartwise).

**Inductivity of the convergence factors.** For finite separable `E/F` and a finite-image
representation `X` over `E`, `L_v(Ind X, s) = ∏_{w|v} L_w(X, s)` at every finite `v`, ramified ones
included (decomposition-group double cosets and determinants on inertia-fixed cyclic blocks of
length `f(w/v)`); the Euler products agree on `Re s > 1` and so do the leading coefficients at `1`
([Marzec–Neururer], Prop. 5.10, pp. 61–62; Thm 5.14(iv), pp. 63–64).
*Checks:* For `ℚ(i)/ℚ` at `2` inertia swaps the basis of `Ind 1`, the invariant line gives
`(1 − 2^{−s})⁻¹` on both sides (the full space would square it); zero invariants give `1`; a
residue-degree-two block has determinant `1 − z²`, not `(1 − z)²`.

**Tamagawa measures and restriction of scalars.** For `E/F` finite and `G_E` connected reductive of
dimension `d`, the isomorphism `Res_{E/F} G_E(𝔸_F) ≃ G_E(𝔸_E)` with the induced character-space map
and lattice normalizations carries `τ_{Res G_E}` to `τ_{G_E}` and the norm-one quotient measures to
each other, for arbitrary gauge forms on the two sides; so the Tamagawa numbers agree. Deduced from
the inductivity, the leading coefficients, the global Jacobian and the product formula for `τ`
([Gordon], (48), p. 32, checks the quadratic restriction torus).
*Checks:* `τ(Res_{E/F} G_m) = τ(G_m) = 1` although the dimension is `[E : F]`; without `|d|^{−d/2}`
the two sides would differ by `|d_F|^{[E:F]/2}` and `|d_E|^{1/2}`, that is `1` and `2` for `ℚ(i)/ℚ`.

### Examples

`X*_F(GL_n) = ℤ · det` and `a_{GL_n}` is a line; `Res_{ℚ(i)/ℚ} G_m` has rational rank `1`, geometric
rank `2`; the norm-one idele `(p, p)` separates `G(𝔸)^1` from `G(F_∞)^1 × G(𝔸_f)`; `ℙ¹(ℝ)` has no
invariant Radon measure; `|dT/T|_p(ℤ_p^×) = 1 − p⁻¹`; `τ_{G_a}([0, 1) × ℤ̂) = 1` over `ℚ`;
split factors `2` and `4` at residue cardinality `2`; `τ(G_m) = 1`.

### Dependencies

AA.0 and AA.1; Mathlib group-like elements, modular characters, Riesz representation,
fundamental domains, exterior powers and Dedekind zeta residues; Tau Ceti geometric characters,
cotangent spaces, adjoint action, dynamic parabolics and the Euler product of `ζ_F`; ReductiveGroups
layers 4 and 7; ReductiveGroupsPartII RG2.0 and RG2.4; GlobalNumberFields layers 0 and 6;
NumberFieldArithmetic layer 4; the MassFormula roadmap, layer 2; the LFunctions roadmap, layers
5–6; ClassFieldTheory reciprocity; Chebotarev layer 10.

## Layer AA.3: reduction and arithmetic quotients

Rational parabolic data, real Siegel coordinates and the primitive `GL_n` and closed-orbit
reductions come first; their adelic consequences give finite class sets, finite volume and
compactness criteria; heights quantify growth, and the fixed-`K` real theory controls cusps and
subgroup orbit maps.

### AA.3.1 Rational parabolics and Iwasawa integration

**Algebraic Levi decompositions.** For a finite-type `H/F` and a Hopf ideal `P` cutting out a closed
subgroup, a Levi decomposition consists of Hopf ideals `N, M ⊇ P` cutting out a smooth connected
unipotent and a connected reductive subgroup such that on every commutative `F`-algebra `R`,
`N(R) ⊴ P(R)` and every `p ∈ P(R)` is uniquely `nm` (points through
`TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, products in `G(R)`); one exists when `char F = 0` and
`P` is geometrically connected ([Borel], §1.13, p. 11). The dynamic decompositions of
`TauCeti.Cocharacter.leviDecompositionMulEquiv` remain the supplier for cocharacter parabolics.
*Checks:* `G_m` has `N = 1`, `M = G_m`; `G_a` in characteristic zero has `N = G_a`, `M = 1`; `GL₂` has
`M = GL₂`, `N = 1`.

**Relative roots with their adjoint realization.** For connected reductive `G` and a maximal split
torus `S₀` (Hopf ideal with `TauCeti.splitTorusCommHopfAlgProperty`), `X = X*(S₀)` is finite free;
in the counit derivations of `F̄ ⊗ H`, `Lie(G) ⊗ F̄ = ⨁_χ 𝔤_χ` with `𝔤_χ` the `χ`-eigenspace of
`Ad(S₀(F̄))`, the roots are the `χ ≠ 0` with `𝔤_χ ≠ 0`, `m_χ = dim 𝔤_χ`, and `𝔤₀ = Lie Z_G(S₀)`. The
Weyl group `N_G(S₀)(F)/Z_G(S₀)(F)` acts by `(wχ)(s) = χ(n⁻¹sn)`, a Mathlib `RootPairing` on these roots
has its reflections realized in and generating it, simple roots `Δ₀` give every root one sign, and
multiplicities are Weyl invariant ([Borel–Tits], §5.3, p. 96, §5.8, p. 98;
[Platonov–Rapinchuk–Rapinchuk], §2.1.14, pp. 75–76).
*Checks:* `GL_n`: roots `e_i − e_j`, multiplicity `1`, Weyl group `Sₙ` (`n = 0, 1` included); `G_m`: no
roots, `dim 𝔤₀ = 1` (`0` for the trivial group); `SL₂`: `±α`; `SU₃` of the antidiagonal Hermitian
form of a quadratic `E/F` (in `Res_{E/F} GL₃`): `±α, ±2α`, multiplicities `2, 1`, Weyl group of order
`2`; the diagonal torus of `GL₂`, `GL₃` is its own centralizer (Weyl orders `2`, `6`); `0` is never a
root.

**Minimal rational parabolics and standard parabolics.** For connected reductive `G`, a minimal
`F`-parabolic `P₀ = M₀N₀` with `M₀ = Z_G(S₀)`: for a regular dominant cocharacter `λ` of `S₀` (pairing
positively with every simple root), `P₀(R)`, `N₀(R)`, `M₀(R)` are `TauCeti.Cocharacter.parabolic`,
`unipotent`, `levi` on every `R`. Standard parabolics `P ⊇ P₀` have unique Levi components
`M_P ⊇ M₀`, unipotent radicals `N_P` and split components `A_P`; they correspond to subsets of `Δ₀`
(the simple roots whose negative root-ray group lies in `P`), `P ≤ P′` iff the subsets are included
(subgroup inclusion, reverse inclusion of Hopf ideals), and every `F`-parabolic is `G(F)`-conjugate to
a unique standard one ([Arthur], §4, p. 22; [Borel–Tits], §5.9, p. 98, §§5.12, 5.14, p. 99).
*Checks:* A torus has one standard parabolic; `GL₂/ℚ` has two, `GL₃` four; the lower Borel of `GL₂`
is parabolic, not standard, conjugate to the upper one by the Weyl element.

**Relative chambers and the spaces a_P.** `a_P = a_{M_P}` (with `a_0 = a_{P₀}`), realized as
`Hom(X*_F(M_P), ℝ)`; for `P₁ ≤ P₂` restriction of characters along the inclusion of Levis determined
by `M₀` gives the projection `a_{P₁} → a_{P₂}` with kernel `a_{P₁}^{P₂}` and the split-centre splitting
`a_{P₁} ≃ a_{P₂} × a_{P₁}^{P₂}`, `a ↦ (πa, a − ι(πa))`; `ρ_P = (1/2)∑_{α∈Φ_P} (dim 𝔫_α) α`; `Δ_P` (the
distinct restrictions of `Δ₀ ∖ Δ₀^P`) is a basis of `(a_P^G)*`, linearly independent, spanning when
`X*_F(G) = 0`; `a_P^+ = {H : α(H) > 0, α ∈ Δ_P}` ([Arthur], §5, pp. 24–25). The lift `a_P → Hom(X, ℝ)`
agrees with evaluation on restricted Levi characters and vanishes on the simple Levi roots.
*Checks:* For the Borel of `GL₂` the projection is `(a, d) ↦ a + d` with central lift `z ↦ (z/2, z/2)`
and `ρ = (e₁ − e₂)/2`; `a_{SL₂} = 0`, `a_{G_a} = 0`; for `GL₃`, `e₁ − e₃ > 0` alone does not give `a_0^+`.

**Admissible maximal compact subgroup of G(𝔸).** `K = ∏_v K_v` is admissible relative to `M₀` if
`K_v` is the integral points of a reductive model (smooth with reductive fibres) for almost all `v`,
`K_v` is special maximal compact in good position (`K_v ∩ P = (K_v ∩ N_P)(K_v ∩ M_P)` for standard
`P`; a local maximal split torus contains `S₀` and the rational relative Weyl group has normalizer
representatives in `K_v`) at finite `v`, and maximal compact at archimedean `v`. Then
`G(F_v) = P₀(F_v)K_v` at every place, `K` is compact, and admissible `K` exist ([Arthur], §4,
pp. 23–24). *Needs:* RG2.3.1 *Reductive models over O and hyperspecial subgroups*; RG2.4.4
*Iwasawa decomposition for an arbitrary parabolic and its integral form*.
*Checks:* `O(n) × ∏_p GL_n(ℤ_p)` is admissible for `GL_n/ℚ`; for the trivial group `K` is everything;
a product of Iwahori subgroups (proper in `GL₂(ℤ_p)`, also at `p = 2`) is not maximal.

**Adelic Iwasawa factorization.** For admissible `K` and standard `P`, multiplication
`N_P(𝔸) × M_P(𝔸)^1 × A_P(ℝ)^0 × K → G(𝔸)` is surjective and open, and at almost all finite places it
restricts to the integral factorization: `nm ∈ G(𝒪_v)` iff `n` and `m` are integral ([Arthur], §4,
pp. 23–24).
*Checks:* `[[1, 1], [0, 1]] · diag(2, 1) = [[2, 1], [0, 1]]` while the reverse product is
`[[2, 2], [0, 1]]`; the Weyl matrix `[[0, −1], [1, 0]] ∈ GL₂(ℤ_p)` is not upper triangular, so the
integral statement is about `K_v ∩ P`.

**Parabolic Haar Jacobian.** For `P = N ⋊ M` with Haar `dn`, `dm`, `δ_P(m)⁻¹ dn dm` is left Haar on
`P(𝔸)`, `dn dm` is right Haar, and Mathlib's modular character is `Δ_P(nm) = δ_P(m)` ([Arthur], §4,
p. 21).
*Checks:* `δ = 1` for a torus; for `GL₂` at root logarithm `log 2`, `δ = 2` and density `1/2`.

**Iwasawa integration through the compact factor.** For admissible `K` with Haar probability `dk`
and Haar `dn`, `dm` normalized at almost all places, `f ↦ ∫_K ∫_M ∫_N f(nmk) δ_P(m)⁻¹ dn dm dk` is a
positive right `G(𝔸)`-invariant functional on `C_c(G(𝔸))`, hence Haar measure; the pushforward of
`δ⁻¹ dn dm dk` under `(n, m, k) ↦ nmk` is that Haar measure (no invariant measure on `P\G` is
asserted) ([Arthur], §4, pp. 21–23).
*Checks:* Zero input gives zero, doubling `dn` doubles the output, Dirac masses at `1` give the
Dirac mass at `1`.

**Adelic Iwasawa decomposition and integration formula.** `G(𝔸) = P(𝔸)K = N_P(𝔸)M_P(𝔸)^1A_P(ℝ)^0K`
and `∫_{G(𝔸)} f = ∫_K ∫_{M_P(𝔸)} ∫_{N_P(𝔸)} f(nmk) δ_P(m)⁻¹ dn dm dk` for `f ∈ L¹` ([Arthur], §4, p. 24).

**The map H_P.** `H_P(nmk) = H_{M_P}(m)` defines `H_P : G(𝔸) → a_P` (depending on `K`), continuous,
with `H_P(px) = H_P(p) + H_P(x)` for `p ∈ P(𝔸)` and `H_P(γx) = H_P(x)` for `γ ∈ P(F)`
([Arthur], §4, p. 24).
*Checks:* For `GL₂`, the upper Borel and `O₂(ℝ) · ∏ GL₂(ℤ_p)`, `H_P(diag(y, 1)) = (log y, 0)` (`y > 0` at
infinity); the Weyl representative has height `0`, while `w diag(2, 1)` has simple-root height
`−log 2` (additivity would give `log 2`), so `H_P` is not a homomorphism; `H_P(diag(a, d)) =
(log ‖a‖, log ‖d‖)`.

### AA.3.2 Real Siegel coordinates and reduced positive forms

**Horospherical decomposition for a fixed maximal compact.** For connected semisimple `G/ℚ`, `K`
maximal compact in `G(ℝ)^+` with Cartan involution `θ` and a `ℚ`-parabolic `𝐏`, a unique `θ`-stable
real Levi lift gives `P = N_PA_PM_P` and a diffeomorphism `N_P × A_P × (M_P ∩ G)K → G(ℝ)^+` (for
`PGL₂`, `M_P ∋ diag(−1, 1)` leaves `G(ℝ)^+`); left translation by `n₀a₀m₀` acts by
`(n, a, m) ↦ (n₀(a₀m₀)n(a₀m₀)⁻¹, a₀a, m₀m)`, conjugation by `G(ℚ)` moves `(𝐏, K)`, and for
`K′ = uKu⁻¹`, `u ∈ N_P`, `a_{K′}(g) = a_K(gu)`; coordinates and the logarithm `a ↦ (log|χ(a)|)_χ` are
smooth and semialgebraic (`TauCeti.IsSemialgebraic`) in matrix realizations ([BKT], §2.2, (2.2), p. 8).
*Checks:* For `SL₂(ℝ)`, `(x, a, ±k) ↦ n(x) diag(√a, 1/√a)(±k)`; with `u = n(1)` and
`k = [[0, −1], [1, 0]]`, `a_K(k) = 1` but `a_{uKu⁻¹}(k) = 1/2` (heights of `ki` and `k(1 + i)`); the
logarithm is additive and vanishes only at `1`, central directions included.

**Simple roots of P and truncated tori.** `Δ(A_P, N_P)` is the unique set of `dim A_P` linearly
independent roots of `A_P` on `Lie N_P` spanning all roots positively; `A_{P,t} = {a : a^α > t,
α ∈ Δ}`; the corner chart `e_P(a) = (a^{−α})_α` is a semialgebraic diffeomorphism onto `(ℝ_{>0})^r` with
`e_P(A_{P,t}) = (0, 1/t)^r` when `X*(G) = 0` (central directions are invisible to roots) ([BKT],
§2.2, p. 8; §2.3, (2.4), p. 9).
*Checks:* For `SL₂`, `diag(a, a⁻¹)^α = a²`; for `SL₃` the root `α₁ + α₂` is positive but not simple;
at `t = 1` the identity is excluded when roots exist; for `G = G_m` distinct points have the same
empty corner tuple.

**Siegel set for a fixed maximal compact.** For `𝐏`, fixed `K`, `t > 0` and relatively compact open
semialgebraic `U ⊂ N_P`, `W ⊂ M_PK`, `𝔖 = U × A_{P,t} × W` in horospherical coordinates; on `G/M`
for compact connected `M ⊂ K` it is the image. Membership is coordinatewise, monotone in `U, W` and
antitone in `t`; any relatively compact windows enlarge to semialgebraic ones ([BKT], Def. 2.3,
p. 8; [BKT erratum], §1.1, p. 1: `K` fixed once and for all).
*Checks:* For `SL₂` and `SO(2)` the image is `{x + iy : x ∈ U, y > t}`; an empty window gives `∅`;
for `SL₂`, `P` upper and `x ≠ i`, a Siegel set for `K_x` is not covered by finitely many
`SL₂(ℤ)`-translates of Siegel sets for `K_i` ([BKT erratum], §1.6.1).

**Translating and conjugating Siegel sets.** For `g ∈ G(ℚ)`, `g𝔖g⁻¹` is a Siegel set for
`(g𝐏g⁻¹, gKg⁻¹)`; for `g ∈ G`, `𝔖g` lies in one for `(𝐏, g⁻¹Kg)`; for `g ∈ 𝐏(ℝ)`, `g𝔖` lies in one for
`(𝐏, K)` with a possibly smaller threshold; so for `γ ∈ 𝐆(ℚ)^+`, `γ𝔖` lies in a Siegel set for
`(γ𝐏γ⁻¹, K)` ([BKT], Lemma 2.4, p. 8; [BKT erratum], Rem. 1.1(1), p. 2).
*Checks:* Translation by `1` changes nothing; left `N`-translation moves exactly the `N`-window; an
unrestricted `MK`-window absorbs right `K`-translation.

**Reduced positive forms.** A positive definite `B` is `C`-reduced in the basis `e` if
`|B_ij| < C B_ii`, `B_ii < C B_jj` for `i < j`, and `∏ B_ii < C det B`. Reducedness is monotone in `C`
and invariant under positive scaling; for fixed `n` and `C` there is `R(n, C)` such that every
`C`-reduced `B = Nᵀ diag(d) N` (`N` unit upper triangular) has `|N_ij| ≤ R` and `d_i ≤ R d_{i+1}`, and
conversely such Cholesky bounds give `C(n, R)`-reducedness ([BKT], Def. 4.11, p. 17; the bounds are
our deduction: `d_i ≤ B_ii`, `∏ d_i = det B`, induction on the triangular recursion, a geometric sum
for the converse; rank `0` needs `C > 1`). *Needs:* Tau Ceti `TauCeti.cholesky`.
*Checks:* The identity is `2`-reduced; `diag(4, 1)` is not `2`-reduced but `diag(1, 4)` is; in
dimension one every positive form is `C`-reduced for `C > 1`.
*Lean:* `RealSiegel.IsReduced`.

**Scalar invariance of reduced forms.** For `a > 0`, `B` is `(e, C)`-reduced iff `aB` is, so
normalizing the determinant preserves reducedness ([BKT], §4.5, Def. 4.11, pp. 17–18).
*Checks:* `[1]` and `2[1]` are `2`-reduced; `0[1]` and `−[1]` are not.

**The set T_{e,C} of reduced forms.** `T_{e,C}` is semialgebraic in the matrix entries, monotone in
`C`, and `T_{ge,C} = g · T_{e,C}` for `g ∈ GL(V_ℚ)` ([BKT], §4.5, p. 18; JAMS p. 933).
*Checks:* `1 ∈ T_{std,2}`; `diag(1, 4) ∈ T_{std,2}` but `diag(1, 1/4) ∉ T_{std,2}`; in dimension one and
`C > 1` it is all positive forms.

**Reduced forms and Siegel sets.** For a lattice and an integral basis `e`, the `(e, C)`-reduced forms
lie in the image of a `GL_n(ℝ)` Siegel set in `GL_n(ℝ)/O(n)` and each such Siegel set has reduced
image for some `C`; determinant one gives `SL_n(ℝ)/SO(n)` after normalizing by `det(B)^{−1/n}`; rank
`0` is a point ([BKT], §4.5, p. 18).

**Lower bound by diagonal entries.** If `∏ B_kk ≤ D det B` (`D ≥ 1`), then `aᵀBa ≥ a_k² B_kk/D` for all
`a` and `k` (cofactor formula and Hadamard give `(B⁻¹)_kk ≤ D/B_kk`, then Cauchy–Schwarz; supporting
[BKT], Def. 4.11, pp. 17–18).

**Transferring off-diagonal bounds to another basis.** If `B` (basis `e′`) has `|B_ab| ≤ C′ d_a`,
`d_a ≤ C′ d_b` for `a < b` and `∏ d_a ≤ C′ det B`, then for `e_i = ∑_a A_ai e′_a`, with `k_i` the last
index with `A_{k_i i} ≠ 0`, `m_i = |A_{k_i i}|`, `L_i = ∑_a |A_ai|`:
`|b(e_i, e_j)| ≤ C′³ L_i L_j m_i⁻² b(e_i, e_i)` (our deduction supporting [BKT], Def. 4.11).

**Basis change with determinant control.** If `b` is `(e′, C′)`-reduced and
`∏ b(e_i, e_i) ≤ C det(b in e)`, then `b` is `(σe, C″)`-reduced for the permutation `σ` sorting the
`b(e_i, e_i)`, `C″ > 1` depending only on `C, C′` and the change of basis; so `b` lies in one of the
`m!` sets `T_{σe,C″}` ([BKT], §4.5, p. 18).
*Checks:* `diag(4, 1)` is `5`-reduced with unsorted diagonal; swapping the two basis vectors sorts
it.

### AA.3.3 Primitive reduction and closed orbits

Points of a finite-type `B` are `WithConv (B →ₐ[F] R)`; a rational representation is a bialgebra map
`O(GL_n) → B` whose matrix points are evaluation followed by `TauCeti.GeneralLinear.pointsMulEquiv`,
a closed embedding when surjective; `G(ℚ ⊗ ℝ)` is identified with the real points by evaluation at
the real place.

**The standard real Siegel domain and Gram matrices.** `Σ_n(u, t) = {v diag(a) k : v unit upper
triangular, |v_ij| ≤ u, a_i > 0, a_i/a_{i+1} ≥ t, kᵀk = 1}` (both determinant signs through `O(n)`;
[Orr], §2.1, p. 5; inversion converts [Platonov–Rapinchuk–Rapinchuk], §4.2, pp. 205–208, from `KAU`
with right action to `UAK`), and `gram(g) = (g⁻¹)ᵀ g⁻¹`; Gram matrices are positive, equal exactly on
`O(n)`-cosets, and `Σ_n(u, t)` is cofinal with the reduced sets in both directions ([BKT], §4.5,
pp. 17–18).
*Checks:* `Σ₁ = GL₁(ℝ)`, negative scalars included; `[[√y, x/√y], [0, 1/√y]] ∈ Σ₂(u, t)` iff `|x| ≤ u`,
`y ≥ t` (half-plane point `x + iy`); columns `(1, 0), (1, 2)` of `g⁻¹` give `[[1, 1], [1, 5]]`.

**Reductive groups with finite component groups.** In characteristic zero a group is reductive (not
necessarily connected) if it is smooth and its geometric fibre has no nontrivial normal smooth
unipotent subgroup; connected reductive groups qualify ([Borel], §5.3, p. 19).
*Checks:* `G_m` and `μ₂` qualify; `G_a` does not.

**Reduction for GL_n(ℝ).** For `n ≥ 1` there are `u, t > 0` with `GL_n(ℝ) = GL_n(ℤ) Σ_n(u, t)`;
equivalently there is `C > 0` such that every positive definite form is `GL_n(ℤ)`-equivalent to a
`C`-reduced form ([Platonov–Rapinchuk–Rapinchuk], Theorem 4.12, pp. 206–208, Theorem 4.20, p. 220,
after inversion, which also reverses the simple-root ratios). *Needs:* Mathlib
`ModularGroup.exists_smul_mem_fd`.
*Lean:* `RealSiegel.exists_reduced_GLZ`.

**GLₙ finite class number one over ℚ.** For `n ≥ 1`, `GL_n(𝔸_{ℚ,f}) = GL_n(ℚ) GL_n(ℤ̂)` and
`GL_n(ℚ) ∩ GL_n(ℤ̂) = GL_n(ℤ)` (over a number field the double cosets are the class group) ([Borel],
§§2.1–2.2, pp. 11–12; §4.4, p. 17).

**Adelic reduction for GL_n over ℚ.** `GL_n(𝔸_ℚ) = GL_n(ℚ)(Σ_n(u, t) × GL_n(ℤ̂))` ([Borel],
Lemma 4.4, p. 17).

**Real GLₙ Siegel overlap.** For `d ≥ 1` and `c₁, c₂ ∈ GL_n(ℚ)`, only finitely many `γ ∈ GL_n(ℚ)` with
`γ, γ⁻¹ ∈ d⁻¹M_n(ℤ)` satisfy `γc₁Σ ∩ c₂Σ ≠ ∅` ([Borel], §3.1 Lemma, p. 14; §3.3, p. 15).

**Simultaneous self-adjointness.** For a finite nested chain `G₁ ⊃ ⋯ ⊃ G_m` of reductive real
algebraic subgroups of `GL_n(ℝ)`, one `a ∈ SL_n(ℝ)` makes every `aG_i(ℝ)a⁻¹` transpose-stable ([BHC],
Thm 1.9, p. 492). *Needs:* RepresentationTheory/LieGroups layer 9.

**Reductive homogeneous spaces as closed orbits.** In characteristic zero, for reductive `G` and
reductive closed `H`, the affine quotient `H\G` is a finite-type algebra `A` with a faithfully flat
`A → O(G)` and a natural right `G`-action (`σ(g)` equal iff `gh⁻¹ ∈ H(R)`, on every `R`); it embeds
`G`-equivariantly as the closed orbit of `w ∈ V(F)` with stabilizer `H` in a rational
representation, `j(x · g) = ρ(g⁻¹) j(x)`; faithful flatness gives local lifts, not rational lifts
([BHC], §3.8, p. 501; [Borel], §5.3, pp. 19–20).
*Checks:* `G\G` is a point; for `G_m` modulo `μ₂` the coordinate pulls back to `T²` and the rational
quotient point `2` does not lift to `G_m(ℚ)`.

**Closed-orbit weight bounds in a real Siegel domain.** For a rational `GL_n`-representation `V`,
`w ∈ V(ℝ)` with closed `GL_n(ℂ)`-orbit (a common zero set of complex polynomials) and transpose-stable
real stabilizer, the full lattice `Γ ⊂ V(ℚ)` of a rational basis, and `Σ = Σ_n(u, t)` acting on the
left, there is a compact `Q ⊂ GL_n(ℝ)` with `Σ · w ∩ Γ ⊂ Q · w` ([BHC], §§5.3–5.4, pp. 504–506; BHC
use `v · g = g⁻¹v` and the inverse domain).
*Checks:* The zero orbit is closed, the punctured line is not; weights `±1` act on `(1, 1)` by
`(a, a⁻¹)`; the lattice of the basis `1/2` contains `1/2` but not `1/4`.

**Closed-orbit lattice finiteness.** Under the same hypotheses `Σ · w ∩ Γ` is finite, also for any
other lattice and for `cΣ`, `c ∈ GL_n(ℚ)` ([BHC], Lemma 5.4, pp. 505–506).

**Compact finite parts give bounded denominators.** For `ρ : G → GL(V)` over `F`, `w ∈ V(F)` and
compact `C ⊂ G(𝔸_{F,f})`, some nonzero `d ∈ 𝒪_F` clears the denominators of every rational vector in
`wρ(C)`, and of every entry of `ρ(γ)^{±1}` for rational `γ` with finite diagonal in `C` ([Borel],
Lemma 4.3, p. 17).

**Reduction for reductive subgroups of GL_n.** For reductive `G ⊂ GL_n` over `ℚ` with `aG(ℝ)a⁻¹`
self-adjoint, there are finitely many `c_i ∈ GL_n(ℚ)` such that
`Ω = ⋃_i c_i(Σa × GL_n(ℤ̂)) ∩ G(𝔸)` has `G(𝔸) = G(ℚ)Ω`, `{γ : γΩ ∩ Ω ≠ ∅}` finite, and relatively
compact finite projection ([Borel], Thm 4.5, pp. 17–18, stated for right quotients).
*Checks:* `C = ∅` gives `∅`; `C = {1}`, `a = 1`, `t ≤ 1` contains `1`; for `G = GL_n` membership is
`g_∞ ∈ Σ_n(u, t)` and `g_f ∈ GL_n(ℤ̂)`.

**Rational points on closed orbits.** For reductive `H ⊂ G` over `F` (not necessarily connected),
`σ_𝔸(G(𝔸)) ∩ (H\G)(F)` is a finite union of `G(F)`-orbits ([Borel], Thm 5.4, p. 20).

### AA.3.4 Adelic reduction and arithmetic quotients

**Adelic Siegel sets.** For admissible `K`, `T₁ ∈ a_0` and compact `ω ⊂ N₀(𝔸)M₀(𝔸)^1`,
`𝔖(T₁, ω) = {pak : p ∈ ω, a ∈ A₀(ℝ)^0, k ∈ K, β(H₀(a) − T₁) > 0, β ∈ Δ₀}`: membership is as written,
antitone in `T₁`, monotone in `ω`, stable under right `K` and under `A_G(ℝ)^0` ([Arthur], §8, p. 37).
*Checks:* `1 ∈ 𝔖(T₁, {1})` iff every simple root is negative on `T₁`; for `G_m/ℚ`, `A_GK ≠ G_m(𝔸)`;
`|x| ≤ 1/2`, `y ≥ √3/2` covers every modular orbit, the strict version misses `1/2 + i√3/2`, and
`0 < t < √3/2` covers; for `SL₂/ℚ` with window `[−1, 1]`, `y > 1/2`, both `1` and `n(1)` lie in the set.

**Siegel sets cover G(F)\G(𝔸).** For connected reductive `G` and admissible `K`, some `T₁`, `ω` give
`G(𝔸) = G(F)𝔖(T₁, ω)` (Borel–Harish-Chandra) ([Arthur], Thm 8.1, p. 37; [Borel], Thm 4.6, p. 18).

**Siegel property.** `{γ ∈ G(F) : γ𝔖 ∩ 𝔖 ≠ ∅}` is finite for every Siegel set ([Borel], Def. 4.1,
p. 17, and Thm 4.6, p. 18).

**Finiteness of class numbers.** For every linear algebraic group `G/F` and compact open
`U ⊂ G(𝔸_{F,f})`, `G(F)\G(𝔸_{F,f})/U` is finite; equivalently `G(𝔸) = ⋃_{i ≤ h} G(F)x_iG(F_∞)U`
([Borel], Thm 5.1, p. 19; [Milne], Lemma 5.12, p. 57).
*Lean:* `Reduction.finite_classes`.

**Unipotent groups have class number one.** For unipotent `N`, `N(𝔸_f) = N(F)U` for every compact
open `U` ([Borel], Cor. 2.5, p. 13).

**Class numbers of semidirect products.** If `G = H ⋉ N` with `N` normal smooth unipotent (the
product map bijective on every coefficient algebra), every double coset of `G(F)\G(𝔸_f)/U` meets
`H(𝔸_f)`, so finiteness for `H` gives finiteness for `G`; no reductivity of `H` is needed ([Borel],
Prop. 2.7, p. 13).

**Arithmetic subgroups attached to a level.** For affine `G` over `F`, compact open `U` and
`x ∈ G(𝔸_{F,f})`, `Γ_{x,U} = G(F) ∩ xUx⁻¹` is discrete in `G(F_∞)`, satisfies `Γ_{γxu,U} = γΓ_{x,U}γ⁻¹`,
and any two such groups are commensurable ([Milne], Lemma 5.13, p. 57).
*Checks:* `Γ_{x,G(𝔸_f)} = G(F)`; at `x = 1` membership is the finite diagonal condition;
`Γ_{1,GL₂(ℤ̂)} = GL₂(ℤ)` and `Γ_{diag(p,1),GL₂(ℤ̂)} ≠ GL₂(ℤ)`; for `GL₁/ℚ` the level `ℤ̂^×` gives `{±1}`
and principal level `3` gives `{1}`.
*Lean:* in `Reduction`: `levelArithmetic`, `levelArithmetic_discrete`,
`levelArithmetic_commensurable`.

**Component decomposition of a level quotient.** For representatives `x_1, …, x_h` of the classes,
`[g_∞] ↦ [(g_∞, x_i)]` is a `G(F_∞)`-equivariant homeomorphism `⊔_i Γ_{x_i,U}\G(F_∞) ≃ G(F)\G(𝔸)/U`
(the archimedean factor and the split centre are kept) ([Milne], Lemma 5.13, p. 57; [Arthur], §2,
p. 13).
*Checks:* Different classes stay separate, and points of one component are identified exactly by
`Γ_{x_i,U}`.

**Exponential integrability on the relative chamber.** For a basis `β_i` of `(a₀^G)*` with
`2ρ = ∑ c_iβ_i`, `c_i > 0`, `∫_{β_i(H) > β_i(T)} exp(−2ρ(H)) dH = J ∏_i exp(−c_iβ_i(T))/c_i`, `J` the
Jacobian; rank `0` gives the point mass (Mathlib `integral_exp_mul_Ioi`).
*Checks:* `∫_{x>0} e^{−x} = 1`, `∫_{x>0} e^{−2x} = 1/2`, `∫_{x>log 2} e^{−x} = 1/2`.

**Siegel sets in G(𝔸)^1 have finite measure.** `𝔖(T₁, ω) ∩ G(𝔸)^1` has finite measure in `G(𝔸)^1`
(from the chamber integral and the Iwasawa Jacobian, with the Siegel sets of [Arthur], Thm 8.1,
p. 37).

**Finite volume of G(F)\G(𝔸)^1.** For connected `G/F`, `G(F)\G(𝔸)^1` has finite positive volume: a
fundamental domain of `G(F)` in `G(𝔸)^1` has finite Haar measure ([Platonov–Rapinchuk–Rapinchuk],
Thm 5.24, pp. 318–321, with the Levi decomposition, the compact unipotent quotient and product
integration).
*Lean:* `Reduction.exists_fundamentalDomain_normOne_lt_top`.

**Tamagawa numbers are finite.** For connected reductive `G`, `0 < τ(G) < ∞` ([Rosengarten], §1,
p. 3).

**When G(F)\G(𝔸) has finite volume.** `G(F)\G(𝔸)` has a nonzero finite invariant Radon measure iff
`X*_F(G°) = 0`, `G°` the largest geometrically connected closed subgroup (its Hopf ideal is minimal
among those with geometrically connected quotient); for connected `G`, iff `X*_F(G) = 0`
([Platonov–Rapinchuk–Rapinchuk], Thm 5.22(2), pp. 314–316).
*Checks:* For connected `G` the ideal is `0`; a finite group has no characters on its identity
component; `G_m` keeps its characters and has infinite volume.
*Lean:* `Reduction.finite_volume_iff`.

**Anisotropic groups have compact quotients.** For connected reductive `G` with `F`-anisotropic
derived group (no proper `F`-parabolic; every rational cocharacter central), `G(F)\G(𝔸)^1` is
compact ([Borel], Thm 5.8, p. 22; [Arthur], §4, p. 21).
*Checks:* `F^×\𝔸_F^1` is compact.
*Lean:* `Reduction.IsCentralCocharacter`, `Reduction.exists_compact_normOne_iff`.

**Isotropic groups have noncompact quotients.** For connected reductive `G` with a proper
`F`-parabolic, `G(F)\G(𝔸)^1` is not compact; it is compact iff `G(F)` has no nontrivial unipotent
element iff `G^der` is anisotropic ([Borel], Thm 5.8, p. 22; [Arthur], §4, p. 21).
*Checks:* `SL₂(F)\SL₂(𝔸)` is not compact; `[[1, 1], [0, 1]]` is unipotent while `diag(2, 1/2)` is
not, although both have determinant `1`.

**Cocompact arithmetic groups contain no unipotents.** For connected reductive `G/ℚ` and
`Γ = G(ℚ) ∩ U`, compactness of `Γ\G(ℝ)` excludes nontrivial unipotent elements of `Γ` ([BKT],
Rem. 1.4(1), p. 5).

**S-arithmetic subgroups are lattices.** For connected reductive `G` with `X*_F(G) = 0`, finite
`S ⊇ ∞` and compact open `U^S ⊂ G(𝔸^S)`, `Γ_S = G(F) ∩ G(F_S)U^S` is a lattice in `G(F_S)`, cocompact
iff `G` is `F`-anisotropic ([Rapinchuk], §2.6, p. 16; [Borel], §8, pp. 26–30).
*Checks:* `S = ∞` recovers `Γ_{1,U}`; for `GL₁` the element `p` is `S`-arithmetic when `p ∈ S`
but not at the ordinary integral level.

**Finitely many G(𝒪)-orbits on rational flags.** For connected reductive `G` and an `F`-parabolic
`P`, `G(F) = ⋃_{i∈I} Γx_iP(F)` with `I` finite for arithmetic `Γ` ([Borel], Lemma 7.2 and Thm 7.3,
p. 25).

**Arithmetic quotients have finite volume.** For connected reductive `G` and `Γ = G(F) ∩ U`,
`Γ\(G(F_∞)/A_G(ℝ)^0)` has finite invariant volume ([Borel], Thm 5.6, p. 21).

**Arithmetic quotients of anisotropic groups are compact.** `Γ\(G(F_∞)/A_G(ℝ)^0)` is compact iff
`G^der` is anisotropic. For a central division algebra `D/F` of degree `≥ 2`, `SL₁(D)` (the Hopf
quotient of the left regular `GL_n` whose geometric points, through a splitting `D ⊗ F̄ ≃ M_d(F̄)`
from Mathlib's algebraically closed Wedderburn theorem, are the units of reduced norm `1`) is
semisimple and `SL₁(D)(F)\SL₁(D)(𝔸)` and `Γ\SL₁(D)(F_∞)` are compact; a unipotent unit of a division
algebra is `1` (Mathlib `IsNilpotent.eq_zero`) ([Borel], Thm 5.6(ii), p. 21;
[Platonov–Rapinchuk–Rapinchuk], §2.3.1, pp. 90–91, Prop. 2.29, Example 4.46, pp. 252–253).
*Checks:* `D = F` gives the trivial group; `diag(2, 1/2)` has reduced norm `1`; `diag(−1, 1)` has
reduced norm `−1` though left multiplication on `M₂` has determinant `1`.

### AA.3.5 Algebraic heights

**Height functions on G(𝔸).** For a faithful algebraic representation `r : G → GL_m` augmented by
its dual, `‖x‖_r = ∏_v ‖r(x)_v‖_v` with the entrywise maximum of normalized absolute values at finite
places and the Hilbert–Schmidt norm to the power `[F_v : ℝ]` at infinite places (height `1` for
`m = 0`). It satisfies `‖xy‖ ≤ ‖x‖‖y‖`, `‖x⁻¹‖ ≤ C‖x‖^N`, compact sublevel sets, and
`#{γ ∈ G(F) : ‖γ‖ ≤ t} ≤ C t^N` with finiteness ([Arthur], §13, (13.2)–(13.4), p. 70, over `ℚ`; the
number-field version is our extension by restriction of scalars). The inequalities do not pin the
function (`‖·‖²` satisfies them); the formula does.
*Checks:* For `GL₁/ℚ` with `r ⊕ r^∨ = diag(x, x⁻¹)`, the factors are `√(x² + x⁻²)` and
`max(|x|_p, |x⁻¹|_p)`, so `‖x⁻¹‖ = ‖x‖`; `‖1‖ = 2` for `GL₂/ℚ`; finite places alone give a bounded height.

**Rational-point Arakelov comparison.** On `g ∈ G(F)` the adelic height is the relative Arakelov
height (ArithmeticHeights roadmap, §0.1) of the tuple of entries of `ρ(g)` and `ρ(g)⁻¹`, and the
`[F : ℚ]`-th power of the absolute height.
*Checks:* Rank `0` gives `1`; the two-dimensional identity gives relative height `2^{[F:ℚ]}`; the
rational `GL₁` point `2` gives `√17` (archimedean factor `√17/2`, `2`-adic factor `2`).

**Local polynomial comparison for algebraic heights.** For closed immersions `σ, τ` of `G`, with
dual-augmented local norms, there are `N ≥ 1` and `c_v > 0`, `c_v = 1` for almost all finite `v`, with
`‖τ(g)‖_v ≤ c_v ‖σ(g)‖_v^N` ([Arthur], §13, p. 70).
*Checks:* Rank `0` gives `1`; the identity gives `1` at finite places and `√(2m)^{mult}` at infinity;
inversion does not change local heights.

**Properness of dual-augmented adelic height.** The height has compact sublevel sets: at infinity
it bounds `σ(g)^{±1}`, at finite `v` it is `≥ 1` and `≥ q_v` when not integral in both directions
([Arthur], §13, p. 70).

**Polynomial count of rational coordinates.** `#{a ∈ F^d : ∏_v max(1, |a_i|_v) ≤ R} ≤ C R^N` with
`C, N` depending on `F, d` ([Arthur], §13, p. 70). *Needs:* GlobalNumberFields layer 6.

**Comparison of heights.** Two proper algebraic heights satisfy `‖x‖_{r′} ≤ C‖x‖_r^N` and conversely;
translation by a fixed compact subgroup changes them by bounded factors ([Arthur], §13, p. 70).

**Heights on Siegel sets.** On `𝔖(T₁, ω)`, `x = pak`, `c e^{c‖H₀(a)‖} ≤ ‖x‖ ≤ C e^{C‖H₀(a)‖}` for any
norm on `a₀`, so `log ‖x‖` and `‖H₀(x)‖` are comparable on `𝔖 ∩ G(𝔸)^1` ([Arthur], §13, p. 70).

### AA.3.6 Cusps for one fixed maximal compact

**Finitely many cusps.** For connected reductive `G` and `Γ = Γ_{1,U}`, the `F`-parabolics form
finitely many `Γ`-conjugacy classes, conjugation being of Hopf ideals on every coefficient algebra
([BKT], Prop. 2.7(1), p. 9; [Borel], Thm 7.3, p. 25).

**Finitely many fixed-K Siegel sets cover.** For connected reductive `G`, arithmetic `Γ`, fixed `K`
and compact `M ⊂ K`, with `𝐏_1, …, 𝐏_k` representing the `Γ`-classes of `ℚ`-parabolics, there are
Siegel sets `𝔖_i` for `(𝐏_i, K)` whose images cover `Γ\G/M`; windows can be made semialgebraic
without changing the list ([BKT], Prop. 2.7(1), p. 9; [BKT erratum], §1.1, p. 1).

**Finite overlaps of Siegel sets.** For Siegel sets `𝔖₁, 𝔖₂` at the same `K` (any parabolics and
thresholds), `{γ ∈ Γ : γ𝔖₁ ∩ 𝔖₂ ≠ ∅}` is finite, also for the closures of their windows ([BKT],
Prop. 2.7(2), p. 9).

**Deep Siegel sets of distinct parabolics are disjoint.** For `𝐏₁ ≠ 𝐏₂` and fixed windows, `𝔖₁` and
`𝔖₂` are disjoint once `t₁, t₂` are large ([BKT], Prop. 2.7(5), p. 9).

**Inequivalent cusps separate.** If `𝐏₁, 𝐏₂` are not `Γ`-conjugate, then for large thresholds
`γ𝔖₁ ∩ 𝔖₂ = ∅` for all `γ ∈ Γ` ([BKT], Prop. 2.7(3), p. 9).

**Deep self-intersections come from the parabolic.** For large `t`, `γ𝔖 ∩ 𝔖 = ∅` for every
`γ ∈ Γ ∖ Γ ∩ 𝐏(ℚ)` ([BKT], Prop. 2.7(4), p. 9).

**Comparison of Siegel-set conventions.** For a standard rational `P ⊇ P₀`, relatively compact
windows and `t > 0`, a horospherical Siegel set lies in one Siegel triple domain (AA.3.7); for
`P = P₀` the two kinds are cofinal on `G(ℝ)^+` with `K⁺ = K ∩ G(ℝ)^+` (not conversely for larger
`P`: for `P = G = SL₂` a bounded window cannot contain a noncompact domain), and a triple domain for
`K` lies in one rational translate of one for another minimal parabolic and the same `K` ([BKT],
§2.2, p. 8; [Orr], §§2.2–2.3, pp. 6–7).

### AA.3.7 Subgroup containment and orbit maps

Groups are connected reductive over `ℚ`; real points may be disconnected.

**Algebraic Cartan data and Siegel triples.** A Cartan datum is a faithful rational representation
`ρ`, a positive form `b` and an involution `θ` with `ρ(θ(g)) = b⁻¹ρ(g⁻¹)ᵀb` and maximal compact fixed
group `K`; it exists for connected reductive `G` ([BHC], §§1.1, 1.6–1.9, pp. 486, 489–492). A Siegel
triple adds relative root data, a minimal parabolic and `u ∈ N(ℝ)` with `S = uS₀(ℝ)u⁻¹` `θ`-stable,
`A = S⁰`, `M = u{m ∈ Z_G(S₀)(ℝ) : |χ(m)| = 1}u⁻¹`, `logA(a)(χ) = log|χ(u⁻¹au)|`; a window is a compact
`Ω ⊆ NM⁺` with `t > 0`, and the domain is `Ω · {a : exp(logA(a)(α)) ≥ t} · K` ([Orr], Lemma 2.1 and §2.2,
pp. 6–7).
*Checks:* `θ` inverts the split torus of `G_m`; for `SL₂`, `b = 1` gives `K = SO₂` and `NM⁺` the upper
unipotent group; without roots and with `Ω = {1}` the domain is `AK`; `t = 2` removes `1` when roots
exist.

**Compatible parabolic and torus for a subgroup.** For `H ⊂ G`, a Siegel triple `(P_H, S_H, K_H)`
with `S_H` `ℚ`-split, and `K_G ⊃ K_H` maximal compact whose Cartan involution stabilizes `S_H`, choose
a `ℚ`-parabolic `Q` with Levi `Z_G(S_H)` and `N_H ⊂ R_u(Q)`, then minimal `P_G ⊂ Q`; its Cartan-stable
Siegel torus `S_G` contains `S_H`, `S_G ∩ H = S_H` and `N_H ⊂ N_G`; restriction of characters
`X*(S_G) → X*(S_H)` is fixed by the algebraic embedding ([Orr], §4.2, Lemmas 4.2–4.6, pp. 15–17;
[Orr–Schnell], §§A, E, pp. 1232, 1236).
*Checks:* For `H = G` the restriction is the identity; for `H = G_m` the root system is empty.

**Finite root-cone comparison.** In that setting, with `Z = Z_G(S_H)`, `N_Z = R_u(P_G ∩ Z)` and `t > 0`,
there is `t′ ∈ (0, 1]` with `A_{H,t} ⊂ ⋃_w wA_{G,t′}w⁻¹` over the finitely many Weyl elements of `S_G`
with `N_H, N_Z ⊂ wN_Gw⁻¹` ([Orr], §4.3, Prop. 4.7, Lemmas 4.8–4.9, pp. 17–20).

**Rational and compact Weyl representatives.** For each such `w`, with `u ∈ N_Z(ℝ)` moving `S_G` to a
maximal `ℚ`-split torus of `P_G ∩ Z`, there are `w_K ∈ K_G` and `w_Q = u⁻¹w′_Qu`, `w′_Q ∈ G(ℚ)`,
`w′_Q⁻¹w_Q ∈ N_G(ℝ)`, with `w_Q⁻¹w_K ∈ Z_G(S_G)(ℝ)⁰` ([Orr], §4.4, Lemmas 4.10–4.11, pp. 20–21).

**Uniform compact factors for subgroup Siegel sets.** For compact `Ω_H ⊂ N_H(ℝ)M_H(ℝ)^+` and
`K_Z = K_G ∩ Z(ℝ)`, there are compact `Ω_G ⊂ N_GM_G` and `B_w ⊂ S_G(ℝ)⁰` with
`w′_Q⁻¹Ω_H ⊂ Ω_Gw_K⁻¹B_wK_Z` for every admissible `w` ([Orr], §4.5, Lemmas 4.12–4.13, pp. 21–22).

**Containment of subgroup Siegel sets.** For reductive `𝐇 ⊂ 𝐆`, a Siegel set `𝔖_H = ΩA_tK_H`, and
`K_G ⊃ K_H` whose Cartan involution stabilizes `𝐒_H`, there are a Siegel triple `(𝐏_G, 𝐒_G, K_G)`, a
Siegel set `𝔖_G` and finite `C ⊂ 𝐆(ℚ)` with `𝔖_H ⊂ C𝔖_G`, `R_u(𝐏_H) ⊂ R_u(𝐏_G)` and
`𝐒_H = 𝐒_G ∩ 𝐇` ([Orr–Schnell], Thm 1, pp. 1231–1232; [Orr], §4.6, Prop. 4.14, pp. 22–23).

**Stability of the subgroup under the Cartan involution suffices.** If the Cartan involution of
`K_G` stabilizes `𝐇`, it restricts to that of `K_H` and stabilizes every Siegel torus `𝐒_H`; the
converse fails for `𝐆 = SL₂`, `𝐇 = {[[a, 2b], [b, a]] : a² − 2b² = 1}`, `K_H = {±1}`, `𝐒_H = 1`
([BKT erratum], proof of Thm 1.2, p. 3; [Orr–Schnell], Rem. 2, pp. 1231–1232).
*Checks:* `[[3, 4], [2, 3]] ∈ 𝐇` but its transpose is not.

**Intersecting Siegel sets with a subgroup.** If `K_H = K_G ∩ 𝐇(ℝ)` and every `K_H`-Siegel set lies in
finitely many rational translates of a `K_G`-Siegel set, then every `𝔖_G ∩ 𝐇(ℝ)` lies in `F𝔖_H` for a
`K_H`-Siegel set and finite `F ⊂ 𝐇(ℚ)` ([BGST], §28, Prop. 28.1, pp. 14–15).

**Compact inclusion alone does not give Siegel containment.** There are `𝐇 ⊂ 𝐆`, even semisimple,
with `K_H ⊂ K_G` and an `𝐇`-Siegel set not covered by finitely many rational translates of
`K_G`-Siegel sets ([Orr–Schnell], §§B–C, pp. 1232–1234): the tilted torus of `SL₂` with points
`[[x, x⁻¹ − x], [0, x⁻¹]]` (its real points form a triple domain with compact factor `{±1}`, image
the ray `(1 − y) + iy` in the upper half-plane), and the twisted orthogonal group `{g ∈ SL₃ :
gBgᵀ = B}`, `B = ηJηᵀ`, `η = [[3/2, 0, −1/2], [0, 1, 0], [−1/2, 0, 3/2]]`, with compact factor in `SO₃`.
*Checks:* `[[2, −3/2], [0, 1/2]]` is in the tilted torus, its transpose is not;
`η diag(2, 1, 1/2) η⁻¹ = [[35/16, 0, 9/16], [0, 1, 0], [−9/16, 0, 5/16]]` is in the twisted group, its
transpose is not; `(ηᵀη)₁₃ = −3/2`.

**Orbit maps.** For `𝐇 ⊂ SL(V)` faithful algebraic with a positive form `b₀` and compatible Cartan
datum, `value(g) = ρ(g⁻¹)ᵀb₀ρ(g⁻¹)` induces an injection `𝐇(ℝ)/K_H → X = SL(V_ℝ)/SO(b₀)` (equal values
iff `g⁻¹h ∈ K_H`; determinant `det b₀`); Lie stability of tangent matrices under `X ↦ b₀⁻¹Xᵀb₀`
suffices ([BKT], §4.5, pp. 17–18; [BKT erratum], §1.5, p. 3).
*Checks:* `value(1) = b₀`; for `G_m → SL₂` with `b₀ = 1`, `diag(a, a⁻¹) ↦ diag(a⁻², a²)`.

**Preimages of Siegel sets under orbit maps.** For every Siegel set `𝔖 ⊂ X`, `ι⁻¹(𝔖)` lies in finitely
many `K_H`-Siegel sets; in the Gram realization, for a rational basis and `C > 0`, the reduced-form
preimage is covered by finitely many `𝐇(ℚ)`-translates of one triple domain ([BKT], §4.5,
pp. 17–18; JAMS pp. 932–933).

**Images of Siegel sets under orbit maps.** Every `K_H`-Siegel set maps into finitely many Siegel
sets of `X`: one `C > 0` and finitely many rational bases make every image form `C`-reduced ([BKT],
§4.5, p. 18; JAMS p. 933).

### Examples

`GL₃` has four standard parabolics; `O(n) × ∏_p GL_n(ℤ_p)` is admissible and Iwahori products are
not; the `A`-coordinate of `[[0, −1], [1, 0]]` changes from `1` to `1/2` when `K` is conjugated by
`n(1)`; `diag(4, 1)` is not `2`-reduced while `diag(1, 4)` is; the `SL₂/ℚ` Siegel set with window
`[−1, 1]` and `y > 1/2` contains `1` and `n(1)`; `F^×\𝔸^1` is compact and `SL₂(F)\SL₂(𝔸)` is not;
`‖x⁻¹‖ = ‖x‖` for the dual-augmented `GL₁` height; the tilted torus and the norm-one torus of `ℚ(√2)`
separate Cartan stability of the torus, of the subgroup, and compact inclusion.

### Dependencies

AA.1 and AA.2; Mathlib modular-group fundamental domain and `RootPairing`; Tau Ceti Cholesky,
semialgebraic sets and dynamic parabolics; ReductiveGroups layers 3, 6 and 7; ReductiveGroupsPartII
RG2.3 and RG2.4; RepresentationTheory/LieGroups layer 9; GlobalNumberFields layer 6; the
ArithmeticHeights roadmap, §0.1.

## Layer AA.4: approximation, neat levels and Hecke maps

Weak and strong approximation have different hypotheses and obstructions; torsors and arithmetic
closures are developed explicitly. Neat levels then give honest topological level quotients with
covering maps, stabilizer-aware fibre formulas and Hecke maps; the last subsections isolate
quaternion norms and Fourier limits on compact abelian groups.

### AA.4.1 Weak approximation and torsors

**Weak approximation.** For `S = S_∞ ∪ S_f` finite, `G` has weak approximation at `S` if the diagonal
`G(F) → ∏_{w∈S_∞} G(F_w) × ∏_{v∈S_f} G(F_v)` has dense image; this passes to subsets of `S`, to
products and along isomorphisms ([HW], §1, p. 6).
*Checks:* `S = ∅` holds trivially (the target is a point); `G_a` has it for every `S`
(`TauCeti.GlobalNumberFields.weakApproximation_denseRange`); `μ₂/ℚ` fails at `S = {∞, 2}`: the image
`{(1, 1), (−1, −1)}` is not dense in `{±1}²`.
*Lean:* `Approximation.ArchPoints`, `Approximation.diagonalS`, `Approximation.HasWeakApproximation`.

**Weak approximation for GL_n, SL_n and split tori.** `GL_n` (an open subvariety of affine space),
`SL_n` (elementary matrices), `G_a` and `G_m^r` have weak approximation for every finite `S`
([Rapinchuk], Lemma 1.2, p. 3, for `SL₂`). *Needs:* GlobalNumberFields layer 1.

**Torsors under an affine group over a field.** A `G`-torsor over a field `k` is a nonzero finitely
generated `k`-algebra `A` with a coassociative counital coaction `A → A ⊗ H` such that
`A ⊗ A → A ⊗ H`, `a ⊗ b ↦ (a ⊗ 1)ρ(b)`, is bijective (equivalent to `A ⊗ k̄ ≅ H ⊗ k̄` as comodule
algebras; geometric points do not suffice for nonreduced `G`); it is trivial iff `A →ₐ[k] k` is
nonempty iff it is isomorphic to `G` acting on itself; its base change to `k′` has algebra `k′ ⊗ A`
and is trivial iff `A` has a `k′`-point ([HW], Lemme 6.3, p. 22).
*Checks:* `G_m` scaling `A¹` is no torsor; `ℚ[x]/(x² − 2)`, `x ↦ x ⊗ g`, is a nontrivial `μ₂`-torsor,
still nontrivial after `ℚ → ℚ` and trivial after `ℚ → ℝ`.

**Coordinate and geometric torsors.** Coordinate torsors (with equivariant algebra isomorphisms
reversed) are equivalent to fppf torsors under `Spec H` over `Spec k`, compatibly with base change,
sections and isomorphisms; isomorphism classes match the nonabelian `H¹` of the fppf site with its
distinguished class and base change (affine fppf descent: [Stacks], Tags 0245, 04TY, 04SK; the
torsor classes and `H¹` of the SchemeAndStackFoundations roadmap, §§1.15, 2.3). A Hasse statement for
an abstract class set with these compatibilities specializes to the canonical one.

**Canonical μ₂ class and scalar extension.** In the fppf torsor classes of `μ₂ = Spec ℚ[ℤ/2]`, the
class of `Spec ℚ[t]/(t² − 2)` (coaction `t ↦ t ⊗ g`) is not the identity, stays so under pullback
along the identity of `Spec ℚ`, and becomes the identity over `Spec ℝ` (sections over `ℚ` do not
exist, over `ℝ` they do; coefficient pushforward is a different map).

**Local H¹ vanishing.** For connected semisimple simply connected `G` over a characteristic-zero
nonarchimedean local field, `H¹(E, G) = 1` ([PR94], Thm 6.4, pp. 284–285, proofs §§6.7–6.8): reduce by
restriction of scalars and products to absolutely simple groups, then use twisting, reduced norms,
Hermitian invariants for classical types and the exceptional-type arguments, `E₈` included.
*Needs:* ClassFieldTheory local Brauer and norm theorems; GlobalQuadraticForms invariants.

**Hasse kernel and injectivity.** For semisimple simply connected `G` over a number field, a torsor
is trivial iff it is trivial at every real place, and two torsors are isomorphic iff they are at
every real place (twist by one of them and apply the kernel statement to the simply connected inner
form) ([PR94], Thm 6.6, p. 286, §§6.7–6.8).
*Checks:* Over a totally imaginary field every torsor is trivial; `μ₂` is not semisimple simply
connected and does not satisfy the conclusion.

**Real-class realization.** Every family of real torsor classes is realized by a global torsor, so
`H¹(F, G) → ∏_{v real} H¹(F_v, G)` is bijective on torsor classes ([PR94], Prop. 6.17, pp. 337–339; §7.3, Cor. 2).

**Weak approximation for simply connected groups.** Connected semisimple simply connected groups
have weak approximation for every finite `S` ([PR94], Thm 7.8, p. 415, proof in §7.3: reduction
theory, local Kneser–Tits, the Hasse principle and weak approximation for tori; strong approximation
is not an input). A torsor trivial at the real places has a global point, which gives the property
(⋆) of [HW], Thm 6.1, p. 21.
*Lean:* `Approximation.hasWeakApproximation_of_simplyConnected`.

### AA.4.2 Strong approximation and arithmetic closures

**Strong approximation.** For `S = ∞ ∪ S_f` finite, `G` has strong approximation at `S` if
`G(F)G(F_S)` is dense in `G(𝔸_F)`, equivalently `G(F)` is dense in `G(𝔸_F^S)`. Then
`G(𝔸) = G(F)G(F_S)U` for every open `U`, it passes to larger `S`, and for `S = ∞` every class set
`G(F)\G(𝔸_f)/U` is a point ([Rapinchuk], §2.1, Def., p. 7, and Thm 2.3, p. 12; [Borel], §2.6, p. 13).
*Checks:* `G_a` has it at `∞`; `G_m/ℚ` fails at `∞` (`ℚ^× ∩ ℤ̂^× = {±1}`); `SL_n` has it at `∞`.
*Lean:* in `Approximation`: `supportedAt`, `HasStrongApproximation`,
`HasStrongApproximation.classNumber_one`, `hasStrongApproximation_sln`.

**Strong approximation for unipotent groups.** A unipotent `N` has `N(F)N(F_S)` dense in `N(𝔸_F)` for
every nonempty set `S` of places, finite or not, with or without infinity
([Platonov–Rapinchuk–Rapinchuk], Lemma 5.7, pp. 301–302; Thm 1.13, p. 15).
*Checks:* `G_a/ℚ` is dense away from `{2}` although infinity is not in `S`; for `S = ∅` the diagonal is
discrete, not dense; for `S` all places the target is a point.

**Tori never have strong approximation for finite S containing infinity.** For a nontrivial torus
and finite `S ⊇ ∞`, `T(F)` is not dense in `T(𝔸^S)`, and `T(𝔸^S)/closure T(F)` has infinite exponent
([Rapinchuk], Prop. 2.1, p. 9). *Needs:* Chebotarev layer 10.

**Closed subgroups of p-adic Lie groups.** A closed subgroup `C` of a finite-dimensional
`ℚ_p`-analytic group `L` is an analytic subgroup with `Lie C ⊂ Lie L` a `ℚ_p`-subalgebra; continuous
homomorphisms are analytic; equal Lie algebras give openness and zero Lie algebra discreteness
([Platonov–Rapinchuk–Rapinchuk], Thm 3.12, p. 136; [Schneider], Thm 27.1, pp. 192–194, Exercise 26.2,
p. 181, Cor. 29.6, p. 205, Thm 29.8, pp. 206–208).
*Checks:* `ℤ_p ⊂ ℚ_p` is open with full Lie algebra; `{0}` is discrete; for `E/ℚ_p` proper, `ℚ_p ⊂ E`
has a one-dimensional `ℚ_p`-Lie algebra that is not `E`-linear.

**Closures of Zariski-dense subgroups are open.** For connected absolutely almost simple `G/ℚ_p`, a
Zariski-dense nondiscrete `Γ ⊂ G(ℚ_p)` has open closure; this fails for `E/ℚ_p` with `E`-density alone
([Rapinchuk], Lemma 2.7, p. 16; [Platonov–Rapinchuk–Rapinchuk], Prop. 3.11, p. 136).

**Borel density for S-arithmetic groups.** For connected absolutely almost simple `G/F` and finite
`S ⊇ ∞` with `G_S` noncompact, `G(𝒪_{F,S})` is infinite and Zariski dense ([Rapinchuk], Thm 2.3 and
the remark after it, p. 12).

**Open subgroups of finite covolume have finite index.** An open `Δ ≤ H` with a nonzero finite
invariant Radon measure on `H/Δ` has finite index ([Rapinchuk], §2.6, p. 16).

**Strong approximation through finitely many places.** For `S ⊇ ∞`, strong approximation at `S` holds
iff for every finite `S₁` disjoint from `S`, `G(𝒪(S ∪ S₁))` is dense in `∏_{v∈S₁} G(F_v)` ([Rapinchuk],
§2.6, p. 16).

**S-arithmetic groups are not discrete at an extra place.** For connected absolutely almost simple
`G`, `G_S` noncompact and finite nonempty `S₁` disjoint from `S`, the image of `G(𝒪(S ∪ S₁))` in
`G_{S₁}` is infinite and not discrete ([Rapinchuk], §2.6, p. 16).

**Finite covolume of a projection closure.** For second countable locally compact `A, B` and a
lattice `Γ ⊂ A × B`, the closure `Δ` of its `B`-projection has `Δ\B` of finite invariant volume (push
forward the quotient measure; [Platonov–Rapinchuk–Rapinchuk], Lemma 3.66, pp. 191–192).

**Lie algebra of an arithmetic closure over ℚ.** For connected absolutely almost simple `G/ℚ`,
`S ∋ ∞` with `G(ℚ_S)` noncompact and finite nonempty `S₁` of primes disjoint from `S`, the closure of
`G(ℤ[S⁻¹, S₁⁻¹])` in `∏_{p∈S₁} G(ℚ_p)` has full Lie algebra in each factor (Borel density makes the
projected Lie algebras ideals, nondiscreteness nonzero; pro-`p` subgroups separate the primes)
([Platonov], Prop. 3.2, pp. 1144–1145; [Rapinchuk], Lemma 2.7, p. 16, §3, pp. 17–18).

**Number-field arithmetic closure.** For connected absolutely almost simple `G/F`, finite `S ⊇ ∞`
with `G_S` noncompact and finite `S₁` disjoint from `S`, the closure of `G(𝒪_{F,S∪S₁})` in
`∏_{v∈S₁} G(F_v)` has full `ℚ_p`-Lie algebra in `∏_{v∈S₁, v|p} Res_{F_v/ℚ_p} G` for every `p`, and is
open of finite index. The `S`-arithmetic group is `ℚ`-Zariski dense in `Res_{F/ℚ} G` (it is
commensurated by `G(F)`; `ℚ`-simplicity; [PR94], Thm 2.2 and §4.4, pp. 205–206), so the Lie algebra
is an ideal of the whole product, hence a sum of `ℚ_p`-simple factors (no diagonal graphs, even
over one `p`), and finite covolume gives openness ([Rapinchuk], Lemma 2.7, p. 16, §3, pp. 17–18,
extended).
*Checks:* The diagonal of `sl₂(ℚ_p)²` surjects to each factor but is no ideal. For `F = ℚ(√2)`,
`ππ′ = 7` with `π = 3 + √2`: the cosets of `π′^{−n}` modulo `𝒪_F[1/π]` are distinct, so
`SL₂(𝒪_F[1/π])` has infinite index in `SL₂(𝒪_F[1/7])`.

**Openness in a finite product of rational completions.** Under these hypotheses the arithmetic
closure in `∏_{p∈S₁} G(ℚ_p)` is open of finite index, by finite covolume ([Platonov],
Props. 3.2–3.3, pp. 1144–1145).

**Anisotropic factors from weak approximation.** For simply connected absolutely almost simple
`G/F`, `S ⊇ ∞` finite with `G_S` noncompact and `T` the anisotropic finite places outside `S`: once
the closure of `G(F)G(F_S)` contains every isotropic local factor, it contains the adelic factor away
from `T`, weak approximation makes its projection to `∏_{v∈T} G(F_v)` dense, and a closed subgroup
`C ≤ A × B` with `A × {1} ⊆ C` and dense `B`-projection is everything ([Platonov addendum], §§1–2,
pp. 784–785). *Needs:* RG2.4.4 *The Kneser–Tits theorem over a local field*.

**Arithmetic closure at one isotropic place.** For such `G`, `v ∉ S` finite with `G` isotropic at `v`
and compact open `W ⊂ G(𝔸^{S∪{v}})`, `G(F) ∩ (G_S × G(F_v) × W)` is dense in `G(F_v)`, so the closure of
`G(F)G_S` contains `G(F_v)` ([Platonov], §3.4, p. 1145; [Rapinchuk], §2.6, pp. 16–17, Rem. 1 after
Thm 2.3, p. 12).

**Almost all local factors are isotropic.** A connected semisimple `G/F` of positive dimension is
quasi-split, hence isotropic, at all but finitely many places: a reductive model over `𝒪_v` gives an
unramified group ([Arthur], §16, p. 89). *Needs:* AA.1.1 reductive models; RG2.3.1.

**Strong approximation: sufficiency.** A connected, absolutely almost simple, simply connected
`G/F` has strong approximation at every finite `S ⊇ ∞` with `G_S` noncompact ([Rapinchuk], Thm 2.3
and Rem. 1, p. 12).

**Strong approximation: necessity.** For connected absolutely almost simple `G` and finite `S ⊇ ∞`,
strong approximation at `S` forces `G_S` noncompact and `G` simply connected ([Rapinchuk], §2.3,
p. 11). *Needs:* Chebotarev layer 10; Tau Ceti `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.

**Strong approximation for semisimple groups.** For connected semisimple simply connected `G` and
finite `S ⊇ ∞` with `G′(F_S)` noncompact for every `F`-simple factor `G′`, `G(𝔸) = G(F)G(F_S)U` for
every compact open `U ⊂ G(𝔸^S)`; for `S = ∞` every class set is a point ([Arthur], Thm 2.1(a), p. 12).

### AA.4.3 Neat elements and levels

**Eigenvalues of algebraic tensor subquotients.** In characteristic zero, for a closed faithful
`ρ : G → GL(V)`, any algebraic `σ` and `g ∈ G(k)`, every eigenvalue of `σ(g)` lies in the group
generated by those of `ρ(g)` ([Milne], §3, p. 34).

**Neat elements.** `α ∈ GL_n(ℂ)` is neat if its eigenvalues generate a torsion-free subgroup of
`ℂ^×`; `g ∈ G(F)` is neat if `ρ(g)` is, for a faithful algebraic `ρ` (surjective coordinate map
`O(GL_n) → H`, not mere injectivity on rational points) and an embedding `F → ℂ`; powers of neat
elements are neat and a neat element of finite order is `1` ([Milne], §3, p. 34). The notion does
not depend on the embedding; `√2 ∈ G_m(ℚ(√2))` is neat although `±√2` generate a group containing
`−1`, so it differs from neatness after restriction of scalars.
*Checks:* `diag(2, 1/2)` is neat; `[[0, −1], [1, −1]]` (order `3`) is not, nor is the torsion-free
`2 · [[0, −1], [1, 1]]` whose eigenvalue group contains `ζ₃`.
*Lean:* `Neat.IsNeatAut`, `Neat.algebraicPointMap`, `Neat.IsFaithfulAlgebraicPointHom`.

**Neatness does not depend on the representation.** If `ρ(g)` is neat for a faithful algebraic `ρ`,
then `σ(g)` is neat for every algebraic `σ` (same embedding) ([Milne], §3, p. 34).

**Neatness is stable under subgroups, conjugation and homomorphisms.** Subgroups and `G(F)`-conjugates
of neat subgroups are neat, and images under algebraic homomorphisms are neat ([Milne], §3, p. 34).

**Neat groups are torsion free.** A neat subgroup of `G(F)` is torsion free ([Milne], §3, p. 34).

**Neat compact open levels.** `U ⊂ G(𝔸_{F,f})` is a neat level if every `G(F) ∩ xUx⁻¹` is neat; open
subgroups and conjugates of neat levels are neat, and their arithmetic groups are torsion free
([Milne], §5, p. 58).
*Checks:* `U(3) ⊂ GL₂(ℤ̂)` is neat (one-prime criterion at `3`) and `GL₂(ℚ) ∩ U(3) = Γ(3)`;
`GL₂(ℤ̂)` is not neat, as it contains `−1`; the trivial group is neat at every level.
*Lean:* `Neat.IsNeatLevel`.

**Stable lattices for compact p-adic matrix groups.** A compact subgroup of `GL_n(ℚ_p)` preserves a
`ℤ_p`-lattice, hence is conjugate into `GL_n(ℤ_p)` ([Milne], Prop. 3.5, p. 34).

**Distance of p-adic roots of unity from one.** For a root of unity `ζ ≠ 1` in `ℚ̄_p`,
`|ζ − 1|_p ≥ p^{−1/(p−1)}`; a primitive `p^k`-th root has distance `p^{−1/(p^{k−1}(p−1))}` and a root of
order prime to `p` distance `1` ([Milne], Prop. 3.5, p. 34). *Needs:* LocalFieldsRamification
layer 0.

**Eigenvalue bound for congruence matrices.** For `M ∈ 1 + p^a M_n(ℤ_p)`, `a ≥ 1`, every eigenvalue
satisfies `|λ − 1|_p ≤ p^{−a}` ([Milne], Prop. 3.5, p. 34).

**Principal units of small radius are torsion free.** `{λ ∈ ℚ̄_p : |λ − 1|_p < p^{−1/(p−1)}}`
contains no root of unity but `1`; so eigenvalues of `1 + pM_n(ℤ_p)` (`p ≥ 3`) or `1 + 4M_n(ℤ₂)`
generate torsion-free groups ([Milne], Prop. 3.5, p. 34).

**A one-prime criterion for neatness.** If at one place `v | p` every element of compact `U` acts
through a faithful `ρ` in `1 + p^e M_n(𝒪_v)`, `e ≥ 1` for `p ≥ 3` and `e ≥ 2` for `p = 2` (a power of the
rational prime, not of a uniformizer), then `U` is neat ([Milne], Prop. 3.5, p. 34).
*Checks:* Modulo `2` alone it fails: `−1 = 1 + 2 · (−1)` is torsion, while `−1 ∉ 1 + 4ℤ`.

**Neat levels exist.** Every compact open `U` contains a neat normal open subgroup of finite index,
and every arithmetic subgroup contains a neat congruence subgroup of finite index (Borel) ([Milne],
Prop. 3.5, p. 34).
*Lean:* `Neat.exists_isNeatLevel_le`.

### AA.4.4 Double cosets and level topology

**Nested-level map on double cosets.** For `K′ ≤ K`, `[g] ↦ [g]` is a surjection
`H\G/K′ → H\G/K` whose fibre over `[g]` is the image of `kK′ ↦ [gk]`; the maps compose; no normality
is needed ([LT], §3.2, (15), p. 11). *Needs:* Tau Ceti `DoubleCoset.quotientMapOfLELeft`.
*Checks:* `K′ = K` gives the identity; for `H = G` and `[K : K′] = 2` the fibre has `1` element, for
`H = 1` it has `[K : K′]`; in `S₃` with `g = (01)`, `k = (12)`, the class of `gk` is not that of `kg`.

**Finite-index bound for level changes.** For `[K : K′] = N`, fibres have at most `N` elements, so
`H\G/K` finite of size `h` gives `H\G/K′` finite of size `≤ Nh` ([LT], §3.2.3, p. 16).
*Checks:* `Nat.card ℤ = 0`, so the bound alone does not give finiteness.

**Conjugate levels give equivalent double-coset sets.** `[g] ↦ [ga]` is a bijection
`H\G/aKa⁻¹ ≃ H\G/K` with inverse `[x] ↦ [xa⁻¹]` ([LT], §3.2, pp. 11–16).
*Checks:* `a = 1` changes nothing; in `S₃` the forward map uses `ga`, not `ag` or `ga⁻¹`.

**Index of product subgroups with finite exceptional support.** For `S_v ≤ H_v` equal outside a
finite `B`, `[∏ H_v : ∏ S_v] = ∏_{v∈B} [H_v : S_v]`; for product levels
`[∏ K_v : ∏ K′_v] = ∏_v [K_v : K′_v]` ([LT], §3.2.1, (20), p. 14; Mathlib `Subgroup.index_pi` for
finite index sets).

**Level quotients.** For compact open `U` and closed `K_∞ ⊂ G(F_∞)`, `X_U = G(F)\G(𝔸)/K_∞U` with the
quotient topology; `[x] ↦ [x]` relates levels `U′ ≤ U`, `[x] ↦ [xg]` gives `X_{gUg⁻¹} ≃ X_U`, and
`[γx] = [x]` for `γ ∈ G(F)` ([Milne], §5, footnote 40, p. 57).
*Checks:* `GL₁/ℚ`, `U = ℤ̂^×`, `K_∞ = ℝ^×` gives a point; `SL₂/ℚ`, `K_∞ = 1`, `U = SL₂(ℤ̂)` gives
`SL₂(ℤ)\SL₂(ℝ)`, not the one-point class set.
*Lean:* in `LevelMaps`: `levelSubgroup`, `levelSetoid`, `LevelQuotient`, `levelMap`.

**Compact kernel of height on an archimedean level.** If `K_∞` is closed, contains `A_G(ℝ)^0` and is
compact modulo it, then `K_∞ ∩ ker H_{G,∞}` is compact and `K_∞ ≃ A_G(ℝ)^0 × (K_∞ ∩ ker H_{G,∞})`
([Arthur], §2, pp. 13–15).

**Finite full rational stabilizers.** If `K_∞ ∩ ker H_G` is compact (for instance in the setting
above), `G(F) ∩ gK_∞Ug⁻¹` is finite for every `g`; this is the full stabilizer, before dividing by any
central subgroup ([Arthur], §1, pp. 7–8; §2, pp. 13–15).
*Checks:* For `G_m` over a real quadratic field and `K_∞ = (F ⊗ ℝ)^×`, `K_∞ ∩ ker H_G` is not compact
and the stabilizers contain the infinite unit group.
*Lean:* `LevelMaps.finite_rationalStabilizer`.

**Proper arithmetic action on the level space.** In that setting `G(F)` acts properly
discontinuously on `G(𝔸)/K_∞U` ([Arthur], §1, pp. 7–8).

**Level quotients are Hausdorff.** `X_U` is Hausdorff and locally compact ([Milne], Lemma 5.13,
p. 57). *Needs:* Mathlib `ProperlyDiscontinuousSMul`.

**Free action of finite level groups at neat level.** For neat `U` and normal open `U′ ⊂ U`, `U/U′`
acts freely and properly discontinuously on `X_{U′}`: stabilizers are finite and neat, hence
trivial ([Milne], §5, p. 58).

**Covering maps between neat levels.** For neat `U` and open `U′ ≤ U`, `X_{U′} → X_U` is a covering
map with fibres of `[U : U′]` elements, principal with group `U/U′` for normal `U′`; equality with the
whole deck group needs connectedness ([Milne], §5, p. 58). *Needs:* Mathlib
`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`; Tau Ceti
`IsQuotientCoveringMap.isCoveringMap_of_comp`.
*Lean:* `LevelMaps.isCoveringMap_levelMap`.

**Fibre mass for full stabilizers.** For `U′ ⊂ U` and `x = [g]` with finite full stabilizer `A_x`,
`∑_{y↦x} 1/|A_y| = [U : U′]/|A_x|` ([Arthur], §1, pp. 7–8).

**Fibre mass of a level map with stabilizers.** Without neatness, with
`Γ_x = (G(F) ∩ gK_∞Ug⁻¹)/(Z(F) ∩ K_∞U)`,
`∑_{y↦x} 1/|Γ_y| = [U : U′]/(|Γ_x| [Z(F) ∩ K_∞U : Z(F) ∩ K_∞U′])` (orbit–stabilizer; [LT], §3.2,
pp. 11–16).

**Quotient groupoids at non-neat level.** The action groupoid of `G(F)` on `G(𝔸)/K_∞U` has
automorphism group `G(F) ∩ xK_∞Ux⁻¹` at `x` (the automorphism of `γ` being `γ`, Mathlib
`CategoryTheory.ActionCategory.stabilizerIsoEnd`), isomorphism classes `X_U` (`[g] ↦ [g]`), finite
automorphism groups when `K_∞ ⊇ A_G(ℝ)^0` is compact modulo it (trivial at neat level), and possibly
infinite ones for general closed `K_∞` ([Milne], §5, p. 58).
*Checks:* For `SL₂/ℚ`, `K_∞ = SO(2)`, `U = SL₂(ℤ̂)` the object over `i` has `4` automorphisms (`1` for
`K_∞ = 1`); at full `GL₂` level the object over `−1/2 + (√3/2)i` has `6` (effective `PSL₂` orders `2`, `3`).

### AA.4.5 Hecke correspondences, volumes and abelianization

**Degree of a Hecke correspondence.** `UgU` is the disjoint union of `[U : U ∩ gUg⁻¹]` cosets `ugU`, and
at neat level (compact modulo `A_G`) `X_{U∩gUg⁻¹} → X_U` is a covering of that degree ([Arthur], §2,
p. 13). *Needs:* Tau Ceti `HeckeCoset.degree_eq_relIndex`.

**Hecke correspondences.** For `g ∈ G(𝔸_{F,f})` and `U_g = U ∩ gUg⁻¹`, `T_g` is the pair
`X_U ← X_{U_g} → X_U`, `[x] ↦ [x]` and `[x] ↦ [xg]`; it depends only on `UgU` ([Arthur], §2, p. 13).
*Checks:* `g = 1` gives two identities; for `GL₂/ℚ`, `g = diag(p, 1)`, `T_{g⁻¹}` is the transpose of
`T_g`, differing by translation by the central idele `p⁻¹`, which moves `|det x_∞|` when
`K_∞ = SO(2)` and is invisible once `K_∞ ⊇ ℝ_{>0}`.
*Lean:* `LevelMaps.hecke`.

**Cartesian squares of level maps.** For neat `U`, `U′, L ⊂ U` with `U′L = U`, the square of
`X_{U′∩L}, X_L, X_{U′}, X_U` is Cartesian; for `L = U_g` this needs the product condition, which
normality of `U′` does not give ([Milne], §5, p. 58).

**Volume of a level quotient.** `vol(G(F)\G(𝔸)^1) = vol(U) ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0)` over class
representatives `x_i`, `Γ_i = G(F) ∩ x_iUx_i⁻¹` ([Arthur], (2.1), p. 13).

**Volumes under finite-index level change.** For `U′ ⊂ U`,
`∑_j vol(Γ′_j\G(F_∞)/A_G(ℝ)^0) = [U : U′] ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0)` ([LT], §3.2.3, p. 16).

**Integral lifting for reductive abelianization.** For connected reductive `G` with simply connected
derived group and `ν : G → D = G/G^der`, reductive models over `𝒪_{F,B}` extend `ν` and
`G(𝒪_v) → D(𝒪_v)` is onto for `v ∉ B` (Lang on the special fibre, then Hensel lifting) ([Milne],
Lemma 5.21(b), p. 61). *Needs:* RG2.3.7 *Lang's theorem*.

**Surjectivity of finite adelic abelianization.** In that setting `ν : G(𝔸_f) → D(𝔸_f)` is surjective
with kernel `G^der(𝔸_f)` ([Milne], Lemma 5.21, p. 61). *Needs:* local `H¹` vanishing (AA.4.1).

**Class sets of groups with simply connected derived group.** If moreover `G^der(F_∞)` is
noncompact on each `F`-simple factor, `ν` induces `G(F)\G(𝔸_f)/U ≃ ν(G(F))\D(𝔸_f)/ν(U)` ([LT], §3.2.2,
(21), p. 14).

### AA.4.6 Compact abelian quotients and quaternion norms

**Reduced norms of a quaternion algebra over ℚ.** For a quaternion algebra `B/ℚ`, `Nrd(B_p^×) = ℚ_p^×`
at every prime, `Nrd(B_∞^×)` is `ℝ^×` or `ℝ_{>0}` as `B` splits at `∞` or not, and
`Nrd(B^×) = ℚ^×` or `ℚ_{>0}` accordingly (Hasse–Schilling–Maass) ([Khayutin], §2.3, pp. 15–16).
*Needs:* Tau Ceti `QuaternionAlgebra.normForm`; GlobalQuadraticForms layer 5.
*Lean:* `AdelicExamples.DefiniteQuaternion.nrd_image`.

**Compact idele classes modulo squares.** `C_F/C_F²` is compact: `C_F ≃ ℝ_{>0} × C_F^1`, the positive
reals are squares, and `C_F^1` is compact ([Khayutin], Def. 3.1, p. 22, Rem. 3.7, p. 25).
*Checks:* Squares die; the positive scalar `2` at infinity dies; over `ℚ` the idele `−1` at `3`
survives, as `−1` is not a square in `ℚ₃`.
*Lean:* `compactSpace_ideleClassGroup_quotient_squares`.

**Pushforward of a homogeneous measure to a compact abelian quotient.** For a second countable
compact abelian `C`, a continuous surjection `π : G → C`, closed `T ≤ G`, discrete `Λ ≤ T` with `Λ\T`
compact and `π(Λ) = 1`, the pushforward of the `T`-invariant probability on `Λ\Tg` is the Haar
probability of `π(T)π(g)` ([Khayutin], Def. 3.1, p. 22). The quotient carries its Borel σ-algebra.
*Checks:* For `C₄`, `T = Λ = 1` gives a point mass; `T = C₄` gives masses `1/4`; `T = {0, 2}` gives
`1/2` at each of `1, 3`.

### AA.4.7 Fourier limits on compact abelian groups

**Fourier convergence of quadratic-character kernels.** For a second countable compact abelian `C`
and pairwise distinct nontrivial continuous `χ_i : C → {±1}`, the Haar probability `m_i` of `ker χ_i`
integrates a character `ψ` to zero unless `ψ = 1` or `ψ = χ_i`, and `m_i` converges weakly to the Haar
probability of `C` ([Khayutin], Prop. 3.6, p. 24, and Rem. 3.7, p. 25). *Needs:*
RepresentationTheory/CompactGroups layer 5.

**Limits of measures invariant under character kernels.** A weak-* limit of probability measures
invariant under `ker χ_i` (pairwise distinct `χ_i`) is `C`-invariant ([Khayutin], proof of
Prop. 3.6, p. 25).

### Examples

`μ₂` fails weak approximation at `{∞, 2}`, `G_m/ℚ` fails strong approximation at `∞`, `G_a` has both;
`diag(2, 1/2)` is neat, the order-`3` element of `SL₂(ℤ)` is not; `U(3)` is a neat level and
`GL₂(ℤ̂)` is not; the `SL₂/ℚ` level quotient with `K_∞ = 1` is `SL₂(ℤ)\SL₂(ℝ)`, and with `K_∞ = SO(2)`
the object over `i` has `4` automorphisms; the positive scalars die in `C_F/C_F²` and the unit `−1`
at `3` survives over `ℚ`.

### Dependencies

AA.1–AA.3; Mathlib double cosets, action categories, properly discontinuous actions and covering
maps; Tau Ceti Hecke degrees, covering-map composition and the quaternion norm form;
ReductiveGroups layers 1, 6 and 7; ReductiveGroupsPartII RG2.3 and RG2.4; GlobalNumberFields
layers 1 and 6; Chebotarev layer 10; GlobalQuadraticForms layer 5; ClassFieldTheory layer 12;
LocalFieldsRamification layer 0; RepresentationTheory/CompactGroups layer 5; the
SchemeAndStackFoundations roadmap, §§1.15, 2.3.

## Layer AA.5: worked examples

The quotient topology, components, cohomology and level changes in concrete groups test the centre,
determinant, measure and stabilizer conventions of the earlier layers.

### AA.5.1 GL₁ and logarithmic tori

**The GL_1 quotient is the idele class group.** For `G_m/F`, `G(F)\G(𝔸_F) ≃ C_F` through
`TauCeti.MultiplicativeGroup.pointsMulEquiv`, `G(𝔸)^1 = 𝔸_F^1`, `A_G(ℝ)^0 = ℝ_{>0}` diagonally at the
archimedean places, `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}`, and `F^×\𝔸_F^1` is compact while `F^×\𝔸_F^×` is not
([Arthur], §3, p. 16; [Borel], §5.8, p. 22).
*Checks:* The diagonal scalar `t > 0` has idele norm `t^{[F:ℚ]}` (`4` for `t = 2` in degree two).
*Lean:* in `AdelicExamples.GL1`: `exists_quotientHomeomorph`, `archComponent`,
`archimedeanScalar`, `posRealsDiag`.

**Units at a level form a lattice of rank r₁ + r₂ − 1.** For open `U ⊂ Ô^×`, `Γ_U = F^× ∩ U` has finite
index in `𝒪_F^×` and its logarithmic image is a lattice of rank `r₁ + r₂ − 1` in the trace-zero
hyperplane ([CG], §8.2, p. 79). *Needs:* Mathlib `NumberField.Units.rank`.
*Checks:* Over `ℚ` the level `ℤ̂^×` gives `{±1}`.
*Lean:* `AdelicExamples.GL1.levelUnits`, `AdelicExamples.GL1.levelUnits_finiteIndex`.

**Geometry of the GL_1 arithmetic quotients X_Q.** For a finite set `Q` of finite places with
`N(v) ≡ 1 mod p^n`, `U_Q = K_∞ × ∏_v U_{Q,v}` (`K_∞ ≅ (S¹)^{r₂}` the identity component of the maximal
compact of `(F ⊗ ℝ)^×`, `U_{Q,v} = 𝒪_v^×` off `Q` and the index-`p^n` subgroup on `Q`) and
`X_Q = F^×\𝔸_F^×/U_QA_∞^0`: every component of `X_Q` is a compact torus `(S¹)^{r₁+r₂−1}`, and
`π₀(X_Q) = F^×\𝔸_F^×/U_Q(F ⊗ ℝ)^{×,0}`, an extension of the narrow class group by a quotient of
`∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n}` (in general not the exponent-`p^n` quotient of the ray class group), the
component of `[x]` going to the class of `x` ([CG], §8.2, p. 79).
*Checks:* An idele of `(F ⊗ ℝ)^{×,0}` lies in the identity component.
*Lean:* in `AdelicExamples.GL1`: `levelQ`, `XQ`, `nonempty_connectedComponent_homeomorph`.

**Canonical logarithmic torus at GL₁ level.** The identity component of `X_Q` is `W/Λ_Q`,
`W = ℝ^{r₁+r₂}/ℝ(1, …, 1)`, `Λ_Q` the image of the totally positive congruence units `F^× ∩ U_{Q,f}`; the
complex circle factors are already divided out by `K_∞` ([CG], §8.2, pp. 78–79).

**The invariant l0 for GL_1.** Every component of `X_Q` has dimension `r₁ + r₂ − 1 =
NumberField.Units.rank F`, Calegari–Geraghty's `l0` for `GL₁/F`, so its cohomology vanishes above that
degree ([CG], §8.2, p. 77). *Needs:* AlgebraicTopology stage 6.

**Degree-zero cohomology of X_Q.** Locally constant functions `X_Q → ℤ_p` form the free module on
`π₀(X_Q)`, by evaluation at a point of each component ([CG], §8.2, p. 79).

**Hecke and diamond operators for GL_1.** For `v ∉ Q` the Hecke operator of `π_v` is right
translation, for `v ∈ Q` a unit gives the diamond translation; each permutes `π₀(X_Q)` by its idele
class and acts on torus cohomology by the identity within the torus factor and that permutation on
components, in every degree ([CG], §8.2, p. 79).

### AA.5.2 GL₂ over ℚ and principal levels

**Integral adelic congruence.** For `N : ℕ` and finite adeles `x, y`, `x ≡ y mod N` means
`x − y ∈ Nℤ̂`; this is equality for `N = 0` (the expression `(x − y)/N ∈ ℤ̂` would accept `(1, 0)` at
`N = 0`).
*Checks:* `1 ≡ 0 mod 1`; `1 ≢ 0 mod 2`.
*Lean:* in `AdelicExamples.GL2`: `Af`, `IsAdelicInteger`, `CongrMod`.

**Raw Möbius action and the Mathlib folded action.** Raw Möbius maps of `GL₂(ℝ)` act on
`ℍ^± = ℂ ∖ ℝ`; folding the lower half-plane by conjugation is equivariant onto `UpperHalfPlane.glAction`,
and the two agree for positive determinant ([Milne], Lemma 5.11, p. 56).
*Checks:* `diag(1, −1)` sends `i` to `−i` in the raw action and fixes `i` in `glAction`.

**GL_2(ℝ) modulo ℝ^× SO(2).** `g ↦ g · i` is an equivariant homeomorphism
`GL₂(ℝ)/ℝ^×SO(2) ≃ ℍ^±`, and `GL₂(ℝ)^+` acts transitively on `ℍ` with stabilizer `ℝ^×SO(2)` at `i`
([Milne], Lemma 5.11, p. 56).

**Congruence groups of the GL₂ components.** For compact open `U ⊂ GL₂(𝔸_f)` and `g ∈ GL₂(𝔸_f)`,
`Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹ ⊂ SL₂(ℚ)` (`det U ⊂ ℤ̂^×`, `ℚ_{>0} ∩ ℤ̂^× = 1`) contains `Γ(M)` when
`K(M) ⊆ gUg⁻¹` and is commensurable with `SL₂(ℤ)`; its real image is arithmetic, a Fuchsian group
with Hausdorff quotient `Γ_{g,U}\ℍ` (the coarse Riemann surface of FuchsianOrbifolds);
`Γ_{qgu,U} = qΓ_{g,U}q⁻¹` with `z ↦ qz` biholomorphic, and `U′ ⊂ U` gives a finite holomorphic map
([Milne], §4, p. 42, Prop. 4.1, p. 43; Lemma 5.13 and remarks, pp. 57–58).
*Checks:* `Γ_{1,GL₂(ℤ̂)} = SL₂(ℤ)`; `−1` lies in the group at principal level `2`, not `3`;
`[[1, 1], [0, 1]] ∈ Γ₀(3) ∩ Γ₁(3)`, `∉ Γ(3)`.
*Lean:* in `AdelicExamples.GL2`: `diag`, `toReal`, `GL2Zhat`, `componentGroup`, `componentGroupReal`,
`isArithmetic_componentGroupReal`.

**The GL_2/ℚ quotient and the upper half-plane.** For `K_∞ = ℝ^×SO(2)` and compact open `U`,
`GL₂(ℚ)\GL₂(𝔸)/K_∞U ≃ ⊔_{c ∈ ℚ_{>0}\𝔸_f^×/det U} Γ_c\ℍ`, `Γ_c = Γ_{g_c,U}` with `det g_c = c`; one
component when `det U = ℤ̂^×`. In the model `GL₂(ℚ)^+\(ℍ × GL₂(𝔸_f)/U)` the map is `[z] ↦ [(z, g_c)]`;
its identification with the level quotient of AA.4.4 sends `[(g_∞, g_f)]`, `det g_∞ > 0`, to
`[(g_∞ i, g_f)]` ([Milne], Lemma 5.13, p. 57).
*Lean:* in `AdelicExamples.GL2`: `ratPos`, `Components`, `levelSetoid`, `LevelSpace`,
`exists_componentHomeomorph`.

**Principal congruence level.** For `N ≥ 1` and `K(N) = ker(GL₂(ℤ̂) → GL₂(ℤ/N))`,
`det K(N) = {x ∈ ℤ̂^× : x ≡ 1 mod N}`, the components are indexed by `(ℤ/N)^×` (through the
determinant reduced mod `N`), and each `Γ_c` is `Γ(N)` for representatives in `GL₂(ℤ̂)` ([Milne],
Lemma 5.13, p. 57).
*Checks:* `N = 1, 2` give one component, `N = 3` two.
*Lean:* in `AdelicExamples.GL2`: `principalLevel`, `componentGroup_principalLevel`,
`nonempty_componentsPrincipalEquiv`.

**Riemann-surface structure and change of level for GL₂ quotients.** The Riemann-surface structures
of the components transport to `X_U` independently of the representatives; `X_{U′} → X_U` is
holomorphic (`z ↦ q⁻¹z` from `Γ_{g′,U′}\ℍ` to `Γ_{g,U}\ℍ` when `g′ = qgu`), `[x, a] ↦ [x, ah]` is a
biholomorphism `X_U → X_{h⁻¹Uh}`; `K₀(N)` (`c ≡ 0`) and `K₁(N)` (`c ≡ 0`, `d ≡ 1`) have determinant `ℤ̂^×`,
so `X_{K₀(N)} ≅ Γ₀(N)\ℍ` and `X_{K₁(N)} ≅ Γ₁(N)\ℍ` are connected, and `X_{K(N)} → X_{K₁(N)} → X_{K₀(N)}` is
`Γ(N)\ℍ → Γ₁(N)\ℍ → Γ₀(N)\ℍ` on the component of `1` ([Milne], Lemma 5.13, p. 57, and p. 58; `π₀` at
principal level, p. 63). *Needs:* FuchsianOrbifolds layers 1, 4 and 5.
*Lean:* in `AdelicExamples.GL2`: `level0`, `level1`, `map_det_level1`.

**GL₂ components for O(2) and SO(2).** At level `K(N)`, `K_∞ = ℝ^×SO(2)` gives the raw space `ℍ^±` with
components `(ℤ/N)^×`, and `K_∞ = ℝ^×O(2)` the folded `ℍ` with components `(ℤ/N)^×/{±1}`; at `N = 3`, two
and one ([Milne], Thm 5.17, pp. 59–61; p. 63).

### AA.5.3 Definite quaternion groups

**Compactness for a definite quaternion algebra.** For `D = ℍ[ℚ, a, b]` with `a, b < 0` (so
`D ⊗ ℝ ≅ ℍ`) and `G = D^×`: `G(ℚ)\G(𝔸)^1` is compact, `D^×\(D ⊗ 𝔸_f)^×/U` is finite for every compact
open `U` (true for every quaternion algebra), each `Γ_{x,U} = D^× ∩ xUx⁻¹` is finite, and `D^×/ℚ^×` is
discrete in `(D ⊗ 𝔸_f)^×/𝔸_f^×` ([Milne], Thm 3.3 and Example 3.4, pp. 33–34).
*Checks:* The Hamilton quaternions over `ℚ` have no element of reduced norm `−1`.
*Lean:* in `AdelicExamples.DefiniteQuaternion`: `Af`, `coeffMap`, `diag`, `stab`, `finite_classes`,
`finite_stab`.

**Volume comparison under level change for a definite quaternion algebra.** For compact open
`U′ ⊂ U`, `Γ_x = (D^× ∩ xUx⁻¹)/(ℚ^× ∩ U)` and `Cl(U) = D^×\(D ⊗ 𝔸_f)^×/U`,
`∑_{x∈Cl(U′)} 1/|Γ′_x| = ([U : U′]/[ℚ^× ∩ U : ℚ^× ∩ U′]) ∑_{x∈Cl(U)} 1/|Γ_x|` ([Arthur], §2, p. 12).

### Examples

`F^×\𝔸_F^1` is compact and `F^×\𝔸_F^×` is not; the `GL₁` quotients `X_Q` are unions of
`(S¹)^{r₁+r₂−1}`; `diag(1, −1)` separates the raw and folded actions; `X_{K(N)}` has `(ℤ/N)^×` components
for `SO(2)` and `(ℤ/N)^×/{±1}` for `O(2)`; definite quaternion stabilizers are finite.

### Dependencies

AA.1–AA.4; Mathlib idele class group, unit lattice, upper half-plane, arithmetic and congruence
subgroups, quaternion algebras; Tau Ceti `G_m` comparison and `IsDedekindDomain.FiniteAdeleRing.integralUnits`;
GlobalNumberFields layers 4 and 6; AlgebraicTopology stage 6; FuchsianOrbifolds layers 0, 1, 4 and 5.

## Downstream consumers

Automorphic forms on reductive groups use the adelic groups, Haar and Tamagawa measures, quotient
integration, the norm-one subgroup and the reduction theory of AA.1–AA.3. Locally symmetric spaces,
Shimura data and Shimura varieties use the neat levels, level quotients, covering maps and Hecke
correspondences of AA.4 and the `GL₂` identification of AA.5.2. The Fourier limits of AA.4.7 apply to
specified compact abelian quotients. Function-field applications use AA.0 unchanged. The `GL₁`
computations of AA.5.1 are the base case for the invariant `l0` in modularity-lifting roadmaps.

## References

- **[Arthur]** J. Arthur, *An introduction to the trace formula*, Clay Math. Proc. 4 (2005).
- **[BGST]** Bakker, Grimm, Schnell, Tsimerman, *Finiteness for self-dual classes in integral
  variations of Hodge structure*, author PDF (2021).
- **[BHC]** A. Borel, Harish-Chandra, *Arithmetic subgroups of algebraic groups*, Ann. of Math. 75 (1962).
- **[BHV]** Bekka, de la Harpe, Valette, *Kazhdan's Property (T)*, manuscript of 23 February 2007.
- **[BKT]** Bakker, Klingler, Tsimerman, *Tame topology of arithmetic quotients and algebraicity of
  Hodge loci*, J. Amer. Math. Soc. 33 (2020); arXiv:1810.04801v2.
- **[BKT erratum]** Bakker, Klingler, Tsimerman, *Erratum*, J. Amer. Math. Soc. 36 (2023), author copy.
- **[Borel]** A. Borel, *Some finiteness properties of adele groups over number fields*, Publ. IHÉS 16 (1963).
- **[Borel–Tits]** A. Borel, J. Tits, *Groupes réductifs*, Publ. IHÉS 27 (1965).
- **[CG]** Calegari, Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 211
  (2018); arXiv:1207.4224v2.
- **[Conrad]** B. Conrad, *Weil and Grothendieck approaches to adelic points*, Enseign. Math. 58
  (2012); author's preprint pagination.
- **[Conrad RGS]** B. Conrad, *Reductive group schemes*, Panor. Synthèses 42–43 (2014); preprint pages.
- **[Dudas–Michel]** O. Dudas, J. Michel, *Lectures on finite reductive groups and their
  representations*, BICMR (2015).
- **[Gordon]** J. Gordon, *Orbital integrals and normalizations of measures*, arXiv:2205.02391v1.
- **[HW]** Harpaz, Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois
  inverse*, J. Amer. Math. Soc. 33 (2020); arXiv:1802.09605v2.
- **[Khayutin]** I. Khayutin, *Joint equidistribution of CM points*, Ann. of Math. 189 (2019);
  arXiv:1710.04557v3 pages.
- **[LT]** Lipnowski, Tsimerman, *How large is A_g(F_q)?*, Duke Math. J. 167 (2018); arXiv:1511.02212v1.
- **[Marzec–Neururer]** J. Marzec, M. Neururer, *L-functions and their applications*, notes (2020), Ch. 5.
- **[Milne]** J. S. Milne, *Introduction to Shimura varieties*, revision of 16 September 2017.
- **[Orr]** M. Orr, *Height bounds and the Siegel property*, arXiv:1609.01315v2.
- **[Orr–Schnell]** M. Orr, C. Schnell, *Correction to the article Height bounds and the Siegel
  property*, Algebra Number Theory 17 (2023).
- **[Platonov]** V. P. Platonov, *The problem of strong approximation and the Kneser–Tits conjecture
  for algebraic groups*, Math. USSR-Izv. 3 (1969); Addendum, ibid. 4 (1970) ([Platonov addendum]).
- **[Platonov–Rapinchuk–Rapinchuk]** Platonov, Rapinchuk, Rapinchuk, *Algebraic Groups and Number
  Theory*, Vol. I, 2nd ed., Cambridge (2023), printed pages.
- **[PR94]** V. Platonov, A. Rapinchuk, *Algebraic Groups and Number Theory*, Academic Press (1994).
- **[Rapinchuk]** A. S. Rapinchuk, *On strong approximation for algebraic groups*, MSRI Publ. 61
  (2014); arXiv:1207.4425 pages.
- **[Rosengarten]** Z. Rosengarten, *Tamagawa numbers and other invariants of pseudo-reductive groups
  over global function fields*, arXiv:1806.10723v3.
- **[Schneider]** P. Schneider, *p-Adic Lie Groups*, Grundlehren 344, Springer (2011).
- **[Stacks]** The Stacks Project, Tags 0245, 04TY, 04SK.
- **[Sutherland]** A. V. Sutherland, *MIT 18.785 Number theory I, Lecture 23*, Fall 2016.

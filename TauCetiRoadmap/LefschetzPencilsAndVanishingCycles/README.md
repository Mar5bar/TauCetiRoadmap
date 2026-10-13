# Roadmap: Lefschetz pencils, nearby cycles and vanishing cycles

**Summary.** This roadmap builds the geometric theory of degenerations in étale cohomology on which Deligne's proofs
of the Weil conjectures, and many arithmetic applications, rest. It constructs nearby and vanishing cycles over a
henselian trait, with their inertia action, the variation, the monodromy operator `N` and the monodromy
filtration; computes them at ordinary quadratic singularities and proves the Picard–Lefschetz formula in both parities,
with the signs fixed and the even-dimensional case in characteristic two given by the even Clifford algebra; constructs Lefschetz pencils and proves that they exist after a
Veronese re-embedding; and proves the global monodromy theorems of a pencil: conjugacy of the vanishing cycles,
generation of monodromy by local transvections, absolute irreducibility of the vanishing quotient, and the
Kazhdan–Margulis theorem that the monodromy is open in the symplectic group. It then proves Gabber's theorems that
nearby cycles commute with duality and preserve perversity, computes nearby cycles, the monodromy filtration and
the weight spectral sequence of semistable curves and strictly semistable degenerations, and builds the geometric
half of Deligne's local and global invariant-cycle theorems, stated in a form whose only remaining hypothesis is the
weight bound that the theory of weights supplies. The end theorems are the Picard–Lefschetz formula (2.8), the
existence of Lefschetz pencils (3.4), the Kazhdan–Margulis theorem (5.8), Gabber's perversity theorems (6.2), the
weight spectral sequence of a strictly semistable degeneration (7a.8) and the invariant-cycle theorems (7b.5, 7b.11).

## Scope and ownership

This roadmap owns:

1. **Nearby and vanishing cycles over a henselian trait** (Layer LPV.0): the topos `X_s ×_s S` and its Galois
   description, the functors `Ψ_η`, `Ψ`, `RΨ`, `RΦ`, the specialization triangle and the variation, functoriality under
   proper, smooth, quasi-finite and trait base change, constructibility over an excellent trait, finite and adic
   coefficients, and the comparison with adic nearby cycles. It also owns two foundational inputs that no lower
   roadmap supplies: the tame character of an arbitrary henselian trait (0.1) and Gabber's absolute cohomological
   purity for regular pairs (0.10).
2. **Inertia and monodromy** (Layer LPV.1): Grothendieck's monodromy theorem for residue fields with no finite
   extension containing all ℓ-power roots of unity and the geometric local monodromy theorem, the twisted operator
   `N`, the monodromy filtration of a nilpotent endomorphism of an object of an abelian category with its primitive
   decomposition and `𝔰𝔩₂` realization, the relative monodromy filtration, `can` and `var`, tame restriction along a
   normal crossings divisor, the two-component semistable complex and the semisimple trace of Frobenius.
3. **Ordinary quadratic singularities and Picard–Lefschetz** (Layer LPV.2): ordinary quadratic forms over any base,
   quadrics and their cohomology, ordinary quadratic points, their henselian normal forms and local equations, and
   the local and global Picard–Lefschetz theory.
4. **Lefschetz pencils and their monodromy** (Layers LPV.3–LPV.5).
5. **Perverse nearby cycles** (Layer LPV.6), **semistable degenerations** (Layer LPV.7a) and **invariant cycles**
   (Layer LPV.7b).

It uses, and does not redevelop:

- étale sites, sheaves of modules, constructible sheaves, derived direct images, smooth and proper base change, local
  acyclicity, compact supports, ℓ-adic realization, the trace formula and Frobenius geometry from the
  CohomologicalPointCounting family of roadmaps, which leaves nearby cycles, `f^!`, Verdier duality and perverse
  sheaves to its successors; SchemeAndStackFoundations Layer 2 states the interface to it used here;
- bounded derived categories with coefficients, `f^!`, Verdier duality, the smooth trace and relative purity, Gysin maps
  and cycle classes over a field, weak Lefschetz, projective bundles and blow-ups, perverse t-structures over a field
  with intermediate extension, and the adic, rational and complex realizations of these operations from
  EtaleDualityAndPerverseSheaves Layers EDC.0–EDC.6;
- the stable enhancement of derived categories with homotopy-coherent cones, coherent diagrams, unbounded derived
  sheaves and derived adic completion from EnhancedDerivedSheaves Layers E0, E1, E3 and E4 (the filtered derived
  categories of 1.9 are built from them here);
- the logarithm of a unipotent automorphism, Grothendieck's monodromy theorem for local fields, and the monodromy
  filtration of a nilpotent endomorphism of a finite-dimensional vector space with its tensor and dual rules from
  ArithmeticGaloisRepresentations Layer 2 (§§2.4, 2.6); function-field Chebotarev from its Layer 5 (§5.13);
- the inertia group and tame character of a nonarchimedean local field from TauCetiRoadmap LocalFieldsRamification
  Layer 4 (the comparison of 0.1 is with it);
- dual graphs, normalization, Rees-algebra blow-ups and the test case `xy = π^n` from TauCetiRoadmap StableReduction
  Layers 1 and 4; the Picard scheme of a semistable curve and Grothendieck's integral monodromy pairing from
  NeronModelsAndSemistableAbelianVarieties Layers 3–4;
- closed subgroups of `ℓ`-adic Lie groups and their Lie algebras from AdelicAlgebraicGroups Layer 4, §4.2;
  orthogonal groups over `ℚ_ℓ` from TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2; the centre of the even Clifford
  algebra over a field in which two is invertible, in every even positive dimension, from Tau Ceti
  (`CliffordAlgebra.adjoinRootEquivCenterEven`; 2.2 states it for every even rank over any base, characteristic two
  included, as the discriminant cover of a quadric needs); root systems, integral lattices, character values and
  `𝔰𝔩₂`-modules from TauCetiRoadmap RepresentationTheory and Completed IntegralLattices; abelian Chebotarev from
  TauCetiRoadmap Chebotarev Layer 9; mixed Hodge structures and strictness from Completed HodgeStructures (layer L2) and
  Tau Ceti's `TauCeti.Hodge.MixedHodgeStructure`;
- the scheme-to-adic comparison of nearby cycles (Huber's theorem) from ClassicalAdicEtaleCohomology Layer 4
  (§§4.4–4.5), and
  tame specialization of fundamental groups from InverseGaloisAndArithmeticFundamentalGroups Layer IG.1.

It leaves to other roadmaps:

- **Weights.** Weil numbers, punctual and mixed weights, the purity theorems of Weil I and Weil II, hard Lefschetz
  and the decomposition theorem are DeligneWeightsAndPurity and EtaleDualityAndPerverseSheaves Layer EDC.7. The
  invariant-cycle theorems of Layer LPV.7b are stated with the outputs of that theory as explicit hypotheses
  (disjointness of two Frobenius spectra, or local surjectivity at the singular members of a pencil); the
  unconditional theorems (Weil II 3.6.1, 6.2.9, 6.2.12) are obtained there by supplying them. Likewise, the even
  orthogonal alternative (5.10) assumes the nondegeneracy that hard Lefschetz provides, and the gcd theorem of
  Weil II 4.5.1 assumes the decomposition of Weil II 4.3.9.
- **Limit mixed Hodge structures** (Steenbrink, Schmid, Clemens) are not built; the complex invariant-cycle theorem
  (7b.6) assumes them in the form it needs.
- **Hyodo–Kato monodromy** belongs to CrystallineCohomology Layer CR.6 and its `B_st` comparison to
  CohomologyComparisons; no comparison of it with the ℓ-adic `N` is made here. The **weight–monodromy conjecture**
  is not stated: 7a.8 constructs the weight spectral sequence without identifying its filtration with the monodromy
  filtration in dimension above one.
- **Nearby cycles over higher-dimensional bases** (oriented products in general, Deligne's local acyclicity over
  general bases) are used only over a trait (0.2).

## Conventions

- **Traits.** `S = Spec R` is a henselian trait with closed point `s`, generic point `η`, geometric points `s̄`, `η̄`
  (`k(η̄)` a separable closure), normalization `S̄`, inertia `I ⊂ Gal(η̄/η)` and wild inertia `P`; `p ≥ 0` is the residue
  characteristic and `ℓ ≠ p` a prime. Finite coefficients `Λ` are torsion rings killed by an integer invertible on `S`;
  `ℤ_ℓ`- and `ℚ_ℓ`-coefficients are derived adic realizations (0.8), never ordinary inverse limits of cohomology.
- **Twists and Frobenius.** `Λ(1) = lim μ_{ℓ^n}`; `t_ℓ : I → ℤ_ℓ(1)` is the tame character, `t_ℓ(σ) mod ℓ^n = σ(π^{1/ℓ^n})/π^{1/ℓ^n}`.
  Frobenius is geometric: it acts on `ℚ_ℓ(1)` by `q⁻¹`, so on `ℚ_ℓ(−1)` by `q`. The monodromy operator is
  `N : V → V(−1)`, characterized by `ρ(σ) = exp(t_ℓ(σ) N)` on an open subgroup of inertia, and satisfies `NF = qFN`.
- **Triangles and directions.** The specialization triangle is `sp^* i^* K → RΨ_η(K_η) → RΦ(K) →` with no shift on `RΦ`;
  specialization goes from the special to the generic fibre. The variation `Var(σ) : RΦ → RΨ` satisfies
  `Var(σ) ∘ can = σ − 1` and `can ∘ Var(σ) = σ − 1`, where `can` is the map `RΨ → RΦ` of the triangle.
- **Picard–Lefschetz.** `(x, δ) = Tr(x ∪ δ)`, with `δ ∈ H^n(X_η̄)(m)` for `n = 2m` or `2m + 1`; the formula is
  `σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ` for `n` odd, and the reflection `x ↦ x + (−1)^{m+1}(x, δ)δ` with `(δ, δ) = (−1)^m · 2` for `n` even
  when `ε(σ) = −1`. For `n ≡ 0, 1, 2, 3 mod 4` the sign is `−, −, +, +` and `(δ, δ) = 2, 0, −2, 0`, as in the complex case.
- **Filtrations.** The monodromy filtration `M` of a nilpotent `N` centred at `c` has `N M_i ⊂ M_{i−2}` and
  `N^r : gr_{c+r} ≅ gr_{c−r}`; primitive parts use the lower convention `P_i = ker(N : gr_i → gr_{i−2})`, `i ≤ c`. Indices of
  monodromy filtrations are labels; no Frobenius weight is attached to them in this roadmap.
- **Perversity.** On a scheme over a field the middle perversity of EDC.5; on a scheme over a trait the glued
  perversity of 6.2, for which `Λ_X[d + 1]` is perverse on `X` smooth of relative dimension `d`. Fibrewise `RΨ` has no shift;
  for a perverse complex on the total space the convention is `RΨ[−1]` and `RΦ[−1]`. The integral perversities `p` and
  `p⁺` are not identified.
- **Lefschetz pencils.** `X ⊂ P = P^N_k` is smooth, connected, projective of dimension `n + 1`, `k` algebraically closed;
  a pencil has axis `A`, parameter line `D ⊂ P̌`, total space `X̃ = Bl_{A∩X} X`, singular set `S ⊂ D`, `U = D − S`, base point
  `u ∈ U`; `E` is the vanishing subspace (not a coefficient field) and `V = E/(E ∩ E^⊥)` the vanishing quotient.
- **Names.** Lean names are relative to the suggested home `TauCeti.AlgebraicGeometry`, in the namespaces
  `VanishingCycles` (Layers LPV.0, LPV.1, LPV.2 local theory, LPV.6), `Quadric` (quadratic forms, quadrics and quadratic
  points), `LefschetzPencil` (Layers LPV.3–LPV.5), `Semistable` (Layer LPV.7a) and `InvariantCycles` (Layer LPV.7b).
  [Suggested.lean](Suggested.lean) states the declarations that can be typed at the pinned libraries, in the
  namespace `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles`; every other target is stated here with its intended
  signature.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- Rings: `HenselianLocalRing`, `HenselianRing`, `IsDiscreteValuationRing`, `ValuationSubring.inertiaSubgroup`,
  `ValuationSubring.decompositionSubgroup`; `MvPowerSeries` with its total-degree order `MvPowerSeries.order`
  (`MvPowerSeries.le_order`, `MvPowerSeries.coeff_of_lt_order`): a series has order at least three, as in 2.4, exactly
  when `3 ≤ MvPowerSeries.order R`; `AdicCompletion` (completed local rings and their jets `O/𝔪^{k+1}`);
  `finite_of_finite_type_of_isJacobsonRing` (the residue field of a closed point of a scheme of finite type over a field
  is finite over it).
- Smoothness and the Jacobian criterion: `Algebra.Smooth`, `Algebra.IsSmoothAt`, `Algebra.IsStandardSmooth` (a
  presentation whose Jacobian is invertible), which is smooth, and `Algebra.IsSmoothAt.exists_notMem_isStandardSmooth`
  (smoothness at a prime is standard smoothness after inverting an element outside it). These are the Jacobian
  criterion of 2.1, 3.2 and 3.4.
- Linear algebra: `QuadraticMap`, `QuadraticMap.polarBilin`, `QuadraticMap.Nondegenerate` (radical zero and polar kernel
  of rank at most one, the characteristic-free notion of 2.1), `CliffordAlgebra.even`, `Subalgebra.center` (the centre
  `Z(Q)` of 2.2 is `Subalgebra.center A (CliffordAlgebra.even Q)`, with no separate name), `LinearMap.BilinForm`,
  `LinearMap.BilinForm.orthogonal`, `LinearMap.IsAlt`, `LinearMap.transvection`, `LinearEquiv.transvection`,
  `LinearEquiv.mem_fixedSubmodule_transvection_iff` (fixed space of a transvection with `f v = 0`), `IsNilpotent.exp`,
  `Module.End.HasEigenvalue`, `Module.End.maxGenEigenspace`, `Submodule.mkQ`, `LinearMap.codRestrict`,
  `Representation.invariants`, `Representation.trivial`.
- Lie theory: `skewAdjointLieSubalgebra` (the symplectic Lie algebra `𝔰𝔭(V, ψ)`), `LieModule.IsIrreducible`, `IsSl2Triple`.
- Geometry and homological algebra: `AlgebraicGeometry.Scheme`, the morphism classes `AlgebraicGeometry.IsProper`,
  `AlgebraicGeometry.IsIntegral`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.QuasiCompact`,
  `AlgebraicGeometry.IsOpenImmersion`, `AlgebraicGeometry.SmoothOfRelativeDimension`,
  `AlgebraicGeometry.Scheme.Hom.isClosedMap` (a universally closed, in particular proper, morphism has closed image),
  `IsGenericPoint`, `AlgebraicGeometry.Scheme.smallEtaleTopology`, `CategoryTheory.IsPullback`, `DerivedCategory`,
  `HasDerivedCategory.standard`, `CategoryTheory.shiftFunctor`, `CategoryTheory.Abelian.SpectralObject` and its
  `spectralSequence`, `CategoryTheory.CohomologicalSpectralSequence`, `ModuleCat`.

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

- `TauCeti.genericFiber`, `TauCeti.specialFiber` (`TauCeti/AlgebraicGeometry/Fibers.lean`): the generic and special
  fibres of a scheme over `Spec R` as over-schemes; the trait diagram of 0.1 is built on them.
- `LinearMap.GeneralLinearGroup.IsUnipotent` (`TauCeti/LinearAlgebra/GeneralLinearGroup/Unipotent.lean`) and
  `TauCeti.exp_smul_eq_sum_smul_dividedPower` (`TauCeti/RingTheory/Nilpotent/Exp.lean`).
- `TauCeti.inertiaTameCharacter` (`TauCeti/NumberTheory/LocalField/Tame/Character.lean`): the tame character
  `I_K → ℤ̂^{(p')}(1)` of a nonarchimedean local field, the Kummer character of a uniformizer; 0.1 compares with it
  (`VanishingCycles.tameCharacter_eq_inertiaTameCharacter`).
- `CliffordAlgebra.center_even_eq_adjoin_volume`, `CliffordAlgebra.adjoinRootEquivCenterEven` and
  `TauCeti.CliffordAlgebra.exists_mem_center_even_forall_ne_algebraMap`
  (`TauCeti/LinearAlgebra/CliffordAlgebra/Even/Center.lean`): over a field with `2 ≠ 0` and in even positive dimension,
  the centre of the even Clifford algebra is `K[X]/(X² − d)`, `d` the signed discriminant, generated by the volume
  element. This is the field case of 2.2 when two is invertible; 2.2 adds characteristic two and a general base.
- `TauCeti.Hodge.MixedHodgeStructure` (`TauCeti/Geometry/Hodge/Mixed/Basic.lean`) with strictness, used in 7b.6.

### From other roadmaps

- **CohomologicalPointCounting**: ConstructibleEtale Layer 3 (finite étale Galois category, paths, monodromy, the
  Galois description of sheaves on a field) and Layer 6 (roots of unity and Tate twists); EtaleBaseChange Layers 0–2
  (small étale sites, direct images, Leray), 3 (base-change transformation), 4 (smooth base change), 5 (proper base
  change), 6 (cohomological dimension, affine Artin vanishing, finiteness), 7 (local acyclicity), 8
  (lisse direct images and transport along paths); CompactSupport Layer 5; EllAdicRealization Layers 1–2 and 7;
  ComplexComparison Layers 8, 10 and 12 (Riemann existence, Artin comparison, relative comparison); TraceFormula Layers
  7, 8, 11 and 12 (finite étale and curve trace formulas, Grothendieck–Lefschetz, point counting); FrobeniusGeometry
  Layers 3–5.
- **EtaleDualityAndPerverseSheaves**: EDC.0 (bounded constructible categories with coefficients, cohomology with
  supports as the localization fibre, coefficient change), EDC.1 (`f^!`, local cohomology, Verdier duality and biduality), EDC.2
  (smooth trace, relative purity, Poincaré duality and the cup-product trace pairing), EDC.3 (the purity isomorphism
  `i^!Λ ≅ Λ(−c)[−2c]` and Gysin maps, which with the localization triangle of EDC.0 give the Gysin sequence; cycle
  classes and the self-intersection formula, for smooth pairs over a field), EDC.4 (weak Lefschetz, projective
  bundles and so the cohomology of projective space, blow-ups along smooth centres), EDC.5 (middle perverse
  t-structures over a field, gluing, intermediate extension, integral perversities), EDC.6 (adic, rational and complex
  realizations of the operations).
- **EnhancedDerivedSheaves**: E0 (the stable enhancement of derived categories, homotopy-coherent cones and their
  sign conventions), E1 (unbounded derived sheaves), E3 (coherent diagrams, Kan extensions and adjoints), E4
  (derived adic completion).
- **SchemeAndStackFoundations**: Layer 0 (§0.8 smoothness, étale coordinates and quasi-sections; §0.9 limits of
  schemes and spreading out of finitely presented data; §§0.12–0.14 henselization of pairs and henselian pairs, with
  Elkik's smooth lifting; §0.21 regular and excellent rings and schemes); Layer 1 (§1.1 descent of quasi-coherent
  modules); Layer 2 (sites and scheme cohomology: the interface to CohomologicalPointCounting); Layer 3 (§3.2
  `scheme_riemann_hurwitz`, which gives `π_1(P¹_k) = 1` over an algebraically closed field; §§3.4 and 3.7, Picard
  groups and Picard functors).
- **TauCetiRoadmap ModularCurves** Layer 4D (strict henselization and completion of strict henselizations, regular
  schemes and completion of noetherian local rings).
- **TauCetiRoadmap StableReduction** Layer 1 (nodes, local equations `uv = π^n`, normalization, oriented dual
  multigraphs) and Layer 4 (Rees-algebra blow-ups, the test case `xy = π^n`). The oriented dual graph is
  `TauCetiRoadmap.StableReduction.DualGraph`, an edge `e` having tail `endpoint e 0` and head `endpoint e 1`;
  [Suggested.lean](Suggested.lean) imports it and defines the normalization differential of 7a.1 on it.
- **TauCetiRoadmap EllipticCurves** Layer 4 (Tate's algorithm, multiplicative reduction).
- **TauCetiRoadmap LocalFieldsRamification** Layer 4 (inertia, wild inertia and the tame character of a local field).
- **AdelicAlgebraicGroups** Layer 4, §4.2 (closed subgroups of `p`-adic Lie groups, their Lie algebras, openness).
- **TauCetiRoadmap OrthogonalSpinGroups** Layers 0 and 2 (orthogonal groups over a general field and over `ℚ_p`, their
  topology and closedness).
- **TauCetiRoadmap Chebotarev** Layer 9 (abelian Chebotarev).
- **TauCetiRoadmap RepresentationTheory**: CharacterTheory Layer 4, LieHighestWeight Layer 0 (`𝔰𝔩₂`-modules,
  Clebsch–Gordan), RootSystems Layer 5 (the Cartan–Killing classification, whose simply laced types are A, D and E).
- **Completed IntegralLattices** Layer 1 and **Completed HodgeStructures** layer L2 (mixed Hodge structures and
  strictness).
- **ClassicalAdicEtaleCohomology** Layer 4 (§4.4 formal completion and Huber's comparison `i^*Rj_* ≅ Rb_*a^*` for
  torsion coefficients; §4.5 the trait comparison, the inertia-equivariant identification of formal nearby cycles
  with `RΨ` of 0.5).
- **AlgebraicModuliForArithmeticGeometry** Layer 1 (§1.1 projective bundles, §1.3 Grassmannians, §1.4 relative very
  ampleness and the classifying map `ProjectiveBundles.IsRelativelyVeryAmple.completeMap`, from which 3.4 builds
  the Veronese embeddings) and Layer 6 (Artin approximation).
- **InverseGaloisAndArithmeticFundamentalGroups** Layer IG.1 (§IG.1.2 tame fundamental groups of curves;
  §IG.1.3 tame specialization).
- **ArithmeticGaloisRepresentations** Layer 2 (§2.3 tame characters of local fields, §2.4 unipotent logarithm and
  Grothendieck's monodromy theorem for local fields, §2.6 monodromy filtration of a nilpotent on a vector space) and
  Layer 5 (§5.13 Chebotarev for function fields of curves over finite fields).
- **ArithmeticGaloisDuality** Layers R02.1 (continuous cochains, inverse limits, lattices) and R02.2 (Hochschild–Serre).
- **NeronModelsAndSemistableAbelianVarieties** Layer 1 (§1.7 smoothening), Layer 3 (§§3.8–3.9 Picard schemes of
  semistable curves) and Layer 4 (§§4.1–4.4 normalization sequence, characters as graph cycles, the integral monodromy
  pairing and its graph formula).
- **AbelianSchemesAndArithmeticModuli** Layer A4 (§A4.1 Tate modules and their duality pairing).
- **ComplexComparisonPartII** Layer C5 (Betti and de Rham–Betti comparison for analytic families).

## How to read the build

| Layer | Content | End results |
| --- | --- | --- |
| LPV.0 | Nearby and vanishing cycles over a henselian trait | `RΨ`, `RΦ`, variation, constructibility, absolute purity |
| LPV.1 | Inertia and monodromy | local monodromy theorem, `N`, monodromy filtration, semisimple trace |
| LPV.2 | Ordinary quadratic singularities | cohomology of quadrics, Picard–Lefschetz formula |
| LPV.3 | Lefschetz pencils | existence after a Veronese embedding, descent to finite fields |
| LPV.4 | Global vanishing cycles | vanishing subspace, radical quotient and its pairing |
| LPV.5 | Global monodromy | conjugacy, generation, irreducibility, middle-degree reduction, Kazhdan–Margulis |
| LPV.6 | Perverse nearby cycles | Gabber's duality and perversity theorems |
| LPV.7a | Semistable degenerations | monodromy of nodal curves, weight spectral sequence |
| LPV.7b | Invariant cycles | local and global invariant-cycle theorems |

Layer LPV.0 builds the functors; Layer LPV.1 extracts the linear algebra of inertia; Layer LPV.2 is the local theory at
an ordinary quadratic point, and uses the semistable calculation of 1.9 for the odd-dimensional sign. Layers LPV.3–LPV.5
are the global theory of a pencil: LPV.3 is geometry, LPV.4 linear algebra of the vanishing cycles on one fibre, LPV.5
the monodromy theorems, which need the conjugacy and generation results before the middle-degree reduction can be
stated. Layer LPV.6 depends only on LPV.0–LPV.2. Layer LPV.7a uses LPV.0–LPV.2 and LPV.6; Layer LPV.7b uses LPV.0,
LPV.3, LPV.5 and LPV.7a. Each target names its sources by section, statement and page, and its inputs, in a final
*Needs:* clause; numbers such as 2.8 refer to the subsections of this roadmap.

## Layer LPV.0: Nearby and vanishing cycles over a henselian trait

This layer constructs the nearby-cycle functor of a scheme over a henselian trait on the actual
étale sites, its derived functor `RΨ`, the vanishing cycles `RΦ`, the specialization triangle and
the variation, and proves the standard functorialities: proper and smooth base change, finite
coefficient change, change of trait, constructibility, and passage to `ℤ_ℓ`- and `ℚ_ℓ`-coefficients.
It also contains the two foundational inputs that subsequent layers need and that no lower roadmap
supplies: the tame character of an arbitrary henselian trait and absolute cohomological purity
for regular pairs. Everything is built from the étale sites, sheaves of modules, derived direct
images and base-change maps of CohomologicalPointCounting and the bounded derived categories of
EtaleDualityAndPerverseSheaves Layer EDC.0.

### 0.1 Henselian traits, inertia and the tame character

**Henselian traits.** A henselian trait is `S = Spec R` for a henselian discrete valuation ring
`R`, with closed point `s`, generic point `η`, a chosen separable closure `k(η̄)` of `k(η)` (the
geometric generic point `η̄`), the normalization `S̄` of `S` in `k(η̄)`, its closed point `s̄` and the
inclusions `j̄ : η̄ → S̄`, `ī : s̄ → S̄`. Because `R` is henselian the valuation extends uniquely to
`k(η̄)`, so `S̄` is local, and the residue field `k(s̄)` is an algebraic closure of `k(s)` that may be
purely inseparable over the separable closure `k(s)^sep`. The inertia group `I` is the kernel of
the specialization map `Gal(η̄/η) → Gal(s̄/s)`, a closed normal subgroup, and the specialization map
is surjective (Stacks 09ED applied to every finite Galois subextension, and the henselian property
for the limit). Define `VanishingCycles.HenselianTrait` as this structure, with the generic and
special fibres of an `S`-scheme taken as Tau Ceti's `TauCeti.genericFiber` and
`TauCeti.specialFiber`. Sheaves on `Spec k` are continuous `Gal(k^sep/k)`-sets, by the Galois
description of CohomologicalPointCounting/ConstructibleEtale Layer 3.

- `VanishingCycles.HenselianTrait`: A henselian trait S = Spec R with closed point s, generic point η, a geometric generic point η̄, the geometric closed point s̄ and S̄ = Spec of the normalisation of R in k(η̄).
- `VanishingCycles.HenselianTrait.inertia`: I = ker(Gal(η̄/η) → Gal(s̄/s)), a closed normal subgroup.
- `VanishingCycles.HenselianTrait.inertia_exact`: 1 → I → Gal(η̄/η) → Gal(s̄/s) → 1 is exact; surjectivity uses that R is henselian.
- `VanishingCycles.HenselianTrait.genericFiber`: The trait-indexed generic fibre is TauCeti.genericFiber, with its canonical pullback projection.
- `VanishingCycles.HenselianTrait.specialFiber`: The trait-indexed closed fibre is TauCeti.specialFiber over the residue field.

The fibre squares `X_η̄ → X_{S̄} ← X_s̄` induce the inverse- and direct-image adjunctions between the
small étale sites (Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`, through
CohomologicalPointCounting/EtaleBaseChange Layer 0), and `Gal(η̄/η)` acts on `ī^*Rj̄_*` by transport
of structure, coherently for identities and composites. The open map is `j̄` over `S̄`: replacing
it by `j : η → S` loses the inertia action. (SGA 7 II, Exposé XIII, 0.2.5, p. 5 and Rappel 1.1.3,
p. 7; Illusie 2006, §1.1, pp. 1–2.)

**Checks.**

- `VanishingCycles.inertia_eq_top_of_strictlyHenselian`: If R is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η).
- `VanishingCycles.inertia_puiseux`: For R the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n.
- `VanishingCycles.inertia_eq_valuation_inertia`: I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over R, as a subgroup of the decomposition group, which here is all of Gal(η̄/η).
- `VanishingCycles.wild_inertia_ne_bot`: For R the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients.
- For Y = Spec k the equivalence recovers Gal(k̄/k)-sets.
- For `X = S` the geometric nearby stalk is the generic representation, not its inertia
  invariants; using `j` in place of `j̄` changes the answer.

**The tame character.** Let `p ≥ 0` be the characteristic of `k(s)` and `ℓ ≠ p` a prime. For
every finite Galois extension `L/k(η)` inside `k(η̄)`, Stacks 09EE and 0BU4 give the wild inertia
`P_L` (a `p`-group, trivial when `p = 0`) and the tame character `θ_L : I_L/P_L ≅ μ_e(k(s̄))`, with
`e` the prime-to-`p` part of the ramification index. Define the wild inertia `P ⊂ I` as the inverse
limit of the `P_L` and the tame character `t_ℓ : I → ℤ_ℓ(1) = lim μ_{ℓ^n}(k(s̄))` as the inverse
limit of the ℓ-power parts of the normalized characters `θ_{L,can}` of Stacks 0BU8. Prove:

- `VanishingCycles.tameCharacter_kummer`: for a uniformizer `π` and `σ ∈ I`, `t_ℓ(σ) mod ℓ^n` is
  `σ(π^{1/ℓ^n})/π^{1/ℓ^n}`, and this does not depend on `π` or on the chosen root;
- `VanishingCycles.tameCharacter_surjective`: `t_ℓ` is surjective and continuous, with kernel
  containing `P`, and `I/P ≅ ∏_{ℓ' ≠ p} ℤ_{ℓ'}(1)`;
- `VanishingCycles.tameCharacter_conj`: `t_ℓ(gσg⁻¹) = g · t_ℓ(σ)` for `g ∈ Gal(η̄/η)` acting on
  `ℤ_ℓ(1)` through `Gal(s̄/s)` (Stacks 0BU5);
- `VanishingCycles.tameCharacter_restrict`: for a finite extension of henselian traits with
  ramification index `e` and inertia `I' ⊂ I`, `t_ℓ|_{I'} = e · t'_ℓ`: write `π = uπ'^e` with `u` a unit
  and apply the Kummer description above, the roots of `u` being fixed by `I'` (the finite-level
  characters are compatible in towers by Stacks 0BU7);
- `VanishingCycles.tameCharacter_eq_inertiaTameCharacter`: when `R` is the valuation ring of a
  nonarchimedean local field, `t_ℓ` is the `ℓ`-component of Tau Ceti's prime-to-`p` tame character
  `TauCeti.inertiaTameCharacter`, the tame character of LocalFieldsRamification Layer 4 and
  ArithmeticGaloisRepresentations Layer 2, §2.3.

(Stacks Project, Section 15.114, Lemma 09EE, Definition 0BU4, Lemma 0BU5, Lemma 0BU7, Remark 0BU8.)
*Needs:* Mathlib `HenselianLocalRing`, `IsDiscreteValuationRing`, `ValuationSubring.inertiaSubgroup`;
Tau Ceti `TauCeti.genericFiber`, `TauCeti.specialFiber`; CohomologicalPointCounting/ConstructibleEtale
Layer 3 and EtaleBaseChange Layer 0; Tau Ceti `TauCeti.inertiaTameCharacter` and ArithmeticGaloisRepresentations
Layer 2 (decomposition and inertia groups of local fields, for the comparison only).

**Checks.**

- `tameCharacter_puiseux`: for `R` the henselization of `k[t]` at `(t)` with `k` algebraically
  closed of characteristic 0, `I = Gal(η̄/η)` and `t_ℓ` is the ℓ-component of the isomorphism
  `I ≅ Ẑ(1)` given by the action on the roots `t^{1/n}`.
- `tameCharacter_restrict_quadratic`: for `R' = R[π^{1/2}]` with `p ≠ 2`, `e = 2` and `t_ℓ` restricted
  to `I'` is twice the new character; a definition that ignored `e` would fail this.
- `tameCharacter_wild`: for `R` the henselization of `𝔽̄_p[t]` at `(t)`, every element of `P`
  has `t_ℓ = 0`, while `P` is nonzero (Artin–Schreier extensions).

### 0.2 The topos `Y ×_s S` and its galoisian description

**The gluing topos.** For a henselian trait `S` and a scheme `Y` over `s`, construct the
2-fibre product of étale topoi `T = Y_et ×_{s_et} S_et`. On the geometric closed fibre `Ȳ` an object
of `T` is a triple `(F_s, F_η, φ)`: a sheaf `F_s` with continuous `Gal(s̄/s)`-action, a sheaf `F_η`
with continuous `Gal(η̄/η)`-action, and a `Gal(η̄/η)`-equivariant map `φ : F_s → F_η`, where the action
on `F_s` is inflated along specialization. The generic part `Y_et ×_{s_et} η_et` is an open subtopos
with closed complement `Y_et`; projection to `Y` is `F ↦ (F, F, id)` and generic restriction selects
`F_η`. For `Y = s` this gluing category is equivalent to `S_et`, and the gluing map lands in the
inertia invariants `F_η^I`. Henselian specialization identifies the finite étale covers of `S` and
of `s`, and gives `sp_*F = i^*F`, `sp_*j_*G = i^*j_*G`. The construction is independent of the
separable closure up to canonical equivalence, has conservative families of points `(x, s̄)` and
`(x, η̄)`, and is functorial for quasi-compact maps in `Y` and surjective maps of traits; for a finite
trait extension the direct image is induction of the generic Galois action. Extension by zero along
locally closed immersions and proper-support pushforward along separated maps of finite type have
their usual descriptions on triples, and for abelian sheaves the right adjoint `f^!` of `f_!` exists
for quasi-finite `f` and is `f^*` for `f` étale. A reader may take the triple description as the
definition. When `k(s)` is not separably closed the 2-product is fibred over `Spec(k(s))_et`.

Define `VanishingCycles.OrientedFibreTopos` as the category of triples, with:

- `VanishingCycles.OrientedFibreTopos`: For Y over s, the category of triples (F_s, F_η, φ): F_s a sheaf on Y (a Gal(s̄/s)-sheaf on Ȳ), F_η a continuous Gal(η̄/η)-sheaf on Ȳ, φ : F_s → F_η equivariant (XIII 1.2.4).
- `VanishingCycles.OrientedFibreTopos.sp_pullback`: sp^* : sheaves on Y → sheaves on Y ×_s S, F ↦ (F, F, id).
- `VanishingCycles.OrientedFibreTopos.etaPart`: The restriction to Y ×_s η, (F_s, F_η, φ) ↦ F_η.
- `VanishingCycles.OrientedFibreTopos.equivSheavesOnTrait`: For Y = s, sheaves on S ≌ triples (F_s̄, F_η̄, φ : F_s̄ → F_η̄^I) (XIII 1.2.2).

*Proof sketch.* The henselian equivalence of finite étale covers of `S` and `s` gives specialization
and its Galois quotient. Open–closed recollement on the trait shows the closed sheaf maps into
inertia invariants, and base change along `Y_et → s_et` gives the general gluing. Changes of
separable closure are handled by conjugate Galois descent. (SGA 7 II, Exposé XIII, Construction
1.2.4, p. 10, and 1.2.2(b), p. 9.) *Needs:* 0.1; CohomologicalPointCounting/ConstructibleEtale
Layer 3.

**Checks.**

- `VanishingCycles.equivSheavesOnTrait_constant`: The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially.
- `VanishingCycles.equivSheavesOnTrait_jPushforward`: j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion).
- `VanishingCycles.equivSheavesOnTrait_degenerate`: For Y = ∅ the category is the terminal one.
- `VanishingCycles.not_triple_of_noninvariant`: For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants.
- A sheaf on Y ×_s S restricted to the closed Y is F_s and to the open Y ×_s η is F_η; sp^*(F_s) = (F_s, F_s, id).
- Points (x, s̄) and (x, η̄) form conservative families (1.2.5).

**The oriented product.** The oriented product `X_s ←×_S η` has as points triples of a geometric
point `x` of `X_s`, a geometric generic point and a specialization path; its derived nearby stalk at
`x` is `RΓ(X_(x) ×_{S_(f(x))} η̄, K)`. For a trait the oriented product is identified with the generic
part of `X_s ×_s S`, carrying the same specialization and inertia action. The whole gluing topos has
a special and a generic part and is not identified with its generic part alone. For a base of higher
dimension no base-change or constructibility statement is made here. *Proof sketch.* Use the site of
triples `U → V ← W` with its covering families, describe its points by specialization paths,
identify the strict-local tube, and compare the universal gluing maps on a trait with XIII 1.2–1.3.
(Illusie 2006, §§2.1–2.3, pp. 3–5, especially 2.2.3 and 2.3.4.) *Needs:* this subsection; 0.1;
EnhancedDerivedSheaves Layer E1 (derived sheaves on the oriented site); TauCetiRoadmap ModularCurves
Layer 4D (strict henselization).

**Checks.**

- The specialization arrow runs from the special stalk to the generic nearby stalk.
- For the identity map of a field the vanishing cycles are zero.

### 0.3 The functors `Ψ_η` and `Ψ`

Fix `X → S` over a henselian trait, its geometric normalization `S̄` and the inclusions
`j̄ : X_η̄ → X_{S̄}`, `ī : X_s̄ → X_{S̄}`. For a sheaf `G` on `X_η` define
`VanishingCycles.psiEta G = ī^* j̄_* G_η̄`, a sheaf on `X_s̄` with continuous `Gal(η̄/η)`-action compatible
with the action on `X_s̄`. For a sheaf `F` on `X` define `VanishingCycles.psi F` as the triple
`(F_s, Ψ_η(F_η), sp_F)` in `X_s ×_s S`, where `sp_F` comes from the unit `F → j_*j^*F`. Both functors are
left exact; `Ψ` is not the direct image of a morphism of topoi. For an `S`-morphism `f` construct the
base-change maps `Ψ f_* → f_* Ψ` and `f^* Ψ → Ψ f^*`; the first is an isomorphism when `f` is proper,
and for `X' = S` it identifies sections over the geometric generic fibre with sections of the nearby
sheaf. For quasi-finite `f` construct `f_! Ψ → Ψ f_!` and `Ψ f^! → f^! Ψ`, inverse to the direct-image
map for `f` finite and to the inverse-image map for `f` étale. A map of henselian traits has its
inverse-image comparison. All of this is on the actual sites, for sheaves of sets (pointed sets for
`f_!`).

- `VanishingCycles.psiEta`: Ψ_η(F) = ī^* j̄_* F_η̄, a continuous Gal(η̄/η)-sheaf on X_s̄ (XIII 1.3.2.2).
- `VanishingCycles.psi`: Ψ(F) = (F_s, Ψ_η(F_η), φ) on X_s ×_s S, φ from F → j_*j^*F (XIII 1.3.3).
- `VanishingCycles.psi_leftExact`: Ψ and Ψ_η are left exact.
- `VanishingCycles.psi_pushforward`: The base-change map Ψ f_* → f_* Ψ, an isomorphism for f proper (XIII 1.3.6).

*Proof sketch.* `Ψ_η` is pullback to `η̄`, direct image to `X̄` and restriction to `X_s̄`, with the Galois
action by transport of structure; the triple is assembled from the adjunction unit, and the
functorialities come from the base-change maps of CohomologicalPointCounting/EtaleBaseChange
Layer 3, proper base change being its Layer 5. (SGA 7 II, Exposé XIII, 1.3.1–1.3.3, p. 13, and
1.3.6, p. 15.) *Needs:* 0.1, 0.2; EtaleDualityAndPerverseSheaves Layer EDC.0;
CohomologicalPointCounting/EtaleBaseChange Layers 3 and 5.

**Checks.**

- `VanishingCycles.psiEta_trait`: For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action.
- `VanishingCycles.psiEta_ne_invariants`: For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action.
- `VanishingCycles.psiEta_smooth_constant`: For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains.
- `VanishingCycles.psi_proper_pushforward_id`: For f = id the base-change map is the identity.
- For X = S, Ψ_η(F) is the Gal(η̄/η)-set F_η̄ viewed over s̄ and Ψ(F)_s = F_s with φ: F_s -> F_η̄^I.

### 0.4 Vanishing cycles of a triple and the variation

Let `K` be a complex of `A`-modules in the gluing topos `Y_et ×_{s_et} S_et`, with closed part `K_s`,
generic part `K_η` and specialization `φ : K_s → K_η`. Replace `K` by a homotopy-equivalent
representative whose specialization `φ'` is injective and split in each degree (a mapping-cylinder
replacement), and define `Φ(K)` as its cokernel. This gives the distinguished triangle
`sp^*K_s → K_η → Φ(K) →`, independent of the representative, and its cohomology sequence. Inertia acts
trivially on the image of the closed part, so for `σ ∈ I` the map `σ − 1` on `K'_η` factors through the
quotient `q : K'_η → Φ(K)`. The resulting **variation** `VanishingCycles.variation σ : Φ(K) → K_η`
satisfies

```text
Var(σ) ∘ q = σ − 1  on K_η,      q ∘ Var(σ) = σ − 1  on Φ(K),
Var(στ) = Var(σ) ∘ q ∘ Var(τ) + Var(σ) + Var(τ).
```

The variation is a morphism of the derived category, independent of the chosen representative; the
uniqueness of a degree-zero factor of `σ − 1` through the cokernel is a separate, weaker statement. `A`
is a ring or a sheaf of rings on `Y`.

- `VanishingCycles.variation`: Var(σ) : Φ(K)_η → K_η for σ ∈ I and K a complex on Y ×_s S, defined on a representative with φ' injective (XIII 1.4.3).
- `VanishingCycles.variation_left`: σ = 1 + Var(σ) ∘ q on K_η.
- `VanishingCycles.variation_right`: σ = 1 + q ∘ Var(σ) on Φ(K)_η.
- `VanishingCycles.variation_mul`: Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ).
- `VanishingCycles.variation_wellDefined`: Var(σ) depends only on K in the derived category, not on the representative K'.
- `VanishingCycles.variation_unique`: The degree-zero cokernel factor of σ − 1 is uniquely characterized by its composite with the quotient map; independence of the derived representative is `variation_wellDefined`.

*Proof sketch.* The cone replacement gives an injective, degreewise split specialization whose
quotient realizes the cone. Trivial inertia on the closed image makes `σ − 1` vanish there; factor it
and compute the two composites and the product rule directly. Homotopy-compatible replacements and
localization give independence of the representative. (SGA 7 II, Exposé XIII, 1.4.3 and formulas
(1.4.3.2)–(1.4.3.4), p. 17.) *Needs:* 0.1, 0.2; EnhancedDerivedSheaves Layer E0 (homotopy-coherent
cones).

**Checks.**

- `VanishingCycles.variation_one`: Var(1) = 0.
- `VanishingCycles.variation_of_phi_zero`: If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q.
- `VanishingCycles.variation_picardLefschetz`: At an ordinary quadratic point in odd relative dimension n = 2m + 1, Var(σ)(a) = (−1)^{m+1} t_ℓ(σ)(a, δ)δ, which over rational coefficients is nonzero when t_ℓ(σ) ≠ 0, (a, δ) ≠ 0 and δ ≠ 0 (XV 3.3).
- `VanishingCycles.variation_ne_sub_one`: Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s.
- The variation determines the inertia action on K_η through 1.4.3.2; the cocycle rule 1.4.3.4 is the algebraic analogue of the classical variation.

### 0.5 `RΨ`, `RΦ`, the vanishing triangle and Milnor fibres

Let `X` be a scheme over a henselian trait `S` and `A` a torsion ring whose torsion is prime to the
residue characteristic (or a sheaf of such rings). Derive `Ψ` and `Ψ_η` on bounded-below complexes:
`VanishingCycles.RPsi : D⁺(X, A) → D⁺(X_s ×_s S, A)` has closed part `i^*K` and generic part
`RΨ_η(K_η)`, which on the geometric closed fibre is `ī^* Rj̄_* K_η̄`. Define
`VanishingCycles.RPhi K = Φ(RΨ K)`. The specialization triangle is

```text
sp^* i^* K  →  RΨ_η(K_η)  →  RΦ(K)  →
```

with no shift on `RΦ`, and the variation of 0.4 maps `RΦ` back to nearby cycles. At a geometric point
`x̄` of `X_s` the stalk of `R^iΨ(K)` is `H^i(X_(x̄) ×_{S^nr} η̄, K)`, the cohomology of the geometric
Milnor fibre, with `X_(x̄)` and `S^nr` the strict henselizations. `(X, K)` is locally acyclic over `S`
exactly when `RΦ(K) = 0`; in particular `RΦ` vanishes on a smooth locus where the cohomology sheaves of
`K` are locally constant. This last statement compares the nearby-cycle formulation with the
local-acyclicity predicate of CohomologicalPointCounting/EtaleBaseChange Layer 7, which defines
local acyclicity without nearby cycles.

- `VanishingCycles.RPsi`: RΨ : D⁺(X, A) → D⁺(X_s ×_s S, A), the right derived functor of Ψ, with RΨ(K)_s = i^*K and RΨ(K)_η = RΨ_η(K_η) (XIII 2.1.2).
- `VanishingCycles.RPhi`: RΦ(K) = Φ(RΨ(K)), in D⁺(X_s ×_s η, A).
- `VanishingCycles.vanishingTriangle`: The distinguished triangle sp^* i^*K → RΨ_η(K_η) → RΦ(K) → (XIII 2.1.2.4).
- `VanishingCycles.RPsi_stalk`: R^iΨ(K)_(x̄, η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K), the cohomology of the geometric Milnor fibre (XIII 2.1.4).
- `VanishingCycles.RPhi_eq_zero_iff_locallyAcyclic`: (X, K) is locally acyclic over S if and only if RΦ(K) = 0 (XIII 2.1.5); for f smooth and K constant it holds.

*Proof sketch.* Derive on injective resolutions: open restriction preserves injectives and geometric
pullback has the needed acyclicity, so the closed and generic parts are as stated. Apply the cone
and variation construction of 0.4. Compute a geometric stalk by strict localization and the stalk
theorem for direct images. Smooth local acyclicity of locally constant coefficients is
EtaleBaseChange Layer 7. (SGA 7 II, Exposé XIII, 2.1.1, p. 17; Proposition 2.1.4 and Reformulation
2.1.5, p. 19.) *Needs:* 0.2, 0.3, 0.4; EtaleDualityAndPerverseSheaves Layer EDC.0;
EnhancedDerivedSheaves Layer E0; CohomologicalPointCounting/EtaleBaseChange Layers 1–2 and 7.

**Checks.**

- `VanishingCycles.RPhi_smooth`: For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ.
- `VanishingCycles.RPsi_trait`: For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action.
- `VanishingCycles.RPhi_node`: For X = Spec R[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1).
- `VanishingCycles.specialization_direction`: For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle.
- For a smooth family with locally constant coefficients RΦ = 0 and sp^*i^*K ≅ RΨ_η(K_η).
- For a disjoint union, RΨ is computed componentwise (functoriality in X); for a nodal curve over a trait the stalk formula at the node gives the cohomology of the Milnor fibre (an annulus), as in SGA 7 XV §2.

### 0.6 Functoriality and the specialization sequence

**Theorem (functoriality of `RΨ`).** For a separated morphism of finite type `g` over a henselian
trait, construct the natural exchange maps of `RΨ` with `g^*`, `Rg_*` and `Rg_!`. The `Rg_*` exchange is an
isomorphism for `g` proper and the `g^*` exchange for `g` smooth. For `g` quasi-finite construct the
`Rg^!` exchange, an isomorphism for `g` étale; exchange with `Rg^!` for general separated maps of finite
type is not part of this theorem. A dominant map of henselian traits with compatible geometric points
gives an isomorphism after restricting the inertia action. For `f : X → S` proper, the specialization
triangle gives the inertia-equivariant long exact sequence

```text
H^i(X_s̄, K) → H^i(X_η̄, K) → H^i(X_s̄, RΦK) → H^{i+1}(X_s̄, K)
```

whose first arrow is specialization (from the special to the generic fibre). The compactly supported
comparison runs from nearby cohomology of the special fibre to compactly supported cohomology of the
generic fibre and is an isomorphism when `f` is proper. Hypotheses: noetherian schemes of finite
type; torsion coefficients invertible on the trait; bounded-below complexes.

*Proof sketch.* Construct the exchange maps from adjunction units and the geometric fibre square;
apply smooth or proper base change (CohomologicalPointCounting/EtaleBaseChange Layers 4–5), keeping
the comparison map in the other cases. Dominant trait change is XIII 2.1.7.5. Apply `RΓ` and proper
base change to the triangle; naturality gives inertia equivariance. (SGA 7 II, Exposé XIII,
2.1.7.1–2.1.7.5, pp. 20–21; 1.3.9, p. 16; 2.1.8.9, p. 22.) *Needs:* 0.3, 0.5;
EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.1 (exceptional inverse image);
CohomologicalPointCounting/EtaleBaseChange Layers 3–5 and CompactSupport Layer 5.

**Checks.**

- The connecting map raises the degree by one: `RΦ` enters the triangle with no shift.
- All maps are equivariant for inertia and for `Gal(η̄/η)`, because they come from the topos
  `X_s ×_s S`.
- For `X = S` and `K = Λ` the sequence is `0 → Λ → Λ → 0`: specialization is the identity.

### 0.7 Constructibility, coefficient change and change of trait

**Theorem (constructibility of nearby cycles).** Let `X` be of finite type over an excellent
henselian trait and `K` a bounded constructible complex with finite torsion coefficients invertible on
`S`. Then `RΨK` and `RΦK` have bounded constructible cohomology, and finite Tor-amplitude of `K` passes
to `RΨK` and `RΦK`. Constructibility here is the actual stratification condition of EDC.0, not a
statement about finite stalks. The oriented nearby-cycle functor over a base of higher dimension is
not asserted constructible.

*Proof sketch.* This is Deligne's finiteness theorem for nearby cycles (SGA 4½, [Th. finitude]),
recalled with exactly these hypotheses in Illusie 2006, §1.1(b), p. 2, and Illusie 2021, §6.2,
pp. 103–104; it rests on the finiteness of `Rf_*` for proper maps (CohomologicalPointCounting/
EtaleBaseChange Layer 6) and the excellence of the trait. Finite cohomological and Tor amplitude come
from the strict-local stalk formula of 0.5 and XIII 2.1.13, pp. 25–26. The triangle passes bounded
constructibility from `RΨ` to `RΦ`. *Needs:* 0.5; EtaleDualityAndPerverseSheaves Layer EDC.0 (constructible complexes of
finite Tor dimension); SchemeAndStackFoundations Layers 0 (§0.21, excellent
schemes) and 2; TauCetiRoadmap ModularCurves Layer 4D (strict henselization); CohomologicalPointCounting/EtaleBaseChange Layer 6.

**Checks.**

- For an ordinary node only the single middle vanishing sheaf survives (0.5, `RPhi_node`).
- For `X → S` smooth and `K` constant, `RΨK = K_s` and `RΦK = 0`, which are constructible.

**Theorem (coefficient change and change of trait).** Nearby and vanishing cycles commute with derived
extension of finite coefficient rings `Λ → Λ'` for constructible complexes of finite Tor dimension with
`ℓ` invertible, and with dominant change of henselian traits with transported geometric points. These
isomorphisms respect specialization, the cone triangle and, after restriction, the inertia action. For
adic systems the statement applies at each finite level before derived completion; the underived
tensor product is not substituted for the derived one.

*Proof sketch.* The universal coefficient comparison is XIII 2.1.13 with derived tensor and its Tor
terms; change of traits is XIII 2.1.7.5 with the restriction map on inertia; check that the
unit/counit construction of specialization and the enhanced cone commute with both comparisons.
(SGA 7 II, Exposé XIII, 2.1.7.5, p. 21, and 2.1.13, pp. 25–26.) *Needs:* 0.1 (tame character under
ramified extension), 0.6 and the constructibility theorem; EtaleDualityAndPerverseSheaves Layer EDC.0;
EnhancedDerivedSheaves Layer E4.

**Checks.**

- Reduction `ℤ/ℓ² → ℤ/ℓ` carries the derived Tor correction when a stalk is not flat.
- A ramification-index `e` extension replaces `t_ℓ` by `e` times the new tame character (0.1).

### 0.8 Adic and rational coefficients

A compatible system `(K_r)` of bounded constructible `ℤ/ℓ^r`-complexes with uniform amplitude defines,
through the derived adic realization of EnhancedDerivedSheaves Layer E4, the integral nearby and
vanishing complexes `RΨ(K)`, `RΦ(K)` with `ℤ_ℓ`-coefficients; tensoring with `ℚ_ℓ` gives the rational
functors and their inertia-equivariant specialization triangle. This is the realization of the
finite-level construction of 0.5, not a second definition of nearby cycles. A non-flat finite-level
system is not realized by an ordinary inverse limit. (Illusie 1994, §4.4, p. 47.) *Proof sketch.*
Apply 0.7 to the transition maps, use the adic completion and realization equivalence with derived
inverse-limit control, and rationalize, keeping integral Tor and inverse-limit terms visible.
*Needs:* 0.7; EnhancedDerivedSheaves Layer E4; CohomologicalPointCounting/ConstructibleEtale Layer 6 (Tate
twists); EtaleDualityAndPerverseSheaves Layer EDC.6 (adic and rational realization); CohomologicalPointCounting/EllAdicRealization
Layers 1–2 and 7.

**Checks.**

- The vanishing stalk of the node `xy = π` realizes to `ℤ_ℓ(−1)` in degree one.
- The rational triangle is equivariant for inertia, and its first map is specialization.

### 0.9 Comparison with nearby cycles of the adic generic fibre

Let `X` be a scheme, `Y ⊂ X` a closed subscheme defined by an ideal `I` of finite type, `U = X − Y`, and
`d(X̂)` the adic generic complement of the `I`-adic completion. Assume `X` locally noetherian, or the
principal-ideal alternative of Huber 1996, 3.5.12. For a torsion coefficient ring `E` and `K ∈ D⁺(U, E)`
the canonical map `i^* Rj_* K → Rb_* a^* K` is an isomorphism (Huber 1996, Theorem 3.5.13). For a
strictly henselian trait of rank one, `X` locally of finite type, and completion and base change to
the integral closure in an algebraic closure as in Huber's Corollaries 3.5.16–3.5.17, the scheme
nearby cycles `RΨ` of 0.5 and the formal/adic nearby cycles `Rλ_* c^*` agree; this is a statement
about `RΨ`, not the cone `RΦ`. Specialization and the inertia actions agree, by naturality under each
automorphism of the completion and base-change diagram. Adic and rational coefficients are allowed only
on the realization domain of 0.8; no comparison for arbitrary analytic spaces is made.

*Proof sketch.* The general completion comparison and the formal nearby-cycle comparison are the
targets of ClassicalAdicEtaleCohomology Layer 4 (§4.4 formal completion and the comparison map, §4.5 the trait
comparison), which use
only the nearby-cycle definition of 0.5. Identify the two inertia actions by functoriality under every
inertia automorphism, then specialization by naturality, and pass to adic and rational coefficients
through 0.8. (Huber 1996, §3.5, Theorem 3.5.13, p. 207, proof pp. 208–209, Corollaries 3.5.16–3.5.17,
p. 210; Caraiani–Scholze, §4.6, p. 63.) *Needs:* 0.1, 0.8; ClassicalAdicEtaleCohomology Layer 4, §§4.4–4.5
(the scheme-completion comparison of Huber 3.5.13 and the formal nearby-cycle comparison).

**Checks.**

- The algebraic nodal tube and its adic counterpart have the same rank-one vanishing stalk and
  Tate twist.
- The comparison square intertwines every inertia element, not only the underlying cohomology.

### 0.10 Absolute cohomological purity

**Theorem (absolute purity, Gabber).** Let `X` be a regular noetherian scheme, `i : Z → X` a closed
immersion with `Z` regular and of pure codimension `c`, and `n` an integer invertible on `X`. Then
`Ri^!(ℤ/n) ≅ ℤ/n(−c)[−2c]` on `Z`, the isomorphism being given by the fundamental class
`cl_Z ∈ H^{2c}_Z(X, ℤ/n(c))`. Equivalently `R^q i^! ℤ/n = 0` for `q ≠ 2c` and `R^{2c} i^! ℤ/n(c)` is free
of rank one generated by `cl_Z`. Consequences: for a morphism of finite type `f : X → Y` between regular schemes
(with ample line bundles) of virtual relative dimension `d`, the Gysin map `ℤ/n(d)[2d] → Rf^!ℤ/n` is an isomorphism;
and for a strict normal crossings divisor `D = ΣD_i` in a regular `X` with complement `j`,
`R^1j_*ℤ/n ≅ ⊕_i (ℤ/n)_{D_i}(−1)` and `R^*j_*ℤ/n` is the exterior algebra on it. The fundamental classes are compatible with transverse pullback and
with composition of regular immersions, and for `X` smooth over a field they agree with the cycle
classes of EtaleDualityAndPerverseSheaves Layer EDC.3.

The uses in this roadmap are regular pairs over a henselian trait: the components and their
intersections in a regular strictly semistable scheme (1.9 and Layer LPV.7a), and the exceptional
divisor of a blown-up ordinary quadratic point in odd relative dimension (2.7). There the statement
supplies the Gysin isomorphisms `H^q_Z(X, Λ) ≅ H^{q−2c}(Z, Λ)(−c)` and the localization sequences with
their boundary signs.

*Proof sketch.* Riou's proof of Gabber's theorem: construct the Gysin morphism from Chern classes;
reduce to `Λ = ℤ/ℓ` and to pointwise purity of regular local schemes; by Fujiwara's reduction pass to a
regular integral scheme, quasi-projective and flat over a strictly henselian trait of mixed
characteristic; use an alteration with semistable reduction and the log-smooth case to conclude. For a
strict normal crossings divisor `D = ΣD_i` in a regular `X` with complement `j`, purity gives
`R^1j_*Λ ≅ ⊕Λ_{D_i}(−1)` and `R^*j_*Λ` is the exterior algebra on it. (Illusie–Laszlo–Orgogozo,
*Travaux de Gabber sur l'uniformisation locale et la cohomologie étale des schémas quasi-excellents*,
Astérisque 363–364 (2014), arXiv:1207.3648, Exposé XVI (J. Riou), Théorème 3.1.1, Corollaires 3.1.2–3.1.3,
and the proof in §3.7.) *Needs:* EtaleDualityAndPerverseSheaves Layers EDC.2 (smooth purity) and EDC.3 (cycle classes and Gysin
maps); SchemeAndStackFoundations Layer 0, §0.21 (regular and excellent schemes).

**Checks.**

- `absolutePurity_smooth_pair`: for `Z ⊂ X` smooth over a field, the fundamental class is the cycle
  class of EDC.3 and the theorem is relative purity of EDC.2.
- `absolutePurity_point_on_trait`: for `X = S` a henselian trait and `Z = {s}`, `c = 1`:
  `H^2_s(S, μ_n) ≅ ℤ/n` generated by the class of a uniformizer, and `H^1_s = 0`; the map
  `H^1(η, μ_n) = k(η)^×/n → H^2_s(S, μ_n)` is the valuation mod `n`.
- `absolutePurity_not_singular`: for the node `X = Spec k[x, y]/(xy)` and `Z` the origin (`X` not regular),
  `H^q_Z(X, Λ)` is nonzero for `q = 1`, so regularity cannot be dropped.

### Examples

- The node `xy = π` over a strictly henselian trait: `R^1Φ(Λ)` is free of rank one at the origin and
  zero elsewhere, `RΦ = 0` away from the origin, and the specialization sequence of 0.6 for a proper
  family acquiring one node is `0 → H^1(X_s̄) → H^1(X_η̄) → Λ(−1) → H^2(X_s̄) → H^2(X_η̄) → 0`.
- For `X = S`, `Ψ_η(F)` is the generic representation `F_η̄`, while `i^*j_*F = F_η̄^I` loses the inertia
  action.

### Dependencies

Mathlib (henselian and discrete valuation rings, valuation inertia groups, small étale sites, derived
categories); Tau Ceti (`TauCeti.genericFiber`, `TauCeti.specialFiber`); CohomologicalPointCounting
(ConstructibleEtale Layer 3; EtaleBaseChange Layers 0–7; CompactSupport Layer 5; EllAdicRealization
Layers 1–2, 7); EtaleDualityAndPerverseSheaves Layers EDC.0–EDC.3 and EDC.6; EnhancedDerivedSheaves
Layers E0, E1, E4; SchemeAndStackFoundations Layers 0 and 2; TauCetiRoadmap ModularCurves Layer 4D; ClassicalAdicEtaleCohomology Layer
4; ArithmeticGaloisRepresentations Layer 2 and LocalFieldsRamification Layer 4 (comparison of the tame
character only).

## Layer LPV.1: Inertia, variation and the monodromy operator

This layer turns the inertia action on nearby cycles into linear algebra. It proves that inertia acts
quasi-unipotently on the cohomology of a family over a henselian trait, defines the twisted monodromy
operator `N : V → V(−1)` and its compatibilities with Frobenius, finite extensions, `can` and `var`,
builds the monodromy filtration of a nilpotent endomorphism of an object of an abelian category with
its primitive decomposition and the relative variant, and computes the filtered nearby complex of a
regular semistable scheme with two components. It ends with the semisimple trace of Frobenius on
nearby cycles. The logarithm of a unipotent automorphism and the monodromy filtration of a nilpotent
endomorphism of a finite-dimensional vector space, with its uniqueness and tensor and dual rules, are
ArithmeticGaloisRepresentations Layer 2 (§2.4 `IsUnipotent.log`, `IsUnipotent.log_exp_and_exp_log`; §2.6
`WeilDeligneRep.monodromyFiltration`); this layer uses them and adds what the geometric applications need.

### 1.1 The geometric local monodromy theorem

Let `K` be the fraction field of a henselian discrete valuation ring with residue field `k` of
characteristic `p ≥ 0`, `G = Gal(K^sep/K)`, `I` its inertia group and `ℓ ≠ p`. An ℓ-adic representation
`ρ : G → GL(V)` is **quasi-unipotent** if `ρ` is unipotent on an open subgroup `I_1 ⊂ I`.

**Theorem (Grothendieck's arithmetic monodromy theorem).** If no finite extension of `k` contains all
ℓ-power roots of unity, every ℓ-adic representation of `G` is quasi-unipotent. For `k` finite this is
ArithmeticGaloisRepresentations Layer 2, §2.4 (`GaloisRep.grothendieck_quasiUnipotent`); the proof for general `k` is
the same: the image of the wild inertia is finite, and a Frobenius-type element acting on the tame
quotient through an infinite subgroup of `ℤ_ℓ^×` forces the eigenvalues of `ρ(σ)`, `σ` in the tame
inertia, to be roots of unity.

**Theorem (geometric local monodromy theorem).** For `X` separated of finite type over `K`, inertia acts
quasi-unipotently on `H^n(X_{K^sep}, ℚ_ℓ)` and on `H^n_c(X_{K^sep}, ℚ_ℓ)`, for every residue field `k`.
After a finite extension of `K` the action of inertia is unipotent and factors through the tame
character `t_ℓ` of 0.1. An arbitrary continuous representation of the inertia group of a field with
algebraically closed residue field is not quasi-unipotent, and the theorem says nothing about it.

*Proof sketch.* The cohomology groups are finite-dimensional (CohomologicalPointCounting/EtaleBaseChange
Layer 6 for compact supports, and the finiteness theorem of 0.7 for ordinary cohomology). Grothendieck
deduces the geometric theorem from a variant of the arithmetic one by a limit argument that uses
Néron's smoothening process (NeronModelsAndSemistableAbelianVarieties Layer 1, §1.7) to descend the
family to a henselian trait whose residue field is finitely generated over the prime field, where the
arithmetic theorem applies. On an open subgroup where `ρ` is unipotent the wild inertia acts through a
finite group of unipotent elements, hence trivially in characteristic zero, so the action factors
through `t_ℓ`. (Illusie 1994, Théorème 1.2 and 1.3–1.4, pp. 11–12.) *Needs:* 0.1, 0.7, 0.8;
ArithmeticGaloisRepresentations Layer 2, §2.4; NeronModelsAndSemistableAbelianVarieties Layer 1, §1.7;
CohomologicalPointCounting/EtaleBaseChange Layer 6.

**Checks.**

- `localMonodromy_quadratic`: for `X = Spec K[y]/(y² − π)` with `p ≠ 2`, inertia acts on
  `H^0(X_{K^sep}, ℚ_ℓ) = ℚ_ℓ²` by swapping the two points, a finite (quadratic) action; after the
  extension `K(√π)` it is trivial, and `N = 0`.
- `localMonodromy_tate`: for a Tate elliptic curve with `v(q) > 0`, inertia acts unipotently but
  nontrivially on `H^1`, already over `K`.
- `arithmetic_needs_residue_hypothesis`: for `k` algebraically closed of characteristic zero, the
  character `σ ↦ (1 + ℓ)^{t_ℓ(σ)}` of `I ≅ Ẑ(1)` (after a generator of `ℤ_ℓ(1)`) is continuous and is not
  quasi-unipotent; so the arithmetic theorem needs its residue-field hypothesis, and the geometric
  theorem is a statement about cohomology, not about all representations.

### 1.2 The twisted monodromy operator

Let `ρ : G → GL(V)` be a quasi-unipotent representation on a finite-dimensional `ℚ_ℓ`-vector space (for
instance the geometric cohomology of 1.1). There is a unique nilpotent `N : V → V(−1)` such that
`ρ(σ) = exp(t_ℓ(σ) N)` for `σ` in every open subgroup of `I` on which `ρ` is unipotent; here
`t_ℓ(σ) N` means `N` followed by evaluation of the twist on `t_ℓ(σ) ∈ ℤ_ℓ(1)`, and the exponential and
logarithm are those of ArithmeticGaloisRepresentations Layer 2, §2.4 (`IsUnipotent.log` is the finite
sum `Σ_{1≤j<d} (−1)^{j+1}(T − 1)^j/j` for `(T − 1)^d = 0`, independent of `d` and inverse to
`IsNilpotent.exp`). Define
`VanishingCycles.monodromyOperator ρ` as this `N`. Prove:

- `VanishingCycles.monodromyOperator_equivariant`: `N` is `G`-equivariant as a map `V → V(−1)`: for
  `g ∈ G`, after trivializing the twist, `ρ(g) N ρ(g)⁻¹ = χ_ℓ(g) N` with `χ_ℓ` the cyclotomic character. When
  `k = 𝔽_q` and `F` is a lift of the geometric Frobenius, `χ_ℓ(F) = q⁻¹` and this reads `N F = q F N`.
- `VanishingCycles.monodromyOperator_generator`: replacing the generator `ζ` of `ℤ_ℓ(1)` used to write `N`
  as an endomorphism by `uζ`, `u ∈ ℤ_ℓ^×`, multiplies the matrix of `N` by `u` and the coordinate of
  `t_ℓ(σ)` by `u⁻¹`, and leaves the twisted map unchanged.
- `VanishingCycles.monodromyOperator_restrict`: for a finite extension `K'/K` of ramification index `e`,
  `N_{K'} = e · N_K` relative to the respective tame characters (0.1, `tameCharacter_restrict`). Over
  `ℚ_ℓ` the nilpotency index, the monodromy filtration and the dimensions of primitive parts are
  unchanged, because the filtration is invariant under nonzero scalars (1.3). Integral statements do
  not cancel `e` when `ℓ ∣ e`.
- `VanishingCycles.monodromyOperator_eq_grothendieck`: for `K` a nonarchimedean local field, `N` is the
  operator of `GaloisRep.grothendieck_quasiUnipotent` (ArithmeticGaloisRepresentations Layer 2, §2.4).

*Proof sketch.* On an open subgroup `I_1` where `ρ` is unipotent, the kernel of `t_ℓ` is profinite of order
prime to `ℓ`, so its image is finite and unipotent, hence trivial; thus `ρ|_{I_1}` factors through
`t_ℓ(I_1) ⊂ ℤ_ℓ(1)`, and `log ρ(σ)` is `ℤ_ℓ`-linear in `t_ℓ(σ)`. Uniqueness is clear from
`exp`/`log`. Equivariance is the conjugation rule `t_ℓ(gσg⁻¹) = χ_ℓ(g) t_ℓ(σ)`; geometric Frobenius acts
on `ℚ_ℓ(−1)` by `q`. The ramified extension uses `t_ℓ|_{I'} = e t'_ℓ`. (Illusie 1994, 1.5 and
(1.5.1)–(1.5.4), pp. 12–13; Weil II, 1.6.14 and 1.7.2, pp. 169–172.) *Needs:* 0.1, 1.1;
ArithmeticGaloisRepresentations Layer 2, §2.4; CohomologicalPointCounting/ConstructibleEtale Layer 6 (Tate twists).

**Checks.**

- `monodromyOperator_two_block`: on `V = ℚ_ℓ²` with `ρ(σ) = [[1, t_ℓ(σ)], [0, 1]]` (after a generator of
  `ℤ_ℓ(1)`), `N(e_1) = e_0`; if Frobenius has eigenvalue `a` on `ker N = ℚ_ℓ e_0` and `qa` on the quotient,
  then `NF = qFN`; arithmetic Frobenius would give `q⁻¹` instead.
- `monodromyOperator_finite`: if `ρ(I)` is finite then `N = 0`, for example a quadratic character of
  inertia; after the quadratic extension the action is trivial.
- `monodromyOperator_restrict_node`: for a nodal curve and the base change `t = u^e`, the rank-one
  logarithm is multiplied by `e`.

### 1.3 The monodromy filtration in an abelian category

Let `𝒜` be an abelian category, `X` an object of `𝒜` and `N` a nilpotent endomorphism of `X` (or a
morphism `N : X → X(−1)` for a Tate twist functor that is an autoequivalence commuting with `N`), and
`c ∈ ℤ`. **Definition.** The monodromy filtration centred at `c`, `VanishingCycles.monodromyFiltration N c`,
is the unique finite increasing filtration `M` of `X` with

```text
N(M_i) ⊂ M_{i−2}(−1)    and    N^r : gr^M_{c+r} X ≅ gr^M_{c−r} X(−r)   for all r ≥ 0.
```

For a finite-dimensional vector space and `c = 0` it is `WeilDeligneRep.monodromyFiltration` of
ArithmeticGaloisRepresentations Layer 2, §2.6, given by the kernel–image formula
`M_k = Σ_{a−b=k, a,b≥0} ker N^{a+1} ∩ im N^b`; the centred version is its shift by `c`. For `N = 0` it is
`M_{c−1} = 0`, `M_c = X`. Primitive parts use Deligne's lower convention:
`P_i = ker(N : gr_i → gr_{i−2})`, the bottom vectors of the `N`-strings; it is zero for `i > c`, because
`N` is injective on `gr_i` for `i > c`.

- `VanishingCycles.monodromyFiltration`: The finite increasing kernel-image filtration M indexed by Z and centered at c.
- `VanishingCycles.monodromyFiltration_mono`: M_i≤M_j for i≤j, with a finite lower and upper bound.
- `VanishingCycles.monodromyFiltration_lowering`: N(M_i)⊂M_(i−2).
- `VanishingCycles.monodromyGradedPower`: The induced map N^r from Gr_(c+r) to Gr_(c−r), with twist −r.
- `VanishingCycles.monodromyGradedPower_bijective`: Each opposite graded-power map is bijective.
- `VanishingCycles.monodromyFiltration_scalar`: M(aN,c)=M(N,c) for a≠0.
- `VanishingCycles.primitivePart`: P_i is the kernel of the induced graded N, using the lower-weight convention.
- `VanishingCycles.monodromyFiltration_conj`: Conjugation by a linear equivalence maps each filtration submodule to the corresponding submodule of the conjugate operator.
- `VanishingCycles.gradedN`: The map on the actual associated graded induced by N, lowering the index by two.
- `VanishingCycles.gradedN_mk`: On a class represented by x, the induced graded map returns the class represented by Nx.
- `VanishingCycles.monodromyGradedPower_mk`: The opposite graded-power map returns the class of N^r x, fixing its relation to the input operator.
- `VanishingCycles.monodromyFiltration_eq_vectorSpace`: for a finite-dimensional vector space the
  filtration centred at `0` is ArithmeticGaloisRepresentations' `WeilDeligneRep.monodromyFiltration N`.

*Proof sketch.* Existence and uniqueness by induction on a nilpotence bound `d` (`N^{d+1} = 0`): put
`M_{c+d} = X`, `M_{c−d−1} = 0`, `M_{c+d−1} = ker N^d`, `M_{c−d} = im N^d`, and apply the induction hypothesis
to `ker N^d / im N^d` with the induced endomorphism. Uniqueness uses the same extreme graded pieces.
Scalar invariance: the defining conditions are unchanged by `N ↦ aN`, `a` invertible. (Weil II,
1.6.1–1.6.7 and 1.6.14, pp. 165–170.) *Needs:* ArithmeticGaloisRepresentations Layer 2, §2.6; Mathlib
abelian categories (`CategoryTheory.Abelian`), images and kernels; CohomologicalPointCounting/ConstructibleEtale
Layer 6 (Tate twists).

**Checks.**

- `VanishingCycles.monodromyFiltration_zero`: For N=0 the filtration is 0 below c and V at and above c.
- `VanishingCycles.monodromyFiltration_two_block`: For N(e₁)=e₀ on Q² centered at zero, M_−2=0, M_−1=M_0=Qe₀ and M_1=V.
- `VanishingCycles.monodromyFiltration_three_block`: For N(e₂)=e₁, N(e₁)=e₀, the weights are −2,0,2 and Gr_−1=Gr_1=0.
- `VanishingCycles.monodromyFiltration_not_kernel_filtration`: For a two-block, ker N is M_−1, and M_0 is still ker N, whereas ker N² is V.
- A size-three Jordan block has weights `c − 2, c, c + 2`; a size-two block has weights `c − 1, c + 1`, so
  the filtration is not the kernel filtration `ker N^j`.

### 1.4 Strictness and primitive decomposition

**Theorem.** For the monodromy filtration centred at `0` in an abelian category:

1. `N : (X, M) → (X(−1), M[−2])` is strict: `N(M_{i+2}) = im N ∩ M_i(−1)`. Consequently
   `gr_i(ker N) ≅ P_i`.
2. (Primitive decomposition.) For every `i`,
   `gr_i X = ⊕_{j ≥ |i|, j ≡ i mod 2} N^{(j−i)/2} (N^j)^{−1} P_{−j}`: each graded piece is the direct sum of
   the images of the lower primitive parts `P_{−j}`, `j ≥ |i|`, `j ≡ i mod 2`, under the inverse of the
   opposite isomorphism `N^j : gr_j ≅ gr_{−j}` followed by a power of `N`, with the twists attached to
   powers of `N`. On a Jordan block of length `d + 1` the weights are
   `d, d − 2, …, −d`.
3. (The `sl₂` realization.) Over a field of characteristic zero, `gr^M X` carries a canonical action of
   `𝔰𝔩₂` in which `N` is the lowering operator `Y` and `H` acts by the weight `i` on `gr_i`; the raising
   operator `X` is defined on the primitive decomposition by `X(N^a u) = a(j − a + 1) N^{a−1} u` for
   `u = (N^j)^{−1} p`, `p ∈ P_{−j}`, `0 ≤ a ≤ j`, and `(X, H, Y)` is an `sl₂`-triple (Mathlib `IsSl2Triple`). Each `N`-string through a primitive
   vector of `P_{−j}` is the irreducible `𝔰𝔩₂`-module of dimension `j + 1` (TauCetiRoadmap
   RepresentationTheory/LieHighestWeight Layer 0).

Strictness is asserted for `N` and for isomorphisms commuting with `N`, not for an arbitrary morphism
commuting with `N`. The rules for tensor products (`N_1 ⊗ 1 + 1 ⊗ N_2`, filtration the convolution of
the two with centres added) and duals (`−Nᵗ`, `M_i(V^*) = ann M_{−i−1}(V)` at centre zero) over a field of
characteristic zero are ArithmeticGaloisRepresentations Layer 2, §2.6; with the `𝔰𝔩₂` realization of
item 3 they follow from the Clebsch–Gordan rule, and `Sym^d` of the two-block is the block of length
`d + 1` with weights `−d, −d + 2, …, d`.

*Proof sketch.* Split each graded piece into the primitive kernel and the image of the next power of
`N` using the opposite isomorphisms; iterate; strictness follows by graded surjectivity and injectivity.
In characteristic zero define `X` on the primitive decomposition by the displayed formula and check the
three bracket relations on each string. (Weil II, 1.6.3–1.6.8 and 1.6.10–1.6.12, pp. 165–168.)
*Needs:* 1.3; Mathlib `IsSl2Triple`; TauCetiRoadmap RepresentationTheory/LieHighestWeight Layer 0
(finite-dimensional `𝔰𝔩₂`-modules and Clebsch–Gordan); ArithmeticGaloisRepresentations Layer 2, §2.6.

**Checks.**

- `primitive_three_block`: a size-three block has a one-dimensional `P_{−2}` and no other primitive
  part; with `u = (N²)^{−1}p` its top vector, `X` sends `u` to `0`, `Nu` to `2u` and `N²u = p` to `2Nu`.
- `strict_fails_for_commuting_map`: for the inclusion of a trivial one-dimensional module into `ker N` of a
  two-block, strictness fails at index `−1`; the theorem does not assert it for such maps.
- `tensor_two_blocks`: two size-two blocks tensor to a size-three block plus a size-one block (weights
  `−2, 0, 2` and `0`).
- `dual_two_block`: the dual of a size-two block has weights `−1, 1` for the operator `−Nᵗ`.

### 1.5 The relative monodromy filtration

**Theorem (uniqueness).** Let `W` be a finite increasing filtration of `X` and `N` a nilpotent
endomorphism preserving `W`. At most one finite increasing filtration `M` satisfies `N M_i ⊂ M_{i−2}` and
`N^r : gr^M_{w+r} gr^W_w X ≅ gr^M_{w−r} gr^W_w X` for all `w` and `r ≥ 0` (with twist `−r` for twisted `N`);
call it the relative monodromy filtration `VanishingCycles.relativeMonodromyFiltration`. It is unchanged
by replacing `N` by a nonzero multiple. Existence is not asserted; it is a hypothesis wherever used.

*Proof sketch.* Induct on the length of `W`, using the three identities that determine `M` from `W`'s last
graded quotient and the previous subobject, and the uniqueness of 1.3 on each `gr^W_w`. (Weil II,
1.6.13–1.6.14, pp. 168–170.) *Needs:* 1.3.

**Checks.**

- For W pure of weight w the relative filtration is the ordinary filtration centered at w.
- For N(e₁)=e₀, W_0=Qe₀ and W_1=Q², no relative M exists: the prescribed graded centers force N M_1⊂M_−1=0, contradicting N≠0.
- For the same N with W_0=W_1=Qe₀ and W_2=Q² (graded pieces in weights 0 and 2), the relative filtration exists and is W itself:
  M_−1=0, M_0=M_1=Qe₀, M_2=Q², and N M_2=Qe₀⊂M_0. Existence depends on the gap between the weights, which a definition
  ignoring W would not see.

### 1.6 Maximal unipotence

On a nonzero finite-dimensional vector space `V` of dimension `n` over a field `K` (of any characteristic),
`T ∈ GL(V)` is **maximally unipotent** when its minimal polynomial is `(X − 1)^n`, and a nilpotent `N` is
**maximally nilpotent** when its minimal polynomial is `X^n`, that is `N^n = 0` and `N^{n−1} ≠ 0`. For `T`
unipotent (Tau Ceti's `LinearMap.GeneralLinearGroup.IsUnipotent`) these are equivalent, in every characteristic, to
`T − 1` being a single Jordan block and to `dim ker (T − 1)^j = min(j, n)`, and, when `K` has characteristic zero, to
`log T` being maximally nilpotent. The zero space is excluded from the definition: it is not a Jordan block of size
zero. Define `VanishingCycles.IsMaximallyNilpotent` and `VanishingCycles.IsMaximallyUnipotent`.

- `VanishingCycles.IsMaximallyNilpotent`: For dim V=n>0, N^n=0 and N^(n−1)≠0.
- `VanishingCycles.IsMaximallyUnipotent`: T is unipotent and T−1 is maximally nilpotent; equivalent to minpoly T=(X−1)^n.
- `VanishingCycles.maximalLog_iff`: In characteristic zero, maximal unipotence of T is equivalent to maximal nilpotence of log T.
- `VanishingCycles.maximalNilpotent_kernel_rank`: dim ker N^j=min(j,n).
- `VanishingCycles.maximalNilpotent_conj`: Maximal nilpotence is invariant under conjugation by a linear equivalence.

*Proof sketch.* `log(1 + U) = U · u(U)` with `u` a polynomial with constant term one, so `U` and `log(1 + U)`
have the same kernels of powers; Jordan decomposition identifies minimal polynomial and kernel
dimensions. (Qian 2023, published Definition 3.6, PDF p. 21.) *Needs:* Tau Ceti
`LinearMap.GeneralLinearGroup.IsUnipotent`; ArithmeticGaloisRepresentations Layer 2, §2.4 (logarithm);
1.4 (Jordan blocks as `N`-strings). *Lean:* `Suggested.lean` declares `VanishingCycles.IsMaximallyNilpotent`,
`VanishingCycles.IsMaximallyUnipotent`, `IsMaximallyUnipotent.isUnipotent`, `maximalNilpotent_kernel_rank` and
`maximalNilpotent_conj`, with the three-block, two-plus-one and zero-dimensional checks as examples.

**Checks.**

- `VanishingCycles.maximal_three_block`: The size-three Jordan block is maximally nilpotent.
- `VanishingCycles.maximal_not_two_plus_one`: A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent.
- `VanishingCycles.maximal_one_dimension`: The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent.
- `VanishingCycles.maximal_zero_dimension_excluded`: The zero-dimensional vector space does not satisfy the nonzero-dimension definition.

### 1.7 Canonical and variation maps

For the geometric triangle of 0.5, write `can : RΨK → RΦK` for the second map of the specialization
triangle (the quotient `q` of 0.4) and `Var(σ) : RΦK → RΨK` for the variation. Then
`Var(σ) ∘ can = σ − 1` on `RΨK` and `can ∘ Var(σ) = σ − 1` on `RΦK`. With rational ℓ-adic coefficients
on the part where inertia acts unipotently, define the normalized variation `var : RΦK → RΨK(−1)` as
`Var(σ)` multiplied by the finite polynomial `log(T)/(T − 1)` in `T = σ` (constant coefficient one) and
divided by `t_ℓ(σ)`; then `var ∘ can = N` and `can(−1) ∘ var = N_Φ`, and `var` does not depend on `σ` or on
a generator of `ℤ_ℓ(1)`. The finite logarithm is taken only after unipotence is proved (1.1).

*Proof sketch.* Use the two composition identities of 0.4; on a unipotent action multiply by the
polynomial `log(T)/(T − 1)`; undo the trivialization of `ℤ_ℓ(1)`. (SGA 7 II, Exposé XIII, (1.4.3.2)–(1.4.3.4),
p. 17; Illusie 1994, 1.5, pp. 12–13.) *Needs:* 0.4, 0.8, 1.2.

**Checks.**

- When `can ∘ Var(σ) = 0` (as at an ordinary quadratic point in odd relative dimension, where the forget-supports
  map vanishes, 2.3), `T` acts trivially on `RΦK`, the polynomial factor is one, and `var` is `Var(σ)` divided by `t_ℓ(σ)`.
- In that situation, with local equation `Q = b` for a uniformizer `b`, `Var(σ) = (−1)^{m+1} t_ℓ(σ)(·, δ)δ` (2.7), so `var = (−1)^{m+1}(·, δ)δ` for every `σ` with
  `t_ℓ(σ) ≠ 0`; omitting the division by `t_ℓ(σ)` would make `var` depend on `σ`.
- Both composites are checked; exchanging `Ψ` and `Φ` gives maps with the wrong source and target.

### 1.8 Tame restriction along a normal crossings divisor

**Theorem.** Let `X` be regular, `D = ∪_a D_a` a strict normal crossings divisor, and `F` a lisse
`ℚ_ℓ`-sheaf on `X − D` whose local monodromy along each `D_a` is tame and unipotent after a specified
Kummer cover. Then the tame unipotent local inertia defines commuting twisted residues `N_a` on the
tame restriction of `F` to each stratum `D_J = ∩_{a∈J} D_a`. The restriction is built from a compatible
system of Kummer covers `t_a^{1/n}` in fixed local equations `t_a` of the `D_a`, and does not depend on the
cofinal system chosen; the intrinsic version replaces the local equations by the torsor of the normal
bundle. Relative monodromy filtrations along a stratum are unique when they exist (1.5); their
existence under mixedness hypotheses is a statement about weights and is not part of this theorem.

*Proof sketch.* Abhyankar's lemma and the Kummer tame covers along `D` give the compatible restriction
system; the tame inertia of a strict normal crossings point is `∏_a ℤ_ℓ(1)`, abelian, so the logarithms
`N_a` of the unipotent factors commute; uniqueness of relative filtrations is 1.5. (Weil II, 1.7.8–1.7.10,
pp. 172–174.) *Needs:* 1.2, 1.5; Stacks Project, Lemma 0EYG (Abhyankar's lemma; the structure `∏_a ℤ_ℓ(1)` of the
pro-`ℓ` tame local monodromy at a strict normal crossings point is derived from it as part of this theorem);
InverseGaloisAndArithmeticFundamentalGroups Layer IG.1, §IG.1.2 (tame quotients).

**Checks.**

- On the coordinate divisor `xy = 0` the two residues commute.
- A wildly ramified local system is not assigned a tame Kummer restriction.

### 1.9 The two-component semistable nearby complex

**Construction.** Let `X` be regular and strictly semistable over an excellent strictly henselian trait,
with special fibre `D_1 ∪ D_2`, the components smooth and meeting transversely in `C = D_1 ∩ D_2`, and let
`Λ` be finite with `ℓ` invertible, or rational ℓ-adic after realization. The filtered Rapoport–Zink
complex `VanishingCycles.twoComponentNearbyComplex` is a filtered complex on `D_1 ∪ D_2`, built from the
restriction and Gysin maps between `Λ_{D_1} ⊕ Λ_{D_2}` and `Λ_C` (Gysin maps from absolute purity 0.10),
whose total complex is quasi-isomorphic to `K = RΨΛ` (not to the inertia-cohomology cone
`L = RΓ(I, K)`), and whose graded objects are

```text
gr_1 = Λ_C[−1](−1),    gr_0 = Λ_{D_1} ⊕ Λ_{D_2},    gr_{−1} = Λ_C[−1],
```

all other grades zero. The operator `N : gr_1 → gr_{−1}(−1)` is the identity of `Λ_C[−1](−1)`, and `N² = 0`
in the filtered derived category. For rational coefficients inertia acts by `exp(t_ℓ N)`; with finite
coefficients, in this two-step case, `T − 1` is used directly without denominators. Inertia can act
trivially on the cohomology sheaves while `N` on the derived object is nonzero. Only this
two-component calculation belongs here; the general strictly semistable case is Layer LPV.7a.

The filtered derived category is built here. Define `VanishingCycles.FilteredDerived Y Λ` as the stable category of
finite increasing filtered objects of the enhanced derived category `D(Y, Λ)` of EnhancedDerivedSheaves Layers E0–E1:
diagrams `F : (ℤ, ≤) → D(Y, Λ)` (coherent diagrams, Layer E3) with `F_i = 0` for `i ≪ 0` and `F_i → F_{i+1}` an
isomorphism for `i ≫ 0`. Its functors are the total object `colim F` and the graded pieces
`gr_i F = cofib(F_{i−1} → F_i)`. Prove `VanishingCycles.FilteredDerived.isIso_of_isIso_gr`: a filtered morphism inducing
isomorphisms on every `gr_i` is an isomorphism, by induction on the length of the filtration through the cofibre
triangles. The Rapoport–Zink complex above is an object of `FilteredDerived (D_1 ∪ D_2) Λ`.

- `VanishingCycles.twoComponentNearbyComplex`: The filtered nearby complex on D₁∪D₂, with actual restriction/Gysin differentials.
- `VanishingCycles.twoComponentNearbyComplex_grades`: The three graded objects are Λ_C[−1](−1), Λ_D₁⊕Λ_D₂ and Λ_C[−1].
- `VanishingCycles.twoComponentNearbyComplex_monodromy`: N on the outer grades is the identity after the Tate twist, and N²=0.
- `VanishingCycles.twoComponentNearbyComplex_resolves`: The corrected total complex is quasi-isomorphic to the geometric nearby complex K, not to L=RΓ(I,K).

*Proof sketch.* Build the two-row restriction/Gysin double complex from the intersections, with
`1 − T` as the upper differential (Illusie's 1994 erratum corrects its sign); the corrected filtered
quasi-isomorphism with `K` gives the three nonzero grades; `N` is the identity shift of the double
complex and its square vanishes because there are only two components. Absolute purity (0.10) supplies
`Ri^!Λ` for the regular divisors over the trait. (Illusie 2021, §6.3, pp. 104–105, formulas (6.2)–(6.4);
Illusie 1994 errata.) *Needs:* 0.5, 0.10, 1.2; EnhancedDerivedSheaves Layers E0, E1 and E3 (the stable
enhancement, unbounded derived sheaves and coherent diagrams from which the filtered derived category is built);
EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.3 (Gysin sequence and cycle classes over the residue field); SchemeAndStackFoundations Layer 0, §0.21 (excellent schemes).

**Checks.**

- `VanishingCycles.twoComponent_node`: For xy=π, the degree-one nearby stalk is Λ(−1).
- `VanishingCycles.twoComponent_disjoint`: If C is empty then N=0 and only the center-zero grade remains.
- `VanishingCycles.twoComponent_not_sheaf_split`: For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived N map on the two outer grades is an isomorphism.
- `VanishingCycles.twoComponent_N_square`: The filtered two-component operator has N²=0 and gr₁N equal to identity onto gr_−1(−1).
- For xy=π the intersection term is a point, R¹Ψ=Λ(−1), and the sheaf-level inertia action is trivial.
- With C empty all off-center grades vanish and N=0.
- A nonzero derived N in the nodal case prevents replacing the filtered complex by the direct sum of its cohomology sheaves.

### 1.10 The semisimple trace of Frobenius

Let `F` be an automorphism of a finite-dimensional vector space `V` over a field of characteristic zero,
and `ρ` an action of an inertia group `I` that is quasi-unipotent, with `F ρ(g) F⁻¹ = ρ(α(g))` for an
automorphism `α` of `I` (for nearby cycles, `F` a lift of geometric Frobenius). An **admissible
filtration** is a finite increasing filtration `0 = W_0 ⊂ … ⊂ W_r = V`, stable under `ρ` and `F`, such
that `I` acts through a finite quotient on each `W_{i+1}/W_i`. The degree-zero **semisimple trace** is
`Tr^{ss}(F, V) = Σ_i Tr(F | (W_{i+1}/W_i)^I)`; for a bounded complex with such actions on its cohomology
it is the alternating sum over cohomological degrees. Define
`VanishingCycles.AdmissibleInertiaFiltration` and `VanishingCycles.semisimpleTrace`.

**Theorem.** Admissible filtrations exist (for a quasi-unipotent action, the kernel filtration of the
logarithm on a unipotent open subgroup); the semisimple trace does not depend on the admissible
filtration or on the lift of Frobenius; it is additive in equivariant short exact sequences and, for
complexes, in equivariant distinguished triangles; and it changes sign under shift by one.

- `VanishingCycles.semisimpleTrace`: Alternating sum of Frobenius traces on the inertia invariants of finite-inertia graded cohomology.
- `VanishingCycles.semisimpleTrace_refinement`: The trace is unchanged under a finite common refinement.
- `VanishingCycles.semisimpleTrace_additive`: For an equivariant distinguished triangle, trace B=trace A+trace C.
- `VanishingCycles.semisimpleTrace_frobeniusLift`: Changing Frobenius by an inertia element leaves the semisimple trace unchanged.
- `VanishingCycles.AdmissibleInertiaFiltration`: Length, monotone submodules with endpoints 0,V, actual action/F stability and finite inertia image on each grade.
- `VanishingCycles.filtrationRepresentation`: The inertia action induced by ρ on W_(i+1)/W_i.
- `VanishingCycles.filtrationRepresentation_mk`: Applying g to the class of x gives the class of ρ(g)x.
- `VanishingCycles.filtrationFrobenius`: The map induced by F on the same actual associated graded.
- `VanishingCycles.filtrationFrobenius_mk`: Applying graded Frobenius to the class of x gives the class of Fx.
- `VanishingCycles.semisimpleTrace_finiteImage`: When the original inertia image is finite, the admissible trace equals the ordinary trace on its invariants.
- `VanishingCycles.semisimpleTrace_shortExact`: The three actual representations in a short exact sequence have equivariant injection and surjection, range equals kernel, and intertwining F; their admissible degree-zero traces are additive.

*Proof sketch.* Two admissible filtrations have a common refinement whose subquotients are equivariant
subquotients of finite-inertia pieces, hence have finite inertia image; averaging over the finite
inertia quotient in characteristic zero makes invariants exact, so the trace is unchanged under
refinement. On graded inertia invariants, changing `F` by an inertia element acts trivially. Additivity
factors through the Grothendieck group, and the cohomology sequence of a triangle gives the complex
version. (Haines–Ngô 2002, §3.1, Lemma 8 and Corollary 9, pp. 126–127; Kisin–Pappas 2018, §4.7.1,
p. 212.) *Needs:* 1.1, 1.2; 0.8 (the nearby-cycle stalks it is applied to); EtaleDualityAndPerverseSheaves
Layer EDC.0.

**Checks.**

- `VanishingCycles.semisimpleTrace_trivial`: For a degree-zero trivial inertia line with Frobenius a, the semisimple trace is a.
- `VanishingCycles.semisimpleTrace_unipotent_block`: For ρ(g)(x, y) = (x + gy, y) on ℚ², g ∈ ℤ, and F the identity (the specialization q = 1), the two-step admissible filtration gives semisimple trace two, while the trace on invariants is one.
- `VanishingCycles.semisimpleTrace_quadratic`: For a nontrivial quadratic finite inertia line, the semisimple trace is 0.
- `VanishingCycles.semisimpleTrace_shift`: Shifting a complex by one negates its semisimple trace.
- A trivial one-dimensional inertia module gives its ordinary Frobenius trace.
- For a nontrivial two-dimensional unipotent inertia block with compatible Frobenius eigenvalues a and qa on the two finite-inertia grades, the semisimple trace is a+qa; the trace on inertia invariants is just the eigenvalue on ker N. The Frobenius normalization fixes the direction of q-rescaling.
- A finite quadratic character has invariant trace zero.

### Examples

- Two-block monodromy: `ρ(σ) = [[1, t_ℓ(σ)], [0, 1]]`, `N(e_1) = e_0`, `M_{−1} = M_0 = ℚ_ℓ e_0`, `M_1 = V`
  (centre 0); with Frobenius eigenvalues `a` on `e_0` and `qa` on the quotient the semisimple trace is
  `a + qa`, while the trace on inertia invariants is `a`.
- The node `xy = π` (1.9): `R^1Ψ Λ = Λ_C(−1)` with trivial sheaf-level inertia action, yet the derived `N`
  is an isomorphism between the outer grades.

### Dependencies

Layer LPV.0; ArithmeticGaloisRepresentations Layer 2 (§2.4 logarithm and Grothendieck's monodromy
theorem for local fields; §2.6 the vector-space monodromy filtration with its tensor and dual rules);
NeronModelsAndSemistableAbelianVarieties Layer 1, §1.7 (smoothening); InverseGaloisAndArithmeticFundamentalGroups
Layer IG.1; EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.3; EnhancedDerivedSheaves Layers E0, E1 and E3;
CohomologicalPointCounting/ConstructibleEtale Layer 6 (Tate twists); Stacks Project, Lemma 0EYG;
TauCetiRoadmap RepresentationTheory/LieHighestWeight Layer 0; Mathlib (`IsSl2Triple`, abelian categories);
Tau Ceti (`LinearMap.GeneralLinearGroup.IsUnipotent`).

## Layer LPV.2: Ordinary quadratic singularities and the Picard–Lefschetz formula

This layer is the local theory of a Lefschetz degeneration. It defines ordinary quadratic forms over
any base, including characteristic two, their quadrics and the discriminant double cover given by the
even Clifford algebra; computes the ℓ-adic cohomology of smooth and affine quadrics with their
distinguished generators; defines ordinary quadratic points and proves their henselian canonical form
and the local equation of a family; and computes nearby cycles, vanishing cycles and the variation at
an ordinary quadratic point. The layer ends with the Picard–Lefschetz formula for a proper family with
one ordinary quadratic singular point, the description of its direct images and the comparison of
signs with the complex case. Quadratic forms and the even Clifford algebra are Mathlib's
(`QuadraticMap`, `QuadraticMap.polarBilin`, `QuadraticMap.Nondegenerate`, `CliffordAlgebra.even`).

### 2.1 Ordinary quadratic forms and their normal form

**Definition.** Let `S = Spec A`, `V` a locally free `A`-module of positive rank `r`, and `Q` a quadratic
form on `V` with polar form `Φ(x, y) = Q(x + y) − Q(x) − Q(y)`. `Q` is *nowhere zero* if its values generate
the unit ideal; then `Q = 0` defines a closed subscheme of `P(V^*)` (projective bundle in the convention
of AlgebraicModuliForArithmeticGeometry Layer 1, §1.1), flat of pure relative dimension `r − 2`, the
*quadric* of `Q`. `Q` is **ordinary** if it is nowhere zero and its quadric is smooth over `S`; this can be
checked on the fibres at the points of `S`. Over a field: if `r` is even or the characteristic is not
two, `Q` is ordinary if and only if `Φ` is nondegenerate; if `r` is odd and the characteristic is two, `Q`
is ordinary if and only if the kernel of the alternating form `Φ` is a line on which `Q` does not vanish.
Over a field and for `V ≠ 0` this is Mathlib's `QuadraticMap.Nondegenerate` (radical zero and polar kernel
of rank at most one). The case `r = 0` is excluded, and no invertibility of two is assumed. Define
`Quadric.IsOrdinary`.

- `Quadric.IsOrdinary`: IsOrdinary Q : Prop — Q nowhere zero with smooth quadric.
- `Quadric.IsOrdinary.baseChange`: Ordinary is stable under base change and can be checked on the fibres at points of S.
- `Quadric.isOrdinary_iff_polar_nondegenerate`: Over a field with r even or 2 ≠ 0: IsOrdinary Q ↔ (polarBilin Q).Nondegenerate.
- `Quadric.isOrdinary_iff_of_char_two`: Over a field of characteristic 2 with r odd: IsOrdinary Q ↔ finrank (ker Φ) = 1 ∧ Q ≠ 0 on ker Φ.
- `Quadric.isOrdinary_iff_nondegenerate`: Over a field with V ≠ 0: IsOrdinary Q ↔ QuadraticMap.Nondegenerate Q.

*Proof sketch.* Apply the Jacobian criterion after passing to an algebraic closure: the projective quadric
is singular at a geometric point `v ≠ 0` exactly when `Q(v) = 0` and `Φ(v, ·) = 0`. Smoothness and the rank
conditions descend to the base field; testing only rational vectors over an imperfect field would not
suffice. If two is invertible then `Q(v) = Φ(v, v)/2` and the condition is nondegeneracy of `Φ`. In
characteristic two `Φ` is alternating and its kernel has the parity of `r`. Scalar extension of `Q` is
defined coefficientwise in a local basis (Mathlib's quadratic base change needs two invertible). (SGA 7
II, Exposé XII, 1.1 and 1.1 a)–b), p. 2; the source writes `card(A) = 2` where characteristic two is
meant.) *Needs:* Mathlib `QuadraticMap.Nondegenerate`, `QuadraticMap.polarBilin`;
AlgebraicModuliForArithmeticGeometry Layer 1, §1.1 (projective bundles); SchemeAndStackFoundations Layer
0 (§0.8 smoothness, §§0.12–0.14 henselization); Mathlib's Jacobian criterion (`Algebra.IsStandardSmooth`,
`Algebra.IsSmoothAt.exists_notMem_isStandardSmooth`). *Lean:* `Suggested.lean` declares the field case,
`Quadric.IsOrdinaryOverField` (`Nontrivial V ∧ Q.Nondegenerate`) and `isOrdinaryOverField_iff_polar_nondegenerate`,
with the two characteristic-two checks as examples over an arbitrary field of characteristic two.

**Checks.**

- `Quadric.isOrdinary_xy_add_sq_char_two`: Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth).
- `Quadric.not_isOrdinary_sum_sq_char_two`: Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary.
- `Quadric.isOrdinary_rank_one`: r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic.
- `Quadric.isOrdinary_iff_nondegenerate_test`: Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r.
- `Quadric.isOrdinary_zero_rank_excluded`: The zero form on the zero module is not ordinary: rank zero is excluded explicitly.
- xy + z² in characteristic 2 is ordinary; x² + y² in characteristic 2 is not; ax² is ordinary.

**Theorem (normal form).** Let `Q` be an ordinary quadratic form on a locally free `A`-module of rank
`r = 2m` (resp. `2m + 1`). Étale locally on `Spec A` there is a basis `e_1, …, e_r` with
`Q(Σ x_i e_i) = Σ_{i=1}^{m} x_i x_{i+m}` (resp. `Σ_{i=1}^{m} x_i x_{i+m} + λ x_{2m+1}²` with `λ` invertible). The
source prints the upper limit of the sum as `m − 1`; the sum runs to `m`. *Proof sketch.* Induct on `m`;
`m = 0` is `Q = λx²` with `λ` a unit. For `m > 0` the quadric is smooth with nonempty geometric fibres, so
étale locally it has a section, a nowhere-zero `e` with `Q(e) = 0`; smoothness at `[e]` gives `f'` with
`Φ(e, f') = 1`, and `f = −Q(f')e + f'` makes `Ae + Af` hyperbolic; its orthogonal is ordinary of rank `r − 2`.
(SGA 7 II, Exposé XII, Proposition 1.2 and its proof, pp. 2–3.) *Needs:* the definition above;
SchemeAndStackFoundations Layer 0, §0.8 (étale-local sections of smooth morphisms).

**Checks.**

- r = 2: Q = x₁x₂; r = 3: Q = x₁x₂ + λx₃², which over a separably closed field of characteristic not 2 is equivalent to x² + y² + z².

### 2.2 The even Clifford centre and the discriminant cover

**Construction.** Let `Q` be nondegenerate on `V` locally free of rank `2m > 0` over `A`. The centre
`Z(Q)` of the even Clifford algebra `C⁺(Q) = CliffordAlgebra.even Q` is a finite étale `A`-algebra of rank
two, and `C⁺(Q)` is an Azumaya algebra over `Z(Q)`; `C⁺(Q)` depends only on the quadric `Q = 0`. A totally
isotropic direct summand `W` of rank `m` defines an idempotent `e(W) ∈ Z(Q)`, and over a field
`e(W_1) = e(W_2)` exactly when `dim(W_1/(W_1 ∩ W_2))` is even. For a smooth quadric `X/S` of dimension
`n = 2m > 0` this gives the étale double cover `Z(X) → S` (`Z(X) = X` for `n = 0`), and the generatrices
(linear subspaces of dimension `m` of `P(X)` contained in `X`) form a smooth projective `S`-scheme
`Gén(X)` whose Stein factorization is `Gén(X) → Z(X)`. For rank two in characteristic not two, `Z(Q)` is
the discriminant algebra. The centre is Mathlib's `Subalgebra.center A (CliffordAlgebra.even Q)` and gets no
separate name; over a field in which two is invertible it is Tau Ceti's `K[X]/(X² − d)`
(`CliffordAlgebra.adjoinRootEquivCenterEven`, with `d` the signed discriminant). Define
`Quadric.lagrangianIdempotent` and `Quadric.discriminantCover`, and prove:

- `Quadric.center_even_isEtale`: Z(Q) is finite étale of rank 2 over A, and C⁺(Q) is Azumaya over Z(Q).
- `Quadric.lagrangianIdempotent`: e(W) ∈ Z(Q) for W totally isotropic of rank m.
- `Quadric.lagrangianIdempotent_eq_iff`: Over a field, e(W₁) = e(W₂) ↔ Even (finrank (W₁ ⧸ W₁ ⊓ W₂)).
- `Quadric.discriminantCover`: Z(X) → S for a smooth quadric of even dimension, with e : Gén(X) → Z(X) the Stein factorisation.

*Proof sketch.* Étale locally `Q` is split; for `V = W_1 ⊕ W_2` with both summands totally isotropic,
`C(Q) ≅ End(ΛW_1)` as graded algebras, so `C⁺(Q) ≅ End(ΛW_1)⁺ × End(ΛW_1)⁻` has centre `A × A`; descent
gives the étale rank-two centre and the Azumaya property. The idempotent `e(W_1, W_2)` depends only on
`W_1` by connectedness of the affine space of complements. The parity criterion reduces by the addition
formula `e(W_1 ⊕ W_2) = e(W_1)e(W_2) + (1 − e(W_1))(1 − e(W_2))` to dimension two. For a smooth quadric,
`C⁺` of the ambient form descends; generatrices disjoint from a given one form an affine space, so
`Gén(X)` is smooth, and its geometric fibres over `Z(X)` are connected by reduction to `P¹ × P¹`. (SGA 7
II, Exposé XII, Proposition 1.5, p. 5; Proposition 1.12, p. 8; Proposition 2.8, p. 13.) *Needs:* 2.1;
Mathlib `CliffordAlgebra.even`, `Subalgebra.center`; Tau Ceti `CliffordAlgebra.adjoinRootEquivCenterEven` (the field
case with two invertible); SchemeAndStackFoundations Layers 0 (§0.8, étale localization) and 1 (§1.1, descent of
quasi-coherent modules). *Lean:* `Suggested.lean` states the field case of `center_even_isEtale` as
`Quadric.finrank_center_even` (dimension two for an ordinary form of even rank over a field, characteristic two
included).

**Checks.**

- `Quadric.center_even_hyperbolic`: V = Ae ⊕ Af with Q(xe + yf) = xy: C⁺(Q) = Z(Q) ≅ A × A, and the isotropic lines Ae and Af give the two idempotents fe and ef = 1 − fe (XII 1.12, proof).
- `Quadric.center_even_discriminant`: Over a field of characteristic not 2, Q = x² − dy² with d ≠ 0: C⁺(Q) = k ⊕ k·e₁e₂ with (e₁e₂)² = d, so Z(Q) ≅ k[t]/(t² − d), split if and only if d is a square; this agrees with Tau Ceti's `CliffordAlgebra.adjoinRootEquivCenterEven` for the orthogonal basis (e₁, e₂), whose signed discriminant is (−1)·1·(−d) = d.
- `Quadric.center_even_char_two`: Over a field of characteristic 2, Q = x² + xy + ay² on k²: with u = e₁e₂ one has u² = u − Q(e₁)Q(e₂), so Z(Q) = C⁺(Q) = k[u]/(u² + u + a), the Artin–Schreier algebra of the Arf invariant a, étale for every a and split exactly when a = t² + t for some t ∈ k. No algebra of the shape k[X]/(X² − d) is étale in characteristic 2 (X² − d = (X − √d)² over k̄), so the characteristic-not-two description does not extend.
- `Quadric.lagrangianIdempotent_sum`: For an orthogonal sum, e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂)) (XII 1.10.1): the sections add as ℤ/2-torsors, not as idempotents.
- n = 2: X ≅ P¹ × P¹, Gén(X) is two copies of P¹ (the two rulings) and Z(X) is two points.
- n = 0: Z(X) = X, a double cover.

### 2.3 Smooth quadrics, their cohomology and affine quadrics

**Definition.** Over an algebraically closed field a smooth quadric of dimension `n` is a scheme
isomorphic to the quadric of an ordinary form on a space of dimension `n + 2`. Over a scheme `S` it is a
proper smooth `S`-scheme whose geometric fibres are smooth quadrics; for `n = 0` it is an étale double
cover, for `n = 1` a Severi–Brauer scheme of relative dimension one, and for `n = 2` its geometric fibres
are `P¹ × P¹`. Étale locally on `S` it is the quadric of an ordinary form; for `n > 0` its ambient
Severi–Brauer scheme `P(X)` depends only on `X/S`, and `Ω^n_{X/S} ≅ O(−n)`. Define
`Quadric.IsSmoothQuadric`.

- `Quadric.IsSmoothQuadric`: IsSmoothQuadric (f : X ⟶ S) (n : ℕ) : Prop — proper, smooth, geometric fibres smooth quadrics of dimension n.
- `Quadric.isSmoothQuadric_of_isOrdinary`: The quadric of an ordinary form of rank n + 2 is a smooth quadric of dimension n.
- `Quadric.ambientProjective`: For a smooth quadric X/S of relative dimension n>0, the canonical ambient Severi–Brauer S-scheme P(X) with X a relative divisor of degree 2.
- `Quadric.isSmoothQuadric_zero_iff`: A smooth quadric of dimension 0 is the same as an étale double cover.
- `Quadric.canonical_iso`: Ω^n_{X/S} ≅ O_X(−n).

*Proof sketch.* Over an algebraically closed field compute `Ω^n ≅ O(−n)`, `Pic` and the vanishing of
`H^i(O)` and `H^1(O(1))`. Over `S`, `Pic_{X/S}` is étale locally constant, so étale locally for `n > 0` there
is a positive hyperplane bundle `L` with `p_*L` locally free of rank `n + 2` and `X ⊂ P(p_*L)` the quadric
of an ordinary form, unique up to a unit; `P(p_*L)` does not depend on `L` and descends to `P(X)`. (SGA 7
II, Exposé XII, 2.1, p. 9; Définition 2.4 and 2.4–2.6, pp. 10–12.) *Needs:* 2.1;
AlgebraicModuliForArithmeticGeometry Layer 1, §1.1; SchemeAndStackFoundations Layers 0 and 3
(§§3.4 and 3.7, Picard functors).

**Checks.**

- `Quadric.smoothQuadric_dim_zero`: n = 0 over an algebraically closed field: X ≅ Spec k ⊔ Spec k.
- `Quadric.smoothQuadric_dim_two`: n = 2: xy = zw in P³ is P¹ × P¹ (Segre).
- `Quadric.smoothQuadric_real_conic`: n = 1 over ℝ: x² + y² + z² = 0 is a smooth conic without real points, a nontrivial Severi–Brauer curve.
- `Quadric.not_smoothQuadric_cone`: The cone xy = z² in P³ (a form of rank 3 in 4 variables) is singular at (0:0:0:1); the form is not ordinary.

**Theorem (cohomology of smooth quadrics).** Let `p : X → S` be a smooth quadric of dimension `n` and `ℓ`
invertible on `S`, with hyperplane class `η ∈ H⁰(S, R²p_*ℤ_ℓ(1))`.

1. `R^{2i+1} p_* ℤ_ℓ = 0`.
2. For `0 ≤ 2i < n` (resp. `n < 2i ≤ 2n`), `R^{2i} p_* ℤ_ℓ(i)` is canonically the constant sheaf `ℤ_ℓ`,
   generated by `η^i` (resp. by the class `η^i/2`, an integral class `c` with `2c = η^i`).
3. For `n = 2m` the cycle-class map `cl : ℤ_ℓ^{Z(X)} → R^n p_* ℤ_ℓ(m)` of the two families of generatrices
   is an isomorphism, and for the two sections `α, β` of `Z(X)`: `η^m = cl(α) + cl(β)`; for `m` even,
   `Tr(cl(α)²) = Tr(cl(β)²) = 1` and `cl(α)cl(β) = 0`, while for `m` odd, `cl(α)² = cl(β)² = 0` and
   `Tr(cl(α)cl(β)) = 1`; and `η · (cl(α) − cl(β)) = 0`.
4. Over `𝔽_q`, `#X(𝔽_q) = Σ_{i=0}^{n} q^i` for `n` odd, and `Σ_{i=0}^{n} q^i + ε q^m` for `n = 2m`, with `ε = 1`
   if `X` has a rational generatrix and `ε = −1` otherwise.

The source writes `η ∈ H⁰(S, R¹p_*ℤ_ℓ(1))`; the hyperplane class lives in degree two.

*Proof sketch.* Items 1–2 are the cohomology of smooth complete intersections (weak Lefschetz and
Poincaré duality), with `η^i/2` above the middle because a hyperplane section of a quadric has degree
two. Item 3 is étale local: for `Σ_{i=0}^{m} x_i x_{i+m+1} = 0` in `P^{2m+1}`, `η^m` is the class of a linear
section that is the union of two generatrices from different families; disjoint generatrices have
product zero and generatrices meeting transversally in one point have trace one, and the parity
criterion of 2.2 decides which families they lie in; `cl` is an isomorphism because the Gram matrices
`[[1,0],[0,1]]` and `[[0,1],[1,0]]` are unimodular. Item 4 is the Grothendieck–Lefschetz trace formula,
Frobenius swapping `α` and `β` exactly when there is no rational generatrix. (SGA 7 II, Exposé XII,
Théorème 3.3, pp. 14–15; Vérification 3.4, p. 17.) *Needs:* 2.2, the definition above;
EtaleDualityAndPerverseSheaves Layers EDC.2 (Poincaré duality and the trace), EDC.3 (Gysin sequence,
cycle classes) and EDC.4 (weak Lefschetz, cohomology of projective space); CohomologicalPointCounting/TraceFormula Layers 11–12
(point counting).

**Checks.**

- n = 2, X = P¹ × P¹: the two rulings have square 0 and product 1 (m = 1 odd); #X(𝔽_q) = (1 + q)² when split and 1 + q² for the nonsplit form (Weil restriction of P¹ from 𝔽_{q²}).
- n = 0: two points, Tr(cl(α)²) = 1 (m = 0 even), #X(𝔽_q) = 1 + ε ∈ {0, 2}.

**Theorem (affine quadrics and the vanishing class).** Let `X` be the smooth quadric over `S` of an
ordinary form on `V` of rank `n + 2`, `H` a hyperplane meeting `X` transversally, `Y = X ∩ H` (a smooth
quadric of dimension `n − 1`), `X° = X − Y`, `f : X° → S`, and `q : Y → S`. For `n = 2m` the primitive part of
`R^n p_*ℤ_ℓ(m)` is the orthogonal of `η^m`, generated by `cl(α) − cl(β)`, and the primitive quotient is
`R^n p_*ℤ_ℓ(m)/ℤ_ℓ η^m`. The cohomology of `X°` is torsion-free with nonzero Betti numbers `b_0 = b_n = 1`,
and with compact supports `b_{2n} = b_n = 1` (`b_0 = 2` when `n = 0`). For `n = 2m > 0`, `R^n f_!ℤ_ℓ(m)` is the
primitive part and `R^n f_*ℤ_ℓ(m)` the primitive quotient of `R^{2m} p_*ℤ_ℓ(m)`; for `n = 2m + 1`, `R^n f_!ℤ_ℓ(m)`
is the primitive quotient and `R^n f_*ℤ_ℓ(m + 1)` the primitive part of `R^{2m} q_*ℤ_ℓ(m)`. Locally these
have natural generators up to sign, `δ` with compact support and `δ'` without. The forget-supports map
`φ : R^n f_!ℤ_ℓ → R^n f_*ℤ_ℓ` is zero for `n` odd and sends `±δ` to `±2δ'` for `n` even and positive;
`Tr(δδ') = ±1`, and `Tr(δ²) = 0` for `n = 2m + 1` and `(−1)^m · 2` for `n = 2m`. For `n > 0` the compactly
supported sheaves are concentrated in degrees `n` and `2n`; the top one is `ℤ_ℓ(−n)` and the middle one is
a rank-one lisse sheaf with the orientation character of the quadric, which becomes a Tate line once
that character is trivialized.

*Proof sketch.* Use the localization sequence of `X° ⊂ X ⊃ Y` and its dual Gysin sequence, and compute
restriction with 2.3: in even dimension the image of a ruling class is the integral generator `c` of the
adjacent odd-dimensional quadric with `2c = η^m` (the notation `η^m/2` does not invert two in `ℤ_2`); in odd
dimension restriction is injective with the primitive quotient as cokernel. For `n = 2m`, `δ ↦ ±(cl(α) −
cl(β))` gives `Tr(δ²) = cl(α)² − 2cl(α)cl(β) + cl(β)²`, which is `1 + 1 − 0 = 2` for `m` even and
`0 + 0 − 2 = −2` for `m` odd. For `n = 2m + 1`, `δ = ∂cl(α)` and `δ² = 0`. (SGA 7 II, Exposé XII, 3.5–3.6,
pp. 17–18; Table 3.7, p. 20.) *Needs:* the theorem above, 2.3; EtaleDualityAndPerverseSheaves Layers EDC.2
and EDC.3.

**Checks.**

- n = 1: X° = P¹ minus two points ≅ 𝔾_m, H¹_c and H¹ of rank 1, φ = 0, Tr(δ²) = 0.
- n = 2: Tr(δ²) = −2, the self-intersection of the vanishing sphere of a surface node; over ℂ, Σ z_i² = 1 is diffeomorphic to the tangent bundle of a sphere (XII 3.8).

### 2.4 Ordinary quadratic points

**Definition.** Let `y` be a closed point of a scheme `Y` of finite type over a field `k` of characteristic
`p`, and `n = dim_y Y`. For `k` algebraically closed, `y` is an **ordinary quadratic point** if, as
`k`-algebras, `Ô_{Y,y} ≅ k[[x_1, …, x_{n+1}]]/(f)` with `f = Q(x) + R(x)`, `Q` an ordinary quadratic form in
`n + 1 > 0` variables and every coefficient of `R` of total degree below three zero. For general `k`, `y` is
ordinary quadratic if the points of `Y ⊗_k k̄` over `y` are. Replacing *ordinary* by *nondegenerate* (polar
form nondegenerate) defines nondegenerate quadratic points; `y` is nondegenerate exactly when it is
ordinary and `p ≠ 2` or `n` is odd, and an ordinary quadratic point with `p = 2` and `n` even is called
degenerate. An arbitrary ordinary germ is not replaced by its pure quadratic cone. Define
`Quadric.IsOrdinaryQuadraticPoint`, `Quadric.IsNondegenerateQuadraticPoint`, and the coordinate
expansion `Quadric.quadraticSeries` of a quadratic form as a multivariate power series, whose
diagonal coefficients are `Q(e_i)` and whose mixed coefficients are `Q(e_i + e_j) − Q(e_i) − Q(e_j)`, with
no division by two.

- `Quadric.IsOrdinaryQuadraticPoint`: Geometric predicate on (Y/k,y), tested after algebraic closure. Its field formal-germ specialization takes a k-algebra A and r=n+1>0 and requires A≅k[[x₁,…,x_r]]/(quadraticSeries(Q)+R) as k-algebras, with Q ordinary and R of order at least three (`3 ≤ MvPowerSeries.order R`).
- `Quadric.IsNondegenerateQuadraticPoint`: The same with the leading form nondegenerate.
- `Quadric.isNondegenerate_iff`: IsNondegenerateQuadraticPoint Y y ↔ IsOrdinaryQuadraticPoint Y y ∧ (p ≠ 2 ∨ Odd n).
- `Quadric.isOrdinaryQuadraticPoint_baseChange`: The notion is geometric: it holds at y if and only if it holds at the points over y after any field extension.
- `Quadric.isOrdinaryQuadraticPoint_cone`: For r > 0 and Q ordinary, the formal quotient k[[x]]/(quadraticSeries Q) is an ordinary germ; its identification with the completed local ring of the cone Q = 0 at its vertex is a statement about schemes (Mathlib `AdicCompletion`; TauCetiRoadmap ModularCurves Layer 4D).
- `Quadric.quadraticSeries`: The coordinate expansion of Q in multivariate formal power series; its diagonal coefficients are Q(e_i), and its mixed coefficients are Q(e_i+e_j)−Q(e_i)−Q(e_j), with no division by two.
- `Quadric.quadraticSeries_proj`: For Q=proj_i·proj_j the constructor returns X_i X_j, including i=j.

*Proof sketch.* The quadratic part of `f` is determined up to a linear change of coordinates and a unit,
because `f` has no linear term, and ordinarity is invariant under both. Nondegeneracy is the criterion of
2.1 for the form in `n + 1` variables. (SGA 7 II, Exposé XV, Définition 1.2.1, p. 4; 1.2.2, pp. 4–5;
Exemple 1.2.4, p. 5.) *Needs:* 2.1; Mathlib `MvPowerSeries`, `MvPowerSeries.order`, `AdicCompletion`
(completed local rings); TauCetiRoadmap ModularCurves Layer 4D. *Lean:* `Suggested.lean` declares `Quadric.quadraticSeries`,
the field formal-germ form `Quadric.IsOrdinaryQuadraticGerm` and `isOrdinaryQuadraticGerm_cone`, with the
`quadraticSeries_proj` check (both the mixed and the diagonal case) as examples; "order at least three" is Mathlib's
`3 ≤ MvPowerSeries.order R`.

**Checks.**

- `Quadric.node_isOrdinary`: The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic.
- `Quadric.doublePoint_char_two`: n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate.
- `Quadric.cusp_not_ordinary`: The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point.
- `Quadric.smooth_point_not_quadratic`: A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1.
- The node, the double point in both characteristics, the cusp and a smooth point.

**Lemma (the Tjurina module).** Let `y` be an ordinary quadratic point of `Y/k` with `k(y)` purely
inseparable over `k`, and `T¹_{Y/k} = O_Y/J` the quotient by the Jacobian ideal. Near `y`, `T¹` is monogenic
and concentrated at `y`, of rank one over `k` if `y` is nondegenerate (and then `k(y) = k`), of rank two if `y`
is degenerate (`p = 2`, `n = 2m`), in which case `k(y) = k` or `k(y) ≅ k(√a)` with `a ∈ k − k²`. *Proof
sketch.* Check over `k̄` after completion. If `y` is nondegenerate the partial derivatives of
`f = Q + (order ≥ 3)` generate the maximal ideal by Nakayama, so the quotient is `k`. In the degenerate case
`f = x_0² + Σ_{i=1}^m x_i x_{i+m} + R` in suitable coordinates, and `(f, ∂f/∂x_i) = (x_0², x_i (i ≠ 0))`, so the
quotient is `k[x_0]/(x_0²)`; a radicial subscheme of rank two of affine space lies on a unique line.
(SGA 7 II, Exposé XV, Lemmes 1.2.7–1.2.8, pp. 6–7; 1.2.9–1.2.10.) *Needs:* the definition above.

**Checks.**

- n = 0, Y = Spec k[x]/(x²): T¹ = k[x]/(x², 2x) has dimension 1 for p ≠ 2 and 2 for p = 2.

**Theorem (henselian implicit function theorem, Tougeron).** Let `(A, 𝔞)` be a henselian pair with `A`
noetherian, `X ⊂ 𝔸^N_A` a closed subscheme of finite presentation defined by `f_1, …, f_c`, `δ'` the ideal of
`A[x]` generated by the `c × c` minors of the Jacobian matrix, and `x̄ ∈ A^N` with `f(x̄) ≡ 0 mod δ'(x̄)² 𝔞`.
Then there is `x ∈ X(A)` with `x ≡ x̄ mod δ'(x̄) 𝔞`. In the quadratic application: a formal coordinate change
tangent to the identity that carries the equation of an ordinary quadratic germ to `Q` modulo a high
power of the maximal ideal is approximated by a henselian coordinate change with the same jet; the
linear part stays invertible and the quadratic leading term is preserved. *Proof sketch.* Newton
iteration in the henselian pair, the Jacobian-square condition giving quadratic convergence; for the
quadratic germ, present the coordinate-change equations as a finite-type scheme of solutions and apply
the theorem with `δ'` the Jacobian ideal of `Q`. (SGA 7 II, Exposé XV, Théorème 1.1.2, pp. 2–3.) *Needs:*
2.1; Mathlib `HenselianRing`; SchemeAndStackFoundations Layer 0, §0.14 (henselian pairs, smooth lifting
over henselian pairs).

**Checks.**

- N = c = 1, X : g(x) = 0 in 𝔸¹_A with g′(x̄) a unit (so δ′(x̄) = A): a root x̄ of g modulo 𝔞 lifts to a root in A congruent to x̄ modulo 𝔞, which is Hensel's lemma.

**Theorem (canonical form up to henselization).** Let `y` be an ordinary quadratic point of a `k`-scheme
`Y` and `k'` the separable closure of `k` in `k(y)`. There are a `k'`-scheme `Y_0 ⊂ 𝔸^{n+1}_{k'}` and a point
`y_0` with an isomorphism of henselizations `Y_(y) ≅ Y_0(y_0)` over `k`, where either `Y_0` is the cone `Q = 0`
of a nondegenerate form and `y_0` the origin, or (`p = 2`, `n = 2m`) `Y_0` is
`(x_0² − a) + Σ_{0<i≤j≤2m} a_{ij} x_i x_j = 0` with the `2m`-variable form nondegenerate and `y_0 = (√a, 0, …, 0)`.
The same holds for the affine quadric of a non-homogeneous quadratic form with an ordinary singular
point, by an affine change of variables. *Proof sketch.* Pass to an étale neighbourhood that is a
`k'`-scheme; `dim(Ω¹_{Y/k})_y = n + 1`, so `Y` is a hypersurface in a smooth `Z` of dimension `n + 1`. In the
nondegenerate case `k(y) = k` (Tjurina lemma), choose étale coordinates with `f = Q + (order > 2)` and apply
the implicit function theorem to get coordinates `x'_i ≡ x_i mod 𝔪²` with `Q(x') = 0`; the degenerate case
uses the line of the Tjurina lemma. (SGA 7 II, Exposé XV, Théorème 1.2.6 and its proof, pp. 5–7.)
*Needs:* the definition, the Tjurina lemma and the implicit function theorem above; 2.1.

**Checks.**

- The node xy = 0 is the cone of x₁x₂; y² = x² + x³ at the origin (p ≠ 2) is étale locally the node.

**Theorem (henselian versal deformation).** Over a henselian noetherian local base, an isolated ordinary
quadratic germ has a henselian versal deformation: the one-parameter family `Q − b = 0` in the
nondegenerate case, and the two-parameter family `x_0² + b x_0 + c + Q'` in the degenerate case
(characteristic two, even fibre dimension). A chosen identification on the special fibre extends once
the lifts of the coefficients are prescribed. *Proof sketch.* The Tjurina lemma gives one or two
deformation parameters; the formal versal deformation is computed by the Jacobian calculation of
XV 1.3.1–1.3.3; Artin approximation (AlgebraicModuliForArithmeticGeometry Layer 6) and Elkik's theorem
pass from the formal to the henselian deformation. (SGA 7 II, Exposé XV, Théorème 1.1.4 (Elkik), p. 4,
and 1.3.1–1.3.3, pp. 10–12.) *Needs:* the Tjurina lemma; AlgebraicModuliForArithmeticGeometry Layer 6
(Artin approximation); SchemeAndStackFoundations Layer 0, §§0.12–0.14 (henselization, Elkik's smooth lifting).

**Checks.**

- The ordinary quadratic point has a one-parameter versal deformation Q − b = 0 (non-degenerate case) and a two-parameter one in the degenerate case, matching the ranks 1 and 2 of T¹ in the Tjurina-module lemma.

**Theorem (local equation of a family).** Let `S = Spec A` be henselian local with closed point `s`,
`f : X → S` flat of finite presentation, and `x` a closed point of `X_s` at which `X_s` (of dimension `n`) has an
ordinary quadratic singularity, with `k(x)` purely inseparable over `k(s)`.
(i) If `x` is nondegenerate, there are a nondegenerate quadratic form `Q` in `n + 1` variables over `A` and
`b` in the maximal ideal such that the henselization of `X` at `x` is isomorphic to that of `Q − b = 0` at the
origin of `𝔸^{n+1}_S`.
(ii) If `x` is degenerate (`n = 2m`, characteristic two), there is
`Q(x) = x_0² + b x_0 + c + Σ_{1≤i≤j≤2m} a_{ij} x_i x_j` over `A`, with `b` in the maximal ideal and the
`2m`-variable form nondegenerate, such that the henselization of `X` at `x` is isomorphic to that of `Q = 0`
at `(√c, 0, …, 0)`.
The isomorphism can be chosen to extend a given one on the special fibre. The source prints `x_0` for
`x_0²` in (ii). *Proof sketch.* The special fibre at `x` is in canonical form; pull back the henselian versal
deformation along a local morphism, which specializes `b` (and `c`) to elements of `A`. (SGA 7 II,
Exposé XV, Corollaire 1.3.2(i), p. 11; Remarque 1.3.3, p. 12.) *Needs:* the canonical form and versal
deformation theorems above.

**Checks.**

- A family of curves acquiring a node: xy = b with b ∈ m_A; for a regular total space b is a uniformiser, which is the b(x) of XV 3.3.1.

**Corollary.** In the situation of the local-equation theorem there is a neighbourhood `U` of `x` in `X`
such that every point of `U` at which `f` is not smooth is an ordinary quadratic point of its fibre. *Proof
sketch.* On `Q − b = 0` the morphism fails to be smooth exactly where all `∂Q/∂x_i` vanish and `Q = b`, that
is at the origin over `V(b)`, where the fibre is the cone `Q = 0`; the degenerate model is analogous.
(SGA 7 II, Exposé XV, Corollaire 1.3.4, p. 12.) *Needs:* the local-equation theorem.

**Checks.**

- In a Lefschetz pencil the singular points of the fibres near x_s are x_s itself, as condition (B) requires.

### 2.5 Cones: homotopy invariance and the Gysin sequence

**Lemma (homotopy invariance).** Let `k` be algebraically closed and `Λ` a torsion ring prime to
`char k`. A morphism `(U, K) → (V, L)` of schemes with complexes in `D⁺` is a pair `(f : U → V, φ : f^*L → K)`;
it induces `f^* : H^*(V, L) → H^*(U, K)`. Two such morphisms are homotopic if there are a connected `k`-scheme
`T` of finite type, points `0, 1 ∈ T(k)` and a morphism `(U × T, pr_1^*K) → (V, L)` with fibres `f_0` and `f_1` at
`0` and `1`. Homotopic morphisms induce the same map on cohomology. *Proof sketch.* Join `0` and `1` by a
chain of smooth connected curves mapping to `T`; for a smooth connected curve, smooth base change makes
`R^n pr_{2*}(pr_1^*K)` the constant sheaf `H^n(U, K)`, and evaluation at the two points of a connected curve
agree on a constant sheaf. (SGA 7 II, Exposé XV, Lemme 2.1.3, p. 14.) *Needs:*
CohomologicalPointCounting/EtaleBaseChange Layer 4 (smooth base change); EtaleDualityAndPerverseSheaves
Layer EDC.0.

**Checks.**

- The homotheties (x, t) ↦ tx, t ∈ 𝔸¹, make the identity of an affine cone homotopic to the constant map to its vertex.

**Proposition (cones).** Let `Y ⊂ P^r` be projective over an algebraically closed `k`, `X ⊂ 𝔸^{r+1}` its affine
cone with vertex `0`, `X_(0)` its henselization at `0`, `X* = X − {0}`, `X*_(0) = X_(0) − {0}`, `X_1 ⊂ P^{r+1}` the
projective cone (so `X = X_1 − Y`), and `F` a torsion group prime to `char k`. Then `H^i(X, F) ≅ H^i({0}, F)`
(`F` for `i = 0`, zero otherwise), `H^i_{0}(X, F) ≅ H^i_c(X, F)`, and `H^i(X*, F) ≅ H^i(X*_(0), F)`. *Proof
sketch.* The homotheties make the identity of `X` homotopic to the constant map at the vertex; for
compact supports, homotheties of large ratio retract `X_1 − {0}` onto `Y`, and the five lemma on the
localization sequences concludes; the henselian comparison is the five lemma with supports in `{0}`.
(SGA 7 II, Exposé XV, Proposition 2.1.2, p. 13; Corollaire 2.1.4, p. 15.) *Needs:* the homotopy lemma.

**Checks.**

- Y = P⁰ (X = 𝔸¹): H^i(𝔸¹) = F for i = 0 and 0 otherwise, and H^i_{0}(𝔸¹) = H^i_c(𝔸¹) = F(−1) for i = 2.

**Theorem (Gysin sequence of a punctured cone).** In the notation of the cone proposition, let `X̃`,
`X̃_(0)`, `X̃_1` be the blow-ups at `0`, `Y_0` the exceptional divisor, `h : X̃_1 → Y` the projection and
`y_0, y_∞ : Y → X̃_1` the sections with images `Y_0` and `Y`. Restriction gives `H^i(X̃_1 − Y_0) ≅ H^i(Y)` and
`H^i(X̃) ≅ H^i(Y_0) = H^i(Y)`, through which the localization sequences of `(X̃_1 − Y_0, Y)` and
`(X̃_1 − Y, Y_0)` become the rows of a commutative diagram
`… → H^{i−1}(X*) → H^{i−2}(Y)(−1) → H^i(Y) → H^i(X*) → …`, the middle arrows being cup product with the class `η`
of a hyperplane section in one row and with `−η` in the other. Locally `H^i(X̃_(0)) ≅ H^i(Y_0)` by proper base
change, and the sequence of `(X̃_(0), Y_0)` maps to the second row. *Proof sketch.* The Leray sequences of
`h` on the two line bundles give the restriction isomorphisms; `±η` is the restriction of the class of
`O(Y)` or `O(Y_0)`; commutativity reduces, through the triangles `y^*Ry^!F → R h_*F → R(h|X*)_*F →` whose
cohomology lies in degrees 0–2, to `Y` a point. (SGA 7 II, Exposé XV, Lemme 2.1.6 and 2.1.7, p. 16.)
*Needs:* the cone proposition; EtaleDualityAndPerverseSheaves Layer EDC.3 (Gysin sequence, cycle classes);
CohomologicalPointCounting/EtaleBaseChange Layer 5.

**Checks.**

- Y = P^{r−1} (X = 𝔸^r, X* = 𝔸^r − {0}): the sequence recovers H^i(𝔸^r − {0}) = F for i = 0, 2r − 1 and 0 otherwise, because cup with η is an isomorphism H^{i−2}(P^{r−1})(−1) → H^i(P^{r−1}) for 2 ≤ i ≤ 2r − 2.

**Lemma (anticommutative boundary).** The composite
`H^{n−1}(Y_0) ≅ H^{n−1}(X̃) → H^{n−1}(X*) → H^n_{0}(X) → H^n_c(X)` is the negative of the boundary
`∂ : H^{n−1}(Y) → H^n_c(X)` of the pair `(X_1, Y)`, under `Y_0 ≅ Y`. The source numbers this lemma 2.7.8; it is
Lemma 2.1.8, as its use in 2.2.7 shows. *Proof sketch.* By the local diagram it suffices to compare the
boundary maps for the closed subsets `{0}` and `Y` of `X_1`, whose complement is `X*`; the sign is the
orientation reversal `−η` versus `η`. (SGA 7 II, Exposé XV, Lemme 2.1.8, p. 17.) *Needs:* the punctured-cone
theorem.

### 2.6 Standard quadratic degenerations

**Definition.** Let `S` be a henselian trait and `Λ = ℤ/k` with `k` invertible on `S`. A standard quadratic
degeneration of relative dimension `n` is the closed subscheme `X ⊂ 𝔸^{n+1}_S` defined by
`Q(x) = Σ_{i≤j} a_{ij} x_i x_j + Σ b_i x_i + c`, nonzero modulo the uniformizer, such that, with `X_1 ⊂ P^{n+1}_S`
the quadric `Σ a_{ij} x_i x_j + Σ b_i x_i z + c z² = 0` and `Y = X_1 ∩ {z = 0}` (so `X = X_1 − Y`): (a) `Y` is a smooth
quadric over `S`, that is, `Σ a_{ij} x_i x_j` is ordinary; (b) `X_s̄` is a quadratic cone, with vertex `x_0` the
singular point of `X_s`. The subscheme of `X_s` cut out by the `∂Q/∂x_i` is concentrated at `x_0` and has degree
one, so `x_0` is rational, except when the residue characteristic is two and `n` is even, where it has rank
two and `k(x_0)` is `k(s)` or a purely inseparable quadratic extension. If `x_0 = 0` the `b_i` and `c` lie in the
maximal ideal. Smoothness of the generic fibre is an additional hypothesis, not part of the definition.
(The source writes "`n + 1` pair" for the exceptional case; it is `n + 1` odd.) Define
`VanishingCycles.StandardQuadraticDegeneration`.

- `VanishingCycles.StandardQuadraticDegeneration`: The data (S, Λ, Q) with the ordinarity of the leading form (a) and the cone condition (b).
- `VanishingCycles.StandardQuadraticDegeneration.vertex`: The singular point x₀ of X_s, rational unless char k(s) = 2 and n is even.
- `VanishingCycles.StandardQuadraticDegeneration.projectiveClosure`: X₁ ⊂ P^{n+1}_S with X = X₁ − Y and Y = X₁ ∩ H a smooth quadric over S.
- `VanishingCycles.StandardQuadraticDegeneration.discriminantCharacter`: For n even, the character ε : I → {±1} of the separable quadratic extension of k(η) given by the centre of the even Clifford algebra of (2.2.1.1).
- `VanishingCycles.StandardQuadraticDegeneration.ofLocalEquation`: The local model Q − b = 0 of a family at a non-degenerate ordinary quadratic point (XV 1.3.2) is a standard degeneration.

*Proof sketch.* The projective closure is a flat family of quadrics and (a) says its section at infinity is
smooth; on `X_s` the partial derivatives define the singular locus of the cone, whose degree is computed
over `k(s̄)` as in the Tjurina lemma; if `x_0` is rational, translate it to the origin. (SGA 7 II, Exposé XV,
2.2.1 and (2.2.1.1), pp. 17–18.) *Needs:* 2.1, 2.2, 2.4.

**Checks.**

- `VanishingCycles.standard_node`: n = 1, Q = xy − π with π a uniformiser: Y = {xy = 0, z = 0} is two points (a smooth quadric of dimension 0), X_s is the cone xy = 0, and the generic fibre is smooth.
- `VanishingCycles.standard_double_point`: n = 0, Q = x² − π with p ≠ 2: Y = ∅, X_s = Spec k(s)[x]/(x²) is a cone, and the geometric generic fibre is two points.
- `VanishingCycles.not_standard_char_two`: char k(s) = 2, n = 1, Q = x² + y² − π: the leading form (x + y)² is not ordinary, so (a) fails.
- `VanishingCycles.standard_trivial_family`: Q = xy (c = 0): the geometric generic fibre is again a cone, so the generic fibre is not smooth, and all R^iΦ vanish (SGA 7 XV, Corollaire 2.2.4).
- The node xy = π and the double point x² = π are standard; x² + y² − π in characteristic 2 is not.

**Theorem (nearby cycles of a standard degeneration).** Let `X/S` be a standard quadratic degeneration
over a strictly henselian trait, `Λ = ℤ/k` with `k` invertible. Ordinary cohomology of the geometric
generic fibre is the nearby stalk at `x_0`, and compactly supported cohomology is the nearby costalk
there. If the generic fibre is still a cone, specialization is an isomorphism and `RΦΛ = 0`. If the
generic fibre is smooth, `RΦΛ` is a rank-one skyscraper at `x_0` in degree `n`; for `n > 0`, `RΨΛ` has the
constant sheaf in degree zero and a rank-one skyscraper in degree `n`, its costalk is concentrated in
degrees `n` and `2n`, both of rank one, and the top trace after twist `n` is an isomorphism; the middle
nearby stalk and costalk pair perfectly with complementary twists by cup product and trace. For `n = 0`
the nearby stalk and costalk are `Λ²`, specialization is the diagonal `Λ → Λ²`, and the vanishing line is its
cokernel; these degree-zero objects are kept apart.

*Proof sketch.* The comparisons with the geometric generic fibre come from proper base change for `X_1`
and supports (XIII 2.1.8.6, 2.1.10.5); the cone proposition applies to `Λ` on `X_s̄`, and `RΦ` is supported
at `x_0`. If `X_η̄` is a cone both sides have cohomology `Λ` in degree zero only, and the specialization
sequence gives `RΦ = 0`. If `X_η` is smooth, `X_η̄` is an affine quadric and 2.3 computes `H^i` and `H^i_c`; pass
to `ℤ/k` by the universal coefficient formula, and use Poincaré duality on `X_η̄`. (SGA 7 II, Exposé XV,
Proposition 2.2.3, pp. 18–19; Corollaire 2.2.4, p. 19; 2.2.5 A–C, pp. 19–20.) *Needs:* the definition
above, 2.3, 2.5, 0.5, 0.6; EtaleDualityAndPerverseSheaves Layer EDC.2.

**Checks.**

- n = 1, xy = π: R¹Φ(Λ) is Λ at the origin, and H¹_c(X_η̄) ≅ Λ with X_η̄ ≅ 𝔾_m.
- n=0, x²=π with residue characteristic ≠2: R⁰Ψ and degree-zero nearby costalk have rank 2, while R⁰Φ=coker(Λ→Λ²) for the diagonal specialization has rank 1. The trace-zero kernel of Λ²→Λ belongs to the dual support description, not the definition of R⁰Φ.

**Theorem (variation in a standard degeneration).** For a standard quadratic degeneration with smooth
generic fibre over a strictly henselian trait, choose the middle costalk generator `δ` and stalk
generator `δ'` compatibly with the orientation of the affine quadric, normalized by `(δ', δ) = 1`.

- (`n = 2m > 0`.) Both have twist `m`, the forget-supports map sends `δ` to `(−1)^m · 2δ'`, both transform by the
  quadratic character `ε` of the even Clifford centre of the leading form, and
  `Var(σ)(a) = (−1)^m ((ε(σ) − 1)/2) (a, δ) δ`, the integral coefficient being computed with coefficients
  `ℤ/2k` before reduction to `Λ = ℤ/k`.
- (`n = 2m + 1`.) The costalk twist is `m`, the stalk twist `m + 1`, the forget-supports map is zero, and
  inertia acts trivially on these cohomology groups although the variation can be nonzero:
  `Var(σ)(δ') = λ(σ)δ` for an additive character `λ : I → Λ(1)`, which is a scalar `λ_X` times the Kummer
  character of the uniformizer, so `Var(σ)(a) = λ_X t_k(σ) (a, δ) δ`. The value of `λ_X`, sign included, is
  the odd Picard–Lefschetz theorem of 2.7.

The source writes `D(σ)` for `Var(σ)` in (2.2.5.9). *Proof sketch.* Even case: 2.3 gives `δ`, `δ'` and
`φ(δ) = (−1)^m · 2δ'`; inertia acts on the two families of generatrices of `X_{1,η̄}` through the Clifford centre,
hence by `ε` on `δ = cl(α) − cl(β)` and on `δ'`; `Var(σ)(a) = c(σ)(a, δ)δ` because the target is the line spanned
by `δ`, and `σ = 1 + q ∘ Var(σ)` (0.4) with `q(δ) = φ(δ)` gives `ε(σ)δ' = (1 + 2c(σ)(−1)^m)δ'`, solved in `ℤ/2k`.
Odd case: the trivial action follows from 2.3 and the smoothness of `Y/S`; `λ` is additive by the cocycle rule
of 0.4, and every homomorphism from tame inertia to `Λ(1)` is a multiple of the Kummer character. (SGA 7 II,
Exposé XV, 2.2.5 D, (2.2.5.3)–(2.2.5.6), p. 21; 2.2.5 E–F, (2.2.5.9)–(2.2.5.10), pp. 21–22.) *Needs:* the
nearby-cycle theorem above, 2.2, 2.3, 0.1, 0.4.

**Checks.**

- n = 0, x² = π, p ≠ 2: ε is the character of k(η)(√π), and Var(σ)(a) = −(a, δ)δ when ε(σ) = −1, the swap of the two points.
- n = 1, xy = π: Var(σ)(a) = λ_X t_ℓ(σ)(a, δ)δ with λ_X = −1 (Weil I (4.1): x − (x, δ)δ for n ≡ 1 mod 4).

**Theorem (local description of the vanishing cycle).** In a standard quadratic degeneration with
smooth generic fibre over a strictly henselian trait, with `Λ = ℤ/k`:

- (`n` even.) `±δ` is the unordered pair obtained from the distinguished geometric classes of 2.3 by
  coefficient reduction with one common geometric sign. When `k` is a power of one odd prime this is the
  same as `(δ, δ) = (−1)^m · 2`; for `k` with two distinct odd prime factors the norm condition does not
  single out `±δ` (the source claims it does whenever `2 ∤ k`), and neither does a choice made separately at
  each primary factor.
- (`n = 2m + 1`, so `x_0` is rational.) Let `X_{s(0)}` be the henselization of `X_s` at `x_0`, `X̃_{s(0)}` its blow-up at
  `x_0`, `Y_0` the exceptional divisor (a smooth quadric of dimension `2m`) and `X*_{s(0)} = X_{s(0)} − {x_0}`. The
  composite `H^{n−1}(Y_0, Λ(m)) ≅ H^{n−1}(X̃_{s(0)}, Λ(m)) → H^{n−1}(X*_{s(0)}, Λ(m)) → H^n_{x_0}(X_s, Λ(m)) →
  H^n_{x_0}(X_s, RΨ_η̄Λ(m))` identifies the last group with the primitive quotient of `H^{2m}(Y_0, Λ(m))`, and `±δ`
  is the image of the natural generators of that primitive quotient.

*Proof sketch.* Even case: another generator with the same norm is `uδ` with `u² = 1` in `ℤ/k`, and `u = ±1` only
when `ℤ/k` has no other square roots of one. Odd case: `±δ` is determined by its image in `H^n_c(X_η̄)`; by the
local diagram of 2.5 the composite is, by the anticommutativity lemma and up to sign, the boundary
`H^{n−1}(Y_η̄) → H^n_c(X_η̄)` of 2.3, which carries the generators of the primitive quotient to `±δ`. (SGA 7 II,
Exposé XV, 2.2.6 and (2.2.6.1)–(2.2.6.2), p. 22; Lemme 2.2.7, pp. 22–23.) *Needs:* the variation theorem
above, 2.3, 2.5.

**Checks.**

- n = 1, xy = π: Y₀ is the two tangent directions at the node, H⁰(Y₀) = Λ², its primitive quotient is Λ, and δ generates H¹_c(X_η̄) = H¹_c(𝔾_m).
- k = 15, m even: u = 4 satisfies u² ≡ 1, so 4δ also has (4δ, 4δ) = 2, and the characterisation by (δ, δ) alone does not single out ±δ.
- The ambiguity persists after a 2-primary lift: 19²=1 in ℤ/60 and 19 reduces to 4 in ℤ/15; this is not the reduction of either globally signed geometric generator.

### 2.7 Nearby cycles and variation at an ordinary quadratic point

**Theorem (concentration and rank).** Let `f : X → S` be flat of finite type and of pure relative dimension
`n` over a henselian trait, with special fibre smooth away from finitely many ordinary quadratic points;
let `Σ` be those points and `E ⊂ Σ` the points near which the generic fibre is smooth. With finite
coefficients `Λ` invertible on `S`, `R^iΦΛ = 0` for `i ≠ n`, and `R^nΦΛ` is supported exactly on `E`, with stalks
free of rank one. The local nearby stalk and costalk pairing is perfect. For `n = 0` the nearby-cycle stalk
in degree zero has rank two while the vanishing-cycle stalk has rank one. (The source calls `Σ` the set
written `E` here, and its part (iii) is about `Ψ`, not `Φ`.) *Proof sketch.* Reduce through the local equation
(2.4) to the standard degeneration (2.6); smooth local acyclicity removes the smooth locus and the
persistent-cone case removes `Σ − E`; the affine-quadric duality calculation gives the rest, keeping `Ψ`
and `Φ` apart in degree zero. (SGA 7 II, Exposé XV, Proposition 3.1.2 and its proof, p. 24.) *Needs:* 0.5,
2.4, 2.6.

**Checks.**

- Outside E (points near which the generic fibre is not smooth) the vanishing cycles vanish (SGA 7 XV, Corollaire 2.2.4).
- For n=0 the nearby stalk and nearby costalk have rank two; the vanishing stalk, coker(Λ→Λ²), has rank one.

**Theorem (even relative dimension).** Let `x ∈ E` be an ordinary quadratic point of relative dimension
`n = 2m` over a strictly henselian trait. The middle nearby costalk twisted by `m` has an integral
orientation `δ`, unique up to sign, with `(δ, δ) = (−1)^m · 2` (for `n = 0`, impose trace zero inside the
rank-two nearby object). The vanishing line carries a quadratic inertia character `ε_x`, independent of
the coefficients, and `Var(σ)(a) = (−1)^m ((ε_x(σ) − 1)/2)(a, δ)δ`, the integral coefficient being defined
before reduction (using twice the modulus when necessary). `ε_x` is the character of the centre of the
even Clifford algebra of the local quadratic model. When the residue characteristic is not two and the
local model is `Q = b`, `ε_x = ε^{v(b)}` with `ε` the quadratic Kummer character of a uniformizer, and the
Clifford centre is obtained by adjoining a square root of `(−1)^{m+1} · 2b · det(a_{ij})` in the polar-matrix
convention of the source: even `v(b)` gives trivial variation and odd `v(b)` the reflection. In
characteristic two the Clifford-centre description is the statement. *Proof sketch.* Treat the universal
case `A = ℤ_ℓ` and use uniqueness of `δ` up to sign; reduce to the standard degeneration (2.6, the variation
theorem); compute `ε_x` from the Clifford algebra (2.2). (SGA 7 II, Exposé XV, Proposition 3.2.1,
pp. 24–25; 3.2.3, pp. 25–26.) *Needs:* the theorem above, 0.4, 2.2, 2.3, 2.6.

**Checks.**

- For v(b) even the local monodromy is trivial in even relative dimension; for v(b) odd it is the reflection σ(δ) = −δ (when ε_x(σ) = −1).
- Sign convention: (δ, δ) = (−1)^m·2 fixes δ up to sign, and the n mod 4 sign table of 2.8 is checked against this normalisation.

**Theorem (characteristic two).** In even fibre dimension and residue characteristic two, the vanishing stalk at an ordinary quadratic
point is still of rank one, but `ε_x` is the separable quadratic character of the even Clifford centre of the
generic quadratic model; it can be wildly ramified, and is not replaced by the unique tame quadratic
character used when `p ≠ 2`. With rational coefficients (`ℓ ≠ 2`) the local monodromy is
`x ↦ x + (−1)^m ((ε_x(σ) − 1)/2)(x, δ)δ` with `δ² = (−1)^m · 2`; with finite coefficients the formula is defined by
lifting before dividing by two. A nontrivial reflection occurs exactly where `ε_x(σ) = −1`. *Proof sketch.*
Apply the even theorem and identify the separable quadratic extension of the Clifford centre, keeping the
linear term `x_0` of the degenerate local model, whose discriminant extension is not the Kummer extension of
a uniformizer. (Weil II, 4.2.1–4.2.3, pp. 219–220.) *Needs:* the even theorem, 2.2, 2.4, 0.1.

**Checks.**

- For a characteristic-two zero-dimensional separable quadratic family the two generic points are exchanged by the wild quadratic character.
- The tame generation statements of Layer LPV.5 are not applied to this wild branch.

**Theorem (odd relative dimension, the Picard–Lefschetz formula at a point).** Let `X → S` have an ordinary
nondegenerate quadratic singularity of relative dimension `n = 2m + 1` with smooth generic fibre, local
equation `Q − b = 0`, `b ≠ 0` in the maximal ideal of the henselian trait. The primitive quotient of the
cohomology of the exceptional quadric determines `±δ` (2.6). For finite coefficients prime to the residue
characteristic,

```text
Var(σ)(a) = (−1)^{m+1} ε_b(σ) (a, δ) δ,     ε_b(σ) = σ(b^{1/r})/b^{1/r} ∈ μ_r = Λ(1),
```

the root being a root of `b`; for a proper family this gives `σ(a) = a + (−1)^{m+1} ε_b(σ)(a, δ)δ` on middle
cohomology, and with `ℚ_ℓ` coefficients `ε_b = v(b) t_ℓ`. The twists make `ε_b(σ)(a, δ)δ` untwisted.

*Proof sketch.* The algebraic proof (Illusie 2002, described in Illusie 2021, §6.1) runs through the
semistable calculation of 1.9. For the model `Q(x_0, …, x_n) = t` (`n + 1` even), the base change `t = s²` of
ramification index two gives the nondegenerate cone `Q(x) = s²` in `n + 2` variables; blowing up its vertex
gives a regular scheme whose special fibre is reduced with two smooth components, the strict transform of
the cone `Q = 0` and the exceptional divisor (the smooth quadric `Q(x) = s²` of dimension `n` in `P^{n+1}`),
meeting transversally in the smooth quadric `Q = 0` of dimension `n − 1`. The two-component complex of 1.9
identifies `N`; restriction and Gysin maps on the exceptional quadric and its primitive classes (2.3) give the
coefficient `(−1)^{m+1}`; the factor two of the base change is absorbed by `t_ℓ|_{I'} = 2t'_ℓ` (0.1); one returns
to the original family through the dominant-trait exchange (0.6) and the naturality of `can` and `var` (1.7).
Illusie's erratum corrects the concentration range used in the local calculation (`|i| > 1`, not `|i| > −1`).
The purity needed for the regular pairs over the trait is 0.10 (in the semistable case it is due to
Rapoport–Zink, Illusie 2021, §6.3). The original proof of SGA 7 XV 3.3 is transcendental: it lifts to
characteristic zero and compares with Betti nearby cycles; the comparison of 2.8 checks the signs. (Illusie 2021, §6.1, pp. 103–104,
and §6.3, pp. 104–105; Illusie 2002 erratum, correcting p. 251, line 18; SGA 7 II, Exposé XV, 3.3.2–3.3.6,
pp. 26–30.) *Needs:* 0.4, 0.6, 0.10, 1.7, 1.9, 2.3, 2.4, 2.6; 0.1 (Kummer and tame characters);
EtaleDualityAndPerverseSheaves Layer EDC.3.

**Checks.**

- The formula has the sign (−1)^{m+1} and the twist Λ(m); the quadratic character of the even case is replaced by the Kummer character ε_b of b.
- The global formula requires properness; the case δ = 0 is the direct-image theorem of 2.8.

### 2.8 The Picard–Lefschetz formula for a proper family

In this subsection `S` is the spectrum of a henselian discrete valuation ring with algebraically closed
residue field of characteristic `p`, `ℓ ≠ p`, and `f : X → S` is proper with `X` regular of pure dimension
`n + 1`, smooth except at one ordinary quadratic point `x` of the special fibre (so the generic fibre is
smooth and proper); write `n = 2m` or `n = 2m + 1`, and `(x, δ) = Tr(x ∪ δ)`. The general residue field is
reached by passing to the strict henselization.

**Theorem (specialization sequence).** (i) There is a vanishing cycle `δ ∈ H^n(X_η̄, ℚ_ℓ)(m)`, well defined up
to sign. (ii) `sp : H^i(X_s, ℚ_ℓ) ≅ H^i(X, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ)` is an isomorphism for `i ≠ n, n + 1`. (iii) There
is an exact sequence

```text
0 → H^n(X_s, ℚ_ℓ) → H^n(X_η̄, ℚ_ℓ) → ℚ_ℓ(m − n) → H^{n+1}(X_s, ℚ_ℓ) → H^{n+1}(X_η̄, ℚ_ℓ) → 0
```

whose middle map is `x ↦ Tr(x ∪ δ)` and whose other maps are specialization.

*Proof sketch.* Proper base change gives `H^i(X_s) = H^i(X)` and `H^i(X_η̄) = H^i(X_s̄, RΨ_ηℚ_ℓ)` (finite
coefficients, then the limit, 0.8). The vanishing triangle gives the long exact sequence; by 2.7, `RΦℚ_ℓ` is
a line in degree `n` supported at `x`, giving (ii); the generator of 2.7 and the duality of 2.7 identify
`R^nΦ_x` with `ℚ_ℓ(m − n)` and the map with `x ↦ Tr(x ∪ δ)`. (Weil I, (4.2), p. 288; (4.3) and (4.3.1)–(4.3.3),
p. 288; (5.13) B), p. 294.) *Needs:* 0.5, 0.6, 0.8, 2.6, 2.7; EtaleDualityAndPerverseSheaves Layer EDC.2
(Poincaré duality and the trace pairing).

**Checks.**

- n = 1, a curve of genus g acquiring one node: if the node is nonseparating, δ ≠ 0, the middle map is onto, dim H^1(X_s) = 2g − 1 and H^2(X_s) ≅ H^2(X_η̄); if it separates, δ = 0, H^1(X_s) ≅ H^1(X_η̄) and dim H^2(X_s) = 2.
- n = 0, X = Spec A[y]/(y² − π) with p ≠ 2: X_η̄ is two points, δ = e₁ − e₂ and the sequence is 0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0.

**Theorem (Picard–Lefschetz formula).** Let `I = Gal(η̄/η)` act on `H^i(X_η̄, ℚ_ℓ)`. Inertia acts trivially for
`i ≠ n`. On `H^n`:

- (A) if `n = 2m + 1` is odd, `σx = x + (−1)^{m+1} t_ℓ(σ) (x, δ) δ`, with `t_ℓ : I → ℤ_ℓ(1)` the tame character;
- (B) if `n = 2m` is even and `p ≠ 2`, let `ε : I → {±1}` be the unique character of order two; then `σx = x` when
  `ε(σ) = 1`, `σx = x + (−1)^{m+1} (x, δ) δ` when `ε(σ) = −1`, and `(δ, δ) = (−1)^m · 2`.

Equivalently, in the table of Weil I (4.1), the sign in `σx = x ± …` is `−` for `n ≡ 0, 1` and `+` for
`n ≡ 2, 3 mod 4`, and `(δ, δ) = 2, 0, −2, 0`. The twists are those of the specialization sequence:
`δ ∈ H^n(X_η̄)(m)` and `(x, δ) ∈ ℚ_ℓ(m − n)`, so `t_ℓ(σ)(x, δ)δ ∈ H^n(X_η̄)` for `n` odd.

*Proof sketch.* Proper base change identifies the `I`-module `H^n(X_η̄)` with `H^n(X_s̄, RΨ_ηℚ_ℓ)`, on which
`σ = 1 + Var(σ) ∘ q` (0.4); for `i ≠ n`, `R^iΦ = 0` and `σ` acts trivially. For `n` odd use 2.7 with `b` a
uniformizer (`X` is regular), so `ε_b = t_ℓ`. For `n` even and `p ≠ 2` use the even theorem of 2.7: regularity of
`X` makes `ε_x` nontrivial, and the tame quotient of `I` has a unique character of order two. Evaluate at
`n = 0, 1, 2, 3` to obtain the table. (Weil I, (4.3) A)–B), pp. 288–289; (4.1), p. 287.) *Needs:* the
specialization sequence, 0.1, 0.4, 2.7.

**Checks.**

- n = 0, X = Spec A[y]/(y² − π), p ≠ 2: σ with ε(σ) = −1 swaps the two points, and x − (x, δ)δ with δ = e₁ − e₂ sends e₁ to e₂.
- Sign table for n = 0, 1, 2, 3: signs −, −, +, +; (δ, δ) = 2, 0, −2, 0; σδ = −δ for n even when ε(σ) = −1 and σδ = δ for n odd.

**Theorem (direct images).** Let `j : η → S`. (a) If `δ ≠ 0`, then `R^i f_*ℚ_ℓ` is constant for `i ≠ n` and
`R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ`. (b) If `δ = 0`, which happens only for `n` odd since `(δ, δ) = ±2` for `n` even, then
`R^i f_*ℚ_ℓ` is constant for `i ≠ n + 1`, and `0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0` is exact,
with `j_*j^*R^{n+1}f_*ℚ_ℓ` constant and `ℚ_ℓ(m − n)_s` the skyscraper at `s`. *Proof sketch.* A sheaf on `S` is a
triple `(G_s̄, G_η̄, φ : G_s̄ → G_η̄^I)` (0.2), which for `R^i f_*ℚ_ℓ` is `(H^i(X_s), H^i(X_η̄), sp)`; it is constant iff
`I` acts trivially and `sp` is an isomorphism, and equals `j_*j^*` of itself iff `sp` is an isomorphism onto the
invariants. If `δ ≠ 0`, Poincaré duality gives `x` with `(x, δ) ≠ 0`, so the middle map of the sequence is onto;
in degree `n`, `sp` is injective with image `δ^⊥`, which is the invariant subspace because the fixed space of
`x ↦ x + c(x, δ)δ`, `c ≠ 0`, is `δ^⊥` (Mathlib `LinearEquiv.mem_fixedSubmodule_transvection_iff` in the odd case,
where the functional kills `δ`; a direct computation for the even reflection). If `δ = 0`, inertia acts
trivially and the sequence becomes the stalk at `s̄` of the stated sequence. (Weil I, (4.4) a)–b), p. 289.)
*Needs:* the specialization sequence and the Picard–Lefschetz formula above; 0.2 (sheaves on a trait as triples);
EtaleDualityAndPerverseSheaves Layer EDC.2; Mathlib `LinearEquiv.mem_fixedSubmodule_transvection_iff`.

**Checks.**

- δ = 0 is realised by a genus-g curve acquiring a separating node (n = 1): R² f_*ℚ_ℓ has stalk ℚ_ℓ(−1)² at s and ℚ_ℓ(−1) at η̄.

**Comparison (complex signs).** For an algebraic family over `ℂ` of finite type with a single ordinary
quadratic critical point, the étale specialization triangle with finite coefficients, the inertia action
and the primitive-quadric generator of 2.6 correspond under Artin comparison to the classical Milnor-fibre
triangle, the positively oriented small loop and the vanishing sphere (up to sign), compatibly with cup
products, trace and the Tate orientation `ℤ/n(1) = μ_n ↔ (2πi)ℤ/n`. For `n mod 4 = 0, 1, 2, 3` the
Picard–Lefschetz coefficient is `−, −, +, +` and the self-intersection of the vanishing cycle is
`2, 0, −2, 0`. This comparison checks conventions; it is not the algebraic proof in positive
characteristic. *Proof sketch.* Use the relative Artin comparison, its cup-product and trace
compatibility and the Riemann existence identification of paths (CohomologicalPointCounting/
ComplexComparison Layers 8, 10 and 12); identify the algebraic generator with the Milnor vanishing
sphere through the ordinary local normal form; compare the specialization sequences and monodromy; check
the four entries of Weil I (4.1); replacing `δ` by `−δ` does not change the operator. (Weil I, §4.1,
pp. 287–288.) *Needs:* the Picard–Lefschetz formula, the local description of the vanishing cycle;
CohomologicalPointCounting/ComplexComparison Layers 8, 10, 12; EtaleDualityAndPerverseSheaves Layer EDC.6.

**Checks.**

- The n=0 model z²=t exchanges the two points and δ=(1,−1) has square 2.
- The n=1 nodal Milnor fibre gives a transvection with coefficient − and δ²=0.

### Examples

- The double point `x² = π` (`n = 0`, `p ≠ 2`): `X_η̄` is two points, `δ = e_1 − e_2`, the specialization sequence is
  `0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0`, and the inertia element with `ε(σ) = −1` swaps the points:
  `x ↦ x − (x, δ)δ` sends `e_1` to `e_2`.
- A curve of genus `g` acquiring one node (`n = 1`): if the node is nonseparating, `δ ≠ 0`,
  `dim H^1(X_s) = 2g − 1` and `H^2(X_s) ≅ H^2(X_η̄)`; if it separates, `δ = 0`, `H^1(X_s) ≅ H^1(X_η̄)` and
  `dim H^2(X_s) = 2`, and `R^2 f_*ℚ_ℓ` has stalk `ℚ_ℓ(−1)²` at `s` and `ℚ_ℓ(−1)` at `η̄`.
- The Fresán–Sabbah–Yu models (Fresán–Sabbah–Yu, §5.1.3, pp. 41–44, determinant on p. 44): for an odd
  prime and the ordinary quadratic points of their Kloosterman family with `k = 2m + 1`, the orthogonal
  vanishing line has square `(−1)^m · 2`, Tate twist `−m`, and quadratic Galois character given by adjoining a
  square root of `(−1)^{(1+ap)/2} · 2ap`, the Clifford-centre character of the even theorem of 2.7 computed from
  the Hessian determinant in their coordinates.

### Dependencies

Layers LPV.0 and LPV.1; Mathlib (`QuadraticMap`, `CliffordAlgebra.even`, `MvPowerSeries`, `HenselianRing`,
`LinearEquiv.transvection`); AlgebraicModuliForArithmeticGeometry Layers 1 (projective bundles) and 6
(Artin approximation); SchemeAndStackFoundations Layers 0 (henselization, smoothness) and
3; TauCetiRoadmap ModularCurves Layer 4D (completions); EtaleDualityAndPerverseSheaves Layers EDC.2, EDC.3, EDC.4, EDC.6; CohomologicalPointCounting
(EtaleBaseChange Layers 4–5, ComplexComparison Layers 8, 10, 12, TraceFormula Layers 11–12).

## Layer LPV.3: Lefschetz pencils

This layer defines Lefschetz pencils as actual schemes and morphisms and proves that they exist after a
Veronese re-embedding of degree at least two. It constructs the dual variety and the incidence family,
identifies the total space of a pencil with the blow-up of the variety along the axis, proves openness
of the good axes by jet calculations, treats the low-dimensional and characteristic-two cases, and
descends pencils to a finite extension of a finite base field. Throughout, `k` is algebraically closed
of characteristic `p` (except in 3.5), `P = P^N_k` with `N ≥ 1`, `P̌` its dual, `H_t` the hyperplane of
`t ∈ P̌`, and `X ⊂ P` a smooth connected projective variety of dimension `n + 1`. Projective spaces, their
duals and Grassmannians are the projective bundles and Grassmannians of AlgebraicModuliForArithmeticGeometry
Layer 1 (§1.1 and §1.3); the Veronese embeddings are built in 3.4 from its relative very ampleness (§1.4).

### 3.1 Lefschetz pencils

**Definition.** For a linear subspace `A ⊂ P` of codimension two (the *axis*), let `D ⊂ P̌` be the line of
hyperplanes containing `A`, `X_t = X ∩ H_t` for `t ∈ D`, and `X̃ = {(x, t) ∈ X × D : x ∈ H_t}` with projections
`π : X̃ → X` and `f : X̃ → D`, so that `f^{−1}(t) = X_t`. The family `(X_t)_{t∈D}` is a **Lefschetz pencil** if:

- (A) `A` is transverse to `X`: `A ∩ X` is smooth of codimension two in `X`, or empty;
- (B) there are a finite set `S ⊂ D` and points `x_s ∈ X_s`, `s ∈ S`, such that `f` is smooth outside `{x_s}`;
- (C) each `x_s` is an ordinary quadratic singular point of `X_s` (2.4).

Under (A), 3.3 identifies `π` with the blow-up of `X` along `A ∩ X`, so `X̃` is smooth, and for each `s ∈ S` the
local theory of Layer LPV.2 applies to `X̃ ×_D D_(s)` over the henselization `D_(s)`. Define
`LefschetzPencil.IsLefschetzPencil X A`.

- `LefschetzPencil.IsLefschetzPencil`: IsLefschetzPencil X A : Prop, conditions (A)–(C) for the axis A.
- `LefschetzPencil.totalSpace`: X̃ ⊂ X × D with π and f, and f^{-1}(t) = X ∩ H_t.
- `LefschetzPencil.totalSpace_iso_blowup`: Under (A), π : X̃ ≅ Bl_{A∩X} X and X̃ is smooth over k.
- `LefschetzPencil.singularSet`: The finite set S ⊂ D with its points x_s, and f smooth on X̃ − {x_s}.
- `LefschetzPencil.localModel`: X̃ ×_D D_s → D_s is proper, X̃ ×_D D_s is regular of dimension n + 1, and it is smooth except at the ordinary quadratic point x_s.

*Proof sketch.* `X̃` is cut out in `X × D` by the bilinear incidence equation. (B) makes `S` finite with `f` smooth
elsewhere, and (C) is the local condition of 2.4; by 2.4, `X̃ ×_D D_(s)` is regular of dimension `n + 1` (given the
smoothness of `X̃` from 3.3) and smooth except at `x_s`. (Weil I, §5, (5.1)–(5.1.1), p. 289, and (5.6), pp. 291–292.)
*Needs:* 2.4 (ordinary quadratic points and the corollary on non-smooth points); AlgebraicModuliForArithmeticGeometry
Layer 1 (projective bundles).

**Checks.**

- `LefschetzPencil.line_in_plane`: X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre.
- `LefschetzPencil.quadric_surface`: X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1.
- `LefschetzPencil.cubic_surface`: X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1.
- `LefschetzPencil.hermitian_curve_not_lefschetz`: p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding.

### 3.2 The dual variety

**Definition.** Let `Y = {(x, t) ∈ X × P̌ : x ∈ H_t}` with `g : Y → P̌`, whose fibre over `t` is `X_t`. The **dual
variety** `X̌ ⊂ P̌` is the reduced closed image of the conormal variety
`C = {(x, t) : x ∈ X, T_xX ⊂ H_t}` (`T_xX` the projective tangent space); `t ∈ X̌` exactly when `H_t` is tangent to
`X`, that is when `X_t` is singular or `X ⊂ H_t`. `C` is a projective bundle over `X` with fibres `P^{N−n−2}` (empty
when `N = n + 1`), so `X̌` is irreducible when nonempty; `g` is smooth over `P̌ − X̌`; and for a Lefschetz pencil
with parameter line `D`, `S = D ∩ X̌` (`X ⊂ H_t` cannot happen for `t ∈ D`, because `A ∩ X` has codimension two in
`X`). For `X = P` the conormal variety and the dual are empty. Define `LefschetzPencil.dualVariety`.

- `LefschetzPencil.dualVariety`: X̌ ⊂ P̌, the reduced closed image of the conormal variety {(x, t) : T_xX ⊂ H_t}.
- `LefschetzPencil.mem_dualVariety_iff`: t ∈ X̌ if and only if X ∩ H_t is singular or X ⊂ H_t.
- `LefschetzPencil.dualVariety_isIrreducible`: If X is smooth, connected, projective and its dual is nonempty, the reduced dual is irreducible. For X equal to the ambient projective space the dual is empty.
- `LefschetzPencil.incidence_smooth_off_dual`: g : Y → P̌ is smooth over P̌ − X̌.
- `LefschetzPencil.singularSet_eq_inter_dual`: For a Lefschetz pencil, S = D ∩ X̌.

*Proof sketch.* The conormal variety is a projective bundle over `X`, hence irreducible when nonempty, and
`X̌` is its image. The Jacobian criterion at each point of `X ∩ H_t` shows `t ∉ X̌` exactly when `X ∩ H_t` is smooth of
dimension `n`, which is smoothness of `g` along `g^{−1}(t)`. (Weil I, §5, proof of (5.4), pp. 290–291.) *Needs:*
AlgebraicModuliForArithmeticGeometry Layer 1, §1.1 (projective bundles); Mathlib's Jacobian criterion
(`Algebra.IsStandardSmooth`) and `AlgebraicGeometry.Scheme.Hom.isClosedMap` (images of proper maps).

**Checks.**

- `LefschetzPencil.dualVariety_projectiveSpace`: X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅.
- `LefschetzPencil.dualVariety_linear`: X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface.
- `LefschetzPencil.dualVariety_conic`: X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac.
- `LefschetzPencil.dualVariety_conic_char_two`: p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic.
- A smooth plane conic has the dual conic for `p ≠ 2` and a line for `p = 2`.

### 3.3 The total space of a pencil

**Theorem.** Let `X ⊂ P` be smooth projective of dimension at least one and `A` an axis transverse to `X`. The
incidence family `X̃ = {(x, H) : x ∈ X ∩ H, H ⊃ A}` over the line `D` is canonically the blow-up `Bl_{A∩X} X`, with
the hyperplane sections as fibres. The centre is smooth of codimension two when nonempty, `X̃` is smooth and
`f : X̃ → D` is projective. For a curve a general axis misses `X`, the centre is empty and the blow-up is `X`.
*Proof sketch.* Write the incidence equation `s_0 u_1 − s_1 u_0 = 0` with `s_0, s_1` the sections cutting out
the axis; since `(s_0, s_1)` is a regular sequence on `X` near `A ∩ X`, the universal property of the Rees-algebra
blow-up identifies `X̃` with `Bl_{A∩X} X`; check smoothness in the two coordinate charts and projectivity of
`f`; the empty centre is the identity case of the universal property. (SGA 7 II, Exposé XVII, 2.2,
pp. 4–5 (book pp. 215–216); Exposé XVIII, §§2–3, pp. 5–17 (book pp. 259–271).) *Needs:* 3.1;
TauCetiRoadmap StableReduction Layer 4 (Rees algebra and blow-up of a finite-type ideal, universal
property, affine charts); SchemeAndStackFoundations Layer 0, §0.8.

**Checks.**

- A quadric-surface pencil blows up the two points of its axis intersection.
- A line in P² with a disjoint point axis has total space X and no critical fibre.

### 3.4 Existence of Lefschetz pencils

**Theorem (good axes form a dense open).** For `X` smooth projective connected of positive dimension,
after a Veronese embedding of degree `r ≥ 2`, the hyperplanes whose section has at most one singular point,
an ordinary quadratic one, form a dense open subset of the dual locus, and the bad hyperplanes form a
closed subset of codimension at least two in `P̌`. Together with the open transversality condition on the
axis this gives a nonempty open set of axes `A` (in the Grassmannian of codimension-two subspaces) for which
`(X_t)_{t∈D}` is a Lefschetz pencil. The good-axis conditions concern ordinary singularities, not the
separability of the Gauss map. *Proof sketch.* Use the degree-`r` one-jet map and prescribe a nondegenerate
quadratic two-jet at one point; bound the hyperplanes with a nonordinary singularity using the open set of
ordinary forms (2.1); estimate the incidence of hyperplanes with two singular points, separating `r ≥ 3`
from `r = 2`, where the common mixed coefficient can lower the number of independent conditions by one when
the joining line lies in both tangent spaces; treat linear `X` by an explicit quadratic pencil; combine the
codimension bounds with transversality of the axis. (SGA 7 II, Exposé XVII, Théorème 2.5, p. 6 (book
p. 217); §§3.2–3.7, pp. 7–23 (book pp. 218–234); §§4.1–4.3, pp. 24–29 (book pp. 235–240), especially
Proposition 4.3.) *Needs:* 2.1, 2.4, 3.2; AlgebraicModuliForArithmeticGeometry Layer 1, §1.3
(Grassmannians); Mathlib `AdicCompletion` (jets and completed local rings).

**Checks.**

- A degree-two embedding of a linear variety is covered by the explicit quadratic-pencil case.
- In degree two the proof does not assert that the two one-jet maps are jointly surjective onto two
  arbitrary independent jet spaces; the count loses one condition in the tangent-line configuration.

**Theorem (existence of Lefschetz pencils).** For `r ≥ 1` let `i_r : P → P^{C(N+r, N) − 1}` be the Veronese
embedding by the monomials of degree `r`, whose hyperplane sections are the degree-`r` hypersurface sections
of `P`. Define it as `LefschetzPencil.veronese r`, the classifying map of `O(r)` on `P^N_k`
(AlgebraicModuliForArithmeticGeometry Layer 1, §1.4, `ProjectiveBundles.IsRelativelyVeryAmple.completeMap`), and
prove `LefschetzPencil.veronese_isClosedImmersion` (`O(r)` is very ample for `r ≥ 1`, so `i_r` is a closed
immersion) and `LefschetzPencil.veronese_hyperplane` (the pullback of a hyperplane is the hypersurface of the
corresponding degree-`r` form). If `r ≥ 2` and `X` is embedded by `i_r ∘ i_1`, the axes `A` for which `(X_t)_{t∈D}` is a Lefschetz pencil
contain a nonempty open subset of the Grassmannian; equivalently, a sufficiently general pencil of
degree-`r` hypersurface sections of `X` is a Lefschetz pencil. For `r = 1` and `p ≠ 0` the original embedding may
admit no Lefschetz pencil at all. *Proof sketch.* Take an axis in the open set of the previous theorem; the
incidence blow-up (3.3) gives the smooth projective total space; the ordinary one-point conditions give
finitely many critical fibres, each with one ordinary quadratic point. (Weil I, §5, (5.7), p. 292, and
(5.13) C), p. 294; the proof is SGA 7 XVII.) *Needs:* 3.1–3.3 and the previous theorem; 2.4;
AlgebraicModuliForArithmeticGeometry Layer 1, §1.4 (relative very ampleness).

**Checks.**

- The Hermitian curve of degree q + 1 in characteristic p odd has no Lefschetz pencil of lines, while a general pencil of conics (r = 2) is Lefschetz.

### 3.5 Characteristic two, low dimension and finite fields

**Comparison.** In characteristic two and even fibre dimension `n` the ordinary hyperplane locus can have an
inseparable Gauss map, and a Lefschetz axis is not required to meet the reduced dual transversely as if
the Gauss map were étale; the existence criterion of 3.4 (bad locus of codimension at least two) is applied
directly. For linear `X` the dual has codimension at least two and a general pencil has no singular fibre;
for `X = P` the dual is empty; for a curve the general axis is empty. Connected-fibre cohomology arguments are
applied only in the dimensions where weak Lefschetz in degree zero (connectedness of the hyperplane sections) holds, and `n = 0` is
handled by finite fibres. *Proof sketch.* Use the Hessian and Gauss differential criterion of XVII 3.3–3.5,
separate the characteristic-two parity where ordinary does not imply a nondegenerate polar Hessian, and
check the linear and curve models. (Weil II, 4.2.1–4.2.3 and 4.2.7, pp. 219–221.) *Needs:* 3.2, 3.4, 2.4;
EtaleDualityAndPerverseSheaves Layer EDC.4 (weak Lefschetz, whose degree-zero case is the connectedness of
hyperplane sections).

**Checks.**

- The characteristic-two conic has a line as reduced dual and purely inseparable degree-two Gauss map.
- The line-in-plane pencil has finite singleton fibres and no singular locus.

**Theorem (descent of pencils to a finite field).** Let `X` be smooth projective over `𝔽_q`, embedded by a
Veronese embedding of degree at least two. The open set of good axes is defined over `𝔽_q` and, being
geometrically nonempty, has a point over some finite extension `𝔽_{q^r}`; the resulting axis, its finite
singular set and the ordinary local models descend to `𝔽_{q^r}` by finite presentation. After this extension
the arithmetic Frobenius acting on the cohomology of the fibres is `Frob_{q^r} = (Frob_q)^r`, so a Frobenius
eigenvalue `α` becomes `α^r`. The open set need not have an `𝔽_q`-point. *Proof sketch.* The good-axis open is
Galois-stable by its construction; the residue field of a closed point of this finite-type `𝔽_q`-scheme
is a finite extension; descend the incidence equation and the finite-presentation local conditions;
transport the ℓ-adic realization along the base extension. (Weil I, §7.1, p. 299.) *Needs:* 3.4;
Mathlib `finite_of_finite_type_of_isJacobsonRing` (residue fields of closed points of schemes of finite type
over a field); SchemeAndStackFoundations Layer 0, §0.9 (spreading out of finitely presented data); CohomologicalPointCounting/FrobeniusGeometry Layers 3–5 (`q`-power Frobenius, finite-field descent);
EtaleDualityAndPerverseSheaves Layer EDC.0.

**Checks.**

- The descent theorem supplies a finite extension rather than claiming a rational axis over every small finite field.
- A Frobenius eigenvalue α becomes α^r after the extension; this is how statements about Frobenius eigenvalues are transported from 𝔽_{q^r} back to 𝔽_q.

### Examples

- A line in `P²` with an axis point off it: `S = ∅`, `f : X̃ = X → D` is an isomorphism.
- A smooth quadric surface in `P³` (`p ≠ 2`) with a general line as axis: two singular fibres, each a pair of
  lines; `χ(X̃) = 6 = 2·2 + 2·1`.
- A smooth cubic surface (`p = 0`) with a general axis: twelve nodal plane cubics, the degree `3 · 2²` of the dual
  surface; `χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1`.
- The Hermitian curve `x^{q+1} + y^{q+1} + z^{q+1} = 0`, `q = p^e`, `p` odd: every tangent line meets it with
  multiplicity at least `q ≥ 3`, so no pencil of lines is Lefschetz in this embedding, while a general pencil of
  conics (`r = 2`) is.

### Dependencies

Layer LPV.2; AlgebraicModuliForArithmeticGeometry Layer 1 (projective bundles, Grassmannians, relative very
ampleness); TauCetiRoadmap StableReduction Layer 4 (blow-ups); SchemeAndStackFoundations Layer 0; Mathlib's Jacobian criterion and
`AdicCompletion`;
EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.4; CohomologicalPointCounting/FrobeniusGeometry
Layers 3–5.

## Layer LPV.4: Global vanishing cycles

For a Lefschetz pencil this layer describes the direct images `R^i f_*ℚ_ℓ` on the parameter line, defines
the vanishing subspace `E` of the middle cohomology of a smooth fibre by transporting the local vanishing
cycles along étale paths, proves the fixed-space lemma for the local transvections and reflections, and
constructs the nondegenerate pairing on the radical quotient `E/(E ∩ E^⊥)`. It then computes the cohomology
of the total space of the pencil in terms of `X` and the axis. The reduction of the middle cohomology of the
total space to `H^1` of the middle direct image uses the conjugacy and generation theorems and is therefore
stated in Layer LPV.5 (5.5). Throughout, `(X_t)_{t∈D}` is
a Lefschetz pencil of hyperplane sections of `X` (3.1), the case `p = 2` with `n` even is excluded, `U = D − S`,
`j : U → D`, `u ∈ U` is a geometric point, `ℓ ≠ p`, and coefficients are `ℚ_ℓ`; `E` denotes the vanishing
subspace, not a coefficient field. `π_1(U, u)` and étale paths are those of
CohomologicalPointCounting/ConstructibleEtale Layer 3.

### 4.1 The direct images of a pencil

**Theorem.** `R^n f_*ℚ_ℓ` is lisse on `U` and tamely ramified at every `s ∈ S`. Let `δ_s` be the vanishing cycle at
`s` (2.8), transported to `X_u` along a path; whether `δ_s` is zero does not depend on the path.

- (a) If `δ_s ≠ 0` for every `s ∈ S`: `R^i f_*ℚ_ℓ` is constant on `D` for `i ≠ n`, and `R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ`.
- (b) If `δ_s = 0` for every `s ∈ S` (possible only for `n = 2m + 1` odd): `R^i f_*ℚ_ℓ` is constant for `i ≠ n + 1`,
  there is an exact sequence `0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0` with `ℱ` constant, and `E = 0`.

Layer LPV.5 proves, from the conjugacy of the vanishing cycles, that one of (a) and (b) always holds.
*Proof sketch.* `f` is smooth and proper over `U`, so the
`R^i f_*ℚ_ℓ` are lisse there (CohomologicalPointCounting/EtaleBaseChange Layer 8). At `s ∈ S` apply 2.8 to
`X̃ ×_D D_(s)`: inertia acts through `t_ℓ` or the quadratic character, so the ramification is tame, and the
local description of the direct images holds at `s`. A sheaf lisse on all of `D = P¹_k` is constant, since
`π_1(P¹_k) = 1`: a connected finite étale cover `Y → P¹_k` of degree `d` has `g_Y − 1 = −d` by Riemann–Hurwitz
(SchemeAndStackFoundations Layer 3, §3.2, `scheme_riemann_hurwitz`), so `d = 1`; this gives (a) and, in
degree `n + 1`, (b), where the local skyscraper sequences glue and `ℱ = j_*j^*R^{n+1}f_*ℚ_ℓ`. (Weil I, §5, (5.8)
and (5.8) a) 1)–2), b), pp. 292–293; (5.13) D), p. 294.) *Needs:* 3.1, 2.8; CohomologicalPointCounting/
EtaleBaseChange Layer 8; InverseGaloisAndArithmeticFundamentalGroups Layer IG.1.

**Checks.**

- The quadric-surface pencil (`n = 1`, `|S| = 2`) is in case (b): `R² f_*ℚ_ℓ` has an extra `ℚ_ℓ(−1)` at each
  singular fibre.
- A pencil with `S = ∅` (a line in `P²`) has all direct images constant.

### 4.2 The vanishing subspace

**Construction.** Fix `ℚ_ℓ(1) ≅ ℚ_ℓ` (k is algebraically closed). For `s ∈ S` an étale path from `u` to a
geometric generic point of `D_(s)` transports the local vanishing cycle of 2.8 to
`LefschetzPencil.vanishingCycle s γ ∈ H^n(X_u, ℚ_ℓ)(m)`, defined up to sign once the path is fixed; changing the
path changes it by an element of `π_1(U, u)`. The **vanishing subspace** `LefschetzPencil.vanishingSubspace`
`E ⊂ H^n(X_u, ℚ_ℓ)` is the span of all transports `g δ_s` (`g ∈ π_1(U, u)`, `s ∈ S`). It does not depend on the paths
and is `π_1(U, u)`-stable; only `E`, not the individual oriented vectors, is path independent. For suitable
paths `E` is already spanned by the `δ_s`, `s ∈ S`, which Layer LPV.5 proves. An element of the inertia at `s` acts on `H^n(X_u)` by
`x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s` (`n` odd), and by the reflection in `δ_s` when `ε(σ) = −1` (`n` even).

- `LefschetzPencil.vanishingCycle`: vanishingCycle (s : S) (γ : path u ⇝ η̄_s) : H^n(X_u, ℚ_ℓ)(m), up to sign.
- `LefschetzPencil.vanishingCycle_changePath`: vanishingCycle s (g · γ) = ± g • vanishingCycle s γ for g ∈ π₁(U, u).
- `LefschetzPencil.vanishingSubspace`: E : Submodule ℚ_ℓ (H^n(X_u, ℚ_ℓ)), the span of all vanishing cycles for all paths.
- `LefschetzPencil.vanishingSubspace_stable`: g • E = E for every g ∈ π₁(U, u).
- `LefschetzPencil.localMonodromy_vanishingCycle`: σ in the inertia at s acts on H^n(X_u) by x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s (n odd), and by the reflection in δ_s when ε(σ) = −1 (n even).

*Proof sketch.* The local vanishing cycle lives in `H^n` of the geometric generic fibre of `X̃ ×_D D_(s)`, and a path
identifies that fibre functor with the one at `u`; a change of path is an element of `π_1(U, u)`, so the set of
all transports is stable and so is its span; the local monodromy is the Picard–Lefschetz formula of 2.8
transported along the path. (Weil I, §5, (5.2), p. 290; (5.8) a) 3), p. 292.) *Needs:* 3.1, 2.8;
CohomologicalPointCounting/ConstructibleEtale Layer 3 and EtaleBaseChange Layer 8 (paths and transport).

**Checks.**

- `LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre`: If S = ∅ (a line in P²) then E = 0.
- `LefschetzPencil.vanishingSubspace_quadric_surface`: Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)).
- `LefschetzPencil.vanishingSubspace_conic`: n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂).
- `LefschetzPencil.vanishingCycle_depends_on_path`: For the shear ρ(g)(x, y) = (x + gy, y) on ℚ², δ = (0, 1) and g = 1, the transport gδ = (1, 1) is neither δ nor −δ: individual vanishing cycles depend on the path, while their span does not.

### 4.3 The fixed space of the local transvections

**Lemma.** Let `V` be a finite-dimensional vector space over a field `K` with a symmetric or alternating
bilinear form `( , )`, `(δ_s)_{s∈S}` a finite family in `V`, `E` its span, and `T_s(x) = x + c_s(x, δ_s)δ_s` with
`c_s ∈ K^×` (Mathlib's `LinearMap.transvection` of the functional `c_s(·, δ_s)` and the vector `δ_s`: a transvection
when `(δ_s, δ_s) = 0`, a reflection when `c_s(δ_s, δ_s) = −2`). Then `⋂_s Fix(T_s) = E^⊥`. If `δ_s = 0` then `T_s = id`
and `δ_s` contributes nothing to `E`. State it as `LefschetzPencil.fixedSpace_localTransvections`.
*Proof sketch.* `T_s x = x` iff `c_s(x, δ_s)δ_s = 0` (Mathlib `LinearEquiv.mem_fixedSubmodule_transvection_iff` for
an isotropic `δ_s`, the same computation for a reflection), iff `(x, δ_s) = 0` when `δ_s ≠ 0`; intersecting gives
`E^⊥` (Mathlib `LinearMap.BilinForm.orthogonal` of the span). (Weil I, §5, Proposition (5.3), p. 290.) *Needs:*
Mathlib `LinearMap.transvection`, `LinearEquiv.transvection`,
`LinearEquiv.mem_fixedSubmodule_transvection_iff`, `LinearMap.BilinForm.orthogonal`. *Lean:* `Suggested.lean` declares
the operator `LefschetzPencil.localTransvection B c δ` and the lemma, with the reflection check and the `A₂` trace check
of 5.10 as examples.

**Checks.**

- `fixedSpace_symplectic_plane`: on `ℚ²` with the standard alternating form and one `δ ≠ 0`, `Fix(T) = ℚδ = δ^⊥`;
  for `δ = 0`, `T = id` and `Fix(T) = V = E^⊥`.
- `fixedSpace_reflection`: on `ℚ²` with the dot product, `δ = (1, −1)` and `c = −1` (so `c(δ, δ) = −2`), `T` swaps the
  coordinates and `Fix(T) = ℚ(1, 1) = δ^⊥`.
- `fixedSpace_needs_nonzero_coefficient`: with `c_s = 0` the operator is the identity although `δ_s ≠ 0`; the
  lemma requires `c_s ≠ 0`.

### 4.4 The radical quotient and its pairing

**Construction.** With `( , ) = Tr(x ∪ y)` the cup-product pairing `H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n)`, perfect by
Poincaré duality, the subspace `E ∩ E^⊥` is the kernel of the restriction of `( , )` to `E`, so `( , )` induces a
nondegenerate form `ψ` on `V = E/(E ∩ E^⊥)` with values in `ℚ_ℓ(−n)`, alternating for `n` odd and symmetric for `n`
even. Monodromy preserves `ψ`; for `n` odd it gives a continuous representation
`ρ : π_1(U, u) → Sp(V, ψ)(ℚ_ℓ)`. The restriction of `( , )` to `E` can be degenerate: irreducibility and the open
image concern `V`, not `E`. Define `LefschetzPencil.vanishingQuotient`, `LefschetzPencil.vanishingForm`,
`LefschetzPencil.monodromyRep`.

- `LefschetzPencil.vanishingQuotient`: E ⧸ (E ⊓ E^⊥), a finite-dimensional ℚ_ℓ-space with a π₁(U, u)-action.
- `LefschetzPencil.vanishingForm`: ψ, the form induced by Tr(x ∪ y), with values in ℚ_ℓ(−n).
- `LefschetzPencil.vanishingForm_nondegenerate`: ψ is nondegenerate.
- `LefschetzPencil.vanishingForm_isAlt`: ψ is alternating for n odd (LinearMap.IsAlt) and symmetric for n even.
- `LefschetzPencil.monodromyRep`: ρ : π₁(U, u) →* Sp(vanishingQuotient, ψ) for n odd, continuous.
- `LefschetzPencil.vanishingProjection`: The quotient map E → E/(E ∩ E^⊥).
- `LefschetzPencil.vanishingForm_mk`: The pairing of the classes of x and y is B(x, y), with values in ℚ_ℓ(−n) in the geometric case.
- `LefschetzPencil.vanishingQuotient_lift`: Any linear functional on E killing E∩E⊥ uniquely descends through the quotient.
- `LefschetzPencil.vanishingQuotient_lift_comp`: Composition of the descended map with the quotient projection is the original map.

*Proof sketch.* The kernel of `( , )|_E` is `E ∩ E^⊥` by definition, so the induced form is nondegenerate.
`Tr(x ∪ y) = (−1)^{n²} Tr(y ∪ x)` and `x ∪ x = 0` for `n` odd, by graded commutativity. `π_1(U, u)` preserves cup product
and trace (the trace is invariant because `R^{2n} f_*ℚ_ℓ(n) ≅ ℚ_ℓ` on `U`) and preserves `E`, hence `E^⊥` and the
quotient. (Weil I, §5, (5.9), p. 293.) *Needs:* 4.2; EtaleDualityAndPerverseSheaves Layer EDC.2 (Poincaré
duality and the trace pairing); Mathlib `LinearMap.BilinForm.orthogonal`, `LinearMap.IsAlt`,
`Submodule.mkQ`. *Lean:* `Suggested.lean` declares the linear-algebra core: `LefschetzPencil.vanishingRadical`,
`LefschetzPencil.vanishingQuotient`, `exists_vanishingForm` (a reflexive form descends to a nondegenerate form on the
radical quotient) and the four-dimensional symplectic checks on `stdSymplectic4`.

**Checks.**

- `LefschetzPencil.vanishingQuotient_zero`: For E = 0 in the four-dimensional symplectic space of the next check the quotient is zero; this is the situation of the quadric-surface pencil.
- `LefschetzPencil.vanishingQuotient_radical`: Over Q with basis e₀,e₁,e₂,e₃ and B(e₀,e₁)=B(e₂,e₃)=1, E=span(e₀,e₁,e₂) has radical Qe₂ and quotient dimension two; span(e₀,e₂) has quotient dimension zero.
- `LefschetzPencil.vanishingQuotient_conic`: For the dot product on ℚ² and E = ℚ(1, −1), the radical is zero, the quotient is a line and the generator has square two; this is the radical quotient of the conic pencil.
- `LefschetzPencil.vanishingForm_on_E_degenerate`: The restriction of the standard symplectic form of ℚ⁴ to span(e₀, e₁, e₂) is degenerate, whereas the induced form on the quotient is nondegenerate.

### 4.5 The cohomology of the total space

**Theorem (restriction and Gysin formulas).** For a transverse-axis pencil with centre `Z = A ∩ X` and
blow-up `π : X̃ → X` (3.3), the blow-up formula of EtaleDualityAndPerverseSheaves Layer EDC.4 identifies
`H^i(X̃) = H^i(X) ⊕ H^{i−2}(Z)(−1)` by `π^*` plus the exceptional Gysin map; its inverse carries the exceptional
minus sign. For a smooth fibre `Y` of the pencil, with `m : Y → X` and `h : Z → Y` the inclusions, restriction
sends `(a, b)` to `m^*a + h_*b` and the fibre Gysin map sends `y` to `(m_*y, −h^*y)`. For an empty centre (a curve)
there is no exceptional summand and the formulas are ordinary restriction and Gysin on `X`. *Proof sketch.*
Take the blow-up formula from EDC.4; compute restriction and fibre Gysin through the normal bundle of the
exceptional divisor; check both signs with the self-intersection and projection formulas of EDC.3; use
weak Lefschetz below the middle degree to identify the ambient and axis images. (SGA 7 II, Exposé XVIII,
§§2–4 and 5.1, pp. 5–27 (book pp. 259–281).) *Needs:* 3.3; EtaleDualityAndPerverseSheaves Layers EDC.2,
EDC.3 (Gysin maps, self-intersection formula) and EDC.4 (blow-ups, weak Lefschetz).

**Checks.**

- For an empty centre the formula is ordinary restriction and Gysin on `X`.
- For a surface blown up at a point the exceptional class has square `−1`, which detects the sign of the
  inverse.

**Application (hypersurfaces outside the middle degree).** For a smooth projective hypersurface `Y` of
dimension `n` over an algebraically closed field, `H^i(Y, ℚ_ℓ)` for `i ≠ n` is that of projective space: `ℚ_ℓ(−i/2)`
generated by the power of the hyperplane class for `i` even with `0 ≤ i ≤ 2n`, and zero for `i` odd; above the middle
degree the generators are the duals. In a sufficiently ample pencil of hypersurface sections this identifies
the constant direct images and isolates the middle vanishing quotient. The middle cohomology is not
asserted to be of Tate type. *Proof sketch.* Weak Lefschetz below `n`, projective-space cohomology, and
Poincaré duality above `n`. (Weil I, Remarque 5.12, p. 294.) *Needs:* 4.1; EtaleDualityAndPerverseSheaves Layers
EDC.2, EDC.3 and EDC.4 (weak Lefschetz, and the cohomology of projective space from the projective-bundle
formula).

**Checks.**

- A smooth cubic surface has `b_0 = b_4 = 1`, `b_1 = b_3 = 0`; its `b_2 = 7` is a middle-degree contribution.
- An odd-dimensional smooth hypersurface has its only odd contribution in degree `n`.

### Examples

- The conic pencil (`n = 0`, `X` a smooth conic in `P²`, `p ≠ 2`, axis a general point): `X_u` is two points, `|S| = 2`
  (the two tangents through the axis point), `δ_s = ±(e_1 − e_2)` for both `s`, `E = ℚ_ℓ(e_1 − e_2)`, `E^⊥ = ℚ_ℓ(e_1 + e_2)`,
  and `E/(E ∩ E^⊥)` is a line with `ψ(δ, δ) = 2`.
- The quadric-surface pencil: each `δ_s` lies in `H^1` of a conic, which is zero, so `E = 0`.
- Linear algebra of the radical quotient: on `ℚ⁴` with `B(e_0, e_1) = B(e_2, e_3) = 1`, `E = span(e_0, e_1, e_2)` has radical
  `ℚe_2` and quotient of dimension two, while `span(e_0, e_2)` is totally isotropic with quotient zero.

### Dependencies

Layers LPV.2 and LPV.3;
CohomologicalPointCounting (ConstructibleEtale Layer 3; EtaleBaseChange Layers 2 and 8);
EtaleDualityAndPerverseSheaves Layers EDC.2, EDC.3, EDC.4; InverseGaloisAndArithmeticFundamentalGroups
Layer IG.1; Mathlib (`LinearMap.transvection`, `LinearEquiv.mem_fixedSubmodule_transvection_iff`,
`LinearMap.BilinForm.orthogonal`, `LinearMap.IsAlt`).

## Layer LPV.5: Conjugacy, monodromy and the open image theorem

This layer proves the global monodromy theorems for a Lefschetz pencil: a general line sees the whole
monodromy of the complement of the dual variety, the vanishing cycles are conjugate up to sign, the
geometric monodromy is topologically generated by the local transvections (so that `E^⊥` is the space of
global invariants), and the radical quotient `E/(E ∩ E^⊥)` is absolutely irreducible. With these it states the
middle-degree reduction of Deligne's first proof, and then proves the Kazhdan–Margulis theorem: for `n` odd
the monodromy image is open in `Sp(E/(E ∩ E^⊥))(ℚ_ℓ)`. It ends with the characteristic-two branch and the
even-dimensional alternative: orthogonal monodromy is open or finite, and finite monodromy is the Weyl
group of a root system of type A, D or E, together with the gcd lemma for Frobenius polynomials. The
notation of Layer LPV.4 is kept.

### 5.1 Bertini for monodromy images

**Theorem.** Let `W ⊂ P̌` be a dense open subset and `F` a lisse `ℚ_ℓ`-sheaf of finite rank on `W` (for instance
`W = P̌ − X̌` and `F = R^n g_*ℚ_ℓ` for the incidence family of 3.2, or, in 7b.10, any open over which the direct
images of a constructible complex are lisse). For a sufficiently general line `D ⊂ P̌`, with `V = D ∩ W` and
`u ∈ V`, the images of `π_1(V, u)` and of `π_1(W, u)` in `GL(F_u)` coincide. The general line depends on `F`: no single
open set of lines is claimed to work for every finite cover or every representation. The cases where `W`
contains no line, or where the dual is empty or linear, are treated separately (3.5).

The proof uses Bertini's irreducibility theorem, which is part of this target: if `X` is geometrically
irreducible of finite type over a field and `g : X → P^r` is a morphism with `dim g(X) > s`, then `g^{−1}(L)` is
geometrically irreducible for the generic linear subspace `L` of codimension `s` (SGA 7 II, Exposé XVIII, 6.1.6.1,
p. XVIII-61; Jouanolou, *Théorèmes de Bertini et applications*, Progress in Math. 42 (1983), Théorème 6.3).
For the complement of a hypersurface `Z ⊂ P^r` the conclusion holds for the tame fundamental groups and every line
meeting `Z` transversally in smooth points, and the local inertia homomorphisms are conjugate when `Z` is
irreducible (SGA 7 II, Exposé XVIII, Proposition 6.1, pp. XVIII-58–XVIII-62).

*Proof sketch.* The image `H` of `π_1(W, u)` is compact; choose an open normal pro-ℓ subgroup `H_1` and let `H_2` be
its Frattini subgroup, open in `H` (`H_1` is a finitely generated pro-ℓ group). A closed subgroup of `H` that maps
onto `H/H_2` is all of `H`. The finite étale cover of `W` corresponding to `H/H_2` is irreducible, and by Bertini's
irreducibility theorem its restriction to a general line is irreducible, so `π_1(V, u)` maps onto `H/H_2`, hence
onto `H`. In the tame situation of a pencil, Abhyankar's lemma and the tame specialization theorem identify the
local inertia along the smooth locus of `X̌` with the inertia at the points of `S`. (Weil I, §5, proof of (5.4),
p. 291, and (5.8), p. 292; SGA 7 II, Exposé XVIII, 6.1, using SGA 1 XIII 2.8.) *Needs:* 3.2, 3.4; InverseGaloisAndArithmeticFundamentalGroups Layer IG.1
(§IG.1.2 tame quotients, §IG.1.3 tame specialization); Stacks Project, Lemma 0EYG (Abhyankar's lemma for a
regular divisor); AlgebraicModuliForArithmeticGeometry Layer 1, §1.3 (Grassmannian of lines).

**Checks.**

- `bertini_conic`: over `ℂ`, for `X` a smooth conic in `P²` the dual is a conic, `π_1(P̌² − X̌) = ℤ/2`, and a general line
  `D` meets `X̌` in two points with `π_1(D − S) = ℤ` mapping onto `ℤ/2`.
- `bertini_needs_generality`: a line contained in `X̌`, or tangent to `X̌` at a smooth point, does not meet the
  hypotheses, and the restriction of the double cover of the conic example to a tangent line is not
  irreducible.

### 5.2 Conjugacy of the vanishing cycles

**Theorem.** For a sufficiently general pencil (5.1 applied to `R^n g_*ℚ_ℓ`), the vanishing cycles `±δ_s`, `s ∈ S`, are
conjugate up to sign under `π_1(U, u)`: for `s, s' ∈ S` there is `g` with `gδ_s = ±δ_{s'}`. Consequently one vanishing cycle
is zero exactly when all are (`LefschetzPencil.vanishingCycle_eq_zero_iff_forall`), and one of the two cases of
4.1 always holds. The characteristic-two even branch is 5.9. *Proof sketch.* The dual variety is irreducible
(3.2), so the smooth locus of `X̌` is connected and the local inertia groups at its generic point form one
conjugacy class in `π_1(P̌ − X̌)`; Abhyankar's lemma controls the ramification of `R^n g_*ℚ_ℓ` along that smooth
locus; the Bertini theorem 5.1 transports this conjugacy to `π_1(U, u)`; transporting the primitive vanishing
generator along the conjugacies gives `±gδ`. An empty `S` is trivial. (Weil I, §5, Théorème (5.4) and its proof,
pp. 290–291; (5.8), p. 292.) *Needs:* 3.2, 4.2, 5.1, 2.8; InverseGaloisAndArithmeticFundamentalGroups Layer
IG.1; Stacks Project, Lemma 0EYG (Abhyankar's lemma).

**Checks.**

- The conic pencil (n = 0, p ≠ 2): both vanishing cycles are ±(e₁ − e₂).
- The quadric-surface pencil: both vanishing cycles are 0, consistent with the rule that one zero vanishing cycle forces all to vanish.

### 5.3 Generation by the local transvections

**Theorem.** For a suitable choice of paths, the image of `π_1(U, u)` in `GL(H^n(X_u, ℚ_ℓ))` is topologically generated
by the local monodromies `T_s`, `s ∈ S`, with `T_s x = x ± (x, δ_s)δ_s` for a generator of the inertia at `s` (for `n` odd, one
with `t_ℓ(γ_s)` a chosen generator of `ℤ_ℓ(1)`; the sign is that of 2.8). Consequently `E = span(δ_s : s ∈ S)`,
`E^⊥ = H^n(X_u, ℚ_ℓ)^{π_1(U, u)}` (the common fixed space of the local operators of 4.3 is the full invariant space),
and the image of `π_1(U, u)` in `GL(E/(E ∩ E^⊥))` is topologically generated by the induced `T_s`. The equality of `E^⊥`
with the global invariants does not use hard Lefschetz or the nondegeneracy of `E`. *Proof sketch.* The tame
fundamental group of `P¹_k − S` is a quotient of the profinite completion of the fundamental group of the Riemann
sphere minus `|S|` points (lifting of tame covers to characteristic zero and Riemann existence; SGA 1, Exposé XIII,
Corollaire 2.12, as used in Weil I (5.8)); so it is topologically generated by inertia elements `γ_s`, `s ∈ S`, with
product one. This generation statement is part of the target; the tame fundamental group itself is
InverseGaloisAndArithmeticFundamentalGroups Layer IG.1, §IG.1.2. `R^n f_*ℚ_ℓ` is tame (4.1);
apply the local formulas of 2.8; take the closed subgroup generated by the local images; combine with the
fixed-space lemma 4.3. The characteristic-two even branch is not covered by the tame presentation. (Weil I, §5,
(5.8) and (5.8) a) 3), p. 292; Proposition (5.3), p. 290, and §§5.8–5.9, pp. 292–293.) *Needs:* 2.8, 4.1–4.4;
InverseGaloisAndArithmeticFundamentalGroups Layer IG.1; CohomologicalPointCounting/ComplexComparison Layer 8
(Riemann existence).

**Checks.**

- Conic pencil: the image is ℤ/2, generated by the swap of the two points, and the invariants are ℚ_ℓ(e₁ + e₂) = E^⊥.
- A three-dimensional subspace of a four-dimensional symplectic space can have a one-dimensional radical;
  the local-to-global equality does not need `E` nondegenerate.

### 5.4 Absolute irreducibility

**Theorem.** For a Lefschetz pencil in the tame branch (`n` odd, or `p ≠ 2`), the representation of `π_1(U, u)` on
`V = E/(E ∩ E^⊥)` is absolutely irreducible when `V ≠ 0`; for `V = 0` it is the zero representation and is not called
irreducible. The statement persists after extending scalars to any finite extension of `ℚ_ℓ` or to `ℚ̄_ℓ`. *Proof
sketch.* Let `W` be a stable nonzero subspace after scalar extension. If some vanishing cycle `δ` has `(W, δ) ≠ 0`,
apply the local transvection or reflection to an element `w` with `(w, δ) ≠ 0` to get `δ ∈ W`, and conjugacy (5.2)
puts all transported cycles in `W`, so `W = V`. Otherwise `W` is orthogonal to `E`, hence zero in `V`. (Weil I, §5,
Corollaire (5.5) and its proof, p. 291; (5.13) D), p. 294.) *Needs:* 4.4, 5.2, 5.3.

**Checks.**

- The quadric-surface pencil has E/(E ∩ E^⊥) = 0; the conic pencil has a one-dimensional quotient.

### 5.5 The middle-degree reduction

**Theorem.** Let `f : X̃ → D = P¹` be the proper incidence pencil with smooth locus `U`, `n = 2m + 1` odd, `V` the
restriction of `R^n f_*ℚ_ℓ` to `U`, `E ⊂ V` the vanishing local subsystem, `R = E ∩ E^⊥`, and `A = R^n f_*ℚ_ℓ = j_*V`.

1. The Leray filtration of `H^{n+1}(X̃)` has graded pieces `E_∞^{2,n−1}`, `E_∞^{1,n}`, `E_∞^{0,n+1}`, each an actual
   subquotient of its `E_2` term; the only possible differentials on a curve are
   `d_2^{0,b} : H^0(D, R^b f_*) → H^2(D, R^{b−1} f_*)`, and both the incoming and the outgoing ones at the two corner
   terms are retained; `E_∞^{1,n} = H^1(D, A)`.
2. (Nonradical case.) If the vanishing cycles are not in `R`, the sequences `0 → j_*E → A → C → 0` and
   `0 → j_*R → j_*E → j_*(E/R) → 0` have `C` and `j_*R` constant, so `H^1(j_*E) → H^1(A)` is surjective and
   `H^1(j_*E) → H^1(j_*(E/R))` is injective.
3. (Totally isotropic case.) If `E ⊂ E^⊥`, put `F = coker(j_*E^⊥ → A)`. The sequences
   `0 → j_*E^⊥ → A → F → 0` (with `j_*E^⊥` constant) and `0 → F → j_*j^*F → ⊕_s i_{s*}L_s → 0` give an injection
   `H^1(A) → H^1(F)` and a surjection `⊕_s H^0(L_s) → H^1(F)`, where `L_s` is the evaluation line `ℚ_ℓ(m − n)` with its
   orientation character, after a finite extension of the residue field that makes the critical points and
   characters rational (3.5). Weil I prints the opposite twist in (7.1.5); pairing an untwisted class with
   `δ ∈ H^n(m)` lands in `ℚ_ℓ(m − n)`, while the printed numerical Frobenius eigenvalue is correct.
4. If `E = 0`, `A` is constant and `H^1(A) = 0`; the skyscraper contribution in degree `n + 1` (4.1(b)) remains.

No hard Lefschetz theorem, degeneration at `E_2` or splitting of the filtration is used. The hypotheses are
uniform over the critical points because the local vanishing cycles are conjugate (5.2), and `E^⊥` is the
global fixed subsystem (5.3), so `j_*E^⊥` is constant.

*Proof sketch.* Use the Leray spectral sequence of `Rf_*` and the cohomological dimension two of `P¹`; the lower
corner is `H^{n−1}(X_u)(−1)`, controlled by weak Lefschetz on the axis, and the upper constant quotient by the
surjective Gysin map `H^{n−1}(A ∩ X)(−1) → H^{n+1}(X_u)` (4.5). In the nonradical case use the inclusion
`j_*E → A`, the quotient `A → C` and the projection `j_*E → j_*(E/R)`, with `H^1(P¹, constant) = 0`. In the totally
isotropic case form `F` from `j_*E^⊥`; the local defect map is evaluation against `δ` by cup product; the two long
exact sequences give the injection and the surjective boundary. Transport the middle maps through the
blow-up restriction and Gysin maps of 4.5. (Weil I, §7.1, (7.1.2)–(7.1.5), pp. 299–300; §5.8,
pp. 292–293.) *Needs:* 4.1, 4.2, 4.4, 4.5, 5.2, 5.3; 3.5; CohomologicalPointCounting/EtaleBaseChange Layer 2
(Leray); EtaleDualityAndPerverseSheaves Layer EDC.4.

**Checks.**

- If `δ = 0` the skyscraper contribution in degree `n + 1` is retained.
- For `n = 1`, `m = 0` the evaluation line is `ℚ_ℓ(−1)`.
- Nonradical case: `H^1(j_*E)` surjects onto `H^1(A)` and injects into `H^1(j_*(E/R))`; totally isotropic case: `H^1(A)`
  injects into `H^1(F)` and the skyscraper boundary surjects onto `H^1(F)`.

### 5.6 The symplectic Lie algebra generated by transvections

**Lemma.** Let `V` be a finite-dimensional vector space over a field `k` of characteristic zero, `ψ` a nondegenerate
alternating form on `V`, and `𝔏 ⊂ 𝔰𝔭(V, ψ)` a Lie subalgebra (`𝔰𝔭(V, ψ)` is Mathlib's `skewAdjointLieSubalgebra ψ`). For
`δ ∈ V` let `N(δ) : x ↦ ψ(x, δ)δ`. If `V` is a simple `𝔏`-module (Mathlib `LieModule.IsIrreducible`) and `𝔏` is generated
as a Lie algebra by a family `N(δ_i)`, then `𝔏 = 𝔰𝔭(V, ψ)`. Define `LefschetzPencil.symplecticTransvectionGenerator` for
`N(δ)`. *Proof sketch.* `N(δ)` is skew-adjoint with `N(δ)² = 0`. The set `W` of `δ` with `N(δ) ∈ 𝔏` is a Zariski-closed
cone; `exp(λN(δ)) = 1 + λN(δ)` normalizes `𝔏`, so `δ'' + λψ(δ'', δ')δ' ∈ W` for `δ', δ'' ∈ W`, and `W` is a union of
pairwise orthogonal maximal linear subspaces, each stable under all `N(δ)`, `δ ∈ W`, hence `𝔏`-stable; simplicity
forces `W = V`, and the `N(δ)` span `𝔰𝔭(V, ψ) ≅ Sym² V`. (Weil I, §5, Lemme (5.11), p. 293, and its proof,
pp. 293–294.) *Needs:* Mathlib `skewAdjointLieSubalgebra`, `LieModule.IsIrreducible`, `LinearMap.IsAlt`,
`IsNilpotent.exp`. *Lean:* `Suggested.lean` declares `LefschetzPencil.symplecticTransvectionGenerator` and the lemma as
`eq_skewAdjoint_of_generated`.

**Checks.**

- dim V = 2 with ψ(e₁, e₂) = 1: N(e₁) = −E₁₂ and N(e₂) = E₂₁ generate sl₂ = sp(V, ψ), since their bracket is −H.
- N(δ) is quadratic in δ, N(cδ) = c²N(δ), and lies in sp(V, ψ) with N(δ)² = 0, because ψ(x, δ)(ψ(δ, y) + ψ(y, δ)) = 0 and
  ψ(δ, δ) = 0 for alternating ψ; for a symmetric form the same formula is not skew-adjoint, and a definition linear in δ
  fails the first identity.
- The simplicity hypothesis is needed: the Lie algebra spanned by N(e₁) alone is one-dimensional, and V is not a simple module for it.

### 5.7 Compact subgroups of `Sp(V)(ℚ_ℓ)` and `O(V)(ℚ_ℓ)`

**Lemma.** Let `V` be a finite-dimensional `ℚ_ℓ`-vector space with a nondegenerate form `ψ`, alternating or symmetric,
with the canonical topology on `End(V)` and the subgroup topology on `GL(V)`; let `G(ψ)` be its isometry group,
`Sp(V, ψ)(ℚ_ℓ)` or `O(V, ψ)(ℚ_ℓ)`, which is closed in `End(V)`, being cut out by polynomial equations, and `𝔤(ψ)` its Lie
algebra of `ψ`-skew-adjoint endomorphisms (Mathlib's `skewAdjointLieSubalgebra ψ`). Let `H ⊂ G(ψ)` be a compact subgroup and
`𝔏 = {X ∈ 𝔤𝔩(V) : exp(tX) ∈ H for all t in a neighbourhood of 0 in ℚ_ℓ}`. Then `𝔏` is a `ℚ_ℓ`-Lie subalgebra of `𝔤(ψ)`; if
`h ∈ H` is unipotent, `h = exp(N)` with `N` nilpotent and `N ∈ 𝔏`; and if `𝔏 = 𝔤(ψ)` then `H` is open in `G(ψ)`. For `ψ`
symmetric, the orthogonal group and its topology are those of TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2. Closedness of `H` is essential: the group generated by the local monodromies is only dense in the
image of `π_1`. *Proof sketch.* The analytic structure on closed subgroups of an `ℓ`-adic Lie group, the
identification of `Lie(H)` as a Lie subalgebra, and openness when it is the full Lie algebra are TauCetiRoadmap
AdelicAlgebraicGroups Layer 4, §4.2 (closed subgroups of `p`-adic Lie groups; Schneider 2011, Theorem 27.1,
Exercise 26.2, Proposition 29.2 and Corollaries 29.4–29.6). If `exp(N) ∈ H`, its powers `exp(aN)`, `a ∈ ℤ`, lie in `H`,
and closedness extends `a` to `ℤ_ℓ`; differentiating this one-parameter subgroup gives `N ∈ 𝔏`. The argument does not use
the type of `ψ`. (Weil I, §5, proof of (5.10), p. 293; Schneider 2011, §§18.10–19, pp. 144–153; Exercise 26.2, pp. 181–182; Theorem 27.1,
pp. 192–194; Proposition 29.2 and Corollaries 29.4–29.6, pp. 202–205.) *Needs:* TauCetiRoadmap
AdelicAlgebraicGroups Layer 4, §4.2; Mathlib `skewAdjointLieSubalgebra`, `IsNilpotent.exp`.

**Checks.**

- H = Sp(V)(ℤ_ℓ) is compact and open with 𝔏 = sp(V, ψ); H = {1} has 𝔏 = 0; the closure of the group generated by one unipotent exp(N), N ≠ 0, is exp(ℤ_ℓN) with 𝔏 = ℚ_ℓN.

### 5.8 The Kazhdan–Margulis theorem

**Theorem (Kazhdan–Margulis).** Let `n` be odd. The image of `ρ : π_1(U, u) → Sp(E/(E ∩ E^⊥), ψ)(ℚ_ℓ)` is open. The statement
is for the `ℚ_ℓ`-model; openness in `Sp(V ⊗ E')(E')` for a larger coefficient field `E'` is not asserted. `V = 0` is
allowed (`Sp(0)` is trivial). *Proof sketch.* `H = ρ(π_1(U, u))` is compact; let `𝔏` be its Lie algebra (5.7). The inertia at
`s` maps onto `{exp(aN_s) : a ∈ ℤ_ℓ}`, `N_s = ±N(δ_s)`, since `t_ℓ` is onto `ℤ_ℓ(1)`, so `N_s ∈ 𝔏`. Let `𝔤_S ⊂ 𝔏` be generated by the
`N_s`. A `𝔤_S`-stable subspace is stable under each `N_s`, hence under `T_s = exp(±N_s)`, hence under the closed group
they generate, which is `H` (5.3); by 5.4 it is `0` or `V`. Lemma 5.6 gives `𝔤_S = 𝔰𝔭(V, ψ)`, so `𝔏 = 𝔰𝔭(V, ψ)` and `H` is open
by 5.7. (Weil I, §5, Théorème (5.10) and its proof, p. 293.) *Needs:* 0.1, 4.4, 5.3, 5.4, 5.6, 5.7.

**Checks.**

- V = 0 for the quadric-surface pencil, where the statement is trivial.
- A Lefschetz pencil of plane cubics (X = P² re-embedded with r = 3): X̃ is P² blown up in 9 points, so H^1(X̃) = 0; the singular fibres are irreducible nodal cubics, so the vanishing cycles are nonzero; f has a section, so the Leray spectral sequence degenerates and the invariants H^0(D, R^1 f_*ℚ_ℓ) ⊂ H^1(X̃) vanish. Hence E = H^1(X_u) is two-dimensional with E ∩ E^⊥ = 0, and the image is open in Sp₂(ℚ_ℓ) = SL₂(ℚ_ℓ).

### 5.9 Characteristic two

**Theorem.** In characteristic two and even fibre dimension (the branch of Weil II 4.2), keep the possibly wild
quadratic inertia characters of 2.7. For a transverse pencil whose axis lies in the generic open set of Weil II
4.2.7, the ordinary local vanishing cycles form one monodromy orbit up to sign after transport within the
pencil, and their transported span is stable under the monodromy of that pencil. Independence of the span
across different pencils is not asserted (Weil II 4.2.5 notes that it needs a theory of vanishing cycles over
higher-dimensional bases), and no tame generation statement is made for this branch. State it as
`LefschetzPencil.vanishingCycle_conj_of_charTwo`. *Proof sketch.* Keep the wild quadratic character in the local formula; choose the axis in the generic open of 4.2.7; apply 4.2.6–4.2.8
to connect critical fibres and compare transported local cycles; take the span of the orbit. (Weil II,
4.2.3–4.2.8, pp. 220–221.) *Needs:* 2.7, 3.4, 4.2; InverseGaloisAndArithmeticFundamentalGroups Layer IG.1;
EtaleDualityAndPerverseSheaves Layer EDC.0.

**Checks.**

- A wild quadratic character remains present in the within-pencil conjugacy statement.
- No independence across different pencils, or tame presentation disposing of wild inertia, is inferred.

### 5.10 Even dimension: orthogonal monodromy

**Theorem.** Let `n` be even, and assume that the vanishing space `E` is nondegenerate over `ℚ_ℓ` (an explicit
hypothesis; in Weil II it is a consequence of hard Lefschetz) and that the conjugacy and generation statements of
5.2–5.3 hold for the pencil. Then the compact geometric monodromy image in `O(E)(ℚ_ℓ)` is open or finite. The
orthogonal group over `ℚ_ℓ`, its topology and its closedness are those of TauCetiRoadmap OrthogonalSpinGroups
Layers 0 and 2. *Proof sketch.* The local reflections and conjugacy act on `E`; the alternative of Weil II
4.4.1–4.4.4 for the Lie algebra of the compact image (either zero or the full `𝔰𝔬(E)`, by irreducibility and the
reflection argument) and 5.7 for the symmetric form give the dichotomy. (Weil II, 4.4.1–4.4.4, pp. 227–229.)
*Needs:* 2.7, 5.2, 5.3, 5.7; TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2; TauCetiRoadmap
AdelicAlgebraicGroups Layer 4, §4.2.

**Checks.**

- For the conic pencil the one-dimensional orthogonal image is finite of order two.
- An isotropic or degenerate E does not satisfy the theorem’s nondegeneracy hypothesis.

**Theorem (finite monodromy is a Weyl group of type A, D or E).** In the situation of 5.10, suppose `E ≠ 0` and the
geometric monodromy group `M` is finite. Then, after changing the form by `(−1)^{n/2}`, the vanishing cycles `δ` have
`(δ, δ) = 2`, their pairings are integers, they span a lattice `L` on which the form is positive definite, and they
form an irreducible root system all of whose roots have the same length, so of type A, D or E, with `M` its Weyl
group. *Proof sketch.* For the finite quotient `M`, the trace formula for all powers of Frobenius
(CohomologicalPointCounting/TraceFormula Layer 11) and Chebotarev density for the finite étale cover of `U`
(ArithmeticGaloisRepresentations Layer 5, §5.13, Chebotarev for function fields) compare the characters of `M` on `E` at
all `ℓ ≠ p` (Weil II, Lemmas 4.4.6 and 4.4.7); removing trivial constituents gives a character with rational
integer values, independent of `ℓ`. For two vanishing cycles, with `s_δ(x) = x − (x, δ)δ` and `P_δ = (·, δ)δ`,
`Tr(s_δ s_{δ'}) = dim E − Tr P_δ − Tr P_{δ'} + Tr(P_δ P_{δ'}) = dim E − 4 + (δ, δ')²`, so
`a = Tr(s_δ s_{δ'}) − dim E + 4 = (δ, δ')²` is an integer with a square root in `ℚ_ℓ` for every `ℓ ≠ p` (Weil II prints the
constant as `2` in place of `4` on p. 230; the argument is unchanged); abelian Chebotarev for `ℚ(√a)` (TauCetiRoadmap Chebotarev Layer 9)
makes `a` a square, so `(δ, δ') ∈ ℤ`. A rational basis of vanishing cycles gives the lattice (TauCetiRoadmap Completed
IntegralLattices Layer 1); averaging a positive form over the finite group and absolute irreducibility make the
invariant form positive definite; the roots form one conjugacy class, so the root system is irreducible and
simply laced, of type A, D or E (TauCetiRoadmap RepresentationTheory/RootSystems Layer 5), with `M` generated by the
reflections. (Weil II, 4.4.5–4.4.9 including Lemmas 4.4.6–4.4.7, pp. 229–231.) *Needs:* 5.10;
ArithmeticGaloisRepresentations Layer 5, §5.13; CohomologicalPointCounting/TraceFormula Layers 7 and 11;
TauCetiRoadmap Chebotarev Layer 9; TauCetiRoadmap Completed IntegralLattices Layer 1; TauCetiRoadmap
RepresentationTheory/CharacterTheory Layer 4 (rationality of character values); TauCetiRoadmap
RepresentationTheory/RootSystems Layer 5.

**Checks.**

- The conic-pencil root δ=(1,−1) gives A₁ and its order-two Weyl group.
- Trace identity: for `δ' = δ`, `s_δ²` is the identity, of trace `dim E`, and `(δ, δ)² = 4`; for an `A₂` pair, `(δ, δ') = −1`
  in `E = span(δ, δ')`, `s_δ s_{δ'}` is a rotation of order three with trace `−1 = 2 − 4 + 1`. The constant `2` printed in
  Weil II would give `dim E + 2` and `1` in these two cases.
- The lattice L is the integral span of the vanishing cycles after the rationality argument; an arbitrary ℤ_ℓ-lattice stable under M is not a substitute.

### 5.11 Frobenius polynomials of the fibres

**Lemma (gcd lemma).** Let `X_0` be smooth projective absolutely irreducible of dimension `n + 1` over `𝔽_q` with a
Lefschetz pencil defined over `𝔽_q` (sufficiently general when `p = 2` and `n` is even), `S` its singular set and `E(X_t)` the
vanishing part of `H^n(X_t)`; for `n` even assume, as in 5.10, that the vanishing space is nondegenerate. Let `P(T) = ∏(1 − γ_i T)` and `Q(T) = ∏(1 − δ_j T)` with all `γ_i, δ_j ≠ 0`. If for every
`t ∈ (P¹ − S)(𝔽_{q^k})`, `k ≥ 1`, with `F` the Frobenius of `X_t` relative to `𝔽_{q^k}`,
`∏(1 − γ_i^k T)` divides `∏(1 − δ_j^k T) · det(1 − FT, E(X_t))`, then `P` divides `Q`. *Proof sketch.* Induct on `deg P`; for
`P = 1 − γT` with `γ` different from every `δ_j`, choose `N` such that `γ^k ≠ δ_j^k` for `k ≡ 1 mod N`; Chebotarev density
(ArithmeticGaloisRepresentations Layer 5, §5.13) for the arithmetic monodromy group `G ⊂ GL(E) × ℤ` turns the
hypothesis into: `γ^{deg g}` is an eigenvalue of `g` for every `g` with `deg g ≡ 1 mod N`; this is impossible because the
elements of a coset `gM` of the geometric monodromy group have no common eigenvalue, by the description of the
Zariski closure of `M` as a symplectic group (5.8), an orthogonal group (5.10) or a Weyl group of type A, D or E
(the finite case of 5.10), using `±Id` and Coxeter elements. (Weil II, Lemme 4.5.2 and its proof, Lemme 4.5.4, pp. 231–233.)
*Needs:* 5.3, 5.8, 5.10; ArithmeticGaloisRepresentations Layer 5, §5.13.

Combined with the Frobenius-equivariant decomposition `H^n(X_t) = H^n(X) ⊕ E(X_t)` (Weil II, 4.3.9, a consequence of the
hard Lefschetz theorem, used here as a hypothesis), the lemma gives Weil II, Théorème 4.5.1: `det(1 − FT, H^n(X))` is
the least common multiple of the polynomials `∏(1 − α_i T)` such that `∏(1 − α_i^k T)` divides `det(1 − FT, H^n(X_t))` for every
`t ∈ (P¹ − S)(𝔽_{q^k})`. With `ℤ_ℓ` coefficients the decomposition fails: the intersection of the vanishing part with the
image of `H^n(X)` is the kernel of cup product with the hyperplane class on `H^n(X, ℤ_ℓ)`, which can be a nonzero torsion
group (Weil II, 4.3.10, p. 226), so the rational statements of this layer are not asserted integrally.

**Checks.**

- `gcd_lemma_degree_zero`: for `P = 1` the conclusion is trivial; for `Q = P` the hypothesis holds and so does the
  conclusion.
- `no_common_eigenvalue_symplectic`: `Id` and `−Id` in `Sp(V)` have no common eigenvalue, so a coset of a group whose
  Zariski closure is `Sp(V)` has no common eigenvalue.
- `integral_torsion_kernel`: replacing the hyperplane class `η` by `ℓη` (the hyperplane class of the `ℓ`-uple Veronese
  re-embedding) makes the kernel of cup product with it contain every class of `H^n(X, ℤ_ℓ)` killed by `ℓ`, so the integral
  intersection is nonzero as soon as `H^n(X, ℤ_ℓ)` has torsion.

### Examples

- The conic pencil (`n = 0`): the image of monodromy is `ℤ/2`, generated by the swap of the two points, the invariants
  are `ℚ_ℓ(e_1 + e_2) = E^⊥`, and the finite orthogonal monodromy is the Weyl group of `A_1`.
- A Lefschetz pencil of plane cubics (`X = P²` re-embedded by `r = 3`): `X̃` is `P²` blown up in nine points, `H^1(X̃) = 0`
  and `f` has a section, so `E = H^1(X_u)` is two-dimensional with `E ∩ E^⊥ = 0`, and the image is open in
  `Sp_2(ℚ_ℓ) = SL_2(ℚ_ℓ)`.
- The quadric-surface pencil: `E = 0`, all statements are trivial.

### Dependencies

Layers LPV.2–LPV.4 and LPV.0 (tame character); InverseGaloisAndArithmeticFundamentalGroups Layer IG.1;
ArithmeticGaloisRepresentations Layer 5, §5.13; CohomologicalPointCounting/TraceFormula Layers 7 and 11;
TauCetiRoadmap AdelicAlgebraicGroups Layer 4; TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2; TauCetiRoadmap
Chebotarev Layer 9; TauCetiRoadmap Completed IntegralLattices Layer 1; TauCetiRoadmap RepresentationTheory
(CharacterTheory Layer 4, RootSystems Layer 5); SchemeAndStackFoundations Layer 0; Stacks Project 0EYG;
Mathlib (`skewAdjointLieSubalgebra`, `LieModule.IsIrreducible`, `IsNilpotent.exp`).

## Layer LPV.6: Perverse nearby cycles

This layer proves Gabber's theorems: nearby cycles commute with Verdier duality, are t-exact for the middle
perverse t-structures, and shifted vanishing cycles preserve perversity. It deduces the exchange with
intermediate extensions under explicit exchange hypotheses, defines the perverse t-structure over a trait, fixes the coefficient and shift conventions
for finite, adic and rational coefficients, proves a support criterion for filtered colimits of nearby-cycle
complexes, and concludes with the middle-degree concentration of vanishing cycles at isolated
singularities. The perverse t-structures over a field, their gluing and intermediate extension are
EtaleDualityAndPerverseSheaves Layer EDC.5; the glued t-structure over a trait is defined in 6.2. No weight or decomposition theorem is used. Coefficients are
`Λ = ℤ/ℓ^ν` (`ν ≥ 1`) or rational ℓ-adic coefficients through the realization of 0.8; the integral perversities
`p` and `p⁺` are kept distinct and are not identified with each other.

### 6.1 Nearby cycles and duality

**Theorem (Gabber).** Let `X` be separated of finite type over a henselian trait and `K ∈ D_ctf(X_η, Λ)` with finite
coefficients of order invertible on the trait. Gabber's map `RΨ(D_η K) → D_s(RΨ K)` is a natural isomorphism,
equivariant for inertia, where `D_η` and `D_s` are the Verdier dualities of the generic and special fibres with the
dualizing complexes and Tate twists of EtaleDualityAndPerverseSheaves Layers EDC.1 and EDC.2. The bounded
constructible adic and rational variant holds through 0.8 with uniform finite-level amplitude. Shifted
vanishing-cycle duality keeps its `can`/`var` and specialization-pairing conventions. Finite Tor dimension is
not dropped for general finite coefficient rings. *Proof sketch.* Construct the tensor/trace comparison of
Illusie 4.3 with the geometric functors; apply Gabber's theorem and the dévissage of 4.2–4.3; check naturality
under the inertia automorphisms; pass to adic coefficients and identify the shifts of the cone. (Illusie 1994,
4.2–4.4, pp. 44–47.) *Needs:* 0.5, 0.8; EtaleDualityAndPerverseSheaves Layers EDC.1 (biduality, exceptional
inverse image) and EDC.2 (Poincaré duality, dualizing complexes), EDC.5.

**Checks.**

- The rank-one nodal stalk/costalk pairing reproduces the twist −1.
- No unqualified self-dual p-perversity statement is made over Z_l with torsion.

### 6.2 Perverse sheaves over a trait and exactness

**Definition (perverse sheaves on a scheme over a trait).** Let `X` be of finite type over a henselian trait `S`, with
`i : X_s → X` and `j : X_η → X`. On `X_s` take the middle perverse t-structure of EDC.5, and on `X_η` the middle perverse
t-structure shifted by one, `(ᵖD^{≤−1}, ᵖD^{≥−1})`. The perverse t-structure on `D^b_c(X, Λ)` is obtained by gluing these along
the recollement (EDC.5): `K ∈ ᵖD^{≤0}(X)` iff `j^*K ∈ ᵖD^{≤−1}(X_η)` and `i^*K ∈ ᵖD^{≤0}(X_s)`; `K ∈ ᵖD^{≥0}(X)` iff `j^*K ∈ ᵖD^{≥−1}(X_η)` and
`i^!K ∈ ᵖD^{≥0}(X_s)`. Equivalently, with Artin's rectified dimension function, `δ(x)` the dimension of the closure of `x` if that closure
meets `X_s` and that dimension plus one otherwise, `K` is perverse iff `ℋ^q(i_x^*K) = 0` for `q > −δ(x)` and `ℋ^q(i_x^!K) = 0` for `q < −δ(x)` at every
point `x`. For `X` smooth of relative dimension `d`, `Λ_X[d + 1]` is perverse. For `X = S` strictly henselian, `Λ_S[1]` and `Rj_*Λ_η[1]`
are perverse, and for `K = Rj_*Λ_η[1]` the complex `i^*K[−1] = Λ ⊕ Λ(−1)[−1]` has perverse cohomology in degrees `0` and `1`,
so `i^*K[−1]` need not be perverse. When `X/S` is the localization at a closed point of a separated scheme `Z` of finite type over a smooth curve over a
field, this is the perversity of `Z`. Define `VanishingCycles.traitPerverseTStructure`. (Illusie 1994, the definition
following Corollaire 4.6, p. 48; SGA 4, Exposé XIV, 2.2.) *Needs:* EtaleDualityAndPerverseSheaves Layer EDC.5 (middle
perverse t-structures over a field and gluing along a recollement).

**Checks.**

- For `X` smooth over `S` of relative dimension `d`, `Λ_X[d + 1]` is perverse, while `Λ_X[d]` is not: its generic restriction
  `Λ_{X_η}[d]` is perverse on `X_η`, hence not in `ᵖD^{≤−1}(X_η)`. Gluing the unshifted t-structure of `X_η` would accept `Λ_X[d]`.
- For `X = S` strictly henselian, `Λ_S[1]` and `K = Rj_*Λ_η[1]` are perverse, and `i^*K[−1] = Λ ⊕ Λ(−1)[−1]` has perverse
  cohomology in degrees `0` and `1`.
- The point `πx = 1` of `𝔸¹_S` is closed in `𝔸¹_S` and its closure misses the special fibre, so `δ(x) = 0 + 1 = 1`, the same
  value as for a section of `𝔸¹_S → S`; this is the shift by one on the generic fibre.

**Theorem (t-exactness of nearby cycles).** For `X` separated of finite type over a henselian trait with `ℓ` invertible,
geometric nearby cycles carry middle perverse sheaves on the geometric generic fibre to perverse sheaves on
the special fibre, and the induced functor between the perverse hearts is exact. Fibrewise, `RΨ` adds no shift.
For a perverse complex `K` on the total space for the rectified trait dimension function, the generic
restriction is shifted by `−1` before this fibrewise functor is applied: the total-space convention is `RΨ[−1]`.
*Proof sketch.* Work locally on separated affine pieces; right t-exactness comes from affine Artin vanishing
and the strict-local stalk formula (0.5); the opposite bound follows from right t-exactness for the dual and
nearby duality (6.1), over rational coefficients or finite fields; for `Λ = ℤ/ℓ^ν` this is the finite-coefficient
statement with the conventions of EDC.5. (Illusie 1994, Corollaire 4.5 and its proof, p. 47, which uses the right t-exactness of
Beilinson–Bernstein–Deligne, 4.4.2; Illusie 2021, §1.1, p. 85, and §6.2, p. 104.) *Needs:* 0.5, 0.7, 6.1, the definition above; EtaleDualityAndPerverseSheaves Layer EDC.5 (perverse
t-structures, support and cosupport conditions) and CohomologicalPointCounting/EtaleBaseChange
Layer 6 (affine Artin vanishing).

**Checks.**

- For a smooth family of relative dimension d, Q_l[d] on the geometric generic fibre goes to Q_l[d] on the special fibre, with no extra fibrewise shift.
- For Q_l[d+1] on the smooth total trait space, ψ[−1] gives Q_l[d] on the special fibre.

**Theorem (Gabber: vanishing cycles).** For a perverse complex `K` on `X` for the perversity of the definition above, `RΦK[−1]` is perverse on the special fibre, and its `can` and `var` maps (1.7) are morphisms of perverse
sheaves matching the shifted nearby triangle. This is not the statement that `i^*K` or `i^*K[−1]` is perverse: the
restriction has the two adjacent perverse degrees of the gluing argument. *Proof sketch.* Use the gluing bounds
for `j^*K[−1]` and `i^*K[−1]` on the total space and 6.2 on the generic restriction; the triangle places `RΦK[−1]` in
perverse degrees `−1` and `0`; dévissage reduces the vanishing of degree `−1` to the injectivity of specialization
into inertia invariants, which follows from exactness of invariants of the pro-`p` wild inertia and the two-term
complex of the tame inertia. This is the additional step of Gabber's argument. (Illusie 1994, Corollaire 4.6 and
Gabber's proof, pp. 47–51; Illusie 2021, §6.2, p. 104.) *Needs:* the previous theorem, 1.7;
EtaleDualityAndPerverseSheaves Layer EDC.5.

**Checks.**

- At a nodal curve, RΦQ_l[2][−1] is the point skyscraper Q_l(−1) in perverse degree zero.
- For a smooth total family the shifted vanishing object is zero.

### 6.3 Intermediate extensions

**Theorem.** Let `j_η` and `j_s` be compatible open immersions in a family over a trait, and `P` a constructible
perverse sheaf. Suppose that nearby cycles are t-exact for the perverse structures used, and that the exchange
maps `RΨ ∘ j_{η!} ≅ j_{s!} ∘ RΨ` and `RΨ ∘ Rj_{η*} ≅ Rj_{s*} ∘ RΨ` are isomorphisms on `P`, compatibly with the map `! → *`.
Then `RΨ(j_{η!*}P) ≅ j_{s!*}(RΨP)`. These exchange hypotheses are verified for a constant product pair — a smooth
pair `U ⊂ Y` times the trait — by smooth and product base change; for a moving boundary they are hypotheses, not
consequences. *Proof sketch.* `j_{!*}P = im(ᵖH⁰ j_!P → ᵖH⁰ Rj_*P)` (EDC.5); apply the exactness of `RΨ` on perverse hearts
and the two exchange isomorphisms, checking that they carry the `! → *` map to itself. (Illusie 1994,
Corollaires 4.5–4.6, pp. 47–51.) *Needs:* 0.6, 6.2; EtaleDualityAndPerverseSheaves Layer EDC.5.

**Checks.**

- A constant smooth pair U⊂Y times the trait satisfies the exchange and yields the constant intermediate extension.
- An arbitrary moving open boundary is not covered merely by writing j!*.

### 6.4 Coefficients and comparisons

The finite-level nearby-cycle functor, its derived adic realization (0.8) and its rational form are compatible
with the perverse structures: support and cosupport bounds are preserved by the adic realization; integral
duality exchanges the perversities `p` and `p⁺` where torsion requires it; and `ψ[−1]` and `φ[−1]` are compared using
the same trait dimension function. The comparison maps between scheme nearby cycles and adic nearby cycles (0.9)
or complex Milnor fibres (2.8) are used only on their stated finite-type domains, and preserve dimension shifts,
specialization and inertia; no perverse comparison for arbitrary analytic spaces or diamonds is made here.
*Proof sketch.* Use the finite-level coefficient change of 0.7 and the integral and rational comparison of EDC.6;
track the support conditions through the derived limit. (Illusie 1994, 4.4–4.6, pp. 47–51.) *Needs:* 0.7, 0.9,
6.2; EtaleDualityAndPerverseSheaves Layer EDC.6.

**Checks.**

- Rationalization removes the integral torsion distinction but does not change the fibrewise shift convention.
- The ordinary node compares to the complex Milnor fibre with the same specialization direction.

### 6.5 Filtered colimits and towers

**Theorem (filtered-colimit criterion).** In the unbounded derived category of étale sheaves of EnhancedDerivedSheaves
Layer E1, which contains nonconstructible objects, let `K = colim K_a` be a filtered colimit of constructible
complexes with a common lower perverse bound relative to a fixed dimension function. Geometric stalks commute with filtered colimits; the
costalk `i_x^!` at a geometric point commutes with them whenever the inclusion of the complement of `x` in the strict
localization at `x` is quasi-compact, quasi-separated and of finite cohomological dimension, because the cohomology of a
coherent topos commutes with filtered colimits (SGA 4, Exposé VI, §5, and Exposé VII, §5). Under this hypothesis `K` satisfies
the same lower bound, because cohomology commutes with filtered colimits of modules; the upper bound is the same
argument with stalks. The colimit need not be constructible: the conclusion is a support or cosupport bound in the
unbounded derived category, not membership in the constructible perverse heart. *Proof sketch.* Express the lower bound by
vanishing of costalk cohomology below the threshold; use the costalk–colimit commutation above (not an assumption
that `Ri^!` commutes with every colimit); conclude by exactness of filtered colimits of modules. (Caraiani–Scholze,
§4.6, pp. 60–63.) *Needs:* 6.2; EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.5; EnhancedDerivedSheaves
Layer E1.

**Checks.**

- An increasing union of arbitrarily many point-supported perverse sheaves can retain the bound while failing constructibility.
- A system with bounds tending to −∞ is not covered by the uniform-bound assertion.

**Theorem (semiperversity of a tower of nearby cycles).** Let `(𝔛_a)_a` be a cofiltered tower of formal models over
a complete discrete valuation ring, with finite-type reductions, and fix `d ∈ ℤ`. Assume: (i) each finite-level map on
special fibres is affine (and integral on the raw `ℓ`-torsion formal models), with continuity of integral pushforward
and a uniform bound on cohomological dimension; (ii) each finite-level nearby-cycle complex
`RΨ_a = Rλ_{a*}c_a^*Λ[d]` satisfies the lower perverse bound for the dimension function shifted by `d`; (iii) the
transition maps kill the boundary contributions in the sense that the cones of the transition maps restricted to the
boundary strata are annihilated by a power of `ℓ` in the colimit. Then the filtered colimit of the `RΨ_a`, in the
unbounded derived category, satisfies the same lower bound. Nothing is asserted about constructibility of the
colimit. The geometry of the towers (affineness of the finite-level maps, the boundary transitions) is an input,
not a consequence; Caraiani and Scholze's Igusa towers are the instance this criterion is built for. *Proof sketch.*
Identify each finite-level scheme nearby-cycle complex with the adic one through 0.9; obtain the uniform lower
bound from (i) by the affine perverse Artin vanishing of EDC.5 and continuity of integral pushforward; apply the
filtered-colimit criterion, using (iii) to discard the boundary terms. (Caraiani–Scholze, §4.6, Theorem 4.6.1 and
the finite-level comparison in its proof, pp. 60–63.) *Needs:* 0.9, the filtered-colimit criterion;
EtaleDualityAndPerverseSheaves Layers EDC.5 and EDC.6.

**Checks.**

- The criterion makes no constructibility claim for the colimit.
- A tower whose finite-level bounds tend to `−∞` is not covered.
- An increasing union of infinitely many point-supported perverse sheaves keeps the bound and is not constructible.

### 6.6 Isolated singularities

**Theorem.** Let `f : X → S` be flat of finite type and of pure relative dimension `n` over a henselian trait, with `X`
regular, and let `x` be a closed point of `X_s` such that `f` is smooth on `X − {x}`. Then `R^iΦ(ℚ_ℓ) = 0` for `i ≠ n`, and
`R^nΦ(ℚ_ℓ)` is supported at `x`. If `f` is proper, specialization `H^n(X_s̄) → H^n(X_η̄)` is injective. No rank, reflection
or quadric-generator statement is made: for a nonordinary singularity the vanishing stalk can have any dimension.
This covers the isolated quadratic singularities in residue characteristic two used by Fresán–Sabbah–Yu, which are
not ordinary. *Proof sketch.* `X` regular of dimension `n + 1` makes `ℚ_ℓ[n + 1]` perverse on `X`; by 6.2 (vanishing
cycles) `RΦ(ℚ_ℓ[n + 1])[−1] = RΦ(ℚ_ℓ)[n]` is perverse on `X_s`, and it is supported at the point `x` (smooth local acyclicity,
0.5), so it is concentrated in degree zero; the specialization sequence (0.6) then gives the injection.
(Illusie 2021, §6.2, p. 104, for Gabber's theorem; Illusie, *Perversité et variation*, Manuscripta Math. 112 (2003),
Corollaire 2.10, as used in Fresán–Sabbah–Yu, §5.1.3, pp. 43–44.) *Needs:* 0.5, 0.6, 0.10 (`ℚ_ℓ[n + 1]` is perverse on the
regular `X` by absolute purity), 6.2.

**Checks.**

- For an ordinary quadratic point this recovers the concentration of 2.7, without the rank-one statement.
- The Fresán–Sabbah–Yu characteristic-two boundary singularity is an isolated singularity covered here and not by 2.7.
- For `n = 0` and `X = Spec R[y]/(y² − π)` with `p ≠ 2`, the theorem gives `R^0Φ` of rank one at the closed point and zero in
  other degrees, as in 2.7.

### Examples

- A smooth relative curve of relative dimension `d = 1`: `ℚ_ℓ[1]` on each fibre is preserved, with no fibrewise shift; for
  `ℚ_ℓ[2]` on the smooth total space, `ψ[−1]` gives `ℚ_ℓ[1]` on the special fibre.
- The node `xy = π`: `RΦ(ℚ_ℓ[2])[−1]` is the skyscraper `ℚ_ℓ(−1)` at the node, in perverse degree zero, and the rank-one
  stalk–costalk pairing has twist `−1`.

### Dependencies

Layers LPV.0, LPV.1 and LPV.2; EtaleDualityAndPerverseSheaves Layers EDC.0, EDC.1, EDC.2, EDC.4, EDC.5, EDC.6;
EnhancedDerivedSheaves Layer E1.

## Layer LPV.7a: Semistable curves and strictly semistable degenerations

This layer computes nearby cycles, monodromy and the monodromy filtration for proper nodal curves over a
henselian trait in terms of the dual graph, compares them with the Jacobian and its monodromy pairing, and then
treats strictly semistable degenerations of any dimension: the stalks of nearby cycles, the graded pieces of the
monodromy filtration on `RΨ`, the weight spectral sequence with its differentials, and the action of `N` on it. It
uses the weights of the monodromy filtration only as labels; no Frobenius weight or purity statement is made.
Its inputs are Layers LPV.0–LPV.2, TauCetiRoadmap StableReduction (nodes, normalization, dual graphs, blow-ups),
NeronModelsAndSemistableAbelianVarieties Layer 4 (the Picard scheme of a semistable curve and the integral
monodromy pairing) and absolute purity (0.10). In 7a.1–7a.6, `X/S` is a proper flat curve over a strictly henselian
trait `S` with smooth geometrically connected generic fibre and reduced nodal special fibre `Y`, with étale local
equations `uv = a_e`, `a_e ≠ 0`, at the nodes `e` (thickness `n_e = v(a_e) ≥ 1`); `ν : Ỹ → Y` is the normalization, `Γ` the
oriented dual multigraph (vertices the components of `Ỹ`, edges the nodes, loops and multiple edges kept), and `Λ` is
`ℤ/ℓ^m`, `ℤ_ℓ` or a finite extension of `ℚ_ℓ`, with `ℓ` invertible on `S`.

### 7a.1 The normalization complex

**Construction.** Let `Γ` be the oriented dual graph of `Y`, TauCetiRoadmap StableReduction's
`TauCetiRoadmap.StableReduction.DualGraph` (Layer 1), with the ordered branch set `B_e = {tail e, head e}` of an edge
`e` given by `tail e = Γ.endpoint e 0` and `head e = Γ.endpoint e 1`. Define
`Semistable.normalizationDifferential Γ : Λ^V → Λ^E`, `(da)(e) = a(tail e) − a(head e)`, the degree-zero map of a
two-term complex. Its kernel and cokernel are `H^0(Γ, Λ)` and `H^1(Γ, Λ)`; the dual graph, its integral homology
`H_1(Γ, ℤ) = ker ∂` and the orientations are StableReduction's, and this construction is their étale coefficient
realization.

- `Semistable.normalizationDifferential_apply`: For a:Λ^V and e∈E, d(a)(e)=a(tail e)−a(head e).
- `Semistable.normalizationDifferential_constant`: d sends every constant vertex function to zero.
- `Semistable.normalizationDifferential_reverse`: Swapping tail and head multiplies d by −1 on the corresponding edge coordinates.
- `Semistable.normalizationDifferential_ker`: Kernel membership is equality of the vertex values at the two ends of each edge; the quotient map Λ^E → Λ^E/range d is surjective with kernel range d. Regarding d as a two-term complex, these are its degree-zero kernel and degree-one cokernel.

*Source.* Illusie 1991, §§1.1, 2.1–2.3, formulas (1.1.1)–(1.1.3), (2.1.2), (2.3.5). *Needs:* TauCetiRoadmap
StableReduction Layer 1 (nodes, normalization, dual graphs); Mathlib `LinearMap.ker`, `LinearMap.range`. *Lean:*
`Suggested.lean` declares `Semistable.normalizationDifferential Γ` on StableReduction's `DualGraph` and
`normalizationDifferential_constant`, with the loop check as an example.

**Checks.**

- `Semistable.normalization_tree_test`: For two vertices and one oriented edge, d(a0,a1)=a0−a1; hence the degree-one quotient vanishes.
- `Semistable.normalization_loop_test`: For one vertex and one loop, d=0 and the edge quotient is Λ, not zero.
- `Semistable.normalization_parallel_test`: For two vertices and two parallel edges with the same orientation, d(a0,a1)=(a0−a1,a0−a1), whose quotient has rank one over ℚℓ.
- A loop has zero differential; two parallel edges remain two coordinates.
- The maps retain the exact source branch sign.

**Theorem (normalization resolution).** With `i_e : {e} → Y` the nodes and `Λ(e) = coker(Λ → Λ^{B_e})`, the sequence
`0 → Λ_Y → ν_*Λ_Ỹ → ⊕_e i_{e*}Λ(e) → 0` is exact, the last map being restriction to the two branches followed by the
quotient. Branch ordering identifies `Λ(e)` with `Λ`, with the sign of the normalization differential, and on global
sections the map `H^0(Ỹ, Λ) → ⊕Λ(e)` is that differential. This is an étale constant-sheaf statement, distinct from the
coherent normalization and conductor sequence. *Proof sketch.* Check stalks at smooth points and at the two-branch
nodes, using conservativity of geometric stalks. (Illusie 1991, §2.3, (2.3.1)–(2.3.5), and Lemme 2.4.) *Needs:* the
construction above; StableReduction Layer 1; EtaleDualityAndPerverseSheaves Layer EDC.0.

**Checks.**

- At a node the cokernel of the diagonal Λ→Λ² is rank one.
- At a smooth point the cokernel vanishes.

### 7a.2 Nearby cycles at the nodes and the specialization sequence

**Theorem.** `R^0ΨΛ = Λ_Y`, `R^1ΨΛ` is supported at the nodes, and `R^qΨΛ = 0` for `q > 1`. There is a canonical residue
identification `R^1ΦΛ(e)(1) ≅ Λ'(e)`, with `Λ'(e) = ker(sum : Λ^{B_e} → Λ)` dual to `Λ(e)`. Inertia acts trivially on these
cohomology sheaves, although its action on the complex `RΨΛ` and on `H^1` of the generic fibre need not be trivial. In
the strictly semistable case (`X` regular), every thickness is one. *Proof sketch.* Off the nodes use smooth local
acyclicity (0.5); at a node use the stalk formula of 0.5 and the one-dimensional quadratic calculation of 2.6; the
branch residue and trace dualities identify the twist. (Illusie 1991, §§1.2–1.5, (1.2.1)–(1.2.2), (1.3.3), (1.5.1).)
*Needs:* 0.5, 2.6; StableReduction Layer 1; EtaleDualityAndPerverseSheaves Layer EDC.2 (trace pairing).

**Checks.**

- The smooth locus has R¹Φ=0.
- A split node has one copy of Λ(−1) in R¹Φ; trivial sheaf action does not force N=0 globally.

**Lemma (node residue and the sign of the variation).** With Illusie's dual branch bases `δ'_e = (1, −1)` and `δ_e`, the
normalized local variation `N_e : R^1ΦΛ(e)(1) → H^1_e(Y, RΨΛ)` sends `δ'_e` to `−n_e δ_e`, and the map to `H^2(Y, Λ)(1)` sends
`δ'_e` to `[C_{tail e}] − [C_{head e}]`; then `Var_e(σ) = t_ℓ(σ) N_e`. The two connecting morphisms compared through the
localization and normalization sequences differ by a sign: in the nine-diagram of distinguished triangles built from
`Y − {nodes} ⊂ Y ⊃ {nodes}` and the normalization, the two composite boundary maps `H^0(nodes, Λ(e)) → H^1_{nodes}(Y, Λ)`
are negatives of each other (the anticommutativity of the boundary maps of a nine-diagram, a statement about
triangulated categories proved here). Reversing the branch order changes both bases and leaves the geometric map
unchanged. *Proof sketch.* Identify the boundary map through local trace duality and the odd Picard–Lefschetz
formula 2.7 for the local equation `uv = a_e`, whose Kummer character is `v(a_e) t_ℓ = n_e t_ℓ`; compare local
cospecialization with normalization through the nine-diagram sign; insert `t_ℓ(σ)`. (Illusie 1991, Lemme 1.5.4, §1.7,
(1.7.1)–(1.7.4), Lemme 2.4.) *Needs:* 7a.1, the theorem above, 0.4, 1.2, 2.7; EtaleDualityAndPerverseSheaves Layer
EDC.1 (localization triangles).

**Checks.**

- For uv=π, N_e is minus the identity in the branch bases.
- Reversing the branch order changes both bases, leaving the geometric map unchanged.

**Theorem (specialization sequence of a nodal curve).** Proper base change and the vanishing triangle give the exact
sequence

```text
0 → H^1(Y, Λ) → H^1(X_η̄, Λ) → ⊕_e Λ'(e)(−1) → H^2(Y, Λ) → H^2(X_η̄, Λ) → 0,
```

whose middle boundary is, in branch coordinates, the oriented incidence map on edges followed by the component trace
classes; `H^2(X_η̄, Λ) ≅ Λ(−1)` since the generic fibre is connected, and `H^0` specializes isomorphically. All arrows,
twists and Galois actions are kept; the descent from the strict henselization is part of 7a.5. *Proof sketch.* Use
the proper comparison of 0.6, the vanishing triangle and the theorem above (the node support kills `H^j(Y, R^1Φ)`, `j > 0`);
identify the boundary through the sign lemma and the final trace through connectedness. (Illusie 1991, §1.6,
(1.6.1)–(1.6.6), and §2.2.) *Needs:* 0.6, the two results above; EtaleDualityAndPerverseSheaves Layer EDC.2.

**Checks.**

- The kernel of the node-to-component map is H₁(Γ,Λ)(−1).
- A bridge contributes a local vanishing cycle but no nonzero quotient in generic H¹.

**Theorem (graph and component cohomology).** The normalization resolution gives a canonical exact sequence
`0 → H^1(Γ, Λ) → H^1(Y, Λ) → ⊕_v H^1(Ỹ_v, Λ) → 0` and `H^2(Y, Λ) ≅ ⊕_v Λ(−1)`; here `H^1(Γ, Λ) = coker d`, while
`H_1(Γ, Λ) = ker ∂` is the dual lattice. No canonical splitting is asserted. With branch choices, the normalization
injection `γ'` and the cospecialization map `c'` satisfy `c' = −γ'`. *Proof sketch.* Take the long exact sequence of the
normalization resolution, using that the node scheme is finite; identify the graph quotient with `coker d` and the
component `H^2` by the trace of EDC.2; compare the two graph injections through the sign lemma. (Illusie 1991,
§§2.1–2.4, especially (2.3.5) and Lemme 2.4; (2.6.1)–(2.6.5).) *Needs:* 7a.1, the sign lemma;
EtaleDualityAndPerverseSheaves Layer EDC.2; NeronModelsAndSemistableAbelianVarieties Layer 4, §4.2 (characters of the
torus as integral graph cycles).

**Checks.**

- A tree has H¹(Y)=⊕H¹(Ỹ_v); a cycle of rational components has graph H¹ of rank one.

### 7a.3 Monodromy of a nodal curve

**Theorem (graph factorization of monodromy).** Put `V = H^1(X_η̄, ℚ_ℓ)`, `M = H_1(Γ, ℤ)` and `M^∨ = H^1(Γ, ℤ)`. The monodromy
operator `N : V(1) → V` of 1.2 factors as `N = c' ∘ u_− ∘ c`, where `c : V(1) → M ⊗ ℚ_ℓ` is the specialization quotient,
`c' : M^∨ ⊗ ℚ_ℓ → V` is cospecialization, and `u_−(a)(b) = −Σ_e n_e a_e b_e`; equivalently `N = γ' ∘ u_− ∘ γ` with `γ = −c`, `γ' = −c'`.
The form `u_−` is nondegenerate over `ℚ_ℓ` (negative definite over `ℚ`), but need not be an integral isomorphism. *Proof
sketch.* Factor `σ − 1` through the local variations (0.4 and the sign lemma); identify the quotient and the injection
with the graph lattices through the specialization sequence and its dual; sum the local maps; `Σ n_e a_e²` is positive
definite on `H_1(Γ, ℚ)`. (Illusie 1991, §§2.1–2.2, (2.1.3), (2.2.3); (2.6.5)–2.7.) *Needs:* 7a.2, 1.2;
NeronModelsAndSemistableAbelianVarieties Layer 4, §4.2; Mathlib `LinearMap.ker`, `LinearMap.range`, `Module.finrank`.
*Lean:* `Suggested.lean` declares the form `Semistable.negEdgePairing n` (`Matrix.toBilin'` of `−diag(n)`), with the
two-edge cycle check `u₋((1, −1), (1, −1)) = −2` as an example.

**Checks.**

- N²=0 and rank N=b₁(Γ).
- For a two-edge cycle the scalar pairing is −2; the integral determinant is not forced to be a unit.

**Theorem (invariant cycles for nodal curves, without weights).** With rational coefficients, specialization
`sp : H^1(Y, ℚ_ℓ) → V` is injective with image `V^I = ker N`. In degrees `0` and `2` specialization is onto the invariants as
well; in degree `2` it is the component-trace sum, an isomorphism only when there is one geometric component. *Proof
sketch.* From the factorization, `u_−` and `c'` are injective over `ℚ_ℓ`, so `ker N = ker c`, which is the image of `H^1(Y)` by the
specialization sequence; `ρ(σ) = 1 + t_ℓ(σ)N` and surjectivity of `t_ℓ` identify `ker N` with the invariants. (Illusie 1991,
Remarques 2.8–2.9, p. 42.) *Needs:* the factorization, 7a.2, 1.2.

**Checks.**

- Smooth specialization has N=0 and is an isomorphism in all degrees.
- A two-component rational cycle has invariant H¹ of dimension one and generic H¹ of dimension two.

**Theorem (monodromy filtration of a nodal curve).** The monodromy filtration of `V` centred at `1` (1.3) is `M_j = 0` for
`j < 0`, `M_0 = im N`, `M_1 = ker N = sp H^1(Y)` and `M_j = V` for `j ≥ 2`, after Tate-coordinate identifications; canonically
`gr_0 ≅ H^1(Γ, ℚ_ℓ)`, `gr_1 ≅ ⊕_v H^1(Ỹ_v, ℚ_ℓ)` and `gr_2 ≅ H_1(Γ, ℚ_ℓ)(−1)`, and `N : gr_2 → gr_0(−1)` is the negative edge pairing
in the residue coordinates. These indices label the monodromy filtration; no Frobenius weight is asserted over an
arbitrary residue field. *Proof sketch.* `N² = 0` and the uniqueness of 1.3; the invariants theorem and 7a.2 give `gr_1`
and the graph subspace; the specialization sequence and the factorization give `gr_2`. (Illusie 1991, Remarque 2.9,
p. 42; (2.2.3), (2.6.5).) *Needs:* 1.3, the two theorems above, 7a.2.

**Checks.**

- For a smooth curve only gr_1 survives.
- For a cycle of rational components gr_1=0, and gr_0,gr_2 each have dimension one.

### 7a.4 The Jacobian

**Comparison.** For a regular projective semistable model `X/S` of a smooth geometrically connected curve, over a
strictly henselian base with algebraically closed residue field, `V_ℓ(Jac(X_η)) ≅ H^1(X_η̄, ℚ_ℓ)(1)` (Kummer theory and
`Pic^0 = Jac`), and under this identification the invariant part is `V_ℓ(Pic^0_Y)`, the toric part is `H^1(Γ, ℚ_ℓ)(1)` and the
abelian quotient is `⊕_v V_ℓ(Jac(Ỹ_v))`. The character lattice of the torus is `H_1(Γ, ℤ)`, not `H^1`. The normalization,
specialization and Tate exact sequences commute, the identifications being fixed by the Kummer realization and the
canonical principal polarization; the diagrams agree as Galois modules, not only in dimension. The integral Tate
modules are rationalized only after their maps are constructed. *Proof sketch.* Use the normalization sequence and
the identification of the Néron identity component with `Pic^0` (NeronModelsAndSemistableAbelianVarieties Layer 3,
§§3.8–3.9, and Layer 4, §§4.1–4.2), the Tate module and its duality pairing (AbelianSchemesAndArithmeticModuli Layer
A4, §A4.1), and the finite-level comparison of `H^1_ét(C, ℤ/ℓ^n)` with the dual of `J_C[ℓ^n]`
(CohomologicalPointCounting/TraceFormula Layer 8); Kummer theory compares the additive normalization sequence with
the multiplicative Picard sequence; the sign lemma and the torsion-compatible specialization maps identify the
filtration. (Illusie 1991, §§2.3–2.6, (2.3.3)–(2.3.5), (2.6.1)–(2.6.5).) *Needs:* 7a.2, 7a.3;
NeronModelsAndSemistableAbelianVarieties Layers 3–4; AbelianSchemesAndArithmeticModuli Layer A4;
CohomologicalPointCounting/TraceFormula Layer 8.

**Checks.**

- The torus rank equals b₁; the abelian rank is twice the sum of normalization genera.
- The diagrams agree as Galois modules, not just dimensions.

**Comparison (the monodromy pairing).** Under the Jacobian identification, the ℓ-adic pairing defined from `N` by the
trace-dual quotient and injection is Illusie's negative form `u_− ⊗ ℚ_ℓ`, whereas Grothendieck's integral monodromy pairing
in the convention of NeronModelsAndSemistableAbelianVarieties Layer 4, §§4.3–4.4 is the positive form `u_+ = Σ_e a_e b_e` on a
regular model. Then `u_− = −u_+`; the two connecting-map signs are transported explicitly. The pairing and the
factorization are compatible with reorientation and coefficient extension; for a model that is not regular, the
thickness-weighted form is obtained through the regular subdivision of 7a.5. No integral unimodularity is
asserted. *Proof sketch.* Illusie's Theorem 2.7 compares the trace-dual Tate realization with SGA 7 IX 9.1.2 and
records the opposite conventions; use `c' = −γ'` and `c = −γ`. (Illusie 1991, Théorème 2.7 and its comparison with SGA 7 I,
IX 9.1.2, p. 41.) *Needs:* the factorization of 7a.3 and the Jacobian comparison; NeronModelsAndSemistableAbelianVarieties
Layer 4, §§4.3–4.4; Mathlib `LinearMap.BilinForm`.

**Checks.**

- For a regular two-edge cycle the two pairings are [−2] and [2].
- There is no integral unimodularity claim.

### 7a.5 Changes of choices and of the base

**Theorem.** The comparison diagrams of 7a.2–7a.4 descend from the strict henselization, are equivariant for the
residue Galois action permuting components and branches, and commute with coefficient extension; reorientation
acts by signed edge permutations. Replacing a generator of `ℤ_ℓ(1)` by a unit multiple rescales the matrix of `N` and the coordinate of `t_ℓ(σ)`
inversely, so `log T = t_ℓ(σ)N` and the twisted `N` are unchanged. Under a finite extension of the trait of ramification index `e`, with
compatible tame identifications, `N_new = e · N_old`. An edge of thickness `n_e` becomes, in a regular semistable
resolution, a chain of `e · n_e` unit-thickness edges (exceptional rational components contribute no `H^1`), and the summed
edge pairing scales by `e`. *Proof sketch.* Use the trait base change of 0.6, the compatibility of the tame character with
ramified extensions (0.1, 1.2) and the signed branch transports; compare normalization maps and variation factors
before passing to graph quotients; a chart `uv = π^{n_e}` becomes `uv = π_new^{e n_e}` up to a unit, and its resolution is
the subdivision of TauCetiRoadmap StableReduction Layer 4. (Illusie 1991, §0 (thicknesses) and §§1.7, 2.1–2.7; Illusie
2021, §4.4.) *Needs:* 7a.3, 7a.4, 0.6, 1.2; TauCetiRoadmap StableReduction Layers 1 and 4.

**Checks.**

- Unramified base change preserves N; ramification e scales it.
- An orientation change conjugates matrices, preserving the underlying map and pairing.
- An edge of thickness 2 under ramification index 3 resolves into 6 unit edges; the summed pairing is 3 times the original thickness-2 form.

### 7a.6 Examples of nodal curves

**Application.** The constructions are instantiated on three models.

- A smooth proper model: `N = 0` and specialization is an isomorphism in all degrees.
- Two smooth components meeting in one node (a tree): `R^1Φ` is nonzero at the node, but `N = 0` on `H^1` of the generic
  fibre.
- A split genus-one model with special fibre two smooth rational curves meeting transversally in two points (type
  `I_2`): over a henselian trait with residue characteristic not two or three, the Weierstrass curve
  `y² = x³ + x² + π²` has `v(Δ) = 2` and split multiplicative reduction, its Weierstrass model has one node of thickness two
  at the origin (local equation `uv = π²`), and one blow-up of that point (TauCetiRoadmap StableReduction Layer 4,
  the test case `xy = π^n`) gives a regular model whose special fibre is the normalized nodal cubic and the exceptional
  conic, meeting in two points. Here `gr_0` and `gr_2` have rank one, `gr_1 = 0`, and in compatible rational bases
  `N(a, b) = (−2b, 0)` and `ρ(σ) = 1 + t_ℓ(σ) N`: the graph has one cycle `(1, −1)` of norm `−2` for `u_−`.

The algebraic computation alone (a two-dimensional linear map) is only a test; the existence of the model is part of
the statement. (Illusie 1991, §§2.1–2.2, (2.1.1), (2.1.3); Remarques 2.8–2.9; TauCetiRoadmap EllipticCurves Layer 4
for Tate's algorithm.) *Needs:* 7a.3, 7a.4; TauCetiRoadmap StableReduction Layer 4; TauCetiRoadmap EllipticCurves
Layer 4.

**Checks.**

- The two-edge N is nonzero over ℚℓ for every ℓ, including ℓ=2.
- The bridge is not mistaken for a nonzero global monodromy contribution.

### 7a.7 Strictly semistable degenerations: nearby cycles

In 7a.7–7a.9, `X/S` is strictly semistable of pure relative dimension `d` over a henselian trait: étale locally
`X → Spec R[t_0, …, t_d]/(t_0 ⋯ t_r − π)`, `0 ≤ r ≤ d`, with smooth irreducible components `Y_i` of the special fibre `Y`. For a
set `J` of components, `Y_J = ∩_{i∈J} Y_i`, and `Y^{(j)}` is the disjoint union of the `(j + 1)`-fold intersections (`Y^{(0)}` the
components), with `a_j : Y^{(j)} → Y`.

**Theorem (stalks).** For `Λ = ℤ/ℓ^m`, `ℤ_ℓ` or `ℚ_ℓ` and a geometric point `x` lying on `a` components,
`R^qΨΛ_x ≅ ∧^q(coker(diag : Λ → Λ^a))(−q)`, the stalk form of the Kummer residue description; `R^0Ψ = Λ`, and inertia acts
trivially on every `R^qΨ`. The residue resolution is canonical before a basis is chosen. The cohomology sheaves do not
determine the derived inertia action. *Proof sketch.* Absolute purity (0.10: relative purity `Λ ≅ Rf^!Λ(−d)[−2d]` for the
regular `X → S`, and `R^*j_*Λ` the exterior algebra on `⊕Λ_{Y_i}(−1)`) and tameness give `R^qΨ` as the cokernel of the Kummer
class of the uniformizer acting on `R^qj_*`; evaluate at a geometric point. (Saito 2003, §1.1, Propositions 1.1.1–1.1.2 and
Corollary 1.1.3; Illusie 2021, §2.2, formula (2.5), and §6.3.) *Needs:* 0.5, 0.10, 1.2; EtaleDualityAndPerverseSheaves
Layers EDC.2 and EDC.3.

**Checks.**

- One branch gives R^qΨ = 0 for q > 0; two branches give one Λ(−1); three give ranks 1, 2, 1.

**Comparison (the graded nearby complex).** With `ℚ_ℓ` coefficients, `RΨℚ_ℓ[d]` is perverse (6.2), and the monodromy filtration
centred at `0` of the nilpotent `N` on it, taken in the abelian category of perverse sheaves (1.3), has

```text
gr_r RΨℚ_ℓ ≅ ⊕_{p, q ≥ 0, p − q = r} a_{p+q,*} ℚ_ℓ(−p)[−p − q].
```

`N` lowers `r` by two and sends the `(p, q)` summand identically onto the `(p − 1, q + 1)` summand after a twist `(−1)` when
`p ≥ 1`, and to zero otherwise. This is a concrete model of the filtration of 1.3, not a second construction. *Proof
sketch.* The kernel filtration of `N` is the canonical truncation and the image filtration is identified through residues
(Saito, Lemma 2.2.1 and Corollary 2.2.2); the convolution characterization of 1.3 gives the graded pieces; check
independence of the generator and that `log T` and `T − 1` induce the same map on the graded pieces. (Saito 2003,
Lemma 2.2.1, Corollary 2.2.2, Proposition 2.2.3; Illusie 2021, §6.3, (6.3)–(6.4).) *Needs:* 1.3, 6.2, the stalk theorem;
Mathlib `DerivedCategory`.

**Checks.**

- For two components, gr₁=ℚℓ_C(−1)[−1], gr₀=ℚℓ_D1⊕ℚℓ_D2, gr₋₁=ℚℓ_C[−1].
- Trivial action on R^qΨ does not replace the nonzero derived N.

### 7a.8 The weight spectral sequence

**Construction.** From the finite filtered complex of 7a.7, the spectral sequence of a filtered object (Mathlib
`CategoryTheory.Abelian.SpectralObject.spectralSequence`) gives the cohomological spectral sequence

```text
E_1^{p,q} = ⊕_{i ≥ max(0, −p)} H^{q−2i}(Ȳ^{(p+2i)}, ℚ_ℓ(−i))  ⇒  H^{p+q}(Ȳ, RΨℚ_ℓ),
```

with `d_r` of bidegree `(r, 1 − r)`; strata with negative or out-of-range index contribute zero, so the sum is finite. For `X`
proper, proper base change identifies the abutment with `H^{p+q}(X_η̄, ℚ_ℓ)`; without properness the abutment is the nearby
cohomology, not the generic-fibre cohomology. The induced filtration `M'` on `H^m` gives the weight indexing
`W_s H^m = M'_{s−m}`; its equality with the monodromy filtration of `N` on `H^m` is a separate statement, not asserted here.
The columns lie in `[−d, d]`, so the sequence degenerates at the page `2d + 2` without any assumption of degeneration at
`E_2`. Define `Semistable.weightSpectralSequence`.

- `Semistable.weightSpectralSequence_e1`: The first page is canonically isomorphic to the displayed finite sum of twisted stratum cohomology.
- `Semistable.weightSpectralSequence_e2`: The second page is the homology of the first-page differential.
- `Semistable.weightSpectralSequence_abutment`: For proper X the finite filtration converges to generic-fibre cohomology with induced filtration M′ and actual comparison maps. Relative dimension d bounds columns by [-d,d], so page 2*d+2 is stabilized and identifies with the graded abutment. Earlier stabilization requires a separate degeneration proof.
- `Semistable.weightSpectralSequence_reindex`: A signed permutation of component indices induces an isomorphism of spectral sequences compatible with stratum maps and N.

*Proof sketch.* Apply the spectral sequence of a filtered complex to 7a.7; compute `E_1` from the graded pieces and proper
pushforward from the strata; convergence from the bounded filtration and proper base change. (Saito 2003, Corollary 2.2.4
and its proof, published as Corollary 2.8; Liu–Tian–Xiao–Zhang–Zhu 2022, §5.9, Construction 5.9.1, p. 231, and the proof
of Lemma 5.9.3, pp. 233–240, for the nonproper form.) *Needs:* 7a.7, 0.6; EtaleDualityAndPerverseSheaves Layer EDC.0;
Mathlib `CategoryTheory.Abelian.SpectralObject`, `CategoryTheory.CohomologicalSpectralSequence`, `ModuleCat`.

**Checks.**

- `Semistable.weight_ss_smooth_test`: With one smooth component, E₁^{0,q}=H^q(Y,ℚℓ), and E₁^{p,q}=0 for p≠0.
- `Semistable.weight_ss_curve_test`: For relative dimension 1, E₁^{−1,2} = H⁰(nodes, ℚ_ℓ)(−1), E₁^{0,1} = ⊕H¹(components, ℚ_ℓ), E₁^{1,0} = H⁰(nodes, ℚ_ℓ); d₁ also includes components → nodes and nodes → H²(components).
- `Semistable.weight_ss_nonproper_test`: For the local model uv = π the construction abuts to H*(Ȳ, RΨ), not to the cohomology of the generic fibre; with the column bound [−d, d], the page 2d + 2 is stable.
- A smooth model has only p=0 terms.
- For curves the page carries the normalization restriction and node Gysin maps of 7a.2.
- Nonproperness does not erase the spectral sequence but changes the justified abutment.

**Theorem (the differential `d_1`).** Order the components. For `J = I − {i_j}` use the sign `(−1)^j`; let `δ^*` be the alternating
restriction maps from `(r + 1)`-fold to `(r + 2)`-fold intersections and `δ_*` the alternating Gysin maps in the opposite
direction, of degree two and twist `(1)`. In Saito's convention `d_1 = δ^* + δ_*` on the corresponding summands of `E_1`; their
squares vanish and the mixed composites anticommute, by the compatibility of divisors and intersections. Passing to
Rapoport–Zink's coordinates uses the signed conjugation `(−1)^{ij}`; the matrices are not equal without it. *Proof sketch.*
Use the transverse restriction and Gysin maps, the self-intersection and projection formulas of EDC.3, and the residue
classes of Saito, Lemma 2.2.5 and Proposition 2.2.6; compute the total-complex signs. (Saito 2003, Lemma 2.2.5 and
Proposition 2.2.6, including the final sign comparison.) *Needs:* 7a.7, the construction above, 0.10;
EtaleDualityAndPerverseSheaves Layer EDC.3.

**Checks.**

- For curves the maps agree with the incidence maps of the specialization sequence of 7a.2, in its residue coordinates.
- For three intersecting components, the alternating second boundary vanishes.

### 7a.9 Monodromy on the weight spectral sequence

**Comparison.** The twisted `N` induces `E_1^{p,q}(1) → E_1^{p+2, q−2}`, the identity on common stratum summands in the
normalized coordinates of 7a.7 and zero on absent summands; it commutes with `d_1` and passes to the abutment. For curves the
page positions force `E_2 = E_∞`, and the induced filtration, recentred at `1`, is that of 7a.3, the identification of `N`
including the residue-coordinate sign. In higher dimension, equality of `M'` with the monodromy filtration on cohomology is
not inferred from the existence of the sequence or from degeneration at `E_2`. The integral statement of the source is for
`ν = T − 1`; `log T` is not defined integrally in general. *Proof sketch.* Saito's Corollary 2.2.4(2) computes `N` on each common
summand; compatibility with `d_1` comes through the filtered morphism; for curves compute the `E_2` kernels and cokernels
and compare their edge pairing with 7a.3. (Saito 2003, Corollary 2.2.4(2); Illusie 2021, §§6.3–6.4;
Liu–Tian–Xiao–Zhang–Zhu 2022, §5.9, p. 233.) *Needs:* 7a.8, 7a.3.

**Checks.**

- The curve E₂ pieces are graph cohomology, component H¹ and graph homology with the stated twist.
- The rational logarithm and T−1 have the same leading action on gr, without claiming they are equal on every higher-dimensional complex.

### Examples

- The node `uv = π` (relative dimension one, two branches): `R^1Ψ = Λ(−1)` at the node with trivial sheaf-level action, the
  weight spectral sequence of a proper curve with this local picture has `E_1^{−1,2} = H^0(nodes)(−1)`,
  `E_1^{0,1} = ⊕ H^1(components)`, `E_1^{1,0} = H^0(nodes)`, and `N` maps `E_1^{−1,2}(1)` isomorphically onto `E_1^{1,0}`.
- Three components through a point (`r = 2`): the stalks of `R^qΨ` have ranks `1, 2, 1`.

### Dependencies

Layers LPV.0, LPV.1, LPV.2 and LPV.6; TauCetiRoadmap StableReduction Layers 1 and 4; TauCetiRoadmap EllipticCurves
Layer 4; NeronModelsAndSemistableAbelianVarieties Layers 3 and 4; AbelianSchemesAndArithmeticModuli Layer A4;
CohomologicalPointCounting/TraceFormula Layer 8; EtaleDualityAndPerverseSheaves Layers EDC.0–EDC.3; Mathlib (spectral
objects and spectral sequences, `DerivedCategory`).

## Layer LPV.7b: Invariant cycles

This layer builds the geometric half of Deligne's invariant-cycle theorems (Weil II §3.6 and §6.2): the specialization
map into inertia invariants, the continuous Wang sequence, arithmetic spreading of a degeneration to a finite field,
the localization–Wang cross with its support duality, the support-bound weak Lefschetz theorem, the extension
obstruction for general pencils and the comparison of monodromy images on a general line. It proves the local and
global invariant-cycle theorems in the form in which every input except the theory of weights is supplied here: the
local theorems assume that the Frobenius spectra of the two outer terms of the cross are disjoint, and the global
theorem assumes local surjectivity at the singular members of a general pencil. Deligne's weight theory supplies
exactly these hypotheses (Weil II, Lemmes 3.6.2–3.6.3, Proposition 6.2.6 and Théorème 6.2.9); this roadmap does not develop
weights. The complex local invariant-cycle theorem is stated in the same conditional form for mixed Hodge
structures. Throughout, `k` is algebraically closed, `ℓ` is invertible in `k`, and coefficients are `ℚ_ℓ` or `ℚ̄_ℓ`.

### 7b.1 Specialization into invariants

**Construction.** For `f : X → S` proper over a henselian trait and `K ∈ D^b_c(X, ℚ_ℓ)`, the specialization map
`sp_i : H^i(X_s̄, K) → H^i(X_η̄, K)` of 0.6 has image in the invariants of the continuous inertia representation, because
inertia acts trivially on `i^*K` and the vanishing triangle is equivariant. Define
`InvariantCycles.invariantSpecialization` as its corestriction (Mathlib `LinearMap.codRestrict`) to
`Representation.invariants`; its composite with the inclusion is `sp_i`. It is defined for every proper family;
surjectivity is a theorem only under the hypotheses of 7b.5, 7b.6 and 7b.8.

- `InvariantCycles.invariantSpecialization_coe`: The inclusion of invariants composed with sp^I equals sp.
- `InvariantCycles.invariantSpecialization_range`: sp^I is surjective exactly when range sp equals the invariant submodule.
- `InvariantCycles.invariantSpecialization_unique`: A linear map to invariants whose composite with inclusion is sp equals sp^I.
- `InvariantCycles.invariantSpecialization_natural`: For equivariant cohomology comparison maps commuting with sp, the corestricted maps commute too.

*Source.* Weil II, introduction to §3.6, p. 212, and 6.2.9. *Needs:* 0.6; Mathlib `Representation.invariants`,
`Representation.mem_invariants`, `Representation.trivial`, `LinearMap.codRestrict`; ArithmeticGaloisDuality Layer R02.1
(continuous coefficients and inverse limits); EtaleDualityAndPerverseSheaves Layer EDC.0. *Lean:* `Suggested.lean`
declares the linear-algebra core `InvariantCycles.invariantSpecialization ρ sp h`.

**Checks.**

- `InvariantCycles.invariant_sp_identity_test`: For the identity map and trivial action, the corestriction is surjective.
- `InvariantCycles.invariant_sp_zero_test`: The zero map to a nonzero trivially acted-on one-dimensional space corestricts but is not surjective.
- `InvariantCycles.invariant_sp_unipotent_test`: On ℚ² with ρ(t)(a, b) = (a + tb, b), the injection a ↦ (a, 0) corestricts surjectively onto the invariants ℚ ⊕ 0, while the identity map ℚ² → ℚ² does not land in the invariants and has no corestriction.
- The underlying map is exactly sp_i.
- There is no surjectivity assertion in this construction.

### 7b.2 The continuous Wang sequence

**Theorem.** For `f : X → S` proper over the strict henselization `S` of a smooth curve at a point, in equal
characteristic, and `K ∈ D^b_c(X, ℚ_ℓ)` (or a finite extension of `ℚ_ℓ`), continuous Hochschild–Serre gives the exact sequence

```text
0 → H^{i−1}(X_η̄, K)_I(−1) → H^i(X_η, K) → H^i(X_η̄, K)^I → 0.
```

No smoothness of the total space or of the generic fibre is needed. *Proof sketch.* Let `I' = ker(t_ℓ : I → ℤ_ℓ(1))`; it is
profinite of order prime to `ℓ` (wild inertia and the other tame factors), so averaging over its finite quotients makes
invariants and coinvariants exact on compatible `ℤ/ℓ^n`-systems, with `W = V^{I'} ≅ V_{I'}`. The quotient `ℤ_ℓ(1)` has
cohomological dimension one: `H^0(ℤ_ℓ(1), W) = V^I`, `H^1(ℤ_ℓ(1), W) = V_I(−1)`, `H^j = 0` for `j ≥ 2`. The two-column spectral
sequence gives the exact sequence at each finite level; pass to the limit and rationalize under finite
constructibility. Discrete group cohomology of the underlying abstract group is not this theorem. (Weil II, proof
of 3.6.1, equations (1)–(5), p. 213; proof of 6.2.9, p. 249.) *Needs:* 0.1, 0.8; ArithmeticGaloisDuality Layers R02.1
(continuous cochains, inverse limits, lattices) and R02.2 (Hochschild–Serre, the case of a quotient of cohomological
dimension one); EtaleDualityAndPerverseSheaves Layer EDC.0.

**Checks.**

- For trivial rank-one coefficients, H¹(I,ℚℓ)=ℚℓ(−1).
- The degree-two term vanishes without treating ℤℓ as a discrete infinite cyclic group.

### 7b.3 Arithmetic spreading

**Lemma.** Let `S = Spec k[T]^h_(T)`, `f : X → S` proper with `X` essentially smooth over `k` and `X_η` smooth. Then `f` spreads out to
`f' : X' → C` with `C` a smooth `k`-curve with a marked point, `X'` smooth, and `f'` smooth away from the marked point; and,
after shrinking an integral arithmetic parameter base of finite type over `ℤ` and choosing a closed point, to a family
over a smooth curve over a finite field `𝔽_q` with an `𝔽_q`-rational marked point, such that the specialization maps of
cohomology and the image of local inertia in the relevant ℓ-adic local system are preserved. What is preserved is the
inertia-fixed subspace and the specialization image, not only Betti numbers. *Proof sketch.* Limit descent of finitely
presented data algebraizes the henselian family with its marked point; the tame specialization theorem for the
compactified tame tower (SGA 1 XIII, in InverseGaloisAndArithmeticFundamentalGroups Layer IG.1, §IG.1.3) and the
stabilizers of the lifted boundary sections preserve the local monodromy image on a small enough parameter open;
proper and smooth base change transport the cohomology maps. (Weil II, proof of 3.6.1, p. 213, referring to 1.11.1–1.11.3.)
*Needs:* 7b.1; InverseGaloisAndArithmeticFundamentalGroups Layer IG.1, §IG.1.3; SchemeAndStackFoundations Layer 0, §0.9
(limits of finitely presented data); CohomologicalPointCounting/EtaleBaseChange Layers 4–5; ArithmeticGaloisDuality
Layer R02.1.

**Checks.**

- The comparison identifies invariants and specialization image; mere equality of ranks is insufficient.

### 7b.4 The localization–Wang cross

**Comparison.** If `X` is essentially smooth over `k` of pure dimension `d` and proper over `S`, combine the Wang sequence with the
localization sequence `H^i(X) → H^i(X_η) → H^{i+1}_{X_s}(X)`, proper base change `H^i(X) ≅ H^i(X_s)`, and support duality
`H^{i+1}_{X_s}(X) ≅ H^{2d−i−1}(X_s)^∨(−d)`. The result is an exact cross with centre `H^i(X_η)`, lower term `H^i(X_s)`, upper term
`C = H^{2d−i−1}(X_s)^∨(−d)` and right term `B = H^i(X_η̄)^I`, the composite `H^i(X_s) → B` being `sp^I`. After arithmetic spreading the
cross is Frobenius-equivariant. It is a statement with rational coefficients; no torsion-free integral duality is
assumed. *Proof sketch.* Localization (EDC.0), Verdier duality on the smooth `X` (EDC.1, EDC.2), proper base change, and the
Wang sequence of 7b.2, keeping all maps and arithmetic actions. (Weil II, proof of 3.6.1, equations (6)–(8), p. 214.)
*Needs:* 7b.1, 7b.2; EtaleDualityAndPerverseSheaves Layers EDC.1 (biduality) and EDC.2 (smooth trace and purity).

**Checks.**

- The upper twist is −d and its cohomological degree is 2d − i − 1.
- Integral torsion is explicitly excluded from this dual-vector-space identification.

### 7b.5 The local invariant-cycle theorem

**Lemma (spectral separation).** Let `F` act compatibly on an exact cross of finite-dimensional vector spaces over an
algebraically closed field: `L → M → C` exact at `M`, and `M → B → 0` exact, with `F`-equivariant maps. If no eigenvalue of `F` on
`B` is an eigenvalue of `F` on `C`, then the composite `L → B` is surjective. *Lean:* `Suggested.lean`
states the lemma as `InvariantCycles.surjective_of_disjoint_spectra`. *Proof sketch.* Taking the sum of the generalized eigenspaces of `F`
for the eigenvalues of `F` on `B` is an exact functor on finite-dimensional `F`-modules; it is all of `B`, kills `C`, and so the
corresponding part of `M` maps into the image of `L` and onto `B`. (The argument of Weil II, final paragraph of the proof of
3.6.1, p. 214, with exact weight filtrations replaced by generalized eigenspaces.) *Needs:* Mathlib
`Module.End.maxGenEigenspace`, `Module.End.HasEigenvalue`.

**Checks.**

- `separation_needed`: for `L = 0`, `M = B = C = k` with `M → C` the identity and `F = 1`, the spectra meet and `L → B` is not surjective.
- `separation_trivial_C`: if `C = 0` the lemma reduces to the exactness `L → M → 0` composed with `M → B`.
- `separation_two_eigenvalues`: with `M = k²`, `F = diag(1, q)`, `B` the first coordinate and `C` the second, the hypothesis holds
  and the conclusion is the surjectivity of `ker(M → C) = k ⊕ 0` onto `B`.

**Theorem (local invariant cycles, conditional form).** Let `S = Spec k[T]^h_(T)` and `f : X → S` proper, with `X` essentially
smooth over `k` and `X_η` smooth. Suppose that for one finite-field model of 7b.3 the Frobenius spectra on
`B_0 = H^i(X_{0,η̄}, ℚ_ℓ)^I` and on `C_0 = H^{2d−i−1}(X_{0,s̄}, ℚ_ℓ)^∨(−d)` are disjoint. Then
`H^i(X_s, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ)^I` is surjective. The theorem is about this equicharacteristic, algebraizable situation with
rational coefficients; it is not asserted over an arbitrary mixed-characteristic trait or with integral coefficients.
Deligne's weight bounds give the hypothesis for every such model: `B_0` has weights at most `i` and `C_0` weights at least
`i + 1` (Weil II, Lemmes 3.6.2–3.6.3), so the unconditional theorem is Weil II, Théorème 3.6.1. *Proof sketch.* Spread out
(7b.3), apply the cross (7b.4) over the finite-field model and the spectral separation lemma, and transport the
surjectivity back through the preserved specialization maps and inertia images. (Weil II, Théorème 3.6.1 and its proof,
pp. 213–214.) *Needs:* 7b.1, 7b.3, 7b.4, the spectral separation lemma.

**Checks.**

- For a smooth proper family the conclusion holds without the hypothesis: specialization is an isomorphism and
  inertia acts trivially (0.5).
- For a nodal curve, the conclusion agrees with the weight-free calculation of 7a.3: `sp` maps `H^1(Y)` onto `ker N = V^I`.
- An arbitrary mixed-characteristic trait is not an instance of this statement.

### 7b.6 The complex local invariant-cycle theorem

**Theorem (conditional form).** Let `D ⊂ ℂ` be the unit disc and `f : X → D` proper with `X` a smooth complex manifold, `f` smooth over
`D* = D − {0}`, and `X ⊂ P^N(ℂ) × D` a closed analytic subspace whose projection is `f`. For `t ∈ D*` the Betti analogue of the cross
of 7b.4 (localization, topological Wang sequence over the punctured disc, Poincaré–Lefschetz duality) has centre
`H^i(X − X_0, ℚ)`, lower term `H^i(X_0, ℚ)`, upper term `H^{i+1}_{X_0}(X, ℚ)` and right term `H^i(X_t, ℚ)^{π_1(D*, t)}`. If this cross underlies
a cross of mixed Hodge structures (Tau Ceti's `TauCeti.Hodge.MixedHodgeStructure`) in which the right term has weights at most `i` and the
upper term weights at least `i + 1`, then `H^i(X_0, ℚ) → H^i(X_t, ℚ)^{π_1(D*, t)}` is surjective. The mixed Hodge structures with these
weight bounds are Steenbrink's limit mixed Hodge structure and Deligne's mixed Hodge structure on local cohomology, which
this roadmap does not construct. *Proof sketch.* The weight filtration is strict for morphisms of mixed Hodge structures
(Completed HodgeStructures, layer L2, mixed Hodge structures and strictness), so `W_i` is exact on the
cross and the separation argument of 7b.5 applies. (Weil II, 3.6.4, p. 215.) *Needs:* the spectral separation lemma
of 7b.5 in its mixed-Hodge form; Completed HodgeStructures, layer L2 (mixed Hodge structures, strictness); Tau Ceti
`TauCeti.Hodge.MixedHodgeStructure`; ComplexComparisonPartII Layer C5 (Betti cohomology of the analytic family and the localization
maps).

**Checks.**

- The trivial family `Y × D` has identity specialization.
- The rational coefficients and the projective factorization are part of the statement; without the weight hypothesis
  the conclusion is not asserted.

### 7b.7 Arithmetic models of complexes

**Definition (arithmetic model at a geometric generic point).** For a projective `k`-scheme `X` and `K ∈ D^b_c(X, ℚ̄_ℓ)`, an
arithmetic model `InvariantCycles.GeometricGenericArithmeticModel X K` consists of an integral scheme `A_0` of finite type over
`ℤ[1/ℓ]`, a morphism `Spec k → A_0` onto its generic point, a proper `X_0 → A_0`, a complex `K_0 ∈ D^b_c(X_0, ℚ̄_ℓ)`, and isomorphisms
`X ≅ X_0 ×_{A_0} Spec k` (a pullback square) and `K ≅` the pullback of `K_0`. It is data, not a proposition. A complex is
*potentially pure of weight `w`* when it has such a model with `K_0` pure of weight `w` in Deligne's arithmetic sense (Weil II,
6.2.7); purity belongs to the theory of weights and is not part of the structure here. API:

- `InvariantCycles.GeometricGenericArithmeticModel.base`, `.family`: the arithmetic base `A_0` and the model `X_0`, with the
  generic point, the structure map and properness as separate projections.
- `InvariantCycles.GeometricGenericArithmeticModel.realization`: the complex isomorphism `pullback(K_0) ≅ K`; the family
  base-change square is a separate projection.
- `InvariantCycles.GeometricGenericArithmeticModel.transport`: transport along compatible isomorphisms of `X` and `K`.
- `InvariantCycles.GeometricGenericArithmeticModel.shiftTwist`: a model of `K` gives one of `K[a](b)`.
- `InvariantCycles.GeometricGenericArithmeticModel.mk`, `.ext`: construction from all the data, and equality of models
  when all scheme, map, complex and realization data agree (proof fields are irrelevant; schemes and isomorphisms are
  data).

**Definition (arithmetic model of a trait family).** For `S = Spec k[T]^h_(T)`, `f : X → S` proper and `K ∈ D^b_c(X, ℚ̄_ℓ)`,
`InvariantCycles.TraitArithmeticModel f K` consists of an integral `A_0` of finite type over `ℤ[1/ℓ]` with `Spec k` mapping to its
generic point, a smooth relative curve `S_0 → A_0` with a section, a proper `f_0 : X_0 → S_0`, a complex `K_0`, and isomorphisms
identifying `S` with the henselization of `S_0 ×_{A_0} Spec k` along the section and `(X, K)` with the pullback of `(X_0, K_0)`. A
trait family is potentially pure of weight `w` (Weil II, 6.2.8) when it has such a model with `K_0` pure of weight `w`. API:
`InvariantCycles.TraitArithmeticModel.base`, `.family`, `.realization`, `.transport`, `.mk`, `.ext` as above, and
`InvariantCycles.TraitArithmeticModel.shrink` (restriction to a nonempty open of `A_0` containing the image of the generic
point, keeping the section).

*Source.* Weil II, Définition 6.2.8(a)–(d), p. 248; 6.2.7; proof of 6.2.12, p. 250. *Needs:* Mathlib
`AlgebraicGeometry.Scheme`, `IsProper`, `IsIntegral`, `LocallyOfFiniteType`, `QuasiCompact`, `IsOpenImmersion`,
`SmoothOfRelativeDimension`, `IsGenericPoint`, `CategoryTheory.IsPullback`, `HasDerivedCategory.standard`,
`CategoryTheory.shiftFunctor`; EtaleDualityAndPerverseSheaves Layer EDC.0; SchemeAndStackFoundations Layer 0.

**Checks.**

- `model_constant`: a smooth projective `X` defined over a finitely generated subring of `k`, with `K = ℚ̄_ℓ`, has the evident model,
  with its fibre and complex identifications.
- `model_shift_twist`: from a model of `K` one gets a model of `K[a](b)` with the same schemes; if `K_0` is pure of weight `w`, the new
  one is pure of weight `w + a − 2b`.
- `model_not_closed_point`: a parameter map `Spec k → A_0` factoring through a proper closed subset of `A_0` is not a model, even if
  the schemes and the complex are present.

**Lemma (models along a general incidence pencil).** Let `X ⊂ P` be projective, `K` with a model at the geometric generic point,
and `X ← Z ← X̃` the incidence diagram (`q : Z → X` the smooth incidence projection, `i : X̃ → Z` the restriction to a sufficiently
general line `D`, 3.2–3.3). Then, after shrinking the arithmetic base, the model spreads along the incidence diagram and gives
a trait model of `i^*q^*K` at every point of `D`, and `D(i^*q^*K) ≅ i^*q^*DK` in Deligne's normalization of the incidence pullback,
the relative-dimension shifts cancelling (`q` smooth, `i` generic-locally-acyclic for `K`). For a general smooth hyperplane `Y`,
`D(K|_Y) = DK|_Y(−1)[−2]`. Arbitrary closed immersions are not covered. When `K_0` is pure, the directional weight
estimates and this duality identity make the pulled-back model pure (Weil II, proof of 6.2.12); that conclusion belongs
to the theory of weights. *Proof sketch.* Spread the incidence diagram, the line and its section along the model;
apply generic local acyclicity (0.5) and the shifted Verdier duality exchanges for smooth and generic-locally-acyclic
pullback. (Weil II, proof of 6.2.12, p. 250; the duality comparison in the proof of 6.2.11.) *Needs:* the two definitions
above, 0.5, 3.2, 3.3; EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.1 (biduality, exchange with pullback).

**Checks.**

- For a general smooth hyperplane section, `D(K|_Y) = DK|_Y(−1)[−2]`.
- The statement needs the generality of the line; a special line through a singular point of `K` is not covered.

### 7b.8 Local invariant cycles for complexes

**Theorem (conditional form).** In the trait setting of 7b.7, let `f : X → S` be proper and `K ∈ D^b_c(X, ℚ̄_ℓ)` with a trait arithmetic
model. The cross of 7b.4 holds for `K` with upper term `H^{i+1}_{X_s}(X, K) ≅ H^{−i−1}(X_s, DK)^∨`, with no smoothness of `X` or `X_η`. If,
for the finite-field fibres of the model over a dense open of `A_0`, the Frobenius spectra of the right term and the upper
term are disjoint, then `H^i(X_s, K) → H^i(X_η̄, K)^I` is surjective for every integer `i`. When `K_0` is pure, Deligne's theorems that
proper direct images preserve purity and that compactly supported direct images do not increase weights (Weil II,
6.2.3, 6.2.6–6.2.7) give the separation, and the unconditional statement is Weil II, Théorème 6.2.9. *Proof sketch.* Spread all
maps along the model; use the Wang sequence of 7b.2 in hypercohomology and the support duality of EDC.1; apply the spectral
separation lemma at a closed point of the dense open; descend the surjectivity through the model realization. (Weil II,
Théorème 6.2.9 and its proof, pp. 248–249.) *Needs:* 7b.1, 7b.2, 7b.5 (separation lemma), 7b.7; EtaleDualityAndPerverseSheaves
Layer EDC.1.

**Checks.**

- For constant coefficients on a smooth total space this is 7b.5 after choosing a model.
- The statement allows complexes with several nonzero cohomology sheaves, not only lisse sheaves.

### 7b.9 Support bounds and weak Lefschetz

**Lemma (affine vanishing from a dual support bound).** Let `X ⊂ P^N` be projective over `k`, `K ∈ D^b_c(X, ℚ_ℓ)`, `n ∈ ℤ`, and assume
`dim Supp ℋ^j(DK[−2n − 2]) ≤ n + 1 − j` for every `j` (`dim ∅ = −∞`), equivalently `dim Supp ℋ^q(DK) ≤ −n − 1 − q`. Then for every hyperplane
complement `A = X − Y`, which is affine, `H^i_c(A, K) = 0` for `i ≤ n`. Neither smoothness of `X` nor purity of `K` is assumed. Define
`InvariantCycles.dualSupportAffineVanishing`. *Proof sketch.* Affine Artin vanishing for constructible sheaves
(`H^a(A, F) = 0` for `a > dim Supp F`, CohomologicalPointCounting/EtaleBaseChange Layer 6) applied to the cohomology sheaves of `DK` gives
`H^a(A, ℋ^q DK) = 0` for `a + q ≥ −n`, hence `H^{−i}(A, DK) = 0` for `i ≤ n`; duality `H^i_c(A, K)^∨ ≅ H^{−i}(A, DK)` concludes. (Weil II,
Proposition 6.2.11 and its proof, pp. 249–250; compare 4.1.6.) *Needs:* EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.1;
CohomologicalPointCounting/EtaleBaseChange Layer 6.

**Checks.**

- For X smooth of dimension n + 1 and K = ℚ_ℓ, DK[−2n − 2] = ℚ_ℓ(n + 1); the bound at j = 0 is n + 1, as required.
- Replacing n + 1 − j by n − 1 − j would wrongly exclude this case.

**Theorem (weak Lefschetz under a support bound).** Under the hypothesis of the lemma, for every hyperplane section `Y`,
singular ones included, restriction `H^i(X, K) → H^i(Y, K|_Y)` is an isomorphism for `i < n` and injective for `i = n`. For a sufficiently
general `Y`, generic local acyclicity gives `D_Y(K|_Y) = DK|_Y(−1)[−2]`, and the same bound holds on `Y` with `n` replaced by `n − 1`.
*Proof sketch.* The localization sequence of `A ⊂ X ⊃ Y` and the lemma; generic local acyclicity for the general section, keeping
its shifts; the support dimensions drop by one on a general hyperplane. (Weil II, Proposition 6.2.11(i) and the first two
paragraphs of its proof, pp. 249–250.) *Needs:* the lemma, 0.5; EtaleDualityAndPerverseSheaves Layers EDC.0 and EDC.1.

**Checks.**

- The boundary degree n is injective, not asserted surjective.
- The constant sheaf on a smooth projective (n + 1)-fold recovers ordinary weak Lefschetz.

### 7b.10 General pencils for complexes

**Comparison (monodromy on a general line).** Let `Z → P̌` be the full hyperplane incidence family of `X` and `K` as above, and
`U ⊂ P̌` a dense open over which all `R^j f_* q^*K` are lisse (generic lissity of constructible complexes). For a sufficiently
general line `D` and `u ∈ V = D ∩ U`, the images of `π_1(V, u)` and `π_1(U, u)` in `GL(H^j(Y_u, K))` agree, for each of the finitely many
relevant `j`, and so do their invariant subspaces. This is an equality of images, not an isomorphism of fundamental groups.
*Proof sketch.* Choose `U` by generic lissity (EDC.0); apply the Bertini theorem 5.1 to the finitely many lisse sheaves
`R^j f_*q^*K` on `U`; compare images and invariants with the same base points and paths. (Weil II, 6.2.10, formulas
(6.2.10.1)–(6.2.10.2), p. 249.) *Needs:* 3.2, 5.1; EtaleDualityAndPerverseSheaves Layer EDC.0; Mathlib
`Representation.invariants`.

**Checks.**

- The comparison is image equality, not a claim of isomorphism of fundamental groups.

**Lemma (local detection of the extension obstruction).** For `L ∈ D^+_c(P¹)` whose negative cohomology sheaves have finite
support, lisse outside a finite set `B`, and a point `t ∈ P¹`, the map `H^1(P¹ mod t, L) → ∏_{b∈B} H^1(P¹_{(b)} mod η_b, L)` is injective
(Weil II, Proposition 4.3.6). For the general pencil of `K` (the blow-up `X̃` of 3.3 with `f : X̃ → D`, pulled back from 7b.7), the
obstruction to extending a class from a fibre `Y_u` to `X` is a relative class on `P¹` built from the cone of the comparison
between pushforward and the axis, whose negative cohomology sheaves have finite support under the support bounds of 7b.9;
so the obstruction vanishes when all its local obstructions vanish. *Proof sketch.* Truncate `L` to `H^0` and `H^1` of a sheaf
without point-supported sections; a class killed at every `b ∈ B` defines a torsor extending over `P¹`, which is trivial
because `π_1(P¹ − B)` is the closed normal subgroup generated by the inertia groups at `B`: the quotient by that
subgroup classifies the finite étale covers of `P¹ − B` that are unramified at `B`, which extend by normalization to
finite étale covers of `P¹_k`, and these are trivial (`π_1(P¹_k) = 1`, 4.1; InverseGaloisAndArithmeticFundamentalGroups
Layer IG.1, §IG.1.2, for the tame quotients); apply this to the relative cone, using the support bounds
for the finite-support condition. The orthogonal decomposition of Weil II 4.3.9, which uses hard Lefschetz, is not used.
(Weil II, Proposition 4.3.6 and §§4.3.7–4.3.8, pp. 224–226; proof of 6.2.11.) *Needs:* 3.3, 7b.9;
EtaleDualityAndPerverseSheaves Layer EDC.0; InverseGaloisAndArithmeticFundamentalGroups Layer IG.1.

**Checks.**

- An invariant class extending over each singular neighbourhood has zero global obstruction.
- The argument uses Weil II 4.3.6–4.3.8 and not the orthogonal splitting of 4.3.9, which depends on hard Lefschetz.

**Theorem (ambient and pencil images).** For `K` with the dual support bound of 7b.9 and a sufficiently general pencil `D`, for
every `u ∈ D` the image of `H^n(X, K)` in `H^n(Y_u, K)` equals the image of `H^0(D, R^n f̃_*(i^*q^*K))`. No degeneration of Leray spectral
sequences, splitting into fixed and vanishing parts, or hard Lefschetz is used. *Proof sketch.* Restriction from `X` gives a
global section of the pencil direct image; conversely a global section extends locally by definition, so its local
obstructions vanish, and the obstruction lemma gives an ambient lift; weak Lefschetz on the general fibres and axis places
the obstruction in the finite-support range. (Weil II, Proposition 6.2.11(ii) and its proof; 4.3.7–4.3.8.) *Needs:* 3.3, the
obstruction lemma, 7b.9.

**Checks.**

- The equality is of images, including at singular fibres Y_u; only the injectivity in the middle degree from the support-bound weak Lefschetz theorem is used.

### 7b.11 The global invariant-cycle theorem

**Theorem (conditional form).** Let `X ⊂ P^N` be projective over `k`, `K ∈ D^b_c(X, ℚ̄_ℓ)`, `n ∈ ℤ` with
`dim Supp ℋ^j(DK[−2n − 2]) ≤ n + 1 − j` for all `j`, and `U ⊂ P̌` as in 7b.10. Let `D` be a sufficiently general line, `V = D ∩ U`, and assume
that at every point `b ∈ D − V` the local specialization `H^n(Y_b, K) → H^n(Y_{η̄_b}, K)^{I_b}` of the pencil pullback is surjective. Then,
for `u ∈ V`, restriction is an isomorphism `H^n(X, K) ≅ H^n(Y_u, K)^{π_1(U, u)}`; the isomorphism is the corestricted restriction map, not
an abstract isomorphism of vector spaces. When `K` is potentially pure (7b.7), the local hypothesis is 7b.8 applied to the
pulled-back models of 7b.7, with Deligne's weight theorems; the unconditional statement is Weil II, Corollaire 6.2.12.
*Proof sketch.* Injectivity is weak Lefschetz (7b.9). For surjectivity, a `π_1(U, u)`-invariant class is `π_1(V, u)`-invariant (7b.10),
hence a global section of the pencil direct image over `V`; local surjectivity at the points of `D − V` extends it to a section over
`D`; image equality (7b.10) lifts it to `H^n(X, K)`. No decomposition `E ⊕ E^⊥` is used. (Weil II, Corollaire 6.2.12 and its proof,
p. 250.) *Needs:* 7b.1, 7b.7, 7b.9, 7b.10.

**Checks.**

- The exported isomorphism is the corestricted restriction map.
- For `K = ℚ_ℓ` on a smooth projective `X` of dimension `n + 1`, `DK[−2n − 2] = ℚ_ℓ(n + 1)` and the bound at `j = 0` is `n + 1`, as
  required; the theorem then identifies `H^n(X)` with the monodromy invariants of the middle cohomology of a general
  hyperplane section, once the local surjectivity holds (by 7b.5, when its spectral hypothesis is supplied).
- The support bound cannot be weakened to `n − 1 − j`: that excludes the constant sheaf of the previous check.

### Dependencies

Layers LPV.0, LPV.1, LPV.3, LPV.5 and LPV.7a; ArithmeticGaloisDuality Layers R02.1 and R02.2;
InverseGaloisAndArithmeticFundamentalGroups Layer IG.1; EtaleDualityAndPerverseSheaves Layers EDC.0, EDC.1, EDC.2 and
EDC.4; SchemeAndStackFoundations Layer 0; CohomologicalPointCounting/EtaleBaseChange Layers 4–5; ComplexComparisonPartII
Layer C5; Completed HodgeStructures (layer L2) and Tau Ceti `TauCeti.Hodge.MixedHodgeStructure`; Mathlib (`Representation.invariants`,
`LinearMap.codRestrict`, generalized eigenspaces, scheme morphism classes).

## Downstream consumers

- **DeligneWeightsAndPurity** uses the pencil theory for Deligne's proofs: the vanishing subspace and its radical
  quotient (4.2, 4.4) and their descent to finite fields (3.5) for the rational local factors of a pencil; the
  middle-degree reduction (5.5), the Kazhdan–Margulis theorem (5.8) and the blow-up formulas (4.5) for the dimension
  induction; the monodromy filtration and `N` (1.2–1.5) for weight–monodromy statements on curves; and the
  invariant-cycle theorems of Layer LPV.7b, whose hypotheses it discharges with the weight bounds of Weil II to obtain
  Weil II 3.6.1, 6.2.9 and 6.2.12 and hence hard Lefschetz.
- **WeightsInEtaleCohomology** and **WeilConjectures** use the local Picard–Lefschetz formula, the existence of
  pencils and the semistable calculations of Layer LPV.7a.
- **ClassicalAdicEtaleCohomology** compares the nearby cycles of 0.5 with adic nearby cycles (Layer 4, §4.5).
- **IgusaVarietiesAndTorsionConcentration** uses the tower criterion of 6.5 for the semiperversity of Igusa towers and the
  semisimple trace of 1.10.
- **EndoscopicTransferAndUnitaryTraceComparison** uses nearby-cycle duality and perversity (6.1–6.2).
- **AutomorphicGaloisRepresentations** uses the specialization sequence of a proper curve (0.6, 7a.2) for Carayol's
  vanishing-cycle filtration; the semisimple trace of 1.10 is the one used for local models of Shimura varieties.

## References

- [SGA 7 II] P. Deligne, N. Katz, *Groupes de monodromie en géométrie algébrique (SGA 7 II)*, Lecture Notes in Math. 340,
  Springer, 1973; Exposés XII, XIII, XV (Deligne), XVII, XVIII (Katz). Scan:
  https://publications.ias.edu/sites/default/files/Number12.pdf
- [Weil I] P. Deligne, La conjecture de Weil. I, *Publ. Math. IHÉS* 43 (1974), 273–307.
  https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf
- [Weil II] P. Deligne, La conjecture de Weil. II, *Publ. Math. IHÉS* 52 (1980), 137–252.
  https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf
- [Illusie 1991] L. Illusie, Réalisation ℓ-adique de l'accouplement de monodromie, d'après A. Grothendieck,
  *Astérisque* 196–197 (1991), 27–44. https://www.numdam.org/item/AST_1991__196-197__1_0.pdf
- [Illusie 1994] L. Illusie, Autour du théorème de monodromie locale, *Astérisque* 223 (1994), 9–57, with the author's
  errata sheet. https://www.numdam.org/item/AST_1994__223__9_0/ ;
  https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf
- [Illusie 2002] L. Illusie, Sur la formule de Picard–Lefschetz, in *Algebraic Geometry 2000, Azumino*, Adv. Stud. Pure
  Math. 36 (2002), 249–268, with the author's erratum. https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf
- [Illusie 2003] L. Illusie, Perversité et variation, *Manuscripta Math.* 112 (2003), 271–295.
- [Illusie 2006] L. Illusie, Vanishing cycles over general bases, lecture notes, December 2006.
  https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf
- [Illusie 2021] L. Illusie, Grothendieck and vanishing cycles, *Ann. Fac. Sci. Toulouse Math.* (6) 30 (2021), 83–115.
  https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf
- [ILO] L. Illusie, Y. Laszlo, F. Orgogozo (eds.), *Travaux de Gabber sur l'uniformisation locale et la cohomologie étale
  des schémas quasi-excellents*, Astérisque 363–364 (2014); Exposé XVI by J. Riou. https://arxiv.org/abs/1207.3648
- [Saito 2003] T. Saito, Weight spectral sequences and independence of ℓ, *J. Inst. Math. Jussieu* 2 (2003), 583–634;
  author manuscript of 9 June 2003 (numbering cited). https://www.ms.u-tokyo.ac.jp/~t-saito/pp/wmr2r.pdf
- [Haines–Ngô 2002] T. Haines, B. C. Ngô, Nearby cycles for local models of some Shimura varieties, *Compositio Math.* 133
  (2002), 117–150. https://math.uchicago.edu/~ngo/nearby-cycle.pdf
- [Kisin–Pappas 2018] M. Kisin, G. Pappas, Integral models of Shimura varieties with parahoric level structure, *Publ.
  Math. IHÉS* 128 (2018), 121–218. https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf
- [Caraiani–Scholze] A. Caraiani, P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura
  varieties, author manuscript. https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf
- [Huber 1996] R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30,
  Vieweg, 1996.
- [Schneider 2011] P. Schneider, *p-Adic Lie Groups*, Grundlehren der mathematischen Wissenschaften 344, Springer, 2011.
- [Qian 2023] L. Qian, Potential automorphy for `GL_n`, *Invent. Math.* 231 (2023). https://par.nsf.gov/servlets/purl/10388233
- [Fresán–Sabbah–Yu] J. Fresán, C. Sabbah, J.-D. Yu, Hodge theory of Kloosterman connections, arXiv:1810.06454.
- [Liu–Tian–Xiao–Zhang–Zhu 2022] Y. Liu, Y. Tian, L. Xiao, W. Zhang, X. Zhu, On the Beilinson–Bloch–Kato conjecture for
  Rankin–Selberg motives, *Invent. Math.* 228 (2022), 107–375. https://par.nsf.gov/servlets/purl/10323568
- [SGA 4] M. Artin, A. Grothendieck, J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas*, Lecture Notes in
  Math. 269, 270, 305, Springer, 1972–1973.
- [SGA 4½] P. Deligne, *Cohomologie étale*, Lecture Notes in Math. 569, Springer, 1977 ([Th. finitude]).
- [BBD] A. Beilinson, J. Bernstein, P. Deligne, Faisceaux pervers, *Astérisque* 100 (1982).
- [Jouanolou 1983] J.-P. Jouanolou, *Théorèmes de Bertini et applications*, Progress in Math. 42, Birkhäuser, 1983.
- [Stacks] The Stacks Project, https://stacks.math.columbia.edu (tags cited in the text).

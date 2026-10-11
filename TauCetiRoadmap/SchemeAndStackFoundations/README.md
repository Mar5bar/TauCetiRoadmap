# Roadmap: scheme, stack, cohomology and intersection foundations

**Summary.** This roadmap is the general algebraic geometry that the arithmetic roadmaps stand on:
relative Proj, henselian pairs and excellent rings; descent, algebraic spaces, torsors and algebraic
stacks; cohomology on the Zariski, Nisnevich, étale, fppf and pro-étale sites with coherent duality
and Brauer groups; curves, divisors and Picard functors; deformations, formal schemes,
algebraization and de Jong's alterations; and Chow groups with Chern classes, Riemann–Roch and the
Hodge index theorem. We want it because Mathlib provides schemes, their morphisms and much of the
abstract categorical infrastructure, but the stacks, site cohomology, duality and alterations needed
for Shimura varieties, moduli of curves and abelian varieties, Galois representations in étale
cohomology and the comparison theorems of p-adic Hodge theory still require substantial shared
development. Rather than let each arithmetic roadmap rebuild a private version, this roadmap fixes
one set of carriers and statements that the others import and cite.

The end theorems are the henselization of a pair with its universal property (Layer 0), Artin's
bootstrap theorem and the Keel–Mori theorem (Layer 1), coherent Grothendieck duality and the Brauer
class of an Azumaya algebra (Layer 2), the Picard torsors of a curve without a rational point (Layer
3), Schlessinger's theorem, Grothendieck's existence theorem, algebraization of compatible morphisms
and de Jong's alteration theorems (Layer 4), and Grothendieck–Riemann–Roch, the Hodge index theorem
and the Weil bound for curves over finite fields (Layer 5). Every object is defined on Mathlib's
`Scheme`; every theorem names its hypotheses.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-schemes-and-morphisms) | Schemes and morphisms | direct-image algebras and relative Proj, coherent extension and Hartogs, dimension theory and limits, henselization of pairs, catenary, Cohen–Macaulay, Nagata and excellent rings, perfect schemes and universal homeomorphisms, ideal-sheaf comparisons |
| [1](#layer-1-descent-algebraic-spaces-and-stacks) | Descent, algebraic spaces and stacks | fpqc/fppf descent, algebraic spaces, group spaces, groupoids, torsors and quotients, algebraic and Deligne–Mumford stacks, moduli spaces, Galois gerbs |
| [2](#layer-2-sites-and-scheme-cohomology) | Sites and scheme cohomology | site cohomology and torsors, quasi-coherent cohomology and supports, topology comparisons, the Nisnevich site, pro-étale foundations, coherent duality, Brauer groups, equivariant cohomology |
| [3](#layer-3-curves-divisors-and-picard-objects) | Curves, divisors and Picard objects | genus, degrees and duality for vector bundles on curves, Picard groups, groupoids, norms and torsors, Picard stacks and Abel maps |
| [4](#layer-4-deformations-formal-schemes-models-and-alterations) | Deformations, formal schemes, models and alterations | thickenings and lifting, deformation functors, hulls and obstruction theories, adic thickening systems and algebraization, modifications, stable pointed curves, alterations |
| 5 | Intersection theory and Riemann–Roch | Chow groups, pushforward and pullback, Chern classes, Gysin maps and intersection products, K-theoretic pushforward and Riemann–Roch, surfaces and the Weil bound |

```text
Mathlib schemes, Tau Ceti curves and models  →  Layer 0  →  Layer 1  →  Layer 2  →  Layer 3  →  Layer 4
                                                   Layer 2 (coherent duality), Layer 3, Layer 4 (blow-ups)  →  Layer 5
```

## Scope and ownership

**This roadmap owns** the shared scheme, space, site and coherent-sheaf foundations listed in the
table: relative Proj for arbitrary graded quasi-coherent algebras, extension of coherent modules,
henselization of pairs, the catenary, Cohen–Macaulay, Nagata and excellent packages, perfect
schemes, the ideal-sheaf comparison API, algebraic spaces with their small étale sites, group
spaces, groupoids, torsors and their classes, quotient predicates, algebraic stacks, moduli spaces,
Galois gerbs, functoriality of site cohomology, the comparison of the topologies of a scheme with
the coefficient sheaves `𝔾_a`, `𝔾_m`, `μ_n`, the Nisnevich site, the pro-étale foundations (replete
topoi, w-contractible covers, left-completeness), coherent Grothendieck duality, the Brauer group of
a scheme, equivariant sheaf cohomology, the curve and Picard theory no curve roadmap states, formal
deformation theory with elementary obstruction theories, adic thickening systems with existence and
algebraization, modifications, strict transforms and alterations, the moduli stack of stable pointed
curves, and intersection theory with a K-theoretic Riemann–Roch. Formal geometry uses chosen ideals
and level-preserving adic thickening systems; comparison with topologically locally ringed formal
schemes, independence of the ideal of definition, polarized algebraization and equivalences of
polarized systems are outside this scope. The geometric Chow groups are graded by dimension and
restricted to schemes locally of finite type over a fixed field; bases such as DVRs need a different
grading and are outside this API. The general cotangent-complex obstruction class of §4.6 uses
DerivedDeRhamCohomology's cotangent complex, and the non-affine Brauer comparison of §2.22 includes
the construction of the gerbe of local splittings.

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap states comparisons to
it and never a second carrier.

- Sheaves of modules, locally free sheaves, tensor, dual, determinant, symmetric and exterior
  powers, quasi-coherent algebras, relative Spec and graded algebras: Tau Ceti
  (`TauCeti.AlgebraicGeometry.QuasicoherentAlgebra`, `CategoryTheory.CommMon.relativeSpec`,
  `SheafOfModules.dual`) and [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) L0A–L2B.
  A locally free sheaf of rank `r` is AlgebraicVectorBundles L0B's `isFiniteLocallyFreeOfRank`.
- Relative Proj of finitely generated graded algebras, projective morphisms and relative ampleness,
  the relative dualising sheaf of Gorenstein curves, coherent curve theory, models and nodal local
  models over a DVR, prestable, semistable and stable families, blow-ups, strict transforms along
  blow-ups, intersection numbers on arithmetic surfaces, polarised descent:
  [StableReduction](../StableReduction/README.md) Layers 0–4 and 7–9. This roadmap states the
  general relative Proj, strict transforms along arbitrary modifications and the Noetherian nodal
  local structure, each with its comparison to StableReduction's special case.
- Group schemes in the convention `GrpObj (Over.mk f)`, finite locally free group schemes, affine
  invariant quotients (`TauCeti.AffineInvariantQuotient`), finite étale schemes and Galois sets,
  effective descent of affine and finite locally free schemes, Weil restriction, the relative
  Grassmannian, strict henselization and openness of the regular locus, `ArtinianTestAlgebra`,
  coarse schemes of finite quotients: [ModularCurves](../ModularCurves/README.md) 0B–0G, 4D, 7D, 9D.
- Line-bundle classes (`TauCeti.AlgebraicGeometry.LineBundleClass`), coherent cohomology of a proper
  curve with the genus, Riemann–Roch and Serre duality for line bundles, relative cohomology and
  base change, the Picard functor of a curve, the Jacobian, Abel–Jacobi and the Picard–Brauer
  obstruction: [JacobianChallenge](../JacobianChallenge/README.md) Layers A–F. The theorem on formal
  functions used by its Layer C is owned here (§4.9), with shared API
  `Scheme.Modules.Cohomology.formalFunctionsIso` in
  `TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`; JacobianChallenge's coherent
  finiteness and higher-direct-image theorems are its inputs and its Picard construction a consumer.
- Function fields, divisors, `L(D)`, the genus, Riemann–Roch, Hurwitz's formula and the dictionary
  with regular projective curves: [AlgebraicCurves](../AlgebraicCurves/README.md) Layers 0–12.
- Brauer groups of fields and `Br(K) ≅ H²(G_K, K^{s×})` (`TauCeti.brauerCohomologyEquiv`),
  continuous Galois cohomology, Hilbert 90 for fields, Kummer theory: Tau Ceti,
  [ClassFieldTheory](../ClassFieldTheory/README.md),
  [ProfiniteCohomology](../ProfiniteCohomology/README.md),
  [QuadraticFormInvariants](../QuadraticFormInvariants/README.md) 7B.
- Finite- and adic-coefficient étale cohomology (constructible sheaves, `μ_n` with `n` invertible,
  base change, Nagata compactification, `Rf_!`, the étale-to-pro-étale comparison, ℓ-adic
  realization, Frobenius, Artin comparison, trace formula): the CohomologicalPointCounting family.
  The boundary is by coefficient: this roadmap owns the sites, `𝔾_a`, `𝔾_m`, `μ_n` as sheaves, every
  `𝔾_m`-coefficient theorem and the theorems for arbitrary abelian sheaves. Edges: EllAdic
  Realization consumes §2.17; CompactSupport Layer 1's compactification is used in §2.19;
  FrobeniusGeometry Layer 1's absolute Frobenius defines §0.24's perfect schemes and its Layer 6
  consumes §0.23; TraceFormula Layer 8 consumes §§2.11 and 2.16; ConstructibleEtale Layer 6's
  roots-of-unity sheaf is compared with §2.9's `μ_n`.
- Néron models (NeronModelsAndSemistableAbelianVarieties); étale supports, the étale `f^!`, purity,
  perverse sheaves (EtaleDualityAndPerverseSheaves); banded gerbes, Picard schemes over general
  bases, characteristic-zero resolution (AlgebraicModuliForArithmeticGeometry); the full cotangent
  complex (DerivedDeRhamCohomology); Néron–Severi groups (AbelianSchemesAndArithmeticModuli);
  perfect-site quotient stacks (GeometricSatakeAndFusion). These import from this roadmap.

**Already stated or built elsewhere, cited not restated.** Relative Spec and its universal property
(`TauCeti.AlgebraicGeometry.relativeSpecAffineIso`, AlgebraicVectorBundles L1A–L2A); irreducibility
of connected locally Noetherian schemes with domain stalks
(`TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`); the Jacobson property
of finite-type algebras; `PerfectClosure`; effective descent of affine schemes (ModularCurves 0E);
affine finite quotients (`TauCeti.AffineInvariantQuotient`); the étale-to-pro- étale comparison
(EllAdicRealization); field Brauer groups (`TauCeti.subsingleton_brauerGroup_of_finite`); genus-one
points from degree-one divisors
(`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one`);
regular stalks of smooth schemes and of blown-up nodes (`isRegularLocalRing_stalk_of_smooth`,
`TauCeti.NodeAlgebra`); the rank-one degree and duality results (`InvertibleSheaf.eulerDegree`,
`classGroupToLineBundleClass`); the Hasse bound `WeierstrassCurve.hasse_bound`.

**Interfaces consumed by the arithmetic roadmaps.** (i) Cohomology is Mathlib's `Sheaf.H` on the
named site; the pro-étale ℓ-adic coefficient is `Scheme.ellAdicSheaf`; `Br′(X)` is the torsion of
`H²_ét(X, 𝔾_m)`, distinct from the Azumaya Brauer group until §2.22's comparison applies
(Bhatt–Scholze 2014, Def. 6.8.1, Lemma 6.8.2). (ii) Over `ℂ`, algebraic de Rham to Betti cohomology
(Grothendieck 1966, Thm. 1′) and finite-coefficient étale to Betti cohomology (SGA 4 XVI, Thm. 4.1)
are taken on Layer 2's sites; over `ℝ` the Galois-equivariant Betti groups carry the sign twist
(Benoist–Wittenberg 2020, §1.1; Benoist 2019, (1.1), (2.16)). (iii) For an adic space `A` with a map
of locally ringed spaces to a scheme `S`, `X, Y` locally of finite type over `S`, `f : X → Y`
proper, `Λ` torsion and `K ∈ D⁺(X_ét, Λ)`, the comparison `φ_Y^* Rf_* K → Rf^ad_* φ_X^* K` for `X^ad
= X ×_S A` is an isomorphism, including residue-characteristic torsion (Huber 1996, 3.7.1–3.7.2, pp.
225–226); the fibre products and site maps belong to the analytic roadmap, so this interface is
README-only; diamonds in characteristic `p` are separate (Scholze 2017, §§26–27). (iv) `R lim_n
RΓ_ét(X, ℤ/ℓⁿ)` is compared with pro-étale `ℤ_ℓ`-cohomology by derived completeness, and `lim H^q`
replaces `H^q R lim` only under stated `lim¹` vanishing (Bhatt–Scholze 2014, Def. 3.4.1, Prop.
3.4.2, Cor. 5.1.6). (v) Prismatic, crystalline and `A_inf` specializations (Bhatt–Scholze 2022, Thm.
1.8; Bhatt–Morrow–Scholze 2018, Thms. 14.3–14.5) and the `B_dR` comparison (Betts–Stix, Props.
3.19–3.21) are consumed with derived tensor products and Frobenius twists written out. (vi) Cycle
classes `cl^r : CH^r(X) → H^{2r}_ét(X, Λ(r))` for `X` smooth over a perfect field and `n` invertible
are defined by the ℓ-adic roadmaps on §§5.1, 5.6 (Milne LEC, §23, Thm. 23.4).

**Owned here for others.** Henselization of pairs (§0.12, `Henselization.algebra`), the catenary and
Cohen–Macaulay package (§§0.16–0.19), site-cohomology functoriality and étale cohomology of limits
(§§2.1, 2.15), the pro-étale foundations (§2.17), Picard torsors (§3.6), deformation functors and
Schlessinger's theorem (§§4.3–4.5), adic thickening systems and algebraization (§§4.7–4.10), Hilbert
and Quot schemes and Chow's lemma (§§4.12, 4.14), the moduli stack of stable pointed curves (§4.15),
de Jong's alterations (§§4.16–4.20), the theorem on formal functions (§4.9) and projective bundles
with the splitting principle (§5.4).

## Conventions

1. Rings are commutative with identity; the zero ring is allowed unless excluded. Schemes, morphisms
and opens are Mathlib's `Scheme`, `Scheme.Hom`, `Scheme.Opens` in a fixed universe `u`;
"Noetherian", "separated", "proper", "smooth" are hypotheses on the target that needs them.
2. Big sites are Mathlib's `zariskiTopology ≤ etaleTopology ≤ fppfTopology ≤ fpqcTopology`; small
sites are `X.Etale` with `Scheme.smallEtaleTopology` and `X.ProEt` with `Scheme.ProEt.topology`.
Cohomology is `Sheaf.H`, and for `O_X`-modules Tau Ceti's `Scheme.Modules.Cohomology`. Every
cohomological statement names its coefficient regime and never crosses regimes without a named
comparison.
3. Stacks are pseudofunctors with Mathlib's `IsStack`; representability is by schemes for presheaves
and by algebraic spaces for stacks; torsors are fppf torsors; actions are on the left; group objects
are `GrpObj` in `Over S` (schemes) and `Over h_S` (algebraic spaces).
4. The genus of a proper curve is `dim H¹(X, O_X)`; the degree of a locally free sheaf of rank `r`
is `χ(E) − r·χ(O_X)`. Thickenings are surjective closed immersions; modifications are proper
birational, alterations proper, dominant and generically finite. Chow groups are graded by the
dimension `Order.height x` of the closure of a point; `Order.coheight x` is codimension.
5. Names live under `TauCetiRoadmap.SchemeAndStackFoundations` in strand namespaces
(`Henselization`, `Excellence`, `Spaces`, `Groups`, `Nisnevich`, `Coherent`, `Brauer`, `Curve`,
`Formal`, `Chow`, …). `Suggested.lean` contains the key definitions and the headline theorems that
are statable at the pins; every other target is specified here, and is equally required.

## Exact supplier contracts

| Supplier | Declarations used |
|---|---|
| Mathlib schemes and morphisms | `Scheme`, `Spec`, `Proj`, `Proj.toSpecZero`, `Scheme.IdealSheafData`, `Scheme.Hom.normalization`, `Scheme.Hom.residueFieldMap`, `GeometricallyIntegral`, `Scheme.functionField`, morphism classes (`Flat`, `Smooth`, `Etale`, `IsProper`, `IsFinite`, `IsClosedImmersion`, …) |
| Mathlib sheaves and sites | `Scheme.Modules`, `SheafOfModules.IsQuasicoherent`, `SheafOfModules.free`, `Scheme.Modules.pullback`, `Scheme.fppfTopology`, `Scheme.smallEtaleTopology`, `Scheme.ProEt.topology`, `Sheaf.H`, `GrothendieckTopology.MayerVietorisSquare`, `Functor.relativelyRepresentable`, `MorphismProperty.presheaf`, `Pseudofunctor.IsStack`, `DerivedCategory`, `GrpObj`, `ModObj` |
| Mathlib algebra | `HenselianRing`, `Algebra.Etale`, `IsRegularRing`, `IsRegularLocalRing`, `RingTheory.Sequence.IsRegular`, `AdicCompletion`, `IsAdicComplete`, `localCohomology`, `IsAzumaya`, `AlgHom.mulLeftRight`, `Module.rankAtStalk`, `BrauerGroup`, `CommRing.Pic`, `PerfectClosure`, `Algebra.Extension.cotangentComplex` |
| Mathlib cycles | `AlgebraicCycle`, `Scheme.ord` |
| Tau Ceti | `Scheme.Modules.Cohomology`, `LineBundleClass`, `InvertibleSheaf`, `TauCeti.genericFiber`, `TauCeti.specialFiberι`, `TauCeti.FiniteDVRExtension`, `TauCeti.AlgebraicGeometry.PureRelativeDimension`, `TauCeti.NodeAlgebra`, `TauCeti.brauerCohomologyEquiv`, `TauCeti.AffineInvariantQuotient`, `CommHopfAlgCat.fppfQuotientSheaf`, `derivationToDualNumberEquivLift` |
| AlgebraicVectorBundles | `isFiniteLocallyFreeOfRank`, `totalSpaceScheme`, `GradedQuasicoherentAlgebra`, `gradedSymmetricAlgebra`, `determinant` |

## How to read the build

Layer 0 is scheme theory and commutative algebra on Mathlib's carriers. Layer 1 builds algebraic
spaces on the big fppf site, then group spaces, torsors, quotients and stacks. Layer 2's first half
(§§2.1–2.17) is site-theoretic and needs Layer 1 only for torsor classes; its second half
(§§2.18–2.23) is coherent and needs Layer 0's Cohen–Macaulay package. Layer 3 needs Layer 2's
Hilbert 90 and duality; Layer 4 needs Layers 0–3; Layer 5 needs Layer 0's relative Proj, Layer 2's
duality, Layer 3's degrees and Layer 4's blow-ups. Within a subsection, construct objects before the
comparisons that use them: groupoids before quotients, the Nisnevich site before topology
comparisons, homotopy invariance before refined Gysin maps.

## Layer 0: schemes and morphisms

The scheme-theoretic base, following the Stacks Project's chapters on constructions, morphisms and
commutative algebra. Mathlib provides schemes, quasi-coherent modules, gluing, fibre products and
the morphism classes; Tau Ceti and AlgebraicVectorBundles provide quasi-coherent algebras, the
relative spectrum and graded algebras. Layer 0 adds direct-image algebras and the general relative
Proj, extension of coherent sheaves and Hartogs, dimension and limit theory of morphisms locally of
finite type, henselization of pairs, the catenary, Cohen–Macaulay, Nagata and excellent packages,
perfect schemes, flat base change of annihilators and the ideal-sheaf comparison API.

**Conventions of this layer.** `S_aff` is Mathlib's `S.AffineZariskiSite`. Quasi-coherent algebras
are Tau Ceti's `QuasicoherentAlgebra`, graded ones AlgebraicVectorBundles L2A's
`GradedQuasicoherentAlgebra`, graded by `ℕ` with `O_S` in degree zero. Henselian pairs are Mathlib's
`HenselianRing R I`. Perfection is the colimit along Frobenius (`PerfectClosure`), never the inverse
limit. Strict henselization and the openness of the regular locus are ModularCurves 4D.

### 0.1 Quasi-coherent algebras as sheaves of algebras, and direct-image algebras

**Sheaf comparison and direct-image algebras.** For a quasi-coherent `O_S`-algebra `A`, the
coequifibered presheaf `U ↦ A(U)` on `S_aff` with the localisation maps generates `A` itself as a
sheaf of `O_S`-algebras, naturally in `A` (Stacks, Situation 27.3.1 (01LM), Lemma 27.3.2 (01LN)).
For `f : X → S` quasi-compact and quasi-separated, the direct image `f_* O_X` is a quasi-coherent
`O_S`-algebra, equal to AlgebraicVectorBundles L1A's affine functions for affine `f` and compatible
with flat base change (Stacks, Lemma 26.24.1 (01LC); quasi-coherence criterion §26.7 (01I6)).
Checks: for the open immersion `𝔸² ∖ {0} → 𝔸²` the direct image is `O_{𝔸²}` (Hartogs); for `⨿_{n ≥
0} Spec k → Spec k[t]`, `t ↦ n`, the direct image is quasi-coherent with global module `∏_n k`; for
`⨿_{n ≥ 1} Spec k[t]/(tⁿ) → Spec k[t]`, which is not quasi-compact, the global module `M = ∏
k[t]/(tⁿ)` has `M_t ≠ 0` while the sections over the empty preimage of `D(t)` vanish, so the direct
image is not quasi-coherent; for finitely many thickenings it is quasi-coherent.

### 0.2 Morphism properties of relative spectra and modules on them

**Relative spectra.** For `p : Spec_S(A) → S`, `p` is affine, and `p` is of finite type, of finite
presentation, finite, integral, a closed immersion iff `A` is respectively locally of finite type,
of finite presentation, finite, integral, a quotient of `O_S` (Stacks, Lemma 29.45.3 (01WI)).
Quasi-coherent `O_{Spec_S A}`-modules are equivalent to quasi-coherent `O_S`-modules with an
`A`-module structure, by `p_*` with quasi-inverse `G ↦ p^*G ⊗_{p^*A} O_{Spec_S A}` (Stacks, Lemma
29.11.7 (01SB)). Check: for `A = k[t]` over `Spec k`, ordinary `p^*p_*O` has module `A ⊗_k A` and
the nonzero element `t ⊗ 1 − 1 ⊗ t` is killed by multiplication, so the tensor over `p^*A` is
needed.

### 0.3 Proj, base change and the relative Proj

**Proj and base change.** For a graded `R`-algebra `A` and `R → R'`, `Proj (A ⊗_R R')` is the base
change of `Proj A` along `Spec R' → Spec R` (Stacks, Lemma 27.11.6 (01N2)). *Lean:*
`Proj.isPullback_baseChange`.

**The relative Proj.** For an `ℕ`-graded quasi-coherent algebra `A` with `A_0 = O_S`, construct
`relativeProj A → S` by gluing `Proj A(U)` over affine opens: separated, with invertible `O(n)` when
`A` is generated in degree one, equal to `Proj A(S)` over affine `S`, and compatible with arbitrary
base change (Stacks, Lemmas 27.15.2–27.15.4 (01NO–01NQ), 27.16.10 (01O3)). On finitely generated
algebras it agrees with StableReduction Layer 2's relative Proj, compatibly with `O(1)` and base
change. Checks: `O_S[T_0..T_n]` gives `ℙ^n_S`; `O_S` in degree zero gives the empty scheme; for
`O_S[T]` with `T` in degree two the result is `S` but `O(1)` is not invertible.

### 0.4 Direct images and extension of quasi-coherent and coherent modules

**Direct images and extension.** Quasi-coherent modules are closed under kernels, cokernels, images,
sums and colimits, and `f_*` preserves quasi-coherence for qcqs `f` (Stacks, §26.24 (01LA), Lemma
26.24.1 (01LC)). For a quasi-compact open immersion `j : U → X` into a qcqs scheme, every
quasi-coherent `F` on `U` is `j^*G` for quasi-coherent `G`, submodules extend, finite type extends
to finite type, and finite presentation to finite presentation when `X` is Noetherian or `F` is a
direct summand of a finite free module (Stacks, Lemmas 28.23.1–28.23.5 (01PE, 01PF, 01PI, 0G41)). On
a Noetherian scheme every coherent sheaf on an open, and every coherent subsheaf of a restriction,
extends coherently (EGA I 9.4.7); a locally free sheaf on an open extends to a coherent sheaf but
need not extend to a locally free one (§0.6).

### 0.5 Pseudo-coherent modules

**Pseudo-coherent modules and sheaves.** A module is pseudo-coherent if it has a resolution by
finite free modules in degrees `≥ 0` (Stacks, Definition 15.66.1 (064Q)); a module sheaf is
pseudo-coherent if it has such resolutions by finite free sheaves Zariski-locally. The sheaf
predicate is equivalent to quasi-coherence together with pseudo-coherence of the sections over every
affine open (Stacks, Lemmas 36.10.1–36.10.2 (08E4)): a condition on sections alone is not enough.
Pseudo-coherent modules are finitely presented (Lemma 15.66.4 (064T)); over a Noetherian ring
pseudo-coherent means finite (Lemma 15.66.17 (066E)); they satisfy two-out-of-three (Lemma 15.66.14
(066D)), flat base change and flat pullback. Checks: `k` over `k[ε]/(ε²)` is pseudo-coherent with a
periodic infinite resolution; `k[x_1, x_2, …]/(x_1, x_2, …)` is finite but not finitely presented,
hence not pseudo-coherent; for a DVR, extension by zero from the generic point has pseudo-coherent
sections on both affine opens (`0` and `K`) but is not pseudo-coherent, not being quasi-coherent.
*Lean:* `PseudoCoherence.IsPseudoCoherentModule`, `PseudoCoherence.IsPseudoCoherentSheaf`,
`PseudoCoherence.isPseudoCoherentSheaf_iff_affineOpens`, with the DVR example.

### 0.6 Reflexive sheaves, reflexive hulls and Hartogs

**Reflexive sheaves.** A coherent `F` on a locally Noetherian `X` is reflexive if `F → F^{∨∨}` (Tau
Ceti's `SheafOfModules.dual`) is an isomorphism (Stacks, Definition 31.13.1 (0AVU)); this is
affine-local, locally free sheaves are reflexive, and on a normal integral `X` duals are reflexive
and `F^{∨∨}` is the reflexive hull, an isomorphism where `F` is locally free, with its universal
property (Lemmas 31.13.2–31.13.8 (0AY0, 0AY2, 0AY3, 0AY4), Remark 31.13.9 (0EBH)). On a normal `X` a
reflexive sheaf on `U` whose complement has codimension `≥ 2` extends uniquely as `j_*F`, and for
coherent torsion-free `F`, locally free on such `U`, `F^{∨∨} = j_*(F|_U)` (Lemmas 31.13.11–31.13.14
(0EBI, 0EBJ, 0AY6, 0AY7)). **Hartogs:** if `depth F_x ≥ 2` along a closed `Z`, then `F(X) → F(X ∖
Z)` is an isomorphism (Lemma 31.5.11 (0E9I)). Checks: on `Spec k[t]`, `k[t] ⊕ k[t]/(t)` has double
dual `k[t]` but extension from `D(t)` gives `k[t, t⁻¹]` (torsion and codimension one); `ℤ/2` on
`Spec ℤ` has zero double dual; the ideal of the origin in `k[x, y]` is torsion-free with `I^{∨∨} = O
≠ I`; `Γ(𝔸² ∖ {0}, O) = k[x, y]` while `Γ(𝔸¹ ∖ {0}, O) = k[x, x⁻¹]`.

### 0.7 Local dimension and dimension theory of schemes of finite type over a field

**Local dimension.** `dim_x X` is the infimum of `topologicalKrullDim U` over open neighbourhoods,
in `WithBot ℕ∞` (Stacks, Definition 5.10.1 (0055)), with `dim_x X ≤ dim X` and `dim X = sup_x dim_x
X`. For `X` locally of finite type over `k`, `dim_x X` is the maximum of `trdeg_k κ(ξ)` over generic
points through `x`, `dim O_{X,x} + trdeg_k κ(x) = dim_x X`, and dimension is invariant under field
extension (Stacks, Lemmas 10.116.1–10.116.6 (00P0, 06RP, 00P1, 00P3, 00P4)). Irreducible components
of `X_{k'}` map onto those of `X`; geometric irreducibility is tested over `k^s` (Lemmas
33.8.3–33.8.16 (020J, 054Q, 038H, 04KX, 04KY, 054R)). For `f` locally of finite type, `x ↦ dim_x
X_{f(x)}` is upper semicontinuous, with open loci for `f` flat of finite presentation (Lemmas
29.29.3–29.29.6 (02FY, 02FZ, 0A3V, 02G0)); for dominant `f` of integral finite-type schemes, `dim_x
X_{f(x)} ≥ dim X − dim Y` with equality on a dense open (Lemma 33.20.4 (0B2L)). Checks: on
`Spec(k[s, t] × k[u])` the local dimension is `2` on the plane and `1` on the line; an isolated
point has local dimension `0`.

### 0.8 Flatness over Dedekind bases, spreading out, étale coordinates and quasi-sections

**Flatness over Dedekind bases.** A morphism `X → S` to a Dedekind scheme (integral, locally
Noetherian, normal, dimension `≤ 1`) with `X` reduced and every irreducible component of `X`
dominating `S` is flat (Stacks, Lemma 15.22.11 (0AUW)); it need not have pure relative dimension,
which is a separate hypothesis wherever used. Check: over `S = Spec k[t]`, `S ⊔ 𝔸¹_S → S` is flat
with dominating components, but every fibre has components of dimensions `0` and `1`. *Lean:*
`flat_over_dedekind`, with that example.

**Spreading out of fibre properties.** For `f : X → S` of finite presentation with `S` integral, if
the generic fibre is geometrically reduced (irreducible, integral, connected, normal, smooth) then
so are the fibres over a dense open, and these loci are constructible (Stacks, Lemmas 37.26.2,
37.26.4, 37.26.5 (0576, 0578, 0579)); for `f` proper flat of finite presentation the geometrically
reduced and geometrically integral loci are open (EGA IV₃, Theorem 12.2.4 (v), (viii), p. 183).
Fibre powers of a flat finitely presented morphism with geometrically irreducible fibres have
geometrically irreducible fibres (Stacks, Lemma 29.26.10 (01UA)).

**Étale coordinates, rational points and quasi-sections.** A morphism smooth of relative dimension
`d` at `x` is étale over `𝔸^d_S` near `x` (Stacks, Lemma 29.37.21 (054L)); a connected scheme smooth
over a field with a rational point is geometrically integral (Lemma 33.7.14 (04KV)). A smooth
surjection acquires a section after an étale surjective base change, and for `f` smooth at `x` with
`x` closed in its fibre and `κ(x)/κ(f(x))` separable there is an étale `S' → S`, a point `s'` over
`f(x)` with `κ(s') ≅ κ(x)`, and a section through `x` (Lemmas 37.38.5–37.38.6 (057G, 055U)). Checks:
the generic point of `𝔸¹_k` (not closed in its fibre) lies on no section over a finite étale
neighbourhood; a closed point with separable residue field `L` lies on a section after `Spec L →
Spec k`.

### 0.9 Limits of schemes, Noetherian approximation and spreading out

**Limits and approximation.** Cofiltered limits with affine transition maps exist and are computed
affine-locally, with `|lim X_i| = lim |X_i|` (Stacks, Lemmas 32.2.1–32.2.3 (01YW, 01YX, 01YZ));
every qcqs scheme is such a limit of schemes of finite presentation over `ℤ` (Lemmas 32.5.1–32.5.3,
Proposition 32.5.4 (01Z7–01ZA)); finitely presented schemes and morphisms over the limit descend to
a finite stage together with the properties flat, smooth, étale, proper, finite, closed or open
immersion, isomorphism (Proposition 32.6.1 (01ZC)); a finitely presented generic-fibre object with
one of these properties spreads out over a dense open (Lemma 32.10.1 (01ZM)). For `X → S` separated
of finite type over a Noetherian normal `S`, a point over the integral closure of `S` in a finite
extension that is defined over the function field of `S` is an `S`-point (Klevdal–Patrikis 2024,
Lemma 3.9, p. 21). Every `S`-morphism from `ℙ¹_S` to an affine `S`-scheme factors through `S`
(Stacks, Lemma 30.8.1 (01XT)).

### 0.10 Geometrically unibranch local rings and schemes

**Unibranch rings.** A local ring `A` is unibranch if `A_red` is a domain whose normalization is
local, and geometrically unibranch if moreover the residue extension of the normalization is purely
inseparable (Stacks, Definition 15.108.1 (0BPZ)); schemes are so at every stalk. Normal local
domains are geometrically unibranch; unibranchness is irreducibility of the henselization, geometric
unibranchness that of the strict henselization (ModularCurves 4D; Lemma 15.108.5); both are étale
local and invariant under separable field extension. Checks: the node `y² = x²(x + 1)` (char `≠ 2`)
is not unibranch; the cusp `y² = x³` is geometrically unibranch; `ℝ[x, y]/(x² + y²)` at the origin
is unibranch but not geometrically unibranch; fields are geometrically unibranch.

**Components of finite étale covers.** Over a locally Noetherian `X`, for `p : Y → X` finite étale,
every connected component of `Y` is open and closed and finite étale over `X` (Stacks, Lemmas
59.64.4 (03RV), 5.9.6 (04MF)); no unibranch hypothesis is needed for this finite statement. Check:
on `Spec` of the eventually constant `𝔽₂`-sequences (field stalks, geometrically unibranch, not
Noetherian), the point at infinity is a closed connected component that is not open, and its
inclusion is not étale; for a finite product of fields every coordinate component is clopen. *Lean:*
`unibranch_finite_components`, with the first example.

**Jacobian étale algebras.** For `f_1..f_r ∈ R[x_1..x_r]`, the localisation of `R[x]/(f)` at the
Jacobian determinant is étale and finitely presented over `R`; it is finite étale with degree
bounded by the product of the degrees only under the finiteness hypotheses of Couveignes 2019,
Theorem 1, p. 1, Proposition 2, p. 7. Check: `t x − 1` over `A[t]` gives `A[t, t⁻¹]`, étale and not
finite.

### 0.11 Descent along field extensions, absolute integral closure, unramified morphisms

**Field-extension descent.** For a `k`-scheme `X` and `k'/k`, `Γ(X_{k'}, O) = Γ(X, O) ⊗_k k'` for
qcqs `X`; closed subschemes and morphisms with descent data descend, the properties affine,
quasi-affine, separated, finite type, proper, smooth, étale descend, and Galois-invariant morphisms
descend for finite Galois `k'/k` (Stacks, Lemmas 35.23.1–35.23.16 (02KQ–02L1)).

**Absolute integral closure.** For integral `X`, `X^+` is the normalization of `X` in an algebraic
closure of its function field: integral over `X`, unique up to isomorphism, `Spec A^+` for affine `X
= Spec A` (Bhatt–Ma–Patakfalvi et al. 2020, Convention 4.1, p. 35).

**Unramified morphisms.** A morphism locally of finite type is unramified iff its fibres are
disjoint unions of spectra of finite separable extensions, iff `Ω_{X/Y} = 0`, iff the diagonal is an
open immersion; unramified morphisms are locally quasi-finite (Stacks, Lemmas 29.36.10–29.36.14
(02V5, 02G7, 02G8, 02GE, 02GF)).

### 0.12 Étale neighbourhoods and the henselization of a pair

**Henselization of a pair.** For an ideal `I ⊆ R`, an étale neighbourhood is an étale `R`-algebra
`B` with `R/I → B/IB` bijective; these form a filtered, essentially small full subcategory of
`CommAlgCat R` (closed under tensor products, with parallel maps equalized). The henselization `R^h`
is the colimit of a small model, with extended ideal `I^h = I R^h` (Stacks, Lemma 15.12.1). Stage
lemmas: elements of `I^h`, monic polynomials, units modulo `I^h` and simple roots modulo `I^h` come
from a stage; `R/I → R^h/I^h` is bijective and `I^h` lies in the Jacobson radical. Main theorem:
`(R^h, I^h)` is a henselian pair. Universal property: every ring map `R → S` to a henselian pair
`(S, J)` with `I ↦ J` factors uniquely through `R^h`; a henselian pair is its own henselization; for
local `R` it is the henselization of the local ring (Lemma 15.12.3 (0A03)). The proof uses étale
sections: a section of an étale algebra is cut out by an idempotent, and over a henselian pair a
section modulo `I` lifts uniquely (Lemmas 15.11.5–15.11.6). Morphisms of pairs induce maps of
henselizations, functorially and compatibly with the residue identification. Checks: for `(ℤ, (5))`,
`ℤ[1/2]` is a neighbourhood, while `ℤ[1/5]` (`ℤ/5 → 0`) and `ℤ × ℤ` (not surjective on `ℤ/5`) are
not; the unit ideal gives the zero ring, the zero ideal gives `R`; the induced map of `(ℤ, 0) →
(ℤ/5, 0)` is not injective. *Lean:* `Henselization.IsNeighbourhood`, `Henselization.algebra`,
`Henselization.extended`, `Henselization.henselian`, `Henselization.existsUnique_lift`,
`Henselization.fixed_of_henselian`, with the examples.

### 0.13 Ind-étale algebras and the properties of the henselization

**Ind-étale algebras.** An `R`-algebra is ind-étale if it is a small filtered colimit of étale
`R`-algebras; ind-étale algebras are flat with flat multiplication, closed under composition, base
change and localisation (Stacks, Lemma 10.39.3 (05UT)). The henselization is ind-étale and flat,
`R/Iⁿ ≅ R^h/(I^h)ⁿ` so the completions agree, for Noetherian `R` it is Noetherian and `R^h → R^∧` is
faithfully flat (Lemmas 15.12.2 (0AGU), 15.12.4 (0AGV)); it is recognised as the initial flat
ind-étale henselian `R`-algebra with the same quotient (Clausen–Mathew–Morrow 2021, Remark 3.19, p.
22); it commutes with filtered colimits and with integral base change (Lemmas 15.12.5 (0A04),
15.12.6 (0F0L)); the henselization at a prime and at a point is the colimit of étale neighbourhoods
with trivial residue extension (Lemmas 10.155.1 (04GN), 10.155.7 (04GV)), and `ℤ_{(p)}^h` is the
ring of algebraic elements of `ℤ_p`, different from `ℤ_p`. Checks: `ℤ_{(5)}` is ind-étale over `ℤ`;
`ℤ/2` (not flat) and `ℚ[T]` (nonzero `Ω`) are not.

### 0.14 Henselian pairs: characterisations, permanence, finite étale algebras, Elkik

**Henselian pairs.** `(R, I)` is henselian iff `I` lies in the Jacobson radical and simple roots of
monic polynomials lift, iff idempotents lift in finite algebras, iff étale algebras with a section
modulo `I` have a section, iff `(S, IS)` is henselian for integral `S` (Stacks, Lemma 15.11.6
(09XI)). Henselian pairs are stable under quotients, integral extensions, finite products, filtered
colimits and radicals; complete pairs are henselian; a henselian pair need not be local (Lemmas
15.11.2–15.11.16, Example 15.11.14). Base change is an equivalence from finite étale `R`-algebras to
finite étale `R/I`-algebras (Lemmas 15.13.1 (0D4A), 15.13.2 (09ZL)). Over a henselian local ring,
finite algebras are products of local rings and quasi-finite algebras split off a finite factor
(Lemma 10.153.3 (04GG)). Elkik: for a smooth `R`-algebra `A`, every map `A → R/I` lifts to `A → R`
(Lemma 15.13.3 (0H74)).

### 0.15 Néron–Popescu desingularization

**Popescu.** A regular ring map of Noetherian rings (§0.21) exhibits the target as a filtered
colimit of smooth algebras (`Algebra.Smooth`) (Stacks, Theorem 16.12.1 (07GC)), in particular
whenever it is flat with geometrically regular fibres.

### 0.16 Catenary and universally catenary rings

**Catenary rings.** `R` is catenary if between any primes `p ⊆ q` strict chains have bounded length
and all saturated chains have the same length (Stacks, Definition 10.105.1 (00NI)), with no
Noetherian hypothesis. For Noetherian `R` this is local, and catenarity passes to localisations and
quotients; Noetherian rings of dimension `≤ 1` are catenary (Lemmas 10.105.2–10.105.8 (02IH, 00NJ,
0AUN, 00NK, 0AUP)). `R` is universally catenary if it is Noetherian and every finite-type algebra is
catenary (Definition 10.105.3 (00NL)); it suffices to test polynomial rings, and the property passes
to finite-type algebras and localisations. Cohen–Macaulay rings are universally catenary (Lemma
10.105.9 (00NM)). Checks: fields, `ℤ` and the zero ring are catenary; Noetherian domains of
dimension `≤ 1` are universally catenary; Nagata's example (§0.22) is Noetherian and not catenary.
*Lean:* `Excellence.IsCatenary`.

### 0.17 Depth, Cohen–Macaulay modules and Serre's conditions

**Depth.** `depth_I M` is the supremum in `ℕ∞` of lengths of weakly `M`-regular sequences in `I`,
and `depth M := depth_m M` over a local ring, so the zero module has depth `⊤` (Stacks, Definition
10.68.1 (00LF)). For finite `M` over Noetherian local `R`: depth `⊤` iff `M = 0`, `depth M ≤ dim
Supp M`, depth `0` iff `m ∈ Ass M`, depth is the first nonvanishing `Ext^i(κ, M)`, drops by one
modulo a regular element, and is compatible with localisation and flat base change.

**Cohen–Macaulay modules and Serre's conditions.** A finite module over a Noetherian local ring is
Cohen–Macaulay if `M = 0` or `depth M = dim Supp M`; a Noetherian ring is Cohen–Macaulay if all its
localisations at maximal ideals are (Stacks, Definitions 10.103.1 (00N3), 10.103.8 (00NF), 10.103.12
(0AAH)); this localises, passes modulo regular elements and to polynomial rings, includes regular
rings, and gives unmixedness and `height p + dim R/p = dim R` (Lemmas 10.103.5–10.103.13). `(S_n)`:
`depth M_p ≥ min(n, dim Supp M_p)` at every prime; `(R_n)`: `R_p` regular for `height p ≤ n`
(Definition 10.157.1 (031P)). Cohen–Macaulay iff `(S_n)` for all `n`; `(S_1)` is "no embedded
primes"; reduced iff `(R_0) + (S_1)`; `(S_2)` gives Hartogs (Lemmas 10.157.2–10.157.5). Checks:
`depth κ = 0` in positive dimension; a DVR has depth one; `k[[x, y, z]]/(xz, yz)` satisfies `(S_1)`
and not `(S_2)`; `k[x, y]/(x², xy)` fails `(S_1)` and is not Cohen–Macaulay.

### 0.18 Scheme-theoretic support and Cohen–Macaulay schemes

**Support and Cohen–Macaulay schemes.** For finite-type quasi-coherent `F`, the support is closed,
`Ann(F)` is quasi-coherent and `V(Ann F)` is the smallest closed subscheme carrying `F` (Stacks,
Lemmas 29.5.1–29.5.4, Definition 29.5.5 (056I, 056J, 05JU, 05JV)). A coherent `F` on locally
Noetherian `X` is Cohen–Macaulay if its stalks are, and `X` is Cohen–Macaulay if `O_X` is
(Definition 28.8.1 (02IO)); this is stalkwise and affine-local, agrees with §0.17 on affine schemes,
and passes to open immersions and to schemes smooth over a Cohen–Macaulay base. Checks: `Spec k[x,
y]` is Cohen–Macaulay; `Spec k[x, y, z]/(xz, yz)` is not.

### 0.19 CM- and `(S_n)`-quasi-excellence

**CM-quasi-excellence.** A locally Noetherian `X` is CM-quasi-excellent if every formal fibre `Â ⊗_A
κ(p)` of every local ring (at every prime `p`) is Cohen–Macaulay and every integral closed subscheme
has a nonempty Cohen–Macaulay open; CM-excellent adds universal catenarity; `(S_n)`-quasi-
excellence uses `(S_n)` instead (Česnavičius 2021, Definition 1.2, p. 2; §2.8, pp. 6–7).
Quasi-excellent schemes are CM- and `(S_n)`-quasi-excellent (Example 1.3, p. 2; §2.10, p. 7).
Checks: the empty scheme qualifies for every `n`; `(S_0)`-quasi-excellence is local Noetherianity; a
nilpotent alone (`k[ε]/(ε²)` is Cohen–Macaulay) is not a negative example.

### 0.20 Japanese and Nagata rings

**Japanese and Nagata rings.** A domain is N-1 if its integral closure in its fraction field is
finite, and Japanese (N-2) if its integral closure in every finite extension of the fraction field
is finite, inseparable extensions included (Stacks, Definition 10.161.1 (032F)). In characteristic
zero N-1 and N-2 agree for Noetherian domains; it suffices to test purely inseparable extensions;
the property passes to localisations, finite extensions and polynomial rings; Dedekind domains of
characteristic zero are Japanese (Lemmas 10.161.3–10.161.13 (032G, 032L, 032I, 032M, 032N, 032O));
the N-1 local criterion is Lemma 10.161.15 (0333). A ring is universally Japanese if every
finite-type domain algebra is N-2, and Nagata if it is Noetherian and `R/p` is N-2 for every prime
(Definition 10.162.1 (032R)); for Noetherian rings the two agree, and Nagata passes to finite-type
algebras, localisations and quotients (Proposition 10.162.15–16 (0334, 0335), Lemmas
10.162.2–10.162.5). **Complete local rings:** a complete Noetherian local domain is Japanese, and a
complete Noetherian local ring is Nagata (Lemma 10.162.8 (032W)); these are the suppliers of finite
normalization in inseparable extensions used by IntegralHeckeAndGaloisDeterminants. Quasi-excellent
rings are Nagata (Lemma 15.53.5 (07QV)); the normalization of an integral Nagata scheme in a finite
extension of its function field is finite (Lemma 29.54.14 (0AVK)); an infinite product of fields is
not Nagata (Example 10.162.17 (09E1)). Checks: fields and `ℤ` are Japanese and Nagata; the zero ring
is Nagata; the DVR of §0.22 is N-1 and not N-2; the eventually constant `𝔽₂`-sequences form a
universally Japanese, non-Noetherian, hence non-Nagata ring; for `R = k[t_i², t_i³ | i ∈ ℕ]` the
normalization `k[t_i]` is not finite, so the countable polynomial ring surjecting onto `R` is not
universally Japanese, whereas finitely many cusps `k[t_1², t_1³, …, t_r², t_r³]` are N-1 with the
`2^r` square-free monomials as generators. *Lean:* `Ring.IsJapanese`, `Ring.IsNagata`,
`Ring.IsJapanese.of_complete_local`, `Ring.IsNagata.of_complete_local`, with fields and the
non-Noetherian `MvPolynomial ℕ ℚ` as examples.

### 0.21 Regular maps, G-rings, J-2 rings, excellent rings and schemes

**Excellence.** A `k`-algebra is geometrically regular if it is Noetherian and `L ⊗_k B` is regular
for every finite purely inseparable `L/k` (Stacks, Lemma 10.166.1, Definition 10.166.2),
equivalently for every finite `L/k`. A ring map is regular if flat with geometrically regular fibres
(Definition 15.42.1); regular maps preserve reducedness and normality, and for a local G-ring `A →
Â` is regular (Lemmas 15.43.1–15.43.4 (07QK, 0BFK, 0H7S, 0H7T)). The regular locus need not be open.
G-rings are Noetherian with regular formal fibres at every prime (Definition 15.51.1, Propositions
15.51.6, 15.51.12); J-2 rings are Noetherian with open regular locus for every finite-type algebra
(Definition 15.48.1 (3)); quasi-excellent means G and J-2, excellent adds universal catenarity
(Definition 15.53.1), stable under finite type and localisation (Lemma 15.53.2). Fields, `ℤ`,
characteristic-zero Dedekind domains, complete Noetherian local rings and their finite-type algebras
and localisations are excellent (Proposition 15.53.3 (07QW)). (Quasi-)excellent schemes are those
with (quasi-)excellent affine charts, equivalently all affine opens (Definition 29.20.1, Lemmas
29.20.4–29.20.5). Checks: `L = k(a^{1/p})` over imperfect `k` is regular but not geometrically
regular; `k ⋉ k` is flat over `k` with non-regular fibre, yet J-2, excellent and with empty regular
locus. *Lean:* `Excellence.GeometricallyRegular`, `Excellence.RegularAlgebraMap`,
`Excellence.regularLocus`, `Excellence.IsGRing`, `Excellence.IsJ2`,
`Excellence.IsQuasiExcellentRing`, `Excellence.IsExcellentRing`,
`Excellence.IsQuasiExcellentRing.isNagata`, with `ℤ` and complete local rings as examples.

### 0.22 Two counterexamples

**Counterexamples.** A characteristic-`p` DVR that is regular and universally catenary but not
Japanese (Stacks, Example 10.119.5 (00PB)), and Nagata's Noetherian local domain that is not
catenary (Stacks, §110.19 (02JE)), rejected by the predicates of §§0.16 and 0.20.

### 0.23 Universal homeomorphisms

**Universal homeomorphisms.** `f` is a universal homeomorphism if every base change is a
homeomorphism, Mathlib's `(topologically IsHomeomorph).universally` (Stacks, Definition 29.46.1
(04DD)); stable under base change and composition, including thickenings; `f` is one iff it is
integral, universally injective and surjective (Lemma 29.46.5 (04DF)). Checks: `Spec 𝔽_{p²} → Spec
𝔽_p` is a homeomorphism but not universal (its self-product has two points); the cusp normalization
is a universal homeomorphism; the node normalization (char `≠ 2`) is not. FrobeniusGeometry Layer 6
consumes this subsection.

### 0.24 Perfect schemes and perfection

**Perfect schemes.** An `𝔽_p`-scheme is perfect if its absolute Frobenius (FrobeniusGeometry Layer
1) is an isomorphism, equivalently its section rings are perfect (Bhatt–Scholze 2017, Definitions
3.1–3.2, p. 10); perfect schemes are reduced and closed under fibre products over perfect bases and
étale maps. The perfection `X^perf` is the limit along Frobenius, `Spec (PerfectClosure A p)` on
affines, perfect, with `X^perf → X` a universal homeomorphism; perfection is right adjoint to the
inclusion of perfect schemes and induces an equivalence of small étale sites (Theorem 3.7). A
morphism and its perfection are simultaneously quasi-compact, quasi-separated, affine, separated,
integral, universally closed, universal homeomorphisms (Lemma 3.4 (i)–(vii)); perfection preserves
closed and open immersions, étale and (faithfully) flat maps without converses (Lemma 3.4
(viii)–(xii)). Checks: `Spec 𝔽_p[ε]/(ε²) → Spec 𝔽_p` perfects to an isomorphism but is not an
immersion; `𝔸¹_{𝔽_p}` is not perfect and `(𝔸¹)^perf = Spec 𝔽_p[t^{1/p^∞}]`.

### 0.25 Perfectly finitely presented and perfectly proper morphisms

**Perfectly finitely presented and perfectly proper.** A map of perfect `𝔽_p`-algebras is pfp if it
is the perfection of a finitely presented one; a morphism of qcqs perfect schemes is pfp if it is so
affine-locally (Bhatt–Scholze 2017, Definition 3.10, Proposition 3.11, p. 12). Pfp is local, stable
under composition and base change, a limit of finitely presented maps on affines, and every pfp
morphism is the perfection of a finitely presented morphism (Proposition 3.13, p. 13). Perfectly
proper means pfp, separated and universally closed (Definition 3.14), equivalently some or every
finitely presented model is proper, and is characterised by the valuative criterion with perfect
valuation rings (Zhu 2017, Proposition A.20, p. 51). Checks: `(𝔽_p[t])^perf` is pfp, while the
perfection of the countable polynomial ring is not; `(ℙ¹)^perf` is perfectly proper and `(𝔸¹)^perf`
is not.

### 0.26 Perfectly smooth morphisms, Witt schemes and weakly normal schemes

**Perfectly smooth morphisms.** A morphism of perfect schemes is perfectly smooth of relative
dimension `d` at `x` if étale-locally it is étale over `V ×_{𝔽_p} (𝔸^d)^perf`; weakly perfectly
smooth if it is the perfection of a smooth morphism after étale base change (van Hoften 2024,
§2.1.2, Definition 2.1.9, pp. 8–11). Perfections of smooth maps are perfectly smooth, `d = 0` is
étale, the notion is stable under composition and base change; perfectly smooth maps are pfp, flat
and open with fibres of dimension `d`, and weakly perfectly smooth need not imply perfectly smooth
(Example 2.1.3). Checks: the perfection of a coordinate projection `𝔸² → 𝔸¹` is perfectly smooth of
dimension one; `Spec 𝔽_p → (𝔸¹)^perf` is not.

**Witt schemes and weak normality.** For perfect `X`, `W_n X` has space `|X|` and sheaf `W_n(O_X)`,
with `W_1 X = X` and `W_n(Spec 𝔽_p) = Spec ℤ/pⁿ` (Bhatt–Scholze 2017, §4, p. 15). A reduced scheme
of finite type over a perfect field is weakly normal if every finite birational universal
homeomorphism from a reduced scheme is an isomorphism (Zhu 2017, §A.2.1, p. 49), equivalently `O_X`
is closed under `p`-th roots in the normalization. A pfp perfect scheme has a unique weakly normal
finitely presented model with prescribed finitely generated generic fields, and morphisms descend
when their generic maps do (Proposition A.15). For a finite universal homeomorphism `Y → X` of
finite-type `𝔽_p`-schemes, a power of Frobenius factors through it (Bhatt–Scholze 2017, proof of
Proposition 11.41, p. 53). Checks: an elliptic curve with `j^p ≠ j` and its Frobenius twist have
isomorphic perfections and different `j`, so the generic-field data is needed; the cusp is not
weakly normal; the node (`p` odd) is.

### 0.27 Flat base change of annihilators and cokernels

**Annihilators under flat base change.** For `R → S` flat and `M` finite, `Ann_S(S ⊗_R M) = Ann_R(M)
S`, via finite intersections of kernels; the inclusion `⊆` holds without flatness (Stacks, Lemma
10.40.4). For a submodule `Q ⊆ M`, `S ⊗ (M/Q) ≅ (S ⊗ M)/(S ⊗ Q)` (Mathlib's `tensorQuotientEquiv`),
and for `f : M → N` of finite modules `S ⊗ coker f ≅ coker(S ⊗ f)` with `Ann(coker(S ⊗ f)) =
Ann(coker f) S` (Lemmas 10.40.4, 10.12.10). Checks: in `ℤ/4`, `Ann(2) = (2)`; along the non-flat
`ℤ/4 → ℤ/2` the element `2` has annihilator `(2)`, extending to zero, while its image `0` has
annihilator the unit ideal; for `ℤ → ℤ/2` and `f = 2`, injectivity does not survive base change.
*Lean:* `FlatAnnihilator.annihilator_flat_baseChange`, with the `ℤ/4 → ℤ/2` example.

### 0.28 Ideal sheaves: the quotient-comparison API

**Ideal-sheaf comparisons.** For `I : Y.IdealSheafData` and `f : X → Y`: for affine `f`, the pulled
back ideal on `f⁻¹U` is `I(U) Γ(X, f⁻¹U)` (Stacks, Lemma 26.17.6 (1)). Define the image-ideal
quotient presheaf `U ↦ Γ(X, f⁻¹U)/I(U)Γ(X, f⁻¹U)` on affine opens of `Y`, and the section-kernel
quotient presheaf `U ↦ Γ(X, U)/ker(Γ(X, U) → Γ(V(I), U ∩ V(I)))` on all opens (Stacks, Example
26.4.3), with the canonical comparisons to the sections of `(I.comap f).subscheme` (an isomorphism
for affine `f`), to the section-kernel quotient (always surjective, injective iff the extended ideal
is the restriction kernel, bijective for affine `f`), and from the sheafified section-kernel
quotient to `i_* O_{V(I)}` (an isomorphism). For `g` affine, the quotient presheaf of `f ≫ g` is the
composite of those of `g` and `f`, with unit and associativity laws, and the composite comparison is
carried by the three canonical maps. Checks: for two rational points of `ℙ¹_k`, the section-kernel
presheaf has global value `k` while `i_* O` has `k × k`, so sheafification is needed; for `𝔸² ∖ {0}
→ 𝔸²` and `I = (x, y)` the image quotient is `k` and the section-kernel quotient is `0`; `I = ⊤`
gives zero and `V(I) = ∅`.

### Examples

The henselization of `ℤ_{(p)}` is the algebraic `p`-adic integers (§0.13); `ℤ` and fields are
excellent, Nagata, universally catenary and Cohen–Macaulay (§§0.16–0.21); the cusp normalization is
a universal homeomorphism and the node normalization is not (§0.23); `(ℙ¹)^perf` is perfectly proper
and `(𝔸¹)^perf` is not (§0.25); Hartogs holds on `𝔸² ∖ {0}` and fails on `𝔸¹ ∖ {0}` (§0.6).

### Dependencies

Mathlib and Tau Ceti as listed; AlgebraicVectorBundles L0A–L2A (§§0.1–0.3); StableReduction Layer 2
(§0.3); JacobianChallenge Layer B (§§0.4–0.6); ModularCurves 4D (§0.10); FrobeniusGeometry Layer 1
(§§0.24–0.26). No later layer.

## Layer 1: descent, algebraic spaces and stacks

Descent and the two-categorical geometry built on it. Mathlib supplies the fpqc, fppf and étale
topologies, pseudofunctor descent (`DescentData`, `IsStack`), relative representability and
comonadicity of extension of scalars along faithfully flat maps; Tau Ceti supplies fppf quotients of
affine groups and faithfully flat descent of Hopf-algebra points; ModularCurves 0E supplies
effective descent of affine and finite locally free schemes. Layer 1 builds fpqc descent of
quasi-coherent modules, algebraic spaces with quotients, points, étale-local properties and small
étale sites, group spaces, groupoids, torsors, quotients and Artin's bootstrap, stacks in groupoids,
algebraic and Deligne–Mumford stacks, quotient and root stacks, moduli spaces, Keel–Mori, tame
stacks and Galois gerbs.

**Conventions of this layer.** Presheaves are functors `Scheme.{u}ᵒᵖ ⥤ Type u` (`SchemePresheaf`);
the universe replaces the Stacks Project's cardinal bound. Algebraic spaces over `S` are algebraic
spaces with a map to `h_S`. `Cat`-valued pseudofunctors on `LocallyDiscrete Scheme.{u}ᵒᵖ` are
`SchPseudofunctor`. A morphism of spaces or stacks is proper when separated, of finite type and
universally closed on the topological spaces of §1.7. Banded gerbes are
AlgebraicModuliForArithmeticGeometry's.

### 1.1 Descent of quasi-coherent modules and of sheaves

**Quasi-coherent descent.** The pseudofunctor `T ↦ QCoh(T)` with pullback (Stacks, Lemma 17.10.4
(01BG)) is a stack for `fpqcTopology`, by Mathlib's comonadicity in the affine case and gluing
(Proposition 35.5.2 (023T)); `U ↦ Sh(C/U)` and `U ↦ Sh(C/U, Ab)` are stacks on any site (Lemmas
7.26.1 (04TQ), 7.26.4 (04TR)). Checks: over `Spec R → Spec S` faithfully flat, descent data are the
comodules of Mathlib's `ModuleCat.Descent`; `QCoh(T)` is not a groupoid, so this is not a stack in
groupoids.

### 1.2 Fppf descent of quasi-finite morphisms and of algebraic spaces

**Fppf descent.** A map `F → h_S` from an fppf sheaf that is representable by separated locally
quasi-finite morphisms after base change to an fppf covering is so itself (Stacks, Lemma 37.57.1
(02W8)); an fppf sheaf that is fppf-locally an algebraic space is one (Lemmas 80.11.1 (04SK),
80.11.3 (0ADV)).

### 1.3 Representable diagonals, étale atlases and the algebraic-space predicate

**Algebraic spaces.** For `F : SchemePresheaf`, the diagonal is representable if it is relatively
representable for `yoneda`; `a : h_U → F` is an étale atlas if every base change to a scheme is an
étale surjective morphism; `F` is an algebraic space if it is an fppf sheaf with representable
diagonal and an étale atlas (Stacks, Definition 65.6.1 (025Y), Lemma 65.6.2). Every `h_X` has
representable diagonal, without quasi-separatedness; for an algebraic space every `h_X → F` is
representable and the diagonal is representable by locally quasi-finite separated monomorphisms;
atlases compose with étale surjections and pull back. Checks: no map from the empty scheme is an
atlas of `Spec k`; the constant presheaf `T ↦ Bool` is not a sheaf, hence not a space; the presheaf
quotient of `Spec L` by `Gal(L/K)` has representable diagonal and an atlas but is not an fppf sheaf.
*Lean:* `Spaces.RepresentableDiagonal`, `Spaces.EtaleAtlas`, `Spaces.IsAlgebraicSpace`.

### 1.4 The category of algebraic spaces

**The category.** `AlgSpace` is the full subcategory of algebraic spaces, with the fully faithful
embedding of schemes, terminal object `h_{Spec ℤ}`, initial object `h_∅`, and algebraic spaces over
`h_S` equivalent to the fppf sheaves on `Over S` satisfying the relative definition (Stacks,
Definition 65.6.1). Check: for quadratic Galois `K/ℚ` the `ℚ`-endomorphisms of `h_{Spec K}` are the
two Galois automorphisms. *Lean:* `Spaces.AlgSpace`.

### 1.5 Étale equivalence relations and the quotient sheaf

**Equivalence relations and quotient sheaves.** A pre-relation `j = (t, s) : R → U ×_S U` is an
equivalence relation if `j` is a monomorphism inducing equivalence relations on `T`-points, étale if
`s, t` are étale (Stacks, Definition 39.3.1 (022P)), with identity, inverse and composition
morphisms, restriction along étale `U' → U`, and the kernel pair of an atlas. The quotient sheaf
`U/R` is the fppf sheafification of the presheaf coequaliser (Definition 39.20.1 (02VG)), with its
universal property, `R = h_U ×_{U/R} h_U` for an equivalence relation (Lemma 39.20.3 (03C5)),
recognition of representable quotients (Lemma 39.20.6 (02VH)), and invariance under restriction
along an fppf covering, which requires an equivalence relation. Checks: the folded line `Δ ⊔ Γ` with
`Γ = {(x, −x) : x ≠ 0}` (char `≠ 2`) is an étale equivalence relation; `U × U` on `𝔸¹` is an
equivalence relation with non-étale projections; for `L/K` quadratic and `σ` the nontrivial
automorphism, `Spec L` has no `K`-point but its quotient sheaf does; for the empty pre-relation on
`Spec k` and the cover `Spec k ⊔ Spec k`, restriction changes the quotient; on affine `R`-schemes
the quotient of an affine group by a normal closed subgroup is Tau Ceti's
`CommHopfAlgCat.fppfQuotientSheaf`.

### 1.6 Quotients by étale equivalence relations and presentations

**Quotients and presentations.** For an étale equivalence relation on a scheme, `U/R` is an
algebraic space with étale atlas `h_U → U/R` and kernel pair `R` (Stacks, Theorem 65.10.5 (02WW),
Lemma 65.10.4 (0265)); every algebraic space with atlas `U` is `U/(U ×_F U)` (Lemma 65.9.1 (0262),
Definition 65.9.3 (0263)). Checks: `(U ⊔ U)` modulo the fold kernel pair is `h_U`; the folded line
is `𝔸¹/(Δ ⊔ Γ)`.

### 1.7 Points of an algebraic space

**Points.** `|F|` is the set of classes of maps from spectra of fields, identified when they factor
through a common field, topologised so that an étale atlas is a quotient map (Stacks, Definitions
66.4.1 (03BU), 66.4.7 (03BY), Lemma 66.4.8 (03BZ)); `|h_X| = |X|`, atlases are surjective and open
on points, open subspaces correspond to opens of `|F|`, and `|F ×_H G| → |F| ×_{|H|} |G|` is
surjective. Checks: `|h_{Spec L}|` is one point for `L/K` quadratic; the generic point of `𝔸¹_ℚ/ℤ`
(§1.12) is represented by no monomorphism from a field.

### 1.8 Fibre products and étale-local properties of morphisms

**Fibre products and étale-local properties.** Fibre products of algebraic spaces are algebraic
spaces, with chart products as atlases (Stacks, Lemmas 65.7.1 (02X0), 65.7.3 (02X2)), and schemes
preserve fibre products. For `P` étale local on source and target, `f : F → G` has `P` if some
square of atlases `U → F`, `V → G`, `h : U → V` has `P h` (Lemma 67.22.1 (03MJ), Definition 67.22.2
(04RD)); this is independent of the square, agrees with `P` on schemes and with
`MorphismProperty.presheaf P` for representable `f`, and is stable under composition and under base
change, where it applies to the specified second projection of the fibre product. Checks: lifting
two copies of `Spec k` to different components of `Spec k ⊔ Spec k` gives an empty chart product, so
charts must be taken over the base; closed immersion is not étale local on the source. *Lean:*
`Spaces.isAlgebraicSpace_pullback`, `Spaces.AlgSpace.pullbackObj`, `Spaces.AlgSpace.pullbackSnd`,
`Spaces.EtaleLocal`, `Spaces.EtaleLocal.baseChange`.

### 1.9 Separation and properness

**Separation and properness.** `f` is separated (quasi-separated, locally separated) if its
diagonal, representable by §1.8, is a closed immersion (quasi-compact, an immersion); quasi-compact
and universally closed are read on points after base change; proper means separated, locally of
finite type, quasi-compact and universally closed (Stacks, Definitions 67.4.2 (03HL), 67.9.2 (03HI),
67.40.1 (03ZM), 65.13.2 (02X5)). These agree with Mathlib's on schemes, (quasi-)separatedness has
the affine-chart criteria (Lemmas 66.3.3 (0AHR), 66.3.4 (0AHS)), and properness is stable under base
change and composition. Checks: the line with doubled origin and the folded line are quasi-separated
and not separated; `𝔸¹/ℤ` in characteristic zero is not quasi-separated.

### 1.10 The small étale site of an algebraic space

**Small étale sites.** `smallEtale F` has as objects algebraic spaces étale over `F` (spaces, not
schemes: pulling back `𝟙_G` along a nonschematic `F → G` gives `F`), with the étale topology and the
chart site of schemes étale over `F` having equivalent sheaf topoi; `V ↦ Γ(V, O_V)` is the structure
sheaf (Stacks, Definitions 66.18.1 (03ED), 66.18.2 (03G0), 66.21.2 (03G7)). For `F = h_X` this is
`X.Etale`, and slices are small étale sites. For any `f : F → G`, base change `V ↦ V ×_G F` is a
functor `smallEtale G ⥤ smallEtale F` that is continuous and preserves finite limits, giving the
morphism of ringed topoi, with identity and composition isomorphisms (Lemma 66.18.8 (03G2)); it is
not cocontinuous in general. For étale `f`, composition `(U → F) ↦ (U → F → G)` is a separate
functor `smallEtale F ⥤ smallEtale G` in the opposite direction, continuous and cocontinuous in the
covering-refinement sense (Definition 7.20.1 (00XJ)), realising the same geometric morphism through
localisation (Lemma 66.18.11 (03LP)). Direct images use base change: `(f_* A)(V) = A(V ×_G F)`.
Checks: for the fold `T = S ⊔ S → S`, `S = Spec k`, base change is continuous and preserves finite
limits but is not cocontinuous, since a family refining the component cover of `T` consists of empty
schemes; base change followed by composition sends `S → S` to `T → S`, so the two functors differ;
`Γ(h_{Spec R}, O) = R`; the folded line has global functions `k[x²]`. *Lean:* `Spaces.smallEtale`,
`Spaces.smallEtale_compose`.

### 1.11 Quasi-coherent modules on an algebraic space

**Quasi-coherent modules.** `QCoh F` is the full subcategory of quasi-coherent `O_F`-modules on
`(F_ét, O_F)` (Stacks, Definition 66.29.1 (03G9)), abelian, preserved by pullback, equal to
`QCoh(Y)` for `F = h_Y`, and for `F = U/R` equivalent to modules on `U` with descent data
(Proposition 66.32.1 (03M3)). Checks: for the folded line `Γ(X, O) = k[x²]`; on `h_{Spec ℤ}`, the
extension by zero from `Spec ℤ[1/2]` is an `O`-module that is not quasi-coherent.

### 1.12 Two algebraic spaces that are not schemes

**Non-schematic spaces.** The folded line `𝔸¹_k/(Δ ⊔ Γ)` (char `≠ 2`) is an algebraic space that is
not locally separated at the origin, hence not a scheme (Stacks, Example 65.14.1 (02Z1)); `𝔸¹_ℚ/ℤ`
by translation is an algebraic space whose generic point has no residue field and which is not
quasi-separated (Lemma 66.34.1 (071S), Example 65.14.8 (02Z7), Lemma 66.3.3 (0AHR)).

### 1.13 Group algebraic spaces and actions

**Group spaces and actions.** A group space over `S` is an object of `Over h_S` that is an algebraic
space with a `GrpObj` structure (Stacks, Definition 78.5.1 (043H)); actions are Mathlib's `ModObj`
(Definition 78.8.1 (043Q)); an action is free if `g·x = x` on `T`-points forces `g = 1` (Definition
78.8.2), equivalently `(a, pr₂) : G × X → X × X` is a monomorphism (Lemma 78.8.3 (06P9)). Actions
base change; actions of Tau Ceti's constant group scheme `Γ_S` are homomorphisms `Γ → Aut X`. The
faithful functor from ModularCurves 0B's group schemes `Grp (Over S)` to `Grp (Over h_S)` is
`Over.post yoneda` on underlying objects. Checks: left translation is free; scaling of `𝔾_m` on `𝔸¹`
is not (every `c ≠ 1` fixes `0`); `𝔾_{m,S}` has points `Γ(T, O)^×` over a specified `T → S`. *Lean:*
`Groups.GroupSpace`, `Groups.Action`, `Groups.act`, `Groups.Action.IsFree`,
`Groups.Action.free_iff_mono`.

### 1.14 Groupoids in algebraic spaces and stabilizers

**Groupoids and stabilizers.** A groupoid `(U, R, s, t, c, e, i)` in algebraic spaces has identity
`e` and inverse `i` as data satisfying the endpoint, associativity, unit and inverse laws as
equalities of morphisms (Stacks, Definition 78.11.1 (043W)); existence clauses alone would admit the
monoid `{1, z}` with `z² = z ≠ 1` on a two-point scheme, which has no inverse. Identity and inverse
are unique, the inverse is an involution; action groupoids, equivalence relations, restrictions and
the prestack of `T`-points give groupoids. The stabilizer is `R ×_{U × U} U` over `U` (Definition
78.16.2 (0448)), a group space whose `T`-points are the arrows with `s = t`; an action is free iff
the stabilizer of its action groupoid is `U`. Checks: with arrows written `(target, source)`, `c(r,
i(r))` is the target identity; scaling of `𝔾_m` on `𝔸¹` has stabilizer `Spec k[x, λ^{±1}]/((λ −
1)x)`; `μ_p` on `𝔸¹` in characteristic `p` has the nonreduced one-point stabilizer `Spec k[λ]/((λ −
1)^p)` at the origin.

### 1.15 Torsors, torsor classes and the multiplicative group

**Torsors.** For a group space `G` over `S`, a `G`-torsor is an algebraic space `P` over `h_S` with
an action such that `(a, pr₂) : G × P → P × P` is an isomorphism and `P` has sections fppf-locally
on `S` (Stacks, Definitions 78.9.1, 78.9.3 (04TY)). `G` acts on itself as the trivial torsor, a
torsor is trivial iff it has a section, equivariant maps of torsors are isomorphisms, torsors base
change, and flatness of `G` gives étale-local flatness of `P`. **Representability:** an fppf sheaf
with a pseudo-torsor action that is trivial over an fppf covering, with no algebraicity assumed, is
an algebraic space and a torsor (Stacks, Lemma 80.11.1 (04SK); Poonen 2017, Theorem 6.5.10 (i)). The
set of torsor classes is `NonabelianH1` of the big fppf site over `S` with coefficients `h_G`
(§2.3), pointed by the trivial torsor; every torsor sheaf is geometric by representability, and
classes push forward along homomorphisms (Poonen 2017, §5.12.4, Proposition 5.12.14; Proposition
6.5.9). The multiplicative group space `𝔾_{m,S}` has relative points `Γ(T, O)^×` as a group,
naturally (Stacks, Example 39.5.1); the frame torsor gives a bijection from `𝔾_m`-torsor classes to
`LineBundleClass S`, base point to `O_S`, through Hilbert 90 (§2.11), with inverse the contracted
product with `𝔸¹` (Theorem 59.24.1 (03P8)). Checks: Frobenius `𝔾_m → 𝔾_m` in characteristic `p` is a
`μ_p`-torsor over `𝔾_m` that is not étale-locally trivial, while its fibre over `t = 1` is
nonreduced and trivial; the twisted action `x · g = x F(g)` on a positive-dimensional group fails
the pseudo-torsor clause (Poonen, Warning 5.12.6); the empty space is not a torsor over a nonempty
base; `Spec L → Spec K` is a nontrivial `(ℤ/2)_K`-torsor; `torsorClasses (μ_2 / ℚ) ≅ ℚ^×/(ℚ^×)²` and
`torsorClasses (𝔾_m / ℙ¹_k) ≅ ℤ`, whereas the trivial group gives a point and a single covering's
Čech set is too small. *Lean:* `Groups.IsTorsor`, `Groups.Torsor.trivial_iff_section`,
`Groups.torsorRepresentability`.

### 1.16 Contracted products and twisting

**Twisting.** For a torsor `P` and a `G`-space `X`, `P ×^G X := (P × X)/G` (§1.5) is an algebraic
space, `G ×^G X ≅ X`, compatible with base change; inner forms `P ×^G G` are group spaces, and
pushforward of torsors along `G → H` is `P ×^G H` (Poonen 2017, §§5.12.5.2, 6.5.6). Twisting by a
torsor `E` is a bijection from classes of the inner form to classes of `G`, sending the base point
to `[E]`, and classifies forms (Theorem 4.5.2, §§5.12.5.1, 6.5.6.4). Checks: the frame torsor of a
line bundle twisted by `𝔸¹` is its total space; `Spec L ×^{ℤ/2} Spec L = Spec K ⊔ Spec K`, which
needs sheafification.

### 1.17 Categorical and geometric quotients, and Artin's bootstrap

**Quotients.** For a pre-relation `s, t : R → U` of algebraic spaces, `φ : U → X` is invariant if `s
≫ φ = t ≫ φ`, and a categorical quotient if every invariant map to an algebraic space factors
uniquely through it (Stacks, Definitions 83.3.1 (048E), 83.4.1 (048J)). For a pre-equivalence
relation, `φ` is a geometric quotient if it is invariant, surjective, `R → U ×_X U` is surjective on
the points of the actual fibre product (orbits after field extension, not on `|U| ×_{|X|} |U|`), `φ`
is universally submersive, and `O_X → (φ_* O_U)^R` is an isomorphism, the invariants being the
equalizer of `s^♯, t^♯` on `X_ét` with direct images formed by base change (§1.10) (Stacks, §83.5,
Definitions 83.5.4, 83.8.1 (04A9), 83.10.1 (04AE)); arbitrary pre-relations use the generated
pre-equivalence relation (Lemma 83.5.6). A geometric quotient is not assumed to be a coequalizer.
Checks: for a finite group on `Spec A`, `Spec A → Spec A^Γ` is geometric (Tau Ceti's
`AffineInvariantQuotient`); `𝔸² → Spec k` is a categorical but not geometric quotient for scaling
and `𝔸² ∖ {0} → ℙ¹` is geometric; for `Spec k[ε]/(ε²) → Spec k` with the identity relation every
topological clause holds but the sheaf clause fails and it is not categorical; on `Spec ℚ(t)` the
translation relation `t ↦ t + n` has no geometric quotient to `Spec ℚ` although its invariants are
`ℚ`. *Lean:* `Groups.IsInvariant`, `Groups.IsCategoricalQuotient`.

**Artin's bootstrap.** An fppf sheaf `F` with a map `U → F` from an algebraic space that is
representable by algebraic spaces, flat, locally of finite presentation and fppf-locally surjective
is an algebraic space (Stacks, Theorem 80.10.1 (04S6), Lemmas 80.11.1 (04SK), 80.11.6 (06PG),
80.11.7 (06PH)). *Lean:* `Groups.artinBootstrap`.

### 1.18 Stacks in groupoids, stackification and 2-fibre products

**Stacks in groupoids.** A stack in groupoids is a `SchPseudofunctor` with groupoid fibres that is a
stack for `fppfTopology` (Stacks, Definitions 8.4.1 (026F), 8.5.1 (02ZI)), with 1-morphisms the
strong transformations, equivalences detected fibrewise, the stack of an fppf sheaf, the 2-Yoneda
lemma (Lemma 8.6.3 (0432)) and limits. Stackification of a prestack in groupoids has its universal
property and sheafifies `Isom` presheaves (Lemma 8.9.1 (02ZP)); 2-fibre products exist and agree
with fibre products of sheaves (Lemma 8.5.6 (02ZL); §4.31 (003O)). Checks: `T ↦ Hom(T, X)`; for flat
lfp `G`, `BG`; the quasi-coherent pseudofunctor is not in groupoids; the trivial `ℤ/2`-torsors over
`Spec ℝ` stackify to `B(ℤ/2)`; `pt ×_{BG} pt = G`. *Lean:* `Stacks.StackInGroupoids`.

### 1.19 Representable morphisms, algebraic stacks and Deligne–Mumford stacks

**Algebraic stacks.** A 1-morphism is representable by algebraic spaces if every `T ×_Y X` is an
algebraic space (Stacks, Definition 94.9.1 (02ZW)), with properties transported (§94.10 (03YJ));
stable under base change and composition, and the diagonal is representable iff every `T → X` is. A
stack is algebraic if its diagonal is representable and it has a smooth surjection from a scheme
(Definition 94.12.1 (026O), Lemma 94.14.3 (04T2)), Deligne–Mumford if moreover an étale one exists
(Definition 94.12.2 (03YO)), equivalently the diagonal is unramified (Theorem 101.21.6). Checks: `S
→ BG` is representable and `BG → S` is not for `G ≠ 1`; `B𝔾_m` is algebraic and not DM; `BG` for
finite constant `G` is DM; `Bμ_p` over `𝔽_p` is algebraic and not DM; `Spf k[[t]]` is not algebraic.

### 1.20 Inertia, the setoid criterion, properties of morphisms and presentations

**Inertia and presentations.** The inertia `X ×_{X × X} X` is representable, with automorphism
groups of objects (Stacks, §8.7 (036X), Lemmas 8.7.1–8.7.2); an algebraic stack with trivial inertia
is an algebraic space (Proposition 94.13.3 (04SZ)). Smooth-local properties are read on atlases
independently of choices; separated means proper diagonal, proper means separated, finite type and
universally closed (Definitions 101.4.1 (04YW), 101.13.2 (0513), 101.16.2 (06FN), 101.37.1 (0CL5)).
Every algebraic stack is `[U/R]` for a smooth groupoid, and such quotient stacks are algebraic
(Theorems 94.17.3 (04TK), 97.16.1 (06DC), 97.17.2 (06FI)). Checks: `I_{BG} = [G/G]`; `BG → S` is
proper for finite `G`; `B𝔾_m → Spec ℤ` is smooth of finite type but not separated.

### 1.21 Quotient stacks, line bundles with a section, root stacks

**Quotient and root stacks.** `[U/R]` and `[X/G]`, whose objects are `G_T`-torsors with equivariant
maps to `X`, with `X → [X/G]` a `G`-torsor (Stacks, Definition 78.20.1 (044Q), Lemmas 78.22.2
(04M9), 78.23.2 (044U), 78.26.1 (06PB)); `[U/R]` is algebraic for flat lfp groupoids and `[X/G]` is
DM iff stabilizers are unramified. `[𝔸¹/𝔾_m]` classifies line bundles with a section, and the root
stack of `(L, s)` of order `n ≥ 1` is `X ×_{[𝔸¹/𝔾_m]} [𝔸¹/𝔾_m]` along the `n`-th power, with charts
`[Spec A[t]/(tⁿ − s)/μ_n]`, an isomorphism away from `s = 0`, DM when `n` is invertible (Cadman
2005, §§2.1–2.2, Definitions 2.1–2.5, pp. 3–6). Checks: `B(ℤ/2)(ℝ)` has two classes; the fibre over
`s = 0` is `[Spec k[t]/(tⁿ)/μ_n]`; for `n = p` in characteristic `p` the root stack is not DM where
`s` vanishes.

### 1.22 Quasi-coherent modules on stacks

**Quasi-coherent modules on stacks.** Quasi-coherent modules on `(X_fppf, O_X)`, equivalently
compatible families with cocycles (Stacks, Definition 96.11.1 (06WG)); pullback, presentations by
descent data (Proposition 96.14.3 (06WT)), pushforward along qcqs morphisms, agreement with §1.11.
Checks: `QCoh(BG)` is comodules over `O(G)`; `π_* : QCoh(B(ℤ/p)) → Vect` over `𝔽_p` is not exact.

### 1.23 Moduli functors, fine and coarse moduli spaces, Keel–Mori, tame stacks

**Moduli spaces.** The moduli functor `T ↦ π₀ X(T)` and its sheafification; fine moduli spaces (an
algebraic space `M` with `h_M ≃ X`); categorical moduli spaces and coarse moduli spaces (categorical
and bijective on `k`-points for algebraically closed `k`), unique, with uniform formation under flat
base change (Stacks, Lemma 8.6.3 (0432); Definition 106.12.1, Lemmas 106.12.2–106.12.4 (0DUF)).
**Keel–Mori:** an algebraic stack locally of finite presentation over `S` with finite inertia has a
coarse moduli space `π : X → M`, proper and quasi-finite, `M` locally of finite presentation,
compatible with flat base change (Conrad 2005, Theorem 1.1, pp. 1–2; Lemmas 2.1–2.2, Remark 2.3).
For a finite group on `Spec A`, `Spec A^G` is the coarse space of `[Spec A/G]`. A stack with finite
inertia is tame if `ρ_*` on quasi-coherent modules is exact (Abramovich–Olsson–Vistoli 2008,
Definition 3.1); `BG` is tame iff `G` is linearly reductive (Tau Ceti's
`linearlyReductiveAffineGroupSchemeProperty`); tame stacks are étale-locally on the coarse space
quotients by linearly reductive groups, and tameness is stable under base change (Theorem 3.2,
Corollaries 3.3–3.5, Proposition 3.6). Checks: the moduli functor of `B(ℤ/2)` over `ℝ` is not a
sheaf; `BG` has no fine moduli space for nontrivial finite `G`; coarse spaces do not commute with
arbitrary base change (`[Spec ℤ[i]/(ℤ/2)]` at `2`); `[𝔸¹/𝔾_m]` has infinite inertia; `B(ℤ/p)` over
`𝔽_p` is not tame, `Bμ_p` is.

### 1.24 Semilinear automorphisms, Galois descent, conjugators and crossed modules

**Semilinear automorphisms.** For `k'/k` Galois and a linear algebraic group `H/k'`, a
`σ`-semilinear automorphism is a ring automorphism of `O(H)` that is `σ`-semilinear and Hopf (Kisin
2017, §3.1.1, pp. 34–35), inducing a semilinear bijection of `H(k')`, with the standard action for
`H = H_0 ⊗_k k'`.

**Galois descent.** For algebraic Galois `k'/k`, descent data on affine `k'`-schemes are continuous
semilinear actions on coordinate algebras: a homomorphism `Gal(k'/k) → RingAut A` with `ρ(σ)(c·a) =
σ(c)·ρ(σ)(a)` and open stabilizers of individual elements (joint continuity for the discrete
topology on `A`). Scalar extension gives such actions, finite Galois extensions impose no condition,
and the invariant algebra `A₀` has an equivariant isomorphism `k' ⊗_k A₀ ≅ A`, functorially; the
Hopf version descends Hopf operations (Milne, Algebraic Groups, A.64, pp. 580–581; Stacks §35.6
(0CDQ)). No single finite quotient need carry the whole action. Check: a character `χ` of
`Gal(ℚ̄/ℚ)` with non-open kernel acting on `ℚ̄[t, t⁻¹]` by `t ↦ t^{χ(σ)}` is semilinear but not
continuous and does not descend. *Lean:* `GaloisGerbs.ContinuousSemilinearAction`,
`GaloisGerbs.galois_descent_affine`, with that example.

**Crossed modules.** A crossed module `∂ : H̃ → H` with an `H`-action satisfying both Peiffer
identities (Kisin 2017, §3.2.1, pp. 39–40); its quotient groupoid has isomorphism classes `coker ∂`
and central automorphism groups `ker ∂`. Checks: `SL_2(ℂ) → PGL_2(ℂ)` has trivial classes and
automorphisms `μ_2`; the identity of `S_3` with trivial action violates the Peiffer identity.

### 1.25 Galois gerbs

**Galois gerbs.** A topological extension of a topological group by a discrete group has embedded
kernel and continuous quotient map; a local splitting chart is an open subgroup `U` with a
continuous section and a homeomorphism `N × U ≅ q⁻¹(U)`. For `k` of characteristic zero and `Γ =
Gal(k'/k)`, a Galois gerb is a topological extension `1 → H(k') → E → Γ → 1` with discrete kernel
whose conjugation by elements over `σ` is induced by `σ`-semilinear algebraic automorphisms,
witnessed on a splitting chart by a continuous semilinear coordinate action (§1.24) (Kisin 2017,
§§3.1.1–3.1.2, pp. 34–36); a bare topological extension is not a gerb. Gerbs have local charts,
neutral gerbs `H(k') ⋊ Γ`, base extension; morphisms are continuous homomorphisms over `𝟙_Γ` with an
algebraic kernel map; conjugacy is by `H'(k')`, with conjugators retained; pro-gerbs are compatible
systems. The conjugator functor `Isom(f_1, f_2)` is represented by a closed subscheme of `H'`, a
form of a centraliser (Lemma 3.1.2), and gerbs extend to larger splitting fields compatibly
(§3.1.2). Checks: the `C_4` extension of `Gal(ℂ/ℝ)` by `μ_2(ℂ)` is a non-neutral gerb with a chart
over the trivial subgroup but no continuous section over `C_2`; complex conjugation on the neutral
`𝔾_m`-gerb is not a morphism over `𝟙_Γ`; the Kottwitz protorus has character group `ℚ`; stagewise
conjugacy of pro-gerbs is not global conjugacy.

### Examples

The folded line and `𝔸¹/ℤ` separate algebraic spaces from schemes (§1.12); `B𝔾_m`, `Bμ_p` and
`B(ℤ/p)` over `𝔽_p` separate algebraic, Deligne–Mumford and tame (§§1.19, 1.23); `Spec L → Spec K`
is the standing nontrivial torsor (§1.15); the dual numbers separate geometric from topological
quotients (§1.17).

### Dependencies

Layer 0: §§0.12–0.14 (in §1.25), §0.21 (in §1.23). Layer 2: §2.3 (torsor classes) and §2.11 (Hilbert
90), used by §§1.15–1.16 only; §2.3 needs nothing from Layer 1. ModularCurves 0B–0E, 9D;
StableReduction Layer 2.

## Layer 2: sites and scheme cohomology

The cohomology layer. On top of Mathlib's `Sheaf.H` it provides functoriality of site cohomology,
spectral sequences, nonabelian `H¹` and boundaries, Godement resolutions and vanishing theorems;
quasi-coherent cohomology with supports, local cohomology and Cousin complexes; comparison of the
Zariski, Nisnevich, étale, fppf and pro-étale topologies with `𝔾_a`, `𝔾_m`, `μ_n`, Hilbert 90,
Kummer and Artin–Schreier sequences; the Nisnevich site; étale cohomology of fields, limits,
henselian pairs and curves for arbitrary abelian sheaves; the pro-étale foundations; coherent
Grothendieck duality; the Brauer group of a scheme; and equivariant cohomology.

**Conventions of this layer.** Étale abelian sheaves take values in `AddCommGrpCat.{u}`, pro-étale
ones in `AddCommGrpCat.{u+1}`. Complexes are cohomologically indexed. `D(O_X)` is Mathlib's
`DerivedCategory X.Modules` and `D_QCoh(O_X)` its subcategory with quasi-coherent cohomology; `f^!`
is defined on `D⁺_QCoh` for separated finite-type morphisms of Noetherian schemes.
Finite-coefficient étale cohomology is CohomologicalPointCounting's; affine acyclicity, Čech
computation and flat base change of coherent cohomology are JacobianChallenge's; the relative
dualising sheaf of curves is StableReduction Layer 2's.

### 2.1 Pullback and higher direct images on sites

**Pullback and higher direct images.** For a morphism of sites with exact inverse image `pb`, and a
specified comparison `ℤ_J → pb(ℤ_K)` of constant sheaves (canonical for a morphism of sites), define
`H^n(G) → H^n(pb G)`, restriction of sections in degree zero, natural, functorial and compatible
with connecting maps (Stacks, Lemmas 21.7.1–21.7.4 (01FU), 21.14.1 (072X)). Higher direct images are
the right derived functors of the pushforward, with `R⁰f_* = f_*`, `R^i f_*` the sheafification of
`V ↦ H^i(u(V), F)`, long exact sequences, and `R(g∘f)_* ≅ Rg_* Rf_*` on `D⁺` (Lemma 21.7.4 (072W)).
Checks: pullback `H¹(Spec ℝ, ℤ/2) → H¹(Spec ℂ, ℤ/2) = 0` is not injective; `R¹ id_* = 0`; over a
separably closed field global sections of `R^i f_* F` are `H^i(X_ét, F)`.

### 2.2 Leray and Čech spectral sequences

**Spectral sequences.** For a morphism of sites, `E_2^{p,q} = H^p(D, R^q f_* F) ⇒ H^{p+q}(C, F)`,
natural, with the relative form for composites and edge maps (Stacks, Lemmas 21.14.5, 21.14.7
(072X)); the Čech-to-cohomology spectral sequence of a covering and Leray's acyclicity theorem
(Lemmas 21.10.1–21.10.7 (03AV); Theorem 59.19.2 (03OW)), stated with Mathlib's spectral objects.
Check: for `𝔸² ∖ {0} → Spec k` and `F = O`, `E_2^{0,1} = H¹(O) ≠ 0` survives.

### 2.3 Torsors and the first cohomology: the carrier of torsor classes

**Nonabelian `H¹`.** For a sheaf of groups `G` on a site, a `G`-torsor is a locally nonempty sheaf
with a simply transitive left action (Stacks, Definition 21.4.1 (03AG)); `NonabelianH1 J G` is the
pointed set of their isomorphism classes, the one carrier of torsor classes of the roadmap (§§1.15,
3.6). It has the classes of torsors (the base point iff a global section exists), functoriality in
`G` by contracted product and along morphisms of sites, connecting maps for exact sequences of
sheaves of groups with the six-term exact sequence of pointed sets, and for abelian `G` a bijection
with `Sheaf.H G 1`, base point to `0`, compatible with these structures (Lemmas 21.4.2–21.4.3).
Checks: the trivial group gives a point; `ℤ/2` on `(Spec ℝ)_ét` gives two classes; `GL_n` on a local
scheme gives a point; for constant `S_3` over a field the classes are homomorphisms from the Galois
group up to conjugacy, which pointwise multiplication does not preserve.

### 2.4 Abelian-extension boundaries

**Boundaries.** For a short exact sequence of abelian sheaves, the boundary on torsor classes of
`E.X₃` is the comparison of §2.3 followed by Mathlib's `Sheaf.H.δ`; it vanishes exactly on classes
lifting to `H¹(E.X₂)` and is natural in the sequence (Stacks, §§21.3 (071J), 21.4 (03AG)). General
central extensions and banded-gerbe classification are outside this subsection (Lemma 21.11.1 (0CJZ)
needs extra vanishing). Checks: the trivial torsor maps to zero; split sequences have zero boundary.

### 2.5 Slice sites, Godement resolutions, flasque sheaves, Grothendieck vanishing, filtered colimits

**Vanishing and resolutions.** Cohomology on a slice site is cohomology of the object (Stacks, Lemma
21.7.1 (03F3); Mathlib's `cohomologyPresheafObjIsoOverH`). The Godement resolution of a sheaf on a
space is a flasque resolution computing `Sheaf.H`, exact and compatible with restriction (Lemmas
20.30.1–20.30.2 (0FKR)); flasque sheaves have vanishing higher Čech and sheaf cohomology (Lemmas
20.12.3–20.12.6 (09SV); Tau Ceti's `subsingleton_H_succ_of_isFlasque`). **Grothendieck vanishing:**
on a Noetherian space of dimension `≤ d`, `H^p(X, F) = 0` for every abelian sheaf and `p > d`
(Proposition 20.20.7 (02UZ)). On a coherent site cohomology commutes with filtered colimits (Lemma
21.16.1 (0737)). Checks: Godement terms on the Sierpiński space are flasque but not injective; on
`ℙ^d` the bound is sharp. *Lean:* `SiteCohomology.noetherianSpace_vanishing`.

### 2.6 Quasi-coherent cohomology

**Quasi-coherent cohomology.** For `f : X → S` qcqs and `F` quasi-coherent, `R^p f_* F` is
quasi-coherent, computed on affines, compatible with flat base change and filtered colimits; over an
affine base, `H^p(X, F)` vanishes for `p` beyond a bound depending only on `f` (Stacks, Lemmas
30.4.1–30.4.6 (01XH)). `H^q(ℙ^n_A, O(d))` is `Sym^d`, the dual module in degree `n`, zero otherwise
(Lemmas 30.8.1–30.8.3 (01XS)); Serre vanishing and finiteness for ample `L` on `X` proper over a
Noetherian ring (Lemma 30.17.1 (01XO)); `R^q f_* = 0` above the fibre dimension of a proper `f`
(Lemma 30.20.9 (02V7)); a quasi-compact scheme is affine iff `H¹` of quasi-coherent modules
(equivalently ideals) vanishes (Lemmas 30.3.1, 30.3.2, 30.3.4 (01XE)). Checks: for `⨿_n ℙⁿ_k → ⨿_n
Spec k` (qcqs map, base not quasi-compact) `Rⁿf_* O(−n−1) ≠ 0` for every `n`, so the uniform bound
needs an affine base; `H¹(ℙ¹, O(−2)) = k`; `H¹(𝔸² ∖ {0}, O) ≠ 0`. *Lean:*
`QCoh.higherDirectImage_vanishing`, `QCoh.isAffine_of_H1_vanishing`, with the non-affine coproduct
example.

### 2.7 Cohomology with supports and local cohomology

**Supports.** For closed `Z ⊆ X`, sections with support `ker(F(X) → F(X ∖ Z))`, the subsheaf
`H_Z(F)`, cohomology with supports `H^q_Z(X, F)` with its `O(X)`-module structure and the local
cohomology sheaves (Stacks, §20.21 (0A39)); `Z = X` gives `H^q`, `Z = ∅` gives `0`, `RH_Z` is right
adjoint to `i_*`, with the local-to-global spectral sequence and the localization triangle `RΓ_Z →
RΓ → RΓ(U) →` with excision (Lemmas 20.34.5–20.34.7 (0G6Y)).

**Comparison with Mathlib's local cohomology.** For a Noetherian ring `A`, ideal `I`, any `M` and
`q`, Mathlib's `localCohomology I q M = colim_n Ext^q(A/Iⁿ, M)` is the derived `I`-torsion functor
and equals `H^q_{V(I)}(Spec A, M~)` naturally and `A`-linearly (Stacks, Lemmas 47.8.2 (0954),
47.10.1 (0BJD), 51.2.1 (0A6T)); no comparison is asserted for non-Noetherian rings. For every ring,
degree zero is the `I`-power torsion. For flat `A → B` of Noetherian rings, `B ⊗_A H^q_I(M) ≅
H^q_{IB}(B ⊗_A M)`, with flat excision (Lemmas 47.10.3, 47.9.7). For finite `M` over Noetherian `A`,
`H^q_I(M) = 0` for `q < depth_I M` and is nonzero at `q = depth_I M` when that is finite (Lemmas
47.11.1, 47.11.3 (0AVY)). Checks: `H¹_{0}(𝔸¹, O) = k[t, t⁻¹]/k[t]` and `H⁰_{0} = 0 ≠ F(Z)`; for a
DVR `H¹_m(R) = K/R`; for `A = k[x_0, x_1, …]/(x_j^{j+2})`, `I = (x_j)`, geometric `H⁰ = A` but
native `H⁰_I(A) = 0`; the zero module has depth `⊤` and no nonvanishing degree. *Lean:*
`Supports.localCohomology_degreeZero`, `Supports.localCohomology_flat_baseChange`.

### 2.8 Cousin complexes

**Cousin complexes.** For a supplied finite descending filtration `X = Z_0 ⊇ ⋯ ⊇ Z_{r+1} = ∅` by
closed subschemes, the relative support sheaves of `U ↦ Γ_{Z_i ∖ Z_{i+1}}(U ∖ Z_{i+1}, F)` form the
Cousin complex with augmentation `F → Cous_Z(F)`, quasi-coherent for `X` Noetherian and `F`
quasi-coherent (Boxer–Calegari–Gee–Pilloni 2021, §3.9.5, pp. 63–64). For `X` Noetherian, `codim Z_i
≥ i`, affine morphisms `Z_i ∖ Z_{i+1} → X` and `F` maximal Cohen–Macaulay, the relative support
sheaves are concentrated in degree `i` and the augmentation is a quasi-isomorphism (Theorem 3.9.6,
p. 64); with affine strata, global sections compute `RΓ(X, F)` (Remark 3.9.7). The inputs are chosen
closed filtrations, not sets of points of given codimension. Checks: for a DVR, `Cous(O)` is `K →
K/R`; with an embedded point the augmentation is not a resolution; on `𝔸¹` the codimension-one
points form a dense non-closed set, while `𝔸¹ ⊇ V(t) ⊇ ∅` gives `k[t, t⁻¹] → k[t, t⁻¹]/k[t]`.

### 2.9 Big-site sheaves of quasi-coherent modules and the sheaves `𝔾_a`, `𝔾_m`, `μ_n`

**Big-site modules.** For quasi-coherent `F` on `S`, `F^a : (T, h) ↦ Γ(T, h^*F)` is a module over
the big structure sheaf `(T, h) ↦ Γ(T, O_T)` on the big fpqc site over `S` (a sheaf for every
coarser topology), right exact, exact on sequences with flat quotient, compatible with base change,
with `(O_S)^a` the unit (underlying `𝔾_a`), and fully faithful on O-linear maps (Stacks, Lemmas
35.8.1, 35.8.8 (03DR)). `𝔾_a`, `𝔾_m` and `μ_n` (`t^n = 1`, every `n ≥ 1`) are abelian sheaves on the
big fpqc site with restrictions to `X_ét`; `μ_n = ker(n : 𝔾_m → 𝔾_m)`, representable by `O_S[t]/(tⁿ
− 1)`, agreeing with ConstructibleEtale Layer 6's sheaf for `n` invertible (Stacks, §59.28 (03PK)).
Checks: Frobenius on `𝔽_p[t]` is additive but not `𝔽_p[t]`-linear, so it does not lift to big
modules; multiplication by `t` on `k[t]` pulls back to zero at `t = 0` (non-flat quotient);
`O^a(Spec ℚ(i)) = ℚ(i)`; `μ_p` over `𝔽_p` has trivial sections on reduced schemes and nontrivial
ones on `𝔽_p[ε]/(ε^p)`.

### 2.10 Comparison morphisms between the topologies of a scheme

**Topology comparisons.** The morphisms of topoi big fppf → big étale, `a_X` to `Sh(X_ét)`, étale →
Nisnevich → Zariski, coherent under composition and base change (Stacks, Lemmas 59.100.1–59.100.2
(0DDK)). For quasi-coherent `F`, `H^q(X_Zar, F) = H^q(X_ét, F^a) = H^q(X_fppf, F^a) = H^q(X_fpqc,
F^a)` (Proposition 35.9.3 (03DW)); `H^q(X_ét, F) = H^q_fppf(X, a_X^{-1} F)` for étale abelian `F`
(Lemmas 59.100.5–59.100.8); étale and fppf cohomology agree for smooth commutative group schemes
(Česnavičius 2018, §2, Proposition 2.3, Remark 2.7). Checks: `H¹_Zar(Spec ℝ, μ_2) = 0` but `H¹_ét =
ℤ/2`; over `𝔽_p[t, t⁻¹]`, `H¹_fppf(μ_p) ≠ 0 = H¹_ét(μ_p)`.

### 2.11 Hilbert 90, the Kummer and Artin–Schreier sequences, finite pushforward

**Hilbert 90 and Kummer.** For every scheme, `H¹(X_ét, 𝔾_m) ≅ LineBundleClass X` as groups, and the
Zariski, étale and fppf `H¹` of `𝔾_m` agree (Stacks, Theorem 59.24.1 (03P8)). For every `n ≥ 1` the
Kummer sequence `1 → μ_n → 𝔾_m → 𝔾_m → 1` is fppf-exact, giving `0 → Γ(X, O)^×/n → H¹_fppf(μ_n) →
Pic(X)[n] → 0` and `0 → Pic(X)/n → H²_fppf(μ_n) → Br′(X)[n] → 0` (Lemmas 59.28.1, 59.28.3, 59.28.5,
Remark 59.28.4 (03PK)); for `n` invertible it is étale-exact. **Artin–Schreier:** in characteristic
`p`, `0 → ℤ/p → 𝔾_a → 𝔾_a → 0` is étale-exact, so `H^q(X_ét, ℤ/p) = 0` for `q ≥ 2` on affine `X`,
and `cd_p ≤ dim + 1` (Lemmas 59.63.1–59.63.6 (0A3J)). For finite `f`, `f_*` is exact on étale
abelian sheaves with `R^q f_* = 0`, and integral `f_*` commutes with base change (Lemma 59.55.1,
Proposition 59.55.2 (03QN)). Checks: `H¹(Spec A, 𝔾_m) = CommRing.Pic A`; `H¹(ℙ¹, 𝔾_m) = ℤ`;
`H¹_fppf(Spec K, μ_n) = K^×/K^{×n}` including `n = p`; `H¹(Spec k, ℤ/p) = k/℘(k)`. *Lean:*
`Etale.constZMod`, `Etale.artinSchreier_vanishing`.

### 2.12 Nisnevich coverings and the Nisnevich topology

**The Nisnevich topology.** A family of étale maps is a Nisnevich covering if every point has a
preimage with trivial residue extension (`Scheme.Hom.residueFieldMap` bijective) (Morel–Voevodsky
1999, §3.1, Definition 1.2, pp. 95–96); the precoverage generates the big Nisnevich topology,
between the Zariski and étale topologies, subcanonical, stable under base change and composition,
and the small Nisnevich topology on `X.Etale`. For finite families over a Noetherian base, Nisnevich
means a section over every henselization (§0.13). Checks: a separable quadratic `Spec K → Spec k` is
étale but not Nisnevich; `{Spec ℤ[1/10], Spec ℤ[1/2][x]/(x² + 1)}` covers `Spec ℤ[1/2]`; Zariski
covers are Nisnevich. *Lean:* `Nisnevich.IsNisnevichCovering`, `Nisnevich.nisnevichPrecoverage`,
`Nisnevich.nisnevichTopology`, `Nisnevich.zariskiTopology_le_nisnevichTopology`,
`Nisnevich.nisnevichTopology_le_etaleTopology`, with the quadratic example.

### 2.13 Elementary distinguished squares, Mayer–Vietoris and the sheaf criterion

**Distinguished squares.** An elementary distinguished square is an open immersion `j : U → X` and
an étale `p : V → X` such that `p` is an isomorphism over the reduced complement of `U`
(Morel–Voevodsky 1999, §3.1, Definition 1.3, p. 96); the pointwise condition "one preimage with
trivial residue extension" is weaker, and for finite `p` the fibre must be a single point with
trivial residue extension. Such squares are Nisnevich coverings and Mayer–Vietoris squares for the
Nisnevich topology (Lemma 1.6, Remark 1.7, pp. 97–98). **Sheaf criterion:** for `X` Noetherian of
finite dimension, a presheaf on the quasi-compact étale basis is a Nisnevich sheaf iff it sends the
empty object to a point and distinguished squares to pullbacks (Proposition 1.4, Lemma 1.5), and
sheaves on the basis and on `X.Etale` agree (Stacks, Lemma 7.29.1 (03A0)). Checks: over `Spec ℝ`,
`Spec ℝ ⊔ Spec ℂ` with `U = ∅` satisfies the pointwise clause but is not distinguished; on `𝔸¹_ℚ`,
`U = 𝔸¹ ∖ {0}` and `s ↦ s² + 2s` on `𝔸¹ ∖ {−1, −2}` is distinguished; `Spec ℂ → Spec ℝ` lies in the
basis but does not cover. *Lean:* `Nisnevich.ElementaryDistinguishedSquare`,
`Nisnevich.ElementaryDistinguishedSquare.exists_mayerVietorisSquare`, with the extra-point example.

### 2.14 Nisnevich points, cohomological dimension, Čech comparison and Brown–Gersten

**Nisnevich points and dimension.** For an étale `U → X` and `u ∈ U`, the fibre functor at the
henselization: colimit over pointed étale neighbourhoods with trivial residue extension, represented
on `h_W` by `Hom_X(Spec O^h_{U,u}, W)`, exact; for Noetherian `X` these fibres detect isomorphisms
of Nisnevich sheaves (Morel–Voevodsky 1999, §3.1, p. 99; Gabber–Kelly, Theorems 2.3, 2.6). For `X`
Noetherian of dimension `d`, `H^q(X_Nis, F) = 0` for `q > d` (Proposition 1.8), Čech cohomology
computes Nisnevich cohomology (Proposition 1.9), and Brown–Gersten presheaves that are
Nisnevich-locally contractible are contractible (Definitions 1.12–1.13, Proposition 1.16, Lemmas
1.17–1.18, pp. 100–102). Checks: Nisnevich cohomology of a field vanishes in positive degrees while
`H²_ét(Spec ℝ, 𝔾_m) = ℤ/2`; over `Spec ℝ` the fibres at the base alone do not detect isomorphisms.

### 2.15 Étale cohomology: Gabber, fields, limits, Hochschild–Serre

**Étale cohomology.** For a henselian pair `(A, I)` and torsion `F`, `H^q(Spec A, F) ≅ H^q(V(I), F)`
(Gabber; Stacks, Theorem 59.82.7 (09ZI), Lemmas 59.82.1–59.82.6 (09Z8)). Étale sheaves on `Spec K`
are discrete `G_K`-modules and `H^q((Spec K)_ét, F) ≅ H^q_cont(G_K, F_{K^s})` (Lemmas
59.59.1–59.59.2, Example 59.59.3 (03QQ)). For cofiltered limits of qcqs schemes with affine
transitions, `H^q(lim X_i, F) = colim H^q(X_i, F_i)` (Theorem 59.51.3 (09YQ)). Hochschild–Serre for
Galois coverings, and its continuous version (Milne LEC, §6, Proposition 6.4, pp. 42–43; §14,
Theorem 14.9, p. 96). Checks: strictly henselian local rings are acyclic for torsion sheaves;
`H¹(Spec 𝔽_q, ℤ/n) = ℤ/n`; `H²(Spec ℝ, 𝔾_m) = H²(ℤ/2, ℂ^×) = ℤ/2`.

### 2.16 Tsen's theorem, `𝔾_m` on curves and proper hypercoverings

**Tsen and curves.** For `k` algebraically closed and `K` of transcendence degree one, `K` is `C_1`,
`Br(K) = 0` and `H^q(G_K, K^{s×}) = 0` for `q ≥ 2` (Stacks, Proposition 59.67.4, Theorems 59.67.8,
59.67.10 (0A2M)). For a smooth curve over an algebraically closed field, `H^q(X_ét, 𝔾_m) = 0` for `q
≥ 2`, `H¹ = Pic`, `H⁰ = Γ(O)^×`, with the degree sequence for proper curves and the Galois version
over any field (Theorems 59.68.1, 59.68.5 (03RH)); `μ_n`-cohomology of curves follows with Kummer
and belongs to TraceFormula Layer 8. Proper hypercoverings satisfy cohomological descent (Lemmas
85.36.1–85.36.5 (0DHI)). Checks: `Br(k(t)) = 0`; `H¹(ℙ¹_{k̄}, 𝔾_m) = ℤ`, `H² = 0`; the nodal cubic
has `H¹(C, ℤ/n) = ℤ/n` by descent from its normalization. *Lean:*
`Etale.brauer_functionField_curve_trivial`.

### 2.17 Pro-étale site foundations: replete topoi, w-contractible covers, left-completeness

**Replete topoi.** A topos is replete if limits of towers of epimorphisms have epimorphic legs
(Bhatt–Scholze 2014, Definition 3.1.1, p. 16); locally weakly contractible topoi are replete
(Proposition 3.2.3), `Sh(X_proét)` is replete (Proposition 4.2.8, p. 29), derived categories of
replete topoi are left-complete (Proposition 3.3.3, p. 19), and `R lim` of epimorphic towers is
`lim` (Proposition 3.1.10). Every affine has a pro-étale w-contractible cover and w-contractible
affines form a basis (Definition 2.4.1, Lemma 2.4.9, Theorem 1.5); `D(X_proét, Λ)` is left-complete
and compactly generated by w-contractible objects (Propositions 3.3.3, 3.2.3(2)). The
étale-to-pro-étale comparison is EllAdicRealization's. Checks: the category of types is replete;
`Sh((Spec ℚ)_ét)` is not (the tower `μ_{ℓ^{n+1}} → μ_{ℓ^n}` has limit `0`); `Spec ℚ` is not
w-contractible. *Lean:* `Proetale.IsReplete`, `Proetale.isReplete_proetale`, with the `Spec ℚ`
example.

### 2.18 Derived categories of quasi-coherent complexes

**Pseudo-coherent complexes and `D_QCoh`.** A complex is pseudo-coherent if locally represented by a
bounded-above complex of finite free sheaves; `F[0]` is pseudo-coherent iff `F` is (§0.5),
cohomology sheaves are quasi-coherent, and on `Spec A` it means a bounded-above finite projective
complex (Stacks, Lemmas 36.10.1–36.10.2 (08E4)). `D_QCoh(X)` is triangulated with coproducts, `D(A)
≌ D_QCoh(Spec A)` compatibly with t-structures (Lemmas 36.3.1 (06YZ), 36.3.5, 36.3.8–36.3.9), and
`D_Coh` for locally Noetherian `X`. Derived tensor and `RHom` with adjunction, `RHom(K, L) ∈
D⁺_QCoh` for pseudo-coherent `K` and `L ∈ D⁺_QCoh`, perfect duality (§§21.35 (08J7), 21.36 (0B6E));
`Lf^* ⊣ Rf_*` on `D_QCoh` for qcqs `f`, projection formula, `H^i(Rf_* F) = R^i f_*F`; `D_QCoh` of a
qcqs scheme is generated by one perfect complex (Theorem 36.15.3 (09IP)); Tor-independent base
change (Lemmas 36.22.3, 36.22.5 (08ET)). Checks: extension by zero from the generic point of a DVR
is not in `D_QCoh`; `(ℤ/2)~ ⊗^L (ℤ/2)~` has cohomology in degrees `0, −1`; `H^i R𝓗om(M~, N~) =
Ext^i(M, N)~` for pseudo-coherent `M`, but for `M = ⊕_ℕ k[t]`, `H⁰ R𝓗om(M~, O) = ∏ O` is not
quasi-coherent; `Rf_* O(−2) = k[−1]` for `ℙ¹ → Spec k`. *Lean:* `Coherent.DQCoh`,
`Coherent.DQCoh.affineEquiv`.

### 2.19 The right adjoint of pushforward and the upper shriek functor

**The right adjoint.** For `f : X → Y` quasi-compact and quasi-separated with `Y` quasi-compact and
quasi-separated, `Rf_* : D_QCoh(X) → D_QCoh(Y)` has a right adjoint `a_f` with trace `Rf_* a_f K →
K`, `a_{g∘f} ≅ a_f a_g`, preserving `D⁺_QCoh` with a uniform bound: one integer `N` depending only
on `f` such that `H^i(K) = 0` for `i < c` implies `H^i(a_f K) = 0` for `i < c − N`; no finite Tor
dimension is needed (Stacks, Lemmas 48.3.1 (0A9E), 48.3.5 (0A9I)). Global duality `RHom(L, a_f K) ≅
RHom(Rf_* L, K)`, and `a_f(K~) = RHom_A(B, K)~` for finite `Spec B → Spec A` (Example 48.3.2, Lemmas
48.3.6, 48.3.10). Checks: for `⨿_n ℙⁿ_k → ⨿_n Spec k` (proper flat, neither scheme quasi-compact)
the componentwise adjoint has `H^{−n}(a_f O) = O(−n−1)` on every component, so no global bound; for
`ℙⁿ_k → Spec k`, `a_f(k) = O(−n−1)[n]`; for `𝔸¹ → Spec k`, `a_f(k)` is the full linear dual, not
`f^!k`.

**Upper shriek.** A morphism is a local complete intersection if locally a regular closed immersion
into a scheme smooth over the target (Stacks, §37.62). For `f` separated of finite type between
Noetherian schemes, choose a compactification `f = f̄ ∘ j` (CompactSupport Layer 1) and set `f^! :=
j^* a_{f̄}` on `D⁺_QCoh`, independent of the compactification and pseudofunctorial (Situation
48.16.1, Lemmas 48.16.2–48.16.5 (0A9Y)); `f^! = a_f` for proper `f`, `f^! = f^*` for étale `f`, flat
base change (Lemmas 48.17.1–48.17.2 (0ATZ), 48.18.1, 48.18.4 (0BZX)), `f^! K = f^*K ⊗ Ω^d[d]` for
smooth `f`, and for lci `f`, `f^! K ≅ Lf^*K ⊗^L f^!O_Y` with derived pullback and `f^!O_Y`
invertible, `ω_{X/Y}[d]` for Gorenstein `f` (Lemmas 48.17.9(5), 48.17.11). Checks: `Spec k → Spec
k[ε]` is not lci; for the origin `i : Spec k → 𝔸¹` and `K = k[0]`, `i^!K` has `k` in degrees `0, 1`,
matching `Li^*K ⊗ k[−1]` but not the underived `i^*K ⊗ k[−1]`; `f^!k = O(−2)[1]` on `ℙ¹`.

### 2.20 Relative dualising complexes and modules, Serre duality, curve comparison

**Relative dualising complexes.** For `f : X → S` flat and locally of finite presentation, `K` is
`S`-perfect if pseudo-coherent of locally finite Tor dimension over `S`; a relative dualising
complex is `(K, ξ)` with `ξ : Δ_* O_X → L pr_1^* K|_W` inducing `Δ_* O_X ≅ RHom(Δ_* O_X, L pr_1^*
K|_W)` (Stacks, Definition 48.28.1 (0E2S)), unique, existing, compatible with base change, with `O_X
≅ RHom(K, K)` and given by `f^! O_S` (Lemmas 48.28.2–48.28.9). For `f` flat, separated,
quasi-compact, locally of finite type over Noetherian `Y`, of pure relative dimension `d` with
Cohen–Macaulay fibres (§0.18), `ω_{X/Y} := H^{−d}(f^!O_Y)` is coherent, flat, compatible with base
change, `f^!O_Y ≅ ω[d]`, invertible exactly at Gorenstein points, `∧^d Ω` for smooth `f` (Lemmas
48.23.1, 48.23.3, Remark 48.23.4 (0AWQ)). **Serre duality:** for `X` proper Cohen–Macaulay of pure
dimension `d` over `k`, `H^i(X, F)` is dual to `Ext^{d−i}(F, ω_X)` for coherent `F`, with trace
`H^d(ω_X) → k` (Lemma 48.27.1, Remarks 48.27.2–48.27.6 (0FVU)); on curves this restricts to
StableReduction's `ω_{X/k}` and JacobianChallenge's and Tau Ceti's line-bundle duality (Lemmas
53.4.1–53.4.2 (0E31)); sheafified duality `Rf_* RHom(K, f^!L) ≅ RHom(Rf_* K, L)` for proper `f`
(Lemma 48.3.6, Example 48.3.9). Checks: `ω_{ℙ¹} = O(−2)`; for `Spec k[x, y]/(x, y)² → Spec k` the
dualising module needs two generators; two planes in `𝔸⁴` meeting at a point have no dualising
module.

### 2.21 Dualising complexes

**Dualising complexes.** Over a Noetherian ring, `ω` is dualising if it has finite injective
dimension, finite cohomology and `A ≅ RHom(ω, ω)` (Stacks, Definition 47.15.1), giving biduality on
`D^b_Coh`, stable under localisation and quotients and unique up to shift and twist; on schemes,
dualising complexes are affine-local (Definition 48.2.2, Lemma 48.2.1) and exist for finite type
over a field; over a local ring, normalised means `RHom(κ, ω) = κ[0]` (Lemma 47.16.1). **Coherent
duality:** the pseudofunctor `f^!` of §2.19 on `D⁺_Coh` for separated finite-type morphisms of
Noetherian schemes satisfies properties (1)–(9) of Stacks §48.19: `f^!ω_Y` is dualising,
composition, flat base change, the open-immersion, finite and smooth formulas, and duality for
proper `f`, with traces compatible with composition and base change. Checks: over a regular local
ring of dimension `d`, `A[d]` is normalised; for a DVR `A[1]` is normalised and `A[0]` is not; the
trace of a finite separable field extension is the field trace.

### 2.22 Sheaves of algebras, Azumaya algebras and the Brauer group of a scheme

**Azumaya algebras.** Sheaves of algebras are sheaves of rings with central quasi-coherent structure
(Stacks, §59.62 (0A2J)). A quasi-coherent algebra is Azumaya if étale-locally `Mat_{d_i}` with `d_i
≥ 1`; the property is fpqc local and quasi-coherent algebras descend (§35.3 (023F)); over `Spec R`
it is Mathlib's `IsAzumaya R A` (`azumaya_affine_iff`). For `A` finite locally free of positive rank
at every point, Azumaya iff `A ⊗ A^op ≅ End(A)` iff geometric fibres are matrix algebras iff
fppf-locally matrix (`azumaya_equivalent_conditions`; Grothendieck, Brauer I, Théorème 5.1,
Propositions 5.4–5.5, pp. 210–212). In the affine form, for finite projective `A`, `IsAzumaya R A`
iff every fibre has positive rank and `AlgHom.mulLeftRight R A` is bijective; native `IsAzumaya`
includes faithfulness, and positivity is vacuous over the empty scheme.

**Étale matrix splitting.** For a commutative ring `A` and an `A`-algebra `R` with `IsAzumaya A R`,
`0 < d` and constant stalk rank `d · d`, there is a faithfully flat étale `A`-algebra `B` with `B
⊗_A R ≃ Mat_d(B)`; finitely many jointly surjective affine étale splitting charts assemble into one
such `B = ∏ B_i`, étale and faithfully flat (Grothendieck, Brauer I, Théorème 5.1(ii)–(iii), p.
210). This neutral ring-level API supplies both the sheaf statements here and the reduced norm of
IntegralHeckeAndGaloisDeterminants. Checks: the rank-zero matrix algebra over a field has bijective
`mulLeftRight` and is not Azumaya; over `k × k`, `k` through the first projection is unfaithful and
not Azumaya; the zero ring is Azumaya over itself. *Lean:*
`IsAzumaya.exists_etale_matrix_splitting`, `IsAzumaya.etale_matrix_splitting_of_finite_cover`,
`Brauer.isAzumaya_iff_positive_fibres_mulLeftRight`, with the first two examples.

**Brauer groups.** Stabilised equivalence `A ⊗ End(E) ≅ B ⊗ End(F)` with `E, F` locally free of
positive rank; `Br(X)` is the group of classes under `⊗` with inverse `A^op`, functorial, equal to
`BrauerGroup R` for affine `X` and to Tau Ceti's field Brauer group for `Spec K`. `Br′(X)` is the
torsion of `H²(X_ét, 𝔾_m)`. For affine `X` and an Azumaya algebra finite projective over `Γ(X, O)`,
its class in `H²(X_ét, 𝔾_m)` is additive and torsion for constant rank `d²` (Grothendieck, Brauer I,
§2, pp. 204–205; Brauer II, Proposition 1.4); the non-affine `Br(X) → Br′(X)` is built from the
gerbe of local splittings (its `𝔾_m`-band, descent of splittings, the associated `H²` class, tensor
and pullback laws, agreement with the affine class), whose construction is part of this target. For
affine regular integral `X`, `Br(X) → Br(K(X))` is injective, `Br(X)` is torsion, and `Br = Br′` in
dimension `≤ 2` (Brauer II, Proposition 1.4, Lemme 1.9, Corollaires 1.8, 1.10, pp. 291–293); `0 →
Pic/n → H²(μ_n) → Br′[n] → 0` for `n` invertible; `Br(R) ≅ Br(k)` for henselian local `R` (Brauer I,
Théorème 6.1, p. 214); for smooth geometrically integral `X` with `Γ(X̄, O)^× = k^{s×}`, the
Hochschild–Serre sequence `0 → Pic X → Pic(X̄)^{G_k} → Br k → ker(Br′X → Br′X̄) → H¹(G_k, Pic X̄) →
H³(G_k, k^{s×})` (Harpaz–Wittenberg 2023, §3, (3.1), Remark 3.1, pp. 8–9). Checks: for `𝔾_m/ℝ`, the
unit `t` violates the constant-unit hypothesis and `(−1, t)` is a nonconstant class; `ℍ` and
`Mat_2(ℝ)` have isomorphic modules and different classes; `Br′(Spec ℝ) = ℤ/2`; `Br(ℤ) = Br(ℤ_p) =
0`.

### 2.23 Equivariant sheaf cohomology

**Equivariant cohomology.** For a discrete group `Γ` acting on a scheme by automorphisms,
`Γ`-equivariant `O_X`-modules (with cocycle isomorphisms `γ^*F ≅ F`) form a Grothendieck abelian
category with exact faithful forgetful functor, `Hom_Γ = Hom^Γ`, induction `⊕ γ^*F` and coinduction
`∏ γ_*F` adjoint to the forgetful functor (Kings–Sprang 2019, Appendix A.1, Definitions A.1–A.3, pp.
79–80; Grothendieck 1957, §5.1, Proposition 5.1.1, p. 196). Global sections of injectives are
`Γ`-acyclic; equivariant cohomology `R^n(Γ(X, −)^Γ)`, equivariant Ext and cohomology with supports
have spectral sequences `H^p(Γ, H^q(X, F)) ⇒ H^{p+q}_Γ` and `H^p(Γ, Ext^q) ⇒ Ext^{p+q}_Γ` (Appendix
A.1, (A.1.1), p. 80). Checks: for a point with `Γ = ℤ/2` the category is `ℤ[ℤ/2]`-modules; `ℤ`
acting on `ℝ` by translation gives equivariant modules outside Mathlib's `Action`; for `Γ = ℤ`,
induction and coinduction differ; for a free finite quotient `H^n_Γ(X, π^*G) = H^n(Y, G)`.

### Examples

`H¹(ℙ¹, 𝔾_m) = ℤ`, `H¹(Spec ℝ, μ_2) = ℤ/2`, `Br(ℝ) = ℤ/2`, `H¹_{0}(𝔸¹, O) = k[t, t⁻¹]/k[t]`, `ω_{ℙ¹}
= O(−2)`, the Cousin resolution of a DVR, `Spec ℂ → Spec ℝ` as the étale non-Nisnevich covering, and
`μ_{ℓ^{n+1}} → μ_{ℓ^n}` separating replete from non-replete topoi.

### Dependencies

Layer 0: §§0.4–0.5, 0.9, 0.13–0.14, 0.17–0.18. Layer 1: §1.1 (in §2.22), §1.18. StableReduction
Layers 1–2; JacobianChallenge Layer B; ProfiniteCohomology Layers 9–10; AlgebraicVectorBundles L0B;
CompactSupport Layers 1–2 and ConstructibleEtale Layer 6 as comparison inputs.

## Layer 3: curves, divisors and Picard objects

Three Tau Ceti roadmaps plan most of the theory of curves (AlgebraicCurves, JacobianChallenge,
StableReduction); Layer 3 states how they fit together and adds what the arithmetic roadmaps need:
the affine-or-projective dichotomy, the genus under field extension, scheme Riemann–Hurwitz, the
projective line, genus one and degree bounds, degrees and duality for vector bundles, Picard groups
and groupoids, norms, Picard torsors of curves without rational points, Picard stacks and Abel maps,
and invariant differentials.

**Conventions of this layer.** A curve over `k` is an integral separated `k`-scheme of finite type
of dimension one; smoothness, properness and geometric connectedness are hypotheses where used.
`Pic(X)` is Tau Ceti's `LineBundleClass X`, `Pic_{X/k}` the fppf Picard sheaf of JacobianChallenge
Layer D. The genus is `dim_k H¹(X, O_X)` and `χ = dim H⁰ − dim H¹`, both on Tau Ceti's
`Scheme.Modules.Cohomology`. Abel–Jacobi with a base point is JacobianChallenge Layer F.

### 3.1 Curves are affine or projective; the genus under field extension

**Affine or proper.** A curve is either affine and not proper or proper and not affine, and proper
curves are projective (Stacks, Lemmas 0A24, 0A26, 0A27, 0A28). *Lean:* `Curve.isAffine_or_isProper`.

**Genus under base change.** For a proper curve with `H⁰(X, O) = k`, every base change `X_K` has `H⁰
= K` and the same genus; `X_K` need not be reduced or irreducible for inseparable `K/k` (Stacks,
Definition 0BY7, Lemmas 0BY9, 0CE4, 0BY4). Checks: for `X = Spec L`, `L/k` finite nontrivial, the
hypothesis fails and `H⁰(X_K) ≠ K`; for the regular model of `y² = x^p − t` over `𝔽_p(t)`, after
adjoining `t^{1/p}` the genus `(p − 1)/2` persists while the normalization has genus `0`. *Lean:*
`Curve.cohomologyDim`, `Curve.genus`, `Curve.genus_baseChange`.

### 3.2 Riemann–Hurwitz for schemes, the projective line, genus one, degree bounds

**Riemann–Hurwitz.** For a finite generically étale `f : X → Y` of smooth proper geometrically
connected curves of degree `n`, `2g_X − 2 = n(2g_Y − 2) + deg R` with `R` the ramification divisor
of lengths of `Ω_{X/Y}`, `deg R ≥ Σ (e_x − 1)[κ(x) : k]` with equality iff tame; for finite étale
`f`, `g_X − 1 = n(g_Y − 1)` (Stacks, Lemmas 0C1C, 0C1D, 0C1F, 0AYZ); AlgebraicCurves Layer 7 states
the function-field form. Checks: `z ↦ z²` on `ℙ¹` gives `−2 = 2(−2) + 2`; relative Frobenius is not
generically étale; an étale double cover of a genus-two curve has genus three. *Lean:*
`Curve.genus_of_finite_etale`.

**Projective line and genus one.** A smooth proper geometrically integral genus-zero curve with `H⁰
= k` is a conic, isomorphic to `ℙ¹` iff it has a rational point iff it has an invertible sheaf of
odd degree, and degree-zero invertible sheaves on it are trivial (Stacks, Lemmas 0C6M, 0C6T, 0C6N,
Proposition 0C6U). A genus-one curve with an invertible sheaf of degree one has a rational point,
and its degree-`d` Picard torsors are torsors under the Jacobian (Lemmas 0AYY, 0CDU (1)). Check: `x²
+ y² + z² = 0` over `ℝ` has genus zero, no point and no odd-degree sheaf. *Lean:*
`Curve.exists_rationalPoint_of_degree_one`.

**Degree bounds.** For `L` invertible on a smooth proper geometrically connected curve of genus `g`:
`deg L > 2g − 2` gives `H¹(L) = 0` and `h⁰(L) = deg L + 1 − g`; `deg L ≥ g` gives `h⁰ > 0`; `deg L ≥
2g` gives global generation; `deg L ≥ 2g + 1` very ampleness; `deg L < 0` gives `h⁰ = 0` (Stacks,
Lemmas 0E3A, 0E3B, 0E3C, 0E3D, 0H2V, 0B5E). Check: the canonical sheaf has degree `2g − 2` and `h⁰ =
g`, so the first bound is sharp. *Lean:* `Curve.cohomologyDim_one_eq_zero_of_degree_gt`.

### 3.3 Degrees of vector bundles, Riemann–Roch and Serre duality on curves

**Degrees.** For `X` proper over `k` of dimension `≤ 1` and `E` locally free of rank `r`, `deg E :=
χ(E) − r·χ(O_X)` (Stacks, Definition 0AYR): Tau Ceti's `InvertibleSheaf.eulerDegree` in rank one,
additive in short exact sequences (Lemma 0AYS), `deg(E ⊗ V) = r deg V + s deg E` (Lemma 0AYW), `deg
E = deg det E` (Lemma 0AYX), negated by duals, `deg E(D) = deg E + r deg D`, invariant under field
extension, multiplied by `n` under finite pullback of degree `n` (Lemma 0DJ5), and `deg O(D) = Σ n_x
[κ(x) : k]` on regular curves (Lemma 0B59). **Riemann–Roch:** for a proper Gorenstein curve with `H⁰
= k`, `χ(E) = deg E + r(1 − g)` (Lemmas 0BS5, 0BS6), extending the rank-one statement
`eulerCharBelow_eq_relativeDegree_add_one_sub_genus`. Checks: `deg O^r = 0`; `O(1) ⊕ O(−1)` on `ℙ¹`
has degree zero without being trivial; on a genus-two curve `deg O = 0 ≠ χ(O) = −1`; the nodal cubic
has `χ(E) = deg E`. *Lean:* `Curve.vectorBundleDegree`,
`Curve.vectorBundleDegree_add_of_shortExact`, `Curve.eulerChar_eq_degree_add_rank_mul` (the smooth
case), with the genus-two example.

**Serre duality on curves.** For a proper equidimensional Cohen–Macaulay curve with dualising module
`ω_X` (§2.20), `Ext^{1+i}(F, ω_X) ≅ H^{−i}(X, F)^∨` for coherent `F` and `H^i(E^∨ ⊗ ω) ≅
H^{1−i}(E)^∨` for locally free `E`; separately `Ext¹(U, V) ≅ Hom(V, U ⊗ ω)^∨` for finite locally
free `U` and coherent `V`; `ω ≅ Ω¹` for smooth `X` (Stacks, Lemmas 0BS2, 53.4.2(3)–(4) (0BS3),
Remark 0BS4, Lemma 0C1A). Checks: at the node of `y²z = x²(x + z)`, the skyscraper `K` has `dim
Ext¹(K, K) = 2` but `dim Hom(K, K ⊗ ω)^∨ = 1`, so the Ext–Hom form needs `U` locally free; at a
smooth point `Ext¹(K, R) = k` and `Hom(K, R) = 0`.

### 3.4 Picard groups: divisor classes, excision, Picard groupoids

**Picard groups.** `Pic(X) = H¹(X_ét, 𝔾_m)` is §2.11's; on an affine scheme `LineBundleClass` is
Mathlib's `CommRing.Pic`. For `X` locally Noetherian, integral and normal, `Pic(X) → Cl(X)` is
injective, bijective if `X` is locally factorial (Stacks, Definitions 0BE4, 0BE6, Lemmas 02SL, 0BE8,
0BE9). For `X` integral locally Noetherian and `D` an integral codimension-one subscheme with
complement `U`, `ℤ → Cl(X) → Cl(U) → 0` is exact (Lemma 02RX); for `X` regular with `X ∖ U = D_1 ∪ ⋯
∪ D_r`, `Γ(X, O)^× → Γ(U, O)^× → ⊕ ℤ[D_i] → Pic X → Pic U → 0` is exact (Hartshorne 1977, II,
Proposition 6.5; Fulton 1998, Proposition 1.8). A Picard groupoid is a symmetric monoidal groupoid
with tensor inverses, with `π_0` and `π_1 = Aut(𝟙)` commutative groups (Bhatt–Scholze 2017,
Definition 12.14, Proposition 12.15, pp. 58–59); the invertible sheaves of `X` form one with `π_0 =
Pic X`, `π_1 = Γ(X, O)^×`, pullbacks, fppf descent and a graded version with the Koszul sign (§4, p.
15, Construction 5.1, p. 18). Checks: the quadric cone has `Pic = 0` and `Cl = ℤ/2`; for `𝔸¹ ∖ {0}`
the units sequence is `k^× → k^× × t^ℤ → ℤ → 0 → 0`. *Lean:*
`Picard.lineBundleClass_spec_equiv_pic`.

### 3.5 Norms of invertible sheaves

**Norms.** For `π : X → Y` finite locally free (finite, flat, locally of finite presentation),
`Norm_π : Pic X → Pic Y` takes `L` to the invertible sheaf locally given by determinants of `π_*L`
relative to `π_*O_X` (Stacks, Lemmas 0BCY, 0BCZ, 0BD2): a homomorphism, `Norm(π^*N) = N^{⊗d}` when
the degree is constantly `d`, functorial, compatible with base change, `Norm L ⊗ det π_*O ≅ det
π_*L`, with norms of sections and `Norm O(D) = O(π_*D)` on regular curves. Checks: on units over a
field it is `Algebra.norm`; for `z ↦ z²` on `ℙ¹`, `Norm(π^*O(1)) = O(2)`; for a hyperelliptic double
cover `det π_*O = O(−g − 1)`, so norm and determinant differ; the cusp normalization is finite but
not flat and has no norm.

### 3.6 Picard torsors of a curve without a rational point and rational divisor classes

**Picard torsors.** For a smooth projective geometrically connected curve `X`, the degree-`d`
component `Pic^d_{X/k}` of JacobianChallenge's Picard scheme, representable without a rational
point, is a proper torsor under the Jacobian `Pic⁰` (an abelian variety of dimension `g`), the class
of `Pic¹` has order dividing the index, the canonical class gives a point of `Pic^{2g−2}`, and
`Pic^d` has a `k`-point iff it is the trivial torsor; `Pic(X) → Pic_{X/k}(k) = Pic(X_{k^s})^{G_k}`
is injective with cokernel embedding in `Br(k)` (Milne 2008, Part III, Theorem 1.6, Remarks 1.4,
1.10–1.12, Propositions 1.13–1.14, pp. 88–91). For the smooth hyperelliptic curve of a separable
binary form of degree `2g + 2` in characteristic `≠ 2`, a rational divisor of odd degree makes every
rational divisor class representable by a rational divisor (Bhargava–Gross–Wang 2017, §3,
Proposition 21, pp. 10–11). Checks: for an elliptic curve `Pic^d ≅ E`; for the pointless real conic
every `Pic^d = Spec ℝ` but line bundles have even degree, so `Pic(X) = 2ℤ` inside `ℤ` with cokernel
`Br(ℝ)`; the period of a genus-one curve divides its index and can be smaller.

### 3.7 Picard stacks, universal sections, Abel maps and the norm sequence

**Picard stacks and Abel maps.** The Picard stack of a proper curve (invertible sheaves on `X × T`)
is a `𝔾_m`-gerbe over `Pic_{X/k}`, split by a rational point, with a universal bundle on `X ×` the
stack (Yun–Zhang 2017, §3.2.1, p. 16); the section stack of pairs `(L, s)` is the zero section in
negative degree, contains `X^{(d)}` as `s ≠ 0`, and for `d > 2g − 2` is the total space of
`p_*L^{univ}` of rank `d + 1 − g` (proof of Proposition 3.1 (2), p. 18). The Abel map `X^{(d)} →
Pic^d` is surjective for `d ≥ g`, and for `d > 2g − 2` a Brauer–Severi family of relative dimension
`d − g`, a projective bundle only when the gerbe splits (Stacks, Lemma 0BA0). For a geometrically
connected étale double cover of smooth proper curves in odd characteristic, `1 → 𝔾_m → ν_*𝔾_m →
ν_*𝔾_m → 𝔾_m → 1` is exact and the kernel of the norm on Picard schemes has two components
(Yun–Zhang 2017, §6.1, Proposition 6.1 (1), p. 40). Checks: the Picard stack of `ℙ¹` is `ℤ × B𝔾_m`;
for the real conic, `a_1` is a nonsplit conic over `Pic¹ = Spec ℝ`; in degree zero on an elliptic
curve the section stack is not a vector bundle.

### 3.8 Invariant differentials and the pullback of forms along Abel–Jacobi

**Invariant differentials.** For a group scheme `G → S` with unit `e`, `Ω¹_{G/S} ≅ f^*e^*Ω¹`, and
for an abelian variety `Γ(A, Ω¹) ≅ T_0(A)^∨` of dimension `dim A` (Stacks, Lemma 047I; Tau Ceti's
`AbelianVariety.TangentSpace`). For a pointed smooth projective curve and Abel–Jacobi `ι : X → J`,
`ι^* : Γ(J, Ω¹) → Γ(X, Ω¹)` is an isomorphism, and the dual of `T_{x_0}X → T_0J = H¹(X, O)` is
evaluation `H⁰(Ω¹) → Ω¹|_{x_0}` (Milne 2008, Part III, Propositions 2.1, 2.2, p. 91). Checks:
`Ω¹_{𝔾_m}` is free on `dt/t`; `Γ(E, Ω¹)` is spanned by `dx/(2y + a_1x + a_3)`.

### Examples

Genus zero (`ℙ¹` and the pointless conic), genus one (elliptic curves and torsors of index `n`), the
nodal cubic (Gorenstein, genus one), the hyperelliptic double cover (norm versus determinant) and
the inseparable base change of `y² = x^p − t`.

### Dependencies

Layer 0: §0.7. Layer 1: §§1.1, 1.18–1.19. Layer 2: §§2.6, 2.11, 2.20. JacobianChallenge Layers A–F;
AlgebraicCurves Layers 3, 4, 7, 8, 10, 12; StableReduction Layers 0–2; AlgebraicVectorBundles
L0B–L0C; ModularCurves 0B; ClassFieldTheory Layer 5.

## Layer 4: deformations, formal schemes, models and alterations

The deformation-theoretic, formal and birational layer. Mathlib provides formally smooth, unramified
and étale algebras with square-zero lifting, the naive cotangent complex, adic completion with
Artin–Rees, Proj, birational maps and relative normalization; Tau Ceti provides models over a DVR
with their fibres. Layer 4 adds thickenings and the lifting criterion, the Artinian coefficient
category, deformation functors, hulls, Schlessinger's theorem and obstruction theories, deformations
of algebras, smooth schemes, line bundles and nodes, adic thickening systems with formal completion,
coherent formal modules, formal functions, Grothendieck existence and algebraization, modifications,
strict transforms, flattening, Chow's lemma, Hilbert and Quot schemes, the moduli stack of stable
pointed curves, and de Jong's alterations over a field and over a trait.

**Conventions of this layer.** `Λ` is Noetherian with a finite map to a field `k`; objects of `C_Λ`
carry a fixed augmentation to `k`; deformation functors are set-valued and a hull is never
identified with a prorepresenting ring. An adic thickening system is a tower `X_0 → X_1 → ⋯` in
which `X_n` is cut out in `X_{n+1}` by the `(n+1)`-st power of the ideal of `X_0`; its morphisms are
level-preserving, a strictly smaller class than continuous maps of formal schemes. Modifications are
proper birational, alterations proper, dominant and generically finite; de Jong's "semistable curve"
is StableReduction Layer 3's prestable family; a trait is the spectrum of a complete DVR.

### 4.1 Thickenings, formally smooth and étale morphisms, the lifting criterion, torsors of lifts

**Lifting criterion.** A thickening is a closed immersion surjective on points; a first-order
thickening has square-zero ideal (Stacks, Definition 37.2.1 (04EX)); first-order thickenings are
thickenings, stable under base change, and thickenings of order `n + 2` factor through first-order
ones. `f` is formally smooth (unramified, étale) if `S`-morphisms from `T` extend to at least one
(at most one, exactly one) `S`-morphism from `T'` for every affine first-order thickening `T → T'`
over `S` (Definitions 37.11.1 (02H0), 37.6.1 (02H8), 37.8.1 (02HG)); on `Spec` this is Mathlib's
`RingHom.FormallySmooth`, affine-local, stable under composition and base change. For `f` locally of
finite presentation, smooth iff formally smooth and étale iff formally étale (Lemmas 37.11.7 (02H6),
37.8.10 (02HM), 37.6.9 (02HE)). For `f` smooth and a first-order thickening with ideal `I`, lifts of
`a : T → X` form a torsor under `Hom(a^*Ω_{X/S}, I)` with obstruction in `H¹(T, Hom(a^*Ω, I))`,
trivial when `T'` is affine, unique for étale `f` (Lemmas 37.9.1–37.9.6 (04FG, 02H5, 04FH, 04FJ,
04FK)). Checks: `Spec k → Spec k[ε]` is first order; `Spec k → Spec k[x]/(x³)` is a thickening and
not first order; `Spec k → 𝔸¹` is not a thickening and not formally smooth. *Lean:*
`Formal.IsThickening`, `Formal.IsFirstOrderThickening`, `Formal.FormallySmooth`,
`Formal.FormallyEtale`, `Formal.smooth_iff_formallySmooth`, `Formal.etale_iff_formallyEtale`, with
the cube example.

### 4.2 The Artinian coefficient category

**The category `C_Λ`.** Objects are Artinian local `Λ`-algebras with surjective augmentation to `k`,
morphisms `Λ`-algebra maps over `k` (Stacks, Definition 90.3.1 (06GC), §90.2 (06G9)); `k` is
terminal, `k[ε]` is the dual numbers, small extensions are surjections with nonzero principal kernel
killed by the maximal ideal (Definition 90.3.2 (06GD)), fibre products along surjections stay in
`C_Λ` (Lemma 90.3.8 (06GH)), with the addition map `k[ε] ×_k k[ε] → k[ε]`; `Ĉ_Λ` is complete
Noetherian local `Λ`-algebras with residue field `k` (Definition 90.4.1 (06GW)). ModularCurves 7D's
`ArtinianTestAlgebra` is the case `Λ = W(k)`. Checks: `ℤ/p^{n+1}` is in `C_{ℤ_p}` and `ℤ_p` only in
`Ĉ_{ℤ_p}`; `k[x]/(x³) → k` is not small but factors into two small extensions.

### 4.3 Deformation functors and Schlessinger's conditions

**Schlessinger's conditions.** In the classical setting (`Λ` complete Noetherian local, `Λ → k`
surjective), a predeformation functor is a set-valued functor on `C_Λ` with `F(k)` a point (Stacks,
Definition 90.6.2 (06GS)). For `A' → A ← A''` with the second surjective, `θ : F(A' ×_A A'') → F(A')
×_{F(A)} F(A'')` defines `H1` (surjective for small `A'' → A`), `H2` (bijective for `A = k`, `A'' =
k[ε]`), the tangent space `F(k[ε])` with its `k`-vector space structure under `H2`, `H3` (finite
dimension) and `H4` (bijective for `A' = A''` small) (Definitions 90.10.1 (06HW), 90.12.1 (06IG),
90.16.1 (06J2), 90.16.8 (06J9); Lemma 90.12.2 (06IH)). Under `H2` and `H4`, lifts along a small
extension form a torsor under `T_F ⊗ I` (Lemma 90.17.5 (06JI)); for `h_R`, `T = Der_Λ(R, k)` (Tau
Ceti's `derivationToDualNumberEquivLift`). The prorepresented functor `h_R(A)` is the set of algebra
maps `R → A` preserving the augmentation. Checks: the subterminal functor of `k[[a, b]]` with a
point where `a = 0` or `b = 0` fails `H1`; on `ℤ/3`, `act(v, x) = v + 2x` has unique translators but
`act(0, 1) = 2`; `T_{h_R} = k^n` for `R = Λ[[t_1..t_n]]`; the quotient of `h_{k[[t]]}` by `t ↦ −t`
satisfies `H1` and not `H2`; a map with the wrong augmentation is not a point of `h_R`.

### 4.4 Versality, hulls and Schlessinger's theorem

**Schlessinger's theorem.** A morphism of functors is smooth if `F(A') → F(A) ×_{G(A)} G(A')` is
surjective for surjections (Stacks, Definition 90.8.1 (06HG)); a formal element `h_R → F` is versal
if smooth (Definitions 90.7.1 (06H3), 90.8.9 (06HR)), a hull if moreover bijective on tangent spaces
(Definition 90.14.4 (06T4)), and `F` is prorepresentable if some formal element is an isomorphism
(Definition 90.6.1 (06GX)). Hulls are unique up to isomorphism (Lemma 90.14.5 (06T5)); `h_R → h_Λ`
is smooth iff `R` is a power series ring; under `H1`, `H2`, `H3` every versal element factors
through a hull by a power series extension `R ≅ R_0[[t_1..t_r]]` with the coefficient inclusion
(Lemma 90.14.9, Remark 90.14.10). **Schlessinger:** a predeformation functor has a hull iff it
satisfies `H1`, `H2`, `H3` (Lemma 90.13.4 (06IW), Theorem 90.15.5 (06IX)), and is prorepresentable
iff moreover `H4` (Theorem 90.18.2 (06JM)). Checks: `(k[[t, s]], t ↦ t)` is versal and not a hull
for `h_{k[[t]]}`; the `t ↦ −t` quotient has a versal element and no hull.

### 4.5 Obstruction theories

**Elementary obstruction theories.** A finite-dimensional `O` with classes `ob_e(ξ) ∈ O ⊗_k I` for
every small extension `e` with kernel `I` and `ξ ∈ F(A)`, vanishing iff `ξ` lifts, natural in
morphisms of small extensions (Stacks, Definition 90.9.1 (06HP)); the all-module obstruction functor
of Definition 98.22.1 (07YG) is outside this subsection; functors lifting across all small
extensions have the zero theory, and theories pull back along smooth morphisms. Checks: `h_{Λ[[t]]}`
is unobstructed; for `k[[x, y]]/(xy)` the lift of `(ε, ε)` to `k[ε]/(ε³)` fails; over `ℚ` the
scaling `ε ↦ 2ε` multiplies kernels by `4`, so a constant nonzero class is not natural; in `ker(ℤ/8
→ ℤ/2)`, `2 · 2 ≠ 0`, so only small kernels are `k`-vector spaces.

### 4.6 Deformations of algebras, smooth schemes, line bundles and nodes

**Deformations.** For a square-zero `0 → I → A' → A → 0` and `B` flat over `A` with a flat lift,
lifts form a torsor under `Ext¹_B(NL_{B/A}, B ⊗ I)` with infinitesimal automorphisms `Hom_B(Ω_{B/A},
B ⊗ I)`, using Mathlib's `Algebra.Extension.cotangentComplex` (Stacks 08S7, 08S5, 0GPT); the general
obstruction in `Ext²(L_{B/A}, B ⊗ I)` uses the full cotangent complex of DerivedDeRhamCohomology
with its square-zero obstruction class (Stacks 08SP). For `X` smooth proper over `k`, deformations
have obstructions in `H²(T_X) ⊗ I`, form a torsor under `H¹(T_X) ⊗ I`, automorphisms `H⁰(T_X) ⊗ I`,
and line bundles deform with obstructions in `H²(O) ⊗ I` and torsor `H¹(O) ⊗ I` (Example 93.9.1
(0DY7), Lemmas 93.9.2–93.9.5, 93.16.4 (0DZQ), 91.8.1 (0D14)). The node `k[[u, v]]/(uv)` has hull
`Λ[[t]]` with family `uv = t`, and a stable curve of genus `g ≥ 2` has hull `Λ[[t_1..t_{3g−3}]]`
with node-smoothing parameters (Deligne–Mumford 1969, §1, Proposition (1.5), Theorem (1.6), pp.
81–83). Checks: `ℙ¹` is rigid and unobstructed; an elliptic curve has one-dimensional `H¹(T)`.

### 4.7 The formal spectrum and adic thickening systems

**Adic thickening systems.** An adic ring is complete and separated for a finitely generated ideal
(Stacks, Definition 15.37.1 (07E8)). An adic thickening system is a tower of thickenings `ι_n` with
`ker ι_n = (ker(X_0 → X_{n+1}))^{n+1}`, with level-preserving morphisms, adic morphisms (cartesian
squares), the constant system of a scheme, local Noetherianity and levelwise fibre products of adic
morphisms (Definition 87.9.9 (0AIF)). `Spf A` is the system `Spec A/I^{n+1}`; its morphisms to `Spf
A` from `Spf B` are the maps `A → B` with `φ(I) ⊆ J`; for `I = 0` it is `Spec A` (§87.2, Definitions
87.9.7, 87.9.9). Checks: `Spf ℤ_p` and `Spf k[[t]]` have one point, `Spec k[[t]]` two; `Spf k[[s,
t]] → Spf k[[s]]` is not adic; the identity of `k[[t]]` is continuous from the `(t)`-adic to the
`(t²)`-adic topology but not level-preserving. *Lean:* `Formal.AdicRing`,
`Formal.AdicThickeningSystem`.

### 4.8 Formal completion and coherent formal modules

**Formal completion.** The completion `X/V(I)` of a scheme along an ideal sheaf is the system of
infinitesimal neighbourhoods `V(I^{n+1})` with maps to `X`, functorial, locally Noetherian for
locally Noetherian `X`, and `Spf Â` for `X = Spec A` with `I` finitely generated (Stacks, Lemma
87.14.2 (0AIZ), Definition 87.14.3 (0AMC), Lemma 87.14.6 (0GBA)). A coherent formal module is a
system of finitely presented modules on the levels with isomorphisms `ι_n^*F_{n+1} ≅ F_n`; the
completion of a finitely presented module is one. For Noetherian `X` they form an abelian category
in which completion of coherent modules is exact (not levelwise) by Artin–Rees (Lemmas 30.23.2,
30.23.4 (0881)); for Noetherian `A`, coherent formal modules on `Spf Â` are finite `Â`-modules
(Lemma 30.23.1 (087W)), and completion computes the `I`-adic completion of sections on affines
(Lemma 30.23.3 (0880)). Checks: the completion of `𝔸¹` at the origin has levels `Spec
k[t]/(t^{n+1})`; `I = ⊥` and `I = ⊤` give the constant and empty systems; `k[x] → k[[x]]` is not
surjective, so completion is not full; multiplication by `t` on `k[[t]]` is injective but zero
modulo `t`; for `k[x_0, x_1, …]` with `I = 0`, `k` is finite and not finitely presented. *Lean:*
`Formal.Scheme.formalCompletion`, `Formal.Scheme.CoherentFormalModule`,
`Formal.Scheme.completionFunctor`.

### 4.9 The theorem on formal functions and Stein factorisation

**Formal functions.** For `f : X → Spec A` proper with `A` Noetherian, `I ⊆ A` and `F` coherent,
`H^p(X, F)^∧ ≅ lim_n H^p(X, F/IⁿF)`, the system is Mittag-Leffler, and for `f` proper to a
Noetherian `Y`, `(R^p f_*F)^∧_y ≅ lim_n H^p(X_n, F_n)` (Stacks, Proposition 30.19.1 (02O5), Lemma
30.19.3 (0897), Lemma 30.20.4 (02OB), Theorem 30.20.5 (02OC), Lemmas 30.20.6 (087U), 30.20.7
(02OD)). The shared destination is `TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`,
exporting `Scheme.Modules.Cohomology.formalFunctionsIso` with its Mittag-Leffler and local versions,
on the existing cohomology and §4.8 carriers; JacobianChallenge's coherent finiteness and
pushforward theorems are its inputs and its Picard construction consumes it. **Stein
factorisation:** a proper morphism of Noetherian schemes factors as `X → Spec_Y f_*O_X → Y` with
geometrically connected fibres then finite, and `f_*O_X = O_Y` gives geometrically connected fibres
(Theorem 37.53.4 (03H0), Lemma 37.53.6 (0AY8)). Checks: for `X = Spec A` the theorem is `M^∧ = lim
M/IⁿM`; the blow-up of a surface at a point has connected fibres.

### 4.10 Grothendieck's existence theorem and algebraization

**Grothendieck existence.** For a Noetherian adic ring `A` and `f : X → Spec A` proper, every
coherent formal module on the completion of `X` along `f⁻¹(V(I))` is the completion of a coherent
module, compatibly with the transitions, and compatible families of maps between completions come
from unique maps (Stacks, §30.24 (087V), Lemmas 30.24.1 (0883), 30.24.3 (0885), §30.25 (0886),
Lemmas 30.25.2–30.25.3, Proposition 30.25.4 (088C), Theorem 30.27.1 (088E)). *Lean:*
`Formal.grothendieck_existence`.

**Algebraization of morphisms.** For `X` proper and `Y` separated of finite type over `Spec A`, a
compatible family `g_n : X_n → Y_n` over `A/I^{n+1}` (commuting with the transitions) comes from a
unique `G : X → Y` (Stacks, Lemmas 30.28.1 (0899), 30.28.2 (09ZT), 30.28.3 (0A42)). Compatibility is
essential: over `k[[t]]` the maps `0` modulo `t` and `1` modulo `t²` form no system and come from no
morphism. Polarized algebraization and effective formal deformations of curves are outside this
subsection (Theorem 30.28.4 (089A) needs a compatible ample system). *Lean:* `Formal.quotMap`,
`Formal.levelIncl`, `Formal.algebraize_hom`, with the incompatible example.

### 4.11 Modifications and strict transforms

**Modifications and strict transforms.** A modification is proper and an isomorphism over a dense
open with dense preimage (Stacks, Definition 29.52.11 (0AAZ)), birational, closed under composition,
with a centre; finite modifications of normal integral schemes are isomorphisms; function fields
agree (Lemma 29.55.8 (0AB1)). For `f : X → S`, a modification `φ : S' → S` and a chosen dense open
`U` over which `φ` is an isomorphism, the strict transform is the scheme-theoretic closure of `X ×_S
φ⁻¹(U)` in `X ×_S S'`, and the module version divides by sections supported over `S' ∖ φ⁻¹(U)`
(Definition 31.34.1 (080D)): independent of the witness when the smaller preimage is scheme-
theoretically dense, unique among closed subschemes flat over `S'` agreeing scheme-theoretically
over `φ⁻¹(U)`, transitive, and equal to StableReduction Layer 4's strict transform for blow-ups
(Lemma 31.34.2 (080E)). Checks: Frobenius of `𝔸¹_{𝔽_p}` is proper and not birational; `𝔾_m → 𝔸¹` is
not proper; for the identity of `𝔸¹` and `X` the origin, the strict transform is `X` for `U = 𝔸¹`
and empty for `U = 𝔾_m`; `Spec k[ε]/(ε²)` and its reduction have the same support but only the
former is the strict transform. *Lean:* `Formal.IsModification`.

### 4.12 Generic flatness, flattening, domination and Chow's lemma

**Flatness and Chow's lemma.** For `f` of finite type over integral `S`, `f` (and a finite-type
quasi-coherent module) is flat over a dense open (Stacks, Proposition 29.28.1 (052A), Lemmas 051R,
051S). Raynaud–Gruson: for `f` proper over a Noetherian integral `S`, flat over a dense open `U`,
the strict transform along a `U`-admissible blow-up is flat (Theorem 38.30.7 (0815), Lemma 38.31.1
(081R)); modifications of Noetherian integral schemes are dominated by admissible blow-ups (Lemmas
38.31.3 (081S), 38.31.4 (081T)). **Chow's lemma:** for `X → S` separated of finite type over
Noetherian `S` there is a projective modification `X' → X` with `X'` quasi-projective over `S`,
projective if `X` is proper (Lemma 30.18.1 (0200), Remark 30.18.2 (0201), Lemma 32.12.1 (0202)).
Check: Hironaka's proper non-projective threefold has a projective modification. *Lean:*
`Formal.generic_flatness`.

### 4.13 Regular schemes, resolution of curves, Serre's criterion, Bertini

**Regular schemes and curves.** `X` is regular if locally Noetherian with regular local rings (de
Jong 1996, 2.4, 2.10, pp. 55–56): Mathlib's `IsRegularRing` on `Spec`, stable under open immersions,
étale and smooth maps, normal, Cohen–Macaulay, with regular locus the smooth locus over a perfect
field. For `Y` integral Noetherian of dimension `≤ 1` with finite normalization (Nagata, §0.20), the
normalization is regular and a finite modification (Stacks, Lemmas 33.41.1 (0C45), 54.15.1 (0BI4)).
Serre: a Noetherian ring is normal iff `(R_1)` and `(S_2)` (Lemma 10.157.4 (031S)). Bertini: a
general hyperplane section of a smooth `X ⊆ ℙ^n` over an infinite field is smooth, and likewise for
linear systems whose morphism is an immersion (§33.47 (0FD4), Lemmas 33.47.1 (0FD5), 33.47.3
(0FD6)). Checks: in characteristic `p`, `⟨X₀^p, X₁^p⟩` on `ℙ¹` has only nonreduced members
(Frobenius is not an immersion); the node and the dual numbers are not regular; the cusp normalizes
to `𝔸¹`. *Lean:* `Formal.IsRegular`, `Formal.resolution_of_curves`.

### 4.14 Hilbert and Quot schemes

**Hilbert and Quot schemes.** For `X → S` projective with relatively very ample `L` and `E`
coherent, `Quot^{Φ, L}_{E/X/S}` is representable by a projective `S`-scheme, hence `Hilb`, and
`Hom_S` and `Isom_S` of projective flat schemes are open in Hilbert schemes, with universal families
(Nitsure 2005, Theorems 2.3, 3.3–3.7, 4.3, 5.1–5.3, pp. 11–24), using ModularCurves 0G's
Grassmannian. Checks: `Quot` of `O^n` on `S` with constant polynomial `r` is `Gr(r, n)`; `Hilb²_{ℙ¹}
= ℙ²`.

### 4.15 The moduli stack of stable pointed curves

**Stable curves.** For `2g − 2 + n > 0`, `M̄_{g,n}` is the stack in groupoids of StableReduction
Layer 3's stable `n`-pointed genus-`g` families (de Jong 1996, 2.24, p. 62), with fppf descent, the
open smooth locus `M_{g,n}`, finite automorphism groups, and the forgetful morphism `M̄_{g,n+1} →
M̄_{g,n}` for target `2g − 2 + n > 0`, identified with the universal curve (Knudsen 1983, II,
Corollary 2.6, Theorem 2.7, p. 179). `Isom` of stable families is finite unramified (Deligne–Mumford
1969, Theorem (1.11)); `M̄_{g,n}` is a proper Deligne–Mumford stack over `ℤ`, smooth of relative
dimension `3g − 3 + n` with normal crossings boundary and node-smoothing versal deformations (§5,
Proposition (5.1), Theorem (5.2); Proposition (1.5), Theorem (1.6), Corollaries (1.7)–(1.9)).

**Level covers.** With Deligne's full level-`m` bases of `J[m]` over `M_{g,n}[1/m]` (Weil pairing
retained; the symplectic convention after adjoining a root of unity), the normalization `N_{g,n}(m)`
of the whole `M̄_{g,n}/ℤ` in the level cover is representable, finite and surjective, using
excellence (§§0.20–0.21) and relative normalization on étale atlases (Deligne 1985, §§3.3–3.4, pp.
137–138); for `m ≥ 3`, `N_{g,n}(m)[1/m]` is an algebraic space, and for `m` divisible by coprime `a,
b ≥ 3` (for example `15`) the normalized level space is an algebraic space over all of `ℤ` and
projective, hence a scheme (Proposition 3.5, Corollary 3.6, §3.7, pp. 138–140); single levels are
projective over `ℤ[1/m]` as finite quotients; extra markings are handled through the universal
curve, starting from `(g, 0)`, `(1, 1)` and `(0, 3)` (Knudsen 1983; Deligne §2.2). **Stable
extension:** for `Y` integral Noetherian and a stable family over a dense open `U`, there is an
alteration `Y' → Y` (§4.16) and a stable family over `Y'` extending the pullback, via the closure of
the finite cover `q_15` (de Jong 1996, §§4.17, 5.13; Deligne 1985, Lemme 1.6). Checks: `M̄_{0,4} →
M̄_{0,3}` and `M̄_{1,2} → M̄_{1,1}` are in range while `M̄_{0,3} → M̄_{0,2}` is not; `D(3) ∪ D(5) =
Spec ℤ` but `D(3) ∪ D(9) ≠ Spec ℤ`; `M̄_{0,3} = Spec ℤ`; `(ℙ¹, 0, ∞)` has infinite automorphisms; a
rational tail without marking is not stable; `ℙ¹ → Spec k` is proper projective but not finite.

### 4.16 Alterations

**Alterations.** An alteration is proper, dominant and finite over a nonempty open (Stacks,
Definition 29.52.12 (0AB0)); for integral source and target it has a function-field extension, a
generic degree (multiplicative), is generically étale when that extension is separable, is a
modification iff of degree one, and alterations of integral schemes compose. A proper surjection
onto an integral Noetherian scheme contains an alteration from an integral closed subscheme (Lemma
72.8.5 (0DMN)); finitely many alterations of an integral Noetherian scheme are dominated by one (de
Jong 5.4); base changes along dominant maps contain dominating altering components. Checks:
Frobenius of `𝔸¹_{𝔽_p}` is an alteration of degree `p`; `Spec ℤ[i] → Spec ℤ` has degree `2`; `ℙ¹ →
Spec k` is not generically finite; over `Spec k ⊔ Spec k` a point is not dominant and the two points
are dominated by no integral scheme. *Lean:* `Formal.IsAlteration`,
`Formal.IsAlteration.functionFieldMap`, `Formal.IsAlteration.IsGenericallyEtale`.

### 4.17 Strict normal crossings divisors

**Normal crossings.** `SNCData` is a finite family of reduced components with strata `D_J` and
divisor `∏ D_i`, transverse if every nonempty `D_J` is regular of codimension `|J|`; `D` is strict
normal crossings if it is such a divisor along which `X` is regular, and normal crossings after an
étale surjection (de Jong 1996, 2.3–2.4, p. 55; 3.1, p. 62); SNC is normal crossings, stable under
smooth pullback and sub-families, with regular Cartier components and local equations from regular
systems of parameters; normal crossings become strict after blow-ups in strata (2.4, 7.2, 4.28).
Checks: `V(xy)` is SNC; the nodal cubic is normal crossings and not SNC; `V(xy(x − y))` is not
normal crossings. *Lean:* `Formal.SNCData`, `Formal.IsStrictNormalCrossings`.

### 4.18 Split prestable curves, nodal families, fibrations and the curve-family alteration

**Nodal structure.** A split prestable family has fibre components smooth and geometrically
irreducible, rational nodes with rational branches (de Jong 1996, 2.21–2.22, p. 61); a finite
separable extension splits prestable curves with smooth geometric components. At a rational split
node over a Noetherian base, `O^∧_{X,x} = O^∧_{S,s}[[u, v]]/(uv − a)` with `a ∈ m_s`, and
étale-locally `O_S[u, v]/(uv − a)` (2.23, pp. 61–62; 3.3, p. 63). Over a DVR either `a = 0` (a
persistent node) or `a = επⁿ` with `n ≥ 1` and the unit absorbed by `u = εu'`, matching
StableReduction Layer 1; a smooth generic fibre forces `a ≠ 0`. Nodal families over regular bases
with normal crossings discriminant are resolved by blowing up nodes (§3, Proposition 3.6). Checks:
`V(XY) ⊆ ℙ²_{k[[π]]}` has node chart `uv = 0` and a persistent singular section; `uv = π` and `uv =
π²` take the positive branch, with Jacobian quotients `R/(π)` and `R/(π²)`; `uv = επ²` sends `(u,
v)` to `(εu', v')`. *Lean:* `Formal.DeJong.node_local_structure_dvr`,
`Formal.DeJong.node_local_structure_dvr_nonzero_of_generic_smooth`.

**Fibrations.** For projective pure `d`-dimensional `X` over an infinite field, a general projection
is finite to `ℙ^d`, and the projection from a point is resolved on the blow-up of its preimage with
nonempty pure one-dimensional fibres (de Jong 1996, §2.11; proof of Lemma 4.11). Over an
algebraically closed `k`, for `X` normal integral projective of dimension `d ≥ 1` and `Z` the
support of an effective Cartier divisor, after blowing up finitely many regular closed points
outside `Z` there is a projective `f : X' → Y` to an integral projective `(d − 1)`-dimensional `Y`,
with geometrically connected pure one-dimensional fibres, dense relative smooth locus, `Z'` finite
over `Y` and étale over a nonempty open, and `f` smooth over a nonempty open (pp. 67–69). Over any
field, an integral variety acquires after a finite (possibly inseparable) extension a geometrically
integral reduced component that alters it, and the fibration descends to a finite extension
(§§4.5–4.10, pp. 66–67). There is a divisor finite over `Y` meeting every fibre component in three
smooth points (Lemma 4.13), and stable models dominate strict transforms after modification
(4.18–4.21). *Lean:* `Formal.DeJong.curve_fibration_field_reduction`.

**Curve-family alteration.** Let `f : X → Y` be projective with `X`, `Y` integral excellent, fibres
nonempty equidimensional of dimension one with dense smooth locus. For a proper closed `Z ⊊ X` there
are alterations `ψ : Y' → Y`, `φ : X' → X`, a projective split prestable `f' : X' → Y'` with smooth
generic fibre and `φ ≫ f = f' ≫ ψ`, a divisor `D₁ ⊆ Y'` and disjoint sections in the smooth locus
with `(φ⁻¹Z)_red ⊆ (f'⁻¹D₁)_red ∪ ⋃ σ_i(Y')`: both vertical and horizontal boundary are allowed (de
Jong 1996, Theorem 5.8, p. 79; §§5.9–5.17). Checks: for `Y = 𝔸¹`, `X = ℙ¹_Y`, `Z = X_0`, no finite
union of sections contains `Z`, so `D₁ = {0}` is needed; the fibre over any point above `0` lies
over the fibre over `0`. *Lean:* `Formal.DeJong.curve_family_vertical_boundary`.

### 4.19 de Jong's alteration theorem over a field

**de Jong over a field.** For `X` integral separated of finite type over `k` and `Z ⊊ X` closed,
there are an alteration `φ : X_1 → X` from an integral `X_1` and an open immersion into a regular
scheme `X̄_1` projective over `k` such that the complement together with `j(φ⁻¹Z)` is the support of
a strict normal crossings divisor, with `φ` generically étale when `k` is perfect (de Jong 1996,
Theorem 4.1, Remark 4.2, p. 66; proof 4.3–4.28). Over arbitrary `k` the proof uses the field
reduction and descent of §4.18 and keeps the structural map through the finite extension; the
boundary retains the vertical divisor and the horizontal sections (§§4.22–4.28). Checks: the `𝔽₂(s,
t)` conic `X² + sY² + tZ²` is regular, so the identity works, and over `k(√s, √t)` it becomes a
double line; over an imperfect field `y² = x^p − t` has no generically étale smooth alteration with
the same function field. *Lean:* `Formal.DeJong.alteration_theorem`, recording properness of the
compactification.

### 4.20 Traits, `S`-varieties, strict semistability and the semistable alteration theorem

**Semistability.** A trait is a complete DVR; a finite extension of traits is a finite injective
local homomorphism, possibly inseparable, with ramification index the valuation of `φ(π)` (de Jong
1996, 2.12, p. 57); in the separable case Tau Ceti's `FiniteDVRExtension` is already complete and
finite. An `S`-variety is integral, separated, flat and of finite type over the trait (2.15, p. 59),
proper ones are Tau Ceti `Model`s, and after a finite extension of traits every reduced irreducible
component of the base change is an `S'`-variety altering `X` (6.8, p. 83). `X` is strictly
semistable if its generic fibre is smooth and its special fibre is the divisor of transverse
components with strata smooth over the residue field of the expected codimension (2.16, pp. 59–60);
then `X` is regular, its special fibre is SNC for perfect residue field, and locally `X` is smooth
over `R[t_1..t_r]/(t_1⋯t_r − π)`. A strict semistable pair adds a horizontal `SNCData` `H` with `X_s
∪ H` SNC and horizontal strata semistable (6.2–6.4). Faltings' lemma: for an excellent DVR and `X`
normal flat of finite type, a finite extension makes the normalization of the reduction of `O_{X,ξ}
⊗ R'` formally smooth at generic points of the special fibre (de Jong 1996, Lemma 2.13, pp. 57–59).
Checks: `ℤ_{(p)}` is not a trait; `ℤ_p → ℤ_p[√p]` has ramification index `2`; `Spec 𝔽_p → Spec ℤ_p`
is not an `S`-variety; `xy − p` is strictly semistable, `xy − p²` is not regular and `x² − p` has
nonreduced special fibre; `k[[t]] → k[[u]]`, `t ↦ u^p`, is an inseparable extension of traits.
*Lean:* `Formal.DeJong.IsTrait`, `Formal.DeJong.IsSVariety`, `Formal.DeJong.SemistableConditions`,
`Formal.DeJong.IsStrictlySemistable`, `Formal.DeJong.IsStrictSemistablePair`.

**Semistable alteration theorem.** For a trait `S = Spec R`, an `S`-variety `X` and a closed `Z ⊊ X`
containing `X_s`, there are a finite extension of traits `S_1 → S`, an `S_1`-variety `X_1`, an
alteration `φ : X_1 → X` over `S`, and an open immersion `j : X_1 → X̄_1` with `X̄_1` proper over
`S_1` with geometrically irreducible generic fibre, such that `(X̄_1, H)` is a strict semistable
pair with `support(X̄_{1,s_1}) ∪ support(H) = (X̄_1 ∖ j(X_1)) ∪ j(φ⁻¹Z)` (de Jong 1996, Theorem 6.5,
Diagram 6.6, p. 83; the stronger projectivity is outside this statement). The curve step uses the
relative projection of §6.13 after the trait extensions of §§6.8–6.12, and carries `D₁` and the
sections through the nodal resolution (§§6.14–6.16). Check: for `X = Spec R` and `Z = X_s` the
identity works with `H = ∅`. *Lean:* `Formal.DeJong.semistable_alteration_theorem`.

### Examples

`uv = t` and its smoothing, `Spf ℤ_p` and `Spf k[[t]]` against their spectra, the completion of `𝔸¹`
at the origin, the blow-up of `𝔸²` at the origin, `xy − p`, `xy − p²` and `x² − p` over `ℤ_p`,
`M̄_{0,3} = Spec ℤ`.

### Dependencies

Layer 0: §§0.9, 0.17–0.21, 0.23. Layer 1: §§1.18–1.20. Layer 2: §§2.3, 2.6. Layer 3: §3.6.
StableReduction Layers 0–4, 9; JacobianChallenge Layers C, E; ModularCurves 0G, 3D, 7D, 9D.

## Layer 5: intersection theory and Riemann–Roch

Intersection theory in the generality of Fulton's *Intersection Theory*, restricted to what the
arithmetic consumers use: Chow groups by rational equivalence, proper pushforward, flat pullback,
Chern classes and projective bundles, normal cones and refined Gysin maps, intersection products on
smooth varieties, `K_0` and `G_0` with the K-theoretic pushforward, Grothendieck–Riemann–Roch, and
surfaces up to the Hodge index theorem and the Weil bound. Inputs: Mathlib's algebraic cycles, Tau
Ceti's divisors and line-bundle classes, Layer 3's degrees, Layer 2's duality, Layer 0's relative
Proj and Layer 4's blow-ups.

**Conventions of this layer.** Schemes are locally of finite type over one fixed field `κ`, with
morphisms over `Spec κ`. `Z_k(X)` is Mathlib's `AlgebraicCycle X ℤ` graded by the dimension
`Order.height x` of the closure of a point; on a smooth variety of pure dimension `n`, `CH^p :=
CH_{n−p}`, and the two gradings are never mixed on singular schemes. Rational coefficients
`CH_k(X)_ℚ := CH_k(X) ⊗ ℚ` are named wherever used, and nothing proved with them is exported
integrally. Degrees of zero-cycles are taken on proper schemes. `ℙ(E) := relativeProj(Sym E^∨)`
parametrises lines in `E` with tautological quotient `O(1)` (Fulton 1998, Appendix B.5); the
quotient convention of ModularCurves 0G is related by `E ↔ E^∨`.

### 5.1 Rational equivalence, Chow groups and the divisor class comparison

**Chow groups.** `k`-cycles are cycles supported at points with `Order.height x = k`, the dimension
of the closure in Mathlib's specialisation order (coheight is codimension) (Stacks, Definition
42.8.1 (02QR), Lemma 42.7.5 (02QO)). A cycle is rationally equivalent to zero if it is `Σ_j (i_j)_*
div(r_j)` for integral closed subschemes `W_j` of dimension `k + 1`, nonzero rational functions
`r_j`, and a locally finite family of closed supports `|W_j|` (local finiteness of the divisors
alone is not enough), with coefficients from Mathlib's `Scheme.ord`; `CH_k(X)` is the quotient
(Definition 42.19.1, Remark 42.19.6 (02RV)), with no quasi-compactness or separation assumed.
`div(rs) = div r + div s`; for separated finite-type `X`, rational equivalence is generated by
`[V(0)] − [V(∞)]` for `V ⊆ X × ℙ¹` (Fulton 1998, Proposition 1.6); `CH_n` of an `n`-dimensional
finite-type scheme is free on its top components; `CH_k(∐ X_i) ≅ ∏ CH_k(X_i)` for any small family.
For `X` integral separated of finite type of dimension `n`, Tau Ceti's divisor class group is
`CH_{n−1}(X)`, and with `classGroupToLineBundleClass` it is the first Chern class `Pic → CH^1`, an
isomorphism for locally factorial `X` (Fulton 1998, §2.1; Stacks, §42.24 (02SI)). Checks: on a DVR
the closed point has height `0` and coheight `1`, and on `Spec K → Spec R` absolute dimension drops,
so this grading is restricted to schemes over a field; `CH_0(Spec κ) = ℤ`; on `∐_n 𝔸¹_κ` the locally
finite cycle with one origin per component is rationally equivalent to zero and `CH_0 = 0`, whereas
`CH_0(∐_n Spec κ) = ∏ ℤ`; infinitely many copies of one subscheme are not a locally finite family
although their divisors vanish; `CH_0(ℙ¹) = ℤ` by degree; on an elliptic curve `[P] − [Q] ∼ 0` iff
`P = Q`. *Lean:* `Chow.cyclesOfDimension`, `Chow.RatEquiv`, `Chow.ChowGroup`, `Chow.cycleClass`,
`Chow.CH_coprod`, with the DVR, point and countable-lines examples.

### 5.2 Proper pushforward, flat pullback and the localisation sequence

**Pushforward and pullback.** For `f` proper, `f_*[V] = [K(V) : K(f(V))][f(V)]` (zero if the
dimension drops), from Mathlib's `AlgebraicCycle.map`, preserves rational equivalence, is
functorial, and degree on proper schemes is compatible (Fulton 1998, Theorem 1.4; Stacks, §§42.12,
42.20, 42.41 (02R3, 02S0, 0AZ0)). For `f` flat with every fibre component of dimension `n` (Tau
Ceti's `PureRelativeDimension`), `f^*[V] = [f⁻¹V]` with multiplicities gives `CH_k(Y) →
CH_{k+n}(X)`, functorial, and for a cartesian square with `f` flat and `g` proper, `f^* g_* = g'_*
f'^*` (Fulton 1998, Theorem 1.7, Proposition 1.7; Stacks, §§42.14, 42.15 (02RA, 02RF)). For closed
`Y ⊆ X` with complement `U`, `CH_k(Y) → CH_k(X) → CH_k(U) → 0` is exact (Fulton 1998, Proposition
1.8); for a vector bundle of rank `r`, `CH_k(X) → CH_{k+r}(E)` is bijective (Proposition 1.9,
Theorem 3.3 (a)). Checks: on `𝔸¹`, `[0] ∼ 0` but has degree one, so pushforward needs properness;
for `g : Spec k' → Spec k` of degree `d`, both sides of the base-change formula on `[pt]` are
`d[𝔸¹]`.

### 5.3 The first Chern class

**First Chern class.** For an invertible `L`, `c_1(L) ∩ [V] := [C]` for the Weil divisor of a
Cartier divisor representing `L|_V`, descending to rational equivalence (Fulton 1998, §§2.3–2.5;
Stacks, §§42.25, 42.28 (02SN, 02TG)); additive, commuting, with projection formula and flat
compatibility (Theorem 2.4, Proposition 2.5), `c_1(O(D)) ∩ [V] = [D ∩ V]` for `V ⊄ D`, and on a
proper curve degree is §3.3's degree. Checks: `deg(c_1(O(m)) ∩ [ℙ¹]) = m`; `c_1(O(P − Q)) ≠ 0` on an
elliptic curve for `P ≠ Q`.

### 5.4 Projective bundles and Chern classes

**Projective bundles and Chern classes.** For `E` locally free of rank `e + 1`, `p : ℙ(E) → X` is
flat proper of relative dimension `e` with fibres `ℙ^e`, compatible with pullback, and `CH_k(ℙ(E)) =
⊕_{i ≤ e} c_1(O(1))^i ∩ p^*CH_{k−e+i}(X)` (Fulton 1998, Theorem 3.3 (b); Stacks, §42.36 (02TV)).
Segre classes `s_i(E) ∩ α = p_*(c_1(O(1))^{e+i} ∩ p^*α)` and Chern classes, the components of the
inverse series (Proposition 3.1, Theorem 3.2; Stacks, §§42.37, 42.43 (02TZ, 02UK)), vanish above the
rank, commute, satisfy projection, pullback and the Whitney formula, are computed by the splitting
principle (Fulton, §3.2), agree with §5.3 in rank one, and define the Chern character and Todd class
as operators on `CH_*(X)_ℚ` with `td_1 = c_1/2` and `td_2 = (c_1² + c_2)/12`. Checks: `CH_*(ℙ^e) =
ℤ[h]/(h^{e+1})`; `c(T_{ℙ^n}) = (1 + h)^{n+1}`; `c_i(E^∨) = (−1)^i c_i(E)`; `ℙ(O ⊕ O(1))` over `ℙ¹`
has a different intersection form from `ℙ¹ × ℙ¹`; the free sheaf of rank `r` has a unique rank on a
nonempty scheme.

### 5.5 Normal cones, deformation to the normal cone and refined Gysin maps

**Normal cones.** For a closed immersion with ideal `I`, the normal cone `Spec_X ⊕ Iⁿ/I^{n+1}`; for
a regular immersion (locally a regular sequence) the conormal `I/I²` is locally free and the normal
bundle is the total space of `(I/I²)^∨` (AlgebraicVectorBundles' `totalSpaceScheme`), equal to the
cone; cones pull back into `f^*N`, with excess sheaf `f^*N / N'`, so `c_1(N) = −c_1(I/I²)` for
Cartier divisors and the zero section of `E` has normal sheaf `E` (Fulton, §4.1, Theorems 6.2–6.3).

**Deformation and specialization.** The deformation space `M = Bl_{X × ∞}(Y × ℙ¹) ∖` (strict
transform of `Y × ∞`) is flat over `ℙ¹` with fibres `Y` and `C_X Y` (Fulton 1998, §5.2; Stacks,
§42.29 (02T7)). Construct in order: intersection with a Cartier divisor on supported Chow groups,
descending through rational equivalence; flat pullback to the open complement of the special fibre;
a lift by the localization sequence; intersection with the special fibre, independent of the lift
because its normal line is trivial; specialization `CH_k(Y) → CH_k(C_X Y)`, equal to the cycle-level
closure construction, compatible with flat pullback and proper pushforward. No pullback along `M →
Y` is used: it need not be flat. **Homotopy invariance** for vector bundles is proved before any
Gysin map, through the projective completion (Fulton 1998, Proposition 1.9, Theorem 3.3 (a)).
External products over `κ` (Fulton 1998, §1.10). The refined Gysin map of a regular immersion of
codimension `d` along any `f : Y' → Y` specialises to the cone in `f^*N` and inverts homotopy
invariance (Fulton 1998, §6.1; Stacks, §42.54 (0FBI)), compatible with pushforward, flat pullback
and `c_1`, with excess intersection `i^!α = c_{d−d'}(f^*N/N') ∩ i'^*α`, functoriality, the divisor
case, and self-intersection `i^!i_*α = c_d(N) ∩ α` (Theorems 6.2, 6.3, 6.5). Checks: in the
deformation chart of the origin in `𝔸²`, `κ[x, y] → κ[t, a, b]` is not flat; for the line `D ⊂ ℙ²`,
`I/I² = O_D(−1)` and `N = O_D(1)`; for a smooth curve on a surface `deg i^*[C] = C · C`; the residue
point of `Spec K[ε]/(ε²)` is not a regular immersion of codimension one.

### 5.6 Intersection products on smooth varieties

**Intersection products.** For `Y` smooth of pure dimension `n`, `α · β := δ^!(α × β)` via the
diagonal, a regular immersion of codimension `n`; `A(Y) = ⊕ CH^p(Y)` is a commutative graded ring
with unit `[Y]` (Fulton 1998, §8.1, Proposition 8.1.1; Stacks, §42.62 (0FC0)), with ring-map
pullbacks, projection formula, `c_1(L) ∩ α = c_1(L) · α`, positive multiplicities for proper
intersections, and `i^! = i^*` (Propositions 8.2, 8.3). Checks: `A(ℙ^n) = ℤ[h]/(h^{n+1})`; plane
curves of degrees `d, e` meet in `de` points with multiplicity; on `C × C`, `Δ² = 2 − 2g`; the cone
over a quadric surface has no integral product extending the rulings.

### 5.7 Coherent and perfect classes: `K_0`, `G_0` and the K-theoretic pushforward

**`K_0` and `G_0`.** `K_0(X)` is the Grothendieck group of finite locally free sheaves, a ring under
`⊗`; `G_0(X)` that of finitely presented (on Noetherian `X`, coherent) sheaves, a `K_0`-module;
`f^*`, rank, determinant, and the natural map `K_0 → G_0` on Noetherian schemes. For `f` proper with
Noetherian target, `f_![F] = Σ (−1)^i [R^i f_*F]` (coherent, not assumed locally free) is functorial
by Leray, with projection formula and localization `G_0(Z) → G_0(X) → G_0(U) → 0`. The resolution
property (every finitely presented module is a quotient of a finite locally free one) holds for
quasi-projective schemes over `κ`; for `X` regular Noetherian with the resolution property, `K_0 →
G_0` is bijective (Stacks, Lemma 36.37.4), which transports `f_!` to `K_0` for smooth
quasi-projective varieties (SGA 6, Exposé 0, Appendice; Fulton 1998, §15.1). The Chern character
`K_0 → A(X)_ℚ` is a ring map, and Chern classes of coherent sheaves on smooth quasi-projective `X`
use resolutions (Example 15.1.5). Checks: `K_0(ℙ¹) = ℤ²`; on the nodal cubic `K_0 → G_0` is not an
isomorphism; `f_![O(n)] = n + 1` for `ℙ¹ → Spec k`. *Lean:* `Chow.HasResolutionProperty`, `Chow.G0`,
`Chow.K0`, `Chow.K0.toG0`, `Chow.K0.toG0_bijective`.

### 5.8 Grothendieck–Riemann–Roch and Hirzebruch–Riemann–Roch

**Riemann–Roch.** For `f : X → Y` projective between smooth quasi-projective varieties and `α ∈
K_0(X)`, `ch(f_!α) · td(T_Y) = f_*(ch(α) · td(T_X))` in `A(Y)_ℚ`, proved for projective bundles and
for closed immersions by deformation to the normal cone (Fulton 1998, Theorem 15.2; Stacks, §42.66
(02UO)); for `X` smooth projective of dimension `n`, `χ(X, E) = deg(ch(E) · td(T_X))_n` (Corollary
15.2.1), recovering §3.3 and §5.10. Checks: `χ(ℙ^n, O(d)) = binom(n + d, n)`; `ch(i_*O_D) = 1 −
e^{−[D]}` for a smooth divisor.

### 5.9 Surfaces: the relative intersection pairing and the comparison with arithmetic surfaces

**Surface pairing.** For `S` smooth projective over a field, `C · D := deg(c_1(O(C)) ∩ c_1(O(D)) ∩
[S])` is the unique symmetric bilinear form on `Pic S` given by `Σ [κ(P) : k]` for transversal
curves, equal to `deg_C O(D)|_C` for integral `C` and to `Σ_P [κ(P) : k] length O_{S,P}/(f, g)`
without common components (Hartshorne 1977, V.1, Theorem 1.1, Proposition 1.4). For a regular
two-dimensional `S` proper flat over a field or Dedekind base, the relative pairing of divisors with
finite intersection is the same local length weighted by residue degree over the base, bilinear and
symmetric (also on vertical divisors), equal to the above over a field and to StableReduction Layer
4's intersection numbers over a DVR (Liu 2002, §9.1, Definition 9.1.14, Proposition 9.1.21). Checks:
two lines in `ℙ²` meet once; a conic and a tangent line give `2`; over `ℝ`, `x² + y² = z²` and `z =
0` meet in one point with residue field `ℂ`, contributing `2`.

### 5.10 Adjunction, Riemann–Roch on surfaces, Noether's formula, numerical equivalence, Hodge index

**Surface theory.** For `S` smooth projective over an algebraically closed field with canonical
class `K`: adjunction `2p_a(C) − 2 = C · (C + K)` (Hartshorne 1977, V.1, Proposition 1.5, Exercise
1.3); Riemann–Roch `χ(O(D)) = ½ D · (D − K) + χ(O_S)` with `h²(D) = h⁰(K − D)` (Theorem 1.6);
Noether's formula `12χ(O_S) = K² + deg c_2(T_S)`, an instance of HRR (Fulton 1998, Example 15.2.2),
the comparison with the ℓ-adic Euler characteristic being TraceFormula's. Numerical equivalence is
equality of all pairings; `Num S` is free of finite rank (Exercise 1.8). **Hodge index:** for `H`
ample and `D · H = 0`, `D² ≤ 0` with equality iff `D ≡ 0`, so the form has signature `(1, ρ − 1)` on
`Num S ⊗ ℝ`, proved from surface Riemann–Roch and the ample-section estimate (Lemma 1.7, Corollary
1.8, Theorem 1.9; the duality term does not vanish by growing `n` alone); Nakai–Moishezon: `D` is
ample iff `D² > 0` and `D · C > 0` for every curve (Theorem 1.10; Kleiman 1966), not an input to
Hodge index. Checks: smooth plane curves have genus `(d − 1)(d − 2)/2`; `χ(O(a, b)) = (a + 1)(b +
1)` on `ℙ¹ × ℙ¹`; `12 = 8 + 4` and `12 = 9 + 3`; `(1, −1)` has `D · H = 0` and `D² = −2`; `−H` fails
the curve condition.

### 5.11 The Weil bound via surfaces

**Weil bound.** For `C` smooth projective geometrically irreducible of genus `g` over `𝔽_q`,
`|#C(𝔽_q) − (q + 1)| ≤ 2g√q`. Proof on `S = C̄ × C̄` with `Γ` the graph of Frobenius, `Δ` the
diagonal and `F_1 = {P} × C̄`, `F_2 = C̄ × {P}`: `Γ · F_1 = 1`, `Γ · F_2 = q`, `Δ · F_i = 1`, `F_i²
= 0`, `F_1 · F_2 = 1`; `Δ² = 2 − 2g` and `Γ² = q(2 − 2g)` by adjunction; `Γ · Δ = #C(𝔽_q)` by
transversality (`dF = 0`); the normalised `Γ_0 = Γ − qF_1 − F_2` and `Δ_0 = Δ − F_1 − F_2` are
orthogonal to `H = F_1 + F_2` with `Γ_0² = −2gq`, `Δ_0² = −2g`, `Γ_0 · Δ_0 = #C(𝔽_q) − (q + 1)`, and
Hodge index gives `(Γ_0 · Δ_0)² ≤ Γ_0² Δ_0²` (Milne 2024, Chapter 11, Theorem 11.53, Corollary
11.54, Example 11.55, pp. 37–38; Milne's horizontal and vertical fibres are our `F_2` and `F_1`).
The Frobenius graph is FrobeniusGeometry Layer 3's. Checks: genus zero forces `#C(𝔽_q) = q + 1`;
genus one is `WeierstrassCurve.hasse_bound`; the Hermitian curve `y^q + y = x^{q+1}` over `𝔽_{q²}`
attains the bound. *Lean:* `weil_bound`, stated with `Curve.genus` and rational points over `Spec
k`.

### 5.12 Bézout's inequality

**Bézout.** For equidimensional closed `V, W ⊆ ℙ^n_k`, `Σ_Z deg Z ≤ deg V · deg W` over the
components of `V ∩ W`, with equality `Σ_Z i(Z; V · W) deg Z = deg V · deg W` for proper
intersections with `dim V + dim W ≥ n`; the inequality needs neither smoothness nor properness
(Fulton 1998, Example 8.4.6, §12.3, Theorem 12.3, Example 12.3.1). Checks: two skew lines in `ℙ³`
give `0 ≤ 1` with no equality; a line and itself give `1 ≤ 1`.

### Examples

`A(ℙ^n) = ℤ[h]/(h^{n+1})`, Bézout in the plane, `C × C` with `Δ² = 2 − 2g`, Noether's formula on
`ℙ²` and `ℙ¹ × ℙ¹`, the Hermitian curve attaining the Weil bound, and `K_0 ≠ G_0` for the nodal
cubic.

### Dependencies

Layer 0: §§0.2–0.3. Layer 2: §§2.2, 2.6, 2.20. Layer 3: §§3.3–3.4. Layer 4: §§4.11, 4.13.
AlgebraicVectorBundles L0B–L2B; StableReduction Layers 2, 4; JacobianChallenge Layer B;
AlgebraicCurves Layer 8; FrobeniusGeometry Layer 3.

## Downstream consumers

The perfectoid and adic roadmaps import henselization of pairs (§0.12), the excellence package
(§0.21) and the pro-étale foundations (§2.17). The CohomologicalPointCounting family consumes the
sites and coefficient sheaves of §§2.9–2.11, the `𝔾_m`-cohomology of curves (§2.16), universal
homeomorphisms (§0.23) and Hilbert 90 (§2.11), through the edges listed under scope.
AlgebraicModuliForArithmeticGeometry imports torsors and their classes (§1.15), algebraic stacks
(§§1.18–1.23), Picard torsors (§3.6) and projective bundles (§5.4).
NeronModelsAndSemistableAbelianVarieties imports formal functions and algebraization (§§4.9–4.10)
and the semistable alteration theorem (§4.20). EtaleDualityAndPerverseSheaves imports coherent
duality (§§2.18–2.21) and the pro-étale foundations. AbelianSchemesAndArithmeticModuli imports Chow
groups and numerical equivalence (§§5.1–5.10). The Weil-conjectures roadmap imports the Weil bound
(§5.11). IntegralHeckeAndGaloisDeterminants imports `Ring.IsJapanese.of_complete_local` and
`Ring.IsNagata.of_complete_local` (§0.20) and `IsAzumaya.exists_etale_matrix_splitting` with its
finite-cover form (§2.22). JacobianChallenge Layer C consumes
`Scheme.Modules.Cohomology.formalFunctionsIso` (§4.9) after its own finiteness and pushforward
prerequisites. StableReduction consumes nothing from this roadmap.

## References

- Stacks: *The Stacks Project*, https://stacks.math.columbia.edu (tags in parentheses).
- Fulton 1998: W. Fulton, *Intersection Theory*, 2nd ed., Ergebnisse 3/2, Springer 1998.
- Hartshorne 1977: R. Hartshorne, *Algebraic Geometry*, GTM 52, Springer 1977.
- Liu 2002: Q. Liu, *Algebraic Geometry and Arithmetic Curves*, Oxford GTM 6, 2002.
- Kleiman 1966: S. Kleiman, *Toward a numerical theory of ampleness*, Ann. of Math. 84 (1966).
- EGA I: Grothendieck–Dieudonné, *EGA I*, Publ. IHÉS 4 (1960).
- EGA IV₃: Grothendieck–Dieudonné, *EGA IV, troisième partie*, Publ. IHÉS 28 (1966).
- SGA 4 XVI: M. Artin, *Théorème de changement de base par un morphisme lisse, et applications*, SGA
  4, Exposé XVI, LNM 305.
- SGA 6: Berthelot–Grothendieck–Illusie, *Théorie des intersections et théorème de Riemann–Roch*,
  LNM 225.
- Grothendieck 1957: *Sur quelques points d'algèbre homologique*, Tôhoku Math. J. 9 (1957).
- Grothendieck 1966: *On the de Rham cohomology of algebraic varieties*, Publ. IHÉS 29 (1966).
- Grothendieck Brauer I, II: *Le groupe de Brauer I–II*, Dix exposés sur la cohomologie des schémas
  (1968).
- Deligne–Mumford 1969: *The irreducibility of the space of curves of given genus*, Publ. IHÉS 36.
- Deligne 1985: *Le lemme de Gabber*, Astérisque 127, [§§3.3–3.7, pp.
  137–140](https://www.numdam.org/item/AST_1985__127__131_0.pdf).
- Knudsen 1983, II: *The projectivity of the moduli space of stable curves, II: The stacks M_{g,n}*,
  Math. Scand. 52, 161–199.
- de Jong 1996: A. J. de Jong, [*Smoothness, semi-stability and
  alterations*](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf), Publ. IHÉS 83 (1996), pp.
  51–93.
- Morel–Voevodsky 1999: *A¹-homotopy theory of schemes*, Publ. IHÉS 90.
- Milne 2024: J. S. Milne, [*Algebraic Geometry*, Chapter 11,
  *Surfaces*](https://www.jmilne.org/math/CourseNotes/AG11.pdf), version 2024-11-04.
- Milne, *Algebraic Groups* (2017), https://www.jmilne.org/math/Books/iAG2017.pdf.
- Milne LEC: *Lectures on Étale Cohomology* (v2.21),
  https://www.jmilne.org/math/CourseNotes/LEC.pdf.
- Milne 2008: *Abelian Varieties* (course notes v2.00),
  https://www.jmilne.org/math/CourseNotes/AV.pdf.
- Huber 1996: *Étale cohomology of rigid analytic varieties and adic spaces*, Aspects of Mathematics
  E30, Vieweg.
- Scholze 2017: *Étale cohomology of diamonds*, https://arxiv.org/abs/1709.07343.
- Bhatt–Scholze 2014: *The pro-étale topology for schemes*, https://arxiv.org/abs/1309.1198v2.
- Bhatt–Scholze 2017: *Projectivity of the Witt vector affine Grassmannian*,
  https://arxiv.org/abs/1507.06490v3.
- Bhatt–Scholze 2022: *Prisms and prismatic cohomology*, Ann. of Math. 196,
  https://arxiv.org/abs/1905.08229.
- Bhatt–Morrow–Scholze 2018: *Integral p-adic Hodge theory*, Publ. IHÉS 128,
  https://arxiv.org/abs/1602.03148.
- Bhatt–Ma–Patakfalvi et al. 2020: *Globally +-regular varieties and the minimal model program for
  threefolds in mixed characteristic*, https://arxiv.org/abs/2012.15801v3.
- Zhu 2017: *Affine Grassmannians and the geometric Satake in mixed characteristic*,
  https://arxiv.org/abs/1407.8519v3.
- Clausen–Mathew–Morrow 2021: *K-theory and topological cyclic homology of henselian pairs*,
  https://arxiv.org/abs/1803.10897v2.
- Česnavičius 2018: *Purity for the Brauer group*, https://arxiv.org/abs/1711.06456v4.
- Česnavičius 2021: *Macaulayfication of Noetherian schemes*, https://arxiv.org/abs/1810.04493v2.
- Boxer–Calegari–Gee–Pilloni 2021: *Abelian surfaces over totally real fields are potentially
  modular*, https://arxiv.org/abs/1812.09269v3.
- Klevdal–Patrikis 2024: *Compatibility of canonical ℓ-adic local systems on adjoint Shimura
  varieties*, https://arxiv.org/abs/2303.03863v2.
- Couveignes 2019: *Enumerating number fields*, https://arxiv.org/abs/1907.13617v2.
- Kisin 2017: *Mod p points on Shimura varieties of abelian type*, J. AMS 30.
- van Hoften 2024: *Mod p points on Shimura varieties of parahoric level*,
  https://arxiv.org/abs/2010.10496v4.
- Poonen 2017: *Rational points on varieties*, GSM 186, AMS.
- Cadman 2005: *Using stacks to impose tangency conditions on curves*,
  https://arxiv.org/abs/math/0312349v3.
- Conrad 2005: *The Keel–Mori theorem via stacks*,
  https://math.stanford.edu/~conrad/papers/coarsespace.pdf.
- Abramovich–Olsson–Vistoli 2008: *Tame stacks in positive characteristic*,
  https://arxiv.org/abs/math/0703310v1.
- Nitsure 2005: *Construction of Hilbert and Quot schemes*, https://arxiv.org/abs/math/0504590v1.
- Harpaz–Wittenberg 2023: *The Massey vanishing conjecture for number fields*,
  https://arxiv.org/abs/1904.06512v2.
- Kings–Sprang 2019: *Eisenstein–Kronecker classes, integrality of critical values of Hecke
  L-functions and p-adic interpolation*, https://arxiv.org/abs/1912.03657v4.
- Yun–Zhang 2017: *Shtukas and the Taylor expansion of L-functions*,
  https://arxiv.org/abs/1512.02683.
- Bhargava–Gross–Wang 2017: *A positive proportion of locally soluble hyperelliptic curves over ℚ
  have no point over any odd degree extension*, https://arxiv.org/abs/1310.7692.
- Betts–Stix: *Galois sections and p-adic period mappings*,
  https://www.math.uni-frankfurt.de/~stix/research/preprints/.
- Benoist–Wittenberg 2020: *On the integral Hodge conjecture for real varieties, I*, Invent. Math.
  222.
- Benoist 2019: *The period-index problem for real surfaces*, Publ. IHÉS 130.
- The Tau Ceti roadmaps cited by name are those of https://github.com/TauCetiProject/TauCetiRoadmap.

# Roadmap: modularity of elliptic curves over imaginary quadratic fields

**Summary.** Assuming `LevelFifteenModels`, `QuadraticLevelFifteenTorsion`,
`GenusOneModel`, `GenusOneJacobian`, `GenusOneRationalPicard`,
`GenusOneQuadraticPoints`, `GaussianComparisonData` and `ExceptionalCurveData`, prove modularity of every
elliptic curve over an imaginary quadratic field F for which X₀(15)(F) is finite. The condition is equivalent to rank zero for
the elliptic modular curve X₀(15) over F. It holds for ℚ(i), ℚ(√−2), ℚ(√−3)
and ℚ(√−5). The roadmap proves these conclusions under the explicit
arithmetic hypotheses below, including `SmallFieldRanks` for the four
small-field applications. The source establishes the corresponding unconditional results:
Caraiani–Newton, Theorem 1.1, p.2, and Corollary 7.1.2, p.93, in
the version specified in the references below. The field ℚ(√−10), where
X₀(15) has a nontorsion point, is a test that the finite-point condition has
real mathematical content.

This roadmap starts with modularity over ℚ from
EllipticCurveModularity R29.6. It builds the applications
of Caraiani–Newton's CM lifting theorem: modular auxiliary curves with prescribed
reduction at 3 or 5; modularity from cyclotomic residual irreducibility; a density
theorem for integral equations; and the modularity consequences of quadratic-point classifications on four
exceptional modular curves. The genus-one classification is an explicit input;
the genus-two and bielliptic-quartic classifications follow from explicit
model, divisor-table and local-image hypotheses. These curves have genus one, two and three. Their
divisor arguments form reusable applications of the Picard, Jacobian and
effective Diophantine theories supplied by the surrounding roadmaps.

The main conditional CM theorem applies to a field F with ζ₅∉F and an elliptic
curve whose mod-3 or mod-5 representation is both decomposed generic and
absolutely irreducible after restriction to the cyclotomic field. For imaginary
quadratic F the second condition implies the first. Analysis of the exceptional
residual images then proves modularity assuming ordinary irreducibility at 5,
or ordinary irreducibility at 3 with one precise split-normalizer exclusion.
The finite X₀(15) hypothesis handles the cases left by this stronger criterion.

The modularity seed in the switching construction comes from the independent
Allen–Khare–Thorne CM lifting theorems. Its hypotheses at 2 and 3 permit good
supersingular reduction at every place above 5. At 3, a separate ordinary mod-5
seed permits the corresponding supersingular choices. This separation is part
of the dependency order: the seed must not use the CM modularity theorem that
the switching construction is intended to prove.

Suggested home: `TauCeti/NumberTheory/EllipticCurve/ImaginaryQuadraticModularity`.
The names in [Suggested.lean](Suggested.lean) belong to
`TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic`. That file records
representative statements over the pinned carriers; this document specifies all
mathematical constructions, comparisons and endpoints.

## Scope and ownership

This roadmap owns the Caraiani–Newton applications of CM lifting, the auxiliary
elliptic curves with prescribed reduction, the density theorem for coefficient
pairs, the modularity arguments from the stated genus-one and level-fifteen
arithmetic inputs, and the genus-two and bielliptic-quartic modularity
arguments under the explicit arithmetic hypotheses.
It connects these results to modularity over fields satisfying the finite
X₀(15)-point hypothesis. General elliptic-curve, local Galois, p-adic Hodge,
automorphic, Picard and sieve theory belongs to the suppliers below.

The Q-curve application uses *Modularity of elliptic curves, Part II:
GL₂-type abelian varieties over ℚ*
(`EllipticCurveModularityPartIIGL2TypeAbelianVarieties`). Its interface is
modularity of the non-CM quadratic Q-curves arising from a geometric isogeny to
their conjugates, by the GL₂-type abelian-variety construction over ℚ and
automorphic descent/base change. Layer 5 and Layer 6 only identify the required
geometric isogeny; they do not construct a second GL₂-type theory. The same modular-curve comparisons also support effective modularity applications.

The underlying affine coarse modular curves and rational-base fixed-pairing twists belong to
`TauCetiRoadmap.ModularCurves`, Layers 5C and 9. The rational-base compactified twists, Cartan curves and their point dictionary belong to
ModularCurvesPartII §§5.14, 6.4–6.5 and 9.6–9.7. Layer 0 constructs the fixed-pairing twists for arbitrary number-field representations, proves their rationality at p=3,5, and constructs the mixed level-six twists used in discriminant coupling. Use the supplied coarse objects directly, with the mixed-level normalization supplied by ModularCurvesPartII §§3.12 and 5.2.
Their normalized coordinates and mixed-level identifications below are explicit
arithmetic hypotheses. The discriminant coupling and independent CM lifting
arguments are the targets of Layer 0.

Divisor classes and line-bundle degree belong to `TauCetiRoadmap.JacobianChallenge`,
Layer A. Its Layers B–F own Riemann–Roch, symmetric powers, the relative Picard
functor, representability of Pic⁰ and the Abel–Jacobi morphism. The current Tau
Ceti library supplies
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupAddEquivLineBundleClass`,
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero`
and `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` in
`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/{Picard,PicZero}.lean` and
`TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean`. The divisor equivalence
uses a Noetherian integral curve with discrete valuation rings at its
codimension-one points; the degree-zero equivalence additionally uses properness
over a field and the library's finite-dimensional H¹ hypothesis for the trivial
invertible sheaf. Rigidification requires a section. Those constructions are
consumed, not reconstructed.
Their existence does not identify a rational divisor class with every rational
Jacobian point, nor supply a Jacobian variety for a pointless curve. The
source-specific arithmetic hypotheses and the derived comparisons retain that
distinction. The model, torsion, genus-one Jacobian, rational-divisor descent and
quadratic-point computations named below are supplied as mathematical hypotheses;
proving those input facts is outside this roadmap. Their exact statements and
sources are part of the theorem interface.

Torsion and Tate-module carriers belong to `TauCetiRoadmap.EllipticCurves`,
Layer 2, and the current library's EllipticCurve/TateModule modules, including
`WeierstrassCurve.tateModuleGaloisRepresentation` in
`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`, acting on the
ℤℓ Tate module by coefficient-field automorphisms. This integral representation
is an ingredient of the rational/dual comparison contract, not its replacement.
Number-field completions, weak approximation,
finite extension arithmetic and profinite Galois theory belong to
`GlobalNumberFields`, `LocalGaloisGroups` and `ProfiniteArithmetic`. No general
replacement for any of these interfaces is a target here.

## Conventions

Work over characteristic-zero number fields unless a target explicitly states
a more general coefficient ring. A CM field is a totally imaginary quadratic
extension of a totally real number field. The involution c is complex conjugation
over its maximal real subfield. For an imaginary quadratic field σ denotes its
nontrivial ℚ-automorphism. An elliptic equation means a five-coefficient
[`WeierstrassCurve`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean) with its existing `IsElliptic` instance. Its equation is
y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆; over a field ellipticity means Δ≠0.
Geometric complex multiplication refers to the endomorphism ring over an
algebraic closure, so it is independent of whether the CM field lies in F.

Write rE,p for the covariant rational Tate representation and εp for the p-adic
cyclotomic character. The supplied `TauCeti.det_tateModuleGaloisRepresentation` gives `det(rE,p)=εp` after rationalization. The weight-zero
automorphic representation realizes rE,p∨, with determinant εp⁻¹. Fix
Caraiani–Newton's convention HT(εp)=−1 and labeled weights {0,1} for the dual.
When an imported p-adic Hodge interface uses HT(εp)=+1, translate the weight
convention explicitly. Use the Tate-normalized local Langlands correspondence
recᵀ. Frobenius semisimplification of a Weil–Deligne representation keeps its
monodromy operator N; forgetting N loses the distinction between a good place
and a Steinberg place.

For a residual representation, decomposed genericity means that there exists
one rational prime q≠p split completely in F such that, at every v|q, the
representation is unramified and its Frobenius eigenvalue quotient is neither q
nor q⁻¹. Merely finding two distinct eigenvalues at one place does not suffice.
The local preparation chooses q>5 and splits every place above q in its CM
extension. Linear disjointness preserves the full residual image when the
avoidance field contains the field cut out by that representation. The generic
witness and this full-image condition are separate parts of the interface.

The notation bp means an upper triangular Borel in GL₂(𝔽p), sp the normalizer
of a split Cartan, and nsp the normalizer of a nonsplit Cartan. The actual
nonsplit Cartan at 3 is ns3°. In particular ns3° and ns3 are different groups.
All H used for coarse modular curves contain −I and have surjective determinant.
X(H) is smooth and proper; mixed-level curves are normalizations of the coarse
fiber product over X(1), with j and all level projections extended to the
proper model. Their cusps are precisely the fiber j⁻¹(∞). A geometric coarse
point records an isomorphism class with a Galois-fixed orbit of level structures;
it does not supply a universal elliptic curve on the coarse curve.

The rational functions are elements of Mathlib's `RatFunc ℚ`. Geometric map
degree is the maximum of the reduced numerator and denominator degrees.
`RatFunc.intDegree` is their difference. Evaluation at a pole is totalized to
zero in the field, whereas the proper j-morphism takes the value ∞. In the
weighted quartic Y has weight 2; in the hyperelliptic sextic Y has weight 3.
The two plane quartics use ordinary projective triples [X:Y:Z]. Literal
coordinate triples, a smooth proper curve, and a point on that curve are
separate objects connected by the model comparison.

Distinguish rational divisors modulo rational linear equivalence from rational
points of the Jacobian. Without a rational point on a genus-one curve, descent
of a rational Jacobian class can have a Brauer–Severi obstruction. A quadratic
closed point gives its rational conjugate degree-two divisor; Sym² also contains
sums of rational points. Use the actual divisor and Picard interfaces throughout,
including the canonical class and infinity charts.

The explicit arithmetic inputs assert birational inverse identities, divisor
relations, algebraic rank bounds, saturation, good-reduction group identities,
residual images and emptiness of finite bad-coset intersections. These are
mathematical hypotheses, with no requirement to implement a procedure or produce
a computation artifact. A database label, numerical analytic rank or bounded
search does not imply them. Small polynomial substitutions remain worked Checks.

## Exact supplier contracts

The general theories in the following table have a single owner. This roadmap
owns the prescribed-reduction and explicit-curve applications. References to
these interfaces always mean their stated hypotheses, with no stronger theorem inferred from a title.

| Supplier | Interface used here |
|---|---|
| EllipticCurveModularity R29.6, “The three equivalent modularity formulations” | Modularity over ℚ, transported to the dual-Tate normalization, for rational-j models. |
| ArithmeticGaloisRepresentations §§4.2–4.7 | Borel/Cartan subgroups, Dickson classification, Goursat and cyclotomic restriction; the p=5 projective-field exclusion in §4.7. The two source-specific genericity implications are targets of Layer 0. |
| ArithmeticGaloisRepresentations §§5.1–5.5 | Semisimple recognition from Frobenius polynomials and coefficient descent. The finite Faltings–Serre comparison used here is the additional target of §0.4. |
| ArithmeticGaloisRepresentations Layer 6; EllipticCurves Layers 1–4 and 6 | Torsion, Weil pairing, covariant/dual Tate modules, determinant, isogeny functoriality, reduction and finite generation. |
| FaltingsFinitenessAndIsogenyTheorems §§R28.6.2–R28.6.3 | Elliptic Tate semisimplicity and the Tate Hom comparison over every number field. For non-CM E and finite L/F, semisimplicity and End_GL(VpE)=End_L(E)⊗ℚp=ℚp give absolute irreducibility, also after restriction to any open subgroup. |
| ShimuraVarieties §5.6, `TauCeti.Shimura.cm_potential_good_reduction` | Potential good reduction everywhere for full-CM abelian varieties; for geometric CM elliptic curves first extend the number field to define the CM endomorphisms. |
| GL2AutomorphicRepresentationsAndTransfer R16.0, R16.3–R16.4, R16.6 and R17.4 | Tate-normalized LLC, regular algebraic cuspidal GL₂ representations, classical/Hilbert weights, strong multiplicity one and soluble base change/descent. The CM weight convention is fixed here by CN §2. |
| AutomorphicGaloisRepresentationsPartII AG2.P and AG2.5–AG2.7 | Attached representations over CM or totally real fields, coefficient fields, residual lattices, semisimplified local comparison, the monodromy bound, existential decomposed genericity and infinitely many witnesses. Full elliptic monodromy comparison is the target `automorphic_wd`, using elliptic purity. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.19, R07.5 and R07.6.1; AutomorphicGaloisRepresentationsPartII AG2.P | Integral/crystalline and potentially semistable comparison carriers, finite-flat elliptic torsion, and the weight conventions needed by §3.1. |
| GlobalGaloisDeformations R04.3–R04.6; LocalGaloisDeformationRings Layers 1–6 and 8; DeformationAndDerivedPatchingAlgebra Layers 5–9 | Local/global deformation problems, ordinary and Barsotti–Tate components, and ring/module/complex patching for the independent lifting targets. |
| AutomorphicGaloisRepresentations Layers 3–7 | Hilbert attachment, local compatibility, ordinary families and residual representations for the real-quadratic branch. |
| NumberFieldArithmetic, “What Mathlib supplies”; LocalFieldsRamification Layer 2; ClassFieldTheory §5.4 | Hermite finiteness, local ramification bounds and quadratic-extension theory for the finite comparison. |
| InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.7 | Hilbert irreducibility with finitely many local open conditions and disjoint specialization; §2.1 owns its CM solvable-globalization application with avoidance. |
| ModularCurvesPartII §§3.12, 5.14, 6.4–6.5, 9.5–9.7 and 13.1 | Compactified full-level twists from representations over ℚ and their base changes, coarse Cartan curves and the image/point dictionary, split-Cartan comparisons and Jacobian functoriality. The AKT discriminant coupling is §0.2 here. |
| EffectiveDiophantineMethods Layer 3, §§4.20–4.22 and 5.24 | Descent and Mordell–Weil subgroup theory, symmetric and relative symmetric Chabauty, and the relative symmetric Mordell–Weil sieve. The concrete rank, torsion and finite local-image data are hypotheses here. |
| EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.6 | Modularity of non-CM quadratic Q-curves from geometric conjugate isogenies, without requiring those isogenies to be defined over the quadratic field. |

The independent AKT lifting theorems, the qualified CN lifting theorem, the
finite representation comparison, the rank-equal bielliptic inclusion and the
real-quadratic modularity theorem are targets of Layer 0. The quantitative
coefficient estimate is a target of §3.2. Their mathematical statements are
specified here rather than attributed to an unspecified supplier.

Tau Ceti's elliptic and geometric roadmaps supply the following interfaces.
These section citations are abbreviated to the displayed labels in each target's
prerequisites.

| Label | Stage ID and required output |
|---|---|
| EC isogenies | EllipticCurves Layer 1: geometric endomorphisms, CM and isogenies. |
| EC torsion | EllipticCurves Layer 2: torsion bases, Weil pairing and Tate modules. |
| EC finite fields | EllipticCurves Layer 3: Hasse bounds and elliptic Frobenius purity. |
| EC local reduction | EllipticCurves Layer 4: good, ordinary, supersingular and multiplicative reduction, Tate uniformization, potential good reduction and its j-integrality criterion. |
| EC Mordell–Weil | EllipticCurves Layer 6: finite generation. Quadratic rank decomposition is the target of §0.6 here, using its Layer 5 twist comparison. |
| Weak approximation | GlobalNumberFields Layer 1: simultaneous local approximation, including its projective-line application. |
| Modular twists | ModularCurves §5C and ModularCurvesPartII §5.14: fixed-pairing twists for representations over ℚ and their base changes. The arbitrary-number-field construction is §0.2 here. |
| Coarse quotient | ModularCurves Layer 9 and ModularCurvesPartII §§5.2, 9.6–9.7: affine coarse quotients, compactified Cartan curves and their point dictionary. |
| Jacobian A | JacobianChallenge Layer A: divisors, rational linear equivalence, degree and Picard groups. |
| Jacobian B | JacobianChallenge Layer B: genus, canonical classes, Riemann–Roch and complete linear systems. |
| Jacobian C | JacobianChallenge Layer C: symmetric powers, rational degree-two divisors and base change. |
| Jacobian D | JacobianChallenge Layer D: the relative Picard functor and Jacobian, without a rational basepoint; the rational-divisor descent comparisons below use this carrier. |

Each supplier citation names its owning roadmap and section. Within a target,
the short labels in the preceding table have exactly those meanings. Local
references give `Layer n` or a section number and the target name.

### Adopted modular-curve interfaces

The Layer 0 `fixed_pairing_twist` construction has the following contract, extending ModularCurvesPartII §5.14 beyond base changes of representations over ℚ. For p∈{3,5}, a number field F and continuous ρ̄:GF→GL₂(𝔽p) with det ρ̄=ε̄p, use the smooth affine twist Yρ̄/F of the fixed-pairing full-level curve. For every extension K/F its K-points classify pairs (A/K,α), up to isomorphism, where A is elliptic and α:𝔽p²≅A[p](K̄) is a GK-equivariant symplectic identification with the restriction of the given ρ̄, with the standard determinant pairing on ρ̄ matched to the Weil pairing. For p=3 the simultaneous sign automorphism and the actual rigidified moduli problem must be treated through the upstream level-structure construction; no coarse universal curve is assumed. Its smooth proper completion has geometric genus zero. (CN, Proof of Proposition 6.1.5, p.89; AKT §9, twists in Lemmas 9.6–9.7, pp.74–76.)

*Needs:* Layer 0 `fixed_pairing_twist`, EC torsion, ArithmeticGaloisRepresentations §6.1.

Its point, base-change and genus-zero interfaces are used as follows.

- The stated K-point classification holds naturally in K/F, with symplectic isomorphisms and the correct isomorphism relation.
- For an extension K/F the base change of Yρ̄ is canonically the twist associated to ρ̄\|GK; these identifications satisfy identity and composition.
- If the smooth completion has an F-point, its genus-zero curve is F-isomorphic to ℙ¹, and Yρ̄ is the corresponding complement of the cusps.

**Checks.**

- For ρ̄=A[p] in a symplectic basis, (A,id) gives an F-point of Yρ̄.
- At p=5, the change of level basis diag(2,1) multiplies the Weil pairing exponent by 2 and is not symplectic; it cannot act as a pairing-preserving identification.
- Over a local field K containing μp, the trivial ρ̄ and any A with all p-torsion K-rational yield a K-point after choosing a symplectic basis; geometric genus zero alone does not assert a K-point.

The adopted ModularCurvesPartII §§5.2 and 9.6–9.7 coarse-curve contract is as follows. Over ℚ, for a prime p and H⊂GL₂(𝔽p) containing −I with surjective determinant, X(H) is the smooth proper compactification of the imported affine coarse curve YH; j:X(H)→X(1)=ℙ¹ extends its j-map. For distinct primes p₁,p₂ and such H₁,H₂, X(H₁,H₂) is the smooth projective normalization of X(H₁)×X(1)X(H₂). Cusps are exactly j⁻¹(∞). The application subgroups are Borel bp, split and nonsplit normalizers sp,nsp, and actual nonsplit Cartan ns3°. The same formula cannot identify ns3° with the normalizer ns3. (CN, §7.1, pp.92–93, definition of X(H) and X(H₁,H₂).)

*Needs:* Coarse quotient, ModularCurvesPartII §§9.6–9.7, Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`, ArithmeticGaloisRepresentations §4.2.

The supplied interfaces have these meanings.

- There is a finite j-morphism to ℙ¹ℚ extending the affine coarse j-map; its inverse image of infinity is exactly the cusps.
- The mixed curve, with both projections, is uniquely the smooth proper normal model of the coarse fiber product’s function field; on its dense open it is the original mixed level moduli curve.
- An elliptic E/F with a simultaneous H₁×H₂ orbit of torsion bases fixed by GF gives a noncuspidal F-point with j=j(E). Conversely a geometric coarse point is such a geometric isomorphism class with a GF-fixed orbit; for non-CM j≠0,1728 one may choose an F-model and any two have the same quadratic-twist class. This is a coarse statement, not a fine universal elliptic curve over X(H₁,H₂).

**Checks.**

- X(b3,b5) is the compactified X₀(15), with cusps j=∞ and rational noncuspidal points representing rational cyclic 15-isogeny level.
- The map X(ns3°)→X(ns3) has degree two; treating Cartan as its normalizer would give degree one and destroy the branched genus-one/quartic models.
- A mixed point from E has ηᵢ⁻¹r̄E,pᵢ(GF)ηᵢ⊂Hᵢ separately for i=1,2; it does not use one residual prime in both conditions.

### From Mathlib and the pinned Tau Ceti library

Consume Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are ingredients,
not new constructions requested by this roadmap.

| Mathlib declaration | Meaning and module |
|---|---|
| `WeierstrassCurve`, `WeierstrassCurve.Δ`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.j`, `WeierstrassCurve.baseChange` | Five coefficients, discriminant, unit-discriminant instance, j and coefficientwise base change; [Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean). |
| `WeierstrassCurve.Affine.Equation` | The existing affine equation predicate; [Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean). |
| `WeierstrassCurve.Affine.Point.mk` | An equation proof on an elliptic curve constructs an actual nonsingular affine point, distinct from infinity; its field-valued points have the existing additive group; [Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean). |
| `RatFunc.mk` | A polynomial fraction, with zero denominator totalized to zero; [Mathlib/FieldTheory/RatFunc/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/Defs.lean). |
| `RatFunc.eval` | Evaluation of the reduced numerator and denominator through a coefficient hom; [Mathlib/FieldTheory/RatFunc/AsPolynomial.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean). |
| `RatFunc.intDegree` | Integer numerator-degree minus denominator-degree; [Mathlib/FieldTheory/RatFunc/Degree.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/Degree.lean). |
| `Polynomial.X`, `Polynomial.eval` | Literal quartic/sextic expressions and their evaluations; [Mathlib/Algebra/Polynomial/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Polynomial/Basic.lean), [Mathlib/Algebra/Polynomial/Eval/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Polynomial/Eval/Defs.lean). |
| `MvPolynomial.X`, `MvPolynomial.eval₂` | Homogeneous ternary expressions and coefficient-compatible evaluation; [Mathlib/Algebra/MvPolynomial/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Basic.lean), [Mathlib/Algebra/MvPolynomial/Eval.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Eval.lean). |
| `AlgebraicGeometry.Scheme.Hom.normalization` | Relative integral-closure normalization of a quasi-compact, quasi-separated morphism; [Mathlib/AlgebraicGeometry/Normalization.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/Normalization.lean). It is an ingredient of the compactification comparison. |

| Tau Ceti declaration | Meaning and module |
|---|---|
| `WeierstrassCurve.tateModuleGaloisRepresentation` | Integral Tate representation; `TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois`. |
| `TauCeti.det_tateModuleGaloisRepresentation` | Its determinant equals the cyclotomic character, for a separably closed extension and ℓ invertible in that field; `TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Determinant`. Rationalization and duality transport this supplied identity. |
| `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupAddEquivLineBundleClass` | Weil divisor classes and line-bundle classes under the curve/DVR hypotheses stated in Scope; `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Picard`. |
| `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero` | Degree-zero restriction under properness and the finite-dimensional H¹ hypothesis; `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.PicZero`. |
| `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` | Picard functor rigidified along a section; `TauCeti.AlgebraicGeometry.PicardFunctor.Rigidified`. |

### Explicit arithmetic hypotheses

The final modularity theorem quantifies over the following named arithmetic
inputs. They are assumptions on the specified curves, maps and divisor classes,
with the exact source statements below; they are not construction or computation
targets. General moduli, Picard and Galois-representation theory still comes from
the supplier contracts above. Every theorem using these inputs carries them in
its hypotheses, including the propagated hypotheses listed in Layer 8.
`Suggested.lean` bundles the torsion input on actual Mathlib point groups;
the other inputs are stated on the geometric supplier contracts.

#### LevelFifteenModels

**Hypothesis `LevelFifteenModels`.** There are ℚ-isomorphisms `X(b3,b5)=X₀(15)≅E15` and X(s3,b5)≅Es35, with Cremona labels 15A1 and 15A3 respectively. Both have rational point group `ℤ/2 ⊕ ℤ/4` and rank zero, and they are ℚ-isogenous. The maps must carry j and the cusp divisors, not just identify the abstract elliptic curves. (CN, Corollary 7.1.2 proof, p.93; FLHS arXiv v4 Lemmas 15.3–15.4, p.29 (published locators cited by CN are Lemmas 5.6–5.7).)

#### QuadraticLevelFifteenTorsion

**Hypothesis `QuadraticLevelFifteenTorsion`.** Among quadratic number fields F, `E15(F)tors` strictly contains E15(ℚ) precisely for F=ℚ(i) or ℚ(√5); Es35(F)tors strictly contains Es35(ℚ) precisely for F=ℚ(√5). For the imaginary exception E15(ℚ(i)) has eight new torsion points beyond its eight rational points. No assertion of rank zero over an arbitrary F is part of this hypothesis. (CN, Corollary 7.1.2 proof, p.93; Kwon, Theorem 1(iii), pp.144–145.)

#### GenusOneModel

**Hypothesis `GenusOneModel`.** The smooth weighted quartic C with `Y²=ns3b5Quartic(X,Z)` is ℚ-isomorphic to X(ns3°,b5) and has genus 1. Its map to X(ns3,b5)≅ℙ¹ has degree 2 and coordinate x; the latter j-function is (x⁶+250x³+3125)³/x¹⁵. The Fricke w5 sends x to 5/x. The double cover is ramified at the four simple roots of X⁴+2X³−X²+10X+25, and its cusp field is ℚ(√−3), fixing the scalar −3. (CN, Proposition 7.2.1(1)–(2) and proof, pp.94–95.)

#### GenusOneJacobian

**Hypothesis `GenusOneJacobian`.** For C as above, JacC is ℚ-isomorphic to the elliptic curve y²=x³+3x²−720x−8100 (45A2), and `JacC(ℚ)≅ℤ/2⊕ℤ/2`. C(ℚ₃)=∅. Under the ℚ(√−3) identification P↦[P]−[∞−], its three nonzero rational classes are D₀=[0+]−[∞−], D₁=[P₁]−[∞−], D₂=[P₂]−[∞−], using genusOneSpecialPoints over ℚ(√−3); each has order 2 and D₀+D₁=D₂. This identifies the Jacobian over ℚ without identifying the pointless genus-one curve C with it over ℚ. (CN, Proposition 7.2.1(3) and points discussion, p.95; ns3ob5.m.)

#### GenusOneRationalPicard

**Hypothesis `GenusOneRationalPicard`.** Let Pic⁰(C) denote degree-zero ℚ-rational divisors modulo ℚ-rational linear equivalence, mapped injectively into JacC(ℚ). Its image is `{0,D₀}≅ℤ/2`, and D₁,D₂ are rational Jacobian points not represented by rational divisors. Writing s=√−3 and Ei=Di+∞++∞−, the ℚ(√−3) Riemann–Roch bases are {1,fi} with f₀=(y+s x²+5s)/x, f₁=(y+s x²−5s)/(x+2), f₂=(y+s x²−5s)/(x+5/2). These are additive numerators y+s x²±5s, as in the corresponding quadratic fiber equations. The associated rational descent conics for E₁,E₂ are u²+3v²+6v+15=0 and u²+3v²+6v+12=0, both empty over ℚ; E₀’s conic u²+3v²+6v−33=0 has the rational point (3,2). (CN, Proposition 7.2.2 and Remark 7.2.3, pp.95–96; BF §2, author PDF pp.2–4; ns3ob5.m.)

#### GenusOneQuadraticPoints

**Hypothesis `GenusOneQuadraticPoints`.** For any quadratic number field F, P∈C(F) other than the two points at infinity satisfies x(P)∈ℚ or x(P)x(σP)=5, where σ is the nontrivial automorphism of F/ℚ. The proof uses that P+σP is a rational effective divisor of degree 2 and its difference from ∞++∞− is either 0 or D₀ in the rational Picard image. In the nontrivial case the fiber equation (6−2sα)x²+(α²−33)x+(30−10sα)=0 has product of roots 5, with the degenerate leading-coefficient case handled separately. (CN, Proposition 7.2.4, p.96.)

The coordinate labels C, D₀, D₁, D₂, ∞±, 0+, P₁ and P₂ in these
hypotheses have exactly the meanings in §§5.3–5.4. In
`GenusOneRationalPicard`, “rational divisors” means divisors defined over ℚ,
modulo linear equivalence by ℚ-rational functions; it does not mean all
Galois-fixed geometric classes. `GenusOneQuadraticPoints` is an assumed
classification with all quadratic fields in its quantifier and both infinity
points excluded. Its modularity consequences remain targets.

**Hypothesis `GaussianComparisonData`.** For the eight extra Gaussian torsion
points specified by `QuadraticLevelFifteenTorsion`, supply the complete
noncuspidal j-value matching to `gaussianExceptional` by ℚ(i)-isogeny,
conjugation and quadratic twist. Also supply a prime ℓ, an isomorphism
ι:Q̄ℓ≅ℂ, a common ℓ-adic coefficient field with the embeddings defining
rπ,ι, a weight-zero cuspidal automorphic representation π over ℚ(i), invariant lattices for rπ,ι and the dual Tate representation of
`gaussianExceptional`, and the finite comparison data meeting the
Layer 0 `finite_frobenius_comparison` Faltings–Serre criterion. In particular the two continuous semisimple
representations have the required common determinant and residual comparison.
In the cyclic-order-three residual branch at ℓ=2, both restrictions to the
common cubic residual kernel are absolutely irreducible after coefficient
extension. The representations are unramified outside the specified finite
set S, and have equal Frobenius
characteristic polynomials at every prime of the criterion's exhaustive test
set T disjoint from S. Exhaustiveness is the criterion's condition on T;
an arbitrary finite matching list does not meet this hypothesis. The input
contains finite arithmetic equalities and their admissibility data, not an
isomorphism of the two representations or a modularity assertion. Applying
Layer 0 `finite_frobenius_comparison` and transporting along the matching table is the target
`gaussian_exceptional_modular`. (CN, proof of Corollary 7.1.2, p.93,
with its DGP10 reference and LMF-GAUSS curve 4050.1-c3.)

#### ExceptionalCurveData

**Hypothesis `ExceptionalCurveData`.** Take the conjunction of the following
source-specific arithmetic statements, with the curves, coordinates and maps
specified in their cited sections of this roadmap:

- `small_curve_models`, `nonsplit_cartan_conic`, `mixed_elliptic_model` and
  `B_mordell_weil` (§§4.2–4.4): the five normalized j-maps, the actual
  nonsplit conic, the elliptic quotient comparison and a saturated generator.
- `genus_two_model` and `genus_two_jacobian` (§§6.1–6.2): the proper
  model/Fricke comparison and the twenty-element rational Jacobian group.
- `GenusTwoDivisorTable`: in the convention `D∞ = ∞+ + ∞−`, the nineteen
  nonzero rational Jacobian classes have their unique effective degree-two
  representatives partitioned into nine rational-x classes, two
  infinity-supported classes, two supported on the conjugate pairs
  `((−5+s)/6, ±(17−s)/6)` with `s² = −11`, and six supported on real
  quadratic pairs. The table is the complete effective-divisor list of
  b3ns5.m; the zero class instead has its moving hyperelliptic pencil.
  (CN, Proposition 7.3.3, p.98; MAGMA-b3ns5, divisor enumeration block.)
- `ElevenExceptionalData`: for `a² − a + 3 = 0` in `F=ℚ(√−11)`, the
  mod-5 image of `elevenExceptional F a` is the full nonsplit Cartan
  normalizer, up to conjugacy. On the mixed affine fiber product the point
  `x=32a−96`, `t=(−a−15)/9` satisfies
  `b3J(x)=ns5J(t)=j(elevenExceptional F a)` and its image under the
  `genus_two_model` normalization map is an exceptional pair in the
  preceding table. Include the field-conjugation identification of the
  paper and script labels 8100.2-a2 and 8100.3-a2. (CN, Corollary 7.3.4
  proof, p.98; MAGMA-b3ns5, final exceptional-curve block.)
- `quartic_models`, `quartic_jacobian_ranks` and `quartic_jacobian_torsion`
  (§§7.1–7.3), with the displayed rational divisor relations for
  `quarticTorsionClasses`. Include the modular j-values of the two
  `quarticImaginaryPoints` pairs, both `−32768` (§7.2).
- `QuarticSieveData`: for C1 take
  `G=⟨2π₁*D⟩`, `I=4`, the degree-two base divisor pulled back from 0 on B,
  good prime 43, and eight pullback divisors L. Assume `red₄₃(G)` is
  cyclic of order seven, `ι₄₃⁻¹(red₄₃(G))` has seven elements, and L
  covers all seven residue classes with the relative local differential
  criterion of EffectiveDiophantineMethods §4.22. Put Dbase=π₁*(0_B), use
  the full known list L′=L∪{Dbase}, and supply its exact good subset
  L_43^good, containing L, for that criterion. The bad set is
  ι₄₃⁻¹(red₄₃(G))∖red₄₃(L_43^good), with ι(D)=4([D]−Dbase).
  For C2 take
  `G=⟨5π₂*D,D₂,5D₁₀⟩`, `I=10`, good primes 11 and 43 and the sixteen
  nonpullback effective divisors L16 of s3ns5.m. Set Dbase=π₂*(0_B) and
  supply the full finite known set L=L16∪Lpb, with Dbase∈Lpb⊂π₂*B(ℚ).
  Supply the exact good subsets L_11^good,L_43^good⊂L and the applicable
  symmetric or relative differential criterion for each listed good divisor.
  Of the sixteen nonpullback divisors, eight are rational sums,
  and eight are quadratic conjugate pairs, exactly two imaginary and six
  real. The imaginary pairs are `quarticImaginaryPoints` and conjugates.
  Form each bad set by removing precisely the reductions of L_p^good
  from ι_p⁻¹(red_p(G)). Require emptiness of the intersection of the
  two lifted bad-coset sets, with `ι(D)=I([D]−Dbase)` as in
  EffectiveDiophantineMethods §5.24. These hypotheses are identities of
  finite sets, groups and reduction maps. (CN, Proposition 7.4.5, p.101;
  MAGMA-ns3ons5 and MAGMA-s3ns5, sieve blocks.)

Each clause has the exact signature displayed in its section; the conjunction
only names the common input list for the final theorem. No clause assumes a
modularity conclusion. The rank, point, class and finite-image data themselves
are not roadmap targets.

#### SmallFieldRanks

**Hypothesis `SmallFieldRanks`.** The rational elliptic curve E15 and each
quadratic twist `E15^(−d)`, `d∈{1,2,3,5}`, have algebraic Mordell–Weil
rank zero over ℚ. Equivalently, by Layer 0 `quadratic_rank_decomposition`, the
rationalized group `ℚ ⊗_ℤ E15(ℚ(√−d))` has dimension zero for those four
d. This input concerns algebraic rank, with no numerical L-value or point
search substituted for it. (CN, §1 after Theorem 1.1, p.2.)

**Checks of the input boundary.**

- `LevelFifteenModels` includes the transported j-maps and cusp divisors;
  an isomorphism of elliptic point groups alone cannot identify noncuspidal
  modular points. Its isogeny gives equal ranks after every number-field
  extension, not equality of the two rational torsion subgroups.
- `QuadraticLevelFifteenTorsion` gives growth for E15 over ℚ(i) but none
  for Es35 there; over the real field ℚ(√5) both grow. Over ℚ(√−10)
  neither grows, even though the E15 point (−1,6√−10) is nontorsion.
  The input asserts no rank-zero condition for an arbitrary quadratic field.
- `GenusOneModel` uses Y of weight two and the scalar −3; changing the
  scalar to 1 introduces a rational infinity point and fails the stated
  model and local obstruction.
- `GenusOneJacobian` and `GenusOneRationalPicard` give groups of orders four
  and two respectively. Identifying them would make D₁ and D₂ descend as
  rational divisors and contradict the two insoluble conics.
- `GenusOneQuadraticPoints` allows x=1+2i with norm five. It does not assert
  x∈ℚ for every quadratic point or σP=w₅P for a chosen lift to C.
- `GaussianComparisonData` requires the exhaustive set T and matching of
  all eight new points. A conductor label or one matching Euler factor does
  not imply the comparison. The small-field rank inputs are confined to
  d∈{1,2,3,5}; the d=10 negative control rules out extending rank zero to all d.

## How to read the build

Layer 0 supplies the independent mathematical bridges; Layers 1–3 assemble
modularity, switching and CM lifting. Layer 4 fixes the source coordinates and moduli comparisons. Layers
5–7 derive modularity from the stated genus-one inputs and analyze the other
exceptional curves through exact divisor arithmetic. Layer 8
combines the residual-image cases and the finite-level-fifteen condition. Each
local arithmetic calculation feeds a geometric comparison before a modularity
conclusion is drawn.

| Layer | Mathematics built |
|---|---|
| Layer 0 | Independent CM lifting, discriminant coupling, genericity, finite comparison and the rank-equal double-cover inclusion. |
| Layer 1 | Source-normalized modularity, all-prime and local comparisons, and transport. |
| Layer 2 | Number-field prescribed-pairing specialization, independent seed and local selection, prescribed-type mod-5/mod-3 switching. |
| Layer 3 | Elliptic CM lifting application, quadratic irreducibility criterion and density of integral equations. |
| Layer 4 | Five literal j-functions and a common elliptic equation, with their assumed modular and rational-group comparisons. |
| Layer 5 | Finiteness transfer and Gaussian modularity from the level-fifteen inputs; genus-one modularity from the model, Picard and point-classification inputs. |
| Layer 6 | Genus-two quadratic-divisor and modularity consequences of the model, group, divisor-table and residual-image inputs. |
| Layer 7 | Literal plane quartics, the derived pullback indices and symmetric-square classifications from the local-image inputs. |
| Layer 8 | Residual-image theorem and unrestricted modularity when X₀(15)(F) is finite, with examples. |

In the targets below, an API assertion states the usable mathematical interface
of its definition. Its checks give small values, degeneracies, compatibility
with the library and distinctions that would fail for a wrong definition.
Source abbreviations refer to the fixed versions in the references; page numbers
use the pagination specified in the references; code and database locators name
a block or record rather than a nonexistent page.

## Layer 0: Independent lifting and arithmetic bridges

### 0.1 CM lifting

**`cm_dihedral_lifting`** — For AKT Theorem 7.1 (§7, p.67), let K be CM and
ρ:GK→GL₂(ℚ̄₂) continuous. Its residual representation is decomposed generic,
dihedral with quadratic inducing field M/K, and extends to
GK⁺→GL₂(𝔽₂). Require ρ unramified away from finitely many places. At every
v|2, its ordinary weight-zero shape is upper triangular with diagonal
αv, ε₂⁻¹βv for unramified αv,βv, and its Weil–Deligne representation is
unipotently ramified. The field M is ramified at each such v; write
Mv=Kv(√u) with ordv(u) odd. Also Kv(√−1)/Kv is unramified.
The output is a cuspidal, weight-zero, ι-ordinary GL₂ representation with
attached representation isomorphic to ρ, for an isomorphism ι:ℚ̄₂≅ℂ.
The dyadic residual image here is dihedral; a theorem assuming a nonsolvable
residual image does not provide this interface.

**`cm_ordinary_lifting`** — For AKT Theorem 8.1 (§8, pp.71–72; restated as Theorem A.14, §A.4, p.94),
take odd p, CM K and continuous ρ:GK→GL₂(ℚ̄p), unramified away from a finite
set, with det ρ=εp⁻¹. Require its residual representation to be decomposed
generic and absolutely irreducible on GK(ζp). Require ordinarity of weight
λ∈(ℤ²₊,₀)^Hom(K,ℚ̄p). There is an isomorphism ι:ℚ̄p≅ℂ and an
ι-ordinary cohomological cuspidal representation π of PGL₂(𝔸K) whose residual
attached representation is isomorphic to that of ρ. If p=5 and the projective
residual image on GK(ζ5) is PSL₂(𝔽5), the field cut out by the full projective
residual representation must exclude ζ5. The conclusion is a cuspidal
PGL₂ representation Π of weight ιλ, ι-ordinary, with rΠ,ι≅ρ.
Layer 2 uses its weight-zero specialization together with the dyadic theorem;
both general lifting theorems are targets here, independent of the switching endpoints.

**`qualified_cm_lifting`** — The qualified form of CN Theorem 5.2
(§5.1, pp.73–74) takes odd p,
imaginary CM F and continuous ρ:GF→GL₂(ℚ̄p), unramified away from finitely
many places, with determinant εp⁻¹ and potentially semistable labeled weights
{0,1} at all v|p. The residual representation is decomposed generic and
absolutely irreducible on GF(ζp); it satisfies the same p=5 projective-field
condition as above. There is a residual-matching weight-zero cuspidal
PGL₂ representation π. Where ρ is potentially crystalline, the local
attached representation of π is potentially ordinary of weight zero exactly
when ρ is, and rec(πv) has N=0. Where ρ is not potentially crystalline,
π is ι-ordinary of weight zero and its attached representation is also
not potentially crystalline. Include the qualification
[F(ζp):F]≠3 or full projective residual image not A₄. The conclusion is
automorphy of ρ by a weight-zero cuspidal PGL₂ representation.
For Layer 3, the qualification follows from [F(ζp):F]|p−1 for p=3,5;
it is retained in the general lifting target.

The lifting targets use ArithmeticGaloisRepresentations Layers 1–4,
AutomorphicGaloisRepresentationsPartII AG2.P and AG2.5–AG2.7,
GlobalGaloisDeformations R04.3–R04.6, LocalGaloisDeformationRings Layers 1–6,
and DeformationAndDerivedPatchingAlgebra Layers 5–9 for the representation,
local-condition, deformation and patching theories. They include the independent
CM ordinary/dihedral and potentially Barsotti–Tate proofs, with no appeal to
`cm_modularity` or either switching conclusion.

### 0.2 Discriminants and coupling

**`cm_discriminant_descent`** — For a CM field K, `n ≥ 2` and `a ∈ Kˣ`,
let L be the splitting field of `T^n − a/aᶜ`. Then L/K is soluble CM and
there is `z ∈ L⁺ˣ` with `a/z ∈ (Lˣ)^n`. The nonzero hypothesis permits
`a/aᶜ` and the multiplicative power class. Specialize to n=6 for the
Weierstrass discriminant. (AKT, Corollary 9.4, p.74.)

**`fixed_pairing_twist`** — For every number field F, p∈{3,5}, continuous
ρ̄:GF→GL₂(𝔽p) with cyclotomic determinant, and specified equivariant
pairing ∧²ρ̄≅μp, construct the fine fixed-pairing twist Yρ̄/F and its
smooth proper completion Xρ̄/F by carrying out ModularCurves §5C's descent
over F. Prove the extension-field point dictionary of the adopted interface,
naturality of field base change with identity and composition laws, and
geometric genus zero. Identify these objects with ModularCurvesPartII §5.14
when ρ̄ is the restriction of a representation over ℚ. Normalize the j-line
in Yρ̄ to form the completion; finite separable frame extensions are smooth,
so normalization commutes with this base change. (AKT §9, paragraph preceding
Lemma 9.7 and its proof, p.75; Stacks Tag 03GV.)

*Needs:* Modular twists, EC torsion; Mathlib
`AlgebraicGeometry.Scheme.Hom.normalizationPullback` and its smooth-base-change
isomorphism; ModularCurves §0E and ModularCurvesPartII §5.13.

**Checks.**

- A symplectic frame over a splitting extension identifies this construction
  with the fixed-pairing full-level curve, rather than the disconnected
  unpaired full-level curve.
- For ρ̄=E[p], the pair (E,id) is an F-point and base change transports it
  to (E_K,id) over each extension K/F.
- A representation of GF need not descend to Gℚ; its twist is still defined
  over F, while the comparison with §5.14 requires that descent hypothesis.

**`fixed_pairing_twist_rational`** — Under the hypotheses of
`fixed_pairing_twist`, Xρ̄ is F-isomorphic to ℙ¹ and Yρ̄ is its cusp
complement. Prove that the projective twisting cocycle lifts to an SL₂-cocycle
and hence is trivial by Hilbert 90, with the determinant/pairing compatibility
needed for the lift. Apply Shepherd-Barron–Taylor's level-five argument and
its level-three analogue. This supplies rationality without assuming a global
point or deducing one from geometric genus zero. (AKT, proof of Lemma 9.7,
p.75; Shepherd-Barron–Taylor, Lemma 1.1 and proof, author p.3.)

*Needs:* Layer 0 `fixed_pairing_twist`; ModularCurves §0E (effective descent);
the SL₂ lift and cocycle-trivialization argument of the cited proof, included
in this target.

**Checks.**

- For ρ̄=E[p], the completion's rationality agrees with the rational point
  (E,id) and geometric genus zero.
- Removing the finite cusp divisor from ℙ¹ over a number field leaves
  infinitely many F-points, even without a chosen elliptic realization of ρ̄.
- A general genus-zero curve, such as x²+y²+z²=0 over ℚ, need not have a
  rational point. The specified determinant-compatible lift is essential.

**`mixed_fixed_pairing_twist_six`** — For elliptic curves A,E over any
number field K, construct the fine K-curve Y classifying elliptic curves C
with symplectic isomorphisms C[2]≅A[2] and C[3]≅E[3], and its smooth
proper geometrically connected genus-one completion X. Descend the paired
full-level-six curve using the module A[2]×E[3] and its Weil pairings.
Prove the point dictionary over every extension of K and base-change laws
for identity and composition. Write X_A and X_E for the corresponding
pure twists using A[6] and E[6]. Let V_A,V_E be the normal Klein four
K-subgroups in PSp(A[3]), PSp(E[3]), and C_A,C_E the normal order-three
K-subgroups in PSp(A[2]), PSp(E[2]). If ΔA/ΔE is a cube, prove
X_A/V_A≅X/V_E; if it is a square, prove X/C_A≅X_E/C_E, with the quotient
maps extended to the completions. (AKT, Lemmas 9.5–9.6, pp.74–75.)

*Needs:* ModularCurves §0E and §5C for descent and the paired frame
construction; ModularCurvesPartII §5.13 for the compactified full-level-six
carrier; EC torsion; the genus-one calculation and quotient comparisons
of AKT Lemmas 9.5–9.6, included in this target.

**Checks.**

- For A=E the curve is the twist by E[6], and (E,id,id) is a K-point
  of its elliptic open.
- Over a field with symplectic frames the completion is the connected
  fixed-pairing X(6), of genus one; the unpaired full-level curve has two
  geometric components and cannot replace it.
- Under both square and cube conditions, the images of the points on
  X_A and X_E give rational divisors on X of degrees four and three.
  Their difference gives degree one; geometric genus one alone does not
  imply that a twist has a K-point.

**`discriminant_coupling`** — For any number field K and elliptic A,E/K,
if `ΔA/ΔE ∈ (Kˣ)^6` and E[3] is irreducible, there is an elliptic C/K
with `ΔC/ΔA ∈ (Kˣ)^6` and symplectic isomorphisms `C[2] ≅ A[2]`,
`C[3] ≅ E[3]`. Use the mixed fixed-pairing level-six curve, whose rational
divisors of degrees three and four give a degree-one divisor; the
irreducibility assumption excludes rational cusps. (AKT, Lemma 9.6,
pp.74–75; ModularCurves §5C; ModularCurvesPartII §5.14.)

The local nonemptiness and open-condition application is AKT Lemma 9.7,
pp.75–76, used in `hilbert_local_selection`. The CM globalization target
`solvable_preparation` realizes those compatible choices while preserving
the avoidance field and every place over the generic witness. A sixth-power
discriminant class retains the square and cube conditions simultaneously;
replacing it by a twelfth-power class is not the specified coupling.

*Needs:* Layer 0 `mixed_fixed_pairing_twist_six`; ModularCurves §5C;
ModularCurvesPartII §5.14; JacobianChallenge Layers B and D;
Mathlib `groupCohomology.H1ofAutOnUnitsUnique`.

**Checks for `discriminant_coupling`.**

- The sixth-power condition supplies both the square and cube conditions
  needed for the two quotient comparisons.
- The rational degree-four and degree-three divisors give degree one by
  subtraction; Riemann–Roch on the genus-one completion gives a K-point.
- Irreducibility of E[3] excludes rational cusps. Without it, the
  degree-one argument alone need not supply a point of the elliptic open.

### 0.3 Residual genericity comparisons

Prove the following two implications using ArithmeticGaloisRepresentations
§§4.3 and 4.7 and AutomorphicGaloisRepresentationsPartII AG2.7.

**`quadratic_genericity`** — CN Lemma 6.2.2 (§6.2, pp.90–91) takes a quadratic
F/ℚ and odd p: absolute irreducibility on GF(ζp) gives a single rational
decomposed-generic prime simultaneously at its conjugate places.

**`large_image_genericity`** — For the
Galois-over-ℚ CM field in `density_one`, the large-image comparison used in
CN Corollary 6.1.2 (§6.1, pp.87–88) instead assumes that the mod-5 image
contains SL₂(𝔽5). It gives decomposed genericity with the required
cyclotomic restriction. The application also uses the separate
projective-field exclusion at p=5. These are the residual-image implications used before the coefficient count.

### 0.4 Finite comparison of two representations

**`even_trace_comparison`** — For any number field K and finite L/ℚ₂,
let ρ₁,ρ₂:GK→GL₂(O_L) be continuous, unramified outside a finite set S
containing all archimedean places and all places above 2. Assume both residual
traces vanish and residual determinants agree. Let K_S be the compositum of
all quadratic extensions unramified outside S, allowing ramification at the
real places in S. For a finite set T of finite primes outside S require its
Frobenius images in Gal(K_S/K) to be noncubic: every homogeneous cubic over
F₂ vanishing on those images vanishes on the whole F₂-vector space. Equal
traces and determinants on T imply isomorphic semisimplifications. Prove the
Livné trace-discrepancy argument over this general base field; the only
field-dependent input is finiteness of the quadratic extensions with the
specified ramification. (DGP, Theorem 4.2 and §4.3, p.10; §5.2, pp.16–17.)

*Needs:* ArithmeticGaloisRepresentations §§5.1–5.4; ClassFieldTheory §5.4
with real places in the modulus; NumberFieldArithmetic Hermite finiteness.

**Checks.**

- The cubic residual kernel field over an imaginary quadratic K has degree
  six over ℚ; this criterion applies there without a quadratic-field hypothesis.
- Over ℚ with S containing ∞ and 2, ℚ(i) occurs in K_S: omitting the
  permitted real ramification would discard a quadratic character.
- In F₂³ the three basis vectors span but are not noncubic: x₁x₂x₃ vanishes
  on them and not on (1,1,1). The full vector space is noncubic.

**`finite_frobenius_comparison`** — Let K be imaginary quadratic, L/ℚℓ
finite and `ρ₁,ρ₂ : G_K → GL₂(O_L)` continuous, unramified outside a finite
S containing the places above ℓ. Prove the finite Faltings–Serre comparison
in its residual-image branches (DGP, §4.1–§4.3, pp.9–10). In the absolutely
irreducible branch the residual representations are isomorphic, determinants
agree, and the finite test primes meet every nonzero trace-discrepancy class
in every extension of the residual kernel field with Galois group an
Fℓ-submodule of `M₂(k_L)` under conjugation. The extension list includes all
such extensions unramified outside S; its finiteness uses bounded degree and
ramification. Equality of Frobenius traces at these primes implies equality
of semisimplifications. This is a mathematical exhaustion condition on T,
not a procedure for finding T.

The even-trace branch uses the general-number-field `even_trace_comparison`
above. For common cyclic residual image of order three, take ℓ=2 with residual
coefficient field F₂ and assume that both restrictions to the common cubic
kernel field are absolutely irreducible after coefficient extension. Apply
the even-trace criterion over that field, with S pulled back, then
GL2Transfer.compatible_descent_twist to the restricted isomorphism. The two
representations differ by a character of the cubic quotient. The common
residual trace is 1 outside the kernel; each nontrivial cubic character has
nontrivial reduction there, excluding both nontrivial twists. Thus the
representations are isomorphic. (DGP, §4.3 and §5.3, pp.10,17;
GL2AutomorphicRepresentationsAndTransfer R17.6.18.)

*Needs:* ArithmeticGaloisRepresentations §§1.1, 4.6 and 5.1–5.4;
NumberFieldArithmetic §“What Mathlib supplies” (`NumberField.finite_of_discr_bdd`) and LocalFieldsRamification Layer 2 (local ramification bounds);
ClassFieldTheory §5.4 (quadratic extensions);
GL2AutomorphicRepresentationsAndTransfer R17.6.18, the finite-quotient
character comparison from an absolutely irreducible restricted representation.

**Checks.** Equal trace and determinant compare semisimplifications, not
arbitrary nonsplit extensions. A single matching Euler factor does not
meet the exhaustion condition. In the even-trace branch a mere spanning
set need not detect cubic functions; the full vector space does.
On a quotient C₃×ℤ₂ of Gℚ(i), put C=[[0,−1],[1,−1]] and U=1+2C.
The continuous representations C^gU^t and C^(−g)U^t agree on the common
residual kernel, have isomorphic reductions and equal determinants, yet
have traces −3 and 3 at (1,1). Here U²=−3I and both kernel restrictions
split after coefficient extension; this example fails the absolute
irreducibility hypothesis and cannot be descended by the character argument.

### 0.5 Rank-equal double covers and real quadratic fields

**`bielliptic_rank_equal_inclusion`** — Let `π:C→B` be a degree-two map
of smooth proper curves over ℚ, with B elliptic and covering involution w.
If `rk Jac(C)(ℚ) = rk B(ℚ)`, then for every rational Jacobian point P,
`P − wP` is torsion, since w acts as identity on the rationalized Mordell–Weil
group. Using `π*π_* = 1+w`, deduce `2P ∈ π*B(ℚ)+Jac(C)(ℚ)_tors`.
No equality between the integral pullback lattice and the whole free lattice
is asserted. (BOX §3.3, Proposition 3.1 and proof, pp.8–9.)

*Needs:* ModularCurvesPartII §13.1; EllipticCurves Layer 6;
JacobianChallenge Layers D–F.

**`real_quadratic_modularity`** — Every elliptic curve over every real
quadratic number field is modular. Use the classical/Hilbert Galois and
weight-two interfaces, the totally real cyclotomic-irreducibility lifting
criterion of FLHS Theorem 2 (p.3), and its residual 3/5 and 3/7 switching
Theorems 3–4 (pp.3–4). These are subsidiary targets with their stated
hypotheses: F totally real, E/F elliptic, p odd, E residually modular and
absolutely irreducible on `G_F(ζ_p)` for Theorem 2; p=3,5 or p=7 and that
cyclotomic irreducibility for the respective switching conclusions. Their
finite exceptional-curve classifications in FLHS Parts 4–5 are explicit
arithmetic hypotheses for this real branch, including the complete
quadratic-point lists, rational-j or Q-curve comparisons and the
`F=ℚ(√5)` case of §18. Call their conjunction `RealQuadraticCurveData`.
The target takes that hypothesis and proves the all-real-quadratic conclusion;
it is used only for the real branches of the all-quadratic statements below.
(FLHS, Theorem 1, p.2; proof §11, p.17; Parts 2–5, pp.5–34.)

*Needs:* ArithmeticGaloisRepresentations Layers 4–6;
AutomorphicGaloisRepresentations Layers 3–7; GL2AutomorphicRepresentationsAndTransfer
R16.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5;
EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.6.

### 0.6 Quadratic rank decomposition

**`quadratic_rank_decomposition`** — For a number field K, nonsquare d∈Kˣ,
L=K(√d) and elliptic E/K, identify the + and − eigenspaces of σ∈Gal(L/K)
on ℚ⊗ℤE(L) with ℚ⊗ℤE(K) and ℚ⊗ℤE^(d)(K), respectively. These give a
ℚ-linear isomorphism ℚ⊗ℤE(L)≅(ℚ⊗ℤE(K))⊕(ℚ⊗ℤE^(d)(K)) and hence
rk E(L)=rk E(K)+rk E^(d)(K). Use the projectors (1±σ)/2, fixed-point
descent and the quadratic-twist anti-equivariance; finite generation makes
the dimensions finite. (EllipticCurves Layer 5, quadratic-twist point/Galois
comparison, and Layer 6, Mordell–Weil; CN §1 after Theorem 1.1, p.2.)

*Needs:* EllipticCurves Layers 5–6; pinned Tau Ceti
`WeierstrassCurve.quadraticTwistPointEquiv` and
`WeierstrassCurve.quadraticTwistPointEquiv_map_eq_neg_map_of_not_fixed` in
`TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`.

**Checks.**

- If both K-ranks vanish, E(L) is finite by Mordell–Weil; extra torsion
  does not change the rationalized eigenspaces.
- For K=ℚ and d=−1 the rank sum concerns E and its −1 twist over ℚ,
  even when E(ℚ(i)) has more torsion than E(ℚ).
- The E15 point (−1,6√−10), with the stated torsion comparison, forces a
  positive rank sum for d=−10; rank zero cannot extend to every quadratic field.

### Examples

For p=3 or 5, `[F(ζ_p):F]` divides p−1, so cannot equal three.
For the bielliptic inclusion, a free rank-one subgroup of index two need
not be the full lattice; multiplication by two is the stated bound.
A real quadratic field has real places, so the CM lifting hypotheses do
not supply its modularity theorem.

### Dependencies

The named representation, deformation, patching, modular-curve and Jacobian
suppliers provide the carriers and general theories. The independent lifting,
comparison and double-cover results of this layer precede every application.

## Layer 1: Modular elliptic curves over number fields

### 1.1 Modularity and its CM branch

Keep the geometric CM branch in the predicate even when the Tate module splits over the base field. The non-CM branch uses the actual automorphic and Tate-module carriers from the suppliers. Its isogeny API is obtained from the transport theorem in this layer.

**`Modular`** — For a totally real or CM number field F and a Weierstrass curve E/F with Δ(E) ≠ 0, Modular(E) means: either End(E over F̄) is larger than ℤ (geometric CM), or there exist a rational prime p, an isomorphism ι:Q̄p≅ℂ and a cuspidal regular algebraic automorphic representation π of GL₂(𝔸F), cohomological of weight 0, such that rπ,ι≅rE,p∨ as continuous representations of GF. Weight 0 and the Tate-normalized local Langlands convention are those of CN §2. The CM branch does not impose cuspidality. (CN, §6.1, definition before Theorem 6.1, p.87.)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.IsElliptic`, GL2AutomorphicRepresentationsAndTransfer R16.4, AutomorphicGaloisRepresentationsPartII AG2.7, ArithmeticGaloisRepresentations §6.1, GL2AutomorphicRepresentationsAndTransfer R16.3, GL2AutomorphicRepresentationsAndTransfer R16.6.

All statements in Layer 1 carry the totally real or CM hypothesis wherever
`Modular` or an attached representation occurs; CM-specific statements retain
their stronger CM hypothesis. The defining interface consists of these named statements.

- `Modular.of_cm`: Geometric CM implies Modular(E), including when the CM field is contained in F.
- `Modular.non_cm_iff`: For a non-CM E/F, Modular(E) iff the displayed existence of p, ι, π and the dual Tate-module isomorphism holds.
- `Modular.isogeny_iff`: If E and E′ are F-isogenous elliptic curves, Modular(E) iff Modular(E′).

**Checks.**

- The smooth curve y²=x³+1 over ℚ(√−3) is Modular through its geometric CM.
  At p=7 its rational Tate representation splits into characters because
  7 splits in ℚ(√−3). At inert p=5 it is irreducible over ℚ₅ and splits
  over ℚ₂₅; splitting there requires coefficient extension.
- Every elliptic curve E/ℚ satisfies Modular(E), by EllipticCurveModularity R29.6 with the same dual normalization.
- The signature-(1,1) field ℚ(∛2) is neither totally real nor CM and is
  outside this predicate and its attachment contract.
- For p=5 over a totally real or CM number field, det(rE,p)=εp and det(rE,p∨)=εp⁻¹ are distinct characters; an isomorphism to rE,p cannot replace the isomorphism to its dual.

### 1.2 One representation, all primes and local monodromy

Compare good-place polynomials over common coefficient fields before applying semisimple Chebotarev recognition. Strong multiplicity one identifies the automorphic representation up to isomorphism. At bad places, use the purity upgrade of local–global compatibility; at v|p, an auxiliary ℓ≠p first identifies a Steinberg twist, and the ordinary criterion applies to that local factor. These are four distinct comparisons.

**`automorphic_unique`** — If F is a CM field and E/F is a non-CM modular elliptic curve, there is a unique cuspidal regular algebraic π of GL₂(𝔸F) of weight 0 giving the modularity isomorphism. Its central character is trivial; π therefore descends to PGL₂. Uniqueness is up to isomorphism, not equality of a chosen model. (CN, Lemma 6.1.3(1), p.88.)

*Needs:* Layer 1 `Modular`, GL2AutomorphicRepresentationsAndTransfer R16.4, ArithmeticGaloisRepresentations §6.1, GL2AutomorphicRepresentationsAndTransfer R16.3.

**`automorphic_all_primes`** — With E/F and π as in automorphic_unique, for every rational prime p and every ι:Q̄p≅ℂ, rπ,ι≅rE,p∨ as continuous GF-representations. A common coefficient field and semisimple comparison are supplied before concluding an isomorphism. (CN, Lemma 6.1.3(2), p.88.)

*Needs:* Layer 1 `automorphic_unique`, AutomorphicGaloisRepresentationsPartII AG2.7, ArithmeticGaloisRepresentations §6.1, ArithmeticGaloisRepresentations §§5.1–5.5, FaltingsFinitenessAndIsogenyTheorems §§R28.6.2–R28.6.3.

**Checks for `automorphic_all_primes`.**

- At a good place v∤p the isomorphism gives the dual elliptic Frobenius
  polynomial, with determinant εp⁻¹ rather than εp.
- At a prime p of reducible residual representation the rational Tate module
  is still absolutely irreducible for non-CM E; residual irreducibility is
  not a hypothesis of this all-prime comparison.
- A nonsplit extension of two characters has the same Frobenius polynomials
  as its semisimplification. Faltings semisimplicity prevents that ambiguity
  on the elliptic side.

**`automorphic_wd`** — For E/F and π as above, every p, every ι and every finite place v∤p satisfy WD(rE,p∨|GFv)F-ss≅recᵀFv(πv). Frobenius semisimplification retains the monodromy N. This is an isomorphism of Weil–Deligne representations, not just an equality of their semisimplified Weil representations. (CN, Lemma 6.1.3(3) and proof, p.88.)

*Needs:* Layer 1 `automorphic_all_primes`, AutomorphicGaloisRepresentationsPartII AG2.5, EC local reduction, EC finite fields, GL2AutomorphicRepresentationsAndTransfer R16.3.

At a good place N=0; at a potentially multiplicative place the Steinberg monodromy is nonzero after the appropriate twist. No inference from equality of semisimple Weil representations alone is accepted.

**`automorphic_potentially_multiplicative_ordinary`** — If E/F is non-CM modular and v|p is a place of potentially multiplicative reduction, then π is ι-ordinary at v of weight 0. For another prime ℓ≠p, full local–global compatibility identifies πv with a quadratic twist of Steinberg; transfer this local type to p-adic ordinarity. (CN, Lemma 6.1.3(4) and proof, p.88.)

*Needs:* Layer 1 `automorphic_wd`, EC local reduction; GL2AutomorphicRepresentationsAndTransfer R16.3, Steinberg parameters; the ordinary-weight-zero local comparison of CN Lemma 6.1.3(4), p.88.

### 1.3 Transport of modularity

Transport the geometric CM branch directly. In the cuspidal branch transfer the rational Tate-module isomorphism, twist the automorphic representation by the matching quadratic character, and check irreducibility before soluble descent. This is the interface used for the Gaussian orbit and the Fricke-related quadratic pairs.

**`modularity_transport`** — For elliptic curves over a totally real or CM number field, modularity is invariant under isogeny and quadratic twist, and is preserved under conjugating the number field. If L/F is a finite Galois solvable extension with L CM and F totally real or CM, and E/L is the base change of E/F, modularity of E/L implies modularity of E/F. In the non-CM branch use absolute irreducibility of the Tate representation over GL, deduced from Faltings semisimplicity and End_GL(VpE)=End_L(E)⊗ℚp=ℚp; CM is handled separately. Base change along a finite solvable extension L/F with both F and L totally real or CM preserves modularity, allowing the CM branch when cuspidality fails. (CN, §6.1, proof of Theorem 6.1, p.90; §7, proofs of Corollaries 7.1.2, 7.2.5 and 7.3.4, pp.93,97–98.)

*Needs:* Layer 1 `Modular`, GL2AutomorphicRepresentationsAndTransfer R17.4, EC isogenies, ArithmeticGaloisRepresentations §6.1, ArithmeticGaloisRepresentations §§6.1–6.2, FaltingsFinitenessAndIsogenyTheorems §§R28.6.2–R28.6.3.

**Checks for `modularity_transport`.**

- A non-CM curve remains non-CM after every finite extension, and its Tate
  representation stays absolutely irreducible over that extension.
- A quadratic twist tensors the covariant and dual Tate representations
  with the same order-two character; its square is trivial.
- Over ℚ(i), the CM curve y²=x³−x has a split Tate representation at primes
  split in ℚ(i). Its transport uses the CM branch, not non-CM irreducibility.

The 4050.1-c3 calculation can be transported by ℚ(i)-isogeny, field conjugation and quadratic twisting. The local monodromy and determinant normalizations are preserved.

### Examples

At a potentially multiplicative place, the local Weil–Deligne representation has nonzero monodromy. Its Frobenius semisimplification therefore remains Steinberg-type; replacing it by a semisimplified Weil representation would erase the ordinary-local-type input (CN Lemma 6.1.3(3)–(4), p.88).

### Dependencies

The rational modularity endpoint, elliptic Tate and local-reduction interfaces, GL₂ automorphic transfer, attached Galois representations, p-adic Hodge comparison and soluble transport are the supplier contracts used in this layer.

## Layer 2: Prescribed-type mod-3 and mod-5 switching

### 2.1 The fixed-pairing parameter curve and local preparation

Geometric genus zero does not give a rational point. Layer 0 `fixed_pairing_twist` constructs the number-field twist, including its actual rigidification at level 3, and `fixed_pairing_twist_rational` identifies the completion with a projective line. Local preparation supplies the local prototypes and open conditions. Its globalization contract simultaneously controls the CM real subfield, the avoidance field and every place over the chosen generic q.

**`solvable_preparation`** — Let F be imaginary CM, p∈{3,5}, ρ̄:GF→GL₂(𝔽p) continuous, cyclotomic determinant and decomposed generic, and Favoid/F finite Galois. There is a finite Galois solvable CM extension L/F disjoint from Favoid such that each w|2,3,p is split over L⁺ and ρ̄|GLw is trivial; for every w|p there are local elliptic curves with good ordinary and good supersingular reduction and rational p-torsion; Lw(√−1)/Lw is unramified at w|2; a rational prime q>5 witnessing decomposed genericity splits completely in L. Local degrees and the chosen witness are part of the output. Where ζ5 must be excluded, enlarge the avoidance field by F(ζ5) before constructing L. (CN, Proof of Proposition 6.1.5, p.89; proof of Proposition 6.1.6, p.90, compared with AKT 9.13–9.15; AKT §9, Propositions 9.13 and 9.15, pp.79–81.)

*Needs:* Weak approximation, InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.7, ArithmeticGaloisRepresentations §§4.2–4.7, EC local reduction, AutomorphicGaloisRepresentationsPartII AG2.7, “Infinitely many decomposed generic primes”.

The witness q is one rational prime and every place above it is retained, not only one selected place. Disjointness from Favoid preserves residual image only if the required residual field was included in Favoid. A retained q supplies genericity; full image preservation separately requires the residual field in the avoidance datum. No enormousness assumption is inserted at p=3.

### 2.2 The independent modularity seed and Hilbert selection

The general CM dihedral 2-adic and ordinary odd-prime lifting theorems are imported from the CM extension of §0.1. AKT discriminant descent and the mod-2/mod-3 coupling belong to §0.2. Here their hypotheses are assembled for the auxiliary curve, with locally open discriminant conditions and thin-set avoidance. The p-adic reduction partition is prescribed separately.

**`seed_modular`** — Let K be imaginary CM and A/K elliptic with discriminant Δ from a chosen Weierstrass equation. Suppose: at each v|2, A is a Tate curve, Kv(√−1)/Kv is unramified, ordv Δ≡3 mod 6, and Δ/Δc is a square in Kv; at each v|3, A is a Tate curve, ordv Δ≡2 or 4 mod 6, and Δ/Δc is a cube in Kv; for M=K(ζ12,(Δ/Δc)^(1/6)), r̄A,3|GM is decomposed generic and its image on GM(ζ3) is conjugate to SL₂(𝔽3). Then A is modular. Here c is the CM involution; the choices of sixth root do not affect the field M. (AKT, §9, Proposition 9.12, p.79; Lemma 9.11, pp.78–79, and Corollary 9.4, p.74.)

*Needs:* Layer 1 `Modular`, Layer 1 `modularity_transport`, ModularCurvesPartII §5.14, ArithmeticGaloisRepresentations §§4.2–4.7, EC local reduction, ModularCurvesPartII §5.14 and Layer 0 `discriminant_coupling`, Layer 0 `cm_dihedral_lifting` and `cm_ordinary_lifting` with the independent AKT CM lifting contracts stated above.

No condition at places above 5 occurs; changing the 5-adic reduction does not affect this seed. The residue characteristic two hypothesis is dihedral, not nonsolvable; a nonsolvable dyadic lifting theorem does not supply it.

**`hilbert_local_selection`** — For the twist over L constructed by Layer 0 `fixed_pairing_twist`, use `fixed_pairing_twist_rational` to identify Yρ̄ with an open subcurve of ℙ¹L after `solvable_preparation`. Then, given nonempty open subsets Ωw⊂Yρ̄(Lw) at all the finitely many selected places and the finite covers encoding auxiliary large mod-3 or mod-5 image, there is an L-point in every Ωw outside the relevant thin exceptional sets. In the p=5 construction impose the AKT 9.7 discriminant-conjugacy, Tate valuation and large mod-3 conditions for seed_modular; independently choose at every w|5 ordinary, supersingular or split multiplicative local prototypes according to the prescribed partition. In the p=3 construction impose Tate reduction at every place above 5 for the ordinary mod-5 seed without constraining the prescribed 3-adic ordinary/supersingular/multiplicative choices. (CN, §6.1, proofs of Propositions 6.1.5–6.1.6, pp.89–90; AKT §9, Lemma 9.7, pp.75–76, Propositions 9.13 and 9.15 and Corollary 9.14, pp.79–81.)

*Needs:* Layer 0 `fixed_pairing_twist`, Layer 0 `fixed_pairing_twist_rational`, Layer 2 `solvable_preparation`, Weak approximation, InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.7, EC local reduction.

**Checks for `hilbert_local_selection`.**

- Empty Ωw cannot yield a point satisfying all local conditions; nonemptiness
  is required at each selected place.
- For a trivial residual representation after local preparation, a local
  ordinary prototype and a local supersingular prototype give different open
  conditions on the same rational parameter curve.
- An anisotropic genus-zero curve has no rational point; this target
  uses `fixed_pairing_twist_rational`, not local nonemptiness alone, to invoke
  Hilbert irreducibility on ℙ¹.

Every place over the prescribed prime is constrained, not just the chosen lift of a place. A point found by finite search is not a substitute for avoiding the thin set.

### 2.3 Switching outputs and their automorphic local types

The retained Tate places give the auxiliary curve a non-CM witness independently of its prescribed ordinary/supersingular partition. Use ShimuraVarieties §5.6 after a finite extension defining all geometric CM endomorphisms to obtain potential good reduction everywhere; combine this with nonintegral j at a Tate place before choosing its cuspidal modular representation. The good-reduction comparison then gives an unramified local factor, while the multiplicative comparison gives ordinarity.

**`switch_five`** — Let F be imaginary CM, ρ̄:GF→GL₂(𝔽5) continuous with det=ε̄5 and decomposed generic, and partition the places v|5 as S5st⊔S5ord⊔S5ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,5≅ρ̄|GL, and ρ̄|GL remains decomposed generic. ζ5∉F is not a hypothesis of this proposition. The construction also retains Tate reduction at every place above 2 and 3, independently of the prescribed 5-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere. (CN, Proposition 6.1.5, pp.88–89.)

*Needs:* Layer 2 `solvable_preparation`, Layer 2 `hilbert_local_selection`, Layer 2 `seed_modular`, EC isogenies, EC local reduction, ShimuraVarieties §5.6 `TauCeti.Shimura.cm_potential_good_reduction`.

Taking S5ss to be all 5-adic places yields an auxiliary curve with good supersingular reduction everywhere above 5. The modularity argument never invokes the target CN Theorem 6.1, avoiding a cycle. The auxiliary curve is non-CM even when every prescribed 5-adic place is supersingular: retain its Tate places above 2 and 3.

**`switch_three`** — Let F be imaginary CM with ζ5∉F, ρ̄:GF→GL₂(𝔽3) continuous with det=ε̄3 and decomposed generic, and partition all places v|3 as S3st⊔S3ord⊔S3ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,3≅ρ̄|GL, and ρ̄|GL remains decomposed generic. The construction also retains Tate reduction at every place above 5, independently of the prescribed 3-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere. (CN, Proposition 6.1.6, pp.89–90; AKT §9, Corollary 9.14 and Proposition 9.15, pp.80–81.)

*Needs:* Layer 2 `solvable_preparation`, Layer 2 `hilbert_local_selection`, Layer 2 `switch_five`, Layer 2 `seed_modular`, ArithmeticGaloisRepresentations §§4.2–4.7, EC isogenies, EC local reduction, ShimuraVarieties §5.6 `TauCeti.Shimura.cm_potential_good_reduction`.

The ζ5 condition belongs here and is kept when invoking the ordinary mod-5 seed. Supersingular at 3 is allowed; ordinary modularity lifting is used at 5, not incorrectly at 3. The auxiliary curve is non-CM even when every prescribed 3-adic place is supersingular: retain its Tate places above 5.

**`auxiliary_local_types`** — For A/L supplied by switch_five (p=5) or switch_three (p=3), A is non-CM by its retained Tate places; let π be its weight-zero cuspidal modular representation with rπ,ι≅rA,p∨. For every w|p above v of F, π is ι-ordinary if v∈Spst; πw is unramified if v∈Spord∪Spss. In the latter case the associated p-adic representation is crystalline with N=0 and is potentially ordinary precisely in the ordinary case. Use p=5 for switch_five and p=3 for switch_three when applying CN Lemma 6.1.7. (CN, Lemma 6.1.7, p.90, and Theorem 6.1 proof.)

*Needs:* Layer 2 `switch_five`, Layer 2 `switch_three`, Layer 1 `automorphic_wd`, Layer 1 `automorphic_potentially_multiplicative_ordinary`, EC local reduction, EC isogenies, ShimuraVarieties §5.6 `TauCeti.Shimura.cm_potential_good_reduction`.

**Checks for the switching outputs and `auxiliary_local_types`.**

- Prescribing supersingular reduction at all 5-adic places leaves the Tate
  places above 2 and 3 in `switch_five`, and hence its non-CM witness.
- Prescribing supersingular reduction at all 3-adic places leaves the Tate
  places above 5 in `switch_three`, and hence its non-CM witness.
- A negative valuation of j at a retained Tate place remains negative after
  every finite extension; it contradicts potential good reduction from CM.
- At a good ordinary or supersingular place N=0; at a split multiplicative
  place N≠0 and the automorphic factor is ordinary Steinberg-type.

A Tate place excludes CM of A; no inference from CM of A to modularity of the target E is used.

### Examples

Take the prescribed supersingular set to be every place above 5. The p=5 switch still has a modular seed, because its Tate and discriminant conditions are imposed at 2 and 3. For the p=3 switch, prescribing supersingular reduction at every place above 3 is compatible with Tate reduction above 5 (CN Propositions 6.1.5–6.1.6, pp.88–90).

### Dependencies

Layer 1 supplies modularity and automorphic local types. The independent AKT ordinary/dihedral lifting contracts supply the seed. The twist/discriminant adapter, weak approximation and Hilbert irreducibility/globalization contracts supply local preparation and selection.

## Layer 3: CM modularity and equation density

### 3.1 Elliptic input to qualified CM lifting

The local representation comparison is unconditional for elliptic curves. Only the witness-preserving extension clause assumes residual decomposed genericity. Match its reduction partition with the switching output and invoke the imported qualified lifting theorem. At p=3,5 the cyclotomic extension degree divides p−1 and so is never 3; the separate p=5 projective-field condition still needs the residual-image lemma and full avoidance. Soluble descent returns to the original field.

**`elliptic_lifting_data`** — For an elliptic curve E over an imaginary CM field F and p∈{3,5}, ρ=rE,p∨ is continuous, det ρ=εp⁻¹ and unramified at almost all finite places. At every v|p it is potentially semistable with the source-normalized labeled Hodge–Tate weights {0,1}. For the extension assertion additionally assume the selected residual representation is decomposed generic, fix a witnessing rational prime q>5, and fix a finite Galois avoidance field containing the residual and cyclotomic fields. Then after a finite Galois solvable CM extension disjoint from that avoidance field and splitting every place above q, the potentially good places are Barsotti–Tate (ordinary exactly at the potentially ordinary ones), while the potentially multiplicative places become split multiplicative and the dual local representation is a noncrystalline extension of εp⁻¹ by 1. Translate the imported convention HT(εp)=+1 to CN’s HT(εp)=−1 when using the imported comparison; do not swap the covariant Tate module with its dual. (CN, Proof of Theorem 6.1, p.90, with §5.1, Theorem 5.2, pp.73–74.)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.IsElliptic`, EC local reduction, AutomorphicGaloisRepresentationsPartII AG2.P, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.19 and R07.6.1, Layer 2 `solvable_preparation`, ArithmeticGaloisRepresentations §6.1, AutomorphicGaloisRepresentationsPartII AG2.7, “Infinitely many decomposed generic primes”.

The determinant, ramification and potentially semistable weight assertions require only E/F elliptic, F imaginary CM and p∈{3,5}. The witness-preserving extension assertion additionally requires residual decomposed genericity, a fixed witnessing rational q>5 and a specified finite Galois avoidance field.

For the source convention the dual, not the covariant Tate module, has weights {0,1}. The potentially multiplicative case has N≠0 and cannot enter the crystalline set. A curve with no supplied generic witness still has the unconditional local comparison; the witness-preserving extension clause cannot be invoked for it.

**`cm_modularity`** — Let F be an imaginary CM number field with ζ5∉F and E/F elliptic. If for at least one p∈{3,5}, r̄E,p is decomposed generic and r̄E,p|GF(ζp) is absolutely irreducible, then E is modular. No Galois-over-ℚ hypothesis is imposed. Decomposed genericity has the existential rational-prime/all-places eigenvalue-nonratio meaning, not merely distinct eigenvalues. (CN, Theorem 6.1 and proof, pp.87,90.)

*Needs:* Layer 1 `Modular`, Layer 3 `elliptic_lifting_data`, Layer 2 `switch_five`, Layer 2 `switch_three`, Layer 2 `auxiliary_local_types`, Layer 1 `modularity_transport`, ArithmeticGaloisRepresentations §4.7, AutomorphicGaloisRepresentationsPartII AG2.7, “Decomposed generic residual representation”, Layer 0 `qualified_cm_lifting`.

Theorem applies to non-Galois CM fields when the residual conditions are given. The final statement is never extended to ζ5∈F by deleting that hypothesis. The supplier’s extra condition d_cyc≠3 or projective image not A4 is discharged by d_cyc|p−1 for p=3,5; its general odd-prime theorem is not silently strengthened.

**`quadratic_modularity`** — Let F be imaginary quadratic and E/F elliptic. If r̄E,3|GF(ζ3) or r̄E,5|GF(ζ5) is absolutely irreducible, E is modular. Layer 0 `quadratic_genericity` supplies decomposed genericity; it is not an additional hypothesis on E. Since [ℚ(ζ5):ℚ]=4, an imaginary quadratic F does not contain ζ5. (CN, Corollary 6.1.1, p.87, and Lemma 6.2.2, pp.90–91.)

*Needs:* Layer 3 `cm_modularity`, Layer 0 `quadratic_genericity`.

Absolute irreducibility is on the cyclotomic restriction; irreducibility over 𝔽p alone is not substituted here.

### 3.2 Integral equations and quantitative density

Count coefficient pairs in the integral lattice, including distinct pairs defining isomorphic curves. The fixed norm is on the real tensor of the full coefficient lattice. The quantitative exceptional-image estimate, lattice denominator asymptotic and deletion of the singular locus come from the lattice count and `equation_exceptional_image_bound`. Ordinary Hilbert irreducibility alone does not supply the counting bound.

**`shortEquationFamily`** — For a number field F with ring of integers 𝒪F, the equation family is the set of pairs (a,b)∈𝒪F² with 4a³+27b²≠0, representing y²=x³+ax+b via the existing five-coefficient Weierstrass curve (0,0,0,a,b). Its ordering is H(a,b)=‖(a,b)‖ for a fixed norm on the finite-dimensional real vector space ℝ⊗ℤ𝒪F² as in Zywina §1.1. Distinct coefficient pairs are counted separately, without isomorphism quotient or stabilizer weights. At X count pairs with H≤X; take the ratio of modular pairs to all nonsingular pairs and its limit as X→∞. (CN, Corollary 6.1.2 proof, pp.87–88; ZYW §1.1, pp.1–2, and §5, Proposition 5.2, p.6 (proof §5.4, p.9).)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.Δ`, Mathlib `WeierstrassCurve.IsElliptic`, Mathlib `NumberField.canonicalEmbedding.integerLattice.inter_ball_finite`.

**`equation_exceptional_image_bound`** — For a number field F of degree d,
with any fixed norm on `ℝ ⊗_ℤ O_F²`, the nonsingular integral coefficient
pairs of height at most X whose mod-5 image does not contain `SL₂(F₅)`
have relative proportion `O((log X)^β / X^(d/2))` for some β, with constants
depending on F and the norm. The denominator is the nonsingular coefficient
count and has order `X^(2d)`; deleting `4a³+27b²=0` does not change its
leading term. (ZYW §1.1, pp.1–2; §5, Proposition 5.2, p.6 and §5.4, p.9.)

*Needs:* Mathlib `NumberField.canonicalEmbedding.integerLattice.inter_ball_finite`;
`shortEquationFamily`; Hilbert irreducibility and the quantitative large-sieve
argument of ZYW §5. This target includes that quantitative argument.

**`density_one`** — Fix an imaginary CM number field F, Galois over ℚ, with ζ5∉F, and any norm height of shortEquationFamily. As X→∞, the fraction of nonsingular integral short Weierstrass equations of height ≤X defining modular elliptic curves tends to 1. For d=[F:ℚ], the bad-image fraction is O((log X)^β/X^(d/2)) for a constant β and constants depending on F and the fixed norm, by Zywina Proposition 5.2. This quantitative bound is for failure of the mod-5 image to contain SL₂(𝔽5); modularity failure is a subset. This is not a statement about all imaginary fields, or about isomorphism classes. (CN, Corollary 6.1.2, pp.87–88 (=Theorem 1.2); ZYW §5, Proposition 5.2, p.6 (proof §5.4, p.9).)

*Needs:* Layer 3 `shortEquationFamily`, Layer 3 `cm_modularity`, Layer 0 `large_image_genericity`, ArithmeticGaloisRepresentations §4.7, Layer 3 `equation_exceptional_image_bound`.

The denominator is the number of nonsingular integral equations, not the number of isomorphism classes. For F=ℚ(i), the statement yields the specified equation density, while the stronger unconditional curve theorem uses the separate X₀(15) route.

The defining interface consists of these named statements.

- `shortEquationFamily.mem`: Membership is exactly a,b integral and 4a³+27b²≠0.
- `shortEquationFamily.discriminant`: The associated Mathlib curve has Δ=−16(4a³+27b²), so the family condition is exactly ellipticity in characteristic zero.
- `shortEquationFamily.height_count`: The family’s count at X equals the the integral-lattice unweighted count of its coefficient lattice points of norm ≤X; no curve-isomorphism quotient enters.

Use the canonical coefficient embedding (a,b) ↦ 1⊗(a,b) in
ℝ⊗ℤ𝒪F², with its canonical additive group and real scalar action.
The norm satisfies Mathlib `NormedSpace.Core` for these fixed structures;
`shortEquationFamily.height_count` takes that compatibility as a hypothesis.
For any such norm and any real bound X,
the bounded nonsingular coefficient set is finite. Its cardinality equals
the cardinality of the bounded subtype of `shortEquationFamily F`. At X≤0
the count is zero. Once the bound contains (0,1), the count is at least one;
when it also contains (0,64), the count is at least two. These last two
equations define isomorphic curves, so the distinction tests the specified
unweighted coefficient count. The norm-height convention and finiteness are
ZYW §1.1, pp.1–2; the lattice finiteness and counting API come from Mathlib `NumberField.canonicalEmbedding.integerLattice.inter_ball_finite`.

**Checks.**

- (0,0) is excluded because its discriminant is zero.
- (0,1) is included and its discriminant is −432.
- At X≤0 the count is zero. Moving the group origin to (0,1), or changing
  the real scalar action to make independent lattice vectors collinear,
  violates the fixed-structure norm hypothesis.
- The pairs (0,1) and (0,64) are distinct family elements, although their curves are F-isomorphic by scaling x by 4 and y by 8; a count of isomorphism classes would identify them.

### Examples

The pairs (0,1) and (0,64) give distinct nonsingular equations, even though scaling coordinates by 2 identifies their elliptic curves. Both contribute to the coefficient count. The pair (0,0) contributes nothing, including at height zero (ZYW §1.1, pp.1–2; the discriminant identity for the displayed models).

### Dependencies

Layers 1–2 supply the modular auxiliary curve and descent. Qualified CM Barsotti–Tate lifting, elliptic local comparison and the quadratic residual-image genericity contract give the modularity milestones. Arithmetic statistics supplies the norm-height count and exceptional-image bound.

## Layer 4: Cartan modular curves and explicit j-maps

### 4.2 Five source-normalized j-functions

Keep these exact coordinates when forming mixed fiber products. Their projective map degrees are respectively 4,6,3,10,6, whereas their integer degrees are 3,1,3,0,3. Record zero and infinity cusp orders using reduced fractions. The Fricke action at b5 is 125/x; the 5/x action in the genus-one mixed quotient is a different coordinate formula.

**`b3J`** — Define b3J∈RatFunc ℚ by the rational expression (x+27)(x+3)³/x, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b3) only through the identification in small_curve_models. Its morphism degree is 4; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient. (CN, Proposition 7.1.3(1), p.94.)

*Needs:* Mathlib `RatFunc.mk`, Mathlib `RatFunc.eval`, Mathlib `RatFunc.intDegree`.

**`b5J`** — Define b5J∈RatFunc ℚ by the rational expression (x²+250x+3125)³/x⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b5) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 1, a different invariant. Cusp evaluation is never read as a finite field quotient. (CN, Proposition 7.1.3(2), p.94.)

*Needs:* Mathlib `RatFunc.mk`, Mathlib `RatFunc.eval`, Mathlib `RatFunc.intDegree`.

**`ns3J`** — Define ns3J∈RatFunc ℚ by the rational expression x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns3) only through the identification in small_curve_models. Its morphism degree is 3; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient. (CN, Proposition 7.1.3(3), p.94.)

*Needs:* Mathlib `RatFunc.mk`, Mathlib `RatFunc.eval`, Mathlib `RatFunc.intDegree`.

**`ns5J`** — Define ns5J∈RatFunc ℚ by the rational expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns5) only through the identification in small_curve_models. Its morphism degree is 10; its RatFunc.intDegree (numerator degree minus denominator degree) is 0, a different invariant. Cusp evaluation is never read as a finite field quotient. (CN, Proposition 7.1.3(4), p.94.)

*Needs:* Mathlib `RatFunc.mk`, Mathlib `RatFunc.eval`, Mathlib `RatFunc.intDegree`.

**`s3J`** — Define s3J∈RatFunc ℚ by the rational expression 27(x+1)³(x−3)³/x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(s3) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient. (CN, Proposition 7.1.3(6), p.94.)

*Needs:* Mathlib `RatFunc.mk`, Mathlib `RatFunc.eval`, Mathlib `RatFunc.intDegree`.

**Hypothesis `small_curve_models`.** There are ℚ-isomorphisms X(b3), X(b5), X(ns3), X(ns5), X(s3)≅ℙ¹ with j-functions b3J, b5J, ns3J, ns5J, s3J respectively. Under the b5 coordinate the Fricke involution w5 sends x to 125/x. The j-map degrees are respectively 4,6,3,10,6, with the pole multiplicities read from the displayed rational functions. These degrees include infinity and are not RatFunc.intDegree. (CN, Proposition 7.1.3(1)–(4),(6), p.94.)

*Needs:* ModularCurvesPartII §§9.6–9.7, Layer 4 `b3J`, Layer 4 `b5J`, Layer 4 `ns3J`, Layer 4 `ns5J`, Layer 4 `s3J`, ModularCurvesPartII §§9.6–9.7.

For each displayed rational function r, also compute the extension degree
[ℚ(x):ℚ(r)] on Mathlib's `RatFunc ℚ` and
`IntermediateField.adjoin ℚ {r}`. The signatures
`b3J_functionFieldDegree`, `b5J_functionFieldDegree`,
`ns3J_functionFieldDegree`, `ns5J_functionFieldDegree` and
`s3J_functionFieldDegree` give respectively 4,6,3,10,6. For a reduced
nonconstant fraction the extension degree is the maximum of its numerator
and denominator degrees. Transport this calculation through the stated
proper-curve isomorphisms to get the geometric j-morphism degrees.
The coordinate formulas are CN Proposition 7.1.3(1)–(4),(6), p.94;
the rational-function and degree dictionary belongs to the modular-curve
and function-field suppliers already named below.

The b5 coefficient is 250 in this coordinate, not the coefficient 10 of another standard X₀(5) coordinate. The ns5 value at infinity is 8000, so infinity is noncuspidal.

The defining interface consists of these named statements.

- `b3J_fraction`: b3J is exactly the displayed RatFunc.mk expression (x+27)(x+3)³/x.
- `b3J_eval`: For a characteristic-zero field K, x∈K and the denominator x nonzero, evaluating b3J along ℚ→K at x gives (x+27)(x+3)³/x.
- `b3J_intDegree`: RatFunc.intDegree(b3J)=3; the actual geometric j-morphism degree is 4, proved with small_curve_models.
- `b5J_fraction`: b5J is exactly the displayed RatFunc.mk expression (x²+250x+3125)³/x⁵.
- `b5J_eval`: For a characteristic-zero field K, x∈K and the denominator x⁵ nonzero, evaluating b5J along ℚ→K at x gives (x²+250x+3125)³/x⁵.
- `b5J_intDegree`: RatFunc.intDegree(b5J)=1; the actual geometric j-morphism degree is 6, proved with small_curve_models.
- `ns3J_fraction`: ns3J is exactly the displayed RatFunc.mk expression x³.
- `ns3J_eval`: For a characteristic-zero field K, x∈K and the denominator 1 nonzero, evaluating ns3J along ℚ→K at x gives x³.
- `ns3J_intDegree`: RatFunc.intDegree(ns3J)=3; the actual geometric j-morphism degree is 3, proved with small_curve_models.
- `ns5J_fraction`: ns5J is exactly the displayed RatFunc.mk expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
- `ns5J_eval`: For a characteristic-zero field K, x∈K and the denominator (x²+x−1)⁵ nonzero, evaluating ns5J along ℚ→K at x gives 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
- `ns5J_intDegree`: RatFunc.intDegree(ns5J)=0; the actual geometric j-morphism degree is 10, proved with small_curve_models.
- `s3J_fraction`: s3J is exactly the displayed RatFunc.mk expression 27(x+1)³(x−3)³/x³.
- `s3J_eval`: For a characteristic-zero field K, x∈K and the denominator x³ nonzero, evaluating s3J along ℚ→K at x gives 27(x+1)³(x−3)³/x³.
- `s3J_intDegree`: RatFunc.intDegree(s3J)=3; the actual geometric j-morphism degree is 6, proved with small_curve_models.

**Checks.**

- b3J evaluated at x=1 is 1792.
- b3J evaluated at x=−3 is 0.
- The reduced denominator of b3J vanishes at 0; totalized field evaluation there is 0 but the geometric j-map has a pole, not a j=0 point.
- b5J evaluated at x=1 is 38477541376.
- b5J evaluated at x=−5 is -2194880.
- The reduced denominator of b5J vanishes at 0, which is a cusp rather than a finite j-value.
- ns3J evaluated at x=0 is 0.
- ns3J evaluated at x=2 is 8.
- ns3J has reduced denominator 1 and intDegree=3; infinity is its unique pole.
- ns5J evaluated at x=0 is 0 and this is not a cusp.
- ns5J evaluated at x=−1/2 is 0.
- ns5J has intDegree=0 and finite value 8000 at infinity; its poles are the two roots of x²+x−1, not infinity.
- s3J evaluated at x=1 is −1728.
- s3J evaluated at x=−1 is 0.
- The reduced denominator of s3J vanishes at 0 and intDegree=3; 0 and infinity are poles.

### 4.3 The actual nonsplit Cartan conic

The nonsplit conic is a degree-two cover of the rational normalizer curve. Completing the square gives its rational-point obstruction and provides a direct test against conflating the two groups. Its coordinate projection uses the assumed normalized ns3 model.

**Hypothesis `nonsplit_cartan_conic`.** X(ns3°) is the smooth projective conic Y²+3X²+36XZ+432Z²=0 over ℚ. Its degree-two map to X(ns3) sends [X:Y:Z] to [X:Z], with j=(X/Z)³ on Z≠0 and cusp fiber at Z=0 defined over ℚ(√−3). It has no ℚ-point: its equation is Y²+3(X+6Z)²+324Z²=0. This source-specific comparison distinguishes the actual Cartan from its rational normalizer curve. (CN, Proof of Proposition 7.2.1, p.95; Proposition 7.4.3 proof, p.100; ns3ons5.m opening.)

*Needs:* ModularCurvesPartII §§9.6–9.7, Layer 4 `small_curve_models`, Layer 4 `ns3J`, ArithmeticGaloisRepresentations §4.2.

The cover has geometric genus zero but no rational point. It cannot be replaced by ℙ¹ℚ.

### 4.4 The common elliptic quotient and its rational group

The literal Weierstrass equation is the baseline algebraic object. Its modular identification must transport j and the normalization maps. The rank-one input includes saturation and trivial torsion, so the chosen point D is a generator rather than just a nontorsion point. This distinction enters the quartic index bounds.

**`B`** — Let B/ℚ be the existing WeierstrassCurve with coefficients (0,0,−1,0,1), so its equation is y²−y=x³+1. Its discriminant is −675 and its j-invariant is 0. Its use as X(ns3,ns5), and its Mordell–Weil group, are comparison/arithmetic theorems rather than fields of this definition. (CN, Proposition 7.1.3(5), p.94; ns3ns5-elliptic.m.)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.Δ`, Mathlib `WeierstrassCurve.IsElliptic`, Mathlib `WeierstrassCurve.j`, Mathlib `WeierstrassCurve.baseChange`, Mathlib `WeierstrassCurve.Affine.Equation`, Mathlib `WeierstrassCurve.Affine.Point.mk`.

**Hypothesis `mixed_elliptic_model`.** X(ns3,ns5) is ℚ-isomorphic to B. On a dense affine model x³=125t(2t+1)³(2t²+7t+8)³/(t²+t−1)⁵, put A(t)=t²+t−1 and D(t)=(2t+1)(2t²+7t+8). The source map is [U:V:W]=[−(x/5)A(t)²:D(t):tD(t)], on the standard homogeneous Weierstrass equation V²W−VW²=U³+W³ of B. On V≠0,A(t)≠0 its inverse is t=W/V, x=−5(U/V)D(t)/A(t)². These are inverse rational maps and extend uniquely between the smooth proper normalizations. The raw singular affine fiber product is not itself B. (CN, Proposition 7.1.3(5) and proof, p.94; ns3ns5-elliptic.m.)

*Needs:* ModularCurvesPartII §§9.6–9.7, Layer 4 `small_curve_models`, Layer 4 `B`.

**Hypothesis `B_mordell_weil`.** B(ℚ) is infinite cyclic, with rank 1 and trivial torsion. The hypothesis includes a saturated generator D; pullback arguments must not silently use an unsaturated nontorsion point as a generator. The source labels B as Cremona 225A1. (CN, Proposition 7.1.3(5), p.94; Proposition 7.4.4, p.100.)

*Needs:* Layer 4 `B`, EC Mordell–Weil, EffectiveDiophantineMethods Layer 3, the explicit arithmetic hypotheses of this section.

The hypothesis on `B.toAffine.Point` supplies a point D for which
n ↦ nD is a bijection from ℤ to the whole rational point group. This
specifies saturation as well as rank and torsion. In particular D has
infinite order, while n ↦ n(2D) fails to be surjective. This is the group
statement of CN Proposition 7.1.3(5), p.94, in the point convention needed
by Proposition 7.4.4, p.100.

Rank one alone does not imply that a given point generates the full group.

The defining interface consists of these named statements.

- `B_coefficients`: B has a₁=a₂=a₄=0, a₃=−1 and a₆=1.
- `B_discriminant`: B.Δ=−675 and therefore B is elliptic over ℚ.
- `B_baseChange`: For a characteristic-zero field K with ℚ-algebra structure, B.baseChange K has the same coefficients and equation; identity and composite coefficient changes agree.

**Checks.**

- The Mathlib j-invariant of B is 0.
- (x,y)=(1,2) satisfies the actual B Weierstrass equation: 2²−2=1³+1.
- B.a₃=−1, not +1; (1,2) would fail the unshifted equation y²+y=x³+1.

### Examples

For b3J, numerator degree 4 and denominator degree 1 give morphism degree 4 but integer degree 3. For ns5J both degrees are 10, so integer degree 0 coexists with a degree-10 morphism and a finite value 8000 at infinity (CN Proposition 7.1.3, p.94).

### Dependencies

Layer 1 fixes the modularity vocabulary. Cartan image classification, affine coarse moduli and the compactification/normalization contract supply the curves; Mathlib rational functions and Weierstrass equations supply the literal models. The `B_mordell_weil` input gives the saturated rational generator.

## Layer 5: Genus-one curves and rational divisor classes

### 5.1 The two conductor-fifteen curves and torsion growth

Use `LevelFifteenModels` with its j-maps and cusp divisors and the distinct input `QuadraticLevelFifteenTorsion`. Derive finiteness transfer by the rational isogeny. Only rank zero allows replacing all field-valued points by the listed torsion points. The eight new Gaussian points use the matching table in `GaussianComparisonData`.

**`E15`** — Define E15/ℚ as WeierstrassCurve with coefficients (0,41,0,400,0), whose equation is y²=x(x+16)(x+25). Its discriminant is 207360000≠0. Its identification with the modular curve and rational group is the input `LevelFifteenModels`. (CN, Proof of Corollary 7.1.2, p.93.)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.Δ`, Mathlib `WeierstrassCurve.IsElliptic`, Mathlib `WeierstrassCurve.baseChange`, Mathlib `WeierstrassCurve.Affine.Equation`, Mathlib `WeierstrassCurve.Affine.Point.mk`.

**`Es35`** — Define Es35/ℚ as WeierstrassCurve with coefficients (0,17,0,16,0), whose equation is y²=x(x+1)(x+16). Its discriminant is 921600≠0. Its identification with the modular curve and rational group is the input `LevelFifteenModels`. (CN, Proof of Corollary 7.1.2, p.93.)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.Δ`, Mathlib `WeierstrassCurve.IsElliptic`, Mathlib `WeierstrassCurve.baseChange`, Mathlib `WeierstrassCurve.Affine.Equation`, Mathlib `WeierstrassCurve.Affine.Point.mk`.

**`level_fifteen_finiteness_transfer`** — Assume `LevelFifteenModels`.
For every number field F, X₀(15)(F) is finite iff X(s3,b5)(F) is finite,
equivalently iff E15(F) has rank zero. Apply finite generation and invariance
of rank under the supplied ℚ-isogeny after base change. The j-map and cusp
divisor are transported by the assumed model maps. (CN, proof of
Corollary 7.1.2, p.93.)

*Needs:* `LevelFifteenModels`, EC isogenies, EC Mordell–Weil.

**`quadratic_level_fifteen_points`** — Assume `LevelFifteenModels` and
`QuadraticLevelFifteenTorsion F`. If F is imaginary quadratic and X₀(15)(F)
is finite, every Es35(F)-point comes from Es35(ℚ), and every E15(F)-point
comes from E15(ℚ) unless F=ℚ(i). In that exceptional field exactly eight
points lie outside the rational image. First use finiteness transfer to
make all points torsion, then apply the assumed torsion table; it alone
does not imply finiteness. (CN, proof of Corollary 7.1.2, p.93.)

*Needs:* Layer 5 `level_fifteen_finiteness_transfer`,
`QuadraticLevelFifteenTorsion`, EC torsion.

The Lean proposition structure `QuadraticLevelFifteenTorsion F` records
`quadratic_degree`, the growth equivalences `e15_no_growth_iff` and
`es35_no_growth_iff`, the rational cardinalities `e15_rational_card` and
`es35_rational_card` (both eight), and `gaussian_new_card` (eight torsion
points outside the rational image when i²=−1 has a solution). Each is a
proof of the explicit condition on actual point groups, rather than an
unspecified proposition. These projections are its complete input API;
there is no constructor theorem claiming the computed facts unconditionally.

**Checks.**

- Over a quadratic F with i²=−1 and no square root of 5, the input forces
  E15 torsion growth, no Es35 torsion growth, and eight new E15 torsion points.
- Over a quadratic F with s²=5, it forces growth for both point groups;
  a test limited to imaginary fields would miss this second exception.
- When F has neither square root, it forces both torsion subgroups to be
  the images of the rational point groups. The rank-zero condition is
  still needed for the statement about all points.

ℚ(√5) is real and therefore is excluded by the final imaginary-field hypothesis. The Es35 imaginary exception is empty, not ℚ(i).

The defining interface consists of these named statements.

- `E15_coefficients`: The five coefficients are (0,41,0,400,0).
- `E15_discriminant`: Δ(E15)=207360000 and E15 is elliptic.
- `E15_baseChange`: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+16)(x+25), compatibly with identity and composition.
- `Es35_coefficients`: The five coefficients are (0,17,0,16,0).
- `Es35_discriminant`: Δ(Es35)=921600 and Es35 is elliptic.
- `Es35_baseChange`: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+1)(x+16), compatibly with identity and composition.

**Checks.**

- (0,0) satisfies the E15 equation and gives a nonidentity point of order two.
- The three distinct roots of the cubic are 0,−16,−25.
- Its discriminant is 207360000, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.
- (0,0) satisfies the Es35 equation and gives a nonidentity point of order two.
- The three distinct roots of the cubic are 0,−1,−16.
- Its discriminant is 921600, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.

### 5.2 The Gaussian exceptional orbit

Compute the long Weierstrass invariants in the existing carrier. Apply the Layer 0 `finite_frobenius_comparison` Faltings–Serre criterion to the finite arithmetic input `GaussianComparisonData`, then transport modularity to all eight new noncuspidal E15 torsion j-values by its isogeny, conjugation and twisting table.

**`gaussianExceptional`** — For a characteristic-zero field K and i∈K with i²=−1, define gaussianExceptional(K,i) as WeierstrassCurve with coefficients (i,1,1,6+i,10−15i). Over ℚ(i) this is the LMFDB curve 4050.1-c3. Its discriminant is 58752+107136i and its j-invariant is (−47709+15363i)/256. These coefficient identities do not certify modularity. (LMF-GAUSS, LMFDB 4050.1-c3, curve data; CN Corollary 7.1.2 proof, p.93.)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.Δ`, Mathlib `WeierstrassCurve.IsElliptic`, Mathlib `WeierstrassCurve.j`, Mathlib `WeierstrassCurve.baseChange`.

**`gaussian_exceptional_modular`** — Assume `GaussianComparisonData` and `QuadraticLevelFifteenTorsion ℚ(i)`. The curve gaussianExceptional over ℚ(i) is modular. Every noncuspidal j-value at the eight new E15(ℚ(i))-torsion points is the j-value of an elliptic curve obtained from gaussianExceptional by an ℚ(i)-isogeny, coefficient-field conjugation or quadratic twisting, and consequently is modular. Use the assumed complete matching table and admissible finite equalities to obtain the representation isomorphism from Layer 0 `finite_frobenius_comparison`; then apply Layer 1 transport. (CN, Proof of Corollary 7.1.2, p.93, citing DGP10 and LMFDB 4050.1-c3.)

*Needs:* Layer 5 `gaussianExceptional`, `QuadraticLevelFifteenTorsion`, Layer 1 `modularity_transport`, `GaussianComparisonData`, ArithmeticGaloisRepresentations §§5.1–5.5, Layer 0 `finite_frobenius_comparison`.

A database flag or conductor match is not a proof of modularity. The mod-3 and mod-5 images are Borel in the database example, so quadratic_modularity cannot be invoked to bypass this arithmetic input.

The defining interface consists of these named statements.

- `gaussianExceptional_coefficients`: The five coefficients are (i,1,1,6+i,10−15i).
- `gaussianExceptional_discriminant`: If i²=−1 in characteristic zero, Δ=58752+107136i≠0.
- `gaussianExceptional_j`: With the resulting IsElliptic instance, the Mathlib j-invariant equals (−47709+15363i)/256.

**Checks.**

- Its a₁ coefficient is i, not zero; it is a long Weierstrass model.
- Changing i to −i gives the coefficientwise conjugate curve, with conjugate discriminant and j.
- Over ℚ(i) the coefficient of i in j is 15363/256≠0; the curve is not covered by the rational-j argument.

### 5.3 The weighted quartic, its quotient and special points

Use `GenusOneModel` for the modular interpretation, quotient maps and Fricke coordinate. Its scalar −3 is fixed by the cusp field and determines a genuine twist. Retain weighted projective coordinates at both infinity points. The double-cover quotient has coordinate x and j=b5J(x³); the Fricke relation needed for modularity is on this quotient. No choice of a lift of the involution is silently imposed on the double cover.

**`ns3b5Quartic`** — Define ns3b5Quartic=−3(X⁴+2X³−X²+10X+25)∈ℚ[X]. Its geometric model is the weighted projective equation Y²=−3(X⁴+2X³Z−X²Z²+10XZ³+25Z⁴) in ℙ(1,2,1); Y has weight 2, so ordinary projective homogenization is incorrect. The scalar −3 is a genuine quadratic twist fixed by the cusp field, not a removable normalization. (CN, Proposition 7.2.1(1) and proof, pp.94–95.)

*Needs:* Mathlib `Polynomial.X`, Mathlib `Polynomial.eval`.

The j-function is b5J(x³), not b5J(x); the denominator is x¹⁵.

**`genusOneSpecialPoints`** — For a characteristic-zero field K and s∈K with s²=−3, define the list of weighted homogeneous coordinates ∞+=(1:s:0), ∞−=(1:−s:0), 0+=(0:5s:1), P₁=(−2:−s:1), P₂=(−5/2:5s/4:1). The construction consists of literal triples together with their lifts to C(K) via GenusOneModel. Over K=ℚ(√−3) they are the points used to describe rational Jacobian classes. (CN, Points displayed before Proposition 7.2.2, p.95.)

*Needs:* Layer 5 `ns3b5Quartic`, `GenusOneModel`, Jacobian A.

The defining interface consists of these named statements.

- `ns3b5Quartic_formula`: The polynomial is exactly −3(X⁴+2X³−X²+10X+25).
- `ns3b5Quartic_degree`: Its degree is 4 and its leading coefficient is −3; the two points over infinity require a square root of −3.
- `ns3b5Quartic_fricke`: For x≠0, x⁴·ns3b5Quartic(5/x)=25·ns3b5Quartic(x), giving the coordinate part of the Fricke involution.
- `genusOneSpecialPoints_coordinates`: The five triples have exactly the coordinates displayed in the definition, in that order.
- `genusOneSpecialPoints_on_curve`: All five triples satisfy the weighted quartic equation and define points on C under GenusOneModel.
- `genusOneSpecialPoints_conjugate`: Changing s to −s exchanges ∞+ with ∞− and gives the coefficientwise conjugates of the three affine points; the construction commutes with field embeddings.

**Checks.**

- ns3b5Quartic(0)=−75.
- ns3b5Quartic(−2)=−3.
- ns3b5Quartic(−5/2)=−75/16, agreeing with y=5√−3/4.
- For x=1+2i and y=3+6i, i²=−1,
  y²=h(x), xσ(x)=5, and (5/x,5y/x²)=(1−2i,3−6i)=σP.
  The minus lift has y=−3+6i≠3−6i while keeping that same x-coordinate.
- Removing −3 makes the infinity triple (1:1:0)
  rational; with −3 its Y-coordinate would have to square to −3.
- The first two triples have Z=0 and opposite nonzero Y=±s; the weighted equation is Y²=−3X⁴, not the ordinary cubic equation.
- The third entry of genusOneSpecialPoints is 0+=(0:5s:1), with
  (5s)²=−75=ns3b5Quartic(0).
- For P₂, (5s/4)²=−75/16=ns3b5Quartic(−5/2).

### 5.4 Jacobian points versus rational divisor classes

Assume `GenusOneJacobian` and `GenusOneRationalPicard` with the stated relative Picard meanings. Their input data gives the actual Jacobian, the three classes over ℚ(√−3), and the descent of complete linear systems. Derive the distinction between rational divisors and rational Jacobian points without choosing a rational basepoint on C.

**`genus_one_no_rational_point`** — Under `GenusOneModel` and
`GenusOneJacobian`, C has no ℚ-point: a ℚ-point would base change to a
ℚ₃-point, contrary to the assumed local obstruction. This conclusion does
not follow from genus one or rank zero alone. (CN, point discussion after
Proposition 7.2.1, p.95.)

*Needs:* `GenusOneModel`, `GenusOneJacobian`, base change of points.

**`genus_one_picard_comparison`** — Under `GenusOneJacobian` and
`GenusOneRationalPicard`, the map from degree-zero rational divisors modulo
rational linear equivalence to JacC(ℚ) has image of index two; the two
excluded classes are D₁ and D₂. In particular this map is not surjective,
although all three nonzero Dᵢ are rational Jacobian points. Use the given
injective map and its image {0,D₀} inside the four-element group. (CN,
Proposition 7.2.2 and Remark 7.2.3, pp.95–96.)

*Needs:* `GenusOneJacobian`, `GenusOneRationalPicard`, Jacobian A, Jacobian D.

The Abel–Jacobi point ∞− is only defined over ℚ(√−3); the assumed
JacC/ℚ uses the imported relative Picard construction. The rational Picard
image has order 2 while JacC(ℚ) has order 4. The quotient by the base divisor gives degree-zero classes; no rational base point of C is assumed.

### 5.5 Quadratic points and modularity

Use `GenusOneQuadraticPoints`, whose rational-x or norm-five classification excludes the infinity points. Its source proof uses the two classes of `GenusOneRationalPicard` and treats a degenerate leading coefficient separately; that classification is an input here. Rational x gives rational j; norm-five x gives a Fricke relation between quotient images and a geometric degree-5 Q-curve. Import the Q-curve endpoint for imaginary fields and FLHS for real quadratic fields.

P=(1+2i,3+6i) on C/ℚ(i) is the nonrational-x case with xσ(x)=5.

**`genus_one_points_modular`** — Assume `GenusOneModel` and `GenusOneQuadraticPoints`, and additionally `RealQuadraticCurveData` when F is real quadratic. For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(ns3°,b5) is modular. In the imaginary case rational x gives rational j through the degree-two quotient. For a nonrational affine x the classification gives x(P)x(σP)=5, so the images of P and σP in X(ns3,b5) are related by its specified Fricke w5. The quotient moduli dictionary gives a geometric degree-5 isogeny between E and its conjugate and hence a Q-curve; the Q-curve modularity supplier applies. This does not assert σP=w5P for a chosen lift on the genus-one double cover. Infinite-coordinate points use the quotient/cusp dictionary. For real quadratic F use `real_quadratic_modularity` with `RealQuadraticCurveData`. The imaginary-quadratic specialization requires no `RealQuadraticCurveData`. (CN, Corollary 7.2.5, p.97.)

*Needs:* `GenusOneQuadraticPoints`, `GenusOneModel`, ModularCurvesPartII §§9.6–9.7, Layer 1 `modularity_transport`, EllipticCurveModularity R29.6, EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.6, Layer 0 `real_quadratic_modularity` with `RealQuadraticCurveData` for the real branch.

**Checks for `genus_one_points_modular`.**

- For imaginary quadratic F a rational quotient coordinate gives rational j
  and requires no `RealQuadraticCurveData`.
- The point (1+2i,3+6i) has nonrational x and xσ(x)=5, so it uses the
  geometric degree-5 Q-curve branch rather than rational x.
- The all-real-quadratic branch carries `RealQuadraticCurveData`; the
  imaginary-quadratic specialization does not acquire that hypothesis.

On the quartic h(x)=−3(x⁴+2x³−x²+10x+25), both (x,y)↦(5/x,±5y/x²) induce the same quotient action. The norm-five equation alone does not choose a sign. For P=(1+2i,3+6i), σP equals the plus lift and differs from the minus lift; this is a regression against an inference from x alone, not identification of the actual modular lift.

### Examples

On the weighted quartic over ℚ(i), P=(1+2i,3+6i) satisfies x(P)x(σP)=5. Both coordinate lifts of x↦5/x have the same quotient action; only the plus lift sends this P to its conjugate. The quotient moduli comparison, rather than a sign chosen from x alone, supplies the degree-5 Q-curve argument (CN Proposition 7.2.4 and Corollary 7.2.5, pp.96–97; direct substitution in the model).

### Dependencies

Layers 1, 3 and 4 supply modularity transport, quadratic lifting and the modular curves. The divisor/Picard, Riemann–Roch and Jacobian contracts supply the geometric arithmetic, the explicit arithmetic hypotheses supply the level-fifteen and genus-one data, and the Q-curve and FLHS endpoints supply the two quadratic branches.

## Layer 6: Genus-two curves and exceptional points

### 6.1 The sextic and the Fricke comparison

Use the smooth projective hyperelliptic normalization, not the raw affine fiber product. The leading square 9 gives two rational infinity points. The modular map j is transported by the birational comparison; it is not the hyperelliptic x-coordinate. The Fricke involution exchanges the two infinity points.

**`b3ns5Sextic`** — Define b3ns5Sextic=9X⁶−6X⁵−35X⁴+40X²+12X−8∈ℚ[X]. Let C₂gen denote its smooth projective hyperelliptic model y²=b3ns5Sextic(x), with Y of weight 3 and two rational points at infinity Y/X³=±3. Identification with X(b3,ns5) is separate; a singular raw fiber product is not this smooth model. (CN, Proposition 7.3.1(1), p.97; b3ns5.m.)

*Needs:* Mathlib `Polynomial.X`, Mathlib `Polynomial.eval`.

**Hypothesis `genus_two_model`.** The smooth hyperelliptic curve y²=b3ns5Sextic(x) is ℚ-isomorphic to X(b3,ns5). Under this isomorphism the Fricke involution w3 is exactly (x,y)↦(x,−y), exchanging the two rational infinity points. The j-map is transported from the explicit normalized fiber product of b3J and ns5J; it is not the x-coordinate. (CN, Proposition 7.3.1(1)–(2) and proof, p.97; b3ns5.m.)

*Needs:* ModularCurvesPartII §§9.6–9.7, Layer 4 `small_curve_models`, Layer 6 `b3ns5Sextic`, ModularCurvesPartII §§9.6–9.7.

The transported Fricke action is assumed, not inferred from the existence of some order-two automorphism.

The defining interface consists of these named statements.

- `b3ns5Sextic_formula`: The polynomial equals the displayed degree-six expression, with zero coefficient of X³.
- `b3ns5Sextic_degree`: Its degree is 6 and leading coefficient is 9; the infinity points therefore have Y/X³=±3 over ℚ.
- `b3ns5Sextic_squarefree`: The sextic is squarefree over ℚ, so the smooth proper double cover has genus 2 and agrees with its imported hyperelliptic normalization.

**Checks.**

- b3ns5Sextic(0)=−8.
- b3ns5Sextic(−1)=b3ns5Sextic(1/3)=b3ns5Sextic(2)=0, giving three distinct rational Weierstrass points.
- Its degree is 6 with nonzero leading coefficient 9, not degree 5; its smooth completion has two points at infinity.

### 6.2 Finite Jacobian and the quadratic divisor dichotomy

Assume the rank-zero and twenty-class data of `genus_two_jacobian` and `GenusTwoDivisorTable`. The canonical degree-two class moves in the hyperelliptic pencil; a noncanonical effective degree-two class has one representative. Separate the nineteen nonzero rational classes by the real and imaginary supports in that input.

**Hypothesis `genus_two_jacobian`.** For the curve in genus_two_model, Jac(C₂gen)(ℚ)≅ℤ/2⊕ℤ/10. Assume the full table of twenty rational divisor classes in the fixed Mumford/base-divisor convention of b3ns5.m, with its group and divisor relations. The group has rank zero and four rational two-torsion elements. (CN, Proposition 7.3.1(3) and proof, p.97; b3ns5.m.)

*Needs:* Layer 6 `genus_two_model`, Jacobian D, EffectiveDiophantineMethods Layer 3, the explicit arithmetic hypotheses of this section.

The sextic has three rational roots and one irreducible cubic factor; these account for exactly four rational two-torsion classes. No rank conclusion is based solely on a point search.

**`genus_two_divisor_dichotomy`** — Assume `genus_two_model`. Write D∞=∞++∞−, the canonical hyperelliptic degree-two divisor on C₂gen. For a quadratic point P with conjugate σP, if [P+σP]=[D∞], then x(P) lies in ℙ¹(ℚ): on the affine chart P=(x,±√b3ns5Sextic(x)) with x∈ℚ; infinity is treated as x=∞. If [P+σP−D∞]≠0, P+σP is the unique effective divisor in its degree-two class because its Riemann–Roch space has dimension 1. The conclusion includes the distinction between a rational divisor and a merely rational divisor class. (CN, Lemma 7.3.2 and proof, p.98.)

*Needs:* Layer 6 `genus_two_model`, Jacobian A, Jacobian B, Jacobian C.

The zero class has a moving one-dimensional projective linear system and must not be enumerated as one unique effective divisor.

**`genus_two_quadratic_points`** — Assume `genus_two_model`, `genus_two_jacobian` and `GenusTwoDivisorTable`. If F is imaginary quadratic and P∈C₂gen(F) is affine, then x(P)∈ℚ or F=ℚ(√−11) and, up to conjugation, P=((−5+s)/6,±(17−s)/6) with s²=−11. Among the nineteen nonzero rational Jacobian classes, the complete effective-divisor table has nine rational-x classes, two infinity-supported classes, two classes supported on the stated imaginary quadratic pairs and six classes supported on real quadratic points. This enumeration is not a classification of real-quadratic points by the imaginary exceptional set. (CN, Proposition 7.3.3 and proof, p.98; b3ns5.m.)

*Needs:* Layer 6 `genus_two_jacobian`, Layer 6 `genus_two_divisor_dichotomy`, the explicit arithmetic hypotheses of this section.

Substitution with s²=−11 verifies both signs of the stated y-coordinate; replacing it by another rational expression fails the sextic equation.

### 6.3 The √−11 exception and the modularity endpoint

First compute the exceptional long Weierstrass equation and its invariant polynomial reductions. Use `ElevenExceptionalData` for the full mod-5 image and its mixed fiber-product point under normalization. For rational points, including infinity, use rational j. Only a nonrational affine point of exact degree two with rational x satisfies σP=w₃P and yields the degree-3 Q-curve. Real quadratic fields use FLHS rather than the imaginary enumeration.

**`elevenExceptional`** — For a characteristic-zero field K and a∈K satisfying a²−a+3=0, define elevenExceptional(K,a) with Weierstrass coefficients (a,0,1+a,−24−6a,56+13a). Its discriminant is 4512−736a≠0 and j=(11155375a+3126750)/32. Over ℚ(√−11), a=(1+√−11)/2. This is the script’s exceptional curve. Match the conjugate conductor labels 8100.2-a2 in the paper and 8100.3-a2 in the script through the explicit conjugation and model comparison. (MAGMA-b3ns5, b3ns5.m, final exceptional-curve block; Corollary 7.3.4 proof, p.98.)

*Needs:* Mathlib `WeierstrassCurve`, Mathlib `WeierstrassCurve.Δ`, Mathlib `WeierstrassCurve.IsElliptic`, Mathlib `WeierstrassCurve.j`, Mathlib `WeierstrassCurve.baseChange`.

**`eleven_exceptional_modular`** — Assume `ElevenExceptionalData` and `genus_two_model`. Over F=ℚ(√−11), elevenExceptional has full mod-5 image conjugate to the normalizer of a nonsplit Cartan. Thus its restriction to GF(ζ5) is absolutely irreducible, and quadratic_modularity proves it modular. The point of the affine singular fiber product with coordinates x=32a−96 and t=(−a−15)/9 has b3J(x)=ns5J(t)=j(elevenExceptional); after the assumed normalization map it yields one of the two exceptional pairs in genus_two_quadratic_points. Both signs and field conjugates follow by w3 and modularity_transport. (CN, Corollary 7.3.4 proof, p.98; b3ns5.m final block.)

*Needs:* Layer 6 `elevenExceptional`, Layer 6 `genus_two_quadratic_points`, Layer 6 `genus_two_model`, Layer 3 `quadratic_modularity`, Layer 1 `modularity_transport`, ArithmeticGaloisRepresentations §4.2, the explicit arithmetic hypotheses of this section.

Containment in the nonsplit normalizer alone does not imply cyclotomic absolute irreducibility. No Faltings–Serre calculation is necessary here once the full-image hypothesis is available.

**`genus_two_points_modular`** — Assume `ExceptionalCurveData`, and additionally `RealQuadraticCurveData` when F is real quadratic. For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(b3,ns5) is modular. For imaginary F first handle rational P, including both infinity points, by the rational j-map and rational modularity, base change and twisting. A nonrational affine P of exact degree two with rational x satisfies σP=w3P and gives a geometric degree-3 Q-curve. The ℚ(√−11) exceptions are covered by eleven_exceptional_modular. The real-quadratic branch uses `real_quadratic_modularity` with `RealQuadraticCurveData`, not Proposition 7.3.3 outside its imaginary hypothesis. The imaginary-quadratic specialization requires no `RealQuadraticCurveData`. (CN, Corollary 7.3.4, p.98.)

*Needs:* Layer 6 `genus_two_quadratic_points`, Layer 6 `genus_two_model`, Layer 6 `eleven_exceptional_modular`, ModularCurvesPartII §§9.6–9.7, Layer 1 `modularity_transport`, EllipticCurveModularity R29.6, EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.6, Layer 0 `real_quadratic_modularity` with `RealQuadraticCurveData` for the real branch.

**Checks for `genus_two_points_modular`.**

- Each of the two rational infinity points uses rational j; being exchanged
  by w3 does not identify either point with its Galois conjugate.
- A nonrational affine point with rational x has σ(y)=−y and uses the
  geometric degree-3 Q-curve branch.
- The real-quadratic branch requires `RealQuadraticCurveData`; the
  ℚ(√−11) branch uses `ElevenExceptionalData` without that real input.

At infinity t=1/x,v=y/x³ gives v=±3 at t=0. Each point is rational and Galois-fixed, while w3 exchanges them. The proof must use rational j there. For nonrational affine P with x∈ℚ, σ sends y to −y; do not apply this assertion to an arbitrary rational P in C(F).

The defining interface consists of these named statements.

- `elevenExceptional_coefficients`: The five coefficients are (a,0,1+a,−24−6a,56+13a).
- `elevenExceptional_discriminant`: If a²−a+3=0 in characteristic zero, Δ=4512−736a≠0.
- `elevenExceptional_j`: The resulting Mathlib j-invariant is (11155375a+3126750)/32.

**Checks.**

- Its a₂ coefficient is 0, not 1; a is the generator satisfying a²−a+3=0.
- Replacing a by 1−a gives the coefficientwise conjugate curve and the conjugate j-value.
- Over ℚ(√−11), the coefficient of a in j is 11155375/32≠0, so rational-j modularity does not apply.

### Examples

The infinity coordinates t=1/x and v=y/x³ have v=±3 at t=0. Both points are rational and Galois-fixed, while w3 exchanges them. They belong to the rational-j branch; the relation σP=w3P is used only for nonrational affine quadratic points with rational x (CN Proposition 7.3.1 and Corollary 7.3.4, pp.97–98).

### Dependencies

Layers 1, 3 and 4 supply transport, quadratic lifting and modular identifications. The Jacobian, Riemann–Roch and arithmetic hypotheses give the twenty-class enumeration. The Q-curve and FLHS endpoints supply modularity after the point classification.

## Layer 7: Bielliptic quartics and quadratic divisors

Every geometric target in this layer assumes `GenusOneModel` through the
branch-locus comparison in `quartic_models`; the literal polynomial and linear
coordinate identities need no such assumption. The rank and torsion data and finite sieve identities are arithmetic inputs;
the index inclusions and modularity consequences are targets.

### 7.1 Homogeneous models and projective involutions

Use variables X,Y,Z with indices 0,1,2. Check homogeneous coordinate transformations before passing to projective automorphisms. The second transformation squares to 25 times the identity and scales its quartic by 625; its induced projective action nevertheless has order two in characteristic zero. Smoothness, the modular identifications, j-maps and both quotient morphisms to B are further geometric comparisons.

**`quartic1`** — Define quartic1=9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C1 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models. (CN, Proposition 7.4.3(1), p.100; ns3ons5.m.)

*Needs:* Mathlib `MvPolynomial.X`, Mathlib `MvPolynomial.eval₂`.

**`quartic1Coordinates`** — For a commutative ℚ-algebra K, define quartic1Coordinates: (Fin 3→K)→(Fin 3→K) by (X,−Y−Z,Z). Its square is 1 times the identity and quartic1(quartic1Coordinates(v))=quartic1(v). Thus it induces an order-two automorphism w1 of C1. (CN, Proposition 7.4.3(1), p.100.)

*Needs:* Layer 7 `quartic1`, Mathlib `MvPolynomial.eval₂`.

**`quartic2`** — Define quartic2=−X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C2 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models. (CN, Proposition 7.4.3(2), p.100; s3ns5.m.)

*Needs:* Mathlib `MvPolynomial.X`, Mathlib `MvPolynomial.eval₂`.

**`quartic2Coordinates`** — For a commutative ℚ-algebra K, define quartic2Coordinates: (Fin 3→K)→(Fin 3→K) by (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z). Its square is 25 times the identity and quartic2(quartic2Coordinates(v))=625quartic2(v). Thus it induces an order-two automorphism w2 of C2. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse. (CN, Proposition 7.4.3(2), p.100.)

*Needs:* Layer 7 `quartic2`, Mathlib `MvPolynomial.eval₂`.

**Hypothesis `quartic_models`.** Assuming `GenusOneModel` for the branch comparison, C1=V(quartic1) and C2=V(quartic2) are smooth nonhyperelliptic projective curves of genus 3 over ℚ, ℚ-isomorphic respectively to X(ns3°,ns5) and X(s3,ns5). Their displayed involutions are the unique nonidentity ℚ-automorphisms, and their degree-two quotient morphisms πi:Ci→B agree with the modular maps through X(ns3,ns5) under mixed_elliptic_model. All j-maps, normalization maps, quotient maps and rational base divisors are exported together. (CN, Proposition 7.4.3(1)–(2) and proof, p.100; ns3ons5.m and s3ns5.m.)

*Needs:* ModularCurvesPartII §§9.6–9.7, Layer 4 `small_curve_models`, Layer 4 `mixed_elliptic_model`, Layer 7 `quartic1`, Layer 7 `quartic2`, Layer 7 `quartic1Coordinates`, Layer 7 `quartic2Coordinates`, ModularCurvesPartII §§9.6–9.7, `GenusOneModel`, Layer 4 `nonsplit_cartan_conic`.

The representative milestone `quartic_involutions` collects the two square
identities and the two polynomial-preservation identities over a commutative
ℚ-algebra. It is the coordinate part of `quartic_models`, before smoothness,
projectivization and the modular quotient identification (CN Proposition
7.4.3(1)–(2), p.100).

The fractional affine formula for w2 has poles; its homogeneous coordinate map extends there. An automorphism with a genus-one quotient alone does not establish compatibility with the modular quotient.

The defining interface consists of these named statements.

- `quartic1_formula`: The polynomial is precisely 9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴.
- `quartic1_homogeneous`: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
- `quartic1_affine`: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.
- `quartic1Coordinates_coordinates`: The three coordinates are (X,−Y−Z,Z).
- `quartic1Coordinates_square`: For every vector v, quartic1Coordinates(quartic1Coordinates(v))=1•v.
- `quartic1Coordinates_preserves`: For every vector v in a commutative ℚ-algebra, quartic1(quartic1Coordinates(v))=quartic1(v).
- `quartic2_formula`: The polynomial is precisely −X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴.
- `quartic2_homogeneous`: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
- `quartic2_affine`: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.
- `quartic2Coordinates_coordinates`: The three coordinates are (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z).
- `quartic2Coordinates_square`: For every vector v, quartic2Coordinates(quartic2Coordinates(v))=25•v.
- `quartic2Coordinates_preserves`: For every vector v in a commutative ℚ-algebra, quartic2(quartic2Coordinates(v))=625quartic2(v).

**Checks.**

- quartic1 evaluated at (0,0,1) is 11.
- quartic1 evaluated at (1,0,0) is 9.
- quartic1 evaluated at (0,1,0) is 1.
- The image of the j=0 coordinate basis vector is (1,0,0).
- The image of the j=1 coordinate basis vector is (0,−1,0).
- The image of the j=2 coordinate basis vector is (0,−1,1).
- quartic2 evaluated at (0,0,1) is 1.
- quartic2 evaluated at (0,1,1) is 0.
- quartic2 evaluated at (-3,7,1) is 0.
- The image of the j=0 coordinate basis vector is (3,8,4).
- The image of the j=1 coordinate basis vector is (1,1,−2).
- The image of the j=2 coordinate basis vector is (2,−8,1).

### 7.2 Imaginary exceptional points

The coordinate construction gives two distinct nonrational points and their conjugates over ℚ(√−55). Polynomial substitution and the modular j-value are separate assertions. The j-value −32768 is rational CM, and these two orbits are the only nonpullback imaginary quadratic pairs in the second sieve.

**`quarticImaginaryPoints`** — For a characteristic-zero field K and s∈K with s²=−55, define quarticImaginaryPoints(K,s) as the ordered pair of projective coordinate triples P1=((1+s)/28,(27−s)/56,1), P2=((3−s)/4,(3+3s)/4,1). Both lie on C2. Under the assumed modular j-map both have j=−32768. The polynomial substitution is separate from the modular-map comparison; changing s to −s gives the conjugate pair. (CN, Proposition 7.4.3(3), p.100; s3ns5.m exceptional-place block.)

*Needs:* Layer 7 `quartic2`, Layer 7 `quartic_models`.

The defining interface consists of these named statements.

- `quarticImaginaryPoints_coordinates`: The ordered coordinate triples are exactly the displayed P1,P2, both with Z=1.
- `quarticImaginaryPoints_on_curve`: If s²=−55 in characteristic zero, evaluating quartic2 at either triple is zero.
- `quarticImaginaryPoints_j`: Under the j-value clause of `ExceptionalCurveData` and `quartic_models`, both points have j=−32768, the rational CM j-value of discriminant −11.

**Checks.**

- Substituting P1 into quartic2 gives zero when s²=−55.
- Substituting P2 into quartic2 gives zero when s²=−55.
- Over ℚ(√−55), both points are nonrational, distinct and have nonzero Z; conjugation sends s to −s, not s.

### 7.3 Rank, torsion and pullback indices

Use the source-specific Chen/new-old data in `quartic_jacobian_ranks` and the general rank-equal inclusion of §0.5. The source-specific factor ranks are algebraic. The torsion input asserts the rational divisor relations and good-reduction bounds; the first quartic only has a torsion inclusion. Apply π*π_*=1+w, then the torsion exponents, to obtain the two different integral index bounds.

**Hypothesis `quartic_jacobian_ranks`.** For both i=1,2, rk Jac(Ci)(ℚ)=rk B(ℚ)=1. The source-specific Chen/de Smit–Edixhoven comparison gives Jac(C1) isogenous to the new part of Jac(X₀(225)/w25), with elliptic factors 225c,225a,225d of ranks 0,1,0. For C2 use the 5-new part of Jac(X₀(225)/⟨w9,w25⟩): the factors are 225a,75c,75a of ranks 1,0,0; w9 has characteristic polynomial T²−1 on each level-75 oldspace. These are isogeny/rank computations, not analytic-rank assertions. (CN, Proposition 7.4.4(1) and proof, pp.100–101.)

*Needs:* Layer 7 `quartic_models`, Layer 4 `B_mordell_weil`, Layer 0 `bielliptic_rank_equal_inclusion`, EffectiveDiophantineMethods Layer 3, the explicit arithmetic hypotheses of this section.

The relevant space for C1 has dimension 3. The C2 level-75 contributions are retained.

**`quarticTorsionClasses`** — In Jac(C2)(ℚ), define D10=[(0:1:1)]−[(-3:7:1)] and D2=5([(0:1:0)]+[(-1/2:-1/2:1)]+Pl2−2Pl1), where Pl1 is the degree-two place cut out in Z=1 by u²−5u+1=0,v+2u−1=0, and Pl2 by u²+u−1=0,v+3u−3=0. The degrees are 1+1+2−2·2=0. These rational divisor classes have exact orders 10 and 2 and D2∉⟨D10⟩. The places here are real quadratic and are distinct from quarticImaginaryPoints. (CN, Proposition 7.4.4(2) proof, p.101; s3ns5.m torsion block.)

*Needs:* Layer 7 `quartic_models`, Jacobian A, Jacobian D, the explicit arithmetic hypotheses of this section.

**Hypothesis `quartic_jacobian_torsion`.** Jac(C1)(ℚ)tors is isomorphic to a subgroup of ℤ/2⊕ℤ/2; no equality is asserted. Jac(C2)(ℚ)tors≅ℤ/2⊕ℤ/10, generated by quarticTorsionClasses. Good reductions at 7,11,13 give gcd of group orders 4 for C1 and 20 for C2; Jac(C1)(𝔽13)≅ℤ/2⊕ℤ/1710, which excludes order-4 cyclic rational torsion. (CN, Proposition 7.4.4(2) and proof, p.101.)

*Needs:* Layer 7 `quartic_models`, Layer 7 `quarticTorsionClasses`, EffectiveDiophantineMethods Layer 3, the explicit arithmetic hypotheses of this section.

**`quartic_pullback_indices`** — Assume `quartic_models`, `quartic_jacobian_ranks`, `quartic_jacobian_torsion` and `B_mordell_weil`. Choose a saturated generator D of B(ℚ)≅ℤ, viewed in Jac(B)(ℚ), and set Gi=⟨πi*D⟩⊂Jac(Ci)(ℚ). Then 2Jac(Ci)(ℚ)⊂⟨Gi,Jac(Ci)(ℚ)tors⟩ for i=1,2. Consequently 4Jac(C1)(ℚ)⊂2G1 and 10Jac(C2)(ℚ)⊂⟨5G2,Jac(C2)(ℚ)[2]⟩. The second inclusion uses the pullback group G2 in Jac(C2)(ℚ). (CN, Proposition 7.4.4(3) and proof, pp.100–101; BOX §3.3, Proposition 3.1 and proof, pp.8–9, using only its 2J inclusion.)

*Needs:* Layer 7 `quartic_models`, Layer 7 `quartic_jacobian_ranks`, Layer 7 `quartic_jacobian_torsion`, Layer 4 `B_mordell_weil`, Layer 0 `bielliptic_rank_equal_inclusion`.

The torsion-input projections have the following exact meanings; the order and independence clauses are assumptions.

- `quarticTorsionClasses_divisors`: The two classes are the images of the displayed rational degree-zero divisors, in the named place convention.
- `quarticTorsionClasses_orders`: D10 has exact order 10 and D2 has exact order 2.
- `quarticTorsionClasses_independent`: The homomorphism ℤ/10⊕ℤ/2→Jac(C2)(ℚ) sending the generators to D10,D2 is injective.

**Checks.**

- 10D10=0, 5D10≠0 and 2D10≠0.
- 2D2=0 and D2≠0.
- D2−5D10≠0, so the subgroup has order 20 rather than 10.

### 7.4 Two complete symmetric-square sieves

Use EffectiveDiophantineMethods §§4.20–4.22 and 5.24 with `QuarticSieveData`. The input specifies the subgroup, annihilating index, base divisor, primes, reduction groups, known divisors and local differential conditions. The proof of completeness is emptiness of the lifted bad-coset intersection; enumerating points up to a height bound is not a substitute.

**`first_quartic_quadratic_divisors`** — Assume `ExceptionalCurveData` and `GenusOneModel`. For C1 and its modular quotient π1:C1→B, Sym²(C1)(ℚ)=π1*B(ℚ). Apply the imported relative symmetric sieve with G=⟨2π1*D⟩, I=4, a rational degree-two base divisor pulled back from the origin of B, good prime 43, and the full known list L′=L∪{Dbase}, where Dbase=π₁*(0_B) and L consists of eight pullback divisors. Use the exact good subset L_43^good⊂L′ containing L. The reduced group red43(G) is cyclic of order 7, and iota43⁻¹(red43(G)) has exactly seven degree-two divisor classes. L covers all seven, each satisfying the relative Chabauty criterion; hence the bad set is empty. Since Dbase is pulled back, L′∪π₁*B(ℚ)=π₁*B(ℚ). (CN, Proposition 7.4.5(1), p.101; ns3ons5.m sieve block.)

*Needs:* Layer 7 `quartic_models`, Layer 7 `quartic_pullback_indices`, EffectiveDiophantineMethods §4.22, EffectiveDiophantineMethods §5.24, the explicit arithmetic hypotheses of this section.

**Checks for `first_quartic_quadratic_divisors` and its sieve input.**

- Dbase∈L′ as required by §5.24, even if Dbase∉L. Eight nonzero
  multiples can cover a cyclic quotient of order seven while omitting zero,
  so seven-class coverage alone does not establish base-divisor membership.
- The exact good subset contains the eight original divisors; adjoining
  Dbase cannot enlarge the bad set, which is already empty.
- Every divisor in L′ is pulled back, so the supplier's conclusion
  L′∪π₁*B(ℚ) introduces no additional quadratic divisors.

**`second_quartic_quadratic_divisors`** — Assume `ExceptionalCurveData` and `GenusOneModel`. For C2 and π2:C2→B, Sym²(C2)(ℚ)=π2*B(ℚ)∪L16, with L16 sixteen rational effective degree-two divisors not pulled back. Eight are sums of rational points not interchanged by w2; eight are conjugate pairs of quadratic points. Precisely two quadratic pairs are imaginary, the pairs of quarticImaginaryPoints over ℚ(√−55); six are real. Use G=⟨5π2*D,D2,5D10⟩, I=10 and good primes 11,43, with Dbase=π2*(0_B), the full known list L=L16∪Lpb containing Dbase, and the exact subsets L_11^good,L_43^good from `QuarticSieveData`. Form both bad sets by removing the reductions of these good subsets, as in EffectiveDiophantineMethods §5.24. The intersection of the two lifted bad-coset sets is empty after the imported symmetric/relative local criteria. A search bound alone is not the completeness proof. (CN, Proposition 7.4.5(2), p.101; s3ns5.m sieve block.)

*Needs:* Layer 7 `quartic_models`, Layer 7 `quarticImaginaryPoints`, Layer 7 `quarticTorsionClasses`, Layer 7 `quartic_pullback_indices`, EffectiveDiophantineMethods §4.21, EffectiveDiophantineMethods §4.22, EffectiveDiophantineMethods §5.24, the explicit arithmetic hypotheses of this section.

**Checks for `second_quartic_quadratic_divisors` and its sieve input.**

- Dbase is pulled back, so Dbase∉L16. The sixteen nonpullback divisors alone
  cannot serve as the full known list L required by §5.24.
- A known divisor whose differential criterion fails at 11 remains in the
  bad set there unless its reduction coincides with one in L_11^good;
  membership in L alone does not remove a residue class.
- If the two lifted bad-coset sets have a common element, the stated sieve
  criterion gives no completeness conclusion; the empty intersection is an
  explicit input, separate from the sixteen-divisor output.

### 7.5 Modularity of the quartic points

A divisor pulled back from B(ℚ) has rational modular j. For j≠0,1728 an elliptic curve with rational j is a quadratic twist of a ℚ-model; for these special values use geometric CM. The second quartic has two additional imaginary orbits, both with rational CM j. Keep its endpoint restricted to imaginary quadratic fields.

**`first_quartic_points_modular`** — Assume `ExceptionalCurveData` and `GenusOneModel`. For every quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(ns3°,ns5), E is modular. Its degree-two divisor is pulled back from B(ℚ) by first_quartic_quadratic_divisors, so its j-value is rational. A rational-j curve over a quadratic field is a quadratic twist of a ℚ-model unless j is 0 or 1728; those cases are geometrically CM. Apply rational modularity, base change and twist invariance, or the CM branch. (CN, Corollary 7.4.6(1), p.102.)

*Needs:* Layer 7 `first_quartic_quadratic_divisors`, Layer 7 `quartic_models`, Layer 1 `Modular`, Layer 1 `modularity_transport`, EllipticCurveModularity R29.6.

**`second_quartic_points_modular`** — Assume `ExceptionalCurveData` and `GenusOneModel`. For every imaginary quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(s3,ns5), E is modular. All relevant irreducible quadratic pairs are pullbacks from B(ℚ), except quarticImaginaryPoints and their conjugates, which have rational CM j=−32768. Rational degree-two sums contribute only rational points and also have rational j. No conclusion for arbitrary real-quadratic exceptional pairs is inferred from this classification. (CN, Corollary 7.4.6(2), p.102.)

*Needs:* Layer 7 `second_quartic_quadratic_divisors`, Layer 7 `quarticImaginaryPoints`, Layer 7 `quartic_models`, Layer 1 `Modular`, Layer 1 `modularity_transport`, EllipticCurveModularity R29.6.

### Examples

The second homogeneous transformation sends (0,0,1) to (2,−8,1), and its second iterate is (0,0,25). Thus it has order two on projective coordinates although its square on vectors is 25 times the identity; the quartic scales by 625 (CN Proposition 7.4.3(2), p.100).

### Dependencies

Layers 1, 4 and 5 supply transport, the common quotient and auxiliary models. The assumed Chen/new-old, rank and torsion data, the rank-equal bielliptic inclusion and the symmetric/relative Chabauty sieve give the index bounds and completeness conclusions.

## Layer 8: Imaginary-quadratic modularity applications

### 8.1 The residual-image criterion

If the cyclotomic restriction is absolutely irreducible, apply Layer 3. Otherwise use the exact Cartan classification from ArithmeticGaloisRepresentations Layer 4 and route the combined 3/5 level to one of the four exceptional curves handled in Layer 5–Layer 7. Ordinary irreducibility over 𝔽p is weaker than absolute irreducibility; the mod-3 exclusion is equality with the full split normalizer, not containment.

**`imaginary_quadratic_residual_modularity`** — Assume `ExceptionalCurveData` as well as `GenusOneModel` and `GenusOneQuadraticPoints` for the exceptional genus-one case and the quartic model comparison. Let F be an imaginary quadratic number field and E/F an elliptic curve. If GF acts irreducibly on E[5] over 𝔽5 (absolute irreducibility is not required), or GF acts irreducibly on E[3] over 𝔽3 and its image is not conjugate to the whole normalizer of a split Cartan, then E is modular. The mod-3 exclusion is equality up to conjugacy with the whole normalizer, not containment in some split normalizer. (CN, Theorem 7.1, p.91; Lemma 7.1.1, pp.92–93; conclusion p.102.)

*Needs:* Layer 3 `quadratic_modularity`, ModularCurvesPartII §§9.6–9.7, the imaginary-quadratic specializations of Layer 5 `genus_one_points_modular` and Layer 6 `genus_two_points_modular` (requiring no `RealQuadraticCurveData`), Layer 7 `first_quartic_points_modular`, Layer 7 `second_quartic_points_modular`, ArithmeticGaloisRepresentations §4.7.

Ordinary irreducibility over 𝔽p is distinguished from absolute irreducibility after coefficient extension and from absolute irreducibility of GF(ζp). The p=3 image excluded by equality may have irreducible proper subgroups; these are not excluded by this theorem.

### 8.2 Finite level-fifteen points and small fields

The residual-image theorem leaves X(b3,b5) and X(s3,b5). Their rational isogeny transfers rank zero; quadratic torsion growth handles all noncuspidal points, including the eight Gaussian j-values. For each small field assume `SmallFieldRanks` for the rational model and its indicated twist. The √−10 point verifies that the finite-point theorem is not a theorem for every imaginary quadratic field.

**`finite_level_fifteen_modularity`** — Assume `LevelFifteenModels`, the family `QuadraticLevelFifteenTorsion F` for quadratic F, `GenusOneModel`, `GenusOneJacobian`, `GenusOneRationalPicard`, `GenusOneQuadraticPoints`, `GaussianComparisonData` and `ExceptionalCurveData` with the exact meanings in the arithmetic-hypotheses section. For an imaginary quadratic number field F with finite X₀(15)(F), every elliptic curve E/F is modular. Finite here means the full set of F-rational points of the compactified curve; since it is an elliptic curve over ℚ with a rational origin, this is equivalent to Mordell–Weil rank zero over F. The statement imposes no restriction on the residual images of E. It is CN Theorem 1.1 and Corollary 7.1.2, not unconditional modularity over every imaginary quadratic field. (CN, Theorem 1.1, p.2; Corollary 7.1.2 and proof, p.93.)

*Needs:* The eight named arithmetic hypotheses in this statement; Layer 8 `imaginary_quadratic_residual_modularity`, Layer 5 `level_fifteen_finiteness_transfer`, Layer 5 `quadratic_level_fifteen_points`, Layer 5 `gaussian_exceptional_modular`, Layer 1 `Modular`, Layer 1 `modularity_transport`, EC Mordell–Weil.

Cusps are discarded when associating an elliptic curve but remain in the finite point set. The Gaussian exception is tied to the full eight-point orbit arithmetic input and Faltings–Serre comparison, not an unsupported database label.

**`small_imaginary_quadratic_modularity`** — Assume the eight arithmetic hypotheses of `finite_level_fifteen_modularity` and `SmallFieldRanks`. For F=ℚ(√−d) with d∈{1,2,3,5}, X₀(15)(F) is finite and hence every elliptic curve over F is modular. Each application assumes algebraic rank zero for the rational elliptic model E15 and its quadratic twist by −d: Layer 0 `quadratic_rank_decomposition` gives rk E15(F)=rk E15(ℚ)+rk E15^(−d)(ℚ)=0. The Gaussian field retains its extra torsion without acquiring positive rank. The representative
`small_imaginary_quadratic_level_fifteen_finite` states this finiteness on the
actual Mathlib point group of E15 after base change; it quantifies over a
number field of ℚ-dimension 2, d∈{1,2,3,5}, and s with s²=−d, finite generation, and dimension zero of the rationalized E15 point group. It derives finiteness from that rank input. The modular-curve
comparison is supplied by `LevelFifteenModels`. (CN, §1 after Theorem 1.1, p.2.)

*Needs:* Layer 8 `finite_level_fifteen_modularity`, Layer 0 `quadratic_rank_decomposition`, `SmallFieldRanks`, `LevelFifteenModels`, `QuadraticLevelFifteenTorsion`, EC Mordell–Weil, EffectiveDiophantineMethods Layer 3, the explicit arithmetic hypotheses of this section.

**Checks for `small_imaginary_quadratic_modularity`.**

- At d=1 both assumed rational ranks vanish; additional Gaussian torsion
  does not alter the conclusion that E15(ℚ(i)) is finite.
- At d=2,3,5 the same rank decomposition uses the respective −d twist,
  rather than the rational rank of E15 alone.
- At d=10 the nontorsion point (−1,6√−10) excludes the rank-zero conclusion;
  this d is outside `SmallFieldRanks`.

Rank computations use algebraic rank bounds; a finite search or numerical L-value is insufficient.

**`sqrt_minus_ten_infinite_level_fifteen`** — Assume `LevelFifteenModels` for the modular interpretation and `QuadraticLevelFifteenTorsion F` for torsion comparison. Let F=ℚ(√−10) and s²=−10. The point (x,y)=(-1,6s) on E15:y²=x(x+16)(x+25) is nontorsion. It is not rational, and QuadraticLevelFifteenTorsion shows that E15(F)tors=E15(ℚ) because F is neither ℚ(i) nor ℚ(√5). Hence X₀(15)(F) is infinite. This gives a concrete field to which finite_level_fifteen_modularity does not apply; it says nothing against modularity of particular curves over that field. (CN, Corollary 7.1.2 torsion-growth proof, p.93; explicit substitution in its E15 equation.)

*Needs:* `LevelFifteenModels`, `QuadraticLevelFifteenTorsion`.

Changing y to 6 or dropping the factor √−10 fails the curve equation. The finite-point hypothesis is not asserted for all imaginary quadratic fields.

### Examples

For d=1,2,3,5, the assumed rank-zero values for E15 and its −d twist and Mordell–Weil rank decomposition prove finiteness over ℚ(√−d). At d=10, the point (−1,6√−10) instead has y²=−360=(−1)·15·24 and is nontorsion. This example fails the finite-point hypothesis without contradicting modularity over that field (CN §1, p.2, and Corollary 7.1.2 proof, p.93; explicit substitution).

### Dependencies

Layer 3 supplies the cyclotomic irreducibility criterion; Layers 4–7 handle the exceptional residual-image curves. The hypotheses `LevelFifteenModels`, `QuadraticLevelFifteenTorsion` and `GaussianComparisonData`, through Layer 5, close the remaining cases; quadratic rank decomposition and `SmallFieldRanks` give the four small fields.

## Downstream consumers

The finite-level-fifteen endpoint supplies modularity of arbitrary elliptic curves over the indicated imaginary quadratic fields, under its eight named arithmetic hypotheses. The genus-one, genus-two and bielliptic quartic arithmetic also gives concrete applications of the Jacobian and effective Diophantine interfaces. The common Cartan compactification and comparison contracts support the separate effective modularity roadmap.

## References

Page locators for CN, AKT, FLHS, BOX and ZYW refer to the fixed PDFs linked here. BF uses PDF page positions, since its author file has no printed page numbers. The published BF article occupies pp.132–139. Code references use file and block names at the specified commit. These references identify the sources of the explicit arithmetic hypotheses and of the retained targets. The named hypotheses record exactly which source computations are assumed. The targets are the mathematical comparisons and modularity consequences of those inputs.

- **DGP**: Luis Dieulefait, Lucio Guerberoff and Ariel Pacetti, [Proving modularity for a given elliptic curve over an imaginary quadratic field](https://www.famaf.unc.edu.ar/~apacetti/papers/Mod.pdf), author PDF; §4 uses its printed pp.9–10.

- **CN**: Ana Caraiani and James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3, 27 March 2025.

- **AKT**: Patrick B. Allen, Chandrashekhar Khare and Jack A. Thorne, [Modularity of GL₂(Fp)-representations over CM fields](https://arxiv.org/pdf/1910.12986v2). arXiv:1910.12986v2, 2 September 2022; Cambridge Journal of Mathematics 11 (2023), 1–158; cited pagination is that of the preprint.

- **SBT**: Nicholas I. Shepherd-Barron and Richard Taylor, [Mod 2 and mod 5 icosahedral representations](https://math.stanford.edu/~rltaylor/klein.pdf), author copy, Lemma 1.1 and proof, p.3.

- **FLHS**: Nuno Freitas, Bao V. Le Hung and Samir Siksek, [Elliptic Curves over Real Quadratic Fields are Modular](https://arxiv.org/pdf/1310.7088v4). arXiv:1310.7088v4, 18 July 2014.

- **BOX**: Josha Box, [Quadratic points on modular curves with infinite Mordell–Weil group](https://warwick.ac.uk/fac/sci/maths/people/staff/box/quadratic_points_4.pdf). Author PDF, 17 July 2019.

- **BF**: Nils Bruin and E. Victor Flynn, [Rational Divisors in Rational Divisor Classes](https://people.maths.ox.ac.uk/flynn/arts/art24.pdf). Author PDF; published in Algorithmic Number Theory, ANTS VI (2004), pp.132–139.

- **Kwon**: Soonhak Kwon, [Torsion Subgroups of Elliptic Curves over Quadratic Extensions](https://www.researchgate.net/publication/238854907_Torsion_Subgroups_of_Elliptic_Curves_over_Quadratic_Extensions). Journal of Number Theory 62 (1997), pp.144–162, [doi:10.1006/jnth.1997.2036](https://doi.org/10.1006/jnth.1997.2036); Theorem 1(iii), pp.144–145.

- **ZYW**: David Zywina, [Elliptic curves with maximal Galois action on their torsion points](https://pi.math.cornell.edu/~zywina/papers/MaximalGalois.pdf). Bulletin of the London Mathematical Society 42 (2010), 811–826, author PDF.

- **MAGMA-b3ns5**: Ana Caraiani and James Newton, [Caraiani–Newton accompanying Magma calculations: b3ns5.m](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/b3ns5.m). modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81.

- **MAGMA-ns3ob5**: Ana Caraiani and James Newton, [Caraiani–Newton accompanying Magma calculations: ns3ob5.m](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/ns3ob5.m). modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81.

- **MAGMA-ns3ons5**: Ana Caraiani and James Newton, [Caraiani–Newton accompanying Magma calculations: ns3ons5.m](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/ns3ons5.m). modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81.

- **MAGMA-s3ns5**: Ana Caraiani and James Newton, [Caraiani–Newton accompanying Magma calculations: s3ns5.m](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/s3ns5.m). modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81.

- **MAGMA-ns3ns5**: Ana Caraiani and James Newton, [Caraiani–Newton accompanying Magma calculations: ns3ns5-elliptic.m](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/ns3ns5-elliptic.m). modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81.

- **LMF-GAUSS**: The LMFDB collaboration, [Elliptic curve 4050.1-c3 over ℚ(i)](https://www.lmfdb.org/EllipticCurve/2.0.4.1/4050.1/c/3). Public database record accessed 7 October 2026.

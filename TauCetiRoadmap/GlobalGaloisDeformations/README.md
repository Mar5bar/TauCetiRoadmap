# Roadmap: global Galois deformation rings

**Summary.** This roadmap builds the functors and complete local rings that classify continuous
lifts of a residual Galois representation `ρ̄ : G → GLₙ(k)`, and the maps between them that
modularity lifting and potential automorphy consume. It starts from lifts, strict equivalence and
determinant laws; proves representability under Mazur's finiteness condition `Φ_p`; assembles local
deformation problems into global framed rings with a presentation over their local rings and a
lower bound on their dimension; constructs restriction, twisting and change-of-problem maps,
including the formal-torus actions and determinant torsors of the dyadic Khare–Wintenberger method;
turns Taylor–Wiles data into deformation rings with diamond actions and uniform generator counts;
and packages the finite-level ring systems of rank-two patching. Two arbitrary-rank branches close
it: global problems with variable determinant over local coefficient rings `Λ_v` (the setting of
Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne) and polarized problems for
the group `𝒢ₙ` of Clozel–Harris–Taylor, with the enormous-image Taylor–Wiles presentation. Its end
theorems are the presentation and dimension bound of Layer R04.3, the Taylor–Wiles systems of
Layer R04.6 (odd and dyadic), and the presentations of Layers G8 and G7. We want it because every
`R = T` argument in the programme, from Khare–Wintenberger to the potential automorphy theorems
over CM fields, needs exactly these rings with their maps, counts and hypotheses; the arithmetic
modules and the patching itself belong to the roadmaps that use them.

Three distinctions run through the document. A representation, its strict equivalence class and its
polynomial-law determinant are different objects, compared by explicit maps that are isomorphisms
only under residual absolute irreducibility. A framed ring, its trace subring, its torsion-free
quotient and its reduced generic fibre are different rings. And the fixed-determinant, the
variable-determinant and the polarized problems have different adjoint modules, different
centralizers and therefore different frame and generator counts; no formula is transported from
one to another by notation.

| Layer | Title | Headline targets |
| --- | --- | --- |
| R04.1 | Deformation functors | `Lift`, `ModDef`, `Def`, `LiftDet`/`DefDet`, change of coefficients, `DetDef`, the determinant map |
| R04.2 | Representability and universal lifts | `PhiP`, `Φ_p` for Galois groups, `R^□`, `univLift`, `R`, framed against unframed, trace generation, determinant comparison, fixed-determinant rings, pseudodeformation rings |
| R04.3 | Local conditions and global presentations | `DeformationProblem`, invariant ideals, `TFramedDef`, `R^{□T}_𝒮`, `Rloc`/`locToGlobal`, the relative tangent space, the presentation, the dimension bound |
| R04.4 | Restriction, twists and changes of problem | `resRing`, finiteness of restriction, enlarging `S`, twisting isomorphisms, `DiagGroup`, free quotients, truncated actions, `RdetOnS`/`detMap`, `twistAction`, freeness, the determinant torsor, inertia-rigid rings |
| R04.5 | Taylor–Wiles data at auxiliary primes | `TaylorWilesDatum`, image hypotheses, dyadic Kummer disjointness, dyadic generator counts, the `Δ_Q`-structure, the shared selection theorem, auxiliary primes in Gee's setting, generator counts |
| R04.6 | Finite-level deformation data for patching | `KWDeformationData`, the trace subring, factorization through local conditions, `TWSystem`, the numerical coincidence, `DyadicPatchingDatum` |
| G8 | Variable-determinant global problems | `GlobalDeformationProblem`, representability and framing, the presentation, fixed against variable determinant |
| G7 | Polarized problems and arbitrary-rank Taylor–Wiles data | `PolarizedDeformationProblem`, representability, tangent and obstruction spaces, the presentation, rank-`n` Taylor–Wiles places, enormous-image primes, the ACC presentation |

The build proceeds through R04.1–R04.6, then G8 and G7: the fixed-determinant rank-two constructions
precede the variable-determinant and polarized branches.

## Scope and ownership

The roadmap owns the deformation theory of Galois representations as a theory of functors and rings:
the lifting, strict-class and fixed-determinant functors and their module description; determinant
deformation functors and the determinant map; Mazur's condition `Φ_p`; universal framed and unframed
rings with their universal objects, framing and determinant comparisons and coefficient change;
continuous pseudodeformation rings of an arbitrary residual determinant, residually reducible ones
included;
local deformation problems with their ideals, global deformation types, `T`-framed global rings, the
local-to-global map, the relative tangent identification, presentations and dimension bounds;
restriction, enlargement of the ramification set, twisting, formal diagonalizable groups, free
quotients and the dyadic twisting torsor; inertia-rigid rings; Taylor–Wiles data as deformation data
with their diamond structures, the shared Chebotarev selection theorem for Selmer detection and the
generator counts at auxiliary levels; the finite-level ring systems of rank-two patching; and the
variable-determinant and polarized global problems with their arbitrary-rank Taylor–Wiles
presentations.

It does not own, and cites instead:

- **Continuous cohomology** (Tau Ceti library at the pins): continuous cocycles, coboundaries and
  first cohomology `TauCeti.ContCohomology.Z1`, `B1`, `H1` in
  `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`. `B1` is the algebraic range
  of the differential; its inclusion in continuous cocycles uses continuity of the action.
- **Profinite generation** (Tau Ceti library). At the pins: `TauCeti.IsTopologicallyFinitelyGenerated`,
  `TauCeti.IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker` (finitely many
  homomorphisms with open kernel to a fixed finite group) and `TauCeti.maximalProPQuotient`; also
  `TauCeti.continuousZModDual`, `TauCeti.finite_continuousZModDual`,
  `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup` (open subgroups of a topologically
  finitely generated profinite group are topologically finitely generated) and
  `TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`. These are the ingredients of
  the characterisation of `Φ_p` in target 2.1; only the predicate `Φ_p` and the two assembled
  statements are targets here.
- **Completed group algebras** (Tau Ceti library at the pins):
  `TauCeti.completedGroupAlgebra 𝒪 Γ` and its inverse-limit projections and tautological group map,
  from `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic`. The rank-one
  universal-ring comparisons use this carrier and do not define another completed group algebra.
- **Ordinary diagonalizable groups** (Tau Ceti library at the pins):
  `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic`,
  `TauCeti.DiagonalizableGroup.pointEquiv` and `pointsMulEquiv` identify the points of
  `Spec 𝒪[a]` with all unit-valued characters of `a`. Target 4.5 keeps the formal completion
  at the identity, whose characters take values in `1 + 𝔪_A`, and its truncation comparison.
- **Tau Ceti roadmaps.** `ClassFieldTheory`, Layer 5 (local Tate duality and the local Euler
  characteristic) and Layer 12 (the global correspondence, used to make the auxiliary twisting group
  finite); `Chebotarev`, Layer 10 (Dirichlet density of a Frobenius class) and 11.3(2) (the
  negligible contribution of primes of residue degree greater than one); `LocalGaloisGroups`, Layer 3
  (topological finite generation of `G_K(p)` for every finite extension `K/ℚ_p`); `ModularCurves`,
  Layer 0C (affine quotients by finite groups and finite locally free group schemes, and their
  torsors); `IntegralHeckeAndGaloisDeterminants`, Layers 0–1 (Chenevier determinants, characteristic
  polynomials, Cayley–Hamilton quotients, henselian reconstruction
  `Determinant.exists_ofMatrix_eq_of_henselian`, and absolutely irreducible coefficient descent
  `coefficient_descent`, CHT Lemma 2.1.10).
- **ArithmeticGaloisRepresentations.** Layer 1 (continuous representations and their integral
  theory); Layer 4 (residual images: `GaloisRep.IsBadDihedral` and the cyclotomic criterion of §4.6,
  the restriction lemmas of §4.7 and `GL2Subgroup.sl2_submodules_charTwo` for nonsolvable dyadic
  images); Layer 5, §5.10 (Carayol's lemma `GaloisRep.carayol_conj_of_trace_eq`: lifts over a
  complete Noetherian local ring with finite residue field and the same absolutely irreducible
  reduction, whose traces agree on a dense subset, are strictly conjugate); Layer 7, §7.2 (the adjoint
  `ContinuousRep.ad`, `adZero`, the trace pairing and the splitting when `n` is invertible, and Schur's
  lemma over a local ring `GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`), §7.4 (the
  group `CHTGroup` `= 𝒢ₙ`, its multiplier and the correspondence between `𝒢ₙ`-valued lifts and CHT
  triples, and polarized representations) and §7.10 (`ResidualImage.IsEnormous`).
- **ArithmeticGaloisDuality.** Layers R02.3–R02.5 and D7 (restricted ramification, Poitou–Tate,
  finiteness of `H¹(G_{F,S}, M)`, the Greenberg–Wiles formula and derived duality); Layer D8
  (*First-order Galois cocycle comparison*, *Determinant tangent fibres*, *Selmer and deformation
  tangent comparison*); Layer R02.6 (*Local cohomology at a Taylor–Wiles prime*, *The group-theoretic
  input to Taylor–Wiles primes*, *The conditional dual-Selmer killing calculation*,
  *Khare–Wintenberger tangent and relation bounds*, *Odd-prime Taylor–Wiles auxiliary sets*,
  *Dyadic auxiliary primes and the cyclotomic residual*, *Finite-order determinant twists*,
  *Archimedean adjoint dimensions*).
- **SelmerIwasawaCohomology**, Layer 2 (Selmer structures and the Selmer complex as a mapping fibre,
  which underlies the framed complexes of ArithmeticGaloisDuality).
- **DeformationAndDerivedPatchingAlgebra**, Layers R03.1–R03.3 (the Artinian and complete Noetherian
  coefficient categories with their residue identifications, small extensions, completed tensor
  products and residue extension; Schlessinger's criteria, hulls, the continuous framed matrix
  construction, minimal presentations and the obstruction bound on relations; excellence,
  equidimensionality and dimensions of completed tensor products).
- **LocalGaloisDeformationRings**: every local ring. In particular
  Layer 1 (local framed rings, 1.1; archimedean rings, 1.11 and 1.14; fixed-determinant and
  coefficient-change versions, 1.10 and 1.12), Layer 2 (Steinberg lifts, 2.5; fixed inertial types,
  2.9; local rings at Taylor–Wiles primes, 2.10; rank-`n` Taylor–Wiles conditions, 2.16 and 2.23),
  Layers 3 and 6 (`p`-adic Hodge-type and ordinary conditions in rank `n`, with their dimensions and
  liftability) and Layer 8 (the local conditions of Khare–Wintenberger, 8.2–8.15, and the completed
  tensor product of their rings, 8.17, with nonemptiness, 8.18).

The following statements are used here and owned by the roadmaps named; each is recorded under
the anchor by which other roadmaps cite it.

- <a id="tangent-spaces"></a>**Tangent spaces of the lifting and deformation functors.** For
  `k[ε] = k[X]/(X²)`, `f ↦ (1 + εf)ρ̄` identifies `Z¹(G, ad ρ̄)` with `Lift_ρ̄(k[ε])`, strict
  equivalence changes cocycles by coboundaries so that `Def_ρ̄(k[ε]) ≅ H¹(G, ad ρ̄)`, the stabiliser of
  a framed lift is `1 + ε H⁰(G, ad ρ̄)`, and fixed determinant corresponds to trace-zero cocycles
  modulo the boundary of the trace sequence: ArithmeticGaloisDuality D8, *First-order Galois cocycle
  comparison* and *Trace-zero adjoint duality without division by n* (Kisin, Lecture 1,
  Lemma (1.3.1), p. 3; Gee, Exercise 3.11 and Corollary 3.12, p. 13). Applied to `Lift` and `Def`
  of Layer R04.1, it gives the framed tangent dimension `h¹(G, ad ρ̄) + n² − h⁰(G, ad ρ̄)` whenever
  the cohomology is finite-dimensional; that count is used in 2.3, 2.6 and Layer R04.3.
- <a id="taylor-wiles-local-cohomology"></a>**Local cohomology at Taylor–Wiles places.** At a
  rank-two Taylor–Wiles place `v ∤ p` with `Nv ≡ 1 (mod p)`, `p` odd and distinct residual Frobenius
  eigenvalues, `h⁰(G_v, ad⁰) = h⁰(G_v, ad⁰(1)) = 1` and `h¹(G_v, ad⁰) = 2`, while the unramified `H¹`
  is one-dimensional, spanned by the class in the diagonal direction: ArithmeticGaloisDuality R02.6,
  *Local cohomology at a Taylor–Wiles prime* and *Odd-prime Taylor–Wiles auxiliary sets*
  (KW final, Lemma 5.4, p. 48). Characteristic two is excluded there and uses 5.3–5.4 below.
- **Existence of odd-prime Taylor–Wiles sets in the Khare–Wintenberger setting.** For `p` odd, `F`
  totally real and unramified above `p`, `ρ̄` totally odd and absolutely irreducible on
  `G_{F(ζ_p)}`, sets `Q_n` of size `h¹_{L^⊥}(S, (ad⁰)ˇ(1))` with `Nq ≡ 1 (mod pⁿ)`, distinct
  eigenvalues and vanishing new dual Selmer group, with generator count `|Q_n| + |S| − 1`:
  ArithmeticGaloisDuality R02.6, *Odd-prime Taylor–Wiles auxiliary sets* (KW final, Lemmas 5.2(1),
  5.3 and Proposition 5.5, pp. 47–48). Target 5.7 applies it and adds Gee's convention.
- **Existence of dyadic Taylor–Wiles sets.** For `p = 2`, `F` totally real and nonsolvable residual
  image, sets `Q_n` with `|Q_n| = h¹(S, Ad) − 2`, the norm, eigenvalue and splitting conditions, the
  `S`-split dimension formula and `G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})^t` with `t = 2 − |S| + |Q_n|`:
  ArithmeticGaloisDuality R02.6, *Dyadic auxiliary primes and the cyclotomic residual* (KW final,
  Lemma 5.10, pp. 50–53). Its Kummer-disjointness hypothesis is target 5.3; its ring-theoretic
  counts are target 5.4.
- **Strict conjugacy from traces, scalar centralizers and descent of coefficients.** For lifts with
  absolutely irreducible reduction over a local ring, the image spans `Mₙ(A)` and the centralizer is
  `A`; over a complete Noetherian local ring with finite residue field equal traces on a dense set
  give strict conjugacy; and if all traces lie in a complete Noetherian local subring with the same
  residue field, the lift is strictly conjugate into it: ArithmeticGaloisRepresentations §7.2 and
  §5.10, and `IntegralHeckeAndGaloisDeterminants.coefficient_descent` (Kisin, Lecture 1,
  Theorem (1.4.1), pp. 3–4; Gee, Lemma 3.7, pp. 12–13; CHT, Lemma 2.1.10, pp. 13–15). Target 2.7
  keeps the consequence for universal rings.
- **The correspondence between `𝒢ₙ`-valued lifts and CHT triples** (CHT, Lemma 2.1.1, p. 7):
  ArithmeticGaloisRepresentations §7.4. Target 8.1 uses it for polarized deformation problems.

Constructing automorphic forms, Hecke modules and patched complexes, and comparing them with the
rings built here, belongs to GL2ModularityLifting, OrdinaryAutomorphicFormsAndModularityLifting and
PotentialAutomorphyInfrastructure. Abstract patching belongs to DeformationAndDerivedPatchingAlgebra.
No `R → T` map, no automorphy lifting theorem and no finiteness of a deformation ring over `𝒪` is
asserted here.

## Conventions

Write `𝒪` for a complete discrete valuation ring with finite residue field `k` of characteristic
`p` (the API also writes `𝔽`), arising as the integers of a finite extension of `ℚ_p` or as
`W(k)`, with maximal ideal `λ`. All ranks `n` are positive. For a profinite group `G` fix a
continuous residual representation `ρ̄ : G → GLₙ(k)`, `k` discrete.

The category `Art_𝒪` consists of Artinian local `𝒪`-algebras with an identified residue field `k`,
and local `𝒪`-algebra maps inducing the identity on it. The category `C_𝒪` consists of complete
Noetherian local `𝒪`-algebras with that identification and the maximal-ideal-adic topology;
completeness includes separatedness. Every residue map `π_A : A ↠ k` is surjective with kernel
`𝔪_A`, and Artinian coefficients carry the discrete topology. An arbitrary ring with a surjection
onto `k` is not an object of either category. Completed tensor products are taken over the stated
coefficient ring, with the local topology and residue identification of
DeformationAndDerivedPatchingAlgebra R03.1. A representing ring is an object of `C_𝒪`;
"pro-represented" refers to the restriction of a functor to `Art_𝒪`.

Write `Γ̂ₙ(A) = ker(GLₙ(A) → GLₙ(k))`. A strict class is an orbit under conjugation by `Γ̂ₙ(A)`.
`ρ̄` is *Schur* if `End_{k[G]}(ρ̄) = k`; absolute irreducibility implies Schur, and the two hypotheses
are not interchangeable in the trace theorems. A lift has continuous matrix entries; over a complete
coefficient ring this is equivalent to a compatible family of continuous lifts over the quotients
`A/𝔪_Aʳ`. A universal deformation is a class; a matrix-valued universal representative is chosen only
where a representative is needed, and statements about it are independent of the choice.

Set `ad ρ̄ = Mₙ(k)` with `g·X = ρ̄(g)Xρ̄(g)⁻¹` and `ad⁰ρ̄ = ker(trace)`, as in
ArithmeticGaloisRepresentations §7.2. Cochains and cohomology are continuous, with differentials
`(d⁰X)(g) = g·X − X` and `(d¹f)(g, h) = g·f(h) − f(gh) + f(g)`. The twist `M(1)` uses the mod `p`
cyclotomic character, and local dual conditions are annihilators under the local Tate pairing. The
self-duality of `ad⁰` and the splitting `ad = k ⊕ ad⁰` require `p ∤ n`. Arbitrary-rank
variable-determinant problems use the full adjoint. In characteristic two the scalars are trace
zero, and every dyadic statement keeps its own module and dual (ArithmeticGaloisDuality D8,
*Trace-zero adjoint duality without division by n*).

A finite ramification set always contains the residual ramification. In the fixed-determinant
presentation of Layer R04.3, `S` consists of finite places, including those above `p`, and the
archimedean places contribute separate sums. Khare–Wintenberger's rank-two convention instead
includes the infinite places in `S` and frames there. The two conventions give different local
rings and different generator counts, and the document never identifies them by notation.

All generator and relation counts and all Euler characteristic identities are first written in
`ℤ`; nonnegativity is proved before a count is used to index variables. Natural-number subtraction
never encodes a dimension formula.

Reciprocity follows the Tau Ceti `ClassFieldTheory` normalisation; where a source uses the opposite
direction the statement says so. Page references are to the editions listed under *References*.

## Exact supplier contracts

### From Mathlib

The library pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

`Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map` and `Matrix.GeneralLinearGroup.det`;
continuity of matrix multiplication and of entrywise maps (`Continuous.matrix_mul`,
`Continuous.matrix_map`); `MulAction.orbitRel` and its quotient; `IsLocalRing`,
`IsLocalRing.maximalIdeal` and `IsLocalRing.ResidueField`; `IsArtinianRing`, `IsNoetherianRing`;
`IsAdicComplete`; `MvPowerSeries` and `PowerSeries`; `Algebra.FormallySmooth`; `DualNumber`;
`OpenSubgroup`, `ProfiniteGrp`, `ContinuousMonoidHom`; module bases, quotients and finite-rank
formulas. A Mathlib carrier is only a carrier: none of the deformation theorems follows from a
carrier's name.

### From Tau Ceti

The library pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are library
contracts; the subsequent roadmap contracts specify the mathematical interfaces consumed from their
named sections.

- `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` supplies
  `TauCeti.ContCohomology.Z1`, `B1` and `H1`. For a topological monoid acting continuously on a
  topological additive group, `Z1` consists of continuous cocycles, `B1` is the range of the degree-zero
  differential, and `B1_le_Z1` supplies the inclusion required for `H1 = Z1/B1`. Use the quotient
  as an additive group; its pointwise quotient topology is not the intended topology of continuous
  cohomology.
- `TauCeti.Topology.Algebra.Group.Generation` supplies
  `TauCeti.IsTopologicallyFinitelyGenerated`,
  `TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup` and
  `TauCeti.IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`. The open-subgroup statement
  assumes a compact topological group; the finite-homomorphism statement assumes a topological group
  with a finite topological generating set and a finite target group, and counts precisely the
  homomorphisms whose kernels are open.
- `TauCeti.Topology.Algebra.Group.Profinite.MaximalProP` supplies
  `TauCeti.maximalProPQuotient`, its continuous surjective quotient map and its universal property
  for continuous maps to pro-`p` groups. `TauCeti.Topology.Algebra.ContinuousZModDual` supplies
  `TauCeti.continuousZModDual p G`, the additive form of continuous characters
  `G → Multiplicative (ZMod p)`, with its `ZMod p`-module structure.
- `TauCeti.Topology.Algebra.Group.Profinite.DualRank` supplies
  `TauCeti.finite_continuousZModDual`: for prime `p`, the continuous dual of a topologically finitely
  generated topological group is finite-dimensional. `TauCeti.Topology.Algebra.Group.Profinite.Rank`
  supplies `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup`, the Schreier bound for an open
  subgroup of a compact topologically finitely generated group.
  `TauCeti.Topology.Algebra.Group.Profinite.ProP.DualRank` supplies
  `TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`: for a compact totally
  disconnected pro-`p` topological group and prime `p`, generator rank equals continuous dual rank
  as a cardinal, without a finite-generation hypothesis.
- `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic` supplies
  `TauCeti.DiagonalizableGroup.pointEquiv` and `TauCeti.DiagonalizableGroup.pointsMulEquiv`.
  For a commutative base ring and an abelian character group `a`, they identify algebra maps
  `𝒪[a] → A` with all characters `a → Aˣ`, and identify convolution with pointwise multiplication.
  The identity-completed character functor of §4.5 is a further target.
- `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` supplies
  `TauCeti.completedGroupAlgebra 𝒪 Γ`, the inverse limit of `𝒪[Γ/U]` over open normal subgroups,
  with its projections `proj`, their determining property `ext`, and the tautological group map
  `of`. For profinite `Γ` and compact adic `𝒪`, use its inverse-limit topology. This is the carrier
  denoted `𝒪⟦Γ⟧`; the universal character property is the deformation-theoretic target of §2.4.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

Layer 0: degree-`n` multiplicative polynomial laws on `A[G]`, Chenevier determinants and their
characteristic coefficients. Layer 1: the Cayley–Hamilton ideal and quotient,
`Determinant.exists_ofMatrix_eq_of_henselian` (over a henselian local ring, a determinant whose
reduction is that of an absolutely irreducible representation is the determinant of a representation
`A[G] → M_d(A)`, unique up to conjugation; its proof passes through the Cayley–Hamilton quotient) and
`coefficient_descent`. Continuous determinant deformation functors and their comparison
with representation deformations are built here (1.9, 1.10, 2.8).

### From TauCetiRoadmap.ClassFieldTheory, Chebotarev, LocalGaloisGroups and ModularCurves

ClassFieldTheory Layer 5 also supplies `finite_H`: for a characteristic-zero nonarchimedean local
field and any finite smooth discrete Galois module, cohomology in degrees zero through two is finite. In particular it
applies to the trivial module `𝔽_p`, including residue characteristic different from `p`, and to
every finite extension of the local field. The selection theorem 5.7 uses Chebotarev's density theorem
and its discard of primes of higher residue degree; it does not develop a second density theory.
Target 4.6 completes the affine quotients of `ModularCurves` 0C at the given local points; the
quotient construction itself is not rebuilt.

### From ArithmeticGaloisRepresentations, ArithmeticGaloisDuality and SelmerIwasawaCohomology

The declarations and targets listed under *Scope and ownership*, with these contracts:
continuous representations of profinite groups on finite free modules over topological coefficient
rings with their adjoints; the finite residual-image classification and the detecting elements used
in prime selection, in the source-specific forms stated in 5.2; arithmetic finiteness, local and
global duality, the Greenberg–Wiles formula, the framed and modified Selmer complexes of D8 with
their exact differential and sign conventions, Euler characteristics, and the residual-image
cohomology vanishing used in prime selection. The framed complexes are mapping fibres in the sense
of SelmerIwasawaCohomology §2.21, *Selmer complex as a mapping fibre*; the kernel Selmer group
is its §2.2, *Compact and rational Selmer kernel*.

### From DeformationAndDerivedPatchingAlgebra

R03.1: the categories `Art_𝒪` and `C_𝒪`, small extensions, fibre products, completed tensor products
with their coproduct property, and change of residue field. R03.2: Schlessinger's criteria and hulls,
*Continuous framed representability* (the continuous framed matrix construction), minimal
presentations, the relation space and the obstruction bound on relations, and the example of a hull whose functor is not pro-representable. R03.3: excellence,
regular completion maps, equidimensionality and the dimension of completed tensor products.

### From LocalGaloisDeformationRings

The local rings named under *Scope and ownership*, with their tangent spaces, dimensions,
nonemptiness and liftability. Both roadmaps use the same local-condition and framing conventions;
this roadmap supplies their global assembly and restriction maps, and its R04.4 finite-inertia model
(4.12) is the construction used in R04.6, while general fixed-type quotients stay in
LocalGaloisDeformationRings 2.9.

## How to read the build

Layer R04.1 defines the functors on coefficient rings: lifts, module deformations, strict classes,
fixed determinant, coefficient change and determinant laws. Layer R04.2 proves representability
under `Φ_p` and compares the resulting rings: framed against unframed, representations against
determinants, fixed against free determinant, and coefficient change. Layer R04.3 imposes local
conditions, builds the global `T`-framed rings with their map from the local rings, identifies the
relative tangent space with the framed Selmer group of ArithmeticGaloisDuality and deduces the
presentation and dimension bound. Layer R04.4 builds the maps between such rings: restriction,
enlargement of `S`, twisting, and the formal-group machinery of the dyadic method. Layer R04.5 turns
Taylor–Wiles data into augmented deformation problems with diamond actions and counts; the
cohomological existence of auxiliary primes is imported from ArithmeticGaloisDuality R02.6, and the
selection theorem used in arbitrary rank is proved here. Layer R04.6 assembles the finite-level ring
systems of Khare–Wintenberger patching for odd `p` and for `p = 2`. Layer G8 gives the
variable-determinant rings of ACC, which Layer G7 uses for its Taylor–Wiles presentation alongside
the polarized branch. Within a layer the targets are listed so that nothing is used before it is
stated.

`README.md` is normative. `Suggested.lean`, in the namespace
`TauCetiRoadmap.GlobalGaloisDeformations`, records the light definitions whose carriers exist at the
pinned Mathlib and Tau Ceti (lifts, strict conjugation, strict classes, fixed determinant, coefficient
pushforward, restriction, twisting, the Schur predicate, `Φ_p`, framed lifts and their unrestricted
quotient), a few theorem signatures statable against them, and discriminating `example`s. A target that
ends with a `*Lean:*` line is carried by the declarations listed there; every other target, and every
Check that is not one of those `example`s, is specified in this README only. Universal rings, local
problems, global types, Taylor–Wiles data and the patching systems need the coefficient categories
and arithmetic suppliers above and are README targets.

## Layer R04.1: Deformation functors

This layer constructs the functors before asking which of them are representable. The residual
identification, the strict action and continuity are part of the definitions. The matrix and module
descriptions of a deformation agree; determinant laws are a different functor, related to strict
classes by an explicit map whose comparison theorem is in Layer R04.2.

<a id="lifting-functor"></a>

### 1.1 The lifting functor

**Lifts.** For a coefficient ring `A` with residue map `π_A`, define `Lift_ρ̄(A)` as the set of
continuous homomorphisms `ρ : G → GLₙ(A)` whose reduction `GLₙ(π_A) ∘ ρ` is `ρ̄`. A coefficient
morphism `f : A → B` pushes a lift forward by `GLₙ(f)`; this is a set-valued functor on `Art_𝒪` with
no representability assumption. On `C_𝒪`, construct the natural bijection
`Lift_ρ̄(A) ≅ limᵣ Lift_ρ̄(A/𝔪_Aʳ)`. The strict kernel `Γ̂ₙ(A)` acts by conjugation. Since an Artinian
coefficient ring here is finite, continuity of a lift to it is equivalent to factoring through a
finite quotient of `G` by an open normal subgroup (Gee, §3.1, p. 12; Kisin, Lecture 1,
(1.1.1)–(1.1.2), p. 1).

The API:

- `Lift`: `Lift ρ̄ : Art_𝒪 ⥤ Type`, `A ↦` continuous lifts of `ρ̄` to `GLₙ(A)`.
- `Lift.map`: a coefficient morphism `f` induces `Lift(A) → Lift(B)`, `ρ ↦ GLₙ(f) ∘ ρ`, with
  `map_id` and `map_comp`.
- `Lift.reduce`: every lift reduces to `ρ̄` modulo `𝔪_A`.
- `Lift.conj`: `Γ̂ₙ(A)` acts on `Lift(A)` by conjugation.
- `Lift.limEquiv`: for `A ∈ C_𝒪`, `Lift(A) ≃ limₖ Lift(A/𝔪_Aᵏ)`.

*Needs:* DeformationAndDerivedPatchingAlgebra R03.1; ArithmeticGaloisRepresentations Layer 1;
Mathlib `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map`, `IsArtinianRing`,
`IsLocalRing`, `ContinuousMonoidHom`.

*Lean:* `strictKernel`, `Lift`, `Lift.conj`, `Lift.conj_apply`, `Lift.map`, `Lift.map_apply`,
`Lift.map_id`, `Lift.map_comp`, the `MulAction` instance of `strictKernel` on `Lift`, and the `example`
that a lift to `k` itself is `ρ̄`.

**Checks.**

- **lift_trivial_char_Zp.** for `G = ℤ_p`, `n = 1` and `ρ̄ = 1`, evaluation at `1` identifies
  `Lift(A)` with `1 + 𝔪_A`; a definition dropping the reduction condition would give all of `Aˣ`.
- **lift_residue.** `Lift_ρ̄(k)` is the singleton `{ρ̄}`; a definition without the reduction equation
  would contain every continuous representation of `G` over `k`.
- **lift_not_continuous.** for `G = ∏_ℕ ℤ/p`, `n = 1`, `ρ̄ = 1` and `A = k[ε]`, a homomorphism
  `G → 1 + εk ≅ k` given by an `𝔽_p`-linear functional that vanishes on no open subgroup is not in
  `Lift(A)`; a definition forgetting continuity would accept it.
- **lift_functorial.** `Lift.map (g ∘ f) = Lift.map g ∘ Lift.map f`, checked on matrix entries.

<a id="module-deformation-functor"></a>

### 1.2 Deformations as modules with a residual identification

**Module deformations.** Fix the standard residual `G`-module `V̄ = kⁿ` with its basis `β`. A module
deformation over `A` is a finite free `A`-module `V` with a continuous `A`-linear `G`-action and a
`G`-equivariant identification `ι : V ⊗_A k ≅ V̄`. Morphisms are `G`-equivariant `A`-linear
isomorphisms commuting with `ι`. Define `ModDef(A)` as the set of isomorphism classes, and
`ModDefFramed(A)` by adding an `A`-basis reducing through `ι` to `β`, morphisms then also preserving
that basis. A basis lifting `β` exists by freeness and Nakayama's lemma. Base change carries the
action, the residual identification and the basis, not only the underlying module (Kisin,
Lecture 1, (1.1.1), p. 1).

The API:

- `ModDef`: `Def^mod_ρ̄ : Art_𝒪 ⥤ Type`, isomorphism classes of pairs `(V_A, ι)`.
- `ModDefFramed`: `Def^{mod,□}_ρ̄`, adding a basis lifting `β`.
- `ModDef.baseChange`: base change along coefficient morphisms, with identity and composition laws.
- `ModDef.exists_basis_lift`: every `(V_A, ι)` has a basis lifting `β`.

*Needs:* DeformationAndDerivedPatchingAlgebra R03.1; [1.1](#lifting-functor); Mathlib
`Module.Free`, `IsLocalRing`.

**Checks.**

- **moddef_residue.** `ModDef(k)` is a singleton, the class of `(V̄, id)`.
- **moddef_rank_one.** for `n = 1` and `ρ̄ = χ̄`, `ModDef(A) = {χ̃ψ : ψ ∈ Hom_cont(G, 1 + 𝔪_A)}` for a
  fixed lift `χ̃`. Distinct rank-one characters are nonisomorphic as `G`-modules, so here forgetting
  `ι` makes no further identifications; the rank-two check below detects that omission.
- **moddef_needs_iota.** for `ρ̄ = 1 ⊕ 1`, `A = k[ε]` and a nonzero continuous additive character
  `x : G → k`, the lifts `diag(1 + εx, 1)` and `diag(1, 1 + εx)` are isomorphic `G`-modules by
  swapping the basis vectors, but they are distinct deformations, because the swap does not reduce
  to the identity on `V̄`. With the zero character the two lifts coincide, so the character must be
  nonzero.

<a id="strict-deformation-functor"></a>

### 1.3 Deformations up to strict equivalence

**Strict classes.** For every continuous `ρ̄`, form `Def_ρ̄(A) = Lift_ρ̄(A)/Γ̂ₙ(A)`. Coefficient
morphisms descend to this orbit quotient. Two representatives have the same class precisely when a
conjugator reduces to the identity. The functor exists even when `ρ̄` has non-scalar endomorphisms;
representability is a separate target in Layer R04.2 (Gee, Definition 3.4, p. 12; Kisin, Lecture 1,
Remark (1.1.2)(1), p. 1).

The API:

- `Def`: `Def ρ̄ A := Lift ρ̄ A ⧸ Γ̂ₙ(A)`.
- `Def.mk`: the class of a lift.
- `Def.mk_eq_mk_iff`: `[ρ] = [ρ′] ↔ ∃ a ∈ Γ̂ₙ(A), ρ′ = aρa⁻¹`.
- `Def.map`: functoriality in `A`.
- `Def.toModDef`: `Def ≃ ModDef` ([1.4](#module-deformations-are-strict-classes)).

*Needs:* [1.1](#lifting-functor); Mathlib `Matrix.GeneralLinearGroup`, `MonoidHom.ker`,
`MulAction.orbitRel`.

*Lean:* `Def`, `Def.mk`, `Def.mk_eq_mk_iff`, `Def.map`, `Def.map_mk`.

**Checks.**

- **def_residue.** `Def_ρ̄(k)` is a singleton.
- **def_rank_one_eq_lift.** for `n = 1`, conjugation is trivial and `Def = Lift`; a definition quotienting
  by all of `GLₙ(A)` agrees here, so this check is paired with the next.
- **def_not_full_conj.** for `ρ̄ = 1 ⊕ 1`, the lifts `diag(1 + εx, 1)` and `diag(1, 1 + εx)` to `k[ε]`
  (`x` a nonzero continuous character `G → k`) are distinct strict classes although they are
  `GL₂(k[ε])`-conjugate; a definition using full conjugacy would identify them.

<a id="module-deformations-are-strict-classes"></a>

### 1.4 Module deformations are lifts up to strict conjugation

**Matrix and module descriptions agree.** Construct natural bijections
`Lift_ρ̄(A) ≅ ModDefFramed_ρ̄(A)` and `Def_ρ̄(A) ≅ ModDef_ρ̄(A)` for `A` in `Art_𝒪`, and in `C_𝒪` with
its topology. A compatible module isomorphism has reduction equal to the identity in any bases
lifting `β`; conversely a strict conjugator induces such an isomorphism. Check independence of the
chosen lifted basis and compatibility with coefficient morphisms (Kisin, Lecture 1,
Remark (1.1.2)(1), p. 1).

*Needs:* [1.1](#lifting-functor); [1.2](#module-deformation-functor);
[1.3](#strict-deformation-functor).

<a id="strict-vs-full-conjugacy"></a>

### 1.5 Strict and full conjugacy agree for Schur residual representations

**Theorem.** Let `ρ̄` be Schur and let `A` be a local ring whose residue map `π_A : A → k` is
surjective with kernel `𝔪_A` (in particular any object of `Art_𝒪` or `C_𝒪`). If lifts `ρ, ρ′` over
`A` are conjugate by some `a ∈ GLₙ(A)`, they are strictly conjugate. The reduction of `a` centralizes
`ρ̄`, hence is a nonzero scalar `c`; a unit of `A` lifting `c` normalizes `a` into `Γ̂ₙ(A)`, by the
local-ring unit criterion (Gee, Definition 3.4 and the remark following it, p. 12).

The unbundled form requires locality, surjectivity of `π_A` and `ker π_A = 𝔪_A` explicitly. Both the
non-Schur failure and the failure for an arbitrary surjection onto `k` are recorded as checks.

*Needs:* [1.3](#strict-deformation-functor); Mathlib `Matrix.GeneralLinearGroup`;
DeformationAndDerivedPatchingAlgebra R03.1.

*Lean:* `IsSchur`, `strict_of_full`, the two `example`s on rank one and on `1 ⊕ 1`, and the `example`s on
the integral `S₃` generators, their integral centralizer and the normalisation over `ZMod 25`.

**Checks.**

- **strict_of_full_not_schur.** for `ρ̄ = 1 ⊕ 1` the lifts of the **def_not_full_conj** Check in §1.3 are
  conjugate by the swap but not strictly conjugate: the Schur hypothesis is needed.
- **strict_of_full_nonlocal.** let `S₃ ⊂ GL₂(ℤ)` be generated by `C = [[0, −1], [1, −1]]` and
  `S = [[0, 1], [1, 0]]`, with the surjective reduction `ℤ → 𝔽₅`; the reduction is absolutely
  irreducible (`1, C, S, CS` span `M₂(𝔽₅)`), hence Schur. The matrix `a = [[2, 5], [5, 12]]` lies in
  `GL₂(ℤ)` and reduces to `2·I`, so `aρa⁻¹` is a second lift of the same reduction. The integral
  centralizer of `C` and `S` is the scalars, whose units are `±1`, and `±a` does not reduce to `I`, so
  the two lifts are conjugate but not strictly conjugate over the nonlocal ring `ℤ`. Over the local
  ring `ℤ/25` the unit `13` lifts `2⁻¹` and `13·a` is a strict conjugator: locality is needed.
- **isSchur_absIrred.** an absolutely irreducible `ρ̄` is Schur, while `ρ̄ = 1 ⊕ 1` is not (its
  centralizer is all of `M₂(k)`, including non-diagonal matrices).

<a id="restriction-of-deformations"></a>

### 1.6 Restriction of lifts and deformations is well defined

**Restriction.** For a continuous homomorphism `ι : H → G` of profinite groups, precomposition gives
`Lift_ρ̄ → Lift_{ρ̄∘ι}`. It commutes with strict conjugation and therefore descends to `Def`. A framed
pair `(ρ, α)` with `α ∈ Γ̂ₙ(A)` has restricted lift `α⁻¹(ρ ∘ ι)α`, and this lift is invariant under
the simultaneous replacement `(ρ, α) ↦ (βρβ⁻¹, βα)`. The identity is proved before it is used to
classify a map out of a local framed ring (3.5). Restriction need not be along an inclusion of
groups (Gee, §§3.20–3.21, p. 15).

*Needs:* [1.1](#lifting-functor); [1.3](#strict-deformation-functor); Mathlib
`ContinuousMonoidHom`.

*Lean:* `Lift.restrict`, `Lift.restrict_apply`, `framed_restrict_invariant`.

**Checks.**

- **restrict_id.** restriction along the identity is the identity on `Lift`.
- **framed_restrict_invariant.** `(βα)⁻¹(βρ(ι h)β⁻¹)(βα) = α⁻¹ρ(ι h)α` in any group; the version without
  the frame, `ρ ∘ ι`, changes as a matrix-valued lift under `β`. Its strict class is nevertheless
  well defined; a frame is needed to select an invariant lift, not to define restriction of classes.
- **restrict_not_injective.** for `ι` the inclusion of the trivial group, restriction sends every lift
  to the unique lift of the trivial group; it is not an inclusion of functors.

<a id="fixed-determinant-functors"></a>

### 1.7 Lifts and deformations with fixed determinant

**Fixed determinant.** For a continuous character `χ : G → 𝒪ˣ` reducing to `det ρ̄`, define
`LiftDet_χ(A)` by the pointwise equation `det ρ(g) = χ_A(g)`. Strict conjugation preserves it; define
`DefDet` as its orbit quotient and construct the inclusions into `Lift` and `Def`. Pushforward
respects the determinant equation, so both are subfunctors. If `χ` does not reduce to `det ρ̄`, the
set of lifts is empty (Gee, §3.18, p. 15).

The API:

- `LiftDet`: `Lift_{ρ̄,χ}` as a subfunctor of `Lift_ρ̄`.
- `DefDet`: `Def_{ρ̄,χ}` as a subfunctor of `Def_ρ̄`.
- `LiftDet.conj`: `Γ̂ₙ(A)` preserves `Lift_{ρ̄,χ}(A)`.
- `mem_LiftDet_iff`: `ρ ∈ Lift_{ρ̄,χ}(A) ↔ det ∘ ρ = χ_A`.

*Needs:* [1.1](#lifting-functor); [1.3](#strict-deformation-functor); Mathlib
`Matrix.GeneralLinearGroup.det`.

*Lean:* `LiftDet`, `mem_LiftDet_iff`, `LiftDet.conj`, `liftDetSubMulAction`, `DefDet`.

**Checks.**

- **liftDet_rank_one.** for `n = 1`, `Lift_{ρ̄,χ}(A) = {χ_A}`; a definition imposing the determinant only
  modulo `𝔪_A` would give all of `Lift(A)`.
- **liftDet_residue.** `Lift_{ρ̄,χ}(k) = {ρ̄}`.
- **liftDet_wrong_char.** if `χ mod λ ≠ det ρ̄` the functor is empty already on `k`, so the
  compatibility hypothesis is needed.

<a id="change-of-coefficients"></a>

### 1.8 Change of coefficient ring and residue field

**Coefficient change.** Take a finite local coefficient map `𝒪 → 𝒪′` with its residue inclusion
`k → k′`, and put `ρ̄′ = ρ̄ ⊗_k k′`. Identify lifts of `ρ̄′` over an object `A′` of `Art_𝒪′` with lifts
of `ρ̄` to the underlying `𝒪`-algebra `A′` whose reduction is prescribed by `ρ̄′`; the residue field of
`A′` is `k′`, not `k`. The identification descends to strict classes and to fixed-determinant
classes and is natural in `A′`. Scalar extension of the residual centralizer shows that `ρ̄` is Schur
if and only if `ρ̄′` is; ordinary irreducibility need not persist under residue extension (Gee, §3.1,
p. 12; Kisin, Lecture 1, (1.1.1), p. 1).

The API:

- `Lift.changeCoeff`: `Lift^{𝒪′}_{ρ̄⊗k′}(A′) ≃` lifts of `ρ̄` to `A′` as an `𝒪`-algebra.
- `Def.changeCoeff`: the same for strict classes.
- `isSchur_baseChange`: `ρ̄` Schur `↔` `ρ̄ ⊗ k′` Schur.
- `LiftDet.changeCoeff`: the same with fixed determinant `χ` composed with `𝒪 → 𝒪′`.

*Needs:* DeformationAndDerivedPatchingAlgebra R03.1; [1.1](#lifting-functor);
[1.3](#strict-deformation-functor); [1.7](#fixed-determinant-functors).

**Checks.**

- **changeCoeff_id.** for `𝒪′ = 𝒪` the change of coefficients is the identity.
- **changeCoeff_schur.** `ρ̄` is Schur iff `ρ̄ ⊗ k′` is, because the centralizer of `ρ̄ ⊗ k′` is the
  scalar extension of that of `ρ̄`.
- **changeCoeff_irreducible_fails.** the representation of `ℤ/(p² − 1)` through an element of order
  `p² − 1` of `𝔽_{p²}ˣ`, viewed over `𝔽_p`, is irreducible of dimension two but splits over `𝔽_{p²}`;
  a hypothesis "irreducible" in place of "Schur" would not be stable under coefficient change.

<a id="determinant-deformation-functor"></a>

### 1.9 Deformations of a residual determinant

**Determinant deformations.** Use the degree-`n` multiplicative polynomial laws of
`IntegralHeckeAndGaloisDeterminants` Layer 0. Write `D̄` for the law obtained by extending `ρ̄`
linearly to `k[G]` and composing with the matrix determinant. `DetDef_D̄(A)` is the set of degree-`n`
determinants on `A[G]` reducing to `D̄` whose characteristic-polynomial coefficients `g ↦ Λᵢ(g)` are
all continuous. Give base change, restriction and the inverse-limit extension to `C_𝒪`. A
determinant law records characteristic-polynomial data on the group algebra; the character
`g ↦ det ρ̄(g)` alone is not its definition (Chenevier, §3.1, p. 41; its representability is 2.11).

The API:

- `DetDef`: `Def_D̄ : Art_𝒪 ⥤ Type`, continuous `n`-dimensional determinants lifting `D̄`.
- `DetDef.map`: base change of determinants.
- `DetDef.charpoly`: the characteristic-polynomial coefficients of a lifted determinant.
- `DetDef.rank_one`: for `n = 1`, `Def_D̄ ≃ Lift_{χ̄}`.

*Needs:* `IntegralHeckeAndGaloisDeterminants` Layer 0; DeformationAndDerivedPatchingAlgebra R03.1.

**Checks.**

- **detDef_rank_one.** for `n = 1` a degree-one determinant on `A[G]` is a character, and the functor is
  `Lift_{χ̄}`.
- **detDef_residue.** `Def_D̄(k) = {D̄}`.
- **detDef_ignores_extension.** two residual representations with the same semisimplification (for
  instance a nonsplit extension of `χ₂` by `χ₁` and `χ₁ ⊕ χ₂`) have the same `D̄` and hence the same
  functor `Def_D̄`; a definition depending on `ρ̄` itself would distinguish them.

<a id="determinant-comparison"></a>

### 1.10 The determinant map from representation deformations to determinant deformations

**The map δ.** Extend a lift `ρ` `A`-linearly to `A[G]` and compose with the matrix determinant law.
Invariance under conjugation gives a natural map `δ : Def_ρ̄ → DetDef_D̄`, compatible with coefficient
change and with restriction to subgroups. Without absolute irreducibility `δ` need not be injective:
take distinct characters `χ₁`, `χ₂` and a nonsplit extension class `e ∈ Ext¹(χ₂, χ₁)` with
`dim Ext¹(χ₂, χ₁) ≥ 2`. Vary `e` over `k[ε]` to `e + εf` with `f` independent of `e`. Strict basis
changes alter the extension by a coboundary and a scalar multiple of `e`, so these strict classes
are distinct; the determinant law is unchanged. Such a nonsplit extension of distinct characters
is Schur. The isomorphism under absolute irreducibility is 2.8 (Kisin, Lecture 1, (1.5) Exercise 3,
p. 4; Chenevier, §3.1, Example 3.4, p. 42).

*Needs:* [1.3](#strict-deformation-functor); [1.9](#determinant-deformation-functor);
`IntegralHeckeAndGaloisDeterminants` Layer 0.

**Checks.**

- **delta_rank_one.** for `n = 1`, `δ` is the identity of `Lift_{χ̄}` under `DetDef.rank_one`.
- **delta_not_injective.** in the reducible example above two distinct strict classes over `k[ε]` have
  the same determinant law.
- **delta_conj_invariant.** `δ(aρa⁻¹) = δ(ρ)` for every `a ∈ GLₙ(A)`, not only for strict conjugators,
  since the determinant is a class function.

### Examples

- For `G = ℤ_p`, `n = 1` and `ρ̄ = 1`, `Lift(A) = Def(A) = 1 + 𝔪_A`, and `LiftDet_χ(A)` is the single
  point `χ_A`.
- Over `k[ε]` with `ρ̄ = 1 ⊕ 1`, the two lifts `diag(1 + εx, 1)` and `diag(1, 1 + εx)` show at once
  that module isomorphism forgets `ι` (1.2), that strict and full conjugacy differ for non-Schur `ρ̄`
  (1.3, 1.5), and that the determinant law forgets which marked diagonal line carries the nonzero
  character `x`. The nonsplit example of 1.10 separately detects loss of extension data.

### Dependencies

DeformationAndDerivedPatchingAlgebra R03.1; ArithmeticGaloisRepresentations Layer 1;
`IntegralHeckeAndGaloisDeterminants` Layer 0; Mathlib `Matrix.GeneralLinearGroup`,
`MulAction.orbitRel`, `Module.Free`, `IsLocalRing`, `IsArtinianRing`.

## Layer R04.2: Representability and universal lifts

This layer applies the representability algebra of DeformationAndDerivedPatchingAlgebra R03.2 to
the continuous Galois functors of Layer R04.1. The finiteness condition `Φ_p`, the Schur hypothesis
and absolute irreducibility are separate inputs, each used exactly where it is needed. The framing,
determinant and coefficient comparisons give reusable maps between the resulting rings.

<a id="phi-p-condition"></a>

### 2.1 Mazur's finiteness condition `Φ_p`

**The condition.** For a profinite group `G` and a prime `p`, `Φ_p(G)` holds if for every open
subgroup `Δ ≤ G` the set of continuous homomorphisms `Δ → 𝔽_p` is finite. Prove that `Φ_p(G)` holds
if and only if the maximal pro-`p` quotient of every open subgroup is topologically finitely
generated; that `Φ_p` passes to open subgroups; and that topologically finitely generated profinite
groups satisfy `Φ_p`. Quantifying only over `G` itself does not define `Φ_p` (Gee, §3.1, p. 12;
Kisin, Lecture 1, (1.2), p. 1, and Exercise 1, p. 4).

*Proof sketch.* Passage to open subgroups is immediate, since an open subgroup of an open subgroup
is open in `G`. For a topologically finitely generated `G`, every open subgroup is topologically
finitely generated (Tau Ceti `topologicalGeneratorRankNat_le_of_openSubgroup`), and a topologically
finitely generated group has finitely many homomorphisms with open kernel to `ℤ/p`
(`IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`). For the characterisation,
continuous homomorphisms `Δ → 𝔽_p` factor through `maximalProPQuotient p Δ`, and for a pro-`p` group
the topological generator rank equals the `𝔽_p`-dimension of the continuous dual
(`IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`).

The API:

- `PhiP`: the predicate `Φ_p` on profinite groups.
- `phiP_iff_fg`: `Φ_p(G) ↔` every open subgroup has topologically finitely generated maximal
  pro-`p` quotient.
- `PhiP.open`: `Φ_p` passes to open subgroups.
- `phiP_of_fg`: topologically finitely generated profinite groups satisfy `Φ_p`.

*Needs:* Mathlib `ProfiniteGrp`, `OpenSubgroup`, `ContinuousMonoidHom`; Tau Ceti
`IsTopologicallyFinitelyGenerated`, `IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`,
`maximalProPQuotient`, `topologicalGeneratorRankNat_le_of_openSubgroup`,
`IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`.

*Lean:* `PhiP`, `PhiP.open` (written `PhiP.«open»`), `phiP_of_fg`, and an `example` that every finite
group satisfies `Φ_p`.

**Checks.**

- **phiP_Zp.** `ℤ_p` satisfies `Φ_p`: its open subgroups are `pᵏℤ_p ≅ ℤ_p`, each with exactly `p`
  continuous homomorphisms to `𝔽_p`.
- **phiP_open.** if `G` satisfies `Φ_p`, so does every open subgroup.
- **phiP_not_of_Hom.** for `p` odd let `G = (∏_ℕ ℤ/p) ⋊ ℤ/2`, the involution acting by inversion. Every
  continuous homomorphism `G → 𝔽_p` kills the commutators `x·σ(x)⁻¹ = x²`, hence the whole normal
  factor, so `Hom_cont(G, 𝔽_p) = 0`; but the open subgroup `∏_ℕ ℤ/p` has infinitely many continuous
  coordinate characters. A definition quantifying only over `G` would accept this group.
- **phiP_finite.** every finite group satisfies `Φ_p`.

<a id="phi-p-global"></a>

### 2.2 Global and local Galois groups satisfy `Φ_p`

**Arithmetic examples.** For a number field `F` and a finite set of places `S`, `Φ_p(G_{F,S})`
holds, where the maximal extension unramified outside `S` may ramify at the infinite places: apply
the finiteness of `H¹(G_{K,S}, 𝔽_p)` from ArithmeticGaloisDuality R02.3 to the finite extension `K`
attached to each open subgroup. For a finite extension `K/ℚ_ℓ`, with `ℓ` arbitrary including `p`,
`Φ_p(G_K)` holds by ClassFieldTheory Layer 5 `finite_H`, applied to `H¹(G_L, 𝔽_p)` for every finite
extension `L/K`; open subgroups of `G_K` are exactly these `G_L`. When `ℓ = p`,
`LocalGaloisGroups` Layer 3 alternatively gives topological finite generation of `G_L(p)` (Gee,
§3.1, p. 12; Kisin,
Lecture 1, (1.2), p. 2).

*Needs:* [2.1](#phi-p-condition); ArithmeticGaloisDuality R02.3; ClassFieldTheory Layer 5
`finite_H`; `LocalGaloisGroups` Layer 3 for the `ℓ = p` alternative.

**Checks.**

- **phiP_GQS.** for `p` odd, `F = ℚ` and `S = {p, ∞}`, `Hom_cont(G_{ℚ,S}, 𝔽_p)` is one-dimensional (the
  first layer of the cyclotomic `ℤ_p`-extension, since `ℤ_pˣ = μ_{p−1} × (1 + pℤ_p)`); for `p = 2` it is
  two-dimensional. Both are finite, as `Φ_p` requires.
- **phiP_absolute_fails.** the absolute Galois group `G_ℚ` does not satisfy `Φ_p`: it has infinitely
  many independent quadratic (for `p = 2`) or cyclic degree-`p` characters, ramified at different
  primes. The ramification bound `S` is needed.
- **phiP_local_rank.** for `K = ℚ_p` with `p` odd, `μ_p ⊄ ℚ_p`, so `G_{ℚ_p}(p)` has `N + 1 = 2` topological
  generators (`LocalGaloisGroups` Layer 3, `N = [K : ℚ_p] = 1`), matching
  `ℚ_pˣ/ℚ_pˣᵖ ≅ (ℤ/p)²`: `Hom_cont(G_{ℚ_p}, 𝔽_p)` is two-dimensional.

<a id="universal-lifting-ring"></a>

### 2.3 The universal lifting ring

**Theorem.** If `Φ_p(G)` holds, there are `R^□_ρ̄ ∈ C_𝒪` and a continuous lift `ρ^□` such that local
`𝒪`-algebra maps `R^□_ρ̄ → A` correspond naturally and bijectively to `Lift_ρ̄(A)`, by pushforward of
`ρ^□`. No Schur hypothesis is needed (Kisin, Lecture 1, Proposition (1.2.1)(1) and its proof, p. 2;
Gee, Lemma 3.2 and Definition 3.3, p. 12).

*Proof sketch.* Apply the continuous framed matrix construction of DeformationAndDerivedPatchingAlgebra
R03.2: the reduction of the strict kernel and `Φ_p` give a finite tangent space (the framed tangent
count under *Scope and ownership*), and the lifting functor preserves the required fibre products.
Specialise to global and local Galois groups by 2.2.

*Needs:* [2.1](#phi-p-condition); [1.1](#lifting-functor); [tangent spaces](#tangent-spaces);
DeformationAndDerivedPatchingAlgebra R03.2, *Continuous framed representability*; Mathlib
`MvPowerSeries`, `IsAdicComplete`.

**Checks.**

- **univLiftRing_rank_one_Zp.** for `G = ℤ_p`, `n = 1`, `ρ̄ = 1`, `R^□ = 𝒪⟦T⟧` with `ρ^□(1) = 1 + T`.
- **univLiftRing_trivial_group.** for `G = 1`, `Lift(A)` is a point and `R^□ = 𝒪`.
- **univLiftRing_not_schur_needed.** for `ρ̄ = 1 ⊕ 1` of `G = ℤ_p`, a lift is the free choice of the image
  `1 + X` of a topological generator in the pro-`p` group `Γ̂₂(A)`, so `R^□ = 𝒪⟦X₁₁, X₁₂, X₂₁, X₂₂⟧`
  exists although `Def` is not pro-representable.

<a id="universal-continuous-lift"></a>

### 2.4 The universal continuous lift over the inverse-limit ring

**The universal lift.** Recover `ρ^□` over the complete representing ring from the compatible
universal lifts over the quotients `R^□/𝔪ʳ`. Its reduction is `ρ̄` and its entries are continuous for
the adic topology. Evaluation at this lift realizes the representing bijection for every complete
coefficient object, not only for Artinian quotients. Carry out the same inverse-limit construction
for a chosen universal representative in the Schur case and for the determinant quotients (Gee,
Definition 3.3, p. 12; Kisin, Lecture 1, Remark (1.2.2)(2), p. 2).

The API:

- `univLift`: `ρ^□ : G →* GLₙ(R^□_ρ̄)`, continuous.
- `univLift_reduce`: `ρ^□ mod 𝔪 = ρ̄`.
- `liftEquivHom`: `Lift_ρ̄(A) ≃` local `𝒪`-algebra maps `R^□_ρ̄ → A`, for `A ∈ C_𝒪`.
- `univLift_continuous`: `ρ^□` is continuous for the `𝔪`-adic topology.

*Needs:* [2.3](#universal-lifting-ring); [1.1](#lifting-functor); DeformationAndDerivedPatchingAlgebra
R03.1; Mathlib `IsAdicComplete`.

**Checks.**

- **univLift_rank_one_trivial.** for `n = 1`, `ρ̄ = 1`, `ρ^□` is the tautological character into
  `𝒪⟦G^{ab,(p)}⟧ˣ`, the completed group algebra of the maximal abelian pro-`p` quotient.
- **univLift_residue.** `ρ^□` reduces to `ρ̄`.
- **univLift_not_Artinian.** for `G = ℤ_p` in rank one with trivial residual character the representing
  ring `𝒪⟦T⟧` is not Artinian, so the universal lift cannot be replaced by a lift over one fixed
  Artinian quotient.

<a id="universal-deformation-ring"></a>

### 2.5 The universal deformation ring

**Theorem.** Under `Φ_p` and the Schur hypothesis, `Def_ρ̄` is pro-represented by `R_ρ̄ ∈ C_𝒪` with a
universal strict class: `Hom_{C_𝒪}(R_ρ̄, A) ≅ Def_ρ̄(A)` naturally. Without Schur, construct a hull from
the criteria of R03.2 and keep versality distinct from a representing bijection: automorphisms can
prevent pro-representability, and a hull is not called a universal ring (Kisin, Lecture 1,
Proposition (1.2.1)(2), p. 2; Gee, Lemma 3.5, p. 12).

*Proof sketch.* Schlessinger's criteria hold for `Def_ρ̄`: the tangent space is finite by `Φ_p`, and
the gluing condition holds because, for Schur `ρ̄`, the stabiliser of a lift in `Γ̂ₙ(A)` is the
scalars `1 + 𝔪_A`, which surject along small extensions (1.5).

*Needs:* [2.1](#phi-p-condition); [1.3](#strict-deformation-functor);
[1.5](#strict-vs-full-conjugacy); [tangent spaces](#tangent-spaces);
[2.3](#universal-lifting-ring); DeformationAndDerivedPatchingAlgebra R03.2.

**Checks.**

- **univDefRing_rank_one.** for `n = 1`, `R_ρ̄ = R^□_ρ̄ = 𝒪⟦G^{ab,(p)}⟧`.
- **univDefRing_hull_only.** for the trivial rank-two representation of `G = ℤ_p`, a hull exists
  but pro-representability fails. Put `A = k[t]/(t³)`, `B = k[t]/(t²)` and `M = I + tE₁₂`. In
  `A ×_B A`, the pairs `(M, M)` and `(M, I + (t + t²)E₁₂)` give distinct strict classes, but their
  projections to `Def(A) ×_{Def(B)} Def(A)` agree: conjugation by `I + tE₁₁` changes the second
  component as stated. A conjugator in the fibre product would have the same first-order matrix
  in both components, whose commutator with `E₁₂` would have to be both zero and `E₁₂`. Thus
  Schlessinger H4 fails. For the trivial group itself the functor is a point and is represented
  by `𝒪`, despite the same non-Schur residual representation.
- **univDefRing_tangent.** `Hom(R_ρ̄, k[ε]) = H¹(G, ad ρ̄)`, of dimension `h¹(G, ad ρ̄)`, which differs
  from the framed count by `n² − h⁰ = n² − 1` for Schur `ρ̄`.

<a id="framed-unframed-comparison"></a>

### 2.6 Framed rings are power series over unframed rings

**Theorem.** For Schur `ρ̄` under `Φ_p`, choose a universal representative `ρ^univ` and construct an
isomorphism `R^□_ρ̄ ≅ R_ρ̄⟦X_{ij}⟧/(X₁₁)`, under which the universal framed lift is
`(1 + X)ρ^univ(1 + X)⁻¹`. A strict frame is normalised by its scalar unit in the distinguished entry;
the scalar centralizer removes exactly one variable, so the extension is formally smooth in `n² − 1`
variables. The same framing variables work with fixed determinant. For a nonempty finite framing set
`T` the simultaneous version has `n²|T| − 1` variables; `T` empty is unframed. None of these
coordinate isomorphisms is claimed to be canonical (Gee, Exercise 3.9, p. 13; Kisin, Lecture 1,
Remark (1.2.2)(3), p. 2).

*Needs:* [2.3](#universal-lifting-ring); [2.5](#universal-deformation-ring);
[2.4](#universal-continuous-lift); [1.7](#fixed-determinant-functors);
DeformationAndDerivedPatchingAlgebra R03.2; Mathlib `MvPowerSeries`, `Algebra.FormallySmooth`.

**Checks.**

- **framed_vars_rank_one.** for `n = 1` the number of framing variables is `0`, and `R^□ = R`.
- **framed_vars_T.** with `|T| = 2` and `n = 2` there are `7 = 4·2 − 1` variables, not `8`: one scalar
  direction is removed once, not once per place.
- **framed_normalisation_unique.** for a matrix whose `(1,1)` entry is a unit, there is exactly one unit
  scalar making that entry `1`; a normalisation of a non-unit entry is impossible, which is why the
  distinguished entry is that of a strict frame.

<a id="carayol-trace-theorem"></a>

### 2.7 Universal deformation rings are generated by traces

**Theorem.** Let `ρ̄` be absolutely irreducible and assume `Φ_p(G)`. Then `R_ρ̄` is topologically
generated over `𝒪` by the traces `tr ρ^univ(g)` for `g` in any dense subset of `G`; equivalently the
closed `𝒪`-subalgebra generated by these traces is all of `R_ρ̄`. The same holds for the
fixed-determinant ring and, for a framing set `T`, the closed subring of `R^{□}` generated by traces
is the image of `R_ρ̄` (Gee, Exercise 3.8, p. 13, using Lemma 3.7, pp. 12–13; Kisin, Lecture 1,
Theorem (1.4.1) and its proof, pp. 3–4).

*Proof sketch.* Traces separate deformations over `k[ε]` by Carayol's lemma and the Schur
normalisation of a conjugator. Hence their first-order coefficients separate the tangent space,
so the centred traces span the finite relative cotangent space
`𝔪_R/(𝔪_R² + λR)`. Choose finitely many giving a basis, subtract lifts of their residues in `𝒪`,
and apply complete Nakayama to obtain a surjection from a finite power-series ring over `𝒪` to
`R_ρ̄`. Thus these traces generate topologically. This avoids assuming that an arbitrary closed
subring of a Noetherian ring is Noetherian. The fixed-determinant case follows by quotienting, and
the framed assertion follows from 2.6. Continuity allows the traces to be taken on any dense subset.

*Needs:* [2.5](#universal-deformation-ring); [1.3](#strict-deformation-functor);
ArithmeticGaloisRepresentations §5.10 (`GaloisRep.carayol_conj_of_trace_eq`) and §7.2
(`GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`);
`IntegralHeckeAndGaloisDeterminants` Layer 1 (`coefficient_descent`); DeformationAndDerivedPatchingAlgebra
R03.1.

**Checks.**

- **traceGen_rank_one.** for `n = 1`, the traces are the values of the universal character, which
  generate `𝒪⟦G^{ab,(p)}⟧` topologically.
- **traceGen_framed_fails.** the framed ring `R^□` is not generated by traces when `n ≥ 2`: under
  `R^□ → R^□/𝔪_R R^□ ≅ k⟦X_{ij}⟧/(X₁₁)` every trace maps to a constant, while the framing variable
  `X₁₂` of 2.6 does not.
- **traceGen_reducible_fails.** for `ρ̄ = 1 ⊕ 1` of `G = ℤ_p`, the lifts `diag(1 + T, 1)` and
  `diag(1, 1 + T)` over `𝒪⟦T⟧` both have trace `2 + T` but are not strictly conjugate (a conjugator
  carries one eigenline to the other, so its reduction is antidiagonal): traces do not determine
  strict classes without absolute irreducibility.

<a id="determinant-comparison-isomorphism"></a>

### 2.8 For absolutely irreducible `ρ̄` the determinant map is an isomorphism

**Theorem.** If `ρ̄` is absolutely irreducible, the map `δ : Def_ρ̄ → DetDef_D̄` of 1.10 is a natural
isomorphism on `Art_𝒪`, and on `C_𝒪` by inverse limits. Whenever `R_ρ̄` exists it therefore also
represents `DetDef_D̄`. No ordinary fixed determinant character is imposed (Chenevier, §3.1,
Example 3.4, p. 42; Chenevier, Theorem 2.22(i), p. 34, with the Cayley–Hamilton quotient of §1.17).

*Proof sketch.* Surjectivity: for a determinant deformation `D` over Artinian local `A`, apply
henselian reconstruction (`Determinant.exists_ofMatrix_eq_of_henselian`, whose proof passes through
the Cayley–Hamilton quotient `A[G]/CH(D)`); the residual law is split and absolutely irreducible and
an Artinian local ring is henselian. Match the reconstructed reduction
with `ρ̄` by a change of basis, and check continuity on the finite quotient through which `D` factors.
Injectivity: equal determinant laws give equal traces, and strict conjugacy follows from
ArithmeticGaloisRepresentations §5.10.

*Needs:* [1.10](#determinant-comparison); [2.7](#carayol-trace-theorem);
[2.5](#universal-deformation-ring); `IntegralHeckeAndGaloisDeterminants` Layers 0–1
(`Determinant.exists_ofMatrix_eq_of_henselian`); ArithmeticGaloisRepresentations §5.10.

**Checks.**

- **detIso_rank_one.** for `n = 1` the comparison is the identity of `Lift_{χ̄}`.
- **detIso_needs_absIrred.** for the reducible example of 1.10 the map is not injective, so absolute
  irreducibility cannot be weakened to Schur here (a nonsplit extension of distinct characters can be
  Schur).
- **detIso_charpoly.** in rank two, `δ(ρ)` has characteristic coefficients `Λ₁(g) = tr ρ(g)` and
  `Λ₂(g) = det ρ(g)`; a comparison through the determinant character alone loses `Λ₁` and cannot be
  injective (all lifts with fixed determinant would collapse).

<a id="fixed-determinant-rings"></a>

### 2.9 Fixed-determinant rings and change of determinant

**Theorem.** Under `Φ_p`, the closed quotient of `R^□_ρ̄` by the equations `det ρ^□(g) − χ(g)` for all
`g` represents `LiftDet`; in the Schur case the corresponding quotient of `R_ρ̄` represents
`DefDet`. If `p ∤ n`, the `n`-th power map is a bijection of `1 + 𝔪_A`; with its inverse define
`ψ = (χ_A⁻¹ det ρ)^{1/n}`. Then `ρ ↦ (ψ⁻¹ ⊗ ρ, ψ)` gives
`R^□_ρ̄ ≅ R^□_{ρ̄,χ} ⊗̂_𝒪 𝒪⟦G^{ab,(p)}⟧`, and similarly unframed. For another compatible `χ′`,
twisting by the unique `n`-th root of `χ′χ⁻¹` identifies the fixed-determinant rings. The hypothesis
`p ∤ n` stays on the root and on the product assertions (Gee, §3.18 and Exercise 3.19, p. 15).

*Needs:* [1.7](#fixed-determinant-functors); [2.3](#universal-lifting-ring);
[2.5](#universal-deformation-ring); [2.1](#phi-p-condition); Mathlib
`Matrix.GeneralLinearGroup.det`.

*Lean:* `exists_unique_nthRoot_of_residue_eq_one`.

**Checks.**

- **fixedDet_rank_one.** for `n = 1`, `R^□_{ρ̄,χ} = 𝒪` and the product decomposition is
  `R^□ = 𝒪⟦G^{ab,(p)}⟧`.
- **nthRoot_unique.** for `p ∤ n`, `x ↦ xⁿ` is injective on `1 + 𝔪_A` for Artinian local `A`.
- **nthRoot_fails_p_dvd_n.** in characteristic `3` with `ε² = 0`, `(1 + aε)³ = 1` for every `a`, so `1 + ε`
  has no cube root of the form `1 + aε`; the splitting needs `p ∤ n`.

<a id="change-of-residue-field"></a>

### 2.10 Representing rings under change of coefficients

**Theorem.** For a finite local map `𝒪 → 𝒪′` with residue inclusion `k → k′`, let `ρ̄′ = ρ̄ ⊗ k′`.
Then `R^□_{ρ̄′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′`, by the coefficient change of 1.8 and the representing
property; in the Schur case the same holds for the unframed rings, and both fixed-determinant
versions hold. The maps carry the universal lifts or classes to their scalar extensions. Finiteness
of `𝒪′` over `𝒪` ensures that the completed tensor product is again a Noetherian coefficient object
(Gee, §3.1, p. 12).

*Needs:* [1.8](#change-of-coefficients); [2.3](#universal-lifting-ring);
[2.5](#universal-deformation-ring); DeformationAndDerivedPatchingAlgebra R03.1.

**Checks.**

- **changeRing_id.** for `𝒪′ = 𝒪` the isomorphism is the identity.
- **changeRing_rank_one.** for `n = 1`, `𝒪⟦G^{ab,(p)}⟧ ⊗̂_𝒪 𝒪′ = 𝒪′⟦G^{ab,(p)}⟧`.
- **changeRing_unramified_residue.** for `𝒪′ = W(k′)` over `𝒪 = W(k)` the residue field changes, and a
  statement keeping residue field `k` for `R^□_{ρ̄′}` would have no residue map to `k′`.

<a id="pseudodeformation-rings"></a>

### 2.11 Continuous pseudodeformation rings

**Theorem.** Let `G` be profinite and `D̄ : k[G] → k` a continuous determinant of dimension `n`
(equivalently, by `IntegralHeckeAndGaloisDeterminants` Layer 1, the isomorphism class of a continuous
semisimple `ρ̄` with characteristic polynomials over `k`). The functor `DetDef_D̄` of 1.9 on finite local
`𝒪`-algebras with residue field `k` is represented by a profinite local `𝒪`-algebra `R^ps_D̄` with a
universal continuous determinant, and it extends to inverse limits of such algebras. `R^ps_D̄` is
topologically generated by the characteristic coefficients `Λᵢ(g)` of the universal determinant. If `G`
satisfies `Φ_p`, `R^ps_D̄` is Noetherian, hence an object of `C_𝒪`, and every deformation of `D̄` factors
through `G/H`, where `H ⊆ ker ρ̄` is the smallest closed normal subgroup with `ker ρ̄/H` pro-`p`. For a
continuous character `δ` lifting `det D̄`, the fixed-determinant ring `R^{ps,δ}_D̄` is the quotient by
`Λₙ(g) − δ(g)`. Coefficient change is the completed scalar extension, as in 2.10. When `D̄` is the
determinant of an absolutely irreducible `ρ̄`, `R^ps_D̄ = R_ρ̄` by 2.8; in general `D̄` may be residually
reducible, and no comparison with a representation deformation ring is asserted (Chenevier, §3.1,
Lemma 3.2, Proposition 3.3 and Remark 3.5, pp. 41–42; Proposition 3.7, Example 3.6 and Lemma 3.8,
p. 43).

*Proof sketch.* Representability: take the Roby algebra `Γⁿ_𝒪(𝒪[G])^{ab}` with its universal
multiplicative law (`IntegralHeckeAndGaloisDeterminants` Layer 0). Take the inverse limit of its
finite local quotients with the specified residual point for which the universal determinant is
continuous; this continuity condition is part of the indexing system. Noetherianity: by Lemma 3.8
a deformation factors through `G/H`, which is topologically finitely generated under `Φ_p`;
Corollary 2.39 then gives the finite cotangent space used in Proposition 3.7.

The API:

- `PseudoDefRing`: `R^ps_D̄ ∈ C_𝒪` (under `Φ_p`) with its universal determinant.
- `PseudoDefRing.equivHom`: `DetDef_D̄(A) ≃` local `𝒪`-algebra maps `R^ps_D̄ → A`.
- `PseudoDefRing.topologicallyGenerated`: generation by the coefficients `Λᵢ(g)`.
- `PseudoDefRing.fixedDet`: the fixed-determinant quotient `R^{ps,δ}_D̄`.
- `PseudoDefRing.eq_univDefRing`: for absolutely irreducible `ρ̄`, `R^ps_D̄ ≅ R_ρ̄` (2.8).

*Needs:* [1.9](#determinant-deformation-functor); [2.1](#phi-p-condition); [2.2](#phi-p-global);
[2.8](#determinant-comparison-isomorphism); `IntegralHeckeAndGaloisDeterminants` Layers 0–1;
DeformationAndDerivedPatchingAlgebra R03.1.

**Checks.**

- **pseudoDef_rank_one.** for `n = 1`, determinants are characters and `R^ps_D̄ = 𝒪⟦G^{ab,(p)}⟧`, the
  universal deformation ring of the character.
- **pseudoDef_reducible.** assume `Φ_p`, distinct `χ₁`, `χ₂`, and a nonsplit residual extension
  with `dim Ext¹(χ₂, χ₁) ≥ 2`. It is Schur, so `R_ρ̄` exists by 2.5. The noninjectivity of
  `δ : Def_ρ̄ → DetDef_D̄` in 1.10 shows that the natural ring map `R^ps_D̄ → R_ρ̄` is not
  surjective: this comparison is not a closed immersion, even though both rings exist.
- **pseudoDef_not_noetherian.** for `G = ∏_ℕ ℤ/p`, which fails `Φ_p`, and `n = 1` with trivial `D̄`, `R^ps_D̄`
  is the completed group algebra of `G`, whose tangent space is infinite-dimensional: it is profinite
  but not Noetherian.

### Examples

- For `G = ℤ_p`, `n = 1` and trivial residual character, the framed, unframed and pseudodeformation
  rings are `𝒪⟦T⟧`; the universal lift is `1 ↦ 1 + T`, and the fixed-determinant ring is `𝒪`.
- For `G = ℤ_p` and `ρ̄ = 1 ⊕ 1`, the framed ring exists while the unframed functor has only a hull;
  the two lifts `diag(1 + T, 1)` and `diag(1, 1 + T)` have equal traces.

### Dependencies

Layer R04.1; DeformationAndDerivedPatchingAlgebra R03.1–R03.2; ArithmeticGaloisDuality R02.3;
ClassFieldTheory Layer 5; `LocalGaloisGroups` Layer 3; `IntegralHeckeAndGaloisDeterminants` Layers 0–1 (including the Roby
algebra);
ArithmeticGaloisRepresentations §5.10 and §7.2; Tau Ceti profinite generation; Mathlib
`MvPowerSeries`, `IsAdicComplete`, `Algebra.FormallySmooth`.

## Layer R04.3: Local conditions and global presentations

This layer assembles local deformation problems into a global framed functor. The map from the local
tensor ring is characterised by the invariant framed restrictions of 1.6. The framed Selmer complex
of ArithmeticGaloisDuality D8 gives the relative tangent space and the obstruction bound; its scalar
degree-zero term fixes the frame count.

<a id="local-deformation-problem"></a>

### 3.1 Local deformation problems

**Definition.** For a profinite `G_v` satisfying `Φ_p` and a residual `ρ̄_v`, a local deformation
problem is a family `D(A) ⊆ Lift_ρ̄_v(A)`, for `A ∈ C_𝒪`, satisfying six axioms: it contains the
residual point; it is preserved by coefficient morphisms; it is detected along injective coefficient
morphisms; it glues, that is, for closed ideals `I₁, I₂` and an identification `R₁/I₁ ≅ R₂/I₂`, a pair
of lifts in `D(R₁)` and `D(R₂)` with equal images over the quotient defines a lift in
`D(R₁ ×_{R₁/I₁} R₂)`; it is detected by a decreasing separated filtration of ideals; and it is stable
under strict conjugation. Each axiom is stated with actual lifts and classifying maps. The
unrestricted problem is the whole lifting functor. The `p`-adic and inertial local conditions of
LocalGaloisDeformationRings carry this interface (Gee, Definition 3.16, p. 14).

The API:

- `DeformationProblem`: a `Γ̂ₙ`-stable family of lifts satisfying the six axioms.
- `DeformationProblem.unrestricted`: all lifts.
- `DeformationProblem.mem_map`: closure under pushforward.
- `DeformationProblem.conj_mem`: stability under `Γ̂ₙ`-conjugation.

*Needs:* [1.1](#lifting-functor); [1.6](#restriction-of-deformations).

**Checks.**

- **defProblem_unrestricted.** all lifts form a deformation problem.
- **defProblem_residue.** `(k, ρ̄_v)` belongs to every deformation problem; the empty family satisfies
  the other five axioms and is excluded only by this one.
- **defProblem_not_conj_stable.** take `G = ℤ/2` with generator `σ`, `A = 𝔽₃[ε]`, `D = diag(1, −1)`,
  `ρ(σ) = D` and `b = 1 + εE₂₁`. Then `b` reduces to `1` and `bDb⁻¹ = D + 2εE₂₁` has a nonzero lower-left
  entry, so the condition "upper triangular in this basis" is not stable under strict conjugation and
  is not a deformation problem. A central prescribed matrix such as `1` gives no such
  counterexample.

*Lean:* the `example` with `D₃`, `b₃` and `b₃inv` over `DualNumber (ZMod 3)`.

<a id="deformation-problem-ideal"></a>

### 3.2 Deformation problems are invariant ideals of the lifting ring

**Theorem.** To a local deformation problem `D` associate a closed ideal `I(D) ⊆ R^□_ρ̄_v` such that a
lift lies in `D` exactly when its classifying map kills `I(D)`. The universal strict conjugation
transformations preserve the ideal; these transformations, indexed by matrices over universal rings,
are not asserted to form an ordinary group action on that ring. The annihilator of `I(D)` in the
tangent space is `L̃(D) ⊆ Z¹`, the inverse image of a subspace `L(D) ⊆ H¹`. In the sufficient converse
of Gee's Lemma 3.17(3), a strict-conjugation-invariant radical ideal `I ≠ 𝔪` defines a problem
`D(I)`, and the two constructions are inverse on that domain; radicality is a hypothesis of that
converse, not an axiom of every quotient-represented problem. The general invariant-ideal
correspondence of CHT Lemma 2.2.3 also covers non-radical invariant ideals and is used for local
conditions with nilpotent structure (Gee, Lemma 3.17, p. 14; CHT, Lemma 2.2.3, p. 19).

*Needs:* [3.1](#local-deformation-problem); [2.3](#universal-lifting-ring);
[tangent spaces](#tangent-spaces).

**Checks.**

- **ideal_unrestricted.** `I(unrestricted) = 0` and `L(unrestricted) = H¹`.
- **ideal_unramified.** for `G_v` with inertia `I_v` and unramified `ρ̄_v`, the unramified problem has
  ideal generated by the entries of `ρ^□(σ) − 1` for `σ ∈ I_v`, and `L = H¹_ur`.
- **ideal_nonradical.** a condition whose ideal is not radical (for example `(T²)` in `𝒪⟦T⟧`, which is
  strict-conjugation invariant in rank one) is covered by the CHT correspondence but not by Gee's
  radical converse; a statement asserting radicality for every problem would exclude it.

<a id="global-deformation-type"></a>

### 3.3 Global deformation data and `T`-framed deformations

**Definition.** Take a number field `F`, a finite set `S` of places containing those above `p` and
the residual ramification, a continuous absolutely irreducible `ρ̄ : G_{F,S} → GLₙ(k)`, a determinant
lift `χ`, local problems `D_v` for `v ∈ S` and `T ⊆ S`. A type-`𝒮` `T`-framed deformation over `A` is a
tuple `(ρ, (α_v)_{v∈T})` with `det ρ = χ_A`, `ρ|_{G_v} ∈ D_v` and `α_v ∈ Γ̂ₙ(A)`, modulo
`(ρ, α_v) ↦ (βρβ⁻¹, βα_v)`. Its framed local representative is `α_v⁻¹ ρ|_{G_v} α_v`; this invariant
representative, not an arbitrarily chosen global matrix, defines the local restriction map. Schur
suffices for the representability mechanism; the arithmetic statements use absolute irreducibility
(Gee, §§3.20–3.21, p. 15; KW ESI, §4.1, p. 29).

The API:

- `DeformationType`: `𝒮 = (S, {D_v}_{v∈S}, χ)`.
- `TFramedDef`: `T`-framed deformations of type `𝒮` as a functor on `C_𝒪`.
- `TFramedDef.localLift`: the well-defined framed local lift `α_v⁻¹ρ|_{G_v}α_v` for `v ∈ T`.
- `TFramedDef.forgetFraming`: the map to unframed deformations of type `𝒮`.

*Needs:* [3.1](#local-deformation-problem); [1.6](#restriction-of-deformations);
[1.7](#fixed-determinant-functors); [1.3](#strict-deformation-functor).

*Lean:* `TFramedLift`, its `MulAction` of `strictKernel`, `TFramedLift.localLift`,
`TFramedLift.localLift_smul`, `UnrestrictedTFramedDef`. The Lean quotient imposes neither the local
problems, nor the ramification set, nor the determinant; it is the unrestricted framed quotient on
which the type conditions are imposed, and it is not `TFramedDef`.

**Checks.**

- **tframed_empty_T.** for `T = ∅` the functor is the unframed deformation functor of type `𝒮`.
- **tframed_residue.** the functor is a point on `k`.
- **tframed_localLift_invariant.** `localLift` is constant on equivalence classes; the unframed
  matrix restriction `ρ|_{G_v}` changes by conjugation. Its unframed strict class is invariant.

<a id="global-framed-ring"></a>

### 3.4 Representability of global deformations of type `𝒮`

**Theorem.** The `T`-framed type-`𝒮` functor is represented on `C_𝒪` by a ring `R^{□T}_𝒮` with a
universal framed class, using the local ideals of 3.2, fixed-determinant representability (2.9) and
`Φ_p(G_{F,S})` (2.2). For `T = ∅` write `R^univ_𝒮`. Whenever a matrix-valued universal object is used,
the chosen representative and frames are named; the invariant universal framed class does not depend
on them (Gee, Lemma 3.22, p. 15).

*Needs:* [3.3](#global-deformation-type); [3.2](#deformation-problem-ideal);
[2.5](#universal-deformation-ring); [2.9](#fixed-determinant-rings); [2.2](#phi-p-global);
DeformationAndDerivedPatchingAlgebra R03.2.

**Checks.**

- **globalRing_unrestricted.** with every `D_v` unrestricted and `T = ∅`, `R^univ_𝒮` is the
  fixed-determinant universal deformation ring of `ρ̄` on `G_{F,S}`.
- **globalRing_framed_vars.** for nonempty `T`, `R^{□T}_𝒮 ≅ R^univ_𝒮⟦y₁, …, y_{n²|T|−1}⟧` (2.6).
- **globalRing_empty_condition.** if some `D_v` contains no lift over any characteristic-zero ring, the
  global ring may still be nonzero (it can have torsion points); representability does not assert a
  characteristic-zero point.

<a id="local-to-global-map"></a>

### 3.5 The map from local rings to the global framed ring

**Construction.** For each `v ∈ T` take the local framed determinant-`χ` ring and impose `I(D_v)`.
Form `R^loc_{𝒮,T} = ⊗̂_{v∈T}(R^□_{ρ̄|G_v,χ}/I(D_v))` over `𝒪`. The universal framed local representatives
classify compatible maps from the factors to `R^{□T}_𝒮`, hence a tautological local-to-global
`𝒪`-algebra map. Check the characterizing restriction formula and compatibility with enlarging `T`.
The empty tensor product is `𝒪`. The local rings and their condition quotients are supplied by
LocalGaloisDeformationRings (Gee, §3.23, p. 15; KW ESI, §4.1, p. 29).

The API:

- `Rloc`: `R^loc_{𝒮,T}` as a completed tensor product.
- `locToGlobal`: `R^loc_{𝒮,T} →ₐ[𝒪] R^{□T}_𝒮`.
- `locToGlobal_apply`: it classifies the framed local lifts `α_v⁻¹ρ^{□T}|_{G_v}α_v`.
- `locToGlobal_mono_T`: compatibility with enlarging `T`.

*Needs:* [3.4](#global-framed-ring); [3.2](#deformation-problem-ideal);
[1.6](#restriction-of-deformations); LocalGaloisDeformationRings 1.1 and 1.10;
DeformationAndDerivedPatchingAlgebra R03.1.

**Checks.**

- **rloc_empty.** `R^loc_{𝒮,∅} = 𝒪`.
- **locToGlobal_forget.** forgetting the frames gives a natural transformation from the framed
  global functor to the unframed global functor, hence a ring map `R^univ_𝒮 → R^{□T}_𝒮`. The
  strict class of `α_v⁻¹ρ|_{G_v}α_v` agrees with that of the underlying restriction. A ring map
  in the reverse direction requires a choice of universal frames.
- **rloc_wrong_restriction.** using `ρ^{□T}|_{G_v}` without `α_v` does not give an invariant
  matrix-valued local lift on global classes, so it cannot canonically classify a map from the
  local framed ring. Restriction to local unframed classes is still well defined.

<a id="relative-tangent-space"></a>

### 3.6 The relative tangent space is an adjoint Selmer group

**Theorem.** Identify the dual of the relative cotangent space
`𝔪_{R^{□T}}/(𝔪_{R^{□T}}², λ, 𝔪_{R^loc}R^{□T})` with `H¹` of the framed mapping fibre of
ArithmeticGaloisDuality R02.5/D8, whose terms are displayed below. Degree zero uses the full adjoint;
positive global degrees use trace zero; local degree zero consists only of the full-adjoint framing
terms at `T`. The dual group is an ordinary Selmer kernel with orthogonal conditions outside `T`, not
`H¹` of a second framed complex. For the dimension formula assume `p ∤ n`, `S` finite, `T ⊆ S`
containing all places above `p`, and `ρ̄` Schur; the nonempty-`T` constant is `|T| − 1`. For `T` empty,
`H⁰_rel = k` and `H¹_rel` is the ordinary fixed-determinant Selmer group, and the dimension formula is
not extended past its hypotheses (Gee, Proposition 3.24(1), p. 18, with the complexes and
differential of §3.23, pp. 16–18; KW ESI, §4.1, Lemma 4.3, p. 31).

Write `M = ad ρ̄` and `M₀ = ad⁰ρ̄`. The complexes are:

| Degree | Global terms | Local terms |
| --- | --- | --- |
| 0 | `C⁰(G, M)` | `⊕_{v∈T} C⁰(G_v, M)` |
| 1 | `C¹(G, M₀)` | `⊕_{v∈T} C¹(G_v, M₀) ⊕ ⊕_{v∈S∖T} C¹(G_v, M₀)/L̃_v` |
| `i ≥ 2` | `Cⁱ(G, M₀)` | `⊕_{v∈S} Cⁱ(G_v, M₀)` |

Negative degrees vanish. Here `L̃_v` is the inverse image of `L_v` under `Z¹ → H¹`; its elements are
cocycles, so the local quotient differential is well defined, and the degree-zero commutator of a
full matrix has trace zero, so restriction is a chain map into these terms. The relative complex is
`C_relⁱ = C_globⁱ ⊕ C_loc^{i−1}` with `d(φ, ψ) = (dφ, res φ − dψ)`, that is `Cone(res)[−1]`. Its exact
sequence begins with the scalar boundary `H⁰(G, M) → ⊕_T H⁰(G_v, M)`, injective for nonempty `T` and
Schur `ρ̄`, so then `H⁰_rel = 0`. With

```text
H¹_dual = ker( H¹(G, M₀ˇ(1)) → ⊕_{v∈S∖T} H¹(G_v, M₀ˇ(1))/L_v^⊥ ),
```

the dimension formula is

```text
h¹_rel = |T| − 1 − Σ_{v|∞} h⁰(G_v, M₀) + Σ_{v∈S∖T} (dim L_v − h⁰(G_v, M₀)) + dim H¹_dual − h⁰(G, M₀(1)).
```

*Needs:* [3.4](#global-framed-ring); [3.5](#local-to-global-map);
[tangent spaces](#tangent-spaces); ArithmeticGaloisDuality R02.4, R02.5, R02.6 and D8
(*Selmer and deformation tangent comparison*); SelmerIwasawaCohomology Layer 2.

*Lean:* `scalarFrameCokernel`, its three dimension `example`s, and the two-term differential
`example` over `ZMod 3`.

**Checks.**

- **scalar_boundary_two_frames.** in rank one with two framings the scalar boundary has cokernel
  `k²/diag(k)` of dimension one; with one framing the cokernel is zero; with no framings all scalars
  remain in `H⁰`. A complex using trace-zero adjoints in degree zero would lose these terms, and in
  rank one would have no degree-zero terms at all.
- **relTangent_sign.** for the identity map between two-term complexes `k → k` with identity
  differentials, the mapping fibre has `d⁰(x) = (x, x)` and `d¹(a, b) = a − b`. Over `𝔽₃`,
  `d¹d⁰(1) = 0`; replacing the minus sign by a plus gives `2 ≠ 0`.
- **relTangent_count_rank_one.** for `n = 1`, `M₀ = 0`, so `h¹_rel = |T| − 1` for nonempty `T`, the
  scalar frame directions only.
- **relTangent_T_empty.** for `T = ∅` the constant `|T| − 1 = −1` would be wrong; the correct statement
  is `H⁰_rel = k` and `H¹_rel = H¹_{L}(G, M₀)`.

<a id="local-to-global-presentation"></a>

### 3.7 Presentation of the global ring over the local rings

**Theorem.** With `g = dim_k H¹_rel` relative tangent generators there is a surjection
`R^loc_{𝒮,T}⟦x₁, …, x_g⟧ ↠ R^{□T}_𝒮` inducing the tangent isomorphism. For its kernel `J` and the
source maximal ideal `𝔪`, assume `T = S` or that every `D_v` outside `T` is liftable; then
`dim_k J/𝔪J ≤ dim_k H²_rel`, which in the duality setting of 3.6 is the dimension of the ordinary dual
Selmer group. The extra hypothesis supplies local lifts across each small extension; the
tangent-generator surjection does not need it. In the rank-two dyadic version use the full-adjoint
and dual conventions of Khare–Wintenberger instead of the odd-`p` trace splitting (KW ESI, §4.1,
Lemma 4.5 and its proof, pp. 32–33; Gee, Proposition 3.24(2), p. 18; KW final, §4.2, Lemma 4.6,
pp. 43–45; CHT, Corollary 2.2.12, p. 25).

*Proof sketch.* The obstruction map and the product formula come from ArithmeticGaloisDuality
(*Selmer and deformation tangent comparison*; in the Khare–Wintenberger setting, *Khare–Wintenberger
tangent and relation bounds*); the algebra turning tangent and obstruction spaces into a presentation
is DeformationAndDerivedPatchingAlgebra R03.2 (minimal presentations and the obstruction bound on
relations).

*Needs:* [3.6](#relative-tangent-space); [3.5](#local-to-global-map); ArithmeticGaloisDuality R02.4,
R02.6 and D8; DeformationAndDerivedPatchingAlgebra R03.2.

**Checks.**

- **presentation_rank_one.** for `n = 1` with fixed determinant and unrestricted local conditions,
  every lift is `χ_A`, so each local ring
  is `𝒪`, `R^loc = 𝒪`, and for `T = S` nonempty `R^{□T}_𝒮 = 𝒪⟦x₁, …, x_{|T|−1}⟧` (frames modulo the
  common scalar): the presentation has `g = |T| − 1` generators and no relations, matching 3.6.
- **presentation_needs_liftability.** a problem represented by `𝒪⟦x⟧/(x²)` is not liftable: the point
  `x ↦ t` over `k[t]/(t²)` has no lift to `k[t]/(t³)`, since `(t + at²)² = t² ≠ 0` there. For such a
  problem outside `T` the relation bound by the dual Selmer dimension is not available, so the
  hypothesis "`T = S` or liftable outside `T`" is retained.
- **presentation_dyadic_conventions.** at `p = 2` the trace-zero module contains the scalars, and a
  count using `ad⁰` with the odd-`p` dual would be off by the boundary term `δ_2 = 1` of
  ArithmeticGaloisDuality's Khare–Wintenberger count.

<a id="global-dimension-lower-bound"></a>

### 3.8 Lower bound for the dimension of global deformation rings

**Theorem.** With the odd-`p` finite-place convention and `T = S`, and with `p > 2` and `p ∤ n`,

```text
dim R^univ_𝒮 ≥ 1 + Σ_{v∈S} (dim(R^□_{ρ̄|G_v,χ}/I(D_v)) − n²) − Σ_{v|∞} h⁰(G_v, ad⁰ρ̄) − h⁰(G_{F,S}, ad⁰ρ̄(1)).
```

Local Krull dimensions are supplied by LocalGaloisDeformationRings. In the Khare–Wintenberger
rank-two totally real odd setting, include the archimedean local rings in `S`: the local relative
dimensions are `3` away from `p` and infinity, `3 + [F_v : ℚ_p]` at `p`, and `2` at infinity, giving
`dim R̄^ψ_S ≥ 1`. This is a lower bound; a characteristic-zero point also requires the finiteness
supplied by its modularity consumer (Gee, Proposition 3.24(3), p. 18; KW ESI, §4.1, Proposition 4.4,
p. 32; KW final, §4.2, Proposition 4.5, p. 42, and Corollary 4.7, p. 45).

*Needs:* [3.7](#local-to-global-presentation); [3.6](#relative-tangent-space);
[2.6](#framed-unframed-comparison); ArithmeticGaloisDuality R02.6 (*Archimedean adjoint
dimensions*); LocalGaloisDeformationRings 1.1, 1.11, 8.17.

**Checks.**

- **dimBound_KW_Q.** for `F = ℚ` and `S = {p, ∞}` in the Khare–Wintenberger setting, the local relative
  dimensions `4 = 3 + [ℚ_p : ℚ_p]` and `2` sum to `6 = 3|S|`, so the local tensor ring has dimension `7`;
  the framed global ring needs `h + |S| − 1 = h + 1` generators and at most `h` relations, so its
  dimension is at least `8`, and removing the `4|S| − 1 = 7` framing variables gives
  `dim R̄^ψ_S ≥ 1`.
- **dimBound_integer_first.** the bound is an inequality in `ℤ`; for small local dimensions the right
  side can be negative, and natural-number subtraction would silently give a false bound.
- **dimBound_not_finite.** the bound `≥ 1` does not imply that `R^univ_𝒮` is finite over `𝒪`; finiteness is
  a theorem of the consumer.

### Examples

- Rank one: `M₀ = 0`, the framed complex reduces to the scalar frames, and the relative tangent space
  has dimension `|T| − 1` for nonempty `T`; with `T = ∅` the full scalar `H⁰ = k` survives.
- The upper-triangular condition over `𝔽₃[ε]` in 3.1 is the basic example of a condition that is not
  a deformation problem; the Borel-ordinary conditions of LocalGaloisDeformationRings are made
  stable by quantifying over all flags.

### Dependencies

Layers R04.1–R04.2; ArithmeticGaloisDuality R02.4–R02.6 and D8; SelmerIwasawaCohomology Layer 2;
DeformationAndDerivedPatchingAlgebra R03.1–R03.2; LocalGaloisDeformationRings 1.1, 1.10, 1.11, 8.17.

## Layer R04.4: Restriction, twists and changes of problem

This layer builds the functorial ring maps and their separate algebraic properties. Restriction is
finite under its hypothesis; imposing additional equations is a quotient. Twisting supplies formal
group actions and, in the dyadic setting, a determinant map, a free torus action and a finite flat
torsor.

<a id="restriction-ring-map"></a>

### 4.1 Restriction to a finite extension as a ring map

**Construction.** For `F′/F` finite and `S′` the places above `S`, restriction defines a
contravariant local ring map `R^□_{ρ̄|G_{F′,S′}} → R^□_ρ̄`, and similarly with fixed determinant. On
unframed rings require absolute irreducibility after restriction. If each local problem over `F′`
contains the restrictions of the lifts allowed by the corresponding problem over `F`, the map
descends to the condition quotients. The map classifies the restricted universal lift, and
compositions of restrictions give compositions of ring maps in the opposite order (Gee, §3.25,
p. 18; KW final, §10.1, proof of Theorem 10.1, p. 91).

The API:

- `resRing`: the framed restriction map `R^□_{ρ̄|H} → R^□_ρ̄` for a continuous `H → G`.
- `resRingUnframed`: the unframed restriction map, for absolutely irreducible `ρ̄|H`.
- `resRing_classifies`: `resRing` classifies the restriction of the universal lift.
- `resRing_comp`: restriction along a composite is the composite of the maps.

*Needs:* [2.3](#universal-lifting-ring); [2.5](#universal-deformation-ring);
[1.6](#restriction-of-deformations); [3.3](#global-deformation-type).

**Checks.**

- **resRing_id.** restriction along the identity is the identity map.
- **resRing_comp_apply.** for `H′ → H → G`, `resRing_{H′→G} = resRing_{H→G} ∘ resRing_{H′→H}`; the
  covariant order would not typecheck.
- **resRing_not_flat.** for `p` odd let `G = ℤ_p ⋊ {±1}` with the inversion action, `H = ℤ_p`, `n = 1`
  and `ρ̄ = 1`. A lift is a character with values in the pro-`p` group `1 + 𝔪_A`; it kills the
  commutators `x⁻²` of `ℤ_p`, hence all of `ℤ_p`, and it is trivial on the involution because `p` is odd.
  So `R^□_{ρ̄,G} = 𝒪`, while `R^□_{ρ̄|H} = 𝒪⟦Y⟧`, and the restriction map is `𝒪⟦Y⟧ → 𝒪`, `Y ↦ 0`, finite
  but not flat.

<a id="restriction-finiteness"></a>

### 4.2 Finiteness of restriction maps

**Theorem.** Let `Γ` satisfy `Φ_p`, let `Σ ≤ Γ` be open and assume `ρ̄|Σ` absolutely irreducible. Then
the unframed restriction map `R^univ_{ρ̄|Σ} → R^univ_ρ̄` makes its target a finite module over its
source. This applies to restriction to finite extensions of number fields. Finiteness is the
conclusion; no flatness or injectivity is part of it (Gee, Proposition 3.26, p. 18; BLGGT,
Lemma 1.2.3(1) and its proof, pp. 16–17).

*Proof sketch.* Put `B = R^univ_ρ̄/𝔪_Σ R^univ_ρ̄`. Its universal representation restricts on `Σ`
to a conjugate of the constant residual representation. Its kernel therefore contains the open
subgroup `ker(ρ̄|Σ)` and its normal core, so it factors through a finite group `Q`. Put `m = |Q|`.
Each image matrix satisfies `Mᵐ = 1`. For fixed `n,m` its trace is annihilated by a power of the
monic polynomial whose roots are sums of `n` `m`-th roots of unity: this follows by applying the
relation to the finite-type universal matrix algebra and then its reduced quotient. Thus each
of the finitely many traces is integral over `k`. They topologically generate `B` by 2.7, so the
finite-dimensional algebra they generate is already closed and equals `B`. Complete Nakayama
now gives module finiteness, as in BLGGT Lemma 1.2.3.

*Needs:* [4.1](#restriction-ring-map); [2.7](#carayol-trace-theorem);
[2.5](#universal-deformation-ring).

**Checks.**

- **resFinite_index_one.** for `Σ = Γ` the map is the identity.
- **resFinite_not_flat.** the **resRing_not_flat** example of 4.1 is finite and not flat, so flatness is
  not part of the conclusion.
- **resFinite_needs_absIrred.** for `ρ̄ = Ind_Σ^Γ θ` with `θ ≠ θ^c`, the restriction `θ ⊕ θ^c` is
  not Schur, so 2.5 does not supply its unframed ring. This alone does not prove failure of
  representability. The trivial rank-two representation of `Γ = Σ = ℤ_p` in 2.5 gives an
  explicit failure, showing why a source ring cannot be assumed without a representability
  hypothesis.

<a id="enlarging-ramification"></a>

### 4.3 Enlarging the ramification set gives closed immersions

**Theorem.** If `S ⊆ S′` and `ρ̄` is unramified outside `S`, identify lifts on `G_{F,S}` with lifts on
`G_{F,S′}` trivial on the inertia groups at `S′ ∖ S`. The induced maps `R^□_{S′} ↠ R^□_S` and, in the
absolutely irreducible case, `R_{S′} ↠ R_S` are surjective, with closed kernel generated by the
entries of `ρ^univ(σ) − 1` for `σ` in the new inertia groups. The fixed-determinant and
local-condition versions hold. Surjectivity of the ring map is injectivity of the map of functors,
detected on tangent spaces for complete local coefficient objects (KW final, §2.1, p. 6;
Proposition 5.11, p. 53).

*Needs:* [2.3](#universal-lifting-ring); [2.5](#universal-deformation-ring);
[tangent spaces](#tangent-spaces).

**Checks.**

- **enlarge_trivial.** for `S′ = S` the map is the identity.
- **enlarge_rank_one.** for `n = 1`, `R_{S′} = 𝒪⟦G^{ab,(p)}_{F,S′}⟧ ↠ 𝒪⟦G^{ab,(p)}_{F,S}⟧`, the map of completed
  group rings of the surjection of Galois groups.
- **enlarge_direction.** the map goes from the larger set to the smaller; a map `R_S → R_{S′}` would
  classify extending lifts, which is not defined.

<a id="change-of-determinant"></a>

### 4.4 Twisting isomorphisms and change of determinant

**Theorem.** Twisting by a continuous character `μ : G → 𝒪ˣ` identifies the framed lifting rings for
`ρ̄` and `μ̄ ⊗ ρ̄`, and the unframed rings when they exist. It sends determinant `χ` to `μⁿχ` and
transports `D_v` to `μ|G_v ⊗ D_v`. A residually trivial `μ` with `μⁿ = χ′χ⁻¹` gives an isomorphism
between the corresponding fixed-determinant rings. For rank two and `p` odd there is a unique such
square root among residually trivial characters. For `p = 2` a root need not exist, and the
obstruction is retained; the existence of roots after a soluble totally real base change is
ArithmeticGaloisDuality R02.6, *Finite-order determinant twists*, and its use belongs to
GL2ModularityLifting (KW final, Lemma 7.10 and its proof, p. 69; BLGGT, Lemma 1.2.3(2), p. 16).

*Needs:* [2.9](#fixed-determinant-rings); [1.7](#fixed-determinant-functors);
[3.1](#local-deformation-problem); ArithmeticGaloisDuality R02.6.

*Lean:* `Lift.twist`, `Lift.twist_apply`.

**Checks.**

- **twist_trivial.** twisting by the trivial character is the identity.
- **twist_det.** for `2 × 2` matrices `det(c • M) = c² det M`, so twisting by `μ` multiplies determinants
  by `μ²` in rank two.
- **twist_no_root_p2.** at `p = 2`, a square root of a character `μ` of order `2` has order `4`, so it
  needs values in `μ₄`; if `𝒪` does not contain `μ₄` there is no root with values in `𝒪ˣ`, and even
  when it does, a global root may fail to exist. A statement asserting roots at `p = 2` would fail.

<a id="diagonalizable-groups"></a>

### 4.5 Diagonalizable groups on complete local algebras

**Definition.** For a finitely generated abelian group `a` with `p`-primary torsion, the formal
diagonalizable group is `D̂(a)(A) = Hom(a, 1 + 𝔪_A)`, represented by the completion of `𝒪[a]` at the
identity of the special fibre. The free lattice `ℤᵗ` gives the formal torus `T = Ĝ_mᵗ`, and
`a = (ℤ/pᵐ)ᵗ` gives its `pᵐ`-torsion. Prove that `T[pᵐ] → T` is an isomorphism on coefficients
truncated modulo `𝔪_A^{m+1}`, because `(1 + X)^{pᵐ} − 1 ∈ (p, X)^{m+1}`. Prime-to-`p` torsion of `a`
contributes no points with values in `1 + 𝔪_A` (KW final, §2.5, p. 12; §2.6, Proposition 2.8 and its
proof, p. 14).

The API:

- `DiagGroup`: `a*` as a group functor on complete local `𝒪`-algebras, with its representing algebra.
- `DiagGroup.points`: `a*(A) ≃ Hom(a, 1 + 𝔪_A)`.
- `DiagGroup.torus`: the formal torus `Ĝ_mᵗ = (ℤᵗ)*`.
- `DiagGroup.truncation_iso`: `T[pᵐ] → T` is an isomorphism after truncation at level `m + 1`.

*Needs:* [2.3](#universal-lifting-ring); Tau Ceti
`TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic`, `DiagonalizableGroup.pointsMulEquiv`
for the ordinary character functor before completion at the identity.

**Checks.**

- **diagGroup_int_points.** `(ℤ)*(A) = 1 + 𝔪_A`.
- **one_add_X_sq_sub_one_mem.** `(1 + X)² − 1 ∈ (2, X)²` in `ℤ[X]`, the case `p = 2`, `m = 1` of the
  truncation isomorphism.
- **diagGroup_prime_to_p_trivial.** for `a = ℤ/ℓ` with `ℓ ≠ p`, `Hom(a, 1 + 𝔪_A)` is trivial for Artinian
  `A`, since `1 + 𝔪_A` is a `p`-group; this is why prime-to-`p` torsion is excluded.

*Lean:* the `example` `(1 + X)² − 1 ∈ (2, X)²`.

<a id="free-action-quotient"></a>

### 4.6 Quotients by free actions

**Theorem.** Let a representable formally smooth group functor `𝒢` act freely on a complete local
affine functor `X = Sp A`, freeness meaning that `(g, x) ↦ (x, gx)` is a closed immersion. Then the
orbit functor is represented by the coaction invariants `A^𝒢`, `X → Sp A^𝒢` is formally smooth, and
`X` is a trivial `𝒢`-torsor after choosing a local section; its tangent space is `t_X/t_𝒢` and
`dim A = dim A^𝒢 + d`, where `d = dim_k Lie(𝒢)` is the relative dimension over `𝒪`. For a possibly finite formal diagonalizable group construct the invariant
quotient and its torsor, compatibly with quotienting the character group in stages. The finite
locally free affine quotient is `ModularCurves` Layer 0C; completion, the smooth part and the passage
through the torsion and free filtration are the constructions here (KW final, §2.4, p. 10;
Proposition 2.5 and its proof, pp. 11–12; Proposition 2.6, pp. 12–13).

*Needs:* [4.5](#diagonalizable-groups); DeformationAndDerivedPatchingAlgebra R03.2;
`ModularCurves` Layer 0C.

**Checks.**

- **freeQuot_trivial_group.** for the trivial group the quotient is `X` itself.
- **freeQuot_torus_on_itself.** `Ĝ_mᵗ` acting on itself by translation has quotient a point and
  `A = 𝒪⟦x₁, …, x_t⟧`, `A^𝒢 = 𝒪` and relative dimension `d = t`, so the Krull dimensions
  satisfy `t + 1 = 1 + t`. Adding the Krull dimension `t + 1` of the group's coordinate ring
  instead would count the base dimension twice.
- **freeQuot_not_free.** `μ_p = D̂(ℤ/p)` acting on `Sp 𝒪⟦x⟧` with `x` of weight one fixes the origin;
  the invariants `𝒪⟦x^p⟧` exist, but `𝒪⟦x⟧` is not a `μ_p`-torsor over them, so freeness is needed.

<a id="truncated-actions"></a>

### 4.7 Free actions assembled from truncated actions

**Theorem.** For `m ≥ 1`, use coefficient rings with `𝔪_Aᵐ = 0` and truncate products and group axioms
at that level. Let `A_m` be such truncated coefficient rings, with compatible surjections
`A_{m+1} → A_m`, and assume there is one `C ∈ C_𝒪` with compatible surjections `C ↠ A_m`.
Then `A_∞ = lim A_m` is a Noetherian coefficient object. Given compatible action chunks of a
representable group on the `Sp A_m`, there is a unique limiting action on `Sp A_∞`, free if
each chunk is free. The common Noetherian source is part of the hypotheses, rather than a
consequence of an arbitrary inverse system. The truncation isomorphisms of 4.5 give chunks of `Ĝ_mᵗ` from actions of its
sufficiently deep `p`-power torsion. This is the passage used for the dyadic patched limit; no
untruncated torus action on a finite-level fixed-determinant ring is inferred (KW final, §2.6,
Proposition 2.7 and its proof, pp. 13–14; proof of Proposition 9.3, pp. 86–87).

*Needs:* [4.5](#diagonalizable-groups); [4.6](#free-action-quotient).

**Checks.**

- **chunks_constant_system.** a complete coefficient algebra `A` with a genuine action gives
  compatible chunks on `A/𝔪_A^m`; their limit recovers the action on `A`.
- **chunks_need_compatibility.** on `𝔽₃[x]/(x²)` the involution `x ↦ −x` reduces to itself. It cannot
  be the reduction of a specified identity action at the next level: the value on `x` would be
  both `x` and `−x`, which differ. Compatibility is essential.
- **chunks_not_untruncated.** in 4.11 take `X′ = T = Ĝ_m` with translation and `d(t) = t²`.
  The fixed-determinant fibre is `T[2]`, preserved by `T[2]`; a general element of `T` moves it
  to another determinant fibre. Thus chunks do not give an unrestricted torus action on that
  fixed-determinant fibre. In rank two the preserving subgroup is `T[2]`, independently of the
  deeper `2`-power torsion used to approximate the torus.

<a id="determinant-fixed-on-S"></a>

### 4.8 Rings with determinant fixed only on `S`, and the determinant map

**Construction.** For the rank-two Khare–Wintenberger data, let `R^□_{S∪V}` classify `S`-framed lifts
with `det ρ|D_v = ψχ_p|D_v` for `v ∈ S`, and let `R^{□,ψ}_{S∪V}` impose that determinant globally. Both
are algebras over the same local fixed-determinant tensor product at `S`; base change to its
local-condition quotient gives the barred rings. Define `d(ρ) = det ρ/(ψχ_p)`, a character of `G_V`.
The globally fixed-determinant subfunctor is `d⁻¹(1)`, and `d(χ ⊗ ρ) = χ²d(ρ)`. The unframed trace
subrings have simultaneous framing extensions in `4|S| − 1` variables when `S` is nonempty (KW final,
§4.1.1, pp. 37–38; proof of Proposition 9.3, p. 86).

The API:

- `RdetOnS`: the framed ring with determinant fixed only at the places of `S`.
- `detMap`: `d : Sp R^□_{S∪V} → G*_V`.
- `detMap_twist`: `d(χ ⊗ ρ) = χ² d(ρ)`.
- `fixedDet_eq_fiber`: `Sp R^{□,ψ}_{S∪V} = d⁻¹(1)`.

*Needs:* [3.3](#global-deformation-type); [3.5](#local-to-global-map);
[4.5](#diagonalizable-groups); [2.9](#fixed-determinant-rings).

**Checks.**

- **detMap_trivial_group.** if `G_V = 1`, the two rings coincide.
- **fixedDet_iff_detMap_one.** a point lies in `Sp R^{□,ψ}` if and only if `d` of it is `1`.
- **twist_map_not_injective_p2.** on coefficients admitting a nontrivial `2`-torsion character `η`, the
  pairs `(x, χ)` and `(η ⊗ x, ηχ)` have the same twisted image; this is tested on an Artinian
  coefficient object, since `𝒪`-points alone need not detect the whole finite group scheme.

<a id="twisting-action"></a>

### 4.9 The action of twisting characters

**Construction.** In rank two take disjoint sets `S` and `V` of places, `S` containing those above
`p` and infinity. Let `G_V` be the Galois group of the maximal abelian `p`-extension unramified
outside `V` and split at `S`; class field theory and the finiteness of tame ray class groups make
`G_V` a finite abelian `p`-group (`ClassFieldTheory` Layer 12). Its formal diagonalizable dual acts on
the globally framed problem with determinant fixed on `S` by `ρ ↦ χ ⊗ ρ`, preserving the local data and
frames at `S`. Obtain the induced ring automorphisms and their formula on the universal
representation, their commutation with changes of frame, and their descent to local-condition
quotients and trace subrings. The determinant changes by `χ²`; at `p = 2` only the subgroup dual to
`G_V/2G_V` preserves the globally fixed determinant (KW final, §5.1, p. 46).

The API:

- `twistAction`: the action of `G*_V` on the framed functor with determinant fixed on `S`.
- `twistAut`: `a_χ` for `χ : G_V → 𝒪ˣ` residually trivial.
- `twistAut_univ`: `a_χ ∘ ρ^univ = χ ⊗ ρ^univ`.
- `twistAction_comm_frame`: twisting commutes with the frame action.
- `twistAction_det`: `det(χ ⊗ ρ) = χ² det ρ`; for `χ² = 1` the determinant is preserved.

*Needs:* [4.5](#diagonalizable-groups); [4.8](#determinant-fixed-on-S);
[3.3](#global-deformation-type); [2.6](#framed-unframed-comparison); `ClassFieldTheory` Layer 12.

*Lean:* `Lift.twist`, `Lift.twist_apply`, `Lift.trace_twist`, and the `example` `det(c • M) = c² det M`.

**Checks.**

- **twistAction_one.** the trivial character acts as the identity.
- **twist_det.** for `2 × 2` matrices `det(c • M) = c² det M`.
- **twist_not_fixed_det_odd.** for `p` odd and `χ ≠ 1` residually trivial, `χ²≠ 1`, so `χ ⊗ −` does not
  preserve the fixed-determinant locus.

<a id="twist-action-free"></a>

### 4.10 Freeness of dyadic twisting and its stabilisers

**Theorem.** Assume `p = 2` and nonsolvable residual rank-two image. A residually trivial character
`χ` of `G_V` fixing a strict deformation class, over any coefficient object, is trivial. Hence the
action is free on the determinant-on-`S` framed functor, on the globally fixed-determinant functor
for its `2`-torsion twisting subgroup, and on their unframed and local-condition versions. The
nonsolvable-image hypothesis cannot be dropped: induced representations have self-twists (KW final,
§5.2, Lemma 5.1 and its proof, pp. 46–47).

*Proof sketch.* If `χ ⊗ ρ` is strictly conjugate to `ρ`, comparing traces gives
`(χ(g) − 1) tr ρ(g) = 0` for all `g`; apply the residual trace argument of KW Lemma 5.1 to every
nonzero character direction, using the nonsolvability of the residual image.

*Needs:* [4.9](#twisting-action); [4.6](#free-action-quotient); [1.3](#strict-deformation-functor);
ArithmeticGaloisRepresentations Layer 4.

*Lean:* the two `example`s conjugating by `diag(1, −1)` and its reductions modulo two and four.

**Checks.**

- **twistFree_trivial.** the trivial character fixes everything.
- **twistFree_dihedral_fails.** over characteristic-zero dyadic `𝒪`, let `ρ = Ind θ` from an
  index-two subgroup `H`, with its nontrivial quadratic character `ε_H` factoring through the
  allowed twisting quotient `G_V`. Conjugation by `diag(1, −1)` fixes the diagonal image of `H`
  and negates the antidiagonal image of `G ∖ H`. Since `−1 ≡ 1` in residue characteristic two,
  this conjugator is strict and `ε_H` is residually trivial, while `ε_H ≠ 1`. Thus this is an
  actual stabilizer of the specified strict-class action. Over odd residue characteristic the
  same conjugator is not strict, so that version would not be a counterexample.
- **twistFree_trace_step.** `tr(χ ⊗ ρ)(g) = χ(g) tr ρ(g)`.

<a id="determinant-twist-torsor"></a>

### 4.11 The determinant torsor for dyadic twisting

**Theorem.** Let the formal torus `T = Ĝ_m^γ` act freely on `X′ = Sp R′` and let `d : X′ → T` satisfy
`d(λx) = λ²d(x)`. Put `X = d⁻¹(1) = Sp R`. Then `X′ → Sp (R′)^T` is formally smooth of relative
dimension `γ` and `X → Sp (R′)^T` is a torsor for `T[2]`. In the dyadic setting squaring on a formal
torus is finite flat of degree `2^γ`, so `R` is finite flat of that degree over `(R′)^T` and
`dim R = dim (R′)^T = dim R′ − γ`. The torus hypothesis is part of the theorem: a finite diagonalizable
group does not have the same squaring interface (KW final, proof of Proposition 9.3, Lemma 9.4 and its
proof, p. 87).

*Needs:* [4.6](#free-action-quotient); [4.8](#determinant-fixed-on-S);
[4.10](#twist-action-free); [4.7](#truncated-actions).

**Checks.**

- **torsor_gamma_zero.** for `γ = 0` the torus is trivial and `R = R′`.
- **torsor_square_degree.** squaring on `Ĝ_m` is `1 + x ↦ (1 + x)²`, finite flat of degree `2` over
  `𝒪⟦y⟧` with `y = 2x + x²`.
- **torsor_odd_p.** for `p` odd squaring is an automorphism of `Ĝ_m`, the torsor is trivial and
  `R ≅ (R′)^T`; the degree `2^γ` is special to `p = 2`.

<a id="inertia-rigid-deformations"></a>

### 4.12 Inertia-rigid deformation rings

**Theorem.** Fix a profinite `G` with a finite normal inertia subgroup `I` and `G/I ≅ ℤ̂`, a lift `F`
of a generator, a residual rank-`d` representation, and an `𝒪`-valued lift `ρ₀` of determinant `φ`.
Form the affine scheme of pairs `(ρ_I, f)` satisfying the `F`-conjugation relation, determinant `φ`
and the equality of characteristic polynomials with `ρ₀` on every element of `I`. Complete its
`p`-torsion-free quotient at the residual point to obtain `R^□_{φ,0,fl}`. The residual point lies on
the flat part, every irreducible component is faithfully flat over `𝒪` of absolute dimension `d²`,
and the generic fibre is regular. Its `𝒪′`-points are exactly the determinant-`φ` lifts whose inertia
restriction is conjugate over the fraction field of `𝒪′` to that of `ρ₀`. Apply to finite inertial
image away from `p`, using the excellence and completion theorems of R03.3 (KW final, §2.7,
Propositions 2.10 and 2.11, pp. 15–16; KW ESI, §2.3, Propositions 2.6–2.7, pp. 9–11).

*Needs:* [2.3](#universal-lifting-ring); [1.7](#fixed-determinant-functors);
DeformationAndDerivedPatchingAlgebra R03.3.

**Checks.**

- **inertiaRigid_trivial_I.** for `I = 1` the ring is the unramified fixed-determinant ring, formally
  smooth of relative dimension `d² − 1` over `𝒪`, so of absolute dimension `d²`.
- **inertiaRigid_type.** if `ρ₀|I` is a nontrivial character plus the trivial character, the unramified
  lifts are not points of `R^□_{φ,0,fl}`, because their characteristic polynomials on `I` differ from
  those of `ρ₀`; a ring defined without the characteristic-polynomial equations would contain them.
- **inertiaRigid_flat_part.** the scheme before passing to the `p`-torsion-free quotient can have
  components in the special fibre; the theorem is about the flat quotient.

### Examples

- The **resRing_not_flat** (4.1) and **resFinite_not_flat** (4.2) examples give a finite, non-flat restriction map.
- For `γ = 1` the dyadic determinant fibre is the double cover `1 + x ↦ (1 + x)²` of `Ĝ_m`, the basic
  instance of 4.11.

### Dependencies

Layers R04.1–R04.3; DeformationAndDerivedPatchingAlgebra R03.2–R03.3; `ModularCurves` Layer 0C;
`ClassFieldTheory` Layer 12; ArithmeticGaloisRepresentations Layer 4; ArithmeticGaloisDuality R02.6.

## Layer R04.5: Taylor–Wiles data at auxiliary primes

This layer turns auxiliary primes into deformation data: augmented deformation problems, their
diamond-group structure and their generator counts. The cohomological existence of auxiliary sets in
the Khare–Wintenberger settings (odd `p` and `p = 2`) and the local cohomology at a Taylor–Wiles place
are ArithmeticGaloisDuality R02.6 (see *Scope and ownership*). This layer adds the Kummer
disjointness that the dyadic construction takes as a hypothesis, the ring-theoretic consequences of
the dyadic sets, the conditional selection theorem used in arbitrary rank, and the auxiliary sets of
Gee's convention. Odd and dyadic constructions use different adjoints and leave different numerical
remainders.

<a id="taylor-wiles-datum"></a>

### 5.1 Taylor–Wiles data

**Definition.** In rank two, a level-`N` datum (`N ≥ 1`) is a finite set `Q` of places disjoint from `S`
with a selected eigenvalue `α_v` at each `v ∈ Q`, such that `v ∤ p`, `Nv ≡ 1 (mod pᴺ)`, `ρ̄` is
unramified at `v` and `ρ̄(Frob_v)` has two distinct eigenvalues in `k`, one of which is `α_v`. Put
`Δ_v` for the maximal `p`-power quotient of `k(v)ˣ` and `Δ_Q = ∏_{v∈Q} Δ_v`. The augmented problem
`𝒮_Q` allows unrestricted ramification at `Q`, with local tangent condition `H¹` and dual condition
zero. Construct the quotient `Δ_Q/pᴺΔ_Q ≅ (ℤ/pᴺ)^{|Q|}`. In the dyadic construction also impose the
splitting condition in the Kummer extension of 5.3. A congruence condition alone does not select an
eigenline (Gee, §5.6, p. 33; KW final, Lemma 5.3, p. 47).

The API:

- `TaylorWilesDatum`: `(Q, (α_v)_{v∈Q})` with `Nv ≡ 1 (mod pᴺ)` and distinct Frobenius eigenvalues.
- `TaylorWilesDatum.delta`: `Δ_Q = ∏_{v∈Q} (k(v)ˣ)_p`.
- `TaylorWilesDatum.deformationType`: `𝒮_Q`, with no condition at the places of `Q`.
- `TaylorWilesDatum.delta_quotient`: `Δ_Q/pᴺ ≅ (ℤ/pᴺ)^{#Q}`.

*Needs:* [3.3](#global-deformation-type); LocalGaloisDeformationRings 2.10.

**Checks.**

- **twDatum_empty.** the empty set is a datum of every level, with `Δ_∅ = 1`.
- **twDatum_split_iff.** for `v ∤ p`, `Nv ≡ 1 (mod pᴺ)` if and only if `v` splits completely in
  `F(ζ_{pᴺ})`.
- **twDatum_scalar_excluded.** if `ρ̄(Frob_v)` is scalar, `v` is not a Taylor–Wiles place: `ad⁰ρ̄(Frob_v)`
  has only the eigenvalue `1`. There are many eigenlines in the original two-dimensional space,
  but none is distinguished by a choice between distinct eigenvalues, as the datum requires.

<a id="image-hypotheses"></a>

### 5.2 The residual image hypotheses used to choose primes

**Definitions.** Keep three rank-two hypotheses separate: (1) absolute irreducibility of
`ρ̄|G_{F(ζ_p)}`, equivalently `ρ̄` absolutely irreducible and not bad dihedral in the sense of
`GaloisRep.IsBadDihedral` (ArithmeticGaloisRepresentations §4.6, with its cyclotomic criterion);
(2) the strong condition `SL₂(𝔽_p) ⊆ ρ̄(G_F)` of Gee's `p ≥ 5` argument, with `p` unramified in `F`;
(3) nonsolvability of the image, for the dyadic Khare–Wintenberger argument. Their finite-image
content, submodule calculations and detecting elements come from ArithmeticGaloisRepresentations
Layer 4 (§4.6, §4.7 and `GL2Subgroup.sl2_submodules_charTwo`). Enormous image
(`ResidualImage.IsEnormous`, §7.10) and adequacy are different higher-rank conditions and are not
substituted here. Hypothesis (1) admits induced representations with a reducible adjoint, so its
detector must work constituent by constituent: the `S₃` representation over `𝔽₅` attached to the
splitting field of `X³ − 2` over `ℚ` has a proper invariant sign line in `ad⁰` despite residual absolute
irreducibility; its quadratic subfield `ℚ(√−3)` is disjoint from `ℚ(ζ₅)`, so it stays absolutely
irreducible on the cyclotomic subgroup (KW final, §4, p. 37; Gee, Theorem 5.2, p. 29).

The API:

- `IsCyclotomicAbsIrred`: `ρ̄|G_{F(ζ_p)}` is absolutely irreducible.
- `HasBigImage`: `ρ̄(G_F) ⊇ SL₂(𝔽_p)`.
- `HasNonsolvableImage`: `ρ̄(G_F)` is not solvable.

*Needs:* ArithmeticGaloisRepresentations Layer 4; [1.3](#strict-deformation-functor).

*Lean:* the three `example`s on the `S₃` representation over `ZMod 5`.

**Checks.**

- **sl2F4_not_solvable.** `SL₂(𝔽₄) ≅ A₅` is not solvable, so hypothesis (3) holds for surjective dyadic
  `ρ̄ : G_F → GL₂(𝔽₄)`.
- **dihedral_not_cyclotomic_irred.** for odd `p`, if `K = F(√p*)` is a proper quadratic subfield of
  `F(ζ_p)` and `θ` is a character of `G_K` with `θ ≠ θᶜ`, then `Ind_{G_K}^{G_F} θ` is absolutely irreducible
  but splits on `G_{F(ζ_p)}`, so it fails (1).
- **cyclotomic_irred_p2_trivial.** for `p = 2`, `F(ζ₂) = F`, so (1) is plain absolute irreducibility.
- **allowed_dihedral_adjoint_sign_line.** over `𝔽₅` the standard `S₃` representation satisfies (1) in the
  stated `ℚ` example, while `k·J ⊊ ad⁰` is a nonzero invariant sign line: `J ≠ 0`, `tr J = 0`, the
  three-cycle fixes `J` and the transposition negates it, `diag(1, −1) ∉ k·J`, and `1, C, S, CS` span
  `M₂(𝔽₅)` (determinant of the flattened basis nonzero).

<a id="dyadic-linear-disjointness"></a>

### 5.3 Linear disjointness for dyadic auxiliary primes

**Theorem.** Let `p = 2`, `F` totally real and `ρ̄` with nonsolvable image. Write `M_n = ℚ(μ_{2ⁿ})`,
`M_n⁺ = ℚ(x_n)` with `x_n = (ε_n + ε_n⁻¹)/2`, and `y_n = (x_n + 1)/2 = x_{n+1}²`. Let `n₀ ≥ 2` be maximal
with `M_{n₀}⁺ ⊆ F`, put `F_n = F(μ_{2ⁿ})` and let `F̃_n` be the Kummer extension of `F_n` generated by a
`2^{n−1}`-th root attached to `y_{n₀}`. Prove the successive `2`-power radical degree lemma (KW 5.7),
the degree-eight dihedral extension (KW 5.8) and the cyclic degree `2^{n−1}` with its quadratic
subextension (KW 5.9). The Kummer class is unramified outside `S` and has order divisible by `2^{n−1}`.
If `K` is the field cut out by `ad ρ̄` and `L` is the splitting field over `K` of the image of
`H¹(G_{F,S}, ad ρ̄)`, then `L(μ_{2ⁿ})` and `F̃_n` are linearly disjoint over `F_n` for `n > n₀`. Track the
recursion `R_n(X) = R_{n−1}(2X² − 1)` to control ramification. This is the disjointness that
ArithmeticGaloisDuality R02.6, *Dyadic auxiliary primes and the cyclotomic residual*, takes as a
hypothesis (KW final, §5.5.1, Proposition 5.6 and Lemmas 5.7–5.9, pp. 48–50).

*Needs:* [5.2](#image-hypotheses); ArithmeticGaloisRepresentations Layer 4.

*Lean:* the `example` `R₄(X) = R₃(2X² − 1) = 8X⁴ − 8X² + 1`.

**Checks.**

- **chebyshev_four.** with `R₃ = 2X² − 1`, `R₄(X) = R₃(2X² − 1) = 8X⁴ − 8X² + 1` (the Chebyshev polynomial
  `T₄`), so `R₄(0) = 1`.
- **n0_rational.** for `F = ℚ`, `M₂⁺ = ℚ` and `M₃⁺ = ℚ(√2) ⊄ ℚ`, so `n₀ = 2`.
- **y_relation.** for `n = 2`, `x₂ = cos(π/2) = 0` and `y₂ = 1/2 = x₃²` with `x₃ = cos(π/4) = √2/2`; a
  definition `y_n = x_n²` would give `0` and no Kummer extension.

<a id="dyadic-taylor-wiles-primes"></a>

### 5.4 Dyadic Taylor–Wiles sets and their generator counts

**Theorem.** Let `F` be totally real, `p = 2`, `ρ̄` with nonsolvable image and `S` containing the
infinite places, the places above `2` and the ramification. For `n > n₀` take the set `Q_n` of
ArithmeticGaloisDuality R02.6, *Dyadic auxiliary primes and the cyclotomic residual*, using 5.3 for its
disjointness hypothesis. With `Ad = ad ρ̄`, `Z ⊆ Ad` the scalars and `D_v` the decomposition groups, that
target gives: (1) `|Q_n| = h¹(S, Ad) − 2`, independent of `n`; (2) `Nv ≡ 1 (mod 2ⁿ)` and distinct
residual Frobenius eigenvalues at `v ∈ Q_n`; (3) each `v ∈ Q_n` splits in `F̃_n`, with
`h⁰(D_v, Ad) = 2` and `h¹_{Q_n-split}(S, Ad) = 2`; (4) `h¹_{S-split}(Q_n, Ad) = 2 − Σ_{v∈S} h⁰(D_v, Ad) + 2|Q_n|`;
(6) `G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})^t` for the auxiliary abelian `2`-extension group `G_n`; (7)
`t = 2 − |S| + |Q_n|`. Prove the ring statements:

- (5) `R^□_{S∪Q_n}`, with determinant imposed only on `S`, is topologically generated by
  `2|Q_n| + 1` elements over the fixed-determinant local tensor ring at `S`;
- (8) `(h¹_{S-split}(Q_n, Ad) − t) + (Σ_{v∈S} h⁰(D_v, Ad) − h⁰(G_F, Ad)) = |Q_n| + |S| − 1`.

The full-adjoint and trace-kernel relationship in characteristic two stays explicit throughout; the
residual of dimension two is accounted for by the auxiliary twisting group of 4.9 and its quotient
(KW final, §5.5.2, Lemma 5.10 and its proof, pp. 50–53, with (5) and (8) in Lemma 5.10(f)–(g), p. 51).

*Proof sketch.* The relative tangent space of the determinant-on-`S` problem (3.6 with the full
adjoint and frames at `S`) has dimension `h¹_{S-split}(Q_n, Ad) + Σ_{v∈S} h⁰(D_v, Ad) − h⁰(G_F, Ad)`; by
(4) and `h⁰(G_F, Ad) = 1` (the scalars, `ρ̄` being absolutely irreducible) this is `2|Q_n| + 1`, which
is (5). Substituting (4) and (7) gives (8) as an identity in `ℤ`.

*Needs:* [5.1](#taylor-wiles-datum); [5.3](#dyadic-linear-disjointness);
[5.2](#image-hypotheses); [4.8](#determinant-fixed-on-S); [4.9](#twisting-action);
[3.6](#relative-tangent-space); ArithmeticGaloisDuality R02.6; `Chebotarev` Layer 10 and 11.3(2).

*Lean:* the `example` `(h + (4S − 1) + (2 − S + h)) − 3S = 2h + 1` and the `example` that `1` has trace
`0` in `M₂(𝔽₂)`.

**Checks.**

- **dyadic_count_identity.** (8) holds identically in `ℤ` after substituting (4) and (7); a version using
  natural-number subtraction for `t = 2 − |S| + |Q_n|` would fail when `|S| > 2 + |Q_n|`.
- **dyadic_scalars_traceless.** in characteristic two `tr(1) = 0` in `M₂`, so `Z ⊆ Ad⁰` and `Ad⁰/Z` is
  two-dimensional; the odd-`p` decomposition `Ad = Z ⊕ Ad⁰` is unavailable.
- **dyadic_residual_two.** the count subtracts two because the classes inflated from `Gal(F_n/F)` vanish at
  every `v` with `Nv ≡ 1 (mod 2ⁿ)`; a construction asserting that the whole dual Selmer group is killed
  would be false.

<a id="taylor-wiles-inertia-action"></a>

### 5.5 Inertia at Taylor–Wiles places and the `Δ_Q`-module structure

**Construction.** Use the selected `α_v` to diagonalize the universal local lift at each `v ∈ Q_N` into
two characters (LocalGaloisDeformationRings 2.10). For globally fixed unramified determinant their
inertia characters are inverse to each other, and the selected one factors through `Δ_v`. Construct
the `𝒪[Δ_Q]`-algebra structure on the framed and the trace rings. Quotienting by the augmentation
ideal recovers the problem without `Q`. In the dyadic case, for the fixed-determinant twisting
automorphism `a_χ` and a diamond element `δ`, prove `a_χ ∘ δ = χ(δ)·(δ ∘ a_χ)`. The global augmentation
statement uses the inertia quotient of 4.3 (KW final, §5.6, Proposition 5.11 and Lemma 5.12, p. 53).

*Needs:* [5.1](#taylor-wiles-datum); LocalGaloisDeformationRings 2.10;
[4.3](#enlarging-ramification); [4.9](#twisting-action).

*Lean:* the `example` computing `diag(α, β)·E₁₂·diag(α, β)⁻¹ = (α/β)·E₁₂`.

**Checks.**

- **delta_empty.** for `Q = ∅`, `𝒪[Δ_∅] = 𝒪` and the structure map is the unit.
- **augmentation_quotient.** the quotient by the augmentation ideal of `𝒪[Δ_Q]` is the ring of `𝒮` without
  `Q`, because a lift unramified at `Q` has trivial inertia characters.
- **eigenline_selects_character.** with `Frob_v = diag(α, β)`, conjugation acts on `E₁₂` by `α/β ≠ 1`, so
  the two characters are distinguished by the selected eigenvalue; without the selection the
  `Δ_v`-action is defined only up to inversion.

<a id="chebotarev-selmer-selection"></a>

### 5.6 Shared Chebotarev selection for Selmer detection

**Theorem.** Let `H` be a finite-dimensional `k`-space of continuous global cohomology classes with
linear localization maps `loc_v` at admissible unramified places. Suppose that each nonzero class has a
detecting conjugacy class in a finite Galois quotient: every prime in that class, outside a specified
finite exceptional set, is admissible and has nonzero localization. Suppose also that there is a
nonempty admissible conjugacy class for padding, even when `H = 0`. Then for any finite avoidance set
`B` and any `q ≥ dim H` there are exactly `q` distinct admissible primes outside `B` with injective joint
localization, and they can all be taken of residue degree one over `ℚ`. Congruences and ordered
eigenvalues are encoded in the finite quotient. Each application supplies conjugacy invariance,
independence of coboundaries, the detection property and the interpretation of the joint kernel as
the new dual Selmer group; the ramified primes of auxiliary fields are put in `B`. For `q = dim H` the
conclusion is the input of ArithmeticGaloisDuality R02.6, *The conditional dual-Selmer killing
calculation* (ACC published, Lemma 6.2.32, proof, printed pp. 1045–1046, PDF pp. 149–150).

*Proof sketch.* Induct on the dimension of the current joint kernel: choose a nonzero class in it and a
prime in its detecting class outside `B` and the primes already chosen (Chebotarev density, `Chebotarev`
Layer 10, with the higher-degree discard of 11.3(2) for residue degree one); the kernel drops. Then
pad with primes from the padding class.

*Needs:* ArithmeticGaloisDuality R02.6; `Chebotarev` Layer 10 and 11.3(2).

*Lean:* the two `example`s on joint localization over `ZMod 3`.

**Checks.**

- **selection_H_zero.** for `H = 0` the theorem still produces exactly `q` primes, from the padding class;
  without the padding hypothesis it could not.
- **selection_independent_coordinates.** two coordinate localizations on `(ℤ/3)²` have zero joint kernel.
- **selection_repeated_fails.** repeating one localization twice cannot kill a two-dimensional `H`; the
  induction must choose a prime detecting a class in the current kernel.

<a id="odd-taylor-wiles-primes"></a>

### 5.7 Existence of Taylor–Wiles primes for odd `p`

**Theorem.** For `p > 2` there are two settings. Under the Khare–Wintenberger hypotheses (`F` totally
real and unramified above `p`, `ρ̄` totally odd with (1) of 5.2, the local conditions of KW §4.1.4) the
auxiliary sets are ArithmeticGaloisDuality R02.6, *Odd-prime Taylor–Wiles auxiliary sets*, of size
`h¹_{L^⊥}(S, (ad⁰)ˇ(1))`; at `p = 3` that target uses KW Lemmas 5.2(1) and 5.3, and Taylor's argument
assuming `l > 3` is not a justification there. Under Gee's hypotheses (`p ≥ 5`, `F` totally real with
`p` unramified, `ρ̄` odd with (2) of 5.2, `T` the finite ramification set containing the places above
`p`), put `r = max(h¹(G_{F,T}, (ad⁰ρ̄)(1)), 1 + [F : ℚ] − |T|)`. For every `N ≥ 1` there is a set `Q_N` with
`Q_N ∩ T = ∅`, distinct residual Frobenius eigenvalues at each `v ∈ Q_N`, `#k(v) ≡ 1 (mod pᴺ)`,
`|Q_N| = r`, and vanishing `H¹_{Q_N}(G_{F,T}, (ad⁰ρ̄)(1))` (KW final, Lemma 5.3 and its proof, pp. 47–48,
and Lemma 5.2(1), p. 47; Gee, Proposition 5.10 and its proof, pp. 38–39; Taylor, Lemma 2.5 and its
proof, printed pp. 749–750).

*Proof sketch* (Gee's setting). Put `E = F^{ker ad ρ̄}(ζ_{pᴺ})`. The image of `ad ρ̄` is `PGL₂` or `PSL₂` of a
finite field (ArithmeticGaloisRepresentations Layer 4, from `SL₂(𝔽_p) ⊆ ρ̄(G_F)`), so `ζ_p` is not in
`F^{ker ad ρ̄}` when `p ≥ 5` is unramified in `F`, and inflation–restriction gives
`H¹(Gal(E/F), (ad⁰ρ̄)(1)) = 0` (ArithmeticGaloisDuality R02.2). Hence each nonzero class restricts
nontrivially to `G_E`, and a detecting conjugacy class exists with distinct eigenvalues and trivial
image in `Gal(F(ζ_{pᴺ})/F)`. Apply 5.6 with `q = r ≥ dim H`.

*Needs:* [5.1](#taylor-wiles-datum); [5.2](#image-hypotheses);
[5.6](#chebotarev-selmer-selection); ArithmeticGaloisDuality R02.2 and R02.6;
ArithmeticGaloisRepresentations Layer 4.

**Checks.**

- **gee_r_padding.** if `h¹(G_{F,T}, (ad⁰ρ̄)(1)) < 1 + [F : ℚ] − |T|`, then `r` exceeds the dual dimension and
  the padding clause of 5.6 is used; a construction of exactly `dim H` primes would give the wrong
  count.
- **odd_size_constant.** the size of `Q_N` does not depend on `N` in either setting.
- **p3_excluded_from_taylor.** at `p = 3` the argument of Taylor's Lemma 2.5 (which assumes `l > 3`) does
  not apply; the Khare–Wintenberger input is used instead.

<a id="taylor-wiles-generator-count"></a>

### 5.8 Generator counts at Taylor–Wiles levels

**Theorem.** After dual Selmer vanishing, the relative tangent formula of 3.6 gives counts independent
of `N`. In the Khare–Wintenberger convention, with infinity in `S` and framing at every place of `S`,
`R^{□,ψ}_{S∪Q_N}` has `|Q_N| + |S| − 1` generators over `R^{□,loc,ψ}_S` (ArithmeticGaloisDuality R02.6).
In Gee's finite-place convention, framing at `T`, `R^□_{Q_N}` is generated over `R^loc` by
`|T| − 1 − [F : ℚ] + r` elements, and likewise with the primed fixed-determinant rings. The correct
local ring and archimedean convention are used in each application; the two numbers are not
identified by notation (KW final, Proposition 5.5, p. 48; Gee, Proposition 5.10, last bullet, p. 38).

*Proof sketch* (Gee's count). By 3.6 with `T` framed and `Q_N` relaxed, the relative tangent space has
dimension `|T| + |Q_N| − 1 − [F : ℚ] + h¹_{Q_N}(G_{F,T}, (ad⁰ρ̄)(1))`, since each `v ∈ Q_N` contributes
`h¹(G_v, ad⁰) − h⁰(G_v, ad⁰) = 1` and each real place `h⁰(G_v, ad⁰) = 1`; with `|Q_N| = r` and the dual
group zero this is `|T| − 1 − [F : ℚ] + r`.

*Needs:* [5.7](#odd-taylor-wiles-primes); [3.6](#relative-tangent-space);
[3.7](#local-to-global-presentation); ArithmeticGaloisDuality R02.5 and R02.6.

*Lean:* the `example` `h + (4S − 1) − 3S = h + S − 1`.

**Checks.**

- **count_KW_vs_gee.** for `F = ℚ` and `|Q_N| = q`, the KW count with `S = {p, ∞}` is `q + 1`, while Gee's
  count with `T = {p}` is `1 − 1 − 1 + q = q − 1`; the difference `2` is the relative dimension of the
  archimedean local ring, which Khare–Wintenberger include in their local tensor ring.
- **count_independent_of_N.** both counts depend only on `|Q_N|`, which is constant in `N`.
- **count_integer_first.** Gee's count `|T| − 1 − [F : ℚ] + r` is nonnegative because
  `r ≥ 1 + [F : ℚ] − |T|`; the nonnegativity is proved before the count indexes variables.

### Examples

- For `F = ℚ`, `p ≥ 5`, `T = {p}` and surjective `ρ̄ : G_ℚ → GL₂(𝔽_p)` unramified outside `p`, Gee's
  `r = max(h¹(G_{ℚ,T}, (ad⁰ρ̄)(1)), 1 + 1 − 1) = max(h¹, 1)`.
- At `p = 2` with `F = ℚ`, `n₀ = 2`, and for `n ≥ 3` the residual `Gal(F_n/F) = (ℤ/2ⁿ)ˣ ≅ ℤ/2 × ℤ/2^{n−2}`
  has two-dimensional `𝔽₂`-dual, the two-dimensional residual of 5.4.

### Dependencies

Layers R04.3–R04.4; ArithmeticGaloisDuality R02.2, R02.5, R02.6; ArithmeticGaloisRepresentations
Layer 4; `Chebotarev` Layer 10 and 11.3(2); LocalGaloisDeformationRings 2.10.

## Layer R04.6: Finite-level deformation data for patching

This layer packages the condition-specific rings, the trace representations, the diamond actions and
the uniform presentations into systems indexed by the Taylor–Wiles level. The numerical comparisons
specify the deformation side of patching; no arithmetic module and no support theorem is assumed.

<a id="kw-deformation-data"></a>

### 6.1 The global deformation data of Khare–Wintenberger

**Construction.** For the rank-two totally real lifting data of KW §§8–9, fix the finite set
`S = Σ ∪ {v | p} ∪ {v | ∞}`, the determinant `ψχ_p` and the local conditions of LocalGaloisDeformationRings
8.2: semistable with fixed unramified `γ_v` away from `p` and infinity, odd at infinity, and at `p` the
case (A) low-weight crystalline, (B) weight two in the stated odd-`p` weight range, or (C) weight-two
semistable. Their completed tensor product `B = R̄^{□,loc,ψ}_S` is LocalGaloisDeformationRings 8.17:
flat, with all components of relative dimension `3|S|` (`3` at finite places away from `p`,
`3 + [F_v : ℚ_p]` above `p`, `2` at infinity) and regular generic fibre, a domain when all finite
conditions away from `p` are semistable. Base change the unrestricted global framed ring to `B` to obtain
`R̄^{□,ψ}_S`. In Gee's variant keep the two local systems, their equality modulo `λ`, and the assumed
irreducibility of the reduced local ring, which is not automatic for all local conditions (KW final,
§9.1.1, pp. 78–79).

The API:

- `KWDeformationData`: `S`, `ψ` and the local conditions at `v ∈ S` of KW §9.1.1.
- `KWDeformationData.localRing`: `R̄^{□,loc,ψ}_S = ⊗̂_v R̄^{□,ψ}_v`.
- `KWDeformationData.localRing_isDomain`: `R̄^{□,loc,ψ}_S` is a flat domain with regular generic fibre
  (under the semistable hypothesis, LocalGaloisDeformationRings 8.17).
- `KWDeformationData.localRing_relDim`: relative dimension `3|S|`.

*Needs:* [3.3](#global-deformation-type); [3.5](#local-to-global-map); LocalGaloisDeformationRings 1.11,
1.14, 2.5, 8.2, 8.17; DeformationAndDerivedPatchingAlgebra R03.3.

*Lean:* the `example` `3|S_f| + [F : ℚ] + 2[F : ℚ] = 3(|S_f| + [F : ℚ])`.

**Checks.**

- **relDim_Q.** for `F = ℚ` and `S = {∞, p}` the relative dimension is `2 + 4 = 6`.
- **relDim_formula.** for totally real `F`, with `S_f` the finite places of `S`, the local relative
  dimensions sum to `3|S_f| + Σ_{v|p} [F_v : ℚ_p] + 2[F : ℚ] = 3|S_f| + [F : ℚ] + 2[F : ℚ] = 3|S|`, since `F` has
  `[F : ℚ]` real places; a count giving every place relative dimension `3` would be right in total only
  by accident of this cancellation, so the local dimensions are kept separately.
- **not_finite_claim.** a nonzero `R̄^{□,ψ}_S` is never finite over `𝒪` when `|S| ≥ 1`: it is a power series
  ring over `R̄^ψ_S` in `4|S| − 1 ≥ 3` variables.

<a id="trace-subring-universal-representation"></a>

### 6.2 The unframed ring as a trace subring, with its universal representation

**Theorem.** Inside the condition-specific framed ring define `R̄^ψ_S` as the closed `𝒪`-subring
generated by the universal traces. It is the image of the unframed ring, and for nonempty `S` the framed
ring is a power-series extension of it in `j = 4|S| − 1` variables. Coefficient descent (2.7) descends
the universal representation to this trace ring, and the torsor of simultaneous frames gives the
power-series coordinates (2.6). The same holds with `Q_n` added, the framing set staying `S`; the frame
variables are extra directions, not generated by traces (KW final, §4.1.2, Proposition 4.1, p. 38;
§9.1.1, p. 80).

The API:

- `KWDeformationData.unframedRing`: `R̄^ψ_S` as the trace subring of `R̄^{□,ψ}_S`.
- `KWDeformationData.univRep`: `ρ^univ_S : G_{F,S} → GL₂(R̄^ψ_S)`.
- `KWDeformationData.framed_powerSeries`: `R̄^{□,ψ}_S ≃ R̄^ψ_S⟦y₁, …, y_{4|S|−1}⟧`.

*Needs:* [6.1](#kw-deformation-data); [2.6](#framed-unframed-comparison);
[2.7](#carayol-trace-theorem).

**Checks.**

- **framingVars_one_place.** `|S| = 1` gives `3` framing variables.
- **trace_subring_eq_image.** the trace subring equals the image of the unframed ring.
- **framed_not_trace_generated.** `R̄^{□,ψ}_S` is not generated by traces when `|S| ≥ 1`, since the framing
  variables are not traces (2.7, **traceGen_framed_fails**).

<a id="factorization-through-local-conditions"></a>

### 6.3 Representations satisfying the local conditions factor through the quotient

**Theorem.** Let `A` be reduced, `𝒪`-flat and finite over `𝒪`, and let `ρ` be a rank-two lift of
determinant `ψχ_p` over `A`. If every specialization `A → 𝒪′` to the integers of a finite coefficient
extension satisfies each prescribed local condition at `S`, the classifying map `R^ψ_S → A` factors
uniquely through `R̄^ψ_S`, and likewise for the framed rings. The reduced flat local quotients are
characterised by their `𝒪′`-points, so the specializations detect their defining equations. With `Q_n`
added, check compatibility with the diamond structures and, for `p = 2`, with twists. The Hecke algebra
and its Galois representation are a consumer's separate input (KW final, Lemma 9.1 and its proof,
pp. 80–81; Definition 2.4, p. 10).

*Needs:* [6.2](#trace-subring-universal-representation); [6.1](#kw-deformation-data);
[5.5](#taylor-wiles-inertia-action); [4.9](#twisting-action).

*Lean:* the `example` exhibiting a nonzero square-zero element in `DualNumber (ZMod 3)`.

**Checks.**

- **factor_A_O.** for `A = 𝒪` the statement is the point criterion of the local conditions
  (LocalGaloisDeformationRings 8.2, `KWCondition.points`).
- **factor_needs_reduced.** take the reduced flat quotient `R = 𝒪⟦x⟧ ↠ R̄ = 𝒪`, `x ↦ 0`, and
  the finite flat nonreduced algebra `A = 𝒪[ε]/(ε²)`. The map `x ↦ ε` does not factor through
  `R̄`, although every specialization to `𝒪′` kills `ε` and factors through `R̄`. Reducedness
  cannot be omitted from the point-detection argument.
- **factor_residue.** for `A = k` there are no characteristic-zero specializations, but the
  residual point does factor through every local quotient with residue field `k`. Thus `k`
  itself is not a counterexample to factorization.
- **factor_torsion_thickening.** with the same `R ↠ R̄`, take `A = k[ε]/(ε²)` and `x ↦ ε`. There
  are no characteristic-zero specializations and this map does not factor. This example
  violates both flatness and reducedness; it does not claim their independent necessity.

<a id="taylor-wiles-deformation-system"></a>

### 6.4 The Taylor–Wiles system of deformation rings

**Construction.** For `p` odd write `B` for the condition-specific local tensor ring, `d = 3|S|`, `h` for
the original dual Selmer dimension and `j = 4|S| − 1`. Choose the constant-size sets `Q_n` (5.7) and
generators `δ_i` of their `h` diamond factors. Construct compatible surjections
`B⟦x₁, …, x_{h+j−d}⟧ ↠ R̄^{□,ψ}_{S∪Q_n} ↠ R̄^{□,ψ}_S`. Make the middle ring an `𝒪⟦y₁, …, y_{h+j}⟧`-algebra: the
first `h` variables map to `δ_i − 1` and the remaining `j` are frame coordinates. Killing the first `h`
recovers the base framed ring; killing all of them recovers `R̄^ψ_S`. The completed diamond-group
algebra relations `(1 + y_i)^{|Δ_{v_i}|} − 1` lie in the ideal generated by `(1 + y_i)^{pⁿ} − 1`. This
finite-level ring system is the export; its modules and the patched limit belong to the modularity and
patching roadmaps (KW final, proof of Proposition 9.2, display (∗∗), p. 82; Gee, after
Proposition 5.10, p. 39).

The API:

- `TWSystem`: for each `n`, `R̄^{□,ψ}_{S∪Q_n}` with its `B⟦x⟧`-presentation and `𝒪⟦y⟧`-algebra structure.
- `TWSystem.quot_y_eq`: `R̄^{□,ψ}_{S∪Q_n}/(y₁, …, y_h) ≅ R̄^{□,ψ}_S`.
- `TWSystem.quot_all_eq`: `R̄^{□,ψ}_{S∪Q_n}/(y₁, …, y_{h+j}) ≅ R̄^ψ_S`.
- `TWSystem.numVars_const`: the number `h + j − d` of `x`-variables is independent of `n`.

*Needs:* [6.1](#kw-deformation-data); [6.2](#trace-subring-universal-representation);
[5.7](#odd-taylor-wiles-primes); [5.8](#taylor-wiles-generator-count);
[5.5](#taylor-wiles-inertia-action); [4.3](#enlarging-ramification).

**Checks.**

- **twSystem_h_zero.** for `h = 0` the system is constant.
- **twSystem_specialisation.** killing `y₁, …, y_h` recovers `R̄^{□,ψ}_S`.
- **twSystem_not_p2.** the odd-`p` construction does not extend by substituting `p = 2`: in the
  nonsolvable dyadic setting, distinct-eigenvalue Frobenius elements fail to detect the `Ad⁰/Z`
  constituent, and the determinant-on-`S` rings and the counts of 6.6 are used instead; it is not
  claimed that every dyadic dual Selmer group is nonzero.

<a id="patching-numerology"></a>

### 6.5 The numerical coincidence for patching

**Theorem.** With `dim B = 1 + d`: for `p` odd, `1 + d + (h + j − d) = 1 + h + j`, the dimension of
`𝒪⟦y₁, …, y_{h+j}⟧`. In the dyadic construction `t = 2 − |S| + h`, and the source has `h + j + t − d = 2h + 1`
generators and dimension `1 + h + j + t`. In Gee's framing convention the two corresponding source
dimensions both equal `4|T| + r`. These comparisons use the specific local-ring dimensions and the chosen
framing variables, not a general claim about the dimension of global deformation rings (KW final, proof of
Proposition 9.2, (II), p. 83; proof of Proposition 9.3, p. 86; Gee, §5.6, p. 40).

*Needs:* [6.1](#kw-deformation-data); [6.4](#taylor-wiles-deformation-system);
[5.4](#dyadic-taylor-wiles-primes).

*Lean:* the `example`s `h + (4S − 1) − 3S = h + S − 1` and `h + (4S − 1) + (2 − S + h) − 3S = 2h + 1`.

**Checks.**

- **numerology_odd.** `h + j − d = h + |S| − 1`, the Khare–Wintenberger count of 5.8.
- **numerology_dyadic.** `h + j + t − d = 2h + 1`, the count (5) of 5.4.
- **numerology_integers.** all identities hold in `ℤ`; with `t = 2 − |S| + h` negative for large `S`, a
  natural-number version would be wrong.

<a id="dyadic-patching-data"></a>

### 6.6 The finite-level data for `2`-adic patching

**Construction.** At `p = 2` let `h = |Q_n|`, `t = 2 − |S| + h` and `G_n` the auxiliary abelian group of 5.4.
Choose an identification `G′_n = G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})^t` and a compatible surjection `ℤ^t ↠ G_n`.
Its dual embeds `G_n*` in `T = Ĝ_m^t` and identifies `(G′_n)*` with `T[2^{n−2}]`. Construct the pair
`R′_n = R̄^□_{S∪Q_n}`, with determinant imposed only on `S`, and `R_n = R̄^{□,ψ}_{S∪Q_n}`. Keep the determinant
map into `G_n*`, its fibre-one equation, its square-equivariance, the free twisting action, the
`B`-presentation in `h + j + t − d` variables and the compatibility with diamond elements. The lattice
presentation puts the determinant map into `T`, while the chosen quotient supplies the torsion subgroup
used for the action chunks of 4.7; levels `n + a` with `a ≥ 2` give chunks compatible with the required
truncations. These are the finite-level inputs of the dyadic patching argument (KW final, §9.1.3,
Proposition 9.3 (I)(3), p. 84; proof of Proposition 9.3, pp. 84–87).

The API:

- `DyadicPatchingDatum`: `(R′_n, R_n, ℤ^t ↠ G_n` compatible with `G′_n`, `d_n`, twisting action,
  presentation`)` at level `n`.
- `DyadicPatchingDatum.fiber_eq`: `Sp R_n = d_n⁻¹(1)`.
- `DyadicPatchingDatum.d_sq`: `d_n(λρ) = λ²d_n(ρ)`.
- `DyadicPatchingDatum.action_free`: the twisting action is free.

*Needs:* [5.4](#dyadic-taylor-wiles-primes); [4.8](#determinant-fixed-on-S);
[4.10](#twist-action-free); [4.5](#diagonalizable-groups); [5.5](#taylor-wiles-inertia-action);
[6.1](#kw-deformation-data).

**Checks.**

- **dyadic_t_zero.** for `t = 0`, `T` is trivial and `R′_n = R_n`.
- **dyadic_d_sq.** `d_n(λρ) = λ²d_n(ρ)`, from `det(λ·M) = λ² det M` in rank two.
- **dyadic_not_fixed_det.** the fixed-determinant rings `R_n` alone carry only the `2`-torsion
  `G*_{n,2}`-action, not a torus action (4.7, **chunks_not_untruncated**).

### Examples

- For `F = ℚ` and `S = {p, ∞}` with `p` odd: `d = 6`, `j = 7`, and the system has `h + 1` power-series
  variables over `B` for every `n`, matching `dim = 1 + h + 7`.
- At `p = 2`, `F = ℚ` and `S = {2, ∞}`: `t = h` and the source has `2h + 1` generators.

### Dependencies

Layers R04.2–R04.5; LocalGaloisDeformationRings 1.11, 1.14, 2.5, 8.2, 8.17;
DeformationAndDerivedPatchingAlgebra R03.3.

## Layer G8: Variable-determinant global problems

This layer uses the full adjoint and local coefficient rings `Λ_v`. It supplies the non-polarized global
rings of ACC and their fixed-determinant quotients, and comes before the arbitrary-rank Taylor–Wiles
applications of G7.

<a id="variable-determinant-problem"></a>

### 7.1 Global deformation problems with variable determinant

**Definition.** In the ACC setting assume `F` a number field, `ρ̄` continuous and absolutely irreducible
of rank `n`, `p ∤ 2n`, and a coefficient field containing the images of all embeddings of `F`. Choose a
finite `S` containing the places above `p` and the residual ramification; for each `v ∈ S` take
`Λ_v ∈ CNL_𝒪` and a strict-conjugation-stable, quotient-represented local lifting subfunctor `D_v` on
`CNL_{Λ_v}`. Put `Λ = ⊗̂_{v∈S} Λ_v` and `𝒮 = (ρ̄, S, (Λ_v), (D_v))`. A global lift over `CNL_Λ` is unramified
outside `S` and lies in `D_v` locally; no determinant equation is imposed. Strict classes and `T`-framed
classes use the simultaneous action of 3.3. The local quotient, strict stability, coefficient and
residue compatibility are part of the local data (ACC arXiv v2, §6.2.1, Definition 6.2.2, p. 136; ACC
published, Definition 6.2.2, printed p. 1032).

The API:

- `GlobalDeformationProblem`: `(ρ̄, S, {Λ_v}, {D_v})` with each `D_v` strict-conjugation-stable and
  quotient-represented.
- `GlobalDeformationProblem.IsOfType`: `ρ` is unramified outside `S` and `ρ|G_{F_v} ∈ D_v(A)` for all
  `v ∈ S`.
- `GlobalDeformationProblem.framedDef`: the functor `D^T_𝒮` of `T`-framed deformations of type `𝒮` on
  `CNL_Λ`.

*Needs:* [3.1](#local-deformation-problem); [3.2](#deformation-problem-ideal);
[1.1](#lifting-functor); [1.3](#strict-deformation-functor); LocalGaloisDeformationRings 1.1 and 1.15.

**Checks.**

- **problem_unrestricted.** among lifts already factoring through `G_{F,S}`, unrestricted `D_v` impose no
  further condition; they do not remove the requirement of being unramified outside `S`.
- **isOfType_strictEquiv.** type `𝒮` is preserved by strict equivalence.
- **fixed_matrix_not_problem.** for the `𝔽₃[ε]` example of 3.1 the prescription `ρ(σ) = diag(1, −1)` fails
  strict-conjugation stability, while prescribing the central matrix `1` gives no such
  counterexample.

<a id="variable-determinant-representability"></a>

### 7.2 Representability and framing

**Theorem.** The unframed and `T`-framed type-`𝒮` functors are represented by `R_𝒮` and `R^T_𝒮` in `CNL_Λ`.
If `T` is nonempty and `v₀ ∈ T`, choose a universal representative and normalise one frame entry to get
`R^T_𝒮 ≅ R_𝒮 ⊗̂_𝒪 (𝒪⟦X_{v,i,j}⟧/(X_{v₀,1,1}))`, formally smooth over `R_𝒮` with `n²|T| − 1` frame variables; the
universal frame tuple is `1 + (X_{v,i,j})`. For `T` empty use `R_𝒮` directly. The full adjoint and the
residual absolute irreducibility of the ACC setting are kept (ACC arXiv v2, Theorem 6.2.3 and
Lemma 6.2.4, p. 137; ACC published, printed p. 1033).

*Needs:* [7.1](#variable-determinant-problem); [2.3](#universal-lifting-ring);
[2.2](#phi-p-global); [2.5](#universal-deformation-ring); [2.6](#framed-unframed-comparison);
[1.5](#strict-vs-full-conjugacy); [3.2](#deformation-problem-ideal).

**Checks.**

- **varDet_rank_one.** for `n = 1` with all `D_v` unrestricted and `Λ_v = 𝒪`,
  `R_𝒮 = 𝒪⟦G_{F,S}^{ab,(p)}⟧`.
- **varDet_frame_count.** `n = 2`, `|T| = 3` gives `11 = 4·3 − 1` frame variables.
- **varDet_T_empty.** for `T = ∅` there are no frame variables, not `−1`.

<a id="variable-determinant-presentation"></a>

### 7.3 Presentation over the local rings

**Theorem.** For nonempty `T ⊆ S`, require `Λ_v = 𝒪` outside `T` and put `R^{T,loc}_𝒮 = ⊗̂_{v∈T} R_v`. Let
`L¹_v ⊆ Z¹(F_v, ad ρ̄)` be the tangent subspace and `L_v` its image in `H¹`. The full-adjoint framed complex
below identifies the relative tangent space, and there is a local `Λ`-algebra surjection
`R^{T,loc}_𝒮⟦X₁, …, X_g⟧ ↠ R^T_𝒮` with `g = h¹_{𝒮,T}(ad ρ̄)` given by the displayed formula, using
ArithmeticGaloisDuality D8; the orthogonal conditions apply at `S ∖ T`, and the scalar directions stay in
this variable-determinant complex (ACC arXiv v2, §6.2.22 and Proposition 6.2.24 with its proof,
pp. 143–146; ACC published, Proposition 6.2.25, printed p. 1041).

The global full-adjoint complex has degree zero `C⁰(G, ad)`, degree one `C¹(G, ad) ⊕ ⊕_T C⁰(G_v, ad)`,
degree two `C²(G, ad) ⊕ ⊕_T C¹(G_v, ad) ⊕ ⊕_{S∖T} C¹(G_v, ad)/L¹_v`, and the analogous mapping-fibre terms
in higher degrees, with the sign convention of 3.6. For the ordinary dual kernel impose `L_v^⊥` only
outside `T`. Then

```text
g = h¹_{𝒮^⊥,T}(ad ρ̄(1)) − h⁰(G, ad ρ̄(1)) − Σ_{v|∞} h⁰(G_v, ad ρ̄) + Σ_{v∈S∖T} (dim L_v − h⁰(G_v, ad ρ̄)).
```

The full-adjoint trace pairing identifies the dual with `ad(1)`; it uses no trace-zero hypothesis and no
`|T| − 1` correction borrowed from the fixed-determinant complex.

*Needs:* [7.2](#variable-determinant-representability); [3.6](#relative-tangent-space);
ArithmeticGaloisDuality R02.4 and D8.

**Checks.**

- **varDet_count_rank_one.** for `n = 1`, `ad = k` with trivial action; the count involves the scalar
  classes `H¹(G_{F,S}, k)` that the fixed-determinant complex removes.
- **varDet_no_T_minus_one.** the formula contains no `|T| − 1` term; inserting it would double-count the
  scalar directions, which here are genuine deformation directions.
- **varDet_full_adjoint_dual.** the dual module is `ad ρ̄(1)`, not `ad⁰ρ̄(1)`; at `p ∤ n` they differ by the
  summand `k(1)`, whose `H⁰` is nonzero exactly when `ζ_p ∈ F`.

<a id="fixed-versus-variable-determinant"></a>

### 7.4 Fixed against variable determinant

**Theorem.** When all `Λ_v = 𝒪`, intersect each `D_v` with determinant `χ` to obtain the fixed-determinant
problem `𝒮_χ`. The quotient `R_𝒮 ↠ R_{𝒮_χ}` defined by `det ρ_𝒮(g) − χ(g)`, and its `T`-framed version,
always exist. If `p ∤ n` and every `D_v` is stable under all residually trivial local character twists,
unique `n`-th roots split the functor as fixed determinant times the functor of residually trivial
characters, giving `R_𝒮 ≅ R_{𝒮_χ} ⊗̂_𝒪 𝒪⟦G_{F,S}^{ab,(p)}⟧`. This extension is formally smooth of relative
dimension `rank_{ℤ_p} G_{F,S}^{ab,(p)}` exactly when that finitely generated abelian pro-`p` group is
torsion-free. Fixed Hodge–Tate or inertial data can violate twist stability; for such problems the
quotient statement is kept and the product conclusion is not claimed (ACC arXiv v2, §§6.1–6.2 opening,
pp. 135–136).

*Needs:* [7.2](#variable-determinant-representability); [2.9](#fixed-determinant-rings);
[1.7](#fixed-determinant-functors); [3.3](#global-deformation-type).

*Lean:* `exists_unique_nthRoot_of_residue_eq_one` and the `example` `(1 + aε)³ = 1` in characteristic
`3`.

**Checks.**

- **fixedVar_rank_one.** for `n = 1`, all `Λ_v = 𝒪` and unrestricted local conditions,
  `R_{𝒮_χ} = 𝒪` and `R_𝒮 = 𝒪⟦G_{F,S}^{ab,(p)}⟧`. Restrictive local conditions can instead
  cut the fixed-character ring down to a quotient of `𝒪`.
- **fixedVar_p_divides_n.** in characteristic `3` with `ε² = 0`, `(1 + aε)³ = 1`, so `1 + ε` has no cube root
  of the form `1 + aε`; the splitting needs `p ∤ n`.
- **fixedVar_torsion.** take `F = ℚ`, `p = 3`, `S = {3, 7}`, rank one and unrestricted local
  conditions. The global abelian correspondence identifies the maximal abelian pro-`3` quotient
  with `ℤ₃ × ℤ/3`: the first factor is cyclotomic at `3`, and the second is the order-three
  quotient of `(ℤ/7)ˣ`. The ring is
  `𝒪⟦X, Y⟧/((1 + Y)³ − 1)`; its special fibre has the relation `Y³ = 0`, so it is not
  formally smooth. Local roots of unity or class-group torsion alone do not identify torsion
  in this global quotient, because global relations and nonsplit extensions must be accounted for.

### Examples

- Rank one with all `Λ_v = 𝒪` and unrestricted local conditions: the variable-determinant ring
  is the completed group algebra of the maximal abelian pro-`p` quotient, and the fixed-determinant
  ring is `𝒪`.

### Dependencies

Layers R04.1–R04.3; ArithmeticGaloisDuality R02.4 and D8; LocalGaloisDeformationRings 1.1 and 1.15.

## Layer G7: Polarized problems and arbitrary-rank Taylor–Wiles data

The polarized fixed-multiplier branch uses the pairing dictionary of `𝒢ₙ` and its trivial strict
centralizer. The ACC auxiliary-prime branch instead uses G8's variable-determinant problem and enormous
cyclotomic image. Each branch has its own tangent and generator formula.

<a id="polarized-deformation-problem"></a>

### 8.1 Polarized deformation problems

**Definition.** Use the group `𝒢ₙ = (GLₙ × GL₁) ⋊ {1, j}` of ArithmeticGaloisRepresentations §7.4
(`CHTGroup`), with `j(g, μ)j⁻¹ = (μ·ᵗg⁻¹, μ)` and multiplier `ν(j) = −1`. In the CM setting `F/F⁺` take `p`
odd, a finite set `S` of finite places of `F⁺` split in `F` and containing those above `p`, and a chosen
place `ṽ` of `F` over each `v ∈ S`. Fix `r̄ : G_{F⁺,S} → 𝒢ₙ(k)` with `r̄⁻¹(𝒢ₙ⁰(k)) = G_{F,S}` and a lift `χ`
of `ν ∘ r̄`. A polarized lift is a continuous lift `r` with `ν ∘ r = χ`. Quotient by strict `GLₙ`-conjugation,
and add `T`-frames by simultaneous left multiplication; a type adds `GLₙ` local problems at the places
`ṽ`. Polarizations are actual pairings: by the correspondence of §7.4, for `γ₀ ∉ G_F` the lifts correspond
to triples `(ρ, χ, ⟨ , ⟩)` with `⟨x, ρ(γ₀²)y⟩ = −χ(γ₀)⟨y, x⟩` and
`χ(δ)⟨x, y⟩ = ⟨ρ(δ)x, ρ(γ₀δγ₀⁻¹)y⟩`. Use the Schur condition of CHT; absolute irreducibility on `G_F`
suffices (CHT, §2.1, Lemma 2.1.1, p. 7; Definitions 2.2.1 and 2.2.7, pp. 17 and 21; §2.3, p. 26).

The API:

- `PolarizedDeformationProblem`: `(F/F⁺, S, S̃, 𝒪, r̄, χ, {D_v})`.

ArithmeticGaloisRepresentations §7.4 supplies `CHTGroup` and its triple correspondence;
the polarized deformation problem uses that group and that correspondence.

*Needs:* [3.1](#local-deformation-problem); [1.8](#change-of-coefficients);
ArithmeticGaloisRepresentations §7.4.

**Checks.**

- **polarized_rank_one.** for `n = 1` the polarized lifts are the conjugate-self-dual characters with the
  prescribed multiplier.
- **polarizedLift_triple_bijective.** the correspondence with triples is bijective (§7.4); a version
  forgetting the pairing would lose the sign condition.
- **polarized_not_schur.** take a reducible polarized residual representation whose two constituent lines
  are exchanged by the duality; its nontrivial diagonal infinitesimal centralizer violates the CHT Schur
  condition. Reducibility alone is not the test: some reducible polarized representations are Schur.

<a id="polarized-representability"></a>

### 8.2 Representability of polarized problems

**Theorem.** For Schur `r̄`, the `T`-framed polarized type-`𝒮` functor is represented by `R^{□T}_𝒮`.
Construct the local tensor map and identify its relative cotangent dual with
`H¹_{𝒮,T}(G_{F⁺,S}, ad r̄)`. A universal representative gives `R^{□T}_𝒮 ≅ R^univ_𝒮⟦X_{v,i,j}⟧` in `n²|T|`
variables: the fixed-multiplier polarized strict centralizer is trivial at odd `p`, so no scalar frame
variable is removed. The adjoint is `Mₙ(k)` with `(g, μ)` acting by conjugation and `j` by negative
transpose; the `GLₙ` scalar-centralizer count is not reused (CHT, Proposition 2.2.9 and its proof,
pp. 22–24).

*Needs:* [8.1](#polarized-deformation-problem); [2.3](#universal-lifting-ring);
[2.2](#phi-p-global); [3.2](#deformation-problem-ideal).

**Checks.**

- **polarized_frame_count.** `n = 2`, `|T| = 1` gives `4` frame variables, not `3`.
- **polarized_centralizer_trivial.** conjugating `j` by a scalar `(c, 1)` gives `(c², 1)j`, so a residually
  trivial scalar commuting with the image of an element outside `G_F` satisfies `c² = 1`, hence `c = 1`
  for odd `p`; the strict polarized centralizer is trivial.
- **polarized_adjoint_j.** `j` acts on `Mₙ(k)` by `X ↦ −ᵗX`; over `𝔽₂` this is transpose and the invariants
  `gl_n^{𝒢ₙ}` are nonzero, one reason `p` is odd (ArithmeticGaloisRepresentations §7.4).

<a id="polarized-tangent-obstruction"></a>

### 8.3 Tangent and obstruction spaces of polarized problems

**Theorem.** For Schur polarized data and a small extension with kernel `I`, choose lifts of the
local representations in their prescribed problems at every place in `S`, including the prescribed
framed local lifts at `T`. The obstruction to a compatible global lift then lies in
`H²_{𝒮,T}(G_{F⁺,S}, ad r̄) ⊗_k I`, and vanishes exactly when such a global lift exists. Without
chosen local lifts this obstruction is not asserted; liftability outside `T` supplies them for the
relation bound in 8.4. Prove the long exact sequence and the arithmetic comparisons: `Hⁱ_rel`
vanishes above degree `3`; `H⁰_rel` is the global `H⁰` when `T` is empty and zero otherwise;
`h³_rel = h⁰(ad r̄(1))`; `h²_rel` is the ordinary dual Selmer dimension. With `χ(c_v) = ±1`, the Euler
characteristic `Σ(−1)ⁱhⁱ_rel` is `Σ_{v|∞} n(n + χ(c_v))/2 + Σ_{v∈S∖T} (h⁰(G_{F_ṽ}, ad r̄) − dim L_v)`. The global
Euler formula uses the CM prime-to-`p` descent of ArithmeticGaloisDuality D7, including ramification
outside the split set `S`. If `p ∤ n`, the adjoint splits as its trace kernel and a scalar line on which
`j` acts by `−1`; if `p | n` this fails and the full adjoint is kept (CHT, Lemmas 2.2.8, 2.2.11, 2.1.3,
2.3.3 and 2.3.4, pp. 8–32).

*Needs:* [8.2](#polarized-representability); ArithmeticGaloisDuality R02.4, D7 and D8.

*Lean:* the `example` that `1` has trace `0` in `M₃(𝔽₃)`.

**Checks.**

- **polarized_euler_rank_one.** for `n = 1`, the archimedean contribution is `(1 + χ(c_v))/2`, which is `0`
  for a totally odd multiplier (`χ(c_v) = −1`) and `1` otherwise.
- **polarized_H0_framed.** for nonempty `T`, `H⁰_rel = 0`; for `T` empty it is `H⁰(G_{F⁺,S}, ad r̄)`, which is
  `0` for Schur `r̄` and odd `p`.
- **polarized_p_divides_n.** for `p = n = 3`, `tr(1) = 0` in `M₃(𝔽₃)`, so the scalars lie in the trace kernel
  and the splitting fails.
- **polarized_obstruction_needs_local_lifts.** the local problem represented by
  `𝒪⟦x⟧/(x²)` has the point `x ↦ t` over `k[t]/(t²)` and no lift to `k[t]/(t³)`.
  A global obstruction calculation conditional on local lifts cannot supply this missing lift.

<a id="polarized-presentation"></a>

### 8.4 Presentations of polarized deformation rings

**Theorem.** Present `R^{□T}_𝒮` over its local tensor ring in the nonnegative number

```text
g = h¹_{L^⊥,T}(ad r̄(1)) − h⁰(ad r̄(1)) + Σ_{v∈S∖T} (dim L_v − h⁰(G_{F_ṽ}, ad r̄)) − Σ_{v|∞} n(n + χ(c_v))/2
```

of variables. If the problems outside `T` are liftable, at most `h¹_{L^⊥,T}(ad r̄(1))` relations are
needed, and then

```text
dim R^{□T}_𝒮 ≥ 1 + Σ_{v∈T} (dim(R^loc_v/I_v) − 1) + Σ_{v∈S∖T} (dim L_v − h⁰(G_{F_ṽ}, ad r̄)) − h⁰(G_{F⁺,S}, ad r̄(1)) − Σ_{v|∞} n(n + χ(c_v))/2.
```

The local conditions must be nonempty problems for the chosen residual representation; the rank-`n`
`p`-adic problems come from LocalGaloisDeformationRings Layers 1, 3 and 6 and the problems away from `p`
from its Layer 2, with their actual tangent dimensions and liftability. A torsion-free quotient and a
reduced generic fibre have their own roles in component arguments and are not substituted for the
representing ring here (CHT, Corollaries 2.2.12, 2.2.13 and 2.3.5, pp. 25 and 32).

*Needs:* [8.3](#polarized-tangent-obstruction); [8.2](#polarized-representability);
DeformationAndDerivedPatchingAlgebra R03.2; LocalGaloisDeformationRings Layers 1, 2, 3 and 6.

**Checks.**

- **polarized_g_nonnegative.** `g` is computed in `ℤ` and shown nonnegative before it indexes variables.
- **polarized_liftability.** without liftability outside `T` only the generator count holds, not the
  relation bound (compare 3.7, **presentation_needs_liftability**).
- **polarized_dim_rank_one.** for `n = 1`, `T = S` and totally odd multiplier, the archimedean term vanishes
  and the bound reads `1 + Σ_{v∈T}(dim(R^loc_v/I_v) − 1) − h⁰(ad r̄(1))`.

<a id="taylor-wiles-local-diamond"></a>

### 8.5 Taylor–Wiles places in rank `n`

**Construction.** In the ACC rank-`n` setting take `v ∤ p` with `q_v ≡ 1 (mod p)`, `ρ̄` unramified at `v` and
an ordering of `n` distinct `k`-rational eigenvalues of `ρ̄(Frob_v)`. The local lifting ring of
LocalGaloisDeformationRings 2.16 classifies, after a change of basis, a direct sum of uniquely labelled
character deformations; reciprocity on their inertia characters gives `𝒪[k(v)ˣ(p)ⁿ] → R^□_v`, formally
smooth of relative dimension `n²`. For a set `Q` put `Δ_Q = ∏_{v∈Q} k(v)ˣ(p)ⁿ` and augment `𝒮` by unrestricted
local conditions at `Q`. The chosen orderings make `R^T_{𝒮_Q}` a `Λ[Δ_Q]`-algebra, and the specialization
`R^T_{𝒮_Q} ↠ R^T_𝒮` has kernel the augmentation ideal times `R^T_{𝒮_Q}`. This is the variable-determinant
action with `n` factors per place; the fixed-determinant rank-two action of 5.5 has its own constraint
(ACC arXiv v2, §6.2.18, Lemma 6.2.19, p. 143, and the Taylor–Wiles datum and `𝒮_Q`, p. 149).

*Needs:* [7.1](#variable-determinant-problem); [5.5](#taylor-wiles-inertia-action);
LocalGaloisDeformationRings 2.16 and 2.23.

**Checks.**

- **rankn_TW_n1.** for `n = 1` the inertia restriction of the universal character factors through
  `k(v)ˣ(p)`, the local ring is formally smooth of relative dimension `1` over `𝒪[k(v)ˣ(p)]` (the value at
  Frobenius), and `Δ_Q = ∏_{v∈Q} k(v)ˣ(p)`.
- **rankn_TW_factors.** each place contributes `n` cyclic factors, so `Δ_Q` has `n|Q|` factors; the rank-two
  fixed-determinant action of 5.5 has one factor per place, because there the two inertia characters are
  inverse.
- **rankn_TW_ordering.** changing the ordering of the eigenvalues permutes the factors of `k(v)ˣ(p)ⁿ`; the
  algebra structure depends on the ordering, which is part of the datum.

<a id="enormous-taylor-wiles-primes"></a>

### 8.6 Taylor–Wiles primes for enormous image

**Theorem.** Assume the ACC setting, `F` CM, `ζ_p ∉ F` and `ρ̄(G_{F(ζ_p)})` enormous
(`ResidualImage.IsEnormous`, ArithmeticGaloisRepresentations §7.10), with `k` containing all residual
eigenvalues. For `T ⊆ S`, any `q` at least the ordinary dual Selmer dimension and every `N ≥ 1`, there are
exactly `q` auxiliary primes of degree one with `q_v ≡ 1 (mod pᴺ)` and ordered distinct residual
eigenvalues, outside any given finite avoidance set, killing the augmented dual Selmer group. The
enormous-image and Kummer arguments give detecting elements and an admissible padding class; then apply
5.6, using D8 to identify its joint kernel with the augmented dual Selmer group. The full adjoint
splitting uses `p ∤ n`, and the scalar Kummer summand uses `ζ_p ∉ F`. Enormous means the exact condition
of §7.10 (no nontrivial `p`-power quotient, vanishing `H⁰` and `H¹` on `ad⁰`, and a regular semisimple
detector on each simple submodule), not adequacy (ACC arXiv v2, Definition 6.2.28, Lemmas 6.2.29 and
6.2.31 with its proof, pp. 148–151; ACC published, §6.2.28, Definition 6.2.29, Lemmas 6.2.30 and 6.2.32,
printed pp. 1044–1046, PDF pp. 148–150).

*Needs:* [8.5](#taylor-wiles-local-diamond); [7.3](#variable-determinant-presentation);
ArithmeticGaloisRepresentations §7.10; [5.6](#chebotarev-selmer-selection); ArithmeticGaloisDuality
D8.

**Checks.**

- **enormous_q_padding.** `q` may exceed the dual Selmer dimension; the padding class of 5.6 supplies the
  extra primes.
- **enormous_zeta_p.** if `ζ_p ∈ F`, the scalar summand `k(1) = k` of `ad ρ̄(1)` has `H⁰ ≠ 0`, the Kummer
  argument fails and the theorem is not claimed.
- **enormous_not_adequate.** adequacy alone does not give the regular semisimple trace-projection
  detectors required on each simple adjoint submodule; the hypothesis is the enormous one.

<a id="enormous-taylor-wiles-presentation"></a>

### 8.7 The Taylor–Wiles presentation of ACC

**Theorem.** Take the variable-determinant ACC problem with `T = S`. Assume `F = F⁺F₀` with `F⁺` totally
real and `F₀` imaginary quadratic, `ζ_p ∉ F`, `p ∤ 2n`, `ρ̄` continuous and absolutely irreducible with
enormous cyclotomic image, and a residue field containing all its eigenvalues. Given `N ≥ 1` and `q` at
least the ordinary dual Selmer dimension, there are a set `Q_N` of size `q` with `q_v ≡ 1 (mod pᴺ)`, lying
over rational primes split in `F₀`, and a local `Λ`-algebra surjection

```text
R^{T,loc}_𝒮⟦X₁, …, X_g⟧ ↠ R^T_{𝒮_{Q_N}},     g = qn − n²[F⁺ : ℚ].
```

Prove `g ≥ 0` in `ℤ` before indexing the variables. The diamond group has `qn` cyclic `p`-power factors,
each of order at least `pᴺ`, and its augmentation quotient is `R^T_𝒮`. The degree-one selection avoids
the primes ramified in `F₀`, which ensures the splitting assertion. This ring, action, quotient and count
are the input for patching arithmetic complexes; the polarized and fixed-determinant branches keep their
own formulas (ACC arXiv v2, Proposition 6.2.32 and its proof, p. 151; ACC published, Proposition 6.2.33
and its proof, printed p. 1047, PDF p. 151, with the diamond and augmentation data on printed p. 1045).

*Needs:* [8.6](#enormous-taylor-wiles-primes); [7.3](#variable-determinant-presentation);
[8.5](#taylor-wiles-local-diamond).

*Lean:* the `example` `−n²f + qn = qn − n²f` in `ℤ`.

**Checks.**

- **acc_count_integer.** `g = qn − n²[F⁺ : ℚ]` is an integer identity; for `q < n[F⁺ : ℚ]` it is negative, and
  the nonnegativity (from `q` at least the dual Selmer dimension and the Euler characteristic) is proved
  before use.
- **acc_diamond_factors.** the diamond group has `qn` factors (`n` per place, 8.5), not `q`.
- **acc_split_F0.** a prime ramified in `F₀` would not split, so the avoidance set contains the primes
  ramified in `F₀`.

### Examples

- For `n = 1` the polarized lifts are conjugate-self-dual characters and the variable-determinant ACC
  count is `g = q − [F⁺ : ℚ]`.

### Dependencies

Layers R04.1–R04.5 and G8; ArithmeticGaloisRepresentations §7.4 and §7.10; ArithmeticGaloisDuality
R02.4, D7 and D8; LocalGaloisDeformationRings Layers 1, 2, 3 and 6; DeformationAndDerivedPatchingAlgebra
R03.2.

## Downstream consumers

- **GL2ModularityLifting** receives from R04.6 the local base ring, the universal trace representation,
  the finite-level diamond algebras and augmentation maps, the uniform presentations and, at `p = 2`, the
  determinant-on-`S` rings and twisting chunks; it constructs the arithmetic modules and their patching.
  A dimension lower bound here asserts neither finiteness over `𝒪` nor an `R = T` theorem.
- **PotentialAutomorphyInfrastructure** uses G8's global rings, the universal framed restrictions and the
  presentation for the ACC branch, and the polarized branch of G7 only where the pairing, multiplier and
  signs are part of its data; with the matching local conditions of LocalGaloisDeformationRings it
  builds the comparison maps to Hecke algebras. It receives from 8.7 the sets `Q_N`, the ordered
  eigenvalues, the norm congruences, splitting in `F₀`, the `Λ[Δ_Q]`-action with `qn` sufficiently large
  cyclic factors, the augmentation quotient and the nonnegative count `qn − n²[F⁺ : ℚ]`. Auxiliary
  neatness primes serve a different purpose and are not added to the Taylor–Wiles set.
- **LocalGaloisDeformationRings** uses 1.1, 1.3, 1.7, 2.1–2.9, 3.1–3.3 and
  4.12 as the general framework for its local rings, and the pseudodeformation rings of 2.11 for its
  block pseudodeformation rings (its 3.8).
- **GL2ModularityLifting** also uses 2.11 for the determinant-fixed two-dimensional pseudodeformation
  functors at residually reducible points; the finer comparisons at reducible points are its own.
- **OrdinaryAutomorphicFormsAndModularityLifting**, **PotentialModularityAndCompatibleSystems**,
  **AutomorphicCongruences** and **CompletedCohomologyAndLocalGlobalCompatibility** use the
  representability, restriction and twisting maps of Layers R04.2–R04.4 and the presentations of
  R04.3, G8 and G7.

## References

Page numbers are printed pages of the cited edition unless marked as PDF pages.

- **Gee.** T. Gee, [*Modularity lifting theorems*](https://arxiv.org/pdf/2202.05818v2), Essential Number
  Theory 1 (2022), 73–126; cited from arXiv:2202.05818v2, whose printed and PDF pages agree.
- **Kisin.** M. Kisin, [*Lectures on deformations of Galois representations*, Lecture 1](https://people.math.harvard.edu/~kisin/notes/notes.pdf),
  lecture notes, author's page.
- **Chenevier.** G. Chenevier, [*The p-adic analytic space of pseudocharacters of a profinite group and
  pseudorepresentations over arbitrary rings*](https://arxiv.org/pdf/0809.0415v2), in *Automorphic Forms
  and Galois Representations*, vol. 1, LMS Lecture Note Series 414 (2014), 221–285; cited from
  arXiv:0809.0415v2.
- **KW ESI.** C. Khare and J.-P. Wintenberger, [*Serre's modularity conjecture (II)*](https://www.esi.ac.at/preprints/esi1892.pdf),
  ESI preprint 1892 (2007); the PDF page is the printed page plus one. Its Lemma 4.3, Proposition 4.4 and
  Lemma 4.5 are Lemma 4.4, Proposition 4.5 and Lemma 4.6 of the final version.
- **KW final.** C. Khare and J.-P. Wintenberger, [*Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf),
  author's final version (30 May 2009), published in Invent. Math. 178 (2009), 505–586; numbering of the
  final version, pages of the author PDF.
- **BLGGT.** T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, [*Potential automorphy and change of
  weight*](https://arxiv.org/pdf/1010.2561v4), Ann. of Math. (2) 179 (2014), 501–609; cited from
  arXiv:1010.2561v4.
- **ACC arXiv v2.** P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton,
  P. Scholze, R. Taylor and J. A. Thorne, [*Potential automorphy over CM fields*](https://arxiv.org/pdf/1812.09999v2),
  arXiv:1812.09999v2 (2022); printed and PDF pages agree.
- **ACC published.** The same authors, *Potential automorphy over CM fields*, Ann. of Math. 197 (2023),
  897–1113; printed page = PDF page + 896 in the [author-hosted published PDF](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
  Published Definition 6.2.29, Lemma 6.2.32, Proposition 6.2.25 and Proposition 6.2.33 are arXiv-v2
  Definition 6.2.28, Lemma 6.2.31, Proposition 6.2.24 and Proposition 6.2.32.
- **CHT.** L. Clozel, M. Harris and R. Taylor, [*Automorphy for some l-adic lifts of automorphic mod l
  Galois representations*](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), Publ. Math. IHÉS
  108 (2008), 1–181.
- **Calegari–Geraghty.** F. Calegari and D. Geraghty, [*Modularity lifting beyond the Taylor–Wiles
  method*](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Invent. Math. 211 (2018), 297–433;
  §§8.5–8.6 give a fixed-determinant comparison distinct from the enormous-image theorem of 8.7.
- **Taylor.** R. Taylor, [*On the meromorphic continuation of degree two L-functions*](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/taylor.pdf),
  Doc. Math., Extra Volume Coates (2006), 729–779; Lemma 2.5 on printed pp. 749–750. It is reference [59]
  of KW final, and its argument assumes `l > 3`.

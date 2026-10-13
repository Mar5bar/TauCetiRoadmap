# Roadmap: derived de Rham cohomology

**Summary.** This roadmap builds the cotangent complex `Algebra.CotangentComplex` of a ring map from
simplicial polynomial resolutions in Mathlib's `DerivedCategory`, its integral derived exterior,
symmetric and divided powers, derived ideal completion and complete flatness, and the ordinary
algebraic de Rham complex `DeRham.complex` on Mathlib's Kähler and exterior-power carriers. It then
constructs derived de Rham cohomology with its Hodge and conjugate filtrations, the derived Cartier
isomorphism, the comparison with crystalline cohomology for lci maps (Bhatt, Theorem 3.27), derived
de Rham–Witt theory and the structure of `A_crys` of quasiregular semiperfect rings (Bhatt–Morrow–
Scholze, Theorem 8.14), quasisyntomic descent, the derived description of Fontaine's period rings
`A_cris` and `B_dR⁺`, proper smooth control, and the logarithmic theory: Gabber's log cotangent
complex, log derived de Rham cohomology, the log crystalline comparison and Fontaine's map
`ε ↦ log [ε]` as a logarithmic Chern class.

Derived de Rham cohomology extends differential algebra to singular rings. Its cotangent and power
operations record relations that ordinary differential modules lose. In characteristic p the
conjugate filtration links these operations to Cartier theory; under precise flatness and
complete-intersection hypotheses the resulting complex recovers crystalline cohomology. Completion
and descent then make these constructions usable on p-adic formal schemes and in period
comparisons. The main sources are Bhatt's *p-adic derived de Rham cohomology* [Bhatt12],
Bhatt–Morrow–Scholze's *Topological Hochschild homology and integral p-adic Hodge theory* [BMS19],
the appendices of Bhatt–Lurie's *Absolute prismatic cohomology* [BL22], Koshikawa–Yao's
*Logarithmic prismatic cohomology II* [KY], the Stacks Project chapters on the cotangent complex and
derived completion, and Lurie's *Spectral Algebraic Geometry* §25.2 [SAG] for derived power
functors.

Every derived object of this roadmap has an explicit strict model: a simplicial polynomial
resolution, the alternating face complex of a simplicial module, the direct-sum or product
totalization of a bicomplex, a diagram of complexes indexed by `ℤᵒᵖ`, or an inverse limit of a tower
of complexes. Statements are made in Mathlib's `DerivedCategory` of the relevant abelian category,
and multiplicative structure is the strict commutative differential graded algebra structure of the
model. The [suggested Lean file](Suggested.lean) records the ordinary differential-symbol
presentation, derived completeness, module-level complete flatness, p-bases and the other statements
that can be written against the pinned Mathlib and Tau Ceti; every construction is specified here.

## Scope and ownership

This roadmap owns: the ordinary cotangent complex of a ring map and of a map of simplicial
commutative rings, with its square-zero deformation theory; André–Quillen homology and the local
complete-intersection and regularity criteria in terms of it; derived exterior, symmetric and divided
powers of connective complexes of modules; derived ideal completion of complexes and of simplicial
commutative algebras, complete flatness, complete faithfully flat descent and the effectivity of
compatible systems of perfect complexes; the filtered derived category, its completion, completed
filtered tensor product and Beilinson t-structure; the ordinary algebraic de Rham complex with its
differential-symbol presentation, pullback and universal property; derived de Rham cohomology with
its Hodge and conjugate filtrations, its Hodge and p-adic completions and its sheafified versions on
schemes and p-adic formal schemes; derived Cartier theory; the derived de Rham to crystalline
comparison and its lci, p-adic, quasiregular semiperfect and period-ring applications; derived
de Rham–Witt theory; the quasisyntomic sites and quasisyntomic descent; Gabber's logarithmic
cotangent complex and logarithmic derived de Rham cohomology with their crystalline and period
applications.

It uses, without restating:

- **CrystallineCohomology** for divided powers and their envelopes (Layer CR.0), crystalline sites
  and the PD Poincaré lemma (Layers CR.1–CR.2), the classical de Rham–Witt complex, its Nygaard
  filtration and the classical crystalline comparison (Layer CR.4), log structures (Layer
  CR.5:log-algebra), and log differentials, exactification, log PD envelopes and the log Poincaré
  lemma (Layer CR.5). The crystalline period ring `A_cris(R)` of a p-adically complete ring is its
  §CR.0.7. That roadmap imports Layers 1–4 of this one for the lci and smooth comparisons, so the
  dependency between the two runs layer by layer in both directions without a cycle at the level of
  subsections: CrystallineCohomology §CR.0 uses Layer 1 here, and Layers 4–6 here use §CR.0–§CR.5.
- **PerfectoidSpaces** for integral perfectoid rings `IsIntegralPerfectoid` (§P1.24) and their
  comparison with perfectoid Tate rings (§P1.25), Fontaine's `θ` and its principal primitive kernel
  (§P1.17–§P1.18), and perfectoid fields (§P1.10–§P1.11).
- **SchemeAndStackFoundations** for the derived categories of quasi-coherent complexes on schemes
  (§2.18), Néron–Popescu desingularization (§0.15) and the formal spectrum of an adic ring with its
  adic thickening systems (§4.7).
- **IntegralHeckeAndGaloisDeterminants** for the Koszul complex of a finite sequence with its tensor
  formula and regular-sequence resolution (§6.4) and for the homogeneous pieces `Γ^d` of Mathlib's
  divided power algebra with their base change (§0.4).
- **JacobianChallenge** Layer C for proper flat finitely presented pushforward with cohomology and
  base change.
- Mathlib and Tau Ceti for the carriers listed under *Exact supplier contracts*.

Boundaries with neighbouring roadmaps:

- SchemeAndStackFoundations §4.6 states the deformation theory of algebras through the two-term
  naive cotangent complex and assigns the full cotangent complex `Algebra.CotangentComplex` and its
  square-zero obstruction class to this roadmap; Layer 0 here supplies them.
- PerfectoidSpaces §P0.19 consumes the cotangent complex of Layer 0 under the API names listed in
  0.1–0.11 and 0.25 below, and owns only the almost cotangent complex. PerfectoidSpaces
  §P4.15.1 develops derived completion, complete flatness and complete faithfully flat descent for
  commutative rings inside its semiperfectoid construction; those statements are the specializations
  of 1.1–1.8 here to discrete modules and algebras, and a single implementation serves both.
- DifferentialGeometry, Layers 0–6, constructs differential forms on smooth real manifolds; Layer 2
  here constructs algebraic Kähler forms over arbitrary commutative rings. AlgebraicVectorBundles,
  Layer 0, supplies ordinary sheaf tensor, dual and exterior operations; the derived cotangent powers
  here retain negative cohomology and integral divided-power behaviour.
- The Rees algebra of an ideal, `TauCeti.RingTheory.ReesAlgebra.Grading`, is a graded algebra
  attached to an ideal; the Rees description of 1.14 is an equivalence of filtered and graded
  derived categories for arbitrary filtrations, with derived quotient by `t`.
- Prismatic cohomology, `A_inf`-cohomology, Breuil–Kisin modules, the rational period rings beyond
  `B_dR⁺` and `B_dR`, and comparison theorems with étale cohomology are outside this roadmap; they
  are built on it.

## Conventions

Rings are commutative and unital. Unless stated otherwise `A → B` is a map of ordinary rings; a map
of simplicial commutative rings is a map in `SimplicialObject CommRingCat`. In ordinary differential
algebra, `A → B` is a specified algebra structure, `Ω¹` means `KaehlerDifferential A B`, and `Ωⁿ`
means `exteriorPower B n (KaehlerDifferential A B)` (Mathlib's `ExteriorAlgebra.exteriorPower`). Wedge products use the existing exterior-algebra
grading. The differential is **A-linear**. The modules of forms are `B`-modules, but the de Rham
complex is a complex of `A`-modules: its differential generally fails `B`-linearity. Base-change
tensors of that complex use the base ring.

Complexes use cohomological degrees. A simplicial degree `n` contributes cohomological degree `−n`
through the alternating face complex; a connective complex has nonpositive cohomology. For a module
`N` in degree zero, `N[1]` lies in degree `−1`. Derived exterior powers are unshifted power functors.
The de Rham weight shift is written separately: `gr_H^i dR` and `gr_i^conj dR` involve `L∧^i L[−i]`.
Thus the shifted conormal of a regular quotient produces divided powers in degree zero after the
shifts cancel.

`D(A)` is Mathlib's `DerivedCategory (ModuleCat A)` with its standard `HasDerivedCategory`
instance. `M ⊗^L_A N` is the derived tensor product of 0.2, computed by the termwise tensor product
of a bounded-above complex of flat modules with any representative. Every cotangent and de Rham model
of this roadmap is a bounded-above complex of free modules, so the derived tensors that occur are
computed termwise on these models. General algebra pushouts are derived and are modelled by
simplicial polynomial resolutions: `B ⊗^L_A C` is the simplicial commutative ring `P• ⊗_A C` for a
simplicial polynomial resolution `P• → B`. An ordinary tensor computes it only under Tor
independence. The naive two-term cotangent complex is a truncation and cannot detect all negative
cohomology of a non-lci quotient.

`dR` denotes the **direct-sum** totalization of the bicomplex of de Rham complexes of a polynomial
resolution. The decreasing Hodge filtration is `F_H^i`, with `gr_H^i = cofib(F_H^(i+1) → F_H^i)`.
Hodge completion is the inverse limit of the Hodge quotients and corresponds to product
totalization. Derived p-completion `Λ_p` is a different reflection, computed by a derived quotient
tower in its bounded-torsion range. Both completions are specified whenever both occur. Rational
uncompleted `dR` is the base ring; rational smooth ordinary de Rham cohomology is recovered by Hodge
completion. Nilpotent-p smooth comparison has its own hypotheses.

Filtered objects are diagrams `F^(i+1) → F^i` of complexes indexed by `ℤᵒᵖ`; the filtered derived
category is `DF(A) = DerivedCategory (ℤᵒᵖ ⥤ ModuleCat A)` (Bhatt, Remark 2.4, p.5, for the
increasing case). The conjugate filtration is increasing, starts with `Fil_−1 = 0`, and has
`gr_i = cofib(Fil_(i−1) → Fil_i)`. Its affine uncompleted exhaustiveness does not give unconditional
convergence after a global totalization or completion. Every spectral-sequence or
colimit/totalization exchange below retains its connectivity, finite-contribution or derived-limit
condition. Complete filtered objects use completed Day convolution, not tensor products of
equal-index levels.

Complete flatness is a derived-reduction condition; completeness of the object is a separate
assumption. Flatness, faithful flatness, projectivity, finite projectivity, perfectness and almost
perfectness are used in their respective ranges. Tor amplitude alone supplies no finiteness. A
proper smooth perfect-complex result supplies no finite-projectivity statement for its individual
cohomology modules.

A sheaf condition on a category of rings is a Čech condition on strict models: a functor `F` from
rings to complexes (or to filtered complexes) satisfies descent for a cover `A → S` when
`F(A) → Tot(F(S•))` is a quasi-isomorphism, where `S•` is the (completed) Čech nerve and `Tot` is the
product totalization of the cosimplicial complex. Unfolding from a basis is defined by the same
totalization.

Log cotangent means **Gabber's** complex. The ordinary-log-differential and Olsson comparisons keep
the integral and log-smooth hypotheses. Homological log flatness is the homotopy-pushout criterion
and differs from Kato log flatness. General prelog QSyn and QRSP objects need not have integral
monoids; integrality and Cartier type enter explicitly in the smooth and crystalline applications.
Logification of cotangent complexes and invariance of uncompleted log de Rham cohomology have
different ranges.

Lean names below are the intended Tau Ceti declarations. `DeRham.*` names live in the ordinary
de Rham namespace, `DerivedDeRham.*` names in the derived namespace, and the cotangent complex is
`Algebra.CotangentComplex`, the name under which SchemeAndStackFoundations §4.6 and PerfectoidSpaces
§P0.19 cite it.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3`)

- Homological algebra: `DerivedCategory`, `DerivedCategory.Q`, `DerivedCategory.singleFunctor`,
  `DerivedCategory.homologyFunctor`, `HasDerivedCategory.standard`, `CochainComplex.of`,
  `HomologicalComplex`, the triangulated structure and t-structure of `DerivedCategory`,
  `CategoryTheory.Abelian.Ext`, and `CategoryTheory.Tor` for module categories. These are the
  carriers of every derived statement; nothing is assumed about derived tensors or limits beyond
  what 0.2 and 1.0 construct.
- Simplicial algebra: `SimplicialObject`, `SimplicialObject.Augmented`,
  `SimplicialObject.Augmented.ExtraDegeneracy`, `AlgebraicTopology.alternatingFaceMapComplex` and the
  Dold–Kan correspondence `AlgebraicTopology.DoldKan`.
- Differentials and cotangent truncations: `KaehlerDifferential`, `KaehlerDifferential.D`,
  `KaehlerDifferential.kerTotal`, `KaehlerDifferential.quotKerTotalEquiv`,
  `KaehlerDifferential.span_range_derivation`, `KaehlerDifferential.polynomialEquiv_D`,
  `KaehlerDifferential.mvPolynomialBasis`, `KaehlerDifferential.map`, `Derivation.leibniz`,
  `Derivation.leibniz_pow`, `Derivation.map_algebraMap`, `Derivation.map_one_eq_zero`,
  `derivationToSquareZeroEquivLift`, `Algebra.Extension.cotangentComplex`,
  `Algebra.Extension.toKaehler`, `Algebra.Extension.exact_cotangentComplex_toKaehler`,
  `Algebra.H1Cotangent`, `Algebra.Generators.equivH1Cotangent`.
- Exterior algebra: `ExteriorAlgebra`, `ExteriorAlgebra.exteriorPower` (notation `⋀[B]^n`), `exteriorPower.ιMulti`,
  `exteriorPower.ιMulti_span_of_span`, `exteriorPower.zeroEquiv`, `exteriorPower.oneEquiv`,
  `exteriorPower.presentation`, `exteriorPower.alternatingMapLinearEquiv`,
  `ExteriorAlgebra.gradedAlgebra`, `AlternatingMap.map_eq_zero_of_eq`, `AlternatingMap.map_swap`,
  `Finsupp.linearCombination`, `Submodule.liftQ`, `Module.Presentation.restrictScalars`.
- Commutative algebra: `IsAdicComplete`, `AdicCompletion`, `RingTheory.Sequence.IsRegular`,
  `RingTheory.Sequence.IsWeaklyRegular`, `Ideal.ofList`, `Module.Flat`, `Module.FaithfullyFlat`,
  `Algebra.Smooth`, `Localization.Away`, `LaurentPolynomial`, `MvPolynomial`, `Polynomial`.
- p-adic and perfectoid carriers: `PadicInt`, `Padic`, `ZMod`, `frobenius`, `WittVector`,
  `WittVector.teichmuller`, `PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta`,
  `WittVector.fontaineTheta_teichmuller`, `surjective_fontaineTheta`, `fontaineThetaInvertP`,
  `BDeRhamPlus` (the `ker θ[1/p]`-adic completion of `𝕎(R♭)[1/p]`) and `BDeRham`; `A_inf(R)` means
  `WittVector p (PreTilt R p)`.
- Divided powers: `DividedPowers`, `DividedPowerAlgebra`, `DividedPowerAlgebra.dp`.
- Geometry: `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Smooth`,
  `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.Scheme.smallEtaleTopology`.
- Galois actions: `AlgEquiv` acting on rings of integers, and `Field.absoluteGaloisGroup`.

For the ordinary de Rham differential, consult [StacksDR], §10.132, pp.334–336, and [StacksExterior],
Lemma 10.13.4, p.28. [Riou] is an independent direct-presentation design for the same complex in an
unmerged Mathlib pull request; follow its mathematical shape and adopt its API if Mathlib
incorporates it.

### From Tau Ceti (pinned at `a91d3aa`)

- `KaehlerDifferential.mapSemilinear` and `KaehlerDifferential.mapSemilinear_D`
  (`TauCeti.RingTheory.Kaehler.MapSemilinear`): the weight-one semilinear pullback of Kähler
  differentials, extended to all exterior degrees in 2.13.
- `TauCeti.ArtinRees.exists_controlled_lift` (`TauCeti.RingTheory.Ideal.ArtinRees`): the ordinary
  Artin–Rees control used in the Noetherian completion comparison of 1.4.
- `reesAlgebra.grade`, `reesAlgebra.gradedAlgebra`, `reesAlgebra.gradeZeroEquiv`
  (`TauCeti.RingTheory.ReesAlgebra.Grading`): the ideal Rees algebra, distinguished from 1.14.

### From TauCetiRoadmap roadmaps

| Supplier | Interface used here |
|---|---|
| [CrystallineCohomology](../CrystallineCohomology/README.md) §CR.0.3–§CR.0.5 | The divided power algebra `Γ_A(M)` with its augmentation ideal, the divided power filtration, the canonical divided powers on `(p)` including `p = 2`, compatibility with a base. |
| CrystallineCohomology §CR.0.6 | Divided power envelopes relative to a PD base with their filtered universal maps, envelopes of regular immersions, flat base change, and completed envelopes; in particular the explicit regular envelopes, tensor discreteness, flatness and reduction of [Bhatt12], Lemmas 3.37–3.38, pp.16–17. |
| CrystallineCohomology §CR.0.7 | `A_cris(R)` for a p-adically complete ring `R` in which `p` is not a unit, with `θ_cris` and `Crystalline.fontaineEnvelope_initial`, `Crystalline.fontaineEnvelope_theta`, `Crystalline.fontaineEnvelope_identify`, `Crystalline.fontaineEnvelope_map`. |
| CrystallineCohomology §CR.1.1, §CR.2.1–§CR.2.2 | Crystalline sites with nilpotent PD thickenings, crystalline cohomology and linearization, the PD Poincaré lemma and computation by embeddings. |
| CrystallineCohomology §CR.4.6–§CR.4.7 | The classical de Rham–Witt complex `WΩ` of a smooth `F_p`-algebra, its comparison with crystalline cohomology, divided Frobenius and the Nygaard filtration, including [BMS19], Lemmas 8.2–8.3, pp.266–267. |
| CrystallineCohomology §CR.5:log-algebra.1–§CR.5:log-algebra.6 | Prelog and log rings, charts, morphisms of log schemes, log smoothness, integral, fine, saturated, strict and exact conditions, valuation log structures and semistable formal charts. |
| CrystallineCohomology §CR.5.1–§CR.5.5 | Log differentials and Cartier type with the log Cartier isomorphism, exactification and log PD envelopes, the log crystalline site, the log Poincaré lemma, and the log structure on `A_cris`. |
| [PerfectoidSpaces](../PerfectoidSpaces/README.md) §P1.10–§P1.11 | Perfectoid fields; a complete algebraically closed nonarchimedean field of residue characteristic `p` is one. |
| PerfectoidSpaces §P1.17–§P1.18 | Fontaine's `θ : W(S♭⁺) → S⁺` for a perfectoid Tate pair, its surjectivity, and its kernel generated by a primitive nonzerodivisor `ξ`; for `ℂ_p`, `ker θ = (p − [p♭])`. |
| PerfectoidSpaces §P1.24–§P1.25 | `IsIntegralPerfectoid` (BMS Definition 3.5) with the Frobenius criterion of [BMS] Lemma 3.10 and the examples `ℤ_p^cycl`, `𝒪_{ℂ_p}` and the p-adic completion of `ℤ_p^cycl[T^{1/p^∞}]`. |
| [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.15 | Néron–Popescu desingularization: a regular map of Noetherian rings is a filtered colimit of smooth algebras ([Stacks] Tag 07GB). |
| SchemeAndStackFoundations §2.18 | `Coherent.DQCoh`, `Coherent.DQCoh.affineEquiv`, `derivedTensor`, `totalDirectImage`, `torIndependent_baseChange` on the derived category of quasi-coherent complexes of a scheme. |
| SchemeAndStackFoundations §4.7 | `Formal.AdicRing`, `Formal.AdicThickeningSystem` and `Spf A` as the system `Spec(A/I^(n+1))`, with morphisms of adic rings. |
| [IntegralHeckeAndGaloisDeterminants](../IntegralHeckeAndGaloisDeterminants/README.md) §6.4 | The Koszul complex `K(x)` of a finite sequence (exterior-algebra terms, `d₁(v) = Σ x_i v_i`, `H₀ = A/(x)`), its tensor formula `K(x,y) ≅ K(x) ⊗ K(y)`, functoriality, and the regular-sequence resolution. Here it is reindexed from homological degree `n` to cohomological degree `−n`: for the empty sequence it is `A`, for `(p)` over `ℤ` it resolves `F_p`, and for `(0)` it has `A` in degrees `−1` and `0`. |
| IntegralHeckeAndGaloisDeterminants §0.4 | The homogeneous piece `Γ^d_A(M)` of Mathlib's `DividedPowerAlgebra`, its functoriality and arbitrary base change, and `Γ^d ≅ TSym^d` for free modules. |
| [JacobianChallenge](../JacobianChallenge/README.md) Layer C | Proper flat finitely presented pushforward of coherent sheaves with flat base change and cohomology and base change. 5.19 uses it in the derived form of [StacksPerfect] Lemma 36.30.4 (Tag 0B91)(2): for `f : X → S` proper of finite presentation and `G` of finite presentation and flat over `S`, `Rf_*G` is perfect and commutes with arbitrary base change. |

## How to read the build

The layers follow the construction order. Layer 0 builds simplicial resolutions, the derived tensor
product, the cotangent complex and its square-zero theory, integral derived powers and the local
algebra criteria. Layer 1 builds derived limits, derived completion and complete flatness, the
filtered derived category with its completion, tensor and Beilinson t-structure, the effectivity of
perfect systems, and then states the quasisyntomic condition. Layer 2 constructs ordinary
differential algebra, polynomial realization of derived de Rham cohomology and its two completions.
Layer 3 supplies Cartier theory and its Frobenius-lift calculations, then the non-lci and rational
completion boundaries and smooth comparisons. Layer 4 constructs the crystalline comparison map,
classical-input Witt animation and PD filtrations. Layer 5 builds the quasisyntomic sites and
elementary covers before descent, scheme realization, the lci and period comparisons, quasiregular
semiperfect crystalline applications and proper smooth control. Layer 6 develops the logarithmic
counterpart from prelog resolutions, ending with the period `d log` map.

Within a layer, each subsection names its target, states it with its hypotheses and source, lists
its API as named laws, and gives discriminating **Checks**. *Needs* lists the earlier subsections
and suppliers a target uses; references to earlier subsections of this roadmap are by layer and
title. A source paragraph placed under a group heading applies to every subsection of that group.

## Layer 0: Cotangent complexes and integral derived powers

Construct simplicial polynomial resolutions and the derived tensor product, then the full cotangent
complex with its square-zero universal property, the integral power operations and the local
algebra criteria.

*Resolutions and derived tensor products.*

### 0.1 Simplicial polynomial resolutions

For a ring map `A → B`, a *polynomial resolution* `Algebra.CotangentComplex.PolynomialResolution A B`
is an augmented simplicial commutative `A`-algebra `ε : P• → B` with every `P_n` a polynomial
`A`-algebra on a specified set of variables, such that `ε` is a trivial Kan fibration of simplicial
sets; equivalently `ε` is a quasi-isomorphism on alternating face complexes, or a homotopy equivalence
of simplicial sets ([StacksCt] Remark 5.5, Tag 08QI, p.9). The *standard resolution*
`Algebra.CotangentComplex.standardResolution A B` is the comonad resolution of the free-polynomial /
forgetful adjunction, `P_0 = A[B]`, `P_(n+1) = A[P_n]` ([StacksCt] Definition 3.1, Tag 08PM, p.3);
it is a polynomial resolution, carries an extra degeneracy after forgetting to sets, and is functorial
in commutative squares `(A → B) → (A′ → B′)`. For any functor `F` from polynomial `A`-algebras over
`B` to complexes of abelian groups (or of `A`-modules), the complexes `F(P•)` and `F(Q•)` of two
polynomial resolutions are canonically quasi-isomorphic after totalization: this is the value
`Lπ_!F` of [StacksCt] Lemmas 4.1–4.3 and 5.6–5.7 (Tags 08PS–08PU, 08QJ, 08QK, pp.4–10), computed by
any resolution (Remark 5.5). Simplicial homotopies are preserved by every functor ([StacksSimp]
Remark 14.26.4, Tag 019M, p.45). This is the strict substitute for left Kan extension from
polynomial algebras.

*Needs:* Mathlib `SimplicialObject.Augmented`, `SimplicialObject.Augmented.ExtraDegeneracy`,
`AlgebraicTopology.alternatingFaceMapComplex`, `MvPolynomial`.

Prove the following named laws.

- `Algebra.CotangentComplex.standardResolution`: the comonad resolution is a polynomial resolution,
  functorial in commutative squares of ring maps, with identity and composition laws.
- `Algebra.CotangentComplex.PolynomialResolution.comparison`: any two polynomial resolutions of `B`
  over `A` are homotopy equivalent over `B`, the homotopy equivalence is unique up to homotopy, and
  for every functor `F` as above the induced map of totalizations is a quasi-isomorphism.
- `Algebra.CotangentComplex.PolynomialResolution.toQuasiIso`: the augmentation `P• → B` is a
  quasi-isomorphism of alternating face complexes of `A`-modules.

**Checks.**

- `test_resolution_identity`: for `A → A`, the constant simplicial algebra `A` is a polynomial
  resolution (on the empty set of variables) and every comparison with the standard resolution is a
  homotopy equivalence.
- `test_resolution_polynomial`: for `B = A[t]`, the constant resolution `A[t]` and the standard
  resolution are homotopy equivalent; a functor applied to both gives quasi-isomorphic complexes.
- `test_resolution_not_surjective`: a degreewise polynomial simplicial algebra whose augmentation is
  not surjective in degree zero (for instance `A → A[t]` constant, augmented to `A[t]/(t) = A` through
  the inclusion of `A` only) is not a resolution; the alternating face complex fails to compute `B`.

### 0.2 Derived tensor products on module derived categories

For a ring `R`, every complex of `R`-modules admits a K-flat resolution, a bounded-above complex of
flat modules is K-flat, and the termwise tensor product with a K-flat complex sends
quasi-isomorphisms to quasi-isomorphisms ([StacksMA] Definition 15.60.1, Lemmas 15.60.7, 15.60.10,
15.60.12; Tags 06XZ, 064K, 06Y4, 064L, pp.144–147). Define `DerivedDeRham.derivedTensor R :
D(R) ⥤ D(R) ⥤ D(R)` as the derived tensor product of [StacksMA] Definition 15.60.13 (Tag 064M),
computed by `Tot(K• ⊗_R L•)` with `K•` K-flat; and derived extension of scalars along `R → R′` as
`− ⊗^L_R R′`. For `X = Spec R` this is identified with SchemeAndStackFoundations §2.18 `derivedTensor`
under `Coherent.DQCoh.affineEquiv`.

*Needs:* Mathlib `DerivedCategory`, `HomologicalComplex`; SchemeAndStackFoundations §2.18
`derivedTensor`, `Coherent.DQCoh.affineEquiv`.

Prove the following named laws.

- `derivedTensor_flatModel`: for a bounded-above complex `P•` of flat modules,
  `P• ⊗^L L ≅ Tot(P• ⊗ L•)` naturally.
- `derivedTensor_triangulated`: the bifunctor is exact in each variable, symmetric
  monoidal with unit `R[0]`.
- `derivedTensor_affine`: agreement with `derivedTensor` on `Spec R`.

**Checks.**

- `test_derived_tensor_unit`: `R[0] ⊗^L M ≅ M`.
- `test_derived_tensor_tor`: `F_p ⊗^L_ℤ F_p` has `H^0 = F_p` and `H^−1 = F_p`, computed from the flat
  model `[ℤ →p ℤ]`; the underived tensor product loses `H^−1`.
- `test_derived_tensor_flat_discrete`: for a flat module `M` and any module `N`, `M ⊗^L N` is
  concentrated in degree zero.

### 0.3 Derived functors of non-additive functors

Let `R → R′` be a ring map and `F` a functor from finite projective (or projective) `R`-modules to
`R′`-modules, not necessarily additive. For a connective complex `M ∈ D^(≤0)(R)` choose a projective
resolution, pass through the Dold–Kan correspondence to a simplicial projective module `X•`, and
define `LF(M) = N(F(X•))`, the alternating face complex of the levelwise application. Two projective
simplicial resolutions are homotopy equivalent and `F` preserves simplicial homotopies, so `LF` is a
well-defined functor `D^(≤0)(R) → D^(≤0)(R′)` ([DoldPuppe] §4, 4.1–4.6, pp.227–229, with 1.15 for
homotopies and §3 for the Dold–Kan correspondence; [StacksSimp] Remark 14.26.4). If `F` is additive,
`LF` is the classical left derived functor ([DoldPuppe] 4.7, p.229). If `F` commutes with filtered
colimits of projective modules, so does `LF`. In the ∞-categorical language of [SAG] Proposition
25.2.1.2 and Corollary 25.2.1.3, pp.1698–1699, `LF` is the sifted-colimit extension of `F` from finite
free modules; the strict model above is the one used in this roadmap.

*Needs:* Layer 0: Simplicial polynomial resolutions; Mathlib `AlgebraicTopology.DoldKan`,
`AlgebraicTopology.alternatingFaceMapComplex`, `DerivedCategory`.

Prove the following named laws.

- `leftDerivedNonadditive`: the construction is functorial in `M` and in natural
  transformations of `F`, and independent of the resolution up to unique isomorphism in `D(R′)`.
- `leftDerivedNonadditive_additive`: agreement with the classical derived functor for
  additive `F`.
- `leftDerivedNonadditive_projective`: for a projective module `M` in degree zero,
  `LF(M) ≅ F(M)[0]`.

**Checks.**

- `test_nonadditive_identity`: for `F = id`, `LF(M) ≅ M`.
- `test_nonadditive_square`: for `F(X) = X ⊗_R X` and `R = ℤ`, `M = ℤ/2`, `LF(M)` has nonzero
  `H^−1`, so it is not the underived value `(ℤ/2) ⊗ (ℤ/2)` in degree zero.
- `test_nonadditive_constant`: for the constant functor `F(X) = R′`, `LF(M) ≅ R′[0]` for every
  connective `M`, including `M = 0`; a construction through chain complexes rather than simplicial
  modules would not apply to this non-additive functor.

*The full cotangent complex.*

### 0.4 The full cotangent complex

For a ring map `A → B`, define the connective `B`-module complex `L_(B/A) =
Algebra.CotangentComplex A B ∈ D(B)` as the alternating face complex of `Ω¹_(P•/A) ⊗_(P•) B` for the
standard resolution `P• → B`, with simplicial degree `n` placed in cohomological degree `−n`
([StacksCt] Definition 3.2, Tag 08PN, p.3). Any polynomial resolution computes it, naturally and
coherently in comparison maps ([StacksCt] Lemmas 4.3–4.7 and Remark 5.5; Tags 08PU, 08QE–08QH, 08QI,
pp.5–9). Commutative squares `(A → B) → (A′ → B′)` induce `L_(B/A) ⊗^L_B B′ → L_(B′/A′)`. The full
object retains all negative cohomology. The intended Lean signature is

```lean
Algebra.CotangentComplex (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    DerivedCategory (ModuleCat.{u} B)
```

with model-level data `Algebra.CotangentComplex.differentials` (the simplicial `B`-module
`B ⊗_(P_n) Ω_(P_n/A)` with its identification `termIso` and face maps `face_tmul`),
`Algebra.CotangentComplex.complex` (its alternating face complex) and
`Algebra.CotangentComplex.model` (the complex placed in nonpositive degrees before `DerivedCategory.Q`).
([BL22], Appendix B, Construction B.1 and Remark B.2, pp.225–226, treat the same object.)

*Needs:* Layer 0: Simplicial polynomial resolutions; Layer 0: Derived tensor products on module
derived categories; Mathlib `KaehlerDifferential.D`, `DerivedCategory`, `DerivedCategory.Q`,
`DerivedCategory.singleFunctor`, `DerivedCategory.homologyFunctor`.

Prove the following named laws.

- `Algebra.CotangentComplex.map`: every commutative square `(A → B) → (A′ → B′)` gives
  `L_(B/A) ⊗^L_B B′ → L_(B′/A′)`, with identity and composition laws; on the model it sends
  `t ⊗ dx` to `b(t) ⊗ d(a(x))`. Together these form `Algebra.CotangentComplex.arrowFunctor` on the
  arrow category of commutative rings, retaining every cohomological degree.
- `Algebra.CotangentComplex.resolutionIso`: every polynomial resolution gives the differential model,
  naturally and coherently in comparison maps.
- `Algebra.CotangentComplex.homologyZeroIso`: `H⁰L_(B/A) ≃ KaehlerDifferential A B`, preserving the
  universal derivation ([StacksCt] Lemma 4.5, Tag 08QF, p.6).

**Checks.**

- `test_cotangent_identity`: `L_(A/A) = 0`.
- `test_cotangent_polynomial`: `L_(A[t]/A) ≃ A[t]·dt` in degree 0.
- `test_cotangent_dual_numbers`: for `k` a field of characteristic different from 2 and
  `B = k[ε]/ε²`, `L_(B/k)` is `[B → B·dε]` in degrees `−1, 0` with map multiplication by `2ε`;
  `H^−1` is nonzero.
- `test_cotangent_dual_numbers_two`: in characteristic 2 the same regular presentation has zero
  differential: both `H^−1` and `H⁰` are `B`. This pins the derivative `2ε` and prevents an
  invertibility-of-2 assumption from entering the integral construction.
- `test_cotangent_shift`: homological degrees `0, 1, 2` of the simplicial model are placed in
  cohomological degrees `0, −1, −2`; for `ℤ → ℤ/2`, `H⁰ = 0` but `H^−1 ≅ ℤ/2`, which excludes a
  construction that keeps only Kähler differentials.

### 0.5 Square-zero extensions and their classes

For `A → B` and a `B`-module `M`, define `Algebra.CotangentComplex.SquareZeroExtension A B M`: an
`A`-algebra surjection `B′ → B` with a specified injective additive identification of `M` with its
kernel, whose products vanish and whose `B`-action on the kernel is the given one. The trivial
extension `B ⊕ M` has multiplication `(b,m)(b′,m′) = (bb′, bm′ + b′m)` and is split. Define
`extensionSetoid` (isomorphism of `A`-algebras compatible with the projection and the kernel
identification) and `Exal_A(B, M)` as its quotient, an abelian group under Baer sum, with the class
`extensionClass` of an extension. For an `A`-algebra map `f : T → B` and an extension of `B` by `M`,
`morphismObstruction` is the class of the pullback extension of `T`. Derivations `A`-linear from `B`
to `M` are the sections of the trivial extension, and `Der_A(B,M)` is the set of such sections
([StacksDefos] §2, Lemmas 2.1–2.3 and Remark 2.4, Tags 08S5, 08S7, 0GPT, 0GPU, pp.2–4; Mathlib
`derivationToSquareZeroEquivLift`).

*Needs:* Mathlib `Algebra.Extension`, `Derivation`, `derivationToSquareZeroEquivLift`.

Prove the following named laws.

- `Algebra.CotangentComplex.squareZero`: `B ⊕ M` has projection to `B` and zero section, with
  square-zero augmentation ideal `M`.
- `Algebra.CotangentComplex.derivationSection`: `A`-derivations `B → M` are in bijection with
  `A`-algebra sections of `B ⊕ M → B` (`derivationDiscrete`), the zero derivation corresponding to the
  zero section (`derivationZero`).
- `Algebra.CotangentComplex.derivationPostcompose`: a `B`-linear map `M → N` induces
  `Der_A(B, M) → Der_A(B, N)` and `Exal_A(B, M) → Exal_A(B, N)` (pushout of extensions), preserving the
  zero derivation and the split class.
- `Algebra.CotangentComplex.extensionClass_mk`: the class of an extension is its
  `morphismObstruction` for the identity map, normalized on a lift of the degree-zero polynomial
  resolution by subtracting the two lifted faces in the order `d₀ − d₁`
  (`morphismObstruction_cocycle`).

**Checks.**

- `test_derivation_base`: `Der_A(A, M) = 0` and `Exal_A(A, M) = 0`.
- `test_derivation_coordinate`: for `B = A[t]`, derivations are determined by `δ(t) ∈ M`, freely.
- `test_derivation_product_rule`: for discrete `M`, a section sends `t²` to `(t², 2tδ(t))`;
  replacing the square-zero product by a product ring fails.
- `test_extension_nonsplit`: `ℤ/4 → ℤ/2` with kernel `2ℤ/4 ≅ ℤ/2` has no ring section and a nonzero
  class, and so does `ℤ/9 → ℤ/3`; the rational dual numbers give the zero class.

### 0.6 The cotangent universal property

For `A → B` and a `B`-module `M`, there are natural bijections
`Algebra.CotangentComplex.extZero : Hom_(D(B))(L_(B/A), M[0]) ≃ Der_A(B, M)` and
`Algebra.CotangentComplex.extOne : Hom_(D(B))(L_(B/A), M[1]) ≃ Exal_A(B, M)`, the latter sending
precisely the split extensions to zero, and `Hom_(D(B))(L_(B/A), M[−n]) = 0` for `n > 0`. They are
natural in `M` and compatible with commutative squares. The first uses `H⁰L = Ω`; the second the
identification of the naive cotangent complex with `τ_(≥−1)L` and `Exal = Ext¹(NL, M)`
([StacksCt] Lemmas 4.5 and 11.3, Tags 08QF, 08RB, pp.6, 22; [StacksDefos] Lemma 2.3, Tag 0GPT, p.3;
for the derivation-space form, [Bhatt12] Remark 6.6 and equivalence (6), p.25, with trivial
monoids).

*Needs:* Layer 0: The full cotangent complex; Layer 0: Square-zero extensions and their classes;
Mathlib `derivationToSquareZeroEquivLift`, `CategoryTheory.Abelian.Ext`.

**Checks.**

- `test_ext_identity`: for `A → A` all three groups vanish.
- `test_ext_polynomial`: for `A[t]`, `Hom(L, M) ≅ M` and `Exal = 0`.
- `test_ext_regular_quotient`: for `ℤ → ℤ/p` and `M = ℤ/p`, `Hom(L, M) = 0` and `Exal ≅ ℤ/p`,
  realized by `ℤ/p² → ℤ/p`.

### 0.7 Degree zero and the naive cotangent complex

For `A → B`, `H⁰L_(B/A) ≃ Ω¹_(B/A)`. If `P → B` is a polynomial presentation with kernel `J`,
`τ_(≥−1)L_(B/A)` is represented by `[J/J² → Ω¹_(P/A) ⊗_P B]` in degrees `−1, 0`. Its `H^−1` agrees
with the pinned `Algebra.H1Cotangent`; the displayed two-term complex is not the full cotangent complex
for an arbitrary quotient. `τ_(≥−2)L_(B/A)` is the Lichtenbaum–Schlessinger complex
`[Rel/TrivRel → F ⊗_P B → Ω_(P/A) ⊗_P B]` of a free presentation `F → J` with relation module `Rel`
and Koszul relations `TrivRel` ([StacksCt] Lemma 13.3, Tag 09CG, p.26).

[StacksCt], Lemmas 4.5, 11.2 and 11.3; Tags 08QF, 08RA, 08RB, pp.5, 21–22.

*Needs:* Layer 0: The full cotangent complex; Mathlib `Algebra.Extension.cotangentComplex`,
`Algebra.Extension.toKaehler`, `Algebra.Extension.exact_cotangentComplex_toKaehler`,
`Algebra.H1Cotangent`, `Algebra.Generators.equivH1Cotangent`.

Lean: `Algebra.CotangentComplex.homologyOneIso` (`H^−1L ≅ Algebra.H1Cotangent A B`) and
`Algebra.CotangentComplex.lichtenbaumSchlessinger`.

*Transitivity, base change and geometric cases.*

The cotangent functor must work on base squares and composable maps, with ordinary computations
recovered in their correct range.

### 0.8 The cotangent transitivity triangle

For composable ring maps `A → B → C` there is a natural distinguished triangle
`L_(B/A) ⊗^L_B C → L_(C/A) → L_(C/B) → (L_(B/A) ⊗^L_B C)[1]` in `D(C)`. Its first two arrows are
images under `DerivedCategory.Q` of chain maps `Algebra.CotangentComplex.transitivityFirst` and
`transitivitySecond` induced by the squares `(A → B) → (A → C)` and `(A → C) → (B → C)`; only the
connecting arrow is chosen. On `H^−1`/`H⁰` it is the Jacobi–Zariski sequence
`Algebra.Generators.Cotangent.exact`.

[StacksCt], §7, Proposition 7.4; Tag 08QX, p.16 (construction pp.13–16).

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent universal property; Layer 0:
Derived tensor products on module derived categories.

Lean: `Algebra.CotangentComplex.transitivityTriangle`.

**Checks.**

- `test_transitivity_identity_first`: if `A = B`, `transitivityFirst` is zero and the second arrow
  is an isomorphism.
- `test_transitivity_identity_second`: if `B = C`, `transitivitySecond` is zero.
- `test_transitivity_regular_quotient`: for `ℤ → ℤ → ℤ/3`, `transitivitySecond` is nonzero on
  `H^−1 = ℤ/3`.

### 0.9 The cotangent complex of a map of simplicial rings and the diagonal comparison

For a map of simplicial commutative rings `R• → S•`, define the bisimplicial model by applying 0.4
levelwise, and its diagonal complex `L^Δ`, with the spectral sequence
`E¹_(i,j) = H_j(L_(S_i/R_i)) ⇒ H_(i+j)(L^Δ)` (homological indexing) and differential of bidegree
`(−r, r−1)`. For a polynomial resolution `S• → S` and `R• = S• ×_S R`, and more generally for maps of
simplicial rings resolving `R → S`, `L_(S/R) ≃ L^Δ`. For the derived pushout `P• ⊗_A A′` of 0.10, its
cotangent complex over `A′` is the diagonal model of `Ω_(P•/A) ⊗_A A′`.

[GR], Proposition 8.1.7 and its proof, pp.220–221; [Illusie-Ch2], Chapter II, 1.2.6.2 (as used in
[GR] loc. cit.); [BMS19], §2, pp.212–216.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Simplicial polynomial resolutions; Mathlib
`SimplicialObject`.

Lean: `Algebra.CotangentComplex.diagonalModel`, `Algebra.CotangentComplex.diagonalComparison`.

**Checks.**

- `test_diagonal_constant`: for constant simplicial rings the diagonal model is the cotangent complex
  of 0.4.
- `test_diagonal_identity`: for `R• = S•`, `L^Δ = 0`.
- `test_diagonal_regular_quotient`: for the constant map `ℤ → ℤ/2`, `H_1(L^Δ) ≅ ℤ/2`, so totalization
  is not replaced by taking only degreewise differentials.

### 0.10 Derived base change of the cotangent complex

For a commutative square with `B′ = B ⊗_A A′` and `Tor_i^A(B, A′) = 0` for `i > 0`,
`L_(B′/A′) ≃ L_(B/A) ⊗^L_B B′` naturally. Without Tor independence the same formula holds for the
derived pushout `P• ⊗_A A′` of a polynomial resolution, by 0.9; the degree-zero pushout need not
satisfy it.

[StacksCt], §6, Lemma 6.2; Tag 08QQ, p.12. Remark 6.3, pp.12–13, gives the comparison map outside the
Tor-independent range.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Derived tensor products on module derived
categories.

Lean: `Algebra.CotangentComplex.baseChange`.

### 0.11 Localization and filtered colimits of cotangent complexes

For a ring `B` and multiplicative set `S`, `L_(S⁻¹B/B) = 0` and `L_(S⁻¹B/A) ≃ L_(B/A) ⊗^L_B S⁻¹B`.
Cotangent complexes commute with filtered colimits of ring maps: if `A_i → B_i` is a directed system
with colimit `A → B`, `L_(B/A) ≃ colim_i (L_(B_i/A_i) ⊗^L_(B_i) B)`, through the canonical diagram of
models with both source and target varying.

[StacksCt], §3, Lemma 3.4 (Tag 08S9), and §8, Lemmas 8.1 and 8.6 (Tags 08QZ, 08SF), pp.4, 17–19.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; Layer 0:
Derived base change of the cotangent complex.

Lean: `Algebra.CotangentComplex.localization`, `Algebra.CotangentComplex.filteredColimit`.

### 0.12 The smooth cotangent computation

For a smooth finitely presented ring map `A → B`, `L_(B/A) ≃ Ω¹_(B/A)[0]`, where `Ω¹` is finite
projective. For an étale map it vanishes. Polynomial rings on arbitrary sets have a free differential
module in degree zero without a finiteness claim.

[StacksCt], §9, Lemma 9.1 (Tag 08R5), using §8, Lemma 8.4 (Tag 08R2) for étale maps, pp.18–21.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Derived base change of the cotangent complex;
Layer 0: Localization and filtered colimits of cotangent complexes.

Lean: `Algebra.CotangentComplex.smooth`.

### 0.13 Regular quotients and two-term models

If `J ⊂ P` is generated by a finite regular sequence `f₁, …, f_r` and `B = P/J`, then
`L_(B/P) ≃ (J/J²)[1]`, with `J/J²` free on the classes of the `f_i`. If `P` is smooth over `A`,
`L_(B/A)` is the two-term complex `[J/J² → Ω¹_(P/A) ⊗_P B]` with `f_i ↦ df_i` in degrees `−1, 0`.
Flatness of `B` over `A` is not needed for this computation.

[StacksCt], §14, Lemma 14.2 and Proposition 14.4; Tags 08SJ, 08SL, pp.29–31.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; Layer 0:
The smooth cotangent computation; IntegralHeckeAndGaloisDeterminants §6.4 (Koszul resolution of a
regular sequence).

Lean: `Algebra.CotangentComplex.regularQuotient`.

*Integral power operations.*

Build powers of connective complexes of modules by 0.3, with coherent scalar extension, the
flat-module comparison and the décalage isomorphisms. All formulas are integral, including at `p = 2`.
The integral resolution, power and décalage arguments respect the author corrections [IllusieI] and
[IllusieII].

### 0.14 Derived exterior powers

For a ring `B` and a connective `M ∈ D^(≤0)(B)` define `L∧^n_B(M) = DerivedDeRham.derivedExteriorPower
B n M`, `n ≥ 0`, as the derived functor (0.3) of the exterior power `∧^n_B` on projective modules. It
is a connective `B`-module complex with base change and graded multiplication. For a flat discrete
`M` it agrees with the ordinary exterior power (the quotient of `M^(⊗n)` by signed permutations), and
the exterior operation imposes `x ∧ x = 0` even at `2`. [SAG] Construction 25.2.2.2, p.1700, is the
same functor in the ∞-categorical language; [BL22] Construction B.1 and Remark B.5, pp.225–226,
specialize it to cotangent complexes.

[SAG], Construction 25.2.2.2, Proposition 25.2.3.1, Corollaries 25.2.3.2–25.2.3.3 and Proposition
25.2.3.4(2) with proofs, pp.1700–1704; [DoldPuppe] §4, pp.227–230.

*Needs:* Layer 0: Derived functors of non-additive functors; Mathlib `ExteriorAlgebra.exteriorPower`,
`exteriorPower.ιMulti`.

Prove the following named laws.

- `exteriorPowerZero`: `L∧⁰_B(M) ≃ B` naturally.
- `exteriorPowerOne`: `L∧¹_B(M) ≃ M`.
- `exteriorPowerBaseChange`: `L∧ⁿ_B(M) ⊗^L_B B′ ≃ L∧ⁿ_(B′)(M ⊗^L_B B′)` ([SAG] Proposition 25.2.3.1).
- `exteriorPowerFlat`: for flat discrete `M`, `L∧ⁿ_B(M)` is the ordinary exterior power in degree
  zero ([SAG] Corollary 25.2.3.3 and Proposition 25.2.3.4(2); Lazard's theorem [StacksAlg] Theorem
  10.81.4, Tag 058G, reduces to finite free modules).

**Checks.**

- `test_derived-exterior-powers_zero_weight`: `L∧⁰_B(0) = B` and `L∧ⁿ_B(0) = 0` for `n > 0`.
- `test_derived-exterior-powers_rank_one`: for the flat rank-one `B`-module `Be`, `L∧²(Be) = 0`,
  including `B = F₂`.
- `test_derived-exterior-powers_integral_boundary`: for flat `M = B` and `n ≥ 0`,
  `L∧ⁿ(M[1]) ≃ Γⁿ(M)[n]`, computed on the Dold–Kan model of `M[1]` (the décalage of 0.17), so
  positive powers of a shifted line are nonzero.

### 0.15 Derived symmetric powers

For a ring `B` and connective `M`, define `LSym^n_B(M) = DerivedDeRham.derivedSymmetricPower B n M`,
`n ≥ 0`, as the derived functor (0.3) of the symmetric power on projective modules. It is a
connective `B`-module complex with base change and graded multiplication; for a flat discrete `M` it
is the ordinary symmetric power.

[SAG], Construction 25.2.2.1, Proposition 25.2.3.1 and Proposition 25.2.3.4(1) with proofs,
pp.1699–1704; [DoldPuppe] §4, Example 4.10, pp.229–230.

*Needs:* Layer 0: Derived functors of non-additive functors.

Prove the following named laws.

- `symmetricPowerZero`: `LSym⁰_B(M) ≃ B` naturally.
- `symmetricPowerOne`: `LSym¹_B(M) ≃ M`.
- `symmetricPowerBaseChange`: `LSymⁿ_B(M) ⊗^L_B B′ ≃ LSymⁿ_(B′)(M ⊗^L_B B′)`.
- `symmetricPowerFlat`: for flat discrete `M`, `LSymⁿ_B(M)` is the ordinary symmetric power in degree
  zero.

**Checks.**

- `test_derived-symmetric-powers_zero_weight`: `LSym⁰_B(0) = B` and `LSymⁿ_B(0) = 0` for `n > 0`.
- `test_derived-symmetric-powers_rank_one`: for the flat rank-one `ℤ`-module `ℤe`, `LSym²` is free of
  rank one on `e²`; its coefficient map is quadratic.
- `test_derived-symmetric-powers_integral_boundary`: over `F₂`, `Sym²(F₂e)` is generated by `e²`,
  whereas the square of `e` in the divided power algebra is zero.

### 0.16 Derived divided powers

For a ring `B` and connective `M`, define `LΓ^n_B(M) = DerivedDeRham.derivedDividedPower B n M`,
`n ≥ 0`, as the derived functor (0.3) of the homogeneous divided-power piece `Γ^n_B` of
IntegralHeckeAndGaloisDeterminants §0.4 on projective modules. It is a connective `B`-module complex
with base change and graded multiplication. For a flat discrete `M` it is the module of
`Σ_n`-invariant tensors in `M^(⊗n)`, which is `Γ^n_B(M)` for flat `M` (IntegralHeckeAndGaloisDeterminants
§0.4 for free modules, and filtered colimits).

[SAG], Construction 25.2.2.3, Remark 25.2.2.4, Proposition 25.2.3.1 and Proposition 25.2.3.4(3) with
proofs, pp.1700–1704; [DoldPuppe] §4, Example 4.13 and (4.14), p.230.

*Needs:* Layer 0: Derived functors of non-additive functors; IntegralHeckeAndGaloisDeterminants §0.4;
CrystallineCohomology §CR.0.3; Mathlib `DividedPowerAlgebra`.

Prove the following named laws.

- `dividedPowerZero`: `LΓ⁰_B(M) ≃ B` naturally.
- `dividedPowerOne`: `LΓ¹_B(M) ≃ M`.
- `dividedPowerBaseChange`: `LΓⁿ_B(M) ⊗^L_B B′ ≃ LΓⁿ_(B′)(M ⊗^L_B B′)`.
- `dividedPowerFlat`: for flat discrete `M`, `LΓⁿ_B(M)` is the ordinary divided power in degree
  zero.

**Checks.**

- `test_derived-divided-powers_zero_weight`: `LΓ⁰_B(0) = B` and `LΓⁿ_B(0) = 0` for `n > 0`.
- `test_derived-divided-powers_rank_one`: for the flat rank-one `ℤ`-module `ℤe`, `LΓ²` is free of rank
  one on `γ₂(e)`, and `e·e = 2γ₂(e)`.
- `test_derived-divided-powers_integral_boundary`: over `F_p`, `γ_p(e)` in `Γ(F_p e)` is nonzero
  although `e^p = p!γ_p(e) = 0`.

### 0.17 Exterior powers of a triangle and décalage

For a short exact sequence `0 → K → L → M → 0` of projective modules, `∧ⁿL` has the finite
filtration `F^j = image(∧^j K ⊗ ∧^(n−j) L)`, `0 ≤ j ≤ n`, with graded pieces
`∧^j K ⊗ ∧^(n−j) M`. Every fibre sequence `K → L → M` of connective complexes is represented by a
degreewise split short exact sequence of simplicial projective modules, so applying this filtration
levelwise gives a natural finite filtration of `L∧ⁿL` of length `n+1` with graded pieces
`L∧^j K ⊗^L L∧^(n−j) M`, multiplicative for the weight grading. For connective `M` there are the
décalage equivalences `LSymⁿ(M[1]) ≃ (L∧ⁿM)[n]` and `L∧ⁿ(M[1]) ≃ (LΓⁿM)[n]`; for a flat discrete
module `N`, `L∧ⁿ(N[1]) ≃ Γⁿ(N)[n]`.

[DM], Lemma 3.3 and its proof, pp.21–22 (the filtration for a short exact sequence of projective
modules and its levelwise application to cotangent complexes); [SAG], Proposition 25.2.4.2 (Illusie)
with its proof, pp.1704–1707 (the Koszul filtrations `F_i`, `G_i` and the décalage equivalences);
[Bhatt12], Proposition 3.22 and Remark 3.43, pp.11–12, 18, for the uses below.

*Needs:* Layer 0: Derived exterior powers; Layer 0: Derived symmetric powers; Layer 0: Derived
divided powers; Layer 0: Derived functors of non-additive functors.

Lean: `DerivedDeRham.powerTriangleFiltration`, `DerivedDeRham.decalage`.

**Checks.**

- `test_power_triangle_zero_end`: if `K = 0`, the filtration has the single piece `L∧ⁿM`; if `M = 0`,
  the single piece `L∧ⁿK`.
- `test_power_triangle_split`: for `L = K ⊕ M` with `K = Be`, `M = Bf` free of rank one and `n = 2`,
  the graded pieces are `∧²K = 0`, `K ⊗ M ≅ B(e ∧ f)` and `∧²M = 0`, matching `∧²(B²) ≅ B`.
- `test_decalage_line`: for `N = ℤ` and `n = 2`, `L∧²(ℤ[1]) ≃ Γ²(ℤ)[2] ≅ ℤ[2]` is nonzero, whereas the
  ordinary exterior square of a rank-one module is zero; over `F₂` the same holds with `γ₂` surviving.

*André–Quillen criteria and finiteness.*

Coefficient homology uses the full cotangent object. The local criteria distinguish finite
presentation lci maps from absolute Noetherian complete-intersection rings.

### 0.18 André–Quillen homology

For a ring map `A → B`, a `B`-module `N` and `n ≥ 0`, define
`D_n(B|A, N) = H^−n(L_(B/A) ⊗^L_B N)`, computed as the homology of the simplicial module
`Ω_(P•/A) ⊗_(P•) N` for a polynomial resolution. Coefficients are derived-tensored, even when the
cotangent module has a two-term presentation. Transitivity gives the homological long exact sequence.

[Iyengar], §§4–5 definitions and §8.10–8.14 applications, pp.211–217, 228–229.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; Layer 0:
Derived tensor products on module derived categories.

Lean: `DerivedDeRham.andreQuillenHomology`.

Prove the following named laws.

- `andreQuillenZero`: `D₀(B|A, N) ≃ Ω¹_(B/A) ⊗_B N`.
- `andreQuillenCoefficients`: a `B`-linear coefficient map induces natural maps on `D_n`.
- `andreQuillenTransitivity`: the cotangent transitivity triangle induces the exact sequence of `D_n`
  with the appropriate scalar extensions.

**Checks.**

- `test_aq_polynomial`: `D₀(A[t]|A, N) ≃ N` and `D_n = 0` for `n > 0`.
- `test_aq_regular_quotient`: `D₁(F_p|ℤ, F_p) ≃ F_p` and `D_n = 0` for `n ≠ 1`.
- `test_aq_nonregular_local`: for `A = k[ε]/ε²` and its residue field `k`, `D₂(k|A, k) ≃ k`; `A` is
  not regular.

### 0.19 Cohen factorizations and the vanishing theorems

For a local homomorphism `φ : (R, 𝔪) → (S, 𝔫)` of Noetherian local rings, the composite
`R → Ŝ` with the completion of `S` factors as `R → R′ → Ŝ` with `R → R′` flat, `R′` complete,
`R′/𝔪R′` regular and `R′ → Ŝ` surjective (a *Cohen factorization*). `φ` is *complete intersection at
𝔫* if in some (equivalently every) Cohen factorization the kernel of `R′ → Ŝ` is generated by a
regular sequence; a homomorphism of Noetherian rings is *l.c.i.* if it is c.i. at every prime of `S`.
Prove: `φ` is c.i. at `𝔫` iff `D₂(S|R, ℓ) = 0` for the residue field `ℓ`, and then `D_n(S|R, ℓ) = 0`
for `n ≥ 2`; a homomorphism of Noetherian rings is l.c.i. iff `D₂(S|R, −) = 0` iff
`fd_S L_(S/R) ≤ 1`; if `φ` is locally of finite flat dimension, it is l.c.i. iff `fd_S L_(S/R)` is
finite; for flat `φ`, it is l.c.i. iff its fibres are complete intersections; for regular `R`, `φ` is
l.c.i. iff `S` is l.c.i.

[AFH94], Theorem (1.1), as stated in [Avramov] p.458 (existence of Cohen factorizations); [Avramov],
Definition before (1.2), Theorems (1.1)–(1.3), Remarks (1.6), Lemma (1.7), Proposition (1.8), (5.1)
and (5.2) with proofs, pp.458–461, 481; [Iyengar], Theorems 8.4–8.5 and Propositions 8.12, 8.14,
pp.226–229.

*Needs:* Layer 0: André–Quillen homology; Layer 0: Regular quotients and two-term models; Layer 0:
The cotangent transitivity triangle; Mathlib `AdicCompletion`, `IsLocalRing`, `Module.Flat`.

Lean: `DerivedDeRham.cohenFactorization`, `DerivedDeRham.secondVanishing`,
`DerivedDeRham.quillenConjecture`.

**Checks.**

- `test_cohen_factorization_surjective`: for a surjection of complete local rings the factorization
  with `R′ = R` exists, and c.i. means the kernel is generated by a regular sequence.
- `test_cohen_factorization_dual_numbers`: `k → k[ε]/ε²` is c.i. (kernel `(t²)` of `k[[t]] → k[ε]/ε²`)
  and `D₂ = 0`; `k → k[x,y]/(x,y)²` is not, and `D₂(S|k, k) ≠ 0`.
- `test_cohen_factorization_regular_base`: `ℤ → ℤ_p` is flat with regular fibres, so l.c.i., with
  `D₂ = 0`, although `ℤ_p` is not of finite type over `ℤ`.

### 0.20 The finite-presentation lci amplitude criterion

For a flat finitely presented map `A → B` of rings, `A → B` is a local complete intersection map
(locally a Koszul-regular quotient of a polynomial algebra, [StacksMA] Definition 15.34.2, Tag 07D0)
if and only if `L_(B/A)` is perfect of Tor amplitude `[−1, 0]`. The forward direction holds without
flatness ([StacksCt] Proposition 14.4, Tag 08SL, p.30). For the converse: for every map `A → k` to a
field, the fibre `S = B ⊗_A k` has `L_(S/k) ≃ L_(B/A) ⊗^L_B S` by Tor-independent base change (0.10),
hence `D₂(S|k, −) = 0`; by Avramov's Second Vanishing Theorem the map `k → S` of Noetherian rings is
l.c.i., and since `k` is regular, `S` is an l.c.i. ring ([Avramov] Theorem (1.2) and (5.1),
pp.459, 481); a finite type `k`-algebra all of whose local rings are complete intersections is a
local complete intersection over `k` ([StacksAlg] Lemmas 10.135.4, 10.135.8–10.135.9, Tags 00SC,
00SG, 00SH, pp.351–353). So `A → B` is flat, of finite presentation and has lci fibres, that is,
syntomic ([StacksAlg] Definition 10.136.1, Tag 00SL), and syntomic maps are exactly the flat lci maps
([StacksMA] Lemma 15.34.5, Tag 07D3, p.87). No converse is asserted for maps that are not flat and
finitely presented.

*Needs:* Layer 0: Regular quotients and two-term models; Layer 0: Degree zero and the naive cotangent
complex; Layer 0: Derived base change of the cotangent complex; Layer 0: André–Quillen homology;
Layer 0: Cohen factorizations and the vanishing theorems.

Lean: `DerivedDeRham.lciAmplitude`.

**Checks.**

- `test_lci_amplitude_smooth`: the identity and a polynomial algebra are lci with `L` projective in
  degree zero.
- `test_lci_amplitude_hypersurface`: `k → k[t]/(t²)` is flat, finitely presented and lci, with `L` the
  two-term complex `[B → B dt]`, map `2t`.
- `test_lci_amplitude_square_zero`: `k → k[x,y]/(x,y)²` is flat and finitely presented but not lci:
  the Lichtenbaum–Schlessinger complex of 0.7 for the generators `x², xy, y²` gives `H^−2(L) ≅ k`, so
  `L` is not of amplitude `[−1, 0]`.

### 0.21 Avramov's absolute complete-intersection criterion

For a Noetherian ring `A`, `A` is locally a complete-intersection ring (each completed local ring is a
quotient of a regular local ring by a regular sequence) if and only if `L_(A/ℤ)` has Tor-amplitude
`[−1, 0]`. This is the absolute Noetherian criterion, without a finite-presentation hypothesis over
`ℤ`: apply 0.19 to the regular base `ℤ` ([Avramov] (5.1) and Theorem (1.2)).

[BMS19], Theorem 4.13, p.224; [Avramov], Theorem (1.2), Proposition (1.8) and (5.1), pp.459–461, 481.

*Needs:* Layer 0: André–Quillen homology; Layer 0: Cohen factorizations and the vanishing theorems;
Layer 0: The cotangent transitivity triangle.

Lean: `DerivedDeRham.absoluteCompleteIntersection`.

### 0.22 André's regularity criterion and the cotangent injection test

For a Noetherian local ring `(A, 𝔪, k)`, `A` is regular iff `D₂(k|A, k) = 0`, and `A` is a complete
intersection iff `D₃(k|A, k) = 0`. If `A` is a complete-intersection local ring, regularity is
equivalent to injectivity of `H^−1(L_(A/ℤ) ⊗^L_A k) → H^−1(L_(k/ℤ))`. The injection reformulation
retains the complete-intersection hypothesis; it is not a criterion obtained by truncating `L_(A/ℤ)`
for arbitrary `A`.

[Iyengar], Theorems 8.4–8.5 and Propositions 8.12, 8.14 with proofs, pp.226–229; [BM], Lemma 4.18 and
proof, pp.18–19.

*Needs:* Layer 0: André–Quillen homology; Layer 0: Cohen factorizations and the vanishing theorems;
Layer 0: The cotangent transitivity triangle.

Lean: `DerivedDeRham.andreRegularity`.

### 0.23 p-bases and the dimension of differentials

For a field `k` of characteristic `p` with finite degree `[k : k^p] = p^r`, a p-basis `b₁, …, b_r`
gives a basis `db₁, …, db_r` of `Ω¹_(k/F_p)`, so `dim_k Ω¹_(k/F_p) = r = log_p [k : k^p]`. A p-basis
means the p-monomials `∏ b_i^(e_i)`, `0 ≤ e_i < p`, form a `k^p`-basis; arbitrary transcendence bases
are not substituted.

[CMM], §5.1, Theorem 5.7, Footnote 10 and the paragraph before Lemma 5.8, pp.39–40.

*Needs:* Mathlib `KaehlerDifferential.D`, `frobenius`.

Lean: `DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis`.

**Checks.**

- `test_pbasis_perfect`: for a perfect field the empty family is a p-basis and `Ω¹ = 0`.
- `test_pbasis_rational_function`: for `F_p(t)` the single element `t` is a p-basis, `[F_p(t) :
  F_p(t^p)] = p`, and `dt` spans `Ω¹`, including `p = 2`.
- `test_pbasis_transcendence_not_enough`: for `k = F_p(t)`, `{t^p}` is a transcendence basis of `k`
  over `F_p` but not a p-basis (`t^p ∈ k^p`), and `d(t^p) = 0`.

### 0.24 F-finiteness and almost perfect cotangent complexes

For a Noetherian `F_p`-algebra `S` whose Frobenius is finite, `L_(S/F_p)` is almost perfect: each
`H^−n L_(S/F_p)` is a finite `S-module` (bounded above with finitely generated cohomology; over a
Noetherian ring equivalently a bounded-above resolution by finite projectives; it is not bounded or
perfect in general). Conversely, if `L_(S/F_p)` is almost perfect then every residue field `κ` of `S`
is F-finite: `Ω¹_(κ/F_p)` is a quotient of `Ω¹_(S/F_p) ⊗_S κ` by the transitivity sequence of
`F_p → S → κ` (with `Ω_(κ/S) = 0`), hence finite-dimensional, and 0.23 identifies its dimension with
`log_p [κ : κ^p]`.

[DM], Theorem 3.6 with Lemma 3.3 and proof, pp.21–24; [CMM], Definition 5.1 and the paragraph
following it, p.38; [BM], the discussion preceding Corollary 4.20, p.20.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; Layer 0:
Exterior powers of a triangle and décalage; Layer 0: p-bases and the dimension of differentials.

Lean: `DerivedDeRham.fFiniteCotangent`.

**Checks.**

- `test_f_finite_perfect`: `F_p` and every perfect field have `L = 0`.
- `test_f_finite_polynomial`: `F_p[t]` has `L = F_p[t] dt` and finite Frobenius.
- `test_f_finite_residue`: for `S = F_p(t)`, `L ≅ Ω¹ = S dt`, finite, and `[S : S^p] = p`.

*Deformations.*

### 0.25 Cotangent obstruction theory for square-zero lifts

Let `A′ → A` be a square-zero extension with ideal `J` and let `B` be an `A`-algebra and `N` a
`B`-module with an `A`-linear `c : J → N`. There is a canonical obstruction in `Ext²_B(L_(B/A), N)` to
a square-zero `A′`-algebra extension `B′ → B` with kernel identified with `N` and inducing `c`; if one
exists, the isomorphism classes form a torsor under `Ext¹` and automorphisms are `Ext⁰` ([StacksCt]
Lemma 16.1, Tag 08SP, p.31). For `B` flat over `A` and `N = J ⊗_A B`, a solution `B′` is flat over
`A′` with `B′ ⊗_(A′) A ≃ B`, because `B′/JB′ = B` is flat over `A` and the identification of the
kernel with `J ⊗_(A′) B′` is the vanishing of `Tor₁^(A′)(A, B′)`, so the nilpotent flatness criterion
applies ([StacksAlg] Lemma 10.99.8, Tag 051C, pp.233–234). For a square-zero extension `T′ → T` of
`A`-algebras with kernel `J` and an `A`-map `f : B → T`, the obstruction to lifting `f` to `T′` lies in
`Ext¹_B(L_(B/A), J)` and lifts form a torsor under `Ext⁰` ([StacksDefos] Lemma 2.1, Tag 08S5, p.2,
with `H⁰L = Ω`). For smooth `B/A`, finite projectivity of `L` in degree zero gives existence and
uniqueness up to the stated automorphisms.

[StacksCt], §16, Lemma 16.1 (Tag 08SP), and its ringed-space version §21, Lemma 21.1 (Tag 08UZ),
pp.31–32, 37–38; [StacksAlg] Lemma 10.99.8 (Tag 051C).

*Needs:* Layer 0: The cotangent universal property; Layer 0: The cotangent transitivity triangle;
Layer 0: The smooth cotangent computation; Mathlib `Module.Flat`.

Lean: `Algebra.CotangentComplex.flatDeformation`, `Algebra.CotangentComplex.liftMorphism`.

**Checks.**

- `test_deformation_identity`: for the identity extension (`J = 0`) the obstruction vanishes and the
  lift is `B`.
- `test_deformation_smooth`: a polynomial algebra lifts uniquely up to isomorphism; its obstruction
  group `Ext²(Ω[0], N)` vanishes.
- `test_deformation_ideal`: the lift's kernel must be `J ⊗_A B`; for `A′ = ℤ/4 → A = ℤ/2` and
  `B = F₂[t]`, the lift `ℤ/4[t]` has kernel `2ℤ/4[t] ≅ F₂[t]`, while the extension of `B` by the
  unrelated module `0` is not a lift.

### Examples

The identity map has zero cotangent complex. A polynomial line has one degree-zero generator. The
hypersurface `k[ε]/ε²` has differential `2ε`; at characteristic 2 the map is zero and both cotangent
degrees survive. Weight zero of every power is the base ring, including the zero module. The
square-zero quotient `k[x,y]/(x,y)²` has `H^−2(L) ≅ k` (0.7, computed in 3.11). The extension `ℤ/4 → ℤ/2` is the
nonsplit class of `ℤ/2[1] = L_(F₂/ℤ)` against `F₂`.

### Dependencies

Mathlib supplies simplicial objects, the Dold–Kan correspondence, derived categories, Kähler
differentials, exterior powers, the naive cotangent complex and regular sequences.
SchemeAndStackFoundations §2.18 supplies the comparison of the derived tensor product with its sheaf
version; IntegralHeckeAndGaloisDeterminants §§0.4, 6.4 supply divided-power pieces and Koszul
complexes; CrystallineCohomology §CR.0.3 supplies the divided power algebra.

## Layer 1: Completion and filtered modules

Construct derived limits, derived completion, complete flatness and the effectivity of perfect
systems, then the filtered derived category with its completion, tensor product and Beilinson
t-structure. The quasisyntomic condition comes after complete flatness.

### 1.1 Derived limits of towers

For a ring `A` and an inverse system `(K_n)` of complexes of `A`-modules, define the derived limit
`Rlim_n K_n ∈ D(A)`, `DerivedDeRham.derivedLimit`, as the termwise inverse limit after replacing the
system by a termwise surjective one (equivalently the fibre of `1 − shift : ∏ K_n → ∏ K_n`). It depends
only on the class of the system in `D(Mod(ℕ, A))`, and there is the Milnor exact sequence
`0 → lim¹ H^(j−1)K_n → H^j(Rlim K_n) → lim H^jK_n → 0`. A map of systems that is a quasi-isomorphism
in each level induces an isomorphism on derived limits; derived limits of distinguished triangles of
systems are distinguished.

[StacksMA], §15.89, Lemmas 15.89.1, 15.89.3–15.89.4, Remark 15.89.10 and Lemmas 15.89.11–15.89.12;
Tags 091D, 0CQD, 0CQE, 091J, 091K, 091L, pp.238–241.

*Needs:* Mathlib `DerivedCategory`, `HomologicalComplex`, `CochainComplex`.

Prove the following named laws.

- `derivedLimit_surjective`: for a termwise surjective system, `Rlim` is the termwise limit.
- `derivedLimit_milnor`: the Milnor sequence above.
- `derivedLimit_triangle`: `Rlim` sends levelwise distinguished triangles to distinguished triangles.

**Checks.**

- `test_rlim_constant`: for a constant system `K`, `Rlim K_n ≅ K`.
- `test_rlim_padic`: for `K_n = ℤ/p^n` with the reductions, `Rlim = ℤ_p` in degree zero.
- `test_rlim_lim_one`: for `K_n = ℤ` with transition maps multiplication by `p`, `lim = 0` and
  `lim¹ = ℤ_p/ℤ ≠ 0`, so `H¹(Rlim) ≠ 0`; the underived limit loses it.

### 1.2 Derived ideal completeness

Let `I = (f₁, …, f_r) ⊂ A` be finitely generated. A complex `M ∈ D(A)` is derived `I`-complete if
`RHom_A(A[1/f_i], M) = 0` for each `i`, equivalently `Hom_(D(A))(A[1/f][n], M) = 0` for every integer
`n` and every `f ∈ I`. This depends only on `√I` and is equivalent to each `H^j(M)` being a derived
`I`-complete module. Completeness is a homotopical condition, not ordinary separatedness.

[StacksMA], §15.93, Lemmas 15.93.1–15.93.3, Definition 15.93.4 and Proposition 15.93.5; Tags 091P,
091Q, 091R, 091S, 091T, pp.261–263.

*Needs:* Mathlib `DerivedCategory`, `Localization.Away`.

Lean: `DerivedDeRham.derivedCompleteness` (stated in `Suggested.lean` as vanishing of all morphisms
from the shifted localizations).

Prove the following named laws.

- `isDerivedCompleteGenerators`: the condition is RHom-vanishing for any finite generating set of `I`.
- `isDerivedCompleteRadical`: if `√I = √J` for finitely generated ideals, `I`-complete and
  `J`-complete objects coincide.
- `isDerivedCompleteCohomology`: `M` is `I`-complete iff every `H^j(M)` is derived `I`-complete.
- `isDerivedCompleteLimits`: derived `I`-complete objects are closed under derived limits (1.1),
  products, shifts and cones in `D(A)`.

**Checks.**

- `test_complete_zero_ideal`: for `I = 0`, every complex is derived complete.
- `test_complete_unit_ideal`: for `I = A`, only the zero object is complete.
- `test_complete_zp`: `ℤ_p` is derived p-complete, while `ℚ_p` is not: `RHom_(ℤ_p)(ℚ_p, ℚ_p)` has a
  nonzero identity class.

### 1.3 The derived completion reflector

For finitely generated `I ⊂ A` construct `Λ_I : D(A) → D(A)`, `DerivedDeRham.derivedCompletion`, with
natural unit `η_M : M → Λ_I M`, `DerivedDeRham.completionUnit`, left adjoint to the inclusion of derived
`I`-complete objects. For `I = (f_i)`, put `C_I = ⊗_i [A → A[1/f_i]]` in cochain degrees `0, 1` and
`Λ_I M = RHom_A(C_I, M)`; equivalently, by 1.4, the derived limit of Koszul quotients. It is exact,
independent of generators, idempotent and preserves colimits formed in the complete category. Derived
Nakayama: if `M` is complete and `M ⊗^L_A A/I = 0` then `M = 0`. The intended Lean signatures are

```lean
DerivedDeRham.derivedCompletion (A : Type u) [CommRing A] (I : Ideal A) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A)
DerivedDeRham.completionUnit (A : Type u) [CommRing A] (I : Ideal A) :
    𝟭 _ ⟶ DerivedDeRham.derivedCompletion A I
```

[StacksMA], §15.93, Lemmas 15.93.10, 15.93.18, 15.93.20 and 15.93.21; Tags 091V, 0920, 0G1U, 0AAJ,
pp.264, 267–268.

*Needs:* Layer 1: Derived ideal completeness; Layer 1: Derived limits of towers;
IntegralHeckeAndGaloisDeterminants §6.4 (Koszul complexes); Layer 0: Derived tensor products on module
derived categories; Mathlib `PadicInt`.

Prove the following named laws.

- `completionUnit`: `η_M` is the universal map from `M` to an `I`-complete object.
- `completionAdjunction`: `Hom(Λ_I M, N) ≃ Hom(M, N)`, naturally for complete `N`.
- `completionIdempotent`: `Λ_IΛ_I M ≃ Λ_I M`, compatibly with both units.
- `completeNakayama`: a complete `M` with `M ⊗^L_A A/I = 0` vanishes.
- `completionComplete`: for a finitely generated ideal `I`, `Λ_I M` is derived `I`-complete.
- `completedColimit`: the colimit of a diagram of complete objects in the complete category is `Λ_I`
  of its colimit in `D(A)`.

**Checks.**

- `test_completion_z`: `Λ_(p)ℤ ≃ ℤ_p` in degree 0.
- `test_completion_inverted`: `Λ_(p)ℤ[1/p] = 0`, although `ℤ[1/p]` is nonzero.
- `test_completion_torsion`: `Λ_(p)(ℤ/p^m) ≃ ℤ/p^m` for `m ≥ 1`.

### 1.4 The derived Koszul completion tower

For `M ∈ D(A)`, `I = (f₁, …, f_r)`, `Λ_I M ≃ Rlim_n(M ⊗^L_A K_A(f₁^n, …, f_r^n))`, with the
quotient-direction transition induced by `e_i ↦ f_i e_i` and the identity in degree zero. These are
derived Koszul quotients. Replacing them by ordinary `A/I^n` for an arbitrary ring is invalid.

[StacksMA], Lemma 15.93.18; Tag 0920, pp.266–267.

*Needs:* IntegralHeckeAndGaloisDeterminants §6.4 (Koszul complexes, cohomologically reindexed); Layer 1:
The derived completion reflector; Layer 1: Derived limits of towers.

Lean: `DerivedDeRham.koszulCompletionTower`.

### 1.5 When ordinary quotient towers compute completion

For finite `I` generated by a regular sequence, `Λ_I M ≃ Rlim_n(M ⊗^L_A A/I^n)`, using the cofinal
ideals `(f₁^n, …, f_r^n)`. The same comparison holds for every `M ∈ D(A)` when `A` is Noetherian: the
pro-objects `{K(f₁^n, …, f_r^n)}` and `{A/(f₁^n, …, f_r^n)}` of `D(A)` are isomorphic because the
Koszul homology in negative degrees is pro-zero by Artin–Rees ([StacksMA] Lemma 15.96.1 and
Proposition 15.96.2, Tags 0921, 0922, pp.275–276, with the ordinary Artin–Rees lemma
[StacksAlg] Lemma 10.51.2). For principal `I = (f)`, it holds for every complex `M` when `A` has
bounded `f`-power torsion ([StacksMA] Lemmas 15.95.1–15.95.2, Tags 091X, 0923, pp.271–272). For a
Noetherian `A`, the derived completion of a complex with finitely generated cohomology has as
cohomology the `I`-adic completions of its cohomology modules ([StacksMA] Lemma 15.96.4, Tag 0A06).
Without these hypotheses use the Koszul tower.

[StacksMA], §15.95 Lemmas 15.95.1–15.95.2 and Examples 15.95.3–15.95.4, §15.96 Lemmas 15.96.1–15.96.4;
Tags 091X, 0923, 09AT, 0G3F, 0921, 0922, 0EET, 0A06, pp.271–277; [Prisms], §1.2 Footnote 5, pp.10–11.

*Needs:* Layer 1: The derived Koszul completion tower; IntegralHeckeAndGaloisDeterminants §6.4; Tau
Ceti `TauCeti.ArtinRees.exists_controlled_lift`.

Lean: `DerivedDeRham.ordinaryQuotientCompletion`.

**Checks.**

- `test_ordinary_tower_regular`: for `(p) ⊂ ℤ` the ordinary quotient tower gives `ℤ_p`.
- `test_ordinary_tower_noetherian`: for `A = k[x,y]/(xy)` and `I = (x, y)`, the ordinary tower computes
  `Λ_I A = k[[x,y]]/(xy)` in degree zero, although `(x, y)` is not generated by a regular sequence.
- `test_ordinary_tower_unbounded_torsion`: for `A = ℤ_p ⊕ ℚ_p/ℤ_p` with square-zero second summand and
  `I = (p)`, the naive limit gives `ℤ_p[0]` whereas `Λ_I A ≅ ℤ_p[1] ⊕ ℤ_p[0]` ([StacksMA] §15.96,
  opening paragraph, Tag 0BKH); bounded torsion fails.

### 1.6 Completion of simplicial commutative algebras

For a simplicial commutative `A`-algebra `B•` and finite `I = (f₁, …, f_r) ⊂ A`, construct its derived
`I`-completion as the inverse limit of the simplicial Koszul quotients
`B• ⊗_(ℤ[x₁,…,x_r]) Q•^(n)`, where `Q•^(n) → ℤ[x]/(x₁^n, …, x_r^n)` are compatible polynomial resolutions
over `ℤ[x]` with surjective transitions and `x_i` acts through `f_i`. Its underlying `A`-module complex
is `Λ_I B`; the unit is a map of simplicial algebras, and the construction is a reflector onto
complete simplicial algebras. Specialize to `(p)` and `(p, d)`. Limits are taken levelwise in
simplicial rings, not in degree-zero rings.

[Prisms], §1.2 and Footnote 6, pp.10–11.

*Needs:* Layer 1: The derived completion reflector; Layer 1: The derived Koszul completion tower;
Layer 0: Simplicial polynomial resolutions; Layer 1: Derived limits of towers.

Lean: `DerivedDeRham.simplicialRingCompletion`.

Prove the following named laws.

- `ringCompletionUnit`: `B• → Λ_I B•` is a map of simplicial algebras with the module completion
  unit underneath.
- `ringCompletionUnderlying`: the underlying module complex is the derived completion of 1.3,
  including negative cochain degrees.
- `ringCompletionMap`: a map of simplicial algebras respecting the ideal induces the completed map.
- `ringCompletionIdempotent`: completing a complete simplicial algebra gives it back.

**Checks.**

- `test_ring_completion_z`: the p-completion of `ℤ` is the ordinary `ℤ_p`.
- `test_ring_completion_pd`: the `(p, d)`-completion of `ℤ[d]` is `ℤ_p[[d]]`, with both generators
  retained.
- `test_ring_completion_unit`: completion at the unit ideal is the zero ring.

*Complete flatness and algebraization.*

The reduction criterion controls amplitude, descent and smooth deformation theory. Keep the
assumptions that turn complete flatness into ordinary flatness and classical completeness.

### 1.7 Complete flatness and complete faithful flatness

For finite `I ⊂ A`, an object `M ∈ D(A)` is `I`-completely flat when `M ⊗^L_A A/I` is a flat
`A/I`-module in degree zero, equivalently `M ⊗^L_A N` is discrete for every `I`-power-torsion
`A`-module `N`. It is `I`-completely faithfully flat if that reduction is faithfully flat. The
predicate itself does not require `M` to be complete. Define finite `I`-complete Tor-amplitude `[a, b]`
using the derived reduction and all discrete `A/I`-modules. For a discrete module `M` the condition
reads `Tor_n^A(M, A/I) = 0` for `n > 0` and `M/IM` flat over `A/I`; this module form is stated in
`Suggested.lean` with Mathlib's `CategoryTheory.Tor`.

[Prisms], §1.2, p.11; [BMS19], Definition 4.1, Lemmas 4.3–4.8, pp.220–223.

*Needs:* Layer 0: Derived tensor products on module derived categories; Layer 1: Derived ideal
completeness; Mathlib `CategoryTheory.Tor`, `Module.Flat`.

Lean: `DerivedDeRham.completeFlatness`, `DerivedDeRham.IsCompletelyFlatModule`.

Prove the following named laws.

- `completeFlatReduction`: complete flatness is equivalent to flat discrete derived reduction.
- `completeFlatCompletion`: the derived `I`-completion of a flat `A`-module is `I`-completely flat.
- `completeFlatBaseChange`: derived base change followed by completion preserves complete flatness
  and complete faithful flatness.
- `completeTorAmplitude`: amplitude `[a, b]` means every derived tensor with a discrete `A/I`-module has
  cohomology in `[a, b]`.

**Checks.**

- `test_complete_flat_z`: for a prime `p`, `ℤ` as a `ℤ`-module is p-completely flat but is not derived
  p-complete.
- `test_complete_flat_zp`: `ℤ_p` is p-completely faithfully flat over `ℤ`.
- `test_complete_flat_fp_boundary`: `F_p` is not p-completely flat over `ℤ`: `F_p ⊗^L_ℤ F_p` has a
  nonzero degree `−1` term. The analogous `ℤ_p` calculation has the same obstruction.

### 1.8 Bounded torsion and complete Tor-amplitude

Assume `A` has bounded p-power torsion. If `M` is derived p-complete and has p-complete Tor-amplitude
`[a, b]`, then `M` has ordinary cohomological amplitude `[a, b]`. Bounded p-power torsion in every
cohomology group does not follow from this finite amplitude assumption. The bounded-torsion conclusion
below is restricted to the p-completely flat case `[a, b] = [0, 0]`: a derived p-complete,
p-completely flat `M` is an ordinary p-adically complete bounded-torsion module with `M/p^n` flat over
`A/p^n` and `M[p^n] ≃ M ⊗_A A[p^n]`. Conversely an ordinary p-complete bounded-torsion module satisfying
these flatness and torsion conditions is p-completely flat.

[BMS19], Lemmas 4.6–4.7 and Corollary 4.8, pp.221–223.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Complete flatness and complete faithful
flatness; Layer 1: The derived Koszul completion tower.

Lean: `DerivedDeRham.boundedTorsionCriterion`.

### 1.9 Complete faithful-flat module descent

Let `A → B` be a p-completely faithfully flat map of ordinary p-complete rings with bounded p-power
torsion. For derived p-complete `M`, the augmentation `M → Tot((M ⊗^L_A B•)^∧_p)` is an equivalence,
where `B•` is the p-completed Čech nerve and `Tot` is the product totalization of the cosimplicial
complex. Complete flatness and fixed finite p-complete Tor-amplitude are detected after this base
change. These statements concern Čech descent; hyperdescent is not asserted.

[BMS19], Remark 4.9 and the §3 flat-descent argument, pp.215–218, 223.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Complete flatness and complete faithful
flatness; Layer 1: Bounded torsion and complete Tor-amplitude; Layer 1: Derived limits of towers.

Lean: `DerivedDeRham.completeFlatDescent`.

### 1.10 Bhatt's ordinary flatness criterion

Let `A` be Noetherian, `π ∈ A`, and suppose `A` and an `A`-algebra `B` are `π`-torsion-free and
classically `π`-adically complete. If `A/π → B/π` is flat, then `A → B` is flat; if it is faithfully
flat, then `A → B` is faithfully flat. This is the Noetherian algebra criterion of Bhatt's
Proposition 5.1, not a general identification of complete flatness and ordinary flatness.

[BhattDS], Proposition 5.1 and proof, pp.8–9.

*Needs:* Layer 1: Complete flatness and complete faithful flatness; Layer 1: When ordinary quotient
towers compute completion.

Lean: `DerivedDeRham.ordinaryFlatnessFromCompleteFlatness`.

### 1.11 Quotient completeness under a nonzerodivisor condition

Let `N` be an `A`-module, `f, g ∈ A`. If `N` is derived `f`-complete then so is `N/gN`. If moreover `N`
is classically `f`-adically complete and `f` acts injectively on `N/gN`, then `N/gN` is classically
`f`-adically complete: `f`-separatedness follows from injectivity and derived completeness. No claim
that every quotient of a classically complete module is separated is made.

[BMaEtAl], Lemmas 2.7–2.8 and proof, pp.13–14.

*Needs:* Layer 1: Derived ideal completeness.

Lean: `DerivedDeRham.quotientCompleteness`, `DerivedDeRham.quotientClassicalCompleteness`.

### 1.12 Elkik algebraization of completely smooth and étale algebras

For a ring `A`, finitely generated `I ⊂ A` and a derived `I`-complete simplicial commutative
`A`-algebra `R`, if `R ⊗^L_A A/I` is a discrete smooth (respectively étale) `A/I`-algebra, then `R` is
the derived `I`-completion of a smooth (respectively étale) ordinary `A`-algebra `R′`. Conversely such
completions are completely smooth (respectively étale). No Noetherian hypothesis is imposed in the
deformation-theoretic proof of [Prisms] Footnote 6.

[Prisms], §1.2 Footnote 6 and Lemma 2.18 usage, pp.10–11, 17; [StacksSmoothing], Proposition 16.3.2,
Tag 07M8, pp.5–6.

*Needs:* Layer 1: Completion of simplicial commutative algebras; Layer 1: Complete flatness and
complete faithful flatness; Layer 1: The derived Koszul completion tower; Layer 0: Cotangent
obstruction theory for square-zero lifts; Layer 0: The smooth cotangent computation.

Lean: `DerivedDeRham.completelySmoothAlgebraization`.

### 1.13 Effectivity of compatible perfect systems

Let `A` be `I`-adically complete for a finitely generated `I`, and let `K_n ∈ D(A/I^n)` with maps
`K_(n+1) → K_n` inducing `K_(n+1) ⊗^L_(A/I^(n+1)) A/I^n ≃ K_n`. If `K₁` is perfect, then
`K = Rlim K_n` is perfect, derived `I`-complete, and `K ⊗^L_A A/I^n ≃ K_n` for all `n`; if `K₁` is only
pseudo-coherent, `K` is pseudo-coherent with the same reductions. Perfectness of each `K_n` alone,
without the compatible reductions, does not suffice.

[StacksMA], §15.99, Lemmas 15.99.1–15.99.4; Tags 0CQF, 09AV, 0CQG, 09AW, pp.287–288.

*Needs:* Layer 1: Derived limits of towers; Layer 1: Derived ideal completeness; Layer 0: Derived
tensor products on module derived categories.

Lean: `DerivedDeRham.perfectSystemEffective`.

**Checks.**

- `test_perfect_system_constant`: for `K_n = (A/I^n)[0]`, `K = A[0]`.
- `test_perfect_system_shift`: for `K_n = (A/I^n)[1] ⊕ (A/I^n)[0]` the limit is `A[1] ⊕ A[0]`, perfect
  of amplitude `[−1, 0]`.
- `test_perfect_system_incompatible`: the system `K_n = (ℤ/p^n)^(⊕n)` over `ℤ_p` with projection
  transitions has perfect terms but `K_(n+1) ⊗ ℤ/p^n ≇ K_n`, and its limit is not perfect (it has
  infinite rank modulo p); the compatibility hypothesis cannot be dropped.

*Filtered modules, Rees objects and tensor.*

Filtrations are diagrams of complexes indexed by `ℤᵒᵖ`, localized at levelwise quasi-isomorphisms.
Their reflection and monoidal structure retain the underlying object, cofibres, shifts and universal
properties.

### 1.14 Filtered derived categories

For a ring `A` define `DF(A) = DerivedCategory (ℤᵒᵖ ⥤ ModuleCat A)`, the derived category of
`ℤᵒᵖ`-indexed diagrams `F^(i+1) → F^i` of `A`-modules, `DerivedDeRham.FilteredDerived`. A filtered
object has underlying object `colim_(i→−∞) F^i` (a filtered colimit, computed levelwise), and
`gr^i F = cofib(F^(i+1) → F^i)`. Filtration shifts satisfy `(F{n})^i = F^(i+n)`. Increasing
filtrations are reindexed explicitly. A diagram in the triangulated category `D(A)` does not encode the
same data: maps in `DF(A)` are maps of diagrams up to levelwise quasi-isomorphism, with all
commutativity data.

[BMS19], §5.1, p.233, with `gr^i = cofib(F^(i+1) → F^i)`; [GP], Definitions 2.1–2.3, pp.5–7, reindexed
by `i ↦ −i`; [Bhatt12], Remark 2.4, p.5, for the derived category of the functor category as the model.

*Needs:* Mathlib `DerivedCategory`, `CategoryTheory.Functor` categories, `HasDerivedCategory.standard`.

Lean: `DerivedDeRham.filteredModules`.

Prove the following named laws.

- `filtrationAt`: evaluation `F ↦ F^i` is exact.
- `associatedGraded`: `gr^i F = cofib(F^(i+1) → F^i)`.
- `filteredShift`: `F{n}` has `i`-th value `F^(i+n)` and shifts the graded pieces by the same
  convention.
- `filteredMapExt`: a map of filtered objects is an equivalence iff every evaluation is an
  equivalence.

**Checks.**

- `test_filtered_step`: for the step filtration `F^i = M` for `i ≤ 0` and `0` for `i > 0`, `gr⁰ = M`
  and all other graded pieces vanish.
- `test_filtered_constant`: a nonzero constant filtration has every graded piece zero although its
  underlying object is nonzero.
- `test_filtered_shift`: for the preceding step `F`, `F{1}` has its sole graded piece in index `−1`.

### 1.15 Completion of a filtered object

A filtered object `F` is complete when `Rlim_(i→+∞) F^i = 0`. Its reflection is
`(F^∧)^i = cofib(Rlim_j F^j → F^i)`; its underlying object is `Rlim_i(cofib(F^i → F))`, where
`F = colim_(i→−∞) F^i`. Completion leaves every `gr^i` unchanged and `gr` is conservative on complete
filtrations. Colimits in complete filtered modules are formed by completing colimits in `DF(A)`.
Classical separatedness alone does not imply this completeness.

[GP], Definition 2.8, Lemma 2.9, Proposition 2.14, Lemma 2.15, pp.6–7; [BMS19], Lemma 5.2,
pp.233–234.

*Needs:* Layer 1: Filtered derived categories; Layer 1: Derived limits of towers.

Lean: `DerivedDeRham.filteredCompletion`.

Prove the following named laws.

- `filteredCompletionUnit`: `F → F^∧` is universal among maps to complete filtered objects.
- `filteredCompletionGraded`: `gr^i F ≃ gr^i(F^∧)` for every `i`.
- `filteredCompletionIdempotent`: `(F^∧)^∧ ≃ F^∧`.
- `gradedDetectsComplete`: a map between complete filtered objects is an equivalence exactly when all
  its graded maps are equivalences.

**Checks.**

- `test_filtered_complete_step`: the step filtration of an object is already complete.
- `test_filtered_complete_constant`: the completion of a nonzero constant filtration is zero.
- `test_filtered_separated_boundary`: the `t`-adic filtration of `k[t]` is classically separated; its
  completed underlying object is `k[[t]]`, so it is not complete as a filtered object.

### 1.16 The Rees description of filtered modules

For a filtered object `F`, define its Rees graded `A[t]`-module with `deg(t) = 1` by degree `−i` term
`F^i` and `t`-action the transition `F^i → F^(i−1)`. This yields a symmetric monoidal equivalence
`DF(A) ≃ D_gr(A[t])` with the derived category of graded `A[t]`-modules. Derived quotient by `t` has
degree `−i` term `gr^i F`, and inversion of `t` recovers the underlying object after forgetting weights.
Filtered completeness corresponds to derived `t`-completeness in the graded category; it is not
completeness of the ungraded direct sum.

[FGauges], §2.2.1, Proposition 2.2.6 and inverse, Remark 2.2.7, pp.13–17.

*Needs:* Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object; Layer 0:
Derived tensor products on module derived categories.

Lean: `DerivedDeRham.reesDescription`.

**Checks.**

- `test_rees_step`: the step filtration at `0` of `A` is the graded `A[t]`-module `A[t]` with `F^i` in
  degree `−i`.
- `test_rees_quotient`: setting `t = 1` gives the underlying `A`; derived `t = 0` gives `gr`,
  including a Tor term when `t` is not regular on the Rees module.
- `test_rees_not_ideal_rees_algebra`: the filtration `F^i = M` for `i ≤ 0` of an arbitrary module `M`
  has Rees module `M[t]`, which is not the Rees algebra of any ideal when `M` is not an ideal of `A`.

### 1.17 Completed filtered tensor products

Define `(F ⊗_fil G)^n = colim_(i+j≥n)(F^i ⊗^L_A G^j)` by Day convolution. On complete filtered objects
use `F ⊗̂_fil G = (F ⊗_fil G)^∧`. These form a symmetric monoidal structure;
`gr^n(F ⊗̂_fil G) ≃ ⊕_(i+j=n) gr^i F ⊗^L_A gr^j G`. The tensor unit is the step filtration of `A`.
Complete filtered algebras and their modules use this tensor, not the levelwise tensor.

[GP], §2.23, Theorem 2.25, Proposition 2.26, pp.9–10; [BMS19], §5.1 and Lemma 5.2, pp.233–234.

*Needs:* Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object; Layer 0:
Derived tensor products on module derived categories.

Lean: `DerivedDeRham.completedFilteredTensor`.

Prove the following named laws.

- `filteredTensorAt`: the `n`-th term is the colimit over `i + j ≥ n` before completion.
- `filteredTensorGraded`: the `n`-th graded piece is the direct sum of tensor products with `i + j = n`.
- `filteredTensorUnit`: the step filtration of `A` is the tensor unit.
- `filteredTensorSteps`: the tensor of steps in weights `i, j` is the step of the module tensor in
  weight `i + j`.

**Checks.**

- `test_filtered_tensor_unit`: tensor with the step filtration of `A` returns `F`.
- `test_filtered_tensor_two_steps`: two filtrations with sole graded pieces `A` in weight 1 have tensor
  with sole graded piece `A` in weight 2.
- `test_filtered_tensor_derived`: for step filtrations of `F_p` over `ℤ_p`, the tensor has the degree
  `−1` Tor term of `F_p ⊗^L_(ℤ_p) F_p`, so the ordinary module tensor is wrong.

*The Beilinson heart and limit estimates.*

The heart consists of actual complexes, including nonzero acyclic ones. It therefore has a different
Ext calculation from the localized derived category. Connectivity estimates justify the particular
limit exchanges needed in descent.

### 1.18 The Beilinson t-structure

`DF(A)` has the Beilinson t-structure with `DF^(≤0)_Beil = {F : gr^i F ∈ D^(≤i)(A) for all i}` and
`DF^(≥0)_Beil = {F : F^i ∈ D^(≥i)(A) for all i}`. On complete filtered objects the latter can equivalently
be tested on `gr^i F ∈ D^(≥i)`. These conventions use cohomological grading and decreasing
filtrations.

[BMS19], Theorem 5.4, pp.234–235; [BL22], Appendix D, Definition D.3, Proposition D.4 and Remark D.6,
pp.229–230.

*Needs:* Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object; Mathlib
`DerivedCategory` t-structures.

Lean: `DerivedDeRham.beilinsonTStructure`.

**Checks.**

- `test_beilinson_weight_zero`: `A` in weight zero (the step filtration) lies in the heart in degree 0.
- `test_beilinson_weight_one`: the step filtration of `A` placed in weight 1 lies in the heart only
  after the shift `A[−1]`, i.e. its graded piece is in cochain degree 1.
- `test_beilinson_zero`: the zero object satisfies both bounds, and a nonzero object concentrated in
  `gr^0` in cochain degree 1 is not in `DF^(≤0)_Beil`.

### 1.19 The Beilinson heart is the category of complexes

The Beilinson heart is equivalent to the abelian category `Ch(A)` of unbounded cochain complexes. A
complex `M•` maps to its stupid filtration `F^i = M^(≥i)` with `gr^i F = M^i[−i]`. Conversely
`H^i(gr^i F)` are its terms, and the connecting maps of adjacent cofibres give a differential squaring
to zero. Acyclic complexes can be nonzero in this heart.

[BMS19], Theorem 5.4(3) and proof, pp.234–237 (Remark 5.5 concerns décalage); [BL22], Appendix D,
Example D.8, pp.230–231.

*Needs:* Layer 1: The Beilinson t-structure; Layer 1: Filtered derived categories; Mathlib
`CochainComplex.of`.

Lean: `DerivedDeRham.beilinsonHeart`.

### 1.20 Ext groups in the category of complexes

For ordinary `A`-modules `M, N` regarded as cochain complexes in degree zero and integers `i ≥ 0`, `c`,
`Ext^i_(Ch(A))(M, N[c]) = 0` if `c > 0`, while for `c ≤ 0` it is naturally `Ext^(i+c)_A(M, N)`, with
negative-degree Ext defined to be zero. This is [BMS19] Proposition 5.6; it is not an Ext computation in
`D(A)` after quotienting acyclic complexes.

[BMS19], Proposition 5.6 and proof, pp.237–238, with the cohomological Ext indexing above.

*Needs:* Layer 1: The Beilinson heart is the category of complexes; Layer 1: The Beilinson
t-structure; Mathlib `CategoryTheory.Abelian.Ext`.

Lean: `DerivedDeRham.complexHeartExt`.

**Checks.**

- `test_heart_ext_identity_extension`: for a field `k`, `i = 1`, `c = −1`,
  `Ext¹_(Ch(k))(k, k[−1]) = Hom_k(k, k) = k`, witnessed by the two-term complex `[k → k]` with identity
  differential, a nonzero object of `Ch(k)` that is zero in `D(k)`.
- `test_heart_ext_positive_shift`: for `c = 1`, the group vanishes.
- `test_heart_ext_negative_total`: for `i + c < 0`, the group vanishes by convention.

### 1.21 The weak Postnikov tower lemma

Let `S` be a ring and let `(K_n)` be a weak Postnikov tower of connective objects of `D(S)`: the fibre
of `K_(n+1) → K_n` is `n`-connected in homological grading, and `K = Rlim_n K_n`. For an exact functor
`F : D(S) → D(S′)` that is right t-exact (it preserves connective objects), `(F(K_n))` is a weak
Postnikov tower and the canonical map `F(K) → Rlim_n F(K_n)` is an equivalence. The uniform
connectivity of the fibres is essential; right t-exactness does not assert preservation of every
inverse limit.

[BMS19], Lemma 3.3 and proof, pp.217–218.

*Needs:* Layer 1: Derived limits of towers; Mathlib `DerivedCategory` t-structures.

Lean: `DerivedDeRham.weakPostnikovTowers`.

### 1.22 Valid exchanges of completion and derived operations

Derived ideal and filtered completion are exact and commute with limits on complete objects through
their reflector descriptions. A perfect `A`-complex `P` satisfies `P ⊗^L_A Λ_I M ≃ Λ_I(P ⊗^L_A M)`. A
filtered colimit in the complete category is completed after the raw colimit. For a uniformly
cohomologically bounded-below cosimplicial diagram, filtered colimits commute with its product
totalization degreewise; the connectivity bound is necessary. The Milnor exact sequence of 1.1 retains
the derived-limit term.

[StacksMA], §§15.93, 15.95 and 15.96, pp.261–277; [BMS19], Example 5.12 and Lemma 3.3, pp.217–218,
240; [GP], Lemma 2.9 and Proposition 2.14, pp.6–7.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Completion of a filtered object; Layer 1:
Completed filtered tensor products; Layer 1: Derived limits of towers.

Lean: `DerivedDeRham.completionExchanges`.

### 1.23 The quasisyntomic cotangent condition

Fix a prime `p`. A quasisyntomic ring `A` is ordinary p-adically complete, has bounded p-power torsion,
and has `L_(A/ℤ) ⊗^L_A A/p` of Tor amplitude `[−1, 0]`. For two such rings, `A → B` is a quasisyntomic
map when it is p-completely flat and `L_(B/A) ⊗^L_B B/p` has Tor amplitude `[−1, 0]`; a cover is
p-completely faithfully flat. In these conditions `A/p` and `B/p` are ordinary quotient rings, while
the displayed module tensors are derived. The absolute condition and the morphism condition are kept
distinct.

[BMS19], Definitions 4.1 and 4.10, Remark 4.11, Example 4.12, Lemmas 4.15–4.17; pp.220, 223–225.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Avramov's absolute complete-intersection
criterion; Layer 1: Complete flatness and complete faithful flatness; Layer 1: Bounded torsion and
complete Tor-amplitude; Mathlib `IsAdicComplete`.

Lean: `DerivedDeRham.quasisyntomicCondition`.

Prove the following named laws.

- `quasisyntomicCover`: a quasisyntomic map is a cover precisely when its mod-p map is faithfully
  flat.
- `quasisyntomicComp`: composites and p-completed base changes of quasisyntomic maps are quasisyntomic,
  with bounded-torsion hypotheses inherited from the objects.
- `quasisyntomicNoetherianLci`: a p-complete Noetherian lci ring is a quasisyntomic object by Avramov's
  criterion and bounded torsion.
- `quasisyntomicRelative`: for a map between quasisyntomic objects, quasisyntomicity means both
  p-complete flatness and Tor-amplitude `[−1, 0]` of the relative cotangent complex after derived
  reduction mod p. Object membership is a separate hypothesis; [BMS19] Definition 4.10 and Lemma 4.16
  govern maps and their composition and base change.

**Checks.**

- `test_qsyn_zp`: `ℤ_p` is quasisyntomic.
- `test_qsyn_fp_map_boundary`: `F_p` is a quasisyntomic object, but both `ℤ → F_p` and `ℤ_p → F_p` fail
  p-complete flatness: derived tensor with `F_p` has a nonzero `Tor₁ = F_p`. Hence `ℤ_p → F_p` is not a
  quasisyntomic map. The absolute `ℤ` formulation and the completed `ℤ_p` formulation give the same
  object condition.
- `test_qsyn_smooth`: a p-completed smooth finitely presented algebra over a bounded-torsion
  quasisyntomic base gives a quasisyntomic map.

### Examples

The zero ideal makes every complex complete, whereas the unit ideal admits only the zero complete
complex. `ℤ` is p-completely flat but is not p-complete; `F_p` as a `ℤ`-module fails complete flatness
because `Tor₁` is nonzero. The filtered step in weight one fixes the Rees degree `−1` and the direction
of multiplication by `t`. The tower `ℤ ←p ℤ ←p ⋯` has zero limit and nonzero `lim¹`.

### Dependencies

Layer 0 (cotangent complexes, derived tensor, Avramov's criterion); IntegralHeckeAndGaloisDeterminants
§6.4 for Koszul complexes; Tau Ceti Artin–Rees; Mathlib derived categories and adic completion. The
quasisyntomic condition uses this layer's complete flatness and bounded-torsion criterion.

## Layer 2: Ordinary and derived de Rham cohomology

*Presenting differential forms.*

Use the existing forms, and present them as `A`-modules so that coefficient differentiation is
scalar-correct. The quotient presentation proves both surjectivity and the whole kernel, including
degree zero and strict alternation in characteristic two. The carriers are the abbreviations
`DeRham.Forms A B n = exteriorPower B n (KaehlerDifferential A B)` (an `A`-module by restriction of
scalars), `DeRham.Symbols A B n = (B × (Fin n → B)) →₀ A`, the basis symbol `DeRham.sym A B n c v`,
the elementary form `DeRham.elementary A B n c v = c • ιMulti (D v₁, …, D vₙ)`, the wedge product
`DeRham.wedge` of the graded exterior algebra and `DeRham.zeroForm`, all stated in `Suggested.lean`.

Sources for this group: [StacksDR], Section 10.132, the construction before Lemma 10.132.1, pp.334–336
of Commutative Algebra; [Riou], proposed `DeRham/Basic.lean`, `presentationDifferentialsDown` through
`deRhamComplex`, lines 285–434.

### 2.1 Relations for ordinary differential symbols

Let `Sₙ` be the free `A`-module on pairs `(c, v)` with `c ∈ B` and `v : {1, …, n} → B`, written
`[c; v]`. Define `Rₙ ⊂ Sₙ`, `DeRham.symbolRelations A B n`, as the `A`-span of six families
(`DeRham.relationSet`): `[c+e; v] − [c; v] − [e; v]`; `[ac; v] − a[c; v]` for `a ∈ A`; slot additivity
`[c; v(i↦x+y)] − [c; v(i↦x)] − [c; v(i↦y)]`; slot Leibniz `[c; v(i↦xy)] − [cx; v(i↦y)] − [cy; v(i↦x)]`;
`[c; v(i↦a)]` for `a ∈ A`; and `[c; v]` when `v_i = v_j` with `i ≠ j`. There is no `B`-linearity
requirement in the coefficient before applying `d`.

*Needs:* Mathlib `KaehlerDifferential.kerTotal`, `exteriorPower.presentation`.

Prove the following named laws.

- `symbolRelations_eq_span`: `Rₙ` is exactly the `A`-span of the six displayed relation families
  (definitional in `Suggested.lean`).
- `symbolRelations_coeff_add`: coefficient additivity belongs to `Rₙ`.
- `symbolRelations_slot_mul`: the slot Leibniz relation belongs to `Rₙ` for every slot.

**Checks.**

- `test_relations_degree_zero`: over `ℤ`, `[0; ()]` belongs to `R₀` and `[1; ()]` does not. The
  quotient has its nonzero degree-zero unit.
- `test_relations_constant_slot`: a differential slot filled with an element from `A` is zero in the
  quotient; over `ℤ[X]`, `[1; X]` is not a relation, since `dX` is nonzero. Taking every symbol as a
  relation fails.
- `test_relations_diagonal_char_two`: over `F₂`, the diagonal degree-two symbol is itself a relation,
  not merely twice that symbol.

### 2.2 Evaluation of differential symbols

Define `qₙ : Sₙ → Ωⁿ`, `DeRham.symbolMap`, as the `A`-linear map `[c; v] ↦ c·Dv₁ ∧ … ∧ Dvₙ` (a
`Finsupp.linearCombination`). In degree zero it sends `[c; ()]` to `c` under `Ω⁰ ≃ B`.

*Needs:* Mathlib `Finsupp.linearCombination`, `KaehlerDifferential.D`, `exteriorPower.ιMulti`,
`exteriorPower.zeroEquiv`.

Prove the following named laws.

- `symbolMap_single`: `qₙ([c; v]) = c Dv₁ ∧ … ∧ Dvₙ`.
- `symbolMap_add`: `qₙ` is additive.
- `symbolMap_smul`: for `a ∈ A`, `qₙ(a s) = a qₙ(s)`.

**Checks.**

- `test_symbolMap_zero_degree`: evaluation in weight zero agrees with the existing `zeroEquiv`.
- `test_symbolMap_one_degree`: evaluation in weight one agrees with `c` times the universal
  derivation.
- `test_symbolMap_repeated`: the image of `[c; x, x]` is zero in every characteristic.

### 2.3 Differential symbols generate all forms

The map `qₙ` is surjective for every `n ≥ 0`; equivalently the forms `c Dv₁ ∧ … ∧ Dvₙ` span `Ωⁿ` as an
`A`-module.

*Needs:* Layer 2: Evaluation of differential symbols; Mathlib `KaehlerDifferential.span_range_derivation`,
`exteriorPower.ιMulti_span_of_span`, `exteriorPower.zeroEquiv`.

Lean: `DeRham.symbolMap_surjective`.

### 2.4 The differential-symbol presentation

For every `n`, `ker(qₙ) = Rₙ`. Thus `Sₙ/Rₙ` is canonically `Ωⁿ` as an `A`-module, including `n = 0`.

*Needs:* Layer 2: Relations for ordinary differential symbols; Layer 2: Evaluation of differential
symbols; Layer 2: Differential symbols generate all forms; Mathlib
`KaehlerDifferential.quotKerTotalEquiv`, `exteriorPower.presentation`, `Submodule.liftQ`,
`Module.Presentation.restrictScalars`.

Lean: `DeRham.symbolRelations_ker`.

*Constructing the differential.*

Descend the free-symbol rule by checking each relation, then prove uniqueness, square-zero and the
graded product identity. The leading differentiated coefficient is the first wedge slot. Sources as
for the preceding group.

### 2.5 Differentiating a free differential symbol

Define `δₙ : Sₙ → Ωⁿ⁺¹`, `DeRham.freeDifferential`, as the `A`-linear map
`[c; v] ↦ Dc ∧ Dv₁ ∧ … ∧ Dvₙ`. This uses the coefficient as the first slot, with positive sign.

*Needs:* Mathlib `Finsupp.linearCombination`, `KaehlerDifferential.D`, `exteriorPower.ιMulti`.

Prove the following named laws.

- `freeDifferential_single`: `δₙ([c; v]) = Dc ∧ Dv₁ ∧ … ∧ Dvₙ`.
- `freeDifferential_add`: the free differential preserves sums.
- `freeDifferential_smul`: the free differential is `A`-linear on free-module coefficients.

**Checks.**

- `test_freeDifferential_unit`: symbols with coefficient one have zero differential.
- `test_freeDifferential_zero_degree`: in weight zero the free differential agrees with `D` after
  `oneEquiv`.
- `test_freeDifferential_diagonal`: `δ₁([x; x]) = Dx ∧ Dx = 0`, while over `ℤ[X,Y]`,
  `δ₁([X; Y]) = dX ∧ dY ≠ 0`. This also detects a zero differential in positive weights and fixes the
  positive leading-slot sign.

### 2.6 The free differential kills every relation

For every `n`, `Rₙ ⊂ ker(δₙ)`, so `δₙ` depends only on the represented ordinary form.

*Needs:* Layer 2: Relations for ordinary differential symbols; Layer 2: Differentiating a free
differential symbol; Mathlib `Derivation.leibniz`, `Derivation.map_algebraMap`,
`AlternatingMap.map_eq_zero_of_eq`, `AlternatingMap.map_swap`.

Lean: `DeRham.freeDifferential_relations`.

### 2.7 The ordinary de Rham differential

For every `n ≥ 0` define `dₙ : Ωⁿ → Ωⁿ⁺¹`, `DeRham.d A B n`, `A`-linear, as the descent of `δₙ` along
`qₙ` (by 2.4 and 2.6). It is characterized by `dₙ(c Dv₁ ∧ … ∧ Dvₙ) = Dc ∧ Dv₁ ∧ … ∧ Dvₙ`; this
characterizing property is the predicate `DeRham.IsDeRhamDifferential` of `Suggested.lean`, which
states existence and uniqueness of such a map as `DeRham.existsUnique_isDeRhamDifferential`. The scalar
ring is `A`; in general `d` is not `B`-linear. The intended Lean signature is

```lean
DeRham.d (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] (n : ℕ) :
    DeRham.Forms A B n →ₗ[A] DeRham.Forms A B (n + 1)
```

*Needs:* Layer 2: The differential-symbol presentation; Layer 2: The free differential kills every
relation; Layer 2: Differential symbols generate all forms; Mathlib `Submodule.liftQ`,
`exteriorPower.oneEquiv`, `KaehlerDifferential.polynomialEquiv_D`, `Polynomial.derivative_X`,
`KaehlerDifferential.mvPolynomialBasis`.

Prove the following named laws.

- `d_add`: `dₙ(α + β) = dₙα + dₙβ`.
- `d_base_smul`: for `a ∈ A`, `dₙ(aα) = a dₙα`.
- `d_zero_degree`: transport `d₀` along `Ω⁰ ≃ B` and `Ω¹ ≃ Ω` to recover the pinned universal
  derivation.

**Checks.**

- `test_d_base_constant`: the differential of the image of a base-ring constant is zero.
- `test_d_polynomial_X`: the differential of `X` in `ℤ[X]` over `ℤ` is nonzero, so the zero operator
  fails.
- `test_d_polynomial_X_char_two`: the differential of `X` in `F₂[X]` over `F₂` is still nonzero.
- `test_d_two_variables`: in `ℤ[X,Y]`, `d(X dY) = dX ∧ dY` and this two-form is nonzero. This detects a
  zero positive-degree differential and fixes the leading-slot sign.

### 2.8 Differential of an elementary form

`dₙ(c Dv₁ ∧ … ∧ Dvₙ) = Dc ∧ Dv₁ ∧ … ∧ Dvₙ`, for every `n` including zero.

*Needs:* Layer 2: The ordinary de Rham differential; Layer 2: Evaluation of differential symbols;
Layer 2: Differentiating a free differential symbol.

Lean: `DeRham.d_elementary`.

### 2.9 Uniqueness from elementary forms

An `A`-linear map `Ωⁿ → Ωⁿ⁺¹` satisfying the displayed elementary-form rule equals `dₙ`.

*Needs:* Layer 2: Differential symbols generate all forms; Layer 2: Differential of an elementary form.

Lean: `DeRham.d_unique`.

### 2.10 The de Rham differential squares to zero

For every `n`, `dₙ₊₁ ∘ dₙ = 0` as an `A`-linear map `Ωⁿ → Ωⁿ⁺²`.

*Needs:* Layer 2: Differential of an elementary form; Layer 2: Differential symbols generate all forms;
Mathlib `Derivation.map_one_eq_zero`.

Lean: `DeRham.d_squared` (stated in `Suggested.lean` for any pair of maps satisfying
`IsDeRhamDifferential`).

### 2.11 The graded Leibniz identity

For `α ∈ Ωᵐ` and `β ∈ Ωⁿ`, `d(α ∧ β) = dα ∧ β + (−1)ᵐ α ∧ dβ`. The product is the existing graded
multiplication of the exterior algebra.

*Needs:* Layer 2: Differential of an elementary form; Layer 2: Differential symbols generate all forms;
Mathlib `Derivation.leibniz`, `ExteriorAlgebra.gradedAlgebra`, `AlternatingMap.map_swap`.

Lean: `DeRham.d_leibniz`.

### 2.12 The ordinary algebraic de Rham complex

Define `Ω•_(B/A)`, `DeRham.complex A B`, as the nonnegative cochain complex of `A`-modules with degree
`n` object `Ωⁿ` and differential `dₙ` (built with `CochainComplex.of` from 2.10). Its multiplication is
the existing wedge product and satisfies the graded Leibniz identity. This is the ordinary complex, not
a derived smooth comparison in characteristic zero. The intended Lean signature is

```lean
DeRham.complex (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    CochainComplex (ModuleCat.{u} A) ℕ
```

*Needs:* Layer 2: The ordinary de Rham differential; Layer 2: The de Rham differential squares to
zero; Layer 2: The graded Leibniz identity; Mathlib `CochainComplex.of`.

Prove the following named laws.

- `complex_d_apply`: the adjacent differential of `Ω•` is `dₙ`.
- `complex_d_nonadjacent`: every nonadjacent differential is zero.
- `complex_X`: the object in degree `n` is the existing module `Ωⁿ`, restricted to `A`.

**Checks.**

- `test_complex_degree_zero`: the first arrow agrees with the universal derivation after the existing
  degree-one equivalence.
- `test_complex_two_steps`: the first two arrows compose to zero on each `b`.
- `test_complex_base_ring`: over `A → A` the first differential is zero.

*Pullback and the ordinary universal property.*

Extend the existing semilinear Kähler map to exterior powers. The resulting complex maps and
differential-algebra universal property are the functorial input for polynomial realization.

### 2.13 Pullback of ordinary differential forms

For an `A`-algebra homomorphism `f : B → C`, extend the pinned `KaehlerDifferential.mapSemilinear` to
`f`-semilinear maps `f*ₙ : Ωⁿ_(B/A) → Ωⁿ_(C/A)`, `DeRham.pullback f n`. On elementary forms,
`c Dv₁ ∧ … ∧ Dvₙ` maps to `f(c) D(fv₁) ∧ … ∧ D(fvₙ)`; this characterization is the predicate
`DeRham.IsFormPullback` of `Suggested.lean`, with existence and uniqueness stated as
`DeRham.existsUnique_isFormPullback`. These maps are `A`-linear as well, but in general are not
`B`-linear for an unrelated `B`-action on `C`. The intended Lean signature is

```lean
DeRham.pullback {A B C : Type u} [CommRing A] [CommRing B] [CommRing C] [Algebra A B]
    [Algebra A C] (f : B →ₐ[A] C) (n : ℕ) :
    DeRham.Forms A B n →ₛₗ[f.toRingHom] DeRham.Forms A C n
```

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336; [Riou], lines 285–434.

*Needs:* Tau Ceti `KaehlerDifferential.mapSemilinear`, `KaehlerDifferential.mapSemilinear_D`; Mathlib
`exteriorPower.alternatingMapLinearEquiv`.

Prove the following named laws.

- `pullback_smul`: pullback is `f`-semilinear in `B`-scalars.
- `pullback_base_smul`: pullback is linear in `A`-scalars.
- `pullback_add`: pullback preserves sums of forms.

**Checks.**

- `test_pullback_zero_degree`: degree-zero pullback agrees with `f` under the existing zero
  equivalence.
- `test_pullback_one_degree`: degree-one pullback agrees with the pinned Kähler `mapSemilinear`.
- `test_pullback_identity_two`: the identity fixes an arbitrary degree-two form.

### 2.14 Pullback on elementary differential forms

Pullback sends `c Dv₁ ∧ … ∧ Dvₙ` to `f(c) D(fv₁) ∧ … ∧ D(fvₙ)`.

*Needs:* Layer 2: Pullback of ordinary differential forms; Tau Ceti `KaehlerDifferential.mapSemilinear_D`.

Lean: `DeRham.pullback_elementary`.

### 2.15 Pullback commutes with the differential

For every `A`-algebra map `f : B → C` and `n`, `f*ₙ₊₁(dₙω) = dₙ(f*ₙω)`.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential of an elementary form;
Layer 2: Differential symbols generate all forms; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_d`.

### 2.16 Pullback preserves wedge products

For every `A`-algebra homomorphism `f`, `f*(α ∧ β) = f*α ∧ f*β`, with the existing exterior products.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all
forms; Mathlib `ExteriorAlgebra.gradedAlgebra`; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_wedge`.

### 2.17 Identity pullback

For every `n`, pullback along `id_B` is the identity on `Ωⁿ`.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all
forms; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_id`.

### 2.18 Composition of pullbacks

For `f : B → C` and `g : C → E` of `A`-algebras, pullback along `g ∘ f` equals `g* ∘ f*` in every
degree.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all
forms; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_comp`.

### 2.19 The functorial map of ordinary de Rham complexes

An `A`-algebra homomorphism `f : B → C` induces a morphism `Ω•_(B/A) → Ω•_(C/A)` in
`CochainComplex (ModuleCat A) ℕ`, `DeRham.complexMap f`, whose degree-`n` map is `f*ₙ`. These maps
preserve identities, composition and wedge multiplication.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: Pullback commutes with the
differential; Layer 2: Pullback preserves wedge products; Layer 2: Identity pullback; Layer 2:
Composition of pullbacks.

Prove the following named laws.

- `complexMap_apply`: the degree-`n` component is `pullback f n`.
- `complexMap_id`: the complex map of `id` is the identity.
- `complexMap_comp`: the complex map of `g ∘ f` is the categorical composite of the two complex maps.

**Checks.**

- `test_complexMap_constant`: in degree zero, the complex map takes `b` to `f(b)`.
- `test_complexMap_identity`: the identity map of `B` induces the identity in degree one.
- `test_complexMap_d`: the degree-one image of `db` is `d(fb)`.

### 2.20 Ordinary polynomial base change and Künneth

For an ordinary base square `A → A′`, `B′ = B ⊗_A A′`, the ordinary differential graded de Rham algebra
satisfies `Ω•_(B/A) ⊗_A A′ ≃ Ω•_(B′/A′)`, with its ordinary tensor and Hodge filtration; in each degree
this is the linear equivalence `A′ ⊗_A Ωⁿ_(B/A) ≃ Ωⁿ_(B′/A′)` stated in `Suggested.lean`. For polynomial
`A`-algebras `B, C`, `Ω•_(B ⊗_A C/A) ≃ Ω•_(B/A) ⊗_A Ω•_(C/A)`, including the signed differential and
degree-sum filtration. In the polynomial case these complexes are termwise flat, so the derived tensor
computes the same object. The ordinary formula does not justify replacing a derived algebra pushout by
an ordinary pushout outside Tor independence.

[Bhatt12], Proposition 2.7 proof, p.6.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: The functorial map of ordinary
de Rham complexes; Layer 2: The graded Leibniz identity; Layer 2: Pullback of ordinary differential
forms; Mathlib `KaehlerDifferential.D`.

Lean: `DerivedDeRham.ordinaryBaseChangeKunneth` (degreewise linear part in `Suggested.lean`).

**Checks.**

- `test_ordinary_base_change_degree_zero`: for `n = 0` the equivalence is `A′ ⊗_A B ≃ B′`.
- `test_ordinary_base_change_line`: for `B = A[t]`, `Ω¹_(B′/A′) = A′[t] dt`.
- `test_ordinary_kunneth_sign`: for `B = A[t]`, `C = A[u]`, the differential of `dt ⊗ u` is
  `−dt ⊗ du`, matching `d(u dt) = du ∧ dt = −dt ∧ du` in `Ω²_(A[t,u]/A)`.

### 2.21 The universal differential graded algebra

For an `A`-algebra `B`, `Ω•_(B/A)` is initial among nonnegatively graded strictly graded-commutative
differential graded `A`-algebras `D` with odd squares zero and an `A`-algebra map `B → D⁰`. The unique
dg map sends `b` to its degree-zero image and `db` to its differential, hence `b₀ db₁ ∧ … ∧ db_n` to
`f(b₀) d f(b₁) … d f(b_n)`. The odd-square condition is part of the target even in characteristic 2.

[Prisms], §4, construction of the Hodge–Tate map after Lemma 4.10, pp.39–40; [StacksDR], Section
10.132, pp.334–336.

*Needs:* Layer 2: The differential-symbol presentation; Layer 2: Differential of an elementary form;
Layer 2: The de Rham differential squares to zero; Layer 2: The graded Leibniz identity; Layer 2: The
ordinary algebraic de Rham complex.

Lean: `DerivedDeRham.ordinaryDeRhamUniversalProperty`.

**Checks.**

- `test_universal_dga_identity`: the identity of `Ω•_(B/A)` is the map attached to `B → Ω⁰`.
- `test_universal_dga_zero`: for the zero dg algebra the unique map is zero.
- `test_universal_dga_odd_square`: over `F₂`, let `D = F₂[t, e]` with `e` in degree 1, `dt = e`,
  `de = 0`; it is graded-commutative (signs are trivial) with `e² ≠ 0`. The map `F₂[t] → D⁰` has no
  extension to `Ω•_(F₂[t]/F₂)`, since `(dt)² = 0` would map to `e²`; this is why the universal property
  is stated among algebras with odd squares zero.

*Polynomial realization and the Hodge filtration.*

Realize the ordinary de Rham functor on polynomial resolutions, with the multiplicative structure of
the shuffle product and the comparison maps of 0.1.

### 2.22 De Rham cohomology from polynomial resolutions

For a ring map `A → B`, define `dR_(B/A)`, `DerivedDeRham.ofPolynomialResolution A B`, as the
direct-sum totalization `|Ω•_(P•/A)|` of the bicomplex of de Rham complexes of the standard resolution
`P• → B` (simplicial degree `n` in cohomological degree `−n`), with its decreasing Hodge filtration
`Fil_H^i = |Ω^(≥i)_(P•/A)|`, an object of `DF(A)`. The Eilenberg–Zilber shuffle product makes it a
strictly graded-commutative differential graded `A`-algebra with multiplicative Hodge filtration. It is
natural in commutative squares of ring maps. Any polynomial resolution computes it up to canonical
filtered quasi-isomorphism of dg algebras: each `|Ω^(<i)|`, each `|Ω^i|` and each conjugate stage
`|τ^(≤i)Ω•|` is the value on `P•` of a functor of polynomial algebras over `B` with values in complexes,
so 0.1 identifies its values on any two resolutions, and the direct-sum totalization is the filtered
colimit of the conjugate stages ([Bhatt12] Proposition 2.3 and its proof, p.5). No Hodge completeness is
imposed; the completion is a separate reflection. The construction is not the ordinary smooth
de Rham complex over every base. The intended Lean signature is

```lean
DerivedDeRham.ofPolynomialResolution (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    DerivedCategory (ℤᵒᵖ ⥤ ModuleCat.{u} A)
```

with the dg-algebra structure carried by the strict model.

[Bhatt12], Definition 2.1, its explanatory paragraph, Remarks 2.2 and 2.4 and Proposition 2.3,
pp.5–6; [StacksCt], Remark 5.5 and Lemmas 5.6–5.7, Tags 08QI, 08QJ, 08QK, pp.9–10; [DoldPuppe] §2
(the generalized Eilenberg–Zilber theorem), pp.211–219.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: The functorial map of ordinary
de Rham complexes; Layer 0: Simplicial polynomial resolutions; Layer 1: Filtered derived categories.

Prove the following named laws.

- `map`: a morphism of `A`-algebras induces a map of the Hodge-filtered derived de Rham dg algebras,
  with identity and composition laws.
- `resolutionEquiv`: two polynomial resolutions of `B` give quasi-isomorphic Hodge-filtered dg
  algebras; the comparison respects the augmentation and is the one induced by any map of
  resolutions over `B`.
- `hodgeFiltration`: `Fil_H^i` is the realization of the subcomplex of polynomial forms of degrees at
  least `i`, with decreasing transition maps and multiplication `Fil_H^i ⊗ Fil_H^j → Fil_H^(i+j)`.

**Checks.**

- `test_identity_algebra`: for `A → A`, `dR_(A/A)` is `A` concentrated in degree zero.
- `test_hodge_zero_quotient`: for an `A`-algebra `B`, the degree-zero Hodge quotient `gr_H^0 dR_(B/A)` is
  `B` in degree zero.
- `test_rational_laurent_boundary`: for `ℚ → ℚ[t, t⁻¹]`, uncompleted `dR` is `ℚ`, whereas ordinary
  degree-one de Rham cohomology is `ℚ·dt/t`. The unrestricted uncompleted smooth comparison fails.

### 2.23 Derived base change and Künneth

There are natural equivalences `dR_((B ⊗^L_A C)/A) ≃ dR_(B/A) ⊗^L_A dR_(C/A)` and
`dR_(B/A) ⊗^L_A C ≃ dR_((B ⊗^L_A C)/C)`, where `B ⊗^L_A C` is the simplicial ring `P• ⊗_A Q•` of polynomial
resolutions and `dR` of a simplicial ring is computed on the diagonal. All tensor products are derived.

[Bhatt12], Proposition 2.7 and proof, p.6.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Ordinary polynomial base
change and Künneth; Layer 0: Derived tensor products on module derived categories; Layer 0: The
cotangent complex of a map of simplicial rings and the diagonal comparison.

Lean: `DerivedDeRham.baseChangeKunneth`.

**Checks.**

- `test_kunneth_identity`: for `C = A`, both equivalences are the identity of `dR_(B/A)`.
- `test_kunneth_polynomial`: for `B = A[t]`, `C = A[u]`, the Künneth map is the ordinary
  `Ω•_(A[t,u]/A) ≃ Ω•_(A[t]/A) ⊗ Ω•_(A[u]/A)` with the signed differential.
- `test_kunneth_tor`: for `A = ℤ`, `B = C = F_p`, `B ⊗^L_ℤ C` has `π₁ = F_p`, so the ordinary pushout
  `F_p` cannot be used: `dR_(F_p/ℤ) ⊗^L_ℤ F_p` has nonzero `H^−1`.

### 2.24 Hodge graded pieces of derived de Rham

For `A → B`, `gr_H^i dR_(B/A) ≃ L∧^i_B L_(B/A)[−i]` naturally as `B`-modules for every `i ≥ 0`. The
degree-zero quotient is `B`. Proof: `gr_H^i` is the realization of `Ω^i_(P•/A)`, the value on `P•` of
the functor `P ↦ Ω^i_(P/A)`; [StacksCt] Lemma 5.6 (Tag 08QJ) replaces it by
`Ω^i_(P•/A) ⊗_(P•) B = ∧^i_B(Ω_(P•/A) ⊗_(P•) B)`, the levelwise exterior power of the simplicial free
`B`-module that models `L_(B/A)`, which is `L∧^i L_(B/A)` by 0.3 and 0.14. The differential of the
filtered algebra induces the universal derivation on the first Hodge boundary; the full de Rham
differential is formed before realization, not defined only on cotangent homology.

[BL22], Appendix E, Construction E.2, pp.232–233; [StacksCt] Lemmas 5.6–5.7, Tags 08QJ, 08QK,
pp.9–10.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 0: The full cotangent complex;
Layer 0: Derived exterior powers; Layer 0: Simplicial polynomial resolutions; Layer 1: Filtered derived
categories.

Lean: `DerivedDeRham.hodgeGradedPieces`.

**Checks.**

- `test_hodge_graded_identity`: for `A → A`, `gr^0 = A` and `gr^i = 0` for `i > 0`.
- `test_hodge_graded_line`: for `A[t]`, `gr^1 = A[t] dt [−1]`, in cohomological degree 1.
- `test_hodge_graded_regular_quotient`: for `A → A/(f)` with `f` regular, `L = (f)/(f²)[1]` and
  `gr^i = Γ^i((f)/(f²))` in degree zero, by 0.17.

### 2.25 Hodge-completed derived de Rham

Define `dR^hc_(B/A) = Rlim_i(dR_(B/A)/Fil_H^i)`, `DerivedDeRham.hodgeCompletedDerham`, with its complete
decreasing filtration as the Layer 1 reflection of the Hodge-filtered object; on the strict model it is
the product totalization. The natural `dR → dR^hc` map is universal among maps to complete
Hodge-filtered objects and leaves every graded piece `L∧^i L_(B/A)[−i]` unchanged. Hodge completion and
p-completion are different operations.

[BL22], Appendix E, Construction E.14 and Remark E.15, p.235.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge graded pieces of
derived de Rham; Layer 1: Completion of a filtered object; Layer 1: Completed filtered tensor products.

Prove the following named laws.

- `hodgeCompletionMap`: the canonical filtered algebra map `dR → dR^hc` is the Layer 1 reflection
  unit.
- `hodgeCompletionGraded`: `gr_H^i dR^hc ≃ L∧^i L_(B/A)[−i]`.
- `hodgeCompletionUniversal`: maps to complete Hodge-filtered dg algebras factor uniquely through
  `dR^hc`.
- `hodgeCompletionFunctorial`: the unit and completion are natural in commutative base squares, with
  completed base-change comparisons under the separate stated hypotheses.

**Checks.**

- `test_hodge_complete_base`: `dR^hc_(A/A) = A`.
- `test_hodge_complete_rational_laurent`: for `ℚ[t, t⁻¹]/ℚ`, the completed complex is ordinary
  de Rham, with `H¹ = ℚ·dt/t`, whereas uncompleted `dR = ℚ`.
- `test_hodge_complete_dual_numbers`: for `R = F₂[t]/t²`, the regular-quotient crystalline model is the
  de Rham complex of `D = D_(F₂[t])((t²))`. Write `u_j = γ_(2^j)(t²)`, `j ≥ 1`. Its degree-zero ring is
  `F₂[t, u₁, u₂, …]/(t⁴, u₁², u₂², …)`, and `d(u_j) = 0`. The Hodge completion contains the closed class
  `Σ_(j≥1) u_j`, whose terms have weights `2^j`; it has no representative in `D`, where every element
  is a finite polynomial. Thus `H⁰(dR) → H⁰(dR^hc)` is not surjective. The comparison uses [Bhatt12],
  Theorem 3.27 and the regular PD computation, pp.13, 16–19; it tests completion rather than
  separatedness.

### 2.26 p-completed derived de Rham

For `A → B` define `dR̂_(B/A) = Λ_(p) dR_(B/A) = Rlim_n(dR_(B/A) ⊗^L_ℤ ℤ/p^n)`,
`DerivedDeRham.pCompletedDerham`. Apply p-completion to every Hodge filtration term, and use completed
tensor for its multiplication. A p-completed increasing conjugate diagram is not automatically
exhaustive before a bounded-connectivity argument. For maps of p-completely flat bounded-torsion
algebras the mod-p computation uses the ordinary reductions; general reductions are simplicial.

[Bhatt12], Definition 8.1, Lemmas 8.2–8.3, pp.31–32; [BL22], Appendix E, Construction E.3 and Remark
E.4, p.233.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 1: The derived completion
reflector; Layer 1: When ordinary quotient towers compute completion; Layer 1: Completed filtered
tensor products.

Prove the following named laws.

- `pCompletedDeRhamMod`: the reduction of `dR̂` modulo `p^n` is the derived de Rham reduction,
  compatibly in `n`.
- `pCompletedDeRhamInputs`: completing `A` and `B` at `p` does not change the p-completed de Rham
  construction with the derived base-change conventions.
- `pCompletedDeRhamKunneth`: the base-change and Künneth comparison uses p-completed derived tensor and
  derived pushouts.
- `pHodgeCompletionCommute`: applying p-completion and Hodge completion in either order gives the same
  quotient-limit object, since the relevant completion functors commute with limits.

**Checks.**

- `test_p_derham_identity`: for `A = A`, `dR̂_(A/A)` is `Λ_p A`.
- `test_p_derham_inverted`: for `ℚ_p → ℚ_p`, p-completed de Rham is zero, while Hodge-completed de Rham
  is `ℚ_p`.
- `test_p_derham_fp_over_zp`: for `F_p/ℤ_p`, `dR̂` is the p-completed PD two-term model of Layer 4,
  retaining the extra completed torsion summands in `H⁰` and the two-term differential; it is not
  `ℤ_p`.

### 2.27 The de Rham algebra of a completely smooth formal algebra

Let `A` be p-complete with bounded p-power torsion and `B` a p-completely smooth p-complete
`A`-algebra. Define continuous differentials `Ω̂¹_(B/A) = L̂_(B/A)` in degree zero, finite projective
over `B`; define `Ω̂^n = ∧^n_B Ω̂¹` and the continuous differential by `d(b₀ db₁ ∧ … ∧ db_n) =
db₀ ∧ … ∧ db_n`. These form the p-complete ordinary de Rham dg algebra,
`DerivedDeRham.formalOrdinaryDerham`. Its universal property is among termwise p-complete strictly
graded-commutative `A`-dg algebras with odd squares zero, continuous differential and a continuous map
`B → D⁰`.

[Prisms], §1.2; §4 Hodge–Tate universal map after Lemma 4.10, pp.10–11, 39–40.

*Needs:* Layer 1: Elkik algebraization of completely smooth and étale algebras; Layer 1: Complete
flatness and complete faithful flatness; Layer 0: The smooth cotangent computation; Layer 2: The
universal differential graded algebra; Layer 2: The ordinary algebraic de Rham complex;
SchemeAndStackFoundations §4.7 (`Formal.AdicRing`, `Spf`).

Prove the following named laws.

- `continuousDerivation`: the continuous derivation `B → Ω̂¹` agrees with the completed polynomial
  universal derivation.
- `formalDeRhamUniversal`: a continuous degree-zero map into the stated dg target extends uniquely by
  `b₀db₁…db_n ↦ f(b₀) df(b₁) … df(b_n)`.
- `formalDeRhamMap`: continuous maps of completely smooth formal algebras induce the differential-algebra
  pullback.
- `formalDeRhamReduction`: modulo `p^n` this is the ordinary smooth de Rham algebra of the
  corresponding finite reduction.

**Checks.**

- `test_formal_derham_base`: for `B = A`, `Ω̂¹ = 0` and the complex is `A`.
- `test_formal_derham_coordinate`: for `B = ℤ_p⟨t⟩`, `d(t) = dt` generates the finite projective
  continuous differential module.
- `test_formal_derham_char_two_square`: over a 2-complete base, `(dt)² = 0` in the exterior dg algebra;
  mere graded commutativity is insufficient.

### 2.28 Derived de Rham transitivity filtrations

For `A → B → C` construct the base-forms filtration on `dR_(C/A)`, whose weight-`i` graded term is
`dR_(C/B) ⊗^L_B L∧^i_B L_(B/A)[−i]`. Its boundary maps encode the Gauss–Manin connection; it does not
canonically split. Separately, for composable `F_p`-algebras, [Bhatt12] Proposition 3.22 gives an
increasing relative conjugate filtration with `gr_n = dR_(B/A) ⊗^L_(B^(1)) Frob_A^*(Res^C_B(L∧^n_C
L_(C/B)[−n]))`, where `Frob_A^*` is extension along the base-change map `B → B^(1)`, `b ↦ b ⊗ 1`. This
uses the Frobenius-descent connection. Finite Hodge quotients and specified completions retain the
extension data; no de Rham-with-coefficients theory beyond this filtration is asserted. The relative
cotangent exterior power is formed over `C`; only afterwards is it regarded as a `B`-module for this
Frobenius base change. The filtration is built levelwise on a polynomial resolution `P•` of `B` and a
termwise polynomial `P•`-algebra resolution `Q•` of `C` (the proof of [Bhatt12] Proposition 3.22),
with the classical Katz transitivity for smooth maps.

[Bhatt12], Proposition 3.22 and Remark 3.23, pp.11–12; [BL22], Appendix E, Construction E.2,
pp.232–233.

*Needs:* Layer 0: The cotangent transitivity triangle; Layer 0: Exterior powers of a triangle and
décalage; Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Ordinary polynomial base
change and Künneth; Layer 1: Filtered derived categories; Layer 1: Valid exchanges of completion and
derived operations.

Lean: `DerivedDeRham.deRhamTransitivity`.

**Checks.**

- `test_transitivity_filtration_base`: for `A = B`, the filtration reduces to `dR_(C/B)` in weight 0.
- `test_transitivity_filtration_top`: for `B = C`, it reduces to the Hodge filtration of `dR_(B/A)`
  with `dR_(B/B) = B`.
- `test_transitivity_filtration_polynomial`: for `A → A[t] → A[t,u]`, the filtration is the `t`-form
  degree filtration, with the Gauss–Manin differential and no canonical splitting of the complex of
  `A`-modules.

### 2.29 Hodge pieces of a singular hypersurface

For `k = F_p` and `B = k[t]/(t²)`, the full cotangent complex is `[B e --2t→ B dt]` in degrees `−1, 0`.
Thus `gr_H¹ dR_(B/k) = L_(B/k)[−1]` has `B e` in degree zero and `B dt` in degree one. Its higher Hodge
pieces are the derived exterior powers of this two-term complex, with divided powers of the degree `−1`
generator. For `p = 2` the displayed differential vanishes; replacing `L` by `Ω¹` loses the nonzero
degree-zero Hodge-weight-one term. This is a singular lci algebra, distinguished from the non-lci
square-zero example.

[Bhatt12], §3.3, regular quotient computations and Lemma 3.42, pp.17–18.

*Needs:* Layer 0: Regular quotients and two-term models; Layer 0: Derived exterior powers; Layer 0:
Derived divided powers; Layer 0: Exterior powers of a triangle and décalage; Layer 2: Hodge graded
pieces of derived de Rham.

Lean: `DerivedDeRham.singularHypersurfaceHodge`.

**Checks.**

- `test_hypersurface_weight_one`: `gr_H¹` has `H⁰ = ker(2t : Be → Bdt)` and `H¹ = B dt/(2t)`; at `p = 2`
  both are `B`.
- `test_hypersurface_weight_two`: by 0.17, `gr_H²` is built from `Γ²(Be)` in degree zero and
  `Be ⊗ Bdt` in degree one, with connecting map `γ₂(e) ↦ 2t e ⊗ dt`; so `H⁰(gr_H²)` contains
  `t γ₂(e) ≠ 0` at every `p`, and is all of `Γ²(Be)` when `p = 2`.
- `test_hypersurface_not_omega`: `Ω²_(B/k) = 0` while `gr_H²` is nonzero.

### Examples

For a polynomial coordinate `t`, `d(t²) = 2t dt`; at characteristic 2 it is zero although `dt` is
nonzero. The two-coordinate formula `d(x dy) = dx ∧ dy` and `dy ∧ dx = −dx ∧ dy` fixes the graded sign
without dividing by 2. The rational Laurent line has the ordinary class `dt/t`, while its uncompleted
derived de Rham object is `ℚ`. The characteristic-2 PD example above distinguishes Hodge completion
from separatedness.

### Dependencies

Layers 0–1 supply cotangent powers, resolutions, completion and complete filtered tensor. Mathlib and
Tau Ceti supply the Kähler, exterior and pullback carriers. Scheme realization is constructed after
descent in Layer 5.

## Layer 3: Conjugate filtration and Cartier theory

Use the characteristic-p conjugate filtration to construct Cartier theory and the Frobenius-lift
splitting. These then give the singular and rational-completion boundary examples and the smooth
comparisons.

### 3.1 Frobenius-linear ordinary differential

Let `p` be prime and `A → B` a map of characteristic-p commutative rings. For every `b ∈ B` and
`ω ∈ Ωⁿ_(B/A)`, `dₙ(bᵖω) = bᵖ dₙω`. Thus the ordinary differential is linear for the `B`-action through
Frobenius, the algebraic input to the `B^(1)`-action.

[Bhatt12], Notation 3.1, final paragraph, p.6.

*Needs:* Layer 2: The graded Leibniz identity; Mathlib `Derivation.leibniz_pow`.

Lean: `DeRham.d_frobenius_smul` (stated in `Suggested.lean` for maps satisfying
`IsDeRhamDifferential`).

**Checks.**

- `test_frobenius_linear_cube`: for `F_p[t]`, `d(t^p · t) = t^p dt`; at `p = 2`, `d(t³) = t² dt`.
- `test_frobenius_linear_kills_pth_power`: `d(t^p) = 0` while `t^p ≠ 0`.
- `test_frobenius_not_b_linear`: `d(t · t) = 2t dt ≠ t dt` for `p ≠ 2`, so `d` is not `B`-linear for the
  ordinary action.

### 3.2 The conjugate filtration

Construct `Fil_i^conj dR_(B/A) = |τ^(≤i) Ω•_(P•/A)|` for `i ≥ 0`, `DerivedDeRham.conjugateFiltration`,
with `Fil_−1 = 0`, natural increasing maps, and `colim_i Fil_i^conj ≃ dR_(B/A)`. Its graded piece is
`|H^i(Ω•_(P•/A))|[−i]`. The filtration is multiplicative and, over `F_p`, linear over `B^(1)` via
Cartier; an exhaustive direct-sum realization is not a completed or global convergence assertion. Here
`P• → B` is any polynomial resolution; independence of the resolution is 0.1 applied to the functors
`P ↦ τ^(≤i) Ω•_(P/A)`. As an increasing filtration it is an object of `DF(A)` after the reindexing
`i ↦ −i`. Spectral-sequence applications keep the bounded-below increasing filtration and the further
convergence hypotheses stated below.

[Bhatt12], Proposition 2.3, proof and Remark 2.4, p.5.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 1: Filtered derived categories;
Layer 0: Simplicial polynomial resolutions.

Prove the following named laws.

- `conjugateAt`: the `i`-th stage is `|τ^(≤i) Ω•_(P•/A)|`, with the canonical maps from truncation.
- `conjugateInclusion`: the map from stage `i` to stage `j` for `i ≤ j` is induced by cohomological
  truncation; the maps compose and are natural in `A → B`.
- `conjugateColimit`: the filtered colimit over `i ≥ 0` of these stages is `dR_(B/A)`. This is an
  uncompleted exhaustiveness assertion.

**Checks.**

- `test_conjugate_identity`: for `A → A`, stage zero is `A` and every positive graded piece is zero.
- `test_conjugate_weight_zero`: the zeroth graded piece is `|H⁰(Ω•_(P•/A))|`, with no cohomological
  shift.
- `test_conjugate_rational`: for `ℚ → ℚ[t]`, every positive conjugate graded piece vanishes and stage
  zero is `ℚ`.

### 3.3 The derived Frobenius twist

For `A → B` of `F_p`-algebras define `B^(1) = B ⊗^L_(A, Frob_A) A`, `DerivedDeRham.frobeniusTwist`, the
simplicial commutative ring `P• ⊗_(A, Frob_A) A` for a polynomial resolution, together with the relative
Frobenius `B^(1) → B`. The derived de Rham complex and its conjugate filtration are naturally
`B^(1)`-linear at the level of models. The ordinary Frobenius twist computes this pushout when
`Tor_i^A(B, Frob_*A) = 0` for every `i > 0`. Without Tor independence the twist retains its higher
homotopy.

[Bhatt12], Notation 3.1 and following paragraph, p.6; [Bhatt12], Proposition 3.5 statement, p.7.

*Needs:* Layer 0: Simplicial polynomial resolutions; Layer 0: The cotangent complex of a map of
simplicial rings and the diagonal comparison.

Prove the following named laws.

- `relativeFrobenius`: the canonical map `B ⊗^L_(A,Frob_A) A → B` is induced at polynomial level by
  `b ⊗ a ↦ bᵖ f(a)`.
- `twistMap`: a map `B → C` of `A`-algebras induces `B^(1) → C^(1)` and a commuting square with the two
  relative Frobenius maps.
- `twistUnderived`: if `Tor_i^A(B, Frob_*A) = 0` for all `i > 0`, the derived twist agrees with the
  ordinary tensor-product twist, compatibly with relative Frobenius.

**Checks.**

- `test_twist_base`: for `B = A`, `B^(1) = A ⊗^L_(A,Frob_A) A` is canonically `A` and the relative
  Frobenius is the identity under this identification.
- `test_twist_polynomial`: for `B = F_p[t]` over `F_p`, the derived twist is the ordinary polynomial
  algebra and relative Frobenius sends its coordinate `t` to `tᵖ`.
- `test_twist_no_underived_shortcut`: let `A = F_p[ε]/ε²` and `B = F_p`. `Tor₁^A(B, Frob_*A)` is nonzero
  (indeed isomorphic to `Frob_*A` with `ε` acting by zero); therefore `B^(1)` has nonzero `π₁` and cannot
  be replaced by its ordinary tensor product.

*Cartier isomorphisms and convergence.*

First calculate inverse Cartier on polynomial generators, then extend it to derived graded pieces and
smooth algebras. The graded identification is canonical; spectral-sequence convergence needs its own
estimate.

### 3.4 The polynomial Cartier map

For a polynomial algebra `F` over an `F_p`-algebra `A`, construct the canonical isomorphism of
`F^(1)`-modules `C⁻¹ : ∧^k Ω¹_(F^(1)/A) ≃ H^k(Ω•_(F/A))` for every `k`, extending to a graded
`F^(1)`-algebra isomorphism `⊕_k Ω^k_(F^(1)/A)[−k] → ⊕_k H^k(Ω•_(F/A))[−k]`. In one variable, applying the
source recipe with the lift `t ↦ t^p` gives `dt ↦ [t^(p−1) dt]` in degree one; that formula is a
consequence of the recipe and is not displayed in the source. The canonical assertion is on
cohomology; a chain-level splitting obtained from a lift may depend on choices.

[Bhatt12], Theorem 3.2, proof and Remark 3.3, p.7.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 3: The derived Frobenius twist; Layer 2:
The graded Leibniz identity.

Lean: `DerivedDeRham.polynomialCartier`.

**Checks.**

- `test_cartier_weight_zero`: in weight 0, `C⁻¹` sends `t^(1)` to the class of `tᵖ`.
- `test_cartier_line`: `C⁻¹(dt^(1)) = [t^(p−1) dt]`; at `p = 2` this is `[t dt] ≠ 0`.
- `test_cartier_two_variables`: in two variables `C⁻¹(dx^(1) ∧ dy^(1)) = [x^(p−1) y^(p−1) dx ∧ dy]`,
  preserving the order of the generators.

### 3.5 Derived Cartier graded pieces

For every map `A → B` of `F_p`-algebras, `gr^conj_i dR_(B/A) ≃ L∧^i L_(B^(1)/A)[−i]`, naturally, where
`L_(B^(1)/A)` is the cotangent complex of the simplicial ring map `A → B^(1)` (0.9); as complexes of
`A`-modules this is `(L∧^i_B L_(B/A))[−i] ⊗^L_(A, Frob_A) A` by base change (0.10, 0.14). The exterior
power and Frobenius twist are derived.

[Bhatt12], Proposition 3.5 and proof, p.7.

*Needs:* Layer 3: The conjugate filtration; Layer 3: The derived Frobenius twist; Layer 3: The
polynomial Cartier map; Layer 0: The full cotangent complex; Layer 0: Derived exterior powers; Layer 0:
The cotangent complex of a map of simplicial rings and the diagonal comparison.

Lean: `DerivedDeRham.conjugateGradedCartier`.

**Checks.**

- `test_cartier_graded_zero`: `gr_0^conj = B^(1)` (`i = 0`).
- `test_cartier_graded_line`: for a polynomial line, `gr_1^conj = Ω¹_(B^(1)/A)[−1]`.
- `test_cartier_graded_shifted_conormal`: for `L = N[1]` with `N` flat, `L∧^i L[−i] = Γ^i N` in degree
  zero; shifting only one side of the Cartier map gives the wrong degree.

### 3.6 The classical smooth Cartier isomorphism

For any `F_p`-algebra `A` and a smooth `A`-algebra `B`, inverse Cartier gives
`∧^i_(B^(1)) Ω¹_(B^(1)/A) ≃ H^i(Ω•_(B/A))` as `B^(1)`-modules and graded algebras. The ordinary Frobenius
twist suffices because `B/A` is flat. Over an arbitrary characteristic-p field this is the relative
Cartier theorem, including imperfect fields and the relative twist.

[Bhatt12], Theorem 3.2 and Remark 3.4 with proof, p.7.

*Needs:* Layer 3: The polynomial Cartier map; Layer 3: The derived Frobenius twist; Layer 0: The smooth
cotangent computation; Layer 0: Derived base change of the cotangent complex; Layer 2: Ordinary
polynomial base change and Künneth.

Lean: `DerivedDeRham.smoothCartier`.

**Checks.**

- `test_smooth_cartier_line`: `F_p[t]` has `H⁰ = F_p[t^p]` and `H¹ = F_p[t^p] t^(p−1) dt`.
- `test_smooth_cartier_two`: at `p = 2`, `[t dt] ≠ 0` in `H¹`.
- `test_smooth_cartier_etale`: an étale algebra has no positive forms and `H⁰ = B^(1) = B`.

### 3.7 The conjugate spectral sequence and convergence

For `A → B` over `F_p` the increasing exhaustive filtration gives the exact-couple spectral sequence
with `E₁^(i,j) = H^(i+j)(L∧^i L_(B^(1)/A)[−i]) = H^j(L∧^i L_(B^(1)/A))`, abutting conditionally to
`H^(i+j) dR_(B/A)`. Strong convergence in a given degree holds when only finitely many filtration
indices contribute there (for example a bounded smooth affine complex); otherwise the complete and
`lim¹` conditions of 1.1 are stated and checked. Global and completed variants retain their
totalization and convergence hypotheses.

[Bhatt12], Proposition 2.3 and Remark 2.4; Proposition 3.5, pp.5, 7; [GP], Proposition 2.18, pp.7–8.

*Needs:* Layer 3: The conjugate filtration; Layer 3: Derived Cartier graded pieces; Layer 1: Filtered
derived categories; Layer 1: Valid exchanges of completion and derived operations; Layer 1: Derived
limits of towers.

Lean: `DerivedDeRham.conjugateSpectralSequence`.

Prove the following named laws.

- `conjugateSpectralE1`: `E₁^(i,j) = H^j(L∧^i L_(B^(1)/A))`.
- `conjugateSpectralFunctorial`: base-compatible algebra maps induce maps of exact couples and spectral
  sequences.
- `conjugateSpectralFiniteConvergence`: finite contribution in each total degree gives a separated
  exhaustive finite filtration on the abutment.
- `conjugateSpectralCompletion`: filtered reflection leaves the cofibre exact couple unchanged; the
  abutment still requires its own convergence check.

**Checks.**

- `test_conjugate_spectral_base`: for `A → A`, only `E₁^(0,0) = A` is nonzero.
- `test_conjugate_spectral_line`: for `F_p[t]/F_p`, weights 0, 1 compute the classical Cartier modules in
  total degrees 0, 1.
- `test_conjugate_spectral_nonlci`: for `B = F_p[x,y]/(x,y)²`, `E₁^(1,−2) = H^−2(L_(B^(1)/F_p)) ≅ F_p`
  (the Lichtenbaum–Schlessinger description of 0.7 for the generators `x², xy, y²`) sits in total
  degree `−1`, so the spectral sequence has terms in negative total degree and a first-quadrant
  convergence argument cannot apply.

### 3.8 Regular quotient divided-power calculations

Let `A → B = A/I` be a regular-sequence quotient of `F_p`-algebras. Put `B^(1) = B ⊗^L_(A,Frob_A) A`; in
the Tor-independent case this is `A/(f₁^p, …, f_r^p)`. Then `L_(B^(1)/A) ≃ (I^(1)/(I^(1))²)[1]`, and
`gr_i^conj dR_(B/A) ≃ Γ^i_(B^(1))(I^(1)/(I^(1))²)` in degree zero. Hence `dR_(B/A)` is discrete by
exhaustive realization. The identification with the classical PD envelope is Layer 4.

[Bhatt12], Lemma 3.42, Remark 3.43 and the regular quotient computation of §3.3, pp.17–18.

*Needs:* Layer 0: Regular quotients and two-term models; Layer 0: Exterior powers of a triangle and
décalage; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate filtration.

Lean: `DerivedDeRham.regularQuotientDividedPowers`.

**Checks.**

- `test_regular_dp_empty`: for the empty sequence `B = A` and only weight 0 survives.
- `test_regular_dp_one`: for one regular element `f`, `L = (f)/(f²)[1]` and `gr_i = Γ^i` of a free
  rank-one module, in degree zero.
- `test_regular_dp_two`: at `p = 2`, `γ₂` of the conormal generator survives although the square of
  `γ₁` vanishes.

*Extension classes and chosen splittings.*

The first conjugate extension encodes a lifting obstruction. Compatible Frobenius lifts can split the
whole filtration, with the dependence on those choices retained.

### 3.9 The first conjugate extension and W₂ lifting

For `A → B` over `F_p`, the extension `B^(1) → Fil₁^conj dR_(B/A) → L_(B^(1)/A)[−1]` determines an `Ext²`
obstruction class. Given a compatible `W₂` lift of `A`, this is the obstruction to a compatible `W₂` lift
of the Frobenius-twisted `B` as in [Bhatt12] Proposition 3.15. The first conjugate extension need not
split; a canonical isomorphism of graded pieces does not supply a canonical splitting.

[Bhatt12], Proposition 3.15 and Remark 3.16, pp.9–10.

*Needs:* Layer 0: Cotangent obstruction theory for square-zero lifts; Layer 3: The conjugate
filtration; Layer 3: Derived Cartier graded pieces.

Lean: `DerivedDeRham.cartierExtensionObstruction`.

**Checks.**

- `test_w2_identity`: for the identity, `L = 0` and the extension is trivial.
- `test_w2_polynomial`: a polynomial algebra over a `W₂`-liftable base lifts, so the class vanishes.
- `test_w2_regular_quotient`: for `F_p[t] → F_p` over the `W₂` lift `ℤ/p²[t] → ℤ/p²`, the quotient
  lifts, so the class vanishes although `L = F_p[1]` is nonzero.

### 3.10 A splitting from compatible Frobenius lifts

If a map `A → B` of `F_p`-algebras has compatible flat `ℤ/p²` lifts and compatible lifts of the absolute
Frobenius on both rings, these choices produce a multiplicative, `B^(1)`-linear splitting
`dR_(B/A) ≃ ⊕_(i≥0) L∧^i L_(B^(1)/A)[−i]` of the conjugate filtration. The chain-level splitting
depends on the lift data; the cohomological Cartier map is canonical. Liftability and Frobenius
compatibility are retained.

[Bhatt12], Proposition 3.17 and proof, pp.10–11.

*Needs:* Layer 3: The polynomial Cartier map; Layer 3: Derived Cartier graded pieces; Layer 3: The
conjugate filtration.

Lean: `DerivedDeRham.frobeniusLiftSplitting`.

**Checks.**

- `test_frobenius_lift_line`: for `ℤ/p²[t]` with `t ↦ t^p`, the induced class in degree one is
  `[t^(p−1) dt]`, and at `p = 2` it is `[t dt]`.
- `test_frobenius_lift_identity`: for the identity the splitting is the unit `B^(1) = A`.
- `test_frobenius_lift_choice`: for `ℤ/p²[t]`, the Frobenius lifts `t ↦ t^p` and `t ↦ t^p + pt` send
  `dt^(1)` to `t^(p−1) dt` and `t^(p−1) dt + dt`; these differ by the exact form `d(t)`, so the chain-level
  splittings differ while the cohomological Cartier class is the same.

### 3.11 The square-zero non-lci quotient

For `k = F_p` and `B = k[x,y]/(x², xy, y²)`, put `P = k[x,y]` and `I = (x², xy, y²)` with generators
`e₁, e₂, e₃ ↦ x², xy, y²`. The relation module is free on `r₁ = y e₁ − x e₂` and `r₂ = y e₂ − x e₃`, and the
Koszul relations are generated by `x r₁`, `y r₂` and `y r₁ + x r₂`. The Lichtenbaum–Schlessinger
description of `τ_(≥−2)L` (0.7) gives `H^−2(L_(B/k)) = ker(Rel/TrivRel → I/I² ⊗ …) ≅ k`, spanned by the
class of `y r₁ = −x r₂`. Thus `L_(B/k)` is not of amplitude `[−1, 0]`, and the two-term polynomial
presentation complex `[I/I² → B dx ⊕ B dy]` computes only `τ_(≥−1)L`. Since `k → B` is finite flat and
`B` is not a complete intersection (`I` needs three generators but has height two, [StacksAlg] Lemma
10.135.4), `L_(B/k)` has infinite Tor amplitude: `D_n(B|k, k) ≠ 0` for infinitely many `n` ([Avramov]
Theorem (1.3), with flat dimension of a pseudo-coherent complex over a Noetherian local ring detected
by Tor against the residue field). The quotient has a flat `ℤ/p²` lift with the same equations and the
compatible Frobenius lift `x ↦ x^p`, `y ↦ y^p`, and here `B^(1) = B`; by 3.10, `dR_(B/k)` contains
`L_(B/k)[−1]` as a `B`-linear summand, so `H^−1(dR_(B/k)) ⊇ H^−2(L_(B/k)) ≠ 0` and
`dR_(B/k) ⊗^L_B k` has nonzero cohomology in infinitely many negative degrees. Classical crystalline
cohomology, sheaf cohomology in nonnegative degrees, cannot be equivalent to this object.

[Bhatt12], Example 3.21, p.11; [StacksCt], Lemma 13.3, Tag 09CG, p.26; [Avramov], Theorem (1.3) and
Proposition (1.8), pp.459–461.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Degree zero and the naive cotangent complex;
Layer 0: Cohen factorizations and the vanishing theorems; Layer 3: A splitting from compatible
Frobenius lifts.

Lean: `DerivedDeRham.nonregularQuotientHomology`.

**Checks.**

- `test_square_zero_h2`: `H^−2(L_(B/k)) ≅ k`, at every `p` including `p = 2`.
- `test_square_zero_naive`: the naive cotangent complex has `H^−1 = ker(I/I² → B dx ⊕ B dy)` and
  nothing below; it misses `H^−2`.
- `test_square_zero_dual_numbers_contrast`: for the lci `k[t]/(t²)`, `H^−2(L) = 0`; the difference is
  the non-Koszul relation `y r₁`.

### 3.12 Why Hodge completion matters

If `A → B` is a map of `ℚ`-algebras, direct-sum derived de Rham satisfies `dR_(B/A) ≃ A`, because every
positive conjugate graded piece vanishes (polynomial algebras over `ℚ` have no positive de Rham
cohomology) and the conjugate filtration is exhaustive. For `ℚ[t, t⁻¹]/ℚ` the ordinary complex instead
has `H¹ = ℚ·dt/t`. Hodge completion recovers ordinary de Rham cohomology for smooth finitely presented
`ℚ`-algebras, as the next subsection proves. Hodge completion and p-completion are separate operations.

[Bhatt12], Corollary 2.5, proof and Remark 2.6, pp.5–6; [Bhatt12], Remark 3.12 and Corollary 3.10,
p.8.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 3: The conjugate filtration;
Mathlib `LaurentPolynomial`.

Lean: `DerivedDeRham.rationalCollapse`.

**Checks.**

- `test_rational_collapse_identity`: `dR_(ℚ/ℚ) = ℚ`.
- `test_rational_collapse_laurent`: `dR_(ℚ[t,t⁻¹]/ℚ) = ℚ` while `H¹(Ω•) = ℚ dt/t ≠ 0`.
- `test_rational_collapse_not_p`: over `F_p`, `dR_(F_p[t]/F_p)` has `H¹ ≠ 0`; the collapse is a
  characteristic-zero statement.

*Hodge, p-adic and continuous variants.*

Specify each completion separately, then prove the smooth comparisons in their respective ranges. The
rational comparison uses agreement of graded pieces only after Hodge completeness.

### 3.13 Smooth ordinary and completed de Rham comparisons

For a smooth map of `ℤ/p^n`-algebras with `n ≥ 1`, uncompleted `dR_(B/A) ≃ Ω•_(B/A)`. For any smooth
finitely presented `A → B`, the Hodge-completed `dR^hc_(B/A) ≃ Ω•_(B/A)`: the augmentation of a
polynomial resolution gives a map of Hodge-filtered dg algebras `dR_(B/A) → Ω•_(B/A)`; on `gr^i` it is
`L∧^i L_(B/A)[−i] → Ω^i_(B/A)[−i]`, an isomorphism by 0.12 and 2.24; both targets are complete
(`Ω^(≥i)` vanishes in degrees below `i`), so it is an isomorphism after Hodge completion by 1.15. For
`ℚ`-algebras this is the rational comparison, while the uncompleted `dR_(B/A) ≃ A` (3.12). For
p-completely smooth bounded-torsion formal algebras, p-completed derived de Rham identifies with the
continuous ordinary complex of 2.27. Each equivalence preserves the Hodge filtration and
multiplication.

[Bhatt12], Corollary 3.10, Remarks 2.6 and 3.12, pp.6, 8; [BL22], Appendix E, Proposition E.12 and
Construction E.14, pp.234–235.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge graded pieces of
derived de Rham; Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham; Layer
2: The de Rham algebra of a completely smooth formal algebra; Layer 3: Why Hodge completion matters;
Layer 0: The smooth cotangent computation; Layer 1: Completion of a filtered object.

Lean: `DerivedDeRham.smoothDeRhamComparison`.

**Checks.**

- `test_smooth_comparison_fp`: over `F_p`, `dR_(F_p[t]/F_p) ≃ Ω•` with `H⁰ = F_p[t^p]`.
- `test_smooth_comparison_rational`: over `ℚ`, `dR^hc_(ℚ[t,t⁻¹]/ℚ)` has `H¹ = ℚ dt/t` while uncompleted
  `dR = ℚ`.
- `test_smooth_comparison_formal`: for `ℤ_p⟨t⟩` over `ℤ_p`, `dR̂` is the continuous complex
  `[ℤ_p⟨t⟩ → ℤ_p⟨t⟩ dt]`, with `H¹` containing the classes of `t^(p^n − 1) dt` that are not exact
  integrally.

*Transitivity, sheaves and a singular calculation.*

Retain connection and extension data. Global objects are formed using finite-quotient descent before
completion; their graded pieces, rather than their full differential, are `O_X`-linear.

### Examples

On the polynomial line over `F_p`, inverse Cartier sends `dt^(1)` to `[t^(p−1) dt]`. At `p = 2` this is
`[t dt]`, and on the identity algebra the relative Frobenius twist is the base itself. A zero conormal
has only weight zero, while a shifted free conormal has nonzero divided powers in every weight. The
square-zero quotient `F_p[x,y]/(x,y)²` has `H^−1(dR) ≠ 0`.

### Dependencies

Layers 0–2 supply cotangent powers, ordinary differential algebra and polynomial realization. The
conjugate filtration precedes both the rational boundary calculation and the smooth comparison.

## Layer 4: Crystalline comparison maps and Witt animation

Construct the crystalline comparison map, its regular-quotient model and Frobenius. Extend the
classical Witt input to all `F_p`-algebras along polynomial resolutions and build the PD conjugate
filtration. The global lci and period applications follow scheme descent in Layer 5.

### 4.1 The derived de Rham to crystalline map

For a ring map `A → B` of `ℤ/p^n`-algebras, `n ≥ 1`, construct
`Comp_(B/A) : dR_(B/A) → RΓ_crys((B/A)_crys, O_crys)`, `DerivedDeRham.crystallineComparisonMap`, as a
natural map of Hodge-filtered dg algebras, where the target is CrystallineCohomology §CR.2.1's
crystalline cohomology for the canonical divided powers on `p` with its PD filtration. On a
polynomial resolution `P• → B`, map `Ω•_(P•/A)` into `Ω•_(P•/A) ⊗_(P•) D_(P•)(ker(P• → B))` and use the
PD Poincaré lemma (CrystallineCohomology §CR.2.2) to identify the target. The target is classical
crystalline cohomology of `B`. The intended Lean signature is

```lean
DerivedDeRham.crystallineComparisonMap (p n : ℕ) [Fact p.Prime] (hn : 0 < n)
    (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]
    [Algebra (ZMod (p ^ n)) A] [Algebra (ZMod (p ^ n)) B] [IsScalarTower (ZMod (p ^ n)) A B] :
    DerivedDeRham.ofPolynomialResolution A B ⟶ (crystalline cohomology of B over A, filtered)
```

[Bhatt12], Proposition 3.25 and Remark 3.26, p.12.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 0: Simplicial polynomial
resolutions; CrystallineCohomology §CR.0.5–§CR.0.6, §CR.1.1, §CR.2.1–§CR.2.2.

Prove the following named laws.

- `crystallineComparisonNatural`: a base-compatible square induces a commuting square of comparison
  maps.
- `crystallineComparisonHodge`: the map carries the Hodge filtration to the crystalline PD filtration.
- `crystallineComparisonSmooth`: for a smooth map of flat `ℤ/p^n`-algebras this is the PD Poincaré
  equivalence.
- `crystallineComparisonSheaf`: affine comparison maps glue over the common scheme site and preserve cup
  products.

**Checks.**

- `test_crys_map_base`: for `A → A` over `ℤ/p^n`, `Comp` is the identity on `A`.
- `test_crys_map_polynomial`: for `F_p → F_p[t]`, `Comp` identifies the ordinary complex with the
  crystalline PD de Rham model.
- `test_crys_map_nonlci`: for `F_p → F_p[x,y]/(x,y)²`, the map exists but cannot be an equivalence:
  `H^−1` of the source is nonzero (3.11) and the classical target is coconnective.

### 4.2 Regular quotients and classical PD envelopes

For `A → B = A/I` with `A` and `B` flat over `ℤ/p^n`, `n ≥ 1`, and `I` locally generated by a finite
regular sequence, prove that `Comp` identifies `dR_(B/A)` with the PD envelope `D_A(I)` compatible with
the divided powers on `p`. Its Hodge filtration is the PD filtration. Modulo `p` its conjugate
filtration is the PD conjugate filtration of 4.5. The proof uses the envelope, flatness,
tensor-discreteness and reduction facts of CrystallineCohomology §CR.0.6.

[Bhatt12], Lemma 3.29, Claim 3.30, Lemmas 3.37–3.38, Corollary 3.40, pp.13–17.

*Needs:* Layer 4: The derived de Rham to crystalline map; Layer 3: Regular quotient divided-power
calculations; Layer 2: Derived base change and Künneth; CrystallineCohomology §CR.0.6, §CR.2.1–§CR.2.2.

Lean: `DerivedDeRham.regularPdComparison`.

**Checks.**

- `test_regular_pd_zero`: for `I = 0`, `dR_(A/A) = A = D_A(0)`.
- `test_regular_pd_line`: for `A = F_p[t]`, `B = F_p` (`n = 1`), `dR_(B/A) ≃ D_A((t)) = F_p⟨t⟩`, the
  divided power polynomial algebra, in which `γ_p(t) ≠ 0` although `t^p = 0`; it is not the quotient
  ring `F_p`.
- `test_regular_pd_hodge`: in the same example the Hodge filtration is the PD filtration:
  `γ_n(t) ∈ Fil_H^n` and `γ_n(t) ∉ Fil_H^(n+1)`.

### 4.3 Frobenius on nilpotent-p derived de Rham

For a `ℤ/p^n`-algebra `B`, polynomial crystalline Frobenius gives a natural endomorphism `φ` of
`dR_(B/(ℤ/p^n))`, commuting with the crystalline comparison map. For p-completed algebras use the
compatible finite reductions. On characteristic-p Cartier graded pieces record the Frobenius twist.
This construction does not identify the Hodge filtration with the conjugate or Nygaard filtration.

[Bhatt12], Proposition 3.47 and proof, p.19; Remark 9.8.

*Needs:* Layer 4: The derived de Rham to crystalline map; Layer 2: De Rham cohomology from polynomial
resolutions; Layer 2: p-completed derived de Rham; Layer 3: The derived Frobenius twist;
CrystallineCohomology §CR.2.1.

Lean: `DerivedDeRham.deRhamFrobenius`.

Prove the following named laws.

- `deRhamFrobeniusNatural`: algebra maps over `ℤ/p^n` commute with `φ`.
- `deRhamFrobeniusCrystalline`: `Comp` intertwines `φ` and crystalline Frobenius.
- `deRhamFrobeniusLimit`: the finite `φ` maps induce the endomorphism of `Λ_p dR`.
- `deRhamFrobeniusDegreeZero`: modulo `p`, degree-zero polynomial functions map by `b ↦ b^p`.

**Checks.**

- `test_derham_frob_base`: on the base `ℤ/p^n`, the canonical Frobenius is the identity.
- `test_derham_frob_coordinate`: modulo `p` on `F_p[t]`, `t` maps to `t^p` and the differential of
  `t^p` is zero.
- `test_derham_frob_filtration_boundary`: for `F_p[t]/F_p`, polynomial Frobenius has `φ(t) = t^p` and
  `φ(dt) = 0`, while inverse Cartier sends `dt^(1)` to the nonzero class `[t^(p−1) dt]`, also at `p = 2`
  where it is `[t dt]`. A Frobenius endomorphism therefore cannot substitute for inverse Cartier or
  identify the two filtrations ([Bhatt12], Theorem 3.2, p.7).

*Derived Witt theory and quasiregular PD structure.*

Extend the classical smooth Witt and Nygaard input of CrystallineCohomology §CR.4.6–§CR.4.7 along
polynomial resolutions, then compare its quasiregular values with PD envelopes.

### 4.4 Derived de Rham–Witt with Nygaard filtration

From the classical de Rham–Witt complex `WΩ•_P` of a polynomial `F_p`-algebra and its Nygaard filtration
(CrystallineCohomology §CR.4.6–§CR.4.7), construct `LWΩ_S`, `DerivedDeRham.derivedDeRhamWitt`, for an
`F_p`-algebra `S` as the derived p-completion of the realization `|WΩ•_(P•)|` over a polynomial
resolution `P• → S`, with Nygaard filtration `N^(≥i)` realized levelwise; independence of the resolution
is 0.1 applied to the functors `P ↦ WΩ•_P / N^(≥i)` and `P ↦ W_rΩ•_P`. Extend divided Frobenius and
prove the fibre sequences `N^(≥i+1)LWΩ → N^(≥i)LWΩ --φ_i mod p→ Fil_i^conj dR` and
`LWΩ/N^(≥i) --p→ LWΩ/N^(≥i+1) → dR/Fil_H^(i+1)`. The resulting functor restricts to the classical smooth
object.

[BMS19], §8.2 opening, p.270, equations (4)–(5); Lemmas 8.2–8.3, pp.266–267.

*Needs:* CrystallineCohomology §CR.4.6–§CR.4.7; Layer 1: Filtered derived categories; Layer 1:
Completed filtered tensor products; Layer 1: The derived completion reflector; Layer 2: De Rham
cohomology from polynomial resolutions; Layer 3: The conjugate filtration; Layer 0: Simplicial
polynomial resolutions.

Prove the following named laws.

- `derivedWittSmooth`: on a smooth `F_p`-algebra, `LWΩ` is the classical `WΩ` with its Nygaard
  filtration.
- `derivedWittModP`: `LWΩ_S ⊗^L_(ℤ_p) F_p ≃ dR_(S/F_p)`.
- `derivedWittDividedFrobenius`: `φ_i : N^(≥i)LWΩ → LWΩ` has the displayed modulo-p fibre sequence.
- `derivedWittHodgeQuotient`: multiplication by `p` on Nygaard quotients has cofibre
  `dR/Fil_H^(i+1)`.

**Checks.**

- `test_derived_witt_perfect`: for perfect `S`, `LWΩ_S = W(S)`, with Nygaard filtration `p^i W(S)`.
- `test_derived_witt_fp`: for `S = F_p`, `LWΩ = ℤ_p` and its reduction is `F_p`.
- `test_derived_witt_singular_boundary`: for `S = F_p[x,y]/(x,y)²`, `LWΩ_S ⊗^L_(ℤ_p) F_p ≃ dR_(S/F_p)` has
  `H^−1 ⊇ H^−2(L_(S/F_p)) ≅ F_p` (3.11), including `p = 2`, whereas for smooth `S` the reduction is the
  de Rham complex in degrees `[0, dim S]`; the derived object of a singular algebra is not the classical
  de Rham–Witt complex ([Bhatt12], Example 3.21, p.11; [BMS19], §8.2, p.270).

### 4.5 The conjugate filtration of a PD envelope

For an `F_p`-algebra `A`, ideal `I` and PD envelope `D_A(I)`, define `Fil_n^conj` as the `A`-submodule
generated by products `∏ a_j^[l_j]` with `a_j ∈ I` and `Σ l_j < (n+1)p`, with `Fil_(−1) = 0`. It is
increasing, multiplicative and exhaustive; equivalently use products `∏ a_j^[p k_j]` with
`Σ k_j ≤ n`. There is a canonical surjective graded map
`Γ^*_(A/I)(I/I²) ⊗_(A/I, Frob) A/φ(I) → gr_*^conj D_A(I)`, sending divided-power monomials to
`∏((p k_j)!/(p^(k_j) k_j!)) a_j^[p k_j]`. Here `φ(I)` is the ideal generated by `a^p` for `a ∈ I`. These
factors are p-adic units.

[BMS19], Definition 8.10 and Proposition 8.11, pp.271–272.

*Needs:* CrystallineCohomology §CR.0.3–§CR.0.6; Mathlib `DividedPowers`, `DividedPowerAlgebra`.

Lean: `DerivedDeRham.pdConjugateFiltration`.

Prove the following named laws.

- `pdConjugateMembership`: the two displayed generator descriptions define the same filtration level.
- `pdConjugateProduct`: `Fil_i · Fil_j ⊆ Fil_(i+j)` and `colim Fil_i = D_A(I)`.
- `pdConjugateGradedMap`: the divided-power graded map has the displayed Frobenius base change and
  factorial factors.
- `pdConjugateNatural`: maps of `F_p` PD envelope problems preserve all levels and the graded map.

**Checks.**

- `test_pd_conj_zero_ideal`: for `I = 0` only weight zero survives, and `D_A(0) = A`.
- `test_pd_conj_coordinate`: for `A = F_p[x]`, `I = (x)`, `γ_(pk)(x)` has conjugate weight `k` and
  `γ_(p−1)(x)` belongs to weight zero; the factor for `k = 1` is `(p−1)!`, which is `−1` modulo `p` for odd
  `p` and `+1` at `p = 2`.
- `test_pd_conj_two_filtrations`: `γ_p(x)` has conjugate weight 1 but PD (Hodge) weight `p`; the two
  filtrations are different.

### 4.6 The torsion boundary for F_p over Z_p

The p-completed de Rham complex of `F_p/ℤ_p` is the derived completion of
`[ℤ_p⟨x⟩ --(x−p)→ ℤ_p⟨x⟩]` in degrees `−1, 0`. Its decompleted model is `ℤ_p ⊕ ⊕_(j>0) ℤ_p/j` in degree
zero; the completion of the torsion direct sum need not be torsion. In the factors `ℤ_p/p^n` the
coordinates `p^⌊n/2⌋` tend p-adically to zero and have unbounded orders, hence define a nontorsion
completed-sum element. The coordinates `p^(n−1)` printed in [Bhatt12] Remark 8.7 are all killed by `p`
and do not witness this. For a perfect `F_p`-algebra `A₀`, the Witt summand in [Bhatt12] Corollary 8.6
is `W(A₀)`.

[Bhatt12], Proposition 8.5, Corollary 8.6, Remark 8.7, p.32.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Valid exchanges of completion and derived
operations; Layer 2: p-completed derived de Rham; CrystallineCohomology §CR.0.6; Mathlib `WittVector`.

Lean: `DerivedDeRham.fpOverZpTorsion`.

**Checks.**

- `test_fp_zp_differential`: the two-term map is multiplication by `x − p` on `ℤ_p⟨x⟩`.
- `test_fp_zp_nontorsion`: the element with coordinates `p^⌊n/2⌋` in the factors `j = p^n` is not
  killed by any power of `p`.
- `test_fp_zp_torsion_coordinates`: the element with coordinates `p^(n−1)` is killed by `p`.

### Examples

The identity crystalline comparison is an equivalence. The non-lci square-zero algebra
`F_p[x,y]/(x,y)²`, including `p = 2`, distinguishes derived de Rham cohomology, which has `H^−1 ≠ 0`,
from classical nonnegative crystalline cohomology. In the completed torsion sum, coordinates
`p^⌊n/2⌋` have unbounded order, whereas `p^(n−1)` is killed by `p`.

### Dependencies

Layers 0–3 and CrystallineCohomology (Layers CR.0–CR.2 and CR.4) supply cotangent powers, completion,
Cartier, PD envelopes, crystalline sites and classical smooth Witt inputs. Global lci, period and
quasiregular semiperfect comparisons follow the sites and descent of Layer 5.

## Layer 5: Quasisyntomic descent, crystalline applications and geometric control

Construct the sites and covers before applying descent to cotangent powers, de Rham objects and
schemes. The period setup and the quasiregular semiperfect Witt and PD calculations precede the
canonical crystalline Čech complex and proper smooth control.

### 5.1 The quasisyntomic sites

Fix `p`. `QSyn` has p-complete bounded-p-torsion rings whose `L_(A/ℤ_p)` has p-complete Tor amplitude
`[−1, 0]` (1.23); its opposite has the topology whose covers are the quasisyntomic covers of 1.23.
Construct the big slices `QSyn_R` (all maps `R → A` with `A ∈ QSyn`) and the relative subsite `qSyn_R`
(quasisyntomic `R`-algebras), `DerivedDeRham.quasisyntomicSite`. Completed fibre products of covers,
composition and base-change stability define the sites; the ring category need not have every finite
limit. The two relative categories are distinguished.

[BMS19], Definition 4.10; Lemmas 4.15–4.17; Variants 4.33 and 4.35, pp.223–225, 231–232.

*Needs:* Layer 1: The quasisyntomic cotangent condition; Layer 0: The cotangent transitivity triangle;
Layer 0: Derived base change of the cotangent complex; Layer 1: Complete flatness and complete faithful
flatness; Layer 1: Complete faithful-flat module descent.

Prove the following named laws.

- `qSynCoverComposition`: identity covers and composites are covers.
- `qSynCoverBaseChange`: the p-completed derived pushout of a cover is an ordinary bounded-torsion
  quasisyntomic cover under complete flatness.
- `qSynObjectCoverDescent`: for a quasisyntomic cover `A → B`, `A ∈ QSyn` iff `B ∈ QSyn`.
- `qSynRelativeInclusion`: `qSyn_R` embeds in `QSyn_R`; for `R = ℤ_p` or `R` integral perfectoid, the
  relative cotangent amplitude is automatically `[−1, 0]` on the big slice.

**Checks.**

- `test_qsyn_site_zp`: `ℤ_p` lies in `QSyn` and its identity is a cover.
- `test_qsyn_site_smooth`: the p-completion of a smooth algebra over an integral perfectoid ring is an
  object.
- `test_qsyn_site_nonlci`: `F_p[x,y]/(x,y)²` is not an object: by 3.11, `D_n(S|F_p, F_p) ≠ 0` for
  infinitely many `n`, and the transitivity sequence of `ℤ → F_p → S` identifies `D_n(S|ℤ, F_p)` with
  `D_n(S|F_p, F_p)` for `n ≥ 3`, so `L_(S/ℤ) ⊗^L_S S/p` is not of amplitude `[−1, 0]`.

### 5.2 Quasiregular semiperfectoid rings

A quasiregular semiperfectoid ring `S` is a `QSyn` object admitting a map from an integral perfectoid
ring `R` (PerfectoidSpaces §P1.24, `IsIntegralPerfectoid`) and having surjective Frobenius on `S/p`.
Equivalently it is a quotient of an integral perfectoid ring by a p-completely quasiregular ideal, with
bounded p-torsion and relative cotangent in degree `−1`. `QRSPerfd` carries the induced cover topology.
In characteristic `p` these are exactly the quasiregular semiperfect `F_p`-algebras:
`S^♭ = lim_φ S → S` is surjective and `L_(S/F_p) ≃ L_(S/S^♭) ≃ (I/I²)[1]` with `I/I²` flat,
`I = ker(S^♭ → S)`. Quasiregularity need not mean a finite regular sequence.

[BMS19], Definition 4.20, Remarks 4.21–4.24, Lemma 4.25 with proof; Definition 8.8, pp.227–229, 270.

*Needs:* Layer 5: The quasisyntomic sites; Layer 0: The cotangent transitivity triangle; Layer 0:
Derived base change of the cotangent complex; Layer 0: Derived divided powers; PerfectoidSpaces
§P1.24–§P1.25.

Lean: `DerivedDeRham.quasiregularSemiperfectoidRings`.

Prove the following named laws.

- `qrspPerfectoidQuotient`: the quotient characterization uses a p-completely quasiregular ideal and an
  integral perfectoid source.
- `qrspCotangentDegree`: for `S` and any integral perfectoid `R → S`, `Λ_p L_(S/R)` is a shifted
  complete-flat module.
- `qrspCharacteristicP`: in characteristic `p`, `QRSPerfd` equals quasiregular semiperfect
  `F_p`-algebras with flat `I/I²`.
- `qrspPerfectoidExample`: every integral perfectoid ring is a `QRSPerfd` object.

**Checks.**

- `test_qrsp_perfect_fp`: every perfect `F_p`-algebra is quasiregular semiperfect, with `I = 0`.
- `test_qrsp_root_quotient`: `F_p[t^(1/p^∞)]/(t)` is quasiregular semiperfect, with its nonzero conormal
  module in degree `−1`.
- `test_qrsp_zp_boundary`: `ℤ_p` meets the `QSyn` and semiperfect-reduction conditions but admits no map
  from an integral perfectoid ring: in such a ring a unit multiple of `p` has a `p`-th root ([BMS] Lemma
  3.10, PerfectoidSpaces §P1.24), whose image in `ℤ_p` would have valuation `1/p`. So `ℤ_p` is excluded.

### 5.3 Compatible-root quasisyntomic covers

For `A ∈ QSyn`, choose a surjection `F = ℤ_p⟨X_i⟩_(i∈I) → A` from a p-complete polynomial algebra on a
set `I`. Adjoin compatible p-power roots of `p` and of all coordinates to obtain
`F_∞ = ℤ_p[p^(1/p^∞), X_i^(1/p^∞)]^∧_p`; `F_∞` is integral perfectoid by the Frobenius criterion of
PerfectoidSpaces §P1.24 ([BMS] Lemma 3.10(ii)): `π = p^(1/p)` is a nonzerodivisor, `π^p ∣ p`, `F_∞` is
`π`-adically complete, and Frobenius `F_∞/π → F_∞/π^p` is bijective on the monomial basis. Put
`S = Λ_p(A ⊗^L_F F_∞)`. Then `A → S` is a quasisyntomic cover and `S ∈ QRSPerfd`, its mod-p module is
free and faithfully flat over `A/p`, and `L_((S/p)/(A/p))[−1]` is free. The cover is elementary; it does
not use André's flatness lemma (PerfectoidSpaces §P4.15.4).

[BMS19], Lemma 4.28 and Remark 4.29 with proof, p.229; [BMS], Lemma 3.10, p.22 (as stated in
PerfectoidSpaces §P1.24).

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Quasiregular semiperfectoid rings; Layer 1:
Completion of simplicial commutative algebras; Layer 1: Complete flatness and complete faithful
flatness; Layer 1: Complete faithful-flat module descent; Layer 0: Derived base change of the cotangent
complex; Layer 0: The cotangent transitivity triangle; PerfectoidSpaces §P1.24–§P1.25.

Lean: `DerivedDeRham.elementarySemiperfectoidCovers`.

Prove the following named laws.

- `rootCoverFaithfullyFlat`: `S/p` is free and faithfully flat over `A/p`.
- `rootCoverCotangent`: `L_((S/p)/(A/p))[−1]` is a free `S/p`-module.
- `rootCoverPerfectoidSource`: the cover comes with an integral perfectoid surjection `F_∞ → S`.
- `rootCoverFunctorialRefinement`: maps between choices of generators produce a common refinement of the
  resulting covers.

**Checks.**

- `test_root_cover_zp`: for `A = ℤ_p`, adjoining all compatible roots of `p` and completing gives a
  perfectoid cover.
- `test_root_cover_coordinate`: for `A = ℤ_p⟨t⟩`, roots of `p` and `t` give the stated free mod-p module
  and shifted free relative cotangent.
- `test_root_cover_finite_roots`: adjoining only `t^(1/p)` leaves elements without p-power roots and does
  not establish semiperfectness.

### 5.4 Refinement and Čech stability of QRSP covers

Completed base change of a `QSyn` cover with `QRSP` target by a `QRSP` object is `QRSP`; each term of the
completed Čech nerve of `A → S` with `S ∈ QRSPerfd` is `QRSP`. Any two such covers admit a common `QRSP`
refinement by applying the elementary cover to their completed fibre product. Relative and big-slice
variants retain the same statement. This establishes the basis condition needed for unfolding.

[BMS19], Lemmas 4.27 and 4.30, pp.229–230; Variant 4.33.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Quasiregular semiperfectoid rings; Layer 5:
Compatible-root quasisyntomic covers; Layer 1: Complete faithful-flat module descent.

Lean: `DerivedDeRham.qrspRefinement`.

**Checks.**

- `test_qrsp_refinement_identity`: the identity cover of a `QRSP` object is stable.
- `test_qrsp_refinement_two_roots`: two root covers refine by adjoining both root systems.
- `test_qrsp_refinement_noncover`: `ℤ_p → F_p` is not a cover, so it is not refined.

### 5.5 Sheaves and unfolding from the QRSP basis

For a functor `F` from `QRSPerfd` to complexes (or to complete filtered complexes) satisfying Čech
descent for `QRSP` covers in the sense of the Conventions, define the unfolding
`F^unf(A) = Tot(F(S•))` for any `QRSP` cover `A → S`, `DerivedDeRham.qrspUnfolding`; it is independent of
the cover up to canonical quasi-isomorphism by common refinement (5.4), satisfies Čech descent on
`QSyn`, and restriction and unfolding are inverse up to quasi-isomorphism between descent-satisfying
functors on `QSyn` and on `QRSPerfd`. The same applies to the relative and big-slice sites. For complete
filtered targets, evaluation and graded pieces commute with unfolding; the underlying object commutes
for nonnegative filtrations that are constant below zero.

[BMS19], Proposition 4.31 and Remark 4.32, pp.230–231.

*Needs:* Layer 5: Compatible-root quasisyntomic covers; Layer 5: Refinement and Čech stability of QRSP
covers; Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object; Layer 1: Derived
limits of towers.

**Checks.**

- `test_unfolding_identity`: for a `QRSP` object `A` and the identity cover, `F^unf(A) = F(A)`.
- `test_unfolding_constant`: for a constant functor the unfolding is constant.
- `test_unfolding_cover_independence`: for `A = ℤ_p⟨t⟩`, the root cover adjoining roots of `p` and `t`
  and the cover adjoining in addition roots of `1 + t` give canonically quasi-isomorphic unfoldings,
  through their common refinement.

*Cotangent and de Rham descent.*

Prove cotangent-power descent, then finite Hodge-quotient descent and Hodge-completed descent. For
p-completed uncompleted `dR`, use the uniform lower bound on the conjugate stages in the relative site.

### 5.6 Descent of completed cotangent powers

For a fixed ring `R` and a p-completely faithfully flat map `A → B` between bounded-torsion p-complete
`R`-algebras, the completed cotangent exterior-power functor `A ↦ Λ_p L∧^i_A L_(A/R)` satisfies Čech
descent. Finite Hodge quotients inherit descent by finite exact extensions. The mod-p proof keeps the
derived reductions and the completed base ring; no freeness of the cotangent complex is assumed.

[BMS19], Theorem 3.1 and the p-completed use in Example 5.11, pp.217–218, 240.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Derived base change of the cotangent complex;
Layer 0: Derived exterior powers; Layer 0: Exterior powers of a triangle and décalage; Layer 1: Complete
faithful-flat module descent; Layer 1: Valid exchanges of completion and derived operations.

Lean: `DerivedDeRham.completedCotangentDescent`.

**Checks.**

- `test_cotangent_descent_identity`: for the identity cover the cosimplicial powers are constant.
- `test_cotangent_descent_zero`: the zero cotangent complex of the identity descends to zero.
- `test_cotangent_descent_shifted`: for a polynomial line the exterior square vanishes while shifted
  conormal powers of a regular quotient do not.

### 5.7 Descent of Hodge quotients and completion

The functors `A ↦ dR_(A/R)/Fil_H^m` for finite `m`, their p-completions, and the complete Hodge-filtered
object `dR^hc_(A/R)` satisfy their flat or p-completely flat Čech descent assertions. For Hodge
completion, `Tot` commutes with the quotient inverse limit because both are limits. Graded
conservativity is used only in the complete filtered category. There is no assertion that uncompleted
derived de Rham commutes with every unbounded totalization.

[BMS19], Example 5.11, p.240; [BL22], Proposition E.16 with proof, pp.235–236.

*Needs:* Layer 5: Descent of completed cotangent powers; Layer 2: Hodge graded pieces of derived de Rham;
Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham; Layer 1: Completion of a
filtered object; Layer 1: Valid exchanges of completion and derived operations.

Lean: `DerivedDeRham.filteredDeRhamDescent`.

**Checks.**

- `test_hodge_descent_quotient_one`: the Hodge quotient `m = 1` is `B`, which satisfies descent.
- `test_hodge_descent_identity`: the identity cover has constant totalization.
- `test_hodge_descent_limit`: the full completion is the inverse limit of the finite quotients, each
  using finitely many graded comparisons.

### 5.8 Derived de Rham on schemes and formal schemes

For a quasi-compact quasi-separated scheme `X` over a ring `A`, let `L_(X/A)` be the complex of
quasi-coherent sheaves with value `L_(B/A)` on affine opens `Spec B` ([StacksCt] Definition 24.1, Tag
08T2, with the localization statement 0.11 for restrictions). Define each finite Hodge quotient of
derived de Rham cohomology of `X` by the Čech totalization of the affine functor `B ↦ dR_(B/A)/Fil_H^m`
over a finite affine hypercovering, then form the Hodge-completed limit, `DerivedDeRham.deRhamSheaves`.
It has `gr_H^i = RΓ(X, L∧^i L_(X/A))[−i]`. The uncompleted functor can be totalized separately; recovering
its raw affine values requires the uncompleted descent theorem 5.17 and is not asserted for arbitrary
unbounded flat totalizations. For p-adic formal schemes use the p-complete affine charts
`Spf B` of SchemeAndStackFoundations §4.7, derived reductions and Hodge/p-completions. Global de Rham
cohomology is an `A`-linear complex with cup products; its full differential is not `O_X`-linear,
although Hodge graded pieces are `O_X`-modules. Affine descent is applied to each finite Hodge quotient
before taking the Hodge-completed limit.

[BL22], Appendix B, Construction B.7 and Remark B.8; Appendix E, Proposition E.16, pp.226, 235–236.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge-completed derived
de Rham; Layer 2: p-completed derived de Rham; Layer 2: Hodge graded pieces of derived de Rham; Layer 5:
Descent of Hodge quotients and completion; Layer 0: Localization and filtered colimits of cotangent
complexes; Mathlib `AlgebraicGeometry.Scheme`; SchemeAndStackFoundations §2.18, §4.7.

Prove the following named laws.

- `schemeDeRhamAffine`: on `Spec B` the Hodge-completed global object is `dR^hc_(B/A)`.
- `schemeDeRhamGraded`: for Hodge-completed global de Rham, `gr_H^i ≃ RΓ(X, L∧^i L_(X/A))[−i]`.
- `schemeDeRhamPullback`: a morphism over `A` induces pullback preserving cup products and the Hodge
  filtration.
- `formalDeRhamLimit`: the p-completed formal object is the derived inverse limit of its finite
  reductions under the stated descent and bounded-torsion hypotheses.

**Checks.**

- `test_scheme_derham_affine_base`: for `X = Spec A` over `A` the object is `A`, with no positive Hodge
  pieces.
- `test_scheme_derham_affine_line`: for `X = Spec F_p[t]`, `H¹` of ordinary smooth de Rham cohomology is
  `F_p[t^p]·t^(p−1) dt`.
- `test_scheme_derham_product_boundary`: for `X = Spec F_p[t]`, ordinary and derived de Rham agree by the
  smooth comparison, and `H⁰_dR(X/F_p) = F_p[t^p]`, of infinite dimension over `F_p`. Thus a smooth
  finite-dimensional affine scheme need not have finite-projective global de Rham cohomology over its
  base; properness is essential to the perfectness theorem 5.23 ([Bhatt12], Corollary 3.10, p.8;
  differentiate `t^n` explicitly).

### 5.9 The lci crystalline comparison theorem

For `n ≥ 1` and an lci morphism `f : X → S` of flat `ℤ/p^n`-schemes (finite presentation and local
regular immersion convention), the natural `Comp_f` is an equivalence of Hodge-filtered dg algebras and
is compatible with base change in its Tor-independent crystalline range, products and Frobenius. This is
[Bhatt12] Theorem 3.27; singular and nonflat cases are outside its isomorphism assertion.

[Bhatt12], Theorem 3.27, Lemmas 3.39 and 3.44–3.45, proof pp.18–19.

*Needs:* Layer 4: The derived de Rham to crystalline map; Layer 4: Regular quotients and classical PD
envelopes; Layer 3: Smooth ordinary and completed de Rham comparisons; Layer 2: Derived de Rham
transitivity filtrations; Layer 5: Derived de Rham on schemes and formal schemes; Layer 3: Derived
Cartier graded pieces; CrystallineCohomology §CR.2.1–§CR.2.2.

Lean: `DerivedDeRham.lciCrystallineComparison`.

**Checks.**

- `test_lci_crys_polynomial`: a smooth polynomial algebra satisfies the hypothesis and the comparison is
  the PD Poincaré equivalence.
- `test_lci_crys_regular_quotient`: a regular quotient of flat `ℤ/p^n`-algebras is lci and recovers 4.2.
- `test_lci_crys_square_zero`: `F_p[x,y]/(x,y)²` is not lci and the comparison fails (4.1), including
  `p = 2`.

### 5.10 p-adic crystalline comparison by derived limits

Let `A → B` be a map of p-complete bounded-torsion rings whose derived reductions are ordinary flat
`ℤ/p^n`-algebras and lci for every `n`, compatibly. Then
`Λ_p dR_(B/A) ≃ Rlim_n RΓ_crys((B/p^n)/(A/p^n))`. The same assertion applies to compatible p-adic formal
schemes with the analogous finite-level hypotheses. The filtration is the derived limit of the Hodge/PD
filtration. Each limit and base-change map is derived; reduction of arbitrary rings to `π₀` is not
allowed.

[Bhatt12], Definition 8.1, Lemma 8.3, Theorem 8.4, pp.31–32.

*Needs:* Layer 1: The derived completion reflector; Layer 1: When ordinary quotient towers compute
completion; Layer 1: Valid exchanges of completion and derived operations; Layer 2: p-completed derived
de Rham; Layer 2: Derived base change and Künneth; Layer 5: The lci crystalline comparison theorem;
Layer 1: Derived limits of towers.

Lean: `DerivedDeRham.pAdicCrystallineComparison`.

**Checks.**

- `test_padic_crys_identity`: for the identity of a p-complete algebra both sides are its p-completion.
- `test_padic_crys_smooth`: for `ℤ_p → ℤ_p⟨t⟩` the finite reductions compare levelwise.
- `test_padic_crys_lim_one`: the inverse limit is derived; a `lim¹` term of the levelwise cohomology is
  retained (as in `test_rlim_lim_one`).

*Period objects and a torsion boundary.*

Fix the period setup once, apply the integral `θ`-kernel and perfectoid inputs first, then the rational
period ring. Keep inversion inside the Hodge quotient limit.

### 5.11 The period setup

Let `k` be a perfect field of characteristic `p`, `W = W(k)`, `K` a finite extension of `W[1/p]`, `K̄` an
algebraic closure, and `C` the completion of `K̄`; `C` is a complete algebraically closed nonarchimedean
field, hence perfectoid (PerfectoidSpaces §P1.10–§P1.11), and `O_C` is p-adically complete with `p` not a
unit. `G_K = Field.absoluteGaloisGroup K` acts on `K̄`, on `O_K̄` and, by continuity, on `O_C` through ring
automorphisms; all Galois actions below are the functoriality of the constructions in these ring
automorphisms. Put `A_inf = 𝕎(O_C♭)` with `O_C♭ = PreTilt O_C p` and `θ = WittVector.fontaineTheta O_C p`
(Mathlib); `θ` is surjective (`surjective_fontaineTheta`) and `ker θ` is generated by a primitive
nonzerodivisor `ξ` (PerfectoidSpaces §P1.18). `A_cris = A_cris(O_C)` is CrystallineCohomology §CR.0.7
with `θ_cris`, and `B_dR⁺ = BDeRhamPlus O_C p`, `B_dR = BDeRham O_C p` (Mathlib). Define
`Z_p(1) = {ε ∈ O_C♭ : ε^♯ = 1}`, `DerivedDeRham.compatibleRootsOfUnity`, the kernel of the untilt
`PreTilt.untilt : O_C♭ →* O_C`, written additively; it is the group of compatible systems `(ε_n)` of
`p^n`-th roots of unity in `O_C`, a free `ℤ_p`-module of rank one on which `G_K` acts through the
cyclotomic character. For `ε ∈ Z_p(1)`, `θ([ε]) = ε^♯ = 1` (`WittVector.fontaineTheta_teichmuller`), so
`[ε] − 1 ∈ ker θ` and `log([ε]) = Σ_(n≥1) (−1)^(n−1)(n−1)! γ_n([ε] − 1)` converges in `A_cris`.

[Bhatt12], Notation 9.1 and Propositions 9.3(1)–(4), pp.33–34; [Bhatt12], Proposition 9.16(1), p.37.

*Needs:* Mathlib `PreTilt`, `PreTilt.untilt`, `WittVector`, `WittVector.fontaineTheta`,
`WittVector.fontaineTheta_teichmuller`, `surjective_fontaineTheta`, `BDeRhamPlus`, `BDeRham`,
`Field.absoluteGaloisGroup`; PerfectoidSpaces §P1.10–§P1.11, §P1.18; CrystallineCohomology §CR.0.7.

**Checks.**

- `test_period_roots_identity`: the identity system `1 ∈ Z_p(1)` and `log([1]) = 0`.
- `test_period_roots_kernel`: for every `ε ∈ Z_p(1)`, `[ε] − 1 ∈ ker θ`; for an element `x ∈ O_C♭` with
  `x^♯ ≠ 1`, `[x] − 1 ∉ ker θ`, so the logarithm is not assigned.
- `test_period_roots_cp`: for `K = ℚ_p` and `C = ℂ_p` (Mathlib `PadicComplex p`), a compatible system with
  `ε_1` a primitive `p`-th root of unity generates `Z_p(1)`.

### 5.12 The derived de Rham description of A_cris

In the period setup, `Λ_p dR_(O_K̄/W) ≃ Λ_p dR_(O_C/W) ≃ Λ_p dR_(O_C/A_inf) ≃ A_cris`. The Hodge
filtration is the completed PD filtration, the map `A_inf → A_cris` is the PD structure map, and the
equivalence preserves Frobenius and the `G_K` action. Proof route: `L̂_(A_inf/W) = 0` ([Bhatt12]
Proposition 9.3(2)), so `Λ_p dR_(O_C/W) ≃ Λ_p dR_(O_C/A_inf)`; `O_C = A_inf/(ξ)` is a regular quotient, so
the p-adic crystalline comparison (5.10) and the regular PD envelope (4.2) give the completed envelope
`D̂_(A_inf)(ker θ)`, which is `A_cris(O_C)` by `Crystalline.fontaineEnvelope_identify`. The integral
perfectoid generalization keeps the principal `θ`-kernel and relatively perfect mod-p input.

[Bhatt12], Proposition 9.3(2)–(5), Definition 9.7, Proposition 9.9, Remark 9.10, pp.34–35.

*Needs:* Layer 5: The period setup; Layer 5: p-adic crystalline comparison by derived limits; Layer 4:
Regular quotients and classical PD envelopes; Layer 4: Frobenius on nilpotent-p derived de Rham; Layer 0:
Regular quotients and two-term models; Layer 0: The cotangent transitivity triangle; Layer 2:
p-completed derived de Rham; CrystallineCohomology §CR.0.7.

Lean: `DerivedDeRham.acrisDerivedDescription`.

**Checks.**

- `test_acris_perfect`: for a perfect `F_p`-algebra `R` in place of `O_C`, `A_cris(R) = W(R)` and the
  derived description gives `Λ_p dR_(R/W(k)) = W(R)`.
- `test_acris_theta`: the composite `A_inf → Λ_p dR_(O_C/W) → O_C` (the Hodge quotient) is `θ`.
- `test_acris_not_zp`: `ℤ_p` alone cannot replace `O_C`: `ℤ_p` is not integral perfectoid and
  `Λ_p dR_(ℤ_p/ℤ_p) = ℤ_p` has no divided powers of a generator of `ker θ`.

### 5.13 Hodge completion and B_dR⁺

In the period setup, the rational Hodge completion of the p-completed derived de Rham period object,
`Rlim_i(((Λ_p dR_(O_K̄/W))/Fil_H^i)[1/p])`, identifies with `B_dR⁺ = BDeRhamPlus O_C p`, the
`ker(θ)[1/p]`-adic completion of `A_inf[1/p]`. Inversion of `p` is taken inside each Hodge quotient; it is
not identified with inversion outside the limit. The composite `A_cris → B_dR⁺` of 5.12 with this
identification is the natural map; it preserves the filtrations and the `G_K` action, and `B_dR` is
`BDeRham O_C p`.

[Bhatt12], Remark 9.17, p.38.

*Needs:* Layer 5: The derived de Rham description of A_cris; Layer 2: Hodge-completed derived de Rham;
Layer 1: Valid exchanges of completion and derived operations; Mathlib `BDeRhamPlus`, `BDeRham`,
`fontaineThetaInvertP`.

Lean: `DerivedDeRham.rationalHodgePeriodComparison`.

**Checks.**

- `test_bdr_quotient_one`: the first Hodge quotient gives `B_dR⁺/ker θ = C`.
- `test_bdr_p_inverted_inside`: for the identity `ℚ_p → ℚ_p`, p-completion gives zero while Hodge
  completion gives `ℚ_p`; inverting `p` after the limit of `Λ_p dR` would lose `B_dR⁺`.
- `test_bdr_theta_compatible`: the composite `A_inf → A_cris → B_dR⁺ → B_dR⁺/Fil¹` is `θ` followed by
  the inclusion `O_C ⊂ C`.

### 5.14 The structure of B_dR⁺ and the filtered embedding of A_cris

In the period setup, `B_dR⁺` is a complete discrete valuation ring with uniformizer `ξ` and residue field
`C`, `θ` extends to `θ : B_dR⁺ → C`, and its filtration by powers of `ker θ` has
`gr^k B_dR⁺ ≅ C(k) = C ⊗_(ℤ_p) Z_p(1)^(⊗k)` for `k ≥ 0`, `G_K`-equivariantly, with `t = log([ε])` a
generator of `Fil¹/Fil²` for a generator `ε` of `Z_p(1)`. The filtered map `A_cris → B_dR⁺` of 5.13 is
injective, because it is injective on the graded pieces of the separated Hodge (PD) filtration of
`A_cris`. Mathlib's `BDeRhamPlus` provides the ring; these structural statements about it (extension of
`θ`, discrete valuation ring, principal kernel) are owned here.

[Bhatt12], Remark 9.17, p.38, recalling [Fon94]; Mathlib `Mathlib/RingTheory/Perfectoid/BDeRham.lean`.

*Needs:* Layer 5: The period setup; Layer 5: Hodge completion and B_dR⁺; PerfectoidSpaces §P1.18;
CrystallineCohomology §CR.0.7.

Lean: `DerivedDeRham.bdrPlusStructure`.

**Checks.**

- `test_bdr_dvr_residue`: the residue field `B_dR⁺/(ξ)` is `C`.
- `test_bdr_graded_twist`: `σ ∈ G_K` acts on `gr¹ = C·t` by `σ(t) = χ(σ) t`, with `χ` the cyclotomic
  character, so `gr¹ ≅ C(1)` and not `C`.
- `test_bdr_acris_injective`: the image of `γ_n(ξ)` in `B_dR⁺` is `ξ^n/n! ≠ 0`.

### 5.15 Galois invariants of Tate twists

In the period setup, `H⁰(G_K, C(k)) = 0` for `k ≠ 0` and `H⁰(G_K, C) = K̂`; consequently
`H⁰(G_K, Fil^k B_dR⁺) = 0` for `k > 0`, by completeness of the filtration and `gr^k ≅ C(k)`. In particular
a `G_K`-equivariant map `Z_p(1) → Fil² A_cris` is zero, because its composite with the injection of 5.14
lands in `H⁰(G_K, Fil² B_dR⁺(−1)) = 0`.

[Tat67], the theorem cited as Theorem 3.3.2 in [Bhatt12], Remark 9.17, p.38; [Bhatt12], Remark 9.17
for the consequence on `B_dR`.

*Needs:* Layer 5: The structure of B_dR⁺ and the filtered embedding of A_cris; Layer 5: The period setup.

Lean: `DerivedDeRham.tateTwistInvariants`.

**Checks.**

- `test_tate_invariants_zero_twist`: `H⁰(G_K, C) = K̂`, nonzero.
- `test_tate_invariants_one`: `H⁰(G_K, C(1)) = 0`.
- `test_tate_invariants_fil`: `H⁰(G_K, Fil¹ B_dR⁺) = 0` although `Fil¹ B_dR⁺ ≠ 0`.

### 5.16 Relative Tor-amplitude estimates

For a quasisyntomic `R`-algebra `A`, `Λ_p L_(A/R)` has p-complete Tor amplitude `[−1, 0]`; thus
`Λ_p L∧^i L_(A/R)` has amplitude `[−i, 0]`, its Hodge/conjugate shift `[−i]` has `[0, i]` before the
additional derived `ℤ/p` tensor bound, and each finite quotient has a specified finite amplitude bound.
For a quasismooth map the completed `L` is a p-completely flat module in degree zero; ordinary flatness
requires an additional criterion, such as the Noetherian criterion 1.10. For relative `QRSP` algebras
the shifted cotangent and divided-power terms are complete-flat in degree zero. These are Tor-amplitude
assertions, not finite-projectivity assertions.

[BMS19], Lemma 4.7, Lemma 4.34 and Lemma 5.14(1), pp.222, 231, 241.

*Needs:* Layer 1: The quasisyntomic cotangent condition; Layer 0: Derived exterior powers; Layer 0:
Derived divided powers; Layer 5: Quasiregular semiperfectoid rings; Layer 5: The quasisyntomic sites;
Layer 1: Complete flatness and complete faithful flatness.

Lean: `DerivedDeRham.relativeTorAmplitude`.

**Checks.**

- `test_tor_amplitude_weight_zero`: weight 0 has amplitude `[0, 0]`.
- `test_tor_amplitude_shift`: `L` of amplitude `[−1, 0]` gives `L∧^i` in `[−i, 0]` and, after `[−i]`,
  `[0, i]`.
- `test_tor_amplitude_reduction`: an additional derived reduction modulo `p` may contribute one more
  degree.

### 5.17 Descent of p-completed uncompleted de Rham

For a fixed `R ∈ QSyn`, `Λ_p dR_(−/R)` satisfies descent on the relative site `qSyn_R`. If `R = ℤ_p` or `R`
is integral perfectoid, it also satisfies descent on the big slice `QSyn_R`. Modulo `p`, its increasing
exhaustive conjugate filtration has stages uniformly in `D^(≥−1)` on these sites; hence filtered colimits
commute with the Čech totalization in the bounded-below range. The same conclusion holds in [BL22]
Variant E.17's p-quasisyntomic range. The uniform bound and relative-site restriction are explicit.

[BMS19], Example 5.12 and Lemma 4.34, pp.231, 240; [BL22], Variant E.17 with proof, p.236.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Descent of completed cotangent powers; Layer 3: The
conjugate filtration; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate spectral sequence
and convergence; Layer 1: Valid exchanges of completion and derived operations; Layer 5: Relative
Tor-amplitude estimates; PerfectoidSpaces §P1.24.

Lean: `DerivedDeRham.uncompletedPDeRhamDescent`.

**Checks.**

- `test_uncompleted_descent_identity`: descent along the identity is immediate.
- `test_uncompleted_descent_qrsp`: `QRSP` Čech terms have degree-zero conjugate graded pieces (5.16), so
  the bounded-below hypothesis holds.
- `test_uncompleted_descent_unbounded`: a diagram without a uniform lower bound (the non-lci
  `F_p[x,y]/(x,y)²`, whose `dR` has `H^−1 ≠ 0`) is outside the hypothesis.

*Quasiregular semiperfect Witt and PD structure.*

### 5.18 Quasiregular semiperfect derived Witt control

For quasiregular semiperfect `S` over `F_p`, `LWΩ_S` is in degree zero and p-torsion-free, `N^(≥i)LWΩ_S`
is a degree-zero submodule, `φ_i mod p` on `gr_N^i LWΩ_S` injects into `dR_(S/F_p)` with image
`Fil_i^conj`, and `LWΩ_S → S` is a PD thickening. The injectivity is on the Nygaard graded term; it is not
an injectivity claim for `φ_i mod p` on the whole level `N^(≥i)`.

[BMS19], Proposition 8.13 and the end of the proof of Proposition 8.12, pp.273–274.

*Needs:* Layer 4: Derived de Rham–Witt with Nygaard filtration; Layer 5: Quasiregular semiperfectoid
rings; Layer 3: Derived Cartier graded pieces; Layer 1: Complete flatness and complete faithful
flatness; CrystallineCohomology §CR.0.6.

Lean: `DerivedDeRham.qrspWittControl`.

**Checks.**

- `test_qrsp_witt_perfect`: for perfect `S`, `LWΩ_S = W(S)` with Nygaard levels `p^i W(S)`.
- `test_qrsp_witt_degree_zero`: for `S = F_p[t^(1/p^∞)]/(t)`, `LWΩ_S` is a p-torsion-free module in degree
  zero.
- `test_qrsp_witt_singular_boundary`: for the non-semiperfect `F_p[x,y]/(x,y)²`, `LWΩ` is not in degree
  zero (4.4); the left Kan extension does not make an arbitrary singular `S` discrete.

### 5.19 A_crys of perfect-ring quotients by Teichmüller regular sequences

Let `P` be a perfect `F_p`-algebra and `R = P/(x_i)_(i∈I)` the quotient by elements whose Teichmüller
lifts `[x_i]` form, together with `p`, a regular sequence in `W(P)` for every finite subset of `I` (for
example `P = S♭[X_i^(1/p^∞)]` with `X_i ↦ X_i`). Then `A_crys(R)`, the p-completed PD envelope of
`W(P) → R` (CrystallineCohomology §CR.0.6–§CR.0.7), is p-torsion-free, and `R` has a PD thickening by it.
Proof: reduce to finitely many variables by filtered colimits; the PD envelope of a regular sequence is
`W(P)⟨T_i⟩/(T_i − [x_i])` (envelopes of regular immersions, CrystallineCohomology §CR.0.6), and the
divisibility argument of [SW13] for one variable (`p a_n = X b_n − n T b_(n−1)`, inductively `b_n ∈ pW`)
shows that its p-completion is p-torsion-free; tensor products over `W(P)` of these flat pieces keep
this property.

[SW13], proof of Lemma 4.1.8, pp.32–33 (the case `F_p[X^(1/p^∞)]/(X)`, reduced to it by tensor
decomposition), with Remark 4.1.10 and Proposition 4.1.11, p.33; [BMS19], proof of Proposition 8.12,
p.273.

*Needs:* CrystallineCohomology §CR.0.6–§CR.0.7; Layer 1: Derived limits of towers; Mathlib `WittVector`,
`WittVector.teichmuller`.

Lean: `DerivedDeRham.acrysTeichmullerTorsionFree`.

**Checks.**

- `test_acrys_tf_perfect`: for `I = ∅`, `A_crys(P) = W(P)`, p-torsion-free.
- `test_acrys_tf_one_variable`: for `R = F_p[X^(1/p^∞)]/(X)`, `A_crys(R)` is the p-completion of
  `W(R♭)[[X]^n/n!]` inside `W(R♭)[1/p]`, p-torsion-free.
- `test_acrys_tf_two_variables`: for `R = F_p[X^(1/p^∞), Y^(1/p^∞)]/(X, Y)`, `A_crys(R)` is the completed
  tensor product over `ℤ_p` of two one-variable copies, and is p-torsion-free.

### 5.20 Quasiregular semiperfect derived de Rham and PD envelopes

For every quasiregular semiperfect `F_p`-algebra `S`, put `S^♭ = lim_φ S` and `I = ker(S^♭ → S)`. Then
`dR_(S/F_p) ≃ dR_(S/S^♭)` is discrete and naturally identifies with `D_(S^♭)(I) = A_crys(S)/p`. The Hodge
filtration is the PD filtration and the increasing conjugate filtration agrees with the PD conjugate
filtration (4.5), with `gr_* ≃ Γ^*_S(I/I²)`. No finite-generation or regular-sequence hypothesis on `I` is
imposed. The proof reduces to `S̃ = S♭[X_i^(1/p^∞), i ∈ I]/(X_i)` as in [BMS19] and uses 5.19 for the
torsion-freeness of `A_crys(S̃)`.

[BMS19], Proposition 8.12 and proof, pp.272–273.

*Needs:* Layer 5: Quasiregular semiperfectoid rings; Layer 0: The cotangent transitivity triangle;
Layer 0: Derived divided powers; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate
filtration; Layer 4: Regular quotients and classical PD envelopes; Layer 4: The conjugate filtration of a
PD envelope; Layer 4: Derived de Rham–Witt with Nygaard filtration; Layer 5: A_crys of perfect-ring
quotients by Teichmüller regular sequences; CrystallineCohomology §CR.0.6.

Lean: `DerivedDeRham.qrspPdDerham`.

**Checks.**

- `test_qrsp_pd_perfect`: perfect `S = F_p` has `I = 0` and `dR = F_p`.
- `test_qrsp_pd_root_quotient`: `S = F_p[t^(1/p^∞)]/(t)` has `dR_(S/F_p)` discrete with divided powers of
  the class of `t` in degree zero, for an infinitely generated kernel.
- `test_qrsp_pd_not_semiperfect`: `F_p[t]` is not semiperfect and `dR_(F_p[t]/F_p)` has `H¹ ≠ 0`.

### 5.21 The structure theorem for A_crys(S)

For every quasiregular semiperfect `F_p`-algebra `S`, `A_crys(S)` is p-torsion-free and has a natural
`φ`-equivariant identification `A_crys(S) ≃ LWΩ_S` matching Nygaard filtrations. Its `N^(≥i)` is
`{x : φ(x) ∈ p^i A_crys}`; the divided Frobenius `gr_N^i → A_crys/p` injects with conjugate image
`Fil_i^conj`. The image of `N^(≥i)` modulo `p` is `Fil_H^i dR`. Nygaard completion modulo `p` is
Hodge-completed `dR`, and `φ mod p` is `x ↦ x^p`. Nygaard completion and completion at the PD ideal are
not identified; at `p = 2` the latter can collapse `ℤ₂` to `F₂`.

[BMS19], Theorem 8.14 and proof, pp.274–275.

*Needs:* Layer 5: Quasiregular semiperfect derived de Rham and PD envelopes; Layer 5: Quasiregular
semiperfect derived Witt control; Layer 4: Derived de Rham–Witt with Nygaard filtration; Layer 4: The
conjugate filtration of a PD envelope; Layer 5: A_crys of perfect-ring quotients by Teichmüller regular
sequences; CrystallineCohomology §CR.0.7.

Lean: `DerivedDeRham.acrysStructure`.

**Checks.**

- `test_acrys_structure_fp`: for `S = F_p`, `A_crys = ℤ_p`, `φ = id` and `N^(≥i) = p^i ℤ_p`.
- `test_acrys_structure_divided_frobenius`: the whole divided Frobenius is surjective modulo `p` while
  the graded map is the stated injection.
- `test_acrys_structure_p_two`: at `p = 2`, completion at the PD ideal `(2)` of `ℤ₂` with its divided
  powers is not the Nygaard completion; `γ_(2^a)(2)` has valuation 1 for all `a`.

*Canonical crystalline Čech complexes.*

### 5.22 The canonical crystalline Čech complex

For a Noetherian regular `F_p`-algebra `A`, let `S = A_perf` be its direct-limit perfection. Frobenius of
`A` is flat by Kunz's theorem ([StacksLC] Lemma 51.17.6, Tag 0EC0), and injective on spectra, so
`A → S` is faithfully flat; `F_p → A` is a regular map, so `A` is a filtered colimit of smooth
`F_p`-algebras (SchemeAndStackFoundations §0.15; [StacksSmoothing] Tag 07GB) and `L_(A/F_p) ≃ Ω¹_(A/F_p)[0]`
is flat by 0.11–0.12; hence `L_(S/A) ≃ L_(A/F_p) ⊗ S[1]` has Tor amplitude in degree `−1`, and `A → S` is
a quasisyntomic cover whose completed Čech terms are quasiregular semiperfect. The canonical cochain
complex `A_crys(S) → A_crys(S ⊗_A S) → …` computes `RΓ_crys(A/ℤ_p)`, through the unfolding of `LWΩ` on
`QSyn_(F_p)` and the identification `LWΩ_B ≃ WΩ•_B ≃ RΓ_crys(B/ℤ_p)` for smooth `B` (CrystallineCohomology
§CR.4.7). Regularity is essential for faithful flatness of perfection; this formula is not asserted for
arbitrary singular `A`.

[BMS19], Remark 8.15, pp.275–276.

*Needs:* Layer 5: The structure theorem for A_crys(S); Layer 4: Derived de Rham–Witt with Nygaard
filtration; Layer 5: Compatible-root quasisyntomic covers; Layer 5: Refinement and Čech stability of QRSP
covers; Layer 5: Sheaves and unfolding from the QRSP basis; Layer 5: Descent of p-completed uncompleted
de Rham; Layer 0: Localization and filtered colimits of cotangent complexes; CrystallineCohomology
§CR.2.1, §CR.4.6–§CR.4.7; SchemeAndStackFoundations §0.15.

Lean: `DerivedDeRham.regularFpCrystallineCech`.

**Checks.**

- `test_crys_cech_perfect`: for a perfect `A`, `S = A` and the complex is `W(A)` in degree zero.
- `test_crys_cech_line`: for `A = F_p[t]`, perfection is flat and its Čech terms are semiperfect; the
  complex computes `H⁰ = ℤ_p` and the crystalline `H¹` of the affine line.
- `test_crys_cech_singular`: for `A = F_p[x,y]/(x,y)²`, Frobenius is not flat (Kunz), so the perfection
  map is not a cover and the formula is not asserted.

*Proper smooth cohomology and base change.*

Apply proper flat coherent cohomology to differential bundles at finite level, then the effectivity
theorem 1.13 for compatible systems of perfect complexes.

### 5.23 Proper smooth de Rham perfectness

Let `A` be p-complete with bounded p-torsion and `X` a proper p-completely smooth formal `A`-scheme of
finite presentation, with compatible proper smooth ordinary reductions `X_n/A_n` of bounded relative
dimension `d`. Then the p-completed continuous de Rham global object is a perfect derived p-complete
`A`-complex. Each `RΓ(X_n, Ω^i_(X_n/A_n))` is perfect and commutes with base change by JacobianChallenge
Layer C in the form of [StacksPerfect] Lemma 36.30.4(2) (Tag 0B91), its Hodge quotient is a finite
extension of these pieces, and `Ω^i = 0` for `i > d`; the compatible perfect complexes over `A/p^n` assemble
into a perfect p-complete complex by 1.13. No degeneration or finite-projective individual `H^j` is
asserted. The same finite-filtration argument applies to an ordinary proper smooth finite-presentation
`A`-scheme with its smooth ordinary or Hodge-completed comparison in the appropriate characteristic.

[StacksPerfect], §36.30, Lemmas 36.30.1 and 36.30.4 with proof; Tags 0A1H, 0B91, pp.73–74; [StacksMA]
Lemma 15.99.4, Tag 09AW, p.288.

*Needs:* Layer 2: The de Rham algebra of a completely smooth formal algebra; Layer 3: Smooth ordinary and
completed de Rham comparisons; Layer 5: Derived de Rham on schemes and formal schemes; Layer 5: Relative
Tor-amplitude estimates; Layer 5: Descent of Hodge quotients and completion; Layer 1: Valid exchanges of
completion and derived operations; Layer 1: Effectivity of compatible perfect systems; JacobianChallenge
Layer C; SchemeAndStackFoundations §2.18, §4.7; Mathlib `AlgebraicGeometry.IsProper`,
`AlgebraicGeometry.Smooth`.

Lean: `DerivedDeRham.properSmoothCohomologicalControl`.

**Checks.**

- `test_proper_perfect_point`: `Spec A` has dimension 0 and value `A`.
- `test_proper_perfect_line`: `ℙ¹_A` has de Rham cohomology `A` in degrees 0 and 2, perfect.
- `test_proper_perfect_nonproper`: `Spec F_p[t]` is smooth and finite-dimensional but not proper, and
  `H⁰ = F_p[t^p]` is infinite-dimensional over `F_p`; a perfect complex need not have projective
  individual cohomology either.

### 5.24 Completed base change and cup products

Under the hypotheses of 5.23, a bounded-torsion p-complete base map `A → A′` gives a natural equivalence
`RΓ_dR(X/A) ⊗̂^L_A A′ ≃ RΓ_dR(X ⊗̂_A A′/A′)`, compatibly with Hodge filtrations and cup products. All
completed tensors and reductions are derived; the finite-level base change is [StacksPerfect] Lemma
36.30.4 and the passage to the limit is 1.13. For general `QSyn` algebras the affine base-change/Künneth
and descent products are available, but neither proper global perfectness nor a finite-projective
cohomology conclusion follows.

[StacksPerfect], Tag 0A1G, Lemma 36.30.1 and Remark 36.30.2, pp.73–74; [StacksMA] Lemma 15.99.4.

*Needs:* Layer 5: Proper smooth de Rham perfectness; Layer 5: Descent of Hodge quotients and completion;
Layer 2: Derived base change and Künneth; Layer 5: Derived de Rham on schemes and formal schemes; Layer 1:
Completed filtered tensor products; Layer 1: Valid exchanges of completion and derived operations; Layer
1: Effectivity of compatible perfect systems; JacobianChallenge Layer C.

Lean: `DerivedDeRham.completedBaseChangeCupProducts`.

**Checks.**

- `test_base_change_identity`: identity base change is the identity.
- `test_base_change_cup_point`: for `Spec A` the cup product is multiplication.
- `test_base_change_cup_line`: on `ℙ¹` a degree-two class has square zero by dimension.

*Projective variants and formal étale realization.*

The projective site strengthens the mod-p module condition and Tor amplitude without imposing finite
generation. Formal realization uses only charts that meet the `QSyn` conditions and actual covering
families.

### 5.25 The proj-quasisyntomic variant over O_C

For `O_C` with `C` a perfectoid field of characteristic zero (PerfectoidSpaces §P1.10), a map `A → B` of
p-complete p-torsion-free `O_C`-algebras is proj-quasisyntomic if `B/p` is a projective `A/p`-module and
`L_((B/p)/(A/p))` has projective amplitude `[−1, 0]`; it is a cover if `B/p` is also faithfully flat. Form
the relative `proj-qSyn_(O_C)` and `proj-qrsPerfd_(O_C)` sites, `DerivedDeRham.projQuasisyntomicSite`.
They have completed base-change and composition stability, compatible-root basis covers and the
unfolding equivalence of 5.5. Projective amplitude is stronger than Tor amplitude and does not imply
finite generation.

[BMS19], Variant 4.36 and Footnotes 12–13, p.232.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Compatible-root quasisyntomic covers; Layer 5:
Refinement and Čech stability of QRSP covers; Layer 5: Sheaves and unfolding from the QRSP basis;
PerfectoidSpaces §P1.10, §P1.24–§P1.25.

Prove the following named laws.

- `projQSynCover`: a cover has projective faithfully flat reduction and projective cotangent amplitude
  `[−1, 0]`.
- `projQSynSmooth`: the p-completion of a smooth `O_C`-algebra is in the relative projective site.
- `projQSynRootBasis`: every such object admits a compatible-root cover by proj-QRSP objects.
- `projQSynUnfolding`: restriction to the proj-QRSP basis is inverse to unfolding.

**Checks.**

- `test_proj_qsyn_identity`: `O_C → O_C` has rank-one projective reduction and zero relative cotangent.
- `test_proj_qsyn_smooth`: `O_C⟨t⟩` has the free coordinate differential module and qualifies.
- `test_proj_qsyn_torsion`: an `O_C`-algebra with nonzero p-torsion is excluded even if its reduction
  happens to be projective.

### 5.26 From quasisyntomic sheaves to formal étale sites

For a p-complete formal scheme `X` (SchemeAndStackFoundations §4.7) with `QSyn` affine charts, a functor
`F` on `QSyn` satisfying descent defines `F_X` on the small étale site of the reduction `X₀`
(`AlgebraicGeometry.Scheme.smallEtaleTopology`) by `F_X(U) = lim_(Spf A ⊆ U) F(A)`, the limit over affine
formal opens; étale `X₀`-schemes lift uniquely to p-completely étale charts, since étale maps have zero
cotangent complex (0.12, 0.25) and the lifts algebraize by 1.12. Smooth and étale maps
of such charts are quasisyntomic maps. A completely faithfully flat map, or a jointly covering family with
that property, supplies quasisyntomic descent, so the local values glue; an individual open immersion is
not a cover. The construction is natural in `X` and retains the coefficient category and any complete
filtration carried by `F`; the small site is used only after chart hypotheses are checked.

[BMS19], Remark 10.4 and its construction, p.288.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Sheaves and unfolding from the QRSP basis; Layer 5:
Descent of Hodge quotients and completion; Layer 1: Elkik algebraization of completely smooth and étale
algebras; SchemeAndStackFoundations §4.7; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`.

Lean: `DerivedDeRham.formalEtaleRealization`.

Prove the following named laws.

- `formalEtaleAffine`: on `Spf A` the restricted sheaf recovers `F(A)`.
- `formalEtaleCoverDescent`: an étale affine-chart cover gives the Čech descent equivalence.
- `formalEtalePullback`: compatible morphisms of formal schemes induce the sheaf pullback maps.
- `formalEtaleFiltered`: for complete filtered targets, evaluation and graded pieces commute with the
  chart-limit construction.

**Checks.**

- `test_formal_etale_affine`: for `X = Spf ℤ_p` and its identity chart, the value is `F(ℤ_p)`.
- `test_formal_etale_smooth_chart`: smooth p-complete polynomial charts over an integral perfectoid base
  satisfy the `QSyn` hypothesis.
- `test_formal_etale_bad_chart`: a chart with unbounded p-torsion is not accepted as a `QSyn` chart.

### Examples

`ℤ_p` and `F_p` are `QSyn` objects, but `ℤ_p → F_p` fails complete flatness. `ℤ_p` has semiperfect
reduction but no integral perfectoid source, so it is not `QRSP`. The free root tower and its first
finite stage distinguish genuine semiperfectness from adjoining one root. The affine line over `F_p` has
`H⁰ = F_p[t^p]`, illustrating why descent alone supplies no global finiteness. For the identity
compatible system of roots of unity, `[1] − 1 = 0` and its logarithm vanishes.

### Dependencies

Layers 0–4 supply cotangent powers, complete flatness, de Rham, Cartier, PD filtrations and Witt theory.
PerfectoidSpaces supplies integral perfectoid rings, perfectoid fields and the principal `θ`-kernel;
CrystallineCohomology supplies PD envelopes, `A_cris`, crystalline cohomology and de Rham–Witt complexes;
SchemeAndStackFoundations supplies formal spectra, quasi-coherent derived categories and Néron–Popescu
desingularization; JacobianChallenge Layer C supplies proper flat base change; Mathlib supplies `A_inf`,
`θ`, `B_dR⁺`, `B_dR` and étale sites.

## Layer 6: Logarithmic cotangent and de Rham theory

*Free prelog resolutions and Gabber's cotangent complex.*

Use the two sorts of free generators, with compatibility between a monoid generator and its ring image.
Prelog rings, log structures, charts and their morphisms are CrystallineCohomology §CR.5:log-algebra.1–
§CR.5:log-algebra.3. The integral logification and Gabber–Olsson comparisons are established in their
stated ranges as part of the functorial construction.

### 6.1 Free prelog resolutions

For a prelog ring `(A, M)` (a ring `A`, a commutative monoid `M` and a monoid map `α : M → (A, ·)`), the
free prelog `(A, M)`-algebra on sets `T₀, T₁` is `(A[T₀, ℕ^(T₁)], M ⊕ ℕ^(T₁))`, with the monoid generators
sent to the corresponding monomials. The free/forgetful comonad on the underlying generator sets gives
the standard simplicial resolution `P• → (B, N)` of a prelog `(A, M)`-algebra by termwise free prelog
algebras, `DerivedDeRham.freePrelogResolutions`, surjective on rings and on monoids in every simplicial
degree; any two such resolutions are homotopy equivalent and every functor of free prelog algebras
takes them to quasi-isomorphic complexes after realization, as in 0.1. Finitely generated free objects
are the compact generators; a functor of prelog algebras that commutes with filtered colimits and
reflexive coequalizers is determined by its values on them.

[Bhatt12], §§4–5, Propositions 5.3–5.5; Remark 6.10, pp.19–24, 26; [KY], §2.1, Notation 2.4 and Remark 2.8,
pp.12–14.

*Needs:* CrystallineCohomology §CR.5:log-algebra.1; Layer 0: Simplicial polynomial resolutions; Mathlib
`SimplicialObject`.

Prove the following named laws.

- `freePrelogUniversal`: a base prelog map from the free object is uniquely determined by its ordinary
  ring generators and compatible monoid generators.
- `prelogResolutionAugmentation`: the standard resolution has a surjective augmentation on ring and
  monoid in every simplicial degree.
- `prelogResolutionComparison`: two resolutions compare by a homotopy equivalence, unique up to homotopy.
- `prelogAnimationExtend`: a functor of free prelog algebras with values in complexes extends to all
  prelog algebras by evaluation on resolutions.

**Checks.**

- `test_prelog_free_empty`: with both generator sets empty the free object is `(A, M)`.
- `test_prelog_free_two_generators`: one ordinary `t` and one monoid `x` give `(A[t, x], M ⊕ ℕ)`, with `x`
  the image of the monoid generator.
- `test_prelog_free_no_identification`: the monoid generator `x` is not freely mapped independently of its
  ring image; forgetting this compatibility gives the wrong adjunction.

### 6.2 Homotopy pushouts of prelog rings

The homotopy pushout of prelog rings `S₁ ⊔^L_R S₂` is computed by a free prelog resolution of `S₁` over
`R` tensored with `S₂`: its underlying simplicial ring is the derived tensor product of rings and its
underlying simplicial monoid is the homotopy pushout of commutative monoids, because the forgetful
functor to pairs (simplicial monoid, simplicial ring) commutes with homotopy colimits. The p-completed
homotopy pushout completes the ring component only; for p-complete prelog rings with bounded p-torsion,
reduction modulo `p` is `S ⊗^L_ℤ F_p` on the ring component with the monoid unchanged.
`DerivedDeRham.prelogHomotopyPushout`.

[KY], Remark 2.8, Definition 2.44 and Remark 2.45, pp.13–14, 23–24; [Bhatt12], Definition 4.8 and
Proposition 4.9, pp.20–21; [KY], Lemma 3.6(2) with proof, p.28.

*Needs:* Layer 6: Free prelog resolutions; Layer 0: Derived tensor products on module derived
categories; Layer 1: Completion of simplicial commutative algebras.

**Checks.**

- `test_prelog_pushout_trivial_monoids`: for trivial monoids it is the derived tensor product of rings.
- `test_prelog_pushout_monoid`: for `(ℤ[ℕ], ℕ) ← (ℤ[ℕ], ℕ) → (ℤ[ℕ], ℕ)` along `1 ↦ 2` on one side, the monoid
  pushout is `ℕ ⊔_ℕ ℕ`, computed as a homotopy pushout of monoids, not the ordinary pushout of rings.
- `test_prelog_pushout_completion`: p-completing `(ℤ[ℕ], ℕ)` gives `(ℤ_p⟨x⟩, ℕ)`; the monoid is not
  completed.

### 6.3 Derived logarithmic derivations

For a map `(A, M) → (B, N)` and a `B`-module `P`, define log derivations as base-compatible sections of
`(B ⊕ P, N ⊕ P) → (B, N)`. The ring is the split square-zero extension, the monoid operation is
`(n, u)(n′, u′) = (nn′, u + u′)`, and its structure sends `(n, u)` to `(α(n), α(n)u)`. Sections are a ring
derivation `D : B → P` and an additive log derivative `δ : N → P` with `D(α(n)) = α(n)δ(n)`, both zero on
the base, `DerivedDeRham.logDerivedDerivations`. The higher structure is recorded by `Ext` groups against
the log cotangent complex (6.4), as in 0.6.

[Bhatt12], Remark 6.6 and displayed equivalence (6), pp.25–26.

*Needs:* Layer 6: Free prelog resolutions; Layer 0: Square-zero extensions and their classes;
CrystallineCohomology §CR.5:log-algebra.1.

Prove the following named laws.

- `logDerivationsDiscrete`: log derivations into a module are the compatible pairs `(D, δ)` with
  `Dα = αδ`.
- `logDerivationsModuleMap`: a `B`-linear `P → P′` induces the map of log derivations.
- `logDerivationsFree`: for finite free prelog generators the derivations are freely specified by
  ordinary `D(t)` and logarithmic `δ(x)`.
- `logDerivationsRepresented`: the Gabber cotangent complex represents log derivations by
  `Hom_(D(B))(L_log, P)`.

**Checks.**

- `test_log_derivations_identity`: for the identity prelog map there are no nonzero log derivations.
- `test_log_derivations_coordinate`: for `(A, 0) → (A[x], ℕ)`, a log derivation has `D(x) = x δ(1)`.
- `test_log_derivations_log_point`: for `(k, 0) → (k, ℕ → 0)`, log derivations have `D = 0` and arbitrary
  `δ(1) ∈ P`; the representing object still has an additional negative cotangent term.

### 6.4 The Gabber logarithmic cotangent complex

For a prelog map `(A, M) → (B, N)`, define `L_log = L_((B,N)/(A,M))`, `DerivedDeRham.gabberLogCotangent`,
by realizing `Ω¹_log` of the free prelog resolution and extending its coefficients to `B`. It represents
log derivations, is natural and resolution-independent, and has the universal ring derivation `d` and
monoid map `d log`. For ordinary prelog rings `H⁰` is the ordinary logarithmic differential module, with
`dα(n) = α(n) d log n`. This is Gabber's complex; Olsson's complex is identified with it only for integral
morphisms of integral prelog rings, not for all log smooth maps.

[Bhatt12], Definition 6.3, Remark 6.4, Proposition 6.5 and Remark 6.6, pp.24–26; [KY], Definition 2.5,
Lemmas 2.9–2.10, Remark 2.13, pp.13–15; [Ols05], §8 (Gabber's construction), Lemma 8.22 and Theorem
8.32.

*Needs:* Layer 6: Free prelog resolutions; Layer 6: Derived logarithmic derivations; Layer 0: The full
cotangent complex; CrystallineCohomology §CR.5.1 (log differentials); Mathlib `DerivedCategory`.

Prove the following named laws.

- `logCotangentUniversal`: `Hom_(D(B))(L_log, P) ≃` log derivations into `P`, and `Hom(L_log, P[1])` is the
  group of log square-zero extensions.
- `logCotangentH0`: for ordinary inputs `H⁰ L_log ≃ Ω¹_log` with the displayed `d`/`d log` relation.
- `logCotangentOrdinaryMap`: there is a natural map `L_(B/A) → L_log`, an equivalence when the monoid map
  is an isomorphism ([KY] Lemma 2.9; [Ols05] Lemma 8.22).
- `logCotangentNaturality`: base-compatible prelog squares give maps of the complexes and of the universal
  `d`, `d log`.

**Checks.**

- `test_log_cotangent_identity`: an identity prelog map has zero cotangent complex.
- `test_log_cotangent_free`: for `(A, 0) → (A[t, x], ℕ)`, `L_log` is free in degree zero on `dt` and
  `d log x`, with `dx = x d log x`.
- `test_log_cotangent_nonintegral`: [KY] Remark 2.13, with `P` generated by `(2,0), (0,2), (1,1)` inside
  `ℕ²` and `char(k) ≠ 2`, is log étale but has nonzero Gabber cotangent complex (unbounded on the left,
  [Ols05] 7.3).

### 6.5 Log cotangent transitivity, base change and invariance

For composable prelog maps `R → S → T`, `L_log(S/R) ⊗^L_S T → L_log(T/R) → L_log(T/S)` is a distinguished
triangle ([Ols05] Theorem 8.18). A homotopy pushout of prelog rings (6.2) gives the corresponding derived
cotangent base-change equivalence, and filtered colimits commute with `L_log`. A prelog map inducing an
isomorphism of associated log rings has relative cotangent zero, so passage to the associated log
structure preserves `L_log` ([Ols05] Theorem 8.20). For an integral morphism of integral prelog rings
that is log smooth after logification, `L_log ≃ Ω¹_log` in degree zero ([KY] Lemma 2.14 and its proof,
using [Ols05] Theorem 8.32 and 1.1(iii)). The derived pushout is replaced by the ordinary one only under
homological log flatness.

[KY], Lemmas 2.10, 2.14, Theorem 2.11 and Remark 2.12, pp.14–16; [Ols05], Theorems 8.18, 8.20, 8.32 and
1.1(iii).

*Needs:* Layer 6: The Gabber logarithmic cotangent complex; Layer 6: Free prelog resolutions; Layer 6:
Homotopy pushouts of prelog rings; Layer 0: The cotangent transitivity triangle; CrystallineCohomology
§CR.5:log-algebra.3 (log smoothness), §CR.5:log-algebra.5 (integral log structures).

Lean: `DerivedDeRham.logCotangentFunctoriality`.

**Checks.**

- `test_log_transitivity_identity`: identity maps have zero relative `L_log`.
- `test_log_transitivity_strict`: for identical monoids the triangle is the ordinary transitivity
  triangle.
- `test_log_base_change_pushout`: the homotopy prelog pushout includes ring and monoid terms; for trivial
  monoids it is 0.10.

### 6.6 Homological logarithmic flatness

A prelog map `R → S` is homologically log flat (hlf) if for every prelog map `R → S′` the homotopy pushout
`S′ ⊔^L_R S` (6.2) is equivalent to the ordinary pushout. It is hlf faithfully flat if moreover the
underlying ring map is faithfully flat. Equivalently, the ring map is flat and the monoid map is flat in
the homotopy-pushout sense of [Bhatt12] Definition 4.8. This differs from Kato log flatness in both
directions. Covers define the hlf topology on prelog algebras, `DerivedDeRham.homologicalLogFlatness`.

[KY], Definition 2.44 and Remarks 2.45–2.46, pp.23–24; [Bhatt12], Definition 4.8 and Proposition 4.9,
pp.20–21.

*Needs:* Layer 6: Free prelog resolutions; Layer 6: Homotopy pushouts of prelog rings; Layer 6: Log
cotangent transitivity, base change and invariance; CrystallineCohomology §CR.5:log-algebra.1.

Prove the following named laws.

- `hlfUnderlyingCriteria`: hlf iff ring-flat and monoid homotopy-pushout-flat.
- `hlfPushoutOrdinary`: every base change has the displayed derived-to-ordinary pushout equivalence.
- `hlfCompositionBaseChange`: hlf and hlf faithfully flat maps are stable under composition and base
  change.
- `hlfIntegralSufficient`: an underlying flat ring map with injective integral map of integral monoids is
  hlf ([KY] Remark 2.45).

**Checks.**

- `test_hlf_strict_flat`: a strict map with flat underlying ring is hlf.
- `test_hlf_diagonal`: the diagonal `(k, ℕ → 0) → (k, ℕ² → 0)` is hlf but not Kato log flat.
- `test_hlf_nonintegral_kato`: for `P` generated by `(2,0), (0,2), (1,1)` in `Q = ℕ²`,
  `(k[P], P) → (k[Q], Q)` is Kato log flat but not hlf.

*Log de Rham, Cartier and logification.*

Realize the ordinary logarithmic complex, then prove the derived graded identifications. Scalar rings,
shifts and the ring/monoid homotopy pushout are part of every comparison. Ordinary `d` and closed
`d log` have different generator formulas.

### 6.7 Logarithmic derived de Rham

For a prelog map `(A, M) → (B, N)`, realize the ordinary log de Rham dg algebra of the free prelog
resolution with direct sums along antidiagonals, `DerivedDeRham.logDerivedDeRham`. This gives a
graded-commutative dg `A`-algebra `dR_log` with universal ordinary `d` and closed `d log : N → dR_log[1]`.
It has a decreasing multiplicative Hodge filtration with `gr_H^i ≃ L∧^i_B L_log[−i]`, an increasing
exhaustive conjugate filtration, a separate Hodge completion and the Layer 1 p-completion. Strict maps
with identical monoids recover ordinary derived de Rham. The derived algebra is `A`-linear; its full
differential is generally not `B`-linear.

[Bhatt12], Definition 6.8, Proposition 6.9, Remarks 6.10–6.11, pp.25–26; [KY], Construction 2.6, p.13.

*Needs:* Layer 6: Free prelog resolutions; Layer 6: The Gabber logarithmic cotangent complex; Layer 2:
De Rham cohomology from polynomial resolutions; Layer 2: The universal differential graded algebra;
Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham; Layer 0: Derived exterior
powers; CrystallineCohomology §CR.5.1.

Prove the following named laws.

- `logDeRhamHodgeGraded`: `gr_H^i dR_log ≃ L∧^i L_log[−i]`.
- `logDeRhamDLog`: the additive monoid map `d log` is closed and lands in `dR_log[1]`.
- `logDeRhamStrict`: for identical base and target monoids, `dR_log` is ordinary derived de Rham.
- `logDeRhamCompletions`: Hodge and p-completion are separate functors with their universal maps and
  quotient towers.

**Checks.**

- `test_log_derham_identity`: an identity prelog map gives the base ring with no positive Hodge pieces.
- `test_log_derham_free_coordinate`: for `(F_p, 0) → (F_p[x], ℕ)`, `d(x) = x d log x` and
  `d(d log x) = 0`.
- `test_log_derham_rational_logification`: [Bhatt12] Example 6.15: strict `ℚ → ℚ[x, x⁻¹]` gives
  uncompleted `dR = ℚ`, while logifying the units adds a degree-one conjugate class.

### 6.8 Log de Rham base change and Künneth

For a homotopy pushout `S` of prelog `A`-algebras `S₁, S₂`, `dR_log(S₁/A) ⊗^L_A S₂ ≃ dR_log(S/S₂)` and
`dR_log(S₁/A) ⊗^L_A dR_log(S₂/A) ≃ dR_log(S/A)`, compatibly with Hodge filtrations and multiplication. The
p-completed versions use completed derived tensor. The first tensor is over the base ring `A`;
`dR_log(S₁/A)` is not generally an `S₁`-module, so the additional `S₁`-relative tensor printed in [KY]
Theorem 2.11 is not used.

[Bhatt12], Proposition 6.12 and proof, p.26; [KY], Theorem 2.11, second displayed formula, p.15.

*Needs:* Layer 6: Logarithmic derived de Rham; Layer 6: Homotopy pushouts of prelog rings; Layer 6:
Homological logarithmic flatness; Layer 2: Derived base change and Künneth; Layer 1: Completed filtered
tensor products.

Lean: `DerivedDeRham.logDeRhamBaseChange`.

**Checks.**

- `test_log_kunneth_identity`: base change along the identity preserves the value.
- `test_log_kunneth_free`: free ring and log variables tensor with the signed differential.
- `test_log_kunneth_non_hlf`: for a non-hlf map the ordinary pushout does not compute the homotopy
  prelog pushout (6.6).

### 6.9 Derived logarithmic Cartier theory

For a map `(A, M) → (B, N)` of prelog `F_p`-algebras, define the Frobenius of the base by `p` on `M` and
Frobenius on `A` and form the homotopy prelog pushout `(B, N)^(1)`. The relative Frobenius maps it to
`(B, N)`. The increasing conjugate filtration of `dR_log` is linear over its twisted underlying ring and
`gr_i^conj ≃ L∧^i L_log((B, N)^(1)/(A, M))[−i]`. On free ordinary coordinates `y`, inverse Cartier sends
`dy` to `[y^(p−1) dy]`; on free log coordinates `x` it sends `d log x` to `[d log x]`. All twists are derived
unless the ring and monoid flatness criteria are proved.

[Bhatt12], Notation 7.1, Lemma 7.2, Theorem 7.3 and Proposition 7.4, pp.27–28; [KY], Notation 2.15 and
Construction 2.6, pp.13, 16.

*Needs:* Layer 6: Logarithmic derived de Rham; Layer 6: Free prelog resolutions; Layer 6: Log cotangent
transitivity, base change and invariance; Layer 3: The derived Frobenius twist; Layer 3: Derived Cartier
graded pieces; Layer 0: Derived exterior powers; CrystallineCohomology §CR.5.1 (log Cartier isomorphism).

Lean: `DerivedDeRham.logCartier`.

**Checks.**

- `test_log_cartier_ordinary`: `C⁻¹(dy^(1)) = [y^(p−1) dy]`.
- `test_log_cartier_log`: `C⁻¹(d log x^(1)) = [d log x]`, including `p = 2`.
- `test_log_cartier_twist_monoid`: the twisted monoid map is multiplication by `p`.

### 6.10 The boundary of logification invariance

For maps of integral prelog `ℤ/p^n`-algebras, `n ≥ 1`, passage to associated log structures preserves
uncompleted log derived de Rham with its Hodge and conjugate filtrations. The proof uses the derived
logarithmic Cartier pieces modulo `p`, logification invariance of `L_log` (6.5) and finite p-dévissage.
The p-completed statement follows under the corresponding integral and compatible derived-reduction
hypotheses. No characteristic-zero uncompleted invariance is asserted: [Bhatt12] Example 6.15 is a
counterexample. Cotangent logification invariance and this de Rham assertion have different ranges.

[Bhatt12], Corollary 7.5 and proof, pp.28–29; Example 6.15, p.27.

*Needs:* Layer 6: Log cotangent transitivity, base change and invariance; Layer 6: Derived logarithmic
Cartier theory; Layer 6: Logarithmic derived de Rham; Layer 1: The derived completion reflector;
CrystallineCohomology §CR.5:log-algebra.5.

Lean: `DerivedDeRham.logificationBoundaries`.

**Checks.**

- `test_logification_char_p`: over `F_p`, the prelog chart `ℕ → F_p[x]` and its logification give the same
  log derived de Rham complex.
- `test_logification_rational_counterexample`: over `ℚ`, [Bhatt12] Example 6.15 shows the uncompleted
  invariance fails.
- `test_logification_cotangent_range`: the cotangent complex is logification-invariant also over `ℚ`,
  while the de Rham statement is not.

### 6.11 Integral log smooth Cartier-type comparison

For a map of integral prelog `F_p`-algebras that is integral and log smooth of Cartier type after
logification, Gabber `L_log` is the ordinary log differential module (6.5) and derived log de Rham agrees
with the ordinary log complex. Nilpotent-p extensions retain flatness and finite dévissage hypotheses.
Cartier type is the condition of CrystallineCohomology §CR.5.1 on the relative Frobenius; it is not
inferred from fs log smoothness alone.

[Bhatt12], Corollary 7.6 and its proof, pp.28–29; [KY], Lemma 2.14, pp.15–16.

*Needs:* Layer 6: Log cotangent transitivity, base change and invariance; Layer 6: Derived logarithmic
Cartier theory; Layer 6: The boundary of logification invariance; CrystallineCohomology §CR.5.1,
§CR.5:log-algebra.3.

Lean: `DerivedDeRham.logSmoothCartierComparison`.

**Checks.**

- `test_log_smooth_identity`: the identity chart gives the base.
- `test_log_smooth_free_coordinate`: a free log coordinate satisfies the integral Cartier-type criterion.
- `test_log_smooth_nonintegral`: a log-étale nonintegral monoid map (6.4) has nonzero Gabber cotangent
  complex; integrality cannot be dropped.

*Log crystalline comparison in the regular range.*

Exactify before taking the strict PD envelope. The equivalence theorem requires a regular-sequence
quotient after the Cartier-type log smooth map.

### 6.12 The log crystalline comparison map

For a prelog `ℤ/p^n`-map `f : (A, M) → (B, N)`, use the standard free prelog resolution `P• → (B, N)`. For
every surjection `P_i → (B, N)`, first exactify it, then form the strict PD envelope compatible with `p`
(CrystallineCohomology §CR.5.2). The natural map `Ω•_log(P•/(A, M)) → Ω•_log(P•/(A, M)) ⊗ D_log(P• → (B, N))`
yields `Comp_log : dR_log(f) → RΓ(f_log-crys, O_crys)`, `DerivedDeRham.logCrystallineComparisonMap`, via the
log PD Poincaré lemma (CrystallineCohomology §CR.5.4). It is natural, multiplicative and respects Hodge/PD
filtrations. Exactification is performed before the PD envelope.

[Bhatt12], Proposition 7.18 and proof, p.30.

*Needs:* Layer 6: Free prelog resolutions; Layer 6: Logarithmic derived de Rham; Layer 4: The derived
de Rham to crystalline map; CrystallineCohomology §CR.5.2–§CR.5.4, §CR.0.6.

Prove the following named laws.

- `logCrystallineComparisonNatural`: prelog base squares induce commuting comparison-map squares.
- `logCrystallineComparisonFiltered`: Hodge terms map to the log crystalline PD filtration.
- `logCrystallineComparisonStrict`: for strict maps with fixed log structure the map is the ordinary
  `Comp`.
- `logCrystallineComparisonExactification`: the target model uses the exactification followed by the
  strict PD envelope, functorially.

**Checks.**

- `test_log_crys_identity`: for an identity log map, `Comp` is the base identity.
- `test_log_crys_strict_regular`: a strict regular quotient in the nilpotent-p flat range agrees with the
  Layer 4 PD comparison.
- `test_log_crys_noncartier`: [Bhatt12] Example 7.23 has a comparison map, but its relative
  Frobenius-twisted source and ordinary crystalline target differ.

### 6.13 The corrected logarithmic lci condition

For `n ≥ 1`, a prelog `ℤ/p^n`-map `(A, M) → (B, N)` with `A` and `B` flat over `ℤ/p^n` is *corrected G-lci*,
`DerivedDeRham.correctedLogLciCondition`, if it factors as `(A, M) → (P, Q) → (B, N)` with the first map
integral and log smooth of Cartier type modulo `p` and the second a strict surjection whose kernel is
generated by a finite regular sequence. It is *ind-corrected G-lci* if it is a filtered colimit of
corrected G-lci maps with compatible factorizations (maps of factorizations commuting with the
structure maps). A strict effective epimorphism without the regular-sequence condition does not suffice:
[Bhatt12] Definition 7.20 is corrected by adding it.

[Bhatt12], Definition 7.20, Example 7.21 and Theorem 7.22 proof sketch, p.31.

*Needs:* Layer 6: Integral log smooth Cartier-type comparison; Layer 6: The log crystalline comparison
map; Layer 0: Regular quotients and two-term models; CrystallineCohomology §CR.5.1,
§CR.5:log-algebra.3; Mathlib `RingTheory.Sequence.IsWeaklyRegular`, `RingTheory.Sequence.IsRegular`.

Prove the following named laws.

- `correctedGLciFactorization`: the condition returns the chosen factorization with its regular quotient
  and modulo-p Cartier witnesses.
- `correctedGLciStrictRegular`: a strict regular quotient of flat `ℤ/p^n`-algebras is in the condition,
  with identity first factor.
- `correctedGLciLocalFiltered`: the ind-corrected condition is stable under filtered colimits of
  compatible factorizations.
- `correctedGLciExample721`: two of the source examples are corrected G-lci with explicit factorizations:
  (i) for `O_K = W[t]/(E(t))` with Eisenstein `E` and uniformizer `π`, the factorization
  `(0 → W) → (ℕ → W[t], 1 ↦ t) → (ℕ → O_K, 1 ↦ π)` has a log smooth Cartier-type first map and kernel
  `(E(t))`, and logification (6.10) passes to `(O_K ∖ {0} → O_K)`; (iii) the semistable chart
  `ℕ^r → O_K[x₁, …, x_d]/(x₁ ⋯ x_r − π)` over `(ℕ → O_K, 1 ↦ π)`, `1 ↦ e₁ + … + e_r`, is log smooth of
  Cartier type with identity second map. Example (ii), `O_K̄`, is not obtained from this condition; the
  period computation uses the log–ordinary comparison of [Bhatt12] Proposition 9.11 instead.

**Checks.**

- `test_corrected_glci_identity`: the identity map has empty regular sequence and Cartier-type first
  factor.
- `test_corrected_glci_hypersurface`: the strict quotient `F_p[t] → F_p` by the regular element `t`
  qualifies.
- `test_corrected_glci_square_zero`: `F_p → F_p[x,y] → F_p[x,y]/(x,y)²` with trivial logs satisfies the
  printed condition of [Bhatt12] Definition 7.20 but fails the corrected regular quotient condition.

### 6.14 The corrected log crystalline comparison theorem

For a corrected G-lci prelog `ℤ/p^n`-map, `Comp_log` is an equivalence of Hodge-filtered dg algebras. For
an ind-corrected G-lci map the same holds, because `dR_log` commutes with filtered colimits (6.1) and so
does the target model of 6.12 (exactification, strict PD envelopes and log differentials are left
adjoints or are computed termwise on the free resolution). The compatible p-adic version uses derived
limits of flat finite reductions with the same factorizations. The proof combines the integral
Cartier-type log smooth comparison (6.11) for the first factor with the regular quotient comparison of
4.2 for the second and the logarithmic relative conjugate filtration ([Bhatt12] Proposition 7.8). This is
the valid scope of [Bhatt12] Theorem 7.22 with the corrected condition; neither arbitrary strict
surjections nor every fs log smooth map are included.

[Bhatt12], Theorem 7.22 proof sketch and Proposition 7.8, pp.29, 31.

*Needs:* Layer 6: The corrected logarithmic lci condition; Layer 6: The log crystalline comparison map;
Layer 6: Integral log smooth Cartier-type comparison; Layer 6: Derived logarithmic Cartier theory;
Layer 6: Log de Rham base change and Künneth; Layer 4: Regular quotients and classical PD envelopes;
Layer 5: The lci crystalline comparison theorem; Layer 5: p-adic crystalline comparison by derived
limits; CrystallineCohomology §CR.5.2–§CR.5.4.

Lean: `DerivedDeRham.logLciCrystallineComparison`.

**Checks.**

- `test_log_crys_thm_regular`: a finite strict regular quotient gives the corrected positive case,
  including `p = 2`.
- `test_log_crys_thm_square_zero`: the nonregular square-zero quotient is a negative case even with
  trivial monoids (4.1).
- `test_log_crys_thm_eisenstein`: example (i) of 6.13 over `ℤ/p^n` gives an equivalence.

*Log QSyn, QRSP covers and descent.*

The general prelog sites allow nonintegral monoids. The two-sort completed pushouts are 6.2; the
tilt-surjectivity criterion and the connectivity estimates precede exchanging completion with Čech
totalization.

### 6.15 Log quasisyntomic sites and QRSP bases

A log-quasisyntomic prelog ring `(R, P)` has `R` p-complete with bounded p-torsion and Gabber
`L_log((R, P)/ℤ_p)` of p-complete Tor amplitude `[−1, 0]`; `P` need not be integral ([KY] Definition 3.2). A
map `A → B` of bounded-torsion p-complete prelog rings is p-completely homologically log flat when
`B ⊗^L_A A/p ≃ B/p` is discrete and `A/p → B/p` is hlf. It is log-quasisyntomic when moreover
`L_log(B/A) ⊗^L_B B/p` has Tor amplitude `[−1, 0]`, and a cover when the mod-p map is hlf faithfully flat.
These covers define `QSyn_prelog` and the relative `qSyn_(R,P)`, `DerivedDeRham.logQuasisyntomicSites`.
Integral monoids are an additional restriction of the log-smooth and prismatic applications, not part of
the general site definition.

[KY], Definitions 3.1–3.3, Lemmas 3.5–3.6, Corollary 3.7 and Remarks 3.8–3.9, pp.27–28.

*Needs:* Layer 6: Homological logarithmic flatness; Layer 6: The Gabber logarithmic cotangent complex;
Layer 6: Log cotangent transitivity, base change and invariance; Layer 6: Homotopy pushouts of prelog
rings; Layer 5: The quasisyntomic sites; Layer 1: Complete flatness and complete faithful flatness.

Prove the following named laws.

- `logQSynCover`: a cover retains complete faithful flatness, completed hlf and relative log cotangent
  amplitude `[−1, 0]`.
- `logQSynBaseChange`: the completed homotopy prelog base change preserves covers ([KY] Lemma 3.6).

**Checks.**

- `test_log_qsyn_strict`: with identical monoids and the strict conventions, the ordinary `QSyn` condition
  is recovered.
- `test_log_qsyn_semistable`: the p-complete integral semistable chart is log quasisyntomic over its
  logarithmic `O_K` base.
- `test_log_qsyn_hlf_boundary`: a Kato log-flat map that is not hlf fails the log `QSyn` cover condition,
  even if its ring reduction is flat.

### 6.16 Log quasiregular semiperfectoid objects

For a p-complete prelog ring `(S, P)`, let `P^♭ = lim_(×p) P` and `P^×` its units. It is log semiperfectoid
([KY] Definition 3.11) if (1) `S` admits a map from an integral perfectoid ring (PerfectoidSpaces §P1.24),
(2) Frobenius on `S/p` is surjective, and (3) `P^♭ → P/P^×` is surjective. It is log quasiregular
semiperfectoid if also `(S, P)` is log quasisyntomic, `DerivedDeRham.logQuasiregularSemiperfectoid`.
Integrality of `P` is a separate hypothesis. The tilt-surjectivity clause is stronger than p-divisibility of
`P/P^×` and weaker than p-divisibility of `P`. Such objects have `Λ_p L_log((S, P)/ℤ_p)[−1]` complete-flat;
equivalently, under the log semiperfect assumptions, the shifted relative cotangent of `(S, P)` over a
perfectoid ring with trivial prelog structure is complete-flat ([KY] Lemma 3.16).

[KY], Definition 3.11, Remarks 3.12–3.15 and Lemma 3.16, pp.29–31.

*Needs:* Layer 6: Log quasisyntomic sites and QRSP bases; Layer 6: The Gabber logarithmic cotangent
complex; Layer 6: Log cotangent transitivity, base change and invariance; PerfectoidSpaces §P1.24.

Prove the following named laws.

- `logQrspTiltCondition`: `P^♭ → P/P^×` is surjective, with the ring perfectoid-source and semiperfectness
  conditions.
- `logQrspCotangent`: under log semiperfectness, the shifted relative log cotangent is complete-flat
  exactly in the log QRSP range.
- `logQrspPerfectoidSource`: the completed source prelog ring surjects on rings and modulo monoid units.
- `logQrspDivisibilityRelations`: `P` p-divisible implies tilt-surjectivity, which implies `P/P^×`
  p-divisible; for sharp monoids the three conditions agree.

**Checks.**

- `test_log_qrsp_trivial`: for trivial monoids the condition reduces to the ordinary QRSP ring condition.
- `test_log_qrsp_divisible`: if `S` is ordinary QRSP and `P` is uniquely p-divisible, then `(S, P)` is log
  QRSP ([KY] Example 3.15(1)).
- `test_log_qrsp_missing_ring_source`: `(ℤ_p, 0)` has semiperfect reduction and the tilt condition, but
  lacks a perfectoid ring map (5.2) and is excluded.

### 6.17 Compatible-root covers of prelog rings

For `(R, P) ∈ QSyn_prelog`, choose ring generators `ℤ_p[X_i] → R` and monoid generators `ℕ^(J) → P`. Use the
free p-complete prelog source `(ℤ_p⟨X_i, Y_j⟩, ℕ^(J))`, with `e_j ↦ Y_j`, and its compatible-root cover
`(O⟨X_i^(1/p^∞), Y_j^(1/p^∞)⟩, ℕ[1/p]^(J))` over an integral perfectoid `O` (for example
`ℤ_p[p^(1/p^∞)]^∧`, integral perfectoid by PerfectoidSpaces §P1.24–§P1.25). The p-completed homotopy prelog
base change (6.2) to `(R, P)` gives a log `QSyn` cover by log QRSP objects, and its target monoid is
p-divisible. The target need not be integral. All completed Čech terms are log QRSP; restriction to this
basis and Čech totalization are inverse descent constructions, `DerivedDeRham.logCompatibleRootCovers`.

[KY], Lemmas 3.17–3.19 and Corollary 3.20 with proof, pp.31–32.

*Needs:* Layer 6: Log quasisyntomic sites and QRSP bases; Layer 6: Log quasiregular semiperfectoid
objects; Layer 6: Free prelog resolutions; Layer 6: Homological logarithmic flatness; Layer 6: Homotopy
pushouts of prelog rings; Layer 5: Compatible-root quasisyntomic covers; Layer 5: Sheaves and unfolding
from the QRSP basis; PerfectoidSpaces §P1.24–§P1.25.

Prove the following named laws.

- `logRootCover`: the displayed completed two-sort pushout gives a log `QSyn` cover with log QRSP target.
- `logRootCoverMonoid`: the target monoid is p-divisible and satisfies the tilt-surjectivity condition.
- `logRootCoverCech`: every completed Čech term is log QRSP ([KY] Lemma 3.19).
- `logRootCoverUnfolding`: general prelog log QRSP basis functors unfold by the corresponding Čech
  totalization, independently of the cover.
- `logQSynQrspBasis`: log QRSP objects form a basis of `QSyn_prelog`; integrality of an output is checked
  separately when an application needs it.
- `logQSynUnfolding`: restriction to the general prelog QRSP basis and Čech totalization are inverse
  descent constructions.

**Checks.**

- `test_log_root_cover_trivial`: with no monoid generators, the construction specializes to the ordinary
  ring compatible-root cover of 5.3.
- `test_log_root_cover_coordinate`: a free monoid coordinate `x` acquires compatible monoid roots and
  matching ring roots `x^(1/p^n)`.
- `test_log_root_cover_finite`: one finite root stage does not make the monoid p-divisible or the ring
  reduction semiperfect.

### 6.18 Log cotangent powers and completed de Rham descent

For a fixed prelog base, derived exterior powers of the Gabber log cotangent complex satisfy hlf faithfully
flat Čech descent. Finite Hodge quotients of log derived de Rham inherit descent; the Hodge-completed object
descends by its quotient limit. In the log-quasisyntomic range, p-completed uncompleted log de Rham
descends using the uniformly bounded-below conjugate filtration. The completion and totalization
exchanges retain their boundedness hypotheses and the prelog homotopy Čech nerve.

[KY], Proposition 2.47, Remark 2.48 and Corollary 2.49, pp.24–26; Corollary 3.10, p.29.

*Needs:* Layer 6: Homological logarithmic flatness; Layer 6: Log quasisyntomic sites and QRSP bases;
Layer 6: Compatible-root covers of prelog rings; Layer 6: Derived logarithmic Cartier theory; Layer 6:
Logarithmic derived de Rham; Layer 6: Homotopy pushouts of prelog rings; Layer 0: Exterior powers of a
triangle and décalage; Layer 5: Descent of completed cotangent powers; Layer 5: Descent of Hodge
quotients and completion; Layer 5: Descent of p-completed uncompleted de Rham; Layer 1: Valid exchanges
of completion and derived operations.

Lean: `DerivedDeRham.logPowerDeRhamDescent`.

**Checks.**

- `test_log_descent_trivial_monoids`: trivial monoids give the ordinary descent of 5.6–5.7.
- `test_log_descent_identity`: the identity cover is constant.
- `test_log_descent_root_cover`: a root cover uses both monoid and ring coordinates in its Čech nerve.

*Log points, semistable charts and periods.*

Calculate the relative log structure against its actual base chart. Finally apply the ordinary and
logarithmic period identifications to the `d log` map of roots of unity, retaining filtration and Galois
equivariance.

### 6.19 The log point and its full cotangent complex

For a field `k`, the standard log point is `(k, ℕ)` with every positive monoid element sent to `0`. Over the
trivial prelog base `(k, 0)`, its Gabber complex is `[k --0→ k]` in cohomological degrees `−1, 0`: factor
through the free log line `(k[t], ℕ)`, then the strict regular quotient `t = 0`, whose conormal maps to
`t d log t = 0`. `H⁰` is `k·d log 1` and `H^−1` is `k`; the log point over this trivial base is not assigned
the integral log-smooth degree-zero theorem. Over itself the relative complex is zero and derived de Rham
is `k`. Over `F_p` its Hodge and conjugate powers retain both cotangent degrees and the derived twist.

[Bhatt12], Example 6.2, Proposition 6.5 and the strict regular quotient calculation of §§3.3, 6,
pp.16–18, 24–25.

*Needs:* Layer 6: The Gabber logarithmic cotangent complex; Layer 6: Log cotangent transitivity, base
change and invariance; Layer 6: Logarithmic derived de Rham; Layer 6: Derived logarithmic Cartier theory;
Layer 0: Regular quotients and two-term models.

Lean: `DerivedDeRham.logPointExample`.

**Checks.**

- `test_log_point_trivial_base`: over `(k, 0)` the complex is `[k → k]` with zero map.
- `test_log_point_identity`: over itself the relative complex is zero.
- `test_log_point_char_two`: at `p = 2` there is no hidden invertibility-of-2 hypothesis; both degrees
  survive.

### 6.20 The semistable chart with its monoid map

Let `O_K` be a complete mixed-characteristic discrete valuation ring with uniformizer `π` and perfect
residue field. For `1 ≤ r ≤ d`, `B = O_K[x₁, …, x_d]/(x₁ ⋯ x_r − π)`, or its p-adic completion, carries the
chart `ℕ^r → B`, `e_i ↦ x_i`. The base chart is `ℕ → O_K`, `1 ↦ π`, and the monoid map sends
`1 ↦ e₁ + … + e_r`. This is an integral log smooth Cartier-type chart; its relative Gabber cotangent is the
finite free module on `d log x₁, …, d log x_r, dx_(r+1), …, dx_d` modulo `Σ d log x_i = 0`, in degree zero
and rank `d − 1`. For the completed chart use continuous completed differentials. The log de Rham Hodge
and conjugate pieces, finite reductions and crystalline comparison retain this base chart; the trivial log
base has a different cotangent complex.

[Bhatt12], Example 7.21, third example, p.31; CrystallineCohomology §CR.5:log-algebra.6 (semistable formal
charts).

*Needs:* Layer 6: Integral log smooth Cartier-type comparison; Layer 6: The corrected log crystalline
comparison theorem; Layer 6: Logarithmic derived de Rham; Layer 6: Derived logarithmic Cartier theory;
Layer 2: The de Rham algebra of a completely smooth formal algebra; CrystallineCohomology
§CR.5:log-algebra.6.

Lean: `DerivedDeRham.semistableChartExample`.

**Checks.**

- `test_semistable_rank_one`: `r = d = 1` gives rank `0`.
- `test_semistable_rank_two`: `r = d = 2` gives the relation `d log x₁ + d log x₂ = 0` and rank `1`.
- `test_semistable_ramified`: for a ramified `O_K` use `π`, not `p`, with base `1 ↦ π`; `r = 0` is
  excluded.

### 6.21 Logarithmic period d log and Fontaine's map

In the period setup (5.11), let `can` be the log structure `O_K̄ ∖ {0} → O_K̄`. Then
`Λ_p L_(O_K̄/W) ≃ Λ_p L_log((O_K̄, can)/W)` and `Λ_p dR_log((O_K̄, can)/W) ≃ A_cris` ([Bhatt12] Proposition
9.11, proved by dévissage and the conjugate filtration from the cotangent statement). Completing
`d log : μ_(p^∞) → dR_log[1]` yields `β : Z_p(1) → Fil_H¹ A_cris`, `G_K`-equivariant by functoriality in
ring automorphisms ([Bhatt12] Construction 9.15). Then `β(ε) = log([ε])`: both maps land in `Fil_H¹`, their
first graded pieces agree as maps `Z_p(1) → gr_H¹ A_cris ≃ L̂_(O_K̄/W)[−1]` (the class of `[ε] − 1` in
`ker θ/(ker θ)²` corresponds to `lim_n d log(ε_n)` under the isomorphism of [Bhatt12] Proposition 9.3(5) and
Remark 9.4), so their difference is a `G_K`-equivariant map into `Fil² A_cris`, which vanishes by 5.15.

[Bhatt12], Propositions 9.11, 9.13, Construction 9.15, Proposition 9.16 and Remark 9.17, pp.35–38.

*Needs:* Layer 6: Logarithmic derived de Rham; Layer 6: Derived logarithmic Cartier theory; Layer 6: The
boundary of logification invariance; Layer 5: The period setup; Layer 5: The derived de Rham description
of A_cris; Layer 5: Hodge completion and B_dR⁺; Layer 5: Galois invariants of Tate twists; Layer 1: The
derived completion reflector; CrystallineCohomology §CR.5.5 (the log structure on `A_cris`).

Lean: `DerivedDeRham.logPeriodDlog`.

Prove the following named laws.

- `logPeriodOrdinaryComparison`: the completed canonical log and ordinary period de Rham objects agree.
- `periodDLogTate`: `β : Z_p(1) → Fil_H¹ A_cris` is `G_K`-equivariant.
- `periodDLogFormula`: `β(ε) = log([ε])` in `A_cris`.
- `periodDLogFirstGraded`: the first Hodge graded map is the completed `d log` cotangent class.

**Checks.**

- `test_period_dlog_identity`: the identity compatible system maps to `log(1) = 0`.
- `test_period_dlog_roots`: `β(ε^a) = aβ(ε)` for `a ∈ ℤ_p`, and `G_K` acts through the cyclotomic character.
- `test_period_dlog_logarithm_domain`: an `A_inf` unit `[x]` with `θ([x]) = x^♯ ≠ 1` is not assigned this
  `Fil_H¹` logarithm by the construction.

### Examples

The free log line satisfies `dx = x d log x`. Over the trivial log base the standard log point has `k` in
both cotangent degrees `−1` and `0`, while the identity log point has zero relative cotangent complex. In the
semistable chart `r = d = 1`, the relation `d log x = 0` leaves rank zero; for `r = d = 2` the relation
`d log x₁ + d log x₂ = 0` leaves rank one. The root-of-unity identity maps to `log(1) = 0` in the period
construction.

### Dependencies

Layers 0–5 and CrystallineCohomology's log layers (CR.5:log-algebra and CR.5) supply the ordinary and
derived operations used here; PerfectoidSpaces supplies integral perfectoid sources; KY and Olsson are the
primary sources for the two-sort and Gabber constructions.

## Downstream consumers

CrystallineCohomology consumes the derived completion of Layer 1, the ordinary and formal de Rham
algebras of Layer 2, the smooth Cartier isomorphism of Layer 3 and the regular and lci comparisons of
Layers 4–5. SchemeAndStackFoundations §4.6 consumes the cotangent complex and its square-zero obstruction
class (0.25). PerfectoidSpaces §P0.19–§P0.24 consume the cotangent complex of Layer 0 under the names of
0.1–0.11 and 0.25. Prismatic and `A_inf`-cohomology, p-adic Hodge theory and motivic and K-theoretic
applications use the completed cotangent powers, quasisyntomic descent, the `QRSP` calculations, the period
identifications and the ordinary differential-symbol API.

## References

References use the page numbering of the listed edition. [BMS19] pages are the published IHÉS pages;
[Avramov] and [Iyengar] use printed journal or chapter pages; [SAG] uses the page numbers of the
February 2018 version. Stacks chapter PDFs use chapter-local page numbers while statement numbers retain
their online chapter prefix; stable tags identify the statements in the living text.

The statements above incorporate the following source conventions. In [Bhatt12], Proposition 2.3, p.5,
the resolution is of `B`; Notation 3.1, p.6, twists `B` relative to `A`; Proposition 3.5, p.7, includes the
weight shift `[−i]`. Definition 7.20 and Theorem 7.22, p.31, are used with the regular-sequence strict
quotient and flatness hypotheses of 6.13. In Remark 6.6 and Proposition 6.12, pp.25–26, the derivation
section is over `B` and the second target factor is `B₂`. In Remark 8.7, p.32, nontorsion in the completed
torsion sum is detected by coordinates `p^⌊n/2⌋`. Example 3.21, p.11, is used in the form of 3.11 (a
nonzero `H^−2` of the cotangent complex and infinite Tor amplitude). For [BMS19], Definition 5.1, p.233, a
decreasing filtration has `gr^i = cofib(F^(i+1) → F^i)`. In Theorem 5.4 and Proposition 5.6, pp.234–238,
use the cohomological `Ext^(i+c)` formula of 1.20; the companion Ext display in the proof of Theorem 5.4,
p.236, has degree `a+i−j`. In Proposition 8.13(3), p.274, divided-Frobenius injectivity concerns the
Nygaard graded piece. For [KY], Construction 2.6, p.13, both de Rham graded formulas carry `[−i]`. Theorem
2.11, pp.14–15, uses the base-ring tensor for the full de Rham complex. In Lemma 2.14, pp.15–16, retain
the source and target assignments of the statement when using the proof.

The integral resolution, power and crystalline arguments respect the author corrections [IllusieI],
[IllusieII] and [BOErratum]. In particular an arbitrary quotient of differentials need not carry the
induced exterior differential without stability of its kernel, and a compatible inverse system is
represented by the projective or surjective model of 1.1.

- **AFH94**: Luchezar L. Avramov, Hans-Bjørn Foxby and Bernd Herzog, *Structure of local homomorphisms*.
  J. Algebra 164 (1994), 124–145.
- **Avramov**: Luchezar L. Avramov, *Locally complete intersection homomorphisms and a conjecture of
  Quillen on the vanishing of cotangent homology*. Ann. of Math. 150 (1999), 455–487; arXiv:math/9909192.
- **Bhatt12**: Bhargav Bhatt, *p-adic derived de Rham cohomology*. arXiv:1204.6560v1, 30 April 2012.
- **BhattDS**: Bhargav Bhatt, *On the direct summand conjecture and its derived variant*.
  arXiv:1608.08882v2.
- **BL22**: Bhargav Bhatt and Jacob Lurie, *Absolute prismatic cohomology*. arXiv:2201.06120v1.
- **BM**: Bhargav Bhatt and Akhil Mathew, *Syntomic complexes and p-adic étale Tate twists*.
  arXiv:2202.04818v2.
- **BMaEtAl**: Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and
  Jakub Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed
  characteristic*. arXiv:2012.15801v3.
- **BMS**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral p-adic Hodge theory*. Publ. Math.
  IHÉS 128 (2018), 219–397.
- **BMS19**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological Hochschild homology and
  integral p-adic Hodge theory*. Publ. Math. IHÉS 129 (2019), 199–310.
- **BOErratum**: Pierre Berthelot and Arthur Ogus, *Erratum to Notes on crystalline cohomology*. Author
  erratum dated 21 August 2013.
- **CMM**: Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of
  henselian pairs*. arXiv:1803.10897v2.
- **DM**: Bjørn Ian Dundas and Matthew Morrow, *Finite generation and continuity of topological Hochschild
  and cyclic homology*. arXiv:1403.0534v1.
- **DoldPuppe**: Albrecht Dold and Dieter Puppe, *Homologie nicht-additiver Funktoren. Anwendungen*.
  Ann. Inst. Fourier 11 (1961), 201–312.
- **FGauges**: Bhargav Bhatt, *Prismatic F-gauges*. Lecture notes, MAT 549, Fall 2022.
- **Fon94**: Jean-Marc Fontaine, *Le corps des périodes p-adiques*. Astérisque 223 (1994), 59–111.
- **GP**: Owen Gwilliam and Dmitri Pavlov, *Enhancing the filtered derived category*. arXiv:1602.01515v3.
- **GR**: Ofer Gabber and Lorenzo Ramero, *Almost ring theory*. LNM 1800 (2003); arXiv:math/0201175v3.
- **IllusieCC**: Luc Illusie, *Complexe cotangent et déformations I*. LNM 239 (1971).
- **IllusieI**: Luc Illusie, *Errata: Complexe cotangent et déformations I*. Author erratum.
- **IllusieII**: Luc Illusie, *Errata: Complexe cotangent et déformations II*. Author erratum.
- **Iyengar**: Srikanth Iyengar, *André–Quillen homology of commutative algebras*. Contemporary
  Mathematics 436 (2007), 203–234.
- **KY**: Teruhisa Koshikawa and Zijian Yao, *Logarithmic prismatic cohomology II*. arXiv:2306.00364v1.
- **Ols05**: Martin C. Olsson, *The logarithmic cotangent complex*. Math. Ann. 333 (2005), 859–931.
- **Prisms**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*. arXiv:1905.08229v4.
- **Riou**: Joël Riou, *feat(AlgebraicGeometry): the algebraic De Rham complex*. Unmerged Mathlib pull
  request 18551, head 5888c0081ba867ede5c60d3060f2d674d932b53c.
- **SAG**: Jacob Lurie, *Spectral Algebraic Geometry*. Version of February 2018, §25.2.
- **StacksAlg**: The Stacks Project Authors, *Commutative Algebra* (Chapter 10).
- **StacksCt**: The Stacks Project Authors, *The Cotangent Complex* (Chapter 92).
- **StacksDefos**: The Stacks Project Authors, *Deformation Theory* (Chapter 91).
- **StacksDR**: The Stacks Project Authors, *The de Rham complex*, Section 10.132.
- **StacksExterior**: The Stacks Project Authors, *Kernel of the tensor-to-exterior map*, Lemma 10.13.4.
- **StacksLC**: The Stacks Project Authors, *Local Cohomology* (Chapter 51), Lemma 51.17.6 (Kunz).
- **StacksMA**: The Stacks Project Authors, *More on Algebra* (Chapter 15).
- **StacksPerfect**: The Stacks Project Authors, *Derived Categories of Schemes* (Chapter 36), §36.30.
- **StacksSimp**: The Stacks Project Authors, *Simplicial Methods* (Chapter 14).
- **StacksSmoothing**: The Stacks Project Authors, *Smoothing Ring Maps* (Chapter 16).
- **SW13**: Peter Scholze and Jared Weinstein, *Moduli of p-divisible groups*. Camb. J. Math. 1 (2013),
  145–237; arXiv:1211.6357v2.
- **Tat67**: John Tate, *p-divisible groups*. Proc. Conf. Local Fields (Driebergen, 1966), Springer
  (1967), 158–183.

[Bhatt12]: https://arxiv.org/pdf/1204.6560v1
[BMS19]: https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf
[BL22]: https://arxiv.org/pdf/2201.06120v1
[KY]: https://arxiv.org/pdf/2306.00364v1
[Prisms]: https://arxiv.org/pdf/1905.08229v4
[BM]: https://arxiv.org/pdf/2202.04818v2
[CMM]: https://arxiv.org/pdf/1803.10897v2
[DM]: https://arxiv.org/pdf/1403.0534v1
[Avramov]: https://arxiv.org/pdf/math/9909192
[Iyengar]: https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf
[BhattDS]: https://arxiv.org/pdf/1608.08882v2
[BMaEtAl]: https://arxiv.org/pdf/2012.15801v3
[GP]: https://arxiv.org/pdf/1602.01515v3
[FGauges]: https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf
[SAG]: https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf
[DoldPuppe]: http://www.numdam.org/item/AIF_1961__11__201_0/
[SW13]: https://arxiv.org/abs/1211.6357
[GR]: https://arxiv.org/abs/math/0201175
[AFH94]: https://doi.org/10.1016/0021-8693(94)90146-5
[Ols05]: https://doi.org/10.1007/s00208-005-0707-6
[Fon94]: http://www.numdam.org/issues/AST_1994__223__/
[IllusieCC]: https://doi.org/10.1007/BFb0059052
[IllusieI]: https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf
[IllusieII]: https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf
[BOErratum]: https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf
[Riou]: https://github.com/leanprover-community/mathlib4/pull/18551
[StacksAlg]: https://stacks.math.columbia.edu/download/algebra.pdf
[StacksCt]: https://stacks.math.columbia.edu/download/cotangent.pdf
[StacksDefos]: https://stacks.math.columbia.edu/download/defos.pdf
[StacksDR]: https://stacks.math.columbia.edu/tag/0FKF
[StacksExterior]: https://stacks.math.columbia.edu/tag/0H1C
[StacksLC]: https://stacks.math.columbia.edu/tag/0EC0
[StacksMA]: https://stacks.math.columbia.edu/download/more-algebra.pdf
[StacksPerfect]: https://stacks.math.columbia.edu/download/perfect.pdf
[StacksSimp]: https://stacks.math.columbia.edu/download/simplicial.pdf
[StacksSmoothing]: https://stacks.math.columbia.edu/tag/07GB

# Roadmap: commutative algebra for deformation theory and patching, Part II — Kawasaki's Cohen–Macaulay blowing-ups

**Summary.** Part II of DeformationAndDerivedPatchingAlgebra builds Kawasaki's
Cohen–Macaulay blowing-ups of finite modules over Noetherian local rings. Given a finite module
`M` over a Noetherian local ring `(R, 𝔪)` and an ordered sequence
`r₁, …, rₜ ∈ 𝔪` that is *CM-secant* for `M`, the end theorem says that the blowing-up of `M` along
the product of successive prefix ideals

```text
I = ∏_{i=1}^{t} (r₁, …, rᵢ) = (r₁)·(r₁, r₂)·⋯·(r₁, …, rₜ)
```

is a Cohen–Macaulay module on the blow-up scheme `Bl_I(Spec R)`. The theorem is the source of
Cohen–Macaulayness in Česnavičius's Macaulayfication of Noetherian schemes, and its proof is a
self-contained piece of commutative algebra: an annihilator calculus for local cohomology, Huneke's
d-sequences, Kawasaki's three conditions on prefix-product ideals, the graded Rees module and its
sheaf on the blow-up, and a depth induction through two-generator blow-up charts.

Layer K0 defines the local-cohomology annihilator product `a_J(M, d)`, secant and
CM-secant sequences, and relates them: Schenzel's torsion bound, extension of a CM-secant sequence
to a system of parameters, the reversal comparison with Kawasaki's `p`-standard systems, and — over
a ring with a normalized dualizing complex — the description of the zero locus of `a(M)` as the
non-Cohen–Macaulay locus (equidimensional support) or the depth-defect set (arbitrary support).
Layer K1 defines d-sequences on arbitrary modules over arbitrary commutative rings and proves the
torsion characterization and the two Goto–Yamagishi intersection identities. Layer K2 defines the
prefix products `I_s`, packages Kawasaki's three conditions, proves that every initial segment of
a CM-secant sequence satisfies them (Kawasaki's proposition) and that they survive division by
auxiliary secant sequences. Layer K3 builds the graded Rees module `⊕ IⁿM`, the chart modules
`M_(a) ⊆ M[1/a]`, the module blowing-up `Bl_I(M)` as a sheaf on `Proj ⊕ Iⁿ` and its comparison with
the strict transform, and proves the dimension bound `dim Supp Bl_I(M) ≤ dim Supp M`. Layer K4 runs
Kawasaki's induction: the regular-element reduction, the principal and two-generator charts, the
two local-cohomology claims, the depth bound at closed points, and the Cohen–Macaulay theorem in
its CM-secant form and in a weaker form; it ends with a Cohen–Macaulay local ring whose blowing-up
at the maximal ideal is not Cohen–Macaulay, which shows why the centre must be chosen this way.
Everything is stated for finite modules (not only rings), with the zero module, empty sequences
and unit ideals treated explicitly.

The main source is Česnavičius, *Macaulayfication of Noetherian schemes*, §3, cited in the
numbering of arXiv:1810.04493v2 (pages are the printed pages of that version). The `p`-standard
comparison uses Kawasaki's 1996 RIMS note, the counterexample uses Heinzer–Johnston–Lantz–Shah, and
generic facts are cited from the Stacks Project by tag.

## Scope and ownership

This roadmap owns:

- the annihilator product `annihilatorProduct J M d` of local cohomology modules, secant sequences
  `IsSecant`, CM-secant sequences `IsCMSecant`, Schenzel's torsion bound for secant sequences, the
  extension of CM-secant sequences to parameters, and the reversal comparison with `p`-standard
  systems of parameters;
- the composite-support spectral sequence for local cohomology of modules and its change of rings
  (as used in the depth induction), normalized local duality in the module form
  `H^j_𝔪(M) ≅ Hom_R(Ext^{-j}_R(M, ω), E)`, the Matlis annihilator lemma, the local-duality
  annihilator identity, the annihilator description of the non-Cohen–Macaulay locus and the
  defect set of a module of arbitrary support;
- Huneke's d-sequences `IsDSequence`, their torsion characterization and the Goto–Yamagishi
  identities;
- the prefix products `prefixProduct`, Kawasaki's conditions `KawasakiConditions`, Kawasaki's
  proposition that initial segments of CM-secant sequences satisfy them, and their robustness;
- the graded Rees module `reesModule I M`, the chart modules of the blowing-up of a module, the strict
  transform of a quasi-coherent module along a blowing-up, the module blowing-up `Bl_I(M)` with its functoriality, its comparison with the strict
  transform, the product-of-ideals identity for scheme blowing-ups and its module form, the support
  of `Bl_I(M)`, the dimension bound for the Rees algebra, the `Proj` prime-chain bound and the
  dimension bound for `Supp Bl_I(M)`;
- Kawasaki's depth induction and the Cohen–Macaulay blowing-up theorem, and the
  Heinzer–Johnston–Lantz–Shah example.

It leaves to other roadmaps, and imports:

- **Mathlib**: local cohomology `localCohomology J j` (defined as a colimit of `Ext(R/Jⁿ, -)`),
  annihilators, support and support dimension of modules, regular and weakly regular sequences,
  the polynomial module and the Rees algebra, localizations of rings and modules, `Proj` of a
  graded ring, sheaves of modules on schemes and the affine `tilde` construction, Krull dimension.
- **Tau Ceti**: the grading `reesAlgebra.grade I` of the
  Rees algebra, the affine blow-up algebra `Ideal.affineBlowup I a S` with its membership
  criterion and universal property, and the chart open immersions
  `TauCeti.AlgebraicGeometry.affineBlowupι` into `Proj (reesAlgebra.grade I)` with their covering
  and base compatibility. The blow-up scheme of this roadmap is `Proj (reesAlgebra.grade I)`.
- **TauCetiRoadmap StableReduction, Layer 4**: the blowing-up of a quasi-coherent ideal as a
  relative `Proj`, its universal property, properness, behaviour away from the centre, the
  exceptional divisor, strict transforms of closed subschemes and the affine chart description.
- **SchemeAndStackFoundations**: depth `IsLocalRing.depth` and Cohen–Macaulay modules
  `Module.IsCohenMacaulay`, Cohen–Macaulay coherent sheaves
  `AlgebraicGeometry.Scheme.Modules.IsCohenMacaulay` (§0.17, depth and Cohen–Macaulay modules;
  §0.18, scheme-theoretic support and Cohen–Macaulay schemes), and catenary rings
  `Excellence.IsCatenary` (§0.16); cohomology with supports, the comparison of sheaf and module
  local cohomology, flat base change, and the characterization of depth as the first nonvanishing
  local-cohomology degree (§2.7); dualizing complexes `DualizingComplex` and their normalization
  `NormalizedDualizing` over Noetherian (local) rings (§2.21); strict transforms of modules along
  modifications with a chosen dense open (§4.11). K3.4 extends the last construction to arbitrary
  blow-ups without a density or integrality hypothesis.
- **DeformationAndDerivedPatchingAlgebra, R03.3** (dimension, depth and complete intersections):
  parameter-element regularity for nonzero finite Cohen–Macaulay modules. Dimension drop for
  regular elements is supplied directly by Mathlib.

Not here: Macaulayfication itself and the CM-quasi-excellence conditions (owned by the
Macaulayfication roadmap, which imports Layers K3 and K4); the general theory of blowing-ups,
`Proj` and strict transforms of schemes; dualizing complexes on schemes; the foundations of local
cohomology. The roadmap introduces no second carrier for any of these.

## Conventions

- Rings are commutative with `1`. `(R, 𝔪, κ)` is a Noetherian local ring with maximal ideal
  `𝔪 = IsLocalRing.maximalIdeal R` and residue field `κ`. "Finite" means finitely generated. A
  sequence is an ordered `List`; nothing is asserted to be invariant under permutation unless a
  statement says so.
- For a list `rs = (r₁, …, rₛ)` write `(rs) = Ideal.ofList rs` and `M/(rs)M` for the actual quotient
  `M ⧸ ((rs) • ⊤)` (`prefixQuotient M rs`). The `i`-th prefix quotient is
  `Qᵢ(M) = M/(r₁, …, r_{i-1})M`, the quotient by `rs.take (i-1)`.
- Support dimension is Mathlib's `Module.supportDim R M ∈ WithBot ℕ∞`, the Krull dimension of the
  support; the zero module has empty support and dimension `⊥`, its depth is `∞`, and it is
  Cohen–Macaulay. A finite module over a Noetherian local ring has finite support dimension.
- Cohen–Macaulayness is support-restricted: a finite module over a Noetherian local ring is
  Cohen–Macaulay when it is zero or its depth equals its support dimension, and a coherent sheaf is
  Cohen–Macaulay when every stalk at a point of its support is. Modules with proper support may be
  Cohen–Macaulay (for example the terminal quotient of a CM-secant sequence).
- Local cohomology is `H^j_J(M) = localCohomology J j` applied to `ModuleCat.of R M`, for `j ∈ ℕ`.
  Over a Noetherian ring it agrees with the derived functor of sections supported on `V(J)` and is
  computed by the extended Čech complex on generators of `J` (SchemeAndStackFoundations §2.7).
  Negative degrees are zero.
- The prefix products are `I_s = ∏_{i=1}^{s} (r₁, …, rᵢ)`, `I₀ = R`; so `I_{s+1} = I_s·(r₁, …, r_{s+1})`.
- For an ideal `I` and `a ∈ R`, `R[I/a] ⊆ R[1/a]` is the `R`-subalgebra generated by the fractions
  `i/a`, `i ∈ I` (the affine blow-up algebra; Tau Ceti `Ideal.affineBlowup I a (Localization.Away a)`).
  For `a ∈ I` it is the ring of the chart `D₊(a t)` of `Bl_I(Spec R) = Proj ⊕_{n≥0} Iⁿ`. The chart
  module `M_(a) ⊆ M[1/a]` is the `R[I/a]`-submodule spanned by the image of `M`.
- `M⟨r^∞⟩` is the submodule of elements killed by some power of `r`, and `M⟨r⟩` the kernel of
  multiplication by `r`.
- The printed source has five slips, and the roadmap states the corrected forms throughout:
  (1) the Cohen–Macaulay condition of §1.14 must be quantified over the support of the module
  (off the support the stalk is zero, with depth `∞` and support dimension `−∞`); (2) in Remark 3.9
  the torsion equality uses the later element: the `r_j`-torsion and the `rᵢr_j`-torsion of
  `M/(r₁, …, r_{i-1})M` agree for `i ≤ j` (with the earlier element it fails, see Layer K1);
  (3) in Proposition 3.11(iii) the antecedent concerns the last auxiliary element `r'_{s'}`, not
  the original `r_{s'}`; (4) in the proof of Theorem 3.14 the `i`-th factor of `I_s` is
  `(r₁, …, rᵢ)`, not `(r₁, …, rₛ)`; (5) in display (3.14.10) the relevant map is multiplication by
  `r_b T − r_a`, the map of the exact sequence (3.14.7) (the printed `r_a T − r_b` also kills the
  module, so nothing is lost).
- `Suggested.lean` states Cohen–Macaulayness of `M` as the vanishing of `H^j_𝔪(M)` for
  `j < dim Supp M` (`LowLocalCohomologyVanishes R M`), and Cohen–Macaulayness of `Bl_I(M)` chartwise
  (`IsCMBlowupChartwise I M`: at every prime of every chart `R[I/a]`, `a ∈ I`). The first agrees
  with `Module.IsCohenMacaulay` for finite modules over Noetherian local rings (Layer K0.4); the
  second agrees with `Scheme.Modules.IsCohenMacaulay` of `Bl_I(M)` because the charts of all
  `a ∈ I` cover the blow-up and the condition is local (Layer K3.3).

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- Local cohomology: `localCohomology (J : Ideal R) (i : ℕ) : ModuleCat R ⥤ ModuleCat R`, and
  `localCohomology.isoOfSameRadical` (ideals with the same radical give isomorphic functors over a
  Noetherian ring). Nothing else of the local-cohomology calculus is assumed from Mathlib.
- Modules: `Module.annihilator`, `Module.support`, `Module.supportDim` with
  `Module.supportDim_eq_bot_iff_subsingleton`,
  `Module.supportDim_eq_ringKrullDim_quotient_annihilator` (finite modules),
  `Module.supportDim_le_supportDim_quotSMulTop_succ` and
  `Module.supportDim_quotSMulTop_succ_eq_supportDim`: for a finite module over a Noetherian local
  ring and `x ∈ 𝔪`, the support dimension drops by at most one, and by exactly one if `x` is
  regular on the module. These are in `Mathlib.RingTheory.KrullDimension.Regular`.
  `Ideal.ofList`; `RingTheory.Sequence.IsWeaklyRegular` and
  `RingTheory.Sequence.IsRegular`; `IsSMulRegular`; `Submodule.mkQ`, `Submodule.mapQ`,
  `Submodule.comap`, `Submodule.smul_mem_smul`, `Submodule.mul_smul`.
- Polynomial modules and Rees algebras: `PolynomialModule R M` with `PolynomialModule.single`,
  `PolynomialModule.smul_apply`, `PolynomialModule.coeff_inj`, `PolynomialModule.map`,
  `PolynomialModule.map_smul`; `reesAlgebra I : Subalgebra R R[X]` with `mem_reesAlgebra_iff`,
  `reesAlgebra.fg` and its `Algebra.FiniteType` and `IsNoetherianRing` instances over a Noetherian
  ring.
- Localization: `Localization.Away`, `IsLocalization.Away.invSelf`, `LocalizedModule`,
  `LocalizedModule.mkLinearMap`, `LocalizedModule.moduleOfIsLocalization`, `Localization.AtPrime`,
  `Algebra.adjoin`.
- Geometry: `AlgebraicGeometry.Proj`, `AlgebraicGeometry.projIsoSpec`,
  `AlgebraicGeometry.Scheme.Modules` with `Scheme.Modules.pullback` and `Scheme.Modules.presheaf`,
  `AlgebraicGeometry.tilde` and `tilde.map`, `PrimeSpectrum.zeroLocus`.
- Dimension: `ringKrullDim`, `topologicalKrullDim`, `Polynomial.ringKrullDim_of_isNoetherianRing`.
- Injectivity: `CategoryTheory.Injective` in `ModuleCat R`.

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

The chart rings, the Rees grading and the chart immersions are supplied by the following
individual modules; the scheme `Proj (reesAlgebra.grade I)` is an existing carrier.

- `TauCeti.RingTheory.ReesAlgebra.Grading`: `reesAlgebra.grade I` (the degree-`n` piece `Iⁿ tⁿ`),
  `reesAlgebra.gradedMonoid`,
  `reesAlgebra.isInternal_grade`, `reesAlgebra.gradeZeroEquiv`, `reesAlgebra.monomialDegreeOne`
  (the element `a t`, `a ∈ I`);
- `TauCeti.RingTheory.Ideal.AffineBlowup`: `Ideal.affineBlowup I a S` (the subalgebra `R[I/a]`
  of a localization `S` of `R` away from `a`),
  `Ideal.mem_affineBlowup_iff` (for `a ∈ I`, `z ∈ R[I/a]` iff there exist `k ∈ ℕ` and `y ∈ Iᵏ`
  with `algebraMap R S a ^ k * z = algebraMap R S y`),
  `Ideal.map_algebraMap_affineBlowup` (for `a ∈ I` the extension of `I` to `R[I/a]` is `(a)`), the
  regularity of `a` in `R[I/a]` (`Ideal.isRegular_algebraMap_affineBlowup`), and the universal
  property `Ideal.affineBlowupLift`, whose inputs are `IB ⊆ aB` and injectivity of multiplication
  by `a` on the target algebra `B`;
- `TauCeti.RingTheory.ReesAlgebra.AffineBlowup`: `reesAlgebra.awayEquivAffineBlowup` (for `a ∈ I`,
  the homogeneous localization `R[It]_(a t) ≅ R[I/a]`);
- `TauCeti.AlgebraicGeometry.Blowup.AffineCharts`: `TauCeti.AlgebraicGeometry.affineBlowupι` (for
  `a ∈ I`, the open immersion `Spec R[I/a] → Proj (grade I)` onto
  `D₊(a t)`), `opensRange_affineBlowupι`, `iSup_opensRange_affineBlowupι` (the charts of a family
  generating `I` cover the blow-up) and `affineBlowupι_toSpecZero` (compatibility with the map to
  `Spec R`).

`Suggested.lean` imports `TauCeti.RingTheory.Ideal.AffineBlowup` and uses `ChartRing I a` as a type
synonym for the carrier of `Ideal.affineBlowup I a (Localization.Away a)`. Its inclusion
`ChartRing.toLocalization` and restricted action `ChartRing.moduleLocalizedModule` on `M[1/a]`
are notation for the supplied rings. The grading and geometric chart modules above supply the
README constructions; their carriers are not copied into `Suggested.lean`.

### From TauCetiRoadmap roadmaps

- **StableReduction, Layer 4** (blowups and intersection theory on arithmetic surfaces): the
  blowing-up `b : Bl_𝓘(X) → X` of a quasi-coherent ideal of finite type as a relative `Proj` of the
  Rees algebra; its universal property (the pullback of `𝓘` is invertible, and `b` is final with
  this property); properness; `b` is an isomorphism over `X ∖ V(𝓘)`; the exceptional divisor;
  strict transforms of closed subschemes; and the affine chart description over `Spec A`. Used in
  K3.3–K3.6 and K4.

### From other roadmaps

These contracts consume the named roadmap targets, with the stated hypotheses; their definitions
are not imported as Lean carriers.

- **SchemeAndStackFoundations, §0.16**: `Excellence.IsCatenary` and its localization and quotient
  API. Used in K0.7's dimension formula.
- **SchemeAndStackFoundations, §0.17** (depth, Cohen–Macaulay modules and Serre's conditions):
  `Module.depth` and `IsLocalRing.depth`, with `depth(0) = ∞`; `depth_le_supportDim` for nonzero
  finite modules over Noetherian local rings; `Module.IsCohenMacaulay` (zero or depth equal to
  support dimension), its localization theorem and its regular-element quotient criterion.
  **§0.18** supplies `AlgebraicGeometry.Scheme.Modules.IsCohenMacaulay`, checked on the stalks
  in the support or on affine opens. Used in K0, K3.3 and K4.
- **SchemeAndStackFoundations, §2.7** (cohomology with supports and local cohomology):
  `localCohomology_colimit_ext_comparison` identifies Mathlib's native Ext-colimit functor with
  derived ideal-power torsion over a Noetherian ring; `localCohomology_module_comparison`
  identifies it with `RΓ_{V(J)}` on an affine scheme. The extended Čech complex
  `M → ∏ M_{fᵢ} → ∏ M_{fᵢfⱼ} → ⋯` on generators of `J` computes this functor (Stacks,
  Lemmas 47.9.1 and 47.10.1). `localCohomology_flat_baseChange` is consumed for flat maps of
  Noetherian rings and arbitrary modules. `depth_localCohomology_vanishing` and
  `depth_localCohomology_nonvanishing` characterize depth for finite modules, with nonvanishing
  only when the depth is a natural number (Stacks, Lemma 47.11.1). Used throughout K0 and K4.
- **SchemeAndStackFoundations, §2.21** (dualising complexes): `DualizingComplex` over a
  Noetherian ring (finite injective dimension, finite cohomology and quasi-isomorphic homothety,
  Stacks, Definition 47.15.1), and `NormalizedDualizing` over a Noetherian local ring
  (`RHom(κ, ω) ≅ κ[0]`), including localization with the normalization shift. Used in K0.7.
- **SchemeAndStackFoundations, §4.11** (modifications and strict transforms):
  `strictTransformModule f φ U M`, the quotient of the pullback by sections supported outside
  the inverse image of the chosen dense open `U`; `strictTransform_eq_blowup` identifies the
  removed subsheaf with exceptional-ideal-power torsion when `φ` is a blow-up and
  `U = S ∖ V(𝓘)`. K3.4 gives the arbitrary-blow-up extension and its agreement with this
  construction in the modification case.
- **DeformationAndDerivedPatchingAlgebra, R03.3** (dimension, depth and complete intersections):
  parameter-element regularity for a nonzero finite Cohen–Macaulay module `N` over a Noetherian
  local ring: for `x ∈ 𝔪` with `dim Supp(N/xN) + 1 = dim Supp N`, multiplication by `x` is
  injective on `N`. Used in K0.6 and K4.1. The dimension drop for an already regular element
  comes from Mathlib's `Module.supportDim_quotSMulTop_succ_eq_supportDim` above.

## How to read the build

Layers K0 and K1 share only the prefix-quotient notation of K0.3. K0 is about one module and one
sequence: it defines
the annihilator product and CM-secant sequences and relates the product to duality and to the
non-Cohen–Macaulay locus; its duality targets (K0.7) are not used later and can be built last. K1
is pure module theory over an arbitrary ring. K2 combines them into Kawasaki's conditions on
prefix-product ideals. K3 constructs the geometric object, the blowing-up of a module, entirely on
charts `R[I/a]` and `M_(a)` glued along the supplied Tau Ceti charts, and bounds the dimension of its
support. K4 proves the Cohen–Macaulay theorem: a regular-element reduction to a zero-dimensional
terminal quotient, then an induction on the length of the sequence through two-generator charts,
in which K2's conditions control the local cohomology of each chart.

## Layer K0: Annihilator products, secant and CM-secant sequences

A CM-secant sequence is a part of a system of parameters whose `i`-th entry vanishes to high
enough order on the non-Cohen–Macaulay locus of the preceding prefix quotient, the order being
measured by the product of the annihilators of the local cohomology modules below the dimension.
This layer defines these objects with the zero module and empty sequences included, proves the
three facts about them that the later layers and the source's applications use, and identifies
the zero locus of the annihilator product through local duality.

### K0.1 Local cohomology inputs

The depth induction of Layer K4 manipulates local cohomology with respect to one, two and three
elements and with respect to a maximal ideal at the same time. The comparison of Mathlib's
`localCohomology` with the extended Čech complex and with flat base change is imported from
SchemeAndStackFoundations §2.7. Composite supports, restriction of scalars and filtered colimits
are further targets of this layer.

**Local cohomology with composite supports.** For a Noetherian ring `A`, ideals `I, J ⊆ A` and an
`A`-module `N`, there is a convergent first-quadrant spectral sequence

```text
E₂^{p,q} = H^p_J(H^q_I(N))  ⇒  H^{p+q}_{I+J}(N),
```

natural in `N`, coming from `RΓ_{V(J)} ∘ RΓ_{V(I)} = RΓ_{V(I+J)}`. Consequences used later, with
their exact hypotheses: if `H^q_I(N) = 0` for all `q ≠ 1` then `H^{p+1}_{I+J}(N) ≅ H^p_J(H^1_I(N))`
for all `p`; and the edge maps identify `H^0_{I+J}(N) = H^0_J(H^0_I(N))`. In the depth induction
`I` is `(r_i, r_s)` or `(r_b)` and `J` is a maximal ideal containing it, so `I + J = J`.
*Hypotheses.* `A` Noetherian (this is what identifies Mathlib's `Ext`-colimit `localCohomology`
with `RΓ_{V(I)}`); `N` arbitrary. (Stacks, Lemma 47.9.6, tag 0BJC, with Lemma 47.10.1, tag 0955, and
Derived Categories, Lemma 13.22.2, tag 015N.) *Needs:* Mathlib `localCohomology`;
SchemeAndStackFoundations §2.7 (module local cohomology and its Čech complex).

**Local cohomology along a ring map.** For a ring map `A → B` of Noetherian rings, an ideal `I ⊆ A`
and a `B`-module `N`, the `A`-module `H^q_I(N)` (with `N` viewed over `A`) is `H^q_{IB}(N)` viewed
over `A`, naturally in `N`. This is used to move local cohomology between a chart ring, a polynomial
ring over it and a localization of a quotient of that polynomial ring (Česnavičius, (3.14.2)).
(Stacks, Lemma 47.9.2, tag 0BJB.) *Needs:* SchemeAndStackFoundations §2.7.

**Filtered colimits.** For a Noetherian ring `A`, an ideal `J`, a filtered diagram of `A`-modules
`N_λ` and `j ∈ ℕ`, prove `localCohomology.filteredColimitIso`:
`colim_λ H^j_J(N_λ) ≅ H^j_J(colim_λ N_λ)`, naturally in the diagram. No finiteness hypothesis on
the modules is needed. This supplies the passage from all quotients `N/rᵐN` to `H^1_{(r)}(N)` in
K4.3. Choose finitely many generators of `J`; localization and finite sums in the extended Čech
complex commute with filtered colimits, and filtered colimits of modules are exact, so its
cohomology commutes with them. (Stacks, Lemma 47.9.1, tag 0A6R, and Lemma 47.10.1, tag 0955.)
*Needs:* SchemeAndStackFoundations §2.7 (the module Čech comparison); Mathlib's filtered colimits
of modules.

**Local cohomology with respect to one and two elements.** For `A` Noetherian, `r, a, b ∈ A` and an
`A`-module `N`:

- `H^0_{(r)}(N) = N⟨r^∞⟩`, `H^1_{(r)}(N) = N[1/r]/image(N)` and `H^j_{(r)}(N) = 0` for `j ≥ 2`;
  `localCohomology.principalOneIsoColimit` gives `H^1_{(r)}(N) ≅ colim_{m>0} N/rᵐN`, with transition
  maps multiplication by `r`, for arbitrary `N` (regularity of `r` is not required); every
  `H^j_{(r)}` with `j ≥ 1` vanishes on a module killed by a power of
  `r`, so `H^1_{(r)}(N) = H^1_{(r)}(N/N⟨r^∞⟩)`;
- `H^j_{(a,b)}(N) = 0` for `j ≥ 3`; if `a` or `b` is regular on `N`, then `H^0_{(a,b)}(N) = 0`;
- if `b` is regular on `N`, then `H^1_{(a,b)}(N) ≅ H^0_{(a)}(H^1_{(b)}(N))` and
  `H^2_{(a,b)}(N) ≅ H^1_{(a)}(H^1_{(b)}(N))`;
- if `(a, b) = (c, b)` as ideals then `H^j_{(a,b)} = H^j_{(c,b)}`, and if `N` is a module over
  `A/(c)` with `(a, b)A/(c) = (b)A/(c)`, then `H^2_{(a,b)}(N) = 0`.

*Proof sketch.* Read each statement off the extended Čech complex on one or two generators, using
the composite-support spectral sequence for the two-element identifications and
`localCohomology.isoOfSameRadical` for the change of generators. The colimit map sends the class
of `x` modulo `rᵐN` to `x/rᵐ` modulo `image(N)`. If that class is zero, some positive power of `r`
puts `x` in the required higher power of `rN`, so the class dies at a later stage; surjectivity is
the fraction description of the localization. This works even when `r` has torsion on `N`.
(Stacks, Lemma 47.9.1, tag 0A6R;
Lemma 47.9.6, tag 0BJC.) *Needs:* the two targets above; SchemeAndStackFoundations §2.7; Mathlib
`localCohomology.isoOfSameRadical`.

**Checks.**

- For `A = N = k⟦x⟧` and `r = x`: `H^0_{(x)}(A) = 0` and `H^1_{(x)}(A) = k((x))/k⟦x⟧ ≠ 0`; a statement
  that put the nonvanishing in degree `0` fails.
- For `N = k = A/(x)` and `r = x`: `H^0_{(x)}(k) = k` and `H^1_{(x)}(k) = 0`, since `k[1/x] = 0`.
  Every term of `colim_m k/xᵐk` is `k` but every transition map is zero, so the colimit is zero:
  using identity transition maps would give the wrong answer.
- For `A = k⟦x, y⟧`, `N = A`, `(a, b) = (x, y)`: `H^2_{(x,y)}(A) ≠ 0` while `H^0` and `H^1` vanish; with
  `b = y` regular, `H^2_{(x,y)}(A) = H^1_{(x)}(H^1_{(y)}(A))`.

### K0.2 The annihilator product

**The local-cohomology annihilator product.** For a commutative ring `R`, an ideal `J`, an
`R`-module `M` and a natural number `d`, define

```text
a_J(M, d) = ∏_{0 ≤ j < d} Ann_R H^j_J(M),
```

a finite product of ideals of `R`. It is a product, not an intersection, and the cutoff `d` is an
explicit natural number, so that no infinite or bottom dimension is converted to a number.
Česnavičius's `a(M)` for a finite module over a Noetherian local ring is `a_𝔪(M, dim Supp M)` when
`M ≠ 0`; for `M = 0` it is the empty product `R`. `Suggested.lean` declares `annihilatorProduct`
and `annihilatorProduct_le_annihilator`.

*Hypotheses.* `R` any commutative ring, `M` any module; no locality or finiteness.

The API:

- `annihilatorProduct_zero`: `a_J(M, 0) = R`, for every `M` including `0`.
- `annihilatorProduct_succ`: `a_J(M, d + 1) = a_J(M, d) · Ann_R H^d_J(M)` (the new factor has degree
  `d`).
- `annihilatorProduct_le_annihilator`: for `j < d`, `a_J(M, d) ⊆ Ann_R H^j_J(M)`.
- `annihilatorProduct_eq_top_of_subsingleton`: if `H^j_J(M) = 0` for every `j < d`, then
  `a_J(M, d) = R`.
- `annihilatorProduct_congr`: a linear equivalence `M ≃ N` gives `a_J(M, d) = a_J(N, d)`.

*Proof sketch.* Expand the finite product over `Finset.range d`; the empty product is the unit ideal,
the successor splits off the last factor, a product of ideals lies in each factor, and the
annihilator of a zero module is the unit ideal. (Česnavičius, Definition 3.1(ii), p. 10; Remark 3.3,
p. 10; Lemma 3.6, p. 11.) *Needs:* Mathlib `localCohomology`, `Module.annihilator`.

**Checks.**

- Cutoff zero: `a_J(M, 0) = R` for every `J` and `M`, including `M = 0`.
- Cutoff one: `a_J(M, 1) = Ann_R H^0_J(M)` exactly, not its radical: for `R = k⟦x⟧`, `J = 𝔪`,
  `M = R/(x²)`, `H^0_𝔪(M) = M` and `a_𝔪(M, 1) = (x²)`, whereas the radical is `(x)`.
- The zero module: all its local cohomology vanishes, so `a_J(0, d) = R` for every `d`.
- Product, not intersection: for `R = k⟦x, y⟧`, `J = 𝔪` and `M = k ⊕ R/(y)`, `Ann H^0_𝔪(M) = (x, y)`
  (from the summand `k`) and `Ann H^1_𝔪(M) = (y)` (from `H^1_𝔪(k⟦x⟧) = k((x))/k⟦x⟧`), so
  `a_𝔪(M, 2) = (xy, y²)`, while the intersection is `(y)`; `y ∉ (xy, y²)`.

### K0.3 Secant sequences

**Prefix quotients.** For an arbitrary `R`-module `M` and a finite list `rs`, the notation
`prefixQuotient M rs` means `M ⧸ (Ideal.ofList rs • ⊤)`. This is a specialization of Mathlib's
module quotient, with no local or Noetherian hypothesis. Its notation API is
`prefixQuotient_nil` (a linear equivalence with `M`), `prefixQuotient_append` (a linear equivalence
between the quotient by `rs ++ qs` and the iterated quotient by `rs`, then `qs`), and
`prefixQuotient_perm` (the equivalence induced by equality of the generated ideals under a
permutation). Each equivalence commutes with the quotient maps from `M`; it is not an equality
of carrier types. (Česnavičius, Definition 3.1 and Remark 3.2, pp. 9–10.) *Needs:* Mathlib
`Ideal.ofList`, `Submodule.mkQ`, `Submodule.mapQ`.

**Checks.**

- The quotient of `ℤ` by the empty list is linearly equivalent to `ℤ`, not the zero module.
- `prefixQuotient ℤ [2]` is `ℤ/2`, a nonzero module; it is not the submodule `2ℤ`.
- `prefixQuotient ℤ [2, 3]` is zero because `(2, 3) = ℤ`; quotienting by the product instead would
  give the nonzero module `ℤ/6`. The iterated quotient `(ℤ/2)/3(ℤ/2)` is zero too.

**Secant sequences.** For a finite module `M` over a Noetherian local ring `(R, 𝔪)`, a list
`r₁, …, rₛ` is secant for `M` when every `rᵢ` lies in `𝔪` and every step strictly lowers the support
dimension:

```text
dim Supp M/(r₁, …, rᵢ)M  <  dim Supp M/(r₁, …, r_{i-1})M      (1 ≤ i ≤ s).
```

Since `dim(∅) = ⊥`, only the empty list is secant for the zero module. `Suggested.lean` declares
`IsSecant` and `prefixQuotient`.

*Hypotheses.* `R` Noetherian local, `M` finite (the definition itself needs only a local ring).

The API:

- `isSecant_nil`: the empty list is secant for every `M`.
- `isSecant_iff_supportDim`: for `M ≠ 0`, `rs` is secant iff its entries lie in `𝔪` and
  `dim Supp M/(rs)M + length rs = dim Supp M` (each step drops the dimension by at most one, since
  `dim Supp N ≤ dim Supp N/xN + 1` for `x ∈ 𝔪`); in particular a secant list is a part of a system of
  parameters and has length at most `dim Supp M`. The hypothesis `M ≠ 0` is needed: for `M = 0` both
  sides of the formula are `⊥` for every list.
- `IsSecant.perm`: a permutation of a secant list is secant; `IsSecant.sublist`: a sublist of a
  secant list is secant.
- `IsSecant.pow`: replacing any entry by a positive power of itself keeps the list secant.
- `IsSecant.take_mul`: if `r₁, …, rₛ` is secant and `i ≤ j ≤ s`, then the truncated list
  `r₁, …, r_{i-1}, rᵢr_j` is secant. Replacing `rᵢ` by `rᵢr_j` inside the full list is not allowed:
  `r₁r₂, r₂` is never secant, since its second step does not lower the dimension.
- `isSecant_of_isRegular`: a regular sequence on a nonzero `M` is secant.
- `IsSecant.append_iff`: `rs ++ qs` is secant for `M` iff `rs` is secant for `M` and `qs` is secant
  for `M/(rs)M`.

*Proof sketch.* The dimension inequality `dim Supp N ≤ dim Supp N/xN + 1` for `x ∈ 𝔪` is Mathlib's
`Module.supportDim_le_supportDim_quotSMulTop_succ`; secancy is therefore the dimension formula, which
depends only on the closed set `V(r₁, …, rₛ) ∩ Supp M` and so is invariant under permutations and
under replacing an entry by a positive power. For `IsSecant.take_mul`, neither `rᵢ` nor `r_j` vanishes
at a point of maximal coheight of `Supp M/(r₁, …, r_{i-1})M`, hence neither does `rᵢr_j`. A regular
element in `𝔪` drops the dimension by exactly one
(`Module.supportDim_quotSMulTop_succ_eq_supportDim`). (Česnavičius, Definition 3.1(i), p. 9, and
Remark 3.2, p. 10.) *Needs:* Mathlib `Module.supportDim`, `Ideal.ofList`,
`Module.supportDim_le_supportDim_quotSMulTop_succ`,
`Module.supportDim_quotSMulTop_succ_eq_supportDim`.

**Checks.**

- For `R = M = ℚ⟦X⟧`, `[X]` is secant (dimension `1 → 0`) and so is `[X²]`; `[X, X]` is not (the second
  step stays at dimension `0`).
- `[0]` is not secant for the field `ℚ`: `0 ∈ 𝔪 = 0` but the dimension stays `0`.
- `[1]` is not secant for any `M ≠ 0`, because `1 ∉ 𝔪`.
- For the zero module, only `[]` is secant: `⊥ < ⊥` fails at the first step of a nonempty list.

### K0.4 CM-secant sequences

**The Cohen–Macaulay condition through local cohomology.** For a finite module `N` over a Noetherian
local ring, say that the low local cohomology of `N` vanishes when `H^j_𝔪(N) = 0` for every natural
`j < dim Supp N`. `Suggested.lean` declares `LowLocalCohomologyVanishes`. The zero module satisfies
it vacuously. The comparison
`lowLocalCohomologyVanishes_iff_isCohenMacaulay : LowLocalCohomologyVanishes R N ↔ Module.IsCohenMacaulay N`
holds for finite `N` over a Noetherian local ring: for `N ≠ 0`, depth is the least `j` with
`H^j_𝔪(N) ≠ 0` and depth is at most the support dimension.
(SchemeAndStackFoundations §2.7, depth and local cohomology, from Stacks Lemma 47.11.1, tag 0AVZ;
§0.17 `depth_le_supportDim`.)

**Checks.**

- The zero module satisfies the condition (its support dimension is `⊥`).
- `ℚ⟦X⟧` satisfies it: `H^0_𝔪(ℚ⟦X⟧) = 0` and the dimension is `1`.
- `R = k⟦x, y⟧/(x², xy)` does not: it has dimension `1` and the class of `x` is a nonzero element
  killed by `𝔪`, so `H^0_𝔪(R) ≠ 0`. Equivalently the same quotient as a module over
  `k⟦x⟧⟦y⟧` fails `LowLocalCohomologyVanishes`; `Suggested.lean` pins this latter form for `k = ℚ`.

**CM-secant sequences.** For a finite module `M` over a Noetherian local ring `(R, 𝔪)`, a list
`r₁, …, rₛ` is CM-secant for `M` when it is secant for `M`, the terminal quotient `M/(r₁, …, rₛ)M` is
Cohen–Macaulay, and for every `1 ≤ i ≤ s`

```text
rᵢ ∈ a(M/(r₁, …, r_{i-1})M) = ∏_{j < dim Supp M/(r₁,…,r_{i-1})M} Ann_R H^j_𝔪(M/(r₁, …, r_{i-1})M).
```

Cohen–Macaulayness is required of the terminal quotient only; the intermediate quotients need not
be Cohen–Macaulay, and the prefixes of a CM-secant sequence are not asserted to be CM-secant. The
empty list is CM-secant exactly when `M` is Cohen–Macaulay. `Suggested.lean` declares `IsCMSecant`
(with the terminal condition in the form `LowLocalCohomologyVanishes` and the dimension of each
nonzero prefix quotient given as a natural number `d`) and `isCMSecant_nil_iff`.

*Hypotheses.* `R` Noetherian local, `M` finite. The dimension of a prefix quotient before a step is
finite and not `⊥` (the quotient is nonzero because the step drops its dimension), which is what
makes the natural-number cutoff available.

The API:

- `IsCMSecant.mem_maximalIdeal`: every entry lies in `𝔪`.
- `IsCMSecant.supportDim_lt`: every step strictly lowers the support dimension.
- `IsCMSecant.isCohenMacaulay_terminal`: the terminal quotient is Cohen–Macaulay.
- `IsCMSecant.mem_annihilatorProduct`: at step `i` the prefix quotient has a natural support
  dimension `d` and `rᵢ ∈ a_𝔪(M/(r₁, …, r_{i-1})M, d)`.
- `isCMSecant_nil_iff`: `[]` is CM-secant iff `M` is Cohen–Macaulay (including `M = 0`).
- `isCMSecant_iff`: `IsCMSecant M rs` iff `IsSecant M rs`, `Module.IsCohenMacaulay (M/(rs)M)` and the
  annihilator memberships hold; this is the comparison with SchemeAndStackFoundations' predicate.
- `IsCMSecant.of_isCohenMacaulay`: if `M` is Cohen–Macaulay, every secant list is CM-secant (all
  annihilator products are `R`, by K0.5 and induction).

*Proof sketch.* Projections of the defining conjunction; the empty case is the terminal condition.
For `isCMSecant_iff` apply `lowLocalCohomologyVanishes_iff_isCohenMacaulay`, and for the natural
cutoff use that a nonzero finite module over a Noetherian local ring has finite support dimension
(Nakayama rules out a zero prefix quotient before a step). (Česnavičius, Definition 3.1(ii), p. 10,
and §1.14, p. 4, with the support-restricted Cohen–Macaulay convention.) *Needs:* K0.2, K0.3;
SchemeAndStackFoundations §0.17 `Module.IsCohenMacaulay`, §2.7 (depth and local cohomology); Mathlib
`Module.supportDim_eq_bot_iff_subsingleton`.

**Checks.**

- The empty list is CM-secant for the one-dimensional `ℚ`-vector space `ℚ` (support dimension `0`, no
  condition below it).
- `[0]` is not CM-secant for `ℚ`: it is not secant.
- For the zero module, `[]` is CM-secant and no nonempty list is.
- For `R = M = ℚ⟦X⟧`, `[X]` is CM-secant: the dimension drops from `1` to `0`, the terminal quotient `ℚ`
  is Cohen–Macaulay, and `X ∈ a(ℚ⟦X⟧) = Ann H^0_𝔪(ℚ⟦X⟧) = R`.
- `[X²]` is CM-secant for `ℚ⟦X⟧` as well: the definition does not single out a uniformizer.
- For `R = M = k⟦x, y⟧/(x², xy)` (dimension one, `H^0_𝔪(R) = k·x̄`), `a(R) = Ann H^0_𝔪(R) = 𝔪`, so `[y]` is
  CM-secant (`y ∈ 𝔪`, the terminal quotient `k⟦x,y⟧/(x², y)` has dimension `0`), although `R` is not
  Cohen–Macaulay; and `[y]` is not regular on `R`, since `y·x̄ = 0`.

### K0.5 Schenzel's torsion bound

**Schenzel's bound.** Let `r₁, …, rₛ` (`s ≥ 1`) be secant for a finite module `M` over a Noetherian
local ring, and let `d = dim Supp M`. Then `a_𝔪(M, d)` kills every element of `M/(r₁, …, r_{s-1})M`
that is killed by a positive power of `rₛ`. No Cohen–Macaulay or dualizing-complex hypothesis is
made. When `M` is Cohen–Macaulay, `a(M) = R`, so `rₛ` is regular on `M/(r₁, …, r_{s-1})M`, and every
secant sequence for a Cohen–Macaulay module is regular. `Suggested.lean` declares
`schenzel_torsion_bound`.

*Hypotheses.* `R` Noetherian local, `M` finite and nonzero with `d = dim Supp M ∈ ℕ`, the list
nonempty and secant (so its entries lie in `𝔪`).

*Proof sketch.* The bound for the kernel of `rₛ` itself is Schenzel's theorem in the form stated by
Česnavičius and by Kawasaki's 1996 Lemma 2.4. Schenzel 1982, 2.4.2 is the historical proof reference
given by Česnavičius. For an element killed by `rₛⁿ` with `n > 0`, replace `rₛ` by `rₛⁿ`: the list stays secant
(K0.3, `IsSecant.pow`) and `a(M)` is unchanged, so the same ideal kills the union of the kernels of
all positive powers. (Česnavičius, Remark 3.3, p. 10; Kawasaki 1996, Lemma 2.4, p. 42.) *Needs:* K0.2,
K0.3, K0.1; SchemeAndStackFoundations §2.7.

**Checks.**

- For Cohen–Macaulay `M` the bound says the last element is regular on the penultimate quotient; for
  `M = ℚ⟦X⟧` and `[X]`, `X` is regular on `ℚ⟦X⟧`.
- For `R = M = k⟦x, y⟧/(x², xy)` and the secant list `[y]`: the `y`-torsion of `R` is `k·x̄`, and
  `a(R) = 𝔪` kills it; the bound is sharp in that `a(R) ≠ R`.

### K0.6 Parameters and `p`-standard systems

**Extension to parameters.** Every CM-secant sequence `r₁, …, rₛ` for a nonzero finite module `M` over
a Noetherian local ring extends to a CM-secant system of parameters `r₁, …, rₛ, q₁, …, q_e` with
zero-dimensional terminal quotient. `Suggested.lean` declares `isCMSecant_exists_append`.

*Proof sketch.* The terminal quotient `N = M/(r₁, …, rₛ)M` is nonzero (Nakayama) and Cohen–Macaulay;
choose a system of parameters `q₁, …, q_e` of `N`. It is regular on `N` (DeformationAndDerivedPatchingAlgebra
R03.3), each `N/(q₁, …, q_{k})N` is again Cohen–Macaulay, so every annihilator product along the
extension is `R` (`annihilatorProduct_eq_top_of_subsingleton`), and the concatenated list is secant by
`IsSecant.append_iff`. (Česnavičius, Remark 3.4, p. 10.) *Needs:* K0.2–K0.4;
DeformationAndDerivedPatchingAlgebra R03.3; SchemeAndStackFoundations §0.17.

**Reversal and `p`-standard systems.** Let `M` be a nonzero finite module of support dimension
`d > 0` and `r₁, …, r_d` a secant system of parameters (so `M/(r₁, …, r_d)M` has dimension `0` and is
Cohen–Macaulay). Then `r₁, …, r_d` is CM-secant for `M` iff the reversed list `x_j = r_{d+1-j}` is a
`p`-standard system of parameters of type `d − 1` in Kawasaki's sense, that is, `x_d ∈ a(M)` and
`x_j ∈ a(M/(x_{j+1}, …, x_d)M)` for `j < d`. This is a statement about the reversed order, not about
permutations. In dimension zero the empty list satisfies both conditions vacuously. `Suggested.lean`
declares `isCMSecant_iff_pStandard_reverse`.

*Proof sketch.* The quotient `M/(x_{j+1}, …, x_d)M` is the prefix quotient before `r_{d+1-j}`, so the
two lists of annihilator memberships coincide term by term, and the terminal condition holds
automatically. (Česnavičius, Remark 3.4, p. 10; Kawasaki 1996, Definition 2.5, p. 42, with Theorem 2.6
and Lemma 2.7, pp. 42–43.) *Needs:* K0.4; DeformationAndDerivedPatchingAlgebra R03.3.

**Checks.**

- For `M = ℚ⟦X⟧` (`d = 1`), `[X]` is CM-secant and its reversal `[X]` is `p`-standard of type `0`:
  `X ∈ a(ℚ⟦X⟧) = R`.
- For `R = M = k⟦x, y⟧/(x², xy)` (`d = 1`, `a(R) = 𝔪`), `[y]` satisfies both sides; the list `[x + y]`
  also does, since `x + y ∈ 𝔪` is a parameter (`R/(x+y)` has finite length).

### K0.7 Duality and the non-Cohen–Macaulay locus

Over a Noetherian local ring with a normalized dualizing complex `ω` (SchemeAndStackFoundations §2.21
`DualizingComplex`, `NormalizedDualizing`), local duality turns the annihilator of
`H^j_𝔪(M)` into the annihilator of a finite module, whose zero locus is a support. These targets
explain what CM-secancy means; the later layers do not use them.

**Normalized local duality for finite modules.** Let `(R, 𝔪, κ)` be Noetherian local with a
normalized dualizing complex `ω` and let `E` be an injective hull of `κ`. For every finite `R`-module
`M` and every `j ∈ ℤ` there is an isomorphism, natural in `M`,

```text
H^j_𝔪(M) ≅ Hom_R(Ext^{-j}_R(M, ω), E).
```

*Proof sketch.* Stacks' local duality gives `Ext^{-j}_R(M, ω)^∧ ≅ Hom_R(H^j_𝔪(M), E)` with `^∧` the
`𝔪`-adic completion. Put `N = Ext^{-j}_R(M, ω)`, a finite module. Local cohomology is
`𝔪`-power torsion; the finite completed dual above implies it is Artinian (Stacks, Remark
47.7.9). The injective hull `E` and `H^j_𝔪(M)` have their canonical `R̂`-actions; on these power-torsion modules an
`R`-linear map is automatically `R̂`-linear. Apply `Hom_{R̂}(-, E)` to this isomorphism and Matlis
biduality over the complete ring `R̂`. Finally
`Hom_{R̂}(N^∧, E) ≅ Hom_R(N, E)`, by `N^∧ ≅ R̂ ⊗_R N` and restriction–extension adjunction.
Here the first `Hom` is over `R̂`: replacing it by ordinary algebraic `Hom_R(N^∧, E)` is not
valid over a noncomplete ring. Over a complete ring this is Hartshorne's form, which the source
quotes. (Stacks, Theorem 47.18.3, tag 0A84, and
Lemma 47.18.4, tag 0AAK; Section 47.7, tag 08Z1, for the injective hull and Matlis duality;
Česnavičius, proof of Lemma 3.6(a), p. 11.) *Needs:* SchemeAndStackFoundations §2.21
(`NormalizedDualizing`); Mathlib `CategoryTheory.Injective`.

**Check for completion.** For the noncomplete DVR `R = k[x]_{(x)}`, `ω = R[1]` and
`E = k(x)/R`, local duality gives `H^1_𝔪(R) = E = Hom_R(R, E)` and
`Hom_{R̂}(R̂, E) = E`, with `R̂ = k⟦x⟧`. Ordinary `Hom_R(R̂, E)` is larger: the nonzero module
`R̂/R` has a nonzero map to `E`. To see this, send a nonzero cyclic submodule to the residue
field inside `E`, then extend by injectivity. Thus the restriction map
`Hom_R(R̂, E) → Hom_R(R, E)` has a nonzero kernel. This distinguishes the two scalar rings in
the biduality argument without adding completeness to the theorem.

**The Matlis annihilator lemma.** Let `R` be Noetherian local and `E` an injective `R`-module
containing `κ` as an essential submodule (an injective hull of `κ`). For every finite `R`-module `N`,
`Ann_R N = Ann_R Hom_R(N, E)`. `Suggested.lean` declares
`annihilator_eq_annihilator_linearMap_injectiveHull`, with the hull given by an injective module
`E`, an injection `e : κ → E` and the essentiality condition `P ≠ 0 → P ∩ image(e) ≠ 0`.

*Proof sketch.* `Ann N ⊆ Ann Hom(N, E)` always. Conversely a nonzero finite module has `κ` as a
quotient (Nakayama) and `κ ⊆ E`, so `Hom(N', E) = 0` forces `N' = 0`; applying the exact functor
`Hom(-, E)` to `0 → N⟨r⟩ → N →(r) N → N/rN → 0` shows that `r` kills `Hom(N, E)` only if it kills `N`.
(Česnavičius, proof of Lemma 3.6(a), p. 11.) *Needs:* Mathlib `Module.annihilator`,
`CategoryTheory.Injective`.

**Checks.**

- `N = κ`: both annihilators are `𝔪` (here `Hom(κ, E) = κ`).
- `N = 0`: both annihilators are `R`.
- `N = R` with `R = k⟦x⟧`: `Ann R = 0` and `Hom(R, E) = E` is faithful, so `Ann E = 0`.
- A variant claiming `Ann Hom(N, E) = 𝔪·Ann N` fails for `R = k⟦x⟧` and `N = k`, where it would give
  `(x²)` instead of `(x)`.

**The local-duality annihilator identity.** For `(R, 𝔪)` Noetherian local with a normalized
dualizing complex `ω`, every finite `M` and every `j ∈ ℤ`,
`Ann_R H^j_𝔪(M) = Ann_R Ext^{-j}_R(M, ω)`. The normalization matters: a shift of `ω` shifts the
right-hand index.

*Proof sketch.* Normalized local duality and the Matlis annihilator lemma applied to the finite
module `Ext^{-j}_R(M, ω)`. (Česnavičius, Lemma 3.6(a), p. 11.) *Needs:* the two targets above.

**Checks.**

- For the DVR `R = k⟦x⟧`, `ω = R[1]` and `M = R`, the two local-cohomology degrees are
  `H^0_𝔪(R) = 0` and `H^1_𝔪(R) = k((x))/R = E`. The matching Ext groups are
  `Ext^0(R, R[1]) = 0` and `Ext^{-1}(R, R[1]) = R`. Thus the index is `-j` and the normalized
  complex is shifted by `+1`. At the generic prime `𝔭 = 0`, `δ(𝔭) = dim R = 1`, so the normalized
  complex of `R_𝔭 = k((x))` is `ω_𝔭[-δ(𝔭)] = k((x))[0]`, fixing the localization shift too.
- `R = k`, `ω = k[0]`, `M = k`: in degree `0` both annihilators are `0`; in every other degree both
  modules vanish and both annihilators are `R`.
- With `ω[1]` in place of `ω` (not normalized) the identity fails in degree `0` for the same data.

**The annihilator product and the non-Cohen–Macaulay locus.** Let `(R, 𝔪)` be Noetherian local with a
normalized dualizing complex, and `M` a finite module with equidimensional support of dimension `d`.
Then the closed set `V(a_𝔪(M, d))` is exactly the set of primes `𝔭 ∈ Supp M` at which `M_𝔭` is not
Cohen–Macaulay. For `M = 0` both sides are empty.

*Proof sketch.* By the duality identity `V(a(M))` is the union of the supports of the finite modules
`Ext^{-j}(M, ω)`, `j < d`. Localize at `𝔭`: `(ω_𝔭)[−δ(𝔭)]` is a normalized dualizing complex of `R_𝔭`
with `δ(𝔭) = dim R/𝔭`, and finite annihilator products commute with localization. Equidimensionality
of the support and catenarity of `R` (a ring with a dualizing complex is universally catenary) give
`dim Supp M_𝔭 = d − δ(𝔭)`, and the vanishing of `Ext^{-j}` below that dimension is Cohen–Macaulayness
of `M_𝔭`. (Česnavičius, Lemma 3.6(b), pp. 11–12; Stacks, Lemma 47.17.3, tag 0A7Z, Lemma 47.17.4, tag
0A80, and Lemma 47.16.5, tag 0A7U.) *Needs:* the identity above; SchemeAndStackFoundations §§0.16–0.17
`Excellence.IsCatenary`, `Module.IsCohenMacaulay`; K0.4.

**Checks.**

- `M = R` Cohen–Macaulay with a dualizing complex: `a(R) = R` and the non-Cohen–Macaulay locus is
  empty.
- Equidimensionality is necessary: for `R = k⟦x, y, z⟧/(xy, xz)` (a plane and a line through the
  origin) the line's generic point `(y, z)` lies in `V(a(R))` (see the next target), although
  `R_{(y,z)}` is a field and hence Cohen–Macaulay.

**The defect set for arbitrary support.** Under the hypotheses of the previous target without
equidimensionality, with `d = dim Supp M`,

```text
V(a_𝔪(M, d)) = {𝔭 ∈ Supp M : depth_{R_𝔭} M_𝔭 + dim R/𝔭 < d}.
```

In particular `V(a(M))` contains every irreducible component of `Supp M` of dimension less than `d`.

*Proof sketch.* As before, `V(a(M))` is the union of the supports of `Ext^{-j}(M, ω)` for `0 ≤ j < d`.
At `𝔭`, the least `j` with `Ext^{-j}(M, ω)_𝔭 ≠ 0` is `depth M_𝔭 + δ(𝔭)` (the depth formula for the
normalized dualizing complex of `R_𝔭`, shifted by `δ(𝔭) = dim R/𝔭`), so `𝔭` lies in the union exactly
when `depth M_𝔭 + dim R/𝔭 < d`. At the generic point of a component of dimension `e < d` the localized
module is nonzero of dimension zero, so of depth zero, and `0 + e < d`. The source attributes the
formula to Schenzel (2.4.6); this route needs only the Stacks lemmas. (Česnavičius, Remark 3.7, p. 12;
Stacks, Lemma 47.16.5, tag 0A7U, and Lemma 47.17.3, tag 0A7Z.) *Needs:* the identity above;
SchemeAndStackFoundations §2.7.

**Checks.**

- For `R = M = k⟦x, y, z⟧/(xy, xz)` (`d = 2`), the prime `𝔭 = (y, z)` of the one-dimensional component
  has `depth R_𝔭 = 0` and `dim R/𝔭 = 1`, and `0 + 1 < 2`, so `𝔭 ∈ V(a(R))`.
- For equidimensional `M` the defect set is the non-Cohen–Macaulay locus, recovering the previous
  target.

### Examples

- For `R = k⟦x, y⟧/(x², xy)`, `a(R) = 𝔪`: the non-Cohen–Macaulay locus is the closed point. A
  CM-secant element must lie in `𝔪`, which is automatic; `[y]` is CM-secant but not regular, which
  is the phenomenon CM-secancy is designed to allow.
- For a Cohen–Macaulay `M`, every secant sequence is CM-secant and regular.

### Dependencies

Mathlib; SchemeAndStackFoundations §§0.16–0.18, §2.7 and §2.21;
DeformationAndDerivedPatchingAlgebra R03.3.

## Layer K1: Huneke d-sequences and the Goto–Yamagishi identities

d-sequences weaken regular sequences: each element is asked to be injective only on the part of the
prefix quotient generated by the whole sequence. Everything in this layer holds for an arbitrary
module over an arbitrary commutative ring.

### K1.1 d-sequences

**d-sequences.** For a module `M` over a commutative ring `R`, a list `r₁, …, rₛ` is a d-sequence for
`M` when, for every `1 ≤ i ≤ s`, multiplication by `rᵢ` is injective on the submodule

```text
(r₁, …, rₛ)·(M/(r₁, …, r_{i-1})M)  ⊆  M/(r₁, …, r_{i-1})M,
```

that is, on the image of `JM` in the `i`-th prefix quotient, where `J = (r₁, …, rₛ)`. There is no
properness, finiteness, locality or nonvanishing hypothesis. `Suggested.lean` declares `IsDSequence`,
`isDSequence_of_isWeaklyRegular` and `isDSequence_iff_torsion`.

The API:

- `isDSequence_nil`: the empty list is a d-sequence for every module.
- `isDSequence_of_subsingleton`: every list is a d-sequence for the zero module.
- `isDSequence_of_isWeaklyRegular`: a weakly regular sequence (Mathlib
  `RingTheory.Sequence.IsWeaklyRegular`) is a d-sequence, by restricting injectivity on the prefix
  quotient to a submodule; no final nonvanishing (`IsRegular`) is needed.
- `isDSequence_singleton_iff`: `[r]` is a d-sequence iff multiplication by `r` is injective on `rM`
  (not on all of `M`).
- `isDSequence_congr`: a linear equivalence `M ≃ N` preserves d-sequences (it induces equivalences of
  the prefix quotients compatible with the submodules and the scalar action, via `Submodule.mapQ`).
- `isDSequence_iff_torsion`: `rs` is a d-sequence iff for all `i ≤ j` the `r_j`-torsion and the
  `rᵢr_j`-torsion of `M/(r₁, …, r_{i-1})M` coincide.

*Proof sketch.* The first five are unfolding. For `isDSequence_iff_torsion`, forward: if
`rᵢr_j x = 0` in the `i`-th prefix quotient then `r_j x` lies in the image of `JM` and is killed by
`rᵢ`, so `r_j x = 0`. Converse, by induction on the length: let `x` be in the image of `JM` in the
`i`-th prefix quotient with `rᵢx = 0`; the `(i, s)` condition gives `rₛx = 0`; write `x = y + rₛz` with
`y` in the image of `(r₁, …, r_{s-1})M`; modulo `(r₁, …, r_{s-1})`, `rₛ²z = 0`, so the `(s, s)` condition
gives `rₛz = 0` there and `x` lies in the image of `(r₁, …, r_{s-1})M`; the truncated list satisfies the
same torsion conditions and induction finishes; for `i = s` the `(s, s)` condition applies directly.
No finiteness is used. (Česnavičius, Definition 3.8 and Remark 3.9, p. 12, with the later index
`r_j`; Kawasaki 1996, Definition 2.1, p. 41, which takes the torsion form as the definition.) *Needs:* Mathlib `Ideal.ofList`,
`IsSMulRegular`, `Submodule.mkQ`, `Submodule.mapQ`, `RingTheory.Sequence.IsWeaklyRegular`.

**Checks.**

- The empty list is a d-sequence for every module.
- `[0]` is a d-sequence for `ℚ` (multiplication by `0` is injective on `0·ℚ = 0`), but it is not weakly
  regular.
- `[1]` is a d-sequence for `ℚ` but not a regular sequence, because its final quotient is `0`.
- `[2, 0]` is a d-sequence for `ℤ`: `2` is injective on `2ℤ`, and `(2, 0)·(ℤ/2) = 0`.
- `[0, 2]` is not a d-sequence for `ℤ`: multiplication by `0` is not injective on `(0, 2)ℤ = 2ℤ`. The
  order of the list matters.
- The index in the torsion characterization is the later one: over `R = k⟦t, u⟧` with
  `M = R/(u) ⊕ R`, the list `[t, u]` is a d-sequence, and for `i = 1, j = 2` the `tu`-torsion of `M` is
  `R/(u) ⊕ 0`, which equals the `u`-torsion but not the `t`-torsion `0`.

### K1.2 The Goto–Yamagishi identities

Let `rs = (r₁, …, rₛ)` be a d-sequence for `M`, `J = (r₁, …, rₛ)` and `Qᵢ = (r₁, …, r_{i-1})M`. For every
`n ≥ 1` and `1 ≤ i ≤ s`:

```text
(Qᵢ :_M rᵢ) ∩ JⁿM  =  Qᵢ ∩ JⁿM  =  (r₁, …, r_{i-1})·J^{n-1}M.
```

**The colon identity.** `Suggested.lean` declares `goto_yamagishi_colon`, the first equality, with
the colon `(Qᵢ :_M rᵢ)` written as the preimage of `Qᵢ` under multiplication by `rᵢ`.

*Proof sketch.* For `n = 1` this is the definition of a d-sequence: an element of `JM` whose image is
`rᵢ`-torsion in `M/Qᵢ` maps to zero. Since `JⁿM ⊆ JM` for `n ≥ 1` the same argument applies.
(Česnavičius, Remark 3.10, first equality of (3.10.1), p. 12.) *Needs:* K1.1; Mathlib
`Submodule.comap`.

**The intersection identity.** `Suggested.lean` declares `goto_yamagishi_intersection`, the second
equality.

*Proof sketch.* Increasing induction on `n` and decreasing induction on `i`, from the trivial cases
`i = s + 1` (where `JⁿM = J·J^{n-1}M`) and `n = 1` (where `Qᵢ ⊆ JM`). For `n ≥ 2` and `i ≤ s`, write
`x ∈ Qᵢ ∩ JⁿM` as `y + rᵢz` with `y ∈ (r₁, …, r_{i-1})J^{n-1}M` by the case `i + 1`; then
`z ∈ (Qᵢ :_M rᵢ) ∩ J^{n-1}M = Qᵢ ∩ J^{n-1}M` by the colon identity, and the case `n − 1` places `rᵢz` in
`(r₁, …, r_{i-1})J^{n-1}M`. The case `n = 1` uses the base case rather than a colon identity at
`n = 0`, which is false. (Česnavičius, Remark 3.10, second equality of (3.10.1) and its proof, p. 12;
Kawasaki's 1999 author preprint, Proposition 3.2, p. 5.) *Needs:* the colon identity; Mathlib `Ideal.ofList`.

**Checks.**

- The bound `n ≥ 1` is needed: for the d-sequence `[0]` on `ℚ` and `i = 1`, `(Q₁ :_ℚ 0) = ℚ` while
  `Q₁ = 0`, so the colon identity fails at `n = 0` and holds at `n ≥ 1`, where `JⁿM = 0`.
- For the regular sequence `x, y` on `R = k⟦x, y⟧`, `i = 2`, `n = 2`:
  `(x) ∩ (x, y)² = (x², xy) = (x)·(x, y)`, as the intersection identity predicts.

### Examples

- Every regular sequence is a d-sequence; `[0]` on a nonzero module and `[1]` on any module are
  d-sequences that are not regular. In a d-sequence the order matters: `[2, 0]` is one on `ℤ` and
  `[0, 2]` is not.

### Dependencies

Mathlib; K0.3 for the prefix-quotient notation.

## Layer K2: Products of prefix ideals and Kawasaki's conditions

Kawasaki's ideal is the product of the successive prefix ideals of a CM-secant sequence. His
proposition says that the initial segments of a CM-secant sequence satisfy three conditions — a
reversed d-sequence condition, a torsion condition and a regularity condition — that survive
division by auxiliary secant sequences. The Cohen–Macaulay theorem of Layer K4 uses only these
conditions.

### K2.1 Products of prefix ideals

**Prefix products.** For a list `rs = (r₁, …, rₜ)` and `s ∈ ℕ` define

```text
I_s = ∏_{0 ≤ i < s} (rs.take (i+1)) = (r₁)·(r₁, r₂)·⋯·(r₁, …, rₛ)      (s ≤ t),
```

with `I₀ = R`. It is not the `s`-th power of `(r₁, …, rₛ)`. The definition is total in `s`; for `s > t`
the extra factors repeat `(r₁, …, rₜ)`. The recurrence holds for every natural `s`, while the
geometric statements use `s ≤ t`. `Suggested.lean` declares
`prefixProduct` and `prefixProduct_succ`.

The API:

- `prefixProduct_zero`: `I₀ = R`.
- `prefixProduct_succ`: `I_{s+1} = I_s·(r₁, …, r_{s+1})`; this is the recurrence that matches the
  product-of-ideals identity for blowing-ups (K3.5).
- `prefixProduct_one`: `I₁ = (r₁)` for a nonempty list.
- `prefixProduct_take`: for `s ≤ length rs`, computing `I_s` from `rs.take s` gives the same ideal.
- `prefixProduct_le`: for `0 < s`, `I_s ⊆ (rs.take s)^s ⊆ (rs.take s)`; when the list is nonempty,
  `I_s` contains `r₁ˢ` (also for `s > length rs`).

*Proof sketch.* Finite products over `Finset.range s`; `take (i+1) (take s rs) = take (i+1) rs` for
`i < s`. (Česnavičius, Proposition 3.11, the ideals `I_j`, p. 12, and the proof of Theorem 3.14,
p. 15, where the `i`-th factor is the `i`-th prefix ideal.) *Needs:* Mathlib `Ideal.ofList`.

**Checks.**

- `I₀ = R` for every list.
- For `[a, b]`, `I₂ = (a)·(a, b)`.
- For `R = ℤ` and `[2, 3]`, `I₂ = (2)·(2, 3) = (2)` while `(2, 3)² = ℤ`: a definition by the power of the
  full prefix ideal fails.
- A zero first entry kills every positive prefix product: `I_s = 0` for `[0, b]` and `s ≥ 1`, even when
  `b` is a unit.

### K2.2 Kawasaki's conditions

**Kawasaki's conditions.** Let `M` be a finite module over a Noetherian local ring `(R, 𝔪)` and
`rs = (r₁, …, rₛ)` a list. Say that `rs` satisfies Kawasaki's conditions on `M` when, for every list
`r'₁, …, r'_{s'}` that is secant for `M/(r₁, …, rₛ)M`:

- (i) with `M' = M/(r'₁, …, r'_{s'})M`, the reversed list `rₛ, …, r₁` is a d-sequence for `M'`;
- (ii) if `s ≥ 2`, then with `M' = M/(r'₁, …, r'_{s'})M`, for all `m, n > 0` the `rₛᵐ`-torsion and the
  `(r₁, …, rₛ)`-torsion of `M'/I_{s-1}ⁿM'` coincide (so the `rₛᵐ`-torsion does not depend on `m`);
- (iii) if `s' ≥ 1`, then with `M' = M/(r'₁, …, r'_{s'-1})M`, if the last auxiliary element `r'_{s'}`
  is regular on `M'/(r₁, …, rₛ)M'`, it is regular on `M'` and on `M'/I_sⁿM'` for every `n > 0`.

Every auxiliary list is quantified, including the empty one. `Suggested.lean` declares
`KawasakiConditions`.

The API:

- `KawasakiConditions.isDSequence_reverse`, `KawasakiConditions.torsion_eq`,
  `KawasakiConditions.isSMulRegular`: the three projections.
- `kawasakiConditions_nil`: the empty list satisfies the conditions on every module.
- `kawasakiConditions_of_subsingleton`: every list satisfies them on the zero module.
- `KawasakiConditions.isDSequence_reverse_self`: taking the empty auxiliary list in (i), `rₛ, …, r₁` is
  a d-sequence for `M` itself.
- `KawasakiConditions.prefixQuotient` (robustness, K2.4).

**Checks.**

- The empty list satisfies all three conditions: (i) is about the empty d-sequence, (ii) is vacuous,
  and in (iii) `M'/I₀ⁿM' = 0`.
- On the zero module every list satisfies them.
- On `M = ℚ⟦X⟧/(X²)`, the list `[X]` fails (i) with the empty auxiliary list: `X` is zero on the nonzero
  submodule `X·M`.
- For `M = R = ℚ⟦X⟧` and `[X]`: (i) holds because `X` is regular, (ii) is vacuous, and (iii) holds
  because the only secant lists for `M/XM = ℚ` are empty.

### K2.3 Kawasaki's proposition

Throughout, `M` is a finite module over a Noetherian local ring `(R, 𝔪)`, `r₁, …, rₜ` is CM-secant for
`M`, `0 ≤ s ≤ t`, and `r'₁, …, r'_{s'} ∈ 𝔪` is secant for `M/(r₁, …, rₛ)M`. The three clauses are kept
separate because the depth induction uses them in different places.

**Reversed prefixes are d-sequences after auxiliary quotients.** With `M' = M/(r'₁, …, r'_{s'})M`, the
reversed prefix `rₛ, …, r₁` is a d-sequence for `M'`. The reversal and the quotient by the auxiliary
sequence are essential. (README name `IsCMSecant.isDSequence_reverse_take`.)

*Proof sketch.* This is the case of a `p`-standard system of type `d − 1` of Kawasaki's lemma on
`p`-standard sequences, deduced from Schenzel's bound (K0.5) applied to the concatenation of the
auxiliary list with the prefix: the source proves it as a special case of Kawasaki 2000, 2.10,
itself a consequence of 2.9; the reversal comparison of K0.6 identifies the hypotheses.
(Česnavičius, Proposition 3.11(i) and its proof, pp. 12–13; Kawasaki 2000, 2.9–2.10.) *Needs:*
K0.3–K0.6, K1.1.

**Checks.**

- With the empty auxiliary list and `s = t = 1`, `[r₁]` is a d-sequence for `M`: for `M = ℚ⟦X⟧` and
  `[X]`, `X` is injective on `X·M`.
- The unreversed prefix is not claimed: the statement for `s = 2` is about `r₂, r₁`.

**The torsion identity.** For `s ≥ 2`, `M' = M/(r'₁, …, r'_{s'})M` and all `m, n > 0`, the `rₛᵐ`-torsion
and the `(r₁, …, rₛ)`-torsion of `M'/I_{s-1}ⁿM'` coincide. (README name
`IsCMSecant.torsion_prefixProduct`.)

*Proof sketch.* Extend to parameters (K0.6) and reverse the list, putting it in the
`p`-standard case of type `d − 1`. Apply the five colon and intersection estimates proved together
by induction on `j − i` in Kawasaki's 1999 author preprint, Theorem 3.6 (statement p. 6, proof
pp. 6–13); its Proposition 3.2 (p. 5) supplies the Goto–Yamagishi base case, and Propositions
3.4–3.5 (p. 5) supply the auxiliary-parameter and d-sequence steps. The estimates allow zero
exponents, retaining the explicit positive exponent wherever a factor is removed. Translating
the tail ideals `q_i` of the reversed system back gives the prefix products `I_j`; the resulting
torsion identity is precisely Česnavičius's Proposition 3.11(ii). His proof cites Kawasaki 2000,
3.2, through the corresponding five-part induction in 3.1, and Kawasaki 2002, 3.6 for the more
general induction. These published locators are cited through Česnavičius. The bootstrapping
technique is that of K1.2. Česnavičius
lists five misprints in Kawasaki's text that the formal proof must take into account: in the proof of
2.8 the last indices are `n_{s+1}, …, n_d`; before (3.1.5) and before the last display of Step 3
of the proof of 3.1 the membership `y_u ∈ a(M/q_k M)` is to be read as `y_u ∈ a(M/q_k M)`
or `y_u ∈ a(M)`; in (3.1.6) the list runs `y₁, …, y_u`; in the last line of 3.3 the range is
`k ≤ i ≤ j ≤ d`. (Česnavičius, Proposition 3.11(ii) and its proof, pp. 12–13.) *Needs:* the previous
target; K2.1; K1.2; K0.5.

**Checks.**

- The bounds are part of the statement: for `s ≤ 1` the clause is vacuous, and `m, n` are positive.
- The torsion on the right is the torsion of the whole ideal `(r₁, …, rₛ)`, not of `(r₁, …, r_{s-1})`.

**Regularity of the last auxiliary element.** If `s' ≥ 1`, `M' = M/(r'₁, …, r'_{s'-1})M` and the last
auxiliary element `r'_{s'}` is regular on `M'/(r₁, …, rₛ)M'`, then `r'_{s'}` is regular on `M'` and on
`M'/I_sⁿM'` for every `n > 0`. The element is the last auxiliary element, not an element of the
original sequence. (README name `IsCMSecant.isSMulRegular_prefixProduct`.)

*Proof sketch.* The same colon-estimate induction as the previous target, with a final auxiliary
parameter regular on the terminal quotient. Use Kawasaki's 1999 author preprint, Theorem 3.6,
pp. 6–13. The resulting regularity statement is Česnavičius's Proposition 3.11(iii); his proof
attributes it to Kawasaki 2000, 3.3, with the corrections above.
(Česnavičius, Proposition 3.11(iii), pp. 12–13.) *Needs:* the
previous two targets.

**Checks.**

- For a one-element auxiliary list `[a]`, the conclusion is regularity of `a` on `M` and on every
  `M/I_sⁿM`; the hypothesis is regularity of `a` on `M/(r₁, …, rₛ)M`.
- For `s = 0`, `I₀ = R`, so the conclusion reduces to regularity on `M'`, which the hypothesis gives.

**Kawasaki's proposition.** Every initial segment `r₁, …, rₛ` (`s ≤ t`) of a CM-secant sequence for
`M` satisfies Kawasaki's conditions on `M`. `Suggested.lean` declares
`kawasakiConditions_take_of_isCMSecant`.

*Proof sketch.* The three targets above, one for each condition. (Česnavičius, Proposition 3.11,
pp. 12–13.) *Needs:* the three targets above; K2.2.

### K2.4 Robustness

**Robustness under auxiliary quotients.** If `rs = (r₁, …, rₛ)` satisfies Kawasaki's conditions on
`M` and `r'₁, …, r'_{s'}` is secant for `M/(rs)M`, then `rs` satisfies Kawasaki's conditions on
`M/(r'₁, …, r'_{s'})M`. In particular this applies to an initial segment of a CM-secant sequence. It
is a statement about one list `rs`: to transfer the conditions of every initial segment of a longer
list one needs the auxiliary list to be secant for each of the corresponding prefix quotients (see
K4.1). `Suggested.lean` declares `KawasakiConditions.prefixQuotient`.

*Proof sketch.* A further auxiliary list `r''` secant for `(M/(r')M)/(rs)` gives the concatenation
`r' ++ r''`, which is secant for `M/(rs)M` (`IsSecant.append_iff`); apply each condition to it and
identify `(M/(r')M)/(r'')(M/(r')M)` with `M/(r', r'')M` (and, for (iii), the quotient by all but the
last element). (Česnavičius, Remark 3.12, p. 13.) *Needs:* K2.2; K0.3.

**Checks.**

- The empty auxiliary list leaves the conditions unchanged.
- For `M = ℚ⟦X, Y⟧`, `rs = [X]` and the auxiliary list `[Y]` (secant for `M/XM = ℚ⟦Y⟧`), the conditions
  for `[X]` on `M/YM = ℚ⟦X⟧` hold, as robustness predicts.

### Examples

- For a regular sequence on a Cohen–Macaulay module, every annihilator product is `R`, the sequence is
  CM-secant, and Kawasaki's conditions reduce to statements about regular sequences.
- For `R = M = k⟦x, y⟧/(x², xy)` and the CM-secant list `[y]`, `I₁ = (y)` and condition (i) says that
  `y` is injective on `y·R = y·k⟦y⟧`, which holds although `y` is a zero divisor on `R`.

### Dependencies

Layers K0 and K1; Mathlib.

## Layer K3: Rees modules and blowing up modules

The blowing-up of a module `M` along `I` lives on the blow-up scheme `Bl_I(Spec R) = Proj ⊕_{n≥0} Iⁿ`
of the pinned Tau Ceti library. It is the sheaf of the graded Rees module `⊕ IⁿM`; on the chart of
`a ∈ I` its module is the image of `M` in `M[1/a]` spanned over `R[I/a]`, which removes the
torsion supported on the exceptional divisor. The layer builds the graded module, the chart
modules and the sheaf, compares the sheaf with the strict transform, records the product-of-ideals
identities, and bounds the dimension of the support.

### K3.1 The graded Rees module

**The Rees module.** For an ideal `I` of a commutative ring `R` and an `R`-module `M`, the Rees
module is the `reesAlgebra I`-submodule of the polynomial module `PolynomialModule R M` consisting
of the elements whose coefficient of degree `n` lies in `IⁿM` for every `n`:

```text
reesModule I M = ⊕_{n≥0} IⁿM · tⁿ  ⊆  M[t],
```

a module over `R[It] = reesAlgebra I` by convolution (closure uses `Iⁱ·IʲM ⊆ I^{i+j}M`). Its degree-`n`
piece is `IⁿM`, including `I⁰M = M`; it is not `M ⊗_R R[It]`, which can carry torsion that `M[t]`
does not. `Suggested.lean` declares `reesModule` and `mem_reesModule_iff`.

*Hypotheses.* `R` any commutative ring, `I` any ideal, `M` any module.

The API:

- `mem_reesModule_iff`: membership is coefficientwise membership in `IⁿM`.
- `single_mem_reesModule_iff`: the degree-`n` monomial `m tⁿ` lies in the Rees module iff `m ∈ IⁿM`.
- `reesModule_top`: for `I = R` the Rees module is all of `M[t]`.
- `mem_reesModule_bot_iff`: for `I = 0`, an element lies in the Rees module iff all its coefficients of
  positive degree vanish.
- `reesModule.ext`: two elements are equal when all their coefficients are equal (from
  `PolynomialModule.coeff_inj`).
- `reesModule.map`: an `R`-linear map `f : M → N` induces a `reesAlgebra I`-linear map
  `reesModule I M → reesModule I N`, the restriction of `PolynomialModule.map R f` (it preserves
  `IⁿM → IⁿN`); `reesModule.coeff_map`: its degree-`n` coefficient is `f` of the degree-`n` coefficient,
  which determines it; `reesModule.map_id`, `reesModule.map_comp`.
- `reesModule.gradedPiece`: the degree-`n` piece is `IⁿM`, and the Rees module is graded over the
  grading `reesAlgebra.grade I` of the Rees algebra (Tau Ceti).

*Proof sketch.* Closure under the Rees-algebra action is the convolution formula
`PolynomialModule.smul_apply` together with `Iⁱ·(IʲM) ⊆ I^{i+j}M`; the map is
`PolynomialModule.map` with `PolynomialModule.map_smul` (for `R' = R`) giving `reesAlgebra I`-linearity.
(Česnavičius, §3.13, the graded module `⊕ IⁿM`, p. 13.) *Needs:* Mathlib `PolynomialModule`,
`PolynomialModule.smul_apply`, `PolynomialModule.coeff_inj`, `PolynomialModule.map`,
`PolynomialModule.map_smul`, `reesAlgebra`, `Submodule.smul_mem_smul`, `Submodule.mul_smul`; Tau Ceti
`reesAlgebra.grade`.

**Checks.**

- Every degree-zero monomial `m t⁰` lies in the Rees module, even for `I = 0`.
- For `R = M = ℤ` and `I = 0`, the monomial `1·t` does not lie in it.
- For `I = R` the Rees module is the whole polynomial module.
- For `R = ℤ`, `I = (2)` and `M = ℤ/2`, the monomial `1·t` does not lie in it (`2·(ℤ/2) = 0`), whereas
  `M ⊗ R[It]` has the nonzero degree-one part `ℤ/2 ⊗ 2ℤ ≅ ℤ/2`.

### K3.2 Chart modules

The modules in this subsection live over the chart rings `R[I/a]` fixed in the supplier contracts.

**Chart modules.** For an ideal `I`, `a ∈ R` and an `R`-module `M`, the chart module `M_(a)` is the
`R[I/a]`-submodule of the localization `M[1/a]` spanned by the image of `M`. `Suggested.lean` declares
`chartModule`, `chartModule_isSMulRegular` and `mem_annihilator_chartModule_iff`.

*Hypotheses.* `R` any commutative ring and `M` any module for the definition and the first four API
items; `R` Noetherian and `M` finite where finiteness is concluded.

The API:

- `chartModule_isSMulRegular`: `a` is regular on `M_(a)` (it is invertible on `M[1/a]`), so the module
  blowing-up has no nonzero sections supported on the exceptional divisor.
- `mem_annihilator_chartModule_iff`: an element of `R[I/a]` kills `M_(a)` iff it kills the image of `M`
  in `M[1/a]`.
- `chartModule.tensor_surjective`: the multiplication map `R[I/a] ⊗_R M → M_(a)`, `c ⊗ m ↦ c·m/1`, is
  surjective, and its kernel is the `a`-power torsion of `R[I/a] ⊗_R M`; it is an isomorphism after
  inverting `a`.
- `chartModule.map`: an `R`-linear `f : M → N` induces the `R[I/a]`-linear map `M_(a) → N_(a)` obtained by
  restricting the localization of `f`; `chartModule.map_mk`: it sends the image of `m` to the image of
  `f m`, which determines it because these images span; `chartModule.map_id`, `chartModule.map_comp`.
- `chartModule_principal`: for `I = (r)` and `a = r`, `R[(r)/r]` is the image `R/R⟨r^∞⟩` of `R` in
  `R[1/r]` and `M_(r) ≅ M/M⟨r^∞⟩` as `R`-modules; `r` is regular on it even when it is a zero divisor on
  `M`.
- `chartModule_self`: for `M = R`, `M_(a) = R[I/a]` (under `R[1/a] = R[1/a]`).
- `chartModule_of_subsingleton`: for `M = 0`, `M_(a) = 0`.
- `chartModule_top_one`: for `I = R` and `a = 1`, `R[R/1] = R` and `M_(1) = M`.
- `chartModule.finite`: for `R` Noetherian and `M` finite, `M_(a)` is a finite `R[I/a]`-module.
- `chartModule_equiv_homogeneousLocalization`: for `a ∈ I`, the degree-zero homogeneous localization of
  `reesModule I M` at `a t` is isomorphic to `M_(a)`, the class of `x tⁿ/(a t)ⁿ` (`x ∈ IⁿM`) going to
  `x/aⁿ`; this is the module form of Tau Ceti's `reesAlgebra.awayEquivAffineBlowup`.

*Proof sketch.* `a` is a unit on `M[1/a]` and `M_(a) ⊆ M[1/a]`. The image of `R[I/a] ⊗ M` is the span of
the image of `M`, and an element of the tensor product dies in `M[1/a]` iff it is killed by a power of
`a`, because `R[I/a][1/a] = R[1/a]`. For a principal ideal the chart ring is generated by `r/r = 1`, so it
is the image of `R`, and the span of the image of `M` is that image, `M/M⟨r^∞⟩`. The homogeneous
localization comparison evaluates `t` at `1/a`, as in Tau Ceti's ring statement, and its inverse sends
`x/aⁿ` (`x ∈ IⁿM`) to `x tⁿ/(a t)ⁿ`; well-definedness and injectivity use that `aᵏ y = 0` in
`M` implies `(a t)ᵏ y = 0` in the Rees module up to the degree shift. (Česnavičius, §3.13, p. 14.)
*Needs:* K3.1; Mathlib `LocalizedModule`, `LocalizedModule.mkLinearMap`,
`LocalizedModule.moduleOfIsLocalization`; Tau Ceti `Ideal.affineBlowup`,
`Ideal.map_algebraMap_affineBlowup`, `reesAlgebra.awayEquivAffineBlowup`.

**Checks.**

- For `R = ℤ`, `I = (2)`, `a = 2` and `M = ℤ/2`: `M[1/2] = 0`, so `M_(2) = 0`, whereas
  `ℤ[(2)/2] ⊗ ℤ/2 = ℤ/2 ≠ 0`: the chart module is the image, not the tensor product.
- For `I = R` and `a = 1`, `M_(1) = M[1/1] = M` (in `Suggested.lean`, the chart module is everything).
- For `R = M = k⟦x, y⟧/(xy)`, `I = (x)`, `a = x`: `M⟨x^∞⟩ = (y)`, so `M_(x) ≅ k⟦x⟧`, not `M`.
- For `M = R`, `M_(a) = R[I/a]`.

### K3.3 The module blowing-up

**Blowing up a module.** For an ideal `I` of a commutative ring `R` and an `R`-module `M`, the
blowing-up `Bl_I(M)` is the quasi-coherent module on `Bl_I(Spec R) = Proj (reesAlgebra.grade I)`
associated with the graded module `reesModule I M` over the graded ring `reesAlgebra I`: its sections
over a standard open `D₊(f)` are the degree-zero part of the localization of the Rees module at `f`.
On the chart `D₊(a t) ≅ Spec R[I/a]` (Tau Ceti `affineBlowupι`), `a ∈ I`, it is `tilde M_(a)`. For `R`
Noetherian and `M` finite it is coherent. The intended signature is
`moduleBlowup (I : Ideal R) (M : Type u) [AddCommGroup M] [Module R M] : (Proj (reesAlgebra.grade I)).Modules`.

*Hypotheses.* `R` commutative, `I` an ideal, `M` an `R`-module; coherence for `R` Noetherian and `M`
finite. No local hypothesis.

The API:

- `moduleBlowup.chartIso`: for `a ∈ I`, the pullback of `Bl_I(M)` along `affineBlowupι` is isomorphic to
  `tilde M_(a)` (by `chartModule_equiv_homogeneousLocalization`).
- `moduleBlowup.offCentre`: over `Spec R ∖ V(I)`, where the blow-down is an isomorphism, `Bl_I(M)` is
  the restriction of `tilde M` (on `D(a) ⊆ D₊(a t)`, `M_(a)[1/a] = M[1/a]`).
- `moduleBlowup.map`: an `R`-linear `f : M → N` induces `Bl_I(M) → Bl_I(N)` from `reesModule.map`;
  `moduleBlowup.map_chart`: under the chart isomorphisms its pullback to the chart of `a` is
  `tilde.map` of `chartModule.map f`, which pins the map down on a cover; `moduleBlowup.map_id`,
  `moduleBlowup.map_comp`.
- `moduleBlowup_of_subsingleton`: `Bl_I(0) = 0`.
- `moduleBlowup_self`: `Bl_I(R)` is the structure sheaf of the blow-up.
- `moduleBlowup.isCohenMacaulay_iff`: for `R` Noetherian and `M` finite, `Bl_I(M)` is Cohen–Macaulay
  (SchemeAndStackFoundations `Scheme.Modules.IsCohenMacaulay`) iff `IsCMBlowupChartwise I M`, i.e. iff
  for every `a ∈ I` and every prime `𝔭` of `R[I/a]` the module `(M_(a))_𝔭` over `R[I/a]_𝔭` is
  Cohen–Macaulay. The charts of all `a ∈ I` cover the blow-up (`iSup_opensRange_affineBlowupι`), the
  stalk at a point of a chart is the localization of the chart module, and the condition is
  checked on stalks.

**Chartwise Cohen–Macaulayness.** The predicate `IsCMBlowupChartwise I M` means that at every prime
of every chart of `a ∈ I`, the localized chart module has vanishing local cohomology below its
support dimension. It is a light predicate over the existing chart rings and localized modules;
its geometric comparison requires `R` Noetherian and `M` finite as above. Its API consists of
`isCMBlowupChartwise_of_subsingleton` (zero modules), `isCMBlowupChartwise_zeroIdeal` (the empty
blow-up), `isCMBlowupChartwise_unitIdeal_iff` (for finite modules over Noetherian rings, equivalence
with Cohen–Macaulayness of `M_𝔭` at every prime of `R`), and the sheaf comparison
`moduleBlowup.isCohenMacaulay_iff`. (Česnavičius, §3.13 and §1.14, pp. 13–14 and 4; the chart cover
and stalk comparison above.)

**Checks for the predicate.**

- A zero module satisfies the predicate for every ideal, since all localized chart modules are
  zero. This rejects a definition that requires nonzero stalks everywhere.
- The zero ideal satisfies it for every module, including a non-Cohen–Macaulay one: its only
  potential chart is `a = 0`, whose ring is zero and has no prime, and the blow-up is empty.
  This rejects a definition that tests `M` on the base instead.
- For the unit ideal it holds for `M = R = k⟦x⟧`, and fails for
  `M = R = k⟦x, y⟧/(x², xy)` at its maximal ideal. The unit chart is the base, so the predicate
  cannot merely test regularity of the exceptional chart element.
- The Cohen–Macaulay ring of K4.6 fails the predicate for its maximal ideal: arbitrary centres
  do not preserve Cohen–Macaulayness.

*Proof sketch.* The construction is the sheaf of a graded module on `Proj` (Stacks, Constructions,
Section 27.8, tag 01M3, Lemmas 27.8.4 and 27.8.7) applied to the Rees module; the chart description is
`chartModule_equiv_homogeneousLocalization`, compatibly with Tau Ceti's ring isomorphism
`awayEquivAffineBlowup`. Functoriality, the zero and unit cases follow chart by chart, since a sheaf
morphism is determined by its pullbacks to an open cover. (Česnavičius, §3.13, pp. 13–14.) *Needs:*
K3.1, K3.2; Mathlib `AlgebraicGeometry.Proj`, `AlgebraicGeometry.Scheme.Modules`,
`Scheme.Modules.pullback`, `AlgebraicGeometry.tilde`, `tilde.map`; Tau Ceti `reesAlgebra.grade`,
`affineBlowupι`, `iSup_opensRange_affineBlowupι`; SchemeAndStackFoundations §0.18
(`Scheme.Modules.IsCohenMacaulay`); TauCetiRoadmap StableReduction Layer 4.

**Checks.**

- For `I = R`, `Bl_R(Spec R) = Proj R[t] = Spec R` and `Bl_R(M) = tilde M`.
- For a principal ideal `(r)`, `Bl_{(r)}(M)` is the sheaf of `M/M⟨r^∞⟩` on `Bl_{(r)}(Spec R) = Spec R/R⟨r^∞⟩`;
  it is not `M` when `r` is a zero divisor on `M`.
- For `R = ℤ`, `I = (2)` and `M = ℤ/2`: `Bl_{(2)}(Spec ℤ) = Spec ℤ` and `Bl_{(2)}(ℤ/2) = 0`, while the
  pullback of `tilde(ℤ/2)` is not zero.

### K3.4 The strict transform

**The strict transform of a module along a blowing-up.** For a scheme `X`, a quasi-coherent ideal `𝓘`
with blowing-up `b : X' → X` and exceptional divisor `E = V(𝓘𝒪_{X'})`, and a quasi-coherent
`𝒪_X`-module `𝓕`, the strict transform `𝓕'` is the quotient of `b*𝓕` by its subsheaf of sections
supported on `E`. The intended signature is
`blowupStrictTransform (I : Ideal R) (F : (Spec R).Modules) : (Proj (reesAlgebra.grade I)).Modules` over an
affine base, with the scheme-level version over a general `X`. This extends the
`strictTransformModule` of SchemeAndStackFoundations §4.11 to arbitrary blow-ups, without requiring
an integral base or a dense off-centre open. In the modification case with the witness
`U = X ∖ V(𝓘)`, prove `blowupStrictTransform.eq_strictTransformModule`: both constructions are the
quotient of the same pullback by exceptional-ideal-power torsion.

The API:

- `blowupStrictTransform.chartIso`: on the chart of `a ∈ I` it is `tilde` of `(R[I/a] ⊗_R F(Spec R))`
  modulo its `a`-power torsion, when `F = tilde N`.
- `blowupStrictTransform.surjective`: the quotient map `b*𝓕 → 𝓕'` is surjective, and an isomorphism over
  `X' ∖ E`.
- `blowupStrictTransform.map`: functoriality in `𝓕`.
- `blowupStrictTransform.eq_strictTransformModule`: agreement with SchemeAndStackFoundations
  §4.11 for a blow-up that is a modification, with the dense witness `X ∖ V(𝓘)`.

*Proof sketch.* Define the subsheaf of sections supported on `E` chartwise as the `a`-power torsion, which
is compatible with restriction to smaller charts, and take the quotient. (Stacks, Definition 31.34.1,
tag 080D, and Lemma 31.34.2, tag 080E.) *Needs:* TauCetiRoadmap StableReduction Layer 4 (blowing-up,
exceptional divisor); Mathlib `Scheme.Modules.pullback`; Tau Ceti `affineBlowupι`.

**Checks.**

- For `R = ℤ`, `I = (2)`, `𝓕 = tilde(ℤ/2)`: the pullback is `tilde(ℤ/2)` on `Bl_{(2)}(Spec ℤ) = Spec ℤ`, entirely
  supported on `E = V(2)`, so the strict transform is `0`.
- For `I = R` the exceptional divisor is empty and the strict transform is the pullback.
- For `I = (a)` with `a` regular on `R` and on `N`, the strict transform of `tilde N` is `tilde N` (no
  `a`-power torsion).

**Comparison with the strict transform.** For `R` Noetherian, `I` an ideal and `M` finite, the
surjection from the pullback `b*(tilde M)` along the blow-down `b : Bl_I(Spec R) → Spec R` onto
`Bl_I(M)`, which on the chart of `a` is `R[I/a] ⊗ M → M_(a)`, has kernel the sections supported on the
exceptional divisor; hence `Bl_I(M)` is the strict transform of `tilde M` along `b`.

*Proof sketch.* Chartwise, by `chartModule.tensor_surjective`: the kernel is the `a`-power torsion and
the exceptional divisor is `V(a)` on the chart; the chart identifications glue because both sides are
quotients of the same pullback. (Česnavičius, §3.13, p. 14; Stacks, Definition 31.34.1, tag 080D, and
Lemma 31.34.2, tag 080E.) *Needs:* K3.2, K3.3, the previous target; TauCetiRoadmap StableReduction
Layer 4.

**Checks.**

- For `R = ℤ`, `I = (2)`, `M = ℤ/2` both sides are zero, while the pullback is not.
- Off the centre (`I = R`) the exceptional divisor is empty and the strict transform is the pullback.

### K3.5 Blowing up a product of ideals

**Product of ideals, schemes.** Let `I, J` be ideals of `R`, `b : Bl_I(Spec R) → Spec R` the
blowing-up and `b' : Bl_{J𝒪}(Bl_I(Spec R)) → Bl_I(Spec R)` the blowing-up of the pulled-back ideal
`J𝒪`. Then `b ∘ b'` is canonically isomorphic, over `Spec R`, to the blowing-up of `IJ`. On charts: for
`a ∈ I` and `c ∈ J`, the chart ring of `IJ` at `ac` is the chart ring of `J R[I/a]` at `c`.

*Proof sketch.* Both are final among morphisms to `Spec R` pulling `I` and `J` (equivalently `IJ`) back to
invertible ideals; on charts, a fraction `i j/(a c)` is `(i/a)(j/c)`, and conversely `i/a = (i c)/(a c)`
and `j/c = (a j)/(a c)`. (Stacks, Lemma 31.33.12, tag 080A; Lemma 31.33.2, tag 0804, for the chart
covering.) *Needs:* TauCetiRoadmap StableReduction Layer 4 (universal property); Tau Ceti
`Ideal.affineBlowup`, `affineBlowupι`.

**Product of ideals, modules.** Over the isomorphism above, `Bl_{IJ}(M) ≅ Bl_{J𝒪}(Bl_I(M))` and,
symmetrically, `Bl_{IJ}(M) ≅ Bl_{I𝒪}(Bl_J(M))`; on charts, `M_(ac)` for `IJ` is the chart module at `c`
of `M_(a)` for the ideal `J R[I/a]`. The second centre is the pulled-back ideal, not an unrelated
ideal of the blow-up.

*Proof sketch.* Both sides are spans of the image of `M` in `M[1/(ac)]` over the same chart ring; glue
over the scheme isomorphism. Equivalently, both are strict transforms of `M` (K3.4) along the same
morphism. (Česnavičius, §3.13, (3.13.1)–(3.13.2), p. 14.) *Needs:* the previous target; K3.2–K3.4.

**Checks.**

- `I = R`: the identity is `Bl_J(M) = Bl_J(M)`.
- For `I = (a)` with `a` regular on `R` and on `M`, `Bl_{(a)J}(M) = Bl_J(M)`: blowing up an invertible
  ideal does nothing. If `r₁` is only `M`-regular, `Bl_{I₁}(M)` is the sheaf of `M` on
  `Spec R/R⟨r₁^∞⟩`; its pushforward to `Spec R` is `tilde M`. Identifying the blow-up scheme itself
  with `Spec R` requires `r₁` to be regular on `R` as well.
- For `R = k⟦x, y⟧/(xy)`, `M = R/(y)` and `r₁ = x`, `x` is regular on `M` but not on `R`.
  The first blow-up scheme is `Spec R/(y)`, and its module is `M ≅ k⟦x⟧`. This distinguishes
  module regularity from ring regularity in the principal-stage identification.

### K3.6 Support and dimension

**The support of the module blowing-up.** For `R` Noetherian, `M` finite and `A = R/Ann_R M`, the
support of `Bl_I(M)` is the closed image of `Bl_{IA}(Spec A)` in `Bl_I(Spec R)`; on the chart of `a` it is
`V(ker(R[I/a] → A[1/ā]))`. This is an equality of closed subsets; no scheme structure on the support
is asserted. `Suggested.lean` declares the annihilator form `mem_annihilator_chartModule_iff`.

*Proof sketch.* The image of `R[I/a]` in `A[1/ā]` is the chart ring of `IA`, and the induced
surjection defines the closed immersion of the chart of `Bl_{IA}(Spec A)`. Since `M_(a)` is finite over
`R[I/a]`, its support is the zero set of its annihilator; a scalar kills `M_(a)` iff it kills the image of
`M` in `M[1/a]`, iff (by finiteness of `M`) it maps to zero in `A[1/ā]`. Glue along the charts.
(Česnavičius, proof of Theorem 3.14, p. 14, with Stacks, Lemma 31.34.2, tag 080E.) *Needs:* K3.2,
K3.3; Mathlib `Module.support`, `PrimeSpectrum.zeroLocus`,
`Module.supportDim_eq_ringKrullDim_quotient_annihilator`; TauCetiRoadmap StableReduction Layer 4.

**The dimension of a Rees algebra.** For a Noetherian ring `A` and an ideal `J`,
`dim A[Jt] ≤ dim A + 1` (extended Krull dimension; automatic when `dim A = ∞`). No equality is
claimed; for `J = 0` the Rees algebra is `A`. `Suggested.lean` declares `ringKrullDim_reesAlgebra_le`.

*Proof sketch.* `A[Jt]` is of finite type over `A` (`reesAlgebra.fg`). For a domain `A`, `A[Jt] ⊆ A[t]` is a
domain of transcendence degree at most one over `A`, and the dimension formula bounds the height of
every prime `𝔮` of `A[Jt]` by `ht(𝔮 ∩ A) + 1 ≤ dim A + 1`, with no universal catenarity needed for the
inequality. In general, the kernels of `A[Jt] → (A/𝔭)[J(A/𝔭)t]` over the finitely many minimal primes
`𝔭` are primes whose intersection is the nilradical (nilpotence is coefficientwise in `A[t]`), so every
chain of primes of `A[Jt]` lies over one domain quotient. (Stacks, Lemma 10.113.1, tag 02IJ.)
*Needs:* Mathlib `reesAlgebra`, `reesAlgebra.fg`, `ringKrullDim`.

**Checks.**

- `J = A`: `A[At] = A[t]` has dimension `dim A + 1` for Noetherian `A`
  (`Polynomial.ringKrullDim_of_isNoetherianRing`), so the bound is attained.
- `J = 0`: `A[0t] = A`, strictly below the bound when `dim A` is finite.

**`Proj` loses one dimension.** For `S = A[Jt]` with `Proj S ≠ ∅`, `dim Proj S + 1 ≤ dim S`; for empty
`Proj` the dimension is `⊥`.

*Proof sketch.* A chain of points of `Proj S` is a chain of relevant homogeneous primes
`𝔓₀ ⊊ ⋯ ⊊ 𝔓_l`. The homogeneous prime `(𝔓_l ∩ A) ⊕ S₊` contains `𝔓_l` and strictly so, since `𝔓_l` does not
contain `S₊`; appending it gives a chain of length `l + 1` in `Spec S`. (Česnavičius, proof of Theorem
3.14, p. 14, where the source quotes Herrmann–Ikeda–Orbanz 12.14 for the combined bound; the argument
here replaces that citation.) *Needs:* Mathlib `AlgebraicGeometry.Proj`, `topologicalKrullDim`;
TauCetiRoadmap StableReduction Layer 4.

**Checks.**

- For `J = A`, `Proj A[t] = Spec A` and the chain of `Spec A` extends by the irrelevant prime of `A[t]`,
  matching `dim A[t] = dim A + 1`.
- For `J = 0`, `Proj A = ∅` and the statement is about `⊥`.

**The dimension of the support of `Bl_I(M)`.** For `R` Noetherian and `M` finite,
`dim Supp Bl_I(M) ≤ dim Supp M`; for `M = 0` both sides are `⊥`. `Suggested.lean` declares the chart form
`supportDim_chartModule_le`.

*Proof sketch.* The support is the blow-up of `Spec A`, `A = R/Ann M`, along `IA`; combine
`dim A[IAt] ≤ dim A + 1` with the `Proj` bound, and `dim A = dim Supp M` for finite `M`
(`Module.supportDim_eq_ringKrullDim_quotient_annihilator`). A chart is open in the blow-up.
(Česnavičius, proof of Theorem 3.14, p. 14.) *Needs:* the three targets above.

**Checks.**

- For `I = R`, `Bl_R(M) = tilde M` and the inequality is an equality.
- For `M = 0`, both sides are `⊥`.

### Examples

- For `R = ℤ`, `I = (2)`, `M = ℤ/2`: the Rees module is `ℤ/2` in degree `0` only, every chart module
  vanishes, and `Bl_{(2)}(ℤ/2) = 0`, the strict transform of a module supported on the centre.
- For `R = k⟦x, y⟧` and `I = (x, y)`, `R[I/x] = R[y/x]` and the chart module of `M = R/(y)` at `x` is the
  image of `k⟦x⟧` in `R/(y)[1/x]`, spanned over `R[y/x]`, on which `y/x` acts as `0`: the strict transform
  of the line `y = 0` meets the exceptional divisor in one point.

### Dependencies

Layer K2 (for the prefix products); Mathlib; Tau Ceti (Rees grading, affine blow-up
algebras and charts); TauCetiRoadmap StableReduction (Layer 4); SchemeAndStackFoundations
§§0.17–0.18.

## Layer K4: Cohen–Macaulay blowing-ups

Throughout this layer `(R, 𝔪)` is a Noetherian local ring, `M` a finite `R`-module and
`rs = (r₁, …, rₜ)` a list of elements of `𝔪`, with prefix products `I_s` (K2.1). The proof first
weakens the hypothesis: instead of CM-secancy it uses that `rs` is secant for `M`, that every initial
segment satisfies Kawasaki's conditions (K2.2), and that the terminal quotient is Cohen–Macaulay.
A regular-element reduction brings the terminal quotient to dimension zero; then an induction on
the length of the list, at closed points and through two-generator charts, gives the depth bound.

### K4.1 The regular-element reduction

**Reduction by a regular element of the terminal quotient.** Let `M ≠ 0` and let `rs` be secant for
`M`, with every initial segment satisfying Kawasaki's conditions on `M`, and let `r' ∈ 𝔪` be regular on the terminal
quotient `M/(r₁, …, rₜ)M`. Then:

- `r'` is secant for every prefix quotient `M/(r₁, …, r_j)M`, `j ≤ t`, and `rs` is secant for `M/r'M`;
- every initial segment of `rs` satisfies Kawasaki's conditions on `M/r'M`;
- `r'` is regular on `M` and on `M/I_tⁿM` for every `n > 0`, hence on `reesModule I_t M`, and
  `reesModule I_t M / r'·reesModule I_t M ≅ reesModule I_t (M/r'M)`, degree by degree;
- on the same scheme `Bl_{I_t}(Spec R)`, `Bl_{I_t}(M)/r'Bl_{I_t}(M) ≅ Bl_{I_t}(M/r'M)`, and `r'` is regular on
  `Bl_{I_t}(M)`.

The scheme is not replaced by `Bl_{I_t}(Spec R/(r'))`. If the terminal quotient is Cohen–Macaulay of
positive dimension, a parameter `r' ∈ 𝔪` of it is regular on it (DeformationAndDerivedPatchingAlgebra
R03.3), and `M/(r₁, …, rₜ, r')M` is Cohen–Macaulay of dimension one less. Regularity on `M/I_sⁿM` is
asserted only for the full product `I_t`, which is all the reduction uses: Kawasaki's condition (iii)
for a shorter prefix would need `r'` to be regular on `M/(r₁, …, r_s)M`.

*Proof sketch.* `rs` followed by `r'` is secant for `M` (a regular element drops the dimension of the
nonzero terminal quotient by one), so by permutation (K0.3) `r'` is secant for each prefix quotient
and `rs` for `M/r'M`. Robustness (K2.4) with the one-element auxiliary list `[r']` transfers the
conditions of every initial segment. Condition (iii) for the full list, with auxiliary list `[r']`,
gives regularity of `r'` on `M` and on `M/I_tⁿM`; the snake lemma for multiplication by `r'` on
`0 → I_tⁿM → M → M/I_tⁿM → 0` identifies `I_tⁿM/r'I_tⁿM` with `I_tⁿ(M/r'M)`, including degree zero.
Sheafify. Since `r' ∈ 𝔪` vanishes at every closed point of the blow-up, the depth at a closed point
drops by exactly one. (Česnavičius, proof of Theorem 3.14, pp. 14–15.) *Needs:* K0.3, K2.2–K2.4, K3.1,
K3.3; DeformationAndDerivedPatchingAlgebra R03.3; SchemeAndStackFoundations §0.17.

**Checks.**

- Nonvanishing is necessary for this reduction: take `M = 0`, `rs = []` and `r' = 0`.
  The empty list is secant and satisfies Kawasaki's conditions, and multiplication by `0` on
  the terminal quotient `0` is injective. Nevertheless `[0]` is not secant for `0`, because
  `⊥ < ⊥` fails. The final theorem handles `M = 0` separately by `Bl_I(0) = 0`.
- For `M = R = k⟦x, y⟧`, `rs = [x]`, `r' = y`: `Bl_{(x)}(M) = M` and its quotient by `y` is
  `k⟦x⟧ = Bl_{(x)}(M/yM)`.
- In degree zero the comparison is `M/r'M`, in degree `n` it is `I_tⁿM/r'I_tⁿM ≅ I_tⁿ(M/r'M)`; without
  regularity on `M/I_tⁿM` the map has a kernel: for `M = k⟦x⟧`, `I = (x)` and `r' = x`, which is not
  regular on `M/IM = k`, `xM/x·xM = k` but `x·(M/xM) = 0`.

### K4.2 The principal and two-generator charts

**The first two stages.** For `s = 0`, `I₀ = R` and `Bl_{I₀}(M) = tilde M` on `Spec R`. For `s = 1`,
`I₁ = (r₁)`, `Bl_{(r₁)}(Spec R) = Spec R/R⟨r₁^∞⟩` and `Bl_{(r₁)}(M)` is the sheaf of `M/M⟨r₁^∞⟩`, on which
`r₁` is regular, even when `r₁` is a zero divisor on `M`. These are the base cases of the depth
induction. (Česnavičius, proof of Theorem 3.14, p. 15.) *Needs:* K3.2 (`chartModule_principal`), K3.3.

**Checks.**

- For `M = R = k⟦x, y⟧/(xy)` and `r₁ = x`, the first stage is `k⟦x⟧`, of depth one.
- For `r₁` regular on `M`, the first stage is the sheaf of `M` over `Spec R/R⟨r₁^∞⟩`.
  If `r₁` is also regular on `R`, this is `tilde M` on `Spec R`.

**The two-generator chart.** Let `s ≥ 2`, let `x''` be a closed point of `Supp Bl_{I_s}(M)` lying over
`𝔪`, and `x'` its image in `Bl_{I_{s-1}}(Spec R)` (a closed point over `𝔪`; `Bl_{I_s}(Spec R)` is the
blowing-up of `Bl_{I_{s-1}}(Spec R)` along `(r₁, …, rₛ)` by K3.5 and `I_s = I_{s-1}(r₁, …, rₛ)`). Let `R'`, `M'`
be the local ring and the stalk of `Bl_{I_{s-1}}(M)` at `x'`, with maximal ideal `𝔪'`, and `R''`, `M''`
those at `x''`. Then:

- there is `1 ≤ i ≤ s − 1` such that `rᵢ` generates `(r₁, …, r_{s-1})R'` and is regular on `R'` and on
  `M'`; hence `(r₁, …, rₛ)R' = (rᵢ, rₛ)R'`;
- for `{a, b} = {i, s}`, with `x''` in the chart of `r_b`, there is a monic `f ∈ R'[T]` lifting the
  irreducible polynomial of the residue of `x''` over `R'/𝔪'` such that

```text
R''  ≅  (R'[T]/(r_b T − r_a))_{(𝔪', f)} / (r_b-power torsion),
M''  ≅  (M' ⊗_{R'} R'[T]/(r_b T − r_a))_{(𝔪', f)} / (r_b-power torsion),
```

  with the preimage of `𝔪''` in `R'[T]` generated by `𝔪'` and `f`;
- one of `r_a, r_b` (the one with index `i`) is regular on `M'`, so multiplication by `r_b T − r_a` is
  injective on `M'[T]`.

The restriction to closed points is used: a closed point of the fibre of `Spec (R'/𝔪')[T]` corresponds to
a monic irreducible polynomial.

*Proof sketch.* By K3.5 the previous blow-up is the blow-up of `Bl_{I_{s-2}}` along `(r₁, …, r_{s-1})`, on
whose charts this ideal is generated by one `rᵢ`, regular on the chart ring and on the chart module
(`chartModule_isSMulRegular`). The chart ring of `(rᵢ, rₛ)R'` at `r_b` is `R'[T]/(r_bT − r_a)` modulo
`r_b`-power torsion (evaluate `T ↦ r_a/r_b`), and the chart module is the image of `M'` in `M'[1/r_b]`
spanned over it, i.e. `M' ⊗ R'[T]/(r_bT − r_a)` modulo `r_b`-power torsion (K3.2,
`chartModule.tensor_surjective`). Localize at the closed point. (Česnavičius, proof of Theorem 3.14,
p. 15; Stacks, Section 10.70, tag 052P, Lemma 10.70.6, and Lemma 31.33.2, tag 0804.) *Needs:* K3.2,
K3.3, K3.5, K3.6; TauCetiRoadmap StableReduction Layer 4.

**Checks.**

- For `R' = k⟦x, y⟧`, `(r_a, r_b) = (x, y)` and `b` the index of `y`: the chart is
  `k⟦x, y⟧[T]/(yT − x)` (already torsion free, since `x, y` is regular), i.e. `k⟦x, y⟧[x/y]`.
- The relation is `r_bT − r_a`, with the chart denominator `r_b` as the coefficient of `T`.

### K4.3 Kawasaki's two local-cohomology claims

Keep the notation of K4.2, with `s ≥ 2`, `rs` secant for `M` and every initial segment of `rs`
satisfying Kawasaki's conditions on `M`.

**The annihilation claim.** Both `rᵢ` and `rₛ` kill `H^1_{(rᵢ, rₛ)}(M')` (over `R'`). The claim needs no
depth hypothesis.

*Proof sketch.* `Bl_{I_{s-1}}(M)` is the sheaf of `⊕_{n>0} I_{s-1}ⁿM` (dropping degree zero does not change
the sheaf). Condition (i) makes `rₛ, …, r₁` a d-sequence for `M`, so `rₛ` is regular on `⊕_{n>0} I_{s-1}ⁿM`
and on `M'`; by K0.1, `H^1_{(rᵢ, rₛ)}(M') ≅ H^0_{(rᵢ)}(H^1_{(rₛ)}(M')) ≅ colim_{m>0} H^0_{(rᵢ)}(M'/rₛᵐM')`, with
transition maps multiplication by `rₛ`. The graded exact sequence

```text
0 → ⊕_{n>0} (I_{s-1}ⁿM :_M rₛᵐ)/(I_{s-1}ⁿM + (0 :_M rₛᵐ))  →(rₛᵐ)  ⊕_{n>0} I_{s-1}ⁿM/rₛᵐI_{s-1}ⁿM  →  ⊕_{n>0} I_{s-1}ⁿ(M/rₛᵐM) → 0
```

sheafifies at `x'` to a sequence whose right term is the stalk `M'_{(m)}` of `Bl_{I_{s-1}}(M/rₛᵐM)`, on which
`rᵢ` is regular (K3.2). So the `rᵢ`-torsion of `M'/rₛᵐM'` is the stalk of the left term. Condition (ii)
(with the empty auxiliary list) says that every element of `(r₁, …, rₛ)` maps `I_{s-1}ⁿM :_M rₛᵐ` into
`I_{s-1}ⁿM`, so `rᵢ` and `rₛ` kill the left term. Pass to the colimit. (Česnavičius, Claim 3.14.5 and its
proof, (3.14.12)–(3.14.13), pp. 16–17.) *Needs:* K0.1, K1.1, K2.2–K2.3, K3.1–K3.3.

**Checks.**

- If `rₛ` is regular on `M'` and `(rᵢ, rₛ)` is a regular sequence on `M'`, then `H^1_{(rᵢ,rₛ)}(M') = 0` and the
  claim is trivial; the content is for `M'` not Cohen–Macaulay.

**The vanishing claim.** Assume in addition the two inputs of the outer induction: `depth M' ≥ s − 1`, and
`depth M'_{(m)} ≥ s − 1` for every `m > 0`, where `M'_{(m)}` is the stalk at `x'` of `Bl_{I_{s-1}}(M/rₛᵐM)`. Then

```text
H^j_{𝔪'}(H^{j'}_{(rᵢ, rₛ)}(M')) = 0      for all j < s − 2 and all j'.
```

*Proof sketch.* By the Čech description (K0.1) only `j' = 1, 2` can be nonzero: `j' = 0` vanishes
because `rᵢ` is regular and `j' > 2` because there are two generators. For `j' = 2`,
`H^2_{(rᵢ,rₛ)}(M') ≅ colim_m H^1_{(rᵢ)}(M'/rₛᵐM') ≅ colim_m H^1_{(rᵢ)}(M'_{(m)})`, since the comparison kernel is
killed by `rᵢ` (annihilation claim) and so invisible to `H^1_{(rᵢ)}`; as `rᵢ` is regular on `M'_{(m)}`,
`H^1_{(rᵢ)}(M'_{(m)}) = colim_{m'} M'_{(m)}/rᵢ^{m'}M'_{(m)}`, and these quotients have depth at least `s − 2`; local
cohomology commutes with the filtered colimits, so `H^j_{𝔪'}(H^2_{(rᵢ,rₛ)}(M')) = 0` for `j < s − 2`. For
`j' = 1` use the composite-support spectral sequence `H^j_{𝔪'}(H^{j'}_{(rᵢ,rₛ)}(M')) ⇒ H^{j+j'}_{𝔪'}(M')`: its
abutment vanishes below `s − 1` by `depth M' ≥ s − 1`, rows `0` and `≥ 3` are zero, and row `2` vanishes in
the range just shown, so no differential can hit row `1` in degrees `j < s − 2`. (Česnavičius, Claim
3.14.6 and its proof, (3.14.14)–(3.14.16), p. 17.) *Needs:* the annihilation claim; K0.1; K3.2–K3.3;
SchemeAndStackFoundations §2.7 (depth and local cohomology).

**Checks.**

- For `s = 2` the range `j < 0` is empty and the claim is vacuous: the first case with content is `s = 3`.
- The inputs are part of the statement: they are exactly what the outer induction supplies, for `M` and
  for the quotients `M/rₛᵐM`.

**The relation kills `H¹`.** Over a Noetherian ring `R'`, if `a` and `b` kill `H^1_{(a,b)}(N)`, then
`b T − a` kills `H^1_{(a,b)}(N[T])` over `R'[T]`. In the chart this is applied with `(a, b) = (r_a, r_b)`; the
map in the exact sequence `0 → M'[T] →(r_bT − r_a) M'[T] → M'[T]/(r_bT − r_a) → 0` is multiplication by
`r_bT − r_a`. `Suggested.lean` declares `chart_relation_mem_annihilator`.

*Proof sketch.* Flat base change along `R' → R'[T]` gives `H^1_{(a,b)}(N[T]) ≅ H^1_{(a,b)}(N) ⊗ R'[T]`, on which
`a` and `b` act through the first factor, hence by zero, so `bT − a` acts by zero. (Česnavičius, proof of
Theorem 3.14, (3.14.8) and (3.14.10), p. 16, with the relation `r_bT − r_a`.) *Needs:* SchemeAndStackFoundations
§2.7 (flat base change).

**Checks.**

- The printed relation `aT − b` also acts by zero (both coefficients do), but it is not the map of the
  exact sequence; the statement names `bT − a`.
- Without the hypotheses the conclusion fails: for `N = k⟦x, y⟧/(xy)` and `(a, b) = (x, y)`,
  `H^1_{(x,y)}(N)` maps onto `k((y))/k⟦y⟧` (from `N ⊆ k⟦x⟧ × k⟦y⟧` with cokernel `k`), on which `x` acts by `0`
  and `y` does not; there `yT − x` sends the class of `y⁻² ⊗ 1` to `y⁻¹ ⊗ T ≠ 0`, so `yT − x` does not kill
  `H^1_{(x,y)}(N[T])`.

### K4.4 The depth induction

**Depth at closed points.** Let `rs = (r₁, …, rₛ)` be secant for `M`, with every initial segment satisfying
Kawasaki's conditions on `M`. Then at every closed point of `Bl_{I_s}(Spec R)` lying over `𝔪` (every closed
point does, by properness), the stalk of `Bl_{I_s}(M)` has depth at least `s`: its local cohomology at the
maximal ideal vanishes in degrees `< s`. No hypothesis is made on the terminal quotient.
`Suggested.lean` declares `depth_ge_of_kawasakiConditions`, in chart form.

*Proof sketch.* Induction on `s`, simultaneously for all finite modules and all lists satisfying the
hypotheses. `s = 0` is empty and `s = 1` is the principal stage. For `s ≥ 2` take `x''`, `x'` as in K4.2.
The inductive hypothesis applies at `x'` to `M` with the list `r₁, …, r_{s-1}` and gives `depth M' ≥ s − 1`.
It also applies to `M/rₛᵐM` with the same list (`m > 0`): the list `r₁, …, r_{s-1}` is secant for `M/rₛᵐM`
and `rₛᵐ` is secant for each `M/(r₁, …, r_j)M` with `j ≤ s − 1` (permutations and powers of the secant
list `rs`, K0.3), so robustness (K2.4) transfers Kawasaki's conditions of every initial segment; this
gives `depth M'_{(m)} ≥ s − 1`. The two claims of K4.3 now hold. Put `P = M'[T]`, `g = r_bT − r_a` and
`N = P/gP`. By flat base change the vanishing claim carries over to `P`, and since `f` is monic it is
regular on the base-changed modules `H^{j}_{𝔪'}(H^{j'}_{(r_a,r_b)}(P))`; the composite-support spectral
sequence for `(𝔪') + (f)` then gives `H^j_{(𝔪',f)}(X) ≅ H^1_{(f)}(H^{j-1}_{𝔪'}(X))` for these modules `X`, which
raises the vanishing range by one: `H^j_{(𝔪',f)}(H^{j'}_{(r_a,r_b)}(P)) = 0` for `j < s − 1`. The
relation `g` kills `A₁ = H^1_{(r_a,r_b)}(P)`, and `H^2_{(r_a,r_b)}(N) = 0` because `(r_a, r_b) = (r_b)` on `N`. The
long exact sequence of `0 → P →(g) P → N → 0` then gives `0 → A₁ → H^1_{(r_a,r_b)}(N) → K → 0` and
`0 → K → A₂ →(g) A₂ → 0` with `A₂ = H^2_{(r_a,r_b)}(P)`; applying `H^j_{(𝔪',f)}` shows that `K`, and then
`H^1_{(r_a,r_b)}(N)`, have vanishing `H^j_{(𝔪',f)}` for `j < s − 1`. Dividing `N` by its `r_b`-power torsion does not
change `H^1_{(r_b)}`, and the result has no `H^0_{(r_b)}`; the composite-support spectral sequence and the change
of rings (K0.1) give `H^j_{𝔪''}(M'') ≅ H^{j-1}_{(𝔪',f)}(H^1_{(r_b)}(M''))`, which vanishes for `j < s`. (Česnavičius,
proof of Theorem 3.14, (3.14.1)–(3.14.11), pp. 15–16.) *Needs:* K4.2, K4.3; K0.1, K0.3; K2.4;
SchemeAndStackFoundations §2.7.

**Checks.**

- For `s = 1` the bound is the regularity of `r₁` on `M/M⟨r₁^∞⟩` at closed points over `𝔪`.
- The bound is asserted at closed points over `𝔪` only; for `M = R = k⟦x, y⟧` and `rs = [x, y]`
  (`I₂ = (x)(x, y)`), the blow-up is the blow-up of the closed point, every closed point lies on the
  exceptional line over `𝔪`, and the local rings there have depth `2`.

### K4.5 The Cohen–Macaulay theorems

**Kawasaki's theorem under weaker hypotheses.** Let `rs = (r₁, …, rₜ)` be secant for `M`, with every initial
segment satisfying Kawasaki's conditions on `M` and with Cohen–Macaulay terminal quotient
`M/(r₁, …, rₜ)M`. Then `Bl_{I_t}(M)` is a Cohen–Macaulay module on `Bl_{I_t}(Spec R)`. `Suggested.lean` declares
`isCMBlowupChartwise_of_kawasakiConditions`, with the conclusion in chart form (K3.3).

*Proof sketch.* Induct on `dim Supp M/(rs)M`. If it is positive, choose `r'` by K4.1 and pass to `M/r'M`:
the hypotheses persist, `Bl_{I_t}(M)/r'Bl_{I_t}(M) ≅ Bl_{I_t}(M/r'M)`, and depth and support dimension at a
closed point of the support both drop by one. If it is zero (or `M = 0`), `dim Supp M ≤ t` (equality for
`M ≠ 0`, by secancy), the depth induction gives depth at least `t` at every closed point of the support,
and `dim Supp Bl_{I_t}(M) ≤ dim Supp M ≤ t` (K3.6); so the stalks at closed points are Cohen–Macaulay. Every
point of the blow-up specializes to a closed point (it is proper over the local ring `R`), and
Cohen–Macaulayness localizes (SchemeAndStackFoundations §0.17, the localization API of
`Module.IsCohenMacaulay`).
(Česnavičius, proof of Theorem 3.14, pp. 14–17.) *Needs:* K4.1, K4.4, K3.6, K3.3;
SchemeAndStackFoundations §0.17.

**Checks.**

- The empty list: `I₀ = R`, and the statement says that `tilde M` is Cohen–Macaulay when `M` is.
- The zero module gives the zero sheaf, which is Cohen–Macaulay.
- The secancy hypothesis is used only to transfer the hypotheses to the quotients `M/r'M` and
  `M/rₛᵐM`; it holds for every CM-secant sequence.

**Kawasaki's theorem.** Let `r₁, …, rₜ ∈ 𝔪` be CM-secant for a finite module `M` over a Noetherian local
ring `(R, 𝔪)`, and `I = ∏_{i=1}^{t} (r₁, …, rᵢ)`. Then `Bl_I(M)` is a Cohen–Macaulay module on `Bl_I(Spec R)`.
For the empty list this says that a Cohen–Macaulay `M` gives a Cohen–Macaulay `tilde M`; for `M = 0` it is
the zero sheaf. `Suggested.lean` declares `isCMBlowupChartwise_prefixProduct_of_isCMSecant`.

*Proof sketch.* A CM-secant list is secant, its terminal quotient is Cohen–Macaulay, and Kawasaki's
proposition (K2.3) gives the conditions on every initial segment; apply the previous theorem.
(Česnavičius, Theorem 3.14, p. 14.) *Needs:* K0.4, K2.3, the previous target.

**Checks.**

- For `R = M = k⟦t⟧` and the CM-secant list `[t]`: `I = (t)` is invertible, `Bl_I(M) = M`, which is
  Cohen–Macaulay.
- For `R = M = k⟦x, y⟧/(x², xy)` (not Cohen–Macaulay) and the CM-secant list `[y]`: `I = (y)`, and
  `Bl_{(y)}(M)` is the sheaf of `M/M⟨y^∞⟩ = M/(x) = k⟦y⟧` on `Spec R/R⟨y^∞⟩ = Spec k⟦y⟧`, which is
  Cohen–Macaulay although `M` is not.

### K4.6 A Cohen–Macaulay ring with a non-Cohen–Macaulay blowing-up

**Blowing up the maximal ideal can destroy Cohen–Macaulayness.** For any field `k`, let
`A₀ = k[x³, x⁵y³, x¹⁵y², y⁷] ⊆ k[x, y]` and `A` its localization at the maximal ideal `𝔪` generated by the
four monomials. Then `A` is a two-dimensional Noetherian Cohen–Macaulay local domain, but
`Bl_𝔪(Spec A)` has a local ring that is not Cohen–Macaulay: on the chart of `x³`, writing `Y = y/x`, the
chart ring is `B = k[x³, x⁵Y³, x¹⁴Y², x⁴Y⁷]` (localized), and its local ring at the maximal ideal `𝔫` generated
by these four monomials has dimension two and depth one. `Suggested.lean` declares
`exists_isCohenMacaulay_not_isCMBlowupChartwise_maximalIdeal` (an existence statement).

*Proof sketch.* Put `u = x³, v = x⁵y³, w = x¹⁵y², z = y⁷`. Then `v³ = wz` and `w⁷ = u³⁵z²`, and `A₀` is free over
`k[u, z]` with basis `vⁱwʲ`, `0 ≤ i < 3`, `0 ≤ j < 7`: the two monic relations give spanning, and distinct
basis monomials are independent because the exponent of `x` modulo `3` determines `i` and then the
exponent of `y` modulo `7` determines `j`. So `u, z` is a regular system of parameters of `A`, which is
Cohen–Macaulay of dimension two. On the chart of `u`, adjoin `v/u, w/u, z/u`; with `Y = y/x` these are
`b = x⁵Y³`, `c = x¹⁴Y²`, `d = x⁴Y⁷`, and with `a = x³` this is `B`. The four original generators become
`a, ab, ac, ad`, so `𝔫` lies over `𝔪`. The relations `b²¹ = a²³d⁹` and `c²¹ = a⁹⁰d⁶` make `B` finite over
`k[a, d]`, so `a, d` are parameters of `B_𝔫`, and `a` is regular since `B` is a domain. The class of `c²` in
`B/(a)` is nonzero: `c² = x²⁸Y⁴`, and `(25, 4)` is not in the exponent semigroup (`Y`-degree `4` forces two
factors `c`, hence `x`-degree at least `28`); it stays nonzero in `B_𝔫/(a)` because the ideal `(a)` is
monomial and a unit has a nonzero constant term. But `d·c² = a·b³·c`, so `d` is a zero divisor on
`B_𝔫/(a)`, the parameter sequence `a, d` is not regular, and `B_𝔫` is not Cohen–Macaulay; its depth is one.
(Heinzer–Johnston–Lantz–Shah, Example 3.6, p. 13, with the surrounding discussion, pp. 12–13;
Česnavičius, §3, opening paragraph, p. 9, which cites Herrmann–Ikeda–Orbanz 14.11 for the phenomenon.)
*Needs:* K3.2, K3.3; SchemeAndStackFoundations §0.17; DeformationAndDerivedPatchingAlgebra R03.3.

**Checks.**

- `v³ = x¹⁵y⁹ = wz` and `w⁷ = x¹⁰⁵y¹⁴ = u³⁵z²`; the lattice generated by the four exponent vectors is `ℤ²`, of
  index `21` over the lattice of `u, z`, matching the `21` basis elements.
- `b²¹ = x¹⁰⁵Y⁶³ = a²³d⁹`, `c²¹ = x²⁹⁴Y⁴² = a⁹⁰d⁶` and `dc² = x³²Y¹¹ = ab³c`.
- In contrast, the parameters `u, z` of `A` form a CM-secant sequence (all annihilator products are `A`),
  so by Kawasaki's theorem `Bl_{(u)(u,z)}(A) = Bl_{(u,z)}(A)` is Cohen–Macaulay: the centre matters, not
  only the base.

### Examples

- Blowing up the maximal ideal of `k⟦x, y⟧`: the regular sequence `x, y` is CM-secant, `I₂ = (x)(x, y)`, and
  since `(x)` is invertible `Bl_{I₂} = Bl_{(x,y)}`, whose local rings are regular, hence Cohen–Macaulay.
- `R = M = k⟦x, y⟧/(x², xy)` with `[y]`: the blowing-up along `(y)` is `k⟦y⟧`, the line with its embedded
  point at the origin removed, and it is Cohen–Macaulay as Kawasaki's theorem predicts.

### Dependencies

Layers K0–K3; SchemeAndStackFoundations §§0.17–0.18 and §2.7;
DeformationAndDerivedPatchingAlgebra R03.3;
TauCetiRoadmap StableReduction (Layer 4); Tau Ceti (affine blow-up charts).

## Worked examples

- **A non-Cohen–Macaulay ring made Cohen–Macaulay.** `R = M = k⟦x, y⟧/(x², xy)` is a line with an embedded
  point. `H^0_𝔪(R) = k·x̄`, so `a(R) = 𝔪`; the list `[y]` is CM-secant (K0.4) but not regular, it satisfies
  Kawasaki's conditions (K2.2), `I = (y)`, and `Bl_{(y)}(R) = Spec k⟦y⟧` with `Bl_{(y)}(M) = k⟦y⟧`
  Cohen–Macaulay (K4.5).
- **Product, not power.** For `rs = (r₁, r₂)` the centre is `(r₁)(r₁, r₂)`; for `R = ℤ`, `[2, 3]` gives `(2)`
  while `(2, 3)² = ℤ`. Over a local ring with `r₁` regular, `(r₁)` is invertible and
  `Bl_{(r₁)(r₁,r₂)} = Bl_{(r₁, r₂)}` (K3.5).
- **Image, not tensor product.** For `R = ℤ`, `I = (2)`, `M = ℤ/2`: the Rees module is `ℤ/2` in degree `0`,
  the chart module `M_(2)` is `0`, `Bl_{(2)}(ℤ/2) = 0`, and the pullback of `tilde(ℤ/2)` to
  `Bl_{(2)}(Spec ℤ) = Spec ℤ` is `tilde(ℤ/2) ≠ 0` (K3.1–K3.4).
- **The later index in the torsion characterization.** Over `k⟦t, u⟧`, `M = R/(u) ⊕ R` and the d-sequence
  `[t, u]`: the `tu`-torsion of `M` is `R/(u) ⊕ 0`, equal to the `u`-torsion and not to the `t`-torsion `0`
  (K1.1).
- **The centre matters.** For `A = k[x³, x⁵y³, x¹⁵y², y⁷]` localized at its monomial maximal ideal, `A` is
  Cohen–Macaulay, `Bl_𝔪(A)` is not (K4.6), and `Bl_{(x³, y⁷)}(A)` is, by Kawasaki's theorem applied to the
  CM-secant system of parameters `x³, y⁷`.

## Downstream consumers

- **MacaulayficationOfNoetherianSchemes** (the Macaulayfication roadmap, continuing
  SchemeAndStackFoundations) imports Kawasaki's theorem (K4.5), the module blowing-up and its strict
  transform comparison (K3.3–K3.5), CM-secant sequences and their extension to parameters (K0.4,
  K0.6), and the annihilator description of the non-Cohen–Macaulay locus (K0.7), to build the
  Macaulayfying blowing-ups of Česnavičius §§4–5.

## References

- [Česnavičius] K. Česnavičius, *Macaulayfication of Noetherian schemes*, Duke Math. J. 170 (2021);
  cited in the numbering and pagination of arXiv:1810.04493v2 (3 September 2020),
  <https://arxiv.org/abs/1810.04493v2>. Used: §1.14 (p. 4); §3, Definition 3.1 to Theorem 3.14 and its
  proof (pp. 9–17).
- [Kawasaki 1996] T. Kawasaki, *On Macaulayfication of local rings — in the case dim non-CM ≤ 2*, RIMS
  Kôkyûroku 964 (1996), 40–50,
  <https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0964-3.pdf>. Used: Definition 2.1
  (p. 41), Lemma 2.4, Definition 2.5, Theorem 2.6 and Lemma 2.7 (p. 42).
- [Kawasaki 2000] T. Kawasaki, *On Macaulayfication of Noetherian schemes*, Trans. Amer. Math. Soc. 352
  (2000), 2517–2552, <https://doi.org/10.1090/S0002-9947-00-02603-9>. Historical proof references
  cited through Česnavičius: 2.2, 2.8–2.10, 3.1–3.3, with his corrections in the proof of
  Proposition 3.11. The statements used here are cited directly to Česnavičius and the induction
  to the author preprint below.
- [Kawasaki 2002] T. Kawasaki, *On arithmetic Macaulayfication of Noetherian rings*, Trans. Amer. Math.
  Soc. 354 (2002), 123–149, <https://doi.org/10.1090/S0002-9947-01-02817-3>.
  Historical reference 3.6 cited through Česnavičius, proof of Proposition 3.11.
- [Kawasaki 1999 preprint] T. Kawasaki, *On arithmetic Macaulayfication of local rings*,
  author preprint dated 19 August 1999, available from
  <https://tkawasaki.fpark.tmu.ac.jp/articles.html> as
  <https://tkawasaki.fpark.tmu.ac.jp/dl/arith-CMfication.dvi.gz>.
  Used: Propositions 3.2–3.5 (p. 5), Theorem 3.6 (p. 6; proof pp. 6–13).
- [Schenzel 1982] P. Schenzel, *Dualisierende Komplexe in der lokalen Algebra und Buchsbaum-Ringe*,
  Lecture Notes in Math. 907, Springer, 1982. Historical reference 2.4.2 cited through Česnavičius,
  Remark 3.3; the torsion bound used in K0.5 is also stated in Kawasaki 1996, Lemma 2.4 (p. 42).
- [Huneke 1982] C. Huneke, *The theory of d-sequences and powers of ideals*, Adv. Math. 46 (1982),
  249–279 (origin of d-sequences, K1).
- [HJLS] W. Heinzer, B. Johnston, D. Lantz and K. Shah, *Coefficient ideals in and blowups of a
  commutative Noetherian domain*, author preprint,
  <https://www.math.purdue.edu/~heinzer/preprints/rrii53.pdf>. Used: Example 3.6 (p. 13) and
  pp. 12–13.
- [Stacks] The Stacks Project, <https://stacks.math.columbia.edu>. Used, by tag: 0A6R (Lemma 47.9.1),
  0BJB (Lemma 47.9.2), 0ALZ (Lemma 47.9.3), 0BJC (Lemma 47.9.6), 0955 (Lemma 47.10.1), 0AVZ
  (Lemma 47.11.1), 08Z1 (Section 47.7), 0A7B (Definition 47.15.1), 0A7U (Lemma 47.16.5), 0A7Z
  (Lemma 47.17.3), 0A80 (Lemma 47.17.4), 0A84 (Theorem 47.18.3), 0AAK (Lemma 47.18.4), 015N
  (Lemma 13.22.2), 02IJ (Lemma 10.113.1), 052P (Section 10.70, Lemma 10.70.6), 01M3 (Section 27.8,
  Lemmas 27.8.4 and 27.8.7), 0804 (Lemma 31.33.2), 080A (Lemma 31.33.12), 080D (Definition 31.34.1),
  080E (Lemma 31.34.2).

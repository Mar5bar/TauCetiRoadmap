# Roadmap: automorphic L-functions and local factors

**Summary.** This roadmap constructs the analytic L-functions of characters and automorphic representations of GLₙ, together with the normalization maps needed to compare their values, poles and local factors. It starts with Fourier analysis over local fields and adeles, develops Tate's zeta distributions, then the Godement–Jacquet and Rankin–Selberg integrals. Its final interfaces compare Satake and Weil–Deligne determinants, rational period structures and finite Euler corrections. The function-field part also proves the polynomial and reciprocal-factor statements used to normalize intertwining scalars.

The library must expose the spaces, measures, distributions and comparison maps that make those theorems usable. An integral formula is accompanied by its convergence domain and continuation theorem. A local denominator is characterized by the ideal of test integrals, rather than by a choice of one test vector. A period is a class modulo the units of its rationality field, rather than a canonically chosen complex number.

## Scope and ownership

The local representation categories, normalized parabolic induction, genericity, finite-place newforms and Satake isomorphisms come from **SmoothRepresentationsOfLocalGroups**, layers SR.1–SR.5. **AutomorphicFormsOnReductiveGroups**, layers AF.1–AF.4, supplies Casselman–Wallach globalizations, archimedean Langlands parameters, restricted tensor products, cusp forms, rapid decay, discrete/isobaric classification and finite-part rationality. **ArithmeticLocallySymmetricSpaces**, layer ALS.5b, supplies the geometric rational cohomology realizations. The Whittaker integrals, their analytic continuation and the scalar period comparison are built here. Ordinary multiplicity one is proved from cusp-form Fourier reconstruction and local Whittaker uniqueness; it does not require the general automorphic trace formula.

**AdelicAlgebraicGroups**, layers AA.0–AA.2, owns adelic group topology, restricted Haar products and quotient measures. This roadmap uses those measures to construct Schwartz spaces, Poisson summation and zeta integrals. The actual intertwining operators and their operator identities belong to AA/AF; the Rankin–Selberg scalar that normalizes them belongs here. **ReductiveGroupsPartII**, RG2.5, and **IntegralHeckeAndGaloisDeterminants**, §3a.1, supply the L-group, its Frobenius coset and the normalized GLₙ Satake coefficients. **ArithmeticGaloisRepresentations**, §§2.4–2.7, supplies Weil–Deligne representations and their geometric-Frobenius Euler and epsilon factors. Ramified comparisons always take a compatible local parameter as an input; the existence of a general finite-place local Langlands correspondence is a separate theorem.

For function fields AL.3 constructs completion-valued additive analysis from **AlgebraicCurves**, layers 0, 4, 5, 9 and 12, then the unramified pure realization and cohomological determinant comparison. The scheme operations and weights are imported from **SchemeAndStackFoundations**, layers 0–3, **EtaleDualityAndPerverseSheaves** EDC.0–EDC.2 and EDC.8, and **DeligneWeightsAndPurity** DWP.0, DWP.1 and DWP.5–DWP.7. Rational cohomology for the particular finite-stabilizer shtuka compactifications, their boundary comparison and essential Hecke summand are part of the realization construction here. Scheme-level duality alone does not supply those stack statements.

The last layer states the complex GL₂ period and stabilization dictionary used by interpolation formulas. Constructing p-adic measures, overconvergent modular symbols and exceptional-zero formulas is separate work. Algebraicity is used only with an actual critical-value theorem and its coefficient field, sign, character and nonzero period. The rational Whittaker/cohomological period theorem of AL.3 has its own broader hypotheses; a GL₂ formula over ℚ does not establish algebraicity for arbitrary rank or arbitrary number fields.

## Conventions

Throughout the number-field part, K is a number field and F is a completion ℝ, ℂ or a finite extension of ℚₚ. The function-field part explicitly changes to K=𝔽_q(X), for X smooth, projective and geometrically connected. Write O, P, ϖ and q for a nonarchimedean local field's valuation ring, maximal ideal, uniformizer and residue cardinality. Use |ϖ|=q⁻¹ and |z|_ℂ=z z̄. All analytic functions are complex-valued; comparison with ℓ-adic factors specifies an embedding of the algebraic coefficient field.

There are two Fourier conventions, connected by an explicit comparison. Mathlib's `VectorFourier.fourierIntegral` uses ψ(−B(x,y)). The Tate transform F⁺ uses ψ(B(x,y)); therefore F⁺f(y)=F⁻f(−y). With the self-dual measure, applying either same-sign transform twice reflects f. The negative-sign formula for f(x−a) has phase ψ(−B(a,y)); multiplying f by ψ(B(x,y₀)) shifts its negative-sign transform by y−y₀.

The standard global additive character has real component exp(2πix), p-adic component exp(−2πi fracₚ(x)), and is pulled back by local trace. It is trivial on the diagonal K. At a finite place of different exponent d, its conductor is P⁻ᵈ and its self-dual additive Haar measure gives O volume q⁻ᵈᐟ². At infinity use dx over ℝ and 2 dx dy over ℂ with the trace character exp(2πi(z+z̄)). If ψ is replaced by ψ_a, its self-dual measure is multiplied by |a|¹ᐟ². Multiplicative Haar measure giving O× volume 1 is a different convention. Tate's measure uses the factor q⁻ᵈᐟ² on O×; every change of multiplicative measure scales the zeta integral and normalized distribution together.

GLₙ standard factors and Rankin–Selberg factors use the unitary center 1/2. The Godement–Jacquet determinant exponent is s+(n−1)/2. For GLₙ×GLₘ, n>m, the exponent is s−(n−m)/2 and the auxiliary index satisfies 0≤j≤n−m−1; equal ranks require an additional Schwartz function and exponent s. The two Whittaker characters in a Rankin–Selberg integral are opposite. Matrix Fourier transform uses the trace pairing and positive Tate character. Source conventions using inverse characters or transposes are transported before their functional equations are compared.

Use the native Deligne factors Γ_ℝ(s)=π⁻ˢᐟ²Γ(s/2) and Γ_ℂ(s)=2(2π)⁻ˢΓ(s). Kudla's complex Gaussian integral is πΓ_ℂ in its stated multiplicative measure, so its normalized distribution is rescaled when the canonical factor is used. Completed functions include every archimedean and finite local factor. A superscript S removes the specified places; a finite product of inverse local denominators relates the two functions meromorphically.

At a finite unramified place, local polynomials have constant term 1 and use geometric Frobenius in the Galois comparison. A pure motive of weight w has arithmetic variable s_mot=s_unit+w/2. In particular, the tensor of Symⁿ⁻¹H¹ of one elliptic curve with SymⁿH¹ of another has weight 2n−1; its center n corresponds to unitary center 1/2. Purity and matching dimensions alone do not identify its Frobenius polynomial with an automorphic one.

For function fields put z=q⁻ˢ and use z^(deg v) in the v-factor. Rational identities retain numerator and denominator, including their multiplicities. Roots on |z|=1 are excluded from the open-disc zero–pole index. Numerical division by zero, or a totalized integral outside its convergence domain, is never a replacement for continuation or a limit.

## Exact supplier contracts

The following constructions are reused. The work below proves the additional local-field or representation-theoretic statements with their stated hypotheses.

| Interface | Existing construction and its precise use |
| --- | --- |
| Characters and Fourier integrals | Mathlib `AddChar`, `ContinuousMonoidHom`, `Real.fourierChar`, `ZMod.toCircle`, `ZMod.dft`, `VectorFourier.fourierIntegral`, its translation/scalar/a.e. congruence lemmas, and `SchwartzMap.fourierTransformCLM`. Translation covariance and the Schwartz Fourier operator are imported. |
| Compact-open duals | Mathlib `PontryaginDual` supplies the continuous-character space and topology. Tau Ceti's `fourierPontryaginDualEquiv` classifies the dual of an additive circle; its Fourier coefficient uniqueness and the Pontryagin Fourier–Stieltjes uniqueness results are reused in that scope. Local-field self-duality of the particular trace pairing is an additional theorem. |
| Distributions | Mathlib `TemperedDistribution` is the continuous dual with pointwise-convergence topology. Its `delta` is already evaluation at a point. The new work is the scaling action, eigenspaces, restrictions and finite-jet classification, not a second Dirac distribution. |
| Parametric integrals | Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `mellin`, `mellin_differentiableAt_of_isBigO_rpow` and `mellinInv_mellin_eq`. Local integrability, strict endpoint exponent margins, continuity at the inversion point and integrability on the Mellin line remain hypotheses. |
| Adeles and Euler products | Tau Ceti's **GlobalNumberFields**, layers 0, 5, 6, 9 and 10, and **LocalFieldsRamification**, layer 3. The completed **RestrictedProducts** roadmap, layers 0–3 on the reference topology, functorial maps, finite-factor decompositions and diagonal subgroups, and the `TauCeti.RestrictedProductGroup` and `TauCeti.rationalDiagonal` APIs are reused. **ArithmeticDirichletSeries**, layers 3 and 8, supplies analytic Euler products and Landau positivity. |
| Conductors | The main **ClassFieldTheory** roadmap, layer 7, supplies `characterConductorExp` and `unitFiltration_characterConductorExp_le_ker`. The normalized local analytic statements use that attained integer directly, together with the local Artin normalization. |
| Rank-one checks | Mathlib's primitive Dirichlet completed functional equation, Gaussian Fourier transform, theta identity, finite Gauss sums, completed Riemann zeta functional equation and residue, and number-field class number/regulator/discriminant definitions and real one-sided Dedekind residue limit. The real residue limit alone does not assert complex continuation. Tau Ceti `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` and `TauCeti.ne_zero_of_eqOn_dedekindZeta` already give the Dedekind specialization near Re(s)=1; use them in that scope. The general Hecke continuation and adelic measure comparison remain the targets here. |
| Holomorphic modular L-functions | Tau Ceti `CuspForm.abscissaOfAbsConv_qExpansion_coeff_le`, `CuspForm.LSeries_qExpansion_coeff_eq` and `CuspForm.hasEntireExtension_qExpansion_coeff`. In the coefficient normalization the recorded absolute-convergence bound is Re(s)>k/2+1 and the comparison includes width⁻ˢ. Tau Ceti `HeckeRing.GL2.Newform.LSeries_eulerProduct_hasProd` and its value forms already give analytic Euler products with the bad-prime factors included. These are used for the modular specialization. |
| Polynomial factors and orders | Mathlib `Matrix.charpolyRev` is det(1−T M). `MeromorphicOn.divisor`, its multiplication/inversion lemmas and `meromorphicOrderAt_mul` supply divisor arithmetic. The latter adds native `WithTop ℤ` orders even in the infinite-order cases; no replacement order function is constructed. |


### Native formulas and carriers

Mathlib `AddChar.compAddMonoidHom` and `AddChar.compAddMonoidHom_apply`
(`Mathlib/Algebra/Group/AddChar.lean`) supply trace pullback as a character and its
evaluation. `AddChar.mulShift`, `AddChar.mulShift_apply`, `AddChar.mulShift_mul`,
`AddChar.mulShift_mulShift` and `AddChar.mulShift_zero` in the same module supply
algebraic local character shifts. They are used directly. This roadmap adds the
standard trace character's conductor and diagonal product theorem, and continuity
and local-field topological self-duality of the compact-open map.

Mathlib `SchwartzMap`, `TemperedDistribution` and `TemperedDistribution.delta` supply
the archimedean test-function carrier, its continuous dual and point evaluation;
`SchwartzMap.fourierTransformCLM` supplies the Schwartz Fourier operator. At a finite
place SmoothRepresentationsOfLocalGroups SR.1.1 supplies its locally constant compactly
supported carrier. The additional targets here are scalar actions, finite-level
Fourier identities and the local/adelic comparison; no new copies of the supplied
spaces or Dirac functional are constructed.

Mathlib `LSeries` and `LSeriesSummable` supply the Maass finite series in its
convergence domain. This roadmap adds its gamma completion, normalization comparisons
and automorphic continuation. Mathlib `Matrix.charpolyRev`, `Matrix.eval_charpolyRev`
and `Matrix.coeff_charpolyRev_eq_neg_trace`
(`Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`) supply det(1−TM), constant term 1
and linear coefficient −tr(M). AL.4 adds the L-group/Satake interpretation and its
basis and conjugacy comparisons over that native polynomial.

Tau Ceti `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` and
`TauCeti.ne_zero_of_eqOn_dedekindZeta`
(`TauCeti/NumberTheory/NumberField/DedekindZeta.lean`) give continuation to
Re(s)>1−1/[K:ℚ] after subtraction of the simple pole at 1, and nonvanishing on
Re(s)=1 away from 1 for a compatible holomorphic representative. These statements
are consumed for that Dedekind specialization; general Hecke continuation and
identification of the residue with adelic measure are AL.1 targets.

### Roadmap contracts

- **AdelicAlgebraicGroups**, §§0.1–0.4 supplies locally normalized Haar measures,
  the restricted Haar product and its finite-factor Fubini comparison. Sections 2.2–2.3
  supply invariant quotient measures and rational quotients with Weil integration.
  The additive self-duality and Schwartz/Poisson theorems are proved here with those measures.
- The main **ClassFieldTheory** roadmap, layer 7, supplies
  `TauCetiRoadmap.ClassFieldTheory.characterConductorExp` and
  `TauCetiRoadmap.ClassFieldTheory.unitFiltration_characterConductorExp_le_ker`.
  The integer is the least unit-filtration depth killed by the continuous character,
  and the attainment theorem places that filtration in its kernel. AL.1 consumes
  this integer and proves norm-twist invariance and analytic epsilon comparisons.
- **SmoothRepresentationsOfLocalGroups**, SR.1.1 supplies finite-place compactly
  supported locally constant functions; SR.2–SR.3 supplies normalized induction and
  irreducible admissible inputs; SR.4 supplies spherical Satake classes; SR.5 supplies
  Whittaker uniqueness, generic newforms and their conductor normalization.
- **ReductiveGroupsPartII**, RG2.5 supplies the dual group and Frobenius coset.
  **IntegralHeckeAndGaloisDeterminants**, §3a.1, *Normalized Satake coefficients for GLn*,
  supplies the integral-to-unitary polynomial conversion: under its Satake map the
  roots are q^((n−1)/2) times the unitary roots.
- **ArithmeticGaloisRepresentations**, §§2.4–2.5 supplies the shared Weil–Deligne
  data (V,r,N), inertia and monodromy invariant factor and arithmetic/geometric
  Frobenius conversion; §2.7 supplies epsilon factors. AL.4 compares only after an
  L/ε-compatible parameter has actually been supplied.
- **ArithmeticLocallySymmetricSpaces**, ALS.5b.1 *de-rham-comparison*, ALS.5b.4
  *automorphic-comparison* and ALS.5b.5 *cuspidal-cohomology* supplies the geometric
  characteristic-zero realizations. **AutomorphicFormsOnReductiveGroups**, AF.4
  *clozel-rationality* and *cohomological-representation* supplies the finite-part
  E-structure and archimedean cohomological input. AL.3 constructs their actual
  comparison, chooses the nonzero infinity vector and retains the period modulo E×.
- **SchemeAndStackFoundations**, layers 0–3 supplies schemes, descent and stacks,
  sites and scheme cohomology, and curve/Picard objects. **AlgebraicModuliForArithmeticGeometry**,
  layers 2–5 supplies Hom/Isom parameters, effective descent, gerbes and rigidification.
  **EtaleDualityAndPerverseSheaves**, EDC.0–EDC.2 and EDC.8 supplies scheme-level
  étale operations, trace and duality; **DeligneWeightsAndPurity**, DWP.0–DWP.1 and
  DWP.5–DWP.7 supplies scheme weights and purity. Their scheme statements are not
  substituted for AL.3's finite-stabilizer shtuka cohomology and boundary comparisons.

All local APIs below are proposed extensions of those carriers. The suggested file illustrates signatures and discriminating examples; the mathematical hypotheses in this document define their scope.

## How to read the build

| Layer | Library built |
| --- | --- |
| AL.0 | Annihilators, self-dual measures, local and adelic Schwartz–Bruhat analysis, Poisson summation and Bessel transforms. |
| AL.1 | Tate eigendistributions, local/global L and epsilon factors, Hecke continuation and CM normalization. |
| AL.2 | Godement–Jacquet standard factors, newform tests, global growth and positivity, and Maass standard functions. |
| AL.3 | Whittaker models, Rankin–Selberg analysis, multiplicity/converse theorems, periods, and function-field rational normalizers. |
| AL.4 | Satake/L-group determinants, conditional Weil–Deligne comparisons and factor operations. |
| AL.5 | Finite Euler corrections, critical-value normalization, sign vanishing and refined GL₂ factors. |

Construct AL.0 and AL.1 first. Next construct the local integral prefixes of AL.2 and AL.3; the ramified Godement–Jacquet test then uses the finite-place Rankin–Selberg induced-factor product. The global analytic prefix of AL.3 precedes AL.2's absolute convergence and growth results, which use the positive self-pair and the Jacquet–Shalika bound. AL.4's determinant interface precedes the function-field and motivic suffix of AL.3. Rational periods use the geometric rational structures of AF.4 and ALS.5b after the analytic Whittaker model has been constructed. The document groups targets by layer; these finer dependencies specify their acyclic construction order.

For named APIs, `LocalFourier` means `TauCeti.LocalFourier`, `SchwartzBruhat` means `TauCeti.SchwartzBruhat`, `TateZeta` means `TauCeti.TateZeta`, and `ALk` means `TauCeti.AutomorphicLFunctions.ALk`. A definition's tests specify concrete computations, comparisons or failures that distinguish its normalization.


## Layer AL.0: Local and adelic Fourier analysis


### Annihilators and compact-open Fourier identities


<a id="pairing-annihilator"></a>

**Annihilator for a bilinear character pairing.** Construct U⊥={w∈W | ψ(L(u,w))=1 for every u∈U} as an AddSubgroup W. It is generally not an R-submodule. Its data is exactly this carrier and the inherited additive subgroup operations.

Work under the following hypotheses. R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data.

Require the following API.

- `LocalFourier.pairingAnnihilator_bot`: The annihilator of the zero additive subgroup is the full subgroup W.
- `LocalFourier.pairingAnnihilator_zero`: For the zero bilinear pairing the annihilator of every U is W.
- `LocalFourier.pairingAnnihilator_antitone`: U⊆U′ implies (U′)⊥⊆U⊥ for the same ψ and L.
- `LocalFourier.pairingAnnihilator_comap`: For a linear T:W′→W, the annihilator for (v,w′)↦L(v,Tw′) equals the native comap of U⊥ along T. This uses native LinearMap.compl₂.

**Checks.**

- `LocalFourier.pairingAnnihilator_zmod_two`: For R=V=W=Z/2, the standard ZMod.toCircle character, multiplication pairing and U=V, the annihilator is zero.
- `LocalFourier.pairingAnnihilator_trivial_character`: For ψ=1 and every L,U, the annihilator is W.
- `LocalFourier.pairingAnnihilator_zmultiples_eq_kernel`: For V=W=R, multiplication pairing and U the additive subgroup generated by 1, U⊥ equals the native kernel of ψ.toAddMonoidHom. U cannot be replaced by all of R in this assertion.
- `LocalFourier.pairingAnnihilator_not_real_submodule`: For R=V=W=R-real, ψ(x)=exp(2πix), multiplication pairing and U=Z·1, the annihilator contains 1 and does not contain 1/2. Thus it is not stable under real scalar multiplication.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* Mathlib `AddChar`; Mathlib `AddChar.map_zero_eq_one`; Mathlib `AddChar.map_add_eq_mul`; Mathlib `LinearMap.compl₂`; Mathlib `AddChar.toAddMonoidHom`; Mathlib `ZMod.toCircle`; Mathlib `ZMod.injective_toCircle`; Mathlib `Real.fourierChar`; Mathlib `Subgroup.zpowers`.


<a id="mem-pairing-annihilator"></a>

**Membership in the character annihilator.** For every w, w∈U⊥ if and only if ψ(L(u,w))=1 for all u∈U.

Work under the following hypotheses. Use the pairing data above.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* [Annihilator for a bilinear character pairing](#pairing-annihilator).


<a id="closed-annihilator"></a>

**Closedness of the character annihilator.** If W is a topological space and w↦ψ(L(v,w)) is continuous for each v∈V, then U⊥ is closed in W.

Work under the following hypotheses. Use the pairing data above. W is topological; each displayed one-variable circle-valued map is continuous.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); Mathlib `isClosed_eq`; Mathlib `isClosed_iInter`.


<a id="open-annihilator"></a>

**Openness of a compact subgroup annihilator.** Suppose V,W are topological spaces, U is compact as a subset of V, and (v,w)↦ψ(L(v,w)) is jointly locally constant. Then U⊥ is open in W.

Work under the following hypotheses. Use the pairing data above. V,W are topological; U is compact; the joint circle-valued pairing is IsLocallyConstant.

(Source: [Kudla](#ref-kudla2004), p.115, local constancy and compact support; p.122, Fourier transforms.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); Mathlib `IsLocallyConstant.isOpen_fiber`; Mathlib `generalized_tube_lemma`.


<a id="vanishing-from-period"></a>

**Fourier vanishing from a nontrivial period.** If f(v+u)=f(v) for every v and ψ(L(u,w))≠1, then Ff(w)=0.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* Mathlib `VectorFourier.fourierIntegral_comp_add_right`.


<a id="fourier-support"></a>

**Fourier support lies in the period annihilator.** If every u∈U is a period of f, then ordinary support(Ff)⊆U⊥.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); [Fourier vanishing from a nontrivial period](#vanishing-from-period).


<a id="indicator-transform"></a>

**Fourier transform of a subgroup indicator.** If U is measurable, then F(1_U)=μ.real(U)·1_(U⊥). The theorem uses native totalized Bochner integrals. On finite-measure compact-open U with continuous pairing it is the usual convergent Fourier calculation.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. U is measurable. No unit-volume assumption and no self-duality identification are imposed.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); [Fourier support lies in the period annihilator](#fourier-support); Mathlib `VectorFourier.fourierIntegral`; Mathlib `MeasureTheory.integral_indicator_const`; Mathlib `MeasureTheory.integral_congr_ae`.


<a id="coset-transform"></a>

**Fourier transform of a coset indicator.** For measurable U and a∈V, the transform of v↦1_U(v−a) equals w↦ψ(−L(a,w))·μ.real(U)·1_(U⊥)(w).

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. U is measurable; a∈V.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* [Fourier transform of a subgroup indicator](#indicator-transform); Mathlib `VectorFourier.fourierIntegral_comp_add_right`.


<a id="modulation"></a>

**Fourier transform of a character modulation.** For every w₀, the transform of v↦ψ(L(v,w₀))·f(v) equals w↦Ff(w−w₀). No invariance of μ is needed.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* Mathlib `VectorFourier.fourierIntegral`; Mathlib `AddChar.map_add_eq_mul`; Mathlib `MeasureTheory.integral_congr_ae`.


<a id="frequency-periods"></a>

**Frequency periods from support containment.** If ordinary support(f)⊆U and a∈U⊥, then Ff(w+a)=Ff(w) for all w. No invariance of μ is needed.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

(Source: [Tate](#ref-tate1950), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); Mathlib `VectorFourier.fourierIntegral`; Mathlib `AddChar.map_add_eq_mul`; Mathlib `MeasureTheory.integral_congr_ae`.


<a id="locally-constant-transform"></a>

**Local constancy of the Fourier transform.** Suppose V is topological, W is a topological additive group, U is compact, the joint character pairing is locally constant, and support(f)⊆U. Then Ff is locally constant.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. W is an IsTopologicalAddGroup; U is compact in V; the joint pairing is locally constant.

(Source: [Kudla](#ref-kudla2004), p.122, Fourier transforms of Schwartz–Bruhat functions.)

*Needs:* [Openness of a compact subgroup annihilator](#open-annihilator); [Frequency periods from support containment](#frequency-periods); Mathlib `IsLocallyConstant.iff_exists_open`.


<a id="compact-support-transform"></a>

**Compact support from a compact period annihilator.** If W is Hausdorff, every u∈U is a period of f, and U⊥ is compact, then Ff has compact support in the native sense.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. W is a Hausdorff topological space; U⊥ is compact. This compactness is an explicit input, not inferred from openness of U.

(Source: [Kudla](#ref-kudla2004), p.122, Fourier transforms of Schwartz–Bruhat functions.)

*Needs:* [Fourier support lies in the period annihilator](#fourier-support); Mathlib `HasCompactMulSupport.of_mulSupport_subset_isCompact`.


<a id="indicator-inversion"></a>

**Fourier inversion for a subgroup indicator.** Put A=U⊥. Suppose U and A are measurable, μ on V and ν on W are translation invariant, the annihilator of A for the transposed pairing equals U, and μ.real(U)ν.real(A)=1. Then F_(ν,Lᵗ)(F_(μ,L)(1_U))(v)=1_U(−v).

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. W has measurable addition and ν is right-translation invariant. U,A are measurable. The double-annihilator equality and the volume-product equality are supplied explicitly.

(Source: [Kudla](#ref-kudla2004), p.122, self-dual measure and Fourier inversion.)

*Needs:* [Fourier transform of a subgroup indicator](#indicator-transform); Mathlib `VectorFourier.fourierIntegral_const_smul`; Mathlib `LinearMap.flip`.


### Characters, trace duality and self-dual measures


<a id="standard-additive-character"></a>

**The standard additive character.** Fix ψ_Q,∞(x)=exp(2πix) and ψ_Q,p(x)=exp(−2πi frac_p(x)); on a completion K_v use ψ_v=ψ_Q,w∘Tr_{K_v/Q_w}. Their restricted product is trivial on the diagonal K. The finite conductor is the inverse different D_v^(−1)=P_v^(−d_v), while the archimedean characters are exp(2πix) and exp(2πi(z+z̄)).

Work under the following hypotheses. K number field; frac_p(x) denotes the rational p-primary part modulo Z. These are Kudla’s positive infinity characters, the inverse of Tate’s opposite global choice.

Require the following API.

- `AL0.StandardAdditiveCharacter.conductor`: The largest trivial fractional ideal is P^(−d_v).
- `AL0.StandardAdditiveCharacter.diagonal`: ∏_vψ_v(a)=1 for a∈K.
- `AL0.StandardAdditiveCharacter.nontrivial`: Each ψ_v is continuous and nontrivial.

**Checks.**

- `AL0.StandardAdditiveCharacter.rational_unramified`: For Q_p the different exponent is0 and ψ is trivial on Z_p but not p^(−1)Z_p.
- `AL0.StandardAdditiveCharacter.real_one`: ψ_R(1)=1 and ψ_R(1/2)=−1.
- `AL0.StandardAdditiveCharacter.complex_imaginary`: ψ_C(i)=1 although i≠0; nontriviality does not mean an injective character.

(Source: [Kudla](#ref-kudla2004), §3, Corollary 3.8 and (3.30), p.124; §4, p.127, global character.)

*Needs:* [Annihilator for a bilinear character pairing](#pairing-annihilator); Mathlib `AddChar.compAddMonoidHom`; Tau Ceti **GlobalNumberFields**, layer 0 places completions and the product formula; Tau Ceti **GlobalNumberFields**, layer 5 full adeles and the additive quotient; Tau Ceti **LocalFieldsRamification**, layer 3 ramification the tame and wild cases and the filtration.


<a id="fractional-ideal-annihilator"></a>

**The trace annihilator of a fractional ideal.** For the trace character ψ_v and fractional ideal A=P^m, A⊥={y:∀x∈A,ψ_v(xy)=1}=P^(−m−d_v). Consequently (A⊥)⊥=A and every such annihilator is compact open.

Work under the following hypotheses. Nonarchimedean completion of a number field; inverse different exponent d_v.

(Source: [Tate](#ref-tate1950), §2.2, Lemma2.2.3, physical p.10.)

*Needs:* [The standard additive character](#standard-additive-character); [Annihilator for a bilinear character pairing](#pairing-annihilator); Tau Ceti **LocalFieldsRamification**, layer 3 ramification the tame and wild cases and the filtration.


<a id="self-dual-haar"></a>

**Self-dual local additive Haar measure.** The ψ_v-self-dual additive Haar is normalized by μ(O)=q^(−d_v/2), μ_R=dx and μ_C=2 dxdy for the standard trace characters. For ψ_a(x)=ψ(ax), μ_{ψ_a}=|a|^(1/2)μ_ψ. For A=P^m, μ(A)μ(A⊥)=1. This additive normalization is distinct from prescribing multiplicative O×-volume1.

Work under the following hypotheses. a∈F×; Haar positive; d_v is the trace different exponent.

Require the following API.

- `AL0.SelfDualHaar.unit_volume`: μ(O)=q^(−d/2).
- `AL0.SelfDualHaar.dual_volume`: μ(A)μ(A⊥)=1.
- `AL0.SelfDualHaar.character_scale`: Changing ψ to ψ_a multiplies μ by |a|^(1/2).

**Checks.**

- `AL0.SelfDualHaar.unramified`: d=0 gives μ(O)=1.
- `AL0.SelfDualHaar.different_two`: d=2 gives μ(O)=q^(−1), and μ(P^(−2))=q.
- `AL0.SelfDualHaar.scaled_character`: For |a|=q^(−1), the new Haar is q^(−1/2)μ, not q^(−1)μ.
- `AL0.SelfDualHaar.complex_trace`: The complex trace pairing needs2 dxdy, not dxdy.

(Source: [Kudla](#ref-kudla2004), §3, Fourier inversion and (3.29)–(3.30), pp.122–124.)

*Needs:* [The trace annihilator of a fractional ideal](#fractional-ideal-annihilator); [Fourier inversion for a subgroup indicator](#indicator-inversion); **AdelicAlgebraicGroups**, §0.1, Borel structure and local normalization; Mathlib `fourierIntegral_gaussian`.


<a id="additive-duality-map"></a>

**The additive local-field duality map.** For a local field F and continuous nontrivial additive character ψ, define ι_ψ(y)(x)=ψ(xy), taking values in native PontryaginDual(Multiplicative F). It is a continuous group homomorphism from Multiplicative F. The local-field self-duality theorem upgrades this particular map to a topological group isomorphism.

Work under the following hypotheses. Use multiplication in F and compact-open topology on the native continuous-character group; do not replace the dual by a new carrier.

Construct the continuous compact-open map with the displayed evaluation formula. Its
underlying algebraic character is Mathlib's `AddChar.mulShift ψ y`, using commutativity to
write its value as ψ(xy). The additive, scalar-character and zero identities are the native
shift identities recorded in Exact supplier contracts. The additional target is continuity
into the compact-open dual and the local-field topological isomorphism, including its
annihilator comparison with `LocalFourier.pairingAnnihilator`.

**Checks.**

- At zero: ι_ψ(0) is the trivial character.
- At a real half-frequency: For ψ_R and y=1/2, the character has value−1 at x=1.
- Over the two-element field: Over F₂ with the nontrivial character, the map identifies the two elements with the two characters.
- For the trivial character: For trivial ψ the map is constant and cannot be a duality isomorphism.

(Source: [Tate](#ref-tate1950), §2.2, Theorem 2.2.1, physical p.10.)

*Needs:* Mathlib `PontryaginDual`; Mathlib `AddChar`; Mathlib `ContinuousMonoidHom`; [The standard additive character](#standard-additive-character).


<a id="local-additive-self-duality"></a>

**Self-duality of a local additive group.** For F=R,C or a finite extension of Q_p, a continuous nontrivial additive ψ gives a bijective ι_ψ:F→PontryaginDual(Multiplicative F), and its inverse is continuous. Thus open-lattice annihilators are compact and their double annihilators equal the original lattice.

Work under the following hypotheses. F is a number-field completion in AL.0’s scope (R, C, or a finite extension of Q_p); the topology on its dual is compact-open. Equal-characteristic residue characters are treated by the curve additive analysis in AL.3.

(Source: [Tate](#ref-tate1950), §2.2, Theorem2.2.1, physical p.10.)

*Needs:* [The additive local-field duality map](#additive-duality-map); [The trace annihilator of a fractional ideal](#fractional-ideal-annihilator).


### Local Schwartz–Bruhat spaces and finite Fourier levels


<a id="local-schwartz-bruhat-space"></a>

**The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions.** For F nonarchimedean, S(F) is the complex vector space of functions f : F → ℂ for which there is r ≥ 0 with supp f ⊆ P^{−r} and f constant on cosets of P^r (SR.1's locally constant compactly supported carrier over ℂ); S(F)′ is its algebraic dual. For F = ℝ, ℂ, S(F) is Mathlib's Schwartz space 𝓢(F, ℂ) (F viewed as a real vector space) and S(F)′ = 𝓢′(F, ℂ) is Mathlib's TemperedDistribution. F^× acts by r(a)f(x) = f(xa) and on distributions by ⟨r′(a)λ, f⟩ = ⟨λ, r(a^{−1})f⟩. δ₀ is ⟨δ₀, f⟩ = f(0).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Kudla p. 115: tempered distributions at a finite place are arbitrary ℂ-linear functionals; at ℝ, ℂ they are the continuous functionals on the Fréchet space.

Require the following API.

- `SchwartzBruhat.LocalSpace.act`: r(a)f(x) = f(xa), a group action of F^× by linear maps.
- `SchwartzBruhat.LocalSpace.act_apply`: (r(a)f)(x) = f(xa).
- `SchwartzBruhat.LocalSpace.mem_iff_nonarch`: f ∈ S(F) iff ∃ r, supp f ⊆ P^{−r} ∧ f is P^r-periodic.

**Checks.**

- `SchwartzBruhat.LocalSpace.indicator_integers_mem`: 1_O ∈ S(F) with r = 0; 1_{O^×} ∈ S(F) with r = 1.
- `SchwartzBruhat.LocalSpace.gaussian_mem`: e^{−πx²} ∈ S(ℝ) and e^{−2πxx̄} ∈ S(ℂ).
- `SchwartzBruhat.LocalSpace.delta_invariant`: r′(a)δ₀ = δ₀ for all a ∈ F^×.
- `SchwartzBruhat.LocalSpace.const_not_mem`: The constant function 1 on F is not in S(F): its support is not compact (finite place) and it does not decay (ℝ).

(Source: [Kudla](#ref-kudla2004), §3, printed p. 115 (physical p. 7).)

*Needs:* **SmoothRepresentationsOfLocalGroups**, SR.1; Mathlib `SchwartzMap`; Mathlib `TemperedDistribution`; Mathlib `TemperedDistribution.delta`; [Local constancy of the Fourier transform](#locally-constant-transform).


<a id="finite-schwartz-period-level"></a>

**Finite-place Schwartz levels.** A locally constant compactly supported complex function on a nonarchimedean local field is supported in P^(−M) and invariant under translation by P^N for some integers M,N. Thus it is a finite linear combination of coset indicators on P^(−M)/P^N, where N≥−M.

Work under the following hypotheses. Import SR.1’s generic carrier; the ambient group is an actual local field, not an arbitrary LCA group.

(Source: [Kudla](#ref-kudla2004), §3, p.115, finite Schwartz description.)

*Needs:* [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); [Fourier transform of a coset indicator](#coset-transform); [The trace annihilator of a fractional ideal](#fractional-ideal-annihilator).


<a id="finite-fourier-inversion"></a>

**Finite-place Schwartz Fourier inversion.** The Fourier transform carries SR.1’s finite-place Schwartz carrier into itself and its square is f(x)↦f(−x), with the self-dual Haar. For the positive kernel use F⁺f(x)=F⁻f(−x) where F⁻ is the native transform with the same ψ.

Work under the following hypotheses. Every function has a finite coset decomposition; the actual integrals are integrable.

(Source: [Kudla](#ref-kudla2004), §3, p.122, Fourier inversion.)

*Needs:* [Finite-place Schwartz levels](#finite-schwartz-period-level); [Self-dual local additive Haar measure](#self-dual-haar); [Fourier inversion for a subgroup indicator](#indicator-inversion); [Fourier transform of a coset indicator](#coset-transform).


<a id="archimedean-fourier-comparison"></a>

**Archimedean Schwartz Fourier comparison.** At R use native SchwartzMap Fourier with the positive source transform F⁺f(ξ)=F⁻f(−ξ). At C identify C≃R² and the trace pairing Tr(zw)=2(Re z Re w−Im z Im w); with self-dual2dxdy, F⁺ preserves SchwartzMap and F⁺²f(x)=f(−x). The Gaussian exp(−2π|z|²) is fixed by this transform.

Work under the following hypotheses. The complex absolute value for Tate is|z|²; the native Euclidean norm remains|z|. The trace pairing differs from the Hermitian inner product.

(Source: [Kudla](#ref-kudla2004), §3, pp.122–123, archimedean Fourier normalization.)

*Needs:* Mathlib `SchwartzMap.fourierTransformCLM`; Mathlib `fourierIntegral_gaussian`; [Self-dual local additive Haar measure](#self-dual-haar).


<a id="local-fourier-inversion"></a>

**Local Fourier transform, self-dual measure and inversion on S(F).** Fix a nontrivial additive character ψ of F and identify F with its dual by y ↦ (x ↦ ψ(xy)). For f ∈ S(F), f̂(x) = ∫_F f(y)ψ(xy)dy lies in S(F), and f ↦ f̂ is a linear isomorphism of S(F). There is a unique Haar measure dx, the self-dual measure for ψ, with f̂̂(x) = f(−x). For β ∈ F^× and ψ_β(x) = ψ(βx), the self-dual measure for ψ_β is |β|^{1/2}dx, and the ψ_β-transform of f is |β|^{1/2}r(β)f̂. For F nonarchimedean the conductor ν(ψ) is the largest ν with ψ trivial on P^{−ν}. Distributions: ⟨λ̂, f⟩ = ⟨λ, f̂⟩.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Kudla's convention ψ(x) = e(x) = e^{2πix} on ℝ and e(x + x̄) on ℂ (3.30) has positive sign; Mathlib's 𝓕 uses e^{−2πi⟨x, w⟩}, so f̂_Kudla(x) = 𝓕f(−x) at ℝ, and at ℂ one also rescales by 2 through the trace pairing.

(Source: [Kudla](#ref-kudla2004), §3, "Fourier transforms", printed p. 122 (physical p. 14).)

*Needs:* [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); [Fourier transform of a subgroup indicator](#indicator-transform); [Fourier transform of a coset indicator](#coset-transform); [Fourier inversion for a subgroup indicator](#indicator-inversion); Mathlib `SchwartzMap.fourierTransformCLM`; Mathlib `fourierIntegral_gaussian`; Mathlib `Real.fourierChar`; [Finite-place Schwartz Fourier inversion](#finite-fourier-inversion); [Archimedean Schwartz Fourier comparison](#archimedean-fourier-comparison); [Self-dual local additive Haar measure](#self-dual-haar); [Self-duality of a local additive group](#local-additive-self-duality).


<a id="point-supported-distributions"></a>

**Tempered distributions supported at a point.** Let E = ℝⁿ. A tempered distribution λ ∈ 𝓢′(E, ℂ) with dsupport λ ⊆ {0} is a finite linear combination Σ_{|α|≤N} c_α ∂^αδ₀. For n = 1 (F = ℝ) the F^×-finite ones are ⊕_k ℂ·D^kδ₀; for n = 2 written in x, x̄ (F = ℂ) they are ⊕_{k,l} ℂ·D^kD̄^lδ₀, D = ∂/∂x, D̄ = ∂/∂x̄.

Work under the following hypotheses. E = ℝⁿ with Mathlib's 𝓢(E, ℂ), 𝓢′(E, ℂ) = TemperedDistribution and dsupport.

(Source: [Kudla](#ref-kudla2004), §3, Lemma 3.3 (ii)–(iii) and footnote 8, printed pp. 116–117 (physical pp. 8–9).)

*Needs:* [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); Mathlib `TemperedDistribution`; Mathlib `TemperedDistribution.delta`; Mathlib `Distribution.dsupport`; Mathlib `SchwartzMap`.


<a id="schwartz-parameter-domination"></a>

**Domination for Schwartz parameter integrals.** A holomorphic Schwartz-valued family bounded in the relevant Schwartz seminorms on every compact parameter set gives locally uniform integrable bounds for its Mellin or Fourier parameter derivatives in the stated convergence strip. Hence integration and parameter differentiation commute there. For Mellin families, endpoint power exponents must leave a strict margin around the compact s-set.

Work under the following hypotheses. Use native SchwartzMap on finite-dimensional real spaces; a mere pointwise holomorphic family is insufficient.

(Source: [Jacquet](#ref-jacquetarch), §2, pp.5–6, analytic families; §3, pp.15–20, compact-parameter estimates.)

*Needs:* Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; Mathlib `mellin_differentiableAt_of_isBigO_rpow`; [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space).


### Adelic Schwartz spaces, Poisson summation and partial transforms


<a id="adelic-schwartz-bruhat-space"></a>

**The adelic Schwartz–Bruhat space S(𝔸) and its standard functions.** S(𝔸_K) is the locally convex inductive limit over finite-place compact-open support/period levels of SchwartzMap(K_∞,ℂ) tensor the corresponding finite-dimensional spaces of finite-adelic functions. Equivalently the archimedean tensor product is completed; finite linear combinations of products of one-place functions are dense. They need not exhaust S(𝔸_K) when several archimedean places occur. Distinguished finite-place tensors are 1_{O_v} almost everywhere. Fourier transform and tensor distributions extend continuously from these dense products. Tate’s conditions 𝔷1–𝔷3 are analytic properties to prove for this space, not its definition.

Work under the following hypotheses. k a number field; 𝔸 its adele ring with the restricted-product topology; ψ = ∏_v ψ_v a nontrivial character of 𝔸 trivial on k.

Require the following API.

- `SchwartzBruhat.AdelicSpace`: S(𝔸) is the locally convex inductive limit of finite-place support/period levels tensored with SchwartzMap(K∞,ℂ); the archimedean tensor factors are completed.
- `SchwartzBruhat.AdelicSpace.pure`: The factorizable function ⊗_v f_v, given f_v ∈ S(k_v) with f_v = f_v^o outside a finite set.
- `SchwartzBruhat.AdelicSpace.pure_apply`: (⊗ f_v)(x) = ∏_v f_v(x_v), a finite product for each x.
- `SchwartzBruhat.AdelicSpace.fourier_pure`: The global transform of ⊗ f_v is ⊗ f̂_v.
- `SchwartzBruhat.AdelicSpace.tateClass`: Every f ∈ S(𝔸) satisfies 𝔷1–𝔷3.
- `SchwartzBruhat.AdelicSpace.span_pure_dense`: Finite linear combinations of one-place factorizable functions are dense in S(𝔸); no algebraic spanning equality is asserted when several archimedean factors occur.

**Checks.**

- `SchwartzBruhat.AdelicSpace.standard_mem`: f^o = ⊗_{v<∞} 1_{O_v} ⊗ ⊗_{v|∞} Gaussian lies in S(𝔸).
- `SchwartzBruhat.AdelicSpace.theta_rat`: For k = ℚ and f = 1_Ẑ ⊗ e^{−πx²}, Σ_{ξ∈ℚ} f(tξ) = Σ_{n∈ℤ} e^{−πt²n²} for t > 0.
- `SchwartzBruhat.AdelicSpace.pure_eq_zero`: If one local factor f_v is 0, then ⊗f_v = 0.
- `SchwartzBruhat.AdelicSpace.not_restricted`: The product ∏_p 1_{pℤ_p} is not in S(𝔸): infinitely many factors differ from f_p^o, and it is the indicator of the compact but not open set ∏_p pℤ_p ⊂ 𝔸_f, so it is not locally constant.

(Source: [Kudla](#ref-kudla2004), §4, printed p. 125 (physical p. 17); [Tate](#ref-tate1950), §4.4, physical p. 49, conditions 𝔷1–𝔷3; §4.5, physical pp. 56 and 58.)

*Needs:* [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); **AdelicAlgebraicGroups**, AA.0; Mathlib `SchwartzMap`; Tau Ceti **GlobalNumberFields**, layer 5 full adeles and the additive quotient; **AdelicAlgebraicGroups**, §0.2, *restricted-haar-product*; **AdelicAlgebraicGroups**, §0.3, Fubini for restricted product measures.


<a id="adelic-poisson-summation"></a>

**Adelic Poisson summation and Tate's Riemann–Roch theorem.** Let k be a number field and ψ a nontrivial character of 𝔸/k with the self-dual measure on 𝔸. (i) The annihilator of k in 𝔸 under (x, y) ↦ ψ(xy) is k (Tate Theorem 4.1.4), and 𝔸/k has volume 1 (Tate p. 43). (ii) Poisson: if f is continuous and integrable, Σ_{ξ∈k} f(x + ξ) converges uniformly in x and Σ_{ξ∈k} |f̂(ξ)| converges, then Σ_{ξ∈k} f̂(ξ) = Σ_{ξ∈k} f(ξ) (Lemma 4.2.4). (iii) Riemann–Roch: if f satisfies 𝔷1–𝔷3 (for instance f ∈ S(𝔸)), then for every idele 𝔞, (1/|𝔞|) Σ_{ξ∈k} f̂(ξ/𝔞) = Σ_{ξ∈k} f(𝔞ξ) (Theorem 4.2.1).

Work under the following hypotheses. Tate's conditions: continuity and integrability of f and f̂ on 𝔸, uniform convergence of the periodised sums, absolute convergence of Σ f̂.

(Source: [Tate](#ref-tate1950), §4.1 Theorem4.1.4, physical p.40; §4.2 Lemmas4.2.1–4.2.4 and Theorem4.2.1, physical pp.41–43; [Kudla](#ref-kudla2004), §4, printed p.128 (physical p.20).)

*Needs:* [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); **AdelicAlgebraicGroups**, AA.0; Mathlib `Real.tsum_exp_neg_mul_int_sq`; Tau Ceti **GlobalNumberFields**, layer 5 full adeles and the additive quotient; Tau Ceti **RepresentationTheory/CompactGroups**, layer 6 characters of compact groups; [Self-duality of a local additive group](#local-additive-self-duality); **AdelicAlgebraicGroups**, §0.2, *restricted-haar-product*.


<a id="partial-fourier-transform"></a>

**Partial Fourier transformation.** For a product X×V and an admitted Schwartz function Φ, define F_V⁺Φ(x,w)=∫_VΦ(x,v)ψ(B(v,w))dv with the ψ-self-dual measure. The transform acts only in V and preserves the appropriate Schwartz carrier. On a product f⊗g it is f⊗F⁺g.

Work under the following hypotheses. X is a finite-dimensional local vector space for the carrier comparison; applications on an affine variety use the supplied Schwartz realization, not a newly invented intrinsic carrier.

Require the following API.

- `AL0.PartialFourierTransform.product`: F_V(f⊗g)=f⊗Fg.
- `AL0.PartialFourierTransform.square`: F_V²Φ(x,v)=Φ(x,−v).
- `AL0.PartialFourierTransform.commute`: Transforms in two disjoint factors commute.
- `AL0.PartialFourierTransform.negative_kernel`: F_V⁺Φ(x,w)=F_V⁻Φ(x,−w).

**Checks.**

- `AL0.PartialFourierTransform.pure_tensor`: A Gaussian in V leaves the factor f(x) unchanged.
- `AL0.PartialFourierTransform.zero_v_space`: In dimension0 the partial transform is the identity with point mass1.
- A nonconstant f(x) is not Fourier transformed when only V is selected.

(Source: [Zhang](#ref-zhang2021), §11.1, printed p.933 (physical p.71).)

*Needs:* [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space).


### Bessel transforms


<a id="bessel-k"></a>

**The K-Bessel kernel.** For c>0 and ν∈ℂ, K_ν(c) = (1/2)∫₀∞ exp(−c(u+u⁻¹)/2) exp(ν log u) du/u. Use the ordinary real logarithm on positive u; the function at c≤0 is outside this interface.

Work under the following hypotheses. c is a positive real number; integration is with respect to Lebesgue measure on (0,∞).

Require the following API.

- `AL0.BesselK.integral`: K_ν(c) is the displayed convergent integral for c>0.
- `AL0.BesselK.even`: K_{−ν}(c)=K_ν(c).
- `AL0.BesselK.entire_order`: ν↦K_ν(c) is entire; its j-th derivative inserts (log u)^j.
- `AL0.BesselK.half`: K_{1/2}(c)=sqrt(π/(2c)) exp(−c).

**Checks.**

- `AL0.BesselK.half_at_one`: K_{1/2}(1)=sqrt(π/2)/e.
- K_{−1/2}(2)=K_{1/2}(2)=sqrt(π/4)e⁻².
- `AL0.BesselK.zero_order_positive`: K_0(c)>0 for c>0, including c=1.
- `AL0.BesselK.not_even_in_argument`: The integral diverges at c=0, ν=0: the positivity restriction cannot be dropped.

(Source: [Zhang](#ref-zhang2021), §12.4, p.942, definition preceding Lemma12.3.)

*Needs:* Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; Mathlib `mellin_differentiableAt_of_isBigO_rpow`; Mathlib `Complex.integral_cpow_mul_exp_neg_mul_Ioi`.


<a id="bessel-half-order-derivative"></a>

**The half-order derivative of K.** For c>0, ∂_νK_ν(c)|_{ν=1/2}=−sqrt(π/2) exp(c)c^(−1/2) Ei(−2c), where Ei(−r)=−∫ᵣ∞ exp(−t)dt/t for r>0.

Work under the following hypotheses. c>0; both integrals use real Lebesgue measure.

The light real-valued function `AL0.negativeEi(r)` has domain ℝ and body
−∫_{t>r}exp(−t)/t dt; the public analytic statements require r>0. Its API gives
negativity for r>0, derivative exp(−r)/r and the limit zero as r→∞.

**Checks.**

- At r=1 the value is strictly negative, whereas reversing the leading sign gives a positive value.
- At r=2 its derivative is exp(−2)/2, which distinguishes differentiation in r from differentiation in −r.
- Its limit at +∞ is zero; adding a nonzero integration constant violates this normalization.


(Source: [Zhang](#ref-zhang2021), §12.4, p.943, last display in proof of Lemma12.3.)

*Needs:* [The K-Bessel kernel](#bessel-k); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.


<a id="bessel-laplace-mellin"></a>

**The Bessel–Laplace Mellin identity.** For m>0 and real t with 0<t<Re(s), the integral of y^(s−1/2)K_(t+1/2)(2πmy)exp(−2πmy) over y>0 is sqrt(π)Γ(s+t+1)Γ(s−t)/(Γ(s+1)(4πm)^(s+1/2)). Both sides extend holomorphically to t=0 for Re(s)>0.

Work under the following hypotheses. Complex power uses the real logarithm of positive y and4πm; t may be complex in the continued neighbourhood of0.

(Source: [Gross–Zagier](#ref-grosszagier1986), IV §6, proof of Proposition(6.2), unnumbered displayed integral, printed p.299 (physical p.76).)

*Needs:* [The K-Bessel kernel](#bessel-k); [Domination for Schwartz parameter integrals](#schwartz-parameter-domination); Mathlib `Complex.integral_cpow_mul_exp_neg_mul_Ioi`.


### Examples

For Z/4 with counting measure, the native negative transform of the indicator of {1} at frequency 1 is −i. For Z/2 the double counting-measure transform is 2f(−x); the self-dual normalization removes the factor 2. Over ℂ, the Gaussian exp(−2π|z|²) has Lebesgue integral 1/2, so its self-dual mass is 1 with 2 dxdy.

### Dependencies

Mathlib character, Fourier, measure, Schwartz and distribution APIs; GlobalNumberFields layers 0 and 5–6; LocalFieldsRamification layer 3; AdelicAlgebraicGroups §§0.1–0.4; SmoothRepresentationsOfLocalGroups SR.1.1.


## Layer AL.1: Tate zeta distributions and Hecke L-functions


### Quasi-characters and eigen-distribution spaces


<a id="local-quasicharacter-conductor"></a>

**Local quasi-characters, unramified characters and the conductor exponent.** A quasi-character of F^× is a continuous homomorphism ω : F^× → ℂ^×; it is a character if |ω| = 1. There is a unique real σ (the exponent) with |ω(x)| = |x|^σ, so ω = ω_u·ω_σ with ω_u a character. For F nonarchimedean, ω is unramified if ω is trivial on O^×; the unramified quasi-characters are exactly x ↦ t^{ord x} = |x|^s with t = q^{−s} ∈ ℂ^×, s determined modulo 2πi/log q (Tate Lemma 2.3.1). For ramified ω the conductor exponent c(ω) is the smallest integer c ≥ 1 with ω trivial on 1 + P^c; put c(ω) = 0 for unramified ω. For F = ℝ every quasi-character is ωω_s with ω(x) = x^{−a}, a ∈ {0, 1} (Kudla (3.18)); for F = ℂ it is ωω_s with ω(x) = x^{−a}x̄^{−b}, a, b ∈ ℤ, min(a, b) = 0 (Kudla (3.20)). Use the attained `ClassFieldTheory.characterConductorExp` supplied by **ClassFieldTheory**, layer 7, as this integer; its arithmetic construction is supplied there.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. The archimedean normal forms are Kudla's (after Weil); they differ from the common sgn^a normalisation: sgn(x) = x^{−1}|x|, so sgn = x^{−1}·ω_1.

Require the following API.

- `TateZeta.QuasiChar.exponent`: The real σ with |ω(x)| = |x|^σ.
- `TateZeta.QuasiChar.absPow`: ω_s(x) = |x|^s.
- `TateZeta.QuasiChar.IsUnramified`: ω trivial on O^× (finite places).
- `TateZeta.QuasiChar.isUnramified_iff`: ω unramified iff ω = ω_s for some s, unique modulo 2πi/log q.
- `TateZeta.QuasiChar.conductor_mul_absPow`: c(ωω_s) = c(ω).
- `TateZeta.QuasiChar.archNormalForm`: At ℝ, ℂ: ω = x^{−a}(x̄^{−b})·ω_s with the stated constraints, uniquely.

**Checks.**

- `TateZeta.QuasiChar.absPow_isUnramified`: ω_s is unramified with c = 0, and ω_s(ϖ) = q^{−s}.
- `TateZeta.QuasiChar.conductor_dirichlet`: For p odd and χ a primitive Dirichlet character mod p^n, the induced ω on ℚ_p^× (ω(p) = 1) has c(ω) = n.
- `TateZeta.QuasiChar.sgn_normalForm`: At ℝ, sgn = x^{−1}·ω_1: a = 1 and s = 1 in (3.18).
- `TateZeta.QuasiChar.one_conductor`: The trivial character has exponent 0 and conductor 0.
- `TateZeta.QuasiChar.not_unramified_teichmuller`: The Teichmüller-type character of ℤ_p^× (p odd) extended by ω(p) = 1 is ramified with conductor 1, although it is trivial on 1 + pℤ_p.

Use the native continuous-homomorphism carrier `ContinuousMonoidHom Fˣ ℂˣ` without a second quasi-character type.
The norm-power construction has intended signature: a positive continuous homomorphism
a:Fˣ→ℝˣ and s∈ℂ determine a continuous homomorphism Fˣ→ℂˣ with value exp(s log(a(x))).
Here a is the normalized local absolute value in the arithmetic specialization.


(Source: [Kudla](#ref-kudla2004), §3, "The ramified local theory", printed p. 120 (physical p. 12); [Kudla](#ref-kudla2004), §3, "The archimedean case", printed p. 121 (physical p. 13).)

*Needs:* Mathlib `ContinuousMonoidHom`; [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); Tau Ceti **ClassFieldTheory**, layer 7 the absolute local artin map its normalizations and conductors; Tau Ceti **GlobalNumberFields**, layer 0 places completions and the product formula; Tau Ceti **GlobalNumberFields**, layer 10 archimedean characters infinity types and cyclotomic arithmetic.


<a id="local-zeta-integral"></a>

**The local Tate zeta integral z(s, ω; f).** For a character ω of F^×, s ∈ ℂ with Re s > 0 and f ∈ S(F), z(s, ω; f) = ∫_{F^×} f(x)ω(x)|x|^s d^×x converges absolutely (Kudla (3.3)); s ↦ z(s, ω; f) is holomorphic on Re s > 0 (Tate Lemma 2.4.1, differentiation under the integral), and f ↦ z(s, ω; f) is a nonzero element z(s, ω) ∈ S′(ωω_s). In Tate's notation, ζ(f, c) = ∫ f(α)c(α)d^×α for quasi-characters c of exponent > 0, and z(s, ω; f) = ζ(f, ωω_s). The integral satisfies z(s, ωω_t; f) = z(s + t, ω; f) and z(s, ω; r(a)f) = (ωω_s)(a)^{−1}z(s, ω; f).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}. Rescaling d^×x by c>0 rescales z and z₀=z/L by c, since L is fixed. It leaves ε and γ unchanged when both sides use the same rescaling and the additive Fourier measure is fixed. A standard test vector with z₀-value1 must then be rescaled by c^(−1). ω unitary; the quasi-character case is the twist ω_t.

Require the following API.

- `TateZeta.zetaIntegral`: z(s, ω; f) = ∫_{F^×} f(x)ω(x)|x|^s d^×x.
- `TateZeta.zetaIntegral_integrable`: Absolute convergence for Re s > 0.
- `TateZeta.differentiableOn_zetaIntegral`: s ↦ z(s, ω; f) is holomorphic on Re s > 0.
- `TateZeta.zetaIntegral_twist`: z(s, ωω_t; f) = z(s + t, ω; f).
- `TateZeta.zetaIntegral_act`: z(s, ω; r(a)f) = (ωω_s)(a)^{−1} z(s, ω; f).
- `TateZeta.zetaDistribution`: z(s, ω) ∈ S′(ωω_s), linear in f.
- `TateZeta.zetaIntegral_measure_scale`: For c>0, z_(c d×x)(s,ω;f)=c z_(d×x)(s,ω;f), hence z₀_(c d×x)=c z₀_(d×x) with L fixed.

**Checks.**

- `TateZeta.zetaIntegral_unramified_standard`: ω(ϖ) = t: z(s, ω; 1_O) = (1 − tq^{−s})^{−1}.
- `TateZeta.zetaIntegral_gaussian_real`: z(s, 1; e^{−πx²}) = Complex.Gammaℝ s at ℝ.
- `TateZeta.zetaIntegral_gaussian_complex`: z(s, 1; e^{−2πxx̄}) = (2π)^{1−s}Γ(s) = π·Complex.Gammaℂ s at ℂ (twice-Lebesgue dx).
- `TateZeta.zetaIntegral_ramified_integers`: ω ramified: z(s, ω; 1_O) = 0, since ∫_{O^×} ω d^×x = 0 on every annulus.
- `TateZeta.zetaIntegral_not_convergent`: ω = 1, f = 1_O, s = 0: Σ_{n≥0} q^{−n·0} diverges, so the half-plane Re s > 0 is sharp.
- `TateZeta.zetaIntegral_normalized_measure_scale`: Doubling the multiplicative measure doubles z/L. It does not leave this normalized distribution fixed; halving f restores its standard value.

The intended `TateZeta.zetaDistribution` signature takes a complex vector space V,
a linear inclusion ι:V→(G→ℂ), a measure μ on the measurable carrier G, and integrability
of ι(f)(x)ω(x)a(x)^s for every f; its output is a complex linear functional V→ℂ with
the displayed integral as value. At infinity the target also proves continuity for the
Schwartz topology. Integrability is an explicit input to this linear construction.


(Source: [Kudla](#ref-kudla2004), §3, "Zeta integrals", printed p. 117 (physical p. 9); [Tate](#ref-tate1950), §2.4, physical pp. 16–17, Definition 2.4.1 and Lemma 2.4.1.)

*Needs:* [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor); [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); **AdelicAlgebraicGroups**, AA.0; Mathlib `Complex.Gammaℝ`; Mathlib `Complex.Gammaℂ`; Mathlib `Complex.integral_cpow_mul_exp_neg_mul_Ioi`; Mathlib `mellin`.


<a id="eigendistribution-space"></a>

**The spaces S′(ω) of ω-eigendistributions.** For a quasi-character ω of F^×, S′(ω) = {λ ∈ S(F)′ : r′(a)λ = ω(a)λ for all a ∈ F^×} (Kudla Definition 3.1). Restriction along C_c^∞(F^×) ⊂ S(F) gives an exact sequence 0 → S′(ω)₀ → S′(ω) → C_c^∞(F^×)′(ω) (3.2), where S′(ω)₀ is the space of ω-eigendistributions supported at 0 (vanishing on C_c^∞(F^×)); here C_c^∞(F^×) means locally constant compactly supported functions at a finite place.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. At ℝ, ℂ, C_c^∞(F^×) ⊂ 𝓢(F, ℂ) consists of smooth functions with compact support in F^×.

Require the following API.

- `TateZeta.eigenSpace`: S′(ω) as a submodule of S(F)′.
- `TateZeta.mem_eigenSpace`: λ ∈ S′(ω) ↔ ∀ a, r′(a)λ = ω(a)λ.
- `TateZeta.eigenSpaceZero`: S′(ω)₀: eigendistributions vanishing on C_c^∞(F^×).
- `TateZeta.eigenSpace_restrict_exact`: The left exact sequence (3.2).
- `TateZeta.zetaDistribution_mem`: z(s, ω) ∈ S′(ωω_s) for Re s > 0.

**Checks.**

- `TateZeta.delta_mem_eigenSpace_one`: δ₀ ∈ S′(1).
- `TateZeta.haar_restrict_mem`: f ↦ ∫ f(x)ω(x)d^×x on C_c^∞(F^×) is an ω-eigendistribution.
- `TateZeta.delta_not_mem`: For ω ≠ 1, δ₀ ∉ S′(ω), since r′(a)δ₀ = δ₀.
- `TateZeta.zetaDistribution_mem_eigenSpace`: z(s, ω) ∈ S′(ωω_s) for Re s > 0: its eigencharacter is ωω_s, not ω.

For the algebraic specialization, the intended signature takes a group action
ρ:G→End_ℂ(V) and a character ω:G→ℂˣ and returns the submodule of V's linear dual
cut out by ℓ(ρ(a⁻¹)v)=ω(a)ℓ(v) for every a,v. Given U⊆V, the intended
`TateZeta.eigenSpaceZero` is its intersection with the annihilator of U.
For the local analytic statement U is the punctured compactly supported test space;
the archimedean version uses the continuous dual.


(Source: [Kudla](#ref-kudla2004), §3, Definition 3.1, printed p. 115 (physical p. 7).)

*Needs:* [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor).


<a id="restriction-to-punctured-line"></a>

**Eigendistributions on C_c^∞(F^×) are multiples of ω(x)d^×x (Lemma 3.2).** The space C_c^∞(F^×)′(ω) of ω-eigendistributions on C_c^∞(F^×) is one-dimensional, spanned by ω(x)d^×x. Hence for λ ∈ S′(ω) there is c ∈ ℂ with ⟨λ, f⟩ = c∫_{F^×} f(x)ω(x)d^×x for all f with compact support in F^×.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s.

(Source: [Kudla](#ref-kudla2004), §3, Lemma 3.2, printed p. 116 (physical p. 8).)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); Mathlib `MeasureTheory.Measure.IsHaarMeasure`.


<a id="eigendistributions-supported-at-zero"></a>

**Eigendistributions supported at 0 (Lemma 3.3).** (i) F nonarchimedean: the distributions supported at 0 are ℂ·δ₀, and δ₀ ∈ S′(ω₀) for the trivial ω₀; S′(ω)₀ = 0 for ω ≠ ω₀. (ii) F = ℝ, D = d/dx: the F^×-finite distributions supported at 0 are ⊕_{k≥0} ℂ·D^kδ₀, and S′(ω)₀ = ℂ·D^kδ₀ if ω(x) = x^{−k}, 0 otherwise. (iii) F = ℂ, D = ∂/∂x, D̄ = ∂/∂x̄: they are ⊕_{k,l≥0} ℂ·D^kD̄^lδ₀, and S′(ω)₀ = ℂ·D^kD̄^lδ₀ if ω(x) = x^{−k}x̄^{−l}, 0 otherwise.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. In (ii), (iii) only F^×-finite distributions are classified (Kudla footnote 8).

(Source: [Kudla](#ref-kudla2004), §3, Lemma 3.3, printed pp. 116–117 (physical pp. 8–9).)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Tempered distributions supported at a point](#point-supported-distributions).


### Local normal forms, uniqueness and the exceptional extension


<a id="unramified-local-theory"></a>

**Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω).** Let F be nonarchimedean and ω unramified with ω(ϖ) = t; put L(s, ω) = (1 − tq^{−s})^{−1}. For τ = [1] − [ϖ^{−1}] ∈ ℤ[F^×] and f ∈ S(F), r(τ)f = f − r(ϖ^{−1})f has compact support in F^×, so ⟨z₀(s, ω), f⟩ = ∫_{F^×}(r(τ)f)(x)ωω_s(x)d^×x (3.5) is entire in s and z₀(s, ω) ∈ S′(ωω_s). When ‖tq^(−s)‖<1, equivalently Re(s)>log‖t‖/log q, z(s, ω) = L(s, ω)z₀(s, ω) (3.6); this identity continues z(s, ω) meromorphically to ℂ. For unitary ω the convergence region is Re(s)>0. With f^o = 1_O, ⟨z₀(s, ω), f^o⟩ = 1 for all s (3.8); so z₀(s, ω) is never zero, z(s, ω; f)/L(s, ω) is entire for every f, and for each s some f (namely f^o) makes it nonzero: L(s, ω) is the greatest common denominator of the zeta integrals (3.9).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}. Rescaling d^×x by c>0 rescales z and z₀=z/L by c, since L is fixed. It leaves ε and γ unchanged when both sides use the same rescaling and the additive Fourier measure is fixed. A standard test vector with z₀-value1 must then be rescaled by c^(−1).

(Source: [Kudla](#ref-kudla2004), §3, "The unramified local theory", printed pp. 118–119 (physical pp. 10–11), (3.4)–(3.9); [Kudla](#ref-kudla2004), §3, printed p. 119 (physical p. 11).)

*Needs:* [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); Mathlib `tsum_geometric_of_norm_lt_one`.


<a id="invariant-distributions-exceptional-case"></a>

**The invariant distributions: S′(ω₀) is one-dimensional.** At a finite place, the F^×-invariant distributions S′(ω₀) form the line ℂ·δ₀, although (3.11) only bounds the dimension by 2. The distribution ⟨λ₀, f⟩ = ⟨d^×x, f − f(0)f^o⟩ (3.12) is an O^×-invariant preimage of d^×x with ⟨λ₀, f^o⟩ = 0, and r′(ϖ)λ₀ = λ₀ − δ₀ (3.13). So F^× acts on the span of δ₀, λ₀ through x ↦ [[1, −ord x], [0, 1]] (3.14), a non-semisimple representation whose invariants are ℂ·δ₀; d^×x does not extend to an F^×-invariant distribution on S(F).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. f^o = 1_O; the matrix (3.14) is written in the ordered basis (δ₀, λ₀).

(Source: [Kudla](#ref-kudla2004), §3, Example, printed pp. 119–120 (physical pp. 11–12), (3.10)–(3.14).)

*Needs:* [Eigendistributions supported at 0 (Lemma 3.3)](#eigendistributions-supported-at-zero); [Eigendistributions on C_c^∞(F^×) are multiples of ω(x)d^×x (Lemma 3.2)](#restriction-to-punctured-line); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory).


<a id="ramified-local-theory"></a>

**Ramified local theory: z(s, ω) is entire and L(s, ω) = 1.** Let F be nonarchimedean and ω ramified with conductor c. For f ∈ S(F), ∫_{F^× − P^n} f(x)ωω_s(x)d^×x is independent of n for n large, which continues z(s, ω; f) to an entire function; z₀(s, ω) := z(s, ω) is a basis vector of S′(ωω_s) for every s (3.15), and L(s, ω) := 1 (3.16). The standard function f^o = ω^{−1}·1_{O^×} (3.17) has ⟨z₀(s, ω), f^o⟩ = 1, so the gcd property (3.9) holds.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}. Rescaling d^×x by c>0 rescales z and z₀=z/L by c, since L is fixed. It leaves ε and γ unchanged when both sides use the same rescaling and the additive Fourier measure is fixed. A standard test vector with z₀-value1 must then be rescaled by c^(−1).

(Source: [Kudla](#ref-kudla2004), §3, "The ramified local theory", printed p. 120 (physical p. 12).)

*Needs:* [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Eigendistributions on C_c^∞(F^×) are multiples of ω(x)d^×x (Lemma 3.2)](#restriction-to-punctured-line); [Eigendistributions supported at 0 (Lemma 3.3)](#eigendistributions-supported-at-zero); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor).


<a id="archimedean-local-theory"></a>

**Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5).** F = ℝ: for ω(x) = x^{−a}, a ∈ {0, 1}, put L(s, ω) = π^{−s/2}Γ(s/2) (3.19) and f^o = f_a = x^a e^{−πx²}. F = ℂ: for ω(x) = x^{−a}x̄^{−b}, min(a, b) = 0, put L(s, ω) = (2π)^{1−s}Γ(s) (3.21) and f^o = f_{a,b} = x^a x̄^b e^{−2πxx̄}. Then (i) z₀(s, ω) := L(s, ω)^{−1}z(s, ω) continues to an entire function of s and is a basis vector of S′(ωω_s) for every s; (ii) ⟨z₀(s, ω), f^o⟩ = 1. (iii) z(s, ω) is meromorphic with simple poles exactly at the poles of L(s, ω): at F = ℝ, s = −r with r ∈ 2ℤ_{≥0}, residue a nonzero multiple of D^{a+r}δ₀ ∈ S′(ωω_{−r}); at F = ℂ, s = −r with r ∈ ℤ_{≥0}, residue a nonzero multiple of D^{a+r}D̄^{b+r}δ₀. At a pole the constant term of the Laurent expansion extends ωω_{−r}(x)d^×x to S(F) but not to an element of S′(ωω_{−r}).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}. Rescaling d^×x by c>0 rescales z and z₀=z/L by c, since L is fixed. It leaves ε and γ unchanged when both sides use the same rescaling and the additive Fourier measure is fixed. A standard test vector with z₀-value1 must then be rescaled by c^(−1). Kudla's normalisations are Weil's: L(s, ω) does not depend on a (resp. a, b), unlike the sgn^a normalisation. For a general Schwartz input the initial absolutely convergent region is Re(s)>a over R and Re(s)>(a+b)/2 over C. Cancellation by the special f_a or f_{a,b} improves its own integral to Re(s)>0; it does not improve convergence for every Schwartz input.

(Source: [Kudla](#ref-kudla2004), §3, "The archimedean case", Proposition 3.5 and (3.22), printed pp. 121–122 (physical pp. 13–14); [Tate](#ref-tate1950), §2.5, "k real" and "k complex", physical pp. 20–23.)

*Needs:* [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Eigendistributions on C_c^∞(F^×) are multiples of ω(x)d^×x (Lemma 3.2)](#restriction-to-punctured-line); [Eigendistributions supported at 0 (Lemma 3.3)](#eigendistributions-supported-at-zero); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor); Mathlib `Complex.Gammaℝ`; Mathlib `Complex.Gammaℂ`; Mathlib `Complex.Gammaℝ_mul_Gammaℝ_add_one`; Mathlib `Complex.integral_cpow_mul_exp_neg_mul_Ioi`; [Tempered distributions supported at a point](#point-supported-distributions); [Domination for Schwartz parameter integrals](#schwartz-parameter-domination).


<a id="local-uniqueness-theorem"></a>

**Local uniqueness: dim S′(ω) = 1 (Theorem 3.4).** For every quasi-character ω of F^×, the space S′(ω) of ω-eigendistributions on S(F) is one-dimensional. Writing ω = ω′ω_s with ω′ a character (or an archimedean normal form), it is spanned by z₀(s, ω′).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s.

(Source: [Kudla](#ref-kudla2004), §3, Theorem 3.4, printed p. 117 (physical p. 9); [Kudla](#ref-kudla2004), §3, printed p. 120 (physical p. 12).)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Eigendistributions on C_c^∞(F^×) are multiples of ω(x)d^×x (Lemma 3.2)](#restriction-to-punctured-line); [Eigendistributions supported at 0 (Lemma 3.3)](#eigendistributions-supported-at-zero); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [The invariant distributions: S′(ω₀) is one-dimensional](#invariant-distributions-exceptional-case); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory).


<a id="fourier-transform-eigendistribution"></a>

**The Fourier transform of an ω-eigendistribution (Lemma 3.6).** If λ ∈ S′(ω), then λ̂ ∈ S′(ω^{−1}ω₁), where ω₁(x) = |x| and ⟨λ̂, f⟩ = ⟨λ, f̂⟩. Consequently ẑ₀(s, ω) is a multiple of z₀(1 − s, ω^{−1}).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. f̂ is taken with the self-dual measure for a fixed nontrivial ψ.

(Source: [Kudla](#ref-kudla2004), §3, Lemma 3.6, printed p. 122 (physical p. 14).)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); [Local uniqueness: dim S′(ω) = 1 (Theorem 3.4)](#local-uniqueness-theorem).


### Local epsilon factors and Gauss sums


<a id="local-epsilon-gamma-factors"></a>

**The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ).** For a character ω, a nontrivial ψ and the self-dual dx, ε(s, ω, ψ) ∈ ℂ^× is the unique constant with ẑ₀(1 − s, ω^{−1}) = ε(s, ω, ψ)z₀(s, ω) (3.23), and γ(s, ω, ψ) = ε(s, ω, ψ)L(1 − s, ω^{−1})/L(s, ω) (3.26). Properties: ε(s, ω, ψ) = ⟨z₀(1 − s, ω^{−1}), f̂^o⟩ for the standard f^o (3.27); ε(s, ωω_t, ψ) = ε(s + t, ω, ψ) (3.28); ε(s, ω, ψ_β) = |β|^{s−1/2}ω(β)ε(s, ω, ψ) (3.29); ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1); |ε(1/2, ω, ψ)| = 1. Tate's factor is ρ(ωω_s) = 1/γ(s, ω, ψ) (for ψ = e^{2πiΛ}).

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ω a character; archimedean ω in Kudla's normal form; L(1 − s, ω^{−1}) is read after rewriting ω^{−1} in normal form times ω_t. The norm identity at1/2 assumes ω unitary. General quasi-character identities are obtained by twists; the assertion of unit norm is not made for all twists.

Require the following API.

- `TateZeta.epsilonFactor`: ε(s, ω, ψ) ∈ ℂ^×, defined by (3.23).
- `TateZeta.gammaFactor`: γ(s, ω, ψ) = ε L(1 − s, ω^{−1})/L(s, ω), meromorphic in s.
- `TateZeta.epsilonFactor_eq_standard`: (3.27): ε = ⟨z₀(1 − s, ω^{−1}), f̂^o⟩.
- `TateZeta.epsilonFactor_twist`: (3.28): ε(s, ωω_t, ψ) = ε(s + t, ω, ψ).
- `TateZeta.epsilonFactor_smul_char`: (3.29): ε(s, ω, ψ_β) = |β|^{s−1/2}ω(β)ε(s, ω, ψ).
- `TateZeta.epsilonFactor_mul_inv`: ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1).
- `TateZeta.norm_epsilonFactor_half`: |ε(1/2, ω, ψ)| = 1.

**Checks.**

- `TateZeta.epsilonFactor_unramified_zero`: ω unramified, ν(ψ) = 0: ε(s, ω, ψ) = 1, as f̂^o = f^o.
- `TateZeta.epsilonFactor_real_sign`: F = ℝ, ω = x^{−1}, ψ = e: ε = i and γ(s, x^{−1}, e) = iΓ_ℝ(3 − s)/Γ_ℝ(s) (ω^{−1} = x = x^{−1}ω₂).
- `TateZeta.gammaFactor_real_trivial`: F = ℝ, ω = 1, ψ = e: 1/γ(s) = Γ_ℝ(s)/Γ_ℝ(1 − s) = Complex.Gammaℂ s · cos(πs/2).
- `TateZeta.epsilonFactor_trivial_twist`: ε(s, ω_t, ψ) = ε(s + t, 1, ψ) with the same ψ.
- `TateZeta.epsilonFactor_depends_on_psi`: ε is not independent of ψ: at a finite place ε(s, 1, ψ_ϖ) = q^{1/2−s}ε(s, 1, ψ) by (3.29).

The light `TateZeta.gammaFactor` is the scalar formula ε(s)L_dual(1−s)/L(s).
Its checks are: if both L-values are 1 it gives ε(s); at ε=2,L=3,L_dual=5 it
gives 10/3 rather than 6/5; for a real trivial constituent its gamma quotient
is Γ_R(1−s)/Γ_R(s), the inverse of Tate's rho quotient at regular points.


(Source: [Kudla](#ref-kudla2004), §3, Corollary 3.7 and (3.23)–(3.29), printed p. 123 (physical p. 15); [Tate](#ref-tate1950), §2.4, Lemma2.4.3 and Corollary2.4.1, physical pp.18–19.)

*Needs:* [Local uniqueness: dim S′(ω) = 1 (Theorem 3.4)](#local-uniqueness-theorem); [The Fourier transform of an ω-eigendistribution (Lemma 3.6)](#fourier-transform-eigendistribution); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion).


<a id="local-functional-equation"></a>

**Tate's local functional equation (Corollary 3.7).** For every f ∈ S(F), as meromorphic functions of s, z(1 − s, ω^{−1}; f̂) = γ(s, ω, ψ)z(s, ω; f) (3.25); equivalently z(1 − s, ω^{−1}; f̂)/L(1 − s, ω^{−1}) = ε(s, ω, ψ)·z(s, ω; f)/L(s, ω) (3.24), both sides entire. In Tate's form (Theorem 2.4.1): every ζ-function continues to all quasi-characters by ζ(f, c) = ρ(c)ζ(f̂, ĉ), ĉ = |·|c^{−1}, with ρ independent of f.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ω a character; f̂ for ψ with the self-dual measure.

(Source: [Kudla](#ref-kudla2004), §3, Corollary 3.7 and (3.24)–(3.25), printed p. 123 (physical p. 15); [Tate](#ref-tate1950), §2.4, Lemma 2.4.2 and Theorem 2.4.1, physical pp. 17–19.)

*Needs:* [The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)](#local-epsilon-gamma-factors); [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion).


<a id="local-gauss-sum"></a>

**The local Gauss sum 𝔤(ω, ψ).** For F nonarchimedean, ω ramified with conductor c and ψ of conductor ν, 𝔤(ω, ψ) = q^{(ν+c)/2}∫_{O^×} ω^{−1}(y)ψ(ϖ^{−ν−c}y)dy with dy self-dual for ψ. Then the transform of the standard function f^o = ω^{−1}1_{O^×} is f̂^o(x) = 𝔤(ω, ψ)q^{−(ν+c)/2}·conj(f^o(ϖ^{ν+c}x)) (3.31), vanishing unless ord x = −ν − c; and 𝔤(ω, ψ)·conj(𝔤(ω, ψ)) = 1. The product ω(ϖ^{ν+c})𝔤(ω, ψ) does not depend on the choice of ϖ.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ω a character (unitary), ramified.

Require the following API.

- `TateZeta.localGaussSum`: 𝔤(ω, ψ) = q^{(ν+c)/2}∫_{O^×}ω^{−1}(y)ψ(ϖ^{−ν−c}y)dy.
- `TateZeta.fourier_standard_ramified`: (3.31): f̂^o(x) = 𝔤 q^{−(ν+c)/2} conj(f^o(ϖ^{ν+c}x)).
- `TateZeta.localGaussSum_mul_conj`: 𝔤(ω, ψ)·conj 𝔤(ω, ψ) = 1.
- `TateZeta.localGaussSum_uniformizer`: ω(ϖ^{ν+c})𝔤(ω, ψ) is independent of ϖ.
- `TateZeta.localGaussSum_eq_gaussSum`: For c = 1 it is q^{−1/2} times Mathlib's gaussSum of the residue characters.

**Checks.**

- `TateZeta.localGaussSum_padic_conductor_one`: F = ℚ_p, c = 1, ν = 0: 𝔤 = p^{−1/2}·gaussSum(χ^{−1}, ψ₁) with χ = ω|_{ℤ_p^×} on 𝔽_p^× and ψ₁(a) = ψ(a/p).
- `TateZeta.norm_localGaussSum`: |𝔤(ω, ψ)| = 1, recovering |gaussSum| = √p for c = 1.
- `TateZeta.fourier_standard_support`: f̂^o(x) = 0 whenever ord x ≠ −ν − c.
- `TateZeta.localGaussSum_wrong_shift`: With ϖ^(−ν−c+1) the integral vanishes. For c>1 use the last nontrivial principal-unit quotient; for c=1 the additive phase is constant on O× and the nontrivial residue character sums to0.

For the light scalar integral, an empty integration set gives zero. As a finite
algebraic check over 𝔽₂ with counting measure, U={1}, ϖ=1, q=2, ν=0, c=1,
ω=1 and the nontrivial additive character give −sqrt(2). This check fixes the
prefactor and phase of the scalar formula; the norm-one theorem uses the genuine
local-field unit group and ramified-character hypotheses stated above.


(Source: [Kudla](#ref-kudla2004), §3, Proposition 3.8(ii) and (3.31)–(3.32), printed pp. 124–125 (physical pp. 16–17); [Tate](#ref-tate1950), §2.5, "k 𝔭-adic", physical pp. 24–26.)

*Needs:* [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); Mathlib `gaussSum`; Mathlib `gaussSum_mul_gaussSum_eq_card`.


<a id="explicit-epsilon-factors"></a>

**Explicit local ε-factors (Proposition 3.8).** (i) F nonarchimedean, ω unramified, ν(ψ) = ν: ε(s, ω, ψ) = ω(ϖ^ν)q^{(1/2−s)ν}. (ii) ω ramified with conductor c: ε(s, ω, ψ) = ω(ϖ^{ν+c})q^{(1/2−s)(ν+c)}𝔤(ω, ψ). (iii) F = ℝ, ω(x) = x^{−a}, a ∈ {0, 1}, ψ = e: ε(s, ω, ψ) = i^a. (iv) F = ℂ, ω(x) = x^{−a}x̄^{−b}, min(a, b) = 0, ψ = e(x + x̄): ε(s, ω, ψ) = i^{max(a,b)}. In Tate's normalisation (ψ with conductor 𝔡^{−1}, so ν = ord 𝔡): ρ(|·|^s) = N𝔡^{s−1/2}(1 − q^{s−1})/(1 − q^{−s}) and ρ(c|·|^s) = N(𝔡𝔣)^{s−1/2}ρ₀(c) for ramified c with conductor 𝔣 and c(π) = 1.

Work under the following hypotheses. F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ψ standard at ℝ, ℂ as in (3.30); at a finite place (3.28) and (3.29) reduce to ν = 0 and a fixed ω.

(Source: [Kudla](#ref-kudla2004), §3, Proposition 3.8 and its proof, printed pp. 124–125 (physical pp. 16–17); [Tate](#ref-tate1950), §2.5, physical pp. 20–27.)

*Needs:* [The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)](#local-epsilon-gamma-factors); [The local Gauss sum 𝔤(ω, ψ)](#local-gauss-sum); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor).


### Canonical archimedean factors


<a id="canonical-archimedean-factor"></a>

**Canonical archimedean factors.** For unitary-normalized characters, L_R(s,sgn^a|·|^t)=Γ_R(s+t+a), a∈{0,1}, and L_C(s,(z/|z|)^κ|·|_C^t)=Γ_C(s+t+|κ|/2). For a real discrete-series block D_k⊗|det|^t use Γ_C(s+t+(k−1)/2), k≥2. General GL_n archimedean factors multiply over the imported Weil constituents. Kudla’s complex Gaussian zeta normalization is πΓ_C, so its distribution is rescaled to the canonical factor.

Work under the following hypotheses. Γ_R=π^(−s/2)Γ(s/2); Γ_C=2(2π)^(−s)Γ(s); |z|_C=zz̄.

Require the following API.

- `AL1.CanonicalArchimedeanFactor.real`: Real factors are Γ_R(s+t+a).
- `AL1.CanonicalArchimedeanFactor.complex`: Complex factors are Γ_C(s+t+|κ|/2).
- `AL1.CanonicalArchimedeanFactor.discrete_series`: The weight-k block has Γ_C(s+t+(k−1)/2).
- `AL1.CanonicalArchimedeanFactor.direct_sum`: Weil direct sums multiply the gamma factors.

**Checks.**

- `AL1.CanonicalArchimedeanFactor.real_trivial`: a=t=0 gives Γ_R(s).
- `AL1.CanonicalArchimedeanFactor.complex_negative_weight`: κ=−3,t=0 gives Γ_C(s+3/2), equal to κ=3.
- `AL1.CanonicalArchimedeanFactor.weight_two`: D₂ has Γ_C(s+1/2).
- Kudla’s complex Gaussian integral is πΓ_C(s); equating it to Γ_C(s) losesπ.

The numerical formula uses `AL1.GammaBranch`, the sum of the existing carriers
(Fin 2×ℂ), (ℤ×ℂ), and ({k∈ℕ | k≥2}×ℂ), for real, complex and discrete-series
constituents respectively. `AL1.gammaBranch` evaluates the corresponding displayed gamma
formula; `AL1.CanonicalArchimedeanFactor` takes a finite list of those numeric inputs
and multiplies its values. The API gives the three evaluations, the empty product 1,
and multiplication for concatenated lists. The real trivial, negative angular weight
and weight-two checks below discriminate the three branches. These numeric inputs
record the gamma formulas; the Weil-parameter comparison uses AF.1's parameters.


(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.4.2–§2.4.3, (2.7), (2.10), (2.13), pp.6–7.)

*Needs:* [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory); **AutomorphicFormsOnReductiveGroups**, AF.1, *archimedean-llc-gln*.


<a id="archimedean-standard-epsilon"></a>

**The archimedean standard epsilon factor.** For the positive standard Tate character, a real Weil constituent1 has epsilon1, sgn has epsilon i, and I_w=Ind_(W_C)^(W_R)(z/|z|)^w, w≥1, has epsilon i^(w+1). A weight-k discrete-series constituent therefore has epsilon i^k. Over C an angular character of weightκ has epsilon i^|κ|. Direct sums multiply these factors; norm twists do not change these archimedean constants.

Work under the following hypotheses. I_0=1⊕sgn is reducible and gives epsilon i by multiplication. The convention is the one in Chenevier–Taïbi footnote6; a negative Fourier character requires the central-character(-1) comparison.

(Source: [Chenevier–Taïbi](#ref-cheneviertaibi2020), §2.1 p.274, footnote6 and epsilon formula.)

*Needs:* [Explicit local ε-factors (Proposition 3.8)](#explicit-epsilon-factors); [Canonical archimedean factors](#canonical-archimedean-factor); **AutomorphicFormsOnReductiveGroups**, AF.1, *archimedean-llc-gln*.


### Global distributions and completed Euler products


<a id="global-eigendistributions"></a>

**Factorizable distributions and global uniqueness (Lemma 4.1, Theorem 4.2).** A restricted family of continuous local distributions normalized on almost every standard vector defines a continuous restricted-tensor distribution. A nonzero global ω-eigendistribution factors into the local eigenlines and the global eigenline has dimension1. No factorization converse is asserted for arbitrary distributions: a sum of two independent product distributions need not be decomposable.

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

(Source: [Kudla](#ref-kudla2004), §4, Lemma 4.1 and Theorem 4.2, printed p. 126 (physical p. 18); [Kudla](#ref-kudla2004), §4, printed p. 126 (physical p. 18).)

*Needs:* [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); [Local uniqueness: dim S′(ω) = 1 (Theorem 3.4)](#local-uniqueness-theorem); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory); Tau Ceti **GlobalNumberFields**, layer 9 hecke and ray class characters.


<a id="global-zeta-integral"></a>

**The global Tate zeta integral z(s, ω; f).** For a character ω of 𝔸^×/k^× and f ∈ S(𝔸), z(s, ω; f) = ∫_{𝔸^×} f(x)ωω_s(x)d^×x (4.1) converges absolutely for Re s > 1; for factorizable f it is ∏_v z(s, ω_v; f_v) (4.2), and as distributions z(s, ω) = Λ(s, ω)z₀(s, ω) (4.3) there. In Tate's form (Definition 4.4.1), ζ(f, c) = ∫ f(𝔞)c(𝔞)d^×𝔞 for quasi-characters c trivial on k^× of exponent > 1, with Tate's measure d^×𝔞 = ∏_v d^×𝔞_v.

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. d^×x = ∏_v d^×x_v with vol(O_v^×) = 1 at almost all v (Kudla) or N𝔡_v^{−1/2} (Tate). Every local factor z₀ in (4.3) uses the same chosen multiplicative measure as z. Standard f_v^o has z₀-value1 with Kudla’s unit-volume convention; under Tate’s finite-place measure rescale f_v^o by N𝔡_v^(1/2).

Require the following API.

- `TateZeta.globalZetaIntegral`: z(s, ω; f) = ∫_{𝔸^×} f(x)ω(x)|x|^s d^×x.
- `TateZeta.globalZetaIntegral_integrable`: Absolute convergence for Re s > 1.
- `TateZeta.globalZetaIntegral_pure`: (4.2): for f = ⊗f_v, z(s, ω; f) = ∏_v z(s, ω_v; f_v).
- `TateZeta.globalZetaIntegral_eq_completed_mul`: (4.3): z(s, ω; f) = Λ(s, ω)⟨z₀(s, ω), f⟩ for Re s > 1.
- `TateZeta.globalZetaIntegral_act`: z(s, ω; r(a)f) = (ωω_s)(a)^{−1}z(s, ω; f), and = z(s, ω; f) for a ∈ k^×.

**Checks.**

- `TateZeta.globalZetaIntegral_rat_standard`: k = ℚ, ω = 1, f^o = 1_Ẑ ⊗ e^{−πx²}: z(s, 1; f^o) = completedRiemannZeta s for Re s > 1.
- `TateZeta.globalZetaIntegral_unramified_factor`: At v ∉ S the factor of z(s, ω; f^o) is (1 − ω_v(ϖ_v)q_v^{−s})^{−1}.
- `TateZeta.globalZetaIntegral_zero`: z(s, ω; 0) = 0.
- `TateZeta.globalZetaIntegral_not_convergent`: For k = ℚ, ω = 1, f = f^o the integral diverges at s = 1 (the pole of ζ): Re s > 1 cannot be relaxed.

(Source: [Kudla](#ref-kudla2004), §4, (4.1)–(4.5), printed pp. 126–127 (physical pp. 18–19); [Tate](#ref-tate1950), §4.4, Definition 4.4.1, physical p. 49.)

*Needs:* [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Factorizable distributions and global uniqueness (Lemma 4.1, Theorem 4.2)](#global-eigendistributions); **AdelicAlgebraicGroups**, AA.0; [Domination for Schwartz parameter integrals](#schwartz-parameter-domination); Tau Ceti **GlobalNumberFields**, layer 9 hecke and ray class characters; Tau Ceti **ArithmeticDirichletSeries**, layer 3 local factors and euler products; **AdelicAlgebraicGroups**, §0.3, Fubini for restricted product measures.


<a id="completed-hecke-l-function"></a>

**The completed Hecke L-function Λ(s, ω).** For a character ω of 𝔸^×/k^×, Λ(s, ω) = ∏_v L_v(s, ω_v) (4.4) over all places, with the unramified, ramified (L = 1) and archimedean factors; L^S(s, ω) = ∏_{v∉S}L_v(s, ω_v) for a finite set S containing the archimedean and ramified places. Both converge absolutely for Re s > 1. For S ⊇ S_∞ ∪ {ramified v}, L^S(s, ω) = Σ_{𝔞 prime to S} χ(𝔞)N𝔞^{−s}, where χ(𝔭_v) = ω_v(ϖ_v) is the associated ideal character (Kudla §5; Tate §4.5).

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

Require the following API.

- `TateZeta.completedHeckeL`: Λ(s, ω) = ∏_v L_v(s, ω_v), Re s > 1, then continued.
- `TateZeta.partialHeckeL`: L^S(s, ω) = ∏_{v∉S} L_v(s, ω_v).
- `TateZeta.partialHeckeL_eq_LSeries`: L^S(s, ω) = Σ_{(𝔞, S) = 1} χ(𝔞)N𝔞^{−s} for Re s > 1.
- `TateZeta.completedHeckeL_eq_mul`: Λ(s, ω) = ∏_{v∈S}L_v(s, ω_v)·L^S(s, ω).
- `TateZeta.completedHeckeL_eq_globalZeta`: Λ(s,ω)=z(s,ω;f^o) when each standard f_v^o has normalized local z₀-value1: use Kudla’s unit-volume finite measure, or rescale the finite standard vectors by N𝔡_v^(1/2) under Tate’s measure.

**Checks.**

- `TateZeta.completedHeckeL_rat_one`: k = ℚ, ω = 1: Λ(s, 1) = completedRiemannZeta s.
- `TateZeta.completedHeckeL_dirichlet`: k = ℚ, ω attached to a primitive Dirichlet character χ: L_∞ = Γ_ℝ(s) (χ even) or Γ_ℝ(s + 1) (χ odd, ω_∞ = sgn = x^{−1}ω₁), which is Mathlib's DirichletCharacter.gammaFactor, and Λ(s, ω) = gammaFactor χ s · LFunction χ s.
- `TateZeta.partialHeckeL_trivial_char`: ω = 1: L^{S_∞}(s, 1) is the Dedekind zeta function NumberField.dedekindZeta.
- `TateZeta.completedHeckeL_not_product_over_ideals`: Λ(s, ω) is not Σ χ(𝔞)N𝔞^{−s} alone: the archimedean factors and the ramified factors L_v = 1 are part of it.

**Checks for the partial product.**

- For ℚ and the trivial character, removing infinity gives ζ(s) in Re(s)>1.
- Removing infinity and p=2 instead gives (1−2^(−s))ζ(s); the factor is a denominator polynomial, not its inverse.
- Removing infinity and both 2 and 3 gives (1−2^(−s))(1−3^(−s))ζ(s), with each prime removed once.


On a finite two-place scalar model, local values 2 and 3 give completed product
6, while removing the first place gives partial product 3. Removing no place
with two local values 2 gives 4. The arithmetic product identities retain their
absolute-convergence half-plane and continuation hypotheses.


(Source: [Kudla](#ref-kudla2004), §4, (4.4), printed p. 127 (physical p. 19); [Kudla](#ref-kudla2004), §5, printed p. 129 (physical p. 21).)

*Needs:* [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory); [The global Tate zeta integral z(s, ω; f)](#global-zeta-integral); Tau Ceti **ArithmeticDirichletSeries**, layer 3 local factors and euler products.


<a id="idele-class-volume"></a>

**The volume κ of the norm-one idele class group (Tate Lemma 4.3.1, Theorem 4.3.2).** With Tate's measures (d^×α = (N𝔭/(N𝔭 − 1))|α|^{−1}dα at finite v, so vol(O_v^×) = N𝔡_v^{−1/2}; dα/|α| at real v; 2r dr dθ/r² at complex v), the product decomposition 𝔸^× = T × J (T ≅ ℝ_{>0} at a chosen archimedean place, dt/t) and d^×𝔞 = (dt/t)·d^×𝔟, the fundamental domain E for J/k^× built from the units and h ideal-class representatives satisfies (1) J = ⊔_{α∈k^×}αE and (2) vol(E) = κ = 2^{r₁}(2π)^{r₂}hR/(w√|d|), where R is the regulator, h the class number, w the number of roots of unity and d the discriminant. κ agrees with the arithmetic expression defining native NumberField.dedekindZeta_residue K; Mathlib already proves its real one-sided residue identification via NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT. The extra analytic task is its comparison with this adelic measure and the full complex Tate continuation. Discreteness and compactness are imported from GlobalNumberFields, not reproved here. A change to finite multiplicative unit-volume1 rescales κ by sqrt(|d|).

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures, not Kudla's: the value of κ depends on vol(O_v^×) = N𝔡_v^{−1/2}.

(Source: [Tate](#ref-tate1950), §4.3, Lemma 4.3.1, Definition 4.3.2, Theorem 4.3.2 and Corollary 4.3.1, physical pp. 44–48; [Tate](#ref-tate1950), §4.4, Main Theorem 4.4.1, physical p. 50.)

*Needs:* Mathlib `NumberField.dedekindZeta_residue`; Mathlib `NumberField.Units.regulator`; Mathlib `NumberField.classNumber`; Mathlib `NumberField.Units.torsionOrder`; Mathlib `NumberField.discr`; **AdelicAlgebraicGroups**, AA.0; Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; Tau Ceti **GlobalNumberFields**, layer 0 places completions and the product formula; Tau Ceti **GlobalNumberFields**, layer 6 additive strong approximation and ideles.


### Poisson continuation and the global functional equation


<a id="tate-lemma-a"></a>

**Tate's Lemma A: the functional equation of ζ_t.** For f ∈ S(𝔸) (or Tate's class 𝔷), a quasi-character c of 𝔸^×/k^× and t > 0, put ζ_t(f, c) = ∫_J f(t𝔟)c(t𝔟)d^×𝔟. Then ζ_t(f, c) + f(0)∫_E c(t𝔟)d^×𝔟 = ζ_{1/t}(f̂, ĉ) + f̂(0)∫_E ĉ(𝔟/t)d^×𝔟, with ĉ = |·|c^{−1}.

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures; E the fundamental domain of idele-class-volume.

(Source: [Tate](#ref-tate1950), §4.4, Lemma A, physical pp. 50–51.)

*Needs:* [Adelic Poisson summation and Tate's Riemann–Roch theorem](#adelic-poisson-summation); [The volume κ of the norm-one idele class group (Tate Lemma 4.3.1, Theorem 4.3.2)](#idele-class-volume); [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space).


<a id="tate-lemma-b"></a>

**Tate's Lemma B: ∫_E c(t𝔟)d^×𝔟.** For a quasi-character c of 𝔸^×/k^× and t > 0: ∫_E c(t𝔟)d^×𝔟 = κt^s if c = |·|^s on 𝔸^× (c trivial on J), and 0 if c is nontrivial on J.

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures.

(Source: [Tate](#ref-tate1950), §4.4, Lemma B, physical p. 51.)

*Needs:* [The volume κ of the norm-one idele class group (Tate Lemma 4.3.1, Theorem 4.3.2)](#idele-class-volume).


<a id="tate-global-functional-equation"></a>

**Tate's global functional equation (Main Theorem 4.4.1; Kudla Theorem 4.3).** For f ∈ S(𝔸) (more generally f ∈ 𝔷), ζ(f, c) continues from exponent > 1 to a meromorphic, single-valued function on every class {c₀|·|^s} of quasi-characters of 𝔸^×/k^×. It is holomorphic except, when c₀ is trivial on J (c = |·|^s), for simple poles at s = 0 and s = 1 with residues −κf(0) and κf̂(0). It satisfies ζ(f, c) = ζ(f̂, ĉ), ĉ = |·|c^{−1}; explicitly ζ(f, c) = ∫_1^∞ζ_t(f, c)dt/t + ∫_1^∞ζ_t(f̂, ĉ)dt/t + [κf̂(0)/(s − 1) − κf(0)/s], the bracket present only when c = |·|^s. In distributions (Kudla Theorem 4.3): z(s, ω) continues meromorphically and ẑ(1 − s, ω^{−1}) = z(s, ω).

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures in the residue formula; κ from idele-class-volume.

(Source: [Tate](#ref-tate1950), §4.4, Main Theorem 4.4.1 and its proof, physical pp. 50–52; [Kudla](#ref-kudla2004), §4, Theorem 4.3, printed p. 128 (physical p. 20).)

*Needs:* [The global Tate zeta integral z(s, ω; f)](#global-zeta-integral); [Tate's Lemma A: the functional equation of ζ_t](#tate-lemma-a); [Tate's Lemma B: ∫_E c(t𝔟)d^×𝔟](#tate-lemma-b); [The volume κ of the norm-one idele class group (Tate Lemma 4.3.1, Theorem 4.3.2)](#idele-class-volume); [Adelic Poisson summation and Tate's Riemann–Roch theorem](#adelic-poisson-summation); [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); Mathlib `completedRiemannZeta_eq`; Mathlib `completedRiemannZeta_residue_one`.


<a id="global-epsilon-factor"></a>

**The global ε-factor ε(s, ω).** For a character ω of 𝔸^×/k^× and a nontrivial ψ = ∏ψ_v of 𝔸/k, ε(s, ω) = ∏_v ε_v(s, ω_v, ψ_v) (4.6), a finite product since ε_v = 1 when v is finite, ω_v is unramified and ν(ψ_v) = 0. It does not depend on ψ, and ẑ₀(1 − s, ω^{−1}) = ε(s, ω)z₀(s, ω) (4.7). By Proposition 3.8, ε(s, ω) = ε(1/2, ω)·(|d_k|N𝔣(ω))^{1/2−s} for the standard ψ, with 𝔣(ω) = ∏𝔭_v^{c(ω_v)} and |ε(1/2, ω)| = 1.

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

Require the following API.

- `TateZeta.globalEpsilon`: ε(s, ω) = ∏_v ε_v(s, ω_v, ψ_v).
- `TateZeta.globalEpsilon_indep`: ε(s, ω) is the same for every nontrivial ψ trivial on k.
- `TateZeta.globalEpsilon_eq_conductor`: ε(s, ω) = ε(1/2, ω)(|d_k|N𝔣(ω))^{1/2−s}.
- `TateZeta.norm_globalEpsilon_half`: |ε(1/2, ω)| = 1.
- `TateZeta.fourier_globalNormalized`: (4.7): ẑ₀(1 − s, ω^{−1}) = ε(s, ω)z₀(s, ω).

**Checks.**

- `TateZeta.globalEpsilon_rat_one`: k = ℚ, ω = 1: ε(s, 1) = 1.
- `TateZeta.globalEpsilon_dirichlet`: k = ℚ, ω attached to a primitive Dirichlet character of conductor N: ε(s, ω) = N^{1/2−s}ε(1/2, ω), the N-power in Mathlib's DirichletCharacter.IsPrimitive.completedLFunction_one_sub; ε(1/2, ω) is the product of the p | N Gauss-sum factors and i^a at ∞, identified with rootNumber through the ω ↔ χ^{±1} dictionary of GlobalNumberFields Layer 9.
- `TateZeta.globalEpsilon_unramified_everywhere`: ω unramified everywhere and k = ℚ: ε(s, ω) = i^{a} with a from ω_∞.
- `TateZeta.localEpsilon_not_global`: A single local factor ε_v(s, ω_v, ψ_v) does depend on ψ_v (3.29); only the product over all places is independent.

The finite-product formula also gives 1 on an empty exceptional set. Two local
values i and −i multiply to 1, rather than summing to zero. These scalar checks
pin the product convention independently of the arithmetic conductor calculation.


(Source: [Kudla](#ref-kudla2004), §4, (4.6)–(4.7), printed p. 128 (physical p. 20); [Kudla](#ref-kudla2004), §4, printed p. 128 (physical p. 20).)

*Needs:* [The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)](#local-epsilon-gamma-factors); [Explicit local ε-factors (Proposition 3.8)](#explicit-epsilon-factors); [Factorizable distributions and global uniqueness (Lemma 4.1, Theorem 4.2)](#global-eigendistributions); [Adelic Poisson summation and Tate's Riemann–Roch theorem](#adelic-poisson-summation).


<a id="hecke-l-functional-equation"></a>

**Continuation and functional equation of Hecke L-functions (Kudla Corollary 4.4).** For a character ω of 𝔸^×/k^×, Λ(s, ω) continues to a meromorphic function on ℂ with Λ(s, ω) = ε(s, ω)Λ(1 − s, ω^{−1}). Λ(s, ω) is entire unless ω = |·|^{iu} for some real u, in which case its only poles are simple, at s = −iu and s = 1 − iu. Equivalently (Tate §4.5) Hecke's ζ(s, χ) = Σ_{(𝔞,S)=1}χ(𝔞)N𝔞^{−s} continues and satisfies ζ(1 − s, χ^{−1}) = ∏_{v∈S}ρ_v(c̃_v|·|^{s+it_v})·∏_{v∉S}χ(𝔡_v)N𝔡_v^{s−1/2}·ζ(s, χ).

Work under the following hypotheses. k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

(Source: [Kudla](#ref-kudla2004), §4, Corollary 4.4 and (4.8)–(4.9), printed p. 128 (physical p. 20); [Tate](#ref-tate1950), §4.5, physical pp. 53–59.)

*Needs:* [Tate's global functional equation (Main Theorem 4.4.1; Kudla Theorem 4.3)](#tate-global-functional-equation); [The global ε-factor ε(s, ω)](#global-epsilon-factor); [The completed Hecke L-function Λ(s, ω)](#completed-hecke-l-function); [The global Tate zeta integral z(s, ω; f)](#global-zeta-integral); [Factorizable distributions and global uniqueness (Lemma 4.1, Theorem 4.2)](#global-eigendistributions); [Tate's local functional equation (Corollary 3.7)](#local-functional-equation); Mathlib `completedRiemannZeta_one_sub`; Mathlib `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.


### CM quadratic completion and orbital comparisons


<a id="cm-quadratic-completion"></a>

**The CM quadratic Hecke completion.** For E/F CM quadratic, F totally real of degree g, let η be the nontrivial quadratic idele-class character, Q=|D_F|N(f_η)=|D_E|/|D_F|. The canonical conductor-balanced completion is Λ_η(s)=Q^(s/2)Γ_R(s+1)^g L_f(s,η), entire of order at most1, with Λ_η(s)=W_ηΛ_η(1−s), W_η=1. The unbalanced completion L_η(s)=Γ_R(s+1)^gL_f(s,η) satisfies L_η(s)=Q^(1/2−s)L_η(1−s).

Work under the following hypotheses. Use conductor-discriminant theorem from GlobalNumberFields; the quadratic root number1 follows from the Dedekind zeta quotient.

(Source: [Thorner–Zaman](#ref-thornerzaman2017), §2, printed p.1141 (physical p.9).)

*Needs:* [Continuation and functional equation of Hecke L-functions (Kudla Corollary 4.4)](#hecke-l-functional-equation); [Canonical archimedean factors](#canonical-archimedean-factor).


<a id="cm-logarithmic-gamma-correction"></a>

**The CM gamma logarithmic correction.** For the unbalanced CM completion L_η=Γ_R(s+1)^gL_f, L_η′(0)/L_η(0)=L_f′(0)/L_f(0)−(g/2)(γ+log(4π)). Its functional equation gives L_η′(0)/L_η(0)+L_η′(1)/L_η(1)=−log Q. Balancing adds (1/2)log Q to each logarithmic derivative.

Work under the following hypotheses. η CM quadratic; L_f(0) and L_f(1) nonzero; γ Euler’s constant.

(Source: [Yuan–Zhang](#ref-yuanzhang2018), §7.1 p.590, displayed gamma correction.)

*Needs:* [The CM quadratic Hecke completion](#cm-quadratic-completion); [Canonical archimedean factors](#canonical-archimedean-factor).


<a id="quadratic-orbital-tate-comparison"></a>

**The normalized quadratic orbital Tate comparison.** For the quadratic idele-class character η in Zhang, the zero-orbit integrals are Orb(0+,Φ,s)=Λ(s,η)∏_v Z_v(s,η,Φ_v(·,0))/L_v(s,η) and Orb(0−,Φ,s)=Λ(−s,η)∏_v Z_v(−s,η,Φ_v(0,·))/L_v(−s,η). Each normalized local integral is entire and equals1 at unramified standard data.

Work under the following hypotheses. Use Zhang’s stated local measures and L-factors. The second orbit has−s from inversion, not s; η=η^(−1).

(Source: [Zhang](#ref-zhang2021), §12.5 pp.946–947 (12.15)–(12.19).)

*Needs:* [The global Tate zeta integral z(s, ω; f)](#global-zeta-integral); [The completed Hecke L-function Λ(s, ω)](#completed-hecke-l-function); [Local uniqueness: dim S′(ω) = 1 (Theorem 3.4)](#local-uniqueness-theorem).


### Examples

For ℚ, the standard finite indicators and real Gaussian give completedRiemannZeta, epsilon factor 1 and norm-one idele-class volume 1. Over ℂ, the same trace Gaussian gives πΓ_C, while a weight-two real discrete-series block gives Γ_C(s+1/2). These two computations distinguish multiplicative measure conversion from the discrete-series shift.

### Dependencies

AL.0; GlobalNumberFields layers 9–10; ClassFieldTheory layer 7; AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3; AutomorphicFormsOnReductiveGroups AF.1.


## Layer AL.2: Godement–Jacquet standard functions


### Matrix zeta integrals and standard denominators


<a id="godement-jacquet-integral"></a>

**The Godement–Jacquet zeta integral.** For n≥1, an irreducible admissible π of GL_n(F), matrix coefficient β(g)=ℓ(π(g)v), and Φ∈S(Mat_n(F)), put Z(s,β,Φ)=∫_{GL_n(F)}β(g)Φ(g)|det g|_F^(s+(n−1)/2)dg in its absolute-convergence half-plane. dg gives GL_n(O) volume1 at an unramified finite place.

Work under the following hypotheses. F is a local field; at infinity π is a Casselman–Wallach representation and ℓ a continuous contragredient vector.

Require the following API.

- `AL2.GodementJacquetIntegral.integral`: Z is the displayed integral in its convergence domain.
- `AL2.GodementJacquetIntegral.bilinear`: Z is linear in β and Φ where the integrals converge.
- `AL2.GodementJacquetIntegral.twist`: Z(s,β⊗|det|^t,Φ)=Z(s+t,β,Φ).

**Checks.**

- `AL2.GodementJacquetIntegral.rank_one`: For n=1 the exponent is s and Z is the Tate integral.
- `AL2.GodementJacquetIntegral.rank_two_shift`: For n=2 the determinant exponent is s+1/2.
- Φ=0 gives Z=0, including after continuation.
- Replacing dg by c dg multiplies Z by c; the L-factor normalization is independent of this choice.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.3.2, (2.3), pp.5–6.)

*Needs:* [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); **SmoothRepresentationsOfLocalGroups**, SR.3; **AutomorphicFormsOnReductiveGroups**, AF.1, *sf-representation*; **AdelicAlgebraicGroups**, AA.0.


<a id="godement-jacquet-convergence"></a>

**Convergence of the matrix zeta integral.** For fixed π,β,Φ the Godement–Jacquet integral converges absolutely for Re(s)>c_π, locally uniformly there with every s-derivative obtained by insertion of powers of log|det g|.

Work under the following hypotheses. Use finite-place admissibility and archimedean moderate growth; no universal Re(s)>0 bound is asserted.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.3.2, after (2.3), p.6.)

*Needs:* [The Godement–Jacquet zeta integral](#godement-jacquet-integral); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.


<a id="standard-local-l-factor"></a>

**The standard local L-factor.** At a finite place the C[q^s,q^(−s)]-span of all continued Z(s,β,Φ) is the principal fractional ideal generated by L(s,π)=P_π(q^(−s))^(−1), P_π(0)=1. At infinity L is the product of Γ_R/Γ_C factors of the archimedean Langlands parameter, imported from AF.1; these are distinct constructions with a comparison theorem.

Work under the following hypotheses. π irreducible admissible; archimedean parameters use unitary normalization.

Require the following API.

- `AL2.StandardLocalLFactor.constant`: P_π(0)=1 at a finite place.
- `AL2.StandardLocalLFactor.normalized_zeta`: Every Z/L is entire; at each s₀ some quotient is nonzero.
- `AL2.StandardLocalLFactor.unramified`: For Satake roots α_i, L(s,π)=∏_i(1−α_i q^(−s))^(−1).
- `AL2.StandardLocalLFactor.twist`: L(s,π⊗|det|^t)=L(s+t,π).

**Checks.**

- `AL2.StandardLocalLFactor.trivial_gl1`: L(s,1_F)=(1−q^(−s))^(−1).
- `AL2.StandardLocalLFactor.ramified_gl1`: A ramified rank-one character has L=1 rather than a degree-one unramified factor.
- L(s,sgn)=Γ_R(s+1), not Γ_R(s).
- For (z/|z|)^κ |z|_C^t, L=Γ_C(s+t+|κ|/2).

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.4.1–§2.4.3, pp.6–7.)

*Needs:* [Convergence of the matrix zeta integral](#godement-jacquet-convergence); **AutomorphicFormsOnReductiveGroups**, AF.1, *archimedean-llc-gln*; [Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)](#archimedean-local-theory).


<a id="godement-jacquet-functional-equation"></a>

**The Godement–Jacquet functional equation.** With positive trace Fourier transform Φ̂(Y)=∫Φ(X)ψ(tr(XY))dX and self-dual additive measure, Z(1−s,β̌,Φ̂)/L(1−s,π∨)=ε(s,π,ψ)Z(s,β,Φ)/L(s,π), β̌(g)=β(g^(−1)). ε is a nonzero monomial in q^(−s) at finite places.

Work under the following hypotheses. Haar and ψ conventions agree with AL.1; convert explicitly from native negative Fourier kernel.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.4.4, formula(2.15), p.7; additive character convention §2.1.1 p.3.)

*Needs:* [The standard local L-factor](#standard-local-l-factor); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); [Tate's local functional equation (Corollary 3.7)](#local-functional-equation).


<a id="godement-jacquet-spherical-test"></a>

**The spherical matrix test vector.** For unramified irreducible π of GL_n(F), choose K-fixed v,ℓ with ℓ(v)=1 and Φ=1_Mat_n(O). With K-volume1 and unitary Satake roots α_i, Z(s,β,Φ)=∏_i(1−α_iq^(−s))^(−1). For n=1 this is the Tate geometric series.

Work under the following hypotheses. Finite place; normalized parabolic induction uses δ_B^(1/2); matrix exponent s+(n−1)/2.

(Source: [Humphries, Godement–Jacquet tests](#ref-humphriesgj), §1, (1.1), p.1.)

*Needs:* [The Godement–Jacquet zeta integral](#godement-jacquet-integral); [The unramified L-group Euler factor](#l-group-local-factor); **IntegralHeckeAndGaloisDeterminants**, §3a.1, Normalized Satake coefficients for GLn.


<a id="unitary-self-dual-real-factors"></a>

**Real coefficients of unitary self-dual factors.** If a local irreducible admissible π is unitary and self-dual, its finite-place normalized Euler polynomial has real coefficients. At infinity its gamma shifts are real or occur in conjugate pairs of the same gamma type. Consequently its local factor is positive at all sufficiently large real s.

Work under the following hypotheses. Both unitarity and self-duality are required; positivity is only asserted away from gamma poles and sufficiently far right.

(Source: [Yun–Zhang](#ref-yunzhang2017), Appendix B LemmaB.3 and proof pp.904–905.)

*Needs:* [The standard local L-factor](#standard-local-l-factor); [The Godement–Jacquet zeta integral](#godement-jacquet-integral); [Canonical archimedean factors](#canonical-archimedean-factor).


### Ramified Godement–Jacquet test vector


<a id="godement-jacquet-newform-test"></a>

**A ramified Godement–Jacquet test vector.** Let π be a ramified generic representation of GL_n(F), F nonarchimedean, with conductor c>0, normalized newvectors v°,v̌° and β(g)=⟨π(g)v°,v̌°⟩, β(1)=1. Let Φ(X)=ω_π(X_nn)^(−1)/vol K₀(P^c) when X∈Mat_n(O), X_nj∈P^c for j<n, X_nn∈O×, and 0 otherwise. Then Z(s,β,Φ)=L(s,π).

Work under the following hypotheses. Use the newform theorem in SR.5 including c(ω_π)≤c; dg(K)=1.

(Source: [Humphries, Godement–Jacquet tests](#ref-humphriesgj), Theorem 1.2, p.1; §§4–5, pp.5–7.)

*Needs:* [The Godement–Jacquet zeta integral](#godement-jacquet-integral); [The standard local L-factor](#standard-local-l-factor); **SmoothRepresentationsOfLocalGroups**, SR.5; [The unramified Rankin–Selberg test](#rs-unramified-test); [Nonarchimedean factors under normalized induction](#rs-induced-factor-product).


<a id="jacquet-shalika-satake-bound"></a>

**The Jacquet–Shalika Satake bound.** For an irreducible unitary generic unramified representation of GL_n(F), every unitary-normalized Satake root satisfies q^(−1/2)<|α_i|<q^(1/2). Hence a unitary global cusp form has these bounds at all unramified places. This does not assert temperedness over a number field.

Work under the following hypotheses. Genericity is imported from the cuspidal realization; finite local field F.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Corollary7.1.2 and proof, pp.58–59.)

*Needs:* [The unramified Rankin–Selberg test](#rs-unramified-test); [Local convergence and continuity](#rs-local-convergence); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form*.


### Global Godement–Jacquet theory and order-one growth


<a id="global-godement-jacquet"></a>

**The global standard L-function.** For a unitary cuspidal π of GL_n(𝔸_K), the finite standard Euler product converges absolutely for Re(s)>1. The completed Λ(s,π)=∏_v L(s,π_v) has meromorphic continuation and Λ(s,π)=ε(s,π)Λ(1−s,π∨). If n≥2 it is entire. For n=1 its only possible poles are the Tate norm-character poles. The product of local epsilon factors is independent of the global additive character.

Work under the following hypotheses. K is a number field; π is unitary cuspidal. The initial matrix-integral construction gives a sufficiently far-right half-plane; the Re(s)>1 Euler-product boundary additionally uses the self-pair Rankin–Selberg mean-square coefficient argument.

(Source: [Borel](#ref-borel1979), §14, pp.52–53, standard representation case.)

*Needs:* [The Godement–Jacquet functional equation](#godement-jacquet-functional-equation); [Adelic Poisson summation and Tate's Riemann–Roch theorem](#adelic-poisson-summation); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form-rapid-decay*; **AdelicAlgebraicGroups**, §2.3, Rational quotients; [Tate's global functional equation (Main Theorem 4.4.1; Kudla Theorem 4.3)](#tate-global-functional-equation); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [The Jacquet–Shalika Satake bound](#jacquet-shalika-satake-bound); Tau Ceti **ArithmeticDirichletSeries**, layer 8 landau type positivity; Tau Ceti **ArithmeticDirichletSeries**, layer 3 local factors and euler products.


<a id="standard-order-one"></a>

**Growth of the centered entire standard completion.** For unitary cuspidal π over a number field whose standard completion is entire, its conductor-balanced centered function φ(z)=Λ(1/2+z,π) is an entire function of order at most1: for every ε>0, |φ(z)|≤exp(C_ε(1+|z|)^(1+ε)). Over a function field an entire standard L-function is a polynomial in q^(−s) times a real exponential, hence has order at most1.

Work under the following hypotheses. The rank-one norm/degree characters with poles are excluded by the explicit entirety hypothesis.

(Source: [Yun–Zhang](#ref-yunzhang2017), TheoremB.2 proof p.904; RemarkB.4 p.905.)

*Needs:* [The global standard L-function](#global-godement-jacquet); [Rankin–Selberg vertical-strip bounds](#rs-vertical-strip-bounds); AL.3 unramified pure realization.

### Centered entire functions and paired products

Define `AL2.IsCenteredOrderOne(f)` for f:ℂ→ℂ by requiring f entire and, for every ε>0, a C>0 such that |f(z)|≤exp(C(1+|z|^(1+ε))) for all z. The API `AL2.IsCenteredOrderOne.mul`, `AL2.IsCenteredOrderOne.translate` and `AL2.IsCenteredOrderOne.polynomial` proves closure under products and translations and inclusion of every polynomial with these entire-growth hypotheses. For f≢0, apply Mathlib `AnalyticOnNhd.sum_divisor_le` at a nonzero centre to obtain a multiplicity-counted zero bound C_ε(1+R^(1+ε)) for R≥1. **Checks.** The constant 1 has order zero and satisfies the predicate. Every polynomial, including 1+z², satisfies it. The function exp(z²) fails the order-one bound along positive real inputs, while exp(z) satisfies it.

**Paired Hadamard theorem.** Suppose f has this growth, f(−z)=δf(z) for δ∈{1,−1}, all its zeros lie on the imaginary axis, and f(x) is positive real for all sufficiently large positive real x. Then there are m≥0, c>0 and a finite or countable multiset of positive real numbers γ, with Σγ⁻²<∞, such that

f(z)=c z^m ∏γ(1+z²/γ²), locally uniformly on ℂ, and δ=(−1)^m.

Multiplicity is retained, including the zero of order m at the origin. Obtain the multiset from the discrete zero divisor. Jensen bounds give convergence of the paired product. Hadamard factorization leaves an affine exponential; parity removes its linear part, and positivity fixes the constant. Every derivative at zero and at a positive real point is real and nonnegative. If f is not a polynomial, every derivative at a positive real point is strictly positive and every coefficient of z^(m+2j), j≥0, is positive. For polynomials, coefficients above the degree vanish. **Checks.** f=1+z² has vanishing higher derivatives; f=sinh z has strictly positive derivatives for x>0; f=1−z² violates the imaginary-zero and positivity hypotheses.

(Source: Yun–Zhang, Appendix B, Proposition B.1 and its factorization argument, published pp.902–903; the non-polynomial strictness condition is required. Prerequisites: Mathlib entire/analytic functions, their derivatives and meromorphic zero orders; Mathlib `AnalyticOnNhd.circleAverage_log_norm` and `AnalyticOnNhd.sum_divisor_le`; the canonical product and Hadamard factorization argument constructed here. AL.2's standard superpositivity theorem applies this result to f(z)=Λ(1/2+z).)


### Superpositivity


<a id="standard-superpositivity"></a>

**Super-positivity of the standard completion.** Let π be unitary, self-dual and cuspidal, with entire completed standard L-function. Under RH in the number-field case, every derivative of the real conductor-balanced Λ at1/2 is nonnegative. If centered Λ is non-polynomial, a nonzero derivative of order r forces every derivative of order r+2j to be positive. A constant centered function has positive zeroth derivative and zero higher derivatives.

Work under the following hypotheses. Use the unitary normalization, global root number±1, order≤1, and positivity sufficiently far right. For the function-field specialization use AL.3’s pure realization and cohomological determinant theorem.

(Source: [Yun–Zhang](#ref-yunzhang2017), Appendix B corrected PropositionB.1, TheoremB.2, RemarkB.4 pp.902–906.)

*Needs:* [Real coefficients of unitary self-dual factors](#unitary-self-dual-real-factors); [Growth of the centered entire standard completion](#standard-order-one); AL.2 centered entire functions and paired Hadamard theorem; AL.3 unramified pure realization.


### Maass standard functions and their norm


<a id="maass-standard-l-function"></a>

**The normalized Maass standard L-function.** For a level-one Hecke–Maass cusp eigenform of parity ε∈{0,1}, spectral parameter r and a(1)=1, use φ(z)=2sqrt(y)∑_{m≠0}a(m)K_(ir)(2π|m|y)e(mx), a(−m)=(−1)^εa(m). Use the native `LSeries a s` for L_f(s)=∑_{m≥1}a(m)m^(−s), with Euler polynomial1−a(p)T+T². The canonical completion is Γ_R(s+ε+ir)Γ_R(s+ε−ir)L_f(s). Duke’s completion π^(−s)Γ((s+ε+ir)/2)Γ((s+ε−ir)/2)L_f(s) is π^ε times this canonical one.

Work under the following hypotheses. Import the Maass eigenform, cuspidality and Hecke relations from **AutomorphicFormsOnReductiveGroups**, AF.3 *maass-cusp-forms*; unitary normalization.

Require the following API.

- `AL2.MaassStandardLFunction.euler`: The p factor is(1−a(p)p^(−s)+p^(−2s))^(−1).
- `AL2.MaassStandardLFunction.completion`: The canonical completion has the displayed two Γ_R factors.
- `AL2.MaassStandardLFunction.duke`: Duke’s completion is π^ε times the canonical one.
- `AL2.MaassStandardLFunction.twist`: The primitive quadratic twist replaces a(m) by χ_d(m)a(m).

**Checks.**

- `AL2.MaassStandardLFunction.first_coefficient`: a(1)=1; no extra factor2 occurs in the Dirichlet series.
- `AL2.MaassStandardLFunction.odd_completion`: For ε=1 Duke’s completion isπ times the canonical completion.
- `AL2.MaassStandardLFunction.prime_square`: a(p²)=a(p)²−1, by the reciprocal quadratic polynomial.
- `AL2.MaassStandardLFunction.eisenstein_excluded`: Replacing the cusp form by an Eisenstein series can introduce poles; entirety is not then asserted.

The light `AL2.maassCompletion` takes a:ℕ→ℂ, ε∈Fin 2, r∈ℝ and s∈ℂ
and multiplies `LSeries a s` by the two displayed native Γ_R factors.
Its API compares with Duke's formula and the reciprocal quadratic Hecke polynomial.
The a(1)=1, odd-parity and prime-square checks below fix this formula's normalization.


(Source: [Duke–İmamoğlu–Tóth](#ref-dukeimamoglutoth2016), §5.2 pp.962–963 (5.7)–(5.9).)

*Needs:* [The K-Bessel kernel](#bessel-k); [The standard local L-factor](#standard-local-l-factor); [Canonical archimedean factors](#canonical-archimedean-factor); **AutomorphicFormsOnReductiveGroups**, AF.3, *maass-cusp-forms*.


<a id="maass-standard-functional-equation"></a>

**The Maass standard functional equation.** The canonical completion of the normalized level-one Maass cusp form is entire and satisfies Λ(s)=(-1)^εΛ(1−s).

Work under the following hypotheses. Same hypotheses and gamma convention as maass-standard-l-function.

(Source: [Duke–İmamoğlu–Tóth](#ref-dukeimamoglutoth2016), §5.2 p.963 (5.9).)

*Needs:* [The normalized Maass standard L-function](#maass-standard-l-function); [The global standard L-function](#global-godement-jacquet).


<a id="maass-norm-comparison"></a>

**The Maass Fourier and Petersson normalization.** For a level-one Hecke–Maass cusp eigenform with the Duke expansion and a(1)=1, ∫_(SL₂(Z)\H)|φ|² dxdy/y²=2L(1,Ad φ)/cosh(πr). In the W_(0,ir)(4π|n|y) convention, ρ(1)λ(n)=sqrt(n)ρ(n) and W_(0,ir)(x)=sqrt(x/π)K_(ir)(x/2), so the Duke normalization is exactlyρ(1)=1. L²-unit normalization therefore has |ρ(1)|²=cosh(πr)/(2L(1,Ad φ)).

Work under the following hypotheses. Level1 and standard hyperbolic measure of volumeπ/3; coefficients normalized as above. No unspecified Petersson scalar is allowed.

(Source: [Humphries–Nordentoft](#ref-humphriesnordentoft), §4.1.1 (4.2)–(4.6) pp.21–22.)

*Needs:* [The normalized Maass standard L-function](#maass-standard-l-function); [Global Rankin–Selberg unfolding](#global-rs-unfolding); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [The K-Bessel kernel](#bessel-k); **AutomorphicFormsOnReductiveGroups**, AF.3, *maass-cusp-forms*.


### Examples

At rank one the matrix integral is the Tate integral; at rank two its determinant exponent is s+1/2. For an odd Maass form Duke's completion is π times the canonical completion. The centered polynomial 1+z² has third derivative zero, whereas sinh(z) has every derivative positive at positive real points.

### Dependencies

AL.0–AL.1; the local and global analytic prefixes of AL.3 for the mean-square coefficient and growth arguments; SmoothRepresentationsOfLocalGroups SR.3–SR.5; AutomorphicFormsOnReductiveGroups AF.1 and AF.3; AdelicAlgebraicGroups §2.3; IntegralHeckeAndGaloisDeterminants §3a.1; completed ArithmeticDirichletSeries layers 3 and 8.


## Layer AL.3: Rankin–Selberg theory and function-field factors


### Whittaker realizations and parameter estimates


<a id="whittaker-model"></a>

**The Whittaker realization.** Given generic π of GL_n(F) and a nonzero Whittaker functional λ with λ(π(u)v)=ψ_N(u)λ(v), its Whittaker model is the image v↦W_v, W_v(g)=λ(π(g)v). At infinity use the continuous functional on the Casselman–Wallach globalization; at finite places use the smooth model.

Work under the following hypotheses. ψ_N(u)=ψ(Σ_{i=1}^{n−1}u_{i,i+1}); π generic and irreducible.

Require the following API.

- `AL3.WhittakerModel.equivariance`: W(ug)=ψ_N(u)W(g).
- `AL3.WhittakerModel.right_action`: W_{π(h)v}(g)=W_v(gh).
- `AL3.WhittakerModel.ext`: Equality at every g is equality in the model.
- `AL3.WhittakerModel.realization`: The generic irreducible realization is a representation isomorphism onto its image.

**Checks.**

- `AL3.WhittakerModel.rank_one`: For n=1, N is trivial and W(g)=χ(g)W(1).
- `AL3.WhittakerModel.generic_nonzero`: λ≠0 gives a nonzero W; the zero functional cannot define the model.
- `AL3.WhittakerModel.opposite_character`: A model for ψ^(−1) has the inverse unipotent phase and is required for the second RS factor.

The light `AL3.whittakerFunction` takes an action ρ:G→End_ℂ(V), a linear
functional ℓ:V→ℂ and v∈V; it returns the function g↦ℓ(ρ(g)v). The intended
`AL3.WhittakerModel` signature returns the image submodule of G→ℂ, with smoothness
or the Casselman–Wallach topology supplied in the local-field realization.
Equivariance and right translation are its algebraic API; irreducibility and ℓ≠0 give
injectivity. The three checks below also discriminate the light evaluation formula.


(Source: [Jacquet](#ref-jacquetarch), §2, pp.3–5, continuous Whittaker form and realization.)

*Needs:* **SmoothRepresentationsOfLocalGroups**, SR.5; **AutomorphicFormsOnReductiveGroups**, AF.1, *sf-representation*; **AutomorphicFormsOnReductiveGroups**, AF.1, *casselman-wallach-globalization*.


<a id="whittaker-compact-parameter-estimates"></a>

**Uniform archimedean Whittaker estimates.** For a compact parameter set Ω in a fixed induced Casselman–Wallach family, there is M such that for every enveloping-algebra differential operator X there is a continuous seminorm ν_X with |ρ(X)W_{u,f}(g)|≤||g||^Mν_X(f) for u∈Ω. Sharper torus estimates give arbitrary decay in the simple-root directions after the prescribed moderate-growth factors.

Work under the following hypotheses. Use fixed compact-picture Fréchet carrier; λ_u varies continuously/holomorphically in u.

(Source: [Jacquet](#ref-jacquetarch), §3, Lemma 3.12 and Proposition 3.2, pp.19–20.)

*Needs:* [The Whittaker realization](#whittaker-model); **AutomorphicFormsOnReductiveGroups**, AF.1, *casselman-wallach-globalization*.


### Unequal-rank and equal-rank integrals


<a id="rs-local-integrals"></a>

**The local Rankin–Selberg integrals.** For generic π_n,π_m with n>m≥1, opposite Whittaker models and 0≤j≤n−m−1, Ψ_j(s,W,W′)=∫_{N_m\GL_m}∫_{Mat_{j,m}}W([[g,0,0],[x,I_j,0],[0,0,I_{n−m−j}]])W′(g)|det g|^(s−(n−m)/2)dx dg. For n=m use Ψ(s,W,W′,Φ)=∫_{N_n\GL_n}W(g)W′(g)Φ(e_ng)|det g|^s dg.

Work under the following hypotheses. Local field F, quotient Haar supplied by AA.2; Φ∈S(F^n).

Require the following API.

- `AL3.RsLocalIntegrals.equal_rank`: The n=m formula includes Φ(e_ng) and exponent s.
- `AL3.RsLocalIntegrals.j_range`: The unequal-rank family has j=0,…,n−m−1.
- `AL3.RsLocalIntegrals.bilinear`: Ψ_j is bilinear on convergent inputs; equal rank is also linear in Φ.
- `AL3.RsLocalIntegrals.twist`: Twisting π_n by |det|^t shifts s to s+t.

**Checks.**

- `AL3.RsLocalIntegrals.two_by_one`: n=2,m=1,j=0 gives ∫F×W(diag(a,1))χ(a)|a|^(s−1/2)d×a.
- `AL3.RsLocalIntegrals.equal_rank_one`: n=m=1 gives the Tate integral for the product character with Φ.
- n=m+3 has three j values 0,1,2; omitting the x-integrals loses the FE partners.

**Checks for the formula specializations.**

- On two point-mass carriers, n=2,m=1, W=2, W′=3, |det|=4 and s=1 give Ψ=12; using exponent s gives 24.
- At equal rank, replacing Φ by zero gives zero for every W,W′, so a formula omitting Φ fails.
- At equal rank with a point mass, W=2,W′=3,Φ=5, |det|=2 and s=1 give 60, retaining both the Schwartz input and exponent s.


(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 6, p.45, integral family; Lecture 8, pp.61–62, archimedean setting.)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions](#local-schwartz-bruhat-space); **AdelicAlgebraicGroups**, §2.2, *quotient-measure*.


<a id="rs-local-convergence"></a>

**Local convergence and continuity.** For fixed generic π_n,π_m, all Ψ_j converge absolutely in a right half-plane, locally uniformly in s; at infinity they are jointly continuous bilinear forms on the smooth Fréchet models, extending to the completed projective tensor product. If both irreducible generic inputs are unitary, the local integrals converge absolutely for Re(s)≥1; this closed boundary estimate is needed in the strong multiplicity-one argument.

Work under the following hypotheses. Parameters in compact sets require the uniform seminorm estimates; a K-finite algebraic tensor statement alone is insufficient.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture6 Proposition6.2(i), printed p.47 (physical p.51); Lecture8 Proposition8.2, printed p.63 (physical p.67); [Jacquet](#ref-jacquetarch), §2, Theorem 2.1, pp.6–7; Proposition 3.2 and its proof, pp.19–20.)

*Needs:* [The local Rankin–Selberg integrals](#rs-local-integrals); [Uniform archimedean Whittaker estimates](#whittaker-compact-parameter-estimates); **SmoothRepresentationsOfLocalGroups**, SR.3.


<a id="rs-local-factor"></a>

**The Rankin–Selberg local L-factor.** At a finite place the Laurent-polynomial span of the Ψ_j (and Φ when n=m) is generated by L(s,π_n×π_m)=P(q^(−s))^(−1), P(0)=1. At infinity use L(s,σ_n⊗σ_m) for the imported archimedean Weil parameters and prove that all Ψ/L are entire, with no common zero at any point.

Work under the following hypotheses. Generic irreducible inputs; finite fractional ideals and archimedean holomorphic modules are distinct.

Require the following API.

- `AL3.RsLocalFactor.normalize`: Ψ/L is entire for every permitted test input.
- `AL3.RsLocalFactor.nonvanishing`: At each s₀ some normalized test input has nonzero value.
- `AL3.RsLocalFactor.unramified`: L(s,π×π′)=∏_{i,j}(1−α_iβ_jq^(−s))^(−1).
- `AL3.RsLocalFactor.rank_one`: For m=1 the factor is the standard L-factor of the character twist of π.

**Checks.**

- `AL3.RsLocalFactor.one_by_one`: Two unramified characters give (1−αβq^(−s))^(−1).
- `AL3.RsLocalFactor.two_by_one`: Satake roots (2,3), β=5 give denominator (1−10T)(1−15T).
- `AL3.RsLocalFactor.ramified_product`: Two ramified characters can have unramified product; multiplying their separate standard L-factors does not compute the tensor L-factor.

(Source: [Jacquet](#ref-jacquetarch), §2, Theorems 2.3–2.7, pp.8–10; §12.1, pp.83–87; [Cogdell, Fields lectures](#ref-cogdellfields), Lecture6 §2, Proposition6.3 and Corollary6.3.1, printed p.48 (physical p.52).)

*Needs:* [The local Rankin–Selberg integrals](#rs-local-integrals); **SmoothRepresentationsOfLocalGroups**, SR.3; **AutomorphicFormsOnReductiveGroups**, AF.1, *archimedean-llc-gln*; [Local uniqueness: dim S′(ω) = 1 (Theorem 3.4)](#local-uniqueness-theorem); [Local convergence and continuity](#rs-local-convergence); **SmoothRepresentationsOfLocalGroups**, SR.5.


### Induction, functional equations and test realization


<a id="rs-induced-factor-product"></a>

**Nonarchimedean factors under normalized induction.** Let F be nonarchimedean and π=Ind_P^GL_n(⊠_i π_i) and π′=Ind_Q^GL_m(⊠_j π′_j) be irreducible generic normalized inductions, with every block irreducible essentially square-integrable. Then L(s,π)=∏_i L(s,π_i) and L(s,π×π′)=∏_(i,j)L(s,π_i×π′_j). For a rank-one norm character, L(s,π×|·|^t)=L(s+t,π). These are exact identities of normalized local factors, at this finite place.

Work under the following hypotheses. Use the induced representations themselves, with δ_P^(1/2), not arbitrary irreducible quotients of reducible induction. The irreducible generic range suffices for the newform application; no general nongeneric quotient product theorem is asserted. This target is the finite-place product needed by the ramified Godement–Jacquet newform proof. No archimedean induction-compatibility input is inferred from the finite SR.2 contract.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.2.1–2.2.3 p.4; §2.4.1 formulas(2.4)–(2.6), p.6; [Humphries, Godement–Jacquet tests](#ref-humphriesgj), §5 proof of Theorem1.2, p.6, invoking JPSS1983 §9.5.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [The standard local L-factor](#standard-local-l-factor); **SmoothRepresentationsOfLocalGroups**, SR.2; **SmoothRepresentationsOfLocalGroups**, SR.3.


<a id="rs-local-functional-equation"></a>

**The local Rankin–Selberg functional equation.** There is a unique γ(s,π_n×π_m,ψ) such that the dual Ψ_{n−m−1−j}(1−s,R(w_{n,m})W̃,W̃′) equals ω_{π_m}(−1)^(n−1)γ(s,π_n×π_m,ψ)Ψ_j(s,W,W′). At equal rank include the self-dual Fourier transform Φ̂. Put γ=ε L(1−s,π_n∨×π_m∨)/L(s,π_n×π_m).

Work under the following hypotheses. W̃(g)=W(w_n t(g^(−1))); use the source Weyl matrix convention and positive Fourier kernel consistently.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 6 §3, Theorem 6.2, pp.48–49; Lecture 8 §3, pp.63–64.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); **SmoothRepresentationsOfLocalGroups**, SR.3.


<a id="rs-archimedean-realization"></a>

**Archimedean realization of holomorphic multiples.** For the ordered induced Whittaker-type representations of Jacquet Theorem2.6, every m(s)=h(s)L(s,σ⊗σ′) in the space L(σ⊗σ′) is represented by the completed projective tensor RS integral when n>m, and by a finite sum of such integrals with Schwartz Φ_i when n=m. Here h is entire and, on every finite vertical strip, P(s)m(s) is bounded whenever P is a polynomial clearing the poles of L on that strip. For irreducible induced representations and m=n−1 or m=n, L itself is a finite sum of K-finite test integrals (Gaussian-polynomial Φ_i when n=m). No arbitrary-entire-multiple claim, arbitrary-rank-gap K-finite claim, or reducible-input extension of Theorem2.7 is made.

Work under the following hypotheses. Use Jacquet’s compact-picture models with Re(u₁)≤⋯≤Re(u_r) and Re(u′₁)≤⋯≤Re(u′_r′). The required vertical-strip boundedness is the definition of L(σ⊗σ′) on pp.5–6, not merely that h is entire. Irreducibility is required for Theorem2.7; Remark2.8 leaves the corresponding reducible case conjectural.

(Source: [Jacquet](#ref-jacquetarch), §2 definition of L(τ), pp.5–6; Theorems2.6–2.7 and Remark2.8, pp.9–10; §12.1.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [Local convergence and continuity](#rs-local-convergence); **AutomorphicFormsOnReductiveGroups**, AF.1, *archimedean-llc-gln*; [Uniform archimedean Whittaker estimates](#whittaker-compact-parameter-estimates).


<a id="rs-unramified-test"></a>

**The unramified Rankin–Selberg test.** For finite F, ψ of conductor O, normalized spherical W°,W′° with value1 at identity, and Φ°=1_{O^n} at equal rank, Ψ_0(s,W°,W′°)=L(s,π×π′). At equal rank use Ψ(s,W°,W′°,Φ°). At ramified π and spherical π′ the essential/newform test uses the conductor-dependent Φ of Humphries (3.10), not blindly 1_{O^n}.

Work under the following hypotheses. Satake roots in unitary normalization; spherical/essential Whittaker functions imported from SR.5.

(Source: [Humphries, Godement–Jacquet tests](#ref-humphriesgj), §3, Theorems 3.7 and 3.9, formula (3.10), pp.3–4.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); **SmoothRepresentationsOfLocalGroups**, SR.5; **IntegralHeckeAndGaloisDeterminants**, §3a.1, Normalized Satake coefficients for GLn; **SmoothRepresentationsOfLocalGroups**, SR.4.


### Fourier reconstruction and ordinary multiplicity one


<a id="gln-fourier-expansion"></a>

**The GL(n) cuspidal Fourier expansion.** For a smooth cuspidal φ of GL_n(𝔸_K), n≥2, define W_φ(g)=∫_{N_n(K)\N_n(𝔸_K)}φ(ug)ψ_N(u)⁻¹du, with quotient volume 1. Then φ(g)=Σ_{γ∈N_{n−1}(K)\GL_{n−1}(K)}W_φ(diag(γ,1)g), with locally uniform absolute convergence in the smooth cuspidal setting. In particular φ↦W_φ is injective and equivariant. Global genericity and factorization are subsequent consequences, not hypotheses of this expansion.

Work under the following hypotheses. K is a number field in Cogdell Lecture 4; use a nontrivial global additive character and AF.3 smooth cuspidality/rapid decay. The same successive compact-unipotent Fourier argument gives the function-field version used in Yu §5.3.1; that source invokes Fourier reconstruction before factorization. At infinite places use smooth moderate-growth globalizations and the derivative estimates needed for the stated convergence. A vanishing cuspidal constant term is essential.

Require the following API.

- `AL3.GlnFourierExpansion.injective`: W_φ=W_φ′ implies φ=φ′ for smooth cusp forms with the fixed character and measure.
- `AL3.GlnFourierExpansion.equivariant`: W_{R(h)φ}(g)=W_φ(gh).

**Checks.**

- For n=2 the unipotent quotient is an additive adelic quotient: integrating the character e(x) against e(−x) gives 1, whereas e(2x) against e(−x) gives zero. The kernel extracts the specified frequency, including its sign.
- A nonzero constant automorphic function has vanishing nontrivial Fourier coefficient and fails cuspidality; it cannot be reconstructed by this cusp expansion.
- If every translate in the reconstruction sum has zero Whittaker coefficient, the cusp form itself is zero. This tests the injective realization, rather than the existence of some arbitrary linear functional.


(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 4 §1–§2, printed pp.29–31 (PDF pp.33–35); [Yu](#ref-yu2023), §5.3.1, Lemma 5.3.3 proof, p.36.)

*Needs:* [Adelic Poisson summation and Tate's Riemann–Roch theorem](#adelic-poisson-summation); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form*; **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form-rapid-decay*; **AutomorphicFormsOnReductiveGroups**, AF.3, *unipotent-quotient-compact*; **AdelicAlgebraicGroups**, §2.2, *quotient-measure*.


<a id="global-whittaker-factorization"></a>

**Global Whittaker factorization.** For a cuspidal π of GL_n(𝔸_K), Fourier reconstruction makes φ↦W_φ an injective Whittaker realization; hence π and every local component are generic. With quotient volume 1, continuous local Whittaker uniqueness and a fixed Flath restricted tensor realization, a factorizable φ has W_φ=∏_v W_v, after fixing one global scalar; almost all W_v are normalized spherical. At infinite places extend continuously from dense tensors. An arbitrary global cusp vector or distribution is not asserted decomposable.

Work under the following hypotheses. π is an irreducible cuspidal automorphic representation with AF.2 Flath factorization. Its global genericity is proved from gln-fourier-expansion, not requested from AF.3. At infinite places use the continuous Whittaker functional on the smooth moderate-growth globalization; uniqueness of arbitrary algebraic functionals on the Harish–Chandra module is not the theorem. The function-field spherical specialization is Yu §5.3.1.

Require the following API.

- `AL3.GlobalWhittakerFactorization.generic`: Every irreducible cuspidal π and its local components possess a nonzero Whittaker functional for the fixed nontrivial character.
- `AL3.GlobalWhittakerFactorization.pure_tensor`: A pure tensor has the product Whittaker function with the fixed global scalar and almost-all spherical normalization.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 4 §2, Theorem 4.1 and Corollaries 4.1.1–4.1.3, printed pp.31–33 (PDF pp.35–37); [Yu](#ref-yu2023), §5.3.1 pp.36–38, equation (5.3.1).)

*Needs:* [The Whittaker realization](#whittaker-model); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form*; **AdelicAlgebraicGroups**, §2.2, *quotient-measure*; **AutomorphicFormsOnReductiveGroups**, AF.2, *flath-factorization*; **AutomorphicFormsOnReductiveGroups**, AF.3, *unipotent-quotient-compact*; [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion).


<a id="global-multiplicity-one"></a>

**Ordinary global multiplicity one for GL(n).** For an irreducible admissible smooth representation π of GL_n(𝔸_K), K a number field, its multiplicity in the smooth cuspidal spectrum with fixed central character is at most one. If π is cuspidal, the multiplicity is one: any two nonzero equivariant embeddings into that cusp space differ by a nonzero scalar and have the same image. This is the ordinary multiplicity theorem; it assumes the same global representation, rather than cofinite local agreement.

Work under the following hypotheses. n≥1; K a number field; characteristic-zero complex automorphic forms. Work with the unitary central-character Hilbert realization or an explicitly fixed norm twist. Use continuous equivariant embeddings and continuous Whittaker functionals on the smooth moderate-growth globalizations at infinity. Compare smooth and Hilbert cusp multiplicities by the dense smooth-vector realization in AF.3’s cuspidal Hilbert subspace, using AF.1 globalization and AF.2 restricted tensors. Prove this comparison here as part of the multiplicity theorem.

Require the following API.

- `AL3.GlobalMultiplicityOne.embeddings`: Two nonzero equivariant embeddings of π into the fixed smooth cusp space differ by c∈ℂ×.
- `AL3.GlobalMultiplicityOne.same_image`: The ranges of those two embeddings coincide.

**Checks.**

- `AL3.GlobalMultiplicityOne.rescaling`: For c≠0, i and c·i have the same image and the same cuspidal constituent.
- `AL3.GlobalMultiplicityOne.level_dimension`: Even when dim π^K=2, the contribution at level K has dimension 2 while the global automorphic multiplicity is 1.
- `AL3.GlobalMultiplicityOne.no_occurrence`: If there is no nonzero cusp embedding, the multiplicity is 0, consistent with the at-most-one assertion.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 4 §3, Theorem 4.2 and proof, printed pp.33–34 (PDF pp.37–38).)

*Needs:* [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion); [Global Whittaker factorization](#global-whittaker-factorization); **AutomorphicFormsOnReductiveGroups**, AF.3, *cuspidal-automorphic-representation*.


### Mirabolic Eisenstein series and unfolding


<a id="mirabolic-eisenstein-series"></a>

**The mirabolic Eisenstein series.** For Φ∈S(𝔸^n), unitary idele-class character η and Re(s)>1, E(g,s,Φ,η)=|det g|^s∫_{K×\𝔸×}Σ_{ξ∈K^n\{0}}Φ(aξg)|a|^(ns)η(a)d×a. Equivalently E is the sum over P_{n−1,1}(K)\GL_n(K) of the section f(g,s)=|det g|^s∫_{𝔸×}Φ(ae_ng)|a|^(ns)η(a)d×a.

Work under the following hypotheses. K is a number field; the function-field statements are established in the separate curve-cohomological subsection below. n≥1; self-dual additive Haar and a specified multiplicative Haar; Schwartz topology uses the completed archimedean factors.

Require the following API.

- `AL3.MirabolicEisensteinSeries.theta`: E is the displayed nonzero theta Mellin integral.
- `AL3.MirabolicEisensteinSeries.parabolic_sum`: E equals the sum of the displayed section over the maximal-parabolic quotient.
- `AL3.MirabolicEisensteinSeries.central`: E(zg,s,Φ,η)=η(z)^(−1)E(g,s,Φ,η).

**Checks.**

- `AL3.MirabolicEisensteinSeries.rank_one`: For n=1, GL₁(K)\GL₁(𝔸) unfolding recovers the Tate integral.
- `AL3.MirabolicEisensteinSeries.zero_schwartz`: Φ=0 gives E=0.
- `AL3.MirabolicEisensteinSeries.nontrivial_normone`: A character nontrivial on the norm-one class group has no theta zero-mode poles; merely calling it nontrivial is insufficient for norm twists.

The light theta-Mellin specialization also has a point-mass check: n=2,
|det g|=3, θ₀=5, |a|=2, η=1 and s=1 give 60, rather than the value 30
obtained by omitting n from the norm exponent.


(Source: [Cogdell, Columbia lectures](#ref-cogdellintegrals), §1.1.3, pp.4–5.)

*Needs:* [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); [The global Tate zeta integral z(s, ω; f)](#global-zeta-integral); **AdelicAlgebraicGroups**, §2.2, *quotient-measure*.


<a id="mirabolic-eisenstein-functional-equation"></a>

**Continuation and residues of mirabolic Eisenstein series.** E(g,s,Φ,η)=E(t(g^(−1)),1−s,Φ̂,η^(−1)) meromorphically over a number field. If η=|·|^(−inσ), its only possible simple poles are s=iσ and1+iσ. With κ=vol(K×\𝔸¹) in the chosen measures, the zero-mode terms in that case are −κ|det g|^sΦ(0)/(n(s−iσ))+κ|det g|^(s−1)Φ̂(0)/(n(s−1−iσ)). If the restriction of η to the norm-one idele class group is nontrivial, both zero-mode integrals vanish. The case η=1 is σ=0.

Work under the following hypotheses. Positive Fourier kernel, additive self-duality; n-fold quotient covolume normalized1.

(Source: [Cogdell, Columbia lectures](#ref-cogdellintegrals), §1.1.3, pp.4–5, Poisson summation and functional equation.)

*Needs:* [The mirabolic Eisenstein series](#mirabolic-eisenstein-series); [Adelic Poisson summation and Tate's Riemann–Roch theorem](#adelic-poisson-summation); [The volume κ of the norm-one idele class group (Tate Lemma 4.3.1, Theorem 4.3.2)](#idele-class-volume).


<a id="global-rs-unfolding"></a>

**Global Rankin–Selberg unfolding.** For unitary cuspidal π_n,π_m and pure tensors, the unequal-rank projected cusp integral and the equal-rank integral ∫_{Z_n(𝔸)GL_n(K)\GL_n(𝔸)}φ(g)φ′(g)E(g,s,Φ,ω_πω_π′)dg unfold to ∏_v Ψ_v(s). For n>m project φ along the unipotent radical of (m+1,1,…,1), with factor |det|^(−(n−m−1)/2), then integrate against φ′|det|^(s−1/2).

Work under the following hypotheses. K is a number field. The function-field rational/periodic-pole branch is treated by the separate function-field nodes. Initially Re(s)≫0; global character product trivial on K×. Adjacent rank needs no preliminary projection.

(Source: [Cogdell, Columbia lectures](#ref-cogdellintegrals), §1.1.2–§1.1.3 pp.3–5.)

*Needs:* [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion); [The mirabolic Eisenstein series](#mirabolic-eisenstein-series); [The local Rankin–Selberg integrals](#rs-local-integrals); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form-rapid-decay*; **AdelicAlgebraicGroups**, §2.3, Rational quotients; [Global Whittaker factorization](#global-whittaker-factorization).


### Poles, functional equations, strip bounds and the closed boundary


<a id="rs-global-poles"></a>

**Continuation and the Rankin–Selberg pole criterion.** For unitary cuspidal π_n,π_m the completed Λ(s,π_n×π_m) continues meromorphically. It is entire if n≠m. If n=m, its only poles are simple at s=iσ and1+iσ for real σ with π_n∨≅π_m⊗|det|^(iσ). In particular Λ(s,π×π∨) has simple poles at0 and1, and Λ(s,π×π′∨) has a pole at1 iff π≅π′.

Work under the following hypotheses. K is a number field. The function-field rational/periodic-pole branch is treated by the separate function-field nodes. Holomorphic normalized local quotients have no common zero; all archimedean factors included.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §3, printed p.71 (PDF p.75); §6, Theorems 9.1–9.2, printed p.74 (PDF p.78).)

*Needs:* [Global Rankin–Selberg unfolding](#global-rs-unfolding); [The Rankin–Selberg local L-factor](#rs-local-factor); [Continuation and residues of mirabolic Eisenstein series](#mirabolic-eisenstein-functional-equation); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form-rapid-decay*.


<a id="rs-global-functional-equation"></a>

**The global Rankin–Selberg functional equation.** Λ(s,π×π′)=ε(s,π×π′)Λ(1−s,π∨×π′∨), with ε the finite product of the local factors at ramified/archimedean places. Central-character signs disappear because ∏_vω_{π′_v}(−1)=ω_{π′}(−1)=1. The global product is independent of the chosen global additive character.

Work under the following hypotheses. K is a number field. The function-field rational/periodic-pole branch is treated by the separate function-field nodes. Use unitary cuspidal representations and consistent quotient measures.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §4, printed pp.71–72 (PDF pp.75–76); §6, Theorems 9.1–9.2, printed p.74 (PDF p.78).)

*Needs:* [The local Rankin–Selberg functional equation](#rs-local-functional-equation); [Global Rankin–Selberg unfolding](#global-rs-unfolding); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles).


<a id="rs-vertical-strip-bounds"></a>

**Rankin–Selberg vertical-strip bounds.** The completed Λ(s,π×π′) for unitary cuspidal inputs is bounded on finite vertical strips away from its polar points. For m=n or n−1, finite K-finite test realization reduces this to the global-integral bounds. For arbitrary rank gaps use the general Gelbart–Shahidi theorem with its normalized-intertwining-operator hypothesis verified for GL(n).

Work under the following hypotheses. K is a number field; the function-field statements are established in the separate curve-cohomological subsection below. This is a completed-function bound, not a uniform boundedness assertion for the finite Dirichlet series with gamma factors removed.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture9 §5, pp.72–73.)

*Needs:* [Archimedean realization of holomorphic multiples](#rs-archimedean-realization); [Global Rankin–Selberg unfolding](#global-rs-unfolding); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form-rapid-decay*; **AutomorphicFormsOnReductiveGroups**, AF.1.


<a id="rs-boundary-nonvanishing"></a>

**Rankin–Selberg nonvanishing on the boundary.** For unitary cuspidal π₁,π₂ over a number field, the finite partial Rankin–Selberg L^S(s,π₁×π₂) has no zeros on Re(s)≥1; its poles there occur only at1+it where π₂≅π₁∨⊗|det|^(−it), and are simple. The statement is meromorphic at a pole, not a finite-value assertion.

Work under the following hypotheses. S contains ramified and archimedean places; all finite removed factors are nonzero and regular on this boundary by the strict local exponent bound.

(Source: [Sarnak](#ref-sarnak2004), §1 p.3 (5), discussion of Shahidi.)

*Needs:* [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [The global Rankin–Selberg functional equation](#rs-global-functional-equation); [The Jacquet–Shalika Satake bound](#jacquet-shalika-satake-bound).


### Strong multiplicity one and degree-one primes


<a id="strong-multiplicity-one"></a>

**The analytic proof of strong multiplicity one.** If cuspidal π₁,π₂ of GL_n(𝔸_K) have isomorphic local components at all finite places outside a finite set, then π₁≅π₂ globally, including every omitted finite and infinite place; with AL.3/global-multiplicity-one their cusp realizations coincide.

Work under the following hypotheses. K is a number field; the function-field statements are established in the separate curve-cohomological subsection below. Unitarize the central characters consistently; every excluded finite and archimedean local factor is nonzero and finite at s=1, by the local unitary bounds and gamma calculation. Agreement at infinity is a conclusion.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Theorem9.3 and proof, pp.74–75.)

*Needs:* [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [The Jacquet–Shalika Satake bound](#jacquet-shalika-satake-bound); [Ordinary global multiplicity one for GL(n)](#global-multiplicity-one); [Local convergence and continuity](#rs-local-convergence); [The Rankin–Selberg local L-factor](#rs-local-factor).


<a id="isobaric-strong-multiplicity-one"></a>

**Strong multiplicity one for isobaric sums.** Given AF’s existence/classification of isobaric sums π=⊞_iτ_i, equality of unramified components almost everywhere determines the multiset of cuspidal constituents τ_i, including multiplicities and norm twists. Thus two isobaric representations with those components are isomorphic. For arbitrary automorphic constituents the conclusion is equality of cuspidal support, not an unproved assertion that every constituent is itself the same representation.

Work under the following hypotheses. K is a number field; the function-field statements are established in the separate curve-cohomological subsection below. Cuspidal support and normalized induction are supplied by AF.1/AF.3, with no duplicate classification here.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Theorem9.4, pp.75–76.)

*Needs:* [The analytic proof of strong multiplicity one](#strong-multiplicity-one); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); **AutomorphicFormsOnReductiveGroups**, AF.1; **AutomorphicFormsOnReductiveGroups**, AF.3.


<a id="ramakrishnan-degree-one"></a>

**Ramakrishnan’s degree-one comparison.** Let K/F be an extension of number fields admitting a tower F=K₀⊂K₁⊂…⊂K_r=K with every K_j/K_{j−1} normal. If isobaric π,π′ of GL_n(𝔸_K) agree outside finitely many primes of K having relative degree1 over F, then π≅π′. In particular, for quadratic E/F, agreement above almost all split F-primes suffices.

Work under the following hypotheses. Do not weaken the normal-tower hypothesis to an arbitrary finite extension; the solvable-normal-closure case is the separate CorollaryB.

(Source: [Ramakrishnan](#ref-ramakrishnan2018), TheoremA, pp.1–2; proof strategy pp.2–4.)

*Needs:* [Strong multiplicity one for isobaric sums](#isobaric-strong-multiplicity-one); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles).


### Central periods


<a id="normalized-rs-period"></a>

**The normalized adjacent-rank period.** For generic π_m⊠π_{m+1}, put λ_v(s,W)=∫_{N_m\GL_m}W(diag(h,1),h)|det h|^s dh and λ_v♮(W)=(λ_v(s,W)/L(s+1/2,π_m×π_{m+1}))|_{s=0}. This is a nonzero continuous H_v-invariant functional, unique up to scalar on the generic representation. For tempered inputs the integral converges for Re(s)>−1/2.

Work under the following hypotheses. Take opposite Whittaker characters; normalized quotient entire even if the raw value at0 needs continuation.

Require the following API.

- `AL3.NormalizedRsPeriod.entire`: λ_v(s)/L(s+1/2) is entire.
- `AL3.NormalizedRsPeriod.invariant`: λ_v♮ is H_v invariant.
- `AL3.NormalizedRsPeriod.unramified`: λ_v♮(W°)=1 with the conductor-zero character and stated Haar.

**Checks.**

- `AL3.NormalizedRsPeriod.spherical`: For two unramified inputs and W° the normalized value is1.
- `AL3.NormalizedRsPeriod.tempered_half_plane`: Re(s)=0 is in the tempered convergence region, while the boundary −1/2 is excluded.
- `AL3.NormalizedRsPeriod.continued_value`: A raw integral that fails to converge at0 is evaluated through the entire quotient, not declared zero by totalization.

(Source: [Leslie](#ref-leslie2025), §8.2 pp.58–59, (8.3).)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [Local convergence and continuity](#rs-local-convergence); [The unramified Rankin–Selberg test](#rs-unramified-test); **SmoothRepresentationsOfLocalGroups**, SR.5; **AutomorphicFormsOnReductiveGroups**, AF.1.


<a id="global-central-period"></a>

**Central Rankin–Selberg period factorization.** For unitary cuspidal Π_m⊠Π_{m+1} and a factorizable cusp vector φ, ∫_{GL_m(K)\GL_m(𝔸)}φ_m(h)φ_{m+1}(diag(h,1))dh=L(1/2,Π_m×Π_{m+1})∏_vλ_v♮(W_v). A quadratic idele-class twist gives the same identity with Π_m⊗η and the twisted local functionals.

Work under the following hypotheses. The product uses spherical value1 almost everywhere; quotient measures are those of Leslie §8.

(Source: [Leslie](#ref-leslie2025), Proposition8.3 and Corollary8.4 pp.59–60.)

*Needs:* [The normalized adjacent-rank period](#normalized-rs-period); [Global Rankin–Selberg unfolding](#global-rs-unfolding); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); **AutomorphicFormsOnReductiveGroups**, AF.3, *cusp-form-rapid-decay*.


### GLₙ converse theorems


<a id="gln-converse-full-rank"></a>

**The GL(n) converse theorem with twists through rank n−1.** For n≥2, under the stated niceness hypotheses for every cuspidal automorphic twist of each rank 1≤m≤n−1, Π is cuspidal automorphic. At n=2 the twisting family consists of all idele-class quasicharacters. The growth and archimedean hypotheses remain part of the niceness assumptions.

Work under the following hypotheses. F is a number field; Π is an irreducible admissible restricted tensor representation of GL_n(𝔸_F), spherical almost everywhere, with idele-class central character and Euler products convergent in a right half-plane. Local factors, duals, additive character and archimedean conventions are fixed by AL.2–AL.3. For every indicated cuspidal twist τ, both completed L(s,Π×τ) and its contragredient partner have entire continuations bounded on finite vertical strips and the matching functional equation; these conditions are hypotheses, not consequences of automorphy of τ alone.

**Checks.** At n=2 the entire twisting family is all idele-class quasicharacters, with completed dual entireness, vertical-strip bounds and the matching functional equation. At n=3 the full-rank theorem requires both GL₁ and GL₂ cuspidal twists; dropping rank two is the separately proved reduced-rank theorem. A twist with an uncancelled pole violates niceness and cannot be passed to this converse theorem.

(Source: [Cogdell, converse theorems](#ref-cogdellconverse), §2; §3 Theorem3.1, pp.5–8.)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Rankin–Selberg functional equation](#rs-local-functional-equation); [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion).


<a id="gln-converse-reduced-rank"></a>

**The GL(n) converse theorem with twists through rank n−2.** For n≥3 and a finite set S of finite places, assume niceness for every cuspidal twist of rank 1≤m≤n−2 unramified at S. If S is empty, Π is cuspidal automorphic; otherwise an automorphic representation agrees with Π outside S. For n=3 these are GL₁ twists. This theorem gives no rank-two conclusion and no highly ramified-twist variant.

Work under the following hypotheses. F is a number field; Π is an irreducible admissible restricted tensor representation of GL_n(𝔸_F), spherical almost everywhere, with idele-class central character and Euler products convergent in a right half-plane. Local factors, duals, additive character and archimedean conventions are fixed by AL.2–AL.3. For every indicated cuspidal twist τ, both completed L(s,Π×τ) and its contragredient partner have entire continuations bounded on finite vertical strips and the matching functional equation; these conditions are hypotheses, not consequences of automorphy of τ alone.

**Checks.** At n=3 and S=∅ all GL₁ twists satisfying niceness give cuspidal automorphy. Twists unramified at nonempty finite S give an automorphic representation matching outside S; neither cuspidality nor equality at S follows from this contract. n=2 is outside the hypotheses, so an empty range 1≤m≤0 yields no GL₂ theorem. Characters unramified at S are not the highly ramified T-family of Gelbart–Jacquet §9.2; that variant remains a separate proof obligation.

(Source: [Cogdell, converse theorems](#ref-cogdellconverse), §2; §3 Theorem3.3, pp.5–6,9.)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Rankin–Selberg functional equation](#rs-local-functional-equation); [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion).

### Curve arithmetic and the unramified pure realization

The following inputs precede the polynomial theorems. They are separate mathematical results: the formal Euler product does not entail rationality, purity or its degree formula.

**Curve additive analysis.** Take K=𝔽_q(X), places, completions, differential residues and canonical divisors from Tau Ceti's **AlgebraicCurves**, layers 0, 4, 5, 9 and 12. Form completion-valued adeles with the existing restricted-product carrier; distinguish them from layer 4's K-valued repartitions. For nonzero ω and a nontrivial ψ₀:𝔽_q→Circle, define ψ_v(a)=ψ₀(Tr_(k(v)/𝔽_q) res_v(aω)). The residue theorem makes its product trivial on diagonal K. Prove its conductor is P_v^(−n_v), n_v=ord_v(ω); the existing canonical-divisor degree gives Σ_v n_v deg(v)=2g−2. Apply the finite-level Fourier proof to these completions and derive the topological discreteness/cocompactness and Schwartz/Poisson comparison from the existing Riemann–Roch quotient identities. The self-dual measures and global character are compatible with ω↦aω, a∈K×.

The `CurveAdditiveAnalysis` API supplies `residueCharacter_scale`, `fractionalIdeal_annihilator`, `conductor_degree`, `global_residue_product` and `poisson`. **Checks.** on ℙ¹, dt has divisor −2∞ and the conductor-degree sum is −2; two simple poles have opposite traced residues, giving a trivial product phase on diagonal constants; ω↦tω changes each n_v by ord_v(t), whose weighted sum is zero. Prerequisites: AlgebraicCurves's cited layers, SchemeAndStackFoundations, layer 3, the existing restricted-product APIs, and AL.0's compact-open Fourier proof specialized to residue characters. Sources: Lafforgue, VI §1a–§1b, pp.152–157, Theorems VI.1, VI.2, VI.6 and VI.8; Yu, §5.3.1, pp.36–38.

**Rank-one unramified reciprocity.** Finite-order unramified idele-class characters factor through Pic(X); identify them with rank-one lisse π₁(X)-representations with prescribed geometric-Frobenius values. Use **JacobianChallenge** A, D–F for the Picard scheme, Jacobian and Abel map X→Pic¹. Prove the unramified finite-cover comparison: an abelian étale covering of X comes from the compatible finite cover of Pic¹ under that map, retaining the constant-field component. For J=Pic⁰, Fr_q−Id is a finite étale isogeny with kernel J(𝔽_q): its differential is −Id, and properness and connectedness give finiteness and surjectivity. Its torsor yields the degree-zero characters; the arithmetic constant-field quotient supplies degree characters. Pic¹ rather than a chosen rational point keeps the construction valid when X(𝔽_q) is empty. These identifications are inverse, with Frobenius/inverse-Artin convention fixed. This is the unramified GLₙ base case.

The `UnramifiedRankOneReciprocity` API gives `localPolynomial`, `tensor`, `dual`, `degreeTwist` and inverse maps. **Checks.** the trivial character gives the constant line; λ^deg(v) rotates the eigenvalue by λ^deg(v); inverse characters give dual lines. Prerequisites: the cited JacobianChallenge layers, SchemeAndStackFoundations, layers 0–2 finite-étale torsors and Frobenius, SchemeAndStackFoundations layer 3's Picard comparison, and the curve idele/divisor-class adapter. Sources: [Conrad, geometric class field theory](#ref-conradgeomcft), §3, Theorem 3.2, pp.3–4, specialized to zero modulus, with the Pic¹ distinction in §2, pp.2–3; Lafforgue, Theorem VI.9, pp.158–160. General ramified class field theory is outside this construction.

**Two-leg unramified shtukas.** For r≥1 and an 𝔽_q-scheme S, the object consists of rank-r vector bundles E,E′,E″ on X×S, injections E→E′ and E″→E′ with line cokernels on the graphs of the pole and zero S→X, and an isomorphism (Id_X×Frob_S)*E≅E″. Morphisms preserve this entire diagram. Construct the moduli stack and its Hecke correspondences. Its map to X×X is smooth of relative dimension 2r−2. Construct the two commuting partial Frobenius maps and their total-Frobenius composition; fixed-point comparisons use legs in distinct Frobenius orbits. Quotient by the central action of a degree-one idele, then use a sufficiently convex Harder–Narasimhan polygon to obtain finite-type truncations. Construct the specific no-level compactifications, smooth and proper over X×X with relative normal-crossing boundary.

The `TwoLegShtuka` API includes bundle/leg projections, diagram-preserving isomorphisms, `baseChange`, central degree translation, `partialFrobenius_commute`, `hecke_comp`, `truncation_inclusion` and `boundary_rank_partition`. **Checks.** rank one has relative dimension zero and determinant recovers its moduli problem; a rank-two boundary has rank-one graded pieces; enlarging a polygon gives an open inclusion preserving leg projections. Construct the no-level compactification by iterated-bundle degeneration. Prerequisites: **AlgebraicVectorBundles**, L0B and L2B (finite locally free sheaves and geometric bundles), SchemeAndStackFoundations, layers 1 and 3, **AlgebraicModuliForArithmeticGeometry**, layers 2–5, and IntegralHeckeAndGaloisDeterminants §3a.1 with AutomorphicFormsOnReductiveGroups AF.1 for the unramified Hecke parameters. Sources: Lafforgue, Definitions I.1–I.2, pp.17–18, I §1c–§2, pp.19–27, and the no-level compactification on pp.4–6.

**Essential cohomology and local factors.** Fix ℓ≠char(𝔽_q), an identification of algebraic coefficient fields in ℂ and Q̄_ℓ, and finite-order central character. Construct the rational ℓ-adic cohomology of these particular finite-stabilizer compactifications by descent from scheme charts; prove compatibility with finite-group invariants, Künneth, proper base change, trace and purity. The rational-coefficient hypothesis makes finite-group invariants exact. A constituent on the two-leg base is r-negligible when it is a direct summand of an external tensor product of lisse irreducibles of ranks strictly below r; retain its complement in the semisimplification.

The `EssentialShtukaCohomology` API includes the negligible summand criterion,
its stability under the commuting correspondences, the essential semisimplified
quotient, truncation comparison and boundary trace decomposition.

**Checks.**

- At r=1 no nonzero irreducible lisse sheaf has positive rank below r, so the negligible summand is zero.
- At r=2 an external tensor product of two rank-one lisse sheaves is negligible.
- The external tensor product of two geometrically absolutely irreducible rank-two local systems has rank four and irreducible factors of rank two in both directions, so it cannot be r=2-negligible. The criterion tests constituent ranks, rather than the total cohomological dimension.


Prove the proper unstable-open fixed-point comparison for these compactifications: for a correspondence generated by its dense Deligne–Mumford open part, étale first projection there and preservation of the open near its fixed points, sufficiently large compatible Frobenius iterates have stack-weighted fixed-point count equal to the alternating cohomological trace plus signed boundary-stratum traces. Local stabilization verifies the open-preservation hypothesis for the Hecke correspondences. Source: Lafforgue, Theorem IV.7, pp.97–99 and Theorem V.19, p.142 and proof pp.142–150; the no-level proper case in the remark on pp.188–189 uses this route.

The geometric targets are negligible boundary contributions, essential cohomology concentrated in degree 2r−2 and pure of weight 2r−2, and negligible kernels/cokernels under truncation change. Its finite-dimensional summand carries commuting Hecke and partial-Frobenius actions. Compute traces with the unramified t=0 truncated fixed-point formula: for distinct closed legs and sufficiently large equal total Frobenius degrees S, the cuspidal term is q^((r−1)S) times the sum over compatible cuspidal π of the Hecke trace, the inverse Satake power sum at the pole and the Satake power sum at the zero. Remaining terms are lower-rank products. Construct this counting comparison by double-coset/fixed-point and parabolic constant-term calculations before the purity conclusion. Hecke traces isolate the summand. Rank induction uses rank-one reciprocity, local/adelic zeta analysis and this counting formula, rather than the later polynomial/Riemann-hypothesis conclusions.

This yields the **unramified pure realization theorem**: for an everywhere-unramified cuspidal π of GLₙ(𝔸_K) with finite-order central character, there is an irreducible rank-n lisse Q̄_ℓ-sheaf V_π on X, with finite-order determinant, pure of weight zero, such that its geometric-Frobenius characteristic polynomial at every closed point agrees with the unitary Satake polynomial under the chosen coefficient identification. Conversely such irreducible lisse sheaves give the corresponding unramified cusp representation; uniqueness fixes dual and degree-character comparisons, and matching Frobenius polynomials identifies tensor local factors. Tensor products need not be irreducible and no cuspidal tensor transfer is asserted. For a general unitary central character, first remove a unitary degree character to reduce to finite order, then restore that character as a Weil-sheaf twist. An arbitrary unitary complex degree character is not silently treated as a continuous ℓ-adic Galois character.

The `UnramifiedPureRealization` API provides `rank`, `determinant_finiteOrder`, `pure_weight_zero`, `localPolynomial`, isomorphism invariance, `dual` and `degreeTwist`. **Checks.** rank one recovers reciprocity; the trivial line gives curve zeta factors; a self-pair with one degree self-twist has H⁰ eigenvalue 1 and H² eigenvalue q, while non-inertially-equivalent inputs have neither extreme group. Prerequisites: the preceding constructions and rank induction, SchemeAndStackFoundations layer 2 scheme cohomology and EDC.2 trace/descent, EDC.0–EDC.2 and EDC.8, DWP.0/DWP.5–DWP.7, and AF.1/AF.3's cuspidal/Hecke realizations. Sources: Lafforgue, Theorem I.13, pp.31–32; VI.15–VI.22, pp.168–182; VI.24–VI.27, pp.184–191; Theorems VI.9–VI.10, pp.158–159.

**Tensor cohomological determinant.** For V=V_(π₁)⊗V_(π₂)∨, the formal Euler series equals ∏_(i=0)^2 det(1−z Fr_q|Hⁱ(X̄,V))^((−1)^(i+1)). The dimensions of H⁰ and H² and their Frobenius eigenvalues are computed from geometric invariants, not from an assertion of rationality alone. Poincaré duality identifies H² with the dual invariant space twisted by (−1). If π₁ and π₂ are not related by a unitary degree character, both extremes vanish; for a self-pair with d degree-character self-twists they give the two cyclic factors 1−zᵈ and 1−(qz)ᵈ. The unramified Euler characteristic is (2−2g)n₁n₂, and purity places all H¹ roots at |z|=q⁻¹ᐟ². This proves the rationality, degree and root location used below. Prerequisites: the pure realization, SchemeAndStackFoundations, layer 2, EDC.2, DWP.7 and the native reversed characteristic polynomial. Sources: Lafforgue, Theorems VI.1–VI.2, p.153; Yu, Proposition 6.1.1, pp.42–43.


### Cuspidal polynomials and self-pair reciprocity


<a id="function-field-rs-euler-product"></a>

**The function-field pair Euler product.** For everywhere-unramified discrete Π₁,Π₂ over the function field of a smooth geometrically connected projective curve X/F_q, define L(Π₁×Π₂∨,z)=∏_v∏_{i,j}(1−α_{v,i}β_{v,j}^(−1)z^(deg v))^(−1) first as a formal series with constant term1. Its rationality follows after the cuspidal/residual comparisons, rather than being part of a formal infinite-product definition.

Work under the following hypotheses. Finite field q>1; finite number of points of each degree; β nonzero.

Require the following API.

- `AL3.FunctionFieldRsEulerProduct.constant`: The formal series has constant term1.
- `AL3.FunctionFieldRsEulerProduct.local`: The v factor is the determinant for α_v⊗β_v^(−1), with z raised to deg v.
- `AL3.FunctionFieldRsEulerProduct.unitary_conjugate`: For unitary Π₂ replace inverse Satake roots by conjugates as multisets.

**Checks.**

- `AL3.FunctionFieldRsEulerProduct.rank_one`: At degree d with α=2,β=3 the factor is (1−(2/3)z^d)^(−1).
- `AL3.FunctionFieldRsEulerProduct.degree_two`: A degree2 place contributes first in z², not z.
- `AL3.FunctionFieldRsEulerProduct.self_pair`: A rank-one self-pair has local factor (1−z^d)^(−1).

The light local series `AL3.ffRsLocalFactor` takes finite families α_i,β_j and a
positive integer d and returns ∏_{i,j}(1−(α_i/β_j)X^d)⁻¹ in native PowerSeries ℂ.
Its API gives the local matrix-determinant comparison, the constant coefficient 1 and
the inverse-root/conjugate-root identity when the two root multisets agree. The three
checks below distinguish this local formula as well as the global product.

The intended `AL3.FunctionFieldRsEulerProduct` signature takes places V, a positive
degree function, finiteness of {v | degree(v)≤k} for every k, and nonzero Satake roots;
it returns the formal power series whose coefficient of degree k is the coefficient
of the finite product over those places of degree at most k. Prove independence from
all finite truncations containing those places and the local-to-global comparison.


(Source: [Yu](#ref-yu2023), §5.1.2 p.30, §6.1.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); AL.3 unramified pure realization and its local-factor comparison; **AutomorphicFormsOnReductiveGroups**, AF.1.


<a id="function-field-cuspidal-polynomial"></a>

**Cuspidal pair degrees and poles over a function field.** Let π₁,π₂ be unitary everywhere-unramified cuspidal of ranks n₁,n₂, g=genus X, and write L=P/Q with P(0)=Q(0)=1 and P,Q coprime. If ranks differ or π₁,π₂ are not inertially equivalent then Q=1 and deg P=(2g−2)n₁n₂. In the self-pair rank n case, with d=|Fix(π)|, Q=(1−z^d)(1−(qz)^d) and deg P=(2g−2)n²+2d; ε=q^((g−1)n²). Unit-modulus inertial twists rotate z.

Work under the following hypotheses. Inertial equivalence means twisting by an unramified degree character; not literal equality.

(Source: [Yu](#ref-yu2023), Proposition6.1.1 and proof pp.42–43.)

*Needs:* [The function-field pair Euler product](#function-field-rs-euler-product); AL.3 unramified pure realization; AL.3 unramified pure realization and its local-factor comparison; AL.3 tensor cohomological determinant theorem.


<a id="function-field-self-pair-reflection"></a>

**The self-pair polynomial reflection.** For the self-pair numerator P above, D=(2g−2)n²+2d, P(z)=q^(D/2)z^D P(1/(qz)); every root has modulus q^(−1/2). The H¹ alternating pairing has similitude q and pairs Frobenius eigenvalues with product q.

Work under the following hypotheses. Use AL.3’s unramified pure realization and tensor cohomological determinant, geometric Poincaré duality and the chosen complex embedding.

(Source: [Yu](#ref-yu2023), Proposition6.1.1 proof p.43 and (6.2.5) p.46.)

*Needs:* [Cuspidal pair degrees and poles over a function field](#function-field-cuspidal-polynomial); AL.3 unramified pure realization and its local-factor comparison; AL.3 tensor cohomological determinant theorem.


### Residual products, telescoping and open-disc indices


<a id="residual-rs-product"></a>

**The residual Rankin–Selberg product.** Given AF’s discrete residual Π₁=π₁⊠ν₁ and Π₂=π₂⊠ν₂ in unitary normalization, L(Π₁×Π₂∨,z)=∏_{i=1}^{ν₁}∏_{j=1}^{ν₂}L(π₁×π₂∨,q^((ν₁+ν₂)/2+1−i−j)z). The ranks of Π_k are n_kν_k, where n_k is the cusp rank.

Work under the following hypotheses. ν₁,ν₂ positive integers; everywhere-unramified function-field representations. Residual classification belongs to AF, not AL.

(Source: [Yu](#ref-yu2023), Lemma6.1.3, pp.43–44.)

*Needs:* [The function-field pair Euler product](#function-field-rs-euler-product); [Cuspidal pair degrees and poles over a function field](#function-field-cuspidal-polynomial); **AutomorphicFormsOnReductiveGroups**, AF.1.


<a id="residual-rs-telescoping"></a>

**Telescoping the residual normalizing quotient.** If ν₁≥ν₂, L(Π₁×Π₂∨,z)/L(Π₁×Π₂∨,q^(−1)z)=∏_{i=1}^{ν₂}L(π₁×π₂∨,q^((ν₁+ν₂)/2−i)z)/∏_{i=1}^{ν₂}L(π₁×π₂∨,q^(−(ν₁+ν₂)/2+i−1)z).

Work under the following hypotheses. Equality of nonzero rational functions; the two products include their possible cancellations.

(Source: [Yu](#ref-yu2023), (6.1.5), p.44.)

*Needs:* [The residual Rankin–Selberg product](#residual-rs-product).


<a id="open-disc-zero-pole-index"></a>

**The open-disc zero–pole index.** For nonzero P,Q∈ℂ[z], define I(P/Q)=Σ_{a∈P.roots, |a|<1}1−Σ_{b∈Q.roots, |b|<1}1, counting multiplicities. This is independent of the rational presentation, since common roots cancel. It is N(f)−P(f) in the open unit disc; boundary roots are excluded. Use native meromorphic divisor/order APIs for the comparison.

Work under the following hypotheses. P,Q are nonzero; the zero function is excluded and roots carry multiplicity.

Require the following API.

- `AL3.OpenDiscZeroPoleIndex.presentation`: PQ′=P′Q implies equal indices for nonzero denominators.
- `AL3.OpenDiscZeroPoleIndex.mul`: I(fg)=I(f)+I(g) for nonzero rational functions.
- `AL3.OpenDiscZeroPoleIndex.inv`: I(1/f)=−I(f).
- `AL3.OpenDiscZeroPoleIndex.divisor`: I(f) equals the sum of its finite native divisor in |z|<1.

**Checks.**

- `AL3.OpenDiscZeroPoleIndex.coordinate`: I(z)=1.
- I(1/z)=−1.
- `AL3.OpenDiscZeroPoleIndex.boundary_excluded`: I(z−1)=0 since1 lies on the boundary.
- `AL3.OpenDiscZeroPoleIndex.cancelled_presentation`: I(z/z)=0, despite a zero in each presentation polynomial.

(Source: [Yu](#ref-yu2023), Corollary6.1.2, p.43.)

*Needs:* Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicOn.divisor_fun_mul`; Mathlib `MeromorphicOn.divisor_fun_inv`.


<a id="residual-rs-index"></a>

**The residual zero–pole index.** For unitary everywhere-unramified Π₁=π₁⊠ν₁,Π₂=π₂⊠ν₂ with ν₁≥ν₂, the open-disc index of L(z)/L(q^(−1)z) is ν₂(2g−2)n₁n₂ plus d=|Fix(π₁)| precisely when Π₁ and Π₂ are inertially equivalent (equivalently ν₁=ν₂ and π₁ inertially equivalent to π₂); otherwise there is no d term.

Work under the following hypotheses. Inertial twists have unit-modulus degree parameter, so they rotate roots without changing this index. The extra term depends on inertial equivalence, including nontrivial degree twists, rather than equality of representations.

(Source: [Yu](#ref-yu2023), Corollary6.1.2 and proof pp.43–44.)

*Needs:* [Telescoping the residual normalizing quotient](#residual-rs-telescoping); [The self-pair polynomial reflection](#function-field-self-pair-reflection); [The open-disc zero–pole index](#open-disc-zero-pole-index).


### Scalar normalizers and conductor shifts


<a id="rs-normalizing-scalar"></a>

**The Rankin–Selberg normalizing scalar.** For a positive root β joining residual blocks Π_i,Π_j of ranks N_i,N_j over X/F_q, put n_β(z)=q^((1−g)N_iN_j)L(Π_i×Π_j∨,z)/L(Π_i×Π_j∨,q^(−1)z). The scalar for a Weyl element is the product over its positive inversion roots, with the corresponding character ratios substituted for z. The actual intertwining operators remain with AA/AF.

Work under the following hypotheses. Nonzero rational factors; equality is meromorphic/rational, not a value formula at poles.

Require the following API.

- `AL3.RsNormalizingScalar.root`: The single-root scalar is the displayed shifted-L quotient.
- `AL3.RsNormalizingScalar.identity_weyl`: The empty inversion product is1.
- `AL3.RsNormalizingScalar.weyl_product`: For length-additive Weyl products, inversion factors compose after character substitution.

**Checks.**

- `AL3.RsNormalizingScalar.genus_one`: At g=1 the q prefactor is1.
- `AL3.RsNormalizingScalar.one_root`: A simple reflection has exactly one root factor.
- `AL3.RsNormalizingScalar.pole_not_value`: If the numerator has a pole at z=1, the scalar is compared as a rational function, not by substituting a totalized pole value.

(Source: [Yu](#ref-yu2023), §5.1.2 (5.1.1)–(5.1.3) pp.29–30.)

*Needs:* [Telescoping the residual normalizing quotient](#residual-rs-telescoping); [The function-field pair Euler product](#function-field-rs-euler-product).


<a id="self-pair-normalizer-reflection"></a>

**Reflection of the self-pair normalizer.** For Π=π⊠ν, cusp rank r, f=|Fix(π)| and self-pair numerator P, define F(z)=∏_{i=1}^ν P(q^(−i)z)∏_{i=1}^ν(1−(q^iz)^f)∏_{i=1}^{ν−1}(1−(q^iz)^f). Then n_β(z)=−z^E F(1/z)/F(z), E=((2g−2)r²+4f)ν−f. F is a polynomial in z^f with no roots on |z|=1.

Work under the following hypotheses. ν≥1; q>1 and the self-pair reflection/purity theorem. E is an integer, so this is a rational monomial identity.

(Source: [Yu](#ref-yu2023), (6.2.5)–(6.2.6), p.46.)

*Needs:* [The Rankin–Selberg normalizing scalar](#rs-normalizing-scalar); [The self-pair polynomial reflection](#function-field-self-pair-reflection).


<a id="whittaker-conductor-shift"></a>

**Spherical Whittaker normalization at nonzero conductor.** Let ψ_v be trivial on P_v^(−n_v) but not P_v^(−n_v−1), and t_v=diag(ϖ_v^(−(n−1)n_v),…,ϖ_v^(−n_v),1). Then W↦(g↦W(t_vg)) identifies the spherical ψ_v model with the conductor-zero ψ_v(ϖ_v^(−n_v)·) model. For a nonzero spherical W, W(t_v)≠0. For the differential-defined global character, Σ_v n_v deg v=2g−2.

Work under the following hypotheses. Use AL.3’s curve additive character and the canonical divisor from AlgebraicCurves, layer 12. The differential theory is supplied by AlgebraicCurves, layer 12.

(Source: [Yu](#ref-yu2023), Lemma5.3.3 proof pp.37–38.)

*Needs:* [The Whittaker realization](#whittaker-model); [The unramified Rankin–Selberg test](#rs-unramified-test); AL.3 curve additive analysis.


### The periodic pole clearer


<a id="trivial-function-field-pole-clearer"></a>

**Clearing the trivial function-field poles.** For the trivial character over X/F_q, let ζ_X(s)=P_X(q^(−s))/((1−q^(−s))(1−q^(1−s))) and Λ(1,s)=q^((g−1)(s−1/2))ζ_X(s). Then q^(s−1/2)(1−q^(−s))(1−q^(1−s))Λ(1,s)=q^(g(s−1/2))P_X(q^(−s)) is entire and symmetric under s↦1−s. Its central derivatives are nonnegative by the paired-root argument; for g=0 it is1.

Work under the following hypotheses. The curve-cohomological determinant theorem of AL.3 supplies the zeta numerator, reciprocity and root location. The number-field factor s(s−1) does not remove the periodic function-field poles.

(Source: [Yun–Zhang](#ref-yunzhang2017), Appendix B, Remark B.5, p.906; apply the displayed reciprocal zeta-factor calculation above to clear every periodic pole.)

*Needs:* [Super-positivity of the standard completion](#standard-superpositivity); AL.3 tensor cohomological determinant theorem.


### Whittaker/cohomological rational comparison


<a id="rational-period-comparison"></a>

**The rational-period comparison after choosing structures.** Given the specified Whittaker and cohomological E-rational structures for a cohomological cuspidal Π and a permissible real-place signature ε, and a fixed nonzero infinity cohomology vector defining F_Π^ε, normalize F_Π^ε by p^ε(Π)^(−1) to preserve those structures. The period is in C×/E×. Scaling the infinity vector by c scales the comparison and period by c; changing rational bases changes a representative by E×. Twisting by algebraic ξ changes the period class by G(ξ_f)^(n(n−1)/2) with the signature ε·ε_ξ.

Work under the following hypotheses. Use Raghuram §2.5.2: Π∈Coh(G_n,μ∨) is regular algebraic cuspidal over a number field with the stated strongly pure weight. The permissible signature ε cuts out the one-dimensional bottom-degree archimedean cohomology line. E contains Q(μ) and Q(Π_f); for the twist comparison enlarge E to contain the character rationality field as well. Construct the comparison and Gauss twisting theorem from AF.4 finite-part rationality and the ALS.5b Betti/cohomological realizations. Require their actual E-structures and the chosen infinity comparison vector. This conditional comparison proves no critical-value algebraicity theorem. Under σ∈Aut(ℂ), use the corrected signature convention of Raghuram §2.5.2.5, not an undefined σ ε.

Require the API `AL3.RationalPeriodComparison.class`, `infinity_scale`,
`rational_basis` and `gauss_twist`: the class lies in ℂ×/E×, an infinity-vector
rescaling rescales a representative, rational changes of basis preserve the class,
and algebraic twisting has the stated Gauss exponent and signature.

**Checks.**

- Over E=ℚ, rescaling the infinity vector by i multiplies the representative by i and changes its class; no canonical representative can ignore this choice.
- A rational basis rescaling by 2 changes the representative by an E-unit and preserves its class.
- At n=1 the Gauss exponent n(n−1)/2 is zero; at n=2 it is one. Squaring the Gauss sum at rank two gives the wrong twist comparison.


(Source: [Raghuram](#ref-raghuram2016), §2.5.2 pp.24–25 (2.37)–(2.39).)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Gauss sum 𝔤(ω, ψ)](#local-gauss-sum); **AutomorphicFormsOnReductiveGroups**, AF.4, *clozel-rationality*; **AutomorphicFormsOnReductiveGroups**, AF.4, *cohomological-representation*; **ArithmeticLocallySymmetricSpaces**, ALS.5b.1, *de-rham-comparison*; **ArithmeticLocallySymmetricSpaces**, ALS.5b.4, *automorphic-comparison*; **ArithmeticLocallySymmetricSpaces**, ALS.5b.5, *cuspidal-cohomology*.


### Examples

For GL₂×GL₁ the exponent is s−1/2; in equal rank one the product-character Tate integral also needs the Schwartz factor. A degree-two place with roots 2 and 3 contributes 2/3 to the coefficient of z² and zero to that of z. At genus zero the trivial-character periodic pole clearer is 1. The quotient s/s continues to 1 at zero even though totalized 0/0 equals zero.

### Dependencies

AL.0–AL.1 and the local AL.2 prefix; AL.4's determinant interpretation before the function-field suffix; SmoothRepresentationsOfLocalGroups SR.2–SR.5; AutomorphicFormsOnReductiveGroups AF.1–AF.4; AdelicAlgebraicGroups §§2.2–2.3; ArithmeticLocallySymmetricSpaces ALS.5b; AlgebraicCurves layers 0, 4, 5, 9 and 12; JacobianChallenge A and D–F; SchemeAndStackFoundations layers 0–3; AlgebraicVectorBundles L0B and L2B; AlgebraicModuliForArithmeticGeometry layers 2–5; EtaleDualityAndPerverseSheaves EDC.0–EDC.2 and EDC.8; DeligneWeightsAndPurity DWP.0–DWP.1 and DWP.5–DWP.7.


## Layer AL.4: Parameters and local determinant comparisons


### Satake factors and convergence


<a id="l-group-local-factor"></a>

**The unramified L-group Euler factor.** Given unramified G/F, a semisimple Satake conjugacy class t in the Frobenius coset of the L-group, and a finite-dimensional complex representation r of that L-group, P_{t,r}(T)=det(1−T r(t)) and L(s,t,r)=P_{t,r}(q^(−s))^(−1). Use native Matrix.charpolyRev for the polynomial; this target adds independence and the Satake normalization interface.

Work under the following hypotheses. Finite residue cardinality q>1; r(t) acts on a finite-dimensional space.

Require the following API.

- `AL4.LGroupLocalFactor.conjugacy`: Conjugate Satake parameters give the same polynomial.
- `AL4.LGroupLocalFactor.direct_sum`: P_{r⊕r′}=P_r P_{r′}.
- `AL4.LGroupLocalFactor.standard_gln`: For GL_n standard r, P=∏(1−α_iT).

**Checks.**

- `AL4.LGroupLocalFactor.zero_dimensional`: The zero representation gives P=1 and L=1.
- `AL4.LGroupLocalFactor.one_dimensional`: r(t)=a gives P=1−aT.
- `AL4.LGroupLocalFactor.tensor_not_product`: Scalars a=2,b=3 give tensor P=1−6T, whereas the direct sum gives 1−5T+6T².
- `AL4.LGroupLocalFactor.gln2_integral_shift`: Integral Hecke roots are q^(1/2) times the unitary GL₂ Satake roots.

(Source: [Borel](#ref-borel1979), §13.1 pp.49–50.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, AF.1; **IntegralHeckeAndGaloisDeterminants**, §3a.1, Normalized Satake coefficients for GLn; Mathlib `Matrix.charpolyRev`; **ReductiveGroupsPartII**, RG2.5; **SmoothRepresentationsOfLocalGroups**, SR.4.


<a id="partial-l-product-convergence"></a>

**Convergence of partial automorphic Euler products.** For a unitarizable automorphic π and finite-dimensional r as in Borel13.2, excluding ramified places gives L^S(s,π,r)=∏_{v∉S}P_{t_v,r}(q_v^(−s))^(−1), absolutely convergent for Re(s)>c(π,r). No general continuation or functional equation follows for arbitrary r.

Work under the following hypotheses. Use a uniform Satake eigenvalue bound |eigenvalue r(t_v)|≤q_v^a and sum_v q_v^(−σ)<∞ for σ>1.

(Source: [Borel](#ref-borel1979), Theorem13.2 pp.50–51.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); Tau Ceti **ArithmeticDirichletSeries**, layer 3 local factors and euler products; **SmoothRepresentationsOfLocalGroups**, SR.4.


### Weil–Deligne normalization and factor operations


<a id="local-parameter-comparison"></a>

**Compatibility of local analytic factors with parameters.** For GL_n standard factors and GL_n×GL_m tensor factors, whenever an actual local Langlands parameter with L/ε compatibility is given, the analytic factors from AL.2/AL.3 equal the Weil–Deligne factors. At an unramified place this reduces to P=det(1−T Fr). For a general L-group r, ramified factors require an actual parameter and are not defined from a spherical class.

Work under the following hypotheses. At infinity use AF.1’s archimedean LLC; at finite places assume the stated L/ε-compatible parameter comparison. ArithmeticGaloisRepresentations §§2.4–2.7 supplies finite-extension-of-ℚₚ factors with geometric Frobenius, reciprocity and monodromy invariants. The classical and Hilbert GL₂ comparisons here take an actually compatible arithmetic realization, away from the coefficient prime, as an input; they neither construct that realization nor assert general finite-place compatibility. Preserve the arithmetic normalization dictionary: the classical weight-k Euler factor uses M=ρ_f^∨ with geometric Frobenius and converts to unitary normalization by the (k−1)/2 shift. In the cited Hilbert instance WD(ρ_π) corresponds to Rec(π⊗|·|^(−1/2)), hence L(WD(ρ_π),s)=L(s−1/2,π). Neither input asserts an unshifted equality for ρ itself.

(Source: [Borel](#ref-borel1979), §12.1–12.2, p.48 (conditional general parametrization; established GL_n cases distinguished).)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); [The standard local L-factor](#standard-local-l-factor); [The Rankin–Selberg local L-factor](#rs-local-factor); **AutomorphicFormsOnReductiveGroups**, AF.1, *archimedean-llc-gln*; **ArithmeticGaloisRepresentations**, §2.4, Arithmetic Weil–Deligne adapter; **ArithmeticGaloisRepresentations**, §2.5, Local factors; **ArithmeticGaloisRepresentations**, §2.7, Local constants; AL.4 conditional classical weight-k normalization comparison; AL.4 conditional Hilbert normalization comparison.


<a id="satake-factor-operations"></a>

**Functorial operations on unramified factors.** For invertible semisimple Satake operators with eigenvalues α_i and β_j, direct sum multiplies P, tensor product has P(T)=∏_(i,j)(1−α_iβ_jT), dual has P(T)=∏_i(1−α_i^(−1)T), and scalar twist c has P_c(T)=P(cT). Coefficient embeddings commute with these polynomial identities. These are factor comparisons, not assertions of automorphic transfers.

Work under the following hypotheses. Actual L-group representations and normalized Satake classes are supplied; dual requires invertibility.

(Source: [Borel](#ref-borel1979), §13.1 pp.49–50, local representation factor.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); Mathlib `Matrix.charpolyRev`.


<a id="exterior-power-transfer-comparison"></a>

**Exterior-power factors after an established transfer.** Given an established exterior-power transfer Π^(j) of Π with unramified parameter wedge^j(t_v), its partial standard factor equals ∏_v∏_(I⊂{1,…,n},|I|=j)(1−(∏_(i∈I)α_(v,i))q_v^(−s))^(−1). For BCGP’s H¹ decomposition into GL_(n_i) constituents, arithmetic shifts are(1−n_i)/2 separately on each constituent; their exterior-power decompositions inherit those shifts.

Work under the following hypotheses. The actual exterior-square/symmetric-square transfers and any tensor transfer used must be imported from their owners; no all-rank exterior transfer is assumed.

(Source: [Borel](#ref-borel1979), §16.1, p.55, displayed L/epsilon-factor comparison; [Boxer–Calegari–Gee–Pilloni](#ref-bcgp2025), §1.8.25, p.16.)

*Needs:* [Functorial operations on unramified factors](#satake-factor-operations); [Compatibility of local analytic factors with parameters](#local-parameter-comparison).


<a id="motivic-unitary-shift"></a>

**The motivic versus unitary Rankin–Selberg centre.** For pure realizations of weights w₀,w₁ whose unramified eigenvalues are q^(w_i/2) times the unitary Satake roots, the motivic tensor factor at s equals the unitary Rankin–Selberg factor at s−(w₀+w₁)/2. In Liu’s Sym^(n−1)H¹⊗Sym^nH¹ case the tensor weight is2n−1 and the motivic central point n corresponds to unitary1/2.

Work under the following hypotheses. Require the actual local-global identification at every place compared; do not infer motivic purity or Galois compatibility from the analytic factor.

(Source: [Liu–Tian–Xiao–Zhang–Zhu](#ref-liu2022), §1.1 pp.109–112, Rankin–Selberg motive normalization.)

*Needs:* [The unramified Rankin–Selberg test](#rs-unramified-test); [Compatibility of local analytic factors with parameters](#local-parameter-comparison).


### Examples

The one-dimensional operators 2 and 3 give tensor polynomial 1−6T; their direct sum gives 1−5T+6T². In rank two the integral Hecke roots are sqrt(q) times the unitary roots, so the linear coefficient becomes −sqrt(q)(α₁+α₂). For total motivic weight 2n−1 the arithmetic centre n maps to 1/2.

### Dependencies

AL.2–AL.3 local factors; ReductiveGroupsPartII RG2.5; SmoothRepresentationsOfLocalGroups SR.4; IntegralHeckeAndGaloisDeterminants §3a.1; ArithmeticGaloisRepresentations §§2.4–2.7; AutomorphicFormsOnReductiveGroups AF.1; completed ArithmeticDirichletSeries layer 3.


## Layer AL.5: Values, signs and finite corrections


### Imprimitive functions and leading terms


<a id="finite-euler-correction"></a>

**Finite Euler corrections at critical points.** For a finite set S and local polynomials P_v(T), define E_S(s)=∏_{v∈S}P_v(q_v^(−s)). The imprimitive value is L^S(s)=E_S(s)L(s) as a meromorphic identity. It can be evaluated at s₀ only with the relevant holomorphy/limit hypotheses.

Work under the following hypotheses. q_v>1, P_v(0)=1; L includes the specified archimedean normalization.

Require the following API.

- `AL5.FiniteEulerCorrection.empty`: E_∅=1.
- `AL5.FiniteEulerCorrection.union`: For disjoint S,T, E_{S∪T}=E_S E_T.
- `AL5.FiniteEulerCorrection.value`: If both terms are holomorphic at s₀, L^S(s₀)=E_S(s₀)L(s₀).
- `AL5.FiniteEulerCorrection.orders`: ord_{s₀}(L^S)=ord_{s₀}(E_S)+ord_{s₀}(L).

**Checks.**

- `AL5.FiniteEulerCorrection.empty_set`: Removing no places preserves the value.
- `AL5.FiniteEulerCorrection.simple_exceptional_zero`: If E=1−p^(−s), then E(0)=0; division by E(0) cannot recover L(0).
- `AL5.FiniteEulerCorrection.double_exceptional_zero`: E=(1−p^(−s))² has order2 at0 and E″(0)=2(log p)².

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §7, pp.74–75, finite-product comparison and its analytic value consequence.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); [Continuation and functional equation of Hecke L-functions (Kudla Corollary 4.4)](#hecke-l-functional-equation); [The Rankin–Selberg local L-factor](#rs-local-factor); Mathlib `meromorphicOrderAt_mul`.


<a id="euler-correction-leading-term"></a>

**The leading term of a finite Euler correction.** Let E and L be holomorphic near s₀, E have finite vanishing order m and L have finite order r. Then EL has order m+r and leading Taylor coefficient the product of the two leading coefficients. In particular if E(s₀)=0, E′(s₀)≠0 and L(s₀)≠0, (EL)′(s₀)=E′(s₀)L(s₀). For E(s)=1−a q^(−s) with a q^(−s₀)=1, E′(s₀)=log q.

Work under the following hypotheses. q>1; zero functions require separate infinite-order cases. This is complex analytic comparison, not a p-adic exceptional-zero formula.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §7, pp.74–75, finite-factor identity; leading term follows by analytic multiplication.)

*Needs:* [Finite Euler corrections at critical points](#finite-euler-correction); Mathlib `MeromorphicOn.divisor_fun_mul`; Mathlib `meromorphicOrderAt_mul`.

### Complex period and stabilization dictionary

The local GL₂ comparison takes an actual holomorphic newform f over ℚ of weight k+2, a complex embedding of its coefficient field, nonzero periods Ω⁺ and Ω⁻ and its proved critical-value algebraicity theorem. For a primitive finite-order character χ, fix the convention that the analytic twist is f⊗χ⁻¹ and the normalized value uses its primitive Gauss sum and sign χ(−1)(−1)^j. At s=j+1, 0≤j≤k, put N=(2πi)^(j+1)Ω^sign/(G(χ)j!), with all factors nonzero, and require L(f⊗χ⁻¹,j+1)/N to belong to the chosen coefficient field enlarged by the character values. The completed value is Γ∞(j+1)L(f⊗χ⁻¹,j+1), so division by Γ∞(j+1)N gives the same algebraic value. Conjugation acts on all coefficients, character values, Gauss sum and period representative together. This is a conditional comparison of actual complex values; it does not construct the periods or deduce algebraicity from a scalar division identity. Its critical-value hypotheses and rational period line are stated explicitly, with the classical finite and completed L-series supplied by Tau Ceti's modular L-function API. Source: Rodrigues Jacinto–Williams, Appendix B, Theorem B.1, pp.208–209, for the character, sign and conductor dictionary; the algebraicity theorem is an input. AL.3's rational-period comparison provides the compatible cohomological period class when those rational structures have been identified.

For p∤level(f), choose α≠0 with αβ=ε(p)p^(k+1). Define `AL5.pStabilizedCoeff`, the **complex stabilization coefficient**, a_α(n)=a(n)−β·1_(p|n)a(n/p), the coefficient formula for f_α=f−βf(pz). Its API `AL5.pStabilizedCoeff.not_dvd`, `AL5.pStabilizedCoeff.mul` and `AL5.pStabilizedCoeff.LSeries` gives coefficients at indices prime to p and at multiples of p, and the factor relation

L(f_α,χ⁻¹,s)=(1−βχ⁻¹(p)p⁻ˢ)L(f,χ⁻¹,s)

in the absolute-convergence half-plane and then meromorphically, and compatibility with the chosen complex embedding. The relation uses multiplicativity of the character and absolute summability to reindex the L-series. **Checks.** a_α(1)=a(1) for p>1; if a(1)=1 and a(p)=α+β then a_α(p)=α; if χ has p-power conductor greater than one, its zero-extended value at p is zero and the twisted correction equals 1. Its normalization is fixed independently of any construction of a p-adic distribution. The ordinary interpretation additionally requires α to be a p-adic unit; the complex formula itself is defined for any nonzero refinement. Prerequisites: the native `LSeries`/`LSeriesSummable` APIs, the modular coefficient and Hecke relations already in Tau Ceti, and AL.5's finite Euler correction. Source: Rodrigues Jacinto–Williams, Appendix B, pp.207–209, together with this coefficient reindexing argument. Substituting s=j+1 supplies exactly the second factor of `OrdinaryGl2EulerFactor`; the p-level interpolation expression supplies the first.


### Critical-value and sign interfaces


<a id="critical-value-period-interface"></a>

**The critical-value and period interface.** For a holomorphic GL₂/ℚ cohomological cusp representation, take the nonzero period line and actual critical-value algebraicity theorem specified in the complex dictionary. At a critical point with nonzero finite archimedean gamma value, write C=γF and use the full nonzero normalization N from the dictionary. Given F/N∈E, the comparison gives C/(γN)=F/N∈E. Transport the identity through the chosen coefficient embedding with the primitive-character, Gauss-sum, sign and motivic/unitary conventions fixed. This conditional comparison transports the normalized value’s membership in the supplied coefficient field; the algebraicity theorem is an input.

Work under the following hypotheses. γ≠0, N≠0, C=γF and the actual input theorem F/N∈E; the critical point avoids gamma poles. The GL₂/ℚ algebraicity theorem fixes parity, primitive characters and Gauss sums as in the complex period dictionary above. The stated ℚ theorem has no general-number-field conclusion.

(Source: [Rodrigues Jacinto–Williams](#ref-rodriguesjacintowilliams2025), AppendixB TheoremB.1 pp.207–209.)

*Needs:* [The global standard L-function](#global-godement-jacquet); [The Rankin–Selberg local L-factor](#rs-local-factor); AL.5 complex period and character dictionary.


<a id="central-sign-vanishing"></a>

**The functional-equation sign at the centre.** If the conductor-balanced completed L-function is holomorphic at1/2, self-dual, and satisfies Λ(s)=−Λ(1−s), then Λ(1/2)=0. More generally its first nonzero Taylor term at the centre has parity determined by the root number. If the gamma value is finite and nonzero, the same vanishing order holds for the finite L-function.

Work under the following hypotheses. Self-duality identifies both sides without an extra conjugation or twisting; the root number is ±1.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §4, pp.71–72, functional equation and its central-value consequence.)

*Needs:* [Continuation and functional equation of Hecke L-functions (Kudla Corollary 4.4)](#hecke-l-functional-equation); [The global standard L-function](#global-godement-jacquet); [The local Rankin–Selberg functional equation](#rs-local-functional-equation).


### Refined GL₂ Euler factors and conductor tests


<a id="ordinary-gl2-euler-factor"></a>

**The ordinary GL₂ interpolation factor.** For a good prime p, weight k+2, nebentypus ε and chosen nonzero refinement α with β=ε(p)p^(k+1)/α, define E_p(χ,j)=(1−χ(p)p^j/α)(1−χ^(−1)(p)ε(p)p^(k−j)/α), 0≤j≤k. A ramified p-power character is extended byχ(p)=χ^(−1)(p)=0, so E_p=1. The conductor-normalized prefactor α^(−ν) for condχ=p^ν is separate.

Work under the following hypotheses. Use the complex character/period/Gauss dictionary stated in AL.5; the two-factor expression uses the good-prime newform, whereas the p-level eigenform has the first factor only.

Require the following API.

- `AL5.OrdinaryGl2EulerFactor.ramified`: For ν>0 both local character values are0 and E_p=1.
- `AL5.OrdinaryGl2EulerFactor.unramified`: For χ=1 use the displayed two-factor product.
- `AL5.OrdinaryGl2EulerFactor.refinement`: Changing α changes β and the Euler correction; the unrefined form alone does not determine E_p.
- `AL5.OrdinaryGl2EulerFactor.newform`: The p-level eigenform formula has only the first factor; the primitive newform adds the second factor after the character dictionary.

**Checks.**

- `AL5.OrdinaryGl2EulerFactor.trivial_weight_two`: k=j=0,χ=1,ε(p)=1 gives(1−1/α)².
- A conductor-p character gives E_p=1, with the separate prefactorα^(−1).
- `AL5.OrdinaryGl2EulerFactor.exceptional`: α=1,k=j=0 gives E_p=0; it cannot be canceled.
- `AL5.OrdinaryGl2EulerFactor.different_roots`: For p=3,k=j=0, ε(p)=1 and Hecke polynomial X²+3, the refinements α=±i√3 are both valid roots and give distinct corrections (1−1/α)².

(Source: [Rodrigues Jacinto–Williams](#ref-rodriguesjacintowilliams2025), Appendix B TheoremB.1 p.208, with input newform comparison.)

*Needs:* [Finite Euler corrections at critical points](#finite-euler-correction); AL.5 complex period and character dictionary; AL.5 complex stabilization coefficient comparison.


<a id="local-conductor-test-vector-comparison"></a>

**Conductor and test-vector compatibility.** For generic irreducible π of GL_n(F) with conductor-zero ψ, the degree in q^(−s) of the standard epsilon monomial is c_π, the imported generic newform conductor. The GJ normalized newform integral realizes L(s,π). At a good GL₂ place, twisting an unramified π by a ramified character χ of conductorν>0 gives L(s,π⊗χ)=1 and conductor2ν. At rank1 it gives L=1 and conductorν.

Work under the following hypotheses. The GL₂ twist assertion uses an unramified generic representation; it is not a formula for arbitrary already-ramified π. Nonzero newform normalization and compatible measures are required.

(Source: [Atobe–Kondo–Yasuda](#ref-atobekondoyasuda2022), Introduction pp.2–3 epsilon conductor; generic-newform application.)

*Needs:* [A ramified Godement–Jacquet test vector](#godement-jacquet-newform-test); [The local Gauss sum 𝔤(ω, ψ)](#local-gauss-sum); [Compatibility of local analytic factors with parameters](#local-parameter-comparison); **SmoothRepresentationsOfLocalGroups**, SR.5.


### Examples

At s=0, 1−p^(−s) has derivative log(p), and its square has second derivative 2(log p)². At weight two the trivial-character correction is (1−1/α)², which vanishes at α=1. A ramified character has zero-extended value zero at p and leaves the separate conductor factor α^(−ν).

### Dependencies

AL.1–AL.4; SmoothRepresentationsOfLocalGroups SR.5; Tau Ceti's modular coefficient and L-function APIs; the actual critical-value algebraicity input with nonzero period and Gauss sum specified in AL.5.


## References

Locators above refer to these editions. Physical thesis pages and preprint page numbers are distinguished from published pagination.


<a id="ref-atobekondoyasuda2022"></a>

[Local newforms for the general linear groups over a non-archimedean local field](https://arxiv.org/pdf/2110.09070v4), Hiraku Atobe, Satoshi Kondo and Seidai Yasuda. arXiv:2110.09070v4; Forum Math.Pi10 (2022),e22.


<a id="ref-borel1979"></a>

[Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf), Armand Borel. Corvallis II, PSPM33 (1979), 27–61, published scan.


<a id="ref-bcgp2025"></a>

[Modularity theorems for abelian surfaces](https://math.uchicago.edu/~fcale/papers/Modular.pdf), George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. Author manuscript corresponding to arXiv2502.20645v1.


<a id="ref-cheneviertaibi2020"></a>

[Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), Gaëtan Chenevier, Olivier Taïbi. Publ. Math. IHÉS 131 (2020), 261–323 (published online 5 March 2020); published PDF.


<a id="ref-cogdellintegrals"></a>

[L-functions and converse theorems for GL(n)](https://people.math.osu.edu/cogdell.1/columbia-www.pdf), James W. Cogdell. Author Columbia lecture notes.


<a id="ref-cogdellfields"></a>

[Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), James W. Cogdell. Author Fields Institute lecture notes, 2004.


<a id="ref-cogdellconverse"></a>

[Piatetski-Shapiro’s Work on Converse Theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), James W. Cogdell. Contemporary Mathematics survey, author PDF.


<a id="ref-dukeimamoglutoth2016"></a>

[Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), William Duke, Özlem Imamoğlu and Árpád Tóth. Annals184 (2016),949–990; published PDF.


<a id="ref-grosszagier1986"></a>

[Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Benedict H. Gross and Don B. Zagier. Inventiones84 (1986),225–320; published scan.


<a id="ref-humphriesgj"></a>

[Test vectors for nonarchimedean Godement–Jacquet zeta integrals](https://arxiv.org/pdf/1903.02031v2), Peter Humphries. arXiv:1903.02031v2.


<a id="ref-humphriesarch"></a>

[Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2), Peter Humphries. arXiv:2008.12406v2.


<a id="ref-humphriesnordentoft"></a>

[Sparse equidistribution of geometric invariants of real quadratic fields](https://arxiv.org/pdf/2211.05890v2), Peter Humphries and Asbjørn Christian Nordentoft. arXiv:2211.05890v2.


<a id="ref-jacquetarch"></a>

[Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), Hervé Jacquet. Contemporary Mathematics 489 (2009), 57–172, author manuscript.


<a id="ref-kudla2004"></a>

[Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), Stephen S. Kudla. Chapter 6, An Introduction to the Langlands Program, Birkhäuser 2004, pp.109–131; published chapter scan.


<a id="ref-leslie2025"></a>

[The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/pdf/1911.07907v3), Spencer Leslie. arXiv:1911.07907v3; published Annals201 (2025).


<a id="ref-liu2022"></a>

[On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu. Inventiones mathematicae 228 (2022), 107–375; published PDF.


<a id="ref-raghuram2016"></a>

[Critical values of Rankin–Selberg L-functions for GL_n×GL_(n−1) and the symmetric cube L-functions for GL₂](https://repository.ias.ac.in/105986/1/GL%28n%29xGL%28n-1%29-revised.pdf), A. Raghuram. Author revised manuscript; Forum Mathematicum28 (2016),457–489.


<a id="ref-ramakrishnan2018"></a>

[A mild Tchebotarev theorem for GL(n)](https://arxiv.org/pdf/1806.08429v1), Dinakar Ramakrishnan. arXiv:1806.08429v1.


<a id="ref-rodriguesjacintowilliams2025"></a>

[An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Joaquín Rodrigues Jacinto and Chris Williams. Essential Number Theory4 (2025),101–216; published PDF.


<a id="ref-sarnak2004"></a>

[Nonvanishing of L-functions on Re(s)=1](https://web.math.princeton.edu/sarnak/ShalikaBday2002.pdf), Peter Sarnak. Author manuscript dated January21,2004.


<a id="ref-tate1950"></a>

[Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), John Tate. Princeton doctoral thesis, May 1950; original thesis scan, not the 1967 reprint.


<a id="ref-thornerzaman2017"></a>

[An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), Jesse Thorner and Asif Zaman. Algebra & Number Theory11 (2017), 1135–1197.


<a id="ref-yu2023"></a>

[Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Hongjie Yu. arXiv:1807.04659v5, 18 July2022.


<a id="ref-yuanzhang2018"></a>

[On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Xinyi Yuan and Shou-Wu Zhang. Annals187 (2018),533–638; published PDF.


<a id="ref-yunzhang2017"></a>

[Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf), Zhiwei Yun and Wei Zhang. Annals186 (2017), 767–911; published author PDF.


<a id="ref-zhang2021"></a>

[Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), Wei Zhang. Annals 193 (2021), 863–978; published PDF.


<a id="ref-lafforgue2002"></a>

[Laurent Lafforgue, *Chtoucas de Drinfeld et correspondance de Langlands*](https://www.laurentlafforgue.org/math/fulltext.pdf), Inventiones Mathematicae 147 (2002), 1–241. The unramified pure realization uses the explicit no-level geometry, the essential-cohomology comparison and Theorems VI.9–VI.10; the curve determinant and epsilon conventions are Theorems VI.1, VI.2, VI.6 and VI.8.


<a id="ref-conradgeomcft"></a>

[Brian Conrad, *Geometric global class field theory*](https://math.stanford.edu/~conrad/249BW09Page/handouts/geomcft.pdf), Math 249B handout, pp.1–4. The zero-modulus finite-cover classification is Theorem 3.2; Pic¹ retains curves without a rational point.

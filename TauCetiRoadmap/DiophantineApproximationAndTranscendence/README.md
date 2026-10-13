# Roadmap: diophantine approximation and transcendence

**Summary.** Build heights, approximation exponents and auxiliary polynomials to prove Roth and absolute quantitative Subspace theorems. Develop exponential transcendence and logarithmic bounds, then effective equations, arithmetic power series, Mahler systems and Ax–Schanuel. Schanuel’s conjectural consequences retain their hypotheses. The foundations are Mathlib’s number fields, heights, polynomials, analysis and differential algebra, with Tau Ceti’s product formula and dimension theory.

## Scope and ownership

Own primitive minimal-polynomial and algebraic-element size adapters, approximation exponents, multivariate divided derivatives, weighted indices, auxiliary-polynomial nonvanishing, Roth and absolute Subspace theorems, finite-rank unit equations, recurrences, exponential transcendence, logarithmic bounds, effective Diophantine equations, E-/G-/Mahler functions, the Picard–Vessiot and differential-Galois comparisons needed by E-function specialization, and exponential Ax–Schanuel with its algebraic differential forms.

Mathlib owns places, relative and absolute heights, number-field house, polynomial Mahler measure, univariate Hasse derivatives, power series and differential modules. The variants here concern arbitrary algebraic elements, coefficient vectors and auxiliary constructions. Fixed-field Northcott and Dirichlet’s unit rank, torsion/basis decomposition and infinitude criterion are supplied by Mathlib; bounded-degree Northcott, Kronecker and the Mahler/absolute-height dictionary are consumed from ArithmeticHeights Layer 1. Mathlib’s `Orientation.abs_volumeForm_apply_le` and `Orientation.volumeForm_robust'` supply the real determinant form of Hadamard’s inequality, including the empty family. The Gram-determinant upper bound in §0.0 also covers complex inner-product spaces and families in an ambient space of arbitrary dimension.

GlobalNumberFields Layer 0 owns places, completions, extension multiplicities and product formula. The geometric estimates in §0.0 use Mathlib’s discrete lattice and covolume carriers. [IntegralLattices](../IntegralLattices/README.md), Layer 0A and Layer 2, owns integral quadratic lattices and their bounded-norm finiteness; [EffectiveBounds](../../Completed/EffectiveBounds/README.md), Layer 0, owns the measure-free lattice counting and doubling interface. [AlgebraicCurves](../AlgebraicCurves/README.md), Layer 9, owns the Kähler/Weil differential comparison for function fields; the arbitrary finite-type differential rank and algebraic Cartan calculus are §5.4 and §5.6 here. [ContourIntegration](../../Completed/ContourIntegration/README.md), Layer 2 “residues, the Cauchy primitive, and the classical residue theorem” and Layer 3 “the global (homological) Cauchy theorem”, supplies complex contour integrals and one-variable Cauchy estimates; the polydisc estimates are supplied by LinearFormsInLogarithms Layers 0–1. [DifferentialGeometry](../DifferentialGeometry/README.md), the differential-forms and de Rham layers, owns smooth forms, distinct from Ax’s algebraic forms.

The shared foundations have the following single suppliers. Each dependency is on the
specified layers, independently of the supplier's later applications. The contracts below
are consumer interfaces and normalization adapters; they do not request another proof
of a supplied theorem. `Suggested.lean` gives isolated formulas in its local `SignatureModel` namespace for
signatures whose providers are separate dependencies. These formulas do not export supplier
names or certify provider compatibility. The actual adapters consume the provider objects.
The model carriers are `SignatureModel.relativeEuclideanTupleHeight`,
`SignatureModel.absoluteProjectiveTupleHeight`, `SignatureModel.relativeAffineLogHeight`,
`SignatureModel.relativeEuclideanSubspaceHeight` and `SignatureModel.taylorCoeff`.

| Consumer sections | Supplier and exported interface | Work owned here |
| --- | --- | --- |
| §§0.2–0.3 | [ArithmeticHeights](../ArithmeticHeights/README.md), Layers 0–1: NumberField.absMulHeight, NumberField.arakelovMulHeight, Height.mulHeightAff, Height.logHeightAff, NumberField.absMulHeight₁_pow_natDegree, bounded-degree Northcott and Kronecker | Primitive-positive minpoly, naive height and arbitrary-element house/denominator adapters |
| §0.0, §§0.4,2.1 | ArithmeticHeights Layer 4: ZLattice.successiveMinimum, ZLattice.covolume_le_prod_successiveMinimum_mul_measure, ZLattice.prod_successiveMinimum_mul_measure_le | Approximation corollaries and the closed-boundary coordinate linear-forms adapter |
| §0.0 Gram estimate | [GeometryOfNumbersAndQuadraticArithmetic](../GeometryOfNumbersAndQuadraticArithmetic/README.md), §0.1: hermitian_gram_hadamard, extending ArithmeticHeights Layer 3's real Gram bound | Consumption for complex coefficient estimates |
| §1.3, §2.5 | ArithmeticHeights Layers 2–3: Polynomial.mulHeight, Submodule.pluckerPoint, Submodule.mulHeight, Submodule.arakelovMulHeight, Submodule.mulHeight_comap_piEquiv_dualAnnihilator | Sparse coefficient-log adapter; absolute Euclidean and dot-product adapters; twisted heights and weights |
| §2.8 fixed-field kernel bound, §4.1 unit dictionary | ArithmeticHeights Layers 5–6: NumberField.exists_linearIndependent_mem_ker_prod_absMulHeight_le, unit-height/regulator and S-unit rank dictionaries | Auxiliary constraints, perturbations, effective equations; absolute geometry in §2.5 |
| §3.3 qualitative conclusions | [LinearFormsInLogarithms](../LinearFormsInLogarithms/README.md), §6.4: transcendental_exp_mul and GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational | One-variable exponential-polynomial zero estimates and the explicit E19/KW auxiliary constructions as alternative applications of shared estimates |
| §3.4 | LinearFormsInLogarithms Layers 0–4: mvTaylorCoeff, norm_le_of_mvTaylorCoeff_eq_zero, mvTaylorCoeff_prod_pow_mul_cexp, exists_ne_zero_int_norm_sum_le | Ordinary-derivative adapter and its factorial bridge; coordinate integral, remainder, arithmetic-polynomial and degenerate-case adapters |
| §3.5 | LinearFormsInLogarithms Layers 5–7: §5.7 SchneiderLang.exists_transcendental_of_linearIndependent, §§6.1–6.2 Schneider–Lang consequences, §7.2 Baker.eq_zero_of_add_sum_mul_eq_zero, §7.3 Baker.transcendental_sum_mul | Branch and basis-coordinate corollaries of these shared statements |
| §§3.1–3.2,3.6–3.7,4–5 | LinearFormsInLogarithms Layer 8 supplies qualitative p-adic Baker–Brumer only | Full Hermite-method Lindemann–Weierstrass, quantitative Matveev/Yu, effective equations, modular values and arithmetic functions |

ArithmeticHeights Layer 4 is the real-lattice supplier also used by the geometric
foundation of GeometryOfNumbersAndQuadraticArithmetic: its zero-based natural index
is restricted here to `Fin d`. No later homogeneous-dynamics or hermitian K-theory
layer is needed. Absolute adelic minima, the degree-free small-height branch and
Nesterenko's arithmetic specialization are targets here.

**Provider import compatibility.** Prove `height2_eq_arakelovMulHeight` and
`Baker.mDeriv_eq_factorial_mul_mvTaylorCoeff` against joint provider imports. Import ArithmeticHeights.Arakelov, Absolute,
Affine and Subspace for the corresponding height consumers; the analytic consumer
imports the Layer 0 coefficient interface of LinearFormsInLogarithms. Its prototype
is TauCetiRoadmap.LinearFormsInLogarithms.mvTaylorCoeff, generalized in the normed
field, finite coordinate type and value space; adopt its library export when importing
that implementation. Prove the height and factorial comparisons using those objects
and their lemmas in a checkout importing the providers and consumer together. No
consumer declaration occupies a provider namespace. The zero-height adapter tests
for the zero tuple before taking the positive degree root. (ArithmeticHeights
§§0.1,0.4–0.5,3.2; LinearFormsInLogarithms §0.4; EF13 §6.3.)

**Checks.**

- The joint imports elaborate without duplicate declarations; provider comparison proofs reference imported implementations, with no SignatureModel term.
- The provider Arakelov formula at (√2,1) in ℚ(√2) gives 3, so the consumer absolute Euclidean height is √3; extension to ℚ(√2,i) gives relative value 9 by arakelovMulHeight_rpow_comp.
- At zero the provider retains projective value 1 while the consumer height2 adapter gives 0.
- The provider coefficient of z₀²z₁³ at zero in order (2,3) is 1; its coefficient/derivative API gives ordinary derivative 12. Specialization retains the provider's finite-coordinate and value-space parameters.

## Conventions

Algebraic-number fields have characteristic zero. F_x is the primitive integer minimal polynomial with positive leading coefficient a₀ and degree d; its transcendental junk value is 1. H_naive is its largest coefficient modulus, M its Mahler measure, and house the largest conjugate modulus (junk value 0). Integrality and denominator claims assume algebraicity. Absolute scalar heights are `NumberField.absMulHeight₁`, `absLogHeight₁`; relative heights are `Height.mulHeight`, `mulHeight₁`, `logHeight`, `logHeight₁`. Thus M=H_abs^d and H_K=H_abs^[K:ℚ]. Coefficient heights are projective; constants have logarithmic height zero.

Coordinate norms are sup norms. Infinite-place values are |σ_v(x)|^(mult(v)/[K:ℚ]), with mult 1 or 2; finite values are ideal-normalized moduli to power 1/[K:ℚ]. The product on K× is 1. Extension weights multiply by [L_w:K_v]/[L:K]. Absolute twisted heights on ℚ̄ give zero at zero; their Euclidean variant satisfies N^(−1/2)H₂≤H≤H₂ on nonzero N-tuples. `rationalSuccessiveInfimum` and `rationalInfimumSpace` use K-points; their absolute analogues are separate targets.

Divided derivatives use binomial coefficients; ordinary order k contributes k!. Wronskian rows are derivative orders, columns functions, starting at zero; the empty determinant is 1. Weighted index is the infimum of nonzero Taylor-coefficient weights, ∞ at zero. Zero weights use extended nonnegative division; finiteness needs positive weights. Native binary homogenization uses coordinate 0 affine, 1 homogenizing. Logarithms carry chosen branches, principal only when specified. ord_p(p)=1; ramification and residue degree remain separate. E-series use a_n/n!, G-series a_n. Conjectures are hypotheses.

## Exact supplier contracts

**From Mathlib.** `minpoly`, `IsLocalization.integerNormalization`, `Polynomial.primPart`, `supNorm`, `mapMahlerMeasure`, `hasseDeriv` and `MvPolynomial.pderiv` supply polynomial reduction, size and derivatives over their stated coefficient rings. `Finsupp.logHeight` is invariant under nonzero scaling. `NumberField.mulHeight_eq`, `mulHeight₁_eq` use complex multiplicity 2; `absMulHeight₁` defines the absolute scalar height; ArithmeticHeights §§0.3–0.4 supplies its field-comparison interfaces; adopt the matching Mathlib exports by deletion plus import when available. `NumberField.house`, `exists_conjugate_one_le_norm`, `norm_embedding_le_house`, `norm_norm_le_norm_mul_house_pow` bound conjugates in a fixed number field; Layer 0’s versions concern arbitrary algebraic elements and denominators. `finite_setOfPred_mulHeight₁_le` is fixed-field Northcott.

`NumberField.InfinitePlace`, `FinitePlace` and `FinitePlace.equivHeightOneSpectrum` identify embeddings and prime ideals. `NumberField.Units.finrank_modTorsion`, the log embedding, torsion kernel and `exist_unique_eq_mul_prod` give rank r₁+r₂−1 and unit decomposition. `LiouvilleWith`, continued-fraction convergents, `LinearRecurrence.IsSolution`, `charPoly`, power series, derivations and transcendence degree supply the remaining foundations. `LindemannWeierstrass.exp_polynomial_approx` supplies an integer-polynomial exponential approximation estimate. The Hermite integral identity in §3.1 uses the fundamental theorem of calculus. `CliffordAlgebra.contractLeft`, `contractLeft_ι`, `contractLeft_ι_mul`, `contractLeft_algebraMap` and `contractLeft_contractLeft` supply contraction by a dual vector; apply them to `Derivation.liftKaehlerDifferential` on Kähler forms. Native declarations below retain their library hypotheses; names grouped under a namespace use that namespace as prefix.

**From Tau Ceti.** `TauCeti.GlobalNumberFields.Place` is `HeightOneSpectrum (𝓞 K) ⊕ InfinitePlace K`. `normalizedAbsValue` is ideal-normalized at finite places and |σ(x)|^mult at infinity, without the degree root. `hasFiniteMulSupport_normalizedAbsValue` and `finprod_normalizedAbsValue_eq_one` require x≠0. `normalizedAbsValue_inl_algebraMap` raises base values to local extension degree; the product above v raises them to [L:K], also at infinity. All place-indexed targets use this carrier, with finite places in the left summand and infinite places in the right. `normAbs` takes its degree root.

`TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul` preserves dimension for faithful integral extensions; `ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial` computes dimension over an injected polynomial algebra; `ringKrullDim_tensorProduct_field_of_finiteType` handles field extension; `ringKrullDim_eq_toNat_trdeg` identifies dimension and transcendence degree for finite type domains. `TauCeti.height_eq_ringKrullDim_of_isMaximal` gives maximal-ideal height for a finite-type algebra over a field with irreducible spectrum. Mathlib’s `ringKrullDim_quotient_add_one_of_mem_nonZeroDivisors` applies to a nonzerodivisor contained in a prime of maximal height. Layer 5 packages these for the nonzero fibre over k[z].

**From other roadmaps.** GlobalNumberFields, Layer 0 “places, completions, and the product formula”, supplies the place-extension interface through the Tau Ceti declarations named above. IntegralLattices, Layer 0A “integral lattices” and Layer 2 “definite lattices”, supplies the quadratic-lattice carrier and its bounded-norm finiteness; Euclidean full lattices here use Mathlib directly. EffectiveBounds, Layer 0 “the geometry-of-numbers engine”, supplies measure-free packing and doubling on the Mathlib lattice carrier. AlgebraicCurves, Layer 9 “Kähler differentials, residues, and the comparison”, supplies the function-field comparison with Weil differentials. The universal Kähler module itself is Mathlib’s `KaehlerDifferential`, with `KaehlerDifferential.D` and `Derivation.liftKaehlerDifferential`; no second module is constructed here. ContourIntegration, Layers 2–3, supplies the one-variable integral estimates used in §3.3; LinearFormsInLogarithms Layers 0–2 supplies the several-variable engine used in §3.4.


**Geometric, unit and series carriers from Mathlib.** `ZLattice.covolume` fixes the Haar-volume normalization; `ZLattice.setFinite_inter` gives finiteness in a bounded set in a proper finite-dimensional ambient space. `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` supplies Minkowski’s first theorem for a compact convex symmetric body and a discrete countable lattice with an additive fundamental domain, in a nontrivial finite-dimensional real normed space: volume at least 2^d times the fundamental-domain volume gives a nonzero lattice point. The successive-minima and linear-forms contracts in §0.0 consume ArithmeticHeights Layer 4; the Hermitian Gram contract consumes GeometryOfNumbersAndQuadraticArithmetic §0.1. Their boundary and empty-family conventions are specified there. `Orientation.abs_volumeForm_apply_le` together with `Orientation.volumeForm_robust'` bounds real coordinate determinants; `Matrix.posSemidef_gram` and `Matrix.PosSemidef.det_nonneg` supply nonnegativity of real and complex Gram determinants.

`Set.unit S K` in `Mathlib.RingTheory.DedekindDomain.SInteger` is the sole S-unit subgroup, for a set S of height-one primes of a Dedekind domain with fraction field K. Its membership condition is v(x)=1 at every v outside S; `Set.unit_valuation_eq_one` and `Set.unitEquivUnitsInteger` identify its elements with units of the S-integer ring. For rational equations take the domain `𝓞 ℚ`, using `Rat.HeightOneSpectrum.primesEquiv` to identify its height-one primes with rational primes. No separate rational S-unit subgroup is defined. The algebraic-number field inside ℂ is `(algebraicClosure ℚ ℂ).toSubfield`. `PowerSeries.expand r hr` with r≠0 and `PowerSeries.expand_apply` supply f(z^r)=subst(X^r,f); `PowerSeries.coeff_expand` supplies the coefficient formula, with zero off exponents divisible by r. This is the sole expansion operator for Mahler systems; no separate coefficient construction is needed. The rational numerator, sign, exponent and height comparisons of §4.1 are adapters on this carrier.

`Submodule.orthogonalBilin` applied to `dotProductBilin K K` is the sole dot-product perpendicular: U^⊥={y : ∀x∈U, y·x=0}. It sends 0 to the whole space and the whole space to 0; over ℚ the perpendicular to span(1,2) is span(−2,1). §2.5 proves height comparisons for this supplier without introducing a second orthogonal-complement definition.

`LindemannWeierstrass.exp_polynomial_approx` in `Mathlib.NumberTheory.Transcendental.Lindemann.AnalyticalPart` is the exported analytic approximation theorem: for f∈ℤ[X] with f(0)≠0, a constant c bounds the approximation at all complex roots of f by c^p/(p−1)! for prime p>|f(0)|, with an integer n_p not divisible by p and a polynomial g_p of degree ≤p deg(f)−1. `intervalIntegral.integral_eq_sub_of_hasDerivAt` and `Polynomial.sumIDeriv_eq_self_add` supply the calculus and finite-derivative identity used by §3.1. The Hermite kernel identity and the exponential independence theorems are targets of §§3.1–3.2.

### From other open roadmap pull requests

| Consumer target | Supplier section / label and export | Convention or consumer work |
| --- | --- | --- |
| §3.4 / Let f : ℂ^n→ℂ be entire, k… | LinearFormsInLogarithms §0.5 / Division by a coordinate (an open TauCetiRoadmap pull request by mkaratarakis); analyticAt_dslope_update | Identify our integral quotient with the supplier’s dslope by the fundamental theorem of calculus; our entire scalar setting specializes its local analytic, normed-field and value-space setting. |
| §3.4 / Let 0 < r < R, T a positive integer and F entire… | LinearFormsInLogarithms §1.5 / Truncated Taylor interpolation (an open TauCetiRoadmap pull request by mkaratarakis); HasFPowerSeriesOnBall.norm_sub_partialSum_le | Use ordinary derivatives divided by τ! through the factorial bridge, and closed sup radii via an interior-radius limit; the shared constant is 1+T. |
| §3.4 / Schwarz theorem for Cartesian products (W00 Proposition 4.7) | LinearFormsInLogarithms §1.6 / Schwarz’s lemma for Cartesian products (an open TauCetiRoadmap pull request by mkaratarakis); norm_le_of_mvTaylorCoeff_eq_zero | For n≥1 and p=S₀S₁≥1, n(5·3^n)^p≤(18^n)^p converts the provider bound; p=0 uses the original bound and n=0 needs a separate adapter. |
| §3.4 / Let λ_1, …, λ_r∈ℂ be pairwise distinct…; functions z^τ exp((tx)·z) | LinearFormsInLogarithms §2.3 / Linear independence (an open TauCetiRoadmap pull request by mkaratarakis); eq_zero_of_sum_eval_mul_cexp | Reindex finite relations using injectivity of t↦Σtᵢxᵢ from rational independence; the infinite monomial-family formulation is read through its finite relations. |
| §§0.3,3.1 / Number-field size lower bound | LinearFormsInLogarithms §§3.1–3.2 / Liouville’s inequality; Sizes (an open TauCetiRoadmap pull request by mkaratarakis); NumberField.one_le_norm_embedding_mul_house_pow; NumberField.one_le_pow_mul_norm_embedding_mul_pow | Set δ=m and a=1, use house(mx)=m·house(x), and distinguish the field degree D from the element’s minimal-polynomial degree d. |
| §3.4 / W00 Lemma 4.11 (Let v_ij∈ℝ…) | LinearFormsInLogarithms §3.4 / Thue–Siegel’s lemma (real forms) (an open TauCetiRoadmap pull request by mkaratarakis); ThueSiegel.exists_ne_zero_int_vec_abs_le_of_pow_lt | Specialize the provider’s finite types to the rectangular indices and its real U to our positive integer bound; preserve the strict counting inequality. |
| §3.4 / W00 Lemma 4.12 (Let ν≥1 and X be a positive integer…) | LinearFormsInLogarithms §3.4 / Thue–Siegel’s lemma (complex forms) (an open TauCetiRoadmap pull request by mkaratarakis); ThueSiegel.exists_ne_zero_int_vec_norm_le_of_pow_le | Specialize to ν≥1 rectangular indices and positive U,V; preserve the provider’s nonempty unknown index and weak counting inequality. |
| §3.4 / W00 Proposition 4.10 / exists_auxiliary_small | LinearFormsInLogarithms §4.1 / Proposition 4.10 (an open TauCetiRoadmap pull request by mkaratarakis); exists_ne_zero_int_norm_sum_le | Our entire functions must first supply normally convergent power series on the outer ball; the provider allows local series and does not require positive U,V. |
| §3.2 / Hermite–Lindemann (E19 Corollary 4.9(i)) | LinearFormsInLogarithms §6.3 / Hermite–Lindemann (an open TauCetiRoadmap pull request by mkaratarakis); transcendental_exp | Use algebraicity and transcendence over ℤ; convert to ℚ only at consumer boundaries. |
| §3.2 / Every λ∈algebraicLogs with λ≠0 is transcendental | LinearFormsInLogarithms §6.3 / Hermite–Lindemann (an open TauCetiRoadmap pull request by mkaratarakis); transcendental_of_isAlgebraic_exp | Use the branch-free `transcendental_of_isAlgebraic_exp` and `mem_algebraicLogs`; principal `transcendental_log` alone would omit nonzero logarithms of 1. |
| §3.1 / Hermite’s theorem / Prove transcendence of exp(1) | LinearFormsInLogarithms §6.3 / Hermite–Lindemann; Worked examples / Complex.exp 1 (an open TauCetiRoadmap pull request by mkaratarakis); transcendental_e | Use Complex.exp 1 over ℤ and transfer to ℚ where required; the Hermite integral machinery can remain as an alternative proof package. |
| §3.2 / Lindemann (E19 Corollary 4.9(ii)) / Prove transcendence of π | LinearFormsInLogarithms §6.3 / Hermite–Lindemann; Worked examples / Real.pi (an open TauCetiRoadmap pull request by mkaratarakis); transcendental_pi | The supplier endpoint is Real.pi over ℤ; complex casts and transcendence over ℚ are consumer conversions. |
| §3.3 / Gelfond–Schneider theorem for any nonzero logarithm | LinearFormsInLogarithms §6.4 / Gelfond–Schneider (an open TauCetiRoadmap pull request by mkaratarakis); transcendental_exp_mul | Translate λ∈algebraicLogs using `mem_algebraicLogs`; λ≠0 allows exp λ=1, and irrationality is exclusion of all rational casts. |
| §3.3 / Gelfond–Schneider for Complex.cpow / Karatarakis–Wiedijk statement | LinearFormsInLogarithms §6.4 / Gelfond–Schneider (principal branch) (an open TauCetiRoadmap pull request by mkaratarakis); GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational | Preserve α≠0, α≠1 and the integer-quotient irrationality convention; the supplier theorem lives in `GelfondSchneider`. |
| §3.5 / Criterion of Schneider–Lang / W00 Corollary 4.2 | LinearFormsInLogarithms §5.7 / Corollary 4.2 (an open TauCetiRoadmap pull request by mkaratarakis); SchneiderLang.exists_transcendental_of_linearIndependent | A Fin n linearly independent family is a complex basis; rewrite the supplier existential using not-all-algebraic and transpose only the coordinate indexing. |
| §3.5 / W00 Corollary 4.4 / schneiderLang_inhomogeneous | LinearFormsInLogarithms §6.2 / The case d₀=1, d₁=n=d (an open TauCetiRoadmap pull request by mkaratarakis); SchneiderLang.exists_transcendental_exp_of_isAlgebraic_coord | Use d≥1 for the first coordinate, identify the Fin d independent basis, and rewrite exp-algebraicity as algebraicLogs membership. |
| §3.5 / Bertrand–Masser / W00 Theorem 4.5 | LinearFormsInLogarithms §7.1 / Theorem 4.5 (an open TauCetiRoadmap pull request by mkaratarakis); Baker.eq_zero_of_isAlgebraic_sum_mul | Translate algebraicLogs membership to algebraic exponentials and pointwise zero to function equality, specializing the provider’s finite basis index to Fin d. |
| §3.5 / Baker’s theorem / linearIndependent_cons_one_of_linearIndependent_rat | LinearFormsInLogarithms §7.2 / Baker’s theorem (an open TauCetiRoadmap pull request by mkaratarakis); Baker.eq_zero_of_add_sum_mul_eq_zero | Use the algebraic coefficient field `integralClosure ℚ ℂ`, translate membership to algebraic exponentials, and package coefficient vanishing as Fin.cons independence. |
| §3.5 / E19 Theorem 4.19 / transcendental_sum_mul_of_linearIndependent | LinearFormsInLogarithms §7.3 / Corollaries (nonzero sum) (an open TauCetiRoadmap pull request by mkaratarakis); Baker.transcendental_sum_mul | Derive nonzero sum from supplied Baker independence and β≠0; rational independence is used for nonvanishing, while the supplier requires only a nonzero sum. |
| §0.2 / For number fields K⊆L and a commutative-monoid-valued g… | ArithmeticHeights §0.3 / Extension invariance (archimedean local-factor count) (an open TauCetiRoadmap pull request by rwst); NumberField.prod_infinitePlace_pow_mult_eq | The provider export is `NumberField.prod_infinitePlace_pow_mult_eq`; use real multiplicity 1, complex multiplicity 2 and relative extension degree [L:K], without a degree root. |
| §0.2 / For a finite tuple x… | ArithmeticHeights §0.3 / Extension invariance (an open TauCetiRoadmap pull request by rwst); NumberField.mulHeight_pow_finrank; NumberField.mulHeight₁_pow_finrank | Use the projective value 1 at zero and the relative power [L:K]; scalar height is obtained from the tuple with an appended coordinate 1. |
| §0.2 / A ring isomorphism of number fields… | ArithmeticHeights §0.4 / The absolute height of a tuple (degree-one isomorphism prerequisite) (an open TauCetiRoadmap pull request by rwst); NumberField.mulHeight_pow_finrank (degree one) | A number-field ring equivalence fixes ℚ; equip the target with its transported algebra structure and use extension degree one. |
| §0.2 / For x∈K… | ArithmeticHeights §0.3 / Extension invariance (absolute scalar comparison) (an open TauCetiRoadmap pull request by rwst); NumberField.absMulHeight₁_eq | Keep scalar height of (x,1), degree [K:ℚ] and real exponent ([K:ℚ])⁻¹; this is distinct from the Euclidean height2 zero convention. |
| §0.2 / Equal rational minimal polynomials… | ArithmeticHeights §0.4 / The absolute height of a tuple; §1.2 / Height and Mahler measure (root/scalar invariance) (an open TauCetiRoadmap pull request by rwst); absMulHeight_comp; absMulHeight₁_comp | The provider’s `absMulHeight_comp` tuple theorem and `absMulHeight₁_comp` scalar form require the embedding dictionary; equal minimal polynomials are compared via a common root field, with junk value 1 for transcendental elements. |
| §0.2 / For a primitive P∈ℤ[X] and a finite place w… | ArithmeticHeights §1.2 / Height and Mahler measure (primitive-polynomial Gauss norm) (an open TauCetiRoadmap pull request by rwst); Mathematical contract; no export name specified | Map integer coefficients into the number field, use ideal-normalized finite-place moduli and radius 1; primitivity implies nonzero polynomial. |
| §0.2 / If that primitive P splits as a∏b∈s(X−b)… | ArithmeticHeights §1.2 / Height and Mahler measure (finite-place local Mahler computation) (an open TauCetiRoadmap pull request by rwst); Mathematical contract; Polynomial.gaussNorm_mul | Count roots with multiplicity, distinguish the leading coefficient from the monic rational minpoly, and retain only the connection to our primitive-positive `primitiveMinpoly`. |
| §2.5 / finite_subspaceHeight_le / Northcott for subspaces | ArithmeticHeights §3.7 / Northcott for subspaces (rank-free theorem and Arakelov instance) (an open TauCetiRoadmap pull request by rwst); Submodule.finite_setOf_mulHeight_le; Northcott Submodule.arakelovMulHeight | Our subspaceHeight is the positive [K:ℚ]-degree root of the supplier’s relative Arakelov height; negative thresholds give the empty set and ⊥,⊤ have height 1. |
| §0.3; §1.3 consumer / Prove binom(k,⌊k/2⌋)√(k+1)≤2ᵏ | ArithmeticHeights §2.3 / Gelfond’s inequality (critical-path central-binomial lemma) (an open TauCetiRoadmap pull request by rwst); Nat.choose_middle_mul_sqrt_le_two_pow | Identify floor(k/2) with natural division and retain n=0; consume the exact square-root statement, not merely choose≤2^n. |

The log 2+√2 log 3 carrier consumer keeps the real-bodied local restatement `Transcendence.transcendental_sum_mul_of_linearIndependent` of LinearFormsInLogarithms §7.3. Its isolated signature takes the §7.2 affine coefficient-vanishing and §7.3 nonzero-sum interfaces as explicit supplier arguments; the joint-import version supplies these from the named exports. No separate Fin.cons independence restatement is needed. The other supplied entries are consumed directly through their section contracts and the retained factorial, membership or degree-root dictionaries.

**Broader consumer targets.** §3.3 retains `Transcendence.transcendental_exp_pi_mul` for all algebraic α outside ℚ·i, using LinearFormsInLogarithms §6.4. §3.5 retains `Baker.schneiderLang_homogeneous` for a rational-span rank hypothesis, extracting an independent subfamily for LinearFormsInLogarithms §6.1. It also retains the independent T₀,T₁ family and first-vanishing construction, using LinearFormsInLogarithms §§2.1–2.3,5.1–5.3 as the shared coefficient, growth and arithmetic engines.

## How to read the build

Layer 0 fixes heights and approximation; Layer 1 proves Roth by auxiliary polynomials. Layer 2 builds jets and homogenization before its quantitative Subspace applications and recurrence bounds. Layer 3 develops transcendence and logarithmic estimates; Layer 4 uses them for equations. Layer 5 develops arithmetic differential equations, specialisation and functional transcendence. Local prerequisites name earlier constructions in the subsection; §§2.1 and 2.4 consume the product theorem of §2.8. `Suggested.lean` records representative signatures and examples; the README specifies the full absolute and differential interfaces. Only definitions with real bodies and layer milestones statable against Mathlib `6b7abb3` and Tau Ceti `a91d3aa` occur in that file; the construction contracts and complete APIs below are equally part of the roadmap.

## Layer 0: heights and approximation exponents

### 0.0 Geometric estimates on the library lattice carriers

Use a discrete full ℤ-lattice Λ in a finite-dimensional real normed space E of dimension d, and a compact convex set B symmetric about zero with zero in its interior. Consume `ZLattice.successiveMinimum Λ B i.val`, for i : Fin d, as the infimum of t≥0 for which the real span of Λ∩tB has dimension at least i+1. Its intended signature is a real-valued function of the native lattice, the body and the zero-based index. Consume positivity, monotonicity in i, the threshold characterization and ZLattice.exists_linearIndependent_mem_smul_successiveMinimum: independent v_i∈Λ with v_i∈λ_i B simultaneously. Scaling B by a>0 divides every minimum by a; invertible real-linear transport of Λ and B preserves them. (E19, ch. 2, §2.3 “Minkowski’s second convex body theorem”, Lem. 2.8, pp. 23–24.)

**Checks.**

- For ℤ^d and B=[−1,1]^d, each minimum is 1.
- For ℤ² and B=[−2,2]×[−1,1], the minima in index order are 1/2 and 1.
- The zero-dimensional space has an empty family of minima and empty product 1.
- For the unit square scaled by 2, the minima halve; a definition that scales the lattice instead gives the opposite normalization.

Consume `ZLattice.covolume_le_prod_successiveMinimum_mul_measure` and `ZLattice.prod_successiveMinimum_mul_measure_le` from ArithmeticHeights Layer 4.2:
2^d covol(Λ)/d! ≤ volume(B)∏_i λ_i ≤ 2^d covol(Λ).
The volume is the same Haar measure used for the covolume. No norm-ball restriction is imposed. In dimension zero the body is {0}, its volume and covolume are 1, and both bounds are equalities. (E19, ch. 2, Thm. 2.9, pp. 24–27.)

For d≥1, invertible A∈M_d(ℝ), positive b_i and ∏b_i≥|det A|, prove `minkowski_linear_forms`: some nonzero z∈ℤ^d has |(Az)_i|≤b_i for every i. The inequalities include the boundary; compactness of the parallelepiped is essential at equality. This is a coordinate consequence of the supplied first convex-body theorem. (E19, ch. 2, Cor. 2.6, p. 20.)

For a finite family v_i in a real or complex inner-product space, consume `hermitian_gram_hadamard` from GeometryOfNumbersAndQuadraticArithmetic §0.1: det Gram(v)≤∏‖v_i‖². For complex scalars the determinant is real, so the inequality uses its real part. Include dependent and empty families, with determinant and product 1 in the empty case. Use the library Gram matrix and Euclidean norms; its nonnegativity is supplied. (E19, ch. 2, Exercise 2.11, p. 31, and its Gram-Schmidt argument; the complex statement follows by the same Hermitian orthogonalization.)

**Checks.**

- The standard basis gives determinant, Gram determinant and norm products all equal to 1.
- A repeated vector gives determinant zero, including the complex pair (1,i) in ℂ as a one-dimensional complex space.
- The real rows (1,0),(1,1) give determinant 1 and product √2; the Gram determinant is 1 and the squared-norm product 2.

*Needs:* Mathlib discrete submodules, `ZLattice.covolume`, `ZLattice.setFinite_inter`, Gram matrices, finite-dimensional spans, Haar measure, and the first convex-body theorem in the supplier contract. These estimates precede §§0.3–0.4 and §2.5.

### 0.1 Primitive polynomials and coefficient height

For a characteristic-zero field F, define `primitiveMinpoly x` by clearing denominators in minpoly ℚ x and choosing the primitive integer multiple Fₓ with positive leading coefficient a₀. For transcendental x set Fₓ=1. For algebraic x this is the unique primitive, positive-leading-coefficient polynomial proportional to minpoly ℚ x. (E19, ch. 3, §3.1, p. 41; E19, ch. 6, §6.1, Thm. 6.1, p. 108; E19, ch. 3, Lem. 3.7, pp. 42-43.)

Its API includes `aeval_primitiveMinpoly`: For algebraic x, F_x(x)=0; `isPrimitive_primitiveMinpoly`: F_x is primitive; `leadingCoeff_primitiveMinpoly_pos`: The leading coefficient a₀ of F_x is positive; `irreducible_primitiveMinpoly`: For algebraic x, F_x is irreducible in ℤ[X]; `natDegree_primitiveMinpoly`: deg F_x=deg minpoly ℚ x; `primitiveMinpoly_dvd_iff`: For algebraic x and P∈ℤ[X]: F_x∣P in ℤ[X]↔P(x)=0; `primitiveMinpoly_eq_of_isPrimitive`: A primitive irreducible P∈ℤ[X] with positive leading coefficient and P(x)=0 equals F_x; `primitiveMinpoly_eq_minpoly_int`: For x integral over ℤ, F_x=minpoly ℤ x; `primitiveMinpoly_ratCast`: F_{p/q}=qX − p for q∈ℚ written in lowest terms (den q)X − num q; `primitiveMinpoly_map`: Characteristic-zero field embeddings preserve F_x; `primitiveMinpoly_eq_of_minpoly_eq`: If minpoly ℚ x=minpoly ℚ y (x, y possibly in different fields) then F_x=F_y; hence conjugates share F; `primitiveMinpoly_of_not_isAlgebraic`: F_x=1 for x transcendental over ℚ; `isIntegral_leadingCoeff_primitiveMinpoly_smul`: For x algebraic over ℚ, a₀·x is integral over ℤ (Evertse Lemma 3.7). Transcendental junk has leading coefficient 1; `natDenominator_dvd_leadingCoeff_primitiveMinpoly`: For x algebraic over ℚ, Algebra.natDenominator x divides a₀. For transcendental x, denominator 0 cannot divide junk leading coefficient 1.

**Checks.**

- primitiveMinpoly ((2/3 : ℚ) : ℝ)=3X − 2.
- primitiveMinpoly ((1 + 2√3)/5)=25X² − 10X − 11.
- primitiveMinpoly (liouvilleNumber 10)=1.
- primitiveMinpoly (1/2)≠minpoly ℤ (1/2): the integral minimal polynomial is 0 at a non-integral element, so it is the wrong definition.
- primitiveMinpoly √2=minpoly ℤ √2 (= X² − 2).
- For x=liouvilleNumber 10, ¬ IsIntegral ℤ x and Algebra.natDenominator x=0, whereas F_x.leadingCoeff=1.

Define `naiveHeight x` as the coefficient sup norm H(x)=maxᵢ|[Xⁱ]Fₓ|. This is a real-valued function on every characteristic-zero field, with H(x)=1 for transcendental x. (E19, ch. 3, §3.1, p. 41; E19, ch. 3, Exercise 3.1, p. 41; Bugeaud, §2, Def. 2.1, p. 4.)

Its API includes `naiveHeight_eq_iSup`: H(x)=sup_i |coeff_i F_x|; `one_le_naiveHeight`: 1≤H(x); `naiveHeight_inv`: H(x⁻¹)=H(x) (Evertse Exercise 3.1(i)); `naiveHeight_map`: H(f x)=H(x) for a ring homomorphism f of characteristic-zero fields; `naiveHeight_eq_of_minpoly_eq`: Conjugates (equal minimal polynomials) have equal naive height; `inv_naiveHeight_add_one_le_norm`: (H(x) + 1)⁻¹≤|x| for nonzero algebraic x∈ℂ (Evertse Exercise 3.1(ii)); `norm_le_naiveHeight_add_one`: |x|≤H(x) + 1 for algebraic x∈ℂ (Evertse Exercise 3.1(ii)); `natDenominator_le_naiveHeight`: den(x)≤H(x) for algebraic x; `naiveHeight_intCast`: H(n)=max(|n|, 1) for n∈ℤ.

**Checks.**

- naiveHeight ((1 + 2√3)/5)=25.
- naiveHeight 0=1.
- naiveHeight √2=2.
- naiveHeight √2≠absMulHeight₁ √2 (2 versus √2): the naive height is not the Weil height.
- naiveHeight (2/3)=mulHeight₁ (2/3 : ℚ) (= 3).

For q=p/r in lowest terms, r>0, prove H(q)=max(|p|,r)=Height.mulHeight₁ q, independently of the characteristic-zero field containing q. (E19, ch. 3, §3.1, p. 41; E19, ch. 6, §6.1, p. 107.)

For algebraic x, map Fₓ to ℚ[X] to obtain a₀·minpoly ℚ x. Thus deg Fₓ=deg x and, in any splitting field, Fₓ=a₀∏ᵢ(X−x⁽ⁱ⁾); in characteristic zero the conjugates are distinct. (E19, ch. 3, §3.1, p. 41; E19, ch. 6, Thm. 6.1, p. 108.)

Use `IsLocalization`: `integerNormalization`, `integerNormalization_aeval_eq_zero`; `Polynomial`: `primPart`, `isPrimitive_primPart`, `IsPrimitive`, `supNorm`, `C_leadingCoeff_mul_prod_multiset_X_sub_C`; `Polynomial.IsPrimitive.Int`: `dvd_iff_map_cast_dvd_map_cast`, `irreducible_iff_irreducible_map_cast`; `minpoly`: `dvd`, `irreducible`; `isIntegral_leadingCoeff_smul`, `transcendental_liouvilleNumber`; `Algebra`: `natDenominator`, `natDenominator_dvd_iff`; `Polynomial.IsRoot.norm_lt_cauchyBound`; `Rat.mulHeight₁_eq_max`.

### 0.2 Mahler measure, house and absolute height

Define `mahlerMeasure x` by applying polynomial Mahler measure to Fₓ over ℂ. For algebraic x of degree d, M(x)=a₀∏ᵢmax(1,|x⁽ⁱ⁾|), including the leading coefficient. Set M(x)=1 for transcendental x. (E19, ch. 6, §6.1, Thm. 6.1, p. 108; E19, ch. 6, Thm. 6.1, p. 109; Smyth, §1, formula (2), p. 322.)

Its API includes `mahlerMeasure_eq_leadingCoeff_mul_prod`: M(x)=a₀ · ∏ over the complex roots z of minpoly ℚ x of max(1, |z|); `one_le_mahlerMeasure`: 1≤M(x); `leadingCoeff_le_mahlerMeasure`: a₀≤M(x); `mahlerMeasure_ratCast`: M(p/q)=max(|p|, q) for p/q in lowest terms; `mahlerMeasure_inv`: M(x⁻¹)=M(x); `mahlerMeasure_map`: M(f x)=M(x) for ring homomorphisms of characteristic-zero fields; `mahlerMeasure_eq_of_minpoly_eq`: Conjugates have equal Mahler measure; `mahlerMeasure_eq_one_iff`: For algebraic x: M(x)=1↔x=0 or x is a root of unity (Kronecker); `finite_setOf_mahlerMeasure_le`: Finitely many algebraic z∈ℂ of degree≤d with M(z)≤B (Northcott for M).

**Checks.**

- mahlerMeasure (1/2)=2.
- mahlerMeasure √2=2.
- mahlerMeasure φ=φ for the golden ratio φ.
- mahlerMeasure i=1 (a root of unity).
- mahlerMeasure 0=1.
- mahlerMeasure (1/2)≠|N_{ℚ/ℚ}(1/2)|: the Mahler measure keeps the leading coefficient and discards conjugates inside the unit disc.

*Needs:* §0.1.

Define the field-independent `house x` as the largest modulus of a complex root of minpoly ℚ x, with value 0 when x is transcendental. Its distinction from the number-field house is that F need not itself be a number field or have a chosen complex embedding. (E19, ch. 3, §3.4, p. 52; E19, ch. 3, p. 52; E19, ch. 3, Exercise 3.5, Exercise 3.6, p. 58; Smyth, §3, p. 324.)

Its API includes `house_nonneg`: 0≤⌈x⌉; `norm_le_house`: |x|≤⌈x⌉ for algebraic x∈ℂ; `house_map`: ⌈f x⌉=⌈x⌉ for ring homomorphisms of characteristic-zero fields; `house_eq_of_minpoly_eq`: Conjugates have equal house; `house_mul_le`: ⌈xy⌉≤⌈x⌉⌈y⌉ for algebraic x, y∈ℂ; `house_add_le`: ⌈x + y⌉≤⌈x⌉ + ⌈y⌉ for algebraic x, y∈ℂ; `house_pow`: ⌈x^n⌉=⌈x⌉^n for algebraic x∈ℂ; `house_ratCast`: ⌈q⌉=|q| for q∈ℚ; `one_le_house`: 1≤⌈x⌉ for a nonzero algebraic integer (Evertse Lemma 3.6); `house_eq_one_iff`: For a nonzero algebraic integer: ⌈x⌉=1↔x is a root of unity (Kronecker); `house_le_mahlerMeasure`: ⌈x⌉≤M(x) for algebraic integers; `mahlerMeasure_le_leadingCoeff_mul_max_one_house_pow`: M(x)≤a₀ · max(1, ⌈x⌉)^{deg x}.

**Checks.**

- house √2=√2.
- house ((1 − √5)/2)=(1 + √5)/2.
- |(1 − √5)/2| < house ((1 − √5)/2): the house is not the absolute value of the given embedding.
- house (0 : ℂ)=0.
- house i=1.
- house (2 : ℚ)=NumberField.house (2 : ℚ).

For x in a number field K, identify the field-independent house with maxσ|σ(x)|=NumberField.house x. (E19, ch. 3, p. 52.)

*For number fields K⊆L and a commutative-monoid-valued g…* Provides the multiplicity-weighted infinite-place product under number-field extension. Supplied by ArithmeticHeights §0.3 / Extension invariance (archimedean local-factor count) (an open TauCetiRoadmap pull request by rwst). The provider export is `NumberField.prod_infinitePlace_pow_mult_eq`; use real multiplicity 1, complex multiplicity 2 and relative extension degree [L:K], without a degree root.

*For a finite tuple x…* Provides the relative tuple and scalar height extension-power law. Supplied by ArithmeticHeights §0.3 / Extension invariance (an open TauCetiRoadmap pull request by rwst). Use the projective value 1 at zero and the relative power [L:K]; scalar height is obtained from the tuple with an appended coordinate 1.

*A ring isomorphism of number fields…* Provides preservation of relative tuple and scalar height under number-field isomorphism. Supplied by ArithmeticHeights §0.4 / The absolute height of a tuple (degree-one isomorphism prerequisite) (an open TauCetiRoadmap pull request by rwst). A number-field ring equivalence fixes ℚ; equip the target with its transported algebra structure and use extension degree one.

*For x∈K…* Provides computation of absolute scalar height in any containing number field. Supplied by ArithmeticHeights §0.3 / Extension invariance (absolute scalar comparison) (an open TauCetiRoadmap pull request by rwst). Keep scalar height of (x,1), degree [K:ℚ] and real exponent ([K:ℚ])⁻¹; this is distinct from the Euclidean height2 zero convention.

*Equal rational minimal polynomials…* Provides invariance of absolute scalar height under characteristic-zero embeddings and conjugacy. Supplied by ArithmeticHeights §0.4 / The absolute height of a tuple; §1.2 / Height and Mahler measure (root/scalar invariance) (an open TauCetiRoadmap pull request by rwst). The provider’s `absMulHeight_comp` tuple theorem and `absMulHeight₁_comp` scalar form require the embedding dictionary; equal minimal polynomials are compared via a common root field, with junk value 1 for transcendental elements.

*For a primitive P∈ℤ[X] and a finite place w…* Provides the radius-one finite-place Gauss norm of a primitive integer polynomial. Supplied by ArithmeticHeights §1.2 / Height and Mahler measure (primitive-polynomial Gauss norm) (an open TauCetiRoadmap pull request by rwst). Map integer coefficients into the number field, use ideal-normalized finite-place moduli and radius 1; primitivity implies nonzero polynomial.

*If that primitive P splits as a∏b∈s(X−b)…* Provides the finite-place local Mahler product for a primitive split polynomial. Supplied by ArithmeticHeights §1.2 / Height and Mahler measure (finite-place local Mahler computation) (an open TauCetiRoadmap pull request by rwst). Count roots with multiplicity, distinguish the leading coefficient from the monic rational minpoly, and retain only the connection to our primitive-positive `primitiveMinpoly`.

For every x in a characteristic-zero field, M(x)=Habs(x)^d and log M(x)=d·habs(x), where d=deg minpoly ℚ x. At transcendental x this reads 1=1⁰. (Smyth, §1, p. 323; Wu, §3, Prop. 3.1, p. 6; Yang, pp. 1-4.)

*Needs:* §0.1.

For the same d, prove H(x)≤binom(d,⌊d/2⌋)M(x)≤2ᵈM(x), including d=0 at transcendental x. (E19, ch. 6, Thm. 6.1, p. 108; Wu, §3, Lem. 3.3, p. 6.)

*Needs:* §0.1.

Prove the Landau bound M(x)≤√(d+1)H(x) with the same conventions. (E19, ch. 6, Thm. 6.1, pp. 108-109; Wu, §3, Lem. 3.3, p. 6.)

*Needs:* §0.1.

Combine these bounds to obtain 2⁻ᵈH(x)≤Habs(x)^d≤√(d+1)H(x). On ℚ the three multiplicative heights coincide. (E19, ch. 6, Thm. 6.1, p. 108; Wu, §3, Thm. 3.4, p. 6.)

*Needs:* §0.1.

Use `Polynomial`: `mapMahlerMeasure`, `mahlerMeasure`, `mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `pow_eq_one_of_mahlerMeasure_eq_one`, `finite_mahlerMeasure_le`, `card_roots'`, `gaussNorm`, `IsPrimitive`, `gaussNorm_mul`, `gaussNorm_C`, `SplittingField`, `supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`, `mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`, `mahlerMeasure_le_sqrt_sum_sq_norm_coeff`; `NumberField`: `house`, NumberField.house_eq_sup', `exists_conjugate_one_le_norm`, `house_mul_le`, `house_add_le`, `mulHeight_eq`, `instAdmissibleAbsValues`, `absMulHeight₁`, `prod_abs_eq_one`, `mulHeight₁_eq`; `NumberField.Embeddings`: `range_eval_eq_rootSet_minpoly`, `pow_eq_one_of_norm_eq_one`, `card`; `NumberField.InfinitePlace`: `mult_mul_finrank`, `inertiaDeg_eq_finrank`, `sum_inertiaDeg_eq_finrank`, `comap_apply`, `card_filter_mk_eq`; `Height`: `mulHeight`, `mulHeight₁_eq_mulHeight`, `mulHeight₁`; `NumberField.FinitePlace`: `equivHeightOneSpectrum_symm_apply_algebraMap`, `add_le`; `Ideal.sum_ramification_inertia_eq_finrank`; `NumberField.RingOfIntegers.rank`; `Module.finrank_mul_finrank`; `IntermediateField.adjoinRootEquivAdjoin`; `IntermediateField.adjoin.finrank`; `NumberField.HeightOneSpectrum.adicAbv_intCast_le_one`; `Finset.gcd_eq_sum_mul`; `Rat.iSup_finitePlace_apply_eq_one_of_gcd_eq_one`; `Polynomial.SplittingField.splits`; `Polynomial.Splits.roots_map_of_injective`; `Nat.choose_le_two_pow`.

### 0.3 Finiteness and size estimates

For d∈ℕ and B∈ℝ, the algebraic α∈ℂ with degree ≤d and H(α)≤B form a finite set of cardinality ≤d(2⌊B⌋₊+1)^(d+1); it is empty for B<1. (E19, ch. 1, Thm. 1.7, p. 5; Wu, §3, Thm. 3.4, p. 6.)

*Needs:* §0.1.

For d∈ℕ and B∈ℝ, consume ArithmeticHeights Layer 1.3 bounded-degree Northcott finiteness in ℂ for Habs(α)≤B. The field containing α is allowed to vary. (Wu, §3, Thm. 3.4, p. 6; Yang, p. 1.)

*Needs:* §0.2.

*Prove binom(k,⌊k/2⌋)√(k+1)≤2ᵏ* Provides the central-binomial estimate used by the coefficient-product bounds. Supplied by ArithmeticHeights §2.3 / Gelfond’s inequality (critical-path central-binomial lemma) (an open TauCetiRoadmap pull request by rwst). Identify floor(k/2) with natural division and retain n=0; consume the exact square-root statement, not merely choose≤2^n.

For complex polynomials f=∏ⱼfⱼ of degree d, coefficient sup norms satisfy ∏ⱼ‖fⱼ‖∞≤2ᵈ‖f‖∞ and ‖f‖∞≤2ᵈ∏ⱼ‖fⱼ‖∞. A zero factor makes both inequalities 0≤0. (Wu, §3, Lem. 3.5, Lem. 3.6, p. 7.)

For a nonzero algebraic integer x of degree d, prove H(x)≤(2 house(x))ᵈ. (E19, ch. 3, Exercise 3.6, p. 58.)

*Needs:* §0.1; §0.2.

Algebraic integers in ℂ of degree ≤d and house ≤C form a finite set, of cardinality at most Σk=0..d k(2⌊(2max(C,1))ᵏ⌋₊+1)ᵏ. (E19, ch. 3, Exercise 3.6, p. 58; E19, ch. 5, Corollary 5.11, p. 93.)

*Needs:* §0.2.

*Number-field size lower bound* Provides the number-field lower bound for a nonzero algebraic number with an integral multiple and controlled conjugates. Supplied by LinearFormsInLogarithms §§3.1–3.2 / Liouville’s inequality; Sizes (an open TauCetiRoadmap pull request by mkaratarakis). Set δ=m and a=1, use house(mx)=m·house(x), and distinguish the field degree D from the element’s minimal-polynomial degree d.

For nonzero algebraic z∈ℂ of degree d, prove |z|≥den(z)⁻ᵈ house(z)^(1−d). The bound applies to each conjugate, and den(z)=1 for algebraic integers. (E19, ch. 3, Exercise 3.7, p. 60.)

*Needs:* §0.2.

An algebraic integer whose real and imaginary coordinates under every embedding have absolute value ≤2/3 is zero: each conjugate has modulus ≤2√2/3<1. (E19, ch. 3, Lem. 3.19, p. 52.)

For K of degree d, N>dM>0, A≥1 and a∈(𝓞 K)^(M×N) with every coefficient house ≤A, obtain a nonzero rational integer vector x in its kernel with ‖x‖∞≤(3NA)^(dM/(N−dM)). The unknowns are in ℤ. (E19, ch. 3, Thm. 3.20, p. 52; E19, ch. 3, Thm. 3.20, p. 53; E19, ch. 6, §6.2, p. 116.)

Use `Polynomial`: `card_roots'`, `supNorm`, `supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`, `mahlerMeasure_mul`, `mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`; `Nat`: `succ_mul_centralBinom_succ`, `choose_le_two_pow`; `NumberField.Embeddings.coeff_bdd_of_norm_le`; `NumberField`: `exists_conjugate_one_le_norm`, `norm_norm_le_norm_mul_house_pow`, `house`, `mixedEmbedding`, NumberField.house_eq_sup'; `Algebra`: `natDenominator`, `natDenominator_dvd_iff`, `isIntegral_norm`, `norm_ne_zero_iff`; `IntermediateField.adjoin.finrank`; `isIntegral_algHom_iff`; `Finset.exists_ne_map_eq_of_card_lt_of_maps_to`.

### 0.4 Dirichlet and Kronecker approximation

For m,n≥1, A∈ℝ^(m×n) and Q>1, obtain y∈ℤⁿ∖{0}, x∈ℤᵐ with ‖y‖∞≤Q and |(Ay)ᵢ−xᵢ|≤Q^(−n/m). Use the closed-boundary linear-forms theorem. (E19, ch. 1, Thm. 1.1, Thm. 1.3, pp. 2-3; E19, ch. 2, Corollary 2.6, p. 20; E19, ch. 2, Corollary 2.7, p. 22; E19, ch. 2, Exercise 2.6, p. 22.)

*Needs:* §0.0 successive minima and linear forms.

If m,n≥1 and Ay∈ℤᵐ for integer y only when y=0, infinitely many pairs (y,x), y≠0, satisfy |(Ay)ᵢ−xᵢ|≤‖y‖∞^(−n/m). (E19, ch. 2, Exercise 2.6, p. 22; E19, ch. 2, Corollary 2.7, p. 22.)

For n≥1, α∈ℝⁿ and Q>1, obtain integers x,y with 0<y≤Qⁿ and |xᵢ−αᵢy|≤Q⁻¹. (E19, ch. 1, Thm. 1.4(i), p. 3.)

If n≥1 and some αᵢ is irrational, infinitely many primitive tuples (x,y) with y>0 satisfy |αᵢ−xᵢ/y|≤y^(−1−1/n). Primitive means gcd(x₁,…,xₙ,y)=1. (E19, ch. 1, Thm. 1.4(ii), p. 3; E19, ch. 2, Corollary 2.7(i), p. 21.)

If 1,α₁,…,αₙ are ℚ-linearly independent, n≥1, infinitely many integer pairs (x,y), y≠0, satisfy |α·y−x|≤‖y‖∞⁻ⁿ. (E19, ch. 2, Corollary 2.7(ii), p. 21; E19, ch. 7, Lem. 7.6, p. 142.)

If yₖ>0, xₖ/yₖ≠α and |xₖ−αyₖ|→0 for integer xₖ,yₖ, then α is irrational. (E19, ch. 1, Lem. 1.9, p. 6.)

For 1,α₁,…,αₙ ℚ-linearly independent, any θ∈ℝⁿ and ε>0, infinitely many integer tuples satisfy |αᵢy−xᵢ−θᵢ|≤ε for every i. (E19, ch. 2, Thm. 2.22, p. 34; E19, ch. 2, Thm. 2.22, pp. 35-36; E19, ch. 2, Corollary 2.21, p. 33.)

*Needs:* Mathlib bounded-intersection finiteness from the supplier contract.

Use `Irrational`.

### 0.5 Exponents of approximation

Define `irrationalityExponent ξ` as sup{ofReal p : LiouvilleWith p ξ} in ℝ≥0∞. Exact approximants are excluded. For irrational ξ it also equals the supremum of p with |ξ−r|<den(r)⁻ᵖ for infinitely many distinct r∈ℚ. (Sondow, §2, Def. 2, p. 3; E19, ch. 1, §1.2, p. 3; Bugeaud, §1, Def. 1.1, p. 1.)

Its API includes `one_le_irrationalityExponent`: 1≤μ(ξ); `le_irrationalityExponent_of_liouvilleWith`: LiouvilleWith p ξ→ofReal p≤μ(ξ); `liouvilleWith_of_lt_irrationalityExponent`: ofReal p < μ(ξ)→LiouvilleWith p ξ; `irrationalityExponent_eq_iSup_infinite`: For irrational ξ: μ(ξ)=sup of the p such that |ξ − r| < den(r)^{-p} for infinitely many r∈ℚ; `irrationalityExponent_eq_top_iff`: μ(ξ)=⊤↔Liouville ξ; `irrationalityExponent_ratCast`: μ(q)=1 for q∈ℚ; `two_le_irrationalityExponent_iff`: 2≤μ(ξ)↔ξ irrational; `irrationalityExponent_add_ratCast`: μ(ξ + r)=μ(ξ) for r∈ℚ; `irrationalityExponent_ratCast_mul`: μ(rξ)=μ(ξ) for r∈ℚ, r≠0; `irrationalityExponent_neg`: μ(−ξ)=μ(ξ); `ae_irrationalityExponent_eq_two`: μ(ξ)=2 for Lebesgue-almost every ξ.

**Checks.**

- irrationalityExponent (1/2)=1.
- irrationalityExponent √2=2.
- irrationalityExponent (liouvilleNumber 10)=⊤.
- irrationalityExponent 0≠⊤: the exact approximations 0=0/n are excluded.

For θ∈ℝⁿ define `linearFormExponent θ` as the supremum of w with 0<|x₀+Σⱼxⱼθⱼ|≤‖x‖∞⁻ʷ for infinitely many x∈ℤⁿ⁺¹; all n+1 coordinates enter the norm. Define `mahlerExponent n ξ` by θ=(ξ,…,ξⁿ). Suprema lie in ℝ≥0∞, so negative w contribute 0. (Bugeaud, §2, Def. 2.1, p. 4; Bugeaud, §1, Def. 1.2, p. 3.)

Its API includes `linearFormExponent_one_add`: For irrational ξ: w(ξ) + 1=μ(ξ); `le_linearFormExponent_of_infinite`: If the solution set for w is infinite then ofReal w≤w(θ); `mahlerExponent_mono`: w_m(ξ)≤w_n(ξ) for m≤n.

**Checks.**

- linearFormExponent ![√2]=1.
- linearFormExponent ![1/2]=0: dropping the condition 0 < |…| would give ⊤.
- linearFormExponent of the empty vector=0.
- linearFormExponent ![liouvilleNumber 10]=⊤, matching irrationalityExponent=⊤.

**Checks for Mahler’s polynomial exponent.**

- mahlerExponent 1 √2=1.
- mahlerExponent 0 ξ=0: constant integer polynomials give no positive exponent.
- mahlerExponent 2 √2=1. The exact polynomial X²−2 is excluded by the nonzero-value condition; admitting its integer multiples would give ∞.

Define `simultaneousExponent θ` as the supremum in ℝ≥0∞ of λ with maxⱼ|x₀θⱼ−xⱼ|≤|x₀|⁻λ for infinitely many integer tuples with x₀≠0. Exact approximations are allowed; λₙ(ξ)=λ(ξ,…,ξⁿ). (Bugeaud, §2, Def. 2.2, p. 5.)

Its API includes `simultaneousExponent_one_add`: For irrational ξ: λ(ξ) + 1=μ(ξ); `simultaneousExponent_eq_top_of_forall_rat`: λ(θ)=⊤ when every θ_j is rational; `simultaneousExponent_le_comp`: λ(θ)≤λ(θ ∘ f) for an injective reindexing f : Fin m→Fin n.

**Checks.**

- simultaneousExponent ![√2]=1.
- simultaneousExponent ![1/2, 1/3]=⊤.
- simultaneousExponent of the empty vector=⊤.
- simultaneousExponent ![√2, √3]≤1.

Define `algebraicApproximationExponent n ξ` as the supremum of w with 0<|ξ−α|≤H(α)⁻ʷ⁻¹ for infinitely many distinct complex algebraic α of degree ≤n. The height is naive, and α need not be real. Removing α≠ξ changes the set by at most one point and leaves infinitude unchanged. (Bugeaud, §2, Def. 2.1, p. 4; E19, ch. 7, Thm. 7.8, p. 144.)

Its API includes `algebraicApproximationExponent_one_add`: For irrational ξ: w*_1(ξ) + 1=μ(ξ); `algebraicApproximationExponent_mono`: w*_m(ξ)≤w*_n(ξ) for m≤n; `algebraicApproximation_infinite_iff_allow_eq`: For every n, ξ and real w, the set of algebraic α of degree≤n satisfying 0 < |ξ − α|≤H(α)^{-w-1} is infinite iff the same set with only |ξ − α|≤H(α)^{-w-1} is infinite. Their difference is contained in {ξ}.

**Checks.**

- algebraicApproximationExponent 1 √2=1.
- algebraicApproximationExponent 0 ξ=0 for every ξ.
- algebraicApproximationExponent 1 (1/2)=0; the infinitude quantifier ranges over distinct algebraic numbers.
- algebraicApproximationExponent 1 (liouvilleNumber 10)=⊤, matching μ=⊤.
- The set of algebraic α of degree≤1 with |1/2 − α|≤H(α)^{-2} is not infinite, even when the exact approximant α=1/2 is allowed. Exact equality contributes a single point, not infinitely many approximants.

*Needs:* §0.1.

For n≥1 and every θ∈ℝⁿ, prove λ(θ)≥1/n; rational tuples have λ=∞. (Bugeaud, §2, Thm. 2.5, p. 6.)

*Needs:* §0.4.

For n≥1 and 1,θ₁,…,θₙ ℚ-linearly independent, prove w(θ)≥n. In particular wₙ(ξ)≥n if ξ is not algebraic of degree ≤n. (Bugeaud, §2, Thm. 2.5, p. 6; E19, ch. 7, Lem. 7.6, p. 142.)

*Needs:* §0.4.

Under that last condition, prove w*ₙ(ξ)≤wₙ(ξ). (Bugeaud, §2, Thm. 2.5, p. 6; E19, ch. 7, Thm. 7.8, p. 144.)

*Needs:* §0.1.

For irrational ξ and consecutive reduced convergents pₖ/qₖ, pₖ₊₁/qₖ₊₁, prove |ξ−pₖ/qₖ|>1/(qₖ(qₖ+qₖ₊₁)); combine with the native upper bound 1/(qₖqₖ₊₁). (E19, ch. 1, Exercise 1.7(iv)–(v), p. 8; Sondow, §3, p. 5.)

For irrational ξ, prove μ(ξ)=1+limsup log qₖ₊₁/log qₖ=2+limsup log aₖ₊₁/log qₖ. Compute the limsup in ℝ≥0∞; the finitely many terms with qₖ=1 are assigned 0. (Sondow, §3, Thm. 1, p. 5; E19, ch. 1, Exercise 1.7, p. 9.)

Use `LiouvilleWith`, `liouvilleWith_one`, `forall_liouvilleWith_iff`, `Liouville`, `ae_not_liouvilleWith`, `Irrational`, `liouville_liouvilleNumber`; `LiouvilleWith`: `mono`, `irrational`; `Real`: `infinite_rat_abs_sub_lt_one_div_den_sq_of_irrational`, `convergent`, `convs_eq_convergent`, `exists_rat_eq_convergent`; `Liouville.exists_pos_real_of_irrational_root`; `Convex.norm_image_sub_le_of_norm_deriv_le`; [Polynomial.card_roots'](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Polynomial/Roots.html#Polynomial.card_roots'); `GenContFract`: `sub_convs_eq`, `determinant`, `abs_sub_convs_le`.

### 0.6 Bad approximation and the Littlewood proposition

Define `BadlyApproximable ξ` by irrationality of ξ and existence of c>0 such that q·dist(qξ,ℤ)≥c for every integer q≥1. (E19, ch. 2, §2.2, Exercise 2.7, p. 23; E19, ch. 2, Exercise 2.7, p. 23.)

Its API includes `BadlyApproximable.irrationalityExponent_eq`: Badly approximable ⇒ μ(ξ)=2; `badlyApproximable_of_natDegree_minpoly_eq_two`: Irrational real algebraic numbers of degree 2 are badly approximable; `BadlyApproximable.not_liouville`: Badly approximable numbers are not Liouville numbers; `BadlyApproximable.add_ratCast`: Stable under ξ ↦ ξ + r, r∈ℚ; `BadlyApproximable.ratCast_mul`: Stable under ξ ↦ rξ, r∈ℚ^×.

**Checks.**

- BadlyApproximable √2.
- ¬ BadlyApproximable q for q∈ℚ.
- ¬ BadlyApproximable (liouvilleNumber 10).
- BadlyApproximable φ.

*Needs:* §0.5.

Define `LittlewoodConjecture` as ∀α,β∈ℝ, ∀ε>0, ∃y∈ℤ, y≥1 and y·dist(yα,ℤ)·dist(yβ,ℤ)<ε. It remains an explicit hypothesis. Prove its cases with either argument not badly approximable, and infinitely many y≥1 with the product ≤1 for arbitrary α,β. (E19, ch. 2, p. 23; E19, ch. 2, Exercise 2.6, p. 22.)

Its API includes `littlewood_of_not_badlyApproximable`: For α not badly approximable, every β and ε > 0, some y≥1 has y‖yα‖‖yβ‖ < ε; `infinite_setOf_mul_le_one`: For all α, β, infinitely many y≥1 satisfy y‖yα‖‖yβ‖≤1.

**Checks.**

- For q∈ℚ, β∈ℝ, ε > 0 there is y≥1 with y‖yq‖‖yβ‖ < ε.
- For α=liouvilleNumber 10, every β and ε > 0 there is y≥1 with y‖yα‖‖yβ‖ < ε.
- It is false that for every α and ε > 0 some y≥1 has y‖yα‖ < ε (√2 is a counterexample), so the conjecture genuinely needs two numbers.

*Needs:* §0.4.

Use `Irrational`, `Liouville`; `Liouville.exists_pos_real_of_irrational_root`.

### Examples

The rational number 2/3 has F_x=3X−2 and all three scalar heights H_naive=M=H_abs=3. For √2, H_naive=M=2 while H_abs=√2. The empty approximation vector has w=0 and λ=∞, distinguishing linear-form from simultaneous approximation.

### Dependencies

Mathlib number fields, heights, polynomials, continued fractions and real measure theory; §0.0 and Mathlib bounded-intersection finiteness.

## Layer 1: auxiliary polynomials and Roth’s theorem

### 1.1 Coefficient length and the Thue construction

For f∈ℤ[X] of degree d≥1 and a complex root α, its degree-d binary homogenization F satisfies |F(x,y)|≤2^(d−1)M(f)max(|x|,y)ᵈ|α−x/y| for integer x and y>0. For coprime x,y the maximum is H(x/y). (E19, ch. 6, Thm. 6.1, p. 108.)

For algebraic α∈ℂ of degree d≥1 and ξ∈ℚ∖{α}, prove |ξ−α|≥2^(1−d)M(α)⁻¹H(ξ)⁻ᵈ. (E19, ch. 6, Thm. 6.1, pp. 107-108.)

*Needs:* §0.2.

For a seminormed coefficient ring define `Polynomial.l1Norm P` as Σi∈support(P)‖P.coeff i‖, the coefficient length; the zero polynomial has length 0. (E19, ch. 6, §6.2, p. 116.)

Its API includes `Polynomial.l1Norm_zero`: ‖0‖=0; `Polynomial.l1Norm_nonneg`: 0≤‖P‖; `Polynomial.l1Norm_eq_sum_range`: ‖P‖=∑_{i=0}^{natDegree P} ‖coeff P i‖; `Polynomial.l1Norm_C`: ‖C a‖=‖a‖; `Polynomial.l1Norm_monomial`: ‖a X^n‖=‖a‖; `Polynomial.l1Norm_neg`: ‖−P‖=‖P‖; `Polynomial.norm_coeff_le_l1Norm`: ‖coeff P i‖≤‖P‖; `Polynomial.supNorm_le_l1Norm`: Mathlib's supNorm P≤‖P‖; `Polynomial.l1Norm_le_mul_supNorm`: ‖P‖≤(natDegree P + 1) supNorm P; `Polynomial.l1Norm_eq_zero_iff`: Over a normed ring, ‖P‖=0 iff P=0; `Polynomial.mahlerMeasure_le_l1Norm`: For P∈ℂ[X], M(P)≤‖P‖ (Mathlib's mahlerMeasure_le_sum_norm_coeff).

**Checks.**

- ‖(X − 1)^2‖=4 in ℤ[X].
- ‖1‖=1 in ℤ[X].
- For X − 2∈ℂ[X]: supNorm=2 and ‖X − 2‖=3, so the ℓ¹-norm is not Mathlib's sup norm.
- ‖(X + 1)(X − 1)‖=2 < 4=‖X + 1‖ ‖X − 1‖: the norm is only submultiplicative.

Coefficient length satisfies ‖P+Q‖₁≤‖P‖₁+‖Q‖₁ over a seminormed ring. (E19, ch. 6, p. 116.)

Over a seminormed ring, ‖PQ‖₁≤‖P‖₁‖Q‖₁. (E19, ch. 6, p. 116.)

Over a normed field, |P(z)|≤‖P‖₁max(1,|z|)^deg P. (E19, ch. 6, p. 116.)

Over a normed field, ‖P(X+a)‖₁≤‖P‖₁(1+|a|)^deg P. (E19, ch. 6, p. 116.)

The univariate Hasse derivative obeys ‖DᵏP‖₁≤2^natDegree P‖P‖₁. Identify it with P⁽ᵏ⁾/k! only in characteristic zero. (E19, ch. 6, p. 116.)

For algebraic α∈ℂ of degree d, b≥1 with bα integral, 0<ε<1/2 and r≥1, construct Pᵣ,Qᵣ∈ℤ[X], not both zero, of degree ≤⌊(1/2+ε)dr⌋, such that (X−α)ʳ divides Pᵣ−αQᵣ and each length is ≤C₁ʳ, where C₁=(48b max(1,house α))^(d(1+1/ε)). (E19, ch. 6, Lem. 6.10, p. 119.)

*Needs:* §0.3.

If F∈ℚ[X], β is algebraic with rational minimal polynomial f and (X−β)ᵐ divides F over ℂ, then fᵐ divides F over ℚ. (E19, ch. 6, Lem. 6.11, p. 120.)

For the preceding Thue polynomials with d≥2, any ξ₁,ξ₂∈ℚ admit k∈ℕ with k≤d(2εr+1) and DᵏPᵣ(ξ₁)≠ξ₂DᵏQᵣ(ξ₁). (E19, ch. 6, Lem. 6.12, pp. 120-121.)

Suppose r≥1, 0≤k≤r, ε>0, d≥1, C₁≥0, deg P,deg Q≤(1/2+ε)dr and ‖P‖₁,‖Q‖₁≤C₁ʳ. If DᵏP−αDᵏQ=V(X−α)^(r−k), then |V(z)|,|DᵏQ(z)|≤C₂ʳ on |z−α|≤1, where C₂=2^((1/2+ε)d)(1+|α|)^(1+(1/2+ε)d)C₁. (E19, ch. 6, Lem. 6.13, pp. 121-122.)

For algebraic α of degree d≥2 and κ>d/2+1, sufficiently large good rational approximants ξ₁ control all others: H(ξ)≤H(ξ₁)^λ when both errors are ≤H⁻κ and H(ξ₁)≥C. Explicitly ε=(κ−1−d/2)/((2κ+2)d), C=max(e,(2C₂)^(2/(εd))) and λ=1+2(1+κd)/(dε), using C₁,C₂ above. (E19, ch. 6, Thm. 6.9, pp. 122-123; E19, ch. 6, Thm. 6.14, p. 124.)

For real algebraic α of degree d≥3 and κ>d/2+1, only finitely many ξ∈ℚ satisfy |ξ−α|≤H(ξ)⁻κ. This gives no effective list of solutions. (E19, ch. 6, Thm. 6.9, p. 115; E19, ch. 6, p. 110.)

Use `Polynomial`: `homogenize`, `mahlerMeasure`, `mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `C_leadingCoeff_mul_prod_multiset_X_sub_C`, `supNorm`, `mahlerMeasure_le_sum_norm_coeff`, `taylor`, `hasseDeriv`, `hasseDeriv_coeff`, `taylor_coeff`, `rootMultiplicity`, `pow_rootMultiplicity_dvd`, `wronskian`, `natDegree_wronskian_lt_add`, `hasseDeriv_mul`, `lt_rootMultiplicity_iff_isRoot_iterate_derivative`, `factorial_smul_hasseDeriv`; `IsAlgClosed.card_roots_eq_natDegree`; `Rat.mulHeight₁_eq_max`; `Height.mulHeight₁`; `minpoly`: `irreducible`, `dvd`; `Liouville.exists_pos_real_of_irrational_root`; `isIntegral_leadingCoeff_smul`, `minpoly`; `NumberField`: `house`, `finite_setOfPred_mulHeight₁_le`; `Irreducible.separable`.

### 1.2 Divided partial derivatives and weighted index

Over a commutative semiring define `MvPolynomial.hasseDeriv d` as the linear operator Dᵈ(Xᵐ)=∏ⱼbinom(mⱼ,dⱼ)X^(m−d), with zero if any dⱼ>mⱼ. It preserves integer coefficients and agrees with factorial-divided partial differentiation over a ℚ-algebra. (P22, §2.6, Lem. 2.6.1, pp. 68-69.)

Its API includes `MvPolynomial.hasseDeriv_monomial`: ∂^d(a x^m)=(∏_j binom(m_j, d_j)) a x^{m−d}; `MvPolynomial.hasseDeriv_zero`: ∂^0=id; `MvPolynomial.factorial_smul_hasseDeriv_single`: k! ∂^{k e_i} P=(∂/∂x_i)^k P (Mathlib's pderiv iterated); `MvPolynomial.hasseDeriv_eq_zero_of_degreeOf_lt`: If deg_{x_i} P < d_i then ∂^d P=0; `MvPolynomial.degreeOf_hasseDeriv_le`: deg_{x_i}(∂^d P)≤deg_{x_i} P − d_i.

**Checks.**

- ∂^{(2,0)}(x_0^3 x_1)=3 x_0 x_1 over ℤ.
- ∂^d 1=0 for d≠0.
- ∂^{(2)}(x_0^2)=1 while (∂/∂x_0)^2 x_0^2=2: the divided derivative is not the ordinary one.
- ∂^{e_1}((X^2)(x_1))=(2X)(x_1): agreement with Mathlib's univariate Hasse derivative.

Prove the finite Hasse Taylor expansion P(a+y)=Σd DᵈP(a)yᵈ. (P22, §3.5.3, p. 100.)

For an absolute value v on a commutative ring, v([Xᵐ]DᵈP)≤2^|m+d|v([X^(m+d)]P). (P22, §2.6, §3.4.6, pp. 71.)

For nonarchimedean v the factor 2^|m+d| can be omitted. (P22, §3.4.6, p. 92.)

Define `MvPolynomial.weightedIndex` as follows. Over a commutative ring define `weightedIndex r a P` as inf{Σⱼiⱼ/rⱼ : DⁱP(a)≠0} in ℝ≥0∞. Empty infima are ∞. Positive integer weights make the index of a nonzero polynomial finite and rational. (P22, §2.6, Def. 2.6.2, p. 69.)

Its API includes `MvPolynomial.weightedIndex_zero`: Ind_{a,r}(0)=∞; `MvPolynomial.weightedIndex_eq_zero_iff`: For r_j≠0: Ind_{a,r}(P)=0 iff P(a)≠0; `MvPolynomial.weightedIndex_ne_top`: For r_j≠0 and P≠0 the index is finite; `MvPolynomial.weightedIndex_map`: For an injective ring map f: Ind_{f∘a,r}(map f P)=Ind_{a,r}(P).

**Checks.**

- Ind_{(0,0),(3,3)}(x_0^3 − x_1^2)=2/3 over ℚ.
- Over ℚ (or any nontrivial commutative ring), Ind_{a,r}(1)=0 for every a,r, including zero weights.
- Ind_{(0,0),(1,2)}(x_0 x_1)=3/2, not the total order of vanishing 2: the index is weighted.
- In one variable, Ind_{β,r}((x_0 − β)^m)=m/r (order of vanishing divided by the weight).

Over an integral domain and positive weights, Ind(PQ)=Ind(P)+Ind(Q), including zero factors. (P22, Exercise 2.19, p. 72.)

For any P,Q over a commutative ring, min(Ind(P),Ind(Q))≤Ind(P+Q). (P22, §3.4.7, Exercise 3.6, pp. 93-94.)

In a characteristic-zero integral domain with positive weights, Ind(P)≤Ind(DᵈP)+Σⱼdⱼ/rⱼ. (P22, §3.4.7, p. 94, p. 99.)

For an injection of finite variable sets, prove the index-renaming adapter: renaming preserves index when the point and weights are pulled back along the injection. (P22, Lem. 2.6.1 and Def. 2.6.2, pp. 68–69, via the Hasse coefficient formula.)

For an integer c≥1 and positive weights, Ind with weights cr equals Ind with weights r divided by c. (P22, §3.4.6, p. 93.)

For nonzero univariate p placed in coordinate i and positive weights, Ind(p(Xᵢ))=rootMultiplicity(p,aᵢ)/rᵢ. (P22, Lem. 3.4.3, p. 90.)

The Hasse coefficient formula is [Xᵐ]DᵈP=∏ⱼbinom(mⱼ+dⱼ,dⱼ)[X^(m+d)]P. (P22, §2.6, Lem. 2.6.1, pp. 68-69.)

Prove the divided Leibniz formula Dᵈ(PQ)=Σa+b=d DᵃP·DᵇQ. (E19, ch. 6, p. 117.)

Composition is DᵃDᵇ=∏ⱼbinom(aⱼ+bⱼ,aⱼ)D^(a+b). (P22, §2.6, Lem. 2.6.1, pp. 68-69.)

Hasse derivatives commute with coefficient ring maps, in particular ℤ→ℚ→ℝ. (P22, §2.6, Lem. 2.6.1, pp. 68-69.)

On p(Xᵢ), D^(keᵢ) is the native univariate kth Hasse derivative placed in coordinate i; derivatives using another coordinate vanish. (P22, §2.6, Lem. 2.6.1, pp. 68-69.)

For t∈ℝ≥0∞, prove t≤Ind(P) iff all jets of weight <t vanish. The threshold is strict. (P22, §2.6, p. 69.)

For nonzero P and positive weights, Ind(P)≤ΣⱼdegreeOf j P/rⱼ; if each partial degree is ≤rⱼ then Ind(P)≤n. (P22, §2.6, p. 69.)

Use `MvPolynomial`: `pderiv`, `rename`; `Polynomial`: `hasseDeriv`, `toMvPolynomial`, `taylor_coeff`, `rootMultiplicity`, `pow_rootMultiplicity_dvd`, `hasseDeriv_mul`, `hasseDeriv_coeff`.

### 1.3 Coefficient heights and products

Consume ArithmeticHeights Layer 2 coefficient heights. For K with admissible absolute values the sparse adapter `MvPolynomial.logHeight` as the native Finsupp logarithmic height of the coefficient vector. For a nonzero polynomial over a number field this is Σw|∞ mʷ log maxμ|Pμ|w + Σv finite log maxμ|Pμ|v. It is relative; divide by [K:ℚ] for the absolute normalization. (P22, §3.2, Def. 3.2.1, Lem. 3.2.2, p. 80.)

Its API includes `MvPolynomial.logHeight_nonneg`: h(P)≥0; `MvPolynomial.logHeight_zero`: h(0)=0; `MvPolynomial.logHeight_C_mul`: h(cP)=h(P) for c≠0 (projectivity; Pottmeyer, Lemma 3.2.2); `MvPolynomial.logHeight_C`: h(c)=0 for a constant; `MvPolynomial.logHeight_rename`: h is invariant under injective renaming of variables; `MvPolynomial.logHeight_eq_of_numberField`: The place-by-place formula over a number field (Mathlib's NumberField.mulHeight_eq).

**Checks.**

- h(2x_0 + 4)=log 2 over ℚ.
- h(5)=0.
- h(x_0 − q)=Mathlib's logHeight₁ q for q∈ℚ.
- h(2x_0 + 2)=0, not log 2=log of the largest coefficient: the height is projective.

Define `Polynomial.logHeight` by the same coefficient-vector adapter for K[X]. Embedding the polynomial into one multivariate coordinate preserves this height. (P22, §3.2, Def. 3.2.1, p. 80.)

Its API includes `Polynomial.logHeight_nonneg`: h(p)≥0; `Polynomial.logHeight_zero`: h(0)=0; `Polynomial.logHeight_C_mul`: h(cp)=h(p) for c≠0; `Polynomial.logHeight_X_sub_C`: h(X − β)=logHeight₁ β (Mathlib's height of β).

**Checks.**

- h(X − 2)=log 2 over ℚ.
- h(7)=0.
- h(X^2 − 1/4)=log 4 (the primitive multiple is 4X^2 − 1).
- h(X − 1/2)=log 2, although every coefficient has absolute value≤1: the height sees denominators.

Nonzero polynomials with disjoint variable sets satisfy h(PQ)=h(P)+h(Q). (P22, Exercise 3.3, p. 85.)

For nonzero integer P viewed over ℚ, h(P)≤log maxμ|Pμ|, with equality for primitive coefficient vectors. (P22, §3.5.2, p. 98.)

For a,b∈ℕ, binom(a,⌊a/2⌋)binom(b,⌊b/2⌋)≤binom(a+b,⌊(a+b)/2⌋). (P22, Lem. 3.2.8, p. 83.)

Provides the central-binomial estimate used by the coefficient-product bounds. Supplied by ArithmeticHeights §2.3 / Gelfond’s inequality (critical-path central-binomial lemma) (an open TauCetiRoadmap pull request by rwst). Identify floor(k/2) with natural division and retain n=0; consume the exact square-root statement, not merely choose≤2^n.

Complex polynomials satisfy ‖f‖∞‖g‖∞≤2^deg(fg)‖fg‖∞. (P22, Lem. 3.2.10, p. 84.)

For nonzero f,g over a number field of degree D, h(f)+h(g)≤h(fg)+D deg(fg)log 2. (P22, Prop. 3.2.12, pp. 84-85.)

For nonzero univariate P over a number field K, β∈K and r≥deg P, prove ordβ(P)h(β)≤h(P)+[K:ℚ]r log 2. If r h(β)≥σ⁻¹(h(P)+4r[K:ℚ]), σ>0, then the index is ≤σ. (P22, Lem. 3.4.3, pp. 90-91.)

*Needs:* §1.2.

For finitely many polynomials over an integral domain with absolute value v, v([Xᵐ]∏ₖfₖ)≤2^(ΣⱼdegreeOf j(∏ₖfₖ))∏ₖmaxa v([Xᵃ]fₖ). (P22, p. 84.)

The univariate coefficient-height adapter agrees with the multivariate adapter after placement in one coordinate. (P22, §3.4.6, p. 93.)

Use `Finsupp.logHeight`; `Height`: `mulHeight`, `logHeight₁_eq_logHeight`, `mulHeight_fun_mul_eq`, `mulHeight_smul_eq_mulHeight`, `logHeight₁`, `mulHeight_comp_equiv`; `NumberField`: `mulHeight_eq`, `instAdmissibleAbsValues`, `totalWeight_eq_finrank`; `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`; `Polynomial`: `supNorm`, `mahlerMeasure_mul`, `mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`, `supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`, `gaussNorm_mul`, `pow_rootMultiplicity_dvd`, `toMvPolynomial`; `NumberField.InfinitePlace`: `embedding`, `mult`; `MvPolynomial.degreeOf`.

### 1.4 Wronskians and separation of variables

Define `Polynomial.hasseWronskian` as follows. Define `hasseWronskian g` as det(Dᵏgₗ) with rows 0≤k<m. The empty determinant is 1. Over any commutative ring, multiplying by ∏k<m k! gives the ordinary Wronskian; for two columns it is g₀g₁′−g₀′g₁. (P22, Def. 3.3.1, pp. 85-87.)

Its API includes `Polynomial.hasseWronskian_fin_two`: W(a, b)=Mathlib's wronskian a b=a b' − a' b; `Polynomial.hasseWronskian_fin_zero`: The empty Wronskian is 1; `Polynomial.hasseWronskian_fin_one`: W(g_0)=g_0; `Polynomial.prod_factorial_mul_hasseWronskian`: (∏_k k!) W(g)=det(derivative^[k] g_l), the classical Wronskian (Remark 3.3.6); `Polynomial.hasseWronskian_eq_zero_of_not_linearIndependent`: Linearly dependent families have W=0 (Lemma 3.3.2); `Polynomial.hasseWronskian_comp_perm`: Permuting the family multiplies W by the sign; `Polynomial.hasseWronskian_map`: W commutes with coefficient ring maps.

**Checks.**

- W(1, X, X^2)=1 over ℚ.
- W(X, 2X)=0.
- W(1, X)=1.
- The classical Wronskian det(derivative^[k] g_l) of (1, X, X^2) is 2, not 1: the normalisation matters.
- Over 𝔽₂, 1 and X² are linearly independent but their two-column Hasse Wronskian is zero. The nonvanishing criterion needs characteristic zero.

For polynomial families over a characteristic-zero field, linear independence is equivalent to nonvanishing of this Wronskian. (P22, Lem. 3.3.2, Prop. 3.3.3, pp. 86.)

Define `MvPolynomial.genWronskian` as follows. Define `genWronskian D f` as det(D^(Dₖ)fₗ). An admissible row family satisfies |Dₖ|≤k with indices starting at 0; admissibility is a theorem hypothesis. (P22, p. 87.)

Its API includes `MvPolynomial.genWronskian_eq_zero_of_not_linearIndependent`: Linearly dependent families have all W_D=0; `MvPolynomial.genWronskian_fin_zero`: The empty generalized Wronskian is 1; `MvPolynomial.genWronskian_fin_one`: W_{(0)}(f_0)=f_0; `MvPolynomial.map_genWronskian`: W_D commutes with coefficient ring maps; `MvPolynomial.genWronskian_single_toMvPolynomial`: With D_k=k e_i and one-variable g_l placed in x_i, W_D is the one-variable Wronskian placed in x_i.

**Checks.**

- W_{(0, e_0)}(x_0, x_1)=−x_1.
- For m=0 the generalized Wronskian is 1.
- W_D(x_0, x_0)=0 for every D.
- W_{(0, e_0)}(1, x_0)=1, the one-variable Wronskian W(1, X).

*Needs:* §1.2.

Over a field, substitution Xⱼ↦t^(Bʲ) preserves linear independence of a finite family if B exceeds every partial degree of every member. (P22, Exercise 3.5(a), p. 89.)

The kth ordinary derivative after that substitution is Σ|d|≤k a_(d,k)(t)·φ(Dᵈf), with polynomial a_(d,k) independent of f. (P22, Exercise 3.5(b), p. 89.)

*Needs:* §1.2.

Over a characteristic-zero field, a polynomial family is independent iff some admissible generalized Wronskian is nonzero. (P22, Thm. 3.3.7, p. 87.)

For nonzero P over a field and a coordinate i₀, write P=Σk=0..s fₖgₖ with s≤degreeOf i₀ P, independent fₖ not involving i₀ and independent gₖ involving only i₀. (P22, Lem. 3.3.8, p. 88.)

For such a separated expression and derivative rows Dₖ with (Dₖ)ᵢ₀=0, prove W_D(f)W_(0,eᵢ₀,…,seᵢ₀)(g)=det(D^(Dₖ+leᵢ₀)P)ₖₗ. (P22, Lem. 3.3.9, pp. 88-89.)

*Needs:* §1.2.

Over a number field of degree D, h(det(D^(Eₖₗ)P))≤m h(P)+D(2mΣⱼdegreeOf j P·log 2+log(m!)). Under the degree-ratio hypotheses of Roth’s lemma, m=s+1 and s≤rₙ give h(W)≤(s+1)(h(P)+4r₁D). (P22, §3.4.6, pp. 92-93.)

*Needs:* §1.3; §1.2.

For k∈ℕ and δ∈ℝ, prove Σi=0..k max(δ−i/k,0)≥(k+1)min(δ/2,δ²/2); real division by 0 is assigned 0. (P22, Lem. 3.4.8, Exercise 3.7, pp. 94-95.)

If each column polynomial has partial degree ≤N in coordinate i, the generalized m×m Wronskian has partial degree ≤mN there. (P22, §3.4.5, p. 91.)

*Needs:* §1.2.

Use `Polynomial`: `hasseDeriv`, `wronskian`, `factorial_smul_hasseDeriv`; `Matrix.det_apply`; `MvPolynomial`: `aeval`, `pderiv`, `degreeOf`, `vars`; `MvPowerSeries.gaussNorm_mul_le`; `IsNonarchimedean.apply_sum_le`; `NumberField`: `totalWeight_eq_finrank`, `mulHeight_eq`.

### 1.5 Roth’s index estimate and auxiliary polynomial

For K a number field, n≥1, P≠0, β∈Kⁿ, 0<σ≤1/2 and positive rᵢ, assume degreeOf i P≤rᵢ, rᵢ₊₁≤σrᵢ and rᵢh(βᵢ)≥σ⁻¹(h(P)+4nr₁[K:ℚ]). Prove Indβ,r(P)≤2nσ^(1/2^(n−1)). (P22, Thm. 3.4.1, pp. 90-94.)

*Needs:* §1.3; §1.4; §1.2.

For positive integer rᵢ and 0<ε<1, count the dᵢ∈{0,…,rᵢ} with Σᵢdᵢ/rᵢ≤(n/2)(1−ε): there are at most ∏ᵢ(rᵢ+1)exp(−ε²n/4). (P22, Lem. 2.6.4, pp. 69-70.)

For algebraic α of degree d, 0<ε<1 and n≥1 with exp(ε²n/4)≥2d, construct nonzero P∈ℤ[X₁,…,Xₙ] for every positive rᵢ, with partial degrees ≤rᵢ, diagonal index ≥(n/2)(1−ε) and |Pμ|≤C^(Σrᵢ). Take C=12b max(1,house α), where b is Fα’s leading coefficient. (P22, Thm. 2.6.5, pp. 70-72; E19, ch. 6, Lem. 6.10, p. 119.)

*Needs:* §0.3; §1.2.

Every infinite S⊆ℚ contains β₁,…,βₙ with h(β₁)≥L and h(βᵢ₊₁)≥M h(βᵢ), for n≥1 and arbitrary real L,M. (P22, §3.5, p. 97.)

For n≥1, 0<ε<1/12, σ=(5ε/4)^(2^(n−1)), C₁≥0, M≥2/σ and L>0 with L≥σ⁻¹(5C₁/2+5n), take h(β₁)≥L, h(βᵢ₊₁)≥M h(βᵢ), D≥5h(βₙ), rᵢ=⌊D/h(βᵢ)⌋. Then rᵢ≥1, Σrᵢ≤2D/L and rᵢ₊₁≤σrᵢ; if H≤C₁Σrᵢ, then σ⁻¹(H+4nr₁)≤rᵢh(βᵢ). (P22, §3.5.2, pp. 97-99.)

For an integer P with positive degree bounds rᵢ, Σrᵢ≤2D/L, log|Pμ|≤C₁Σrᵢ, C₁≥log 2, diagonal index ≥(n/2)(1−ε) and index at β∈ℚⁿ ≤5nε/2, choose a Hasse derivative Q of P with Q(β)≠0, diagonal index ≥(1/2−3ε)n and log|Qμ|≤4C₁D/L. Partial degrees stay ≤rᵢ. (P22, Lem. 3.5.7, p. 99.)

*Needs:* §1.2.

Suppose Q∈ℤ[X₁,…,Xₙ] has partial degrees ≤rᵢ with rᵢ≥1, diagonal index at α∈ℝ ≥t≥0, |βᵢ−α|≤H(βᵢ)⁻κ for β∈ℚⁿ, κ≥0, and rᵢh(βᵢ)≥D′≥0. If Q(β)≠0, then log|Q(β)|≤log maxμ|Qμ|+Σrᵢ(log 2+log max(1,|α|))+2Σlog(rᵢ+1)−κD′t. (P22, §3.5.3, pp. 100-102; P22, Exercise 3.10, p. 104.)

*Needs:* §1.2.

For Q∈ℤ[X₁,…,Xₙ], partial degrees ≤rᵢ and Q(β)≠0 at β∈ℚⁿ, prove log|Q(β)|≥−Σᵢrᵢ log den(βᵢ). (P22, §3.5.3, pp. 99-100.)

Use `Matrix.det_apply`; `Real`: `abs_exp_sub_one_sub_id_le`, `add_one_le_exp`; `isIntegral_leadingCoeff_smul`; `NumberField`: `house`, `finite_setOfPred_mulHeight₁_le`; `Height`: `logHeight₁`, `mulHeight₁`; `Rat.mulHeight₁_eq_max`.

### 1.6 Roth’s theorem and binary forms

For real algebraic irrational α and κ>2, prove finiteness of {ξ∈ℚ:|ξ−α|≤H(ξ)⁻κ}. This proof supplies no height bound or enumeration. (E19, ch. 6, Thm. 6.2, Exercise 6.1, p. 110; P22, Thm. 3.0.1, §3.5, pp. 73.)

*Needs:* §1.5; §1.3.

For the same α,κ, obtain c>0 with |ξ−α|≥cH(ξ)⁻κ for every ξ∈ℚ; the method does not compute c. (E19, ch. 6, Thm. 6.2, Exercise 6.1, p. 110.)

For any complex algebraic α and κ>2, obtain c>0 with this inequality for all ξ∈ℚ∖{α}. (E19, ch. 6, Thm. 6.2, p. 110.)

*Needs:* §1.1.

For real algebraic α and p>2, prove ¬LiouvilleWith p α, hence μ(α)≤2. Rational α still has μ(α)=1. (E19, ch. 6, Exercise 6.1, Thm. 6.2, pp. 109-110.)

For every integer b≥2, prove transcendence of Σk≥1 b^(−3ᵏ). (E19, ch. 6, Exercise 6.5, p. 132.)

*Needs:* §1.1.

A nonzero complex binary form of degree d with no squared linear factor and no Y factor is a₀∏i=1..d(X−αᵢY), with a₀≠0 and distinct αᵢ. (E19, ch. 6, Thm. 6.3, p. 111.)

For a square-free integer binary form F of degree d≥3 and κ>2, obtain c>0 with |F(x,y)|≥c max(|x|,|y|)^(d−κ) whenever F(x,y)≠0. (E19, ch. 6, Thm. 6.3, pp. 111-112.)

An integer binary form whose F(X,1) has at least three distinct complex zeros has a square-free integer binary divisor of degree ≥3. (E19, ch. 6, Corollary 6.4, p. 112.)

For such a binary form and m∈ℤ∖{0}, prove that F(x,y)=m has finitely many integer solutions. Effective bounds are developed in Layer 4. (E19, ch. 6, Corollary 6.4, pp. 112-113.)

Use `Height.mulHeight₁`; `Irrational`, `LiouvilleWith`, `Transcendental`; `LiouvilleWith.irrational`; `NumberField.finite_setOfPred_mulHeight₁_le`; `MvPolynomial.IsHomogeneous`; `Polynomial`: `homogenize`, `C_leadingCoeff_mul_prod_multiset_X_sub_C`, `IsPrimitive`; `IsAlgClosed.card_roots_eq_natDegree`; `Rat.mulHeight₁_eq_max`; `Polynomial.IsPrimitive.Int.dvd_iff_map_cast_dvd_map_cast`.

### 1.7 Block substitution and nonzero jets

For block-linear substitution Xₕₗ=Σa AₕₗaYₕa over a commutative semiring, set c_(e,k)=[Tᵏ]∏ₕₗ(Σa AₕₗaTₕa)^eₕₗ. If c_(e,k)≠0, then Σa kₕa=Σₗeₕₗ in every block. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- Over ℚ, the coefficient of X₀X₁ in (X₀+X₁)² is 2.
- Over ℚ, the coefficient of X₀ in (X₀+X₁)² is zero.
- The coefficient for e=k=0 is 1 even for an empty substitution matrix; the empty product has value 1.

For that substitution, D_Yᵏ((D_XⁱF)(AY))=Σe∈E(k) c_(e,k)∏ₕₗbinom(iₕₗ+eₕₗ,iₕₗ)(D_X^(i+e)F)(AY), where E(k) consists of nonnegative e with Σₗeₕₗ=Σa kₕa in each block. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- For F=X₀² over ℚ, D¹((D¹F)(2Y))=4; omitting the composition binomial coefficient would give 2.
- Substituting X↦0 into D⁰(X²+1) gives 1; its positive-order Hasse derivative is zero.

*Needs:* §1.2.

A nonzero substituted jet at y forces some original jet D^(i+e)F(Ay)≠0 with the same block-degree equations e∈E(k). (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- For F=X₀−X₁ and X₀=X₁=Y over ℚ, the composed polynomial is zero although D_(1,0)F=1 and D_(0,1)F=−1.
- For the identity substitution and F=X², the zero-order jet evaluated at 2 is 4.

For block-homogeneous F of degrees dₕ over a commutative semiring, DʲF≠0 forces Σₗjₕₗ≤dₕ and gives residual block degrees dₕ−Σₗjₕₗ. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- For F=X_(0,0)²X_(1,0) over ℚ, D_(1,0)F=2X_(0,0)X_(1,0), of residual block degrees (1,1).
- D³(X²)=0 over ℚ, although 3≤2 is false; nonzero cannot be omitted from the order bound.

*Needs:* §1.2.

If every supported monomial of F has block degree ≤dₕ, each individual parameter degree of F(AY) is ≤dₕ. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- Substituting X₀=X₁=Y into X₀X₁ gives Y², with individual Y-degree 2, although each original individual degree is 1.
- For the zero polynomial over ℚ, every individual degree is zero.

For block-homogeneous H of degrees δₕ, a nonzero value H(x) with zero block xₕ forces δₕ=0. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- For H=X_(0,0)² over ℚ, H evaluated at the zero block is 0.
- A constant polynomial 3 on one empty block evaluates to 3.

Replacing blocks of degree 0 by arbitrary vectors preserves H(x), simultaneously in all such blocks. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- For H=X_(1,0)² over ℚ, H(0,2)=H(−3,2)=4.
- For H=1+X over ℚ, H(0)=1 but H(−1)=0: nonzero evaluation at zero does not imply independence without homogeneity.

Use `MvPolynomial`: `IsWeightedHomogeneous`, `isWeightedHomogeneous_X`, `eval₂_monomial`, `eval_eval₂`, `as_sum`, `degreeOf_le_iff`, `eval₂Hom_eq_zero`, `eval₂_congr`; `MvPolynomial.IsWeightedHomogeneous`: `C_mul`, `sum`, `pow`, `prod`; `Finsupp.instLocallyFiniteOrder`.

### Examples

The divided Wronskian of (1,X,X²) is 1, while the ordinary determinant is 2. Interchanging (1,X) gives W(X,1)=−1. The weighted index of X₀X₁ at zero with weights (1,2) is 3/2. In characteristic two X²−X vanishes at every integer image, so integer-grid nonvanishing requires characteristic zero.

### Dependencies

Layer 0 heights, Northcott and Siegel; Mathlib Hasse derivatives, coefficient operations, matrices and finite-dimensional linear algebra.

## Layer 2: subspace theorems and multiplicative groups

### 2.1 Linear forms and exceptional subspaces

Define `InGeneralPosition` as follows. For finite coefficient vectors Lᵢ over a field, define `InGeneralPosition L` by linear independence of every n-element subfamily in n variables. This permits r<n, although the product theorems require r≥n. (E19, ch. 7, §7.1, Thm. 7.4, p. 140; E19, ch. 7, §7.1, p. 137.)

Its API includes `InGeneralPosition.linearIndependent`: If InGeneralPosition L and S : Finset ι has #S=n then the subfamily (L i)_{i∈S} is linearly independent; `inGeneralPosition_iff_det_ne_zero`: InGeneralPosition L↔for every injective e : Fin n→ι, det (fun k j ↦ L (e k) j)≠0; `inGeneralPosition_iff_linearIndependent`: If Fintype.card ι=n then InGeneralPosition L↔LinearIndependent F L; `inGeneralPosition_two_iff`: For n=2: InGeneralPosition L↔for all i≠j the vectors L i and L j are linearly independent (no two forms are proportional); `InGeneralPosition.comp_injective`: If InGeneralPosition L and e : κ→ι is injective then InGeneralPosition (L ∘ e); `InGeneralPosition.smul`: If InGeneralPosition L and c : ι→F with c i≠0 for all i, then InGeneralPosition (fun i ↦ c i • L i); `InGeneralPosition.map`: If σ : F →+* F' is a ring homomorphism of fields and InGeneralPosition L then InGeneralPosition (fun i ↦ σ ∘ L i) (used for Galois transport in Lemma 7.11); `InGeneralPosition.comp_matrix`: If A is an invertible n × n matrix over F and InGeneralPosition L, then InGeneralPosition (fun i ↦ Aᵀ.mulVec (L i)), i.e. general position is preserved by the linear change of variables x ↦ A x; `inGeneralPosition_coords_add_sum`: For every n≥1 the n + 1 forms X_1, …, X_n, X_1 + ⋯ + X_n are in general position over any field.

**Checks.**

- Over ℚ with n=2, the family ![![1,0], ![0,1], ![1,1]] is in general position.
- Over ℚ with n=2, the family ![![1,0], ![0,1], ![1,0]] (a repeated form) is not in general position.
- Over ℚ with n=3, the family X_1, X_2, X_1 + X_2, X_3 is pairwise linearly independent but not in general position (a definition by pairwise independence would accept it).
- Over any field, the n standard coordinate forms (ι=Fin n) are in general position; with #ι=n general position is exactly linear independence.
- Over ℝ the three forms x_1 + √2x_2 + √3x_3, x_1 − √2x_2 + √3x_3, x_1 − √2x_2 − √3x_3 of Evertse (7.5) are in general position (determinant 4√6≠0).

For n independent linear forms over a valued field, the inverse coefficient matrix gives |x|≤C′ maxᵢ|Lᵢ(x)|, with C′=n max(1,maxᵢⱼ|(L⁻¹)ᵢⱼ|) at an archimedean place; omit n at a nonarchimedean place. (E19, ch. 7, Lem. 7.5, p. 141; E19, ch. 8, Lem. 8.9, p. 164.)

Every absolute value on ℚ at p or ∞ extends to a number field K and is induced by an embedding into an algebraic closure of ℚₚ or into ℂ, respectively. (E19, ch. 8, §8.1.3, pp. 157–158; E19, ch. 8, Lem. 8.5, p. 160.)

Every continued absolute value on a number field extends to its algebraic closure, with the corresponding embedding into ℂ or an algebraically closed p-adic completion. The embedding must preserve the chosen absolute value. (E19, ch. 8, §8.1.3, p. 158; E19, ch. 8, §8.1.3, Lem. 8.5, p. 161; EF13, §3.1, p. 13.)

For u∈ℚ× and a finite set S of primes, |u|∞∏p∈S|u|p=1 iff u=±∏p∈S p^zₚ with zₚ∈ℤ. For a nonzero integer g the same partial product is ≥1. (E19, ch. 8, Lem. 8.11, p. 165.)

Let n≥2 and L₁,…,Lₙ be independent linear forms with algebraic coefficients. For C,δ>0, all nonzero integer x with ∏ᵢ|Lᵢ(x)|≤C‖x‖∞⁻δ lie in finitely many proper ℚ-subspaces. (E19, ch. 7, Thm. 7.1, p. 138; Evertse, survey, §2, p. 4.)

For r≥n≥2 algebraic linear forms in general position and C,δ>0, the inequality ∏ᵢ|Lᵢ(x)|≤C‖x‖∞^(r−n−δ) has its nonzero integer solutions in finitely many proper ℚ-subspaces. (E19, ch. 7, Thm. 7.4, pp. 140–141; E19, ch. 7, Thm. 7.4, Thm. 7.1, pp. 141–142.)

Let S contain ∞ and finitely many primes, with n≥2 independent algebraic linear forms at each place and chosen extensions of the absolute values. For C,ε>0, nonzero integer solutions of ∏p∈S∏ᵢ|Lᵢp(x)|p≤C‖x‖∞⁻ε lie in finitely many proper ℚ-subspaces. (E19, ch. 8, Thm. 8.7, p. 162; E19, ch. 8, p. 161; EF13, §1.1, p. 2.)

*Needs:* §2.8.

For rₚ≥n≥2 algebraic forms in general position at each p∈S and C,ε>0, primitive integer solutions of ∏p∈S∏ᵢ|Lᵢp(x)|p≤C‖x‖∞^(r∞−n−ε) lie in finitely many proper ℚ-subspaces. (E19, ch. 8, Thm. 8.8, p. 164; E19, ch. 8, Thm. 8.8, pp. 164–165.)

For n≥2, 0<ε≤1 and C>0, put Aᵢp=n max(1,maxⱼ|coefficientⱼ Lᵢp|p). A finite collection of exponent systems dᵢp≤0 with Σp,i dᵢp=−n−ε/2 covers every sufficiently large primitive solution of the preceding product inequality whose form values are nonzero: each such x satisfies |Lᵢp(x)|p≤Aᵢp‖x‖p‖x‖∞^dᵢp for one system. The lower height bound depends only on the displayed data. (ES02, §21, Lem. 21.1, p. 97; ES02, §21, Thm. 3.1, p. 97; EF13, §1.1, p. 2.)

*Needs:* §2.8.

There are finitely many effectively determinable proper subspaces depending only on the forms such that, for every C,δ>0, only finitely many solutions of the Subspace inequality lie outside them. The residual finite set has no effective height bound. (E19, ch. 7, Thm. 7.14, p. 151; EF13, §3, Thm. 3.3, p. 15.)

*Needs:* §2.8.

If an algebraic linear form vanishes at a nonzero integer x₀, every integer multiple of x₀ makes the product zero. Thus a proper subspace may contain infinitely many solutions. (E19, ch. 7, Corollary 7.2, p. 139.)

In three variables the forms X₁+√2X₂+√3X₃, X₁−√2X₂−√3X₃ and X₁−√2X₂+√3X₃ are independent, with determinant −4√6 in that row order. For 0<δ<1 their product inequality has infinitely many solutions on X₃=0 even after requiring a positive product of absolute values. (E19, ch. 7, Lem. 7.3, p. 140; E19, ch. 7, p. 140.)

In two variables, for independent algebraic forms and C,δ>0, imposing 0<|L₁(x)L₂(x)|≤C‖x‖∞⁻δ leaves only finitely many integer solutions. (E19, ch. 7, Lem. 7.3, p. 139.)

For complex algebraic α, κ>2 and C>0, finitely many rational ξ satisfy |ξ−α|≤CH(ξ)⁻κ. This includes rational α and its exact approximant. (E19, ch. 7, Corollary 7.2, pp. 138–139; E19, ch. 7, Corollary 7.2, p. 139.)

For n≥2 and real α₁,…,αₙ linearly independent over ℚ, with |αₙ| maximal, infinitely many nonzero integer x satisfy |Σαᵢxᵢ|≤|αₙ|n^(n−1)‖x‖∞^(1−n). (E19, ch. 7, Lem. 7.6, p. 142; E19, ch. 2, Corollary 2.6, p. 20.)

*Needs:* §0.0 successive minima and linear forms.

For n≥1, algebraic αᵢ and C,δ>0, finitely many integer x satisfy 0<|Σαᵢxᵢ|≤C‖x‖∞^(1−n−δ). No independence assumption is needed because the exact zero values are excluded. (E19, ch. 7, Thm. 7.7, p. 143.)

For complex algebraic ξ, d≥1, κ>d+1 and C>0, there are finitely many algebraic α of degree ≤d with |ξ−α|≤CH_naive(α)⁻κ. (E19, ch. 7, Thm. 7.8, p. 144.)

*Needs:* §0.1.

Use `dotProduct`, `AbsoluteValue`, `PadicAlgCl`, `padicNorm`, `spectralNorm_unique_field_norm_ext`, `irrational_sqrt_two`, `norm_image_sub_le_of_norm_deriv_le_segment_01'`; `Matrix`: `linearIndependent_rows_iff_isUnit`, `nonsing_inv_mul`; `IsAlgClosed.lift`; `PadicAlgCl.norm_extends`; `padicNormE.eq_padic_norm'`; `padicNorm.eq_zpow_of_nonzero`; `Rat`: `mulHeight_eq_max_abs_of_gcd_eq_one`, `mulHeight₁_eq_max`; `Real.infinite_rat_abs_sub_lt_one_div_den_sq_of_irrational`; `Height.mulHeight₁`.

### 2.2 Norm forms

If α₁,…,αₙ in a number field are ℚ-independent, their vectors of values under the complex embeddings are linearly independent. (E19, ch. 7, Lem. 7.10, p. 146.)

Let K=ℚ(θ) have degree d and normal closure with Galois group S_d. For ℚ-independent α₁,…,αₙ in K, the d conjugate linear forms Σσ(αᵢ)Xᵢ are in general position. (E19, ch. 7, Lem. 7.11, p. 147.)

*Needs:* §2.1.

Under the preceding full S_d hypothesis with n<d, the norm equation N_K/ℚ(Σαᵢxᵢ)=c has finitely many integer solutions for every c∈ℚ; c=0 forces x=0. (E19, ch. 7, Thm. 7.9, p. 146; E19, ch. 7, Thm. 7.9, p. 148.)

*Needs:* §2.1.

If an additive module M in a number field contains μ𝓞_L for μ≠0 and a subfield L other than ℚ or an imaginary quadratic field, then N(ξ)=N(μ) has infinitely many ξ∈M, obtained from norm-one units of L. (E19, ch. 7, Thm. 7.13, pp. 149–150; E19, ch. 7, p. 150.)

*Needs:* Mathlib’s Dirichlet unit theorem.

For a free finite-rank integer module M inside a number field, all equations N(ξ)=c with c≠0 have finitely many solutions iff M contains no μ𝓞_L as in the preceding obstruction. The criterion needs the full norm-form theorem, not only the S_d case. (E19, ch. 7, Thm. 7.13, p. 149.)

*Needs:* §2.1.

Use `Module.Basis.extend`; `Algebra`: `discr_not_zero_of_basis`, `discr_eq_det_embeddingsMatrixReindex_pow_two`, `norm_eq_prod_embeddings`, `norm_norm`; `Matrix.linearIndependent_rows_iff_isUnit`; `Polynomial.Gal.galActionHom`; `NumberField.isUnit_iff_norm`.

### 2.3 p-adic approximation and unit equations over ℚ

Let S contain ∞ and finitely many primes, with an algebraic target αₚ in each chosen completion. For κ>2 and C>0 there are finitely many ξ∈ℚ with ∏p∈S min(1,|ξ−αₚ|p)≤CH(ξ)⁻κ. (E19, ch. 8, Thm. 8.6, p. 161; E19, ch. 8, Thm. 8.7, Thm. 8.6, p. 163.)

*Needs:* §2.1.

A nonzero square-free binary form of degree n≥1 over a characteristic-zero field splits over its algebraic closure as a nonzero constant times n pairwise nonproportional linear factors, including a possible Y factor. (E19, ch. 8, Thm. 8.10, p. 165.)

*Needs:* §2.1.

For a square-free integer binary form of degree ≥3 and finitely many primes p₁,…,p_s, the primitive integer pairs with |F(x,y)|=∏pᵢ^zᵢ, zᵢ∈ℤ, form a finite set. An empty prime set gives |F|=1. (E19, ch. 8, Thm. 8.10, p. 165; E19, ch. 8, Thm. 8.10, p. 166.)

*Needs:* §2.1.

For a finitely generated Γ≤ℚ× and a,b∈ℚ×, the equation ax+by=1 has finitely many (x,y)∈Γ². (E19, ch. 8, Thm. 8.12, p. 167; E19, ch. 8, p. 167.)

Define `IsNondegenerateSolution` as follows. Define `IsNondegenerateSolution a x` by Σaᵢxᵢ=1 and Σi∈I aᵢxᵢ≠0 for every nonempty index subset I. This includes the full subset. (E19, ch. 8, §8.3, p. 168.)

Its API includes `IsNondegenerateSolution.sum_eq_one`: IsNondegenerateSolution α x→Σ_i α_ix_i=1; `IsNondegenerateSolution.subsum_ne_zero`: IsNondegenerateSolution α x→I.Nonempty→Σ_{i∈I} α_ix_i≠0; `IsNondegenerateSolution.ne_zero`: IsNondegenerateSolution α x→∀ i, α_i x_i≠0 (singleton subsums); `IsNondegenerateSolution.map`: For a ring homomorphism φ : K →+* K' that is injective on the finitely many elements Σ_{i∈I} α_ix_i, IsNondegenerateSolution α x→IsNondegenerateSolution (φ ∘ α) (φ ∘ x) (the specialisation step of ESS §3); `isNondegenerateSolution_of_subsingleton`: If ι has one element and α_i x_i=1 then IsNondegenerateSolution α x; `IsNondegenerateSolution.restrict`: If Σ_i α_i x_i=1, the subsum over I vanishes, and every nonempty subsum of the complement is nonzero, then restriction to the complement is a nondegenerate solution. Choosing I maximal among vanishing subsets ensures this condition; choosing I minimal does not.

**Checks.**

- Over ℚ with α=(1, 1), x=(1/2, 1/2) is a non-degenerate solution.
- Over ℚ with α=(1, −1, 1), x=(2, 2, 1) solves α·x=1 but is degenerate (the subsum 2 − 2=0); a definition checking only the total sum would accept it.
- With one unknown, x=α⁻¹ is the unique solution and it is non-degenerate.
- For two unknowns, (x, y) is non-degenerate iff αx + βy=1, αx≠0 and βy≠0.

Define `IsNondegenerateHomogeneousSolution` as follows. Define `IsNondegenerateHomogeneousSolution a x` by Σaᵢxᵢ=0 and nonvanishing of every proper nonempty subsum. Its projective use requires at least two terms and nonzero coefficients and coordinates. (E19, ch. 8, p. 169.)

Its API includes `IsNondegenerateHomogeneousSolution.sum_eq_zero`: Σ_i α_ix_i=0; `IsNondegenerateHomogeneousSolution.smul`: For λ≠0, IsNondegenerateHomogeneousSolution α x→IsNondegenerateHomogeneousSolution α (λ • x); `isNondegenerateHomogeneousSolution_iff_cons`: For ι=Option κ, α none=−1 and x none=1: IsNondegenerateHomogeneousSolution α x↔IsNondegenerateSolution (α ∘ some) (x ∘ some); `IsNondegenerateHomogeneousSolution.merge`: If x_p=βx_q (p≠q) and x is non-degenerate, then dropping x_p and replacing α_q by α_q + βα_p gives a non-degenerate solution with one unknown fewer (proof of Theorem 8.14); `IsNondegenerateHomogeneousSolution.ne_zero`: Each x_i with α_i≠0 is non-zero when #ι≥2.

**Checks.**

- Over ℚ, α=(1, 1, −1), x=(1, 1, 2) is non-degenerate.
- Over ℚ, α=(1, −1, 1, −1), x=(1, 1, 1, 1) solves the equation but the proper subsum 1 − 1 vanishes.
- With two unknowns and α_0,α_1≠0, every nonzero solution of α_0x_0 + α_1x_1=0 is nondegenerate, both coordinates are nonzero, and x_0/x_1=−α_1/α_0.
- x=(1, 1/2, 1/2) with α=(−1, 1, 1) is non-degenerate iff (1/2, 1/2) is a non-degenerate solution of y_1 + y_2=1.

For n≥2 and Γ≤ℚ× finitely generated, the homogeneous equation Σi=0..n aᵢxᵢ=0 with aᵢ≠0 and xᵢ∈Γ has its solutions in finitely many proper subspaces of its solution hyperplane. (E19, ch. 8, Lem. 8.15, p. 170.)

*Needs:* §2.1.

For n≥1, homogeneous unit solutions admit a finite set U′⊂ℚ× such that each solution has some ratio xᵢ/xⱼ∈U′ with i≠j. (E19, ch. 8, Lem. 8.16, pp. 170–171; E19, ch. 8, Lem. 8.16, p. 171.)

For nondegenerate homogeneous unit solutions there is a finite U containing every ratio xᵢ/xⱼ; fixing one coordinate therefore gives finitely many projective solutions. (E19, ch. 8, Thm. 8.14, p. 170; E19, ch. 8, Thm. 8.14, p. 171.)

For every n≥1, nonzero rational coefficients and a finitely generated Γ≤ℚ×, the nondegenerate solutions of Σaᵢxᵢ=1 in Γⁿ form a finite set. (E19, ch. 8, Thm. 8.14, p. 170; E19, ch. 8, §8.3, p. 169.)

Use `PerfectField.separable_iff_squarefree`; `Polynomial.nodup_roots`; `IsAlgClosed.splits_domain`; `MvPolynomial.IsHomogeneous`; `Subgroup.FG`.

### 2.4 Finite-rank multiplicative groups and recurrences

Prove `closedFormRecurrence`: for a complex recurrence E with characteristic polynomial having nonzero constant term, every solution u admits polynomials P_θ indexed by the distinct characteristic roots, with deg(P_θ)<multiplicity(θ), such that u(n)=Σ_θ P_θ(n)θ^n for all n≥0. This includes the order-zero recurrence, whose only solution is zero; a simple recurrence has constant P_θ. For (X−1)², u(n)=n is represented by P_1=X, so repeated roots cannot be treated by constant coefficients. (E19, ch. 8, §8.4, pp. 173–175; Mathlib `LinearRecurrence.charPoly`.) *Needs:* Mathlib recurrence solution space, characteristic polynomial and Jordan decomposition over ℂ.

A finitely generated algebra over an algebraically closed field of characteristic zero admits a specialisation fixing the base field and preserving nonvanishing of any specified finite set of units. This reduces the finite data of a unit equation to algebraic coefficients. (ESS02, §3, Lem. 3.1, pp. 815–816; ESS02, §3, Lem. 3.1.)

Prove `absolutePerturbedUnitEquation` (and its unperturbed restriction `exists_subspaces_unit_equation_algebraic`): let Γ≤(ℚ̄×)^n have finite rank r and n≥2. The y=xz with x∈Γ, h_aff(z)≤n⁻¹exp(−(5n)^(3n))(1+h_aff(x)) and Σyᵢ=1 lie in at most exp((5n)^(3n)(r+1)) proper subspaces. Here h_aff is the absolute affine logarithmic tuple height, log H_proj(1,x). Over a containing number field K it is Height.logHeightAff x/[K:ℚ], equivalently Height.logHeight (Fin.cons 1 x)/[K:ℚ]. ArithmeticHeights §0.5 supplies the affine tuple adapter and §0.4 its absolute field-independent extension; `absoluteLogHeightAff` realizes it on ℚ̄-tuples, and `absoluteLogHeightAff_eq` gives the containing-field formula; `absoluteLogHeightAff_nonneg` gives nonnegativity and `absoluteLogHeightAff_one` gives zero on the tuple of ones. (ESS02, §2, Thm. 2.1, p. 815, with the perturbation budget used in §11 (11.19); EF13, §1.3, p. 4.)

**Checks.**

- z=(1,…,1) has h_aff=0 and recovers the unperturbed interface.
- For rational t≠0, h_aff(t,t)=h_abs(t), so h_aff(1/3,1/3)=log 3 although the projective tuple height is zero.
- In Γ=⟨(2,1)⟩ take x_k=(2^k,1), z_k=(1/(2^k+1),1/(2^k+1)), k≥0. Then y_k=x_k z_k has sum 1 and ratio 2^k. Its perturbation has h_aff(z_k)=log(2^k+1), violating the stated budget; a projective height would wrongly accept this infinite family of distinct directions.

*Needs:* §2.8 for large solutions; the following small-height foundation and rank packing for small solutions.

**Small-height hyperplane foundation.** Build `scalarSumHeight x`=Σ_i h_abs(x_i)
on (ℚ̄×)^n and `scalarSumHeight_affine`: h_aff(x)≤h_s(x)≤n h_aff(x),
h_s(x^−1)=h_s(x) and h_s(xz)≤h_s(x)+h_s(z). For n≥2 and b_i≠0,
prove `smallHeightHyperplaneBound`: b·w=1 has at most q₀(n)=exp((4n)^(3n))
nondegenerate algebraic solutions with h_s(w)<q₀(n)^−1. Degrees and b's
height are unrestricted. (ESS02 §7 (7.4)–(7.7), §11 Proposition 11.1;
Schmidt, *Heights of points on subvarieties of G_m^n*, Theorem 4, pp.157–187.)
The Schmidt small-point argument, including its auxiliary-polynomial construction,
height bounds for intersections and torsion-coset separation, is a target here:
`smallHeightHyperplaneSeparation` constructs a finite set of at most q₀(n)
points containing this small nondegenerate locus. Use the coefficient-height
and Siegel APIs to construct separating polynomials, apply the product formula
to nonzero evaluations, and induct on intersections with the hyperplane;
positive-dimensional torus translates force a vanishing subsum and are excluded.
The quantitative degree/height bookkeeping must give the displayed q₀(n),
without a degree or discriminant term. This proof branch precedes the unit-equation
assembly and uses no unit-equation finiteness theorem. *Needs:* ArithmeticHeights
Layers 0–3,5; §1.2 auxiliary jets; Mathlib polynomial ideals, Nullstellensatz
and dimension; the small-point intersection and torsion-coset estimates just specified.

**Checks.**

- For n=1, b₁w₁=1 has the unique solution b₁^−1; the induction starts there.
- For (2,1/2), h_s=h_aff=2 log 2; for (2,2), h_s=2 log 2, h_aff=log 2 and the projective logarithmic height is zero. These fix both comparisons without identifying the heights.
- Roots of unity have scalar height zero at arbitrarily large degrees; Northcott with a degree bound cannot supply this theorem.
- Degenerate solutions such as (t,−t,1) to w₁+w₂+w₃=1 are excluded by the vanishing subsum, regardless of height.

**Rank packing and the two height regimes.** Prove `finiteRankHeightPacking`:
for a finitely generated rank-r group, the logarithms of a basis modulo torsion
give the norm ψ(u)=h_s(a^u) on ℝ^r; torsion contributes zero.
For C>0, δ₀>0, every δ₀-separated set in {ψ≤C} has cardinality at most
(1+2C/δ₀)^r. Disjoint ψ-balls of radius δ₀/2 and their volumes prove this;
positivity uses the fixed-field torsion kernel and lattice discreteness, with
no quantitative lower-height constant in the cardinal bound. Put C=4n²log n
and δ₀=1/(2q₀). Obtain at most (16n³q₀)^r centers b and, for every
x with h_aff(x)≤4n log n, a center with h_s(xb^−1)<1/(2q₀).
For the perturbation budget above, h_s(z)≤exp(−(5n)^(3n))(1+4n log n)<1/(2q₀),
so h_s(yb^−1)<q₀^−1. Apply the small-height foundation to the equation
Σ b_i w_i=1. Nondegenerate small solutions number at most q₀(16n³q₀)^r;
degenerate ones lie in at most 2^n subsum hyperplanes. (ESS02 §§7–8,
Lemma 11.2 and Corollary 11.3, pp.824–835.)

Build `unitEquationHeightAssembly`: for h_aff(x)>4n log n use the
special-point packing of ESS02 §8, the local log pattern and centered
weights of §9, then the absolute parametric theorem in §2.8. Prove the
large-solution cover bound 2^(2(n+9)^2)(8n²+2n)^(n+4+r) (ESS02 Corollary
10.2). Add it to 2^n+q₀(16n³q₀)^r and verify the sum is less than
exp((5n)^(3n)(r+1)). No S-unit enlargement occurs. (ESS02 §§8–12.)
*Needs:* `smallHeightHyperplaneBound`, `finiteRankHeightPacking`, §2.8.

**Checks.**

- For r=0 there is one center and at most q₀ nondegenerate small solutions, regardless of the torsion group's size.
- In rank one the separated-point bound is 1+2C/δ₀, the interval-length packing bound.
- The small-solution test includes h_aff(x)=4n log n; the large branch uses strict greater-than.
- exp(−(4n)^(3n))(1+4n log n) is larger than q₀^−1, so it cannot satisfy the small-error inequality used here; the specified budget with 5n does.

**Finite-data reduction and induction.** Build `finiteRankUnitEquationReduction`:
any finite solution set and its witnesses x,z are contained in one number
field and the subgroup generated by its finitely many x has rank ≤r.
Prove that the uniform finite-set cover gives a cover of the whole set:
if no t proper subspaces cover it, successive span/cover induction produces
a finite witness with that same failure. No fixed field or finite generating
set for the original group is assumed. (ESS02 §6, Lemma 6.1.)
For the nondegenerate count, translate by a to a coset, adjoin its translating
point (rank ≤r+1), apply the cover with z=1 and induct on n by eliminating
a coordinate using each extra linear relation. Divide into nonvanishing blocks
before invoking the lower-dimensional induction, retaining ranks of their
images. The §4 inequalities give exp((6n)^(3n)(r+1)). For general
characteristic-zero fields specialize finite sets, adjoining inverses of
coordinate differences and all nonzero subsums to preserve distinctness and
nondegeneracy. (ESS02 §§3–4, Lemmas 3.1–3.2 and proof of Theorem 1.1.)
*Needs:* `unitEquationHeightAssembly`, §2.3 nondegeneracy, Mathlib
Nullstellensatz and subgroup rank under homomorphisms.

**Checks.**

- A finite subset of a finite-rank group of radicals of 2 is handled inside its own finitely generated subgroup; the full group need not be finitely generated.
- At n=1 the coefficient equation has at most one solution, independently of r.
- Specialization must preserve x_i−x'_i for a distinguishing coordinate of each pair; preserving only individual nonzero coordinates does not preserve distinct solutions.

Over an algebraically closed characteristic-zero field, a multiplicative subgroup Γ≤(K×)^n of finite rank r has at most exp((6n)^(3n)(r+1)) nondegenerate solutions of Σaᵢxᵢ=1 with aᵢ≠0. (ESS02, Thm. 1.1, p. 808; ESS02, §3, Lem. 3.2.)

*Needs:* §2.4 small/large height assembly, finite-data reduction and induction below.

For a finitely generated Γ≤K× in characteristic zero, nonzero coefficients aᵢ and n≥3, all solutions of a₁x₁+⋯+aₙxₙ=0 in Γⁿ lie in finitely many proper subspaces of that hyperplane. This follows by grouping minimal vanishing subsums. (E19, ch. 8, Thm. 8.13, p. 168; E19, ch. 8, §8.3, pp. 168–169; ESS02, Abstract.)

**Checks.**

- For two terms, x₁−x₂=0 has the infinitely many solutions (2^k,2^k), k∈ℤ, in Γ=⟨2⟩. They fill the only nonzero direction of the solution hyperplane; its sole proper subspace is zero. The requirement n≥3 is necessary.
- If all coefficients vanish, the equation imposes no constraint on Γⁿ. Nonzero coefficients are necessary for the stated covering theorem.

*Needs:* §2.3.

Define `LinearRecurrence.IsNondegenerate` as follows. A linear recurrence with nonzero constant characteristic coefficient is `LinearRecurrence.IsNondegenerate` if no quotient of two distinct characteristic roots is a root of unity. Repeated roots are permitted; the simple exponential-sum application below assumes distinct roots. (E19, ch. 8, §8.4, pp. 172–173; E19, ch. 8, p. 172.)

Its API includes `LinearRecurrence.IsNondegenerate.root_ne_zero`: E.IsNondegenerate→θ∈E.charPoly.roots→θ≠0; `LinearRecurrence.IsNondegenerate.not_isOfFinOrder_div`: E.IsNondegenerate→θ, θ' distinct roots→¬ IsOfFinOrder (θ / θ'); `LinearRecurrence.isNondegenerate_iff_pow`: E.IsNondegenerate↔constant term non-zero and for distinct roots θ, θ' and every N≥1, θ^N≠θ'^N; `LinearRecurrence.IsNondegenerate.of_dvd`: If E.IsNondegenerate and E'.charPoly∣E.charPoly with E'.charPoly.coeff 0≠0, then E'.IsNondegenerate (passage to the minimal recurrence); `LinearRecurrence.isNondegenerate_of_order_le_one`: A recurrence of order≤1 with non-zero constant term is non-degenerate (at most one root).

**Checks.**

- The Fibonacci recurrence (order 2, coeffs ![1, 1]) is non-degenerate.
- The recurrence u(h + 2)=−u(h) (coeffs ![−1, 0]) is degenerate: its roots ±i have ratio −1.
- The order-1 recurrence u(h + 1)=2u(h) is non-degenerate.
- u(h + 2)=2u(h + 1) − u(h) has the double root 1 and no pair of distinct roots, so it is non-degenerate; its solutions u(h)=a + bh have at most one zero unless u=0, consistent with Skolem–Mahler–Lech.

For nonzero distinct characteristic roots with no root-of-unity quotient, a simple exponential sum u_m=Σgᵢαᵢ^m with g not identically zero has only finitely many zeros m∈ℕ. (E19, ch. 8, Thm. 8.18, p. 174; E19, ch. 8, pp. 174–175; E19, ch. 8, p. 175.)

*Needs:* `closedFormRecurrence` in §2.4.

For n≥3, distinct αᵢ≠0 and aᵢ≠0 in characteristic zero, the zero set in ℤ of Σaᵢαᵢ^m is a union of at most exp((6n)^(3n)) singletons and arithmetic progressions. If no root quotient is a root of unity, the same number bounds the finite zero set. (ESS02, Thm. 1.2, pp. 812–813; ESS02, §5, Thm. 1.2.)

*Needs:* §2.3.

Use `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`; `AlgebraicClosure`, `LinearRecurrence`, `IsOfFinOrder`; `Height.logHeight`; `Subgroup.FG`; `LinearRecurrence`: `charPoly`, `IsSolution`; `Matrix.det_vandermonde_ne_zero_iff`.

### 2.5 Absolute twisted heights and subspace weights

All twisted-height positivity, scaling, shifting and asymptotic contracts below assume Q≥1. For n≥1 define the absolute `absoluteTwistedHeight L c Q` on ℚ̄ⁿ by ∏w maxᵢ(|Lᵢw(x)|w Q^(−cᵢw)), where Q≥1, the local forms are independent and assume finitely many distinct values, and c has finite support with Σᵢcᵢv=0. Over E/K use cᵢw=d(w|v)cᵢv, d(w|v)=[E_w:K_v]/[E:K]; the value is independent of E. The typed `twistedHeight` is its K-rational restriction using the same normalized places. (EF13, §2.2, p. 9; EF13, §1.1, pp. 2–3.)

Its API includes `normAbs`: Degree-normalization adapter: normAbs v x=(TauCeti.GlobalNumberFields.normalizedAbsValue v x)^{1/[K:ℚ]}. GlobalNumberFields’s value includes complex multiplicity, but no field-degree root; its product formula and finite multiplicative support are imported; `twistedHeight`: twistedHeight L c Q x=∏ᶠ v, max_i ‖L v i ⬝ᵥ x‖_v · Q^{−c v i} for x≠0 in K^n, and 0 for x=0; `coordForms`: coordForms K n: the coordinate forms X_1, …, X_n at every place; `deltaL`: deltaL L=Δ_L=∏ᶠ v, ‖det(L_1^{(v)}, …, L_n^{(v)})‖_v (EF (2.11)); `IsTwistedData`: IsTwistedData L c bundles (2.4)–(2.9): n≥2, independence at each place, finitely many distinct forms, finite support of c, Σ_i c_{iv}=0 and Σ_v max_i c_{iv}≤1; `twistedHeight_zero`: twistedHeight L c Q 0=0 (n≥1); `twistedHeight_pos`: Under (2.5)–(2.7), x≠0→0 < twistedHeight L c Q x; `twistedHeight_smul`: Under (2.5)–(2.7), for a∈K^*: twistedHeight L c Q (a • x)=twistedHeight L c Q x (product formula); `twistedHeight_coords_zero`: If x≠0, L v i=X_i for all v, i and c=0 then twistedHeight L 0 Q x=(Height.mulHeight x)^{1/[K:ℚ]}, the absolute multiplicative height; `twistedHeight_shift`: EF Lemma 7.2(i): under (2.5)–(2.7), if d_{iv}=c_{iv} − θ_v with finitely many θ_v≠0 and Θ=Σ_v θ_v, then twistedHeight L d Q x=Q^Θ · twistedHeight L c Q x; `twistedHeight_comp`: EF Lemma 7.3(i): under (2.5)–(2.7), for an invertible K-linear φ of K^n, twistedHeight (L ∘ φ) c Q x=twistedHeight L c Q (φ x); `twistedHeight_one`: For x≠0: twistedHeight L c 1 x=∏ᶠ v, max_i ‖L v i ⬝ᵥ x‖_v (independent of c).

**Checks.**

- Over ℚ with L=coordinates, c_∞=(1/2, −1/2) and c=0 at primes: twistedHeight L c Q ![1, 0]=Q^{−1/2} for Q≥1.
- In a quadratic field, normAbs_v(2,4)=(√2,2) at a real place and (2,4) at a complex place; normAbs_v(0,1)=(0,1).
- For Q=1 the twisted height does not depend on c.
- Over ℚ with L=coordinates and c=0, the twisted height of a primitive x∈ℤ^n (cast to ℚ^n) is max_i |x_i|.
- Over ℚ with L=coordinates and c=0, twistedHeight of 2 • ![1, 0] equals that of ![1, 0] (= 1): the twisted height is projective, unlike a norm, which would double.

**Checks for the absolute extension.**

- With coordinate forms and zero weights, the algebraic vector (√2,1) has absolute twisted height √2. Computing in ℚ(√2) or ℚ(√2,i) gives the same value; the relative height in ℚ(√2) is 2.
- The zero algebraic vector has absolute twisted height 0, excluding the native projective-height junk value 1.
- For forms over ℚ and weights c_∞=(1/2,−1/2), the vector (1,0) has height Q^(−1/2) for Q≥1 after every finite field extension. Local weights must be multiplied by the extension multiplicities.

**Height of the determinant tuple.** Define `formSystemHeight L`=H_L as
NumberField.absMulHeight of the tuple det(L_j₁,…,L_jₙ), indexed by the
n-element Finsets of the finite set of all distinct forms appearing in L.
Choose an ordering only to compute each determinant. Local independence
supplies a nonzero coordinate; the tuple is therefore nonzero. Prove
`formSystemHeight_reindex`, field-extension invariance, `one_le_formSystemHeight`: 1≤H_L,
`deltaL_le_formSystemHeight`, and the compound inverse-matrix bound
H_aff^*(Â₁^−1,…,Â_s^−1)≤H_L^(R^n) under EF13 (8.1)–(8.9), including
the coordinate system at the distinguished place. Here H_aff^* appends 1 to
the whole coefficient tuple. Cramer's rule expresses those coefficients as
ratios of the determinant coordinates. For the augmented algebraic systems
of §2.8 prove `formSystemHeight_augmented_le`: H_L is at most n^(n/2) times the product of the absolute augmented row heights. The ≤RD conjugate rows each have augmented height ≤H*, and coordinate rows have height 1, giving H_L≤n^(n/2)(H*)^(DR)
after the Galois transport. This is a height of all minors, distinct from Δ_L
and from individual Euclidean form heights. (EF13 (2.11)–(2.12), Lemma 5.1
and Lemma 11.5, pp.9,23,47.) *Needs:* ArithmeticHeights tuple heights,
§0.0 Gram bound, determinants and local independence.

**Checks.**

- For the rational forms X,Y,X+Y, the three two-by-two minors are 1,1,−1, so H_L=1; the largest Euclidean row height is √2.
- Permuting these forms changes signs and enumeration but keeps H_L=1. Computing in ℚ(i) also gives 1.
- For this collection §2.8's C₂=(2H_L)^(m₂^(2m₂)) is 2^(m₂^(2m₂)), while its inverse-compound coefficient bound is 1.

The coordinate and determinant adapters have the following APIs. `coordForms_apply` identifies the i-th form with X_i, `coordForms_independent` proves independence in every dimension, and `deltaL_coords` gives Δ=1. For locally independent L with finitely many distinct forms, prove `deltaL_pos` and determinant-product invariance under a common invertible K-linear change of coordinates, by the product formula. All these are on the supplier place carrier. (EF13, §2.2, (2.4)–(2.11), pp. 8–9.)

**Checks for coordinate forms and determinant product.**

- In ℚ² the two coordinate forms evaluated at (3,4) give 3 and 4 in that order.
- In dimension zero the coordinate family is empty and each local determinant is 1; Δ=1.
- Multiplying the first coordinate form by 2 at infinity alone gives Δ=2 over ℚ.
- Multiplying that form by 2 at every place gives Δ=1, fixing the distinction between a local determinant and its adelic product.

`IsTwistedData` is a proposition bundling n≥2, local independence, finitely many form systems, finite weight support, each local sum zero, and global sum of local maximum weights at most 1. Its API extracts these six conditions and proves invariance under simultaneous permutation of forms and weights. The example adapter `cExample a` has weights (a,−a) at the unique rational infinite place and zero at finite places; `cExample′` uses a=−1. Its API gives both summand formulas, local sum zero, and total local maximum |a|. (EF13, §2.2, (2.4)–(2.9), pp. 8–9.)

**Checks for normalized data and example weights.**

- Coordinate forms with zero weights in ℚ² satisfy `IsTwistedData`.
- With a=1/2 the example weights are (1/2,−1/2), their local sum is zero and the global maximum sum is 1/2.
- With a=2 the local sums remain zero but the global maximum sum is 2, so the data fail the normalization.
- A repeated coordinate form fails local independence even with zero weights.
- The a=0 example is zero at every place; the a=−1 example reverses the signs and has maximum sum 1.

For 1≤i≤n define `absoluteSuccessiveInfimum i` as inf{λ: the ℚ̄-span of points with twisted height ≤λ has dimension ≥i}. Put λ₀=0 and let `absoluteInfimumSpace i` be the intersection of these threshold spans over λ>λᵢ. The spaces descend to K; a strict gap λᵢ<λᵢ₊₁ gives dimension i. The typed versions `rationalSuccessiveInfimum` and `rationalInfimumSpace` instead take K-rational points and K-spans. (EF13, §9, p. 35; EF13, §9, Lem. 9.1, p. 36.)

Its API includes `successiveInfimum`: rationalSuccessiveInfimum L c Q i := sInf {λ≥0 | i≤finrank K (span K {x | twistedHeight L c Q x≤λ})}; `infimumSpace`: rationalInfimumSpace L c Q i := ⨅ λ > rationalSuccessiveInfimum L c Q i, span K {x | twistedHeight L c Q x≤λ}; `successiveInfimum_mono`: For 0≤i≤j≤n, rationalSuccessiveInfimum L c Q i≤rationalSuccessiveInfimum L c Q j. The total real sInf at an out-of-range index is a junk value, so monotonicity must not be asserted beyond n; `successiveInfimum_nonneg`: 0≤rationalSuccessiveInfimum L c Q i; `finrank_infimumSpace_of_lt`: EF Lemma 9.1(ii): if λ_k(Q) < λ_{k+1}(Q) then finrank (rationalInfimumSpace L c Q k)=k; `successiveInfimum_coords_zero`: For L=coordinates and c=0, rationalSuccessiveInfimum L 0 Q i=1 for 1≤i≤n (the successive minima of the absolute height are all 1).

**Checks.**

- Over ℚ with L=coordinates and c=0, the successive infima with 1≤i≤n equal 1.
- rationalSuccessiveInfimum L c Q 0=0 (dimension≥0 holds for every λ≥0).
- Over ℚ with L=coordinates, c_∞=(1/2, −1/2): λ_1(Q)=Q^{−1/2} (attained at e_1) and λ_2(Q)=Q^{1/2} (attained at e_2).
- In the preceding two-coordinate example with Q>1, λ₂(Q)≠λ₁(Q). At Q=1 both equal1, so the strict parameter hypothesis is necessary.
- With c=0, rationalInfimumSpace 0=⊥ and rationalInfimumSpace 1=⊤ (n≥1).
- With the two-coordinate weights above and Q>1, rationalInfimumSpace 1=span{e₁}; the strict gap excludes e₂.

**Checks for absolute infima and spaces.**

- Unweighted coordinate forms give λ_i=1 for 1≤i≤n even when all algebraic points are admitted. The zeroth infimum is 0.
- For the preceding rational two-coordinate weights and Q>1, the absolute infima are Q^(−1/2),Q^(1/2); the absolute gap space is the ℚ̄-line spanned by e₁ and descends to the corresponding ℚ-line.
- At Q=1 those infima coincide and the first absolute infimum space is the whole plane, excluding a rule that always selects a coordinate line.

Use ArithmeticHeights Layers 0 and 3. Define the adapter `absoluteHeight2 x`, zero at x=0, with Euclidean norm at infinite places, max norm at finite places and degree-normalized exponents; `height2` is the K-rational restriction. For x∈ℚ̄^N≠0, N⁻¹/²H₂(x)≤H(x)≤H₂(x). Let `plucker` be the coordinate realization of Submodule.pluckerPoint by minors indexed by p-element Finsets; `subspaceHeight U` is Submodule.arakelovMulHeight U raised to 1/[K:ℚ]. Basis independence is supplied. The zero and whole subspaces have height 1; a form uses its coefficient-vector height. (EF13, §6.3, p. 29; EF13, §6.1, p. 27.)

Its API includes `height2`: height2 y := ∏ over infinite places of (Σ_i |σ_w(y_i)|²)^{mult w/(2[K:ℚ])} times ∏ᶠ over finite places of (max_i ‖y_i‖_v)^{1/[K:ℚ]}, for y : ι→K; `plucker`: plucker x : {s : Finset (Fin n) // s.card=p}→K, the p × p minors of the p × n matrix with rows x_i; `subspaceHeight`: subspaceHeight T := (Submodule.arakelovMulHeight T)^(1/[K:ℚ]); `subspaceHeight_bot`: subspaceHeight ⊥=1; `subspaceHeight_top`: subspaceHeight ⊤=1; `subspaceHeight_span_singleton`: For x≠0 and n≥2, subspaceHeight (K ∙ x)=height2 x; `subspaceHeight_le_prod`: EF (6.11): for linearly independent x_1, …, x_p spanning T, subspaceHeight T≤∏_i height2 (x_i); `subspaceHeight_orthogonal`: EF (6.13): subspaceHeight T^⊥=subspaceHeight T, where T^⊥={y | ∀ x∈T, y ⬝ᵥ x=0}; `subspaceHeight_inf_mul_sup_le`: Struppeck–Vaaler (EF (6.12)): subspaceHeight (T₁ ⊓ T₂) · subspaceHeight (T₁ ⊔ T₂)≤subspaceHeight T₁ · subspaceHeight T₂; `one_le_subspaceHeight`: 1≤subspaceHeight T; `subspaceHeight_rat_eq_covolume`: For K=ℚ and a subspace T of ℚ^n, subspaceHeight T equals the covolume of the lattice T ∩ ℤ^n in its real span (§0.0 and the native covolume).

**Checks.**

- Over ℚ, height2 ![1,1]=subspaceHeight (ℚ ∙ ![1, 1])=√2.
- height2 (0:ℚ²)=0, whereas height2 ![2,2]=√2; it is projective.
- height2 ![3,4]=5.
- plucker of the empty basis is 1; the 2×2 identity minor is 1, and swapping its rows gives −1.
- subspaceHeight ⊥=subspaceHeight ⊤=1.
- Over ℚ, the span of e_1, …, e_p in ℚ^n has subspaceHeight 1.
- Over ℚ, subspaceHeight (ℚ ∙ ![2, 2])=√2, not 2√2: the height of a subspace does not depend on the chosen (non-primitive) spanning vector.
- Over ℚ, the hyperplane {x | ![1, 2, 2] ⬝ᵥ x=0} has subspaceHeight 3=‖(1, 2, 2)‖_2 (by (6.13)).

*finite_subspaceHeight_le / Northcott for subspaces* Provides finiteness of number-field subspaces of bounded Euclidean Plücker height. Supplied by ArithmeticHeights §3.7 / Northcott for subspaces (rank-free theorem and Arakelov instance) (an open TauCetiRoadmap pull request by rwst). Our subspaceHeight is the positive [K:ℚ]-degree root of the supplier’s relative Arakelov height; negative thresholds give the empty set and ⊥,⊤ have height 1.

**Checks for the absolute Euclidean height.**

- absoluteHeight2(√2,1)=√3, whereas the maximum-norm absolute height is √2.
- absoluteHeight2(0,0)=0 and absoluteHeight2(1,1)=√2.
- Computing the height of (√2,1) in ℚ(√2) or ℚ(√2,i) gives √3 in both fields. Forgetting the complex multiplicity or the degree root changes the latter computation.

**Height and duality compatibility.** Prove `height2_eq_arakelovMulHeight` for
nonzero x∈K^N: height2 x=(NumberField.arakelovMulHeight x)^(1/[K:ℚ]).
The zero adapter is 0 whereas the supplier's projective junk value is 1.
Prove `height2_baseExtension` using the supplier's arakelovMulHeight_rpow_comp.
For a p-dimensional U, prove `subspaceHeight_sup_le` comparing its sup and Euclidean Plücker heights by
H_sup(U)≤subspaceHeight U≤binom(n,p)^(1/2)H_sup(U), with both absolute.
Prove `orthogonalBilin_eq_dualAnnihilator_comap`:
U.orthogonalBilin(dotProductBilin K K)=U.dualAnnihilator.comap(Module.piEquiv (Fin n) K K).
The supplied Arakelov duality and submodularity give the corresponding
subspaceHeight contracts by taking positive degree roots. (ArithmeticHeights
§§0.1–0.4,3.2,3.5–3.6; EF13 §6.1 (6.11)–(6.13), §6.3.)

**Checks.**

- For (√2,1) in ℚ(√2), the relative Arakelov height is 3 and height2=√3; base extension to ℚ(√2,i) gives relative height 9 and the same absolute value.
- For the zero two-tuple, height2=0 and NumberField.arakelovMulHeight=1; the nonzero bridge does not apply.
- The rational line span(1,2) has sup Plücker height 2 and Euclidean height √5; its transported annihilator is span(−2,1) and has Euclidean height √5.
- Over ℚ(i), span(1,i) is its own dot-product perpendicular. Duality still applies, without claiming a direct-sum decomposition.

For U define localWeightᵥ(U) as the minimum sum of cᵢv over form subsets restricting to a basis of U*, and w(U)=Σv localWeightᵥ(U). This is supermodular: w(U+W)+w(U∩W)≥w(U)+w(W). Among proper U the maximum w(U)/(n−dim U) has a unique optimizer of smallest dimension, `exceptionalSubspace`; prove `absoluteExceptionalSubspaceDescends` for its absolute counterpart. Semistability means this space is zero, equivalently every proper subspace has weight ≤0. (EF13, §2.4, p. 11; EF13, §15, Lem. 15.1, p. 65; EF13, §15, Lem. 15.2, p. 66.)

Its API includes `localWeight`: localWeight L c v U : ℝ, the minimum of Σ_{i∈s} c v i over s with #s=finrank U and the forms L v i (i∈s) restricted to U linearly independent (0 if U=⊥); `weight`: weight L c U := Σᶠ v, localWeight L c v U; `weightRatio`: weightRatio L c U := (weight L c U − weight L c ⊤)/(n − dim U)=−µ(K^n, U) (EF (15.6)); under (2.8) it is w(U)/(n − dim U); `exists_exceptionalSubspace`: For n≥1, independent local systems and finite support of c, there exists a proper T maximising weightRatio among proper subspaces and of minimal dimension among maximisers. Supermodularity gives uniqueness.  `exceptionalSubspace`: exceptionalSubspace L c is the unique minimum-dimensional maximiser for independent local systems with finite-support c. Use ⊥ as junk on invalid data; specifications require valid data; `weight_bot`: weight L c ⊥=0; `weight_top`: weight L c ⊤=Σᶠ v, Σ_i c v i (= 0 under (2.8)); `weight_inf_add_weight_sup`: EF Lemma 15.1: weight (U₁ ⊓ U₂) + weight (U₁ ⊔ U₂)≥weight U₁ + weight U₂; `exceptionalSubspace_ne_top`: exceptionalSubspace L c≠⊤; `exceptionalSubspace_spec`: For independent local systems and finite-support c, every proper U satisfies weightRatio U≤weightRatio T, and T has minimal dimension among maximisers. Under Σ_i c_iv=0 this is the source’s w(U)/(n−dim U) comparison; `exceptionalSubspace_eq_bot_iff`: Under (2.8): exceptionalSubspace L c=⊥↔∀ U≠⊤, weight L c U≤0 (semistability, EF (8.9)); `exceptionalSubspace_shift`: EF Lemma 7.2(iii): shifting c_{iv} by θ_v (independent of i) does not change the exceptional subspace; `exceptionalSubspace_comp`: EF Lemma 7.3(iii): exceptionalSubspace (L ∘ φ) c=(exceptionalSubspace L c).comap φ for invertible φ over K; `exceptionalSubspace_coords_sum`: EF Lemma 15.3: if every L^{(v)} consists of forms among X_1, …, X_n, X_1 + ⋯ + X_n, the exceptional subspace is cut out by equations Σ_{j∈I_i} x_j=0 for pairwise disjoint I_i.

**Checks.**

- With c=0 the exceptional subspace is ⊥.
- Over ℚ with L=coordinates, c_∞=(−1, 1) and c=0 elsewhere, the exceptional subspace is span{e_2}.
- In the same example, weight (span{![1, 1]})=−1 and weight (span{e_2})=1.
- The exceptional subspace maximises w(U)/(n − dim U), not w(U): over ℚ with n=3, L=coordinates and c_∞=(−1, 0, 1), both span{e_3} and span{e_2, e_3} have weight 1, but the ratios are 1/2 and 1, so T=span{e_2, e_3}; a definition taking a subspace of maximal weight and minimal dimension would wrongly give span{e_3}.

*Needs:* §2.1.

The weight adapters have APIs `localWeight_bot`, `localWeight_top`, `weight_bot`, `weight_top`, `weightRatio_eq_of_local_sum_zero`, and the supermodular inequality already stated. The local basis minimum exists for independent local forms; the global sum has finite support when c does. `weightRatio` uses proper U only in optimization, so its denominator n−dim U is positive. Its total value on U=⊤ is merely real division by zero and carries no optimization claim. (EF13, §15, Lem. 15.1 and (15.6), pp. 65–66.)

**Checks for local weight, global weight and ratio.**

- For rational coordinate forms and c_∞=(−1,1), the local and global weights of span(e₂) are 1, and those of span(1,1) are −1.
- The zero subspace has local and global weights zero and, for n≥1, ratio zero.
- With n=3 and c_∞=(−1,0,1), span(e₃) has weight 1 and ratio 1/2, while span(e₂,e₃) has weight 1 and ratio 1.
- If the same weights are zero at v, every local basis sum at v is zero, including for the whole space.

The intended `exceptionalSubspace` signature takes n≥1, L indexed by the supplier places, and c, and returns a K-submodule of K^n. Its valid-data contract assumes independence at each place and finite weight support. It constructs the unique minimum-dimensional proper maximizer of `weightRatio`; it does not depend on Q. The invalid-data value is ⊥. (EF13, §15, Lem. 15.2, pp. 66–68.)

Define `twistedFiltration` by the vertices of the upper convex hull of (dim U,w(U)): 0=T₀⊊⋯⊊T_r=Kⁿ with strictly decreasing segment slopes μ_l. Its penultimate term is exceptionalSubspace. The absolute filtration `absoluteTwistedFiltration` descends to this K-chain; the zero space has its one-term chain. The intended `twistedFiltration` signature returns a list of K-submodules from L and c. The strict-chain, penultimate-term and upper-hull contracts assume local independence and finite weight support, and the penultimate-term statement assumes n≥1. (EF13, §15, Lem. 15.4, p. 69; EF13, §15, Lem. 15.4, p. 70.)

Its API includes `twistedFiltration`: twistedFiltration L c : List (Submodule K (Fin n→K)), the chain T_0 ⊊ ⋯ ⊊ T_r; `twistedFiltration_head`: The first term of twistedFiltration L c is ⊥; `twistedFiltration_last`: The last term of twistedFiltration L c is ⊤; `twistedFiltration_chain`: twistedFiltration L c is a strictly increasing chain (List.Chain' (· < ·)); `twistedFiltration_penultimate`: If r≥1, the term T_{r−1} equals exceptionalSubspace L c; `twistedFiltration_vertices`: The points (finrank T_l, weight T_l) are exactly the vertices of the upper convex hull of {(finrank U, weight U)}; `twistedFiltration_slope_antitone`: The slopes µ(T_l, T_{l−1}) are strictly decreasing in l.

**Checks.**

- With c=0 and n≥1 the filtration is [⊥, ⊤]; for n=0 it is the single-term chain [⊥]=[⊤].
- Over ℚ with L=coordinates, c_∞=(−1, 1): the filtration is [⊥, span{e_2}, ⊤].
- The filtration has at most n + 1 terms.
- The filtration need not be a complete flag: with c=0 it has only the two terms ⊥ and ⊤ for every n≥2.
- For each of these rational coordinate examples, the absolute filtration is the ℚ̄-span of the displayed chain and restriction of its defining equations recovers the same chain after every finite base extension. In dimension zero it has one term; in the balanced two-coordinate case it has three.

**Adelic symmetric powers and absolute small vectors.** Build `adelicSymmetricPowerHeight`
for A∈GL_n(𝔄_K), using Euclidean norms at infinity and max norms at finite places,
normalized by [K:ℚ]. Require A to be integral invertible at almost every finite
place. Its subspace height uses the induced exterior power. The restricted
infinite product, extension invariance and local isometric reduction are part of
this target. For symmetric degree r, prove det(Sym^r A)=(det A)^binom(r+n−1,n).
Build `absoluteBinarySmallBasis`: for A∈GL₂(𝔄_K), r≥1, there are independent
algebraic y₁,y₂, each of coordinate-field degree at most r over K, with
H_A(y₁)H_A(y₂)≤2(r+1)^(1/r)C(K)^(2/r)|det A|_𝔄.
Here C(K)=|disc K|^(1/(2[K:ℚ])). Prove the fixed-field
adelic basis estimate in symmetric dimension r+1 from the shared real
Minkowski theorem and the ring-of-integers lattice. Factor the binary symmetric
forms over ℚ̄, use the local factor-height inequality, and select two independent
linear factors. The limit r→∞ removes C(K), giving product bound 2|det A|_𝔄
for infima, with arbitrarily close bases in finite extensions. (Roy–Thunder,
§§1,3–4, Lemmas 4.5,4.7–4.8, Lemma 5.2 and Proposition 5.3, pp.13–17.)
*Needs:* GlobalNumberFields's adeles and local extensions, ArithmeticHeights
Layer 4 and fixed-field lattice/height theory, Mathlib symmetric powers,
factorization and determinant API. All adelic-height and factor-selection
extensions in this paragraph are built here.

**Checks.**

- Sym^r of a diagonal two-by-two matrix has determinant (ab)^(r(r+1)/2).
- The factorization of X²−2Y² needs ℚ(√2); degree at most r refers to each selected factor's field, not a degree bound for their common compositum.
- For fixed K, (r+1)^(1/r)C(K)^(2/r) tends to 1, even when disc K≠1. Enlarging K in the fixed-field estimate alone does not give this limit.

**Absolute adelic minima and real-scale approximation.** Prove `absoluteAdelicMinima`:
for n≥2 and A as above, the ℚ̄-infima μ_i of H_A satisfy
|det A|_𝔄≤∏μ_i≤2^(n(n−1)/2)|det A|_𝔄. Prove the dual-height identity
H_A(U)=|det A|_𝔄 H_(A^−t)(U^⊥), reduce the first-minimum estimate by
induction to `absoluteBinarySmallBasis`, and modify one local norm along an
adapted flag to normalize all infima before multiplying. For every η>0 a
common finite extension contains independent x_i with H_A(x_i)≤(1+η)μ_i;
attainment at η=0 is not asserted. (Roy–Thunder, Theorem 1.1, Proposition 6.2
and Theorem 6.3, pp.17–20; ES02 §7 Proposition 7.1.)

Extend to independent local form systems with finitely many values and positive
real scales A_iv=1 outside finitely many places by `absoluteMinimaRealScales`.
Write D_A=∏_v |det L_v|_v/∏_i A_iv. Approximate each A_iv by the modulus
of a rational power of a nonunit local element; adjoin finitely many roots and
transport scales by local extension degrees. Let the multiplicative error tend
to 1. Replace Euclidean norms by sup norms, using H_sup≤H₂≤√n H_sup;
the product bounds become n^(−n/2)D_A≤∏λ_i≤2^(n(n−1)/2)D_A.
For form systems not coordinate outside a finite set, first factor out the local
max-norm of x: at almost every place every distinct coefficient matrix and its
inverse are integral, so this norm is independent of the selected matrix.
This makes the same finite adelic construction apply. Put A_iv=Q^c_iv to
obtain D_A=Δ_L Q^(−Σc_iv) and the next theorem, with no discriminant factor.
(ES02 §7 Corollary 7.2 and proof; EF13 §9 Proposition 9.2.)

**Checks.**

- Identity adelic data have D_A=1 and every infimum 1.
- Rational coordinate forms with c_∞=(1/2,−1/2) have product of infima 1 for every Q≥1, including irrational real Q.
- The approximating basis lives in a finite extension depending on η; neither an attained minimum nor a fixed field containing all approximants is required.
- A single local scale 2 changes D_A by 1/2; scaling a form globally by a rational nonzero number leaves its determinant product unchanged.

Prove `absoluteMinkowskiSecondTheorem`: for n≥2, independent local forms with finitely many values and finite weight support, let α=Σv,i cᵢv and Δ_L=∏v|det(L₁v,…,Lₙv)|v. For Q≥1, the absolute successive minima satisfy n^(−n/2)Δ_L Q^(−α)≤∏λᵢ≤2^(n(n−1)/2)Δ_L Q^(−α). This theorem concerns ℚ̄-minima; it is not the discriminant-free statement for K-rational minima. (EF13, §9, Prop. 9.2, p. 36.)

*Needs:* `absoluteAdelicMinima` and `absoluteMinimaRealScales` above. The absolute Davenport basis, gap spaces, filtration asymptotics and §2.8 compound construction consume this bound.

Prove `absoluteGapPrinciple`: assume n≥2, local independence, ≤R distinct forms with R≥n, finite weights, Σᵢcᵢv=0 and Σv maxᵢcᵢv≤1. For 0<δ≤1 and A≥n^(1/δ), a single proper K-defined subspace contains all x with twisted height ≤Δ_L^(1/n)Q⁻δ throughout A≤Q<A^(1+δ/2). (EF13, §4, Prop. 4.2, p. 16; EF13, §4, Prop. 4.2, p. 18.)

*Needs:* §0.0 Hadamard inequalities.

Assume the preceding data are semistable and admit a finite place v₀ with Lᵢv₀=Xᵢ and cᵢv₀=0. Choose ε>0 so (1+ε)^(n+1)n2^(n²)<3^(n²), and (1+ε)²λᵢ<λᵢ₊₁ at every strict gap. Given independent gᵢ with H_L,c,Q(gᵢ)≤(1+ε/2)λᵢ, there are a finite extension and a permutation π yielding hᵢ with the same successive spans, |Lᵢw(hⱼ)|w≤n^(−s(w))Q^cᵢw off v₀ and |L_π(i),w(hⱼ)|w≤(3^(n²)min(λᵢ,λⱼ))^d(w|v₀) above v₀. This is `absoluteDavenportBasis`, the adapted-basis theorem. (EF13, §11, Lem. 11.3, pp. 43–44; EF13, §11, Lem. 11.3, p. 44.)

Use `NumberField`: `InfinitePlace`, `FinitePlace`, `prod_abs_eq_one`; `NumberField.InfinitePlace.mult`; `Height.mulHeight`; `Submodule.span`; `Module`: `finrank`, `finBasis`; `Matrix.det`; `Submodule`.

### 2.6 Integer grids and hyperplanes

Let m≥2, d_h>0, 0<Θ≤1 and d_h/d_(h+1)≥2m²/Θ. For a nonzero polynomial F homogeneous of degree d_h in each binary block and nonzero algebraic pairs x_h with H₂(x_h)^d_h≥(exp(Σd_h)H₂(coeff F))^((3m²/Θ)^m), a Hasse jet of weight <mΘ is nonzero at x. The K-rational version is `sharp_roths_lemma`; weak≥is the formulation of E96 Lemma 23. (E96, §7, Lem. 23, p. 64; E95, p. 1; E96, §1, p. 2, §7.)

*Needs:* §2.5.

Let m,N≥2, r_h>0, 0<ε≤1, r_h/r_(h+1)≥2m²/ε and F≠0 be homogeneous of degree r_h in N-variable blocks. If hyperplanes T_h have H₂(T_h)^r_h≥(exp(Σr_h)H₂(coeff F))^((N−1)(3m²/ε)^m), every choice of their bases admits nonzero integer combinations x_h with coefficient bounds N/ε and a nonzero jet at x of weight ≤2mε. (EF13, §12, Prop. 12.1, p. 49; EF13, §12, p. 49; E96, §7, Lem. 24, p. 64; E96, §7, Lem. 25, p. 67, p. 294; E96, §7, Lem. 26, p. 68, pp. 295–296.)

*Needs:* §2.5.

For s∈ℕ and B>0, a=⌊B⌋ and b=⌊s/B⌋ satisfy s<(2a+1)(b+1), including s=0 and B<1. (E96, §7, Lem. 25, p. 67, p. 294.)

Over a characteristic-zero integral domain, a nonzero univariate polynomial of degree ≤s has a nonzero Hasse jet DⁱP(z) with z∈ℤ, |z|≤B and i≤s/B, for every B>0. (E96, §7, Lem. 25, p. 67, p. 294.)

**Checks.**

- Over ℚ, X(X−1)(X+1) vanishes on the entire B=1 grid, but its order-one Hasse derivative at 0 is −1. A value-only conclusion is false.
- For X³ and B=1/2, the only point is 0. Orders 0,1,2 vanish, but the order-three Hasse derivative is 1 and 3≤3/(1/2).
- Over 𝔽₂, X²−X is nonzero but vanishes at every integer image. With s=2 and B=3, the only allowed order is 0. Characteristic zero cannot be omitted.

For a commutative semiring, setting X₀=a commutes with Hasse differentiation in the remaining variables: Dᵈ(ev₀,a(D^(ke₀)P))=ev₀,a(D^(k,d)P). (E96, §7, Lem. 25, p. 67, p. 294.)

*Needs:* §1.2.

Under the characteristic-zero domain hypothesis and degreeOf₀ P≤s, choose |z|≤B and k≤s/B so Q=ev₀,z(D^(ke₀)P)≠0; every residual partial degree is at most the corresponding degree of P. (E96, §7, Lem. 25, p. 67, p. 294.)

*Needs:* §1.2.

For nonzero P over a characteristic-zero integral domain with degreeOfⱼ P≤sⱼ and Bⱼ>0, there are integer zⱼ and jet orders dⱼ with |zⱼ|≤Bⱼ, dⱼ≤sⱼ/Bⱼ and DᵈP(z)≠0. Constants and no variables are included. (E96, §7, Lem. 25, p. 67, p. 294.)

**Checks.**

- For nonzero c∈ℚ the zero-order derivative of C c in zero variables evaluates to c.
- For P=(X₀³−X₀)X₁², budgets (1,1/2) and degree bounds (3,2), z=(0,0), d=(1,2) satisfy all bounds and DᵈP(z)=−1. Every order-zero grid value is zero.

*Needs:* §1.2.

With m≥1, N≥2, d_h>0 and ε>0, define w_d(u)=Σh,l u_hl/d_h. If w_d(i)<mε, Σl e_hl=Σa k_ha and k_ha≤d_hε/N for N−1 parameters per block, then w_d(i+e)<(2−1/N)mε<2mε. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- If k∈ℕ and k≤1/2 in ℝ, then k=0.
- With m=1,N=2,d=4,ε=1/2,i=0,e=k=1, the final weight is 1/4<3/4<1.

For independent vectors b_ha in each block over a field, a chosen parameter index and B≥1, any block-homogeneous H with H(Σa z_hab_ha)≠0 and integer |z_ha|≤B admits replacements within the same bound giving nonzero block representatives and the same value. A zero block can occur only with residual block degree zero. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- For H=1 over ℚ in two blocks of length 2, replacing both zero blocks by (1,0) preserves value 1 and makes both vectors nonzero.
- For H=X_(1,0)² over ℚ at blocks (0,0) and (2,0), replacing only the first block by (1,0) preserves value 4; zero coordinates inside the nonzero vectors are allowed.

*Needs:* §1.7.

Let K have characteristic zero, m≥1, N≥2, d_h>0 and 0<ε≤1. For block-homogeneous F and independent b_h1,…,b_h,N−1, assume w_d(i)<mε and the polynomial (DⁱF)(Σa Y_hab_ha)≠0. Then integer |z_ha|≤N/ε give nonzero blocks x_h and a jet j with w_d(j)<(2−1/N)mε and DʲF(x)≠0. (E96, §7, Lem. 26, p. 68, pp. 295–296.)

**Checks.**

- For m=1,N=2,d=2,ε=1, F=X_(0,0)² and the line basis (1,0), z=1 and j=0 give a nonzero block, value 1, and weight 0<3/2.
- F=X₁ is nonzero over ℚ, but restriction to the line Y↦(Y,0) is the zero polynomial. F≠0 cannot replace the nonzero-restriction hypothesis.

*Needs:* §1.7; §1.2.

For an injective map of finite coordinate sets, extending a nonzero number-field vector by zero preserves H₂; in particular coordinate permutations preserve it. (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

**Checks.**

- H₂(0,1,2,0)=H₂(1,2) over ℚ; padding and reindexing do not change the height.

*Needs:* §2.5.

Every nonzero subvector selected by an injective coordinate map has H₂ at most that of the original vector. (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

*Needs:* §2.5.

For a nonzero number-field vector x and a≠0, H₂(ax)=H₂(x). (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

**Checks.**

- Over ℚ, H₂(2,4,4)=3 and H₂(2,−1)²=5. Scaling the normal vector does not scale the projective height.

*Needs:* §2.5.

For a,b in a number field, H₂(b,−a)=H₂(a,b). (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

**Checks.**

- H₂(0,0)=0 over ℚ. The binary swap/sign identity includes the zero vector; the large-pair theorem requires a nonzero pivot.

*Needs:* §2.5.

For N≥2 and b_p≠0, H₂(b)≤∏q≠p H₂(b_p,b_q). (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

**Checks.**

- Over ℚ, H₂(1,2,2)=3 and H₂(1,2)²=5. The product bound is strict: 3<5.
- Over ℚ, H₂(1,1,1)²=3 whereas the native relative maximum height Height.mulHeight(1,1,1)=1.

*Needs:* §2.5.

Under those hypotheses some q≠p gives a nonzero binary direction (b_q,−b_p) orthogonal to (b_p,b_q) and H₂(b)≤H₂(b_q,−b_p)^(N−1). (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

*Needs:* §2.5.

For nonzero P over a number field and a monomial Xᵃ, H₂(coeff(XᵃP))=H₂(coeff P); the coefficient vectors use their nonzero supports. (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

Writing F∈K[E⊕B] as Q∈K[B][E], every nonzero outer coefficient Q_e has H₂(coeff Q_e)≤H₂(coeff F). (E96, §1, p. 2, §7, Lem. 24, pp. 65–67, pp. 292–294.)

Over a commutative semiring, coefficient slicing in E commutes with Hasse derivatives in B: (sumAlgEquiv(D^(inr_*i)F))_e=Dⁱ((sumAlgEquiv F)_e). (E96, §7, Lem. 24, p. 66, p. 293.)

**Checks.**

- For F=U²X³, the U² coefficient after the second Hasse X derivative is 3X, not 6X.

*Needs:* §1.2.

Let Q∈R[B][E] over a commutative semiring have no supported u with |u|<|e|. Under the substitutions X_b↦x_b+Σj A_bjU_j and outer variables ↦U_j, the coefficient of U^e is Q_e(x). (E96, §7, Lem. 24, pp. 65–66, pp. 292–293.)

**Checks.**

- For F=X+U and X=U, the U coefficient after substitution is 2, whereas the original U coefficient evaluated at X=0 is 1. The selected outer degree 1 is not minimal; the hypothesis cannot be removed.

If F∈R[E⊕B] has block degrees d_h, a nonzero coefficient slice Q_e has binary block degrees d_h−s_h, where s_h=Σa e_ha≤d_h. (E96, §7, Lem. 24, pp. 66–67, pp. 293–294.)

Over an infinite field, let F≠0, Q=sumAlgEquiv(F), x and A satisfy D^(inr_*i)F(u,x+Au)=0 for all u and all i∈J. A nonzero slice Q_e of minimal supported |e| satisfies DⁱQ_e(x)=0 for every i∈J. (E96, §7, Lem. 24, pp. 65–66, pp. 292–293.)

**Checks.**

- F=U²(X−2Y+U)³ has zero U⁰ coefficient but nonzero U² coefficient (X−2Y)³. Setting U=0 would destroy the nonzero polynomial needed by the proof.
- At (X,Y)=(2,1), the second Hasse X derivative of (X−2Y)³ is 0 and the third is 1. Vanishing strictly below the index does not include the boundary.
- With no extra variables, the sole coefficient slice of X² is X². This is the N=2 case of the reduction.
- For UX−UX+U² the U coefficient is 0 and the U² coefficient is 1. The minimum is selected from the actual polynomial support after cancellation.

Over a nontrivial commutative semiring, multiplying a nonzero binary block-homogeneous polynomial of degrees δ_h by ∏h X_h,0^a_h keeps it nonzero and gives degrees δ_h+a_h. (E96, §7, Lem. 24, pp. 66–67, pp. 293–294.)

**Checks.**

- X²(X−2Y)³ has weighted index 3/5 at (2,1) with both degree weights 5. The restored polynomial is homogeneous of degree 5.

For m,N≥2, d_h>0, 0<Θ≤1, ratios ≥2m²/Θ, nonzero block-homogeneous F over a number field and nonzero hyperplane normals b_h, assume H₂(b_h)^d_h≥(exp(Σd_h)H₂(coeff F))^((N−1)(3m²/Θ)^m). Then K-rational x_h in b_h⊥ and a Hasse order i of weight <mΘ give DⁱF(x)≠0. (E96, §7, Lem. 24, pp. 64–67, pp. 291–294.)

*Needs:* §1.2.

A hyperplane T≤K^N, N≥2, has a nonzero normal b with T=b⊥ and subspaceHeight(T)=H₂(b). (E96, §7, equation (7.5), Lem. 24, p. 64, p. 291.)

*Needs:* §2.5.

With §2.6’s hyperplane-nonvanishing hypotheses, every basis of each hyperplane admits i of weight <mΘ for which the substituted derivative polynomial is nonzero. This supplies the restriction hypothesis of the grid theorem. (E96, §7, Lem. 26, p. 68, p. 295, Lem. 24.)

*Needs:* §2.5.

Use `Nat`: `lt_floor_add_one`, `le_floor_iff`, `floor_le`; `Polynomial`: `factorial_smul_hasseDeriv`, `lt_rootMultiplicity_iff_isRoot_iterate_derivative`, `count_roots`, `card_roots'`; `MvPolynomial`: `finSuccEquiv`, `natDegree_finSuccEquiv`, `finSuccEquiv_coeff_coeff`, `degreeOf_coeff_finSuccEquiv`, `degreeOf_sum_le`, `eval_polynomial_eval_finSuccEquiv`, `coeff_monomial_mul`, `coeff_monomial_mul'`, `sumAlgEquiv`, `eval₂_sum`, `eval_eval₂`, `eval_zero`, `funext`; `LinearIndependent.ne_zero`; `finProdFinEquiv`; `NumberField.FinitePlace.hasFiniteMulSupport`; `Real`: `rpow_le_rpow`, `rpow_def_of_pos`, `rpow_le_rpow_iff`; `NumberField.prod_abs_eq_one`; `Finset.prod_one_add`; `Submodule`: `exists_le_ker_of_lt_top`, `eq_of_le_of_finrank_eq`, `mem_span_range_iff_exists_fun`; `Module.Dual.finrank_ker_add_one_of_ne_zero`; `Pi.basisFun`.

### 2.7 Block homogenization and indices

Work over a commutative ring R with finite block set B, affine variable set S, a block map b:S→B, and degrees d:B→ℕ. Write t_h(e)=Σ_{b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. A polynomial is d-bounded when every supported e has t_h(e)≤d_h. Write H_d=blockHomogenize b d. The homogenizing coordinate belongs to its own block.

Define `blockHomogenize b d f`=Σe∈supp(f),∀h t_h(e)≤d_h coeff_e(f)X^A_d(e). It discards every monomial exceeding a block bound. For d-bounded f it is ordinary block homogenization without requiring localization. (E95, §1, pp. 221–222, p. 8.)

Its API includes `MvPolynomial.blockHomogenize_zero`: H_d(0)=0; `MvPolynomial.blockHomogenize_add`: H_d(f+g)=H_d(f)+H_d(g), without degree hypotheses; `MvPolynomial.blockHomogenize_smul`: H_d(c·f)=c·H_d(f) for c∈R; `MvPolynomial.blockHomogenize_map`: For a unital ring map φ:R→A, H_d(map φ f)=map φ(H_d(f)). Zero coefficients created by φ are harmless; `MvPolynomial.blockHomogenize_monomial`: H_d(cY^e)=cX^{A_d(e)} if every t_h(e)≤d_h, and 0 otherwise; `MvPolynomial.blockHomogenize_C`: H_d(c)=c∏_h X_h0^{d_h}; `MvPolynomial.blockHomogenize_one`: H_d(1)=∏_h X_h0^{d_h}; `MvPolynomial.blockHomogenize_degree_zero`: H_0(f)=coeff_0(f), as a constant polynomial; `MvPolynomial.rename_blockHomogenize_unique`: For one block and one affine variable, rename the affine coordinate to 0 and the homogenizing coordinate to 1. Through uniqueAlgEquiv⁻¹, H_n(p) equals Polynomial.homogenize p n for all p and n.

**Checks.**

- Over ℚ, in one block of degree 2, y²−y homogenizes to Y²−X₀Y.
- The zero polynomial homogenizes to zero for degree 2.
- In one block of degree 1, y²+1 homogenizes to X₀, not Y²+X₀.
- Two variables in a single block of degree 1: y₁y₂ homogenizes to 0, even though each individual exponent is at most 1.
- Two variables in separate blocks, both degree 1: y₁y₂ homogenizes to Y₁Y₂.
- At degree 0, y+3 homogenizes to the constant 3.
- One block containing no affine variables, of degree 2: the constant 1 homogenizes to X₀².
- For one affine variable and degree 3, y+1 agrees with Polynomial.homogenize after sending inr to native coordinate 0 and inl to native coordinate 1.

The coefficient at u in H_d(f) is coeff_(u|S)(f) if u(inl h)+t_h(u|S)=d_h for every h, and zero otherwise, with no bound on f. (E95, §1, pp. 221–222, p. 8.)

For d-bounded f, A_d bijects its support onto that of H_d(f), preserving coefficients. (E95, §1, pp. 221–222, p. 8.)

For d-bounded f, H_d(f)(1,Y)=f as a polynomial. (E95, §1, pp. 221–222, p. 8.)

With one block and one affine variable, renaming inl to coordinate 1 and inr to coordinate 0 identifies H_n(p) with native Polynomial.homogenize p n, including n<deg p. (E95, §1, pp. 221–222, p. 8.)

For every f, H_d(f) is weighted homogeneous of degree d_h for each block-indicator weight; discarded overdegree terms cause no exception. (E95, §1, pp. 221–222, p. 8.)

A polynomial F homogeneous of degree d_h in each block satisfies H_d(F(1,Y))=F. (E95, §1, pp. 221–222, p. 8.)

For d-bounded f and a∈R^S, H_d(f)=Σγ∈Γ_d D^γf(a)∏h X_h0^(d_h−t_h(γ))∏j(Y_j−a_jX_b(j),0)^γ_j, where Γ_d consists of the nonnegative γ with every t_h(γ)≤d_h. (E95, §1, pp. 221–222, p. 8.)

*Needs:* §1.2.

For d-bounded f, the jet D^(κ⊕β)H_d(f)(1,a) is Σγ∈Γ_d,β≤γ,t_h(γ−β)≤κ_h D^γf(a)·∏j binom(γ_j,β_j)(−a_j)^(γ_j−β_j)·∏h binom(d_h−t_h(γ),κ_h−t_h(γ−β)). Thus only affine jets with t_h(γ)≤κ_h+t_h(β) contribute; both summation restrictions are necessary. (E95, §1, pp. 221–222, p. 8.)

**Checks.**

- Over ℚ, F=Y²−X₀Y has ∂F/∂X₀(1,1)=−1 while f(1)=0. Thus the source’s printed restriction to affine order β=0 when the homogeneous order is (1,0) is false.

*Needs:* §1.2.

For d-bounded f, D^(0⊕β)H_d(f)(1,a)=D^βf(a). (E95, §1, pp. 221–222, p. 8.)

*Needs:* §1.2.

For positive d_h and d-bounded f, all homogeneous jets at (1,a) of block weight <T vanish iff all affine jets at a of the corresponding weight <T vanish, for T∈[0,∞]. (E95, §1, pp. 221–222, p. 8.)

Under those hypotheses the affine and homogeneous weighted indices agree, including f=0 where both are ∞. (E95, §1, pp. 221–222, p. 8.)

**Checks.**

- For f=y²−y at a=1 and degree 2 over ℚ, both indices equal 1/2; derivatives of weight exactly 1/2 need not vanish.
- Over 𝔽₂, D²(y²−1)(1)=1, although the ordinary second derivative is 0. Hasse derivatives are necessary for the characteristic-free statement.

*Needs:* §1.2.

For nonzero d-bounded f over a number field, H₂(coeff H_d(f))=H₂(coeff f); this uses the Euclidean coefficient height. (E95, §1, pp. 221–222, p. 8.)

*Needs:* §2.6.

Use `MvPolynomial`: `monomial`, `as_sum`, `coeff_monomial`, `aeval`, `eval₂_monomial`, `uniqueAlgEquiv`, `coeff_uniqueAlgEquiv_symm`, `rename`, `IsWeightedHomogeneous`, `isWeightedHomogeneous_X`, `isWeightedHomogeneous_C`, `coeff_mul`; `Finsupp`: `sumElim`, `equivFunOnFinite`, `instLocallyFiniteOrder`; `Polynomial`: `homogenize`, `coeff_homogenize`; `add_pow`; `MvPolynomial.IsWeightedHomogeneous`: `sub`, `mul`, `pow`, `sum`.

### 2.8 Auxiliary polynomials and quantitative subspaces

Consume ArithmeticHeights Layer 5 fixed-field Siegel/Bombieri–Vaaler, with the height2 adapter. Let K have degree D and discriminant D_K. For U<V, U>0 and U nonzero linear forms in V variables, without a row-independence assumption, there is a nonzero kernel vector x with H₂(x)≤√V |D_K|^(1/(2D))(∏H₂(Lᵢ))^(1/(V−U)). (EF13, §13, Lem. 13.1, p. 50.)

*Needs:* §2.5.

**Compound data for the gap.** Build `absoluteCompoundGapData` from EF13
(8.1)–(8.9), 1≤k<n and Q satisfying (11.8)–(11.9), using the adapted
basis of §2.5. Put p=n−k and N=binom(n,p). Index by lexicographically
ordered p-element subsets I_l and define `compoundForms` as the p-fold
exterior forms, `compoundWeights` ĉ_lv=Σ_(i∈I_l)c_iv, `compoundVectors`
ĥ_l=∧_(i∈I_l)h_i and `compoundInfimaProducts` ν_l=∏_(i∈I_l)λ_i.
The adapted permutation π induces the permutation π̂ by I_(π̂(l))=π(I_l).
These constructions commute with finite field extension. Define the
special-place `compoundSpecialWeights` by
ĉ_l,v₀(Q)=log(3^(n³)ν_(π̂⁻¹(l)))/log Q if π̂⁻¹(l)≠N, and
log(3^(n³)ν_(N−1))/log Q otherwise. Above v₀ multiply by d(w|v₀).
Here ν_l is lexicographically indexed, not sorted by size; ν_N and ν_(N−1)
are the largest and second largest products. Prove the evaluation bounds
|Ĺ_l,w(ĥ_j)|_w≤Q^ĉ_lw off v₀ and ≤Q^ĉ_lw(Q) above v₀ for j<N.
Prove Σ_l ĉ_lv=0 off v₀, max_l|ĉ_lv|≤(n−1)max_i c_iv,
Σ_(v≠v₀)max_l|ĉ_lv|≤n−1, Σ_l ĉ_l,v₀(Q)≤−δ/n and
max_l|ĉ_l,v₀(Q)|≤n. (EF13 §11 (11.10)–(11.22), Lemmas 11.3–11.5,
pp.44–47.) *Needs:* §2.5 absolute minima, adapted basis and exterior minors.

**Checks.**

- For n=3,k=1 and λ=(Q^(−1),Q^(1/2),Q^(1/2)), the two-fold products are (Q^(−1/2),Q^(−1/2),Q), with ν_(N−1)/ν_N=Q^(−3/2)=λ_k/λ_(k+1). One-fold products have last-two ratio 1.
- At v₀ the original weights vanish, but the special weights are logarithms of the modified products and need not vanish.
- The product Q^(Σ_l ĉ_l,v₀(Q))=3^(n³N)(∏λ_i)^binom(n−1,p−1)λ_k/λ_(k+1) is ≤Q^(−δ/n) under the stated threshold and gap hypotheses. For that numerical example and identity permutation, the modified sum is 81 log 3/log Q−3/2, hence ≤−1/3 for Q≥3^81. These examples test algebraic transport alone, without asserting semistability.

**Auxiliary polynomial in compound coordinates.** Prove
`exists_compound_auxiliary_polynomial` under EF13 (8.1)–(8.9), 1≤k<n,
N=binom(n,n−k), 0<ε≤1, m≥2nε⁻²log(4R/ε), positive integral r_h and
Q_h satisfying (11.8)–(11.9). There exists a specially constructed F≠0,
block-homogeneous of degrees r_h, with
H₂(coeff F)≤C_K(2^(3n)H_L^(R^n))^Σr_h,
C_K=|disc K|^(1/(2[K:ℚ])). For derivative order i expand
D^i F=Σ_(j∈U(r,i)) d^(v)_(i,j)(F) ∏_(h,l) Ĺ_l,v(X_h)^j_hl,
where `residualBlockExponents` U(r,i)={j≥0 : ∀h, Σ_l(i_hl+j_hl)=r_h}.
Define `compoundDerivativeCoeff` d^(v)_(i,j)(F) by this unique expansion.
For every i with Σ_(h,l)i_hl/r_h≤2mε and independently every j∈U(r,i),
the coefficient vanishes if
Σ_(h,l)ĉ_lv j_hl/r_h>4mnε max_a c_av off v₀, or if
Σ_(h,l)ĉ_l,v₀(Q_h)j_hl/r_h>−mδ/(nN)+4mnε at v₀.
Define `compoundCoefficientProductNorm` for the same expansion. For every derivative order i, including those outside the vanishing budget,
∏_v max_(j∈U(r,i))|d^(v)_(i,j)(F)|_v≤C_K(2^(6n)H_L^(2R^n))^Σr_h;
if the derivative is zero use coefficient norm zero. Build the weighted
support-counting inequalities of Lemmas 13.2–13.5, then apply the supplied
fixed-field Siegel bound to these coefficient constraints. (EF13 §13
(13.21)–(13.29), Proposition 13.6 and its proof, pp.50–58.)
*Needs:* §2.5, `absoluteCompoundGapData`, `formSystemHeight`, §1.2 divided
jets and the fixed-field kernel estimate above.

**Checks.**

- D^1(X³)=3X²: i=1, j=2 and i+j=3. The derivative budget tests 1; a support-weight test uses 2.
- At i=0 the residual degree is r_h, and a bad nonconstant monomial of F already has coefficient zero. For the unrestricted polynomial X³ in identity form coordinates, d_(0,3)=1, so imposing a bad-support inequality must reject that polynomial.
- If an order exceeds a block degree, U(r,i) is empty and D^i F=0; no nonzero residual coefficient is invented.

Assume n≥2, ≤R independent distinct local forms with R≥n, finite weights, local sum zero, Σv maxᵢcᵢv≤1, 0<δ≤1, semistability and a finite coordinate place v₀ of zero weights. Put m₂=⌊61n⁶2^(2n)δ⁻²log(22n²2^nR/δ)⌋, ω₂=m₂^(5/2), C₂=(2H_L)^(m₂^(2m₂)). There are C₂≤Q₁<⋯<Q_m₂ such that every Q≥1 admitting a nonzero point of twisted height ≤Q⁻δ lies in [1,C₂)∪⋃h[Q_h,Q_h^ω₂). `absoluteIntervalSemistable` has these constants; its K-rational version gives an existential threshold. (EF13, §8, Thm. 8.1, p. 34; EF13, §8, p. 34.)

*Needs:* §2.5; §2.6.

Prove `absoluteFiltrationAsymptotics`: for the absolute upper-hull filtration with d_l=dim T_l and slopes μ_l, every δ>0 admits Q₀ such that Q≥Q₀ gives Q^(−μ_l−δ)≤λᵢ(Q)≤Q^(−μ_l+δ) for d_(l−1)<i≤d_l, and absoluteInfimumSpace(d_l,Q)=T_l. The K-rational asymptotic version is a separate target with its own minima. (EF13, §16, Thm. 16.1, p. 71.)

*Needs:* §2.5.

Each filtration term satisfies H₂(T_l)≤(max_L H₂(L))^(4^n). Consequently a finite effectively enumerable set of K-subspaces depending only on the forms contains every filtration term as weights vary. (EF13, §17, Prop. 17.5, p. 81; EF13, §2.4, p. 12.)

*Needs:* §2.5.

Under the normalized data of §2.5, put m₀=⌊10⁵2^(2n)n¹⁰δ⁻²log(3δ⁻¹R)⌋, ω₀=δ⁻¹log(3R), C₀=max(H_L^(1/R),n^(1/δ)). The exceptional subspace is effectively determinable; some C₀≤Q₁<⋯<Q_m₀ give: twisted height ≤Δ_L^(1/n)Q⁻δ and x outside that space imply Q∈[1,C₀)∪⋃h[Q_h,Q_h^ω₀). Endpoints are ineffective. `absoluteIntervalResult` retains these constants; `interval_result` is its K-rational existential-threshold version. (EF13, §2.4, Thm. 2.3, p. 12; EF13, §18, p. 82.)

*Needs:* §2.5.

For the same normalized data, all small-height sets at Q≥C₀ are covered by one of at most 10⁶2^(2n)n¹⁰δ⁻³log(3δ⁻¹R)log(δ⁻¹log(3R)) proper K-defined subspaces. If all forms are coordinates or their sum, take C₀=n^(1/δ) and bound their number by 10⁶2^(2n)n¹⁰δ⁻³(log(6nδ⁻¹))². `absoluteParametricSubspaceTheorem` specifies C₀; the typed K-rational target quantifies over a threshold. (EF13, §2.3, Thm. 2.1, p. 10; EF13, §1.3, Thm. 1.1, p. 4; EF13, §4, Thm. 2.1, Thm. 2.3, p. 20.)

*Needs:* §2.5.

For a finite set S of places, system forms L and exponents d, define the light adapters `systemForms S L` (L on S, coordinates outside S) and `systemExponents S d ε` (zero outside S and n/(n+ε) times the locally centered d on S). Use n≥2 and ε>0 for the system comparisons. Their APIs give evaluation on and off S, zero local weight sums, finite support, and the height comparison transporting each solution to parameter Q=H(x)^(1+ε/n) and δ=ε/(n+ε). (EF13, §5, (5.1)–(5.2), Lem. 5.1, pp. 21–23.)

**Checks.**

- S=∅ gives zero weights and coordinate forms everywhere.
- For n=2, ε=1 and d=(−3,0) at one selected place, the new weights are (−1,1).
- If d is constant in i at every selected place, all centered weights vanish.
- With a selected infinite place carrying forms (2X₁,X₂), those forms remain there while an unselected finite place has (X₁,X₂).

Prove `absoluteAlgebraicSystemTransport`: for n≥2, 0<ε≤1 and a finite-place inequality system with nonpositive dᵢv summing to −n−ε, algebraic forms of coefficient degree ≤D, augmented coefficient height ≤H* and ≤R distinct forms, pass to a Galois coefficient field K′. At v′|v transport L by τ_v′⁻¹ and set cᵢv′=d(v′|v)n/(n+ε)(dᵢv−n⁻¹Σⱼdⱼv), with coordinate forms and zero weights elsewhere. Then δ=ε/(n+ε), Q=H(x)^(1+ε/n), R′=RD+n and every Galois conjugate of a system solution has twisted height ≤Δ_L^(1/n)Q⁻δ; H_L≤n^(n/2)(H*)^(DR). All local extensions and determinant normalizations are retained. (EF13, §5, Lem. 5.1, p. 23.)

*Needs:* §2.5; §0.0 Hadamard inequalities.

Prove `absoluteSubspaceTheoremForSystems`: for that system normalize |Lᵢv(σx)|v/|σx|v≤A_vH(x)^dᵢv for every Galois σ, where A_v=|det(L₁v,…,Lₙv)|v^(1/n). The solutions with H(x)≥C₁=max((H*)^(1/(3RD)),n^(n/ε)) lie in at most 10⁹2^(2n)n¹⁴ε⁻³log(3ε⁻¹RD)log(ε⁻¹log(3RD)) proper K-defined subspaces. (EF13, §3.3, Thm. 3.1, pp. 13–14; EF13, §5, Thm. 3.1, p. 25.)

Prove `absoluteSystemIntervalRefinement`: for the same system put m₁=⌊10⁸2^(2n)n¹⁴ε⁻²log(3ε⁻¹RD)⌋ and ω₁=3nε⁻¹log(3RD). There are an effectively determinable proper exceptional space T and C₁≤H₁<⋯<H_m₁ such that each solution lies in T or has height in [1,C₁)∪⋃h[H_h,H_h^ω₁). The exceptional space belongs to a finite collection determined by the forms, while interval endpoints remain ineffective. The projective K-points outside T are finite. (EF13, §3.3, Thm. 3.3, p. 15; EF13, §1.1, p. 2.)

*Needs:* §2.5.

For q≥1 and 1/2≤γ<1 there is a finite set D of nonnegative vectors Γ with ΣΓᵢ=γ such that every nonnegative y with Y=Σyᵢ>0 admits Γ∈D with ΓᵢY≤yᵢ for all i. No cardinality bound is asserted. (ES02, §21, Lem. 21.1, p. 97.)

Use `Int.Matrix.exists_ne_zero_int_vec_norm_le`; `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`; `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`; `NumberField`: `prod_abs_eq_one`, `finite_setOfPred_mulHeight₁_le`; `Nat`: `lt_floor_add_one`, `floor_le`.

### Examples

The coordinate twisted height of (1,0) with c∞=(1/2,−1/2) is Q^(−1/2); its two infima are Q^(−1/2),Q^(1/2). The line spanned by (1,1) has H₂=√2, invariant under rescaling. The example forms in §2.1 have determinant 4√6 in the displayed Check order and −4√6 after swapping the last two rows. A vanishing form gives infinitely many multiples, so the Subspace theorem covers subspaces rather than asserting a finite solution set.

### Dependencies

Layers 0–1; §0.0 geometric estimates; GlobalNumberFields Layer 0 and its Tau Ceti place API; Mathlib finite-dimensional algebra and algebraic closures. Build §§2.5–2.8 before the quantitative applications in §§2.1–2.4.

## Layer 3: transcendence and logarithmic forms

### 3.1 Algebraic logarithms and Hermite integrals

Define `algebraicLogs` as the ℚ-span of {λ∈ℂ:exp λ is algebraic over ℚ}; prove that its underlying set is exactly this generating set, so it is the ℚ-submodule of all algebraic logarithms. It contains every logarithm of each nonzero algebraic number, including nonprincipal branches λ+2πiℤ. Addition uses exp(λ+μ)=exp λ exp μ; rational division uses the algebraicity of roots. (W00, §1.1, Thm. 1.4, p. 3, PDF 23; E19, ch. 4, §4.3, p. 73.)

Its API includes `mem_algebraicLogs`: λ∈𝓛↔IsAlgebraic ℚ (exp λ); `mem_algebraicLogs_iff_exists_int`: λ∈𝓛↔∃ α≠0 algebraic, ∃ k : ℤ, λ=Complex.log α + k·2πi; `intCast_mul_two_pi_I_mem_algebraicLogs`: k·2πi∈𝓛 for every k : ℤ; `conj_mem_algebraicLogs`: λ∈𝓛→conj λ∈𝓛 (exp commutes with complex conjugation, conjugates of algebraic numbers are algebraic); `ofReal_log_mem_algebraicLogs`: For a positive rational q, (Real.log q : ℂ)∈𝓛.

**Checks.**

- 0∈algebraicLogs.
- π·i∈algebraicLogs, since exp(πi)=−1.
- 2πi∈algebraicLogs but 2πi ∉ Set.range Complex.log: a definition by principal logarithms only is wrong.
- ((Real.log 2 : ℝ) : ℂ)∈algebraicLogs, and it equals Complex.log 2.
- 1 ∉ algebraicLogs (consume LinearFormsInLogarithms §6.3 / transcendental_e through mem_algebraicLogs): 𝓛 is not the set of algebraic numbers.

Every finite set of algebraic complex numbers lies in a finite Galois subfield of ℂ/ℚ. (E19, ch. 4, Thm. 4.11, Thm. 4.8, p. 69; Zhao, Basic.lean, proof of linearIndependent_exp' (the splitting field K of P in ℂ).)

A nonzero algebraic integer in a finite Galois subfield L⊂ℂ has a Galois conjugate of absolute value ≥1. (E19, ch. 3, Lem. 3.6, p. 42.)

*Fundamental inequality of transcendence* Provides the number-field lower bound for a nonzero algebraic number with an integral multiple and controlled conjugates. Supplied by LinearFormsInLogarithms §§3.1–3.2 / Liouville’s inequality; Sizes (an open TauCetiRoadmap pull request by mkaratarakis). Set δ=m and a=1, use house(mx)=m·house(x), and distinguish the field degree D from the element’s minimal-polynomial degree d.

*Hermite’s theorem / Prove transcendence of exp(1)* Provides the transcendence of e used by the algebraic-logarithm examples. Supplied by LinearFormsInLogarithms §6.3 / Hermite–Lindemann; Worked examples / Complex.exp 1 (an open TauCetiRoadmap pull request by mkaratarakis). Use Complex.exp 1 over ℤ and transfer to ℚ where required; the Hermite integral machinery can remain as an alternative proof package.

Define `hermiteIntegral f z`=z∫₀¹exp(z(1−t))f(zt)dt for f∈ℂ[X]. This is the segment integral of exp(z−u)f(u) from 0 to z. (E19, ch. 4, §4.1, p. 64.)

Its API includes `hermiteIntegral_eq_sumIDeriv`: F_f(z)=e^z(sumIDeriv f)(0)−(sumIDeriv f)(z), for every f and z; `norm_hermiteIntegral_le`: If ‖f(u)‖≤C for ‖u‖≤‖z‖ then ‖F_f(z)‖≤‖z‖ e^{‖z‖} C; `hermiteIntegral_add`: F_{f+g}=F_f + F_g; `hermiteIntegral_smul`: F_{c•f}=c • F_f; `hermiteIntegral_zero_right`: F_f(0)=0; `hermiteIntegral_C`: F_{C c}(z)=c (e^z − 1).

**Checks.**

- hermiteIntegral 1 z=exp z − 1.
- hermiteIntegral X 1=exp 1 − 2.
- hermiteIntegral f 0=0.
- hermiteIntegral X 1≠∫ u in 0..1, exp u * u (= 1): the kernel is e^{z−u}, not e^u.
- hermiteIntegral f z=exp z * (z * ∫ x in 0..1, exp (−(x • z)) * f.eval (x • z)), the equivalent integral with kernel e^(−tz).

If C≥0 bounds |f(u)| on |u|≤|z|, then |hermiteIntegral f z|≤|z|exp(|z|)C. (E19, ch. 4, §4.1, Lem. 4.4, p. 65.)

For a finite exponential relation Σδⱼexp γⱼ=0, ΣδⱼhermiteIntegral f γⱼ=−ΣδⱼsumIDeriv(f)(γⱼ). (E19, ch. 4, §4.1, Corollary 4.3, p. 64; E19, ch. 4, §4.2, Lem. 4.12(i)–(ii), p. 71.)

Use `IsAlgebraic`, `Transcendental`; `Complex`: `exp_nat_mul`, `exp_int_mul`, `exp_log`, `exp_eq_exp_iff_exists_int`, `exp_add`, `norm_exp`; `IsAlgebraic`: `mul`, `of_pow`, `inv_iff`; `IntermediateField.adjoin_rootSet_isSplittingField`; `IsGalois.of_separable_splitting_field`; `minpoly.irreducible`; `NumberField`: `exists_conjugate_one_le_norm`, `norm_norm_le_norm_mul_house_pow`, `house`, `house_nat_mul`; `AlgHom`: `restrictNormal'`, `restrictNormal_commutes`; `Algebra`: `isIntegral_norm`, `norm_ne_zero_iff`; `IsIntegrallyClosed.algebraMap_eq_of_integral`; `LindemannWeierstrass.exp_polynomial_approx`; `intervalIntegral.integral_eq_sub_of_hasDerivAt`; `Polynomial.sumIDeriv_eq_self_add`; `Polynomial`: `exists_eq_pow_rootMultiplicity_mul_and_not_dvd`, `sumIDeriv`; `FloorSemiring.tendsto_pow_div_factorial_atTop`; `Nat.exists_infinite_primes`; `intervalIntegral.norm_integral_le_of_norm_le_const`.

### 3.2 Formal exponential sums and Lindemann–Weierstrass

For an intermediate field L⊂ℂ define `expEval L`:L[L]→ₐ[L]ℂ by Σδ_γ[γ]↦Σδ_γexp γ, where L[L]=AddMonoidAlgebra L L and [γ][γ′]=[γ+γ′]. It is the algebra lift of the exponential character. (E19, ch. 4, §4.2, p. 69; Zhao, Basic.lean, proof of algebraicIndependent_exp.)

Its API includes `expEval_single`: expEval L (single γ c)=c * exp γ; `expEval_apply`: expEval L x=Σ_{γ∈x.coeff.support} x.coeff γ * exp γ; `expEval_mul`: expEval L (x * y)=expEval L x * expEval L y; `expEval_algebraMap`: expEval L (algebraMap L L[L] c)=c.

**Checks.**

- expEval L (single 0 c)=c.
- expEval L (single γ 1 * single γ' 1)=exp γ * exp γ'=exp (γ + γ').
- expEval ⊤ (single (π I) 1)=−1.
- For L=⊤: single 0 1 − single (2π I) 1≠0 but its image is 0; injectivity of expEval (the Lindemann-Weierstrass theorem) needs L⊆ℚ̄.
- expEval L=AddMonoidAlgebra.lift L ℂ L (expMonoidHom.comp (inclusion as a Multiplicative hom)).

Define `galConj τ` on L[L] by Σδ_γ[γ]↦Στ(δ_γ)[τ(γ)] for τ∈Gal(L/ℚ). It is a ring automorphism acting simultaneously on coefficients and exponents; fixedness means that τ permutes the supported coefficient–exponent pairs. (E19, ch. 4, §4.2, Thm. 4.11, p. 68.)

Its API includes `galConj_single`: galConj τ (single γ δ)=single (τ γ) (τ δ); `coeff_galConj`: (galConj τ x).coeff (τ γ)=τ (x.coeff γ); `galConj_refl`: galConj (AlgEquiv.refl)=RingEquiv.refl; `galConj_trans`: galConj (τ.trans σ)=(galConj τ).trans (galConj σ); `support_galConj`: (galConj τ x).coeff.support=(x.coeff.support).map τ; `forall_galConj_eq_iff`: (∀ τ, galConj τ x=x)↔∀ τ γ, x.coeff (τ γ)=τ (x.coeff γ); `galConj_prod_galConj`: For finite L/ℚ: galConj σ (∏_τ galConj τ x)=∏_τ galConj τ x (reindex τ ↦ τ.trans σ).

**Checks.**

- galConj τ (single 0 (q : L))=single 0 (q : L) for q∈ℚ.
- If I∈L and τ I=−I then galConj τ (single I I)=single (−I) (−I).
- If [L : ℚ]=2, s∈L and τ s=−s for the nontrivial τ, then single s 1 + single (−s) 1 is fixed by every galConj τ.
- If √2∈L and τ √2=−√2 then expEval L (galConj τ (single √2 1))=e^{−√2}≠e^{√2}=expEval L (single √2 1): evaluation is not Galois-equivariant.

For finite S⊂L, t=|S| and l,p∈ℕ, define `auxPoly S l p γ`=(l^(tp)/(p−1)!)·(X−γ)^(p−1)∏γ′∈S,γ′≠γ(X−γ′)^p. If γ∈S, l≠0 and p≥1, its degree is tp−1. (E19, ch. 4, §4.2, Thm. 4.11, p. 70.)

Its API includes `natDegree_auxPoly`: γ∈S, l≠0, 1≤p ⇒ natDegree (auxPoly S l p γ)=S.card * p − 1; `auxPoly_map`: (auxPoly S l p γ).map τ=auxPoly (S.map τ) l p (τ γ) for τ : L ≃ₐ[ℚ] L; `eval_iterate_derivative_auxPoly`: Values of the derivatives at the points of S.

**Checks.**

- auxPoly {γ} l p γ=C (l^p/(p−1)!) * (X − C γ)^(p−1).
- For L=⊥, S={0,1,…,n}, l=1, γ=0: auxPoly S 1 p 0=C (1/(p−1)!) * X^(p−1) * ∏_{a=1}^n (X − C a)^p (Evertse (4.3)).
- auxPoly {0, 1} 1 2 0=X^3 − 2X^2 + X.
- auxPoly {0} 1 3 0=C (1/2) * X^2: the coefficients are not algebraic integers, so the factor 1/(p−1)! must be tracked (Lemma 4.13(iii) divides by (p−1)!, not by p!).

For x=Σδ_γ[γ] with support S define `auxValue x l p γ`=−Σγ′∈S δ_γ′sumIDeriv(auxPoly S l p γ)(γ′). Its algebraic value lies in L. (E19, ch. 4, §4.2, Thm. 4.11, p. 71; E19, ch. 4, §4.2, Lem. 4.12(i)–(ii), p. 71.)

Its API includes `coe_auxValue_eq_sum_hermiteIntegral`: Analytic expression when expEval x=0; `auxValue_galConj`: τ (auxValue x l p γ)=auxValue x l p (τ γ) for Galois-fixed x; `isIntegral_auxValue`: integrality; `auxValue_ne_zero`: nonvanishing for large primes p; `norm_auxValue_le`: the bound C c^p/(p−1)!.

**Checks.**

- auxValue (single 0 1) l p 0=−l^p for p≥1.
- auxValue 0 l p γ=0.
- auxValue (single 0 1) 2 p 0=−2^p≠−1=auxValue (single 0 1) 1 p 0 for p≥1: M depends on the auxiliary integer l and is not an invariant of x.
- If expEval L x=0 then (auxValue x l p γ : ℂ)=Σ_{γ'} (x.coeff γ' : ℂ) * hermiteIntegral ((auxPoly S l p γ).map (algebraMap L ℂ)) γ' (Lemma 4.12(i)).

If expEval L x=0, the complex image of auxValue equals Σγ′∈supp x δ_γ′hermiteIntegral(auxPoly S l p γ) γ′, for all l,p,γ. (E19, ch. 4, §4.2, Lem. 4.12(i)–(ii), p. 71.)

*Needs:* §3.1.

If x is fixed by every galConj, then τ(auxValue x l p γ)=auxValue x l p (τγ); for γ∈supp x, τγ is in the same support. (E19, ch. 4, §4.2, Lem. 4.12(i)–(ii), p. 71.)

For a number field L⊂ℂ, γ∈S, l≥1 with lγ′ integral for all γ′∈S, and prime p, put A_γ=l^t∏γ′≠γ(γ−γ′). This is integral and f^(p−1)(γ)=A_γ^p for f=auxPoly S l p γ. All other derivatives f^(j)(γ′), j≤p−1, vanish; for j≥p, f^(j)(γ′)/p is integral. (E19, ch. 4, §4.2, Lem. 4.13, p. 72.)

If every coefficient of x is integral, γ∈supp x and l clears its exponents, then every prime p>|N(δ_γ)N(A_γ)| makes auxValue x l p γ an integral nonzero element. (E19, ch. 4, §4.2, Lem. 4.14, p. 72.)

For expEval L x=0 and l≥1 there are C,c>0 with |auxValue x l p γ|≤Cc^p/(p−1)! for every p≥1 and supported γ. These finitely many values are eventually all <1. (E19, ch. 4, §4.2, Lem. 4.15, Exercise 4.3, pp. 72-73.)

*Needs:* §3.1.

For L/ℚ finite Galois, a nonzero x∈L[L] fixed by every galConj has expEval L x≠0. (E19, ch. 4, §4.2, Thm. 4.11, p. 68; E19, ch. 4, §4.2, Thm. 4.11, p. 71.)

*Needs:* §3.1.

For every injective family of algebraic exponents u, the family exp(uᵢ) is linearly independent over ℚ̄. (E19, ch. 4, §4.2, Thm. 4.8, p. 67; E19, ch. 4, §4.2, Thm. 4.11, Thm. 4.8, pp. 69-70; Zhao, Basic.lean, theorem linearIndependent_exp.)

*Needs:* §3.1.

*Hermite–Lindemann (E19 Corollary 4.9(i))* Provides transcendence of the exponential of a nonzero algebraic number. Supplied by LinearFormsInLogarithms §6.3 / Hermite–Lindemann (an open TauCetiRoadmap pull request by mkaratarakis). Use algebraicity and transcendence over ℤ; convert to ℚ only at consumer boundaries.

*Lindemann (E19 Corollary 4.9(ii)) / Prove transcendence of π* Provides transcendence of π for the downstream algebraic-independence consumers. Supplied by LinearFormsInLogarithms §6.3 / Hermite–Lindemann; Worked examples / Real.pi (an open TauCetiRoadmap pull request by mkaratarakis). The supplier endpoint is Real.pi over ℤ; complex casts and transcendence over ℚ are consumer conversions.

If algebraic uᵢ are ℚ-linearly independent, exp(uᵢ) are algebraically independent over ℚ̄. The semiring signature uses the equivalent LinearIndependent ℕ condition. (E19, ch. 4, §4.2, Corollary 4.10, p. 67; Zhao, Basic.lean, theorem algebraicIndependent_exp.)

*Every λ∈algebraicLogs with λ≠0 is transcendental* Provides transcendence of every nonzero logarithm with algebraic exponential. Supplied by LinearFormsInLogarithms §6.3 / Hermite–Lindemann (an open TauCetiRoadmap pull request by mkaratarakis). Use the branch-free `transcendental_of_isAlgebraic_exp` and `mem_algebraicLogs`; principal `transcendental_log` alone would omit nonzero logarithms of 1.

*Needs:* §3.1.

Use `AddMonoidAlgebra`: `lift`, `lift_single`; `Complex`: `expMonoidHom`, `exp_pi_mul_I`, `isIntegral_I`; `MonoidAlgebra`: `mapDomainRingEquiv`, `mapRingEquiv`; `Polynomial`: `sumIDeriv`, `sumIDeriv_map`, `eval_map`, `aeval_iterate_derivative_self`, `aeval_iterate_derivative_of_lt`, `exists_iterate_derivative_eq_factorial_smul`; `Algebra`: `norm`, `norm_algebraMap`, `isIntegral_norm`, `norm_ne_zero_iff`; `IsIntegrallyClosed.algebraMap_eq_of_integral`; `FloorSemiring.tendsto_pow_div_factorial_atTop`; `Algebra.IsAlgebraic.exists_integral_multiples`; `Nat.exists_infinite_primes`; `TwoUniqueProds.toUniqueProds`; `linearIndependent_iff'`, `isAlgebraic_iff_isIntegral`, `irrational_pi`, `algebraicIndependent_iff`; `IsAlgebraic.restrictScalars`; `Real.pi_ne_zero`.

### 3.3 One-variable zero estimates and Gelfond–Schneider

For Schneider’s construction fix a number field K⊂ℂ of degree d, λ∈ℂ and β∈K with α=exp λ and γ=exp(βλ) in K. Constants depend only on K,λ,β. For Gelfond’s construction additionally assume λ≠0 and β∉ℚ, write h=[K:ℚ], m=2h+2 and choose an integer c₀≥1 with c₀α,c₀β,c₀γ integral. For positive n,q with q²=2mn set R_η(z)=Σa,b=1..q η_ab exp((a+bβ)λz); its constants depend only on K,λ,β,c₀. These fixed-data conventions apply to the respective estimates below.

For differentiable f:ℝ→ℝ and a finite nonempty set S of zeros, f′ has a set of |S|−1 zeros separating consecutive elements of S. (E19, ch. 4, §4.4, Exercise 4.5, p. 79.)

For r≥1, distinct real γₖ and nonzero pₖ∈ℝ[X], every finite zero set of Σpₖ(x)exp(γₖx) has size ≤Σ(1+deg pₖ)−1. (E19, ch. 4, §4.4, Lem. 4.23, p. 79.)

An entire function with vanishing derivatives of orders <kᵢ at distinct aᵢ factors as f(z)=g(z)∏(z−aᵢ)^kᵢ with entire g. (E19, ch. 4, §4.4, Lem. 4.24, p. 80; KW26, §3, p. 10.)

Under those multiplicity hypotheses, |aᵢ|≤R, R>0, T≥3R and |f(w)|≤M on |w|=T imply |f(z)|≤M(3R/T)^Σkᵢ on |z|≤R. (E19, ch. 4, §4.4, Lem. 4.26, p. 80; W00, §2.2, Lem. 2.4, p. 37, PDF 57.)

There is c_1 > 0 such that for all integers L≥3 and D_1, D_2≥1 with D_1D_2≥2dL² there are a_{ij}∈𝓞_K (0≤i < D_1, 0≤j < D_2), not all zero, with house(a_{ij})≤exp(c_1(D_1 log L + D_2L)), such that F(z) := Σ_{i,j} a_{ij} z^i e^{jlz} vanishes at z=a + bβ for all a, b∈{1, …, L}. For integers a, b≥0, F(a + bβ) is the image of y_{ab} := Σ_{i,j} a_{ij}(a + bβ)^i α^{aj}γ^{bj}∈K. (E19, ch. 4, §4.4, Lem. 4.22, p. 77.)

Assume β ∉ ℚ. Parameters: M≥1 an integer, L := 2dM², D_1 := (2d)²M³, D_2 := 2dM (so D_1=√(2d)L^{3/2}, D_2=√(2d)L^{1/2}, D_1D_2=2dL²), c := 1 + ⌊√(2d)⌋, and F, a_{ij}, y_{ab} as in Lemma 4.22 for these parameters. There is c_4 such that |F(a + bβ)|≤exp(c_4L^{3/2} log L − L²) for all integers 1≤a, b≤cL. (E19, ch. 4, §4.4, Lem. 4.27, pp. 80–81.)

Parameters: M≥1 an integer, L := 2dM², D_1 := (2d)²M³, D_2 := 2dM (so D_1=√(2d)L^{3/2}, D_2=√(2d)L^{1/2}, D_1D_2=2dL²), c := 1 + ⌊√(2d)⌋, and F, a_{ij}, y_{ab} as in Lemma 4.22 for these parameters. There is c_5 such that for every field embedding σ : K→ℂ and all integers 1≤a, b≤cL: |σ(y_{ab})|≤exp(c_5L^{3/2} log L); hence house(y_{ab})≤exp(c_5L^{3/2} log L). (E19, ch. 4, §4.4, Lem. 4.27(ii), pp. 80–81.)

Parameters: M≥1 an integer, L := 2dM², D_1 := (2d)²M³, D_2 := 2dM (so D_1=√(2d)L^{3/2}, D_2=√(2d)L^{1/2}, D_1D_2=2dL²), c := 1 + ⌊√(2d)⌋, and F, a_{ij}, y_{ab} as in Lemma 4.22 for these parameters. Let m≥1 be an integer with mα, mβ, mγ integral. Then m^{D_1+2cLD_2}·y_{ab} is integral over ℤ for all integers 1≤a, b≤cL, and m^{D_1+2cLD_2}≤exp(c_6L^{3/2}). (E19, ch. 4, §4.4, Lem. 4.27, pp. 80–81.)

Let α, β be real algebraic numbers with α > 0, α≠1 and β ∉ ℚ. Then α^β=e^{β log α} (Real.rpow, log the real logarithm) is transcendental. (E19, ch. 4, §4.4, Thm. 4.21, p. 76; E19, ch. 4, §4.4, Thm. 4.21, p. 82.)

*Needs:* §3.1.

For all k, t∈ℕ: R_η^{(k)}(t)=l^k · Σ_{a,b} η_{ab}(a + bβ)^k α^{at}γ^{bt}. (KW26, §3, p. 7; Soundararajan–Petrow, p. 11.)

There is c_1≥1 such that for all positive integers n, q with q²=2mn there is η∈𝓞_K^{q×q}, η≠0, with house(η_{ab})≤c_1^n n^{(n+1)/2} for all a, b, and R_η^{(k)}(t)=0 for all 0≤k < n and t∈{1, …, m}. (KW26, §3, pp. 6-7; Soundararajan–Petrow, p. 14.)

Let ρ_1, …, ρ_N∈ℂ be pairwise distinct and c∈ℂ^N, c≠0. Then the entire function E(z) := Σ_i c_i e^{ρ_i z} is not identically zero; consequently its order of vanishing analyticOrderAt E z_0 is finite at every z_0∈ℂ. (KW26, §3, p. 8.)

Let η≠0 be as in Gelfond's auxiliary function: vanishing to order n at 1, …, m (Siegel's lemma over 𝓞_K). Then there are r≥n and t_0∈{1, …, m} with R_η^{(k)}(t)=0 for all k < r and all t∈{1, …, m}, and R_η^{(r)}(t_0)≠0. (KW26, §3, pp. 7-8.)

There is c_2≥1 such that, for n, q, η, r, t_0 satisfying the preceding auxiliary-function and first-nonvanishing-derivative hypotheses, the number ρ := Σ_{a,b} η_{ab}(a + bβ)^r α^{at_0}γ^{bt_0}∈K is nonzero and |ρ|≥c_2^{−r} r^{−(h−1)(r+1)}. (KW26, §3, p. 9; Soundararajan–Petrow, p. 15.)

*Needs:* §3.1.

There is c_3≥1 such that, for n, q, η, r, t_0 satisfying the preceding auxiliary-function and first-nonvanishing-derivative hypotheses and ρ the preceding algebraic derivative value: |ρ|=|l|^{−r}|R_η^{(r)}(t_0)|≤c_3^r r^{((3−m)r+1)/2}. (KW26, §3, pp. 9-12; Soundararajan–Petrow, pp. 14-15.)

*Gelfond–Schneider theorem for any nonzero logarithm* Provides Gelfond–Schneider transcendence for an arbitrary nonzero logarithm. Supplied by LinearFormsInLogarithms §6.4 / Gelfond–Schneider (an open TauCetiRoadmap pull request by mkaratarakis). Translate λ∈algebraicLogs using `mem_algebraicLogs`; λ≠0 allows exp λ=1, and irrationality is exclusion of all rational casts.

*Needs:* §3.1.

*Gelfond–Schneider for Complex.cpow / Karatarakis–Wiedijk statement* Provides transcendence of an algebraic base to an algebraic irrational exponent in the principal branch. Supplied by LinearFormsInLogarithms §6.4 / Gelfond–Schneider (principal branch) (an open TauCetiRoadmap pull request by mkaratarakis). Preserve α≠0, α≠1 and the integer-quotient irrationality convention; the supplier theorem lives in `GelfondSchneider`.

If α is algebraic and α ∉ ℚ·i then e^{πα} is transcendental. In particular e^π is transcendental. (E19, ch. 4, §4.3, Corollary 4.17, p. 73.) LinearFormsInLogarithms §6.4 and Worked examples / transcendental_exp_pi (an open TauCetiRoadmap pull request by mkaratarakis), states the α=1 real special case; reconcile it through the complex/real exponential comparison.

*Needs:* §3.1.

If λ_1, λ_2∈𝓛 are linearly independent over ℚ, they are linearly independent over ℚ̄: for β_1, β_2 algebraic, not both 0, β_1λ_1 + β_2λ_2≠0. (DALAG Theorem 1.4.) (E19, ch. 4, §4.3, Corollary 4.18, p. 73; W00, §1.1, Thm. 1.4, p. 3, PDF 23.)

*Needs:* §3.1.

Use `exists_deriv_eq_zero`, `sub_smul_dslope`, `analyticOrderAt_mul`, `natCast_le_analyticOrderAt_iff_iteratedDeriv_eq_zero`, `iteratedDeriv_cexp_const_mul`, `linearIndependent_monoidHom`, `analyticOrderAt_eq_top`, `analyticOrderAt_eq_nat_iff_iteratedDeriv_eq_zero`, `iteratedDeriv_mul`; `Polynomial`: `card_roots'`, `natDegree_derivative_lt`; `Real`: `exp_ne_zero`, `rpow_def_of_pos`; `Complex`: `differentiableOn_dslope`, `norm_le_of_forall_mem_frontier_norm_le`, `exp_nat_mul`, `exp_add`, `norm_exp`, `cpow_def_of_ne_zero`, `exp_log`, `exp_pi_mul_I`; `NumberField.house.exists_ne_zero_int_vec_house_le`; `Algebra.IsAlgebraic.exists_integral_multiples`; `NumberField`: `house_mul_le`, `house_add_le`, `house_pow_le`, `norm_embedding_le_house`, NumberField.house_eq_sup'; `IsIntegral`: `mul`, `add`; `AnalyticOnNhd.eqOn_zero_of_preconnected_of_frequently_eq_zero`; `Differentiable.analyticAt`.

### 3.4 Several-variable differential calculus

For z∈ℂⁿ use |z|=maxᵢ|zᵢ| and ‖z‖₁=Σᵢ|zᵢ|; for a multi-index use |σ|=maxᵢσᵢ, ‖σ‖₁=Σᵢσᵢ and σ!=∏ᵢσᵢ!. For entire f, |f|_R is the supremum on the closed polydisc of sup radius R. Each derivative bound below uses this sup radius, while total derivative orders use ‖σ‖₁.

Define `Baker.mDeriv σ f` by iterating ∂ᵢf(z)=fderiv ℂ f z(eᵢ), σᵢ times in increasing coordinate order. For entire f these derivatives commute. It is ordinary, not factorial-divided, differentiation. (W00, PDF 12-13.)

Its API includes `mDeriv_zero`: D^0 f=f; `mDeriv_add_single`: For entire f: D^{σ + e_i} f=∂_i (D^σ f); `mDeriv_add`: D^σ (f + g)=D^σ f + D^σ g for entire f, g; `differentiable_mDeriv`: D^σ f is entire when f is; `mDeriv_exp_dotProduct`: D^σ (z ↦ e^{w·z})=w^σ e^{w·z}; `mDeriv_monomial_mul_exp`: The Leibniz expansion of D^σ(z^τ e^{w·z}).

**Checks.**

- mDeriv 0 f=f.
- For f(z)=z_0 z_1 on ℂ^2: mDeriv (Pi.single 0 1) f=fun z ↦ z 1.
- For n=1 and entire g : ℂ→ℂ: mDeriv (fun _ ↦ k) (fun z ↦ g (z 0))=fun z ↦ iteratedDeriv k g (z 0).
- For f(z)=z_0^2 on ℂ^2, mDeriv ![1, 1] f=0 while iteratedFDeriv ℂ 2 f z ![e_0, e_0]=2: D^σ is a mixed partial of multi-order σ, not the total derivative of order ‖σ‖ along one direction.

**Ordinary and divided analytic derivatives.** Prove `Baker.mDeriv_eq_factorial_mul_mvTaylorCoeff`
for f analytic at z:
Baker.mDeriv σ f z=(∏_i σ_i!)·mvTaylorCoeff f z σ, with the coefficient taken from the provider named in the ownership table.
Use the analytic coefficient interface from LinearFormsInLogarithms Layer 0,
then transfer its Cauchy and Cartesian Schwarz estimates by this equality.
The coordinate quotient and remainder constructions below consume the same engine. The qualitative
Schneider–Lang and Baker proof packages in §3.5 consume the supplier's
Layers 5–7; their ordinary-derivative presentations use this bridge.
(W00 §4.3, pp.122–126; LinearFormsInLogarithms §§0.4,1.2,1.6,5.7,7.1.)

**Checks.**

- For f(z)=z₀²z₁³, σ=(2,3) at zero, the Taylor coefficient is 1 and the ordinary derivative is 2!3!=12.
- At σ=0 the bridge gives f(z), with factorial product 1.
- For the logarithms log 2,log 3, rational independence follows from unique prime factorization; the supplied qualitative Baker theorem makes log 2+√2 log 3 transcendental. The algebraic coefficient and independence hypotheses are both used.

*Let f : ℂ^n→ℂ be entire, k…* Provides the analytic coordinate quotient across z_k=ζ. Supplied by LinearFormsInLogarithms §0.5 / Division by a coordinate (an open TauCetiRoadmap pull request by mkaratarakis). Identify our integral quotient with the supplier’s dslope by the fundamental theorem of calculus; our entire scalar setting specializes its local analytic, normed-field and value-space setting.

**Integral representation and coordinate degree control.** For f : ℂⁿ→ℂ entire, k∈{1,…,n} and ζ∈ℂ, put f₀(z)=f(z with zₖ replaced by ζ) and identify the supplied quotient g with ∫₀¹(∂ₖf)(z with zₖ replaced by ζ+t(zₖ−ζ))dt; then f=f₀+(zₖ−ζ)g. For 0≤|ζ|≤r<R prove |f₀|_R≤|f|_R and |g|_R≤2|f|_R/(R−r). If f has degree≤e in zⱼ, so do f₀ and g, and g has degree≤e−1 for j=k. Analyticity is consumed from LinearFormsInLogarithms §0.5 / `analyticAt_dslope_update`. (W00 §4.3, Lemma 4.8, p.125, PDF145.)

Let P∈ℂ[X] be monic of degree p with all roots in the disc |ζ|≤r, let 0 < 5r≤R, k∈{1, …, n}, and f entire on ℂ^n. There are unique entire f_0, f_k with f=f_0 + f_k·P(z_k) and f_0 a polynomial in z_k of degree < p. Moreover |f_0|_R≤3^p|f|_R and |f_k|_R≤(3/R)^p|f|_R; if f is a polynomial of degree≤e in z_j (j≠k) so are f_0 and f_k. Finally, if (∂_k)^κ f vanishes on {z_k=ζ} for every root ζ of P and every κ < m_P(ζ) (the multiplicity), then f_0=0, i.e. f=f_k·P(z_k). (W00, §4.3, Lem. 4.8, pp. 123-126, PDF 143-146.)

Let P_1, …, P_n∈ℂ[X] be monic of degrees p_i with all roots in |ζ|≤r, 0 < 5r≤R, p := max p_i, E_i := P_i^{−1}(0). For every entire f on ℂ^n there are entire f_0, f_1, …, f_n with f=f_0 + Σ_i f_i·P_i(z_i), f_0 a polynomial of degree < p_j in each z_j, f_i a polynomial of degree < p_j in z_j for j > i, and |f_i|_R≤9^{np}R^{−p_i}|f|_R for i=0, 1, …, n (p_0 := 0). If D^κ f(ζ)=0 for all ζ∈E_1 × ⋯ × E_n and all κ∈ℕ^n with κ_i < m_{P_i}(ζ_i) for every i, then f_0=0. (W00, §4.3, Lem. 4.8, pp. 123, PDF 143.)

*Schwarz theorem for Cartesian products (W00 Proposition 4.7)* Provides decay on a Cartesian grid from vanishing of all coordinate orders below S₀. Supplied by LinearFormsInLogarithms §1.6 / Schwarz’s lemma for Cartesian products (an open TauCetiRoadmap pull request by mkaratarakis). For n≥1 and p=S₀S₁≥1, n(5·3^n)^p≤(18^n)^p converts the provider bound; p=0 uses the original bound and n=0 needs a separate adapter.

**Degenerate Cartesian cases.** For S₀S₁=0 retain the original closed-polydisc bound; for n=0 use the singleton ambient space directly. These cases are consumer adapters for the `Baker.mDeriv` presentation in §3.5, outside the supplier’s nonempty-coordinate hypothesis.

Let x_1, …, x_{d_1} and y_1, …, y_{ℓ_1} be in ℂ^n; for t∈ℤ^{d_1} write tx := Σ t_ix_i and for s∈ℤ^{ℓ_1} write sy := Σ s_jy_j. For τ, σ∈ℕ^n define P^{(σs)}_{τt}(X, Y) := Σ_κ ∏_{ν=1}^{n} [σ_ν!τ_ν!/(κ_ν!(σ_ν − κ_ν)!(τ_ν − κ_ν)!)]·(Σ_i t_iX_{νi})^{σ_ν−κ_ν}(Σ_j s_jY_{νj})^{τ_ν−κ_ν}∈ℤ[X, Y], κ over 0≤κ_ν≤min(σ_ν, τ_ν). Then D^σ(z^τ e^{(tx)·z})(sy)=P^{(σs)}_{τt}(x, y)·∏_{i,j} e^{(x_i·y_j) t_is_j}. The total degree of P^{(σs)}_{τt} in the X-variables is≤‖σ‖, in the Y-variables≤‖τ‖, and for T≥max(‖t‖, 1), S≥max(‖s‖, 1) its length (sum of absolute values of coefficients) is≤T^{‖σ‖}S^{‖τ‖} min{(1 + |τ|/(TS))^{‖σ‖}, (1 + |σ|/(TS))^{‖τ‖}}. (W00, §4.4, Lem. 4.9, pp. 130-131, PDF 150-151.)

*W00 Lemma 4.11 (Let v_ij∈ℝ…)* Provides a nonzero bounded integer vector making every real linear form small. Supplied by LinearFormsInLogarithms §3.4 / Thue–Siegel’s lemma (real forms) (an open TauCetiRoadmap pull request by mkaratarakis). Specialize the provider’s finite types to the rectangular indices and its real U to our positive integer bound; preserve the strict counting inequality.

*W00 Lemma 4.12 (Let ν≥1 and X be a positive integer…)* Provides a nonzero bounded integer vector making every complex linear form small. Supplied by LinearFormsInLogarithms §3.4 / Thue–Siegel’s lemma (complex forms) (an open TauCetiRoadmap pull request by mkaratarakis). Specialize to ν≥1 rectangular indices and positive U,V; preserve the provider’s nonempty unknown index and weak counting inequality.

Let f be entire on ℂ^n and r > 0. For every σ∈ℕ^n: |D^σ f(0)|≤σ!·r^{−‖σ‖}·|f|_r; and for ζ∈ℂ^n with r≥1 + |ζ|: |D^σ f(ζ)|≤σ!·(r − |ζ|)^{−‖σ‖}|f|_r≤σ!·|f|_r. (W00, PDF 14.)

*Let 0 < r < R, T a positive integer and F entire…* Provides the truncated Taylor bound used by the auxiliary-function construction. Supplied by LinearFormsInLogarithms §1.5 / Truncated Taylor interpolation (an open TauCetiRoadmap pull request by mkaratarakis). Use ordinary derivatives divided by τ! through the factorial bridge, and closed sup radii via an interior-radius limit; the shared constant is 1+T.

*Needs:* §3.3.

*W00 Proposition 4.10 / exists_auxiliary_small* Provides a nonzero bounded integer combination of the analytic family that is exponentially small on the inner polydisc. Supplied by LinearFormsInLogarithms §4.1 / Proposition 4.10 (an open TauCetiRoadmap pull request by mkaratarakis). Our entire functions must first supply normally convergent power series on the outer ball; the provider allows local series and does not require positive U,V.

*Let λ_1, …, λ_r∈ℂ be pairwise distinct…; functions z^τ exp((tx)·z)* Provides independence of exponential polynomials with distinct frequencies. Supplied by LinearFormsInLogarithms §2.3 / Linear independence (an open TauCetiRoadmap pull request by mkaratarakis). Reindex finite relations using injectivity of t↦Σtᵢxᵢ from rational independence; the infinite monomial-family formulation is read through its finite relations.

Use `iteratedDeriv_mul`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`; `Complex`: `norm_le_of_forall_mem_frontier_norm_le`, `norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`, `exp_ne_zero`; `intervalIntegral.integral_eq_sub_of_hasDerivAt`; `Polynomial`: `le_rootMultiplicity_iff`, `card_roots'`, `eq_zero_of_natDegree_lt_card_of_eval_eq_zero`; `Finset.exists_ne_map_eq_of_card_lt_of_maps_to`; `MvPolynomial.funext`.

### 3.5 Schneider–Lang and Baker independence

Consume LinearFormsInLogarithms §5.7, §§6.1–6.4 and §§7.1–7.3 for the Schneider–Lang and qualitative Baker conclusions. Its ordinary-derivative presentation fixes n≥1, 0≤d₀≤n<d=d₀+d₁, ℚ-independent x₁,…,x_d₁∈ℚ̄ⁿ, a complex basis y₁,…,yₙ and a number field K containing all x-coordinates, the y_hj for h≤d₀, and exp(xᵢ·yⱼ). With T₀,T₁≥2 let L=(T₀+1)^d₀(T₁+1)^d₁ and enumerate φ=z^τexp((tx)·z) with 0≤τ_h≤T₀, τ_h=0 for h>d₀ and 0≤tᵢ≤T₁. Write sy=Σsⱼyⱼ. All positive constants are chosen from these fixed data before the parameters; upper-bound constants may be enlarged to 1, but c₃,c₄,c₅ may be below 1. Use the norms of §3.4; pass the normally convergent outer-ball series from LinearFormsInLogarithms §2.1 to its §4.1 auxiliary-smallness supplier, and use its §2.3 finite-relation independence at nonvanishing. The §3.4 Schwarz supplier is applied through the factorial bridge, with n≥1 and positive grid-order product for the numerical comparison. LinearFormsInLogarithms §5.1 / The auxiliary function (an open TauCetiRoadmap pull request by mkaratarakis), states the T₀=T₁=T special case; reconcile the shared carrier by generalizing it once, retaining our independent budgets and first-vanishing construction.

There is c_1≥1 such that: if F=Σ_λ p_λφ_λ with p_λ∈ℤ, max|p_λ|≤e^N (N > 0), σ∈ℕ^n, s∈ℕ^n with |s| < S_1, and D^σF(sy)≠0, then log|D^σF(sy)|≥−c_1(N + ‖σ‖ log T_1 + T_0 log(S_1 + ‖σ‖) + T_1S_1). (W00, §4.6, p. 137, PDF 157.)

*Needs:* §3.4; §3.1.

Fix c₁≥1 satisfying the full Liouville bound (4.14) for these fixed data, uniformly over T₀,T₁≥2, S₁, N>0, coefficients bounded by exp N, grid points and nonzero jets. Choose constants before any T₀,T₁,S₀,S₁,E: c₂=Σ_j|y_j|+2, c₄=1/(2c₁), c₃=c₄^{1/n}6^{−1−1/n}, c₆=c₂(d₀+d₁+Σ_iΣ_ν|x_iν|), c₅=c₃/c₆; c₃,c₄,c₅,c₆>0; c₇≥max{c₅^{−1},(2c₁/c₃)(n+1+log(n+1))} and c₈≥1+2nc₃. The following holds for all integers T_0,T_1,S_0,S_1≥2 and reals E≥e with L≥6^{2n+2}n^{2n}c_1, T_0 log(S_1E) + T_1S_1E≤c_5L^{1/n} log E (4.15), L^{1/n} log E > c_7(S_0 log(S_0T_1) + T_0 log(S_0S_1E) + T_1S_1E) (4.17) and S_0S_1≥c_8L^{1/n} (4.18): putting U := c_3L^{1/n} log E and N := c_4U, there are p_λ∈ℤ, not all 0, |p_λ|≤e^N, such that F := Σ p_λφ_λ is not identically zero, |F|_{c_2S_1}≤e^{−U}, and D^σF(sy)=0 for all σ∈ℕ^n with |σ| < S_0 and all s∈ℕ^n with |s| < S_1. For every E′≥E the same coefficient budget satisfies N≤(S₀S₁/(2n))log E′. (W00, §4.6, pp. 138-139, PDF 158-159.)

*Needs:* §3.4.

Let F be as in Construction of the auxiliary function and its first vanishing (Waldschmidt §4.6, Steps 3-4) and let S_0' be the largest integer such that D^σF(sy)=0 for all σ∈ℕ^n with ‖σ‖ < S_0' and all s∈ℕ^n with |s| < S_1 (so S_0'≥S_0, and S_0' < ∞ since F ≢ 0). Choose σ^0, s^0 with ‖σ^0‖=S_0', |s^0| < S_1 and D^{σ^0}F(s^0y)≠0. There are positive c_9, c_10 depending only on x,y,d₀,d₁,n such that for every E'≥E: log|D^{σ^0}F(s^0y)|≤−(S_0'S_1/(2n)) log E' + c_9S_0' log S_0' + c_10(T_0 log(S_1E') + T_1S_1E'). (W00, §4.6, p. 140, PDF 160.)

*Needs:* §3.4.

*Criterion of Schneider–Lang / W00 Corollary 4.2* Provides transcendence of at least one coordinate or exponential on the Cartesian basis grid. Supplied by LinearFormsInLogarithms §5.7 / Corollary 4.2 (an open TauCetiRoadmap pull request by mkaratarakis). A Fin n linearly independent family is a complex basis; rewrite the supplier existential using not-all-algebraic and transpose only the coordinate indexing.

Let x_1, …, x_d∈ℚ̄^n generate a subgroup of rank≥n + 1 and let {y_1, …, y_ℓ}⊆ℂ^n contain a basis of ℂ^n. Then at least one of the dℓ numbers x_i·y_j (1≤i≤d, 1≤j≤ℓ) does not belong to 𝓛. (W00, §4.1, Corollary 4.3, p. 118, PDF 138.) LinearFormsInLogarithms §6.1 / The case d₀=0 (an open TauCetiRoadmap pull request by mkaratarakis), states the special case with independent generators; reconcile it by extracting a rationally independent subfamily of size at least n+1 and applying mem_algebraicLogs.

*Needs:* §3.1.

*W00 Corollary 4.4 / schneiderLang_inhomogeneous* Provides a transcendental exponential when the basis has algebraic first coordinates. Supplied by LinearFormsInLogarithms §6.2 / The case d₀=1, d₁=n=d (an open TauCetiRoadmap pull request by mkaratarakis). Use d≥1 for the first coordinate, identify the Fin d independent basis, and rewrite exp-algebraicity as algebraicLogs membership.

*Needs:* §3.1.

*Bertrand–Masser / W00 Theorem 4.5* Provides vanishing of the logarithm tuple from algebraicity of its number-field basis-coordinate sum. Supplied by LinearFormsInLogarithms §7.1 / Theorem 4.5 (an open TauCetiRoadmap pull request by mkaratarakis). Translate algebraicLogs membership to algebraic exponentials and pointwise zero to function equality, specializing the provider’s finite basis index to Fin d.

*Needs:* §3.1.

*Baker’s theorem / linearIndependent_cons_one_of_linearIndependent_rat* Provides algebraic-coefficient independence of 1 and the rationally independent logarithms. Supplied by LinearFormsInLogarithms §7.2 / Baker’s theorem (an open TauCetiRoadmap pull request by mkaratarakis). Use the algebraic coefficient field `integralClosure ℚ ℂ`, translate membership to algebraic exponentials, and package coefficient vanishing as Fin.cons independence.

*Needs:* §3.1.

*E19 Theorem 4.19 / transcendental_sum_mul_of_linearIndependent* Provides transcendence of a nonzero algebraic-coefficient linear form in algebraic logarithms. Supplied by LinearFormsInLogarithms §7.3 / Corollaries (nonzero sum) (an open TauCetiRoadmap pull request by mkaratarakis). Derive nonzero sum from supplied Baker independence and β≠0; rational independence is used for nonvanishing, while the supplier requires only a nonzero sum.

Let α_1, …, α_n be nonzero algebraic numbers that are multiplicatively independent, λ_i any logarithms of α_i (λ_i∈𝓛, e^{λ_i}=α_i), and β_1, …, β_n algebraic with (β_1, …, β_n) ∉ ℚ^n. Then α_1^{β_1}⋯α_n^{β_n} := e^{β_1λ_1+⋯+β_nλ_n} is transcendental. (E19, ch. 4, §4.3, Corollary 4.20, p. 74.)

*Needs:* §3.1.

Use `Algebra.IsAlgebraic.exists_integral_multiples`; `NumberField`: `house_mul_le`, `house_add_le`, `house_pow_le`; `Algebra`: `discr_not_zero_of_basis`, `discr_eq_det_embeddingsMatrixReindex_pow_two`.

### 3.6 Explicit archimedean logarithmic bounds

Let m≥1 and C(m) := 2^{m+25}m^{3m+9}. Let λ_1, …, λ_m∈𝓛 be linearly independent over ℚ, α_j := e^{λ_j}, and β_0, …, β_m algebraic numbers, not all zero; D := [ℚ(α_1, …, α_m, β_0, …, β_m) : ℚ]. Let B, E, E*≥e and A_1, …, A_m > 0 be reals with log A_j≥max{h(α_j), E|λ_j|/D, (log E)/D}, log E*≥max{(1/D) log E, log(D/log E)}, B≥E*, and either (i) B≥max_i (D log A_i)/(log E) and log B≥max_{0≤i≤m} h(β_i), or (ii) β_0=0, β_i=b_i∈ℤ, b_m≠0 and B≥max_{1≤j<m}(|b_m|/log A_j + |b_j|/log A_m)(log E)/D. Then Λ := β_0 + β_1λ_1 + ⋯ + β_mλ_m≠0 and |Λ| > exp{−C(m)D^{m+2}(log B)(log A_1)⋯(log A_m)(log E*)(log E)^{−m−1}}. (W00, ch. 9, Thm. 9.1, pp. 251-252, PDF 271-272; W00, §9.3, Prop. 9.18, p. 286, PDF 306.)

*Needs:* §3.1.

For m,D≥1 and fixed arbitrary λᵢ∈algebraicLogs, there is an effectively computable C>0 such that every algebraic γ,βᵢ of degree ≤D with Λ=γ+Σβᵢλᵢ≠0 satisfies |Λ|≥(eB)⁻C, where B=max(H_abs γ,H_abs βᵢ). Using naive height only changes C by a D-dependent factor. (E19, ch. 5, §5.1, Thm. 5.2, p. 86.)

*Needs:* §3.1; §0.2; §0.1.

For fixed nonzero algebraic α₁,…,α_m, there is effective C′>0 such that ∏αᵢ^bᵢ≠1 implies |∏αᵢ^bᵢ−1|≥(eB)⁻C′ for integer b and B=max|bᵢ|. No logarithm branch is part of this multiplicative statement. (E19, ch. 5, §5.1, Corollary 5.3, pp. 86-87.)

*Needs:* §3.1; §0.2.

Let n≥1 and K⊆ℂ be a number field of degree D; κ := 1 if K⊆ℝ and κ := 2 otherwise. Let α_1, …, α_n∈K^×, λ_1, …, λ_n nonzero logarithms of them (λ_j∈𝓛 \ {0}, e^{λ_j}=α_j, arbitrary branches), b_1, …, b_n∈ℤ and Λ := b_1λ_1 + ⋯ + b_nλ_n≠0. Let A_j≥max{D·h(α_j), |λ_j|, 0.16} and B* := max|b_j|. Reorder so A_n=max_j A_j; the source’s weighted parameter B=max{1,max_j |b_j|A_j/A_n} then satisfies B≤B*. Then log|Λ| > −C_1(n)·D²·A_1⋯A_n·log(eD)·log(eB*), where C_1(n)=C_1(n, κ)=min{(1/κ)(en/2)^κ·30^{n+3}·n^{3.5}, 2^{6n+20}}. (Matveev, §1, pp. 1217–1218, §2, Corollary 2.3, p. 1219, §21, p. 1266. BMS06, §9.1, Theorem 9.4 supplies the multiplicative consequence below, with different constants.)

*Needs:* §3.1.

For nonzero rational a₁,…,a_m and integer b with ∏aᵢ^bᵢ≠1, put B=max|bᵢ| and C′=(e/2)m^(4.5)30^(m+3)∏max(1,log H(aᵢ)). Then |∏aᵢ^bᵢ−1|≥(2/3)(eB)⁻C′; the factor 2/3 is retained in passing from the logarithmic bound. (E19, ch. 5, §5.1, Thm. 5.4, p. 87.)

*Needs:* §0.2.

Let L⊆ℂ be a number field of degree D, α_1, …, α_n∈L^×, b∈ℤ^n, B := max|b_j| and Λ := α_1^{b_1}⋯α_n^{b_n} − 1≠0. Let A_j≥max{D·h(α_j), |log α_j|, 0.16} with log the principal logarithm. Then log|Λ| > −3·30^{n+4}(n + 1)^{5.5}D²(1 + log D)(1 + log(nB))A_1⋯A_n. If moreover L⊆ℝ, then log|Λ| > −1.4·30^{n+3}n^{4.5}D²(1 + log D)(1 + log B)A_1⋯A_n. (BMS06, §9.1, Thm. 9.4, p. 16; E19, ch. 5, §5.4, p. 101.)

*Needs:* §0.2.

Let a_1, a_2 be positive rational numbers≠1, b_1, b_2 nonzero integers and Λ := b_1 log a_1 − b_2 log a_2≠0 (real logarithms). Then log|Λ|≥−24.34·(max{log(|b_1|/log H(a_2) + |b_2|/log H(a_1)) + 0.14, 21})²·log H(a_1)·log H(a_2). (E19, ch. 5, §5.5, Exercise 5.4, p. 104.)

Use `NumberField`: `absLogHeight₁`, `absMulHeight₁`; `Complex`: `norm_log_one_add_half_le_self`, `exp_eq_exp_iff_exists_int`, `exp_log`, `log`; `Rat.mulHeight₁_eq_max`.

### 3.7 p-adic logarithmic bounds

Let n≥2, α_1, …, α_n nonzero algebraic numbers, K := ℚ(α_1, …, α_n) of degree d, p a prime, 𝔭 a prime ideal of 𝓞_K above p with residue degree f_𝔭, and ord_𝔭 the exponent of 𝔭 in a nonzero fractional ideal. Let b∈ℤ^n \ {0} with α_1^{b_1}⋯α_n^{b_n}≠1, and reals h_1, …, h_n with h_j≥max(h(α_j), |log α_j|/(10d), log p) (log α_j with imaginary part in (−π, π], i.e. Complex.log). Then ord_𝔭(α_1^{b_1}⋯α_n^{b_n} − 1) < Φ·log(dB), where B := max(|b_1|, …, |b_n|, 3), h' := max(h_1, …, h_n, 1) and Φ := 22000·(9.5(n + 1)d/√(log p))^{2(n+1)}·(p^{f_𝔭} − 1)·h_1⋯h_n·log(10ndh'). No p-adic logarithm occurs in the statement. (Yu 1994, §0.1, pp. 241-242; Yu 1990, Lem. 1.4, p.23, pp.24–25.)

For prime p, integer a≠0 with p|a when p is odd and 4|a when p=2, and b≥1, |(1+a)^b−1|p=|ab|p≥1/|ab|, equivalently v_p((1+a)^b−1)=v_p(a)+v_p(b). (E19, ch. 5, §5.5, Exercise 5.9(i), p. 106.)

For prime p and a∈ℚ× with |a|p=1, some c∈(0,1] gives |a^b−1|p≥c|b|p≥c/|b| for every integer b with a^b≠1. (E19, ch. 5, §5.4, Thm. 5.16, p. 101.)

Let p be a prime, a_1, …, a_m nonzero rational numbers with |a_i|_p=1, and b∈ℤ^m with a_1^{b_1}⋯a_m^{b_m}≠1; B := max|b_i|. Then |a_1^{b_1}⋯a_m^{b_m} − 1|_p≥(eB)^{−C}, where C depends only on p, m and a_1, …, a_m; explicitly, for m≥2 one may take C=2Φ log p with Φ=22000·(9.5(m + 1)/√(log p))^{2(m+1)}(p − 1)h_1⋯h_m log(10mh'), h_j := max(log H(a_j), |log a_j|/10, log p), h' := max(h_j, 1). The statement is multiplicative: no p-adic logarithm is chosen. (E19, ch. 5, §5.4, Thm. 5.16, p. 101.)

*Needs:* §0.2.

Use `NumberField.absLogHeight₁`; `Complex.log`; `IsDedekindDomain.HeightOneSpectrum.adicAbv`; `Int`: `emultiplicity_pow_sub_pow`, `two_pow_sub_pow'`; `padicNorm`; `Rat.mulHeight₁_eq_max`.

### 3.8 The Schanuel proposition and conditional consequences

Define `SchanuelConjecture` as the proposition that every ℚ-independent tuple x∈ℂⁿ has trdeg_ℚ ℚ(x,exp x)≥n. Conditional results take this proposition as an explicit hypothesis. (E19, ch. 4, §4.3, p. 75.)

Its API includes `SchanuelConjecture.le_trdeg`: SchanuelConjecture→LinearIndependent ℚ x→n≤trdeg ℚ ℚ(x, e^x); `schanuel_ineq_one`: The unconditional case n=1; `schanuel_ineq_of_isAlgebraic`: The unconditional case of algebraic x.

**Checks.**

- The n=0 instance of the inequality holds trivially (0≤trdeg).
- Unconditionally, for x=1: 1≤Algebra.trdeg ℚ ℚ(1, e) (e is transcendental).
- Unconditionally, for x=(1, √2): 2≤trdeg ℚ ℚ(1, √2, e, e^{√2}) (agreement with algebraicIndependent_exp).
- The variant with 'pairwise distinct' instead of 'linearly independent over ℚ' is false: x=(0) gives trdeg ℚ(0, 1)=0 < 1 (Evertse Exercise 4.4).

Assuming SchanuelConjecture, exp(1) and π are algebraically independent over ℚ. (E19, ch. 4, §4.3, p. 75.)

Assuming SchanuelConjecture, every ℚ-independent tuple in algebraicLogs is algebraically independent over ℚ. (E19, ch. 4, §4.3, pp. 75-76.)

*Needs:* §3.1.

Use `Algebra.trdeg`; `IntermediateField.adjoin`; `Algebra.IsAlgebraic`: `isTranscendenceBasis_of_le_trdeg_of_finite`, `trdeg_le_cardinalMk`.

### Examples

The Hermite transform of 1 is e^z−1 and that of X at z=1 is e−2. The logarithm 2πi belongs to algebraicLogs although it is outside the range of the principal logarithm. For n=0 the mixed derivative is the identity; for f=z₀z₁ the orders (1,0) and (1,1) give z₁ and 1.

### Dependencies

Layer 0’s algebraic size and Siegel estimates and Layer 1’s polynomial coefficient calculus; Mathlib complex exponential, integrals, derivatives and algebraic independence; ContourIntegration for analytic supplier results.

## Layer 4: effective Diophantine equations

### 4.1 S-units and balanced divisors

For a finite set S of rational primes, use U_S=Set.unit S′ ℚ, where S′ is its corresponding set of height-one primes of 𝓞 ℚ. Prove `mem_sUnits_rat_iff_num_den`: x∈U_S iff |num x| and den x have all their prime factors in S; `mem_sUnits_rat_iff_eq_sign_mul_prod`: x=ε∏p∈S p^z_p for a sign ε and integer exponents; `sUnits_rat_mulEquiv`: this gives an isomorphism U_S≃ℤˣ×Multiplicative(ℤ^S), with exponents v_p(x), hence finite generation and rank |S|. Prove `mulHeight₁_sUnits_rat`: H(x)=max(∏p∈S p^max(v_p(x),0),∏p∈S p^max(−v_p(x),0)). The numerator, denominator and height formulas require S to contain primes only. (E19, ch. 5, Thm. 5.17, pp. 101–102.)

**Checks.**

- 12/5∈U_{2,3,5}, with prime-exponent tuple (2,1,−1), and height 12.
- 7∉U_{2,3}; testing v(x)=1 only at primes in S would accept it, whereas the defining condition tests primes outside S.
- U_∅={1,−1}; the sign factor cannot be suppressed.
- The defining valuation condition is exactly Mathlib’s S-unit condition, with v(x)=1 outside S′.
- The natural-number set {4} has empty prime subset, so 4 is not a unit away from that subset. Allowing 4 as a generator would accept it; the prime-only hypothesis is essential.

For a degree-d number field and unit tuple u of rank r, set c₁(u)=rΣⱼ‖logEmbedding(uⱼ)‖∞. Define `boundedDivisors u α`={γ∈𝓞_K:γ|α and house γ≤exp(c₁(u))|Nα|^(1/d)}. For maximal-rank u and α≠0 it is finite and represents every divisor modulo units. (E19, ch. 5, Corollary 5.11, pp. 93-94.)

Its API includes `mem_boundedDivisors`: γ∈D_u(α)↔γ∣α ∧ house γ≤e^{c₁(u)}|N(α)|^{1/d}; `boundedDivisors_finite`: α≠0 ⟹ D_u(α) is finite; `exists_mem_boundedDivisors_of_dvd`: u of maximal rank, α≠0, β∣α ⟹ β=ε·γ with γ∈D_u(α), ε a unit; `boundedDivisors_subset_dvd`: D_u(α)⊆{γ : γ∣α}; `one_mem_boundedDivisors`: α≠0 ⟹ 1∈D_u(α) (since |N(α)|≥1 and house 1=1); `boundedDivisors_mul_unit`: D_u(ηα)=D_u(α) for every unit η.

**Checks.**

- For K=ℚ and m≠0: D(m)={γ : γ∣m ∧ |γ|≤|m|}.
- For K=ℚ: D(6)={±1, ±2, ±3, ±6}.
- If α is a unit then every element of D_u(α) is a unit.
- If rank K≥1 then {γ : γ∣1} (all units) is infinite; a definition without the house bound would not give a finite set.

If b,x>0 and x≤a+b log x, then x≤2a+2b(log(2b)−1); for a=b this gives x≤2b log(2b). (E19, ch. 5, Thm. 5.12, p. 95.)

For any number-field embedding σ, minpoly_ℚ(σα)=minpoly_ℚ(α), hence degree, naive height and Mahler measure are unchanged. Constants depending only on these quantities are uniform over conjugates. (E19, ch. 5, Thm. 5.12, p. 95.)

*Needs:* §0.1; §0.2.

For a unit u in a degree-d number field, house u≥1 and house(u)^(−(d−1))≤|σu|≤house u. Thus |log|σu||≤(d−1)log house u. (E19, ch. 5, Lem. 5.9, p. 92.)

For d≥2 and a unit y, some embedding satisfies |σy|≤house(y)^(−1/(d−1)). (E19, ch. 5, Thm. 5.12, p. 95.)

For maximal-rank units u, let κ(u) be the sup-norm operator norm of the inverse log-coordinate map. If x=ζ∏uⱼ^eⱼ with ζ torsion, then |eⱼ|≤2(d−1)κ(u)log house x. (E19, ch. 5, Lem. 5.9, p. 91.)

For maximal-rank u and any v in logSpace K, some integer n satisfies ‖v−logEmbedding(∏uⱼ^nⱼ)‖∞≤Σ‖logEmbedding(uⱼ)‖∞. (E19, ch. 5, Lem. 5.10, p. 93.)

For α∈𝓞_K≠0, choose ε=∏uⱼ^nⱼ with |log w(εα)−d⁻¹log|Nα||≤c₁(u) at each infinite place. Hence exp(−c₁)|Nα|^(1/d)≤|σ(εα)|≤exp(c₁)|Nα|^(1/d). (E19, ch. 5, Lem. 5.10, pp. 92-93.)

For α≠0 and any unit tuple u, boundedDivisors u α is finite. (E19, ch. 5, Corollary 5.11, pp. 93-94.)

For α≠0, maximal-rank u and β|α, write β=εγ with ε a unit and γ∈boundedDivisors u α. (E19, ch. 5, Corollary 5.11, p. 93.)

Use `padicValRat`; `padicValRat`: `mul`, `inv`; `Nat`: `factoredNumbers`, `prod_factorization_pow_eq_self`; `Set.unit`; `Rat.HeightOneSpectrum.primesEquiv`; `Rat.mulHeight₁_eq_max`; `NumberField`: `house`, `one_le_house_of_isIntegral`, `norm_embedding_le_house`, `norm_norm_le_norm_mul_house_pow`, NumberField.house_eq_sup'; `NumberField.Units`: `logEmbedding`, `rank`, `norm`, `basisOfIsMaxRank`, `basisOfIsMaxRank_apply`, `sum_mult_mul_log`; `Real.log_le_sub_one_of_pos`; `minpoly.algHom_eq`; `RingHom.toRatAlgHom`; `Algebra.norm_eq_prod_embeddings`; `NumberField.Embeddings`: `card`, `finite_of_norm_le`, `coeff_bdd_of_norm_le`; `NumberField.Units.dirichletUnitTheorem`: `logEmbedding_eq_zero_iff`, `logEmbedding_component`; `NumberField.InfinitePlace`: `norm_embedding_eq`, `prod_eq_abs_norm`, `sum_mult_eq`, `mult`; `Module.Basis.equivFunL`; `ContinuousLinearMap.le_opNorm`; `ZSpan`: `norm_fract_le`, `fract_apply`, `floor`.

### 4.2 Exponential equations and gaps

For prime p and positive integer n, v_p(n)log p≤log n. For a rational S-unit x, |v_p(x)|log p≤log H(x), so |v_p(x)|≤log H(x)/log 2. (E19, ch. 5, Thm. 5.6, p. 89.)

For integers a,b≥2, suppose C₁>0 gives |b^k a^(−l)−1|≥(e max(1,|k|,|l|))⁻C₁ whenever that product is not 1. Then positive m,n with a^m≠b^n satisfy |a^m−b^n|≥max(a^m,b^n)(e max(m,n))⁻C₁. (E19, ch. 5, Corollary 5.5, p. 88.)

Under that bound, a^m−b^n=k≠0 implies max(m,n)≤2(log|k|+C₁)/log 2+2(C₁/log 2)(log(2C₁/log 2)−1). (E19, ch. 5, Corollary 5.5, p. 88.)

*Needs:* §4.1.

For a,b≥2 and k≠0, these positive exponent solutions are finite, with the preceding bound for C₁=1+(e/2)2^(4.5)30⁵max(1,log a)max(1,log b). (E19, ch. 5, Thm. 5.4, Corollary 5.5, pp. 87-88.)

*Needs:* §3.6.

For a finite prime set S and a multiplicative Baker bound C for its primes, positive S-integers x<y satisfy y−x≥y(e log y/log 2)⁻C. (E19, ch. 5, Thm. 5.6, p. 89.)

Thus consecutive positive S-integers a_n, n≥1, satisfy a_n−a_(n−1)≥a_n/(c₁(log a_n)^c₂), with c₂=C and c₁=(e/log 2)^C. The same bound applies to every x<y. (E19, ch. 5, Thm. 5.6, p. 89.)

*Needs:* §3.6.

Use `pow_padicValNat_dvd`; `Rat.mulHeight₁_eq_max`; `Nat.factoredNumbers`.

### 4.3 Unit and Thue equations

Let K be a number field of degree d with unit rank r≥1, u : Fin r→(𝓞 K)^× of maximal rank, α, β∈K^×, and C′ > 0 such that for every embedding σ : K →+* ℂ, every γ∈{αζ, βζ : ζ∈torsion K} and every e∈ℤ^r with σ(γ∏_j u_j^{e_j})≠1: |σ(γ∏_j u_j^{e_j}) − 1|≥(e·max(1, max_j|e_j|))^{−C′}. Put κ := 2(d − 1)κ(u) (unit-exponent-house-bound), H := max(house α, house β), A := κ(d − 1)(log H + C′) and B₀ := κ(d − 1)C′. If x, y∈(𝓞 K)^× satisfy αx + βy=1 and x=ζ_x∏u_j^{e_j}, y=ζ_y∏u_j^{f_j} with ζ_x, ζ_y∈torsion K, then max_j max(|e_j|, |f_j|)≤max(1, 2A + 2B₀(log(2B₀) − 1)). (E19, ch. 5, Thm. 5.12, pp. 94-95.)

*Needs:* §4.1.

Let K be a number field and α, β∈K^×. The set of (x, y)∈(𝓞 K)^× × (𝓞 K)^× with αx + βy=1 is finite. Effectively: if rank K=0 the unit group is the finite group torsion K; if rank K≥1, let u=fundSystem K and C′ the maximum of the Corollary 5.3 constants for the finitely many tuples (γ, u_1, …, u_r) and (u_1, …, u_r), γ∈{αζ, βζ : ζ∈torsion K}, γ≠1; then every solution has exponent vectors (with respect to u) bounded by the bound of unit-equation-exponent-bound, so the solutions lie in the explicit finite region {ζ∏u_j^{e_j} : ζ∈torsion K, max|e_j|≤B}². (E19, ch. 5, Thm. 5.12, equation (5.3), p. 94.)

*Needs:* §4.1; §3.6.

In a commutative ring, (α₂−α₃)(X−α₁Y)+(α₃−α₁)(X−α₂Y)+(α₁−α₂)(X−α₃Y)=0. For distinct roots in a field and X−α₃Y≠0, division gives ((α₂−α₃)/(α₂−α₁))(X−α₁Y)/(X−α₃Y)+((α₃−α₁)/(α₂−α₁))(X−α₂Y)/(X−α₃Y)=1. (E19, ch. 5, Thm. 5.13, p. 97.)

For f∈ℤ[X] of degree d≥1 and leading coefficient a₀≠0, let g(X)=a₀^(d−1)f(X/a₀), F=f.homogenize d and G=g.homogenize d. Then G(a₀x,y)=a₀^(d−1)F(x,y); solutions of F=m biject to solutions of G=a₀^(d−1)m with a₀|x′. The distinct roots are multiplied by a₀. (E19, ch. 5, Thm. 5.13, p. 97.)

For monic g=∏i=1..d(X−θᵢ) over 𝓞_K, G(x,y)=∏(x−θᵢy). If G(x,y)=m≠0, each factor is a nonzero divisor of m and has |N|≤|m|^[K:ℚ]. (E19, ch. 5, Thm. 5.13, pp. 96-97.)

Let g∈ℤ[X] be monic with three distinct zeros θ₀, θ₁, θ₂ in 𝓞 K (K a number field, u=fundSystem K), m≠0 and D := D_u(m) (bounded-divisor-representatives). For every (x, y)∈ℤ² with G(x, y)=m there are μ₀, μ₁, μ₂∈D and units ε₀, ε₁, ε₂ with x − θ_i y=μ_i ε_i, and (X, Y) := (ε₀/ε₂, ε₁/ε₂) solves the unit equation a(μ)X + b(μ)Y=1 with a(μ)=((θ₁ − θ₂)/(θ₁ − θ₀))(μ₀/μ₂), b(μ)=((θ₂ − θ₀)/(θ₁ − θ₀))(μ₁/μ₂). Conversely, when y≠0, λ := (x − θ₀y)/(x − θ₂y)=(μ₀/μ₂)X determines x/y=(θ₀ − λθ₂)/(1 − λ). (E19, ch. 5, Thm. 5.13, pp. 97-98.)

*Needs:* §4.1.

For q∈ℚ in a degree-d number field, relative mulHeight₁(q)=max(|num q|,den q)^d and relative logHeight₁(q)=d log max(|num q|,den q). (BG96, §3, p. 70.)

For an integral α in a degree-d number field, relative logHeight₁(α)≤d max(0,log house α). (BG96, §3, formula (8), p. 70.)

Let F∈ℤ[X, Y] be a binary form of degree d whose X^d-coefficient a₀ is nonzero and such that F(X, 1) has at least three distinct complex zeros, and let m≠0. Then {(x, y)∈ℤ² : F(x, y)=m} is finite. Explicitly, with m′ := a₀^{d−1}m, g, G as in thue-equation-monic-reduction, θ₀, θ₁, θ₂ distinct zeros of g in the splitting field K of g (degree D), u=fundSystem K and B_T the maximum over (μ₀, μ₁, μ₂)∈D_u(m′)³ of the unit-equation exponent bound for (a(μ), b(μ)), every solution with y≠0 satisfies log H(a₀x/y)≤h_T := 4·log⁺(e^{c₁(u)}|m′|) + 2B_T·Σ_j log house(u_j) + log⁺house(θ₀) + log⁺house(θ₂) + 2 log 2, and every solution satisfies max(|a₀x|, |y|)≤|m′|^{1/d}·e^{h_T}. (E19, ch. 5, Thm. 5.13, p. 97; E19, ch. 5, Thm. 5.13, p. 98.)

*Needs:* §4.1.

Use `NumberField`: `norm_embedding_le_house`, `mulHeight_eq`, `totalWeight_eq_finrank`, `logHeight₁_eq`; `NumberField.Units`: `exist_unique_eq_mul_prod`, `isMaxRank_fundSystem`, `fundSystem`, `torsion`; `Polynomial`: `homogenize`, `integralNormalization`, `integralNormalization_aeval_eq_zero`, `eval_homogenize`, `homogenize_finsetProd`, `SplittingField`; `IsIntegral`; `Algebra.norm_eq_prod_embeddings`; `Height`: `mulHeight₁_div_eq_mulHeight`, `logHeight₁_mul_le`, `logHeight₁_inv`, `logHeight₁_zpow`, `logHeight₁_prod_le`, `logHeight₁_add_le`, `logHeight₁_sub_le`; `NumberField.InfinitePlace.sum_mult_eq`; `NumberField.FinitePlace.norm_le_one`; `Rat.mulHeight₁_eq_max`.

### 4.4 Superelliptic equations and variable exponents

Let A := {±2^k3^l : k, l∈{0, 1, 2}} (18 integers). For every (x, y)∈ℤ² with y³=2x(x − 3) there are a, b∈A and u, v∈ℤ with 2x=au³, x − 3=bv³, and then au³ − 2bv³=6. Conversely, a solution (u, v) of au³ − 2bv³=6 with au³ even gives x := au³/2, and (x, y) solves y³=2x(x − 3) exactly when 2x(x − 3) is a cube. Hence the solution set of y³=2x(x − 3) is determined by the 324 Thue equations aU³ − 2bV³=6, each of which has finitely many solutions by thue-equation-effective-bound (aX³ − 2b has three distinct zeros). (E19, ch. 5, pp. 98-99.)

*Needs:* §4.3.

Let b≠0 be an integer, n≥2 and f∈ℤ[X] without multiple zeros, with deg f≥2 if n≥3 and deg f≥3 if n=2. Then b·y^n=f(x) has only finitely many solutions (x, y)∈ℤ², and they can be determined effectively. Explicitly (Bérczes–Evertse–Győry 2013, Theorems 2.1 and 2.2 with K=ℚ, S={∞}, N := deg f, ĥ := log max(1, |b|, |coefficients of f|)): every solution satisfies log max(1, |x|), log max(1, |y|)≤(6N)^{14n³N³}·e^{8n²N³ĥ} if n≥3, and≤(4N)^{2^{12}N⁴}·e^{50N⁴ĥ} if n=2. (E19, ch. 5, Thm. 5.14, p. 98; BEG13, §2, p. 4.)

*Needs:* §4.5; §4.3.

Let b≠0 be an integer and f∈ℤ[X] of degree N≥2 without multiple zeros. There is an effectively computable C, depending on f and b, such that if b·y^n=f(x) has a solution (x, y)∈ℤ² with y ∉ {0, ±1}, then n≤C. Explicitly (Bérczes–Evertse–Győry 2013, Theorem 2.3 with K=ℚ, S={∞}): n≤(10N²)^{40N}·e^{11Nĥ}, ĥ=log max(1, |b|, |coefficients of f|). (E19, ch. 5, Thm. 5.15, p. 99; BEG13, §2, Thm. 2.3, p. 4.)

*Needs:* §3.6.

There is an effectively computable constant C such that every solution of x^m − y^n=1 in integers x, y, m, n≥2 satisfies x^m, y^n≤C. (E19, ch. 5, §5.1, the Tijdeman/Catalan paragraph after Corollary 5.5, pp. 88–89.)

*Needs:* §3.6.

Use `padicValInt`.

### 4.5 Effective S-unit and Thue–Mahler equations

Use §3.7’s lifting-the-exponent identity with p prime, a≠0 and the extra condition 4|a for p=2. This supplies the rational valuation normalization in the S-unit bounds. (E19, ch. 5, Exercise 5.9(i), p. 106; E19, ch. 5, Thm. 5.16, p. 101.)

*Needs:* §3.7.

Let S be a finite set of primes. For x, y∈U_S with x + y=1 there are pairwise coprime integers u, v, w with w > 0, u + v=w, x=u/w, y=v/w, and |u|, |v|, w composed of primes of S. The map (x, y) ↦ (u, v, w) is a bijection from the solutions of x + y=1 in U_S² onto such triples, and max_p max(|v_p(x)|, |v_p(y)|)=max_p max(v_p(u), v_p(v), v_p(w)); each prime divides at most one of u, v, w. (E19, ch. 5, Thm. 5.17, pp. 101-102.)

*Needs:* §4.1.

Let S be a finite set of primes and C > 0 such that for every p∈S, every sign ε∈{±1} and every b∈ℤ^S with b_p=0 and ε∏_q q^{b_q}≠1: |ε∏_q q^{b_q} − 1|_p≥(e·max(1, max_q|b_q|))^{−C} (this is Theorem 5.16 at p for the rationals −1 and q∈S∖{p}, all p-adic units). Then every solution (x, y)∈U_S² of x + y=1 satisfies |v_p(x)|, |v_p(y)|≤max(1, (2C/log 2)·log(2C/log 2)) for every prime p. (E19, ch. 5, Thm. 5.17, p. 102.)

*Needs:* §4.1.

For every finite set S of primes, x + y=1 has only finitely many solutions (x, y)∈U_S × U_S, and every solution satisfies |v_p(x)|, |v_p(y)|≤max(1, (2C_S/log 2)log(2C_S/log 2)) for all p, where C_S is the maximum over p∈S of the Theorem 5.16 constants C(p; −1, (q)_{q∈S∖{p}}). The solutions therefore lie in the explicit finite box {x∈U_S : |v_p(x)|≤B for p∈S}, of 2(2⌊B⌋ + 1)^{|S|} elements (B≥1). For S=∅ there are no solutions; avoid taking a maximum over an empty set. (E19, ch. 5, Thm. 5.17, p. 101; E19, ch. 5, Thm. 5.17, p. 102.)

*Needs:* §4.1; §3.7.

For y∈K× which is a unit outside finite S, write ℓ_w=m_w log w(y) at infinity and ℓ_v=log|y|v at finite places. Then Σℓ=0 and relative logHeight₁(y)=Σmax(0,ℓ)=½Σ|ℓ|; hence max|ℓ|≤2logHeight₁(y). (BG96, §3, Lem. 1, formula (12), p. 72.)

For s=|S|+#S_∞≥1, some place in S∪S_∞ satisfies ℓ_v(y)≤−logHeight₁(y)/s. (BG96, §3, Lem. 1, formula (12), p. 72.)

Let K be a number field and γ₁, …, γ_t∈K^× multiplicatively independent (∏γ_j^{z_j} a root of unity only for z=0). Let S be the finite set of finite places where some γ_j is not a unit and ℓ=(ℓ_v)_{v∈S∪S_∞} the S-logarithmic map. Then ℓ(γ₁), …, ℓ(γ_t) are ℝ-linearly independent, and with T_γ a left inverse of z ↦ Σz_jℓ(γ_j) and κ(γ) := 2‖T_γ‖: for every root of unity ζ∈K and z∈ℤ^t, max_j|z_j|≤κ(γ)·logHeight₁(ζ∏_jγ_j^{z_j}). (BG96, §3, Lem. 1, p. 71; E19, ch. 5, Lem. 5.9, p. 91.)

Let K, γ₁, …, γ_t, S, s and κ=κ(γ) be as in exponent-height-bound-for-finitely-generated-groups, a, b∈K^×, and C > 0 such that for every c∈{aζ, bζ : ζ root of unity in K} and every z∈ℤ^t with c∏γ_j^{z_j}≠1: (i) |σ(c∏γ_j^{z_j}) − 1|≥(e·max(1, max|z_j|))^{−C} for every embedding σ : K →+* ℂ (Corollary 5.3), and (ii) |c∏γ_j^{z_j} − 1|_v≥(e·max(1, max|z_j|))^{−C} for every v∈S (Yu's theorem for algebraic numbers). Put M := max(house a, house b, max_{v∈S} max(|a|_v, |b|_v)), A := 2κs(log M + C), B₀ := 2κsC. Then every solution x=ζ_x∏γ_j^{z_j}, y=ζ_y∏γ_j^{w_j} of ax + by=1 satisfies max_j max(|z_j|, |w_j|)≤max(1, 2A + 2B₀(log(2B₀) − 1)). (E19, ch. 5, Thm. 5.18, p. 103.)

*Needs:* §4.1.

Let K be a number field, Γ⊆K^× a finitely generated subgroup and a, b∈K^×. Then ax + by=1 has only finitely many solutions (x, y)∈Γ², and they lie in the explicit finite region of gyory-equation-exponent-bound, where C is the maximum of the Corollary 5.3 constants and of the p-adic constants (Yu's theorem for algebraic numbers) for the finitely many relevant tuples. Theorems 5.12 (Γ=(𝓞 K)^×) and 5.17 (K=ℚ, Γ=U_S) are special cases. (E19, ch. 5, Thm. 5.18, pp. 102-103; BG96, §2, p. 68.)

*Needs:* §4.1; §3.6; §3.7.

Let K be a number field with class number h, P a finite set of nonzero prime ideals of 𝓞 K, and for 𝔭∈P let π_𝔭∈𝓞 K generate 𝔭^h. Let Γ_P⊆K^× be generated by (𝓞 K)^× and the π_𝔭 (finitely generated). For nonzero m∈𝓞 K there is an explicit finite set M_P(m)⊆𝓞 K∖{0}, one generator for each principal ideal of the form 𝔞·∏_{𝔭∈P}𝔭^{r_𝔭} with 𝔞∣(m) supported outside P and 0≤r_𝔭 < h, such that every nonzero β∈𝓞 K with v_𝔮(β)≤v_𝔮(m) for all prime ideals 𝔮 ∉ P lies in μ·Γ_P for some μ∈M_P(m). (Tzanakis–de Weger, §5, §6, pp. 230-233; E19, ch. 5, Corollary 5.11, p. 93.)

Let F∈ℤ[X, Y] be a binary form of degree d≥3 with X^d-coefficient a₀≠0 such that F(X, 1) has at least three distinct complex zeros, m≠0 an integer and p₁, …, p_s distinct primes. Then the set of (x, y, z₁, …, z_s)∈ℤ² × ℕ^s with gcd(x, y)=1 and F(x, y)=m·p₁^{z₁}⋯p_s^{z_s} is finite, and its elements lie in an explicit region assembled from the bound of gyory-equation-exponent-bound (as in thue-equation-effective-bound). (Tzanakis–de Weger, §1, equation (1), p. 223; Tzanakis–de Weger, §1, p. 223.)

*Needs:* §4.3.

Use `padicValRat.div`; `Nat.factoredNumbers`; `padicNorm.eq_zpow_of_nonzero`; `NumberField`: `prod_abs_eq_one`, `logHeight₁_eq`, `finite_setOfPred_logHeight₁_le`, `norm_embedding_le_house`, `classNumber`; `NumberField.FinitePlace.hasFiniteMulSupport`; `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`; `Real.finrank_eq_int_finrank_of_discrete`; `ContinuousLinearMap.le_opNorm`; `Module.free_of_finite_type_torsion_free'`; `NumberField.RingOfIntegers.instFintypeClassGroup`; `pow_card_eq_one`; `UniqueFactorizationMonoid.fintypeSubtypeDvd`; `Submodule.IsPrincipal`; `IsDedekindDomain.HeightOneSpectrum.intValuation`.

### Examples

The dyadic condition in the valuation estimate is 4|a: a=4,b=2 gives ord₂((1+a)^b−1)=3=ord₂(a)+ord₂(b), while a=2,b=2 gives 3>2. A rank-zero unit lattice contributes torsion only. The balanced divisors for ℚ and β=5 may be chosen as {1,5}.

### Dependencies

Layers 0, 2 and 3; Mathlib ideal factorisation, class groups, unit lattices, logarithmic embedding, norms and prime valuations.

## Layer 5: special functions and functional transcendence

### 5.1 D-finite series and minimal equations

For k⊂ℂ define `IsDFinite k f` for f∈ℂ[[z]] by the existence of p₀,…,p_n∈k[z] with p_n≠0 and Σpᵢf^(i)=0. Equivalently its derivatives span a finite-dimensional k(z)-space; for coefficients in k this is equivalent to a polynomial recurrence Σqᵢ(n)c_(n+i)=0 with q_r≠0. (B08, §3.1, Prop. 3.2.1, pp. 11-12; Fischler–Rivoal, Def. 1, p. 1.)

Its API includes `IsDFinite.add`: Sums of D-finite series are D-finite; `IsDFinite.mul`: Products of D-finite series are D-finite; `IsDFinite.derivative`: The derivative of a D-finite series is D-finite; `IsDFinite.mono`: k≤k′ and IsDFinite k f imply IsDFinite k′ f; `isDFinite_polynomial`: A polynomial with coefficients in k is D-finite over k; `isDFinite_iff_pRecursive`: For f with coefficients in k: D-finite over k iff the coefficient sequence is P-recursive with polynomial coefficients in k[X].

**Checks.**

- PowerSeries.exp ℂ is D-finite over ℚ (f′ − f=0).
- Every polynomial p with coefficients in Q̄ is D-finite over Q̄: if p≠0, p f′−p′f=0 has nonzero leading coefficient p; if p=0, the order-zero equation 1·f=0 is a witness.
- Σ zⁿ is D-finite over ℚ ((1 − z) f′ − f=0).
- Σ z^{2^n} is not D-finite even over ℂ; a definition allowing the coefficients p_i to be arbitrary power series (rather than polynomials) would accept it.

Define `dfiniteOrder k f` as the least order of such an equation. Minimal equations p,p′ satisfy p′_n pᵢ=p_n p′ᵢ, so their monic rational operator is unique. Define `IsMinimalSingularPoint` by vanishing of the leading coefficient of every minimal equation; `IsApparentSingularity` means the operator has a full holomorphic solution basis there. (B06, §1, p. 1; B08, §3.4, Thm. 3.4.1, p. 14.)

Its API includes `exists_minimal_equation`: There is an equation of order dfiniteOrder; `dfiniteOrder_le`: Every equation has order≥dfiniteOrder; `minimal_equation_unique`: For minimal-order equations p,p′ over k with nonzero leading coefficients, p′_n p_i=p_n p′_i for all i; `dfiniteOrder_eq_zero_iff`: dfiniteOrder=0 iff f=0; `IsMinimalSingularPoint`: ξ is a singular point of the minimal equation: the leading coefficient of every minimal equation vanishes at ξ.

**Checks.**

- exp has minimal order 1.
- (z − 1)eᶻ has order 1 and 1 is a singular point of its minimal equation (an apparent one).
- The zero series has order 0.
- exp has no finite singular point; a definition of 'singular point' using an arbitrary (non-minimal) equation such as (z − 1)(f′ − f)=0 would wrongly report z=1.

For a scalar equation of order r≥1 over k(z), define `IsApparentSingularity` at ξ to require that ξ is a singular point of its normalized operator and that the space of holomorphic solution germs at ξ has dimension r. This is a property of the operator, independent of multiplication of its equation by a nonzero rational function. Its API proves invariance under equation normalization, constructs a full holomorphic solution basis, and relates this basis to the minimal equation’s solution germs; it does not assert that evaluation at ξ is invertible. (B06, §2, Thm. 2.1, pp. 3–4; B08, §3.4, Thm. 3.4.1, p. 14.)

**Checks.**

- The equation (z−1)y′−zy=0 has its one-dimensional holomorphic basis (z−1)e^z at 1, although every solution vanishes there.
- The equation y′−y=0 has no singular point at 1; multiplying it by z−1 does not make its normalized operator singular.
- The Euler equation zy′−y/2=0 has no nonzero holomorphic solution germ at 0, so 0 is a genuine singularity.

For a holomorphic matrix A on a disc D of radius r>0, every initial vector y₀ admits a holomorphic solution y′=Ay on D with y(z₀)=y₀. Two such solutions agree on D. (B08, §2.2, Thm. 2.2.1, p. 9.)

Under §5.1’s positive-radius holomorphic-system hypotheses, evaluation at the centre is a linear isomorphism from the space of solutions restricted to the disc to ℂⁿ. Its dimension is n. (B08, §2.2, Thm. 2.2.1, p.9.)

For a scalar equation Σi=0..m pᵢy^(i)=0 with m≥1, holomorphic coefficients on a positive-radius disc and nowhere-zero p_m, every initial jet c₀,…,c_(m−1) admits a unique solution on that disc. The restricted solution space has dimension m. (B08, §2.1, p.8, §2.2, Thm. 2.2.1, p.9.)

Use `PowerSeries.derivative`; `Polynomial.coeToPowerSeries.ringHom`; `HasFPowerSeriesOnBall`, `AnalyticOnNhd`; `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

### 5.2 E-functions and G-functions

Define `IsEFunction a` by algebraic coefficients a_n, D-finiteness of Σa_nzⁿ/n! over ℚ̄, geometric conjugate bounds |σa_n|≤C^(n+1), and common positive integral multipliers d_n≤D^(n+1) for a₀,…,a_n. Its analytic sum `eFun a` is entire. This uses geometric coefficient growth. (Fischler–Rivoal, Def. 1, p. 1; B08, §3.1, p. 11.)

Its API includes `ePowerSeries`: The power series Σ a_n zⁿ/n!; `eFun`: The entire function z ↦ Σ a_n zⁿ/n!; `hurwitzMul`: The binomial convolution, so that ePowerSeries (hurwitzMul a b)=ePowerSeries a · ePowerSeries b; `ePowerSeries_hurwitzMul`: ePowerSeries (hurwitzMul a b)=ePowerSeries a * ePowerSeries b; `IsEFunction.add`: Sums of E-functions are E-functions; `IsEFunction.hurwitzMul`: Products of E-functions are E-functions; `IsEFunction.shift`: The derivative (shifted coefficients) of an E-function is an E-function; `IsEFunction.map_ringEquiv`: Applying a ring automorphism σ of ℂ to the coefficients gives an E-function (the Galois conjugate f^σ); `IsEFunction.differentiable`: eFun a is entire; `IsEFunction.hasSum`: The series Σ a_n zⁿ/n! converges to eFun a z for every z; `IsEFunction.exists_numberField`: All coefficients lie in one number field.

**Checks.**

- The constant sequence 1 (the exponential) is an E-function.
- a_n=n − 1 ((z − 1)eᶻ) is an E-function.
- e^{z²} (a_{2k}=(2k)!/k!, a_{odd}=0) is not an E-function in this normalisation; Siegel's (n!)^ε definition would also reject it, but a definition bounding |a_n/n!| instead of |a_n| would accept it.
- a_n=n! (the series 1/(1 − z)) is not an E-function; forgetting the factorial normalisation would accept it.

*Needs:* §5.1.

Define `IsGFunction a` by the same algebraic, conjugate and denominator bounds, with D-finiteness of Σa_nzⁿ. Equivalently this ordinary series is G iff its factorial-divided series is E. It has positive convergence radius. (B08, §4.1, p. 18; Fischler–Rivoal, Def. 1, p. 2.)

Its API includes `isGFunction_iff_isEFunction`: IsGFunction a↔IsEFunction a (Borel transform); `IsGFunction.add`: Sums of G-functions; `IsGFunction.mul`: Cauchy products of G-functions; `IsGFunction.hasRadius`: A G-function converges on a disc of positive radius.

**Checks.**

- Σ_{n≥1} zⁿ/n=−log(1 − z) is a G-function.
- Σ zⁿ (a_n=1) is a G-function.
- a_n=1/n! is not a G-function (its denominators n! grow faster than Dⁿ); a definition without the denominator condition would accept exp.
- Σ zⁿ is a G-function exactly when Σ zⁿ/n!=eᶻ is an E-function.

*Needs:* §5.1.

The coefficient adapters `ePowerSeries`, `eFun` and `hurwitzMul` retain the factorial normalization explicitly. Their APIs compute coefficients, zero data and constants, identify the entire sum with its formal Taylor series for E-data, and prove that Hurwitz convolution gives the product of the factorial-divided series and analytic sums. No convergence claim is made for arbitrary coefficient sequences. (B08, §3.1, Prop. 3.2.1, pp. 11–12.)

**Checks for factorial-divided series.**

- Constant data a_n=1 give the native formal exponential, with coefficient at n=2 equal to 1/2.
- Zero data give zero.
- The sequence supported at n=2 with value 1 gives z²/2, excluding an ordinary-series adapter.

**Checks for analytic sums.**

- Constant data a_n=1 sum to exp z.
- Data supported at n=1 with value 1 sum to z, and data supported at n=0 with value c sum to c.
- Zero data sum to zero for every z.

**Checks for Hurwitz multiplication.**

- Multiplying two constant-one sequences gives 2^n, the coefficients of exp(2z).
- Multiplication by zero data gives zero data.
- Multiplying the two sequences supported at n=1 gives value 2 at n=2; ordinary convolution would give 1.

E-functions are closed under addition, the Hurwitz coefficient product and shift a_n↦a_(n+1), representing analytic multiplication and differentiation. (B08, Prop. 3.2.1, p. 12.)

*Needs:* §5.1.

If T F′=M F with polynomial T,M, every vector of fixed-degree monomials f^e, |e|=N, satisfies T(f^e)′=Σe′ M′_e,e′f^e′ with polynomial M′. Its singularities lie among the zeros of T. E-function coordinates give E-function monomials. (B06, Thm. 1.3, p. 8.)

For rational E-coefficients a with f(1)=0, the entire quotient f(z)/(1−z) is E, with coefficients b_n=n!Σk≤n a_k/k!. (B06, Corollary 2.2, pp. 3-4; B08, Corollary 3.4.2, p. 15.)

For an E-function f=eFun a and the G-series g=Σa_nzⁿ, sufficiently large real x satisfies ∫₀∞exp(−xt)f(t)dt=x⁻¹g(x⁻¹). For u=t^mf, its kth derivative has Laplace transform x^k(−d/dx)^m[x⁻¹g(x⁻¹)]−Σj<k x^(k−1−j)u^(j)(0). For a polynomial differential operator L=Σ_{m,k}c_{m,k}t^m∂_t^k, define `formalLaplaceOperatorTransfer L` as Σ_{m,k}c_{m,k}(−∂_x)^m∘M_x^k acting on formal Laurent series at infinity, where M_x denotes multiplication by x. In the native Laurent coordinate X use x=X⁻¹ and ∂_x=−X²∂_X. Its API preserves addition, scalar multiplication and operator composition, and computes the two generators t↦−∂_x and ∂_t↦M_x. The analytic comparison for E-data is ℒ(Lf)=formalLaplaceOperatorTransfer(L)(ℒf)−Σ_{m,k}c_{m,k}(−∂_x)^m[Σ_{j<k}x^(k−1−j)f^(j)(0)], for sufficiently large real x. Thus the initial-value correction is part of the comparison. (B08, §5.4, p. 25, the Laplace-transform computation with the boundary terms retained.)

**Checks for the operator transfer.**

- The zero operator maps to zero, and the identity operator maps to the identity.
- For f(t)=e^t, g(x)=1/(x−1): ℒ(tf)=−g′=1/(x−1)², while ℒ(f′)=xg−1=g. Omitting the initial value f(0)=1 fails the second identity.
- The relation ∂_t t−t∂_t=1 maps to M_x(−∂_x)−(−∂_x)M_x=1. Reversing the sign of the transferred multiplication operator gives −1 instead.

Use `IsAlgebraic`, `minpoly`, `IsIntegral`; `Polynomial.aroots`; `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`.

### 5.3 Differential systems and Galochkin denominators

Define `SolvesSystem T M F` on polynomial T, a finite square polynomial matrix M and a vector F of formal complex power series by TF_i′=Σ_jM_ijF_j. Its API proves closure under constant linear combinations of vector solutions for the same T,M, the component equations, multiplication of both T and M by a nonzero polynomial, and compatibility with the analytic differential equation wherever the series converge and T does not vanish. Every theorem interpreting this as F′=(M/T)F assumes T≠0. (B08, §2.2, p. 9; §4.4, p. 20.)

**Checks.**

- Formal exp solves the scalar system T=1,M=1.
- The same series fails T=1,M=0; constant series solve that system.
- T=M=0 makes the displayed relation hold for every F and supplies no differential equation, so T≠0 cannot be dropped from system interpretations.
- In dimension zero the vector equation is empty, with its unique empty solution.

Define `scaledDividedSystemIterates T M` by P₀=I and P_(m+1)=(T P′_m+P_mM−mT′P_m)/(m+1), with entrywise derivatives. For T≠0 and G=M/T these polynomial matrices equal T^m B_m, where y^(m)/m!=B_my. (B08, §4.4, p.20, §5.2, Lem. 5.2.1, p.22.)

Its API includes `scaledDividedSystemIterates_zero`: P₀=I; `scaledDividedSystemIterates_succ`: (m+1)P_{m+1}=T P′_m + P_m M − m T′ P_m; `scaledDividedSystemIterates_congr`: Equal T and M give equal iterate families; `scaledDividedSystemIterates_geometric`: For the scalar system T=1−z, M=1, every P_m=1.

**Checks.**

- For T=1−X and the 1×1 matrix M=1, P_m=1 for every m.
- For T=M=1 in size 1, P₂=1/2. This catches omitted factorial normalisation.
- For T=1 and M=0, P₀=I and P_{m+1}=0 for every m.

Define `GalochkinCondition T M` by T≠0 and existence of C>0 such that for every s≥1 a positive integer q≤C^s makes every coefficient of qP_m, m≤s, integral. Positive integral multipliers form an integer ideal, giving equivalence with the least-positive-denominator formulation. (B08, §4.4, p.20, §5.2, Lem. 5.2.1, p.22.)

Its API includes `GalochkinCondition.ne_zero`: T≠0; `GalochkinCondition.exists_integral_multiplier`: Extract C and the positive integer multiplier at each s≥1; `galochkinCondition_congr`: Equal T,M give equivalent conditions; `galochkinCondition_geometric`: The scalar system y′=y/(1−z) satisfies the condition with q=1.

**Checks.**

- GalochkinCondition (1−X) (1×1 identity matrix), with P_m=1 and q_s=1.
- ¬ GalochkinCondition 1 (1×1 identity matrix): q_s=s! grows faster than C^s.
- GalochkinCondition 1 (zero matrix), with q_s=1.
- ¬ GalochkinCondition 0 M for every M.

For a ℚ̄(z)-independent G-function solution of y′=Gy and nonzero T with integral polynomial T and M=TG, put P_m=T^m B_m where y^(m)/m!=B_my. The least positive integral multiplier q_s of every P_m, m≤s, satisfies q_s≤C^s for s≥1. Divide the unnormalized iterate by m! exactly once. (B08, Thm. 4.4.3, p. 20, §5.2, pp. 21-22; B08, §4.4, Def. 4.4.1, p.20, §5.2, Lem. 5.2.1, p.22.)

*Needs:* §5.4; §5.2.

For a nonzero G-function of minimal order n over ℚ̄(z), a polynomial equation Σpᵢg^(i)=0 over ℚ̄[z] with p_n≠0 at that order is regular or regular singular at 0: ord₀(p_n)−ord₀(pᵢ)≤n−i whenever pᵢ≠0. (B08, Thm. 5.1.2, Prop. 5.3.1, pp. 21-24.)

*Needs:* §5.1.

Use `Algebra.natDenominator_dvd_iff`; `NumberField.house.exists_ne_zero_int_vec_house_le`.

### 5.4 Specialisation and the Siegel–Shidlovskii method

For a finitely generated characteristic-zero field extension E/C, dim_E Ω_E/C=trdeg_C E, and the differentials of a transcendence basis form an E-basis. (Kirby, §3.3, proof of Thm. 3.8, p. 38, the dimension of Ω(E/C).)

Prove the fibre-comparison adapter `ringKrullDim_quotient_add_one_eq`: for a field K, a finite-type domain A over K[z], torsion-free over K[z], and ξ∈K with (z−ξ)A≠A, dim(A/(z−ξ)A)+1=dim A. For a domain fibre, its fraction field has transcendence degree dim A−1 over K. Use Mathlib’s `ringKrullDim_quotient_add_one_of_mem_nonZeroDivisors` and Tau Ceti’s `height_eq_ringKrullDim_of_isMaximal`; the new interface packages their hypotheses for this fibre. (Stacks, Tags [00KV](https://stacks.math.columbia.edu/tag/00KV), [00OR](https://stacks.math.columbia.edu/tag/00OR), [00OS](https://stacks.math.columbia.edu/tag/00OS).)

**Checks.**

- For A=K[z], the fibre at ξ is K, of dimension zero, and dim A=1.
- For A=K[z,z⁻¹], the fibre at zero is zero; the proper-ideal hypothesis excludes it.
- For A=K with z acting as zero, the fibre at zero is K and its dimension does not drop. This algebra is not torsion-free over K[z].

Let f′=Af over ℂ(z) with functionally independent coordinates, 0<ε<1 and polynomial Q,Pᵢ of degree ≤N, not all zero, satisfying Qf−P=O(z^(N+M)). For sufficiently large N and M>N(1−ε)/n, det(P,(D−A)P,…,(D−A)^(n−1)P)≠0. (B08, §6.2, Thm. 6.2.7, p.29.)

*Needs:* §5.1.

Let n≥1 and functionally independent f∈ℂ[[z]]ⁿ solve f′=Af over ℂ(z). For 0<ε<1 there is N₀ such that N≥N₀, nonzero polynomial vector P of degrees ≤N and ord₀(ΣPᵢfᵢ)≥(n−ε)N imply det(P,(D+Aᵗ)P,…,(D+Aᵗ)^(n−1)P)≠0. (B08, §6.2, Prop. 6.2.1, pp.26–28, Thm. 6.2.6, pp.28–29.)

*Needs:* §5.1.

Every E-function satisfies a nonzero equation z^m y^(m)+Σk<m z^kq_k(z)y^(k)=0 with q_k∈ℚ̄[z], deg q_k≤m−k; its only singularities are 0 and ∞. (B08, Thm. 3.4.1, p. 14, §5.4, p. 25.)

*Needs:* §5.2; §5.3.

At every z₀≠0, the minimal equation of an E-function has a full holomorphic solution basis. Its singularities away from 0 are therefore apparent. (B06, Thm. 2.1, p. 3.)

*Needs:* §5.1.

**Picard–Vessiot fields and analytic solutions.** This roadmap owns the
interfaces `picardVessiotAnalyticComparison` and `picardVessiotFixedField` used
in this subsection. For k=C(z), with C algebraically closed of characteristic
zero and derivation d/dz, construct a Picard–Vessiot ring for each finite
system Y′=AY: a simple differential k-algebra generated by a fundamental
matrix and its inverse determinant. Prove that it is a domain, that its fraction
field K has constants exactly C, and uniqueness up to differential k-isomorphism.
Realize its automorphism group as a finite-type reduced affine group using
[ReductiveGroups](../ReductiveGroups/README.md), Layers 0 and 3: consume
TauCeti.FiniteTypeCommHopfAlgCat, its identityComponent and componentGroupScheme
from the connected-group and component-group modules. These provide the group
carriers, identity-component inclusion and finite component quotient; the
Picard–Vessiot realization and the restriction theorem below are owned here.
Its differential automorphism group G is a linear algebraic group acting
faithfully on the n-dimensional C-solution space. Prove the closed-subgroup/fixed-field
correspondence, K^G=k, and K^(G⁰) equal to the relative algebraic closure of k
in K, a finite Galois extension with group G/G⁰. For C=ℂ, realize K inside
meromorphic germs at an ordinary point using a fundamental analytic solution
matrix. Analytic transport along paths preserves differential and algebraic relations.
For finite algebraic subextensions of ℂ(z), path transport realizes every
Galois conjugate. Prove that scalar minimal orders for algebraic-coefficient
series agree over ℚ̄(z) and ℂ(z), and that at an algebraic point with a full
holomorphic solution basis, the convergent ℚ̄[[z−ξ]] solution space extends
by scalars to the complex analytic-germ space. Coefficient conjugation thus
transports this space and its evaluation kernel. (Singer, §1.3, Definition
1.3.2, Proposition 1.3.6, Theorem 1.3.9, Corollary 1.3.10 and the monodromy
construction preceding Definition 1.3.24, pp.10–14,18–19; B06, Lemma 2.3
and Theorem 2.5, pp.4–6.) *Needs:* §5.1 scalar equations and analytic local
solutions; §5.2 coefficient-field comparison; Mathlib fields, derivations,
matrix groups and algebraic closure; ReductiveGroups Layers 0 and 3. These Picard–Vessiot and analytic path-transport
constructions are targets here, distinct from Kähler differential rank.

**Checks.**

- For y′=y over ℂ(z), K=ℂ(z,e^z) has constants ℂ and G=G_m; analytic monodromy is trivial although G is nontrivial.
- For 2zy′=y, K=ℂ(z,√z), G has order two and G⁰ is trivial; its fixed field is all of K, a finite algebraic extension of the base.
- For y′=0, adjoining an independent constant would enlarge the constant field and is excluded by the Picard–Vessiot construction.
- At an ordinary algebraic point, algebraic initial data give algebraic Taylor coefficients; coefficient conjugation preserves the evaluation kernel without acting on arbitrary analytic functions.

**Identity-component orbit spanning.** Prove `eFunction_identityOrbit_span`:
for a nonzero E-function f and its minimal scalar equation L over ℂ(z) of
order n, the ℂ-span of G⁰·f in a Picard–Vessiot solution space is the whole
n-dimensional space. Construct the monic Wronskian equation of order m for
the orbit span. Its coefficients lie in K^(G⁰). Continue the resulting
relation along paths realizing all automorphisms of this finite Galois
extension; f is entire and returns to itself. Averaging these monic relations
gives an order-m equation over ℂ(z), so minimality forces m=n. Export the
same spanning statement for a vector E-function solution whose coordinates
are ℂ(z)-linearly independent, as used in desingularization.
(B06, Lemma 2.3, pp.4–5, and proof of Theorem 1.5, pp.8–9.)
*Needs:* `picardVessiotFixedField`, `picardVessiotAnalyticComparison`,
Wronskians and §5.2 entireness; no division at a general algebraic zero.

**Checks.**

- For exp z the nonzero G_m-orbit spans the one-dimensional solution space.
- For (z−1)e^z the orbit spans the scalar solution space, and every orbit element vanishes at 1.
- For the multivalued solution 1+√z, its minimal order is two, but the trivial identity component has a one-dimensional orbit span; entireness cannot be omitted from this descent argument.

**Conjugate composita and vanishing transfer.** Prove
`picardVessiotConjugateCompositum`: embed the Picard–Vessiot fields of the
finitely many coefficient-conjugate equations L^σ into a common meromorphic-germ
field at an ordinary point. Their differential compositum is the Picard–Vessiot
field of the direct-sum system, with constants ℂ. Restriction embeds its
algebraic group H into ∏G_σ and is surjective onto each G_σ. Prove
`identityComponent_projection_surjective`: a surjective morphism of linear
algebraic groups over an algebraically closed characteristic-zero field maps
H⁰ onto G_σ⁰. Prove closedness of the algebraic group image using
constructibility and translations; the finite component quotient makes the
image of H⁰ a finite-index closed subgroup of G_σ⁰, hence the whole connected
group. For these reduced groups in characteristic zero, smoothness and
translation of irreducible components make H⁰ irreducible. Thus a finite
cover by Zariski-closed subsets contains a subset equal to H⁰.

For f(1)=0, form the nonzero rational-coefficient E-function
F=∏_σ f^σ using a finite Galois coefficient field and §5.2 Hurwitz products.
Every H-image of F solves its minimal equation. If all these images vanish
at 1, define V_σ as the holomorphic local solution space and W_σ as its
evaluation kernel. The closed sets
{h∈H⁰ : π_σ(h)f^σ∈W_σ} cover H⁰, so one is all of H⁰.
Surjectivity and `eFunction_identityOrbit_span` give W_σ=V_σ for one σ;
the algebraic-coefficient local-space comparison then transports this equality
to the original equation. This is `eFunction_conjugate_zero_transfer`.
(B06, Lemma 2.4 and proof of Theorem 2.5, pp.5–6; Singer, §1.3,
Theorem 1.3.9, pp.13–14.) *Needs:* the preceding Picard–Vessiot,
analytic path-transport and orbit targets; §5.2 conjugation and Hurwitz multiplication;
the rational zero theorem below supplies the vanishing of H·F.

**Checks.**

- Two copies of y′=y have diagonal compositum group G_m, not G_m×G_m; both restriction projections are nevertheless surjective.
- For F=(z−1)e^z and its rational coefficient field there is one factor; the closed evaluation kernel contains its entire orbit.
- The disconnected group μ₂ is the union of two proper closed points; the finite-cover argument uses the irreducible identity component, not the whole group.

Prove `eFunction_rational_minimal_equation_zero`: for a nonzero E-function
with rational Taylor coefficients and f(1)=0, every holomorphic local solution
of its minimal equation vanishes at 1, an apparent singularity. Use the
rational-coefficient `isEFunction_div_one_sub` of §5.3 and André's holomorphic
basis theorem above; this rational division proof bounds tails and denominators
directly. (B06, Corollary 2.2, pp.3–4.)

*Needs:* §5.3 rational division; §5.2; André's theorem above.

Prove `eFunction_minimal_equation_zero`: for a nonzero E-function with
f(ξ)=0, ξ∈ℚ̄×, every holomorphic local solution of its minimal equation
vanishes at ξ, an apparent singularity. Scale z by ξ, apply the rational
zero theorem to the conjugate product, and use `eFunction_conjugate_zero_transfer`.
(B06, Lemma 2.3, Lemma 2.4, Theorem 2.5, pp.4–6.)

**Checks.**

- For (z−1)e^z, the minimal equation is (z−1)y′−zy=0 and all holomorphic local solutions vanish at 1.
- The entire function sin(z−1) solves y″+y=0 and vanishes at 1, while cos(z−1) solves the same equation and equals 1 there. Its minimal order over ℂ(z) is two since cot(z−1) has infinitely many poles and cannot be rational; this ordinary analytic example is excluded by the E-function hypotheses.
- The point ξ=0 is excluded: sin z is an E-function vanishing there but cos z is a solution of its minimal equation with value 1.

*Needs:* the rational zero theorem, the three differential-Galois targets above,
§5.2 algebraic scaling and conjugation, and André's holomorphic local bases.

For algebraically closed K⊂ℂ and series of K(z)-span dimension m, their polynomial-relation module has a K[z]-basis C₁,…,C_(n−m) whose specializations are linearly independent at every ξ∈K. The typed case K=ℂ and the general `relationBasisSpecialisation` are separate signatures. (B06, Lem. 3.1, p. 6.)

For E-functions solving T f′=M f over ℚ̄[z] and ξ∈ℚ̄ with ξT(ξ)≠0, every ℚ̄-linear relation among fᵢ(ξ) lifts to a polynomial relation Σcᵢ(z)fᵢ(z)=0 with cᵢ(ξ)=λᵢ. Functional independence therefore gives independence of values. (B06, Thm. 3.2, p. 6, and Corollary 1.4, p. 3.)

*Needs:* `eFunction_minimal_equation_zero`, `relationBasisSpecialisation`,
§5.1 ordinary-point initial data and polynomial jet interpolation; §5.2.

Under those hypotheses, every homogeneous P∈ℚ̄[X] vanishing at f(ξ) lifts to Q∈ℚ̄[z][X] of the same X-degree, with Q(z,f(z))=0 and Q(ξ,X)=P. Adding f₀=1 gives the nonhomogeneous version. (B06, Thm. 1.2, Thm. 1.3, p. 2.)

*Needs:* `beukers_linear_relation` and `isEFunction_monomials_solveSystem` of §5.2.

Under those hypotheses, trdeg_ℚ̄ ℚ̄(f(ξ))=trdeg_ℚ̄(z) ℚ̄(z)(f(z)), equivalently the functional transcendence degree over ℂ(z). (B06, Thm. 1.1, p. 2; André, §1.7, Corollary 1.7.1, pp. 6–7.)

*Needs:* §5.1; §5.2.

For an E-function and ξ∈ℚ̄× with f(ξ)=0, the entire quotient f(z)/(z−ξ) is E. (B06, Prop. 4.1, p. 8.)

*Needs:* `eFunction_minimal_equation_zero`, coefficient conjugation and
§5.3 rational tail estimates; §5.2. Vanishing for every conjugate at the
scaled point supplies uniform conjugate bounds for the quotient coefficients.

A functionally independent E-function system over ℚ̄(z) has f=B e, with E-functions e, polynomial B over ℚ̄, det B≠0, and a system for e over ℚ̄[z,1/z]. (B06, Thm. 1.5, p. 3, §4, pp. 8-9.)

*Needs:* `eFunction_identityOrbit_span`, André's holomorphic bases,
`eFunction_minimal_equation_zero`, `isEFunction_div_linear`, and the
following gauge adapter. The determinant vanishing order drops at each
linear-factor division, so the removal terminates.

**Gauge transformation.** Prove `solvesSystem_gauge_transform`: if F=B E,
F′=A F and B is invertible over ℂ(z), then
E′=(B⁻¹AB−B⁻¹B′)E. The analytic signature carries differentiability and
invertibility at its evaluation point. In `beukers_removal_of_singularities`,
use B over ℚ̄[z] with det B≠0; the transformed matrix has entries in
ℚ̄[z,1/z]. Its coefficient-field conclusion accompanies the E-function
and polynomial-factor conclusions. (B06, proof of Theorem 1.5, pp.8–9;
Mathlib derivative product rule and matrix inverse identities.)

**Checks.**

- For B=z−1 and A=1+1/(z−1), the transformed scalar coefficient is 1 away from 1; it extends to 1 there.
- For constant B the B′ term is zero and the transformation is conjugation by B.
- For B=1 both the system and coefficient matrix are unchanged; at det B=0 the pointwise inverse formula is not asserted.

Apply the E-function theorem to distinct algebraic exponents βᵢ: exp βᵢ are ℚ̄-linearly independent. (B08, §3.3, Thm. 3.3.2, p. 13.)

*Needs:* §3.2; §3.4.

For rational G-functions functionally independent over ℚ̄(z) and solving a rational differential system, some C>0 makes their values at a/b ℚ-independent whenever integers a≠0,b>0 satisfy b>C|a|^(n+1). (B08, Thm. 4.4.2, p. 20.)

*Needs:* §5.3.

Use `KaehlerDifferential`, `exists_isTranscendenceBasis`, `ringKrullDim`, `exists_integral_inj_algHom_of_fg`; `KaehlerDifferential`: `mvPolynomialBasis`, `isLocalizedModule`, `tensorKaehlerEquivOfFormallyEtale`; `Algebra.FormallyEtale.of_isSeparable`; `Algebra.IsAlgebraic.isSeparable_of_perfectField`; `Algebra.trdeg`; `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`; `MvPolynomial.ringKrullDim_of_isNoetherianRing`; `Submodule.span`; `Polynomial.coeToPowerSeries.ringHom`; `NumberField.house.exists_ne_zero_int_vec_house_le`.

### 5.5 Mahler systems and their values

Define `IsMahlerFunction` as follows. For integer q≥2 define `IsMahlerFunction q f` for a series with algebraic coefficients by Σi=0..n pᵢ(z)f(z^(qⁱ))=0 for nonzero polynomial data over ℚ̄. Equivalently f is a coordinate of F(z)=A(z)F(z^q), A∈GL_m(ℚ̄(z)). Use Mathlib’s `PowerSeries.expand r hr` for f(z^r), with hr:r≠0; its `expand_apply` identifies it with formal substitution by X^r. (AF17, §1, equation (1.1), p. 2; AF17, §1, p. 2.)

Its API includes `IsMahlerFunction.add`: Sums of q-Mahler functions are q-Mahler; `IsMahlerFunction.mul`: Products of q-Mahler functions are q-Mahler; `IsMahlerFunction.expand`: f(z^q) is q-Mahler if f is; `isMahlerFunction_of_polynomial`: Polynomials with algebraic coefficients are q-Mahler; `isMahlerFunction_iff_system`: f is q-Mahler iff it is the first coordinate of a solution of F(z)=A(z)F(z^q) with A invertible over ℂ(z) (and algebraic entries).

**Checks.**

- Σ z^{2^n} is 2-Mahler.
- A series with f=(1 − z)f(z²) and algebraic coefficients is 2-Mahler.
- For q≥2, exp is not q-Mahler: the functions exp(z^{q^i}) with distinct exponents have no nontrivial polynomial-coefficient linear relation. A predicate allowing arbitrary power-series coefficient relations would fail this test.
- z is q-Mahler (z^q·z − z·z^q=0 is trivial; use p₀=z^q, p₁=−z).
- A constant series with transcendental value c is not a Mahler function in this algebraic-coefficient convention, although it solves the one-dimensional identity system A=1. The system equivalence must retain the algebraic coefficients of F and A and q≥2.

Define `IsMahlerRegularPoint` as follows. Define `IsMahlerRegularPoint q A α` for a square matrix A over ℂ(z) by q≥2, det A≠0, 0<|α|<1 and absence of poles of entries of both A and A⁻¹ at every α^(q^ℓ), ℓ≥0. Poles use reduced rational denominators. Singularities have no accumulation in the open unit disc. (AF17, §1, p. 2.)

Its API includes `isMahlerRegularPoint_iff`: Unfolding: q≥2, det A≠0, 0 < |α| < 1 and no α^{q^ℓ} is a zero of the denominator of an entry of A or A⁻¹; `IsMahlerRegularPoint.pow`: α regular implies α^q regular; `isMahlerRegularPoint_of_polynomial`: For q≥2 and polynomial A with unit determinant every α in the punctured disc is regular.

**Checks.**

- For q≥2 and A=[[1, 0], [z, 1]] every 0 < |α| < 1 is regular.
- For A=(1 − 2z)⁻¹, α=2^{−1/2} is not regular; a definition testing only ℓ=0 would call it regular.
- For q≥2, the 0 × 0 system has determinant 1 and every point of the punctured disc is regular.
- The scalar zero matrix is not a regular system at 1/2, although all reduced entry denominators of A and its total inverse are 1. Testing denominators alone must not accept a singular matrix.
- For q=1 the identity matrix at 1/2 fails the q≥2 condition.

For series with algebraic coefficients, algebraic independence over ℂ(z) is equivalent to absence of a nonzero polynomial relation over ℚ̄[z]. Their functional transcendence degrees over ℂ(z) and ℚ̄(z) agree. (B08, Thm. 3.3.1, p. 13.)

For q≥2, algebraic-coefficient series convergent in |z|<ρ and solving F(z)=A(z)F(z^q) over ℚ̄(z), a regular algebraic α with 0<|α|<min(1,ρ) has trdeg_ℚ̄ ℚ̄(F(α))=trdeg_ℚ̄(z) ℚ̄(z)(F). (AF17, Thm. 1.1, p. 3.)

For such a system convergent in the unit disc and regular algebraic α, every homogeneous polynomial relation P(F(α))=0 lifts to Q∈ℚ̄[z][X] of the same X-degree, with Q(z,F(z))=0 and Q(α,X)=P. (AF17, Thm. 1.4, pp. 3-4.)

At those points the linear relations among values are exactly evaluations of polynomial functional relations. Rational relation vectors may be evaluated only when their entries are regular at α. Functional independence gives value independence. (AF17, Corollary 1.5, p. 4.)

For a q-Mahler function, algebraic α with 0<|α|<1 at which the function has no pole, and a number field k containing the coefficients and α, its value is transcendental or belongs to k. For several functions, dependence of values over ℚ̄ implies dependence over k. (AF17, Corollary 1.8, p. 5.)

The series Σn≥0 z^(2ⁿ) is not rational: no r≠0 and p in ℂ[z] satisfy rΣz^(2ⁿ)=p in ℂ[[z]]. (AF17, §1, p. 2.)

For algebraic α with 0<|α|<1, Σn≥0 α^(2ⁿ) is transcendental. (AF17, §1, p. 2.)

Use `IsAlgebraic`, `RatFunc`, `AlgebraicIndependent`, `LaurentSeries`; `PowerSeries.expand`, `PowerSeries.expand_apply`, `PowerSeries.coeff_expand`; `Polynomial.coeToPowerSeries.ringHom`; `RatFunc.denom`; `PowerSeries.coeff_mul`.

### 5.6 Modular values and Ax–Schanuel

The arithmetic modular-values branch uses the following chain, built here on
Mathlib's normalized Eisenstein series. The functional Ax–Schanuel branch is
independent of this chain.

**Ramanujan equations and coefficient bounds.** Define `modularQSeries` Φ(q)
=(q,E₂(q),E₄(q),E₆(q)) on |q|<1 by the q-expansions with constant term 1
and coefficients −24σ₁,240σ₃,−504σ₅. Prove `modularQSeries_eq`, equality with the library
series under q=exp(2πiτ). Build `ramanujanQEquations`:
θE₂=(E₂²−E₄)/12, θE₄=(E₂E₄−E₆)/3,
θE₆=(E₂E₆−E₄²)/2, θ=q d/dq. Prove integrality and polynomial
coefficient growth from σ_j(m)≤m^(j+1); derive coefficient bounds for
q^a E₂^b E₄^c E₆^e with a+b+c+e≤d on each closed disc of radius <1.
This q-expansion and convolution bridge is owned here; modular transformation
laws are consumed from Mathlib/ModularForms. (Ramanujan, *On certain
arithmetical functions*, §1 (1.1)–(1.3); Fonseca §1 equations (R), §3.3
Lemma 3.19 and its proof, pp.1,17.)

**Checks.**

- The first coefficients are E₂=1−24q+…, E₄=1+240q+…, E₆=1−504q+….
- Each Ramanujan equation has zero constant term; the first equation has coefficient −24 at q, including its denominator 12.
- The derivative with respect to τ is 2πi θ, so an equation using d/dτ without this factor is excluded.

**D-property and the modular zero estimate.** Build `ramanujanDProperty` for
w=x₀∂₀+(x₁²−x₂)∂₁/12+(x₁x₂−x₃)∂₂/3+(x₁x₃−x₂²)∂₃/2
and Φ. Prove the functional algebraic independence via Mahler's j-equation,
then classify w-invariant irreducible subvarieties through (0,1,1,1): each
proper one lies in x₀=0 or x₂³−x₃²=0. Polynomial ideal stability and
Bézout/dimension arguments are targets here, using Mathlib ideals and the
finite-type dimension supplier; no arithmetic specialization follows merely
from functional independence. Define the D-property as a uniform bound c
on the order along Φ of a nonzero polynomial vanishing on each invariant
proper irreducible subvariety. Build the cycle-intersection proof of the
zero lemma, then `modularZeroEstimate`: there is C>0 such that every
nonzero P∈ℂ[x₀,…,x₃] has ord₀(P∘Φ)≤C(deg P)^4. Nonzero constants
have order 0. (Fonseca §3.1 Theorem 3.9, §3.2 Proposition 3.13,
Theorem 3.17 and Corollary 3.18, pp.10–16; Nesterenko–Philippon,
Chapter 3, §§2–3.) *Needs:* `ramanujanQEquations`, Mathlib analytic
orders, ideals and dimension; the invariant-ideal and cycle estimates above.

**Checks.**

- x₀∘Φ=q has order 1.
- (x₂³−x₃²)∘Φ=1728q+… has order 1, giving the D-property test on the discriminant locus.
- A nonzero constant has degree and order 0, while P=0 is excluded because its order is infinite.

**Controlled auxiliary polynomials and independence.** Prove
`modularAuxiliaryPolynomial`: for all large d there is nonzero integral P_d
with deg P_d≤d, log coefficient sup norm ≤C d log d and
c d^4≤ord₀(P_d∘Φ)≤C' d^4, with c>0. Impose vanishing of
M=⌊N/2⌋ initial coefficients on N=binom(d+4,4) unknown coefficients.
Then N−M≥N/2 and M/(N−M)≤1, while M≥d^4/48−1.
For all large d, M≥d^4/96; choose c=1/96 and increase the large-d threshold.
For matrix entries bounded by B≥1, the convolution bound at indices <M=O(d^4)
gives log B≤C₁d log d: each of at most d Eisenstein factors has coefficient
O(M^6), and the number of convolution terms is at most (M+1)^d.
Apply the integer Siegel estimate in `modularSiegelHalfNullity`:
‖v‖∞≤2(2NB)^{M/(N−M)}, hence
log‖v‖∞≤log 2+log(2NB)=O(d log d).
The shared estimate with (3NB)^{M/(N−M)} also has this order.
The nonzero integral kernel vector gives P_d and `modularZeroEstimate` gives
its upper order bound.
Prove `modularValueDerivativeSelection`: for fixed 0<|z|<1 one can choose
k_d=O(d log d) with −αm_d≤log|(P_d∘Φ)^(k_d)(z)|≤−βm_d,
α>β>0 and m_d=ord₀(P_d∘Φ). Its proof uses integral nonzero initial
coefficients, Schwarz/Cauchy interpolation and the explicit parameter estimates
of Nesterenko–Philippon Chapter 3 Lemma 3.3. Define the integral operator
w^[k]=12^k w(w−1)…(w−k+1), prove its coefficients integral and
Q_d=w^[k_d]P_d has degree at most d+k_d=O(d log d). Iterating the
quadratic vector field adds at most O(k_d log(d+k_d)+k_d log k_d) to the
logarithmic coefficient bound, giving log sup norm O(d(log d)^2).
Since Q_d∘Φ=(12q)^k_d (P_d∘Φ)^(k_d), the added term
k_d log|12z| is O(d log d), of either sign, and is absorbed in positive
constants in −a d^4≤log|Q_d(Φ(z))|≤−b d^4. Prove
`modularValueIndependenceCriterion`, the r=4 case of Philippon's
polynomial-sequence criterion, with degree O(d log d), logarithmic coefficient
height O(d(log d)^2), and −a d^4≤log|Q_d(Φ(z))|≤−b d^4, a>b>0.
These satisfy the hypotheses of Fonseca Theorem 2.8 with r=4,
yielding trdeg_ℚ ℚ(Φ(z))≥3. (Fonseca §2.2 Theorem 2.8, §3.3 Lemmas
3.19–3.22, pp.5,17–18; Nesterenko–Philippon Chapter 3 Lemma 3.3;
Philippon, *Critères pour l'indépendance algébrique*, Theorem 1, pp.5–52.)
*Needs:* coefficient bounds, `modularZeroEstimate`, ArithmeticHeights
integer Siegel and polynomial heights, the shared complex interpolation engine.

**Checks.**

- With N=binom(d+4,4) and M=⌊N/2⌋, N−M≥N/2 and M/(N−M)≤1; merely M<N does not bound the Siegel exponent.
- For d=2, N=15 and M=7 give nullity at least 8 and exponent 7/8. For d≥4 the bound M≥d^4/96 holds, including the floor error.
- The near-square choice M=⌊d^4/24⌋ has M/(N−M) asymptotic to d/10 and yields only O(d² log d) from this coefficient estimate.
- For k=2, w^[2]=144w(w−1); this is a falling factorial in w, not 144w².
- At a nonzero z with |12z|>1 the transfer increases the logarithmic absolute value; the O(d log d) error still has lower order than d^4.
- At τ=i the final theorem, E₂(i)=3/π and E₆(i)=0 yield algebraic independence of π and exp π. The nonzero condition excludes q=0, where Φ(0)=(0,1,1,1) is algebraic.

For τ in the upper half-plane and q=exp(2πiτ), at least three of q,E₂(τ),E₄(τ),E₆(τ) are algebraically independent over ℚ. Use constant term 1 and coefficients −24σ₁,240σ₃,−504σ₅ respectively. *Needs:* the preceding modular-values chain. (Waldschmidt, periods, §3, the unnumbered Nesterenko statement after (18), p. 443.)

At τ=i, E₂(i)=3/π, E₆(i)=0 and q(i)=exp(−2π). (Waldschmidt, periods, §3, specialization following (18), p. 444.)

Prove algebraic independence of π and exp π over ℚ. (Waldschmidt, periods, §3, Thm. 17, p. 443.)

For characteristic-zero fields C⊆F set Ω^r=∧^r_F Ω_F/C. Build `algebraicExteriorDifferential` d of degree +1 with d²=0 and d(ωη)=dω·η+(−1)^rω·dη for homogeneous ω of degree r. Its API gives C-linearity, d(a)=da, d(db)=0 and d(a db)=da∧db. Use the native contraction i_D by D’s Kähler dual, of degree −1. Prove `algebraicCartanDegreeShift`: d raises and i_D lowers degree, and L_D=i_Dd+di_D preserves it. Define `lieDerivativeOneForm D` as the unique C-linear operator with L_D(a db)=D(a)db+a d(Db). Its API proves `lieDerivativeOneForm_smul_D`, `lieDerivativeOneForm_smul` (L_D(aω)=D(a)ω+aL_Dω), and `lieDerivativeOneForm_evaluate`: (L_Dω)(D′)=D(ω(D′))−ω([D,D′]). In particular d(dy/y−dx)=0. (Kirby, §3.3, Lem. 3.2, pp. 30–31.) *Needs:* Mathlib Kähler universality, exterior algebra and derivation bracket.

**Checks.**

- d(1)=0.
- d(t)=dt for t∈F; a scalar cannot retain degree zero.
- d(t du)=dt∧du=−d(u dt), fixing the alternating sign.
- D=0 gives L_Dω=0 for every ω.
- On C(t) with D(t)=1, L_D(t dt)=dt≠tL_D(dt)=0, excluding F-linearity.
- For D(t)=t, L_D(t dt)=2t dt; both differentiated factors contribute.
- For D(t)=1 and D′(t)=t, D(D′t)=[D,D′]t=1, so (L_D dt)(D′)=1−1=0.

For a characteristic-zero field F with derivations Dⱼ and C=⋂ker Dⱼ, suppose yᵢ≠0 and Dⱼxᵢ=Dⱼyᵢ/yᵢ. Set ωᵢ=dyᵢ/yᵢ−dxᵢ∈Ω_F/C. F-linear dependence of these forms implies C-linear dependence. (Kirby, §3.3, Prop. 3.7, pp. 35-36.)

In that setting a nonzero constant relation Σcᵢωᵢ=0 gives a nonzero integer tuple z with Σzᵢxᵢ∈C. (Kirby, §3.3, Lem. 3.6, Prop. 3.7, pp. 35-37.)

If additionally xᵢ are ℚ-independent modulo C, then trdeg_C C(x,y)≥n+rank(Dⱼxᵢ). For one derivation and some D xᵢ≠0 this is ≥n+1. The arbitrary-constant-field theorem is `axSchanuelGeneralConstants`. (Kirby, §1.1, Thm. 1.1, p. 2; Kirby, §3.3, Thm. 3.8, p. 37.)

*Needs:* §5.4.

For multivariate formal series fᵢ∈ℂ[[t₁,…,t_m]] ℚ-independent modulo ℂ, trdeg_ℂ ℂ(f,exp f)≥n+rank J(f). Define exp with the scalar constant factor and the formal exponential of the zero-constant part. The general target `axSchanuelMultivariateSeries` includes the constant-field identification; the one-variable zero-constant case with n≥1 gives ≥n+1. (BT, §1.2, Thm. 1.2.5, p. 4.)

Under those hypotheses, trdeg_ℂ ℂ(f)+trdeg_ℂ ℂ(exp f)≥n+rank J(f). (BT, §1.2, Corollary 1.2.6, p. 4.)

If also trdeg_ℂ ℂ(f)=rank J(f), then the exponentials are algebraically independent over ℂ. (BT, §1.2, Corollary 1.2.7, p. 4; BT, §1.2, Corollary 1.2.15, p. 6.)

Use `EisensteinSeries`: `E2`, `E2_slash_action`, `D2_S`; `ModularForm`: `E₄`, `E₆`; `Function.Periodic.qParam`; `AlgebraicIndependent`, `KaehlerDifferential`, `Derivation`; `KaehlerDifferential.D`; `Algebra.trdeg`; `Matrix.rank`; `PowerSeries`: `exp`, `subst`.

### 5.7 Conditional independence of logarithms

Use the abbreviation `DiophantineApproximation.SchanuelConjecture` for §3.8’s proposition; every consequence assumes it explicitly. (BT, §1.2, p. 3; Waldschmidt, periods, §7.1, p. 455.)

Its API includes `SchanuelConjecture.le_trdeg`: Applying the hypothesis to a ℚ-linearly independent tuple; `schanuel_inequality_of_isAlgebraic`: The Schanuel inequality holds unconditionally for algebraic arguments (Lindemann–Weierstrass, Layer 3); `algebraicIndependent_e_pi_of_schanuel`: SchanuelConjecture→e and π algebraically independent; `logarithmsConjecture_of_schanuel`: SchanuelConjecture→LogarithmsAlgebraicIndependenceConjecture.

**Checks.**

- For n=1, z=1 compare the inequality with LinearFormsInLogarithms §6.3 / transcendental_e, converting ℤ to ℚ.
- For the ℚ-dependent z=(1, 2): trdeg ℚ(1, 2, e, e²)=1 < 2; dropping linear independence makes the statement false.
- n=0: the inequality 0≤trdeg is trivial.
- For z=(iπ) the inequality reads trdeg ℚ(iπ, −1)≥1, compare with LinearFormsInLogarithms §6.3 / transcendental_pi after the complex-cast conversion.

*Needs:* §3.2; §3.8.

Define `LogarithmsAlgebraicIndependenceConjecture` to assert algebraic independence over ℚ of every ℚ-independent finite tuple λ with algebraic exp λ. (Waldschmidt, periods, §7.1, p. 455.)

Its API includes `logarithmsConjecture_one`: The case n=1 holds unconditionally (a nonzero logarithm of an algebraic number is transcendental); `LogarithmsAlgebraicIndependenceConjecture.transcendental_div`: Under the conjecture, ℓ₁/ℓ₂ is transcendental for ℚ-independent logarithms; unconditionally this is Gelfond–Schneider (Layer 3); `logarithmsConjecture_of_schanuel`: Schanuel's conjecture implies it.

**Checks.**

- A nonzero ℓ with e^ℓ algebraic is transcendental (Hermite–Lindemann), unconditionally.
- log 2 and log 4 are algebraically dependent, so ℚ-linear independence cannot be dropped.
- The conjecture implies that log 2 and log 3 are algebraically independent.

*Needs:* §3.3.

Under the explicit Schanuel hypothesis, exp(1) and π are algebraically independent over ℚ; use §3.8’s theorem through the namespace abbreviation. (BT, §1.2, p. 3.)

*Needs:* §3.8.

SchanuelConjecture implies LogarithmsAlgebraicIndependenceConjecture by applying §3.8 to algebraic logarithms. (Waldschmidt, periods, §7.1, p. 455.)

*Needs:* §3.8.

Use `Algebra.trdeg`; `IntermediateField.adjoin`; `Complex`: `exp`, `exp_pi_mul_I`; `AlgebraicIndependent`.

### Examples

The E-series for exp z has a_n=1, whereas the same analytic function has G-series coefficients 1/n!, which fail the denominator bound. The scaled system recurrence T=1,M=1 gives P₂=1/2. For the Laplace transform g=1/(x−1), xg−1=g; the initial-value correction is essential. The dependent tuple (1,2) in Schanuel has transcendence degree 1, so distinctness cannot replace ℚ-independence.

### Dependencies

Layers 0 and 3; Mathlib power series, differential modules, algebraic independence and Kähler differentials; §5.4 owns Picard–Vessiot fields, differential Galois groups and their analytic comparisons; Tau Ceti finite type/integral dimension results; AlgebraicCurves, Layer 9 “Kähler differentials, residues, and the comparison”.

## Downstream consumers

Heights, auxiliary polynomials, unit equations and effective logarithmic bounds feed arithmetic geometry, integral-point calculations and computational number theory. The recurrence closed form of §2.4 and its zero-set bounds supply the exponential-polynomial interface for arithmetic recurrence applications. Specialisation and Ax–Schanuel supply arithmetic differential equations and functional-transcendence applications; the conditional independence conclusions always pass their conjecture hypothesis to consumers.

## References

- **E19**: Jan-Hendrik Evertse, [Diophantine Approximation (lecture notes for the Leiden/Mastermath course), chapters 1–8](http://pub.math.leidenuniv.nl/~evertsejh/dio.shtml). 2019 edition, chapter PDFs dio19-1.pdf to dio19-8.pdf.
- **Bugeaud**: Yann Bugeaud, [Exponents of Diophantine approximation](https://arxiv.org/abs/1502.03052). arXiv:1502.03052v1 (2015).
- **Sondow**: Jonathan Sondow, [Irrationality measures, irrationality bases, and a theorem of Jarnik](https://arxiv.org/abs/math/0406300). arXiv:math/0406300 (2004).
- **Smyth**: Chris Smyth, [The Mahler measure of algebraic numbers: a survey](https://arxiv.org/abs/math/0701397). arXiv:math/0701397v2 (2008).
- **Wu**: Xiaorun Wu, [Diophantine geometry, week 08 notes: arithmetic heights](https://www.math.columbia.edu/~xiaorunw/diop/08.pdf). Columbia University Fall 2023 seminar, week 8 (30 October).
- **Yang**: Heesung Yang, [PMATH 940: Heights and arithmetic (notes of C. L. Stewart's course)](https://mathstat.dal.ca/~yanghs/notes.php?name=Heights). Course notes, 25 November 2015.
- **P22**: Lukas Pottmeyer, [Diophantine Approximation (lecture notes)](https://esaga.uni-due.de/f/lukas.pottmeyer/DioApp.pdf). 17 January 2022 version.
- **EF13**: Jan-Hendrik Evertse, Roberto G. Ferretti, [A further improvement of the Quantitative Subspace Theorem](https://arxiv.org/abs/1008.2340v1). arXiv:1008.2340v1.
- **ES02**: Jan-Hendrik Evertse, Hans Peter Schlickewei, [A quantitative version of the Absolute Subspace Theorem](https://pub.math.leidenuniv.nl/~evertsejh/00-abssub.pdf). J. reine angew. Math. 548 (2002), 21–127.
- **ESS02**: Jan-Hendrik Evertse, Hans Peter Schlickewei, Wolfgang M. Schmidt, [Linear equations in variables which lie in a multiplicative group](https://arxiv.org/abs/math/0409604v1). arXiv:math/0409604v1; Annals 155 (2002), 807–836.
- **E96**: Jan-Hendrik Evertse, [An improvement of the quantitative Subspace theorem](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf). Compositio Math. 101 (1996), 225–311.
- **E95**: Jan-Hendrik Evertse, [An explicit version of Faltings' Product Theorem and an improvement of Roth's lemma](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf). Acta Arith. 73 (1995), 215–248.
- **Evertse, survey**: Jan-Hendrik Evertse, [On the Quantitative Subspace Theorem](https://arxiv.org/abs/1008.2268v1). arXiv:1008.2268v1.
- **W00**: Michel Waldschmidt, [Diophantine Approximation on Linear Algebraic Groups. Transcendence Properties of the Exponential Function in Several Variables](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf). Grundlehren der mathematischen Wissenschaften 326, Springer 2000.
- **KW26**: Michail Karatarakis, Freek Wiedijk, [A formalization of the Gelfond-Schneider theorem](https://arxiv.org/abs/2603.24823). arXiv:2603.24823v1, 25 March 2026.
- **Soundararajan–Petrow**: Kannan Soundararajan (notes by Ian Petrow), [Math 249A Fall 2010: Transcendental Number Theory (course notes)](http://math.stanford.edu/~ksound/TransNotes.pdf). notes dated 19 September 2011.
- **Matveev**: E. M. Matveev, [An explicit lower bound for a homogeneous rational linear form in the logarithms of algebraic numbers. II](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng). Published English article, Izvestiya: Mathematics 64 (2000), 1217–1269.
- **Yu 1994**: Kunrui Yu, [Linear forms in p-adic logarithms III](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf). Compositio Mathematica 91 (1994) 241-276 (numdam).
- **Yu 1990**: Kunrui Yu, [Linear forms in p-adic logarithms II](http://archive.numdam.org/article/CM_1990__74_1_15_0.pdf). Compositio Mathematica 74 (1990) 15-113 (numdam).
- **BMS06**: Yann Bugeaud, Maurice Mignotte, Samir Siksek, [Classical and modular approaches to exponential Diophantine equations I. Fibonacci and Lucas perfect powers](https://arxiv.org/abs/math/0403046). Annals of Mathematics 163 (2006) 969-1018.
- **Zhao**: Yuyang Zhao (astrainfinita), [Lindemann–Weierstrass formalization](https://github.com/leanprover-community/mathlib4/pull/28013). Source implementation, commit 5a0057ccc26b13a4e361f503f5f765bf56a8d353.
- **BG96**: Yann Bugeaud and Kálmán Győry, [Bounds for the solutions of unit equations](http://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7416.pdf). Acta Arithmetica 74 (1996), 67-80.
- **BEG13**: Attila Bérczes, Jan-Hendrik Evertse and Kálmán Győry, [Effective results for hyper- and superelliptic equations over number fields](https://arxiv.org/abs/1301.7168). arXiv:1301.7168v1 (30 January 2013).
- **Tzanakis–de Weger**: N. Tzanakis and B. M. M. de Weger, [How to explicitly solve a Thue-Mahler equation](https://www.numdam.org/item/CM_1992__84_3_223_0.pdf). Compositio Mathematica 84 (1992), 223-288.
- **B06**: F. Beukers, [A refined version of the Siegel-Shidlovskii theorem](https://arxiv.org/abs/math/0405549). arXiv:math/0405549v3 (6 August 2004).
- **Singer**: Michael F. Singer, [Introduction to the Galois Theory of Linear Differential Equations](https://singer.math.ncsu.edu/papers/LMSlectures.pdf), §1.3, pp.10–19 (arXiv:0712.4124).
- **B08**: Frits Beukers, [E-functions and G-functions (lecture notes, Arizona Winter School 2008)](https://www.math.arizona.edu/~swc/aws/2008/08BeukersNotesDraft.pdf). draft of 26 February 2008.
- **Fischler–Rivoal**: S. Fischler and T. Rivoal, [On Siegel's problem for E-functions](https://arxiv.org/abs/1910.06817). arXiv:1910.06817v3 (4 June 2020).
- **AF17**: Boris Adamczewski and Colin Faverjon, [Méthode de Mahler : relations linéaires, transcendance et applications aux nombres automatiques](https://arxiv.org/abs/1508.07158). arXiv:1508.07158v2 (28 October 2016).
- **Kirby**: Jonathan Kirby, [The theory of the exponential differential equations of semiabelian varieties](https://arxiv.org/abs/0708.1352). arXiv:0708.1352v3, text dated 9 November 2021.
- **BT**: Benjamin Bakker and Jacob Tsimerman, [Lectures on the Ax–Schanuel conjecture](https://benjamin-bakker.github.io/montreal.pdf). Lecture notes.
- **Waldschmidt, periods**: Michel Waldschmidt, [Transcendence of periods: the state of the art](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/TranscendencePeriods.pdf). Pure and Applied Mathematics Quarterly 2 (2006), no. 2, 435-463.
- **André**: Yves André, [Solution algebras of differential equations and quasi-homogeneous varieties: a new differential Galois correspondence](https://arxiv.org/abs/1107.1179). arXiv:1107.1179v2 (14 July 2012).

- **Roy–Thunder**: D. Roy and J. L. Thunder, [An absolute Siegel's Lemma](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0476), J. reine angew. Math. 476 (1996), 1–26, §§1–6.
- **Schmidt small points**: W. M. Schmidt, [Heights of points on subvarieties of G_m^n](https://doi.org/10.1017/CBO9780511662003.008), Number Theory, London Math. Soc. Lecture Note Ser. 235 (1996), 157–188, Theorem 4.
- **Fonseca**: T. J. Fonseca, [A geometric introduction to transcendence questions on values of modular forms](https://arxiv.org/abs/2011.14401), §§2.2,3.1–3.3.
- **Nesterenko–Philippon**: Y. V. Nesterenko and P. Philippon (eds.), *Introduction to algebraic independence theory*, Lecture Notes in Mathematics 1752 (2001), Chapter 3, §§2–3 and Lemma 3.3.
- **Philippon**: P. Philippon, [Critères pour l'indépendance algébrique](https://www.numdam.org/item/PMIHES_1986__64__5_0/), Publications Mathématiques de l'IHÉS 64 (1986), 5–52, Theorem 1.
